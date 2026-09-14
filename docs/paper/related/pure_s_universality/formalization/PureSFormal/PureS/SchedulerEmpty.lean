import PureSFormal.PureS.SchedulerContinuation

/-!
# Exact absorbing-empty scheduler family

This module refines Appendix A.4.7 at the executable controller level.  One
EMPTY frame applies the fixed zero action for the current phase, marks the
registered halt field, and either moves to the next enclosing pending frame or
hands the literal continuation to the arity-three/four table.
-/

namespace PureSFormal.PureS

namespace SchedulerEmpty

open FiniteController SchedulerControl SchedulerInvariant

abbrev Configuration (program : CTS.Program)
    (dispatcher : ActionDispatcher program) :=
  FiniteController.Configuration (SchedulerControl.Control program dispatcher)

def frameConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    Configuration program dispatcher :=
  ⟨some (.macro (.family .empty) registers),
    SchedulerResponse.frameCursor program dispatcher bits continuation carrier
      parents⟩

def responseStartConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    Configuration program dispatcher :=
  ⟨some (startScript (.emptyResponse (registers.phase, false)) registers),
    SchedulerResponse.frameCursor program dispatcher bits continuation carrier
      parents⟩

def completedCursor
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) : Cursor :=
  SchedulerResponse.completedCursor program dispatcher registers false bits
    continuation carrier parents

def markStartConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    Configuration program dispatcher :=
  ⟨some (startScript .markEmpty registers),
    completedCursor program dispatcher registers bits continuation carrier
      parents⟩

def markedCursor
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) : Cursor :=
  SchedulerResponse.markedCursor program dispatcher registers false bits
    continuation carrier parents

def markedPendingConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    Configuration program dispatcher :=
  ⟨some (startProbe (.pending .emptyReturn) registers.advanceEmpty),
    markedCursor program dispatcher registers bits continuation carrier parents⟩

/-- EMPTY deterministically enters its current phase's zero-response script. -/
theorem enterResponse_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    ZeroMutationRun (SchedulerControl.machine program dispatcher) 1
      (frameConfiguration program dispatcher registers bits continuation carrier
        parents)
      (responseStartConfiguration program dispatcher registers bits continuation
        carrier parents) := by
  refine ⟨rfl, ?_⟩
  rfl

/-- Exact zero-action response, ending at the fixed marker script's first PC. -/
theorem response_countedRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    CountedRun (SchedulerControl.machine program dispatcher)
      ((SchedulerControl.jobScript program dispatcher
        (.emptyResponse (registers.phase, false))).length + 1)
      (LocalResponse.completedCost program
        (dispatcher.route (registers.phase, false)) (registers.phase, false))
      (responseStartConfiguration program dispatcher registers bits continuation
        carrier parents)
      (markStartConfiguration program dispatcher registers bits continuation
        carrier parents) := by
  let before := SchedulerResponse.frameCursor program dispatcher bits continuation
    carrier parents
  let after := completedCursor program dispatcher registers bits continuation
    carrier parents
  have executes : Script.run
      (SchedulerControl.jobScript program dispatcher
        (.emptyResponse (registers.phase, false))) before = some after := by
    exact SchedulerControl.run_emptyResponse program dispatcher registers.phase
      bits continuation carrier parents
  refine ⟨?_, ?_⟩
  · simpa [responseStartConfiguration, markStartConfiguration, before, after]
      using! SchedulerExecution.run_script program dispatcher
        (.emptyResponse (registers.phase, false)) registers before after executes
  · have counted := SchedulerExecution.runMutationCount_script program
      dispatcher (.emptyResponse (registers.phase, false)) registers before after
      executes
    simpa [responseStartConfiguration, before,
      SchedulerControl.jobScript_emptyResponse,
      PrimitiveLocalResponse.execute_rdxCount] using counted

/-- Exact (A6) marker execution for EMPTY. -/
theorem mark_countedRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    CountedRun (SchedulerControl.machine program dispatcher)
      ((SchedulerControl.jobScript program dispatcher .markEmpty).length + 1) 1
      (markStartConfiguration program dispatcher registers bits continuation
        carrier parents)
      (markedPendingConfiguration program dispatcher registers bits continuation
        carrier parents) := by
  let before := completedCursor program dispatcher registers bits continuation
    carrier parents
  let after := markedCursor program dispatcher registers bits continuation carrier
    parents
  have executes : Script.run
      (SchedulerControl.jobScript program dispatcher .markEmpty) before =
      some after := by
    simpa [before, after, completedCursor, markedCursor,
      SchedulerControl.jobScript] using
      SchedulerResponse.run_markCompleted program dispatcher registers false bits
        continuation carrier parents
  refine ⟨?_, ?_⟩
  · simpa [markStartConfiguration, markedPendingConfiguration, before, after]
      using! SchedulerExecution.run_script program dispatcher .markEmpty registers
        before after executes
  · have counted := SchedulerExecution.runMutationCount_script program
      dispatcher .markEmpty registers before after executes
    simpa [markStartConfiguration, before, SchedulerControl.jobScript,
      PrimitiveScripts.mark, Script.rdxCount] using counted

