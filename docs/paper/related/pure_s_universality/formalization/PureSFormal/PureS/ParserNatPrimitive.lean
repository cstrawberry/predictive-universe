import PureSFormal.PureS.ParserTerminalPrimitive

/-!
# Unary arithmetic for measured interfaces

Naturals are immutable unary constructor chains. Addition copies its first
operand and shares its second; subtraction reads both chains in lockstep and
shares the surviving suffix. Multiplication repeatedly performs that measured
addition. Constructor inspection, child access, allocation, and branch choices
are charged at each recursive clause. The `Result` wrapper and its operation
counter describe execution and are not runtime data of the arithmetic machine.
-/

namespace PureSFormal.PureS.ParserNatPrimitive

open ParserPrimitiveMachine ParserTerminalPrimitive

def add : Nat → Nat → Result Nat
  | 0, right => ⟨right, 1⟩
  | .succ left, right =>
      let rest := add left right
      ⟨Nat.succ rest.value, rest.operations + 4⟩

theorem add_value (left right : Nat) : (add left right).value = left + right := by
  induction left with
  | zero => exact (Nat.zero_add right).symm
  | succ left ih =>
      change Nat.succ (add left right).value = Nat.succ left + right
      rw [ih, Nat.succ_add]

theorem add_operations (left right : Nat) : (add left right).operations = 4 * left + 1 := by
  induction left with
  | zero => rfl
  | succ left ih =>
      change (add left right).operations + 4 = 4 * Nat.succ left + 1
      rw [ih, Nat.mul_succ]

def subtract : Nat → Nat → Result Nat
  | 0, _ => ⟨0, 2⟩
  | input@(.succ _), 0 => ⟨input, 2⟩
  | .succ left, .succ right =>
      let rest := subtract left right
      ⟨rest.value, rest.operations + 4⟩

theorem subtract_value (left right : Nat) : (subtract left right).value = left - right := by
  induction left generalizing right with
  | zero => exact (Nat.zero_sub right).symm
  | succ left ih =>
      cases right with
      | zero => rfl
      | succ right =>
          simpa only [subtract, Nat.succ_sub_succ_eq_sub] using ih right

theorem subtract_operations_le (left right : Nat) :
    (subtract left right).operations ≤ 4 * right + 2 := by
  induction left generalizing right with
  | zero => exact Nat.le_add_left _ _
  | succ left ih =>
      cases right with
      | zero => exact Nat.le_refl _
      | succ right =>
          change (subtract left right).operations + 4 ≤ 4 * Nat.succ right + 2
          have bound := Nat.add_le_add_right (ih right) 4
          simpa only [Nat.mul_succ, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using bound

def multiply (left : Nat) : Nat → Result Nat
  | 0 => ⟨0, 2⟩
  | .succ right =>
      let previous := multiply left right
      let next := add left previous.value
      ⟨next.value, previous.operations + next.operations + 6⟩

theorem multiply_value (left right : Nat) : (multiply left right).value = left * right := by
  induction right with
  | zero => rfl
  | succ right ih =>
      change (add left (multiply left right).value).value = left * Nat.succ right
      rw [add_value, ih, Nat.mul_succ, Nat.add_comm]

theorem multiply_operations (left right : Nat) :
    (multiply left right).operations = (4 * left + 7) * right + 2 := by
  induction right with
  | zero => rfl
  | succ right ih =>
      change (multiply left right).operations +
        (add left (multiply left right).value).operations + 6 = (4 * left + 7) * Nat.succ right + 2
      rw [ih, add_operations, Nat.mul_succ]
      simp only [show 7 = 1 + 6 by rfl, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

end PureSFormal.PureS.ParserNatPrimitive
