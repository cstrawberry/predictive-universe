import PureSFormal.Computation.RogozhinProgramConstructionMachine
import PureSFormal.Computation.ThreeCounterTagConstructionSize
import PureSFormal.Computation.DeletionTwoNormalizationMachine

/-!
# Primitive construction of normalized deletion-two tables and words

The delay label is counted from the actual input table. Equality reads at most
that many unary constructors, including when an input label lies beyond the
table. Unchanged labels and list tails are immutable shared references. Every
new table, word and unary successor cell is charged to the construction.
-/

namespace PureSFormal.Computation.DeletionTwoTableConstructionMachine

open PureSFormal.PureS.ParserPrimitiveMachine (Result)
open PureSFormal.PureS
open RogozhinInputConstructionMachine (length)
open RogozhinTagInput (Program Job)

def rename (delay shifted label : Nat) : Result Nat :=
  let comparison := ParserTerminalPrimitive.equalIndex delay label
  ⟨if comparison.value then shifted else label, comparison.operations + 1⟩

theorem rename_value (delay shifted label : Nat) :
    (rename delay shifted label).value = if label = delay then shifted else label := by
  unfold rename
  change (if (ParserTerminalPrimitive.equalIndex delay label).value then shifted else label) = _
  by_cases equal : label = delay
  · have accepted := (ParserTerminalPrimitive.equalIndex_value delay label).mpr equal.symm
    rw [accepted, if_pos equal]
    rfl
  · have rejected : (ParserTerminalPrimitive.equalIndex delay label).value = false := by
      cases found : (ParserTerminalPrimitive.equalIndex delay label).value with
      | false => rfl
      | true => exact False.elim (equal ((ParserTerminalPrimitive.equalIndex_value delay label).mp found).symm)
    rw [rejected, if_neg equal]
    rfl

theorem rename_operations_le (delay shifted label : Nat) :
    (rename delay shifted label).operations ≤ 4 * delay + 3 := by
  exact Nat.add_le_add_right (ParserTerminalPrimitive.equalIndex_operations_le delay label) 1

def wordOnto (delay shifted : Nat) : List Nat → List Nat → Result (List Nat)
  | [], tail => ⟨tail, 1⟩
  | label :: rest, tail =>
      let renamed := rename delay shifted label
      let following := wordOnto delay shifted rest tail
      ⟨renamed.value :: following.value, 4 + renamed.operations + following.operations⟩

theorem wordOnto_value (delay shifted : Nat) (word tail : List Nat) :
    (wordOnto delay shifted word tail).value =
      word.map (fun label => if label = delay then shifted else label) ++ tail := by
  induction word with
  | nil => rfl
  | cons label rest ih =>
      simp only [wordOnto, rename_value, ih, List.map_cons, List.cons_append]

theorem wordOnto_operations_le (delay shifted : Nat) (word tail : List Nat) :
    (wordOnto delay shifted word tail).operations ≤ (4 * delay + 7) * word.length + 1 := by
  induction word with
  | nil => exact Nat.le_refl _
  | cons label rest ih =>
      have bound := Nat.add_le_add (Nat.add_le_add_left (rename_operations_le delay shifted label) 4) ih
      apply Nat.le_trans bound
      apply Nat.le_of_eq
      rw [List.length_cons, Nat.mul_succ]
      change 4 + (4 * delay + 3) + ((4 * delay + 7) * rest.length + 1) =
        (4 * delay + 7) * rest.length + (4 * delay + (4 + 3)) + 1
      simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

/-- An empty row emits four delay labels; nonempty rows acquire two. -/
def rhs (delay shifted : Nat) : List Nat → Result (List Nat)
  | [] => ⟨[delay, delay, delay, delay], 6⟩
  | input@(_ :: _) =>
      let renamed := wordOnto delay shifted input []
      ⟨delay :: delay :: renamed.value, 4 + renamed.operations⟩

