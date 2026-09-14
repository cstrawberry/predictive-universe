import PureSFormal.PureS.SchedulerAllStages
import PureSFormal.PureS.SchedulerNonfinalJobs
import PureSFormal.PureS.SchedulerNonfinalEmptyJobs
import PureSFormal.PureS.SchedulerMixedNonfinalJobs
import PureSFormal.PureS.SchedulerStageCases

/-!
# Exact assembly of complete positive scheduler stages

The terminal contraction of a stage is classified only after its exact global
prefix has been assembled.  `RawStageSegment` records the certificate-free
operational chain and endpoint grammar together with the callback that performs
that final classification.  This ordering removes any circular dependence
between the public checkpoint certificate and the sampled-state invariant.
-/

namespace PureSFormal.PureS

namespace SchedulerStageAssembly

open SchedulerControl SchedulerInvariant SchedulerCycle
  SchedulerResponseInvariant SchedulerCompletedContext SchedulerRecurrence
  SchedulerTraceAlgebra

/-- A complete stage before its final checkpoint sample has been classified.
The exact chain and endpoint grammar suffice to construct the global
`PositivePrefix`; `classify` then supplies all sampled-state evidence for the
same literal configuration list. -/
structure RawStageSegment
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (stage sampleIndex : Nat)
    (parents : List ParentFrame) (layers : Nat)
    (nextParents : List ParentFrame)
    (configurations : List
      (SchedulerInvariant.Configuration program dispatcher))
    (checkpoint : SchedulerInvariant.Configuration program dispatcher)
    (semanticData : SchedulerRecurrence.PositiveCertificateData program
      dispatcher bits stage checkpoint nextParents) : Prop where
  chain : ExactMutationChain (SchedulerControl.machine program dispatcher)
    (SchedulerRecurrence.stageSourceConfiguration program dispatcher bits
      (stage + 1) nextParents)
    (SchedulerRecurrence.stageSourceConfiguration program dispatcher bits stage
      parents)
    configurations
  count : configurations.length =
    ExactCheckpointRun.stageCost program dispatcher bits stage
  last : LastSample configurations checkpoint
  nextOuter : CompletedParents program dispatcher nextParents (layers + stage)
  checkpointIndex : sampleIndex + configurations.length =
    ExactCheckpointRun.checkpointTime program dispatcher bits stage
  classify :
    ∀ {activeContext : Context}
      {checkpointChain : CheckpointDecoder.ChainView program},
      CheckpointRun.PositivePrefix program dispatcher bits stage
          checkpoint.cursor.erase
          (ExactCheckpointRun.checkpointTime program dispatcher bits stage)
          activeContext checkpointChain →
      IndexedResponseSampledStates program dispatcher bits sampleIndex
        configurations

/-- Existential wrapper used by the choice-free all-stage induction.  The
operational construction proves this proposition separately for each finite
stage and never selects an infinite family of witnesses. -/
def RawStageExists
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (fuel sampleIndex : Nat)
    (parents : List ParentFrame) : Prop :=
  ∃ nextParents configurations checkpoint semantic,
    RawStageSegment program dispatcher bits (fuel + 1) sampleIndex parents
      (CheckpointRun.cumulativeLayers fuel) nextParents configurations
      checkpoint semantic

namespace RawStageSegment

