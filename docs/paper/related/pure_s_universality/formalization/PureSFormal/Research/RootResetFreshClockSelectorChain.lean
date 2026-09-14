import PureSFormal.Research.RootResetEmptyContinuationSelector
import PureSFormal.Research.RootResetCompletedAppenderPriority
import PureSFormal.Research.RootResetGeneratedTraversableParents
import PureSFormal.Research.RootResetMarkedClockSelectorChain

/-!
# Clock selection after a fresh nonempty response

The actual completed response retains its fresh halt field while execution
enters its clock continuation. Completed appender parsing cannot preempt that
clock because its final Push focus is noncontractible; carrier and boundary
priorities are excluded from literal continuation roles and accumulator shape.
The construction-generated first normal response discharges these facts and
agrees through every clock contraction to stage two's first fuel-job launch.
-/

namespace PureSFormal.Research.RootResetFreshClockSelectorChain

open PureSFormal.PureS
open RootResetPersistentResponseSelector
open RootResetPersistentClockFuelAgreement
open RootResetAccumulatorClassifier
open RootResetResponseCarrierChronology
open RootResetReachableStageGrammar
open RootResetEmptyContinuationSelector
open RootResetEmptyHandoffContext
open RootResetEmptyPostMarkerHandoff
open RootResetMarkedFrameSelectorProof
open RootResetTraversableCompletedParents.TraversableParents

theorem prioritiesClear_of_recoveredOuter
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (source : Term) (outer : RootResetPersistentRouteA.ActiveContext program)
    (outerEq : RootResetPersistentResponseSelector.responseOuter program dispatcher source = outer)
    (activeEq : RootResetPersistentRouteA.activeContext program dispatcher source = outer)
    (localNone : CheckpointDecoder.parseLocal? program dispatcher.tree outer.active = none)
    (notSix : outer.active.headArity ≠ 6) (notTwo : outer.active.headArity ≠ 2)
    (responseAppenderNone : RootResetPersistentResponseSelector.responseAppenderSelection? program dispatcher source = none)
    (responseCarrierNone : RootResetPersistentResponseSelector.responseCarrierSelection? program dispatcher source = none)
    (responseBoundaryNone : RootResetPersistentResponseSelector.responseBoundarySelection? program dispatcher source = none)
    (noPendingMarked : RootResetPersistentResponseSelector.addressBeforePendingMarked? outer.roles = none) :
    RootResetResponseClockFuelAgreement.PrioritiesClear program dispatcher source := by
  rcases outer with ⟨term, context, address, roles, history⟩
  dsimp only at localNone notSix notTwo noPendingMarked
  have dispatcherAddressNone : RootResetPersistentResponseSelector.currentCarrierDispatcherAddress?
      program dispatcher source = none := by
    rw [RootResetPersistentResponseSelector.currentCarrierDispatcherAddress?, outerEq]
    dsimp only
    split
    next haltField dispatcherTerm seedPayload seedAudit nextContinuation
        continuationAudit =>
      cases haltEq : RootResetWholeDispatcherStages.parseFreshHalt? haltField with
      | none => rfl
      | some audit =>
          have haltSource := RootResetWholeDispatcherStages.parseFreshHalt?_sound haltEq
          apply False.elim
          apply notSix
          rw [haltSource]
          rfl
    next => rfl
  have actionAddressNone : RootResetPersistentResponseSelector.selectedActionAddress?
      program dispatcher source = none := by
    rw [RootResetPersistentResponseSelector.selectedActionAddress?, outerEq]
    dsimp only
    split
    next haltField dispatcherTerm seedPayload seedAudit nextContinuation
        continuationAudit =>
      cases haltEq : RootResetWholeDispatcherStages.parseFreshHalt? haltField with
      | none => rfl
      | some audit =>
          have haltSource := RootResetWholeDispatcherStages.parseFreshHalt?_sound haltEq
          apply False.elim
          apply notSix
          rw [haltSource]
          rfl
    next => rfl
  have appenderNone : RootResetWholeAppenderStages.parseActive? program dispatcher.tree
      term = none := by
    cases parsed : RootResetWholeAppenderStages.parseActive? program dispatcher.tree term with
    | none => rfl
    | some view =>
        have shape := RootResetWholeAppenderStages.parseActive?_sound parsed
        rcases shape.source_eq with
          ⟨haltField, dispatcherTerm, seedAudit, continuationAudit, halt, route, sourceEq⟩
        cases halt with
        | fresh audit =>
            apply False.elim
            apply notSix
            rw [sourceEq]
            rfl
  have noActivated : (RootResetWholeStageClassifier.classify program dispatcher.tree term).endpoint.stage ≠
      .activatedRoute := by
    have notMarked : RootResetReachableStageGrammar.parseMarkedLocal? program
        dispatcher.tree term = none := by
      rw [RootResetReachableStageGrammar.parseMarkedLocal?, localNone]
    have peeled : RootResetReachableStageGrammar.peelMarked program dispatcher.tree term =
        ⟨term, .hole, []⟩ := by
      rw [RootResetReachableStageGrammar.peelMarked, notMarked]
    intro classified
    rw [RootResetWholeStageClassifier.classify, peeled] at classified
    obtain ⟨route, parsed, _⟩ := RootResetWholeStageClassifier.classifyActive_activatedRoute_sound
      program dispatcher.tree [] term classified
    exact notTwo (DispatchParser.parseRouteDetailed_sound parsed).result_headArity
  constructor
  · rw [RootResetPersistentResponseSelector.freshDispatcherSelection?, outerEq]
    dsimp only
    cases parsed : RootResetPersistentResponseSelector.parseFreshDispatcherCall?
        program dispatcher.tree term with
    | false => rfl
    | true => exact False.elim (notSix
        (RootResetResponseClockFuelAgreement.parseFreshDispatcherCall?_headArity_six parsed))
  · exact responseAppenderNone
  · exact responseCarrierNone
  · exact responseBoundaryNone
  · rw [RootResetPersistentResponseSelector.markedHandoffSelection?, activeEq]
    dsimp only
    rw [noPendingMarked]
    rfl
  · rw [RootResetPersistentResponseSelector.dispatcherSelection?, dispatcherAddressNone]
    rfl
  · rw [RootResetPersistentResponseSelector.selectedActionSelection?, actionAddressNone]
    rfl
  · rw [RootResetPersistentResponseSelector.appenderSelection?, outerEq]
    dsimp only
    rw [appenderNone]
    rfl
  · rw [RootResetPersistentResponseSelector.activatedRouteSelection?,
      RootResetPersistentResponseSelector.activatedRouteAddress?, outerEq]
    dsimp only
    rw [if_neg noActivated]
    rfl

