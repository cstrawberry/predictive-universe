import PureSFormal.PureS.SchedulerGlobalRecurrence
import PureSFormal.PureS.SchedulerCompletedContext

/-!
# Scheduler phases below completed Local prefixes

The root clock-to-fuel bridge is parametric in every parent link except for
the final environment boundary.  This module records that parametric form,
so subsequent stages may run below an arbitrary stack of completed Local
continuations without changing the finite controller.
-/

namespace PureSFormal.PureS

namespace SchedulerNestedPhase

open FiniteController SchedulerControl SchedulerInvariant
  SchedulerResponseInvariant SchedulerCycle

open SchedulerCompletedContext

abbrev Configuration (program : CTS.Program)
    (dispatcher : ActionDispatcher program) :=
  SchedulerInvariant.Configuration program dispatcher

/-- Sequential composition of pointwise indexed sample lists. -/
theorem IndexedResponseSampledStates.append
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) {sampleIndex : Nat}
    {first second : List (Configuration program dispatcher)}
    (left : IndexedResponseSampledStates program dispatcher bits sampleIndex
      first)
    (right : IndexedResponseSampledStates program dispatcher bits
      (sampleIndex + first.length) second) :
    IndexedResponseSampledStates program dispatcher bits sampleIndex
      (first ++ second) := by
  induction left with
  | nil sampleIndex => simpa using right
  | @cons sampleIndex head headSample tail tailSampled ih =>
      apply IndexedResponseSampledStates.cons sampleIndex headSample
      apply ih
      simpa [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using right

/-! ## Clock closure and launch in an outer zipper -/

/-- Root of an exposed positive clock, retaining an arbitrary outer zipper. -/
def positiveStageRootCursorAt (stage : Nat) (environment : Term)
    (parents : List ParentFrame) : Cursor :=
  ⟨Dovetail.clockExit stage stage environment, parents⟩

/-- Arity-decision state immediately before the nested launch contraction. -/
def positiveStageArityConfigurationAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (stage : Nat) (environment : Term)
    (parents : List ParentFrame) : Configuration program dispatcher :=
  ⟨some (.macro (.arityDecision .growth true) registers),
    positiveStageRootCursorAt stage environment parents⟩

/-- The immediate environment boundary still fails the wrapper test. -/
theorem growExit_wrapperAnswerAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (stage : Nat) (environment : Term) (parents : List ParentFrame) :
    SchedulerControl.compiledProbeAnswer program dispatcher .growWrapper
      ⟨clockWrappers stage stage, .left environment :: parents⟩ = false := by
  rfl

/-- The same boundary satisfies the registered environment-envelope test. -/
theorem growExit_envelopeAnswerAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (stage : Nat) (bits : List Bool) (parents : List ParentFrame) :
    SchedulerControl.compiledProbeAnswer program dispatcher .growEnvelope
      ⟨clockWrappers stage stage,
        .left (environmentCode
          (compileActions program dispatcher.tree) bits) :: parents⟩ = true := by
  rfl

/-- The exposed positive clock remains the registered arity-three launch. -/
theorem growExit_arityThreeAnswerAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (fuel : Nat) (environment : Term) (parents : List ParentFrame) :
    SchedulerControl.compiledProbeAnswer program dispatcher
      (.arityThree .growth)
      (positiveStageRootCursorAt (fuel + 1) environment parents) = true := by
  rfl

/-- Microtick cost of the nested clock-exit guard. -/
def growExitTicksAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (stage : Nat) (environment : Term) (parents : List ParentFrame) : Nat :=
  ((1 + SchedulerControl.compiledProbeCost program dispatcher .growWrapper
      ⟨clockWrappers stage stage, .left environment :: parents⟩) +
    SchedulerControl.compiledProbeCost program dispatcher .growEnvelope
      ⟨clockWrappers stage stage, .left environment :: parents⟩) + 1 + 1 +
    SchedulerControl.compiledProbeCost program dispatcher
      (.arityThree .growth)
      (positiveStageRootCursorAt stage environment parents)

/-- An exposed clock exit reaches its launch row without mutation in any
outer zipper. -/
theorem growExit_zeroRunAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (fuel : Nat) (bits : List Bool)
    (parents : List ParentFrame) :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (growExitTicksAt program dispatcher (fuel + 1) environment parents)
      ⟨some (.macro .growUp registers),
        ⟨clockWrappers (fuel + 1) (fuel + 1),
          .left environment :: parents⟩⟩
      (positiveStageArityConfigurationAt program dispatcher registers
        (fuel + 1) environment parents) := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let stage := fuel + 1
  let boundary : Cursor :=
    ⟨clockWrappers stage stage, .left environment :: parents⟩
  let root := positiveStageRootCursorAt stage environment parents
  let wrapperStart : Configuration program dispatcher :=
    ⟨some (SchedulerControl.startProbe .growWrapper registers), boundary⟩
  let envelopeStart : Configuration program dispatcher :=
    ⟨some (SchedulerControl.startProbe .growEnvelope registers), boundary⟩
  let moveEndpoint : Configuration program dispatcher :=
    ⟨some (.macro .growMoveEndpoint registers), boundary⟩
  let endpoint : Configuration program dispatcher :=
    ⟨some (.macro .growEndpoint registers), root⟩
  let arityStart : Configuration program dispatcher :=
    ⟨some (SchedulerControl.startProbe (.arityThree .growth) registers), root⟩
  have enter : ZeroMutationRun (SchedulerControl.machine program dispatcher) 1
      ⟨some (.macro .growUp registers), boundary⟩ wrapperStart :=
    ⟨rfl, rfl⟩
  have wrapperProbe := ZeroMutationRun.parentProbe program dispatcher
    .growWrapper registers boundary .right rfl
  have wrapper : ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher .growWrapper
        boundary)
      wrapperStart envelopeStart := by
    simpa [wrapperStart, envelopeStart, boundary,
      SchedulerExecution.commandResult, SchedulerControl.probeAnswer,
      growExit_wrapperAnswerAt] using wrapperProbe
  have envelopeProbe := ZeroMutationRun.parentProbe program dispatcher
    .growEnvelope registers boundary .left rfl
  have envelope : ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher .growEnvelope
        boundary)
      envelopeStart moveEndpoint := by
    simpa [envelopeStart, moveEndpoint, boundary,
      SchedulerExecution.commandResult, SchedulerControl.probeAnswer,
      growExit_envelopeAnswerAt] using! envelopeProbe
  have move : ZeroMutationRun (SchedulerControl.machine program dispatcher) 1
      moveEndpoint endpoint := ⟨rfl, rfl⟩
  have startArity : ZeroMutationRun
      (SchedulerControl.machine program dispatcher) 1 endpoint arityStart :=
    ⟨rfl, rfl⟩
  have arityProbe := ZeroMutationRun.localProbe program dispatcher
    (.arityThree .growth) registers root rfl
  have arity : ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher
        (.arityThree .growth) root)
      arityStart
      (positiveStageArityConfigurationAt program dispatcher registers stage
        environment parents) := by
    simpa [arityStart, positiveStageArityConfigurationAt, root, stage,
      SchedulerExecution.commandResult, SchedulerControl.probeAnswer,
      growExit_arityThreeAnswerAt] using arityProbe
  simpa [growExitTicksAt, boundary, root, stage] using!
    ((((enter.trans wrapper).trans envelope).trans move).trans startArity).trans
      arity

