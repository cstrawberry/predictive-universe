import PureSFormal.Computation.DeletionTwoT2Computability
import PureSFormal.Computation.DeterministicTapeCook

/-!
# Closed code for the literal three-counter to tag compiler

Counter instructions and states retain their existing natural-list records.
The target production table and word use the bijective tag-job numbering.
The numeric construction computes the typed compiler's actual enumeration,
production rows, exponential register blocks and pair-padding normalization.
-/

namespace PureSFormal.Computation.ThreeCounterTagComputability

open PureSFormal.PureS
open PrimitiveRecursiveListCode
open ThreeCounterTag
open DeterministicTapeThreeCounterComputability

abbrev counterCode := DeterministicTapeThreeCounterComputability.programCode
abbrev stateCode := DeterministicTapeInitialComputability.stateCode

def instructionFields : ThreeCounter.Instruction → List Nat
  | .halt => []
  | .increment register next => [1, registerCode register, next]
  | .decrementJump register positive zeroNext => [2, registerCode register, positive, zeroNext]

theorem instructionCode_eq_fields (instruction : ThreeCounter.Instruction) :
    instructionCode instruction = encode (instructionFields instruction) := by
  cases instruction <;> rfl

theorem instruction_getD_code (program : ThreeCounter.Program) (control : Nat) :
    (program.map instructionCode).getD control 0 = instructionCode (ThreeCounter.instructionAt program control) := by
  induction program generalizing control with
  | nil => rfl
  | cons instruction rest ih =>
      cases control with
      | zero => rfl
      | succ control => exact ih control

theorem payloadControl_eq_div : ∀ number, payloadControl number = number / 3
  | 0 => rfl
  | 1 => rfl
  | 2 => rfl
  | number + 3 => by
      change payloadControl number + 1 = (number + 3) / 3
      rw [payloadControl_eq_div number, Nat.add_div_right]
      decide

theorem payloadRegister_code : ∀ number, registerCode (payloadRegister number) = number % 3
  | 0 => rfl
  | 1 => rfl
  | 2 => rfl
  | number + 3 => by
      change registerCode (payloadRegister number) = (number + 3) % 3
      rw [payloadRegister_code number, Nat.add_mod_right]

theorem registerCode_eq_id (register : ThreeCounter.Register) : registerCode register = registerId register := by
  cases register <;> rfl

namespace Program

open PrimitiveRecursiveListCode.Program
open DeterministicTapeThreeCounterComputability.Program

def sub (first second : PRCode 2) : PRCode 2 :=
  PRCode.composeBinary PRCode.truncatedSubtraction first second
def eq (first second : PRCode 2) : PRCode 2 := PRCode.composeBinary PRCode.equal first second
def power (base exponent : PRCode 2) : PRCode 2 := PRCode.composeBinary PRCode.power base exponent
def appendCode (first second : PRCode 2) : PRCode 2 := PRCode.composeBinary append first second
def repeatCode (value count : PRCode 2) : PRCode 2 := PRCode.composeBinary replicate value count
def withControl (entry control : PRCode 2) : PRCode 2 :=
  PRCode.composeBinary entry (PRCode.projection 0) control

@[simp] theorem eval_sub (left right : PRCode 2) (first second : Nat) :
    PRCode.eval₂ (sub left right) first second = PRCode.eval₂ left first second - PRCode.eval₂ right first second := by
  rw [sub, eval₂_composeBinary, PRCode.eval₂_truncatedSubtraction]
@[simp] theorem eval_eq (left right : PRCode 2) (first second : Nat) :
    PRCode.eval₂ (eq left right) first second =
      if PRCode.eval₂ left first second = PRCode.eval₂ right first second then 1 else 0 := by
  rw [eq, eval₂_composeBinary, PRCode.eval₂_equal]
@[simp] theorem eval_power (base exponent : PRCode 2) (first second : Nat) :
    PRCode.eval₂ (power base exponent) first second = PRCode.eval₂ base first second ^ PRCode.eval₂ exponent first second := by
  rw [power, eval₂_composeBinary, PRCode.eval₂_power]
