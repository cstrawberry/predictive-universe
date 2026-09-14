import PureSFormal.PureS.Reduction
import PureSFormal.Research.FiniteTreeAutomatonPowerset
import PureSFormal.AppendixF.FiniteOrbit
import PureSFormal.AppendixF.FiniteTables

/-! Literal carrier syntax, native blocks, and their exact finite observations.
All parameters are arbitrary closed terms; none is assumed normal. -/
namespace PureSFormal.AppendixF.Carrier
open PureSFormal.PureS
open PureSFormal.Research.FiniteTreeAutomatonPowerset
set_option maxRecDepth 10000
set_option maxHeartbeats 1000000

local infixl:70 " ⊙ " => Term.app

inductive Code where
  | base (u v : Term)
  | tag (p : Term) (rest : Code)
  deriving DecidableEq, Repr

def Code.term : Code → Term
  | .base u v => .s ⊙ (.s ⊙ u) ⊙ (.s ⊙ v)
  | .tag p rest => .s ⊙ p ⊙ rest.term

def Code.leftBase : Code → Term
  | .base u _ => u
  | .tag _ rest => rest.leftBase

def Code.rightBase : Code → Term
  | .base _ v => v
  | .tag _ rest => rest.rightBase

@[simp] theorem Code.arity (code : Code) : code.term.headArity = 2 := by
  cases code <;> rfl

theorem Code.term_injective : ∀ {left right : Code}, left.term = right.term → left = right := by
  intro left
  induction left with
  | base u v =>
    intro right same
    cases right with
    | base a b =>
      have hu := (Term.app.inj (Term.app.inj same).1).2
      have hv := (Term.app.inj same).2
      have ueq := (Term.app.inj hu).2
      have veq := (Term.app.inj hv).2
      cases ueq; cases veq; rfl
    | tag p rest =>
      have arity := congrArg Term.headArity (Term.app.inj same).2
      simp only [Term.headArity, Code.arity] at arity
      omega
  | tag p rest ih =>
    intro right same
    cases right with
    | base u v =>
      have arity := congrArg Term.headArity (Term.app.inj same).2
      simp only [Term.headArity, Code.arity] at arity
      omega
    | tag q tail =>
      have pair := Term.app.inj same
      have params := (Term.app.inj pair.1).2
      have tails := ih pair.2
      cases params; cases tails; rfl

/-- Each list entry is the source of one native step. The final endpoint is
excluded and will be the following block's initial observation. -/
inductive Trace : Term → List Term → Term → Prop where
  | nil (term : Term) : Trace term [] term
  | cons {first next last : Term} {rest : List Term} :
      Step first next → Trace next rest last → Trace first (first :: rest) last

theorem Trace.inContext {first last : Term} {terms : List Term}
    (trace : Trace first terms last) (context : Context) :
    Trace (context.plug first) (terms.map context.plug) (context.plug last) := by
  induction trace with
  | nil => exact .nil _
  | cons edge rest ih => exact .cons (edge.inContext context) ih

theorem Trace.steps {first last : Term} {terms : List Term}
    (trace : Trace first terms last) : Steps first last := by
  induction trace with
  | nil => exact .refl _
  | cons edge _ ih => exact (Steps.single edge).trans ih

def tagContext (p : Term) (right : Code) : Context :=
  .appRight (p ⊙ right.term) .hole

def Code.blockContext : Code → Code → Context
  | .base u v, right => .appRight (u ⊙ (.s ⊙ v ⊙ right.term)) .hole
  | .tag p rest, right => (tagContext p right).comp (rest.blockContext right)

def Code.blockTerms : Code → Code → List Term
  | .base u v, right =>
      [(Code.base u v).term ⊙ right.term,
       (.s ⊙ u ⊙ right.term) ⊙ (.s ⊙ v ⊙ right.term)]
  | .tag p rest, right =>
      (Code.tag p rest).term ⊙ right.term ::
        (rest.blockTerms right).map (tagContext p right).plug

