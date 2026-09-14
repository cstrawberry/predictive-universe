import PureSFormal.Computation.CookWordPrimitive
import PureSFormal.PureS.ParserNatDivisionPrimitive

/-!
# Primitive radix-eight counter decoding

Counter values are immutable unary naturals. Division, remainder, subtraction,
and bounded digit lookup use counted constructor operations. Recursive inverse
calls consume strictly smaller numbers; no native numeric operation is hidden
in their execution cost. The fixed eight-entry digit table is prepared data.
-/

namespace PureSFormal.Computation.CookCounterPrimitive

open PureS PureS.ParserPrimitiveMachine
open PureS.ParserRoutePrimitive (andThen charge andThen_value andThen_operations_le)
open PureS.ParserNatDivisionPrimitive (divMod divMod_value quotient_le remainder_lt divMod_operations_le)

def digitTable : List (Option Cook.MachineSymbol) :=
  [none, none, some .s5, some .s4, some .s3, some .s2, some .s1, some .s0]

def digit (count : Nat) : Result (Option Cook.MachineSymbol) :=
  let selected := CookWordPrimitive.lookup digitTable count
  match selected.value with
  | none => ⟨none, selected.operations + 2⟩
  | some result => ⟨result, selected.operations + 2⟩

theorem digit_value (count : Nat) : (digit count).value = Cook.symbolOfDigitWeight? count := by
  cases count with
  | zero => rfl
  | succ count =>
      cases count with
      | zero => rfl
      | succ count =>
          cases count with
          | zero => rfl
          | succ count =>
              cases count with
              | zero => rfl
              | succ count =>
                  cases count with
                  | zero => rfl
                  | succ count =>
                      cases count with
                      | zero => rfl
                      | succ count =>
                          cases count with
                          | zero => rfl
                          | succ count => cases count <;> rfl

theorem digit_operations_le (count : Nat) : (digit count).operations ≤ 36 := by
  have bound := Nat.add_le_add_right (CookWordPrimitive.lookup_operations_le digitTable count) 2
  unfold digit
  dsimp only
  split <;> exact bound

def stepSpec (count : Nat) : Option (Cook.MachineSymbol × Nat) :=
  if count % 8 = 0 then
    let units := count / 8
    let remainder := units % 8
    match Cook.symbolOfDigitWeight? remainder with
    | none => none
    | some symbol => some (symbol, units - remainder)
  else none

def step (count : Nat) : Result (Option (Cook.MachineSymbol × Nat)) :=
  let first := divMod 8 count
  match first.value.2 with
  | .succ _ => ⟨none, first.operations + 3⟩
  | 0 =>
      let units := first.value.1
      let second := divMod 8 units
      let remainder := second.value.2
      let symbol := digit remainder
      match symbol.value with
      | none => ⟨none, first.operations + second.operations + symbol.operations + 6⟩
      | some decoded =>
          let next := ParserNatPrimitive.subtract units remainder
          ⟨some (decoded, next.value),
            first.operations + second.operations + symbol.operations + next.operations + 8⟩

theorem step_value (count : Nat) : (step count).value = stepSpec count := by
  unfold step stepSpec
  dsimp only
  rw [divMod_value]
  cases remainder : count % 8 with
  | zero =>
      dsimp only
      rw [divMod_value, digit_value]
      cases Cook.symbolOfDigitWeight? (count / 8 % 8) with
      | none => rfl
      | some symbol =>
          dsimp only
          rw [ParserNatPrimitive.subtract_value]
          rfl
  | succ remainder => rfl

theorem step_decrease {count : Nat} {parsed : Cook.MachineSymbol × Nat}
    (positive : 0 < count) (found : (step count).value = some parsed) : parsed.2 < count := by
  rw [step_value] at found
  unfold stepSpec at found
  split at found
  · dsimp only at found
    cases decoded : Cook.symbolOfDigitWeight? (count / 8 % 8) with
    | none => rw [decoded] at found; cases found
    | some symbol =>
        rw [decoded] at found
        cases found
        exact Nat.lt_of_le_of_lt (Nat.sub_le _ _) (Nat.div_lt_self positive (by decide : 1 < 8))
  · cases found

