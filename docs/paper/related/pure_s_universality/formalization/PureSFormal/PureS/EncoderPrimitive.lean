import PureSFormal.PureS.EncoderSize
import PureSFormal.PureS.ParserPrimitiveMachine

/-!
# Primitive construction of the literal pure-S input

The finite encoder stores its two live-cell codes and fixed dispatcher headers.
It reads the Boolean input once and allocates its application spine. A final
constructor copy materializes every occurrence in the resulting syntax tree,
including the fixed headers. Thus the bound also covers an output without
shared subtrees. Constructor observations, child reads, Boolean dispatch and
constructor allocation each cost one operation. Result records and execution
derivations are proof instrumentation.
-/

namespace PureSFormal.PureS.EncoderPrimitive

open ParserPrimitiveMachine (Result)

def cell : Bool → Term
  | false => live false
  | true => live true

theorem cell_value (bit : Bool) : cell bit = live bit := by
  cases bit <;> rfl

def wordOnto : List Bool → Term → Result Term
  | [], tail => ⟨tail, 1⟩
  | bit :: rest, tail =>
      let next := wordOnto rest (.app (cell bit) tail)
      ⟨next.value, next.operations + 5⟩

inductive WordExecution : List Bool → Term → Term → Nat → Prop where
  | nil (tail : Term) : WordExecution [] tail tail 1
  | cons {bit : Bool} {rest : List Bool} {tail output : Term} {operations : Nat}
      (next : WordExecution rest (.app (cell bit) tail) output operations) :
      WordExecution (bit :: rest) tail output (operations + 5)

theorem wordOnto_execution (bits : List Bool) (tail : Term) :
    WordExecution bits tail (wordOnto bits tail).value (wordOnto bits tail).operations := by
  induction bits generalizing tail with
  | nil => exact .nil tail
  | cons bit rest ih => exact .cons (ih _)

theorem wordOnto_value (bits : List Bool) (tail : Term) :
    (wordOnto bits tail).value = bits.foldl (fun acc bit => .app (live bit) acc) tail := by
  induction bits generalizing tail with
  | nil => rfl
  | cons bit rest ih => rw [wordOnto, ih, List.foldl_cons, cell_value]

