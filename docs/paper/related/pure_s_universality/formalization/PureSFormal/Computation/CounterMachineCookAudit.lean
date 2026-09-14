import PureSFormal.Computation.CounterMachineCook

/-! Exact logical-basis audit for the premise-free source-to-Cook endpoint. -/

#print axioms PureSFormal.Computation.CounterMachineCook.encodeBits
#print axioms PureSFormal.Computation.CounterMachineCook.EventuallyEmpty
#print axioms PureSFormal.Computation.CounterMachineCook.eventuallyEmpty_semidecidable
#print axioms PureSFormal.Computation.CounterMachineCook.universalAccepts_iff_fixedCookEmpty
#print axioms PureSFormal.Computation.CounterMachineCook.eventuallyEmpty_sigmaOneComplete

namespace PureSFormal.Computation.CounterMachineTag.Numeric

#print axioms accepts_iff_typedEventuallyHalts
#print axioms typedEventuallyHalts_iff_numericHaltHead
#print axioms ordinaryTrajectory_boundary
#print axioms ordinaryEventuallyHalts_iff_haltHead
#print axioms accepts_iff_ordinaryEventuallyHalts
#print axioms compileT2_wellFormed
#print axioms accepts_iff_compileT2_eventuallyHalts
#print axioms universalAccepts_iff_compileUniversalInput

end PureSFormal.Computation.CounterMachineTag.Numeric
