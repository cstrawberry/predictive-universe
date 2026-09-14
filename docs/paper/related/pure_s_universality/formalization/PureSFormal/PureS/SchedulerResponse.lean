import PureSFormal.PureS.SchedulerInvariant

/-!
# Exact FRAME/DISPATCH response execution

This module packages the already verified primitive Local-response script as
an exact segment of the finite scheduler.  It begins at a pending-frame root
in `FRAME/DISPATCH`, selects the fixed `(phase, bit)` leaf stored in finite
control, executes the frame, route, and appender contractions, returns to the
completed Local root, and enters `RETURN`.
-/

namespace PureSFormal.PureS

namespace SchedulerResponse

open FiniteController SchedulerControl SchedulerInvariant

abbrev Configuration (program : CTS.Program)
    (dispatcher : ActionDispatcher program) :=
  FiniteController.Configuration (SchedulerControl.Control program dispatcher)

/-- The exact pending-frame cursor at entry to `FRAME/DISPATCH`. -/
def frameCursor
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term)
    (parents : List ParentFrame) : Cursor :=
  ⟨frame
      (environmentCode (compileActions program dispatcher.tree) bits)
      continuation carrier,
    parents⟩

/-- A `FRAME/DISPATCH` entry whose finite bit register selects `bit`. -/
def frameConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    Configuration program dispatcher :=
  ⟨some (.macro (.family .frameDispatch) registers),
    frameCursor program dispatcher bits continuation carrier parents⟩

/-- The first PC of the fixed normal response selected by the registers. -/
def responseStartConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    Configuration program dispatcher :=
  ⟨some (startScript (.normalResponse (registers.phase, bit)) registers),
    frameCursor program dispatcher bits continuation carrier parents⟩

/-- Literal completed route installed by the selected normal response. -/
def completedRoute
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (carrier : Term) : Term :=
  PrimitiveLocalResponse.completedRoute program dispatcher.tree
    (dispatcher.route (registers.phase, bit)) (registers.phase, bit) carrier

/-- The exact completed Local cursor after the response script. -/
def completedCursor
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) : Cursor :=
  ⟨LocalResponse.completed bits continuation carrier
      (completedRoute program dispatcher registers bit carrier),
    parents⟩

/-- The response endpoint is the `RETURN` macro at the completed Local root. -/
def returnConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    Configuration program dispatcher :=
  ⟨some (.macro (.family .return) registers),
    completedCursor program dispatcher registers bit bits continuation carrier
      parents⟩

/-- The first PC of the optional registered halt-field marker. -/
def markStartConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    Configuration program dispatcher :=
  ⟨some (startScript .markNormal registers),
    completedCursor program dispatcher registers bit bits continuation carrier
      parents⟩

/-- The exact completed Local cursor after marking its registered halt field. -/
def markedCursor
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) : Cursor :=
  ⟨LocalResponse.markedCompleted bits continuation carrier
      (completedRoute program dispatcher registers bit carrier),
    parents⟩

/-- After (A6), `RETURN` begins the normal pending-parent probe with the
advanced phase. -/
def markedPendingConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    Configuration program dispatcher :=
  ⟨some (startProbe (.pending .normalReturn) registers.advance),
    markedCursor program dispatcher registers bit bits continuation carrier
      parents⟩

/-- If no marker is needed, `RETURN` begins the same pending-parent probe at
the fresh completed Local root. -/
def freshPendingConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    Configuration program dispatcher :=
  ⟨some (startProbe (.pending .normalReturn) registers.advance),
    completedCursor program dispatcher registers bit bits continuation carrier
      parents⟩

/-! ## Exact successful pending-parent handoff -/

/-- Function child of every diagonal pending frame used by this scheduler. -/
def pendingFunction
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation : Term) : Term :=
  .app (environmentCode (compileActions program dispatcher.tree) bits)
    continuation

/-- A child cursor at the registered right edge of its pending frame. -/
def pendingChildCursor
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation child : Term)
    (parents : List ParentFrame) : Cursor :=
  ⟨child, .right (pendingFunction program dispatcher bits continuation) ::
    parents⟩

/-- Start of the normal-return pending-parent probe at an arbitrary child. -/
def normalPendingProbeConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bits : List Bool)
    (continuation child : Term) (parents : List ParentFrame) :
    Configuration program dispatcher :=
  ⟨some (startProbe (.pending .normalReturn) registers),
    pendingChildCursor program dispatcher bits continuation child parents⟩