theorem analyze?_ordinary_live_none (bit : Bool) (predecessor : Term) :
    analyze? (.app (live bit) predecessor) = none := by
  cases bit <;> rfl

theorem tracks_arity {term : Term} {bits : List Bool} {addresses : List Address}
    (shape : Tracks term bits addresses) :
    term.headArity = 0 ∨ term.headArity = 2 ∨ term.headArity = 3 := by
  cases shape with
  | endpoint => exact Or.inl rfl
  | armed bit inner => exact Or.inr (Or.inr rfl)
  | opened bit audit inner => exact Or.inr (Or.inl rfl)
  | closed bit leftAudit rightAudit inner => exact Or.inr (Or.inl rfl)

theorem analyze?_none_of_arities (term : Term)
    (not0 : term.headArity ≠ 0) (not2 : term.headArity ≠ 2) (not3 : term.headArity ≠ 3) :
    analyze? term = none := by
  cases parsed : analyze? term with
  | none => rfl
  | some view =>
      rcases tracks_arity (analyze?_sound parsed) with zero | two | three
      · exact False.elim (not0 zero)
      · exact False.elim (not2 two)
      · exact False.elim (not3 three)

theorem analyze?_appenderAccumulator_none (bits : List Bool) (initial : Term)
    (rejected : analyze? initial = none) :
    analyze? (appenderAccumulator bits initial) = none := by
  induction bits generalizing initial with
  | nil => exact rejected
  | cons bit rest ih =>
      exact ih _ (analyze?_ordinary_live_none bit initial)

theorem firstCarrier_analyze_none (actions : Term) (bit : Bool) (suffix : List Bool)
    (continuation : Term) (admissible : Carrier.Admissible continuation) :
    analyze? (firstCarrier actions bit suffix continuation) = none := by
  apply analyze?_none_of_arities
  all_goals change continuation.headArity + 2 ≠ _
  all_goals rcases admissible with three | four
  all_goals first | (rw [three]; decide) | (rw [four]; decide)

theorem firstCarrier_action_classifier_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (label : ActionLabel program) (bit : Bool) (suffix : List Bool)
    (continuation : Term) (admissible : Carrier.Admissible continuation) :
    classify? (actionAccumulator program label
      (firstCarrier (compileActions program dispatcher.tree) bit suffix continuation)) = none := by
  have base := firstCarrier_analyze_none (compileActions program dispatcher.tree) bit suffix continuation admissible
  rw [classify?]
  rcases label with ⟨phase, chosen⟩
  cases chosen with
  | false => rw [actionAccumulator, base]
  | true =>
      rw [actionAccumulator, analyze?_appenderAccumulator_none _ _ base]


def freshTerm (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool)
    (bits : List Bool) (carrier endpoint : Term) : Term :=
  LocalResponse.completed bits endpoint carrier
    (SchedulerResponse.completedRoute program dispatcher registers bit carrier)

def freshView (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool)
    (bits : List Bool) (carrier endpoint : Term) : CheckpointDecoder.LocalView program :=
  CheckpointDecoder.completedView program (dispatcher.route (registers.phase, bit))
    (registers.phase, bit) (actionAccumulator program (registers.phase, bit) carrier) bits endpoint

def freshOuter (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool)
    (bits : List Bool) (carrier endpoint : Term) : RootResetPersistentRouteA.ActiveContext program :=
  ⟨endpoint, localContinuationContext (freshTerm program dispatcher registers bit bits carrier endpoint),
    [.right, .left], [.freshNonemptyContinuation],
    [freshView program dispatcher registers bit bits carrier endpoint]⟩

theorem freshTerm_parsed
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool)
    (bits : List Bool) (carrier endpoint : Term) :
    CheckpointDecoder.parseLocal? program dispatcher.tree
      (freshTerm program dispatcher registers bit bits carrier endpoint) =
      some (freshView program dispatcher registers bit bits carrier endpoint) :=
  parseLocal?_fresh program dispatcher registers bit bits endpoint carrier

theorem freshTerm_next
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool)
    (bits : List Bool) (carrier endpoint : Term)
    (nonempty : ∃ first rest, CheckpointDecoder.decodeCarrier? program dispatcher.tree
      (actionAccumulator program (registers.phase, bit) carrier) = some (first :: rest)) :
    RootResetPersistentRouteA.next? program dispatcher
      (freshTerm program dispatcher registers bit bits carrier endpoint) =
      some (RootResetPersistentRouteA.freshStep
        (freshTerm program dispatcher registers bit bits carrier endpoint)
        (freshView program dispatcher registers bit bits carrier endpoint)) := by
  have parsed := freshTerm_parsed program dispatcher registers bit bits carrier endpoint
  have markedNone : parseMarkedLocal? program dispatcher.tree
      (freshTerm program dispatcher registers bit bits carrier endpoint) = none := by
    rw [parseMarkedLocal?, parsed]
    rfl
  rw [RootResetPersistentRouteA.next?, markedNone]
  rw [show RootResetPersistentRouteA.parseFreshNonempty? program dispatcher.tree
      (freshTerm program dispatcher registers bit bits carrier endpoint) =
      some (freshView program dispatcher registers bit bits carrier endpoint) from
    parseFreshNonempty?_fresh program dispatcher registers bit bits endpoint carrier nonempty]

