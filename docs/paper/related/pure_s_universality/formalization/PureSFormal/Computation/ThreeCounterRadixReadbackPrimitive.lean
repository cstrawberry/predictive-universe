import PureSFormal.Computation.ThreeCounterCookReadback
import PureSFormal.Computation.DeterministicTapePaddingConstructionMachine

/-!
# Primitive radix extraction with malformed-input reconstruction bounds

Each repeated halving uses unary division. The reconstructed power is bounded
by the observed multiplicity even when it is not a power of two; zero receives
the explicit one-cell allowance required by the total reference decoder.
-/
namespace PureSFormal.Computation.ThreeCounterRadixReadbackPrimitive

open PureSFormal.PureS
open PureSFormal.PureS.ParserPrimitiveMachine (Result)
open ThreeCounterTagOutputBoundary

def exponent : Nat → Nat → Result Nat
  | 0, _ => ⟨0, 2⟩
  | .succ fuel, value =>
      match value with
      | 0 => ⟨0, 4⟩
      | 1 => ⟨0, 5⟩
      | .succ (.succ _) =>
          let quotient := ParserNatDivisionPrimitive.divMod 2 value
          let tail := exponent fuel quotient.value.1
          ⟨.succ tail.value, quotient.operations + tail.operations + 10⟩

theorem exponent_value (fuel value : Nat) : (exponent fuel value).value = radixExponentAux fuel value := by
  induction fuel generalizing value with
  | zero => rfl
  | succ fuel ih =>
      cases value with
      | zero => rfl
      | succ value => cases value with
        | zero => rfl
        | succ value =>
            simp only [exponent, ParserNatDivisionPrimitive.divMod_value, ih, radixExponentAux]
            have notSmall : ¬ value + 2 ≤ 1 := fun bound =>
              Nat.not_succ_le_zero value (Nat.le_of_succ_le_succ bound)
            rw [if_neg notSmall]

theorem exponent_operations_le (fuel value limit : Nat) (bounded : value ≤ limit) :
    (exponent fuel value).operations ≤ (fuel + 1) * (22 * limit + 18) := by
  induction fuel generalizing value with
  | zero =>
      exact Nat.le_trans (by decide : 2 ≤ 18)
        (by simpa only [Nat.zero_add, Nat.one_mul] using Nat.le_add_left 18 (22 * limit))
  | succ fuel ih =>
      have lower : 5 ≤ (fuel + 1 + 1) * (22 * limit + 18) :=
        Nat.le_trans (by decide : 5 ≤ 18) (Nat.le_trans (Nat.le_add_left 18 (22 * limit))
          (Nat.le_mul_of_pos_left _ (Nat.zero_lt_succ _)))
      cases value with
      | zero => exact Nat.le_trans (by decide : 4 ≤ 5) lower
      | succ value => cases value with
        | zero => exact lower
        | succ value =>
            have divided := Nat.le_trans (ParserNatDivisionPrimitive.divMod_operations_le 2 (value + 2))
              (Nat.add_le_add_right (Nat.mul_le_mul_left 22 bounded) 3)
            have tail := ih (ParserNatDivisionPrimitive.divMod 2 (value + 2)).value.1
              (Nat.le_trans (ParserNatDivisionPrimitive.quotient_le _ _) bounded)
            have bound := Nat.add_le_add_right (Nat.add_le_add divided tail) 10
            apply Nat.le_trans bound
            have step : 22 * limit + 3 + 10 ≤ 22 * limit + 18 :=
              Nat.add_le_add_left (by decide : 3 + 10 ≤ 18) (22 * limit)
            have combined := Nat.add_le_add_left step ((fuel + 1) * (22 * limit + 18))
            simpa only [Nat.add_mul, Nat.one_mul, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using combined

theorem exponent_power_le_positive (fuel value : Nat) (positive : 0 < value) :
    2 ^ radixExponentAux fuel value ≤ value := by
  induction fuel generalizing value with
  | zero => exact positive
  | succ fuel ih =>
      unfold radixExponentAux
      split
      · exact positive
      next notSmall =>
        have atLeastTwo : 2 ≤ value := Nat.lt_of_not_ge notSmall
        have quotientPositive : 0 < value / 2 :=
          (Nat.le_div_iff_mul_le (by decide : 0 < 2)).mpr (by simpa only [Nat.one_mul] using atLeastTwo)
        rw [Nat.pow_succ]
        exact Nat.le_trans (Nat.mul_le_mul_right 2 (ih (value / 2) quotientPositive)) (Nat.div_mul_le_self value 2)

theorem exponent_power_le (fuel value : Nat) : 2 ^ radixExponentAux fuel value ≤ value + 1 := by
  cases value with
  | zero => cases fuel <;> exact Nat.le_refl _
  | succ value => exact Nat.le_trans (exponent_power_le_positive fuel (value + 1) (Nat.zero_lt_succ value)) (Nat.le_add_right _ _)

theorem radixExponent_power_le (value : Nat) : 2 ^ radixExponent value ≤ value + 1 :=
  exponent_power_le value value

theorem radixExponent_le (value : Nat) : radixExponent value ≤ value + 1 :=
  Nat.le_trans (value_le_radix _) (radixExponent_power_le value)

def read (value : Nat) : Result Nat := exponent value value

theorem read_value (value : Nat) : (read value).value = radixExponent value := exponent_value value value

theorem read_operations_le (value : Nat) : (read value).operations ≤ (value + 1) * (22 * value + 18) :=
  exponent_operations_le value value value (Nat.le_refl _)

inductive ExponentExecution : Nat → Nat → Nat → Nat → Prop where
  | exhausted (value : Nat) : ExponentExecution 0 value 0 2
  | zero (fuel : Nat) : ExponentExecution (.succ fuel) 0 0 4
  | one (fuel : Nat) : ExponentExecution (.succ fuel) 1 0 5
  | halve {fuel value quotient remainder output divisionOperations tailOperations : Nat}
      (division : DeterministicTapeDecodeConstructionMachine.DivisionExecution 2 (value + 2) (quotient, remainder) divisionOperations)
      (tail : ExponentExecution fuel quotient output tailOperations) :
      ExponentExecution (.succ fuel) (value + 2) (.succ output) (divisionOperations + tailOperations + 10)

theorem exponent_execution (fuel value : Nat) :
    ExponentExecution fuel value (exponent fuel value).value (exponent fuel value).operations := by
  induction fuel generalizing value with
  | zero => exact .exhausted value
  | succ fuel ih => cases value with
    | zero => exact .zero fuel
    | succ value => cases value with
      | zero => exact .one fuel
      | succ value => exact .halve (DeterministicTapeDecodeConstructionMachine.division_execution _ _) (ih _)

theorem read_execution (value : Nat) : ExponentExecution value value (read value).value (read value).operations :=
  exponent_execution value value

end PureSFormal.Computation.ThreeCounterRadixReadbackPrimitive
