import PureSFormal.Research.RootResetFiniteEmptyResponseChain
import PureSFormal.Research.RootResetFiniteEmptySweep
import PureSFormal.Research.RootResetInitialEmptyCommitAgreement
import PureSFormal.Research.RootResetFiniteBaseAgreement
import PureSFormal.Research.RootResetFiniteJobHandoff
import PureSFormal.Research.RootResetFiniteInitialPrelude
import PureSFormal.Research.RootResetEmptyStagesSelectorChain

/-! Exact finite-selector chains for every initially empty input stage. -/
namespace PureSFormal.Research.RootResetFiniteInitialEmptyStages
open PureSFormal.PureS
open SchedulerInvariant SchedulerResponseInvariant
open RootResetActivePendingAgreement RootResetCleanTraversableParents
open RootResetEmptyHandoffContext RootResetWrappedFrameSelectorProof RootResetMarkedFrameSelectorProof
open RootResetFiniteNormalResponseChain

theorem initialEmpty_frame_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (horizon remaining depth : Nat) (parents : List ParentFrame) {history : Nat}
    (clean : CleanParents program dispatcher parents history) :
    let continuation := exitTerm program dispatcher horizon remaining []
    let actions := compileActions program dispatcher.tree
    let carrier := baseCarrier (environmentCode actions []) continuation
    let registers := SchedulerNestedEmpty.initialEmptyRegisters program
    let allParents := PrimitiveFuel.pendingParents (environmentCode actions []) continuation depth parents
    ∃ samples,
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerEmpty.markedPendingConfiguration program dispatcher registers [] continuation carrier allParents)
        (SchedulerEmpty.frameConfiguration program dispatcher registers [] continuation carrier allParents) samples ∧
      RootResetExactTraceAgreement.SelectorChain (RootResetFinitePrioritySelector.selectStep? program dispatcher)
        (SchedulerEmpty.frameConfiguration program dispatcher registers [] continuation carrier allParents) samples := by
  dsimp only
  let continuation := exitTerm program dispatcher horizon remaining []
  let actions := compileActions program dispatcher.tree
  let carrier := baseCarrier (environmentCode actions []) continuation
  let registers := SchedulerNestedEmpty.initialEmptyRegisters program
  let layers := List.replicate depth (word [], continuation)
  let allParents := PrimitiveFuel.pendingParents (environmentCode actions []) continuation depth parents
  have path : CarrierDecoder.PathDecodes program dispatcher.tree [] continuation carrier [] :=
    .root (.base omega (baseBeta (environmentCode actions []) continuation) .omega)
  have origin : RootResetEmptyOriginProbe.Reads program dispatcher.tree carrier none :=
    RootResetEmptyOriginProbe.Reads.empty_base program dispatcher.tree continuation (word []) (baseBeta (environmentCode actions []) continuation)
  have endpoints := RootResetFiniteResponseEndpointAgreement.initial_empty_sweep clean layers continuation (Dovetail.clockExit_admissible ..) 0
  have commit := RootResetInitialEmptyCommitAgreement.selectStep?_completed_empty clean layers registers [] horizon remaining carrier path origin
  obtain ⟨first, rest, body, selected, firstErase, _⟩ :=
    RootResetFiniteEmptyResponseChain.emptyResponse_through_marker_selectorChain clean layers registers [] continuation carrier endpoints commit
  have parentEq : parentsAfter actions layers parents = allParents := RootResetBaseEndpointExecution.parents_replicate ..
  rw [parentEq] at body
  have entry := RootResetFiniteBaseAgreement.fifth_empty_handoff clean registers horizon remaining depth
  change RootResetFinitePrioritySelector.selectStep? program dispatcher
    (Cursor.rebuild (PrimitiveFuel.pendingParents (environmentCode actions []) continuation (depth + 1) parents) carrier) =
      some (Cursor.rebuild allParents (frameFirstRoot actions [] continuation carrier)) at entry
  rw [SchedulerCycle.pendingParents_succ_cons] at entry
  have firstSelected : RootResetFinitePrioritySelector.selectStep? program dispatcher
      (SchedulerEmpty.responseStartConfiguration program dispatcher registers [] continuation carrier allParents).cursor.erase = some first.cursor.erase := by
    rw [firstErase]
    rw [← RootResetFrameSpineWalker.rebuild_spineParents (frameLayers actions layers)
      (frameFirstRoot actions [] continuation carrier) parents]
    change RootResetFinitePrioritySelector.selectStep? program dispatcher
      (Cursor.rebuild allParents (frame (environmentCode actions []) continuation carrier)) =
        some (Cursor.rebuild (parentsAfter actions layers parents) (frameFirstRoot actions [] continuation carrier))
    rw [parentEq]
    exact entry
  have entered := SchedulerEmpty.enterResponse_zeroRun program dispatcher registers [] continuation carrier allParents
  exact ⟨first :: rest, ExactMutationChain.prepend entered body,
    RootResetExactTraceAgreement.SelectorChain.prepend entered (.next firstSelected selected)⟩

