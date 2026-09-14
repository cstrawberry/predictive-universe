import PureSFormal.Research.RootResetScopedCarrierWorker
import PureSFormal.Research.RootResetBaseQueueProbe
import PureSFormal.Research.RootResetFuelEndpointPipeline
import PureSFormal.Research.RootResetPendingBaseProbe
import PureSFormal.Research.RootResetEmptyAwareResponseProbe

/-! Unconditional finite Base and completed-response workers. The required
inverse boundary and pending bit are established by the actual entry guard. -/
namespace PureSFormal.Research.RootResetScopedResponseProbes
open PureSFormal.PureS
open FiniteController RootResetProbeSequence

def completed (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Worker :=
  RootResetScopedCarrierWorker.worker program tree (RootResetCompletedResponseProbe.worker program tree false)
    (RootResetEmptyAwareResponseProbe.worker program tree)
def completedCoefficient (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Nat :=
  RootResetScopedCarrierWorker.coefficient program tree (RootResetCompletedResponseProbe.coefficient program tree false)
    (RootResetEmptyAwareResponseProbe.coefficient program tree)

theorem completed_restoring (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :
    (completed program tree).Restoring (completedCoefficient program tree) := by
  apply RootResetScopedCarrierWorker.restoring program tree _ _ _ _
    (RootResetCompletedResponseProbe.terminal program tree false) (RootResetEmptyAwareResponseProbe.terminal program tree)
  · intro origin boundary
    obtain ⟨ticks, ready, endpoint, bounded, actual, facts⟩ := RootResetCompletedResponseProbe.all_input program tree false origin boundary
    exact ⟨ticks, ready, endpoint, .done ready, bounded, actual, rfl, facts⟩
  · exact RootResetEmptyAwareResponseProbe.restoring program tree

theorem completed_terminal (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : (completed program tree).Terminal :=
  RootResetScopedCarrierWorker.terminal program tree _ _
theorem completed_readOnly (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : (completed program tree).ReadOnly :=
  RootResetScopedCarrierWorker.readOnly program tree _ _ (RootResetCompletedResponseProbe.readOnly program tree false)
    (RootResetEmptyAwareResponseProbe.readOnly program tree)

def base (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Worker :=
  RootResetScopedCarrierWorker.worker program tree (RootResetBaseQueueProbe.worker program tree) (RootResetBaseQueueProbe.worker program tree)
def baseCoefficient (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Nat :=
  RootResetScopedCarrierWorker.coefficient program tree (RootResetBaseQueueProbe.coefficient program tree) (RootResetBaseQueueProbe.coefficient program tree)

theorem base_restoring (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :
    (base program tree).Restoring (baseCoefficient program tree) :=
  RootResetScopedCarrierWorker.restoring program tree _ _ _ _ (RootResetBaseQueueProbe.terminal program tree)
    (RootResetBaseQueueProbe.terminal program tree) (RootResetBaseQueueProbe.all_input program tree) (RootResetBaseQueueProbe.all_input program tree)
theorem base_terminal (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : (base program tree).Terminal :=
  RootResetScopedCarrierWorker.terminal program tree _ _
theorem base_readOnly (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : (base program tree).ReadOnly :=
  RootResetScopedCarrierWorker.readOnly program tree _ _ (RootResetBaseQueueProbe.readOnly program tree) (RootResetBaseQueueProbe.readOnly program tree)

def baseEndpoint (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Worker :=
  RootResetProbeSequence.worker (base program tree) (RootResetPendingBaseProbe.worker program tree)

def baseEndpointCoefficient (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Nat :=
  baseCoefficient program tree + RootResetPendingBaseProbe.coefficient program tree + 2

theorem baseEndpoint_restoring (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :
    (baseEndpoint program tree).Restoring (baseEndpointCoefficient program tree) :=
  RootResetProbeSequence.restoring _ _ _ _ (base_terminal program tree) (RootResetPendingBaseProbe.terminal program tree)
    (base_restoring program tree) (RootResetPendingBaseProbe.all_input program tree)

theorem baseEndpoint_terminal (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :
    (baseEndpoint program tree).Terminal := RootResetProbeSequence.terminal _ _

theorem baseEndpoint_readOnly (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :
    (baseEndpoint program tree).ReadOnly :=
  RootResetProbeSequence.readOnly _ _ (base_readOnly program tree) (RootResetPendingBaseProbe.readOnly program tree)

def endpoint (program : CTS.Program) (layout : ActionDispatcher program) : Worker :=
  RootResetProbeSequence.worker (baseEndpoint program layout.tree) (RootResetFuelEndpointPipeline.worker program layout)
def endpointCoefficient (program : CTS.Program) (layout : ActionDispatcher program) : Nat :=
  baseEndpointCoefficient program layout.tree + RootResetFuelEndpointPipeline.coefficient program layout + 2

theorem endpoint_restoring (program : CTS.Program) (layout : ActionDispatcher program) :
    (endpoint program layout).Restoring (endpointCoefficient program layout) :=
  RootResetProbeSequence.restoring _ _ _ _ (baseEndpoint_terminal program layout.tree) (RootResetFuelEndpointPipeline.terminal program layout)
    (baseEndpoint_restoring program layout.tree) (RootResetFuelEndpointPipeline.all_input program layout)
theorem endpoint_terminal (program : CTS.Program) (layout : ActionDispatcher program) : (endpoint program layout).Terminal :=
  RootResetProbeSequence.terminal _ _
theorem endpoint_readOnly (program : CTS.Program) (layout : ActionDispatcher program) : (endpoint program layout).ReadOnly :=
  RootResetProbeSequence.readOnly _ _ (baseEndpoint_readOnly program layout.tree) (RootResetFuelEndpointPipeline.readOnly program layout)
theorem endpoint_erase (program : CTS.Program) (layout : ActionDispatcher program) (ticks : Nat)
    (configuration : Configuration (endpoint program layout).Control) :
    (run (endpoint program layout).machine ticks configuration).cursor.erase = configuration.cursor.erase :=
  (endpoint program layout).erase_run (endpoint_readOnly program layout) ticks configuration

end PureSFormal.Research.RootResetScopedResponseProbes
