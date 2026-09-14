import PureSFormal.PureS.PrimitiveScripts
import PureSFormal.PureS.RouteExecution

/-!
# Primitive execution of a fixed dispatcher route

This is the cursor-level refinement of the structural route theorem.  A
valid finite route is compiled to the literal node/leaf scripts, and its
reverse is a fixed sequence of parent moves.  The forward walk ends at the
selected action call; the reverse restores the root of the fully activated
route result.
-/

namespace PureSFormal.PureS

namespace PrimitiveRoute

open RouteGrammar RouteExecution PrimitiveScripts

/-- Compile a direction word to `(A4)*; leaf`. -/
def forward : Dispatcher.Route → Script
  | [] => leaf
  | .left :: rest => nodeLeft ++ forward rest
  | .right :: rest => nodeRight ++ forward rest

/-- Fixed reverse route: one leaf parent and two parents per internal node. -/
def backward : Dispatcher.Route → Script
  | [] => [.U]
  | _ :: rest => backward rest ++ [.U, .U]

/--
Exact zipper stack at the selected action call.  Invalid tree/route pairs use
the supplied outer stack; valid pairs are selected by `HasRoute` below.
-/
def selectedParents {Label : Type u} (encode : Label → Term) (carrier : Term) :
    Dispatcher.Tree Label → Dispatcher.Route → List ParentFrame →
      List ParentFrame
  | .leaf _, [], parents =>
      .right (.app .s carrier) :: parents
  | .node left right, .left :: rest, parents =>
      selectedParents encode carrier left rest
        (.left (compiledCall encode right carrier) ::
          .right (.app .s carrier) :: parents)
  | .node left right, .right :: rest, parents =>
      selectedParents encode carrier right rest
        (.right (compiledCall encode left carrier) ::
          .right (.app .s carrier) :: parents)
  | _, _, parents => parents

/-- Activated route rebuilt around an arbitrary completed leaf response. -/
def withResponse {Label : Type u} (encode : Label → Term) :
    Dispatcher.Tree Label → Dispatcher.Route → Term → Term → Term
  | .leaf _, [], carrier, response => chosen carrier response
  | .node left right, .left :: rest, carrier, response =>
      RouteGrammar.selectedLeft carrier
        (withResponse encode left rest carrier response)
        (compiledCall encode right carrier)
  | .node left right, .right :: rest, carrier, response =>
      RouteGrammar.selectedRight carrier
        (compiledCall encode left carrier)
        (withResponse encode right rest carrier response)
  | tree, _, carrier, _ => compiledCall encode tree carrier