/-- One complete EMPTY response at one frame, through its marked pending probe
source. -/
theorem frame_countedRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    CountedRun (SchedulerControl.machine program dispatcher)
      ((1 + ((SchedulerControl.jobScript program dispatcher
          (.emptyResponse (registers.phase, false))).length + 1)) +
        ((SchedulerControl.jobScript program dispatcher .markEmpty).length + 1))
      (LocalResponse.completedCost program
          (dispatcher.route (registers.phase, false)) (registers.phase, false) + 1)
      (frameConfiguration program dispatcher registers bits continuation carrier
        parents)
      (markedPendingConfiguration program dispatcher registers bits continuation
        carrier parents) := by
  have enter := (enterResponse_zeroRun program dispatcher registers bits
    continuation carrier parents).toCounted
  have response := response_countedRun program dispatcher registers bits
    continuation carrier parents
  have marked := mark_countedRun program dispatcher registers bits continuation
    carrier parents
  simpa using (enter.trans response).trans marked

/-- The marked EMPTY endpoint has the same strong recursive carrier audit. -/
theorem marked_holds
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bits : List Bool)
    (continuation carrier : Term)
    (snapshotInv : ReachableAudit.Holds program dispatcher.tree bits continuation
      carrier) :
    ReachableAudit.Holds program dispatcher.tree bits continuation
      (LocalResponse.markedCompleted bits continuation carrier
        (SchedulerResponse.completedRoute program dispatcher registers false
          carrier)) :=
  SchedulerResponse.marked_holds program dispatcher registers false bits
    continuation carrier snapshotInv

/-! ## Successful pending-parent repetition -/

def pendingProbeConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bits : List Bool)
    (continuation child : Term) (parents : List ParentFrame) :
    Configuration program dispatcher :=
  ⟨some (startProbe (.pending .emptyReturn) registers),
    SchedulerResponse.pendingChildCursor program dispatcher bits continuation
      child parents⟩

def nextFrameConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bits : List Bool)
    (continuation child : Term) (parents : List ParentFrame) :
    Configuration program dispatcher :=
  frameConfiguration program dispatcher registers bits continuation child
    parents

theorem pending_answer
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation child : Term)
    (parents : List ParentFrame) :
    SchedulerControl.compiledProbeAnswer program dispatcher
      (.pending .emptyReturn)
      (SchedulerResponse.pendingChildCursor program dispatcher bits continuation
        child parents) = true := by
  rfl

/-- A successful EMPTY pending probe restores the marked child, then moves one
edge up to the enclosing frame root and repeats EMPTY. -/
theorem pending_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bits : List Bool)
    (continuation child : Term) (parents : List ParentFrame) :
    ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher
          (.pending .emptyReturn)
          (SchedulerResponse.pendingChildCursor program dispatcher bits
            continuation child parents) + 1)
      (pendingProbeConfiguration program dispatcher registers bits continuation
        child parents)
      (nextFrameConfiguration program dispatcher registers bits continuation
        child parents) := by
  let cursor := SchedulerResponse.pendingChildCursor program dispatcher bits
    continuation child parents
  let decision : Configuration program dispatcher :=
    ⟨some (.macro (.pendingDecision .emptyReturn) registers), cursor⟩
  have probeRun := SchedulerExecution.run_parentProbe program dispatcher
    (.pending .emptyReturn) registers cursor .right rfl
  have probeCount := SchedulerExecution.runMutationCount_parentProbe program
    dispatcher (.pending .emptyReturn) registers cursor .right rfl
  have probe : ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher
        (.pending .emptyReturn) cursor)
      (pendingProbeConfiguration program dispatcher registers bits continuation
        child parents) decision := by
    refine ⟨?_, ?_⟩
    · simpa [pendingProbeConfiguration, decision, cursor, pending_answer,
        SchedulerExecution.commandResult, SchedulerControl.probeAnswer] using
        probeRun
    · simpa [pendingProbeConfiguration, cursor] using probeCount
  have move : ZeroMutationRun (SchedulerControl.machine program dispatcher) 1
      decision
      (nextFrameConfiguration program dispatcher registers bits continuation
        child parents) := by
    refine ⟨?_, ?_⟩
    · rfl
    · rfl
  simpa [decision, cursor, nextFrameConfiguration, frameConfiguration,
    SchedulerResponse.pendingChildCursor, SchedulerResponse.pendingFunction,
    PendingFrame.frame_eq_pending] using probe.trans move