def Code.nextPair (left right : Code) : Term :=
  right.term ⊙ (Code.tag left.rightBase right).term

theorem Code.block_native (left right : Code) :
    Trace (left.term ⊙ right.term) (left.blockTerms right)
      ((left.blockContext right).plug (left.nextPair right)) := by
  induction left with
  | base u v =>
    exact .cons (Step.root (.s ⊙ u) (.s ⊙ v) right.term)
      (.cons (Step.root u right.term (.s ⊙ v ⊙ right.term)) (.nil _))
  | tag p rest ih =>
    exact .cons (Step.root p rest.term right.term) (ih.inContext (tagContext p right))

theorem Code.block_positive (left right : Code) : 2 ≤ (left.blockTerms right).length := by
  induction left with
  | base => exact Nat.le_refl _
  | tag p rest ih => simp only [Code.blockTerms, List.length_cons, List.length_map]; omega

def contextState (automaton : Deterministic State) : Context → State → State
  | .hole, value => value
  | .appLeft context right, value => automaton.branch (contextState automaton context value) (automaton.eval right)
  | .appRight left context, value => automaton.branch (automaton.eval left) (contextState automaton context value)

theorem eval_plug (automaton : Deterministic State) (context : Context) (term : Term) :
    automaton.eval (context.plug term) = contextState automaton context (automaton.eval term) := by
  induction context with
  | hole => rfl
  | appLeft context right ih => exact congrArg (fun x => automaton.branch x (automaton.eval right)) ih
  | appRight left context ih => exact congrArg (automaton.branch (automaton.eval left)) ih

theorem contextState_comp (automaton : Deterministic State) (outer inner : Context) :
    contextState automaton (outer.comp inner) =
      contextState automaton outer ∘ contextState automaton inner := by
  funext value
  induction outer with
  | hole => rfl
  | appLeft outer right ih => exact congrArg (fun x => automaton.branch x (automaton.eval right)) ih
  | appRight left outer ih => exact congrArg (automaton.branch (automaton.eval left)) ih

/-- Finite summaries retain functions and Boolean observation sets. -/
structure Summary (State : Type) where
  value : State
  left : State
  right : State
  tags : State → State → State
  observations : State → State → Bool

def baseSummary [DecidableEq State] (automaton : Deterministic State) (u v : State) : Summary State where
  value := automaton.branch (automaton.branch automaton.leaf (automaton.branch automaton.leaf u))
    (automaton.branch automaton.leaf v)
  left := u
  right := v
  tags _ := id
  observations b z := decide (z = automaton.branch
      (automaton.branch (automaton.branch automaton.leaf (automaton.branch automaton.leaf u))
        (automaton.branch automaton.leaf v)) b) ||
    decide (z = automaton.branch (automaton.branch (automaton.branch automaton.leaf u) b)
      (automaton.branch (automaton.branch automaton.leaf v) b))

def tagSummary [DecidableEq State] (automaton : Deterministic State) (p : State)
    (rest : Summary State) : Summary State where
  value := automaton.branch (automaton.branch automaton.leaf p) rest.value
  left := rest.left
  right := rest.right
  tags b z := automaton.branch (automaton.branch p b) (rest.tags b z)
  observations b z := decide (z = automaton.branch
    (automaton.branch (automaton.branch automaton.leaf p) rest.value) b) ||
    automaton.cover.any (fun y => rest.observations b y &&
      decide (z = automaton.branch (automaton.branch p b) y))

def summarize [DecidableEq State] (automaton : Deterministic State) : Code → Summary State
  | .base u v => baseSummary automaton (automaton.eval u) (automaton.eval v)
  | .tag p rest => tagSummary automaton (automaton.eval p) (summarize automaton rest)

@[simp] theorem summarize_value [DecidableEq State] (automaton : Deterministic State) (code : Code) :
    (summarize automaton code).value = automaton.eval code.term := by
  induction code with
  | base => rfl
  | tag p rest ih => exact congrArg (automaton.branch (automaton.branch automaton.leaf (automaton.eval p))) ih

