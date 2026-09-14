import PureSFormal.Research.ProtectedTrieExecutableSchedule
import PureSFormal.Research.ProtectedTrieFairness
import PureSFormal.WeakPath.CheckpointTime

/-!
# An address-complete canonical path for protected tries

The complete finite prefix trees determine executable address blocks.  Their
concatenation is read one address at a time, producing an infinite sequence in
which every adjacent pair is one pure-`S` contraction.  Cumulative block
lengths are exact macro-boundary indices.  Address completeness here is the
literal protected-address condition `StructurallyFair`; it is not a claim
about residual-redex fairness.
-/

namespace PureSFormal.Research.ProtectedTrieFairStream

open PureSFormal.PureS
open PureSFormal.Research.ProtectedTrieBuild
open PureSFormal.Research.ProtectedTrieAlgebra
open PureSFormal.Research.ProtectedTrieCertificates
open PureSFormal.Research.ProtectedTrieEnumeration
open PureSFormal.Research.ProtectedTrieExecutableSchedule
open PureSFormal.Research.ProtectedTrieFairness
open PureSFormal.Research.ProtectedTrieLabelledObserver
open PureSFormal.Research.ProtectedTrieMachine
open PureSFormal.Research.ProtectedTrieMachineCode
open PureSFormal.Research.ProtectedTrieMonotoneBuild
open PureSFormal.Research.ProtectedTriePrefixBuild
open PureSFormal.Research.ProtectedTrieSeed
open PureSFormal.Research.ProtectedTrieSingleOpening
open PureSFormal.Research.ProtectedTrieStrong
open PureSFormal.Research.ProtectedTrieSubdivision
open PureSFormal.Research.ProtectedTrieTableau

namespace PrefixTree

/-- Enumerated paths are closed under taking literal prefixes. -/
theorem mem_paths_of_prefix {small large : BitWord} {tree : PrefixTree}
    (hlarge : List.Mem large tree.paths) (hprefix : WordPrefix small large) :
    List.Mem small tree.paths := by
  induction hprefix generalizing tree with
  | nil large =>
      cases tree with
      | empty => cases hlarge
      | node left right => exact nil_mem_paths_node left right
  | cons bit htail ih =>
      cases tree with
      | empty => cases hlarge
      | node left right =>
          cases bit with
          | false =>
              apply (false_cons_mem_paths_node_iff _ left right).mpr
              apply ih
              exact (false_cons_mem_paths_node_iff _ left right).mp hlarge
          | true =>
              apply (true_cons_mem_paths_node_iff _ left right).mpr
              apply ih
              exact (true_cons_mem_paths_node_iff _ left right).mp hlarge

/-- Structural inclusion of finite prefix trees is antisymmetric. -/
theorem le_antisymm {first second : PrefixTree}
    (hforward :
      PureSFormal.Research.ProtectedTrieMonotoneBuild.PrefixTree.LE first second)
    (hbackward :
      PureSFormal.Research.ProtectedTrieMonotoneBuild.PrefixTree.LE second first) :
    first = second := by
  induction hforward with
  | empty second =>
      cases hbackward with
      | empty => rfl
  | @node left₁ right₁ left₂ right₂ hleft hright ihLeft ihRight =>
      cases hbackward with
      | node hleftBack hrightBack =>
          have hleftEq := ihLeft hleftBack
          have hrightEq := ihRight hrightBack
          cases hleftEq
          cases hrightEq
          rfl

end PrefixTree

/-- Inserting the next complete tree's paths into the current complete tree
produces exactly the next complete tree. -/
theorem insertPaths_completeTree (depth : Nat) :
    insertPaths (completeTree (depth + 1)).paths (completeTree depth) =
      completeTree (depth + 1) := by
  apply PrefixTree.le_antisymm
  · apply PrefixTree.le_of_paths_subset
    intro path hpath
    rcases (mem_paths_insertPaths_iff
      (completeTree (depth + 1)).paths (completeTree depth) path).mp hpath with
      hold | ⟨endpoint, hendpoint, hprefix⟩
    · exact PrefixTree.mem_paths_of_le (completeTree_le_succ depth) path hold
    · exact PrefixTree.mem_paths_of_prefix hendpoint hprefix
  · apply PrefixTree.le_of_paths_subset
    intro path hpath
    apply (mem_paths_insertPaths_iff
      (completeTree (depth + 1)).paths (completeTree depth) path).mpr
    exact Or.inr ⟨path, hpath, WordPrefix.refl path⟩

