import PureSFormal.Computation.DeterministicTapeInitialConstructionMachine
import PureSFormal.Computation.DeterministicTapeDecodeConstructionMachine
import PureSFormal.PureS.ParserNatDivisionPrimitive

/-!
# Primitive construction of the literal 127-phase tape compiler

Naturals are unary immutable chains. Constants and the finite phase codebook
belong to the fixed compiler program. Source rows and target labels are read as
literal syntax. All unbounded arithmetic, source lookups and table construction
use measured recursive primitives; no source execution is used.
-/

namespace PureSFormal.Computation.DeterministicTapeTableConstructionMachine

set_option maxRecDepth 4096

open PureSFormal.PureS.ParserPrimitiveMachine (Result)
open PureSFormal.PureS
open PureSFormal.Research.ProtectedTrieDeterministicCompiler
open DeterministicTapeThreeCounterCompiler Layout
open ThreeCounter (Instruction Register)

def phaseTable : List Phase := [
  .right .start,
  .right .checkSentinel,
  .right .incrementScratch,
  .right .pairFirst,
  .right .pairSecond,
  .right (.restoreFirst false),
  .right (.restoreFirst true),
  .right (.restoreFirstIncrement false),
  .right (.restoreFirstIncrement true),
  .right (.restoreCheck false),
  .right (.restoreCheck true),
  .right (.restoreRestIncrement false),
  .right (.restoreRestIncrement true),
  .right (.restoreLoop false),
  .right (.restoreLoop true),
  .right (.restoreLoopIncrement false),
  .right (.restoreLoopIncrement true),
  .dispatch false false,
  .dispatch false true,
  .dispatch true false,
  .dispatch true true,
  .left false .start,
  .left false .checkSentinel,
  .left false .incrementScratch,
  .left false .pairFirst,
  .left false .pairSecond,
  .left false (.restore false),
  .left false (.restore true),
  .left false (.restoreIncrement false),
  .left false (.restoreIncrement true),
  .left false .restoreEmpty,
  .left true .start,
  .left true .checkSentinel,
  .left true .incrementScratch,
  .left true .pairFirst,
  .left true .pairSecond,
  .left true (.restore false),
  .left true (.restore true),
  .left true (.restoreIncrement false),
  .left true (.restoreIncrement true),
  .left true .restoreEmpty,
  .push (.stay false) .drain,
  .push (.stay false) .drainIncrement,
  .push (.stay false) .restore,
  .push (.stay false) .restoreIncrementFirst,
  .push (.stay false) .restoreIncrementSecond,
  .push (.stay false) .addBit,
  .push (.stay true) .drain,
  .push (.stay true) .drainIncrement,
  .push (.stay true) .restore,
  .push (.stay true) .restoreIncrementFirst,
  .push (.stay true) .restoreIncrementSecond,
  .push (.stay true) .addBit,
  .push (.right false false) .drain,
  .push (.right false false) .drainIncrement,
  .push (.right false false) .restore,
  .push (.right false false) .restoreIncrementFirst,
  .push (.right false false) .restoreIncrementSecond,
  .push (.right false false) .addBit,
  .push (.right false true) .drain,
  .push (.right false true) .drainIncrement,
  .push (.right false true) .restore,
  .push (.right false true) .restoreIncrementFirst,
  .push (.right false true) .restoreIncrementSecond,
  .push (.right false true) .addBit,
  .push (.right true false) .drain,
  .push (.right true false) .drainIncrement,
  .push (.right true false) .restore,
  .push (.right true false) .restoreIncrementFirst,
  .push (.right true false) .restoreIncrementSecond,
  .push (.right true false) .addBit,
  .push (.right true true) .drain,
  .push (.right true true) .drainIncrement,
  .push (.right true true) .restore,
  .push (.right true true) .restoreIncrementFirst,
  .push (.right true true) .restoreIncrementSecond,
  .push (.right true true) .addBit,
  .push (.leftWrite false false) .drain,
  .push (.leftWrite false false) .drainIncrement,
  .push (.leftWrite false false) .restore,
  .push (.leftWrite false false) .restoreIncrementFirst,
  .push (.leftWrite false false) .restoreIncrementSecond,
  .push (.leftWrite false false) .addBit,
  .push (.leftWrite false true) .drain,
  .push (.leftWrite false true) .drainIncrement,
  .push (.leftWrite false true) .restore,
  .push (.leftWrite false true) .restoreIncrementFirst,
  .push (.leftWrite false true) .restoreIncrementSecond,
  .push (.leftWrite false true) .addBit,
  .push (.leftWrite true false) .drain,
  .push (.leftWrite true false) .drainIncrement,
  .push (.leftWrite true false) .restore,
  .push (.leftWrite true false) .restoreIncrementFirst,
  .push (.leftWrite true false) .restoreIncrementSecond,
  .push (.leftWrite true false) .addBit,
  .push (.leftWrite true true) .drain,
  .push (.leftWrite true true) .drainIncrement,
  .push (.leftWrite true true) .restore,
  .push (.leftWrite true true) .restoreIncrementFirst,
  .push (.leftWrite true true) .restoreIncrementSecond,
  .push (.leftWrite true true) .addBit,
  .push (.leftNeighbor false false) .drain,
  .push (.leftNeighbor false false) .drainIncrement,
  .push (.leftNeighbor false false) .restore,
  .push (.leftNeighbor false false) .restoreIncrementFirst,
  .push (.leftNeighbor false false) .restoreIncrementSecond,
  .push (.leftNeighbor false false) .addBit,
  .push (.leftNeighbor false true) .drain,
  .push (.leftNeighbor false true) .drainIncrement,
  .push (.leftNeighbor false true) .restore,
  .push (.leftNeighbor false true) .restoreIncrementFirst,
  .push (.leftNeighbor false true) .restoreIncrementSecond,
  .push (.leftNeighbor false true) .addBit,
  .push (.leftNeighbor true false) .drain,
  .push (.leftNeighbor true false) .drainIncrement,
  .push (.leftNeighbor true false) .restore,
  .push (.leftNeighbor true false) .restoreIncrementFirst,
  .push (.leftNeighbor true false) .restoreIncrementSecond,
  .push (.leftNeighbor true false) .addBit,
  .push (.leftNeighbor true true) .drain,
  .push (.leftNeighbor true true) .drainIncrement,
  .push (.leftNeighbor true true) .restore,
  .push (.leftNeighbor true true) .restoreIncrementFirst,
  .push (.leftNeighbor true true) .restoreIncrementSecond,
  .push (.leftNeighbor true true) .addBit,
  .rightBlank false,
  .rightBlank true]

theorem phaseTable_value :
    phaseTable = Compiler.tabulate 127 Layout.decodePhase := by rfl

theorem phaseTable_length : phaseTable.length = 127 := by rfl

open CookWordConstructionMachine (Primitive)

/-- Constructor observations and child reads for the actual nested phase
representation. The deepest push context has nine observations/reads. -/
def phaseSelectionTrace : Phase → List CookWordConstructionMachine.Primitive
  | .right phase => [.observe, .readChild, .observe] ++
      (match phase with
       | .start | .checkSentinel | .incrementScratch | .pairFirst | .pairSecond => []
       | _ => [.readChild, .observe])
  | .dispatch _ _ => [.observe, .readChild, .readChild, .observe, .observe]
  | .left _ phase => [.observe, .readChild, .readChild, .observe, .observe] ++
      (match phase with
       | .restore _ | .restoreIncrement _ => [.readChild, .observe]
       | _ => [])
  | .push context _ => [.observe, .readChild, .readChild, .observe, .observe] ++
      (match context with
       | .stay _ => [.readChild, .observe]
       | _ => [.readChild, .readChild, .observe, .observe])
  | .rightBlank _ => [.observe, .readChild, .observe]

