import PureSFormal.Computation.PrimitiveRecursiveListCode

/-!
# Closed programs for tape-instance fields and Boolean-list conversion

The field programs use the exact canonical tape-instance numbering.  Boolean
words have their own bijective base-two numbering; the conversion programs
connect it to the Cantor-coded natural lists used by structural compiler folds.
-/

namespace PureSFormal.Computation.DeterministicTapeEncodingPrimitives

open PureSFormal.PureS
open DeterministicTapeCode

namespace Program

def machine : PRCode 1 := PRCode.cantorLeft

def initialState : PRCode 1 :=
  PRCode.composeUnary PRCode.cantorLeft PRCode.cantorRight

def input : PRCode 1 :=
  PRCode.composeUnary PRCode.cantorRight PRCode.cantorRight

theorem eval_machine (number : Nat) :
    PRCode.eval₁ machine number = machineCode (instanceDecodeCode number).machine := by
  rw [machine, eval₁_cantorLeft_eq_unpair_fst]
  exact (machineCode_decode (Term.unpair number).1).symm

theorem eval_initialState (number : Nat) :
    PRCode.eval₁ initialState number = (instanceDecodeCode number).initialState := by
  rw [initialState, PrimitiveRecursiveListCode.Program.eval₁_composeUnary,
    eval₁_cantorRight_eq_unpair_snd, eval₁_cantorLeft_eq_unpair_fst]
  rfl

theorem eval_input (number : Nat) :
    PRCode.eval₁ input number = bitListCode (instanceDecodeCode number).input := by
  rw [input, PrimitiveRecursiveListCode.Program.eval₁_composeUnary,
    eval₁_cantorRight_eq_unpair_snd, eval₁_cantorRight_eq_unpair_snd]
  exact (bitListCode_decode (Term.unpair (Term.unpair number).2).2).symm

/-- Pair state for a Boolean-code scan: remaining word and reversed output. -/
def bitStateStep : PRCode 1 :=
  let remaining := PRCode.cantorLeft
  let accumulated := PRCode.cantorRight
  let predecessor := PRCode.composeUnary PRCode.predecessor remaining
  let tail := PRCode.composeBinary PRCode.division predecessor (PRCode.constant 1 2)
  let bit := PRCode.composeBinary PRCode.modulus predecessor (PRCode.constant 1 2)
  let advanced := PRCode.composeBinary PRCode.cantorPair tail
    (PRCode.composeBinary PrimitiveRecursiveListCode.Program.cons bit accumulated)
  PRCode.composeTernary PRCode.branchIfZero PRCode.identity advanced remaining

def bitStateStepValue (state : Nat) : Nat :=
  let remaining := (Term.unpair state).1
  let accumulated := (Term.unpair state).2
  if remaining = 0 then state
  else Term.pair ((remaining - 1) / 2)
    (Term.pair ((remaining - 1) % 2) accumulated + 1)

theorem eval_bitStateStep (state : Nat) :
    PRCode.eval₁ bitStateStep state = bitStateStepValue state := by
  simp only [bitStateStep, bitStateStepValue,
    PrimitiveRecursiveListCode.Program.eval₁_composeUnary, PrimitiveRecursiveListCode.Program.eval₁_composeBinary,
    PrimitiveRecursiveListCode.Program.eval₁_composeTernary, PrimitiveRecursiveListCode.Program.eval₁_constant,
    eval₁_cantorLeft_eq_unpair_fst, eval₁_cantorRight_eq_unpair_snd,
    eval₂_cantorPair_eq_termPair, PRCode.eval_identity, PRCode.eval₁_predecessor,
    PRCode.eval₂_division, PRCode.eval₂_modulus, PRCode.eval_branchIfZero,
    PrimitiveRecursiveListCode.Program.eval_cons]

theorem bitListCode_cons_tail (bit : Bool) (rest : List Bool) :
    (bitListCode (bit :: rest) - 1) / 2 = bitListCode rest := by
  cases bit with
  | false => simp [bitListCode]
  | true =>
      have predecessor : 2 * bitListCode rest + 2 - 1 =
          1 + 2 * bitListCode rest := by
        rw [Nat.add_sub_assoc (by decide : 1 ≤ 2)]
        exact Nat.add_comm _ _
      rw [bitListCode, predecessor]
      exact one_add_two_mul_div_two (bitListCode rest)

theorem bitListCode_cons_head (bit : Bool) (rest : List Bool) :
    (bitListCode (bit :: rest) - 1) % 2 = boolCode bit := by
  cases bit with
  | false => simp [bitListCode, boolCode]
  | true =>
      have predecessor : 2 * bitListCode rest + 2 - 1 =
          1 + 2 * bitListCode rest := by
        rw [Nat.add_sub_assoc (by decide : 1 ≤ 2)]
        exact Nat.add_comm _ _
      rw [bitListCode, predecessor]
      simp [boolCode, Nat.add_comm]

