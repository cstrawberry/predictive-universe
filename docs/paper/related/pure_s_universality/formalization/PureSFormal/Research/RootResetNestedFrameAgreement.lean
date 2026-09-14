import PureSFormal.Research.RootResetNestedFrameProbe
import PureSFormal.Research.RootResetFrameSpineWalker

/-! Exact generated FRAME occurrences selected by the scoped finite probe. -/
namespace PureSFormal.Research.RootResetNestedFrameAgreement
open PureSFormal.PureS
open FiniteController SchedulerResponseInvariant
open RootResetNestedFramePatterns
open RootResetFrameSpineWalker (Layer wrap spineParents firstTarget secondTarget)

theorem head_misses_iff (source : Term) :
    RootResetEdgeFragment.select headRows source = none ↔
      RootResetFrameCarrierGuard.frameHeadGuard source = false := by
  rw [← frame_guard_eq]
  cases first : firstPattern.matchesBool source <;> cases second : secondPattern.matchesBool source <;>
    simp only [headRows, firstRow, secondRow, RootResetEdgeFragment.select, first, second,
      Bool.false_eq_true, ↓reduceIte, Bool.false_or, Bool.true_or, Bool.or_false,
      reduceCtorEq]

theorem pending_walks (layers : List Layer) (body : Term)
    (stops : RootResetEdgeFragment.select pendingRows body = none) (parents : List ParentFrame) :
    RootResetEdgeSpine.Walks pendingRows ⟨wrap layers body, parents⟩ ⟨body, spineParents layers parents⟩ := by
  induction layers generalizing parents with
  | nil => exact .done _ stops
  | cons layer layers ih =>
      rcases layer with ⟨field, continuation⟩
      exact .next _ _ pendingRow rfl rfl (ih _)

theorem pending_descent (layers : List Layer) (body : Term)
    (stops : RootResetEdgeFragment.select pendingRows body = none)
    (parents : List ParentFrame) :
    ∃ ticks member,
      ticks ≤ RootResetEdgeSpine.coefficient pendingRows * (wrap layers body).size ∧
      run (RootResetEdgeSpine.machine pendingRows) ticks
        (RootResetEdgeSpine.initial pendingRows ⟨wrap layers body, parents⟩) =
        ⟨some ⟨.answer false, member⟩, ⟨body, spineParents layers parents⟩⟩ := by
  induction layers generalizing parents with
  | nil =>
      obtain ⟨member, execution⟩ := RootResetEdgeSpine.missed_runs pendingRows ⟨body, parents⟩ stops
      exact ⟨_, member, RootResetEdgeSpine.missed_bound pendingRows _, execution⟩
  | cons layer layers ih =>
      rcases layer with ⟨field, continuation⟩
      let source := wrap ((field, continuation) :: layers) body
      let after : Cursor := ⟨wrap layers body, .right (.app (.app .s field) continuation) :: parents⟩
      have selected : RootResetEdgeFragment.select pendingRows source = some pendingRow := rfl
      have followed : RootResetEdgeFragment.follow pendingRow.address ⟨source, parents⟩ = some after := rfl
      have firstRun := RootResetEdgeSpine.selected_runs pendingRows ⟨source, parents⟩ after pendingRow selected
        (by intro h; cases h) followed
      obtain ⟨ticks, member, bounded, execution⟩ := ih after.parents
      refine ⟨RootResetEdgeFragment.ticks pendingRows source + 1 + ticks, member, ?_, ?_⟩
      · exact RootResetEdgeSpine.combine_bound pendingRows source after.focus _ _
          (RootResetEdgeSpine.prefix_bound pendingRows source) bounded
          (RootResetEdgeFragment.follow_size_lt pendingRow.address ⟨source, parents⟩ after (by intro h; cases h) followed)
      · rw [run_add, firstRun]
        exact execution

