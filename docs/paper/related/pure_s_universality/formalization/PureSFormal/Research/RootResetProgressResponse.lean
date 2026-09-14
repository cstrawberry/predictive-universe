import PureSFormal.PureS.RouteAction
import PureSFormal.PureS.CheckpointDecoder
import PureSFormal.Research.RootResetProgressProgramCode

/-!
# Exact progress-aware Local responses

This module composes the generic dispatcher-route reduction with the
progress-aware action and frame code.  It contains no selector state.  Every
term is a closed pure-`S` term, every displayed transition is an ordinary
contextual `S` contraction, and every copied audit remains a literal field.

The response stops before CLOSE and COMMIT.  Those two transaction steps are
kept separate so a root-reset invocation can rediscover them from the current
bare term.
-/

namespace PureSFormal.Research.RootResetProgressResponse

open PureSFormal.PureS
open RootResetProgressProgramCode

/-- A completed response whose halt field is still fresh. -/
def completed
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation carrier completedRoute : Term) : Term :=
  CheckpointDecoder.openShell (freshHField carrier) completedRoute
    (progressWord bits) carrier continuation carrier

/-- The same response after the visible COMMIT mutation. -/
def markedCompleted
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation carrier completedRoute : Term) : Term :=
  CheckpointDecoder.openShell (markH carrier) completedRoute
    (progressWord bits) carrier continuation carrier

@[simp]
theorem completed_eq_progressFreshLocal_at_call
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation carrier : Term) :
    completed program tree bits continuation carrier
        (.app (progressCompileActions program tree) carrier) =
      progressFreshLocal program tree bits continuation carrier :=
  rfl

/-- The completed dispatcher is the literal `LLR` field. -/
def dispatcherAddress : Address := [.left, .left, .right]

/-- The literal continuation code is the `RL` child of its call. -/
def continuationAddress : Address := [.right, .left]

/-- The status field is the fixed `LLL` occurrence. -/
def statusAddress : Address := [.left, .left, .left]

@[simp]
theorem completed_dispatcher
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation carrier completedRoute : Term) :
    (completed program tree bits continuation carrier completedRoute).subterm?
        dispatcherAddress = some completedRoute :=
  by simp [completed, dispatcherAddress, CheckpointDecoder.openShell,
    Term.subterm?]

@[simp]
theorem markedCompleted_dispatcher
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation carrier completedRoute : Term) :
    (markedCompleted program tree bits continuation carrier completedRoute).subterm?
        dispatcherAddress = some completedRoute :=
  by simp [markedCompleted, dispatcherAddress, CheckpointDecoder.openShell,
    Term.subterm?]

@[simp]
theorem completed_continuation
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation carrier completedRoute : Term) :
    (completed program tree bits continuation carrier completedRoute).subterm?
        continuationAddress = some continuation :=
  by simp [completed, continuationAddress, CheckpointDecoder.openShell,
    Term.subterm?]

@[simp]
theorem markedCompleted_continuation
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation carrier completedRoute : Term) :
    (markedCompleted program tree bits continuation carrier completedRoute).subterm?
        continuationAddress = some continuation :=
  by simp [markedCompleted, continuationAddress, CheckpointDecoder.openShell,
    Term.subterm?]

@[simp]
theorem completed_status
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation carrier completedRoute : Term) :
    (completed program tree bits continuation carrier completedRoute).subterm?
        statusAddress = some (freshHField carrier) :=
  rfl

@[simp]
theorem markedCompleted_status
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation carrier completedRoute : Term) :
    (markedCompleted program tree bits continuation carrier completedRoute).subterm?
        statusAddress = some (markH carrier) :=
  rfl

/-- COMMIT is one contraction at the fixed status occurrence. -/
@[simp]
theorem completed_contractAt?_commit
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation carrier completedRoute : Term) :
    (completed program tree bits continuation carrier completedRoute).contractAt?
        statusAddress =
      some (markedCompleted program tree bits continuation carrier
        completedRoute) :=
  rfl

