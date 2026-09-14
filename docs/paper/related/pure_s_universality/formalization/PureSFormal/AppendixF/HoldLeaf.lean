import PureSFormal.AppendixF.HoldCarrierExclusion

/-! The leaf-data case of Lemma F.4.1 enters the internal-data invariant after
one positive native macro. Its retained arguments are all normal. -/
namespace PureSFormal.AppendixF.RecursiveCall
open PureSFormal.PureS PureSFormal.AppendixF.HeadInvariant
open PureSFormal.AppendixF.Carrier (Trace)
local infixl:70 " ⊙ " => Term.app
set_option maxHeartbeats 1000000

def holdWrappers : Nat → Term → Context
  | 0, _ => .hole
  | n + 1, x => .appLeft (holdWrappers n x) (.s ⊙ x)

theorem holdWrappers_passive (n : Nat) (x : Term) (normal : Normal x) : Passive (holdWrappers n x) := by
  induction n with
  | zero => exact .hole
  | succ n ih => exact .app ih (normal_one normal)

theorem holds_context_shape (n : Nat) (x : Term) :
    (Admissible.holds n).programContext x =
      (holdWrappers n x).comp (.appLeft .hole ((.s ⊙ x) ⊙ (.s ⊙ x))) := by
  induction n with
  | zero => simp only [Admissible.programContext, holdWrappers, Context.comp]
  | succ n ih =>
    simp only [Admissible.programContext, holdWrappers, Context.comp]
    exact congrArg (fun ctx => Context.appLeft ctx (.s ⊙ x)) ih

def leafEndpoint (table : Label → Admissible) (n : Nat) (j : Label) (outer : Context) : Configuration Label :=
  let x := (Data.leaf j).term table
  let b := .s ⊙ x
  ⟨j, .node (.leaf j) (.leaf j),
    outer.comp ((holdWrappers n x).comp (.appLeft .hole (b ⊙ (b ⊙ b))))⟩

def leafTerms (table : Label → Admissible) (n : Nat) (j : Label) (outer : Context) : List Term :=
  let x := (Data.leaf j).term table
  ((Admissible.holds n).programTerms x ++
    [((Admissible.holds n).programContext x).plug (x ⊙ (.s ⊙ x))]).map outer.plug

theorem leaf_native (table : Label → Admissible) (n : Nat) (j : Label) (outer : Context) :
    Trace (outer.plug ((Admissible.holds n).term ⊙ (Data.leaf j).term table))
      (leafTerms table n j outer) ((leafEndpoint table n j outer).term table) := by
  let x := (Data.leaf j).term table
  let b := .s ⊙ x
  have program := (Admissible.holds n).program_native x
  rw [holds_context_shape, Context.plug_comp] at program
  have edge := (Step.root (table j).term b (b ⊙ b)).inContext (holdWrappers n x)
  have whole := (trace_append program (.cons edge (.nil _))).inContext outer
  simpa only [leafTerms, leafEndpoint, Configuration.term, Data.term, Context.plug_comp,
    holds_context_shape, Context.plug, Term.contractum, x, b] using whole

theorem leaf_endpoint_passive (table : Label → Admissible) (n : Nat) (j : Label) (outer : Context)
    (passive : Passive outer) : Passive (leafEndpoint table n j outer).context := by
  let x := (Data.leaf j).term table
  have xn : Normal x := (Data.leaf j).normal table
  have bn := normal_one xn
  have bb := Normal.app bn bn (by change 1 < 2; decide)
  exact passive.comp ((holdWrappers_passive n x xn).comp
    (.app .hole (.app bn bb (by change 1 < 2; decide))))

theorem leaf_terms_good (table : Label → Admissible) (n : Nat) (j : Label) (outer : Context)
    (passive : Passive outer) : ∀ term ∈ leafTerms table n j outer, Good term := by
  intro term member
  obtain ⟨inner, innerMember, same⟩ := List.mem_map.mp member
  subst term
  apply passive.good
  cases List.mem_append.mp innerMember with
  | inl member => exact holds_terms_good _ _ ((Data.leaf j).normal table) _ member
  | inr member =>
    have same := List.mem_singleton.mp member
    subst inner
    rw [holds_context_shape, Context.plug_comp]
    let x := (Data.leaf j).term table
    have xn : Normal x := (Data.leaf j).normal table
    have bn := normal_one xn
    have bb := Normal.app bn bn (by change 1 < 2; decide)
    exact (holdWrappers_passive n x xn).good
      (root_good (table j).normal bn bb (dispatch_not_pair _ _ _ (table j).arity rfl))

theorem leaf_terms_positive (table : Label → Admissible) (n : Nat) (j : Label) (outer : Context) :
    0 < (leafTerms table n j outer).length := by
  simp only [leafTerms, List.length_map, List.length_append, List.length_cons, List.length_nil]
  omega

end PureSFormal.AppendixF.RecursiveCall
