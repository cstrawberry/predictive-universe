import PureSFormal.Research.RootResetFiniteStagePhaseSelectorChain
import PureSFormal.PureS.SchedulerJobHandoff

/-! Selection through every launch and fuel expansion between generated jobs. -/
namespace PureSFormal.Research.RootResetFiniteJobHandoff

open PureSFormal.PureS
open SchedulerControl SchedulerInvariant SchedulerCycle SchedulerResponseInvariant
open RootResetCleanTraversableParents RootResetFinitePrioritySelector

theorem handoff_selects
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program)
    (fuel remaining : Nat) (bound : remaining + 1 ≤ fuel + 1)
    (parents : List ParentFrame) {layers : Nat}
    (outer : CleanParents program dispatcher parents layers) :
    let environment := environmentCode (compileActions program dispatcher.tree) bits
    selectStep? program dispatcher
      (SchedulerContinuation.checkConfiguration program dispatcher registers
        (SchedulerJobHandoff.continuationCursorAt (fuel + 1) remaining environment parents)).cursor.erase =
      some (SchedulerJobHandoff.launchConfigurationAt program dispatcher
        (fuel + 1) remaining environment parents).cursor.erase := by
  exact RootResetFiniteClockFuelSelection.launch outer bits (fuel + 1) remaining


theorem handoffFuel_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program)
    (fuel remaining : Nat) (bound : remaining + 1 ≤ fuel + 1)
    (parents : List ParentFrame) {layers : Nat}
    (outer : CleanParents program dispatcher parents layers) :
    let environment := environmentCode (compileActions program dispatcher.tree) bits
    RootResetExactTraceAgreement.SelectorChain (selectStep? program dispatcher)
      (SchedulerContinuation.checkConfiguration program dispatcher registers
        (SchedulerJobHandoff.continuationCursorAt (fuel + 1) remaining environment parents))
      (SchedulerJobHandoff.handoffFuelConfigurationsAt program dispatcher bits fuel remaining parents) := by
  let environment := environmentCode (compileActions program dispatcher.tree) bits
  let continuation := Dovetail.clockExit (fuel + 1) remaining environment
  have first := handoff_selects program dispatcher bits registers fuel remaining bound parents outer
  have tail := RootResetFiniteStagePhaseSelectorChain.fuel_finiteSelectorChain
    program dispatcher bits (Registers.newJob program) continuation
    (Dovetail.clockExit_admissible (fuel + 1) remaining environment) ⟨fuel + 1, remaining, rfl⟩ parents outer (fuel + 1) 0
  exact .next first tail

theorem handoffFuel_exact_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program)
    (fuel remaining : Nat) (bound : remaining + 1 ≤ fuel + 1)
    (parents : List ParentFrame) {layers : Nat}
    (outer : CleanParents program dispatcher parents layers) :
    let environment := environmentCode (compileActions program dispatcher.tree) bits
    let continuation := Dovetail.clockExit (fuel + 1) remaining environment
    let start := SchedulerContinuation.checkConfiguration program dispatcher registers
      (SchedulerJobHandoff.continuationCursorAt (fuel + 1) remaining environment parents)
    let configurations := SchedulerJobHandoff.handoffFuelConfigurationsAt program dispatcher bits fuel remaining parents
    ExactMutationChain (SchedulerControl.machine program dispatcher)
      (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher bits
        (Registers.newJob program) continuation parents (fuel + 1) 0) start configurations ∧
      RootResetExactTraceAgreement.SelectorChain (selectStep? program dispatcher) start configurations := by
  exact ⟨(SchedulerJobHandoff.handoffFuelInvariantAt program dispatcher bits registers
    fuel remaining 0 parents layers outer.toCompleted).chain,
    handoffFuel_selectorChain program dispatcher bits registers fuel remaining bound parents outer⟩

end PureSFormal.Research.RootResetFiniteJobHandoff