/-- Attach the first raw stage to the generator's unique staging contraction.
The global certificate is built before the terminal classifier is invoked. -/
def first
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool)
    {nextParents : List ParentFrame}
    {rawConfigurations : List
      (SchedulerInvariant.Configuration program dispatcher)}
    {checkpoint : SchedulerInvariant.Configuration program dispatcher}
    (semanticData : SchedulerRecurrence.PositiveCertificateData program
      dispatcher bits 1 checkpoint nextParents)
    (raw : RawStageSegment program dispatcher bits 1 1 [] 0 nextParents
      rawConfigurations checkpoint semanticData) :
    SchedulerRecurrence.PositiveStages program dispatcher bits 1 := by
  let configurations :=
    SchedulerRecurrence.initialPreludeConfigurations program dispatcher bits ++
      rawConfigurations
  let chain := ExactMutationChain.append
    (SchedulerRecurrence.initialPreludeChain program dispatcher bits) raw.chain
  have count : configurations.length =
      ExactCheckpointRun.checkpointTime program dispatcher bits 1 := by
    simp only [configurations, List.length_append,
      SchedulerRecurrence.initialPreludeConfigurations_length]
    simpa using raw.checkpointIndex
  have last : LastSample configurations checkpoint :=
    LastSample.appendLeft
      (SchedulerRecurrence.initialPreludeConfigurations program dispatcher bits)
      raw.last
  have certificate := SchedulerRecurrence.positivePrefix_of_exactChain program
    dispatcher bits 1 chain count last semanticData
  have rawSampled : IndexedResponseSampledStates program dispatcher bits 1
      rawConfigurations := raw.classify certificate
  let segment : SchedulerRecurrence.StageSegment program dispatcher bits 1 1 []
      0 :=
    { nextParents := nextParents
      configurations := rawConfigurations
      checkpoint := checkpoint
      chain := raw.chain
      sampled := rawSampled
      count := raw.count
      last := raw.last
      nextOuter := raw.nextOuter
      checkpointIndex := raw.checkpointIndex
      semantic := semanticData }
  exact SchedulerRecurrence.PositiveStages.first program dispatcher bits segment

/-- Attach one later raw stage to an already certified positive prefix. -/
def extend
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {bits : List Bool} {horizon : Nat}
    (past : SchedulerRecurrence.PositiveStages program dispatcher bits horizon)
    {nextParents : List ParentFrame}
    {rawConfigurations : List
      (SchedulerInvariant.Configuration program dispatcher)}
    {checkpoint : SchedulerInvariant.Configuration program dispatcher}
    (semanticData : SchedulerRecurrence.PositiveCertificateData program
      dispatcher bits (horizon + 1) checkpoint nextParents)
    (raw : RawStageSegment program dispatcher bits (horizon + 1)
      past.configurations.length past.nextParents
      (CheckpointRun.cumulativeLayers horizon) nextParents rawConfigurations
      checkpoint semanticData) :
    SchedulerRecurrence.PositiveStages program dispatcher bits (horizon + 1) := by
  let configurations := past.configurations ++ rawConfigurations
  let chain := ExactMutationChain.append past.chain raw.chain
  have count : configurations.length =
      ExactCheckpointRun.checkpointTime program dispatcher bits (horizon + 1) := by
    simpa only [configurations, List.length_append] using raw.checkpointIndex
  have last : LastSample configurations checkpoint :=
    LastSample.appendLeft past.configurations raw.last
  have certificate := SchedulerRecurrence.positivePrefix_of_exactChain program
    dispatcher bits (horizon + 1) chain count last semanticData
  have rawSampled : IndexedResponseSampledStates program dispatcher bits
      past.configurations.length rawConfigurations := raw.classify certificate
  let segment : SchedulerRecurrence.StageSegment program dispatcher bits
      (horizon + 1) past.configurations.length past.nextParents
      (CheckpointRun.cumulativeLayers horizon) :=
    { nextParents := nextParents
      configurations := rawConfigurations
      checkpoint := checkpoint
      chain := raw.chain
      sampled := rawSampled
      count := raw.count
      last := raw.last
      nextOuter := raw.nextOuter
      checkpointIndex := raw.checkpointIndex
      semantic := semanticData }
  exact SchedulerRecurrence.PositiveStages.extend past segment

end RawStageSegment

/-! ## Choice-free iteration of raw stage builders -/

