import PureSFormal.PureS.SchedulerResponseClassification

/-!
# Exact root-continuation bridges

This module isolates the mutation accounting after a completed root response.
For a terminal clock exit, the continuation probes are cursor-only and enter
the exact source cursor of the next clock stage.  A fresh nonempty response
therefore contributes no further contraction; an empty response contributes
exactly its registered halt-field contraction before reaching the same clock
interface.
-/

namespace PureSFormal.PureS

namespace SchedulerRootContinuation

open FiniteController SchedulerControl SchedulerInvariant
  SchedulerResponseInvariant

abbrev Configuration (program : CTS.Program)
    (dispatcher : ActionDispatcher program) :=
  FiniteController.Configuration (SchedulerControl.Control program dispatcher)

/-! ## Literal clock-exit interface -/

/-- The cursor at a terminal stage continuation in an arbitrary outer zipper. -/
def terminalCursor (stage : Nat) (environment : Term)
    (parents : List ParentFrame) : Cursor :=
  ⟨Dovetail.clockExit stage 0 environment, parents⟩

/-- Exact next-stage clock source below the supplied outer zipper. -/
def nextStageSourceConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (stage : Nat) (environment : Term) (parents : List ParentFrame) :
    Configuration program dispatcher :=
  clockPhaseSourceConfiguration program dispatcher (Registers.newJob program)
    (.left environment :: parents) (stage + 1)

/-- Exact microtick cost of the arity-four continuation table. -/
def terminalCheckTicks
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (stage : Nat) (environment : Term)
    (parents : List ParentFrame) : Nat :=
  let cursor := terminalCursor stage environment parents
  (1 +
      (SchedulerControl.compiledProbeCost program dispatcher
          (.arityThree (.continuation registers.empty)) cursor +
        SchedulerControl.compiledProbeCost program dispatcher
          (.arityFour (.continuation registers.empty)) cursor)) + 1 +
    (1 + SchedulerControl.compiledProbeCost program dispatcher .clockSuccessor
      ⟨clockBase stage, .left environment :: parents⟩)

/-- The terminal arity-four table is mutation-free and lands at the literal
next-stage clock source, including every surrounding parent frame. -/
theorem terminalCheck_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (stage : Nat) (environment : Term)
    (parents : List ParentFrame) :
    ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (terminalCheckTicks program dispatcher registers stage environment
        parents)
      (SchedulerContinuation.checkConfiguration program dispatcher registers
        (terminalCursor stage environment parents))
      (nextStageSourceConfiguration program dispatcher stage environment
        parents) := by
  let cursor := terminalCursor stage environment parents
  let after : Cursor :=
    ⟨clockBase stage, .left environment :: parents⟩
  have arity : cursor.focus.headArity = 4 := by
    simpa [cursor, terminalCursor] using
      Dovetail.headArity_clockExit_zero stage environment
  have checked := SchedulerContinuation.arityFourDecision_zeroRun program
    dispatcher registers cursor arity
  have moves : cursor.left? = some after := by
    rfl
  have entered := SchedulerContinuation.arityFourDecision_zeroStep program
    dispatcher registers cursor after moves
  let probeStart : Configuration program dispatcher :=
    ⟨some (SchedulerControl.startProbe .clockSuccessor
      (Registers.newJob program)), after⟩
  have startProbe : ZeroMutationRun
      (SchedulerControl.machine program dispatcher) 1
      (SchedulerContinuation.clockGrowConfiguration program dispatcher after)
      probeStart := by
    exact ⟨rfl, rfl⟩
  have successor : ZeroMutationRun
      (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher .clockSuccessor
        after)
      probeStart
      (nextStageSourceConfiguration program dispatcher stage environment
        parents) := by
    let outerParents := .left environment :: parents
    have run := run_clockResidual_successor program dispatcher
      (Registers.newJob program) (stage + 1) 0 stage outerParents
    have count := SchedulerExecution.runMutationCount_localProbe program
      dispatcher .clockSuccessor (Registers.newJob program) after rfl
    refine ⟨?_, ?_⟩
    · simpa [probeStart, after, outerParents, clockResidualCursor,
        nextStageSourceConfiguration, clockPhaseSourceConfiguration,
        positiveClockSourceConfiguration, PrimitiveClock.wrapperParents] using!
        run
    · simpa [probeStart] using count
  have combined := ((checked.trans entered).trans startProbe).trans successor
  simpa [terminalCheckTicks, cursor, after, terminalCursor,
    probeStart,
    nextStageSourceConfiguration, clockPhaseSourceConfiguration,
    positiveClockSourceConfiguration, PrimitiveClock.wrapperParents,
    Nat.add_assoc] using!
    combined

/-- First contraction sample of the exact next-stage source. -/
def nextStageFirstMutationConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (stage : Nat) (environment : Term) (parents : List ParentFrame) :
    Configuration program dispatcher :=
  positiveClockMutationConfiguration program dispatcher
    (Registers.newJob program) (stage + 1) 0 stage
    (.left environment :: parents)

/-- The exact next-stage source mutates immediately at its positive clock row. -/
theorem nextStageSource_seekFirst
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (stage : Nat) (environment : Term) (parents : List ParentFrame) :
    FiniteController.seekMutation (SchedulerControl.machine program dispatcher) 1
      (nextStageSourceConfiguration program dispatcher stage environment parents) =
      some (nextStageFirstMutationConfiguration program dispatcher stage
        environment parents) := by
  simpa [nextStageSourceConfiguration,
    nextStageFirstMutationConfiguration, clockPhaseSourceConfiguration] using
    (positiveClockMutation_seek program dispatcher (Registers.newJob program)
      (stage + 1) 0 stage (.left environment :: parents))

/-! ## Fresh terminal response -/

/-- Parent stack retained after the literal `R L` descent through a fresh
completed Local. -/
def freshContinuationParents
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (carrier : Term) (parents : List ParentFrame) : List ParentFrame :=
  .left carrier ::
    .right (SchedulerResponse.localContinuationLeft bits (freshHField carrier)
      (SchedulerResponse.completedRoute program dispatcher registers bit carrier)
      carrier) :: parents

