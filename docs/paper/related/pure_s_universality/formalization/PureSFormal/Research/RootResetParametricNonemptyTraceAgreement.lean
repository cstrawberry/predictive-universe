import PureSFormal.Research.RootResetParametricFirstEmptyStages

/-!
# Stage assembly for a selector satisfying explicit local laws

The nonempty seed case retains clean generated parents through the exact stage
recurrence. Each finite stage either stays nonempty or has a first empty output;
both branches carry selection on the same literal mutation list as the public
checkpoint construction. The already verified initially empty run closes the
remaining seed case. The local selection laws remain explicit hypotheses; this assembly does not discharge them for a finite controller.
-/
namespace PureSFormal.Research.RootResetParametricNonemptyTraceAgreement

open PureSFormal.PureS
open RootResetCleanTraversableParents RootResetExactTraceAgreement
variable {selector : RootResetStageSelectionLaws.SelectorFamily}
variable (laws : RootResetStageSelectionLaws.Laws selector)
include laws

theorem bitcons_rawStageAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (fuel sampleIndex : Nat)
    (parents : List ParentFrame)
    (outer : CleanParents program dispatcher parents (CheckpointRun.cumulativeLayers fuel))
    (indexEq : sampleIndex + ExactCheckpointRun.stageCost program dispatcher (bit :: suffix) (fuel + 1) =
      ExactCheckpointRun.checkpointTime program dispatcher (bit :: suffix) (fuel + 1)) :
    ∃ nextParents configurations checkpoint semantic,
      RootResetCertifiedStageAssembly.CertifiedRawStageSegment program dispatcher (bit :: suffix)
        (selector program dispatcher) (fuel + 1) sampleIndex parents
        (CheckpointRun.cumulativeLayers fuel) nextParents configurations checkpoint semantic ∧
      CleanParents program dispatcher nextParents (CheckpointRun.cumulativeLayers (fuel + 1)) := by
  have selectedJobs : RootResetParametricFirstEmptyStages.JobSelection (selector := selector) program dispatcher (bit :: suffix) (fuel + 1) := by
    intro jobs bound jobParents layers clean terminal configurations actual lengthEq
    exact laws.job program dispatcher bit suffix
      (fuel + 1) jobs (fuel + 1) bound jobParents layers clean (Nat.succ_ne_zero fuel) actual lengthEq
  cases SchedulerStageCases.allNonempty_or_firstEmpty program (bit :: suffix) (fuel + 1) with
  | allNonempty allNonempty =>
      exact RootResetParametricNonemptyStages.allNonemptyRawAt laws program dispatcher bit suffix fuel sampleIndex
        parents outer allNonempty indexEq
  | firstEmpty first =>
      obtain ⟨previous, remaining, fuelSplit, priorNonempty, firstEmpty⟩ := first.split_positiveStage
      exact RootResetParametricFirstEmptyStages.firstEmptyRawAt laws program dispatcher bit suffix fuel sampleIndex
        selectedJobs parents outer previous remaining fuelSplit priorNonempty firstEmpty indexEq

theorem bitcons_certifiedPositiveStages
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (offset : Nat) :
    Nonempty (CertifiedPositiveStages program dispatcher (bit :: suffix)
      (selector program dispatcher) (offset + 1)) := by
  have preserved := RootResetCertifiedStageAssembly.positiveStagesOfRaw_preserving
    program dispatcher (bit :: suffix) (selector program dispatcher)
    (fun fuel parents => CleanParents program dispatcher parents (CheckpointRun.cumulativeLayers fuel))
    (CleanParents.root (program := program) (dispatcher := dispatcher))
    (laws.prelude program dispatcher (bit :: suffix))
    (by
      intro fuel sampleIndex parents completed clean indexEq
      exact bitcons_rawStageAt laws program dispatcher bit suffix fuel sampleIndex parents clean indexEq)
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
    selector program dispatcher (system.contractionRun index).cursor.erase =
      some (system.contractionRun (index + 1)).cursor.erase := by
  obtain ⟨certificate⟩ := bitcons_certifiedPositiveStages laws program dispatcher bit suffix index
  have within : index < certificate.stages.configurations.length :=
    Nat.lt_of_succ_le (by simpa using certificate.stages.horizonLower)
  simpa only [Nat.zero_add] using SelectorChain.selects_contractionRun
    certificate.stages.chain certificate.selected (SchedulerRecurrence.initialGood program dispatcher (bit :: suffix))
    (base := 0) (offset := index) rfl within

end PureSFormal.Research.RootResetParametricNonemptyTraceAgreement
