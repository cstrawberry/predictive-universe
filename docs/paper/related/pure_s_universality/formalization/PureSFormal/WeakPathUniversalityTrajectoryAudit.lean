import PureSFormal.WeakPathUniversalityTrajectory

/-!
# Axiom audit for fixed Rogozhin trajectory composition

The expected footprint is only `propext`.  In particular, the composition
uses neither an assumed arbitrary-machine compiler nor a choice-selected
registered path.
-/

namespace PureSFormal.WeakPathUniversality

#print axioms fixedRogozhinCheckpointTerm_decode
#print axioms fixedRogozhinBareTermDecoder_checkpoint_eq_pass
#print axioms fixedRogozhinPassDecoder_registeredPath_arrival
#print axioms fixedRogozhinBareTermDecoder_registeredPath_arrival
#print axioms exists_registeredPath_arrival_of_running
#print axioms fixedRogozhinBareTermDecoder_canonicalCheckpoint
#print axioms exists_fixedRogozhinDecodedArrivalCheckpoint_of_running
#print axioms exists_fixedRogozhinDecodedCheckpoint_of_running

end PureSFormal.WeakPathUniversality
