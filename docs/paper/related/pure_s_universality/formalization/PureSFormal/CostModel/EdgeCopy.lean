import PureSFormal.CostModel.ConcreteContraction

/-!
# Concrete one-edge copying

One selected incoming application edge is redirected to one fresh arena node.
The fresh node contains the same record as the old child.  Old identifiers are
embedded into `Sum ι Unit`; the sole right summand is therefore the exact one
fresh allocation.  The rank rescaling below checks acyclicity, and the main
readback theorem proves preservation at every embedded old node, not only at
the distinguished root.
-/

namespace PureSFormal.CostModel

open PureSFormal.PureS

/-- Identifier type after exactly one edge-copy allocation. -/
abbrev CopyId (ι : Type) := Sum ι Unit

/-- A supplied incoming edge from `parent` to `child`. -/
inductive IncomingEdge (arena : Arena ι) (parent child : ι) where
  | left (arg : ι) (atParent : arena.cell parent = .app child arg)
  | right (fn : ι) (atParent : arena.cell parent = .app fn child)

namespace IncomingEdge

variable {arena : Arena ι} {parent child : ι}

/-- Address direction occupied by the supplied edge. -/
def direction : IncomingEdge arena parent child → Direction
  | .left _ _ => .left
  | .right _ _ => .right

end IncomingEdge

/-- One directed child edge in an arena. -/
def PointsTo (arena : Arena ι) (parent : ι)
    (direction : Direction) (child : ι) : Prop :=
  match direction with
  | .left => ∃ arg, arena.cell parent = .app child arg
  | .right => ∃ fn, arena.cell parent = .app fn child

/-- The named node is not the root and has exactly one incoming arena edge. -/
structure UniqueIncoming (arena : Arena ι) (parent : ι)
    (direction : Direction) (child : ι) : Prop where
  root_ne : arena.root ≠ child
  edge : PointsTo arena parent direction child
  unique : ∀ source side, PointsTo arena source side child →
    source = parent ∧ side = direction

namespace UniqueIncoming

variable {arena : Arena ι} {parent child : ι} {side : Direction}

/-- A walk ending at a unique-incoming node is either the empty walk already
at that node or ends with its sole incoming edge. -/
theorem walk_decomposition
    (incoming : UniqueIncoming arena parent side child)
    (start : ι) (address : Address)
    (walk : arena.follow? start address = some child) :
    (address = [] ∧ start = child) ∨
      ∃ pathHead, address = pathHead ++ [side] ∧
        arena.follow? start pathHead = some parent := by
  induction address generalizing start with
  | nil =>
      simp only [Arena.follow?_nil, Option.some.injEq] at walk
      exact Or.inl ⟨rfl, walk⟩
  | cons direction rest ih =>
      cases hcell : arena.cell start with
      | s => cases direction <;> simp [Arena.follow?, hcell] at walk
      | app fn arg =>
          cases direction with
          | left =>
              have tailWalk : arena.follow? fn rest = some child := by
                simpa only [Arena.follow?, hcell] using walk
              rcases ih fn tailWalk with atChild | later
              · rcases atChild with ⟨restNil, fnChild⟩
                subst rest
                subst fn
                have only := incoming.unique start .left ⟨arg, hcell⟩
                refine Or.inr ⟨[], ?_, ?_⟩
                · simp [← only.2]
                · simpa [only.1]
              · rcases later with ⟨pathHead, restEq, prefixWalk⟩
                refine Or.inr ⟨.left :: pathHead, ?_, ?_⟩
                · simp [restEq]
                · simpa only [Arena.follow?, hcell] using prefixWalk
          | right =>
              have tailWalk : arena.follow? arg rest = some child := by
                simpa only [Arena.follow?, hcell] using walk
              rcases ih arg tailWalk with atChild | later
              · rcases atChild with ⟨restNil, argChild⟩
                subst rest
                subst arg
                have only := incoming.unique start .right ⟨fn, hcell⟩
                refine Or.inr ⟨[], ?_, ?_⟩
                · simp [← only.2]
                · simpa [only.1]
              · rcases later with ⟨pathHead, restEq, prefixWalk⟩
                refine Or.inr ⟨.right :: pathHead, ?_, ?_⟩
                · simp [restEq]
                · simpa only [Arena.follow?, hcell] using prefixWalk

