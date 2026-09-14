import PureSFormal.Computation.ThreeCounterTagNumericConstructionMachine

/-!
# Primitive construction of the actual counter-to-tag program

The bound depends only on the primitive input table length and the total unary
size of its branch targets. The constructor does not inspect or run an initial
counter state. Word construction is composed separately.
-/

namespace PureSFormal.Computation.ThreeCounterTagProgramConstructionMachine

open PureSFormal.PureS.ParserPrimitiveMachine (Result)
open PureSFormal.PureS
open ThreeCounterTagNumericConstructionMachine (buildRows rowBudget)
open ThreeCounter (Program)

def prepare (program : Program) : Result (Nat × Nat) :=
  let count := RogozhinInputConstructionMachine.length program
  let width := ParserNatPrimitive.multiply 3 count.value
  let tenBlocks := ParserNatPrimitive.multiply 10 width.value
  let total := ParserNatPrimitive.add 2 tenBlocks.value
  ⟨(width.value, total.value), 1 + count.operations + width.operations + tenBlocks.operations + total.operations⟩

theorem prepare_value (program : Program) :
    (prepare program).value = (3 * program.length, 30 * program.length + 2) := by
  simp only [prepare, ParserNatPrimitive.multiply_value, ParserNatPrimitive.add_value,
    RogozhinInputConstructionMachine.length_value, ← Nat.mul_assoc, Nat.add_comm]

