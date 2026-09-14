import PureSFormal.Computation.CookWordConstructionMachine

/-!
# Primitive construction of Rogozhin's initial tape

Every variable-size list and unary-natural traversal is measured. Fixed symbols
and small constants are immutable program data. The execution counters are proof
instrumentation; the evaluator does not simulate the source or target machine.
-/

namespace PureSFormal.Computation.RogozhinInputConstructionMachine

open PureSFormal.PureS.ParserPrimitiveMachine (Result)
open PureSFormal.PureS
open Rogozhin46 (Symbol)
open CookWordConstructionMachine (replicateOnto)

def length {α : Type} : List α → Result Nat
  | [] => ⟨0, 2⟩
  | _ :: tail =>
      let rest := length tail
      ⟨rest.value + 1, 4 + rest.operations⟩

theorem length_value {α : Type} (word : List α) : (length word).value = word.length := by
  induction word with
  | nil => rfl
  | cons head tail ih => simp only [length, ih, List.length_cons]

theorem length_operations {α : Type} (word : List α) :
    (length word).operations = 4 * word.length + 2 := by
  induction word with
  | nil => rfl
  | cons head tail ih =>
      simp only [length, ih, List.length_cons, Nat.mul_succ,
        Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

def lookup {α : Type} (fallback : α) : List α → Nat → Result α
  | [], _ => ⟨fallback, 2⟩
  | head :: _, 0 => ⟨head, 3⟩
  | _ :: tail, .succ index =>
      let rest := lookup fallback tail index
      ⟨rest.value, 5 + rest.operations⟩

theorem lookup_value {α : Type} (fallback : α) (word : List α) (index : Nat) :
    (lookup fallback word index).value = word.getD index fallback := by
  induction word generalizing index with
  | nil => rfl
  | cons head tail ih => cases index with
    | zero => rfl
    | succ index => exact ih index

theorem lookup_operations_le {α : Type} (fallback : α) (word : List α) (index : Nat) :
    (lookup fallback word index).operations ≤ 5 * index + 3 := by
  induction word generalizing index with
  | nil =>
      exact Nat.le_trans (by decide : 2 ≤ 3) (Nat.le_add_left _ _)
  | cons head tail ih => cases index with
    | zero => exact Nat.le_refl _
    | succ index =>
        have bound := ih index
        change 5 + (lookup fallback tail index).operations ≤ _
        apply Nat.le_trans (Nat.add_le_add_left bound 5)
        apply Nat.le_of_eq
        rw [Nat.mul_succ]
        simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm, Nat.mul_assoc, Nat.mul_comm, Nat.mul_left_comm]

def reverseOnto {α : Type} : List α → List α → Result (List α)
  | [], tail => ⟨tail, 1⟩
  | head :: rest, tail =>
      let next := reverseOnto rest (head :: tail)
      ⟨next.value, 4 + next.operations⟩

theorem reverseOnto_value {α : Type} (word tail : List α) :
    (reverseOnto word tail).value = word.reverse ++ tail := by
  induction word generalizing tail with
  | nil => rfl
  | cons head rest ih => simp only [reverseOnto, ih, List.reverse_cons,
      List.append_assoc, List.singleton_append]

