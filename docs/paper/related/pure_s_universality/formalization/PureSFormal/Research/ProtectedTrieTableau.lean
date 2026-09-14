import PureSFormal.Research.ProtectedTrieMachine

/-!
# Literal finite tableaux and their total verifier

The verifier in this module receives three finite objects: a protected source
instance, a literal ordered-occurrence history, and a literal bit payload.  It
parses the payload as complete padded rows and checks the supplied adjacent
rows one at a time.  It does not reduce a pure-`S` term, search for a source
history, or synthesize missing rows.

The main equivalence says that acceptance is exactly equality with the unique
canonical payload when that occurrence history is valid.  Consequences include
soundness, completeness, witness uniqueness, preservation of equal-rule
occurrence multiplicity, and rejection of every child of a terminal history.
-/

namespace PureSFormal.Research.ProtectedTrieTableau

open PureSFormal.Research.ProtectedTrieCertificates
open PureSFormal.Research.ProtectedTrieMachine

/-! ## A self-delimiting literal codec -/

/-- Unary natural code: `n` one bits followed by one zero delimiter. -/
def encodeNat : Nat -> BitWord
  | 0 => [false]
  | n + 1 => true :: encodeNat n

/-- Total prefix parser for the unary natural code. -/
def decodeNat? : BitWord -> Option (Nat × BitWord)
  | [] => none
  | false :: tail => some (0, tail)
  | true :: tail =>
      (decodeNat? tail).map (fun pair => (pair.1 + 1, pair.2))

/-- The unary parser consumes exactly one encoded natural prefix. -/
theorem decodeNat?_encodeNat_append (n : Nat) (tail : BitWord) :
    decodeNat? (encodeNat n ++ tail) = some (n, tail) := by
  induction n with
  | zero => rfl
  | succ n ih =>
      change (decodeNat? (encodeNat n ++ tail)).map
        (fun pair => (pair.1 + 1, pair.2)) = some (n + 1, tail)
      rw [ih]
      rfl

/-- Consume exactly `count` literal bits and return the unused suffix. -/
def takeExact? : Nat -> BitWord -> Option (BitWord × BitWord)
  | 0, bits => some ([], bits)
  | _ + 1, [] => none
  | count + 1, bit :: bits =>
      (takeExact? count bits).map
        (fun pair => (bit :: pair.1, pair.2))

/-- Exact literal consumption is a left inverse to list append. -/
theorem takeExact?_append (front tail : BitWord) :
    takeExact? front.length (front ++ tail) = some (front, tail) := by
  induction front with
  | nil => rfl
  | cons bit front ih =>
      change (takeExact? front.length (front ++ tail)).map
        (fun pair => (bit :: pair.1, pair.2)) =
          some (bit :: front, tail)
      rw [ih]
      rfl

/-- A literal bit field: unary length followed by the bits themselves. -/
def encodeBits (bits : BitWord) : BitWord :=
  encodeNat bits.length ++ bits

/-- Parse one length-delimited literal bit field. -/
def decodeBits? (payload : BitWord) : Option (BitWord × BitWord) := do
  let (length, tail) <- decodeNat? payload
  takeExact? length tail

/-- The bit-field parser consumes exactly one encoded field prefix. -/
theorem decodeBits?_encodeBits_append (bits tail : BitWord) :
    decodeBits? (encodeBits bits ++ tail) = some (bits, tail) := by
  simp only [decodeBits?, encodeBits, List.append_assoc,
    decodeNat?_encodeNat_append, Option.bind_some]
  exact takeExact?_append bits tail

/-- Literal encoding of one complete finite-window row. -/
def encodeRow (row : Row) : BitWord :=
  encodeNat row.state ++ encodeNat row.head ++ encodeBits row.tape

