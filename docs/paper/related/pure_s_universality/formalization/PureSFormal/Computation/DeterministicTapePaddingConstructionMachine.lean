import PureSFormal.Computation.DeterministicTapeEncoderConstructionMachine
import PureSFormal.Computation.DeterministicTapeStatePaddingComputability

/-!
# Measured allocation of the source states used by literal output readback

Unary maximum shares its selected input reference. Every successor allocated
for a mentioned target, table scan, length scan, subtraction, appended undefined
row, and copied original-table cons is counted. No source transition is run.
-/
namespace PureSFormal.Computation.DeterministicTapePaddingConstructionMachine

open PureSFormal.PureS
open PureSFormal.PureS.ParserPrimitiveMachine (Result)
open PureSFormal.Research.ProtectedTrieDeterministicCompiler
open DeterministicTapeTableConstructionMachine (targetOption targetCells)

set_option maxRecDepth 4096

def maximum (left right : Nat) : Result Nat :=
  let compared := ThreeCounterTagNumericConstructionMachine.less right left
  ⟨if compared.value then left else right, compared.operations + 1⟩

theorem maximum_value (left right : Nat) : (maximum left right).value = max left right := by
  simp only [maximum, ThreeCounterTagNumericConstructionMachine.less_value, decide_eq_true_eq]
  by_cases before : right < left
  · rw [if_pos before, Nat.max_eq_left (Nat.le_of_lt before)]
  · rw [if_neg before, Nat.max_eq_right (Nat.le_of_not_gt before)]

theorem maximum_operations_le (left right : Nat) : (maximum left right).operations ≤ 4 * left + 3 :=
  Nat.add_le_add_right (ThreeCounterTagNumericConstructionMachine.less_operations_le right left) 1

/-- The six-operation allowance covers Option inspection, payload/target reads,
allocation of the unary successor, and returning the selected reference. -/
def target : Option DeterministicTape.Rule → Result Nat
  | none => ⟨0, 1⟩
  | some current => ⟨.succ current.nextState, 6⟩

theorem target_value (current : Option DeterministicTape.Rule) :
    (target current).value = DeterministicTapeStatePadding.ruleTargetBound current := by
  cases current <;> rfl

theorem target_operations_le (current : Option DeterministicTape.Rule) : (target current).operations ≤ 6 := by
  cases current with
  | none => exact (by decide : 1 ≤ 6)
  | some current => exact Nat.le_refl _

theorem target_size_le (current : Option DeterministicTape.Rule) : (target current).value ≤ targetOption current + 1 := by
  cases current with
  | none => exact (by decide : 0 ≤ 1)
  | some current => exact Nat.le_refl _

def rowTarget (row : DeterministicTape.StateRow) : Result Nat :=
  let left := target row.onFalse
  let right := target row.onTrue
  let output := maximum left.value right.value
  ⟨output.value, left.operations + right.operations + output.operations + 4⟩

theorem rowTarget_value (row : DeterministicTape.StateRow) :
    (rowTarget row).value = DeterministicTapeStatePadding.rowTargetBound row := by
  simp only [rowTarget, maximum_value, target_value, DeterministicTapeStatePadding.rowTargetBound]

def rowCells (row : DeterministicTape.StateRow) : Nat := targetOption row.onFalse + targetOption row.onTrue

theorem rowTarget_size_le (row : DeterministicTape.StateRow) : (rowTarget row).value ≤ rowCells row + 1 := by
  simp only [rowTarget, maximum_value]
  apply Nat.max_le.mpr
  constructor
  · exact Nat.le_trans (target_size_le row.onFalse) (Nat.add_le_add_right (Nat.le_add_right _ _) 1)
  · exact Nat.le_trans (target_size_le row.onTrue) (Nat.add_le_add_right (Nat.le_add_left _ _) 1)

