import PureSFormal.Research.RootResetFiniteEmptyResponseChain
import PureSFormal.Research.RootResetInitialEmptyCommitAgreement
import PureSFormal.Research.RootResetFinitePriorityAgreement
import PureSFormal.Research.RootResetMixedEmptySweep

/-! Repeated EMPTY responses selected by the finite controller. -/
namespace PureSFormal.Research.RootResetFiniteEmptySweep
open PureSFormal.PureS
open RootResetActivePendingAgreement RootResetEmptyHandoffContext
open RootResetWrappedFrameSelectorProof RootResetMarkedFrameSelectorProof
open RootResetWrappedEmptyCommit
open RootResetEmptyPostMarkerHandoff
open RootResetFiniteNormalResponseChain

theorem markedOrigin_frame_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (previousRegisters : SchedulerControl.Registers program) (previousBit : Bool)
    (bits : List Bool) (previousCarrier : Term) (horizon remaining : Nat)
    (bound : remaining ≤ horizon) (depth : Nat) (parents : List ParentFrame) {history : Nat}
    (clean : RootResetCleanTraversableParents.CleanParents program dispatcher parents history) :
    let continuation := exitTerm program dispatcher horizon remaining bits
    let carrier := markedExitTerm program dispatcher previousRegisters previousBit bits previousCarrier horizon remaining
    let registers := previousRegisters.advanceEmpty
    let actions := compileActions program dispatcher.tree
    let allParents := PrimitiveFuel.pendingParents (environmentCode actions bits) continuation depth parents
    CarrierDecoder.decode? program dispatcher.tree bits continuation (Dovetail.clockExit_admissible ..) carrier = some [] →
    ReachableAudit.Holds program dispatcher.tree bits continuation carrier →
    ∃ samples,
      SchedulerResponseInvariant.ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerEmpty.markedPendingConfiguration program dispatcher registers bits continuation carrier allParents)
        (SchedulerEmpty.frameConfiguration program dispatcher registers bits continuation carrier allParents) samples ∧
      RootResetExactTraceAgreement.SelectorChain (RootResetFinitePrioritySelector.selectStep? program dispatcher)
        (SchedulerEmpty.frameConfiguration program dispatcher registers bits continuation carrier allParents) samples ∧
      samples.length = LocalResponse.completedCost program
        (dispatcher.route (registers.phase, false)) (registers.phase, false) + 1 := by
  dsimp only
  intro empty audit
  let continuation := exitTerm program dispatcher horizon remaining bits
  let carrier := markedExitTerm program dispatcher previousRegisters previousBit bits previousCarrier horizon remaining
  let registers := previousRegisters.advanceEmpty
  let actions := compileActions program dispatcher.tree
  let layers := List.replicate depth (word bits, continuation)
  let allParents := PrimitiveFuel.pendingParents (environmentCode actions bits) continuation depth parents
  have path := CarrierDecoder.decode?_sound program dispatcher.tree bits continuation (Dovetail.clockExit_admissible ..) empty
  have parsed := markedExit_parsed program dispatcher previousRegisters previousBit bits previousCarrier horizon remaining
  have facts : RootResetGeneratedCarrierLabels.Facts program dispatcher.tree bits continuation carrier registers.phase false :=
    ⟨Dovetail.clockExit_admissible .., ⟨[], path⟩,
      RootResetEmptyResponseSelectorChain.markedCompleted_phase program dispatcher previousRegisters previousBit bits continuation previousCarrier,
      RootResetResponseBitFiniteValue.marked_completed program dispatcher previousRegisters previousBit bits continuation previousCarrier⟩
  have endpoints := RootResetFiniteResponseEndpointAgreement.of_facts clean layers (registers.phase, false) facts audit
  have commit := RootResetInitialEmptyCommitAgreement.selectStep?_completed_empty clean layers registers bits horizon remaining carrier path
    (RootResetEmptyOriginProbe.Reads.marked parsed rfl)
  obtain ⟨first, rest, responseChain, responseSelected, firstErase, responseLength⟩ :=
    RootResetFiniteEmptyResponseChain.emptyResponse_through_marker_selectorChain clean layers registers bits continuation carrier endpoints commit
  have parentEq : parentsAfter actions layers parents = allParents := by
    exact RootResetBaseEndpointExecution.parents_replicate ..
  rw [parentEq] at responseChain
  have handoff := RootResetFinitePriorityAgreement.marked_handoff clean layers (word bits) continuation
    previousRegisters previousBit bits bits previousCarrier horizon remaining
  have layerEq : layers ++ [(word bits, continuation)] = List.replicate (depth + 1) (word bits, continuation) := by
    exact List.replicate_succ'.symm
  dsimp only at handoff
  rw [layerEq, wrap_replicate] at handoff
  have firstSelected : RootResetFinitePrioritySelector.selectStep? program dispatcher
      (SchedulerEmpty.responseStartConfiguration program dispatcher registers bits continuation carrier allParents).cursor.erase = some first.cursor.erase := by
    rw [firstErase]
    change RootResetFinitePrioritySelector.selectStep? program dispatcher
      (Cursor.rebuild allParents (frame (environmentCode actions bits) continuation carrier)) = _
    rw [pending_rebuild_under_parents, ← pending_succ_innermost, SchedulerInvariant.contextOfParents_plug]
    rw [← RootResetFrameSpineWalker.rebuild_spineParents (frameLayers actions layers)
      (SchedulerResponseInvariant.frameFirstRoot actions bits continuation carrier) parents]
    exact handoff
  have selected : RootResetExactTraceAgreement.SelectorChain (RootResetFinitePrioritySelector.selectStep? program dispatcher)
      (SchedulerEmpty.responseStartConfiguration program dispatcher registers bits continuation carrier allParents) (first :: rest) :=
    .next firstSelected responseSelected
  have entered := SchedulerEmpty.enterResponse_zeroRun program dispatcher registers bits continuation carrier allParents
  exact ⟨first :: rest, SchedulerResponseInvariant.ExactMutationChain.prepend entered responseChain,
    RootResetExactTraceAgreement.SelectorChain.prepend entered selected, responseLength⟩