theorem rhs_value (program : Program) (row : List Nat) :
    (rhs program.productions.length (program.productions.length + 1) row).value =
      DeletionTwoT2Normalizer.normalizedRhs program row := by
  cases row with
  | nil => rfl
  | cons head tail =>
      simp only [rhs, wordOnto_value, List.append_nil,
        DeletionTwoT2Normalizer.normalizedRhs, List.cons_ne_nil, ↓reduceIte,
        DeletionTwoT2Normalizer.encodeWord, DeletionTwoT2Normalizer.encodeLabel,
        DeletionTwoT2Normalizer.delayLabel, DeletionTwoT2Normalizer.targetHaltLabel,
        RogozhinTagInput.haltLabel, RogozhinTagInput.symbolCount]
      rfl

theorem rhs_operations_le (delay shifted : Nat) (row : List Nat) :
    (rhs delay shifted row).operations ≤ (4 * delay + 7) * row.length + 6 := by
  cases row with
  | nil => exact Nat.le_refl _
  | cons head tail =>
      have bound := Nat.add_le_add_left (wordOnto_operations_le delay shifted (head :: tail) []) 4
      apply Nat.le_trans bound
      calc
        4 + ((4 * delay + 7) * (head :: tail).length + 1) =
          (4 * delay + 7) * (head :: tail).length + (4 + 1) := by
          simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
        _ ≤ _ := Nat.add_le_add_left (by decide : 4 + 1 ≤ 6) _

def tableOnto (delay shifted : Nat) : List (List Nat) → List (List Nat) → Result (List (List Nat))
  | [], tail => ⟨tail, 1⟩
  | row :: rest, tail =>
      let outputRow := rhs delay shifted row
      let following := tableOnto delay shifted rest tail
      ⟨outputRow.value :: following.value, 4 + outputRow.operations + following.operations⟩

theorem tableOnto_value (program : Program) (rows tail : List (List Nat)) :
    (tableOnto program.productions.length (program.productions.length + 1) rows tail).value =
      rows.map (DeletionTwoT2Normalizer.normalizedRhs program) ++ tail := by
  induction rows with
  | nil => rfl
  | cons row rest ih =>
      simp only [tableOnto, rhs_value, ih, List.map_cons, List.cons_append]

theorem tableOnto_operations_le (delay shifted : Nat) (rows tail : List (List Nat)) :
    (tableOnto delay shifted rows tail).operations ≤
      (4 * delay + 7) * ThreeCounterTagConstructionSize.tableCells rows + 10 * rows.length + 1 := by
  induction rows with
  | nil => exact Nat.le_refl _
  | cons row rest ih =>
      have bound := Nat.add_le_add (Nat.add_le_add_left (rhs_operations_le delay shifted row) 4) ih
      apply Nat.le_trans bound
      apply Nat.le_of_eq
      rw [ThreeCounterTagConstructionSize.tableCells, List.length_cons, Nat.mul_add, Nat.mul_succ]
      change 4 + ((4 * delay + 7) * row.length + 6) +
          ((4 * delay + 7) * ThreeCounterTagConstructionSize.tableCells rest + 10 * rest.length + 1) =
        (4 * delay + 7) * row.length + (4 * delay + 7) * ThreeCounterTagConstructionSize.tableCells rest +
          (10 * rest.length + (4 + 6)) + 1
      simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

/-- One input field, one unary successor, five delay-table cells, and the output record. -/
def normalizeProgram (program : Program) : Result Program :=
  let count := length program.productions
  let table := tableOnto count.value (count.value + 1) program.productions [[count.value, count.value]]
  ⟨⟨table.value⟩, 8 + count.operations + table.operations⟩

theorem normalizeProgram_value (program : Program) :
    (normalizeProgram program).value = DeletionTwoT2Normalizer.normalizeProgram program := by
  simp only [normalizeProgram, RogozhinInputConstructionMachine.length_value, tableOnto_value]
  rfl