/-- The exact next-stage source nested in a fresh completed root response. -/
def freshNextStageSourceConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (stage : Nat) (environment carrier : Term)
    (parents : List ParentFrame) : Configuration program dispatcher :=
  nextStageSourceConfiguration program dispatcher stage environment
    (freshContinuationParents program dispatcher registers bit bits carrier
      parents)

/-- Exact cursor-only cost from a fresh terminal `RETURN` to the next clock. -/
def freshReturnTicks
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (stage : Nat) (environment carrier : Term)
    (parents : List ParentFrame) : Nat :=
  let continuation := Dovetail.clockExit stage 0 environment
  let completed := SchedulerResponse.completedCursor program dispatcher
    registers bit bits continuation carrier parents
  let continuationParents := freshContinuationParents program dispatcher
    registers bit bits carrier parents
  1 +
    (SchedulerControl.compiledProbeCost program dispatcher
        (.pending .normalReturn) completed +
      ((SchedulerControl.jobScript program dispatcher .continuation).length +
        1)) +
    terminalCheckTicks program dispatcher registers.advance stage environment
      continuationParents

/-- A nonempty fresh terminal response preserves the accepted bare term while
control enters the exact next-stage source.  The mutation delta is zero. -/
theorem freshReturn_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (stage : Nat) (environment carrier : Term)
    (parents : List ParentFrame)
    (bit_eq : registers.bit = some bit)
    (output_eq : SchedulerControl.outputEmpty program registers bit = false)
    (pendingReject : SchedulerControl.compiledProbeAnswer program dispatcher
      (.pending .normalReturn)
      (SchedulerResponse.completedCursor program dispatcher registers bit bits
        (Dovetail.clockExit stage 0 environment) carrier parents) = false) :
    ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (freshReturnTicks program dispatcher registers bit bits stage environment
        carrier parents)
      (SchedulerResponse.returnConfiguration program dispatcher registers bit
        bits (Dovetail.clockExit stage 0 environment) carrier parents)
      (freshNextStageSourceConfiguration program dispatcher registers bit bits
        stage environment carrier parents) := by
  let continuation := Dovetail.clockExit stage 0 environment
  let completed := SchedulerResponse.completedCursor program dispatcher
    registers bit bits continuation carrier parents
  let continuationParents := freshContinuationParents program dispatcher
    registers bit bits carrier parents
  have enter := SchedulerResponse.returnNoMark_zeroRun program dispatcher
    registers bit bits continuation carrier parents bit_eq output_eq
  have handoff := SchedulerResponse.freshTerminalContinuation_zeroRun program
    dispatcher registers bit bits continuation carrier parents pendingReject
  have checked := terminalCheck_zeroRun program dispatcher registers.advance
    stage environment continuationParents
  have beforeCheck : ZeroMutationRun
      (SchedulerControl.machine program dispatcher)
      (1 +
        (SchedulerControl.compiledProbeCost program dispatcher
            (.pending .normalReturn) completed +
          ((SchedulerControl.jobScript program dispatcher .continuation).length +
            1)))
      (SchedulerResponse.returnConfiguration program dispatcher registers bit
        bits continuation carrier parents)
      (SchedulerContinuation.checkConfiguration program dispatcher
        registers.advance (terminalCursor stage environment
          continuationParents)) := by
    have combined := enter.trans handoff
    simpa [completed, continuationParents, freshContinuationParents,
      terminalCursor, continuation,
      SchedulerContinuation.checkConfiguration] using! combined
  have combined := beforeCheck.trans checked
  simpa [freshReturnTicks, freshNextStageSourceConfiguration, continuation,
    completed, continuationParents, Nat.add_assoc] using combined

/-- Exact mutation-chain form of `freshReturn_zeroRun`: there are no samples
between the completed response and the next-stage clock source. -/
theorem freshReturn_exactMutationChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (stage : Nat) (environment carrier : Term)
    (parents : List ParentFrame)
    (bit_eq : registers.bit = some bit)
    (output_eq : SchedulerControl.outputEmpty program registers bit = false)
    (pendingReject : SchedulerControl.compiledProbeAnswer program dispatcher
      (.pending .normalReturn)
      (SchedulerResponse.completedCursor program dispatcher registers bit bits
        (Dovetail.clockExit stage 0 environment) carrier parents) = false) :
    ExactMutationChain (SchedulerControl.machine program dispatcher)
      (freshNextStageSourceConfiguration program dispatcher registers bit bits
        stage environment carrier parents)
      (SchedulerResponse.returnConfiguration program dispatcher registers bit
        bits (Dovetail.clockExit stage 0 environment) carrier parents) [] :=
  .done _ (freshReturn_zeroRun program dispatcher registers bit bits stage
    environment carrier parents bit_eq output_eq pendingReject)

/-- Executable search from the fresh completed `RETURN` finds the first clock
contraction of the next stage at the exact cursor below that Local. -/
theorem freshReturn_seekNextStageFirst
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (stage : Nat) (environment carrier : Term)
    (parents : List ParentFrame)
    (bit_eq : registers.bit = some bit)
    (output_eq : SchedulerControl.outputEmpty program registers bit = false)
    (pendingReject : SchedulerControl.compiledProbeAnswer program dispatcher
      (.pending .normalReturn)
      (SchedulerResponse.completedCursor program dispatcher registers bit bits
        (Dovetail.clockExit stage 0 environment) carrier parents) = false) :
    FiniteController.seekMutation (SchedulerControl.machine program dispatcher)
      (freshReturnTicks program dispatcher registers bit bits stage environment
        carrier parents + 1)
      (SchedulerResponse.returnConfiguration program dispatcher registers bit
        bits (Dovetail.clockExit stage 0 environment) carrier parents) =
      some (nextStageFirstMutationConfiguration program dispatcher stage
        environment
        (freshContinuationParents program dispatcher registers bit bits carrier
          parents)) := by
  exact (freshReturn_zeroRun program dispatcher registers bit bits stage
    environment carrier parents bit_eq output_eq pendingReject).seekMutation_prepend
      (nextStageSource_seekFirst program dispatcher stage environment
        (freshContinuationParents program dispatcher registers bit bits carrier
          parents))

