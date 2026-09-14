import PureSFormal.PureS.CanonicalTraversal
import PureSFormal.PureS.CarrierDecoder

/-!
# Root-reset completed-carrier boundary grammar

This module packages the completed Base/Local carrier boundary already used by
the selected-path proof as a bare-term classification theorem.  It records the
unique canonical descent context and logical queue exposed by every carrier in
`ReachableAudit.Holds`.  Audit and retained-history fields remain outside the
selected context and are never compared by the classifier.

The theorem concerns completed carrier boundaries.  Intermediate clock, fuel,
frame, dispatcher, appender, close, commit, and handoff terms require their
own registered productions.
-/

namespace PureSFormal.Research.RootResetCarrierBoundaryGrammar

open PureSFormal.PureS

/-- The two completed whole-carrier alternatives. -/
inductive Stage where
  | base
  | local
  deriving BEq, DecidableEq, Inhabited, Repr

/-- Bare syntax recovered at one completed whole-carrier boundary. -/
structure View where
  stage : Stage
  canonicalChild : Term
  deriving BEq, DecidableEq, Repr

/--
Total classifier obtained by restricting the existing canonical-path parser
to completed Base and Local roots.
-/
def classify (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation) (term : Term) :
    Option View :=
  match CanonicalStep.classify program tree bits continuation hadmissible term with
  | .base queue => some ⟨.base, queue⟩
  | .local accumulator => some ⟨.local, accumulator⟩
  | _ => none

/-- Every reachable completed carrier is accepted by the boundary classifier. -/
theorem classify_isSome_of_holds
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation term : Term}
    (hadmissible : Carrier.Admissible continuation)
    (reachable : ReachableAudit.Holds program tree bits continuation term) :
    (classify program tree bits continuation hadmissible term).isSome = true := by
  cases reachable.toRoot with
  | @base queue decoded queueComplete =>
      rw [classify, CanonicalStep.classify_mutableBase]
      rfl
  | @«local» accumulator dispatcher result inner dispatch shell =>
      rw [classify,
        CanonicalStep.classify_local program tree bits continuation hadmissible
          dispatch shell]
      rfl

/-- A successful Base result reconstructs an exact mutable-Base root. -/
theorem classify_eq_base_iff
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation)
    (term queue : Term) :
    classify program tree bits continuation hadmissible term =
        some ⟨.base, queue⟩ ↔
      ∃ beta, MutableBase.parse? (compileActions program tree) bits continuation
        term = some ⟨queue, beta⟩ := by
  constructor
  · intro h
    generalize hresult : CanonicalStep.classify program tree bits continuation
      hadmissible term = result
    unfold classify at h
    rw [hresult] at h
    cases result with
    | base found =>
        have foundEq : found = queue := by simpa using h
        subst found
        exact (CanonicalStep.classify_eq_base_iff program tree bits continuation
          hadmissible term queue).mp hresult
    | «local» found => simp at h
    | live bit predecessor => simp at h
    | tombstone bit predecessor => simp at h
    | malformed => simp at h
  · intro h
    have hresult :=
      (CanonicalStep.classify_eq_base_iff program tree bits continuation
        hadmissible term queue).mpr h
    simp [classify, hresult]

/-- A successful Local result reconstructs the shell and selected accumulator. -/
theorem classify_eq_local_iff
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation)
    (term accumulator : Term) :
    classify program tree bits continuation hadmissible term =
        some ⟨.local, accumulator⟩ ↔
      MutableBase.parse? (compileActions program tree) bits continuation term =
          none ∧
        ∃ dispatcher,
          Carrier.LocalShell bits continuation dispatcher term ∧
            DispatchParser.dispatchesTo program tree dispatcher accumulator := by
  constructor
  · intro h
    generalize hresult : CanonicalStep.classify program tree bits continuation
      hadmissible term = result
    unfold classify at h
    rw [hresult] at h
    cases result with
    | base found => simp at h
    | «local» found =>
        have foundEq : found = accumulator := by simpa using h
        subst found
        exact (CanonicalStep.classify_eq_local_iff program tree bits continuation
          hadmissible term accumulator).mp hresult
    | live bit predecessor => simp at h
    | tombstone bit predecessor => simp at h
    | malformed => simp at h
  · intro h
    have hresult :=
      (CanonicalStep.classify_eq_local_iff program tree bits continuation
        hadmissible term accumulator).mpr h
    simp [classify, hresult]

