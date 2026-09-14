import PureSFormal.Computation.DeterministicTapeInitialComputability

/-!
# Closed code for the literal three-counter instruction table

Instructions use the canonical natural-list code of their tag, register and
successor fields. A program is the canonical natural-list code of its instruction
codes. The compiler certificate constructs the actual 127-phase table, including
its halting instructions and literal numeric branch labels.
-/

namespace PureSFormal.Computation.DeterministicTapeThreeCounterComputability

open PureSFormal.PureS
open PureSFormal.Research.ProtectedTrieDeterministicCompiler
open DeterministicTapeCode
open DeterministicTapeThreeCounterCompiler
open DeterministicTapeThreeCounterCompiler.Layout

def registerCode : ThreeCounter.Register → Nat
  | .left => 0
  | .right => 1
  | .scratch => 2

def registerDecode? : Nat → Option ThreeCounter.Register
  | 0 => some .left
  | 1 => some .right
  | 2 => some .scratch
  | _ => none

def instructionCode : ThreeCounter.Instruction → Nat
  | .halt => 0
  | .increment register next =>
      PrimitiveRecursiveListCode.encode [1, registerCode register, next]
  | .decrementJump register positive zeroNext =>
      PrimitiveRecursiveListCode.encode [2, registerCode register, positive, zeroNext]

def instructionDecode? (number : Nat) : Option ThreeCounter.Instruction :=
  match PrimitiveRecursiveListCode.decode number with
  | [] => some .halt
  | [1, register, next] =>
      (registerDecode? register).map fun decoded => .increment decoded next
  | [2, register, positive, zeroNext] =>
      (registerDecode? register).map fun decoded => .decrementJump decoded positive zeroNext
  | _ => none

@[simp] theorem instructionDecode?_code (instruction : ThreeCounter.Instruction) :
    instructionDecode? (instructionCode instruction) = some instruction := by
  cases instruction with
  | halt =>
      change instructionDecode? (PrimitiveRecursiveListCode.encode []) = _
      simp only [instructionDecode?, PrimitiveRecursiveListCode.decode_encode]
  | increment register next =>
      cases register <;>
        simp only [instructionCode, instructionDecode?, PrimitiveRecursiveListCode.decode_encode,
          registerCode, registerDecode?, Option.map]
  | decrementJump register positive zeroNext =>
      cases register <;>
        simp only [instructionCode, instructionDecode?, PrimitiveRecursiveListCode.decode_encode,
          registerCode, registerDecode?, Option.map]

def programCode (program : ThreeCounter.Program) : Nat :=
  PrimitiveRecursiveListCode.encode (program.map instructionCode)

def decodeInstructions? : List Nat → Option ThreeCounter.Program
  | [] => some []
  | first :: rest => do
      let instruction ← instructionDecode? first
      let tail ← decodeInstructions? rest
      pure (instruction :: tail)

def programDecode? (number : Nat) : Option ThreeCounter.Program :=
  decodeInstructions? (PrimitiveRecursiveListCode.decode number)

theorem decodeInstructions?_codes (program : ThreeCounter.Program) :
    decodeInstructions? (program.map instructionCode) = some program := by
  induction program with
  | nil => rfl
  | cons instruction rest ih =>
      change (instructionDecode? (instructionCode instruction)).bind
        (fun first => (decodeInstructions? (rest.map instructionCode)).bind
          (fun tail => some (first :: tail))) = some (instruction :: rest)
      rw [instructionDecode?_code]
      change (decodeInstructions? (rest.map instructionCode)).bind
        (fun tail => some (instruction :: tail)) = some (instruction :: rest)
      rw [ih]
      rfl

@[simp] theorem programDecode?_code (program : ThreeCounter.Program) :
    programDecode? (programCode program) = some program := by
  rw [programDecode?, programCode, PrimitiveRecursiveListCode.decode_encode,
    decodeInstructions?_codes]

