import PureSFormal.AppendixF.CarrierPath

/-! Native continuation and coverage of the avoiding-occurrence language.
Its effective finite-tree recognizer is supplied separately. -/
namespace PureSFormal.AppendixF.Carrier
open PureSFormal.PureS
open PureSFormal.Research.FiniteTreeAutomatonPowerset
local infixl:70 " ⊙ " => Term.app
set_option maxHeartbeats 1000000

theorem context_comp_assoc (a b c : Context) : (a.comp b).comp c = a.comp (b.comp c) := by
  induction a with
  | hole => rfl
  | appLeft a right ih => exact congrArg (fun ctx => Context.appLeft ctx right) ih
  | appRight left a ih => exact congrArg (Context.appRight left) ih

def Now (a : Deterministic State) (c : Configuration) : Prop :=
  ∃ term, term ∈ c.terms ∧ a.accepts term = true

def Observes (a : Deterministic State) (c : Configuration) : Prop :=
  ∃ n, Now a (FiniteOrbit.iterate Configuration.next n c)

theorem observes_unfold (a : Deterministic State) (c : Configuration) :
    Observes a c ↔ Now a c ∨ Observes a c.next := by
  constructor
  · rintro ⟨n, yes⟩
    cases n with
    | zero => exact Or.inl yes
    | succ n =>
      refine Or.inr ⟨n, ?_⟩
      have shift : FiniteOrbit.iterate Configuration.next (n + 1) c =
          FiniteOrbit.iterate Configuration.next n c.next := by
        rw [Nat.add_comm n 1, FiniteOrbit.iterate_add]
        rfl
      exact shift ▸ yes
  · intro yes
    cases yes with
    | inl yes => exact ⟨0, yes⟩
    | inr yes =>
      obtain ⟨n, yes⟩ := yes
      exact ⟨1 + n, by simpa only [FiniteOrbit.iterate_add, FiniteOrbit.iterate] using yes⟩

def Configuration.smallNext (c : Configuration) : Configuration :=
  match c.left with
  | .tag p rest => ⟨rest, c.right, c.context.comp (tagContext p c.right)⟩
  | .base u v => ⟨.tag u c.right, .tag v c.right, c.context⟩

theorem Configuration.smallStep (c : Configuration) : Step c.term c.smallNext.term := by
  cases c with
  | mk left right context =>
    cases left with
    | tag p rest =>
      simpa only [Configuration.term, Configuration.smallNext, Context.plug_comp,
        tagContext, Context.plug, Code.term, Term.redex, Term.contractum]
        using (Step.root p rest.term right.term).inContext context
    | base u v => exact (Step.root (.s ⊙ u) (.s ⊙ v) right.term).inContext context

theorem tag_next_same (p : Term) (rest right : Code) (context : Context) :
    (Configuration.smallNext ⟨.tag p rest, right, context⟩).next =
      (Configuration.next ⟨.tag p rest, right, context⟩) := by
  simp only [Configuration.smallNext, Configuration.next, Code.rightBase, Code.blockContext,
    context_comp_assoc]

theorem tag_terms (p : Term) (rest right : Code) (context : Context) :
    (Configuration.terms ⟨.tag p rest, right, context⟩) =
      (Configuration.term ⟨.tag p rest, right, context⟩) ::
        (Configuration.terms (Configuration.smallNext ⟨.tag p rest, right, context⟩)) := by
  simp only [Configuration.terms, Configuration.term, Configuration.smallNext,
    Code.blockTerms, List.map_cons, List.map_map]
  congr 1
  apply List.map_congr_left
  intro term _
  exact (Context.plug_comp _ _ _).symm