/-- Successful normal-return pending decision re-enters `DOWN` at the child. -/
def normalPendingDownConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bits : List Bool)
    (continuation child : Term) (parents : List ParentFrame) :
    Configuration program dispatcher :=
  ⟨some (.macro (.family .down) registers),
    pendingChildCursor program dispatcher bits continuation child parents⟩

/-- The shallow independent-hole guard accepts every exact pending parent. -/
theorem normalPending_answer
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation child : Term)
    (parents : List ParentFrame) :
    SchedulerControl.compiledProbeAnswer program dispatcher
      (.pending .normalReturn)
      (pendingChildCursor program dispatcher bits continuation child parents) =
        true := by
  rfl

/-- The complete successful parent probe restores the child occurrence and
enters the normal pending-decision macro. -/
theorem run_normalPendingProbe
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bits : List Bool)
    (continuation child : Term) (parents : List ParentFrame) :
    FiniteController.run (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher
        (.pending .normalReturn)
        (pendingChildCursor program dispatcher bits continuation child parents))
      (normalPendingProbeConfiguration program dispatcher registers bits
        continuation child parents) =
      ⟨some (.macro (.pendingDecision .normalReturn) registers),
        pendingChildCursor program dispatcher bits continuation child parents⟩ := by
  have run := SchedulerExecution.run_parentProbe program dispatcher
    (.pending .normalReturn) registers
    (pendingChildCursor program dispatcher bits continuation child parents)
    .right rfl
  simpa [normalPendingProbeConfiguration, normalPending_answer,
    SchedulerExecution.commandResult, SchedulerControl.probeAnswer] using run

/-- The successful parent probe performs no contraction. -/
theorem runMutationCount_normalPendingProbe
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bits : List Bool)
    (continuation child : Term) (parents : List ParentFrame) :
    FiniteController.runMutationCount
      (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher
        (.pending .normalReturn)
        (pendingChildCursor program dispatcher bits continuation child parents))
      (normalPendingProbeConfiguration program dispatcher registers bits
        continuation child parents) = 0 := by
  exact SchedulerExecution.runMutationCount_parentProbe program dispatcher
    (.pending .normalReturn) registers
    (pendingChildCursor program dispatcher bits continuation child parents)
    .right rfl

/-- Probe plus accepted decision is an exact mutation-free handoff to `DOWN`. -/
theorem normalPending_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bits : List Bool)
    (continuation child : Term) (parents : List ParentFrame) :
    ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher
        (.pending .normalReturn)
        (pendingChildCursor program dispatcher bits continuation child parents) + 1)
      (normalPendingProbeConfiguration program dispatcher registers bits
        continuation child parents)
      (normalPendingDownConfiguration program dispatcher registers bits
        continuation child parents) := by
  let decision : Configuration program dispatcher :=
    ⟨some (.macro (.pendingDecision .normalReturn) registers),
      pendingChildCursor program dispatcher bits continuation child parents⟩
  have probe : ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher
        (.pending .normalReturn)
        (pendingChildCursor program dispatcher bits continuation child parents))
      (normalPendingProbeConfiguration program dispatcher registers bits
        continuation child parents) decision :=
    ⟨run_normalPendingProbe program dispatcher registers bits continuation
        child parents,
      runMutationCount_normalPendingProbe program dispatcher registers bits
        continuation child parents⟩
  have decide : ZeroMutationRun (SchedulerControl.machine program dispatcher) 1
      decision
      (normalPendingDownConfiguration program dispatcher registers bits
        continuation child parents) := by
    refine ⟨rfl, ?_⟩
    rfl
  simpa [decision] using probe.trans decide

/-! ## Failed pending guard and literal continuation handoff -/

/-- A failed normal-return pending guard followed by the fixed `R L` script
reaches the supplied exact continuation cursor without a contraction. -/
theorem failedPendingContinuation_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (origin target : Cursor)
    (pendingReject : SchedulerControl.compiledProbeAnswer program dispatcher
      (.pending .normalReturn) origin = false)
    (continuationRun : Script.run
      (SchedulerControl.jobScript program dispatcher .continuation) origin =
        some target) :
    ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher
          (.pending .normalReturn) origin +
        ((SchedulerControl.jobScript program dispatcher .continuation).length + 1))
      ⟨some (startProbe (.pending .normalReturn) registers), origin⟩
      ⟨some (.macro (.continuationCheck registers.empty) registers), target⟩ := by
  let scriptStart : Configuration program dispatcher :=
    ⟨some (startScript .continuation registers), origin⟩
  have probeRun := SchedulerExecution.run_parentProbe program dispatcher
    (.pending .normalReturn) registers origin .right rfl
  have probeCount := SchedulerExecution.runMutationCount_parentProbe program
    dispatcher (.pending .normalReturn) registers origin .right rfl
  have probe : ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher
        (.pending .normalReturn) origin)
      ⟨some (startProbe (.pending .normalReturn) registers), origin⟩
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

