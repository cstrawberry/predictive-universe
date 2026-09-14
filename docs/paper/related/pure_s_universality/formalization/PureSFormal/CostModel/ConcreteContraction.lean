import PureSFormal.CostModel.SharedDevelopment

/-!
# Concrete two-node shared contraction

The contracted arena extends the old identifier type by two fresh identifiers.
The old selected node is overwritten by an application of those identifiers;
they store `app(x,z)` and `app(y,z)`.  Every other old cell is preserved after
embedding.  Ranks are rescaled so the extended arena remains acyclic.
-/

namespace PureSFormal.CostModel

open PureSFormal.PureS

namespace Cell

def map (f : ι → κ) : Cell ι → Cell κ
  | .s => .s
  | .app fn arg => .app (f fn) (f arg)

end Cell

/-- `false` names `app(x,z)` and `true` names `app(y,z)`. -/
abbrev ContractId (ι : Type) := Sum ι Bool

namespace Arena

variable {ι : Type} [DecidableEq ι]

def contractedCell
    (arena : Arena ι) (redexNode : ι)
    (view : RedexView arena redexNode) : ContractId ι → Cell (ContractId ι)
  | .inl node =>
      if node = redexNode then .app (.inr false) (.inr true)
      else (arena.cell node).map Sum.inl
  | .inr false => .app (.inl view.x) (.inl view.z)
  | .inr true => .app (.inl view.y) (.inl view.z)

def contractedRank
    (arena : Arena ι) (redexNode : ι)
    (view : RedexView arena redexNode) : ContractId ι → Nat
  | .inl node => 3 * arena.rank node + 2
  | .inr false => 3 * max (arena.rank view.x) (arena.rank view.z) + 3
  | .inr true => 3 * max (arena.rank view.y) (arena.rank view.z) + 3

theorem contractedRank_decreases
    (arena : Arena ι) (redexNode : ι)
    (view : RedexView arena redexNode) :
    ∀ {node fn arg},
      contractedCell arena redexNode view node = .app fn arg →
      contractedRank arena redexNode view fn <
          contractedRank arena redexNode view node ∧
        contractedRank arena redexNode view arg <
          contractedRank arena redexNode view node := by
  intro node fn arg hcell
  cases node with
  | inl old =>
      by_cases selected : old = redexNode
      · subst old
        simp only [contractedCell, contractedRank, if_pos] at hcell ⊢
        cases hcell
        change
          3 * max (arena.rank view.x) (arena.rank view.z) + 3 <
              3 * arena.rank redexNode + 2 ∧
            3 * max (arena.rank view.y) (arena.rank view.z) + 3 <
              3 * arena.rank redexNode + 2
        have xz : max (arena.rank view.x) (arena.rank view.z) < arena.rank redexNode :=
          Nat.max_lt.mpr ⟨view.x_rank_lt_redex, view.z_rank_lt_redex⟩
        have yz : max (arena.rank view.y) (arena.rank view.z) < arena.rank redexNode :=
          Nat.max_lt.mpr ⟨view.y_rank_lt_redex, view.z_rank_lt_redex⟩
        constructor
        · have scaled := Nat.mul_le_mul_left 3 (Nat.succ_le_of_lt xz)
          have base :
              3 * max (arena.rank view.x) (arena.rank view.z) + 3 ≤
                3 * arena.rank redexNode := by
            simpa [Nat.mul_add] using scaled
          exact Nat.lt_of_le_of_lt base
            (Nat.lt_add_of_pos_right (by decide : 0 < 2))
        · have scaled := Nat.mul_le_mul_left 3 (Nat.succ_le_of_lt yz)
          have base :
              3 * max (arena.rank view.y) (arena.rank view.z) + 3 ≤
                3 * arena.rank redexNode := by
            simpa [Nat.mul_add] using scaled
          exact Nat.lt_of_le_of_lt base
            (Nat.lt_add_of_pos_right (by decide : 0 < 2))
      · cases oldCell : arena.cell old with
        | s =>
            simp only [contractedCell, selected, oldCell, Cell.map] at hcell
            simp at hcell
        | app oldFn oldArg =>
            simp only [contractedCell, selected, oldCell, Cell.map] at hcell
            cases hcell
            have decreases := arena.rank_decreases oldCell
            simp only [contractedRank]
            exact ⟨
              Nat.add_lt_add_right
                (Nat.mul_lt_mul_of_pos_left decreases.1 (by decide : 0 < 3)) 2,
              Nat.add_lt_add_right
                (Nat.mul_lt_mul_of_pos_left decreases.2 (by decide : 0 < 3)) 2⟩
  | inr fresh =>
      cases fresh with
      | false =>
          simp only [contractedCell] at hcell
          cases hcell
          simp only [contractedRank]
          have xBound := Nat.le_max_left (arena.rank view.x) (arena.rank view.z)
          have zBound := Nat.le_max_right (arena.rank view.x) (arena.rank view.z)
          constructor
          · exact Nat.lt_of_le_of_lt
              (Nat.add_le_add_right (Nat.mul_le_mul_left 3 xBound) 2)
              (Nat.add_lt_add_left (by decide : 2 < 3) _)
          · exact Nat.lt_of_le_of_lt
              (Nat.add_le_add_right (Nat.mul_le_mul_left 3 zBound) 2)
              (Nat.add_lt_add_left (by decide : 2 < 3) _)
      | true =>
          simp only [contractedCell] at hcell
          cases hcell
          simp only [contractedRank]
          have yBound := Nat.le_max_left (arena.rank view.y) (arena.rank view.z)
          have zBound := Nat.le_max_right (arena.rank view.y) (arena.rank view.z)
          constructor
          · exact Nat.lt_of_le_of_lt
              (Nat.add_le_add_right (Nat.mul_le_mul_left 3 yBound) 2)
              (Nat.add_lt_add_left (by decide : 2 < 3) _)
          · exact Nat.lt_of_le_of_lt
              (Nat.add_le_add_right (Nat.mul_le_mul_left 3 zBound) 2)
              (Nat.add_lt_add_left (by decide : 2 < 3) _)