/-- Root-relative contractions connecting two consecutive complete-tree
macro boundaries. -/
def blockSchedule (depth : Nat) : List Address :=
  insertPathsSchedule ProtectedFieldContext.hole (phaseAt 0)
    (completeTree (depth + 1)).paths (completeTree depth)

/-- Every compiled block replays to its exact next macro boundary. -/
theorem replay_blockSchedule (bits : BitWord) (depth : Nat) :
    replayAddresses (fairMacroTerm bits depth) (blockSchedule depth) =
      some (fairMacroTerm bits (depth + 1)) := by
  have hreplay := replay_insertPathsSchedule bits
    ProtectedFieldContext.hole (phaseAt 0) (goodPhase_phaseAt 0)
    (completeTree (depth + 1)).paths (completeTree depth)
  simpa [blockSchedule, fairMacroTerm, seededBuild, buildAt,
    seededFieldTerm, ProtectedFieldContext.plug,
    insertPaths_completeTree depth] using hreplay

/-- Membership in a complete tree forces the corresponding depth bound. -/
theorem length_lt_of_mem_completeTree
    (address : BitWord) {depth : Nat}
    (hmem : List.Mem address (completeTree depth).paths) :
    address.length < depth := by
  induction depth generalizing address with
  | zero => cases hmem
  | succ depth ih =>
      cases address with
      | nil => simp
      | cons bit rest =>
          cases bit with
          | false =>
              have hrest :=
                (false_cons_mem_paths_node_iff rest
                  (completeTree depth) (completeTree depth)).mp hmem
              have hlt := ih rest hrest
              simpa using Nat.succ_lt_succ hlt
          | true =>
              have hrest :=
                (true_cons_mem_paths_node_iff rest
                  (completeTree depth) (completeTree depth)).mp hmem
              have hlt := ih rest hrest
              simpa using Nat.succ_lt_succ hlt

/-- Consecutive complete-tree macro terms are distinct. -/
theorem fairMacroTerm_ne_succ (bits : BitWord) (depth : Nat) :
    fairMacroTerm bits depth ≠ fairMacroTerm bits (depth + 1) := by
  intro heq
  let address : BitWord := List.replicate depth false
  have htarget :
      List.Mem address (anchoredOpenedPaths
        (fairMacroTerm bits (depth + 1))) := by
    rw [fairMacroTerm, anchoredOpenedPaths_seededBuild]
    apply mem_completeTree_of_length_lt
    simp [address]
  have hsource :
      List.Mem address (anchoredOpenedPaths (fairMacroTerm bits depth)) := by
    rw [heq]
    exact htarget
  rw [fairMacroTerm, anchoredOpenedPaths_seededBuild] at hsource
  have hlt := length_lt_of_mem_completeTree address hsource
  simp [address] at hlt

/-- Every finite macro block contains at least one contraction. -/
theorem blockSchedule_nonempty (depth : Nat) : blockSchedule depth ≠ [] := by
  intro hempty
  have hreplay := replay_blockSchedule ([] : BitWord) depth
  rw [hempty] at hreplay
  exact fairMacroTerm_ne_succ ([] : BitWord) depth (by
    simpa [replayAddresses] using Option.some.inj hreplay)

/-- The contraction gap of one macro block. -/
def blockLength (depth : Nat) : Nat := (blockSchedule depth).length

/-- Every macro gap is positive. -/
theorem blockLength_pos (depth : Nat) : 0 < blockLength depth := by
  exact List.length_pos_iff.mpr (blockSchedule_nonempty depth)

/-- Concatenation of the first `depth` executable macro blocks. -/
def scheduleThrough : Nat → List Address
  | 0 => []
  | depth + 1 => scheduleThrough depth ++ blockSchedule depth

/-- Cumulative contraction time of a complete-tree boundary. -/
def checkpointTime : Nat → Nat :=
  PureSFormal.WeakPath.cumulativeTime blockLength

@[simp]
theorem checkpointTime_zero : checkpointTime 0 = 0 := rfl

@[simp]
theorem checkpointTime_succ (depth : Nat) :
    checkpointTime (depth + 1) = checkpointTime depth + blockLength depth :=
  rfl

