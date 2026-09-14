import PureSFormal.PureS.DispatchParser
import PureSFormal.PureS.MutableBase

/-!
# Executable canonical-path step classification

At fixed program code, dispatcher tree, input word, and continuation, the
classifier recognizes the registered Base boundary, Local shell, live cell,
or transparent tombstone.  Local parsing delegates its dispatcher field to
`DispatchParser`; Base parsing follows the mutation-closed public boundary
and exposes the queue currently stored at the registered word address.

The continuation admissibility witness is an explicit input.  It supplies
the arity separation between Base roots and cell roots.  Audit and history
fields are extracted or skipped, never compared.
-/

namespace PureSFormal.PureS

namespace CanonicalStep

/-- The result of one total canonical-path classification. -/
inductive Result where
  | base (queue : Term)
  | local (accumulator : Term)
  | live (bit : Bool) (predecessor : Term)
  | tombstone (bit : Bool) (predecessor : Term)
  | malformed
  deriving BEq, DecidableEq, Repr

/-! ## Certified Local-boundary checking -/

/-- A proof-carrying successful halt-field check. -/
structure CheckedHField (field : Term) where
  token : Unit
  valid : Carrier.HField field

/--
Validate the fixed fresh or marked halt prefix.  The arguments carried by
either alternative remain unrestricted.
-/
def checkHField? (field : Term) : Option (CheckedHField field) :=
  match field with
  | .s => none
  | .app fn audit =>
      if hfn : fn = haltCode then
        some ⟨(), by
          subst fn
          exact .fresh audit⟩
      else
        match fn, audit with
        | .app .s leftAudit, .app tag rightAudit =>
            if htag : tag = haltTag then
              some ⟨(), by
                subst tag
                exact .marked leftAudit rightAudit⟩
            else
              none
        | _, _ => none

theorem checkHField?_isSome
    {field : Term} (h : Carrier.HField field) :
    (checkHField? field).isSome = true := by
  cases h with
  | fresh audit =>
      simp [checkHField?, freshHField]
  | marked leftAudit rightAudit =>
      simp only [Carrier.markedHField, checkHField?]
      split <;> rfl

/-- A successfully checked public Local boundary. -/
structure CheckedLocal
    (bits : List Bool) (continuation term : Term) where
  dispatcher : Term
  shell : Carrier.LocalShell bits continuation dispatcher term

/--
Check the exact four-field Local shell.  Only the fixed seed code and fixed
continuation are compared.  All three audit arguments are ignored after
their registered application boundaries have been established.
-/
def checkLocal? (bits : List Bool) (continuation : Term)
    (term : Term) : Option (CheckedLocal bits continuation term) :=
  match term with
  | .app
      (.app
        (.app haltField dispatcher)
        (.app foundSeed seedAudit))
      (.app foundContinuation continuationAudit) =>
      match checkHField? haltField with
      | none => none
      | some haltCheck =>
          if hseed : foundSeed = seedCode bits then
            if hcontinuation : foundContinuation = continuation then
              some ⟨dispatcher, by
                subst foundSeed
                subst foundContinuation
                cases haltCheck.valid with
                | fresh haltAudit =>
                    exact .fresh dispatcher haltAudit seedAudit
                      continuationAudit
                | marked leftAudit rightAudit =>
                    exact .marked dispatcher leftAudit rightAudit seedAudit
                      continuationAudit⟩
            else
              none
          else
            none
  | _ => none

theorem checkLocal?_isSome
    {bits : List Bool} {continuation dispatcher term : Term}
    (h : Carrier.LocalShell bits continuation dispatcher term) :
    (checkLocal? bits continuation term).isSome = true := by
  cases h with
  | fresh haltAudit seedAudit continuationAudit =>
      simp [checkLocal?, Carrier.activeShell, Carrier.shell,
        checkHField?, freshHField]
  | marked leftAudit rightAudit seedAudit continuationAudit =>
      simp [checkLocal?, Carrier.activeShell, Carrier.shell, checkHField?,
        Carrier.markedHField, haltCode, b]