/-- Zero-prefix cost from nested clock closure to the launch row. -/
def clockCompletedToLaunchTicksAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (stage : Nat) (environment : Term) (parents : List ParentFrame) : Nat :=
  (1 + growWrappersTicks program dispatcher stage stage (clockBase stage)
      (.left environment :: parents)) +
    growExitTicksAt program dispatcher stage environment parents

/-- Clock closure returns across its generated wrappers and reaches the nested
launch row without mutation. -/
theorem clockCompletedToLaunch_zeroRunAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (fuel : Nat) (bits : List Bool)
    (parents : List ParentFrame) :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (clockCompletedToLaunchTicksAt program dispatcher (fuel + 1) environment
        parents)
      (clockPhaseCompletedConfiguration program dispatcher registers (fuel + 1)
        (.left environment :: parents))
      (positiveStageArityConfigurationAt program dispatcher registers
        (fuel + 1) environment parents) := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let stage := fuel + 1
  let start : Configuration program dispatcher :=
    ⟨some (.macro .growUp registers),
      ⟨clockBase stage,
        PrimitiveClock.wrapperParents stage stage
          (.left environment :: parents)⟩⟩
  let exposed : Configuration program dispatcher :=
    ⟨some (.macro .growUp registers),
      ⟨clockWrappers stage stage, .left environment :: parents⟩⟩
  have leaveScript : ZeroMutationRun
      (SchedulerControl.machine program dispatcher) 1
      (clockPhaseCompletedConfiguration program dispatcher registers stage
        (.left environment :: parents)) start := ⟨rfl, rfl⟩
  have wrappers := growWrappers_zeroRun program dispatcher registers stage stage
    (clockBase stage) (.left environment :: parents)
  have wrapperRun : ZeroMutationRun
      (SchedulerControl.machine program dispatcher)
      (growWrappersTicks program dispatcher stage stage (clockBase stage)
        (.left environment :: parents)) start exposed := by
    simpa [start, exposed, clockWrap_clockBase_eq_clockWrappers] using wrappers
  have exitRun := growExit_zeroRunAt program dispatcher registers fuel bits
    parents
  simpa [clockCompletedToLaunchTicksAt, stage, start, exposed] using!
    (leaveScript.trans wrapperRun).trans exitRun

/-- Post-launch fuel source retaining the completed outer zipper. -/
def positiveStageLaunchConfigurationAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (fuel : Nat) (environment : Term) (parents : List ParentFrame) :
    Configuration program dispatcher :=
  fuelPhaseSourceConfiguration program dispatcher (Registers.newJob program)
    (fuel + 1) environment (Dovetail.clockExit (fuel + 1) fuel environment)
    parents

/-- The nested arity-three row performs exactly the launch contraction. -/
theorem positiveStageLaunch_stepAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (fuel : Nat) (environment : Term)
    (parents : List ParentFrame) :
    FiniteController.step (SchedulerControl.machine program dispatcher)
      (positiveStageArityConfigurationAt program dispatcher registers
        (fuel + 1) environment parents) =
      positiveStageLaunchConfigurationAt program dispatcher fuel environment
        parents := by
  rfl

/-- The nested launch row contributes one and only one contraction. -/
theorem positiveStageLaunch_countAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (fuel : Nat) (environment : Term)
    (parents : List ParentFrame) :
    FiniteController.mutationCount (SchedulerControl.machine program dispatcher)
      (positiveStageArityConfigurationAt program dispatcher registers
        (fuel + 1) environment parents) = 1 := by
  rfl

/-- Executable sampling finds the nested launch from clock closure. -/
theorem clockCompleted_seekLaunchAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (fuel : Nat) (bits : List Bool)
    (parents : List ParentFrame) :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    FiniteController.seekMutation (SchedulerControl.machine program dispatcher)
      (clockCompletedToLaunchTicksAt program dispatcher (fuel + 1) environment
        parents + 1)
      (clockPhaseCompletedConfiguration program dispatcher registers (fuel + 1)
        (.left environment :: parents)) =
      some (positiveStageLaunchConfigurationAt program dispatcher fuel
        environment parents) := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  exact (clockCompletedToLaunch_zeroRunAt program dispatcher registers fuel bits
    parents).seekMutation_prepend (by
      simpa [FiniteController.seekMutation, positiveStageLaunch_countAt,
        positiveStageLaunch_stepAt])

/-- The nested launch contraction creates a named silent positive-fuel source
below the same completed prefix. -/
theorem positiveStageLaunch_silentAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (fuel : Nat) (outerParents : List ParentFrame)
    (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers) :
    SilentEvidence program dispatcher.tree .fuel
      (positiveStageLaunchConfigurationAt program dispatcher fuel
        (environmentCode (compileActions program dispatcher.tree) bits)
        outerParents).cursor.erase := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let continuation := Dovetail.clockExit (fuel + 1) fuel environment
  let endpoint : Term := .app (.app (C (fuel + 1)) environment) continuation
  have eraseEq :
      (positiveStageLaunchConfigurationAt program dispatcher fuel environment
        outerParents).cursor.erase = Cursor.rebuild outerParents endpoint := by
    rfl
  change SilentEvidence program dispatcher.tree .fuel
    (positiveStageLaunchConfigurationAt program dispatcher fuel environment
      outerParents).cursor.erase
  rw [eraseEq]
  apply SilentEvidence.ofPublic
  apply CheckpointExclusion.Noncheckpoint.fuelSource (outer.prefix endpoint)
  exact ⟨fuel, word bits, continuation, by
    simp [endpoint, environment, CheckpointDecoder.openEnvironment_word]⟩

/-- Full simultaneous invariant at the nested launch sample. -/
theorem positiveStageLaunch_holdsAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (fuel : Nat) (outerParents : List ParentFrame)
    (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers) :
    Holds program dispatcher
      (positiveStageLaunchConfigurationAt program dispatcher fuel
        (environmentCode (compileActions program dispatcher.tree) bits)
        outerParents) := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let continuation := Dovetail.clockExit (fuel + 1) fuel environment
  let focus : Term := .app (.app (C (fuel + 1)) environment) continuation
  have silent := positiveStageLaunch_silentAt program dispatcher bits fuel
    outerParents layers outer
  exact .intro (.macro (.family .fuel) (Registers.newJob program)) rfl
    (CTS.zeroPhase program) [] false (RegistersCoherent.initial program)
    (ControlPosition.macro (context := contextOfParents outerParents)
      (focus := focus) (cursorAtContextOfParents focus outerParents)
      (by trivial))
    (.fuel (.silent (by
      simpa [positiveStageLaunchConfigurationAt, environment, continuation,
        focus] using silent)))

/-- Indexed sampled-state wrapper for the nested launch contraction. -/
theorem positiveStageLaunch_sampledAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (sampleIndex fuel : Nat)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers) :
    SampledState program dispatcher bits sampleIndex
      (positiveStageLaunchConfigurationAt program dispatcher fuel
        (environmentCode (compileActions program dispatcher.tree) bits)
        outerParents) := by
  have silent := positiveStageLaunch_silentAt program dispatcher bits fuel
    outerParents layers outer
  exact SampledState.ofSilent
    (.macro (.family .fuel) (Registers.newJob program))
    (positiveStageLaunch_holdsAt program dispatcher bits fuel outerParents
      layers outer)
    rfl silent

/-! ## Decoder classification of clock samples below completed prefixes -/

