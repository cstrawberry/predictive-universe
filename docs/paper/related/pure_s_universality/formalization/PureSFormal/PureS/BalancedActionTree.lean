import PureSFormal.PureS.ActionTree
import PureSFormal.Cook.CTS

/-!
# Balanced phase/bit action dispatchers

The canonical generic dispatcher is a right-associated chain.  This module
keeps exactly the same phase-major, `false`-then-`true` leaf order but builds
the operational tree by deterministic bottom-up structural pairing.  Each
round combines adjacent trees; an unpaired final tree is carried to the next
round unchanged.
-/

namespace PureSFormal.PureS

namespace BalancedActionTree

open Dispatcher

/-- Pair adjacent trees in one deterministic balancing round. -/
def pairRound : List (Dispatcher.Tree Label) → List (Dispatcher.Tree Label)
  | [] => []
  | [tree] => [tree]
  | first :: second :: rest =>
      .node first second :: pairRound rest

/-- Concatenate all leaf sequences in a forest. -/
def forestLeaves (forest : List (Dispatcher.Tree Label)) : List Label :=
  forest.flatMap Dispatcher.Tree.leaves

/-- One pairing round preserves the complete left-to-right leaf sequence. -/
theorem forestLeaves_pairRound
    : (forest : List (Dispatcher.Tree Label)) →
      forestLeaves (pairRound forest) = forestLeaves forest
  | [] => rfl
  | [tree] => by
      simp only [pairRound, forestLeaves, List.flatMap_cons,
        List.flatMap_nil, List.append_nil]
  | first :: second :: rest => by
      change (first.leaves ++ second.leaves) ++
          forestLeaves (pairRound rest) =
        first.leaves ++ (second.leaves ++ forestLeaves rest)
      rw [forestLeaves_pairRound rest, List.append_assoc]

/-- A pairing round never increases the number of trees. -/
theorem pairRound_length_le :
    (forest : List (Dispatcher.Tree Label)) →
      (pairRound forest).length ≤ forest.length
  | [] => Nat.le_refl 0
  | [tree] => Nat.le_refl 1
  | first :: second :: rest => by
      simp only [pairRound, List.length_cons]
      exact Nat.le_trans
        (Nat.succ_le_succ (pairRound_length_le rest)) (Nat.le_succ _)

/-- A round strictly decreases every forest containing at least two trees. -/
theorem pairRound_length_lt_of_two
    (first second : Dispatcher.Tree Label)
    (rest : List (Dispatcher.Tree Label)) :
    (pairRound (first :: second :: rest)).length <
      (first :: second :: rest).length := by
  simp only [pairRound, List.length_cons]
  exact Nat.lt_of_le_of_lt
    (Nat.succ_le_succ (pairRound_length_le rest))
    (Nat.lt_succ_self _)

/-- A nonempty forest stays nonempty after a pairing round. -/
theorem pairRound_ne_nil
    {forest : List (Dispatcher.Tree Label)}
    (hne : forest ≠ []) : pairRound forest ≠ [] := by
  cases forest with
  | nil => contradiction
  | cons first rest =>
      cases rest with
      | nil => exact List.cons_ne_nil first []
      | cons second tail =>
          exact List.cons_ne_nil (Dispatcher.Tree.node first second) _

/--
Collapse a forest using at most the supplied number of pairing rounds.
The fallback is reachable only for empty input or insufficient fuel.
-/
def collapse (fallback : Dispatcher.Tree Label) :
    Nat → List (Dispatcher.Tree Label) → Dispatcher.Tree Label
  | 0, _ => fallback
  | _ + 1, [] => fallback
  | _ + 1, [tree] => tree
  | fuel + 1, first :: second :: rest =>
      collapse fallback fuel (pairRound (first :: second :: rest))

/-- Length fuel suffices to collapse every nonempty forest without fallback. -/
theorem leaves_collapse (fallback : Dispatcher.Tree Label) :
    ∀ (fuel : Nat) (forest : List (Dispatcher.Tree Label)),
      forest ≠ [] → forest.length ≤ fuel →
      (collapse fallback fuel forest).leaves = forestLeaves forest := by
  intro fuel
  induction fuel with
  | zero =>
      intro forest hne hlength
      have hzero : forest.length = 0 := Nat.eq_zero_of_le_zero hlength
      exact (hne (List.eq_nil_of_length_eq_zero hzero)).elim
  | succ fuel ih =>
      intro forest hne hlength
      cases forest with
      | nil => contradiction
      | cons first rest =>
          cases rest with
          | nil =>
              simp only [collapse, Dispatcher.Tree.leaves, forestLeaves,
                List.flatMap_cons, List.flatMap_nil, List.append_nil]
          | cons second tail =>
              have hroundne :
                  pairRound (first :: second :: tail) ≠ [] :=
                pairRound_ne_nil (List.cons_ne_nil first _)
              have hroundlt :
                  (pairRound (first :: second :: tail)).length <
                    (first :: second :: tail).length :=
                pairRound_length_lt_of_two first second tail
              have hroundle :
                  (pairRound (first :: second :: tail)).length ≤ fuel :=
                Nat.lt_succ_iff.mp (Nat.lt_of_lt_of_le hroundlt hlength)
              rw [collapse, ih _ hroundne hroundle,
                forestLeaves_pairRound]

