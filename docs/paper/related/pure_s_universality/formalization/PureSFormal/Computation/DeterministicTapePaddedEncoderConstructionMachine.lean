import PureSFormal.Computation.DeterministicTapePaddingConstructionMachine
import PureSFormal.Computation.DeterministicTapePureSOutput
import PureSFormal.Computation.DeterministicTapeEffectiveReduction

/-!
# Measured encoder for the actual literal-output computation

The all-natural decoder is followed by measured state padding and the complete
source encoder. The resulting word and fully materialized unshared term are
exactly the seed and initial term of `DeterministicTapePureSOutput`.

The fixed closed numeric program certifies the stated numberings. The operation
bound concerns the displayed primitive constructor on unary input and syntax
trees, rather than evaluation time of the independent numeric-code interpreter.
-/
namespace PureSFormal.Computation.DeterministicTapePaddedEncoderConstructionMachine

open PureSFormal.PureS
open PureSFormal.PureS.ParserPrimitiveMachine (Result)
open PureSFormal.Research.ProtectedTrieDeterministicCompiler
open DeterministicTapeEncoderConstructionMachine (actions)

set_option maxRecDepth 4096

def sourceBits (number : Nat) : Result (List Bool) :=
  let source := DeterministicTapeDecodeConstructionMachine.decode number
  let padded := DeterministicTapePaddingConstructionMachine.pad source.value
  let output := DeterministicTapeEncoderConstructionMachine.fromSource padded.value
  ⟨output.value, source.operations + padded.operations + output.operations + 3⟩

theorem sourceBits_value (number : Nat) :
    (sourceBits number).value = DeterministicTapePureSOutput.seed (DeterministicTapeCode.instanceDecodeCode number) := by
  simp only [sourceBits, DeterministicTapeEncoderConstructionMachine.fromSource_value,
    DeterministicTapePaddingConstructionMachine.pad_value, DeterministicTapeDecodeConstructionMachine.decode_value,
    DeterministicTapePureSOutput.seed]

def bitsBudget (number : Nat) : Nat :=
  let source := DeterministicTapeCode.instanceDecodeCode number
  DeterministicTapeDecodeConstructionMachine.decodeBudget number +
    DeterministicTapePaddingConstructionMachine.polynomialBudget source +
    DeterministicTapeEncoderConstructionMachine.sourceBudget (DeterministicTapeStatePadding.pad source) + 3

theorem sourceBits_operations_le (number : Nat) : (sourceBits number).operations ≤ bitsBudget number := by
  simp only [sourceBits, bitsBudget]
  rw [DeterministicTapeDecodeConstructionMachine.decode_value, DeterministicTapePaddingConstructionMachine.pad_value]
  exact Nat.add_le_add_right (Nat.add_le_add
    (Nat.add_le_add (DeterministicTapeDecodeConstructionMachine.decode_operations_le number)
      (DeterministicTapePaddingConstructionMachine.pad_operations_le_polynomial _))
    (DeterministicTapeEncoderConstructionMachine.fromSource_operations_le _)) 3

theorem sourceBits_program_agreement (number : Nat) :
    DeterministicTapeCode.bitListCode (sourceBits number).value =
      PRCode.eval₁ DeterministicTapeStatePaddingComputability.Program.paddedBits number := by
  rw [sourceBits_value, DeterministicTapeStatePaddingComputability.Program.eval_paddedBits]
  rfl

def sourceTerm (number : Nat) : Result Term :=
  let bits := sourceBits number
  let output := EncoderPrimitive.literal actions bits.value
  ⟨output.value, bits.operations + output.operations + 2⟩

theorem sourceTerm_value (number : Nat) :
    (sourceTerm number).value = DeterministicTapePureSOutput.encode (DeterministicTapeCode.instanceDecodeCode number) := by
  simp only [sourceTerm, EncoderPrimitive.literal_value, sourceBits_value,
    DeterministicTapePureSOutput.encode, DeterministicTapePureSOutput.seed,
    DeterministicTapePureS.encodeTerm, DeterministicTapeEncoderConstructionMachine.actions]

def termBudget (number : Nat) : Nat :=
  bitsBudget number +
    (77 * (DeterministicTapePureSOutput.seed (DeterministicTapeCode.instanceDecodeCode number)).length +
      4 * actions.size + 167) + 2

theorem sourceTerm_operations_le (number : Nat) : (sourceTerm number).operations ≤ termBudget number := by
  simp only [sourceTerm, termBudget]
  rw [sourceBits_value]
  have literalBound := EncoderPrimitive.literal_operations_le actions (sourceBits number).value
  rw [sourceBits_value] at literalBound
  exact Nat.add_le_add_right (Nat.add_le_add (sourceBits_operations_le number) literalBound) 2

theorem sourceTerm_program_agreement (number : Nat) :
    (sourceTerm number).value.code =
      PRCode.eval₁ DeterministicTapeStatePaddingComputability.Program.paddedTerm number := by
  rw [sourceTerm_value, DeterministicTapeStatePaddingComputability.Program.eval_paddedTerm]
  rfl

theorem sourceTerm_size_le (number : Nat) :
    (sourceTerm number).value.size ≤ encoderConstant actions +
      18 * (DeterministicTapePureSOutput.seed (DeterministicTapeCode.instanceDecodeCode number)).length := by
  simp only [sourceTerm, EncoderPrimitive.literal_value, sourceBits_value]
  exact generator_size_le_eighteen _ _

