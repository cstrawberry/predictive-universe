import PureSFormal.PureS.CountedReduction
import PureSFormal.WeakPath.Interface

/-!
# Unfolded occurrence-tree size under pure-S contraction

One contextual `S X Y Z → X Z (Y Z)` contraction changes the whole-tree size
by `Z.size - 1`; equivalently, `target.size + 1 = source.size + Z.size`.
The change can therefore be zero when `Z = S`.  The target is nevertheless
strictly smaller than twice the source.  This module proves the exact balance
and lifts the factor-two upper bound to exact-length reductions and to every
prefix and checkpoint of a public weak-path realization.

The bound concerns unfolded ordered occurrence trees: the two appearances of
`Z` in the contractum are counted separately even when an executor shares
their immutable storage.
-/

namespace PureSFormal.PureS

namespace Context

/-- Syntax nodes contributed by a context outside its unique hole. -/
def overhead : Context → Nat
  | .hole => 0
  | .appLeft context right => context.overhead + right.size + 1
  | .appRight left context => left.size + context.overhead + 1

@[simp]
theorem plug_size (context : Context) (term : Term) :
    (context.plug term).size = context.overhead + term.size := by
  induction context with
  | hole => simp [overhead]
  | appLeft context right ih =>
      simp only [plug, Term.size, overhead, ih]
      simp only [Nat.succ_eq_add_one, Nat.add_assoc, Nat.add_comm,
        Nat.add_left_comm]
  | appRight left context ih =>
      simp only [plug, Term.size, overhead, ih]
      simp only [Nat.succ_eq_add_one, Nat.add_assoc, Nat.add_comm,
        Nat.add_left_comm]

end Context

namespace Term

