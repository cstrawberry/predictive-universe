import PureSFormal.Research.RootResetDeletedBitAgreement
import PureSFormal.Research.RootResetCompleteCarrierRows
import PureSFormal.Research.RootResetProbeBranch

/-! Finite EMPTY provenance: descend through Base, fresh Local and live edges,
stopping at the first marked Local, tombstone or terminal. A tombstone means
normal chronology; marked/no-hit means EMPTY provenance. The caller separately
checks decoded emptiness before using this answer to choose COMMIT. -/
namespace PureSFormal.Research.RootResetEmptyOriginProbe
open PureSFormal.PureS
open FiniteController RootResetProbeSequence RootResetCarrierEdgePatterns
open RootResetCarrierInverseUnique

def rows (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : List EdgeRow :=
  RootResetCarrierNonemptyRows.baseRow (compileActions program tree) ::
    (localRows .fresh program tree ++ RootResetCompleteCarrierRows.liveRows)

theorem member_cases (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (row : EdgeRow) (member : row ∈ rows program tree) :
    row = RootResetCarrierNonemptyRows.baseRow (compileActions program tree) ∨
      row ∈ localRows .fresh program tree ∨ row ∈ RootResetCompleteCarrierRows.liveRows := by
  rcases List.mem_cons.mp member with base | rest
  · exact Or.inl base
  · exact Or.inr (List.mem_append.mp rest)

theorem member_complete (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (row : EdgeRow) (member : row ∈ rows program tree) : row ∈ RootResetCompleteCarrierRows.rows program tree := by
  apply List.mem_append.mpr
  rcases member_cases program tree row member with base | fresh | live
  · subst row; exact Or.inl (List.Mem.head _)
  · exact Or.inl (List.Mem.tail _ (List.mem_append.mpr (Or.inl (List.mem_append.mpr (Or.inl fresh)))))
  · exact Or.inr live

theorem member_deleted (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (row : EdgeRow) (member : row ∈ rows program tree) : row ∈ RootResetDeletedBitRows.rows program tree := by
  apply List.mem_append.mpr
  rcases member_cases program tree row member with base | fresh | live
  · subst row; exact Or.inl (List.Mem.head _)
  · exact Or.inl (List.Mem.tail _ (List.mem_append.mpr (Or.inl fresh)))
  · exact Or.inr live

theorem valid (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : RootResetEdgeFragment.Valid (rows program tree) :=
  fun row member => RootResetCompleteCarrierRows.valid program tree row (member_complete program tree row member)

theorem inverts (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : RootResetLabelledEdgeProbe.Inverts (rows program tree) := by
  intro row member origin endpoint matched followed
  have actual := RootResetInverseEdgeFragment.backResult_complete row.address.reverse row.pattern origin endpoint
    (by simpa only [List.reverse_reverse] using followed) matched
  obtain ⟨ancestor, found⟩ := family_exists (rows program tree) row member endpoint origin actual
  obtain ⟨candidate, candidateMember, other⟩ := RootResetInverseEdgeSpine.familyResult_sound (rows program tree) endpoint ancestor found
  have equal := RootResetCompleteCarrierRows.inverse_unique program tree row candidate
    (member_complete program tree row member) (member_complete program tree candidate candidateMember) origin ancestor endpoint actual other
  exact equal ▸ found

theorem boundary_misses (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor)
    (boundary : RootResetCompleteCarrierRows.Boundary origin) : RootResetInverseEdgeSpine.familyResult (rows program tree) origin = none := by
  cases found : RootResetInverseEdgeSpine.familyResult (rows program tree) origin with
  | none => rfl
  | some ancestor =>
      obtain ⟨row, member, back⟩ := RootResetInverseEdgeSpine.familyResult_sound _ _ ancestor found
      obtain ⟨other, larger⟩ := family_exists (RootResetCompleteCarrierRows.rows program tree) row (member_complete program tree row member) origin ancestor back
      rw [RootResetCompleteCarrierRows.boundary_misses program tree origin boundary] at larger
      cases larger

abbrev labels := RootResetDeletedBitRows.labels
abbrev Control (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) := RootResetLabelledEdgeProbe.Control (rows program tree) labels
abbrev machine (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) := RootResetLabelledEdgeProbe.machine (rows program tree) labels
abbrev initial (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) := RootResetLabelledEdgeProbe.initial (rows program tree) labels

def answer? {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)} : Control program tree → Option Bool
  | .done pc => (RootResetLabelledPatternFragment.answer? pc).map Option.isNone
  | _ => none

def worker (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Worker :=
  ⟨Control program tree, machine program tree, (initial program tree (Cursor.atRoot .s)).control.getD
    (.done .yes), answer?⟩

theorem initial_eq (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) :
    (worker program tree).initial origin = initial program tree origin := rfl

def coefficient (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Nat :=
  RootResetLabelledEdgeProbe.coefficient (rows program tree) labels

theorem terminal (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : (worker program tree).Terminal := by
  intro state ready answered origin ticks
  cases state with
  | descending _ | reading _ | ascending _ _ => cases answered
  | done pc => exact RootResetLabelledEdgeProbe.done_absorbs _ _ pc origin ticks

theorem readOnly (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : (worker program tree).ReadOnly :=
  RootResetLabelledEdgeProbe.mutationCount_zero _ _

theorem scan (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor)
    (boundary : RootResetCompleteCarrierRows.Boundary origin) :
    ∃ ticks descended, ticks ≤ coefficient program tree * origin.erase.size ∧
      run (worker program tree).machine ticks ((worker program tree).initial origin) =
        ⟨some (.done (RootResetLabelledPatternFragment.finished labels descended.focus)), origin⟩ ∧
      RootResetEdgeSpine.Walks (rows program tree) origin descended := by
  obtain ⟨ticks, descended, bounded, actual, walked⟩ := RootResetLabelledEdgeProbe.all_input_restores (rows program tree) labels
    (valid program tree) (inverts program tree) origin (boundary_misses program tree origin boundary)
  exact ⟨ticks, descended, Nat.le_trans bounded (RootResetLabelledEdgeProbe.budget_erase _ _ origin), actual, walked⟩

theorem all_input (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor)
    (boundary : RootResetCompleteCarrierRows.Boundary origin) : RootResetProbeBranch.QueryAt (worker program tree) (coefficient program tree) origin := by
  obtain ⟨ticks, descended, bounded, actual, walked⟩ := scan program tree origin boundary
  refine ⟨ticks, (RootResetLabelledPatternFragment.selected labels descended.focus).isNone, _, bounded, actual, ?_⟩
  change (RootResetLabelledPatternFragment.answer? (RootResetLabelledPatternFragment.finished labels descended.focus)).map Option.isNone = _
  rw [RootResetLabelledPatternFragment.finished_answer]
  rfl

inductive Reads (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Term → Option Bool → Prop where
  | done (source : Term) (missed : RootResetEdgeFragment.select (rows program tree) source = none) :
      Reads program tree source (RootResetLabelledPatternFragment.selected labels source)
  | next (source target : Term) (row : EdgeRow)
      (selected : RootResetEdgeFragment.select (rows program tree) source = some row)
      (subterm : source.subterm? row.address = some target)
      {answer : Option Bool} (inner : Reads program tree target answer) : Reads program tree source answer

theorem Reads.walks {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {source : Term} {answer : Option Bool} (reads : Reads program tree source answer)
    {origin endpoint : Cursor} (walk : RootResetEdgeSpine.Walks (rows program tree) origin endpoint)
    (atSource : origin.focus = source) : RootResetLabelledPatternFragment.selected labels endpoint.focus = answer := by
  induction walk generalizing source answer with
  | done origin missed => cases reads with
    | done source stopped => rw [atSource]
    | next source target row selected subterm inner => rw [atSource, selected] at missed; cases missed
  | next origin after row selected followed rest ih => cases reads with
    | done source stopped => rw [atSource, stopped] at selected; cases selected
    | next source target found foundSelected subterm inner =>
        have equal := Option.some.inj ((atSource ▸ selected).symm.trans foundSelected)
        subst found
        have atTarget := RootResetEdgeFragment.follow_subterm row.address origin after followed
        rw [atSource, subterm] at atTarget
        exact ih inner (Option.some.inj atTarget).symm

theorem Reads.generated_runs {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {source : Term} {answer : Option Bool} (reads : Reads program tree source answer)
    (origin : Cursor) (atSource : origin.focus = source) (boundary : RootResetCompleteCarrierRows.Boundary origin) :
    ∃ ticks state, ticks ≤ coefficient program tree * origin.erase.size ∧
      run (worker program tree).machine ticks ((worker program tree).initial origin) = ⟨some state, origin⟩ ∧
      (worker program tree).answer? state = some answer.isNone := by
  obtain ⟨ticks, descended, bounded, actual, walk⟩ := scan program tree origin boundary
  refine ⟨ticks, _, bounded, actual, ?_⟩
  change (RootResetLabelledPatternFragment.answer? (RootResetLabelledPatternFragment.finished labels descended.focus)).map Option.isNone = _
  rw [RootResetLabelledPatternFragment.finished_answer, reads.walks walk atSource]
  rfl

theorem miss_of_deleted_none (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (source : Term)
    (missed : RootResetEdgeFragment.select (RootResetDeletedBitRows.rows program tree) source = none) :
    RootResetEdgeFragment.select (rows program tree) source = none := by
  apply RootResetCarrierNonemptyAgreement.select_none_of_all
  intro row member
  cases matched : row.pattern.matchesBool source with
  | false => rfl
  | true =>
      obtain ⟨found, selected⟩ := RootResetCarrierNonemptyAgreement.select_exists_of_match _ source row
        (member_deleted program tree row member) matched
      rw [missed] at selected
      cases selected

theorem select_base (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (continuation queue seed beta : Term) : RootResetEdgeFragment.select (rows program tree)
      (CheckpointDecoder.openBase (compileActions program tree) continuation queue seed beta) =
      some (RootResetCarrierNonemptyRows.baseRow (compileActions program tree)) := by
  simp only [rows, RootResetEdgeFragment.select, RootResetCarrierNonemptyRows.baseRow,
    RootResetCarrierNonemptyRows.base_matches, ↓reduceIte]

theorem select_live (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (bit : Bool) (predecessor : Term) :
    RootResetEdgeFragment.select (rows program tree) (.app (live bit) predecessor) = some (RootResetCellSpineRows.liveRow bit) := by
  have skip (front : List EdgeRow) (miss : ∀ row ∈ front, row.pattern.matchesBool (.app (live bit) predecessor) = false) :
      RootResetEdgeFragment.select (front ++ RootResetCompleteCarrierRows.liveRows) (.app (live bit) predecessor) =
        some (RootResetCellSpineRows.liveRow bit) := by
    induction front with
    | nil => cases bit <;> rfl
    | cons row rest ih =>
        rw [List.cons_append, RootResetEdgeFragment.select, miss row (List.Mem.head _)]
        exact ih (fun next member => miss next (List.Mem.tail _ member))
  apply skip (RootResetCarrierNonemptyRows.baseRow (compileActions program tree) :: localRows .fresh program tree)
  intro row member
  rcases List.mem_cons.mp member with base | fresh
  · subst row; exact RootResetCarrierNonemptyRows.base_misses_live _ bit predecessor
  · exact RootResetCarrierNonemptyAgreement.localRows_miss fresh (CheckpointRun.parseLocal?_live_none ..)

theorem select_fresh {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {source : Term} {view : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program tree source = some view) (fresh : view.status = .fresh) :
    ∃ row, RootResetEdgeFragment.select (rows program tree) source = some row ∧
      row.address = RootResetResponseBoundaryStages.localAccumulatorAddress view := by
  obtain ⟨candidate, member, matched, _⟩ := localRow_complete parsed
  rw [fresh] at member
  have memberAll : candidate ∈ rows program tree := List.Mem.tail _ (List.mem_append.mpr (Or.inl member))
  obtain ⟨row, selected⟩ := RootResetCarrierNonemptyAgreement.select_exists_of_match _ source candidate memberAll matched
  obtain ⟨rowMember, rowMatches⟩ := RootResetEdgeFragment.select_sound _ source row selected
  refine ⟨row, selected, ?_⟩
  rcases member_cases program tree row rowMember with base | localMember | live
  · subst row
    obtain ⟨halt, dispatcher, seedAudit, continuationAudit, haltShape, dispatch, sourceEq⟩ := CheckpointDecoder.parseLocal?_sound parsed
    change (RootResetCarrierNonemptyRows.basePattern _).matchesBool _ = true at rowMatches
    rw [sourceEq, RootResetCarrierNonemptyRows.base_misses_local] at rowMatches
    cases rowMatches
  · obtain ⟨found, foundParse, addressEq⟩ := RootResetCarrierNonemptyAgreement.localRows_sound localMember rowMatches
    have equal := Option.some.inj (foundParse.symm.trans parsed)
    exact equal ▸ addressEq
  · obtain ⟨bit, equal⟩ := RootResetCompleteCarrierRows.live_member row live
    subst row
    obtain ⟨predecessor, shape⟩ := RootResetCellSpineRows.live_sound bit source rowMatches
    rw [shape, CheckpointRun.parseLocal?_live_none] at parsed
    cases parsed

theorem select_marked {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {source : Term} {view : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program tree source = some view) (marked : view.status = .marked) :
    RootResetEdgeFragment.select (rows program tree) source = none := by
  apply RootResetCarrierNonemptyAgreement.select_none_of_all
  intro row member
  cases matched : row.pattern.matchesBool source with
  | false => rfl
  | true =>
      rcases member_cases program tree row member with base | fresh | live
      · subst row
        obtain ⟨halt, dispatcher, seedAudit, continuationAudit, haltShape, dispatch, sourceEq⟩ := CheckpointDecoder.parseLocal?_sound parsed
        change (RootResetCarrierNonemptyRows.basePattern _).matchesBool _ = true at matched
        rw [sourceEq, RootResetCarrierNonemptyRows.base_misses_local] at matched
        cases matched
      · obtain ⟨dispatch, dispatchMember, rowEq⟩ := RootResetCompletedLocalPatterns.map_member_inverse _ _ _ fresh
        subst row
        obtain ⟨found, statusEq, foundParsed, _⟩ := localRow_sound .fresh program tree dispatch dispatchMember source matched
        have equal := Option.some.inj (foundParsed.symm.trans parsed)
        rw [equal, marked] at statusEq
        cases statusEq
      · obtain ⟨bit, equal⟩ := RootResetCompleteCarrierRows.live_member row live
        subst row
        obtain ⟨predecessor, shape⟩ := RootResetCellSpineRows.live_sound bit source matched
        rw [shape, CheckpointRun.parseLocal?_live_none] at parsed
        cases parsed

theorem labels_local_none {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {source : Term} {view : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program tree source = some view) :
    RootResetLabelledPatternFragment.selected labels source = none := by
  obtain ⟨halt, dispatcher, seedAudit, continuationAudit, haltShape, dispatch, sourceEq⟩ := CheckpointDecoder.parseLocal?_sound parsed
  rw [sourceEq]
  cases statusEq : view.status
  · rw [statusEq] at haltShape
    cases haltShape
    rfl
  · rw [statusEq] at haltShape
    cases haltShape
    rfl

theorem Reads.live {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {source : Term} {answer : Option Bool} (bit : Bool) (inner : Reads program tree source answer) :
    Reads program tree (.app (PureS.live bit) source) answer :=
  .next _ source (RootResetCellSpineRows.liveRow bit) (select_live program tree bit source) (by cases source <;> rfl) inner

theorem Reads.local {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {source : Term} {view : CheckpointDecoder.LocalView program} {answer : Option Bool}
    (parsed : CheckpointDecoder.parseLocal? program tree source = some view) (fresh : view.status = .fresh)
    (inner : Reads program tree view.accumulator answer) : Reads program tree source answer := by
  obtain ⟨row, selected, addressEq⟩ := select_fresh parsed fresh
  refine .next source view.accumulator row selected ?_ inner
  rw [addressEq]
  exact RootResetCompletedFrontPreservation.localParsed_accumulator_subterm parsed

theorem Reads.marked {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {source : Term} {view : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program tree source = some view) (marked : view.status = .marked) : Reads program tree source none := by
  have result := Reads.done (program := program) (tree := tree) source (select_marked parsed marked)
  rw [labels_local_none parsed] at result
  exact result

theorem Reads.tombstone (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (bit : Bool) (predecessor audit : Term)
    (baseMiss : (RootResetCarrierNonemptyRows.basePattern (compileActions program tree)).matchesBool (Carrier.tombstone bit predecessor audit) = false) :
    Reads program tree (Carrier.tombstone bit predecessor audit) (some bit) := by
  have value := Reads.done (program := program) (tree := tree) _ (miss_of_deleted_none program tree _
    (RootResetDeletedBitRows.select_tombstone program tree bit predecessor audit baseMiss))
  rw [RootResetDeletedBitRows.labelled_tombstone] at value
  exact value

theorem Reads.spine (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    {source : Term} {decoded : List Bool} (path : CellSpine.Decodes source decoded) :
    Reads program tree source (RootResetPersistentResponseSelector.deletedFrontBitInSpine? source) := by
  induction path with
  | omega =>
      rw [RootResetPersistentResponseSelector.deletedFrontBitInSpine?]
      exact .done omega (miss_of_deleted_none program tree omega (RootResetDeletedBitAgreement.select_omega program tree))
  | live bit inner ih =>
      rw [RootResetPersistentResponseSelector.deletedFrontBitInSpine?, CanonicalStep.parseCell?_live]
      exact .live bit ih
  | tombstone bit audit inner ih =>
      rw [RootResetPersistentResponseSelector.deletedFrontBitInSpine?, CanonicalStep.parseCell?_tombstone]
      exact .tombstone program tree bit _ audit (RootResetCarrierNonemptyAgreement.spine_tombstone_base_miss program tree inner bit audit)

theorem Reads.base {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    (continuation queue seed beta : Term) {answer : Option Bool}
    (inner : Reads program tree queue answer) :
    Reads program tree (CheckpointDecoder.openBase (compileActions program tree) continuation queue seed beta) answer :=
  .next _ queue (RootResetCarrierNonemptyRows.baseRow (compileActions program tree))
    (select_base program tree continuation queue seed beta) (by cases queue <;> rfl) inner

theorem Reads.empty_base (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (continuation seed beta : Term) :
    Reads program tree (CheckpointDecoder.openBase (compileActions program tree) continuation omega seed beta) none :=
  .base continuation omega seed beta (.done omega
    (miss_of_deleted_none program tree omega (RootResetDeletedBitAgreement.select_omega program tree)))

end PureSFormal.Research.RootResetEmptyOriginProbe