@[simp] theorem eval_appendCode (left right : PRCode 2) (first second : Nat) :
    PRCode.eval₂ (appendCode left right) first second =
      encode (decode (PRCode.eval₂ left first second) ++ decode (PRCode.eval₂ right first second)) := by
  rw [appendCode, eval₂_composeBinary, eval_append]
@[simp] theorem eval_repeatCode (value count : PRCode 2) (first second : Nat) :
    PRCode.eval₂ (repeatCode value count) first second =
      encode (List.replicate (PRCode.eval₂ count first second) (PRCode.eval₂ value first second)) := by
  rw [repeatCode, eval₂_composeBinary, eval_replicate]
@[simp] theorem eval_withControl (entry control : PRCode 2) (first second : Nat) :
    PRCode.eval₂ (withControl entry control) first second = PRCode.eval₂ entry first (PRCode.eval₂ control first second) := by
  rw [withControl, eval₂_composeBinary, eval₂_projection_zero]

def instruction : PRCode 2 := lookup
def field (index : Nat) : PRCode 2 := PRCode.composeBinary lookup instruction (lit index)
def tag : PRCode 2 := field 0
def live : PRCode 2 := ifZero tag (lit 0) (lit 1)
def testedEq (register : ThreeCounter.Register) : PRCode 2 :=
  ifZero tag (lit 0) (eq (field 1) (lit (registerCode register)))
def scaleCode (register : ThreeCounter.Register) : PRCode 2 :=
  ifZero (testedEq register) (lit 2) (lit 1)
def branch (positive : Bool) : PRCode 2 :=
  ifZero tag (lit 0) (ifZero (pred tag) (field 2) (field (if positive then 2 else 3)))
def width : PRCode 2 := mul (lit 3) (PRCode.composeUnary length (PRCode.projection 0))
def sink : PRCode 2 := add (mul (lit 10) width) (lit 1)
def haltSymbol : PRCode 2 := add (mul (lit 10) width) (lit 2)
def symbol (block : Nat) : PRCode 2 := add (mul (lit block) width) (PRCode.projection 1)

theorem eval_instruction (program : ThreeCounter.Program) (control : Nat) :
    PRCode.eval₂ instruction (counterCode program) control = instructionCode (ThreeCounter.instructionAt program control) := by
  rw [instruction, eval_lookup, counterCode, programCode, decode_encode, instruction_getD_code]

theorem eval_field (index : Nat) (program : ThreeCounter.Program) (control : Nat) :
    PRCode.eval₂ (field index) (counterCode program) control =
      (instructionFields (ThreeCounter.instructionAt program control)).getD index 0 := by
  rw [field, eval₂_composeBinary, eval_instruction, eval_lit, eval_lookup,
    instructionCode_eq_fields, decode_encode]

theorem eval_live (program : ThreeCounter.Program) (control : Nat) :
    PRCode.eval₂ live (counterCode program) control =
      DeterministicTapeCode.boolCode (instructionLive (ThreeCounter.instructionAt program control)) := by
  rw [live, eval_ifZero, tag, eval_field]
  cases ThreeCounter.instructionAt program control <;>
    simp only [instructionFields, List.getD_cons_zero, List.getD_nil,
      Nat.one_ne_zero, Nat.succ_ne_zero, ↓reduceIte, eval_lit,
      instructionLive, DeterministicTapeCode.boolCode]

theorem eval_testedEq (register : ThreeCounter.Register) (program : ThreeCounter.Program) (control : Nat) :
    PRCode.eval₂ (testedEq register) (counterCode program) control =
      if instructionTested? (ThreeCounter.instructionAt program control) = some register then 1 else 0 := by
  rw [testedEq, eval_ifZero, tag, eval_field, eval_eq, eval_field, eval_lit]
  cases ThreeCounter.instructionAt program control with
  | halt => cases register <;> rfl
  | increment selected next => cases selected <;> cases register <;> rfl
  | decrementJump selected positive zeroNext => cases selected <;> cases register <;> rfl