theorem wordOnto_operations (bits : List Bool) (tail : Term) :
    (wordOnto bits tail).operations = 5 * bits.length + 1 := by
  induction bits generalizing tail with
  | nil => rfl
  | cons bit rest ih =>
      simp only [wordOnto, ih, List.length_cons, Nat.mul_succ,
        Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

structure Prepared where
  clockHead : Term
  dispatcherHead : Term

def prepare (actions : Term) : Prepared :=
  ⟨.app (C 0) (C 0), .app .s (actCode actions)⟩

def wrap (prepared : Prepared) (inputWord : Term) : Result Term :=
  ⟨.app prepared.clockHead
      (.app .s (.app prepared.dispatcherHead (.app .s inputWord))), 6⟩

theorem wrap_value (actions : Term) (bits : List Bool) :
    (wrap (prepare actions) (word bits)).value = generator actions bits := rfl

def sharedPrepared (prepared : Prepared) (bits : List Bool) : Result Term :=
  let inputWord := wordOnto bits .s
  let packed := wrap prepared inputWord.value
  ⟨packed.value, inputWord.operations + packed.operations⟩

inductive SharedExecution (prepared : Prepared) : List Bool → Term → Nat → Prop where
  | wrap {bits : List Bool} {inputWord : Term} {operations : Nat}
      (built : WordExecution bits .s inputWord operations) :
      SharedExecution prepared bits (wrap prepared inputWord).value (operations + 6)

theorem sharedPrepared_execution (prepared : Prepared) (bits : List Bool) :
    SharedExecution prepared bits (sharedPrepared prepared bits).value
      (sharedPrepared prepared bits).operations :=
  .wrap (wordOnto_execution bits .s)

theorem sharedPrepared_value (actions : Term) (bits : List Bool) :
    (sharedPrepared (prepare actions) bits).value = generator actions bits := by
  change (wrap (prepare actions) (wordOnto bits .s).value).value = _
  rw [wordOnto_value]
  exact wrap_value actions bits

theorem sharedPrepared_operations (prepared : Prepared) (bits : List Bool) :
    (sharedPrepared prepared bits).operations = 5 * bits.length + 7 := by
  change (wordOnto bits .s).operations + 6 = _
  rw [wordOnto_operations, Nat.add_assoc]

def copy : Term → Result Term
  | .s => ⟨.s, 2⟩
  | .app left right =>
      let copiedLeft := copy left
      let copiedRight := copy right
      ⟨.app copiedLeft.value copiedRight.value,
        copiedLeft.operations + copiedRight.operations + 4⟩

inductive CopyExecution : Term → Term → Nat → Prop where
  | leaf : CopyExecution .s .s 2
  | app {left right copiedLeft copiedRight : Term} {leftOperations rightOperations : Nat}
      (leftCopy : CopyExecution left copiedLeft leftOperations)
      (rightCopy : CopyExecution right copiedRight rightOperations) :
      CopyExecution (.app left right) (.app copiedLeft copiedRight)
        (leftOperations + rightOperations + 4)

theorem copy_execution (term : Term) :
    CopyExecution term (copy term).value (copy term).operations := by
  induction term with
  | s => exact .leaf
  | app left right ihLeft ihRight => exact .app ihLeft ihRight

theorem copy_value (term : Term) : (copy term).value = term := by
  induction term with
  | s => rfl
  | app left right ihLeft ihRight => simp only [copy, ihLeft, ihRight]

theorem copy_operations_le (term : Term) : (copy term).operations ≤ 4 * term.size := by
  induction term with
  | s => exact (by decide : 2 ≤ 4)
  | app left right ihLeft ihRight =>
      have bound := Nat.add_le_add_right (Nat.add_le_add ihLeft ihRight) 4
      simpa only [copy, Term.size, Nat.mul_succ, Nat.mul_add] using bound

def literalPrepared (prepared : Prepared) (bits : List Bool) : Result Term :=
  let shared := sharedPrepared prepared bits
  let output := copy shared.value
  ⟨output.value, shared.operations + output.operations⟩

/-- The fixed preparation occurs before the Boolean input is supplied. -/
def literal (actions : Term) : List Bool → Result Term :=
  let prepared := prepare actions
  fun bits => literalPrepared prepared bits

inductive LiteralExecution (prepared : Prepared) : List Bool → Term → Nat → Prop where
  | materialize {bits : List Bool} {shared output : Term} {sharedOperations copyOperations : Nat}
      (built : SharedExecution prepared bits shared sharedOperations)
      (copied : CopyExecution shared output copyOperations) :
      LiteralExecution prepared bits output (sharedOperations + copyOperations)

theorem literal_execution (actions : Term) (bits : List Bool) :
    LiteralExecution (prepare actions) bits (literal actions bits).value
      (literal actions bits).operations :=
  .materialize (sharedPrepared_execution (prepare actions) bits) (copy_execution _)

theorem literal_value (actions : Term) (bits : List Bool) :
    (literal actions bits).value = generator actions bits := by
  change (copy (sharedPrepared (prepare actions) bits).value).value = _
  rw [copy_value, sharedPrepared_value]

theorem literal_operations_le (actions : Term) (bits : List Bool) :
    (literal actions bits).operations ≤ 77 * bits.length + 4 * actions.size + 167 := by
  have copyBound := Nat.le_trans
    (copy_operations_le (sharedPrepared (prepare actions) bits).value)
    (Nat.mul_le_mul_left 4 (by
      rw [sharedPrepared_value]
      exact generator_size_le_eighteen actions bits))
  change (sharedPrepared (prepare actions) bits).operations +
    (copy (sharedPrepared (prepare actions) bits).value).operations ≤ _
  rw [sharedPrepared_operations]
  apply Nat.le_trans (Nat.add_le_add_left copyBound (5 * bits.length + 7))
  apply Nat.le_of_eq
  rw [encoderConstant, Nat.mul_add, Nat.mul_add, ← Nat.mul_assoc]
  change 5 * bits.length + 7 + (160 + 4 * actions.size + 72 * bits.length) =
    77 * bits.length + 4 * actions.size + 167
  rw [show 77 = 5 + 72 by rfl, Nat.add_mul, show 167 = 7 + 160 by rfl]
  simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

end PureSFormal.PureS.EncoderPrimitive