theorem step_operations_le (count : Nat) : (step count).operations ≤ 100 * count + 128 := by
  have first : (divMod 8 count).operations ≤ 46 * count + 3 := divMod_operations_le 8 count
  have second : (divMod 8 (divMod 8 count).value.1).operations ≤ 46 * count + 3 :=
    Nat.le_trans (divMod_operations_le 8 (divMod 8 count).value.1)
      (Nat.add_le_add_right (Nat.mul_le_mul_left 46 (quotient_le 8 count)) 3)
  have symbol := digit_operations_le (divMod 8 (divMod 8 count).value.1).value.2
  have subtraction : (ParserNatPrimitive.subtract (divMod 8 count).value.1
      (divMod 8 (divMod 8 count).value.1).value.2).operations ≤ 34 :=
    Nat.le_trans (ParserNatPrimitive.subtract_operations_le _ _)
      (Nat.add_le_add_right (Nat.mul_le_mul_left 4
        (Nat.le_of_lt (remainder_lt 8 (by decide) (divMod 8 count).value.1))) 2)
  have full := Nat.add_le_add_right (Nat.add_le_add (Nat.add_le_add (Nat.add_le_add first second) symbol) subtraction) 8
  have ceiling : 46 * count + 3 + (46 * count + 3) + 36 + 34 + 8 ≤ 100 * count + 128 := by
    have bound := Nat.add_le_add (Nat.mul_le_mul_right count (by decide : 46 + 46 ≤ 100))
      (by decide : 3 + 3 + 36 + 34 + 8 ≤ 128)
    simpa only [Nat.add_mul, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using bound
  unfold step
  dsimp only
  split
  · exact Nat.le_trans (Nat.add_le_add_right first 3)
      (by simpa only [Nat.add_assoc] using (Nat.add_le_add
        (Nat.mul_le_mul_right count (by decide : 46 ≤ 100)) (by decide : 3 + 3 ≤ 128)))
  · split
    · have partialBound := Nat.add_le_add
        (Nat.le_add_right ((divMod 8 count).operations +
          (divMod 8 (divMod 8 count).value.1).operations +
          (digit (divMod 8 (divMod 8 count).value.1).value.2).operations)
          (ParserNatPrimitive.subtract (divMod 8 count).value.1
            (divMod 8 (divMod 8 count).value.1).value.2).operations)
        (by decide : 6 ≤ 8)
      exact Nat.le_trans partialBound (Nat.le_trans full ceiling)
    · exact Nat.le_trans full ceiling

def decode (stop count : Nat) : Result (Option (List Cook.MachineSymbol)) :=
  let completed := ParserTerminalPrimitive.equalIndex stop count
  if completed.value then
    ⟨some [], completed.operations + 3⟩
  else
    match hcount : count with
    | 0 => ⟨none, completed.operations + 3⟩
    | .succ _previous =>
        let next := step count
        match found : next.value with
        | none => ⟨none, completed.operations + next.operations + 4⟩
        | some parsed =>
            let inner := decode stop parsed.2
            let output := andThen inner fun remaining => ⟨some (parsed.1 :: remaining), 2⟩
            ⟨output.value, completed.operations + next.operations + 6 + output.operations⟩
termination_by count
decreasing_by
  subst count
  exact step_decrease (Nat.zero_lt_succ _previous) found

theorem decode_value_equation (stop count : Nat) :
    (decode stop count).value =
      if count = stop then some [] else if count = 0 then none else
        (step count).value.bind fun parsed => (decode stop parsed.2).value.map (List.cons parsed.1) := by
  rw [decode.eq_def]
  dsimp only
  by_cases completed : count = stop
  · rw [if_pos ((ParserTerminalPrimitive.equalIndex_value _ _).mpr completed.symm), if_pos completed]
  · rw [if_neg (fun accepted => completed ((ParserTerminalPrimitive.equalIndex_value _ _).mp accepted).symm),
      if_neg completed]
    cases count with
    | zero => rfl
    | succ count =>
        rw [if_neg (Nat.succ_ne_zero count)]
        cases found : (step (.succ count)).value with
        | none => rfl
        | some parsed =>
            dsimp only [Option.bind]
            rw [andThen_value]
            cases (decode stop parsed.2).value <;> rfl

theorem right_step (count : Nat) (nonzero : count ≠ 0) :
    Cook.decodeRightCounter? count = (stepSpec count).bind fun parsed =>
      (Cook.decodeRightCounter? parsed.2).map (List.cons parsed.1) := by
  rw [Cook.decodeRightCounter?, dif_neg nonzero]
  unfold stepSpec
  by_cases divisible : count % 8 = 0
  · rw [if_pos divisible, if_pos divisible]
    dsimp only
    cases Cook.symbolOfDigitWeight? (count / 8 % 8) with
    | none => rfl
    | some symbol =>
        dsimp only [Option.bind]
        cases Cook.decodeRightCounter? (count / 8 - count / 8 % 8) <;> rfl
  · rw [if_neg divisible, if_neg divisible]
    rfl

theorem left_step (count : Nat) (notStop : count ≠ 8) (nonzero : count ≠ 0) :
    Cook.decodeLeftCounter? count = (stepSpec count).bind fun parsed =>
      (Cook.decodeLeftCounter? parsed.2).map (List.cons parsed.1) := by
  rw [Cook.decodeLeftCounter?, if_neg notStop, dif_neg nonzero]
  unfold stepSpec
  by_cases divisible : count % 8 = 0
  · rw [if_pos divisible, if_pos divisible]
    dsimp only
    cases Cook.symbolOfDigitWeight? (count / 8 % 8) with
    | none => rfl
    | some symbol =>
        dsimp only [Option.bind]
        cases Cook.decodeLeftCounter? (count / 8 - count / 8 % 8) <;> rfl
  · rw [if_neg divisible, if_neg divisible]
    rfl

def right (count : Nat) : Result (Option (List Cook.MachineSymbol)) := decode 0 count
def left (count : Nat) : Result (Option (List Cook.MachineSymbol)) := decode 8 count

theorem right_value (count : Nat) : (right count).value = Cook.decodeRightCounter? count := by
  induction count using WellFounded.induction (measure (fun number : Nat => number)).wf with
  | h count ih =>
      change (decode 0 count).value = _
      rw [decode_value_equation]
      by_cases zero : count = 0
      · subst count
        rw [if_pos rfl, Cook.decodeRightCounter?]
        rfl
      · rw [if_neg zero, if_neg zero, right_step count zero, ← step_value]
        cases found : (step count).value with
        | none => rfl
        | some parsed =>
            dsimp only [Option.bind]
            exact congrArg (Option.map (List.cons parsed.1))
              (ih parsed.2 (step_decrease (Nat.zero_lt_of_ne_zero zero) found))

theorem left_value (count : Nat) : (left count).value = Cook.decodeLeftCounter? count := by
  induction count using WellFounded.induction (measure (fun number : Nat => number)).wf with
  | h count ih =>
      change (decode 8 count).value = _
      rw [decode_value_equation]
      by_cases stopped : count = 8
      · subst count
        rw [if_pos rfl, Cook.decodeLeftCounter?]
        rfl
      · rw [if_neg stopped]
        by_cases zero : count = 0
        · subst count
          rw [if_pos rfl, Cook.decodeLeftCounter?]
          rfl
        · rw [if_neg zero, left_step count stopped zero, ← step_value]
          cases found : (step count).value with
          | none => rfl
          | some parsed =>
              dsimp only [Option.bind]
              exact congrArg (Option.map (List.cons parsed.1))
                (ih parsed.2 (step_decrease (Nat.zero_lt_of_ne_zero zero) found))

def coefficient (stop : Nat) : Nat := 4 * stop + 256

theorem base_overhead_le (stop count : Nat) :
    (ParserTerminalPrimitive.equalIndex stop count).operations + 3 ≤ coefficient stop * (count + 1) := by
  have first := Nat.add_le_add_right (ParserTerminalPrimitive.equalIndex_operations_le stop count) 3
  have second := Nat.add_le_add_left (by decide : 2 + 3 ≤ 256) (4 * stop)
  exact Nat.le_trans (by simpa only [Nat.add_assoc] using first)
    (Nat.le_trans second (ParserRoutePrimitive.constant_le_scale (coefficient stop) count))

theorem loop_overhead_le (stop count : Nat) :
    (ParserTerminalPrimitive.equalIndex stop count).operations + (step count).operations + 10 ≤
      coefficient stop * (count + 1) := by
  have first := Nat.add_le_add_right
    (Nat.add_le_add (ParserTerminalPrimitive.equalIndex_operations_le stop count) (step_operations_le count)) 10
  have second := ParserCarrierPrimitive.linear_bound
    (Nat.le_trans (by decide : 100 ≤ 256) (Nat.le_add_left _ _))
    (Nat.add_le_add_left (by decide : 2 + 128 + 10 ≤ 256) (4 * stop)) count
  exact Nat.le_trans first (by simpa only [coefficient, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using second)

theorem decode_operations_le (stop count : Nat) :
    (decode stop count).operations ≤ coefficient stop * (count + 1) ^ 2 := by
  induction count using WellFounded.induction (measure (fun number : Nat => number)).wf with
  | h count ih =>
      rw [decode.eq_def]
      dsimp only
      split
      · exact Nat.le_trans (base_overhead_le stop count)
          (ParserCarrierPrimitive.linear_le_square (coefficient stop) count)
      · cases count with
        | zero =>
            exact Nat.le_trans (base_overhead_le stop 0)
              (ParserCarrierPrimitive.linear_le_square (coefficient stop) 0)
        | succ previous =>
            dsimp only
            split
            · have overhead := Nat.le_trans (loop_overhead_le stop (.succ previous))
                (ParserCarrierPrimitive.linear_le_square (coefficient stop) (.succ previous))
              exact Nat.le_trans (Nat.add_le_add_left (by decide : 4 ≤ 10) _) overhead
            · next parsed found =>
                have smaller := step_decrease (Nat.zero_lt_succ previous) found
                have inner := ih parsed.2 smaller
                have wrapped := andThen_operations_le (decode stop parsed.2)
                  (fun remaining => ⟨some (parsed.1 :: remaining), 2⟩) 2 (fun _ _ => Nat.le_refl _)
                have first := Nat.add_le_add_left wrapped
                  ((ParserTerminalPrimitive.equalIndex stop (.succ previous)).operations + (step (.succ previous)).operations + 6)
                have combined := ParserCarrierPrimitive.combine_descent smaller
                  (loop_overhead_le stop (.succ previous)) inner
                exact Nat.le_trans first (by simpa only [show 10 = 6 + 2 + 2 by rfl,
                  Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using combined)

theorem right_operations_le (count : Nat) : (right count).operations ≤ 256 * (count + 1) ^ 2 :=
  decode_operations_le 0 count

theorem left_operations_le (count : Nat) : (left count).operations ≤ 288 * (count + 1) ^ 2 :=
  decode_operations_le 8 count

end PureSFormal.Computation.CookCounterPrimitive
