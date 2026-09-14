import PureSFormal.Research.RootResetFiniteFirstEmptyJob

/-! Every actual job on a nonempty input, including transitions to EMPTY. -/
namespace PureSFormal.Research.RootResetFiniteBitConsJob
open PureSFormal.PureS
open SchedulerControl SchedulerInvariant SchedulerCycle SchedulerResponseInvariant
open SchedulerNestedResponse RootResetPersistentResponseSelector
open RootResetWrappedFrameSelectorProof RootResetMarkedFrameSelectorProof
open RootResetFiniteNormalResponseChain RootResetCleanTraversableParents
open RootResetMixedNormalResponseChain
open RootResetFiniteMixedNonemptySweep

/-- The existing scheduler job sample list is selected at every contraction.
The proof covers every finite output, including a first empty response at any
position, and both nonfinal and terminal exits. -/
theorem completeJob_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (stage jobs fuel : Nat)
    (jobsBound : jobs ≤ stage)
    (parents : List ParentFrame) (layers : Nat)
    (clean : CleanParents program dispatcher parents layers)
    (positive : fuel ≠ 0) :
    let continuation := RootResetEmptyHandoffContext.exitTerm program dispatcher stage jobs (bit :: suffix)
    ∀ {terminal : SchedulerNestedResponse.Configuration program dispatcher}
      {configurations : List (SchedulerNestedResponse.Configuration program dispatcher)},
      ExactMutationChain (SchedulerControl.machine program dispatcher) terminal
        (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher (bit :: suffix)
          (Registers.newJob program) continuation parents fuel 0) configurations →
      configurations.length = ExactCheckpointRun.jobCost program dispatcher (bit :: suffix) fuel →
      RootResetExactTraceAgreement.SelectorChain (RootResetFinitePrioritySelector.selectStep? program dispatcher)
        (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher (bit :: suffix)
          (Registers.newJob program) continuation parents fuel 0) configurations := by
  dsimp only
  intro terminal configurations actual lengthEq
  cases fuel with
  | zero => exact (positive rfl).elim
  | succ remaining =>
      let bits := bit :: suffix
      let environment := environmentCode (compileActions program dispatcher.tree) bits
      let continuation := RootResetEmptyHandoffContext.exitTerm program dispatcher stage jobs bits
      let afterParents := PrimitiveFuel.pendingParents environment continuation remaining parents
      let fullParents := PrimitiveFuel.pendingParents environment continuation (remaining + 1) parents
      obtain ⟨outerContext, fullContext, innerContext, targetContext, descentTicks, responseTicks, response, baseRun⟩ :=
        nonemptyBase_toSelected_zeroRunAt program dispatcher bit suffix continuation
          (Dovetail.clockExit_admissible stage jobs environment) remaining parents
      have parentSplit : fullParents =
          .right (SchedulerResponse.pendingFunction program dispatcher bits continuation) :: afterParents := by
        simpa [fullParents, afterParents, environment, continuation, SchedulerResponse.pendingFunction,
          PendingFrame.environmentCode_eq_envelope, PendingFrame.frameFunction] using
          (pendingParents_succ_cons environment continuation remaining parents)
      have baseRun' : ZeroMutationRun (SchedulerControl.machine program dispatcher) descentTicks
          (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher bits
            (Registers.newJob program) continuation parents (remaining + 1) 0)
          (upConfiguration program dispatcher (Registers.newJob program).clearScan omega
            (ContextCursor.frames fullContext omega
              (.right (SchedulerResponse.pendingFunction program dispatcher bits continuation) :: afterParents))) := by
        rw [← parentSplit]
        simpa [bits, continuation, environment, fullParents] using baseRun
      have response' : SelectedResponseTrace program dispatcher bits continuation
          (baseCarrier environment continuation) (Dovetail.clockExit_admissible stage jobs environment)
          (Registers.newJob program).clearScan bit suffix outerContext fullContext innerContext targetContext
          afterParents responseTicks := by
        simpa [bits, continuation, environment, afterParents] using response
      have normal : RootResetOrderedCarrier.NormalInvariant program dispatcher.tree bits continuation
          (baseCarrier environment continuation) ((Registers.newJob program).clearScan).phase (bit :: suffix) 0 := by
        simpa only [MutableBase.initial_eq_baseCarrier] using!
          (RootResetOrderedCarrier.NormalInvariant.initialBase program dispatcher.tree bits continuation
            (baseBeta environment continuation))
      have boundaries := boundaries_of_base program dispatcher bit suffix stage jobs remaining parents clean response'
      obtain ⟨witnessTerminal, witnessConfigurations, witnessChain, witnessSelected, witnessLength⟩ :=
        RootResetFiniteFirstEmptyJob.selectedSweepWitness program dispatcher bits stage jobs jobsBound parents layers clean remaining
          (Registers.newJob program).clearScan (CTS.zeroPhase program) bit suffix (baseCarrier environment continuation)
          outerContext fullContext innerContext targetContext responseTicks 0
          (RegistersCoherent.initial program).clearScan response' normal boundaries
      have wholeChain := ExactMutationChain.prepend baseRun' witnessChain
      have wholeSelected := RootResetExactTraceAgreement.SelectorChain.prepend baseRun' witnessSelected
      apply selectorChain_of_same_exact_length wholeChain actual _ wholeSelected
      rw [witnessLength, lengthEq]
      exact nonemptySweepCost_initial_eq_jobCost program dispatcher bits (remaining + 1)

end PureSFormal.Research.RootResetFiniteBitConsJob
