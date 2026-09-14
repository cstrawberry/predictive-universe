import PureSFormal.Research.RootResetExactTraceAgreement

/-!
# Assembly of selector-certified scheduler stages

This is the exact analogue of `SchedulerStageAssembly` for a bare-term
selector.  It changes no scheduler semantics.  A local stage builder supplies
one additional field, a `SelectorChain` over the already existing literal
configuration list; the established stage recurrence composes those finite
certificates into arbitrarily long prefixes.
-/

namespace PureSFormal.Research.RootResetCertifiedStageAssembly

open PureSFormal.PureS
open RootResetExactTraceAgreement

/-- One existing raw stage with a matching selector equation at every link. -/
structure CertifiedRawStageSegment
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (selector : Term → Option Term)
    (stage sampleIndex : Nat) (parents : List ParentFrame) (layers : Nat)
    (nextParents : List ParentFrame)
    (configurations : List
      (SchedulerInvariant.Configuration program dispatcher))
    (checkpoint : SchedulerInvariant.Configuration program dispatcher)
    (semanticData : SchedulerRecurrence.PositiveCertificateData program
      dispatcher bits stage checkpoint nextParents) : Prop where
  raw : SchedulerStageAssembly.RawStageSegment program dispatcher bits stage
    sampleIndex parents layers nextParents configurations checkpoint semanticData
  selected : SelectorChain selector
    (SchedulerRecurrence.stageSourceConfiguration program dispatcher bits stage
      parents) configurations

/-- Existential form used by the all-stage induction. -/
def CertifiedRawStageExists
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (selector : Term → Option Term)
    (fuel sampleIndex : Nat) (parents : List ParentFrame) : Prop :=
  ∃ nextParents configurations checkpoint semantic,
    CertifiedRawStageSegment program dispatcher bits selector (fuel + 1)
      sampleIndex parents (CheckpointRun.cumulativeLayers fuel) nextParents
      configurations checkpoint semantic

/-- Attach the certified first raw stage to the certified generator prelude. -/
def first
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (selector : Term → Option Term)
    (prelude : SelectorChain selector
      (SchedulerControl.initialConfiguration program dispatcher bits)
      (SchedulerRecurrence.initialPreludeConfigurations program dispatcher bits))
    {nextParents : List ParentFrame}
    {configurations : List
      (SchedulerInvariant.Configuration program dispatcher)}
    {checkpoint : SchedulerInvariant.Configuration program dispatcher}
    {semantic : SchedulerRecurrence.PositiveCertificateData program dispatcher
      bits 1 checkpoint nextParents}
    (stage : CertifiedRawStageSegment program dispatcher bits selector 1 1 [] 0
      nextParents configurations checkpoint semantic) :
    CertifiedPositiveStages program dispatcher bits selector 1 := by
  let stages := SchedulerStageAssembly.RawStageSegment.first program dispatcher
    bits semantic stage.raw
  refine ⟨stages, ?_⟩
  change SelectorChain selector
    (SchedulerControl.initialConfiguration program dispatcher bits)
    (SchedulerRecurrence.initialPreludeConfigurations program dispatcher bits ++
      configurations)
  exact SelectorChain.append
    (SchedulerRecurrence.initialPreludeChain program dispatcher bits)
    prelude stage.selected

/-- Extend a certified prefix by one certified raw stage. -/
def extend
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {bits : List Bool} {selector : Term → Option Term} {horizon : Nat}
    (past : CertifiedPositiveStages program dispatcher bits selector horizon)
    {nextParents : List ParentFrame}
    {configurations : List
      (SchedulerInvariant.Configuration program dispatcher)}
    {checkpoint : SchedulerInvariant.Configuration program dispatcher}
    {semantic : SchedulerRecurrence.PositiveCertificateData program dispatcher
      bits (horizon + 1) checkpoint nextParents}
    (stage : CertifiedRawStageSegment program dispatcher bits selector
      (horizon + 1) past.stages.configurations.length past.stages.nextParents
      (CheckpointRun.cumulativeLayers horizon) nextParents configurations
      checkpoint semantic) :
    CertifiedPositiveStages program dispatcher bits selector (horizon + 1) := by
  let stages := SchedulerStageAssembly.RawStageSegment.extend past.stages
    semantic stage.raw
  refine ⟨stages, ?_⟩
  change SelectorChain selector
    (SchedulerControl.initialConfiguration program dispatcher bits)
    (past.stages.configurations ++ configurations)
  exact SelectorChain.append past.stages.chain past.selected stage.selected

