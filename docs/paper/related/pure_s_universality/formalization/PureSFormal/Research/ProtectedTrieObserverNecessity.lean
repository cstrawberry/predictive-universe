import PureSFormal.Research.ProtectedTrieBoundedTerminal

/-!
# Extensional verifier-language boundary

The protected body can operationally expose every supplied history/payload
candidate, independently of whether that candidate describes a valid source
trajectory. Consequently, cone-wide literal soundness of any source-indexed
Boolean candidate predicate is equivalent to the extensional requirement that
every candidate it accepts is also accepted by the verified tableau checker.

This is an extensional boundary for this predicate class, not a lower bound on
arbitrary current-term observers. It does not prescribe an implementation: an
equivalent predicate need not call `step?`, or even call `verify`, provided
that it accepts no larger language.
-/

namespace PureSFormal.Research.ProtectedTrieObserverNecessity

open PureSFormal.PureS
open PureSFormal.Research.ProtectedTrieBoundedTerminal
open PureSFormal.Research.ProtectedTrieCertificates
open PureSFormal.Research.ProtectedTrieEnumeration
open PureSFormal.Research.ProtectedTrieMachine
open PureSFormal.Research.ProtectedTrieParser
open PureSFormal.Research.ProtectedTrieStrong
open PureSFormal.Research.ProtectedTrieTableau

/-- A source-indexed Boolean predicate on literal history/payload candidates. -/
abbrev CandidatePredicate := Instance -> BitWord -> BitWord -> Bool

/-- The candidate predicate accepts no more literal records than the verified
tableau language.  This condition is extensional and does not constrain the
implementation of the predicate. -/
def PointwiseRefinesVerifier (candidate : CandidatePredicate) : Prop :=
  forall source history payload,
    candidate source history payload = true ->
      verify source history payload = true

/-- Every verifier-accepted literal record is accepted by the candidate
predicate. -/
def PointwiseCompleteForVerifier (candidate : CandidatePredicate) : Prop :=
  forall source history payload,
    verify source history payload = true ->
      candidate source history payload = true

/-- Exact extensional agreement with the verified tableau language.  No
particular implementation of either Boolean function is implied. -/
def PointwiseAgreesWithVerifier (candidate : CandidatePredicate) : Prop :=
  forall source history payload,
    candidate source history payload = verify source history payload

/-- Every accepted literal record exposed anywhere in an encoded pure-`S`
cone passes the verified tableau checker for that cone's source. -/
def ConeWideLiteralSound (candidate : CandidatePredicate) : Prop :=
  forall source term history payload,
    Steps (strongEncoder source) term ->
    List.Mem (a history payload) (anchoredOpenedPaths term) ->
    candidate source history payload = true ->
      verify source history payload = true

/-- If a candidate predicate accepts even one verifier-rejected literal record,
the source-independent protected body supplies an explicit reachable term
that exposes that false record. -/
theorem invalidCandidateAcceptance_reachable
    (candidate : CandidatePredicate)
    {source : Instance} {history payload : BitWord}
    (hcandidate : candidate source history payload = true)
    (hinvalid : verify source history payload = false) :
    exists term,
      Steps (strongEncoder source) term /\
      List.Mem (a history payload) (anchoredOpenedPaths term) /\
      candidate source history payload = true /\
      verify source history payload = false := by
  exact ⟨candidateTerm source history payload,
    candidateSchedule_steps source history payload,
    candidateAddress_mem_openedPaths source history payload,
    hcandidate, hinvalid⟩

/-- Cone-wide literal soundness holds exactly when the candidate predicate is
an extensional refinement of the verified tableau language.  The forward
direction is substantive: the canonical pure-`S` schedule exposes every
history/payload pair, so no verifier-rejected acceptance can hide outside the
reachable cone. -/
theorem coneWideLiteralSound_iff_pointwiseRefinesVerifier
    (candidate : CandidatePredicate) :
    ConeWideLiteralSound candidate <-> PointwiseRefinesVerifier candidate := by
  constructor
  · intro hsound source history payload hcandidate
    exact hsound source (candidateTerm source history payload) history payload
      (candidateSchedule_steps source history payload)
      (candidateAddress_mem_openedPaths source history payload)
      hcandidate
  · intro hrefines source term history payload _ _ hcandidate
    exact hrefines source history payload hcandidate

/-- Cone-wide no-false-positive soundness together with completeness for all
verified literal records is equivalent to exact pointwise agreement with the
verified tableau language. -/
theorem coneWideLiteralSound_and_complete_iff_pointwiseAgreesWithVerifier
    (candidate : CandidatePredicate) :
    (ConeWideLiteralSound candidate /\
      PointwiseCompleteForVerifier candidate) <->
        PointwiseAgreesWithVerifier candidate := by
  constructor
  · rintro ⟨hsound, hcomplete⟩ source history payload
    have hrefines :=
      (coneWideLiteralSound_iff_pointwiseRefinesVerifier candidate).mp hsound
    cases hcandidate : candidate source history payload with
    | false =>
        cases hverify : verify source history payload with
        | false => rfl
        | true =>
            have haccepted := hcomplete source history payload hverify
            rw [hcandidate] at haccepted
            cases haccepted
    | true =>
        cases hverify : verify source history payload with
        | false =>
            have hverified := hrefines source history payload hcandidate
            rw [hverify] at hverified
            cases hverified
        | true => rfl
  · intro hagrees
    constructor
    · apply
        (coneWideLiteralSound_iff_pointwiseRefinesVerifier candidate).mpr
      intro source history payload hcandidate
      rw [← hagrees source history payload]
      exact hcandidate
    · intro source history payload hverify
      rw [hagrees source history payload]
      exact hverify

end PureSFormal.Research.ProtectedTrieObserverNecessity