/-- If the parent has one root-relative occurrence, the unique-incoming child
also has one, obtained by appending the supplied side. -/
theorem child_occurrence_unique
    (incoming : UniqueIncoming arena parent side child)
    (pathHead : Address)
    (parentUnique : ∀ address,
      arena.follow? arena.root address = some parent → address = pathHead)
    (address : Address)
    (walk : arena.follow? arena.root address = some child) :
    address = pathHead ++ [side] := by
  rcases incoming.walk_decomposition arena.root address walk with atRoot | last
  · exact (incoming.root_ne atRoot.2).elim
  · rcases last with ⟨before, addressEq, parentWalk⟩
    rw [addressEq, parentUnique before parentWalk]

end UniqueIncoming

namespace Arena

variable {ι : Type} [DecidableEq ι]

/-- Cell table after redirecting one supplied edge to the fresh identifier. -/
def edgeCopiedCell
    (arena : Arena ι) (parent child : ι)
    (edge : IncomingEdge arena parent child) : CopyId ι → Cell (CopyId ι)
  | .inl node =>
      if node = parent then
        match edge with
        | .left arg _ => .app (.inr ()) (.inl arg)
        | .right fn _ => .app (.inl fn) (.inr ())
      else
        (arena.cell node).map Sum.inl
  | .inr _ => (arena.cell child).map Sum.inl

/-- Rank rescaling for the one-edge copied arena. -/
def edgeCopiedRank
    (arena : Arena ι) (child : ι) : CopyId ι → Nat
  | .inl node => 2 * arena.rank node + 2
  | .inr _ => 2 * arena.rank child + 1

theorem edgeCopiedRank_decreases
    (arena : Arena ι) (parent child : ι)
    (edge : IncomingEdge arena parent child) :
    ∀ {node fn arg},
      edgeCopiedCell arena parent child edge node = .app fn arg →
      edgeCopiedRank arena child fn < edgeCopiedRank arena child node ∧
        edgeCopiedRank arena child arg < edgeCopiedRank arena child node := by
  intro node fn arg hcell
  cases node with
  | inl old =>
      by_cases selected : old = parent
      · subst old
        cases edge with
        | left other atParent =>
            simp only [edgeCopiedCell, edgeCopiedRank, if_pos] at hcell ⊢
            cases hcell
            have decreases := arena.rank_decreases atParent
            constructor
            · have scaled := Nat.mul_lt_mul_of_pos_left decreases.1
                  (by decide : 0 < 2)
              exact Nat.lt_trans
                (Nat.add_lt_add_right scaled 1)
                (Nat.lt_add_of_pos_right (by decide : 0 < 1))
            · exact Nat.add_lt_add_right
                (Nat.mul_lt_mul_of_pos_left decreases.2
                  (by decide : 0 < 2)) 2
        | right other atParent =>
            simp only [edgeCopiedCell, edgeCopiedRank, if_pos] at hcell ⊢
            cases hcell
            have decreases := arena.rank_decreases atParent
            constructor
            · exact Nat.add_lt_add_right
                (Nat.mul_lt_mul_of_pos_left decreases.1
                  (by decide : 0 < 2)) 2
            · have scaled := Nat.mul_lt_mul_of_pos_left decreases.2
                  (by decide : 0 < 2)
              exact Nat.lt_trans
                (Nat.add_lt_add_right scaled 1)
                (Nat.lt_add_of_pos_right (by decide : 0 < 1))
      · cases oldCell : arena.cell old with
        | s =>
            simp only [edgeCopiedCell, selected, oldCell, Cell.map] at hcell
            simp at hcell
        | app oldFn oldArg =>
            simp only [edgeCopiedCell, selected, oldCell, Cell.map] at hcell
            cases hcell
            have decreases := arena.rank_decreases oldCell
            simp only [edgeCopiedRank]
            exact ⟨
              Nat.add_lt_add_right
                (Nat.mul_lt_mul_of_pos_left decreases.1
                  (by decide : 0 < 2)) 2,
              Nat.add_lt_add_right
                (Nat.mul_lt_mul_of_pos_left decreases.2
                  (by decide : 0 < 2)) 2⟩
  | inr fresh =>
      cases fresh
      cases childCell : arena.cell child with
      | s =>
          simp only [edgeCopiedCell, childCell, Cell.map] at hcell
          simp at hcell
      | app childFn childArg =>
          simp only [edgeCopiedCell, childCell, Cell.map] at hcell
          cases hcell
          have decreases := arena.rank_decreases childCell
          simp only [edgeCopiedRank]
          constructor
          · have scaled := Nat.mul_le_mul_left 2
                (Nat.succ_le_of_lt decreases.1)
            have base : 2 * arena.rank childFn + 2 ≤
                2 * arena.rank child := by
              simpa [Nat.mul_add] using scaled
            exact Nat.lt_of_le_of_lt base
              (Nat.lt_add_of_pos_right (by decide : 0 < 1))
          · have scaled := Nat.mul_le_mul_left 2
                (Nat.succ_le_of_lt decreases.2)
            have base : 2 * arena.rank childArg + 2 ≤
                2 * arena.rank child := by
              simpa [Nat.mul_add] using scaled
            exact Nat.lt_of_le_of_lt base
              (Nat.lt_add_of_pos_right (by decide : 0 < 1))

