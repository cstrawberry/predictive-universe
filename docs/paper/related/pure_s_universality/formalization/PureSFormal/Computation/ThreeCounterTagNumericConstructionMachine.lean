import PureSFormal.Computation.ThreeCounterTagTypedConstructionMachine

/-!
# Primitive numeric alphabet construction for three-counter tag tables

The ten indexed families form fixed compiler code. Unary comparisons,
offset multiplication and subtraction are measured explicitly; constructors
share immutable payload references when no copying is needed.
-/

namespace PureSFormal.Computation.ThreeCounterTagNumericConstructionMachine

open PureSFormal.PureS.ParserPrimitiveMachine (Result)
open PureSFormal.PureS
open CounterMachineTag (Symbol)

def less : Nat → Nat → Result Bool
  | 0, 0 => ⟨false, 2⟩
  | 0, .succ _ => ⟨true, 2⟩
  | .succ _, 0 => ⟨false, 2⟩
  | .succ left, .succ right =>
      let rest := less left right
      ⟨rest.value, 4 + rest.operations⟩

theorem less_value (left right : Nat) :
    (less left right).value = decide (left < right) := by
  induction left generalizing right with
  | zero =>
      cases right with
      | zero => rfl
      | succ right => simp only [less, Nat.zero_lt_succ, decide_true]
  | succ left ih =>
      cases right with
      | zero => rfl
      | succ right => simpa only [less, Nat.succ_lt_succ_iff] using ih right

theorem less_operations_le (left right : Nat) :
    (less left right).operations ≤ 4 * right + 2 := by
  induction right generalizing left with
  | zero => cases left <;> exact Nat.le_refl _
  | succ right ih =>
      cases left with
      | zero => exact Nat.le_add_left _ _
      | succ left =>
          have bound := Nat.add_le_add_left (ih left) 4
          apply Nat.le_trans bound
          apply Nat.le_of_eq
          rw [Nat.mul_succ]
          simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

inductive Family where
  | head | filler | first | second | selectPositive | selectZero
  | firstPositive | firstZero | secondPositive | secondZero

def Family.block : Family → Nat
  | .head => 0 | .filler => 1 | .first => 2 | .second => 3
  | .selectPositive => 4 | .selectZero => 5 | .firstPositive => 6
  | .firstZero => 7 | .secondPositive => 8 | .secondZero => 9

def Family.symbol : Family → Nat → Symbol
  | .head => .head | .filler => .filler | .first => .first | .second => .second
  | .selectPositive => .selectPositive | .selectZero => .selectZero
  | .firstPositive => .firstPositive | .firstZero => .firstZero
  | .secondPositive => .secondPositive | .secondZero => .secondZero

theorem Family.block_le_nine (family : Family) : family.block ≤ 9 := by
  cases family <;> decide

theorem Family.symbol_payload (family : Family) (code : Nat) :
    ThreeCounterTagTypedConstructionMachine.symbolPayload (family.symbol code) = code := by
  cases family <;> rfl

def families : List Family :=
  [.head, .filler, .first, .second, .selectPositive, .selectZero,
    .firstPositive, .firstZero, .secondPositive, .secondZero]

def encodeBlock (width block code : Nat) : Result Nat :=
  let offset := ParserNatPrimitive.multiply block width
  let output := ParserNatPrimitive.add offset.value code
  ⟨output.value, 2 + offset.operations + output.operations⟩

theorem encodeBlock_value (width block code : Nat) :
    (encodeBlock width block code).value = block * width + code := by
  simp only [encodeBlock, ParserNatPrimitive.add_value, ParserNatPrimitive.multiply_value]