theorem encode_map {α : Type} (code : α → Nat) (values : List α) :
    PrimitiveRecursiveListCode.encode (values.map code) = NatList.encode code values := by
  induction values with
  | nil => rfl
  | cons value rest ih =>
      change Term.pair (code value) (PrimitiveRecursiveListCode.encode (rest.map code)) + 1 = _
      rw [ih]
      rfl

theorem machineCode_eq_rows (machine : DeterministicTape.Machine) :
    machineCode machine = PrimitiveRecursiveListCode.encode (machine.states.map stateRowCode) :=
  (encode_map stateRowCode machine.states).symm

def emptyRow : DeterministicTape.StateRow := ⟨none, none⟩

theorem row_getD_code (rows : List DeterministicTape.StateRow) (index : Nat) :
    (rows.map stateRowCode).getD index 0 = stateRowCode (rows.getD index emptyRow) := by
  induction rows generalizing index with
  | nil => rfl
  | cons row rest ih =>
      cases index with
      | zero => rfl
      | succ index => exact ih index

theorem ruleFor_getD (machine : DeterministicTape.Machine) (state : Nat) (symbol : Bool) :
    Compiler.ruleFor machine state symbol =
      if symbol then (machine.states.getD state emptyRow).onTrue
      else (machine.states.getD state emptyRow).onFalse := by
  cases machine with
  | mk rows =>
      induction rows generalizing state with
      | nil => cases symbol <;> rfl
      | cons row rest ih =>
          cases state with
          | zero => cases symbol <;> rfl
          | succ state => exact ih state

namespace Program

open PrimitiveRecursiveListCode.Program

def lit (value : Nat) : PRCode 2 := PRCode.constant 2 value
def add (first second : PRCode 2) : PRCode 2 :=
  PRCode.composeBinary PRCode.addition first second
def mul (first second : PRCode 2) : PRCode 2 :=
  PRCode.composeBinary PRCode.multiplication first second
def div (first second : PRCode 2) : PRCode 2 :=
  PRCode.composeBinary PRCode.division first second
def mod (first second : PRCode 2) : PRCode 2 :=
  PRCode.composeBinary PRCode.modulus first second
def pred (code : PRCode 2) : PRCode 2 := PRCode.composeUnary PRCode.predecessor code
def ifZero (test zero positive : PRCode 2) : PRCode 2 :=
  PRCode.composeTernary PRCode.branchIfZero zero positive test
def cell (head tail : PRCode 2) : PRCode 2 := PRCode.composeBinary cons head tail

@[simp] theorem eval_lit (value first second : Nat) :
    PRCode.eval₂ (lit value) first second = value := eval₂_constant _ _ _
@[simp] theorem eval_add (left right : PRCode 2) (first second : Nat) :
    PRCode.eval₂ (add left right) first second =
      PRCode.eval₂ left first second + PRCode.eval₂ right first second := by
  rw [add, eval₂_composeBinary, PRCode.eval₂_addition]
@[simp] theorem eval_mul (left right : PRCode 2) (first second : Nat) :
    PRCode.eval₂ (mul left right) first second =
      PRCode.eval₂ left first second * PRCode.eval₂ right first second := by
  rw [mul, eval₂_composeBinary, PRCode.eval₂_multiplication]
@[simp] theorem eval_div (left right : PRCode 2) (first second : Nat) :
    PRCode.eval₂ (div left right) first second =
      PRCode.eval₂ left first second / PRCode.eval₂ right first second := by
  rw [div, eval₂_composeBinary, PRCode.eval₂_division]
@[simp] theorem eval_mod (left right : PRCode 2) (first second : Nat) :
    PRCode.eval₂ (mod left right) first second =
      PRCode.eval₂ left first second % PRCode.eval₂ right first second := by
  rw [mod, eval₂_composeBinary, PRCode.eval₂_modulus]
@[simp] theorem eval_pred (code : PRCode 2) (first second : Nat) :
    PRCode.eval₂ (pred code) first second = PRCode.eval₂ code first second - 1 := by
  rw [pred, eval₂_composeUnary, PRCode.eval₁_predecessor]