/-! ## Marked terminal response -/

/-- Exact cursor immediately after the unique `Rdx` of the normal marker
script.  Rebuilding it gives the fully marked completed Local. -/
def normalMarkerCursor
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) : Cursor :=
  ⟨Carrier.markedHField carrier carrier,
    .left (SchedulerResponse.completedRoute program dispatcher registers bit
      carrier) ::
    .left (.app (seedCode bits) carrier) ::
    .left (.app continuation carrier) :: parents⟩

/-- Controller configuration sampled by the registered normal marker
contraction. -/
def normalMarkerMutationConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    Configuration program dispatcher :=
  ⟨some (.script .markNormal ⟨4, by
      simp [SchedulerControl.jobScript, PrimitiveScripts.mark]⟩ registers),
    normalMarkerCursor program dispatcher registers bit bits continuation carrier
      parents⟩

/-- The marker sample erases to the literal marked completed response. -/
theorem normalMarkerMutation_erase
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    (normalMarkerMutationConfiguration program dispatcher registers bit bits
      continuation carrier parents).cursor.erase =
      (SchedulerResponse.markedCursor program dispatcher registers bit bits
        continuation carrier parents).erase := by
  simp [normalMarkerMutationConfiguration, normalMarkerCursor,
    SchedulerResponse.markedCursor, SchedulerResponse.completedRoute,
    LocalResponse.markedCompleted, Carrier.activeShell, Carrier.shell,
    Cursor.erase, Cursor.rebuild]

/-- From the marker script source, executable sampling finds its unique
contraction after exactly four script rows. -/
theorem markStart_seekMutation
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    FiniteController.seekMutation (SchedulerControl.machine program dispatcher)
      4
      (SchedulerResponse.markStartConfiguration program dispatcher registers bit
        bits continuation carrier parents) =
      some (normalMarkerMutationConfiguration program dispatcher registers bit
        bits continuation carrier parents) := by
  rfl

/-- The remaining three ascents and script epsilon after the marker sample are
mutation-free. -/
theorem normalMarkerSuffix_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    ZeroMutationRun (SchedulerControl.machine program dispatcher) 4
      (normalMarkerMutationConfiguration program dispatcher registers bit bits
        continuation carrier parents)
      (SchedulerResponse.markedPendingConfiguration program dispatcher registers
        bit bits continuation carrier parents) := by
  constructor <;> rfl

/-- Parent stack retained after the literal `R L` descent through a marked
completed Local. -/
def markedContinuationParents
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (carrier : Term) (parents : List ParentFrame) : List ParentFrame :=
  .left carrier ::
    .right (SchedulerResponse.localContinuationLeft bits
      (Carrier.markedHField carrier carrier)
      (SchedulerResponse.completedRoute program dispatcher registers bit carrier)
      carrier) :: parents

/-- The exact next-stage source nested in the marked terminal checkpoint. -/
def markedNextStageSourceConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (stage : Nat) (environment carrier : Term)
    (parents : List ParentFrame) : Configuration program dispatcher :=
  nextStageSourceConfiguration program dispatcher stage environment
    (markedContinuationParents program dispatcher registers bit bits carrier
      parents)

/-- Exact cursor-only suffix from the sampled marker contraction into the
next-stage clock source. -/
theorem normalMarkerMutation_toNextStage_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (stage : Nat) (environment carrier : Term)
    (parents : List ParentFrame)
    (pendingReject : SchedulerControl.compiledProbeAnswer program dispatcher
      (.pending .normalReturn)
      (SchedulerResponse.markedCursor program dispatcher registers bit bits
        (Dovetail.clockExit stage 0 environment) carrier parents) = false) :
    ∃ ticks,
      ZeroMutationRun (SchedulerControl.machine program dispatcher) ticks
        (normalMarkerMutationConfiguration program dispatcher registers bit bits
          (Dovetail.clockExit stage 0 environment) carrier parents)
        (markedNextStageSourceConfiguration program dispatcher registers bit bits
          stage environment carrier parents) := by
  let continuation := Dovetail.clockExit stage 0 environment
  let continuationParents := markedContinuationParents program dispatcher
    registers bit bits carrier parents
  have suffix := normalMarkerSuffix_zeroRun program dispatcher registers bit bits
    continuation carrier parents
  have handoff := SchedulerResponse.markedTerminalContinuation_zeroRun program
    dispatcher registers bit bits continuation carrier parents pendingReject
  have checked := terminalCheck_zeroRun program dispatcher registers.advance
    stage environment continuationParents
  have toCheck := suffix.trans handoff
  have complete : ZeroMutationRun (SchedulerControl.machine program dispatcher)
      ((4 +
          (SchedulerControl.compiledProbeCost program dispatcher
              (.pending .normalReturn)
              (SchedulerResponse.markedCursor program dispatcher registers bit
                bits continuation carrier parents) +
            ((SchedulerControl.jobScript program dispatcher .continuation).length +
              1))) +
        terminalCheckTicks program dispatcher registers.advance stage environment
          continuationParents)
      (normalMarkerMutationConfiguration program dispatcher registers bit bits
        continuation carrier parents)
      (markedNextStageSourceConfiguration program dispatcher registers bit bits
        stage environment carrier parents) := by
    have combined := toCheck.trans checked
    simpa [continuationParents, markedContinuationParents, terminalCursor,
      SchedulerContinuation.checkConfiguration, continuation,
      markedNextStageSourceConfiguration, Nat.add_assoc] using combined
  exact ⟨_, complete⟩