theorem freshTerm_contexts
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool)
    (bits : List Bool) (carrier endpoint : Term)
    (nonempty : ∃ first rest, CheckpointDecoder.decodeCarrier? program dispatcher.tree
      (actionAccumulator program (registers.phase, bit) carrier) = some (first :: rest))
    (activeRoot : RootResetPersistentRouteA.activeContext program dispatcher endpoint =
      ⟨endpoint, .hole, [], [], []⟩)
    (fuelRoot : RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher endpoint =
      ⟨endpoint, .hole, [], [], []⟩)
    (responseRoot : responseOuter program dispatcher endpoint =
      ⟨endpoint, .hole, [], [], []⟩) :
    RootResetPersistentRouteA.activeContext program dispatcher
        (freshTerm program dispatcher registers bit bits carrier endpoint) =
      freshOuter program dispatcher registers bit bits carrier endpoint ∧
    RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher
        (freshTerm program dispatcher registers bit bits carrier endpoint) =
      freshOuter program dispatcher registers bit bits carrier endpoint ∧
    responseOuter program dispatcher
        (freshTerm program dispatcher registers bit bits carrier endpoint) =
      freshOuter program dispatcher registers bit bits carrier endpoint := by
  have next := freshTerm_next program dispatcher registers bit bits carrier endpoint nonempty
  have fuelNone := RootResetEmptyResponseSelectorChain.fuelParse_none_of_localShape
    (CheckpointDecoder.parseLocal?_sound
      (freshTerm_parsed program dispatcher registers bit bits carrier endpoint))
  have fuelEq : RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher
      (freshTerm program dispatcher registers bit bits carrier endpoint) =
      freshOuter program dispatcher registers bit bits carrier endpoint := by
    rw [RootResetPersistentRouteAFuel.fuelActiveContext, fuelNone, next]
    dsimp only [RootResetPersistentRouteA.freshStep, freshView, CheckpointDecoder.completedView]
    rw [fuelRoot]
    simp only [RootResetPersistentRouteA.wrapOuter, freshOuter,
      RootResetRuntimeContextBridge.context_comp_hole, List.append_nil]
    rfl
  constructor
  · rw [RootResetPersistentRouteA.activeContext, next]
    dsimp only [RootResetPersistentRouteA.freshStep, freshView, CheckpointDecoder.completedView]
    rw [activeRoot]
    simp only [RootResetPersistentRouteA.wrapOuter, freshOuter,
      RootResetRuntimeContextBridge.context_comp_hole, List.append_nil]
    rfl
  constructor
  · exact fuelEq
  · have descent : responseDescentContext program dispatcher endpoint =
        ⟨endpoint, .hole, [], [], []⟩ := by
      rw [responseOuter, fuelRoot] at responseRoot
      simpa only [composeActiveContexts, Context.comp, List.nil_append] using responseRoot
    rw [responseOuter, fuelEq]
    dsimp only [freshOuter]
    rw [descent]
    simp only [composeActiveContexts, freshOuter,
      RootResetRuntimeContextBridge.context_comp_hole, List.append_nil]


