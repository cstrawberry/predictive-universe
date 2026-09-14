import PureSFormal.PureS.SchedulerNestedPhase

/-!
# Exact arity-three job handoff

Every nonfinal completed job exposes a three-argument clock continuation.
The continuation table performs its single launch contraction and then the
ordinary fuel family expands the next bounded job.  This module packages that
whole block with its literal mutation list and indexed scheduler invariant.
-/

namespace PureSFormal.PureS

namespace SchedulerJobHandoff

open SchedulerControl SchedulerInvariant SchedulerCycle
  SchedulerResponseInvariant SchedulerCompletedContext

/-- Literal continuation cursor checked between two jobs of one stage. -/
def continuationCursorAt
    (stage remaining : Nat) (environment : Term)
    (parents : List ParentFrame) : Cursor :=
  ⟨Dovetail.clockExit stage (remaining + 1) environment, parents⟩

/-- Exact post-launch fuel source for the next job. -/
def launchConfigurationAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (stage remaining : Nat) (environment : Term)
    (parents : List ParentFrame) : SchedulerInvariant.Configuration program dispatcher :=
  fuelPhaseSourceConfiguration program dispatcher (Registers.newJob program)
    stage environment (Dovetail.clockExit stage remaining environment) parents

/-- The syntactic clock wrapper contracts to the literal next-job source. -/
@[simp]
theorem continuationCursorAt_rdx
    (stage remaining : Nat) (environment : Term)
    (parents : List ParentFrame) :
    (continuationCursorAt stage remaining environment parents).rdx? =
      some (fuelCursor stage environment
        (Dovetail.clockExit stage remaining environment) parents) := by
  rfl

/-- Exact microtick budget through the arity-three probes and launch row. -/
def handoffTicksAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (stage remaining : Nat)
    (environment : Term) (parents : List ParentFrame) : Nat :=
  1 + SchedulerControl.compiledProbeCost program dispatcher
      (.arityThree (.continuation registers.empty))
      (continuationCursorAt stage remaining environment parents) + 1

/-- The continuation table performs exactly the next-job launch contraction. -/
theorem handoff_countedRunAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (stage remaining : Nat)
    (environment : Term) (parents : List ParentFrame) :
    CountedRun (SchedulerControl.machine program dispatcher)
      (handoffTicksAt program dispatcher registers stage remaining environment
        parents) 1
      (SchedulerContinuation.checkConfiguration program dispatcher registers
        (continuationCursorAt stage remaining environment parents))
      (launchConfigurationAt program dispatcher stage remaining environment
        parents) := by
  let cursor := continuationCursorAt stage remaining environment parents
  let after := fuelCursor stage environment
    (Dovetail.clockExit stage remaining environment) parents
  have arity : cursor.focus.headArity = 3 := by
    simpa [cursor, continuationCursorAt] using
      (Dovetail.headArity_clockExit_succ stage remaining environment)
  have checked := SchedulerContinuation.arityThreeDecision_zeroRun program
    dispatcher registers cursor arity
  have launched := SchedulerContinuation.arityThreeDecision_countedStep program
    dispatcher registers cursor after (by
      simpa [cursor, after] using
        continuationCursorAt_rdx stage remaining environment parents)
  have combined := checked.toCounted.trans launched
  simpa [handoffTicksAt, cursor, after, launchConfigurationAt,
    SchedulerContinuation.fuelConfiguration] using! combined

