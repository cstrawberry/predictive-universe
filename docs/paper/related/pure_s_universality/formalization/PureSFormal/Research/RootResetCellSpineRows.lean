import PureSFormal.Research.RootResetLabelledEdgeProbe

/-!
# Transparent cell descent and exact finite inverse

Live and tombstone predecessor rows form a fixed four-row family. Their
nearest parent function identifies the inverse address length, making the
inverse deterministic even on malformed syntax. A fresh halt argument is
an exact stopping boundary independently of all surrounding parents.
-/
namespace PureSFormal.Research.RootResetCellSpineRows
open PureSFormal.PureS
open RootResetCarrierEdgePatterns
open RootResetCarrierInverseUnique
open RootResetCompletedLocalPatterns

def liveRow (bit : Bool) : EdgeRow :=
  ⟨RootResetCarrierNonemptyAgreement.livePattern bit, [.right]⟩

abbrev tombRow := RootResetCarrierNonemptyRows.tombstoneRow

def rows : List EdgeRow := [liveRow false, liveRow true, tombRow false, tombRow true]

theorem row_cases (row : EdgeRow) (member : row ∈ rows) :
    row = liveRow false ∨ row = liveRow true ∨ row = tombRow false ∨ row = tombRow true := by
  rcases List.mem_cons.mp member with equal | later
  · exact Or.inl equal
  rcases List.mem_cons.mp later with equal | later
  · exact Or.inr (Or.inl equal)
  rcases List.mem_cons.mp later with equal | later
  · exact Or.inr (Or.inr (Or.inl equal))
  exact Or.inr (Or.inr (Or.inr (List.mem_singleton.mp later)))

theorem valid : RootResetEdgeFragment.Valid rows := by
  intro row member
  rcases row_cases row member with h | h | h | h <;> subst row <;>
    refine ⟨(by intro h; cases h), RootResetCarrierNonemptyRows.supports_subterm _ _ (by rfl)⟩

def lengthFor (function : Term) : Nat := if function = .s then 2 else 1

theorem anchored_length (row : EdgeRow) (member : row ∈ rows) :
    ∃ function, AtParent function row.pattern row.address ∧ row.address.length = lengthFor function ∧
      (function = .s ∨ function = live false ∨ function = live true) := by
  rcases row_cases row member with h | h | h | h <;> subst row
  · exact ⟨live false, .here .hole, rfl, Or.inr (Or.inl rfl)⟩
  · exact ⟨live true, .here .hole, rfl, Or.inr (Or.inr rfl)⟩
  · exact ⟨.s, .left _ (.here .hole), rfl, Or.inl rfl⟩
  · exact ⟨.s, .left _ (.here .hole), rfl, Or.inl rfl⟩

theorem inverse_unique (row candidate : EdgeRow) (member : row ∈ rows) (candidateMember : candidate ∈ rows)
    (origin ancestor endpoint : Cursor)
    (actual : RootResetInverseEdgeFragment.backResult row.address.reverse row.pattern endpoint = some origin)
    (other : RootResetInverseEdgeFragment.backResult candidate.address.reverse candidate.pattern endpoint = some ancestor) :
    ancestor = origin := by
  obtain ⟨function, anchored, lengthEq, _⟩ := anchored_length row member
  obtain ⟨candidateFunction, candidateAnchored, candidateLength, _⟩ := anchored_length candidate candidateMember
  have actualForward := RootResetInverseEdgeFragment.backResult_follow _ _ endpoint origin actual
  have candidateForward := RootResetInverseEdgeFragment.backResult_follow _ _ endpoint ancestor other
  rw [List.reverse_reverse] at actualForward candidateForward
  have firstFunction := atParent_follow anchored origin endpoint
    (RootResetInverseEdgeFragment.backResult_matches _ _ endpoint origin actual) actualForward
  have secondFunction := atParent_follow candidateAnchored ancestor endpoint
    (RootResetInverseEdgeFragment.backResult_matches _ _ endpoint ancestor other) candidateForward
  have sameFunction : candidateFunction = function := Option.some.inj (secondFunction.symm.trans firstFunction)
  have lengths : candidate.address.reverse.length = row.address.reverse.length := by
    rw [List.length_reverse, List.length_reverse, candidateLength, lengthEq, sameFunction]
  have firstClimb := back_climb _ _ endpoint ancestor other
  have secondClimb := back_climb _ _ endpoint origin actual
  rw [lengths] at firstClimb
  exact Option.some.inj (firstClimb.symm.trans secondClimb)

