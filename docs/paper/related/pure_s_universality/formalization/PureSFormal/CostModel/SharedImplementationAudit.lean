import PureSFormal.CostModel.DAGLocalObserver

/-! Axiom inventory for the concrete finite-store and DAG-local observer layer. -/

#print axioms PureSFormal.CostModel.FiniteArena.navigate_value
#print axioms PureSFormal.CostModel.FiniteArena.navigate_ticks_le
#print axioms PureSFormal.CostModel.FiniteArena.liveCard_le_retainedCard
#print axioms PureSFormal.CostModel.FiniteArena.copiedRetained_nodup
#print axioms PureSFormal.CostModel.FiniteArena.copiedRetained_complete
#print axioms PureSFormal.CostModel.FiniteArena.edgeCopyM_ticks
#print axioms PureSFormal.CostModel.FiniteArena.edgeCopyM_retainedCard
#print axioms PureSFormal.CostModel.FiniteArena.contractedRetained_nodup
#print axioms PureSFormal.CostModel.FiniteArena.contractedRetained_complete
#print axioms PureSFormal.CostModel.FiniteArena.contractM_ticks
#print axioms PureSFormal.CostModel.FiniteArena.contractM_retainedCard
#print axioms PureSFormal.CostModel.FiniteArena.interpreterCertificate

#print axioms PureSFormal.CostModel.DAGLocalObserver.parseHeaderNodesM?_value
#print axioms PureSFormal.CostModel.DAGLocalObserver.parseHeaderNodesM?_ticks_le
#print axioms PureSFormal.CostModel.DAGLocalObserver.parseProtectedNodesM?_value
#print axioms PureSFormal.CostModel.DAGLocalObserver.parseProtectedNodesM?_ticks_le
#print axioms PureSFormal.CostModel.DAGLocalObserver.matchesTermM?_value
#print axioms PureSFormal.CostModel.DAGLocalObserver.matchesTermM?_ticks_le
#print axioms PureSFormal.CostModel.DAGLocalObserver.sourceBodyM?_ticks_le
#print axioms PureSFormal.CostModel.DAGLocalObserver.openedAtNodeM?_value
#print axioms PureSFormal.CostModel.DAGLocalObserver.openedAtNodeM?_ticks_le
#print axioms PureSFormal.CostModel.DAGLocalObserver.runTerminalCertificate_value
#print axioms PureSFormal.CostModel.DAGLocalObserver.runTerminalCertificate_ticks_le
#print axioms PureSFormal.CostModel.DAGLocalObserver.runTerminalCertificate_ticks_le_retainedLive
#print axioms PureSFormal.CostModel.DAGLocalObserver.terminalCertificate?_readback
#print axioms PureSFormal.CostModel.DAGLocalObserver.terminalRecordOnTerm?_eq_true_iff_labelledProjection
