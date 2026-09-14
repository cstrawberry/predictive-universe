import PureSFormal.Computation.DeterministicTapeCounterCompiler

/-! Axiom inventory for the arithmetic stack-counter compiler layer. -/

#print axioms PureSFormal.Computation.DeterministicTapeCounterCompiler.StackCode.pop?_encode_cons
#print axioms PureSFormal.Computation.DeterministicTapeCounterCompiler.StackCode.encode_pos
#print axioms PureSFormal.Computation.DeterministicTapeCounterCompiler.StackCode.encode_cons_ne_one
#print axioms PureSFormal.Computation.DeterministicTapeCounterCompiler.StackCode.decode?_encode
#print axioms PureSFormal.Computation.DeterministicTapeCounterCompiler.StackCode.encode_of_decode?_eq
#print axioms PureSFormal.Computation.DeterministicTapeCounterCompiler.initial_represents
#print axioms PureSFormal.Computation.DeterministicTapeCounterCompiler.getElem?_append_focus
#print axioms PureSFormal.Computation.DeterministicTapeCounterCompiler.replaceAt?_append_focus
#print axioms PureSFormal.Computation.DeterministicTapeCounterCompiler.scanned?_rowOf
#print axioms PureSFormal.Computation.DeterministicTapeCounterCompiler.applyRule?_rowOf
#print axioms PureSFormal.Computation.DeterministicTapeCounterCompiler.applyRule?_rowOf_afterRule
#print axioms PureSFormal.Computation.DeterministicTapeCounterCompiler.stack_step?_configurationOf
#print axioms PureSFormal.Computation.DeterministicTapeCounterCompiler.step?_related
#print axioms PureSFormal.Computation.DeterministicTapeCounterCompiler.runFor?_related
#print axioms PureSFormal.Computation.DeterministicTapeCounterCompiler.halts_iff_stackCounterHalts
#print axioms Nat.mul_pos
#print axioms Nat.ne_of_gt
#print axioms Nat.mul_succ
#print axioms Nat.add_mul_div_right
#print axioms Nat.add_mul_mod_self_right
#print axioms Nat.succ.inj
#print axioms Nat.noConfusion
#print axioms List.reverse_cons
#print axioms List.reverse_reverse
#print axioms List.reverse_append
#print axioms List.append_assoc
#print axioms List.length_reverse