theorem freshTerm_selectStep_of_clockEndpoint
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool)
    (bits : List Bool) (carrier endpoint target : Term) (address : Address)
    (nonempty : ∃ first rest, CheckpointDecoder.decodeCarrier? program dispatcher.tree
      (actionAccumulator program (registers.phase, bit) carrier) = some (first :: rest))
    (classifierNone : RootResetAccumulatorClassifier.classify?
      (actionAccumulator program (registers.phase, bit) carrier) = none)
    (activeRoot : RootResetPersistentRouteA.activeContext program dispatcher endpoint =
      ⟨endpoint, .hole, [], [], []⟩)
    (fuelRoot : RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher endpoint =
      ⟨endpoint, .hole, [], [], []⟩)
    (responseRoot : responseOuter program dispatcher endpoint =
      ⟨endpoint, .hole, [], [], []⟩)
    (stopped : RootResetPersistentRouteA.next? program dispatcher endpoint = none)
    (fuelNone : RootResetPersistentFuelCarrier.parse? (compileActions program dispatcher.tree) endpoint = none)
    (localNone : CheckpointDecoder.parseLocal? program dispatcher.tree endpoint = none)
    (notSix : endpoint.headArity ≠ 6) (notTwo : endpoint.headArity ≠ 2)
    (noFinalRegistry : ∀ view : RootResetWholeAppenderStages.View program,
      RootResetTwentySevenStageRegistry.parse? program dispatcher endpoint =
        some (.registered (.appender view)) → view.stage ≠ .secondFinal)
    (selected : RouteA.Selects program dispatcher endpoint target address) :
    selectStep? program dispatcher
      (freshTerm program dispatcher registers bit bits carrier endpoint) =
      some ((localContinuationContext
        (freshTerm program dispatcher registers bit bits carrier endpoint)).plug target) := by
  let source := freshTerm program dispatcher registers bit bits carrier endpoint
  let outer := freshOuter program dispatcher registers bit bits carrier endpoint
  have recovered := freshTerm_contexts program dispatcher registers bit bits carrier endpoint
    nonempty activeRoot fuelRoot responseRoot
  have freshRoot : freshResponseRoot? program dispatcher source = some ([], source) := by
    rw [freshResponseRoot?, recovered.1]
    rfl
  have noBaseFinal : ∀ view : RootResetWholeAppenderStages.View program,
      (RootResetPersistentRouteAFuel.classifyHandoff program dispatcher source).route.endpoint =
        some (.registered (.appender view)) → view.stage ≠ .secondFinal := by
    intro view parsed
    rw [RootResetPersistentRouteAFuel.classifyHandoff, recovered.2.1] at parsed
    dsimp only [freshOuter] at parsed
    rw [fuelNone] at parsed
    dsimp only at parsed
    rw [RootResetPersistentRouteA.classify, recovered.1] at parsed
    exact noFinalRegistry view parsed
  have appenderNone := RootResetCompletedAppenderPriority.responseAppenderSelection_none_of_completed_noPending
    program dispatcher source source [] freshRoot rfl
    (freshView program dispatcher registers bit bits carrier endpoint)
    (freshTerm_parsed program dispatcher registers bit bits carrier endpoint)
    (by rw [recovered.1]; rfl) noBaseFinal
  have carrierNone : responseCarrierSelection? program dispatcher source = none := by
    rw [responseCarrierSelection?, responseCarrierAddress?, freshRoot]
    dsimp only [Option.bind]
    rw [recovered.1]
    rfl
  have boundaryNone : responseBoundarySelection? program dispatcher source = none := by
    rw [responseBoundarySelection?, responseBoundaryAddress?,
      RootResetResponseClockFuelAgreement.completedResponseAddress?_none_of_outer_parseLocal_none
        recovered.2.2 localNone, freshRoot]
    dsimp only [Option.bind]
    rw [RootResetResponseBoundaryStages.parseActive?, freshTerm_parsed]
    dsimp only [freshView, CheckpointDecoder.completedView]
    rw [if_pos rfl, classifierNone]
  have clear := prioritiesClear_of_recoveredOuter program dispatcher source outer recovered.2.2 recovered.1
    localNone notSix notTwo appenderNone carrierNone boundaryNone (by rfl)
  rw [RootResetResponseClockFuelAgreement.selectStep?_eq_persistent_of_prioritiesClear clear]
  have shape := RootResetPersistentRouteA.activeContext_sound program dispatcher source
  rw [recovered.1] at shape
  have lifted := RootResetWholeStageClassifier.contractAt?_plug_append
    outer.context address selected.2
  have sourceEq : outer.context.plug endpoint = source := shape.source_eq
  have addressEq : RootResetSelectorContract.contextAddress outer.context = outer.address :=
    shape.contextAddress_eq
  rw [sourceEq, addressEq] at lifted
  unfold RootResetPersistentSelector.selectStep? RootResetPersistentSelector.selection?
    RootResetPersistentRouteAFuel.classifyHandoff
  rw [recovered.2.1]
  dsimp only [freshOuter]
  rw [fuelNone]
  dsimp only
  rw [routeAddress_of_recoveredOuter program dispatcher source outer recovered.1 stopped address selected.1]
  unfold RootResetPersistentRouteAFuel.checkedSelection?
  dsimp only
  rw [lifted]
  rfl

theorem freshTerm_selectStep_exit
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool)
    (bits exitBits : List Bool) (carrier : Term)
    (horizon remaining : Nat) (bound : remaining ≤ horizon)
    (nonempty : ∃ first rest, CheckpointDecoder.decodeCarrier? program dispatcher.tree
      (actionAccumulator program (registers.phase, bit) carrier) = some (first :: rest))
    (classifierNone : RootResetAccumulatorClassifier.classify?
      (actionAccumulator program (registers.phase, bit) carrier) = none) :
    selectStep? program dispatcher
      (freshTerm program dispatcher registers bit bits carrier
        (exitTerm program dispatcher horizon remaining exitBits)) =
      some ((localContinuationContext
        (freshTerm program dispatcher registers bit bits carrier
          (exitTerm program dispatcher horizon remaining exitBits))).plug
            (exitTarget program dispatcher horizon exitBits remaining)) := by
  have roots := exit_contexts program dispatcher horizon remaining exitBits bound
  apply freshTerm_selectStep_of_clockEndpoint program dispatcher registers bit bits carrier
    _ _ (exitAddress remaining) nonempty classifierNone roots.1 roots.2.1 roots.2.2
    (exit_next_none program dispatcher horizon remaining exitBits)
    (exit_fuel_none program dispatcher horizon remaining exitBits bound)
    (exit_local_none program dispatcher horizon remaining exitBits)
    (exit_not_six program dispatcher horizon remaining exitBits)
    (exit_not_two program dispatcher horizon remaining exitBits)
  · intro view parsed
    rw [exit_registry_exact program dispatcher horizon remaining exitBits bound] at parsed
    cases parsed
  · exact exit_route_selects program dispatcher horizon remaining exitBits bound


/-- At a terminal fresh response, the selected clock contractum is exactly
the next-stage scheduler's first sampled configuration. -/
theorem freshReturn_selectStep_nextStageFirst
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool)
    (bits : List Bool) (carrier : Term) (stage : Nat)
    (nonempty : ∃ first rest, CheckpointDecoder.decodeCarrier? program dispatcher.tree
      (actionAccumulator program (registers.phase, bit) carrier) = some (first :: rest))
    (classifierNone : RootResetAccumulatorClassifier.classify?
      (actionAccumulator program (registers.phase, bit) carrier) = none) :
    selectStep? program dispatcher
      (SchedulerResponse.returnConfiguration program dispatcher registers bit bits
        (Dovetail.clockExit stage 0 (environmentCode (compileActions program dispatcher.tree) bits))
        carrier []).cursor.erase =
      some (SchedulerRootContinuation.nextStageFirstMutationConfiguration program dispatcher stage
        (environmentCode (compileActions program dispatcher.tree) bits)
        (SchedulerRootContinuation.freshContinuationParents program dispatcher registers bit bits carrier [])).cursor.erase := by
  have selected := freshTerm_selectStep_exit program dispatcher registers bit bits bits carrier stage 0
    (Nat.zero_le stage) nonempty classifierNone
  change selectStep? program dispatcher (freshTerm program dispatcher registers bit bits carrier
      (exitTerm program dispatcher stage 0 bits)) = _
  rw [selected]
  apply congrArg some
  rw [SchedulerRootContinuation.nextStageFirstMutationConfiguration,
    RootResetMarkedClockSelectorChain.positiveClock_erase_rebuild]
  rfl

