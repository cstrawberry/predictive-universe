import PureSFormal.Research.RootResetGeneratedJobTraversability
import PureSFormal.PureS.SchedulerMixedNonfinalJobs
import PureSFormal.PureS.SchedulerNonfinalEmptyJobs

/-!
# Clean parent preservation for first-empty and absorbing jobs

The actual mixed-job and empty-job recurrences introduce marked final Local
layers, so all previously clean parents remain clean through their handoffs.
-/

namespace PureSFormal.Research.RootResetGeneratedEmptyTraversability

open PureSFormal.PureS
open SchedulerControl SchedulerInvariant SchedulerCycle
  SchedulerResponseInvariant SchedulerCompletedContext SchedulerNestedResponse
  SchedulerFirstEmpty SchedulerNestedEmpty
open RootResetCleanTraversableParents

theorem completeFirstEmptyJobAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (previous remaining jobs sampleIndex : Nat)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CleanParents program dispatcher outerParents layers)
    (priorNonempty : ∀ k, k ≤ previous →
      (CTS.iterate program k
        (CTS.initial program (bit :: suffix))).data ≠ [])
    (firstEmpty :
      (CTS.iterate program (previous + 1)
        (CTS.initial program (bit :: suffix))).data = []) :
    let bits := bit :: suffix
    let fuel := previous + remaining + 1
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    let continuation := Dovetail.clockExit fuel (jobs + 1) environment
    ∃ nextParents checkRegisters configurations,
      SchedulerResponseInvariant.ExactMutationChain
        (SchedulerControl.machine program dispatcher)
        (SchedulerContinuation.checkConfiguration program dispatcher
          checkRegisters ⟨continuation, nextParents⟩)
        (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher
          bits (Registers.newJob program) continuation outerParents fuel 0)
        configurations ∧
      IndexedResponseSampledStates program dispatcher bits sampleIndex
        configurations ∧
      configurations.length =
        ExactCheckpointRun.jobCost program dispatcher bits fuel ∧
      CleanParents program dispatcher nextParents (layers + 1) ∧
      (SchedulerContinuation.checkConfiguration program dispatcher
        checkRegisters ⟨continuation, nextParents⟩).cursor.erase =
          Cursor.rebuild nextParents continuation ∧
      continuation.headArity = 3 := by
  let bits := bit :: suffix
  let fuel := previous + remaining + 1
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let continuation := Dovetail.clockExit fuel (jobs + 1) environment
  let pendingDepth := previous + remaining
  obtain ⟨outerContext, fullContext, innerContext, targetContext,
      descentTicks, responseTicks, response, baseRun⟩ :=
    nonemptyBase_toSelected_zeroRunAt program dispatcher bit suffix continuation
      (Dovetail.clockExit_admissible fuel (jobs + 1) environment) pendingDepth
      outerParents
  have baseParentsSplit :
      PrimitiveFuel.pendingParents environment continuation (pendingDepth + 1)
          outerParents =
        .right (SchedulerResponse.pendingFunction program dispatcher bits
          continuation) ::
          PrimitiveFuel.pendingParents environment continuation pendingDepth
            outerParents := by
    simpa [environment, SchedulerResponse.pendingFunction,
      PendingFrame.environmentCode_eq_envelope, PendingFrame.frameFunction] using
      (SchedulerCycle.pendingParents_succ_cons environment continuation
        pendingDepth outerParents)
  have baseRun' : ZeroMutationRun
      (SchedulerControl.machine program dispatcher) descentTicks
      (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher bits
        (Registers.newJob program) continuation outerParents fuel 0)
      (upConfiguration program dispatcher
        (Registers.newJob program).clearScan omega
        (ContextCursor.frames fullContext omega
          (.right (SchedulerResponse.pendingFunction program dispatcher bits
            continuation) ::
            PrimitiveFuel.pendingParents environment continuation pendingDepth
              outerParents))) := by
    rw [← baseParentsSplit]
    simpa [bits, fuel, environment, continuation, pendingDepth, Nat.add_assoc]
      using baseRun
  have response' : SelectedResponseTrace program dispatcher bits continuation
      (baseCarrier environment continuation)
      (Dovetail.clockExit_admissible fuel (jobs + 1) environment)
      (Registers.newJob program).clearScan bit suffix outerContext fullContext
      innerContext targetContext
      (PrimitiveFuel.pendingParents environment continuation pendingDepth
        outerParents) responseTicks := by
    simpa [bits, fuel, environment, continuation, pendingDepth] using response
  have prefixNonempty : ∀ k, k ≤ previous →
      (CTS.iterate program k
        ⟨CTS.zeroPhase program, bit :: suffix⟩).data ≠ [] := by
    intro k bound
    simpa [bits, CTS.initial] using priorNonempty k bound
  obtain ⟨terminalRegisters, terminalPhase, terminalBit, terminalSuffix,
      terminalSource, terminalOuterContext, terminalFullContext,
      terminalInnerContext, terminalTargetContext, terminalTicks,
      prefixConfigurations, prefixChain, prefixSampled, prefixLength,
      terminalCoherent, terminalTrace, terminalEq⟩ :=
    selectedNonemptyPrefixKeepingPendingAt program dispatcher bits bits
      continuation (Dovetail.clockExit_admissible fuel (jobs + 1) environment)
      outerParents layers outer.toCompleted previous remaining sampleIndex
      (Registers.newJob program).clearScan (CTS.zeroPhase program) bit suffix
      (baseCarrier environment continuation) outerContext fullContext innerContext
      targetContext responseTicks (RegistersCoherent.initial program).clearScan
      (by simpa [pendingDepth, environment] using response') prefixNonempty
  have currentEq : ⟨terminalPhase, terminalBit :: terminalSuffix⟩ =
      CTS.iterate program previous (CTS.initial program bits) := by
    simpa [bits, CTS.initial] using terminalEq
  have stepEq : CTS.absorbingStep program
        ⟨terminalRegisters.phase, terminalBit :: terminalSuffix⟩ =
      CTS.iterate program (previous + 1) (CTS.initial program bits) := by
    calc
      CTS.absorbingStep program
            ⟨terminalRegisters.phase, terminalBit :: terminalSuffix⟩ =
          CTS.absorbingStep program
            ⟨terminalPhase, terminalBit :: terminalSuffix⟩ := by
              rw [terminalCoherent.phase_eq]
      _ = CTS.absorbingStep program
          (CTS.iterate program previous (CTS.initial program bits)) := by
            rw [← currentEq]
      _ = CTS.iterate program (previous + 1)
          (CTS.initial program bits) := by
            rw [CTS.iterate_succ]
  have terminalEmpty :
      (CTS.absorbingStep program
        ⟨terminalRegisters.phase,
          terminalBit :: terminalSuffix⟩).data = [] := by
    rw [stepEq]
    simpa [bits] using firstEmpty
  cases remaining with
  | zero =>
      have terminalTrace' : SelectedResponseTrace program dispatcher bits
          continuation terminalSource
          (Dovetail.clockExit_admissible fuel (jobs + 1) environment)
          terminalRegisters terminalBit terminalSuffix terminalOuterContext
          terminalFullContext terminalInnerContext terminalTargetContext
          outerParents terminalTicks := by
        simpa [PrimitiveFuel.pendingParents] using terminalTrace
      obtain ⟨terminalConfigurations, terminalChain, terminalSampled,
          terminalLength, terminalOuter⟩ :=
        selectedMarkedNonterminalJobAt program dispatcher bits bits fuel jobs
          environment terminalSource terminalRegisters terminalPhase
          terminalCoherent terminalBit terminalSuffix
          (sampleIndex + prefixConfigurations.length) outerParents layers outer.toCompleted
          terminalTrace' terminalEmpty
      let finalRegisters := scannedRegisters terminalRegisters terminalBit
        terminalSuffix
      let carrier := deletedCarrier terminalBit terminalOuterContext
        terminalInnerContext
      let nextParents :=
        SchedulerRootContinuation.markedContinuationParents program dispatcher
          finalRegisters terminalBit bits carrier outerParents
      let configurations := prefixConfigurations ++ terminalConfigurations
      have prefixAndTerminal := SchedulerRecurrence.ExactMutationChain.append
        prefixChain terminalChain
      have completeChain :=
        SchedulerResponseInvariant.ExactMutationChain.prepend baseRun'
          prefixAndTerminal
      have completeSampled :=
        SchedulerNestedPhase.IndexedResponseSampledStates.append program
          dispatcher bits prefixSampled (by simpa using terminalSampled)
      have terminalCost : terminalConfigurations.length =
          CheckedTransition.totalCost program dispatcher
            (CTS.iterate program previous
              (CTS.initial program bits)).phase
            (CTS.iterate program previous
              (CTS.initial program bits)).data := by
        rw [terminalLength, terminalCoherent.phase_eq]
        exact congrArg
          (fun current => CheckedTransition.totalCost program dispatcher
            current.phase current.data) currentEq
      have configurationsLength : configurations.length =
          ExactCheckpointRun.jobCost program dispatcher bits fuel := by
        simp only [configurations, List.length_append]
        have prefixCost : prefixConfigurations.length =
            nonemptySweepCost program dispatcher previous
              (CTS.initial program bits) := by
          simpa [bits, CTS.initial] using prefixLength
        rw [prefixCost, terminalCost]
        rw [← nonemptySweepCost_succ_last program dispatcher previous
          (CTS.initial program bits)]
        simpa [fuel] using
          (nonemptySweepCost_initial_eq_jobCost program dispatcher bits
            (previous + 1))
      refine ⟨nextParents, finalRegisters.advance, configurations, ?_,
        completeSampled, configurationsLength, ?_, rfl,
        Dovetail.headArity_clockExit_succ fuel jobs environment⟩
      · simpa [bits, fuel, environment, continuation, configurations,
          finalRegisters, carrier, nextParents,
          SchedulerResponse.markedContinuationCursor,
          SchedulerResponse.literalContinuationCursor] using! completeChain
      · exact outer.marked finalRegisters terminalBit bits carrier
  | succ emptyTail =>
      have terminalTrace' : SelectedResponseTrace program dispatcher bits
          continuation terminalSource
          (Dovetail.clockExit_admissible fuel (jobs + 1) environment)
          terminalRegisters terminalBit terminalSuffix terminalOuterContext
          terminalFullContext terminalInnerContext terminalTargetContext
          (PrimitiveFuel.pendingParents environment continuation (emptyTail + 1)
            outerParents) terminalTicks := by
        simpa [environment] using terminalTrace
      let finalRegisters := scannedRegisters terminalRegisters terminalBit
        terminalSuffix
      let carrier := deletedCarrier terminalBit terminalOuterContext
        terminalInnerContext
      let marked := LocalResponse.markedCompleted bits continuation carrier
        (SchedulerResponse.completedRoute program dispatcher finalRegisters
          terminalBit carrier)
      let emptyRegisters :=
        SchedulerCycle.enteredEmptyRegisters finalRegisters.advance
      obtain ⟨entryConfigurations, entryChain, entrySampled, entryLength,
          emptyCoherent, markedAudit, markedDecode⟩ :=
        selectedFirstEmptyEntryAt program dispatcher bits bits continuation
          terminalSource
          (Dovetail.clockExit_admissible fuel (jobs + 1) environment)
          terminalRegisters terminalPhase terminalCoherent terminalBit
          terminalSuffix emptyTail
          (sampleIndex + prefixConfigurations.length) outerParents layers outer.toCompleted
          terminalTrace' terminalEmpty
      let finalEmptyRegisters :=
        SchedulerCycle.emptySweepRegisters program emptyTail emptyRegisters
      let finalEmptyCarrier :=
        SchedulerCycle.emptySweepCarrier program dispatcher bits continuation
          emptyTail emptyRegisters marked
      let nextParents :=
        SchedulerRootContinuation.emptyContinuationParents program dispatcher
          finalEmptyRegisters bits finalEmptyCarrier outerParents
      obtain ⟨emptyConfigurations, emptyChain, emptySampled, emptyLength,
          emptyOuter⟩ :=
        nonterminalEmptySweepToCheckAt program dispatcher bits
          (sampleIndex + prefixConfigurations.length +
            entryConfigurations.length)
          (previous + emptyTail + 1) jobs emptyTail emptyRegisters marked
          outerParents layers outer.toCompleted emptyCoherent (by
            simpa [fuel, environment, continuation, Nat.add_assoc] using!
              markedAudit)
      let configurations :=
        prefixConfigurations ++ entryConfigurations ++ emptyConfigurations
      have prefixAndEntry := SchedulerRecurrence.ExactMutationChain.append
        prefixChain entryChain
      have throughEmpty := SchedulerRecurrence.ExactMutationChain.append
        prefixAndEntry emptyChain
      have completeChain :=
        SchedulerResponseInvariant.ExactMutationChain.prepend baseRun'
          throughEmpty
      have prefixAndEntrySampled :=
        SchedulerNestedPhase.IndexedResponseSampledStates.append program
          dispatcher bits prefixSampled entrySampled
      have completeSampled :=
        SchedulerNestedPhase.IndexedResponseSampledStates.append program
          dispatcher bits prefixAndEntrySampled (by
            simpa [List.length_append, Nat.add_assoc] using emptySampled)
      have emptyState :
          ⟨CTS.nextPhase program terminalPhase, []⟩ =
            CTS.iterate program (previous + 1)
              (CTS.initial program bits) := by
        cases stepValue : CTS.absorbingStep program
            ⟨terminalRegisters.phase,
              terminalBit :: terminalSuffix⟩ with
        | mk nextPhase output =>
            have nextPhaseEq : nextPhase =
                CTS.nextPhase program terminalRegisters.phase := by
              simpa [stepValue] using
                (CTS.absorbingStep_phase program
                  ⟨terminalRegisters.phase,
                    terminalBit :: terminalSuffix⟩)
            have outputEq : output = [] := by
              simpa [stepValue] using terminalEmpty
            subst nextPhase
            subst output
            have exactStep := stepValue.symm.trans stepEq
            simpa [terminalCoherent.phase_eq] using exactStep
      have emptyCost :
          SchedulerRootContinuation.emptyCleanupMutations program dispatcher
              emptyTail emptyRegisters =
            nonemptySweepCost program dispatcher (emptyTail + 1)
              (CTS.iterate program (previous + 1)
                (CTS.initial program bits)) := by
        calc
          SchedulerRootContinuation.emptyCleanupMutations program dispatcher
                emptyTail emptyRegisters =
              nonemptySweepCost program dispatcher (emptyTail + 1)
                ⟨CTS.nextPhase program terminalPhase, []⟩ :=
            emptyCleanupMutations_eq_nonemptySweepCost program dispatcher
              emptyTail emptyRegisters (CTS.nextPhase program terminalPhase)
              emptyCoherent
          _ = nonemptySweepCost program dispatcher (emptyTail + 1)
                (CTS.iterate program (previous + 1)
                  (CTS.initial program bits)) := by rw [emptyState]
      have entryCost : entryConfigurations.length =
          CheckedTransition.totalCost program dispatcher
            (CTS.iterate program previous
              (CTS.initial program bits)).phase
            (CTS.iterate program previous
              (CTS.initial program bits)).data := by
        rw [entryLength]
        exact congrArg
          (fun current => CheckedTransition.totalCost program dispatcher
            current.phase current.data) currentEq
      have configurationsLength : configurations.length =
          ExactCheckpointRun.jobCost program dispatcher bits fuel := by
        simp only [configurations, List.length_append]
        have prefixCost : prefixConfigurations.length =
            nonemptySweepCost program dispatcher previous
              (CTS.initial program bits) := by
          simpa [bits, CTS.initial] using prefixLength
        rw [prefixCost, entryCost, emptyLength, emptyCost]
        rw [← nonemptySweepCost_succ_last program dispatcher previous
          (CTS.initial program bits)]
        rw [← nonemptySweepCost_add program dispatcher (previous + 1)
          (CTS.initial program bits) (emptyTail + 1)]
        have totalEq : (previous + 1) + (emptyTail + 1) = fuel := by
          simp [fuel, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
        rw [totalEq]
        exact nonemptySweepCost_initial_eq_jobCost program dispatcher bits fuel
      refine ⟨nextParents, finalEmptyRegisters.advanceEmpty, configurations,
        ?_, completeSampled, configurationsLength, ?_, rfl,
        Dovetail.headArity_clockExit_succ fuel jobs environment⟩
      · simpa [bits, fuel, environment, continuation, configurations,
          finalRegisters, carrier, marked, emptyRegisters, finalEmptyRegisters,
          finalEmptyCarrier, nextParents] using! completeChain
      · exact outer.empty finalEmptyRegisters bits finalEmptyCarrier


theorem completeFirstEmptyTerminalJobRawAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (previous remaining sampleIndex : Nat)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CleanParents program dispatcher outerParents layers)
    (priorNonempty : ∀ k, k ≤ previous →
      (CTS.iterate program k
        (CTS.initial program (bit :: suffix))).data ≠ [])
    (firstEmpty :
      (CTS.iterate program (previous + 1)
        (CTS.initial program (bit :: suffix))).data = []) :
    let bits := bit :: suffix
    let fuel := previous + remaining + 1
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    let continuation := Dovetail.clockExit fuel 0 environment
    ∃ nextParents leading checkpoint configurations,
      SchedulerResponseInvariant.ExactMutationChain
        (SchedulerControl.machine program dispatcher)
        (SchedulerRootContinuation.nextStageSourceConfiguration program
          dispatcher fuel environment nextParents)
        (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher
          bits (Registers.newJob program) continuation outerParents fuel 0)
        configurations ∧
      configurations = leading ++ [checkpoint] ∧
      configurations.length =
        ExactCheckpointRun.jobCost program dispatcher bits fuel ∧
      SchedulerTraceAlgebra.LastSample configurations checkpoint ∧
      MarkedTerminalData program dispatcher bits fuel checkpoint nextParents
        (layers + 1) ∧
      CleanParents program dispatcher nextParents (layers + 1) ∧
      (∀ {activeContext : Context}
          {checkpointChain : CheckpointDecoder.ChainView program},
        CheckpointRun.PositivePrefix program dispatcher bits fuel
            checkpoint.cursor.erase
            (ExactCheckpointRun.checkpointTime program dispatcher bits fuel)
            activeContext checkpointChain →
        sampleIndex + configurations.length =
            ExactCheckpointRun.checkpointTime program dispatcher bits fuel →
        IndexedResponseSampledStates program dispatcher bits sampleIndex
          configurations) := by
  let bits := bit :: suffix
  let fuel := previous + remaining + 1
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let continuation := Dovetail.clockExit fuel 0 environment
  let pendingDepth := previous + remaining
  obtain ⟨outerContext, fullContext, innerContext, targetContext,
      descentTicks, responseTicks, response, baseRun⟩ :=
    nonemptyBase_toSelected_zeroRunAt program dispatcher bit suffix continuation
      (Dovetail.clockExit_admissible fuel 0 environment) pendingDepth outerParents
  have baseParentsSplit :
      PrimitiveFuel.pendingParents environment continuation (pendingDepth + 1)
          outerParents =
        .right (SchedulerResponse.pendingFunction program dispatcher bits
          continuation) ::
          PrimitiveFuel.pendingParents environment continuation pendingDepth
            outerParents := by
    simpa [environment, SchedulerResponse.pendingFunction,
      PendingFrame.environmentCode_eq_envelope, PendingFrame.frameFunction] using
      (SchedulerCycle.pendingParents_succ_cons environment continuation
        pendingDepth outerParents)
  have baseRun' : ZeroMutationRun
      (SchedulerControl.machine program dispatcher) descentTicks
      (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher bits
        (Registers.newJob program) continuation outerParents fuel 0)
      (upConfiguration program dispatcher
        (Registers.newJob program).clearScan omega
        (ContextCursor.frames fullContext omega
          (.right (SchedulerResponse.pendingFunction program dispatcher bits
            continuation) ::
            PrimitiveFuel.pendingParents environment continuation pendingDepth
              outerParents))) := by
    rw [← baseParentsSplit]
    simpa [bits, fuel, environment, continuation, pendingDepth, Nat.add_assoc]
      using baseRun
  have response' : SelectedResponseTrace program dispatcher bits continuation
      (baseCarrier environment continuation)
      (Dovetail.clockExit_admissible fuel 0 environment)
      (Registers.newJob program).clearScan bit suffix outerContext fullContext
      innerContext targetContext
      (PrimitiveFuel.pendingParents environment continuation pendingDepth
        outerParents) responseTicks := by
    simpa [bits, fuel, environment, continuation, pendingDepth] using response
  have prefixNonempty : ∀ k, k ≤ previous →
      (CTS.iterate program k
        ⟨CTS.zeroPhase program, bit :: suffix⟩).data ≠ [] := by
    intro k bound
    simpa [bits, CTS.initial] using priorNonempty k bound
  obtain ⟨terminalRegisters, terminalPhase, terminalBit, terminalSuffix,
      terminalSource, terminalOuterContext, terminalFullContext,
      terminalInnerContext, terminalTargetContext, terminalTicks,
      prefixConfigurations, prefixChain, prefixSampled, prefixLength,
      terminalCoherent, terminalTrace, terminalEq⟩ :=
    selectedNonemptyPrefixKeepingPendingAt program dispatcher bits bits
      continuation (Dovetail.clockExit_admissible fuel 0 environment)
      outerParents layers outer.toCompleted previous remaining sampleIndex
      (Registers.newJob program).clearScan (CTS.zeroPhase program) bit suffix
      (baseCarrier environment continuation) outerContext fullContext innerContext
      targetContext responseTicks (RegistersCoherent.initial program).clearScan
      (by simpa [pendingDepth, environment] using response') prefixNonempty
  have currentEq : ⟨terminalPhase, terminalBit :: terminalSuffix⟩ =
      CTS.iterate program previous (CTS.initial program bits) := by
    simpa [bits, CTS.initial] using terminalEq
  have stepEq : CTS.absorbingStep program
        ⟨terminalRegisters.phase, terminalBit :: terminalSuffix⟩ =
      CTS.iterate program (previous + 1) (CTS.initial program bits) := by
    calc
      CTS.absorbingStep program
            ⟨terminalRegisters.phase, terminalBit :: terminalSuffix⟩ =
          CTS.absorbingStep program
            ⟨terminalPhase, terminalBit :: terminalSuffix⟩ := by
              rw [terminalCoherent.phase_eq]
      _ = CTS.absorbingStep program
          (CTS.iterate program previous (CTS.initial program bits)) := by
            rw [← currentEq]
      _ = CTS.iterate program (previous + 1)
          (CTS.initial program bits) := by rw [CTS.iterate_succ]
  have terminalEmpty :
      (CTS.absorbingStep program
        ⟨terminalRegisters.phase,
          terminalBit :: terminalSuffix⟩).data = [] := by
    rw [stepEq]
    simpa [bits] using firstEmpty
  cases remaining with
  | zero =>
      have terminalTrace' : SelectedResponseTrace program dispatcher bits
          continuation terminalSource
          (Dovetail.clockExit_admissible fuel 0 environment)
          terminalRegisters terminalBit terminalSuffix terminalOuterContext
          terminalFullContext terminalInnerContext terminalTargetContext
          outerParents terminalTicks := by
        simpa [PrimitiveFuel.pendingParents] using terminalTrace
      let finalRegisters := scannedRegisters terminalRegisters terminalBit
        terminalSuffix
      let carrier := deletedCarrier terminalBit terminalOuterContext
        terminalInnerContext
      let checkpoint :=
        SchedulerRootContinuation.normalMarkerMutationConfiguration program
          dispatcher finalRegisters terminalBit bits continuation carrier
          outerParents
      let nextParents :=
        SchedulerRootContinuation.markedContinuationParents program dispatcher
          finalRegisters terminalBit bits carrier outerParents
      obtain ⟨preMarker, terminalData⟩ :=
        selectedMarkedTerminalShapesAt program dispatcher bits previous
          terminalRegisters terminalPhase terminalCoherent terminalBit
          terminalSuffix outerParents layers outer.toCompleted terminalTrace'
          currentEq terminalEmpty
      obtain ⟨terminalLeading, terminalConfigurations, terminalChain,
          terminalEqList, terminalLeadingSampled, terminalLength, terminalLast,
          terminalData', classifyTerminal⟩ :=
        selectedMarkedTerminalRawSegmentAt program dispatcher bits bits previous
          (sampleIndex + prefixConfigurations.length) terminalRegisters
          terminalPhase terminalCoherent terminalBit terminalSuffix outerParents
          layers outer.toCompleted terminalTrace' terminalEmpty preMarker terminalData
      let leading := prefixConfigurations ++ terminalLeading
      let configurations := prefixConfigurations ++ terminalConfigurations
      have configurationsEq : configurations = leading ++ [checkpoint] := by
        simp [configurations, leading, terminalEqList, checkpoint, continuation,
          fuel, bits, environment, finalRegisters, carrier, List.append_assoc]
      have prefixAndTerminal := SchedulerRecurrence.ExactMutationChain.append
        prefixChain terminalChain
      have completeChain :=
        SchedulerResponseInvariant.ExactMutationChain.prepend baseRun'
          prefixAndTerminal
      have leadingSampled :=
        SchedulerNestedPhase.IndexedResponseSampledStates.append program
          dispatcher bits prefixSampled terminalLeadingSampled
      have terminalCost : terminalConfigurations.length =
          CheckedTransition.totalCost program dispatcher
            (CTS.iterate program previous
              (CTS.initial program bits)).phase
            (CTS.iterate program previous
              (CTS.initial program bits)).data := by
        rw [terminalLength]
        exact congrArg
          (fun current => CheckedTransition.totalCost program dispatcher
            current.phase current.data) currentEq
      have configurationsLength : configurations.length =
          ExactCheckpointRun.jobCost program dispatcher bits fuel := by
        simp only [configurations, List.length_append]
        have prefixCost : prefixConfigurations.length =
            nonemptySweepCost program dispatcher previous
              (CTS.initial program bits) := by
          simpa [bits, CTS.initial] using prefixLength
        rw [prefixCost, terminalCost]
        rw [← nonemptySweepCost_succ_last program dispatcher previous
          (CTS.initial program bits)]
        simpa [fuel] using
          (nonemptySweepCost_initial_eq_jobCost program dispatcher bits
            (previous + 1))
      refine ⟨nextParents, leading, checkpoint, configurations, ?_,
        configurationsEq, configurationsLength,
        SchedulerTraceAlgebra.LastSample.appendLeft prefixConfigurations
          terminalLast,
        terminalData', outer.marked finalRegisters terminalBit bits carrier, ?_⟩
      · simpa [bits, fuel, environment, continuation, configurations,
          finalRegisters, carrier, checkpoint, nextParents,
          SchedulerRootContinuation.markedNextStageSourceConfiguration] using
          completeChain
      · intro activeContext checkpointChain certificate indexEq
        have terminalIndex :
            (sampleIndex + prefixConfigurations.length) +
                terminalConfigurations.length =
              ExactCheckpointRun.checkpointTime program dispatcher bits fuel := by
          simpa [configurations, List.length_append, Nat.add_assoc] using indexEq
        have terminalSampled := classifyTerminal (by
          simpa [fuel, checkpoint] using! certificate) (by
          simpa [fuel] using terminalIndex)
        have completeSampled :=
          SchedulerNestedPhase.IndexedResponseSampledStates.append program
            dispatcher bits prefixSampled terminalSampled
        simpa [configurations] using completeSampled
  | succ emptyTail =>
      have terminalTrace' : SelectedResponseTrace program dispatcher bits
          continuation terminalSource
          (Dovetail.clockExit_admissible fuel 0 environment)
          terminalRegisters terminalBit terminalSuffix terminalOuterContext
          terminalFullContext terminalInnerContext terminalTargetContext
          (PrimitiveFuel.pendingParents environment continuation (emptyTail + 1)
            outerParents) terminalTicks := by
        simpa [environment] using terminalTrace
      let finalRegisters := scannedRegisters terminalRegisters terminalBit
        terminalSuffix
      let carrier := deletedCarrier terminalBit terminalOuterContext
        terminalInnerContext
      let marked := LocalResponse.markedCompleted bits continuation carrier
        (SchedulerResponse.completedRoute program dispatcher finalRegisters
          terminalBit carrier)
      let emptyRegisters :=
        SchedulerCycle.enteredEmptyRegisters finalRegisters.advance
      obtain ⟨entryConfigurations, entryChain, entrySampled, entryLength,
          emptyCoherent, markedAudit, markedDecode⟩ :=
        selectedFirstEmptyEntryAt program dispatcher bits bits continuation
          terminalSource (Dovetail.clockExit_admissible fuel 0 environment)
          terminalRegisters terminalPhase terminalCoherent terminalBit
          terminalSuffix emptyTail
          (sampleIndex + prefixConfigurations.length) outerParents layers outer.toCompleted
          terminalTrace' terminalEmpty
      let finalEmptyRegisters :=
        SchedulerCycle.emptySweepRegisters program emptyTail emptyRegisters
      let finalEmptyCarrier :=
        SchedulerCycle.emptySweepCarrier program dispatcher bits continuation
          emptyTail emptyRegisters marked
      let checkpoint :=
        SchedulerRootContinuation.emptyMarkerMutationConfiguration program
          dispatcher finalEmptyRegisters bits continuation finalEmptyCarrier
          outerParents
      let nextParents :=
        SchedulerRootContinuation.emptyContinuationParents program dispatcher
          finalEmptyRegisters bits finalEmptyCarrier outerParents
      have finalCoherent : RegistersCoherent finalEmptyRegisters
          (SchedulerNestedEmpty.emptySweepPhase program emptyTail
            (CTS.nextPhase program terminalPhase)) [] true :=
        emptySweepRegisters_coherent program emptyTail emptyRegisters
          (CTS.nextPhase program terminalPhase) emptyCoherent
      have finalAudit : ReachableAudit.Holds program dispatcher.tree bits
          continuation finalEmptyCarrier :=
        emptySweepCarrier_holds program dispatcher bits continuation emptyTail
          emptyRegisters marked markedAudit
      have finalDecode : CarrierDecoder.decode? program dispatcher.tree bits
          continuation (Dovetail.clockExit_admissible fuel 0 environment)
          finalEmptyCarrier = some [] :=
        emptySweepCarrier_decode_of program dispatcher bits continuation
          (Dovetail.clockExit_admissible fuel 0 environment) emptyTail
          emptyRegisters marked markedDecode
      have emptyState :
          ⟨CTS.nextPhase program terminalPhase, []⟩ =
            CTS.iterate program (previous + 1)
              (CTS.initial program bits) := by
        cases stepValue : CTS.absorbingStep program
            ⟨terminalRegisters.phase,
              terminalBit :: terminalSuffix⟩ with
        | mk nextPhase output =>
            have nextPhaseEq : nextPhase =
                CTS.nextPhase program terminalRegisters.phase := by
              simpa [stepValue] using
                (CTS.absorbingStep_phase program
                  ⟨terminalRegisters.phase,
                    terminalBit :: terminalSuffix⟩)
            have outputEq : output = [] := by
              simpa [stepValue] using terminalEmpty
            subst nextPhase
            subst output
            have exactStep := stepValue.symm.trans stepEq
            simpa [terminalCoherent.phase_eq] using exactStep
      have finalPhaseEq : finalEmptyRegisters.phase =
          CheckpointDecoder.expectedPhase program fuel := by
        have sweptPhase : finalEmptyRegisters.phase =
            CTS.iteratePhase program emptyTail
              (CTS.nextPhase program terminalPhase) := by
          calc
            finalEmptyRegisters.phase =
                SchedulerNestedEmpty.emptySweepPhase program emptyTail
                  (CTS.nextPhase program terminalPhase) := finalCoherent.phase_eq
            _ = CTS.iteratePhase program emptyTail
                  (CTS.nextPhase program terminalPhase) :=
              SchedulerFirstEmpty.emptySweepPhase_eq_iteratePhase program emptyTail
                (CTS.nextPhase program terminalPhase)
        have entryPhase : CTS.nextPhase program terminalPhase =
            (CTS.iterate program (previous + 1)
              (CTS.initial program bits)).phase :=
          congrArg CTS.Config.phase emptyState
        have phaseAtFinal : finalEmptyRegisters.phase =
            (CTS.iterate program emptyTail
              (CTS.iterate program (previous + 1)
                (CTS.initial program bits))).phase := by
          calc
            finalEmptyRegisters.phase =
                CTS.iteratePhase program emptyTail
                  (CTS.nextPhase program terminalPhase) := sweptPhase
            _ = CTS.iteratePhase program emptyTail
                  (CTS.iterate program (previous + 1)
                    (CTS.initial program bits)).phase := by rw [entryPhase]
            _ = (CTS.iterate program emptyTail
                  (CTS.iterate program (previous + 1)
                    (CTS.initial program bits))).phase := by
              exact (CTS.iterate_phase program emptyTail
                (CTS.iterate program (previous + 1)
                  (CTS.initial program bits))).symm
        have iterateEq : CTS.iterate program emptyTail
              (CTS.iterate program (previous + 1)
                (CTS.initial program bits)) =
            CTS.iterate program (previous + emptyTail + 1)
              (CTS.initial program bits) := by
          have combined := CTS.iterate_add program emptyTail (previous + 1)
            (CTS.initial program bits)
          rw [show emptyTail + (previous + 1) = previous + emptyTail + 1 by
            simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]] at combined
          exact combined.symm
        rw [phaseAtFinal, iterateEq]
        have expected := CheckpointRun.iterate_phase_eq_expectedPhase program
          bits (previous + emptyTail + 1)
        simpa [fuel, Nat.add_assoc] using expected
      have horizonEmpty :
          (CTS.iterate program fuel (CTS.initial program bits)).data = [] := by
        have startEmpty :
            (CTS.iterate program (previous + 1)
              (CTS.initial program bits)).data = [] := by
          simpa [bits] using firstEmpty
        have iteratedEmpty := CTS.iterate_empty_data program
          (emptyTail + 1)
          (CTS.iterate program (previous + 1)
            (CTS.initial program bits)).phase
        have startStateEq :
            ⟨(CTS.iterate program (previous + 1)
                (CTS.initial program bits)).phase, []⟩ =
              CTS.iterate program (previous + 1)
                (CTS.initial program bits) := by
          cases state : CTS.iterate program (previous + 1)
              (CTS.initial program bits) with
          | mk startPhase startData =>
              have startDataEq : startData = [] :=
                (congrArg CTS.Config.data state).symm.trans startEmpty
              subst startData
              rfl
        have combined := CTS.iterate_add program (emptyTail + 1)
          (previous + 1) (CTS.initial program bits)
        have countEq : (emptyTail + 1) + (previous + 1) = fuel := by
          simp [fuel, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
        calc
          (CTS.iterate program fuel (CTS.initial program bits)).data =
              (CTS.iterate program ((emptyTail + 1) + (previous + 1))
                (CTS.initial program bits)).data := by rw [countEq]
          _ = (CTS.iterate program (emptyTail + 1)
                (CTS.iterate program (previous + 1)
                  (CTS.initial program bits))).data :=
            congrArg CTS.Config.data combined
          _ = (CTS.iterate program (emptyTail + 1)
                ⟨(CTS.iterate program (previous + 1)
                    (CTS.initial program bits)).phase, []⟩).data := by
            rw [startStateEq]
          _ = [] := iteratedEmpty
      let terminalData := emptyMarkedTerminalDataAt program dispatcher bits
        (previous + emptyTail + 1) finalEmptyRegisters finalEmptyCarrier
        outerParents layers outer.toCompleted (by
          simpa [fuel, environment, continuation, Nat.add_assoc] using
            finalDecode) (by simpa [fuel, Nat.add_assoc] using finalPhaseEq) (by
          simpa [fuel, Nat.add_assoc] using horizonEmpty)
      obtain ⟨emptyLeading, emptyChain, emptyLeadingSampled, emptyLength,
          emptyLast, emptyOuter⟩ :=
        terminalEmptySweepRawSegmentAt program dispatcher bits
          (sampleIndex + prefixConfigurations.length +
            entryConfigurations.length)
          (previous + emptyTail + 1) emptyTail emptyRegisters marked outerParents
          layers outer.toCompleted emptyCoherent (by
            simpa [fuel, environment, continuation, Nat.add_assoc] using!
              markedAudit) (by
            simpa [fuel, environment, continuation, Nat.add_assoc] using!
              markedDecode) (by simpa [fuel, Nat.add_assoc] using finalPhaseEq)
      let leading := prefixConfigurations ++ entryConfigurations ++ emptyLeading
      let configurations := prefixConfigurations ++ entryConfigurations ++
        (emptyLeading ++ [checkpoint])
      have configurationsEq : configurations = leading ++ [checkpoint] := by
        simp [configurations, leading, List.append_assoc]
      have prefixAndEntry := SchedulerRecurrence.ExactMutationChain.append
        prefixChain entryChain
      have throughEmpty := SchedulerRecurrence.ExactMutationChain.append
        prefixAndEntry emptyChain
      have completeChain :=
        SchedulerResponseInvariant.ExactMutationChain.prepend baseRun'
          throughEmpty
      have prefixAndEntrySampled :=
        SchedulerNestedPhase.IndexedResponseSampledStates.append program
          dispatcher bits prefixSampled entrySampled
      have leadingSampled :=
        SchedulerNestedPhase.IndexedResponseSampledStates.append program
          dispatcher bits prefixAndEntrySampled (by
            simpa [List.length_append, Nat.add_assoc] using emptyLeadingSampled)
      have emptyCost :
          SchedulerRootContinuation.emptyCleanupMutations program dispatcher
              emptyTail emptyRegisters =
            nonemptySweepCost program dispatcher (emptyTail + 1)
              (CTS.iterate program (previous + 1)
                (CTS.initial program bits)) := by
        calc
          SchedulerRootContinuation.emptyCleanupMutations program dispatcher
                emptyTail emptyRegisters =
              nonemptySweepCost program dispatcher (emptyTail + 1)
                ⟨CTS.nextPhase program terminalPhase, []⟩ :=
            emptyCleanupMutations_eq_nonemptySweepCost program dispatcher
              emptyTail emptyRegisters (CTS.nextPhase program terminalPhase)
              emptyCoherent
          _ = nonemptySweepCost program dispatcher (emptyTail + 1)
                (CTS.iterate program (previous + 1)
                  (CTS.initial program bits)) := by rw [emptyState]
      have entryCost : entryConfigurations.length =
          CheckedTransition.totalCost program dispatcher
            (CTS.iterate program previous
              (CTS.initial program bits)).phase
            (CTS.iterate program previous
              (CTS.initial program bits)).data := by
        rw [entryLength]
        exact congrArg
          (fun current => CheckedTransition.totalCost program dispatcher
            current.phase current.data) currentEq
      have configurationsLength : configurations.length =
          ExactCheckpointRun.jobCost program dispatcher bits fuel := by
        simp only [configurations, List.length_append, List.length_singleton]
        have prefixCost : prefixConfigurations.length =
            nonemptySweepCost program dispatcher previous
              (CTS.initial program bits) := by
          simpa [bits, CTS.initial] using prefixLength
        have emptyCount : emptyLeading.length + 1 =
            SchedulerRootContinuation.emptyCleanupMutations program dispatcher
              emptyTail emptyRegisters := by
          simpa [List.length_append] using emptyLength
        rw [prefixCost, entryCost, emptyCount, emptyCost]
        rw [← nonemptySweepCost_succ_last program dispatcher previous
          (CTS.initial program bits)]
        rw [← nonemptySweepCost_add program dispatcher (previous + 1)
          (CTS.initial program bits) (emptyTail + 1)]
        have totalEq : (previous + 1) + (emptyTail + 1) = fuel := by
          simp [fuel, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
        rw [totalEq]
        exact nonemptySweepCost_initial_eq_jobCost program dispatcher bits fuel
      refine ⟨nextParents, leading, checkpoint, configurations, ?_,
        configurationsEq, configurationsLength,
        SchedulerTraceAlgebra.LastSample.appendLeft
          (prefixConfigurations ++ entryConfigurations) emptyLast,
        terminalData, outer.empty finalEmptyRegisters bits finalEmptyCarrier, ?_⟩
      · simpa [bits, fuel, environment, continuation, configurations,
          finalRegisters, carrier, marked, emptyRegisters, finalEmptyRegisters,
          finalEmptyCarrier, checkpoint, nextParents,
          SchedulerRootContinuation.emptyNextStageSourceConfiguration,
          List.append_assoc] using! completeChain
      · intro activeContext checkpointChain certificate indexEq
        obtain ⟨result, shape, chainLayers, terminalViewEq, queueEq,
            outputEmpty, completed⟩ := terminalData
        have markerHolds : Holds program dispatcher checkpoint := by
          simpa [checkpoint, continuation, finalEmptyRegisters,
            finalEmptyCarrier] using
            (SchedulerRootContinuation.emptyMarker_holds program dispatcher
              finalEmptyRegisters bits continuation finalEmptyCarrier
              outerParents finalCoherent finalAudit shape)
        have markerIndex : sampleIndex + leading.length + 1 =
            ExactCheckpointRun.checkpointTime program dispatcher bits fuel := by
          simpa [configurationsEq, List.length_append, Nat.add_assoc] using!
            indexEq
        have markerSample : SampledState program dispatcher bits
            (sampleIndex + leading.length + 1) checkpoint := by
          simpa [checkpoint, continuation, finalEmptyRegisters,
            finalEmptyCarrier] using
            (SchedulerRootContinuation.emptyMarker_sampledState program
              dispatcher bits (sampleIndex + leading.length + 1)
              (previous + emptyTail + 1) finalEmptyRegisters bits continuation
              finalEmptyCarrier outerParents markerHolds (by
                simpa [fuel, checkpoint, Nat.add_assoc] using certificate) (by
                simpa [fuel, Nat.add_assoc] using markerIndex))
        have fullSampled :=
          SchedulerRecurrence.IndexedResponseSampledStates.appendOne program
            dispatcher bits leadingSampled checkpoint markerSample
        simpa [configurations, leading, List.append_assoc] using fullSampled

def MixedInvariantAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (previous remaining count sampleIndex : Nat)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CleanParents program dispatcher outerParents layers) : Prop :=
  ∃ nextParents : List ParentFrame,
  ∃ configurations : List (SchedulerInvariant.Configuration program dispatcher),
    let bits := bit :: suffix
    let fuel := previous + remaining + 1
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    ExactMutationChain (SchedulerControl.machine program dispatcher)
      (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher bits
        (Registers.newJob program)
        (Dovetail.clockExit fuel 0 environment) nextParents fuel 0)
      (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher bits
        (Registers.newJob program)
        (Dovetail.clockExit fuel count environment) outerParents fuel 0)
      configurations ∧
    IndexedResponseSampledStates program dispatcher bits sampleIndex
      configurations ∧
    configurations.length =
      ExactCheckpointRun.jobsCost program dispatcher bits fuel count ∧
    CleanParents program dispatcher nextParents (layers + count)

/-- Construct every nonfinal job in the mixed first-empty branch at its exact
registered mutation count. -/
theorem completeMixedNonfinalAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (previous remaining : Nat)
    (priorNonempty : ∀ k, k ≤ previous →
      (CTS.iterate program k
        (CTS.initial program (bit :: suffix))).data ≠ [])
    (firstEmpty :
      (CTS.iterate program (previous + 1)
        (CTS.initial program (bit :: suffix))).data = []) :
    ∀ (count sampleIndex : Nat) (outerParents : List ParentFrame)
      (layers : Nat)
      (outer : CleanParents program dispatcher outerParents layers),
      MixedInvariantAt program dispatcher bit suffix previous remaining count
        sampleIndex outerParents layers outer
  | 0, sampleIndex, outerParents, layers, outer => by
      exact ⟨outerParents, [], .done 0 ⟨rfl, rfl⟩, .nil sampleIndex, rfl,
        by simpa using outer⟩
  | count + 1, sampleIndex, outerParents, layers, outer => by
      let bits := bit :: suffix
      let fuelBase := previous + remaining
      let fuel := fuelBase + 1
      let environment :=
        environmentCode (compileActions program dispatcher.tree) bits
      let continuation := Dovetail.clockExit fuel (count + 1) environment
      obtain ⟨responseParents, checkRegisters, responseConfigurations,
          responseChain, responseSampled, responseLength, responseOuter,
          responseErase, responseArity⟩ :=
        completeFirstEmptyJobAt program dispatcher bit suffix
          previous remaining count sampleIndex outerParents layers outer
          priorNonempty firstEmpty
      have handoff := SchedulerJobHandoff.handoffFuelInvariantAt program
        dispatcher bits checkRegisters fuelBase count
        (sampleIndex + responseConfigurations.length) responseParents
        (layers + 1) responseOuter.toCompleted
      let handoffConfigurations :=
        SchedulerJobHandoff.handoffFuelConfigurationsAt program dispatcher bits
          fuelBase count responseParents
      have tail := completeMixedNonfinalAt program dispatcher bit suffix previous remaining
        priorNonempty firstEmpty count
        (sampleIndex + responseConfigurations.length +
          handoffConfigurations.length)
        responseParents (layers + 1) responseOuter
      obtain ⟨terminalParents, tailConfigurations, tailChain, tailSampled,
          tailLength, terminalOuter⟩ := tail
      let configurations := responseConfigurations ++
        handoffConfigurations ++ tailConfigurations
      have responseThenHandoff : ExactMutationChain
          (SchedulerControl.machine program dispatcher)
          (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher
            bits (Registers.newJob program)
            (Dovetail.clockExit fuel count environment) responseParents fuel 0)
          (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher
            bits (Registers.newJob program) continuation outerParents fuel 0)
          (responseConfigurations ++ handoffConfigurations) := by
        exact SchedulerRecurrence.ExactMutationChain.append responseChain
          (by simpa [bits, fuelBase, fuel, environment, continuation,
              handoffConfigurations, SchedulerJobHandoff.continuationCursorAt]
            using handoff.chain)
      have completeChain := SchedulerRecurrence.ExactMutationChain.append
        responseThenHandoff tailChain
      have handoffSampled : IndexedResponseSampledStates program dispatcher bits
          (sampleIndex + responseConfigurations.length)
          handoffConfigurations := by
        simpa [handoffConfigurations] using handoff.sampled
      have responseAndHandoffSampled :=
        SchedulerNestedPhase.IndexedResponseSampledStates.append program
          dispatcher bits responseSampled handoffSampled
      have completeSampled :=
        SchedulerNestedPhase.IndexedResponseSampledStates.append program
          dispatcher bits responseAndHandoffSampled (by
            simpa [handoffConfigurations, Nat.add_assoc] using tailSampled)
      refine ⟨terminalParents, configurations, ?_, ?_, ?_, ?_⟩
      · simpa [bits, fuelBase, fuel, environment, continuation,
          configurations, handoffConfigurations, Nat.add_assoc] using
          completeChain
      · simpa [bits, configurations, handoffConfigurations] using
          completeSampled
      · simp only [configurations, List.length_append]
        rw [responseLength,
          SchedulerJobHandoff.handoffFuelConfigurationsAt_length, tailLength,
          ExactCheckpointRun.jobsCost_succ]
        simp [fuelBase, fuel, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
      · have layerEq : (layers + 1) + count = layers + (count + 1) := by
          calc
            (layers + 1) + count = layers + (1 + count) :=
              Nat.add_assoc layers 1 count
            _ = layers + (count + 1) :=
              congrArg (Nat.add layers) (Nat.add_comm 1 count)
        rw [← layerEq]
        exact terminalOuter

def EmptyInvariantAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (fuel count sampleIndex : Nat) (outerParents : List ParentFrame)
    (layers : Nat)
    (outer : CleanParents program dispatcher outerParents layers) : Prop :=
  ∃ nextParents : List ParentFrame,
  ∃ configurations : List (SchedulerInvariant.Configuration program dispatcher),
    let environment :=
      environmentCode (compileActions program dispatcher.tree) []
    ExactMutationChain (SchedulerControl.machine program dispatcher)
      (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher []
        (Registers.newJob program)
        (Dovetail.clockExit (fuel + 1) 0 environment) nextParents (fuel + 1) 0)
      (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher []
        (Registers.newJob program)
        (Dovetail.clockExit (fuel + 1) count environment) outerParents
        (fuel + 1) 0)
      configurations ∧
    IndexedResponseSampledStates program dispatcher [] sampleIndex
      configurations ∧
    configurations.length =
      ExactCheckpointRun.jobsCost program dispatcher [] (fuel + 1) count ∧
    CleanParents program dispatcher nextParents (layers + count)

/-- Construct all nonfinal absorbing-empty jobs with exact public cost. -/
theorem completeEmptyNonfinalAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (fuel : Nat) :
    ∀ (count sampleIndex : Nat) (outerParents : List ParentFrame)
      (layers : Nat)
      (outer : CleanParents program dispatcher outerParents layers),
      EmptyInvariantAt program dispatcher fuel count sampleIndex outerParents layers
        outer
  | 0, sampleIndex, outerParents, layers, outer => by
      exact ⟨outerParents, [], .done 0 ⟨rfl, rfl⟩, .nil sampleIndex, rfl,
        by simpa using outer⟩
  | count + 1, sampleIndex, outerParents, layers, outer => by
      let environment :=
        environmentCode (compileActions program dispatcher.tree) []
      let continuation := Dovetail.clockExit (fuel + 1) (count + 1) environment
      let initialRegisters := SchedulerNestedEmpty.initialEmptyRegisters program
      let finalRegisters := SchedulerCycle.emptySweepRegisters program fuel
        initialRegisters
      let initialCarrier := baseCarrier environment continuation
      let finalCarrier := SchedulerCycle.emptySweepCarrier program dispatcher []
        continuation fuel initialRegisters initialCarrier
      let nextParents :=
        SchedulerRootContinuation.emptyContinuationParents program dispatcher
          finalRegisters [] finalCarrier outerParents
      obtain ⟨responseConfigurations, responseChain, responseSampled,
          responseLength, responseOuter⟩ :=
        SchedulerNestedEmpty.nonterminalEmptyJobSegment program dispatcher []
          sampleIndex fuel count outerParents layers outer.toCompleted
      have nextOuter : CleanParents program dispatcher nextParents
          (layers + 1) := by
        exact outer.empty finalRegisters [] finalCarrier
      let nextContinuation := Dovetail.clockExit (fuel + 1) count environment
      have fuelInvariant := SchedulerNestedPhase.fuelPhaseInvariantAt program
        dispatcher [] (Registers.newJob program) (CTS.zeroPhase program) [] false
        (RegistersCoherent.initial program) nextContinuation
        (Dovetail.clockExit_admissible (fuel + 1) count environment) nextParents
        (layers + 1) nextOuter.toCompleted (sampleIndex + responseConfigurations.length)
        (fuel + 1)
      let fuelConfigurations :=
        SchedulerNestedPhase.fuelConfigurationsAt program dispatcher []
          (Registers.newJob program) nextContinuation nextParents (fuel + 1) 0
      have fuelChain : ExactMutationChain
          (SchedulerControl.machine program dispatcher)
          (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher []
            (Registers.newJob program) nextContinuation nextParents (fuel + 1) 0)
          (SchedulerNestedEmpty.nextEmptyJobSourceConfiguration program
            dispatcher fuel count finalRegisters finalCarrier outerParents)
          fuelConfigurations := by
        simpa [fuelConfigurations, nextContinuation, nextParents,
          SchedulerNestedEmpty.nextEmptyJobSourceConfiguration, finalRegisters,
          finalCarrier, environment] using fuelInvariant.chain
      have fuelSampled : IndexedResponseSampledStates program dispatcher []
          (sampleIndex + responseConfigurations.length) fuelConfigurations := by
        simpa [fuelConfigurations] using fuelInvariant.sampled
      have tail := completeEmptyNonfinalAt program dispatcher fuel count
        (sampleIndex + responseConfigurations.length + fuelConfigurations.length)
        nextParents (layers + 1) nextOuter
      obtain ⟨terminalParents, tailConfigurations, tailChain, tailSampled,
          tailLength, terminalOuter⟩ := tail
      let configurations := responseConfigurations ++ fuelConfigurations ++
        tailConfigurations
      have responseFuel := SchedulerRecurrence.ExactMutationChain.append
        responseChain fuelChain
      have completeChain := SchedulerRecurrence.ExactMutationChain.append
        responseFuel tailChain
      have responseFuelSampled :=
        SchedulerNestedPhase.IndexedResponseSampledStates.append program
          dispatcher [] responseSampled fuelSampled
      have completeSampled :=
        SchedulerNestedPhase.IndexedResponseSampledStates.append program
          dispatcher [] responseFuelSampled (by
            simpa [Nat.add_assoc] using tailSampled)
      refine ⟨terminalParents, configurations, ?_, ?_, ?_, ?_⟩
      · simpa [configurations, continuation, nextContinuation, environment]
          using completeChain
      · simpa [configurations] using completeSampled
      · have initialCoherent : RegistersCoherent initialRegisters
            (CTS.zeroPhase program) [] true := by
          simpa [initialRegisters] using
            (SchedulerNestedEmpty.initialEmptyRegisters_coherent program)
        have cleanupEq :
            SchedulerRootContinuation.emptyCleanupMutations program dispatcher
                fuel initialRegisters =
              ExactCheckpointRun.jobCost program dispatcher [] (fuel + 1) := by
          calc
            SchedulerRootContinuation.emptyCleanupMutations program dispatcher
                fuel initialRegisters =
                SchedulerNestedResponse.nonemptySweepCost program dispatcher
                  (fuel + 1) (CTS.initial program []) := by
              simpa [CTS.initial] using
                (SchedulerFirstEmpty.emptyCleanupMutations_eq_nonemptySweepCost
                  program dispatcher fuel initialRegisters
                  (CTS.zeroPhase program) initialCoherent)
            _ = ExactCheckpointRun.jobCost program dispatcher [] (fuel + 1) :=
              SchedulerNestedResponse.nonemptySweepCost_initial_eq_jobCost
                program dispatcher [] (fuel + 1)
        simp only [configurations, List.length_append]
        rw [responseLength,
          SchedulerNestedPhase.fuelConfigurationsAt_length, tailLength,
          cleanupEq, ExactCheckpointRun.jobsCost_succ]
        have addShuffle (a b c : Nat) :
            a + 1 + (b + 5) + c = b + 6 + a + c := by
          apply congrArg (fun value => value + c)
          calc
            (a + 1) + (b + 5) = a + (1 + (b + 5)) :=
              Nat.add_assoc a 1 (b + 5)
            _ = a + ((1 + b) + 5) :=
              congrArg (Nat.add a) (Nat.add_assoc 1 b 5).symm
            _ = a + ((b + 1) + 5) :=
              congrArg (fun value => a + (value + 5)) (Nat.add_comm 1 b)
            _ = a + (b + (1 + 5)) :=
              congrArg (Nat.add a) (Nat.add_assoc b 1 5)
            _ = a + (b + 6) := rfl
            _ = (b + 6) + a := Nat.add_comm a (b + 6)
        exact addShuffle _ _ _
      · have layerEq : (layers + 1) + count = layers + (count + 1) := by
          calc
            (layers + 1) + count = layers + (1 + count) :=
              Nat.add_assoc layers 1 count
            _ = layers + (count + 1) :=
              congrArg (Nat.add layers) (Nat.add_comm 1 count)
        exact Eq.mp
          (congrArg
            (fun count => CleanParents program dispatcher terminalParents count)
            layerEq)
          terminalOuter

end PureSFormal.Research.RootResetGeneratedEmptyTraversability