theorem bitListCode_cons_ne_zero (bit : Bool) (rest : List Bool) :
    bitListCode (bit :: rest) ≠ 0 := by
  cases bit <;> simp [bitListCode]

theorem bitList_length_le_code (bits : List Bool) : bits.length ≤ bitListCode bits := by
  induction bits with
  | nil => exact Nat.le_refl 0
  | cons bit rest ih =>
      have double : bitListCode rest ≤ 2 * bitListCode rest := by
        rw [Nat.two_mul]
        exact Nat.le_add_right _ _
      have bound := Nat.succ_le_succ (Nat.le_trans ih double)
      cases bit with
      | false => exact bound
      | true => exact Nat.le_trans bound (Nat.le_succ _)

theorem bitStateStepValue_nil (accumulated : Nat) :
    bitStateStepValue (Term.pair 0 accumulated) = Term.pair 0 accumulated := by
  simp [bitStateStepValue, Term.unpair_pair]

theorem bitStateStepValue_cons (bit : Bool) (rest : List Bool) (accumulated : Nat) :
    bitStateStepValue (Term.pair (bitListCode (bit :: rest)) accumulated) =
      Term.pair (bitListCode rest) (Term.pair (boolCode bit) accumulated + 1) := by
  simp only [bitStateStepValue, Term.unpair_pair, bitListCode_cons_ne_zero,
    ↓reduceIte, bitListCode_cons_tail, bitListCode_cons_head]

theorem iterate_bitState_nil (accumulated fuel : Nat) :
    PrimitiveRecursiveListCode.Program.iterateValue bitStateStep (Term.pair 0 accumulated) fuel =
      Term.pair 0 accumulated := by
  induction fuel with
  | zero => rfl
  | succ fuel ih =>
      rw [PrimitiveRecursiveListCode.Program.iterateValue, ih, eval_bitStateStep, bitStateStepValue_nil]

theorem iterate_bitState_of_length_le (bits : List Bool) (accumulated : List Nat)
    (fuel : Nat) (enough : bits.length ≤ fuel) :
    PrimitiveRecursiveListCode.Program.iterateValue bitStateStep
        (Term.pair (bitListCode bits) (PrimitiveRecursiveListCode.encode accumulated)) fuel =
      Term.pair 0 (PrimitiveRecursiveListCode.encode ((bits.map boolCode).reverse ++ accumulated)) := by
  induction bits generalizing accumulated fuel with
  | nil => simpa using! iterate_bitState_nil (PrimitiveRecursiveListCode.encode accumulated) fuel
  | cons bit rest ih =>
      cases fuel with
      | zero => cases enough
      | succ fuel =>
          rw [PrimitiveRecursiveListCode.Program.iterateValue_succ_front, eval_bitStateStep,
            bitStateStepValue_cons]
          change PrimitiveRecursiveListCode.Program.iterateValue bitStateStep
            (Term.pair (bitListCode rest) (PrimitiveRecursiveListCode.encode (boolCode bit :: accumulated))) fuel = _
          rw [ih _ fuel (Nat.le_of_succ_le_succ enough)]
          simp

def bitListToNatListReverse : PRCode 1 :=
  PRCode.composeUnary PRCode.cantorRight
    (PRCode.composeBinary (PrimitiveRecursiveListCode.Program.iterate bitStateStep)
      (PRCode.composeBinary PRCode.cantorPair PRCode.identity (PRCode.constant 1 0))
      PRCode.identity)

def bitListToNatList : PRCode 1 :=
  PRCode.composeUnary PrimitiveRecursiveListCode.Program.reverse bitListToNatListReverse

theorem eval_bitListToNatListReverse_code (bits : List Bool) :
    PRCode.eval₁ bitListToNatListReverse (bitListCode bits) =
      PrimitiveRecursiveListCode.encode (bits.map boolCode).reverse := by
  rw [bitListToNatListReverse, PrimitiveRecursiveListCode.Program.eval₁_composeUnary,
    PrimitiveRecursiveListCode.Program.eval₁_composeBinary, PrimitiveRecursiveListCode.Program.eval₁_composeBinary,
    PRCode.eval_identity, PrimitiveRecursiveListCode.Program.eval₁_constant, eval₂_cantorPair_eq_termPair,
    PrimitiveRecursiveListCode.Program.eval_iterate]
  have correct := iterate_bitState_of_length_le bits [] (bitListCode bits)
    (bitList_length_le_code bits)
  simp only [PrimitiveRecursiveListCode.encode_nil, List.append_nil] at correct
  rw [correct, eval₁_cantorRight_eq_unpair_snd, Term.unpair_pair]