theorem eval_scaleCode (register : ThreeCounter.Register) (program : ThreeCounter.Program) (control : Nat) :
    PRCode.eval₂ (scaleCode register) (counterCode program) control = scale (ThreeCounter.instructionAt program control) register := by
  rw [scaleCode, eval_ifZero, eval_testedEq, eval_lit, eval_lit]
  by_cases tested : instructionTested? (ThreeCounter.instructionAt program control) = some register <;>
    simp only [tested, ↓reduceIte, Nat.one_ne_zero, scale]

theorem eval_branch (positive : Bool) (program : ThreeCounter.Program) (control : Nat) :
    PRCode.eval₂ (branch positive) (counterCode program) control = branchNext (ThreeCounter.instructionAt program control) positive := by
  simp only [branch, eval_ifZero, tag, eval_field, eval_pred, eval_lit]
  cases ThreeCounter.instructionAt program control <;> cases positive <;> rfl

theorem eval_width (program : ThreeCounter.Program) (second : Nat) :
    PRCode.eval₂ width (counterCode program) second = (Numeric.enumerationProgram program).length := by
  rw [width, eval_mul, eval_lit, eval₂_composeUnary, eval₂_projection_zero,
    eval_length, counterCode, programCode, decode_encode, List.length_map]
  exact (Numeric.enumerationProgram_length program).symm

theorem eval_sink (program : ThreeCounter.Program) (second : Nat) :
    PRCode.eval₂ sink (counterCode program) second = Numeric.encodeSymbol program .sink := by
  rw [sink, eval_add, eval_mul, eval_lit, eval_width, eval_lit]
  rfl

theorem eval_haltSymbol (program : ThreeCounter.Program) (second : Nat) :
    PRCode.eval₂ haltSymbol (counterCode program) second = Numeric.encodeSymbol program .halt := by
  rw [haltSymbol, eval_add, eval_mul, eval_lit, eval_width, eval_lit]
  rfl

theorem eval_symbol (block : Nat) (program : ThreeCounter.Program) (control : Nat) :
    PRCode.eval₂ (symbol block) (counterCode program) control =
      block * (Numeric.enumerationProgram program).length + control := by
  rw [symbol, eval_add, eval_mul, eval_lit, eval_width, eval₂_projection_one]

def header : PRCode 2 := ifZero live (cell haltSymbol (cell sink (lit 0)))
  (cell (PRCode.projection 1) (cell (symbol 1) (lit 0)))

theorem eval_header (program : ThreeCounter.Program) (control : Nat) :
    PRCode.eval₂ header (counterCode program) control =
      encode ((ThreeCounterTag.header program control).map (Numeric.encodeSymbol program)) := by
  simp only [header, eval_ifZero, eval_live, eval_cell, eval_haltSymbol, eval_sink,
    eval_lit, eval₂_projection_one, eval_symbol, ThreeCounterTag.header, Nat.one_mul]
  cases ThreeCounter.instructionAt program control <;>
    simp only [instructionLive, DeterministicTapeCode.boolCode, Nat.one_ne_zero, ↓reduceIte,
      ThreeCounterTag.header] <;> rfl

def laneMultiplicity (register : ThreeCounter.Register) (positive : Bool) : PRCode 2 :=
  let next := branch positive
  let nextScale := withControl (scaleCode register) next
  ifZero (withControl live next) (lit 0)
    (ifZero (testedEq register) nextScale
      (ifZero (pred tag) (mul nextScale (lit (if positive then 4 else 2))) nextScale))

theorem eval_laneMultiplicity (register : ThreeCounter.Register) (positive : Bool)
    (program : ThreeCounter.Program) (control : Nat) :
    PRCode.eval₂ (laneMultiplicity register positive) (counterCode program) control =
      ThreeCounterTag.laneMultiplicity program control register positive := by
  simp only [laneMultiplicity, eval_ifZero, eval_withControl, eval_branch, eval_live,
    eval_scaleCode, eval_lit, eval_testedEq, eval_pred, tag, eval_field, eval_mul]
  dsimp only [ThreeCounterTag.laneMultiplicity]
  cases alive : instructionLive (ThreeCounter.instructionAt program (branchNext (ThreeCounter.instructionAt program control) positive)) with
  | false => rfl
  | true =>
      simp only [DeterministicTapeCode.boolCode, Nat.one_ne_zero, ↓reduceIte]
      cases selected : ThreeCounter.instructionAt program control with
      | halt => cases register <;> rfl
      | increment selectedRegister next => cases selectedRegister <;> cases register <;> cases positive <;> rfl
      | decrementJump selectedRegister positiveNext zeroNext => cases selectedRegister <;> cases register <;> cases positive <;> rfl