/-- A positive clock sample remains decoder-silent below every completed Local
continuation stack. -/
theorem positiveClockMutation_silentAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program)
    (stage wrappers remaining : Nat) (outerParents : List ParentFrame)
    (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers) :
    SilentEvidence program dispatcher.tree .clock
      (positiveClockMutationConfiguration program dispatcher registers
        stage wrappers remaining
        (.left (environmentCode
          (compileActions program dispatcher.tree) bits) ::
          outerParents)).cursor.erase := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let endpoint : Term := .app (clockGrowthCore stage (wrappers + 1) remaining)
    environment
  have eraseEq :
      (positiveClockMutationConfiguration program dispatcher registers
        stage wrappers remaining (.left environment :: outerParents)).cursor.erase =
        Cursor.rebuild outerParents endpoint := by
    change (⟨.app (.app .s (C stage)) (.app (C remaining) (C stage)),
      PrimitiveClock.wrapperParents stage wrappers
        (.left environment :: outerParents)⟩ : Cursor).erase = _
    rw [erase_clockGrowth_after]
    rfl
  change SilentEvidence program dispatcher.tree .clock
    (positiveClockMutationConfiguration program dispatcher registers
      stage wrappers remaining (.left environment :: outerParents)).cursor.erase
  rw [eraseEq]
  apply SilentEvidence.ofState
  apply SilentState.clockGrowth (outer.prefix endpoint)
    stage wrappers remaining (word bits)
  simp [endpoint, environment, CheckpointDecoder.openEnvironment_word]

/-- The nonempty closing clock sample remains silent below every completed
Local continuation stack. -/
theorem zeroClockMutation_silentAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program)
    (stage wrappers : Nat) (outerParents : List ParentFrame)
    (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers) :
    SilentEvidence program dispatcher.tree .clock
      (zeroClockMutationConfiguration program dispatcher registers
        stage (wrappers + 1)
        (.left (environmentCode
          (compileActions program dispatcher.tree) bits) ::
          outerParents)).cursor.erase := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let endpoint : Term := .app
    (clockWrap stage (wrappers + 1) (clockBase stage)) environment
  have eraseEq :
      (zeroClockMutationConfiguration program dispatcher registers
        stage (wrappers + 1) (.left environment :: outerParents)).cursor.erase =
        Cursor.rebuild outerParents endpoint := by
    change Cursor.rebuild
      (PrimitiveClock.wrapperParents stage (wrappers + 1)
        (.left environment :: outerParents)) (clockBase stage) = _
    rw [rebuild_wrapperParents]
    rfl
  change SilentEvidence program dispatcher.tree .clock
    (zeroClockMutationConfiguration program dispatcher registers
      stage (wrappers + 1) (.left environment :: outerParents)).cursor.erase
  rw [eraseEq]
  apply SilentEvidence.ofState
  apply SilentState.clockCompleteWrapped (outer.prefix endpoint)
    stage wrappers (word bits)
  simp [endpoint, environment, CheckpointDecoder.openEnvironment_word]

/-- Every residual positive-clock contraction, indexed below a completed
continuation zipper. -/
inductive ClockTailSampledAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers)
    (stage : Nat) : Nat → Nat → Nat → Prop where
  | zero (sampleIndex wrappers : Nat)
      (closing : SampledState program dispatcher bits (sampleIndex + 1)
        (zeroClockMutationConfiguration program dispatcher registers stage
          (wrappers + 1)
          (.left (environmentCode
            (compileActions program dispatcher.tree) bits) :: outerParents))) :
      ClockTailSampledAt program dispatcher bits registers phase scanned
        emptyMode coherent outerParents layers outer stage sampleIndex wrappers 0
  | succ (sampleIndex wrappers remaining : Nat)
      (next : SampledState program dispatcher bits (sampleIndex + 1)
        (positiveClockMutationConfiguration program dispatcher registers stage
          (wrappers + 1) remaining
          (.left (environmentCode
            (compileActions program dispatcher.tree) bits) :: outerParents)))
      (tail : ClockTailSampledAt program dispatcher bits registers phase scanned
        emptyMode coherent outerParents layers outer stage (sampleIndex + 1)
        (wrappers + 1) remaining) :
      ClockTailSampledAt program dispatcher bits registers phase scanned
        emptyMode coherent outerParents layers outer stage sampleIndex wrappers
        (remaining + 1)

/-- Construct the complete indexed positive-clock tail below completed shells. -/
theorem clockTailSampledAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers)
    (stage : Nat) : ∀ sampleIndex wrappers remaining,
      ClockTailSampledAt program dispatcher bits registers phase scanned
        emptyMode coherent outerParents layers outer stage sampleIndex wrappers
        remaining
  | sampleIndex, wrappers, 0 =>
      .zero sampleIndex wrappers
        (SampledState.zeroClockMutation program dispatcher bits
          (sampleIndex + 1) registers phase scanned emptyMode stage
          (wrappers + 1)
          (.left (environmentCode
            (compileActions program dispatcher.tree) bits) :: outerParents)
          coherent
          (zeroClockMutation_silentAt program dispatcher bits registers stage
            wrappers outerParents layers outer))
  | sampleIndex, wrappers, remaining + 1 =>
      .succ sampleIndex wrappers remaining
        (SampledState.positiveClockMutation program dispatcher bits
          (sampleIndex + 1) registers phase scanned emptyMode stage
          (wrappers + 1) remaining
          (.left (environmentCode
            (compileActions program dispatcher.tree) bits) :: outerParents)
          coherent
          (positiveClockMutation_silentAt program dispatcher bits registers
            stage (wrappers + 1) remaining outerParents layers outer))
        (clockTailSampledAt program dispatcher bits registers phase scanned
          emptyMode coherent outerParents layers outer stage (sampleIndex + 1)
          (wrappers + 1) remaining)

/-- Exact semantic samples of one positive clock phase below completed shells. -/
structure PositiveClockPhaseSampledAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers)
    (sampleIndex stage : Nat) : Prop where
  first : SampledState program dispatcher bits (sampleIndex + 1)
    (positiveClockMutationConfiguration program dispatcher registers
      (stage + 1) 0 stage
      (.left (environmentCode
        (compileActions program dispatcher.tree) bits) :: outerParents))
  tail : ClockTailSampledAt program dispatcher bits registers phase scanned
    emptyMode coherent outerParents layers outer (stage + 1)
    (sampleIndex + 1) 0 stage

/-- Construct all positive-clock samples at an arbitrary completed depth. -/
theorem positiveClockPhaseSampledAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers)
    (sampleIndex stage : Nat) :
    PositiveClockPhaseSampledAt program dispatcher bits registers phase scanned
      emptyMode coherent outerParents layers outer sampleIndex stage := by
  refine ⟨?_, clockTailSampledAt program dispatcher bits registers phase
    scanned emptyMode coherent outerParents layers outer (stage + 1)
    (sampleIndex + 1) 0 stage⟩
  exact SampledState.positiveClockMutation program dispatcher bits
    (sampleIndex + 1) registers phase scanned emptyMode (stage + 1) 0 stage
    (.left (environmentCode
      (compileActions program dispatcher.tree) bits) :: outerParents)
    coherent
    (positiveClockMutation_silentAt program dispatcher bits registers
      (stage + 1) 0 stage outerParents layers outer)

/-- Operational and semantic views of the same nested positive clock phase. -/
structure PositiveClockPhaseInvariantAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers)
    (sampleIndex stage : Nat) : Prop where
  execution : ClockPhaseSamples program dispatcher registers
    (.left (environmentCode
      (compileActions program dispatcher.tree) bits) :: outerParents) (stage + 1)
  invariant : PositiveClockPhaseSampledAt program dispatcher bits registers
    phase scanned emptyMode coherent outerParents layers outer sampleIndex stage