/-- The concrete two-allocation shared contraction. -/
def contract
    (arena : Arena ι) (redexNode : ι)
    (view : RedexView arena redexNode) : Arena (ContractId ι) where
  root := .inl arena.root
  cell := contractedCell arena redexNode view
  rank := contractedRank arena redexNode view
  rank_decreases := contractedRank_decreases arena redexNode view

/-- Every old node below the selected redex rank is unchanged by the concrete
contraction, including its unfolded readback. -/
theorem contract_readback_of_rank_lt
    (arena : Arena ι) (redexNode : ι)
    (view : RedexView arena redexNode) (node : ι)
    (lower : arena.rank node < arena.rank redexNode) :
    (arena.contract redexNode view).readback (.inl node) = arena.readback node := by
  have notSelected : node ≠ redexNode := by
    intro same
    subst node
    exact Nat.lt_irrefl _ lower
  cases hcell : arena.cell node with
  | s =>
      have afterCell :
          (arena.contract redexNode view).cell (.inl node) = .s := by
        simp [contract, contractedCell, notSelected, hcell, Cell.map]
      rw [(arena.contract redexNode view).readback_of_cell_s afterCell,
        arena.readback_of_cell_s hcell]
  | app fn arg =>
      have afterCell :
          (arena.contract redexNode view).cell (.inl node) =
            .app (.inl fn) (.inl arg) := by
        simp [contract, contractedCell, notSelected, hcell, Cell.map]
      rw [(arena.contract redexNode view).readback_of_cell_app afterCell,
        arena.readback_of_cell_app hcell]
      have decreases := arena.rank_decreases hcell
      rw [arena.contract_readback_of_rank_lt redexNode view fn
          (Nat.lt_trans decreases.1 lower),
        arena.contract_readback_of_rank_lt redexNode view arg
          (Nat.lt_trans decreases.2 lower)]
termination_by arena.rank node
decreasing_by
  · exact (arena.rank_decreases hcell).1
  · exact (arena.rank_decreases hcell).2