/--
A certified raw-stage builder yields a selector-certified positive prefix at
every horizon, by the same choice-free finite induction as the scheduler.
-/
theorem positiveStagesOfRaw
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (selector : Term → Option Term)
    (prelude : SelectorChain selector
      (SchedulerControl.initialConfiguration program dispatcher bits)
      (SchedulerRecurrence.initialPreludeConfigurations program dispatcher bits))
    (build : ∀ (fuel sampleIndex : Nat) (parents : List ParentFrame),
      SchedulerCompletedContext.CompletedParents program dispatcher parents
          (CheckpointRun.cumulativeLayers fuel) →
      sampleIndex + ExactCheckpointRun.stageCost program dispatcher bits
          (fuel + 1) =
        ExactCheckpointRun.checkpointTime program dispatcher bits (fuel + 1) →
      CertifiedRawStageExists program dispatcher bits selector fuel sampleIndex
        parents) :
    ∀ offset,
      Nonempty (CertifiedPositiveStages program dispatcher bits selector
        (offset + 1))
  | 0 => by
      have indexEq : 1 +
          ExactCheckpointRun.stageCost program dispatcher bits 1 =
          ExactCheckpointRun.checkpointTime program dispatcher bits 1 :=
        (ExactCheckpointRun.checkpointTime_one program dispatcher bits).symm
      obtain ⟨nextParents, configurations, checkpoint, semantic, stage⟩ :=
        build 0 1 []
          (SchedulerCompletedContext.CompletedParents.root program dispatcher)
          indexEq
      exact ⟨first program dispatcher bits selector prelude stage⟩
  | offset + 1 => by
      obtain ⟨past⟩ := positiveStagesOfRaw program dispatcher bits selector
        prelude build offset
      have indexEq : past.stages.configurations.length +
          ExactCheckpointRun.stageCost program dispatcher bits (offset + 2) =
          ExactCheckpointRun.checkpointTime program dispatcher bits
            (offset + 2) := by
        rw [past.stages.count]
        exact ExactCheckpointRun.checkpointTime_positive_succ program dispatcher
          bits offset
      obtain ⟨nextParents, configurations, checkpoint, semantic, stage⟩ :=
        build (offset + 1) past.stages.configurations.length
          past.stages.nextParents past.stages.nextOuter indexEq
      exact ⟨extend past stage⟩

/-- Iterate the actual certified stage builder while retaining its generated
parent invariant. `CompletedParents` alone does not record the nonempty fresh
accumulators needed to traverse historical continuations. The next invariant
is required for the exact `nextParents` returned by the same stage witness;
no separately chosen history is substituted into the induction. -/
theorem positiveStagesOfRaw_preserving
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (selector : Term → Option Term)
    (invariant : Nat → List ParentFrame → Prop)
    (initial : invariant 0 [])
    (prelude : SelectorChain selector
      (SchedulerControl.initialConfiguration program dispatcher bits)
      (SchedulerRecurrence.initialPreludeConfigurations program dispatcher bits))
    (build : ∀ (fuel sampleIndex : Nat) (parents : List ParentFrame),
      SchedulerCompletedContext.CompletedParents program dispatcher parents
          (CheckpointRun.cumulativeLayers fuel) →
      invariant fuel parents →
      sampleIndex + ExactCheckpointRun.stageCost program dispatcher bits
          (fuel + 1) =
        ExactCheckpointRun.checkpointTime program dispatcher bits (fuel + 1) →
      ∃ nextParents configurations checkpoint semantic,
        CertifiedRawStageSegment program dispatcher bits selector (fuel + 1)
          sampleIndex parents (CheckpointRun.cumulativeLayers fuel)
          nextParents configurations checkpoint semantic ∧
        invariant (fuel + 1) nextParents) :
    ∀ offset,
      ∃ certificate : CertifiedPositiveStages program dispatcher bits selector
        (offset + 1), invariant (offset + 1) certificate.stages.nextParents
  | 0 => by
      have indexEq : 1 +
          ExactCheckpointRun.stageCost program dispatcher bits 1 =
          ExactCheckpointRun.checkpointTime program dispatcher bits 1 :=
        (ExactCheckpointRun.checkpointTime_one program dispatcher bits).symm
      obtain ⟨nextParents, configurations, checkpoint, semantic, stage, next⟩ :=
        build 0 1 []
          (SchedulerCompletedContext.CompletedParents.root program dispatcher)
          initial indexEq
      exact ⟨first program dispatcher bits selector prelude stage, next⟩
  | offset + 1 => by
      obtain ⟨past, preserved⟩ := positiveStagesOfRaw_preserving program
        dispatcher bits selector invariant initial prelude build offset
      have indexEq : past.stages.configurations.length +
          ExactCheckpointRun.stageCost program dispatcher bits (offset + 2) =
          ExactCheckpointRun.checkpointTime program dispatcher bits
            (offset + 2) := by
        rw [past.stages.count]
        exact ExactCheckpointRun.checkpointTime_positive_succ program dispatcher
          bits offset
      obtain ⟨nextParents, configurations, checkpoint, semantic, stage, next⟩ :=
        build (offset + 1) past.stages.configurations.length
          past.stages.nextParents past.stages.nextOuter preserved indexEq
      exact ⟨extend past stage, next⟩

end PureSFormal.Research.RootResetCertifiedStageAssembly
