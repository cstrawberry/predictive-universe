import PureSFormal.Research.RootResetMixedNormalResponseChain
import PureSFormal.Research.RootResetMixedEmptyCommit

/-! Actual EMPTY response samples through arbitrary generated histories. -/
namespace PureSFormal.Research.RootResetMixedEmptyResponseChain

open PureSFormal.PureS
open RootResetPersistentResponseSelector RootResetReachableStageGrammar
open RootResetWrappedFrameSelectorProof RootResetMarkedFrameSelectorProof
open RootResetPendingResponseContext RootResetEmptyRouteSelectorChain
open RootResetWrappedEmptyRouteSelectorChain RootResetWrappedEmptyCommit
open RootResetClockFuelStages RootResetMixedResponseContext

theorem DispatcherChain.selectsSamples_mixed_pending
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    (outerBits bits : List Bool) (outerContinuation continuation carrier : Term)
    (phase : CTS.Phase program) (bit : Bool)
    (carrierNot3 : carrier.headArity ≠ 3)
    (phaseEq : carrierPhase? program dispatcher.tree carrier = some phase)
    (bitEq : carrierResponseBit? program dispatcher.tree carrier = some bit)
    {source : Term} {entries : List Term}
    (chain : DispatcherChain (selectedAction program) carrier dispatcher.tree
      (dispatcher.route (phase, bit)) (phase, bit) source entries)
    (count : Nat) {context : Context}
    {Control : Type} {before : FiniteController.Configuration Control}
    {samples : List (FiniteController.Configuration Control)}
    {roles : List RootResetPersistentRouteA.Role}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : Prefix program dispatcher before.cursor.erase
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (shell bits continuation carrier source)) context roles history)
    (samplesEq : samples.map (fun sample => sample.cursor.erase) =
      entries.map (fun term => context.plug
        (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
          (shell bits continuation carrier term)))) :
    RootResetExactTraceAgreement.SelectorChain (selectStep? program dispatcher) before samples := by
  have selected := RootResetMixedNormalResponseChain.DispatcherChain.selections_mixed_pending
    chain outerBits bits outerContinuation continuation carrierNot3 phaseEq bitEq count shape
  exact selected.selectsSamples rfl samplesEq

