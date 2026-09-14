import PureSFormal.Research.RootResetActiveFrameFrontend

/-! Concrete execution seams for the finite active-context frontend. -/
namespace PureSFormal.Research.RootResetActiveFrameAgreement
open PureSFormal.PureS
open FiniteController SchedulerResponseInvariant
open RootResetActiveFrameFrontend
open RootResetFrameSpineWalker (Layer wrap spineParents)

theorem accepted_frame (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin endpoint : Cursor) (ticks : Nat)
    (bounded : ticks ≤ RootResetNestedFrameProbe.coefficient * origin.focus.size)
    (execution : run RootResetNestedFrameProbe.machine ticks (RootResetNestedFrameProbe.initial origin) =
      ⟨some (.done true), endpoint⟩) :
    ∃ used, used ≤ coefficient program tree * origin.focus.size ∧
      run (machine program tree) used (initial program tree origin) = ⟨some (.done true), endpoint⟩ := by
  obtain ⟨used, usedBound, actual⟩ := frame_runs program tree origin endpoint ticks true execution
  refine ⟨used + 1, ?_, actual⟩
  simpa only [Nat.add_zero] using stop_bound program tree origin.focus used 0 1 (by decide)
    (Nat.le_trans usedBound bounded) (Nat.zero_le _)

theorem generated_first (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (layers : List Layer) (actions : Term) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    ∃ ticks, ticks ≤ coefficient program tree * (wrap layers (frameFirstRoot actions bits continuation carrier)).size ∧
      run (machine program tree) ticks (initial program tree ⟨wrap layers (frameFirstRoot actions bits continuation carrier), parents⟩) =
        ⟨some (.done true), RootResetNestedFrameAgreement.firstCursor actions bits carrier continuation (spineParents layers parents)⟩ := by
  obtain ⟨ticks, bounded, execution⟩ := RootResetNestedFrameAgreement.generated_first layers actions bits continuation carrier parents
  exact accepted_frame program tree _ _ ticks bounded execution

theorem generated_second (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (layers : List Layer) (actions : Term) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    ∃ ticks, ticks ≤ coefficient program tree * (wrap layers (frameSecondRoot actions bits continuation carrier)).size ∧
      run (machine program tree) ticks (initial program tree ⟨wrap layers (frameSecondRoot actions bits continuation carrier), parents⟩) =
        ⟨some (.done true), RootResetNestedFrameAgreement.secondCursor actions carrier bits continuation (spineParents layers parents)⟩ := by
  obtain ⟨ticks, bounded, execution⟩ := RootResetNestedFrameAgreement.generated_second layers actions bits continuation carrier parents
  exact accepted_frame program tree _ _ ticks bounded execution

theorem continued (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin endpoint : Cursor) (frameTicks segmentTicks : Nat)
    (frameRun : run RootResetNestedFrameProbe.machine frameTicks (RootResetNestedFrameProbe.initial origin) =
      ⟨some (.done false), origin⟩)
    (segmentRun : run (Segment.machine program tree) segmentTicks (Segment.initial program tree origin) =
      ⟨some (.done .completedLocal), endpoint⟩) :
    ∃ ticks, ticks ≤ frameTicks + segmentTicks + 2 ∧
      run (machine program tree) ticks (initial program tree origin) = initial program tree endpoint := by
  obtain ⟨frameUsed, frameBound, frameActual⟩ := frame_runs program tree origin origin frameTicks false frameRun
  obtain ⟨segmentUsed, segmentBound, segmentActual⟩ := segment_runs program tree origin endpoint segmentTicks .completedLocal
    (by intro h; cases h) segmentRun
  refine ⟨frameUsed + 1 + segmentUsed + 1, ?_, ?_⟩
  · simpa only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using
      Nat.add_le_add_right (Nat.add_le_add frameBound segmentBound) 2
  · have firstTwo : run (machine program tree) (frameUsed + 1 + segmentUsed) (initial program tree origin) =
        ⟨some (.segment (.done .completedLocal)), endpoint⟩ := by
      rw [run_add, frameActual]
      exact segmentActual
    rw [run_add, firstTwo]
    rfl

theorem stopped (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin endpoint : Cursor) (frameTicks segmentTicks : Nat)
    (frameRun : run RootResetNestedFrameProbe.machine frameTicks (RootResetNestedFrameProbe.initial origin) =
      ⟨some (.done false), origin⟩)
    (segmentRun : run (Segment.machine program tree) segmentTicks (Segment.initial program tree origin) =
      ⟨some (.done .stopped), endpoint⟩) :
    ∃ ticks, ticks ≤ frameTicks + segmentTicks + 2 ∧
      run (machine program tree) ticks (initial program tree origin) = ⟨some (.done false), endpoint⟩ := by
  obtain ⟨frameUsed, frameBound, frameActual⟩ := frame_runs program tree origin origin frameTicks false frameRun
  obtain ⟨segmentUsed, segmentBound, segmentActual⟩ := segment_runs program tree origin endpoint segmentTicks .stopped
    (by intro h; cases h) segmentRun
  refine ⟨frameUsed + 1 + segmentUsed + 1, ?_, ?_⟩
  · simpa only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using
      Nat.add_le_add_right (Nat.add_le_add frameBound segmentBound) 2
  · have firstTwo : run (machine program tree) (frameUsed + 1 + segmentUsed) (initial program tree origin) =
        ⟨some (.segment (.done .stopped)), endpoint⟩ := by
      rw [run_add, frameActual]
      exact segmentActual
    rw [run_add, firstTwo]
    rfl

theorem terminal_unique (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin first last : Cursor) (firstTicks lastTicks : Nat) (firstReady lastReady : Bool)
    (firstRun : run (machine program tree) firstTicks (initial program tree origin) = ⟨some (.done firstReady), first⟩)
    (lastRun : run (machine program tree) lastTicks (initial program tree origin) = ⟨some (.done lastReady), last⟩) :
    firstReady = lastReady ∧ first = last := by
  have leftRun : run (machine program tree) (firstTicks + lastTicks) (initial program tree origin) = ⟨some (.done firstReady), first⟩ := by
    rw [run_add, firstRun, done_absorbs]
  have rightRun : run (machine program tree) (firstTicks + lastTicks) (initial program tree origin) = ⟨some (.done lastReady), last⟩ := by
    rw [Nat.add_comm, run_add, lastRun, done_absorbs]
  have equal := leftRun.symm.trans rightRun
  have controlEq := congrArg Configuration.control equal
  have cursorEq := congrArg Configuration.cursor equal
  exact ⟨Control.done.inj (Option.some.inj controlEq), cursorEq⟩

theorem bounded_terminal (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin endpoint : Cursor) (boundary : RootResetNestedFramePatterns.rightParent? origin = false)
    (ticks : Nat) (ready : Bool)
    (execution : run (machine program tree) ticks (initial program tree origin) = ⟨some (.done ready), endpoint⟩) :
    ∃ used, used ≤ coefficient program tree * origin.focus.size ∧
      run (machine program tree) used (initial program tree origin) = ⟨some (.done ready), endpoint⟩ := by
  obtain ⟨used, foundReady, found, bounded, actual, trace, facts⟩ := scan_within program tree origin boundary
  obtain ⟨readyEq, cursorEq⟩ := terminal_unique program tree origin found endpoint used ticks foundReady ready actual execution
  rw [readyEq, cursorEq] at actual
  exact ⟨used, bounded, actual⟩

end PureSFormal.Research.RootResetActiveFrameAgreement
