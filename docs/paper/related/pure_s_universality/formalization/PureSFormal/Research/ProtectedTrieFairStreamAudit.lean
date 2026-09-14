import PureSFormal.Research.ProtectedTrieFairStream

/-! # Adjacent-step protected-trie fair-stream axiom inventory -/

namespace PureSFormal.Research.ProtectedTrieFairStream

#print axioms PrefixTree.mem_paths_of_prefix
#print axioms PrefixTree.le_antisymm
#print axioms insertPaths_completeTree
#print axioms replay_blockSchedule
#print axioms length_lt_of_mem_completeTree
#print axioms fairMacroTerm_ne_succ
#print axioms blockSchedule_nonempty
#print axioms checkpointTime_strictlyIncreasing
#print axioms checkpointTime_eq_scheduleThrough_length
#print axioms replay_scheduleThrough
#print axioms scheduleThrough_prefix
#print axioms depth_le_checkpointTime
#print axioms take_append_of_le_length
#print axioms addressPrefix_checkpointTime
#print axioms replayAddresses_take_exists
#print axioms replay_addressPrefix
#print axioms replayAddresses_singleton_step
#print axioms addressPrefix_succ
#print axioms termAt_step
#print axioms termAt_checkpointTime
#print axioms protectedAddress_at_checkpoint
#print axioms termAt_structurallyFair
#print axioms addressCompleteCanonicalPath
#print axioms termAt_eventually_strongProjection
#print axioms termAt_eventually_labelledProjection
#print axioms termAt_checkpoint_eventually_labelled

end PureSFormal.Research.ProtectedTrieFairStream
