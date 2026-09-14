import PureSFormal.Research.RootResetProbeSequence
import PureSFormal.Research.RootResetCarrierParityAgreement
import PureSFormal.Research.RootResetNestedFramePatterns

/-! Fixed fresh-Local, COMMIT and one-parent handoff fragments. -/
namespace PureSFormal.Research.RootResetCompletedResponseAtoms
open PureSFormal.PureS
open FiniteController RootResetPatternFragment RootResetProbeSequence
open RootResetCompletedLocalPatterns RootResetCarrierEdgePatterns

def answer? {code : Code} (pc : PC code) : Option Bool := match pc.val with | .answer bit => some bit | _ => none
def codeWorker (code : Code) : Worker :=
  ⟨PC code, RootResetPatternFragment.machine code, ⟨code, ProbeCompiler.Control.self_mem_nodes _⟩, answer?⟩
theorem code_terminal (code : Code) : (codeWorker code).Terminal := by
  intro state ready answered origin ticks
  rcases state with ⟨pc, member⟩
  cases pc with
  | answer bit => exact RootResetPatternFragment.answer_absorbing code bit member origin ticks
  | observeNode _ _ | observeIncoming _ _ _ | move _ _ => cases answered
theorem code_readOnly (code : Code) (safe : code.NoRdx) : (codeWorker code).ReadOnly :=
  RootResetPatternFragment.mutationCount_zero code safe

