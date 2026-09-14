import PureSFormal.PureS.CarrierDecoder
import PureSFormal.PureS.Dovetail

/-!
# Total bare-term checkpoint decoding

This module implements the syntactic part of the decoder described in
Sections 4.2 and 4.3. Its only run-time input is a bare pure-`S` term. The CTS program
and its compiled dispatcher tree are static parameters.

At time zero the decoder requires the exact generator envelope and decodes
the literal input word.  At positive time it follows completed Local shells
through their literal `RL` continuation occurrences, requires an arity-four
terminal `(C_k C_k) E` with `k >= 2`, derives the horizon from that terminal,
checks the selected phase, and decodes the last action accumulator with a
term-only public-carrier decoder.  Fresh/marked halt fields are checked against
nonempty/empty output; completed shells from earlier stages may remain outside
the final job, so their count is not equated with the horizon.

Audit arguments, route histories, continuation audits, and dormant seed
payloads are bound as whole subtrees.  No two such fields are compared and no
parser descends into them.  In particular, the positive decoder deliberately
does not assert scheduler reachability or checkpoint-chain provenance.
-/

namespace PureSFormal.PureS

namespace CheckpointDecoder

/-! ## Unary carrier and exact-word parsers -/

/-- Decode exactly the closed unary carrier numeral syntax `C n`. -/
def parseCarrier? : Term → Option Nat
  | .app (.app .s (.app .s .s)) (.app .s .s) => some 0
  | .app (.app .s .s) child => (parseCarrier? child).map Nat.succ
  | _ => none
termination_by structural term => term

@[simp]
theorem parseCarrier?_C (n : Nat) : parseCarrier? (C n) = some n := by
  induction n with
  | zero => rfl
  | succ n => simp [C, b, parseCarrier?, *]

/-- Successful numeral parsing reconstructs the exact closed carrier. -/
theorem parseCarrier?_sound
    {term : Term} {n : Nat} (h : parseCarrier? term = some n) :
    term = C n := by
  fun_induction parseCarrier? term generalizing n with
  | case1 =>
      have hn : 0 = n := Option.some.inj h
      subst n
      rfl
  | case2 child ih =>
      change (parseCarrier? child).map Nat.succ = some n at h
      cases hchild : parseCarrier? child with
      | none => simp [hchild] at h
      | some childIndex =>
          simp [hchild] at h
          subst n
          rw [ih hchild]
          rfl
  | case3 term hzero hsucc =>
      simp [parseCarrier?, hzero, hsucc] at h

theorem parseCarrier?_eq_some_iff (term : Term) (n : Nat) :
    parseCarrier? term = some n ↔ term = C n := by
  constructor
  · exact parseCarrier?_sound
  · intro h
    subst term
    exact parseCarrier?_C n

/-- Decode a literal word, excluding transparent tombstones. -/
def parseWord? : Term → Option (List Bool)
  | .s => some []
  | .app (.app (.app .s .s) tag) tail =>
      if tag = valueTag false then
        (parseWord? tail).map (fun bits => bits ++ [false])
      else if tag = valueTag true then
        (parseWord? tail).map (fun bits => bits ++ [true])
      else
        none
  | _ => none
termination_by structural term => term

@[simp]
theorem parseWord?_live (bit : Bool) (tail : Term) :
    parseWord? (.app (live bit) tail) =
      (parseWord? tail).map (fun bits => bits ++ [bit]) := by
  cases bit <;> rfl

/-- Direct fold computation for one final live cell, without list extensionality. -/
theorem foldlLive_append_singleton
    (bits : List Bool) (start : Term) (bit : Bool) :
    (bits ++ [bit]).foldl (fun tail found => .app (live found) tail) start =
      .app (live bit)
        (bits.foldl (fun tail found => .app (live found) tail) start) := by
  induction bits generalizing start with
  | nil => rfl
  | cons first rest ih =>
      exact ih (.app (live first) start)

/-- Appending a literal word bit is one definitional fold step at the rear. -/
theorem word_append_singleton_direct (bits : List Bool) (bit : Bool) :
    word (bits ++ [bit]) = .app (live bit) (word bits) := by
  exact foldlLive_append_singleton bits omega bit

theorem parseWord?_sound
    {term : Term} {bits : List Bool} (h : parseWord? term = some bits) :
    term = word bits := by
  fun_induction parseWord? term generalizing bits with
  | case1 => cases h; rfl
  | case2 tail ih =>
      generalize htail : parseWord? tail = parsed at h
      cases parsed with
      | none => simp [parseWord?, htail] at h
      | some inner =>
          simp [parseWord?, htail] at h
          subst bits
          rw [ih htail, word_append_singleton_direct]
          rfl
  | case3 tail htag ih =>
      generalize htail : parseWord? tail = parsed at h
      cases parsed with
      | none => simp [parseWord?, htail] at h
      | some inner =>
          simp [parseWord?, htail] at h
          subst bits
          rw [ih htail, word_append_singleton_direct]
          rfl
  | case4 tag tail hfalse htrue =>
      simp [parseWord?, hfalse, htrue] at h
  | case5 term hs hlive => simp [parseWord?, hs, hlive] at h

theorem parseWord?_appendLive
    {term : Term} {bits : List Bool} (bit : Bool)
    (h : parseWord? term = some bits) :
    parseWord? (.app (live bit) term) = some (bits ++ [bit]) := by
  simp [h]

theorem parseWord?_foldlLive
    (suffix : List Bool) {start : Term} {decoded : List Bool}
    (h : parseWord? start = some decoded) :
    parseWord?
        (suffix.foldl (fun tail bit => .app (live bit) tail) start) =
      some (decoded ++ suffix) := by
  induction suffix generalizing start decoded with
  | nil => simpa using h
  | cons bit suffix ih =>
      have first := parseWord?_appendLive bit h
      have rest := ih first
      simpa [List.append_assoc] using rest

@[simp]
theorem parseWord?_word (bits : List Bool) :
    parseWord? (word bits) = some bits := by
  simpa [word] using
    parseWord?_foldlLive bits (start := omega) (decoded := []) rfl

theorem parseWord?_eq_some_iff (term : Term) (bits : List Bool) :
    parseWord? term = some bits ↔ term = word bits := by
  constructor
  · exact parseWord?_sound
  · intro h
    subst term
    exact parseWord?_word bits

/-! ## Environment views with an uninspected seed payload -/

/-- The public environment wrapper with its seed payload left unrestricted. -/
def openEnvironment (actions seedPayload : Term) : Term :=
  .app .s
    (.app (.app .s (actCode actions)) (.app .s seedPayload))

@[simp]
theorem openEnvironment_word (actions : Term) (bits : List Bool) :
    openEnvironment actions (word bits) = environmentCode actions bits :=
  rfl

