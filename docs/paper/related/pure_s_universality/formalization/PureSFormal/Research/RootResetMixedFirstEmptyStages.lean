import PureSFormal.Research.RootResetMixedNonemptyStages

/-! Assembly of the first-empty stage branch from selected whole jobs. -/
namespace PureSFormal.Research.RootResetMixedFirstEmptyStages
open PureSFormal.PureS
open SchedulerControl SchedulerInvariant SchedulerCycle SchedulerResponseInvariant
open SchedulerCompletedContext SchedulerNestedResponse SchedulerNestedPhase SchedulerRecurrence SchedulerTraceAlgebra
open RootResetCleanTraversableParents

/-- Selection on the actual complete-job mutation list, independent of its output. -/
def JobSelection (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (stage : Nat) : Prop :=
  ∀ (jobs : Nat), jobs ≤ stage →
    ∀ (parents : List ParentFrame) (layers : Nat),
      CleanParents program dispatcher parents layers →
      ∀ {terminal : SchedulerInvariant.Configuration program dispatcher}
        {configurations : List (SchedulerInvariant.Configuration program dispatcher)},
        ExactMutationChain (SchedulerControl.machine program dispatcher) terminal
          (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher bits
            (Registers.newJob program)
            (RootResetEmptyHandoffContext.exitTerm program dispatcher stage jobs bits)
            parents stage 0) configurations →
        configurations.length = ExactCheckpointRun.jobCost program dispatcher bits stage →
        RootResetExactTraceAgreement.SelectorChain
          (RootResetPersistentResponseSelector.selectStep? program dispatcher)
          (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher bits
            (Registers.newJob program)
            (RootResetEmptyHandoffContext.exitTerm program dispatcher stage jobs bits)
            parents stage 0) configurations

def SelectedMixedInvariantAt
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
    CleanParents program dispatcher nextParents (layers + count) ∧
    RootResetExactTraceAgreement.SelectorChain
      (RootResetPersistentResponseSelector.selectStep? program dispatcher)
      (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher bits
        (Registers.newJob program) (Dovetail.clockExit fuel count environment)
        outerParents fuel 0) configurations

/-- Construct every nonfinal job in the mixed first-empty branch at its exact
registered mutation count. -/
theorem completeMixedNonfinalAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (previous remaining : Nat)
    (selectedJobs : JobSelection program dispatcher (bit :: suffix) (previous + remaining + 1))
    (priorNonempty : ∀ k, k ≤ previous →
      (CTS.iterate program k
        (CTS.initial program (bit :: suffix))).data ≠ [])
    (firstEmpty :
      (CTS.iterate program (previous + 1)
        (CTS.initial program (bit :: suffix))).data = []) :
    ∀ (count : Nat) (countBound : count ≤ previous + remaining + 1) (sampleIndex : Nat) (outerParents : List ParentFrame)
      (layers : Nat)
      (outer : CleanParents program dispatcher outerParents layers),
      SelectedMixedInvariantAt program dispatcher bit suffix previous remaining count
        sampleIndex outerParents layers outer
  | 0, countBound, sampleIndex, outerParents, layers, outer => by
      exact ⟨outerParents, [], .done 0 ⟨rfl, rfl⟩, .nil sampleIndex, rfl,
        by simpa using outer, .done _⟩
  | count + 1, countBound, sampleIndex, outerParents, layers, outer => by
      let bits := bit :: suffix
      let fuelBase := previous + remaining
      let fuel := fuelBase + 1
      let environment :=
        environmentCode (compileActions program dispatcher.tree) bits
      let continuation := Dovetail.clockExit fuel (count + 1) environment
      obtain ⟨responseParents, checkRegisters, responseConfigurations,
          responseChain, responseSampled, responseLength, responseOuter,
          responseErase, responseArity⟩ :=
        RootResetGeneratedEmptyTraversability.completeFirstEmptyJobAt program dispatcher bit suffix
          previous remaining count sampleIndex outerParents layers outer
          priorNonempty firstEmpty
      have responseSelected := selectedJobs (count + 1) countBound outerParents layers outer
        responseChain responseLength
      have handoffSelected := RootResetMixedJobHandoff.handoffFuel_selectorChain
        program dispatcher bits checkRegisters fuelBase count countBound responseParents responseOuter
      have handoff := SchedulerJobHandoff.handoffFuelInvariantAt program
        dispatcher bits checkRegisters fuelBase count
        (sampleIndex + responseConfigurations.length) responseParents
        (layers + 1) responseOuter.toCompleted
      let handoffConfigurations :=
        SchedulerJobHandoff.handoffFuelConfigurationsAt program dispatcher bits
          fuelBase count responseParents
      have tail := completeMixedNonfinalAt program dispatcher bit suffix previous remaining
        selectedJobs priorNonempty firstEmpty count (Nat.le_trans (Nat.le_succ count) countBound)
        (sampleIndex + responseConfigurations.length +
          handoffConfigurations.length)
        responseParents (layers + 1) responseOuter
      obtain ⟨terminalParents, tailConfigurations, tailChain, tailSampled,
          tailLength, terminalOuter, tailSelected⟩ := tail
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
      have responseThenHandoffSelected := RootResetExactTraceAgreement.SelectorChain.append
        responseChain responseSelected handoffSelected
      have completeSelected := RootResetExactTraceAgreement.SelectorChain.append
        responseThenHandoff responseThenHandoffSelected tailSelected
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
      refine ⟨terminalParents, configurations, ?_, ?_, ?_, ?_, ?_⟩
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

      · simpa [bits, fuelBase, fuel, environment, continuation,
          configurations, handoffConfigurations, Nat.add_assoc] using completeSelected

theorem firstEmptyRawAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (fuel sampleIndex : Nat)
    (selectedJobs : JobSelection program dispatcher (bit :: suffix) (fuel + 1))
    (parents : List ParentFrame)
    (outer : CleanParents program dispatcher parents
      (CheckpointRun.cumulativeLayers fuel))
    (previous remaining : Nat)
    (fuelSplit : previous + remaining = fuel)
    (priorNonempty : ∀ index, index ≤ previous →
      (CTS.iterate program index
        (CTS.initial program (bit :: suffix))).data ≠ [])
    (firstEmpty :
      (CTS.iterate program (previous + 1)
        (CTS.initial program (bit :: suffix))).data = [])
    (indexEq : sampleIndex +
        ExactCheckpointRun.stageCost program dispatcher (bit :: suffix)
          (fuel + 1) =
      ExactCheckpointRun.checkpointTime program dispatcher (bit :: suffix)
        (fuel + 1)) :
    ∃ nextParents configurations checkpoint semantic,
      RootResetCertifiedStageAssembly.CertifiedRawStageSegment program dispatcher (bit :: suffix)
        (RootResetPersistentResponseSelector.selectStep? program dispatcher) (fuel + 1) sampleIndex
        parents (CheckpointRun.cumulativeLayers fuel) nextParents configurations
        checkpoint semantic ∧
      CleanParents program dispatcher nextParents
        (CheckpointRun.cumulativeLayers (fuel + 1)) := by
  let bits := bit :: suffix
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let stage := fuel + 1
  let phaseConfigurations :=
    SchedulerNestedPhase.positiveStageConfigurationsAt program dispatcher bits
      (Registers.newJob program) parents fuel
  have phase := SchedulerNestedPhase.positiveStagePhaseInvariantAt program
    dispatcher bits (Registers.newJob program) (CTS.zeroPhase program) [] false
    (RegistersCoherent.initial program) parents
    (CheckpointRun.cumulativeLayers fuel) outer.toCompleted sampleIndex fuel
  have phaseChain : ExactMutationChain
      (SchedulerControl.machine program dispatcher)
      (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher bits
        (Registers.newJob program) (Dovetail.clockExit stage fuel environment)
        parents stage 0)
      (SchedulerRecurrence.stageSourceConfiguration program dispatcher bits
        stage parents)
      phaseConfigurations := by
    simpa [phaseConfigurations, stage, environment, bits,
      SchedulerRecurrence.stageSourceConfiguration] using phase.chain
  have phaseSampled : IndexedResponseSampledStates program dispatcher bits
      sampleIndex phaseConfigurations := by
    simpa [phaseConfigurations, bits] using phase.sampled
  obtain ⟨terminalParents, nonfinalConfigurations, nonfinalChain,
      nonfinalSampled, nonfinalLength, nonfinalOuter, nonfinalSelected⟩ :=
    completeMixedNonfinalAt program dispatcher bit suffix previous
      remaining (by simpa only [fuelSplit] using selectedJobs) priorNonempty firstEmpty fuel
      (by rw [fuelSplit]; exact Nat.le_succ fuel)
      (sampleIndex + phaseConfigurations.length) parents
      (CheckpointRun.cumulativeLayers fuel) outer
  obtain ⟨nextParents, terminalLeading, checkpoint, terminalConfigurations,
      terminalChain, terminalEq, terminalLength, terminalLast, terminalData, terminalClean,
      classifyTerminal⟩ :=
    RootResetGeneratedEmptyTraversability.completeFirstEmptyTerminalJobRawAt program dispatcher
      bit suffix previous remaining
      (sampleIndex + phaseConfigurations.length +
        nonfinalConfigurations.length)
      terminalParents (CheckpointRun.cumulativeLayers fuel + fuel)
      nonfinalOuter priorNonempty firstEmpty
  let configurations := phaseConfigurations ++ nonfinalConfigurations ++
    terminalConfigurations
  have nonfinalChain' : ExactMutationChain
      (SchedulerControl.machine program dispatcher)
      (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher bits
        (Registers.newJob program) (Dovetail.clockExit stage 0 environment)
        terminalParents stage 0)
      (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher bits
        (Registers.newJob program) (Dovetail.clockExit stage fuel environment)
        parents stage 0)
      nonfinalConfigurations := by
    simpa [bits, stage, environment, fuelSplit, Nat.add_assoc] using
      nonfinalChain
  have terminalChain' : ExactMutationChain
      (SchedulerControl.machine program dispatcher)
      (SchedulerRecurrence.stageSourceConfiguration program dispatcher bits
        (stage + 1) nextParents)
      (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher bits
        (Registers.newJob program) (Dovetail.clockExit stage 0 environment)
        terminalParents stage 0)
      terminalConfigurations := by
    simpa [bits, stage, environment, fuelSplit, Nat.add_assoc,
      SchedulerRecurrence.stageSourceConfiguration,
      SchedulerRootContinuation.nextStageSourceConfiguration] using terminalChain
  have phaseSelected : RootResetExactTraceAgreement.SelectorChain
      (RootResetPersistentResponseSelector.selectStep? program dispatcher)
      (SchedulerRecurrence.stageSourceConfiguration program dispatcher bits stage parents)
      phaseConfigurations := by
    simpa [SchedulerRecurrence.stageSourceConfiguration, stage, environment, phaseConfigurations]
      using (RootResetMixedStagePhaseSelectorChain.positiveStage_mixed_exact_selectorChain
        program dispatcher bits (Registers.newJob program) parents outer fuel).2
  have terminalSelected := selectedJobs 0 (Nat.zero_le _) terminalParents
    (CheckpointRun.cumulativeLayers fuel + fuel) nonfinalOuter terminalChain'
    (by simpa only [fuelSplit] using terminalLength)
  have nonfinalSelected' : RootResetExactTraceAgreement.SelectorChain
      (RootResetPersistentResponseSelector.selectStep? program dispatcher)
      (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher bits
        (Registers.newJob program) (Dovetail.clockExit stage fuel environment)
        parents stage 0) nonfinalConfigurations := by
    simpa [bits, stage, environment, fuelSplit, Nat.add_assoc] using nonfinalSelected
  have phaseThenNonfinal := ExactMutationChain.append phaseChain nonfinalChain'
  have completeChain := ExactMutationChain.append phaseThenNonfinal terminalChain'
  have phaseThenNonfinalSelected := RootResetExactTraceAgreement.SelectorChain.append
    phaseChain phaseSelected nonfinalSelected'
  have completeSelected := RootResetExactTraceAgreement.SelectorChain.append
    phaseThenNonfinal phaseThenNonfinalSelected terminalSelected
  have prefixSampled :=
    SchedulerNestedPhase.IndexedResponseSampledStates.append program dispatcher
      bits phaseSampled (by simpa [bits] using nonfinalSampled)
  have terminalLast' : LastSample terminalConfigurations checkpoint :=
    terminalLast
  have completeLast : LastSample configurations checkpoint := by
    exact LastSample.appendLeft
      (phaseConfigurations ++ nonfinalConfigurations) terminalLast'
  have terminalData' : SchedulerFirstEmpty.MarkedTerminalData program dispatcher
      bits stage checkpoint nextParents
      ((CheckpointRun.cumulativeLayers fuel + fuel) + 1) := by
    simpa [bits, stage, fuelSplit, Nat.add_assoc] using terminalData
  obtain ⟨result, shape, shapeLayers, shapeTerminal, queueEmpty,
      iterateEmpty, completed⟩ := terminalData'
  have layerEq :
      (CheckpointRun.cumulativeLayers fuel + fuel) + 1 =
        CheckpointRun.cumulativeLayers (fuel + 1) := by
    rw [CheckpointRun.cumulativeLayers_succ]
    exact Nat.add_assoc (CheckpointRun.cumulativeLayers fuel) fuel 1
  have completed' : CompletedParents program dispatcher nextParents
      (CheckpointRun.cumulativeLayers (fuel + 1)) := by
    exact Eq.mp
      (congrArg
        (fun count => CompletedParents program dispatcher nextParents count)
        layerEq)
      completed
  have semantic : SchedulerRecurrence.PositiveCertificateData program dispatcher
      bits (fuel + 1) checkpoint nextParents := by
    exact SchedulerRecurrence.PositiveCertificateData.ofTerminalShape program
      dispatcher bits (fuel + 1) checkpoint nextParents completed' .marked result
      shape (shapeLayers.trans layerEq)
      (by simpa [stage] using shapeTerminal)
      (by
        have exactQueue : result.queue =
            (CTS.iterate program stage (CTS.initial program bits)).data :=
          queueEmpty.trans iterateEmpty.symm
        simpa [stage] using exactQueue)
  have nonfinalLength' : nonfinalConfigurations.length =
      ExactCheckpointRun.jobsCost program dispatcher bits stage fuel := by
    simpa [bits, stage, fuelSplit, Nat.add_assoc] using nonfinalLength
  have terminalLength' : terminalConfigurations.length =
      ExactCheckpointRun.jobCost program dispatcher bits stage := by
    simpa [bits, stage, fuelSplit, Nat.add_assoc] using terminalLength
  have completeLength : configurations.length =
      ExactCheckpointRun.stageCost program dispatcher bits stage := by
    simp only [configurations, List.length_append]
    rw [SchedulerNestedPhase.positiveStageConfigurationsAt_length,
      nonfinalLength', terminalLength']
    simp [ExactCheckpointRun.stageCost, stage, Nat.succ_mul, Nat.mul_succ,
      Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
    rw [← Nat.add_assoc 2 8]
  have checkpointIndex : sampleIndex + configurations.length =
      ExactCheckpointRun.checkpointTime program dispatcher bits stage := by
    rw [completeLength]
    simpa [bits, stage] using indexEq
  refine ⟨nextParents, configurations, checkpoint, semantic,
    ⟨?_, by simpa [configurations, stage, bits, environment] using completeSelected⟩,
    layerEq ▸ terminalClean⟩
  refine
    { chain := by simpa [configurations] using completeChain
      count := by simpa [stage] using completeLength
      last := completeLast
      nextOuter := completed'
      checkpointIndex := by simpa [stage] using checkpointIndex
      classify := ?_ }
  intro activeContext checkpointChain certificate
  have terminalIndex :
      (sampleIndex + phaseConfigurations.length +
          nonfinalConfigurations.length) + terminalConfigurations.length =
        ExactCheckpointRun.checkpointTime program dispatcher bits stage := by
    simpa [configurations, List.length_append, Nat.add_assoc] using
      checkpointIndex
  have terminalSampled := classifyTerminal
    (by simpa [bits, stage, fuelSplit, Nat.add_assoc] using certificate)
    (by simpa [bits, stage, fuelSplit, Nat.add_assoc] using terminalIndex)
  have completeSampled :=
    SchedulerNestedPhase.IndexedResponseSampledStates.append program dispatcher
      bits prefixSampled (by simpa [Nat.add_assoc] using terminalSampled)
  simpa [configurations] using completeSampled


end PureSFormal.Research.RootResetMixedFirstEmptyStages