/-- Left child retained while `R L` descends from an active Local root to its
literal continuation. -/
def localContinuationLeft
    (bits : List Bool) (haltField dispatcher seedAudit : Term) : Term :=
  .app (.app haltField dispatcher) (.app (seedCode bits) seedAudit)

/-- Exact zipper reached at the literal `RL` continuation of an active shell. -/
def literalContinuationCursor
    (bits : List Bool) (continuation haltField dispatcher seedAudit
      continuationAudit : Term) (parents : List ParentFrame) : Cursor :=
  ⟨continuation,
    .left continuationAudit ::
      .right (localContinuationLeft bits haltField dispatcher seedAudit) ::
      parents⟩

def freshContinuationCursor
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) : Cursor :=
  literalContinuationCursor bits continuation (freshHField carrier)
    (completedRoute program dispatcher registers bit carrier) carrier carrier
    parents

def markedContinuationCursor
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) : Cursor :=
  literalContinuationCursor bits continuation
    (Carrier.markedHField carrier carrier)
    (completedRoute program dispatcher registers bit carrier) carrier carrier
    parents

/-- The literal `R L` continuation script is exact for the fresh completed
Local endpoint. -/
theorem run_freshContinuation
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    Script.run (SchedulerControl.jobScript program dispatcher .continuation)
      (completedCursor program dispatcher registers bit bits continuation
        carrier parents) =
      some (freshContinuationCursor program dispatcher registers bit bits
        continuation carrier parents) := by
  simp [SchedulerControl.jobScript, completedCursor,
    freshContinuationCursor, literalContinuationCursor,
    localContinuationLeft, LocalResponse.completed, Carrier.activeShell,
    Carrier.shell, Script.run, Primitive.exec]

/-- The same literal `R L` continuation script is exact after marking. -/
theorem run_markedContinuation
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    Script.run (SchedulerControl.jobScript program dispatcher .continuation)
      (markedCursor program dispatcher registers bit bits continuation carrier
        parents) =
      some (markedContinuationCursor program dispatcher registers bit bits
        continuation carrier parents) := by
  simp [SchedulerControl.jobScript, markedCursor,
    markedContinuationCursor, literalContinuationCursor,
    localContinuationLeft, LocalResponse.markedCompleted, Carrier.activeShell,
    Carrier.shell, Script.run, Primitive.exec]

/-- A non-pending fresh completed Local reaches its exact literal continuation
with advanced registers and no mutation. -/
theorem freshTerminalContinuation_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame)
    (pendingReject : SchedulerControl.compiledProbeAnswer program dispatcher
      (.pending .normalReturn)
      (completedCursor program dispatcher registers bit bits continuation
        carrier parents) = false) :
    ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher
          (.pending .normalReturn)
          (completedCursor program dispatcher registers bit bits continuation
            carrier parents) +
        ((SchedulerControl.jobScript program dispatcher .continuation).length + 1))
      (freshPendingConfiguration program dispatcher registers bit bits
        continuation carrier parents)
      ⟨some (.macro (.continuationCheck false) registers.advance),
        freshContinuationCursor program dispatcher registers bit bits
          continuation carrier parents⟩ := by
  simpa [freshPendingConfiguration] using!
    failedPendingContinuation_zeroRun program dispatcher registers.advance
      (completedCursor program dispatcher registers bit bits continuation carrier
        parents)
      (freshContinuationCursor program dispatcher registers bit bits continuation
        carrier parents)
      pendingReject
      (run_freshContinuation program dispatcher registers bit bits continuation
        carrier parents)