/-- The concrete one-allocation edge copy. -/
def edgeCopy
    (arena : Arena ι) (parent child : ι)
    (edge : IncomingEdge arena parent child) : Arena (CopyId ι) where
  root := .inl arena.root
  cell := edgeCopiedCell arena parent child edge
  rank := edgeCopiedRank arena child
  rank_decreases := edgeCopiedRank_decreases arena parent child edge

/-- The fresh record has exactly the old child's cell, modulo embedding. -/
theorem edgeCopy_cell_fresh
    (arena : Arena ι) (parent child : ι)
    (edge : IncomingEdge arena parent child) :
    (arena.edgeCopy parent child edge).cell (.inr ()) =
      (arena.cell child).map Sum.inl := by
  rfl

/-- Fuel-bounded simultaneous readback agreement for old and fresh nodes. -/
private theorem edgeCopy_readback_bounded
    (arena : Arena ι) (parent child : ι)
    (edge : IncomingEdge arena parent child) (fuel : Nat) :
    (∀ node, arena.rank node < fuel →
      (arena.edgeCopy parent child edge).readback (.inl node) =
        arena.readback node) ∧
    (arena.rank child < fuel →
      (arena.edgeCopy parent child edge).readback (.inr ()) =
        arena.readback child) := by
  induction fuel with
  | zero =>
      constructor
      · intro node within
        exact (Nat.not_lt_zero _ within).elim
      · intro within
        exact (Nat.not_lt_zero _ within).elim
  | succ fuel ih =>
      constructor
      · intro node within
        have nodeLe : arena.rank node ≤ fuel := Nat.le_of_lt_succ within
        by_cases selected : node = parent
        · subst node
          cases edge with
          | left arg atParent =>
              have oldCell := atParent
              have afterCell :
                  (arena.edgeCopy parent child (.left arg atParent)).cell
                      (.inl parent) = .app (.inr ()) (.inl arg) := by
                simp [edgeCopy, edgeCopiedCell]
              rw [(arena.edgeCopy parent child (.left arg atParent)).readback_of_cell_app
                    afterCell,
                arena.readback_of_cell_app oldCell]
              have decreases := arena.rank_decreases atParent
              rw [ih.2 (Nat.lt_of_lt_of_le decreases.1 nodeLe),
                ih.1 arg (Nat.lt_of_lt_of_le decreases.2 nodeLe)]
          | right fn atParent =>
              have oldCell := atParent
              have afterCell :
                  (arena.edgeCopy parent child (.right fn atParent)).cell
                      (.inl parent) = .app (.inl fn) (.inr ()) := by
                simp [edgeCopy, edgeCopiedCell]
              rw [(arena.edgeCopy parent child (.right fn atParent)).readback_of_cell_app
                    afterCell,
                arena.readback_of_cell_app oldCell]
              have decreases := arena.rank_decreases atParent
              rw [ih.1 fn (Nat.lt_of_lt_of_le decreases.1 nodeLe),
                ih.2 (Nat.lt_of_lt_of_le decreases.2 nodeLe)]
        · cases oldCell : arena.cell node with
          | s =>
              have afterCell :
                  (arena.edgeCopy parent child edge).cell (.inl node) = .s := by
                simp [edgeCopy, edgeCopiedCell, selected, oldCell, Cell.map]
              rw [(arena.edgeCopy parent child edge).readback_of_cell_s afterCell,
                arena.readback_of_cell_s oldCell]
          | app fn arg =>
              have afterCell :
                  (arena.edgeCopy parent child edge).cell (.inl node) =
                    .app (.inl fn) (.inl arg) := by
                simp [edgeCopy, edgeCopiedCell, selected, oldCell, Cell.map]
              rw [(arena.edgeCopy parent child edge).readback_of_cell_app afterCell,
                arena.readback_of_cell_app oldCell]
              have decreases := arena.rank_decreases oldCell
              rw [ih.1 fn (Nat.lt_of_lt_of_le decreases.1 nodeLe),
                ih.1 arg (Nat.lt_of_lt_of_le decreases.2 nodeLe)]
      · intro within
        have childLe : arena.rank child ≤ fuel := Nat.le_of_lt_succ within
        cases childCell : arena.cell child with
        | s =>
            have afterCell :
                (arena.edgeCopy parent child edge).cell (.inr ()) = .s := by
              simp [edgeCopy, edgeCopiedCell, childCell, Cell.map]
            rw [(arena.edgeCopy parent child edge).readback_of_cell_s afterCell,
              arena.readback_of_cell_s childCell]
        | app fn arg =>
            have afterCell :
                (arena.edgeCopy parent child edge).cell (.inr ()) =
                  .app (.inl fn) (.inl arg) := by
              simp [edgeCopy, edgeCopiedCell, childCell, Cell.map]
            rw [(arena.edgeCopy parent child edge).readback_of_cell_app afterCell,
              arena.readback_of_cell_app childCell]
            have decreases := arena.rank_decreases childCell
            rw [ih.1 fn (Nat.lt_of_lt_of_le decreases.1 childLe),
              ih.1 arg (Nat.lt_of_lt_of_le decreases.2 childLe)]

