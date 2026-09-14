import PureSFormal.PureS.Pattern

/-!
# Primitive tree and list operations for syntactic parsers

The cost model uses immutable tree/list references. Inspecting one constructor,
reading one child reference, taking one Boolean branch, and allocating one list
cell each cost one operation. Equality compares constructors and stops at the
first mismatch. List append visits and copies the left operand; the right
operand is shared. These are operation counts, not bit costs or Lean execution
times. The instrumented records themselves are proof instrumentation.

`EqualityExecution` gives an independent operational account of short-circuit
tree equality. Its rules charge the two constructor reads and one branch at
every pair, then four child-reference reads and the recursive-result branch at
an application pair. No built-in structural equality is used by the evaluator.
-/

namespace PureSFormal.PureS.ParserPrimitiveMachine

structure Result (α : Type) where
  value : α
  operations : Nat
  deriving Repr

def equal : Term → Term → Result Bool
  | .s, .s => ⟨true, 3⟩
  | .s, .app _ _ => ⟨false, 3⟩
  | .app _ _, .s => ⟨false, 3⟩
  | .app left right, .app otherLeft otherRight =>
      let first := equal left otherLeft
      if first.value then
        let second := equal right otherRight
        ⟨second.value, 8 + first.operations + second.operations⟩
      else
        ⟨false, 8 + first.operations⟩

inductive EqualityExecution : Term → Term → Bool → Nat → Prop where
  | leaf : EqualityExecution .s .s true 3
  | leftMismatch (left right : Term) :
      EqualityExecution .s (.app left right) false 3
  | rightMismatch (left right : Term) :
      EqualityExecution (.app left right) .s false 3
  | shortCircuit {left right otherLeft otherRight : Term} {cost : Nat}
      (first : EqualityExecution left otherLeft false cost) :
      EqualityExecution (.app left right) (.app otherLeft otherRight) false (8 + cost)
  | both {left right otherLeft otherRight : Term} {result : Bool} {firstCost secondCost : Nat}
      (first : EqualityExecution left otherLeft true firstCost)
      (second : EqualityExecution right otherRight result secondCost) :
      EqualityExecution (.app left right) (.app otherLeft otherRight) result
        (8 + firstCost + secondCost)

theorem equal_execution (first second : Term) :
    EqualityExecution first second (equal first second).value (equal first second).operations := by
  induction first generalizing second with
  | s => cases second <;> constructor
  | app left right leftIH rightIH =>
      cases second with
      | s => exact .rightMismatch left right
      | app otherLeft otherRight =>
          have first := leftIH otherLeft
          have second := rightIH otherRight
          cases h : (equal left otherLeft).value with
          | false =>
              simpa [equal, h] using
                (EqualityExecution.shortCircuit (right := right) (otherRight := otherRight)
                  (by simpa only [h] using first))
          | true =>
              simpa [equal, h] using
                (EqualityExecution.both (by simpa only [h] using first) second)

theorem equal_value (first second : Term) :
    (equal first second).value = true ↔ first = second := by
  induction first generalizing second with
  | s => cases second <;> simp [equal]
  | app left right leftIH rightIH =>
      cases second with
      | s => simp [equal]
      | app otherLeft otherRight =>
          simp only [equal]
          cases h : (equal left otherLeft).value with
          | false =>
              have different : left ≠ otherLeft := by
                intro same
                have yes := (leftIH otherLeft).mpr same
                simp [h] at yes
              simp [h, different]
          | true =>
              have same := (leftIH otherLeft).mp h
              simpa [h, same] using rightIH otherRight

theorem three_le_four_mul {number : Nat} (positive : 0 < number) :
    3 ≤ 4 * number :=
  Nat.le_trans (by decide : 3 ≤ 4)
    (by simpa using Nat.mul_le_mul_left 4 (Nat.succ_le_of_lt positive))

theorem equal_operations_le (first second : Term) :
    (equal first second).operations ≤ 4 * (first.size + second.size) := by
  induction first generalizing second with
  | s =>
      cases second <;>
        exact three_le_four_mul (Nat.add_pos_left (Term.size_pos .s) _)
  | app left right leftIH rightIH =>
      cases second with
      | s => exact three_le_four_mul (Nat.add_pos_right _ (Term.size_pos .s))
      | app otherLeft otherRight =>
          have first := leftIH otherLeft
          have second := rightIH otherRight
          have sizes : 4 * ((Term.app left right).size + (Term.app otherLeft otherRight).size) =
              8 + 4 * (left.size + otherLeft.size) + 4 * (right.size + otherRight.size) := by
            simp only [Term.size, Nat.succ_eq_add_one, Nat.mul_add, Nat.mul_one]
            rw [show 8 = 4 + 4 by rfl]
            simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
          simp only [equal]
          split
          · have combined := Nat.add_le_add (Nat.add_le_add_left first 8) second
            simpa only [sizes] using combined
          · have combined := Nat.add_le_add (Nat.add_le_add_left first 8)
              (Nat.zero_le (4 * (right.size + otherRight.size)))
            simpa only [sizes, Nat.add_zero] using combined

