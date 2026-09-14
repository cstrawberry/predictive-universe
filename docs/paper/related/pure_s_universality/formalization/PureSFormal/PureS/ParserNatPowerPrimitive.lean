import PureSFormal.PureS.ParserNatPrimitive

/-!
# Unary powers of two by primitive construction

Each doubling copies one unary operand onto the other. Input constructor
observations, predecessor reads, and every allocated successor are charged.
The construction bound is linear in the exponent and the literal unary output.
-/

namespace PureSFormal.PureS.ParserNatPowerPrimitive

open ParserPrimitiveMachine ParserNatPrimitive

inductive AddExecution : Nat → Nat → Nat → Nat → Prop where
  | zero (right : Nat) : AddExecution 0 right right 1
  | succ {left right output operations : Nat}
      (rest : AddExecution left right output operations) :
      AddExecution (left + 1) right (output + 1) (operations + 4)

theorem add_execution (left right : Nat) :
    AddExecution left right (add left right).value (add left right).operations := by
  induction left with
  | zero => exact .zero right
  | succ left ih => exact .succ ih

def pow2 : Nat → Result Nat
  | 0 => ⟨1, 3⟩
  | .succ exponent =>
      let previous := pow2 exponent
      let doubled := add previous.value previous.value
      ⟨doubled.value, previous.operations + doubled.operations + 2⟩

inductive PowerExecution : Nat → Nat → Nat → Prop where
  | zero : PowerExecution 0 1 3
  | succ {exponent previous output previousOperations addOperations : Nat}
      (power : PowerExecution exponent previous previousOperations)
      (doubling : AddExecution previous previous output addOperations) :
      PowerExecution (exponent + 1) output (previousOperations + addOperations + 2)

theorem pow2_execution (exponent : Nat) :
    PowerExecution exponent (pow2 exponent).value (pow2 exponent).operations := by
  induction exponent with
  | zero => exact .zero
  | succ exponent ih => exact .succ ih (add_execution _ _)

theorem pow2_value (exponent : Nat) : (pow2 exponent).value = 2 ^ exponent := by
  induction exponent with
  | zero => rfl
  | succ exponent ih =>
      rw [pow2, add_value, ih, Nat.pow_succ, Nat.mul_two]

theorem pow2_operations_exact (exponent : Nat) :
    (pow2 exponent).operations + 1 = 4 * (pow2 exponent).value + 3 * exponent := by
  induction exponent with
  | zero => rfl
  | succ exponent ih =>
      change (pow2 exponent).operations +
        (add (pow2 exponent).value (pow2 exponent).value).operations + 2 + 1 =
        4 * (add (pow2 exponent).value (pow2 exponent).value).value + 3 * (exponent + 1)
      rw [add_operations, add_value, Nat.mul_add, Nat.mul_succ]
      calc
        _ = ((pow2 exponent).operations + 1) + 4 * (pow2 exponent).value + 3 := by
          simp only [show 3 = 1 + 2 by rfl, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
        _ = _ := by
          rw [ih]
          simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

theorem pow2_operations_le (exponent : Nat) :
    (pow2 exponent).operations ≤ 4 * 2 ^ exponent + 3 * exponent := by
  rw [← pow2_value, ← pow2_operations_exact]
  exact Nat.le_succ _

end PureSFormal.PureS.ParserNatPowerPrimitive