theorem checkLocal?_complete
    {bits : List Bool} {continuation dispatcher term : Term}
    (h : Carrier.LocalShell bits continuation dispatcher term) :
    ∃ checked,
      checkLocal? bits continuation term = some checked ∧
        checked.dispatcher = dispatcher := by
  have hisSome := checkLocal?_isSome h
  cases hcheck : checkLocal? bits continuation term with
  | none => simp [hcheck] at hisSome
  | some checked =>
      refine ⟨checked, rfl, ?_⟩
      exact checked.shell.dispatcher_deterministic h

/-- Validate a Local shell and return only its canonical action accumulator. -/
def localAccumulator? (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation term : Term) : Option Term :=
  match checkLocal? bits continuation term with
  | none => none
  | some checked =>
      (DispatchParser.parse program tree checked.dispatcher).map
        DispatchParser.ParsedDispatch.accumulator

/-- Local success supplies the exact shell and dispatcher relation. -/
theorem localAccumulator?_sound
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation term accumulator : Term}
    (h : localAccumulator? program tree bits continuation term =
      some accumulator) :
    ∃ dispatcher,
      Carrier.LocalShell bits continuation dispatcher term ∧
        DispatchParser.dispatchesTo program tree dispatcher accumulator := by
  unfold localAccumulator? at h
  generalize hlocal : checkLocal? bits continuation term = localResult at h
  cases localResult with
  | none => contradiction
  | some checked =>
      simp only at h
      generalize hdispatch :
        DispatchParser.parse program tree checked.dispatcher = dispatchResult
          at h
      cases dispatchResult with
      | none => cases h
      | some parsed =>
          simp only [Option.map] at h
          have haccumulator : parsed.accumulator = accumulator :=
            Option.some.inj h
          subst accumulator
          refine ⟨checked.dispatcher, checked.shell, ?_⟩
          exact ⟨parsed.route, parsed.label,
            DispatchParser.parse_sound hdispatch⟩

/-- Every generated Local constructor returns its registered accumulator. -/
theorem localAccumulator?_complete
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation dispatcher term accumulator : Term}
    (shell : Carrier.LocalShell bits continuation dispatcher term)
    (dispatch : DispatchParser.dispatchesTo program tree dispatcher
      accumulator) :
    localAccumulator? program tree bits continuation term = some accumulator := by
  obtain ⟨checked, hchecked, hdispatcher⟩ := checkLocal?_complete shell
  obtain ⟨route, label, hparse⟩ :=
    DispatchParser.parse_of_dispatchesTo dispatch
  unfold localAccumulator?
  rw [hchecked]
  simp only
  rw [hdispatcher, hparse]
  rfl

/-! ## Immediate cell checking -/

/-- A validated immediate cell edge. -/
inductive CellResult where
  | live (bit : Bool) (predecessor : Term)
  | tombstone (bit : Bool) (predecessor : Term)
  deriving BEq, DecidableEq, Repr

/-- Validate one exact live or tombstone constructor at the supplied root. -/
def parseCell? : Term → Option CellResult
  | .app (.app (.app .s .s) tag) predecessor =>
      if tag = valueTag false then
        some (.live false predecessor)
      else if tag = valueTag true then
        some (.live true predecessor)
      else
        none
  | .app (.app .s predecessor) (.app tag _audit) =>
      if tag = valueTag false then
        some (.tombstone false predecessor)
      else if tag = valueTag true then
        some (.tombstone true predecessor)
      else
        none
  | _ => none

@[simp]
theorem parseCell?_live (bit : Bool) (predecessor : Term) :
    parseCell? (.app (live bit) predecessor) =
      some (.live bit predecessor) := by
  cases bit <;> rfl

@[simp]
theorem parseCell?_tombstone
    (bit : Bool) (predecessor audit : Term) :
    parseCell? (Carrier.tombstone bit predecessor audit) =
      some (.tombstone bit predecessor) := by
  cases bit <;> rfl

/-- Declarative shape of one immediate cell-parser result. -/
inductive CellShape : Term → CellResult → Prop where
  | live (bit : Bool) (predecessor : Term) :
      CellShape (.app (PureSFormal.PureS.live bit) predecessor)
        (.live bit predecessor)
  | tombstone (bit : Bool) (predecessor audit : Term) :
      CellShape (Carrier.tombstone bit predecessor audit)
        (.tombstone bit predecessor)

