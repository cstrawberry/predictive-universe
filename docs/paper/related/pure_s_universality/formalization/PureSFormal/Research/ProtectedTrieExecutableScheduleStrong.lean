import PureSFormal.Research.ProtectedTrieExecutableSchedule
import PureSFormal.Research.ProtectedTrieLabelSemantics
import PureSFormal.Research.ProtectedTrieStrongTheorem

/-!
# Source-level executable schedules and nonvacuity

This module instantiates the root-relative address compiler with the concrete
ordered-binary machine verifier.  It packages the executable edge and branch
programs together with initial/root separation, checkpoint separation, and an
explicit literal schedule-size budget.
-/

namespace PureSFormal.Research.ProtectedTrieExecutableScheduleStrong

open PureSFormal.PureS
open PureSFormal.Research.ProtectedTrieCertificates
open PureSFormal.Research.ProtectedTrieExecutableSchedule
open PureSFormal.Research.ProtectedTrieLabelSemantics
open PureSFormal.Research.ProtectedTrieMachine
open PureSFormal.Research.ProtectedTrieMachineCode
open PureSFormal.Research.ProtectedTrieProjection
open PureSFormal.Research.ProtectedTrieStrong
open PureSFormal.Research.ProtectedTrieStrongTheorem
open PureSFormal.Research.ProtectedTrieSubdivision
open PureSFormal.Research.ProtectedTrieTableau

/-- Concrete computable address program for one ordered source occurrence. -/
def strongSourceEdgeSchedule (source : Instance) (history : BitWord)
    (bit : Bool) : List Address :=
  subdivisionEdgeSchedule sourceWitness (encodeInstance source) history bit

/-- Concrete concatenated program for a finite ordered source branch. -/
def strongFiniteBranchSchedule (source : Instance) (history branch : BitWord) :
    List Address :=
  finiteBranchSchedule sourceWitness (encodeInstance source) history branch

/-- Exact replay of the concrete source-edge address program. -/
theorem strongSourceEdgeSchedule_replay (source : Instance)
    (history : BitWord) (bit : Bool) :
    replayAddresses
        (subdivisionCheckpoint sourceWitness (encodeInstance source) history)
        (strongSourceEdgeSchedule source history bit) =
      some (subdivisionCheckpoint sourceWitness (encodeInstance source)
        (history ++ [bit])) := by
  exact replay_subdivisionEdgeSchedule sourceWitness
    (encodeInstance source) history bit

/-- A valid concrete occurrence has a nonempty executable address program. -/
theorem strongSourceEdgeSchedule_nonempty (source : Instance)
    (history : BitWord) (bit : Bool)
    (hsource : ValidHistory source history)
    (htarget : ValidHistory source (history ++ [bit])) :
    strongSourceEdgeSchedule source history bit ≠ [] := by
  apply subdivisionEdgeSchedule_nonempty sourceValid_prefixClosed
    sourceVerifier_complete (encodeInstance source) history bit
  · simpa using hsource
  · simpa using htarget

/-- A valid occurrence reaches a checkpoint different from its source. -/
theorem strongSourceEdgeCheckpoints_distinct (source : Instance)
    (history : BitWord) (bit : Bool)
    (hsource : ValidHistory source history)
    (htarget : ValidHistory source (history ++ [bit])) :
    subdivisionCheckpoint sourceWitness (encodeInstance source) history ≠
      subdivisionCheckpoint sourceWitness (encodeInstance source)
        (history ++ [bit]) := by
  intro heq
  have hsource' : SourceValid (encodeInstance source) history := by
    simpa using hsource
  have htarget' : SourceValid (encodeInstance source) (history ++ [bit]) := by
    simpa using htarget
  have hhistory := (strong_simple_directed_subdivision source).1
    hsource' htarget' heq
  have hsuffix : [bit] = [] :=
    (List.append_right_eq_self).mp hhistory.symm
  exact List.cons_ne_nil bit [] hsuffix