/-- The actual first normal response has both the public nonempty decoder
fact and the structural exclusion needed for the following clock. -/
theorem firstResponseTrace_freshClock_facts
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (fuel : Nat)
    {outerContext fullContext innerContext targetContext : Context} {ascentTicks : Nat}
    (trace : SchedulerCycle.FirstResponseTrace program dispatcher bit suffix fuel
      outerContext fullContext innerContext targetContext ascentTicks)
    (nonempty : (CTS.absorbingStep program ⟨CTS.zeroPhase program, bit :: suffix⟩).data ≠ []) :
    (∃ first rest, CheckpointDecoder.decodeCarrier? program dispatcher.tree
      (actionAccumulator program ((SchedulerCycle.responseRegisters program bit suffix).phase, bit)
        (SchedulerCycle.deletedCarrier bit outerContext innerContext)) = some (first :: rest)) ∧
    RootResetAccumulatorClassifier.classify?
      (actionAccumulator program ((SchedulerCycle.responseRegisters program bit suffix).phase, bit)
        (SchedulerCycle.deletedCarrier bit outerContext innerContext)) = none := by
  have actionDecoded := CarrierActionDecode.decode_actionAccumulator_eq_CTS program dispatcher.tree
    (bit :: suffix) (Dovetail.clockExit (fuel + 1) fuel
      (environmentCode (compileActions program dispatcher.tree) (bit :: suffix)))
    (Dovetail.clockExit_admissible (fuel + 1) fuel
      (environmentCode (compileActions program dispatcher.tree) (bit :: suffix)))
    (SchedulerCycle.responseRegisters program bit suffix).phase bit trace.targetDecode
  have publicDecoded := CheckpointRun.decodeCarrier?_of_decode program dispatcher.tree
    (bit :: suffix) (Dovetail.clockExit (fuel + 1) fuel
      (environmentCode (compileActions program dispatcher.tree) (bit :: suffix)))
    (Dovetail.clockExit_admissible (fuel + 1) fuel
      (environmentCode (compileActions program dispatcher.tree) (bit :: suffix))) actionDecoded
  constructor
  · rw [SchedulerCycle.responseRegisters_phase] at publicDecoded
    cases outputEq : (CTS.absorbingStep program ⟨CTS.zeroPhase program, bit :: suffix⟩).data with
    | nil => exact False.elim (nonempty outputEq)
    | cons first rest =>
        rw [outputEq] at publicDecoded
        exact ⟨first, rest, by simpa only [SchedulerCycle.responseRegisters_phase] using publicDecoded⟩
  · rw [firstResponseTrace_carrier program dispatcher bit suffix fuel trace]
    exact firstCarrier_action_classifier_none program dispatcher _ bit suffix _
      (Dovetail.clockExit_admissible (fuel + 1) fuel
        (environmentCode (compileActions program dispatcher.tree) (bit :: suffix)))

/-- The first nonempty CTS successor selects the real first clock contraction
of stage two, with no parser or traversal premises left to discharge. -/
theorem firstReturn_selectStep_nextStageFirst
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool)
    {outerContext fullContext innerContext targetContext : Context} {ascentTicks : Nat}
    (trace : SchedulerCycle.FirstResponseTrace program dispatcher bit suffix 0
      outerContext fullContext innerContext targetContext ascentTicks)
    (nonempty : (CTS.absorbingStep program ⟨CTS.zeroPhase program, bit :: suffix⟩).data ≠ []) :
    selectStep? program dispatcher
      (SchedulerCycle.firstReturnConfiguration program dispatcher bit suffix 0 outerContext innerContext).cursor.erase =
      some (SchedulerRootContinuation.nextStageFirstMutationConfiguration program dispatcher 1
        (environmentCode (compileActions program dispatcher.tree) (bit :: suffix))
        (SchedulerRootContinuation.freshContinuationParents program dispatcher
          (SchedulerCycle.responseRegisters program bit suffix) bit (bit :: suffix)
          (SchedulerCycle.deletedCarrier bit outerContext innerContext) [])).cursor.erase := by
  have facts := firstResponseTrace_freshClock_facts program dispatcher bit suffix 0 trace nonempty
  exact freshReturn_selectStep_nextStageFirst program dispatcher
    (SchedulerCycle.responseRegisters program bit suffix) bit (bit :: suffix)
    (SchedulerCycle.deletedCarrier bit outerContext innerContext) 1 facts.1 facts.2


open RootResetResponseClockFuelAgreement
open RootResetClockFuelStages
open RootResetMarkedClockSelectorChain
open SchedulerInvariant

theorem freshTerm_selectStep_postPositive
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool)
    (bits clockBits : List Bool) (carrier : Term)
    (stage wrappers remaining : Nat) (balance : wrappers + 1 + remaining = stage)
    (nonempty : ∃ first rest, CheckpointDecoder.decodeCarrier? program dispatcher.tree
      (actionAccumulator program (registers.phase, bit) carrier) = some (first :: rest))
    (classifierNone : RootResetAccumulatorClassifier.classify?
      (actionAccumulator program (registers.phase, bit) carrier) = none)
    {target : Term} {address : Address}
    (selected : RouteA.Selects program dispatcher
      (clockPostPositiveTerm program dispatcher stage wrappers remaining clockBits) target address) :
    selectStep? program dispatcher
      (freshTerm program dispatcher registers bit bits carrier
        (clockPostPositiveTerm program dispatcher stage wrappers remaining clockBits)) =
      some ((localContinuationContext
        (freshTerm program dispatcher registers bit bits carrier
          (clockPostPositiveTerm program dispatcher stage wrappers remaining clockBits))).plug target) := by
  apply freshTerm_selectStep_of_clockEndpoint program dispatcher registers bit bits carrier
    _ _ address nonempty classifierNone
    (activeContext_clockPostPositive program dispatcher stage wrappers remaining clockBits)
    (fuelActiveContext_clockPostPositive program dispatcher stage wrappers remaining clockBits balance)
    (responseOuter_clockPostPositive program dispatcher stage wrappers remaining clockBits balance)
    (next?_clockPostPositive_none program dispatcher stage wrappers remaining clockBits)
    (parseFuelHandoff?_canonicalClock_none (by cases remaining <;> rfl)
      (clockPostPositive_canonical program dispatcher stage wrappers remaining clockBits balance))
    (parseLocal?_clockPostPositive_none program dispatcher stage wrappers remaining clockBits)
    (by simp [clockPostPositiveTerm, clockGrowthCore, clockWrap])
    (clockPostPositiveTerm_headArity_ne_two program dispatcher stage wrappers remaining clockBits)
  · intro view parsed
    rw [parseTwentySeven?_clockPostPositive program dispatcher stage wrappers remaining clockBits balance] at parsed
    cases parsed
  · exact selected