theorem reverseOnto_operations {α : Type} (word tail : List α) :
    (reverseOnto word tail).operations = 4 * word.length + 1 := by
  induction word generalizing tail with
  | nil => rfl
  | cons head rest ih => simp only [reverseOnto, ih, List.length_cons, Nat.mul_succ,
      Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

/-- The added row contribution is copied; the previous weight is shared. -/
def weight (program : RogozhinTagInput.Program) : Nat → Result Nat
  | 0 => ⟨1, 1⟩
  | .succ label =>
      let previous := weight program label
      let row := lookup [] program.productions label
      let count := length row.value
      let doubled := ParserNatPrimitive.multiply 2 count.value
      let added := ParserNatPrimitive.add doubled.value previous.value
      ⟨added.value, 3 + previous.operations + row.operations +
        count.operations + doubled.operations + added.operations⟩

theorem weight_value (program : RogozhinTagInput.Program) (label : Nat) :
    (weight program label).value = RogozhinTagInput.weight program label := by
  induction label with
  | zero => rfl
  | succ label ih =>
      simp only [weight, ParserNatPrimitive.add_value, ParserNatPrimitive.multiply_value,
        length_value, lookup_value, ih, RogozhinTagInput.weight,
        RogozhinTagInput.productionAt, Nat.add_comm]

theorem weight_operations_le (program : RogozhinTagInput.Program) (label : Nat) :
    (weight program label).operations ≤
      5 * (label * label) + 14 * label + 14 * RogozhinTagInput.weight program label + 1 := by
  induction label with
  | zero => exact Nat.le_add_left 1 _
  | succ label ih =>
      have lookupBound := lookup_operations_le ([] : List Nat) program.productions label
      simp only [weight, ParserNatPrimitive.add_operations, ParserNatPrimitive.multiply_operations,
        ParserNatPrimitive.multiply_value, length_operations, length_value, lookup_value,
        RogozhinTagInput.weight, RogozhinTagInput.productionAt]
      let n := (program.productions.getD label []).length
      let w := RogozhinTagInput.weight program label
      change 3 + (weight program label).operations + (lookup [] program.productions label).operations +
        (4 * n + 2) + (15 * n + 2) + (4 * (2 * n) + 1) ≤
        5 * ((label + 1) * (label + 1)) + 14 * (label + 1) + 14 * (w + 2 * n) + 1
      have combined := Nat.add_le_add_right (Nat.add_le_add_right (Nat.add_le_add_right
        (Nat.add_le_add (Nat.add_le_add_left ih 3) lookupBound) (4 * n + 2))
        (15 * n + 2)) (4 * (2 * n) + 1)
      apply Nat.le_trans combined
      calc
        _ = 5 * (label * label) + (14 + 5) * label +
            (4 + 15 + 4 * 2) * n + 14 * w + (3 + 1 + 3 + 2 + 2 + 1) := by
          simp only [Nat.add_mul, Nat.mul_assoc]
          change _ = _
          simp only [w, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm, Nat.mul_assoc, Nat.mul_comm, Nat.mul_left_comm]
        _ ≤ 5 * (label * label) + 24 * label + 28 * n + 14 * w + 20 :=
          Nat.add_le_add (Nat.add_le_add_right (Nat.add_le_add
            (Nat.add_le_add_left (Nat.mul_le_mul_right label (by decide : 14 + 5 ≤ 24)) _)
            (Nat.mul_le_mul_right n (by decide : 4 + 15 + 8 ≤ 28))) _)
            (by decide : 3 + 1 + 3 + 2 + 2 + 1 ≤ 20)
        _ = _ := by
          change 5 * (label * label) + (5 + 5 + 14) * label + (14 * 2) * n +
            14 * w + (5 + 14 + 1) = _
          simp only [Nat.mul_add, Nat.add_mul, Nat.mul_one, Nat.one_mul, Nat.mul_assoc]
          simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm, Nat.mul_assoc, Nat.mul_comm, Nat.mul_left_comm]

def squareMass : List Nat → Nat
  | [] => 0
  | label :: rest => (label + 1) * (label + 1) + squareMass rest

theorem weightAndOnes_operations_le (program : RogozhinTagInput.Program) (label : Nat) :
    4 + (weight program label).operations + (4 * RogozhinTagInput.weight program label + 1) ≤
      20 * ((label + 1) * (label + 1)) + 18 * RogozhinTagInput.weight program label := by
  let w := RogozhinTagInput.weight program label
  apply Nat.le_trans (Nat.add_le_add_right
    (Nat.add_le_add_left (weight_operations_le program label) 4) (4 * w + 1))
  calc
    _ = 5 * (label * label) + 14 * label + (14 + 4) * w + (4 + 1 + 1) := by
      rw [Nat.add_mul]
      simp only [w, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm, Nat.mul_assoc, Nat.mul_comm, Nat.mul_left_comm]
    _ ≤ 20 * (label * label) + 40 * label + 18 * w + 20 :=
      Nat.add_le_add (Nat.add_le_add_right (Nat.add_le_add
        (Nat.mul_le_mul_right _ (by decide : 5 ≤ 20))
        (Nat.mul_le_mul_right _ (by decide : 14 ≤ 40))) _)
        (by decide : 4 + 1 + 1 ≤ 20)
    _ = _ := by
      change 20 * (label * label) + (20 + 20) * label + 18 * w + 20 = _
      simp only [Nat.mul_add, Nat.add_mul, Nat.mul_one, Nat.one_mul, Nat.mul_assoc]
      simp only [w, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm, Nat.mul_assoc, Nat.mul_comm, Nat.mul_left_comm]

def dataTail (program : RogozhinTagInput.Program) : List Nat → Result (List Symbol)
  | [] => ⟨[], 2⟩
  | label :: rest =>
      let following := dataTail program rest
      let count := weight program label
      let ones := replicateOnto Symbol.s0 count.value following.value
      ⟨.s5 :: ones.value, 4 + following.operations + count.operations + ones.operations⟩

theorem dataTail_value (program : RogozhinTagInput.Program) (word : List Nat) :
    (dataTail program word).value = RogozhinTagInput.dataTail program word := by
  induction word with
  | nil => rfl
  | cons label rest ih =>
      simp only [dataTail, CookWordConstructionMachine.replicateOnto_value, weight_value,
        ih, RogozhinTagInput.dataTail, RogozhinTagInput.ones]