/-- Every successful cell result reconstructs its registered public form. -/
theorem parseCell?_sound
    {term : Term} {parsed : CellResult}
    (h : parseCell? term = some parsed) :
    CellShape term parsed := by
  cases term with
  | s => simp [parseCell?] at h
  | app fn arg =>
      cases fn with
      | s => simp [parseCell?] at h
      | app left middle =>
          cases left with
          | s =>
              cases arg with
              | s => simp [parseCell?] at h
              | app tag audit =>
                  simp only [parseCell?] at h
                  split at h
                  next hfalse =>
                    have hparsed := Option.some.inj h
                    subst parsed
                    subst tag
                    exact .tombstone false middle audit
                  next hnotFalse =>
                    split at h
                    next htrue =>
                      have hparsed := Option.some.inj h
                      subst parsed
                      subst tag
                      exact .tombstone true middle audit
                    next => contradiction
          | app head fixed =>
              cases head with
              | s =>
                  cases fixed with
                  | s =>
                      simp only [parseCell?] at h
                      split at h
                      next hfalse =>
                        have hparsed := Option.some.inj h
                        subst parsed
                        subst middle
                        exact .live false arg
                      next hnotFalse =>
                        split at h
                        next htrue =>
                          have hparsed := Option.some.inj h
                          subst parsed
                          subst middle
                          exact .live true arg
                        next => contradiction
                  | app fixedFn fixedArg => simp [parseCell?] at h
              | app headFn headArg => simp [parseCell?] at h

/-! ## Total classification -/

/--
Classify one term and return the next canonical child when one exists.
`hadmissible` is computationally irrelevant but records the separation
premise required by the concrete grammar.
-/
def classify (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation : Term)
    (_hadmissible : Carrier.Admissible continuation) (term : Term) : Result :=
  match MutableBase.parse?
      (compileActions program tree) bits continuation term with
  | some view => .base view.queue
  | none =>
      match localAccumulator? program tree bits continuation term with
      | some accumulator => .local accumulator
      | none =>
          match parseCell? term with
          | some (.live bit predecessor) => .live bit predecessor
          | some (.tombstone bit predecessor) => .tombstone bit predecessor
          | none => .malformed

/-! ## Declarative classification semantics -/

/--
Evidence for every possible classifier result.  Successful constructors use
the independent declarative grammars, while `malformed` records failure of
all three registered boundary checks.
-/
inductive Classifies
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation term : Term) : Result → Prop where
  | base (queue beta : Term)
      (boundary : MutableBase.parse? (compileActions program tree) bits
        continuation term = some ⟨queue, beta⟩) :
      Classifies program tree bits continuation term (.base queue)
  | local
      {dispatcher accumulator : Term}
      (notBase : MutableBase.parse? (compileActions program tree) bits
        continuation term = none)
      (shell : Carrier.LocalShell bits continuation dispatcher term)
      (dispatch : DispatchParser.dispatchesTo program tree dispatcher
        accumulator) :
      Classifies program tree bits continuation term (.local accumulator)
  | live
      (bit : Bool) (predecessor : Term)
      (notBase : MutableBase.parse? (compileActions program tree) bits
        continuation term = none)
      (notLocal : localAccumulator? program tree bits continuation term = none)
      (source_eq : term = .app (PureSFormal.PureS.live bit) predecessor) :
      Classifies program tree bits continuation term (.live bit predecessor)
  | tombstone
      (bit : Bool) (predecessor audit : Term)
      (notBase : MutableBase.parse? (compileActions program tree) bits
        continuation term = none)
      (notLocal : localAccumulator? program tree bits continuation term = none)
      (source_eq : term = Carrier.tombstone bit predecessor audit) :
      Classifies program tree bits continuation term
        (.tombstone bit predecessor)
  | malformed
      (notBase : MutableBase.parse? (compileActions program tree) bits
        continuation term = none)
      (notLocal : localAccumulator? program tree bits continuation term = none)
      (notCell : parseCell? term = none) :
      Classifies program tree bits continuation term .malformed

