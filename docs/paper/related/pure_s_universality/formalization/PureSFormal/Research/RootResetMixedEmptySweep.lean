import PureSFormal.Research.RootResetMixedMarkedHandoff
import PureSFormal.Research.RootResetEmptySweepSelectorChain

/-! Repeated actual EMPTY responses through mixed generated histories. -/
namespace PureSFormal.Research.RootResetMixedEmptySweep

open PureSFormal.PureS
open RootResetPersistentResponseSelector RootResetReachableStageGrammar
open RootResetWrappedFrameSelectorProof RootResetMarkedFrameSelectorProof
open RootResetWrappedEmptyCommit RootResetEmptyHandoffContext
open RootResetEmptyPostMarkerHandoff RootResetMixedResponseContext
open RootResetEmptySweepSelectorChain

structure CountBound (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (term : Term) : Prop where
  counts : ∃ locals tombstones,
    carrierLocalCount? program tree term = some locals ∧
    carrierTombstoneCount? program tree term = some tombstones ∧
    tombstones ≤ locals + 1

theorem CountBound.notDeleted {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} (bound : CountBound program tree term) :
    ∀ locals tombstones, carrierLocalCount? program tree term = some locals →
      carrierTombstoneCount? program tree term = some tombstones → tombstones ≠ locals + 2 := by
  obtain ⟨foundLocals, foundTombs, localEq, tombEq, upper⟩ := bound.counts
  intro locals tombstones localsEq tombsEq equal
  have localsSame := Option.some.inj (localEq.symm.trans localsEq)
  have tombsSame := Option.some.inj (tombEq.symm.trans tombsEq)
  rw [localsSame, tombsSame, equal] at upper
  exact Nat.not_succ_le_self (locals + 1) upper

theorem CountBound.marked {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {carrier : Term} (bound : CountBound program dispatcher.tree carrier)
    (registers : SchedulerControl.Registers program) (bits : List Bool) (continuation : Term) :
    CountBound program dispatcher.tree
      (LocalResponse.markedCompleted bits continuation carrier
        (SchedulerResponse.completedRoute program dispatcher registers false carrier)) := by
  obtain ⟨locals, tombstones, localEq, tombEq, upper⟩ := bound.counts
  have parsed := CheckpointDecoder.parseLocal?_markedCompleted (continuation := continuation) bits
    (SchedulerResponse.completedRoute_snapshotDispatch program dispatcher registers false carrier)
  refine ⟨locals + 1, tombstones, ?_, ?_, Nat.le_trans upper (Nat.le_succ _)⟩
  · rw [carrierLocalCount?, CheckpointRun.parseBase?_none_of_localShape
      (CheckpointDecoder.parseLocal?_sound parsed), parsed]
    change (carrierLocalCount? program dispatcher.tree carrier).map Nat.succ = _
    rw [localEq]
    rfl
  · rw [markedEmpty_tombstoneCount, tombEq]

theorem markedOrigin_frame_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (previousRegisters : SchedulerControl.Registers program) (previousBit : Bool)
    (bits : List Bool) (previousCarrier : Term) (horizon remaining : Nat)
    (bound : remaining ≤ horizon) (depth : Nat) (parents : List ParentFrame)
    {roles : List RootResetPersistentRouteA.Role}
    {history : List (CheckpointDecoder.LocalView program)} :
    let continuation := exitTerm program dispatcher horizon remaining bits
    let carrier := markedExitTerm program dispatcher previousRegisters previousBit bits previousCarrier horizon remaining
    let registers := previousRegisters.advanceEmpty
    let actions := compileActions program dispatcher.tree
    let active := pending actions bits continuation (depth + 1) carrier
    let allParents := PrimitiveFuel.pendingParents (environmentCode actions bits) continuation depth parents
    CheckpointDecoder.decodeCarrier? program dispatcher.tree carrier = some [] →
    CountBound program dispatcher.tree carrier →
    Prefix program dispatcher (Cursor.rebuild parents active) active
      (SchedulerInvariant.contextOfParents parents) roles history →
    ∃ samples,
      SchedulerResponseInvariant.ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerEmpty.markedPendingConfiguration program dispatcher registers bits continuation carrier allParents)
        (SchedulerEmpty.frameConfiguration program dispatcher registers bits continuation carrier allParents) samples ∧
      RootResetExactTraceAgreement.SelectorChain (selectStep? program dispatcher)
        (SchedulerEmpty.frameConfiguration program dispatcher registers bits continuation carrier allParents) samples ∧
      samples.length = LocalResponse.completedCost program
        (dispatcher.route (registers.phase, false)) (registers.phase, false) + 1 := by
  dsimp only
  intro empty counts shape
  let continuation := exitTerm program dispatcher horizon remaining bits
  let carrier := markedExitTerm program dispatcher previousRegisters previousBit bits previousCarrier horizon remaining
  let registers := previousRegisters.advanceEmpty
  let actions := compileActions program dispatcher.tree
  let allParents := PrimitiveFuel.pendingParents (environmentCode actions bits) continuation depth parents
  have carrierNot3 : carrier.headArity ≠ 3 := by
    change 5 ≠ 3
    decide
  have phaseEq : carrierPhase? program dispatcher.tree carrier = some registers.phase :=
    RootResetEmptyResponseSelectorChain.markedCompleted_phase program dispatcher previousRegisters previousBit
      bits continuation previousCarrier
  have bitEq : carrierResponseBit? program dispatcher.tree carrier = some false :=
    RootResetEmptyResponseSelectorChain.markedCompleted_responseBit program dispatcher previousRegisters previousBit
      bits continuation previousCarrier
  obtain ⟨firstHistory, firstShape⟩ := shape.replace
    (pending actions bits continuation depth
      (SchedulerResponseInvariant.frameFirstRoot actions bits continuation carrier))
  have firstShape' : Prefix program dispatcher
      (Cursor.rebuild parents (pending actions bits continuation depth
        (SchedulerResponseInvariant.frameFirstRoot actions bits continuation carrier)))
      (pending actions bits continuation depth
        (SchedulerResponseInvariant.frameFirstRoot actions bits continuation carrier))
      (SchedulerInvariant.contextOfParents parents) roles firstHistory := by
    rw [← SchedulerInvariant.contextOfParents_plug]
    exact firstShape
  obtain ⟨first, rest, responseChain, responseSelected, responseLength⟩ :=
    RootResetMixedEmptyResponseChain.emptyResponse_mixed_through_marker_selectorChain program dispatcher registers bits bits
      continuation continuation carrier carrierNot3 phaseEq bitEq empty counts.notDeleted depth parents firstShape'
  have sourceShape : Prefix program dispatcher
      (SchedulerEmpty.responseStartConfiguration program dispatcher registers bits continuation carrier allParents).cursor.erase
      (pending actions bits continuation (depth + 1) carrier)
      (SchedulerInvariant.contextOfParents parents) roles history := by
    change Prefix program dispatcher
      (Cursor.rebuild allParents (frame (environmentCode actions bits) continuation carrier)) _ _ _ _
    rw [pending_rebuild_under_parents, ← pending_succ_innermost,
      SchedulerInvariant.contextOfParents_plug]
    exact shape
  have firstSelected : selectStep? program dispatcher
      (SchedulerEmpty.responseStartConfiguration program dispatcher registers bits continuation carrier allParents).cursor.erase =
      some first.cursor.erase := by
    rw [RootResetEmptyPostMarkerHandoff.emptyResponse_first_erase program dispatcher registers bits _ _ _ responseChain,
      pending_rebuild_under_parents]
    exact RootResetMixedMarkedHandoff.selectStep?_mixed_pending_exit program dispatcher previousRegisters previousBit
      bits bits continuation previousCarrier horizon remaining bound depth sourceShape
  have selected : RootResetExactTraceAgreement.SelectorChain (selectStep? program dispatcher)
      (SchedulerEmpty.responseStartConfiguration program dispatcher registers bits continuation carrier allParents)
      (first :: rest) := .next firstSelected responseSelected
  have entered := SchedulerEmpty.enterResponse_zeroRun program dispatcher registers bits continuation carrier allParents
  exact ⟨first :: rest, SchedulerResponseInvariant.ExactMutationChain.prepend entered responseChain,
    RootResetExactTraceAgreement.SelectorChain.prepend entered selected, responseLength⟩

/-- Every further pending EMPTY frame in a marked-origin sweep is selected
from the bare term.  The terminal frame remains as the exact endpoint. -/
theorem markedOrigin_pendingSweep_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (previousRegisters : SchedulerControl.Registers program) (previousBit : Bool)
    (bits : List Bool) (previousCarrier : Term) (horizon remaining : Nat)
    (bound : remaining ≤ horizon) (count : Nat) (parents : List ParentFrame)
    {roles : List RootResetPersistentRouteA.Role}
    {history : List (CheckpointDecoder.LocalView program)} :
    let continuation := exitTerm program dispatcher horizon remaining bits
    let carrier := markedExitTerm program dispatcher previousRegisters previousBit bits previousCarrier horizon remaining
    let registers := previousRegisters.advanceEmpty
    let actions := compileActions program dispatcher.tree
    let active := pending actions bits continuation (count + 1) carrier
    let allParents := PrimitiveFuel.pendingParents (environmentCode actions bits) continuation count parents
    CheckpointDecoder.decodeCarrier? program dispatcher.tree carrier = some [] →
    CountBound program dispatcher.tree carrier →
    Prefix program dispatcher (Cursor.rebuild parents active) active
      (SchedulerInvariant.contextOfParents parents) roles history →
    ∃ samples,
      SchedulerResponseInvariant.ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerEmpty.frameConfiguration program dispatcher
          (SchedulerCycle.emptySweepRegisters program count registers) bits continuation
          (SchedulerCycle.emptySweepCarrier program dispatcher bits continuation count registers carrier) parents)
        (SchedulerEmpty.frameConfiguration program dispatcher registers bits continuation carrier allParents) samples ∧
      RootResetExactTraceAgreement.SelectorChain (selectStep? program dispatcher)
        (SchedulerEmpty.frameConfiguration program dispatcher registers bits continuation carrier allParents) samples ∧
      samples.length = SchedulerCycle.emptySweepMutations program dispatcher count registers := by
  dsimp only
  intro empty counts shape
  induction count generalizing previousRegisters previousBit previousCarrier history with
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
        empty counts shape
      have nextEmpty : CheckpointDecoder.decodeCarrier? program dispatcher.tree nextCarrier = some [] := by
        rw [markedExit_false_decode]
        exact empty
      have nextCounts : CountBound program dispatcher.tree nextCarrier :=
        counts.marked registers bits continuation
      obtain ⟨nextHistory, nextShape⟩ := shape.replace
        (pending actions bits continuation (count + 1) nextCarrier)
      have nextShape' : Prefix program dispatcher
          (Cursor.rebuild parents (pending actions bits continuation (count + 1) nextCarrier))
          (pending actions bits continuation (count + 1) nextCarrier)
          (SchedulerInvariant.contextOfParents parents) roles nextHistory := by
        rw [← SchedulerInvariant.contextOfParents_plug]
        exact nextShape
      obtain ⟨restSamples, restChain, restSelected, restLength⟩ := ih
        (previousRegisters := registers) (previousBit := false) (previousCarrier := carrier)
        (history := nextHistory) nextEmpty nextCounts nextShape'
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
    {roles : List RootResetPersistentRouteA.Role}
    {history : List (CheckpointDecoder.LocalView program)} :
    let continuation := exitTerm program dispatcher horizon remaining bits
    let carrier := markedExitTerm program dispatcher previousRegisters previousBit bits previousCarrier horizon remaining
    let registers := previousRegisters.advanceEmpty
    let actions := compileActions program dispatcher.tree
    let active := pending actions bits continuation (count + 1) carrier
    let allParents := PrimitiveFuel.pendingParents (environmentCode actions bits) continuation count parents
    CheckpointDecoder.decodeCarrier? program dispatcher.tree carrier = some [] →
    CountBound program dispatcher.tree carrier →
    Prefix program dispatcher (Cursor.rebuild parents active) active
      (SchedulerInvariant.contextOfParents parents) roles history →
    ∃ samples,
      SchedulerResponseInvariant.ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerEmpty.markedPendingConfiguration program dispatcher
          (SchedulerCycle.emptySweepRegisters program count registers) bits continuation
          (SchedulerCycle.emptySweepCarrier program dispatcher bits continuation count registers carrier) parents)
        (SchedulerEmpty.frameConfiguration program dispatcher registers bits continuation carrier allParents) samples ∧
      RootResetExactTraceAgreement.SelectorChain (selectStep? program dispatcher)
        (SchedulerEmpty.frameConfiguration program dispatcher registers bits continuation carrier allParents) samples ∧
      samples.length = SchedulerRootContinuation.emptyCleanupMutations program dispatcher count registers := by
  dsimp only
  intro empty counts shape
  induction count generalizing previousRegisters previousBit previousCarrier history with
  | zero =>
      obtain ⟨samples, chain, selected, lengthEq⟩ :=
        markedOrigin_frame_selectorChain program dispatcher previousRegisters previousBit bits
          previousCarrier horizon remaining bound 0 parents empty counts shape
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
        empty counts shape
      have nextEmpty : CheckpointDecoder.decodeCarrier? program dispatcher.tree nextCarrier = some [] := by
        rw [markedExit_false_decode]
        exact empty
      have nextCounts : CountBound program dispatcher.tree nextCarrier :=
        counts.marked registers bits continuation
      obtain ⟨nextHistory, nextShape⟩ := shape.replace
        (pending actions bits continuation (count + 1) nextCarrier)
      have nextShape' : Prefix program dispatcher
          (Cursor.rebuild parents (pending actions bits continuation (count + 1) nextCarrier))
          (pending actions bits continuation (count + 1) nextCarrier)
          (SchedulerInvariant.contextOfParents parents) roles nextHistory := by
        rw [← SchedulerInvariant.contextOfParents_plug]
        exact nextShape
      obtain ⟨restSamples, restChain, restSelected, restLength⟩ := ih
        (previousRegisters := registers) (previousBit := false) (previousCarrier := carrier)
        (history := nextHistory) nextEmpty nextCounts nextShape'
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

end PureSFormal.Research.RootResetMixedEmptySweep
