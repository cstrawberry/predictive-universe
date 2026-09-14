import PureSFormal.PureS.Term

/-!
# Finite binary dispatchers

The dispatcher is a finite binary tree with labeled leaves.  A route is a
finite left/right word which must end exactly at a leaf.  This module is
generic in the leaf-label type and contains no instance-specific expansion.
-/

namespace PureSFormal.PureS

namespace Dispatcher

/-- A finite binary tree whose payloads occur only at leaves. -/
inductive Tree (Label : Type u) where
  | leaf (label : Label)
  | node (left right : Tree Label)
  deriving DecidableEq, Repr

/-- A root-to-leaf direction word. -/
abbrev Route := List Direction

namespace Tree

/-- Look up the leaf reached by a route; reject early or late termination. -/
def lookup? : Tree Label → Route → Option Label
  | .leaf label, [] => some label
  | .leaf _, _ :: _ => none
  | .node _ _, [] => none
  | .node left _, .left :: rest => lookup? left rest
  | .node _ right, .right :: rest => lookup? right rest

/-- Leaf labels in structural left-to-right order. -/
def leaves : Tree Label → List Label
  | .leaf label => [label]
  | .node left right => left.leaves ++ right.leaves

/-- Number of leaves. -/
def leafCount : Tree Label → Nat
  | .leaf _ => 1
  | .node left right => left.leafCount + right.leafCount

/-- Maximum number of edges on a root-to-leaf route. -/
def depth : Tree Label → Nat
  | .leaf _ => 0
  | .node left right => Nat.succ (Nat.max left.depth right.depth)

/-- Every route paired with its reached label, in left-to-right order. -/
def routes : Tree Label → List (Route × Label)
  | .leaf label => [([], label)]
  | .node left right =>
      left.routes.map (fun entry => (.left :: entry.1, entry.2)) ++
      right.routes.map (fun entry => (.right :: entry.1, entry.2))

@[simp]
theorem lookup?_leaf_nil (label : Label) :
    (Tree.leaf label).lookup? [] = some label := rfl

@[simp]
theorem lookup?_leaf_cons (label : Label) (direction : Direction) (rest : Route) :
    (Tree.leaf label).lookup? (direction :: rest) = none := by
  cases direction <;> rfl

@[simp]
theorem lookup?_node_nil (left right : Tree Label) :
    (Tree.node left right).lookup? [] = none := rfl

@[simp]
theorem lookup?_node_left (left right : Tree Label) (rest : Route) :
    (Tree.node left right).lookup? (.left :: rest) = left.lookup? rest := rfl

@[simp]
theorem lookup?_node_right (left right : Tree Label) (rest : Route) :
    (Tree.node left right).lookup? (.right :: rest) = right.lookup? rest := rfl

theorem leaves_length (tree : Tree Label) :
    tree.leaves.length = tree.leafCount := by
  induction tree with
  | leaf label => rfl
  | node left right leftIH rightIH =>
      simp only [leaves, List.length_append, leafCount, leftIH, rightIH]

theorem routes_length (tree : Tree Label) :
    tree.routes.length = tree.leafCount := by
  induction tree with
  | leaf label => rfl
  | node left right leftIH rightIH =>
      simp only [routes, List.length_append, List.length_map, leafCount,
        leftIH, rightIH]

theorem leafCount_pos (tree : Tree Label) : 0 < tree.leafCount := by
  induction tree with
  | leaf label => exact Nat.zero_lt_succ 0
  | node left right leftIH rightIH => exact Nat.add_pos_left leftIH _

end Tree

/-- Propositional root-to-leaf route semantics. -/
inductive HasRoute : Tree Label → Route → Label → Prop where
  | leaf (label : Label) : HasRoute (.leaf label) [] label
  | left {route : Route} {label : Label} {left right : Tree Label} :
      HasRoute left route label →
        HasRoute (.node left right) (.left :: route) label
  | right {route : Route} {label : Label} {left right : Tree Label} :
      HasRoute right route label →
        HasRoute (.node left right) (.right :: route) label

namespace HasRoute

/-- Every structural route is accepted by executable lookup. -/
theorem lookup {tree : Tree Label} {route : Route} {label : Label}
    (h : HasRoute tree route label) : tree.lookup? route = some label := by
  induction h with
  | leaf => rfl
  | left h ih => exact ih
  | right h ih => exact ih

/-- A structural route never exceeds the dispatcher's depth. -/
theorem length_le_depth {tree : Tree Label} {route : Route} {label : Label}
    (h : HasRoute tree route label) : route.length ≤ tree.depth := by
  induction h with
  | leaf => exact Nat.le_refl 0
  | @left route label left right h ih =>
      have hmax : route.length ≤ Nat.max left.depth right.depth :=
        Nat.le_trans ih (Nat.le_max_left _ _)
      exact Nat.succ_le_succ hmax
  | @right route label left right h ih =>
      have hmax : route.length ≤ Nat.max left.depth right.depth :=
        Nat.le_trans ih (Nat.le_max_right _ _)
      exact Nat.succ_le_succ hmax

end HasRoute

/-- Successful executable lookup determines a structural route. -/
theorem hasRoute_of_lookup?
    {tree : Tree Label} {route : Route} {label : Label}
    (h : tree.lookup? route = some label) : HasRoute tree route label := by
  induction tree generalizing route with
  | leaf stored =>
      cases route with
      | nil =>
          simp only [Tree.lookup?_leaf_nil, Option.some.injEq] at h
          subst label
          exact .leaf stored
      | cons direction rest =>
          simp only [Tree.lookup?_leaf_cons] at h
          contradiction
  | node left right leftIH rightIH =>
      cases route with
      | nil =>
          simp only [Tree.lookup?_node_nil] at h
          contradiction
      | cons direction rest =>
          cases direction with
          | left =>
              exact .left (leftIH h)
          | right =>
              exact .right (rightIH h)

