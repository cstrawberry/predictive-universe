import PureSFormal.Computation.ThreeCounterTagInputConstructionMachine

/-!
# Primitive construction of the padded source initial state

The right stack is folded directly onto the fixed blank/sentinel code `2`,
without first copying the input to append padding. Unary doubling charges every
allocated successor. This constructor reads the input word and initial label;
it does not inspect a source transition or run a source instruction.
-/

namespace PureSFormal.Computation.DeterministicTapeInitialConstructionMachine

open PureSFormal.PureS.ParserPrimitiveMachine (Result)
open PureSFormal.PureS
open PureSFormal.Research.ProtectedTrieDeterministicCompiler
open DeterministicTapeCounterCompiler

def stack : List Bool → Result Nat
  | [] => ⟨2, 4⟩
  | bit :: rest =>
      let previous := stack rest
      let doubled := ParserNatPrimitive.add previous.value previous.value
      ⟨if bit then doubled.value + 1 else doubled.value,
        previous.operations + doubled.operations + 6⟩

theorem stack_value (input : List Bool) :
    (stack input).value = StackCode.encode (input ++ [false]) := by
  induction input with
  | nil => rfl
  | cons bit rest ih =>
      cases bit <;> simp only [stack, ParserNatPrimitive.add_value, ih,
        List.cons_append, StackCode.encode, StackCode.bit, Nat.two_mul, Nat.add_zero,
        Bool.false_eq_true, ↓reduceIte]

theorem stack_operations_le (input : List Bool) :
    (stack input).operations ≤ 4 * (stack input).value + 7 * input.length + 4 := by
  induction input with
  | nil => exact (by decide : 4 ≤ 4 * 2 + 7 * 0 + 4)
  | cons bit rest ih =>
      have doubledCost := ParserNatPrimitive.add_operations (stack rest).value (stack rest).value
      have lower : (stack rest).value + (stack rest).value ≤ (stack (bit :: rest)).value := by
        cases bit with
        | false => rw [stack, ParserNatPrimitive.add_value]; exact Nat.le_refl _
        | true => rw [stack, ParserNatPrimitive.add_value]; exact Nat.le_succ _
      have counted := Nat.add_le_add_right (Nat.add_le_add_right ih (4 * (stack rest).value + 1)) 6
      have enlarged := Nat.add_le_add_right
        (Nat.add_le_add_right (Nat.mul_le_mul_left 4 lower) (7 * (rest.length + 1))) 4
      rw [stack, doubledCost]
      apply Nat.le_trans counted
      apply Nat.le_trans _ enlarged
      apply Nat.le_of_eq
      simp only [Nat.mul_add, Nat.mul_succ, show 7 = 1 + 6 by rfl,
        Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

def initial (source : DeterministicTape.Instance) : Result ThreeCounter.State :=
  let right := stack source.input
  let control := ParserNatPrimitive.multiply 127 source.initialState
  ⟨{ control := control.value, left := 2, right := right.value, scratch := 0, status := .running },
    right.operations + control.operations + 8⟩

theorem initial_value (source : DeterministicTape.Instance) :
    (initial source).value = DeterministicTapeThreeCounterCompiler.Execution.compileInitial source := by
  simp only [initial, stack_value, ParserNatPrimitive.multiply_value,
    DeterministicTapeThreeCounterCompiler.Execution.compileInitial,
    DeterministicTapeThreeCounterCompiler.Execution.boundaryState,
    DeterministicTapeThreeCounterCompiler.Execution.runningState,
    DeterministicTapeCounterCompiler.compileInitial,
    DeterministicTapeThreeCounterCompiler.Compiler.boundaryAddress,
    DeterministicTapeThreeCounterCompiler.Layout.address,
    DeterministicTapeThreeCounterCompiler.Layout.phaseCount,
    DeterministicTapeThreeCounterCompiler.Layout.encodePhase,
    DeterministicTapeThreeCounterCompiler.Layout.encodeRight,
    Nat.add_zero, Nat.mul_comm]
  rfl

theorem initial_operations_le (source : DeterministicTape.Instance) :
    (initial source).operations ≤
      4 * StackCode.encode (source.input ++ [false]) + 7 * source.input.length +
        515 * source.initialState + 14 := by
  have counted := Nat.add_le_add_right (Nat.add_le_add_right
    (stack_operations_le source.input) (515 * source.initialState + 2)) 8
  simpa only [initial, ParserNatPrimitive.multiply_operations, stack_value,
    show 4 * 127 + 7 = 515 by rfl, show 14 = 4 + 2 + 8 by rfl,
    Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using counted

inductive StackExecution : List Bool → Nat → Nat → Prop where
  | nil : StackExecution [] 2 4
  | cons {rest : List Bool} {previous doubled previousOperations doublingOperations : Nat}
      (bit : Bool) (tailRun : StackExecution rest previous previousOperations)
      (doubling : ParserNatPowerPrimitive.AddExecution previous previous doubled doublingOperations) :
      StackExecution (bit :: rest) (if bit then doubled + 1 else doubled)
        (previousOperations + doublingOperations + 6)

theorem stack_execution (input : List Bool) :
    StackExecution input (stack input).value (stack input).operations := by
  induction input with
  | nil => exact .nil
  | cons bit rest ih => exact .cons bit ih (ParserNatPowerPrimitive.add_execution _ _)

inductive InitialExecution (source : DeterministicTape.Instance) : ThreeCounter.State → Nat → Prop where
  | construct {right operations : Nat} (rightRun : StackExecution source.input right operations) :
      InitialExecution source
        { control := (ParserNatPrimitive.multiply 127 source.initialState).value,
          left := 2, right := right, scratch := 0, status := .running }
        (operations + (ParserNatPrimitive.multiply 127 source.initialState).operations + 8)

theorem initial_execution (source : DeterministicTape.Instance) :
    InitialExecution source (initial source).value (initial source).operations :=
  .construct (stack_execution _)

end PureSFormal.Computation.DeterministicTapeInitialConstructionMachine
