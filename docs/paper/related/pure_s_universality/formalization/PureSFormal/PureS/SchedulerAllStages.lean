import PureSFormal.PureS.SchedulerTraceAlgebra
import PureSFormal.PureS.PublicDecoder

/-!
# Complete scheduler stages

A complete stage segment starts at the literal clock source below an already
completed continuation zipper, lists every subsequent contraction exactly
once, and absorbs the mutation-free continuation suffix into the next stage
source.  Its final listed sample is the public checkpoint.
-/

namespace PureSFormal.PureS

namespace SchedulerRecurrence

open SchedulerControl SchedulerInvariant SchedulerCycle
  SchedulerResponseInvariant SchedulerCompletedContext

open SchedulerTraceAlgebra

/-- Literal clock source of stage `stage` below completed outer parents. -/
def stageSourceConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (stage : Nat) (parents : List ParentFrame) :
    Configuration program dispatcher :=
  clockPhaseSourceConfiguration program dispatcher (Registers.newJob program)
    (.left (environmentCode (compileActions program dispatcher.tree) bits) ::
      parents) stage

/-- The scheduler's clock-source zipper erases to the literal dovetail stage
source rebuilt below the completed outer parents. -/
@[simp]
theorem stageSourceConfiguration_erase
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (stage : Nat) (parents : List ParentFrame) :
    (stageSourceConfiguration program dispatcher bits stage parents).cursor.erase =
      Cursor.rebuild parents
        (Dovetail.stageSource stage
          (environmentCode (compileActions program dispatcher.tree) bits)) := by
  cases stage <;> rfl

/-! ## Concrete generator prelude -/

/-- The sole contraction before the first positive stage clock. -/
def initialPreludeConfigurations
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) : List (Configuration program dispatcher) :=
  [firstMutationConfiguration program dispatcher bits]

/-- The generator reaches the exact first-stage source after its staging
contraction and a mutation-free control suffix. -/
theorem initialPreludeChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    ExactMutationChain (SchedulerControl.machine program dispatcher)
      (stageSourceConfiguration program dispatcher bits 1 [])
      (SchedulerControl.initialConfiguration program dispatcher bits)
      (initialPreludeConfigurations program dispatcher bits) := by
  have suffix : ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (firstToSecondMutationPrefixTicks program dispatcher bits)
      (firstMutationConfiguration program dispatcher bits)
      (stageSourceConfiguration program dispatcher bits 1 []) := by
    simpa [stageSourceConfiguration, secondMutationSourceConfiguration,
      clockPhaseSourceConfiguration, positiveClockSourceConfiguration,
      clockBase] using!
      (firstToSecondMutation_zeroRun program dispatcher bits)
  exact .next (firstMutationPrefixTicks program dispatcher bits + 1)
    (initial_seekFirstMutation program dispatcher bits)
    (.done _ suffix)

/-- The concrete staging contraction is indexed by global sample one. -/
theorem initialPreludeSampled
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    IndexedResponseSampledStates program dispatcher bits 0
      (initialPreludeConfigurations program dispatcher bits) := by
  exact .cons 0 (SampledState.firstMutation program dispatcher bits) (.nil 1)

@[simp]
theorem initialPreludeConfigurations_length
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    (initialPreludeConfigurations program dispatcher bits).length = 1 :=
  rfl

/-! ## From the operational prefix to the literal checkpoint certificate -/

/-- Parser and context facts local to a named positive checkpoint.  The
global reduction prefix is deliberately absent: it is reconstructed from the
controller's exact mutation chain. -/
structure PositiveCertificateData
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (horizon : Nat)
    (checkpoint : Configuration program dispatcher)
    (nextParents : List ParentFrame) where
  chain : CheckpointDecoder.ChainView program
  chainShape : CheckpointDecoder.ChainShape program dispatcher.tree
    checkpoint.cursor.erase (.completed chain)
  layers : chain.layers = CheckpointRun.cumulativeLayers horizon
  terminal : chain.terminal = CheckpointRun.terminalView horizon bits
  view : CheckpointRun.ViewSpec program dispatcher.tree bits horizon chain.last
  wrapsCompleted :
    ∀ {innerTerm : Term} {innerChain : CheckpointDecoder.ChainView program},
      CheckpointDecoder.ChainShape program dispatcher.tree innerTerm
          (.completed innerChain) →
        CheckpointDecoder.ChainShape program dispatcher.tree
          ((SchedulerInvariant.contextOfParents nextParents).plug innerTerm)
          (.completed
            (CheckpointRun.addLayers
              (CheckpointRun.cumulativeLayers horizon) innerChain))
  contextDepth :
    (CanonicalTraversal.contextAddress
      (SchedulerInvariant.contextOfParents nextParents)).length =
        horizon * (horizon + 1)

