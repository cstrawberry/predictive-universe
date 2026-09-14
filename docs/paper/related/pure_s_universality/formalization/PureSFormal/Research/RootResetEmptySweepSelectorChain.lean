import PureSFormal.Research.RootResetEmptyPostMarkerHandoff

/-!
# Selector agreement for repeated EMPTY responses

After a marked response, every further pending EMPTY frame has its exact
entry, FRAME residuals, complete dispatcher route, and COMMIT selected from
the erased term.  Mutation-free controller moves connect consecutive frames.
-/

namespace PureSFormal.Research.RootResetEmptySweepSelectorChain

open PureSFormal.PureS
open RootResetPersistentResponseSelector
open RootResetReachableStageGrammar
open RootResetWrappedFrameSelectorProof
open RootResetMarkedFrameSelectorProof
open RootResetWrappedEmptyCommit
open RootResetEmptyHandoffContext
open RootResetEmptyPostMarkerHandoff

theorem markedExit_false_decode
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program)
    (bits : List Bool) (carrier : Term) (horizon remaining : Nat) :
    CheckpointDecoder.decodeCarrier? program dispatcher.tree
      (markedExitTerm program dispatcher registers false bits carrier horizon remaining) =
      CheckpointDecoder.decodeCarrier? program dispatcher.tree carrier := by
  have parsed := markedExit_parsed program dispatcher registers false bits carrier horizon remaining
  have notBase := CheckpointRun.parseBase?_none_of_localShape (CheckpointDecoder.parseLocal?_sound parsed)
  rw [CheckpointDecoder.decodeCarrier?, notBase]
  dsimp only
  rw [parsed]
  rfl

/-- A frame whose carrier is the previous marked response has agreement
starting before its first contraction and ending after its own COMMIT. -/
theorem markedOrigin_frame_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (previousRegisters : SchedulerControl.Registers program) (previousBit : Bool)
    (bits : List Bool) (previousCarrier : Term) (horizon remaining : Nat)
    (bound : remaining ≤ horizon) (depth : Nat) (parents : List ParentFrame)
    {history : List (CheckpointDecoder.LocalView program)} :
    let continuation := exitTerm program dispatcher horizon remaining bits
    let carrier := markedExitTerm program dispatcher previousRegisters previousBit bits previousCarrier horizon remaining
    let registers := previousRegisters.advanceEmpty
    let actions := compileActions program dispatcher.tree
    let active := pending actions bits continuation (depth + 1) carrier
    let allParents := PrimitiveFuel.pendingParents (environmentCode actions bits) continuation depth parents
    CheckpointDecoder.decodeCarrier? program dispatcher.tree carrier = some [] →
    carrierTombstoneCount? program dispatcher.tree carrier = some 0 →
    MarkedPrefix program dispatcher.tree (Cursor.rebuild parents active) active
      (SchedulerInvariant.contextOfParents parents) history →
    ∃ samples,
      SchedulerResponseInvariant.ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerEmpty.markedPendingConfiguration program dispatcher registers bits continuation carrier allParents)
        (SchedulerEmpty.frameConfiguration program dispatcher registers bits continuation carrier allParents) samples ∧
      RootResetExactTraceAgreement.SelectorChain (selectStep? program dispatcher)
        (SchedulerEmpty.frameConfiguration program dispatcher registers bits continuation carrier allParents) samples := by
  dsimp only
  intro empty tombstones shape
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
  have firstStop := pending_parseMarked_none program dispatcher bits continuation _
    (RootResetFrameFirstSelectorProof.first_marked_none program dispatcher bits continuation carrier) depth
  obtain ⟨firstHistory, firstShape⟩ := markedPrefix_replace shape firstStop
  have firstShape' : MarkedPrefix program dispatcher.tree
      (Cursor.rebuild parents (pending actions bits continuation depth
        (SchedulerResponseInvariant.frameFirstRoot actions bits continuation carrier)))
      (pending actions bits continuation depth
        (SchedulerResponseInvariant.frameFirstRoot actions bits continuation carrier))
      (SchedulerInvariant.contextOfParents parents) firstHistory := by
    rw [← SchedulerInvariant.contextOfParents_plug]
    exact firstShape
  obtain ⟨first, rest, responseChain, responseSelected⟩ :=
    emptyResponse_marked_through_marker_selectorChain program dispatcher registers bits bits
      continuation continuation carrier carrierNot3 phaseEq bitEq empty tombstones depth parents firstShape'
  have sourceShape : MarkedPrefix program dispatcher.tree
      (SchedulerEmpty.responseStartConfiguration program dispatcher registers bits continuation carrier allParents).cursor.erase
      (pending actions bits continuation (depth + 1) carrier)
      (SchedulerInvariant.contextOfParents parents) history := by
    change MarkedPrefix program dispatcher.tree
      (Cursor.rebuild allParents (frame (environmentCode actions bits) continuation carrier)) _ _ _
    rw [pending_rebuild_under_parents, ← pending_succ_innermost,
      SchedulerInvariant.contextOfParents_plug]
    exact shape
  have firstSelected := (postMarker_firstFrame_selectorChain program dispatcher previousRegisters registers
    previousBit bits previousCarrier horizon remaining bound depth parents sourceShape responseChain).head
  have selected : RootResetExactTraceAgreement.SelectorChain (selectStep? program dispatcher)
      (SchedulerEmpty.responseStartConfiguration program dispatcher registers bits continuation carrier allParents)
      (first :: rest) := .next firstSelected responseSelected
  have entered := SchedulerEmpty.enterResponse_zeroRun program dispatcher registers bits continuation carrier allParents
  exact ⟨first :: rest, SchedulerResponseInvariant.ExactMutationChain.prepend entered responseChain,
    RootResetExactTraceAgreement.SelectorChain.prepend entered selected⟩

