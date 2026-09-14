import PureSFormal.Research.RootResetNestedFramePatterns
import PureSFormal.Research.RootResetMixedLocalFragment

/-!
# A finite FRAME probe with exact nested-origin failure return

The controller descends pending arity-three R wrappers, then executes bounded
FRAME-head pattern/address fragments. A successful fragment focuses a genuine
redex. A miss retraces the selected pending R edges and returns to the exact
entry cursor, including beneath completed-continuation left parents. Every
input with no incoming R at entry terminates within coefficient * focus.size
ticks, and all runs preserve the bare term. The origin is not stored or
compared at runtime. Clock and response phases are separate compositions.
-/

namespace PureSFormal.Research.RootResetNestedFrameProbe
open PureSFormal.PureS
open FiniteController
open RootResetPatternFragment
open RootResetCarrierNonemptyProbe
open RootResetNestedFramePatterns

inductive Control where
  | descending (pc : RootResetEdgeSpine.Control pendingRows)
  | reading (pc : RootResetEdgeFragment.Control headRows)
  | ascending (pc : RootResetInverseEdgeSpine.Control pendingRows)
  | done (ready : Bool)

def cover : List Control := [.done false, .done true] ++
  (RootResetEdgeSpine.machine pendingRows).states.map Control.descending ++
  (RootResetEdgeFragment.machine headRows).states.map Control.reading ++
  (RootResetInverseEdgeSpine.machine pendingRows).states.map Control.ascending

theorem covers (state : Control) : state ∈ cover := by
  simp only [cover, List.mem_append]
  cases state with
  | done ready =>
      apply Or.inl ∘ Or.inl ∘ Or.inl
      cases ready with
      | false => exact List.Mem.head _
      | true => exact List.Mem.tail _ (List.Mem.head _)
  | descending pc => exact Or.inl (Or.inl (Or.inr (RootResetCompletedLocalPatterns.map_member _ ((RootResetEdgeSpine.machine pendingRows).covers pc))))
  | reading pc => exact Or.inl (Or.inr (RootResetCompletedLocalPatterns.map_member _ ((RootResetEdgeFragment.machine headRows).covers pc)))
  | ascending pc => exact Or.inr (RootResetCompletedLocalPatterns.map_member _ ((RootResetInverseEdgeSpine.machine pendingRows).covers pc))

def transition (state : Control) (node : Probe.NodeKind) (incoming : Probe.Incoming) : Command Control :=
  match state with
  | .descending pc => match pc.val with
    | .answer false => .stay (.reading ⟨RootResetEdgeFragment.familyCode headRows, ProbeCompiler.Control.self_mem_nodes _⟩)
    | _ => mapCommand Control.descending ((RootResetEdgeSpine.machine pendingRows).transition pc node incoming)
  | .reading pc => match pc.val with
    | .answer true => .stay (.done true)
    | .answer false => .stay (.ascending ⟨RootResetInverseEdgeSpine.whole pendingRows, ProbeCompiler.Control.self_mem_nodes _⟩)
    | _ => mapCommand Control.reading ((RootResetEdgeFragment.machine headRows).transition pc node incoming)
  | .ascending pc => match pc.val with
    | .answer false => .stay (.done false)
    | _ => mapCommand Control.ascending ((RootResetInverseEdgeSpine.machine pendingRows).transition pc node incoming)
  | .done ready => .stay (.done ready)

def machine : Machine Control := ⟨fun _ => cover, covers, transition⟩
def initial (origin : Cursor) : Configuration Control := liftConfiguration Control.descending (RootResetEdgeSpine.initial pendingRows origin)
def reading (origin : Cursor) : Configuration Control := liftConfiguration Control.reading (RootResetEdgeFragment.initial headRows origin)
def ascending (origin : Cursor) : Configuration Control := liftConfiguration Control.ascending (RootResetInverseEdgeSpine.initial pendingRows origin)

