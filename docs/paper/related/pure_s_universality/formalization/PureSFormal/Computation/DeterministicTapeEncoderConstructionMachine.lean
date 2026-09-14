import PureSFormal.Computation.DeterministicTapeTableConstructionMachine
import PureSFormal.Computation.DeterministicTapeDecodeConstructionMachine
import PureSFormal.Computation.CookEncodingComputability
import PureSFormal.PureS.EncoderPrimitive

/-!
# Measured complete source encoder

This is the composition of the actual numbering decoder, literal tape table and
initialization, numeric counter/tag compiler and normalization, Rogozhin input,
Cook word encoding, and the literal pure-S generator constructor. Naturals are
unary chains; lists and intermediate terms use immutable references. The last
term constructor copies all occurrences into an unshared syntax tree. Every
bound is a function of finite input/intermediate/output structure, with no
source trajectory, source fuel, or halting-time parameter.
-/
namespace PureSFormal.Computation.DeterministicTapeEncoderConstructionMachine

open PureSFormal.PureS
open PureSFormal.PureS.ParserPrimitiveMachine (Result)
open PureSFormal.Research.ProtectedTrieDeterministicCompiler

set_option maxRecDepth 4096

def initialBudget (source : DeterministicTape.Instance) : Nat :=
  4 * DeterministicTapeCounterCompiler.StackCode.encode (source.input ++ [false]) +
    7 * source.input.length + 515 * source.initialState + 14

def downstreamBudget (program : ThreeCounter.Program) (state : ThreeCounter.State) : Nat :=
  let job := ThreeCounterTag.Numeric.compileT2 program state
  let tape := RogozhinTagInput.compile job
  let word := Cook.encodeWord (Cook.PassClassification.canonicalWord tape)
  ThreeCounterTagInputConstructionMachine.compileBudget program state +
    RogozhinProgramConstructionMachine.compileBudget job + 5 * word.length +
      8 * (tape.left.length + tape.right.length) + 17

theorem downstream_operations_le (program : ThreeCounter.Program) (state : ThreeCounter.State) :
    (ThreeCounterTagInputConstructionMachine.cookBits program state).operations ≤ downstreamBudget program state := by
  have bound := ThreeCounterTagInputConstructionMachine.cookBits_operations_le program state
  rw [ThreeCounterTagInputConstructionMachine.cookBits_value] at bound
  exact bound

def fromSource (source : DeterministicTape.Instance) : Result (List Bool) :=
  let program := DeterministicTapeTableConstructionMachine.compile source.machine
  let initial := DeterministicTapeInitialConstructionMachine.initial source
  let output := ThreeCounterTagInputConstructionMachine.cookBits program.value initial.value
  ⟨output.value, program.operations + initial.operations + output.operations + 3⟩

theorem fromSource_value (source : DeterministicTape.Instance) :
    (fromSource source).value = DeterministicTapeCook.encodeBits source := by
  simp only [fromSource, DeterministicTapeTableConstructionMachine.compile_value,
    DeterministicTapeInitialConstructionMachine.initial_value]
  exact ThreeCounterTagInputConstructionMachine.cookBits_source_value source

def sourceBudget (source : DeterministicTape.Instance) : Nat :=
  DeterministicTapeTableConstructionMachine.constructionBudget source.machine + initialBudget source +
    downstreamBudget (DeterministicTapeCook.compileThreeCounterJob source).program
      (DeterministicTapeCook.compileThreeCounterJob source).initial + 3

theorem fromSource_operations_le (source : DeterministicTape.Instance) :
    (fromSource source).operations ≤ sourceBudget source := by
  simp only [fromSource, sourceBudget]
  rw [DeterministicTapeTableConstructionMachine.compile_value,
    DeterministicTapeInitialConstructionMachine.initial_value]
  have outputBound := downstream_operations_le
    (DeterministicTapeTableConstructionMachine.compile source.machine).value
    (DeterministicTapeInitialConstructionMachine.initial source).value
  rw [DeterministicTapeTableConstructionMachine.compile_value,
    DeterministicTapeInitialConstructionMachine.initial_value] at outputBound
  exact Nat.add_le_add_right (Nat.add_le_add
    (Nat.add_le_add (DeterministicTapeTableConstructionMachine.compile_operations_le source.machine)
      (DeterministicTapeInitialConstructionMachine.initial_operations_le source)) outputBound) 3

