import PureSFormal.Cook.HaltCleanup

/-!
# Deterministic deletion-eight trajectories

This module supplies the generic operational facts used by the Cook pass
proof.  The partial relation `TagStepsN` and the executable absorbing runner
are connected without selecting witnesses or appealing to an external trace.
-/

namespace PureSFormal.Cook

namespace TagTrajectory

/-- Execute exactly `steps` totalized deletion-eight transitions. -/
def run : Nat → List TagSymbol → List TagSymbol
  | 0, word => word
  | steps + 1, word => run steps (Macroperiod.tagStep word)

@[simp]
theorem run_zero (word : List TagSymbol) : run 0 word = word :=
  rfl

@[simp]
theorem run_succ (steps : Nat) (word : List TagSymbol) :
    run (steps + 1) word = run steps (Macroperiod.tagStep word) :=
  rfl

/-- A successful partial step is the same executable total step. -/
theorem tagStep_eq_of_tagStep?_eq_some
    {source target : List TagSymbol}
    (hstep : Macroperiod.tagStep? source = some target) :
    Macroperiod.tagStep source = target := by
  simp [Macroperiod.tagStep, hstep]

/-- A completed word is a fixed point of the executable runner. -/
theorem run_of_short
    {word : List TagSymbol} (hshort : word.length < 8) :
    ∀ steps, run steps word = word := by
  intro steps
  induction steps with
  | zero => rfl
  | succ steps ih =>
      rw [run_succ, Macroperiod.tagStep_eq_self_of_short hshort, ih]

/-- Every exactly counted partial trajectory has the executable endpoint. -/
theorem eq_run_of_steps
    {steps : Nat} {source target : List TagSymbol}
    (trace : HaltCleanup.TagStepsN steps source target) :
    target = run steps source := by
  induction trace with
  | zero word => rfl
  | @succ source middle target steps first rest ih =>
      rw [run_succ, tagStep_eq_of_tagStep?_eq_some first]
      exact ih

/-- Determinism at a fixed source and exact step count. -/
theorem steps_deterministic
    {steps : Nat} {source first second : List TagSymbol}
    (hfirst : HaltCleanup.TagStepsN steps source first)
    (hsecond : HaltCleanup.TagStepsN steps source second) :
    first = second := by
  rw [eq_run_of_steps hfirst, eq_run_of_steps hsecond]

/-- Every shorter exact prefix of an enabled trajectory exists. -/
theorem exists_steps_prefix
    {shorter total : Nat} {source target : List TagSymbol}
    (hle : shorter ≤ total)
    (trace : HaltCleanup.TagStepsN total source target) :
    ∃ middle, HaltCleanup.TagStepsN shorter source middle := by
  induction shorter generalizing total source target with
  | zero => exact ⟨source, .zero source⟩
  | succ n ih =>
      cases total with
      | zero =>
          exact (Nat.not_succ_le_zero n hle).elim
      | succ total =>
          cases trace with
          | succ first rest =>
              have hleRest : n ≤ total :=
                Nat.succ_le_succ_iff.mp hle
              obtain ⟨middle, prefixTrace⟩ := ih hleRest rest
              exact ⟨middle, .succ first prefixTrace⟩

/-- The endpoint of every enabled prefix is its executable run value. -/
theorem run_prefix_of_steps
    {shorter total : Nat} {source target : List TagSymbol}
    (hle : shorter ≤ total)
    (trace : HaltCleanup.TagStepsN total source target) :
    HaltCleanup.TagStepsN shorter source (run shorter source) := by
  obtain ⟨middle, prefixTrace⟩ := exists_steps_prefix hle trace
  have endpoint := eq_run_of_steps prefixTrace
  rw [← endpoint]
  exact prefixTrace

/-- Executing a prefix and then a suffix is additive. -/
theorem run_add (later earlier : Nat) (word : List TagSymbol) :
    run (later + earlier) word = run later (run earlier word) := by
  induction earlier generalizing word with
  | zero => rfl
  | succ earlier ih =>
      rw [show later + (earlier + 1) = (later + earlier) + 1 by
        exact (Nat.add_assoc later earlier 1).symm]
      simp only [run_succ]
      exact ih (Macroperiod.tagStep word)

/-- A partial trajectory cannot be extended from a completed word. -/
theorem no_positive_steps_of_short
    {steps : Nat} {source target : List TagSymbol}
    (hshort : source.length < 8)
    (hpositive : 0 < steps)
    (trace : HaltCleanup.TagStepsN steps source target) : False := by
  cases steps with
  | zero => exact (Nat.lt_irrefl 0 hpositive).elim
  | succ steps =>
      cases trace with
      | succ first rest =>
          have hnone := (Macroperiod.tagStep?_eq_none_iff source).2 hshort
          rw [first] at hnone
          contradiction

end TagTrajectory

end PureSFormal.Cook