/-- Cumulative time is exactly the length of the concatenated address prefix. -/
theorem checkpointTime_eq_scheduleThrough_length (depth : Nat) :
    checkpointTime depth = (scheduleThrough depth).length := by
  induction depth with
  | zero => rfl
  | succ depth ih =>
      change PureSFormal.WeakPath.cumulativeTime blockLength depth =
        (scheduleThrough depth).length at ih
      change PureSFormal.WeakPath.cumulativeTime blockLength (depth + 1) =
        (scheduleThrough (depth + 1)).length
      rw [PureSFormal.WeakPath.cumulativeTime_succ, scheduleThrough,
        List.length_append, ih]
      rfl

/-- Macro checkpoint times are strictly increasing. -/
theorem checkpointTime_strictlyIncreasing :
    PureSFormal.WeakPath.StrictlyIncreasing checkpointTime := by
  exact PureSFormal.WeakPath.cumulativeTime_strictlyIncreasing
    blockLength blockLength_pos

/-- The first `depth` blocks replay to the declared macro boundary. -/
theorem replay_scheduleThrough (bits : BitWord) (depth : Nat) :
    replayAddresses (encoder bits) (scheduleThrough depth) =
      some (fairMacroTerm bits depth) := by
  induction depth with
  | zero => simp [scheduleThrough, fairMacroTerm_zero]
  | succ depth ih =>
      rw [scheduleThrough, replayAddresses_append, ih]
      exact replay_blockSchedule bits depth

/-- Earlier concatenated schedules are literal prefixes of later ones. -/
theorem scheduleThrough_prefix {first second : Nat} (hle : first ≤ second) :
    ∃ suffix, scheduleThrough second = scheduleThrough first ++ suffix := by
  obtain ⟨distance, rfl⟩ := Nat.exists_eq_add_of_le hle
  clear hle
  induction distance with
  | zero => exact ⟨[], by simp⟩
  | succ distance ih =>
      obtain ⟨suffix, hsuffix⟩ := ih
      refine ⟨suffix ++ blockSchedule (first + distance), ?_⟩
      rw [show first + (distance + 1) = (first + distance) + 1 by
          exact (Nat.add_assoc first distance 1).symm,
        scheduleThrough, hsuffix, List.append_assoc]

/-- The number of completed blocks never exceeds their contraction count. -/
theorem depth_le_checkpointTime (depth : Nat) : depth ≤ checkpointTime depth := by
  induction depth with
  | zero => simp
  | succ depth ih =>
      rw [checkpointTime_succ]
      have hpositive := blockLength_pos depth
      exact Nat.add_le_add ih hpositive

/-- Taking no more than the left list's length ignores an appended suffix. -/
theorem take_append_of_le_length
    {α : Type} (left right : List α) (count : Nat)
    (hle : count ≤ left.length) :
    (left ++ right).take count = left.take count := by
  induction left generalizing count with
  | nil =>
      cases count with
      | zero => rfl
      | succ count => cases hle
  | cons head tail ih =>
      cases count with
      | zero => rfl
      | succ count =>
          simp only [List.length_cons, Nat.succ_le_succ_iff] at hle
          change head :: (tail ++ right).take count = head :: tail.take count
          exact congrArg (List.cons head) (ih count hle)

/-- A finite prefix of the infinite concatenated address schedule. -/
def addressPrefix (ticks : Nat) : List Address :=
  (scheduleThrough (ticks + 1)).take ticks

/-- Exact checkpoint prefixes coincide with the complete finite block prefix. -/
theorem addressPrefix_checkpointTime (depth : Nat) :
    addressPrefix (checkpointTime depth) = scheduleThrough depth := by
  have hle : depth ≤ checkpointTime depth + 1 :=
    Nat.le_trans (depth_le_checkpointTime depth) (Nat.le_succ _)
  obtain ⟨suffix, hsuffix⟩ := scheduleThrough_prefix hle
  unfold addressPrefix
  rw [hsuffix, checkpointTime_eq_scheduleThrough_length]
  simp

/-- Every finite address prefix is executable. -/
theorem replayAddresses_take_exists
    {source target : Term} {schedule : List Address}
    (hreplay : replayAddresses source schedule = some target) (count : Nat) :
    ∃ middle, replayAddresses source (schedule.take count) = some middle := by
  induction schedule generalizing source count with
  | nil => exact ⟨source, by simp [replayAddresses]⟩
  | cons address rest ih =>
      cases count with
      | zero => exact ⟨source, by simp [replayAddresses]⟩
      | succ count =>
          cases hstep : source.contractAt? address with
          | none => simp [replayAddresses, hstep] at hreplay
          | some next =>
              have htail : replayAddresses next rest = some target := by
                simpa [replayAddresses, hstep] using hreplay
              obtain ⟨middle, hmiddle⟩ := ih htail count
              exact ⟨middle, by simpa [replayAddresses, hstep] using hmiddle⟩