@[simp] theorem summarize_left [DecidableEq State] (automaton : Deterministic State) (code : Code) :
    (summarize automaton code).left = automaton.eval code.leftBase := by
  induction code with
  | base => rfl
  | tag p rest ih => exact ih

@[simp] theorem summarize_right [DecidableEq State] (automaton : Deterministic State) (code : Code) :
    (summarize automaton code).right = automaton.eval code.rightBase := by
  induction code with
  | base => rfl
  | tag p rest ih => exact ih

theorem summarize_observations [DecidableEq State] (automaton : Deterministic State)
    (left right : Code) (z : State) :
    (summarize automaton left).observations (automaton.eval right.term) z = true ↔
      ∃ term, term ∈ left.blockTerms right ∧ automaton.eval term = z := by
  induction left generalizing z with
  | base u v =>
    simp only [summarize, baseSummary, Bool.or_eq_true, decide_eq_true_eq,
      Code.blockTerms, List.mem_cons, List.not_mem_nil, or_false]
    constructor
    · intro hit
      cases hit with
      | inl eq => exact ⟨_, Or.inl rfl, eq.symm⟩
      | inr eq => exact ⟨_, Or.inr rfl, eq.symm⟩
    · rintro ⟨term, hit, eq⟩
      cases hit with
      | inl hit => subst term; exact Or.inl eq.symm
      | inr hit => subst term; exact Or.inr eq.symm
  | tag p rest ih =>
    simp only [summarize, tagSummary, Bool.or_eq_true, decide_eq_true_eq,
      List.any_eq_true, Bool.and_eq_true, Code.blockTerms, List.mem_cons]
    constructor
    · intro hit
      cases hit with
      | inl eq =>
        refine ⟨_, Or.inl rfl, ?_⟩
        simpa only [Code.term, Deterministic.eval, summarize_value] using eq.symm
      | inr hit =>
        obtain ⟨y, _, yes, eq⟩ := hit
        obtain ⟨term, member, value⟩ := (ih y).mp yes
        refine ⟨(tagContext p right).plug term, Or.inr (List.mem_map.mpr ⟨term, member, rfl⟩), ?_⟩
        exact (congrArg (automaton.branch (automaton.branch (automaton.eval p) (automaton.eval right.term))) value).trans eq.symm
    · rintro ⟨term, hit, value⟩
      cases hit with
      | inl hit =>
        subst term
        exact Or.inl (by simpa only [Code.term, Deterministic.eval, summarize_value] using value.symm)
      | inr hit =>
        obtain ⟨inner, member, eq⟩ := List.mem_map.mp hit
        subst term
        exact Or.inr ⟨automaton.eval inner, automaton.covers _, (ih _).mpr ⟨inner, member, rfl⟩, value.symm⟩

theorem summarize_context [DecidableEq State] (automaton : Deterministic State)
    (left right : Code) (z : State) :
    contextState automaton (left.blockContext right) z =
      (summarize automaton left).tags (automaton.eval right.term)
        (automaton.branch (automaton.branch (summarize automaton left).left
          (automaton.branch (automaton.branch automaton.leaf (summarize automaton left).right)
            (automaton.eval right.term))) z) := by
  induction left with
  | base => rfl
  | tag p rest ih =>
    change automaton.branch (automaton.branch (automaton.eval p) (automaton.eval right.term))
      (contextState automaton (rest.blockContext right) z) = _
    exact congrArg (automaton.branch (automaton.branch (automaton.eval p) (automaton.eval right.term))) ih

structure Configuration where
  left : Code
  right : Code
  context : Context

def Configuration.term (c : Configuration) : Term := c.context.plug (c.left.term ⊙ c.right.term)

def Configuration.terms (c : Configuration) : List Term :=
  (c.left.blockTerms c.right).map c.context.plug

def Configuration.next (c : Configuration) : Configuration where
  left := c.right
  right := .tag c.left.rightBase c.right
  context := c.context.comp (c.left.blockContext c.right)