/-- The total executable classifier always returns declaratively valid evidence. -/
theorem classify_sound
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation) (term : Term) :
    Classifies program tree bits continuation term
      (classify program tree bits continuation hadmissible term) := by
  unfold classify
  generalize hbase : MutableBase.parse? (compileActions program tree) bits
    continuation term = baseResult
  cases baseResult with
  | some view =>
      exact .base view.queue view.beta hbase
  | none =>
      generalize hlocal :
        localAccumulator? program tree bits continuation term = localResult
      cases localResult with
      | some accumulator =>
          obtain ⟨dispatcher, shell, dispatch⟩ :=
            localAccumulator?_sound hlocal
          exact .local hbase shell dispatch
      | none =>
          generalize hcell : parseCell? term = cellResult
          cases cellResult with
          | none => exact .malformed hbase hlocal hcell
          | some cell =>
              cases cell with
              | live bit predecessor =>
                  have hshape := parseCell?_sound hcell
                  cases hshape with
                  | live => exact .live bit predecessor hbase hlocal rfl
              | tombstone bit predecessor =>
                  have hshape := parseCell?_sound hcell
                  cases hshape with
                  | tombstone _ _ audit =>
                      exact .tombstone bit predecessor audit hbase hlocal rfl

/-- Every declarative result is returned by the executable classifier. -/
theorem classify_complete
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation)
    {term : Term} {result : Result}
    (h : Classifies program tree bits continuation term result) :
    classify program tree bits continuation hadmissible term = result := by
  cases h with
  | base queue beta boundary =>
      simp [classify, boundary]
  | «local» notBase shell dispatch =>
      simp [classify, notBase, localAccumulator?_complete shell dispatch]
  | live bit predecessor notBase notLocal source_eq =>
      subst term
      simp [classify, notBase, notLocal]
  | tombstone bit predecessor audit notBase notLocal source_eq =>
      subst term
      simp [classify, notBase, notLocal]
  | malformed notBase notLocal notCell =>
      simp [classify, notBase, notLocal, notCell]

/-- Executable classification agrees exactly with its declarative relation. -/
theorem classify_eq_iff
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation)
    (term : Term) (result : Result) :
    classify program tree bits continuation hadmissible term = result ↔
      Classifies program tree bits continuation term result := by
  constructor
  · intro h
    rw [← h]
    exact classify_sound program tree bits continuation hadmissible term
  · exact classify_complete program tree bits continuation hadmissible

/-- Exact acceptance criterion for the Base result. -/
theorem classify_eq_base_iff
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation)
    (term queue : Term) :
    classify program tree bits continuation hadmissible term =
        .base queue ↔
      ∃ beta, MutableBase.parse? (compileActions program tree) bits
        continuation term = some ⟨queue, beta⟩ := by
  rw [classify_eq_iff]
  constructor
  · intro h
    cases h with
    | base queue beta boundary => exact ⟨beta, boundary⟩
  · rintro ⟨beta, boundary⟩
    exact .base queue beta boundary

/-- Exact acceptance criterion for a Local accumulator result. -/
theorem classify_eq_local_iff
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation)
    (term accumulator : Term) :
    classify program tree bits continuation hadmissible term =
        .local accumulator ↔
      MutableBase.parse? (compileActions program tree) bits continuation term =
          none ∧
        ∃ dispatcher,
          Carrier.LocalShell bits continuation dispatcher term ∧
            DispatchParser.dispatchesTo program tree dispatcher accumulator := by
  rw [classify_eq_iff]
  constructor
  · intro h
    cases h with
    | «local» notBase shell dispatch =>
        exact ⟨notBase, _, shell, dispatch⟩
  · rintro ⟨notBase, dispatcher, shell, dispatch⟩
    exact .local notBase shell dispatch

/-- Exact acceptance criterion for an immediate live predecessor edge. -/
theorem classify_eq_live_iff
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation)
    (term : Term) (bit : Bool) (predecessor : Term) :
    classify program tree bits continuation hadmissible term =
        .live bit predecessor ↔
      MutableBase.parse? (compileActions program tree) bits continuation term =
          none ∧
        localAccumulator? program tree bits continuation term = none ∧
        term = .app (PureSFormal.PureS.live bit) predecessor := by
  rw [classify_eq_iff]
  constructor
  · intro h
    cases h with
    | live _ _ notBase notLocal source_eq =>
        exact ⟨notBase, notLocal, source_eq⟩
  · rintro ⟨notBase, notLocal, source_eq⟩
    exact .live bit predecessor notBase notLocal source_eq