theorem phaseSelectionTrace_length_le (phase : Phase) : (phaseSelectionTrace phase).length ≤ 9 := by
  cases phase with
  | right phase => cases phase <;> simp only [phaseSelectionTrace, List.length_append, List.length_cons, List.length_nil] <;> decide
  | dispatch _ _ => exact (by decide : 5 ≤ 9)
  | left _ phase => cases phase <;> simp only [phaseSelectionTrace, List.length_append, List.length_cons, List.length_nil] <;> decide
  | push context _ => cases context <;> simp only [phaseSelectionTrace, List.length_append, List.length_cons, List.length_nil] <;> decide
  | rightBlank _ => exact (by decide : 3 ≤ 9)

/-- A finite branch returns its fixed unary-offset constant. Twelve operations
cover the constructor/Boolean path and return from every ground phase. -/
def offset : Phase → Result Nat
  | .right .start => ⟨0, 12⟩
  | .right .checkSentinel => ⟨1, 12⟩
  | .right .incrementScratch => ⟨2, 12⟩
  | .right .pairFirst => ⟨3, 12⟩
  | .right .pairSecond => ⟨4, 12⟩
  | .right (.restoreFirst false) => ⟨5, 12⟩
  | .right (.restoreFirst true) => ⟨6, 12⟩
  | .right (.restoreFirstIncrement false) => ⟨7, 12⟩
  | .right (.restoreFirstIncrement true) => ⟨8, 12⟩
  | .right (.restoreCheck false) => ⟨9, 12⟩
  | .right (.restoreCheck true) => ⟨10, 12⟩
  | .right (.restoreRestIncrement false) => ⟨11, 12⟩
  | .right (.restoreRestIncrement true) => ⟨12, 12⟩
  | .right (.restoreLoop false) => ⟨13, 12⟩
  | .right (.restoreLoop true) => ⟨14, 12⟩
  | .right (.restoreLoopIncrement false) => ⟨15, 12⟩
  | .right (.restoreLoopIncrement true) => ⟨16, 12⟩
  | .dispatch false false => ⟨17, 12⟩
  | .dispatch false true => ⟨18, 12⟩
  | .dispatch true false => ⟨19, 12⟩
  | .dispatch true true => ⟨20, 12⟩
  | .left false .start => ⟨21, 12⟩
  | .left false .checkSentinel => ⟨22, 12⟩
  | .left false .incrementScratch => ⟨23, 12⟩
  | .left false .pairFirst => ⟨24, 12⟩
  | .left false .pairSecond => ⟨25, 12⟩
  | .left false (.restore false) => ⟨26, 12⟩
  | .left false (.restore true) => ⟨27, 12⟩
  | .left false (.restoreIncrement false) => ⟨28, 12⟩
  | .left false (.restoreIncrement true) => ⟨29, 12⟩
  | .left false .restoreEmpty => ⟨30, 12⟩
  | .left true .start => ⟨31, 12⟩
  | .left true .checkSentinel => ⟨32, 12⟩
  | .left true .incrementScratch => ⟨33, 12⟩
  | .left true .pairFirst => ⟨34, 12⟩
  | .left true .pairSecond => ⟨35, 12⟩
  | .left true (.restore false) => ⟨36, 12⟩
  | .left true (.restore true) => ⟨37, 12⟩
  | .left true (.restoreIncrement false) => ⟨38, 12⟩
  | .left true (.restoreIncrement true) => ⟨39, 12⟩
  | .left true .restoreEmpty => ⟨40, 12⟩
  | .push (.stay false) .drain => ⟨41, 12⟩
  | .push (.stay false) .drainIncrement => ⟨42, 12⟩
  | .push (.stay false) .restore => ⟨43, 12⟩
  | .push (.stay false) .restoreIncrementFirst => ⟨44, 12⟩
  | .push (.stay false) .restoreIncrementSecond => ⟨45, 12⟩
  | .push (.stay false) .addBit => ⟨46, 12⟩
  | .push (.stay true) .drain => ⟨47, 12⟩
  | .push (.stay true) .drainIncrement => ⟨48, 12⟩
  | .push (.stay true) .restore => ⟨49, 12⟩
  | .push (.stay true) .restoreIncrementFirst => ⟨50, 12⟩
  | .push (.stay true) .restoreIncrementSecond => ⟨51, 12⟩
  | .push (.stay true) .addBit => ⟨52, 12⟩
  | .push (.right false false) .drain => ⟨53, 12⟩
  | .push (.right false false) .drainIncrement => ⟨54, 12⟩
  | .push (.right false false) .restore => ⟨55, 12⟩
  | .push (.right false false) .restoreIncrementFirst => ⟨56, 12⟩
  | .push (.right false false) .restoreIncrementSecond => ⟨57, 12⟩
  | .push (.right false false) .addBit => ⟨58, 12⟩
  | .push (.right false true) .drain => ⟨59, 12⟩
  | .push (.right false true) .drainIncrement => ⟨60, 12⟩
  | .push (.right false true) .restore => ⟨61, 12⟩
  | .push (.right false true) .restoreIncrementFirst => ⟨62, 12⟩
  | .push (.right false true) .restoreIncrementSecond => ⟨63, 12⟩
  | .push (.right false true) .addBit => ⟨64, 12⟩
  | .push (.right true false) .drain => ⟨65, 12⟩
  | .push (.right true false) .drainIncrement => ⟨66, 12⟩
  | .push (.right true false) .restore => ⟨67, 12⟩
  | .push (.right true false) .restoreIncrementFirst => ⟨68, 12⟩
  | .push (.right true false) .restoreIncrementSecond => ⟨69, 12⟩
  | .push (.right true false) .addBit => ⟨70, 12⟩
  | .push (.right true true) .drain => ⟨71, 12⟩
  | .push (.right true true) .drainIncrement => ⟨72, 12⟩
  | .push (.right true true) .restore => ⟨73, 12⟩
  | .push (.right true true) .restoreIncrementFirst => ⟨74, 12⟩
  | .push (.right true true) .restoreIncrementSecond => ⟨75, 12⟩
  | .push (.right true true) .addBit => ⟨76, 12⟩
  | .push (.leftWrite false false) .drain => ⟨77, 12⟩
  | .push (.leftWrite false false) .drainIncrement => ⟨78, 12⟩
  | .push (.leftWrite false false) .restore => ⟨79, 12⟩
  | .push (.leftWrite false false) .restoreIncrementFirst => ⟨80, 12⟩
  | .push (.leftWrite false false) .restoreIncrementSecond => ⟨81, 12⟩
  | .push (.leftWrite false false) .addBit => ⟨82, 12⟩
  | .push (.leftWrite false true) .drain => ⟨83, 12⟩
  | .push (.leftWrite false true) .drainIncrement => ⟨84, 12⟩
  | .push (.leftWrite false true) .restore => ⟨85, 12⟩
  | .push (.leftWrite false true) .restoreIncrementFirst => ⟨86, 12⟩
  | .push (.leftWrite false true) .restoreIncrementSecond => ⟨87, 12⟩
  | .push (.leftWrite false true) .addBit => ⟨88, 12⟩
  | .push (.leftWrite true false) .drain => ⟨89, 12⟩
  | .push (.leftWrite true false) .drainIncrement => ⟨90, 12⟩
  | .push (.leftWrite true false) .restore => ⟨91, 12⟩
  | .push (.leftWrite true false) .restoreIncrementFirst => ⟨92, 12⟩
  | .push (.leftWrite true false) .restoreIncrementSecond => ⟨93, 12⟩
  | .push (.leftWrite true false) .addBit => ⟨94, 12⟩
  | .push (.leftWrite true true) .drain => ⟨95, 12⟩
  | .push (.leftWrite true true) .drainIncrement => ⟨96, 12⟩
  | .push (.leftWrite true true) .restore => ⟨97, 12⟩
  | .push (.leftWrite true true) .restoreIncrementFirst => ⟨98, 12⟩
  | .push (.leftWrite true true) .restoreIncrementSecond => ⟨99, 12⟩
  | .push (.leftWrite true true) .addBit => ⟨100, 12⟩
  | .push (.leftNeighbor false false) .drain => ⟨101, 12⟩
  | .push (.leftNeighbor false false) .drainIncrement => ⟨102, 12⟩
  | .push (.leftNeighbor false false) .restore => ⟨103, 12⟩
  | .push (.leftNeighbor false false) .restoreIncrementFirst => ⟨104, 12⟩
  | .push (.leftNeighbor false false) .restoreIncrementSecond => ⟨105, 12⟩
  | .push (.leftNeighbor false false) .addBit => ⟨106, 12⟩
  | .push (.leftNeighbor false true) .drain => ⟨107, 12⟩
  | .push (.leftNeighbor false true) .drainIncrement => ⟨108, 12⟩
  | .push (.leftNeighbor false true) .restore => ⟨109, 12⟩
  | .push (.leftNeighbor false true) .restoreIncrementFirst => ⟨110, 12⟩
  | .push (.leftNeighbor false true) .restoreIncrementSecond => ⟨111, 12⟩
  | .push (.leftNeighbor false true) .addBit => ⟨112, 12⟩
  | .push (.leftNeighbor true false) .drain => ⟨113, 12⟩
  | .push (.leftNeighbor true false) .drainIncrement => ⟨114, 12⟩
  | .push (.leftNeighbor true false) .restore => ⟨115, 12⟩
  | .push (.leftNeighbor true false) .restoreIncrementFirst => ⟨116, 12⟩
  | .push (.leftNeighbor true false) .restoreIncrementSecond => ⟨117, 12⟩
  | .push (.leftNeighbor true false) .addBit => ⟨118, 12⟩
  | .push (.leftNeighbor true true) .drain => ⟨119, 12⟩
  | .push (.leftNeighbor true true) .drainIncrement => ⟨120, 12⟩
  | .push (.leftNeighbor true true) .restore => ⟨121, 12⟩
  | .push (.leftNeighbor true true) .restoreIncrementFirst => ⟨122, 12⟩
  | .push (.leftNeighbor true true) .restoreIncrementSecond => ⟨123, 12⟩
  | .push (.leftNeighbor true true) .addBit => ⟨124, 12⟩
  | .rightBlank false => ⟨125, 12⟩
  | .rightBlank true => ⟨126, 12⟩