/-- Complete executable/invariant certificate for a nested positive clock. -/
theorem positiveClockPhaseInvariantAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers)
    (sampleIndex stage : Nat) :
    PositiveClockPhaseInvariantAt program dispatcher bits registers phase
      scanned emptyMode coherent outerParents layers outer sampleIndex stage :=
  ⟨executeClock_samples program dispatcher registers
      (.left (environmentCode
        (compileActions program dispatcher.tree) bits) :: outerParents)
      (stage + 1),
    positiveClockPhaseSampledAt program dispatcher bits registers phase scanned
      emptyMode coherent outerParents layers outer sampleIndex stage⟩

/-! ## Exact clock mutation lists -/

/-- Residual clock samples after an already-recorded positive contraction. -/
def clockTailConfigurationsAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program) (stage : Nat)
    (outerParents : List ParentFrame) : Nat → Nat →
      List (Configuration program dispatcher)
  | wrappers, 0 =>
      [zeroClockMutationConfiguration program dispatcher registers stage
        (wrappers + 1)
        (.left (environmentCode
          (compileActions program dispatcher.tree) bits) :: outerParents)]
  | wrappers, remaining + 1 =>
      positiveClockMutationConfiguration program dispatcher registers stage
          (wrappers + 1) remaining
          (.left (environmentCode
            (compileActions program dispatcher.tree) bits) :: outerParents) ::
        clockTailConfigurationsAt program dispatcher bits registers stage
          outerParents (wrappers + 1) remaining

/-- Complete sample list of a positive clock whose carrier is `C_(stage+1)`. -/
def clockConfigurationsAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program)
    (outerParents : List ParentFrame) (stage : Nat) :
    List (Configuration program dispatcher) :=
  positiveClockMutationConfiguration program dispatcher registers
      (stage + 1) 0 stage
      (.left (environmentCode
        (compileActions program dispatcher.tree) bits) :: outerParents) ::
    clockTailConfigurationsAt program dispatcher bits registers (stage + 1)
      outerParents 0 stage

/-- The residual sample list has one entry per remaining positive pair plus
its closing zero contraction. -/
@[simp]
theorem clockTailConfigurationsAt_length
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program) (stage : Nat)
    (outerParents : List ParentFrame) : ∀ wrappers remaining,
    (clockTailConfigurationsAt program dispatcher bits registers stage
      outerParents wrappers remaining).length = remaining + 1
  | wrappers, 0 => rfl
  | wrappers, remaining + 1 => by
      simp [clockTailConfigurationsAt,
        clockTailConfigurationsAt_length program dispatcher bits registers
          stage outerParents (wrappers + 1) remaining,
        Nat.add_assoc]

/-- A positive clock phase contributes exactly `stage + 2` samples. -/
@[simp]
theorem clockConfigurationsAt_length
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program)
    (outerParents : List ParentFrame) (stage : Nat) :
    (clockConfigurationsAt program dispatcher bits registers outerParents
      stage).length = stage + 2 := by
  simp [clockConfigurationsAt, Nat.add_assoc]

/-- Exact executable chain from an already-sampled positive clock state to
its closing zero contraction. -/
theorem clockTailExactMutationChainAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program) (stage : Nat)
    (outerParents : List ParentFrame) : ∀ wrappers remaining,
    ExactMutationChain (SchedulerControl.machine program dispatcher)
      (zeroClockMutationConfiguration program dispatcher registers stage
        (wrappers + remaining + 1)
        (.left (environmentCode
          (compileActions program dispatcher.tree) bits) :: outerParents))
      (positiveClockMutationConfiguration program dispatcher registers stage
        wrappers remaining
        (.left (environmentCode
          (compileActions program dispatcher.tree) bits) :: outerParents))
      (clockTailConfigurationsAt program dispatcher bits registers stage
        outerParents wrappers remaining)
  | wrappers, 0 => by
      let parents := .left (environmentCode
        (compileActions program dispatcher.tree) bits) :: outerParents
      let closing := zeroClockMutationConfiguration program dispatcher registers
        stage (wrappers + 1) parents
      have found := positiveClockMutation_seekZero program dispatcher registers
        stage wrappers parents
      have done : ExactMutationChain (SchedulerControl.machine program dispatcher)
          closing closing [] := .done 0 ⟨rfl, rfl⟩
      simpa [clockTailConfigurationsAt, parents, closing] using
        (ExactMutationChain.next
          (positiveClockToZeroPrefixTicks program dispatcher stage wrappers
            parents + 1) found done)
  | wrappers, remaining + 1 => by
      let parents := .left (environmentCode
        (compileActions program dispatcher.tree) bits) :: outerParents
      let next := positiveClockMutationConfiguration program dispatcher registers
        stage (wrappers + 1) remaining parents
      have found := positiveClockMutation_seekNext program dispatcher registers
        stage wrappers remaining parents
      have tail := clockTailExactMutationChainAt program dispatcher bits
        registers stage outerParents (wrappers + 1) remaining
      have chain := ExactMutationChain.next
        (positiveClockNextPrefixTicks program dispatcher stage wrappers remaining
          parents + 1) found tail
      simpa [clockTailConfigurationsAt, parents, next, Nat.add_assoc,
        Nat.add_comm, Nat.add_left_comm] using chain

/-- Exact executable sample chain of a complete positive nested clock phase. -/
theorem clockExactMutationChainAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program)
    (outerParents : List ParentFrame) (stage : Nat) :
    let parents := .left (environmentCode
      (compileActions program dispatcher.tree) bits) :: outerParents
    ExactMutationChain (SchedulerControl.machine program dispatcher)
      (clockPhaseCompletedConfiguration program dispatcher registers (stage + 1)
        parents)
      (clockPhaseSourceConfiguration program dispatcher registers parents
        (stage + 1))
      (clockConfigurationsAt program dispatcher bits registers outerParents
        stage) := by
  let parents := .left (environmentCode
    (compileActions program dispatcher.tree) bits) :: outerParents
  let first := positiveClockMutationConfiguration program dispatcher registers
    (stage + 1) 0 stage parents
  have found := positiveClockMutation_seek program dispatcher registers
    (stage + 1) 0 stage parents
  have tail := clockTailExactMutationChainAt program dispatcher bits registers
    (stage + 1) outerParents 0 stage
  have chain := ExactMutationChain.next 1 found tail
  simpa [clockConfigurationsAt, clockPhaseSourceConfiguration,
    clockPhaseCompletedConfiguration, parents, first, Nat.add_assoc] using chain

namespace ClockTailSampledAt

/-- The semantic residual-clock induction pairs pointwise with the literal
operational sample list. -/
theorem toIndexed
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {bits : List Bool} {registers : Registers program}
    {phase : CTS.Phase program} {scanned : List Bool} {emptyMode : Bool}
    {coherent : RegistersCoherent registers phase scanned emptyMode}
    {outerParents : List ParentFrame} {layers : Nat}
    {outer : CompletedParents program dispatcher outerParents layers}
    {stage sampleIndex wrappers remaining : Nat}
    (trace : ClockTailSampledAt program dispatcher bits registers phase scanned
      emptyMode coherent outerParents layers outer stage sampleIndex wrappers
      remaining) :
    IndexedResponseSampledStates program dispatcher bits sampleIndex
      (clockTailConfigurationsAt program dispatcher bits registers stage
        outerParents wrappers remaining) := by
  induction trace with
  | zero sampleIndex wrappers closing =>
      exact .cons sampleIndex closing (.nil (sampleIndex + 1))
  | succ sampleIndex wrappers remaining next tail ih =>
      exact .cons sampleIndex next ih

