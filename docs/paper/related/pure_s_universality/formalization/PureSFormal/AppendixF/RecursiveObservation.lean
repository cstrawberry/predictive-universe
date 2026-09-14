import PureSFormal.AppendixF.RecursiveCall

/-! Exact finite observation summaries for program execution and left-spine
descent. These read the whole term through its accumulated context. -/
namespace PureSFormal.AppendixF.RecursiveCall
open PureSFormal.PureS
open PureSFormal.Research.FiniteTreeAutomatonPowerset
open PureSFormal.AppendixF.Carrier (contextState eval_plug contextState_comp)
local infixl:70 " ⊙ " => Term.app
set_option maxRecDepth 10000
set_option maxHeartbeats 1000000

def programValues (a : Deterministic State) : Admissible → State → List State
  | .grow 0 tail, x =>
      [a.branch (a.eval (Admissible.grow 0 tail).term) x,
       a.branch (a.branch (a.branch a.leaf (a.eval tail.term)) x) (a.branch a.leaf x)]
  | .grow (n + 1) tail, x =>
      a.branch (a.eval (Admissible.grow (n + 1) tail).term) x ::
        (programValues a (.grow n tail) x).map (fun z => a.branch z (a.branch a.leaf x))
  | .holds 0, x =>
      [a.branch (a.eval (Admissible.holds 0).term) x,
       a.branch (a.branch (a.eval (Program.hold .stop).term) x) (a.branch a.leaf x),
       a.branch (a.branch (a.branch a.leaf x) (a.branch a.leaf x)) (a.branch a.leaf x)]
  | .holds (n + 1), x =>
      a.branch (a.eval (Admissible.holds (n + 1)).term) x ::
        (programValues a (.holds n) x).map (fun z => a.branch z (a.branch a.leaf x))

theorem programValues_exact (a : Deterministic State) (p : Admissible) (x : Term) :
    (p.programTerms x).map a.eval = programValues a p (a.eval x) := by
  cases p with
  | grow n tail =>
    induction n with
    | zero => simp only [Admissible.programTerms, programValues, List.map_cons, List.map_nil, Deterministic.eval]
    | succ n ih =>
      simp only [Admissible.programTerms, programValues, List.map_cons, List.map_map, Deterministic.eval]
      rw [← ih, List.map_map]
      rfl
  | holds n =>
    induction n with
    | zero => simp only [Admissible.programTerms, programValues, List.map_cons, List.map_nil, Deterministic.eval]
    | succ n ih =>
      simp only [Admissible.programTerms, programValues, List.map_cons, List.map_map, Deterministic.eval]
      rw [← ih, List.map_map]
      rfl

def programMap (a : Deterministic State) : Admissible → State → State → State
  | .grow 0 tail, x, z => a.branch (a.branch (a.eval tail.term) (a.branch a.leaf x)) z
  | .grow (n + 1) tail, x, z => a.branch (programMap a (.grow n tail) x z) (a.branch a.leaf x)
  | .holds 0, x, z => a.branch z (a.branch (a.branch a.leaf x) (a.branch a.leaf x))
  | .holds (n + 1), x, z => a.branch (programMap a (.holds n) x z) (a.branch a.leaf x)

theorem programMap_exact (a : Deterministic State) (p : Admissible) (x : Term) (z : State) :
    contextState a (p.programContext x) z = programMap a p (a.eval x) z := by
  cases p with
  | grow n tail =>
    induction n with
    | zero => simp only [Admissible.programContext, programMap, contextState, Deterministic.eval]
    | succ n ih =>
      simp only [Admissible.programContext, programMap, contextState, Deterministic.eval]
      exact congrArg (fun y => a.branch y (a.branch a.leaf (a.eval x))) ih
  | holds n =>
    induction n with
    | zero => simp only [Admissible.programContext, programMap, contextState, Deterministic.eval]
    | succ n ih =>
      simp only [Admissible.programContext, programMap, contextState, Deterministic.eval]
      exact congrArg (fun y => a.branch y (a.branch a.leaf (a.eval x))) ih