/-- The empty terminal `RETURN` has exactly one remaining contraction and
lands at the exact nested next-stage clock source. -/
theorem markedReturn_countedRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (stage : Nat) (environment carrier : Term)
    (parents : List ParentFrame)
    (bit_eq : registers.bit = some bit)
    (output_eq : SchedulerControl.outputEmpty program registers bit = true)
    (pendingReject : SchedulerControl.compiledProbeAnswer program dispatcher
      (.pending .normalReturn)
      (SchedulerResponse.markedCursor program dispatcher registers bit bits
        (Dovetail.clockExit stage 0 environment) carrier parents) = false) :
    ∃ ticks,
      CountedRun (SchedulerControl.machine program dispatcher) ticks 1
        (SchedulerResponse.returnConfiguration program dispatcher registers bit
          bits (Dovetail.clockExit stage 0 environment) carrier parents)
        (markedNextStageSourceConfiguration program dispatcher registers bit bits
          stage environment carrier parents) := by
  let continuation := Dovetail.clockExit stage 0 environment
  have marked := SchedulerResponse.returnMark_countedRun program dispatcher
    registers bit bits continuation carrier parents bit_eq output_eq
  have handoff := SchedulerResponse.markedTerminalContinuation_zeroRun program
    dispatcher registers bit bits continuation carrier parents pendingReject
  let continuationParents := markedContinuationParents program dispatcher
    registers bit bits carrier parents
  have checked := terminalCheck_zeroRun program dispatcher registers.advance
    stage environment continuationParents
  have combined := (marked.trans handoff.toCounted).trans checked.toCounted
  let totalTicks :=
    (1 +
        ((SchedulerControl.jobScript program dispatcher .markNormal).length +
          1) +
      (SchedulerControl.compiledProbeCost program dispatcher
          (.pending .normalReturn)
          (SchedulerResponse.markedCursor program dispatcher registers bit bits
            continuation carrier parents) +
        ((SchedulerControl.jobScript program dispatcher .continuation).length +
          1))) +
      terminalCheckTicks program dispatcher registers.advance stage environment
        continuationParents
  exact ⟨totalTicks, by
    simpa [totalTicks, continuation, continuationParents, markedContinuationParents,
    terminalCursor, SchedulerContinuation.checkConfiguration,
    markedNextStageSourceConfiguration, Nat.add_assoc] using combined⟩

/-- Sampling from the empty terminal `RETURN` finds the unique marker
contraction at the named configuration. -/
theorem markedReturn_seekMarker
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame)
    (bit_eq : registers.bit = some bit)
    (output_eq : SchedulerControl.outputEmpty program registers bit = true) :
    FiniteController.seekMutation (SchedulerControl.machine program dispatcher)
      5
      (SchedulerResponse.returnConfiguration program dispatcher registers bit
        bits continuation carrier parents) =
      some (normalMarkerMutationConfiguration program dispatcher registers bit
        bits continuation carrier parents) := by
  have enter : ZeroMutationRun (SchedulerControl.machine program dispatcher) 1
      (SchedulerResponse.returnConfiguration program dispatcher registers bit
        bits continuation carrier parents)
      (SchedulerResponse.markStartConfiguration program dispatcher registers bit
        bits continuation carrier parents) := by
    refine ⟨?_, ?_⟩
    · simpa [FiniteController.run] using
        SchedulerResponse.step_returnMark program dispatcher registers bit bits
          continuation carrier parents bit_eq output_eq
    · unfold FiniteController.runMutationCount
      unfold FiniteController.mutationCount SchedulerControl.machine
      simp [SchedulerResponse.returnConfiguration, SchedulerControl.transition,
        bit_eq, output_eq, FiniteController.runMutationCount]
  simpa using enter.seekMutation_prepend
    (markStart_seekMutation program dispatcher registers bit bits continuation
      carrier parents)

/-- Exact singleton mutation chain from an empty terminal `RETURN` to the next
clock source. -/
theorem markedReturn_exactMutationChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (stage : Nat) (environment carrier : Term)
    (parents : List ParentFrame)
    (bit_eq : registers.bit = some bit)
    (output_eq : SchedulerControl.outputEmpty program registers bit = true)
    (pendingReject : SchedulerControl.compiledProbeAnswer program dispatcher
      (.pending .normalReturn)
      (SchedulerResponse.markedCursor program dispatcher registers bit bits
        (Dovetail.clockExit stage 0 environment) carrier parents) = false) :
    ExactMutationChain (SchedulerControl.machine program dispatcher)
      (markedNextStageSourceConfiguration program dispatcher registers bit bits
        stage environment carrier parents)
      (SchedulerResponse.returnConfiguration program dispatcher registers bit
        bits (Dovetail.clockExit stage 0 environment) carrier parents)
      [normalMarkerMutationConfiguration program dispatcher registers bit bits
        (Dovetail.clockExit stage 0 environment) carrier parents] := by
  have found := markedReturn_seekMarker program dispatcher registers bit bits
    (Dovetail.clockExit stage 0 environment) carrier parents bit_eq output_eq
  obtain ⟨ticks, suffix⟩ := normalMarkerMutation_toNextStage_zeroRun program
    dispatcher registers bit bits stage environment carrier parents pendingReject
  exact .next 5 found (.done ticks suffix)

/-- A positive-prefix certificate classifies the named marker contraction at
its exact global contraction index. -/
theorem normalMarker_event
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) (sampleIndex offset : Nat)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame)
    {activeContext : Context} {chain : CheckpointDecoder.ChainView program}
    (certificate : CheckpointRun.PositivePrefix program dispatcher inputBits
      (offset + 1)
      (normalMarkerMutationConfiguration program dispatcher registers bit bits
        continuation carrier parents).cursor.erase
      (ExactCheckpointRun.checkpointTime program dispatcher inputBits
        (offset + 1)) activeContext chain)
    (index_eq : sampleIndex =
      ExactCheckpointRun.checkpointTime program dispatcher inputBits
        (offset + 1)) :
    EventEvidence program dispatcher inputBits sampleIndex .return
      (normalMarkerMutationConfiguration program dispatcher registers bit bits
        continuation carrier parents).cursor.erase :=
  .positive offset certificate index_eq

