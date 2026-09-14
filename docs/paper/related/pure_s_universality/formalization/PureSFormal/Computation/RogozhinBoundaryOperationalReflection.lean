import PureSFormal.Computation.RogozhinFirstSweepExclusion
import PureSFormal.Computation.RogozhinMiddleSweepExclusion

/-!
# Operational reflection of seed-checked Rogozhin boundaries

Positive first-sweep prefixes fail the literal boundary conditions. The
middle sweeps fail the data-head condition until the exact returned boundary;
the halting macro remains at its non-data endpoint. These exclusions make
every accepted nonempty word on the actual machine run a reachable tag word.
-/

namespace PureSFormal.Computation.RogozhinBoundaryOperationalReflection

open Rogozhin46 RogozhinTagInput RogozhinT2Simulation CookSeedReadbackContext
open RogozhinFirstSweepExclusion RogozhinMiddleSweepExclusion

theorem not_local_of_notDataHead {configuration : Config}
    (excluded : NotDataHead configuration) : ¬ LocalBoundary configuration := by
  rcases excluded with state | current
  · exact not_local_of_state state
  · exact not_local_of_current current

theorem splice_exclusion {firstTime secondTime : Nat} {start middle : Config}
    (endpoint : Rogozhin46.iterate firstTime start = middle)
    (first : ∀ time, 0 < time → time ≤ firstTime → ¬ LocalBoundary (Rogozhin46.iterate time start))
    (second : PrefixExcluded secondTime middle)
    (time : Nat) (positive : 0 < time) (before : time < secondTime + firstTime) :
    ¬ LocalBoundary (Rogozhin46.iterate time start) := by
  by_cases early : time ≤ firstTime
  · exact first time positive early
  · have reached : firstTime ≤ time := Nat.le_of_lt (Nat.lt_of_not_ge early)
    have remainderBefore : time - firstTime < secondTime := by
      apply Nat.lt_of_add_lt_add_right (n := firstTime)
      rw [Nat.sub_add_cancel reached]
      exact before
    have timeEq : time = (time - firstTime) + firstTime := (Nat.sub_add_cancel reached).symm
    rw [timeEq, Rogozhin46.iterate_add, endpoint]
    exact not_local_of_notDataHead (second _ remainderBefore)

theorem firstSweep_endpoint (program : Program) (isT2 : IsT2 program)
    (padding : Nat) (first second : Label) (rest : List Label)
    (valid : first ≤ symbolCount program) :
    Rogozhin46.iterate (firstSweepFuel [] (paddedProgramGaps program first padding))
      (compileWithPadding program padding (first :: second :: rest)) =
      ⟨.A, .s5, List.replicate (weight program first + padding) .s4 ++
        markedNear (programGaps program first) ++ (upperProgramCode program first).reverse,
        followingData program second rest⟩ := by
  simpa [List.replicate_append_replicate, List.append_assoc] using
    iterate_compileWithPadding_firstSweep program isT2 padding first second rest valid

theorem nonhalting_macro_interior_not_local (program : Program) (isT2 : IsT2 program)
    (padding : Nat) (first second : Label) (rest : List Label)
    (valid : first < symbolCount program) (time : Nat) (positive : 0 < time)
    (before : time < nonhaltingMacroFuel program padding first second rest) :
    ¬ LocalBoundary (Rogozhin46.iterate time (compileWithPadding program padding (first :: second :: rest))) := by
  apply splice_exclusion (firstSweep_endpoint program isT2 padding first second rest (Nat.le_of_lt valid))
    (compiled_firstSweep_positive_not_local program isT2 padding first second rest (Nat.le_of_lt valid))
    (nonhalting_middle_prefix program isT2 (weight program first + padding) first second rest valid)
    time positive
  simpa only [nonhaltingMacroFuel, Nat.add_assoc] using before

