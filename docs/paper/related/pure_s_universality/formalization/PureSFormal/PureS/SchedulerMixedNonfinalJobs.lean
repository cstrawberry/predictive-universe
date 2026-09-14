import PureSFormal.PureS.SchedulerJobHandoff
import PureSFormal.PureS.SchedulerFirstEmpty

/-!
# Exact recurrence for nonfinal first-empty jobs

When a nonempty seed first reaches the absorbing empty word within its bounded
horizon, every dovetailed job follows the same ordinary prefix and EMPTY
suffix.  This module composes those complete jobs with the verified arity-three
handoff and fuel phase, stopping at the Base-producing sample of the final job.
-/

namespace PureSFormal.PureS

namespace SchedulerMixedNonfinalJobs

open SchedulerControl SchedulerInvariant SchedulerCycle
  SchedulerResponseInvariant SchedulerCompletedContext

/-- Exact sampled trace through `count` nonfinal first-empty jobs.  The actual
bounded-job horizon is `previous + remaining + 1`: the first `previous`
transitions retain a nonempty word, the next transition first produces the
empty word, and `remaining` absorbing transitions follow it. -/
def InvariantAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (previous remaining count sampleIndex : Nat)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers) : Prop :=
  ∃ nextParents : List ParentFrame,
  ∃ configurations : List (SchedulerInvariant.Configuration program dispatcher),
    let bits := bit :: suffix
    let fuel := previous + remaining + 1
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    ExactMutationChain (SchedulerControl.machine program dispatcher)
      (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher bits
        (Registers.newJob program)
        (Dovetail.clockExit fuel 0 environment) nextParents fuel 0)
      (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher bits
        (Registers.newJob program)
        (Dovetail.clockExit fuel count environment) outerParents fuel 0)
      configurations ∧
    IndexedResponseSampledStates program dispatcher bits sampleIndex
      configurations ∧
    configurations.length =
      ExactCheckpointRun.jobsCost program dispatcher bits fuel count ∧
    CompletedParents program dispatcher nextParents (layers + count)

/-- Construct every nonfinal job in the mixed first-empty branch at its exact
registered mutation count. -/
theorem completeAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (previous remaining : Nat)
    (priorNonempty : ∀ k, k ≤ previous →
      (CTS.iterate program k
        (CTS.initial program (bit :: suffix))).data ≠ [])
    (firstEmpty :
      (CTS.iterate program (previous + 1)
        (CTS.initial program (bit :: suffix))).data = []) :
    ∀ (count sampleIndex : Nat) (outerParents : List ParentFrame)
      (layers : Nat)
      (outer : CompletedParents program dispatcher outerParents layers),
      InvariantAt program dispatcher bit suffix previous remaining count
        sampleIndex outerParents layers outer
  | 0, sampleIndex, outerParents, layers, outer => by
      exact ⟨outerParents, [], .done 0 ⟨rfl, rfl⟩, .nil sampleIndex, rfl,
        by simpa using outer⟩
  | count + 1, sampleIndex, outerParents, layers, outer => by
      let bits := bit :: suffix
      let fuelBase := previous + remaining
      let fuel := fuelBase + 1
      let environment :=
        environmentCode (compileActions program dispatcher.tree) bits
      let continuation := Dovetail.clockExit fuel (count + 1) environment
      obtain ⟨responseParents, checkRegisters, responseConfigurations,
          responseChain, responseSampled, responseLength, responseOuter,
          responseErase, responseArity⟩ :=
        SchedulerFirstEmpty.completeFirstEmptyJobAt program dispatcher bit suffix
          previous remaining count sampleIndex outerParents layers outer
          priorNonempty firstEmpty
      have handoff := SchedulerJobHandoff.handoffFuelInvariantAt program
        dispatcher bits checkRegisters fuelBase count
        (sampleIndex + responseConfigurations.length) responseParents
        (layers + 1) responseOuter
      let handoffConfigurations :=
        SchedulerJobHandoff.handoffFuelConfigurationsAt program dispatcher bits
          fuelBase count responseParents
      have tail := completeAt program dispatcher bit suffix previous remaining
        priorNonempty firstEmpty count
        (sampleIndex + responseConfigurations.length +
          handoffConfigurations.length)
        responseParents (layers + 1) responseOuter
      obtain ⟨terminalParents, tailConfigurations, tailChain, tailSampled,
          tailLength, terminalOuter⟩ := tail
      let configurations := responseConfigurations ++
        handoffConfigurations ++ tailConfigurations
      have responseThenHandoff : ExactMutationChain
          (SchedulerControl.machine program dispatcher)
          (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher
            bits (Registers.newJob program)
            (Dovetail.clockExit fuel count environment) responseParents fuel 0)
          (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher
            bits (Registers.newJob program) continuation outerParents fuel 0)
          (responseConfigurations ++ handoffConfigurations) := by
        exact SchedulerRecurrence.ExactMutationChain.append responseChain
          (by simpa [bits, fuelBase, fuel, environment, continuation,
              handoffConfigurations, SchedulerJobHandoff.continuationCursorAt]
            using handoff.chain)
      have completeChain := SchedulerRecurrence.ExactMutationChain.append
        responseThenHandoff tailChain
      have handoffSampled : IndexedResponseSampledStates program dispatcher bits
          (sampleIndex + responseConfigurations.length)
          handoffConfigurations := by
        simpa [handoffConfigurations] using handoff.sampled
      have responseAndHandoffSampled :=
        SchedulerNestedPhase.IndexedResponseSampledStates.append program
          dispatcher bits responseSampled handoffSampled
      have completeSampled :=
        SchedulerNestedPhase.IndexedResponseSampledStates.append program
          dispatcher bits responseAndHandoffSampled (by
            simpa [handoffConfigurations, Nat.add_assoc] using tailSampled)
      refine ⟨terminalParents, configurations, ?_, ?_, ?_, ?_⟩
      · simpa [bits, fuelBase, fuel, environment, continuation,
          configurations, handoffConfigurations, Nat.add_assoc] using
          completeChain
      · simpa [bits, configurations, handoffConfigurations] using
          completeSampled
      · simp only [configurations, List.length_append]
        rw [responseLength,
          SchedulerJobHandoff.handoffFuelConfigurationsAt_length, tailLength,
          ExactCheckpointRun.jobsCost_succ]
        simp [fuelBase, fuel, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
      · have layerEq : (layers + 1) + count = layers + (count + 1) := by
          calc
            (layers + 1) + count = layers + (1 + count) :=
              Nat.add_assoc layers 1 count
            _ = layers + (count + 1) :=
              congrArg (Nat.add layers) (Nat.add_comm 1 count)
        rw [← layerEq]
        exact terminalOuter

end SchedulerMixedNonfinalJobs

end PureSFormal.PureS