def guardCode (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Code :=
  RootResetCompletedLocalFragment.familyCode (localPatterns .fresh program tree) (.answer true) (.answer false)
def guardWorker (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Worker := codeWorker (guardCode program tree)
def guardBound (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Nat :=
  RootResetCompletedLocalFragment.familyBound (localPatterns .fresh program tree)

theorem guard_runs (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) :
    ∃ ticks state, ticks ≤ guardBound program tree ∧
      run (guardWorker program tree).machine ticks ((guardWorker program tree).initial origin) = ⟨some state, origin⟩ ∧
      (guardWorker program tree).answer? state = some (accepts .fresh program tree origin.focus) := by
  obtain ⟨member, actual⟩ := RootResetCompletedLocalFragment.family_runs (localPatterns .fresh program tree) (.answer true) (.answer false)
    (guardCode program tree) origin (fun _ h => h)
  change (if accepts .fresh program tree origin.focus then .answer true else .answer false) ∈ (guardCode program tree).nodes at member
  change run (guardWorker program tree).machine (RootResetCompletedLocalFragment.familyTicks (localPatterns .fresh program tree) origin.focus)
    ((guardWorker program tree).initial origin) = ⟨some ⟨if accepts .fresh program tree origin.focus then .answer true else .answer false, member⟩, origin⟩ at actual
  change ∃ ticks state, ticks ≤ guardBound program tree ∧ _ ∧ answer? state = some (accepts .fresh program tree origin.focus)
  generalize result : accepts .fresh program tree origin.focus = ready at *
  cases ready <;> exact ⟨_, _, RootResetCompletedLocalFragment.familyTicks_bound _ _, actual, rfl⟩

theorem guard_readOnly (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : (guardWorker program tree).ReadOnly :=
  code_readOnly _ (RootResetCompletedLocalFragment.family_readOnly _ _ _ True.intro True.intro)

def commitRows (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : List EdgeRow :=
  (localPatterns .fresh program tree).map (fun pattern => ⟨pattern, [.left, .left, .left]⟩)
def commitWorker (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Worker :=
  codeWorker (RootResetEdgeFragment.familyCode (commitRows program tree))
def commitBound (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Nat := RootResetEdgeFragment.bound (commitRows program tree)

theorem commit_sound (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (row : EdgeRow) (member : row ∈ commitRows program tree) (source : Term) (matched : row.pattern.matchesBool source = true) :
    row.address = [.left, .left, .left] ∧ ∃ focus, source.subterm? row.address = some focus ∧ focus.contractRoot?.isSome = true := by
  obtain ⟨pattern, patternMember, equal⟩ := map_member_inverse _ _ _ member
  subst row
  obtain ⟨view, status, shape⟩ := local_sound .fresh program tree pattern patternMember source matched
  obtain ⟨halt, dispatcher, seedAudit, continuationAudit, haltShape, dispatch, equal⟩ := shape
  rw [status] at haltShape
  cases haltShape with
  | fresh audit =>
      refine ⟨rfl, freshHField audit, ?_, rfl⟩
      rw [equal]
      rfl

theorem commit_runs (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) :
    ∃ ticks ready endpoint state, ticks ≤ commitBound program tree ∧
      run (commitWorker program tree).machine ticks ((commitWorker program tree).initial origin) = ⟨some state, endpoint⟩ ∧
      (commitWorker program tree).answer? state = some ready ∧
      (if ready then endpoint.rdx?.isSome = true else endpoint = origin) := by
  cases selected : RootResetEdgeFragment.select (commitRows program tree) origin.focus with
  | none =>
      obtain ⟨member, actual⟩ := RootResetEdgeFragment.missed_runs (commitRows program tree) origin selected
      exact ⟨_, false, origin, ⟨.answer false, member⟩, RootResetEdgeFragment.ticks_bound _ _, actual, rfl, rfl⟩
  | some row =>
      obtain ⟨member, matched⟩ := RootResetEdgeFragment.select_sound _ origin.focus row selected
      obtain ⟨address, focus, subterm, redex⟩ := commit_sound program tree row member origin.focus matched
      obtain ⟨endpoint, followed, focusEq⟩ := RootResetEdgeFragment.follow_exists row.address origin.focus focus subterm origin.parents
      have same : (⟨origin.focus, origin.parents⟩ : Cursor) = origin := by cases origin; rfl
      rw [same] at followed
      obtain ⟨pcMember, actual⟩ := RootResetEdgeFragment.selected_runs (commitRows program tree) origin endpoint row selected followed
      refine ⟨_, true, endpoint, ⟨.answer true, pcMember⟩, RootResetEdgeFragment.ticks_bound _ _, actual, rfl, ?_⟩
      change endpoint.rdx?.isSome = true
      rcases endpoint with ⟨value, parents⟩
      change value = focus at focusEq
      subst value
      cases result : focus.contractRoot? with
      | none => rw [result] at redex; cases redex
      | some target => simp only [Cursor.rdx?, result]; rfl

theorem commit_generated {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {source : Term} {view : CheckpointDecoder.LocalView program} (parsed : CheckpointDecoder.parseLocal? program tree source = some view)
    (fresh : view.status = .fresh) (origin endpoint : Cursor) (atSource : origin.focus = source)
    (followed : RootResetEdgeFragment.follow [.left, .left, .left] origin = some endpoint) :
    ∃ ticks state, ticks ≤ commitBound program tree ∧
      run (commitWorker program tree).machine ticks ((commitWorker program tree).initial origin) = ⟨some state, endpoint⟩ ∧
      (commitWorker program tree).answer? state = some true := by
  obtain ⟨pattern, member, matched⟩ := local_matches (CheckpointDecoder.parseLocal?_sound parsed)
  rw [fresh] at member
  have memberRow : (⟨pattern, [.left, .left, .left]⟩ : EdgeRow) ∈ commitRows program tree := map_member _ member
  obtain ⟨row, selected⟩ := RootResetCarrierNonemptyAgreement.select_exists_of_match (commitRows program tree) origin.focus _ memberRow (atSource ▸ matched)
  obtain ⟨rowMember, rowMatched⟩ := RootResetEdgeFragment.select_sound _ origin.focus row selected
  have address := (commit_sound program tree row rowMember origin.focus rowMatched).1
  obtain ⟨pcMember, actual⟩ := RootResetEdgeFragment.selected_runs (commitRows program tree) origin endpoint row selected (by rw [address]; exact followed)
  exact ⟨_, ⟨.answer true, pcMember⟩, RootResetEdgeFragment.ticks_bound _ _, actual, rfl⟩

theorem commit_readOnly (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : (commitWorker program tree).ReadOnly :=
  code_readOnly _ (RootResetEdgeFragment.family_readOnly _)

abbrev handoffPattern := RootResetNestedFramePatterns.pendingPattern
def handoffCode : Code := RootResetInverseEdgeFragment.backCode [.right] handoffPattern (.answer true) (.answer false)
def handoffWorker : Worker := codeWorker handoffCode
def handoffBound : Nat := RootResetInverseEdgeFragment.bound [.right] handoffPattern

theorem pending_redex (source : Term) (matched : handoffPattern.matchesBool source = true) : source.contractRoot?.isSome = true := by
  obtain ⟨left, third, equal, leftMatches, _⟩ := app_matches matched
  obtain ⟨head, second, leftEq, headMatches, _⟩ := app_matches leftMatches
  obtain ⟨function, first, headEq, functionMatches, _⟩ := app_matches headMatches
  have same : function = .s := (Pattern.matches_s_iff function).mp (Pattern.matchesBool_sound functionMatches)
  rw [equal, leftEq, headEq, same]
  rfl

theorem handoff_runs (origin : Cursor) :
    ∃ ticks ready endpoint state, ticks ≤ handoffBound ∧
      run handoffWorker.machine ticks (handoffWorker.initial origin) = ⟨some state, endpoint⟩ ∧
      handoffWorker.answer? state = some ready ∧ (if ready then endpoint.rdx?.isSome = true else endpoint = origin) := by
  obtain ⟨member, actual⟩ := RootResetInverseEdgeFragment.back_runs [.right] handoffPattern (.answer true) (.answer false) handoffCode origin (fun _ h => h)
  cases found : RootResetInverseEdgeFragment.backResult [.right] handoffPattern origin with
  | none =>
      simp only [RootResetInverseEdgeFragment.selected, found, Option.isSome_none, Bool.false_eq_true, ↓reduceIte, Option.getD_none] at member actual
      exact ⟨_, false, origin, ⟨.answer false, member⟩, RootResetInverseEdgeFragment.backTicks_bound _ _ _, actual, rfl, rfl⟩
  | some ancestor =>
      simp only [RootResetInverseEdgeFragment.selected, found, Option.isSome_some, ↓reduceIte, Option.getD_some] at member actual
      refine ⟨_, true, ancestor, ⟨.answer true, member⟩, RootResetInverseEdgeFragment.backTicks_bound _ _ _, actual, rfl, ?_⟩
      have redex := pending_redex ancestor.focus (RootResetInverseEdgeFragment.backResult_matches _ _ origin ancestor found)
      change ancestor.rdx?.isSome = true
      cases result : ancestor.focus.contractRoot? with
      | none => rw [result] at redex; cases redex
      | some target => simp only [Cursor.rdx?, result]; rfl

theorem handoff_generated (actions payload continuation source : Term) (parents : List ParentFrame) :
    ∃ ticks state, ticks ≤ handoffBound ∧
      run handoffWorker.machine ticks (handoffWorker.initial ⟨source, .right (.app (CheckpointDecoder.openEnvironment actions payload) continuation) :: parents⟩) =
        ⟨some state, ⟨.app (.app (CheckpointDecoder.openEnvironment actions payload) continuation) source, parents⟩⟩ ∧
      handoffWorker.answer? state = some true := by
  let origin : Cursor := ⟨source, .right (.app (CheckpointDecoder.openEnvironment actions payload) continuation) :: parents⟩
  obtain ⟨member, actual⟩ := RootResetInverseEdgeFragment.back_runs [.right] handoffPattern (.answer true) (.answer false) handoffCode origin (fun _ h => h)
  have found : RootResetInverseEdgeFragment.backResult [.right] handoffPattern origin =
      some ⟨.app (.app (CheckpointDecoder.openEnvironment actions payload) continuation) source, parents⟩ := rfl
  simp only [RootResetInverseEdgeFragment.selected, found, Option.isSome_some, ↓reduceIte, Option.getD_some] at member actual
  exact ⟨_, ⟨.answer true, member⟩, RootResetInverseEdgeFragment.backTicks_bound _ _ _, actual, rfl⟩

theorem handoff_readOnly : handoffWorker.ReadOnly :=
  code_readOnly _ (RootResetInverseEdgeFragment.back_readOnly _ _ _ _ True.intro True.intro)

end PureSFormal.Research.RootResetCompletedResponseAtoms
