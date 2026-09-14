import PureSFormal.WeakPath.Interface

/-!
# Constructive checkpoint indices

Positive contraction gaps determine finite, strictly increasing checkpoint
indices by primitive recursion.  This small utility keeps the scheduler proof
free of minimization and choice.
-/

namespace PureSFormal.WeakPath

/-- Cumulative contraction index before gap number `horizon`. -/
def cumulativeTime (gap : Nat → Nat) : Nat → Nat
  | 0 => 0
  | horizon + 1 => cumulativeTime gap horizon + gap horizon

@[simp]
theorem cumulativeTime_zero (gap : Nat → Nat) : cumulativeTime gap 0 = 0 :=
  rfl

@[simp]
theorem cumulativeTime_succ (gap : Nat → Nat) (horizon : Nat) :
    cumulativeTime gap (horizon + 1) =
      cumulativeTime gap horizon + gap horizon :=
  rfl

/-- Every prefix time is at most every later prefix time. -/
theorem cumulativeTime_mono (gap : Nat → Nat) :
    ∀ {first second}, first ≤ second →
      cumulativeTime gap first ≤ cumulativeTime gap second := by
  intro first second hle
  obtain ⟨distance, hsecond⟩ := Nat.exists_eq_add_of_le hle
  subst second
  clear hle
  induction distance with
  | zero => simp
  | succ distance ih =>
      rw [show first + (distance + 1) = (first + distance) + 1 by
          exact (Nat.add_assoc first distance 1).symm,
        cumulativeTime_succ]
      exact Nat.le_trans ih (Nat.le_add_right _ _)

/-- Positive gaps make the cumulative checkpoint sequence strict. -/
theorem cumulativeTime_strictlyIncreasing
    (gap : Nat → Nat) (hpositive : ∀ horizon, 0 < gap horizon) :
    StrictlyIncreasing (cumulativeTime gap) := by
  intro first second hlt
  have hone : cumulativeTime gap first < cumulativeTime gap (first + 1) := by
    rw [cumulativeTime_succ]
    exact Nat.lt_add_of_pos_right (hpositive first)
  have hsucc : first + 1 ≤ second := Nat.add_one_le_iff.mpr hlt
  exact Nat.lt_of_lt_of_le hone
    (cumulativeTime_mono gap hsucc)

/-- Every checkpoint after zero has a positive contraction index. -/
theorem cumulativeTime_pos
    (gap : Nat → Nat) (hpositive : ∀ horizon, 0 < gap horizon)
    {horizon : Nat} (hne : horizon ≠ 0) :
    0 < cumulativeTime gap horizon := by
  have hzero : cumulativeTime gap 0 < cumulativeTime gap horizon :=
    cumulativeTime_strictlyIncreasing gap hpositive
      (Nat.pos_of_ne_zero hne)
  simpa using hzero

end PureSFormal.WeakPath
