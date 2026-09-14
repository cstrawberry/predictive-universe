import PureSFormal.Research.RootResetRegisteredMarkerOccurrence

/-! A finite, read-only observer for a successful priority selection whose
literal selected redex has the fresh halt-field shape. No decoder is executed.
The rejected priority branch answers false; Euler fallback events are separate. -/
namespace PureSFormal.Research.RootResetFiniteMarkerObserver
open PureSFormal.PureS
open FiniteController RootResetProbeSequence RootResetCompletedResponseAgreement
open RootResetCompletedResponseAtoms RootResetPatternFragment
open RootResetFinitePrioritySelector

def markerPattern : Pattern := .app (RootResetCompletedLocalPatterns.literal haltCode) .hole

theorem markerPattern_iff (source : Term) :
    markerPattern.matchesBool source = true ↔
      (TermEvent.freshHaltPayload? source).isSome = true := by
  rw [RegisteredMarkerBridge.freshHaltPayload_isSome_iff]
  cases source with
  | s =>
    constructor
    · intro impossible; cases impossible
    · rintro ⟨payload, impossible⟩; cases impossible
  | app fn arg =>
    constructor
    · intro matched
      have fnMatched : (RootResetCompletedLocalPatterns.literal haltCode).matchesBool fn = true := by
        simpa only [markerPattern, Pattern.matchesBool, Bool.and_true] using matched
      have equal := (RootResetCompletedLocalPatterns.literal_matches haltCode fn).1 fnMatched
      exact ⟨arg, congrArg (fun value => Term.app value arg) equal⟩
    · rintro ⟨payload, equal⟩
      change Term.app fn arg = Term.app haltCode payload at equal
      have fnEq := (Term.app.inj equal).1
      change (RootResetCompletedLocalPatterns.literal haltCode).matchesBool fn && true = true
      rw [(RootResetCompletedLocalPatterns.literal_matches haltCode fn).2 fnEq]
      rfl

theorem markerPattern_eq (source : Term) :
    markerPattern.matchesBool source = (TermEvent.freshHaltPayload? source).isSome := by
  cases left : markerPattern.matchesBool source <;>
    cases right : (TermEvent.freshHaltPayload? source).isSome <;> try rfl
  · have impossible := (markerPattern_iff source).2 right
    rw [left] at impossible
    cases impossible
  · have impossible := (markerPattern_iff source).1 left
    rw [right] at impossible
    cases impossible

def shapeCode : Code := ProbeCompiler.compile markerPattern (.answer true) (.answer false)
def shapeWorker : Worker := codeWorker shapeCode
def shapeBound : Nat := ProbeCompiler.executionBound markerPattern

theorem shape_terminal : shapeWorker.Terminal := code_terminal shapeCode

theorem shape_readOnly : shapeWorker.ReadOnly :=
  code_readOnly shapeCode (ProbeCompiler.compile_noRdx markerPattern trivial trivial)

/-- A constant-bounded, origin-restoring literal shape test on every cursor. -/
theorem shape_runs (origin : Cursor) :
    ∃ ticks state, ticks ≤ shapeBound ∧
      run shapeWorker.machine ticks (shapeWorker.initial origin) = ⟨some state, origin⟩ ∧
      shapeWorker.answer? state = some (TermEvent.freshHaltPayload? origin.focus).isSome := by
  obtain ⟨member, actual⟩ := RootResetPatternFragment.compile_runs
    markerPattern (.answer true) (.answer false) shapeCode origin (fun _ h => h)
  rw [← markerPattern_eq]
  generalize readyEq : markerPattern.matchesBool origin.focus = ready at *
  cases ready <;>
    exact ⟨_, _, Nat.le_of_lt (ProbeCompiler.probeCost_lt_executionBound markerPattern origin.focus), actual, rfl⟩

def selectionWorker (program : CTS.Program) (layout : ActionDispatcher program) : Worker :=
  RootResetPriorityReplay.firstWorker (selectionSpec program layout)

def rejectWorker : Worker := codeWorker (.answer false)

def observer (program : CTS.Program) (layout : ActionDispatcher program) : Worker :=
  RootResetProbeBranch.worker (selectionWorker program layout) shapeWorker rejectWorker

def SelectedMarker (program : CTS.Program) (layout : ActionDispatcher program) (source : Term) : Prop :=
  ∃ endpoint, Executes (selectionWorker program layout) (Cursor.atRoot source) true endpoint ∧
    (TermEvent.freshHaltPayload? endpoint.focus).isSome = true

