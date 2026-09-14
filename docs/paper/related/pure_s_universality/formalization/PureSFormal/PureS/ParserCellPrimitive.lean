import PureSFormal.PureS.ParserCellSpinePrimitive

/-!
# Primitive immediate-cell parsing

One live or tombstone shell is inspected, and its tag is compared against the
two fixed value tags in public-parser order. The predecessor and tombstone
audit remain shared references. Every failed comparison contributes its work;
no recursive queue parsing is performed by this immediate-cell operation.
-/

namespace PureSFormal.PureS.ParserCellPrimitive

open ParserPrimitiveMachine

def result (isLive bit : Bool) (predecessor : Term) : CanonicalStep.CellResult :=
  if isLive then .live bit predecessor else .tombstone bit predecessor

def parse (term : Term) : Result (Option CanonicalStep.CellResult) :=
  let view := ParserCellSpinePrimitive.readView term
  match view.value with
  | .endpoint => ⟨none, view.operations + 1⟩
  | .invalid => ⟨none, view.operations + 1⟩
  | .cell isLive tag predecessor =>
      let first := equal tag (valueTag false)
      if first.value then
        ⟨some (result isLive false predecessor), view.operations + first.operations + 4⟩
      else
        let second := equal tag (valueTag true)
        if second.value then
          ⟨some (result isLive true predecessor),
            view.operations + first.operations + second.operations + 5⟩
        else
          ⟨none, view.operations + first.operations + second.operations + 3⟩

theorem invalid_none {term : Term}
    (found : (ParserCellSpinePrimitive.readView term).value = .invalid) :
    CanonicalStep.parseCell? term = none := by
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

theorem parse_value (term : Term) : (parse term).value = CanonicalStep.parseCell? term := by
  rw [parse]
  split
  · next found => rw [ParserCellSpinePrimitive.readView_endpoint found]; rfl
  · next found => exact (invalid_none found).symm
  · next isLive tag predecessor found =>
      rcases ParserCellSpinePrimitive.readView_cell found with ⟨rfl, rfl⟩ | ⟨rfl, audit, rfl⟩ <;>
        simp only [CanonicalStep.parseCell?, equal_value] <;>
          split <;> simp_all only [result, Result.value, Bool.false_eq_true, ↓reduceIte] <;>
          split <;> simp_all only [result, Result.value, Bool.false_eq_true, ↓reduceIte]

theorem tag_size_le {term tag predecessor : Term} {isLive : Bool}
    (found : (ParserCellSpinePrimitive.readView term).value = .cell isLive tag predecessor) :
    tag.size ≤ term.size := by
  rcases ParserCellSpinePrimitive.readView_cell found with ⟨rfl, rfl⟩ | ⟨rfl, audit, rfl⟩
  · exact Nat.le_trans (Nat.le_add_left _ _)
      (Nat.le_trans (Nat.le_add_right _ 1)
        (Nat.le_trans (Nat.le_add_right _ _) (Nat.le_add_right _ 1)))
  · exact Nat.le_trans (Nat.le_add_right _ _)
      (Nat.le_trans (Nat.le_add_right _ 1)
        (Nat.le_trans (Nat.le_add_left _ _) (Nat.le_add_right _ 1)))

theorem parse_operations_bound (term : Term) :
    (parse term).operations ≤ 11 + 4 * (term.size + 32) + 4 * (term.size + 32) + 5 := by
  have view := ParserCellSpinePrimitive.readView_operations_le term
  have small : 12 ≤ 11 + 4 * (term.size + 32) + 4 * (term.size + 32) + 5 := by
    have extra : 1 ≤ 4 * (term.size + 32) + 4 * (term.size + 32) + 5 :=
      Nat.le_trans (by decide : 1 ≤ 5) (Nat.le_add_left _ _)
    simpa only [Nat.add_assoc] using Nat.add_le_add_left extra 11
  rw [parse]
  split
  · exact Nat.le_trans (Nat.add_le_add_right view 1) small
  · exact Nat.le_trans (Nat.add_le_add_right view 1) small
  · next isLive tag predecessor found =>
      have first := Nat.le_trans (equal_operations_le tag (valueTag false))
        (Nat.mul_le_mul_left 4 (Nat.add_le_add (tag_size_le found)
          (ParserWordPrimitive.tag_size_le false)))
      have second := Nat.le_trans (equal_operations_le tag (valueTag true))
        (Nat.mul_le_mul_left 4 (Nat.add_le_add (tag_size_le found)
          (ParserWordPrimitive.tag_size_le true)))
      have common := Nat.add_le_add_right (Nat.add_le_add (Nat.add_le_add view first) second) 5
      dsimp only
      split
      · have firstBound := Nat.add_le_add_right (Nat.add_le_add view first) 4
        have ceiling := Nat.add_le_add
          (Nat.le_add_right (11 + 4 * (term.size + 32)) (4 * (term.size + 32)))
          (by decide : 4 ≤ 5)
        exact Nat.le_trans firstBound ceiling
      · split
        · exact common
        · exact Nat.le_trans (Nat.add_le_add_left (by decide : 3 ≤ 5) _) common

theorem parse_operations_le (term : Term) : (parse term).operations ≤ 8 * term.size + 272 := by
  have bound := parse_operations_bound term
  rw [show 8 = 4 + 4 by rfl, show 272 = 11 + 4 * 32 + 4 * 32 + 5 by rfl]
  simpa only [Nat.mul_add, Nat.add_mul, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using bound

end PureSFormal.PureS.ParserCellPrimitive
