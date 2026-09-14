import PureSFormal.Research.RootResetActiveCleanParentsAgreement

/-! Exact pending-prefix execution for the finite frontend. All layer data
below are proof inputs; the machine retains its fixed finite control. -/
namespace PureSFormal.Research.RootResetActivePendingAgreement
open PureSFormal.PureS
open FiniteController
open RootResetCarrierNonemptyProbe (run_to_boundary)
open RootResetActiveMarkedFrontend
open RootResetActiveCleanParentsAgreement

abbrev Layer := Term × Term

def frameLayers (actions : Term) : List Layer → List RootResetFrameSpineWalker.Layer
  | [] => []
  | (payload, continuation) :: layers =>
      (.app (.app .s (actCode actions)) (.app .s payload), continuation) :: frameLayers actions layers

abbrev wrap (actions : Term) (layers : List Layer) (body : Term) :=
  RootResetFrameSpineWalker.wrap (frameLayers actions layers) body

abbrev parentsAfter (actions : Term) (layers : List Layer) (parents : List ParentFrame) :=
  RootResetFrameSpineWalker.spineParents (frameLayers actions layers) parents

theorem segment_of_one_run {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    (origin endpoint : Cursor) (ticks : Nat) (entry : RootResetPendingAdmissionInterleaved.Entry)
    (execution : run (RootResetPendingAdmissionInterleaved.machine program tree) ticks
      (RootResetPendingAdmissionInterleaved.initial program tree origin) = ⟨some (.done entry), endpoint⟩) :
    ∃ used, run (Segment.machine program tree) used (Segment.initial program tree origin) =
      ⟨some (.done entry), endpoint⟩ := by
  obtain ⟨used, bounded, lifted⟩ := run_to_boundary (RootResetPendingAdmissionSegment.base program tree)
    (Segment.machine program tree) (fun pc => pc) RootResetPendingAdmissionSegment.done?
    (RootResetPendingAdmissionSegment.base_absorbs program tree)
    (fun configuration running => by
      rw [RootResetMixedContinuationSpine.lift_id, RootResetMixedContinuationSpine.lift_id]
      exact RootResetPendingAdmissionSegment.step_before_done program tree configuration running)
    ticks (Segment.initial program tree origin) (by rw [execution]; rfl)
  rw [RootResetMixedContinuationSpine.lift_id, execution, RootResetMixedContinuationSpine.lift_id] at lifted
  exact ⟨used, lifted⟩

theorem segment_enters_pending (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (payload continuation child : Term) (parents : List ParentFrame)
    (admitted : RootResetPendingAdmissionPatterns.childAdmitted program tree child = true) :
    ∃ ticks, run (Segment.machine program tree) ticks
      (Segment.initial program tree ⟨.app (.app (CheckpointDecoder.openEnvironment
        (compileActions program tree) payload) continuation) child, parents⟩) =
      Segment.initial program tree ⟨child,
        .right (.app (CheckpointDecoder.openEnvironment (compileActions program tree) payload) continuation) :: parents⟩ := by
  obtain ⟨ticks, bounded, execution⟩ := RootResetPendingAdmissionFragment.admitted_child_runs program tree
    payload continuation child parents admitted
  obtain ⟨p, pb, pr⟩ := RootResetPendingAdmissionInterleaved.pending_runs program tree _ _ true ticks execution
  obtain ⟨used, actual⟩ := segment_of_one_run _ _ (p + 1) .pending pr
  refine ⟨used + 1, ?_⟩
  rw [run_add, actual]
  rfl

theorem wrapped_admitted (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (layers : List Layer) (body : Term)
    (admitted : RootResetPendingAdmissionPatterns.childAdmitted program tree body = true) :
    RootResetPendingAdmissionPatterns.childAdmitted program tree
      (wrap (compileActions program tree) layers body) = true := by
  cases layers with
  | nil => exact admitted
  | cons layer layers =>
      exact RootResetPendingAdmissionPatterns.childAdmitted_pending program tree layer.1 layer.2 _

theorem segment_enters_layers (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (layers : List Layer) (body : Term) (parents : List ParentFrame)
    (admitted : RootResetPendingAdmissionPatterns.childAdmitted program tree body = true) :
    ∃ ticks, run (Segment.machine program tree) ticks
      (Segment.initial program tree ⟨wrap (compileActions program tree) layers body, parents⟩) =
      Segment.initial program tree ⟨body, parentsAfter (compileActions program tree) layers parents⟩ := by
  induction layers generalizing parents with
  | nil => exact ⟨0, rfl⟩
  | cons layer layers ih =>
      rcases layer with ⟨payload, continuation⟩
      obtain ⟨p, pr⟩ := segment_enters_pending program tree payload continuation
        (wrap (compileActions program tree) layers body) parents (wrapped_admitted program tree layers body admitted)
      obtain ⟨rest, rr⟩ := ih (.right (.app (CheckpointDecoder.openEnvironment
        (compileActions program tree) payload) continuation) :: parents)
      refine ⟨p + rest, ?_⟩
      change run (Segment.machine program tree) (p + rest)
        (Segment.initial program tree ⟨.app (.app (CheckpointDecoder.openEnvironment
          (compileActions program tree) payload) continuation) (wrap (compileActions program tree) layers body), parents⟩) = _
      rw [run_add, pr]
      exact rr

theorem segment_layers_terminal (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (layers : List Layer) (body : Term) (parents : List ParentFrame)
    (admitted : RootResetPendingAdmissionPatterns.childAdmitted program tree body = true)
    (ticks : Nat) (entry : RootResetPendingAdmissionInterleaved.Entry) (endpoint : Cursor)
    (execution : run (Segment.machine program tree) ticks
      (Segment.initial program tree ⟨body, parentsAfter (compileActions program tree) layers parents⟩) =
      ⟨some (.done entry), endpoint⟩) :
    ∃ used, run (Segment.machine program tree) used
      (Segment.initial program tree ⟨wrap (compileActions program tree) layers body, parents⟩) =
      ⟨some (.done entry), endpoint⟩ := by
  obtain ⟨prefixTicks, prefixRun⟩ := segment_enters_layers program tree layers body parents admitted
  refine ⟨prefixTicks + ticks, ?_⟩
  rw [run_add, prefixRun]
  exact execution

theorem segment_stops (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin : Cursor) (pendingTicks localTicks : Nat)
    (pendingRun : run (RootResetPendingAdmissionFragment.machine program tree) pendingTicks
      (RootResetPendingAdmissionFragment.initial program tree origin) = ⟨some (.done false), origin⟩)
    (localRun : run (RootResetMixedLocalFragment.machine program tree) localTicks
      (RootResetMixedLocalFragment.initial program tree origin) = ⟨some (.done false), origin⟩) :
    ∃ used, run (Segment.machine program tree) used (Segment.initial program tree origin) =
      ⟨some (.done .stopped), origin⟩ := by
  obtain ⟨p, pb, pr⟩ := RootResetPendingAdmissionInterleaved.pending_runs program tree origin origin false pendingTicks pendingRun
  obtain ⟨l, lb, lr⟩ := RootResetPendingAdmissionInterleaved.local_runs program tree origin origin false localTicks localRun
  apply segment_of_one_run origin origin (p + 1 + (l + 1)) .stopped
  rw [run_add, pr]
  exact lr

theorem forwarded (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin endpoint : Cursor) (frameTicks segmentTicks : Nat)
    (notMarked : RootResetCompletedLocalPatterns.accepts .marked program tree origin.focus = false)
    (frameRun : run RootResetNestedFrameProbe.machine frameTicks (RootResetNestedFrameProbe.initial origin) =
      ⟨some (.done false), origin⟩)
    (entry : RootResetPendingAdmissionInterleaved.Entry) (yielded : entry ≠ .pending)
    (segmentRun : run (Segment.machine program tree) segmentTicks (Segment.initial program tree origin) =
      ⟨some (.done entry), endpoint⟩) :
    ∃ ticks, run (machine program tree) ticks (initial program tree origin) =
      if entry = .completedLocal then initial program tree endpoint else ⟨some (.done false), endpoint⟩ := by
  obtain ⟨m, mb, mr⟩ := marked_runs program tree origin
  rw [notMarked] at mr
  obtain ⟨f, fb, fr⟩ := frame_runs program tree origin origin frameTicks false frameRun
  obtain ⟨s, sb, sr⟩ := segment_runs program tree origin endpoint segmentTicks entry yielded segmentRun
  refine ⟨m + 1 + (f + 1) + s + 1, ?_⟩
  have first : run (machine program tree) (m + 1 + (f + 1)) (initial program tree origin) = segment program tree origin := by
    rw [run_add, mr]
    exact fr
  have second : run (machine program tree) (m + 1 + (f + 1) + s) (initial program tree origin) =
      ⟨some (.segment (.done entry)), endpoint⟩ := by
    rw [run_add, first]
    exact sr
  rw [run_add, second]
  cases entry with
  | pending => exact False.elim (yielded rfl)
  | completedLocal => rfl
  | stopped => rfl

theorem local_stops_of_noLocal (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin : Cursor) (noLocal : CheckpointDecoder.parseLocal? program tree origin.focus = none) :
    ∃ ticks, run (RootResetMixedLocalFragment.machine program tree) ticks
      (RootResetMixedLocalFragment.initial program tree origin) = ⟨some (.done false), origin⟩ := by
  have rejected : RootResetCompletedLocalPatterns.accepts .fresh program tree origin.focus = false := by
    cases accepted : RootResetCompletedLocalPatterns.accepts .fresh program tree origin.focus with
    | false => rfl
    | true =>
        obtain ⟨view, status, parsed⟩ := (RootResetCompletedLocalPatterns.accepts_iff_parse .fresh program tree origin.focus).mp accepted
        rw [noLocal] at parsed
        cases parsed
  obtain ⟨m, mb, mr⟩ := RootResetMixedLocalFragment.marked_runs program tree origin
  obtain ⟨f, fb, fr⟩ := RootResetMixedLocalFragment.fresh_runs program tree origin
  rw [notMarked_of_noLocal noLocal] at mr
  rw [rejected] at fr
  refine ⟨m + 1 + (f + 1), ?_⟩
  rw [run_add, mr]
  exact fr

theorem pending_misses_freshShell (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (audit dispatcher seed seedAudit continuation continuationAudit : Term) (parents : List ParentFrame) :
    ∃ ticks, run (RootResetPendingAdmissionFragment.machine program tree) ticks
      (RootResetPendingAdmissionFragment.initial program tree ⟨CheckpointDecoder.openShell (freshHField audit)
        dispatcher seed seedAudit continuation continuationAudit, parents⟩) =
      ⟨some (.done false), ⟨CheckpointDecoder.openShell (freshHField audit)
        dispatcher seed seedAudit continuation continuationAudit, parents⟩⟩ := by
  obtain ⟨ticks, entered, after, bounded, execution, outcome⟩ := RootResetPendingAdmissionFragment.bounded_input program tree
    ⟨CheckpointDecoder.openShell (freshHField audit) dispatcher seed seedAudit continuation continuationAudit, parents⟩
  cases outcome with
  | stopped refused => exact ⟨ticks, execution⟩
  | entered payload outer child shape admitted =>
      have arity := congrArg Term.headArity shape
      change 6 = 3 at arity
      cases arity

theorem pendingLayers_freshShell_stops (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (layers : List Layer) (audit dispatcher seed seedAudit continuation continuationAudit : Term)
    (parents : List ParentFrame)
    (boundary : RootResetNestedFramePatterns.rightParent? ⟨wrap (compileActions program tree) layers
      (CheckpointDecoder.openShell (freshHField audit) dispatcher seed seedAudit continuation continuationAudit), parents⟩ = false)
    (notMarked : RootResetCompletedLocalPatterns.accepts .marked program tree
      (CheckpointDecoder.openShell (freshHField audit) dispatcher seed seedAudit continuation continuationAudit) = false)
    (localTicks : Nat)
    (localRun : run (RootResetMixedLocalFragment.machine program tree) localTicks
      (RootResetMixedLocalFragment.initial program tree ⟨CheckpointDecoder.openShell (freshHField audit)
        dispatcher seed seedAudit continuation continuationAudit, parentsAfter (compileActions program tree) layers parents⟩) =
      ⟨some (.done false), ⟨CheckpointDecoder.openShell (freshHField audit)
        dispatcher seed seedAudit continuation continuationAudit, parentsAfter (compileActions program tree) layers parents⟩⟩) :
    ∃ ticks, run (machine program tree) ticks (initial program tree ⟨wrap (compileActions program tree) layers
        (CheckpointDecoder.openShell (freshHField audit) dispatcher seed seedAudit continuation continuationAudit), parents⟩) =
      ⟨some (.done false), ⟨CheckpointDecoder.openShell (freshHField audit)
        dispatcher seed seedAudit continuation continuationAudit, parentsAfter (compileActions program tree) layers parents⟩⟩ := by
  obtain ⟨p, pr⟩ := pending_misses_freshShell program tree audit dispatcher seed seedAudit continuation continuationAudit
    (parentsAfter (compileActions program tree) layers parents)
  obtain ⟨s, sr⟩ := segment_stops program tree _ p localTicks pr localRun
  obtain ⟨allTicks, allRun⟩ := segment_layers_terminal program tree layers _ parents
    (RootResetPendingAdmissionPatterns.childAdmitted_freshShell program tree audit dispatcher seed seedAudit continuation continuationAudit)
    s .stopped _ sr
  have noMarked : RootResetCompletedLocalPatterns.accepts .marked program tree (wrap (compileActions program tree) layers
      (CheckpointDecoder.openShell (freshHField audit) dispatcher seed seedAudit continuation continuationAudit)) = false := by
    cases layers with
    | nil => exact notMarked
    | cons layer layers =>
        apply notMarked_of_noLocal
        apply CheckpointDecoder.parseLocal?_none_of_headArity
        · change 3 ≠ 5; decide
        · change 3 ≠ 6; decide
  obtain ⟨f, fb, fr⟩ := RootResetNestedFrameCost.missed_count (frameLayers (compileActions program tree) layers)
    (CheckpointDecoder.openShell (freshHField audit) dispatcher seed seedAudit continuation continuationAudit) parents
    rfl (RootResetFrameCarrierGuard.frameHeadGuard_freshShell ..) boundary
  exact forwarded program tree _ _ f allTicks noMarked fr .stopped (by intro h; cases h) allRun

theorem cleanParents_liveFresh_stops {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {count : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents count)
    (layers : List Layer) (audit dispatcher seed seedAudit continuation continuationAudit : Term)
    (noLocal : CheckpointDecoder.parseLocal? program layout.tree
      (CheckpointDecoder.openShell (freshHField audit) dispatcher seed seedAudit continuation continuationAudit) = none) :
    ∃ ticks, ticks ≤ coefficient program layout.tree * (Cursor.rebuild parents (wrap (compileActions program layout.tree) layers
      (CheckpointDecoder.openShell (freshHField audit) dispatcher seed seedAudit continuation continuationAudit))).size ∧
      run (machine program layout.tree) ticks (initial program layout.tree (Cursor.atRoot (Cursor.rebuild parents
        (wrap (compileActions program layout.tree) layers
          (CheckpointDecoder.openShell (freshHField audit) dispatcher seed seedAudit continuation continuationAudit))))) =
      ⟨some (.done false), ⟨CheckpointDecoder.openShell (freshHField audit) dispatcher seed seedAudit continuation continuationAudit,
        parentsAfter (compileActions program layout.tree) layers parents⟩⟩ := by
  obtain ⟨localTicks, localRun⟩ := local_stops_of_noLocal program layout.tree
    ⟨_, parentsAfter (compileActions program layout.tree) layers parents⟩ noLocal
  obtain ⟨ticks, execution⟩ := pendingLayers_freshShell_stops program layout.tree layers audit dispatcher seed seedAudit continuation continuationAudit
    parents (parents_boundary outer _) (notMarked_of_noLocal noLocal) localTicks localRun
  exact cleanParents_terminal outer _ ticks false _ execution

end PureSFormal.Research.RootResetActivePendingAgreement