def imageSet [DecidableEq State] (a : Deterministic State) (f : State → State)
    (set : State → Bool) (z : State) : Bool :=
  a.cover.any (fun y => set y && decide (z = f y))

theorem imageSet_iff [DecidableEq State] (a : Deterministic State) (f : State → State)
    (set : State → Bool) (z : State) :
    imageSet a f set z = true ↔ ∃ y, set y = true ∧ f y = z := by
  simp only [imageSet, List.any_eq_true, Bool.and_eq_true, decide_eq_true_eq]
  constructor
  · rintro ⟨y, _, yes, eq⟩; exact ⟨y, yes, eq.symm⟩
  · rintro ⟨y, yes, eq⟩; exact ⟨y, a.covers y, yes, eq.symm⟩

structure DataSummary (Label State : Type) where
  value : State
  internal : Bool
  label : Label
  rightmost : State
  observations : State → State → Bool
  context : State → State → State

def leafSummary (a : Deterministic State) (table : Label → Admissible) (j : Label) : DataSummary Label State where
  value := a.branch a.leaf (a.eval (table j).term)
  internal := false
  label := j
  rightmost := a.branch a.leaf (a.eval (table j).term)
  observations _ _ := false
  context _ := id

def nodeSummary [DecidableEq State] (a : Deterministic State)
    (left right : DataSummary Label State) : DataSummary Label State where
  value := a.branch (a.branch a.leaf left.value) (a.branch a.leaf right.value)
  internal := true
  label := left.label
  rightmost := if left.internal then left.rightmost else right.value
  observations b z :=
    decide (z = a.branch (a.branch (a.branch a.leaf left.value) (a.branch a.leaf right.value)) b) ||
    if left.internal then
      imageSet a (fun y => a.branch y (a.branch (a.branch a.leaf right.value) b))
        (left.observations b) z
    else decide (z = a.branch (a.branch left.value b) (a.branch (a.branch a.leaf right.value) b))
  context b z :=
    if left.internal then a.branch (left.context b z) (a.branch (a.branch a.leaf right.value) b)
    else a.branch z (a.branch b (a.branch (a.branch a.leaf right.value) b))

def dataSummary [DecidableEq State] (a : Deterministic State) (table : Label → Admissible) :
    Data Label → DataSummary Label State
  | .leaf j => leafSummary a table j
  | .node left right => nodeSummary a (dataSummary a table left) (dataSummary a table right)

@[simp] theorem dataSummary_value [DecidableEq State] (a : Deterministic State)
    (table : Label → Admissible) (x : Data Label) :
    (dataSummary a table x).value = a.eval (x.term table) := by
  induction x with
  | leaf => rfl
  | node left right ihl ihr =>
    simp only [dataSummary, nodeSummary, Data.term, Deterministic.eval, ihl, ihr]

@[simp] theorem dataSummary_internal [DecidableEq State] (a : Deterministic State)
    (table : Label → Admissible) (x : Data Label) :
    (dataSummary a table x).internal = x.internal := by cases x <;> rfl

@[simp] theorem dataSummary_label [DecidableEq State] (a : Deterministic State)
    (table : Label → Admissible) (x : Data Label) :
    (dataSummary a table x).label = x.label := by
  induction x with
  | leaf => rfl
  | node left right ih _ => exact ih

@[simp] theorem dataSummary_rightmost [DecidableEq State] (a : Deterministic State)
    (table : Label → Admissible) (x : Data Label) :
    (dataSummary a table x).rightmost = a.eval (x.rightmost.term table) := by
  induction x with
  | leaf => rfl
  | node left right ih _ =>
    cases left with
    | leaf j => exact dataSummary_value a table right
    | node l r => exact ih