/-- The fresh empty response immediately before its marker remains rejected in
the `RETURN` family. -/
theorem returnPreMarker_rejected
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {term : Term}
    (shape : CheckpointExclusion.PreMarkerEmptyShape program dispatcher.tree
      term) :
    CheckpointDecoder.decode? program dispatcher.tree term = none ∧
      ∀ result : CheckpointDecoder.Result program,
        ¬ CheckpointExclusion.Accepted program dispatcher.tree .return term
          result := by
  exact ⟨shape.decode?_none, fun result =>
    CheckpointExclusion.returnPreMarker_notAccepted shape result⟩

/-- Decoder evidence form of the same pre-marker rejection. -/
theorem returnPreMarker_decoderEvidence
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {term : Term}
    (shape : CheckpointExclusion.PreMarkerEmptyShape program dispatcher.tree
      term) :
    DecoderEvidence program dispatcher.tree .return term :=
  .public (.rejected (.returnPreMarker shape))

/-- The normal marker contraction has the full simultaneous invariant under
the now-marked `RETURN` checkpoint interface. -/
theorem normalMarker_holds
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame)
    {phase : CTS.Phase program} {scanned : List Bool} {emptyMode : Bool}
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    (snapshotInv : ReachableAudit.Holds program dispatcher.tree bits continuation
      carrier)
    {result : CheckpointDecoder.PositiveView program}
    (terminal : CheckpointExclusion.TerminalCheckpointShape program
      dispatcher.tree .marked result
      (normalMarkerMutationConfiguration program dispatcher registers bit bits
        continuation carrier parents).cursor.erase) :
    Holds program dispatcher
      (normalMarkerMutationConfiguration program dispatcher registers bit bits
        continuation carrier parents) := by
  let completed := SchedulerResponse.completedCursor program dispatcher
    registers bit bits continuation carrier parents
  let marked := SchedulerResponse.markedCursor program dispatcher registers bit
    bits continuation carrier parents
  let sample := normalMarkerCursor program dispatcher registers bit bits
    continuation carrier parents
  have prefixRun : Script.run
      (List.take 4
        (SchedulerControl.jobScript program dispatcher .markNormal)) completed =
      some sample := by
    rfl
  have suffixRun : Script.run
      (List.drop 4
        (SchedulerControl.jobScript program dispatcher .markNormal)) sample =
      some marked := by
    rfl
  have safe : CommandSafe sample
      (SchedulerControl.transition program dispatcher
        (.script .markNormal ⟨4, by
          simp [SchedulerControl.jobScript, PrimitiveScripts.mark]⟩ registers)
        (Probe.observeNode sample) (Probe.observeIncoming sample)) := by
    exact ⟨_, rfl⟩
  have position : ControlPosition program dispatcher
      (.script .markNormal ⟨4, by
        simp [SchedulerControl.jobScript, PrimitiveScripts.mark]⟩ registers)
      sample :=
    .script prefixRun suffixRun safe
  let markedTerm := LocalResponse.markedCompleted bits continuation carrier
    (SchedulerResponse.completedRoute program dispatcher registers bit carrier)
  have markedInv : ReachableAudit.Holds program dispatcher.tree bits continuation
      markedTerm := by
    exact SchedulerResponse.marked_holds program dispatcher registers bit bits
      continuation carrier snapshotInv
  have audit : AuditedOccurrence program dispatcher.tree sample.erase := by
    refine .intro bits continuation markedTerm
      (SchedulerInvariant.contextOfParents parents) markedInv ?_
    have sampleErase : sample.erase =
        (SchedulerResponse.markedCursor program dispatcher registers bit bits
          continuation carrier parents).erase := by
      simpa [sample] using! normalMarkerMutation_erase program dispatcher registers
        bit bits continuation carrier parents
    rw [sampleErase]
    change Cursor.rebuild parents markedTerm =
      (SchedulerInvariant.contextOfParents parents).plug markedTerm
    exact (SchedulerInvariant.contextOfParents_plug parents markedTerm).symm
  exact .intro
    (.script .markNormal ⟨4, by
      simp [SchedulerControl.jobScript, PrimitiveScripts.mark]⟩ registers)
    rfl phase scanned emptyMode coherent position
    (.return (.public (.returnMarkedTerminal terminal)) audit)

/-- Full sampled-state wrapper for the normal root marker contraction. -/
theorem normalMarker_sampledState
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) (sampleIndex offset : Nat)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame)
    (holds : Holds program dispatcher
      (normalMarkerMutationConfiguration program dispatcher registers bit bits
        continuation carrier parents))
    {activeContext : Context} {chain : CheckpointDecoder.ChainView program}
    (certificate : CheckpointRun.PositivePrefix program dispatcher inputBits
      (offset + 1)
      (normalMarkerMutationConfiguration program dispatcher registers bit bits
        continuation carrier parents).cursor.erase
      (ExactCheckpointRun.checkpointTime program dispatcher inputBits
        (offset + 1)) activeContext chain)
    (index_eq : sampleIndex =
      ExactCheckpointRun.checkpointTime program dispatcher inputBits
        (offset + 1)) :
    SampledState program dispatcher inputBits sampleIndex
      (normalMarkerMutationConfiguration program dispatcher registers bit bits
        continuation carrier parents) := by
  refine ⟨holds, ⟨.script .markNormal ⟨4, by
    simp [SchedulerControl.jobScript, PrimitiveScripts.mark]⟩ registers,
    rfl, ?_⟩⟩
  exact .positive offset certificate index_eq

