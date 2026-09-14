import PureSFormal.PureS.ParserNatPrimitive

/-!
# Unary quotient and remainder

Each input constructor advances the remainder by one. A constructor comparison
with the radix either wraps to zero and increments the quotient, or retains
the quotient. Pair fields and surviving unary tails are shared. No native
division, remainder, or growing multiplication is executed. The twelve-operation
branch allowance covers input inspection and child access, pair-field reads,
successor allocation, the comparison branch, and the returned pair/zero fields.
-/

namespace PureSFormal.PureS.ParserNatDivisionPrimitive

open ParserPrimitiveMachine ParserTerminalPrimitive

def divMod (radix : Nat) : Nat → Result (Nat × Nat)
  | 0 => ⟨(0, 0), 3⟩
  | .succ count =>
      let previous := divMod radix count
      let successor := Nat.succ previous.value.2
      let same := equalIndex successor radix
      if same.value then
        ⟨(Nat.succ previous.value.1, 0), previous.operations + same.operations + 12⟩
      else
        ⟨(previous.value.1, successor), previous.operations + same.operations + 11⟩

theorem divMod_invariant (radix : Nat) (positive : 0 < radix) (count : Nat) :
    radix * (divMod radix count).value.1 + (divMod radix count).value.2 = count ∧
      (divMod radix count).value.2 < radix := by
  induction count with
  | zero => exact ⟨rfl, positive⟩
  | succ count ih =>
      rw [divMod]
      split
      next same =>
        have wraps := (equalIndex_value _ _).mp same
        change radix * Nat.succ (divMod radix count).value.1 + 0 = count + 1 ∧ 0 < radix
        constructor
        · rw [Nat.mul_succ, Nat.add_zero]
          calc
            radix * (divMod radix count).value.1 + radix =
                radix * (divMod radix count).value.1 + ((divMod radix count).value.2 + 1) :=
              congrArg (fun last => radix * (divMod radix count).value.1 + last) wraps.symm
            _ = count + 1 := by rw [← Nat.add_assoc, ih.1]
        · exact positive
      next different =>
        have noWrap : Nat.succ (divMod radix count).value.2 ≠ radix :=
          fun equal => different ((equalIndex_value _ _).mpr equal)
        change radix * (divMod radix count).value.1 + Nat.succ (divMod radix count).value.2 = count + 1 ∧
          Nat.succ (divMod radix count).value.2 < radix
        constructor
        · rw [Nat.add_succ, ih.1]
        · exact Nat.lt_of_le_of_ne (Nat.succ_le_of_lt ih.2) noWrap

theorem divMod_zero_radix (count : Nat) : (divMod 0 count).value = (0, count) := by
  induction count with
  | zero => rfl
  | succ count ih =>
      rw [divMod, ih]
      rfl

theorem divMod_value (radix count : Nat) :
    (divMod radix count).value = (count / radix, count % radix) := by
  cases radix with
  | zero =>
      rw [divMod_zero_radix, Nat.div_zero, Nat.mod_zero]
  | succ previous =>
      have positive := Nat.zero_lt_succ previous
      have invariant := divMod_invariant (previous + 1) positive count
      have quotient : count / (previous + 1) = (divMod (previous + 1) count).value.1 := by
        calc
          count / (previous + 1) =
              ((previous + 1) * (divMod (previous + 1) count).value.1 +
                (divMod (previous + 1) count).value.2) / (previous + 1) :=
            congrArg (fun input => input / (previous + 1)) invariant.1.symm
          _ = _ := by
            rw [Nat.add_comm, Nat.add_mul_div_left _ _ positive,
              Nat.div_eq_of_lt invariant.2, Nat.zero_add]
      have remainder : count % (previous + 1) = (divMod (previous + 1) count).value.2 := by
        calc
          count % (previous + 1) =
              ((previous + 1) * (divMod (previous + 1) count).value.1 +
                (divMod (previous + 1) count).value.2) % (previous + 1) :=
            congrArg (fun input => input % (previous + 1)) invariant.1.symm
          _ = _ := by rw [Nat.mul_add_mod_self_left, Nat.mod_eq_of_lt invariant.2]
      exact Prod.ext quotient.symm remainder.symm

theorem quotient_le (radix count : Nat) : (divMod radix count).value.1 ≤ count := by
  rw [divMod_value]
  exact Nat.div_le_self count radix

theorem remainder_lt (radix : Nat) (positive : 0 < radix) (count : Nat) :
    (divMod radix count).value.2 < radix :=
  (divMod_invariant radix positive count).2

theorem divMod_operations_le_positive (radix : Nat) (positive : 0 < radix) (count : Nat) :
    (divMod radix count).operations ≤ (4 * radix + 14) * count + 3 := by
  induction count with
  | zero => exact Nat.le_refl _
  | succ count ih =>
      have comparison := Nat.le_trans
        (equalIndex_operations_le (Nat.succ (divMod radix count).value.2) radix)
        (Nat.add_le_add_right (Nat.mul_le_mul_left 4
          (Nat.succ_le_of_lt (remainder_lt radix positive count))) 2)
      have total := Nat.add_le_add_right (Nat.add_le_add ih comparison) 12
      have bound : (divMod radix count).operations +
          (equalIndex (Nat.succ (divMod radix count).value.2) radix).operations + 12 ≤
            (4 * radix + 14) * Nat.succ count + 3 := by
        simpa only [show 14 = 2 + 12 by rfl, Nat.mul_succ,
          Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using total
      rw [divMod]
      split
      · exact bound
      · exact Nat.le_trans (Nat.add_le_add_left (by decide : 11 ≤ 12) _) bound

theorem divMod_zero_operations (count : Nat) :
    (divMod 0 count).operations = 13 * count + 3 := by
  induction count with
  | zero => rfl
  | succ count ih =>
      rw [divMod, divMod_zero_radix]
      change (divMod 0 count).operations + 2 + 11 = 13 * Nat.succ count + 3
      rw [ih, Nat.mul_succ]

theorem divMod_operations_le (radix count : Nat) :
    (divMod radix count).operations ≤ (4 * radix + 14) * count + 3 := by
  cases radix with
  | zero =>
      rw [divMod_zero_operations]
      exact Nat.add_le_add_right (Nat.mul_le_mul_right count (by decide : 13 ≤ 14)) 3
  | succ previous => exact divMod_operations_le_positive _ (Nat.zero_lt_succ previous) count

end PureSFormal.PureS.ParserNatDivisionPrimitive
