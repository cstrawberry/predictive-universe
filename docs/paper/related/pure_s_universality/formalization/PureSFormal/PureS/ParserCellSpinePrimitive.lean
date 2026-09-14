import PureSFormal.PureS.ParserWordPrimitive

/-!
# Primitive execution of the live/tombstone queue parser

The view inspects only the cell shell. A tombstone's audit subtree is never
inspected or compared. Tag tests use counted short-circuit equality; live cells
copy the decoded prefix through counted append. Every failed comparison and
recursive failure contributes its actual work. The bounds concern the immutable
tree/list reference model of `ParserPrimitiveMachine`, on arbitrary input terms.
-/

namespace PureSFormal.PureS.ParserCellSpinePrimitive

open ParserPrimitiveMachine

inductive View where
  | endpoint
  | cell (appendLabel : Bool) (tag tail : Term)
  | invalid

def readView : Term → Result View
  | .s => ⟨.endpoint, 1⟩
  | .app .s _ => ⟨.invalid, 4⟩
  | .app (.app .s _) .s => ⟨.invalid, 8⟩
  | .app (.app .s predecessor) (.app tag _audit) => ⟨.cell false tag predecessor, 10⟩
  | .app (.app (.app left right) tag) tail =>
      match left, right with
      | .s, .s => ⟨.cell true tag tail, 11⟩
      | _, _ => ⟨.invalid, 11⟩

theorem readView_operations_le (term : Term) :
    (readView term).operations ≤ 11 := by
  fun_cases readView term <;> simp [readView]

theorem readView_cell {term tag tail : Term} {appendLabel : Bool}
    (found : (readView term).value = .cell appendLabel tag tail) :
    (appendLabel = true ∧ term = .app (.app (.app .s .s) tag) tail) ∨
    (appendLabel = false ∧ ∃ audit, term = .app (.app .s tail) (.app tag audit)) := by
  cases term with
  | s => cases found
  | app fn right =>
      cases fn with
      | s => cases found
      | app head payload =>
          cases head with
          | s =>
              cases right with
              | s => cases found
              | app foundTag audit =>
                  cases found
                  exact .inr ⟨rfl, audit, rfl⟩
          | app left rightHead =>
              cases left with
              | app _ _ => cases found
              | s =>
                  cases rightHead with
                  | app _ _ => cases found
                  | s =>
                      cases found
                      exact .inl ⟨rfl, rfl⟩

theorem readView_tail_lt {term tag tail : Term} {appendLabel : Bool}
    (found : (readView term).value = .cell appendLabel tag tail) : tail.size < term.size := by
  rcases readView_cell found with ⟨_, rfl⟩ | ⟨_, audit, rfl⟩
  · exact Nat.lt_succ_of_le (Nat.le_add_left tail.size _)
  · exact Nat.lt_trans
      (Nat.lt_succ_of_le (Nat.le_add_left tail.size _))
      (Nat.lt_succ_of_le (Nat.le_add_right _ _))