/-- COMMIT is one genuine contextual pure-S step. -/
theorem completed_step_marked
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation carrier completedRoute : Term) :
    Step (completed program tree bits continuation carrier completedRoute)
      (markedCompleted program tree bits continuation carrier completedRoute) :=
  Term.contractAt?_sound
    (completed_contractAt?_commit program tree bits continuation carrier
      completedRoute)

/-- Exact route-plus-action contraction count for progress actions. -/
def routeActionCost (program : CTS.Program)
    (route : Dispatcher.Route) (label : ActionLabel program) : Nat :=
  2 * route.length + 1 + progressActionCost program label

/--
Execute a valid dispatcher route and its progress-aware selected action.  The
result retains the activated route and the explicit action accumulator.
-/
theorem executeRouteAction
    (program : CTS.Program)
    {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program}
    (path : Dispatcher.HasRoute tree route label) (carrier : Term) :
    ∃ completedRoute,
      StepsN (routeActionCost program route label)
        (RouteGrammar.compiledCall (progressSelectedAction program) tree carrier)
        completedRoute ∧
      RouteGrammar.ActivatedRoute (progressSelectedAction program) tree route
        label (progressActionResult program label carrier) completedRoute := by
  have routeSteps :=
    RouteExecution.compiledCall_executeRoute
      (encode := progressSelectedAction program) path carrier
  have freshShape :=
    RouteExecution.freshRouteResult_activated
      (encode := progressSelectedAction program) path carrier
  obtain ⟨completedRoute, actionSteps, completedShape⟩ :=
    freshShape.reduceResponse (progressExecuteAction program label carrier)
  refine ⟨completedRoute, ?_, completedShape⟩
  simpa [routeActionCost] using StepsN.trans routeSteps actionSteps

/-- Frame prefix plus route and action, stopping before CLOSE and COMMIT. -/
def completedCost (program : CTS.Program)
    (route : Dispatcher.Route) (label : ActionLabel program) : Nat :=
  3 + routeActionCost program route label

/--
The exact progress-aware response.  Its selected accumulator may still carry
the unique Open transaction token; no marker contraction is included.
-/
theorem execute
    (program : CTS.Program)
    {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program}
    (path : Dispatcher.HasRoute tree route label)
    (bits : List Bool) (continuation carrier : Term) :
    ∃ completedRoute,
      StepsN (completedCost program route label)
        (frame (progressEnvironmentCode program tree bits) continuation carrier)
        (completed program tree bits continuation carrier completedRoute) ∧
      RouteGrammar.ActivatedRoute (progressSelectedAction program) tree route
        label (progressActionResult program label carrier) completedRoute := by
  obtain ⟨completedRoute, routeSteps, routeShape⟩ :=
    executeRouteAction program path carrier
  have frameSteps :=
    progressFramePrefix program tree bits continuation carrier
  have completedField :
      StepsN (routeActionCost program route label)
        (progressFreshLocal program tree bits continuation carrier)
        (completed program tree bits continuation carrier completedRoute) := by
    have inDispatcher := StepsN.appRight (freshHField carrier) routeSteps
    have withSeed :=
      StepsN.appLeft inDispatcher (.app (progressSeedCode bits) carrier)
    have withContinuation :=
      StepsN.appLeft withSeed (.app continuation carrier)
    simpa [progressFreshLocal, completed, progressSeedCode,
      RouteGrammar.compiledCall, CheckpointDecoder.openShell,
      Term.applyArgs] using! withContinuation
  refine ⟨completedRoute, ?_, routeShape⟩
  simpa [completedCost] using StepsN.trans frameSteps completedField

/-- A fresh completed response reaches its marked twin in exactly one step. -/
theorem commit
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation carrier completedRoute : Term) :
    StepsN 1
      (completed program tree bits continuation carrier completedRoute)
      (markedCompleted program tree bits continuation carrier completedRoute) :=
  StepsN.single
    (completed_step_marked program tree bits continuation carrier completedRoute)

end PureSFormal.Research.RootResetProgressResponse
