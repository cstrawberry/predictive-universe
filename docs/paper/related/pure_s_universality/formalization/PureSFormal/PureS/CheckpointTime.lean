import PureSFormal.PureS.ExactCheckpointRun

/-!
# Explicit cubic bound for the checkpoint contraction count

`ExactCheckpointRun.checkpointTime` is an executable exact contraction count.
This module bounds its nested recurrences by a concrete cubic polynomial.  The
coefficient is finite and input-independent for every fixed finite CTS and
dispatcher: it is twelve plus the sum of the exact local-response costs over
the finite action alphabet.

No asymptotic predicate is introduced.  The final theorem is the literal
natural-number inequality

`checkpointTime program actions bits n ≤ C(program, actions) * (n + 1)^3`.
-/

namespace PureSFormal.PureS

namespace CheckpointTime

open ExactCheckpointRun

/-! ## A finite uniform bound for one checked CTS transition -/

/-- Sum of exact local-response costs over the finite phase/bit alphabet. -/
def localResponseCostSum
    (program : CTS.Program) (actions : ActionDispatcher program) : Nat :=
  (allActionLabels program |>.map fun label =>
    LocalResponse.completedCost program (actions.route label) label).sum

/-- Deletion and marking add at most two contractions to a local response. -/
def transitionCostBound
    (program : CTS.Program) (actions : ActionDispatcher program) : Nat :=
  2 + localResponseCostSum program actions

/-- Coefficient used for a single stage's quadratic bound. -/
def stageCostCoefficient
    (program : CTS.Program) (actions : ActionDispatcher program) : Nat :=
  transitionCostBound program actions + 9

/-- The explicit coefficient in the final cubic checkpoint bound. -/
def cubicCoefficient
    (program : CTS.Program) (actions : ActionDispatcher program) : Nat :=
  stageCostCoefficient program actions + 1

/-- A member's natural-number weight is at most the sum of all weights. -/
private theorem value_le_map_sum_of_mem
    {Label : Type u} (cost : Label → Nat) :
    ∀ (labels : List Label) {label : Label}, label ∈ labels →
      cost label ≤ (labels.map cost).sum
  | [], _, hmem => by simp at hmem
  | first :: rest, label, hmem => by
      simp only [List.mem_cons] at hmem
      simp only [List.map_cons, List.sum_cons]
      cases hmem with
      | inl heq =>
          subst label
          exact Nat.le_add_right _ _
      | inr hrest =>
          exact Nat.le_trans
            (value_le_map_sum_of_mem cost rest hrest)
            (Nat.le_add_left _ _)

/-- Every selected response cost occurs in the explicit finite sum. -/
theorem localResponseCost_le_sum
    (program : CTS.Program) (actions : ActionDispatcher program)
    (label : ActionLabel program) :
    LocalResponse.completedCost program (actions.route label) label ≤
      localResponseCostSum program actions := by
  exact value_le_map_sum_of_mem
    (fun found =>
      LocalResponse.completedCost program (actions.route found) found)
    (allActionLabels program) (mem_allActionLabels program label)

/-- Deleting the front symbol costs either zero or one contraction. -/
theorem deletionCost_le_one (input : List Bool) :
    CheckedTransition.deletionCost input ≤ 1 := by
  cases input <;> simp

/-- The optional absorbing-empty marker costs either zero or one contraction. -/
theorem markerCost_le_one (data : List Bool) :
    CheckedTransition.markerCost data ≤ 1 := by
  cases data <;> simp

