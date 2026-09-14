import PureSFormal.Research.ProtectedTrieExecutableSchedule
import PureSFormal.Research.ProtectedTrieConfigurationQuotient

/-!
# Equal-successor executable schedule fixture

The two ordered occurrences of the concrete quotient fixture reach the same
source-machine row.  This module instantiates the root-relative pure-`S`
address compiler for both occurrence bits and proves exact replay to two
distinct history checkpoints.
-/

namespace PureSFormal.Research.ProtectedTrieExecutableScheduleFixture

open PureSFormal.PureS
open PureSFormal.Research.ProtectedTrieConfigurationQuotient
open PureSFormal.Research.ProtectedTrieExecutableSchedule
open PureSFormal.Research.ProtectedTrieLabelSemantics
open PureSFormal.Research.ProtectedTrieMachineCode
open PureSFormal.Research.ProtectedTrieStrong
open PureSFormal.Research.ProtectedTrieSubdivision
open PureSFormal.Research.ProtectedTrieTableau

/-- Concrete root-to-slot-zero address program. -/
def equalSuccessorZeroSchedule : List Address :=
  subdivisionEdgeSchedule sourceWitness
    (encodeInstance equalSuccessorFixtureSource) [] false

/-- Concrete root-to-slot-one address program. -/
def equalSuccessorOneSchedule : List Address :=
  subdivisionEdgeSchedule sourceWitness
    (encodeInstance equalSuccessorFixtureSource) [] true

/-- The fixture root history is source-valid. -/
theorem equalSuccessorFixture_root_valid :
    SourceValid (encodeInstance equalSuccessorFixtureSource) [] := by
  rw [sourceValid_encoded_iff]
  exact ⟨equalSuccessorFixtureRow, rfl⟩

/-- The fixture's slot-zero history is source-valid. -/
theorem equalSuccessorFixture_zero_valid :
    SourceValid (encodeInstance equalSuccessorFixtureSource) [false] := by
  rw [sourceValid_encoded_iff]
  exact ⟨equalSuccessorFixtureSuccessorRow, by
    simpa [sourceFinalRow?] using equalSuccessorFixture_finalRow_zero⟩

/-- The fixture's slot-one history is source-valid. -/
theorem equalSuccessorFixture_one_valid :
    SourceValid (encodeInstance equalSuccessorFixtureSource) [true] := by
  rw [sourceValid_encoded_iff]
  exact ⟨equalSuccessorFixtureSuccessorRow, by
    simpa [sourceFinalRow?] using equalSuccessorFixture_finalRow_one⟩

/-- Slot zero has a nonempty executable schedule with the exact endpoint. -/
theorem equalSuccessorZeroSchedule_exact :
    equalSuccessorZeroSchedule ≠ [] /\
    replayAddresses
        (subdivisionCheckpoint sourceWitness
          (encodeInstance equalSuccessorFixtureSource) [])
        equalSuccessorZeroSchedule =
      some (subdivisionCheckpoint sourceWitness
        (encodeInstance equalSuccessorFixtureSource) [false]) := by
  refine ⟨?_, ?_⟩
  · exact subdivisionEdgeSchedule_nonempty sourceValid_prefixClosed
      sourceVerifier_complete _ _ _ equalSuccessorFixture_root_valid
        equalSuccessorFixture_zero_valid
  · exact replay_subdivisionEdgeSchedule sourceWitness
      (encodeInstance equalSuccessorFixtureSource) [] false

/-- Slot one has a nonempty executable schedule with the exact endpoint. -/
theorem equalSuccessorOneSchedule_exact :
    equalSuccessorOneSchedule ≠ [] /\
    replayAddresses
        (subdivisionCheckpoint sourceWitness
          (encodeInstance equalSuccessorFixtureSource) [])
        equalSuccessorOneSchedule =
      some (subdivisionCheckpoint sourceWitness
        (encodeInstance equalSuccessorFixtureSource) [true]) := by
  refine ⟨?_, ?_⟩
  · exact subdivisionEdgeSchedule_nonempty sourceValid_prefixClosed
      sourceVerifier_complete _ _ _ equalSuccessorFixture_root_valid
        equalSuccessorFixture_one_valid
  · exact replay_subdivisionEdgeSchedule sourceWitness
      (encodeInstance equalSuccessorFixtureSource) [] true

/-- Equal successor rows do not identify their protected history checkpoints. -/
theorem equalSuccessorFixture_checkpoints_distinct :
    subdivisionCheckpoint sourceWitness
        (encodeInstance equalSuccessorFixtureSource) [false] ≠
      subdivisionCheckpoint sourceWitness
        (encodeInstance equalSuccessorFixtureSource) [true] := by
  intro heq
  let family := protectedTrieHistoryEdgePathFamily sourceVerifier SourceValid
    sourceWitness sourceValid_prefixClosed sourceVerifier_complete
      (encodeInstance equalSuccessorFixtureSource)
  have hhist : [false] = [true] := by
    apply family.checkpoint_injective
      equalSuccessorFixture_zero_valid equalSuccessorFixture_one_valid
    simpa [family, protectedTrieHistoryEdgePathFamily] using heq
  exact equalSuccessorFixture_histories_distinct hhist

/--
The fixture simultaneously exhibits one merged ordinary configuration and two
distinct executable pure-`S` history endpoints.
-/
theorem equalSuccessorExecutableMultiplicity :
    (exists target : ReachableConfiguration equalSuccessorFixtureSource,
      exists zeroEdge oneEdge :
          ReachableConfigurationOccurrenceEdge equalSuccessorFixtureSource,
        zeroEdge.targetPoint = target /\ oneEdge.targetPoint = target /\
        zeroEdge.slot = false /\ oneEdge.slot = true /\ zeroEdge ≠ oneEdge) /\
    equalSuccessorZeroSchedule ≠ [] /\
    equalSuccessorOneSchedule ≠ [] /\
    subdivisionCheckpoint sourceWitness
        (encodeInstance equalSuccessorFixtureSource) [false] ≠
      subdivisionCheckpoint sourceWitness
        (encodeInstance equalSuccessorFixtureSource) [true] := by
  refine ⟨?_, equalSuccessorZeroSchedule_exact.1,
    equalSuccessorOneSchedule_exact.1,
    equalSuccessorFixture_checkpoints_distinct⟩
  obtain ⟨target, zeroEdge, oneEdge, hzeroSource, honeSource,
      hzeroTarget, honeTarget, hzeroSlot, honeSlot, hne⟩ :=
    equalSuccessorFixture_preserves_two_edges
  exact ⟨target, zeroEdge, oneEdge, hzeroTarget, honeTarget,
    hzeroSlot, honeSlot, hne⟩

end PureSFormal.Research.ProtectedTrieExecutableScheduleFixture