def dataSymbol (register : ThreeCounter.Register) (control : PRCode 2) : PRCode 2 :=
  add (mul (lit 2) width) (add (mul (lit 3) control) (lit (registerCode register)))

theorem eval_dataSymbol (register : ThreeCounter.Register) (control : PRCode 2)
    (program : ThreeCounter.Program) (second : Nat) :
    PRCode.eval₂ (dataSymbol register control) (counterCode program) second =
      Numeric.encodeSymbol program (ThreeCounterTag.dataSymbol (PRCode.eval₂ control (counterCode program) second) register) := by
  simp only [dataSymbol, eval_add, eval_mul, eval_lit, eval_width, registerCode_eq_id]
  rfl

def laneOutput (register : ThreeCounter.Register) (positive : Bool) : PRCode 2 :=
  repeatCode (dataSymbol register (branch positive)) (laneMultiplicity register positive)

theorem eval_laneOutput (register : ThreeCounter.Register) (positive : Bool)
    (program : ThreeCounter.Program) (control : Nat) :
    PRCode.eval₂ (laneOutput register positive) (counterCode program) control =
      encode ((ThreeCounterTag.laneOutput program control register positive).map (Numeric.encodeSymbol program)) := by
  rw [laneOutput, eval_repeatCode, eval_dataSymbol, eval_branch, eval_laneMultiplicity,
    ThreeCounterTag.laneOutput, List.map_replicate]

end Program

inductive Family where
  | head | filler | first | second | selectPositive | selectZero
  | firstPositive | firstZero | secondPositive | secondZero | sink

def familySymbol : Family → Nat → CounterMachineTag.Symbol
  | .head, control => .head control
  | .filler, control => .filler control
  | .first, control => .first control
  | .second, control => .second control
  | .selectPositive, control => .selectPositive control
  | .selectZero, control => .selectZero control
  | .firstPositive, control => .firstPositive control
  | .firstZero, control => .firstZero control
  | .secondPositive, control => .secondPositive control
  | .secondZero, control => .secondZero control
  | .sink, _ => .sink

namespace Program

open PrimitiveRecursiveListCode.Program
open DeterministicTapeThreeCounterComputability.Program

def payloadLane (positive : Bool) : PRCode 2 :=
  select ([ThreeCounter.Register.left, .right, .scratch].map fun register =>
    withControl (laneOutput register positive) (div (PRCode.projection 1) (lit 3)))
    (mod (PRCode.projection 1) (lit 3))

theorem eval_payloadLane (positive : Bool) (program : ThreeCounter.Program) (number : Nat) :
    PRCode.eval₂ (payloadLane positive) (counterCode program) number =
      encode ((ThreeCounterTag.laneOutput program (payloadControl number) (payloadRegister number) positive).map
        (Numeric.encodeSymbol program)) := by
  rw [payloadLane, eval_select, eval_mod, eval₂_projection_one, eval_lit, ← payloadRegister_code]
  cases payloadRegister number <;>
    simp only [List.map_cons, List.map_nil, registerCode, List.getD_cons_zero, List.getD_cons_succ,
      eval_withControl, eval_div, eval₂_projection_one, eval_lit, eval_laneOutput,
      ← payloadControl_eq_div]

def row : Family → PRCode 2
  | .head => cell (symbol 4) (cell (symbol 5) (lit 0))
  | .first => cell (symbol 6) (cell (symbol 7) (lit 0))
  | .selectPositive => withControl header (branch true)
  | .selectZero => cell (mul (lit 10) width) (withControl header (branch false))
  | .firstPositive => payloadLane true
  | .firstZero => payloadLane false
  | _ => cell sink (cell sink (lit 0))

