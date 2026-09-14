import PureSFormal.Research.RootResetNestedFrameClockProbe
import PureSFormal.Research.RootResetNestedClockProbeAgreement

/-! Exact FRAME/CLOCK choices after the scoped priority composition. -/
namespace PureSFormal.Research.RootResetNestedFrameClockAgreement
open PureSFormal.PureS
open FiniteController SchedulerInvariant SchedulerResponseInvariant
open RootResetNestedFrameClockProbe
open RootResetFrameSpineWalker (Layer wrap spineParents)

theorem frame_selected (origin endpoint : Cursor) (ticks : Nat)
    (bounded : ticks ≤ RootResetNestedFrameProbe.coefficient * origin.focus.size)
    (execution : run Frame.machine ticks (Frame.initial origin) = ⟨some (.done true), endpoint⟩) :
    ∃ used, used ≤ coefficient * origin.focus.size ∧
      run machine used (initial origin) = ⟨some (.done true), endpoint⟩ := by
  obtain ⟨used, usedBound, actual⟩ := frame_runs origin endpoint ticks true execution
  refine ⟨used + 1, ?_, actual⟩
  simpa only [Nat.add_zero] using combined_bound origin.focus used 0 1 (by decide)
    (Nat.le_trans usedBound bounded) (Nat.zero_le _)

theorem clock_selected (origin endpoint : Cursor) (frameTicks clockTicks : Nat)
    (frameBound : frameTicks ≤ RootResetNestedFrameProbe.coefficient * origin.focus.size)
    (frameRun : run Frame.machine frameTicks (Frame.initial origin) = ⟨some (.done false), origin⟩)
    (clockBound : clockTicks ≤ RootResetNestedClockProbe.coefficient * origin.focus.size)
    (clockRun : run Clock.machine clockTicks (Clock.initial origin) = ⟨some (.done true), endpoint⟩) :
    ∃ used, used ≤ coefficient * origin.focus.size ∧
      run machine used (initial origin) = ⟨some (.done true), endpoint⟩ := by
  obtain ⟨frameUsed, frameUsedBound, frameActual⟩ := frame_runs origin origin frameTicks false frameRun
  obtain ⟨clockUsed, clockUsedBound, clockActual⟩ := clock_runs origin endpoint clockTicks true clockRun
  refine ⟨frameUsed + 1 + (clockUsed + 1), ?_, ?_⟩
  · simpa only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using
      combined_bound origin.focus frameUsed clockUsed 2 (Nat.le_refl _) (Nat.le_trans frameUsedBound frameBound)
        (Nat.le_trans clockUsedBound clockBound)
  · rw [run_add, frameActual]
    exact clockActual

theorem generated_first (layers : List Layer) (actions : Term) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    ∃ ticks, ticks ≤ coefficient * (wrap layers (frameFirstRoot actions bits continuation carrier)).size ∧
      run machine ticks (initial ⟨wrap layers (frameFirstRoot actions bits continuation carrier), parents⟩) =
        ⟨some (.done true), RootResetNestedFrameAgreement.firstCursor actions bits carrier continuation (spineParents layers parents)⟩ := by
  obtain ⟨ticks, bounded, execution⟩ := RootResetNestedFrameAgreement.generated_first layers actions bits continuation carrier parents
  exact frame_selected _ _ ticks bounded execution

theorem generated_second (layers : List Layer) (actions : Term) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    ∃ ticks, ticks ≤ coefficient * (wrap layers (frameSecondRoot actions bits continuation carrier)).size ∧
      run machine ticks (initial ⟨wrap layers (frameSecondRoot actions bits continuation carrier), parents⟩) =
        ⟨some (.done true), RootResetNestedFrameAgreement.secondCursor actions carrier bits continuation (spineParents layers parents)⟩ := by
  obtain ⟨ticks, bounded, execution⟩ := RootResetNestedFrameAgreement.generated_second layers actions bits continuation carrier parents
  exact frame_selected _ _ ticks bounded execution

