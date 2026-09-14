import PureSFormal.PureS.Clock
import PureSFormal.PureS.Carrier

/-!
# Outer fuel and dovetail structure

This module isolates the syntax and counted reductions of Section 7.  It
does not assume that a bounded job has already been proved correct.  A stage
contains a finite clock-wrapper spine; each wrapper launches one `C_n` job
and exposes the remaining spine as its literal continuation.
-/

namespace PureSFormal.PureS

namespace Dovetail

/-- The source of clock stage `n`, before equation (17) is contracted. -/
def stageSource (n : Nat) (environment : Term) : Term :=
  .app (.app (C n) (C n)) environment

/-- `r` remaining wrappers, applied to the fixed environment. -/
def clockExit (n r : Nat) (environment : Term) : Term :=
  .app (clockWrappers n r) environment

/-- The fully exposed wrapper spine of stage `n`. -/
def stageExpanded (n : Nat) (environment : Term) : Term :=
  clockExit n n environment

/-- The bound-`n` job exposed by a launch with `r` wrappers remaining. -/
def jobSource (n r : Nat) (environment : Term) : Term :=
  .app (.app (C n) environment) (clockExit n r environment)

/-- Equation (17), lifted under the fixed environment argument. -/
theorem stage_expand (n : Nat) (environment : Term) :
    StepsN (n + 1) (stageSource n environment)
      (stageExpanded n environment) := by
  simpa [stageSource, stageExpanded, clockExit] using
    StepsN.appLeft (clock_diagonal n) environment

/-- Equation (18) exposes exactly one bound-`n` job. -/
theorem launch (n r : Nat) (environment : Term) :
    StepsN 1 (clockExit n (r + 1) environment)
      (jobSource n r environment) := by
  simpa [clockExit, jobSource] using
    clockWrapper_launch n r environment

/-- The exposed job expands to exactly `n` pending frames. -/
theorem expandJob (n r : Nat) (environment : Term) :
    StepsN (2 * n + 5) (jobSource n r environment)
      (nestedFrames environment (clockExit n r environment) n) := by
  simpa [jobSource] using
    C2_frames n environment (clockExit n r environment)

/-- Launch and fuel expansion together cost `2n+6` contractions. -/
theorem launch_expandJob (n r : Nat) (environment : Term) :
    StepsN (2 * n + 6) (clockExit n (r + 1) environment)
      (nestedFrames environment (clockExit n r environment) n) := by
  have combined := StepsN.trans (launch n r environment)
    (expandJob n r environment)
  have count : 1 + (2 * n + 5) = 2 * n + 6 := by
    calc
      1 + (2 * n + 5) = (2 * n + 5) + 1 := Nat.add_comm _ _
      _ = 2 * n + (5 + 1) := Nat.add_assoc _ _ _
      _ = 2 * n + 6 := rfl
  rw [count] at combined
  exact combined

@[simp]
theorem clockExit_zero (n : Nat) (environment : Term) :
    clockExit n 0 environment = .app (clockBase n) environment :=
  rfl

/-- The terminal continuation of stage `n` is literally stage `n+1`. -/
@[simp]
theorem clockExit_zero_eq_nextStageSource (n : Nat) (environment : Term) :
    clockExit n 0 environment = stageSource (n + 1) environment :=
  rfl

/-- Stage zero has no jobs and exposes the source of stage one directly. -/
@[simp]
theorem stageExpanded_zero (environment : Term) :
    stageExpanded 0 environment = stageSource 1 environment :=
  rfl

/-- The final continuation has the terminal arity four. -/
@[simp]
theorem headArity_clockExit_zero (n : Nat) (environment : Term) :
    (clockExit n 0 environment).headArity = 4 := by
  exact headArity_clockExit_terminal n environment

/-- Every continuation with a remaining wrapper has arity three. -/
@[simp]
theorem headArity_clockExit_succ (n r : Nat) (environment : Term) :
    (clockExit n (r + 1) environment).headArity = 3 := by
  exact headArity_clockExit_wrapper n r environment

/-- A clock exit is an admissible active-job continuation. -/
theorem clockExit_admissible (n r : Nat) (environment : Term) :
    Carrier.Admissible (clockExit n r environment) := by
  cases r with
  | zero => exact Or.inr (headArity_clockExit_zero n environment)
  | succ r => exact Or.inl (headArity_clockExit_succ n r environment)

