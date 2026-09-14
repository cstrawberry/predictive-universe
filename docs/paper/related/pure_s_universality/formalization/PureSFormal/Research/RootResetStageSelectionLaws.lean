import PureSFormal.Research.RootResetMixedFirstEmptyStages

/-! Explicit local obligations for reusing the exact stage recurrence with
another selector. These are hypotheses of the assembly theorem, not a claim
that a particular finite controller already satisfies every job obligation. -/
namespace PureSFormal.Research.RootResetStageSelectionLaws
open PureSFormal.PureS
open SchedulerControl RootResetCleanTraversableParents RootResetExactTraceAgreement

abbrev SelectorFamily := (program : CTS.Program) → ActionDispatcher program → Term → Option Term

structure Laws (selector : SelectorFamily) : Prop where
  prelude : ∀ (program : CTS.Program) (layout : ActionDispatcher program) (bits : List Bool),
    SelectorChain (selector program layout)
      (SchedulerControl.initialConfiguration program layout bits)
      (SchedulerRecurrence.initialPreludeConfigurations program layout bits)
  phase : ∀ (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program) (parents : List ParentFrame) {layers : Nat},
    CleanParents program layout parents layers → ∀ fuel,
    let environment := environmentCode (compileActions program layout.tree) bits
    SelectorChain (selector program layout)
      (SchedulerInvariant.clockPhaseSourceConfiguration program layout registers (.left environment :: parents) (fuel + 1))
      (SchedulerNestedPhase.positiveStageConfigurationsAt program layout bits registers parents fuel)
  handoff : ∀ (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program) (fuel remaining : Nat), remaining + 1 ≤ fuel + 1 →
    ∀ (parents : List ParentFrame) {layers : Nat}, CleanParents program layout parents layers →
    let environment := environmentCode (compileActions program layout.tree) bits
    SelectorChain (selector program layout)
      (SchedulerContinuation.checkConfiguration program layout registers
        (SchedulerJobHandoff.continuationCursorAt (fuel + 1) remaining environment parents))
      (SchedulerJobHandoff.handoffFuelConfigurationsAt program layout bits fuel remaining parents)
  job : ∀ (program : CTS.Program) (layout : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (stage jobs fuel : Nat), jobs ≤ stage →
    ∀ (parents : List ParentFrame) (layers : Nat), CleanParents program layout parents layers → fuel ≠ 0 →
    let continuation := RootResetEmptyHandoffContext.exitTerm program layout stage jobs (bit :: suffix)
    ∀ {terminal : SchedulerInvariant.Configuration program layout}
      {configurations : List (SchedulerInvariant.Configuration program layout)},
    SchedulerResponseInvariant.ExactMutationChain (SchedulerControl.machine program layout) terminal
      (SchedulerNestedPhase.fuelTerminalConfigurationAt program layout (bit :: suffix)
        (Registers.newJob program) continuation parents fuel 0) configurations →
    configurations.length = ExactCheckpointRun.jobCost program layout (bit :: suffix) fuel →
    SelectorChain (selector program layout)
      (SchedulerNestedPhase.fuelTerminalConfigurationAt program layout (bit :: suffix)
        (Registers.newJob program) continuation parents fuel 0) configurations

end PureSFormal.Research.RootResetStageSelectionLaws
