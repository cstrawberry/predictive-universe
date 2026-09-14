import PureSFormal.Research.RootResetEmptyHandoffContext

/-!
# The pending-frame contraction after EMPTY marking

The completed response's actual clock continuation determines a marked
crossing after the innermost pending frame.  The selected contraction is that
frame's root, uniformly over the horizon and remaining job count.
-/

namespace PureSFormal.Research.RootResetEmptyPostMarkerHandoff

open PureSFormal.PureS
open RootResetPersistentResponseSelector
open RootResetReachableStageGrammar
open RootResetWrappedFrameSelectorProof
open RootResetMarkedFrameSelectorProof
open RootResetWrappedEmptyRouteSelectorChain
open RootResetEmptyHandoffContext
open RootResetClockFuelStages

theorem pending_succ_innermost (actions : Term) (bits : List Bool)
    (continuation term : Term) (count : Nat) :
    pending actions bits continuation (count + 1) term =
      pending actions bits continuation count (frame (environmentCode actions bits) continuation term) := by
  induction count with
  | zero => rfl
  | succ count ih => exact congrArg (frame (environmentCode actions bits) continuation) ih

theorem noFresh_pending_marked (count : Nat) :
    addressBeforeFresh? (List.replicate count .pendingFrameChild ++ [.markedContinuation]) = none := by
  induction count with
  | zero => rfl
  | succ count ih =>
      simp only [List.replicate_succ, List.cons_append, addressBeforeFresh?, ih, Option.map_none]

theorem noFresh_marked_pending_marked (markedCount pendingCount : Nat) :
    addressBeforeFresh? (List.replicate markedCount .markedContinuation ++
      (List.replicate pendingCount .pendingFrameChild ++ [.markedContinuation])) = none := by
  induction markedCount with
  | zero => exact noFresh_pending_marked pendingCount
  | succ count ih =>
      simp only [List.replicate_succ, List.cons_append, addressBeforeFresh?, ih, Option.map_none]

theorem pendingMarked_address (count : Nat) :
    addressBeforePendingMarked?
      (List.replicate (count + 1) .pendingFrameChild ++ [.markedContinuation]) = some (rights count) := by
  induction count with
  | zero => rfl
  | succ count ih =>
      simp only [List.replicate_succ, List.cons_append, addressBeforePendingMarked?] at *
      rw [ih]
      rfl

theorem markedPrefix_pendingMarked_address
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {whole active : Term} {context : Context}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : MarkedPrefix program tree whole active context history) (count : Nat) :
    addressBeforePendingMarked?
      (List.replicate history.length .markedContinuation ++
        (List.replicate (count + 1) .pendingFrameChild ++ [.markedContinuation])) =
      some (RootResetSelectorContract.contextAddress context ++ rights count) := by
  induction shape with
  | here stopped => exact pendingMarked_address count
  | @«local» term active innerContext view history boundary marked inner ih =>
      simp only [List.length_cons]
      rw [List.replicate_succ, List.cons_append, addressBeforePendingMarked?, ih]
      simp only [Option.map_some,
        RootResetSelectorContract.contextAddress_comp,
        RootResetPersistentRouteA.localContinuationContext_address_of_parseLocal? boundary,
        List.append_assoc]