/-- Arity four identifies exactly the terminal continuation. -/
theorem headArity_clockExit_eq_four_iff
    (n r : Nat) (environment : Term) :
    (clockExit n r environment).headArity = 4 ↔ r = 0 := by
  cases r with
  | zero => simp
  | succ r => simp

/-- Arity three identifies exactly a continuation with another wrapper. -/
theorem headArity_clockExit_eq_three_iff
    (n r : Nat) (environment : Term) :
    (clockExit n r environment).headArity = 3 ↔ ∃ k, r = k + 1 := by
  cases r with
  | zero =>
      constructor
      · intro harity
        have hfour := headArity_clockExit_zero n environment
        rw [hfour] at harity
        cases harity
      · rintro ⟨k, hk⟩
        cases hk
  | succ r =>
      constructor
      · intro _
        exact ⟨r, rfl⟩
      · intro _
        exact headArity_clockExit_succ n r environment

/-- No raw clock exit is itself a completed or active Local shell. -/
theorem clockExit_not_localShell
    (n r : Nat) (environment : Term)
    {bits : List Bool} {continuation dispatcher : Term} :
    ¬ Carrier.LocalShell bits continuation dispatcher
      (clockExit n r environment) := by
  intro shell
  have localArity := shell.result_headArity
  cases r with
  | zero =>
      have exitArity := headArity_clockExit_zero n environment
      rcases localArity with hfive | hsix
      · rw [exitArity] at hfive
        cases hfive
      · rw [exitArity] at hsix
        cases hsix
  | succ r =>
      have exitArity := headArity_clockExit_succ n r environment
      rcases localArity with hfive | hsix
      · rw [exitArity] at hfive
        cases hfive
      · rw [exitArity] at hsix
        cases hsix

/-- In particular, `(C_1 C_1) E` is only a raw staging exit. -/
theorem staging_not_localShell
    (environment : Term)
    {bits : List Bool} {continuation dispatcher : Term} :
    ¬ Carrier.LocalShell bits continuation dispatcher
      (clockExit 0 0 environment) :=
  clockExit_not_localShell 0 0 environment

/-! ## Finite job inventory -/

/-- Remaining-wrapper indices in launch order: `[n-1, ..., 0]`. -/
def remainingIndices : Nat → List Nat
  | 0 => []
  | n + 1 => n :: remainingIndices n

@[simp]
theorem remainingIndices_zero : remainingIndices 0 = [] :=
  rfl

@[simp]
theorem remainingIndices_succ (n : Nat) :
    remainingIndices (n + 1) = n :: remainingIndices n :=
  rfl

/-- A stage-`n` clock spine contains exactly `n` launch slots. -/
@[simp]
theorem length_remainingIndices (n : Nat) :
    (remainingIndices n).length = n := by
  induction n with
  | zero => rfl
  | succ n => simp [remainingIndices, *]

/-- The literal bound-`n` job sources, in their launch order. -/
def stageJobs (n : Nat) (environment : Term) : List Term :=
  (remainingIndices n).map (fun r => jobSource n r environment)

/-- Stage `n` therefore has exactly `n` syntactic bounded-job slots. -/
@[simp]
theorem length_stageJobs (n : Nat) (environment : Term) :
    (stageJobs n environment).length = n := by
  simp [stageJobs]

/-- The final job's literal continuation is the arity-four terminal exit. -/
theorem finalJob_continuation
    (n : Nat) (environment : Term) :
    (clockExit n 0 environment).headArity = 4 :=
  headArity_clockExit_zero n environment

/-- Every nonfinal job retains an arity-three wrapper continuation. -/
theorem nonfinalJob_continuation
    (n r : Nat) (environment : Term) :
    (clockExit n (r + 1) environment).headArity = 3 :=
  headArity_clockExit_succ n r environment

/-- The ground generator is exactly the stage-zero clock source. -/
@[simp]
theorem generator_eq_stageSource (actions : Term) (bits : List Bool) :
    generator actions bits =
      stageSource 0 (environmentCode actions bits) :=
  rfl

/-- Its first contraction reaches the registered staging exit. -/
theorem generator_to_staging (actions : Term) (bits : List Bool) :
    StepsN 1 (generator actions bits)
      (clockExit 0 0 (environmentCode actions bits)) := by
  simpa [clockExit] using generator_staging actions bits

end Dovetail

end PureSFormal.PureS
