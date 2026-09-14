import PureSFormal.Research.RootResetMarkerObserverDecidableEq

#print axioms PureSFormal.Research.RootResetMarkerObserverDecidableEq.branchControlDecidableEq
#print axioms PureSFormal.Research.RootResetMarkerObserverDecidableEq.sequenceControlDecidableEq
#print axioms PureSFormal.Research.RootResetMarkerObserverDecidableEq.scopedControlDecidableEq
#print axioms PureSFormal.Research.RootResetMarkerObserverDecidableEq.pendingBaseControlDecidableEq
#print axioms PureSFormal.Research.RootResetMarkerObserverDecidableEq.observerControlDecidableEq
#print axioms PureSFormal.Research.RootResetMarkerObserverDecidableEq.observerDecidableEq

open PureSFormal PureS
example (program : CTS.Program) (layout : ActionDispatcher program) :
    DecidableEq (Research.RootResetFiniteMarkerObserver.observer program layout).Control := inferInstance