theorem inverts : RootResetLabelledEdgeProbe.Inverts rows := by
  intro row member origin endpoint matched followed
  have actual := RootResetInverseEdgeFragment.backResult_complete row.address.reverse row.pattern origin endpoint
    (by simpa only [List.reverse_reverse] using followed) matched
  obtain ⟨ancestor, found⟩ := family_exists rows row member endpoint origin actual
  obtain ⟨candidate, candidateMember, other⟩ := RootResetInverseEdgeSpine.familyResult_sound rows endpoint ancestor found
  have equal := inverse_unique row candidate member candidateMember origin ancestor endpoint actual other
  exact equal ▸ found

theorem halt_boundary (source : Term) (parents : List ParentFrame) :
    RootResetInverseEdgeSpine.familyResult rows ⟨source, .right haltCode :: parents⟩ = none := by
  cases found : RootResetInverseEdgeSpine.familyResult rows ⟨source, .right haltCode :: parents⟩ with
  | none => rfl
  | some ancestor =>
      obtain ⟨row, member, back⟩ := RootResetInverseEdgeSpine.familyResult_sound rows _ ancestor found
      obtain ⟨function, anchored, lengthEq, options⟩ := anchored_length row member
      have forward := RootResetInverseEdgeFragment.backResult_follow _ _ _ ancestor back
      rw [List.reverse_reverse] at forward
      have same := atParent_follow anchored ancestor ⟨source, .right haltCode :: parents⟩
        (RootResetInverseEdgeFragment.backResult_matches _ _ _ ancestor back) forward
      have equal : haltCode = function := Option.some.inj same
      rcases options with hs | hfalse | htrue
      · rw [hs] at equal; cases equal
      · rw [hfalse] at equal; cases equal
      · rw [htrue] at equal; cases equal

theorem live_sound (bit : Bool) (source : Term)
    (matched : (liveRow bit).pattern.matchesBool source = true) :
    ∃ predecessor, source = .app (live bit) predecessor := by
  obtain ⟨function, predecessor, shape, matchedFunction, _⟩ := app_matches matched
  have equal := (literal_matches (live bit) function).mp matchedFunction
  exact ⟨predecessor, by rw [shape, equal]⟩

theorem selected_live (bit : Bool) (predecessor : Term) :
    RootResetEdgeFragment.select rows (.app (live bit) predecessor) = some (liveRow bit) := by
  cases bit <;> simp only [RootResetEdgeFragment.select, rows, liveRow,
    RootResetCarrierNonemptyAgreement.livePattern, Pattern.matchesBool, literal_self,
    Bool.true_and, Bool.and_true, ↓reduceIte] <;> rfl

theorem selected_tombstone (bit : Bool) (predecessor audit : Term) :
    RootResetEdgeFragment.select rows (Carrier.tombstone bit predecessor audit) = some (tombRow bit) := by
  cases bit <;> simp only [RootResetEdgeFragment.select, rows, liveRow,
    RootResetCarrierNonemptyAgreement.livePattern, RootResetCarrierNonemptyRows.tombstoneRow,
    RootResetCarrierNonemptyRows.tombstonePattern, Carrier.tombstone, Pattern.matchesBool,
    literal_self, Bool.true_and, Bool.and_true, ↓reduceIte] <;> rfl

end PureSFormal.Research.RootResetCellSpineRows