theorem observer_terminal (program : CTS.Program) (layout : ActionDispatcher program) :
    (observer program layout).Terminal := RootResetProbeBranch.terminal _ _ _

theorem observer_readOnly (program : CTS.Program) (layout : ActionDispatcher program) :
    (observer program layout).ReadOnly :=
  RootResetProbeBranch.readOnly _ _ _ (selectionSpec program layout).mutation_zero
    shape_readOnly (code_readOnly (.answer false) trivial)

theorem selection_result_iff (program : CTS.Program) (layout : ActionDispatcher program)
    (source : Term) (ticks : Nat) (state : SelectionControl program layout) (endpoint : Cursor)
    (ready : Bool)
    (actual : run (selectionWorker program layout).machine ticks
      ((selectionWorker program layout).initial (Cursor.atRoot source)) = ⟨some state, endpoint⟩)
    (answered : (selectionWorker program layout).answer? state = some ready) :
    (ready && (TermEvent.freshHaltPayload? endpoint.focus).isSome) = true ↔
      SelectedMarker program layout source := by
  constructor
  · intro yes
    rcases (Bool.and_eq_true _ _).mp yes with ⟨readyEq, marker⟩
    subst ready
    exact ⟨endpoint, ⟨ticks, state, actual, answered⟩, marker⟩
  · rintro ⟨other, ⟨otherTicks, otherState, otherRun, otherAnswer⟩, marker⟩
    have same := RootResetReadonlySelector.probe_terminal_unique (selectionSpec program layout)
      source ticks otherTicks state otherState endpoint other actual otherRun
      (by change ((selectionWorker program layout).answer? state).isSome = true; rw [answered]; rfl)
      (by change ((selectionWorker program layout).answer? otherState).isSome = true; rw [otherAnswer]; rfl)
    have stateEq : state = otherState := Option.some.inj (congrArg Configuration.control same)
    have endpointEq : endpoint = other := congrArg Configuration.cursor same
    subst otherState other
    have readyEq : ready = true := Option.some.inj (answered.symm.trans otherAnswer)
    rw [readyEq, marker]
    rfl

def bound (program : CTS.Program) (layout : ActionDispatcher program) (source : Term) : Nat :=
  (selectionSpec program layout).coefficient * (source.size + 1) + shapeBound + 2

/-- Total finite observation with an explicit linear bound and exact semantic
specification of both Boolean answers. Every run remains read-only. -/
theorem observer_all_input (program : CTS.Program) (layout : ActionDispatcher program) (source : Term) :
    ∃ ticks ready endpoint,
      ticks ≤ bound program layout source ∧
      run (observer program layout).machine ticks
        ((observer program layout).initial (Cursor.atRoot source)) = ⟨some (.done ready), endpoint⟩ ∧
      endpoint.erase = source ∧
      (ready = true ↔ SelectedMarker program layout source) := by
  obtain ⟨ticks, state, endpoint, bounded, actual, terminal, preserved, _⟩ :=
    (selectionSpec program layout).all_input source
  cases answer : (selectionSpec program layout).answer state with
  | none => rw [answer] at terminal; cases terminal
  | some ready =>
    have result := selection_result_iff program layout source ticks state endpoint ready actual answer
    obtain ⟨used, usedBound, tested⟩ := RootResetProbeBranch.testing_runs
      (selectionWorker program layout) shapeWorker rejectWorker
      (RootResetPriorityReplay.first_terminal (selectionSpec program layout))
      (Cursor.atRoot source) endpoint ticks state ready actual answer
    have paid := Nat.le_trans usedBound bounded
    cases ready with
    | false =>
      refine ⟨used + 1 + 1, false, endpoint, ?_, ?_, preserved, ?_⟩
      · unfold bound
        have total := Nat.add_le_add_right
          (Nat.le_trans paid (Nat.le_add_right
            ((selectionSpec program layout).coefficient * (source.size + 1)) shapeBound)) 2
        simpa only [Nat.add_assoc] using total
      · exact (run_add (RootResetProbeBranch.machine (selectionWorker program layout) shapeWorker rejectWorker) (used + 1) 1 _).trans
          (congrArg (run (RootResetProbeBranch.machine (selectionWorker program layout) shapeWorker rejectWorker) 1) tested)
      · simpa only [Bool.false_and] using result
    | true =>
      obtain ⟨shapeTicks, shapeState, shapeBounded, shapeRun, shapeAnswer⟩ := shape_runs endpoint
      obtain ⟨shapeUsed, shapeUsedBound, shaped⟩ := RootResetProbeBranch.positive_runs
        (selectionWorker program layout) shapeWorker rejectWorker shape_terminal endpoint endpoint
        shapeTicks shapeState (TermEvent.freshHaltPayload? endpoint.focus).isSome shapeRun shapeAnswer
      refine ⟨used + 1 + (shapeUsed + 1), (TermEvent.freshHaltPayload? endpoint.focus).isSome,
        endpoint, ?_, ?_, preserved, ?_⟩
      · unfold bound
        have total := Nat.add_le_add_right
          (Nat.add_le_add paid (Nat.le_trans shapeUsedBound shapeBounded)) 2
        simpa only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using total
      · exact (run_add (RootResetProbeBranch.machine (selectionWorker program layout) shapeWorker rejectWorker) (used + 1) (shapeUsed + 1) _).trans
          ((congrArg (run (RootResetProbeBranch.machine (selectionWorker program layout) shapeWorker rejectWorker) (shapeUsed + 1)) tested).trans shaped)
      · simpa only [Bool.true_and] using result