/-- Uniform bound for every checked transition, independent of its dataword. -/
theorem totalCost_le_transitionCostBound
    (program : CTS.Program) (actions : ActionDispatcher program)
    (phase : CTS.Phase program) (input : List Bool) :
    CheckedTransition.totalCost program actions phase input ≤
      transitionCostBound program actions := by
  unfold CheckedTransition.totalCost CheckedTransition.baseCost
  calc
    (CheckedTransition.deletionCost input +
          LocalResponse.completedCost program
            (actions.route (CheckedTransition.label program phase input))
            (CheckedTransition.label program phase input)) +
        CheckedTransition.markerCost
          (CheckedTransition.outputData program phase input) ≤
        (1 + LocalResponse.completedCost program
          (actions.route (CheckedTransition.label program phase input))
          (CheckedTransition.label program phase input)) + 1 :=
      Nat.add_le_add
        (Nat.add_le_add_right (deletionCost_le_one input) _)
        (markerCost_le_one _)
    _ ≤ (1 + localResponseCostSum program actions) + 1 :=
      Nat.add_le_add_right
        (Nat.add_le_add_left
          (localResponseCost_le_sum program actions
            (CheckedTransition.label program phase input)) 1) 1
    _ = transitionCostBound program actions := by
      unfold transitionCostBound
      calc
        (1 + localResponseCostSum program actions) + 1 =
            1 + (localResponseCostSum program actions + 1) :=
          Nat.add_assoc _ _ _
        _ = 1 + (1 + localResponseCostSum program actions) := by
          rw [Nat.add_comm (localResponseCostSum program actions) 1]
        _ = (1 + 1) + localResponseCostSum program actions :=
          (Nat.add_assoc _ _ _).symm
        _ = 2 + localResponseCostSum program actions := rfl

/-! ## Lifting the bound through the exact recursive costs -/

/-- A fuel-`fuel` job performs at most `fuel` uniformly bounded transitions. -/
theorem jobCost_le
    (program : CTS.Program) (actions : ActionDispatcher program)
    (bits : List Bool) : ∀ fuel,
    jobCost program actions bits fuel ≤
      fuel * transitionCostBound program actions
  | 0 => by simp
  | fuel + 1 => by
      rw [jobCost_succ]
      calc
        jobCost program actions bits fuel +
            CheckedTransition.totalCost program actions
              (CTS.iterate program fuel (CTS.initial program bits)).phase
              (CTS.iterate program fuel (CTS.initial program bits)).data ≤
            fuel * transitionCostBound program actions +
              transitionCostBound program actions :=
          Nat.add_le_add (jobCost_le program actions bits fuel)
            (totalCost_le_transitionCostBound program actions _ _)
        _ = (fuel + 1) * transitionCostBound program actions := by
          rw [Nat.add_mul]
          simp

/-- Linear bound for the cost of launching and completing one fixed-fuel job. -/
def launchedJobCostBound
    (program : CTS.Program) (actions : ActionDispatcher program)
    (fuel : Nat) : Nat :=
  (2 * fuel + 6) + fuel * transitionCostBound program actions

/-- The exact cost of any number of jobs is bounded by jobs times one launch. -/
theorem jobsCost_le
    (program : CTS.Program) (actions : ActionDispatcher program)
    (bits : List Bool) (fuel : Nat) : ∀ jobs,
    jobsCost program actions bits fuel jobs ≤
      jobs * launchedJobCostBound program actions fuel
  | 0 => by simp
  | jobs + 1 => by
      rw [jobsCost_succ]
      have hone :
          (2 * fuel + 6) + jobCost program actions bits fuel ≤
            launchedJobCostBound program actions fuel := by
        exact Nat.add_le_add_left (jobCost_le program actions bits fuel) _
      calc
        ((2 * fuel + 6) + jobCost program actions bits fuel) +
            jobsCost program actions bits fuel jobs ≤
            launchedJobCostBound program actions fuel +
              jobs * launchedJobCostBound program actions fuel :=
          Nat.add_le_add hone
            (jobsCost_le program actions bits fuel jobs)
        _ = (jobs + 1) * launchedJobCostBound program actions fuel := by
          rw [Nat.add_mul]
          simp [Nat.add_comm]

