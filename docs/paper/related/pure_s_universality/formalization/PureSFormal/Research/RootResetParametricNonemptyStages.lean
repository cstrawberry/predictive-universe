import PureSFormal.Research.RootResetStageSelectionLaws
import PureSFormal.Research.RootResetMixedNonemptySweep
import PureSFormal.Research.RootResetMixedJobHandoff
import PureSFormal.Research.RootResetGeneratedStageTraversability
import PureSFormal.Research.RootResetCertifiedStageAssembly

/-! Complete selector certificates for stages whose bounded jobs remain nonempty. -/
namespace PureSFormal.Research.RootResetParametricNonemptyStages
open PureSFormal.PureS
open SchedulerControl SchedulerInvariant SchedulerCycle SchedulerResponseInvariant
open SchedulerCompletedContext SchedulerNestedResponse SchedulerNestedPhase SchedulerRecurrence SchedulerTraceAlgebra
open RootResetCleanTraversableParents
variable {selector : RootResetStageSelectionLaws.SelectorFamily}
variable (laws : RootResetStageSelectionLaws.Laws selector)

def SelectedNonfinalInvariantAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (fuel count sampleIndex : Nat)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CleanParents program dispatcher outerParents layers) : Prop :=
  ∃ nextParents : List ParentFrame,
  ∃ configurations : List (SchedulerInvariant.Configuration program dispatcher),
    let bits := bit :: suffix
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    ExactMutationChain (SchedulerControl.machine program dispatcher)
      (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher bits
        (Registers.newJob program)
        (Dovetail.clockExit (fuel + 1) 0 environment) nextParents (fuel + 1) 0)
      (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher bits
        (Registers.newJob program)
        (Dovetail.clockExit (fuel + 1) count environment) outerParents
        (fuel + 1) 0)
      configurations ∧
    IndexedResponseSampledStates program dispatcher (bit :: suffix)
      sampleIndex configurations ∧
    configurations.length =
      ExactCheckpointRun.jobsCost program dispatcher (bit :: suffix) (fuel + 1)
        count ∧
    CleanParents program dispatcher nextParents (layers + count) ∧
    RootResetExactTraceAgreement.SelectorChain
      (selector program dispatcher)
      (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher bits
        (Registers.newJob program)
        (Dovetail.clockExit (fuel + 1) count environment) outerParents
        (fuel + 1) 0) configurations

include laws

