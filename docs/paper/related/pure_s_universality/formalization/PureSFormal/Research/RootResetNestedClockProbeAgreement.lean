import PureSFormal.Research.RootResetNestedClockProbe

/-! Exact generated CLOCK choices by the complete nested finite parity probe. -/
namespace PureSFormal.Research.RootResetNestedClockProbeAgreement
open PureSFormal.PureS
open FiniteController SchedulerInvariant
open RootResetNestedClockProbe
open RootResetClockParityWalker (parity)

theorem first_head_miss (origin : Cursor) (notRedex : origin.rdx?.isSome = false) :
    ∃ ticks, ticks ≤ RootResetNestedClockFirstPass.coefficient * origin.focus.size ∧
      run RootResetNestedClockFirstPass.machine ticks (RootResetNestedClockFirstPass.initial origin) =
        ⟨some (.done .headMiss), origin⟩ := by
  obtain ⟨ticks, result, bounded, execution, facts⟩ := RootResetNestedClockFirstPass.all_input origin
  cases result with
  | headMiss => exact ⟨ticks, bounded, execution⟩
  | parsed ready bit => rw [notRedex] at facts; cases facts

theorem generated_growth (stage wrappers residual : Nat) (environment : Term) (parents : List ParentFrame) :
    let source := Term.app (clockGrowthCore stage wrappers residual) environment
    ∃ ticks, ticks ≤ coefficient * source.size ∧
      run machine ticks (initial ⟨source, parents⟩) =
        ⟨some (.done true), ⟨.app (C residual) (C stage),
          RootResetClockGrowthWalker.clockParents stage wrappers (.left environment :: parents)⟩⟩ := by
  dsimp only
  let source := Term.app (clockGrowthCore stage wrappers residual) environment
  let origin : Cursor := ⟨source, parents⟩
  let endpoint : Cursor := ⟨.app (C residual) (C stage),
    RootResetClockGrowthWalker.clockParents stage wrappers (.left environment :: parents)⟩
  obtain ⟨growthTicks, growthBound, growthRun⟩ := RootResetNestedClockGrowthAgreement.generated stage wrappers residual environment parents
  obtain ⟨growthUsed, growthUsedBound, growthActual⟩ := growth_runs origin endpoint growthTicks true growthRun
  have paidGrowth := Nat.le_trans growthUsedBound growthBound
  cases wrappers with
  | zero =>
      have notRedex : origin.rdx?.isSome = false := by cases residual <;> rfl
      obtain ⟨firstTicks, firstBound, firstRun⟩ := first_head_miss origin notRedex
      obtain ⟨firstUsed, firstUsedBound, firstActual⟩ := first_runs origin firstTicks .headMiss firstRun
      refine ⟨firstUsed + 1 + (growthUsed + 1), ?_, ?_⟩
      · simpa only [Nat.add_zero, Nat.zero_add, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using
          phase_bound source firstUsed 0 growthUsed 2 (by decide) (Nat.le_trans firstUsedBound firstBound)
            (Nat.zero_le _) paidGrowth
      · rw [run_add, firstActual]
        exact growthActual
  | succ wrappers =>
      obtain ⟨firstTicks, firstBound, firstRun⟩ := RootResetNestedClockFirstPass.generated stage
        (clockWrap stage wrappers (.app (C residual) (C stage))) environment parents
      rw [RootResetClockParityWalker.xor_false] at firstRun
      obtain ⟨firstUsed, firstUsedBound, firstActual⟩ := first_runs origin firstTicks (.parsed true (parity stage)) firstRun
      obtain ⟨secondTicks, secondBound, secondRun⟩ := RootResetNestedClockSecondPass.generated (parity stage)
        stage (wrappers + 1) residual stage environment parents
      rw [RootResetClockParityWalker.xor_self] at secondRun
      obtain ⟨secondUsed, secondUsedBound, secondActual⟩ := second_runs (parity stage) origin secondTicks true false secondRun
      refine ⟨firstUsed + 1 + (secondUsed + 1) + (growthUsed + 1),
        combined_bound source firstUsed secondUsed growthUsed (Nat.le_trans firstUsedBound firstBound)
          (Nat.le_trans secondUsedBound secondBound) paidGrowth, ?_⟩
      have firstTwo : run machine (firstUsed + 1 + (secondUsed + 1)) (initial origin) = growth origin := by
        rw [run_add, firstActual]
        exact secondActual
      rw [run_add, firstTwo]
      exact growthActual

theorem generated_launch (stage wrappers : Nat) (environment : Term) (parents : List ParentFrame) :
    let source := Term.app (clockWrappers stage (wrappers + 1)) environment
    ∃ ticks, ticks ≤ coefficient * source.size ∧
      run machine ticks (initial ⟨source, parents⟩) = ⟨some (.done true), ⟨source, parents⟩⟩ := by
  dsimp only
  let source := Term.app (clockWrappers stage (wrappers + 1)) environment
  let origin : Cursor := ⟨source, parents⟩
  obtain ⟨firstTicks, firstBound, firstRun⟩ := RootResetNestedClockFirstPass.generated stage
    (clockWrappers stage wrappers) environment parents
  rw [RootResetClockParityWalker.xor_false] at firstRun
  obtain ⟨firstUsed, firstUsedBound, firstActual⟩ := first_runs origin firstTicks (.parsed true (parity stage)) firstRun
  obtain ⟨secondTicks, secondBound, secondRun⟩ := RootResetNestedClockSecondPass.generated (parity stage)
    stage (wrappers + 1) (stage + 1) (stage + 1) environment parents
  rw [parity, RootResetClockParityWalker.xor_complement] at secondRun
  have sourceEq : source = .app (clockWrap stage (wrappers + 1) (.app (C (stage + 1)) (C (stage + 1)))) environment := by
    dsimp only [source]
    rw [RootResetClockParityWalker.clockWrappers_eq_clockWrap]
    rfl
  rw [← sourceEq] at secondRun secondBound
  obtain ⟨secondUsed, secondUsedBound, secondActual⟩ := second_runs (parity stage) origin secondTicks true true secondRun
  refine ⟨firstUsed + 1 + (secondUsed + 1), ?_, ?_⟩
  · simpa only [Nat.add_zero, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using
      phase_bound source firstUsed secondUsed 0 2 (by decide) (Nat.le_trans firstUsedBound firstBound)
        (Nat.le_trans secondUsedBound secondBound) (Nat.zero_le _)
  · rw [run_add, firstActual]
    exact secondActual

theorem generated_zero_contracts (stage wrappers : Nat) (environment : Term) (parents : List ParentFrame) :
    ∃ ticks, ticks ≤ coefficient * (Term.app (clockGrowthCore stage wrappers 0) environment).size ∧
      (run machine ticks (initial ⟨.app (clockGrowthCore stage wrappers 0) environment, parents⟩)).cursor.rdx? =
        some ⟨clockBase stage, RootResetClockGrowthWalker.clockParents stage wrappers (.left environment :: parents)⟩ := by
  obtain ⟨ticks, bounded, execution⟩ := generated_growth stage wrappers 0 environment parents
  exact ⟨ticks, bounded, by rw [execution]; rfl⟩

theorem generated_positive_contracts (stage wrappers residual : Nat) (environment : Term) (parents : List ParentFrame) :
    ∃ ticks, ticks ≤ coefficient * (Term.app (clockGrowthCore stage wrappers (residual + 1)) environment).size ∧
      (run machine ticks (initial ⟨.app (clockGrowthCore stage wrappers (residual + 1)) environment, parents⟩)).cursor.rdx? =
        some ⟨.app (.app .s (C stage)) (.app (C residual) (C stage)),
          RootResetClockGrowthWalker.clockParents stage wrappers (.left environment :: parents)⟩ := by
  obtain ⟨ticks, bounded, execution⟩ := generated_growth stage wrappers (residual + 1) environment parents
  exact ⟨ticks, bounded, by rw [execution]; rfl⟩

theorem generated_launch_contracts (stage wrappers : Nat) (environment : Term) (parents : List ParentFrame) :
    ∃ ticks, ticks ≤ coefficient * (Term.app (clockWrappers stage (wrappers + 1)) environment).size ∧
      (run machine ticks (initial ⟨.app (clockWrappers stage (wrappers + 1)) environment, parents⟩)).cursor.rdx? =
        some ⟨.app (.app (C stage) environment) (.app (clockWrappers stage wrappers) environment), parents⟩ := by
  obtain ⟨ticks, bounded, execution⟩ := generated_launch stage wrappers environment parents
  exact ⟨ticks, bounded, by rw [execution]; rfl⟩

end PureSFormal.Research.RootResetNestedClockProbeAgreement