/-- Every further pending EMPTY frame in a marked-origin sweep is selected
from the bare term.  The terminal frame remains as the exact endpoint. -/
theorem markedOrigin_pendingSweep_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (previousRegisters : SchedulerControl.Registers program) (previousBit : Bool)
    (bits : List Bool) (previousCarrier : Term) (horizon remaining : Nat)
    (bound : remaining ≤ horizon) (count : Nat) (parents : List ParentFrame)
    {history : List (CheckpointDecoder.LocalView program)} :
    let continuation := exitTerm program dispatcher horizon remaining bits
    let carrier := markedExitTerm program dispatcher previousRegisters previousBit bits previousCarrier horizon remaining
    let registers := previousRegisters.advanceEmpty
    let actions := compileActions program dispatcher.tree
    let active := pending actions bits continuation (count + 1) carrier
    let allParents := PrimitiveFuel.pendingParents (environmentCode actions bits) continuation count parents
    CheckpointDecoder.decodeCarrier? program dispatcher.tree carrier = some [] →
    carrierTombstoneCount? program dispatcher.tree carrier = some 0 →
    MarkedPrefix program dispatcher.tree (Cursor.rebuild parents active) active
      (SchedulerInvariant.contextOfParents parents) history →
    ∃ samples,
      SchedulerResponseInvariant.ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerEmpty.frameConfiguration program dispatcher
          (SchedulerCycle.emptySweepRegisters program count registers) bits continuation
          (SchedulerCycle.emptySweepCarrier program dispatcher bits continuation count registers carrier) parents)
        (SchedulerEmpty.frameConfiguration program dispatcher registers bits continuation carrier allParents) samples ∧
      RootResetExactTraceAgreement.SelectorChain (selectStep? program dispatcher)
        (SchedulerEmpty.frameConfiguration program dispatcher registers bits continuation carrier allParents) samples := by
  dsimp only
  intro empty tombstones shape
  induction count generalizing previousRegisters previousBit previousCarrier history with
  | zero => exact ⟨[], .done 0 ⟨rfl, rfl⟩, .done _⟩
  | succ count ih =>
      let continuation := exitTerm program dispatcher horizon remaining bits
      let actions := compileActions program dispatcher.tree
      let environment := environmentCode actions bits
      let carrier := markedExitTerm program dispatcher previousRegisters previousBit bits previousCarrier horizon remaining
      let registers := previousRegisters.advanceEmpty
      let nextCarrier := markedExitTerm program dispatcher registers false bits carrier horizon remaining
      let remainingParents := PrimitiveFuel.pendingParents environment continuation count parents
      let allParents := PrimitiveFuel.pendingParents environment continuation (count + 1) parents
      obtain ⟨firstSamples, firstChain, firstSelected⟩ := markedOrigin_frame_selectorChain program dispatcher
        previousRegisters previousBit bits previousCarrier horizon remaining bound (count + 1) parents
        empty tombstones shape
      have nextEmpty : CheckpointDecoder.decodeCarrier? program dispatcher.tree nextCarrier = some [] := by
        rw [markedExit_false_decode]
        exact empty
      have nextTombstones : carrierTombstoneCount? program dispatcher.tree nextCarrier = some 0 := by
        rw [show nextCarrier = LocalResponse.markedCompleted bits continuation carrier
          (SchedulerResponse.completedRoute program dispatcher registers false carrier) by rfl,
          markedEmpty_tombstoneCount]
        exact tombstones
      have stopped : parseMarkedLocal? program dispatcher.tree
          (pending actions bits continuation (count + 1) nextCarrier) = none := by
        rw [pending, parseMarkedLocal?, frame_local_none]
      obtain ⟨nextHistory, nextShape⟩ := markedPrefix_replace shape stopped
      have nextShape' : MarkedPrefix program dispatcher.tree
          (Cursor.rebuild parents (pending actions bits continuation (count + 1) nextCarrier))
          (pending actions bits continuation (count + 1) nextCarrier)
          (SchedulerInvariant.contextOfParents parents) nextHistory := by
        rw [← SchedulerInvariant.contextOfParents_plug]
        exact nextShape
      obtain ⟨restSamples, restChain, restSelected⟩ := ih
        (previousRegisters := registers) (previousBit := false) (previousCarrier := carrier)
        (history := nextHistory) nextEmpty nextTombstones nextShape'
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
      refine ⟨firstSamples ++ restSamples, ?_, ?_⟩
      · have full := SchedulerRecurrence.ExactMutationChain.append firstChain linkedChain
        simpa only [SchedulerCycle.emptySweepRegisters, SchedulerCycle.emptySweepCarrier,
          registers, carrier, nextCarrier, markedExitTerm, allParents, remainingParents,
          environment, actions, continuation] using full
      · exact RootResetExactTraceAgreement.SelectorChain.append firstChain firstSelected linkedSelected

end PureSFormal.Research.RootResetEmptySweepSelectorChain