/-- A forest of singleton leaves has exactly its source label sequence. -/
theorem forestLeaves_map_leaf : (labels : List Label) →
    forestLeaves (labels.map Dispatcher.Tree.leaf) = labels
  | [] => rfl
  | label :: labels => by
      change label :: forestLeaves (labels.map Dispatcher.Tree.leaf) =
        label :: labels
      exact congrArg (List.cons label) (forestLeaves_map_leaf labels)

/-- Mapping singleton leaves preserves nonemptiness. -/
theorem map_leaf_ne_nil {labels : List Label} (hne : labels ≠ []) :
    labels.map Dispatcher.Tree.leaf ≠ [] := by
  cases labels with
  | nil => contradiction
  | cons label labels =>
      exact List.cons_ne_nil (Dispatcher.Tree.leaf label) _

/-- Deterministically balance a list; the fallback matters only for `[]`. -/
def ofList (fallback : Label) (labels : List Label) : Dispatcher.Tree Label :=
  collapse (.leaf fallback) labels.length (labels.map Dispatcher.Tree.leaf)

/-- Balancing preserves every leaf and its exact left-to-right order. -/
theorem leaves_ofList_of_ne_nil (fallback : Label) (labels : List Label)
    (hne : labels ≠ []) :
    (ofList fallback labels).leaves = labels := by
  have hforest : labels.map Dispatcher.Tree.leaf ≠ [] :=
    map_leaf_ne_nil hne
  rw [ofList,
    leaves_collapse (.leaf fallback) labels.length
      (labels.map Dispatcher.Tree.leaf) hforest (by
        simpa only [List.length_map] using Nat.le_refl labels.length),
    forestLeaves_map_leaf]

/-- Phase-major labels, with `false` immediately before `true` at each phase. -/
def labels (program : CTS.Program) : List (ActionLabel program) :=
  allActionLabels program

/-- The symbolic balanced dispatcher for an arbitrary positive-period CTS. -/
def tree (program : CTS.Program) : Dispatcher.Tree (ActionLabel program) :=
  ofList (CTS.zeroPhase program, false) (labels program)

@[simp]
theorem labels_length (program : CTS.Program) :
    (labels program).length = 2 * program.period :=
  length_allActionLabels program

@[simp]
theorem tree_leaves (program : CTS.Program) :
    (tree program).leaves = labels program := by
  exact leaves_ofList_of_ne_nil _ _ (allActionLabels_ne_nil program)

/-- The balanced tree has exactly two leaves for every CTS phase. -/
@[simp]
theorem tree_leafCount (program : CTS.Program) :
    (tree program).leafCount = 2 * program.period := by
  rw [← Dispatcher.Tree.leaves_length, tree_leaves, labels_length]

/-- Both bit labels for every phase occur in the balanced leaf sequence. -/
theorem label_mem_leaves (program : CTS.Program)
    (phase : Fin program.period) (bit : Bool) :
    (phase, bit) ∈ (tree program).leaves := by
  rw [tree_leaves]
  exact mem_allActionLabels program (phase, bit)

/-- Every phase/bit label has a structural route in the balanced tree. -/
theorem route_complete (program : CTS.Program)
    (label : ActionLabel program) :
    ∃ route, Dispatcher.HasRoute (tree program) route label := by
  apply Dispatcher.Tree.exists_hasRoute_of_mem_leaves
  rw [tree_leaves]
  exact mem_allActionLabels program label

/-- Every phase/bit label has a successful executable lookup route. -/
theorem lookup_complete (program : CTS.Program)
    (label : ActionLabel program) :
    ∃ route, (tree program).lookup? route = some label := by
  obtain ⟨route, hroute⟩ := route_complete program label
  exact ⟨route, hroute.lookup⟩

/-- A fixed route cannot select two different labels. -/
theorem lookup_deterministic (program : CTS.Program)
    {route : Dispatcher.Route} {left right : ActionLabel program}
    (hleft : (tree program).lookup? route = some left)
    (hright : (tree program).lookup? route = some right) :
    left = right :=
  Dispatcher.lookup?_deterministic hleft hright

