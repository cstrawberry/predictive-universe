import PureSFormal.Computation.ThreeCounterTagComputability

/-!
# Closed code for the printed Rogozhin input

The finite program and data regions retain the printed separator, unary-weight,
reversal and blank-cell conventions of `RogozhinTagInput.compile`. Symbol lists
use the existing normalized values zero through five and canonical natural-list
coding. The compiled window has a four-field state/current/left/right record.
-/

namespace PureSFormal.Computation.RogozhinInputComputability

open PureSFormal.PureS
open PrimitiveRecursiveListCode

def wordCode (word : List Rogozhin46.Symbol) : Nat := encode (word.map Cook.machineSymbolValue)

def symbolDecode : Nat → Rogozhin46.Symbol
  | 0 => .s0 | 1 => .s1 | 2 => .s2 | 3 => .s3 | 4 => .s4 | _ => .s5

def stateCode : Rogozhin46.State → Nat
  | .A => 0 | .B => 1 | .C => 2 | .D => 3

def stateDecode : Nat → Rogozhin46.State
  | 0 => .A | 1 => .B | 2 => .C | _ => .D

def wordDecode (number : Nat) : List Rogozhin46.Symbol := (decode number).map symbolDecode

theorem map_symbolDecode (word : List Rogozhin46.Symbol) :
    (word.map Cook.machineSymbolValue).map symbolDecode = word := by
  induction word with
  | nil => rfl
  | cons symbol rest ih =>
      rw [List.map_cons, List.map_cons, ih]
      cases symbol <;> rfl

@[simp] theorem wordDecode_code (word : List Rogozhin46.Symbol) :
    wordDecode (wordCode word) = word := by
  rw [wordDecode, wordCode, decode_encode, map_symbolDecode]

def configCode (config : Rogozhin46.Config) : Nat :=
  encode [stateCode config.state, Cook.machineSymbolValue config.current,
    wordCode config.left, wordCode config.right]

def configDecode (number : Nat) : Rogozhin46.Config :=
  let fields := decode number
  ⟨stateDecode (fields.getD 0 0), symbolDecode (fields.getD 1 0),
    wordDecode (fields.getD 2 0), wordDecode (fields.getD 3 0)⟩

@[simp] theorem configDecode_code (config : Rogozhin46.Config) :
    configDecode (configCode config) = config := by
  cases config with
  | mk state current left right =>
      simp only [configDecode, configCode, decode_encode, List.getD_cons_zero, List.getD_cons_succ,
        wordDecode_code]
      cases state <;> cases current <;> rfl

theorem flatMap_codes (entry : Nat → Nat) (values : List Nat) :
    ((values.map entry).flatMap decode) = values.flatMap (fun value => decode (entry value)) := by
  induction values with
  | nil => rfl
  | cons value rest ih => rw [List.map_cons, List.flatMap_cons, List.flatMap_cons, ih]

namespace Program

open PrimitiveRecursiveListCode.Program
open DeterministicTapeThreeCounterComputability.Program
open ThreeCounterTagComputability.Program

def flatMapWithParameter (entry : PRCode 2) : PRCode 2 :=
  PRCode.composeUnary (flatMap PRCode.identity) (mapWithParameter entry)

theorem eval_flatMapWithParameter (entry : PRCode 2) (parameter number : Nat) :
    PRCode.eval₂ (flatMapWithParameter entry) parameter number =
      encode ((decode number).flatMap fun value => decode (PRCode.eval₂ entry parameter value)) := by
  rw [flatMapWithParameter, eval₂_composeUnary, eval_mapWithParameter, eval_flatMap, decode_encode]
  simp only [PRCode.eval_identity]
  rw [flatMap_codes]

def rowLength : PRCode 2 := PRCode.composeUnary length lookup

