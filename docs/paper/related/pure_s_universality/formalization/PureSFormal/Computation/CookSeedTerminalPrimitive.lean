import PureSFormal.Computation.RogozhinContextDataPrimitive
import PureSFormal.Computation.CookSeedTerminalReadback
import PureSFormal.PureS.ParserNatDivisionPrimitive

/-!
# Measured static terminal-rule lookup

The reader counts the immutable context, computes the fixed compiler offsets
with unary arithmetic, and reads just the required payload cell. It never runs
the source machine. A malformed or arbitrarily large requested state is covered
by the same value and operation theorems. No dummy program is materialized.
-/

namespace PureSFormal.Computation.CookSeedTerminalPrimitive

open PureS.ParserPrimitiveMachine PureS.ParserNatPrimitive PureS.ParserNatDivisionPrimitive
open PureS.ParserTerminalPrimitive RogozhinFramePrimitiveSize
open RogozhinContextWeightPrimitive
open RogozhinInputConstructionMachine (lookup lookup_value)
open CookSeedReadbackContext (Context)
open PureSFormal.Research.ProtectedTrieDeterministicCompiler

def prepare (context : Context) : Result (Nat × Nat) :=
  let count := RogozhinInputConstructionMachine.length context.frames
  let ordinary := subtract count.value 1
  let rows := subtract ordinary.value 2
  let enumeration := divMod 10 rows.value
  let primitive := divMod 3 enumeration.value.1
  ⟨(ordinary.value, primitive.value.1), count.operations + ordinary.operations +
    rows.operations + enumeration.operations + primitive.operations + 10⟩

theorem prepare_value (context : Context) :
    (prepare context).value = (context.symbolCount - 1, context.primitiveLength) := by
  simp only [prepare, RogozhinInputConstructionMachine.length_value, subtract_value,
    divMod_value, CookSeedReadbackContext.Context.symbolCount,
    CookSeedReadbackContext.Context.primitiveLength]

theorem ordinary_le (context : Context) :
    (prepare context).value.1 ≤ contextSize context.frames := by
  rw [prepare_value]
  exact Nat.le_trans (Nat.sub_le _ _) (length_le_contextSize context.frames)

theorem primitive_le (context : Context) :
    (prepare context).value.2 ≤ contextSize context.frames := by
  rw [prepare_value]
  exact Nat.le_trans (Nat.div_le_self _ _) (Nat.le_trans (Nat.div_le_self _ _)
    (Nat.le_trans (Nat.sub_le _ _) (Nat.le_trans (Nat.sub_le _ _)
      (length_le_contextSize context.frames))))