theorem positiveClockMutation_fresh_selects_next
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers clockRegisters : SchedulerControl.Registers program) (bit : Bool)
    (bits clockBits : List Bool) (carrier : Term)
    (stage wrappers remaining : Nat) (balance : wrappers + remaining + 1 = stage)
    (nonempty : ∃ first rest, CheckpointDecoder.decodeCarrier? program dispatcher.tree
      (actionAccumulator program (registers.phase, bit) carrier) = some (first :: rest))
    (classifierNone : RootResetAccumulatorClassifier.classify?
      (actionAccumulator program (registers.phase, bit) carrier) = none) :
    let parents := SchedulerRootContinuation.freshContinuationParents program dispatcher registers bit bits carrier []
    selectStep? program dispatcher
      (positiveClockMutationConfiguration program dispatcher clockRegisters stage wrappers remaining
        (.left (environmentCode (compileActions program dispatcher.tree) clockBits) :: parents)).cursor.erase =
      some (nextClockSample program dispatcher clockRegisters stage wrappers clockBits parents remaining).cursor.erase := by
  dsimp only
  have postBalance : wrappers + 1 + remaining = stage := by
    calc
      wrappers + 1 + remaining = wrappers + remaining + 1 := by
        rw [Nat.add_assoc, Nat.add_comm 1 remaining, ← Nat.add_assoc]
      _ = stage := balance
  have route := positiveClockSample_routeA program dispatcher clockRegisters stage wrappers remaining clockBits balance
  rw [positiveClockMutation_erase_eq_clockPostPositiveTerm] at route
  have selected := freshTerm_selectStep_postPositive program dispatcher registers bit bits clockBits carrier
    stage wrappers remaining postBalance nonempty classifierNone route
  rw [positiveClock_erase_rebuild, nextClockSample_erase_rebuild]
  exact selected

theorem clockFirst_fresh_selects_first
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers clockRegisters : SchedulerControl.Registers program) (bit : Bool)
    (bits clockBits : List Bool) (carrier : Term) (stage : Nat)
    (nonempty : ∃ first rest, CheckpointDecoder.decodeCarrier? program dispatcher.tree
      (actionAccumulator program (registers.phase, bit) carrier) = some (first :: rest))
    (classifierNone : RootResetAccumulatorClassifier.classify?
      (actionAccumulator program (registers.phase, bit) carrier) = none) :
    let parents := SchedulerRootContinuation.freshContinuationParents program dispatcher registers bit bits carrier []
    selectStep? program dispatcher
      (clockPhaseSourceConfiguration program dispatcher clockRegisters
        (.left (environmentCode (compileActions program dispatcher.tree) clockBits) :: parents) (stage + 1)).cursor.erase =
      some (positiveClockMutationConfiguration program dispatcher clockRegisters (stage + 1) 0 stage
        (.left (environmentCode (compileActions program dispatcher.tree) clockBits) :: parents)).cursor.erase := by
  dsimp only
  have selected := freshTerm_selectStep_exit program dispatcher registers bit bits clockBits carrier stage 0
    (Nat.zero_le stage) nonempty classifierNone
  change selectStep? program dispatcher (freshTerm program dispatcher registers bit bits carrier
      (exitTerm program dispatcher stage 0 clockBits)) = _
  rw [selected]
  apply congrArg some
  rw [positiveClock_erase_rebuild]
  rfl


/-- One fresh completed continuation layer whose literal action output is
nonempty and outside the progress-boundary language. -/
inductive FreshClockParents (program : CTS.Program) (dispatcher : ActionDispatcher program) :
    List ParentFrame → Prop where
  | fresh (registers : SchedulerControl.Registers program) (bit : Bool)
      (bits : List Bool) (carrier : Term)
      (nonempty : ∃ first rest, CheckpointDecoder.decodeCarrier? program dispatcher.tree
        (actionAccumulator program (registers.phase, bit) carrier) = some (first :: rest))
      (classifierNone : RootResetAccumulatorClassifier.classify?
        (actionAccumulator program (registers.phase, bit) carrier) = none) :
      FreshClockParents program dispatcher
        (SchedulerRootContinuation.freshContinuationParents program dispatcher registers bit bits carrier [])

theorem positiveClockMutation_freshParents_selects_next
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (stage wrappers remaining : Nat) (balance : wrappers + remaining + 1 = stage)
    (outerParents : List ParentFrame) (shape : FreshClockParents program layout outerParents) :
    selectStep? program layout
      (positiveClockMutationConfiguration program layout registers stage wrappers remaining
        (.left (environmentCode (compileActions program layout.tree) bits) :: outerParents)).cursor.erase =
      some (nextClockSample program layout registers stage wrappers bits outerParents remaining).cursor.erase := by
  cases shape with
  | fresh previousRegisters bit previousBits carrier nonempty classifierNone =>
      exact positiveClockMutation_fresh_selects_next program layout previousRegisters registers bit
        previousBits bits carrier stage wrappers remaining balance nonempty classifierNone