theorem eval_rowLength (program : RogozhinTagInput.Program) (label : Nat) :
    PRCode.eval₂ rowLength (DeletionTwoT2Computability.programCode program) label =
      (RogozhinTagInput.productionAt program label).length := by
  rw [rowLength, eval₂_composeUnary, eval_lookup, DeletionTwoT2Computability.programCode, decode_encode]
  have lookupRow : (program.productions.map encode).getD label 0 =
      encode (program.productions.getD label []) := by
    generalize program.productions = rows
    induction rows generalizing label with
    | nil => rfl
    | cons row rest ih => cases label with
        | zero => rfl
        | succ label => exact ih label
  rw [lookupRow, eval_length, decode_encode]
  rfl

def weightStep : PRCode 3 :=
  PRCode.composeBinary PRCode.addition (PRCode.projection 2)
    (PRCode.composeBinary PRCode.multiplication (PRCode.constant 3 2)
      (PRCode.composeBinary rowLength (PRCode.projection 0) (PRCode.projection 1)))

theorem eval_weightStep (number label previous : Nat) :
    PRCode.eval weightStep [number, label, previous] =
      previous + 2 * PRCode.eval₂ rowLength number label := by
  simp only [weightStep, PRCode.eval_composeBinary, PRCode.eval_constant]
  change PRCode.eval₂ PRCode.addition previous
    (PRCode.eval₂ PRCode.multiplication 2 (PRCode.eval₂ rowLength number label)) = _
  rw [PRCode.eval₂_addition, PRCode.eval₂_multiplication]

def weight : PRCode 2 := .recursion (PRCode.constant 1 1) weightStep

theorem eval_weight (program : RogozhinTagInput.Program) (label : Nat) :
    PRCode.eval₂ weight (DeletionTwoT2Computability.programCode program) label =
      RogozhinTagInput.weight program label := by
  induction label with
  | zero => exact eval₁_constant _ _
  | succ label ih =>
      change PRCode.eval weightStep [DeletionTwoT2Computability.programCode program, label,
        PRCode.eval₂ weight (DeletionTwoT2Computability.programCode program) label] = _
      rw [eval_weightStep, ih, eval_rowLength]
      rfl

def size : PRCode 2 := PRCode.composeUnary length (PRCode.projection 0)
def distinguishedWeight : PRCode 2 := withControl weight (pred size)

theorem eval_size (program : RogozhinTagInput.Program) (second : Nat) :
    PRCode.eval₂ size (DeletionTwoT2Computability.programCode program) second = RogozhinTagInput.symbolCount program :=
  DeletionTwoT2Computability.Program.eval_size program second

theorem eval_distinguishedWeight (program : RogozhinTagInput.Program) (second : Nat) :
    PRCode.eval₂ distinguishedWeight (DeletionTwoT2Computability.programCode program) second =
      RogozhinTagInput.weight program (RogozhinTagInput.distinguished program) := by
  rw [distinguishedWeight, eval_withControl, eval_pred, eval_size, eval_weight]
  rfl

def productionExponents : PRCode 2 :=
  appendCode
    (PRCode.composeBinary (mapWithParameter weight) (PRCode.projection 0)
      (PRCode.composeUnary reverse (PRCode.composeBinary drop lookup (lit 2))))
    (cell distinguishedWeight (cell (sub distinguishedWeight weight) (lit 0)))

theorem eval_productionLookup (program : RogozhinTagInput.Program) (label : Nat) :
    PRCode.eval₂ lookup (DeletionTwoT2Computability.programCode program) label =
      encode (RogozhinTagInput.productionAt program label) := by
  rw [eval_lookup, DeletionTwoT2Computability.programCode, decode_encode]
  unfold RogozhinTagInput.productionAt
  generalize program.productions = rows
  induction rows generalizing label with
  | nil => rfl
  | cons row rest ih => cases label with
      | zero => rfl
      | succ label => exact ih label

