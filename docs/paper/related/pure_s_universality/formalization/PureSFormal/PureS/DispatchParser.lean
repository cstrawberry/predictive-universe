import PureSFormal.PureS.RouteParser
import PureSFormal.PureS.ActionParser
import PureSFormal.PureS.Carrier

/-!
# Completed dispatcher-field parser

This module composes the activated-route checker with the selected-action
checker.  A first total pass validates the route skeleton and identifies its
leaf.  A structural projection along that already-validated route recovers
the registered leaf response.  The action checker then validates equation
(8b) at the recovered label and returns the canonical accumulator occurrence.

Route audits, dormant-call audits, and retained histories are never compared.
-/

namespace PureSFormal.PureS

namespace DispatchParser

/-- Route information augmented by the response stored at its selected leaf. -/
structure DetailedRoute (Label : Type u) where
  route : Dispatcher.Route
  label : Label
  response : Term

/-- The public result of a completed dispatcher parse. -/
structure ParsedDispatch (program : CTS.Program) where
  route : Dispatcher.Route
  label : ActionLabel program
  accumulator : Term

/--
Project the selected response along a supplied route.  This function alone
does not certify the route; `parseRouteDetailed` invokes it only after the
full `RouteParser` checker succeeds.
-/
def responseAt? {Label : Type u} :
    Dispatcher.Tree Label → Dispatcher.Route → Term → Option Term
  | .leaf _, [], result =>
      match RouteParser.unpackChosen? result with
      | some fields => some fields.response
      | none => none
  | .leaf _, _ :: _, _ => none
  | .node _ _, [], _ => none
  | .node left _, .left :: rest, result =>
      match RouteParser.unpackSelectedNode? result with
      | some fields => responseAt? left rest fields.leftChild
      | none => none
  | .node _ right, .right :: rest, result =>
      match RouteParser.unpackSelectedNode? result with
      | some fields => responseAt? right rest fields.rightChild
      | none => none

