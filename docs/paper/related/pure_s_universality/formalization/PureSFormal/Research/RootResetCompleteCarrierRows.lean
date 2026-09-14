import PureSFormal.Research.RootResetCellSpineRows

/-!
Complete designated carrier descent including live predecessors. The inverse
is exact on arbitrary syntax: live-parent functions are disjoint from the S/p
anchors of Base, Local and tombstone rows.
-/
namespace PureSFormal.Research.RootResetCompleteCarrierRows
open PureSFormal.PureS
open RootResetCarrierEdgePatterns RootResetCarrierInverseUnique

abbrev liveRow := RootResetCellSpineRows.liveRow
def liveRows : List EdgeRow := [liveRow false, liveRow true]
def rows (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : List EdgeRow :=
  RootResetCarrierNonemptyRows.rows program tree ++ liveRows

theorem live_member (row : EdgeRow) (member : row ∈ liveRows) : ∃ bit, row = liveRow bit := by
  rcases List.mem_cons.mp member with first | second
  · exact ⟨false, first⟩
  · exact ⟨true, List.mem_singleton.mp second⟩

theorem valid (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : RootResetEdgeFragment.Valid (rows program tree) := by
  intro row member
  rcases List.mem_append.mp member with ordinary | live
  · exact RootResetCarrierNonemptyRows.valid program tree row ordinary
  · obtain ⟨bit, equal⟩ := live_member row live
    subst row
    exact ⟨(by intro h; cases h), RootResetCarrierNonemptyRows.supports_subterm _ _ rfl⟩

theorem live_parent (bit : Bool) (origin endpoint : Cursor)
    (back : RootResetInverseEdgeFragment.backResult (liveRow bit).address.reverse (liveRow bit).pattern endpoint = some origin) :
    parentFunction endpoint = some (live bit) := by
  have forward := RootResetInverseEdgeFragment.backResult_follow _ _ endpoint origin back
  rw [List.reverse_reverse] at forward
  exact atParent_follow (AtParent.here .hole) origin endpoint
    (RootResetInverseEdgeFragment.backResult_matches _ _ endpoint origin back) forward

theorem ordinary_live_disjoint (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (row : EdgeRow) (member : row ∈ RootResetCarrierNonemptyRows.rows program tree)
    (bit : Bool) (origin ancestor endpoint : Cursor)
    (ordinary : RootResetInverseEdgeFragment.backResult row.address.reverse row.pattern endpoint = some origin)
    (liveBack : RootResetInverseEdgeFragment.backResult (liveRow bit).address.reverse (liveRow bit).pattern endpoint = some ancestor) : False := by
  have forward := RootResetInverseEdgeFragment.backResult_follow _ _ endpoint origin ordinary
  rw [List.reverse_reverse] at forward
  have endFound := row_edgeEnd program tree row member origin endpoint
    (RootResetInverseEdgeFragment.backResult_matches _ _ endpoint origin ordinary) forward
  rw [live_parent bit ancestor endpoint liveBack] at endFound
  have noEnd : edgeEnd (some (live bit)) (sides endpoint) = none := by cases bit <;> rfl
  rw [noEnd] at endFound
  cases endFound

theorem inverse_unique (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (row candidate : EdgeRow) (member : row ∈ rows program tree) (candidateMember : candidate ∈ rows program tree)
    (origin ancestor endpoint : Cursor)
    (actual : RootResetInverseEdgeFragment.backResult row.address.reverse row.pattern endpoint = some origin)
    (other : RootResetInverseEdgeFragment.backResult candidate.address.reverse candidate.pattern endpoint = some ancestor) :
    ancestor = origin := by
  rcases List.mem_append.mp member with ordinary | live
  · rcases List.mem_append.mp candidateMember with candidateOrdinary | candidateLive
    · exact RootResetCarrierInverseUnique.inverse_unique program tree row candidate ordinary candidateOrdinary origin ancestor endpoint actual other
    · obtain ⟨bit, equal⟩ := live_member candidate candidateLive
      subst candidate
      exact False.elim (ordinary_live_disjoint program tree row ordinary bit origin ancestor endpoint actual other)
  · obtain ⟨bit, equal⟩ := live_member row live
    subst row
    rcases List.mem_append.mp candidateMember with candidateOrdinary | candidateLive
    · exact False.elim (ordinary_live_disjoint program tree candidate candidateOrdinary bit ancestor origin endpoint other actual)
    · obtain ⟨candidateBit, equal⟩ := live_member candidate candidateLive
      subst candidate
      have firstClimb := back_climb _ _ endpoint ancestor other
      have secondClimb := back_climb _ _ endpoint origin actual
      exact Option.some.inj (firstClimb.symm.trans secondClimb)

theorem inverts (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : RootResetLabelledEdgeProbe.Inverts (rows program tree) := by
  intro row member origin endpoint matched followed
  have actual := RootResetInverseEdgeFragment.backResult_complete row.address.reverse row.pattern origin endpoint
    (by simpa only [List.reverse_reverse] using followed) matched
  obtain ⟨ancestor, found⟩ := family_exists (rows program tree) row member endpoint origin actual
  obtain ⟨candidate, candidateMember, other⟩ := RootResetInverseEdgeSpine.familyResult_sound (rows program tree) endpoint ancestor found
  have equal := inverse_unique program tree row candidate member candidateMember origin ancestor endpoint actual other
  exact equal ▸ found

def Boundary (origin : Cursor) : Prop :=
  RootResetCarrierScanParentBoundary.carrierParent? origin.parents.head? = false ∧
    parentFunction origin ≠ some (live false) ∧ parentFunction origin ≠ some (live true)

theorem boundary_misses (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin : Cursor) (boundary : Boundary origin) : RootResetInverseEdgeSpine.familyResult (rows program tree) origin = none := by
  cases found : RootResetInverseEdgeSpine.familyResult (rows program tree) origin with
  | none => rfl
  | some ancestor =>
      obtain ⟨row, member, back⟩ := RootResetInverseEdgeSpine.familyResult_sound (rows program tree) origin ancestor found
      rcases List.mem_append.mp member with ordinary | live
      · have forward := RootResetInverseEdgeFragment.backResult_follow _ _ origin ancestor back
        rw [List.reverse_reverse] at forward
        have required := RootResetCarrierInverseBoundary.anchored_follow
          (RootResetCarrierInverseBoundary.rows_anchored program tree row ordinary) ancestor origin
          (RootResetInverseEdgeFragment.backResult_matches _ _ origin ancestor back) forward
        rw [boundary.1] at required
        cases required
      · obtain ⟨bit, equal⟩ := live_member row live
        subst row
        have required := live_parent bit ancestor origin back
        cases bit with
        | false => exact False.elim (boundary.2.1 required)
        | true => exact False.elim (boundary.2.2 required)

theorem root_boundary (source : Term) : Boundary (Cursor.atRoot source) := ⟨rfl, (by intro h; cases h), (by intro h; cases h)⟩
theorem left_boundary (source audit : Term) (parents : List ParentFrame) : Boundary ⟨source, .left audit :: parents⟩ :=
  ⟨rfl, (by intro h; cases h), (by intro h; cases h)⟩
theorem halt_boundary (source : Term) (parents : List ParentFrame) : Boundary ⟨source, .right haltCode :: parents⟩ :=
  ⟨rfl, (by intro h; cases h), (by intro h; cases h)⟩

theorem pending_boundary (actions payload continuation source : Term) (parents : List ParentFrame) :
    Boundary ⟨source, .right (.app (CheckpointDecoder.openEnvironment actions payload) continuation) :: parents⟩ :=
  ⟨rfl, (by intro h; cases h), (by intro h; cases h)⟩

theorem select_append (before after : List EdgeRow) (source : Term) :
    RootResetEdgeFragment.select (before ++ after) source =
      match RootResetEdgeFragment.select before source with
      | some row => some row
      | none => RootResetEdgeFragment.select after source := by
  induction before with
  | nil => rfl
  | cons row before ih =>
      simp only [List.cons_append, RootResetEdgeFragment.select]
      cases matched : row.pattern.matchesBool source <;> simp only [matched, Bool.false_eq_true, ↓reduceIte, ih]

theorem selected_live (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (bit : Bool) (predecessor : Term) :
    RootResetEdgeFragment.select (rows program tree) (.app (live bit) predecessor) = some (liveRow bit) := by
  rw [rows, select_append, RootResetCarrierNonemptyAgreement.select_live]
  cases bit <;> simp only [RootResetEdgeFragment.select, liveRows, RootResetCellSpineRows.liveRow,
    RootResetCarrierNonemptyAgreement.livePattern, Pattern.matchesBool, RootResetCompletedLocalPatterns.literal_self,
    Bool.true_and, Bool.and_true, ↓reduceIte] <;> rfl

theorem selected_ordinary (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (source : Term) (row : EdgeRow)
    (selected : RootResetEdgeFragment.select (RootResetCarrierNonemptyRows.rows program tree) source = some row) :
    RootResetEdgeFragment.select (rows program tree) source = some row := by
  rw [rows, select_append, selected]

end PureSFormal.Research.RootResetCompleteCarrierRows
