import PureSFormal.AppendixF.HoldInvariant

namespace PureSFormal.AppendixF.HeadInvariant
open PureSFormal.PureS
local infixl:70 " ⊙ " => Term.app
set_option maxHeartbeats 1000000

def IsPair (t : Term) : Prop := ∃ left right : Carrier.Code, t = left.term ⊙ right.term

def NoPairs : Term → Prop
  | .s => True
  | .app left right => NoPairs left ∧ NoPairs right ∧ ¬ IsPair (.app left right)

theorem pair_arity {t : Term} (pair : IsPair t) : t.headArity = 3 := by
  obtain ⟨left, right, rfl⟩ := pair
  simp only [Term.headArity, Carrier.Code.arity]

theorem Normal.noPairs {t : Term} (normal : Normal t) : NoPairs t := by
  induction normal with
  | s => trivial
  | @app fn arg nf na bound ihfn iharg =>
    refine ⟨ihfn, iharg, ?_⟩
    intro pair
    have arity := pair_arity pair
    change fn.headArity + 1 = 3 at arity
    omega

def Good (t : Term) : Prop := OneRedex t ∧ NoPairs t

theorem Good.app {fn arg : Term} (h : Good fn) (normal : Normal arg) : Good (fn ⊙ arg) := by
  refine ⟨h.1.app normal, h.2, normal.noPairs, ?_⟩
  intro pair
  have arity := pair_arity pair
  change fn.headArity + 1 = 3 at arity
  have bound := h.1.arity
  omega

theorem Passive.good {ctx : Context} (passive : Passive ctx) {t : Term} (h : Good t) : Good (ctx.plug t) := by
  induction passive with
  | hole => exact h
  | app ctx normal ih => exact ih.app normal

theorem root_good {x y z : Term} (nx : Normal x) (ny : Normal y) (nz : Normal z)
    (notPair : ¬ IsPair (Term.redex x y z)) : Good (Term.redex x y z) :=
  ⟨root_oneRedex nx ny nz, (normal_two nx ny).noPairs, nz.noPairs, notPair⟩

theorem pair_right_arity (left right : Term) (arity : right.headArity ≠ 2) : ¬ IsPair (left ⊙ right) := by
  rintro ⟨a, b, same⟩
  have rightEq := congrArg Term.headArity (Term.app.inj same).2
  rw [Carrier.Code.arity] at rightEq
  exact arity rightEq

theorem second_s_not_carrier (a : Term) (c : Carrier.Code) : .s ⊙ a ⊙ .s ≠ c.term := by
  cases c with
  | base u v => intro eq; have right := (Term.app.inj eq).2; cases right
  | tag p rest =>
    intro eq
    have right := congrArg Term.headArity (Term.app.inj eq).2
    simp only [Term.headArity, Carrier.Code.arity] at right
    omega

theorem second_s_not_pair (a z : Term) : ¬ IsPair (.s ⊙ a ⊙ .s ⊙ z) := by
  rintro ⟨left, right, same⟩
  exact second_s_not_carrier a left (Term.app.inj same).1

theorem dispatch_not_carrier (p b : Term) (hp : p.headArity = 2) (hb : b.headArity = 1)
    (c : Carrier.Code) : .s ⊙ p ⊙ b ≠ c.term := by
  cases c with
  | base u v =>
    intro same
    have first := congrArg Term.headArity (Term.app.inj (Term.app.inj same).1).2
    simp only [hp, Term.headArity] at first
    omega
  | tag a rest =>
    intro same
    have second := congrArg Term.headArity (Term.app.inj same).2
    simp only [hb, Carrier.Code.arity] at second
    omega

theorem dispatch_not_pair (p b z : Term) (hp : p.headArity = 2) (hb : b.headArity = 1) :
    ¬ IsPair (.s ⊙ p ⊙ b ⊙ z) := by
  rintro ⟨left, right, same⟩
  exact dispatch_not_carrier p b hp hb left (Term.app.inj same).1

theorem NoPairs.inner {t : Term} (context : Context) (h : NoPairs (context.plug t)) : NoPairs t := by
  induction context with
  | hole => exact h
  | appLeft ctx right ih => exact ih h.1
  | appRight left ctx ih => exact ih h.2.1

theorem NoPairs.excludes {t : Term} (h : NoPairs t) (context : Context) (left right : Carrier.Code) :
    t ≠ context.plug (left.term ⊙ right.term) := by
  intro same
  rw [same] at h
  exact (NoPairs.inner context h).2.2 ⟨left, right, rfl⟩

end PureSFormal.AppendixF.HeadInvariant

namespace PureSFormal.AppendixF.RecursiveCall
open PureSFormal.PureS PureSFormal.AppendixF.HeadInvariant
local infixl:70 " ⊙ " => Term.app

