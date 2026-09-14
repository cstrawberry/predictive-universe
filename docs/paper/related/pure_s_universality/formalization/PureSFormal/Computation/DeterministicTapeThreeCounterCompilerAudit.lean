import PureSFormal.Computation.DeterministicTapeThreeCounterCompiler

/-!
# Primitive deterministic-tape compiler axiom audit

This module prints the logical basis of every load-bearing layer of the
premise-free compiler: finite layout and lookup, exact arithmetic loops,
complete live and halting macros, prefix safety, finite runs, and both
directions of the final halting equivalence.
-/

namespace PureSFormal.Computation.DeterministicTapeThreeCounterCompiler

#print axioms Layout.decodePhase_encodePhase
#print axioms Compiler.compileMachine
#print axioms Compiler.compileMachine_length
#print axioms Compiler.instructionAt_compileMachine

#print axioms Execution.compileInitial
#print axioms Execution.run_push
#print axioms Execution.run_right_pop
#print axioms Execution.run_left_pop_nonempty
#print axioms Execution.run_left_pop_empty
#print axioms Execution.run_live_macro
#print axioms Execution.run_halt_macro
#print axioms Execution.running_prefix_of_running_endpoint
#print axioms Execution.run_live_macro_prefix_running
#print axioms Execution.run_live_macro_strict_prefix_ne_halted
#print axioms Execution.runFor?_some_exact
#print axioms Execution.threeCounterHalts_of_halts
#print axioms Execution.sourceHalts_of_run_halted
#print axioms Execution.halts_of_threeCounterHalts
#print axioms Execution.halts_iff_threeCounterHalts

end PureSFormal.Computation.DeterministicTapeThreeCounterCompiler