/-- Executable first-mutation search for the arity-three handoff. -/
theorem handoff_seekAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (stage remaining : Nat)
    (environment : Term) (parents : List ParentFrame) :
    FiniteController.seekMutation (SchedulerControl.machine program dispatcher)
      (handoffTicksAt program dispatcher registers stage remaining environment
        parents)
      (SchedulerContinuation.checkConfiguration program dispatcher registers
        (continuationCursorAt stage remaining environment parents)) =
      some (launchConfigurationAt program dispatcher stage remaining environment
        parents) := by
  let cursor := continuationCursorAt stage remaining environment parents
  let after := fuelCursor stage environment
    (Dovetail.clockExit stage remaining environment) parents
  have arity : cursor.focus.headArity = 3 := by
    simpa [cursor, continuationCursorAt] using
      (Dovetail.headArity_clockExit_succ stage remaining environment)
  have checked := SchedulerContinuation.arityThreeDecision_zeroRun program
    dispatcher registers cursor arity
  have immediate : FiniteController.seekMutation
      (SchedulerControl.machine program dispatcher) 1
      (SchedulerContinuation.arityDecisionConfiguration program dispatcher
        registers true cursor) =
      some (SchedulerContinuation.fuelConfiguration program dispatcher after) := by
    simp [FiniteController.seekMutation,
      SchedulerContinuation.arityDecisionConfiguration,
      SchedulerContinuation.fuelConfiguration, FiniteController.mutationCount,
      FiniteController.step, SchedulerControl.machine,
      SchedulerControl.transition, Primitive.exec,
      show cursor.rdx? = some after by
        simpa [cursor, after] using
          continuationCursorAt_rdx stage remaining environment parents]
  simpa [handoffTicksAt, cursor, after, launchConfigurationAt,
    SchedulerContinuation.fuelConfiguration, Nat.add_assoc] using!
      checked.seekMutation_prepend immediate

/-- The launch sample is rejected by the public decoder under every completed
outer continuation prefix. -/
theorem launch_silentAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (fuel remaining : Nat)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers) :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    SilentEvidence program dispatcher.tree .fuel
      (launchConfigurationAt program dispatcher (fuel + 1) remaining
        environment outerParents).cursor.erase := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let continuation := Dovetail.clockExit (fuel + 1) remaining environment
  let endpoint : Term :=
    .app (.app (C (fuel + 1)) environment) continuation
  have eraseEq :
      (launchConfigurationAt program dispatcher (fuel + 1) remaining
        environment outerParents).cursor.erase =
        Cursor.rebuild outerParents endpoint := by
    rfl
  change SilentEvidence program dispatcher.tree .fuel
    (launchConfigurationAt program dispatcher (fuel + 1) remaining environment
      outerParents).cursor.erase
  rw [eraseEq]
  apply SilentEvidence.ofPublic
  apply CheckpointExclusion.Noncheckpoint.fuelSource (outer.prefix endpoint)
  exact ⟨fuel, word bits, continuation, by
    simp [endpoint, environment, CheckpointDecoder.openEnvironment_word]⟩

/-- Full reachable-audit invariant at the post-launch fuel source. -/
theorem launch_holdsAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (fuel remaining : Nat)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers) :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    Holds program dispatcher
      (launchConfigurationAt program dispatcher (fuel + 1) remaining
        environment outerParents) := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let continuation := Dovetail.clockExit (fuel + 1) remaining environment
  let focus : Term := .app (.app (C (fuel + 1)) environment) continuation
  have silent := launch_silentAt program dispatcher bits fuel remaining
    outerParents layers outer
  exact .intro (.macro (.family .fuel) (Registers.newJob program)) rfl
    (CTS.zeroPhase program) [] false (RegistersCoherent.initial program)
    (ControlPosition.macro (context := contextOfParents outerParents)
      (focus := focus) (cursorAtContextOfParents focus outerParents)
      (by trivial))
    (.fuel (.silent (by
      simpa [launchConfigurationAt, environment, continuation, focus] using
        silent)))

/-- Indexed sampled-state wrapper for the post-launch fuel source. -/
theorem launch_sampledAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (sampleNumber fuel remaining : Nat)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers) :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    SampledState program dispatcher bits sampleNumber
      (launchConfigurationAt program dispatcher (fuel + 1) remaining
        environment outerParents) := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  have silent := launch_silentAt program dispatcher bits fuel remaining
    outerParents layers outer
  exact SampledState.ofSilent
    (.macro (.family .fuel) (Registers.newJob program))
    (launch_holdsAt program dispatcher bits fuel remaining outerParents layers
      outer)
    rfl (by simpa [environment] using! silent)

