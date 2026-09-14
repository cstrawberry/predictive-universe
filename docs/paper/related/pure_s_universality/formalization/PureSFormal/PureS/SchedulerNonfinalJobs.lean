import PureSFormal.PureS.SchedulerJobHandoff
import PureSFormal.PureS.SchedulerNestedResponse

/-!
# Exact recurrence for nonfinal jobs of one stage

This module consumes completed nonempty jobs whose continuations still expose
another clock wrapper.  Each recursive layer contains the current job's exact
response trace followed by the next wrapper launch and complete fuel phase.
It stops at the Base-producing fuel sample of the final job.
-/

namespace PureSFormal.PureS

namespace SchedulerNonfinalJobs

open SchedulerControl SchedulerInvariant SchedulerCycle
  SchedulerResponseInvariant SchedulerCompletedContext

/-- Exact sampled trace through `count` nonfinal jobs, ending at the final
job's Base-producing fuel sample.  The actual stage/fuel is `fuel + 1`. -/
def InvariantAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (fuel count sampleIndex : Nat)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers) : Prop :=
  ∃ nextParents : List ParentFrame,
  ∃ configurations : List (SchedulerInvariant.Configuration program dispatcher),
    let bits := bit :: suffix
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    ExactMutationChain (SchedulerControl.machine program dispatcher)
      (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher bits
        (Registers.newJob program)
        (Dovetail.clockExit (fuel + 1) 0 environment) nextParents (fuel + 1) 0)
      (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher bits
        (Registers.newJob program)
        (Dovetail.clockExit (fuel + 1) count environment) outerParents
        (fuel + 1) 0)
      configurations ∧
    IndexedResponseSampledStates program dispatcher (bit :: suffix)
      sampleIndex configurations ∧
    configurations.length =
      ExactCheckpointRun.jobsCost program dispatcher (bit :: suffix) (fuel + 1)
        count ∧
    CompletedParents program dispatcher nextParents (layers + count)

/-- Construct all nonfinal jobs using the verified response and handoff phase
executors. -/
theorem completeAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (fuel : Nat)
    (allNonempty : ∀ index, index ≤ fuel + 1 →
      (CTS.iterate program index
        (CTS.initial program (bit :: suffix))).data ≠ []) :
    ∀ (count sampleIndex : Nat) (outerParents : List ParentFrame)
      (layers : Nat)
      (outer : CompletedParents program dispatcher outerParents layers),
      InvariantAt program dispatcher bit suffix fuel count sampleIndex
        outerParents layers outer
  | 0, sampleIndex, outerParents, layers, outer => by
      exact ⟨outerParents, [], .done 0 ⟨rfl, rfl⟩, .nil sampleIndex, rfl,
        by simpa using outer⟩
  | count + 1, sampleIndex, outerParents, layers, outer => by
      let bits := bit :: suffix
      let environment :=
        environmentCode (compileActions program dispatcher.tree) bits
      let continuation := Dovetail.clockExit (fuel + 1) (count + 1) environment
      obtain ⟨responseParents, checkRegisters, responseConfigurations,
          responseChain, responseSampled, responseLength, responseOuter,
          responseErase, responseArity⟩ :=
        SchedulerNestedResponse.completeNonemptyJobAt program dispatcher bit
          suffix (fuel + 1) count (fuel + 1) sampleIndex environment outerParents
          layers outer (Nat.succ_ne_zero fuel) allNonempty
      have handoff := SchedulerJobHandoff.handoffFuelInvariantAt program
        dispatcher bits checkRegisters fuel count
        (sampleIndex + responseConfigurations.length) responseParents
        (layers + 1) responseOuter
      have tail := completeAt program dispatcher bit suffix fuel allNonempty count
        (sampleIndex + responseConfigurations.length +
          (SchedulerJobHandoff.handoffFuelConfigurationsAt program dispatcher
            bits fuel count responseParents).length)
        responseParents (layers + 1) responseOuter
      obtain ⟨terminalParents, tailConfigurations, tailChain, tailSampled,
          tailLength, terminalOuter⟩ := tail
      let handoffConfigurations :=
        SchedulerJobHandoff.handoffFuelConfigurationsAt program dispatcher bits
          fuel count responseParents
      let configurations := responseConfigurations ++
        handoffConfigurations ++ tailConfigurations
      have responseThenHandoff : ExactMutationChain
          (SchedulerControl.machine program dispatcher)
          (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher
            bits (Registers.newJob program)
            (Dovetail.clockExit (fuel + 1) count environment) responseParents
            (fuel + 1) 0)
          (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher
            bits (Registers.newJob program) continuation outerParents
            (fuel + 1) 0)
          (responseConfigurations ++ handoffConfigurations) := by
        exact SchedulerRecurrence.ExactMutationChain.append responseChain
          (by simpa [bits, environment, handoffConfigurations,
              SchedulerJobHandoff.continuationCursorAt] using handoff.chain)
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
      · simpa [bits, environment, continuation, configurations,
          handoffConfigurations] using completeChain
      · simpa [bits, configurations, handoffConfigurations] using
          completeSampled
      · simp only [configurations, List.length_append]
        rw [responseLength,
          SchedulerJobHandoff.handoffFuelConfigurationsAt_length, tailLength]
        rw [ExactCheckpointRun.jobsCost_succ]
        simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
      · have layerEq : (layers + 1) + count = layers + (count + 1) := by
          calc
            (layers + 1) + count = layers + (1 + count) :=
              Nat.add_assoc layers 1 count
            _ = layers + (count + 1) :=
              congrArg (Nat.add layers) (Nat.add_comm 1 count)
        rw [← layerEq]
        exact terminalOuter

end SchedulerNonfinalJobs

end PureSFormal.PureS
