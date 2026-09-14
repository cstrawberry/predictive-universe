import PureSFormal.Computation.ThreeCounterTagComputability

set_option backward.isDefEq.respectTransparency false

/-!
# Literal construction sizes at the normalized two-tag boundary

These bounds count the actual finite table rows, production-label cells and
initial-word cells. Register values contribute powers of two because the
compiler materializes unary blocks of that length. The bounds are syntax-size
claims; they do not assign a primitive execution cost to the constructor.
-/

namespace PureSFormal.Computation.ThreeCounterTagConstructionSize

open ThreeCounterTag

theorem scale_le_two (instruction : ThreeCounter.Instruction) (register : ThreeCounter.Register) :
    scale instruction register ≤ 2 := by
  unfold scale
  split <;> decide

theorem lane_formula_le_eight (instruction nextInstruction : ThreeCounter.Instruction)
    (register : ThreeCounter.Register) (positive : Bool) :
    (if instructionLive nextInstruction then
      let nextScale := scale nextInstruction register
      if instructionTested? instruction = some register then
        match instruction with
        | .increment _ _ => nextScale * (if positive then 4 else 2)
        | .decrementJump _ _ _ => nextScale
        | .halt => 0
      else nextScale
    else 0) ≤ 8 := by
  cases instruction <;> cases nextInstruction <;> cases positive <;>
    simp only [instructionLive, instructionTested?, scale, Bool.false_eq_true,
      ↓reduceIte]
  all_goals repeat' (first | decide | split)

theorem laneMultiplicity_le_eight (program : ThreeCounter.Program) (control : Nat)
    (register : ThreeCounter.Register) (positive : Bool) :
    laneMultiplicity program control register positive ≤ 8 :=
  lane_formula_le_eight (ThreeCounter.instructionAt program control)
    (ThreeCounter.instructionAt program (branchNext (ThreeCounter.instructionAt program control) positive))
    register positive

theorem header_length (program : ThreeCounter.Program) (control : Nat) :
    (header program control).length = 2 := by
  unfold header
  cases ThreeCounter.instructionAt program control <;> rfl

theorem production_length_le_eight (program : ThreeCounter.Program) (symbol : CounterMachineTag.Symbol) :
    (production program symbol).length ≤ 8 := by
  cases symbol <;>
    simp only [production, laneOutput, List.length_replicate, List.length_cons,
      List.length_nil, header_length]
  all_goals first | decide | exact laneMultiplicity_le_eight _ _ _ _

theorem ordinary_symbolCount (program : ThreeCounter.Program) :
    RogozhinTagInput.symbolCount (Numeric.ordinaryProgram program) = 30 * program.length + 2 := by
  rw [Numeric.ordinaryProgram_symbolCount]
  simp only [Numeric.ordinaryCount, CounterMachineTag.Numeric.ordinaryCount,
    Numeric.enumerationProgram_length, ← Nat.mul_assoc]

theorem normalized_symbolCount (program : ThreeCounter.Program) (initial : ThreeCounter.State) :
    RogozhinTagInput.symbolCount (Numeric.compileT2 program initial).program = 30 * program.length + 3 := by
  rw [Numeric.compileT2, DeletionTwoT2Normalizer.normalize_symbolCount, ordinary_symbolCount, Nat.add_assoc]

theorem map_members {α β : Type} (entries : List α) (entry : α → β) (property : β → Prop)
    (correct : ∀ source, source ∈ entries → property (entry source)) :
    ∀ value, value ∈ entries.map entry → property value := by
  induction entries with
  | nil => intro value member; cases member
  | cons first rest ih =>
      intro value member
      cases member with
      | head => exact correct first (List.Mem.head _)
      | tail _ member => exact ih (fun source present => correct source (List.Mem.tail _ present)) value member

theorem ordinary_row_length (program : ThreeCounter.Program) (row : List Nat)
    (member : row ∈ (Numeric.ordinaryProgram program).productions) : row.length ≤ 8 := by
  refine map_members _ _ (fun value : List Nat => value.length ≤ 8) ?_ row member
  intro label _
  rw [Numeric.numericRhs, List.length_map]
  exact production_length_le_eight _ _

