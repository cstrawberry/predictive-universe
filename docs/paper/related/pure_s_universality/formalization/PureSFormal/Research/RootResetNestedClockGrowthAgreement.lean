import PureSFormal.Research.RootResetNestedClockGrowthProbe

/-! The nested finite growth probe selects the literal generated CLOCK occurrence. -/
namespace PureSFormal.Research.RootResetNestedClockGrowthAgreement
open PureSFormal.PureS
open FiniteController SchedulerInvariant
open RootResetNestedClockPatterns

theorem pair_stops (residual stage : Nat) :
    RootResetEdgeFragment.select pendingRows (.app (C residual) (C stage)) = none := by
  cases residual <;> rfl

theorem pair_head (residual stage : Nat) :
    RootResetEdgeFragment.select headRows (.app (C residual) (C stage)) = some headRow := by
  cases residual <;> rfl

theorem clock_descent (stage wrappers residual : Nat) (parents : List ParentFrame) :
    ∃ ticks member,
      ticks ≤ RootResetEdgeSpine.coefficient pendingRows * (clockGrowthCore stage wrappers residual).size ∧
      run (RootResetEdgeSpine.machine pendingRows) ticks
        (RootResetEdgeSpine.initial pendingRows ⟨clockGrowthCore stage wrappers residual, parents⟩) =
        ⟨some ⟨.answer false, member⟩,
          ⟨.app (C residual) (C stage), RootResetClockGrowthWalker.clockParents stage wrappers parents⟩⟩ := by
  induction wrappers generalizing parents with
  | zero =>
      obtain ⟨member, execution⟩ := RootResetEdgeSpine.missed_runs pendingRows
        ⟨.app (C residual) (C stage), parents⟩ (pair_stops residual stage)
      exact ⟨_, member, RootResetEdgeSpine.missed_bound pendingRows _, execution⟩
  | succ wrappers ih =>
      let source := clockGrowthCore stage (wrappers + 1) residual
      let after : Cursor := ⟨clockGrowthCore stage wrappers residual, .right (.app .s (C stage)) :: parents⟩
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

theorem core_generated (stage wrappers residual : Nat) (parents : List ParentFrame) :
    ∃ ticks,
      ticks ≤ RootResetNestedClockCoreProbe.coefficient * (clockGrowthCore stage wrappers residual).size ∧
      run RootResetNestedClockCoreProbe.machine ticks
        (RootResetNestedClockCoreProbe.initial ⟨clockGrowthCore stage wrappers residual, parents⟩) =
        ⟨some (.done true),
          ⟨.app (C residual) (C stage), RootResetClockGrowthWalker.clockParents stage wrappers parents⟩⟩ := by
  let start : Cursor := ⟨clockGrowthCore stage wrappers residual, parents⟩
  let endpoint : Cursor := ⟨.app (C residual) (C stage), RootResetClockGrowthWalker.clockParents stage wrappers parents⟩
  obtain ⟨downTicks, member, bounded, execution⟩ := clock_descent stage wrappers residual parents
  obtain ⟨downUsed, downBound, downRun⟩ := RootResetNestedClockCoreProbe.descending_runs start endpoint
    downTicks member execution
  obtain ⟨readMember, readRun⟩ := RootResetEdgeFragment.selected_runs headRows endpoint endpoint headRow
    (pair_head residual stage) rfl
  obtain ⟨readUsed, readBound, readActual⟩ := RootResetNestedClockCoreProbe.reading_runs endpoint endpoint _ true readMember readRun
  refine ⟨downUsed + 1 + (readUsed + 1), ?_, ?_⟩
  · exact Nat.le_trans (Nat.le_add_right _ 1)
      (RootResetNestedClockCoreProbe.combined_bound start.focus downUsed readUsed 0
        (Nat.le_trans downBound bounded)
        (Nat.le_trans readBound (RootResetEdgeFragment.ticks_bound _ _)) (Nat.zero_le _))
  · rw [run_add, downRun]
    exact readActual