theorem offset_value (phase : Phase) : (offset phase).value = Layout.encodePhase phase := by
  cases phase with
  | right phase => cases phase <;> first | rfl | (rename_i bit; cases bit <;> rfl)
  | dispatch symbol tailEmpty => cases symbol <;> cases tailEmpty <;> rfl
  | left symbol phase => cases symbol <;> cases phase <;> first | rfl | (rename_i bit; cases bit <;> rfl)
  | push context phase =>
      cases context with
      | stay symbol => cases symbol <;> cases phase <;> rfl
      | right symbol tailEmpty => cases symbol <;> cases tailEmpty <;> cases phase <;> rfl
      | leftWrite symbol neighbor => cases symbol <;> cases neighbor <;> cases phase <;> rfl
      | leftNeighbor symbol neighbor => cases symbol <;> cases neighbor <;> cases phase <;> rfl
  | rightBlank symbol => cases symbol <;> rfl

theorem offset_operations (phase : Phase) : (offset phase).operations = 12 := by
  cases phase with
  | right phase => cases phase <;> first | rfl | (rename_i bit; cases bit <;> rfl)
  | dispatch symbol tailEmpty => cases symbol <;> cases tailEmpty <;> rfl
  | left symbol phase => cases symbol <;> cases phase <;> first | rfl | (rename_i bit; cases bit <;> rfl)
  | push context phase =>
      cases context with
      | stay symbol => cases symbol <;> cases phase <;> rfl
      | right symbol tailEmpty => cases symbol <;> cases tailEmpty <;> cases phase <;> rfl
      | leftWrite symbol neighbor => cases symbol <;> cases neighbor <;> cases phase <;> rfl
      | leftNeighbor symbol neighbor => cases symbol <;> cases neighbor <;> cases phase <;> rfl
  | rightBlank symbol => cases symbol <;> rfl

theorem offset_le (phase : Phase) : (offset phase).value ≤ 126 :=
  Nat.le_of_lt_succ (by simpa only [offset_value] using! Layout.encodePhase_lt phase)

theorem offset_covers_phaseSelection (phase : Phase) :
    (phaseSelectionTrace phase).length ≤ (offset phase).operations := by
  rw [offset_operations]
  exact Nat.le_trans (phaseSelectionTrace_length_le phase) (by decide : 9 ≤ 12)

def targetOption : Option DeterministicTape.Rule → Nat
  | none => 0
  | some rule => rule.nextState

def targetCells : List DeterministicTape.StateRow → Nat
  | [] => 0
  | row :: rest => targetOption row.onFalse + targetOption row.onTrue + targetCells rest

def rule (machine : DeterministicTape.Machine) (state : Nat) (symbol : Bool) : Result (Option DeterministicTape.Rule) :=
  let row := RogozhinInputConstructionMachine.lookup DeterministicTapeThreeCounterComputability.emptyRow machine.states state
  ⟨if symbol then row.value.onTrue else row.value.onFalse, row.operations + 3⟩

theorem rule_value (machine : DeterministicTape.Machine) (state : Nat) (symbol : Bool) :
    (rule machine state symbol).value = Compiler.ruleFor machine state symbol := by
  rw [rule, RogozhinInputConstructionMachine.lookup_value,
    DeterministicTapeThreeCounterComputability.ruleFor_getD]

