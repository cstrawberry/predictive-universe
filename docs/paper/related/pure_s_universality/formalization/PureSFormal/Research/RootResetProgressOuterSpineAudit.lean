import PureSFormal.Research.RootResetProgressOuterSpine

/-! Axiom audit for the progress-aware CHAIN/JOB decomposition. -/

namespace PureSFormal.Research.RootResetProgressOuterSpine

#print axioms parseHistoricalLocal?_sound
#print axioms parseHistoricalLocal?_complete
#print axioms peelChain_sound
#print axioms chain_deterministic
#print axioms Chain.active_subterm
#print axioms Chain.active_size_lt_of_history_ne_nil
#print axioms peelJob_sound
#print axioms job_deterministic
#print axioms Job.active_subterm
#print axioms Job.active_size_lt_of_pendingDepth_pos
#print axioms decompose_describes
#print axioms describes_deterministic
#print axioms existsUnique_decomposition
#print axioms Describes.active_subterm
#print axioms Describes.active_size_lt_of_roles_ne_nil
#print axioms decompose_fresh_local
#print axioms decompose_pending_local
#print axioms decompose_pending_marked_clean_local

end PureSFormal.Research.RootResetProgressOuterSpine
