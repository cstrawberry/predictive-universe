import PureSFormal.Research.ProtectedTriePrefixBuild

/-!
# Coherent canonical builds under finite trie inclusion

Exact range alone gives a separately reachable canonical term for each finite
prefix tree.  A persistent source macrostep needs more: when one finite path
set is included in another, the first canonical term must reduce directly to
the second.  This module supplies that coherence theorem.

`PrefixTree.LE` is the structural inclusion order.  It is equivalent to
pointwise inclusion of the enumerated literal paths.  Canonical `buildFrom`
terms are monotone for this order, hence so are the concrete frozen-seed
`seededPrefixBuild` representatives of finitely generated prefix sets.
-/

namespace PureSFormal.Research.ProtectedTrieMonotoneBuild

open PureSFormal.PureS
open PureSFormal.Research.ProtectedTrieAlgebra
open PureSFormal.Research.ProtectedTrieBuild
open PureSFormal.Research.ProtectedTrieCertificates
open PureSFormal.Research.ProtectedTrieFinitePrefix
open PureSFormal.Research.ProtectedTrieParser
open PureSFormal.Research.ProtectedTriePrefixBuild
open PureSFormal.Research.ProtectedTrieSeed

namespace PrefixTree

/-- Structural inclusion of finite binary prefix trees. -/
inductive LE : PrefixTree -> PrefixTree -> Prop where
  | empty (target : PrefixTree) : LE .empty target
  | node {left₁ right₁ left₂ right₂ : PrefixTree} :
      LE left₁ left₂ -> LE right₁ right₂ ->
      LE (.node left₁ right₁) (.node left₂ right₂)

/-- Structural inclusion is reflexive. -/
theorem le_refl (tree : PrefixTree) : LE tree tree := by
  induction tree with
  | empty => exact .empty .empty
  | node left right ihLeft ihRight => exact .node ihLeft ihRight

/-- Structural inclusion is transitive. -/
theorem le_trans {first second third : PrefixTree}
    (h₁₂ : LE first second) (h₂₃ : LE second third) : LE first third := by
  induction h₁₂ generalizing third with
  | empty => exact .empty third
  | node hleft hright ihLeft ihRight =>
      cases h₂₃ with
      | node hleft₂ hright₂ => exact .node (ihLeft hleft₂) (ihRight hright₂)

/-- Structural inclusion preserves every enumerated path. -/
theorem mem_paths_of_le {first second : PrefixTree} (hle : LE first second) :
    forall path, List.Mem path first.paths -> List.Mem path second.paths := by
  induction hle with
  | empty target =>
      intro path hmem
      cases hmem
  | @node left₁ right₁ left₂ right₂ hleft hright ihLeft ihRight =>
      intro path hmem
      cases path with
      | nil => exact nil_mem_paths_node left₂ right₂
      | cons bit rest =>
          cases bit with
          | false =>
              apply (false_cons_mem_paths_node_iff rest left₂ right₂).mpr
              apply ihLeft rest
              exact (false_cons_mem_paths_node_iff rest left₁ right₁).mp hmem
          | true =>
              apply (true_cons_mem_paths_node_iff rest left₂ right₂).mpr
              apply ihRight rest
              exact (true_cons_mem_paths_node_iff rest left₁ right₁).mp hmem

/-- Pointwise inclusion of path enumerations determines structural inclusion. -/
theorem le_of_paths_subset {first second : PrefixTree}
    (hsubset : forall path, List.Mem path first.paths ->
      List.Mem path second.paths) : LE first second := by
  induction first generalizing second with
  | empty => exact .empty second
  | node left₁ right₁ ihLeft ihRight =>
      cases second with
      | empty =>
          have hroot : List.Mem [] (PrefixTree.empty.paths) :=
            hsubset [] (nil_mem_paths_node left₁ right₁)
          cases hroot
      | node left₂ right₂ =>
          apply LE.node
          · apply ihLeft
            intro path hpath
            apply (false_cons_mem_paths_node_iff path left₂ right₂).mp
            apply hsubset (false :: path)
            exact (false_cons_mem_paths_node_iff path left₁ right₁).mpr hpath
          · apply ihRight
            intro path hpath
            apply (true_cons_mem_paths_node_iff path left₂ right₂).mp
            apply hsubset (true :: path)
            exact (true_cons_mem_paths_node_iff path left₁ right₁).mpr hpath

