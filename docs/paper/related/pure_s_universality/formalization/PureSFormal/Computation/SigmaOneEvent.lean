import PureSFormal.Computation.SigmaOne

/-!
# Exponentially initialized bounded-run completeness transfer from the counter source

This module turns one explicit reduction of universal two-counter acceptance
into completeness for the exponentially initialized two-counter bounded-run
syntax.  The
source formula input `n` is compiled to the named universal job carrying
`2^n`; the source-model equivalence is the compiler theorem proved in
`SigmaOne`.
-/

namespace PureSFormal.Computation

/-- Any executable target reached exactly from universal counter acceptance is
complete for the exponentially initialized two-counter bounded-run interface. -/
theorem boundedSigmaOne_complete_of_counterUniversal
    {Target : Type} (target : Target → Prop)
    (targetSemi : BoundedlySemidecidable target)
    (encode : CounterMachine.UniversalInput → Target)
    (correct : ∀ job,
      CounterMachine.UniversalAccepts job ↔ target (encode job)) :
    BoundedSigmaOne.Complete target := by
  refine ⟨targetSemi, ?_⟩
  intro source sigmaOne
  rcases sigmaOne with ⟨formula, defines⟩
  refine ⟨fun input =>
    encode (BoundedSigmaOne.formulaUniversalInput formula input), ?_⟩
  intro input
  exact (defines input).trans
    ((BoundedSigmaOne.formulaUniversalInput_accepts_iff formula input).symm.trans
      (correct (BoundedSigmaOne.formulaUniversalInput formula input)))

end PureSFormal.Computation