/-- Twice the cumulative completed-shell count is the exact cursor depth of
the dovetailed checkpoint context. -/
theorem two_mul_cumulativeLayers : ∀ horizon,
    2 * CheckpointRun.cumulativeLayers horizon = horizon * (horizon + 1)
  | 0 => rfl
  | horizon + 1 => by
      rw [CheckpointRun.cumulativeLayers_succ, Nat.mul_add,
        two_mul_cumulativeLayers horizon]
      change horizon * (horizon + 1) + 2 * (horizon + 1) =
        (horizon + 1) * (horizon + 2)
      calc
        horizon * (horizon + 1) + 2 * (horizon + 1) =
            (horizon + 2) * (horizon + 1) := by
              rw [← Nat.add_mul]
        _ = (horizon + 1) * (horizon + 2) := Nat.mul_comm _ _

/-- A literal checkpoint chain below the generated completed-parent zipper
contains all context-wide data required by `PositivePrefix`. -/
def PositiveCertificateData.ofCompletedParents
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (horizon : Nat)
    (checkpoint : Configuration program dispatcher)
    (nextParents : List ParentFrame)
    (outer : CompletedParents program dispatcher nextParents
      (CheckpointRun.cumulativeLayers horizon))
    (chain : CheckpointDecoder.ChainView program)
    (chainShape : CheckpointDecoder.ChainShape program dispatcher.tree
      checkpoint.cursor.erase (.completed chain))
    (layers : chain.layers = CheckpointRun.cumulativeLayers horizon)
    (terminal : chain.terminal = CheckpointRun.terminalView horizon bits)
    (view : CheckpointRun.ViewSpec program dispatcher.tree bits horizon
      chain.last) :
    PositiveCertificateData program dispatcher bits horizon checkpoint
      nextParents where
  chain := chain
  chainShape := chainShape
  layers := layers
  terminal := terminal
  view := view
  wrapsCompleted := fun inner => outer.wrapCompleted inner
  contextDepth := outer.contextDepth.trans (two_mul_cumulativeLayers horizon)

/-- A halt-consistent terminal shape whose queue is the exact CTS iterate is
the endpoint-local semantic package needed by the operational prefix bridge. -/
def PositiveCertificateData.ofTerminalShape
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (horizon : Nat)
    (checkpoint : Configuration program dispatcher)
    (nextParents : List ParentFrame)
    (outer : CompletedParents program dispatcher nextParents
      (CheckpointRun.cumulativeLayers horizon))
    (status : CheckpointDecoder.HaltStatus)
    (result : CheckpointDecoder.PositiveView program)
    (shape : CheckpointExclusion.TerminalCheckpointShape program dispatcher.tree
      status result checkpoint.cursor.erase)
    (layers : shape.chain.layers =
      CheckpointRun.cumulativeLayers horizon)
    (terminal : shape.chain.terminal =
      CheckpointRun.terminalView horizon bits)
    (queue : result.queue =
      (CTS.iterate program horizon (CTS.initial program bits)).data) :
    PositiveCertificateData program dispatcher bits horizon checkpoint
      nextParents := by
  have phase : shape.chain.last.label.1 =
      CheckpointDecoder.expectedPhase program horizon := by
    have exactPhase := shape.phase
    rw [terminal] at exactPhase
    simpa [CheckpointRun.terminalView] using exactPhase
  have carrier : CheckpointDecoder.CarrierDecodes program dispatcher.tree
      shape.chain.last.accumulator
      (CTS.iterate program horizon (CTS.initial program bits)).data := by
    rw [← queue]
    exact shape.carrier
  have marker : CheckpointDecoder.markerCompatible shape.chain.last.status
      (CTS.iterate program horizon (CTS.initial program bits)).data = true := by
    rw [← queue]
    exact shape.marker
  exact PositiveCertificateData.ofCompletedParents program dispatcher bits
    horizon checkpoint nextParents outer shape.chain shape.chainShape layers
    terminal ⟨phase, carrier, marker⟩