@[simp] theorem eval_ifZero (test zero positive : PRCode 2) (first second : Nat) :
    PRCode.eval₂ (ifZero test zero positive) first second =
      if PRCode.eval₂ test first second = 0 then PRCode.eval₂ zero first second
      else PRCode.eval₂ positive first second := by
  rw [ifZero, eval₂_composeTernary, PRCode.eval_branchIfZero]
@[simp] theorem eval_cell (head tail : PRCode 2) (first second : Nat) :
    PRCode.eval₂ (cell head tail) first second =
      Term.pair (PRCode.eval₂ head first second) (PRCode.eval₂ tail first second) + 1 := by
  rw [cell, eval₂_composeBinary, eval_cons]

def row : PRCode 2 := lookup

theorem eval_row (machine : DeterministicTape.Machine) (state : Nat) :
    PRCode.eval₂ row (machineCode machine) state =
      stateRowCode (machine.states.getD state emptyRow) := by
  rw [row, eval_lookup, machineCode_eq_rows, PrimitiveRecursiveListCode.decode_encode,
    row_getD_code]

def ruleOption (symbol : Bool) : PRCode 2 :=
  PRCode.composeUnary (if symbol then PRCode.cantorRight else PRCode.cantorLeft) row

theorem eval_ruleOption (machine : DeterministicTape.Machine) (state : Nat) (symbol : Bool) :
    PRCode.eval₂ (ruleOption symbol) (machineCode machine) state =
      optionCode ruleCode (Compiler.ruleFor machine state symbol) := by
  rw [ruleOption, eval₂_composeUnary, eval_row, ruleFor_getD]
  cases symbol <;> simp only [Bool.false_eq_true, ↓reduceIte,
    eval₁_cantorLeft_eq_unpair_fst, eval₁_cantorRight_eq_unpair_snd,
    stateRowCode, Term.unpair_pair]

def ruleWrite (symbol : Bool) : PRCode 2 := mod (pred (ruleOption symbol)) (lit 2)
def ruleMove (symbol : Bool) : PRCode 2 := mod (div (pred (ruleOption symbol)) (lit 2)) (lit 3)
def ruleNext (symbol : Bool) : PRCode 2 := div (div (pred (ruleOption symbol)) (lit 2)) (lit 3)

theorem eval_ruleWrite_some (machine : DeterministicTape.Machine) (state : Nat)
    (symbol : Bool) (rule : Compiler.Rule) (selected : Compiler.ruleFor machine state symbol = some rule) :
    PRCode.eval₂ (ruleWrite symbol) (machineCode machine) state = DeterministicTapeCode.boolCode rule.write := by
  simp only [ruleWrite, eval_mod, eval_pred, eval_ruleOption, selected, optionCode,
    Nat.add_sub_cancel, eval_lit]
  have correct := congrArg (fun decoded => DeterministicTapeCode.boolCode decoded.write)
    (ruleDecode_code rule)
  change DeterministicTapeCode.boolCode (boolDecode (ruleCode rule)) = _ at correct
  rw [boolCode_decode] at correct
  exact correct

theorem eval_ruleMove_some (machine : DeterministicTape.Machine) (state : Nat)
    (symbol : Bool) (rule : Compiler.Rule) (selected : Compiler.ruleFor machine state symbol = some rule) :
    PRCode.eval₂ (ruleMove symbol) (machineCode machine) state = directionCode rule.move := by
  simp only [ruleMove, eval_mod, eval_div, eval_pred, eval_ruleOption, selected, optionCode,
    Nat.add_sub_cancel, eval_lit]
  have correct := congrArg (fun decoded => directionCode decoded.move) (ruleDecode_code rule)
  change directionCode (directionDecode (ruleCode rule / 2)) = _ at correct
  rw [directionCode_decode] at correct
  exact correct

