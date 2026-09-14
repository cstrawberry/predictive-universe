import PureSFormal.Computation.CookEncodingComputability
import PureSFormal.PureS.ParserNatPrimitive

/-!
# Primitive construction of Cook's canonical Boolean input

Naturals are unary constructor chains, and list tails are immutable references.
The measured evaluator allocates every output cell. Its fixed 114-symbol
codebook belongs to the finite encoder program; selecting a block reads the
symbol's constructors, then measured copying materializes its Boolean cells.
The cost counter and execution certificates are proof instrumentation.
-/

namespace PureSFormal.Computation.CookWordConstructionMachine

open PureSFormal.PureS.ParserPrimitiveMachine (Result)
open PureSFormal.PureS
open Cook.PassClassification

def replicateOnto {α : Type} (value : α) : Nat → List α → Result (List α)
  | 0, tail => ⟨tail, 1⟩
  | .succ count, tail =>
      let rest := replicateOnto value count tail
      ⟨value :: rest.value, 4 + rest.operations⟩

inductive ReplicateExecution {α : Type} (value : α) : Nat → List α → List α → Nat → Prop where
  | zero (tail : List α) : ReplicateExecution value 0 tail tail 1
  | succ {count operations : Nat} {tail output : List α}
      (rest : ReplicateExecution value count tail output operations) :
      ReplicateExecution value (count + 1) tail (value :: output) (4 + operations)

theorem replicateOnto_execution {α : Type} (value : α) (count : Nat) (tail : List α) :
    ReplicateExecution value count tail (replicateOnto value count tail).value
      (replicateOnto value count tail).operations := by
  induction count with
  | zero => exact .zero tail
  | succ count ih => exact .succ ih

theorem replicateOnto_value {α : Type} (value : α) (count : Nat) (tail : List α) :
    (replicateOnto value count tail).value = List.replicate count value ++ tail := by
  induction count with
  | zero => rfl
  | succ count ih => simp only [replicateOnto, List.replicate_succ, List.cons_append, ih]