theorem selected (layers : List Layer) (body : Term) (parents : List ParentFrame)
    (stops : RootResetEdgeFragment.select pendingRows body = none)
    (row : RootResetCarrierEdgePatterns.EdgeRow) (endpoint : Cursor)
    (chosen : RootResetEdgeFragment.select headRows body = some row)
    (followed : RootResetEdgeFragment.follow row.address ⟨body, spineParents layers parents⟩ = some endpoint) :
    ∃ ticks,
      ticks ≤ RootResetNestedFrameProbe.coefficient * (wrap layers body).size ∧
      run RootResetNestedFrameProbe.machine ticks
        (RootResetNestedFrameProbe.initial ⟨wrap layers body, parents⟩) = ⟨some (.done true), endpoint⟩ := by
  let start : Cursor := ⟨wrap layers body, parents⟩
  let descended : Cursor := ⟨body, spineParents layers parents⟩
  obtain ⟨downTicks, member, bounded, execution⟩ := pending_descent layers body stops parents
  obtain ⟨downUsed, downBound, downRun⟩ := RootResetNestedFrameProbe.descending_runs start descended downTicks member execution
  obtain ⟨readMember, readRun⟩ := RootResetEdgeFragment.selected_runs headRows descended endpoint row chosen followed
  obtain ⟨readUsed, readBound, readActual⟩ := RootResetNestedFrameProbe.reading_runs descended endpoint _ true readMember readRun
  refine ⟨downUsed + 1 + (readUsed + 1), ?_, ?_⟩
  · exact Nat.le_trans (Nat.le_add_right _ 1)
      (RootResetNestedFrameProbe.combined_bound start.focus downUsed readUsed 0
        (Nat.le_trans downBound bounded)
        (Nat.le_trans readBound (RootResetEdgeFragment.ticks_bound _ _)) (Nat.zero_le _))
  · rw [run_add, downRun]
    exact readActual

theorem missed (layers : List Layer) (body : Term) (parents : List ParentFrame)
    (stops : RootResetEdgeFragment.select pendingRows body = none)
    (guardMiss : RootResetFrameCarrierGuard.frameHeadGuard body = false)
    (boundary : rightParent? ⟨wrap layers body, parents⟩ = false) :
    ∃ ticks,
      ticks ≤ RootResetNestedFrameProbe.coefficient * (wrap layers body).size ∧
      run RootResetNestedFrameProbe.machine ticks
        (RootResetNestedFrameProbe.initial ⟨wrap layers body, parents⟩) =
        ⟨some (.done false), ⟨wrap layers body, parents⟩⟩ := by
  let start : Cursor := ⟨wrap layers body, parents⟩
  let descended : Cursor := ⟨body, spineParents layers parents⟩
  obtain ⟨downTicks, member, bounded, execution⟩ := pending_descent layers body stops parents
  obtain ⟨downUsed, downBound, downRun⟩ := RootResetNestedFrameProbe.descending_runs start descended downTicks member execution
  obtain ⟨readMember, readRun⟩ := RootResetEdgeFragment.missed_runs headRows descended ((head_misses_iff body).mpr guardMiss)
  obtain ⟨readUsed, readBound, readActual⟩ := RootResetNestedFrameProbe.reading_runs descended descended _ false readMember readRun
  obtain ⟨reverseTicks, reverseBound, reverseRun⟩ := RootResetNestedFrameProbe.reverse_runs (pending_walks layers body stops parents)
  have reverseSmall : reverseTicks ≤ RootResetNestedFrameProbe.upCost * start.focus.size :=
    Nat.le_trans (Nat.le_add_right _ _) reverseBound
  obtain ⟨upMember, upRun⟩ := RootResetInverseEdgeSpine.missed_runs pendingRows start (inverse_boundary start boundary)
  have fullUp : run (RootResetInverseEdgeSpine.machine pendingRows)
      (reverseTicks + RootResetInverseEdgeSpine.familyTicks pendingRows start)
      (RootResetInverseEdgeSpine.initial pendingRows descended) =
      ⟨some ⟨ProbeCompiler.Control.answer false, upMember⟩, start⟩ := by
    rw [run_add, reverseRun]
    exact upRun
  obtain ⟨upUsed, upUsedBound, actualUp⟩ := RootResetNestedFrameProbe.ascending_runs descended start _ upMember fullUp
  have upBound : upUsed ≤ RootResetNestedFrameProbe.upCost * start.focus.size + RootResetNestedFrameProbe.upCost :=
    Nat.le_trans upUsedBound (Nat.add_le_add reverseSmall
      (Nat.le_trans (RootResetInverseEdgeSpine.familyTicks_bound _ _) (Nat.le_add_right _ 2)))
  refine ⟨downUsed + 1 + (readUsed + 1) + (upUsed + 1),
    RootResetNestedFrameProbe.combined_bound start.focus downUsed readUsed upUsed
      (Nat.le_trans downBound bounded)
      (Nat.le_trans readBound (RootResetEdgeFragment.ticks_bound _ _)) upBound, ?_⟩
  have firstTwo : run RootResetNestedFrameProbe.machine (downUsed + 1 + (readUsed + 1))
      (RootResetNestedFrameProbe.initial start) = RootResetNestedFrameProbe.ascending descended := by
    rw [run_add, downRun]
    exact readActual
  rw [run_add, firstTwo]
  exact actualUp