theorem dataSummary_context [DecidableEq State] (a : Deterministic State)
    (table : Label → Admissible) (x : Data Label) (b : Term) (z : State) :
    contextState a (x.descentContext table b) z =
      (dataSummary a table x).context (a.eval b) z := by
  induction x with
  | leaf => rfl
  | node left right ih _ =>
    cases left with
    | leaf j =>
      simp only [Data.descentContext, contextState, dataSummary, nodeSummary,
        leafSummary, Bool.false_eq_true, if_false, dataSummary_value, Deterministic.eval]
    | node l r =>
      change a.branch (contextState a ((Data.node l r).descentContext table b) z)
        (a.eval (.s ⊙ right.term table ⊙ b)) = _
      rw [ih]
      simp only [dataSummary, nodeSummary, if_true, dataSummary_value, Deterministic.eval]

theorem dataSummary_observations [DecidableEq State] (a : Deterministic State)
    (table : Label → Admissible) (x : Data Label) (b : Term) (z : State)
    (internal : x.internal = true) :
    (dataSummary a table x).observations (a.eval b) z = true ↔
      ∃ term, term ∈ x.descentTerms table b ∧ a.eval term = z := by
  induction x generalizing z with
  | leaf => cases internal
  | node left right ih _ =>
    cases left with
    | leaf j =>
      simp only [dataSummary, nodeSummary, leafSummary, Bool.false_eq_true, if_false,
        dataSummary_value, Bool.or_eq_true, decide_eq_true_eq,
        Data.descentTerms, List.mem_cons, List.not_mem_nil, or_false]
      constructor
      · intro hit
        cases hit with
        | inl eq => exact ⟨_, Or.inl rfl, eq.symm⟩
        | inr eq => exact ⟨_, Or.inr rfl, eq.symm⟩
      · rintro ⟨term, hit, eq⟩
        cases hit with
        | inl same => subst term; exact Or.inl eq.symm
        | inr same => subst term; exact Or.inr eq.symm
    | node l r =>
      simp only [dataSummary, nodeSummary, if_true, dataSummary_value,
        Bool.or_eq_true, decide_eq_true_eq, imageSet_iff,
        Data.descentTerms, List.mem_cons]
      constructor
      · intro hit
        cases hit with
        | inl eq => exact ⟨_, Or.inl rfl, eq.symm⟩
        | inr hit =>
          obtain ⟨y, yes, eq⟩ := hit
          have full : (dataSummary a table (Data.node l r)).observations (a.eval b) y = true := by
            simpa only [dataSummary, nodeSummary, dataSummary_value, Bool.or_eq_true, decide_eq_true_eq] using yes
          obtain ⟨term, member, value⟩ := (ih y rfl).mp full
          refine ⟨term ⊙ (.s ⊙ right.term table ⊙ b),
            Or.inr (List.mem_map.mpr ⟨term, member, rfl⟩), ?_⟩
          exact (congrArg (fun v => a.branch v (a.eval (.s ⊙ right.term table ⊙ b))) value).trans eq
      · rintro ⟨term, hit, value⟩
        cases hit with
        | inl same => subst term; exact Or.inl value.symm
        | inr member =>
          obtain ⟨inner, mem, eq⟩ := List.mem_map.mp member
          subst term
          refine Or.inr ⟨a.eval inner, ?_, value⟩
          simpa only [dataSummary, nodeSummary, dataSummary_value, Bool.or_eq_true, decide_eq_true_eq]
            using (ih _ rfl).mpr ⟨inner, mem, rfl⟩

structure Observation (Label State : Type) where
  label : Label
  data : DataSummary Label State
  context : State → State

def observation [DecidableEq State] (a : Deterministic State) (table : Label → Admissible)
    (c : Configuration Label) : Observation Label State :=
  ⟨c.label, dataSummary a table c.data, contextState a c.context⟩

