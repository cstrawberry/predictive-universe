import PureSFormal.Research.RootResetEmptyTerminalResponse

/-!
# Selecting the clock continuation after terminal EMPTY marking

Every generated residual clock exit has one exact selected contraction.  A
completed marked history preserves that contraction and its full context.
-/

namespace PureSFormal.Research.RootResetEmptyContinuationSelector

open PureSFormal.PureS
open SchedulerInvariant
open RootResetPersistentResponseSelector
open RootResetReachableStageGrammar
open RootResetClockFuelStages
open RootResetClockFuelCanonicalGrammar
open RootResetPersistentClockFuelAgreement
open RootResetWrappedFrameSelectorProof
open RootResetMarkedFrameSelectorProof
open RootResetEmptyHandoffContext
open RootResetEmptyPostMarkerHandoff

def exitAddress : Nat → Address
  | 0 => [.left]
  | _ + 1 => []

def exitTarget (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (horizon : Nat) (bits : List Bool) : Nat → Term
  | 0 => .app (clockGrowthCore (horizon + 1) 1 horizon)
      (environmentCode (compileActions program dispatcher.tree) bits)
  | remaining + 1 => Dovetail.jobSource horizon remaining
      (environmentCode (compileActions program dispatcher.tree) bits)

theorem exit_contracts (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (horizon remaining : Nat) (bits : List Bool) :
    (exitTerm program dispatcher horizon remaining bits).contractAt? (exitAddress remaining) =
      some (exitTarget program dispatcher horizon bits remaining) := by
  cases remaining <;> rfl

theorem peelMarked_exit (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (horizon remaining : Nat) (bits : List Bool) :
    peelMarked program dispatcher.tree (exitTerm program dispatcher horizon remaining bits) =
      ⟨exitTerm program dispatcher horizon remaining bits, .hole, []⟩ := by
  rw [peelMarked, parseMarkedLocal?, exit_local_none]

theorem dispatcher_active_exit_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (horizon remaining : Nat) (bits : List Bool) :
    RootResetWholeDispatcherStages.parseActive? program dispatcher []
      (exitTerm program dispatcher horizon remaining bits) = none := by
  cases parsed : RootResetWholeDispatcherStages.parseActive? program dispatcher []
      (exitTerm program dispatcher horizon remaining bits) with
  | none => rfl
  | some view =>
      cases RootResetWholeDispatcherStages.parseActive?_sound parsed with
      | intro haltField dispatcherTerm seedAudit continuationAudit halt phaseEq frontBitEq routeEq routeShape sourceEq =>
          cases halt with
          | fresh haltAudit =>
              apply False.elim
              apply exit_not_six program dispatcher horizon remaining bits
              rw [sourceEq]
              rfl

theorem appender_active_exit_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (horizon remaining : Nat) (bits : List Bool) :
    RootResetWholeAppenderStages.parseActive? program dispatcher.tree
      (exitTerm program dispatcher horizon remaining bits) = none := by
  cases parsed : RootResetWholeAppenderStages.parseActive? program dispatcher.tree
      (exitTerm program dispatcher horizon remaining bits) with
  | none => rfl
  | some view =>
      rcases (RootResetWholeAppenderStages.parseActive?_sound parsed).source_eq with
        ⟨haltField, dispatcherTerm, seedAudit, continuationAudit, halt, route, sourceEq⟩
      cases halt with
      | fresh haltAudit =>
          apply False.elim
          apply exit_not_six program dispatcher horizon remaining bits
          rw [sourceEq]
          rfl

def exitRegisteredView (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (horizon remaining : Nat) (bits : List Bool) : RootResetTwentySevenStageRegistry.View program :=
  .registered (.clockFuel ⟨exitTerm program dispatcher horizon remaining bits, .hole, [],
    .clock (exitView program dispatcher horizon bits remaining)⟩)

theorem exit_registry_exact
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (horizon remaining : Nat) (bits : List Bool) (bound : remaining ≤ horizon) :
    RootResetTwentySevenStageRegistry.parse? program dispatcher
      (exitTerm program dispatcher horizon remaining bits) =
      some (exitRegisteredView program dispatcher horizon remaining bits) := by
  have dispatcherNone : RootResetWholeDispatcherStages.parse? program dispatcher
      (exitTerm program dispatcher horizon remaining bits) = none := by
    rw [RootResetWholeDispatcherStages.parse?, peelMarked_exit, dispatcher_active_exit_none]
  have appenderNone : RootResetWholeAppenderStages.parse? program dispatcher.tree
      (exitTerm program dispatcher horizon remaining bits) = none := by
    rw [RootResetWholeAppenderStages.parse?, peelMarked_exit, appender_active_exit_none]
  have responseNone : RootResetResponseBoundaryStages.parse? program dispatcher.tree
      (exitTerm program dispatcher horizon remaining bits) = none := by
    rw [RootResetResponseBoundaryStages.parse?, peelMarked_exit]
    simp only [RootResetResponseBoundaryStages.parseCleanMarkedHistory?,
      RootResetResponseBoundaryStages.parseActive?, exit_local_none]
  have clock : RootResetCompositeStageRegistry.parseClockFuel? program dispatcher.tree
      (exitTerm program dispatcher horizon remaining bits) =
      some ⟨exitTerm program dispatcher horizon remaining bits, .hole, [],
        .clock (exitView program dispatcher horizon bits remaining)⟩ := by
    apply RootResetCompositeStageRegistry.parseClockFuel?_complete
    refine ⟨.here ?_, .clock _ _ (exitTerm_eq_view program dispatcher horizon remaining bits)
      (exitView_canonical program dispatcher horizon remaining bits bound)⟩
    rw [parseMarkedLocal?, exit_local_none]
  rw [RootResetTwentySevenStageRegistry.parse?, RootResetCompositeStageRegistry.parse?,
    dispatcherNone, appenderNone, responseNone, clock]
  rfl

theorem exit_route_selects (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (horizon remaining : Nat) (bits : List Bool) (bound : remaining ≤ horizon) :
    RouteA.Selects program dispatcher (exitTerm program dispatcher horizon remaining bits)
      (exitTarget program dispatcher horizon bits remaining) (exitAddress remaining) := by
  apply RouteA.selects_of_root (exit_next_none program dispatcher horizon remaining bits)
    (exit_registry_exact program dispatcher horizon remaining bits bound)
  · cases remaining <;> rfl
  · exact exit_contracts program dispatcher horizon remaining bits

theorem exit_not_two (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (horizon remaining : Nat) (bits : List Bool) :
    (exitTerm program dispatcher horizon remaining bits).headArity ≠ 2 := by
  cases remaining with
  | zero =>
      change (clockFirstTerm program dispatcher horizon bits).headArity ≠ 2
      rw [RootResetResponseClockFuelAgreement.clockFirstTerm_headArity]
      decide
  | succ remaining =>
      change 3 ≠ 2
      decide

/-- Every completed marked history preserves the exact generated clock
selection, including its launch and next-stage growth alternatives. -/
theorem selectStep?_markedPrefix_exit
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (horizon remaining : Nat) (bits : List Bool) (bound : remaining ≤ horizon)
    {whole : Term} {context : Context} {history : List (CheckpointDecoder.LocalView program)}
    (shape : MarkedPrefix program dispatcher.tree whole
      (exitTerm program dispatcher horizon remaining bits) context history) :
    selectStep? program dispatcher whole =
      some (context.plug (exitTarget program dispatcher horizon bits remaining)) := by
  let term := exitTerm program dispatcher horizon remaining bits
  let outer := prependMarked context history ⟨term, .hole, [], [], []⟩
  have localContexts := exit_contexts program dispatcher horizon remaining bits bound
  have activeEq : RootResetPersistentRouteA.activeContext program dispatcher whole = outer := by
    rw [activeContext_markedPrefix shape, localContexts.1]
  have fuelEq : RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher whole = outer := by
    rw [fuelActiveContext_markedPrefix shape, localContexts.2.1]
  have outerEq : responseOuter program dispatcher whole = outer := by
    rw [responseOuter_markedPrefix shape, localContexts.2.2]
  have selected := exit_route_selects program dispatcher horizon remaining bits bound
  have result := selectStep?_of_recoveredOuter program dispatcher whole _ outer outerEq activeEq fuelEq
    (exit_next_none program dispatcher horizon remaining bits)
    (exit_fuel_none program dispatcher horizon remaining bits bound)
    (exit_local_none program dispatcher horizon remaining bits)
    (exit_not_six program dispatcher horizon remaining bits)
    (exit_not_two program dispatcher horizon remaining bits)
    (noFresh_marked_pending history.length 0) (noPendingMarked_marked_pending history.length 0)
    (exitAddress remaining) selected.1 selected.2
  simpa only [outer, prependMarked, RootResetRuntimeContextBridge.context_comp_hole] using result

/-- A new marked continuation chain can be inserted into an existing marked
context.  The history is rebuilt with its exact new continuation fields. -/
theorem markedPrefix_graft
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {whole active replacement endpoint : Term} {context innerContext : Context}
    {history innerHistory : List (CheckpointDecoder.LocalView program)}
    (shape : MarkedPrefix program tree whole active context history)
    (replacementShape : MarkedPrefix program tree replacement endpoint innerContext innerHistory) :
    ∃ targetHistory, MarkedPrefix program tree (context.plug replacement) endpoint
      (context.comp innerContext) targetHistory := by
  induction shape with
  | here oldStop => exact ⟨_, replacementShape⟩
  | @«local» source oldActive outerContext view history boundary marked inner ih =>
      obtain ⟨targetHistory, targetPrefix⟩ := ih
      let innerTarget := outerContext.plug replacement
      let targetView := RootResetResponseBoundaryStages.replaceContinuation view innerTarget
      let targetSource := (localContinuationContext source).plug innerTarget
      have targetShape : CheckpointDecoder.LocalShape program tree targetView targetSource :=
        RootResetResponseBoundaryStages.localShape_replaceContinuation
          (CheckpointDecoder.parseLocal?_sound boundary) innerTarget
      have targetBoundary := CheckpointDecoder.parseLocal?_complete targetShape
      have contextEq : localContinuationContext targetSource = localContinuationContext source := by
        rcases CheckpointDecoder.parseLocal?_sound boundary with
          ⟨haltField, dispatcherTerm, seedAudit, continuationAudit, halt, dispatch, sourceEq⟩
        simp only [targetSource, sourceEq, localContinuationContext, CheckpointDecoder.openShell, Context.plug]
      have rebuilt := MarkedPrefix.local targetBoundary (show targetView.status = .marked from marked) targetPrefix
      rw [contextEq] at rebuilt
      exact ⟨targetView :: targetHistory, by
        simpa only [targetSource, innerTarget, Context.plug_comp,
          RootResetRuntimeContextBridge.context_comp_assoc] using rebuilt⟩

end PureSFormal.Research.RootResetEmptyContinuationSelector