theorem normalizeProgram_operations_le (program : Program) :
    (normalizeProgram program).operations ≤
      (4 * program.productions.length + 7) * ThreeCounterTagConstructionSize.tableCells program.productions +
        14 * program.productions.length + 11 := by
  have tableBound := tableOnto_operations_le (length program.productions).value
    ((length program.productions).value + 1) program.productions
    [[(length program.productions).value, (length program.productions).value]]
  simp only [RogozhinInputConstructionMachine.length_value] at tableBound
  simp only [normalizeProgram, RogozhinInputConstructionMachine.length_operations,
    RogozhinInputConstructionMachine.length_value]
  apply Nat.le_trans (Nat.add_le_add_left tableBound (8 + (4 * program.productions.length + 2)))
  apply Nat.le_of_eq
  change 8 + (4 * program.productions.length + 2) +
      ((4 * program.productions.length + 7) * ThreeCounterTagConstructionSize.tableCells program.productions +
        10 * program.productions.length + 1) =
    (4 * program.productions.length + 7) * ThreeCounterTagConstructionSize.tableCells program.productions +
      (4 + 10) * program.productions.length + (8 + 2 + 1)
  simp only [Nat.add_mul]
  simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

/-- One input field, one unary successor, and the three-cell delay pair. -/
def normalizeWord (program : Program) (word : List Nat) : Result (List Nat) :=
  let count := length program.productions
  let output := wordOnto count.value (count.value + 1) word [count.value, count.value]
  ⟨output.value, 5 + count.operations + output.operations⟩

theorem normalizeWord_value (program : Program) (word : List Nat) :
    (normalizeWord program word).value = DeletionTwoT2Normalizer.normalizeWord program word := by
  simp only [normalizeWord, RogozhinInputConstructionMachine.length_value, wordOnto_value]
  rfl

theorem normalizeWord_operations_le (program : Program) (word : List Nat) :
    (normalizeWord program word).operations ≤
      (4 * program.productions.length + 7) * word.length + 4 * program.productions.length + 8 := by
  have wordBound := wordOnto_operations_le (length program.productions).value
    ((length program.productions).value + 1) word [(length program.productions).value, (length program.productions).value]
  simp only [RogozhinInputConstructionMachine.length_value] at wordBound
  simp only [normalizeWord, RogozhinInputConstructionMachine.length_operations,
    RogozhinInputConstructionMachine.length_value]
  apply Nat.le_trans (Nat.add_le_add_left wordBound (5 + (4 * program.productions.length + 2)))
  apply Nat.le_of_eq
  change 5 + (4 * program.productions.length + 2) +
      ((4 * program.productions.length + 7) * word.length + 1) =
    (4 * program.productions.length + 7) * word.length + 4 * program.productions.length + (5 + 2 + 1)
  simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

def normalizeJob (program : Program) (word : List Nat) : Result Job :=
  let table := normalizeProgram program
  let data := normalizeWord program word
  ⟨⟨table.value, data.value⟩, 1 + table.operations + data.operations⟩

theorem normalizeJob_value (program : Program) (word : List Nat) :
    (normalizeJob program word).value =
      ⟨DeletionTwoT2Normalizer.normalizeProgram program, DeletionTwoT2Normalizer.normalizeWord program word⟩ := by
  simp only [normalizeJob, normalizeProgram_value, normalizeWord_value]

theorem normalizeJob_operations_le (program : Program) (word : List Nat) :
    (normalizeJob program word).operations ≤
      (4 * program.productions.length + 7) *
        (ThreeCounterTagConstructionSize.tableCells program.productions + word.length) +
      18 * program.productions.length + 20 := by
  have combined := Nat.add_le_add (Nat.add_le_add_left (normalizeProgram_operations_le program) 1)
    (normalizeWord_operations_le program word)
  apply Nat.le_trans combined
  apply Nat.le_of_eq
  rw [Nat.mul_add]
  change 1 +
    ((4 * program.productions.length + 7) * ThreeCounterTagConstructionSize.tableCells program.productions +
      14 * program.productions.length + 11) +
    ((4 * program.productions.length + 7) * word.length + 4 * program.productions.length + 8) =
    (4 * program.productions.length + 7) * ThreeCounterTagConstructionSize.tableCells program.productions +
      (4 * program.productions.length + 7) * word.length +
      (14 + 4) * program.productions.length + (1 + 11 + 8)
  simp only [Nat.add_mul]
  simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]


theorem normalizeProgram_rows (program : Program) :
    (normalizeProgram program).value.productions.length = program.productions.length + 1 := by
  rw [normalizeProgram_value]
  exact DeletionTwoT2Normalizer.normalize_symbolCount program