theorem initialEmpty_completeSweep_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (horizon remaining : Nat) (bound : remaining ≤ horizon)
    (count : Nat) (parents : List ParentFrame) {history : Nat}
    (clean : CleanParents program dispatcher parents history) :
    let continuation := exitTerm program dispatcher horizon remaining []
    let actions := compileActions program dispatcher.tree
    let carrier := baseCarrier (environmentCode actions []) continuation
    let registers := SchedulerNestedEmpty.initialEmptyRegisters program
    let allParents := PrimitiveFuel.pendingParents (environmentCode actions []) continuation count parents
    ∃ samples,
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerEmpty.markedPendingConfiguration program dispatcher
          (SchedulerCycle.emptySweepRegisters program count registers) [] continuation
          (SchedulerCycle.emptySweepCarrier program dispatcher [] continuation count registers carrier) parents)
        (SchedulerEmpty.frameConfiguration program dispatcher registers [] continuation carrier allParents) samples ∧
      RootResetExactTraceAgreement.SelectorChain (RootResetFinitePrioritySelector.selectStep? program dispatcher)
        (SchedulerEmpty.frameConfiguration program dispatcher registers [] continuation carrier allParents) samples := by
  dsimp only
  cases count with
  | zero => exact initialEmpty_frame_selectorChain program dispatcher horizon remaining 0 parents clean
  | succ count =>
      let continuation := exitTerm program dispatcher horizon remaining []
      let actions := compileActions program dispatcher.tree
      let environment := environmentCode actions []
      let carrier := baseCarrier environment continuation
      let registers := SchedulerNestedEmpty.initialEmptyRegisters program
      let nextCarrier := markedExitTerm program dispatcher registers false [] carrier horizon remaining
      let remainingParents := PrimitiveFuel.pendingParents environment continuation count parents
      let allParents := PrimitiveFuel.pendingParents environment continuation (count + 1) parents
      obtain ⟨firstSamples, firstChain, firstSelected⟩ :=
        initialEmpty_frame_selectorChain program dispatcher horizon remaining (count + 1) parents clean
      have empty : CarrierDecoder.decode? program dispatcher.tree [] continuation (Dovetail.clockExit_admissible ..) nextCarrier = some [] :=
        SchedulerNestedEmpty.emptySweepCarrier_decode program dispatcher continuation (Dovetail.clockExit_admissible ..) 1 registers
      have audit : ReachableAudit.Holds program dispatcher.tree [] continuation nextCarrier :=
        SchedulerEmpty.marked_holds program dispatcher registers [] continuation carrier (ReachableAudit.Holds.initial ..)
      obtain ⟨restSamples, restChain, restSelected, _⟩ :=
        RootResetFiniteEmptySweep.markedOrigin_completeSweep_selectorChain program dispatcher registers false [] carrier
          horizon remaining bound count parents clean empty audit
      have parentEq : allParents =
          .right (SchedulerResponse.pendingFunction program dispatcher [] continuation) :: remainingParents := by
        simpa [allParents, remainingParents, environment, actions, SchedulerResponse.pendingFunction,
          PendingFrame.environmentCode_eq_envelope, PendingFrame.frameFunction] using
          (SchedulerCycle.pendingParents_succ_cons environment continuation count parents)
      have pendingRun : ZeroMutationRun (SchedulerControl.machine program dispatcher)
          (SchedulerControl.compiledProbeCost program dispatcher (.pending .emptyReturn)
            (SchedulerResponse.pendingChildCursor program dispatcher [] continuation nextCarrier remainingParents) + 1)
          (SchedulerEmpty.markedPendingConfiguration program dispatcher registers [] continuation carrier allParents)
          (SchedulerEmpty.frameConfiguration program dispatcher registers.advanceEmpty [] continuation nextCarrier remainingParents) := by
        rw [parentEq]
        simpa [nextCarrier, markedExitTerm, SchedulerEmpty.markedPendingConfiguration,
          SchedulerEmpty.markedCursor, SchedulerEmpty.nextFrameConfiguration, SchedulerEmpty.frameConfiguration,
          SchedulerEmpty.pendingProbeConfiguration, SchedulerResponse.pendingChildCursor,
          SchedulerResponse.pendingFunction] using!
          (SchedulerEmpty.pending_zeroRun program dispatcher registers.advanceEmpty [] continuation nextCarrier remainingParents)
      have linkedChain := ExactMutationChain.prepend pendingRun restChain
      have linkedSelected := RootResetExactTraceAgreement.SelectorChain.prepend pendingRun restSelected
      refine ⟨firstSamples ++ restSamples, ?_, ?_⟩
      · have full := SchedulerRecurrence.ExactMutationChain.append firstChain linkedChain
        simpa only [SchedulerCycle.emptySweepRegisters, SchedulerCycle.emptySweepCarrier,
          registers, carrier, nextCarrier, markedExitTerm, allParents, remainingParents,
          environment, actions, continuation] using full
      · exact RootResetExactTraceAgreement.SelectorChain.append firstChain firstSelected linkedSelected

