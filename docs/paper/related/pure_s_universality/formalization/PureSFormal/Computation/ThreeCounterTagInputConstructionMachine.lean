import PureSFormal.Computation.ThreeCounterTagProgramConstructionMachine
import PureSFormal.PureS.ParserNatPowerPrimitive

/-!
# Primitive construction of initialized three-counter tag jobs

The input table and unary register values are immutable data. Every power of
two and every emitted tag cell is constructed by the measured primitives.
The bounds include the exponential register blocks required by this encoding;
they do not depend on a source execution or a halting time.
-/

namespace PureSFormal.Computation.ThreeCounterTagInputConstructionMachine

open PureSFormal.PureS.ParserPrimitiveMachine (Result)
open PureSFormal.PureS
open ThreeCounter (Program Instruction Register State)
open CounterMachineTag (Symbol)
open ThreeCounterTagTypedConstructionMachine (instruction header scale payload)
open CookWordConstructionMachine (replicateOnto)

def block (current : Instruction) (control : Nat) (register : Register)
    (value : Nat) (tail : List Symbol) : Result (List Symbol) :=
  if ThreeCounterTag.instructionLive current then
    let factor := scale current register
    let power := ParserNatPowerPrimitive.pow2 value
    let count := ParserNatPrimitive.multiply factor.value power.value
    let code := payload control register
    let output := replicateOnto (Symbol.first code.value) count.value tail
    ⟨output.value, 1 + factor.operations + power.operations + count.operations +
      code.operations + output.operations + 1⟩
  else ⟨tail, 1⟩

theorem block_value (program : Program) (control : Nat) (register : Register)
    (value : Nat) (tail : List Symbol) :
    (block (ThreeCounter.instructionAt program control) control register value tail).value =
      ThreeCounterTag.dataBlock program control register value ++ tail := by
  simp only [block, ThreeCounterTag.dataBlock]
  split
  · simp only [CookWordConstructionMachine.replicateOnto_value,
      ParserNatPrimitive.multiply_value, ParserNatPowerPrimitive.pow2_value,
      ThreeCounterTagTypedConstructionMachine.scale_value,
      ThreeCounterTagTypedConstructionMachine.payload_value,
      ThreeCounterTag.dataSymbol, CounterMachineTag.radix]
  · rfl

def blockBudget (control value : Nat) : Nat :=
  1 + 5 + (4 * 2 ^ value + 3 * value) + (15 * 2 ^ value + 2) +
    (19 * control + 12) + (8 * 2 ^ value + 1) + 1

theorem block_operations_le (current : Instruction) (control : Nat) (register : Register)
    (value : Nat) (tail : List Symbol) :
    (block current control register value tail).operations ≤ blockBudget control value := by
  have factorBound := ThreeCounterTagTypedConstructionMachine.scale_operations_le current register
  have factorSize := ThreeCounterTagTypedConstructionMachine.scale_value_le_two current register
  have countBound :
      (ParserNatPrimitive.multiply (scale current register).value
        (ParserNatPowerPrimitive.pow2 value).value).operations ≤ 15 * 2 ^ value + 2 := by
    rw [ParserNatPrimitive.multiply_operations, ParserNatPowerPrimitive.pow2_value]
    exact Nat.add_le_add_right
      (Nat.mul_le_mul_right _ (Nat.add_le_add_right (Nat.mul_le_mul_left 4 factorSize) 7)) 2
  have outputBound :
      (replicateOnto (Symbol.first (payload control register).value)
        (ParserNatPrimitive.multiply (scale current register).value
          (ParserNatPowerPrimitive.pow2 value).value).value tail).operations ≤ 8 * 2 ^ value + 1 := by
    rw [CookWordConstructionMachine.replicateOnto_operations,
      ParserNatPrimitive.multiply_value, ParserNatPowerPrimitive.pow2_value]
    have bound := Nat.add_le_add_right
      (Nat.mul_le_mul_left 4 (Nat.mul_le_mul_right (2 ^ value) factorSize)) 1
    simpa only [← Nat.mul_assoc] using bound
  rw [block]
  split
  · exact Nat.add_le_add_right (Nat.add_le_add (Nat.add_le_add
      (Nat.add_le_add (Nat.add_le_add (Nat.add_le_add_left factorBound 1)
        (ParserNatPowerPrimitive.pow2_operations_le value)) countBound)
      (ThreeCounterTagTypedConstructionMachine.payload_operations_le control register)) outputBound) 1
  · exact Nat.le_add_left _ _