/-- A non-pending marked completed Local reaches the same literal continuation
interface, again without mutation. -/
theorem markedTerminalContinuation_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame)
    (pendingReject : SchedulerControl.compiledProbeAnswer program dispatcher
      (.pending .normalReturn)
      (markedCursor program dispatcher registers bit bits continuation carrier
        parents) = false) :
    ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher
          (.pending .normalReturn)
          (markedCursor program dispatcher registers bit bits continuation
            carrier parents) +
        ((SchedulerControl.jobScript program dispatcher .continuation).length + 1))
      (markedPendingConfiguration program dispatcher registers bit bits
        continuation carrier parents)
      ⟨some (.macro (.continuationCheck false) registers.advance),
        markedContinuationCursor program dispatcher registers bit bits
          continuation carrier parents⟩ := by
  simpa [markedPendingConfiguration] using!
    failedPendingContinuation_zeroRun program dispatcher registers.advance
      (markedCursor program dispatcher registers bit bits continuation carrier
        parents)
      (markedContinuationCursor program dispatcher registers bit bits continuation
        carrier parents)
      pendingReject
      (run_markedContinuation program dispatcher registers bit bits continuation
        carrier parents)

/-! ## Exact audit provenance of the completed response -/

/-- Rebuilding a fixed valid route with one response installs the same snapshot
in every route audit field. -/
theorem withResponse_snapshotRoute
    {Label : Type} {encode : Label → Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    (path : Dispatcher.HasRoute tree route label)
    (snapshot response : Term) :
    ReachableAudit.SnapshotRoute encode snapshot tree route label response
      (PrimitiveRoute.withResponse encode tree route snapshot response) := by
  induction path with
  | leaf label => exact .leaf label response
  | left path ih => exact .left ih
  | right path ih => exact .right ih

/-- The concrete primitive response carries the strong exact-snapshot
dispatcher provenance required by the reachable audit. -/
theorem completedRoute_snapshotDispatch
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (carrier : Term) :
    ReachableAudit.SnapshotDispatchAt program dispatcher.tree carrier
      (dispatcher.route (registers.phase, bit)) (registers.phase, bit)
      (actionAccumulator program (registers.phase, bit) carrier)
      (completedRoute program dispatcher registers bit carrier) := by
  refine ⟨?_⟩
  simpa [completedRoute, PrimitiveLocalResponse.completedRoute,
    ReachableAudit.actionResponse_initial] using
    withResponse_snapshotRoute
      (dispatcher.route_valid (registers.phase, bit)) carrier
      (actionResult program (registers.phase, bit) carrier)

/-- Executing the response around a recursively audited snapshot preserves the
strong whole-carrier invariant at the exact primitive endpoint. -/
theorem completed_holds
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term)
    (snapshotInv : ReachableAudit.Holds program dispatcher.tree bits
      continuation carrier) :
    ReachableAudit.Holds program dispatcher.tree bits continuation
      (LocalResponse.completed bits continuation carrier
        (completedRoute program dispatcher registers bit carrier)) := by
  let label : ActionLabel program := (registers.phase, bit)
  let route := dispatcher.route label
  let routeTerm := completedRoute program dispatcher registers bit carrier
  let layer : ReachableAudit.Layer program dispatcher.tree bits continuation
      carrier (actionAccumulator program label carrier)
      (LocalResponse.completed bits continuation carrier routeTerm)
      .fresh route label routeTerm :=
    { dispatch := completedRoute_snapshotDispatch program dispatcher registers
        bit carrier
      result_eq := rfl }
  exact .local snapshotInv snapshotInv
    (ReachableAudit.actionAccumulator_segment program label carrier) layer

/-- Marking the exact completed response changes only its registered halt
field and preserves the same strong route/action provenance. -/
theorem marked_holds
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term)
    (snapshotInv : ReachableAudit.Holds program dispatcher.tree bits
      continuation carrier) :
    ReachableAudit.Holds program dispatcher.tree bits continuation
      (LocalResponse.markedCompleted bits continuation carrier
        (completedRoute program dispatcher registers bit carrier)) := by
  let label : ActionLabel program := (registers.phase, bit)
  let route := dispatcher.route label
  let routeTerm := completedRoute program dispatcher registers bit carrier
  let layer : ReachableAudit.Layer program dispatcher.tree bits continuation
      carrier (actionAccumulator program label carrier)
      (LocalResponse.markedCompleted bits continuation carrier routeTerm)
      .marked route label routeTerm :=
    { dispatch := completedRoute_snapshotDispatch program dispatcher registers
        bit carrier
      result_eq := rfl }
  exact .local snapshotInv snapshotInv
    (ReachableAudit.actionAccumulator_segment program label carrier) layer