/-- Every chosen infinite-schedule prefix has a unique executable endpoint. -/
theorem replay_addressPrefix_exists (bits : BitWord) (ticks : Nat) :
    ∃ term, replayAddresses (encoder bits) (addressPrefix ticks) = some term := by
  exact replayAddresses_take_exists
    (replay_scheduleThrough bits (ticks + 1)) ticks

/-- Bare term after exactly `ticks` contractions of the flattened schedule. -/
def termAt (bits : BitWord) (ticks : Nat) : Term :=
  (replayAddresses (encoder bits) (addressPrefix ticks)).getD (encoder bits)

/-- The executable prefix returns the definitionally selected stream term. -/
theorem replay_addressPrefix (bits : BitWord) (ticks : Nat) :
    replayAddresses (encoder bits) (addressPrefix ticks) =
      some (termAt bits ticks) := by
  obtain ⟨term, hterm⟩ := replay_addressPrefix_exists bits ticks
  simp [termAt, hterm]

/-- A successful singleton replay is exactly one contextual contraction. -/
theorem replayAddresses_singleton_step
    {source target : Term} {address : Address}
    (hreplay : replayAddresses source [address] = some target) :
    Step source target := by
  change (do
    let next ← source.contractAt? address
    some next) = some target at hreplay
  cases hstep : source.contractAt? address with
  | none =>
      rw [hstep] at hreplay
      contradiction
  | some next =>
      rw [hstep] at hreplay
      have hnext : next = target := Option.some.inj hreplay
      cases hnext
      exact Term.contractAt?_sound hstep

@[simp]
theorem termAt_zero (bits : BitWord) : termAt bits 0 = encoder bits := by
  simp [termAt, addressPrefix, scheduleThrough, replayAddresses]

/-- Successive finite prefixes differ by exactly one compiled address. -/
theorem addressPrefix_succ (ticks : Nat) :
    ∃ address, addressPrefix (ticks + 1) =
      addressPrefix ticks ++ [address] := by
  have hsmall : ticks ≤ (scheduleThrough (ticks + 1)).length := by
    have hdepth := depth_le_checkpointTime (ticks + 1)
    rw [checkpointTime_eq_scheduleThrough_length] at hdepth
    exact Nat.le_trans (Nat.le_succ ticks) hdepth
  have hlarge : ticks < (scheduleThrough (ticks + 2)).length := by
    have hdepth := depth_le_checkpointTime (ticks + 2)
    rw [checkpointTime_eq_scheduleThrough_length] at hdepth
    have hlt : ticks < ticks + 2 := by
      exact Nat.lt_trans (Nat.lt_succ_self ticks)
        (Nat.lt_succ_self (ticks + 1))
    exact Nat.lt_of_lt_of_le hlt hdepth
  let address : Address := (scheduleThrough (ticks + 2))[ticks]
  refine ⟨address, ?_⟩
  unfold addressPrefix
  change (scheduleThrough (ticks + 2)).take (ticks + 1) =
    (scheduleThrough (ticks + 1)).take ticks ++ [address]
  rw [List.take_succ]
  have hget : (scheduleThrough (ticks + 2))[ticks]? = some address :=
    List.getElem?_eq_getElem hlarge
  rw [hget]
  simp only [Option.toList_some]
  rw [show ticks + 2 = (ticks + 1) + 1 by rfl, scheduleThrough,
    take_append_of_le_length _ _ _ hsmall]

/-- Every adjacent pair of flattened terms is one genuine pure-`S` step. -/
theorem termAt_step (bits : BitWord) (ticks : Nat) :
    Step (termAt bits ticks) (termAt bits (ticks + 1)) := by
  obtain ⟨address, hprefix⟩ := addressPrefix_succ ticks
  have hbefore := replay_addressPrefix bits ticks
  have hafter := replay_addressPrefix bits (ticks + 1)
  rw [hprefix, replayAddresses_append, hbefore] at hafter
  exact replayAddresses_singleton_step hafter