end ClockTailSampledAt

/-- Pointwise pairing of every positive-clock sample with its exact index. -/
theorem PositiveClockPhaseSampledAt.toIndexed
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {bits : List Bool} {registers : Registers program}
    {phase : CTS.Phase program} {scanned : List Bool} {emptyMode : Bool}
    {coherent : RegistersCoherent registers phase scanned emptyMode}
    {outerParents : List ParentFrame} {layers : Nat}
    {outer : CompletedParents program dispatcher outerParents layers}
    {sampleIndex stage : Nat}
    (trace : PositiveClockPhaseSampledAt program dispatcher bits registers phase
      scanned emptyMode coherent outerParents layers outer sampleIndex stage) :
    IndexedResponseSampledStates program dispatcher bits sampleIndex
      (clockConfigurationsAt program dispatcher bits registers outerParents
        stage) := by
  exact .cons sampleIndex trace.first trace.tail.toIndexed

/-! ## Fuel samples below completed prefixes -/

/-- Silence certificates for the two positive-fuel samples beneath an outer
completed context. -/
structure FuelPositiveSampleEvidenceAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program) (fuel depth : Nat)
    (continuation : Term) (outerParents : List ParentFrame) : Prop where
  first : SilentEvidence program dispatcher.tree .fuel
    (fuelPositiveFirstMutationConfiguration program dispatcher registers fuel
      (environmentCode (compileActions program dispatcher.tree) bits)
      continuation
      (PrimitiveFuel.pendingParents
        (environmentCode (compileActions program dispatcher.tree) bits)
        continuation depth outerParents)).cursor.erase
  second : SilentEvidence program dispatcher.tree .fuel
    (fuelPositiveSecondMutationConfiguration program dispatcher registers fuel
      (environmentCode (compileActions program dispatcher.tree) bits)
      continuation
      (PrimitiveFuel.pendingParents
        (environmentCode (compileActions program dispatcher.tree) bits)
        continuation depth outerParents)).cursor.erase

/-- Construct both positive-fuel silence certificates at every pending and
completed-prefix depth. -/
theorem fuelPositiveSampleEvidenceAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program) (fuel depth : Nat)
    (continuation : Term) (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers) :
    FuelPositiveSampleEvidenceAt program dispatcher bits registers fuel depth
      continuation outerParents := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  cases depth with
  | zero =>
      constructor
      · have failure := fuelPositiveFirst_failureRoot program dispatcher bits
          registers fuel continuation
        simpa [fuelPositiveFirstMutationConfiguration, environment,
          Cursor.erase, Cursor.rebuild] using!
          outer.silentOfFailure .fuel failure
      · have failure := fuelPositiveSecond_failureRoot program dispatcher bits
          registers fuel continuation
        simpa [fuelPositiveSecondMutationConfiguration, environment,
          Cursor.erase, Cursor.rebuild] using!
          outer.silentOfFailure .fuel failure
  | succ depth =>
      have positive : depth + 1 ≠ 0 := Nat.succ_ne_zero depth
      constructor
      · simpa [fuelPositiveFirstMutationConfiguration, environment,
          Cursor.erase] using!
          outer.pendingSilent .fuel bits continuation
            (.app
              (.app (.app .s environment) (.app (C fuel) environment))
              continuation)
            (depth + 1) positive
      · simpa [fuelPositiveSecondMutationConfiguration, environment,
          Cursor.erase] using
          outer.pendingSilent .fuel bits continuation
            (frame environment continuation
              (.app (.app (C fuel) environment) continuation))
            (depth + 1) positive

/-- Silence certificates for all five zero-fuel samples beneath an outer
completed context. -/
structure FuelZeroSampleEvidenceAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program) (depth : Nat)
    (continuation : Term) (outerParents : List ParentFrame) : Prop where
  first : SilentEvidence program dispatcher.tree .fuel
    (fuelZeroFirstMutationConfiguration program dispatcher registers
      (environmentCode (compileActions program dispatcher.tree) bits)
      continuation
      (PrimitiveFuel.pendingParents
        (environmentCode (compileActions program dispatcher.tree) bits)
        continuation depth outerParents)).cursor.erase
  second : SilentEvidence program dispatcher.tree .fuel
    (fuelZeroSecondMutationConfiguration program dispatcher registers
      (environmentCode (compileActions program dispatcher.tree) bits)
      continuation
      (PrimitiveFuel.pendingParents
        (environmentCode (compileActions program dispatcher.tree) bits)
        continuation depth outerParents)).cursor.erase
  third : SilentEvidence program dispatcher.tree .fuel
    (fuelZeroThirdMutationConfiguration program dispatcher registers
      (environmentCode (compileActions program dispatcher.tree) bits)
      continuation
      (PrimitiveFuel.pendingParents
        (environmentCode (compileActions program dispatcher.tree) bits)
        continuation depth outerParents)).cursor.erase
  fourth : SilentEvidence program dispatcher.tree .fuel
    (fuelZeroFourthMutationConfiguration program dispatcher registers
      (environmentCode (compileActions program dispatcher.tree) bits)
      continuation
      (PrimitiveFuel.pendingParents
        (environmentCode (compileActions program dispatcher.tree) bits)
        continuation depth outerParents)).cursor.erase
  fifth : SilentEvidence program dispatcher.tree .fuel
    (fuelZeroFifthMutationConfiguration program dispatcher registers
      (environmentCode (compileActions program dispatcher.tree) bits)
      continuation
      (PrimitiveFuel.pendingParents
        (environmentCode (compileActions program dispatcher.tree) bits)
        continuation depth outerParents)).cursor.erase

