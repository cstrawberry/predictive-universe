import PureSFormal.Computation.RogozhinContextDataPrimitive

/-!
# Primitive operation traces for literal cell comparison

Symbol equality observes both finite constructors and takes one branch. At a
cons pair, the list comparator observes both list constructors, dispatches the
case, reads four child references, and branches on the symbol result. A failed
symbol comparison reserves two additional return operations. These are upper
operation budgets in the parser's reference model, not Lean execution times.
-/

namespace PureSFormal.Computation.RogozhinCellComparisonExecution

open Rogozhin46 (Symbol)
open RogozhinContextDataPrimitive

inductive Operation where
  | inspectConstructor | readChild | branch

def symbolTrace : List Operation := [.inspectConstructor, .inspectConstructor, .branch]

def consTrace : List Operation :=
  [.inspectConstructor, .inspectConstructor, .branch,
    .readChild, .readChild, .readChild, .readChild, .branch]

theorem trace_lengths : symbolTrace.length = 3 ∧ consTrace.length = 8 := ⟨rfl, rfl⟩

inductive SymbolExecution : Symbol → Symbol → Bool → Nat → Prop where
  | same (symbol : Symbol) : SymbolExecution symbol symbol true symbolTrace.length
  | different {first second : Symbol} (distinct : first ≠ second) :
      SymbolExecution first second false symbolTrace.length

theorem symbolEqual_execution (first second : Symbol) :
    SymbolExecution first second (symbolEqual first second).value (symbolEqual first second).operations := by
  rw [symbolEqual_operations]
  cases found : (symbolEqual first second).value with
  | true =>
      have same := (symbolEqual_value first second).mp found
      cases same
      exact .same first
  | false =>
      apply SymbolExecution.different
      intro same
      have yes := (symbolEqual_value first second).mpr same
      rw [found] at yes
      cases yes

inductive CellsExecution : List Symbol → List Symbol → Bool → Nat → Prop where
  | nil : CellsExecution [] [] true symbolTrace.length
  | leftNil (first : Symbol) (rest : List Symbol) :
      CellsExecution [] (first :: rest) false symbolTrace.length
  | rightNil (first : Symbol) (rest : List Symbol) :
      CellsExecution (first :: rest) [] false symbolTrace.length
  | short {first second : Symbol} {left right : List Symbol} {headCost : Nat}
      (head : SymbolExecution first second false headCost) :
      CellsExecution (first :: left) (second :: right) false (headCost + 2 + consTrace.length)
  | both {first second : Symbol} {left right : List Symbol} {answer : Bool} {headCost tailCost : Nat}
      (head : SymbolExecution first second true headCost)
      (tail : CellsExecution left right answer tailCost) :
      CellsExecution (first :: left) (second :: right) answer (headCost + tailCost + consTrace.length)

theorem equalCells_execution (left right : List Symbol) :
    CellsExecution left right (equalCells left right).value (equalCells left right).operations := by
  induction left generalizing right with
  | nil =>
      cases right with
      | nil => exact .nil
      | cons first rest => exact .leftNil first rest
  | cons first rest ih =>
      cases right with
      | nil => exact .rightNil first rest
      | cons second rights =>
          have head := symbolEqual_execution first second
          rw [symbolEqual_operations] at head
          cases found : (symbolEqual first second).value with
          | false =>
              rw [found] at head
              simpa only [equalCells, symbolEqual_operations, found, Bool.false_eq_true, ↓reduceIte]
                using! (CellsExecution.short (left := rest) (right := rights) head)
          | true =>
              rw [found] at head
              simpa only [equalCells, symbolEqual_operations, found, ↓reduceIte]
                using! (CellsExecution.both head (ih rights))

theorem comparison_certificate (left right : List Symbol) :
    CellsExecution left right (equalCells left right).value (equalCells left right).operations ∧
      ((equalCells left right).value = true ↔ left = right) ∧
      (equalCells left right).operations ≤ 11 * left.length + 3 :=
  ⟨equalCells_execution left right, equalCells_value left right, equalCells_operations_le left right⟩

end PureSFormal.Computation.RogozhinCellComparisonExecution