theorem exit_not_six (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (horizon remaining : Nat) (bits : List Bool) :
    (exitTerm program dispatcher horizon remaining bits).headArity ≠ 6 := by
  cases remaining with
  | zero =>
      change (RootResetPersistentClockFuelAgreement.clockFirstTerm program dispatcher horizon bits).headArity ≠ 6
      rw [RootResetResponseClockFuelAgreement.clockFirstTerm_headArity]
      decide
  | succ remaining =>
      change 3 ≠ 6
      decide

theorem exit_freshCall_false (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (horizon remaining : Nat) (bits : List Bool) :
    parseFreshDispatcherCall? program dispatcher.tree
      (exitTerm program dispatcher horizon remaining bits) = false := by
  cases parsed : parseFreshDispatcherCall? program dispatcher.tree
      (exitTerm program dispatcher horizon remaining bits) with
  | false => rfl
  | true =>
      exact False.elim (exit_not_six program dispatcher horizon remaining bits
        (RootResetResponseClockFuelAgreement.parseFreshDispatcherCall?_headArity_six parsed))

/-- The complete selector selects the innermost pending FRAME after the
literal marked response, with no assumptions about competing parser branches. -/
theorem selectStep?_marked_pending_exit
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool)
    (outerBits bits : List Bool) (outerContinuation carrier : Term)
    (horizon remaining : Nat) (bound : remaining ≤ horizon)
    (count : Nat) {whole : Term} {context : Context}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : MarkedPrefix program dispatcher.tree whole
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation (count + 1)
        (markedExitTerm program dispatcher registers bit bits carrier horizon remaining)) context history) :
    selectStep? program dispatcher whole =
      some (context.plug (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (SchedulerResponseInvariant.frameFirstRoot (compileActions program dispatcher.tree)
          outerBits outerContinuation
          (markedExitTerm program dispatcher registers bit bits carrier horizon remaining)))) := by
  have recovered := marked_pending_exit_contexts program dispatcher registers bit outerBits bits
    outerContinuation carrier horizon remaining bound (count + 1) shape
  dsimp only at recovered
  have noFuel : (RootResetPersistentRouteAFuel.classifyHandoff program dispatcher whole).fuel = none := by
    rw [RootResetPersistentRouteAFuel.classifyHandoff, recovered.2.1]
    dsimp only [prependMarked, composeActiveContexts, pendingOuter, markedExitOuter]
    rw [exit_fuel_none program dispatcher horizon remaining bits bound]
  have freshRootNone : freshResponseRoot? program dispatcher whole = none := by
    rw [freshResponseRoot?, recovered.1]
    dsimp only [prependMarked, composeActiveContexts, pendingOuter, markedExitOuter]
    rw [noFresh_marked_pending_marked]
    rfl
  have freshDispatcherNone : freshDispatcherSelection? program dispatcher whole = none := by
    simp only [freshDispatcherSelection?, recovered.2.2,
      prependMarked, composeActiveContexts, pendingOuter, markedExitOuter]
    rw [exit_freshCall_false]
    rfl
  have appenderNone : responseAppenderSelection? program dispatcher whole = none := by
    rw [responseAppenderSelection?, responseAppenderAddress?, freshRootNone]
    rfl
  have carrierNone : responseCarrierSelection? program dispatcher whole = none := by
    rw [responseCarrierSelection?, responseCarrierAddress?, freshRootNone]
    rfl
  have boundaryNone : responseBoundarySelection? program dispatcher whole = none := by
    rw [responseBoundarySelection?, responseBoundaryAddress?,
      RootResetResponseClockFuelAgreement.completedResponseAddress?_none_of_outer_parseLocal_none
        recovered.2.2 (exit_local_none program dispatcher horizon remaining bits), freshRootNone]
    rfl
  let address := RootResetSelectorContract.contextAddress context ++ rights count
  let target := context.plug (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
    (SchedulerResponseInvariant.frameFirstRoot (compileActions program dispatcher.tree) outerBits outerContinuation
      (markedExitTerm program dispatcher registers bit bits carrier horizon remaining)))
  have innerShape : MarkedPrefix program dispatcher.tree whole
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (frame (environmentCode (compileActions program dispatcher.tree) outerBits) outerContinuation
          (markedExitTerm program dispatcher registers bit bits carrier horizon remaining))) context history := by
    rw [← pending_succ_innermost]
    exact shape
  have rootContracts : (frame (environmentCode (compileActions program dispatcher.tree) outerBits)
      outerContinuation (markedExitTerm program dispatcher registers bit bits carrier horizon remaining)).contractAt? [] =
      some (SchedulerResponseInvariant.frameFirstRoot (compileActions program dispatcher.tree)
        outerBits outerContinuation (markedExitTerm program dispatcher registers bit bits carrier horizon remaining)) := rfl
  have contracts := marked_pending_contract outerBits outerContinuation count innerShape rootContracts
  simp only [List.append_nil] at contracts
  have handoff : markedHandoffSelection? program dispatcher whole = some ⟨address, target⟩ := by
    rw [markedHandoffSelection?, recovered.1]
    dsimp only [prependMarked, composeActiveContexts, pendingOuter, markedExitOuter]
    rw [markedPrefix_pendingMarked_address shape count]
    change checkedAt? whole address = _
    rw [checkedAt?, RootResetPersistentRouteAFuel.checkedSelection?, contracts]
  change (classify program dispatcher whole).selected?.map (·.target) = some target
  rw [classify, noFuel]
  simp only [classifyAfterFuel, freshDispatcherNone, appenderNone, carrierNone, boundaryNone, handoff]
  rfl