/-- An exact controller prefix plus local parser evidence is already the full
literal positive-prefix certificate.  This is the semantic/operational bridge:
it uses only the controller's actual `Rdx` samples and never appeals to
uniqueness of pure-S reduction lengths. -/
theorem positivePrefix_of_exactChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (horizon : Nat)
    {configurations : List (Configuration program dispatcher)}
    {checkpoint : Configuration program dispatcher}
    {nextParents : List ParentFrame}
    (chain : ExactMutationChain (SchedulerControl.machine program dispatcher)
      (stageSourceConfiguration program dispatcher bits (horizon + 1)
        nextParents)
      (SchedulerControl.initialConfiguration program dispatcher bits)
      configurations)
    (count : configurations.length =
      ExactCheckpointRun.checkpointTime program dispatcher bits horizon)
    (final : LastSample configurations checkpoint)
    (semantic : PositiveCertificateData program dispatcher bits horizon
      checkpoint nextParents) :
    CheckpointRun.PositivePrefix program dispatcher bits horizon
      checkpoint.cursor.erase
      (ExactCheckpointRun.checkpointTime program dispatcher bits horizon)
      (SchedulerInvariant.contextOfParents nextParents) semantic.chain := by
  have endpointErase :=
    SchedulerTraceAlgebra.ExactMutationChain.last_erase_terminal chain final
  refine
    { run :=
        { steps := ?_
          plugsNextStage := ?_
          contextDepth := semantic.contextDepth }
      chainShape := semantic.chainShape
      layers := semantic.layers
      terminal := semantic.terminal
      last := semantic.view
      wrapsCompleted := semantic.wrapsCompleted }
  · have reduced :=
      SchedulerTraceAlgebra.ExactMutationChain.toStepsN chain
    rw [← endpointErase, count] at reduced
    simpa using reduced
  · rw [SchedulerInvariant.contextOfParents_plug,
      ← stageSourceConfiguration_erase]
    exact endpointErase.symm

/-- Direct terminal-shape specialization of the operational prefix bridge. -/
theorem positivePrefix_of_terminalShape
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (horizon : Nat)
    {configurations : List (Configuration program dispatcher)}
    {checkpoint : Configuration program dispatcher}
    {nextParents : List ParentFrame}
    (chain : ExactMutationChain (SchedulerControl.machine program dispatcher)
      (stageSourceConfiguration program dispatcher bits (horizon + 1)
        nextParents)
      (SchedulerControl.initialConfiguration program dispatcher bits)
      configurations)
    (count : configurations.length =
      ExactCheckpointRun.checkpointTime program dispatcher bits horizon)
    (final : LastSample configurations checkpoint)
    (outer : CompletedParents program dispatcher nextParents
      (CheckpointRun.cumulativeLayers horizon))
    (status : CheckpointDecoder.HaltStatus)
    (result : CheckpointDecoder.PositiveView program)
    (shape : CheckpointExclusion.TerminalCheckpointShape program dispatcher.tree
      status result checkpoint.cursor.erase)
    (layers : shape.chain.layers =
      CheckpointRun.cumulativeLayers horizon)
    (terminal : shape.chain.terminal =
      CheckpointRun.terminalView horizon bits)
    (queue : result.queue =
      (CTS.iterate program horizon (CTS.initial program bits)).data) :
    CheckpointRun.PositivePrefix program dispatcher bits horizon
      checkpoint.cursor.erase
      (ExactCheckpointRun.checkpointTime program dispatcher bits horizon)
      (SchedulerInvariant.contextOfParents nextParents) shape.chain :=
  positivePrefix_of_exactChain program dispatcher bits horizon chain count final
    (PositiveCertificateData.ofTerminalShape program dispatcher bits horizon
      checkpoint nextParents outer status result shape layers terminal queue)