theorem replicateOnto_operations {α : Type} (value : α) (count : Nat) (tail : List α) :
    (replicateOnto value count tail).operations = 4 * count + 1 := by
  induction count with
  | zero => rfl
  | succ count ih => simp only [replicateOnto, ih, Nat.mul_succ, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

def fixedBlock : Cook.TagSymbol → List Bool
  | .head .A => Cook.oneHot (.head .A)
  | .head .B => Cook.oneHot (.head .B)
  | .head .C => Cook.oneHot (.head .C)
  | .head .D => Cook.oneHot (.head .D)
  | .left .A => Cook.oneHot (.left .A)
  | .left .B => Cook.oneHot (.left .B)
  | .left .C => Cook.oneHot (.left .C)
  | .left .D => Cook.oneHot (.left .D)
  | .right .A => Cook.oneHot (.right .A)
  | .right .B => Cook.oneHot (.right .B)
  | .right .C => Cook.oneHot (.right .C)
  | .right .D => Cook.oneHot (.right .D)
  | .rightStar .A => Cook.oneHot (.rightStar .A)
  | .rightStar .B => Cook.oneHot (.rightStar .B)
  | .rightStar .C => Cook.oneHot (.rightStar .C)
  | .rightStar .D => Cook.oneHot (.rightStar .D)
  | .indexed .H .A .j1 => Cook.oneHot (.indexed .H .A .j1)
  | .indexed .H .A .j2 => Cook.oneHot (.indexed .H .A .j2)
  | .indexed .H .A .j3 => Cook.oneHot (.indexed .H .A .j3)
  | .indexed .H .A .j4 => Cook.oneHot (.indexed .H .A .j4)
  | .indexed .H .A .j5 => Cook.oneHot (.indexed .H .A .j5)
  | .indexed .H .A .j6 => Cook.oneHot (.indexed .H .A .j6)
  | .indexed .H .A .j7 => Cook.oneHot (.indexed .H .A .j7)
  | .indexed .H .A .j8 => Cook.oneHot (.indexed .H .A .j8)
  | .indexed .H .B .j1 => Cook.oneHot (.indexed .H .B .j1)
  | .indexed .H .B .j2 => Cook.oneHot (.indexed .H .B .j2)
  | .indexed .H .B .j3 => Cook.oneHot (.indexed .H .B .j3)
  | .indexed .H .B .j4 => Cook.oneHot (.indexed .H .B .j4)
  | .indexed .H .B .j5 => Cook.oneHot (.indexed .H .B .j5)
  | .indexed .H .B .j6 => Cook.oneHot (.indexed .H .B .j6)
  | .indexed .H .B .j7 => Cook.oneHot (.indexed .H .B .j7)
  | .indexed .H .B .j8 => Cook.oneHot (.indexed .H .B .j8)
  | .indexed .H .C .j1 => Cook.oneHot (.indexed .H .C .j1)
  | .indexed .H .C .j2 => Cook.oneHot (.indexed .H .C .j2)
  | .indexed .H .C .j3 => Cook.oneHot (.indexed .H .C .j3)
  | .indexed .H .C .j4 => Cook.oneHot (.indexed .H .C .j4)
  | .indexed .H .C .j5 => Cook.oneHot (.indexed .H .C .j5)
  | .indexed .H .C .j6 => Cook.oneHot (.indexed .H .C .j6)
  | .indexed .H .C .j7 => Cook.oneHot (.indexed .H .C .j7)
  | .indexed .H .C .j8 => Cook.oneHot (.indexed .H .C .j8)
  | .indexed .H .D .j1 => Cook.oneHot (.indexed .H .D .j1)
  | .indexed .H .D .j2 => Cook.oneHot (.indexed .H .D .j2)
  | .indexed .H .D .j3 => Cook.oneHot (.indexed .H .D .j3)
  | .indexed .H .D .j4 => Cook.oneHot (.indexed .H .D .j4)
  | .indexed .H .D .j5 => Cook.oneHot (.indexed .H .D .j5)
  | .indexed .H .D .j6 => Cook.oneHot (.indexed .H .D .j6)
  | .indexed .H .D .j7 => Cook.oneHot (.indexed .H .D .j7)
  | .indexed .H .D .j8 => Cook.oneHot (.indexed .H .D .j8)
  | .indexed .L .A .j1 => Cook.oneHot (.indexed .L .A .j1)
  | .indexed .L .A .j2 => Cook.oneHot (.indexed .L .A .j2)
  | .indexed .L .A .j3 => Cook.oneHot (.indexed .L .A .j3)
  | .indexed .L .A .j4 => Cook.oneHot (.indexed .L .A .j4)
  | .indexed .L .A .j5 => Cook.oneHot (.indexed .L .A .j5)
  | .indexed .L .A .j6 => Cook.oneHot (.indexed .L .A .j6)
  | .indexed .L .A .j7 => Cook.oneHot (.indexed .L .A .j7)
  | .indexed .L .A .j8 => Cook.oneHot (.indexed .L .A .j8)
  | .indexed .L .B .j1 => Cook.oneHot (.indexed .L .B .j1)
  | .indexed .L .B .j2 => Cook.oneHot (.indexed .L .B .j2)
  | .indexed .L .B .j3 => Cook.oneHot (.indexed .L .B .j3)
  | .indexed .L .B .j4 => Cook.oneHot (.indexed .L .B .j4)
  | .indexed .L .B .j5 => Cook.oneHot (.indexed .L .B .j5)
  | .indexed .L .B .j6 => Cook.oneHot (.indexed .L .B .j6)
  | .indexed .L .B .j7 => Cook.oneHot (.indexed .L .B .j7)
  | .indexed .L .B .j8 => Cook.oneHot (.indexed .L .B .j8)
  | .indexed .L .C .j1 => Cook.oneHot (.indexed .L .C .j1)
  | .indexed .L .C .j2 => Cook.oneHot (.indexed .L .C .j2)
  | .indexed .L .C .j3 => Cook.oneHot (.indexed .L .C .j3)
  | .indexed .L .C .j4 => Cook.oneHot (.indexed .L .C .j4)
  | .indexed .L .C .j5 => Cook.oneHot (.indexed .L .C .j5)
  | .indexed .L .C .j6 => Cook.oneHot (.indexed .L .C .j6)
  | .indexed .L .C .j7 => Cook.oneHot (.indexed .L .C .j7)
  | .indexed .L .C .j8 => Cook.oneHot (.indexed .L .C .j8)
  | .indexed .L .D .j1 => Cook.oneHot (.indexed .L .D .j1)
  | .indexed .L .D .j2 => Cook.oneHot (.indexed .L .D .j2)
  | .indexed .L .D .j3 => Cook.oneHot (.indexed .L .D .j3)
  | .indexed .L .D .j4 => Cook.oneHot (.indexed .L .D .j4)
  | .indexed .L .D .j5 => Cook.oneHot (.indexed .L .D .j5)
  | .indexed .L .D .j6 => Cook.oneHot (.indexed .L .D .j6)
  | .indexed .L .D .j7 => Cook.oneHot (.indexed .L .D .j7)
  | .indexed .L .D .j8 => Cook.oneHot (.indexed .L .D .j8)
  | .indexed .R .A .j1 => Cook.oneHot (.indexed .R .A .j1)
  | .indexed .R .A .j2 => Cook.oneHot (.indexed .R .A .j2)
  | .indexed .R .A .j3 => Cook.oneHot (.indexed .R .A .j3)
  | .indexed .R .A .j4 => Cook.oneHot (.indexed .R .A .j4)
  | .indexed .R .A .j5 => Cook.oneHot (.indexed .R .A .j5)
  | .indexed .R .A .j6 => Cook.oneHot (.indexed .R .A .j6)
  | .indexed .R .A .j7 => Cook.oneHot (.indexed .R .A .j7)
  | .indexed .R .A .j8 => Cook.oneHot (.indexed .R .A .j8)
  | .indexed .R .B .j1 => Cook.oneHot (.indexed .R .B .j1)
  | .indexed .R .B .j2 => Cook.oneHot (.indexed .R .B .j2)
  | .indexed .R .B .j3 => Cook.oneHot (.indexed .R .B .j3)
  | .indexed .R .B .j4 => Cook.oneHot (.indexed .R .B .j4)
  | .indexed .R .B .j5 => Cook.oneHot (.indexed .R .B .j5)
  | .indexed .R .B .j6 => Cook.oneHot (.indexed .R .B .j6)
  | .indexed .R .B .j7 => Cook.oneHot (.indexed .R .B .j7)
  | .indexed .R .B .j8 => Cook.oneHot (.indexed .R .B .j8)
  | .indexed .R .C .j1 => Cook.oneHot (.indexed .R .C .j1)
  | .indexed .R .C .j2 => Cook.oneHot (.indexed .R .C .j2)
  | .indexed .R .C .j3 => Cook.oneHot (.indexed .R .C .j3)
  | .indexed .R .C .j4 => Cook.oneHot (.indexed .R .C .j4)
  | .indexed .R .C .j5 => Cook.oneHot (.indexed .R .C .j5)
  | .indexed .R .C .j6 => Cook.oneHot (.indexed .R .C .j6)
  | .indexed .R .C .j7 => Cook.oneHot (.indexed .R .C .j7)
  | .indexed .R .C .j8 => Cook.oneHot (.indexed .R .C .j8)
  | .indexed .R .D .j1 => Cook.oneHot (.indexed .R .D .j1)
  | .indexed .R .D .j2 => Cook.oneHot (.indexed .R .D .j2)
  | .indexed .R .D .j3 => Cook.oneHot (.indexed .R .D .j3)
  | .indexed .R .D .j4 => Cook.oneHot (.indexed .R .D .j4)
  | .indexed .R .D .j5 => Cook.oneHot (.indexed .R .D .j5)
  | .indexed .R .D .j6 => Cook.oneHot (.indexed .R .D .j6)
  | .indexed .R .D .j7 => Cook.oneHot (.indexed .R .D .j7)
  | .indexed .R .D .j8 => Cook.oneHot (.indexed .R .D .j8)
  | .dummy1 => Cook.oneHot .dummy1
  | .dummy2 => Cook.oneHot .dummy2

theorem fixedBlock_value (symbol : Cook.TagSymbol) : fixedBlock symbol = Cook.oneHot symbol := by
  cases symbol with
  | head state => cases state <;> rfl
  | left state => cases state <;> rfl
  | right state => cases state <;> rfl
  | rightStar state => cases state <;> rfl
  | indexed family state index => cases family <;> cases state <;> cases index <;> rfl
  | dummy1 => rfl
  | dummy2 => rfl

inductive Primitive where
  | observe | readChild | branch | allocateCons | allocateNil
  deriving DecidableEq, Repr

/-- Constructor observations and child-reference reads in the finite dispatch. -/
def selectionTrace : Cook.TagSymbol → List Primitive
  | .head _ | .left _ | .right _ | .rightStar _ => [.observe, .readChild, .observe]
  | .indexed _ _ _ => [.observe, .readChild, .readChild, .readChild, .observe, .observe, .observe]
  | .dummy1 | .dummy2 => [.observe]

def selectOperations (symbol : Cook.TagSymbol) : Nat := (selectionTrace symbol).length

theorem selectOperations_le (symbol : Cook.TagSymbol) : selectOperations symbol ≤ 7 := by
  cases symbol <;> simp only [selectOperations, selectionTrace] <;> decide

inductive CopyExecution : List Bool → List Bool → List Bool → Nat → Prop where
  | nil (tail : List Bool) : CopyExecution [] tail tail 1
  | cons {bit : Bool} {rest tail output : List Bool} {operations : Nat}
      (copied : CopyExecution rest tail output operations) :
      CopyExecution (bit :: rest) tail (bit :: output) (4 + operations)

theorem append_execution (block tail : List Bool) :
    CopyExecution block tail (ParserPrimitiveMachine.append block tail).value
      (ParserPrimitiveMachine.append block tail).operations := by
  induction block with
  | nil => exact .nil tail
  | cons bit rest ih => exact .cons ih

def encodeOnto : List Cook.TagSymbol → List Bool → Result (List Bool)
  | [], tail => ⟨tail, 1⟩
  | symbol :: rest, tail =>
      let following := encodeOnto rest tail
      let copied := ParserPrimitiveMachine.append (fixedBlock symbol) following.value
      ⟨copied.value, 3 + selectOperations symbol + following.operations + copied.operations⟩

inductive EncodingExecution : List Cook.TagSymbol → List Bool → List Bool → Nat → Prop where
  | nil (tail : List Bool) : EncodingExecution [] tail tail 1
  | cons {symbol : Cook.TagSymbol} {rest : List Cook.TagSymbol}
      {tail following output : List Bool} {restOperations copyOperations : Nat}
      (next : EncodingExecution rest tail following restOperations)
      (copied : CopyExecution (fixedBlock symbol) following output copyOperations) :
      EncodingExecution (symbol :: rest) tail output
        (3 + selectOperations symbol + restOperations + copyOperations)

theorem encodeOnto_execution (word : List Cook.TagSymbol) (tail : List Bool) :
    EncodingExecution word tail (encodeOnto word tail).value (encodeOnto word tail).operations := by
  induction word with
  | nil => exact .nil tail
  | cons symbol rest ih => exact .cons ih (append_execution _ _)

theorem encodeOnto_value (word : List Cook.TagSymbol) (tail : List Bool) :
    (encodeOnto word tail).value = Cook.encodeWord word ++ tail := by
  induction word with
  | nil => rfl
  | cons symbol rest ih =>
      rw [encodeOnto, ParserPrimitiveMachine.append_value, fixedBlock_value, ih,
        Cook.encodeWord_cons, List.append_assoc]

theorem encodeOnto_operations_le (word : List Cook.TagSymbol) (tail : List Bool) :
    (encodeOnto word tail).operations ≤ 467 * word.length + 1 := by
  induction word with
  | nil => exact Nat.le_refl _
  | cons symbol rest ih =>
      change 3 + selectOperations symbol + (encodeOnto rest tail).operations +
        (ParserPrimitiveMachine.append (fixedBlock symbol) (encodeOnto rest tail).value).operations ≤ _
      rw [ParserPrimitiveMachine.append_operations, fixedBlock_value, Cook.oneHot_length]
      have bound := Nat.add_le_add_right (Nat.add_le_add
        (Nat.add_le_add_left (selectOperations_le symbol) 3) ih) (4 * Cook.alphabetSize + 1)
      simp only [Cook.alphabetSize, List.length_cons, Nat.mul_succ] at bound ⊢
      apply Nat.le_trans bound
      apply Nat.le_of_eq
      calc
        3 + 7 + (467 * rest.length + 1) + (4 * 114 + 1) =
            467 * rest.length + (3 + 7 + (4 * 114 + 1)) + 1 := by simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm, Nat.mul_assoc, Nat.mul_comm, Nat.mul_left_comm]
        _ = 467 * rest.length + 467 + 1 := rfl