theorem seekMutation_unique
    {Control : Type} (machine : FiniteController.Machine Control)
    {firstFuel secondFuel : Nat} {before first second : FiniteController.Configuration Control}
    (firstFound : FiniteController.seekMutation machine firstFuel before = some first)
    (secondFound : FiniteController.seekMutation machine secondFuel before = some second) : first = second := by
  induction firstFuel generalizing before secondFuel with
  | zero => cases firstFound
  | succ firstFuel ih =>
      cases secondFuel with
      | zero => cases secondFound
      | succ secondFuel =>
          rw [FiniteController.seekMutation] at firstFound secondFound
          by_cases contracts : FiniteController.mutationCount machine before = 1
          · rw [if_pos contracts] at firstFound secondFound
            exact (Option.some.inj firstFound).symm.trans (Option.some.inj secondFound)
          · rw [if_neg contracts] at firstFound secondFound
            exact ih firstFound secondFound

/-- Every exact response chain starts at the compiler's literal first FRAME
sample, independently of the search bound used to present that chain. -/
theorem emptyResponse_first_erase
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame)
    {terminal first : SchedulerInvariant.Configuration program dispatcher}
    {rest : List (SchedulerInvariant.Configuration program dispatcher)}
    (chain : SchedulerResponseInvariant.ExactMutationChain (SchedulerControl.machine program dispatcher) terminal
      (SchedulerEmpty.responseStartConfiguration program dispatcher registers bits continuation carrier parents)
      (first :: rest)) :
    first.cursor.erase = Cursor.rebuild parents
      (SchedulerResponseInvariant.frameFirstRoot (compileActions program dispatcher.tree) bits continuation carrier) := by
  obtain ⟨samples, pairedChain, paired⟩ := SchedulerNestedEmpty.emptyResponse_exactPairedMutationChain
    program dispatcher registers bits continuation carrier parents
  change SchedulerNestedEmpty.EmptyResponseSamplePairs program dispatcher registers bits continuation carrier parents
    samples ((false, SchedulerResponseInvariant.frameFirstRoot
      (compileActions program dispatcher.tree) bits continuation carrier) :: _) at paired
  cases paired with
  | cons pc cursor done term position erase root tail =>
      obtain ⟨firstTicks, firstFound, firstTail⟩ := RootResetResponseSampleParserBridge.exactMutationChain_cons chain
      obtain ⟨pairedTicks, pairedFound, pairedTail⟩ := RootResetResponseSampleParserBridge.exactMutationChain_cons pairedChain
      have same := seekMutation_unique (SchedulerControl.machine program dispatcher) firstFound pairedFound
      rw [same]
      exact erase

/-- The handoff selects the actual first sample of the next EMPTY response.
The source may be the marker sample or any administrative configuration with
the same erased pending-frame term. -/
theorem postMarker_firstFrame_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (previousRegisters registers : SchedulerControl.Registers program) (bit : Bool)
    (bits : List Bool) (carrier : Term) (horizon remaining : Nat) (bound : remaining ≤ horizon)
    (count : Nat) (parents : List ParentFrame)
    {source terminal first : SchedulerInvariant.Configuration program dispatcher}
    {rest : List (SchedulerInvariant.Configuration program dispatcher)}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : MarkedPrefix program dispatcher.tree source.cursor.erase
      (pending (compileActions program dispatcher.tree) bits
        (exitTerm program dispatcher horizon remaining bits) (count + 1)
        (markedExitTerm program dispatcher previousRegisters bit bits carrier horizon remaining))
      (SchedulerInvariant.contextOfParents parents) history)
    (chain : SchedulerResponseInvariant.ExactMutationChain (SchedulerControl.machine program dispatcher) terminal
      (SchedulerEmpty.responseStartConfiguration program dispatcher registers bits
        (exitTerm program dispatcher horizon remaining bits)
        (markedExitTerm program dispatcher previousRegisters bit bits carrier horizon remaining)
        (PrimitiveFuel.pendingParents (environmentCode (compileActions program dispatcher.tree) bits)
          (exitTerm program dispatcher horizon remaining bits) count parents)) (first :: rest)) :
    RootResetExactTraceAgreement.SelectorChain (selectStep? program dispatcher) source [first] := by
  refine .next ?_ (.done _)
  rw [emptyResponse_first_erase program dispatcher registers bits _ _ _ chain,
    pending_rebuild_under_parents]
  exact selectStep?_marked_pending_exit program dispatcher previousRegisters bit bits bits
    (exitTerm program dispatcher horizon remaining bits) carrier horizon remaining bound count shape

end PureSFormal.Research.RootResetEmptyPostMarkerHandoff