/-- Every declarative activated route exposes its indexed response. -/
theorem responseAt?_complete
    {Label : Type u} {encode : Label → Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    {response result : Term}
    (h : RouteGrammar.ActivatedRoute encode tree route label response result) :
    responseAt? tree route result = some response := by
  induction h with
  | leaf label audit response => rfl
  | @left left right route label response active
      outerAudit dormantAudit inner ih =>
      simpa [responseAt?, RouteGrammar.selectedLeft] using ih
  | @right left right route label response active
      outerAudit dormantAudit inner ih =>
      simpa [responseAt?, RouteGrammar.selectedRight] using ih

/--
A response-retaining route parser local to this module.  It preserves the
existing `RouteParser` API while exposing exactly the field needed by the
action phase.
-/
def parseRouteDetailed {Label : Type u} (encode : Label → Term)
    (tree : Dispatcher.Tree Label) (result : Term) :
    Option (DetailedRoute Label) :=
  match RouteParser.parse encode tree result with
  | none => none
  | some (route, label) =>
      match responseAt? tree route result with
      | none => none
      | some response => some ⟨route, label, response⟩

/-- Detailed success supplies the exact response-indexed route witness. -/
theorem parseRouteDetailed_sound
    {Label : Type u} {encode : Label → Term}
    {tree : Dispatcher.Tree Label} {result : Term}
    {parsed : DetailedRoute Label}
    (h : parseRouteDetailed encode tree result = some parsed) :
    RouteGrammar.ActivatedRoute encode tree parsed.route parsed.label
      parsed.response result := by
  unfold parseRouteDetailed at h
  generalize hroute : RouteParser.parse encode tree result = routeResult at h
  cases routeResult with
  | none => contradiction
  | some routeEntry =>
      cases routeEntry with
      | mk route label =>
          simp only at h
          generalize hresponse : responseAt? tree route result = responseResult
            at h
          cases responseResult with
          | none => cases h
          | some response =>
              simp only at h
              have hparsed :
                  (DetailedRoute.mk route label response) = parsed :=
                Option.some.inj h
              subst parsed
              obtain ⟨witness, routeShape⟩ :=
                RouteParser.parse_sound hroute
              have hwitness := responseAt?_complete routeShape
              have hsame : response = witness :=
                Option.some.inj (hresponse.symm.trans hwitness)
              subst witness
              exact routeShape

/-- Every activated-route witness is retained exactly by the detailed parser. -/
theorem parseRouteDetailed_complete
    {Label : Type u} {encode : Label → Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    {response result : Term}
    (h : RouteGrammar.ActivatedRoute encode tree route label response result) :
    parseRouteDetailed encode tree result =
      some ⟨route, label, response⟩ := by
  simp only [parseRouteDetailed, RouteParser.parse_complete h,
    responseAt?_complete h]

/--
Parse a completed dispatcher field for one fixed CTS program and action tree.
The returned accumulator is the public child selected by equation (8b).
-/
def parse (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (field : Term) :
    Option (ParsedDispatch program) :=
  match parseRouteDetailed (selectedAction program) tree field with
  | none => none
  | some routeResult =>
      match ActionParser.parse program routeResult.label routeResult.response with
      | none => none
      | some actionResult =>
          some ⟨routeResult.route, routeResult.label,
            actionResult.accumulator⟩

/--
Declarative composition of an activated route and an equation-(8b) action
shape.  Histories remain explicit existential fields and are not related to
one another or to any route audit.
-/
def DispatchShape (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (route : Dispatcher.Route) (label : ActionLabel program)
    (accumulator field : Term) : Prop :=
  ∃ response histories,
    RouteGrammar.ActivatedRoute (selectedAction program) tree route label
        response field ∧
      ActionParser.ActionShape program label accumulator histories response

/-- Successful combined parsing supplies both declarative witnesses. -/
theorem parse_sound
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)} {field : Term}
    {parsed : ParsedDispatch program}
    (h : parse program tree field = some parsed) :
    DispatchShape program tree parsed.route parsed.label parsed.accumulator
      field := by
  unfold parse at h
  generalize hroute :
    parseRouteDetailed (selectedAction program) tree field = routeResult at h
  cases routeResult with
  | none => contradiction
  | some routeFields =>
      simp only at h
      generalize haction :
        ActionParser.parse program routeFields.label routeFields.response =
          actionResult at h
      cases actionResult with
      | none => cases h
      | some actionFields =>
          simp only at h
          have hparsed :
              ParsedDispatch.mk routeFields.route routeFields.label
                  actionFields.accumulator = parsed :=
            Option.some.inj h
          subst parsed
          refine ⟨routeFields.response, actionFields.histories, ?_, ?_⟩
          · exact parseRouteDetailed_sound hroute
          · exact ActionParser.parse_sound haction

/-- Every compatible route/action pair is accepted with its exact indices. -/
theorem parse_complete
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program}
    {accumulator field : Term}
    (h : DispatchShape program tree route label accumulator field) :
    parse program tree field = some ⟨route, label, accumulator⟩ := by
  rcases h with ⟨response, histories, routeShape, actionShape⟩
  simp only [parse, parseRouteDetailed_complete routeShape,
    ActionParser.parse_complete actionShape]

/-- Combined executable parsing and the composed grammar agree exactly. -/
theorem parse_eq_some_iff
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program}
    {accumulator field : Term} :
    parse program tree field = some ⟨route, label, accumulator⟩ ↔
      DispatchShape program tree route label accumulator field :=
  ⟨parse_sound, parse_complete⟩

/-- The relation consumed by the recursive carrier grammar. -/
def dispatchesTo (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (field accumulator : Term) : Prop :=
  ∃ route label,
    DispatchShape program tree route label accumulator field

/-- A relation witness is accepted by the executable parser. -/
theorem parse_of_dispatchesTo
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {field accumulator : Term}
    (h : dispatchesTo program tree field accumulator) :
    ∃ route label,
      parse program tree field = some ⟨route, label, accumulator⟩ := by
  rcases h with ⟨route, label, shape⟩
  exact ⟨route, label, parse_complete shape⟩

/-- One completed dispatcher field has at most one canonical accumulator. -/
theorem dispatchesTo_rightUnique
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) :
    Carrier.RightUnique (dispatchesTo program tree) := by
  intro field first second hfirst hsecond
  obtain ⟨firstRoute, firstLabel, firstParse⟩ :=
    parse_of_dispatchesTo hfirst
  obtain ⟨secondRoute, secondLabel, secondParse⟩ :=
    parse_of_dispatchesTo hsecond
  have hresults :
      (ParsedDispatch.mk firstRoute firstLabel first) =
        ParsedDispatch.mk secondRoute secondLabel second :=
    Option.some.inj (firstParse.symm.trans secondParse)
  exact congrArg ParsedDispatch.accumulator hresults

end DispatchParser

end PureSFormal.PureS