theorem markedOrigin_pendingSweep_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (previousRegisters : SchedulerControl.Registers program) (previousBit : Bool)
    (bits : List Bool) (previousCarrier : Term) (horizon remaining : Nat)
    (bound : remaining ≤ horizon) (count : Nat) (parents : List ParentFrame)
    {history : Nat}
    (clean : RootResetCleanTraversableParents.CleanParents program dispatcher parents history) :
    let continuation := exitTerm program dispatcher horizon remaining bits
    let carrier := markedExitTerm program dispatcher previousRegisters previousBit bits previousCarrier horizon remaining
    let registers := previousRegisters.advanceEmpty
    let actions := compileActions program dispatcher.tree
    let active := pending actions bits continuation (count + 1) carrier
    let allParents := PrimitiveFuel.pendingParents (environmentCode actions bits) continuation count parents
    CarrierDecoder.decode? program dispatcher.tree bits continuation (Dovetail.clockExit_admissible ..) carrier = some [] →
    ReachableAudit.Holds program dispatcher.tree bits continuation carrier →
    ∃ samples,
      SchedulerResponseInvariant.ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerEmpty.frameConfiguration program dispatcher
          (SchedulerCycle.emptySweepRegisters program count registers) bits continuation
          (SchedulerCycle.emptySweepCarrier program dispatcher bits continuation count registers carrier) parents)
        (SchedulerEmpty.frameConfiguration program dispatcher registers bits continuation carrier allParents) samples ∧
      RootResetExactTraceAgreement.SelectorChain (RootResetFinitePrioritySelector.selectStep? program dispatcher)
        (SchedulerEmpty.frameConfiguration program dispatcher registers bits continuation carrier allParents) samples ∧
      samples.length = SchedulerCycle.emptySweepMutations program dispatcher count registers := by
  dsimp only
  intro empty audit
  induction count generalizing previousRegisters previousBit previousCarrier with
  | zero => exact ⟨[], .done 0 ⟨rfl, rfl⟩, .done _, rfl⟩
  | succ count ih =>
      let continuation := exitTerm program dispatcher horizon remaining bits
      let actions := compileActions program dispatcher.tree
      let environment := environmentCode actions bits
      let carrier := markedExitTerm program dispatcher previousRegisters previousBit bits previousCarrier horizon remaining
      let registers := previousRegisters.advanceEmpty
      let nextCarrier := markedExitTerm program dispatcher registers false bits carrier horizon remaining
      let remainingParents := PrimitiveFuel.pendingParents environment continuation count parents
      let allParents := PrimitiveFuel.pendingParents environment continuation (count + 1) parents
      obtain ⟨firstSamples, firstChain, firstSelected, firstLength⟩ := markedOrigin_frame_selectorChain program dispatcher
        previousRegisters previousBit bits previousCarrier horizon remaining bound (count + 1) parents
        clean empty audit
      have nextEmpty : CarrierDecoder.decode? program dispatcher.tree bits continuation (Dovetail.clockExit_admissible ..) nextCarrier = some [] :=
        SchedulerNestedEmpty.markedZero_decode program dispatcher registers bits continuation carrier (Dovetail.clockExit_admissible ..) empty
      have nextAudit : ReachableAudit.Holds program dispatcher.tree bits continuation nextCarrier :=
        SchedulerEmpty.marked_holds program dispatcher registers bits continuation carrier audit
      obtain ⟨restSamples, restChain, restSelected, restLength⟩ := ih
        (previousRegisters := registers) (previousBit := false) (previousCarrier := carrier) nextEmpty nextAudit
      have parentEq : allParents =
          .right (SchedulerResponse.pendingFunction program dispatcher bits continuation) :: remainingParents := by
        simpa [allParents, remainingParents, environment, actions, SchedulerResponse.pendingFunction,
          PendingFrame.environmentCode_eq_envelope, PendingFrame.frameFunction] using
          (SchedulerCycle.pendingParents_succ_cons environment continuation count parents)
      have pendingRun : SchedulerInvariant.ZeroMutationRun (SchedulerControl.machine program dispatcher)
          (SchedulerControl.compiledProbeCost program dispatcher (.pending .emptyReturn)
            (SchedulerResponse.pendingChildCursor program dispatcher bits continuation nextCarrier remainingParents) + 1)
          (SchedulerEmpty.markedPendingConfiguration program dispatcher registers bits continuation carrier allParents)
          (SchedulerEmpty.frameConfiguration program dispatcher registers.advanceEmpty bits continuation nextCarrier
            remainingParents) := by
        rw [parentEq]
        simpa [nextCarrier, markedExitTerm, SchedulerEmpty.markedPendingConfiguration,
          SchedulerEmpty.markedCursor, SchedulerEmpty.nextFrameConfiguration, SchedulerEmpty.frameConfiguration,
          SchedulerEmpty.pendingProbeConfiguration, SchedulerResponse.pendingChildCursor,
          SchedulerResponse.pendingFunction] using!
          (SchedulerEmpty.pending_zeroRun program dispatcher registers.advanceEmpty bits continuation nextCarrier
            remainingParents)
      have linkedChain := SchedulerResponseInvariant.ExactMutationChain.prepend pendingRun restChain
      have linkedSelected := RootResetExactTraceAgreement.SelectorChain.prepend pendingRun restSelected
      refine ⟨firstSamples ++ restSamples, ?_, ?_, ?_⟩
      · have full := SchedulerRecurrence.ExactMutationChain.append firstChain linkedChain
        simpa only [SchedulerCycle.emptySweepRegisters, SchedulerCycle.emptySweepCarrier,
          registers, carrier, nextCarrier, markedExitTerm, allParents, remainingParents,
          environment, actions, continuation] using full
      · exact RootResetExactTraceAgreement.SelectorChain.append firstChain firstSelected linkedSelected
      · rw [List.length_append, firstLength, restLength]
        rfl