theorem encodeBlock_operations_le (width block code : Nat) (bounded : block ≤ 10) :
    (encodeBlock width block code).operations ≤ 87 * width + 5 := by
  have offsetBound : (ParserNatPrimitive.multiply block width).operations ≤ 47 * width + 2 := by
    rw [ParserNatPrimitive.multiply_operations]
    exact Nat.add_le_add_right (Nat.mul_le_mul_right width
      (Nat.add_le_add_right (Nat.mul_le_mul_left 4 bounded) 7)) 2
  have addedBound : (ParserNatPrimitive.add (ParserNatPrimitive.multiply block width).value code).operations ≤ 40 * width + 1 := by
    rw [ParserNatPrimitive.add_operations, ParserNatPrimitive.multiply_value, ← Nat.mul_assoc]
    exact Nat.add_le_add_right (Nat.mul_le_mul_right width (Nat.mul_le_mul_left 4 bounded)) 1
  have combined := Nat.add_le_add (Nat.add_le_add_left offsetBound 2) addedBound
  apply Nat.le_trans combined
  apply Nat.le_of_eq
  change 2 + (47 * width + 2) + (40 * width + 1) = (47 + 40) * width + (2 + 2 + 1)
  simp only [Nat.add_mul, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

def encodeSymbol (width : Nat) : Symbol → Result Nat
  | .head code => encodeBlock width 0 code
  | .filler code => encodeBlock width 1 code
  | .first code => encodeBlock width 2 code
  | .second code => encodeBlock width 3 code
  | .selectPositive code => encodeBlock width 4 code
  | .selectZero code => encodeBlock width 5 code
  | .firstPositive code => encodeBlock width 6 code
  | .firstZero code => encodeBlock width 7 code
  | .secondPositive code => encodeBlock width 8 code
  | .secondZero code => encodeBlock width 9 code
  | .sacrificial => encodeBlock width 10 0
  | .sink => encodeBlock width 10 1
  | .halt => encodeBlock width 10 2

theorem encodeSymbol_value (program : ThreeCounter.Program) (symbol : Symbol) :
    (encodeSymbol (3 * program.length) symbol).value = ThreeCounterTag.Numeric.encodeSymbol program symbol := by
  cases symbol <;> simp only [encodeSymbol, encodeBlock_value, ThreeCounterTag.Numeric.encodeSymbol,
    CounterMachineTag.Numeric.encodeSymbol, ThreeCounterTag.Numeric.enumerationProgram_length,
    Nat.zero_mul, Nat.zero_add, Nat.one_mul, Nat.add_zero]

theorem encodeSymbol_operations_le (width : Nat) (symbol : Symbol) :
    (encodeSymbol width symbol).operations ≤ 87 * width + 5 := by
  cases symbol <;> exact encodeBlock_operations_le _ _ _ (by decide)

def encodeWord (width : Nat) : List Symbol → Result (List Nat)
  | [] => ⟨[], 2⟩
  | symbol :: rest =>
      let code := encodeSymbol width symbol
      let following := encodeWord width rest
      ⟨code.value :: following.value, 4 + code.operations + following.operations⟩

theorem encodeWord_value (program : ThreeCounter.Program) (word : List Symbol) :
    (encodeWord (3 * program.length) word).value = word.map (ThreeCounterTag.Numeric.encodeSymbol program) := by
  induction word with
  | nil => rfl
  | cons symbol rest ih => simp only [encodeWord, encodeSymbol_value, ih, List.map_cons]

theorem encodeWord_operations_le (width : Nat) (word : List Symbol) :
    (encodeWord width word).operations ≤ (87 * width + 9) * word.length + 2 := by
  induction word with
  | nil => exact Nat.le_refl _
  | cons symbol rest ih =>
      have combined := Nat.add_le_add (Nat.add_le_add_left (encodeSymbol_operations_le width symbol) 4) ih
      apply Nat.le_trans combined
      apply Nat.le_of_eq
      rw [List.length_cons, Nat.mul_succ]
      change 4 + (87 * width + 5) + ((87 * width + 9) * rest.length + 2) =
        (87 * width + 9) * rest.length + (87 * width + (4 + 5)) + 2
      simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

def finish (width label : Nat) : Result Symbol :=
  let boundary := ParserNatPrimitive.multiply 10 width
  let compared := ParserTerminalPrimitive.equalIndex boundary.value label
  ⟨if compared.value then .sacrificial else .sink, 1 + boundary.operations + compared.operations⟩

theorem finish_value (width label : Nat) :
    (finish width label).value = if label = 10 * width then .sacrificial else .sink := by
  change (if (ParserTerminalPrimitive.equalIndex (ParserNatPrimitive.multiply 10 width).value label).value
    then Symbol.sacrificial else Symbol.sink) = _
  rw [ParserNatPrimitive.multiply_value]
  by_cases equal : label = 10 * width
  · rw [(ParserTerminalPrimitive.equalIndex_value _ _).mpr equal.symm, if_pos equal]
    rfl
  · have rejected : (ParserTerminalPrimitive.equalIndex (10 * width) label).value = false := by
      cases answer : (ParserTerminalPrimitive.equalIndex (10 * width) label).value with
      | false => rfl
      | true => exact False.elim (equal ((ParserTerminalPrimitive.equalIndex_value _ _).mp answer).symm)
    rw [rejected, if_neg equal]
    rfl

theorem finish_operations_le (width label : Nat) :
    (finish width label).operations ≤ 87 * width + 5 := by
  have comparisonBound := ParserTerminalPrimitive.equalIndex_operations_le
    (ParserNatPrimitive.multiply 10 width).value label
  rw [ParserNatPrimitive.multiply_value, ← Nat.mul_assoc] at comparisonBound
  simp only [finish, ParserNatPrimitive.multiply_operations, ParserNatPrimitive.multiply_value]
  apply Nat.le_trans (Nat.add_le_add_left comparisonBound (1 + ((4 * 10 + 7) * width + 2)))
  apply Nat.le_of_eq
  change 1 + (47 * width + 2) + (40 * width + 2) = (47 + 40) * width + (1 + 2 + 2)
  simp only [Nat.add_mul, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

def decodeBlock (width label : Nat) (family : Family) (fallback : Unit → Result Symbol) : Result Symbol :=
  let block := family.block
  let boundary := ParserNatPrimitive.multiply (block + 1) width
  let tested := less label boundary.value
  if tested.value then
    let offset := ParserNatPrimitive.multiply block width
    let payload := ParserNatPrimitive.subtract label offset.value
    ⟨family.symbol payload.value, 5 + boundary.operations + tested.operations + offset.operations + payload.operations⟩
  else
    let output := fallback ()
    ⟨output.value, 3 + boundary.operations + tested.operations + output.operations⟩

theorem decodeBlock_value (width label : Nat) (family : Family) (fallback : Unit → Result Symbol) :
    (decodeBlock width label family fallback).value =
      if label < (family.block + 1) * width then family.symbol (label - family.block * width)
      else (fallback ()).value := by
  simp only [decodeBlock, less_value, ParserNatPrimitive.multiply_value, decide_eq_true_eq]
  split <;> simp only [ParserNatPrimitive.subtract_value, ParserNatPrimitive.multiply_value]

def blockBudget (width : Nat) : Nat := 180 * width + 20

theorem decodeBlock_operations_le (width label : Nat) (family : Family)
    (fallback : Unit → Result Symbol) (remaining : Nat) (bounded : (fallback ()).operations ≤ remaining) :
    (decodeBlock width label family fallback).operations ≤ blockBudget width + remaining := by
  have blockBound := Family.block_le_nine family
  have nextBound : family.block + 1 ≤ 10 := Nat.add_le_add_right blockBound 1
  have boundaryBound : (ParserNatPrimitive.multiply (family.block + 1) width).operations ≤ 47 * width + 2 := by
    rw [ParserNatPrimitive.multiply_operations]
    exact Nat.add_le_add_right (Nat.mul_le_mul_right width
      (Nat.add_le_add_right (Nat.mul_le_mul_left 4 nextBound) 7)) 2
  have testBound : (less label (ParserNatPrimitive.multiply (family.block + 1) width).value).operations ≤ 40 * width + 2 := by
    apply Nat.le_trans (less_operations_le _ _)
    rw [ParserNatPrimitive.multiply_value, ← Nat.mul_assoc]
    exact Nat.add_le_add_right (Nat.mul_le_mul_right width (Nat.mul_le_mul_left 4 nextBound)) 2
  have offsetBound : (ParserNatPrimitive.multiply family.block width).operations ≤ 43 * width + 2 := by
    rw [ParserNatPrimitive.multiply_operations]
    exact Nat.add_le_add_right (Nat.mul_le_mul_right width
      (Nat.add_le_add_right (Nat.mul_le_mul_left 4 blockBound) 7)) 2
  have payloadBound : (ParserNatPrimitive.subtract label (ParserNatPrimitive.multiply family.block width).value).operations ≤ 36 * width + 2 := by
    apply Nat.le_trans (ParserNatPrimitive.subtract_operations_le _ _)
    rw [ParserNatPrimitive.multiply_value, ← Nat.mul_assoc]
    exact Nat.add_le_add_right (Nat.mul_le_mul_right width (Nat.mul_le_mul_left 4 blockBound)) 2
  simp only [decodeBlock]
  split
  · have combined := Nat.add_le_add (Nat.add_le_add (Nat.add_le_add
      (Nat.add_le_add_left boundaryBound 5) testBound) offsetBound) payloadBound
    apply Nat.le_trans combined
    calc
      5 + (47 * width + 2) + (40 * width + 2) + (43 * width + 2) + (36 * width + 2) =
        (47 + 40 + 43 + 36) * width + (5 + 2 + 2 + 2 + 2) := by
          simp only [Nat.add_mul, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
      _ ≤ blockBudget width := Nat.add_le_add
        (Nat.mul_le_mul_right width (by decide : 47 + 40 + 43 + 36 ≤ 180)) (by decide : 5 + 2 + 2 + 2 + 2 ≤ 20)
      _ ≤ _ := Nat.le_add_right _ _
  · have combined := Nat.add_le_add (Nat.add_le_add (Nat.add_le_add_left boundaryBound 3) testBound) bounded
    apply Nat.le_trans combined
    apply Nat.add_le_add_right
    calc
      3 + (47 * width + 2) + (40 * width + 2) =
        (47 + 40) * width + (3 + 2 + 2) := by
          simp only [Nat.add_mul, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
      _ ≤ blockBudget width := Nat.add_le_add
        (Nat.mul_le_mul_right width (by decide : 47 + 40 ≤ 180)) (by decide : 3 + 2 + 2 ≤ 20)


def decodeLayers (width label : Nat) : List Family → Result Symbol
  | [] =>
      let output := finish width label
      ⟨output.value, 1 + output.operations⟩
  | family :: rest =>
      let output := decodeBlock width label family (fun _ => decodeLayers width label rest)
      ⟨output.value, 3 + output.operations⟩

def decodeFormula (width label : Nat) : List Family → Symbol
  | [] => if label = 10 * width then .sacrificial else .sink
  | family :: rest =>
      if label < (family.block + 1) * width then family.symbol (label - family.block * width)
      else decodeFormula width label rest

theorem decodeLayers_value (width label : Nat) (layers : List Family) :
    (decodeLayers width label layers).value = decodeFormula width label layers := by
  induction layers with
  | nil => exact finish_value _ _
  | cons family rest ih =>
      simp only [decodeLayers, decodeBlock_value, ih, decodeFormula]

theorem decodeLayers_operations_le (width label : Nat) (layers : List Family) :
    (decodeLayers width label layers).operations ≤
      (blockBudget width + 3) * layers.length + (87 * width + 5) + 1 := by
  induction layers with
  | nil =>
      have bound := Nat.add_le_add_left (finish_operations_le width label) 1
      apply Nat.le_trans bound
      apply Nat.le_of_eq
      simp only [List.length_nil, Nat.mul_zero, Nat.zero_add, Nat.add_comm]
  | cons family rest ih =>
      have bound := Nat.add_le_add_left (decodeBlock_operations_le width label family
        (fun _ => decodeLayers width label rest) _ ih) 3
      apply Nat.le_trans bound
      apply Nat.le_of_eq
      rw [List.length_cons, Nat.mul_succ]
      simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

def decodeSymbol (width label : Nat) : Result Symbol := decodeLayers width label families

theorem decodeSymbol_value (program : ThreeCounter.Program) (label : Nat) :
    (decodeSymbol (3 * program.length) label).value = ThreeCounterTag.Numeric.decodeSymbol program label := by
  rw [decodeSymbol, decodeLayers_value]
  simp only [decodeFormula, families, Family.block, Family.symbol,
    ThreeCounterTag.Numeric.decodeSymbol, CounterMachineTag.Numeric.decodeSymbol,
    ThreeCounterTag.Numeric.enumerationProgram_length, Nat.zero_mul, Nat.zero_add,
    Nat.one_mul, Nat.sub_zero]
  rfl

def decodeBudget (width : Nat) : Nat :=
  (blockBudget width + 3) * 10 + (87 * width + 5) + 1

theorem decodeSymbol_operations_le (width label : Nat) :
    (decodeSymbol width label).operations ≤ decodeBudget width :=
  decodeLayers_operations_le _ _ _

theorem decodeFormula_payload_le (width label : Nat) (layers : List Family) :
    ThreeCounterTagTypedConstructionMachine.symbolPayload (decodeFormula width label layers) ≤ label := by
  induction layers with
  | nil =>
      simp only [decodeFormula]
      split <;> exact Nat.zero_le _
  | cons family rest ih =>
      simp only [decodeFormula]
      split
      · rw [Family.symbol_payload]
        exact Nat.sub_le _ _
      · exact ih

theorem decodeSymbol_payload_le (width label : Nat) :
    ThreeCounterTagTypedConstructionMachine.symbolPayload (decodeSymbol width label).value ≤ label := by
  rw [decodeSymbol, decodeLayers_value]
  exact decodeFormula_payload_le _ _ _

theorem encodeWord_length (width : Nat) (word : List Symbol) :
    (encodeWord width word).value.length = word.length := by
  induction word with
  | nil => rfl
  | cons symbol rest ih => simp only [encodeWord, List.length_cons, ih]

def numericRhs (program : ThreeCounter.Program) (width label : Nat) : Result (List Nat) :=
  let symbol := decodeSymbol width label
  let produced := ThreeCounterTagTypedConstructionMachine.production program symbol.value
  let output := encodeWord width produced.value
  ⟨output.value, symbol.operations + produced.operations + output.operations⟩

theorem numericRhs_value (program : ThreeCounter.Program) (label : Nat) :
    (numericRhs program (3 * program.length) label).value =
      ThreeCounterTag.Numeric.numericRhs program (ThreeCounterTag.Numeric.decodeSymbol program label) := by
  rw [numericRhs, encodeWord_value, ThreeCounterTagTypedConstructionMachine.production_value, decodeSymbol_value]
  rfl

def rowBudget (program : ThreeCounter.Program) (width label : Nat) : Nat :=
  decodeBudget width +
    (10 * program.length + 19 * ThreeCounterTagTypedConstructionMachine.targetCells program + 4 * label + 142) +
    ((87 * width + 9) * 8 + 2)

theorem numericRhs_operations_le (program : ThreeCounter.Program) (width label : Nat) :
    (numericRhs program width label).operations ≤ rowBudget program width label := by
  have productionBound := ThreeCounterTagTypedConstructionMachine.production_operations_le program
    (decodeSymbol width label).value
  have payloadBound := decodeSymbol_payload_le width label
  have productionBudget := Nat.le_trans productionBound
    (Nat.add_le_add_right (Nat.add_le_add_left (Nat.mul_le_mul_left 4 payloadBound) _) _)
  have codeBound := encodeWord_operations_le width
    (ThreeCounterTagTypedConstructionMachine.production program (decodeSymbol width label).value).value
  have rowLength := ThreeCounterTagTypedConstructionMachine.production_length_le_eight program
    (decodeSymbol width label).value
  have codeBudget := Nat.le_trans codeBound
    (Nat.add_le_add_right (Nat.mul_le_mul_left _ rowLength) 2)
  exact Nat.add_le_add (Nat.add_le_add (decodeSymbol_operations_le width label) productionBudget) codeBudget

theorem numericRhs_length_le_eight (program : ThreeCounter.Program) (width label : Nat) :
    (numericRhs program width label).value.length ≤ 8 := by
  rw [numericRhs, encodeWord_length]
  exact ThreeCounterTagTypedConstructionMachine.production_length_le_eight _ _

theorem rowBudget_mono (program : ThreeCounter.Program) (width first second : Nat) (bounded : first ≤ second) :
    rowBudget program width first ≤ rowBudget program width second :=
  Nat.add_le_add_right (Nat.add_le_add_left
    (Nat.add_le_add_right (Nat.add_le_add_left (Nat.mul_le_mul_left 4 bounded) _) _) _) _

def buildRows (program : ThreeCounter.Program) (width : Nat) : Nat → Result (List (List Nat))
  | 0 => ⟨[], 2⟩
  | .succ count =>
      let previous := buildRows program width count
      let row := numericRhs program width count
      let output := RogozhinProgramConstructionMachine.copy previous.value [row.value]
      ⟨output.value, 4 + previous.operations + row.operations + output.operations⟩

theorem buildRows_value (program : ThreeCounter.Program) (count : Nat) :
    (buildRows program (3 * program.length) count).value =
      (List.range count).map (fun label => ThreeCounterTag.Numeric.numericRhs program
        (ThreeCounterTag.Numeric.decodeSymbol program label)) := by
  induction count with
  | zero => rfl
  | succ count ih =>
      simp only [buildRows, RogozhinProgramConstructionMachine.copy_value, ih, numericRhs_value,
        List.range_succ, List.map_append, List.map_cons, List.map_nil]

theorem buildRows_length (program : ThreeCounter.Program) (width count : Nat) :
    (buildRows program width count).value.length = count := by
  induction count with
  | zero => rfl
  | succ count ih =>
      simp only [buildRows, RogozhinProgramConstructionMachine.copy_value, List.length_append,
        List.length_cons, List.length_nil, ih]

theorem buildRows_operations_le (program : ThreeCounter.Program) (width count limit : Nat)
    (rowBound : ∀ label, label < count → (numericRhs program width label).operations ≤ limit) :
    (buildRows program width count).operations ≤ (limit + 5 + 4 * count) * count + 2 := by
  induction count with
  | zero => exact Nat.le_refl _
  | succ count ih =>
      have previousBound := ih (fun label bounded =>
        rowBound label (Nat.lt_trans bounded (Nat.lt_succ_self count)))
      have currentBound := rowBound count (Nat.lt_succ_self count)
      have combined := Nat.add_le_add_right
        (Nat.add_le_add (Nat.add_le_add_left previousBound 4) currentBound) (4 * count + 1)
      simp only [buildRows, RogozhinProgramConstructionMachine.copy_operations, buildRows_length]
      apply Nat.le_trans combined
      calc
        4 + ((limit + 5 + 4 * count) * count + 2) + limit + (4 * count + 1) =
          (limit + 5 + 4 * count) * (count + 1) + 2 := by
            rw [Nat.mul_succ]
            change 4 + ((limit + 5 + 4 * count) * count + 2) + limit + (4 * count + 1) =
              (limit + 5 + 4 * count) * count + (limit + (4 + 1) + 4 * count) + 2
            simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
        _ ≤ _ := Nat.add_le_add_right (Nat.mul_le_mul_right (count + 1)
          (Nat.add_le_add_left (Nat.mul_le_mul_left 4 (Nat.le_succ count)) _)) 2


inductive EncodingExecution (width : Nat) : List Symbol → List Nat → Nat → Prop where
  | nil : EncodingExecution width [] [] 2
  | cons {symbol : Symbol} {word : List Symbol} {output : List Nat} {operations : Nat}
      (following : EncodingExecution width word output operations) :
      EncodingExecution width (symbol :: word) ((encodeSymbol width symbol).value :: output)
        (4 + (encodeSymbol width symbol).operations + operations)

theorem encodeWord_execution (width : Nat) (word : List Symbol) :
    EncodingExecution width word (encodeWord width word).value (encodeWord width word).operations := by
  induction word with
  | nil => exact .nil
  | cons symbol rest ih => exact .cons ih

inductive DecodeLayersExecution (width label : Nat) : List Family → Symbol → Nat → Prop where
  | nil : DecodeLayersExecution width label [] (finish width label).value (1 + (finish width label).operations)
  | found {family : Family} {rest : List Family}
      (accepted : (less label (ParserNatPrimitive.multiply (family.block + 1) width).value).value = true) :
      DecodeLayersExecution width label (family :: rest)
        (family.symbol (ParserNatPrimitive.subtract label (ParserNatPrimitive.multiply family.block width).value).value)
        (3 + (5 + (ParserNatPrimitive.multiply (family.block + 1) width).operations +
          (less label (ParserNatPrimitive.multiply (family.block + 1) width).value).operations +
          (ParserNatPrimitive.multiply family.block width).operations +
          (ParserNatPrimitive.subtract label (ParserNatPrimitive.multiply family.block width).value).operations))
  | continue {family : Family} {rest : List Family} {output : Symbol} {operations : Nat}
      (rejected : (less label (ParserNatPrimitive.multiply (family.block + 1) width).value).value = false)
      (following : DecodeLayersExecution width label rest output operations) :
      DecodeLayersExecution width label (family :: rest) output
        (3 + (3 + (ParserNatPrimitive.multiply (family.block + 1) width).operations +
          (less label (ParserNatPrimitive.multiply (family.block + 1) width).value).operations + operations))

theorem decodeLayers_execution (width label : Nat) (layers : List Family) :
    DecodeLayersExecution width label layers (decodeLayers width label layers).value
      (decodeLayers width label layers).operations := by
  induction layers with
  | nil => exact .nil
  | cons family rest ih =>
      cases answer : (less label (ParserNatPrimitive.multiply (family.block + 1) width).value).value with
      | false =>
          simpa only [decodeLayers, decodeBlock, answer, Bool.false_eq_true, ↓reduceIte] using
            DecodeLayersExecution.continue answer ih
      | true =>
          simpa only [decodeLayers, decodeBlock, answer, ↓reduceIte] using
            (DecodeLayersExecution.found (rest := rest) answer)

theorem decodeSymbol_execution (width label : Nat) :
    DecodeLayersExecution width label families (decodeSymbol width label).value
      (decodeSymbol width label).operations := decodeLayers_execution _ _ _

inductive RowExecution (program : ThreeCounter.Program) (width label : Nat) : List Nat → Nat → Prop where
  | construct {symbol : Symbol} {produced : List Symbol} {output : List Nat}
      {decodeOperations productionOperations outputOperations : Nat}
      (symbolRun : DecodeLayersExecution width label families symbol decodeOperations)
      (productionRun : ThreeCounterTagTypedConstructionMachine.ProductionExecution program symbol produced productionOperations)
      (outputRun : EncodingExecution width produced output outputOperations) :
      RowExecution program width label output (decodeOperations + productionOperations + outputOperations)

theorem numericRhs_execution (program : ThreeCounter.Program) (width label : Nat) :
    RowExecution program width label (numericRhs program width label).value
      (numericRhs program width label).operations :=
  .construct (decodeSymbol_execution _ _) (ThreeCounterTagTypedConstructionMachine.production_execution _ _)
    (encodeWord_execution _ _)

inductive RowsExecution (program : ThreeCounter.Program) (width : Nat) : Nat → List (List Nat) → Nat → Prop where
  | zero : RowsExecution program width 0 [] 2
  | succ {count previousOperations rowOperations copyOperations : Nat}
      {previous output : List (List Nat)} {row : List Nat}
      (previousRun : RowsExecution program width count previous previousOperations)
      (rowRun : RowExecution program width count row rowOperations)
      (copyRun : RogozhinProgramConstructionMachine.CopyExecution previous [row] output copyOperations) :
      RowsExecution program width (count + 1) output (4 + previousOperations + rowOperations + copyOperations)

theorem buildRows_execution (program : ThreeCounter.Program) (width count : Nat) :
    RowsExecution program width count (buildRows program width count).value
      (buildRows program width count).operations := by
  induction count with
  | zero => exact .zero
  | succ count ih => exact .succ ih (numericRhs_execution _ _ _) (RogozhinProgramConstructionMachine.copy_execution _ _)

end PureSFormal.Computation.ThreeCounterTagNumericConstructionMachine