/-- Structural inclusion is exactly path-set inclusion. -/
theorem le_iff_paths_subset {first second : PrefixTree} :
    LE first second <->
      forall path, List.Mem path first.paths -> List.Mem path second.paths := by
  exact ⟨mem_paths_of_le, le_of_paths_subset⟩

end PrefixTree

/-! ## Reduction monotonicity -/

/-- Canonical phase-indexed builds reduce coherently along structural inclusion. -/
theorem buildFrom_steps_of_le {phase : Nat × Nat} (hgood : GoodPhase phase)
    {first second : PrefixTree} (hle : PrefixTree.LE first second) :
    Steps (buildFrom phase first) (buildFrom phase second) := by
  induction hle generalizing phase with
  | empty target =>
      simpa only [buildFrom] using phaseGenerator_steps_buildFrom hgood target
  | @node left₁ right₁ left₂ right₂ hleft hright ihLeft ihRight =>
      have hnext : GoodPhase (nextPhase phase) := hgood.next
      have leftSteps :
          Steps (buildFrom (nextPhase phase) left₁)
            (buildFrom (nextPhase phase) left₂) := ihLeft hnext
      have leftLift :
          Steps (buildFrom phase (.node left₁ right₁))
            (protectedNode
              (buildFrom (nextPhase phase) left₂)
              (buildFrom (nextPhase phase) right₁)
              (phaseJunk phase)) := by
        simpa only [buildFrom] using
          protectedNode_left_steps leftSteps
            (buildFrom (nextPhase phase) right₁) (phaseJunk phase)
      have rightSteps :
          Steps (buildFrom (nextPhase phase) right₁)
            (buildFrom (nextPhase phase) right₂) := ihRight hnext
      have rightLift :
          Steps
            (protectedNode
              (buildFrom (nextPhase phase) left₂)
              (buildFrom (nextPhase phase) right₁)
              (phaseJunk phase))
            (buildFrom phase (.node left₂ right₂)) := by
        simpa only [buildFrom] using
          protectedNode_right_steps
            (buildFrom (nextPhase phase) left₂) (phaseJunk phase) rightSteps
      exact Steps.trans leftLift rightLift

/-- Depth-indexed canonical builds are coherent under trie inclusion. -/
theorem buildAt_steps_of_le (depth : Nat) {first second : PrefixTree}
    (hle : PrefixTree.LE first second) :
    Steps (buildAt depth first) (buildAt depth second) :=
  buildFrom_steps_of_le (goodPhase_phaseAt depth) hle

/-- The concrete frozen-seed endpoints are coherent under trie inclusion. -/
theorem seededBuild_steps_of_le (bits : BitWord) {first second : PrefixTree}
    (hle : PrefixTree.LE first second) :
    Steps (seededBuild bits first) (seededBuild bits second) := by
  have hbody := buildAt_steps_of_le 0 hle
  simpa only [seededBuild, seededHeader, header, Context.plug] using!
    hbody.inContext (.appRight (.app .s (N bits)) .hole)

/-! ## Semantic inclusion for finitely generated prefix sets -/

/-- Semantic inclusion of finite prefix sets induces structural trie inclusion. -/
theorem treeOfPrefixSet_le {first second : FinitePrefixSet}
    (hsubset : forall path, first.Contains path -> second.Contains path) :
    PrefixTree.LE (treeOfPrefixSet first) (treeOfPrefixSet second) := by
  apply PrefixTree.le_of_paths_subset
  intro path hpath
  rw [treeOfPrefixSet, mem_paths_treeOfGenerators_iff] at hpath ⊢
  exact hsubset path hpath

/-- Canonical finite-prefix representatives reduce along semantic inclusion. -/
theorem seededPrefixBuild_steps_of_contains
    (bits : BitWord) {first second : FinitePrefixSet}
    (hsubset : forall path, first.Contains path -> second.Contains path) :
    Steps (seededPrefixBuild bits first) (seededPrefixBuild bits second) := by
  exact seededBuild_steps_of_le bits (treeOfPrefixSet_le hsubset)

end PureSFormal.Research.ProtectedTrieMonotoneBuild