/-- Parse one complete row and return the unused suffix. -/
def decodeRow? (payload : BitWord) : Option (Row × BitWord) :=
  match decodeNat? payload with
  | none => none
  | some (state, rest) =>
      match decodeNat? rest with
      | none => none
      | some (head, rest) =>
          (decodeBits? rest).map fun (tape, rest) =>
            (⟨state, head, tape⟩, rest)

/-- The row parser consumes exactly one literal row prefix. -/
theorem decodeRow?_encodeRow_append (row : Row) (tail : BitWord) :
    decodeRow? (encodeRow row ++ tail) = some (row, tail) := by
  simp [decodeRow?, encodeRow, List.append_assoc,
    decodeNat?_encodeNat_append, decodeBits?_encodeBits_append,
    Option.bind_some]

/-- Concatenate literal row encodings without a second delimiter. -/
def encodeRowData : List Row -> BitWord
  | [] => []
  | row :: rows => encodeRow row ++ encodeRowData rows

/-- Parse an explicit number of complete rows. -/
def decodeRowsN? : Nat -> BitWord -> Option (List Row × BitWord)
  | 0, payload => some ([], payload)
  | count + 1, payload =>
      match decodeRow? payload with
      | none => none
      | some (row, rest) =>
          (decodeRowsN? count rest).map fun (rows, rest) =>
            (row :: rows, rest)

/-- Exact row-count parsing consumes the corresponding literal row data. -/
theorem decodeRowsN?_encodeRowData_append (rows : List Row) (tail : BitWord) :
    decodeRowsN? rows.length (encodeRowData rows ++ tail) =
      some (rows, tail) := by
  induction rows with
  | nil => rfl
  | cons row rows ih =>
      simp only [List.length_cons, encodeRowData, List.append_assoc]
      unfold decodeRowsN?
      rw [decodeRow?_encodeRow_append]
      simp [ih]

/-- Complete literal tableau payload: row count followed by the row data. -/
def encodeTableau (rows : List Row) : BitWord :=
  encodeNat rows.length ++ encodeRowData rows

/-- Total exact parser for a complete tableau payload. -/
def decodeTableau? (payload : BitWord) : Option (List Row) :=
  match decodeNat? payload with
  | none => none
  | some (count, rest) =>
      match decodeRowsN? count rest with
      | none => none
      | some (rows, []) => some rows
      | some (_, _ :: _) => none

/-- Every literal tableau encoding parses back to exactly its supplied rows. -/
@[simp]
theorem decodeTableau?_encodeTableau (rows : List Row) :
    decodeTableau? (encodeTableau rows) = some rows := by
  have hrows := decodeRowsN?_encodeRowData_append rows []
  simp only [List.append_nil] at hrows
  simp [decodeTableau?, encodeTableau, decodeNat?_encodeNat_append, hrows]

/-- Complete tableau encodings are injective. -/
theorem encodeTableau_injective {left right : List Row}
    (heq : encodeTableau left = encodeTableau right) : left = right := by
  have hdecoded := congrArg decodeTableau? heq
  simpa only [decodeTableau?_encodeTableau, Option.some.injEq] using hdecoded

/-! ## Canonical padded rows and traces -/

/--
One fixed complete initial row.  The input is bracketed by physical blanks;
`movePadded` grows this finite window when the head crosses either boundary.
-/
def initialRow (source : Instance) : Row :=
  { state := source.initialState
    head := 1
    tape := false :: source.input ++ [false] }

/-- The exact width of the fixed initial padded row. -/
theorem initialRow_tape_length (source : Instance) :
    (initialRow source).tape.length = source.input.length + 2 := by
  simp [initialRow]

/-- Build the unique row list selected by a literal occurrence history. -/
def buildTrace? (machine : Machine) : Row -> BitWord -> Option (List Row)
  | row, [] => some [row]
  | row, slot :: history => do
      let next <- step? machine row slot
      let rows <- buildTrace? machine next history
      pure (row :: rows)

/-- The canonical padded tableau, when every selected occurrence is enabled. -/
def canonicalTableau? (source : Instance) (history : BitWord) :
    Option (List Row) :=
  buildTrace? source.machine (initialRow source) history

