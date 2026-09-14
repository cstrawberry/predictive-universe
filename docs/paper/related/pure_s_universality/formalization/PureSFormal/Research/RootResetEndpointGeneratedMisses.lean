import PureSFormal.Research.RootResetEndpointPipeline
import PureSFormal.Research.RootResetNestedClockProbeAgreement
import PureSFormal.Research.RootResetActivatedRouteExclusion
import PureSFormal.Research.RootResetGeneratedCarrierLabels

/-! Concrete preceding-probe misses for the generated action and CLOCK rows. -/
namespace PureSFormal.Research.RootResetEndpointGeneratedMisses
open PureSFormal.PureS
open FiniteController SchedulerInvariant
open RootResetCompletedLocalPatterns
open RootResetCarrierEdgePatterns (EdgeRow)

theorem fresh_pattern_arity (pattern : Pattern) (source : Term)
    (matched : (localPattern .fresh pattern).matchesBool source = true) : source.headArity = 6 := by
  obtain ⟨a, continuation, sourceEq, aMatches, _⟩ := app_matches matched
  obtain ⟨b, seed, aEq, bMatches, _⟩ := app_matches aMatches
  obtain ⟨halt, dispatcher, bEq, haltMatches, _⟩ := app_matches bMatches
  have shape := halt_sound .fresh halt haltMatches
  cases shape with
  | fresh carrier => rw [sourceEq, aEq, bEq]; rfl

theorem fresh_pattern_misses (pattern : Pattern) (source : Term) (arity : source.headArity ≠ 6) :
    (localPattern .fresh pattern).matchesBool source = false := by
  cases matched : (localPattern .fresh pattern).matchesBool source with
  | false => rfl
  | true => exact (arity (fresh_pattern_arity pattern source matched)).elim

theorem dispatcher_entry_missed (program : CTS.Program) (layout : ActionDispatcher program)
    (origin : Cursor) (arity : origin.focus.headArity ≠ 6) :
    ∃ ticks, ticks ≤ RootResetEdgeFragment.bound RootResetLocalDispatcherProbe.entryRows + 1 ∧
      run (RootResetLocalDispatcherProbe.machine program layout) ticks
        (RootResetLocalDispatcherProbe.initial program layout origin) = ⟨some (.done false), origin⟩ := by
  have rejected : RootResetEdgeFragment.select RootResetLocalDispatcherProbe.entryRows origin.focus = none := by
    simp only [RootResetLocalDispatcherProbe.entryRows, RootResetEdgeFragment.select,
      fresh_pattern_misses .hole origin.focus arity, Bool.false_eq_true, ↓reduceIte]
  obtain ⟨member, execution⟩ := RootResetEdgeFragment.missed_runs _ origin rejected
  obtain ⟨used, bounded, actual⟩ := RootResetLocalDispatcherProbe.entry_runs program layout origin origin _ false member execution
  exact ⟨used + 1, Nat.add_le_add_right (Nat.le_trans bounded (RootResetEdgeFragment.ticks_bound _ _)) 1, actual⟩

