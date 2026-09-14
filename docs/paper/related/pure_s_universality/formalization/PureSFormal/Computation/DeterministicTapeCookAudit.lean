import PureSFormal.Computation.DeterministicTapeCook

/-! # Deterministic-tape-to-Cook endpoint axiom audit -/

namespace PureSFormal.Computation.DeterministicTapeCook

#print axioms compileThreeCounterJob
#print axioms compileT2Job
#print axioms encodeBits
#print axioms compileT2Job_isT2
#print axioms compileT2Job_wellFormed
#print axioms halts_iff_threeCounterJob
#print axioms halts_iff_t2Job
#print axioms halts_iff_fixedCookEmpty
#print axioms halts_iff_exists_fixedCookEmpty
#print axioms encodeBits_reducesVia
#print axioms halts_manyOneReduces_fixedCookEmpty

end PureSFormal.Computation.DeterministicTapeCook