def Observation.next [DecidableEq State] (a : Deterministic State)
    (table : Label → Admissible) (rightmost : DataSummary Label State)
    (o : Observation Label State) : Observation Label State where
  label := o.data.label
  data := nodeSummary a rightmost o.data
  context z := o.context (programMap a (table o.label) o.data.value
    (o.data.context (a.branch a.leaf o.data.value) z))

def Observation.accepts [DecidableEq State] (a : Deterministic State)
    (table : Label → Admissible) (o : Observation Label State) : Bool :=
  (programValues a (table o.label) o.data.value).any (fun z => a.final (o.context z)) ||
    a.cover.any (fun z => o.data.observations (a.branch a.leaf o.data.value) z &&
      a.final (o.context (programMap a (table o.label) o.data.value z)))

theorem observation_next [DecidableEq State] (a : Deterministic State)
    (table : Label → Admissible) (c : Configuration Label) :
    observation a table (c.next table) =
      (observation a table c).next a table (dataSummary a table c.data.rightmost) := by
  cases c with
  | mk label data context =>
    simp only [observation, Configuration.next, Observation.next, dataSummary_label,
      Data.feedback, dataSummary]
    congr 1
    funext z
    rw [contextState_comp, contextState_comp]
    change contextState a context (contextState a ((table label).programContext (data.term table))
      (contextState a (data.descentContext table (.s ⊙ data.term table)) z)) = _
    rw [programMap_exact, dataSummary_context]
    simp only [dataSummary_value, Deterministic.eval]

theorem observation_accepts [DecidableEq State] (a : Deterministic State)
    (table : Label → Admissible) (c : Configuration Label) (internal : c.data.internal = true) :
    (observation a table c).accepts a table = true ↔
      ∃ term, term ∈ c.terms table ∧ a.accepts term = true := by
  simp only [Observation.accepts, observation, dataSummary_value,
    Bool.or_eq_true, List.any_eq_true, Bool.and_eq_true]
  constructor
  · intro yes
    cases yes with
    | inl yes =>
      obtain ⟨z, member, final⟩ := yes
      rw [← programValues_exact a (table c.label) (c.data.term table)] at member
      obtain ⟨term, mem, value⟩ := List.mem_map.mp member
      refine ⟨c.context.plug term, List.mem_map.mpr ⟨term, List.mem_append_left _ mem, rfl⟩, ?_⟩
      simpa only [Deterministic.accepts, eval_plug, value] using final
    | inr yes =>
      obtain ⟨z, _, member, final⟩ := yes
      obtain ⟨term, mem, value⟩ :=
        (dataSummary_observations a table c.data (.s ⊙ c.data.term table) z internal).mp member
      let p := (table c.label).programContext (c.data.term table)
      refine ⟨c.context.plug (p.plug term),
        List.mem_map.mpr ⟨p.plug term, List.mem_append_right _ (List.mem_map.mpr ⟨term, mem, rfl⟩), rfl⟩, ?_⟩
      simpa only [Deterministic.accepts, eval_plug, p, programMap_exact, value] using final
  · rintro ⟨term, member, final⟩
    obtain ⟨inner, mem, same⟩ := List.mem_map.mp member
    subst term
    cases List.mem_append.mp mem with
    | inl member =>
      refine Or.inl ⟨a.eval inner, ?_, ?_⟩
      · rw [← programValues_exact a (table c.label) (c.data.term table)]
        exact List.mem_map.mpr ⟨inner, member, rfl⟩
      · simpa only [Deterministic.accepts, eval_plug] using final
    | inr member =>
      obtain ⟨body, bodyMem, bodySame⟩ := List.mem_map.mp member
      subst inner
      refine Or.inr ⟨a.eval body, a.covers _,
        (dataSummary_observations a table c.data (.s ⊙ c.data.term table) _ internal).mpr ⟨body, bodyMem, rfl⟩, ?_⟩
      simpa only [Deterministic.accepts, eval_plug, programMap_exact] using final

end PureSFormal.AppendixF.RecursiveCall