theorem dataTail_length_cons (program : RogozhinTagInput.Program) (label : Nat) (rest : List Nat) :
    (RogozhinTagInput.dataTail program (label :: rest)).length =
      1 + RogozhinTagInput.weight program label + (RogozhinTagInput.dataTail program rest).length := by
  simp only [RogozhinTagInput.dataTail, RogozhinTagInput.ones,
    List.length_cons, List.length_append, List.length_replicate, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

theorem dataTail_operations_le (program : RogozhinTagInput.Program) (word : List Nat) :
    (dataTail program word).operations ≤
      20 * squareMass word + 18 * (RogozhinTagInput.dataTail program word).length + 2 := by
  induction word with
  | nil => exact Nat.le_refl _
  | cons label rest ih =>
      have segmentBound := weightAndOnes_operations_le program label
      rw [dataTail, CookWordConstructionMachine.replicateOnto_operations, weight_value]
      calc
        _ = (dataTail program rest).operations +
            (4 + (weight program label).operations + (4 * RogozhinTagInput.weight program label + 1)) := by simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm, Nat.mul_assoc, Nat.mul_comm, Nat.mul_left_comm]
        _ ≤ (20 * squareMass rest + 18 * (RogozhinTagInput.dataTail program rest).length + 2) +
            (20 * ((label + 1) * (label + 1)) + 18 * RogozhinTagInput.weight program label) :=
          Nat.add_le_add ih segmentBound
        _ ≤ ((20 * squareMass rest + 18 * (RogozhinTagInput.dataTail program rest).length + 2) +
            (20 * ((label + 1) * (label + 1)) + 18 * RogozhinTagInput.weight program label)) + 18 :=
          Nat.le_add_right _ _
        _ = _ := by
          rw [dataTail_length_cons, squareMass]
          simp only [Nat.mul_add, Nat.mul_one]
          simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm, Nat.mul_assoc, Nat.mul_comm, Nat.mul_left_comm]

def dataCode (program : RogozhinTagInput.Program) : List Nat → Result (List Symbol)
  | [] => ⟨[], 2⟩
  | label :: rest =>
      let following := dataTail program rest
      let count := weight program label
      let ones := replicateOnto Symbol.s0 count.value following.value
      ⟨ones.value, 3 + following.operations + count.operations + ones.operations⟩

theorem dataCode_value (program : RogozhinTagInput.Program) (word : List Nat) :
    (dataCode program word).value = RogozhinTagInput.dataCode program word := by
  cases word with
  | nil => rfl
  | cons label rest =>
      simp only [dataCode, CookWordConstructionMachine.replicateOnto_value, weight_value,
        dataTail_value, RogozhinTagInput.dataCode, RogozhinTagInput.ones]

theorem dataCode_operations_le (program : RogozhinTagInput.Program) (word : List Nat) :
    (dataCode program word).operations ≤
      20 * squareMass word + 18 * (RogozhinTagInput.dataCode program word).length + 2 := by
  cases word with
  | nil => exact Nat.le_refl _
  | cons label rest =>
      have tailBound := dataTail_operations_le program rest
      have segmentBound := weightAndOnes_operations_le program label
      rw [dataCode, CookWordConstructionMachine.replicateOnto_operations, weight_value]
      calc
        _ ≤ 4 + (dataTail program rest).operations + (weight program label).operations +
            (4 * RogozhinTagInput.weight program label + 1) :=
          Nat.add_le_add_right (Nat.add_le_add_right (Nat.add_le_add_right (by decide : 3 ≤ 4) _) _) _
        _ = (dataTail program rest).operations +
            (4 + (weight program label).operations + (4 * RogozhinTagInput.weight program label + 1)) := by simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm, Nat.mul_assoc, Nat.mul_comm, Nat.mul_left_comm]
        _ ≤ (20 * squareMass rest + 18 * (RogozhinTagInput.dataTail program rest).length + 2) +
            (20 * ((label + 1) * (label + 1)) + 18 * RogozhinTagInput.weight program label) :=
          Nat.add_le_add tailBound segmentBound
        _ = _ := by
          simp only [RogozhinTagInput.dataCode, RogozhinTagInput.ones, List.length_append,
            List.length_replicate, squareMass, Nat.mul_add]
          simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm, Nat.mul_assoc, Nat.mul_comm, Nat.mul_left_comm]


inductive LengthExecution {α : Type} : List α → Nat → Nat → Prop where
  | nil : LengthExecution [] 0 2
  | cons {head : α} {tail : List α} {count operations : Nat}
      (rest : LengthExecution tail count operations) :
      LengthExecution (head :: tail) (count + 1) (4 + operations)