theorem descending_step (configuration : Configuration (RootResetEdgeSpine.Control pendingRows))
    (running : falseAnswer? configuration = false) :
    step machine (liftConfiguration Control.descending configuration) =
      liftConfiguration Control.descending (step (RootResetEdgeSpine.machine pendingRows) configuration) := by
  apply step_lift
  intro state current
  rcases configuration with ⟨runtime, cursor⟩
  have equal : runtime = some state := current
  subst runtime
  rcases state with ⟨code, member⟩
  cases code with
  | answer result => cases result with
    | false => cases running
    | true => rfl
  | observeNode onS onApp => rfl
  | observeIncoming onRoot onLeft onRight => rfl
  | move operation next => rfl

theorem reading_step (configuration : Configuration (RootResetEdgeFragment.Control headRows))
    (running : anyAnswer? configuration = false) :
    step machine (liftConfiguration Control.reading configuration) =
      liftConfiguration Control.reading (step (RootResetEdgeFragment.machine headRows) configuration) := by
  apply step_lift
  intro state current
  rcases configuration with ⟨runtime, cursor⟩
  have equal : runtime = some state := current
  subst runtime
  rcases state with ⟨code, member⟩
  cases code with
  | answer result => cases running
  | observeNode onS onApp => rfl
  | observeIncoming onRoot onLeft onRight => rfl
  | move operation next => rfl

theorem ascending_step (configuration : Configuration (RootResetInverseEdgeSpine.Control pendingRows))
    (running : falseAnswer? configuration = false) :
    step machine (liftConfiguration Control.ascending configuration) =
      liftConfiguration Control.ascending (step (RootResetInverseEdgeSpine.machine pendingRows) configuration) := by
  apply step_lift
  intro state current
  rcases configuration with ⟨runtime, cursor⟩
  have equal : runtime = some state := current
  subst runtime
  rcases state with ⟨code, member⟩
  cases code with
  | answer result => cases result with
    | false => cases running
    | true => rfl
  | observeNode onS onApp => rfl
  | observeIncoming onRoot onLeft onRight => rfl
  | move operation next => rfl

theorem descending_runs (origin endpoint : Cursor) (ticks : Nat)
    (member : ProbeCompiler.Control.answer false ∈ (RootResetEdgeSpine.whole pendingRows).nodes)
    (execution : run (RootResetEdgeSpine.machine pendingRows) ticks
      (RootResetEdgeSpine.initial pendingRows origin) = ⟨some ⟨.answer false, member⟩, endpoint⟩) :
    ∃ used, used ≤ ticks ∧ run machine (used + 1) (initial origin) = reading endpoint := by
  obtain ⟨used, bounded, lifted⟩ := run_to_boundary (RootResetEdgeSpine.machine pendingRows) machine Control.descending
    falseAnswer? (false_terminal_absorbs _ _ (fun member cursor ticks => RootResetEdgeSpine.false_absorbs _ ticks member cursor))
    descending_step ticks (RootResetEdgeSpine.initial pendingRows origin) (by rw [execution]; rfl)
  rw [execution] at lifted
  refine ⟨used, bounded, ?_⟩
  change run machine (used + 1) (liftConfiguration Control.descending (RootResetEdgeSpine.initial pendingRows origin)) = _
  rw [run_add, lifted]
  rfl

theorem reading_runs (origin endpoint : Cursor) (ticks : Nat) (ready : Bool)
    (member : ProbeCompiler.Control.answer ready ∈ (RootResetEdgeFragment.familyCode headRows).nodes)
    (execution : run (RootResetEdgeFragment.machine headRows) ticks
      (RootResetEdgeFragment.initial headRows origin) = ⟨some ⟨.answer ready, member⟩, endpoint⟩) :
    ∃ used, used ≤ ticks ∧ run machine (used + 1) (reading origin) =
      if ready then ⟨some (.done true), endpoint⟩ else ascending endpoint := by
  obtain ⟨used, bounded, lifted⟩ := run_to_boundary (RootResetEdgeFragment.machine headRows) machine Control.reading
    anyAnswer? (RootResetMixedLocalFragment.classify_absorbs _) reading_step ticks
    (RootResetEdgeFragment.initial headRows origin) (by rw [execution]; rfl)
  rw [execution] at lifted
  refine ⟨used, bounded, ?_⟩
  change run machine (used + 1) (liftConfiguration Control.reading (RootResetEdgeFragment.initial headRows origin)) = _
  rw [run_add, lifted]
  cases ready <;> rfl