/-- Every declared cumulative time lands on its exact complete-tree boundary. -/
theorem termAt_checkpointTime (bits : BitWord) (depth : Nat) :
    termAt bits (checkpointTime depth) = fairMacroTerm bits depth := by
  unfold termAt
  rw [addressPrefix_checkpointTime, replay_scheduleThrough]
  rfl

/-- The flattened terms form an infinite contraction path from any encoded
bit word. -/
def reductionPath (bits : BitWord) : PureSFormal.WeakPath.ReductionPath where
  term := termAt bits
  contracts := termAt_step bits

/-- The source-indexed flattened path begins at the protected-trie encoder. -/
def encoderReductionPath (source : Instance) : EncoderReductionPath source where
  term := termAt (encodeInstance source)
  startsAt := by simp [strongEncoder]
  contracts := termAt_step (encodeInstance source)

/-- Every finite protected address occurs at an explicit macro checkpoint. -/
theorem protectedAddress_at_checkpoint (bits address : BitWord) :
    List.Mem address
      (anchoredOpenedPaths
        (termAt bits (checkpointTime (address.length + 1)))) := by
  rw [termAt_checkpointTime, fairMacroTerm,
    anchoredOpenedPaths_seededBuild]
  exact mem_completeTree_of_length_lt address (Nat.lt_succ_self _)

/-- The adjacent-step stream is structurally fair. -/
theorem termAt_structurallyFair (bits : BitWord) :
    StructurallyFair (termAt bits) := by
  intro address
  exact ⟨checkpointTime (address.length + 1),
    protectedAddress_at_checkpoint bits address⟩

/-- The canonical adjacent-step path together with its exact cumulative
boundaries and explicit protected-address coverage. -/
structure AddressCompleteCanonicalPath (bits : BitWord) where
  term : Nat → Term
  checkpoint : Nat → Nat
  startsAt : term 0 = encoder bits
  contracts : ∀ ticks, Step (term ticks) (term (ticks + 1))
  checkpointStrict : PureSFormal.WeakPath.StrictlyIncreasing checkpoint
  macroBoundary : ∀ depth,
    term (checkpoint depth) = fairMacroTerm bits depth
  opensAddress : ∀ address,
    List.Mem address
      (anchoredOpenedPaths (term (checkpoint (address.length + 1))))

/-- Explicit address-complete canonical path generated by the finite blocks. -/
def addressCompleteCanonicalPath (bits : BitWord) :
    AddressCompleteCanonicalPath bits where
  term := termAt bits
  checkpoint := checkpointTime
  startsAt := termAt_zero bits
  contracts := termAt_step bits
  checkpointStrict := checkpointTime_strictlyIncreasing
  macroBoundary := termAt_checkpointTime bits
  opensAddress := protectedAddress_at_checkpoint bits

/-- Every valid history eventually belongs to the semantic projection of the
adjacent-step stream. -/
theorem termAt_eventually_strongProjection
    (source : Instance) (history : BitWord)
    (hvalid : ValidHistory source history) :
    ∃ ticks, (strongProjection
      (termAt (encodeInstance source) ticks)).Contains history := by
  exact fair_path_eventually_strongProjection source
    (encoderReductionPath source)
    (termAt_structurallyFair (encodeInstance source)) history hvalid

/-- Every valid history eventually has its own literal labelled record on the
adjacent-step stream. -/
theorem termAt_eventually_labelledProjection
    (source : Instance) (history : BitWord)
    (hvalid : ValidHistory source history) :
    ∃ ticks entry,
      List.Mem entry
        (labelledProjection (termAt (encodeInstance source) ticks)) ∧
      entry.history = history := by
  exact fair_path_eventually_labelledProjection source
    (encoderReductionPath source)
    (termAt_structurallyFair (encodeInstance source)) history hvalid

/-- Every valid history has a literal labelled record at a declared macro
checkpoint. -/
theorem termAt_checkpoint_eventually_labelled
    (source : Instance) (history : BitWord)
    (hvalid : ValidHistory source history) :
    ∃ depth entry,
      List.Mem entry
        (labelledProjection
          (termAt (encodeInstance source) (checkpointTime depth))) ∧
      entry.history = history := by
  obtain ⟨depth, entry, hmem, hhistory⟩ :=
    fairMacroTerm_eventually_labelled source history hvalid
  refine ⟨depth, entry, ?_, hhistory⟩
  simpa [termAt_checkpointTime] using hmem

end PureSFormal.Research.ProtectedTrieFairStream