theorem eval_productionExponents (program : RogozhinTagInput.Program) (label : Nat) :
    PRCode.eval₂ productionExponents (DeletionTwoT2Computability.programCode program) label =
      encode (RogozhinTagInput.productionExponents program label) := by
  simp only [productionExponents, eval_appendCode, eval₂_composeBinary, eval₂_projection_zero,
    eval₂_composeUnary, eval_productionLookup, eval_lit, eval_drop, decode_encode,
    eval_reverse, eval_mapWithParameter, eval_cell, eval_distinguishedWeight, eval_sub, eval_weight]
  have mapped : ((RogozhinTagInput.productionAt program label).drop 2).reverse.map
      (PRCode.eval₂ weight (DeletionTwoT2Computability.programCode program)) =
      ((RogozhinTagInput.productionAt program label).drop 2).reverse.map (RogozhinTagInput.weight program) :=
    DeterministicTapeThreeCounterComputability.map_pointwise _ _ _ (eval_weight program)
  rw [mapped]
  change encode (_ ++ decode (encode [_ , _])) = _
  rw [decode_encode]
  rfl

def exponentTail : PRCode 1 :=
  PRCode.composeBinary cons (PRCode.constant 1 1)
    (PRCode.composeBinary cons (PRCode.constant 1 1)
      (PRCode.composeBinary replicate (PRCode.constant 1 0) (PRCode.projection 0)))

theorem eval_exponentTail (exponent : Nat) :
    PRCode.eval₁ exponentTail exponent = wordCode ([.s1, .s1] ++ RogozhinTagInput.ones exponent) := by
  simp only [exponentTail, eval₁_composeBinary, eval₁_constant, eval₁_projection_zero,
    eval_replicate, eval_cons, wordCode, List.map_append, RogozhinTagInput.ones, List.map_replicate]
  rfl

def exponentCode : PRCode 1 :=
  PRCode.composeTernary PRCode.branchIfZero (PRCode.constant 1 0)
    (PRCode.composeBinary cons (PRCode.constant 1 1)
      (PRCode.composeBinary append
        (PRCode.composeBinary replicate (PRCode.constant 1 0) head)
        (PRCode.composeUnary (flatMap exponentTail) tail)))
    (PRCode.projection 0)

theorem flatMap_exponentTail (values : List Nat) :
    values.flatMap (fun value => decode (PRCode.eval₁ exponentTail value)) =
      (values.flatMap fun value => [.s1, .s1] ++ RogozhinTagInput.ones value).map Cook.machineSymbolValue := by
  induction values with
  | nil => rfl
  | cons value rest ih =>
      rw [List.flatMap_cons, List.flatMap_cons, eval_exponentTail, wordCode, decode_encode, List.map_append, ih]
      simp only [List.map_append]

theorem eval_exponentCode (exponents : List Nat) :
    PRCode.eval₁ exponentCode (encode exponents) = wordCode (RogozhinTagInput.exponentCode exponents) := by
  rw [exponentCode, eval₁_composeTernary, eval₁_constant, eval₁_projection_zero, PRCode.eval_branchIfZero]
  cases exponents with
  | nil => rfl
  | cons exponent rest =>
      have nonzero : encode (exponent :: rest) ≠ 0 := Nat.add_one_ne_zero _
      rw [if_neg nonzero]
      simp only [eval₁_composeBinary, eval₁_constant, eval_cons, eval₁_composeUnary,
        eval_head_encode, eval_tail_encode, eval_replicate, eval_flatMap, decode_encode,
        flatMap_exponentTail, eval_append, wordCode, decode_encode,
        RogozhinTagInput.exponentCode, List.map_cons, List.map_append,
        RogozhinTagInput.ones, List.map_replicate]
      rfl

def productionCode : PRCode 2 :=
  cell (lit 1) (cell (lit 0) (PRCode.composeUnary exponentCode productionExponents))

theorem eval_productionCode (program : RogozhinTagInput.Program) (label : Nat) :
    PRCode.eval₂ productionCode (DeletionTwoT2Computability.programCode program) label =
      wordCode (RogozhinTagInput.productionCode program label) := by
  rw [productionCode, eval_cell, eval_lit, eval_cell, eval_lit, eval₂_composeUnary,
    eval_productionExponents, eval_exponentCode]
  rfl