/-- Executable selected route in the balanced tree. -/
def route (program : CTS.Program) (label : ActionLabel program) :
    Dispatcher.Route :=
  ((tree program).findRoute? label).getD []

/-- The executable selector always returns a route to the requested label. -/
theorem route_valid (program : CTS.Program) (label : ActionLabel program) :
    Dispatcher.HasRoute (tree program) (route program label) label := by
  obtain ⟨foundRoute, hfound⟩ :=
    Dispatcher.Tree.findRoute?_complete
      (tree := tree program) (target := label)
      (route_complete program label)
  have hselected : route program label = foundRoute := by
    simp [route, hfound]
  rw [hselected]
  exact Dispatcher.Tree.findRoute?_sound hfound

/-- The actual balanced dispatcher used by the finite scheduler. -/
def dispatcher (program : CTS.Program) : ActionDispatcher program :=
  ⟨tree program, route program, route_valid program⟩

@[simp]
theorem dispatcher_tree (program : CTS.Program) :
    (dispatcher program).tree = tree program :=
  rfl

@[simp]
theorem dispatcher_route (program : CTS.Program)
    (label : ActionLabel program) :
    (dispatcher program).route label = route program label :=
  rfl

/-- The fixed 912-phase Cook dispatcher has exactly 1,824 action leaves. -/
theorem cook_leafCount :
    (tree Cook.rogozhinCookProgram).leafCount = 1824 := by
  rw [tree_leafCount]
  rfl

private theorem pairRound_length_bound :
    (forest : List (Dispatcher.Tree Label)) → ∀ limit,
      forest.length ≤ 2 * limit → (pairRound forest).length ≤ limit
  | [], _, _ => Nat.zero_le _
  | [first], limit, bounded => by
      cases limit with
      | zero => exact (Nat.not_succ_le_zero 0 bounded).elim
      | succ limit => exact Nat.succ_le_succ (Nat.zero_le limit)
  | first :: second :: rest, limit, bounded => by
      cases limit with
      | zero => exact (Nat.not_succ_le_zero (rest.length + 1) bounded).elim
      | succ limit =>
          have smaller : rest.length ≤ 2 * limit := by
            simp only [List.length_cons, Nat.mul_succ] at bounded
            exact Nat.le_of_succ_le_succ (Nat.le_of_succ_le_succ bounded)
          have paired := pairRound_length_bound rest limit smaller
          simp only [pairRound, List.length_cons]
          exact Nat.succ_le_succ paired

private theorem pairRound_depth_bound :
    (forest : List (Dispatcher.Tree Label)) → ∀ depth,
      (∀ item ∈ forest, item.depth ≤ depth) →
      ∀ item ∈ pairRound forest, item.depth ≤ depth + 1
  | [], _, _, _, member => by simp only [pairRound, List.not_mem_nil] at member
  | [first], depth, bounded, item, member => by
      simp only [pairRound, List.mem_cons, List.not_mem_nil, or_false] at member
      subst item
      exact Nat.le_trans (bounded first (by simp)) (Nat.le_succ depth)
  | first :: second :: rest, depth, bounded, item, member => by
      simp only [pairRound, List.mem_cons] at member
      rcases member with rfl | member
      · exact Nat.succ_le_succ (Nat.max_le.mpr
          ⟨bounded first (by simp), bounded second (by simp)⟩)
      · exact pairRound_depth_bound rest depth
          (fun item member => bounded item (by simp [member])) item member