/-- Forward primitive execution reaches the exact selected action occurrence. -/
theorem run_forward
    {Label : Type u} {encode : Label → Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    (path : Dispatcher.HasRoute tree route label)
    (carrier : Term) (parents : List ParentFrame) :
    Script.run (forward route)
      ⟨compiledCall encode tree carrier, parents⟩ =
      some ⟨.app (encode label) carrier,
        selectedParents encode carrier tree route parents⟩ := by
  induction path generalizing parents with
  | leaf label =>
      exact run_leaf (encode label) carrier parents
  | @left route label left right path ih =>
      rw [forward, Script.run_append]
      simp only [compiledCall, compileDispatcher, selectedParents]
      rw [run_nodeLeft]
      change Script.run (forward route)
        ⟨compiledCall encode left carrier,
          .left (compiledCall encode right carrier) ::
          .right (.app .s carrier) :: parents⟩ = _
      exact ih _
  | @right route label left right path ih =>
      rw [forward, Script.run_append]
      simp only [compiledCall, compileDispatcher, selectedParents]
      rw [run_nodeRight]
      change Script.run (forward route)
        ⟨compiledCall encode right carrier,
          .right (compiledCall encode left carrier) ::
          .right (.app .s carrier) :: parents⟩ = _
      exact ih _

/-- The fixed reverse walk restores the root of the activated route result. -/
theorem run_backward
    {Label : Type u} {encode : Label → Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    (path : Dispatcher.HasRoute tree route label)
    (carrier : Term) (parents : List ParentFrame) :
    Script.run (backward route)
      ⟨.app (encode label) carrier,
        selectedParents encode carrier tree route parents⟩ =
      some ⟨freshRouteResult encode tree route carrier, parents⟩ := by
  induction path generalizing parents with
  | leaf label => rfl
  | @left route label left right path ih =>
      rw [backward, Script.run_append]
      simp only [selectedParents, freshRouteResult]
      rw [ih (parents :=
        .left (compiledCall encode right carrier) ::
        .right (.app .s carrier) :: parents)]
      rfl
  | @right route label left right path ih =>
      rw [backward, Script.run_append]
      simp only [selectedParents, freshRouteResult]
      rw [ih (parents :=
        .right (compiledCall encode left carrier) ::
        .right (.app .s carrier) :: parents)]
      rfl

/-- The same reverse route works after arbitrary mutation of the selected response. -/
theorem run_backward_withResponse
    {Label : Type u} {encode : Label → Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    (path : Dispatcher.HasRoute tree route label)
    (carrier response : Term) (parents : List ParentFrame) :
    Script.run (backward route)
      ⟨response, selectedParents encode carrier tree route parents⟩ =
      some ⟨withResponse encode tree route carrier response, parents⟩ := by
  induction path generalizing parents with
  | leaf label => rfl
  | @left route label left right path ih =>
      rw [backward, Script.run_append]
      simp only [selectedParents, withResponse]
      rw [ih (parents :=
        .left (compiledCall encode right carrier) ::
        .right (.app .s carrier) :: parents)]
      rfl
  | @right route label left right path ih =>
      rw [backward, Script.run_append]
      simp only [selectedParents, withResponse]
      rw [ih (parents :=
        .right (compiledCall encode left carrier) ::
        .right (.app .s carrier) :: parents)]
      rfl

/-- The generalized route result is an exact mutation-closed route witness. -/
theorem withResponse_activated
    {Label : Type u} {encode : Label → Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    (path : Dispatcher.HasRoute tree route label)
    (carrier response : Term) :
    RouteGrammar.ActivatedRoute encode tree route label response
      (withResponse encode tree route carrier response) := by
  induction path with
  | leaf label => exact .leaf label carrier response
  | @left route label left right path ih => exact .left carrier carrier ih
  | @right route label left right path ih => exact .right carrier carrier ih

/-- Forward activation followed by its fixed reverse restores the route root. -/
theorem run_roundTrip
    {Label : Type u} {encode : Label → Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    (path : Dispatcher.HasRoute tree route label)
    (carrier : Term) (parents : List ParentFrame) :
    Script.run (forward route ++ backward route)
      ⟨compiledCall encode tree carrier, parents⟩ =
      some ⟨freshRouteResult encode tree route carrier, parents⟩ := by
  rw [Script.run_append, run_forward path]
  change Script.run (backward route)
    ⟨.app (encode label) carrier,
      selectedParents encode carrier tree route parents⟩ = _
  exact run_backward path carrier parents

/-- The forward microprogram has exactly the route theorem's contraction count. -/
@[simp]
theorem forward_rdxCount (route : Dispatcher.Route) :
    (forward route).rdxCount = 2 * route.length + 1 := by
  induction route with
  | nil => rfl
  | cons direction rest ih =>
      cases direction <;>
        simp only [forward, Script.rdxCount_append, nodeLeft_rdxCount,
          nodeRight_rdxCount, ih, List.length_cons, Nat.mul_succ] <;>
        simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

/-- The reverse route contains no mutation. -/
theorem backward_cursorOnly (route : Dispatcher.Route) :
    Script.CursorOnly (backward route) := by
  induction route with
  | nil => trivial
  | cons direction rest ih =>
      simp only [backward]
      simpa [List.append_assoc] using
        cursorOnly_append_up _ (cursorOnly_append_up _ ih)

@[simp]
theorem backward_rdxCount (route : Dispatcher.Route) :
    (backward route).rdxCount = 0 :=
  Script.rdxCount_eq_zero_of_cursorOnly (backward_cursorOnly route)

/-- The full dispatcher round trip performs `2|route|+1` contractions. -/
@[simp]
theorem roundTrip_rdxCount (route : Dispatcher.Route) :
    (forward route ++ backward route).rdxCount = 2 * route.length + 1 := by
  rw [Script.rdxCount_append, forward_rdxCount, backward_rdxCount,
    Nat.add_zero]

end PrimitiveRoute

end PureSFormal.PureS