theorem frame_misses_growth (stage wrappers residual : Nat) (environment : Term) (parents : List ParentFrame)
    (environmentStops : RootResetEdgeFragment.select RootResetNestedFramePatterns.pendingRows environment = none)
    (environmentGuard : RootResetFrameCarrierGuard.frameHeadGuard environment = false)
    (boundary : RootResetNestedFramePatterns.rightParent? ⟨.app (clockGrowthCore stage wrappers residual) environment, parents⟩ = false) :
    ∃ ticks, ticks ≤ RootResetNestedFrameProbe.coefficient * (Term.app (clockGrowthCore stage wrappers residual) environment).size ∧
      run Frame.machine ticks (Frame.initial ⟨.app (clockGrowthCore stage wrappers residual) environment, parents⟩) =
        ⟨some (.done false), ⟨.app (clockGrowthCore stage wrappers residual) environment, parents⟩⟩ := by
  cases wrappers with
  | zero =>
      exact RootResetNestedFrameAgreement.missed [] _ parents
        (by cases residual <;> rfl) (by cases residual <;> rfl) boundary
  | succ wrappers =>
      exact RootResetNestedFrameAgreement.missed [(C stage, clockGrowthCore stage wrappers residual)] environment parents
        environmentStops environmentGuard boundary

theorem frame_misses_launch (stage wrappers : Nat) (environment : Term) (parents : List ParentFrame)
    (environmentStops : RootResetEdgeFragment.select RootResetNestedFramePatterns.pendingRows environment = none)
    (environmentGuard : RootResetFrameCarrierGuard.frameHeadGuard environment = false)
    (boundary : RootResetNestedFramePatterns.rightParent? ⟨.app (clockWrappers stage (wrappers + 1)) environment, parents⟩ = false) :
    ∃ ticks, ticks ≤ RootResetNestedFrameProbe.coefficient * (Term.app (clockWrappers stage (wrappers + 1)) environment).size ∧
      run Frame.machine ticks (Frame.initial ⟨.app (clockWrappers stage (wrappers + 1)) environment, parents⟩) =
        ⟨some (.done false), ⟨.app (clockWrappers stage (wrappers + 1)) environment, parents⟩⟩ :=
  RootResetNestedFrameAgreement.missed [(C stage, clockWrappers stage wrappers)] environment parents
    environmentStops environmentGuard boundary

theorem generated_growth (stage wrappers residual : Nat) (environment : Term) (parents : List ParentFrame)
    (environmentStops : RootResetEdgeFragment.select RootResetNestedFramePatterns.pendingRows environment = none)
    (environmentGuard : RootResetFrameCarrierGuard.frameHeadGuard environment = false)
    (boundary : RootResetNestedFramePatterns.rightParent? ⟨.app (clockGrowthCore stage wrappers residual) environment, parents⟩ = false) :
    ∃ ticks, ticks ≤ coefficient * (Term.app (clockGrowthCore stage wrappers residual) environment).size ∧
      run machine ticks (initial ⟨.app (clockGrowthCore stage wrappers residual) environment, parents⟩) =
        ⟨some (.done true), ⟨.app (C residual) (C stage),
          RootResetClockGrowthWalker.clockParents stage wrappers (.left environment :: parents)⟩⟩ := by
  obtain ⟨frameTicks, frameBound, frameRun⟩ := frame_misses_growth stage wrappers residual environment parents environmentStops environmentGuard boundary
  obtain ⟨clockTicks, clockBound, clockRun⟩ := RootResetNestedClockProbeAgreement.generated_growth stage wrappers residual environment parents
  exact clock_selected _ _ frameTicks clockTicks frameBound frameRun clockBound clockRun

theorem generated_launch (stage wrappers : Nat) (environment : Term) (parents : List ParentFrame)
    (environmentStops : RootResetEdgeFragment.select RootResetNestedFramePatterns.pendingRows environment = none)
    (environmentGuard : RootResetFrameCarrierGuard.frameHeadGuard environment = false)
    (boundary : RootResetNestedFramePatterns.rightParent? ⟨.app (clockWrappers stage (wrappers + 1)) environment, parents⟩ = false) :
    ∃ ticks, ticks ≤ coefficient * (Term.app (clockWrappers stage (wrappers + 1)) environment).size ∧
      run machine ticks (initial ⟨.app (clockWrappers stage (wrappers + 1)) environment, parents⟩) =
        ⟨some (.done true), ⟨.app (clockWrappers stage (wrappers + 1)) environment, parents⟩⟩ := by
  obtain ⟨frameTicks, frameBound, frameRun⟩ := frame_misses_launch stage wrappers environment parents environmentStops environmentGuard boundary
  obtain ⟨clockTicks, clockBound, clockRun⟩ := RootResetNestedClockProbeAgreement.generated_launch stage wrappers environment parents
  exact clock_selected _ _ frameTicks clockTicks frameBound frameRun clockBound clockRun

end PureSFormal.Research.RootResetNestedFrameClockAgreement