/-- Any premise-free builder of the next finite stage yields a concrete
positive prefix at every horizon.  The conclusion is `Nonempty`, so the proof
eliminates only finite existential certificates into `Prop` and introduces no
choice function over all horizons. -/
theorem positiveStagesOfRaw
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool)
    (build : ∀ (fuel sampleIndex : Nat) (parents : List ParentFrame),
      CompletedParents program dispatcher parents
          (CheckpointRun.cumulativeLayers fuel) →
      sampleIndex + ExactCheckpointRun.stageCost program dispatcher bits
          (fuel + 1) =
        ExactCheckpointRun.checkpointTime program dispatcher bits (fuel + 1) →
      RawStageExists program dispatcher bits fuel sampleIndex parents) :
    ∀ offset,
      Nonempty
        (SchedulerRecurrence.PositiveStages program dispatcher bits
          (offset + 1))
  | 0 => by
      have indexEq : 1 +
          ExactCheckpointRun.stageCost program dispatcher bits 1 =
          ExactCheckpointRun.checkpointTime program dispatcher bits 1 :=
        (ExactCheckpointRun.checkpointTime_one program dispatcher bits).symm
      obtain ⟨nextParents, configurations, checkpoint, semantic, raw⟩ :=
        build 0 1 [] (CompletedParents.root program dispatcher) indexEq
      exact ⟨RawStageSegment.first program dispatcher bits semantic raw⟩
  | offset + 1 => by
      obtain ⟨past⟩ := positiveStagesOfRaw program dispatcher bits build offset
      have indexEq : past.configurations.length +
          ExactCheckpointRun.stageCost program dispatcher bits (offset + 2) =
          ExactCheckpointRun.checkpointTime program dispatcher bits
            (offset + 2) := by
        rw [past.count]
        exact ExactCheckpointRun.checkpointTime_positive_succ program dispatcher
          bits offset
      obtain ⟨nextParents, configurations, checkpoint, semantic, raw⟩ :=
        build (offset + 1) past.configurations.length past.nextParents
          past.nextOuter indexEq
      exact ⟨RawStageSegment.extend past semantic raw⟩

/-! ## Stages whose bounded CTS jobs stay nonempty -/