/-- The concrete edge compiler inherits the literal endpoint-length budget. -/
theorem strongSourceEdgeSchedule_length_le (source : Instance)
    (history : BitWord) (bit : Bool) :
    (strongSourceEdgeSchedule source history bit).length <=
      insertionScheduleBound
        (subdivisionGeneratorBlock sourceWitness (encodeInstance source)
          (history ++ [bit])) :=
  subdivisionEdgeSchedule_length_le sourceWitness
    (encodeInstance source) history bit

/-- Exact executable data and event timing for every valid concrete edge. -/
theorem strongSourceEdgeSchedule_executable_certificate (source : Instance)
    (history : BitWord) (bit : Bool)
    (hsource : ValidHistory source history)
    (htarget : ValidHistory source (history ++ [bit])) :
    ExecutableEdgeCertificate sourceVerifier sourceWitness
      (encodeInstance source) history bit := by
  apply subdivisionEdgeSchedule_executable_certificate
    sourceValid_prefixClosed sourceVerifier_complete
  · simpa using hsource
  · simpa using htarget

/-- Exact replay of every finite concatenated branch program. -/
theorem strongFiniteBranchSchedule_replay (source : Instance)
    (history branch : BitWord) :
    replayAddresses
        (subdivisionCheckpoint sourceWitness (encodeInstance source) history)
        (strongFiniteBranchSchedule source history branch) =
      some (subdivisionCheckpoint sourceWitness (encodeInstance source)
        (history ++ branch)) :=
  replay_finiteBranchSchedule sourceWitness
    (encodeInstance source) history branch

/-- Every finite concatenated branch program is a genuine pure-`S` reduction. -/
theorem strongFiniteBranchSchedule_steps (source : Instance)
    (history branch : BitWord) :
    Steps
      (subdivisionCheckpoint sourceWitness (encodeInstance source) history)
      (subdivisionCheckpoint sourceWitness (encodeInstance source)
        (history ++ branch)) :=
  finiteBranchSchedule_steps sourceWitness
    (encodeInstance source) history branch

/-- The literal prefix at index `count` contains exactly `count` choices. -/
theorem streamPrefix_length (branch : Nat -> Bool) (count : Nat) :
    (streamPrefix branch count).length = count := by
  induction count with
  | zero => rfl
  | succ count ih => simp [streamPrefix, ih]

/-- Distinct indices give distinct literal prefixes of one choice stream. -/
theorem streamPrefix_injective (branch : Nat -> Bool) :
    forall {left right}, streamPrefix branch left = streamPrefix branch right ->
      left = right := by
  intro left right heq
  have hlength := congrArg List.length heq
  simpa [streamPrefix_length] using hlength

/-- Every checkpoint on an infinite valid branch is encoder-reachable. -/
theorem infiniteValidBranch_checkpoint_reachable (source : Instance)
    (branch : Nat -> Bool) (hbranch : InfiniteValidBranch source branch)
    (count : Nat) :
    Steps (strongEncoder source)
      (subdivisionCheckpoint sourceWitness (encodeInstance source)
        (streamPrefix branch count)) :=
  strong_subdivisionCheckpoint_reachable source
    (streamPrefix branch count) (hbranch count)

/-- Infinite valid branches yield pairwise distinct concrete checkpoints. -/
theorem infiniteValidBranch_checkpoints_pairwise_distinct (source : Instance)
    (branch : Nat -> Bool) (hbranch : InfiniteValidBranch source branch) :
    forall left right, left ≠ right ->
      subdivisionCheckpoint sourceWitness (encodeInstance source)
          (streamPrefix branch left) ≠
        subdivisionCheckpoint sourceWitness (encodeInstance source)
          (streamPrefix branch right) := by
  intro left right hne heq
  have hleft : SourceValid (encodeInstance source)
      (streamPrefix branch left) := by
    simpa using hbranch left
  have hright : SourceValid (encodeInstance source)
      (streamPrefix branch right) := by
    simpa using hbranch right
  have hpref := (strong_simple_directed_subdivision source).1
    hleft hright heq
  exact hne (streamPrefix_injective branch hpref)