/-- Base and Local alternatives are disjoint at the registered root role. -/
theorem base_ne_local (queue accumulator : Term) :
    View.mk .base queue ≠ View.mk .local accumulator := by
  intro h
  cases h

/-- The total classifier fixes at most one stage and canonical child. -/
theorem classify_unique
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation term : Term}
    {hadmissible : Carrier.Admissible continuation}
    {first second : View}
    (hfirst : classify program tree bits continuation hadmissible term =
      some first)
    (hsecond : classify program tree bits continuation hadmissible term =
      some second) :
    first = second := by
  rw [hfirst] at hsecond
  exact Option.some.inj hsecond

/--
Every reachable completed carrier has exactly one logical queue and one
one-hole context selecting its terminal `omega`.
-/
theorem existsUnique_activeDecomposition
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation term : Term}
    (hadmissible : Carrier.Admissible continuation)
    (reachable : ReachableAudit.Holds program tree bits continuation term) :
    ∃ decomposition : List Bool × Context,
      CanonicalTraversal.Descent program tree bits continuation term
          decomposition.1 decomposition.2 ∧
        ∀ other : List Bool × Context,
          CanonicalTraversal.Descent program tree bits continuation term
              other.1 other.2 →
            other = decomposition := by
  obtain ⟨decoded, context, descent⟩ :=
    CanonicalTraversal.Descent.ofHolds reachable
  refine ⟨(decoded, context), descent, ?_⟩
  rintro ⟨otherDecoded, otherContext⟩ other
  obtain ⟨contextEq, decodedEq⟩ :=
    CanonicalTraversal.Descent.deterministic hadmissible other descent
  apply Prod.ext
  · simpa using decodedEq
  · simpa using contextEq

/-- The unique decomposition literally rebuilds the current bare term. -/
theorem activeDecomposition_source_eq
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation term : Term}
    {decoded : List Bool} {context : Context}
    (decomposition : CanonicalTraversal.Descent program tree bits continuation
      term decoded context) :
    term = context.plug omega :=
  decomposition.source_eq.symm

/-- The registered active-hole address selects the literal terminal token. -/
theorem activeDecomposition_subterm
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation term : Term}
    {decoded : List Bool} {context : Context}
    (decomposition : CanonicalTraversal.Descent program tree bits continuation
      term decoded context) :
    term.subterm? (CanonicalTraversal.contextAddress context) = some omega :=
  decomposition.omega_subterm

/-- The selected active-hole address is structurally bounded by term size. -/
theorem activeDecomposition_address_length_lt
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation term : Term}
    {decoded : List Bool} {context : Context}
    (decomposition : CanonicalTraversal.Descent program tree bits continuation
      term decoded context) :
    (CanonicalTraversal.contextAddress context).length < term.size :=
  decomposition.terminates

/-- Local classification is invariant under independent registered audit fields. -/
theorem local_audits_opaque
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation)
    {dispatcher accumulator firstResult secondResult : Term}
    (dispatch : DispatchParser.dispatchesTo program tree dispatcher accumulator)
    (firstShell : Carrier.LocalShell bits continuation dispatcher firstResult)
    (secondShell : Carrier.LocalShell bits continuation dispatcher secondResult) :
    CanonicalStep.classify program tree bits continuation hadmissible firstResult =
      CanonicalStep.classify program tree bits continuation hadmissible
        secondResult :=
  CanonicalStep.classify_local_fields_independent program tree bits continuation
    hadmissible dispatch firstShell secondShell

/-- Tombstone classification is invariant under its independent audit payload. -/
theorem tombstone_audit_opaque
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation)
    (bit : Bool) (firstAudit secondAudit predecessor : Term) :
    CanonicalStep.classify program tree bits continuation hadmissible
        (Carrier.tombstone bit predecessor firstAudit) =
      CanonicalStep.classify program tree bits continuation hadmissible
        (Carrier.tombstone bit predecessor secondAudit) :=
  CanonicalStep.classify_tombstone_audit_independent program tree bits
    continuation hadmissible bit firstAudit secondAudit predecessor

end PureSFormal.Research.RootResetCarrierBoundaryGrammar