/-- Concrete contraction readback at the selected node is the pure-S
contractum. -/
theorem contract_readback_at_redex
    (arena : Arena ι) (redexNode : ι)
    (view : RedexView arena redexNode) :
    (arena.contract redexNode view).readback (.inl redexNode) = view.contractum := by
  let after := arena.contract redexNode view
  have rootCell : after.cell (.inl redexNode) = .app (.inr false) (.inr true) := by
    simp [after, contract, contractedCell]
  have leftCell : after.cell (.inr false) = .app (.inl view.x) (.inl view.z) := by
    simp [after, contract, contractedCell]
  have rightCell : after.cell (.inr true) = .app (.inl view.y) (.inl view.z) := by
    simp [after, contract, contractedCell]
  rw [after.readback_of_cell_app rootCell,
    after.readback_of_cell_app leftCell,
    after.readback_of_cell_app rightCell]
  rw [arena.contract_readback_of_rank_lt redexNode view view.x view.x_rank_lt_redex,
    arena.contract_readback_of_rank_lt redexNode view view.y view.y_rank_lt_redex,
    arena.contract_readback_of_rank_lt redexNode view view.z view.z_rank_lt_redex]
  rfl

/-- Fuel-bounded form of concrete-contraction readback agreement.  Structural
recursion on `fuel` keeps the public theorem within the package's explicit
axiom allowlist. -/
private theorem contract_readback_eq_develop_bounded
    (arena : Arena ι) (redexNode : ι)
    (view : RedexView arena redexNode) (fuel : Nat) (node : ι)
    (within : arena.rank node < fuel) :
    (arena.contract redexNode view).readback (.inl node) =
      arena.develop redexNode view node := by
  induction fuel generalizing node with
  | zero => exact (Nat.not_lt_zero _ within).elim
  | succ fuel ih =>
      by_cases selected : node = redexNode
      · subst node
        rw [arena.contract_readback_at_redex redexNode view, develop_at_redex]
      · cases hcell : arena.cell node with
        | s =>
            have afterCell :
                (arena.contract redexNode view).cell (.inl node) = .s := by
              simp [contract, contractedCell, selected, hcell, Cell.map]
            rw [(arena.contract redexNode view).readback_of_cell_s afterCell]
            rw [develop]
            simp only [selected, ↓reduceIte, hcell]
            rw [hcell]
        | app fn arg =>
            have afterCell :
                (arena.contract redexNode view).cell (.inl node) =
                  .app (.inl fn) (.inl arg) := by
              simp [contract, contractedCell, selected, hcell, Cell.map]
            rw [(arena.contract redexNode view).readback_of_cell_app afterCell]
            rw [develop]
            simp only [selected, ↓reduceIte, hcell]
            rw [hcell]
            change
              PureS.Term.app
                  ((arena.contract redexNode view).readback (.inl fn))
                  ((arena.contract redexNode view).readback (.inl arg)) =
                PureS.Term.app (arena.develop redexNode view fn)
                  (arena.develop redexNode view arg)
            have nodeLeFuel : arena.rank node ≤ fuel := Nat.le_of_lt_succ within
            have decreases := arena.rank_decreases hcell
            have fnWithin : arena.rank fn < fuel :=
              Nat.lt_of_lt_of_le decreases.1 nodeLeFuel
            have argWithin : arena.rank arg < fuel :=
              Nat.lt_of_lt_of_le decreases.2 nodeLeFuel
            rw [ih fn fnWithin, ih arg argWithin]

/-- Readback of every embedded old node is exactly the simultaneous
development of all old occurrences of the selected node. -/
theorem contract_readback_eq_develop
    (arena : Arena ι) (redexNode : ι)
    (view : RedexView arena redexNode) (node : ι) :
    (arena.contract redexNode view).readback (.inl node) =
      arena.develop redexNode view node :=
  arena.contract_readback_eq_develop_bounded redexNode view
    (arena.rank node + 1) node (Nat.lt_succ_self _)

/-- A concrete shared contraction is sound for ordinary pure-S reachability. -/
theorem contract_root_steps
    (arena : Arena ι) (redexNode : ι)
    (view : RedexView arena redexNode) :
    PureS.Steps arena.rootReadback
      (arena.contract redexNode view).rootReadback := by
  have development := arena.readback_steps_develop redexNode view arena.root
  have equality :
      (arena.contract redexNode view).rootReadback =
        arena.develop redexNode view arena.root := by
    exact arena.contract_readback_eq_develop redexNode view arena.root
  rw [equality]
  exact development

end Arena

end PureSFormal.CostModel
