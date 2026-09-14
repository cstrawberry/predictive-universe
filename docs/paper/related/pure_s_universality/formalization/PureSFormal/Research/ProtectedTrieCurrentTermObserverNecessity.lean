import PureSFormal.Research.ProtectedTrieObserverNecessity
import PureSFormal.Computation.Enumerable

/-!
# Current-term observer necessity

This module removes the source-indexed candidate-predicate restriction from
the verifier-language boundary.  An observer below is an arbitrary function
of only the current pure-`S` term and emits literal `(history, payload)`
records.  If its output is sound on every encoded cone and complete even just
at the canonical term that exposes one supplied record, then membership of
that record in the observer output agrees exactly with the verified tableau
language.

The conclusion is extensional.  It does not prescribe an implementation or a
time lower bound.  It says only that every whole-term acceptance function
satisfying cone-wide soundness and canonical completeness has the same
canonical-candidate language.  No claim is made for observers lacking either
hypothesis.
-/

namespace PureSFormal.Research.ProtectedTrieCurrentTermObserverNecessity

open PureSFormal.PureS
open PureSFormal.Research.ProtectedTrieBoundedTerminal
open PureSFormal.Research.ProtectedTrieCertificates
open PureSFormal.Research.ProtectedTrieMachine
open PureSFormal.Research.ProtectedTrieStrong
open PureSFormal.Research.ProtectedTrieTableau

/-- A literal record names both the occurrence history and the supplied
tableau payload. -/
abbrev LiteralRecord := BitWord × BitWord

/-- An arbitrary observer of the current bare term.  No source parameter,
reduction history, cursor, or evaluator state is supplied. -/
abbrev CurrentTermObserver := Term → List LiteralRecord

/-- The observer emits one specified literal record. -/
def Emits (observer : CurrentTermObserver) (term : Term)
    (history payload : BitWord) : Prop :=
  List.Mem (history, payload) (observer term)

/-- Every emitted record on every reduct of an encoded source passes that
source's verified tableau checker. -/
def ConeWideRecordSound (observer : CurrentTermObserver) : Prop :=
  ∀ source term history payload,
    Steps (strongEncoder source) term →
    Emits observer term history payload →
      verify source history payload = true

/-- Completeness only at the canonical term exposing the supplied candidate.
This is weaker than demanding completeness at every term where the address is
open. -/
def CanonicalCandidateComplete (observer : CurrentTermObserver) : Prop :=
  ∀ source history payload,
    verify source history payload = true →
      Emits observer (candidateTerm source history payload) history payload

/-- Any cone-wide sound and canonically complete current-term observer agrees
with the verifier language exactly when evaluated at the canonical candidate
term. -/
theorem emits_candidateTerm_iff_verify
    (observer : CurrentTermObserver)
    (sound : ConeWideRecordSound observer)
    (complete : CanonicalCandidateComplete observer)
    (source : Instance) (history payload : BitWord) :
    Emits observer (candidateTerm source history payload) history payload ↔
      verify source history payload = true := by
  constructor
  · intro emitted
    exact sound source (candidateTerm source history payload) history payload
      (candidateSchedule_steps source history payload) emitted
  · exact complete source history payload

/-- One verifier-language input. -/
structure Candidate where
  source : Instance
  history : BitWord
  payload : BitWord

/-- One explicit current-term observer query. -/
structure ObserverQuery where
  term : Term
  history : BitWord
  payload : BitWord

/-- The literal verified-certificate language. -/
def VerifiedCandidate (candidate : Candidate) : Prop :=
  verify candidate.source candidate.history candidate.payload = true

/-- Acceptance by one fixed current-term observer. -/
def ObserverAccepts (observer : CurrentTermObserver)
    (query : ObserverQuery) : Prop :=
  Emits observer query.term query.history query.payload

/-- The transparent canonical-query map. -/
def candidateQuery (candidate : Candidate) : ObserverQuery :=
  { term := candidateTerm candidate.source candidate.history candidate.payload
    history := candidate.history
    payload := candidate.payload }

/-- The verified tableau language reduces through the displayed structural map
to the acceptance language of every sound and complete current-term observer. -/
theorem verifiedCandidate_reducesVia_observer
    (observer : CurrentTermObserver)
    (sound : ConeWideRecordSound observer)
    (complete : CanonicalCandidateComplete observer) :
    PureSFormal.Computation.ReducesVia candidateQuery VerifiedCandidate
      (ObserverAccepts observer) := by
  intro candidate
  exact (emits_candidateTerm_iff_verify observer sound complete
    candidate.source candidate.history candidate.payload).symm

/-- The same transparent map witnesses the extensional many-one reduction. -/
theorem verifiedCandidate_manyOneReduces_observer
    (observer : CurrentTermObserver)
    (sound : ConeWideRecordSound observer)
    (complete : CanonicalCandidateComplete observer) :
    PureSFormal.Computation.ManyOneReduces VerifiedCandidate
      (ObserverAccepts observer) :=
  ⟨candidateQuery,
    verifiedCandidate_reducesVia_observer observer sound complete⟩

end PureSFormal.Research.ProtectedTrieCurrentTermObserverNecessity