theorem readView_cell_budget {term tag tail : Term} {appendLabel : Bool}
    (found : (readView term).value = .cell appendLabel tag tail) :
    tag.size + tail.size + 6 ≤ term.size + 1 := by
  rcases readView_cell found with ⟨_, rfl⟩ | ⟨_, audit, rfl⟩
  · simp [Term.size, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
    simp only [← Nat.add_assoc]
    exact Nat.le_refl _
  · have positive := Nat.succ_le_of_lt audit.size_pos
    have summed := Nat.add_le_add_left positive (tag.size + tail.size + 5)
    have sizes : (Term.app (Term.app Term.s tail) (Term.app tag audit)).size + 1 =
        tag.size + tail.size + audit.size + 5 := by
      simp [Term.size, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
      simp only [← Nat.add_assoc]
    rw [sizes]
    simpa only [Nat.zero_add, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm,
      ← Nat.add_assoc] using summed

theorem readView_endpoint {term : Term}
    (found : (readView term).value = .endpoint) : term = .s := by
  fun_cases readView term <;> simp_all [readView]

theorem readView_invalid {term : Term}
    (found : (readView term).value = .invalid) : CellSpine.decode? term = none := by
  cases term with
  | s => cases found
  | app fn tail =>
      cases fn with
      | s => rfl
      | app head tag =>
          cases head with
          | s =>
              cases tail with
              | s => rfl
              | app _ _ => cases found
          | app left right =>
              cases left with
              | app _ _ => rfl
              | s =>
                  cases right with
                  | app _ _ => rfl
                  | s => cases found

def finish (parsed : Result (Option (List Bool))) (appendLabel bit : Bool) :
    Result (Option (List Bool)) :=
  if appendLabel then
    let output := ParserWordPrimitive.extend parsed bit
    ⟨output.value, 1 + output.operations⟩
  else
    ⟨parsed.value, 1 + parsed.operations⟩

theorem finish_value (parsed : Result (Option (List Bool))) (appendLabel bit : Bool) :
    (finish parsed appendLabel bit).value =
      if appendLabel then parsed.value.map (fun bits => bits ++ [bit]) else parsed.value := by
  cases appendLabel <;> simp [finish, ParserWordPrimitive.extend_value]

def parse (term : Term) : Result (Option (List Bool)) :=
  let view := readView term
  match found : view.value with
  | .endpoint => ⟨some [], view.operations + 2⟩
  | .invalid => ⟨none, view.operations + 1⟩
  | .cell appendLabel tag tail =>
      let first := equal tag (valueTag false)
      if first.value then
        let output := finish (parse tail) appendLabel false
        ⟨output.value, view.operations + first.operations + 1 + output.operations⟩
      else
        let second := equal tag (valueTag true)
        if second.value then
          let output := finish (parse tail) appendLabel true
          ⟨output.value, view.operations + first.operations + second.operations + 2 + output.operations⟩
        else
          ⟨none, view.operations + first.operations + second.operations + 3⟩
termination_by term.size
decreasing_by all_goals exact readView_tail_lt found

theorem parse_value (term : Term) :
    (parse term).value = CellSpine.decode? term := by
  induction term using WellFounded.induction (measure Term.size).wf with
  | h term ih =>
      rw [parse]
      split
      · next found => rw [readView_endpoint found]; rfl
      · next found => exact (readView_invalid found).symm
      · next appendLabel tag tail found =>
          have inner := ih tail (readView_tail_lt found)
          dsimp only
          simp only [equal_value]
          rcases readView_cell found with ⟨rfl, rfl⟩ | ⟨rfl, audit, rfl⟩ <;>
            simp only [CellSpine.decode?] <;>
            split <;> simp_all only [Result.value, finish_value, inner, Bool.false_eq_true,
              ↓reduceIte] <;>
            split <;> simp_all only [Result.value, finish_value, inner, Bool.false_eq_true,
              ↓reduceIte]

theorem decoded_length_le {term : Term} {bits : List Bool}
    (decoded : CellSpine.Decodes term bits) : bits.length ≤ term.size := by
  induction decoded with
  | omega => exact Nat.zero_le _
  | live bit inner ih =>
      simp only [List.length_append, List.length_singleton]
      exact Nat.add_le_add_right (Nat.le_trans ih (Nat.le_add_left _ _)) 1
  | tombstone bit audit inner ih =>
      exact Nat.le_trans ih (Nat.le_trans (Nat.le_add_left _ _)
        (Nat.le_trans (Nat.le_add_right _ 1)
          (Nat.le_trans (Nat.le_add_right _ _) (Nat.le_add_right _ 1))))

theorem parsed_length_le {term : Term} {bits : List Bool}
    (found : (parse term).value = some bits) : bits.length ≤ term.size :=
  decoded_length_le (CellSpine.decode?_sound ((parse_value term).symm.trans found))

theorem finish_parse_operations_le (term : Term) (appendLabel bit : Bool) :
    (finish (parse term) appendLabel bit).operations ≤
      (parse term).operations + 4 * term.size + 6 := by
  cases appendLabel with
  | false =>
      simp only [finish, Bool.false_eq_true, ↓reduceIte, Result.operations]
      calc
        1 + (parse term).operations = (parse term).operations + 1 := Nat.add_comm _ _
        _ ≤ (parse term).operations + 6 := Nat.add_le_add_left (by decide : 1 ≤ 6) _
        _ ≤ _ := Nat.add_le_add_right (Nat.le_add_right _ _) 6
  | true =>
      simp only [finish, ↓reduceIte, Result.operations, ParserWordPrimitive.extend]
      split
      · simp only [Result.operations]
        calc
          1 + ((parse term).operations + 2) = (parse term).operations + 3 := by
            simp only [Nat.add_comm 1, Nat.add_assoc]
          _ ≤ (parse term).operations + 6 := Nat.add_le_add_left (by decide : 3 ≤ 6) _
          _ ≤ _ := Nat.add_le_add_right (Nat.le_add_right _ _) 6
      · next bits found =>
          have length := parsed_length_le found
          simp only [appendBit_operations]
          have h := Nat.add_le_add_right
            (Nat.add_le_add_left (Nat.mul_le_mul_left 4 length) (parse term).operations) 6
          simpa only [show 6 = 1 + 2 + 3 by rfl, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
            using h

theorem cell_overhead_le (tag tail : Nat) :
    11 + 4 * (tag + 32) + 4 * (tag + 32) + 3 + (4 * tail + 6) ≤
      129 * (tag + tail + 6) := by
  have old := Nat.add_le_add_right (ParserWordPrimitive.cell_overhead_le tag tail) 1
  have extra : 1 ≤ tag + tail + 6 :=
    Nat.le_trans (by decide : 1 ≤ 6) (Nat.le_add_left 6 _)
  have extended := Nat.add_le_add_left extra (128 * (tag + tail + 6))
  calc
    _ ≤ 128 * (tag + tail + 6) + 1 := by
      simpa only [show 6 = 5 + 1 by rfl, Nat.add_assoc] using old
    _ ≤ 128 * (tag + tail + 6) + (tag + tail + 6) := extended
    _ = _ := by rw [show 129 = 128 + 1 by rfl, Nat.add_mul, Nat.one_mul]

theorem parse_operations_le (term : Term) :
    (parse term).operations ≤ 129 * (term.size + 1) ^ 2 := by
  induction term using WellFounded.induction (measure Term.size).wf with
  | h term ih =>
      have viewCost := readView_operations_le term
      have squareBase : term.size + 1 ≤ (term.size + 1) ^ 2 :=
        Nat.le_trans (Nat.le_add_left _ _) (ParserWordPrimitive.square_descent
          (small := 0) term.size_pos)
      have minimumBudget : 129 ≤ 129 * (term.size + 1) ^ 2 :=
        Nat.le_trans
          (by simpa only [Nat.mul_one] using
            Nat.mul_le_mul_left 129 (Nat.le_add_left 1 term.size))
          (Nat.mul_le_mul_left 129 squareBase)
      rw [parse]
      split
      · simp only [Result.operations]
        exact Nat.le_trans (Nat.add_le_add_right viewCost 2)
          (Nat.le_trans (by decide : 11 + 2 ≤ 129) minimumBudget)
      · simp only [Result.operations]
        exact Nat.le_trans (Nat.add_le_add_right viewCost 1)
          (Nat.le_trans (by decide : 11 + 1 ≤ 129) minimumBudget)
      · next appendLabel tag tail found =>
          have smaller := readView_tail_lt found
          have inner := ih tail smaller
          have outputFalse := finish_parse_operations_le tail appendLabel false
          have outputTrue := finish_parse_operations_le tail appendLabel true
          have firstBound : (equal tag (valueTag false)).operations ≤
              4 * (tag.size + 32) :=
            Nat.le_trans (equal_operations_le tag (valueTag false))
              (Nat.mul_le_mul_left 4 (Nat.add_le_add_left (ParserWordPrimitive.tag_size_le false) _))
          have secondBound : (equal tag (valueTag true)).operations ≤
              4 * (tag.size + 32) :=
            Nat.le_trans (equal_operations_le tag (valueTag true))
              (Nat.mul_le_mul_left 4 (Nat.add_le_add_left (ParserWordPrimitive.tag_size_le true) _))
          have comparisons := Nat.add_le_add (Nat.add_le_add viewCost firstBound) secondBound
          have common := Nat.add_le_add (Nat.add_le_add_right comparisons 3)
            (Nat.le_refl ((parse tail).operations + 4 * tail.size + 6))
          have overhead := Nat.le_trans (cell_overhead_le tag.size tail.size)
            (Nat.mul_le_mul_left 129 (readView_cell_budget found))
          have descend := Nat.mul_le_mul_left 129 (ParserWordPrimitive.square_descent smaller)
          rw [Nat.mul_add] at descend
          have ceiling :
              11 + 4 * (tag.size + 32) + 4 * (tag.size + 32) + 3 +
                ((parse tail).operations + 4 * tail.size + 6) ≤
                  129 * (term.size + 1) ^ 2 := by
            calc
              _ = (parse tail).operations +
                  (11 + 4 * (tag.size + 32) + 4 * (tag.size + 32) + 3 + (4 * tail.size + 6)) := by
                    simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
              _ ≤ 129 * (tail.size + 1) ^ 2 + 129 * (term.size + 1) :=
                Nat.add_le_add inner overhead
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

end PureSFormal.PureS.ParserCellSpinePrimitive