theorem first_selected (actions : Term) (bits : List Bool) (continuation carrier : Term) :
    RootResetEdgeFragment.select headRows (frameFirstRoot actions bits continuation carrier) = some firstRow := by
  simp only [headRows, RootResetEdgeFragment.select, firstRow, first_matches, ↓reduceIte]

theorem second_selected (actions : Term) (bits : List Bool) (continuation carrier : Term) :
    RootResetEdgeFragment.select headRows (frameSecondRoot actions bits continuation carrier) = some secondRow := by
  have missed : firstPattern.matchesBool (frameSecondRoot actions bits continuation carrier) = false := rfl
  simp only [headRows, RootResetEdgeFragment.select, firstRow, secondRow, missed,
    second_matches, Bool.false_eq_true, ↓reduceIte]

def firstCursor (actions : Term) (bits : List Bool) (carrier continuation : Term) (parents : List ParentFrame) : Cursor :=
  ⟨.app (dispatcherCode actions bits) carrier, .left (.app continuation carrier) :: parents⟩

def secondCursor (actions : Term) (carrier : Term) (bits : List Bool) (continuation : Term) (parents : List ParentFrame) : Cursor :=
  ⟨.app (actCode actions) carrier, .left (.app (seedCode bits) carrier) :: .left (.app continuation carrier) :: parents⟩

theorem generated_first (layers : List Layer) (actions : Term) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    ∃ ticks,
      ticks ≤ RootResetNestedFrameProbe.coefficient * (wrap layers (frameFirstRoot actions bits continuation carrier)).size ∧
      run RootResetNestedFrameProbe.machine ticks
        (RootResetNestedFrameProbe.initial ⟨wrap layers (frameFirstRoot actions bits continuation carrier), parents⟩) =
        ⟨some (.done true), firstCursor actions bits carrier continuation (spineParents layers parents)⟩ :=
  selected layers _ parents rfl firstRow _ (first_selected actions bits continuation carrier) rfl

theorem generated_second (layers : List Layer) (actions : Term) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    ∃ ticks,
      ticks ≤ RootResetNestedFrameProbe.coefficient * (wrap layers (frameSecondRoot actions bits continuation carrier)).size ∧
      run RootResetNestedFrameProbe.machine ticks
        (RootResetNestedFrameProbe.initial ⟨wrap layers (frameSecondRoot actions bits continuation carrier), parents⟩) =
        ⟨some (.done true), secondCursor actions carrier bits continuation (spineParents layers parents)⟩ :=
  selected layers _ parents rfl secondRow _ (second_selected actions bits continuation carrier) rfl

theorem generated_first_contracts (layers : List Layer) (actions : Term) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    ∃ ticks,
      ticks ≤ RootResetNestedFrameProbe.coefficient * (wrap layers (frameFirstRoot actions bits continuation carrier)).size ∧
      (run RootResetNestedFrameProbe.machine ticks
        (RootResetNestedFrameProbe.initial ⟨wrap layers (frameFirstRoot actions bits continuation carrier), parents⟩)).cursor.rdx? =
        some (firstTarget actions bits continuation carrier (spineParents layers parents)) := by
  obtain ⟨ticks, bounded, execution⟩ := generated_first layers actions bits continuation carrier parents
  exact ⟨ticks, bounded, by rw [execution]; rfl⟩

theorem generated_second_contracts (layers : List Layer) (actions : Term) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    ∃ ticks,
      ticks ≤ RootResetNestedFrameProbe.coefficient * (wrap layers (frameSecondRoot actions bits continuation carrier)).size ∧
      (run RootResetNestedFrameProbe.machine ticks
        (RootResetNestedFrameProbe.initial ⟨wrap layers (frameSecondRoot actions bits continuation carrier), parents⟩)).cursor.rdx? =
        some (secondTarget actions bits continuation carrier (spineParents layers parents)) := by
  obtain ⟨ticks, bounded, execution⟩ := generated_second layers actions bits continuation carrier parents
  exact ⟨ticks, bounded, by rw [execution]; rfl⟩

end PureSFormal.Research.RootResetNestedFrameAgreement