theorem eval_bitListToNatList_code (bits : List Bool) :
    PRCode.eval₁ bitListToNatList (bitListCode bits) =
      PrimitiveRecursiveListCode.encode (bits.map boolCode) := by
  rw [bitListToNatList, PrimitiveRecursiveListCode.Program.eval₁_composeUnary,
    eval_bitListToNatListReverse_code, PrimitiveRecursiveListCode.Program.eval_reverse,
    PrimitiveRecursiveListCode.decode_encode, List.reverse_reverse]

theorem eval_bitListToNatList (number : Nat) :
    PRCode.eval₁ bitListToNatList number =
      PrimitiveRecursiveListCode.encode ((bitListDecode number).map boolCode) := by
  have correct := eval_bitListToNatList_code (bitListDecode number)
  rw [bitListCode_decode] at correct
  exact correct

def natListToBitListStep : PRCode 2 :=
  PRCode.composeBinary PRCode.addition
    (PRCode.composeUnary PRCode.successor
      (PRCode.composeBinary PRCode.multiplication (PRCode.constant 2 2) (.projection 0)))
    (PRCode.composeBinary PRCode.modulus (.projection 1) (PRCode.constant 2 2))

theorem eval_natListToBitListStep (accumulated value : Nat) :
    PRCode.eval₂ natListToBitListStep accumulated value = 2 * accumulated + 1 + value % 2 := by
  simp only [natListToBitListStep, PrimitiveRecursiveListCode.Program.eval₂_composeBinary,
    PrimitiveRecursiveListCode.Program.eval₂_composeUnary, PrimitiveRecursiveListCode.Program.eval₂_constant,
    PrimitiveRecursiveListCode.Program.eval₂_projection_zero, PrimitiveRecursiveListCode.Program.eval₂_projection_one,
    PRCode.eval₂_addition, PRCode.eval₂_multiplication, PRCode.eval₂_modulus]
  rfl

theorem bitListCode_cons (bit : Bool) (rest : List Bool) :
    bitListCode (bit :: rest) = 2 * bitListCode rest + 1 + boolCode bit := by
  cases bit <;> simp [bitListCode, boolCode, Nat.add_assoc]

theorem eval_natListToBitListStep_code (accumulated : List Bool) (value : Nat) :
    PRCode.eval₂ natListToBitListStep (bitListCode accumulated) value =
      bitListCode (boolDecode value :: accumulated) := by
  rw [eval_natListToBitListStep, bitListCode_cons, boolCode_decode]

theorem fold_natListToBitList (values : List Nat) (accumulated : List Bool) :
    values.foldl (PRCode.eval₂ natListToBitListStep) (bitListCode accumulated) =
      bitListCode ((values.map boolDecode).reverse ++ accumulated) := by
  induction values generalizing accumulated with
  | nil => simp
  | cons value rest ih =>
      rw [List.foldl_cons, eval_natListToBitListStep_code, ih]
      simp

def natListToBitList : PRCode 1 :=
  PRCode.composeBinary (PrimitiveRecursiveListCode.Program.fold natListToBitListStep)
    PrimitiveRecursiveListCode.Program.reverse (PRCode.constant 1 0)

theorem eval_natListToBitList (number : Nat) :
    PRCode.eval₁ natListToBitList number =
      bitListCode ((PrimitiveRecursiveListCode.decode number).map boolDecode) := by
  rw [natListToBitList, PrimitiveRecursiveListCode.Program.eval₁_composeBinary,
    PrimitiveRecursiveListCode.Program.eval_reverse, PrimitiveRecursiveListCode.Program.eval₁_constant, PrimitiveRecursiveListCode.Program.eval_fold_encode]
  have correct := fold_natListToBitList (PrimitiveRecursiveListCode.decode number).reverse []
  simp only [bitListCode, List.map_reverse, List.reverse_reverse, List.append_nil] at correct
  exact correct

end Program

theorem machine_primitiveRecursive :
    PrimitiveRecursive (fun number => machineCode (instanceDecodeCode number).machine) :=
  ⟨Program.machine, Program.eval_machine⟩

theorem initialState_primitiveRecursive :
    PrimitiveRecursive (fun number => (instanceDecodeCode number).initialState) :=
  ⟨Program.initialState, Program.eval_initialState⟩

theorem input_primitiveRecursive :
    PrimitiveRecursive (fun number => bitListCode (instanceDecodeCode number).input) :=
  ⟨Program.input, Program.eval_input⟩

theorem bitListToNatList_primitiveRecursive :
    PrimitiveRecursive (fun number => PrimitiveRecursiveListCode.encode ((bitListDecode number).map boolCode)) :=
  ⟨Program.bitListToNatList, Program.eval_bitListToNatList⟩

theorem natListToBitList_primitiveRecursive :
    PrimitiveRecursive (fun number => bitListCode ((PrimitiveRecursiveListCode.decode number).map boolDecode)) :=
  ⟨Program.natListToBitList, Program.eval_natListToBitList⟩

end PureSFormal.Computation.DeterministicTapeEncodingPrimitives