/-- One EMPTY response under another pending frame, including the successful
repetition handoff to that parent. -/
theorem frame_toNext_countedRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    ∃ ticks,
      CountedRun (SchedulerControl.machine program dispatcher) ticks
        (LocalResponse.completedCost program
            (dispatcher.route (registers.phase, false))
            (registers.phase, false) + 1)
        (frameConfiguration program dispatcher registers bits continuation
          carrier
          (.right (SchedulerResponse.pendingFunction program dispatcher bits
            continuation) :: parents))
        (frameConfiguration program dispatcher registers.advanceEmpty bits
          continuation
          (LocalResponse.markedCompleted bits continuation carrier
            (SchedulerResponse.completedRoute program dispatcher registers false
              carrier)) parents) := by
  have response := frame_countedRun program dispatcher registers bits continuation
    carrier
    (.right (SchedulerResponse.pendingFunction program dispatcher bits
      continuation) :: parents)
  have pending := pending_zeroRun program dispatcher registers.advanceEmpty bits
    continuation
    (LocalResponse.markedCompleted bits continuation carrier
      (SchedulerResponse.completedRoute program dispatcher registers false
        carrier)) parents
  have combined := response.trans pending.toCounted
  exact ⟨_, by
    simpa [markedPendingConfiguration, markedCursor,
      pendingProbeConfiguration, SchedulerResponse.pendingChildCursor,
      SchedulerResponse.pendingFunction] using! combined⟩

/-! ## Terminal EMPTY continuation -/

/-- A failed EMPTY pending guard enters the same fixed `R L` continuation
script, retaining empty mode. -/
theorem failedPendingContinuation_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (origin target : Cursor)
    (pendingReject : SchedulerControl.compiledProbeAnswer program dispatcher
      (.pending .emptyReturn) origin = false)
    (continuationRun : Script.run
      (SchedulerControl.jobScript program dispatcher .continuation) origin =
        some target) :
    ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher
          (.pending .emptyReturn) origin +
        ((SchedulerControl.jobScript program dispatcher .continuation).length + 1))
      ⟨some (startProbe (.pending .emptyReturn) registers), origin⟩
      ⟨some (.macro (.continuationCheck registers.empty) registers), target⟩ := by
  let scriptStart : Configuration program dispatcher :=
    ⟨some (startScript .continuation registers), origin⟩
  have probeRun := SchedulerExecution.run_parentProbe program dispatcher
    (.pending .emptyReturn) registers origin .right rfl
  have probeCount := SchedulerExecution.runMutationCount_parentProbe program
    dispatcher (.pending .emptyReturn) registers origin .right rfl
  have probe : ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher
        (.pending .emptyReturn) origin)
      ⟨some (startProbe (.pending .emptyReturn) registers), origin⟩
      scriptStart := by
    refine ⟨?_, ?_⟩
    · simpa [scriptStart, pendingReject, SchedulerExecution.commandResult,
        SchedulerControl.probeAnswer] using probeRun
    · exact probeCount
  have scriptRun := SchedulerExecution.run_script program dispatcher
    .continuation registers origin target continuationRun
  have scriptCount := SchedulerExecution.runMutationCount_script program
    dispatcher .continuation registers origin target continuationRun
  have script : ZeroMutationRun (SchedulerControl.machine program dispatcher)
      ((SchedulerControl.jobScript program dispatcher .continuation).length + 1)
      scriptStart
      ⟨some (.macro (.continuationCheck registers.empty) registers), target⟩ := by
    refine ⟨?_, ?_⟩
    · simpa [scriptStart] using! scriptRun
    · simpa [scriptStart, SchedulerControl.jobScript, Script.rdxCount] using
        scriptCount
  simpa [scriptStart] using probe.trans script

def continuationCursor
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) : Cursor :=
  SchedulerResponse.markedContinuationCursor program dispatcher registers false
    bits continuation carrier parents