theorem Configuration.native (c : Configuration) : Trace c.term c.terms c.next.term := by
  simpa only [Configuration.term, Configuration.terms, Configuration.next,
    Context.plug_comp, Code.nextPair] using (c.left.block_native c.right).inContext c.context

theorem Configuration.positive (c : Configuration) : 2 ≤ c.terms.length := by
  simpa only [Configuration.terms, List.length_map] using c.left.block_positive c.right

structure Observation (State : Type) where
  left : Summary State
  right : Summary State
  context : State → State

def observation [DecidableEq State] (automaton : Deterministic State) (c : Configuration) : Observation State where
  left := summarize automaton c.left
  right := summarize automaton c.right
  context := contextState automaton c.context

def Observation.next [DecidableEq State] (automaton : Deterministic State)
    (o : Observation State) : Observation State where
  left := o.right
  right := tagSummary automaton o.left.right o.right
  context z := o.context (o.left.tags o.right.value
    (automaton.branch (automaton.branch o.left.left
      (automaton.branch (automaton.branch automaton.leaf o.left.right) o.right.value)) z))

def Observation.accepts (automaton : Deterministic State) (o : Observation State) : Bool :=
  automaton.cover.any (fun z => o.left.observations o.right.value z && automaton.final (o.context z))

theorem observation_next [DecidableEq State] (automaton : Deterministic State) (c : Configuration) :
    observation automaton c.next = (observation automaton c).next automaton := by
  cases c with
  | mk left right context =>
    simp only [observation, Configuration.next, Observation.next, summarize, summarize_right]
    congr 1
    funext z
    rw [contextState_comp]
    change contextState automaton context (contextState automaton (left.blockContext right) z) = _
    rw [summarize_context, ← summarize_value]
    simp only [summarize_right]

theorem observation_accepts [DecidableEq State] (automaton : Deterministic State) (c : Configuration) :
    (observation automaton c).accepts automaton = true ↔
      ∃ term, term ∈ c.terms ∧ automaton.accepts term = true := by
  simp only [Observation.accepts, observation, summarize_value, List.any_eq_true, Bool.and_eq_true]
  constructor
  · rintro ⟨z, _, yes, final⟩
    obtain ⟨term, member, value⟩ := (summarize_observations automaton c.left c.right z).mp yes
    refine ⟨c.context.plug term, List.mem_map.mpr ⟨term, member, rfl⟩, ?_⟩
    simpa only [Deterministic.accepts, eval_plug, value] using final
  · rintro ⟨term, member, final⟩
    obtain ⟨inner, mem, same⟩ := List.mem_map.mp member
    subst term
    refine ⟨automaton.eval inner, automaton.covers _,
      (summarize_observations automaton c.left c.right _).mpr ⟨inner, mem, rfl⟩, ?_⟩
    simpa only [Deterministic.accepts, eval_plug] using final

abbrev Summary.Tuple (State : Type) :=
  State × State × State × (State → State → State) × (State → State → Bool)

def Summary.encode (s : Summary State) : Summary.Tuple State :=
  (s.value, s.left, s.right, s.tags, s.observations)

def Summary.decode (t : Summary.Tuple State) : Summary State :=
  ⟨t.1, t.2.1, t.2.2.1, t.2.2.2.1, t.2.2.2.2⟩

theorem Summary.inverse (s : Summary State) : Summary.decode s.encode = s := by cases s; rfl

def Summary.enumeration [DecidableEq State] (automaton : Deterministic State) :
    FiniteTables.Enumeration (Summary State) := by
  let q : FiniteTables.Enumeration State := ⟨automaton.cover, automaton.covers⟩
  let maps := FiniteTables.functions q q automaton.leaf
  let tables := FiniteTables.functions q maps (fun _ => automaton.leaf)
  let sets := FiniteTables.functions q FiniteTables.boolean false
  let observations := FiniteTables.functions q sets (fun _ => false)
  exact FiniteTables.transport
    (FiniteTables.product q (FiniteTables.product q (FiniteTables.product q
      (FiniteTables.product tables observations)))) Summary.encode Summary.decode Summary.inverse