theorem eval_ruleNext_some (machine : DeterministicTape.Machine) (state : Nat)
    (symbol : Bool) (rule : Compiler.Rule) (selected : Compiler.ruleFor machine state symbol = some rule) :
    PRCode.eval₂ (ruleNext symbol) (machineCode machine) state = rule.nextState := by
  simp only [ruleNext, eval_div, eval_pred, eval_ruleOption, selected, optionCode,
    Nat.add_sub_cancel, eval_lit]
  exact congrArg (fun decoded => decoded.nextState) (ruleDecode_code rule)

def addr (phase : Phase) : PRCode 2 :=
  add (mul (PRCode.projection 1) (lit phaseCount)) (lit (encodePhase phase))

def halt : PRCode 2 :=
  mul (PRCode.composeUnary length (PRCode.projection 0)) (lit phaseCount)

def boundary (symbol : Bool) : PRCode 2 := mul (ruleNext symbol) (lit phaseCount)

def increment (register : ThreeCounter.Register) (next : PRCode 2) : PRCode 2 :=
  cell (lit 1) (cell (lit (registerCode register)) (cell next (lit 0)))

def decrement (register : ThreeCounter.Register) (positive zeroNext : PRCode 2) : PRCode 2 :=
  cell (lit 2) (cell (lit (registerCode register))
    (cell positive (cell zeroNext (lit 0))))

def zeroGoto (phase : Phase) : PRCode 2 := decrement .scratch halt (addr phase)

@[simp] theorem eval_addr (phase : Phase) (number state : Nat) :
    PRCode.eval₂ (addr phase) number state = address state phase := by
  simp only [addr, eval_add, eval_mul, eval₂_projection_one, eval_lit, address]

@[simp] theorem eval_halt (machine : DeterministicTape.Machine) (state : Nat) :
    PRCode.eval₂ halt (machineCode machine) state = Compiler.haltAddress machine := by
  simp only [halt, eval_mul, eval₂_composeUnary, eval₂_projection_zero, eval_length,
    eval_lit, machineCode_eq_rows, PrimitiveRecursiveListCode.decode_encode,
    List.length_map, Compiler.haltAddress]

theorem eval_boundary_some (machine : DeterministicTape.Machine) (state : Nat)
    (symbol : Bool) (rule : Compiler.Rule) (selected : Compiler.ruleFor machine state symbol = some rule) :
    PRCode.eval₂ (boundary symbol) (machineCode machine) state = Compiler.boundaryAddress rule.nextState := by
  rw [boundary, eval_mul, eval_ruleNext_some machine state symbol rule selected, eval_lit]
  rfl

@[simp] theorem eval_increment (register : ThreeCounter.Register) (next : PRCode 2)
    (number state : Nat) :
    PRCode.eval₂ (increment register next) number state =
      instructionCode (.increment register (PRCode.eval₂ next number state)) := by
  simp only [increment, eval_cell, eval_lit]
  rfl

@[simp] theorem eval_decrement (register : ThreeCounter.Register) (positive zeroNext : PRCode 2)
    (number state : Nat) :
    PRCode.eval₂ (decrement register positive zeroNext) number state =
      instructionCode (.decrementJump register (PRCode.eval₂ positive number state)
        (PRCode.eval₂ zeroNext number state)) := by
  simp only [decrement, eval_cell, eval_lit]
  rfl

@[simp] theorem eval_zeroGoto (phase : Phase) (machine : DeterministicTape.Machine) (state : Nat) :
    PRCode.eval₂ (zeroGoto phase) (machineCode machine) state =
      instructionCode (Compiler.zeroGoto machine state phase) := by
  simp only [zeroGoto, eval_decrement, eval_halt, eval_addr, Compiler.zeroGoto]

def pushBit : PushContext → PRCode 2
  | .leftNeighbor _ neighbor => lit (DeterministicTapeCode.boolCode neighbor)
  | context => ifZero (ruleOption (Compiler.pushSymbol context)) (lit 0)
      (ruleWrite (Compiler.pushSymbol context))