/-- One launched-job bound is linear in its fuel. -/
theorem launchedJobCostBound_le_linear
    (program : CTS.Program) (actions : ActionDispatcher program)
    (fuel : Nat) :
    launchedJobCostBound program actions fuel ≤
      (transitionCostBound program actions + 8) * (fuel + 1) := by
  have hsucc : fuel ≤ fuel + 1 := Nat.le_succ fuel
  have htwo : 2 * fuel ≤ 2 * (fuel + 1) :=
    Nat.mul_le_mul_left 2 hsucc
  have hsix : 6 ≤ 6 * (fuel + 1) :=
    Nat.le_mul_of_pos_right 6 (Nat.zero_lt_succ fuel)
  have htransition :
      fuel * transitionCostBound program actions ≤
        (fuel + 1) * transitionCostBound program actions :=
    Nat.mul_le_mul_right _ hsucc
  calc
    launchedJobCostBound program actions fuel ≤
        (2 * (fuel + 1) + 6 * (fuel + 1)) +
          (fuel + 1) * transitionCostBound program actions :=
      Nat.add_le_add (Nat.add_le_add htwo hsix) htransition
    _ = (transitionCostBound program actions + 8) * (fuel + 1) := by
      calc
        (2 * (fuel + 1) + 6 * (fuel + 1)) +
            (fuel + 1) * transitionCostBound program actions =
            (2 * (fuel + 1) + 6 * (fuel + 1)) +
              transitionCostBound program actions * (fuel + 1) := by
          rw [Nat.mul_comm (fuel + 1) (transitionCostBound program actions)]
        _ = 8 * (fuel + 1) +
              transitionCostBound program actions * (fuel + 1) := by
          rw [← Nat.add_mul]
        _ = transitionCostBound program actions * (fuel + 1) +
              8 * (fuel + 1) := Nat.add_comm _ _
        _ = (transitionCostBound program actions + 8) * (fuel + 1) :=
          (Nat.add_mul _ _ _).symm

/-- Every complete stage has a quadratic bound with an explicit coefficient. -/
theorem stageCost_le_quadratic
    (program : CTS.Program) (actions : ActionDispatcher program)
    (bits : List Bool) (stage : Nat) :
    stageCost program actions bits stage ≤
      stageCostCoefficient program actions * (stage + 1) ^ 2 := by
  have hsucc : stage ≤ stage + 1 := Nat.le_succ stage
  have hjobs :
      jobsCost program actions bits stage stage ≤
        (transitionCostBound program actions + 8) * (stage + 1) ^ 2 := by
    calc
      jobsCost program actions bits stage stage ≤
          stage * launchedJobCostBound program actions stage :=
        jobsCost_le program actions bits stage stage
      _ ≤ (stage + 1) *
            ((transitionCostBound program actions + 8) * (stage + 1)) :=
        Nat.mul_le_mul hsucc
          (launchedJobCostBound_le_linear program actions stage)
      _ = (transitionCostBound program actions + 8) * (stage + 1) ^ 2 := by
        simp [Nat.pow_succ, Nat.mul_assoc, Nat.mul_comm, Nat.mul_left_comm]
  have hsquare : stage + 1 ≤ (stage + 1) ^ 2 := by
    calc
      stage + 1 ≤ (stage + 1) * (stage + 1) :=
        Nat.le_mul_of_pos_left _ (Nat.zero_lt_succ stage)
      _ = (stage + 1) ^ 2 := by simp [Nat.pow_succ]
  unfold stageCost
  calc
    stage + 1 + jobsCost program actions bits stage stage ≤
        (stage + 1) ^ 2 +
          (transitionCostBound program actions + 8) * (stage + 1) ^ 2 :=
      Nat.add_le_add hsquare hjobs
    _ = stageCostCoefficient program actions * (stage + 1) ^ 2 := by
      unfold stageCostCoefficient
      rw [Nat.add_mul, Nat.add_mul]
      calc
        (stage + 1) ^ 2 +
            (transitionCostBound program actions * (stage + 1) ^ 2 +
              8 * (stage + 1) ^ 2) =
            ((stage + 1) ^ 2 +
              transitionCostBound program actions * (stage + 1) ^ 2) +
                8 * (stage + 1) ^ 2 :=
          (Nat.add_assoc _ _ _).symm
        _ = (transitionCostBound program actions * (stage + 1) ^ 2 +
              (stage + 1) ^ 2) + 8 * (stage + 1) ^ 2 := by
          rw [Nat.add_comm ((stage + 1) ^ 2)
            (transitionCostBound program actions * (stage + 1) ^ 2)]
        _ = transitionCostBound program actions * (stage + 1) ^ 2 +
              ((stage + 1) ^ 2 + 8 * (stage + 1) ^ 2) :=
          Nat.add_assoc _ _ _
        _ = transitionCostBound program actions * (stage + 1) ^ 2 +
              (8 * (stage + 1) ^ 2 + (stage + 1) ^ 2) := by
          rw [Nat.add_comm ((stage + 1) ^ 2) (8 * (stage + 1) ^ 2)]
        _ = transitionCostBound program actions * (stage + 1) ^ 2 +
              9 * (stage + 1) ^ 2 := by
          rw [← Nat.succ_mul]