/-- The erased `RETURN` endpoint contains the newly completed strong-audit
carrier at the exact outer zipper context. -/
theorem return_auditedOccurrence
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame)
    (snapshotInv : ReachableAudit.Holds program dispatcher.tree bits
      continuation carrier) :
    AuditedOccurrence program dispatcher.tree
      (returnConfiguration program dispatcher registers bit bits continuation
        carrier parents).cursor.erase := by
  let result := LocalResponse.completed bits continuation carrier
    (completedRoute program dispatcher registers bit carrier)
  refine .intro bits continuation result
    (SchedulerInvariant.contextOfParents parents)
    (completed_holds program dispatcher registers bit bits continuation carrier
      snapshotInv) ?_
  change Cursor.rebuild parents result =
    (SchedulerInvariant.contextOfParents parents).plug result
  exact (SchedulerInvariant.contextOfParents_plug parents result).symm

/-- The `FRAME/DISPATCH` source still contains the audited snapshot as the
right child of its pending frame. -/
theorem frame_auditedOccurrence
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame)
    (snapshotInv : ReachableAudit.Holds program dispatcher.tree bits
      continuation carrier) :
    AuditedOccurrence program dispatcher.tree
      (frameConfiguration program dispatcher registers bits continuation
        carrier parents).cursor.erase := by
  let function : Term := .app
    (environmentCode (compileActions program dispatcher.tree) bits) continuation
  refine .intro bits continuation carrier
    (SchedulerInvariant.contextOfParents (.right function :: parents))
    snapshotInv ?_
  change Cursor.rebuild parents (.app function carrier) =
    (SchedulerInvariant.contextOfParents (.right function :: parents)).plug
      carrier
  exact (SchedulerInvariant.contextOfParents_plug
    (.right function :: parents) carrier).symm

/-- A semantically classified `FRAME/DISPATCH` source is a genuine instance of
the simultaneous scheduler invariant. -/
theorem frame_holds
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame)
    {phase : CTS.Phase program} {scanned : List Bool} {emptyMode : Bool}
    (bit_eq : registers.bit = some bit)
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    (snapshotInv : ReachableAudit.Holds program dispatcher.tree bits
      continuation carrier)
    (silent : SilentEvidence program dispatcher.tree .frameDispatch
      (frameConfiguration program dispatcher registers bits continuation
        carrier parents).cursor.erase) :
    Holds program dispatcher
      (frameConfiguration program dispatcher registers bits continuation
        carrier parents) := by
  let focus := frame
    (environmentCode (compileActions program dispatcher.tree) bits)
    continuation carrier
  exact .intro (.macro (.family .frameDispatch) registers) rfl
    phase scanned emptyMode coherent
    (.macro
      (SchedulerInvariant.cursorAtContextOfParents focus parents)
      (by
        unfold CommandSafe
        simp [SchedulerControl.transition, bit_eq]))
    (.frameDispatch (.silent silent)
      (frame_auditedOccurrence program dispatcher registers bits continuation
        carrier parents snapshotInv))

/-- A semantically classified completed `RETURN` endpoint is another genuine
instance of the simultaneous scheduler invariant. -/
theorem return_holds
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame)
    {phase : CTS.Phase program} {scanned : List Bool} {emptyMode : Bool}
    (bit_eq : registers.bit = some bit)
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    (snapshotInv : ReachableAudit.Holds program dispatcher.tree bits
      continuation carrier)
    (silent : SilentEvidence program dispatcher.tree .return
      (returnConfiguration program dispatcher registers bit bits continuation
        carrier parents).cursor.erase) :
    Holds program dispatcher
      (returnConfiguration program dispatcher registers bit bits continuation
        carrier parents) := by
  let focus := LocalResponse.completed bits continuation carrier
    (completedRoute program dispatcher registers bit carrier)
  exact .intro (.macro (.family .return) registers) rfl
    phase scanned emptyMode coherent
    (.macro
      (SchedulerInvariant.cursorAtContextOfParents focus parents)
      (by
        unfold CommandSafe
        by_cases output_eq :
          SchedulerControl.outputEmpty program registers bit = true
        · simp [SchedulerControl.transition, bit_eq, output_eq]
        · simp [SchedulerControl.transition, bit_eq, output_eq]))
    (.return (.silent silent)
      (return_auditedOccurrence program dispatcher registers bit bits
        continuation carrier parents snapshotInv))

/-! ## Optional halt-field marking -/