theorem eval_row (family : Family) (program : ThreeCounter.Program) (control : Nat) :
    PRCode.eval₂ (row family) (counterCode program) control =
      encode (Numeric.numericRhs program (familySymbol family control)) := by
  cases family <;>
    simp only [row, eval_cell, eval_symbol, eval_lit, eval_sink, eval_withControl,
      eval_branch, eval_header, eval_mul, eval_width, eval_payloadLane,
      Numeric.numericRhs, familySymbol, ThreeCounterTag.production]
  all_goals rfl

def ifLess (left right yes no : PRCode 2) : PRCode 2 :=
  ifZero (PRCode.composeBinary PRCode.lessEqual (add left (lit 1)) right) no yes

theorem eval_ifLess (left right yes no : PRCode 2) (first second : Nat) :
    PRCode.eval₂ (ifLess left right yes no) first second =
      if PRCode.eval₂ left first second < PRCode.eval₂ right first second then
        PRCode.eval₂ yes first second else PRCode.eval₂ no first second := by
  rw [ifLess, eval_ifZero, eval₂_composeBinary, eval_add, eval_lit, PRCode.eval₂_lessEqual]
  by_cases lower : PRCode.eval₂ left first second < PRCode.eval₂ right first second
  · have bounded := Nat.succ_le_of_lt lower
    simp only [bounded, lower, ↓reduceIte, Nat.one_ne_zero]
  · have unbounded : ¬ PRCode.eval₂ left first second + 1 ≤ PRCode.eval₂ right first second :=
      fun bounded => lower (Nat.lt_of_succ_le bounded)
    simp only [unbounded, lower, ↓reduceIte]

def selectRows : List Family → Nat → PRCode 2
  | [], _ => row .sink
  | family :: rest, block =>
      ifLess (PRCode.projection 1) (mul (lit (block + 1)) width)
        (withControl (row family) (sub (PRCode.projection 1) (mul (lit block) width)))
        (selectRows rest (block + 1))

def selectedRowValue (code : CounterMachineTag.Symbol → Nat) (count label : Nat) : List Family → Nat → Nat
  | [], _ => code .sink
  | family :: rest, block =>
      if label < (block + 1) * count then
        code (familySymbol family (label - block * count))
      else selectedRowValue code count label rest (block + 1)

theorem eval_selectRows (families : List Family) (block : Nat) (program : ThreeCounter.Program) (label : Nat) :
    PRCode.eval₂ (selectRows families block) (counterCode program) label =
      selectedRowValue (fun symbol => encode (Numeric.numericRhs program symbol))
        (Numeric.enumerationProgram program).length label families block := by
  induction families generalizing block with
  | nil => exact eval_row .sink program label
  | cons family rest ih =>
      rw [selectRows, eval_ifLess, eval₂_projection_one, eval_mul, eval_lit, eval_width,
        eval_withControl, eval_sub, eval₂_projection_one, eval_mul, eval_lit, eval_width,
        eval_row, ih]
      rfl

def families : List Family :=
  [.head, .filler, .first, .second, .selectPositive, .selectZero,
    .firstPositive, .firstZero, .secondPositive, .secondZero]

/-- Literal branches of the existing ten-block symbol decoder. -/
def tableEntry : PRCode 2 := selectRows families 0

theorem selectedRowValue_decoder (code : CounterMachineTag.Symbol → Nat)
    (program : ThreeCounter.Program) (label : Nat) (same : code .sacrificial = code .sink) :
    selectedRowValue code (Numeric.enumerationProgram program).length label families 0 =
      code (Numeric.decodeSymbol program label) := by
  simp only [families, selectedRowValue]
  simp only [Numeric.decodeSymbol, CounterMachineTag.Numeric.decodeSymbol]
  simp only [familySymbol, Nat.zero_add, Nat.zero_mul, Nat.sub_zero, Nat.one_mul]
  simp only [apply_ite code, same, ite_self]