/-- Exact acceptance criterion for an immediate tombstone predecessor edge. -/
theorem classify_eq_tombstone_iff
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation)
    (term : Term) (bit : Bool) (predecessor : Term) :
    classify program tree bits continuation hadmissible term =
        .tombstone bit predecessor ↔
      MutableBase.parse? (compileActions program tree) bits continuation term =
          none ∧
        localAccumulator? program tree bits continuation term = none ∧
        ∃ audit, term = Carrier.tombstone bit predecessor audit := by
  rw [classify_eq_iff]
  constructor
  · intro h
    cases h with
    | tombstone _ _ audit notBase notLocal source_eq =>
        exact ⟨notBase, notLocal, audit, source_eq⟩
  · rintro ⟨notBase, notLocal, audit, source_eq⟩
    exact .tombstone bit predecessor audit notBase notLocal source_eq

/-- Malformation means that every registered public boundary check failed. -/
theorem classify_eq_malformed_iff
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation)
    (term : Term) :
    classify program tree bits continuation hadmissible term = .malformed ↔
      MutableBase.parse? (compileActions program tree) bits continuation term =
          none ∧
        localAccumulator? program tree bits continuation term = none ∧
        parseCell? term = none := by
  rw [classify_eq_iff]
  constructor
  · intro h
    cases h with
    | malformed notBase notLocal notCell =>
        exact ⟨notBase, notLocal, notCell⟩
  · rintro ⟨notBase, notLocal, notCell⟩
    exact .malformed notBase notLocal notCell

/-! ## Structural branch separation -/

/-- A parsed mutation-closed Base and a registered Local shell are disjoint. -/
theorem parsedBase_ne_local
    {actions : Term} {bits : List Bool}
    {continuation term dispatcher : Term} {view : MutableBase.View}
    (hbase : MutableBase.parse? actions bits continuation term = some view)
    (hlocal : Carrier.LocalShell bits continuation dispatcher term) : False :=
  MutableBase.parsed_not_local hbase hlocal

theorem parsedBase_ne_live
    (actions : Term) (bits : List Bool)
    {continuation term : Term} {view : MutableBase.View}
    (hadmissible : Carrier.Admissible continuation)
    (hbase : MutableBase.parse? actions bits continuation term = some view)
    (bit : Bool) (predecessor : Term) :
    term ≠ .app (live bit) predecessor := by
  intro heq
  have hterm := MutableBase.parse?_sound hbase
  have hbaseArity : term.headArity = 5 ∨ term.headArity = 6 := by
    rw [hterm]
    exact MutableBase.root_headArity actions bits hadmissible view.queue view.beta
  rw [heq] at hbaseArity
  rcases hbaseArity with h | h <;>
    simp only [Carrier.headArity_liveCell] at h <;> cases h

theorem parsedBase_ne_tombstone
    (actions : Term) (bits : List Bool)
    {continuation term : Term} {view : MutableBase.View}
    (hadmissible : Carrier.Admissible continuation)
    (hbase : MutableBase.parse? actions bits continuation term = some view)
    (bit : Bool) (predecessor audit : Term) :
    term ≠ Carrier.tombstone bit predecessor audit := by
  intro heq
  have hterm := MutableBase.parse?_sound hbase
  have hbaseArity : term.headArity = 5 ∨ term.headArity = 6 := by
    rw [hterm]
    exact MutableBase.root_headArity actions bits hadmissible view.queue view.beta
  rw [heq] at hbaseArity
  rcases hbaseArity with h | h <;>
    simp only [Carrier.headArity_tombstone] at h <;> cases h

theorem local_ne_live
    {bits : List Bool} {continuation dispatcher term : Term}
    (hlocal : Carrier.LocalShell bits continuation dispatcher term)
    (bit : Bool) (predecessor : Term) :
    term ≠ .app (live bit) predecessor := by
  intro heq
  have harity := hlocal.result_headArity
  rw [heq] at harity
  rcases harity with h | h <;>
    simp only [Carrier.headArity_liveCell] at h <;> cases h

