import PureSFormal.PureS.ControllerProjection
import PureSFormal.PureS.PrimitiveLocalResponse
import PureSFormal.PureS.PrimitiveClock
import PureSFormal.PureS.PrimitiveFuel
import PureSFormal.PureS.EncoderSize
import PureSFormal.WeakPath.CheckpointTime

#print axioms PureSFormal.PureS.FiniteController.step_projects_stepsN
#print axioms PureSFormal.PureS.FiniteController.seekMutation_sound
#print axioms PureSFormal.PureS.FiniteController.exists_seekMutation_of_runMutationCount_pos
#print axioms PureSFormal.PureS.FiniteController.ProductiveSystem.reductionPath
#print axioms PureSFormal.PureS.ControllerProjection.Certificate.realizes
#print axioms PureSFormal.PureS.ControllerProjection.UniformCertificate.uniformRealizes
#print axioms PureSFormal.WeakPath.cumulativeTime_strictlyIncreasing
#print axioms PureSFormal.PureS.PrimitiveScripts.run_action
#print axioms PureSFormal.PureS.PrimitiveScripts.action_rdxCount
#print axioms PureSFormal.PureS.PrimitiveRoute.run_roundTrip
#print axioms PureSFormal.PureS.PrimitiveRoute.roundTrip_rdxCount
#print axioms PureSFormal.PureS.PrimitiveLocalResponse.run_execute
#print axioms PureSFormal.PureS.PrimitiveLocalResponse.execute_rdxCount
#print axioms PureSFormal.PureS.PrimitiveClock.run_growthRoundTrip
#print axioms PureSFormal.PureS.PrimitiveFuel.run_expand
#print axioms PureSFormal.PureS.generator_size_le