/--
Named aggregate excluding the vacuous cases: the initial term exposes no
history; a reachable root checkpoint exposes the root; each valid source edge
has a nonempty bounded address program with a distinct endpoint; finite branch
programs concatenate exactly; and an infinite valid branch yields pairwise
distinct reachable checkpoints.
-/
structure NonvacuityCertificate (source : Instance) : Prop where
  initialProjectionEmpty : forall history,
    Not ((strongProjection (strongEncoder source)).Contains history)

  rootCheckpointReachable :
    Steps (strongEncoder source)
      (subdivisionCheckpoint sourceWitness (encodeInstance source) [])

  rootCheckpointContainsRoot :
    (strongProjection
      (subdivisionCheckpoint sourceWitness (encodeInstance source) [])
    ).Contains []

  edgeScheduleExact : forall (history : BitWord) (bit : Bool),
    ValidHistory source history ->
    ValidHistory source (history ++ [bit]) ->
      strongSourceEdgeSchedule source history bit ≠ [] /\
      replayAddresses
          (subdivisionCheckpoint sourceWitness (encodeInstance source) history)
          (strongSourceEdgeSchedule source history bit) =
        some (subdivisionCheckpoint sourceWitness (encodeInstance source)
          (history ++ [bit])) /\
      subdivisionCheckpoint sourceWitness (encodeInstance source) history ≠
        subdivisionCheckpoint sourceWitness (encodeInstance source)
          (history ++ [bit])

  edgeScheduleBound : forall (history : BitWord) (bit : Bool),
    (strongSourceEdgeSchedule source history bit).length <=
      insertionScheduleBound
        (subdivisionGeneratorBlock sourceWitness (encodeInstance source)
          (history ++ [bit]))

  edgeExecutableCertificate : forall (history : BitWord) (bit : Bool),
    ValidHistory source history ->
    ValidHistory source (history ++ [bit]) ->
      ExecutableEdgeCertificate sourceVerifier sourceWitness
        (encodeInstance source) history bit

  finiteBranchConcatenation : forall (history branch : BitWord),
    replayAddresses
        (subdivisionCheckpoint sourceWitness (encodeInstance source) history)
        (strongFiniteBranchSchedule source history branch) =
      some (subdivisionCheckpoint sourceWitness (encodeInstance source)
        (history ++ branch))

  infiniteBranchCheckpoints : forall (branch : Nat -> Bool),
    InfiniteValidBranch source branch ->
      (forall count,
        Steps (strongEncoder source)
          (subdivisionCheckpoint sourceWitness (encodeInstance source)
            (streamPrefix branch count))) /\
      forall left right, left ≠ right ->
        subdivisionCheckpoint sourceWitness (encodeInstance source)
            (streamPrefix branch left) ≠
          subdivisionCheckpoint sourceWitness (encodeInstance source)
            (streamPrefix branch right)

/-- Every concrete source instance satisfies the executable nonvacuity contract. -/
theorem strongExecutableNonvacuity (source : Instance) :
    NonvacuityCertificate source := by
  have hroot := rootCheckpoint_reachable_exact source
  refine {
    initialProjectionEmpty := strongEncoder_initialIdeal_empty source
    rootCheckpointReachable := hroot.1
    rootCheckpointContainsRoot := ?_
    edgeScheduleExact := ?_
    edgeScheduleBound := strongSourceEdgeSchedule_length_le source
    edgeExecutableCertificate :=
      strongSourceEdgeSchedule_executable_certificate source
    finiteBranchConcatenation := strongFiniteBranchSchedule_replay source
    infiniteBranchCheckpoints := ?_
  }
  · exact (hroot.2 []).mpr
      ((branchIdeal_contains_iff [] []).mpr (WordPrefix.refl []))
  · intro history bit hsource htarget
    exact ⟨strongSourceEdgeSchedule_nonempty source history bit hsource htarget,
      strongSourceEdgeSchedule_replay source history bit,
      strongSourceEdgeCheckpoints_distinct source history bit hsource htarget⟩
  · intro branch hbranch
    exact ⟨infiniteValidBranch_checkpoint_reachable source branch hbranch,
      infiniteValidBranch_checkpoints_pairwise_distinct source branch hbranch⟩

end PureSFormal.Research.ProtectedTrieExecutableScheduleStrong
