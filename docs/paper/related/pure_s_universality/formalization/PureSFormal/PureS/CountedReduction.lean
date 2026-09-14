import PureSFormal.PureS.Reduction

/-!
# Exact-length pure-S reduction

`StepsN n source target` is the contextual pure-S reduction relation with
exactly `n` contractions.  Cursor motion and other administrative operations
are not represented here: every counted edge is one use of the sole
`S X Y Z → X Z (Y Z)` mutation.
-/

namespace PureSFormal.PureS

/-- The exact-length closure of contextual pure-S contraction. -/
inductive StepsN : Nat → Term → Term → Prop where
  | refl (term : Term) : StepsN 0 term term
  | tail {n : Nat} {source middle target : Term} :
      StepsN n source middle → Step middle target →
        StepsN (n + 1) source target

namespace StepsN

/-- A single contextual contraction has exact length one. -/
theorem single {source target : Term} (h : Step source target) :
    StepsN 1 source target := by
  simpa using StepsN.tail (StepsN.refl source) h

/-- Exact-length reductions compose and their lengths add. -/
theorem trans {m n : Nat} {source middle target : Term}
    (h₁ : StepsN m source middle) (h₂ : StepsN n middle target) :
    StepsN (m + n) source target := by
  induction h₂ with
  | refl => simpa using h₁
  | tail hprefix hlast ih =>
      simpa [Nat.add_assoc] using StepsN.tail (ih h₁) hlast

/-- Forgetting the exact length gives the ordinary reflexive-transitive closure. -/
theorem toSteps {n : Nat} {source target : Term}
    (h : StepsN n source target) : Steps source target := by
  induction h with
  | refl => exact Steps.refl _
  | tail hprefix hlast ih => exact Steps.tail ih hlast

/-- Exact-length reduction is preserved by every fixed outer context. -/
theorem inContext {n : Nat} {source target : Term}
    (h : StepsN n source target) (ctx : Context) :
    StepsN n (ctx.plug source) (ctx.plug target) := by
  induction h with
  | refl => exact StepsN.refl _
  | tail hprefix hlast ih => exact StepsN.tail ih (hlast.inContext ctx)

/-- Exact-length reduction in the function child of an application. -/
theorem appLeft {n : Nat} {source target : Term}
    (h : StepsN n source target) (arg : Term) :
    StepsN n (.app source arg) (.app target arg) := by
  simpa only [Context.plug] using h.inContext (.appLeft .hole arg)

/-- Exact-length reduction in the argument child of an application. -/
theorem appRight (fn : Term) {n : Nat} {source target : Term}
    (h : StepsN n source target) :
    StepsN n (.app fn source) (.app fn target) := by
  simpa only [Context.plug] using h.inContext (.appRight fn .hole)

/-- A zero-length reduction has equal endpoints. -/
theorem eq_of_zero {source target : Term} (h : StepsN 0 source target) :
    source = target := by
  cases h with
  | refl => rfl

/-- Equality gives a zero-length reduction. -/
theorem zero_of_eq {source target : Term} (h : source = target) :
    StepsN 0 source target := by
  subst target
  exact StepsN.refl source

theorem zero_iff {source target : Term} :
    StepsN 0 source target ↔ source = target :=
  ⟨eq_of_zero, zero_of_eq⟩

end StepsN

namespace Steps

/-- Every finite reduction has some exact contraction count. -/
theorem exists_stepsN {source target : Term} (h : Steps source target) :
    ∃ n, StepsN n source target := by
  induction h with
  | refl => exact ⟨0, StepsN.refl _⟩
  | tail hprefix hlast ih =>
      obtain ⟨n, hn⟩ := ih
      exact ⟨n + 1, StepsN.tail hn hlast⟩

end Steps

end PureSFormal.PureS