def canonical (program : Program) (state : State) : Result (List Symbol) :=
  let current := instruction program state.control
  let scratch := block current.value state.control .scratch state.scratch []
  let right := block current.value state.control .right state.right scratch.value
  let left := block current.value state.control .left state.left right.value
  let leading := header program state.control
  let output := RogozhinProgramConstructionMachine.copy leading.value left.value
  ⟨output.value, 4 + current.operations + scratch.operations + right.operations +
    left.operations + leading.operations + output.operations⟩

theorem canonical_value (program : Program) (state : State) :
    (canonical program state).value =
      ThreeCounterTag.canonical program state.control state.left state.right state.scratch := by
  simp only [canonical, RogozhinProgramConstructionMachine.copy_value,
    ThreeCounterTagTypedConstructionMachine.instruction_value,
    ThreeCounterTagTypedConstructionMachine.header_value, block_value,
    ThreeCounterTag.canonical, List.append_nil, List.append_assoc]

def canonicalBudget (program : Program) (state : State) : Nat :=
  4 + (5 * program.length + 3) + blockBudget state.control state.scratch +
    blockBudget state.control state.right + blockBudget state.control state.left +
    (5 * program.length + 9) + 9

theorem canonical_operations_le (program : Program) (state : State) :
    (canonical program state).operations ≤ canonicalBudget program state := by
  have copyCost : (RogozhinProgramConstructionMachine.copy
      (header program state.control).value
      (block (instruction program state.control).value state.control .left state.left
        (block (instruction program state.control).value state.control .right state.right
          (block (instruction program state.control).value state.control .scratch state.scratch []).value).value).value).operations = 9 := by
    rw [RogozhinProgramConstructionMachine.copy_operations,
      ThreeCounterTagTypedConstructionMachine.header_value, ThreeCounterTagConstructionSize.header_length]
  unfold canonical canonicalBudget
  dsimp only
  rw [copyCost]
  exact Nat.add_le_add_right (Nat.add_le_add (Nat.add_le_add (Nat.add_le_add (Nat.add_le_add
    (Nat.add_le_add_left (ThreeCounterTagTypedConstructionMachine.instruction_operations_le _ _) 4)
    (block_operations_le _ _ _ _ _)) (block_operations_le _ _ _ _ _))
    (block_operations_le _ _ _ _ _)) (ThreeCounterTagTypedConstructionMachine.header_operations_le _ _)) 9

def typedState (program : Program) (state : State) : Result (List Symbol) :=
  match state.status with
  | .halted => ⟨[.halt, .sink], 4⟩
  | .running =>
      let output := canonical program state
      ⟨output.value, output.operations + 1⟩

theorem typedState_value (program : Program) (state : State) :
    (typedState program state).value = ThreeCounterTag.encodeState program state := by
  cases status : state.status <;>
    simp only [typedState, ThreeCounterTag.encodeState, status, canonical_value]

theorem typedState_operations_le (program : Program) (state : State) :
    (typedState program state).operations ≤ canonicalBudget program state + 4 := by
  unfold typedState
  cases status : state.status with
  | halted => exact Nat.le_add_left 4 _
  | running =>
      exact Nat.le_trans (Nat.add_le_add_right (canonical_operations_le program state) 1)
        (Nat.add_le_add_left (by decide : 1 ≤ 4) _)

def ordinaryWord (program : Program) (state : State) : Result (List Nat) :=
  let prepared := ThreeCounterTagProgramConstructionMachine.prepare program
  let typed := typedState program state
  let output := ThreeCounterTagNumericConstructionMachine.encodeWord prepared.value.1 typed.value
  ⟨output.value, prepared.operations + typed.operations + output.operations⟩