/-- Check only the fixed environment/action wrapper and return its payload. -/
def parseEnvironment? (actions : Term) : Term → Option Term
  | .app .s (.app (.app .s foundAct) (.app .s seedPayload)) =>
      if foundAct = actCode actions then some seedPayload else none
  | _ => none

@[simp]
theorem parseEnvironment?_open (actions seedPayload : Term) :
    parseEnvironment? actions (openEnvironment actions seedPayload) =
      some seedPayload := by
  simp [parseEnvironment?, openEnvironment]

theorem parseEnvironment?_sound
    {actions environment seedPayload : Term}
    (h : parseEnvironment? actions environment = some seedPayload) :
    environment = openEnvironment actions seedPayload := by
  cases environment with
  | s => simp [parseEnvironment?] at h
  | app fn arg =>
      cases fn with
      | app fnLeft fnRight => simp [parseEnvironment?] at h
      | s =>
          cases arg with
          | s => simp [parseEnvironment?] at h
          | app dispatcher seed =>
              cases dispatcher with
              | s => simp [parseEnvironment?] at h
              | app dispatcherHead foundAct =>
                  cases dispatcherHead with
                  | app _ _ => simp [parseEnvironment?] at h
                  | s =>
                      cases seed with
                      | s => simp [parseEnvironment?] at h
                      | app seedHead foundPayload =>
                          cases seedHead with
                          | app _ _ => simp [parseEnvironment?] at h
                          | s =>
                              simp only [parseEnvironment?] at h
                              split at h
                              next hact =>
                                have hpayload := Option.some.inj h
                                subst foundAct
                                subst foundPayload
                                rfl
                              next => contradiction

/-! ## Exact time-zero recognition -/

/-- Decode the exact generator envelope for fixed compiled action code. -/
def parseGenerator? (actions : Term) (term : Term) : Option (List Bool) :=
  match term with
  | .app (.app left right) environment =>
      match parseCarrier? left, parseCarrier? right with
      | some 0, some 0 =>
          match parseEnvironment? actions environment with
          | some seedPayload => parseWord? seedPayload
          | none => none
      | _, _ => none
  | _ => none

@[simp]
theorem parseGenerator?_generator (actions : Term) (bits : List Bool) :
    parseGenerator? actions (generator actions bits) = some bits := by
  change
    (match parseEnvironment? actions (environmentCode actions bits) with
      | some seedPayload => parseWord? seedPayload
      | none => none) = some bits
  have henv : parseEnvironment? actions (environmentCode actions bits) =
      some (word bits) := by
    simp [parseEnvironment?, environmentCode, dispatcherCode, seedCode]
  rw [henv]
  exact parseWord?_word bits

/-- Time-zero success reconstructs exactly the manuscript generator. -/
theorem parseGenerator?_sound
    {actions term : Term} {bits : List Bool}
    (h : parseGenerator? actions term = some bits) :
    term = generator actions bits := by
  cases term with
  | s => simp [parseGenerator?] at h
  | app fn environment =>
      cases fn with
      | s => simp [parseGenerator?] at h
      | app left right =>
          change
            (match parseCarrier? left, parseCarrier? right with
              | some 0, some 0 =>
                  match parseEnvironment? actions environment with
                  | some seedPayload => parseWord? seedPayload
                  | none => none
              | _, _ => none) = some bits at h
          generalize hleft : parseCarrier? left = leftResult at h
          generalize hright : parseCarrier? right = rightResult at h
          cases leftResult with
          | none => simp at h
          | some leftIndex =>
              cases leftIndex with
              | succ leftIndex => simp at h
              | zero =>
                  cases rightResult with
                  | none => simp at h
                  | some rightIndex =>
                      cases rightIndex with
                      | succ rightIndex => simp at h
                      | zero =>
                          generalize henv :
                            parseEnvironment? actions environment = envResult
                              at h
                          cases envResult with
                          | none => simp at h
                          | some seedPayload =>
                              simp only at h
                              rw [parseCarrier?_sound hleft,
                                parseCarrier?_sound hright,
                                parseEnvironment?_sound henv,
                                parseWord?_sound h]
                              rfl

/-! ## Positive terminal clock exits -/

/-- Parsed positive terminal data.  `horizon + 1` is the carrier index. -/
structure TerminalView where
  horizon : Nat
  seedPayload : Term
  deriving BEq, DecidableEq, Repr

/-- Declarative positive terminal envelope, with dormant seed unrestricted. -/
def TerminalShape (actions : Term) (view : TerminalView) (term : Term) : Prop :=
  term = Dovetail.clockExit view.horizon 0
    (openEnvironment actions view.seedPayload) ∧ 0 < view.horizon

/-- Recognize `(C_k C_k) E`, require `k >= 2`, and return `k - 1`. -/
def parseTerminal? (actions : Term) (term : Term) : Option TerminalView :=
  match term with
  | .app (.app left right) environment =>
      match parseCarrier? left, parseCarrier? right,
          parseEnvironment? actions environment with
      | some leftIndex, some rightIndex, some seedPayload =>
          if _heq : leftIndex = rightIndex then
            if _hpositive : 2 ≤ leftIndex then
              some ⟨leftIndex - 1, seedPayload⟩
            else
              none
          else
            none
      | _, _, _ => none
  | _ => none

theorem parseTerminal?_sound
    {actions term : Term} {view : TerminalView}
    (h : parseTerminal? actions term = some view) :
    TerminalShape actions view term := by
  cases term with
  | s => simp [parseTerminal?] at h
  | app fn environment =>
      cases fn with
      | s => simp [parseTerminal?] at h
      | app left right =>
          change
            (match parseCarrier? left, parseCarrier? right,
                parseEnvironment? actions environment with
              | some leftIndex, some rightIndex, some seedPayload =>
                  if heq : leftIndex = rightIndex then
                    if hpositive : 2 ≤ leftIndex then
                      some ⟨leftIndex - 1, seedPayload⟩
                    else none
                  else none
              | _, _, _ => none) = some view at h
          generalize hleft : parseCarrier? left = leftResult at h
          generalize hright : parseCarrier? right = rightResult at h
          generalize henv : parseEnvironment? actions environment = envResult at h
          cases leftResult with
          | none => simp at h
          | some leftIndex =>
              cases rightResult with
              | none => simp at h
              | some rightIndex =>
                  cases envResult with
                  | none => simp at h
                  | some seedPayload =>
                      simp only at h
                      split at h
                      next heq =>
                        split at h
                        next hpositive =>
                          have hview :
                              TerminalView.mk (leftIndex - 1) seedPayload =
                                view := Option.some.inj h
                          subst view
                          subst rightIndex
                          rw [parseCarrier?_sound hleft,
                            parseCarrier?_sound hright,
                            parseEnvironment?_sound henv]
                          constructor
                          · simp only [Dovetail.clockExit,
                              clockWrappers_zero, clockBase]
                            have hone : 1 ≤ leftIndex :=
                              Nat.le_trans (by decide) hpositive
                            have hs : leftIndex - 1 + 1 = leftIndex :=
                              Nat.sub_add_cancel hone
                            rw [hs]
                          · exact Nat.sub_pos_of_lt
                              (Nat.lt_of_succ_le hpositive)
                        next => contradiction
                      next => contradiction