/-- Readback at every embedded old node is unchanged by one edge copy. -/
theorem edgeCopy_readback_old
    (arena : Arena ι) (parent child node : ι)
    (edge : IncomingEdge arena parent child) :
    (arena.edgeCopy parent child edge).readback (.inl node) =
      arena.readback node := by
  exact (arena.edgeCopy_readback_bounded parent child edge
    (arena.rank node + 1)).1 node (Nat.lt_succ_self _)

/-- Readback at the fresh node is exactly the copied child's old readback. -/
theorem edgeCopy_readback_fresh
    (arena : Arena ι) (parent child : ι)
    (edge : IncomingEdge arena parent child) :
    (arena.edgeCopy parent child edge).readback (.inr ()) =
      arena.readback child := by
  exact (arena.edgeCopy_readback_bounded parent child edge
    (arena.rank child + 1)).2 (Nat.lt_succ_self _)

/-- One concrete edge copy preserves distinguished-root readback exactly. -/
theorem edgeCopy_rootReadback
    (arena : Arena ι) (parent child : ι)
    (edge : IncomingEdge arena parent child) :
    (arena.edgeCopy parent child edge).rootReadback = arena.rootReadback := by
  exact arena.edgeCopy_readback_old parent child arena.root edge

/-- Any walk ending at the copied parent is preserved under old-node
embedding. -/
private theorem edgeCopy_follow_to_parent
    (arena : Arena ι) (parent child : ι)
    (edge : IncomingEdge arena parent child)
    (start : ι) (address : Address)
    (walk : arena.follow? start address = some parent) :
    (arena.edgeCopy parent child edge).follow? (.inl start) address =
      some (.inl parent) := by
  induction address generalizing start with
  | nil =>
      simp only [follow?_nil] at walk ⊢
      cases walk
      rfl
  | cons direction rest ih =>
      have startNe : start ≠ parent := by
        intro same
        subst start
        have decrease := arena.rank_lt_of_follow?_cons walk
        exact (Nat.lt_irrefl _ decrease)
      cases direction with
      | left =>
          cases hcell : arena.cell start with
          | s => simp [follow?, hcell] at walk
          | app fn arg =>
              have tailWalk : arena.follow? fn rest = some parent := by
                simpa only [follow?, hcell] using walk
              have afterCell :
                  (arena.edgeCopy parent child edge).cell (.inl start) =
                    .app (.inl fn) (.inl arg) := by
                simp [edgeCopy, edgeCopiedCell, startNe, hcell, Cell.map]
              simpa only [follow?, afterCell] using ih fn tailWalk
      | right =>
          cases hcell : arena.cell start with
          | s => simp [follow?, hcell] at walk
          | app fn arg =>
              have tailWalk : arena.follow? arg rest = some parent := by
                simpa only [follow?, hcell] using walk
              have afterCell :
                  (arena.edgeCopy parent child edge).cell (.inl start) =
                    .app (.inl fn) (.inl arg) := by
                simp [edgeCopy, edgeCopiedCell, startNe, hcell, Cell.map]
              simpa only [follow?, afterCell] using ih arg tailWalk

