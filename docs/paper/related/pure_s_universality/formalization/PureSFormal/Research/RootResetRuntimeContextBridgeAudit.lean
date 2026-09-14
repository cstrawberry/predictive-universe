import PureSFormal.Research.RootResetRuntimeContextBridge

/-! Kernel-axiom audit for the runtime/root-reset context bridge. -/

open PureSFormal.Research.RootResetRuntimeContextBridge

#print axioms contextOfParents_eq_surroundingContext
#print axioms surroundingContext_eq_contextOfParents
#print axioms context_plug_agrees
#print axioms contextOfParents_plug_eq_rebuild
#print axioms contextOfParents_contextAddress
#print axioms cursorAddress_eq_contextOfParents_address
#print axioms cursorErase_eq_contextOfParents_plug
#print axioms subterm?_contextOfParents_address
#print axioms replace?_contextOfParents_address
#print axioms subterm?_contextAddress
#print axioms contractAt?_contextAddress
#print axioms contractAt?_contextOfParents_address
#print axioms contractAt?_cursorAddress_eq_contextOfParents
#print axioms addressFromParents_frames
#print axioms context_comp_assoc
#print axioms context_comp_hole
#print axioms contextOfParents_frames_eq_comp
#print axioms contextOfParents_frames_root
#print axioms cursorAddress_frames
#print axioms rebuild_frames_eq_contextOfParents_plug
#print axioms contractAt?_contextOfParents_append
