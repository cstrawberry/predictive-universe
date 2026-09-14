import PureSFormal.AppendixF.HeadInvariant

namespace PureSFormal.AppendixF.RecursiveCall
open PureSFormal.PureS
local infixl:70 " ⊙ " => Term.app
set_option maxHeartbeats 1000000

def parseProgram : Term → Option Program
  | .s => some .stop
  | .app (.app .s (.app .s a)) .s => (parseProgram a).map .grow
  | .app (.app .s a) .s => (parseProgram a).map .hold
  | _ => none

theorem parseProgram_term (p : Program) : parseProgram p.term = some p := by
  induction p with
  | stop => rfl
  | grow tail ih =>
    exact congrArg (Option.map Program.grow) ih
  | hold tail ih =>
    cases tail <;> simpa only [Program.term, parseProgram, Option.map_some] using congrArg (Option.map Program.hold) ih

theorem parseProgram_sound (t : Term) (p : Program) (found : parseProgram t = some p) : t = p.term := by
  fun_induction parseProgram t generalizing p
  case case1 =>
    have same := Option.some.inj found
    subst p
    rfl
  case case2 a ih =>
    obtain ⟨tail, parsed, same⟩ := Option.map_eq_some_iff.mp found
    subst p
    rw [ih tail parsed]
    rfl
  case case3 a exclusion ih =>
    obtain ⟨tail, parsed, same⟩ := Option.map_eq_some_iff.mp found
    subst p
    rw [ih tail parsed]
    rfl
  case case4 t exclusion => simp_all

theorem Program.term_injective {p q : Program} (same : p.term = q.term) : p = q := by
  have parsed := congrArg parseProgram same
  simpa only [parseProgram_term, Option.some.injEq] using parsed

def classify : Program → Option Admissible
  | .stop => none
  | .grow tail => some (.grow 0 tail)
  | .hold (.hold .stop) => some (.holds 0)
  | .hold tail => (classify tail).map Admissible.hold

theorem holds_zero (n : Nat) : (Admissible.holds n).program = Program.holds (n + 2) .stop := rfl

theorem classify_holds (n : Nat) : classify (Program.holds (n + 2) .stop) = some (.holds n) := by
  induction n with
  | zero => rfl
  | succ n ih =>
    simp only [Program.holds, classify]
    exact congrArg (Option.map Admissible.hold) ih

theorem classify_grow (n : Nat) (tail : Program) :
    classify (Program.holds n (.grow tail)) = some (.grow n tail) := by
  induction n with
  | zero => rfl
  | succ n ih =>
    have notSmall : Program.holds n (.grow tail) ≠ .hold .stop := by
      cases n with
      | zero => simp [Program.holds]
      | succ n => cases n <;> simp [Program.holds]
    have unfolding : classify (.hold (Program.holds n (.grow tail))) =
        (classify (Program.holds n (.grow tail))).map Admissible.hold := by
      generalize eq : Program.holds n (.grow tail) = p at notSmall ⊢
      cases p with
      | stop => rfl
      | grow p => rfl
      | hold p => cases p <;> simp_all [classify]
    change classify (.hold (Program.holds n (.grow tail))) = _
    rw [unfolding, ih]
    rfl

theorem classify_program (p : Admissible) : classify p.program = some p := by
  cases p with
  | holds n => exact classify_holds n
  | grow n tail => exact classify_grow n tail

theorem classify_sound (p : Program) (a : Admissible) (found : classify p = some a) : p = a.program := by
  fun_induction classify p generalizing a
  case case1 => cases found
  case case2 tail =>
    have same := Option.some.inj found
    subst a
    rfl
  case case3 =>
    have same := Option.some.inj found
    subst a
    rfl
  case case4 tail exclusion ih =>
    obtain ⟨rest, parsed, same⟩ := Option.map_eq_some_iff.mp found
    subst a
    rw [ih rest parsed]
    cases rest <;> rfl

def parseAdmissible (t : Term) : Option Admissible := (parseProgram t).bind classify

theorem parseAdmissible_term (p : Admissible) : parseAdmissible p.term = some p := by
  rw [parseAdmissible, Admissible.term, parseProgram_term, Option.bind_some, classify_program]

theorem parseAdmissible_sound (t : Term) (a : Admissible) (found : parseAdmissible t = some a) : t = a.term := by
  obtain ⟨p, parsed, classified⟩ := Option.bind_eq_some_iff.mp found
  rw [parseProgram_sound t p parsed, classify_sound p a classified]
  rfl

theorem Admissible.term_injective {p q : Admissible} (same : p.term = q.term) : p = q := by
  have parsed := congrArg parseAdmissible same
  simpa only [parseAdmissible_term, Option.some.injEq] using parsed

end PureSFormal.AppendixF.RecursiveCall