inductive BitsExecution (number : Nat) : List Bool → Nat → Prop where
  | construct {source padded : DeterministicTape.Instance} {output : List Bool}
      {decodeOperations paddingOperations sourceOperations : Nat}
      (decoding : DeterministicTapeDecodeConstructionMachine.DecodeExecution number source decodeOperations)
      (padding : DeterministicTapePaddingConstructionMachine.PaddingExecution source padded paddingOperations)
      (encoding : DeterministicTapeEncoderConstructionMachine.SourceExecution padded output sourceOperations) :
      BitsExecution number output (decodeOperations + paddingOperations + sourceOperations + 3)

theorem bitsExecution_compose (number : Nat)
    (source padded : Result DeterministicTape.Instance) (output : Result (List Bool))
    (decoding : DeterministicTapeDecodeConstructionMachine.DecodeExecution number source.value source.operations)
    (padding : DeterministicTapePaddingConstructionMachine.PaddingExecution source.value padded.value padded.operations)
    (encoding : DeterministicTapeEncoderConstructionMachine.SourceExecution padded.value output.value output.operations) :
    BitsExecution number output.value (source.operations + padded.operations + output.operations + 3) :=
  .construct decoding padding encoding

attribute [local irreducible] DeterministicTapeEncoderConstructionMachine.fromSource

theorem sourceBits_execution (number : Nat) : BitsExecution number (sourceBits number).value (sourceBits number).operations := by
  unfold sourceBits
  generalize chosen : DeterministicTapeDecodeConstructionMachine.decode number = source
  have decoding := DeterministicTapeDecodeConstructionMachine.decode_execution number
  rw [chosen] at decoding
  exact bitsExecution_compose number source (DeterministicTapePaddingConstructionMachine.pad source.value)
    (DeterministicTapeEncoderConstructionMachine.fromSource (DeterministicTapePaddingConstructionMachine.pad source.value).value)
    decoding (DeterministicTapePaddingConstructionMachine.pad_execution source.value)
    (DeterministicTapeEncoderConstructionMachine.fromSource_execution _)

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

theorem sourceTerm_is_actual_initial (number : Nat) :
    (sourceTerm number).value = DeterministicTapePureSOutput.termAt (DeterministicTapeCode.instanceDecodeCode number) 0 := by
  rw [DeterministicTapePureSOutput.termAt_zero, sourceTerm_value]

/-- The replacement encoder used by the output endpoint has the same checked
closed program, explicit construction execution, and unconditional bound. -/
theorem complete_padded_encoder_certificate (number : Nat) :
    TermExecution number (sourceTerm number).value (sourceTerm number).operations ∧
      (sourceTerm number).value = DeterministicTapePureSOutput.termAt (DeterministicTapeCode.instanceDecodeCode number) 0 ∧
      (sourceTerm number).value.code = PRCode.eval₁ DeterministicTapeStatePaddingComputability.Program.paddedTerm number ∧
      (sourceTerm number).operations ≤ termBudget number :=
  ⟨sourceTerm_execution number, sourceTerm_is_actual_initial number, sourceTerm_program_agreement number,
    sourceTerm_operations_le number⟩

def encoder (number : Nat) : Nat := (sourceTerm number).value.code

theorem encoder_primitiveRecursive : PrimitiveRecursive encoder :=
  ⟨DeterministicTapeStatePaddingComputability.Program.paddedTerm, fun number => (sourceTerm_program_agreement number).symm⟩

theorem encoder_reducesVia : ReducesVia encoder
    DeterministicTapeEffectiveReduction.sourcePredicate DeterministicTapeEffectiveReduction.targetPredicate := by
  intro number
  unfold encoder DeterministicTapeEffectiveReduction.sourcePredicate DeterministicTapeEffectiveReduction.targetPredicate
  rw [Term.decodeCodeTotal_code, sourceTerm_value]
  exact (DeterministicTapeStatePadding.halts_pad_iff _).symm.trans
    (WeakPathUniversality.deterministicTapeHalts_iff_fixedPureSMarkedSnapshotTermEvent _)

/-- The standard halting reduction uses the same padded, measured initial term
as the literal source-output path. -/
def computableManyOneReduction : ComputableManyOneReduces
    DeterministicTapeEffectiveReduction.sourcePredicate DeterministicTapeEffectiveReduction.targetPredicate where
  reduction := encoder
  computable := PrimitiveRecursive.computable encoder_primitiveRecursive
  correct := encoder_reducesVia

theorem closedProgramReduction (number : Nat) :
    PRCode.eval₁ DeterministicTapeStatePaddingComputability.Program.paddedTerm number = encoder number ∧
      (DeterministicTapeEffectiveReduction.sourcePredicate number ↔
        DeterministicTapeEffectiveReduction.targetPredicate
          (PRCode.eval₁ DeterministicTapeStatePaddingComputability.Program.paddedTerm number)) := by
  refine ⟨(sourceTerm_program_agreement number).symm, ?_⟩
  rw [← sourceTerm_program_agreement]
  exact encoder_reducesVia number

end PureSFormal.Computation.DeterministicTapePaddedEncoderConstructionMachine