@[simp]
theorem parseTerminal?_clockExit
    (actions seedPayload : Term) (n : Nat) :
    parseTerminal? actions
        (Dovetail.clockExit (n + 1) 0
          (openEnvironment actions seedPayload)) =
      some ⟨n + 1, seedPayload⟩ := by
  simp [parseTerminal?, Dovetail.clockExit, clockBase, parseCarrier?_C,
    parseEnvironment?_open]

/-! ## Term-only completed-Local views -/

/-- The only two public halt-field states accepted at a completed Local. -/
inductive HaltStatus where
  | fresh
  | marked
  deriving BEq, DecidableEq, Repr

/-- Status-indexed independent-audit halt-field grammar. -/
inductive HaltShape : HaltStatus → Term → Prop where
  | fresh (audit : Term) : HaltShape .fresh (freshHField audit)
  | marked (leftAudit rightAudit : Term) :
      HaltShape .marked (Carrier.markedHField leftAudit rightAudit)

/-- A checked halt field carries evidence but no audit payload in its result. -/
structure CheckedHalt (field : Term) where
  status : HaltStatus
  shape : HaltShape status field

/-- Check the fixed fresh/marked prefix without comparing its audit children. -/
def checkHalt? (field : Term) : Option (CheckedHalt field) :=
  match field with
  | .s => none
  | .app fn audit =>
      if hfn : fn = haltCode then
        some ⟨.fresh, by
          subst fn
          exact .fresh audit⟩
      else
        match fn, audit with
        | .app .s leftAudit, .app tag rightAudit =>
            if htag : tag = haltTag then
              some ⟨.marked, by
                subst tag
                exact .marked leftAudit rightAudit⟩
            else
              none
        | _, _ => none

theorem checkHalt?_sound
    {field : Term} {checked : CheckedHalt field}
    (_h : checkHalt? field = some checked) :
    HaltShape checked.status field := by
  exact checked.shape

@[simp]
theorem checkHalt?_fresh (audit : Term) :
    (checkHalt? (freshHField audit)).map CheckedHalt.status =
      some .fresh := by
  simp [checkHalt?, freshHField]

@[simp]
theorem checkHalt?_marked (leftAudit rightAudit : Term) :
    (checkHalt? (Carrier.markedHField leftAudit rightAudit)).map
        CheckedHalt.status = some .marked := by
  simp [checkHalt?, Carrier.markedHField, haltCode, b]

/-- The shell layout with its dormant seed payload left unrestricted. -/
def openShell (haltField dispatcher seedPayload seedAudit continuation
    continuationAudit : Term) : Term :=
  .app
    (.app
      (.app haltField dispatcher)
      (.app (.app .s seedPayload) seedAudit))
    (.app continuation continuationAudit)

@[simp]
theorem openShell_word
    (bits : List Bool) (haltField dispatcher seedAudit continuation
      continuationAudit : Term) :
    openShell haltField dispatcher (word bits) seedAudit continuation
        continuationAudit =
      Carrier.shell bits haltField dispatcher seedAudit continuation
        continuationAudit :=
  rfl

/-- All public information recovered from one completed Local shell. -/
structure LocalView (program : CTS.Program) where
  status : HaltStatus
  route : Dispatcher.Route
  label : ActionLabel program
  accumulator : Term
  seedPayload : Term
  continuation : Term
  deriving BEq, DecidableEq, Repr