theorem eval_tableEntry (program : ThreeCounter.Program) (label : Nat) :
    PRCode.eval₂ tableEntry (counterCode program) label =
      encode (Numeric.numericRhs program (Numeric.decodeSymbol program label)) := by
  rw [tableEntry, eval_selectRows]
  exact selectedRowValue_decoder _ program label rfl

def tableBound : PRCode 1 :=
  PRCode.composeBinary haltSymbol (PRCode.projection 0) (PRCode.constant 1 0)

theorem eval_tableBound (program : ThreeCounter.Program) :
    PRCode.eval₁ tableBound (counterCode program) = Numeric.ordinaryCount program := by
  rw [tableBound, eval₁_composeBinary, eval₁_projection_zero, eval₁_constant, eval_haltSymbol]
  rfl

def ordinaryProgram : PRCode 1 :=
  PRCode.composeBinary (tabulateWithParameter tableEntry) (PRCode.projection 0) tableBound

theorem eval_ordinaryProgram (program : ThreeCounter.Program) :
    PRCode.eval₁ ordinaryProgram (counterCode program) =
      DeletionTwoT2Computability.programCode (Numeric.ordinaryProgram program) := by
  rw [ordinaryProgram, eval₁_composeBinary, eval₁_projection_zero, eval_tableBound,
    eval_tabulateWithParameter, DeletionTwoT2Computability.programCode,
    Numeric.ordinaryProgram, List.map_map]
  exact congrArg encode (map_pointwise _ _ _ (eval_tableEntry program))

def stateField (index : Nat) : PRCode 2 :=
  PRCode.composeBinary lookup (PRCode.projection 1) (lit index)

theorem eval_stateField (index : Nat) (number : Nat) (state : ThreeCounter.State) :
    PRCode.eval₂ (stateField index) number (stateCode state) =
      [state.control, state.left, state.right, state.scratch,
        DeterministicTapeInitialComputability.statusCode state.status].getD index 0 := by
  rw [stateField, eval₂_composeBinary, eval₂_projection_one, eval_lit, eval_lookup,
    stateCode, DeterministicTapeInitialComputability.stateCode, decode_encode]

theorem eval_stateControl (number : Nat) (state : ThreeCounter.State) :
    PRCode.eval₂ (stateField 0) number (stateCode state) = state.control :=
  eval_stateField 0 number state

theorem eval_stateValue (register : ThreeCounter.Register) (number : Nat) (state : ThreeCounter.State) :
    PRCode.eval₂ (stateField (registerCode register + 1)) number (stateCode state) =
      ThreeCounter.read state register := by
  rw [eval_stateField]
  cases register <;> rfl

def dataBlock (register : ThreeCounter.Register) : PRCode 2 :=
  ifZero (withControl live (stateField 0)) (lit 0)
    (repeatCode (dataSymbol register (stateField 0))
      (mul (withControl (scaleCode register) (stateField 0))
        (power (lit 2) (stateField (registerCode register + 1)))))

theorem eval_dataBlock (register : ThreeCounter.Register) (program : ThreeCounter.Program) (state : ThreeCounter.State) :
    PRCode.eval₂ (dataBlock register) (counterCode program) (stateCode state) =
      encode ((ThreeCounterTag.dataBlock program state.control register (ThreeCounter.read state register)).map
        (Numeric.encodeSymbol program)) := by
  simp only [dataBlock, eval_ifZero, eval_withControl, eval_stateControl, eval_live,
    eval_lit, eval_repeatCode, eval_dataSymbol, eval_mul, eval_scaleCode, eval_power, eval_stateValue]
  dsimp only [ThreeCounterTag.dataBlock]
  cases instructionLive (ThreeCounter.instructionAt program state.control) <;>
    simp only [DeterministicTapeCode.boolCode, Bool.false_eq_true, Nat.one_ne_zero, ↓reduceIte,
      List.map_nil, List.map_replicate, CounterMachineTag.radix]
  rfl

def canonical : PRCode 2 :=
  appendCode (withControl header (stateField 0))
    (appendCode (dataBlock .left) (appendCode (dataBlock .right) (dataBlock .scratch)))

