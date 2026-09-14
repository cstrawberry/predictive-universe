import PureSFormal.Research.RootResetEmptyResponseSelectorChain

/-!
# Empty response marking

A completed fresh Local with an empty accumulator selects its halt-field
COMMIT contraction.  The proof derives the complete selector priority from
the literal response shell and exact dispatcher provenance.
-/

namespace PureSFormal.Research.RootResetEmptyResponseCommit

open PureSFormal.PureS
open RootResetPersistentResponseSelector
open RootResetEmptyResponseSelectorChain

private theorem withResponse_chosen
    {Label : Type} (encode : Label → Term)
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    (path : Dispatcher.HasRoute tree route label) (carrier response : Term) :
    ∃ payload, PrimitiveRoute.withResponse encode tree route carrier response =
      chosen carrier payload := by
  cases path <;> exact ⟨_, rfl⟩

private theorem compileActions_ne_s_app
    (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (carrier : Term) : .app .s carrier ≠ compileActions program tree := by
  intro equal
  have arity := congrArg Term.headArity equal
  cases tree <;>
    simp [compileActions, compileDispatcher, leafCode, nodeCode, b] at arity

/-- Every exact completed empty response has the full selector's COMMIT
successor, without assumptions about competing parser branches. -/
theorem selectStep?_completed_empty
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool)
    (bits : List Bool) (continuation carrier : Term)
    (empty : CheckpointDecoder.decodeCarrier? program dispatcher.tree
      (actionAccumulator program (registers.phase, bit) carrier) = some []) :
    let route := SchedulerResponse.completedRoute program dispatcher registers bit carrier
    selectStep? program dispatcher (LocalResponse.completed bits continuation carrier route) =
      some (LocalResponse.markedCompleted bits continuation carrier route) := by
  dsimp only
  let route := SchedulerResponse.completedRoute program dispatcher registers bit carrier
  let source := LocalResponse.completed bits continuation carrier route
  let target := LocalResponse.markedCompleted bits continuation carrier route
  let view := CheckpointDecoder.completedView program
    (dispatcher.route (registers.phase, bit)) (registers.phase, bit)
    (actionAccumulator program (registers.phase, bit) carrier) bits continuation
  have dispatch := SchedulerResponse.completedRoute_snapshotDispatch program
    dispatcher registers bit carrier
  have parsed : CheckpointDecoder.parseLocal? program dispatcher.tree source =
      some view := CheckpointDecoder.parseLocal?_completed bits dispatch
  have fuelNone := fuelParse_none_of_localShape
    (CheckpointDecoder.localShape_completed (continuation := continuation) bits dispatch)
  have markedNone : RootResetReachableStageGrammar.parseMarkedLocal? program
      dispatcher.tree source = none := by
    rw [RootResetReachableStageGrammar.parseMarkedLocal?, parsed]
    rfl
  have freshNone := RootResetPersistentRouteA.parseFreshNonempty?_none_of_empty
    parsed (by rfl) empty
  have frameNone : RootResetReachableStageGrammar.parseFrameR0?
      (compileActions program dispatcher.tree) source = none := by
    cases frameParsed : RootResetReachableStageGrammar.parseFrameR0?
        (compileActions program dispatcher.tree) source with
    | none => rfl
    | some frameView =>
        have eq := RootResetReachableStageGrammar.parseFrameR0?_sound frameParsed
        have arity := congrArg Term.headArity eq
        simp [source, LocalResponse.completed, Carrier.activeShell, Carrier.shell,
          freshHField, haltCode, b, frame, environmentCode, dispatcherCode] at arity
  have pendingNone : RootResetStageRegistry.parsePending? source = none := by
    apply PendingFrame.guard?_none_of_function_headArity_ne_two
    change 5 ≠ 2
    decide
  have nextNone : RootResetPersistentRouteA.next? program dispatcher source = none := by
    rw [RootResetPersistentRouteA.next?, markedNone, freshNone]
    simp only [RootResetPersistentRouteA.parsePendingActive?, frameNone]
    rfl
  have activeEq : RootResetPersistentRouteA.activeContext program dispatcher source =
      ⟨source, .hole, [], [], []⟩ := by
    rw [RootResetPersistentRouteA.activeContext, nextNone]
  have fuelOuterEq : RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher
      source = ⟨source, .hole, [], [], []⟩ := by
    rw [RootResetPersistentRouteAFuel.fuelActiveContext, fuelNone, nextNone]
  have descentEq : responseDescentContext program dispatcher source =
      ⟨source, .hole, [], [], []⟩ := by
    rw [responseDescentContext, markedNone, freshNone, pendingNone]
  have outerEq : responseOuter program dispatcher source =
      ⟨source, .hole, [], [], []⟩ := by
    rw [responseOuter, fuelOuterEq]
    change composeActiveContexts _ (responseDescentContext program dispatcher source) = _
    rw [descentEq]
    rfl
  have freshRootNone : freshResponseRoot? program dispatcher source = none := by
    rw [freshResponseRoot?, activeEq]
    rfl
  have appenderNone : responseAppenderSelection? program dispatcher source = none := by
    rw [responseAppenderSelection?, responseAppenderAddress?, freshRootNone]
    rfl
  have carrierNone : responseCarrierSelection? program dispatcher source = none := by
    rw [responseCarrierSelection?, responseCarrierAddress?, freshRootNone]
    rfl
  obtain ⟨payload, routeEq⟩ := withResponse_chosen (selectedAction program)
    (dispatcher.route_valid (registers.phase, bit)) carrier
    (actionResult program (registers.phase, bit) carrier)
  change route = chosen carrier payload at routeEq
  have freshCallNone : parseFreshDispatcherCall? program dispatcher.tree source = false := by
    change parseFreshDispatcherCall? program dispatcher.tree
      (LocalResponse.completed bits continuation carrier route) = false
    rw [routeEq]
    simp [parseFreshDispatcherCall?, LocalResponse.completed, Carrier.activeShell,
      Carrier.shell, chosen, seedCode, compileActions_ne_s_app]
  have freshDispatcherNone : freshDispatcherSelection? program dispatcher source = none := by
    rw [freshDispatcherSelection?, outerEq]
    dsimp only
    rw [freshCallNone]
    rfl
  have completedAddress : completedResponseAddress? program dispatcher source =
      some [.left, .left, .left] := by
    rw [completedResponseAddress?, outerEq]
    dsimp only
    rw [RootResetWholeStageClassifier.classifyActive_commit_of_parse [] parsed]
    dsimp only
    rw [parsed]
    dsimp only [Bind.bind, Option.bind, view, CheckpointDecoder.completedView]
    rw [empty]
    rfl
  have boundaryAddress : responseBoundaryAddress? program dispatcher source =
      some [.left, .left, .left] := by
    rw [responseBoundaryAddress?, completedAddress]
  have contracted : source.contractAt? [.left, .left, .left] = some target := rfl
  have checked : checkedAt? source [.left, .left, .left] =
      some ⟨[.left, .left, .left], target⟩ := by
    rw [checkedAt?, RootResetPersistentRouteAFuel.checkedSelection?, contracted]
  have boundary : responseBoundarySelection? program dispatcher source =
      some ⟨[.left, .left, .left], target⟩ := by
    rw [responseBoundarySelection?, boundaryAddress]
    exact checked
  have noFuel : (RootResetPersistentRouteAFuel.classifyHandoff program dispatcher
      source).fuel = none := by
    rw [RootResetPersistentRouteAFuel.classifyHandoff, fuelOuterEq]
    dsimp only
    rw [fuelNone]
  change (classify program dispatcher source).selected?.map (·.target) = some target
  rw [classify, noFuel]
  simp only [classifyAfterFuel, freshDispatcherNone, appenderNone, carrierNone,
    boundary]
  rfl