/-- Exact operational and semantic package for one complete positive stage. -/
structure StageSegment
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (stage sampleIndex : Nat)
    (parents : List ParentFrame) (layers : Nat) where
  nextParents : List ParentFrame
  configurations : List (Configuration program dispatcher)
  checkpoint : Configuration program dispatcher
  chain : ExactMutationChain (SchedulerControl.machine program dispatcher)
    (stageSourceConfiguration program dispatcher bits (stage + 1) nextParents)
    (stageSourceConfiguration program dispatcher bits stage parents)
    configurations
  sampled : IndexedResponseSampledStates program dispatcher bits sampleIndex
    configurations
  count : configurations.length =
    ExactCheckpointRun.stageCost program dispatcher bits stage
  last : LastSample configurations checkpoint
  nextOuter : CompletedParents program dispatcher nextParents (layers + stage)
  checkpointIndex : sampleIndex + configurations.length =
    ExactCheckpointRun.checkpointTime program dispatcher bits stage
  semantic : PositiveCertificateData program dispatcher bits stage checkpoint
    nextParents

namespace StageSegment

/-- The exact mutation chain ends at a configuration whose erased term is the
mutation-free next-stage source below the returned parent zipper. -/
theorem nextSource_erase
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {bits : List Bool} {stage sampleIndex : Nat}
    {parents : List ParentFrame} {layers : Nat}
    (segment : StageSegment program dispatcher bits stage sampleIndex parents
      layers) :
    (stageSourceConfiguration program dispatcher bits (stage + 1)
      segment.nextParents).cursor.erase = segment.checkpoint.cursor.erase := by
  exact (SchedulerTraceAlgebra.ExactMutationChain.last_erase_terminal
    segment.chain segment.last).symm

/-- Every complete positive stage contains at least one sampled contraction. -/
theorem length_positive
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {bits : List Bool} {stage sampleIndex : Nat}
    {parents : List ParentFrame} {layers : Nat}
    (segment : StageSegment program dispatcher bits stage sampleIndex parents
      layers) :
    0 < segment.configurations.length :=
  segment.last.length_positive

/-- A complete stage supplies its exact finite productivity segment. -/
theorem toExistentialAdvance
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {bits : List Bool} {stage sampleIndex : Nat}
    {parents : List ParentFrame} {layers : Nat}
    (segment : StageSegment program dispatcher bits stage sampleIndex parents
      layers) :
    SchedulerProductivity.ExistentialAdvance program dispatcher bits sampleIndex
      (ExactCheckpointRun.stageCost program dispatcher bits stage)
      (stageSourceConfiguration program dispatcher bits stage parents) := by
  have advance := ExactMutationChain.toExistentialAdvance program dispatcher
    bits sampleIndex segment.chain segment.sampled
  simpa [segment.count] using advance

/-- If the executable run is at this stage source, its exact checkpoint index
is the segment's named final sample. -/
theorem contractionRun_checkpoint
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {bits : List Bool} {stage sampleIndex : Nat}
    {parents : List ParentFrame} {layers : Nat}
    (segment : StageSegment program dispatcher bits stage sampleIndex parents
      layers)
    (initialGood : SampledGood program dispatcher bits 0
      (SchedulerBound.bound program dispatcher)
      (SchedulerControl.initialConfiguration program dispatcher bits))
    (sourceEq :
      let system := SampledGood.productiveSystem program dispatcher bits
        (SchedulerBound.bound program dispatcher)
        (SchedulerControl.initialConfiguration program dispatcher bits)
        initialGood
      system.contractionRun sampleIndex =
        stageSourceConfiguration program dispatcher bits stage parents) :
    let system := SampledGood.productiveSystem program dispatcher bits
      (SchedulerBound.bound program dispatcher)
      (SchedulerControl.initialConfiguration program dispatcher bits)
      initialGood
    system.contractionRun
        (ExactCheckpointRun.checkpointTime program dispatcher bits stage) =
      segment.checkpoint := by
  dsimp only at sourceEq ⊢
  have reached := ExactMutationChain.contractionRun_eq_last program dispatcher
    bits initialGood segment.chain segment.last sourceEq
  rw [← segment.checkpointIndex]
  exact reached

end StageSegment

/-! ## Exact prefixes from the concrete generator -/