/-- Reflection of a copied-arena walk ending at the embedded parent. -/
private theorem edgeCopy_follow_to_parent_reflect
    (arena : Arena ι) (parent child : ι)
    (edge : IncomingEdge arena parent child)
    (start : ι) (address : Address)
    (walk : (arena.edgeCopy parent child edge).follow? (.inl start) address =
      some (.inl parent)) :
    arena.follow? start address = some parent := by
  induction address generalizing start with
  | nil =>
      simp only [follow?_nil, Option.some.injEq] at walk ⊢
      exact Sum.inl.inj walk
  | cons direction rest ih =>
      have startNe : start ≠ parent := by
        intro same
        subst start
        have decrease :=
          (arena.edgeCopy parent child edge).rank_lt_of_follow?_cons walk
        exact (Nat.lt_irrefl _ decrease)
      cases hcell : arena.cell start with
      | s =>
          have afterCell :
              (arena.edgeCopy parent child edge).cell (.inl start) = .s := by
            simp [edgeCopy, edgeCopiedCell, startNe, hcell, Cell.map]
          cases direction <;> simp [follow?, afterCell] at walk
      | app fn arg =>
          have afterCell :
              (arena.edgeCopy parent child edge).cell (.inl start) =
                .app (.inl fn) (.inl arg) := by
            simp [edgeCopy, edgeCopiedCell, startNe, hcell, Cell.map]
          cases direction with
          | left =>
              have tailWalk := ih fn (by
                simpa only [follow?, afterCell] using walk)
              simpa only [follow?, hcell] using tailWalk
          | right =>
              have tailWalk := ih arg (by
                simpa only [follow?, afterCell] using walk)
              simpa only [follow?, hcell] using tailWalk

/-- Root-relative specialization of endpoint preservation. -/
theorem edgeCopy_follow_parent
    (arena : Arena ι) (parent child : ι)
    (edge : IncomingEdge arena parent child) (address : Address)
    (walk : arena.follow? arena.root address = some parent) :
    (arena.edgeCopy parent child edge).follow?
        (arena.edgeCopy parent child edge).root address = some (.inl parent) := by
  exact arena.edgeCopy_follow_to_parent parent child edge arena.root address walk

