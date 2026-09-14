import PureSFormal.Computation.DeterministicTapeEncodingPrimitives
import PureSFormal.Computation.DeterministicTapeThreeCounterCompiler

/-!
# Closed code for the literal three-counter initialization

The source instance uses its canonical natural numbering.  The target state
is coded by the five-element list of control, left, right, scratch and status.
The closed program computes the exact `Execution.compileInitial` state.
-/

namespace PureSFormal.Computation.DeterministicTapeInitialComputability

open PureSFormal.PureS
open DeterministicTapeCode
open DeterministicTapeCounterCompiler
open DeterministicTapeThreeCounterCompiler

def statusCode : ThreeCounter.Status → Nat
  | .running => 0
  | .halted => 1

def stateCode (state : ThreeCounter.State) : Nat :=
  PrimitiveRecursiveListCode.encode
    [state.control, state.left, state.right, state.scratch, statusCode state.status]

def decodeState? (number : Nat) : Option ThreeCounter.State :=
  match PrimitiveRecursiveListCode.decode number with
  | [control, left, right, scratch, 0] => some ⟨control, left, right, scratch, .running⟩
  | [control, left, right, scratch, 1] => some ⟨control, left, right, scratch, .halted⟩
  | _ => none

@[simp] theorem decodeState?_stateCode (state : ThreeCounter.State) :
    decodeState? (stateCode state) = some state := by
  cases state with
  | mk control left right scratch status =>
      cases status <;>
        simp only [decodeState?, stateCode, PrimitiveRecursiveListCode.decode_encode, statusCode]

theorem stackCode_eq_bitListCode_succ (bits : List Bool) :
    StackCode.encode bits = bitListCode bits + 1 := by
  induction bits with
  | nil => rfl
  | cons bit rest ih =>
      cases bit <;>
        simp only [StackCode.encode, StackCode.bit, bitListCode, ih,
          Nat.mul_add, Nat.mul_one, Nat.add_zero, Nat.add_assoc]

theorem initialRight_eq (bits : List Bool) :
    StackCode.encode (bits ++ [false]) = bitListCode bits + 1 + 2 ^ bits.length := by
  induction bits with
  | nil => rfl
  | cons bit rest ih =>
      cases bit <;>
        simp only [List.cons_append, StackCode.encode, StackCode.bit,
          bitListCode, List.length_cons, Nat.pow_succ, ih,
          Nat.mul_add, Nat.mul_one, Nat.add_zero, Nat.add_assoc, Nat.add_comm,
          Nat.add_left_comm, Nat.mul_comm] <;>
        simp only [Nat.zero_add, Nat.one_mul, ← Nat.add_assoc]

namespace Program

open PrimitiveRecursiveListCode.Program

def inputLength : PRCode 1 :=
  PRCode.composeUnary length
    (PRCode.composeUnary DeterministicTapeEncodingPrimitives.Program.bitListToNatList
      DeterministicTapeEncodingPrimitives.Program.input)

theorem eval_inputLength (number : Nat) :
    PRCode.eval₁ inputLength number = (instanceDecodeCode number).input.length := by
  rw [inputLength, eval₁_composeUnary, eval₁_composeUnary,
    DeterministicTapeEncodingPrimitives.Program.eval_input,
    DeterministicTapeEncodingPrimitives.Program.eval_bitListToNatList_code,
    eval_length, PrimitiveRecursiveListCode.decode_encode, List.length_map]

def control : PRCode 1 :=
  PRCode.composeBinary PRCode.multiplication
    DeterministicTapeEncodingPrimitives.Program.initialState
    (PRCode.constant 1 Layout.phaseCount)

def left : PRCode 1 := PRCode.constant 1 2

def right : PRCode 1 :=
  PRCode.composeBinary PRCode.addition
    (PRCode.composeUnary PRCode.successor DeterministicTapeEncodingPrimitives.Program.input)
    (PRCode.composeBinary PRCode.power (PRCode.constant 1 2) inputLength)

theorem eval_control (number : Nat) :
    PRCode.eval₁ control number = (Execution.compileInitial (instanceDecodeCode number)).control := by
  rw [control, eval₁_composeBinary,
    DeterministicTapeEncodingPrimitives.Program.eval_initialState,
    eval₁_constant, PRCode.eval₂_multiplication]
  rfl

theorem eval_left (number : Nat) :
    PRCode.eval₁ left number = (Execution.compileInitial (instanceDecodeCode number)).left := by
  rw [left, eval₁_constant]
  rfl

theorem eval_right (number : Nat) :
    PRCode.eval₁ right number = (Execution.compileInitial (instanceDecodeCode number)).right := by
  rw [right, eval₁_composeBinary, eval₁_composeUnary, eval₁_composeBinary,
    DeterministicTapeEncodingPrimitives.Program.eval_input,
    eval₁_constant, eval_inputLength, PRCode.eval₂_power, PRCode.eval₂_addition]
  change bitListCode (instanceDecodeCode number).input + 1 +
    2 ^ (instanceDecodeCode number).input.length =
    StackCode.encode ((instanceDecodeCode number).input ++ [false])
  exact (initialRight_eq (instanceDecodeCode number).input).symm

/-- Build the exact five-field code of the compiled primitive initial state. -/
def initialState : PRCode 1 :=
  let zero := PRCode.constant 1 0
  PRCode.composeBinary cons control
    (PRCode.composeBinary cons left
      (PRCode.composeBinary cons right
        (PRCode.composeBinary cons zero (PRCode.composeBinary cons zero zero))))

theorem eval_initialState (number : Nat) :
    PRCode.eval₁ initialState number = stateCode (Execution.compileInitial (instanceDecodeCode number)) := by
  simp only [initialState, eval₁_composeBinary, eval₁_constant, eval_control,
    eval_left, eval_right, eval_cons]
  rfl

theorem initialState_decodes (number : Nat) :
    decodeState? (PRCode.eval₁ initialState number) =
      some (Execution.compileInitial (instanceDecodeCode number)) := by
  rw [eval_initialState, decodeState?_stateCode]

end Program

theorem initialState_primitiveRecursive :
    PrimitiveRecursive
      (fun number => stateCode (Execution.compileInitial (instanceDecodeCode number))) :=
  ⟨Program.initialState, Program.eval_initialState⟩

end PureSFormal.Computation.DeterministicTapeInitialComputability