/-- Assemble a whole positive stage when every represented CTS iterate through
the stage fuel is nonempty.  The first clock/launch/fuel phase, all nonfinal
jobs, and the raw terminal job are composed at their exact executable costs. -/
theorem allNonemptyRawAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (fuel sampleIndex : Nat)
    (parents : List ParentFrame)
    (outer : CompletedParents program dispatcher parents
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
      RawStageSegment program dispatcher (bit :: suffix) (fuel + 1) sampleIndex
        parents (CheckpointRun.cumulativeLayers fuel) nextParents configurations
        checkpoint semantic := by
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
    (CheckpointRun.cumulativeLayers fuel) outer sampleIndex fuel
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
      nonfinalSampled, nonfinalLength, nonfinalOuter⟩ :=
    SchedulerNonfinalJobs.completeAt program dispatcher bit suffix fuel
      allNonempty fuel (sampleIndex + phaseConfigurations.length) parents
      (CheckpointRun.cumulativeLayers fuel) outer
  obtain ⟨nextParents, terminalLeading, checkpoint, terminalConfigurations,
      terminalChain, terminalEq, terminalLength, terminalData,
      classifyTerminal⟩ :=
    SchedulerNestedResponse.completeNonemptyTerminalJobRawAt program dispatcher
      bit suffix stage
      (sampleIndex + phaseConfigurations.length +
        nonfinalConfigurations.length)
      terminalParents
      (CheckpointRun.cumulativeLayers fuel + fuel) nonfinalOuter
      (Nat.succ_ne_zero fuel) allNonempty
  let configurations := phaseConfigurations ++ nonfinalConfigurations ++
    terminalConfigurations
  have phaseThenNonfinal := ExactMutationChain.append phaseChain nonfinalChain
  have completeChain := ExactMutationChain.append phaseThenNonfinal terminalChain
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
  refine ⟨nextParents, configurations, checkpoint, semantic, ?_⟩
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

/-! ## Stages whose nonempty seed first reaches the empty word -/

/-- Assemble a whole positive stage when the nonempty seed has a named first
empty transition within its bounded horizon.  The ordinary prefix, absorbing
suffix, every nonfinal job, and the raw marked terminal job are composed at
their exact executable costs. -/
theorem firstEmptyRawAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (fuel sampleIndex : Nat)
    (parents : List ParentFrame)
    (outer : CompletedParents program dispatcher parents
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
      RawStageSegment program dispatcher (bit :: suffix) (fuel + 1) sampleIndex
        parents (CheckpointRun.cumulativeLayers fuel) nextParents configurations
        checkpoint semantic := by
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
    (CheckpointRun.cumulativeLayers fuel) outer sampleIndex fuel
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
      nonfinalSampled, nonfinalLength, nonfinalOuter⟩ :=
    SchedulerMixedNonfinalJobs.completeAt program dispatcher bit suffix previous
      remaining priorNonempty firstEmpty fuel
      (sampleIndex + phaseConfigurations.length) parents
      (CheckpointRun.cumulativeLayers fuel) outer
  obtain ⟨nextParents, terminalLeading, checkpoint, terminalConfigurations,
      terminalChain, terminalEq, terminalLength, terminalLast, terminalData,
      classifyTerminal⟩ :=
    SchedulerFirstEmpty.completeFirstEmptyTerminalJobRawAt program dispatcher
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
  have phaseThenNonfinal := ExactMutationChain.append phaseChain nonfinalChain'
  have completeChain := ExactMutationChain.append phaseThenNonfinal terminalChain'
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
  refine ⟨nextParents, configurations, checkpoint, semantic, ?_⟩
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

/-! ## Stages whose encoded input is already empty -/

/-- Assemble a whole positive stage for the absorbing-empty seed.  Every
nonfinal job uses the EMPTY recurrence, while the final job is kept raw until
the enclosing exact prefix has certified its unique marked checkpoint. -/
theorem emptyRawAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (fuel sampleIndex : Nat) (parents : List ParentFrame)
    (outer : CompletedParents program dispatcher parents
      (CheckpointRun.cumulativeLayers fuel))
    (indexEq : sampleIndex +
        ExactCheckpointRun.stageCost program dispatcher [] (fuel + 1) =
      ExactCheckpointRun.checkpointTime program dispatcher [] (fuel + 1)) :
    ∃ nextParents configurations checkpoint semantic,
      RawStageSegment program dispatcher [] (fuel + 1) sampleIndex parents
        (CheckpointRun.cumulativeLayers fuel) nextParents configurations
        checkpoint semantic := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) []
  let stage := fuel + 1
  let phaseConfigurations :=
    SchedulerNestedPhase.positiveStageConfigurationsAt program dispatcher []
      (Registers.newJob program) parents fuel
  have phase := SchedulerNestedPhase.positiveStagePhaseInvariantAt program
    dispatcher [] (Registers.newJob program) (CTS.zeroPhase program) [] false
    (RegistersCoherent.initial program) parents
    (CheckpointRun.cumulativeLayers fuel) outer sampleIndex fuel
  have phaseChain : ExactMutationChain
      (SchedulerControl.machine program dispatcher)
      (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher []
        (Registers.newJob program) (Dovetail.clockExit stage fuel environment)
        parents stage 0)
      (SchedulerRecurrence.stageSourceConfiguration program dispatcher [] stage
        parents)
      phaseConfigurations := by
    simpa [phaseConfigurations, stage, environment,
      SchedulerRecurrence.stageSourceConfiguration] using phase.chain
  have phaseSampled : IndexedResponseSampledStates program dispatcher []
      sampleIndex phaseConfigurations := by
    simpa [phaseConfigurations] using phase.sampled
  obtain ⟨terminalParents, nonfinalConfigurations, nonfinalChain,
      nonfinalSampled, nonfinalLength, nonfinalOuter⟩ :=
    SchedulerNonfinalEmptyJobs.completeAt program dispatcher fuel fuel
      (sampleIndex + phaseConfigurations.length) parents
      (CheckpointRun.cumulativeLayers fuel) outer
  let initialRegisters := SchedulerNestedEmpty.initialEmptyRegisters program
  let continuation := Dovetail.clockExit stage 0 environment
  let initialCarrier := baseCarrier environment continuation
  let finalRegisters := SchedulerCycle.emptySweepRegisters program fuel
    initialRegisters
  let finalCarrier := SchedulerCycle.emptySweepCarrier program dispatcher []
    continuation fuel initialRegisters initialCarrier
  let checkpoint :=
    SchedulerRootContinuation.emptyMarkerMutationConfiguration program
      dispatcher finalRegisters [] continuation finalCarrier terminalParents
  let terminalStart := sampleIndex + phaseConfigurations.length +
    nonfinalConfigurations.length
  obtain ⟨terminalPrefix, terminalChain, terminalPrefixSampled,
      terminalLength, terminalLast, terminalOuter⟩ :=
    SchedulerNestedEmpty.terminalEmptyJobRawSegment program dispatcher
      terminalStart fuel terminalParents
      (CheckpointRun.cumulativeLayers fuel + fuel) nonfinalOuter
  let terminalConfigurations := terminalPrefix ++ [checkpoint]
  have terminalLength' : terminalConfigurations.length =
      SchedulerRootContinuation.emptyCleanupMutations program dispatcher fuel
        initialRegisters := by
    simpa [terminalConfigurations, checkpoint, finalRegisters, finalCarrier,
      continuation, environment, initialRegisters, initialCarrier] using
      terminalLength
  let configurations := phaseConfigurations ++ nonfinalConfigurations ++
    terminalConfigurations
  have phaseThenNonfinal := ExactMutationChain.append phaseChain nonfinalChain
  have completeChain : ExactMutationChain
      (SchedulerControl.machine program dispatcher)
      (SchedulerRecurrence.stageSourceConfiguration program dispatcher []
        (stage + 1)
        (SchedulerRootContinuation.emptyContinuationParents program dispatcher
          finalRegisters [] finalCarrier terminalParents))
      (SchedulerRecurrence.stageSourceConfiguration program dispatcher [] stage
        parents)
      configurations := by
    have appended := ExactMutationChain.append phaseThenNonfinal terminalChain
    simpa [configurations, terminalConfigurations, stage, environment,
      continuation, initialRegisters, initialCarrier, finalRegisters,
      finalCarrier, SchedulerRecurrence.stageSourceConfiguration,
      SchedulerRootContinuation.emptyNextStageSourceConfiguration] using! appended
  have initialCoherent : RegistersCoherent initialRegisters
      (CTS.zeroPhase program) [] true := by
    simpa [initialRegisters] using
      (SchedulerNestedEmpty.initialEmptyRegisters_coherent program)
  have finalCoherent : RegistersCoherent finalRegisters
      (SchedulerNestedEmpty.emptySweepPhase program fuel
        (CTS.zeroPhase program)) []
      true := by
    exact SchedulerNestedEmpty.emptySweepRegisters_coherent program fuel
      initialRegisters (CTS.zeroPhase program) initialCoherent
  have initialAudit : ReachableAudit.Holds program dispatcher.tree []
      continuation initialCarrier := by
    simpa [initialCarrier, environment] using
      (ReachableAudit.Holds.initial program dispatcher.tree [] continuation)
  have finalAudit : ReachableAudit.Holds program dispatcher.tree [] continuation
      finalCarrier := by
    exact SchedulerNestedEmpty.emptySweepCarrier_holds program dispatcher []
      continuation fuel initialRegisters initialCarrier initialAudit
  have finalDecode : CarrierDecoder.decode? program dispatcher.tree []
      continuation (Dovetail.clockExit_admissible stage 0 environment)
      finalCarrier = some [] := by
    simpa [stage] using!
      (SchedulerNestedEmpty.emptySweepCarrier_decode program dispatcher
        continuation (Dovetail.clockExit_admissible stage 0 environment) fuel
        initialRegisters)
  have phaseEq : finalRegisters.phase =
      CheckpointDecoder.expectedPhase program stage := by
    simpa [stage, finalRegisters, initialRegisters] using
      (SchedulerNestedEmpty.initialEmptySweep_phase_eq_expectedPhase program
        fuel)
  let rawShapes :=
    SchedulerNestedEmpty.terminalEmptyRawShapesAt program dispatcher [] fuel
      finalRegisters finalCarrier terminalParents
      (CheckpointRun.cumulativeLayers fuel + fuel) nonfinalOuter finalDecode
      phaseEq
  let preMarker := rawShapes.1
  let result := rawShapes.2.1
  let terminalShape := rawShapes.2.2
  have layerEq :
      (CheckpointRun.cumulativeLayers fuel + fuel) + 1 =
        CheckpointRun.cumulativeLayers (fuel + 1) := by
    rw [CheckpointRun.cumulativeLayers_succ]
    exact Nat.add_assoc (CheckpointRun.cumulativeLayers fuel) fuel 1
  have completed' : CompletedParents program dispatcher
      (SchedulerRootContinuation.emptyContinuationParents program dispatcher
        finalRegisters [] finalCarrier terminalParents)
      (CheckpointRun.cumulativeLayers (fuel + 1)) := by
    exact Eq.mp
      (congrArg
        (fun count => CompletedParents program dispatcher
          (SchedulerRootContinuation.emptyContinuationParents program
            dispatcher finalRegisters [] finalCarrier terminalParents) count)
        layerEq)
      terminalOuter
  have queueEmpty : result.queue = [] := by
    have compatible :=
      (CheckpointDecoder.markerCompatible_eq_true_iff
        terminalShape.chain.last.status result.queue).mp terminalShape.marker
    exact compatible.mp terminalShape.status_eq
  have iterateEmpty :
      (CTS.iterate program (fuel + 1) (CTS.initial program [])).data = [] := by
    exact CTS.iterate_empty_data program (fuel + 1) (CTS.zeroPhase program)
  have semantic : SchedulerRecurrence.PositiveCertificateData program dispatcher
      [] (fuel + 1) checkpoint
      (SchedulerRootContinuation.emptyContinuationParents program dispatcher
        finalRegisters [] finalCarrier terminalParents) := by
    exact SchedulerRecurrence.PositiveCertificateData.ofTerminalShape program
      dispatcher [] (fuel + 1) checkpoint
      (SchedulerRootContinuation.emptyContinuationParents program dispatcher
        finalRegisters [] finalCarrier terminalParents)
      completed' .marked result
      (by simpa [checkpoint, continuation, environment] using terminalShape)
      (by
        rw [← layerEq]
        dsimp [terminalShape, rawShapes,
          SchedulerNestedEmpty.terminalEmptyRawShapesAt,
          CheckpointRun.addLayers,
          SchedulerRootContinuation.markedRootTerminalShape, id]
        exact Nat.add_comm 1
          (CheckpointRun.cumulativeLayers fuel + fuel))
      (by
        dsimp [terminalShape, rawShapes,
          SchedulerNestedEmpty.terminalEmptyRawShapesAt,
          CheckpointRun.addLayers,
          SchedulerRootContinuation.markedRootTerminalShape, id])
      (queueEmpty.trans iterateEmpty.symm)
  have cleanupEq :
      SchedulerRootContinuation.emptyCleanupMutations program dispatcher fuel
          initialRegisters =
        ExactCheckpointRun.jobCost program dispatcher [] stage := by
    calc
      SchedulerRootContinuation.emptyCleanupMutations program dispatcher fuel
          initialRegisters =
          SchedulerNestedResponse.nonemptySweepCost program dispatcher stage
            (CTS.initial program []) := by
        simpa [stage, CTS.initial] using
          (SchedulerFirstEmpty.emptyCleanupMutations_eq_nonemptySweepCost
            program dispatcher fuel initialRegisters (CTS.zeroPhase program)
            initialCoherent)
      _ = ExactCheckpointRun.jobCost program dispatcher [] stage :=
        SchedulerNestedResponse.nonemptySweepCost_initial_eq_jobCost program
          dispatcher [] stage
  have completeLength : configurations.length =
      ExactCheckpointRun.stageCost program dispatcher [] stage := by
    simp only [configurations, List.length_append]
    rw [SchedulerNestedPhase.positiveStageConfigurationsAt_length,
      nonfinalLength, terminalLength', cleanupEq]
    simp [ExactCheckpointRun.stageCost, stage, Nat.succ_mul, Nat.mul_succ,
      Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
    rw [← Nat.add_assoc 2 8]
  have checkpointIndex : sampleIndex + configurations.length =
      ExactCheckpointRun.checkpointTime program dispatcher [] stage := by
    rw [completeLength]
    exact indexEq
  have completeLast : LastSample configurations checkpoint := by
    simpa [configurations, terminalConfigurations, checkpoint, finalRegisters,
      finalCarrier, continuation, environment, initialRegisters,
      initialCarrier] using
      (LastSample.appendLeft
        (phaseConfigurations ++ nonfinalConfigurations) terminalLast)
  refine ⟨_, configurations, checkpoint, semantic, ?_⟩
  refine
    { chain := completeChain
      count := completeLength
      last := completeLast
      nextOuter := completed'
      checkpointIndex := checkpointIndex
      classify := ?_ }
  intro activeContext checkpointChain certificate
  have markerHolds : Holds program dispatcher checkpoint := by
    exact SchedulerRootContinuation.emptyMarker_holds program dispatcher
      finalRegisters [] continuation finalCarrier terminalParents finalCoherent
      finalAudit (by simpa [checkpoint] using! terminalShape)
  have markerIndex : terminalStart + terminalPrefix.length + 1 =
      ExactCheckpointRun.checkpointTime program dispatcher [] stage := by
    simpa [configurations, terminalConfigurations, terminalStart,
      List.length_append, Nat.add_assoc] using checkpointIndex
  have markerSample : SampledState program dispatcher []
      (terminalStart + terminalPrefix.length + 1) checkpoint := by
    exact SchedulerRootContinuation.emptyMarker_sampledState program dispatcher
      [] (terminalStart + terminalPrefix.length + 1) fuel finalRegisters []
      continuation finalCarrier terminalParents markerHolds
      (by simpa [checkpoint, stage] using certificate)
      (by simpa [stage] using markerIndex)
  have terminalSampled : IndexedResponseSampledStates program dispatcher []
      terminalStart terminalConfigurations := by
    have singleton : IndexedResponseSampledStates program dispatcher []
        (terminalStart + terminalPrefix.length) [checkpoint] :=
      .cons (terminalStart + terminalPrefix.length) markerSample
        (.nil (terminalStart + terminalPrefix.length + 1))
    simpa [terminalConfigurations] using
      (SchedulerNestedPhase.IndexedResponseSampledStates.append program
        dispatcher [] terminalPrefixSampled singleton)
  have prefixSampled :=
    SchedulerNestedPhase.IndexedResponseSampledStates.append program dispatcher
      [] phaseSampled (by simpa using nonfinalSampled)
  have allSampled :=
    SchedulerNestedPhase.IndexedResponseSampledStates.append program dispatcher
      [] prefixSampled (by simpa [terminalStart, Nat.add_assoc] using
        terminalSampled)
  simpa [configurations] using allSampled

/-! ## Exhaustive construction of every positive stage -/

/-- Every positive stage has one of the three concrete operational forms:
the seed is already empty, it stays nonempty throughout the finite horizon, or
it has a constructively least empty iterate. -/
theorem rawStageAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (fuel sampleIndex : Nat)
    (parents : List ParentFrame)
    (outer : CompletedParents program dispatcher parents
      (CheckpointRun.cumulativeLayers fuel))
    (indexEq : sampleIndex +
        ExactCheckpointRun.stageCost program dispatcher bits (fuel + 1) =
      ExactCheckpointRun.checkpointTime program dispatcher bits (fuel + 1)) :
    RawStageExists program dispatcher bits fuel sampleIndex parents := by
  cases bits with
  | nil =>
      exact emptyRawAt program dispatcher fuel sampleIndex parents outer indexEq
  | cons bit suffix =>
      cases SchedulerStageCases.allNonempty_or_firstEmpty program
          (bit :: suffix) (fuel + 1) with
      | allNonempty allNonempty =>
          exact allNonemptyRawAt program dispatcher bit suffix fuel sampleIndex
            parents outer allNonempty indexEq
      | firstEmpty first =>
          obtain ⟨previous, remaining, fuelSplit, priorNonempty,
              firstEmpty⟩ := first.split_positiveStage
          exact firstEmptyRawAt program dispatcher bit suffix fuel sampleIndex
            parents outer previous remaining fuelSplit priorNonempty firstEmpty
            indexEq

/-! ## From all finite prefixes to productivity and exact decoding -/

/-- Arbitrarily long exact positive prefixes provide the unbounded finite
advance property at the concrete generator configuration. -/
theorem initialExistentialGoodOfPositiveStages
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool)
    (stages : ∀ offset,
      Nonempty (SchedulerRecurrence.PositiveStages program dispatcher bits
        (offset + 1))) :
    SchedulerProductivity.ExistentialGood program dispatcher bits 0
      (SchedulerControl.initialConfiguration program dispatcher bits) := by
  refine
    { current := SampledState.initial program dispatcher bits
      future := ?_ }
  intro remaining
  obtain ⟨stagePrefix⟩ := stages remaining
  exact stagePrefix.toExistentialAdvancePrefix
    (Nat.le_trans (Nat.le_succ remaining) stagePrefix.horizonLower)

/-- Normalize the exact finite prefix recurrence to the scheduler's single
configuration-only mutation-search bound. -/
theorem initialGoodOfPositiveStages
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool)
    (stages : ∀ offset,
      Nonempty (SchedulerRecurrence.PositiveStages program dispatcher bits
        (offset + 1))) :
    SampledGood program dispatcher bits 0
      (SchedulerBound.bound program dispatcher)
      (SchedulerControl.initialConfiguration program dispatcher bits) :=
  SchedulerProductivity.ExistentialGood.toSampledGood
    (initialExistentialGoodOfPositiveStages program dispatcher bits stages)

/-- The positive-prefix recurrence identifies every executable public
checkpoint once productivity has supplied the total contraction run. -/
theorem exactCheckpointOfPositiveStages
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool)
    (stages : ∀ offset,
      Nonempty (SchedulerRecurrence.PositiveStages program dispatcher bits
        (offset + 1)))
    (initialGood : SampledGood program dispatcher bits 0
      (SchedulerBound.bound program dispatcher)
      (SchedulerControl.initialConfiguration program dispatcher bits)) :
    ∀ horizon,
      let system := SampledGood.productiveSystem program dispatcher bits
        (SchedulerBound.bound program dispatcher)
        (SchedulerControl.initialConfiguration program dispatcher bits)
        initialGood
      PublicDecoder.decode program dispatcher.tree
          (system.contractionRun
            (ExactCheckpointRun.checkpointTime program dispatcher bits
              horizon)).cursor.erase =
        some (horizon,
          CTS.iterate program horizon (CTS.initial program bits))
  | 0 => by
      simpa using! PublicDecoder.decode_timeZero program dispatcher bits
  | offset + 1 => by
      obtain ⟨stagePrefix⟩ := stages offset
      exact stagePrefix.contractionRun_checkpointDecode initialGood