theorem eval_canonical (program : ThreeCounter.Program) (state : ThreeCounter.State) :
    PRCode.eval₂ canonical (counterCode program) (stateCode state) =
      encode ((ThreeCounterTag.canonical program state.control state.left state.right state.scratch).map
        (Numeric.encodeSymbol program)) := by
  simp only [canonical, eval_appendCode, eval_withControl, eval_stateControl, eval_header,
    eval_dataBlock, decode_encode, ThreeCounterTag.canonical, List.map_append, ThreeCounter.read,
    List.append_assoc]

def initialWord : PRCode 2 :=
  ifZero (stateField 4) canonical (cell haltSymbol (cell sink (lit 0)))

theorem eval_initialWord (program : ThreeCounter.Program) (state : ThreeCounter.State) :
    PRCode.eval₂ initialWord (counterCode program) (stateCode state) =
      encode (Numeric.ordinaryInitialWord program state) := by
  rw [initialWord, eval_ifZero, eval_stateField, eval_canonical]
  simp only [eval_cell, eval_haltSymbol, eval_sink, eval_lit,
    Numeric.ordinaryInitialWord, Numeric.encodeWord, ThreeCounterTag.encodeState]
  cases state.status <;> rfl

def ordinaryJob : PRCode 2 :=
  PRCode.composeBinary PRCode.cantorPair
    (PRCode.composeUnary ordinaryProgram (PRCode.projection 0)) initialWord

theorem eval_ordinaryJob (program : ThreeCounter.Program) (state : ThreeCounter.State) :
    PRCode.eval₂ ordinaryJob (counterCode program) (stateCode state) =
      DeletionTwoT2Computability.jobCode (Numeric.ordinaryJob program state) := by
  rw [ordinaryJob, eval₂_composeBinary, eval₂_composeUnary, eval₂_projection_zero,
    eval_ordinaryProgram, eval_initialWord, DeterministicTapeCode.eval₂_cantorPair_eq_termPair]
  rfl

def compileT2 : PRCode 2 :=
  PRCode.composeUnary DeletionTwoT2Computability.Program.normalizeJob ordinaryJob

theorem eval_compileT2 (program : ThreeCounter.Program) (state : ThreeCounter.State) :
    PRCode.eval₂ compileT2 (counterCode program) (stateCode state) =
      DeletionTwoT2Computability.jobCode (Numeric.compileT2 program state) := by
  rw [compileT2, eval₂_composeUnary, eval_ordinaryJob,
    DeletionTwoT2Computability.Program.eval_normalizeJob, DeletionTwoT2Computability.jobDecode_code]
  rfl

/-- Composition on the established, total deterministic-tape source numbering. -/
def sourceT2 : PRCode 1 :=
  PRCode.composeBinary compileT2
    DeterministicTapeThreeCounterComputability.Program.instanceTable
    DeterministicTapeInitialComputability.Program.initialState

theorem eval_sourceT2 (number : Nat) :
    PRCode.eval₁ sourceT2 number =
      DeletionTwoT2Computability.jobCode
        (DeterministicTapeCook.compileT2Job (DeterministicTapeCode.instanceDecodeCode number)) := by
  rw [sourceT2, eval₁_composeBinary,
    DeterministicTapeThreeCounterComputability.Program.eval_instanceTable,
    DeterministicTapeInitialComputability.Program.eval_initialState, eval_compileT2]
  rfl

end Program

theorem sourceT2_primitiveRecursive :
    PrimitiveRecursive (fun number =>
      DeletionTwoT2Computability.jobCode
        (DeterministicTapeCook.compileT2Job (DeterministicTapeCode.instanceDecodeCode number))) :=
  ⟨Program.sourceT2, Program.eval_sourceT2⟩

theorem sourceT2_decode (number : Nat) :
    DeletionTwoT2Computability.jobDecode (PRCode.eval₁ Program.sourceT2 number) =
      DeterministicTapeCook.compileT2Job (DeterministicTapeCode.instanceDecodeCode number) := by
  rw [Program.eval_sourceT2, DeletionTwoT2Computability.jobDecode_code]

end PureSFormal.Computation.ThreeCounterTagComputability