/-- Every completed response in the exact initially empty sweep selects its
mark, for every sweep length and admissible continuation. -/
theorem selectStep?_generatedEmptySweep_commit
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (continuation : Term) (admissible : Carrier.Admissible continuation)
    (count : Nat) :
    let initial := SchedulerNestedEmpty.initialEmptyRegisters program
    let registers := SchedulerCycle.emptySweepRegisters program count initial
    let carrier := SchedulerCycle.emptySweepCarrier program dispatcher []
      continuation count initial
      (baseCarrier (environmentCode (compileActions program dispatcher.tree) [])
        continuation)
    let route := SchedulerResponse.completedRoute program dispatcher registers false carrier
    selectStep? program dispatcher (LocalResponse.completed [] continuation carrier route) =
      some (LocalResponse.markedCompleted [] continuation carrier route) := by
  dsimp only
  apply selectStep?_completed_empty
  exact CheckpointRun.decodeCarrier?_of_decode program dispatcher.tree [] continuation
    admissible (SchedulerNestedEmpty.emptySweepCarrier_decode program dispatcher
      continuation admissible count (SchedulerNestedEmpty.initialEmptyRegisters program))

/-- The generated COMMIT equation selects the literal sample of the actual
four-tick marker search, rather than only an independently displayed reduct. -/
theorem generatedEmptySweep_commit_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (continuation : Term) (admissible : Carrier.Admissible continuation)
    (count : Nat) :
    let initial := SchedulerNestedEmpty.initialEmptyRegisters program
    let registers := SchedulerCycle.emptySweepRegisters program count initial
    let carrier := SchedulerCycle.emptySweepCarrier program dispatcher []
      continuation count initial
      (baseCarrier (environmentCode (compileActions program dispatcher.tree) [])
        continuation)
    let source := SchedulerEmpty.markStartConfiguration program dispatcher registers
      [] continuation carrier []
    let sample := SchedulerRootContinuation.emptyMarkerMutationConfiguration program
      dispatcher registers [] continuation carrier []
    FiniteController.seekMutation (SchedulerControl.machine program dispatcher)
        4 source = some sample ∧
      RootResetExactTraceAgreement.SelectorChain (selectStep? program dispatcher)
        source [sample] := by
  dsimp only
  constructor
  · exact SchedulerRootContinuation.emptyMarkStart_seekMutation ..
  · refine .next ?_ (.done _)
    rw [SchedulerRootContinuation.emptyMarkerMutation_erase]
    exact selectStep?_generatedEmptySweep_commit program dispatcher continuation
      admissible count

end PureSFormal.Research.RootResetEmptyResponseCommit