/-- Declarative completed-Local syntax with all audit fields independent. -/
inductive LocalShape (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (view : LocalView program) (term : Term) : Prop where
  | intro
      (haltField dispatcher seedAudit continuationAudit : Term)
      (halt : HaltShape view.status haltField)
      (dispatch : DispatchParser.DispatchShape program tree view.route
        view.label view.accumulator dispatcher)
      (source_eq : term = openShell haltField dispatcher view.seedPayload
        seedAudit view.continuation continuationAudit) :
      LocalShape program tree view term

/-- Internal result carrying the reconstruction theorem used by soundness. -/
structure CertifiedLocal (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (term : Term) where
  view : LocalView program
  shape : LocalShape program tree view term

/--
Parse one completed Local.  The dispatcher is checked by `DispatchParser`;
the seed payload and the two Local audits are never traversed.
-/
def parseLocalCertified? (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (term : Term) :
    Option (CertifiedLocal program tree term) :=
  match term with
  | .app
      (.app
        (.app haltField dispatcher)
        (.app (.app .s seedPayload) seedAudit))
      (.app continuation continuationAudit) =>
      match checkHalt? haltField with
      | none => none
      | some haltCheck =>
          match hdispatch : DispatchParser.parse program tree dispatcher with
          | none => none
          | some parsed =>
              some ⟨
                ⟨haltCheck.status, parsed.route, parsed.label,
                  parsed.accumulator, seedPayload, continuation⟩,
                ⟨haltField, dispatcher, seedAudit, continuationAudit,
                  haltCheck.shape, DispatchParser.parse_sound hdispatch,
                  rfl⟩⟩
  | _ => none

/-- Public proof-free Local parser. -/
def parseLocal? (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : Option (LocalView program) :=
  match term with
  | .app
      (.app
        (.app haltField dispatcher)
        (.app (.app .s seedPayload) _seedAudit))
      (.app continuation _continuationAudit) =>
      match checkHalt? haltField with
      | none => none
      | some haltCheck =>
          match DispatchParser.parse program tree dispatcher with
          | none => none
          | some parsed =>
              some ⟨haltCheck.status, parsed.route, parsed.label,
                parsed.accumulator, seedPayload, continuation⟩
  | _ => none

/-- Every successful Local parse has the independent-hole public shape. -/
theorem parseLocal?_sound
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : LocalView program}
    (h : parseLocal? program tree term = some view) :
    LocalShape program tree view term := by
  unfold parseLocal? at h
  split at h <;> try contradiction
  next source haltField dispatcher seedPayload seedAudit continuation
      continuationAudit =>
    split at h <;> try contradiction
    next haltCheck hhalt =>
      split at h <;> try contradiction
      next parsed hdispatch =>
        have hview :
            LocalView.mk haltCheck.status parsed.route parsed.label
              parsed.accumulator seedPayload continuation = view :=
          Option.some.inj h
        subst view
        exact ⟨haltField, dispatcher, seedAudit, continuationAudit,
          haltCheck.shape, DispatchParser.parse_sound hdispatch, rfl⟩

/-- A parsed accumulator is a strict occurrence descendant of its Local. -/
theorem parseLocal?_accumulator_size_lt
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : LocalView program}
    (h : parseLocal? program tree term = some view) :
    view.accumulator.size < term.size := by
  rcases parseLocal?_sound h with
    ⟨haltField, dispatcher, seedAudit, continuationAudit, haltShape,
      dispatchShape, source_eq⟩
  rw [source_eq]
  exact Nat.lt_trans
    (CarrierDecoder.dispatchShape_accumulator_size_lt dispatchShape)
    (Nat.lt_trans
      (CarrierDecoder.size_app_right_lt haltField dispatcher)
      (Nat.lt_trans
        (CarrierDecoder.size_app_left_lt
          (.app haltField dispatcher)
          (.app (.app .s view.seedPayload) seedAudit))
        (CarrierDecoder.size_app_left_lt
          (.app (.app haltField dispatcher)
            (.app (.app .s view.seedPayload) seedAudit))
          (.app view.continuation continuationAudit))))

/-- The extracted `RL` continuation is a strict occurrence descendant. -/
theorem parseLocal?_continuation_size_lt
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : LocalView program}
    (h : parseLocal? program tree term = some view) :
    view.continuation.size < term.size := by
  rcases parseLocal?_sound h with
    ⟨haltField, dispatcher, seedAudit, continuationAudit, haltShape,
      dispatchShape, source_eq⟩
  rw [source_eq]
  exact Nat.lt_trans
    (CarrierDecoder.size_app_left_lt view.continuation
      continuationAudit)
    (CarrierDecoder.size_app_right_lt
      (.app
        (.app haltField dispatcher)
        (.app (.app .s view.seedPayload) seedAudit))
      (.app view.continuation continuationAudit))

/-! ## A term-only mutation-closed Base boundary -/

/--
The public Base shape needed by a bare-term decoder.  The active queue and
the dormant seed payload are independent; `beta` is left uninspected.
-/
def openBase (actions continuation queue seedPayload beta : Term) : Term :=
  .app
    (.app continuation
      (.app
        (.app
          (openEnvironment actions queue)
          (.app b (openEnvironment actions seedPayload)))
        continuation))
    beta

@[simp]
theorem openBase_word
    (actions : Term) (bits : List Bool) (continuation queue beta : Term) :
    openBase actions continuation queue (word bits) beta =
      MutableBase.base actions bits continuation queue beta :=
  rfl

/-- The fields extracted at a term-only Base boundary. -/
structure BaseView where
  queue : Term
  continuation : Term
  seedPayload : Term
  beta : Term
  deriving BEq, DecidableEq, Repr

/-- Check the open Base boundary without entering queue, seed, or beta. -/
def parseBase? (actions : Term) : Term → Option BaseView
  | .app
      (.app outerContinuation
        (.app
          (.app activeEnvironment (.app foundB dormantEnvironment))
          innerContinuation))
      beta =>
      if _hcontinuation : outerContinuation = innerContinuation then
        if _hb : foundB = b then
          match parseEnvironment? actions activeEnvironment,
              parseEnvironment? actions dormantEnvironment with
          | some queue, some seedPayload =>
              some ⟨queue, outerContinuation, seedPayload, beta⟩
          | _, _ => none
        else
          none
      else
        none
  | _ => none

theorem parseBase?_sound
    {actions term : Term} {view : BaseView}
    (h : parseBase? actions term = some view) :
    term = openBase actions view.continuation view.queue view.seedPayload
      view.beta := by
  cases term with
  | s => simp [parseBase?] at h
  | app fn beta =>
      cases fn with
      | s => simp [parseBase?] at h
      | app outerContinuation alpha =>
          cases alpha with
          | s => simp [parseBase?] at h
          | app alphaFn innerContinuation =>
              cases alphaFn with
              | s => simp [parseBase?] at h
              | app activeEnvironment dormantCall =>
                  cases dormantCall with
                  | s => simp [parseBase?] at h
                  | app foundB dormantEnvironment =>
                      simp only [parseBase?] at h
                      split at h
                      next hcontinuation =>
                        split at h
                        next hb =>
                          generalize hactive :
                            parseEnvironment? actions activeEnvironment =
                              activeResult at h
                          generalize hdormant :
                            parseEnvironment? actions dormantEnvironment =
                              dormantResult at h
                          cases activeResult with
                          | none => simp at h
                          | some queue =>
                              cases dormantResult with
                              | none => simp at h
                              | some seedPayload =>
                                  simp only at h
                                  have hview :
                                      BaseView.mk queue outerContinuation
                                          seedPayload beta = view :=
                                    Option.some.inj h
                                  subst view
                                  subst innerContinuation
                                  subst foundB
                                  rw [parseEnvironment?_sound hactive,
                                    parseEnvironment?_sound hdormant]
                                  rfl
                        next => contradiction
                      next => contradiction

@[simp]
theorem parseBase?_open
    (actions continuation queue seedPayload beta : Term) :
    parseBase? actions
        (openBase actions continuation queue seedPayload beta) =
      some ⟨queue, continuation, seedPayload, beta⟩ := by
  simp [parseBase?, openBase, parseEnvironment?_open]

@[simp]
theorem parseBase?_mutableBase
    (actions : Term) (bits : List Bool) (continuation queue beta : Term) :
    parseBase? actions
        (MutableBase.base actions bits continuation queue beta) =
      some ⟨queue, continuation, word bits, beta⟩ := by
  rw [← openBase_word]
  exact parseBase?_open actions continuation queue (word bits) beta

/-! ## Term-only public-carrier decoding -/

/--
Declarative semantics of the term-only carrier decoder.  The negative parser
premises record the classifier priority, so this grammar is exactly
executable as well as independent of seed bits and continuation codes.
-/
inductive CarrierDecodes (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) :
    Term → List Bool → Prop where
  | base
      {term : Term} (view : BaseView) {decoded : List Bool}
      (boundary : parseBase? (compileActions program tree) term = some view)
      (queue : CellSpine.Decodes view.queue decoded) :
      CarrierDecodes program tree term decoded
  | local
      {term : Term} (view : LocalView program) {decoded : List Bool}
      (notBase : parseBase? (compileActions program tree) term = none)
      (boundary : parseLocal? program tree term = some view)
      (inner : CarrierDecodes program tree view.accumulator decoded) :
      CarrierDecodes program tree term decoded
  | live
      {term predecessor : Term} {decoded : List Bool} (bit : Bool)
      (notBase : parseBase? (compileActions program tree) term = none)
      (notLocal : parseLocal? program tree term = none)
      (boundary : CanonicalStep.parseCell? term =
        some (.live bit predecessor))
      (inner : CarrierDecodes program tree predecessor decoded) :
      CarrierDecodes program tree term (decoded ++ [bit])
  | tombstone
      {term predecessor : Term} {decoded : List Bool} (bit : Bool)
      (notBase : parseBase? (compileActions program tree) term = none)
      (notLocal : parseLocal? program tree term = none)
      (boundary : CanonicalStep.parseCell? term =
        some (.tombstone bit predecessor))
      (inner : CarrierDecodes program tree predecessor decoded) :
      CarrierDecodes program tree term decoded

theorem parsedCell_size_lt
    {term predecessor : Term} {cell : CanonicalStep.CellResult}
    (h : CanonicalStep.parseCell? term = some cell)
    (hpredecessor :
      match cell with
      | .live _ found => found = predecessor
      | .tombstone _ found => found = predecessor) :
    predecessor.size < term.size := by
  have shape := CanonicalStep.parseCell?_sound h
  cases shape with
  | live bit found =>
      simp only at hpredecessor
      subst predecessor
      exact CarrierDecoder.size_app_right_lt (live bit) found
  | tombstone bit found audit =>
      simp only at hpredecessor
      subst predecessor
      exact Nat.lt_trans
        (CarrierDecoder.size_app_right_lt .s found)
        (CarrierDecoder.size_app_left_lt (.app .s found)
          (.app (valueTag bit) audit))

set_option linter.unusedVariables false in
/--
Decode a public carrier using only its bare syntax.  Recursive calls follow
strict accumulator/predecessor occurrences; no decoded seed or continuation
is supplied to the function.
-/
def decodeCarrier? (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : Option (List Bool) :=
  match hbase : parseBase? (compileActions program tree) term with
  | some view => CellSpine.decode? view.queue
  | none =>
      match hlocal : parseLocal? program tree term with
      | some view => decodeCarrier? program tree view.accumulator
      | none =>
          match hcell : CanonicalStep.parseCell? term with
          | some (.live bit predecessor) =>
              (decodeCarrier? program tree predecessor).map
                (fun decoded => decoded ++ [bit])
          | some (.tombstone _ predecessor) =>
              decodeCarrier? program tree predecessor
          | none => none
termination_by term.size
decreasing_by
  · exact parseLocal?_accumulator_size_lt hlocal
  · exact parsedCell_size_lt hcell rfl
  · exact parsedCell_size_lt hcell rfl

@[simp]
theorem decodeCarrier?_openBase
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (continuation queue seedPayload beta : Term) :
    decodeCarrier? program tree
        (openBase (compileActions program tree) continuation queue seedPayload
          beta) =
      CellSpine.decode? queue := by
  rw [decodeCarrier?]
  rw [parseBase?_open]

@[simp]
theorem decodeCarrier?_mutableBase
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation queue beta : Term) :
    decodeCarrier? program tree
        (MutableBase.base (compileActions program tree) bits continuation queue
          beta) =
      CellSpine.decode? queue := by
  rw [decodeCarrier?]
  rw [parseBase?_mutableBase]

/-- Successful term-only carrier decoding has an exact grammar derivation. -/
theorem decodeCarrier?_sound
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    {term : Term} {decoded : List Bool}
    (hdecode : decodeCarrier? program tree term = some decoded) :
    CarrierDecodes program tree term decoded := by
  generalize hbase : parseBase? (compileActions program tree) term = baseResult
  cases baseResult with
  | some view =>
      rw [decodeCarrier?, hbase] at hdecode
      exact .base view hbase (CellSpine.decode?_sound hdecode)
  | none =>
      generalize hlocal : parseLocal? program tree term = localResult
      cases localResult with
      | some view =>
          rw [decodeCarrier?, hbase, hlocal] at hdecode
          exact .local view hbase hlocal
            (decodeCarrier?_sound program tree hdecode)
      | none =>
          generalize hcell : CanonicalStep.parseCell? term = cellResult
          cases cellResult with
          | none =>
              rw [decodeCarrier?, hbase, hlocal, hcell] at hdecode
              contradiction
          | some cell =>
              cases cell with
              | live bit predecessor =>
                  rw [decodeCarrier?, hbase, hlocal, hcell] at hdecode
                  have hmap :
                      (decodeCarrier? program tree predecessor).map
                          (fun innerBits => innerBits ++ [bit]) =
                        some decoded := by
                    exact hdecode
                  cases hinner : decodeCarrier? program tree predecessor with
                  | none => simp [hinner] at hmap
                  | some innerBits =>
                      simp [hinner] at hmap
                      subst decoded
                      exact .live bit hbase hlocal hcell
                        (decodeCarrier?_sound program tree hinner)
              | tombstone bit predecessor =>
                  rw [decodeCarrier?, hbase, hlocal, hcell] at hdecode
                  exact .tombstone bit hbase hlocal hcell
                    (decodeCarrier?_sound program tree hdecode)
termination_by term.size
decreasing_by
  all_goals
    first
    | exact parseLocal?_accumulator_size_lt hlocal
    | exact parsedCell_size_lt hcell rfl

/-- Every derivation in the executable public grammar is accepted. -/
theorem decodeCarrier?_complete
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    {term : Term} {decoded : List Bool}
    (h : CarrierDecodes program tree term decoded) :
    decodeCarrier? program tree term = some decoded := by
  induction h with
  | base view boundary queue =>
      rw [decodeCarrier?, boundary]
      exact CellSpine.decode?_complete queue
  | «local» view notBase boundary inner ih =>
      rw [decodeCarrier?, notBase, boundary]
      exact ih
  | live bit notBase notLocal boundary inner ih =>
      rw [decodeCarrier?]
      rw [notBase, notLocal, boundary]
      simp only [ih]
      rfl
  | tombstone bit notBase notLocal boundary inner ih =>
      rw [decodeCarrier?, notBase, notLocal, boundary]
      exact ih

theorem decodeCarrier?_eq_some_iff
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) (decoded : List Bool) :
    decodeCarrier? program tree term = some decoded ↔
      CarrierDecodes program tree term decoded :=
  ⟨decodeCarrier?_sound program tree,
    decodeCarrier?_complete program tree⟩