/-- The non-pending marked EMPTY result reaches its literal continuation with
`empty=true`. -/
theorem terminalContinuation_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame)
    (pendingReject : SchedulerControl.compiledProbeAnswer program dispatcher
      (.pending .emptyReturn)
      (markedCursor program dispatcher registers bits continuation carrier
        parents) = false) :
    ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher
          (.pending .emptyReturn)
          (markedCursor program dispatcher registers bits continuation carrier
            parents) +
        ((SchedulerControl.jobScript program dispatcher .continuation).length + 1))
      (markedPendingConfiguration program dispatcher registers bits continuation
        carrier parents)
      (SchedulerContinuation.checkConfiguration program dispatcher
        registers.advanceEmpty
        (continuationCursor program dispatcher registers bits continuation carrier
          parents)) := by
  have continuationRun := SchedulerResponse.run_markedContinuation program
    dispatcher registers false bits continuation carrier parents
  simpa [markedPendingConfiguration, continuationCursor, markedCursor,
    SchedulerContinuation.checkConfiguration] using
    failedPendingContinuation_zeroRun program dispatcher registers.advanceEmpty
      (markedCursor program dispatcher registers bits continuation carrier
        parents)
      (continuationCursor program dispatcher registers bits continuation carrier
        parents) pendingReject continuationRun

/-- A terminal arity-three EMPTY frame performs the response, marker, and
continuation contraction, then leaves empty mode for the next fuel phase. -/
theorem terminalArityThree_countedRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame)
    (pendingReject : SchedulerControl.compiledProbeAnswer program dispatcher
      (.pending .emptyReturn)
      (markedCursor program dispatcher registers bits continuation carrier
        parents) = false)
    (arity : continuation.headArity = 3) :
    ∃ ticks after,
      CountedRun (SchedulerControl.machine program dispatcher) ticks
        (LocalResponse.completedCost program
            (dispatcher.route (registers.phase, false))
            (registers.phase, false) + 2)
        (frameConfiguration program dispatcher registers bits continuation
          carrier parents)
        (SchedulerContinuation.fuelConfiguration program dispatcher after) := by
  have frameRun := frame_countedRun program dispatcher registers bits continuation
    carrier parents
  have handoff := terminalContinuation_zeroRun program dispatcher registers bits
    continuation carrier parents pendingReject
  let cursor := continuationCursor program dispatcher registers bits continuation
    carrier parents
  have cursorArity : cursor.focus.headArity = 3 := by
    simpa [cursor, continuationCursor,
      SchedulerResponse.markedContinuationCursor,
      SchedulerResponse.literalContinuationCursor] using arity
  obtain ⟨after, launch⟩ :=
    SchedulerContinuation.arityThreeLaunch_countedRun program dispatcher
      registers.advanceEmpty cursor cursorArity
  have combined := (frameRun.trans handoff.toCounted).trans launch
  exact ⟨_, after, by
    simpa [Nat.add_assoc] using combined⟩

/-- A terminal arity-four EMPTY frame performs exactly its response and marker
contractions, exposes the marked checkpoint, and enters clock growth. -/
theorem terminalArityFour_countedRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame)
    (pendingReject : SchedulerControl.compiledProbeAnswer program dispatcher
      (.pending .emptyReturn)
      (markedCursor program dispatcher registers bits continuation carrier
        parents) = false)
    (arity : continuation.headArity = 4) :
    ∃ ticks after,
      CountedRun (SchedulerControl.machine program dispatcher) ticks
        (LocalResponse.completedCost program
            (dispatcher.route (registers.phase, false))
            (registers.phase, false) + 1)
        (frameConfiguration program dispatcher registers bits continuation
          carrier parents)
        (SchedulerContinuation.clockGrowConfiguration program dispatcher after) := by
  have frameRun := frame_countedRun program dispatcher registers bits continuation
    carrier parents
  have handoff := terminalContinuation_zeroRun program dispatcher registers bits
    continuation carrier parents pendingReject
  let cursor := continuationCursor program dispatcher registers bits continuation
    carrier parents
  have cursorArity : cursor.focus.headArity = 4 := by
    simpa [cursor, continuationCursor,
      SchedulerResponse.markedContinuationCursor,
      SchedulerResponse.literalContinuationCursor] using arity
  obtain ⟨after, checkpoint⟩ :=
    SchedulerContinuation.arityFourCheckpoint_zeroRun program dispatcher
      registers.advanceEmpty cursor cursorArity
  exact ⟨_, after, (frameRun.trans handoff.toCounted).trans checkpoint.toCounted⟩

end SchedulerEmpty

end PureSFormal.PureS
