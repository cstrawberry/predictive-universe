import PureSFormal.PureS.FiniteControllerBound
import PureSFormal.PureS.SchedulerControl

/-!
# Executable mutation-search bound for the compiled scheduler

The scheduler's dependent finite tags have constructive equality procedures.
Specializing the generic finite-control/occurrence theorem then gives one
uniform, configuration-only fuel function for every contraction search.
-/

namespace PureSFormal.PureS

deriving instance DecidableEq for Dispatcher.Tree
deriving instance DecidableEq for SchedulerControl.ProbeKind
deriving instance DecidableEq for SchedulerControl.Macro
deriving instance DecidableEq for SchedulerControl.Control

namespace SchedulerBound

open FiniteController SchedulerControl

abbrev Configuration (program : CTS.Program)
    (dispatcher : ActionDispatcher program) :=
  FiniteController.Configuration (SchedulerControl.Control program dispatcher)

/-- Runtime-state count times the number of occurrences in the erased term. -/
def bound (program : CTS.Program) (dispatcher : ActionDispatcher program) :
    Configuration program dispatcher → Nat :=
  FiniteController.stateBound (SchedulerControl.machine program dispatcher)

theorem bound_eq (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (configuration : Configuration program dispatcher) :
    bound program dispatcher configuration =
      (FiniteController.runtimeStates
        (SchedulerControl.machine program dispatcher)).length *
        configuration.cursor.erase.size :=
  FiniteController.stateBound_eq
    (SchedulerControl.machine program dispatcher) configuration

/-- Any known later mutation is found within the scheduler's uniform bound. -/
theorem seekMutation_bound
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    {fuel : Nat}
    {before after : Configuration program dispatcher}
    (found : FiniteController.seekMutation
      (SchedulerControl.machine program dispatcher) fuel before = some after) :
    FiniteController.seekMutation
        (SchedulerControl.machine program dispatcher)
        (bound program dispatcher before) before = some after :=
  FiniteController.seekMutation_stateBound
    (SchedulerControl.machine program dispatcher) found

end SchedulerBound

end PureSFormal.PureS
