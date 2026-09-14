import PureSFormal.PureS.SchedulerFirstEmpty

/-!
# Exact recurrence for nonfinal absorbing-empty jobs

When the dovetailed seed itself is empty, every bounded job follows the
absorbing EMPTY family.  This module composes each completed EMPTY response,
its arity-three launch, and the next full fuel phase, stopping at the final
job's Base-producing sample.
-/

namespace PureSFormal.PureS

namespace SchedulerNonfinalEmptyJobs

open SchedulerControl SchedulerInvariant SchedulerCycle
  SchedulerResponseInvariant SchedulerCompletedContext

/-- Exact sampled trace through `count` nonfinal empty jobs. -/
def InvariantAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (fuel count sampleIndex : Nat) (outerParents : List ParentFrame)
    (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers) : Prop :=
  ∃ nextParents : List ParentFrame,
  ∃ configurations : List (SchedulerInvariant.Configuration program dispatcher),
    let environment :=
      environmentCode (compileActions program dispatcher.tree) []
    ExactMutationChain (SchedulerControl.machine program dispatcher)
      (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher []
        (Registers.newJob program)
        (Dovetail.clockExit (fuel + 1) 0 environment) nextParents (fuel + 1) 0)
      (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher []
        (Registers.newJob program)
        (Dovetail.clockExit (fuel + 1) count environment) outerParents
        (fuel + 1) 0)
      configurations ∧
    IndexedResponseSampledStates program dispatcher [] sampleIndex
      configurations ∧
    configurations.length =
      ExactCheckpointRun.jobsCost program dispatcher [] (fuel + 1) count ∧
    CompletedParents program dispatcher nextParents (layers + count)

