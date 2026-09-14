import PureSFormal.AppendixF.Carrier

/-! Effective, unique recognition of literal tagged carriers. -/
namespace PureSFormal.AppendixF.Carrier
open PureSFormal.PureS
local infixl:70 " ⊙ " => Term.app

def parse : Term → Option Code
  | .app (.app .s (.app .s u)) (.app .s v) => some (.base u v)
  | .app (.app .s p) right => (parse right).map (.tag p)
  | _ => none

theorem parse_code (code : Code) : parse code.term = some code := by
  induction code with
  | base u v => rfl
  | tag p rest ih =>
    cases rest <;> simpa only [Code.term, parse, Option.map_some] using congrArg (Option.map (Code.tag p)) ih

theorem parse_sound (term : Term) (code : Code) (found : parse term = some code) : term = code.term := by
  fun_induction parse term generalizing code
  case case1 u v =>
    simp only [Option.some.injEq] at found
    subst code
    rfl
  case case2 p right exclusion ih =>
    obtain ⟨rest, parsed, same⟩ := Option.map_eq_some_iff.mp found
    subst code
    rw [ih rest parsed]
    rfl
  case case3 term exclusion => simp_all

theorem parse_iff (term : Term) (code : Code) : parse term = some code ↔ term = code.term :=
  ⟨parse_sound term code, fun equal => equal ▸ parse_code code⟩

end PureSFormal.AppendixF.Carrier