/-- The initial empty output list is allocated once. -/
def encodeWord (word : List Cook.TagSymbol) : Result (List Bool) :=
  let result := encodeOnto word []
  ⟨result.value, 1 + result.operations⟩

theorem encodeWord_value (word : List Cook.TagSymbol) :
    (encodeWord word).value = Cook.encodeWord word := by
  rw [encodeWord, encodeOnto_value, List.append_nil]

theorem encodeWord_operations_le (word : List Cook.TagSymbol) :
    (encodeWord word).operations ≤ 467 * word.length + 2 := by
  have bound := Nat.add_le_add_left (encodeOnto_operations_le word []) 1
  change 1 + (encodeOnto word []).operations ≤ _
  apply Nat.le_trans bound
  apply Nat.le_of_eq
  calc
    1 + (467 * word.length + 1) = 467 * word.length + (1 + 1) := by simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm, Nat.mul_assoc, Nat.mul_comm, Nat.mul_left_comm]
    _ = 467 * word.length + 2 := rfl

theorem encodeWord_length (word : List Cook.TagSymbol) :
    (encodeWord word).value.length = 114 * word.length := by
  rw [encodeWord_value, Cook.encodeWord_length]
  rfl

/-- One finite-symbol observation selects its fixed unary digit. -/
def digit : Cook.MachineSymbol → Result Nat
  | .s0 => ⟨7, 1⟩ | .s1 => ⟨6, 1⟩ | .s2 => ⟨5, 1⟩
  | .s3 => ⟨4, 1⟩ | .s4 => ⟨3, 1⟩ | .s5 => ⟨2, 1⟩

