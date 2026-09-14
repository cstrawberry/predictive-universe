import PureSFormal.Research.RootResetEmptySweepSelectorChain

/-!
# Initially empty pending sweeps

The immutable empty Base supplies the first response entry.  Its marked
response then supplies the provenance needed by every further pending frame.
The exact chain retains all controller contractions and selector choices.
-/

namespace PureSFormal.Research.RootResetInitialEmptySweep

open PureSFormal.PureS
open RootResetPersistentResponseSelector
open RootResetReachableStageGrammar
open RootResetWrappedFrameSelectorProof
open RootResetMarkedFrameSelectorProof
open RootResetEmptyResponseSelectorChain
open RootResetWrappedEmptyCommit
open RootResetEmptyHandoffContext
open RootResetEmptyPostMarkerHandoff
open RootResetEmptySweepSelectorChain

theorem selectStep?_markedPrefix_of_fuelParsed
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {whole endpoint : Term} {context : Context}
    {history : List (CheckpointDecoder.LocalView program)}
    {view : RootResetPersistentFuelCarrier.View}
    (shape : MarkedPrefix program dispatcher.tree whole endpoint context history)
    (parsed : RootResetPersistentFuelCarrier.parse? (compileActions program dispatcher.tree) endpoint = some view) :
    selectStep? program dispatcher whole = some (context.plug (view.target (compileActions program dispatcher.tree))) := by
  have rootEq : RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher endpoint =
      ⟨endpoint, .hole, [], [], []⟩ := by
    rw [RootResetPersistentRouteAFuel.fuelActiveContext, parsed]
  have outerEq := fuelActiveContext_markedPrefix shape
  rw [rootEq] at outerEq
  have atOuter : RootResetPersistentFuelCarrier.parse? (compileActions program dispatcher.tree)
      (RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher whole).active = some view := by
    rw [outerEq]
    exact parsed
  have priority := RootResetPersistentRouteAFuel.classifyHandoff_fuel_priority
    (program := program) (layout := dispatcher) atOuter
  apply selectStep?_eq_some_of_baseFuel priority.1 priority.2
  change (RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher whole).context.plug _ = _
  rw [outerEq]
  simp only [prependMarked, RootResetRuntimeContextBridge.context_comp_hole]

theorem pending_base_eq_nestedFrames (actions : Term) (bits : List Bool)
    (continuation : Term) (count : Nat) :
    pending actions bits continuation count (baseCarrier (environmentCode actions bits) continuation) =
      nestedFrames (environmentCode actions bits) continuation count := by
  induction count with
  | zero => rfl
  | succ count ih => exact congrArg (frame (environmentCode actions bits) continuation) ih

theorem selectStep?_marked_pending_emptyBase
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (continuation : Term) (admissible : Carrier.Admissible continuation) (depth : Nat)
    {whole : Term} {context : Context} {history : List (CheckpointDecoder.LocalView program)}
    (shape : MarkedPrefix program dispatcher.tree whole
      (pending (compileActions program dispatcher.tree) [] continuation (depth + 1)
        (baseCarrier (environmentCode (compileActions program dispatcher.tree) []) continuation)) context history) :
    selectStep? program dispatcher whole =
      some (context.plug (pending (compileActions program dispatcher.tree) [] continuation depth
        (SchedulerResponseInvariant.frameFirstRoot (compileActions program dispatcher.tree) [] continuation
          (baseCarrier (environmentCode (compileActions program dispatcher.tree) []) continuation)))) := by
  rw [pending_base_eq_nestedFrames] at shape
  have parsed := nestedFrames_parse_empty (compileActions program dispatcher.tree) continuation admissible depth
  have lifted := selectStep?_markedPrefix_of_fuelParsed shape parsed
  have localSelected := selectStep?_rebuild_of_fuelParsed
    (RootResetTraversableCompletedParents.TraversableParents.root
      (program := program) (dispatcher := dispatcher)) parsed
  have exactSelected := selectStep?_nestedFrames_empty program dispatcher continuation admissible depth
  have targetEq := Option.some.inj (localSelected.symm.trans exactSelected)
  dsimp only [Cursor.rebuild] at targetEq
  rw [targetEq] at lifted
  simpa only [pending_rebuild] using lifted

