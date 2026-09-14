import PureSFormal.Research.RootResetMixedStagePhaseSelectorChain
import PureSFormal.PureS.SchedulerJobHandoff

/-! Selection through every launch and fuel expansion between generated jobs. -/
namespace PureSFormal.Research.RootResetMixedJobHandoff

open PureSFormal.PureS
open SchedulerControl SchedulerInvariant SchedulerCycle SchedulerResponseInvariant
open RootResetCleanTraversableParents RootResetPersistentResponseSelector

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
  obtain ⟨roles, history, placed⟩ := RootResetCleanParentPrefix.toPrefix outer
    (RootResetEmptyHandoffContext.exitTerm program dispatcher (fuel + 1) (remaining + 1) bits)
  have selected := RootResetMixedClockFuelSelectorChain.selectStep?_mixed_exit
    program dispatcher (fuel + 1) (remaining + 1) bits bound placed
  simpa only [RootResetEmptyHandoffContext.exitTerm,
    RootResetEmptyContinuationSelector.exitTarget, SchedulerInvariant.contextOfParents_plug]
    using! selected

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
  have tail := RootResetMixedStagePhaseSelectorChain.fuel_mixedSelectorChain
    program dispatcher bits (Registers.newJob program) continuation
    (Dovetail.clockExit_admissible (fuel + 1) remaining environment) parents outer (fuel + 1) 0
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

end PureSFormal.Research.RootResetMixedJobHandoff