theorem holds_terms_good (n : Nat) (x : Term) (normal : Normal x) :
    ∀ t ∈ (Admissible.holds n).programTerms x, Good t := by
  have bn := normal_one normal
  induction n with
  | zero =>
    intro t member
    simp only [Admissible.programTerms, List.mem_cons, List.not_mem_nil, or_false] at member
    rcases member with same | same | same
    · subst t
      exact root_good (Program.hold .stop).normal .s normal (second_s_not_pair _ _)
    · subst t
      exact (root_good Normal.s Normal.s normal (second_s_not_pair _ _)).app bn
    · subst t
      exact root_good normal bn bn (pair_right_arity _ _ (by change 1 ≠ 2; decide))
  | succ n ih =>
    intro t member
    simp only [Admissible.programTerms, List.mem_cons] at member
    cases member with
    | inl same =>
      subst t
      exact root_good (Admissible.holds n).normal .s normal (second_s_not_pair _ _)
    | inr member =>
      obtain ⟨inner, mem, same⟩ := List.mem_map.mp member
      subst t
      exact (ih inner mem).app bn

theorem descent_terms_good (table : Label → Admissible) (x : Data Label) (b : Term)
    (normal : Normal b) (arity : b.headArity = 1) : ∀ t ∈ x.descentTerms table b, Good t := by
  induction x with
  | leaf => intro t member; cases member
  | node left right ih _ =>
    have zn := normal_two (right.normal table) normal
    have notPair (headTerm : Term) : ¬ IsPair (headTerm ⊙ b) := pair_right_arity _ _ (by omega)
    cases left with
    | leaf j =>
      intro t member
      simp only [Data.descentTerms, List.mem_cons, List.not_mem_nil, or_false] at member
      cases member with
      | inl same =>
        subst t
        exact root_good ((Data.leaf j).normal table) (normal_one (right.normal table)) normal (notPair _)
      | inr same =>
        subst t
        exact root_good (table j).normal normal zn (dispatch_not_pair _ _ _ (table j).arity arity)
    | node l r =>
      intro t member
      simp only [Data.descentTerms, List.mem_cons] at member
      cases member with
      | inl same =>
        subst t
        exact root_good ((Data.node l r).normal table) (normal_one (right.normal table)) normal (notPair _)
      | inr member =>
        obtain ⟨inner, mem, same⟩ := List.mem_map.mp member
        subst t
        exact (ih inner mem).app zn

theorem Configuration.hold_terms_good (table : Label → Admissible) (lengths : Label → Nat)
    (holds : ∀ j, table j = .holds (lengths j)) (c : Configuration Label)
    (passive : Passive c.context) : ∀ t ∈ c.terms table, Good t := by
  intro t member
  obtain ⟨inner, innerMember, same⟩ := List.mem_map.mp member
  subst t
  apply passive.good
  cases List.mem_append.mp innerMember with
  | inl program =>
    rw [holds c.label] at program
    exact holds_terms_good _ _ (c.data.normal table) _ program
  | inr descent =>
    obtain ⟨body, bodyMem, same⟩ := List.mem_map.mp descent
    subst inner
    have ctx : Passive ((table c.label).programContext (c.data.term table)) := by
      rw [holds c.label]
      exact holds_context_passive _ _ (c.data.normal table)
    exact ctx.good (descent_terms_good table c.data _ (normal_one (c.data.normal table)) rfl _ bodyMem)

theorem hold_path_good (table : Label → Admissible) (lengths : Label → Nat)
    (holds : ∀ j, table j = .holds (lengths j)) (c : InternalConfiguration Label)
    (passive : Passive c.val.context) (n : Nat) : Good ((pathSystem table).run n c) := by
  obtain ⟨block, member⟩ := (pathSystem table).run_in_block c n
  change (pathSystem table).run n c ∈
    ((FiniteOrbit.iterate (pathSystem table).next block c).val).terms table at member
  rw [pathSystem_iterate] at member
  exact Configuration.hold_terms_good table lengths holds _
    (c.val.hold_iterate_passive table lengths holds passive block) _ member

theorem hold_all_reducts (table : Label → Admissible) (lengths : Label → Nat)
    (holds : ∀ j, table j = .holds (lengths j)) (c : InternalConfiguration Label)
    (passive : Passive c.val.context) (t : Term) (reachable : Steps (c.val.term table) t) :
    OneRedex t ∧ NoPairs t := by
  have start := (pathSystem table).run_zero c
  change (pathSystem table).run 0 c = c.val.term table at start
  rw [← start] at reachable
  obtain ⟨n, same⟩ := all_reducts_on_path (fun n => (pathSystem table).run n c)
    ((pathSystem table).run_step c) (hold_path_single table lengths holds c passive) reachable
  rw [same]
  exact hold_path_good table lengths holds c passive n

end PureSFormal.AppendixF.RecursiveCall
