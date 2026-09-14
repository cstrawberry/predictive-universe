import PureSFormal.PureS.Carrier
import PureSFormal.PureS.RouteAction

/-!
# Completed Local responses

This layer composes the literal three-contraction frame prefix with route
activation and the selected action.  It states no queue semantics: the
completed dispatcher response is retained as an explicit field, while the
seed and continuation fields remain the literal calls made by the frame.
-/

namespace PureSFormal.PureS

namespace LocalResponse

/--
The completed Local shell.  `completedRoute` is the mutation-closed route
whose selected response has already executed its action.
-/
def completed (bits : List Bool) (continuation carrier completedRoute : Term) :
    Term :=
  Carrier.activeShell bits continuation (freshHField carrier) completedRoute
    carrier carrier

/-- The same completed Local shell after marking its registered halt field. -/
def markedCompleted
    (bits : List Bool) (continuation carrier completedRoute : Term) : Term :=
  Carrier.activeShell bits continuation
    (Carrier.markedHField carrier carrier) completedRoute carrier carrier

/-- The fresh completed endpoint is a registered Carrier Local shell. -/
theorem completed_localShell
    (bits : List Bool) (continuation carrier completedRoute : Term) :
    Carrier.LocalShell bits continuation completedRoute
      (completed bits continuation carrier completedRoute) :=
  .fresh completedRoute carrier carrier carrier

/-- The marked completed endpoint is the corresponding registered alternative. -/
theorem markedCompleted_localShell
    (bits : List Bool) (continuation carrier completedRoute : Term) :
    Carrier.LocalShell bits continuation completedRoute
      (markedCompleted bits continuation carrier completedRoute) :=
  .marked completedRoute carrier carrier carrier carrier

/-- The completed dispatcher field has the fixed Local-shell address `LLR`. -/
def dispatcherAddress : Address :=
  [.left, .left, .right]

/-- The literal continuation code has the fixed Local-shell address `RL`. -/
def continuationAddress : Address :=
  [.right, .left]

@[simp] theorem completed_dispatcher
    (bits : List Bool) (continuation carrier completedRoute : Term) :
    (completed bits continuation carrier completedRoute).subterm?
        dispatcherAddress = some completedRoute :=
  by simp [completed, dispatcherAddress, Carrier.activeShell]

@[simp] theorem markedCompleted_dispatcher
    (bits : List Bool) (continuation carrier completedRoute : Term) :
    (markedCompleted bits continuation carrier completedRoute).subterm?
        dispatcherAddress = some completedRoute :=
  by simp [markedCompleted, dispatcherAddress, Carrier.activeShell]

/-- The seed call remains a literal field at address `LR`. -/
@[simp] theorem completed_seed
    (bits : List Bool) (continuation carrier completedRoute : Term) :
    (completed bits continuation carrier completedRoute).subterm?
        [.left, .right] = some (.app (seedCode bits) carrier) :=
  rfl

@[simp] theorem markedCompleted_seed
    (bits : List Bool) (continuation carrier completedRoute : Term) :
    (markedCompleted bits continuation carrier completedRoute).subterm?
        [.left, .right] = some (.app (seedCode bits) carrier) :=
  rfl

/-- The complete continuation call remains the literal rightmost field. -/
@[simp] theorem completed_continuationCall
    (bits : List Bool) (continuation carrier completedRoute : Term) :
    (completed bits continuation carrier completedRoute).subterm? [.right] =
      some (.app continuation carrier) :=
  rfl

@[simp] theorem markedCompleted_continuationCall
    (bits : List Bool) (continuation carrier completedRoute : Term) :
    (markedCompleted bits continuation carrier completedRoute).subterm?
        [.right] = some (.app continuation carrier) :=
  rfl

/-- The continuation itself is preserved literally at the paper's `RL` path. -/
@[simp] theorem completed_continuation
    (bits : List Bool) (continuation carrier completedRoute : Term) :
    (completed bits continuation carrier completedRoute).subterm?
        continuationAddress = some continuation :=
  by simp [completed, continuationAddress, Carrier.activeShell]

@[simp] theorem markedCompleted_continuation
    (bits : List Bool) (continuation carrier completedRoute : Term) :
    (markedCompleted bits continuation carrier completedRoute).subterm?
        continuationAddress = some continuation :=
  by simp [markedCompleted, continuationAddress, Carrier.activeShell]