theorem hasRoute_iff_lookup?
    (tree : Tree Label) (route : Route) (label : Label) :
    HasRoute tree route label ↔ tree.lookup? route = some label :=
  ⟨HasRoute.lookup, hasRoute_of_lookup?⟩

/-- Recursive correctness of a route beginning with `left`. -/
theorem hasRoute_node_left_iff
    (left right : Tree Label) (route : Route) (label : Label) :
    HasRoute (.node left right) (.left :: route) label ↔
      HasRoute left route label := by
  constructor
  · intro h
    cases h with
    | left hleft => exact hleft
  · exact HasRoute.left

/-- Recursive correctness of a route beginning with `right`. -/
theorem hasRoute_node_right_iff
    (left right : Tree Label) (route : Route) (label : Label) :
    HasRoute (.node left right) (.right :: route) label ↔
      HasRoute right route label := by
  constructor
  · intro h
    cases h with
    | right hright => exact hright
  · exact HasRoute.right

/-- Executable lookup is deterministic at a fixed route. -/
theorem lookup?_deterministic
    {tree : Tree Label} {route : Route} {label₁ label₂ : Label}
    (h₁ : tree.lookup? route = some label₁)
    (h₂ : tree.lookup? route = some label₂) :
    label₁ = label₂ := by
  rw [h₁] at h₂
  exact Option.some.inj h₂

/-- A fixed route in the structural relation reaches at most one label. -/
theorem HasRoute.deterministic
    {tree : Tree Label} {route : Route} {label₁ label₂ : Label}
    (h₁ : HasRoute tree route label₁)
    (h₂ : HasRoute tree route label₂) :
    label₁ = label₂ :=
  lookup?_deterministic h₁.lookup h₂.lookup

/-- Recover an original entry from membership in a pointwise mapped list. -/
theorem mapped_member_source {Alpha : Type u} {Beta : Type v}
    (mapEntry : Alpha → Beta) (entries : List Alpha) (value : Beta)
    (member : value ∈ entries.map mapEntry) :
    ∃ entry, entry ∈ entries ∧ mapEntry entry = value := by
  induction entries with
  | nil => cases member
  | cons first rest ih =>
      simp only [List.map, List.mem_cons] at member
      cases member with
      | inl firstEq =>
          exact ⟨first, List.Mem.head _, firstEq.symm⟩
      | inr restMember =>
          obtain ⟨entry, sourceMember, mappedEq⟩ := ih restMember
          exact ⟨entry, List.Mem.tail _ sourceMember, mappedEq⟩

/-- A specified source entry occurs in its pointwise mapped list. -/
theorem mapped_member_of_source {Alpha : Type u} {Beta : Type v}
    (mapEntry : Alpha → Beta) {entries : List Alpha} {entry : Alpha}
    (member : entry ∈ entries) : mapEntry entry ∈ entries.map mapEntry := by
  induction member with
  | head => exact List.Mem.head _
  | tail head member ih => exact List.Mem.tail _ ih

/-- Every enumerated route has the structural route property. -/
theorem hasRoute_of_mem_routes
    {tree : Tree Label} {route : Route} {label : Label}
    (h : (route, label) ∈ tree.routes) : HasRoute tree route label := by
  induction tree generalizing route label with
  | leaf stored =>
      simp only [Tree.routes, List.mem_singleton] at h
      cases h
      exact .leaf _
  | node left right leftIH rightIH =>
      simp only [Tree.routes, List.mem_append] at h
      cases h with
      | inl hleft =>
          obtain ⟨entry, hentry, heq⟩ := mapped_member_source _ _ _ hleft
          cases entry with
          | mk innerRoute innerLabel =>
              cases heq
              exact .left (leftIH hentry)
      | inr hright =>
          obtain ⟨entry, hentry, heq⟩ := mapped_member_source _ _ _ hright
          cases entry with
          | mk innerRoute innerLabel =>
              cases heq
              exact .right (rightIH hentry)

/-- Every structural route occurs in the left-to-right route enumeration. -/
theorem HasRoute.mem_routes
    {tree : Tree Label} {route : Route} {label : Label}
    (h : HasRoute tree route label) : (route, label) ∈ tree.routes := by
  induction h with
  | leaf =>
      simp only [Tree.routes, List.mem_singleton]
  | @left route label left right h ih =>
      simp only [Tree.routes, List.mem_append]
      exact Or.inl (mapped_member_of_source _ ih)
  | @right route label left right h ih =>
      simp only [Tree.routes, List.mem_append]
      exact Or.inr (mapped_member_of_source _ ih)

theorem mem_routes_iff_hasRoute
    (tree : Tree Label) (route : Route) (label : Label) :
    (route, label) ∈ tree.routes ↔ HasRoute tree route label :=
  ⟨hasRoute_of_mem_routes, HasRoute.mem_routes⟩

/-- Route enumeration contains at most one label at any fixed address. -/
theorem routes_fixed_address_unique
    {tree : Tree Label} {route : Route} {label₁ label₂ : Label}
    (h₁ : (route, label₁) ∈ tree.routes)
    (h₂ : (route, label₂) ∈ tree.routes) :
    label₁ = label₂ :=
  (hasRoute_of_mem_routes h₁).deterministic (hasRoute_of_mem_routes h₂)

end Dispatcher

end PureSFormal.PureS