def finish : PushContext → PRCode 2
  | .stay symbol => ifZero (ruleOption symbol) halt (boundary symbol)
  | .right symbol tailEmpty => ifZero (ruleOption symbol) halt
      (if tailEmpty then addr (.rightBlank symbol) else boundary symbol)
  | .leftWrite symbol neighbor => addr (.push (.leftNeighbor symbol neighbor) .drain)
  | .leftNeighbor symbol _ => ifZero (ruleOption symbol) halt (boundary symbol)

theorem eval_pushBit (context : PushContext) (machine : DeterministicTape.Machine) (state : Nat) :
    PRCode.eval₂ (pushBit context) (machineCode machine) state =
      DeterministicTapeCode.boolCode (Compiler.pushBit machine state context) := by
  cases context with
  | leftNeighbor symbol neighbor => exact eval_lit _ _ _
  | stay symbol | right symbol tailEmpty | leftWrite symbol neighbor =>
      cases selected : Compiler.ruleFor machine state symbol with
      | none =>
          simp only [pushBit, Compiler.pushSymbol, eval_ifZero, eval_ruleOption,
            selected, optionCode, ↓reduceIte, eval_lit, Compiler.pushBit,
            DeterministicTapeCode.boolCode]
      | some rule =>
          simp only [pushBit, Compiler.pushSymbol, eval_ifZero, eval_ruleOption,
            selected, optionCode, Nat.add_one_ne_zero, ↓reduceIte,
            eval_ruleWrite_some machine state symbol rule selected, Compiler.pushBit]

theorem eval_finish (context : PushContext) (machine : DeterministicTape.Machine) (state : Nat) :
    PRCode.eval₂ (finish context) (machineCode machine) state = Compiler.finishAddress machine state context := by
  cases context with
  | leftWrite symbol neighbor => exact eval_addr _ _ _
  | stay symbol | leftNeighbor symbol neighbor =>
      cases selected : Compiler.ruleFor machine state symbol with
      | none =>
          simp only [finish, eval_ifZero, eval_ruleOption, selected, optionCode,
            ↓reduceIte, eval_halt, Compiler.finishAddress]
      | some rule =>
          simp only [finish, eval_ifZero, eval_ruleOption, selected, optionCode,
            Nat.add_one_ne_zero, ↓reduceIte,
            eval_boundary_some machine state symbol rule selected, Compiler.finishAddress]
  | right symbol tailEmpty =>
      cases selected : Compiler.ruleFor machine state symbol with
      | none =>
          simp only [finish, eval_ifZero, eval_ruleOption, selected, optionCode,
            ↓reduceIte, eval_halt, Compiler.finishAddress]
      | some rule =>
          cases tailEmpty <;>
            simp only [finish, eval_ifZero, eval_ruleOption, selected, optionCode,
              Nat.add_one_ne_zero, Bool.false_eq_true, ↓reduceIte, eval_addr,
              eval_boundary_some machine state symbol rule selected, Compiler.finishAddress]

