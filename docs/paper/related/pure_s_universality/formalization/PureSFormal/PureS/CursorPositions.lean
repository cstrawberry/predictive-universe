import PureSFormal.PureS.Cursor

/-!
# Finite occurrence enumeration for one-cursor states

For a fixed bare occurrence tree there are only finitely many possible cursor
positions.  This module enumerates those positions directly, retains the exact
zipper at each occurrence, and proves completeness for every cursor whose
erasure is the fixed tree.  The construction is executable and introduces no
address or stack into finite controller state.
-/

namespace PureSFormal.PureS

namespace Cursor

/-- Every occurrence below `focus`, carrying the supplied outer parent links. -/
def positions : (focus : Term) → (parents : List ParentFrame) → List Cursor
  | .s, parents => [⟨.s, parents⟩]
  | .app fn arg, parents =>
      ⟨.app fn arg, parents⟩ ::
        (positions fn (.left arg :: parents) ++
          positions arg (.right fn :: parents))

@[simp]
theorem self_mem_positions (focus : Term) (parents : List ParentFrame) :
    (⟨focus, parents⟩ : Cursor) ∈ positions focus parents := by
  cases focus <;> simp [positions]

/-- Descendants of an enumerated occurrence remain in the outer enumeration. -/
theorem positions_subset_of_mem
    {outerFocus innerFocus : Term}
    {outerParents innerParents : List ParentFrame}
    (innerMem :
      (⟨innerFocus, innerParents⟩ : Cursor) ∈
        positions outerFocus outerParents) :
    ∀ {cursor : Cursor},
      cursor ∈ positions innerFocus innerParents →
        cursor ∈ positions outerFocus outerParents := by
  induction outerFocus generalizing outerParents with
  | s =>
      simp only [positions, List.mem_singleton] at innerMem
      cases innerMem
      intro cursor cursorMem
      exact cursorMem
  | app fn arg fnIH argIH =>
      simp only [positions, List.mem_cons, List.mem_append] at innerMem
      rcases innerMem with atRoot | inLeft | inRight
      · cases atRoot
        intro cursor cursorMem
        exact cursorMem
      · intro cursor cursorMem
        simp only [positions, List.mem_cons, List.mem_append]
        exact Or.inr (Or.inl (fnIH inLeft cursorMem))
      · intro cursor cursorMem
        simp only [positions, List.mem_cons, List.mem_append]
        exact Or.inr (Or.inr (argIH inRight cursorMem))

/-- Every zipper is one of the positions of its erased bare term. -/
theorem mem_positions_erase (cursor : Cursor) :
    cursor ∈ positions cursor.erase [] := by
  rcases cursor with ⟨focus, parents⟩
  induction parents generalizing focus with
  | nil =>
      exact self_mem_positions focus []
  | cons frame parents ih =>
      let parent : Cursor := ⟨frame.fill focus, parents⟩
      have parentMem : parent ∈ positions parent.erase [] :=
        ih (frame.fill focus)
      have eraseEq : parent.erase = (Cursor.mk focus (frame :: parents)).erase :=
        rfl
      rw [eraseEq] at parentMem
      apply positions_subset_of_mem parentMem
      cases frame with
      | left rightSibling =>
          simp only [ParentFrame.fill, positions, List.mem_cons,
            List.mem_append]
          exact Or.inr (Or.inl (self_mem_positions focus
            (.left rightSibling :: parents)))
      | right leftSibling =>
          simp only [ParentFrame.fill, positions, List.mem_cons,
            List.mem_append]
          exact Or.inr (Or.inr (self_mem_positions focus
            (.right leftSibling :: parents)))

/-- The enumeration has exactly one cursor per syntax-tree node. -/
@[simp]
theorem length_positions (focus : Term) (parents : List ParentFrame) :
    (positions focus parents).length = focus.size := by
  induction focus generalizing parents with
  | s => rfl
  | app fn arg fnIH argIH =>
      simp only [positions, List.length_cons, List.length_append,
        fnIH, argIH, Term.size]

/-- Every enumerated cursor erases to the root represented by the input zipper. -/
theorem erase_eq_of_mem_positions
    {rootFocus : Term} {rootParents : List ParentFrame} {cursor : Cursor}
    (membership : cursor ∈ positions rootFocus rootParents) :
    cursor.erase = (⟨rootFocus, rootParents⟩ : Cursor).erase := by
  induction rootFocus generalizing rootParents with
  | s =>
      simp only [positions, List.mem_singleton] at membership
      cases membership
      rfl
  | app fn arg fnIH argIH =>
      simp only [positions, List.mem_cons, List.mem_append] at membership
      rcases membership with atRoot | inLeft | inRight
      · cases atRoot
        rfl
      · exact (fnIH inLeft).trans rfl
      · exact (argIH inRight).trans rfl

end Cursor

end PureSFormal.PureS