theorem normalizeWord_length (program : Program) (word : List Nat) :
    (normalizeWord program word).value.length = word.length + 2 := by
  rw [normalizeWord_value]
  simp only [DeletionTwoT2Normalizer.normalizeWord, DeletionTwoT2Normalizer.encodeWord,
    List.length_append, List.length_map, List.length_cons, List.length_nil]

theorem rhs_length_le (program : Program) (row : List Nat) :
    (DeletionTwoT2Normalizer.normalizedRhs program row).length ≤ row.length + 4 := by
  cases row with
  | nil => exact Nat.le_refl _
  | cons head tail =>
      simp only [DeletionTwoT2Normalizer.normalizedRhs, List.cons_ne_nil, ↓reduceIte,
        DeletionTwoT2Normalizer.encodeWord, List.length_cons, List.length_map]
      change (tail.length + 1) + (1 + 1) ≤ (tail.length + 1) + 4
      exact Nat.add_le_add_left (by decide : 1 + 1 ≤ 4) _

theorem normalizedRows_cells_le (program : Program) (rows : List (List Nat)) :
    ThreeCounterTagConstructionSize.tableCells
      (rows.map (DeletionTwoT2Normalizer.normalizedRhs program)) ≤
    ThreeCounterTagConstructionSize.tableCells rows + 4 * rows.length := by
  induction rows with
  | nil => exact Nat.le_refl _
  | cons row rest ih =>
      have combined := Nat.add_le_add (rhs_length_le program row) ih
      apply Nat.le_trans combined
      apply Nat.le_of_eq
      simp only [ThreeCounterTagConstructionSize.tableCells, List.length_cons, Nat.mul_succ,
        Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

theorem tableCells_append (first second : List (List Nat)) :
    ThreeCounterTagConstructionSize.tableCells (first ++ second) =
      ThreeCounterTagConstructionSize.tableCells first + ThreeCounterTagConstructionSize.tableCells second := by
  induction first with
  | nil => exact (Nat.zero_add _).symm
  | cons row rest ih =>
      simp only [List.cons_append, ThreeCounterTagConstructionSize.tableCells, ih, Nat.add_assoc]

theorem normalizeProgram_cells_le (program : Program) :
    ThreeCounterTagConstructionSize.tableCells (normalizeProgram program).value.productions ≤
      ThreeCounterTagConstructionSize.tableCells program.productions + 4 * program.productions.length + 2 := by
  rw [normalizeProgram_value]
  change ThreeCounterTagConstructionSize.tableCells
    (program.productions.map (DeletionTwoT2Normalizer.normalizedRhs program) ++
      [[DeletionTwoT2Normalizer.delayLabel program, DeletionTwoT2Normalizer.delayLabel program]]) ≤ _
  rw [tableCells_append]
  exact Nat.add_le_add_right (normalizedRows_cells_le program program.productions) 2

/-- The inputs here are already materialized ordinary tables and words. -/
theorem normalizeJob_threeCounter_value (program : ThreeCounter.Program) (initial : ThreeCounter.State) :
    (normalizeJob (ThreeCounterTag.Numeric.ordinaryProgram program)
      (ThreeCounterTag.Numeric.ordinaryInitialWord program initial)).value =
    ThreeCounterTag.Numeric.compileT2 program initial := by
  rw [normalizeJob_value]
  rfl

theorem normalizeJob_threeCounter_operations_le (program : ThreeCounter.Program) (initial : ThreeCounter.State) :
    (normalizeJob (ThreeCounterTag.Numeric.ordinaryProgram program)
      (ThreeCounterTag.Numeric.ordinaryInitialWord program initial)).operations ≤
    (4 * (30 * program.length + 2) + 7) *
      (8 * (30 * program.length + 2) + (2 + ThreeCounterTagConstructionSize.initialMass program initial)) +
      18 * (30 * program.length + 2) + 20 := by
  have bound := normalizeJob_operations_le (ThreeCounterTag.Numeric.ordinaryProgram program)
    (ThreeCounterTag.Numeric.ordinaryInitialWord program initial)
  have cells := ThreeCounterTagConstructionSize.tableCells_le
    (ThreeCounterTag.Numeric.ordinaryProgram program).productions 8
    (ThreeCounterTagConstructionSize.ordinary_row_length program)
  have rows : (ThreeCounterTag.Numeric.ordinaryProgram program).productions.length =
      30 * program.length + 2 := ThreeCounterTagConstructionSize.ordinary_symbolCount program
  have word : (ThreeCounterTag.Numeric.ordinaryInitialWord program initial).length =
      2 + ThreeCounterTagConstructionSize.initialMass program initial := by
    simp only [ThreeCounterTag.Numeric.ordinaryInitialWord, ThreeCounterTag.Numeric.encodeWord,
      List.length_map, ThreeCounterTagConstructionSize.encodeState_length]
  rw [rows, word] at bound
  rw [rows] at cells
  exact Nat.le_trans bound (Nat.add_le_add_right (Nat.add_le_add_right
    (Nat.mul_le_mul_left _ (Nat.add_le_add_right cells _)) _) _)

def budget (program : Program) (word : List Nat) : Nat :=
  (4 * program.productions.length + 7) *
    (ThreeCounterTagConstructionSize.tableCells program.productions + word.length) +
    18 * program.productions.length + 20

def cookBits (program : Program) (word : List Nat) : Result (List Bool) :=
  let normalized := normalizeJob program word
  let bits := RogozhinProgramConstructionMachine.cookBits normalized.value
  ⟨bits.value, normalized.operations + bits.operations⟩

theorem cookBits_value (program : Program) (word : List Nat) :
    (cookBits program word).value =
      RogozhinT2Cook.encodeBits
        ⟨DeletionTwoT2Normalizer.normalizeProgram program, DeletionTwoT2Normalizer.normalizeWord program word⟩ := by
  rw [cookBits, RogozhinProgramConstructionMachine.cookBits_value, normalizeJob_value]
  rfl

theorem cookBits_operations_le (program : Program) (word : List Nat) :
    (cookBits program word).operations ≤ budget program word +
      RogozhinProgramConstructionMachine.compileBudget (normalizeJob program word).value +
      5 * (cookBits program word).value.length +
      8 * ((RogozhinTagInput.compile (normalizeJob program word).value).left.length +
        (RogozhinTagInput.compile (normalizeJob program word).value).right.length) + 17 := by
  have combined := Nat.add_le_add (normalizeJob_operations_le program word)
    (RogozhinProgramConstructionMachine.cookBits_operations_le (normalizeJob program word).value)
  apply Nat.le_trans combined
  apply Nat.le_of_eq
  change _ = budget program word +
    RogozhinProgramConstructionMachine.compileBudget (normalizeJob program word).value +
    5 * (RogozhinProgramConstructionMachine.cookBits (normalizeJob program word).value).value.length +
    8 * ((RogozhinTagInput.compile (normalizeJob program word).value).left.length +
      (RogozhinTagInput.compile (normalizeJob program word).value).right.length) + 17
  simp only [budget, Nat.add_assoc]

inductive WordExecution (delay shifted : Nat) : List Nat → List Nat → List Nat → Nat → Prop where
  | nil (tail : List Nat) : WordExecution delay shifted [] tail tail 1
  | cons {label : Nat} {word tail output : List Nat} {operations : Nat}
      (rest : WordExecution delay shifted word tail output operations) :
      WordExecution delay shifted (label :: word) tail ((rename delay shifted label).value :: output)
        (4 + (rename delay shifted label).operations + operations)

theorem wordOnto_execution (delay shifted : Nat) (word tail : List Nat) :
    WordExecution delay shifted word tail (wordOnto delay shifted word tail).value
      (wordOnto delay shifted word tail).operations := by
  induction word with
  | nil => exact .nil _
  | cons label rest ih => exact .cons ih

inductive RhsExecution (delay shifted : Nat) : List Nat → List Nat → Nat → Prop where
  | nil : RhsExecution delay shifted [] [delay, delay, delay, delay] 6
  | cons {head : Nat} {tail output : List Nat} {operations : Nat}
      (renamed : WordExecution delay shifted (head :: tail) [] output operations) :
      RhsExecution delay shifted (head :: tail) (delay :: delay :: output) (4 + operations)

theorem rhs_execution (delay shifted : Nat) (row : List Nat) :
    RhsExecution delay shifted row (rhs delay shifted row).value (rhs delay shifted row).operations := by
  cases row with
  | nil => exact .nil
  | cons head tail => exact .cons (wordOnto_execution _ _ _ _)

inductive TableExecution (delay shifted : Nat) :
    List (List Nat) → List (List Nat) → List (List Nat) → Nat → Prop where
  | nil (tail : List (List Nat)) : TableExecution delay shifted [] tail tail 1
  | cons {row outputRow : List Nat} {rows tail output : List (List Nat)}
      {rowOperations operations : Nat}
      (rowRun : RhsExecution delay shifted row outputRow rowOperations)
      (rest : TableExecution delay shifted rows tail output operations) :
      TableExecution delay shifted (row :: rows) tail (outputRow :: output)
        (4 + rowOperations + operations)

theorem tableOnto_execution (delay shifted : Nat) (rows tail : List (List Nat)) :
    TableExecution delay shifted rows tail (tableOnto delay shifted rows tail).value
      (tableOnto delay shifted rows tail).operations := by
  induction rows with
  | nil => exact .nil _
  | cons row rest ih => exact .cons (rhs_execution _ _ _) ih

inductive ProgramExecution (program : Program) : Program → Nat → Prop where
  | construct {count countOperations tableOperations : Nat} {table : List (List Nat)}
      (countRun : RogozhinInputConstructionMachine.LengthExecution program.productions count countOperations)
      (tableRun : TableExecution count (count + 1) program.productions [[count, count]] table tableOperations) :
      ProgramExecution program ⟨table⟩ (8 + countOperations + tableOperations)

theorem normalizeProgram_execution (program : Program) :
    ProgramExecution program (normalizeProgram program).value (normalizeProgram program).operations :=
  .construct (RogozhinInputConstructionMachine.length_execution _) (tableOnto_execution _ _ _ _)

inductive InitialWordExecution (program : Program) (word : List Nat) : List Nat → Nat → Prop where
  | construct {count countOperations wordOperations : Nat} {output : List Nat}
      (countRun : RogozhinInputConstructionMachine.LengthExecution program.productions count countOperations)
      (wordRun : WordExecution count (count + 1) word [count, count] output wordOperations) :
      InitialWordExecution program word output (5 + countOperations + wordOperations)

theorem normalizeWord_execution (program : Program) (word : List Nat) :
    InitialWordExecution program word (normalizeWord program word).value (normalizeWord program word).operations :=
  .construct (RogozhinInputConstructionMachine.length_execution _) (wordOnto_execution _ _ _ _)

inductive JobExecution (program : Program) (word : List Nat) : Job → Nat → Prop where
  | construct {table : Program} {output : List Nat} {tableOperations wordOperations : Nat}
      (tableRun : ProgramExecution program table tableOperations)
      (wordRun : InitialWordExecution program word output wordOperations) :
      JobExecution program word ⟨table, output⟩ (1 + tableOperations + wordOperations)

theorem normalizeJob_execution (program : Program) (word : List Nat) :
    JobExecution program word (normalizeJob program word).value (normalizeJob program word).operations :=
  .construct (normalizeProgram_execution _) (normalizeWord_execution _ _)

inductive CookExecution (program : Program) (word : List Nat) : List Bool → Nat → Prop where
  | construct {job : Job} {output : List Bool} {normalizationOperations bitOperations : Nat}
      (normalizationRun : JobExecution program word job normalizationOperations)
      (bitRun : RogozhinProgramConstructionMachine.CookExecution job output bitOperations) :
      CookExecution program word output (normalizationOperations + bitOperations)

theorem cookBits_execution (program : Program) (word : List Nat) :
    CookExecution program word (cookBits program word).value (cookBits program word).operations :=
  .construct (normalizeJob_execution _ _) (RogozhinProgramConstructionMachine.cookBits_execution _)

end PureSFormal.Computation.DeletionTwoTableConstructionMachine