/-- One closed binary program for each of the compiler's finite typed phases. -/
def phase : Phase → PRCode 2
  | .right .start => decrement .right (addr (.right .checkSentinel)) halt
  | .right .checkSentinel => decrement .right (addr (.right .incrementScratch)) halt
  | .right .incrementScratch => increment .scratch (addr (.right .pairFirst))
  | .right .pairFirst => decrement .right (addr (.right .pairSecond)) (addr (.right (.restoreFirst false)))
  | .right .pairSecond => decrement .right (addr (.right .incrementScratch)) (addr (.right (.restoreFirst true)))
  | .right (.restoreFirst bit) => decrement .scratch (addr (.right (.restoreFirstIncrement bit))) halt
  | .right (.restoreFirstIncrement bit) => increment .right (addr (.right (.restoreCheck bit)))
  | .right (.restoreCheck bit) => decrement .scratch (addr (.right (.restoreRestIncrement bit))) (addr (.dispatch bit true))
  | .right (.restoreRestIncrement bit) => increment .right (addr (.right (.restoreLoop bit)))
  | .right (.restoreLoop bit) => decrement .scratch (addr (.right (.restoreLoopIncrement bit))) (addr (.dispatch bit false))
  | .right (.restoreLoopIncrement bit) => increment .right (addr (.right (.restoreLoop bit)))
  | .dispatch symbol tailEmpty => ifZero (ruleOption symbol) (lit 0)
      (ifZero (ruleMove symbol) (zeroGoto (.left symbol .start))
        (ifZero (pred (ruleMove symbol)) (zeroGoto (.push (.stay symbol) .drain))
          (zeroGoto (.push (.right symbol tailEmpty) .drain))))
  | .left symbol .start => decrement .left (addr (.left symbol .checkSentinel)) halt
  | .left symbol .checkSentinel => decrement .left (addr (.left symbol .incrementScratch)) (addr (.left symbol .restoreEmpty))
  | .left symbol .incrementScratch => increment .scratch (addr (.left symbol .pairFirst))
  | .left symbol .pairFirst => decrement .left (addr (.left symbol .pairSecond)) (addr (.left symbol (.restore false)))
  | .left symbol .pairSecond => decrement .left (addr (.left symbol .incrementScratch)) (addr (.left symbol (.restore true)))
  | .left symbol (.restore neighbor) => decrement .scratch (addr (.left symbol (.restoreIncrement neighbor)))
      (addr (.push (.leftWrite symbol neighbor) .drain))
  | .left symbol (.restoreIncrement neighbor) => increment .left (addr (.left symbol (.restore neighbor)))
  | .left symbol .restoreEmpty => increment .left (addr (.push (.leftWrite symbol false) .drain))
  | .push context .drain => decrement (Compiler.pushRegister context)
      (addr (.push context .drainIncrement)) (addr (.push context .restore))
  | .push context .drainIncrement => increment .scratch (addr (.push context .drain))
  | .push context .restore => decrement .scratch (addr (.push context .restoreIncrementFirst))
      (ifZero (pushBit context) (finish context) (addr (.push context .addBit)))
  | .push context .restoreIncrementFirst => increment (Compiler.pushRegister context) (addr (.push context .restoreIncrementSecond))
  | .push context .restoreIncrementSecond => increment (Compiler.pushRegister context) (addr (.push context .restore))
  | .push context .addBit => increment (Compiler.pushRegister context) (finish context)
  | .rightBlank symbol => ifZero (ruleOption symbol) (lit 0) (increment .right (boundary symbol))

theorem eval_phase (machine : DeterministicTape.Machine) (state : Nat) (selectedPhase : Phase) :
    PRCode.eval₂ (phase selectedPhase) (machineCode machine) state =
      instructionCode (Compiler.instructionFor machine state selectedPhase) := by
  cases selectedPhase with
  | right selectedPhase =>
      cases selectedPhase <;>
        simp only [phase, eval_decrement, eval_increment, eval_addr, eval_halt, Compiler.instructionFor]
  | left symbol selectedPhase =>
      cases selectedPhase <;>
        simp only [phase, eval_decrement, eval_increment, eval_addr, eval_halt, Compiler.instructionFor]
  | dispatch symbol tailEmpty =>
      cases selected : Compiler.ruleFor machine state symbol with
      | none => simp only [phase, eval_ifZero, eval_ruleOption, selected, optionCode,
          ↓reduceIte, eval_lit, Compiler.instructionFor, instructionCode]
      | some rule =>
          simp only [phase, eval_ifZero, eval_ruleOption, selected, optionCode,
            Nat.add_one_ne_zero, ↓reduceIte, eval_ruleMove_some machine state symbol rule selected,
            eval_pred, eval_zeroGoto, Compiler.instructionFor]
          cases rule.move <;> rfl
  | push context selectedPhase =>
      cases selectedPhase <;>
        simp only [phase, eval_decrement, eval_increment, eval_addr, eval_finish,
          eval_ifZero, eval_pushBit, Compiler.instructionFor]
      cases Compiler.pushBit machine state context <;> rfl
  | rightBlank symbol =>
      cases selected : Compiler.ruleFor machine state symbol with
      | none => simp only [phase, eval_ifZero, eval_ruleOption, selected, optionCode,
          ↓reduceIte, eval_lit, Compiler.instructionFor, instructionCode]
      | some rule => simp only [phase, eval_ifZero, eval_ruleOption, selected, optionCode,
          Nat.add_one_ne_zero, ↓reduceIte, eval_increment,
          eval_boundary_some machine state symbol rule selected, Compiler.instructionFor]

