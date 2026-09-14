import PureSFormal.PureS.ParserTerminalPrimitive

/-!
# Unary phase computation

The period, horizon, and phase are immutable unary naturals. Remainder
computation consumes one horizon constructor at a time, increments a shared
remainder, and compares that successor with the period by constructor reads.
Wrapping allocates a zero constructor. The predecessor operation shares the
input's child reference. No native remainder, subtraction, or numeric equality
is executed by these evaluators; those operations occur only in their value
specifications and bounds.
-/

namespace PureSFormal.PureS.ParserPhasePrimitive

open ParserPrimitiveMachine ParserTerminalPrimitive

def remainder (period : Nat) : Nat → Result Nat
  | 0 => ⟨0, 2⟩
  | .succ count =>
      let previous := remainder period count
      let successor := Nat.succ previous.value
      let same := equalIndex successor period
      if same.value then
        ⟨0, previous.operations + same.operations + 5⟩
      else
        ⟨successor, previous.operations + same.operations + 4⟩

theorem remainder_value (period : Nat) (positive : 0 < period) (count : Nat) :
    (remainder period count).value = count % period := by
  induction count with
  | zero => exact (Nat.zero_mod period).symm
  | succ count ih =>
      rw [remainder]
      rw [ih]
      have bound := Nat.succ_le_of_lt (Nat.mod_lt count positive)
      rw [Nat.succ_eq_add_one, ← Nat.mod_add_mod count period 1]
      by_cases wraps : count % period + 1 = period
      · rw [if_pos ((equalIndex_value _ _).mpr wraps), wraps, Nat.mod_self]
      · have small : count % period + 1 < period := Nat.lt_of_le_of_ne bound wraps
        rw [if_neg (fun same => wraps ((equalIndex_value _ _).mp same)), Nat.mod_eq_of_lt small]

theorem remainder_lt (period : Nat) (positive : 0 < period) (count : Nat) :
    (remainder period count).value < period := by
  rw [remainder_value period positive]
  exact Nat.mod_lt count positive

theorem remainder_operations_le (period : Nat) (positive : 0 < period) (count : Nat) :
    (remainder period count).operations ≤ (4 * period + 7) * count + 2 := by
  induction count with
  | zero => exact Nat.le_refl _
  | succ count ih =>
      have comparison := Nat.le_trans
        (equalIndex_operations_le (Nat.succ (remainder period count).value) period)
        (Nat.add_le_add_right (Nat.mul_le_mul_left 4
          (Nat.succ_le_of_lt (remainder_lt period positive count))) 2)
      have total := Nat.add_le_add_right (Nat.add_le_add ih comparison) 5
      have bound : (remainder period count).operations +
          (equalIndex (Nat.succ (remainder period count).value) period).operations + 5 ≤
            (4 * period + 7) * Nat.succ count + 2 := by
        simpa only [show 7 = 2 + 5 by rfl, Nat.mul_succ,
          Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using total
      rw [remainder]
      split
      · exact bound
      · exact Nat.le_trans (Nat.add_le_add_left (by decide : 4 ≤ 5) _) bound

def expected (period : Nat) : Nat → Result Nat
  | 0 =>
      let output := remainder period 0
      ⟨output.value, output.operations + 1⟩
  | .succ count =>
      let output := remainder period count
      ⟨output.value, output.operations + 2⟩

theorem expected_value (period : Nat) (positive : 0 < period) (horizon : Nat) :
    (expected period horizon).value = (horizon - 1) % period := by
  cases horizon with
  | zero => exact remainder_value period positive 0
  | succ count => exact remainder_value period positive count

theorem expected_operations_le (period : Nat) (positive : 0 < period) (horizon : Nat) :
    (expected period horizon).operations ≤ (4 * period + 7) * horizon + 4 := by
  cases horizon with
  | zero => exact (by decide : 3 ≤ 4)
  | succ count =>
      have first := Nat.add_le_add_right (remainder_operations_le period positive count) 2
      have second := Nat.add_le_add_right (Nat.mul_le_mul_left (4 * period + 7)
        (Nat.le_succ count)) 4
      exact Nat.le_trans (by simpa only [show 4 = 2 + 2 by rfl, Nat.add_assoc] using! first) second

def check (period horizon phase : Nat) : Result Bool :=
  let wanted := expected period horizon
  let same := equalIndex wanted.value phase
  ⟨same.value, wanted.operations + same.operations⟩

theorem check_value (period : Nat) (positive : 0 < period) (horizon phase : Nat) :
    (check period horizon phase).value = true ↔ phase = (horizon - 1) % period := by
  change (equalIndex (expected period horizon).value phase).value = true ↔ _
  rw [equalIndex_value, expected_value period positive]
  exact ⟨Eq.symm, Eq.symm⟩

theorem check_operations_le (period : Nat) (positive : 0 < period) (horizon phase : Nat) :
    (check period horizon phase).operations ≤ (4 * period + 12) * (horizon + 1) := by
  have wanted : (expected period horizon).value ≤ period := by
    rw [expected_value period positive]
    exact Nat.le_of_lt (Nat.mod_lt _ positive)
  have comparison := Nat.le_trans (equalIndex_operations_le (expected period horizon).value phase)
    (Nat.add_le_add_right (Nat.mul_le_mul_left 4 wanted) 2)
  have first := Nat.add_le_add (expected_operations_le period positive horizon) comparison
  have second : (4 * period + 7) * horizon + 4 + (4 * period + 2) ≤
      (4 * period + 12) * horizon + (4 * period + 12) := by
    have bound := Nat.add_le_add
      (Nat.mul_le_mul_right horizon (Nat.add_le_add_left (by decide : 7 ≤ 12) (4 * period)))
      (Nat.add_le_add_left (by decide : 6 ≤ 12) (4 * period))
    simpa only [show 6 = 4 + 2 by rfl, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using bound
  exact Nat.le_trans first (by simpa only [Nat.mul_add, Nat.mul_one] using second)

end PureSFormal.PureS.ParserPhasePrimitive