theorem digit_value (symbol : Cook.MachineSymbol) : (digit symbol).value = digitWeight symbol := by
  cases symbol <;> rfl

theorem digit_operations (symbol : Cook.MachineSymbol) : (digit symbol).operations = 1 := by
  cases symbol <;> rfl

/-- The list scan performs measured unary arithmetic at every actual cell. -/
def counter (base : Nat) : List Cook.MachineSymbol → Result Nat
  | [] => ⟨base, 1⟩
  | symbol :: rest =>
      let previous := counter base rest
      let selected := digit symbol
      let added := ParserNatPrimitive.add selected.value previous.value
      let scaled := ParserNatPrimitive.multiply 8 added.value
      ⟨scaled.value, 3 + previous.operations + selected.operations + added.operations + scaled.operations⟩

inductive CounterExecution (base : Nat) : List Cook.MachineSymbol → Nat → Nat → Prop where
  | nil : CounterExecution base [] base 1
  | cons {symbol : Cook.MachineSymbol} {rest : List Cook.MachineSymbol} {previous operations : Nat}
      (tail : CounterExecution base rest previous operations) :
      CounterExecution base (symbol :: rest)
        (ParserNatPrimitive.multiply 8 (ParserNatPrimitive.add (digit symbol).value previous).value).value
        (3 + operations + (digit symbol).operations +
          (ParserNatPrimitive.add (digit symbol).value previous).operations +
          (ParserNatPrimitive.multiply 8 (ParserNatPrimitive.add (digit symbol).value previous).value).operations)