/-- Construct every zero-fuel silence certificate at arbitrary nested depth. -/
theorem fuelZeroSampleEvidenceAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program) (depth : Nat)
    (continuation : Term) (hadmissible : Carrier.Admissible continuation)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers) :
    FuelZeroSampleEvidenceAt program dispatcher bits registers depth continuation
      outerParents := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let alpha : Term :=
    .app (.app environment (.app b environment)) continuation
  cases depth with
  | zero =>
      exact ⟨by
          simpa [fuelZeroFirstMutationConfiguration, environment,
            Cursor.erase, Cursor.rebuild] using!
            outer.silentOfFailure .fuel
              (fuelZeroFirst_failureRoot program dispatcher bits registers
                continuation),
        by
          simpa [fuelZeroSecondMutationConfiguration, environment,
            Cursor.erase, Cursor.rebuild] using!
            outer.silentOfFailure .fuel
              (fuelZeroSecond_failureRoot program dispatcher bits registers
                continuation),
        by
          simpa [fuelZeroThirdMutationConfiguration, environment,
            Cursor.erase, Cursor.rebuild] using!
            outer.silentOfFailure .fuel
              (fuelZeroThird_failureRoot program dispatcher bits registers
                continuation),
        by
          simpa [fuelZeroFourthMutationConfiguration, environment,
            Cursor.erase, Cursor.rebuild] using!
            outer.silentOfFailure .fuel
              (fuelZeroFourth_failureRoot program dispatcher bits registers
                continuation),
        by
          simpa [fuelZeroFifthMutationConfiguration, environment,
            Cursor.erase, Cursor.rebuild] using!
            outer.silentOfFailure .fuel
              (fuelZeroFifth_failureRoot program dispatcher bits registers
                continuation hadmissible)⟩
  | succ depth =>
      have positive : depth + 1 ≠ 0 := Nat.succ_ne_zero depth
      exact ⟨by
          simpa [fuelZeroFirstMutationConfiguration, environment, Cursor.erase]
            using! outer.pendingSilent .fuel bits continuation
              (.app (.app (.app b environment) (.app b environment))
                continuation)
              (depth + 1) positive,
        by
          simpa [fuelZeroSecondMutationConfiguration, environment, Cursor.erase]
            using! outer.pendingSilent .fuel bits continuation
              (.app
                (.app (.app .s (.app b environment))
                  (.app environment (.app b environment)))
                continuation)
              (depth + 1) positive,
        by
          simpa [fuelZeroThirdMutationConfiguration, environment, alpha,
            Cursor.erase] using
            outer.pendingSilent .fuel bits continuation
              (.app (.app (.app b environment) continuation) alpha)
              (depth + 1) positive,
        by
          simpa [fuelZeroFourthMutationConfiguration, environment, alpha,
            Cursor.erase] using!
            outer.pendingSilent .fuel bits continuation
              (.app
                (.app (.app .s continuation) (.app environment continuation))
                alpha)
              (depth + 1) positive,
        by
          simpa [fuelZeroFifthMutationConfiguration, environment, Cursor.erase]
            using outer.pendingSilent .fuel bits continuation
              (baseCarrier environment continuation) (depth + 1) positive⟩

/-- Literal contraction samples of a recursive fuel phase in their executable
order. -/
def fuelConfigurationsAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program) (continuation : Term)
    (outerParents : List ParentFrame) : Nat → Nat →
      List (Configuration program dispatcher)
  | 0, depth =>
      let environment :=
        environmentCode (compileActions program dispatcher.tree) bits
      let parents := PrimitiveFuel.pendingParents environment continuation depth
        outerParents
      [fuelZeroFirstMutationConfiguration program dispatcher registers
          environment continuation parents,
        fuelZeroSecondMutationConfiguration program dispatcher registers
          environment continuation parents,
        fuelZeroThirdMutationConfiguration program dispatcher registers
          environment continuation parents,
        fuelZeroFourthMutationConfiguration program dispatcher registers
          environment continuation parents,
        fuelZeroFifthMutationConfiguration program dispatcher registers
          environment continuation parents]
  | fuel + 1, depth =>
      let environment :=
        environmentCode (compileActions program dispatcher.tree) bits
      let parents := PrimitiveFuel.pendingParents environment continuation depth
        outerParents
      fuelPositiveFirstMutationConfiguration program dispatcher registers fuel
          environment continuation parents ::
        fuelPositiveSecondMutationConfiguration program dispatcher registers fuel
          environment continuation parents ::
        fuelConfigurationsAt program dispatcher bits registers continuation
          outerParents fuel (depth + 1)

/-- Fuel expansion has the structural contraction count `2 * fuel + 5`. -/
@[simp]
theorem fuelConfigurationsAt_length
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program) (continuation : Term)
    (outerParents : List ParentFrame) : ∀ fuel depth,
    (fuelConfigurationsAt program dispatcher bits registers continuation
      outerParents fuel depth).length = 2 * fuel + 5
  | 0, depth => rfl
  | fuel + 1, depth => by
      simp [fuelConfigurationsAt,
        fuelConfigurationsAt_length program dispatcher bits registers
          continuation outerParents fuel (depth + 1),
        Nat.mul_succ, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
      rw [← Nat.add_assoc]

/-- Last Base-producing sample of the recursive fuel phase. -/
def fuelTerminalConfigurationAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program) (continuation : Term)
    (outerParents : List ParentFrame) (fuel depth : Nat) :
    Configuration program dispatcher :=
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  fuelZeroFifthMutationConfiguration program dispatcher registers environment
    continuation
    (PrimitiveFuel.pendingParents environment continuation
      (fuelSampleEndDepth depth fuel) outerParents)

/-- Every nested fuel phase refines to the exact list of actual sampled
contractions, ending at its fifth Base-producing sample. -/
theorem fuelExactMutationChainAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program) (continuation : Term)
    (outerParents : List ParentFrame) : ∀ fuel depth,
    ExactMutationChain (SchedulerControl.machine program dispatcher)
      (fuelTerminalConfigurationAt program dispatcher bits registers
        continuation outerParents fuel depth)
      (fuelPhaseSourceConfiguration program dispatcher registers fuel
        (environmentCode (compileActions program dispatcher.tree) bits)
        continuation
        (PrimitiveFuel.pendingParents
          (environmentCode (compileActions program dispatcher.tree) bits)
          continuation depth outerParents))
      (fuelConfigurationsAt program dispatcher bits registers continuation
        outerParents fuel depth)
  | 0, depth => by
      let environment :=
        environmentCode (compileActions program dispatcher.tree) bits
      let parents := PrimitiveFuel.pendingParents environment continuation depth
        outerParents
      let first := fuelZeroFirstMutationConfiguration program dispatcher
        registers environment continuation parents
      let second := fuelZeroSecondMutationConfiguration program dispatcher
        registers environment continuation parents
      let third := fuelZeroThirdMutationConfiguration program dispatcher
        registers environment continuation parents
      let fourth := fuelZeroFourthMutationConfiguration program dispatcher
        registers environment continuation parents
      let fifth := fuelZeroFifthMutationConfiguration program dispatcher
        registers environment continuation parents
      have starts := fuelZero_seekFirstFromPhase program dispatcher registers
        environment continuation parents
      have next2 := fuelZero_seekSecond program dispatcher registers environment
        continuation parents
      have next3 := fuelZero_seekThird program dispatcher registers environment
        continuation parents
      have next4 := fuelZero_seekFourth program dispatcher registers environment
        continuation parents
      have next5 := fuelZero_seekFifth program dispatcher registers environment
        continuation parents
      have done : ExactMutationChain
          (SchedulerControl.machine program dispatcher) fifth fifth [] :=
        .done 0 ⟨rfl, rfl⟩
      simpa [fuelConfigurationsAt, fuelTerminalConfigurationAt,
        fuelSampleEndDepth, environment, parents, first, second, third, fourth,
        fifth] using
        (ExactMutationChain.next
          (fuelZeroGuardTicks program dispatcher environment continuation
            parents + 2) starts
          (ExactMutationChain.next 3 next2
            (ExactMutationChain.next 2 next3
              (ExactMutationChain.next 2 next4
                (ExactMutationChain.next 2 next5 done)))))
  | fuel + 1, depth => by
      let environment :=
        environmentCode (compileActions program dispatcher.tree) bits
      let parents := PrimitiveFuel.pendingParents environment continuation depth
        outerParents
      let nextParents := PrimitiveFuel.pendingParents environment continuation
        (depth + 1) outerParents
      let first := fuelPositiveFirstMutationConfiguration program dispatcher
        registers fuel environment continuation parents
      let second := fuelPositiveSecondMutationConfiguration program dispatcher
        registers fuel environment continuation parents
      have starts := fuelPositive_seekFirstFromPhase program dispatcher registers
        fuel environment continuation parents
      have next2 := fuelPositive_seekSecond program dispatcher registers fuel
        environment continuation parents
      have suffixRaw := fuelPositiveSampleSuffix_zeroRun program dispatcher
        registers fuel environment continuation parents
      have parentEq :
          .right (.app environment continuation) :: parents = nextParents := by
        simpa [parents, nextParents] using
          (SchedulerCycle.pendingParents_succ_cons environment continuation depth
            outerParents).symm
      have suffix : ZeroMutationRun
          (SchedulerControl.machine program dispatcher) 2 second
          (fuelPhaseSourceConfiguration program dispatcher registers fuel
            environment continuation nextParents) := by
        rw [← parentEq]
        simpa [second] using suffixRaw
      have tail := fuelExactMutationChainAt program dispatcher bits registers
        continuation outerParents fuel (depth + 1)
      have linked := ExactMutationChain.prepend suffix tail
      simpa [fuelConfigurationsAt, fuelTerminalConfigurationAt,
        fuelSampleEndDepth, environment, parents, nextParents, first, second]
        using
          (ExactMutationChain.next
            (fuelPositiveGuardTicks program dispatcher fuel environment
              continuation parents + 2) starts
            (ExactMutationChain.next 2 next2 linked))