theorem tag_observes (a : Deterministic State) (p : Term) (rest right : Code) (context : Context) :
    Observes a ⟨.tag p rest, right, context⟩ ↔
      a.accepts (Configuration.term ⟨.tag p rest, right, context⟩) = true ∨
        Observes a (Configuration.smallNext ⟨.tag p rest, right, context⟩) := by
  rw [observes_unfold a ⟨.tag p rest, right, context⟩,
    observes_unfold a (Configuration.smallNext ⟨.tag p rest, right, context⟩), tag_next_same]
  have now : Now a ⟨.tag p rest, right, context⟩ ↔
      a.accepts (Configuration.term ⟨.tag p rest, right, context⟩) = true ∨
        Now a (Configuration.smallNext ⟨.tag p rest, right, context⟩) := by
    unfold Now
    rw [tag_terms]
    simp only [List.mem_cons]
    constructor
    · rintro ⟨term, same | member, yes⟩
      · exact Or.inl (same ▸ yes)
      · exact Or.inr ⟨term, member, yes⟩
    · intro yes
      cases yes with
      | inl yes => exact ⟨_, Or.inl rfl, yes⟩
      | inr yes => obtain ⟨term, member, yes⟩ := yes; exact ⟨term, Or.inr member, yes⟩
  rw [now, or_assoc]

theorem smallNext_observes_implies (a : Deterministic State) (c : Configuration) :
    Observes a c.smallNext → Observes a c := by
  cases c with
  | mk left right context =>
    cases left with
    | tag p rest => exact fun yes => (tag_observes a p rest right context).mpr (Or.inr yes)
    | base u v =>
      intro yes
      change Observes a ⟨.tag u right, .tag v right, context⟩ at yes
      rw [tag_observes] at yes
      cases yes with
      | inl accepted =>
        apply (observes_unfold a ⟨.base u v, right, context⟩).mpr
        apply Or.inl
        refine ⟨_, ?_, accepted⟩
        exact List.mem_map.mpr ⟨_, List.Mem.tail _ (List.Mem.head _), rfl⟩
      | inr accepted =>
        apply (observes_unfold a ⟨.base u v, right, context⟩).mpr
        exact Or.inr accepted

def Avoiding (a : Deterministic State) (term : Term) : Prop :=
  ∃ c : Configuration, c.term = term ∧ ¬ Observes a c

theorem Configuration.initial_member (c : Configuration) : c.term ∈ c.terms := by
  have positive : 0 < c.terms.length := by have := c.positive; omega
  have mem := sample_member c.next.term 0 positive
  rw [c.native.sample_zero] at mem
  exact mem

theorem avoiding_disjoint (a : Deterministic State) (term : Term) :
    Avoiding a term → a.accepts term ≠ true := by
  rintro ⟨c, same, avoids⟩ accepts
  apply avoids
  exact ⟨0, c.term, c.initial_member, same ▸ accepts⟩

theorem avoiding_continues (a : Deterministic State) (term : Term) (avoids : Avoiding a term) :
    ∃ next, Step term next ∧ Avoiding a next := by
  obtain ⟨c, same, avoids⟩ := avoids
  refine ⟨c.smallNext.term, same ▸ c.smallStep, c.smallNext, rfl, ?_⟩
  exact fun yes => avoids (smallNext_observes_implies a c yes)

theorem Configuration.run_reachable (c : Configuration) (n : Nat) : Steps c.term (c.run n) := by
  induction n with
  | zero => rw [c.run_zero]; exact .refl _
  | succ n ih => exact .tail ih (c.run_step n)

theorem avoiding_covers [DecidableEq State] (a : Deterministic State) (term : Term)
    (left right : Code) (context : Context) (shape : term = context.plug (left.term ⊙ right.term))
    (noAccept : ∀ target, Steps term target → a.accepts target ≠ true) : Avoiding a term := by
  let c : Configuration := ⟨left, right, context⟩
  refine ⟨c, shape.symm, ?_⟩
  intro observes
  have finite : eventuallyAccepts a c = true := (eventuallyAccepts_correct a c).mpr observes
  obtain ⟨n, yes⟩ := (eventuallyAccepts_path_iff a c).mp finite
  exact noAccept (c.run n) (shape ▸ c.run_reachable n) yes

end PureSFormal.AppendixF.Carrier