/-- A bare public carrier has at most one decoded live queue. -/
theorem CarrierDecodes.deterministic
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {first second : List Bool}
    (hfirst : CarrierDecodes program tree term first)
    (hsecond : CarrierDecodes program tree term second) :
    first = second := by
  have h : (some first : Option (List Bool)) = some second :=
    (decodeCarrier?_complete program tree hfirst).symm.trans
      (decodeCarrier?_complete program tree hsecond)
  exact Option.some.inj h

/-! ## Completed continuation-chain traversal -/

/-- Positive-chain data retained after following literal `RL` children. -/
structure ChainView (program : CTS.Program) where
  layers : Nat
  terminal : TerminalView
  last : LocalView program
  deriving BEq, DecidableEq, Repr

/-- Internal traversal result: either the terminal itself or a nonempty chain. -/
inductive ChainTail (program : CTS.Program) where
  | terminal (view : TerminalView)
  | completed (view : ChainView program)
  deriving BEq, DecidableEq, Repr

/-- Add one outer Local while retaining the innermost (last) Local. -/
def prependLocal (outer : LocalView program) :
    ChainTail program → ChainTail program
  | .terminal terminal => .completed ⟨1, terminal, outer⟩
  | .completed inner =>
      .completed ⟨inner.layers + 1, inner.terminal, inner.last⟩