theorem action_rows_missed (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (source : Term) (arity : source.headArity ≠ 6) :
    RootResetEdgeFragment.select (RootResetSelectedActionRows.rows program tree) source = none := by
  cases selected : RootResetEdgeFragment.select (RootResetSelectedActionRows.rows program tree) source with
  | none => rfl
  | some edge =>
      obtain ⟨member, matched⟩ := RootResetEdgeFragment.select_sound _ _ _ selected
      rcases List.mem_append.mp member with initial | appender
      · obtain ⟨row, _, equal⟩ := map_member_inverse _ _ _ initial
        subst edge
        exact (arity (fresh_pattern_arity row.pattern source matched)).elim
      · obtain ⟨row, _, equal⟩ := map_member_inverse _ _ _ appender
        subst edge
        exact (arity (fresh_pattern_arity row.pattern source matched)).elim

theorem action_entry_missed (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin : Cursor) (arity : origin.focus.headArity ≠ 6) :
    ∃ state : (RootResetEndpointPipeline.actionWorker program tree).Control,
      run (RootResetEndpointPipeline.actionWorker program tree).machine
        (RootResetEdgeFragment.ticks (RootResetSelectedActionRows.rows program tree) origin.focus)
        ((RootResetEndpointPipeline.actionWorker program tree).initial origin) = ⟨some state, origin⟩ ∧
      (RootResetEndpointPipeline.actionWorker program tree).answer? state = some false := by
  obtain ⟨member, execution⟩ := RootResetEdgeFragment.missed_runs _ origin (action_rows_missed program tree origin.focus arity)
  exact ⟨⟨.answer false, member⟩, execution, rfl⟩

theorem growth_not_six (stage wrappers residual : Nat) (environment : Term) :
    (Term.app (clockGrowthCore stage wrappers residual) environment).headArity ≠ 6 := by
  cases wrappers with
  | zero => cases residual <;> change (4 : Nat) ≠ 6 <;> decide
  | succ wrappers => change (3 : Nat) ≠ 6; decide

theorem launch_not_six (stage wrappers : Nat) (environment : Term) :
    (Term.app (clockWrappers stage (wrappers + 1)) environment).headArity ≠ 6 := by
  change (3 : Nat) ≠ 6
  decide

theorem clock_preceding_misses (program : CTS.Program) (layout : ActionDispatcher program)
    (origin : Cursor) (arity : origin.focus.headArity ≠ 6) :
    ∃ dispatcherTicks actionTicks actionState,
      dispatcherTicks ≤ RootResetEdgeFragment.bound RootResetLocalDispatcherProbe.entryRows + 1 ∧
      actionTicks ≤ RootResetEndpointPipeline.actionCoefficient program layout.tree ∧
      run (RootResetLocalDispatcherProbe.machine program layout) dispatcherTicks
        (RootResetLocalDispatcherProbe.initial program layout origin) = ⟨some (.done false), origin⟩ ∧
      run (RootResetEndpointPipeline.actionWorker program layout.tree).machine actionTicks
        ((RootResetEndpointPipeline.actionWorker program layout.tree).initial origin) = ⟨some actionState, origin⟩ ∧
      (RootResetEndpointPipeline.actionWorker program layout.tree).answer? actionState = some false := by
  obtain ⟨ticks, bounded, execution⟩ := dispatcher_entry_missed program layout origin arity
  obtain ⟨state, actionRun, answered⟩ := action_entry_missed program layout.tree origin arity
  exact ⟨ticks, _, state, bounded, RootResetEdgeFragment.ticks_bound _ _, execution, actionRun, answered⟩

def clockCoefficient (program : CTS.Program) (layout : ActionDispatcher program) : Nat :=
  RootResetEdgeFragment.bound RootResetLocalDispatcherProbe.entryRows + 1 +
    RootResetEndpointPipeline.actionCoefficient program layout.tree + RootResetNestedClockProbe.coefficient + 4

theorem clock_selected (program : CTS.Program) (layout : ActionDispatcher program)
    (origin endpoint : Cursor) (arity : origin.focus.headArity ≠ 6) (clockTicks : Nat)
    (clockBound : clockTicks ≤ RootResetNestedClockProbe.coefficient * origin.focus.size)
    (clockRun : run RootResetNestedClockProbe.machine clockTicks (RootResetNestedClockProbe.initial origin) =
      ⟨some (.done true), endpoint⟩) :
    ∃ ticks, ticks ≤ clockCoefficient program layout * origin.erase.size ∧
      run (RootResetEndpointPipeline.worker program layout).machine ticks
        ((RootResetEndpointPipeline.worker program layout).initial origin) = ⟨some (.done true), endpoint⟩ := by
  obtain ⟨dispatcherTicks, actionTicks, actionState, dispatcherBound, actionBound, dispatcherRun, actionRun, actionAnswer⟩ :=
    clock_preceding_misses program layout origin arity
  obtain ⟨ticks, bounded, actual⟩ := RootResetEndpointPipeline.tail_selected program layout
    RootResetEndpointPipeline.clockWorker RootResetEndpointPipeline.clock_terminal origin endpoint
    dispatcherTicks actionTicks clockTicks dispatcherRun actionState actionRun actionAnswer (.done true) clockRun rfl
  refine ⟨ticks, Nat.le_trans bounded ?_, actual⟩
  have constant (value : Nat) : value ≤ value * origin.erase.size := by
    simpa only [Nat.mul_one] using Nat.mul_le_mul_left value (Term.size_pos origin.erase)
  have sizeBound : origin.focus.size ≤ origin.erase.size :=
    Nat.le_trans (Nat.le_add_left _ _) (RootResetProgressTotality.depth_add_focus_size_le_erase_size origin.focus origin.parents)
  have total := Nat.add_le_add (Nat.add_le_add (Nat.add_le_add
    (Nat.le_trans dispatcherBound (constant _)) (Nat.le_trans actionBound (constant _)))
    (Nat.le_trans clockBound (Nat.mul_le_mul_left _ sizeBound))) (constant 4)
  simpa only [clockCoefficient, Nat.add_mul] using total

theorem generated_clock_growth (program : CTS.Program) (layout : ActionDispatcher program)
    (stage wrappers residual : Nat) (environment : Term) (parents : List ParentFrame) :
    let source := Term.app (clockGrowthCore stage wrappers residual) environment
    ∃ ticks, ticks ≤ clockCoefficient program layout * (Cursor.mk source parents).erase.size ∧
      run (RootResetEndpointPipeline.worker program layout).machine ticks
        ((RootResetEndpointPipeline.worker program layout).initial ⟨source, parents⟩) =
          ⟨some (.done true), ⟨.app (C residual) (C stage),
            RootResetClockGrowthWalker.clockParents stage wrappers (.left environment :: parents)⟩⟩ := by
  obtain ⟨ticks, bounded, actual⟩ := RootResetNestedClockProbeAgreement.generated_growth stage wrappers residual environment parents
  exact clock_selected program layout _ _ (growth_not_six stage wrappers residual environment) ticks bounded actual

theorem generated_clock_launch (program : CTS.Program) (layout : ActionDispatcher program)
    (stage wrappers : Nat) (environment : Term) (parents : List ParentFrame) :
    let source := Term.app (clockWrappers stage (wrappers + 1)) environment
    ∃ ticks, ticks ≤ clockCoefficient program layout * (Cursor.mk source parents).erase.size ∧
      run (RootResetEndpointPipeline.worker program layout).machine ticks
        ((RootResetEndpointPipeline.worker program layout).initial ⟨source, parents⟩) =
          ⟨some (.done true), ⟨source, parents⟩⟩ := by
  obtain ⟨ticks, bounded, actual⟩ := RootResetNestedClockProbeAgreement.generated_launch stage wrappers environment parents
  exact clock_selected program layout _ _ (launch_not_six stage wrappers environment) ticks bounded actual

theorem dispatcher_route_rows_missed {Label : Type} (encode : Label → Term)
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    (path : Dispatcher.HasRoute tree route label) (carrier response : Term) (arity : carrier.headArity ≠ 2) :
    RootResetEdgeFragment.select (RootResetDispatcherStageRows.rows encode tree route)
      (PrimitiveRoute.withResponse encode tree route carrier response) = none := by
  let source := PrimitiveRoute.withResponse encode tree route carrier response
  cases selected : RootResetEdgeFragment.select (RootResetDispatcherStageRows.rows encode tree route) source with
  | none => rfl
  | some row =>
      obtain ⟨member, matched⟩ := RootResetEdgeFragment.select_sound _ _ _ selected
      rcases List.mem_cons.mp member with first | later
      · subst row
        obtain ⟨argument, sourceEq⟩ := call_sound matched
        obtain ⟨payload, chosenEq⟩ := RootResetWrappedEmptyCommit.withResponse_chosen encode path carrier response
        have impossible := congrArg Term.headArity (chosenEq.symm.trans sourceEq)
        cases tree <;> cases impossible
      · obtain ⟨view, shape, _⟩ := RootResetDispatcherStageRows.row_sound encode tree route row later source matched
        have parsed := RootResetWholeDispatcherStages.parseRouteNode?_complete shape
        rw [RootResetActivatedRouteExclusion.parseRouteNode?_withResponse_none encode path carrier response arity] at parsed
        cases parsed

theorem dispatcher_local_rows_missed {Label : Type} (encode : Label → Term)
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    (path : Dispatcher.HasRoute tree route label) (carrier response : Term) (arity : carrier.headArity ≠ 2)
    (payload continuation seedAudit continuationAudit : Term) :
    RootResetEdgeFragment.select (RootResetDispatcherLocalRows.rows encode tree route)
      (CheckpointDecoder.openShell (freshHField carrier)
        (PrimitiveRoute.withResponse encode tree route carrier response) payload seedAudit continuation continuationAudit) = none := by
  let dispatcher := PrimitiveRoute.withResponse encode tree route carrier response
  let source := CheckpointDecoder.openShell (freshHField carrier) dispatcher payload seedAudit continuation continuationAudit
  cases selected : RootResetEdgeFragment.select (RootResetDispatcherLocalRows.rows encode tree route) source with
  | none => rfl
  | some edge =>
      obtain ⟨member, matched⟩ := RootResetEdgeFragment.select_sound _ _ _ selected
      obtain ⟨row, inside, equal⟩ := map_member_inverse _ _ _ member
      subst edge
      obtain ⟨actualDispatcher, placement, bodyMatches⟩ := RootResetAppenderRouteRows.local_dispatcher row.pattern source matched
      have sourcePlacement : source.subterm? RootResetAppenderRouteRows.shellAddress = some dispatcher := by
        change (CheckpointDecoder.openShell (freshHField carrier) dispatcher payload seedAudit continuation continuationAudit).subterm?
          RootResetAppenderRouteRows.shellAddress = some dispatcher
        cases dispatcher <;> rfl
      have dispatcherEq := Option.some.inj (placement.symm.trans sourcePlacement)
      subst actualDispatcher
      obtain ⟨found, accepted⟩ := RootResetDispatcherStageRows.select_exists _ dispatcher ⟨row, inside, bodyMatches⟩
      rw [dispatcher_route_rows_missed encode path carrier response arity] at accepted
      cases accepted

theorem generated_dispatcher_miss {program : CTS.Program} (layout : ActionDispatcher program)
    {input : List Bool} {pathContinuation carrier : Term} (label : ActionLabel program)
    (facts : RootResetGeneratedCarrierLabels.Facts program layout.tree input pathContinuation carrier label.1 label.2)
    (arity : carrier.headArity ≠ 2) (response payload continuation seedAudit continuationAudit : Term)
    (parents : List ParentFrame) :
    let source := CheckpointDecoder.openShell (freshHField carrier)
      (PrimitiveRoute.withResponse (selectedAction program) layout.tree (layout.route label) carrier response)
      payload seedAudit continuation continuationAudit
    ∃ ticks, ticks ≤ RootResetLocalDispatcherProbe.coefficient program layout * (Cursor.mk source parents).erase.size ∧
      run (RootResetLocalDispatcherProbe.machine program layout) ticks
        (RootResetLocalDispatcherProbe.initial program layout ⟨source, parents⟩) = ⟨some (.done false), ⟨source, parents⟩⟩ := by
  dsimp only
  let source := CheckpointDecoder.openShell (freshHField carrier)
    (PrimitiveRoute.withResponse (selectedAction program) layout.tree (layout.route label) carrier response)
    payload seedAudit continuation continuationAudit
  have recovered : (label.1, RootResetResponseBitFiniteValue.value program layout.tree carrier) = label := by
    rw [facts.bit_eq]
  have rejected : RootResetEdgeFragment.select
      (RootResetLocalDispatcherProbe.dispatchRows program layout
        (label.1, RootResetResponseBitFiniteValue.value program layout.tree carrier)) source = none := by
    rw [recovered]
    exact dispatcher_local_rows_missed (selectedAction program) (layout.route_valid label) carrier response arity
      payload continuation seedAudit continuationAudit
  obtain ⟨member, execution⟩ := RootResetEdgeFragment.missed_runs _ ⟨source, parents⟩ rejected
  obtain ⟨decoded, path⟩ := facts.path
  exact RootResetLocalDispatcherProbe.generated_finish layout facts.admissible path label.1 facts.phase_eq
    (PrimitiveRoute.withResponse (selectedAction program) layout.tree (layout.route label) carrier response)
    payload continuation seedAudit continuationAudit parents ⟨source, parents⟩ member execution

def actionCoefficient (program : CTS.Program) (layout : ActionDispatcher program) : Nat :=
  RootResetLocalDispatcherProbe.coefficient program layout + RootResetEndpointPipeline.actionCoefficient program layout.tree + 3

theorem action_with_response_selected {program : CTS.Program} (layout : ActionDispatcher program)
    (tail : RootResetProbeSequence.Worker)
    {input : List Bool} {pathContinuation carrier : Term} (label : ActionLabel program)
    (facts : RootResetGeneratedCarrierLabels.Facts program layout.tree input pathContinuation carrier label.1 label.2)
    (arity : carrier.headArity ≠ 2) (response payload continuation seedAudit continuationAudit : Term)
    (parents : List ParentFrame) (endpoint : Cursor)
    (actionState : (RootResetEndpointPipeline.actionWorker program layout.tree).Control)
    (actionRun : let source := CheckpointDecoder.openShell (freshHField carrier) (PrimitiveRoute.withResponse (selectedAction program) layout.tree (layout.route label) carrier response) payload seedAudit continuation continuationAudit
      run (RootResetEndpointPipeline.actionWorker program layout.tree).machine
        (RootResetEdgeFragment.ticks (RootResetSelectedActionRows.rows program layout.tree) source)
        ((RootResetEndpointPipeline.actionWorker program layout.tree).initial ⟨source, parents⟩) = ⟨some actionState, endpoint⟩)
    (answered : (RootResetEndpointPipeline.actionWorker program layout.tree).answer? actionState = some true) :
    let source := CheckpointDecoder.openShell (freshHField carrier)
      (PrimitiveRoute.withResponse (selectedAction program) layout.tree (layout.route label) carrier response)
      payload seedAudit continuation continuationAudit
    ∃ ticks, ticks ≤ actionCoefficient program layout * (Cursor.mk source parents).erase.size ∧
      run (RootResetEndpointPipeline.withTail program layout tail).machine ticks
        ((RootResetEndpointPipeline.withTail program layout tail).initial ⟨source, parents⟩) = ⟨some (.done true), endpoint⟩ := by
  dsimp only at actionRun ⊢
  let source := CheckpointDecoder.openShell (freshHField carrier)
    (PrimitiveRoute.withResponse (selectedAction program) layout.tree (layout.route label) carrier response)
    payload seedAudit continuation continuationAudit
  let origin : Cursor := ⟨source, parents⟩
  obtain ⟨dispatcherTicks, dispatcherBound, dispatcherRun⟩ := generated_dispatcher_miss layout label facts arity
    response payload continuation seedAudit continuationAudit parents
  obtain ⟨ticks, bounded, actual⟩ := RootResetEndpointPipeline.action_selected program layout tail origin endpoint
    dispatcherTicks _ dispatcherRun actionState actionRun answered
  refine ⟨ticks, Nat.le_trans bounded ?_, actual⟩
  have constant (value : Nat) : value ≤ value * origin.erase.size := by
    simpa only [Nat.mul_one] using Nat.mul_le_mul_left value (Term.size_pos origin.erase)
  have total := Nat.add_le_add (Nat.add_le_add dispatcherBound
    (Nat.le_trans (RootResetEdgeFragment.ticks_bound (RootResetSelectedActionRows.rows program layout.tree) source)
      (constant _))) (constant 3)
  simpa only [actionCoefficient, RootResetEndpointPipeline.actionCoefficient, Nat.add_mul] using total

theorem generated_action_call {program : CTS.Program} (layout : ActionDispatcher program)
    (tail : RootResetProbeSequence.Worker)
    {input : List Bool} {pathContinuation carrier : Term} (label : ActionLabel program)
    (facts : RootResetGeneratedCarrierLabels.Facts program layout.tree input pathContinuation carrier label.1 label.2)
    (arity : carrier.headArity ≠ 2) (nonempty : (PrimitiveLocalResponse.emitted program label).isEmpty = false)
    (bits : List Bool) (continuation seedAudit continuationAudit : Term) (parents : List ParentFrame) :
    let source := CheckpointDecoder.openShell (freshHField carrier)
      (PrimitiveRoute.withResponse (selectedAction program) layout.tree (layout.route label) carrier
        (.app (selectedAction program label) carrier)) (word bits) seedAudit continuation continuationAudit
    ∃ ticks endpoint, ticks ≤ actionCoefficient program layout * (Cursor.mk source parents).erase.size ∧
      run (RootResetEndpointPipeline.withTail program layout tail).machine ticks
        ((RootResetEndpointPipeline.withTail program layout tail).initial ⟨source, parents⟩) = ⟨some (.done true), endpoint⟩ ∧
      RootResetEdgeFragment.follow (RootResetAppenderRouteRows.shellAddress ++
        RootResetReachableStageGrammar.routeResponseAddress (layout.route label)) ⟨source, parents⟩ = some endpoint ∧
      endpoint.rdx?.isSome = true := by
  dsimp only
  obtain ⟨endpoint, member, followed, execution, redex⟩ := RootResetSelectedActionRows.generated_initial
    (PrimitiveRoute.withResponse_activated (encode := selectedAction program) (layout.route_valid label) carrier
      (.app (selectedAction program label) carrier)) nonempty bits continuation carrier seedAudit continuationAudit parents
  obtain ⟨ticks, bounded, actual⟩ := action_with_response_selected layout tail label facts arity
    (.app (selectedAction program label) carrier) (word bits) continuation seedAudit continuationAudit parents endpoint
    ⟨.answer true, member⟩ execution rfl
  exact ⟨ticks, endpoint, bounded, actual, followed, redex⟩

theorem generated_appender {program : CTS.Program} (layout : ActionDispatcher program)
    (tail : RootResetProbeSequence.Worker)
    {input : List Bool} {pathContinuation carrier : Term} (label : ActionLabel program)
    (facts : RootResetGeneratedCarrierLabels.Facts program layout.tree input pathContinuation carrier label.1 label.2)
    (arity : carrier.headArity ≠ 2) (response : Term) (spec : RootResetAppenderFiniteRows.Spec)
    (member : spec ∈ RootResetAppenderFiniteRows.specsFrom 0 (PrimitiveLocalResponse.emitted program label))
    (matched : spec.pattern.matchesBool response = true)
    (bits : List Bool) (continuation seedAudit continuationAudit : Term) (parents : List ParentFrame) :
    let source := CheckpointDecoder.openShell (freshHField carrier)
      (PrimitiveRoute.withResponse (selectedAction program) layout.tree (layout.route label) carrier response)
      (word bits) seedAudit continuation continuationAudit
    ∃ ticks endpoint, ticks ≤ actionCoefficient program layout * (Cursor.mk source parents).erase.size ∧
      run (RootResetEndpointPipeline.withTail program layout tail).machine ticks
        ((RootResetEndpointPipeline.withTail program layout tail).initial ⟨source, parents⟩) = ⟨some (.done true), endpoint⟩ ∧
      RootResetEdgeFragment.follow (RootResetAppenderRouteRows.shellAddress ++
        (RootResetReachableStageGrammar.routeResponseAddress (layout.route label) ++ spec.address)) ⟨source, parents⟩ = some endpoint ∧
      endpoint.rdx?.isSome = true := by
  dsimp only
  obtain ⟨endpoint, controlMember, followed, execution, redex⟩ := RootResetSelectedActionRows.generated_appender
    (PrimitiveRoute.withResponse_activated (encode := selectedAction program) (layout.route_valid label) carrier response)
    spec member matched bits continuation carrier seedAudit continuationAudit parents
  obtain ⟨ticks, bounded, actual⟩ := action_with_response_selected layout tail label facts arity response
    (word bits) continuation seedAudit continuationAudit parents endpoint ⟨.answer true, controlMember⟩ execution rfl
  exact ⟨ticks, endpoint, bounded, actual, followed, redex⟩

end PureSFormal.Research.RootResetEndpointGeneratedMisses