theorem initialEmpty_completeResponses_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (horizon remaining : Nat) (bound : remaining ≤ horizon)
    (count : Nat) (parents : List ParentFrame) {history : Nat}
    (clean : CleanParents program dispatcher parents history) :
    ∃ samples,
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerEmpty.markedPendingConfiguration program dispatcher
          (RootResetEmptyJobSelectorChain.terminalRegisters program count) []
          (exitTerm program dispatcher horizon remaining [])
          (RootResetEmptyJobSelectorChain.terminalCarrier program dispatcher horizon remaining count) parents)
        (RootResetEmptyJobSelectorChain.fifthConfiguration program dispatcher horizon remaining count parents) samples ∧
      RootResetExactTraceAgreement.SelectorChain (RootResetFinitePrioritySelector.selectStep? program dispatcher)
        (RootResetEmptyJobSelectorChain.fifthConfiguration program dispatcher horizon remaining count parents) samples := by
  obtain ⟨samples, chain, selected⟩ := initialEmpty_completeSweep_selectorChain program dispatcher horizon remaining bound count parents clean
  obtain ⟨ticks, entered⟩ := SchedulerNestedEmpty.emptyBase_toFirstFrame_zeroRun program dispatcher
    (exitTerm program dispatcher horizon remaining []) (Dovetail.clockExit_admissible ..) count parents
  exact ⟨samples, ExactMutationChain.prepend entered chain,
    RootResetExactTraceAgreement.SelectorChain.prepend entered selected⟩

open RootResetEmptyJobSelectorChain RootResetCompleteEmptyJob

theorem fuelPrefix_exact_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (fuel remaining : Nat) (parents : List ParentFrame) {history : Nat}
    (clean : CleanParents program dispatcher parents history) :
    let samples := SchedulerNestedPhase.fuelConfigurationsAt program dispatcher []
      (SchedulerControl.Registers.newJob program) (exitTerm program dispatcher (fuel + 1) remaining [])
      parents (fuel + 1) 0
    ExactMutationChain (SchedulerControl.machine program dispatcher)
      (fifthConfiguration program dispatcher (fuel + 1) remaining fuel parents)
      (sourceConfiguration program dispatcher (fuel + 1) remaining parents) samples ∧
    RootResetExactTraceAgreement.SelectorChain (RootResetFinitePrioritySelector.selectStep? program dispatcher)
      (sourceConfiguration program dispatcher (fuel + 1) remaining parents) samples := by
  dsimp only
  have chain := SchedulerNestedPhase.fuelExactMutationChainAt program dispatcher []
    (SchedulerControl.Registers.newJob program) (exitTerm program dispatcher (fuel + 1) remaining [])
    parents (fuel + 1) 0
  rw [fuelTerminal_eq_fifth] at chain
  exact ⟨chain, RootResetFiniteStagePhaseSelectorChain.fuel_finiteSelectorChain program dispatcher []
    (SchedulerControl.Registers.newJob program) _ (Dovetail.clockExit_admissible ..)
    ⟨fuel + 1, remaining, rfl⟩ parents clean (fuel + 1) 0⟩

