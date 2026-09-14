import PureSFormal.Computation.ThreeCounterRadixReadbackPrimitive

namespace PureSFormal.Computation.ThreeCounterSymbolReadbackPrimitive

open PureSFormal.PureS
open PureSFormal.PureS.ParserPrimitiveMachine (Result)
open CounterMachineTag (Symbol)
open ThreeCounterTagTypedConstructionMachine (symbolPayload)

def sameFamily : Symbol → Symbol → Bool
  | .head _, .head _ | .filler _, .filler _ | .first _, .first _ | .second _, .second _
  | .selectPositive _, .selectPositive _ | .selectZero _, .selectZero _
  | .firstPositive _, .firstPositive _ | .firstZero _, .firstZero _
  | .secondPositive _, .secondPositive _ | .secondZero _, .secondZero _
  | .sacrificial, .sacrificial | .sink, .sink | .halt, .halt => true
  | _, _ => false

/-- Two constructor inspections and a branch select the family. Payload reads,
the measured unary equality, and the Boolean branch are then counted. -/
def same (left right : Symbol) : Result Bool :=
  let payloads := ParserTerminalPrimitive.equalIndex (symbolPayload left) (symbolPayload right)
  ⟨sameFamily left right && payloads.value, payloads.operations + 8⟩

theorem same_value (left right : Symbol) : (same left right).value = true ↔ left = right := by
  cases left <;> cases right <;>
    simp [same, sameFamily, symbolPayload, ParserTerminalPrimitive.equalIndex_value]

theorem same_operations_le (left right : Symbol) : (same left right).operations ≤ 4 * symbolPayload left + 10 :=
  Nat.add_le_add_right (ParserTerminalPrimitive.equalIndex_operations_le _ _) 8

def mass : List Symbol → Nat
  | [] => 0
  | head :: tail => symbolPayload head + mass tail

def count (symbol : Symbol) : List Symbol → Result Nat
  | [] => ⟨0, 2⟩
  | first :: rest =>
      let equal := same symbol first
      let following := count symbol rest
      ⟨if equal.value then .succ following.value else following.value,
        equal.operations + following.operations + 8⟩

theorem count_value (symbol : Symbol) (word : List Symbol) :
    (count symbol word).value = ThreeCounterTagOutputBoundary.symbolCount symbol word := by
  induction word with
  | nil => rfl
  | cons first rest ih =>
      simp only [count, ih, ThreeCounterTagOutputBoundary.symbolCount]
      by_cases equal : first = symbol
      · subst first
        rw [(same_value symbol symbol).mpr rfl, if_pos rfl]
        simp only [ite_true, Nat.add_comm, Nat.succ_eq_add_one]
      · have different : ¬ (same symbol first).value = true := fun same => equal ((same_value _ _).mp same).symm
        rw [if_neg different, if_neg equal, Nat.zero_add]

theorem count_le_length (symbol : Symbol) (word : List Symbol) : (count symbol word).value ≤ word.length := by
  induction word with
  | nil => simp only [count, List.length_nil, Nat.zero_mul, Nat.zero_add, Nat.le_refl]
  | cons first rest ih =>
      simp only [count, List.length_cons]
      split
      · exact Nat.add_le_add_right ih 1
      · exact Nat.le_trans ih (Nat.le_add_right _ _)