/-- The first EMPTY frame has full agreement from its Base entry through
COMMIT, under the actual completed marked outer context. -/
theorem initialEmpty_frame_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (continuation : Term) (admissible : Carrier.Admissible continuation)
    (depth : Nat) (parents : List ParentFrame)
    {history : List (CheckpointDecoder.LocalView program)} :
    let actions := compileActions program dispatcher.tree
    let carrier := baseCarrier (environmentCode actions []) continuation
    let registers := SchedulerNestedEmpty.initialEmptyRegisters program
    let active := pending actions [] continuation (depth + 1) carrier
    let allParents := PrimitiveFuel.pendingParents (environmentCode actions []) continuation depth parents
    MarkedPrefix program dispatcher.tree (Cursor.rebuild parents active) active
      (SchedulerInvariant.contextOfParents parents) history →
    ∃ samples,
      SchedulerResponseInvariant.ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerEmpty.markedPendingConfiguration program dispatcher registers [] continuation carrier allParents)
        (SchedulerEmpty.frameConfiguration program dispatcher registers [] continuation carrier allParents) samples ∧
      RootResetExactTraceAgreement.SelectorChain (selectStep? program dispatcher)
        (SchedulerEmpty.frameConfiguration program dispatcher registers [] continuation carrier allParents) samples := by
  dsimp only
  intro shape
  let actions := compileActions program dispatcher.tree
  let carrier := baseCarrier (environmentCode actions []) continuation
  let registers := SchedulerNestedEmpty.initialEmptyRegisters program
  let allParents := PrimitiveFuel.pendingParents (environmentCode actions []) continuation depth parents
  have firstStop := pending_parseMarked_none program dispatcher [] continuation _
    (RootResetFrameFirstSelectorProof.first_marked_none program dispatcher [] continuation carrier) depth
  obtain ⟨firstHistory, firstShape⟩ := markedPrefix_replace shape firstStop
  have firstShape' : MarkedPrefix program dispatcher.tree
      (Cursor.rebuild parents (pending actions [] continuation depth
        (SchedulerResponseInvariant.frameFirstRoot actions [] continuation carrier)))
      (pending actions [] continuation depth
        (SchedulerResponseInvariant.frameFirstRoot actions [] continuation carrier))
      (SchedulerInvariant.contextOfParents parents) firstHistory := by
    rw [← SchedulerInvariant.contextOfParents_plug]
    exact firstShape
  obtain ⟨first, rest, responseChain, responseSelected⟩ :=
    generatedEmptyResponse_marked_through_marker_selectorChain program dispatcher continuation admissible 0
      [] continuation depth parents firstShape'
  have entry := selectStep?_marked_pending_emptyBase program dispatcher continuation admissible depth shape
  have firstSelected : selectStep? program dispatcher
      (SchedulerEmpty.responseStartConfiguration program dispatcher registers [] continuation carrier allParents).cursor.erase =
      some first.cursor.erase := by
    rw [emptyResponse_first_erase program dispatcher registers [] continuation carrier allParents responseChain]
    change selectStep? program dispatcher (Cursor.rebuild allParents
      (frame (environmentCode actions []) continuation carrier)) = _
    rw [pending_rebuild_under_parents, pending_rebuild_under_parents,
      ← pending_succ_innermost, SchedulerInvariant.contextOfParents_plug]
    exact entry
  have entered := SchedulerEmpty.enterResponse_zeroRun program dispatcher registers [] continuation carrier allParents
  exact ⟨first :: rest, SchedulerResponseInvariant.ExactMutationChain.prepend entered responseChain,
    RootResetExactTraceAgreement.SelectorChain.prepend entered (.next firstSelected responseSelected)⟩

