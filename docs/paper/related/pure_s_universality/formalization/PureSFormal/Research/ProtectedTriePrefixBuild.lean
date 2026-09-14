import PureSFormal.Research.ProtectedTrieBuild
import PureSFormal.Research.ProtectedTrieFinitePrefix

/-!
# Building finite prefix closures as protected tries

This local Research module connects the list-based finite prefix sets used by
the certificate address layer with the canonical finite protected-trie build.
It constructs a structural trie by inserting finitely many literal bit-word
generators, proves that its enumerated paths are exactly their prefix closure,
and then applies the existing canonical build theorem below the concrete frozen
seed.

The development is constructive and duplicate-tolerant.  It uses lists only;
there is no quotient, finite-set extensionality, or choice principle here.
-/

namespace PureSFormal.Research.ProtectedTriePrefixBuild

open PureSFormal.PureS
open PureSFormal.Research.ProtectedTrieCertificates
open PureSFormal.Research.ProtectedTrieFinitePrefix
open PureSFormal.Research.ProtectedTrieBuild
open PureSFormal.Research.ProtectedTrieEnumeration
open PureSFormal.Research.ProtectedTrieAlgebra
open PureSFormal.Research.ProtectedTrieSeed

/-! ## Structural insertion -/

/-- Insert every prefix of one literal endpoint into a structural prefix tree. -/
def insertPath : BitWord -> PrefixTree -> PrefixTree
  | [], .empty => .node .empty .empty
  | [], tree@(.node _ _) => tree
  | false :: rest, .empty => .node (insertPath rest .empty) .empty
  | true :: rest, .empty => .node .empty (insertPath rest .empty)
  | false :: rest, .node left right =>
      .node (insertPath rest left) right
  | true :: rest, .node left right =>
      .node left (insertPath rest right)

/-- Insert every endpoint in a finite generator list. -/
def treeOfGenerators : List BitWord -> PrefixTree
  | [] => .empty
  | endpoint :: rest => insertPath endpoint (treeOfGenerators rest)

/-! ## Exact path membership for one insertion -/

@[simp]
theorem nil_mem_paths_node (left right : PrefixTree) :
    List.Mem [] (PrefixTree.node left right).paths :=
  List.Mem.head _

theorem false_cons_mem_paths_node_iff (path : BitWord)
    (left right : PrefixTree) :
    List.Mem (false :: path) (PrefixTree.node left right).paths <->
      List.Mem path left.paths := by
  constructor
  · intro hmem
    rw [PrefixTree.paths_node] at hmem
    rcases List.mem_cons.mp hmem with heq | htail
    · cases heq
    · rcases List.mem_append.mp htail with hleft | hright
      · exact (mem_map_cons_iff false path left.paths).mp hleft
      · exact False.elim (false_cons_not_mem_map_true path right.paths hright)
  · intro hmem
    rw [PrefixTree.paths_node]
    exact List.Mem.tail []
      (List.mem_append.mpr (Or.inl
        ((mem_map_cons_iff false path left.paths).mpr hmem)))

theorem true_cons_mem_paths_node_iff (path : BitWord)
    (left right : PrefixTree) :
    List.Mem (true :: path) (PrefixTree.node left right).paths <->
      List.Mem path right.paths := by
  constructor
  · intro hmem
    rw [PrefixTree.paths_node] at hmem
    rcases List.mem_cons.mp hmem with heq | htail
    · cases heq
    · rcases List.mem_append.mp htail with hleft | hright
      · exact False.elim (true_cons_not_mem_map_false path left.paths hleft)
      · exact (mem_map_cons_iff true path right.paths).mp hright
  · intro hmem
    rw [PrefixTree.paths_node]
    exact List.Mem.tail []
      (List.mem_append.mpr (Or.inr
        ((mem_map_cons_iff true path right.paths).mpr hmem)))

/-- A nonempty literal path never belongs to the empty structural tree. -/
theorem not_mem_paths_empty (path : BitWord) :
    Not (List.Mem path PrefixTree.empty.paths) := by
  intro hmem
  cases hmem

/-- Cancel the same literal head bit from a prefix relation. -/
theorem wordPrefix_cons_iff (bit : Bool) (path endpoint : BitWord) :
    WordPrefix (bit :: path) (bit :: endpoint) <->
      WordPrefix path endpoint := by
  constructor
  · exact WordPrefix.tail
  · exact WordPrefix.cons bit

