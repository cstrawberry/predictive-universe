import PureSFormal.Research.RootResetActiveEndpointExecution
import PureSFormal.Research.RootResetAppenderMutationFiniteRows
import PureSFormal.Research.RootResetResponseSampleParserBridge

/-! Actual root-started finite selection for every live dispatcher and action
mutation. The labels are recovered by the finite carrier queries; the semantic
facts below are proved for the actual scheduler traces. -/
namespace PureSFormal.Research.RootResetActiveResponseEndpointExecution
open PureSFormal.PureS
open FiniteController SchedulerInvariant SchedulerResponseInvariant
open RootResetActivePendingAgreement RootResetProbeSequence

def Selected (program : CTS.Program) (layout : ActionDispatcher program)
    (parents : List ParentFrame) (layers : List Layer) (localTerm : Term) (address : Address) : Prop :=
  let source := Cursor.rebuild parents (wrap (compileActions program layout.tree) layers localTerm)
  ∃ ticks endpoint, ticks ≤ RootResetActiveEndpointProbe.coefficient program layout * source.size ∧
    run (RootResetActiveEndpointProbe.worker program layout).machine ticks
      ((RootResetActiveEndpointProbe.worker program layout).initial (Cursor.atRoot source)) = ⟨some (.done true), endpoint⟩ ∧
    RootResetEdgeFragment.follow address ⟨localTerm, parentsAfter (compileActions program layout.tree) layers parents⟩ = some endpoint ∧
    endpoint.rdx?.isSome = true