end SchedulerStageAssembly

/-! ## Premise-free scheduler recurrence -/

namespace SchedulerRecurrence

open SchedulerControl SchedulerInvariant

/-- A concrete certified scheduler prefix exists at every positive horizon. -/
theorem positiveStages
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (offset : Nat) :
    Nonempty (PositiveStages program dispatcher bits (offset + 1)) :=
  SchedulerStageAssembly.positiveStagesOfRaw program dispatcher bits
    (fun fuel sampleIndex parents outer indexEq =>
      SchedulerStageAssembly.rawStageAt program dispatcher bits fuel sampleIndex
        parents outer indexEq)
    offset

/-- Premise-free productivity and simultaneous sampled-state invariant for the
concrete encoded generator of every finite CTS input. -/
theorem initialGood
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    SampledGood program dispatcher bits 0
      (SchedulerBound.bound program dispatcher)
      (SchedulerControl.initialConfiguration program dispatcher bits) :=
  SchedulerStageAssembly.initialGoodOfPositiveStages program dispatcher bits
    (positiveStages program dispatcher bits)

/-- Every executable checkpoint time decodes the exact corresponding CTS
iterate on the concrete productive scheduler run. -/
theorem exactCheckpoint
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (horizon : Nat) :
    let system := SampledGood.productiveSystem program dispatcher bits
      (SchedulerBound.bound program dispatcher)
      (SchedulerControl.initialConfiguration program dispatcher bits)
      (initialGood program dispatcher bits)
    PublicDecoder.decode program dispatcher.tree
        (system.contractionRun
          (ExactCheckpointRun.checkpointTime program dispatcher bits
            horizon)).cursor.erase =
      some (horizon,
        CTS.iterate program horizon (CTS.initial program bits)) :=
  SchedulerStageAssembly.exactCheckpointOfPositiveStages program dispatcher bits
    (positiveStages program dispatcher bits)
    (initialGood program dispatcher bits) horizon

end SchedulerRecurrence

end PureSFormal.PureS