/-- A history is valid exactly when its canonical tableau exists. -/
def ValidHistory (source : Instance) (history : BitWord) : Prop :=
  exists final, run? source.machine (initialRow source) history = some final

/-- A literal finite list of adjacent rows verifies against literal occurrence bits. -/
def checkTrace : Machine -> Row -> BitWord -> List Row -> Bool
  | _, _, [], [] => true
  | _, _, [], _ :: _ => false
  | _, _, _ :: _, [] => false
  | machine, row, slot :: history, next :: rows =>
      step? machine row slot == some next &&
        checkTrace machine next history rows

/-- Check the exact initial row and every supplied adjacent row. -/
def verifyRows (source : Instance) (history : BitWord) : List Row -> Bool
  | [] => false
  | row :: rows =>
      row == initialRow source &&
        checkTrace source.machine row history rows

/-- The public total literal-tableau verifier. -/
def verify (source : Instance) (history payload : BitWord) : Bool :=
  match decodeTableau? payload with
  | none => false
  | some rows =>
      payload == encodeTableau rows && verifyRows source history rows

/-! ## Trace correctness and unique canonical witnesses -/

/-- Every successful trace begins with the supplied initial row. -/
theorem buildTrace?_head_eq
    {machine : Machine} {row head : Row} {history : BitWord} {rows : List Row}
    (hbuild : buildTrace? machine row history = some (head :: rows)) :
    head = row := by
  cases history with
  | nil =>
      simp [buildTrace?] at hbuild
      exact hbuild.1.symm
  | cons slot history =>
      unfold buildTrace? at hbuild
      cases hstep : step? machine row slot with
      | none => simp [hstep] at hbuild
      | some next =>
          simp only [hstep, Option.bind_some] at hbuild
          cases htail : buildTrace? machine next history with
          | none => simp [htail] at hbuild
          | some tail =>
              simp [htail] at hbuild
              exact hbuild.1.symm

/-- A successful trace can never be the empty row list. -/
theorem buildTrace?_ne_nil
    (machine : Machine) (row : Row) (history : BitWord) :
    buildTrace? machine row history ≠ some [] := by
  intro hbuild
  cases history with
  | nil => simp [buildTrace?] at hbuild
  | cons slot history =>
      unfold buildTrace? at hbuild
      cases hstep : step? machine row slot with
      | none => simp [hstep] at hbuild
      | some next =>
          simp only [hstep, Option.bind_some] at hbuild
          cases htail : buildTrace? machine next history <;>
            simp [htail] at hbuild

/-- Checking supplied tail rows is equivalent to building the same full trace. -/
theorem checkTrace_eq_true_iff_buildTrace?
    (machine : Machine) (row : Row) (history : BitWord) (rows : List Row) :
    checkTrace machine row history rows = true <->
      buildTrace? machine row history = some (row :: rows) := by
  induction history generalizing row rows with
  | nil =>
      cases rows with
      | nil => simp [checkTrace, buildTrace?]
      | cons next rows => simp [checkTrace, buildTrace?]
  | cons slot history ih =>
      cases rows with
      | nil =>
          constructor
          · intro hfalse
            simp [checkTrace] at hfalse
          · intro hbuild
            unfold buildTrace? at hbuild
            cases hstep : step? machine row slot with
            | none => simp [hstep] at hbuild
            | some next =>
                simp only [hstep, Option.bind_some] at hbuild
                cases htail : buildTrace? machine next history with
                | none => simp [htail] at hbuild
                | some tail =>
                    simp [htail] at hbuild
                    subst tail
                    exact (buildTrace?_ne_nil machine next history htail).elim
      | cons next rows =>
          constructor
          · intro hchecked
            simp only [checkTrace, Bool.and_eq_true, beq_iff_eq] at hchecked
            obtain ⟨hstep, htail⟩ := hchecked
            unfold buildTrace?
            rw [hstep]
            simp [(ih next rows).mp htail]
          · intro hbuild
            unfold buildTrace? at hbuild
            cases hstep : step? machine row slot with
            | none => simp [hstep] at hbuild
            | some actual =>
                simp only [hstep, Option.bind_some] at hbuild
                cases htail : buildTrace? machine actual history with
                | none => simp [htail] at hbuild
                | some tail =>
                    simp [htail] at hbuild
                    subst tail
                    have hactual : next = actual :=
                      buildTrace?_head_eq htail
                    subst actual
                    simp only [checkTrace, hstep, beq_self_eq_true,
                      Bool.true_and]
                    exact (ih next rows).mpr htail