theorem clockFirst_freshParents_selects_first
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program) (stage : Nat)
    (outerParents : List ParentFrame) (shape : FreshClockParents program layout outerParents) :
    selectStep? program layout
      (clockPhaseSourceConfiguration program layout registers
        (.left (environmentCode (compileActions program layout.tree) bits) :: outerParents) (stage + 1)).cursor.erase =
      some (positiveClockMutationConfiguration program layout registers (stage + 1) 0 stage
        (.left (environmentCode (compileActions program layout.tree) bits) :: outerParents)).cursor.erase := by
  cases shape with
  | fresh previousRegisters bit previousBits carrier nonempty classifierNone =>
      exact clockFirst_fresh_selects_first program layout previousRegisters registers bit
        previousBits bits carrier stage nonempty classifierNone

theorem clockCompleted_freshParents_selects_launch
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program) (fuel : Nat)
    (outerParents : List ParentFrame) (shape : FreshClockParents program layout outerParents) :
    selectStep? program layout
      (clockPhaseCompletedConfiguration program layout registers (fuel + 1)
        (.left (environmentCode (compileActions program layout.tree) bits) :: outerParents)).cursor.erase =
      some (SchedulerNestedPhase.positiveStageLaunchConfigurationAt program layout fuel
        (environmentCode (compileActions program layout.tree) bits) outerParents).cursor.erase := by
  cases shape with
  | fresh previousRegisters bit previousBits carrier nonempty classifierNone =>
      have selected := freshTerm_selectStep_exit program layout previousRegisters bit previousBits bits
        carrier (fuel + 1) (fuel + 1) (Nat.le_refl _) nonempty classifierNone
      rw [clockPhaseCompleted_erase]
      exact selected