/-- Exact marked terminal shape obtained by applying the registered marker to
a one-layer root response whose public accumulator decodes as empty. -/
def markedRootTerminalShape
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {snapshot dispatcherTerm accumulator continuation : Term}
    {route : Dispatcher.Route} {label : ActionLabel program}
    {terminal : CheckpointDecoder.TerminalView}
    (bits : List Bool)
    (dispatch : ReachableAudit.SnapshotDispatchAt program tree snapshot route
      label accumulator dispatcherTerm)
    (inner : CheckpointDecoder.ChainShape program tree continuation
      (.terminal terminal))
    (phase : label.1 =
      CheckpointDecoder.expectedPhase program terminal.horizon)
    (empty : CheckpointDecoder.CarrierDecodes program tree accumulator []) :
    CheckpointExclusion.TerminalCheckpointShape program tree .marked
      ⟨terminal.horizon, route, label, []⟩
      (LocalResponse.markedCompleted bits continuation snapshot dispatcherTerm) := by
  let view := CheckpointDecoder.markedCompletedView program route label
    accumulator bits continuation
  let chain : CheckpointDecoder.ChainView program := ⟨1, terminal, view⟩
  have chainShape : CheckpointDecoder.ChainShape program tree
      (LocalResponse.markedCompleted bits continuation snapshot dispatcherTerm)
      (.completed chain) := by
    simpa [chain, view] using
      (CheckpointDecoder.ChainShape.prepend_markedResponse_terminal bits dispatch
        inner)
  exact
    { chain := chain
      chainShape := chainShape
      phase := by simpa [chain, view] using! phase
      carrier := by simpa [chain, view] using! empty
      marker := by rfl
      result_eq := by rfl
      status_eq := by rfl }

/-- Family-independent public acceptance of a named marked marker sample. -/
theorem marked_acceptedCheckpoint
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {term : Term} {result : CheckpointDecoder.PositiveView program}
    (terminal : CheckpointExclusion.TerminalCheckpointShape program
      dispatcher.tree .marked result term) :
    CheckpointExclusion.AcceptedCheckpoint program dispatcher.tree term
      (.positive result) :=
  .positive .marked terminal

/-! ## Absorbing-EMPTY terminal and cleanup -/

/-- Parent stack retained after `R L` through a terminal marked EMPTY Local. -/
def emptyContinuationParents
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bits : List Bool)
    (carrier : Term) (parents : List ParentFrame) : List ParentFrame :=
  .left carrier ::
    .right (SchedulerResponse.localContinuationLeft bits
      (Carrier.markedHField carrier carrier)
      (SchedulerResponse.completedRoute program dispatcher registers false
        carrier) carrier) :: parents

/-- Exact next-stage source nested in the terminal marked EMPTY Local. -/
def emptyNextStageSourceConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bits : List Bool)
    (stage : Nat) (environment carrier : Term)
    (parents : List ParentFrame) : Configuration program dispatcher :=
  nextStageSourceConfiguration program dispatcher stage environment
    (emptyContinuationParents program dispatcher registers bits carrier parents)

/-- A terminal EMPTY frame, including its zero action and marker, reaches the
exact next-stage clock source with its public structural mutation count. -/
theorem emptyTerminal_countedRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bits : List Bool)
    (stage : Nat) (environment carrier : Term)
    (parents : List ParentFrame)
    (pendingReject : SchedulerControl.compiledProbeAnswer program dispatcher
      (.pending .emptyReturn)
      (SchedulerEmpty.markedCursor program dispatcher registers bits
        (Dovetail.clockExit stage 0 environment) carrier parents) = false) :
    ∃ ticks,
      CountedRun (SchedulerControl.machine program dispatcher) ticks
        (LocalResponse.completedCost program
            (dispatcher.route (registers.phase, false))
            (registers.phase, false) + 1)
        (SchedulerEmpty.frameConfiguration program dispatcher registers bits
          (Dovetail.clockExit stage 0 environment) carrier parents)
        (emptyNextStageSourceConfiguration program dispatcher registers bits
          stage environment carrier parents) := by
  let continuation := Dovetail.clockExit stage 0 environment
  have frameRun := SchedulerEmpty.frame_countedRun program dispatcher registers
    bits continuation carrier parents
  have handoff := SchedulerEmpty.terminalContinuation_zeroRun program dispatcher
    registers bits continuation carrier parents pendingReject
  let continuationParents := emptyContinuationParents program dispatcher
    registers bits carrier parents
  have checked := terminalCheck_zeroRun program dispatcher
    registers.advanceEmpty stage environment continuationParents
  have combined := (frameRun.trans handoff.toCounted).trans checked.toCounted
  let totalTicks :=
    (((1 +
          ((SchedulerControl.jobScript program dispatcher
            (.emptyResponse (registers.phase, false))).length + 1)) +
        ((SchedulerControl.jobScript program dispatcher .markEmpty).length +
          1)) +
      (SchedulerControl.compiledProbeCost program dispatcher
          (.pending .emptyReturn)
          (SchedulerEmpty.markedCursor program dispatcher registers bits
            continuation carrier parents) +
        ((SchedulerControl.jobScript program dispatcher .continuation).length +
          1))) +
      terminalCheckTicks program dispatcher registers.advanceEmpty stage
        environment continuationParents
  exact ⟨totalTicks, by
    simpa [totalTicks, continuation, continuationParents,
      emptyContinuationParents, terminalCursor,
      SchedulerContinuation.checkConfiguration,
      emptyNextStageSourceConfiguration, Nat.add_assoc] using combined⟩

/-- Total contraction count of `count` enclosing EMPTY parents followed by
the terminal EMPTY frame. -/
def emptyCleanupMutations
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (count : Nat) (registers : Registers program) : Nat :=
  SchedulerCycle.emptySweepMutations program dispatcher count registers +
    (LocalResponse.completedCost program
        (dispatcher.route
          ((SchedulerCycle.emptySweepRegisters program count registers).phase,
            false))
        ((SchedulerCycle.emptySweepRegisters program count registers).phase,
          false) + 1)

