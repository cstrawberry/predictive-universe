import PureSFormal.AppendixF.AAABoundary
import PureSFormal.AppendixF.RecursiveCall

/-! Normal arguments and exactly one head-spine redex. -/
namespace PureSFormal.AppendixF.HeadInvariant
open PureSFormal.PureS
local infixl:70 " ⊙ " => Term.app
set_option maxHeartbeats 1000000

inductive Normal : Term → Prop where
  | s : Normal .s
  | app {fn arg : Term} : Normal fn → Normal arg → fn.headArity < 2 → Normal (fn ⊙ arg)

theorem Normal.arity {t : Term} (h : Normal t) : t.headArity < 3 := by
  cases h with
  | s => decide
  | app _ _ bound => change _ + 1 < 3; omega

theorem Normal.noTextbookStep {t : Term} (h : Normal t) {target : Term} : ¬ TextbookStep t target := by
  induction h generalizing target with
  | s => intro step; cases step
  | app fn arg bound ihfn iharg =>
    intro step
    cases step with
    | contract x y z => simp [Term.headArity] at bound
    | appLeft step _ => exact ihfn step
    | appRight _ step => exact iharg step

theorem Normal.noStep {t : Term} (h : Normal t) {target : Term} : ¬ Step t target :=
  fun step => h.noTextbookStep ((step_iff_textbookStep t target).mp step)

def redexCount : Term → Nat
  | .s => 0
  | .app fn arg => redexCount fn + redexCount arg + if (Term.app fn arg).headArity = 3 then 1 else 0

theorem Normal.redexCount {t : Term} (h : Normal t) : redexCount t = 0 := by
  induction h with
  | s => rfl
  | @app fn arg hfn harg bound ihfn iharg =>
    have notRoot : (Term.app fn arg).headArity ≠ 3 := by change fn.headArity + 1 ≠ 3; omega
    simp only [HeadInvariant.redexCount, ihfn, iharg, if_neg notRoot, Nat.zero_add]

theorem normal_one {t : Term} (h : Normal t) : Normal (.s ⊙ t) :=
  .app .s h (by decide)

theorem normal_two {u v : Term} (hu : Normal u) (hv : Normal v) : Normal (.s ⊙ u ⊙ v) :=
  .app (normal_one hu) hv (by change 1 < 2; decide)

theorem root_unique {x y z : Term} (hx : Normal x) (hy : Normal y) (hz : Normal z)
    {target : Term} (step : Step (Term.redex x y z) target) : target = Term.contractum x y z := by
  have textbook := (step_iff_textbookStep _ _).mp step
  cases textbook with
  | contract => rfl
  | appLeft inside _ => exact ((normal_two hx hy).noTextbookStep inside).elim
  | appRight _ inside => exact (hz.noTextbookStep inside).elim

structure OneRedex (t : Term) : Prop where
  arity : 3 ≤ t.headArity
  count : redexCount t = 1
  unique : ∀ {left right}, Step t left → Step t right → left = right

theorem root_oneRedex {x y z : Term} (hx : Normal x) (hy : Normal y) (hz : Normal z) :
    OneRedex (Term.redex x y z) := by
  refine ⟨Nat.le_refl _, ?_, ?_⟩
  · change redexCount (.s ⊙ x ⊙ y) + redexCount z + 1 = 1
    rw [(normal_two hx hy).redexCount, hz.redexCount]
  · intro left right l r
    exact (root_unique hx hy hz l).trans (root_unique hx hy hz r).symm

theorem OneRedex.app {fn arg : Term} (h : OneRedex fn) (normal : Normal arg) : OneRedex (fn ⊙ arg) := by
  refine ⟨by change 3 ≤ fn.headArity + 1; have := h.arity; omega, ?_, ?_⟩
  · have noRoot : (fn ⊙ arg).headArity ≠ 3 := by change fn.headArity + 1 ≠ 3; have := h.arity; omega
    simp only [redexCount, h.count, normal.redexCount, if_neg noRoot, Nat.add_zero]
  · intro left right l r
    have leftStep := (step_iff_textbookStep _ _).mp l
    have rightStep := (step_iff_textbookStep _ _).mp r
    cases leftStep with
    | contract x y z => have := h.arity; simp [Term.headArity] at this
    | appRight fn inside => exact (normal.noTextbookStep inside).elim
    | appLeft inside arg =>
      cases rightStep with
      | contract x y z => have := h.arity; simp [Term.headArity] at this
      | appRight fn inside => exact (normal.noTextbookStep inside).elim
      | appLeft other arg =>
        exact congrArg (fun t => t ⊙ arg)
          (h.unique ((step_iff_textbookStep _ _).mpr inside) ((step_iff_textbookStep _ _).mpr other))

