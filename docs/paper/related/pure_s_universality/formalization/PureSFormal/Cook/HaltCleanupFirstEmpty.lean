import PureSFormal.Cook.HaltCleanup

/-!
# First-emptiness theorem for the halt cleanup

The exact endpoint theorem excludes an empty CTS
dataword at every earlier deletion-one horizon, including the complete
deletion-eight sweeps before residue `(D8)` is reached.
-/

namespace PureSFormal.Cook

namespace HaltCleanup

/-- A successful deletion-eight step has a full eight-symbol source block. -/
theorem source_length_ge_eight_of_tagStep
    {source target : List TagSymbol} (step : TagStep source target) :
    8 ≤ source.length := by
  by_cases short : source.length < 8
  · have none := (Macroperiod.tagStep?_eq_none_iff source).2 short
    rw [step] at none
    contradiction
  · exact Nat.le_of_not_gt short

namespace TagStepsN

/--
Before the endpoint of an enabled `n`-step tag trajectory, the compiled CTS
dataword is nonempty.  Inside each macroperiod the untouched suffix of the
eight encoded source symbols is the witness.
-/
theorem cts_data_ne_nil_before
    {steps : Nat} {source target : List TagSymbol}
    (trajectory : TagStepsN steps source target) :
    ∀ ticks, ticks < ctsPeriod * steps →
      (CTS.iterate rogozhinCookProgram ticks
        (CTS.initial rogozhinCookProgram (encodeWord source))).data ≠ [] := by
  induction trajectory with
  | zero word =>
      intro ticks impossible
      simp only [Nat.mul_zero] at impossible
      exact (Nat.not_lt_zero ticks impossible).elim
  | @succ source middle target steps first rest ih =>
      intro ticks beforeEnd
      by_cases insideFirst : ticks < ctsPeriod
      · apply iterate_data_ne_nil_before_input_length
        rw [encodeWord_length]
        have sourceLength := source_length_ge_eight_of_tagStep first
        have encodedLength : ctsPeriod ≤ alphabetSize * source.length := by
          simpa [ctsPeriod, alphabetSize] using
            Nat.mul_le_mul_left 114 sourceLength
        exact Nat.lt_of_lt_of_le insideFirst encodedLength
      · have firstPeriodLe : ctsPeriod ≤ ticks :=
          Nat.le_of_not_gt insideFirst
        obtain ⟨later, ticksEq⟩ := Nat.exists_eq_add_of_le firstPeriodLe
        have laterBefore : later < ctsPeriod * steps := by
          rw [ticksEq] at beforeEnd
          rw [Nat.mul_add, Nat.mul_one] at beforeEnd
          have aligned : ctsPeriod + later <
              ctsPeriod + ctsPeriod * steps := by
            simpa only [Nat.add_comm] using beforeEnd
          exact Nat.lt_of_add_lt_add_left aligned
        rw [ticksEq, Nat.add_comm, CTS.iterate_add,
          Macroperiod.macroperiod_of_some first]
        exact ih later laterBefore

end TagStepsN

/-- No CTS horizon before the full cleanup endpoint is empty. -/
theorem Certified.nonempty_before_fullCleanupHorizon
    (certificate : Certified) (ticks : Nat)
    (before : ticks < fullCleanupHorizon certificate) :
    (CTS.iterate rogozhinCookProgram ticks
      (CTS.initial rogozhinCookProgram
        (encodeWord certificate.word))).data ≠ [] := by
  let macroTicks := ctsPeriod * cleanupTagSteps certificate
  by_cases beforeResidue : ticks < macroTicks
  · exact (TagStepsN.certified_cleanup certificate).cts_data_ne_nil_before
      ticks beforeResidue
  · have residueLe : macroTicks ≤ ticks :=
      Nat.le_of_not_gt beforeResidue
    obtain ⟨residueTicks, ticksEq⟩ := Nat.exists_eq_add_of_le residueLe
    have residueBefore : residueTicks < 570 := by
      rw [ticksEq] at before
      have aligned : macroTicks + residueTicks < macroTicks + 570 := by
        simpa [macroTicks, fullCleanupHorizon, cleanupTagSteps, ctsPeriod]
          using before
      exact Nat.lt_of_add_lt_add_left aligned
    rw [ticksEq, Nat.add_comm, CTS.iterate_add,
      certified_reaches_residue certificate]
    exact residue_nonempty_before_570 certificate residueTicks residueBefore

/--
The endpoint is the first empty dataword: it includes all cleanup
sweeps and then the 570-step residue consumption.
-/
theorem Certified.first_empty_at_fullCleanupHorizon
    (certificate : Certified) :
    (CTS.iterate rogozhinCookProgram (fullCleanupHorizon certificate)
        (CTS.initial rogozhinCookProgram
          (encodeWord certificate.word))).data = [] ∧
      ∀ ticks, ticks < fullCleanupHorizon certificate →
        (CTS.iterate rogozhinCookProgram ticks
          (CTS.initial rogozhinCookProgram
            (encodeWord certificate.word))).data ≠ [] := by
  constructor
  · rw [certified_empties_at_full_horizon certificate]
  · exact certificate.nonempty_before_fullCleanupHorizon

/-- Exact absolute endpoint after a halting boundary at horizon `kappa`. -/
theorem Certified.empties_after_boundary
    (certificate : Certified)
    {initial : CTS.Config rogozhinCookProgram} {kappa : Nat}
    (atBoundary : CTS.iterate rogozhinCookProgram kappa initial =
      CTS.initial rogozhinCookProgram (encodeWord certificate.word)) :
    CTS.iterate rogozhinCookProgram
        (fullCleanupHorizon certificate + kappa) initial =
      ⟨residueEndPhase, []⟩ := by
  rw [CTS.iterate_add, atBoundary]
  exact certified_empties_at_full_horizon certificate

/-- Every relative cleanup time before the endpoint is nonempty. -/
theorem Certified.nonempty_after_boundary_before_fullCleanup
    (certificate : Certified)
    {initial : CTS.Config rogozhinCookProgram} {kappa : Nat}
    (atBoundary : CTS.iterate rogozhinCookProgram kappa initial =
      CTS.initial rogozhinCookProgram (encodeWord certificate.word))
    (relative : Nat) (before : relative < fullCleanupHorizon certificate) :
    (CTS.iterate rogozhinCookProgram (relative + kappa) initial).data ≠ [] := by
  rw [CTS.iterate_add, atBoundary]
  exact certificate.nonempty_before_fullCleanupHorizon relative before

end HaltCleanup

end PureSFormal.Cook