@[simp]
theorem redex_size (x y z : Term) :
    (redex x y z).size = x.size + y.size + z.size + 4 := by
  simp [redex, size, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
  simp only [← Nat.add_assoc]

@[simp]
theorem contractum_size (x y z : Term) :
    (contractum x y z).size = x.size + y.size + 2 * z.size + 3 := by
  simp [contractum, size, Nat.two_mul, Nat.add_assoc, Nat.add_comm,
    Nat.add_left_comm]
  simp only [← Nat.add_assoc]

/-- Exact root-size balance: contraction adds `z.size - 1` syntax nodes. -/
theorem contractum_size_succ_eq_redex_size_add_argument (x y z : Term) :
    (contractum x y z).size + 1 = (redex x y z).size + z.size := by
  rw [redex_size, contractum_size]
  simp [Nat.two_mul, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
  simp only [← Nat.add_assoc]

/-- The defining root contractum is strictly smaller than twice its redex. -/
theorem contractum_size_lt_twice_redex (x y z : Term) :
    (contractum x y z).size < 2 * (redex x y z).size := by
  have hnext :
      (contractum x y z).size + 1 = (redex x y z).size + z.size := by
    exact contractum_size_succ_eq_redex_size_add_argument x y z
  have hfirst :
      (contractum x y z).size < (redex x y z).size + z.size :=
    Nat.lt_of_succ_le (Nat.le_of_eq hnext)
  have hrest : 0 < x.size + y.size + 4 := by
    exact Nat.zero_lt_succ _
  have hzlt : z.size < (redex x y z).size := by
    have appended : z.size < z.size + (x.size + y.size + 4) :=
      Nat.lt_add_of_pos_right hrest
    rw [redex_size]
    have rearrange :
        z.size + (x.size + y.size + 4) = x.size + y.size + z.size + 4 := by
      simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
    rw [← rearrange]
    exact appended
  have hsecond :
      (redex x y z).size + z.size <
        (redex x y z).size + (redex x y z).size :=
    Nat.add_lt_add_left hzlt (redex x y z).size
  have combined :
      (contractum x y z).size <
        (redex x y z).size + (redex x y z).size :=
    Nat.lt_trans hfirst hsecond
  simpa only [Nat.two_mul] using combined

end Term

namespace Step

/-- Every contextual step exposes the duplicated argument and its exact
whole-tree size balance. -/
theorem exists_argument_size_balance {source target : Term}
    (step : Step source target) :
    ∃ z : Term, target.size + 1 = source.size + z.size := by
  obtain ⟨context, x, y, z, rfl, rfl⟩ := step
  refine ⟨z, ?_⟩
  rw [Context.plug_size, Context.plug_size]
  calc
    context.overhead + (Term.contractum x y z).size + 1 =
        context.overhead + ((Term.contractum x y z).size + 1) := by
      simp only [Nat.add_assoc]
    _ = context.overhead + ((Term.redex x y z).size + z.size) := by
      rw [Term.contractum_size_succ_eq_redex_size_add_argument]
    _ = context.overhead + (Term.redex x y z).size + z.size := by
      simp only [Nat.add_assoc]

/-- Every contextual pure-S contraction leaves a target whose size is
strictly smaller than twice the source size. -/
theorem target_size_lt_twice_source {source target : Term}
    (step : Step source target) : target.size < 2 * source.size := by
  obtain ⟨context, x, y, z, rfl, rfl⟩ := step
  rw [Context.plug_size, Context.plug_size]
  have hlocal := Term.contractum_size_lt_twice_redex x y z
  have lifted :
      context.overhead + (Term.contractum x y z).size <
        context.overhead + 2 * (Term.redex x y z).size :=
    Nat.add_lt_add_left hlocal context.overhead
  have hover : context.overhead ≤ context.overhead + context.overhead :=
    Nat.le_add_right context.overhead context.overhead
  have padded := Nat.add_le_add_right hover
    (2 * (Term.redex x y z).size)
  have rearranged :
      context.overhead + 2 * (Term.redex x y z).size ≤
        2 * (context.overhead + (Term.redex x y z).size) := by
    have rearrange :
        context.overhead + context.overhead + 2 * (Term.redex x y z).size =
          2 * (context.overhead + (Term.redex x y z).size) := by
      simp only [Nat.mul_add, Nat.two_mul]
    rw [← rearrange]
    exact padded
  exact Nat.lt_of_lt_of_le lifted rearranged

/-- Non-strict form used by multiplicative iteration. -/
theorem target_size_le_twice_source {source target : Term}
    (step : Step source target) : target.size ≤ 2 * source.size :=
  Nat.le_of_lt step.target_size_lt_twice_source

end Step

namespace StepsN

/-- An exact `n`-contraction reduction grows by at most `2^n`. -/
theorem target_size_le_pow {steps : Nat} {source target : Term}
    (reduction : StepsN steps source target) :
    target.size ≤ 2 ^ steps * source.size := by
  induction reduction with
  | refl => simp
  | @tail steps source middle target prefixReduction lastStep ih =>
      calc
        target.size ≤ 2 * middle.size :=
          lastStep.target_size_le_twice_source
        _ ≤ 2 * (2 ^ steps * source.size) :=
          Nat.mul_le_mul_left 2 ih
        _ = 2 ^ (steps + 1) * source.size := by
          rw [Nat.pow_succ]
          simp only [Nat.mul_assoc, Nat.mul_comm, Nat.mul_left_comm]

end StepsN

end PureSFormal.PureS

namespace PureSFormal.WeakPath

namespace ReductionPath

/-- The first `n` edges of a reduction path form an exact-length reduction. -/
theorem stepsN (path : ReductionPath) : ∀ index,
    PureS.StepsN index (path.term 0) (path.term index)
  | 0 => .refl _
  | index + 1 => .tail (stepsN path index) (path.contracts index)

/-- Every path prefix has the unfolded occurrence-tree exponential bound. -/
theorem term_size_le_pow (path : ReductionPath) (index : Nat) :
    (path.term index).size ≤ 2 ^ index * (path.term 0).size :=
  (path.stepsN index).target_size_le_pow

end ReductionPath

namespace Realizes

/-- Every registered checkpoint inherits the exact contraction-index growth
bound from the underlying pure-S path. -/
theorem checkpoint_term_size_le_pow
    {P : CTS.Program}
    {Scheduler : Type u}
    {projects : SchedulerProjection Scheduler}
    {scheduler : Scheduler}
    {initialTerm : PureS.Term}
    {initialConfig : CTS.Config P}
    {decoder : BareTermDecoder P}
    {path : ReductionPath}
    {checkpointTime : Nat → Nat}
    (realizes : Realizes P projects scheduler initialTerm initialConfig
      decoder path checkpointTime)
    (horizon : Nat) :
    (path.term (checkpointTime horizon)).size ≤
      2 ^ (checkpointTime horizon) * initialTerm.size := by
  have bound := path.term_size_le_pow (checkpointTime horizon)
  rw [realizes.startsAt] at bound
  exact bound

end Realizes

end PureSFormal.WeakPath