theorem length_execution {α : Type} (word : List α) :
    LengthExecution word (length word).value (length word).operations := by
  induction word with
  | nil => exact .nil
  | cons head tail ih => exact .cons ih

inductive LookupExecution {α : Type} (fallback : α) : List α → Nat → α → Nat → Prop where
  | nil (index : Nat) : LookupExecution fallback [] index fallback 2
  | zero (head : α) (tail : List α) : LookupExecution fallback (head :: tail) 0 head 3
  | succ {head value : α} {tail : List α} {index operations : Nat}
      (rest : LookupExecution fallback tail index value operations) :
      LookupExecution fallback (head :: tail) (index + 1) value (5 + operations)

theorem lookup_execution {α : Type} (fallback : α) (word : List α) (index : Nat) :
    LookupExecution fallback word index (lookup fallback word index).value
      (lookup fallback word index).operations := by
  induction word generalizing index with
  | nil => exact .nil _
  | cons head tail ih =>
      cases index with
      | zero => exact .zero _ _
      | succ index => exact .succ (ih index)

inductive ReverseExecution {α : Type} : List α → List α → List α → Nat → Prop where
  | nil (tail : List α) : ReverseExecution [] tail tail 1
  | cons {head : α} {word tail output : List α} {operations : Nat}
      (rest : ReverseExecution word (head :: tail) output operations) :
      ReverseExecution (head :: word) tail output (4 + operations)

theorem reverseOnto_execution {α : Type} (word tail : List α) :
    ReverseExecution word tail (reverseOnto word tail).value (reverseOnto word tail).operations := by
  induction word generalizing tail with
  | nil => exact .nil _
  | cons head rest ih => exact .cons (ih _)

inductive WeightExecution (program : RogozhinTagInput.Program) : Nat → Nat → Nat → Prop where
  | zero : WeightExecution program 0 1 1
  | succ {label previous previousOperations rowOperations count countOperations : Nat} {row : List Nat}
      (previousRun : WeightExecution program label previous previousOperations)
      (rowRun : LookupExecution [] program.productions label row rowOperations)
      (countRun : LengthExecution row count countOperations) :
      WeightExecution program (label + 1)
        (ParserNatPrimitive.add (ParserNatPrimitive.multiply 2 count).value previous).value
        (3 + previousOperations + rowOperations + countOperations +
          (ParserNatPrimitive.multiply 2 count).operations +
          (ParserNatPrimitive.add (ParserNatPrimitive.multiply 2 count).value previous).operations)

theorem weight_execution (program : RogozhinTagInput.Program) (label : Nat) :
    WeightExecution program label (weight program label).value (weight program label).operations := by
  induction label with
  | zero => exact .zero
  | succ label ih => exact .succ ih (lookup_execution _ _ _) (length_execution _)

inductive DataTailExecution (program : RogozhinTagInput.Program) : List Nat → List Symbol → Nat → Prop where
  | nil : DataTailExecution program [] [] 2
  | cons {label count weightOperations tailOperations onesOperations : Nat}
      {word : List Nat} {tail output : List Symbol}
      (following : DataTailExecution program word tail tailOperations)
      (countRun : WeightExecution program label count weightOperations)
      (onesRun : CookWordConstructionMachine.ReplicateExecution Symbol.s0 count tail output onesOperations) :
      DataTailExecution program (label :: word) (.s5 :: output)
        (4 + tailOperations + weightOperations + onesOperations)

theorem dataTail_execution (program : RogozhinTagInput.Program) (word : List Nat) :
    DataTailExecution program word (dataTail program word).value (dataTail program word).operations := by
  induction word with
  | nil => exact .nil
  | cons label rest ih =>
      exact .cons ih (weight_execution _ _) (CookWordConstructionMachine.replicateOnto_execution _ _ _)

inductive DataExecution (program : RogozhinTagInput.Program) : List Nat → List Symbol → Nat → Prop where
  | nil : DataExecution program [] [] 2
  | cons {label count weightOperations tailOperations onesOperations : Nat}
      {word : List Nat} {tail output : List Symbol}
      (following : DataTailExecution program word tail tailOperations)
      (countRun : WeightExecution program label count weightOperations)
      (onesRun : CookWordConstructionMachine.ReplicateExecution Symbol.s0 count tail output onesOperations) :
      DataExecution program (label :: word) output
        (3 + tailOperations + weightOperations + onesOperations)

theorem dataCode_execution (program : RogozhinTagInput.Program) (word : List Nat) :
    DataExecution program word (dataCode program word).value (dataCode program word).operations := by
  cases word with
  | nil => exact .nil
  | cons label rest =>
      exact .cons (dataTail_execution _ _) (weight_execution _ _)
        (CookWordConstructionMachine.replicateOnto_execution _ _ _)

end PureSFormal.Computation.RogozhinInputConstructionMachine