/-- Construct all nonfinal jobs using the verified response and handoff phase
executors. -/
theorem completeNonfinalAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (fuel : Nat)
    (allNonempty : ∀ index, index ≤ fuel + 1 →
      (CTS.iterate program index
        (CTS.initial program (bit :: suffix))).data ≠ []) :
    ∀ (count : Nat) (countBound : count ≤ fuel + 1) (sampleIndex : Nat) (outerParents : List ParentFrame)
      (layers : Nat)
      (outer : CleanParents program dispatcher outerParents layers),
      SelectedNonfinalInvariantAt (selector := selector) program dispatcher bit suffix fuel count sampleIndex
        outerParents layers outer
  | 0, countBound, sampleIndex, outerParents, layers, outer => by
      exact ⟨outerParents, [], .done 0 ⟨rfl, rfl⟩, .nil sampleIndex, rfl,
        by simpa using outer, .done _⟩
  | count + 1, countBound, sampleIndex, outerParents, layers, outer => by
      let bits := bit :: suffix
      let environment :=
        environmentCode (compileActions program dispatcher.tree) bits
      let continuation := Dovetail.clockExit (fuel + 1) (count + 1) environment
      obtain ⟨responseParents, checkRegisters, responseConfigurations,
          responseChain, responseSampled, responseLength, responseOuter,
          responseErase, responseArity⟩ :=
        RootResetGeneratedJobTraversability.completeNonemptyJobAt program dispatcher bit
          suffix (fuel + 1) count (fuel + 1) sampleIndex environment outerParents
          layers outer (Nat.succ_ne_zero fuel) allNonempty
      have responseSelected := laws.job
        program dispatcher bit suffix (fuel + 1) (count + 1) (fuel + 1)
        countBound outerParents layers outer (Nat.succ_ne_zero fuel)
        responseChain responseLength
      have handoffSelected := laws.handoff
        program dispatcher bits checkRegisters fuel count countBound responseParents responseOuter
      have handoff := SchedulerJobHandoff.handoffFuelInvariantAt program
        dispatcher bits checkRegisters fuel count
        (sampleIndex + responseConfigurations.length) responseParents
        (layers + 1) responseOuter.toCompleted
      have tail := completeNonfinalAt program dispatcher bit suffix fuel allNonempty count (Nat.le_trans (Nat.le_succ count) countBound)
        (sampleIndex + responseConfigurations.length +
          (SchedulerJobHandoff.handoffFuelConfigurationsAt program dispatcher
            bits fuel count responseParents).length)
        responseParents (layers + 1) responseOuter
      obtain ⟨terminalParents, tailConfigurations, tailChain, tailSampled,
          tailLength, terminalOuter, tailSelected⟩ := tail
      let handoffConfigurations :=
        SchedulerJobHandoff.handoffFuelConfigurationsAt program dispatcher bits
          fuel count responseParents
      let configurations := responseConfigurations ++
        handoffConfigurations ++ tailConfigurations
      have responseThenHandoff : ExactMutationChain
          (SchedulerControl.machine program dispatcher)
          (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher
            bits (Registers.newJob program)
            (Dovetail.clockExit (fuel + 1) count environment) responseParents
            (fuel + 1) 0)
          (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher
            bits (Registers.newJob program) continuation outerParents
            (fuel + 1) 0)
          (responseConfigurations ++ handoffConfigurations) := by
        exact SchedulerRecurrence.ExactMutationChain.append responseChain
          (by simpa [bits, environment, handoffConfigurations,
              SchedulerJobHandoff.continuationCursorAt] using handoff.chain)
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
      · simpa [bits, environment, continuation, configurations,
          handoffConfigurations] using completeChain
      · simpa [bits, configurations, handoffConfigurations] using
          completeSampled
      · simp only [configurations, List.length_append]
        rw [responseLength,
          SchedulerJobHandoff.handoffFuelConfigurationsAt_length, tailLength]
        rw [ExactCheckpointRun.jobsCost_succ]
        simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
      · have layerEq : (layers + 1) + count = layers + (count + 1) := by
          calc
            (layers + 1) + count = layers + (1 + count) :=
              Nat.add_assoc layers 1 count
            _ = layers + (count + 1) :=
              congrArg (Nat.add layers) (Nat.add_comm 1 count)
        rw [← layerEq]
        exact terminalOuter

      · simpa [bits, environment, continuation, configurations, handoffConfigurations]
          using completeSelected