/-- If formula (14a) is true, `RETURN` enters the fixed marker script. -/
theorem step_returnMark
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame)
    (bit_eq : registers.bit = some bit)
    (output_eq : SchedulerControl.outputEmpty program registers bit = true) :
    FiniteController.step (SchedulerControl.machine program dispatcher)
      (returnConfiguration program dispatcher registers bit bits continuation
        carrier parents) =
      markStartConfiguration program dispatcher registers bit bits continuation
        carrier parents := by
  unfold returnConfiguration markStartConfiguration
  unfold FiniteController.step SchedulerControl.machine
  simp [SchedulerControl.transition, bit_eq, output_eq]

/-- The literal (A6) script marks the completed Local and restores its root. -/
theorem run_markCompleted
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    Script.run (SchedulerControl.jobScript program dispatcher .markNormal)
      (completedCursor program dispatcher registers bit bits continuation
        carrier parents) =
      some (markedCursor program dispatcher registers bit bits continuation
        carrier parents) := by
  rfl

/-- Exact execution and contraction count of the optional marker script. -/
theorem mark_countedRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    CountedRun (SchedulerControl.machine program dispatcher)
      ((SchedulerControl.jobScript program dispatcher .markNormal).length + 1)
      1
      (markStartConfiguration program dispatcher registers bit bits continuation
        carrier parents)
      (markedPendingConfiguration program dispatcher registers bit bits
        continuation carrier parents) := by
  let before := completedCursor program dispatcher registers bit bits
    continuation carrier parents
  let after := markedCursor program dispatcher registers bit bits continuation
    carrier parents
  have executes : Script.run
      (SchedulerControl.jobScript program dispatcher .markNormal) before =
      some after := run_markCompleted program dispatcher registers bit bits
        continuation carrier parents
  refine ⟨?_, ?_⟩
  · simpa [markStartConfiguration, markedPendingConfiguration, before, after]
      using! SchedulerExecution.run_script program dispatcher .markNormal
        registers before after executes
  · have counted := SchedulerExecution.runMutationCount_script program
      dispatcher .markNormal registers before after executes
    simpa [markStartConfiguration, before, SchedulerControl.jobScript,
      PrimitiveScripts.mark, Script.rdxCount] using counted

/-- Whole true-(14a) branch from `RETURN` through the marked pending probe
source. -/
theorem returnMark_countedRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame)
    (bit_eq : registers.bit = some bit)
    (output_eq : SchedulerControl.outputEmpty program registers bit = true) :
    CountedRun (SchedulerControl.machine program dispatcher)
      (1 + ((SchedulerControl.jobScript program dispatcher .markNormal).length + 1))
      1
      (returnConfiguration program dispatcher registers bit bits continuation
        carrier parents)
      (markedPendingConfiguration program dispatcher registers bit bits
        continuation carrier parents) := by
  let start := markStartConfiguration program dispatcher registers bit bits
    continuation carrier parents
  have enter : ZeroMutationRun (SchedulerControl.machine program dispatcher) 1
      (returnConfiguration program dispatcher registers bit bits continuation
        carrier parents) start := by
    refine ⟨?_, ?_⟩
    · simpa [FiniteController.run, start] using
        step_returnMark program dispatcher registers bit bits continuation
          carrier parents bit_eq output_eq
    · unfold FiniteController.runMutationCount
      unfold FiniteController.mutationCount SchedulerControl.machine
      simp [returnConfiguration, SchedulerControl.transition, bit_eq, output_eq,
        FiniteController.runMutationCount]
  have marked := mark_countedRun program dispatcher registers bit bits
    continuation carrier parents
  simpa [start] using enter.toCounted.trans marked

/-- If formula (14a) is false, `RETURN` enters the pending-parent probe
without mutating the completed Local. -/
theorem step_returnNoMark
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame)
    (bit_eq : registers.bit = some bit)
    (output_eq : SchedulerControl.outputEmpty program registers bit = false) :
    FiniteController.step (SchedulerControl.machine program dispatcher)
      (returnConfiguration program dispatcher registers bit bits continuation
        carrier parents) =
      freshPendingConfiguration program dispatcher registers bit bits
        continuation carrier parents := by
  unfold returnConfiguration freshPendingConfiguration
  unfold FiniteController.step SchedulerControl.machine
  simp [SchedulerControl.transition, bit_eq, output_eq]