theorem emptyResponse_mixed_dispatcher_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program)
    (outerBits bits : List Bool) (outerContinuation continuation carrier : Term)
    (carrierNot3 : carrier.headArity ≠ 3)
    (phaseEq : carrierPhase? program dispatcher.tree carrier = some registers.phase)
    (bitEq : carrierResponseBit? program dispatcher.tree carrier = some false)
    (count : Nat) (parents : List ParentFrame)
    {roles : List RootResetPersistentRouteA.Role}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : Prefix program dispatcher
      (Cursor.rebuild parents
        (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
          (SchedulerResponseInvariant.frameFirstRoot
            (compileActions program dispatcher.tree) bits continuation carrier)))
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (SchedulerResponseInvariant.frameFirstRoot
          (compileActions program dispatcher.tree) bits continuation carrier))
      (SchedulerInvariant.contextOfParents parents) roles history) :
    let actions := compileActions program dispatcher.tree
    let allParents := PrimitiveFuel.pendingParents (environmentCode actions outerBits)
      outerContinuation count parents
    ∃ first second third rest,
      SchedulerResponseInvariant.ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerEmpty.markStartConfiguration program dispatcher registers bits continuation carrier allParents)
        (SchedulerEmpty.responseStartConfiguration program dispatcher registers bits continuation carrier allParents)
        (first :: second :: third :: rest) ∧
      RootResetExactTraceAgreement.SelectorChain (selectStep? program dispatcher) first
        (second :: third :: rest) ∧
      (first :: second :: third :: rest).length = LocalResponse.completedCost program
        (dispatcher.route (registers.phase, false)) (registers.phase, false) := by
  dsimp only
  let allParents := PrimitiveFuel.pendingParents
    (environmentCode (compileActions program dispatcher.tree) outerBits)
    outerContinuation count parents
  obtain ⟨samples, chain, paired⟩ := SchedulerNestedEmpty.emptyResponse_exactPairedMutationChain
    program dispatcher registers bits continuation carrier allParents
  have responseLength := paired.length_eq.trans
    (SchedulerResponseInvariant.responseEntries_length program
      (dispatcher.route_valid (registers.phase, false)) bits continuation carrier)
  have edges := RootResetMixedNormalResponseChain.mixed_pending_frame_edges program dispatcher outerBits bits
    outerContinuation continuation carrier count shape
  dsimp only at edges
  change SchedulerNestedEmpty.EmptyResponseSamplePairs program dispatcher registers bits
    continuation carrier allParents samples
      ((false, SchedulerResponseInvariant.frameFirstRoot
        (compileActions program dispatcher.tree) bits continuation carrier) ::
       (false, SchedulerResponseInvariant.frameSecondRoot
        (compileActions program dispatcher.tree) bits continuation carrier) ::
       (false, freshLocal (compileActions program dispatcher.tree) bits continuation carrier) :: _) at paired
  cases paired with
  | cons pc1 cursor1 done1 term1 position1 erase1 root1 tail1 =>
      cases tail1 with
      | cons pc2 cursor2 done2 term2 position2 erase2 root2 tail2 =>
          cases tail2 with
          | cons pc3 cursor3 done3 term3 position3 erase3 root3 tail3 =>
              refine ⟨_, _, _, _, chain, .next ?_ (.next ?_ ?_), responseLength⟩
              · change selectStep? program dispatcher cursor1.erase = some cursor2.erase
                rw [erase1, erase2]
                simpa only [allParents, pending_rebuild_under_parents,
                  SchedulerInvariant.contextOfParents_plug] using edges.1
              · change selectStep? program dispatcher cursor2.erase = some cursor3.erase
                rw [erase2, erase3]
                simpa only [allParents, pending_rebuild_under_parents] using edges.2
              ·
                have routeChain := routeEntries_dispatcherChain (selectedAction program) carrier
                  (dispatcher.route_valid (registers.phase, false))
                obtain ⟨freshHistory, freshShape⟩ := shape.replace
                  (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
                    (freshLocal (compileActions program dispatcher.tree) bits continuation carrier))
                apply DispatcherChain.selectsSamples_mixed_pending outerBits bits outerContinuation
                  continuation carrier registers.phase false carrierNot3 phaseEq bitEq routeChain count
                  (context := SchedulerInvariant.contextOfParents parents) (history := freshHistory)
                · change Prefix program dispatcher cursor3.erase _ _ _ _
                  rw [erase3]
                  simpa only [allParents, pending_rebuild_under_parents] using! freshShape
                · have erases := emptyResponseSamplePairs_wrapped_erases outerBits outerContinuation count tail3
                  simpa only [PrimitiveLocalResponse.emitted,
                    SchedulerResponseInvariant.actionEntries_nil, SchedulerResponseInvariant.actionEntries_cons, List.append_eq, List.map_append,
                    List.map_nil, List.append_nil, List.nil_append, List.map_map] using! erases

