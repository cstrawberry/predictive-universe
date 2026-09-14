import PureSFormal.Research.RootResetMixedBitConsJob
import PureSFormal.Research.RootResetMixedFirstEmptyStages
import PureSFormal.Research.RootResetEmptyStagesSelectorChain
import PureSFormal.Research.RootResetTermOnlyUniversalityTransfer

/-!
# Bare-term selector agreement for every input and contraction index

The nonempty seed case retains clean generated parents through the exact stage
recurrence. Each finite stage either stays nonempty or has a first empty output;
both branches carry selection on the same literal mutation list as the public
checkpoint construction. The already verified initially empty run closes the
remaining seed case. No selector agreement premise is supplied to this theorem.
-/
namespace PureSFormal.Research.RootResetAllInputsTraceAgreement

open PureSFormal.PureS
open RootResetCleanTraversableParents RootResetExactTraceAgreement
open RootResetPersistentResponseSelector

theorem bitcons_rawStageAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (fuel sampleIndex : Nat)
    (parents : List ParentFrame)
    (outer : CleanParents program dispatcher parents (CheckpointRun.cumulativeLayers fuel))
    (indexEq : sampleIndex + ExactCheckpointRun.stageCost program dispatcher (bit :: suffix) (fuel + 1) =
      ExactCheckpointRun.checkpointTime program dispatcher (bit :: suffix) (fuel + 1)) :
    ∃ nextParents configurations checkpoint semantic,
      RootResetCertifiedStageAssembly.CertifiedRawStageSegment program dispatcher (bit :: suffix)
        (selectStep? program dispatcher) (fuel + 1) sampleIndex parents
        (CheckpointRun.cumulativeLayers fuel) nextParents configurations checkpoint semantic ∧
      CleanParents program dispatcher nextParents (CheckpointRun.cumulativeLayers (fuel + 1)) := by
  have selectedJobs : RootResetMixedFirstEmptyStages.JobSelection program dispatcher (bit :: suffix) (fuel + 1) := by
    intro jobs bound jobParents layers clean terminal configurations actual lengthEq
    exact RootResetMixedBitConsJob.completeJob_selectorChain program dispatcher bit suffix
      (fuel + 1) jobs (fuel + 1) bound jobParents layers clean (Nat.succ_ne_zero fuel) actual lengthEq
  cases SchedulerStageCases.allNonempty_or_firstEmpty program (bit :: suffix) (fuel + 1) with
  | allNonempty allNonempty =>
      exact RootResetMixedNonemptyStages.allNonemptyRawAt program dispatcher bit suffix fuel sampleIndex
        parents outer allNonempty indexEq
  | firstEmpty first =>
      obtain ⟨previous, remaining, fuelSplit, priorNonempty, firstEmpty⟩ := first.split_positiveStage
      exact RootResetMixedFirstEmptyStages.firstEmptyRawAt program dispatcher bit suffix fuel sampleIndex
        selectedJobs parents outer previous remaining fuelSplit priorNonempty firstEmpty indexEq

theorem bitcons_certifiedPositiveStages
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (offset : Nat) :
    Nonempty (CertifiedPositiveStages program dispatcher (bit :: suffix)
      (selectStep? program dispatcher) (offset + 1)) := by
  have preserved := RootResetCertifiedStageAssembly.positiveStagesOfRaw_preserving
    program dispatcher (bit :: suffix) (selectStep? program dispatcher)
    (fun fuel parents => CleanParents program dispatcher parents (CheckpointRun.cumulativeLayers fuel))
    (CleanParents.root (program := program) (dispatcher := dispatcher))
    (RootResetResponseSelectorInitialAgreement.initialPrelude_selectorChain program dispatcher (bit :: suffix))
    (by
      intro fuel sampleIndex parents completed clean indexEq
      exact bitcons_rawStageAt program dispatcher bit suffix fuel sampleIndex parents clean indexEq)
    offset
  obtain ⟨certificate, clean⟩ := preserved
  exact ⟨certificate⟩