theorem nonterminalEmptyHandoff_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (fuel jobs : Nat) (registers : SchedulerControl.Registers program) (carrier : Term)
    (parents : List ParentFrame) {history : Nat}
    (clean : CleanParents program dispatcher parents history) :
    ∃ samples,
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerNestedEmpty.nextEmptyJobSourceConfiguration program dispatcher fuel jobs registers carrier parents)
        (SchedulerEmpty.markedPendingConfiguration program dispatcher registers []
          (exitTerm program dispatcher (fuel + 1) (jobs + 1) []) carrier parents) samples ∧
      RootResetExactTraceAgreement.SelectorChain (RootResetFinitePrioritySelector.selectStep? program dispatcher)
        (SchedulerEmpty.markedPendingConfiguration program dispatcher registers []
          (exitTerm program dispatcher (fuel + 1) (jobs + 1) []) carrier parents) samples := by
  obtain ⟨samples, chain, _, lengthEq, _⟩ := SchedulerNestedEmpty.nonterminalEmptyHandoff program dispatcher [] 0 fuel jobs
    registers carrier parents history clean.toCompleted
  have selected := RootResetFiniteClockFuelSelection.launch (clean.empty registers [] carrier) [] (fuel + 1) jobs
  cases samples with
  | nil => cases lengthEq
  | cons sample rest =>
      cases rest with
      | nil =>
          have eraseEq := RootResetEmptyContinuationChain.singleton_sample_erase (SchedulerControl.machine program dispatcher) chain
          refine ⟨[sample], chain, .next ?_ (.done _)⟩
          rw [eraseEq]
          exact selected
      | cons second rest => cases lengthEq

theorem nonterminal_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (fuel jobs : Nat) (bound : jobs + 1 ≤ fuel + 1)
    (parents : List ParentFrame) {history : Nat}
    (clean : CleanParents program dispatcher parents history) :
    let registers := terminalRegisters program fuel
    let carrier := terminalCarrier program dispatcher (fuel + 1) (jobs + 1) fuel
    let nextParents := SchedulerRootContinuation.emptyContinuationParents program dispatcher registers [] carrier parents
    ∃ samples,
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (sourceConfiguration program dispatcher (fuel + 1) jobs nextParents)
        (sourceConfiguration program dispatcher (fuel + 1) (jobs + 1) parents) samples ∧
      RootResetExactTraceAgreement.SelectorChain (RootResetFinitePrioritySelector.selectStep? program dispatcher)
        (sourceConfiguration program dispatcher (fuel + 1) (jobs + 1) parents) samples ∧
      CleanParents program dispatcher nextParents (history + 1) := by
  dsimp only
  have fuelPrefix := fuelPrefix_exact_selectorChain program dispatcher fuel (jobs + 1) parents clean
  obtain ⟨responseSamples, responses, responseSelected⟩ :=
    initialEmpty_completeResponses_selectorChain program dispatcher (fuel + 1) (jobs + 1) bound fuel parents clean
  obtain ⟨handoffSamples, handoffChain, handoffSelected⟩ :=
    nonterminalEmptyHandoff_selectorChain program dispatcher fuel jobs (terminalRegisters program fuel)
      (terminalCarrier program dispatcher (fuel + 1) (jobs + 1) fuel) parents clean
  have tail := SchedulerRecurrence.ExactMutationChain.append responses handoffChain
  have selectedTail := RootResetExactTraceAgreement.SelectorChain.append responses responseSelected handoffSelected
  exact ⟨_ ++ (responseSamples ++ handoffSamples), SchedulerRecurrence.ExactMutationChain.append fuelPrefix.1 tail,
    RootResetExactTraceAgreement.SelectorChain.append fuelPrefix.1 fuelPrefix.2 selectedTail, clean.empty ..⟩