/-- Row verification is equivalent to equality with the canonical tableau. -/
theorem verifyRows_eq_true_iff
    (source : Instance) (history : BitWord) (rows : List Row) :
    verifyRows source history rows = true <->
      canonicalTableau? source history = some rows := by
  cases rows with
  | nil =>
      constructor
      · intro hfalse
        simp [verifyRows] at hfalse
      · intro hcanonical
        exact (buildTrace?_ne_nil source.machine
          (initialRow source) history hcanonical).elim
  | cons row rows =>
      simp only [verifyRows, Bool.and_eq_true, beq_iff_eq]
      constructor
      · rintro ⟨hrow, htrace⟩
        cases hrow
        exact (checkTrace_eq_true_iff_buildTrace? _ _ _ _).mp htrace
      · intro hcanonical
        have hrow : row = initialRow source :=
          buildTrace?_head_eq hcanonical
        subst row
        have htrace : buildTrace? source.machine (initialRow source) history =
            some (initialRow source :: rows) := hcanonical
        have hchecked :=
          (checkTrace_eq_true_iff_buildTrace? source.machine
            (initialRow source) history rows).mpr htrace
        exact ⟨rfl, hchecked⟩

/-- Acceptance means that the payload is exactly the canonical encoded tableau. -/
theorem verify_eq_true_iff_exists_rows
    (source : Instance) (history payload : BitWord) :
    verify source history payload = true <->
      exists rows, canonicalTableau? source history = some rows /\
        payload = encodeTableau rows := by
  constructor
  · intro haccept
    unfold verify at haccept
    cases hdecode : decodeTableau? payload with
    | none => simp [hdecode] at haccept
    | some rows =>
        simp only [hdecode, Bool.and_eq_true, beq_iff_eq] at haccept
        exact ⟨rows,
          (verifyRows_eq_true_iff source history rows).mp haccept.2,
          haccept.1⟩
  · rintro ⟨rows, hcanonical, rfl⟩
    simp only [verify, decodeTableau?_encodeTableau, beq_self_eq_true,
      Bool.true_and]
    exact (verifyRows_eq_true_iff source history rows).mpr hcanonical

/-! ## Source validity, prefix closure, and canonicality -/

/-- Trace construction succeeds exactly when source execution succeeds. -/
theorem buildTrace?_exists_iff_run?_exists
    (machine : Machine) (row : Row) (history : BitWord) :
    (exists rows, buildTrace? machine row history = some rows) <->
      exists final, run? machine row history = some final := by
  induction history generalizing row with
  | nil =>
      constructor
      · intro h
        exact ⟨row, rfl⟩
      · intro h
        exact ⟨[row], rfl⟩
  | cons slot history ih =>
      cases hstep : step? machine row slot with
      | none =>
          constructor
          · rintro ⟨rows, hrows⟩
            unfold buildTrace? at hrows
            rw [hstep] at hrows
            cases hrows
          · rintro ⟨final, hfinal⟩
            unfold run? at hfinal
            rw [hstep] at hfinal
            cases hfinal
      | some next =>
          constructor
          · rintro ⟨rows, hrows⟩
            unfold buildTrace? at hrows
            simp only [hstep, Option.bind_some] at hrows
            cases htail : buildTrace? machine next history with
            | none => simp [htail] at hrows
            | some tail =>
                have hrun := (ih next).mp ⟨tail, htail⟩
                obtain ⟨final, hfinal⟩ := hrun
                refine ⟨final, ?_⟩
                unfold run?
                rw [hstep]
                exact hfinal
          · rintro ⟨final, hfinal⟩
            have htailRun : run? machine next history = some final := by
              unfold run? at hfinal
              rw [hstep] at hfinal
              exact hfinal
            obtain ⟨tail, htail⟩ := (ih next).mpr ⟨final, htailRun⟩
            refine ⟨row :: tail, ?_⟩
            unfold buildTrace?
            rw [hstep]
            simp [htail]