def programCode : PRCode 1 :=
  PRCode.composeBinary append (PRCode.constant 1 (encode [3, 1]))
    (PRCode.composeBinary append
      (PRCode.composeBinary (flatMapWithParameter productionCode) (PRCode.projection 0)
        (PRCode.composeUnary reverse (PRCode.composeUnary range length)))
      (PRCode.constant 1 (encode [1])))

theorem flatMap_productionCode (program : RogozhinTagInput.Program) (labels : List Nat) :
    labels.flatMap (fun label => decode (PRCode.eval₂ productionCode
      (DeletionTwoT2Computability.programCode program) label)) =
      (labels.flatMap (RogozhinTagInput.productionCode program)).map Cook.machineSymbolValue := by
  induction labels with
  | nil => rfl
  | cons label rest ih =>
      rw [List.flatMap_cons, List.flatMap_cons, eval_productionCode, wordCode,
        decode_encode, List.map_append, ih]

theorem eval_programCode (program : RogozhinTagInput.Program) :
    PRCode.eval₁ programCode (DeletionTwoT2Computability.programCode program) =
      wordCode (RogozhinTagInput.programCode program) := by
  simp only [programCode, eval₁_composeBinary, eval₁_constant, eval₁_projection_zero,
    eval₁_composeUnary, DeletionTwoT2Computability.programCode, eval_length, decode_encode,
    List.length_map, eval_range, eval_reverse, eval_flatMapWithParameter]
  have flattened := flatMap_productionCode program (List.range program.productions.length).reverse
  dsimp only [DeletionTwoT2Computability.programCode] at flattened
  rw [flattened]
  simp only [eval_append, decode_encode, wordCode, RogozhinTagInput.programCode,
    RogozhinTagInput.symbolCount, List.map_append, List.append_assoc]
  rfl

def dataTailEntry : PRCode 2 := cell (lit 5) (repeatCode (lit 0) weight)
def dataTail : PRCode 2 := flatMapWithParameter dataTailEntry

theorem eval_dataTailEntry (program : RogozhinTagInput.Program) (label : Nat) :
    PRCode.eval₂ dataTailEntry (DeletionTwoT2Computability.programCode program) label =
      wordCode (.s5 :: RogozhinTagInput.ones (RogozhinTagInput.weight program label)) := by
  rw [dataTailEntry, eval_cell, eval_lit, eval_repeatCode, eval_lit, eval_weight]
  simp only [wordCode, List.map_cons, RogozhinTagInput.ones, List.map_replicate]
  rfl

theorem flatMap_dataTailEntry (program : RogozhinTagInput.Program) (labels : List Nat) :
    labels.flatMap (fun label => decode (PRCode.eval₂ dataTailEntry
      (DeletionTwoT2Computability.programCode program) label)) =
      (RogozhinTagInput.dataTail program labels).map Cook.machineSymbolValue := by
  induction labels with
  | nil => rfl
  | cons label rest ih =>
      rw [List.flatMap_cons, eval_dataTailEntry, wordCode, decode_encode, ih]
      simp only [RogozhinTagInput.dataTail, List.map_cons, List.map_append, List.cons_append]

theorem eval_dataTail (program : RogozhinTagInput.Program) (labels : List Nat) :
    PRCode.eval₂ dataTail (DeletionTwoT2Computability.programCode program) (encode labels) =
      wordCode (RogozhinTagInput.dataTail program labels) := by
  rw [dataTail, eval_flatMapWithParameter, decode_encode, flatMap_dataTailEntry]
  rfl

def dataCode : PRCode 2 :=
  ifZero (PRCode.projection 1) (lit 0)
    (appendCode
      (repeatCode (lit 0) (withControl weight (PRCode.composeUnary head (PRCode.projection 1))))
      (PRCode.composeBinary dataTail (PRCode.projection 0)
        (PRCode.composeUnary tail (PRCode.projection 1))))