/-- Exact absorbing-EMPTY cleanup of every registered pending parent, followed
by the terminal marked frame and entry into the next-stage clock source. -/
theorem emptyCleanup_countedRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (stage count : Nat)
    (registers : Registers program) (carrier : Term) :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    let continuation := Dovetail.clockExit stage 0 environment
    let finalRegisters :=
      SchedulerCycle.emptySweepRegisters program count registers
    let finalCarrier :=
      SchedulerCycle.emptySweepCarrier program dispatcher bits continuation
        count registers carrier
    ∃ ticks,
      CountedRun (SchedulerControl.machine program dispatcher) ticks
        (emptyCleanupMutations program dispatcher count registers)
        (SchedulerEmpty.frameConfiguration program dispatcher registers bits
          continuation carrier
          (PrimitiveFuel.pendingParents environment continuation count []))
        (emptyNextStageSourceConfiguration program dispatcher finalRegisters bits
          stage environment finalCarrier []) := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let continuation := Dovetail.clockExit stage 0 environment
  let finalRegisters :=
    SchedulerCycle.emptySweepRegisters program count registers
  let finalCarrier :=
    SchedulerCycle.emptySweepCarrier program dispatcher bits continuation count
      registers carrier
  obtain ⟨sweepTicks, sweep⟩ := SchedulerCycle.emptyPendingSweep program
    dispatcher bits continuation carrier registers count []
  have pendingReject : SchedulerControl.compiledProbeAnswer program dispatcher
      (.pending .emptyReturn)
      (SchedulerEmpty.markedCursor program dispatcher finalRegisters bits
        continuation finalCarrier []) = false := by
    rfl
  obtain ⟨terminalTicks, terminal⟩ := emptyTerminal_countedRun program
    dispatcher finalRegisters bits stage environment finalCarrier [] pendingReject
  refine ⟨sweepTicks + terminalTicks, ?_⟩
  have combined := sweep.trans terminal
  simpa [environment, continuation, finalRegisters, finalCarrier,
    emptyCleanupMutations, Nat.add_assoc] using combined

/-! ### The terminal EMPTY marker sample -/

/-- Exact post-contraction cursor of the terminal EMPTY marker. -/
def emptyMarkerCursor
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) : Cursor :=
  normalMarkerCursor program dispatcher registers false bits continuation carrier
    parents

/-- The contraction-sampled controller configuration of the terminal EMPTY
marker. -/
def emptyMarkerMutationConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    Configuration program dispatcher :=
  ⟨some (.script .markEmpty ⟨4, by
      simp [SchedulerControl.jobScript, PrimitiveScripts.mark]⟩ registers),
    emptyMarkerCursor program dispatcher registers bits continuation carrier
      parents⟩

/-- The terminal EMPTY marker sample erases to the exact marked Local root. -/
theorem emptyMarkerMutation_erase
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    (emptyMarkerMutationConfiguration program dispatcher registers bits
      continuation carrier parents).cursor.erase =
      (SchedulerEmpty.markedCursor program dispatcher registers bits continuation
        carrier parents).erase := by
  simpa [emptyMarkerMutationConfiguration, emptyMarkerCursor,
    SchedulerEmpty.markedCursor] using!
    normalMarkerMutation_erase program dispatcher registers false bits
      continuation carrier parents

/-- Executable sampling finds the unique terminal EMPTY marker contraction at
the fourth marker-script row. -/
theorem emptyMarkStart_seekMutation
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    FiniteController.seekMutation (SchedulerControl.machine program dispatcher)
      4
      (SchedulerEmpty.markStartConfiguration program dispatcher registers bits
        continuation carrier parents) =
      some (emptyMarkerMutationConfiguration program dispatcher registers bits
        continuation carrier parents) := by
  rfl

/-- The remaining three ascents and epsilon after the terminal EMPTY marker are
mutation-free. -/
theorem emptyMarkerSuffix_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    ZeroMutationRun (SchedulerControl.machine program dispatcher) 4
      (emptyMarkerMutationConfiguration program dispatcher registers bits
        continuation carrier parents)
      (SchedulerEmpty.markedPendingConfiguration program dispatcher registers
        bits continuation carrier parents) := by
  constructor <;> rfl

/-- Exact cursor-only suffix from a terminal EMPTY marker sample to the actual
next-stage positive-clock source. -/
theorem emptyMarkerMutation_toNextStage_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bits : List Bool)
    (stage : Nat) (environment carrier : Term)
    (parents : List ParentFrame)
    (pendingReject : SchedulerControl.compiledProbeAnswer program dispatcher
      (.pending .emptyReturn)
      (SchedulerEmpty.markedCursor program dispatcher registers bits
        (Dovetail.clockExit stage 0 environment) carrier parents) = false) :
    ∃ ticks,
      ZeroMutationRun (SchedulerControl.machine program dispatcher) ticks
        (emptyMarkerMutationConfiguration program dispatcher registers bits
          (Dovetail.clockExit stage 0 environment) carrier parents)
        (emptyNextStageSourceConfiguration program dispatcher registers bits
          stage environment carrier parents) := by
  let continuation := Dovetail.clockExit stage 0 environment
  let continuationParents := emptyContinuationParents program dispatcher
    registers bits carrier parents
  have suffix := emptyMarkerSuffix_zeroRun program dispatcher registers bits
    continuation carrier parents
  have handoff := SchedulerEmpty.terminalContinuation_zeroRun program dispatcher
    registers bits continuation carrier parents pendingReject
  have checked := terminalCheck_zeroRun program dispatcher
    registers.advanceEmpty stage environment continuationParents
  have combined := (suffix.trans handoff).trans checked
  let totalTicks :=
    (4 +
      (SchedulerControl.compiledProbeCost program dispatcher
          (.pending .emptyReturn)
          (SchedulerEmpty.markedCursor program dispatcher registers bits
            continuation carrier parents) +
        ((SchedulerControl.jobScript program dispatcher .continuation).length +
          1))) +
      terminalCheckTicks program dispatcher registers.advanceEmpty stage
        environment continuationParents
  exact ⟨totalTicks, by
    simpa [totalTicks, continuation, continuationParents,
      emptyContinuationParents, terminalCursor,
      SchedulerContinuation.checkConfiguration,
      emptyNextStageSourceConfiguration, Nat.add_assoc] using combined⟩

