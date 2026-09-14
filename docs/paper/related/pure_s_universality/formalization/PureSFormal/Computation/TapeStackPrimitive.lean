import PureSFormal.Computation.DeterministicTapeCounterCompiler
import PureSFormal.PureS.ParserNatDivisionPrimitive
import PureSFormal.PureS.ParserRoutePrimitive

/-!
# Primitive decoding of sentinel-terminated tape stacks

The parser consumes unary natural input through measured division by two.
Zero is rejected, one is the empty-stack sentinel, and larger inputs expose
one literal low bit before recursive quotient parsing. Output cells are
allocated explicitly; no source transition is evaluated.
-/

namespace PureSFormal.Computation.TapeStackPrimitive

open PureS ParserPrimitiveMachine ParserTerminalPrimitive ParserNatDivisionPrimitive
open ParserRoutePrimitive (andThen andThen_value andThen_operations_le)
open DeterministicTapeCounterCompiler

theorem equalIndex_decide (index : Nat) :
    (equalIndex index 1).value = decide (index = 1) := by
  apply Bool.eq_iff_iff.mpr
  simpa only [decide_eq_true_eq] using equalIndex_value index 1

def parse (stack : Nat) : Result (Option (List Bool)) :=
  match shape : stack with
  | 0 => ⟨none, 2⟩
  | 1 => ⟨some [], 5⟩
  | .succ (.succ _) =>
      let divided := divMod 2 stack
      let output := andThen (parse divided.value.1) fun rest =>
        let digit := equalIndex divided.value.2 1
        ⟨some (digit.value :: rest), digit.operations + 3⟩
      ⟨output.value, divided.operations + output.operations + 5⟩
termination_by stack
decreasing_by
  rw [divMod_value, shape]
  exact Nat.div_lt_self (Nat.zero_lt_succ _) (by decide : 1 < 2)

theorem parse_value (stack : Nat) : (parse stack).value = StackCode.decode? stack := by
  induction stack using Nat.strongRecOn with
  | ind stack ih =>
      cases stack with
      | zero => rw [parse, StackCode.decode?, if_pos rfl]
      | succ previous =>
          cases previous with
          | zero => rw [parse, StackCode.decode?, if_neg (by decide : 1 ≠ 0), if_pos rfl]
          | succ previous =>
              have smaller : (previous + 2) / 2 < previous + 2 :=
                Nat.div_lt_self (Nat.zero_lt_succ _) (by decide : 1 < 2)
              rw [parse]
              change (andThen _ _).value = _
              rw [andThen_value, divMod_value]
              rw [StackCode.decode?, if_neg (Nat.succ_ne_zero _),
                if_neg (fun equal => Nat.noConfusion (Nat.succ.inj equal))]
              rw [ih _ smaller]
              cases StackCode.decode? ((previous + 2) / 2) with
              | none => rfl
              | some rest =>
                  dsimp only [Option.bind]
                  rw [equalIndex_decide]

theorem parse_operations_le (stack : Nat) :
    (parse stack).operations ≤ 32 * (stack + 1) ^ 2 := by
  induction stack using Nat.strongRecOn with
  | ind stack ih =>
      cases stack with
      | zero => rw [parse]; exact (by decide : 2 ≤ 32)
      | succ previous =>
          cases previous with
          | zero => rw [parse]; exact (by decide : 5 ≤ 128)
          | succ previous =>
              let input := previous + 2
              have smaller : (divMod 2 input).value.1 < input := by
                rw [divMod_value]
                exact Nat.div_lt_self (Nat.zero_lt_succ _) (by decide : 1 < 2)
              have inner := ih _ smaller
              have digitBound : (equalIndex (divMod 2 input).value.2 1).operations ≤ 6 := by
                have digitSmall : (divMod 2 input).value.2 ≤ 1 :=
                  Nat.le_of_lt_succ (remainder_lt 2 (by decide) input)
                exact Nat.le_trans (equalIndex_operations_le _ _)
                  (Nat.add_le_add_right (Nat.mul_le_mul_left 4 digitSmall) 2)
              have nextBound (rest : List Bool) :
                  (⟨some ((equalIndex (divMod 2 input).value.2 1).value :: rest),
                    (equalIndex (divMod 2 input).value.2 1).operations + 3⟩ : Result (Option (List Bool))).operations ≤ 9 :=
                Nat.add_le_add_right digitBound 3
              have outputBound := andThen_operations_le (parse (divMod 2 input).value.1) _ 9
                (fun rest _ => nextBound rest)
              have dividedBound : (divMod 2 input).operations ≤ 22 * input + 3 :=
                divMod_operations_le 2 input
              have counted := Nat.add_le_add_right (Nat.add_le_add dividedBound outputBound) 5
              have overhead : 22 * input + 19 ≤ 32 * (input + 1) := by
                have bound := Nat.add_le_add (Nat.mul_le_mul_right input (by decide : 22 ≤ 32))
                  (by decide : 19 ≤ 32)
                simpa only [Nat.mul_add, Nat.mul_one] using bound
              have combined := Nat.add_le_add inner overhead
              have descent := Nat.mul_le_mul_left 32 (ParserWordPrimitive.square_descent smaller)
              rw [Nat.mul_add] at descent
              rw [parse]
              exact Nat.le_trans counted (Nat.le_trans
                (by simpa only [show 19 = 3 + 2 + 9 + 5 by rfl,
                  Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using combined) descent)

theorem parsed_length_le (stack : Nat) (bits : List Bool)
    (found : (parse stack).value = some bits) : bits.length ≤ stack := by
  induction stack using Nat.strongRecOn generalizing bits with
  | ind stack ih =>
      cases stack with
      | zero => rw [parse] at found; cases found
      | succ previous =>
          cases previous with
          | zero =>
              rw [parse] at found
              cases found
              exact Nat.zero_le _
          | succ previous =>
              have smaller : (divMod 2 (previous + 2)).value.1 < previous + 2 := by
                rw [divMod_value]
                exact Nat.div_lt_self (Nat.zero_lt_succ _) (by decide : 1 < 2)
              rw [parse] at found
              change (andThen _ _).value = some bits at found
              rw [andThen_value] at found
              cases parsed : (parse (divMod 2 (previous + 2)).value.1).value with
              | none => rw [parsed] at found; cases found
              | some rest =>
                  rw [parsed] at found
                  cases found
                  exact Nat.le_trans (Nat.succ_le_succ (ih _ smaller rest parsed))
                    (Nat.succ_le_of_lt smaller)

end PureSFormal.Computation.TapeStackPrimitive
