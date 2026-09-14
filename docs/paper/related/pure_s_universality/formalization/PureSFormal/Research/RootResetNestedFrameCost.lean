import PureSFormal.Research.RootResetNestedFrameAgreement

/-!
The scoped FRAME miss inspects only the pending spine and a bounded head.
Its charge retains the entire terminal body for the following phase.
-/
namespace PureSFormal.Research.RootResetNestedFrameCost
open PureSFormal.PureS
open FiniteController
open RootResetNestedFramePatterns
open RootResetFrameSpineWalker (Layer wrap spineParents)
open RootResetNestedFrameProbe (upCost downCost headCost)

theorem pending_headArity (source : Term) (matched : pendingPattern.matchesBool source = true) :
    source.headArity = 3 := by
  obtain ⟨a, z, sourceEq, am, _⟩ := RootResetCompletedLocalPatterns.app_matches matched
  obtain ⟨b, y, aEq, bm, _⟩ := RootResetCompletedLocalPatterns.app_matches am
  obtain ⟨head, x, bEq, sm, _⟩ := RootResetCompletedLocalPatterns.app_matches bm
  have equal : head = .s := (Pattern.matches_s_iff head).mp (Pattern.matchesBool_sound sm)
  rw [sourceEq, aEq, bEq, equal]
  rfl