theorem counter_execution (base : Nat) (word : List Cook.MachineSymbol) :
    CounterExecution base word (counter base word).value (counter base word).operations := by
  induction word with
  | nil => exact .nil
  | cons symbol rest ih => exact .cons ih

theorem counter_value (base : Nat) (word : List Cook.MachineSymbol) :
    (counter base word).value = CookEncodingComputability.counterValue base word := by
  induction word with
  | nil => rfl
  | cons symbol rest ih =>
      rw [counter, ParserNatPrimitive.multiply_value, ParserNatPrimitive.add_value, digit_value, ih]
      rfl

theorem counter_operations_le (base : Nat) (word : List Cook.MachineSymbol) :
    (counter base word).operations ≤ 8 * (counter base word).value + 8 * word.length + 1 := by
  induction word with
  | nil =>
      change 1 ≤ 8 * base + 8 * 0 + 1
      exact Nat.le_add_left 1 _
  | cons symbol rest ih =>
      let previous := (counter base rest).value
      let selected := digitWeight symbol
      have previousLe : previous ≤ selected + previous := Nat.le_add_left _ _
      have selectedLe : selected ≤ selected + previous := Nat.le_add_right _ _
      have massBound := Nat.add_le_add
        (Nat.mul_le_mul_left 8 previousLe) (Nat.mul_le_mul_left 4 selectedLe)
      have arithmeticBound := Nat.add_le_add_right massBound (39 * (selected + previous))
      have budget : (8 * previous + 4 * selected) + 39 * (selected + previous) ≤
          64 * (selected + previous) := by
        apply Nat.le_trans arithmeticBound
        rw [← Nat.add_mul, ← Nat.add_mul]
        exact Nat.mul_le_mul_right _ (by decide : 8 + 4 + 39 ≤ 64)
      simp only [counter, digit_operations, ParserNatPrimitive.add_operations,
        ParserNatPrimitive.multiply_operations, ParserNatPrimitive.multiply_value,
        ParserNatPrimitive.add_value, digit_value, List.length_cons]
      change 3 + (counter base rest).operations + 1 + (4 * selected + 1) +
          ((4 * 8 + 7) * (selected + previous) + 2) ≤
        8 * (8 * (selected + previous)) + 8 * (rest.length + 1) + 1
      simp only [← Nat.mul_assoc, Nat.mul_succ, Nat.reduceMul, Nat.reduceAdd]
      change (counter base rest).operations ≤ 8 * previous + 8 * rest.length + 1 at ih
      calc
        3 + (counter base rest).operations + 1 + (4 * selected + 1) +
            (39 * (selected + previous) + 2) ≤
          3 + (8 * previous + 8 * rest.length + 1) + 1 + (4 * selected + 1) +
            (39 * (selected + previous) + 2) :=
          Nat.add_le_add_right (Nat.add_le_add_right (Nat.add_le_add_right
            (Nat.add_le_add_left ih 3) 1) _) _
        _ = ((8 * previous + 4 * selected) + 39 * (selected + previous)) +
            8 * rest.length + (3 + 1 + 1 + 1 + 2) := by simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm, Nat.mul_assoc, Nat.mul_comm, Nat.mul_left_comm]
        _ ≤ 64 * (selected + previous) + 8 * rest.length + 8 :=
          Nat.add_le_add_right (Nat.add_le_add_right budget _) _
        _ ≤ 64 * (selected + previous) + (8 * rest.length + 8) + 1 := by
          rw [← Nat.add_assoc]
          exact Nat.le_add_right _ _