/-- Construct all nonfinal absorbing-empty jobs with exact public cost. -/
theorem completeAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (fuel : Nat) :
    ∀ (count sampleIndex : Nat) (outerParents : List ParentFrame)
      (layers : Nat)
      (outer : CompletedParents program dispatcher outerParents layers),
      InvariantAt program dispatcher fuel count sampleIndex outerParents layers
        outer
  | 0, sampleIndex, outerParents, layers, outer => by
      exact ⟨outerParents, [], .done 0 ⟨rfl, rfl⟩, .nil sampleIndex, rfl,
        by simpa using outer⟩
  | count + 1, sampleIndex, outerParents, layers, outer => by
      let environment :=
        environmentCode (compileActions program dispatcher.tree) []
      let continuation := Dovetail.clockExit (fuel + 1) (count + 1) environment
      let initialRegisters := SchedulerNestedEmpty.initialEmptyRegisters program
      let finalRegisters := SchedulerCycle.emptySweepRegisters program fuel
        initialRegisters
      let initialCarrier := baseCarrier environment continuation
      let finalCarrier := SchedulerCycle.emptySweepCarrier program dispatcher []
        continuation fuel initialRegisters initialCarrier
      let nextParents :=
        SchedulerRootContinuation.emptyContinuationParents program dispatcher
          finalRegisters [] finalCarrier outerParents
      obtain ⟨responseConfigurations, responseChain, responseSampled,
          responseLength, responseOuter⟩ :=
        SchedulerNestedEmpty.nonterminalEmptyJobSegment program dispatcher []
          sampleIndex fuel count outerParents layers outer
      have nextOuter : CompletedParents program dispatcher nextParents
          (layers + 1) := by
        simpa [nextParents, finalRegisters, finalCarrier, initialRegisters,
          initialCarrier, continuation, environment] using responseOuter
      let nextContinuation := Dovetail.clockExit (fuel + 1) count environment
      have fuelInvariant := SchedulerNestedPhase.fuelPhaseInvariantAt program
        dispatcher [] (Registers.newJob program) (CTS.zeroPhase program) [] false
        (RegistersCoherent.initial program) nextContinuation
        (Dovetail.clockExit_admissible (fuel + 1) count environment) nextParents
        (layers + 1) nextOuter (sampleIndex + responseConfigurations.length)
        (fuel + 1)
      let fuelConfigurations :=
        SchedulerNestedPhase.fuelConfigurationsAt program dispatcher []
          (Registers.newJob program) nextContinuation nextParents (fuel + 1) 0
      have fuelChain : ExactMutationChain
          (SchedulerControl.machine program dispatcher)
          (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher []
            (Registers.newJob program) nextContinuation nextParents (fuel + 1) 0)
          (SchedulerNestedEmpty.nextEmptyJobSourceConfiguration program
            dispatcher fuel count finalRegisters finalCarrier outerParents)
          fuelConfigurations := by
        simpa [fuelConfigurations, nextContinuation, nextParents,
          SchedulerNestedEmpty.nextEmptyJobSourceConfiguration, finalRegisters,
          finalCarrier, environment] using fuelInvariant.chain
      have fuelSampled : IndexedResponseSampledStates program dispatcher []
          (sampleIndex + responseConfigurations.length) fuelConfigurations := by
        simpa [fuelConfigurations] using fuelInvariant.sampled
      have tail := completeAt program dispatcher fuel count
        (sampleIndex + responseConfigurations.length + fuelConfigurations.length)
        nextParents (layers + 1) nextOuter
      obtain ⟨terminalParents, tailConfigurations, tailChain, tailSampled,
          tailLength, terminalOuter⟩ := tail
      let configurations := responseConfigurations ++ fuelConfigurations ++
        tailConfigurations
      have responseFuel := SchedulerRecurrence.ExactMutationChain.append
        responseChain fuelChain
      have completeChain := SchedulerRecurrence.ExactMutationChain.append
        responseFuel tailChain
      have responseFuelSampled :=
        SchedulerNestedPhase.IndexedResponseSampledStates.append program
          dispatcher [] responseSampled fuelSampled
      have completeSampled :=
        SchedulerNestedPhase.IndexedResponseSampledStates.append program
          dispatcher [] responseFuelSampled (by
            simpa [Nat.add_assoc] using tailSampled)
      refine ⟨terminalParents, configurations, ?_, ?_, ?_, ?_⟩
      · simpa [configurations, continuation, nextContinuation, environment]
          using completeChain
      · simpa [configurations] using completeSampled
      · have initialCoherent : RegistersCoherent initialRegisters
            (CTS.zeroPhase program) [] true := by
          simpa [initialRegisters] using
            (SchedulerNestedEmpty.initialEmptyRegisters_coherent program)
        have cleanupEq :
            SchedulerRootContinuation.emptyCleanupMutations program dispatcher
                fuel initialRegisters =
              ExactCheckpointRun.jobCost program dispatcher [] (fuel + 1) := by
          calc
            SchedulerRootContinuation.emptyCleanupMutations program dispatcher
                fuel initialRegisters =
                SchedulerNestedResponse.nonemptySweepCost program dispatcher
                  (fuel + 1) (CTS.initial program []) := by
              simpa [CTS.initial] using
                (SchedulerFirstEmpty.emptyCleanupMutations_eq_nonemptySweepCost
                  program dispatcher fuel initialRegisters
                  (CTS.zeroPhase program) initialCoherent)
            _ = ExactCheckpointRun.jobCost program dispatcher [] (fuel + 1) :=
              SchedulerNestedResponse.nonemptySweepCost_initial_eq_jobCost
                program dispatcher [] (fuel + 1)
        simp only [configurations, List.length_append]
        rw [responseLength,
          SchedulerNestedPhase.fuelConfigurationsAt_length, tailLength,
          cleanupEq, ExactCheckpointRun.jobsCost_succ]
        have addShuffle (a b c : Nat) :
            a + 1 + (b + 5) + c = b + 6 + a + c := by
          apply congrArg (fun value => value + c)
          calc
            (a + 1) + (b + 5) = a + (1 + (b + 5)) :=
              Nat.add_assoc a 1 (b + 5)
            _ = a + ((1 + b) + 5) :=
              congrArg (Nat.add a) (Nat.add_assoc 1 b 5).symm
            _ = a + ((b + 1) + 5) :=
              congrArg (fun value => a + (value + 5)) (Nat.add_comm 1 b)
            _ = a + (b + (1 + 5)) :=
              congrArg (Nat.add a) (Nat.add_assoc b 1 5)
            _ = a + (b + 6) := rfl
            _ = (b + 6) + a := Nat.add_comm a (b + 6)
        exact addShuffle _ _ _
      · have layerEq : (layers + 1) + count = layers + (count + 1) := by
          calc
            (layers + 1) + count = layers + (1 + count) :=
              Nat.add_assoc layers 1 count
            _ = layers + (count + 1) :=
              congrArg (Nat.add layers) (Nat.add_comm 1 count)
        exact Eq.mp
          (congrArg
            (fun count => CompletedParents program dispatcher terminalParents count)
            layerEq)
          terminalOuter

end SchedulerNonfinalEmptyJobs

end PureSFormal.PureS
