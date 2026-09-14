import PureSFormal.Computation.DeterministicTapeStatePadding
import PureSFormal.Computation.CookEncodingComputability

/-!
# Closed code for source-state padding

The program computes the actual maximum of the existing table length, initial
state successor and every mentioned target successor, then appends precisely
the required undefined rows. The source numbering and both untouched instance
fields agree on every natural input. The padded encoder composes this transform
with the certified literal encoder.
-/

namespace PureSFormal.Computation.DeterministicTapeStatePaddingComputability

open PureSFormal.PureS
open PureSFormal.Research.ProtectedTrieDeterministicCompiler
open DeterministicTapeCode
open PrimitiveRecursiveListCode

namespace Program

open PrimitiveRecursiveListCode.Program
open DeterministicTapeThreeCounterComputability.Program
open ThreeCounterTagComputability.Program

def maximum : PRCode 2 := add (PRCode.projection 0) (sub (PRCode.projection 1) (PRCode.projection 0))

theorem eval_maximum (first second : Nat) :
    PRCode.eval₂ maximum first second = max first second := by
  simp only [maximum, eval_add, eval_sub, eval₂_projection_zero, eval₂_projection_one]
  rcases Nat.le_total first second with lower | upper
  · rw [Nat.max_eq_right lower, Nat.add_comm, Nat.sub_add_cancel lower]
  · rw [Nat.max_eq_left upper, Nat.sub_eq_zero_of_le upper, Nat.add_zero]

def ruleTarget : PRCode 2 :=
  ifZero (PRCode.projection 1) (lit 0)
    (add (div (div (pred (PRCode.projection 1)) (lit 2)) (lit 3)) (lit 1))

theorem eval_ruleTarget (rule : Option DeterministicTape.Rule) (first : Nat) :
    PRCode.eval₂ ruleTarget first (optionCode ruleCode rule) = DeterministicTapeStatePadding.ruleTargetBound rule := by
  simp only [ruleTarget, eval_ifZero, eval₂_projection_one, eval_lit, eval_add,
    eval_div, eval_pred]
  cases rule with
  | none => rfl
  | some rule =>
      simp only [optionCode, Nat.add_one_ne_zero, ↓reduceIte, Nat.add_sub_cancel]
      have next := congrArg (fun decoded => decoded.nextState) (ruleDecode_code rule)
      change ruleCode rule / 2 / 3 = rule.nextState at next
      rw [next]
      rfl

def rowTarget : PRCode 1 :=
  PRCode.composeBinary maximum
    (PRCode.composeBinary ruleTarget (PRCode.constant 1 0) PRCode.cantorLeft)
    (PRCode.composeBinary ruleTarget (PRCode.constant 1 0) PRCode.cantorRight)

theorem eval_rowTarget (row : DeterministicTape.StateRow) :
    PRCode.eval₁ rowTarget (stateRowCode row) = DeterministicTapeStatePadding.rowTargetBound row := by
  simp only [rowTarget, eval₁_composeBinary, eval₁_constant,
    eval₁_cantorLeft_eq_unpair_fst, eval₁_cantorRight_eq_unpair_snd,
    stateRowCode, Term.unpair_pair, eval_ruleTarget, eval_maximum]
  rfl

def tableStep : PRCode 2 :=
  PRCode.composeBinary maximum (PRCode.composeUnary rowTarget (PRCode.projection 1)) (PRCode.projection 0)

theorem eval_tableStep (previous : Nat) (row : DeterministicTape.StateRow) :
    PRCode.eval₂ tableStep previous (stateRowCode row) = max (DeterministicTapeStatePadding.rowTargetBound row) previous := by
  rw [tableStep, eval₂_composeBinary, eval₂_composeUnary, eval₂_projection_one,
    eval_rowTarget, eval₂_projection_zero, eval_maximum]

theorem fold_tableStep (rows : List DeterministicTape.StateRow) :
    (rows.map stateRowCode).reverse.foldl (PRCode.eval₂ tableStep) 0 =
      DeterministicTapeStatePadding.tableTargetBound rows := by
  induction rows with
  | nil => rfl
  | cons row rest ih =>
      rw [List.map_cons, List.reverse_cons, CookEncodingComputability.fold_append, ih]
      change PRCode.eval₂ tableStep (DeterministicTapeStatePadding.tableTargetBound rest) (stateRowCode row) = _
      rw [eval_tableStep]
      rfl

def tableTarget : PRCode 1 :=
  PRCode.composeBinary (fold tableStep) reverse (PRCode.constant 1 0)

theorem eval_tableTarget (machine : DeterministicTape.Machine) :
    PRCode.eval₁ tableTarget (machineCode machine) =
      DeterministicTapeStatePadding.tableTargetBound machine.states := by
  rw [tableTarget, eval₁_composeBinary, eval_reverse,
    DeterministicTapeThreeCounterComputability.machineCode_eq_rows, decode_encode,
    eval₁_constant, eval_fold_encode, fold_tableStep]

def sourceLength : PRCode 1 :=
  PRCode.composeUnary length DeterministicTapeEncodingPrimitives.Program.machine

theorem eval_sourceLength (number : Nat) :
    PRCode.eval₁ sourceLength number = (instanceDecodeCode number).machine.states.length := by
  rw [sourceLength, eval₁_composeUnary, DeterministicTapeEncodingPrimitives.Program.eval_machine,
    eval_length, DeterministicTapeThreeCounterComputability.machineCode_eq_rows,
    decode_encode, List.length_map]