theorem clockTail_freshSelectorChain
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (stage : Nat)
    (outerParents : List ParentFrame)
    (shape : FreshClockParents program layout outerParents) : ∀ wrappers remaining,
    wrappers + remaining + 1 = stage →
      RootResetExactTraceAgreement.SelectorChain
        (RootResetPersistentResponseSelector.selectStep? program layout)
        (positiveClockMutationConfiguration program layout registers stage
          wrappers remaining
          (.left (environmentCode (compileActions program layout.tree) bits) :: outerParents))
        (SchedulerNestedPhase.clockTailConfigurationsAt program layout bits
          registers stage outerParents wrappers remaining)
  | wrappers, 0, balance => by
      let closing := zeroClockMutationConfiguration program layout registers stage
        (wrappers + 1)
        (.left (environmentCode (compileActions program layout.tree) bits) :: outerParents)
      have selected := positiveClockMutation_freshParents_selects_next program layout
        bits registers stage wrappers 0 (by simpa only [Nat.add_zero] using balance) outerParents shape
      have selected' : RootResetPersistentResponseSelector.selectStep? program
          layout
          (positiveClockMutationConfiguration program layout registers stage
            wrappers 0
            (.left (environmentCode (compileActions program layout.tree) bits) :: outerParents)).cursor.erase =
        some closing.cursor.erase := by
        simpa [nextClockSample, closing] using selected
      simpa [SchedulerNestedPhase.clockTailConfigurationsAt, closing] using
        (RootResetExactTraceAgreement.SelectorChain.next selected'
          (RootResetExactTraceAgreement.SelectorChain.done closing))
  | wrappers, remaining + 1, balance => by
      let next := positiveClockMutationConfiguration program layout registers stage
        (wrappers + 1) remaining
        (.left (environmentCode (compileActions program layout.tree) bits) :: outerParents)
      have selected := positiveClockMutation_freshParents_selects_next program layout
        bits registers stage wrappers (remaining + 1) balance outerParents shape
      have selected' : RootResetPersistentResponseSelector.selectStep? program
          layout
          (positiveClockMutationConfiguration program layout registers stage
            wrappers (remaining + 1)
            (.left (environmentCode (compileActions program layout.tree) bits) :: outerParents)).cursor.erase =
        some next.cursor.erase := by
        simpa [nextClockSample, next] using selected
      have tailBalance : wrappers + 1 + remaining + 1 = stage := by
        calc
          wrappers + 1 + remaining + 1 =
              (wrappers + (1 + remaining)) + 1 := by
                rw [Nat.add_assoc wrappers 1 remaining]
          _ = (wrappers + (remaining + 1)) + 1 := by
                rw [Nat.add_comm 1 remaining]
          _ = wrappers + (remaining + 1) + 1 := rfl
          _ = stage := balance
      have tail := clockTail_freshSelectorChain program layout bits registers
        stage outerParents shape (wrappers + 1) remaining tailBalance
      simpa [SchedulerNestedPhase.clockTailConfigurationsAt, next] using
        (RootResetExactTraceAgreement.SelectorChain.next selected' tail)

theorem clock_freshSelectorChain
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (stage : Nat)
    (outerParents : List ParentFrame)
    (shape : FreshClockParents program layout outerParents) :
    RootResetExactTraceAgreement.SelectorChain
      (RootResetPersistentResponseSelector.selectStep? program layout)
      (clockPhaseSourceConfiguration program layout registers
        (.left (environmentCode (compileActions program layout.tree) bits) :: outerParents)
        (stage + 1))
      (SchedulerNestedPhase.clockConfigurationsAt program layout bits registers
        outerParents stage) := by
  let first := positiveClockMutationConfiguration program layout registers
    (stage + 1) 0 stage
    (.left (environmentCode (compileActions program layout.tree) bits) :: outerParents)
  have selected := clockFirst_freshParents_selects_first program layout bits registers stage outerParents shape
  have selected' : RootResetPersistentResponseSelector.selectStep? program layout
        (clockPhaseSourceConfiguration program layout registers
          (.left (environmentCode (compileActions program layout.tree) bits) :: outerParents) (stage + 1)).cursor.erase =
      some first.cursor.erase := by
    simpa [clockPhaseSourceConfiguration, positiveClockSourceConfiguration,
      clockFirstTerm, first] using selected
  have tail := clockTail_freshSelectorChain program layout bits registers
    (stage + 1) outerParents shape 0 stage (by simp)
  simpa [SchedulerNestedPhase.clockConfigurationsAt, first] using
    (RootResetExactTraceAgreement.SelectorChain.next selected' tail)


theorem clockLaunch_fresh_exact_selectorChain
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program) (fuel : Nat)
    (outerParents : List ParentFrame)
    (shape : FreshClockParents program layout outerParents) :
    let environment := environmentCode (compileActions program layout.tree) bits
    let source := clockPhaseSourceConfiguration program layout registers (.left environment :: outerParents) (fuel + 1)
    let launch := SchedulerNestedPhase.positiveStageLaunchConfigurationAt program layout fuel environment outerParents
    let samples := SchedulerNestedPhase.clockConfigurationsAt program layout bits registers outerParents fuel ++ [launch]
    SchedulerResponseInvariant.ExactMutationChain (SchedulerControl.machine program layout) launch source samples ∧
      RootResetExactTraceAgreement.SelectorChain (selectStep? program layout) source samples := by
  dsimp only
  have clockChain := SchedulerNestedPhase.clockExactMutationChainAt program layout bits registers outerParents fuel
  have clockSelected := clock_freshSelectorChain program layout bits registers fuel outerParents shape
  have found := SchedulerNestedPhase.clockCompleted_seekLaunchAt program layout registers fuel bits outerParents
  have launchChain := SchedulerResponseInvariant.ExactMutationChain.next _ found
    (SchedulerResponseInvariant.ExactMutationChain.done 0 ⟨rfl, rfl⟩)
  have launchSelected := RootResetExactTraceAgreement.SelectorChain.next
    (clockCompleted_freshParents_selects_launch program layout bits registers fuel outerParents shape)
    (RootResetExactTraceAgreement.SelectorChain.done _)
  exact ⟨SchedulerRecurrence.ExactMutationChain.append clockChain launchChain,
    RootResetExactTraceAgreement.SelectorChain.append clockChain clockSelected launchSelected⟩



/-- Every clock contraction through stage two's first fuel-job launch agrees
with the bare-term selector after an actual nonempty first response. -/
theorem firstReturn_nextClockLaunch_exact_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool)
    {outerContext fullContext innerContext targetContext : Context} {ascentTicks : Nat}
    (trace : SchedulerCycle.FirstResponseTrace program dispatcher bit suffix 0
      outerContext fullContext innerContext targetContext ascentTicks)
    (nonempty : (CTS.absorbingStep program ⟨CTS.zeroPhase program, bit :: suffix⟩).data ≠ []) :
    let bits := bit :: suffix
    let environment := environmentCode (compileActions program dispatcher.tree) bits
    let parents := SchedulerRootContinuation.freshContinuationParents program dispatcher
      (SchedulerCycle.responseRegisters program bit suffix) bit bits
      (SchedulerCycle.deletedCarrier bit outerContext innerContext) []
    let launch := SchedulerNestedPhase.positiveStageLaunchConfigurationAt program dispatcher 1 environment parents
    let samples := SchedulerNestedPhase.clockConfigurationsAt program dispatcher bits
      (SchedulerControl.Registers.newJob program) parents 1 ++ [launch]
    SchedulerResponseInvariant.ExactMutationChain (SchedulerControl.machine program dispatcher) launch
      (SchedulerCycle.firstReturnConfiguration program dispatcher bit suffix 0 outerContext innerContext) samples ∧
    RootResetExactTraceAgreement.SelectorChain (selectStep? program dispatcher)
      (SchedulerCycle.firstReturnConfiguration program dispatcher bit suffix 0 outerContext innerContext) samples := by
  dsimp only
  let bits := bit :: suffix
  let environment := environmentCode (compileActions program dispatcher.tree) bits
  let registers := SchedulerCycle.responseRegisters program bit suffix
  let carrier := SchedulerCycle.deletedCarrier bit outerContext innerContext
  let parents := SchedulerRootContinuation.freshContinuationParents program dispatcher registers bit bits carrier []
  have facts := firstResponseTrace_freshClock_facts program dispatcher bit suffix 0 trace nonempty
  have shape : FreshClockParents program dispatcher parents :=
    .fresh registers bit bits carrier facts.1 facts.2
  have clockChain := clockLaunch_fresh_exact_selectorChain program dispatcher bits
    (SchedulerControl.Registers.newJob program) 1 parents shape
  have outputFalse : SchedulerControl.outputEmpty program registers bit = false := by
    have exactOutput := SchedulerCycle.outputEmpty_scannedRegisters program
      (SchedulerControl.Registers.newJob program).clearScan bit suffix rfl rfl
    have phaseEq : (SchedulerControl.Registers.newJob program).clearScan.phase = CTS.zeroPhase program := rfl
    rw [phaseEq] at exactOutput
    cases outputEq : (CTS.absorbingStep program ⟨CTS.zeroPhase program, bit :: suffix⟩).data with
    | nil => exact False.elim (nonempty outputEq)
    | cons first rest =>
        rw [outputEq] at exactOutput
        exact exactOutput
  have entered := SchedulerRootContinuation.freshReturn_zeroRun program dispatcher registers bit bits 1
    environment carrier [] (SchedulerCycle.responseRegisters_spec program bit suffix).1 outputFalse rfl
  exact ⟨SchedulerResponseInvariant.ExactMutationChain.prepend entered clockChain.1,
    RootResetExactTraceAgreement.SelectorChain.prepend entered clockChain.2⟩


end PureSFormal.Research.RootResetFreshClockSelectorChain
