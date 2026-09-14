import PureSFormal.Research.RootResetEulerWalker

/-! # Axiom inventory for the all-input root-reset Euler selector -/

namespace PureSFormal.Research.RootResetSelectorContract

#print axioms subterm?_erase_cursorAddress
#print axioms replace?_erase_cursorAddress
#print axioms contractAt?_cursorAddress
#print axioms runMoveCount_le_ticks
#print axioms Contract.halts_within
#print axioms Contract.moves_le
#print axioms Contract.terminal_step_absorbing
#print axioms Contract.invokeRun_state_independent
#print axioms Contract.invoke_state_independent
#print axioms Contract.exact_mutation_count
#print axioms Contract.restart_nf

end PureSFormal.Research.RootResetSelectorContract

namespace PureSFormal.Research.RootResetEulerWalker

#print axioms states_nodup
#print axioms states_length
#print axioms run_failed_probe
#print axioms drive
#print axioms measure_scan_s_left
#print axioms measure_scan_s_right
#print axioms measure_scan_app_left
#print axioms measure_ascend_left
#print axioms measure_ascend_right
#print axioms prefix_add_tickBudget_le
#print axioms driveFuel_run
#print axioms driveFuel_runMutationCount
#print axioms driveFuel_ticks_le_tickBudget
#print axioms driveFuel_certificate
#print axioms drive_run
#print axioms drive_runMutationCount
#print axioms drive_ticks_le_tickBudget
#print axioms rootExecution_ticks_le
#print axioms rootExecution_moves_le
#print axioms drive_certificate
#print axioms run_rootExecution_eq
#print axioms rootExecution_runMutationCount
#print axioms rootExecution_certificate
#print axioms rootExecution_terminal
#print axioms rootExecution_nf_normal
#print axioms rootExecution_redex_contracts
#print axioms outcome_agrees
#print axioms outcome_mutationCount_agrees
#print axioms terminal_controls_absorbing
#print axioms selectorContract
#print axioms compiled_control_state_cardinality
#print axioms invocation_initial_control
#print axioms invocation_initial_cursor
#print axioms interInvocationState_unique
#print axioms identical_current_terms_same_selection
#print axioms unchanged_term_restart_same_run
#print axioms unchanged_term_restart_same_selection
#print axioms nf_restart_no_accumulation
#print axioms selector_exact_mutation_count
#print axioms selector_halts_linear
#print axioms selector_moves_linear

end PureSFormal.Research.RootResetEulerWalker