/-- Singleton construction allocates its nil and cons cells. -/
def singleton (bit : Bool) : Result (List Bool) := ⟨[bit], 2⟩

/-- List append charges inspection, two field reads, and one copied cons cell. -/
def append : List Bool → List Bool → Result (List Bool)
  | [], right => ⟨right, 1⟩
  | head :: tail, right =>
      let rest := append tail right
      ⟨head :: rest.value, 4 + rest.operations⟩

theorem append_value (first second : List Bool) :
    (append first second).value = first ++ second := by
  induction first with
  | nil => rfl
  | cons head tail ih => simp only [append, List.cons_append, ih]

theorem append_operations (first second : List Bool) :
    (append first second).operations = 4 * first.length + 1 := by
  induction first with
  | nil => rfl
  | cons head tail ih =>
      simp [append, List.length_cons, ih, Nat.mul_add, Nat.add_assoc,
        Nat.add_comm, Nat.add_left_comm]

def appendBit (bits : List Bool) (bit : Bool) : Result (List Bool) :=
  let one := singleton bit
  let joined := append bits one.value
  ⟨joined.value, one.operations + joined.operations⟩

@[simp] theorem appendBit_value (bits : List Bool) (bit : Bool) :
    (appendBit bits bit).value = bits ++ [bit] := append_value bits [bit]

@[simp] theorem appendBit_operations (bits : List Bool) (bit : Bool) :
    (appendBit bits bit).operations = 4 * bits.length + 3 := by
  simp [appendBit, singleton, append_operations, Nat.add_assoc,
    Nat.add_comm, Nat.add_left_comm]
  rw [← Nat.add_assoc 1 2]

/-- The pattern is compiled once; holes require no input-tree inspection. -/
def pattern : Pattern → Term → Result Bool
  | .hole, _ => ⟨true, 0⟩
  | .s, .s => ⟨true, 1⟩
  | .s, .app _ _ => ⟨false, 1⟩
  | .app _ _, .s => ⟨false, 1⟩
  | .app left right, .app fn arg =>
      let first := pattern left fn
      if first.value then
        let second := pattern right arg
        ⟨second.value, 4 + first.operations + second.operations⟩
      else
        ⟨false, 4 + first.operations⟩

theorem pattern_value (shape : Pattern) (term : Term) :
    (pattern shape term).value = shape.matchesBool term := by
  induction shape generalizing term with
  | hole => rfl
  | s => cases term <;> rfl
  | app left right leftIH rightIH =>
      cases term with
      | s => rfl
      | app fn arg =>
          simp only [pattern, Pattern.matchesBool]
          cases h : (pattern left fn).value <;>
            simp [h, ← leftIH fn, ← rightIH arg]

theorem pattern_operations_le (shape : Pattern) (term : Term) :
    (pattern shape term).operations ≤ 4 * shape.size := by
  induction shape generalizing term with
  | hole => simp [pattern]
  | s => cases term <;> simp [pattern]
  | app left right leftIH rightIH =>
      cases term with
      | s =>
          exact Nat.le_trans (by decide : 1 ≤ 3)
            (three_le_four_mul (Pattern.size_pos (.app left right)))
      | app fn arg =>
          have first := leftIH fn
          have second := rightIH arg
          simp only [pattern]
          split
          · have combined := Nat.add_le_add (Nat.add_le_add_left first 4) second
            simpa [Pattern.size, Nat.mul_add, Nat.add_assoc, Nat.add_comm,
              Nat.add_left_comm] using combined
          · have combined := Nat.add_le_add (Nat.add_le_add_left first 4)
              (Nat.zero_le (4 * right.size))
            simpa [Pattern.size, Nat.mul_add, Nat.add_assoc, Nat.add_comm,
              Nat.add_left_comm] using combined

/-- Each traversed edge reads a list cell, tree node, direction, and child. -/
def subterm : Term → Address → Result (Option Term)
  | term, [] => ⟨some term, 2⟩
  | .s, _ :: _ => ⟨none, 3⟩
  | .app left _, .left :: rest =>
      let found := subterm left rest
      ⟨found.value, 4 + found.operations⟩
  | .app _ right, .right :: rest =>
      let found := subterm right rest
      ⟨found.value, 4 + found.operations⟩

theorem subterm_value (term : Term) (address : Address) :
    (subterm term address).value = term.subterm? address := by
  induction address generalizing term with
  | nil => cases term <;> rfl
  | cons direction rest ih =>
      cases term with
      | s => cases direction <;> rfl
      | app left right => cases direction <;> exact ih _

theorem subterm_operations_le (term : Term) (address : Address) :
    (subterm term address).operations ≤ 4 * address.length + 3 := by
  induction address generalizing term with
  | nil => simp [subterm]
  | cons direction rest ih =>
      cases term with
      | s => cases direction <;> simp [subterm]
      | app left right =>
          cases direction <;>
            simp only [subterm, List.length_cons]
          · simpa [Nat.mul_add, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
              using Nat.add_le_add_left (ih left) 4
          · simpa [Nat.mul_add, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
              using Nat.add_le_add_left (ih right) 4

end PureSFormal.PureS.ParserPrimitiveMachine