theorem ordinaryWord_value (program : Program) (state : State) :
    (ordinaryWord program state).value = ThreeCounterTag.Numeric.ordinaryInitialWord program state := by
  simp only [ordinaryWord, ThreeCounterTagProgramConstructionMachine.prepare_value,
    ThreeCounterTagNumericConstructionMachine.encodeWord_value, typedState_value]
  rfl

theorem ordinaryWord_length (program : Program) (state : State) :
    (ordinaryWord program state).value.length = 2 + ThreeCounterTagConstructionSize.initialMass program state := by
  rw [ordinaryWord_value]
  simp only [ThreeCounterTag.Numeric.ordinaryInitialWord, ThreeCounterTag.Numeric.encodeWord,
    List.length_map, ThreeCounterTagConstructionSize.encodeState_length]

def wordBudget (program : Program) (state : State) : Nat :=
  (164 * program.length + 16) + (canonicalBudget program state + 4) +
    ((87 * (3 * program.length) + 9) * (2 + ThreeCounterTagConstructionSize.initialMass program state) + 2)

theorem ordinaryWord_operations_le (program : Program) (state : State) :
    (ordinaryWord program state).operations ≤ wordBudget program state := by
  have encoded := ThreeCounterTagNumericConstructionMachine.encodeWord_operations_le
    (3 * program.length) (typedState program state).value
  rw [typedState_value, ThreeCounterTagConstructionSize.encodeState_length] at encoded
  have bound := Nat.add_le_add (Nat.add_le_add_left (typedState_operations_le program state)
    (164 * program.length + 16)) encoded
  simpa only [ordinaryWord, ThreeCounterTagProgramConstructionMachine.prepare_value,
    ThreeCounterTagProgramConstructionMachine.prepare_operations, wordBudget, typedState_value] using bound

/-- The table is constructed once, then used by the word normalizer. -/
def compile (program : Program) (state : State) : Result RogozhinTagInput.Job :=
  let table := ThreeCounterTagProgramConstructionMachine.ordinaryProgram program
  let word := ordinaryWord program state
  let normalized := DeletionTwoTableConstructionMachine.normalizeJob table.value word.value
  ⟨normalized.value, table.operations + word.operations + normalized.operations⟩

theorem compile_value (program : Program) (state : State) :
    (compile program state).value = ThreeCounterTag.Numeric.compileT2 program state := by
  simp only [compile, DeletionTwoTableConstructionMachine.normalizeJob_value,
    ThreeCounterTagProgramConstructionMachine.ordinaryProgram_value, ordinaryWord_value]
  rfl

def compileBudget (program : Program) (state : State) : Nat :=
  let count := 30 * program.length + 2
  ThreeCounterTagProgramConstructionMachine.ordinaryBudget program + wordBudget program state +
    ((4 * count + 7) * (8 * count + (2 + ThreeCounterTagConstructionSize.initialMass program state)) +
      18 * count + 20)

theorem compile_operations_le (program : Program) (state : State) :
    (compile program state).operations ≤ compileBudget program state := by
  have normalization := DeletionTwoTableConstructionMachine.normalizeJob_operations_le
    (ThreeCounterTagProgramConstructionMachine.ordinaryProgram program).value (ordinaryWord program state).value
  rw [ThreeCounterTagProgramConstructionMachine.ordinaryProgram_rows, ordinaryWord_length] at normalization
  have enlarged := Nat.add_le_add_right (Nat.add_le_add_right
    (Nat.mul_le_mul_left (4 * (30 * program.length + 2) + 7)
      (Nat.add_le_add_right (ThreeCounterTagProgramConstructionMachine.ordinaryProgram_cells_le program)
        (2 + ThreeCounterTagConstructionSize.initialMass program state)))
    (18 * (30 * program.length + 2))) 20
  exact Nat.add_le_add (Nat.add_le_add
    (ThreeCounterTagProgramConstructionMachine.ordinaryProgram_operations_le program)
    (ordinaryWord_operations_le program state)) (Nat.le_trans normalization enlarged)