def allocationSize : PRCode 1 :=
  PRCode.composeBinary maximum sourceLength
    (PRCode.composeBinary maximum
      (PRCode.composeUnary PRCode.successor DeterministicTapeEncodingPrimitives.Program.initialState)
      (PRCode.composeUnary tableTarget DeterministicTapeEncodingPrimitives.Program.machine))

theorem eval_allocationSize (number : Nat) :
    PRCode.eval₁ allocationSize number = DeterministicTapeStatePadding.allocationSize (instanceDecodeCode number) := by
  simp only [allocationSize, eval₁_composeBinary, eval_sourceLength, eval₁_composeUnary,
    DeterministicTapeEncodingPrimitives.Program.eval_initialState,
    DeterministicTapeEncodingPrimitives.Program.eval_machine, eval_tableTarget, eval_maximum]
  rfl

def paddedMachine : PRCode 1 :=
  PRCode.composeBinary append DeterministicTapeEncodingPrimitives.Program.machine
    (PRCode.composeBinary replicate (PRCode.constant 1 0)
      (PRCode.composeBinary PRCode.truncatedSubtraction allocationSize sourceLength))

theorem eval_paddedMachine (number : Nat) :
    PRCode.eval₁ paddedMachine number = machineCode (DeterministicTapeStatePadding.pad (instanceDecodeCode number)).machine := by
  simp only [paddedMachine, eval₁_composeBinary,
    DeterministicTapeEncodingPrimitives.Program.eval_machine, eval₁_constant,
    eval_allocationSize, eval_sourceLength, PRCode.eval₂_truncatedSubtraction,
    eval_replicate, eval_append, DeterministicTapeThreeCounterComputability.machineCode_eq_rows,
    decode_encode, DeterministicTapeStatePadding.pad, List.map_append, List.map_replicate]
  rfl

def pad : PRCode 1 :=
  PRCode.composeBinary PRCode.cantorPair paddedMachine
    (PRCode.composeBinary PRCode.cantorPair DeterministicTapeEncodingPrimitives.Program.initialState
      DeterministicTapeEncodingPrimitives.Program.input)

theorem eval_pad (number : Nat) :
    PRCode.eval₁ pad number = instanceCode (DeterministicTapeStatePadding.pad (instanceDecodeCode number)) := by
  simp only [pad, eval₁_composeBinary, eval_paddedMachine,
    DeterministicTapeEncodingPrimitives.Program.eval_initialState,
    DeterministicTapeEncodingPrimitives.Program.eval_input, eval₂_cantorPair_eq_termPair]
  rfl

def paddedBits : PRCode 1 := PRCode.composeUnary CookEncodingComputability.Program.sourceBits pad
def paddedTerm : PRCode 1 := PRCode.composeUnary CookEncodingComputability.Program.sourceTerm pad

theorem eval_paddedBits (number : Nat) :
    PRCode.eval₁ paddedBits number = bitListCode
      (DeterministicTapeCook.encodeBits (DeterministicTapeStatePadding.pad (instanceDecodeCode number))) := by
  rw [paddedBits, eval₁_composeUnary, eval_pad, CookEncodingComputability.Program.eval_sourceBits,
    instanceDecodeCode_code]

theorem eval_paddedTerm (number : Nat) :
    PRCode.eval₁ paddedTerm number =
      (DeterministicTapePureS.encodeTerm (DeterministicTapeStatePadding.pad (instanceDecodeCode number))).code := by
  rw [paddedTerm, eval₁_composeUnary, eval_pad, CookEncodingComputability.Program.eval_sourceTerm,
    instanceDecodeCode_code]

end Program

theorem pad_primitiveRecursive :
    PrimitiveRecursive (fun number => instanceCode (DeterministicTapeStatePadding.pad (instanceDecodeCode number))) :=
  ⟨Program.pad, Program.eval_pad⟩

theorem pad_decodes (number : Nat) :
    instanceDecodeCode (PRCode.eval₁ Program.pad number) = DeterministicTapeStatePadding.pad (instanceDecodeCode number) := by
  rw [Program.eval_pad, instanceDecodeCode_code]

theorem paddedTerm_primitiveRecursive :
    PrimitiveRecursive (fun number =>
      (DeterministicTapePureS.encodeTerm (DeterministicTapeStatePadding.pad (instanceDecodeCode number))).code) :=
  ⟨Program.paddedTerm, Program.eval_paddedTerm⟩

theorem paddedTerm_computable :
    PartialRecursive.Computable (fun number =>
      (DeterministicTapePureS.encodeTerm (DeterministicTapeStatePadding.pad (instanceDecodeCode number))).code) :=
  PrimitiveRecursive.computable paddedTerm_primitiveRecursive

theorem paddedTerm_decodes (number : Nat) :
    Term.decodeCodeTotal (PRCode.eval₁ Program.paddedTerm number) =
      DeterministicTapePureS.encodeTerm (DeterministicTapeStatePadding.pad (instanceDecodeCode number)) := by
  rw [Program.eval_paddedTerm, Term.decodeCodeTotal_code]

end PureSFormal.Computation.DeterministicTapeStatePaddingComputability