theorem exit_admissible (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (horizon remaining : Nat) (bits : List Bool) :
    Carrier.Admissible (exitTerm program dispatcher horizon remaining bits) := by
  cases remaining with
  | zero =>
      right
      exact RootResetResponseClockFuelAgreement.clockFirstTerm_headArity program dispatcher horizon bits
  | succ remaining => exact Or.inl rfl

theorem emptyBase_decode (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (continuation : Term) :
    CheckpointDecoder.decodeCarrier? program dispatcher.tree
      (baseCarrier (environmentCode (compileActions program dispatcher.tree) []) continuation) = some [] := by
  have parsed : CheckpointDecoder.parseBase? (compileActions program dispatcher.tree)
      (baseCarrier (environmentCode (compileActions program dispatcher.tree) []) continuation) =
      some ⟨word [], continuation, word [],
        baseBeta (environmentCode (compileActions program dispatcher.tree) []) continuation⟩ :=
    CheckpointDecoder.parseBase?_open ..
  rw [CheckpointDecoder.decodeCarrier?, parsed]
  rfl

/-- The complete initially empty pending sweep agrees at every contraction
for arbitrary horizon, residual clock exit, pending depth, and marked parents.
Its terminal frame is the exact endpoint used by the continuation assembly. -/
theorem initialEmpty_pendingSweep_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (horizon remaining : Nat) (bound : remaining ≤ horizon)
    (count : Nat) (parents : List ParentFrame)
    {history : List (CheckpointDecoder.LocalView program)} :
    let continuation := exitTerm program dispatcher horizon remaining []
    let actions := compileActions program dispatcher.tree
    let carrier := baseCarrier (environmentCode actions []) continuation
    let registers := SchedulerNestedEmpty.initialEmptyRegisters program
    let active := pending actions [] continuation (count + 1) carrier
    let allParents := PrimitiveFuel.pendingParents (environmentCode actions []) continuation count parents
    MarkedPrefix program dispatcher.tree (Cursor.rebuild parents active) active
      (SchedulerInvariant.contextOfParents parents) history →
    ∃ samples,
      SchedulerResponseInvariant.ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerEmpty.frameConfiguration program dispatcher
          (SchedulerCycle.emptySweepRegisters program count registers) [] continuation
          (SchedulerCycle.emptySweepCarrier program dispatcher [] continuation count registers carrier) parents)
        (SchedulerEmpty.frameConfiguration program dispatcher registers [] continuation carrier allParents) samples ∧
      RootResetExactTraceAgreement.SelectorChain (selectStep? program dispatcher)
        (SchedulerEmpty.frameConfiguration program dispatcher registers [] continuation carrier allParents) samples := by
  dsimp only
  intro shape
  cases count with
  | zero => exact ⟨[], .done 0 ⟨rfl, rfl⟩, .done _⟩
  | succ count =>
      let continuation := exitTerm program dispatcher horizon remaining []
      let actions := compileActions program dispatcher.tree
      let environment := environmentCode actions []
      let carrier := baseCarrier environment continuation
      let registers := SchedulerNestedEmpty.initialEmptyRegisters program
      let nextCarrier := markedExitTerm program dispatcher registers false [] carrier horizon remaining
      let remainingParents := PrimitiveFuel.pendingParents environment continuation count parents
      let allParents := PrimitiveFuel.pendingParents environment continuation (count + 1) parents
      have admissible := exit_admissible program dispatcher horizon remaining []
      obtain ⟨firstSamples, firstChain, firstSelected⟩ := initialEmpty_frame_selectorChain program dispatcher
        continuation admissible (count + 1) parents shape
      have nextEmpty : CheckpointDecoder.decodeCarrier? program dispatcher.tree nextCarrier = some [] := by
        rw [markedExit_false_decode]
        exact emptyBase_decode program dispatcher continuation
      have nextTombstones : carrierTombstoneCount? program dispatcher.tree nextCarrier = some 0 := by
        rw [show nextCarrier = LocalResponse.markedCompleted [] continuation carrier
          (SchedulerResponse.completedRoute program dispatcher registers false carrier) by rfl,
          markedEmpty_tombstoneCount]
        exact emptyBase_tombstoneCount program dispatcher continuation
      have stopped : parseMarkedLocal? program dispatcher.tree
          (pending actions [] continuation (count + 1) nextCarrier) = none := by
        rw [pending, parseMarkedLocal?, frame_local_none]
      obtain ⟨nextHistory, nextShape⟩ := markedPrefix_replace shape stopped
      have nextShape' : MarkedPrefix program dispatcher.tree
          (Cursor.rebuild parents (pending actions [] continuation (count + 1) nextCarrier))
          (pending actions [] continuation (count + 1) nextCarrier)
          (SchedulerInvariant.contextOfParents parents) nextHistory := by
        rw [← SchedulerInvariant.contextOfParents_plug]
        exact nextShape
      obtain ⟨restSamples, restChain, restSelected⟩ := markedOrigin_pendingSweep_selectorChain program dispatcher
        registers false [] carrier horizon remaining bound count parents nextEmpty nextTombstones nextShape'
      have parentEq : allParents =
          .right (SchedulerResponse.pendingFunction program dispatcher [] continuation) :: remainingParents := by
        simpa [allParents, remainingParents, environment, actions, SchedulerResponse.pendingFunction,
          PendingFrame.environmentCode_eq_envelope, PendingFrame.frameFunction] using
          (SchedulerCycle.pendingParents_succ_cons environment continuation count parents)
      have pendingRun : SchedulerInvariant.ZeroMutationRun (SchedulerControl.machine program dispatcher)
          (SchedulerControl.compiledProbeCost program dispatcher (.pending .emptyReturn)
            (SchedulerResponse.pendingChildCursor program dispatcher [] continuation nextCarrier remainingParents) + 1)
          (SchedulerEmpty.markedPendingConfiguration program dispatcher registers [] continuation carrier allParents)
          (SchedulerEmpty.frameConfiguration program dispatcher registers.advanceEmpty [] continuation nextCarrier
            remainingParents) := by
        rw [parentEq]
        simpa [nextCarrier, markedExitTerm, SchedulerEmpty.markedPendingConfiguration,
          SchedulerEmpty.markedCursor, SchedulerEmpty.nextFrameConfiguration, SchedulerEmpty.frameConfiguration,
          SchedulerEmpty.pendingProbeConfiguration, SchedulerResponse.pendingChildCursor,
          SchedulerResponse.pendingFunction] using!
          (SchedulerEmpty.pending_zeroRun program dispatcher registers.advanceEmpty [] continuation nextCarrier
            remainingParents)
      have linkedChain := SchedulerResponseInvariant.ExactMutationChain.prepend pendingRun restChain
      have linkedSelected := RootResetExactTraceAgreement.SelectorChain.prepend pendingRun restSelected
      refine ⟨firstSamples ++ restSamples, ?_, ?_⟩
      · have full := SchedulerRecurrence.ExactMutationChain.append firstChain linkedChain
        simpa only [SchedulerCycle.emptySweepRegisters, SchedulerCycle.emptySweepCarrier,
          registers, carrier, nextCarrier, markedExitTerm, allParents, remainingParents,
          environment, actions, continuation] using full
      · exact RootResetExactTraceAgreement.SelectorChain.append firstChain firstSelected linkedSelected

/-- The arbitrary pending sweep starts at the actual fifth zero-fuel sample;
its initial descent and ascent are absorbed as a mutation-free prefix. -/
theorem initialEmpty_from_fifth_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (horizon remaining : Nat) (bound : remaining ≤ horizon)
    (count : Nat) (parents : List ParentFrame)
    {history : List (CheckpointDecoder.LocalView program)} :
    let continuation := exitTerm program dispatcher horizon remaining []
    let actions := compileActions program dispatcher.tree
    let environment := environmentCode actions []
    let carrier := baseCarrier environment continuation
    let registers := SchedulerNestedEmpty.initialEmptyRegisters program
    let active := pending actions [] continuation (count + 1) carrier
    let fifth := SchedulerInvariant.fuelZeroFifthMutationConfiguration program dispatcher
      (SchedulerControl.Registers.newJob program) environment continuation
      (PrimitiveFuel.pendingParents environment continuation (count + 1) parents)
    MarkedPrefix program dispatcher.tree (Cursor.rebuild parents active) active
      (SchedulerInvariant.contextOfParents parents) history →
    ∃ samples,
      SchedulerResponseInvariant.ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerEmpty.frameConfiguration program dispatcher
          (SchedulerCycle.emptySweepRegisters program count registers) [] continuation
          (SchedulerCycle.emptySweepCarrier program dispatcher [] continuation count registers carrier) parents)
        fifth samples ∧
      RootResetExactTraceAgreement.SelectorChain (selectStep? program dispatcher) fifth samples := by
  dsimp only
  intro shape
  obtain ⟨samples, chain, selected⟩ := initialEmpty_pendingSweep_selectorChain
    program dispatcher horizon remaining bound count parents shape
  obtain ⟨ticks, entered⟩ := SchedulerNestedEmpty.emptyBase_toFirstFrame_zeroRun program dispatcher
    (exitTerm program dispatcher horizon remaining []) (exit_admissible program dispatcher horizon remaining [])
    count parents
  exact ⟨samples, SchedulerResponseInvariant.ExactMutationChain.prepend entered chain,
    RootResetExactTraceAgreement.SelectorChain.prepend entered selected⟩

end PureSFormal.Research.RootResetInitialEmptySweep