theorem terminal_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (fuel : Nat) (parents : List ParentFrame) {history : Nat}
    (clean : CleanParents program dispatcher parents history) :
    let registers := terminalRegisters program fuel
    let carrier := terminalCarrier program dispatcher (fuel + 1) 0 fuel
    let nextParents := SchedulerRootContinuation.emptyContinuationParents program dispatcher registers [] carrier parents
    ∃ samples,
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerRootContinuation.nextStageSourceConfiguration program dispatcher (fuel + 1)
          (environmentCode (compileActions program dispatcher.tree) []) nextParents)
        (sourceConfiguration program dispatcher (fuel + 1) 0 parents) samples ∧
      RootResetExactTraceAgreement.SelectorChain (RootResetFinitePrioritySelector.selectStep? program dispatcher)
        (sourceConfiguration program dispatcher (fuel + 1) 0 parents) samples := by
  dsimp only
  have fuelPrefix := fuelPrefix_exact_selectorChain program dispatcher fuel 0 parents clean
  obtain ⟨responseSamples, responses, responseSelected⟩ :=
    initialEmpty_completeResponses_selectorChain program dispatcher (fuel + 1) 0 (Nat.zero_le _) fuel parents clean
  obtain ⟨ticks, zero⟩ := SchedulerNestedEmpty.terminalEmptyPostMarker_zeroRun program dispatcher fuel
    (terminalRegisters program fuel) (terminalCarrier program dispatcher (fuel + 1) 0 fuel) parents history clean.toCompleted
  have tail := SchedulerRecurrence.ExactMutationChain.append responses (.done ticks zero)
  rw [List.append_nil] at tail
  exact ⟨_ ++ responseSamples, SchedulerRecurrence.ExactMutationChain.append fuelPrefix.1 tail,
    RootResetExactTraceAgreement.SelectorChain.append fuelPrefix.1 fuelPrefix.2 responseSelected⟩

open RootResetEmptyJobsSelectorChain (finalParents)
open RootResetEmptyStagesSelectorChain (stageConfiguration)

theorem jobs_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program) (fuel : Nat) :
    ∀ jobs, jobs ≤ fuel + 1 → ∀ (parents : List ParentFrame) (history : Nat),
    CleanParents program dispatcher parents history →
    let nextParents := finalParents program dispatcher fuel jobs parents
    ∃ samples targetHistory,
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerRootContinuation.nextStageSourceConfiguration program dispatcher (fuel + 1)
          (environmentCode (compileActions program dispatcher.tree) []) nextParents)
        (sourceConfiguration program dispatcher (fuel + 1) jobs parents) samples ∧
      RootResetExactTraceAgreement.SelectorChain (RootResetFinitePrioritySelector.selectStep? program dispatcher)
        (sourceConfiguration program dispatcher (fuel + 1) jobs parents) samples ∧
      CleanParents program dispatcher nextParents targetHistory
  | 0, _, parents, history, clean => by
      obtain ⟨samples, chain, selected⟩ := terminal_selectorChain program dispatcher fuel parents clean
      exact ⟨samples, history + 1, chain, selected, clean.empty ..⟩
  | jobs + 1, bound, parents, history, clean => by
      obtain ⟨firstSamples, firstChain, firstSelected, nextClean⟩ :=
        nonterminal_selectorChain program dispatcher fuel jobs bound parents clean
      obtain ⟨restSamples, targetHistory, restChain, restSelected, finalClean⟩ :=
        jobs_selectorChain program dispatcher fuel jobs (Nat.le_trans (Nat.le_succ jobs) bound)
          _ (history + 1) nextClean
      exact ⟨firstSamples ++ restSamples, targetHistory,
        SchedulerRecurrence.ExactMutationChain.append firstChain restChain,
        RootResetExactTraceAgreement.SelectorChain.append firstChain firstSelected restSelected, finalClean⟩

theorem stage_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (fuel : Nat) (parents : List ParentFrame) (history : Nat)
    (clean : CleanParents program dispatcher parents history) :
    let nextParents := finalParents program dispatcher fuel fuel parents
    ∃ samples nextHistory,
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (stageConfiguration program dispatcher (fuel + 1) nextParents)
        (stageConfiguration program dispatcher fuel parents) samples ∧
      RootResetExactTraceAgreement.SelectorChain (RootResetFinitePrioritySelector.selectStep? program dispatcher)
        (stageConfiguration program dispatcher fuel parents) samples ∧
      CleanParents program dispatcher nextParents nextHistory ∧ 1 ≤ samples.length := by
  dsimp only
  have clocks := RootResetFiniteStagePhaseSelectorChain.clockLaunch_finite_exact_selectorChain program dispatcher []
    (SchedulerControl.Registers.newJob program) fuel parents clean
  obtain ⟨jobSamples, nextHistory, jobs, jobsSelected, nextClean⟩ :=
    jobs_selectorChain program dispatcher fuel fuel (Nat.le_succ fuel) parents history clean
  refine ⟨_ ++ jobSamples, nextHistory, SchedulerRecurrence.ExactMutationChain.append clocks.1 jobs,
    RootResetExactTraceAgreement.SelectorChain.append clocks.1 clocks.2 jobsSelected, nextClean, ?_⟩
  rw [List.length_append, List.length_append, List.length_singleton]
  exact Nat.le_trans (Nat.succ_le_succ (Nat.zero_le _)) (Nat.le_add_right _ _)