/-- Literal samples of a complete next-job launch and fuel expansion. -/
def handoffFuelConfigurationsAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (fuel remaining : Nat)
    (outerParents : List ParentFrame) :
    List (SchedulerInvariant.Configuration program dispatcher) :=
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let continuation := Dovetail.clockExit (fuel + 1) remaining environment
  launchConfigurationAt program dispatcher (fuel + 1) remaining environment
      outerParents ::
    SchedulerNestedPhase.fuelConfigurationsAt program dispatcher bits
      (Registers.newJob program) continuation outerParents (fuel + 1) 0

/-- The handoff plus fuel expansion is exactly the registered launch cost. -/
@[simp]
theorem handoffFuelConfigurationsAt_length
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (fuel remaining : Nat)
    (outerParents : List ParentFrame) :
    (handoffFuelConfigurationsAt program dispatcher bits fuel remaining
      outerParents).length = 2 * (fuel + 1) + 6 := by
  simp [handoffFuelConfigurationsAt]

/-- Exact operational and semantic package for one subsequent job launch down
to its Base-producing fuel endpoint. -/
structure HandoffFuelInvariantAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program)
    (fuel remaining sampleIndex : Nat)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers) : Prop where
  chain :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    let continuation := Dovetail.clockExit (fuel + 1) remaining environment
    ExactMutationChain (SchedulerControl.machine program dispatcher)
      (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher bits
        (Registers.newJob program) continuation outerParents (fuel + 1) 0)
      (SchedulerContinuation.checkConfiguration program dispatcher registers
        (continuationCursorAt (fuel + 1) remaining environment outerParents))
      (handoffFuelConfigurationsAt program dispatcher bits fuel remaining
        outerParents)
  sampled : IndexedResponseSampledStates program dispatcher bits sampleIndex
    (handoffFuelConfigurationsAt program dispatcher bits fuel remaining
      outerParents)

/-- Compose the exact continuation launch with the already verified fuel
phase, including the launch sample's public rejection. -/
theorem handoffFuelInvariantAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program)
    (fuel remaining sampleIndex : Nat)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers) :
    HandoffFuelInvariantAt program dispatcher bits registers fuel remaining
      sampleIndex outerParents layers outer := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let continuation := Dovetail.clockExit (fuel + 1) remaining environment
  let launch := launchConfigurationAt program dispatcher (fuel + 1) remaining
    environment outerParents
  let tail := SchedulerNestedPhase.fuelConfigurationsAt program dispatcher bits
    (Registers.newJob program) continuation outerParents (fuel + 1) 0
  have found := handoff_seekAt program dispatcher registers (fuel + 1) remaining
    environment outerParents
  have tailInvariant := SchedulerNestedPhase.fuelPhaseInvariantAt program
    dispatcher bits (Registers.newJob program) (CTS.zeroPhase program) [] false
    (RegistersCoherent.initial program) continuation
    (Dovetail.clockExit_admissible (fuel + 1) remaining environment)
    outerParents layers outer (sampleIndex + 1) (fuel + 1)
  have tailChain : ExactMutationChain
      (SchedulerControl.machine program dispatcher)
      (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher bits
        (Registers.newJob program) continuation outerParents (fuel + 1) 0)
      launch tail := by
    simpa [launch, tail, continuation, environment, launchConfigurationAt]
      using tailInvariant.chain
  have launchSample : SampledState program dispatcher bits (sampleIndex + 1)
      launch := by
    simpa [launch, environment] using
      (launch_sampledAt program dispatcher bits (sampleIndex + 1) fuel remaining
        outerParents layers outer)
  have tailSampled : IndexedResponseSampledStates program dispatcher bits
      (sampleIndex + 1) tail := by
    simpa [tail] using tailInvariant.sampled
  refine ⟨?_, ?_⟩
  · simpa [handoffFuelConfigurationsAt, environment, continuation, launch,
      tail] using
      (ExactMutationChain.next
        (handoffTicksAt program dispatcher registers (fuel + 1) remaining
          environment outerParents)
        found tailChain)
  · simpa [handoffFuelConfigurationsAt, environment, continuation, launch,
      tail] using
      (IndexedResponseSampledStates.cons sampleIndex launchSample tailSampled)

end SchedulerJobHandoff

end PureSFormal.PureS