theorem eval_dataCode (program : RogozhinTagInput.Program) (labels : List Nat) :
    PRCode.eval₂ dataCode (DeletionTwoT2Computability.programCode program) (encode labels) =
      wordCode (RogozhinTagInput.dataCode program labels) := by
  rw [dataCode, eval_ifZero, eval₂_projection_one]
  cases labels with
  | nil => exact eval_lit _ _ _
  | cons label rest =>
      have nonzero : encode (label :: rest) ≠ 0 := Nat.add_one_ne_zero _
      rw [if_neg nonzero]
      simp only [eval_appendCode, eval_repeatCode, eval_lit, eval_withControl,
        eval₂_composeUnary, eval₂_projection_one, eval_head_encode, eval_weight,
        eval₂_composeBinary, eval₂_projection_zero, eval_tail_encode, eval_dataTail,
        wordCode, decode_encode, RogozhinTagInput.dataCode, RogozhinTagInput.ones,
        List.map_append, List.map_replicate]
      rfl

def compileParts : PRCode 2 :=
  cell (lit 0)
    (cell (ifZero (PRCode.projection 1) (lit 4) (PRCode.composeUnary head (PRCode.projection 1)))
      (cell (PRCode.projection 0) (cell (PRCode.composeUnary tail (PRCode.projection 1)) (lit 0))))

theorem eval_compileParts (left data : List Rogozhin46.Symbol) :
    PRCode.eval₂ compileParts (wordCode left) (wordCode data) = configCode
      (match data with
      | [] => ⟨.A, .s4, left, []⟩
      | current :: right => ⟨.A, current, left, right⟩) := by
  simp only [compileParts, eval_cell, eval_lit, eval_ifZero, eval₂_projection_one,
    eval₂_projection_zero, eval₂_composeUnary]
  cases data with
  | nil =>
      change _ = encode [0, 4, wordCode left, 0]
      rw [show wordCode [] = encode [] from rfl, eval_tail_encode]
      rfl
  | cons current right =>
      have nonzero : wordCode (current :: right) ≠ 0 := Nat.add_one_ne_zero _
      rw [if_neg nonzero]
      simp only [wordCode, List.map_cons, eval_head_encode, eval_tail_encode]
      rfl

def compile : PRCode 1 :=
  PRCode.composeBinary compileParts
    (PRCode.composeUnary reverse (PRCode.composeUnary programCode PRCode.cantorLeft))
    (PRCode.composeBinary dataCode PRCode.cantorLeft PRCode.cantorRight)

theorem eval_compile_code (job : RogozhinTagInput.Job) :
    PRCode.eval₁ compile (DeletionTwoT2Computability.jobCode job) = configCode (RogozhinTagInput.compile job) := by
  simp only [compile, eval₁_composeBinary, eval₁_composeUnary,
    DeterministicTapeCode.eval₁_cantorLeft_eq_unpair_fst,
    DeterministicTapeCode.eval₁_cantorRight_eq_unpair_snd,
    DeletionTwoT2Computability.jobCode, Term.unpair_pair, eval_programCode, eval_dataCode]
  have reversed : PRCode.eval₁ reverse (wordCode (RogozhinTagInput.programCode job.program)) =
      wordCode (RogozhinTagInput.programCode job.program).reverse := by
    rw [eval_reverse, wordCode, decode_encode, wordCode, List.map_reverse]
  rw [reversed, eval_compileParts]
  rfl

theorem eval_compile (number : Nat) :
    PRCode.eval₁ compile number = configCode (RogozhinTagInput.compile (DeletionTwoT2Computability.jobDecode number)) := by
  have correct := eval_compile_code (DeletionTwoT2Computability.jobDecode number)
  rw [DeletionTwoT2Computability.jobCode_decode] at correct
  exact correct

end Program

theorem compile_primitiveRecursive :
    PrimitiveRecursive (fun number =>
      configCode (RogozhinTagInput.compile (DeletionTwoT2Computability.jobDecode number))) :=
  ⟨Program.compile, Program.eval_compile⟩

theorem compiledInput_decode (number : Nat) :
    configDecode (PRCode.eval₁ Program.compile number) =
      RogozhinTagInput.compile (DeletionTwoT2Computability.jobDecode number) := by
  rw [Program.eval_compile, configDecode_code]

end PureSFormal.Computation.RogozhinInputComputability
