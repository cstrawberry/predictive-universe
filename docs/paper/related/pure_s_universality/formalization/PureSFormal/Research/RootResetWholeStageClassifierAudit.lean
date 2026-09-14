import PureSFormal.Research.RootResetWholeStageClassifier

/-! Kernel dependency report for whole-term root-reset stage recovery. -/

namespace PureSFormal.Research.RootResetWholeStageClassifier

#print axioms stages_nodup
#print axioms mem_stages
#print axioms historyPhase_nil
#print axioms historyPhase_singleton
#print axioms classifyActive_commit_of_parse
#print axioms classifyActive_frameR0
#print axioms classifyActive_frameR1
#print axioms classifyActive_frameR2
#print axioms classifyActive_activatedRoute
#print axioms classifyActive_activatedRoute_sound
#print axioms classifyActive_selectedAction
#print axioms classifyActive_selectedAction_sound
#print axioms selectedAction_accumulator_subterm
#print axioms classifyActive_canonicalChildAddress_sound
#print axioms classifyActive_close
#print axioms identical_current_terms_same_classification
#print axioms classify_unique
#print axioms classify_source_eq
#print axioms classify_history_marked
#print axioms classify_active_local_is_fresh
#print axioms endpointDecomposition_describes
#print axioms endpointDecomposition_deterministic
#print axioms existsUnique_endpointDecomposition
#print axioms subterm?_plug_contextAddress_append
#print axioms classify_canonicalChildAddress_sound
#print axioms contractAt?_plug_append
#print axioms close_of_active_accumulator
#print axioms classify_close_sound

end PureSFormal.Research.RootResetWholeStageClassifier