private theorem collapse_depth_bound (rounds : Nat) :
    ∀ (fuel : Nat) (fallback : Dispatcher.Tree Label) (forest : List (Dispatcher.Tree Label))
      (depth : Nat), rounds < fuel → forest.length ≤ 2 ^ rounds →
      fallback.depth ≤ depth → (∀ item ∈ forest, item.depth ≤ depth) →
      (collapse fallback fuel forest).depth ≤ depth + rounds := by
  induction rounds with
  | zero =>
      intro fuel fallback forest depth enough size base bounded
      cases fuel with
      | zero => exact (Nat.not_lt_zero 0 enough).elim
      | succ fuel =>
          cases forest with
          | nil => simpa only [collapse, Nat.add_zero] using base
          | cons first rest =>
              cases rest with
              | nil => simpa only [collapse, Nat.add_zero] using bounded first (by simp)
              | cons second rest =>
                  exact (Nat.not_succ_le_zero rest.length (Nat.le_of_succ_le_succ size)).elim
  | succ rounds ih =>
      intro fuel fallback forest depth enough size base bounded
      cases fuel with
      | zero => exact (Nat.not_lt_zero (rounds + 1) enough).elim
      | succ fuel =>
          cases forest with
          | nil =>
              simpa only [collapse] using Nat.le_trans base (Nat.le_add_right depth (rounds + 1))
          | cons first rest =>
              cases rest with
              | nil =>
                  simpa only [collapse] using Nat.le_trans (bounded first (by simp))
                    (Nat.le_add_right depth (rounds + 1))
              | cons second rest =>
                  have nextSize : (pairRound (first :: second :: rest)).length ≤ 2 ^ rounds :=
                    pairRound_length_bound _ _ (by simpa only [Nat.pow_succ, Nat.mul_comm] using size)
                  have nextBound := ih fuel fallback (pairRound (first :: second :: rest))
                    (depth + 1) (Nat.lt_of_succ_lt_succ enough) nextSize
                    (Nat.le_trans base (Nat.le_succ depth))
                    (pairRound_depth_bound _ depth bounded)
                  simpa only [collapse, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using nextBound

private theorem leafCount_le_two_pow_depth (input : Dispatcher.Tree Label) :
    input.leafCount ≤ 2 ^ input.depth := by
  induction input with
  | leaf label => exact Nat.le_refl 1
  | node left right ihLeft ihRight =>
      have leftBound := Nat.le_trans ihLeft
        (Nat.pow_le_pow_right (by decide : 0 < 2) (Nat.le_max_left left.depth right.depth))
      have rightBound := Nat.le_trans ihRight
        (Nat.pow_le_pow_right (by decide : 0 < 2) (Nat.le_max_right left.depth right.depth))
      simp only [Dispatcher.Tree.leafCount, Dispatcher.Tree.depth, Nat.pow_succ]
      change left.leafCount + right.leafCount ≤ 2 ^ (max left.depth right.depth) * 2
      simpa only [Nat.mul_two] using Nat.add_le_add leftBound rightBound

private theorem map_leaf_depth_bound : (items : List Label) →
    ∀ item ∈ items.map Dispatcher.Tree.leaf, item.depth ≤ 0
  | [], _, member => by simp only [List.map_nil, List.not_mem_nil] at member
  | first :: rest, item, member => by
      simp only [List.map_cons, List.mem_cons] at member
      rcases member with rfl | member
      · exact Nat.le_refl 0
      · exact map_leaf_depth_bound rest item member

/-- The exact maximum route depth of the fixed balanced Cook dispatcher. -/
theorem cook_depth :
    (tree Cook.rogozhinCookProgram).depth = 11 := by
  have upper : (tree Cook.rogozhinCookProgram).depth ≤ 11 := by
    unfold tree ofList
    apply collapse_depth_bound 11 _ _ _ 0
    · rw [labels_length]
      decide
    · rw [List.length_map, labels_length]
      decide
    · exact Nat.le_refl 0
    · exact map_leaf_depth_bound _
  apply Nat.le_antisymm upper
  apply Nat.le_of_not_gt
  intro below
  have small : (tree Cook.rogozhinCookProgram).depth ≤ 10 := Nat.le_of_lt_succ below
  have capacity := Nat.le_trans (leafCount_le_two_pow_depth (tree Cook.rogozhinCookProgram))
    (Nat.pow_le_pow_right (by decide : 0 < 2) small)
  rw [cook_leafCount] at capacity
  have power : (2 : Nat) ^ 10 = 1024 := by decide
  rw [power] at capacity
  exact (by decide : ¬ (1824 ≤ 1024)) capacity

/-- Every fixed Cook action has a selected route of length at most eleven. -/
theorem cook_lookup_complete_depth
    (label : ActionLabel Cook.rogozhinCookProgram) :
    ∃ route,
      (tree Cook.rogozhinCookProgram).lookup? route = some label ∧
      route.length ≤ 11 := by
  obtain ⟨route, hlookup⟩ := lookup_complete Cook.rogozhinCookProgram label
  have hstructural :
      Dispatcher.HasRoute (tree Cook.rogozhinCookProgram) route label :=
    Dispatcher.hasRoute_of_lookup? hlookup
  refine ⟨route, hlookup, ?_⟩
  rw [← cook_depth]
  exact hstructural.length_le_depth

/-- The concrete scheduler selector inherits the fixed depth-eleven bound. -/
theorem cook_selectedRoute_length_le
    (label : ActionLabel Cook.rogozhinCookProgram) :
    ((dispatcher Cook.rogozhinCookProgram).route label).length ≤ 11 := by
  rw [dispatcher_route]
  have hroute := route_valid Cook.rogozhinCookProgram label
  rw [← cook_depth]
  exact hroute.length_le_depth

end BalancedActionTree

end PureSFormal.PureS