/-! ## Quadratic gaps sum to the explicit cubic checkpoint bound -/

/-- Every checkpoint gap is bounded by the corresponding quadratic shell. -/
theorem checkpointGap_le_quadratic
    (program : CTS.Program) (actions : ActionDispatcher program)
    (bits : List Bool) (horizon : Nat) :
    checkpointGap program actions bits horizon ≤
      cubicCoefficient program actions * (horizon + 2) ^ 2 := by
  cases horizon with
  | zero =>
      have hstage := stageCost_le_quadratic program actions bits 1
      have hone : (1 : Nat) ≤ 2 ^ 2 := by decide
      calc
        checkpointGap program actions bits 0 =
            1 + stageCost program actions bits 1 := rfl
        _ ≤ 1 + stageCostCoefficient program actions * 2 ^ 2 :=
          Nat.add_le_add_left hstage 1
        _ ≤ 2 ^ 2 + stageCostCoefficient program actions * 2 ^ 2 :=
          Nat.add_le_add_right hone _
        _ = cubicCoefficient program actions * (0 + 2) ^ 2 := by
          simp [cubicCoefficient, Nat.add_mul, Nat.add_comm]
  | succ horizon =>
      have hstage := stageCost_le_quadratic program actions bits (horizon + 2)
      have hcoefficient :
          stageCostCoefficient program actions ≤
            cubicCoefficient program actions := by
        exact Nat.le_add_right _ 1
      calc
        checkpointGap program actions bits (horizon + 1) =
            stageCost program actions bits (horizon + 2) := rfl
        _ ≤ stageCostCoefficient program actions * (horizon + 2 + 1) ^ 2 :=
          hstage
        _ ≤ cubicCoefficient program actions * (horizon + 2 + 1) ^ 2 :=
          Nat.mul_le_mul_right _ hcoefficient
        _ = cubicCoefficient program actions * (horizon + 1 + 2) ^ 2 := by
          rw [Nat.add_assoc, Nat.add_comm 2 1]

/-- One cubic shell plus the next square fits inside the next cubic shell. -/
private theorem cube_add_square_le_next_cube (n : Nat) :
    (n + 1) ^ 3 + (n + 2) ^ 2 ≤ (n + 2) ^ 3 := by
  have hsucc : n + 1 ≤ n + 2 := Nat.le_succ _
  have hsquare : (n + 1) ^ 2 ≤ (n + 2) ^ 2 :=
    Nat.pow_le_pow_left hsucc 2
  calc
    (n + 1) ^ 3 + (n + 2) ^ 2 =
        (n + 1) ^ 2 * (n + 1) + (n + 2) ^ 2 := by
      rw [Nat.pow_succ]
    _ ≤ (n + 2) ^ 2 * (n + 1) + (n + 2) ^ 2 :=
      Nat.add_le_add_right (Nat.mul_le_mul_right _ hsquare) _
    _ = (n + 2) ^ 2 * ((n + 1) + 1) :=
      (Nat.mul_succ _ _).symm
    _ = (n + 2) ^ 2 * (n + 2) := rfl
    _ = (n + 2) ^ 3 := (Nat.pow_succ _ _).symm