/-- Inserting one endpoint adds exactly its prefixes to the represented tree. -/
theorem mem_paths_insertPath_iff (endpoint path : BitWord)
    (tree : PrefixTree) :
    List.Mem path (insertPath endpoint tree).paths <->
      List.Mem path tree.paths \/ WordPrefix path endpoint := by
  induction endpoint generalizing path tree with
  | nil =>
      cases tree with
      | empty =>
          cases path with
          | nil =>
              exact ⟨fun _ => Or.inr (.nil []), fun _ => nil_mem_paths_node _ _⟩
          | cons bit path =>
              cases bit with
              | false =>
                  constructor
                  · intro hmem
                    have hempty : List.Mem path PrefixTree.empty.paths :=
                      (false_cons_mem_paths_node_iff path .empty .empty).mp hmem
                    exact False.elim (not_mem_paths_empty path hempty)
                  · intro h
                    cases h with
                    | inl hmem => exact False.elim (not_mem_paths_empty _ hmem)
                    | inr hprefix =>
                        exact False.elim (WordPrefix.not_cons_nil _ _ hprefix)
              | true =>
                  constructor
                  · intro hmem
                    have hempty : List.Mem path PrefixTree.empty.paths :=
                      (true_cons_mem_paths_node_iff path .empty .empty).mp hmem
                    exact False.elim (not_mem_paths_empty path hempty)
                  · intro h
                    cases h with
                    | inl hmem => exact False.elim (not_mem_paths_empty _ hmem)
                    | inr hprefix =>
                        exact False.elim (WordPrefix.not_cons_nil _ _ hprefix)
      | node left right =>
          cases path with
          | nil => exact ⟨Or.inl, fun _ => nil_mem_paths_node left right⟩
          | cons bit path =>
              constructor
              · intro hmem
                exact Or.inl hmem
              · intro h
                cases h with
                | inl hmem => exact hmem
                | inr hprefix => exact False.elim (WordPrefix.not_cons_nil _ _ hprefix)
  | cons endpointBit endpoint ih =>
      cases endpointBit with
      | false =>
          cases tree with
          | empty =>
              cases path with
              | nil =>
                  exact ⟨fun _ => Or.inr (.nil _), fun _ => nil_mem_paths_node _ _⟩
              | cons pathBit path =>
                  cases pathBit with
                  | false =>
                      constructor
                      · intro hmem
                        have hchild :=
                          (false_cons_mem_paths_node_iff path
                            (insertPath endpoint .empty) .empty).mp hmem
                        rcases (ih path .empty).mp hchild with hold | hprefix
                        · exact False.elim (not_mem_paths_empty path hold)
                        · exact Or.inr (.cons false hprefix)
                      · intro h
                        rcases h with hold | hprefix
                        · exact False.elim (not_mem_paths_empty _ hold)
                        · apply (false_cons_mem_paths_node_iff path _ _).mpr
                          exact (ih path .empty).mpr
                            (Or.inr (WordPrefix.tail hprefix))
                  | true =>
                      constructor
                      · intro hmem
                        have hempty :=
                          (true_cons_mem_paths_node_iff path
                            (insertPath endpoint .empty) .empty).mp hmem
                        exact False.elim (not_mem_paths_empty path hempty)
                      · intro h
                        rcases h with hold | hprefix
                        · exact False.elim (not_mem_paths_empty _ hold)
                        · cases hprefix
          | node left right =>
              cases path with
              | nil =>
                  exact ⟨fun _ => Or.inr (.nil _), fun _ => nil_mem_paths_node _ _⟩
              | cons pathBit path =>
                  cases pathBit with
                  | false =>
                      constructor
                      · intro hmem
                        have hchild :=
                          (false_cons_mem_paths_node_iff path
                            (insertPath endpoint left) right).mp hmem
                        rcases (ih path left).mp hchild with hold | hprefix
                        · exact Or.inl
                            ((false_cons_mem_paths_node_iff path left right).mpr hold)
                        · exact Or.inr (.cons false hprefix)
                      · intro h
                        apply (false_cons_mem_paths_node_iff path _ _).mpr
                        rcases h with hold | hprefix
                        · exact (ih path left).mpr (Or.inl
                            ((false_cons_mem_paths_node_iff path left right).mp hold))
                        · exact (ih path left).mpr
                            (Or.inr (WordPrefix.tail hprefix))
                  | true =>
                      constructor
                      · intro hmem
                        exact Or.inl
                          ((true_cons_mem_paths_node_iff path left right).mpr
                            ((true_cons_mem_paths_node_iff path
                              (insertPath endpoint left) right).mp hmem))
                      · intro h
                        rcases h with hold | hprefix
                        · exact (true_cons_mem_paths_node_iff path _ _).mpr
                            ((true_cons_mem_paths_node_iff path left right).mp hold)
                        · cases hprefix
      | true =>
          cases tree with
          | empty =>
              cases path with
              | nil =>
                  exact ⟨fun _ => Or.inr (.nil _), fun _ => nil_mem_paths_node _ _⟩
              | cons pathBit path =>
                  cases pathBit with
                  | false =>
                      constructor
                      · intro hmem
                        have hempty :=
                          (false_cons_mem_paths_node_iff path .empty
                            (insertPath endpoint .empty)).mp hmem
                        exact False.elim (not_mem_paths_empty path hempty)
                      · intro h
                        rcases h with hold | hprefix
                        · exact False.elim (not_mem_paths_empty _ hold)
                        · cases hprefix
                  | true =>
                      constructor
                      · intro hmem
                        have hchild :=
                          (true_cons_mem_paths_node_iff path .empty
                            (insertPath endpoint .empty)).mp hmem
                        rcases (ih path .empty).mp hchild with hold | hprefix
                        · exact False.elim (not_mem_paths_empty path hold)
                        · exact Or.inr (.cons true hprefix)
                      · intro h
                        rcases h with hold | hprefix
                        · exact False.elim (not_mem_paths_empty _ hold)
                        · apply (true_cons_mem_paths_node_iff path _ _).mpr
                          exact (ih path .empty).mpr
                            (Or.inr (WordPrefix.tail hprefix))
          | node left right =>
              cases path with
              | nil =>
                  exact ⟨fun _ => Or.inr (.nil _), fun _ => nil_mem_paths_node _ _⟩
              | cons pathBit path =>
                  cases pathBit with
                  | false =>
                      constructor
                      · intro hmem
                        exact Or.inl
                          ((false_cons_mem_paths_node_iff path left right).mpr
                            ((false_cons_mem_paths_node_iff path left
                              (insertPath endpoint right)).mp hmem))
                      · intro h
                        rcases h with hold | hprefix
                        · exact (false_cons_mem_paths_node_iff path _ _).mpr
                            ((false_cons_mem_paths_node_iff path left right).mp hold)
                        · cases hprefix
                  | true =>
                      constructor
                      · intro hmem
                        have hchild :=
                          (true_cons_mem_paths_node_iff path left
                            (insertPath endpoint right)).mp hmem
                        rcases (ih path right).mp hchild with hold | hprefix
                        · exact Or.inl
                            ((true_cons_mem_paths_node_iff path left right).mpr hold)
                        · exact Or.inr (.cons true hprefix)
                      · intro h
                        apply (true_cons_mem_paths_node_iff path _ _).mpr
                        rcases h with hold | hprefix
                        · exact (ih path right).mpr (Or.inl
                            ((true_cons_mem_paths_node_iff path left right).mp hold))
                        · exact (ih path right).mpr
                            (Or.inr (WordPrefix.tail hprefix))

