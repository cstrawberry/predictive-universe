import PureSFormal.Research.RootResetCarrierPhaseProbe

/-!
# Deleted-front-bit descent and exact inverse rows

The finite scanner follows Base queues, completed Local accumulators and
live predecessors, stopping at the first tombstone. Fixed tagged patterns
retain its bit. Inverse addresses are uniquely decoded from parent syntax;
fresh halt arguments are exact boundaries. The marked-root override is a
separate finite entry guard.
-/
namespace PureSFormal.Research.RootResetDeletedBitRows
open PureSFormal.PureS
open RootResetCarrierEdgePatterns
open RootResetCompletedLocalPatterns
open RootResetCarrierInverseUnique

def common (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : List EdgeRow :=
  RootResetCarrierNonemptyRows.baseRow (compileActions program tree) ::
    (localRows .fresh program tree ++ localRows .marked program tree)

def rows (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : List EdgeRow :=
  common program tree ++ [RootResetCellSpineRows.liveRow false, RootResetCellSpineRows.liveRow true]

theorem common_original (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (row : EdgeRow) (member : row ∈ common program tree) : row ∈ RootResetCarrierNonemptyRows.rows program tree := by
  rcases List.mem_cons.mp member with first | later
  · exact List.mem_cons.mpr (Or.inl first)
  · exact List.Mem.tail _ (List.mem_append.mpr (Or.inl later))

theorem member_cases (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (row : EdgeRow) (member : row ∈ rows program tree) :
    row ∈ common program tree ∨ row = RootResetCellSpineRows.liveRow false ∨ row = RootResetCellSpineRows.liveRow true := by
  rcases List.mem_append.mp member with commonMember | liveMember
  · exact Or.inl commonMember
  · rcases List.mem_cons.mp liveMember with first | last
    · exact Or.inr (Or.inl first)
    · exact Or.inr (Or.inr (List.mem_singleton.mp last))

theorem valid (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : RootResetEdgeFragment.Valid (rows program tree) := by
  intro row member
  rcases member_cases program tree row member with old | zero | one
  · exact RootResetCarrierNonemptyRows.valid program tree row (common_original program tree row old)
  · subst row
    exact RootResetCellSpineRows.valid _ (List.Mem.head _)
  · subst row
    exact RootResetCellSpineRows.valid _ (List.Mem.tail _ (List.Mem.head _))

def liveEnd : Address → Option Address
  | .right :: rest => some rest
  | _ => none

def endSides (function : Option Term) (address : Address) : Option Address :=
  match edgeEnd function address with
  | some rest => some rest
  | none => if function = some (live false) ∨ function = some (live true) then liveEnd address else none

theorem row_endSides (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (row : EdgeRow) (member : row ∈ rows program tree) (origin endpoint : Cursor)
    (matched : row.pattern.matchesBool origin.focus = true)
    (followed : RootResetEdgeFragment.follow row.address origin = some endpoint) :
    endSides (parentFunction endpoint) (sides endpoint) = some (sides origin) := by
  rcases member_cases program tree row member with old | zero | one
  · have ended := row_edgeEnd program tree row (common_original program tree row old) origin endpoint matched followed
    simp only [endSides, ended]
  · subst row
    have anchored : AtParent (live false) (RootResetCellSpineRows.liveRow false).pattern
        (RootResetCellSpineRows.liveRow false).address := .here .hole
    rw [atParent_follow anchored origin endpoint matched followed, follow_sides _ origin endpoint followed]
    rfl
  · subst row
    have anchored : AtParent (live true) (RootResetCellSpineRows.liveRow true).pattern
        (RootResetCellSpineRows.liveRow true).address := .here .hole
    rw [atParent_follow anchored origin endpoint matched followed, follow_sides _ origin endpoint followed]
    rfl

theorem inverse_unique (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (row candidate : EdgeRow) (member : row ∈ rows program tree) (candidateMember : candidate ∈ rows program tree)
    (origin ancestor endpoint : Cursor)
    (actual : RootResetInverseEdgeFragment.backResult row.address.reverse row.pattern endpoint = some origin)
    (other : RootResetInverseEdgeFragment.backResult candidate.address.reverse candidate.pattern endpoint = some ancestor) :
    ancestor = origin := by
  have actualForward := RootResetInverseEdgeFragment.backResult_follow _ _ endpoint origin actual
  have candidateForward := RootResetInverseEdgeFragment.backResult_follow _ _ endpoint ancestor other
  rw [List.reverse_reverse] at actualForward candidateForward
  have one := row_endSides program tree row member origin endpoint
    (RootResetInverseEdgeFragment.backResult_matches _ _ endpoint origin actual) actualForward
  have two := row_endSides program tree candidate candidateMember ancestor endpoint
    (RootResetInverseEdgeFragment.backResult_matches _ _ endpoint ancestor other) candidateForward
  have tailEqual : sides ancestor = sides origin := Option.some.inj (two.symm.trans one)
  have depthEqual : ancestor.parents.length = origin.parents.length := by
    have lengths := congrArg List.length tailEqual
    simpa only [sides, List.length_map] using lengths
  have actualDepth := RootResetInverseEdgeFragment.backResult_depth _ _ endpoint origin actual
  have candidateDepth := RootResetInverseEdgeFragment.backResult_depth _ _ endpoint ancestor other
  have lengths : candidate.address.reverse.length = row.address.reverse.length := by
    rw [depthEqual] at candidateDepth
    exact Nat.add_right_cancel (candidateDepth.symm.trans actualDepth)
  have firstClimb := back_climb _ _ endpoint ancestor other
  have secondClimb := back_climb _ _ endpoint origin actual
  rw [lengths] at firstClimb
  exact Option.some.inj (firstClimb.symm.trans secondClimb)

theorem inverts (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :
    RootResetLabelledEdgeProbe.Inverts (rows program tree) := by
  intro row member origin endpoint matched followed
  have actual := RootResetInverseEdgeFragment.backResult_complete row.address.reverse row.pattern origin endpoint
    (by simpa only [List.reverse_reverse] using followed) matched
  obtain ⟨ancestor, found⟩ := family_exists _ row member endpoint origin actual
  obtain ⟨candidate, candidateMember, other⟩ := RootResetInverseEdgeSpine.familyResult_sound _ endpoint ancestor found
  have equal := inverse_unique program tree row candidate member candidateMember origin ancestor endpoint actual other
  exact equal ▸ found

theorem halt_boundary (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (source : Term) (parents : List ParentFrame) :
    RootResetInverseEdgeSpine.familyResult (rows program tree) ⟨source, .right haltCode :: parents⟩ = none := by
  cases found : RootResetInverseEdgeSpine.familyResult (rows program tree) ⟨source, .right haltCode :: parents⟩ with
  | none => rfl
  | some ancestor =>
      obtain ⟨row, member, back⟩ := RootResetInverseEdgeSpine.familyResult_sound _ _ ancestor found
      have forward := RootResetInverseEdgeFragment.backResult_follow _ _ _ ancestor back
      rw [List.reverse_reverse] at forward
      have ended := row_endSides program tree row member ancestor ⟨source, .right haltCode :: parents⟩
        (RootResetInverseEdgeFragment.backResult_matches _ _ _ ancestor back) forward
      have stopped : endSides (parentFunction ⟨source, .right haltCode :: parents⟩)
          (sides ⟨source, .right haltCode :: parents⟩) = none := rfl
      rw [stopped] at ended
      contradiction

def labels : List (Bool × Pattern) :=
  [(false, RootResetCarrierNonemptyRows.tombstonePattern false), (true, RootResetCarrierNonemptyRows.tombstonePattern true)]

theorem labelled_tombstone (bit : Bool) (predecessor audit : Term) :
    RootResetLabelledPatternFragment.selected labels (Carrier.tombstone bit predecessor audit) = some bit := by
  cases bit <;> simp only [labels, RootResetLabelledPatternFragment.selected,
    RootResetCarrierNonemptyRows.tombstonePattern, Carrier.tombstone, Pattern.matchesBool,
    literal_self, Bool.true_and, Bool.and_true, ↓reduceIte] <;> rfl

abbrev machine (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :=
  RootResetLabelledEdgeProbe.machine (rows program tree) labels

abbrev initial (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :=
  RootResetLabelledEdgeProbe.initial (rows program tree) labels

abbrev budget (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :=
  RootResetLabelledEdgeProbe.budget (rows program tree) labels

theorem all_input (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (source : Term) (parents : List ParentFrame) :
    ∃ ticks descended, ticks ≤ budget program tree ⟨source, .right haltCode :: parents⟩ ∧
      FiniteController.run (machine program tree) ticks (initial program tree ⟨source, .right haltCode :: parents⟩) =
        ⟨some (.done (RootResetLabelledPatternFragment.finished labels descended.focus)),
          ⟨source, .right haltCode :: parents⟩⟩ ∧
      RootResetEdgeSpine.Walks (rows program tree) ⟨source, .right haltCode :: parents⟩ descended :=
  RootResetLabelledEdgeProbe.all_input_restores _ _ (valid program tree) (inverts program tree) _
    (halt_boundary program tree source parents)

theorem select_base (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (continuation queue seed beta : Term) :
    RootResetEdgeFragment.select (rows program tree)
      (CheckpointDecoder.openBase (compileActions program tree) continuation queue seed beta) =
      some (RootResetCarrierNonemptyRows.baseRow (compileActions program tree)) := by
  simp only [rows, common, List.cons_append, RootResetEdgeFragment.select,
    RootResetCarrierNonemptyRows.baseRow, RootResetCarrierNonemptyRows.base_matches, ↓reduceIte]

theorem select_live (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (bit : Bool) (predecessor : Term) :
    RootResetEdgeFragment.select (rows program tree) (.app (live bit) predecessor) = some (RootResetCellSpineRows.liveRow bit) := by
  have localsMiss : ∀ row ∈ common program tree, row.pattern.matchesBool (.app (live bit) predecessor) = false := by
    intro row member
    rcases List.mem_cons.mp member with first | later
    · subst row; exact RootResetCarrierNonemptyRows.base_misses_live _ bit predecessor
    · rcases List.mem_append.mp later with fresh | marked
      · exact RootResetCarrierNonemptyAgreement.localRows_miss fresh (CheckpointRun.parseLocal?_live_none ..)
      · exact RootResetCarrierNonemptyAgreement.localRows_miss marked (CheckpointRun.parseLocal?_live_none ..)
  have skip (front : List EdgeRow) (miss : ∀ row ∈ front, row.pattern.matchesBool (.app (live bit) predecessor) = false) :
      RootResetEdgeFragment.select (front ++ [RootResetCellSpineRows.liveRow false, RootResetCellSpineRows.liveRow true])
        (.app (live bit) predecessor) = some (RootResetCellSpineRows.liveRow bit) := by
    induction front with
    | nil => cases bit <;> rfl
    | cons row rest ih =>
        rw [List.cons_append, RootResetEdgeFragment.select, miss row (List.Mem.head _)]
        exact ih (fun next member => miss next (List.Mem.tail _ member))
  exact skip _ localsMiss

theorem select_tombstone (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (bit : Bool) (predecessor audit : Term)
    (baseMiss : (RootResetCarrierNonemptyRows.basePattern (compileActions program tree)).matchesBool
      (Carrier.tombstone bit predecessor audit) = false) :
    RootResetEdgeFragment.select (rows program tree) (Carrier.tombstone bit predecessor audit) = none := by
  apply RootResetCarrierNonemptyAgreement.select_none_of_all
  intro row member
  rcases member_cases program tree row member with old | zero | one
  · rcases List.mem_cons.mp old with first | later
    · subst row; exact baseMiss
    · rcases List.mem_append.mp later with fresh | marked
      · exact RootResetCarrierNonemptyAgreement.localRows_miss fresh (CheckpointRun.parseLocal?_tombstone_none ..)
      · exact RootResetCarrierNonemptyAgreement.localRows_miss marked (CheckpointRun.parseLocal?_tombstone_none ..)
  · subst row; rfl
  · subst row; rfl

theorem select_local {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {source : Term} {view : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program tree source = some view) :
    ∃ row, RootResetEdgeFragment.select (rows program tree) source = some row ∧
      row.address = RootResetResponseBoundaryStages.localAccumulatorAddress view := by
  obtain ⟨candidate, member, matched, _⟩ := localRow_complete parsed
  have memberAll : candidate ∈ rows program tree := by
    apply List.mem_append.mpr
    apply Or.inl
    apply List.Mem.tail
    apply List.mem_append.mpr
    cases statusEq : view.status with
    | fresh => exact Or.inl (statusEq ▸ member)
    | marked => exact Or.inr (statusEq ▸ member)
  obtain ⟨row, selected⟩ := RootResetCarrierNonemptyAgreement.select_exists_of_match _ source candidate memberAll matched
  obtain ⟨rowMember, rowMatches⟩ := RootResetEdgeFragment.select_sound _ source row selected
  refine ⟨row, selected, ?_⟩
  rcases member_cases program tree row rowMember with old | zero | one
  · rcases List.mem_cons.mp old with first | later
    · subst row
      obtain ⟨halt, dispatcher, seedAudit, continuationAudit, haltShape, dispatch, sourceEq⟩ := CheckpointDecoder.parseLocal?_sound parsed
      change (RootResetCarrierNonemptyRows.basePattern _).matchesBool _ = true at rowMatches
      rw [sourceEq, RootResetCarrierNonemptyRows.base_misses_local] at rowMatches
      contradiction
    · rcases List.mem_append.mp later with fresh | marked
      · obtain ⟨found, foundParse, addressEq⟩ := RootResetCarrierNonemptyAgreement.localRows_sound fresh rowMatches
        have equal := Option.some.inj (foundParse.symm.trans parsed)
        exact equal ▸ addressEq
      · obtain ⟨found, foundParse, addressEq⟩ := RootResetCarrierNonemptyAgreement.localRows_sound marked rowMatches
        have equal := Option.some.inj (foundParse.symm.trans parsed)
        exact equal ▸ addressEq
  · subst row
    obtain ⟨predecessor, shape⟩ := RootResetCellSpineRows.live_sound false source rowMatches
    rw [shape, CheckpointRun.parseLocal?_live_none] at parsed
    contradiction
  · subst row
    obtain ⟨predecessor, shape⟩ := RootResetCellSpineRows.live_sound true source rowMatches
    rw [shape, CheckpointRun.parseLocal?_live_none] at parsed
    contradiction

end PureSFormal.Research.RootResetDeletedBitRows