theorem lookup_operations_le_length {α : Type} (fallback : α) (word : List α) (index : Nat) :
    (RogozhinInputConstructionMachine.lookup fallback word index).operations ≤ 5 * word.length + 3 := by
  induction word generalizing index with
  | nil => exact (by decide : 2 ≤ 3)
  | cons first rest ih =>
      cases index with
      | zero => exact Nat.le_add_left _ _
      | succ index =>
          have bound := Nat.add_le_add_left (ih index) 5
          simpa only [RogozhinInputConstructionMachine.lookup, List.length_cons, Nat.mul_succ,
            Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using bound

theorem rule_operations_le (machine : DeterministicTape.Machine) (state : Nat) (symbol : Bool) :
    (rule machine state symbol).operations ≤ 5 * machine.states.length + 6 :=
  Nat.add_le_add_right (lookup_operations_le_length _ _ _) 3

theorem targetOption_getD_le (rows : List DeterministicTape.StateRow) (index : Nat) (symbol : Bool) :
    targetOption (if symbol then (rows.getD index DeterministicTapeThreeCounterComputability.emptyRow).onTrue
      else (rows.getD index DeterministicTapeThreeCounterComputability.emptyRow).onFalse) ≤ targetCells rows := by
  induction rows generalizing index with
  | nil => cases symbol <;> exact Nat.le_refl _
  | cons row rest ih =>
      cases index with
      | zero =>
          cases symbol with
          | false => exact Nat.le_trans (Nat.le_add_right _ _) (Nat.le_add_right _ _)
          | true => exact Nat.le_trans (Nat.le_add_left _ _) (Nat.le_add_right _ _)
      | succ index => exact Nat.le_trans (ih index) (Nat.le_add_left _ _)

theorem rule_target_le (machine : DeterministicTape.Machine) (state : Nat) (symbol : Bool)
    (selected : DeterministicTape.Rule) (found : (rule machine state symbol).value = some selected) :
    selected.nextState ≤ targetCells machine.states := by
  have bound := targetOption_getD_le machine.states state symbol
  rw [← RogozhinInputConstructionMachine.lookup_value] at bound
  change targetOption (rule machine state symbol).value ≤ _ at bound
  rw [found] at bound
  exact bound

def address (state : Nat) (phase : Phase) : Result Nat :=
  let code := offset phase
  let base := ParserNatPrimitive.multiply 127 state
  let output := ParserNatPrimitive.add code.value base.value
  ⟨output.value, code.operations + base.operations + output.operations + 2⟩

theorem address_value (state : Nat) (phase : Phase) :
    (address state phase).value = Layout.address state phase := by
  simp only [address, ParserNatPrimitive.add_value, ParserNatPrimitive.multiply_value, offset_value,
    Layout.address, Layout.phaseCount, Nat.mul_comm, Nat.add_comm]

theorem address_operations_le (state : Nat) (phase : Phase) :
    (address state phase).operations ≤ 515 * state + 521 := by
  have copied := Nat.add_le_add_right (Nat.mul_le_mul_left 4 (offset_le phase)) 1
  have bound := Nat.add_le_add_right (Nat.add_le_add_left copied (12 + (515 * state + 2))) 2
  simp only [address, offset_operations, ParserNatPrimitive.multiply_operations,
    ParserNatPrimitive.add_operations]
  exact Nat.le_trans bound (Nat.le_of_eq (by
    change 12 + (515 * state + 2) + 505 + 2 = 515 * state + 521
    rw [Nat.add_assoc, Nat.add_comm 12, Nat.add_assoc, Nat.add_assoc]))

def boundary (state : Nat) : Result Nat := ParserNatPrimitive.multiply 127 state

theorem boundary_value (state : Nat) : (boundary state).value = Compiler.boundaryAddress state := by
  rw [boundary, ParserNatPrimitive.multiply_value]
  change 127 * state = state * 127 + 0
  rw [Nat.add_zero, Nat.mul_comm]

theorem boundary_operations (state : Nat) : (boundary state).operations = 515 * state + 2 := by
  rw [boundary, ParserNatPrimitive.multiply_operations]

def haltAddress (machine : DeterministicTape.Machine) : Result Nat :=
  let size := RogozhinInputConstructionMachine.length machine.states
  let output := boundary size.value
  ⟨output.value, size.operations + output.operations + 2⟩

theorem haltAddress_value (machine : DeterministicTape.Machine) :
    (haltAddress machine).value = Compiler.haltAddress machine := by
  simp only [haltAddress, boundary, ParserNatPrimitive.multiply_value,
    RogozhinInputConstructionMachine.length_value, Compiler.haltAddress, Layout.phaseCount, Nat.mul_comm]

theorem haltAddress_operations (machine : DeterministicTape.Machine) :
    (haltAddress machine).operations = 519 * machine.states.length + 6 := by
  simp only [haltAddress, boundary_operations, RogozhinInputConstructionMachine.length_operations,
    RogozhinInputConstructionMachine.length_value, show 519 = 4 + 515 by rfl,
    Nat.add_mul, show 6 = 2 + 2 + 2 by rfl, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]


/-- Fixed constructor results share their immutable payload. -/
def share {α : Type} (value : α) : Result α := ⟨value, 1⟩

def increment (register : Register) (target : Result Nat) : Result Instruction :=
  ⟨.increment register target.value, target.operations + 3⟩

def decrement (register : Register) (nonzero zero : Result Nat) : Result Instruction :=
  ⟨.decrementJump register nonzero.value zero.value, nonzero.operations + zero.operations + 4⟩

def onRule {α : Type} (machine : DeterministicTape.Machine) (state : Nat) (symbol : Bool)
    (missing : Unit → Result α) (found : DeterministicTape.Rule → Result α) : Result α :=
  let selected := rule machine state symbol
  let result := match selected.value with
    | none => missing ()
    | some current => found current
  ⟨result.value, selected.operations + result.operations + 4⟩

def branch {α : Type} (test : Result Bool) (yes no : Unit → Result α) : Result α :=
  let result := if test.value then yes () else no ()
  ⟨result.value, test.operations + result.operations + 2⟩

/-- Reading the context's finite constructor, symbol and Boolean fields costs
at most six observations. Source lookup uses the recursive measured helper. -/
def bit (machine : DeterministicTape.Machine) (state : Nat) (context : PushContext) : Result Bool :=
  let result := match context with
    | .leftNeighbor _ neighbor => share neighbor
    | other => onRule machine state (Compiler.pushSymbol other)
        (fun _ => share false) (fun current => share current.write)
  ⟨result.value, result.operations + 6⟩

def finish (machine : DeterministicTape.Machine) (halt state : Nat) (context : PushContext) : Result Nat :=
  let result := match context with
    | .stay symbol => onRule machine state symbol (fun _ => share halt)
        (fun current => boundary current.nextState)
    | .right symbol tailEmpty => onRule machine state symbol (fun _ => share halt)
        (fun current => if tailEmpty then address state (.rightBlank symbol)
          else boundary current.nextState)
    | .leftWrite symbol neighbor => address state (.push (.leftNeighbor symbol neighbor) .drain)
    | .leftNeighbor symbol _ => onRule machine state symbol (fun _ => share halt)
        (fun current => boundary current.nextState)
  ⟨result.value, result.operations + 6⟩

def zeroGoto (halt state : Nat) (phase : Phase) : Result Instruction :=
  decrement .scratch (share halt) (address state phase)

 theorem bit_value (machine : DeterministicTape.Machine) (state : Nat) (context : PushContext) :
    (bit machine state context).value = Compiler.pushBit machine state context := by
  cases context <;> simp only [bit, Compiler.pushBit, Compiler.pushSymbol, onRule, rule_value, share]
  all_goals split <;> simp_all only

 theorem finish_value (machine : DeterministicTape.Machine) (state : Nat) (context : PushContext) :
    (finish machine (Compiler.haltAddress machine) state context).value =
      Compiler.finishAddress machine state context := by
  cases context <;> simp only [finish, Compiler.finishAddress, onRule, rule_value, share,
    address_value, boundary_value]
  all_goals split <;> simp_all only [address_value, boundary_value]
  split <;> simp only [address_value, boundary_value]

 theorem zeroGoto_value (machine : DeterministicTape.Machine) (state : Nat) (phase : Phase) :
    (zeroGoto (Compiler.haltAddress machine) state phase).value = Compiler.zeroGoto machine state phase := by
  simp only [zeroGoto, decrement, share, address_value, Compiler.zeroGoto]

def instructionBody (machine : DeterministicTape.Machine) (halt state : Nat) : Phase ->
    Result Instruction
  | .right .start =>
      decrement .right (address state (.right .checkSentinel))
        (share halt)
  | .right .checkSentinel =>
      decrement .right (address state (.right .incrementScratch))
        (share halt)
  | .right .incrementScratch =>
      increment .scratch (address state (.right .pairFirst))
  | .right .pairFirst =>
      decrement .right (address state (.right .pairSecond))
        (address state (.right (.restoreFirst false)))
  | .right .pairSecond =>
      decrement .right (address state (.right .incrementScratch))
        (address state (.right (.restoreFirst true)))
  | .right (.restoreFirst bit) =>
      decrement .scratch
        (address state (.right (.restoreFirstIncrement bit)))
        (share halt)
  | .right (.restoreFirstIncrement bit) =>
      increment .right (address state (.right (.restoreCheck bit)))
  | .right (.restoreCheck bit) =>
      decrement .scratch
        (address state (.right (.restoreRestIncrement bit)))
        (address state (.dispatch bit true))
  | .right (.restoreRestIncrement bit) =>
      increment .right (address state (.right (.restoreLoop bit)))
  | .right (.restoreLoop bit) =>
      decrement .scratch
        (address state (.right (.restoreLoopIncrement bit)))
        (address state (.dispatch bit false))
  | .right (.restoreLoopIncrement bit) =>
      increment .right (address state (.right (.restoreLoop bit)))
  | .dispatch symbol tailEmpty =>
      onRule machine state symbol (fun _ => share .halt) (fun current =>
        match current.move with
        | .stay => zeroGoto halt state (.push (.stay symbol) .drain)
        | .left => zeroGoto halt state (.left symbol .start)
        | .right => zeroGoto halt state (.push (.right symbol tailEmpty) .drain))
  | .left symbol .start =>
      decrement .left (address state (.left symbol .checkSentinel))
        (share halt)
  | .left symbol .checkSentinel =>
      decrement .left (address state (.left symbol .incrementScratch))
        (address state (.left symbol .restoreEmpty))
  | .left symbol .incrementScratch =>
      increment .scratch (address state (.left symbol .pairFirst))
  | .left symbol .pairFirst =>
      decrement .left (address state (.left symbol .pairSecond))
        (address state (.left symbol (.restore false)))
  | .left symbol .pairSecond =>
      decrement .left (address state (.left symbol .incrementScratch))
        (address state (.left symbol (.restore true)))
  | .left symbol (.restore neighbor) =>
      decrement .scratch
        (address state (.left symbol (.restoreIncrement neighbor)))
        (address state (.push (.leftWrite symbol neighbor) .drain))
  | .left symbol (.restoreIncrement neighbor) =>
      increment .left (address state (.left symbol (.restore neighbor)))
  | .left symbol .restoreEmpty =>
      increment .left
        (address state (.push (.leftWrite symbol false) .drain))
  | .push context .drain =>
      decrement (Compiler.pushRegister context)
        (address state (.push context .drainIncrement))
        (address state (.push context .restore))
  | .push context .drainIncrement =>
      increment .scratch (address state (.push context .drain))
  | .push context .restore =>
      decrement .scratch
        (address state (.push context .restoreIncrementFirst))
        (branch (bit machine state context)
          (fun _ => address state (.push context .addBit))
          (fun _ => finish machine halt state context))
  | .push context .restoreIncrementFirst =>
      increment (Compiler.pushRegister context)
        (address state (.push context .restoreIncrementSecond))
  | .push context .restoreIncrementSecond =>
      increment (Compiler.pushRegister context)
        (address state (.push context .restore))
  | .push context .addBit =>
      increment (Compiler.pushRegister context) (finish machine halt state context)
  | .rightBlank symbol =>
      onRule machine state symbol (fun _ => share .halt)
        (fun current => increment .right (boundary current.nextState))


/-- Eight observations cover selection of a typed phase and its finite fields. -/
def instruction (machine : DeterministicTape.Machine) (halt state : Nat) (phase : Phase) : Result Instruction :=
  let result := instructionBody machine halt state phase
  ⟨result.value, result.operations + 8⟩

 theorem instruction_value (machine : DeterministicTape.Machine) (state : Nat) (phase : Phase) :
    (instruction machine (Compiler.haltAddress machine) state phase).value = Compiler.instructionFor machine state phase := by
  simp only [instruction]
  cases phase with
  | right phase => cases phase <;> simp only [instructionBody, increment, decrement, share,
      address_value, Compiler.instructionFor]
  | dispatch symbol tailEmpty =>
      simp only [instructionBody, onRule, rule_value, share, Compiler.instructionFor]
      split <;> simp_all only
      split <;> simp_all only [zeroGoto_value]
  | left symbol phase => cases phase <;> simp only [instructionBody, increment, decrement, share,
      address_value, Compiler.instructionFor]
  | push context phase =>
      cases phase <;> simp only [instructionBody, increment, decrement, branch, share,
        address_value, bit_value, finish_value, Compiler.instructionFor]
      split <;> simp only [address_value, finish_value]
  | rightBlank symbol =>
      simp only [instructionBody, onRule, rule_value, share, Compiler.instructionFor]
      split <;> simp_all only [increment, boundary_value]

def addressBudget (state : Nat) : Nat := 515 * state + 521
def targetBudget (machine : DeterministicTape.Machine) : Nat := 515 * targetCells machine.states + 2
def ruleBudget (machine : DeterministicTape.Machine) : Nat := 5 * machine.states.length + 6
def localBudget (machine : DeterministicTape.Machine) (state : Nat) : Nat :=
  addressBudget state + targetBudget machine + ruleBudget machine + 16

theorem address_operations_budget (machine : DeterministicTape.Machine) (state : Nat) (phase : Phase) :
    (address state phase).operations ≤ localBudget machine state :=
  Nat.le_trans (address_operations_le state phase)
    (Nat.le_trans (Nat.le_add_right _ _) (Nat.le_trans (Nat.le_add_right _ _) (Nat.le_add_right _ _)))

theorem rule_operations_budget (machine : DeterministicTape.Machine) (state : Nat) (symbol : Bool) :
    (rule machine state symbol).operations ≤ localBudget machine state :=
  Nat.le_trans (rule_operations_le machine state symbol)
    (Nat.le_trans (Nat.le_add_left _ _) (Nat.le_add_right _ _))

theorem boundary_operations_target (machine : DeterministicTape.Machine) (state : Nat) (symbol : Bool)
    (current : DeterministicTape.Rule) (selected : (rule machine state symbol).value = some current) :
    (boundary current.nextState).operations ≤ targetBudget machine := by
  rw [boundary_operations]
  exact Nat.add_le_add_right (Nat.mul_le_mul_left 515 (rule_target_le machine state symbol current selected)) 2

theorem boundary_operations_budget (machine : DeterministicTape.Machine) (state : Nat) (symbol : Bool)
    (current : DeterministicTape.Rule) (selected : (rule machine state symbol).value = some current) :
    (boundary current.nextState).operations ≤ localBudget machine state :=
  Nat.le_trans (boundary_operations_target machine state symbol current selected)
    (Nat.le_trans (Nat.le_add_left _ _) (Nat.le_trans (Nat.le_add_right _ _) (Nat.le_add_right _ _)))

theorem constant_le_budget (machine : DeterministicTape.Machine) (state count : Nat) (small : count ≤ 16) :
    count ≤ localBudget machine state := Nat.le_trans small (Nat.le_add_left _ _)

theorem onRule_operations_le {α : Type} (machine : DeterministicTape.Machine) (state : Nat) (symbol : Bool)
    (missing : Unit → Result α) (found : DeterministicTape.Rule → Result α) (bound : Nat)
    (no : (missing ()).operations ≤ bound)
    (yes : ∀ current, (rule machine state symbol).value = some current → (found current).operations ≤ bound) :
    (onRule machine state symbol missing found).operations ≤ ruleBudget machine + bound + 4 := by
  rw [onRule]
  split
  · exact Nat.add_le_add_right (Nat.add_le_add (rule_operations_le machine state symbol) no) 4
  next current selected =>
    exact Nat.add_le_add_right (Nat.add_le_add (rule_operations_le machine state symbol) (yes current selected)) 4

theorem branch_operations_le {α : Type} (test : Result Bool) (yes no : Unit → Result α) (bound : Nat)
    (positive : (yes ()).operations ≤ bound) (negative : (no ()).operations ≤ bound) :
    (branch test yes no).operations ≤ test.operations + bound + 2 := by
  rw [branch]
  split
  · exact Nat.add_le_add_right (Nat.add_le_add_left positive _) 2
  · exact Nat.add_le_add_right (Nat.add_le_add_left negative _) 2

theorem bit_operations_budget (machine : DeterministicTape.Machine) (state : Nat) (context : PushContext) :
    (bit machine state context).operations ≤ localBudget machine state := by
  have each (symbol : Bool) :
      (onRule machine state symbol (fun _ => share false) (fun current => share current.write)).operations + 6 ≤
        localBudget machine state := by
    have bound := Nat.add_le_add_right (onRule_operations_le machine state symbol
      (fun _ => share false) (fun current => share current.write) 1 (Nat.le_refl _) (fun _ _ => Nat.le_refl _)) 6
    apply Nat.le_trans bound
    have small : ruleBudget machine + 11 ≤ ruleBudget machine + 16 := Nat.add_le_add_left (by decide : 11 ≤ 16) _
    have extended := Nat.le_trans small (Nat.le_add_left (ruleBudget machine + 16)
      (addressBudget state + targetBudget machine))
    simpa only [localBudget, Nat.add_assoc] using extended
  cases context with
  | stay symbol => exact each symbol
  | right symbol tailEmpty => exact each symbol
  | leftWrite symbol neighbor => exact each symbol
  | leftNeighbor symbol neighbor => exact constant_le_budget machine state 7 (by decide)

theorem finish_operations_budget (machine : DeterministicTape.Machine) (halt state : Nat) (context : PushContext) :
    (finish machine halt state context).operations ≤ localBudget machine state := by
  let pair := addressBudget state + targetBudget machine
  have addressBound (phase : Phase) : (address state phase).operations ≤ pair :=
    Nat.le_trans (address_operations_le state phase) (Nat.le_add_right _ _)
  have targetBound (symbol : Bool) (current : DeterministicTape.Rule)
      (selected : (rule machine state symbol).value = some current) : (boundary current.nextState).operations ≤ pair :=
    Nat.le_trans (boundary_operations_target machine state symbol current selected) (Nat.le_add_left _ _)
  have missing : (share halt).operations ≤ pair :=
    Nat.le_trans (by decide : 1 ≤ 515)
      (Nat.le_trans (Nat.le_add_left _ _) (Nat.le_add_right _ _))
  have complete {value : Result Nat} (bound : value.operations ≤ ruleBudget machine + pair + 4) :
      value.operations + 6 ≤ localBudget machine state := by
    apply Nat.le_trans (Nat.add_le_add_right bound 6)
    have extended := Nat.add_le_add_left (by decide : 10 ≤ 16) (pair + ruleBudget machine)
    simpa only [localBudget, pair, show 10 = 4 + 6 by rfl,
      Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using extended
  cases context with
  | stay symbol =>
      apply complete
      exact onRule_operations_le machine state symbol _ _ pair missing (targetBound symbol)
  | right symbol tailEmpty =>
      apply complete
      apply onRule_operations_le machine state symbol _ _ pair missing
      intro current selected
      cases tailEmpty
      · exact targetBound symbol current selected
      · exact addressBound _
  | leftWrite symbol neighbor =>
      have bound := Nat.add_le_add_right (addressBound (.push (.leftNeighbor symbol neighbor) .drain)) 6
      apply Nat.le_trans bound
      exact Nat.add_le_add (Nat.le_add_right _ _) (by decide : 6 ≤ 16)
  | leftNeighbor symbol neighbor =>
      apply complete
      exact onRule_operations_le machine state symbol _ _ pair missing (targetBound symbol)

theorem instruction_operations_budget (machine : DeterministicTape.Machine) (halt state : Nat) (phase : Phase) :
    (instruction machine halt state phase).operations ≤ 3 * localBudget machine state + 24 := by
  let budget := localBudget machine state
  have envelope {value coefficient constant : Nat} (bound : value ≤ coefficient * budget + constant)
      (few : coefficient ≤ 3) (small : constant ≤ 16) : value ≤ 3 * budget + 16 :=
    Nat.le_trans bound (Nat.add_le_add (Nat.mul_le_mul_right budget few) small)
  have inc (register : Register) (target : Result Nat) (bounded : target.operations ≤ budget) :
      (increment register target).operations ≤ 3 * budget + 16 := by
    exact envelope (by simpa only [Nat.one_mul] using! Nat.add_le_add_right bounded 3)
      (by decide : 1 ≤ 3) (by decide : 3 ≤ 16)
  have dec (register : Register) (nonzero zero : Result Nat)
      (firstBound : nonzero.operations ≤ budget) (secondBound : zero.operations ≤ budget) :
      (decrement register nonzero zero).operations ≤ 3 * budget + 16 := by
    have bound := Nat.add_le_add_right (Nat.add_le_add firstBound secondBound) 4
    exact envelope (by simpa only [Nat.two_mul] using! bound) (by decide : 2 ≤ 3) (by decide : 4 ≤ 16)
  have goto (phase : Phase) : (zeroGoto halt state phase).operations ≤ budget + 5 := by
    have bound := Nat.add_le_add_right (Nat.add_le_add_left (address_operations_budget machine state phase) 1) 4
    simpa only [zeroGoto, decrement, share, show 5 = 1 + 4 by rfl,
      Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using bound
  have shareBound : (share halt).operations ≤ budget := constant_le_budget machine state 1 (by decide)
  have bodyBound : (instructionBody machine halt state phase).operations ≤ 3 * budget + 16 := by
    cases phase with
    | right phase =>
        cases phase <;> simp only [instructionBody]
        all_goals first | apply inc | apply dec
        all_goals first | exact address_operations_budget machine state _ | exact shareBound
    | dispatch symbol tailEmpty =>
        have selected := onRule_operations_le machine state symbol (fun _ => share Instruction.halt)
          (fun current => match current.move with
            | .stay => zeroGoto halt state (.push (.stay symbol) .drain)
            | .left => zeroGoto halt state (.left symbol .start)
            | .right => zeroGoto halt state (.push (.right symbol tailEmpty) .drain)) (budget + 5)
          (Nat.le_trans shareBound (Nat.le_add_right _ _)) (by intro current _; cases current with | mk write move next => cases move <;> exact goto _)
        have ruleBound : ruleBudget machine ≤ budget :=
          Nat.le_trans (Nat.le_add_left _ _) (Nat.le_add_right _ _)
        have combined := Nat.le_trans selected (Nat.add_le_add_right (Nat.add_le_add_right ruleBound (budget + 5)) 4)
        exact envelope (by simpa only [Nat.two_mul, show 9 = 5 + 4 by rfl, Nat.add_assoc] using! combined)
          (by decide : 2 ≤ 3) (by decide : 9 ≤ 16)
    | left symbol phase =>
        cases phase <;> simp only [instructionBody]
        all_goals first | apply inc | apply dec
        all_goals first | exact address_operations_budget machine state _ | exact shareBound
    | push context phase =>
        cases phase with
        | drain => exact dec _ _ _ (address_operations_budget machine state _) (address_operations_budget machine state _)
        | drainIncrement => exact inc _ _ (address_operations_budget machine state _)
        | restore =>
            have selected := branch_operations_le (bit machine state context)
              (fun _ => address state (.push context .addBit))
              (fun _ => finish machine halt state context) budget
              (address_operations_budget machine state _) (finish_operations_budget machine halt state context)
            have testBound := Nat.le_trans selected (Nat.add_le_add_right
              (Nat.add_le_add_right (bit_operations_budget machine state context) budget) 2)
            have combined := Nat.add_le_add_right (Nat.add_le_add
              (address_operations_budget machine state (.push context .restoreIncrementFirst)) testBound) 4
            exact envelope (by simpa only [show 3 = 1 + 1 + 1 by rfl, Nat.add_mul, Nat.one_mul,
              show 6 = 2 + 4 by rfl, Nat.add_assoc] using! combined)
              (Nat.le_refl 3) (by decide : 6 ≤ 16)
        | restoreIncrementFirst => exact inc _ _ (address_operations_budget machine state _)
        | restoreIncrementSecond => exact inc _ _ (address_operations_budget machine state _)
        | addBit => exact inc _ _ (finish_operations_budget machine halt state context)
    | rightBlank symbol =>
        have selected := onRule_operations_le machine state symbol (fun _ => share Instruction.halt)
          (fun current => increment .right (boundary current.nextState)) (budget + 3)
          (Nat.le_trans shareBound (Nat.le_add_right _ _))
          (fun current found => Nat.add_le_add_right (boundary_operations_budget machine state symbol current found) 3)
        have ruleBound : ruleBudget machine ≤ budget :=
          Nat.le_trans (Nat.le_add_left _ _) (Nat.le_add_right _ _)
        have combined := Nat.le_trans selected (Nat.add_le_add_right (Nat.add_le_add_right ruleBound (budget + 3)) 4)
        exact envelope (by simpa only [Nat.two_mul, show 7 = 3 + 4 by rfl, Nat.add_assoc] using! combined)
          (by decide : 2 ≤ 3) (by decide : 7 ≤ 16)
  exact Nat.add_le_add_right bodyBound 8

theorem getD_tabulate {α : Type} (count index : Nat) (entry : Nat → α) (fallback : α)
    (bounded : index < count) : (Compiler.tabulate count entry).getD index fallback = entry index := by
  induction count generalizing index entry with
  | zero => exact False.elim (Nat.not_lt_zero index bounded)
  | succ count ih =>
      cases index with
      | zero => rfl
      | succ index => exact ih index (fun offset => entry (offset + 1)) (Nat.lt_of_succ_lt_succ bounded)

def phase (code : Nat) : Result Phase :=
  RogozhinInputConstructionMachine.lookup (.right .start) phaseTable code

theorem phase_value (code : Nat) (bounded : code < 127) : (phase code).value = Layout.decodePhase code := by
  rw [phase, RogozhinInputConstructionMachine.lookup_value, phaseTable_value]
  exact getD_tabulate 127 code Layout.decodePhase _ bounded

theorem phase_operations_le (code : Nat) : (phase code).operations ≤ 638 :=
  lookup_operations_le_length _ phaseTable code

/-- Numeric label decoding traverses the unary label; the phase lookup traverses
the fixed 127-cell program constant. No native division is executed. -/
def entry (machine : DeterministicTape.Machine) (halt label : Nat) : Result Instruction :=
  let decoded := ParserNatDivisionPrimitive.divMod 127 label
  let selected := phase decoded.value.2
  let output := instruction machine halt decoded.value.1 selected.value
  ⟨output.value, decoded.operations + selected.operations + output.operations + 4⟩

theorem entry_value (machine : DeterministicTape.Machine) (label : Nat) :
    (entry machine (Compiler.haltAddress machine) label).value =
      Compiler.instructionFor machine (label / Layout.phaseCount) (Layout.decodePhase (label % Layout.phaseCount)) := by
  simp only [entry, instruction_value, ParserNatDivisionPrimitive.divMod_value, Layout.phaseCount]
  rw [phase_value (label % 127) (Nat.mod_lt label (by decide))]

theorem localBudget_mono (machine : DeterministicTape.Machine) {small large : Nat} (bounded : small ≤ large) :
    localBudget machine small ≤ localBudget machine large :=
  Nat.add_le_add_right (Nat.add_le_add_right (Nat.add_le_add_right
    (Nat.add_le_add_right (Nat.mul_le_mul_left 515 bounded) 521) _) _) 16

def entryBudget (machine : DeterministicTape.Machine) (label : Nat) : Nat :=
  522 * label + 3 + 638 + (3 * localBudget machine label + 24) + 4

theorem entry_operations_le (machine : DeterministicTape.Machine) (halt label limit : Nat)
    (bounded : label ≤ limit) : (entry machine halt label).operations ≤ entryBudget machine limit := by
  have division := Nat.le_trans (ParserNatDivisionPrimitive.divMod_operations_le 127 label)
    (Nat.add_le_add_right (Nat.mul_le_mul_left 522 bounded) 3)
  have control := Nat.le_trans (ParserNatDivisionPrimitive.quotient_le 127 label) bounded
  have instructionBound := Nat.le_trans (instruction_operations_budget machine halt
    (ParserNatDivisionPrimitive.divMod 127 label).value.1
    (phase (ParserNatDivisionPrimitive.divMod 127 label).value.2).value)
    (Nat.add_le_add_right (Nat.mul_le_mul_left 3 (localBudget_mono machine control)) 24)
  exact Nat.add_le_add_right (Nat.add_le_add (Nat.add_le_add division (phase_operations_le _)) instructionBound) 4

theorem tabulate_congr {α : Type} (count : Nat) (left right : Nat → α) (same : ∀ index, left index = right index) :
    Compiler.tabulate count left = Compiler.tabulate count right := by
  induction count generalizing left right with
  | zero => rfl
  | succ count ih =>
      simp only [Compiler.tabulate, same 0]
      exact congrArg (List.cons (right 0)) (ih _ _ (fun index => same (index + 1)))

/-- Each recursive row allocates one output cons and one unary label successor.
The count argument is destructed once, and all table tails remain shared. -/
def table (machine : DeterministicTape.Machine) (halt : Nat) : Nat → Nat → Result ThreeCounter.Program
  | 0, _ => ⟨[], 2⟩
  | .succ count, start =>
      let current := entry machine halt start
      let rest := table machine halt count (.succ start)
      ⟨current.value :: rest.value, current.operations + rest.operations + 6⟩

theorem table_value (machine : DeterministicTape.Machine) (halt count start : Nat) :
    (table machine halt count start).value =
      Compiler.tabulate count (fun index => (entry machine halt (start + index)).value) := by
  induction count generalizing start with
  | zero => rfl
  | succ count ih =>
      simp only [table, ih, Compiler.tabulate, Nat.add_zero]
      apply congrArg (List.cons (entry machine halt start).value)
      apply tabulate_congr
      intro index
      rw [Nat.succ_add, Nat.add_succ]

theorem table_operations_le (machine : DeterministicTape.Machine) (halt count start limit : Nat)
    (bounded : start + count ≤ limit) :
    (table machine halt count start).operations ≤ count * (entryBudget machine limit + 6) + 2 := by
  induction count generalizing start with
  | zero => simp only [table, Nat.zero_mul, Nat.zero_add, Nat.le_refl]
  | succ count ih =>
      have first := entry_operations_le machine halt start limit (Nat.le_trans (Nat.le_add_right _ _) bounded)
      have tailBound : Nat.succ start + count ≤ limit := by simpa only [Nat.succ_add, Nat.add_succ] using bounded
      have rest := ih (Nat.succ start) tailBound
      have total := Nat.add_le_add_right (Nat.add_le_add first rest) 6
      simpa only [table, Nat.succ_mul, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using total

/-- Full literal tape-table construction, independent of any source execution. -/
def compile (machine : DeterministicTape.Machine) : Result ThreeCounter.Program :=
  let halt := haltAddress machine
  let output := table machine halt.value halt.value 0
  ⟨output.value, halt.operations + output.operations + 2⟩

theorem compile_value (machine : DeterministicTape.Machine) :
    (compile machine).value = Compiler.compileMachine machine := by
  simp only [compile, table_value, haltAddress_value, Compiler.compileMachine]
  apply tabulate_congr
  intro label
  simpa only [Nat.zero_add] using entry_value machine label

def constructionBudget (machine : DeterministicTape.Machine) : Nat :=
  519 * machine.states.length + 6 +
    ((127 * machine.states.length) * (entryBudget machine (127 * machine.states.length) + 6) + 2) + 2

theorem compile_operations_le (machine : DeterministicTape.Machine) :
    (compile machine).operations ≤ constructionBudget machine := by
  have bound := table_operations_le machine (haltAddress machine).value (haltAddress machine).value 0
    (haltAddress machine).value (by simp only [Nat.zero_add, Nat.le_refl])
  have combined := Nat.add_le_add_right (Nat.add_le_add_left bound (haltAddress machine).operations) 2
  simpa only [compile, constructionBudget, haltAddress_operations, haltAddress_value,
    Compiler.haltAddress, Layout.phaseCount, Nat.mul_comm] using combined

theorem entryBudget_closed (machine : DeterministicTape.Machine) (label : Nat) :
    entryBudget machine label =
      2067 * label + 1545 * targetCells machine.states + 15 * machine.states.length + 2304 := by
  simp only [entryBudget, localBudget, addressBudget, targetBudget, ruleBudget,
    show 2067 = 522 + 3 * 515 by rfl, show 1545 = 3 * 515 by rfl,
    show 15 = 3 * 5 by rfl,
    show 2304 = 3 + 638 + 3 * 521 + 3 * 2 + 3 * 6 + 3 * 16 + 24 + 4 by rfl,
    Nat.add_mul, Nat.mul_add, Nat.mul_assoc]
  simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

/-- A displayed quadratic polynomial in the number of source rows and the sum
of their literal successor labels. No well-formed-label restriction is needed. -/
theorem constructionBudget_polynomial (machine : DeterministicTape.Machine) :
    constructionBudget machine =
      127 * machine.states.length *
        (262524 * machine.states.length + 1545 * targetCells machine.states + 2310) +
      519 * machine.states.length + 10 := by
  rw [constructionBudget, entryBudget_closed]
  simp only [show 262524 = 2067 * 127 + 15 by rfl,
    show 2310 = 2304 + 6 by rfl, show 10 = 6 + 2 + 2 by rfl,
    Nat.add_mul, Nat.mul_add, Nat.mul_assoc]
  simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

theorem compile_operations_polynomial (machine : DeterministicTape.Machine) :
    (compile machine).operations ≤
      127 * machine.states.length *
        (262524 * machine.states.length + 1545 * targetCells machine.states + 2310) +
      519 * machine.states.length + 10 := by
  rw [← constructionBudget_polynomial]
  exact compile_operations_le machine

/-! The execution derivation exposes the variable-size numeric decoding,
phase-codebook traversal and table traversal. Typed instruction selection calls
the measured constructor/lookup/address helpers defined above. -/
inductive EntryExecution (machine : DeterministicTape.Machine) (halt label : Nat) : Instruction → Nat → Prop where
  | construct {state code divisionOperations phaseOperations : Nat} {selected : Phase}
      (division : DeterministicTapeDecodeConstructionMachine.DivisionExecution 127 label
        (state, code) divisionOperations)
      (codebook : RogozhinInputConstructionMachine.LookupExecution (.right .start)
        phaseTable code selected phaseOperations) :
      EntryExecution machine halt label (instruction machine halt state selected).value
        (divisionOperations + phaseOperations + (instruction machine halt state selected).operations + 4)

theorem entry_execution (machine : DeterministicTape.Machine) (halt label : Nat) :
    EntryExecution machine halt label (entry machine halt label).value (entry machine halt label).operations :=
  .construct (DeterministicTapeDecodeConstructionMachine.division_execution 127 label)
    (RogozhinInputConstructionMachine.lookup_execution _ _ _)

inductive TableExecution (machine : DeterministicTape.Machine) (halt : Nat) :
    Nat → Nat → ThreeCounter.Program → Nat → Prop where
  | nil (start : Nat) : TableExecution machine halt 0 start [] 2
  | cons {count start entryOperations restOperations : Nat} {current : Instruction} {rest : ThreeCounter.Program}
      (headRun : EntryExecution machine halt start current entryOperations)
      (tailRun : TableExecution machine halt count (.succ start) rest restOperations) :
      TableExecution machine halt (.succ count) start (current :: rest)
        (entryOperations + restOperations + 6)

theorem table_execution (machine : DeterministicTape.Machine) (halt count start : Nat) :
    TableExecution machine halt count start (table machine halt count start).value
      (table machine halt count start).operations := by
  induction count generalizing start with
  | zero => exact .nil start
  | succ count ih => exact .cons (entry_execution machine halt start) (ih _)

inductive CompilationExecution (machine : DeterministicTape.Machine) : ThreeCounter.Program → Nat → Prop where
  | construct {size sizeOperations tableOperations : Nat} {program : ThreeCounter.Program}
      (count : RogozhinInputConstructionMachine.LengthExecution machine.states size sizeOperations)
      (generated : TableExecution machine (boundary size).value (boundary size).value 0 program tableOperations) :
      CompilationExecution machine program (sizeOperations + (boundary size).operations + 2 + tableOperations + 2)

theorem compile_execution (machine : DeterministicTape.Machine) :
    CompilationExecution machine (compile machine).value (compile machine).operations :=
  .construct (RogozhinInputConstructionMachine.length_execution machine.states)
    (table_execution machine _ _ 0)

end PureSFormal.Computation.DeterministicTapeTableConstructionMachine