theorem bitcons_selectsEveryContractionRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (index : Nat) :
    let bits := bit :: suffix
    let system := SchedulerInvariant.SampledGood.productiveSystem program dispatcher bits
      (SchedulerBound.bound program dispatcher) (SchedulerControl.initialConfiguration program dispatcher bits)
      (SchedulerRecurrence.initialGood program dispatcher bits)
    selectStep? program dispatcher (system.contractionRun index).cursor.erase =
      some (system.contractionRun (index + 1)).cursor.erase := by
  obtain ⟨certificate⟩ := bitcons_certifiedPositiveStages program dispatcher bit suffix index
  have within : index < certificate.stages.configurations.length :=
    Nat.lt_of_succ_le (by simpa using certificate.stages.horizonLower)
  simpa only [Nat.zero_add] using SelectorChain.selects_contractionRun
    certificate.stages.chain certificate.selected (SchedulerRecurrence.initialGood program dispatcher (bit :: suffix))
    (base := 0) (offset := index) rfl within

theorem selectsEveryContractionRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (index : Nat) :
    let system := SchedulerInvariant.SampledGood.productiveSystem program dispatcher bits
      (SchedulerBound.bound program dispatcher) (SchedulerControl.initialConfiguration program dispatcher bits)
      (SchedulerRecurrence.initialGood program dispatcher bits)
    selectStep? program dispatcher (system.contractionRun index).cursor.erase =
      some (system.contractionRun (index + 1)).cursor.erase := by
  cases bits with
  | nil => exact RootResetEmptyStagesSelectorChain.emptyInput_selectsEveryContractionRun program dispatcher index
  | cons bit suffix => exact bitcons_selectsEveryContractionRun program dispatcher bit suffix index

/-- The construction-specific agreement premise is discharged for every CTS program. -/
theorem agreesOnEverySample (program : CTS.Program) :
    RootResetTermOnlyUniversalityTransfer.AgreesOnEverySample program := by
  intro bits index
  have selected := selectsEveryContractionRun program
    (WeakPathUniversality.canonicalDispatcher program) bits index
  simpa [RootResetTermOnlyUniversalityTransfer.selector,
    WeakPathUniversality.finiteCTSWeakPathUniversality,
    WeakPathUniversality.finiteCTSUniformCertificate,
    PureS.ControllerProjection.UniformCertificate.uniformRealizes,
    PureS.ControllerProjection.Certificate.realizes,
    PureS.SchedulerInvariant.SampledGood.uniformCertificate] using! selected

/-- Exact CTS realization by the bare-term selector, with no agreement premise.
Finite local-observation machine realization is outside this theorem's scope. -/
def finiteCTSTermOnlyUniversality (program : CTS.Program) :
    WeakPath.UniformRealizes program
      (RootResetTermOnlyTransfer.Projects (RootResetTermOnlyUniversalityTransfer.selector program))
      (RootResetTermOnlyUniversalityTransfer.selector program)
      (PublicDecoder.decode program (WeakPathUniversality.canonicalDispatcher program).tree) :=
  RootResetTermOnlyUniversalityTransfer.finiteCTSTermOnlyUniversalityOfAgreement
    program (agreesOnEverySample program)

@[simp]
theorem transferred_path_eq (program : CTS.Program) (bits : List Bool) :
    (finiteCTSTermOnlyUniversality program).path bits =
      (WeakPathUniversality.finiteCTSWeakPathUniversality program).path bits := rfl

/-- Iteration receives only the current term and agrees at every contraction,
including intermediate samples between source checkpoints. -/
theorem termOnlyPath_eq_persistentPath
    (program : CTS.Program) (bits : List Bool) (index : Nat) :
    RootResetTermOnlyTransfer.run (RootResetTermOnlyUniversalityTransfer.selector program) index
        ((WeakPathUniversality.finiteCTSWeakPathUniversality program).encode bits) =
      ((WeakPathUniversality.finiteCTSWeakPathUniversality program).path bits).term index :=
  RootResetTermOnlyUniversalityTransfer.termOnlyPath_eq_persistentPath_of_agreement
    program (agreesOnEverySample program) bits index

end PureSFormal.Research.RootResetAllInputsTraceAgreement