/-- Exact executable grammar of the literal continuation traversal. -/
inductive ChainShape (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) :
    Term → ChainTail program → Prop where
  | terminal
      {term : Term} (view : TerminalView)
      (notLocal : parseLocal? program tree term = none)
      (boundary : parseTerminal? (compileActions program tree) term =
        some view) :
      ChainShape program tree term (.terminal view)
  | local
      {term : Term} (view : LocalView program) {tail : ChainTail program}
      (boundary : parseLocal? program tree term = some view)
      (inner : ChainShape program tree view.continuation tail) :
      ChainShape program tree term (prependLocal view tail)

set_option linter.unusedVariables false in
/--
Follow completed Local continuations until the first non-Local term, then
require that endpoint to be a positive arity-four clock exit.
-/
def parseChainTail? (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : Option (ChainTail program) :=
  match hlocal : parseLocal? program tree term with
  | some view =>
      (parseChainTail? program tree view.continuation).map
        (prependLocal view)
  | none =>
      (parseTerminal? (compileActions program tree) term).map
        ChainTail.terminal
termination_by term.size
decreasing_by
  exact parseLocal?_continuation_size_lt hlocal

/-- Successful traversal has the exact continuation-chain grammar. -/
theorem parseChainTail?_sound
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    {term : Term} {tail : ChainTail program}
    (h : parseChainTail? program tree term = some tail) :
    ChainShape program tree term tail := by
  generalize hlocal : parseLocal? program tree term = localResult
  cases localResult with
  | none =>
      rw [parseChainTail?, hlocal] at h
      generalize hterminal :
        parseTerminal? (compileActions program tree) term = terminalResult at h
      cases terminalResult with
      | none => simp at h
      | some terminal =>
          simp only [Option.map] at h
          have htail : ChainTail.terminal terminal = tail := Option.some.inj h
          subst tail
          exact .terminal terminal hlocal hterminal
  | some view =>
      rw [parseChainTail?, hlocal] at h
      cases hinner : parseChainTail? program tree view.continuation with
      | none => simp [hinner] at h
      | some inner =>
          simp [hinner] at h
          subst tail
          exact .local view hlocal
            (parseChainTail?_sound program tree hinner)
termination_by term.size
decreasing_by
  exact parseLocal?_continuation_size_lt hlocal

/-- Every chain-grammar derivation is accepted by the traversal. -/
theorem parseChainTail?_complete
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    {term : Term} {tail : ChainTail program}
    (h : ChainShape program tree term tail) :
    parseChainTail? program tree term = some tail := by
  induction h with
  | terminal view notLocal boundary =>
      rw [parseChainTail?, notLocal, boundary]
      rfl
  | «local» view boundary inner ih =>
      rw [parseChainTail?, boundary]
      simp only [ih]
      rfl

/-- Retain only nonempty completed chains. -/
def parseChain? (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : Option (ChainView program) :=
  match parseChainTail? program tree term with
  | some (.completed view) => some view
  | _ => none

theorem parseChain?_sound
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : ChainView program}
    (h : parseChain? program tree term = some view) :
    ChainShape program tree term (.completed view) := by
  unfold parseChain? at h
  generalize htail : parseChainTail? program tree term = tailResult at h
  cases tailResult with
  | none => contradiction
  | some tail =>
      cases tail with
      | terminal terminal => contradiction
      | completed parsed =>
          have hview : parsed = view := Option.some.inj h
          subst view
          exact parseChainTail?_sound program tree htail

theorem parseChain?_complete
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : ChainView program}
    (h : ChainShape program tree term (.completed view)) :
    parseChain? program tree term = some view := by
  unfold parseChain?
  rw [parseChainTail?_complete program tree h]

/-! ## Positive checkpoint validation -/

/-- The phase selected by the final job at positive horizon `n`. -/
def expectedPhase (program : CTS.Program) (horizon : Nat) :
    CTS.Phase program :=
  ⟨(horizon - 1) % program.period,
    Nat.mod_lt _ program.period_pos⟩

/-- The marked flag is equivalent to an empty decoded live queue. -/
def markerCompatible : HaltStatus → List Bool → Bool
  | .fresh, [] => false
  | .fresh, _ :: _ => true
  | .marked, [] => true
  | .marked, _ :: _ => false

theorem markerCompatible_eq_true_iff
    (status : HaltStatus) (queue : List Bool) :
    markerCompatible status queue = true ↔
      (status = .marked ↔ queue = []) := by
  cases status <;> cases queue <;> simp [markerCompatible]

/-- Public output of a positive checkpoint decode. -/
structure PositiveView (program : CTS.Program) where
  horizon : Nat
  route : Dispatcher.Route
  label : ActionLabel program
  queue : List Bool
  deriving BEq, DecidableEq, Repr

