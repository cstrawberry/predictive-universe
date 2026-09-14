import PureSFormal.PureS.PrimitiveRoute
import PureSFormal.PureS.LocalResponse

/-!
# Primitive one-cursor Local responses

The frame, dispatcher, action, and fixed return scripts are composed here at
their exact zipper interfaces.  This is the cursor-level refinement of
`LocalResponse.execute`; no residual address or route stack is present at
runtime.
-/

namespace PureSFormal.PureS

namespace PrimitiveLocalResponse

open PrimitiveScripts PrimitiveRoute RouteGrammar

/-- Bits executed by a selected leaf; the zero leaf is the empty appender. -/
def emitted (program : CTS.Program) : ActionLabel program → List Bool
  | (_, false) => []
  | (phase, true) => program.appendant phase

@[simp]
theorem selectedAction_eq_appender (program : CTS.Program)
    (label : ActionLabel program) :
    selectedAction program label = appender (emitted program label) := by
  rcases label with ⟨phase, bit⟩
  cases bit <;> rfl

@[simp]
theorem actionResult_eq_appenderResult (program : CTS.Program)
    (label : ActionLabel program) (carrier : Term) :
    actionResult program label carrier =
      appenderResult (emitted program label) carrier := by
  rcases label with ⟨phase, bit⟩
  cases bit <;> rfl

@[simp]
theorem actionCost_eq (program : CTS.Program) (label : ActionLabel program) :
    actionCost program label = 2 * (emitted program label).length := by
  rcases label with ⟨phase, bit⟩
  cases bit <;> rfl

/-- Three fixed parents from the dispatcher field to the Local root. -/
def localReturn : Script := [.U, .U, .U]

/-- Whole unmarked Local-response microprogram. -/
def execute (program : CTS.Program) (route : Dispatcher.Route)
    (label : ActionLabel program) : Script :=
  framePrefixScript ++
    forward route ++
    action (emitted program label) ++
    backward route ++
    localReturn

/-- Literal completed route installed by the primitive response. -/
def completedRoute
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (route : Dispatcher.Route) (label : ActionLabel program)
    (carrier : Term) : Term :=
  withResponse (selectedAction program) tree route carrier
    (actionResult program label carrier)

/--
The complete Appendix-A response script starts and ends at the pending-frame
root, with the exact completed Local term and no cursor metadata left behind.
-/
theorem run_execute
    (program : CTS.Program)
    {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program}
    (path : Dispatcher.HasRoute tree route label)
    (bits : List Bool) (continuation carrier : Term)
    (parents : List ParentFrame) :
    Script.run (execute program route label)
      ⟨frame
        (environmentCode (compileActions program tree) bits)
        continuation carrier, parents⟩ =
      some ⟨LocalResponse.completed bits continuation carrier
          (completedRoute program tree route label carrier), parents⟩ := by
  unfold execute
  rw [Script.run_append, Script.run_append, Script.run_append,
    Script.run_append]
  rw [run_framePrefix]
  simp only
  have hforward :
      Script.run (forward route)
        ⟨.app (compileActions program tree) carrier,
          .right (freshHField carrier) ::
          .left (.app (seedCode bits) carrier) ::
          .left (.app continuation carrier) :: parents⟩ =
        some ⟨.app (selectedAction program label) carrier,
          selectedParents (selectedAction program) carrier tree route
            (.right (freshHField carrier) ::
            .left (.app (seedCode bits) carrier) ::
            .left (.app continuation carrier) :: parents)⟩ := by
    simpa [compiledCall, compileActions] using
      run_forward (encode := selectedAction program) path carrier
        (.right (freshHField carrier) ::
        .left (.app (seedCode bits) carrier) ::
        .left (.app continuation carrier) :: parents)
  rw [hforward]
  simp only
  rw [selectedAction_eq_appender]
  rw [run_action]
  simp only
  rw [← actionResult_eq_appenderResult]
  rw [run_backward_withResponse path]
  simp only
  rfl

/-- The response endpoint carries the expected mutation-closed route proof. -/
theorem completedRoute_activated
    (program : CTS.Program)
    {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program}
    (path : Dispatcher.HasRoute tree route label) (carrier : Term) :
    RouteGrammar.ActivatedRoute (selectedAction program) tree route label
      (actionResult program label carrier)
      (completedRoute program tree route label carrier) := by
  exact withResponse_activated path carrier _

/-- The fixed return from the response field is cursor-only. -/
theorem localReturn_cursorOnly : Script.CursorOnly localReturn := by
  trivial

@[simp] theorem localReturn_rdxCount : localReturn.rdxCount = 0 := rfl

/-- Exact contraction count of the operational Local response. -/
@[simp]
theorem execute_rdxCount (program : CTS.Program)
    (route : Dispatcher.Route) (label : ActionLabel program) :
    (execute program route label).rdxCount =
      LocalResponse.completedCost program route label := by
  simp only [execute, Script.rdxCount_append, framePrefixScript_rdxCount,
    forward_rdxCount, action_rdxCount, backward_rdxCount,
    localReturn_rdxCount, LocalResponse.completedCost, actionCost_eq]
  simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

/-- Unmarked response followed by (A6) reaches the marked completed Local. -/
theorem run_execute_marked
    (program : CTS.Program)
    {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program}
    (path : Dispatcher.HasRoute tree route label)
    (bits : List Bool) (continuation carrier : Term)
    (parents : List ParentFrame) :
    Script.run (execute program route label ++ mark)
      ⟨frame
        (environmentCode (compileActions program tree) bits)
        continuation carrier, parents⟩ =
      some ⟨LocalResponse.markedCompleted bits continuation carrier
          (completedRoute program tree route label carrier), parents⟩ := by
  rw [Script.run_append, run_execute program path]
  simp only
  rfl

@[simp]
theorem execute_marked_rdxCount (program : CTS.Program)
    (route : Dispatcher.Route) (label : ActionLabel program) :
    (execute program route label ++ mark).rdxCount =
      LocalResponse.completedCost program route label + 1 := by
  rw [Script.rdxCount_append, execute_rdxCount, mark_rdxCount]

end PrimitiveLocalResponse

end PureSFormal.PureS