/-- Exact singleton marker chain from the terminal EMPTY marker-script source
to the next-stage clock source. -/
theorem emptyMarker_exactMutationChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bits : List Bool)
    (stage : Nat) (environment carrier : Term)
    (parents : List ParentFrame)
    (pendingReject : SchedulerControl.compiledProbeAnswer program dispatcher
      (.pending .emptyReturn)
      (SchedulerEmpty.markedCursor program dispatcher registers bits
        (Dovetail.clockExit stage 0 environment) carrier parents) = false) :
    ExactMutationChain (SchedulerControl.machine program dispatcher)
      (emptyNextStageSourceConfiguration program dispatcher registers bits
        stage environment carrier parents)
      (SchedulerEmpty.markStartConfiguration program dispatcher registers bits
        (Dovetail.clockExit stage 0 environment) carrier parents)
      [emptyMarkerMutationConfiguration program dispatcher registers bits
        (Dovetail.clockExit stage 0 environment) carrier parents] := by
  have found := emptyMarkStart_seekMutation program dispatcher registers bits
    (Dovetail.clockExit stage 0 environment) carrier parents
  obtain ⟨ticks, suffix⟩ := emptyMarkerMutation_toNextStage_zeroRun program
    dispatcher registers bits stage environment carrier parents pendingReject
  exact .next 4 found (.done ticks suffix)

/-- The terminal EMPTY marker sample has the simultaneous invariant whenever
the construction supplies its coherent registers, carrier audit, and exact
marked terminal syntax. -/
theorem emptyMarker_holds
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame)
    {phase : CTS.Phase program} {scanned : List Bool}
    (coherent : RegistersCoherent registers phase scanned true)
    (snapshotInv : ReachableAudit.Holds program dispatcher.tree bits continuation
      carrier)
    {result : CheckpointDecoder.PositiveView program}
    (terminal : CheckpointExclusion.TerminalCheckpointShape program
      dispatcher.tree .marked result
      (emptyMarkerMutationConfiguration program dispatcher registers bits
        continuation carrier parents).cursor.erase) :
    Holds program dispatcher
      (emptyMarkerMutationConfiguration program dispatcher registers bits
        continuation carrier parents) := by
  let completed := SchedulerEmpty.completedCursor program dispatcher registers
    bits continuation carrier parents
  let marked := SchedulerEmpty.markedCursor program dispatcher registers bits
    continuation carrier parents
  let sample := emptyMarkerCursor program dispatcher registers bits continuation
    carrier parents
  have prefixRun : Script.run
      (List.take 4
        (SchedulerControl.jobScript program dispatcher .markEmpty)) completed =
      some sample := by
    rfl
  have suffixRun : Script.run
      (List.drop 4
        (SchedulerControl.jobScript program dispatcher .markEmpty)) sample =
      some marked := by
    rfl
  have safe : CommandSafe sample
      (SchedulerControl.transition program dispatcher
        (.script .markEmpty ⟨4, by
          simp [SchedulerControl.jobScript, PrimitiveScripts.mark]⟩ registers)
        (Probe.observeNode sample) (Probe.observeIncoming sample)) := by
    exact ⟨_, rfl⟩
  have position : ControlPosition program dispatcher
      (.script .markEmpty ⟨4, by
        simp [SchedulerControl.jobScript, PrimitiveScripts.mark]⟩ registers)
      sample :=
    .script prefixRun suffixRun safe
  let markedTerm := LocalResponse.markedCompleted bits continuation carrier
    (SchedulerResponse.completedRoute program dispatcher registers false carrier)
  have markedInv : ReachableAudit.Holds program dispatcher.tree bits continuation
      markedTerm := by
    exact SchedulerEmpty.marked_holds program dispatcher registers bits
      continuation carrier snapshotInv
  have audit : AuditedOccurrence program dispatcher.tree sample.erase := by
    refine .intro bits continuation markedTerm
      (SchedulerInvariant.contextOfParents parents) markedInv ?_
    have sampleErase : sample.erase =
        (SchedulerEmpty.markedCursor program dispatcher registers bits
          continuation carrier parents).erase := by
      simpa [sample] using! emptyMarkerMutation_erase program dispatcher registers
        bits continuation carrier parents
    rw [sampleErase]
    change Cursor.rebuild parents markedTerm =
      (SchedulerInvariant.contextOfParents parents).plug markedTerm
    exact (SchedulerInvariant.contextOfParents_plug parents markedTerm).symm
  exact .intro
    (.script .markEmpty ⟨4, by
      simp [SchedulerControl.jobScript, PrimitiveScripts.mark]⟩ registers)
    rfl phase scanned true coherent position
    (.empty (.public (.emptyTerminal terminal)) audit)

/-- Full sampled-state wrapper for the terminal EMPTY marker contraction. -/
theorem emptyMarker_sampledState
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) (sampleIndex offset : Nat)
    (registers : Registers program) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame)
    (holds : Holds program dispatcher
      (emptyMarkerMutationConfiguration program dispatcher registers bits
        continuation carrier parents))
    {activeContext : Context} {chain : CheckpointDecoder.ChainView program}
    (certificate : CheckpointRun.PositivePrefix program dispatcher inputBits
      (offset + 1)
      (emptyMarkerMutationConfiguration program dispatcher registers bits
        continuation carrier parents).cursor.erase
      (ExactCheckpointRun.checkpointTime program dispatcher inputBits
        (offset + 1)) activeContext chain)
    (index_eq : sampleIndex =
      ExactCheckpointRun.checkpointTime program dispatcher inputBits
        (offset + 1)) :
    SampledState program dispatcher inputBits sampleIndex
      (emptyMarkerMutationConfiguration program dispatcher registers bits
        continuation carrier parents) := by
  refine ⟨holds, ⟨.script .markEmpty ⟨4, by
    simp [SchedulerControl.jobScript, PrimitiveScripts.mark]⟩ registers,
    rfl, ?_⟩⟩
  exact .positive offset certificate index_eq

end SchedulerRootContinuation

end PureSFormal.PureS