/-- Canonical-tableau existence is exactly the source validity predicate. -/
theorem canonicalTableau?_exists_iff_valid
    (source : Instance) (history : BitWord) :
    (exists rows, canonicalTableau? source history = some rows) <->
      ValidHistory source history :=
  buildTrace?_exists_iff_run?_exists source.machine (initialRow source) history

/-- Validity is closed under deleting any literal suffix. -/
theorem valid_append_left {source : Instance} {history suffix : BitWord}
    (hvalid : ValidHistory source (history ++ suffix)) :
    ValidHistory source history := by
  obtain ⟨final, hfinal⟩ := hvalid
  rw [run?_append] at hfinal
  cases hmiddle : run? source.machine (initialRow source) history with
  | none => simp [hmiddle] at hfinal
  | some middle => exact ⟨middle, hmiddle⟩

/-- A constructive word prefix is an explicit append decomposition. -/
theorem wordPrefix_exists_suffix {small large : BitWord}
    (hprefix : WordPrefix small large) :
    exists suffix, large = small ++ suffix := by
  induction hprefix with
  | nil large => exact ⟨large, rfl⟩
  | cons bit htail ih =>
      obtain ⟨suffix, hsuffix⟩ := ih
      exact ⟨suffix, congrArg (List.cons bit) hsuffix⟩

/-- `ValidHistory` is prefix-closed in the certificate address sense. -/
theorem valid_of_wordPrefix {source : Instance} {small large : BitWord}
    (hprefix : WordPrefix small large) (hvalid : ValidHistory source large) :
    ValidHistory source small := by
  obtain ⟨suffix, rfl⟩ := wordPrefix_exists_suffix hprefix
  exact valid_append_left hvalid

/-- Verifier acceptance implies source-history validity. -/
theorem verify_sound {source : Instance} {history payload : BitWord}
    (hverify : verify source history payload = true) :
    ValidHistory source history := by
  obtain ⟨rows, hcanonical, hpayload⟩ :=
    (verify_eq_true_iff_exists_rows source history payload).mp hverify
  exact (canonicalTableau?_exists_iff_valid source history).mp
    ⟨rows, hcanonical⟩

/-- Every valid occurrence history has a literal accepted payload. -/
theorem verify_complete {source : Instance} {history : BitWord}
    (hvalid : ValidHistory source history) :
    exists payload, verify source history payload = true := by
  obtain ⟨rows, hcanonical⟩ :=
    (canonicalTableau?_exists_iff_valid source history).mpr hvalid
  exact ⟨encodeTableau rows,
    (verify_eq_true_iff_exists_rows source history _).mpr
      ⟨rows, hcanonical, rfl⟩⟩

/-- A valid history has exactly one accepted literal tableau payload. -/
theorem verify_witness_unique {source : Instance} {history left right : BitWord}
    (hleft : verify source history left = true)
    (hright : verify source history right = true) : left = right := by
  obtain ⟨leftRows, hleftRows, rfl⟩ :=
    (verify_eq_true_iff_exists_rows source history left).mp hleft
  obtain ⟨rightRows, hrightRows, hrightPayload⟩ :=
    (verify_eq_true_iff_exists_rows source history right).mp hright
  have hrows : leftRows = rightRows := by
    rw [hleftRows] at hrightRows
    exact Option.some.inj hrightRows
  subst rightRows
  exact hrightPayload.symm

