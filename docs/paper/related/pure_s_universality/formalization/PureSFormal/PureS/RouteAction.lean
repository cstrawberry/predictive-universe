import PureSFormal.PureS.Actions
import PureSFormal.PureS.RouteExecution

/-!
# Mutation closure and completed dispatcher actions

An activated route is a context with one registered response occurrence.
Reducing only that occurrence preserves every independent route audit and
dormant sibling.  This module packages that structural fact and composes the
exact route cost with the exact selected-action cost.
-/

namespace PureSFormal.PureS

namespace RouteGrammar.ActivatedRoute

/--
Any exact reduction of the registered response lifts through an activated
route.  The endpoint is existential because the mutation-closed grammar
allows independent audit terms and therefore does not manufacture equality
between them.
-/
theorem reduceResponse
    {Label : Type u} {encode : Label → Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    {sourceResponse sourceResult targetResponse : Term} {n : Nat}
    (routeShape : RouteGrammar.ActivatedRoute encode tree route label
      sourceResponse sourceResult)
    (responseSteps : StepsN n sourceResponse targetResponse) :
    ∃ targetResult,
      StepsN n sourceResult targetResult ∧
      RouteGrammar.ActivatedRoute encode tree route label
        targetResponse targetResult := by
  induction routeShape with
  | leaf label audit sourceResponse =>
      refine ⟨chosen audit targetResponse, ?_, ?_⟩
      · simpa [chosen] using
          StepsN.appRight (.app .s audit) responseSteps
      · exact .leaf label audit targetResponse
  | @left left right route label sourceResponse activatedChild
      outerAudit dormantAudit inner ih =>
      obtain ⟨targetChild, childSteps, targetShape⟩ := ih responseSteps
      refine ⟨RouteGrammar.selectedLeft outerAudit targetChild
          (RouteGrammar.compiledCall encode right dormantAudit), ?_, ?_⟩
      · exact RouteExecution.selectedLeft_steps childSteps outerAudit
          (RouteGrammar.compiledCall encode right dormantAudit)
      · exact .left outerAudit dormantAudit targetShape
  | @right left right route label sourceResponse activatedChild
      outerAudit dormantAudit inner ih =>
      obtain ⟨targetChild, childSteps, targetShape⟩ := ih responseSteps
      refine ⟨RouteGrammar.selectedRight outerAudit
          (RouteGrammar.compiledCall encode left dormantAudit) targetChild,
          ?_, ?_⟩
      · exact RouteExecution.selectedRight_steps childSteps outerAudit
          (RouteGrammar.compiledCall encode left dormantAudit)
      · exact .right outerAudit dormantAudit targetShape

end RouteGrammar.ActivatedRoute

namespace RouteAction

/-- The exact route-plus-selected-action contraction count. -/
def completedCost (program : CTS.Program)
    (route : Dispatcher.Route) (label : ActionLabel program) : Nat :=
  2 * route.length + 1 + actionCost program label

/--
Selecting a valid leaf and completing its action yields one mutation-closed
activated-route endpoint in the exact combined contraction count.  Every
rejected dispatcher child and audit field is preserved by construction.
-/
theorem execute
    (program : CTS.Program)
    {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program}
    (path : Dispatcher.HasRoute tree route label) (carrier : Term) :
    ∃ completed,
      StepsN (completedCost program route label)
        (RouteGrammar.compiledCall (selectedAction program) tree carrier)
        completed ∧
      RouteGrammar.ActivatedRoute (selectedAction program) tree route label
        (actionResult program label carrier) completed := by
  have routeSteps :=
    RouteExecution.compiledCall_executeRoute
      (encode := selectedAction program) path carrier
  have freshShape :=
    RouteExecution.freshRouteResult_activated
      (encode := selectedAction program) path carrier
  obtain ⟨completed, actionSteps, completedShape⟩ :=
    freshShape.reduceResponse (executeAction program label carrier)
  refine ⟨completed, ?_, completedShape⟩
  simpa [completedCost] using StepsN.trans routeSteps actionSteps

/-- The zero branch has no post-leaf contractions. -/
theorem completedCost_zero
    (program : CTS.Program) (route : Dispatcher.Route)
    (phase : CTS.Phase program) :
    completedCost program route (phase, false) =
      2 * route.length + 1 := by
  simp [completedCost]

/-- The one branch adds exactly two contractions per appendant bit. -/
theorem completedCost_one
    (program : CTS.Program) (route : Dispatcher.Route)
    (phase : CTS.Phase program) :
    completedCost program route (phase, true) =
      2 * route.length + 1 + 2 * (program.appendant phase).length := by
  rfl

end RouteAction

end PureSFormal.PureS