theorem allNonemptyRawAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (fuel sampleIndex : Nat)
    (parents : List ParentFrame)
    (outer : CleanParents program dispatcher parents
      (CheckpointRun.cumulativeLayers fuel))
    (allNonempty : ∀ index, index ≤ fuel + 1 →
      (CTS.iterate program index
        (CTS.initial program (bit :: suffix))).data ≠ [])
    (indexEq : sampleIndex +
        ExactCheckpointRun.stageCost program dispatcher (bit :: suffix)
          (fuel + 1) =
      ExactCheckpointRun.checkpointTime program dispatcher (bit :: suffix)
        (fuel + 1)) :
    ∃ nextParents configurations checkpoint semantic,
      RootResetCertifiedStageAssembly.CertifiedRawStageSegment program dispatcher (bit :: suffix)
        (selector program dispatcher) (fuel + 1) sampleIndex
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
    completeNonfinalAt laws program dispatcher bit suffix fuel
      allNonempty fuel (Nat.le_succ fuel) (sampleIndex + phaseConfigurations.length) parents
      (CheckpointRun.cumulativeLayers fuel) outer
  obtain ⟨nextParents, terminalLeading, checkpoint, terminalConfigurations,
      terminalChain, terminalEq, terminalLength, terminalData, terminalClean,
      classifyTerminal⟩ :=
    RootResetGeneratedJobTraversability.completeNonemptyTerminalJobRawAt program dispatcher
      bit suffix stage
      (sampleIndex + phaseConfigurations.length +
        nonfinalConfigurations.length)
      terminalParents
      (CheckpointRun.cumulativeLayers fuel + fuel) nonfinalOuter
      (Nat.succ_ne_zero fuel) allNonempty
  have phaseSelected : RootResetExactTraceAgreement.SelectorChain
      (selector program dispatcher)
      (SchedulerRecurrence.stageSourceConfiguration program dispatcher bits stage parents)
      phaseConfigurations := by
    simpa [SchedulerRecurrence.stageSourceConfiguration, stage, environment, phaseConfigurations]
      using (laws.phase program dispatcher bits (Registers.newJob program) parents outer fuel)
  have terminalSelected := laws.job
    program dispatcher bit suffix stage 0 stage (Nat.zero_le stage)
    terminalParents (CheckpointRun.cumulativeLayers fuel + fuel) nonfinalOuter
    (Nat.succ_ne_zero fuel) terminalChain terminalLength
  let configurations := phaseConfigurations ++ nonfinalConfigurations ++
    terminalConfigurations
  have phaseThenNonfinal := ExactMutationChain.append phaseChain nonfinalChain
  have completeChain := ExactMutationChain.append phaseThenNonfinal terminalChain
  have phaseThenNonfinalSelected := RootResetExactTraceAgreement.SelectorChain.append
    phaseChain phaseSelected nonfinalSelected
  have completeSelected := RootResetExactTraceAgreement.SelectorChain.append
    phaseThenNonfinal phaseThenNonfinalSelected terminalSelected
  have prefixSampled :=
    SchedulerNestedPhase.IndexedResponseSampledStates.append program dispatcher
      bits phaseSampled (by simpa using nonfinalSampled)
  have terminalLast : LastSample terminalConfigurations checkpoint := by
    rw [terminalEq]
    exact LastSample.appendLeft terminalLeading (.one checkpoint)
  have completeLast : LastSample configurations checkpoint := by
    exact LastSample.appendLeft
      (phaseConfigurations ++ nonfinalConfigurations) terminalLast
  obtain ⟨result, shape, shapeLayers, shapeTerminal, queue, completed⟩ :=
    terminalData
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
      dispatcher bits (fuel + 1) checkpoint nextParents completed' .fresh result
      shape (by simpa [layerEq] using shapeLayers) shapeTerminal queue
  have completeLength : configurations.length =
      ExactCheckpointRun.stageCost program dispatcher bits (fuel + 1) := by
    simp only [configurations, List.length_append]
    rw [SchedulerNestedPhase.positiveStageConfigurationsAt_length,
      nonfinalLength, terminalLength]
    simp [ExactCheckpointRun.stageCost, stage, Nat.succ_mul, Nat.mul_succ,
      Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
    rw [← Nat.add_assoc 2 8]
  have checkpointIndex : sampleIndex + configurations.length =
      ExactCheckpointRun.checkpointTime program dispatcher bits (fuel + 1) := by
    rw [completeLength]
    exact indexEq
  refine ⟨nextParents, configurations, checkpoint, semantic,
    ⟨?_, by simpa [configurations, stage, bits, environment] using completeSelected⟩,
    layerEq ▸ terminalClean⟩
  refine
    { chain := ?_
      count := completeLength
      last := completeLast
      nextOuter := ?_
      checkpointIndex := checkpointIndex
      classify := ?_ }
  · simpa [configurations, stage, bits, environment,
      SchedulerRecurrence.stageSourceConfiguration,
      SchedulerRootContinuation.nextStageSourceConfiguration] using completeChain
  · exact completed'
  · intro activeContext checkpointChain certificate
    have terminalIndex :
        (sampleIndex + phaseConfigurations.length +
            nonfinalConfigurations.length) + terminalConfigurations.length =
          ExactCheckpointRun.checkpointTime program dispatcher bits
            (fuel + 1) := by
      simpa [configurations, List.length_append, Nat.add_assoc] using
        checkpointIndex
    have terminalSampled := classifyTerminal certificate terminalIndex
    have completeSampled :=
      SchedulerNestedPhase.IndexedResponseSampledStates.append program dispatcher
        bits prefixSampled (by
          simpa [Nat.add_assoc] using terminalSampled)
    simpa [configurations] using completeSampled


end PureSFormal.Research.RootResetParametricNonemptyStages