/-- All-natural entry point for the exact Cook input word. -/
def sourceBits (number : Nat) : Result (List Bool) :=
  let source := DeterministicTapeDecodeConstructionMachine.decode number
  let output := fromSource source.value
  ⟨output.value, source.operations + output.operations + 2⟩

theorem sourceBits_value (number : Nat) :
    (sourceBits number).value =
      DeterministicTapeCook.encodeBits (DeterministicTapeCode.instanceDecodeCode number) := by
  simp only [sourceBits, fromSource_value, DeterministicTapeDecodeConstructionMachine.decode_value]

def bitsBudget (number : Nat) : Nat :=
  DeterministicTapeDecodeConstructionMachine.decodeBudget number +
    sourceBudget (DeterministicTapeCode.instanceDecodeCode number) + 2

theorem sourceBits_operations_le (number : Nat) : (sourceBits number).operations ≤ bitsBudget number := by
  simp only [sourceBits, bitsBudget]
  rw [DeterministicTapeDecodeConstructionMachine.decode_value]
  have outputBound := fromSource_operations_le (DeterministicTapeDecodeConstructionMachine.decode number).value
  rw [DeterministicTapeDecodeConstructionMachine.decode_value] at outputBound
  exact Nat.add_le_add_right (Nat.add_le_add
    (DeterministicTapeDecodeConstructionMachine.decode_operations_le number) outputBound) 2

/-- The measured word agrees with the independently checked closed numeric
program under the repository's total Boolean-list numbering. -/
theorem sourceBits_program_agreement (number : Nat) :
    DeterministicTapeCode.bitListCode (sourceBits number).value =
      PRCode.eval₁ CookEncodingComputability.Program.sourceBits number := by
  rw [sourceBits_value, CookEncodingComputability.Program.eval_sourceBits]

def actions : Term := compileActions Cook.rogozhinCookProgram DeterministicTapePureS.dispatcher.tree

/-- The closed dispatcher is fixed program data, prepared before input. -/
def sourceTerm (number : Nat) : Result Term :=
  let bits := sourceBits number
  let output := EncoderPrimitive.literal actions bits.value
  ⟨output.value, bits.operations + output.operations + 2⟩

theorem sourceTerm_value (number : Nat) :
    (sourceTerm number).value =
      DeterministicTapePureS.encodeTerm (DeterministicTapeCode.instanceDecodeCode number) := by
  simp only [sourceTerm, EncoderPrimitive.literal_value, sourceBits_value,
    DeterministicTapePureS.encodeTerm, actions]

def termBudget (number : Nat) : Nat :=
  bitsBudget number +
    (77 * (DeterministicTapeCook.encodeBits (DeterministicTapeCode.instanceDecodeCode number)).length +
      4 * actions.size + 167) + 2

theorem sourceTerm_operations_le (number : Nat) : (sourceTerm number).operations ≤ termBudget number := by
  simp only [sourceTerm, termBudget]
  rw [sourceBits_value]
  have outputBound := EncoderPrimitive.literal_operations_le actions (sourceBits number).value
  rw [sourceBits_value] at outputBound
  exact Nat.add_le_add_right (Nat.add_le_add (sourceBits_operations_le number) outputBound) 2

theorem sourceTerm_program_agreement (number : Nat) :
    (sourceTerm number).value.code = PRCode.eval₁ CookEncodingComputability.Program.sourceTerm number := by
  rw [sourceTerm_value, CookEncodingComputability.Program.eval_sourceTerm]