theorem local_ne_tombstone
    {bits : List Bool} {continuation dispatcher term : Term}
    (hlocal : Carrier.LocalShell bits continuation dispatcher term)
    (bit : Bool) (predecessor audit : Term) :
    term ≠ Carrier.tombstone bit predecessor audit := by
  intro heq
  have harity := hlocal.result_headArity
  rw [heq] at harity
  rcases harity with h | h <;>
    simp only [Carrier.headArity_tombstone] at h <;> cases h

/-- Exact live and tombstone roots are disjoint independently of their data. -/
theorem live_ne_tombstone
    (liveBit tombstoneBit : Bool)
    (tail predecessor audit : Term) :
    .app (live liveBit) tail ≠
      Carrier.tombstone tombstoneBit predecessor audit :=
  Carrier.liveCell_ne_tombstone liveBit tombstoneBit tail predecessor audit

theorem localAccumulator?_live_none
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation : Term)
    (bit : Bool) (predecessor : Term) :
    localAccumulator? program tree bits continuation
      (.app (live bit) predecessor) = none := by
  generalize hparse : localAccumulator? program tree bits continuation
    (.app (live bit) predecessor) = parsed
  cases parsed with
  | none => rfl
  | some accumulator =>
      obtain ⟨dispatcher, shell, dispatch⟩ :=
        localAccumulator?_sound hparse
      exact False.elim (local_ne_live shell bit predecessor rfl)

theorem localAccumulator?_tombstone_none
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation : Term)
    (bit : Bool) (predecessor audit : Term) :
    localAccumulator? program tree bits continuation
      (Carrier.tombstone bit predecessor audit) = none := by
  generalize hparse : localAccumulator? program tree bits continuation
    (Carrier.tombstone bit predecessor audit) = parsed
  cases parsed with
  | none => rfl
  | some accumulator =>
      obtain ⟨dispatcher, shell, dispatch⟩ :=
        localAccumulator?_sound hparse
      exact False.elim (local_ne_tombstone shell bit predecessor audit rfl)

/-! ## Constructor correctness -/

/-- Every permissive mutation-closed Base returns its actual queue child. -/
@[simp]
theorem classify_permissiveBase
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation)
    (queue beta : Term) :
    classify program tree bits continuation hadmissible
      (MutableBase.base (compileActions program tree) bits continuation queue
        beta) = .base queue := by
  simp [classify]

/-- Every exact reachable mutable Base also returns its evolving queue child. -/
@[simp]
theorem classify_mutableBase
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation)
    (queue : Term) :
    classify program tree bits continuation hadmissible
      (MutableBase.mutableBase (compileActions program tree) bits continuation
        queue) = .base queue := by
  exact classify_permissiveBase program tree bits continuation hadmissible queue
    (baseBeta
      (environmentCode (compileActions program tree) bits) continuation)

/-- The literal initial Base remains classified by its encoded input word. -/
@[simp]
theorem classify_base
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation) :
    classify program tree bits continuation hadmissible
      (baseCarrier
        (environmentCode (compileActions program tree) bits) continuation) =
      .base (word bits) := by
  rw [← MutableBase.mutableBase_word]
  exact classify_mutableBase program tree bits continuation hadmissible
    (word bits)

theorem classify_local
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation)
    {dispatcher accumulator result : Term}
    (dispatch : DispatchParser.dispatchesTo program tree dispatcher accumulator)
    (shell : Carrier.LocalShell bits continuation dispatcher result) :
    classify program tree bits continuation hadmissible result =
      .local accumulator := by
  have hbase : MutableBase.parse? (compileActions program tree) bits
      continuation result = none := by
    generalize hparse : MutableBase.parse? (compileActions program tree) bits
      continuation result = parsed
    cases parsed with
    | none => rfl
    | some view =>
        exact False.elim (MutableBase.parsed_not_local hparse shell)
  simp [classify, hbase,
    localAccumulator?_complete shell dispatch]