def cookBits (program : Program) (state : State) : Result (List Bool) :=
  let job := compile program state
  let output := RogozhinProgramConstructionMachine.cookBits job.value
  ⟨output.value, job.operations + output.operations⟩

theorem cookBits_value (program : Program) (state : State) :
    (cookBits program state).value = Cook.encodeWord (Cook.PassClassification.canonicalWord
      (RogozhinTagInput.compile (ThreeCounterTag.Numeric.compileT2 program state))) := by
  rw [cookBits, RogozhinProgramConstructionMachine.cookBits_value, compile_value]

theorem cookBits_operations_le (program : Program) (state : State) :
    (cookBits program state).operations ≤ compileBudget program state +
      RogozhinProgramConstructionMachine.compileBudget (ThreeCounterTag.Numeric.compileT2 program state) +
      5 * (cookBits program state).value.length +
      8 * ((RogozhinTagInput.compile (ThreeCounterTag.Numeric.compileT2 program state)).left.length +
        (RogozhinTagInput.compile (ThreeCounterTag.Numeric.compileT2 program state)).right.length) + 17 := by
  have bound := Nat.add_le_add (compile_operations_le program state)
    (RogozhinProgramConstructionMachine.cookBits_operations_le (compile program state).value)
  simpa only [cookBits, compile_value, Nat.add_assoc] using bound

inductive BlockExecution (current : Instruction) (control : Nat) (register : Register)
    (value : Nat) (tail : List Symbol) : List Symbol → Nat → Prop where
  | halted (stopped : ThreeCounterTag.instructionLive current = false) :
      BlockExecution current control register value tail tail 1
  | live {power powerOperations outputOperations : Nat} {output : List Symbol}
      (running : ThreeCounterTag.instructionLive current = true)
      (powerRun : ParserNatPowerPrimitive.PowerExecution value power powerOperations)
      (cells : CookWordConstructionMachine.ReplicateExecution
        (Symbol.first (payload control register).value)
        (ParserNatPrimitive.multiply (scale current register).value power).value
        tail output outputOperations) :
      BlockExecution current control register value tail output
        (1 + (scale current register).operations + powerOperations +
          (ParserNatPrimitive.multiply (scale current register).value power).operations +
          (payload control register).operations + outputOperations + 1)

theorem block_execution (current : Instruction) (control : Nat) (register : Register)
    (value : Nat) (tail : List Symbol) :
    BlockExecution current control register value tail
      (block current control register value tail).value
      (block current control register value tail).operations := by
  cases live : ThreeCounterTag.instructionLive current with
  | false =>
      simpa only [block, live, Bool.false_eq_true, ↓reduceIte] using
        BlockExecution.halted (control := control) (register := register) (value := value) (tail := tail) live
  | true =>
      simpa only [block, live, ↓reduceIte] using
        BlockExecution.live (control := control) (register := register) (tail := tail) live
        (ParserNatPowerPrimitive.pow2_execution value)
        (CookWordConstructionMachine.replicateOnto_execution _ _ _)

inductive CanonicalExecution (program : Program) (state : State) : List Symbol → Nat → Prop where
  | construct {current : Instruction} {scratch right left leading output : List Symbol}
      {currentOperations scratchOperations rightOperations leftOperations
        headerOperations copyOperations : Nat}
      (lookup : RogozhinInputConstructionMachine.LookupExecution Instruction.halt
        program state.control current currentOperations)
      (scratchRun : BlockExecution current state.control .scratch state.scratch [] scratch scratchOperations)
      (rightRun : BlockExecution current state.control .right state.right scratch right rightOperations)
      (leftRun : BlockExecution current state.control .left state.left right left leftOperations)
      (headRun : ThreeCounterTagTypedConstructionMachine.HeaderExecution program state.control leading headerOperations)
      (copyRun : RogozhinProgramConstructionMachine.CopyExecution leading left output copyOperations) :
      CanonicalExecution program state output
        (4 + currentOperations + scratchOperations + rightOperations + leftOperations + headerOperations + copyOperations)