theorem normalized_rhs_length (program : RogozhinTagInput.Program) (row : List Nat)
    (bounded : row.length ≤ 8) :
    (DeletionTwoT2Normalizer.normalizedRhs program row).length ≤ 10 := by
  cases row with
  | nil => change 4 ≤ 10; decide
  | cons first rest =>
      simp only [DeletionTwoT2Normalizer.normalizedRhs, List.cons_ne_nil, ↓reduceIte,
        List.length_cons, DeletionTwoT2Normalizer.encodeWord, List.length_map]
      exact Nat.succ_le_succ (Nat.succ_le_succ bounded)

theorem normalized_row_length (program : ThreeCounter.Program) (initial : ThreeCounter.State) (row : List Nat)
    (member : row ∈ (Numeric.compileT2 program initial).program.productions) : row.length ≤ 10 := by
  change row ∈ ((Numeric.ordinaryProgram program).productions.map
    (DeletionTwoT2Normalizer.normalizedRhs (Numeric.ordinaryProgram program)) ++
    [[DeletionTwoT2Normalizer.delayLabel (Numeric.ordinaryProgram program),
      DeletionTwoT2Normalizer.delayLabel (Numeric.ordinaryProgram program)]]) at member
  rcases List.mem_append.mp member with old | delay
  · exact map_members _ _ (fun value : List Nat => value.length ≤ 10)
      (fun source sourceMember => normalized_rhs_length _ _ (ordinary_row_length program source sourceMember)) row old
  · have equal := List.mem_singleton.mp delay
    rw [equal]
    change 2 ≤ 10
    decide

def tableCells : List (List Nat) → Nat
  | [] => 0
  | row :: rest => row.length + tableCells rest

theorem tableCells_le (rows : List (List Nat)) (bound : Nat)
    (bounded : ∀ row, row ∈ rows → row.length ≤ bound) : tableCells rows ≤ bound * rows.length := by
  induction rows with
  | nil => exact Nat.zero_le _
  | cons row rest ih =>
      have rowBound := bounded row (List.Mem.head _)
      have restBound := ih (fun value member => bounded value (List.Mem.tail _ member))
      calc
        tableCells (row :: rest) ≤ bound + bound * rest.length := Nat.add_le_add rowBound restBound
        _ = bound * (row :: rest).length := by rw [List.length_cons, Nat.mul_succ, Nat.add_comm]

theorem normalized_tableCells (program : ThreeCounter.Program) (initial : ThreeCounter.State) :
    tableCells (Numeric.compileT2 program initial).program.productions ≤ 10 * (30 * program.length + 3) := by
  have bound := tableCells_le (Numeric.compileT2 program initial).program.productions 10
    (normalized_row_length program initial)
  change tableCells _ ≤ 10 * RogozhinTagInput.symbolCount (Numeric.compileT2 program initial).program at bound
  rw [normalized_symbolCount] at bound
  exact bound

def registerMass (instruction : ThreeCounter.Instruction) (state : ThreeCounter.State) : Nat :=
  scale instruction .left * 2 ^ state.left +
    scale instruction .right * 2 ^ state.right +
    scale instruction .scratch * 2 ^ state.scratch

def initialMass (program : ThreeCounter.Program) (state : ThreeCounter.State) : Nat :=
  match state.status with
  | .halted => 0
  | .running =>
      if instructionLive (ThreeCounter.instructionAt program state.control) then
        registerMass (ThreeCounter.instructionAt program state.control) state
      else 0

theorem encodeState_length (program : ThreeCounter.Program) (state : ThreeCounter.State) :
    (encodeState program state).length = 2 + initialMass program state := by
  simp only [encodeState, initialMass]
  cases state.status with
  | halted => rfl
  | running =>
      simp only [canonical, List.length_append, header_length, dataBlock]
      cases instructionLive (ThreeCounter.instructionAt program state.control) <;>
        simp only [Bool.false_eq_true, ↓reduceIte, List.length_nil, List.length_replicate,
          registerMass, CounterMachineTag.radix, Nat.add_zero, Nat.add_assoc]

theorem normalized_initialWord_length (program : ThreeCounter.Program) (state : ThreeCounter.State) :
    (Numeric.compileT2 program state).word.length = 4 + initialMass program state := by
  simp only [Numeric.compileT2, DeletionTwoT2Normalizer.normalizeWord,
    DeletionTwoT2Normalizer.encodeWord, List.length_append, List.length_map,
    List.length_cons, List.length_nil, Numeric.ordinaryInitialWord, Numeric.encodeWord,
    encodeState_length, Nat.add_assoc, Nat.add_left_comm, Nat.add_comm]
  simp only [Nat.zero_add, ← Nat.add_assoc]