theorem emptyResponse_mixed_through_marker_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program)
    (outerBits bits : List Bool) (outerContinuation continuation carrier : Term)
    (carrierNot3 : carrier.headArity ≠ 3)
    (phaseEq : carrierPhase? program dispatcher.tree carrier = some registers.phase)
    (bitEq : carrierResponseBit? program dispatcher.tree carrier = some false)
    (empty : CheckpointDecoder.decodeCarrier? program dispatcher.tree carrier = some [])
    (notDeleted : ∀ localCount tombstoneCount,
      carrierLocalCount? program dispatcher.tree carrier = some localCount →
      carrierTombstoneCount? program dispatcher.tree carrier = some tombstoneCount →
      tombstoneCount ≠ localCount + 2)
    (count : Nat) (parents : List ParentFrame)
    {roles : List RootResetPersistentRouteA.Role}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : Prefix program dispatcher
      (Cursor.rebuild parents
        (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
          (SchedulerResponseInvariant.frameFirstRoot
            (compileActions program dispatcher.tree) bits continuation carrier)))
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (SchedulerResponseInvariant.frameFirstRoot
          (compileActions program dispatcher.tree) bits continuation carrier))
      (SchedulerInvariant.contextOfParents parents) roles history) :
    let actions := compileActions program dispatcher.tree
    let allParents := PrimitiveFuel.pendingParents (environmentCode actions outerBits)
      outerContinuation count parents
    ∃ first rest,
      SchedulerResponseInvariant.ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerEmpty.markedPendingConfiguration program dispatcher registers bits continuation carrier allParents)
        (SchedulerEmpty.responseStartConfiguration program dispatcher registers bits continuation carrier allParents)
        (first :: rest) ∧
      RootResetExactTraceAgreement.SelectorChain (selectStep? program dispatcher) first rest ∧
      (first :: rest).length = LocalResponse.completedCost program
        (dispatcher.route (registers.phase, false)) (registers.phase, false) + 1 := by
  dsimp only
  let actions := compileActions program dispatcher.tree
  let allParents := PrimitiveFuel.pendingParents (environmentCode actions outerBits)
    outerContinuation count parents
  let route := SchedulerResponse.completedRoute program dispatcher registers false carrier
  let completed := LocalResponse.completed bits continuation carrier route
  let marker := SchedulerRootContinuation.emptyMarkerMutationConfiguration program dispatcher
    registers bits continuation carrier allParents
  obtain ⟨first, second, third, rest, responseChain, selected, responseLength⟩ :=
    emptyResponse_mixed_dispatcher_selectorChain program dispatcher registers
      outerBits bits outerContinuation continuation carrier carrierNot3 phaseEq bitEq count parents shape
  obtain ⟨commitHistory, commitShape⟩ := shape.replace
    (pending actions outerBits outerContinuation count completed)
  have markerStep := RootResetMixedEmptyCommit.selectStep?_mixed_pending_empty_commit
    program dispatcher registers false outerBits bits outerContinuation continuation carrier
    empty rfl notDeleted count commitShape
  have markerSelected : RootResetExactTraceAgreement.SelectorChain (selectStep? program dispatcher)
      (SchedulerEmpty.markStartConfiguration program dispatcher registers bits continuation carrier allParents)
      [marker] := by
    refine .next ?_ (.done _)
    rw [SchedulerRootContinuation.emptyMarkerMutation_erase]
    change selectStep? program dispatcher (Cursor.rebuild allParents completed) =
      some (Cursor.rebuild allParents (LocalResponse.markedCompleted bits continuation carrier route))
    simpa only [allParents, actions, pending_rebuild_under_parents] using markerStep
  have markerChain : SchedulerResponseInvariant.ExactMutationChain (SchedulerControl.machine program dispatcher)
      (SchedulerEmpty.markedPendingConfiguration program dispatcher registers bits continuation carrier allParents)
      (SchedulerEmpty.markStartConfiguration program dispatcher registers bits continuation carrier allParents)
      [marker] :=
    .next 4 (SchedulerRootContinuation.emptyMarkStart_seekMutation ..)
      (.done 4 (SchedulerRootContinuation.emptyMarkerSuffix_zeroRun ..))
  obtain ⟨ticks, searched, tailExact⟩ := RootResetResponseSampleParserBridge.exactMutationChain_cons responseChain
  refine ⟨first, (second :: third :: rest) ++ [marker], ?_, ?_, ?_⟩
  · exact SchedulerRecurrence.ExactMutationChain.append responseChain markerChain
  · exact RootResetExactTraceAgreement.SelectorChain.append tailExact selected markerSelected

  · simpa only [List.length_cons, List.length_append, List.length_singleton,
      Nat.add_assoc] using! congrArg (fun n => n + 1) responseLength

end PureSFormal.Research.RootResetMixedEmptyResponseChain