theorem canonical_execution (program : Program) (state : State) :
    CanonicalExecution program state (canonical program state).value (canonical program state).operations :=
  .construct (ThreeCounterTagTypedConstructionMachine.instruction_execution _ _)
    (block_execution _ _ _ _ _) (block_execution _ _ _ _ _) (block_execution _ _ _ _ _)
    (ThreeCounterTagTypedConstructionMachine.header_execution _ _)
    (RogozhinProgramConstructionMachine.copy_execution _ _)

inductive TypedExecution (program : Program) (state : State) : List Symbol → Nat → Prop where
  | halted (status : state.status = .halted) : TypedExecution program state [.halt, .sink] 4
  | running {output : List Symbol} {operations : Nat} (status : state.status = .running)
      (run : CanonicalExecution program state output operations) :
      TypedExecution program state output (operations + 1)

theorem typedState_execution (program : Program) (state : State) :
    TypedExecution program state (typedState program state).value (typedState program state).operations := by
  cases status : state.status with
  | halted => simpa only [typedState, status] using TypedExecution.halted (program := program) status
  | running => simpa only [typedState, status] using TypedExecution.running status (canonical_execution program state)

inductive WordExecution (program : Program) (state : State) : List Nat → Nat → Prop where
  | construct {width count preparationOperations typedOperations encodingOperations : Nat}
      {typed : List Symbol} {output : List Nat}
      (preparation : ThreeCounterTagProgramConstructionMachine.PreparationExecution program
        (width, count) preparationOperations)
      (typedRun : TypedExecution program state typed typedOperations)
      (encoding : ThreeCounterTagNumericConstructionMachine.EncodingExecution width typed output encodingOperations) :
      WordExecution program state output (preparationOperations + typedOperations + encodingOperations)

theorem ordinaryWord_execution (program : Program) (state : State) :
    WordExecution program state (ordinaryWord program state).value (ordinaryWord program state).operations :=
  .construct (ThreeCounterTagProgramConstructionMachine.prepare_execution _)
    (typedState_execution _ _) (ThreeCounterTagNumericConstructionMachine.encodeWord_execution _ _)

inductive CompilationExecution (program : Program) (state : State) : RogozhinTagInput.Job → Nat → Prop where
  | construct {table : RogozhinTagInput.Program} {word : List Nat} {job : RogozhinTagInput.Job}
      {tableOperations wordOperations normalizationOperations : Nat}
      (tableRun : ThreeCounterTagProgramConstructionMachine.ProgramExecution program table tableOperations)
      (wordRun : WordExecution program state word wordOperations)
      (normalization : DeletionTwoTableConstructionMachine.JobExecution table word job normalizationOperations) :
      CompilationExecution program state job (tableOperations + wordOperations + normalizationOperations)

theorem compile_execution (program : Program) (state : State) :
    CompilationExecution program state (compile program state).value (compile program state).operations :=
  .construct (ThreeCounterTagProgramConstructionMachine.ordinaryProgram_execution _)
    (ordinaryWord_execution _ _) (DeletionTwoTableConstructionMachine.normalizeJob_execution _ _)

inductive CookExecution (program : Program) (state : State) : List Bool → Nat → Prop where
  | construct {job : RogozhinTagInput.Job} {output : List Bool} {compilationOperations cookOperations : Nat}
      (compilation : CompilationExecution program state job compilationOperations)
      (encoding : RogozhinProgramConstructionMachine.CookExecution job output cookOperations) :
      CookExecution program state output (compilationOperations + cookOperations)

theorem cookBits_execution (program : Program) (state : State) :
    CookExecution program state (cookBits program state).value (cookBits program state).operations :=
  .construct (compile_execution _ _) (RogozhinProgramConstructionMachine.cookBits_execution _)

/-- Agreement with the source endpoint, with the tape-to-counter front end
supplied as already constructed input to this measured stage. -/
theorem cookBits_source_value (source : DeterministicTapeCook.SourceInstance) :
    (cookBits (DeterministicTapeCook.compileThreeCounterJob source).program
      (DeterministicTapeCook.compileThreeCounterJob source).initial).value =
      DeterministicTapeCook.encodeBits source := by
  rw [cookBits_value]
  rfl

end PureSFormal.Computation.ThreeCounterTagInputConstructionMachine