/-- A fixed-budget invocation of the concrete finite observer. The budget is
only used to name its terminal result; it is not stored in finite control. -/
def accepts? (program : CTS.Program) (layout : ActionDispatcher program) (source : Term) : Bool :=
  (((run (observer program layout).machine (bound program layout source)
    ((observer program layout).initial (Cursor.atRoot source))).control).bind
      (observer program layout).answer?).getD false

theorem accepts_iff (program : CTS.Program) (layout : ActionDispatcher program) (source : Term) :
    accepts? program layout source = true ↔ SelectedMarker program layout source := by
  obtain ⟨ticks, ready, endpoint, bounded, actual, _, result⟩ := observer_all_input program layout source
  have split : ticks + (bound program layout source - ticks) = bound program layout source :=
    Nat.add_sub_of_le bounded
  unfold accepts?
  rw [← split, run_add, actual]
  change (((run (RootResetProbeBranch.machine _ _ _) _ ⟨some (.done ready), endpoint⟩).control).bind _).getD false = true ↔ _
  rw [RootResetProbeBranch.done_absorbs]
  exact result

/-- Acceptance entails a literal marker occurrence on the actual full
root-selector run. No equality of erased next terms is used. -/
theorem accepted_actual_root_event (program : CTS.Program) (layout : ActionDispatcher program)
    (source : Term) (accepted : accepts? program layout source = true) :
    ∃ ticks, RootResetRegisteredMarkerOccurrence.performsMarkH? program layout
      (run (selectorContract program layout).machine ticks
        ((selectorContract program layout).initial source)) = true := by
  obtain ⟨endpoint, ⟨ticks, state, actual, answer⟩, marker⟩ :=
    (accepts_iff program layout source).1 accepted
  obtain ⟨used, _, selected⟩ := RootResetReadonlySelector.probe_runs
    (selectionSpec program layout) source ticks state endpoint actual
    (by change ((selectionWorker program layout).answer? state).isSome = true; rw [answer]; rfl)
  refine ⟨used + 1, ?_⟩
  change RootResetRegisteredMarkerOccurrence.performsMarkH? program layout
    (run (RootResetReadonlySelector.machine (selectionSpec program layout)) _
      (RootResetReadonlySelector.initial (selectionSpec program layout) source)) = true
  rw [run_add, selected]
  have handoff : run (RootResetReadonlySelector.machine (selectionSpec program layout)) 1
      ⟨some (.probe state), endpoint⟩ =
      RootResetRegisteredMarkerOccurrence.contractConfiguration program layout endpoint := by
    change (selectionSpec program layout).answer state = some true at answer
    simp only [run, step, RootResetReadonlySelector.machine, RootResetReadonlySelector.transition, answer]
    rfl
  rw [handoff]
  exact marker

theorem fresh_pass_accepts (program : CTS.Program) (layout : ActionDispatcher program)
    (source : Term) (endpoint : Cursor)
    (actual : Executes (RootResetFreshResponsePass.worker program layout.tree)
      (Cursor.atRoot source) true endpoint)
    (marker : (TermEvent.freshHaltPayload? endpoint.focus).isSome = true) :
    accepts? program layout source = true := by
  obtain ⟨ticks, state, execution, answer⟩ := actual
  obtain ⟨used, _, selected⟩ := RootResetPriorityReplay.first_selected
    (RootResetFreshResponsePass.probeSpec program layout.tree)
    (laterSpec program layout) source ticks state endpoint execution answer
  exact (accepts_iff program layout source).2 ⟨endpoint, ⟨used, .done true, selected, rfl⟩, marker⟩

end PureSFormal.Research.RootResetFiniteMarkerObserver