/-! ## A finite list represents exactly its prefix closure -/

/-- Structural paths are exactly prefixes of one listed generator. -/
theorem mem_paths_treeOfGenerators_iff (generators : List BitWord)
    (path : BitWord) :
    List.Mem path (treeOfGenerators generators).paths <->
      exists endpoint, List.Mem endpoint generators /\
        WordPrefix path endpoint := by
  induction generators with
  | nil =>
      constructor
      · intro hmem
        exact False.elim (not_mem_paths_empty path hmem)
      · rintro ⟨endpoint, hmem, _⟩
        cases hmem
  | cons endpoint rest ih =>
      rw [treeOfGenerators, mem_paths_insertPath_iff, ih]
      constructor
      · intro h
        cases h with
        | inl hrest =>
            obtain ⟨found, hmem, hprefix⟩ := hrest
            exact ⟨found, .tail endpoint hmem, hprefix⟩
        | inr hprefix =>
            exact ⟨endpoint, .head rest, hprefix⟩
      · rintro ⟨found, hmem, hprefix⟩
        cases hmem with
        | head => exact Or.inr hprefix
        | tail _ hrest => exact Or.inl ⟨found, hrest, hprefix⟩

/-! ## Coherent reachability under insertion -/

/-- Canonical builds are monotone under one structural path insertion. -/
theorem buildFrom_steps_insertPath {phase : Nat × Nat}
    (hgood : GoodPhase phase) (endpoint : BitWord) (tree : PrefixTree) :
    Steps (buildFrom phase tree) (buildFrom phase (insertPath endpoint tree)) := by
  induction endpoint generalizing phase tree with
  | nil =>
      cases tree with
      | empty =>
          simpa only [buildFrom, insertPath, phaseOpened] using
            phaseGenerator_steps_phaseOpened hgood
      | node left right => exact Steps.refl _
  | cons bit rest ih =>
      cases tree with
      | empty =>
          have hopen : Steps (phaseGenerator phase) (phaseOpened phase) :=
            phaseGenerator_steps_phaseOpened hgood
          have hnext := hgood.next
          cases bit with
          | false =>
              have hchild := ih hnext PrefixTree.empty
              have hlift := protectedNode_left_steps hchild
                (phaseGenerator (nextPhase phase)) (phaseJunk phase)
              exact Steps.trans hopen (by
                simpa only [phaseOpened, buildFrom, insertPath] using hlift)
          | true =>
              have hchild := ih hnext PrefixTree.empty
              have hlift := protectedNode_right_steps
                (phaseGenerator (nextPhase phase)) (phaseJunk phase) hchild
              exact Steps.trans hopen (by
                simpa only [phaseOpened, buildFrom, insertPath] using hlift)
      | node left right =>
          have hnext := hgood.next
          cases bit with
          | false =>
              simpa only [buildFrom, insertPath] using
                protectedNode_left_steps (ih hnext left)
                  (buildFrom (nextPhase phase) right) (phaseJunk phase)
          | true =>
              simpa only [buildFrom, insertPath] using
                protectedNode_right_steps
                  (buildFrom (nextPhase phase) left) (phaseJunk phase)
                  (ih hnext right)