def select : List (PRCode 2) → PRCode 2 → PRCode 2
  | [], _ => lit 0
  | entry :: rest, index => ifZero index entry (select rest (pred index))

theorem eval_select (entries : List (PRCode 2)) (index : PRCode 2) (first second : Nat) :
    PRCode.eval₂ (select entries index) first second =
      (entries.map fun entry => PRCode.eval₂ entry first second).getD
        (PRCode.eval₂ index first second) 0 := by
  induction entries generalizing index with
  | nil => simp only [select, eval_lit, List.map_nil, List.getD_nil]
  | cons entry rest ih =>
      rw [select, eval_ifZero]
      cases value : PRCode.eval₂ index first second with
      | zero => simp only [value, ↓reduceIte, List.map_cons, List.getD_cons_zero]
      | succ value =>
          simp only [value, Nat.succ_ne_zero, ↓reduceIte, ih, eval_pred,
            Nat.add_sub_cancel, List.map_cons, List.getD_cons_succ]

def relabel (entry : PRCode 2) : PRCode 2 :=
  PRCode.composeBinary entry (PRCode.projection 0)
    (div (PRCode.projection 1) (lit phaseCount))

theorem eval_relabel (entry : PRCode 2) (number label : Nat) :
    PRCode.eval₂ (relabel entry) number label = PRCode.eval₂ entry number (label / phaseCount) := by
  simp only [relabel, eval₂_composeBinary, eval₂_projection_zero, eval_div,
    eval₂_projection_one, eval_lit]

/-- The fixed 127-way selection is expanded into finite composition syntax. -/
def tableEntry : PRCode 2 :=
  select ((List.range phaseCount).map fun index => relabel (phase (decodePhase index)))
    (mod (PRCode.projection 1) (lit phaseCount))

end Program

