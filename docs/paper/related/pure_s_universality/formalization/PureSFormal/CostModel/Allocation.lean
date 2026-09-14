import PureSFormal.CostModel.PathLift

/-!
# Exact allocation ledger

One copy allocates one arena node and one shared contraction allocates two.
The relation below records only this orthogonal accounting component; the
arena mutation and readback theorem for contraction live in
`ConcreteContraction`.
-/

namespace PureSFormal.CostModel

/-- The two charged store mutations. -/
inductive MoveKind where
  | copy
  | contract
  deriving BEq, DecidableEq, Repr

namespace MoveKind

/-- Number of freshly allocated nodes. -/
@[simp]
def allocations : MoveKind → Nat
  | .copy => 1
  | .contract => 2

theorem allocations_pos (kind : MoveKind) : 0 < kind.allocations := by
  cases kind <;> decide

theorem allocations_le_two (kind : MoveKind) : kind.allocations ≤ 2 := by
  cases kind <;> decide

end MoveKind

/-- Exact-length allocation trace. -/
inductive AllocationRun : Nat → Nat → Nat → Prop where
  | refl (initial : Nat) : AllocationRun 0 initial initial
  | tail {moves initial current : Nat} :
      AllocationRun moves initial current →
      (kind : MoveKind) →
      AllocationRun (moves + 1) initial (current + kind.allocations)

namespace AllocationRun

/-- Exact accumulated allocation count for a listed move sequence. -/
theorem target_eq_initial_add_sum
    (kinds : List MoveKind) (initial : Nat) :
    AllocationRun kinds.length initial
      (initial + (kinds.map MoveKind.allocations).sum) := by
  induction kinds with
  | nil => simpa using AllocationRun.refl initial
  | cons kind rest ih =>
      have tail := AllocationRun.tail ih kind
      simpa [List.map, List.sum, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
        using tail

/-- After `moves` charged mutations, at most `2*moves` nodes have been
allocated.  The count includes unreachable arena nodes; no garbage collection
is assumed. -/
theorem target_le_initial_add_twice_moves
    {moves initial target : Nat}
    (run : AllocationRun moves initial target) :
    target ≤ initial + 2 * moves := by
  induction run with
  | refl => simp
  | @tail moves initial current hrun kind ih =>
      have charge := kind.allocations_le_two
      exact Nat.le_trans (Nat.add_le_add ih charge) <| by
        simp only [Nat.mul_add, Nat.mul_one]
        simp [Nat.add_assoc]

end AllocationRun

end PureSFormal.CostModel