inductive SourceExecution (source : DeterministicTape.Instance) : List Bool → Nat → Prop where
  | construct {program : ThreeCounter.Program} {initial : ThreeCounter.State} {output : List Bool}
      {tableOperations initialOperations outputOperations : Nat}
      (table : DeterministicTapeTableConstructionMachine.CompilationExecution source.machine program tableOperations)
      (initialization : DeterministicTapeInitialConstructionMachine.InitialExecution source initial initialOperations)
      (outputRun : ThreeCounterTagInputConstructionMachine.CookExecution program initial output outputOperations) :
      SourceExecution source output (tableOperations + initialOperations + outputOperations + 3)

theorem fromSource_execution (source : DeterministicTape.Instance) :
    SourceExecution source (fromSource source).value (fromSource source).operations :=
  .construct (DeterministicTapeTableConstructionMachine.compile_execution _)
    (DeterministicTapeInitialConstructionMachine.initial_execution _)
    (ThreeCounterTagInputConstructionMachine.cookBits_execution _ _)

inductive BitsExecution (number : Nat) : List Bool → Nat → Prop where
  | construct {source : DeterministicTape.Instance} {output : List Bool} {decodeOperations sourceOperations : Nat}
      (decoding : DeterministicTapeDecodeConstructionMachine.DecodeExecution number source decodeOperations)
      (encoding : SourceExecution source output sourceOperations) :
      BitsExecution number output (decodeOperations + sourceOperations + 2)

theorem bitsExecution_compose (number : Nat) (source : Result DeterministicTape.Instance) (output : Result (List Bool))
    (decoding : DeterministicTapeDecodeConstructionMachine.DecodeExecution number source.value source.operations)
    (encoding : SourceExecution source.value output.value output.operations) :
    BitsExecution number output.value (source.operations + output.operations + 2) :=
  .construct decoding encoding

attribute [local irreducible] fromSource

theorem sourceBits_execution (number : Nat) : BitsExecution number (sourceBits number).value (sourceBits number).operations := by
  unfold sourceBits
  generalize chosen : DeterministicTapeDecodeConstructionMachine.decode number = source
  have decoding := DeterministicTapeDecodeConstructionMachine.decode_execution number
  rw [chosen] at decoding
  exact bitsExecution_compose number source (fromSource source.value) decoding (fromSource_execution source.value)

inductive TermExecution (number : Nat) : Term → Nat → Prop where
  | construct {bits : List Bool} {output : Term} {bitsOperations termOperations : Nat}
      (word : BitsExecution number bits bitsOperations)
      (literal : EncoderPrimitive.LiteralExecution (EncoderPrimitive.prepare actions) bits output termOperations) :
      TermExecution number output (bitsOperations + termOperations + 2)

private theorem termExecution_of_result_eq (number : Nat)
    (result output : Result Term) (h : result = output)
    (run : TermExecution number output.value output.operations) :
    TermExecution number result.value result.operations := by
  cases h
  exact run

theorem sourceTerm_execution (number : Nat) : TermExecution number (sourceTerm number).value (sourceTerm number).operations := by
  let bits := sourceBits number
  let literal := EncoderPrimitive.literal actions bits.value
  apply termExecution_of_result_eq number (sourceTerm number)
    ⟨literal.value, bits.operations + literal.operations + 2⟩ rfl
  exact TermExecution.construct
    (bits := bits.value) (output := literal.value)
    (bitsOperations := bits.operations) (termOperations := literal.operations)
    (sourceBits_execution number) (EncoderPrimitive.literal_execution actions bits.value)

/-- Full all-natural agreement, execution and construction-cost certificate. -/
theorem complete_encoder_certificate (number : Nat) :
    TermExecution number (sourceTerm number).value (sourceTerm number).operations ∧
      (sourceTerm number).value = DeterministicTapePureS.encodeTerm (DeterministicTapeCode.instanceDecodeCode number) ∧
      (sourceTerm number).value.code = PRCode.eval₁ CookEncodingComputability.Program.sourceTerm number ∧
      (sourceTerm number).operations ≤ termBudget number :=
  ⟨sourceTerm_execution number, sourceTerm_value number, sourceTerm_program_agreement number,
    sourceTerm_operations_le number⟩

end PureSFormal.Computation.DeterministicTapeEncoderConstructionMachine