/-- Appending the selected side to a parent occurrence reaches the one fresh
copy. -/
theorem edgeCopy_follow_fresh
    (arena : Arena ι) (parent child : ι)
    (edge : IncomingEdge arena parent child) (address : Address)
    (walk : arena.follow? arena.root address = some parent) :
    (arena.edgeCopy parent child edge).follow?
        (arena.edgeCopy parent child edge).root
        (address ++ [edge.direction]) = some (.inr ()) := by
  rw [(arena.edgeCopy parent child edge).follow?_append]
  rw [arena.edgeCopy_follow_parent parent child edge address walk]
  cases edge with
  | left arg atParent =>
      change
        (arena.edgeCopy parent child (.left arg atParent)).follow?
            (.inl parent) [Direction.left] = some (.inr ())
      have parentCell :
          (arena.edgeCopy parent child (.left arg atParent)).cell
              (.inl parent) = .app (.inr ()) (.inl arg) := by
        simp only [edgeCopy, edgeCopiedCell, if_pos]
      rw [follow?]
      rw [parentCell]
      rfl
  | right fn atParent =>
      change
        (arena.edgeCopy parent child (.right fn atParent)).follow?
            (.inl parent) [Direction.right] = some (.inr ())
      have parentCell :
          (arena.edgeCopy parent child (.right fn atParent)).cell
              (.inl parent) = .app (.inl fn) (.inr ()) := by
        simp only [edgeCopy, edgeCopiedCell, if_pos]
      rw [follow?]
      rw [parentCell]
      rfl

/-- Root-relative reflection for occurrences of the embedded parent. -/
theorem edgeCopy_follow_parent_reflect
    (arena : Arena ι) (parent child : ι)
    (edge : IncomingEdge arena parent child) (address : Address)
    (walk : (arena.edgeCopy parent child edge).follow?
      (arena.edgeCopy parent child edge).root address = some (.inl parent)) :
    arena.follow? arena.root address = some parent := by
  exact arena.edgeCopy_follow_to_parent_reflect parent child edge
    arena.root address walk

/-- The fresh node has precisely the supplied embedded parent/side as its
incoming arena edge. -/
theorem edgeCopy_uniqueIncoming_fresh
    (arena : Arena ι) (parent child : ι)
    (edge : IncomingEdge arena parent child) :
    UniqueIncoming (arena.edgeCopy parent child edge) (.inl parent)
      edge.direction (.inr ()) := by
  constructor
  · simp [edgeCopy]
  · cases edge with
    | left arg atParent =>
        exact ⟨.inl arg, by simp [edgeCopy, edgeCopiedCell]⟩
    | right fn atParent =>
        exact ⟨.inl fn, by simp [edgeCopy, edgeCopiedCell]⟩
  · intro source side points
    cases source with
    | inl old =>
        by_cases selected : old = parent
        · subst old
          cases edge with
          | left arg atParent =>
              cases side with
              | left => exact ⟨rfl, rfl⟩
              | right =>
                  rcases points with ⟨fn, h⟩
                  simp [edgeCopy, edgeCopiedCell] at h
          | right fn atParent =>
              cases side with
              | left =>
                  rcases points with ⟨arg, h⟩
                  simp [edgeCopy, edgeCopiedCell] at h
              | right => exact ⟨rfl, rfl⟩
        · cases oldCell : arena.cell old with
          | s =>
              cases side <;> rcases points with ⟨other, h⟩ <;>
                simp [edgeCopy, edgeCopiedCell, selected, oldCell, Cell.map] at h
          | app fn arg =>
              cases side <;> rcases points with ⟨other, h⟩ <;>
                simp [edgeCopy, edgeCopiedCell, selected, oldCell, Cell.map] at h
    | inr fresh =>
        cases fresh
        cases childCell : arena.cell child with
        | s =>
            cases side <;> rcases points with ⟨other, h⟩ <;>
              simp [edgeCopy, edgeCopiedCell, childCell, Cell.map] at h
        | app fn arg =>
            cases side <;> rcases points with ⟨other, h⟩ <;>
              simp [edgeCopy, edgeCopiedCell, childCell, Cell.map] at h

end Arena

end PureSFormal.CostModel
