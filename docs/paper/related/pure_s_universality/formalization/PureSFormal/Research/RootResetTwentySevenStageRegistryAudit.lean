import PureSFormal.Research.RootResetTwentySevenStageRegistry

namespace PureSFormal.Research.RootResetTwentySevenStageRegistry

#print axioms coreStage?_toWholeStage
#print axioms coreStage?_sound
#print axioms coreStage?_none_iff
#print axioms parseCore?_sound
#print axioms parseCore?_complete
#print axioms parseCore?_unique
#print axioms CoreWholeShape.deterministic
#print axioms CoreWholeShape.source_eq
#print axioms CoreWholeShape.history_marked
#print axioms CoreWholeShape.commit_active_fresh
#print axioms CoreWholeShape.accumulatorClose_evidence
#print axioms CoreView.selected_contracts
#print axioms stages_length
#print axioms stages_nodup
#print axioms mem_stages
#print axioms parse?_sound
#print axioms parse?_complete
#print axioms parse?_unique
#print axioms RegisteredShape.deterministic
#print axioms RegisteredShape.source_eq
#print axioms existsUnique_registeredView
#print axioms unique_active_hole_decomposition
#print axioms unique_stage_focus_selection
#print axioms registered_stage_disjoint
#print axioms parse?_history_marked
#print axioms View.selected_contracts
#print axioms selectAddress?_contracts
#print axioms exists_selectStep?_of_selectAddress?
#print axioms selectStep?_sound
#print axioms selectStep?_eq_some_iff
#print axioms response_commit_exact_with_handoff_active
#print axioms response_commit_exact_to_unmarked_continuation

end PureSFormal.Research.RootResetTwentySevenStageRegistry