/-- Declarative positive checkpoint layer, intentionally short of reachability. -/
def PositiveShape (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (result : PositiveView program) (term : Term) : Prop :=
  ∃ chain : ChainView program,
    ChainShape program tree term (.completed chain) ∧
    chain.last.label.1 = expectedPhase program chain.terminal.horizon ∧
    CarrierDecodes program tree chain.last.accumulator result.queue ∧
    markerCompatible chain.last.status result.queue = true ∧
    result = ⟨chain.terminal.horizon, chain.last.route, chain.last.label,
      result.queue⟩

/-- Internal positive result with its full syntactic certificate. -/
structure CertifiedPositive (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (term : Term) where
  view : PositiveView program
  shape : PositiveShape program tree view term

/--
Validate a positive checkpoint after term-only chain traversal.  The checks
are the terminal-selected CTS phase, live-queue decoding, and halt marker.
The number of completed outer shells is intentionally unrestricted: shells
from earlier dovetail stages remain around the final job.
-/
def parsePositiveCertified? (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (term : Term) :
    Option (CertifiedPositive program tree term) :=
  match hchain : parseChain? program tree term with
  | none => none
  | some chain =>
      if hphase :
          chain.last.label.1 = expectedPhase program chain.terminal.horizon
      then
        match hqueue : decodeCarrier? program tree chain.last.accumulator with
        | none => none
        | some queue =>
            if hmarker : markerCompatible chain.last.status queue = true then
              some ⟨
                ⟨chain.terminal.horizon, chain.last.route, chain.last.label,
                  queue⟩,
                ⟨chain, parseChain?_sound hchain, hphase,
                  decodeCarrier?_sound program tree hqueue, hmarker, rfl⟩⟩
            else
              none
      else
        none

/-- Public proof-free positive parser. -/
def parsePositive? (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : Option (PositiveView program) :=
  match parseChain? program tree term with
  | none => none
  | some chain =>
      if chain.last.label.1 =
          expectedPhase program chain.terminal.horizon then
        match decodeCarrier? program tree chain.last.accumulator with
        | none => none
        | some queue =>
            if markerCompatible chain.last.status queue then
              some ⟨chain.terminal.horizon, chain.last.route,
                chain.last.label, queue⟩
            else
              none
      else
        none

theorem parsePositive?_sound
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {result : PositiveView program}
    (h : parsePositive? program tree term = some result) :
    PositiveShape program tree result term := by
  cases hchain : parseChain? program tree term with
  | none =>
      rw [parsePositive?, hchain] at h
      contradiction
  | some chain =>
      rw [parsePositive?, hchain] at h
      simp only at h
      split at h
      next hphase =>
        cases hqueue : decodeCarrier? program tree chain.last.accumulator with
        | none =>
            rw [hqueue] at h
            contradiction
        | some queue =>
            rw [hqueue] at h
            simp only at h
            split at h
            next hmarker =>
              have hresult :
                  PositiveView.mk chain.terminal.horizon chain.last.route
                      chain.last.label queue = result :=
                Option.some.inj h
              subst result
              exact ⟨chain, parseChain?_sound hchain, hphase,
                decodeCarrier?_sound program tree hqueue, hmarker, rfl⟩
            next => contradiction
      next => contradiction

/-- Every declarative positive checkpoint is accepted with its exact result. -/
theorem parsePositive?_complete
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {result : PositiveView program}
    (h : PositiveShape program tree result term) :
    parsePositive? program tree term = some result := by
  rcases h with
    ⟨chain, chainShape, hphase, carrierShape, hmarker, hresult⟩
  unfold parsePositive?
  have hchain := parseChain?_complete chainShape
  simp [hchain, hphase,
    decodeCarrier?_complete program tree carrierShape, hmarker]
  exact hresult.symm

/--
Regression for the global dovetail: acceptance does not constrain the number
of completed shells surrounding the final job.  The terminal selects the
horizon; `layers` is an arbitrary syntactic count carried by the chain.
-/
theorem parsePositive?_arbitrary_layers
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {layers : Nat} {terminal : TerminalView}
    {last : LocalView program} {queue : List Bool}
    (chainShape : ChainShape program tree term
      (.completed ⟨layers, terminal, last⟩))
    (hphase : last.label.1 = expectedPhase program terminal.horizon)
    (carrierShape : CarrierDecodes program tree last.accumulator queue)
    (hmarker : markerCompatible last.status queue = true) :
    parsePositive? program tree term =
      some ⟨terminal.horizon, last.route, last.label, queue⟩ := by
  apply parsePositive?_complete
  exact ⟨⟨layers, terminal, last⟩, chainShape, hphase, carrierShape,
    hmarker, rfl⟩

theorem parsePositive?_eq_some_iff
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) (result : PositiveView program) :
    parsePositive? program tree term = some result ↔
      PositiveShape program tree result term :=
  ⟨parsePositive?_sound, parsePositive?_complete⟩

/-! ## Final total checkpoint decoder -/

/-- Public time-zero or positive checkpoint result. -/
inductive Result (program : CTS.Program) where
  | zero (bits : List Bool)
  | positive (view : PositiveView program)
  deriving BEq, DecidableEq, Repr

/--
Total decoder from one bare term.  There are no seed, phase, continuation,
route, history, or scheduler-state run-time arguments.
-/
def decode? (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : Option (Result program) :=
  match parseGenerator? (compileActions program tree) term with
  | some bits => some (.zero bits)
  | none => (parsePositive? program tree term).map Result.positive

/-- Declarative semantics of the total decoder, including parser priority. -/
inductive Decodes (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : Result program → Prop where
  | zero (bits : List Bool)
      (source_eq : term = generator (compileActions program tree) bits) :
      Decodes program tree term (.zero bits)
  | positive (view : PositiveView program)
      (notZero : parseGenerator? (compileActions program tree) term = none)
      (shape : PositiveShape program tree view term) :
      Decodes program tree term (.positive view)

/-- Every successful total decode has the exact checkpoint grammar. -/
theorem decode?_sound
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    {term : Term} {result : Result program}
    (h : decode? program tree term = some result) :
    Decodes program tree term result := by
  unfold decode? at h
  generalize hzero :
    parseGenerator? (compileActions program tree) term = zeroResult at h
  cases zeroResult with
  | some bits =>
      simp only at h
      have hresult : Result.zero bits = result := Option.some.inj h
      subst result
      exact .zero bits (parseGenerator?_sound hzero)
  | none =>
      generalize hpositive : parsePositive? program tree term = positiveResult
        at h
      cases positiveResult with
      | none => simp at h
      | some view =>
          simp only [Option.map] at h
          have hresult : Result.positive view = result := Option.some.inj h
          subst result
          exact .positive view hzero (parsePositive?_sound hpositive)

/-- Every derivation in the checkpoint grammar is returned by the decoder. -/
theorem decode?_complete
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    {term : Term} {result : Result program}
    (h : Decodes program tree term result) :
    decode? program tree term = some result := by
  cases h with
  | zero bits source_eq =>
      subst term
      rw [decode?, parseGenerator?_generator]
  | positive view notZero shape =>
      rw [decode?, notZero, parsePositive?_complete shape]
      rfl

theorem decode?_eq_some_iff
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) (result : Result program) :
    decode? program tree term = some result ↔
      Decodes program tree term result :=
  ⟨decode?_sound program tree, decode?_complete program tree⟩

/-- Bare-term checkpoint decoding is right-unique. -/
theorem Decodes.deterministic
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {first second : Result program}
    (hfirst : Decodes program tree term first)
    (hsecond : Decodes program tree term second) :
    first = second := by
  have h : (some first : Option (Result program)) = some second :=
    (decode?_complete program tree hfirst).symm.trans
      (decode?_complete program tree hsecond)
  exact Option.some.inj h

@[simp]
theorem decode?_generator
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (bits : List Bool) :
    decode? program tree
        (generator (compileActions program tree) bits) =
      some (.zero bits) := by
  rw [decode?, parseGenerator?_generator]

/-! ## Concrete acceptance and rejection facts -/

theorem HaltShape.headArity
    {status : HaltStatus} {field : Term}
    (h : HaltShape status field) :
    field.headArity = 2 ∨ field.headArity = 3 := by
  cases h with
  | fresh audit => exact Or.inr rfl
  | marked leftAudit rightAudit => exact Or.inl rfl

/-- Any successful completed-Local parse has root arity five or six. -/
theorem parseLocal?_headArity
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : LocalView program}
    (h : parseLocal? program tree term = some view) :
    term.headArity = 5 ∨ term.headArity = 6 := by
  rcases parseLocal?_sound h with
    ⟨haltField, dispatcher, seedAudit, continuationAudit, haltShape,
      dispatchShape, source_eq⟩
  rw [source_eq]
  rcases haltShape.headArity with htwo | hthree
  · left
    simp [openShell, htwo]
  · right
    simp [openShell, hthree]

/-- Arity alone rejects any term that cannot be a completed Local root. -/
theorem parseLocal?_none_of_headArity
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term)
    (hneFive : term.headArity ≠ 5)
    (hneSix : term.headArity ≠ 6) :
    parseLocal? program tree term = none := by
  cases hparse : parseLocal? program tree term with
  | none => rfl
  | some view =>
      rcases parseLocal?_headArity hparse with hfive | hsix
      · exact (hneFive hfive).elim
      · exact (hneSix hsix).elim

@[simp]
theorem parseLocal?_terminal_none
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (n : Nat) (environment : Term) :
    parseLocal? program tree (Dovetail.clockExit n 0 environment) = none := by
  apply parseLocal?_none_of_headArity program tree
  · simp
  · simp

@[simp]
theorem parseLocal?_nonterminalExit_none
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (n r : Nat) (environment : Term) :
    parseLocal? program tree
        (Dovetail.clockExit n (r + 1) environment) = none := by
  apply parseLocal?_none_of_headArity program tree
  · simp
  · simp

/-- `(C_1 C_1) E` is the rejected staging term, not a positive terminal. -/
@[simp]
theorem parseTerminal?_staging
    (actions seedPayload : Term) :
    parseTerminal? actions
        (Dovetail.clockExit 0 0 (openEnvironment actions seedPayload)) =
      none := by
  simp [parseTerminal?, Dovetail.clockExit, clockBase, parseCarrier?_C,
    parseEnvironment?_open]

/-- A clock exit with a remaining wrapper has arity three and is nonterminal. -/
@[simp]
theorem parseTerminal?_nonterminalExit
    (actions environment : Term) (n r : Nat) :
    parseTerminal? actions (Dovetail.clockExit n (r + 1) environment) =
      none := by
  simp [parseTerminal?, Dovetail.clockExit, clockWrappers, parseCarrier?]

@[simp]
theorem parseGenerator?_staging
    (actions seedPayload : Term) :
    parseGenerator? actions
        (Dovetail.clockExit 0 0 (openEnvironment actions seedPayload)) =
      none := by
  simp [parseGenerator?, Dovetail.clockExit, clockBase, parseCarrier?_C]

@[simp]
theorem parseGenerator?_nonterminalExit
    (actions environment : Term) (n r : Nat) :
    parseGenerator? actions
        (Dovetail.clockExit n (r + 1) environment) = none := by
  simp [parseGenerator?, Dovetail.clockExit, clockWrappers, parseCarrier?]

@[simp]
theorem parseChain?_staging
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (seedPayload : Term) :
    parseChain? program tree
        (Dovetail.clockExit 0 0
          (openEnvironment (compileActions program tree) seedPayload)) =
      none := by
  unfold parseChain?
  rw [parseChainTail?, parseLocal?_terminal_none,
    parseTerminal?_staging]
  rfl

@[simp]
theorem parseChain?_nonterminalExit
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (n r : Nat) (environment : Term) :
    parseChain? program tree
        (Dovetail.clockExit n (r + 1) environment) = none := by
  unfold parseChain?
  rw [parseChainTail?, parseLocal?_nonterminalExit_none,
    parseTerminal?_nonterminalExit]
  rfl

/-- The one-contraction staging successor of a generator is rejected. -/
@[simp]
theorem decode?_staging
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (bits : List Bool) :
    decode? program tree
        (Dovetail.clockExit 0 0
          (environmentCode (compileActions program tree) bits)) = none := by
  have hzero :
      parseGenerator? (compileActions program tree)
          (Dovetail.clockExit 0 0
            (environmentCode (compileActions program tree) bits)) = none := by
    exact parseGenerator?_staging (compileActions program tree) (word bits)
  rw [decode?, hzero]
  have hchain :
      parseChain? program tree
          (Dovetail.clockExit 0 0
            (environmentCode (compileActions program tree) bits)) = none := by
    exact parseChain?_staging program tree (word bits)
  rw [parsePositive?, hchain]
  rfl

/-- A raw clock continuation with an unlaunched wrapper is not a checkpoint. -/
@[simp]
theorem decode?_nonterminalExit
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (n r : Nat) (environment : Term) :
    decode? program tree
        (Dovetail.clockExit n (r + 1) environment) = none := by
  rw [decode?, parseGenerator?_nonterminalExit]
  simp [parsePositive?, parseChain?_nonterminalExit]

/-- A fresh halt field paired with an empty decoded snapshot is rejected. -/
theorem parsePositive?_fresh_empty
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) (chain : ChainView program)
    (hchain : parseChain? program tree term = some chain)
    (hstatus : chain.last.status = .fresh)
    (hqueue : decodeCarrier? program tree chain.last.accumulator = some []) :
    parsePositive? program tree term = none := by
  rw [parsePositive?, hchain]
  simp only
  split <;> try rfl
  rw [hqueue, hstatus]
  rfl

/-- A marked halt field paired with a nonempty decoded snapshot is rejected. -/
theorem parsePositive?_marked_nonempty
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) (chain : ChainView program)
    (bit : Bool) (tail : List Bool)
    (hchain : parseChain? program tree term = some chain)
    (hstatus : chain.last.status = .marked)
    (hqueue : decodeCarrier? program tree chain.last.accumulator =
      some (bit :: tail)) :
    parsePositive? program tree term = none := by
  rw [parsePositive?, hchain]
  simp only
  split <;> try rfl
  rw [hqueue, hstatus]
  rfl

end CheckpointDecoder

end PureSFormal.PureS