theorem prepare_operations (program : Program) :
    (prepare program).operations = 164 * program.length + 16 := by
  simp only [prepare, RogozhinInputConstructionMachine.length_operations,
    RogozhinInputConstructionMachine.length_value, ParserNatPrimitive.multiply_operations,
    ParserNatPrimitive.multiply_value, ParserNatPrimitive.add_operations]
  change 1 + (4 * program.length + 2) + (19 * program.length + 2) +
    (47 * (3 * program.length) + 2) + 9 =
      (4 + 19 + 47 * 3) * program.length + (1 + 2 + 2 + 2 + 9)
  simp only [Nat.add_mul, Nat.mul_assoc, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

def ordinaryProgram (program : Program) : Result RogozhinTagInput.Program :=
  let prepared := prepare program
  let rows := buildRows program prepared.value.1 prepared.value.2
  ⟨⟨rows.value⟩, 1 + prepared.operations + rows.operations⟩

theorem ordinaryProgram_value (program : Program) :
    (ordinaryProgram program).value = ThreeCounterTag.Numeric.ordinaryProgram program := by
  simp only [ordinaryProgram, prepare_value, ThreeCounterTagNumericConstructionMachine.buildRows_value]
  unfold ThreeCounterTag.Numeric.ordinaryProgram
  have count : ThreeCounterTag.Numeric.ordinaryCount program = 30 * program.length + 2 := by
    unfold ThreeCounterTag.Numeric.ordinaryCount CounterMachineTag.Numeric.ordinaryCount
    rw [ThreeCounterTag.Numeric.enumerationProgram_length, ← Nat.mul_assoc]
  rw [count]

/-- Closed structural input budget: every component reduces to arithmetic in
the table length and the literal unary branch-target sum. -/
def ordinaryBudget (program : Program) : Nat :=
  let width := 3 * program.length
  let count := 30 * program.length + 2
  1 + (164 * program.length + 16) +
    ((rowBudget program width count + 5 + 4 * count) * count + 2)

theorem ordinaryProgram_operations_le (program : Program) :
    (ordinaryProgram program).operations ≤ ordinaryBudget program := by
  have rowsBound := ThreeCounterTagNumericConstructionMachine.buildRows_operations_le
    program (3 * program.length) (30 * program.length + 2)
    (rowBudget program (3 * program.length) (30 * program.length + 2))
    (fun label bounded => Nat.le_trans
      (ThreeCounterTagNumericConstructionMachine.numericRhs_operations_le _ _ _)
      (ThreeCounterTagNumericConstructionMachine.rowBudget_mono _ _ _ _ (Nat.le_of_lt bounded)))
  simp only [ordinaryProgram, prepare_value, prepare_operations, ordinaryBudget]
  exact Nat.add_le_add_left rowsBound _

theorem ordinaryProgram_rows (program : Program) :
    (ordinaryProgram program).value.productions.length = 30 * program.length + 2 := by
  rw [ordinaryProgram_value]
  exact ThreeCounterTagConstructionSize.ordinary_symbolCount program

theorem ordinaryProgram_cells_le (program : Program) :
    ThreeCounterTagConstructionSize.tableCells (ordinaryProgram program).value.productions ≤
      8 * (30 * program.length + 2) := by
  rw [ordinaryProgram_value]
  have bounded := ThreeCounterTagConstructionSize.tableCells_le
    (ThreeCounterTag.Numeric.ordinaryProgram program).productions 8
    (ThreeCounterTagConstructionSize.ordinary_row_length program)
  have rows : (ThreeCounterTag.Numeric.ordinaryProgram program).productions.length = 30 * program.length + 2 :=
    ThreeCounterTagConstructionSize.ordinary_symbolCount program
  rw [rows] at bounded
  exact bounded

def normalizedProgram (program : Program) : Result RogozhinTagInput.Program :=
  let ordinary := ordinaryProgram program
  let normalized := DeletionTwoTableConstructionMachine.normalizeProgram ordinary.value
  ⟨normalized.value, ordinary.operations + normalized.operations⟩

theorem normalizedProgram_value (program : Program) :
    (normalizedProgram program).value =
      DeletionTwoT2Normalizer.normalizeProgram (ThreeCounterTag.Numeric.ordinaryProgram program) := by
  rw [normalizedProgram, DeletionTwoTableConstructionMachine.normalizeProgram_value, ordinaryProgram_value]

theorem normalizedProgram_compileT2 (program : Program) (initial : ThreeCounter.State) :
    (normalizedProgram program).value = (ThreeCounterTag.Numeric.compileT2 program initial).program :=
  normalizedProgram_value program

def normalizedBudget (program : Program) : Nat :=
  let count := 30 * program.length + 2
  ordinaryBudget program + ((4 * count + 7) * (8 * count) + 14 * count + 11)

theorem normalizedProgram_operations_le (program : Program) :
    (normalizedProgram program).operations ≤ normalizedBudget program := by
  have normalizerBound := DeletionTwoTableConstructionMachine.normalizeProgram_operations_le
    (ordinaryProgram program).value
  rw [ordinaryProgram_rows] at normalizerBound
  have normalizerBudget := Nat.le_trans normalizerBound
    (Nat.add_le_add_right (Nat.add_le_add_right
      (Nat.mul_le_mul_left _ (ordinaryProgram_cells_le program)) _) _)
  exact Nat.add_le_add (ordinaryProgram_operations_le program) normalizerBudget

theorem normalizedProgram_rows (program : Program) :
    (normalizedProgram program).value.productions.length = 30 * program.length + 3 := by
  rw [normalizedProgram_value]
  have result := DeletionTwoT2Normalizer.normalize_symbolCount (ThreeCounterTag.Numeric.ordinaryProgram program)
  rw [ThreeCounterTagConstructionSize.ordinary_symbolCount] at result
  exact result

theorem normalizedProgram_cells_le (program : Program) :
    ThreeCounterTagConstructionSize.tableCells (normalizedProgram program).value.productions ≤
      10 * (30 * program.length + 3) := by
  rw [normalizedProgram_compileT2 program ⟨0, 0, 0, 0, .halted⟩]
  exact ThreeCounterTagConstructionSize.normalized_tableCells _ _

inductive PreparationExecution (program : Program) : Nat × Nat → Nat → Prop where
  | construct {count operations : Nat}
      (countRun : RogozhinInputConstructionMachine.LengthExecution program count operations) :
      PreparationExecution program
        ((ParserNatPrimitive.multiply 3 count).value,
          (ParserNatPrimitive.add 2 (ParserNatPrimitive.multiply 10 (ParserNatPrimitive.multiply 3 count).value).value).value)
        (1 + operations + (ParserNatPrimitive.multiply 3 count).operations +
          (ParserNatPrimitive.multiply 10 (ParserNatPrimitive.multiply 3 count).value).operations +
          (ParserNatPrimitive.add 2 (ParserNatPrimitive.multiply 10 (ParserNatPrimitive.multiply 3 count).value).value).operations)

theorem prepare_execution (program : Program) :
    PreparationExecution program (prepare program).value (prepare program).operations :=
  .construct (RogozhinInputConstructionMachine.length_execution _)

inductive ProgramExecution (program : Program) : RogozhinTagInput.Program → Nat → Prop where
  | construct {width count prepareOperations rowOperations : Nat} {rows : List (List Nat)}
      (prepareRun : PreparationExecution program (width, count) prepareOperations)
      (rowsRun : ThreeCounterTagNumericConstructionMachine.RowsExecution program width count rows rowOperations) :
      ProgramExecution program ⟨rows⟩ (1 + prepareOperations + rowOperations)

theorem ordinaryProgram_execution (program : Program) :
    ProgramExecution program (ordinaryProgram program).value (ordinaryProgram program).operations :=
  .construct (prepare_execution _) (ThreeCounterTagNumericConstructionMachine.buildRows_execution _ _ _)

inductive NormalizedExecution (program : Program) : RogozhinTagInput.Program → Nat → Prop where
  | construct {ordinary normalized : RogozhinTagInput.Program} {ordinaryOperations normalizationOperations : Nat}
      (ordinaryRun : ProgramExecution program ordinary ordinaryOperations)
      (normalizationRun : DeletionTwoTableConstructionMachine.ProgramExecution ordinary normalized normalizationOperations) :
      NormalizedExecution program normalized (ordinaryOperations + normalizationOperations)

theorem normalizedProgram_execution (program : Program) :
    NormalizedExecution program (normalizedProgram program).value (normalizedProgram program).operations :=
  .construct (ordinaryProgram_execution _) (DeletionTwoTableConstructionMachine.normalizeProgram_execution _)

end PureSFormal.Computation.ThreeCounterTagProgramConstructionMachine