theorem markedOrigin_completeSweep_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (previousRegisters : SchedulerControl.Registers program) (previousBit : Bool)
    (bits : List Bool) (previousCarrier : Term) (horizon remaining : Nat)
    (bound : remaining ≤ horizon) (count : Nat) (parents : List ParentFrame)
    {history : Nat}
    (clean : RootResetCleanTraversableParents.CleanParents program dispatcher parents history) :
    let continuation := exitTerm program dispatcher horizon remaining bits
    let carrier := markedExitTerm program dispatcher previousRegisters previousBit bits previousCarrier horizon remaining
    let registers := previousRegisters.advanceEmpty
    let actions := compileActions program dispatcher.tree
    let active := pending actions bits continuation (count + 1) carrier
    let allParents := PrimitiveFuel.pendingParents (environmentCode actions bits) continuation count parents
    CarrierDecoder.decode? program dispatcher.tree bits continuation (Dovetail.clockExit_admissible ..) carrier = some [] →
    ReachableAudit.Holds program dispatcher.tree bits continuation carrier →
    ∃ samples,
      SchedulerResponseInvariant.ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerEmpty.markedPendingConfiguration program dispatcher
          (SchedulerCycle.emptySweepRegisters program count registers) bits continuation
          (SchedulerCycle.emptySweepCarrier program dispatcher bits continuation count registers carrier) parents)
        (SchedulerEmpty.frameConfiguration program dispatcher registers bits continuation carrier allParents) samples ∧
      RootResetExactTraceAgreement.SelectorChain (RootResetFinitePrioritySelector.selectStep? program dispatcher)
        (SchedulerEmpty.frameConfiguration program dispatcher registers bits continuation carrier allParents) samples ∧
      samples.length = SchedulerRootContinuation.emptyCleanupMutations program dispatcher count registers := by
  dsimp only
  intro empty audit
  induction count generalizing previousRegisters previousBit previousCarrier with
  | zero =>
      obtain ⟨samples, chain, selected, lengthEq⟩ :=
        markedOrigin_frame_selectorChain program dispatcher previousRegisters previousBit bits
          previousCarrier horizon remaining bound 0 parents clean empty audit
      refine ⟨samples, chain, selected, ?_⟩
      simpa only [SchedulerRootContinuation.emptyCleanupMutations,
        SchedulerCycle.emptySweepMutations, SchedulerCycle.emptySweepRegisters,
        Nat.zero_add] using lengthEq
  | succ count ih =>
      let continuation := exitTerm program dispatcher horizon remaining bits
      let actions := compileActions program dispatcher.tree
      let environment := environmentCode actions bits
      let carrier := markedExitTerm program dispatcher previousRegisters previousBit bits previousCarrier horizon remaining
      let registers := previousRegisters.advanceEmpty
      let nextCarrier := markedExitTerm program dispatcher registers false bits carrier horizon remaining
      let remainingParents := PrimitiveFuel.pendingParents environment continuation count parents
      let allParents := PrimitiveFuel.pendingParents environment continuation (count + 1) parents
      obtain ⟨firstSamples, firstChain, firstSelected, firstLength⟩ := markedOrigin_frame_selectorChain program dispatcher
        previousRegisters previousBit bits previousCarrier horizon remaining bound (count + 1) parents
        clean empty audit
      have nextEmpty : CarrierDecoder.decode? program dispatcher.tree bits continuation (Dovetail.clockExit_admissible ..) nextCarrier = some [] :=
        SchedulerNestedEmpty.markedZero_decode program dispatcher registers bits continuation carrier (Dovetail.clockExit_admissible ..) empty
      have nextAudit : ReachableAudit.Holds program dispatcher.tree bits continuation nextCarrier :=
        SchedulerEmpty.marked_holds program dispatcher registers bits continuation carrier audit
      obtain ⟨restSamples, restChain, restSelected, restLength⟩ := ih
        (previousRegisters := registers) (previousBit := false) (previousCarrier := carrier) nextEmpty nextAudit
      have parentEq : allParents =
          .right (SchedulerResponse.pendingFunction program dispatcher bits continuation) :: remainingParents := by
        simpa [allParents, remainingParents, environment, actions, SchedulerResponse.pendingFunction,
          PendingFrame.environmentCode_eq_envelope, PendingFrame.frameFunction] using
          (SchedulerCycle.pendingParents_succ_cons environment continuation count parents)
      have pendingRun : SchedulerInvariant.ZeroMutationRun (SchedulerControl.machine program dispatcher)
          (SchedulerControl.compiledProbeCost program dispatcher (.pending .emptyReturn)
            (SchedulerResponse.pendingChildCursor program dispatcher bits continuation nextCarrier remainingParents) + 1)
          (SchedulerEmpty.markedPendingConfiguration program dispatcher registers bits continuation carrier allParents)
          (SchedulerEmpty.frameConfiguration program dispatcher registers.advanceEmpty bits continuation nextCarrier
            remainingParents) := by
        rw [parentEq]
        simpa [nextCarrier, markedExitTerm, SchedulerEmpty.markedPendingConfiguration,
          SchedulerEmpty.markedCursor, SchedulerEmpty.nextFrameConfiguration, SchedulerEmpty.frameConfiguration,
          SchedulerEmpty.pendingProbeConfiguration, SchedulerResponse.pendingChildCursor,
          SchedulerResponse.pendingFunction] using!
          (SchedulerEmpty.pending_zeroRun program dispatcher registers.advanceEmpty bits continuation nextCarrier
            remainingParents)
      have linkedChain := SchedulerResponseInvariant.ExactMutationChain.prepend pendingRun restChain
      have linkedSelected := RootResetExactTraceAgreement.SelectorChain.prepend pendingRun restSelected
      refine ⟨firstSamples ++ restSamples, ?_, ?_, ?_⟩
      · have full := SchedulerRecurrence.ExactMutationChain.append firstChain linkedChain
        simpa only [SchedulerCycle.emptySweepRegisters, SchedulerCycle.emptySweepCarrier,
          registers, carrier, nextCarrier, markedExitTerm, allParents, remainingParents,
          environment, actions, continuation] using full
      · exact RootResetExactTraceAgreement.SelectorChain.append firstChain firstSelected linkedSelected
      · rw [List.length_append, firstLength, restLength]
        simp only [SchedulerRootContinuation.emptyCleanupMutations,
          SchedulerCycle.emptySweepMutations, SchedulerCycle.emptySweepRegisters,
          Nat.add_assoc, registers]

end PureSFormal.Research.RootResetFiniteEmptySweep
