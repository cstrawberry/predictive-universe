import PureSFormal.PureS.ParserPrimitiveMachine
import PureSFormal.PureS.CheckpointDecoder

/-!
# Primitive execution of the literal input-word parser

The shallow view reads at most three application constructors and two leaf
constructors. It counts every constructor inspection and both field reads of
each application it opens. Tag comparisons use short-circuit tree equality;
successful decoding copies the accumulated output through the counted append
operation. Failed tag comparisons and failed recursive parses retain their
actual costs. The input is an arbitrary term; reachability is not assumed.
-/

namespace PureSFormal.PureS.ParserWordPrimitive

open ParserPrimitiveMachine

inductive View where
  | endpoint
  | cell (tag tail : Term)
  | invalid

def readView : Term → Result View
  | .s => ⟨.endpoint, 1⟩
  | .app .s _ => ⟨.invalid, 4⟩
  | .app (.app .s _) _ => ⟨.invalid, 7⟩
  | .app (.app (.app left right) tag) tail =>
      match left, right with
      | .s, .s => ⟨.cell tag tail, 11⟩
      | _, _ => ⟨.invalid, 11⟩

theorem readView_operations_le (term : Term) :
    (readView term).operations ≤ 11 := by
  fun_cases readView term <;> simp [readView]

theorem readView_cell {term tag tail : Term}
    (found : (readView term).value = .cell tag tail) :
    term = .app (.app (.app .s .s) tag) tail := by
  fun_cases readView term <;> simp_all [readView]

theorem readView_tail_lt {term tag tail : Term}
    (found : (readView term).value = .cell tag tail) : tail.size < term.size := by
  rw [readView_cell found]
  exact Nat.lt_succ_of_le (Nat.le_add_left tail.size _)

def extend (parsed : Result (Option (List Bool))) (bit : Bool) :
    Result (Option (List Bool)) :=
  match parsed.value with
  | none => ⟨none, parsed.operations + 2⟩
  | some bits =>
      let output := appendBit bits bit
      ⟨some output.value, parsed.operations + 2 + output.operations⟩

theorem extend_value (parsed : Result (Option (List Bool))) (bit : Bool) :
    (extend parsed bit).value = parsed.value.map (fun bits => bits ++ [bit]) := by
  simp only [extend]
  split <;> simp_all [appendBit_value]

def parse (term : Term) : Result (Option (List Bool)) :=
  let view := readView term
  match found : view.value with
  | .endpoint => ⟨some [], view.operations + 2⟩
  | .invalid => ⟨none, view.operations + 1⟩
  | .cell tag tail =>
      let first := equal tag (valueTag false)
      if first.value then
        let output := extend (parse tail) false
        ⟨output.value, view.operations + first.operations + 1 + output.operations⟩
      else
        let second := equal tag (valueTag true)
        if second.value then
          let output := extend (parse tail) true
          ⟨output.value, view.operations + first.operations + second.operations + 2 + output.operations⟩
        else
          ⟨none, view.operations + first.operations + second.operations + 3⟩
termination_by term.size
decreasing_by all_goals exact readView_tail_lt found

theorem readView_endpoint {term : Term}
    (found : (readView term).value = .endpoint) : term = .s := by
  fun_cases readView term <;> simp_all [readView]

theorem readView_invalid {term : Term}
    (found : (readView term).value = .invalid) : CheckpointDecoder.parseWord? term = none := by
  cases term with
  | s => cases found
  | app fn tail =>
      cases fn with
      | s => rfl
      | app head tag =>
          cases head with
          | s => rfl
          | app left right =>
              cases left with
              | app _ _ => rfl
              | s =>
                  cases right with
                  | app _ _ => rfl
                  | s => cases found

