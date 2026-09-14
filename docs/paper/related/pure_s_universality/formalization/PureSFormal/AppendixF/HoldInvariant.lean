import PureSFormal.AppendixF.HeadInvariant
import PureSFormal.AppendixF.RecursivePath

namespace PureSFormal.AppendixF.RecursiveCall
open PureSFormal.PureS PureSFormal.AppendixF.HeadInvariant
local infixl:70 " ⊙ " => Term.app
set_option maxHeartbeats 1000000

theorem holds_context_passive (n : Nat) (x : Term) (normal : Normal x) :
    Passive ((Admissible.holds n).programContext x) := by
  have bnormal := normal_one normal
  induction n with
  | zero =>
    simp only [Admissible.programContext]
    exact .app .hole (.app bnormal bnormal (by change 1 < 2; decide))
  | succ n ih =>
    simp only [Admissible.programContext]
    exact .app ih bnormal

theorem descent_context_passive (table : Label → Admissible) (x : Data Label) (b : Term)
    (normal : Normal b) (arity : b.headArity < 2) : Passive (x.descentContext table b) := by
  induction x with
  | leaf => exact .hole
  | node left right ih _ =>
    have znormal := normal_two (right.normal table) normal
    cases left with
    | leaf => exact .app .hole (.app normal znormal arity)
    | node l r => exact .app ih znormal

theorem Configuration.hold_next_passive (table : Label → Admissible) (lengths : Label → Nat)
    (holds : ∀ j, table j = .holds (lengths j)) (c : Configuration Label)
    (passive : Passive c.context) : Passive (c.next table).context := by
  change Passive (c.context.comp (((table c.label).programContext (c.data.term table)).comp
    (c.data.descentContext table (.s ⊙ c.data.term table))))
  apply passive.comp
  apply Passive.comp
  · rw [holds c.label]
    exact holds_context_passive _ _ (c.data.normal table)
  · exact descent_context_passive table c.data _ (normal_one (c.data.normal table)) (by change 1 < 2; decide)

theorem Configuration.hold_terms_single (table : Label → Admissible) (lengths : Label → Nat)
    (holds : ∀ j, table j = .holds (lengths j)) (c : Configuration Label)
    (passive : Passive c.context) : ∀ t ∈ c.terms table, OneRedex t := by
  intro t member
  obtain ⟨inner, innerMember, same⟩ := List.mem_map.mp member
  subst t
  apply passive.oneRedex
  cases List.mem_append.mp innerMember with
  | inl program =>
    rw [holds c.label] at program
    exact holds_terms_single _ _ (c.data.normal table) _ program
  | inr descent =>
    obtain ⟨body, bodyMember, same⟩ := List.mem_map.mp descent
    subst inner
    have ctx : Passive ((table c.label).programContext (c.data.term table)) := by
      rw [holds c.label]
      exact holds_context_passive _ _ (c.data.normal table)
    exact ctx.oneRedex (descent_terms_single table c.data _ (normal_one (c.data.normal table)) _ bodyMember)

theorem Configuration.hold_iterate_passive (table : Label → Admissible) (lengths : Label → Nat)
    (holds : ∀ j, table j = .holds (lengths j)) (c : Configuration Label)
    (passive : Passive c.context) (n : Nat) :
    Passive (FiniteOrbit.iterate (Configuration.next table) n c).context := by
  induction n with
  | zero => exact passive
  | succ n ih => exact Configuration.hold_next_passive table lengths holds _ ih

theorem hold_path_single (table : Label → Admissible) (lengths : Label → Nat)
    (holds : ∀ j, table j = .holds (lengths j)) (c : InternalConfiguration Label)
    (passive : Passive c.val.context) (n : Nat) : OneRedex ((pathSystem table).run n c) := by
  obtain ⟨block, member⟩ := (pathSystem table).run_in_block c n
  change (pathSystem table).run n c ∈
    ((FiniteOrbit.iterate (pathSystem table).next block c).val).terms table at member
  rw [pathSystem_iterate] at member
  exact Configuration.hold_terms_single table lengths holds _
    (c.val.hold_iterate_passive table lengths holds passive block) _ member

end PureSFormal.AppendixF.RecursiveCall

namespace PureSFormal.AppendixF.HeadInvariant
open PureSFormal.PureS

theorem all_reducts_on_path (run : Nat → Term) (steps : ∀ n, Step (run n) (run (n + 1)))
    (single : ∀ n, OneRedex (run n)) {t : Term} (reaches : Steps (run 0) t) :
    ∃ n, t = run n := by
  induction reaches with
  | refl => exact ⟨0, rfl⟩
  | tail segment edge ih =>
    obtain ⟨n, same⟩ := ih
    rw [same] at edge
    exact ⟨n + 1, (single n).unique edge (steps n)⟩

end PureSFormal.AppendixF.HeadInvariant