/-- Three tag constructors and one nil cell are allocated; their state field
shares the supplied finite-state reference. -/
def materialize (state : Cook.MachineState) (head left right : Nat) : Result (List Cook.TagSymbol) :=
  let rightWord := replicateOnto (.right state : Cook.TagSymbol) right []
  let leftWord := replicateOnto (.left state : Cook.TagSymbol) left rightWord.value
  let headWord := replicateOnto (.head state : Cook.TagSymbol) head leftWord.value
  ⟨headWord.value, 4 + rightWord.operations + leftWord.operations + headWord.operations⟩

theorem materialize_value (state : Cook.MachineState) (head left right : Nat) :
    (materialize state head left right).value = runWord state ⟨head, left, right⟩ := by
  simp only [materialize, replicateOnto_value, List.append_nil, runWord, List.append_assoc]

theorem materialize_operations (state : Cook.MachineState) (head left right : Nat) :
    (materialize state head left right).operations = 4 * (head + left + right) + 7 := by
  simp only [materialize, replicateOnto_operations, Nat.mul_add]
  change 4 + (4 * right + 1) + (4 * left + 1) + (4 * head + 1) =
    4 * head + 4 * left + 4 * right + (4 + 1 + 1 + 1)
  simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm, Nat.mul_assoc, Nat.mul_comm, Nat.mul_left_comm]

theorem runWord_length (state : Cook.MachineState) (head left right : Nat) :
    (runWord state ⟨head, left, right⟩).length = head + left + right := by
  simp only [runWord, List.length_append, List.length_replicate, Nat.add_assoc]

def headCount : Cook.MachineSymbol → Result Nat
  | .s0 => ⟨8, 1⟩ | .s1 => ⟨7, 1⟩ | .s2 => ⟨6, 1⟩
  | .s3 => ⟨5, 1⟩ | .s4 => ⟨4, 1⟩ | .s5 => ⟨3, 1⟩