/-- Kernel-checked cubic bound for contractions through checkpoint `n`. -/
theorem checkpointTime_le_cubic
    (program : CTS.Program) (actions : ActionDispatcher program)
    (bits : List Bool) : ∀ n,
    checkpointTime program actions bits n ≤
      cubicCoefficient program actions * (n + 1) ^ 3
  | 0 => by simp [checkpointTime]
  | n + 1 => by
      change checkpointTime program actions bits n +
          checkpointGap program actions bits n ≤
        cubicCoefficient program actions * (n + 2) ^ 3
      calc
        checkpointTime program actions bits n +
            checkpointGap program actions bits n ≤
            cubicCoefficient program actions * (n + 1) ^ 3 +
              cubicCoefficient program actions * (n + 2) ^ 2 :=
          Nat.add_le_add (checkpointTime_le_cubic program actions bits n)
            (checkpointGap_le_quadratic program actions bits n)
        _ = cubicCoefficient program actions *
            ((n + 1) ^ 3 + (n + 2) ^ 2) :=
          (Nat.mul_add _ _ _).symm
        _ ≤ cubicCoefficient program actions * (n + 2) ^ 3 :=
          Nat.mul_le_mul_left _ (cube_add_square_le_next_cube n)

/-- The cubic coefficient, fully unfolded as a finite program/dispatcher sum. -/
theorem cubicCoefficient_eq_explicit
    (program : CTS.Program) (actions : ActionDispatcher program) :
    cubicCoefficient program actions =
      12 +
        (allActionLabels program |>.map fun label =>
          LocalResponse.completedCost program (actions.route label) label).sum := by
  unfold cubicCoefficient stageCostCoefficient transitionCostBound
    localResponseCostSum
  calc
    (2 +
          (allActionLabels program |>.map fun label =>
            LocalResponse.completedCost program (actions.route label) label).sum +
        9) + 1 =
        (2 +
          (allActionLabels program |>.map fun label =>
            LocalResponse.completedCost program (actions.route label) label).sum) +
          (9 + 1) :=
      Nat.add_assoc _ _ _
    _ =
        ((allActionLabels program |>.map fun label =>
            LocalResponse.completedCost program (actions.route label) label).sum + 2) +
          (9 + 1) := by
      rw [Nat.add_comm 2]
    _ =
        (allActionLabels program |>.map fun label =>
          LocalResponse.completedCost program (actions.route label) label).sum +
          (2 + (9 + 1)) :=
      Nat.add_assoc _ _ _
    _ =
        (allActionLabels program |>.map fun label =>
          LocalResponse.completedCost program (actions.route label) label).sum +
          ((2 + 9) + 1) := by
      rw [Nat.add_assoc 2 9 1]
    _ =
        (allActionLabels program |>.map fun label =>
          LocalResponse.completedCost program (actions.route label) label).sum +
          12 := rfl
    _ =
        12 +
          (allActionLabels program |>.map fun label =>
            LocalResponse.completedCost program (actions.route label) label).sum :=
      Nat.add_comm _ _

/--
Fully explicit polynomial form: the exact checkpoint contraction index is at
most the finite coefficient shown here times `(n+1)^3`.
-/
theorem checkpointTime_le_explicit_cubic
    (program : CTS.Program) (actions : ActionDispatcher program)
    (bits : List Bool) (n : Nat) :
    checkpointTime program actions bits n ≤
      (12 +
        (allActionLabels program |>.map fun label =>
          LocalResponse.completedCost program (actions.route label) label).sum) *
        (n + 1) ^ 3 := by
  rw [← cubicCoefficient_eq_explicit program actions]
  exact checkpointTime_le_cubic program actions bits n

end CheckpointTime

end PureSFormal.PureS