/-- The false-(14a) handoff is exactly one cursor-only controller row. -/
theorem returnNoMark_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame)
    (bit_eq : registers.bit = some bit)
    (output_eq : SchedulerControl.outputEmpty program registers bit = false) :
    ZeroMutationRun (SchedulerControl.machine program dispatcher) 1
      (returnConfiguration program dispatcher registers bit bits continuation
        carrier parents)
      (freshPendingConfiguration program dispatcher registers bit bits
        continuation carrier parents) := by
  refine ⟨?_, ?_⟩
  · simpa [FiniteController.run] using
      step_returnNoMark program dispatcher registers bit bits continuation
        carrier parents bit_eq output_eq
  · unfold FiniteController.runMutationCount
    unfold FiniteController.mutationCount SchedulerControl.machine
    simp [returnConfiguration, SchedulerControl.transition, bit_eq, output_eq,
      FiniteController.runMutationCount]

/-! ## Returning into an enclosing pending frame -/

/-- Fresh completed Local at a registered pending edge, ready for `RETURN`. -/
def nestedReturnConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    Configuration program dispatcher :=
  returnConfiguration program dispatcher registers bit bits continuation carrier
    (.right (pendingFunction program dispatcher bits continuation) :: parents)

/-- Fresh output re-enters `DOWN` at the completed Local under its pending
parent, with phase advanced and transient registers cleared. -/
def freshNestedDownConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    Configuration program dispatcher :=
  normalPendingDownConfiguration program dispatcher registers.advance bits
    continuation
    (LocalResponse.completed bits continuation carrier
      (completedRoute program dispatcher registers bit carrier)) parents

/-- Marked empty output re-enters the same `DOWN` traversal at its completed
Local. -/
def markedNestedDownConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    Configuration program dispatcher :=
  normalPendingDownConfiguration program dispatcher registers.advance bits
    continuation
    (LocalResponse.markedCompleted bits continuation carrier
      (completedRoute program dispatcher registers bit carrier)) parents

/-- False-(14a) normal return through a successful enclosing pending guard. -/
theorem returnNoMark_pending_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame)
    (bit_eq : registers.bit = some bit)
    (output_eq : SchedulerControl.outputEmpty program registers bit = false) :
    ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (1 +
        (SchedulerControl.compiledProbeCost program dispatcher
          (.pending .normalReturn)
          (pendingChildCursor program dispatcher bits continuation
            (LocalResponse.completed bits continuation carrier
              (completedRoute program dispatcher registers bit carrier))
            parents) + 1))
      (nestedReturnConfiguration program dispatcher registers bit bits
        continuation carrier parents)
      (freshNestedDownConfiguration program dispatcher registers bit bits
        continuation carrier parents) := by
  have enter := returnNoMark_zeroRun program dispatcher registers bit bits
    continuation carrier
    (.right (pendingFunction program dispatcher bits continuation) :: parents)
    bit_eq output_eq
  have pending := normalPending_zeroRun program dispatcher registers.advance bits
    continuation
    (LocalResponse.completed bits continuation carrier
      (completedRoute program dispatcher registers bit carrier)) parents
  simpa [nestedReturnConfiguration, freshNestedDownConfiguration,
    freshPendingConfiguration, completedCursor, pendingChildCursor,
    pendingFunction] using enter.trans pending

/-- True-(14a) normal return marks once and then traverses the same successful
enclosing pending guard. -/
theorem returnMark_pending_countedRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame)
    (bit_eq : registers.bit = some bit)
    (output_eq : SchedulerControl.outputEmpty program registers bit = true) :
    CountedRun (SchedulerControl.machine program dispatcher)
      ((1 + ((SchedulerControl.jobScript program dispatcher .markNormal).length + 1)) +
        (SchedulerControl.compiledProbeCost program dispatcher
          (.pending .normalReturn)
          (pendingChildCursor program dispatcher bits continuation
            (LocalResponse.markedCompleted bits continuation carrier
              (completedRoute program dispatcher registers bit carrier))
            parents) + 1))
      1
      (nestedReturnConfiguration program dispatcher registers bit bits
        continuation carrier parents)
      (markedNestedDownConfiguration program dispatcher registers bit bits
        continuation carrier parents) := by
  have marked := returnMark_countedRun program dispatcher registers bit bits
    continuation carrier
    (.right (pendingFunction program dispatcher bits continuation) :: parents)
    bit_eq output_eq
  have pending := normalPending_zeroRun program dispatcher registers.advance bits
    continuation
    (LocalResponse.markedCompleted bits continuation carrier
      (completedRoute program dispatcher registers bit carrier)) parents
  have combined := marked.trans pending.toCounted
  simpa [nestedReturnConfiguration, markedNestedDownConfiguration,
    markedPendingConfiguration, markedCursor, pendingChildCursor,
    pendingFunction] using combined