theorem ascending_runs (origin endpoint : Cursor) (ticks : Nat)
    (member : ProbeCompiler.Control.answer false ∈ (RootResetInverseEdgeSpine.whole pendingRows).nodes)
    (execution : run (RootResetInverseEdgeSpine.machine pendingRows) ticks
      (RootResetInverseEdgeSpine.initial pendingRows origin) = ⟨some ⟨.answer false, member⟩, endpoint⟩) :
    ∃ used, used ≤ ticks ∧ run machine (used + 1) (ascending origin) = ⟨some (.done false), endpoint⟩ := by
  obtain ⟨used, bounded, lifted⟩ := run_to_boundary (RootResetInverseEdgeSpine.machine pendingRows) machine Control.ascending
    falseAnswer? (false_terminal_absorbs _ _ (fun member cursor ticks => RootResetInverseEdgeSpine.false_absorbs _ ticks member cursor))
    ascending_step ticks (RootResetInverseEdgeSpine.initial pendingRows origin) (by rw [execution]; rfl)
  rw [execution] at lifted
  refine ⟨used, bounded, ?_⟩
  change run machine (used + 1) (liftConfiguration Control.ascending (RootResetInverseEdgeSpine.initial pendingRows origin)) = _
  rw [run_add, lifted]
  rfl

abbrev upCost := RootResetInverseEdgeSpine.coefficient pendingRows
abbrev downCost := RootResetEdgeSpine.coefficient pendingRows
abbrev headCost := RootResetEdgeFragment.bound headRows

theorem reverse_runs {origin endpoint : Cursor} (walk : RootResetEdgeSpine.Walks pendingRows origin endpoint) :
    ∃ ticks, ticks + upCost * endpoint.focus.size ≤ upCost * origin.focus.size ∧
      run (RootResetInverseEdgeSpine.machine pendingRows) ticks
        (RootResetInverseEdgeSpine.initial pendingRows endpoint) = RootResetInverseEdgeSpine.initial pendingRows origin := by
  induction walk with
  | done origin missed => exact ⟨0, by rw [Nat.zero_add]; exact Nat.le_refl _, rfl⟩
  | next origin after row selected followed rest ih =>
      obtain ⟨member, matched⟩ := RootResetEdgeFragment.select_sound _ origin.focus row selected
      have found := inverse_edge origin after row selected followed
      have smaller := RootResetEdgeFragment.follow_size_lt row.address origin after (pending_valid row member).1 followed
      obtain ⟨restTicks, restBound, restRun⟩ := ih
      have edgeBound : RootResetInverseEdgeSpine.familyTicks pendingRows after + 2 ≤ upCost :=
        Nat.add_le_add_right (RootResetInverseEdgeSpine.familyTicks_bound _ _) 2
      refine ⟨restTicks + (RootResetInverseEdgeSpine.familyTicks pendingRows after + 2), ?_, ?_⟩
      · calc
          _ = (restTicks + upCost * _) + (RootResetInverseEdgeSpine.familyTicks pendingRows after + 2) := by
            simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
          _ ≤ upCost * after.focus.size + upCost := Nat.add_le_add restBound edgeBound
          _ = upCost * (after.focus.size + 1) := by rw [Nat.mul_add, Nat.mul_one]
          _ ≤ upCost * origin.focus.size := Nat.mul_le_mul_left _ smaller
      · rw [run_add, restRun]
        exact RootResetInverseEdgeSpine.selected_runs _ after origin found

def coefficient : Nat := downCost + upCost + upCost + headCost + 3

