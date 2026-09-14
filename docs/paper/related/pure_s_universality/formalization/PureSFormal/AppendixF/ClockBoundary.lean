import PureSFormal.AppendixF.HoldCarrierExclusion
import PureSFormal.PureS.ClosedTerms

namespace PureSFormal.AppendixF.ClockBoundary
open PureSFormal.PureS
open PureSFormal.AppendixF.HeadInvariant
open PureSFormal.AppendixF.RecursiveCall
local infixl:70 " ⊙ " => Term.app
set_option maxHeartbeats 1000000

theorem b_normal : Normal b := normal_one .s

theorem numeral_normal (n : Nat) : Normal (C n) := by
  induction n with
  | zero => exact normal_two b_normal b_normal
  | succ n ih => exact normal_two .s ih

theorem numeral_arity (n : Nat) : (C n).headArity = 2 := by cases n <;> rfl

inductive Clock : Term → Prop where
  | pair (m n : Nat) : Clock (C m ⊙ C n)
  | wrap (n : Nat) {inner : Term} : Clock inner → Clock (.s ⊙ C n ⊙ inner)

theorem pair_successor (m n : Nat) : ∃ t, Step (C m ⊙ C n) t ∧ Clock t := by
  cases m with
  | zero => exact ⟨_, Step.root b b (C n), Clock.pair (n + 1) (n + 1)⟩
  | succ m => exact ⟨_, Step.root .s (C m) (C n), Clock.wrap n (Clock.pair m n)⟩

theorem pair_preserves (m n : Nat) {t : Term} (step : Step (C m ⊙ C n) t) : Clock t := by
  cases m with
  | zero =>
    have same := root_unique b_normal b_normal (numeral_normal n) step
    rw [same]
    exact Clock.pair (n + 1) (n + 1)
  | succ m =>
    have same := root_unique Normal.s (numeral_normal m) (numeral_normal n) step
    rw [same]
    exact Clock.wrap n (Clock.pair m n)

theorem Clock.step {source : Term} (clock : Clock source) {target : Term} (step : Step source target) : Clock target := by
  induction clock generalizing target with
  | pair m n => exact pair_preserves m n step
  | wrap n clock ih =>
    have textbook := (step_iff_textbookStep _ _).mp step
    cases textbook with
    | appLeft inside _ => exact ((normal_one (numeral_normal n)).noTextbookStep inside).elim
    | appRight _ inside => exact Clock.wrap n (ih ((step_iff_textbookStep _ _).mpr inside))

theorem Clock.reachable {source : Term} (clock : Clock source) {target : Term} (steps : Steps source target) :
    Clock target := by
  induction steps with
  | refl => exact clock
  | tail segment edge ih => exact ih.step edge

theorem Clock.has_step {t : Term} (clock : Clock t) : ∃ target, Step t target := by
  induction clock with
  | pair m n => obtain ⟨target, step, _⟩ := pair_successor m n; exact ⟨target, step⟩
  | wrap n clock ih =>
    obtain ⟨target, step⟩ := ih
    exact ⟨_, step.appRight (.s ⊙ C n)⟩

theorem program_second_s (p : Admissible) : ∃ a, p.term = .s ⊙ a ⊙ .s := by
  cases p with
  | grow n tail => cases n <;> exact ⟨_, rfl⟩
  | holds n => exact ⟨_, rfl⟩

theorem numeral_not_program (n : Nat) (p : Admissible) : C n ≠ p.term := by
  obtain ⟨a, shape⟩ := program_second_s p
  rw [shape]
  intro same
  cases n with
  | zero => have right := (Term.app.inj same).2; cases right
  | succ n =>
    have right := congrArg Term.headArity (Term.app.inj same).2
    simp only [numeral_arity, Term.headArity] at right
    omega

def IsCall (t : Term) : Prop := ∃ p : Admissible, ∃ x : Term, t = p.term ⊙ x

theorem call_arity {t : Term} (call : IsCall t) : t.headArity = 3 := by
  obtain ⟨p, x, rfl⟩ := call
  simp only [Term.headArity, Admissible.arity]

def NoCalls : Term → Prop
  | .s => True
  | .app left right => NoCalls left ∧ NoCalls right ∧ ¬ IsCall (.app left right)

theorem normal_noCalls {t : Term} (normal : Normal t) : NoCalls t := by
  induction normal with
  | s => trivial
  | @app fn arg nf na bound ihfn iharg =>
    refine ⟨ihfn, iharg, ?_⟩
    intro call
    have arity := call_arity call
    change fn.headArity + 1 = 3 at arity
    omega

theorem Clock.noCalls {t : Term} (clock : Clock t) : NoCalls t := by
  induction clock with
  | pair m n =>
    refine ⟨normal_noCalls (numeral_normal m), normal_noCalls (numeral_normal n), ?_⟩
    rintro ⟨p, x, same⟩
    exact numeral_not_program m p (Term.app.inj same).1
  | wrap n clock ih =>
    refine ⟨normal_noCalls (normal_one (numeral_normal n)), ih, ?_⟩
    intro call
    have count := call_arity call
    cases count

theorem NoCalls.inner {t : Term} (context : Context) (h : NoCalls (context.plug t)) : NoCalls t := by
  induction context with
  | hole => exact h
  | appLeft ctx right ih => exact ih h.1
  | appRight left ctx ih => exact ih h.2.1

theorem NoCalls.excludes {t : Term} (h : NoCalls t) (context : Context) (p : Admissible) (x : Term) :
    t ≠ context.plug (p.term ⊙ x) := by
  intro same
  rw [same] at h
  exact (NoCalls.inner context h).2.2 ⟨p, x, rfl⟩

end PureSFormal.AppendixF.ClockBoundary