theorem range'_map_succ (count start : Nat) :
    (List.range' start count).map Nat.succ = List.range' (start + 1) count := by
  induction count generalizing start with
  | zero => rfl
  | succ count ih =>
      change (start + 1) :: (List.range' (start + 1) count).map Nat.succ =
        (start + 1) :: List.range' (start + 1 + 1) count
      rw [ih]

theorem range_succ_map (count : Nat) :
    List.range (count + 1) = 0 :: (List.range count).map Nat.succ := by
  rw [List.range_eq_range', List.range_eq_range']
  change 0 :: List.range' 1 count = 0 :: (List.range' 0 count).map Nat.succ
  rw [range'_map_succ]

theorem tabulate_eq_range_map {α : Type} (count : Nat) (entry : Nat → α) :
    Compiler.tabulate count entry = (List.range count).map entry := by
  induction count generalizing entry with
  | zero => rfl
  | succ count ih =>
      rw [Compiler.tabulate, ih, range_succ_map, List.map_cons, List.map_map]
      rfl

theorem tabulate_getD {α : Type} (count index : Nat) (entry : Nat → α) (default : α)
    (bounded : index < count) : (Compiler.tabulate count entry).getD index default = entry index := by
  induction count generalizing index entry with
  | zero => exact False.elim (Nat.not_lt_zero index bounded)
  | succ count ih =>
      cases index with
      | zero => rfl
      | succ index => exact ih index (fun offset => entry (offset + 1)) (Nat.lt_of_succ_lt_succ bounded)

namespace Program

open PrimitiveRecursiveListCode.Program

theorem eval_tableEntry (machine : DeterministicTape.Machine) (label : Nat) :
    PRCode.eval₂ tableEntry (machineCode machine) label =
      instructionCode (Compiler.instructionFor machine (label / phaseCount)
        (decodePhase (label % phaseCount))) := by
  rw [tableEntry, eval_select, eval_mod, eval₂_projection_one, eval_lit, List.map_map,
    ← tabulate_eq_range_map]
  rw [tabulate_getD _ _ _ _ (Nat.mod_lt label (by decide : 0 < phaseCount))]
  exact (eval_relabel _ _ _).trans (eval_phase _ _ _)

def tableBound : PRCode 1 :=
  PRCode.composeBinary PRCode.multiplication length (PRCode.constant 1 phaseCount)

theorem eval_tableBound (machine : DeterministicTape.Machine) :
    PRCode.eval₁ tableBound (machineCode machine) = Compiler.haltAddress machine := by
  simp only [tableBound, eval₁_composeBinary, eval_length, eval₁_constant,
    PRCode.eval₂_multiplication, machineCode_eq_rows,
    PrimitiveRecursiveListCode.decode_encode, List.length_map, Compiler.haltAddress]

/-- The exact table code is generated by the closed bounded list tabulator. -/
def table : PRCode 1 :=
  PRCode.composeBinary (tabulateWithParameter tableEntry) (PRCode.projection 0) tableBound

end Program

theorem map_pointwise {α β : Type} (first second : α → β) (values : List α)
    (agree : ∀ value, first value = second value) : values.map first = values.map second := by
  induction values with
  | nil => rfl
  | cons value rest ih => rw [List.map_cons, List.map_cons, agree value, ih]

namespace Program

open PrimitiveRecursiveListCode.Program

theorem eval_table_machine (machine : DeterministicTape.Machine) :
    PRCode.eval₁ table (machineCode machine) = programCode (Compiler.compileMachine machine) := by
  rw [table, eval₁_composeBinary, eval₁_projection_zero, eval_tableBound,
    eval_tabulateWithParameter, programCode, Compiler.compileMachine,
    tabulate_eq_range_map, List.map_map]
  exact congrArg PrimitiveRecursiveListCode.encode
    (map_pointwise _ _ _ fun label => eval_tableEntry machine label)

/-- Every natural machine code is decoded using the established total numbering. -/
theorem eval_table (number : Nat) :
    PRCode.eval₁ table number = programCode (Compiler.compileMachine (machineDecode number)) := by
  have correct := eval_table_machine (machineDecode number)
  rw [machineCode_decode] at correct
  exact correct

def instanceTable : PRCode 1 :=
  PRCode.composeUnary table DeterministicTapeEncodingPrimitives.Program.machine

theorem eval_instanceTable (number : Nat) :
    PRCode.eval₁ instanceTable number =
      programCode (Compiler.compileMachine (instanceDecodeCode number).machine) := by
  rw [instanceTable, eval₁_composeUnary,
    DeterministicTapeEncodingPrimitives.Program.eval_machine, eval_table_machine]

end Program

theorem compileMachine_primitiveRecursive :
    PrimitiveRecursive (fun number => programCode (Compiler.compileMachine (machineDecode number))) :=
  ⟨Program.table, Program.eval_table⟩

theorem compileInstanceMachine_primitiveRecursive :
    PrimitiveRecursive (fun number => programCode (Compiler.compileMachine (instanceDecodeCode number).machine)) :=
  ⟨Program.instanceTable, Program.eval_instanceTable⟩

theorem compiledTable_decode (number : Nat) :
    programDecode? (PRCode.eval₁ Program.table number) =
      some (Compiler.compileMachine (machineDecode number)) := by
  rw [Program.eval_table, programDecode?_code]

theorem compiledInstanceTable_decode (number : Nat) :
    programDecode? (PRCode.eval₁ Program.instanceTable number) =
      some (Compiler.compileMachine (instanceDecodeCode number).machine) := by
  rw [Program.eval_instanceTable, programDecode?_code]

end PureSFormal.Computation.DeterministicTapeThreeCounterComputability