theorem parse_value (term : Term) :
    (parse term).value = CheckpointDecoder.parseWord? term := by
  induction term using WellFounded.induction (measure Term.size).wf with
  | h term ih =>
      rw [parse]
      split
      · next found =>
          rw [readView_endpoint found]
          rfl
      · next found => exact (readView_invalid found).symm
      · next tag tail found =>
          have inner := ih tail (readView_tail_lt found)
          have shape := readView_cell found
          dsimp only
          simp only [equal_value]
          split
          · next yes =>
              simp only [Result.value, extend_value, inner, shape,
                CheckpointDecoder.parseWord?, yes, ↓reduceIte]
          · next no =>
              split
              · next yes =>
                  simp only [Result.value, extend_value, inner, shape,
                    CheckpointDecoder.parseWord?, no, yes,
                    CellSpine.valueTag_true_ne_false, ↓reduceIte]
              · next noTrue =>
                  simp only [Result.value, shape, CheckpointDecoder.parseWord?, no, noTrue, ↓reduceIte]

theorem foldl_size_lower (bits : List Bool) (start : Term) :
    bits.length + start.size ≤
      (bits.foldl (fun tail bit => .app (live bit) tail) start).size := by
  induction bits generalizing start with
  | nil => simp
  | cons bit bits ih =>
      have rest := ih (.app (live bit) start)
      simp only [List.length_cons, List.foldl_cons, Term.size] at *
      have leading := Nat.add_le_add_left (Nat.le_add_left start.size (live bit).size)
        bits.length
      exact Nat.le_trans (by simpa [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
        using Nat.add_le_add_right leading 1) rest

theorem parsed_length_le {term : Term} {bits : List Bool}
    (found : (parse term).value = some bits) : bits.length ≤ term.size := by
  have exactWord := CheckpointDecoder.parseWord?_sound ((parse_value term).symm.trans found)
  have length := foldl_size_lower bits omega
  rw [exactWord]
  exact Nat.le_trans (Nat.le_add_right _ _) length

theorem extend_parse_operations_le (term : Term) (bit : Bool) :
    (extend (parse term) bit).operations ≤ (parse term).operations + 4 * term.size + 5 := by
  simp only [extend]
  split
  · simp only [Result.operations]
    exact Nat.add_le_add (Nat.le_add_right _ _) (by decide : 2 ≤ 5)
  · next bits found =>
      have length := parsed_length_le found
      simp only [appendBit_operations]
      calc
        _ = (parse term).operations + 4 * bits.length + 5 := by
          rw [show 5 = 2 + 3 by rfl]
          simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
        _ ≤ _ := Nat.add_le_add_right
          (Nat.add_le_add_left (Nat.mul_le_mul_left 4 length) (parse term).operations) 5

theorem square_descent {small large : Nat} (smaller : small < large) :
    (small + 1) ^ 2 + (large + 1) ≤ (large + 1) ^ 2 := by
  have bounded := Nat.pow_le_pow_left (Nat.succ_le_of_lt smaller) 2
  calc
    (small + 1) ^ 2 + (large + 1) ≤ large ^ 2 + (large + 1) :=
      Nat.add_le_add_right bounded _
    _ ≤ (large + 1) ^ 2 := by
      have add := Nat.add_le_add_right
        (Nat.add_le_add_left (Nat.le_add_right large large) (large * large)) 1
      simpa [Nat.pow_two, Nat.add_mul, Nat.mul_add, Nat.one_mul, Nat.mul_one,
        Nat.add_assoc] using add

theorem tag_size_le (bit : Bool) : (valueTag bit).size ≤ 32 := by
  cases bit <;> decide

theorem cell_overhead_le (tag tail : Nat) :
    11 + 4 * (tag + 32) + 4 * (tag + 32) + 3 + (4 * tail + 5) ≤
      128 * (tag + tail + 6) := by
  calc
    _ = 8 * tag + 4 * tail + 275 := by
      rw [show 8 = 4 + 4 by rfl, Nat.add_mul,
        show 275 = 11 + 128 + 128 + 3 + 5 by rfl]
      simp only [Nat.mul_add]
      rw [show 4 * 32 = 128 by rfl]
      simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
    _ ≤ 128 * tag + 128 * tail + 768 :=
      Nat.add_le_add (Nat.add_le_add
        (Nat.mul_le_mul_right tag (by decide : 8 ≤ 128))
        (Nat.mul_le_mul_right tail (by decide : 4 ≤ 128)))
        (by decide : 275 ≤ 768)
    _ = _ := by simp only [Nat.mul_add]

theorem parse_operations_le (term : Term) :
    (parse term).operations ≤ 128 * (term.size + 1) ^ 2 := by
  induction term using WellFounded.induction (measure Term.size).wf with
  | h term ih =>
      have viewCost := readView_operations_le term
      have positive := term.size_pos
      have squareBase : term.size + 1 ≤ (term.size + 1) ^ 2 := by
        have step := square_descent (small := 0) positive
        exact Nat.le_trans (Nat.le_add_left _ _) step
      have budgetBase := Nat.mul_le_mul_left 128 squareBase
      have minimumBudget : 128 ≤ 128 * (term.size + 1) ^ 2 :=
        Nat.le_trans
          (by simpa only [Nat.mul_one] using
            Nat.mul_le_mul_left 128 (Nat.le_add_left 1 term.size)) budgetBase
      rw [parse]
      split
      · simp only [Result.operations]
        exact Nat.le_trans (Nat.add_le_add_right viewCost 2)
          (Nat.le_trans (by decide : 11 + 2 ≤ 128) minimumBudget)
      · simp only [Result.operations]
        exact Nat.le_trans (Nat.add_le_add_right viewCost 1)
          (Nat.le_trans (by decide : 11 + 1 ≤ 128) minimumBudget)
      · next tag tail found =>
          have smaller := readView_tail_lt found
          have inner := ih tail smaller
          have outputFalse := extend_parse_operations_le tail false
          have outputTrue := extend_parse_operations_le tail true
          have shape := readView_cell found
          have sizes : tag.size + tail.size + 5 = term.size := by
            rw [shape]
            simp [Term.size, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
            simp only [← Nat.add_assoc] <;> rfl
          have first := equal_operations_le tag (valueTag false)
          have second := equal_operations_le tag (valueTag true)
          have firstTag := tag_size_le false
          have secondTag := tag_size_le true
          have descend := Nat.mul_le_mul_left 128 (square_descent smaller)
          rw [Nat.mul_add] at descend
          have firstBound : (equal tag (valueTag false)).operations ≤
              4 * (tag.size + 32) :=
            Nat.le_trans first (Nat.mul_le_mul_left 4 (Nat.add_le_add_left firstTag _))
          have secondBound : (equal tag (valueTag true)).operations ≤
              4 * (tag.size + 32) :=
            Nat.le_trans second (Nat.mul_le_mul_left 4 (Nat.add_le_add_left secondTag _))
          have comparisons := Nat.add_le_add (Nat.add_le_add viewCost firstBound) secondBound
          have common := Nat.add_le_add (Nat.add_le_add_right comparisons 3)
            (Nat.le_refl ((parse tail).operations + 4 * tail.size + 5))
          have ceiling :
              11 + 4 * (tag.size + 32) + 4 * (tag.size + 32) + 3 +
                ((parse tail).operations + 4 * tail.size + 5) ≤
                  128 * (term.size + 1) ^ 2 := by
            calc
              _ = (parse tail).operations +
                  (11 + 4 * (tag.size + 32) + 4 * (tag.size + 32) + 3 + (4 * tail.size + 5)) := by
                    simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
              _ ≤ 128 * (tail.size + 1) ^ 2 + 128 * (term.size + 1) := by
                apply Nat.add_le_add inner
                simpa only [← sizes, Nat.add_assoc] using cell_overhead_le tag.size tail.size
              _ ≤ _ := descend
          have total := Nat.le_trans common ceiling
          dsimp only
          split
          · simp only [Result.operations]
            have leading := Nat.add_le_add
              (Nat.le_add_right ((readView term).operations + (equal tag (valueTag false)).operations)
                (equal tag (valueTag true)).operations) (by decide : 1 ≤ 3)
            exact Nat.le_trans (Nat.add_le_add leading outputFalse) total
          · split <;> simp only [Result.operations]
            · have leading := Nat.add_le_add_left (by decide : 2 ≤ 3)
                ((readView term).operations + (equal tag (valueTag false)).operations +
                  (equal tag (valueTag true)).operations)
              exact Nat.le_trans (Nat.add_le_add leading outputTrue) total
            · exact Nat.le_trans (Nat.le_add_right _ _) total

end PureSFormal.PureS.ParserWordPrimitive