/-- All scheduler contractions through a positive horizon, with the
mutation-free suffix after its checkpoint absorbed into the next clock source. -/
structure PositiveStages
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (horizon : Nat) where
  nextParents : List ParentFrame
  configurations : List (Configuration program dispatcher)
  checkpoint : Configuration program dispatcher
  chain : ExactMutationChain (SchedulerControl.machine program dispatcher)
    (stageSourceConfiguration program dispatcher bits (horizon + 1)
      nextParents)
    (SchedulerControl.initialConfiguration program dispatcher bits)
    configurations
  sampled : IndexedResponseSampledStates program dispatcher bits 0
    configurations
  count : configurations.length =
    ExactCheckpointRun.checkpointTime program dispatcher bits horizon
  horizonLower : horizon ≤ configurations.length
  last : LastSample configurations checkpoint
  nextOuter : CompletedParents program dispatcher nextParents
    (CheckpointRun.cumulativeLayers horizon)
  activeContext : Context
  checkpointChain : CheckpointDecoder.ChainView program
  certificate : CheckpointRun.PositivePrefix program dispatcher bits horizon
    checkpoint.cursor.erase
    (ExactCheckpointRun.checkpointTime program dispatcher bits horizon)
    activeContext checkpointChain
  nextContext : SchedulerInvariant.contextOfParents nextParents = activeContext

namespace PositiveStages

/-- The carried literal certificate determines the public horizon output. -/
theorem checkpointDecode
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {bits : List Bool} {horizon : Nat}
    (stages : PositiveStages program dispatcher bits horizon) :
    PublicDecoder.decode program dispatcher.tree stages.checkpoint.cursor.erase =
      some (horizon,
        CTS.iterate program horizon (CTS.initial program bits)) :=
  PublicDecoder.decode_positivePrefix stages.certificate

/-- The accumulated operational parent zipper denotes the same active context
as the literal positive-prefix certificate. -/
theorem nextSource_erase
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {bits : List Bool} {horizon : Nat}
    (stages : PositiveStages program dispatcher bits horizon) :
    (stageSourceConfiguration program dispatcher bits (horizon + 1)
      stages.nextParents).cursor.erase = stages.checkpoint.cursor.erase := by
  rw [stageSourceConfiguration_erase,
    ← SchedulerInvariant.contextOfParents_plug, stages.nextContext]
  exact stages.certificate.run.plugsNextStage

/-- Attach the first complete positive stage to the concrete generator
staging contraction. -/
def first
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool)
    (stage : StageSegment program dispatcher bits 1 1 [] 0) :
    PositiveStages program dispatcher bits 1 := by
  let configurations :=
    initialPreludeConfigurations program dispatcher bits ++
      stage.configurations
  let chain := ExactMutationChain.append
    (initialPreludeChain program dispatcher bits) stage.chain
  have sampled : IndexedResponseSampledStates program dispatcher bits 0
      configurations :=
    SchedulerNestedPhase.IndexedResponseSampledStates.append program dispatcher
      bits (initialPreludeSampled program dispatcher bits) (by
        simpa using stage.sampled)
  have count : configurations.length =
      ExactCheckpointRun.checkpointTime program dispatcher bits 1 := by
    simp [configurations, initialPreludeConfigurations, stage.count,
      Nat.add_comm]
  have last : LastSample configurations stage.checkpoint := by
    exact LastSample.appendLeft
      (initialPreludeConfigurations program dispatcher bits) stage.last
  have certificate := positivePrefix_of_exactChain program dispatcher bits 1
    chain count last stage.semantic
  exact
    { nextParents := stage.nextParents
      configurations := configurations
      checkpoint := stage.checkpoint
      chain := chain
      sampled := sampled
      count := count
      horizonLower := by simp [configurations, initialPreludeConfigurations]
      last := last
      nextOuter := by simpa using stage.nextOuter
      activeContext := SchedulerInvariant.contextOfParents stage.nextParents
      checkpointChain := stage.semantic.chain
      certificate := certificate
      nextContext := rfl }