theorem headCount_value (symbol : Cook.MachineSymbol) :
    (headCount symbol).value = 8 - Cook.machineSymbolValue symbol := by
  cases symbol <;> rfl

theorem headCount_operations (symbol : Cook.MachineSymbol) : (headCount symbol).operations = 1 := by
  cases symbol <;> rfl

/-- Five operations inspect the input record and read its four fields. -/
def canonicalWord (configuration : MachineConfig) : Result (List Cook.TagSymbol) :=
  let head := headCount configuration.current
  let left := counter 8 configuration.left
  let right := counter 0 configuration.right
  let word := materialize configuration.state head.value left.value right.value
  ⟨word.value, 5 + head.operations + left.operations + right.operations + word.operations⟩

theorem canonicalWord_value (configuration : MachineConfig) :
    (canonicalWord configuration).value = Cook.PassClassification.canonicalWord configuration := by
  rw [canonicalWord, materialize_value, headCount_value, counter_value, counter_value,
    CookEncodingComputability.counterValue_left, CookEncodingComputability.counterValue_right]
  rfl

def mass (configuration : MachineConfig) : Nat :=
  (8 - Cook.machineSymbolValue configuration.current) + leftCounter configuration.left + rightCounter configuration.right

theorem canonicalWord_length (configuration : MachineConfig) :
    (Cook.PassClassification.canonicalWord configuration).length = mass configuration :=
  runWord_length _ _ _ _

theorem canonicalWord_operations_le (configuration : MachineConfig) :
    (canonicalWord configuration).operations ≤
      12 * mass configuration + 8 * (configuration.left.length + configuration.right.length) + 15 := by
  have leftBound := counter_operations_le 8 configuration.left
  have rightBound := counter_operations_le 0 configuration.right
  simp only [counter_value, CookEncodingComputability.counterValue_left] at leftBound
  simp only [counter_value, CookEncodingComputability.counterValue_right] at rightBound
  simp only [canonicalWord, headCount_operations, materialize_operations, headCount_value,
    counter_value, CookEncodingComputability.counterValue_left, CookEncodingComputability.counterValue_right,
    mass, Nat.mul_add]
  let h := 8 - Cook.machineSymbolValue configuration.current
  let l := leftCounter configuration.left
  let r := rightCounter configuration.right
  have combined := Nat.add_le_add_right (Nat.add_le_add
    (Nat.add_le_add_left leftBound (5 + 1)) rightBound)
    (4 * h + 4 * l + 4 * r + 7)
  apply Nat.le_trans combined
  change 5 + 1 + (8 * l + 8 * configuration.left.length + 1) +
    (8 * r + 8 * configuration.right.length + 1) + (4 * h + 4 * l + 4 * r + 7) ≤
    12 * h + 12 * l + 12 * r + (8 * configuration.left.length + 8 * configuration.right.length) + 15
  calc
    _ = 4 * h + 12 * l + 12 * r +
        (8 * configuration.left.length + 8 * configuration.right.length) + 15 := by
      change _ = 4 * h + (8 + 4) * l + (8 + 4) * r +
        (8 * configuration.left.length + 8 * configuration.right.length) + (5 + 1 + 1 + 1 + 7)
      simp only [Nat.add_mul]
      simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm, Nat.mul_assoc, Nat.mul_comm, Nat.mul_left_comm]
    _ ≤ _ := Nat.add_le_add_right (Nat.add_le_add_right (Nat.add_le_add_right
      (Nat.add_le_add_right (Nat.mul_le_mul_right h (by decide : 4 ≤ 12)) _) _) _) _

def canonicalBits (configuration : MachineConfig) : Result (List Bool) :=
  let word := canonicalWord configuration
  let bits := encodeWord word.value
  ⟨bits.value, word.operations + bits.operations⟩

theorem canonicalBits_value (configuration : MachineConfig) :
    (canonicalBits configuration).value =
      Cook.encodeWord (Cook.PassClassification.canonicalWord configuration) := by
  rw [canonicalBits, encodeWord_value, canonicalWord_value]

theorem canonicalBits_length (configuration : MachineConfig) :
    (canonicalBits configuration).value.length = 114 * mass configuration := by
  rw [canonicalBits_value, Cook.encodeWord_length, canonicalWord_length]
  rfl