/-- Marking changes only the registered halt field. -/
theorem completed_mark
    (bits : List Bool) (continuation carrier completedRoute : Term) :
    StepsN 1 (completed bits continuation carrier completedRoute)
      (markedCompleted bits continuation carrier completedRoute) := by
  simpa [completed, markedCompleted, Carrier.activeShell, Carrier.shell] using
    StepsN.appLeft
      (StepsN.appLeft
        (StepsN.appLeft (haltCode_mark carrier) completedRoute)
        (.app (seedCode bits) carrier))
      (.app continuation carrier)

/-- Frame-prefix, route, and selected-action cost, with all grouping explicit. -/
def completedCost (program : CTS.Program)
    (route : Dispatcher.Route) (label : ActionLabel program) : Nat :=
  3 + (2 * route.length + 1 + actionCost program label)

/--
The complete Local response before optional marking.  The witness
`completedRoute` is both the literal dispatcher field of the endpoint and a
mutation-closed activated route whose selected response is the explicit
action result.
-/
theorem execute
    (program : CTS.Program)
    {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program}
    (path : Dispatcher.HasRoute tree route label)
    (bits : List Bool) (continuation carrier : Term) :
    ∃ completedRoute,
      StepsN (completedCost program route label)
        (frame
          (environmentCode (compileActions program tree) bits)
          continuation carrier)
        (completed bits continuation carrier completedRoute) ∧
      RouteGrammar.ActivatedRoute (selectedAction program) tree route label
        (actionResult program label carrier) completedRoute := by
  obtain ⟨completedRoute, routeSteps, routeShape⟩ :=
    RouteAction.execute program path carrier
  have frameSteps :=
    framePrefix (compileActions program tree) bits continuation carrier
  have completedField :
      StepsN (RouteAction.completedCost program route label)
        (freshLocal (compileActions program tree) bits continuation carrier)
        (completed bits continuation carrier completedRoute) := by
    have inDispatcher :=
      StepsN.appRight (freshHField carrier) routeSteps
    have withSeed :=
      StepsN.appLeft inDispatcher (.app (seedCode bits) carrier)
    have withContinuation :=
      StepsN.appLeft withSeed (.app continuation carrier)
    simpa [freshLocal, completed, freshHField, compileActions,
      RouteGrammar.compiledCall, Term.applyArgs] using! withContinuation
  refine ⟨completedRoute, ?_, routeShape⟩
  simpa [completedCost, RouteAction.completedCost] using
    StepsN.trans frameSteps completedField

/--
The zero-action empty candidate followed by the registered halt marker.  Its
pure-syntax cost is exactly `5 + 2 * route.length`; deciding when this branch
denotes an empty queue belongs to the later carrier semantics.
-/
theorem executeZeroMarked
    (program : CTS.Program)
    {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} (phase : CTS.Phase program)
    (path : Dispatcher.HasRoute tree route (phase, false))
    (bits : List Bool) (continuation carrier : Term) :
    ∃ completedRoute,
      StepsN (5 + 2 * route.length)
        (frame
          (environmentCode (compileActions program tree) bits)
          continuation carrier)
        (markedCompleted bits continuation carrier completedRoute) ∧
      RouteGrammar.ActivatedRoute (selectedAction program) tree route
        (phase, false) (.app p carrier) completedRoute := by
  obtain ⟨completedRoute, responseSteps, routeShape⟩ :=
    execute program path bits continuation carrier
  have marked := completed_mark bits continuation carrier completedRoute
  refine ⟨completedRoute, ?_, ?_⟩
  · have combined := StepsN.trans responseSteps marked
    have count :
        completedCost program route (phase, false) + 1 =
          5 + 2 * route.length := by
      simp only [completedCost, actionCost_zero, Nat.add_zero]
      rw [← Nat.add_assoc 3 (2 * route.length) 1]
      rw [Nat.add_comm 3 (2 * route.length)]
      rw [Nat.add_comm 5 (2 * route.length)]
    rw [count] at combined
    exact combined
  · simpa using routeShape

end LocalResponse

end PureSFormal.PureS