/-- Every configuration in the nested fuel mutation list carries the exact
global contraction index and simultaneous scheduler invariant. -/
theorem fuelIndexedSampledStatesAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    (continuation : Term) (hadmissible : Carrier.Admissible continuation)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers) :
    ∀ sampleIndex fuel depth,
      IndexedResponseSampledStates program dispatcher bits sampleIndex
        (fuelConfigurationsAt program dispatcher bits registers continuation
          outerParents fuel depth)
  | sampleIndex, 0, depth => by
      let environment :=
        environmentCode (compileActions program dispatcher.tree) bits
      let parents := PrimitiveFuel.pendingParents environment continuation depth
        outerParents
      let first := fuelZeroFirstMutationConfiguration program dispatcher
        registers environment continuation parents
      let second := fuelZeroSecondMutationConfiguration program dispatcher
        registers environment continuation parents
      let third := fuelZeroThirdMutationConfiguration program dispatcher
        registers environment continuation parents
      let fourth := fuelZeroFourthMutationConfiguration program dispatcher
        registers environment continuation parents
      let fifth := fuelZeroFifthMutationConfiguration program dispatcher
        registers environment continuation parents
      have evidence := fuelZeroSampleEvidenceAt program dispatcher bits registers
        depth continuation hadmissible outerParents layers outer
      have firstSample : SampledState program dispatcher bits (sampleIndex + 1)
          first := by
        exact SampledState.fuelZeroFirstMutation program dispatcher bits
          (sampleIndex + 1) registers phase scanned emptyMode environment
          continuation parents coherent (by simpa [first, environment, parents]
            using evidence.first)
      have secondSample : SampledState program dispatcher bits
          ((sampleIndex + 1) + 1) second := by
        exact SampledState.fuelZeroSecondMutation program dispatcher bits
          ((sampleIndex + 1) + 1) registers phase scanned emptyMode environment
          continuation parents coherent (by simpa [second, environment, parents]
            using evidence.second)
      have thirdSample : SampledState program dispatcher bits
          (((sampleIndex + 1) + 1) + 1) third := by
        exact SampledState.fuelZeroThirdMutation program dispatcher bits
          (((sampleIndex + 1) + 1) + 1) registers phase scanned emptyMode
          environment continuation parents coherent (by
            simpa [third, environment, parents] using evidence.third)
      have fourthSample : SampledState program dispatcher bits
          ((((sampleIndex + 1) + 1) + 1) + 1) fourth := by
        exact SampledState.fuelZeroFourthMutation program dispatcher bits
          ((((sampleIndex + 1) + 1) + 1) + 1) registers phase scanned emptyMode
          environment continuation parents coherent (by
            simpa [fourth, environment, parents] using evidence.fourth)
      have fifthSample : SampledState program dispatcher bits
          (((((sampleIndex + 1) + 1) + 1) + 1) + 1) fifth := by
        exact SampledState.fuelZeroFifthMutation program dispatcher bits
          (((((sampleIndex + 1) + 1) + 1) + 1) + 1) registers phase scanned
          emptyMode environment continuation parents coherent (by
            simpa [fifth, environment, parents] using evidence.fifth)
      have indexed : IndexedResponseSampledStates program dispatcher bits
          sampleIndex [first, second, third, fourth, fifth] :=
        .cons sampleIndex firstSample
          (.cons (sampleIndex + 1) secondSample
            (.cons ((sampleIndex + 1) + 1) thirdSample
              (.cons (((sampleIndex + 1) + 1) + 1) fourthSample
                (.cons ((((sampleIndex + 1) + 1) + 1) + 1) fifthSample
                  (.nil (((((sampleIndex + 1) + 1) + 1) + 1) + 1))))))
      simpa [fuelConfigurationsAt, environment, parents, first, second, third,
        fourth, fifth] using indexed
  | sampleIndex, fuel + 1, depth => by
      let environment :=
        environmentCode (compileActions program dispatcher.tree) bits
      let parents := PrimitiveFuel.pendingParents environment continuation depth
        outerParents
      let first := fuelPositiveFirstMutationConfiguration program dispatcher
        registers fuel environment continuation parents
      let second := fuelPositiveSecondMutationConfiguration program dispatcher
        registers fuel environment continuation parents
      have evidence := fuelPositiveSampleEvidenceAt program dispatcher bits
        registers fuel depth continuation outerParents layers outer
      have firstSample : SampledState program dispatcher bits (sampleIndex + 1)
          first := by
        exact SampledState.fuelPositiveFirstMutation program dispatcher bits
          (sampleIndex + 1) registers phase scanned emptyMode fuel environment
          continuation parents coherent (by simpa [first, environment, parents]
            using evidence.first)
      have secondSample : SampledState program dispatcher bits
          ((sampleIndex + 1) + 1) second := by
        exact SampledState.fuelPositiveSecondMutation program dispatcher bits
          ((sampleIndex + 1) + 1) registers phase scanned emptyMode fuel
          environment continuation parents coherent (by
            simpa [second, environment, parents] using evidence.second)
      have tail := fuelIndexedSampledStatesAt program dispatcher bits registers
        phase scanned emptyMode coherent continuation hadmissible outerParents
        layers outer (sampleIndex + 2) fuel (depth + 1)
      have tail' : IndexedResponseSampledStates program dispatcher bits
          ((sampleIndex + 1) + 1)
          (fuelConfigurationsAt program dispatcher bits registers continuation
            outerParents fuel (depth + 1)) := by
        simpa [Nat.add_assoc] using tail
      have indexed : IndexedResponseSampledStates program dispatcher bits
          sampleIndex
          (first :: second ::
            fuelConfigurationsAt program dispatcher bits registers continuation
              outerParents fuel (depth + 1)) :=
        .cons sampleIndex firstSample
          (.cons (sampleIndex + 1) secondSample tail')
      simpa [fuelConfigurationsAt, environment, parents, first, second] using
        indexed

/-- Operational and semantic refinement of a complete nested fuel phase. -/
structure FuelPhaseInvariantAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    (continuation : Term) (hadmissible : Carrier.Admissible continuation)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers)
    (sampleIndex fuel : Nat) : Prop where
  chain : ExactMutationChain (SchedulerControl.machine program dispatcher)
    (fuelTerminalConfigurationAt program dispatcher bits registers continuation
      outerParents fuel 0)
    (fuelPhaseSourceConfiguration program dispatcher registers fuel
      (environmentCode (compileActions program dispatcher.tree) bits)
      continuation outerParents)
    (fuelConfigurationsAt program dispatcher bits registers continuation
      outerParents fuel 0)
  sampled : IndexedResponseSampledStates program dispatcher bits sampleIndex
    (fuelConfigurationsAt program dispatcher bits registers continuation
      outerParents fuel 0)