/-- Append one exact stage to a concrete positive scheduler prefix. -/
def extend
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {bits : List Bool} {horizon : Nat}
    (past : PositiveStages program dispatcher bits horizon)
    (stage : StageSegment program dispatcher bits (horizon + 1)
      past.configurations.length past.nextParents
      (CheckpointRun.cumulativeLayers horizon)) :
    PositiveStages program dispatcher bits (horizon + 1) := by
  let configurations := past.configurations ++ stage.configurations
  let chain := ExactMutationChain.append past.chain stage.chain
  have sampled : IndexedResponseSampledStates program dispatcher bits 0
      configurations :=
    SchedulerNestedPhase.IndexedResponseSampledStates.append program dispatcher
      bits past.sampled (by simpa using stage.sampled)
  have count : configurations.length =
      ExactCheckpointRun.checkpointTime program dispatcher bits (horizon + 1) := by
    simpa [configurations] using stage.checkpointIndex
  have last : LastSample configurations stage.checkpoint :=
    LastSample.appendLeft past.configurations stage.last
  have certificate := positivePrefix_of_exactChain program dispatcher bits
    (horizon + 1) chain count last stage.semantic
  exact
    { nextParents := stage.nextParents
      configurations := configurations
      checkpoint := stage.checkpoint
      chain := chain
      sampled := sampled
      count := count
      horizonLower := by
        have oneLe : 1 ≤ stage.configurations.length :=
          stage.length_positive
        simpa only [configurations, List.length_append] using
          (Nat.add_le_add past.horizonLower oneLe)
      last := last
      nextOuter := by simpa using stage.nextOuter
      activeContext := SchedulerInvariant.contextOfParents stage.nextParents
      checkpointChain := stage.semantic.chain
      certificate := certificate
      nextContext := rfl }

/-- An exact positive prefix supplies every shorter requested productivity
prefix from the concrete initial configuration. -/
theorem toExistentialAdvancePrefix
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {bits : List Bool} {horizon requested : Nat}
    (stages : PositiveStages program dispatcher bits horizon)
    (bound : requested ≤ stages.configurations.length) :
    SchedulerProductivity.ExistentialAdvance program dispatcher bits 0 requested
      (SchedulerControl.initialConfiguration program dispatcher bits) :=
  SchedulerTraceAlgebra.ExactMutationChain.toExistentialAdvancePrefix program
    dispatcher bits 0 requested stages.chain stages.sampled bound

/-- Once productivity has been packaged, the exact prefix identifies the
literal executable checkpoint configuration. -/
theorem contractionRun_checkpoint
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {bits : List Bool} {horizon : Nat}
    (stages : PositiveStages program dispatcher bits horizon)
    (initialGood : SampledGood program dispatcher bits 0
      (SchedulerBound.bound program dispatcher)
      (SchedulerControl.initialConfiguration program dispatcher bits)) :
    let system := SampledGood.productiveSystem program dispatcher bits
      (SchedulerBound.bound program dispatcher)
      (SchedulerControl.initialConfiguration program dispatcher bits)
      initialGood
    system.contractionRun
        (ExactCheckpointRun.checkpointTime program dispatcher bits horizon) =
      stages.checkpoint := by
  dsimp only
  have reached := ExactMutationChain.contractionRun_eq_last program dispatcher
    bits initialGood (sampleIndex := 0) stages.chain stages.last (by rfl)
  rw [← stages.count]
  simpa using reached

/-- The executable contraction run decodes to the exact CTS iterate at every
positive prefix supplied by the construction. -/
theorem contractionRun_checkpointDecode
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {bits : List Bool} {horizon : Nat}
    (stages : PositiveStages program dispatcher bits horizon)
    (initialGood : SampledGood program dispatcher bits 0
      (SchedulerBound.bound program dispatcher)
      (SchedulerControl.initialConfiguration program dispatcher bits)) :
    let system := SampledGood.productiveSystem program dispatcher bits
      (SchedulerBound.bound program dispatcher)
      (SchedulerControl.initialConfiguration program dispatcher bits)
      initialGood
    PublicDecoder.decode program dispatcher.tree
        (system.contractionRun
          (ExactCheckpointRun.checkpointTime program dispatcher bits
            horizon)).cursor.erase =
      some (horizon,
        CTS.iterate program horizon (CTS.initial program bits)) := by
  dsimp only
  have reached := stages.contractionRun_checkpoint initialGood
  rw [reached]
  exact stages.checkpointDecode

end PositiveStages

end SchedulerRecurrence

end PureSFormal.PureS