def Summary.equality [DecidableEq State] (automaton : Deterministic State) : DecidableEq (Summary State) := by
  let q : FiniteTables.Enumeration State := ⟨automaton.cover, automaton.covers⟩
  letI : DecidableEq (State → State) := FiniteTables.functionEquality q
  letI : DecidableEq (State → State → State) := FiniteTables.functionEquality q
  letI : DecidableEq (State → Bool) := FiniteTables.functionEquality q
  letI : DecidableEq (State → State → Bool) := FiniteTables.functionEquality q
  exact FiniteTables.equality Summary.encode Summary.decode Summary.inverse

def Observation.encode (o : Observation State) := (o.left, o.right, o.context)
def Observation.decode (t : Summary State × Summary State × (State → State)) : Observation State :=
  ⟨t.1, t.2.1, t.2.2⟩
theorem Observation.inverse (o : Observation State) : Observation.decode o.encode = o := by cases o; rfl

def Observation.enumeration [DecidableEq State] (automaton : Deterministic State) :
    FiniteTables.Enumeration (Observation State) := by
  let q : FiniteTables.Enumeration State := ⟨automaton.cover, automaton.covers⟩
  let summaries := Summary.enumeration automaton
  exact FiniteTables.transport (FiniteTables.product summaries
    (FiniteTables.product summaries (FiniteTables.functions q q automaton.leaf)))
    Observation.encode Observation.decode Observation.inverse

def Observation.equality [DecidableEq State] (automaton : Deterministic State) :
    DecidableEq (Observation State) := by
  let q : FiniteTables.Enumeration State := ⟨automaton.cover, automaton.covers⟩
  letI : DecidableEq (State → State) := FiniteTables.functionEquality q
  letI : DecidableEq (Summary State) := Summary.equality automaton
  exact FiniteTables.equality Observation.encode Observation.decode Observation.inverse

def eventuallyAccepts [DecidableEq State] (automaton : Deterministic State) (c : Configuration) : Bool :=
  FiniteOrbit.acceptsWithin (Observation.next automaton) (Observation.accepts automaton)
    (Observation.enumeration automaton).values.length (observation automaton c)

theorem observation_iterate [DecidableEq State] (automaton : Deterministic State) (c : Configuration) (n : Nat) :
    observation automaton (FiniteOrbit.iterate Configuration.next n c) =
      FiniteOrbit.iterate (Observation.next automaton) n (observation automaton c) := by
  induction n with
  | zero => rfl
  | succ n ih =>
    change observation automaton (FiniteOrbit.iterate Configuration.next n c).next = _
    rw [observation_next, ih]
    rfl

/-- Proposition F.3.1's effective decision and its exact all-block agreement.
`Configuration.native` and `.positive` certify all the observed native steps. -/
theorem eventuallyAccepts_correct [DecidableEq State] (automaton : Deterministic State) (c : Configuration) :
    eventuallyAccepts automaton c = true ↔
      ∃ n term, term ∈ (FiniteOrbit.iterate Configuration.next n c).terms ∧
        automaton.accepts term = true := by
  letI : DecidableEq (Observation State) := Observation.equality automaton
  rw [eventuallyAccepts, FiniteOrbit.acceptsWithin_iff _ _ _ (Observation.enumeration automaton).covers]
  constructor
  · rintro ⟨n, yes⟩
    rw [← observation_iterate] at yes
    obtain ⟨term, member, accepted⟩ := (observation_accepts automaton _).mp yes
    exact ⟨n, term, member, accepted⟩
  · rintro ⟨n, term, member, accepted⟩
    refine ⟨n, ?_⟩
    rw [← observation_iterate]
    exact (observation_accepts automaton _).mpr ⟨term, member, accepted⟩

end PureSFormal.AppendixF.Carrier