inductive Passive : Context → Prop where
  | hole : Passive .hole
  | app {ctx : Context} {arg : Term} : Passive ctx → Normal arg → Passive (.appLeft ctx arg)

theorem Passive.comp {outer inner : Context} (houter : Passive outer) (hinner : Passive inner) :
    Passive (outer.comp inner) := by
  induction houter with
  | hole => exact hinner
  | app ctx normal ih => exact .app ih normal

theorem Passive.oneRedex {ctx : Context} (passive : Passive ctx) {t : Term} (h : OneRedex t) :
    OneRedex (ctx.plug t) := by
  induction passive with
  | hole => exact h
  | app ctx normal ih => exact ih.app normal

end PureSFormal.AppendixF.HeadInvariant

namespace PureSFormal.AppendixF.RecursiveCall
open PureSFormal.PureS PureSFormal.AppendixF.HeadInvariant
local infixl:70 " ⊙ " => Term.app

theorem Program.normal (p : Program) : Normal p.term := by
  induction p with
  | stop => exact .s
  | hold p ih => exact normal_two ih .s
  | grow p ih => exact normal_two (normal_one ih) .s

theorem Admissible.normal (p : Admissible) : Normal p.term := p.program.normal

theorem Admissible.arity (p : Admissible) : p.term.headArity = 2 := by
  cases p with
  | grow n tail => cases n <;> rfl
  | holds n => rfl

theorem Data.normal (table : Label → Admissible) (x : Data Label) : Normal (x.term table) := by
  induction x with
  | leaf j => exact normal_one (table j).normal
  | node l r ihl ihr => exact normal_two ihl (normal_one ihr)

theorem holds_terms_single (n : Nat) (x : Term) (normal : Normal x) :
    ∀ t ∈ (Admissible.holds n).programTerms x, OneRedex t := by
  have bnormal := normal_one normal
  induction n with
  | zero =>
    intro t member
    simp only [Admissible.programTerms, List.mem_cons, List.not_mem_nil, or_false] at member
    rcases member with same | same | same
    · subst t; exact root_oneRedex (Program.hold .stop).normal .s normal
    · subst t; exact (root_oneRedex Normal.s Normal.s normal).app bnormal
    · subst t; exact root_oneRedex normal bnormal bnormal
  | succ n ih =>
    intro t member
    simp only [Admissible.programTerms, List.mem_cons] at member
    cases member with
    | inl same => subst t; exact root_oneRedex (Admissible.holds n).normal .s normal
    | inr member =>
      obtain ⟨inner, mem, same⟩ := List.mem_map.mp member
      subst t
      exact (ih inner mem).app bnormal

theorem descent_terms_single (table : Label → Admissible) (x : Data Label) (b : Term) (normal : Normal b) :
    ∀ t ∈ x.descentTerms table b, OneRedex t := by
  induction x with
  | leaf => intro t member; cases member
  | node left right ih _ =>
    have znormal := normal_two (right.normal table) normal
    cases left with
    | leaf j =>
      intro t member
      simp only [Data.descentTerms, List.mem_cons, List.not_mem_nil, or_false] at member
      cases member with
      | inl same => subst t; exact root_oneRedex ((Data.leaf j).normal table) (normal_one (right.normal table)) normal
      | inr same => subst t; exact root_oneRedex (table j).normal normal znormal
    | node l r =>
      intro t member
      simp only [Data.descentTerms, List.mem_cons] at member
      cases member with
      | inl same => subst t; exact root_oneRedex ((Data.node l r).normal table) (normal_one (right.normal table)) normal
      | inr member =>
        obtain ⟨inner, mem, same⟩ := List.mem_map.mp member
        subst t
        exact (ih inner mem).app znormal

end PureSFormal.AppendixF.RecursiveCall
