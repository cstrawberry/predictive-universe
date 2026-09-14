import PureSFormal.Computation.CounterMachineTag

/-! Exact logical-basis audit for the counter-machine to restricted-`T2` compiler. -/

#print axioms PureSFormal.Computation.CounterMachineTag.Numeric.ordinaryProgram_productionLabelsValid
#print axioms PureSFormal.Computation.CounterMachineTag.Numeric.ordinaryTrajectory
#print axioms PureSFormal.Computation.CounterMachineTag.Numeric.accepts_iff_ordinaryEventuallyHalts
#print axioms PureSFormal.Computation.CounterMachineTag.Numeric.compileT2_isT2
#print axioms PureSFormal.Computation.CounterMachineTag.Numeric.compileT2_wellFormed
#print axioms PureSFormal.Computation.CounterMachineTag.Numeric.accepts_iff_compileT2_eventuallyHalts
#print axioms PureSFormal.Computation.CounterMachineTag.Numeric.universalAccepts_iff_compileUniversalInput