theorem prepare_operations_le (context : Context) :
    (prepare context).operations ≤ 84 * contextSize context.frames + 34 := by
  let count := RogozhinInputConstructionMachine.length context.frames
  let ordinary := subtract count.value 1
  let rows := subtract ordinary.value 2
  let enumeration := divMod 10 rows.value
  have countBound : count.operations ≤ 4 * contextSize context.frames + 2 := by
    rw [RogozhinInputConstructionMachine.length_operations]
    exact Nat.add_le_add_right (Nat.mul_le_mul_left 4 (length_le_contextSize context.frames)) 2
  have rowsBound : rows.value ≤ contextSize context.frames := by
    dsimp only [rows, ordinary, count]
    rw [subtract_value, subtract_value, RogozhinInputConstructionMachine.length_value]
    exact Nat.le_trans (Nat.sub_le _ _) (Nat.le_trans (Nat.sub_le _ _)
      (length_le_contextSize context.frames))
  have enumerationBound := Nat.le_trans (divMod_operations_le 10 rows.value)
    (Nat.add_le_add_right (Nat.mul_le_mul_left 54 rowsBound) 3)
  have primitiveBound := Nat.le_trans (divMod_operations_le 3 enumeration.value.1)
    (Nat.add_le_add_right (Nat.mul_le_mul_left 26
      (Nat.le_trans (quotient_le 10 rows.value) rowsBound)) 3)
  have bound := Nat.add_le_add_right (Nat.add_le_add (Nat.add_le_add
    (Nat.add_le_add (Nat.add_le_add countBound (subtract_operations_le count.value 1))
      (subtract_operations_le ordinary.value 2)) enumerationBound) primitiveBound) 10
  change count.operations + ordinary.operations + rows.operations + enumeration.operations +
    (divMod 3 enumeration.value.1).operations + 10 ≤ _
  simpa only [show 84 = 4 + 54 + 26 by rfl, Nat.add_mul,
    show 34 = 2 + (4 * 1 + 2) + (4 * 2 + 2) + 3 + 3 + 10 by rfl,
    Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using bound

def fourth {α : Type} : List α → Result (Option α)
  | _ :: _ :: _ :: value :: _ => ⟨some value, 16⟩
  | _ => ⟨none, 16⟩

theorem fourth_value {α : Type} (values : List α) :
    (fourth values).value = (values.drop 2)[1]? := by
  cases values with
  | nil => rfl
  | cons a rest => cases rest with
    | nil => rfl
    | cons b rest => cases rest with
      | nil => rfl
      | cons c rest => cases rest with
        | nil => rfl
        | cons d rest => rfl

theorem fourth_operations {α : Type} (values : List α) :
    (fourth values).operations = 16 := by
  cases values with
  | nil => rfl
  | cons a rest => cases rest with
    | nil => rfl
    | cons b rest => cases rest with
      | nil => rfl
      | cons c rest => cases rest with
        | nil => rfl
        | cons d rest => rfl

def payloadSecond (context : Context) (index : Nat) : Result (Option Nat) :=
  let reversed := RogozhinSeedPrimitive.reverse context.frames
  let frame := lookup [] reversed.value index
  let payload := RogozhinSeedPrimitive.reverse frame.value
  let selected := fourth payload.value
  ⟨selected.value, reversed.operations + frame.operations + payload.operations + selected.operations + 6⟩

theorem payloadSecond_value (context : Context) (index : Nat) :
    (payloadSecond context index).value = (CookSeedTerminalReadback.payloadWeights context index)[1]? := by
  simp only [payloadSecond, fourth_value, RogozhinSeedPrimitive.reverse_value,
    lookup_value, CookSeedTerminalReadback.payloadWeights, CookSeedTerminalReadback.frameAt]

theorem payloadSecond_operations_le (context : Context) (index : Nat) :
    (payloadSecond context index).operations ≤ 13 * contextSize context.frames + 29 := by
  let reversed := RogozhinSeedPrimitive.reverse context.frames
  let frame := lookup [] reversed.value index
  have rowCount : reversed.value.length ≤ contextSize context.frames := by
    rw [RogozhinSeedPrimitive.reverse_value, List.length_reverse]
    exact length_le_contextSize context.frames
  have frameSize : exponentSize frame.value ≤ contextSize context.frames := by
    have bound := lookup_size reversed.value index
    rw [RogozhinSeedPrimitive.reverse_value, contextSize_reverse] at bound
    dsimp only [frame, reversed]
    rw [RogozhinSeedPrimitive.reverse_value]
    exact bound
  have r := Nat.add_le_add_right (Nat.mul_le_mul_left 4 (length_le_contextSize context.frames)) 2
  have f := Nat.le_trans (lookup_operations_le_length ([] : List Nat) reversed.value index)
    (Nat.add_le_add_right (Nat.mul_le_mul_left 5 rowCount) 3)
  have p := Nat.add_le_add_right (Nat.mul_le_mul_left 4
    (Nat.le_trans (length_le_exponentSize frame.value) frameSize)) 2
  have bound := Nat.add_le_add_right (Nat.add_le_add_right (Nat.add_le_add (Nat.add_le_add r f) p) 16) 6
  change reversed.operations + frame.operations +
    (RogozhinSeedPrimitive.reverse frame.value).operations +
    (fourth (RogozhinSeedPrimitive.reverse frame.value).value).operations + 6 ≤ _
  rw [fourth_operations, RogozhinSeedPrimitive.reverse_operations,
    RogozhinSeedPrimitive.reverse_operations]
  simpa only [show 13 = 4 + 5 + 4 by rfl, Nat.add_mul,
    show 29 = 2 + 3 + 2 + 16 + 6 by rfl,
    Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using bound

theorem mapIndex {α β : Type} (f : α → β) (values : List α) (index : Nat) :
    (values.map f)[index]? = (values[index]?).map f := by
  induction values generalizing index with
  | nil => rfl
  | cons first rest ih => cases index with
    | zero => rfl
    | succ index => exact ih index

def widthHalts (context : Context) (ordinary : Nat) : Option Nat → Result Bool
  | none => ⟨false, 2⟩
  | some width =>
      let decoded := label context width
      let renamed := DeletionTwoReadbackPrimitive.rename ordinary (Nat.succ ordinary) decoded.value
      let same := equalIndex ordinary renamed.value
      ⟨same.value, decoded.operations + renamed.operations + same.operations + 8⟩

theorem widthHalts_value (context : Context) (ordinary : Nat) (width : Option Nat) :
    (widthHalts context ordinary width).value =
      decide (width.map (fun w =>
        let decoded := context.labelForWeight (context.symbolCount + 1) w
        if decoded = ordinary + 1 then ordinary else decoded) = some ordinary) := by
  cases width with
  | none => rfl
  | some width =>
      change (equalIndex ordinary
        (DeletionTwoReadbackPrimitive.rename ordinary (Nat.succ ordinary) (label context width).value).value).value = _
      rw [DeletionTwoReadbackPrimitive.rename_value, label_value]
      apply Bool.eq_iff_iff.mpr
      rw [equalIndex_value, decide_eq_true_eq]
      change (_ = _) ↔ some _ = some ordinary
      rw [Option.some.injEq]
      exact eq_comm

theorem widthHalts_operations_le (context : Context) (ordinary : Nat) (width : Option Nat) :
    (widthHalts context ordinary width).operations ≤
      85 * (contextSize context.frames + 1)^2 + 8 * ordinary + 17 := by
  cases width with
  | none => exact Nat.le_trans (by decide : 2 ≤ 17) (Nat.le_add_left _ _)
  | some width =>
      have bound := Nat.add_le_add_right (Nat.add_le_add
        (Nat.add_le_add (label_operations_le_quadratic context width)
          (DeletionTwoReadbackPrimitive.rename_operations_le ordinary (Nat.succ ordinary) (label context width).value))
        (equalIndex_operations_le ordinary
          (DeletionTwoReadbackPrimitive.rename ordinary (Nat.succ ordinary) (label context width).value).value)) 8
      simpa only [widthHalts, Nat.succ_eq_add_one, Nat.mul_add, Nat.mul_one,
        show 8 * ordinary = 4 * ordinary + 4 * ordinary from Nat.add_mul 4 4 ordinary,
        show 17 = 4 + 3 + 2 + 8 by rfl,
        Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using bound

def zeroIndex (primitive control : Nat) : Result Nat :=
  let offset := multiply 15 primitive
  let index := add offset.value control
  ⟨index.value, offset.operations + index.operations + 4⟩

theorem zeroIndex_value (primitive control : Nat) :
    (zeroIndex primitive control).value = 5 * (3 * primitive) + control := by
  simp only [zeroIndex, add_value, multiply_value, ← Nat.mul_assoc]

theorem zeroIndex_operations (primitive control : Nat) :
    (zeroIndex primitive control).operations = 127 * primitive + 7 := by
  simp only [zeroIndex, multiply_operations, add_operations, multiply_value]
  change (67 * primitive + 2) + (4 * (15 * primitive) + 1) + 4 = _
  rw [← Nat.mul_assoc]
  change (67 * primitive + 2) + (60 * primitive + 1) + 4 = _
  rw [show 127 * primitive = 67 * primitive + 60 * primitive from Nat.add_mul 67 60 primitive]
  simp only [show 7 = 2 + 1 + 4 by rfl, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

def zeroNextHalts (context : Context) (control : Nat) : Result Bool :=
  let shape := prepare context
  let index := zeroIndex shape.value.2 control
  let width := payloadSecond context index.value
  let result := widthHalts context shape.value.1 width.value
  ⟨result.value, shape.operations + index.operations + width.operations + result.operations + 8⟩

theorem zeroNextHalts_value (context : Context) (control : Nat) :
    (zeroNextHalts context control).value = CookSeedTerminalReadback.zeroNextHalts context control := by
  simp only [zeroNextHalts, widthHalts_value, prepare_value, payloadSecond_value, zeroIndex_value]
  unfold CookSeedTerminalReadback.zeroNextHalts CookSeedTerminalReadback.ordinaryRhs
    CookSeedTerminalReadback.payloadLabels CookSeedTerminalReadback.zeroSelectorIndex
  rw [mapIndex, mapIndex]
  cases selected : (CookSeedTerminalReadback.payloadWeights context
      (5 * (3 * context.primitiveLength) + control))[1]? with
  | none => rfl
  | some width =>
      simp only [Option.map, DeletionTwoT2Readback.decodeLabel,
        DeletionTwoT2Normalizer.targetHaltLabel, RogozhinTagInput.haltLabel,
        RogozhinTagInput.symbolCount, CookSeedReadbackContext.Context.ordinaryShape,
        List.length_replicate]

theorem zeroNextHalts_operations_le (context : Context) (control : Nat) :
    (zeroNextHalts context control).operations ≤
      85 * (contextSize context.frames + 1)^2 + 232 * contextSize context.frames + 95 := by
  have indexBound : (zeroIndex (prepare context).value.2 control).operations ≤
      127 * contextSize context.frames + 7 := by
    rw [zeroIndex_operations]
    exact Nat.add_le_add_right (Nat.mul_le_mul_left 127 (primitive_le context)) 7
  have resultBound := Nat.le_trans (widthHalts_operations_le context (prepare context).value.1
      (payloadSecond context (zeroIndex (prepare context).value.2 control).value).value)
    (Nat.add_le_add_right (Nat.add_le_add_left (Nat.mul_le_mul_left 8 (ordinary_le context)) _) 17)
  have bound := Nat.add_le_add_right (Nat.add_le_add (Nat.add_le_add
    (Nat.add_le_add (prepare_operations_le context) indexBound)
      (payloadSecond_operations_le context (zeroIndex (prepare context).value.2 control).value)) resultBound) 8
  simpa only [zeroNextHalts,
    show 232 = 84 + 127 + 13 + 8 by rfl, Nat.add_mul,
    show 95 = 34 + 7 + 29 + 17 + 8 by rfl,
    Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using bound

def restoreAddress (state : Nat) (symbol : Bool) : Result Nat :=
  let base := multiply 127 state
  let suffix := if symbol then 10 else 9
  let address := add suffix base.value
  ⟨address.value, base.operations + address.operations + 16⟩

theorem restoreAddress_value (state : Nat) (symbol : Bool) :
    (restoreAddress state symbol).value =
      DeterministicTapeThreeCounterCompiler.Layout.address state (.right (.restoreCheck symbol)) := by
  cases symbol <;> simp only [restoreAddress, Bool.false_eq_true, if_false, if_true,
    add_value, multiply_value, DeterministicTapeThreeCounterCompiler.Layout.address,
    DeterministicTapeThreeCounterCompiler.Layout.phaseCount,
    DeterministicTapeThreeCounterCompiler.Layout.encodePhase,
    DeterministicTapeThreeCounterCompiler.Layout.encodeRight, Nat.add_comm, Nat.mul_comm]

theorem restoreAddress_operations_le (state : Nat) (symbol : Bool) :
    (restoreAddress state symbol).operations ≤ 515 * state + 59 := by
  have suffixBound : (if symbol then 10 else 9 : Nat) ≤ 10 := by
    cases symbol <;> decide
  have bound := Nat.add_le_add_right (Nat.add_le_add_left
    (Nat.add_le_add_right (Nat.mul_le_mul_left 4 suffixBound) 1) (515 * state + 2)) 16
  simpa only [restoreAddress, multiply_operations, add_operations,
    show 59 = 2 + (4 * 10 + 1) + 16 by rfl, Nat.add_assoc] using bound

def ruleUndefined (context : Context) (state : Nat) (symbol : Bool) : Result Bool :=
  let address := restoreAddress state symbol
  let result := zeroNextHalts context address.value
  ⟨result.value, address.operations + result.operations + 4⟩

theorem ruleUndefined_value (context : Context) (state : Nat) (symbol : Bool) :
    (ruleUndefined context state symbol).value = CookSeedTerminalReadback.ruleUndefined context state symbol := by
  simp only [ruleUndefined, zeroNextHalts_value, restoreAddress_value,
    CookSeedTerminalReadback.ruleUndefined]

theorem ruleUndefined_operations_le (context : Context) (state : Nat) (symbol : Bool) :
    (ruleUndefined context state symbol).operations ≤
      85 * (contextSize context.frames + 1)^2 + 232 * contextSize context.frames + 515 * state + 158 := by
  have bound := Nat.add_le_add_right (Nat.add_le_add (restoreAddress_operations_le state symbol)
    (zeroNextHalts_operations_le context (restoreAddress state symbol).value)) 4
  simpa only [ruleUndefined, show 158 = 59 + 95 + 4 by rfl,
    Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using bound

def lookupOption {α : Type} : List α → Nat → Result (Option α)
  | [], _ => ⟨none, 2⟩
  | first :: _, 0 => ⟨some first, 4⟩
  | _ :: rest, .succ index =>
      let found := lookupOption rest index
      ⟨found.value, found.operations + 5⟩

theorem lookupOption_value {α : Type} (values : List α) (index : Nat) :
    (lookupOption values index).value = values[index]? := by
  induction values generalizing index with
  | nil => rfl
  | cons first rest ih => cases index with
    | zero => rfl
    | succ index => exact ih index

theorem lookupOption_operations_le {α : Type} (values : List α) (index : Nat) :
    (lookupOption values index).operations ≤ 5 * values.length + 4 := by
  induction values generalizing index with
  | nil => exact (by decide : 2 ≤ 4)
  | cons first rest ih => cases index with
    | zero => exact Nat.le_add_left _ _
    | succ index =>
        simpa only [lookupOption, List.length_cons, Nat.mul_add, Nat.mul_one,
          Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using Nat.add_le_add_right (ih index) 5

def terminalResult (context : Context) (state : Nat) : Option Bool → Result Bool
  | none => ⟨true, 2⟩
  | some symbol =>
      let result := ruleUndefined context state symbol
      ⟨result.value, result.operations + 4⟩

def terminalRow (context : Context) (row : DeterministicTape.Row) : Result Bool :=
  let scanned := lookupOption row.tape row.head
  let result := terminalResult context row.state scanned.value
  ⟨result.value, scanned.operations + result.operations + 6⟩

theorem terminalRow_value (context : Context) (row : DeterministicTape.Row) :
    (terminalRow context row).value = CookSeedTerminalReadback.terminalRow context row := by
  simp only [terminalRow, lookupOption_value, CookSeedTerminalReadback.terminalRow,
    PureSFormal.Research.ProtectedTrieMachine.scanned?]
  cases row.tape[row.head]? with
  | none => rfl
  | some symbol => exact ruleUndefined_value context row.state symbol

def terminalBudget (size state cells : Nat) : Nat :=
  85 * (size + 1)^2 + 232 * size + 515 * state + 5 * cells + 172

theorem terminalResult_operations_le (context : Context) (state : Nat) (symbol : Option Bool) :
    (terminalResult context state symbol).operations ≤
      85 * (contextSize context.frames + 1)^2 + 232 * contextSize context.frames + 515 * state + 162 := by
  cases symbol with
  | none => exact Nat.le_trans (by decide : 2 ≤ 162) (Nat.le_add_left _ _)
  | some symbol =>
      simpa only [terminalResult, show 162 = 158 + 4 by rfl, Nat.add_assoc] using
        Nat.add_le_add_right (ruleUndefined_operations_le context state symbol) 4

theorem terminalRow_operations_le (context : Context) (row : DeterministicTape.Row) :
    (terminalRow context row).operations ≤ terminalBudget (contextSize context.frames) row.state row.tape.length := by
  have bound := Nat.add_le_add_right (Nat.add_le_add (lookupOption_operations_le row.tape row.head)
    (terminalResult_operations_le context row.state (lookupOption row.tape row.head).value)) 6
  simpa only [terminalRow, terminalBudget, show 172 = 4 + 162 + 6 by rfl,
    Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using bound

theorem terminalBudget_mono {firstSize secondSize firstState secondState firstCells secondCells : Nat}
    (size : firstSize ≤ secondSize) (state : firstState ≤ secondState) (cells : firstCells ≤ secondCells) :
    terminalBudget firstSize firstState firstCells ≤ terminalBudget secondSize secondState secondCells := by
  exact Nat.add_le_add_right (Nat.add_le_add (Nat.add_le_add (Nat.add_le_add
    (Nat.mul_le_mul_left 85 (Nat.pow_le_pow_left (Nat.add_le_add_right size 1) 2))
    (Nat.mul_le_mul_left 232 size)) (Nat.mul_le_mul_left 515 state)) (Nat.mul_le_mul_left 5 cells)) 172

theorem terminal_certificate (context : Context) (row : DeterministicTape.Row) :
    (terminalRow context row).value = CookSeedTerminalReadback.terminalRow context row ∧
    (terminalRow context row).operations ≤ terminalBudget (contextSize context.frames) row.state row.tape.length :=
  ⟨terminalRow_value context row, terminalRow_operations_le context row⟩

end PureSFormal.Computation.CookSeedTerminalPrimitive