theorem stages_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program) :
    ∀ count fuel (parents : List ParentFrame) (history : Nat), CleanParents program dispatcher parents history →
    let nextParents := RootResetEmptyStagesSelectorChain.parentsAfter program dispatcher count fuel parents
    ∃ samples nextHistory,
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (stageConfiguration program dispatcher (fuel + count) nextParents)
        (stageConfiguration program dispatcher fuel parents) samples ∧
      RootResetExactTraceAgreement.SelectorChain (RootResetFinitePrioritySelector.selectStep? program dispatcher)
        (stageConfiguration program dispatcher fuel parents) samples ∧
      CleanParents program dispatcher nextParents nextHistory ∧ count ≤ samples.length
  | 0, fuel, parents, history, clean =>
      ⟨[], history, .done 0 ⟨rfl, rfl⟩, .done _, clean, Nat.zero_le _⟩
  | count + 1, fuel, parents, history, clean => by
      obtain ⟨firstSamples, middleHistory, firstChain, firstSelected, middleClean, firstLength⟩ :=
        stage_selectorChain program dispatcher fuel parents history clean
      obtain ⟨restSamples, nextHistory, restChain, restSelected, nextClean, restLength⟩ :=
        stages_selectorChain program dispatcher count (fuel + 1) _ middleHistory middleClean
      have indexEq : fuel + 1 + count = fuel + (count + 1) := by
        rw [Nat.add_assoc, Nat.add_comm 1 count]
      rw [indexEq] at restChain
      refine ⟨firstSamples ++ restSamples, nextHistory,
        SchedulerRecurrence.ExactMutationChain.append firstChain restChain,
        RootResetExactTraceAgreement.SelectorChain.append firstChain firstSelected restSelected, nextClean, ?_⟩
      rw [List.length_append, Nat.add_comm count 1]
      exact Nat.add_le_add firstLength restLength

theorem emptyInput_unbounded_exact_selectorChains
    (program : CTS.Program) (dispatcher : ActionDispatcher program) (count : Nat) :
    ∃ terminal samples,
      ExactMutationChain (SchedulerControl.machine program dispatcher) terminal
        (SchedulerControl.initialConfiguration program dispatcher []) samples ∧
      RootResetExactTraceAgreement.SelectorChain (RootResetFinitePrioritySelector.selectStep? program dispatcher)
        (SchedulerControl.initialConfiguration program dispatcher []) samples ∧ count ≤ samples.length := by
  obtain ⟨samples, _, chain, selected, _, lengthBound⟩ :=
    stages_selectorChain program dispatcher count 0 [] 0 .root
  have prelude := SchedulerRecurrence.initialPreludeChain program dispatcher []
  have preludeSelected := RootResetFiniteInitialPrelude.initialPrelude_selectorChain program dispatcher []
  refine ⟨_, _ ++ samples, SchedulerRecurrence.ExactMutationChain.append prelude chain,
    RootResetExactTraceAgreement.SelectorChain.append prelude preludeSelected selected, ?_⟩
  rw [List.length_append]
  exact Nat.le_trans lengthBound (Nat.le_add_left _ _)

/-- Every actual contraction on initially empty input is selected by the
finite controller, with no selection-law or parser-agreement premise. -/
theorem emptyInput_selectsEveryContractionRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program) (index : Nat) :
    let system := SchedulerInvariant.SampledGood.productiveSystem program dispatcher []
      (SchedulerBound.bound program dispatcher) (SchedulerControl.initialConfiguration program dispatcher [])
      (SchedulerRecurrence.initialGood program dispatcher [])
    RootResetFinitePrioritySelector.selectStep? program dispatcher (system.contractionRun index).cursor.erase =
      some (system.contractionRun (index + 1)).cursor.erase := by
  obtain ⟨terminal, samples, chain, selected, lengthBound⟩ :=
    emptyInput_unbounded_exact_selectorChains program dispatcher (index + 1)
  simpa only [Nat.zero_add] using RootResetExactTraceAgreement.SelectorChain.selects_contractionRun chain selected
    (SchedulerRecurrence.initialGood program dispatcher [])
    (base := 0) (offset := index) rfl (Nat.lt_of_succ_le lengthBound)

end PureSFormal.Research.RootResetFiniteInitialEmptyStages