theorem rowTarget_operations_le (row : DeterministicTape.StateRow) :
    (rowTarget row).operations ≤ 4 * rowCells row + 24 := by
  have selected : (maximum (target row.onFalse).value (target row.onTrue).value).operations ≤
      4 * (rowCells row + 1) + 3 := Nat.le_trans (maximum_operations_le (target row.onFalse).value (target row.onTrue).value)
    (Nat.add_le_add_right (Nat.mul_le_mul_left 4 (Nat.le_trans (target_size_le row.onFalse)
      (Nat.add_le_add_right (Nat.le_add_right _ _) 1))) 3)
  have bound := Nat.add_le_add_right (Nat.add_le_add
    (Nat.add_le_add (target_operations_le row.onFalse) (target_operations_le row.onTrue)) selected) 4
  apply Nat.le_trans bound
  have extended := Nat.add_le_add_left (by decide : 6 + 6 + 4 + 3 + 4 ≤ 24) (4 * rowCells row)
  simpa only [Nat.mul_add, Nat.mul_one, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using extended

def tableTarget : List DeterministicTape.StateRow → Result Nat
  | [] => ⟨0, 2⟩
  | row :: rest =>
      let tail := tableTarget rest
      let current := rowTarget row
      let output := maximum current.value tail.value
      ⟨output.value, tail.operations + current.operations + output.operations + 4⟩

theorem tableTarget_value (rows : List DeterministicTape.StateRow) :
    (tableTarget rows).value = DeterministicTapeStatePadding.tableTargetBound rows := by
  induction rows with
  | nil => rfl
  | cons row rest ih => simp only [tableTarget, maximum_value, rowTarget_value, ih,
      DeterministicTapeStatePadding.tableTargetBound]

theorem tableTarget_operations_le (rows : List DeterministicTape.StateRow) :
    (tableTarget rows).operations ≤ 8 * targetCells rows + 36 * rows.length + 2 := by
  induction rows with
  | nil => exact Nat.le_refl _
  | cons row rest ih =>
      have compared := Nat.le_trans (maximum_operations_le (rowTarget row).value (tableTarget rest).value)
        (Nat.add_le_add_right (Nat.mul_le_mul_left 4 (rowTarget_size_le row)) 3)
      have localBound := Nat.add_le_add_right (Nat.add_le_add (rowTarget_operations_le row) compared) 4
      have step : (rowTarget row).operations + (maximum (rowTarget row).value (tableTarget rest).value).operations + 4 ≤
          8 * rowCells row + 36 := by
        apply Nat.le_trans localBound
        have extended := Nat.add_le_add_left (by decide : 24 + 4 + 3 + 4 ≤ 36) (8 * rowCells row)
        simpa only [show 8 = 4 + 4 by rfl, Nat.add_mul, Nat.mul_add, Nat.mul_one,
          Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using extended
      have bound := Nat.add_le_add ih step
      simpa only [tableTarget, targetCells, rowCells, List.length_cons, Nat.mul_add, Nat.mul_succ,
        Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using bound

/-- Prepare the original row count and the exact padded allocation size.
The input table reference is read once and shared by both scans. -/
def prepare (source : DeterministicTape.Instance) : Result (Nat × Nat) :=
  let rows := source.machine.states
  let count := RogozhinInputConstructionMachine.length rows
  let targets := tableTarget rows
  let referenced := maximum (.succ source.initialState) targets.value
  let allocation := maximum count.value referenced.value
  ⟨(count.value, allocation.value), count.operations + targets.operations + referenced.operations + allocation.operations + 8⟩

theorem prepare_value (source : DeterministicTape.Instance) :
    (prepare source).value = (source.machine.states.length, DeterministicTapeStatePadding.allocationSize source) := by
  simp only [prepare, RogozhinInputConstructionMachine.length_value, tableTarget_value, maximum_value,
    DeterministicTapeStatePadding.allocationSize]

def prepareBudget (source : DeterministicTape.Instance) : Nat :=
  8 * targetCells source.machine.states + 44 * source.machine.states.length + 4 * source.initialState + 22

theorem prepare_operations_le (source : DeterministicTape.Instance) : (prepare source).operations ≤ prepareBudget source := by
  have referenced := maximum_operations_le (.succ source.initialState) (tableTarget source.machine.states).value
  have allocation := maximum_operations_le (RogozhinInputConstructionMachine.length source.machine.states).value
    (maximum (.succ source.initialState) (tableTarget source.machine.states).value).value
  have bound := Nat.add_le_add_right (Nat.add_le_add (Nat.add_le_add
    (Nat.add_le_add_left (tableTarget_operations_le source.machine.states)
      (RogozhinInputConstructionMachine.length source.machine.states).operations) referenced) allocation) 8
  simpa only [prepare, prepareBudget, RogozhinInputConstructionMachine.length_operations,
    RogozhinInputConstructionMachine.length_value, show 44 = 4 + 36 + 4 by rfl,
    show 22 = 2 + 2 + 4 + 3 + 3 + 8 by rfl,
    Nat.add_mul, Nat.mul_succ, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using bound

def pad (source : DeterministicTape.Instance) : Result DeterministicTape.Instance :=
  let prepared := prepare source
  let extra := ParserNatPrimitive.subtract prepared.value.2 prepared.value.1
  let missing := CookWordConstructionMachine.replicateOnto DeterministicTapeStatePadding.undefinedRow extra.value []
  let table := RogozhinProgramConstructionMachine.copy source.machine.states missing.value
  ⟨{ machine := ⟨table.value⟩, initialState := source.initialState, input := source.input },
    prepared.operations + extra.operations + missing.operations + table.operations + 12⟩

theorem pad_value (source : DeterministicTape.Instance) : (pad source).value = DeterministicTapeStatePadding.pad source := by
  simp only [pad, prepare_value, ParserNatPrimitive.subtract_value,
    CookWordConstructionMachine.replicateOnto_value, RogozhinProgramConstructionMachine.copy_value,
    List.append_nil, DeterministicTapeStatePadding.pad]

def paddingBudget (source : DeterministicTape.Instance) : Nat :=
  prepareBudget source + (4 * source.machine.states.length + 2) +
    (4 * (DeterministicTapeStatePadding.allocationSize source - source.machine.states.length) + 1) +
    (4 * source.machine.states.length + 1) + 12

theorem pad_operations_le (source : DeterministicTape.Instance) : (pad source).operations ≤ paddingBudget source := by
  have extra := ParserNatPrimitive.subtract_operations_le (prepare source).value.2 (prepare source).value.1
  have combined := Nat.add_le_add_right (Nat.add_le_add_right (Nat.add_le_add_right
    (Nat.add_le_add (prepare_operations_le source) extra)
      (CookWordConstructionMachine.replicateOnto DeterministicTapeStatePadding.undefinedRow
        (ParserNatPrimitive.subtract (prepare source).value.2 (prepare source).value.1).value []).operations)
    (RogozhinProgramConstructionMachine.copy source.machine.states
      (CookWordConstructionMachine.replicateOnto DeterministicTapeStatePadding.undefinedRow
        (ParserNatPrimitive.subtract (prepare source).value.2 (prepare source).value.1).value []).value).operations) 12
  simpa only [pad, paddingBudget, prepare_value, ParserNatPrimitive.subtract_value,
    CookWordConstructionMachine.replicateOnto_operations, RogozhinProgramConstructionMachine.copy_operations] using combined

theorem tableTarget_size_le (rows : List DeterministicTape.StateRow) :
    (tableTarget rows).value ≤ targetCells rows + 1 := by
  induction rows with
  | nil => exact (by decide : 0 ≤ 1)
  | cons row rows ih =>
      simp only [tableTarget, maximum_value]
      apply Nat.max_le.mpr
      constructor
      · have bound := Nat.le_trans (rowTarget_size_le row)
          (Nat.add_le_add_right (Nat.le_add_right (rowCells row) (targetCells rows)) 1)
        simpa only [rowCells, targetCells, Nat.add_assoc] using bound
      · have bound := Nat.le_trans ih
          (Nat.add_le_add_right (Nat.le_add_left (targetCells rows) (rowCells row)) 1)
        simpa only [rowCells, targetCells, Nat.add_assoc] using bound

theorem allocationSize_le (source : DeterministicTape.Instance) :
    DeterministicTapeStatePadding.allocationSize source ≤
      source.machine.states.length + source.initialState + targetCells source.machine.states + 1 := by
  unfold DeterministicTapeStatePadding.allocationSize
  apply Nat.max_le.mpr
  constructor
  · exact Nat.le_trans (Nat.le_add_right _ _) (Nat.le_trans (Nat.le_add_right _ _) (Nat.le_add_right _ _))
  · apply Nat.max_le.mpr
    constructor
    · exact Nat.add_le_add_right (Nat.le_trans (Nat.le_add_left _ _) (Nat.le_add_right _ _)) 1
    · have bound := Nat.le_trans (tableTarget_size_le source.machine.states)
        (Nat.add_le_add_right (Nat.le_add_left _ (source.machine.states.length + source.initialState)) 1)
      rw [tableTarget_value] at bound
      exact bound

/-- All rows in the padded table are present in the measured output. -/
theorem pad_materialized_rows (source : DeterministicTape.Instance) :
    (pad source).value.machine.states.length = DeterministicTapeStatePadding.allocationSize source := by
  rw [pad_value]
  exact DeterministicTapeStatePadding.pad_states_length source

def polynomialBudget (source : DeterministicTape.Instance) : Nat :=
  12 * targetCells source.machine.states + 56 * source.machine.states.length + 8 * source.initialState + 42

theorem paddingBudget_le_polynomial (source : DeterministicTape.Instance) :
    paddingBudget source ≤ polynomialBudget source := by
  have extra := Nat.le_trans
    (Nat.sub_le (DeterministicTapeStatePadding.allocationSize source) source.machine.states.length)
    (allocationSize_le source)
  have bound := Nat.add_le_add_right (Nat.add_le_add_right
    (Nat.add_le_add_left (Nat.add_le_add_right (Nat.mul_le_mul_left 4 extra) 1)
      (prepareBudget source + (4 * source.machine.states.length + 2)))
    (4 * source.machine.states.length + 1)) 12
  simpa only [paddingBudget, polynomialBudget, prepareBudget,
    show 12 = 8 + 4 by rfl, show 56 = 44 + 4 + 4 + 4 by rfl,
    show 8 = 4 + 4 by rfl, show 42 = 22 + 2 + 4 + 1 + 1 + 12 by rfl,
    Nat.add_mul, Nat.mul_add, Nat.mul_one, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using bound

theorem pad_operations_le_polynomial (source : DeterministicTape.Instance) :
    (pad source).operations ≤ polynomialBudget source :=
  Nat.le_trans (pad_operations_le source) (paddingBudget_le_polynomial source)

inductive LessExecution : Nat → Nat → Bool → Nat → Prop where
  | zeroZero : LessExecution 0 0 false 2
  | zeroSucc (right : Nat) : LessExecution 0 (.succ right) true 2
  | succZero (left : Nat) : LessExecution (.succ left) 0 false 2
  | succ {left right operations : Nat} {value : Bool}
      (rest : LessExecution left right value operations) :
      LessExecution (.succ left) (.succ right) value (4 + operations)

theorem less_execution (left right : Nat) :
    LessExecution left right (ThreeCounterTagNumericConstructionMachine.less left right).value
      (ThreeCounterTagNumericConstructionMachine.less left right).operations := by
  induction left generalizing right with
  | zero => cases right with
    | zero => exact .zeroZero
    | succ right => exact .zeroSucc right
  | succ left ih => cases right with
    | zero => exact .succZero left
    | succ right => exact .succ (ih right)

inductive MaximumExecution (left right : Nat) : Nat → Nat → Prop where
  | select {before : Bool} {operations : Nat}
      (comparison : LessExecution right left before operations) :
      MaximumExecution left right (if before then left else right) (operations + 1)

theorem maximum_execution (left right : Nat) :
    MaximumExecution left right (maximum left right).value (maximum left right).operations :=
  .select (less_execution right left)

inductive TargetExecution : Option DeterministicTape.Rule → Nat → Nat → Prop where
  | none : TargetExecution none 0 1
  | some (current : DeterministicTape.Rule) : TargetExecution (some current) (.succ current.nextState) 6

theorem target_execution (current : Option DeterministicTape.Rule) :
    TargetExecution current (target current).value (target current).operations := by
  cases current with
  | none => exact .none
  | some current => exact .some current

inductive RowTargetExecution (row : DeterministicTape.StateRow) : Nat → Nat → Prop where
  | construct {left right output leftOperations rightOperations outputOperations : Nat}
      (leftRun : TargetExecution row.onFalse left leftOperations)
      (rightRun : TargetExecution row.onTrue right rightOperations)
      (selection : MaximumExecution left right output outputOperations) :
      RowTargetExecution row output (leftOperations + rightOperations + outputOperations + 4)

theorem rowTarget_execution (row : DeterministicTape.StateRow) :
    RowTargetExecution row (rowTarget row).value (rowTarget row).operations :=
  .construct (target_execution _) (target_execution _) (maximum_execution _ _)

inductive TableTargetExecution : List DeterministicTape.StateRow → Nat → Nat → Prop where
  | nil : TableTargetExecution [] 0 2
  | cons {row : DeterministicTape.StateRow} {rows : List DeterministicTape.StateRow}
      {tail current output tailOperations rowOperations outputOperations : Nat}
      (following : TableTargetExecution rows tail tailOperations)
      (rowRun : RowTargetExecution row current rowOperations)
      (selection : MaximumExecution current tail output outputOperations) :
      TableTargetExecution (row :: rows) output (tailOperations + rowOperations + outputOperations + 4)

theorem tableTarget_execution (rows : List DeterministicTape.StateRow) :
    TableTargetExecution rows (tableTarget rows).value (tableTarget rows).operations := by
  induction rows with
  | nil => exact .nil
  | cons row rows ih => exact .cons ih (rowTarget_execution row) (maximum_execution _ _)

inductive PreparationExecution (source : DeterministicTape.Instance) : (Nat × Nat) → Nat → Prop where
  | construct {count targets referenced allocation countOperations targetOperations referenceOperations allocationOperations : Nat}
      (countRun : RogozhinInputConstructionMachine.LengthExecution source.machine.states count countOperations)
      (targetRun : TableTargetExecution source.machine.states targets targetOperations)
      (referenceRun : MaximumExecution (.succ source.initialState) targets referenced referenceOperations)
      (allocationRun : MaximumExecution count referenced allocation allocationOperations) :
      PreparationExecution source (count, allocation)
        (countOperations + targetOperations + referenceOperations + allocationOperations + 8)

theorem prepare_execution (source : DeterministicTape.Instance) :
    PreparationExecution source (prepare source).value (prepare source).operations :=
  .construct (RogozhinInputConstructionMachine.length_execution _) (tableTarget_execution _)
    (maximum_execution _ _) (maximum_execution _ _)

inductive SubtractExecution : Nat → Nat → Nat → Nat → Prop where
  | rightZero (left : Nat) : SubtractExecution left 0 left 2
  | leftZero (right : Nat) : SubtractExecution 0 (.succ right) 0 2
  | succ {left right output operations : Nat}
      (rest : SubtractExecution left right output operations) :
      SubtractExecution (.succ left) (.succ right) output (operations + 4)

theorem subtract_execution (left right : Nat) :
    SubtractExecution left right (ParserNatPrimitive.subtract left right).value
      (ParserNatPrimitive.subtract left right).operations := by
  induction right generalizing left with
  | zero => cases left <;> exact .rightZero _
  | succ right ih => cases left with
    | zero => exact .leftZero right
    | succ left => exact .succ (ih left)

inductive PaddingExecution (source : DeterministicTape.Instance) : DeterministicTape.Instance → Nat → Prop where
  | construct {count allocation extra prepareOperations extraOperations missingOperations tableOperations : Nat}
      {missing table : List DeterministicTape.StateRow}
      (preparation : PreparationExecution source (count, allocation) prepareOperations)
      (subtraction : SubtractExecution allocation count extra extraOperations)
      (allocationRun : CookWordConstructionMachine.ReplicateExecution DeterministicTapeStatePadding.undefinedRow extra [] missing missingOperations)
      (copyRun : RogozhinProgramConstructionMachine.CopyExecution source.machine.states missing table tableOperations) :
      PaddingExecution source { machine := ⟨table⟩, initialState := source.initialState, input := source.input }
        (prepareOperations + extraOperations + missingOperations + tableOperations + 12)

theorem pad_execution (source : DeterministicTape.Instance) :
    PaddingExecution source (pad source).value (pad source).operations :=
  .construct (prepare_execution source) (subtract_execution _ _)
    (CookWordConstructionMachine.replicateOnto_execution _ _ _)
    (RogozhinProgramConstructionMachine.copy_execution _ _)

end PureSFormal.Computation.DeterministicTapePaddingConstructionMachine
