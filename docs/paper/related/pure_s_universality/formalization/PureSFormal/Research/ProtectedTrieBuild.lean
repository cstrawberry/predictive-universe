import PureSFormal.Research.ProtectedTrieEnumeration
import PureSFormal.Research.ProtectedTrieSeed
import PureSFormal.Research.ProtectedTrieSingleOpening

/-!
# Canonical finite protected-trie builds

This local Research module realizes an arbitrary finite structural binary
prefix tree as a single recursively defined pure-`S` term.  The construction
starts from the generator phase assigned to a depth, opens a requested node by
the already checked six- or seven-contraction macro, and recursively builds
its two protected child fields.

The result here is deliberately finite and canonical.  It proves one chosen
reduction to each structural tree and the exact range of the literal opened
path parser.  It does not use confluence, certificates, tableau verification,
or any universality claim.
-/

namespace PureSFormal.Research.ProtectedTrieBuild

open PureSFormal.PureS
open PureSFormal.Research.ProtectedTrieAlgebra
open PureSFormal.Research.ProtectedTrieEnumeration
open PureSFormal.Research.ProtectedTrieParser
open PureSFormal.Research.ProtectedTrieSeed

/-! ## Finite structural prefix trees -/

/--
A finite prefix-closed binary tree.  `empty` denotes the empty path set;
`node left right` contains the root and the recursively represented children.
-/
inductive PrefixTree where
  | empty
  | node (left right : PrefixTree)
  deriving BEq, DecidableEq, Repr

namespace PrefixTree

/-- Enumerate the represented paths in root/left/right order. -/
def paths : PrefixTree -> List (List Bool)
  | .empty => []
  | .node left right =>
      [] ::
        (left.paths.map (List.cons false) ++
          right.paths.map (List.cons true))

@[simp]
theorem paths_empty : PrefixTree.empty.paths = [] :=
  rfl

@[simp]
theorem paths_node (left right : PrefixTree) :
    (PrefixTree.node left right).paths =
      [] ::
        (left.paths.map (List.cons false) ++
          right.paths.map (List.cons true)) :=
  rfl

end PrefixTree

/-! ## Phase-indexed canonical terms -/

/-- The unopened generator carried by a frontier at one clock phase. -/
def phaseGenerator (phase : Nat × Nat) : Term :=
  D phase.1 phase.2

/--
The literal ignored field created by the canonical opening at a good phase.
The final catch-all clauses are never used by `phaseAt`, but make the function
total on arbitrary pairs.
-/
def phaseJunk : Nat × Nat -> Term
  | (0, .succ (.succ n)) => openingJunk (n + 2) (n + 1)
  | (.succ m, .succ (.succ n)) => openingJunk m n
  | _ => .s

/-- The protected endpoint of one canonical opening at a phase. -/
def phaseOpened (phase : Nat × Nat) : Term :=
  protectedNode
    (phaseGenerator (nextPhase phase))
    (phaseGenerator (nextPhase phase))
    (phaseJunk phase)

/--
Canonical finite endpoint for a structural tree rooted at `phase`.  Recursion
is on the finite tree, so the term is definitionally independent of any order
in which the two child reductions are later witnessed.
-/
def buildFrom (phase : Nat × Nat) : PrefixTree -> Term
  | .empty => phaseGenerator phase
  | .node left right =>
      protectedNode
        (buildFrom (nextPhase phase) left)
        (buildFrom (nextPhase phase) right)
        (phaseJunk phase)

/-- Canonical endpoint whose frontier generator starts at `phaseAt depth`. -/
def buildAt (depth : Nat) (tree : PrefixTree) : Term :=
  buildFrom (phaseAt depth) tree

/-! ## Canonical reachability -/

/-- Every good phase performs its canonical six- or seven-step opening. -/
theorem phaseGenerator_steps_phaseOpened {phase : Nat × Nat}
    (hgood : GoodPhase phase) :
    Steps (phaseGenerator phase) (phaseOpened phase) := by
  rcases phase with ⟨m, n⟩
  rcases hgood with ⟨hn, _hmn⟩
  cases n with
  | zero =>
      have himpossible : Not (2 ≤ 0) := by decide
      exact False.elim (himpossible hn)
  | succ n =>
      cases n with
      | zero =>
          have himpossible : Not (2 ≤ 1) := by decide
          exact False.elim (himpossible hn)
      | succ n =>
          cases m with
          | zero =>
              simpa [phaseGenerator, phaseOpened, phaseJunk, nextPhase,
                opened, openingChild, Nat.add_assoc] using
                  (D_zero_open_seven n).toSteps
          | succ m =>
              simpa [phaseGenerator, phaseOpened, phaseJunk, nextPhase,
                opened, openingChild] using
                  (D_succ_open_six m n).toSteps

/-- A finite reduction lifts through the left field of a protected node. -/
theorem protectedNode_left_steps {source target : Term}
    (hsteps : Steps source target) (right junk : Term) :
    Steps (protectedNode source right junk)
      (protectedNode target right junk) := by
  simpa only [protectedNode, passive, Context.plug] using
    hsteps.inContext
      (.appLeft (.appRight (.s : Term) .hole) (passive right junk))

/-- A finite reduction lifts through the right field of a protected node. -/
theorem protectedNode_right_steps (left junk : Term)
    {source target : Term} (hsteps : Steps source target) :
    Steps (protectedNode left source junk)
      (protectedNode left target junk) := by
  simpa only [protectedNode, passive, Context.plug] using
    hsteps.inContext
      (.appRight (.app .s left)
        (.appLeft (.appRight (.s : Term) .hole) junk))