theorem registerMass_le (instruction : ThreeCounter.Instruction) (state : ThreeCounter.State) :
    registerMass instruction state ≤ 2 * (2 ^ state.left + 2 ^ state.right + 2 ^ state.scratch) := by
  have left := Nat.mul_le_mul_right (2 ^ state.left) (scale_le_two instruction .left)
  have right := Nat.mul_le_mul_right (2 ^ state.right) (scale_le_two instruction .right)
  have scratch := Nat.mul_le_mul_right (2 ^ state.scratch) (scale_le_two instruction .scratch)
  have bound := Nat.add_le_add (Nat.add_le_add left right) scratch
  rw [← Nat.mul_add, ← Nat.mul_add] at bound
  exact bound

theorem initialMass_le (program : ThreeCounter.Program) (state : ThreeCounter.State) :
    initialMass program state ≤ 2 * (2 ^ state.left + 2 ^ state.right + 2 ^ state.scratch) := by
  cases status : state.status with
  | halted =>
      simp only [initialMass, status]
      exact Nat.zero_le _
  | running =>
      simp only [initialMass, status]
      split
      · exact registerMass_le _ _
      · exact Nat.zero_le _

theorem normalized_initialWord_le (program : ThreeCounter.Program) (state : ThreeCounter.State) :
    (Numeric.compileT2 program state).word.length ≤
      4 + 2 * (2 ^ state.left + 2 ^ state.right + 2 ^ state.scratch) := by
  rw [normalized_initialWord_length]
  exact Nat.add_le_add_left (initialMass_le program state) 4

theorem source_symbolCount (source : DeterministicTapeCook.SourceInstance) :
    RogozhinTagInput.symbolCount (DeterministicTapeCook.compileT2Job source).program =
      3810 * source.machine.states.length + 3 := by
  change RogozhinTagInput.symbolCount (Numeric.compileT2
    (DeterministicTapeThreeCounterCompiler.Compiler.compileMachine source.machine)
    (DeterministicTapeThreeCounterCompiler.Execution.compileInitial source)).program = _
  rw [normalized_symbolCount, DeterministicTapeThreeCounterCompiler.Compiler.compileMachine_length]
  simp only [DeterministicTapeThreeCounterCompiler.Compiler.haltAddress,
    DeterministicTapeThreeCounterCompiler.Layout.phaseCount, Nat.mul_comm source.machine.states.length 127,
    ← Nat.mul_assoc]

theorem source_tableCells (source : DeterministicTapeCook.SourceInstance) :
    tableCells (DeterministicTapeCook.compileT2Job source).program.productions ≤
      10 * (3810 * source.machine.states.length + 3) := by
  have bound := tableCells_le (DeterministicTapeCook.compileT2Job source).program.productions 10
    (normalized_row_length
      (DeterministicTapeThreeCounterCompiler.Compiler.compileMachine source.machine)
      (DeterministicTapeThreeCounterCompiler.Execution.compileInitial source))
  change tableCells _ ≤ 10 * RogozhinTagInput.symbolCount (DeterministicTapeCook.compileT2Job source).program at bound
  rw [source_symbolCount] at bound
  exact bound

theorem source_initialWord_le (source : DeterministicTapeCook.SourceInstance) :
    (DeterministicTapeCook.compileT2Job source).word.length ≤
      4 + 2 * (4 + 2 ^ (DeterministicTapeCode.bitListCode source.input + 1 + 2 ^ source.input.length) + 1) := by
  have bound := normalized_initialWord_le
    (DeterministicTapeThreeCounterCompiler.Compiler.compileMachine source.machine)
    (DeterministicTapeThreeCounterCompiler.Execution.compileInitial source)
  change (DeterministicTapeCook.compileT2Job source).word.length ≤
    4 + 2 * (4 + 2 ^ (DeterministicTapeCounterCompiler.StackCode.encode (source.input ++ [false])) + 1) at bound
  rw [DeterministicTapeInitialComputability.initialRight_eq] at bound
  exact bound

end PureSFormal.Computation.ThreeCounterTagConstructionSize