theorem canonicalBits_operations_le (configuration : MachineConfig) :
    (canonicalBits configuration).operations ≤
      479 * mass configuration + 8 * (configuration.left.length + configuration.right.length) + 17 := by
  have wordBound := canonicalWord_operations_le configuration
  have bitsBound := encodeWord_operations_le (canonicalWord configuration).value
  rw [canonicalWord_value, canonicalWord_length] at bitsBound
  change (canonicalWord configuration).operations + (encodeWord (canonicalWord configuration).value).operations ≤ _
  rw [canonicalWord_value]
  apply Nat.le_trans (Nat.add_le_add wordBound bitsBound)
  apply Nat.le_of_eq
  change 12 * mass configuration + 8 * (configuration.left.length + configuration.right.length) + 15 +
    (467 * mass configuration + 2) =
    (12 + 467) * mass configuration + 8 * (configuration.left.length + configuration.right.length) + (15 + 2)
  rw [Nat.add_mul]
  simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm, Nat.mul_assoc, Nat.mul_comm, Nat.mul_left_comm]

/-- Complete input/output-sensitive primitive cost for the actual canonical
Cook encoder. Its potentially exponential unary output is counted literally. -/
theorem canonicalBits_operations_le_sizes (configuration : MachineConfig) :
    (canonicalBits configuration).operations ≤ 5 * (canonicalBits configuration).value.length +
      8 * (configuration.left.length + configuration.right.length) + 17 := by
  have bound := canonicalBits_operations_le configuration
  rw [canonicalBits_length, ← Nat.mul_assoc]
  apply Nat.le_trans bound
  exact Nat.add_le_add_right (Nat.add_le_add_right
    (Nat.mul_le_mul_right _ (by decide : 479 ≤ 5 * 114)) _) _

inductive MaterializationExecution (state : Cook.MachineState) (head left right : Nat) :
    List Cook.TagSymbol → Nat → Prop where
  | construct {rightWord leftWord headWord : List Cook.TagSymbol}
      {rightOperations leftOperations headOperations : Nat}
      (rightRun : ReplicateExecution (.right state) right [] rightWord rightOperations)
      (leftRun : ReplicateExecution (.left state) left rightWord leftWord leftOperations)
      (headRun : ReplicateExecution (.head state) head leftWord headWord headOperations) :
      MaterializationExecution state head left right headWord
        (4 + rightOperations + leftOperations + headOperations)

theorem materialize_execution (state : Cook.MachineState) (head left right : Nat) :
    MaterializationExecution state head left right (materialize state head left right).value
      (materialize state head left right).operations :=
  .construct (replicateOnto_execution _ _ _) (replicateOnto_execution _ _ _) (replicateOnto_execution _ _ _)

inductive CanonicalExecution (configuration : MachineConfig) : List Cook.TagSymbol → Nat → Prop where
  | construct {left right leftOperations rightOperations wordOperations : Nat} {word : List Cook.TagSymbol}
      (leftRun : CounterExecution 8 configuration.left left leftOperations)
      (rightRun : CounterExecution 0 configuration.right right rightOperations)
      (wordRun : MaterializationExecution configuration.state (headCount configuration.current).value left right word wordOperations) :
      CanonicalExecution configuration word
        (5 + (headCount configuration.current).operations + leftOperations + rightOperations + wordOperations)

theorem canonicalWord_execution (configuration : MachineConfig) :
    CanonicalExecution configuration (canonicalWord configuration).value (canonicalWord configuration).operations :=
  .construct (counter_execution _ _) (counter_execution _ _) (materialize_execution _ _ _ _)

inductive CanonicalBitsExecution (configuration : MachineConfig) : List Bool → Nat → Prop where
  | construct {word : List Cook.TagSymbol} {bits : List Bool} {wordOperations bitOperations : Nat}
      (wordRun : CanonicalExecution configuration word wordOperations)
      (bitRun : EncodingExecution word [] bits bitOperations) :
      CanonicalBitsExecution configuration bits (wordOperations + (1 + bitOperations))

/-- Operational certificate for every stage of the complete finite-window
to canonical Boolean construction. -/
theorem canonicalBits_execution (configuration : MachineConfig) :
    CanonicalBitsExecution configuration (canonicalBits configuration).value (canonicalBits configuration).operations :=
  .construct (canonicalWord_execution _) (encodeOnto_execution _ _)

end PureSFormal.Computation.CookWordConstructionMachine