/-- Every finite structural tree has its canonical endpoint at a good phase. -/
theorem phaseGenerator_steps_buildFrom {phase : Nat × Nat}
    (hgood : GoodPhase phase) (tree : PrefixTree) :
    Steps (phaseGenerator phase) (buildFrom phase tree) := by
  induction tree generalizing phase with
  | empty =>
      exact Steps.refl _
  | node left right ihleft ihright =>
      have hnext : GoodPhase (nextPhase phase) := hgood.next
      have hopen : Steps (phaseGenerator phase) (phaseOpened phase) :=
        phaseGenerator_steps_phaseOpened hgood
      have hleft :
          Steps (phaseGenerator (nextPhase phase))
            (buildFrom (nextPhase phase) left) :=
        ihleft hnext
      have hleftLift :
          Steps (phaseOpened phase)
            (protectedNode
              (buildFrom (nextPhase phase) left)
              (phaseGenerator (nextPhase phase))
              (phaseJunk phase)) := by
        simpa only [phaseOpened] using
          protectedNode_left_steps hleft
            (phaseGenerator (nextPhase phase)) (phaseJunk phase)
      have hright :
          Steps (phaseGenerator (nextPhase phase))
            (buildFrom (nextPhase phase) right) :=
        ihright hnext
      have hrightLift :
          Steps
            (protectedNode
              (buildFrom (nextPhase phase) left)
              (phaseGenerator (nextPhase phase))
              (phaseJunk phase))
            (buildFrom phase (.node left right)) := by
        simpa only [buildFrom] using
          protectedNode_right_steps
            (buildFrom (nextPhase phase) left) (phaseJunk phase) hright
      exact Steps.trans (Steps.trans hopen hleftLift) hrightLift

/--
Starting from the generator assigned to `depth`, the canonical finite build is
reachable by pure-`S` reduction.
-/
theorem phaseAt_steps_buildAt (depth : Nat) (tree : PrefixTree) :
    Steps (phaseGenerator (phaseAt depth)) (buildAt depth tree) := by
  exact phaseGenerator_steps_buildFrom (goodPhase_phaseAt depth) tree

/-- The same reachability theorem with the source generator written literally. -/
theorem D_phaseAt_steps_buildAt (depth : Nat) (tree : PrefixTree) :
    Steps (D (phaseAt depth).1 (phaseAt depth).2) (buildAt depth tree) := by
  simpa only [phaseGenerator] using phaseAt_steps_buildAt depth tree

/-! ## Exact literal opened-path range -/

/-- No generator root has the literal protected-node parser shape. -/
@[simp]
theorem openedPaths_phaseGenerator (phase : Nat × Nat) :
    openedPaths (phaseGenerator phase) = [] := by
  rcases phase with ⟨m, n⟩
  cases m <;> rfl

/-- The canonical term's opened paths are exactly the structural tree paths. -/
theorem openedPaths_buildFrom (phase : Nat × Nat) (tree : PrefixTree) :
    openedPaths (buildFrom phase tree) = tree.paths := by
  induction tree generalizing phase with
  | empty =>
      exact openedPaths_phaseGenerator phase
  | node left right ihleft ihright =>
      simp only [buildFrom, openedPaths_protectedNode, PrefixTree.paths_node,
        ihleft, ihright, List.cons_append]

/-- Depth-indexed form of the exact opened-path range theorem. -/
theorem openedPaths_buildAt (depth : Nat) (tree : PrefixTree) :
    openedPaths (buildAt depth tree) = tree.paths := by
  exact openedPaths_buildFrom (phaseAt depth) tree

/-- Exact membership form of the canonical range theorem. -/
theorem mem_openedPaths_buildAt_iff (depth : Nat) (tree : PrefixTree)
    (path : List Bool) :
    List.Mem path (openedPaths (buildAt depth tree)) <->
      List.Mem path tree.paths := by
  rw [openedPaths_buildAt]

/-! ## Concrete anchored exact range -/

/-- The canonical finite endpoint below the concrete frozen seed. -/
def seededBuild (bits : List Bool) (tree : PrefixTree) : Term :=
  seededHeader bits (buildAt 0 tree)

/-- The concrete finite encoder reaches every canonical structural tree. -/
theorem encoder_steps_seededBuild (bits : List Bool) (tree : PrefixTree) :
    Steps (encoder bits) (seededBuild bits tree) := by
  have hbody : Steps (D 2 2) (buildAt 0 tree) := by
    simpa only [phaseAt] using D_phaseAt_steps_buildAt 0 tree
  simpa only [encoder, seededBuild, seededHeader, header, Context.plug] using!
    hbody.inContext (.appRight (.app .s (N bits)) .hole)

/-- Anchored enumeration of the canonical endpoint is exactly the requested tree. -/
theorem anchoredOpenedPaths_seededBuild (bits : List Bool) (tree : PrefixTree) :
    anchoredOpenedPaths (seededBuild bits tree) = tree.paths := by
  simpa only [seededBuild, seededHeader, anchoredOpenedPaths_header] using
    openedPaths_buildAt 0 tree

/-- Exact anchored membership form of the concrete finite range theorem. -/
theorem mem_anchoredOpenedPaths_seededBuild_iff (bits : List Bool)
    (tree : PrefixTree) (path : List Bool) :
    List.Mem path (anchoredOpenedPaths (seededBuild bits tree)) <->
      List.Mem path tree.paths := by
  rw [anchoredOpenedPaths_seededBuild]

/-- Existential form: every structural finite prefix tree has an exact reduct. -/
theorem encoder_reaches_exact_tree (bits : List Bool) (tree : PrefixTree) :
    exists target,
      Steps (encoder bits) target /\
      anchoredOpenedPaths target = tree.paths := by
  exact ⟨seededBuild bits tree, encoder_steps_seededBuild bits tree,
    anchoredOpenedPaths_seededBuild bits tree⟩

end PureSFormal.Research.ProtectedTrieBuild