/-- Depth-indexed coherent insertion reachability. -/
theorem buildAt_steps_insertPath (depth : Nat) (endpoint : BitWord)
    (tree : PrefixTree) :
    Steps (buildAt depth tree) (buildAt depth (insertPath endpoint tree)) := by
  exact buildFrom_steps_insertPath (goodPhase_phaseAt depth) endpoint tree

/-! ## Exact concrete realization of finite prefix sets -/

/-- Canonical structural trie for a list-based finite prefix set. -/
def treeOfPrefixSet (set : FinitePrefixSet) : PrefixTree :=
  treeOfGenerators set.generators

/-- Concrete protected-trie endpoint below the frozen seed. -/
def seededPrefixBuild (bits : BitWord) (set : FinitePrefixSet) : Term :=
  seededBuild bits (treeOfPrefixSet set)

/-- The concrete encoder reaches the canonical term for every finite prefix set. -/
theorem encoder_steps_seededPrefixBuild (bits : BitWord)
    (set : FinitePrefixSet) :
    Steps (encoder bits) (seededPrefixBuild bits set) :=
  encoder_steps_seededBuild bits (treeOfPrefixSet set)

/-- The anchored opened paths represent exactly `FinitePrefixSet.Contains`. -/
theorem mem_anchoredOpenedPaths_seededPrefixBuild_iff
    (bits path : BitWord) (set : FinitePrefixSet) :
    List.Mem path (anchoredOpenedPaths (seededPrefixBuild bits set)) <->
      set.Contains path := by
  rw [seededPrefixBuild, anchoredOpenedPaths_seededBuild,
    treeOfPrefixSet, mem_paths_treeOfGenerators_iff]
  rfl

/-- Existential exact-range form for every finitely generated prefix closure. -/
theorem encoder_reaches_exact_prefixSet (bits : BitWord)
    (set : FinitePrefixSet) :
    exists target,
      Steps (encoder bits) target /\
      forall path,
        List.Mem path (anchoredOpenedPaths target) <-> set.Contains path := by
  exact ⟨seededPrefixBuild bits set, encoder_steps_seededPrefixBuild bits set,
    fun path => mem_anchoredOpenedPaths_seededPrefixBuild_iff bits path set⟩

end PureSFormal.Research.ProtectedTriePrefixBuild