theorem parsed_local_stops {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {source : Term} {view : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program tree source = some view) :
    RootResetEdgeFragment.select pendingRows source = none := by
  have missed : pendingPattern.matchesBool source = false := by
    cases matched : pendingPattern.matchesBool source with
    | false => rfl
    | true =>
        have arity := pending_headArity source matched
        rcases CheckpointDecoder.parseLocal?_headArity parsed with five | six
        · rw [arity] at five; cases five
        · rw [arity] at six; cases six
  simp only [pendingRows, pendingRow, RootResetEdgeFragment.select, missed, Bool.false_eq_true, ↓reduceIte]

theorem miss_implies_guard (layers : List Layer) (body : Term) (parents : List ParentFrame)
    (stops : RootResetEdgeFragment.select pendingRows body = none) (ticks : Nat)
    (execution : run RootResetNestedFrameProbe.machine ticks
      (RootResetNestedFrameProbe.initial ⟨wrap layers body, parents⟩) =
      ⟨some (.done false), ⟨wrap layers body, parents⟩⟩) :
    RootResetFrameCarrierGuard.frameHeadGuard body = false := by
  apply (RootResetNestedFrameAgreement.head_misses_iff body).mp
  cases selected : RootResetEdgeFragment.select headRows body with
  | none => rfl
  | some row =>
      obtain ⟨member, matched⟩ := RootResetEdgeFragment.select_sound headRows body row selected
      obtain ⟨target, subterm⟩ := (heads_valid row member).2 body matched
      obtain ⟨endpoint, followed, focusEq⟩ := RootResetEdgeFragment.follow_exists row.address body target subterm (spineParents layers parents)
      obtain ⟨hitTicks, hitBound, hitRun⟩ := RootResetNestedFrameAgreement.selected layers body parents stops row endpoint selected followed
      have leftRun : run RootResetNestedFrameProbe.machine (ticks + hitTicks)
          (RootResetNestedFrameProbe.initial ⟨wrap layers body, parents⟩) =
          ⟨some (.done false), ⟨wrap layers body, parents⟩⟩ := by
        rw [run_add, execution, RootResetNestedFrameProbe.done_absorbs]
      have rightRun : run RootResetNestedFrameProbe.machine (ticks + hitTicks)
          (RootResetNestedFrameProbe.initial ⟨wrap layers body, parents⟩) = ⟨some (.done true), endpoint⟩ := by
        rw [Nat.add_comm, run_add, hitRun, RootResetNestedFrameProbe.done_absorbs]
      have incompatible := congrArg Configuration.control (leftRun.symm.trans rightRun)
      cases incompatible

theorem down_count (layers : List Layer) (body : Term)
    (stops : RootResetEdgeFragment.select pendingRows body = none) (parents : List ParentFrame) :
    ∃ ticks member,
      ticks ≤ downCost * (layers.length + 1) ∧
      run (RootResetEdgeSpine.machine pendingRows) ticks
        (RootResetEdgeSpine.initial pendingRows ⟨wrap layers body, parents⟩) =
        ⟨some ⟨.answer false, member⟩, ⟨body, spineParents layers parents⟩⟩ := by
  induction layers generalizing parents with
  | nil =>
      obtain ⟨member, execution⟩ := RootResetEdgeSpine.missed_runs pendingRows ⟨body, parents⟩ stops
      exact ⟨_, member, Nat.le_trans (RootResetEdgeFragment.ticks_bound _ _) (Nat.le_add_right _ 1), execution⟩
  | cons layer layers ih =>
      rcases layer with ⟨field, continuation⟩
      let source := wrap ((field, continuation) :: layers) body
      let after : Cursor := ⟨wrap layers body, .right (.app (.app .s field) continuation) :: parents⟩
      have firstRun := RootResetEdgeSpine.selected_runs pendingRows ⟨source, parents⟩ after pendingRow rfl
        (by intro h; cases h) rfl
      obtain ⟨ticks, member, bounded, execution⟩ := ih after.parents
      refine ⟨RootResetEdgeFragment.ticks pendingRows source + 1 + ticks, member, ?_, ?_⟩
      · have total := Nat.add_le_add (RootResetEdgeSpine.prefix_bound pendingRows source) bounded
        simpa only [downCost, List.length_cons, Nat.mul_add, Nat.mul_one,
          Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using total
      · rw [run_add, firstRun]
        exact execution

theorem reverse_count (layers : List Layer) (body : Term) (parents : List ParentFrame) :
    ∃ ticks, ticks ≤ upCost * layers.length ∧
      run (RootResetInverseEdgeSpine.machine pendingRows) ticks
        (RootResetInverseEdgeSpine.initial pendingRows ⟨body, spineParents layers parents⟩) =
        RootResetInverseEdgeSpine.initial pendingRows ⟨wrap layers body, parents⟩ := by
  induction layers generalizing parents with
  | nil => exact ⟨0, Nat.le_refl _, rfl⟩
  | cons layer layers ih =>
      rcases layer with ⟨field, continuation⟩
      let source : Cursor := ⟨wrap ((field, continuation) :: layers) body, parents⟩
      let after : Cursor := ⟨wrap layers body, .right (.app (.app .s field) continuation) :: parents⟩
      obtain ⟨ticks, bounded, execution⟩ := ih after.parents
      have firstRun := RootResetInverseEdgeSpine.selected_runs pendingRows after source
        (inverse_edge source after pendingRow rfl rfl)
      refine ⟨ticks + (RootResetInverseEdgeSpine.familyTicks pendingRows after + 2), ?_, ?_⟩
      · have total := Nat.add_le_add bounded (Nat.add_le_add_right (RootResetInverseEdgeSpine.familyTicks_bound pendingRows after) 2)
        simpa only [List.length_cons, Nat.mul_succ] using! total
      · rw [spineParents, run_add, execution]
        exact firstRun

def coefficient : Nat := downCost + upCost + headCost + 3

theorem missed_count (layers : List Layer) (body : Term) (parents : List ParentFrame)
    (stops : RootResetEdgeFragment.select pendingRows body = none)
    (guardMiss : RootResetFrameCarrierGuard.frameHeadGuard body = false)
    (boundary : rightParent? ⟨wrap layers body, parents⟩ = false) :
    ∃ ticks, ticks ≤ coefficient * (layers.length + 1) ∧
      run RootResetNestedFrameProbe.machine ticks
        (RootResetNestedFrameProbe.initial ⟨wrap layers body, parents⟩) =
        ⟨some (.done false), ⟨wrap layers body, parents⟩⟩ := by
  let start : Cursor := ⟨wrap layers body, parents⟩
  let descended : Cursor := ⟨body, spineParents layers parents⟩
  obtain ⟨downTicks, member, bounded, execution⟩ := down_count layers body stops parents
  obtain ⟨downUsed, downBound, downRun⟩ := RootResetNestedFrameProbe.descending_runs start descended downTicks member execution
  obtain ⟨readMember, readRun⟩ := RootResetEdgeFragment.missed_runs headRows descended
    ((RootResetNestedFrameAgreement.head_misses_iff body).mpr guardMiss)
  obtain ⟨readUsed, readBound, readActual⟩ := RootResetNestedFrameProbe.reading_runs descended descended _ false readMember readRun
  obtain ⟨reverseTicks, reverseBound, reverseRun⟩ := reverse_count layers body parents
  obtain ⟨upMember, upRun⟩ := RootResetInverseEdgeSpine.missed_runs pendingRows start (inverse_boundary start boundary)
  have fullUp : run (RootResetInverseEdgeSpine.machine pendingRows)
      (reverseTicks + RootResetInverseEdgeSpine.familyTicks pendingRows start)
      (RootResetInverseEdgeSpine.initial pendingRows descended) =
      ⟨some ⟨ProbeCompiler.Control.answer false, upMember⟩, start⟩ := by
    rw [run_add, reverseRun]
    exact upRun
  obtain ⟨upUsed, upUsedBound, actualUp⟩ := RootResetNestedFrameProbe.ascending_runs descended start _ upMember fullUp
  have upBound : upUsed ≤ upCost * (layers.length + 1) := by
    rw [Nat.mul_succ]
    exact Nat.le_trans upUsedBound (Nat.add_le_add reverseBound
      (Nat.le_trans (RootResetInverseEdgeSpine.familyTicks_bound _ _) (Nat.le_add_right _ 2)))
  refine ⟨downUsed + 1 + (readUsed + 1) + (upUsed + 1), ?_, ?_⟩
  · have constant (value : Nat) : value ≤ value * (layers.length + 1) := by
      simpa only [Nat.mul_one] using Nat.mul_le_mul_left value (Nat.succ_le_succ (Nat.zero_le _))
    have total := Nat.add_le_add (Nat.add_le_add (Nat.add_le_add (Nat.le_trans downBound bounded)
      (Nat.le_trans (Nat.le_trans readBound (RootResetEdgeFragment.ticks_bound _ _)) (constant headCost))) upBound) (constant 3)
    simpa only [coefficient, Nat.add_mul, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using total
  · have firstTwo : run RootResetNestedFrameProbe.machine (downUsed + 1 + (readUsed + 1))
        (RootResetNestedFrameProbe.initial start) = RootResetNestedFrameProbe.ascending descended := by
      rw [run_add, downRun]
      exact readActual
    rw [run_add, firstTwo]
    exact actualUp

theorem wrapper_size (layers : List Layer) (body : Term) :
    layers.length + body.size ≤ (wrap layers body).size := by
  induction layers with
  | nil => simpa only [List.length_nil, Nat.zero_add, wrap] using Nat.le_refl body.size
  | cons layer layers ih =>
      rcases layer with ⟨field, continuation⟩
      have outer : (wrap layers body).size + 1 ≤ (wrap ((field, continuation) :: layers) body).size := by
        change (wrap layers body).size + 1 ≤ (Term.app (Term.app .s field) continuation).size + (wrap layers body).size + 1
        exact Nat.add_le_add_right (Nat.le_add_left _ _) 1
      exact Nat.le_trans (by simpa only [List.length_cons, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using Nat.add_le_add_right ih 1) outer

theorem missed_paid (layers : List Layer) (body : Term) (parents : List ParentFrame)
    (stops : RootResetEdgeFragment.select pendingRows body = none)
    (guardMiss : RootResetFrameCarrierGuard.frameHeadGuard body = false)
    (boundary : rightParent? ⟨wrap layers body, parents⟩ = false) :
    ∃ ticks, ticks + coefficient * body.size ≤ coefficient * ((wrap layers body).size + 1) ∧
      run RootResetNestedFrameProbe.machine ticks
        (RootResetNestedFrameProbe.initial ⟨wrap layers body, parents⟩) =
        ⟨some (.done false), ⟨wrap layers body, parents⟩⟩ := by
  obtain ⟨ticks, bounded, execution⟩ := missed_count layers body parents stops guardMiss boundary
  refine ⟨ticks, ?_, execution⟩
  calc
    _ ≤ coefficient * (layers.length + 1) + coefficient * body.size := Nat.add_le_add_right bounded _
    _ = coefficient * (layers.length + body.size + 1) := by
      simp only [Nat.mul_add, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
    _ ≤ coefficient * ((wrap layers body).size + 1) := Nat.mul_le_mul_left _ (Nat.add_le_add_right (wrapper_size layers body) 1)

end PureSFormal.Research.RootResetNestedFrameCost