theorem fresh_selected {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {count : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents count)
    (layers : List Layer) (carrier dispatcher seed seedAudit continuation continuationAudit : Term)
    (noLocal : CheckpointDecoder.parseLocal? program layout.tree
      (CheckpointDecoder.openShell (freshHField carrier) dispatcher seed seedAudit continuation continuationAudit) = none)
    (address : Address) (endpoint : Cursor) (ticks : Nat)
    (actual : run (RootResetFuelEndpointPipeline.worker program layout).machine ticks
      ((RootResetFuelEndpointPipeline.worker program layout).initial
        ⟨CheckpointDecoder.openShell (freshHField carrier) dispatcher seed seedAudit continuation continuationAudit,
          parentsAfter (compileActions program layout.tree) layers parents⟩) = ⟨some (.done true), endpoint⟩)
    (followed : RootResetEdgeFragment.follow address
      ⟨CheckpointDecoder.openShell (freshHField carrier) dispatcher seed seedAudit continuation continuationAudit,
        parentsAfter (compileActions program layout.tree) layers parents⟩ = some endpoint)
    (redex : endpoint.rdx?.isSome = true) :
    Selected program layout parents layers
      (CheckpointDecoder.openShell (freshHField carrier) dispatcher seed seedAudit continuation continuationAudit) address := by
  obtain ⟨frontTicks, frontBound, frontRun⟩ := cleanParents_liveFresh_stops outer layers carrier dispatcher seed seedAudit continuation continuationAudit noLocal
  obtain ⟨used, bounded, execution⟩ := RootResetActiveEndpointExecution.after_base_miss program layout _ _ endpoint frontTicks ticks frontRun
    (RootResetCarrierNonemptyRows.base_misses_local _ _ _ _ _ _ _)
    (RootResetScopedBaseMisses.pending_pattern_local program layout.tree _ _ _ _ _ _) actual
  exact ⟨used, endpoint, bounded, execution, followed, redex⟩

theorem carrier_not_two {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation carrier : Term}
    (admissible : Carrier.Admissible continuation)
    (audit : ReachableAudit.Holds program tree bits continuation carrier) : carrier.headArity ≠ 2 := by
  rcases audit.wholeCarrierAudit admissible with five | six
  · rw [five]; decide
  · rw [six]; decide

theorem initial {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {count : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents count)
    (layers : List Layer) {bits : List Bool} {continuation carrier : Term} (label : ActionLabel program)
    (facts : RootResetGeneratedCarrierLabels.Facts program layout.tree bits continuation carrier label.1 label.2)
    (audit : ReachableAudit.Holds program layout.tree bits continuation carrier) :
    Selected program layout parents layers (freshLocal (compileActions program layout.tree) bits continuation carrier)
      RootResetAppenderRouteRows.shellAddress := by
  obtain ⟨decoded, path⟩ := facts.path
  obtain ⟨ticks, endpoint, bound, execution, followed, redex⟩ := RootResetLocalDispatcherProbe.generated_initial layout
    facts.admissible path label.1 facts.phase_eq carrier bits continuation carrier carrier
    (parentsAfter (compileActions program layout.tree) layers parents)
  obtain ⟨used, usedBound, actual⟩ := RootResetEndpointPipeline.dispatcher_selected program layout
    (RootResetFuelEndpointPipeline.tail (compileActions program layout.tree)) _ endpoint ticks execution
  have noLocal := (ResponseRootMutation.failure facts.admissible audit
    (ResponseRootMutation.frameThird (path := layout.route_valid label) (bits := bits) (continuation := continuation) (carrier := carrier)) rfl).localBoundary
  exact fresh_selected outer layers carrier _ (word bits) carrier continuation carrier noLocal _ endpoint used actual followed redex

theorem route {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {count : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents count)
    (layers : List Layer) {bits : List Bool} {continuation carrier dispatcher : Term} (label : ActionLabel program)
    (facts : RootResetGeneratedCarrierLabels.Facts program layout.tree bits continuation carrier label.1 label.2)
    (audit : ReachableAudit.Holds program layout.tree bits continuation carrier)
    (progress : RouteMutation (selectedAction program) carrier layout.tree (layout.route label) label false dispatcher) :
    ∃ view, RootResetWholeDispatcherStages.RouteShape (selectedAction program) layout.tree (layout.route label) view dispatcher ∧
      Selected program layout parents layers (Carrier.activeShell bits continuation (freshHField carrier) dispatcher carrier carrier)
        (RootResetAppenderRouteRows.shellAddress ++ RootResetDispatcherStageRows.redexAddress view) := by
  obtain ⟨view, shape⟩ := RootResetResponseSampleParserBridge.RouteBridge.exists_routeShape_of_not_done progress rfl
  obtain ⟨decoded, path⟩ := facts.path
  have queriedShape : RootResetWholeDispatcherStages.RouteShape (selectedAction program) layout.tree
      (layout.route (label.1, RootResetResponseBitFiniteValue.value program layout.tree carrier)) view dispatcher := by
    rw [facts.bit_eq]
    exact shape
  obtain ⟨ticks, endpoint, bound, execution, followed, redex⟩ := RootResetLocalDispatcherProbe.generated_shape layout
    facts.admissible path label.1 facts.phase_eq queriedShape bits continuation carrier carrier
    (parentsAfter (compileActions program layout.tree) layers parents)
  obtain ⟨used, usedBound, actual⟩ := RootResetEndpointPipeline.dispatcher_selected program layout
    (RootResetFuelEndpointPipeline.tail (compileActions program layout.tree)) _ endpoint ticks execution
  have noLocal := (ResponseRootMutation.failure facts.admissible audit
    (ResponseRootMutation.routeIncomplete (path := layout.route_valid label) (bits := bits) (continuation := continuation) progress) rfl).localBoundary
  exact ⟨view, shape, fresh_selected outer layers carrier dispatcher (word bits) carrier continuation carrier noLocal _ endpoint used actual followed redex⟩

theorem action_call {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {count : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents count)
    (layers : List Layer) {bits : List Bool} {continuation carrier dispatcher : Term} (label : ActionLabel program)
    (facts : RootResetGeneratedCarrierLabels.Facts program layout.tree bits continuation carrier label.1 label.2)
    (audit : ReachableAudit.Holds program layout.tree bits continuation carrier)
    (progress : RouteMutation (selectedAction program) carrier layout.tree (layout.route label) label true dispatcher)
    (first : Bool) (rest : List Bool) (emitted : PrimitiveLocalResponse.emitted program label = first :: rest) :
    Selected program layout parents layers (Carrier.activeShell bits continuation (freshHField carrier) dispatcher carrier carrier)
      (RootResetAppenderRouteRows.shellAddress ++ RootResetReachableStageGrammar.routeResponseAddress (layout.route label)) := by
  have noLocal := (ResponseRootMutation.failure facts.admissible audit
    (ResponseRootMutation.routeCompleteNonempty (path := layout.route_valid label) (bits := bits) (continuation := continuation) first rest progress emitted) rfl).localBoundary
  have nonempty : (PrimitiveLocalResponse.emitted program label).isEmpty = false := by rw [emitted]; rfl
  obtain ⟨ticks, endpoint, bound, actual, followed, redex⟩ := RootResetEndpointGeneratedMisses.generated_action_call layout
    (RootResetFuelEndpointPipeline.tail (compileActions program layout.tree)) label facts (carrier_not_two facts.admissible audit)
    nonempty bits continuation carrier carrier (parentsAfter (compileActions program layout.tree) layers parents)
  rw [progress.done_eq rfl] at noLocal ⊢
  exact fresh_selected outer layers carrier _ (word bits) carrier continuation carrier noLocal _ endpoint ticks actual followed redex

theorem appender {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {count : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents count)
    (layers : List Layer) {bits : List Bool} {continuation carrier actionTerm : Term} (label : ActionLabel program)
    (facts : RootResetGeneratedCarrierLabels.Facts program layout.tree bits continuation carrier label.1 label.2)
    (audit : ReachableAudit.Holds program layout.tree bits continuation carrier)
    (progress : ActionMutation (PrimitiveLocalResponse.emitted program label).length
      (PrimitiveLocalResponse.emitted program label) carrier [] false actionTerm) :
    ∃ spec ∈ RootResetAppenderFiniteRows.specsFrom 0 (PrimitiveLocalResponse.emitted program label),
      spec.pattern.matchesBool actionTerm = true ∧
      Selected program layout parents layers (Carrier.activeShell bits continuation (freshHField carrier)
        (PrimitiveRoute.withResponse (selectedAction program) layout.tree (layout.route label) carrier actionTerm) carrier carrier)
        (RootResetAppenderRouteRows.shellAddress ++ (RootResetReachableStageGrammar.routeResponseAddress (layout.route label) ++ spec.address)) := by
  obtain ⟨spec, member, matched⟩ := RootResetAppenderMutationFiniteRows.mutation_spec progress rfl
  have noLocal := (ResponseRootMutation.failure facts.admissible audit
    (ResponseRootMutation.action (path := layout.route_valid label) (bits := bits) (continuation := continuation) progress) rfl).localBoundary
  obtain ⟨ticks, endpoint, bound, actual, followed, redex⟩ := RootResetEndpointGeneratedMisses.generated_appender layout
    (RootResetFuelEndpointPipeline.tail (compileActions program layout.tree)) label facts (carrier_not_two facts.admissible audit)
    actionTerm spec member matched bits continuation carrier carrier (parentsAfter (compileActions program layout.tree) layers parents)
  exact ⟨spec, member, matched, fresh_selected outer layers carrier _ (word bits) carrier continuation carrier noLocal _ endpoint ticks actual followed redex⟩

/-- One semantic interface covering every live mutation after FRAME and
before the completed response. All fields run the same finite worker from
the whole root and retain the exact selected occurrence. -/
structure Endpoints (program : CTS.Program) (layout : ActionDispatcher program)
    (parents : List ParentFrame) (layers : List Layer) (bits : List Bool)
    (continuation carrier : Term) (label : ActionLabel program) : Prop where
  initial : Selected program layout parents layers (freshLocal (compileActions program layout.tree) bits continuation carrier)
    RootResetAppenderRouteRows.shellAddress
  route : ∀ dispatcher,
    RouteMutation (selectedAction program) carrier layout.tree (layout.route label) label false dispatcher →
    ∃ view, RootResetWholeDispatcherStages.RouteShape (selectedAction program) layout.tree (layout.route label) view dispatcher ∧
      Selected program layout parents layers (Carrier.activeShell bits continuation (freshHField carrier) dispatcher carrier carrier)
        (RootResetAppenderRouteRows.shellAddress ++ RootResetDispatcherStageRows.redexAddress view)
  action_call : ∀ dispatcher,
    RouteMutation (selectedAction program) carrier layout.tree (layout.route label) label true dispatcher →
    ∀ first rest, PrimitiveLocalResponse.emitted program label = first :: rest →
    Selected program layout parents layers (Carrier.activeShell bits continuation (freshHField carrier) dispatcher carrier carrier)
      (RootResetAppenderRouteRows.shellAddress ++ RootResetReachableStageGrammar.routeResponseAddress (layout.route label))
  appender : ∀ actionTerm,
    ActionMutation (PrimitiveLocalResponse.emitted program label).length
      (PrimitiveLocalResponse.emitted program label) carrier [] false actionTerm →
    ∃ spec ∈ RootResetAppenderFiniteRows.specsFrom 0 (PrimitiveLocalResponse.emitted program label),
      spec.pattern.matchesBool actionTerm = true ∧
      Selected program layout parents layers (Carrier.activeShell bits continuation (freshHField carrier)
        (PrimitiveRoute.withResponse (selectedAction program) layout.tree (layout.route label) carrier actionTerm) carrier carrier)
        (RootResetAppenderRouteRows.shellAddress ++ (RootResetReachableStageGrammar.routeResponseAddress (layout.route label) ++ spec.address))

theorem of_facts {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {count : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents count)
    (layers : List Layer) {bits : List Bool} {continuation carrier : Term} (label : ActionLabel program)
    (facts : RootResetGeneratedCarrierLabels.Facts program layout.tree bits continuation carrier label.1 label.2)
    (audit : ReachableAudit.Holds program layout.tree bits continuation carrier) :
    Endpoints program layout parents layers bits continuation carrier label :=
  ⟨initial outer layers label facts audit, fun _ progress => route outer layers label facts audit progress,
    fun _ progress first rest emitted => action_call outer layers label facts audit progress first rest emitted,
    fun _ progress => appender outer layers label facts audit progress⟩

theorem selected_response {program : CTS.Program} {layout : ActionDispatcher program}
    {outerParents : List ParentFrame} {outerCount : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout outerParents outerCount)
    (layers : List Layer) {bits : List Bool} {continuation source : Term} {admissible : Carrier.Admissible continuation}
    {registers : SchedulerControl.Registers program} {bit : Bool} {suffix : List Bool}
    {outerContext fullContext innerContext targetContext : Context} {parents : List ParentFrame} {ticks count : Nat}
    (trace : SchedulerCycle.SelectedResponseTrace program layout bits continuation source admissible
      registers bit suffix outerContext fullContext innerContext targetContext parents ticks)
    (normal : RootResetOrderedCarrier.NormalInvariant program layout.tree bits continuation source
      registers.phase (bit :: suffix) count) :
    Endpoints program layout outerParents layers bits continuation (SchedulerCycle.deletedCarrier bit outerContext innerContext)
      ((SchedulerCycle.scannedRegisters registers bit suffix).phase, bit) :=
  of_facts outer layers _ (RootResetGeneratedCarrierLabels.selected_response trace normal) trace.targetHolds

theorem first_response {program : CTS.Program} {layout : ActionDispatcher program}
    {outerParents : List ParentFrame} {outerCount : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout outerParents outerCount)
    (layers : List Layer) {bit : Bool} {suffix : List Bool} {fuel : Nat}
    {outerContext fullContext innerContext targetContext : Context} {ticks : Nat}
    (trace : SchedulerCycle.FirstResponseTrace program layout bit suffix fuel
      outerContext fullContext innerContext targetContext ticks) :
    Endpoints program layout outerParents layers (bit :: suffix)
      (Dovetail.clockExit (fuel + 1) fuel (environmentCode (compileActions program layout.tree) (bit :: suffix)))
      (SchedulerCycle.deletedCarrier bit outerContext innerContext) (CTS.zeroPhase program, bit) :=
  of_facts outer layers _ (RootResetGeneratedCarrierLabels.first_response trace) trace.targetHolds

theorem initial_empty_sweep {program : CTS.Program} {layout : ActionDispatcher program}
    {outerParents : List ParentFrame} {outerCount : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout outerParents outerCount)
    (layers : List Layer) (continuation : Term) (admissible : Carrier.Admissible continuation) (count : Nat) :
    Endpoints program layout outerParents layers [] continuation
      (SchedulerCycle.emptySweepCarrier program layout [] continuation count (SchedulerNestedEmpty.initialEmptyRegisters program)
        (baseCarrier (environmentCode (compileActions program layout.tree) []) continuation))
      ((SchedulerCycle.emptySweepRegisters program count (SchedulerNestedEmpty.initialEmptyRegisters program)).phase, false) :=
  of_facts outer layers _ (RootResetGeneratedCarrierLabels.initial_empty_sweep program layout continuation admissible count)
    (SchedulerNestedEmpty.emptySweepCarrier_holds program layout [] continuation count (SchedulerNestedEmpty.initialEmptyRegisters program)
      _ (ReachableAudit.Holds.initial program layout.tree [] continuation))

theorem empty_sweep {program : CTS.Program} {layout : ActionDispatcher program}
    {outerParents : List ParentFrame} {outerCount : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout outerParents outerCount)
    (layers : List Layer) {bits : List Bool} {continuation carrier : Term}
    (admissible : Carrier.Admissible continuation) (count : Nat) (registers : SchedulerControl.Registers program)
    (decoded : CarrierDecoder.decode? program layout.tree bits continuation admissible carrier = some [])
    (audit : ReachableAudit.Holds program layout.tree bits continuation carrier)
    (phaseEq : RootResetPersistentResponseSelector.carrierPhase? program layout.tree carrier = some registers.phase)
    (bitEq : RootResetPersistentResponseSelector.carrierResponseBit? program layout.tree carrier = some false)
    (finiteBit : RootResetResponseBitFiniteValue.value program layout.tree carrier = false) :
    Endpoints program layout outerParents layers bits continuation
      (SchedulerCycle.emptySweepCarrier program layout bits continuation count registers carrier)
      ((SchedulerCycle.emptySweepRegisters program count registers).phase, false) :=
  of_facts outer layers _
    (RootResetGeneratedCarrierLabels.empty_sweep program layout bits continuation admissible count registers carrier decoded phaseEq bitEq finiteBit)
    (SchedulerNestedEmpty.emptySweepCarrier_holds program layout bits continuation count registers carrier audit)

end PureSFormal.Research.RootResetActiveResponseEndpointExecution
