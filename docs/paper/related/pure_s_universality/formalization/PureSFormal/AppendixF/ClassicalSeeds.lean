import PureSFormal.AppendixF.ClockBoundary
import PureSFormal.AppendixF.HoldAllData

namespace PureSFormal.AppendixF.ClassicalSeeds
open PureSFormal.PureS PureSFormal.AppendixF.HeadInvariant PureSFormal.AppendixF.RecursiveCall
local infixl:70 " ⊙ " => Term.app

def atom : Term := .s ⊙ .s ⊙ .s
def p : Term := (Admissible.holds 0).term
def l : Term := .s ⊙ p
def b : Term := .s ⊙ l
def x : Term := b ⊙ b

/-- The seven literal contractions displayed after Lemma F.4.1. -/
theorem pp_seven_steps : StepsN 7 (p ⊙ p) (p ⊙ x ⊙ (b ⊙ x) ⊙ (l ⊙ l)) := by
  have e1 : Step (p ⊙ p) (atom ⊙ p ⊙ l) := Step.root atom .s p
  have e2 : Step (atom ⊙ p ⊙ l) (l ⊙ l ⊙ l) := (Step.root .s .s p).appLeft l
  have e3 : Step (l ⊙ l ⊙ l) (p ⊙ l ⊙ (l ⊙ l)) := Step.root p l l
  have e4 : Step (p ⊙ l ⊙ (l ⊙ l)) (atom ⊙ l ⊙ b ⊙ (l ⊙ l)) :=
    (Step.root atom .s l).appLeft (l ⊙ l)
  have e5 : Step (atom ⊙ l ⊙ b ⊙ (l ⊙ l)) (x ⊙ b ⊙ (l ⊙ l)) :=
    ((Step.root .s .s l).appLeft b).appLeft (l ⊙ l)
  have e6 : Step (x ⊙ b ⊙ (l ⊙ l)) (l ⊙ b ⊙ x ⊙ (l ⊙ l)) :=
    (Step.root l b b).appLeft (l ⊙ l)
  have e7 : Step (l ⊙ b ⊙ x ⊙ (l ⊙ l)) (p ⊙ x ⊙ (b ⊙ x) ⊙ (l ⊙ l)) :=
    (Step.root p b x).appLeft (l ⊙ l)
  exact ((((((StepsN.single e1).tail e2).tail e3).tail e4).tail e5).tail e6).tail e7

def table : Fin 1 → Admissible := fun _ => .holds 0
def data : Data (Fin 1) := .node (.leaf 0) (.leaf 0)

theorem data_term : data.term table = x := rfl
theorem retained_arguments_normal : Normal (b ⊙ x) ∧ Normal (l ⊙ l) := by
  have pn := (Admissible.holds 0).normal
  have ln : Normal l := normal_one pn
  have xn : Normal x := data_term ▸ data.normal table
  exact ⟨normal_two ln xn, Normal.app ln ln (by change 1 < 2; decide)⟩

/-- The displayed endpoint enters the infinite unique-redex hold invariant. -/
theorem pp_endpoint_infinite_unique : ∃ run : Nat → Term,
    run 0 = p ⊙ x ⊙ (b ⊙ x) ⊙ (l ⊙ l) ∧
    (∀ n, Step (run n) (run (n + 1))) ∧ (∀ n, OneRedex (run n)) := by
  let outer := Context.appLeft (.appLeft .hole (b ⊙ x)) (l ⊙ l)
  have passive : Passive outer := .app (.app .hole retained_arguments_normal.1) retained_arguments_normal.2
  obtain ⟨run, initial, native, unique, _⟩ := hold_all_data table (fun _ => 0) (fun _ => rfl)
    0 data outer passive
  exact ⟨run, initial, native, unique⟩

end PureSFormal.AppendixF.ClassicalSeeds

namespace PureSFormal.AppendixF.ClockBoundary
open PureSFormal.PureS PureSFormal.AppendixF.HeadInvariant
local infixl:70 " ⊙ " => Term.app

theorem Clock.redexCount {t : Term} (clock : Clock t) : HeadInvariant.redexCount t = 1 := by
  induction clock with
  | pair m n =>
    cases m with
    | zero => exact (root_oneRedex b_normal b_normal (numeral_normal n)).count
    | succ m => exact (root_oneRedex Normal.s (numeral_normal m) (numeral_normal n)).count
  | wrap n clock ih =>
    change HeadInvariant.redexCount (.s ⊙ C n) + HeadInvariant.redexCount _ + 0 = 1
    rw [(normal_one (numeral_normal n)).redexCount, ih]

theorem Clock.unique {t : Term} (clock : Clock t) {first second : Term}
    (left : Step t first) (right : Step t second) : first = second := by
  induction clock generalizing first second with
  | pair m n =>
    cases m with
    | zero => exact (root_oneRedex b_normal b_normal (numeral_normal n)).unique left right
    | succ m => exact (root_oneRedex Normal.s (numeral_normal m) (numeral_normal n)).unique left right
  | wrap n clock ih =>
    have leftText := (step_iff_textbookStep _ _).mp left
    have rightText := (step_iff_textbookStep _ _).mp right
    cases leftText with
    | appLeft inner _ => exact ((normal_one (numeral_normal n)).noTextbookStep inner).elim
    | appRight _ inner =>
      cases rightText with
      | appLeft other _ => exact ((normal_one (numeral_normal n)).noTextbookStep other).elim
      | appRight _ other =>
        exact congrArg (fun t => .s ⊙ C n ⊙ t)
          (ih ((step_iff_textbookStep _ _).mpr inner) ((step_iff_textbookStep _ _).mpr other))

theorem clock_one_redex_all (t : Term) (reachable : Steps (C 0 ⊙ C 0) t) :
    HeadInvariant.redexCount t = 1 ∧ (∃ next, Step t next) ∧
      ∀ first second, Step t first → Step t second → first = second := by
  have clock := (Clock.pair 0 0).reachable reachable
  exact ⟨clock.redexCount, clock.has_step, fun _ _ => clock.unique⟩

end PureSFormal.AppendixF.ClockBoundary