theorem combined_bound (source : Term) (down read up : Nat)
    (downBound : down ≤ downCost * source.size) (readBound : read ≤ headCost)
    (upBound : up ≤ upCost * source.size + upCost) :
    down + 1 + (read + 1) + (up + 1) ≤ coefficient * source.size := by
  have constant (value : Nat) : value ≤ value * source.size := by
    simpa only [Nat.mul_one] using Nat.mul_le_mul_left value (Term.size_pos source)
  have combined := Nat.add_le_add_right (Nat.add_le_add (Nat.add_le_add downBound readBound) upBound) 3
  have enlarged := Nat.add_le_add (Nat.add_le_add
    (Nat.add_le_add (Nat.add_le_add (Nat.le_refl (downCost * source.size)) (constant headCost))
      (Nat.le_refl (upCost * source.size))) (constant upCost)) (constant 3)
  apply Nat.le_trans (by simpa only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using combined)
  simpa only [coefficient, Nat.add_mul, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using enlarged


theorem all_input (origin : Cursor) (boundary : rightParent? origin = false) :
    ∃ ticks ready endpoint, ticks ≤ coefficient * origin.focus.size ∧
      run machine ticks (initial origin) = ⟨some (.done ready), endpoint⟩ ∧
      (if ready then endpoint.rdx?.isSome = true else endpoint = origin) := by
  obtain ⟨downTicks, descended, noMember, downBound, downRun, downWalk⟩ :=
    RootResetEdgeSpine.scan_within pendingRows pending_valid origin
  obtain ⟨downUsed, downUsedBound, actualDown⟩ := descending_runs origin descended downTicks noMember downRun
  cases selected : RootResetEdgeFragment.select headRows descended.focus with
  | none =>
      obtain ⟨readMember, readRun⟩ := RootResetEdgeFragment.missed_runs headRows descended selected
      obtain ⟨readUsed, readUsedBound, actualRead⟩ := reading_runs descended descended _ false readMember readRun
      simp only [Bool.false_eq_true, ↓reduceIte] at actualRead
      obtain ⟨reverseTicks, reverseBound, reverseRun⟩ := reverse_runs downWalk
      have reverseSmall : reverseTicks ≤ upCost * origin.focus.size := Nat.le_trans (Nat.le_add_right _ _) reverseBound
      obtain ⟨upMember, upRun⟩ := RootResetInverseEdgeSpine.missed_runs pendingRows origin (inverse_boundary origin boundary)
      have fullUp : run (RootResetInverseEdgeSpine.machine pendingRows)
          (reverseTicks + RootResetInverseEdgeSpine.familyTicks pendingRows origin)
          (RootResetInverseEdgeSpine.initial pendingRows descended) =
          ⟨some ⟨ProbeCompiler.Control.answer false, upMember⟩, origin⟩ := by
        rw [run_add, reverseRun]
        exact upRun
      obtain ⟨upUsed, upUsedBound, actualUp⟩ := ascending_runs descended origin _ upMember fullUp
      have upBound : upUsed ≤ upCost * origin.focus.size + upCost :=
        Nat.le_trans upUsedBound (Nat.add_le_add reverseSmall
          (Nat.le_trans (RootResetInverseEdgeSpine.familyTicks_bound _ _) (Nat.le_add_right _ 2)))
      refine ⟨downUsed + 1 + (readUsed + 1) + (upUsed + 1), false, origin,
        combined_bound origin.focus downUsed readUsed upUsed (Nat.le_trans downUsedBound downBound)
          (Nat.le_trans readUsedBound (RootResetEdgeFragment.ticks_bound _ _)) upBound, ?_, rfl⟩
      have firstTwo : run machine (downUsed + 1 + (readUsed + 1)) (initial origin) = ascending descended := by
        rw [run_add, actualDown]
        exact actualRead
      rw [run_add, firstTwo]
      exact actualUp
  | some row =>
      obtain ⟨member, matched⟩ := RootResetEdgeFragment.select_sound headRows descended.focus row selected
      obtain ⟨target, subterm⟩ := (heads_valid row member).2 descended.focus matched
      obtain ⟨endpoint, followed, focusEq⟩ := RootResetEdgeFragment.follow_exists row.address descended.focus target subterm descended.parents
      have redex := selected_redex descended endpoint row selected followed
      obtain ⟨readMember, readRun⟩ := RootResetEdgeFragment.selected_runs headRows descended endpoint row selected followed
      obtain ⟨readUsed, readUsedBound, actualRead⟩ := reading_runs descended endpoint _ true readMember readRun
      simp only [↓reduceIte] at actualRead
      refine ⟨downUsed + 1 + (readUsed + 1), true, endpoint, ?_, ?_, redex⟩
      · exact Nat.le_trans (Nat.le_add_right _ 1)
          (combined_bound origin.focus downUsed readUsed 0 (Nat.le_trans downUsedBound downBound)
            (Nat.le_trans readUsedBound (RootResetEdgeFragment.ticks_bound _ _)) (Nat.zero_le _))
      · rw [run_add, actualDown]
        exact actualRead

theorem mutationCount_zero (configuration : Configuration Control) : mutationCount machine configuration = 0 := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => rfl
  | some state =>
      rw [← commandCount_eq_mutationCount]
      cases state with
      | done ready => rfl
      | descending pc =>
          rcases pc with ⟨code, member⟩
          have zero := RootResetEdgeSpine.mutationCount_zero pendingRows ⟨some ⟨code, member⟩, cursor⟩
          cases code <;> try { rename_i result; cases result <;> rfl }
          all_goals
            simp only [machine, transition, commandCount_map]
            rw [commandCount_eq_mutationCount]
            exact zero
      | reading pc =>
          rcases pc with ⟨code, member⟩
          have zero := RootResetPatternFragment.mutationCount_zero _ (RootResetEdgeFragment.family_readOnly headRows)
            ⟨some ⟨code, member⟩, cursor⟩
          cases code <;> try { rename_i result; cases result <;> rfl }
          all_goals
            simp only [machine, transition, commandCount_map]
            rw [commandCount_eq_mutationCount]
            exact zero
      | ascending pc =>
          rcases pc with ⟨code, member⟩
          have zero := RootResetInverseEdgeSpine.mutationCount_zero pendingRows ⟨some ⟨code, member⟩, cursor⟩
          cases code <;> try { rename_i result; cases result <;> rfl }
          all_goals
            simp only [machine, transition, commandCount_map]
            rw [commandCount_eq_mutationCount]
            exact zero

theorem runMutationCount_zero (ticks : Nat) (configuration : Configuration Control) : runMutationCount machine ticks configuration = 0 := by
  induction ticks generalizing configuration with
  | zero => rfl
  | succ ticks ih => rw [runMutationCount, mutationCount_zero, ih, Nat.zero_add]

theorem erase_run (ticks : Nat) (configuration : Configuration Control) :
    (run machine ticks configuration).cursor.erase = configuration.cursor.erase := by
  have projected := run_projects_stepsN machine ticks configuration
  rw [runMutationCount_zero] at projected
  exact (StepsN.eq_of_zero projected).symm

theorem done_absorbs (ready : Bool) (origin : Cursor) (ticks : Nat) :
    run machine ticks ⟨some (.done ready), origin⟩ = ⟨some (.done ready), origin⟩ := by
  induction ticks with
  | zero => rfl
  | succ ticks ih => exact ih

theorem nested_all_input (source audit : Term) (parents : List ParentFrame) :
    ∃ ticks ready endpoint, ticks ≤ coefficient * source.size ∧
      run machine ticks (initial ⟨source, .left audit :: parents⟩) = ⟨some (.done ready), endpoint⟩ ∧
      (if ready then endpoint.rdx?.isSome = true else endpoint = ⟨source, .left audit :: parents⟩) :=
  all_input ⟨source, .left audit :: parents⟩ rfl

end PureSFormal.Research.RootResetNestedFrameProbe