/-! ## Ordered occurrence multiplicity -/

/-- Different one-bit histories have different complete certificate addresses. -/
theorem one_bit_candidate_addresses_ne (payload : BitWord) :
    a [false] payload ≠ a [true] payload := by
  intro heq
  have hpairs : ([false], payload) = ([true], payload) :=
    a_injective heq
  have hhist := congrArg Prod.fst hpairs
  cases hhist

/--
Equal rule texts in ordered slots `0` and `1` yield the same supplied row
payload but retain distinct certificate addresses through their history bits.
-/
theorem equal_rule_slots_preserve_multiplicity
    {source : Instance} {symbol : Bool} {rule : Rule} {next : Row}
    (hscan : scanned? (initialRow source) = some symbol)
    (hzero : ruleAt? source.machine source.initialState symbol false = some rule)
    (hone : ruleAt? source.machine source.initialState symbol true = some rule)
    (happly : applyRule? (initialRow source) rule = some next) :
    exists payload,
      verify source [false] payload = true /\
      verify source [true] payload = true /\
      a [false] payload ≠ a [true] payload := by
  let payload := encodeTableau [initialRow source, next]
  have hstepZero : step? source.machine (initialRow source) false = some next := by
    unfold step?
    rw [hscan]
    change (ruleAt? source.machine source.initialState symbol false).bind
      (fun selected => applyRule? (initialRow source) selected) = some next
    rw [hzero]
    exact happly
  have hstepOne : step? source.machine (initialRow source) true = some next := by
    unfold step?
    rw [hscan]
    change (ruleAt? source.machine source.initialState symbol true).bind
      (fun selected => applyRule? (initialRow source) selected) = some next
    rw [hone]
    exact happly
  have hcanonicalZero : canonicalTableau? source [false] =
      some [initialRow source, next] := by
    simp [canonicalTableau?, buildTrace?, hstepZero]
  have hcanonicalOne : canonicalTableau? source [true] =
      some [initialRow source, next] := by
    simp [canonicalTableau?, buildTrace?, hstepOne]
  refine ⟨payload, ?_, ?_, one_bit_candidate_addresses_ne payload⟩
  · exact (verify_eq_true_iff_exists_rows source [false] payload).mpr
      ⟨_, hcanonicalZero, rfl⟩
  · exact (verify_eq_true_iff_exists_rows source [true] payload).mpr
      ⟨_, hcanonicalOne, rfl⟩

/-! ## Terminal histories -/

/-- A valid history whose final source row has no enabled occurrence. -/
def TerminalHistory (source : Instance) (history : BitWord) : Prop :=
  exists final,
    run? source.machine (initialRow source) history = some final /\
    Terminal source.machine final

/-- A terminal history has no valid ordered child. -/
theorem terminalHistory_not_valid_extension
    {source : Instance} {history : BitWord}
    (hterminal : TerminalHistory source history) (slot : Bool) :
    ¬ ValidHistory source (history ++ [slot]) := by
  obtain ⟨final, hrun, hfinal⟩ := hterminal
  intro hvalid
  obtain ⟨childFinal, hchild⟩ := hvalid
  have hnone := terminal_run?_append_singleton_none hrun hfinal slot
  rw [hnone] at hchild
  cases hchild

/-- No literal payload can forge a child below a terminal history. -/
theorem terminalHistory_rejects_extension
    {source : Instance} {history payload : BitWord}
    (hterminal : TerminalHistory source history) (slot : Bool) :
    verify source (history ++ [slot]) payload = false := by
  cases hverify : verify source (history ++ [slot]) payload with
  | false => rfl
  | true =>
      exact (terminalHistory_not_valid_extension hterminal slot
        (verify_sound hverify)).elim

end PureSFormal.Research.ProtectedTrieTableau