theorem generated (stage wrappers residual : Nat) (environment : Term) (parents : List ParentFrame) :
    ∃ ticks,
      ticks ≤ RootResetNestedClockGrowthProbe.coefficient * (Term.app (clockGrowthCore stage wrappers residual) environment).size ∧
      run RootResetNestedClockGrowthProbe.machine ticks
        (RootResetNestedClockGrowthProbe.initial ⟨.app (clockGrowthCore stage wrappers residual) environment, parents⟩) =
        ⟨some (.done true),
          ⟨.app (C residual) (C stage), RootResetClockGrowthWalker.clockParents stage wrappers (.left environment :: parents)⟩⟩ := by
  let core := clockGrowthCore stage wrappers residual
  let inside : Cursor := ⟨core, .left environment :: parents⟩
  let endpoint : Cursor := ⟨.app (C residual) (C stage),
    RootResetClockGrowthWalker.clockParents stage wrappers (.left environment :: parents)⟩
  obtain ⟨ticks, bounded, execution⟩ := core_generated stage wrappers residual (.left environment :: parents)
  obtain ⟨used, usedBound, actual⟩ := RootResetNestedClockGrowthProbe.core_runs inside endpoint ticks true execution
  refine ⟨1 + (used + 1), ?_, ?_⟩
  · have sourceSize : core.size ≤ (Term.app core environment).size := by
      change core.size ≤ core.size + environment.size + 1
      exact Nat.le_trans (Nat.le_add_right _ _) (Nat.le_succ _)
    have coreBound := Nat.le_trans (Nat.le_trans usedBound bounded)
      (Nat.mul_le_mul_left RootResetNestedClockCoreProbe.coefficient sourceSize)
    have constant : 2 ≤ 2 * (Term.app core environment).size := by
      simpa only [Nat.mul_one] using Nat.mul_le_mul_left 2 (Term.size_pos (Term.app core environment))
    simpa only [RootResetNestedClockGrowthProbe.coefficient, Nat.add_mul,
      Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using Nat.add_le_add coreBound constant
  · rw [run_add]
    change run RootResetNestedClockGrowthProbe.machine (used + 1) (RootResetNestedClockGrowthProbe.working inside) = _
    rw [run_add, actual]
    rfl

theorem generated_zero_contracts (stage wrappers : Nat) (environment : Term) (parents : List ParentFrame) :
    ∃ ticks,
      ticks ≤ RootResetNestedClockGrowthProbe.coefficient * (Term.app (clockGrowthCore stage wrappers 0) environment).size ∧
      (run RootResetNestedClockGrowthProbe.machine ticks
        (RootResetNestedClockGrowthProbe.initial ⟨.app (clockGrowthCore stage wrappers 0) environment, parents⟩)).cursor.rdx? =
        some ⟨clockBase stage, RootResetClockGrowthWalker.clockParents stage wrappers (.left environment :: parents)⟩ := by
  obtain ⟨ticks, bounded, execution⟩ := generated stage wrappers 0 environment parents
  exact ⟨ticks, bounded, by rw [execution]; rfl⟩

theorem generated_positive_contracts (stage wrappers residual : Nat) (environment : Term) (parents : List ParentFrame) :
    ∃ ticks,
      ticks ≤ RootResetNestedClockGrowthProbe.coefficient * (Term.app (clockGrowthCore stage wrappers (residual + 1)) environment).size ∧
      (run RootResetNestedClockGrowthProbe.machine ticks
        (RootResetNestedClockGrowthProbe.initial ⟨.app (clockGrowthCore stage wrappers (residual + 1)) environment, parents⟩)).cursor.rdx? =
        some ⟨.app (.app .s (C stage)) (.app (C residual) (C stage)),
          RootResetClockGrowthWalker.clockParents stage wrappers (.left environment :: parents)⟩ := by
  obtain ⟨ticks, bounded, execution⟩ := generated stage wrappers (residual + 1) environment parents
  exact ⟨ticks, bounded, by rw [execution]; rfl⟩

theorem clock_pair_descent (stage wrappers leftNumber rightNumber : Nat) (parents : List ParentFrame) :
    ∃ ticks member,
      ticks ≤ RootResetEdgeSpine.coefficient pendingRows * (clockWrap stage wrappers (.app (C leftNumber) (C rightNumber))).size ∧
      run (RootResetEdgeSpine.machine pendingRows) ticks
        (RootResetEdgeSpine.initial pendingRows ⟨clockWrap stage wrappers (.app (C leftNumber) (C rightNumber)), parents⟩) =
        ⟨some ⟨.answer false, member⟩,
          ⟨.app (C leftNumber) (C rightNumber), RootResetClockGrowthWalker.clockParents stage wrappers parents⟩⟩ := by
  induction wrappers generalizing parents with
  | zero =>
      obtain ⟨member, execution⟩ := RootResetEdgeSpine.missed_runs pendingRows
        ⟨.app (C leftNumber) (C rightNumber), parents⟩ (pair_stops leftNumber rightNumber)
      exact ⟨_, member, RootResetEdgeSpine.missed_bound pendingRows _, execution⟩
  | succ wrappers ih =>
      let source := clockWrap stage (wrappers + 1) (.app (C leftNumber) (C rightNumber))
      let after : Cursor := ⟨clockWrap stage wrappers (.app (C leftNumber) (C rightNumber)), .right (.app .s (C stage)) :: parents⟩
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

theorem core_pair_generated (stage wrappers leftNumber rightNumber : Nat) (parents : List ParentFrame) :
    ∃ ticks,
      ticks ≤ RootResetNestedClockCoreProbe.coefficient * (clockWrap stage wrappers (.app (C leftNumber) (C rightNumber))).size ∧
      run RootResetNestedClockCoreProbe.machine ticks
        (RootResetNestedClockCoreProbe.initial ⟨clockWrap stage wrappers (.app (C leftNumber) (C rightNumber)), parents⟩) =
        ⟨some (.done true),
          ⟨.app (C leftNumber) (C rightNumber), RootResetClockGrowthWalker.clockParents stage wrappers parents⟩⟩ := by
  let start : Cursor := ⟨clockWrap stage wrappers (.app (C leftNumber) (C rightNumber)), parents⟩
  let endpoint : Cursor := ⟨.app (C leftNumber) (C rightNumber), RootResetClockGrowthWalker.clockParents stage wrappers parents⟩
  obtain ⟨downTicks, member, bounded, execution⟩ := clock_pair_descent stage wrappers leftNumber rightNumber parents
  obtain ⟨downUsed, downBound, downRun⟩ := RootResetNestedClockCoreProbe.descending_runs start endpoint
    downTicks member execution
  obtain ⟨readMember, readRun⟩ := RootResetEdgeFragment.selected_runs headRows endpoint endpoint headRow
    (pair_head leftNumber rightNumber) rfl
  obtain ⟨readUsed, readBound, readActual⟩ := RootResetNestedClockCoreProbe.reading_runs endpoint endpoint _ true readMember readRun
  refine ⟨downUsed + 1 + (readUsed + 1), ?_, ?_⟩
  · exact Nat.le_trans (Nat.le_add_right _ 1)
      (RootResetNestedClockCoreProbe.combined_bound start.focus downUsed readUsed 0
        (Nat.le_trans downBound bounded)
        (Nat.le_trans readBound (RootResetEdgeFragment.ticks_bound _ _)) (Nat.zero_le _))
  · rw [run_add, downRun]
    exact readActual

end PureSFormal.Research.RootResetNestedClockGrowthAgreement