theorem classify_live
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation)
    (bit : Bool) (predecessor : Term) :
    classify program tree bits continuation hadmissible
      (.app (live bit) predecessor) = .live bit predecessor := by
  have hbase : MutableBase.parse? (compileActions program tree) bits continuation
      (.app (live bit) predecessor) = none := by
    generalize hparse : MutableBase.parse? (compileActions program tree) bits
      continuation (.app (live bit) predecessor) = parsed
    cases parsed with
    | none => rfl
    | some view =>
        exact False.elim
          (parsedBase_ne_live _ bits hadmissible hparse bit predecessor rfl)
  simp [classify, hbase,
    localAccumulator?_live_none program tree bits continuation bit predecessor]

theorem classify_tombstone
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation)
    (bit : Bool) (audit predecessor : Term) :
    classify program tree bits continuation hadmissible
      (Carrier.tombstone bit predecessor audit) =
      .tombstone bit predecessor := by
  have hbase : MutableBase.parse? (compileActions program tree) bits continuation
      (Carrier.tombstone bit predecessor audit) = none := by
    generalize hparse : MutableBase.parse? (compileActions program tree) bits
      continuation (Carrier.tombstone bit predecessor audit) = parsed
    cases parsed with
    | none => rfl
    | some view =>
        exact False.elim
          (parsedBase_ne_tombstone _ bits hadmissible hparse bit
            predecessor audit rfl)
  simp [classify, hbase,
    localAccumulator?_tombstone_none program tree bits continuation bit
      predecessor audit]

/--
Local classification is unchanged when its halt, seed, and continuation audit
fields vary while its validated dispatcher and accumulator stay fixed.
-/
theorem classify_local_fields_independent
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation)
    {dispatcher accumulator firstResult secondResult : Term}
    (dispatch : DispatchParser.dispatchesTo program tree dispatcher accumulator)
    (firstShell : Carrier.LocalShell bits continuation dispatcher firstResult)
    (secondShell : Carrier.LocalShell bits continuation dispatcher secondResult) :
    classify program tree bits continuation hadmissible firstResult =
      classify program tree bits continuation hadmissible secondResult := by
  rw [classify_local program tree bits continuation hadmissible
      dispatch firstShell,
    classify_local program tree bits continuation hadmissible
      dispatch secondShell]

/-- Tombstone classification is independent of its uninspected audit field. -/
theorem classify_tombstone_audit_independent
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation)
    (bit : Bool) (firstAudit secondAudit predecessor : Term) :
    classify program tree bits continuation hadmissible
        (Carrier.tombstone bit predecessor firstAudit) =
      classify program tree bits continuation hadmissible
        (Carrier.tombstone bit predecessor secondAudit) := by
  rw [classify_tombstone program tree bits continuation hadmissible bit
      firstAudit predecessor,
    classify_tombstone program tree bits continuation hadmissible bit
      secondAudit predecessor]

/--
Any independent history list accepted by equation (8b) yields the same public
Local accumulator result; no history payload is compared here.
-/
theorem classify_local_of_route_action
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation)
    {route : Dispatcher.Route} {label : ActionLabel program}
    {response accumulator dispatcher result : Term}
    {histories : List Term}
    (routeShape : RouteGrammar.ActivatedRoute (selectedAction program) tree
      route label response dispatcher)
    (actionShape : ActionParser.ActionShape program label accumulator
      histories response)
    (shell : Carrier.LocalShell bits continuation dispatcher result) :
    classify program tree bits continuation hadmissible result =
      .local accumulator := by
  apply classify_local program tree bits continuation hadmissible
    (dispatcher := dispatcher)
  · exact ⟨route, label, response, histories, routeShape, actionShape⟩
  · exact shell

/-- The total executable classifier returns at most one branch/result. -/
theorem classify_deterministic
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation term : Term}
    {hadmissible : Carrier.Admissible continuation}
    {first second : Result}
    (hfirst : classify program tree bits continuation hadmissible term = first)
    (hsecond : classify program tree bits continuation hadmissible term = second) :
    first = second := by
  rw [hfirst] at hsecond
  exact hsecond

end CanonicalStep

end PureSFormal.PureS