/-- `FRAME/DISPATCH` enters precisely the script selected by its bit register. -/
theorem step_frameDispatch
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame)
    (bit_eq : registers.bit = some bit) :
    FiniteController.step (SchedulerControl.machine program dispatcher)
        (frameConfiguration program dispatcher registers bits continuation
          carrier parents) =
      responseStartConfiguration program dispatcher registers bit bits
        continuation carrier parents := by
  unfold frameConfiguration responseStartConfiguration
  unfold FiniteController.step SchedulerControl.machine
  simp only [FiniteController.Configuration.control,
    FiniteController.Configuration.cursor]
  simp [SchedulerControl.transition, bit_eq]

/-- Entering the response script is cursor-only and mutation-free. -/
theorem enterResponse_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame)
    (bit_eq : registers.bit = some bit) :
    ZeroMutationRun (SchedulerControl.machine program dispatcher) 1
      (frameConfiguration program dispatcher registers bits continuation
        carrier parents)
      (responseStartConfiguration program dispatcher registers bit bits
        continuation carrier parents) := by
  refine ⟨?_, ?_⟩
  · simpa [FiniteController.run] using
      step_frameDispatch program dispatcher registers bit bits continuation
        carrier parents bit_eq
  · unfold FiniteController.runMutationCount
    unfold FiniteController.mutationCount SchedulerControl.machine
    simp only [frameConfiguration, FiniteController.Configuration.control,
      FiniteController.Configuration.cursor]
    simp [SchedulerControl.transition, bit_eq,
      FiniteController.runMutationCount]

/-- Exact controller execution of the selected Local-response script. -/
theorem response_countedRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    CountedRun (SchedulerControl.machine program dispatcher)
      ((SchedulerControl.jobScript program dispatcher
        (.normalResponse (registers.phase, bit))).length + 1)
      (LocalResponse.completedCost program
        (dispatcher.route (registers.phase, bit)) (registers.phase, bit))
      (responseStartConfiguration program dispatcher registers bit bits
        continuation carrier parents)
      (returnConfiguration program dispatcher registers bit bits continuation
        carrier parents) := by
  let before := frameCursor program dispatcher bits continuation carrier parents
  let after := completedCursor program dispatcher registers bit bits continuation
    carrier parents
  have executes : Script.run
      (SchedulerControl.jobScript program dispatcher
        (.normalResponse (registers.phase, bit))) before = some after := by
    exact SchedulerControl.run_normalResponse program dispatcher
      (registers.phase, bit) bits continuation carrier parents
  refine ⟨?_, ?_⟩
  · simpa [responseStartConfiguration, returnConfiguration, before, after]
      using! SchedulerExecution.run_script program dispatcher
        (.normalResponse (registers.phase, bit)) registers before after executes
  · have counted := SchedulerExecution.runMutationCount_script program
      dispatcher (.normalResponse (registers.phase, bit)) registers before after
      executes
    simpa [responseStartConfiguration, before,
      SchedulerControl.jobScript_normalResponse,
      PrimitiveLocalResponse.execute_rdxCount] using counted

/-- Whole `FRAME/DISPATCH` execution, including its epsilon entry row. -/
theorem frameResponse_countedRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame)
    (bit_eq : registers.bit = some bit) :
    CountedRun (SchedulerControl.machine program dispatcher)
      (1 + ((SchedulerControl.jobScript program dispatcher
        (.normalResponse (registers.phase, bit))).length + 1))
      (LocalResponse.completedCost program
        (dispatcher.route (registers.phase, bit)) (registers.phase, bit))
      (frameConfiguration program dispatcher registers bits continuation
        carrier parents)
      (returnConfiguration program dispatcher registers bit bits continuation
        carrier parents) := by
  have entered := (enterResponse_zeroRun program dispatcher registers bit bits
    continuation carrier parents bit_eq).toCounted
  have response := response_countedRun program dispatcher registers bit bits
    continuation carrier parents
  simpa using entered.trans response

end SchedulerResponse

end PureSFormal.PureS