/-- Construct the exact nested fuel phase from its macro source. -/
theorem fuelPhaseInvariantAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    (continuation : Term) (hadmissible : Carrier.Admissible continuation)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers)
    (sampleIndex fuel : Nat) :
    FuelPhaseInvariantAt program dispatcher bits registers phase scanned
      emptyMode coherent continuation hadmissible outerParents layers outer
      sampleIndex fuel :=
  ⟨fuelExactMutationChainAt program dispatcher bits registers continuation
      outerParents fuel 0,
    fuelIndexedSampledStatesAt program dispatcher bits registers phase scanned
      emptyMode coherent continuation hadmissible outerParents layers outer
      sampleIndex fuel 0⟩

/-! ## One complete nested clock/launch/fuel expansion -/

/-- Literal contraction samples from a positive clock source through its Base-
producing fuel endpoint. -/
def positiveStageConfigurationsAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (clockRegisters : Registers program)
    (outerParents : List ParentFrame) (fuel : Nat) :
    List (Configuration program dispatcher) :=
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let continuation := Dovetail.clockExit (fuel + 1) fuel environment
  clockConfigurationsAt program dispatcher bits clockRegisters outerParents
      fuel ++
    positiveStageLaunchConfigurationAt program dispatcher fuel environment
        outerParents ::
      fuelConfigurationsAt program dispatcher bits (Registers.newJob program)
        continuation outerParents (fuel + 1) 0

/-- Exact sample count of the structural clock/launch/fuel expansion. -/
@[simp]
theorem positiveStageConfigurationsAt_length
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (clockRegisters : Registers program)
    (outerParents : List ParentFrame) (fuel : Nat) :
    (positiveStageConfigurationsAt program dispatcher bits clockRegisters
      outerParents fuel).length = 3 * fuel + 10 := by
  simp [positiveStageConfigurationsAt, Nat.mul_succ, Nat.add_assoc,
    Nat.add_comm, Nat.add_left_comm, Nat.succ_mul]

/-- Operational and indexed-semantic certificate for a positive stage down to
its final Base-producing fuel sample. -/
structure PositiveStagePhaseInvariantAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (clockRegisters : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (clockCoherent :
      RegistersCoherent clockRegisters phase scanned emptyMode)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers)
    (sampleIndex fuel : Nat) : Prop where
  chain :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    let continuation := Dovetail.clockExit (fuel + 1) fuel environment
    ExactMutationChain (SchedulerControl.machine program dispatcher)
      (fuelTerminalConfigurationAt program dispatcher bits
        (Registers.newJob program) continuation outerParents (fuel + 1) 0)
      (clockPhaseSourceConfiguration program dispatcher clockRegisters
        (.left environment :: outerParents) (fuel + 1))
      (positiveStageConfigurationsAt program dispatcher bits clockRegisters
        outerParents fuel)
  sampled : IndexedResponseSampledStates program dispatcher bits sampleIndex
    (positiveStageConfigurationsAt program dispatcher bits clockRegisters
      outerParents fuel)

/-- Compose the nested clock, launch, and fuel traces without reopening any
script or probe PC. -/
theorem positiveStagePhaseInvariantAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (clockRegisters : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (clockCoherent : RegistersCoherent clockRegisters phase scanned emptyMode)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers)
    (sampleIndex fuel : Nat) :
    PositiveStagePhaseInvariantAt program dispatcher bits clockRegisters phase
      scanned emptyMode clockCoherent outerParents layers outer sampleIndex
      fuel := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let continuation := Dovetail.clockExit (fuel + 1) fuel environment
  let clockList := clockConfigurationsAt program dispatcher bits clockRegisters
    outerParents fuel
  let launch := positiveStageLaunchConfigurationAt program dispatcher fuel
    environment outerParents
  let fuelList := fuelConfigurationsAt program dispatcher bits
    (Registers.newJob program) continuation outerParents (fuel + 1) 0
  have clockChain := clockExactMutationChainAt program dispatcher bits
    clockRegisters outerParents fuel
  have launchFound := clockCompleted_seekLaunchAt program dispatcher
    clockRegisters fuel bits outerParents
  have fuelChain := fuelExactMutationChainAt program dispatcher bits
    (Registers.newJob program) continuation outerParents (fuel + 1) 0
  have fuelChain' : ExactMutationChain
      (SchedulerControl.machine program dispatcher)
      (fuelTerminalConfigurationAt program dispatcher bits
        (Registers.newJob program) continuation outerParents (fuel + 1) 0)
      launch fuelList := by
    simpa [launch, fuelList, positiveStageLaunchConfigurationAt, environment,
      continuation] using! fuelChain
  have postClock : ExactMutationChain
      (SchedulerControl.machine program dispatcher)
      (fuelTerminalConfigurationAt program dispatcher bits
        (Registers.newJob program) continuation outerParents (fuel + 1) 0)
      (clockPhaseCompletedConfiguration program dispatcher clockRegisters
        (fuel + 1) (.left environment :: outerParents))
      (launch :: fuelList) :=
    .next
      (clockCompletedToLaunchTicksAt program dispatcher (fuel + 1) environment
        outerParents + 1)
      (by simpa [environment, launch] using launchFound) fuelChain'
  have completeChain := SchedulerRecurrence.ExactMutationChain.append clockChain
    postClock
  have clockSemantic := positiveClockPhaseSampledAt program dispatcher bits
    clockRegisters phase scanned emptyMode clockCoherent outerParents layers outer
    sampleIndex fuel
  have clockIndexed : IndexedResponseSampledStates program dispatcher bits
      sampleIndex clockList := by
    simpa [clockList] using clockSemantic.toIndexed
  let clockEnd := sampleIndex + clockList.length
  have launchSample : SampledState program dispatcher bits (clockEnd + 1)
      launch := by
    simpa [clockEnd, launch] using!
      (positiveStageLaunch_sampledAt program dispatcher bits (clockEnd + 1)
        fuel outerParents layers outer)
  have fuelIndexed : IndexedResponseSampledStates program dispatcher bits
      (clockEnd + 1) fuelList := by
    simpa [fuelList, continuation] using
      (fuelIndexedSampledStatesAt program dispatcher bits
        (Registers.newJob program) (CTS.zeroPhase program) [] false
        (RegistersCoherent.initial program) continuation
        (Dovetail.clockExit_admissible (fuel + 1) fuel environment)
        outerParents layers outer (clockEnd + 1) (fuel + 1) 0)
  have postIndexed : IndexedResponseSampledStates program dispatcher bits
      clockEnd (launch :: fuelList) :=
    .cons clockEnd launchSample fuelIndexed
  have completeIndexed := IndexedResponseSampledStates.append program dispatcher
    bits clockIndexed (by
      simpa [clockEnd] using postIndexed)
  refine ⟨?_, ?_⟩
  · simpa [positiveStageConfigurationsAt, environment, continuation,
      clockList, launch, fuelList] using completeChain
  · simpa [positiveStageConfigurationsAt, environment, continuation,
      clockList, launch, fuelList] using completeIndexed

end SchedulerNestedPhase

end PureSFormal.PureS