theorem halting_macro_positive_not_local (program : Program) (isT2 : IsT2 program)
    (padding : Nat) (second : Label) (rest : List Label)
    (time : Nat) (positive : 0 < time) :
    ¬ LocalBoundary (Rogozhin46.iterate time
      (compileWithPadding program padding (haltLabel program :: second :: rest))) := by
  by_cases before : time < haltMacroFuel program padding second rest
  · apply splice_exclusion (firstSweep_endpoint program isT2 padding (haltLabel program) second rest (Nat.le_refl _))
      (compiled_firstSweep_positive_not_local program isT2 padding (haltLabel program) second rest (Nat.le_refl _))
      (halting_middle_prefix program isT2 (weight program (haltLabel program) + padding) second rest)
      time positive
    simpa only [haltMacroFuel, haltPrefixFuel, Nat.add_assoc] using before
  · have reached : haltMacroFuel program padding second rest ≤ time := Nat.le_of_not_gt before
    have timeEq : time = (time - haltMacroFuel program padding second rest) +
        haltMacroFuel program padding second rest := (Nat.sub_add_cancel reached).symm
    rw [timeEq, Rogozhin46.iterate_add, iterate_compileWithPadding_halt program isT2,
      Rogozhin46.iterate_of_halted (haltEndpoint_halted program padding second rest)]
    exact not_local_of_notDataHead
      (halted_notDataHead _ (haltEndpoint_halted program padding second rest))

theorem tag_iterate_step (program : Program) (steps : Nat) (word : List Label) :
    RogozhinTagInput.iterate program (steps + 1) word =
      RogozhinTagInput.iterate program steps (RogozhinTagInput.absorbingStep program word) := by
  induction steps with
  | zero => rfl
  | succ steps ih => exact congrArg (RogozhinTagInput.absorbingStep program) ih

theorem decodeBoundary?_actual_nonempty_reflects (time : Nat)
    (program : Program) (word : List Label) (wellFormed : WellFormed program word)
    (padding : Nat) (decoded : List Label) (nonempty : decoded ≠ [])
    (accepted : (contextOf program).decodeBoundary?
      (Rogozhin46.iterate time (compileWithPadding program padding word)) = some decoded) :
    ∃ tagSteps, decoded = RogozhinTagInput.iterate program tagSteps word := by
  induction time using Nat.strongRecOn generalizing word padding with
  | ind time ih =>
      by_cases zero : time = 0
      · subst time
        rw [Rogozhin46.iterate_zero, contextOf_decodeBoundary? program wellFormed.isT2 _ _ wellFormed.labels] at accepted
        exact ⟨0, (Option.some.inj accepted).symm⟩
      · have positive : 0 < time := Nat.pos_of_ne_zero zero
        obtain ⟨first, second, rest, wordEq⟩ := exists_two_prefix wellFormed.lengthTwo
        subst word
        have localShape := decoded_nonempty_local wellFormed.isT2 nonempty accepted
        by_cases halting : first = haltLabel program
        · subst first
          exact (halting_macro_positive_not_local program wellFormed.isT2 padding second rest time positive localShape).elim
        · have valid : first < symbolCount program :=
            Nat.lt_of_le_of_ne (wellFormed.labels first (List.Mem.head _)) halting
          let macroTime := nonhaltingMacroFuel program padding first second rest
          by_cases before : time < macroTime
          · exact (nonhalting_macro_interior_not_local program wellFormed.isT2 padding first second rest valid
              time positive before localShape).elim
          · have reached : macroTime ≤ time := Nat.le_of_not_gt before
            have remainderLt : time - macroTime < time :=
              Nat.sub_lt positive (nonhaltingMacroFuel_positive program padding first second rest)
            let nextWord := rest ++ productionAt program first
            let nextPadding := weight program first + padding + 1 + weight program second + 1
            have nextWellFormed : WellFormed program nextWord := wellFormed.step halting
            have timeEq : time = (time - macroTime) + macroTime := (Nat.sub_add_cancel reached).symm
            have runEq : Rogozhin46.iterate time
                (compileWithPadding program padding (first :: second :: rest)) =
                Rogozhin46.iterate (time - macroTime) (compileWithPadding program nextPadding nextWord) := by
              rw [timeEq, Rogozhin46.iterate_add]
              simp only [Nat.add_sub_cancel]
              exact congrArg (Rogozhin46.iterate (time - macroTime))
                (iterate_compileWithPadding_nonhaltingMacro program wellFormed.isT2 padding first second rest valid)
            rw [runEq] at accepted
            obtain ⟨tagSteps, reflected⟩ := ih _ remainderLt nextWord nextWellFormed nextPadding accepted
            refine ⟨tagSteps + 1, ?_⟩
            rw [tag_iterate_step, WellFormed.absorbingStep_eq halting]
            exact reflected

end PureSFormal.Computation.RogozhinBoundaryOperationalReflection