theorem count_operations_le (symbol : Symbol) (word : List Symbol) :
    (count symbol word).operations ≤ word.length * (4 * symbolPayload symbol + 18) + 2 := by
  induction word with
  | nil => simp only [count, List.length_nil, Nat.zero_mul, Nat.zero_add, Nat.le_refl]
  | cons first rest ih =>
      have bound := Nat.add_le_add_right (Nat.add_le_add (same_operations_le symbol first) ih) 8
      simpa only [count, List.length_cons, Nat.add_mul, Nat.one_mul, show 18 = 10 + 8 by rfl,
        Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using bound

/-- Comparison costs are bounded by the original (second) word, including an
arbitrarily long malformed candidate on the first argument. -/
def equalWords : List Symbol → List Symbol → Result Bool
  | [], [] => ⟨true, 3⟩
  | _ :: _, [] | [], _ :: _ => ⟨false, 3⟩
  | left :: lefts, right :: rights =>
      let compared := same right left
      if compared.value then
        let following := equalWords lefts rights
        ⟨following.value, compared.operations + following.operations + 8⟩
      else ⟨false, compared.operations + 8⟩

theorem equalWords_value (left right : List Symbol) : (equalWords left right).value = true ↔ left = right := by
  induction right generalizing left with
  | nil => cases left <;> simp [equalWords]
  | cons first rest ih => cases left with
    | nil => simp [equalWords]
    | cons head tail =>
        simp only [equalWords]
        by_cases equal : (same first head).value = true
        · rw [if_pos equal, ih]
          have heads := (same_value first head).mp equal
          cases heads
          simp only [List.cons.injEq, true_and]
        · rw [if_neg equal]
          constructor
          · intro impossible; cases impossible
          · intro words
            have heads := (List.cons.inj words).1
            exact False.elim (equal ((same_value first head).mpr heads.symm))

theorem equalWords_operations_le (left right : List Symbol) :
    (equalWords left right).operations ≤ 4 * mass right + 18 * right.length + 3 := by
  induction right generalizing left with
  | nil => cases left <;> exact Nat.le_refl _
  | cons first rest ih => cases left with
    | nil => exact Nat.le_add_left _ _
    | cons head tail =>
        have bound := Nat.add_le_add_right (Nat.add_le_add (same_operations_le first head) (ih tail)) 8
        have combined : (same first head).operations + (equalWords tail rest).operations + 8 ≤
            4 * mass (first :: rest) + 18 * (first :: rest).length + 3 := by
          simpa only [mass, List.length_cons, Nat.mul_add, Nat.mul_succ,
            show 18 = 10 + 8 by rfl, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using bound
        simp only [equalWords]
        split
        · exact combined
        · exact Nat.le_trans (Nat.add_le_add_right (Nat.le_add_right _ _) 8) combined

inductive CountExecution (symbol : Symbol) : List Symbol → Nat → Nat → Prop where
  | nil : CountExecution symbol [] 0 2
  | cons {head : Symbol} {tail : List Symbol} {output operations : Nat}
      (rest : CountExecution symbol tail output operations) :
      CountExecution symbol (head :: tail) (if (same symbol head).value then .succ output else output)
        ((same symbol head).operations + operations + 8)

theorem count_execution (symbol : Symbol) (word : List Symbol) :
    CountExecution symbol word (count symbol word).value (count symbol word).operations := by
  induction word with
  | nil => exact .nil
  | cons head tail ih => exact .cons ih

inductive EqualityExecution : List Symbol → List Symbol → Bool → Nat → Prop where
  | nil : EqualityExecution [] [] true 3
  | leftNil (head : Symbol) (tail : List Symbol) : EqualityExecution [] (head :: tail) false 3
  | rightNil (head : Symbol) (tail : List Symbol) : EqualityExecution (head :: tail) [] false 3
  | equal {left right : Symbol} {lefts rights : List Symbol} {output : Bool} {operations : Nat}
      (sameHead : (same right left).value = true)
      (rest : EqualityExecution lefts rights output operations) :
      EqualityExecution (left :: lefts) (right :: rights) output ((same right left).operations + operations + 8)
  | different {left right : Symbol} (lefts rights : List Symbol)
      (differentHead : (same right left).value ≠ true) :
      EqualityExecution (left :: lefts) (right :: rights) false ((same right left).operations + 8)

theorem equalWords_execution (left right : List Symbol) :
    EqualityExecution left right (equalWords left right).value (equalWords left right).operations := by
  induction right generalizing left with
  | nil => cases left with
    | nil => exact .nil
    | cons head tail => exact .rightNil head tail
  | cons head tail ih => cases left with
    | nil => exact .leftNil head tail
    | cons first rest =>
        simp only [equalWords]
        split
        next yes => exact .equal yes (ih rest)
        next no => exact .different rest tail no

end PureSFormal.Computation.ThreeCounterSymbolReadbackPrimitive

