import PureSFormal.PureS.RouteGrammar

/-!
# Exact execution of a wrapped dispatcher route

A fresh activation duplicates one carrier into every audit and dormant-call
slot created on the selected route.  The general contextual lemmas below keep
already-existing outer audits and dormant siblings independent.
-/

namespace PureSFormal.PureS

namespace RouteExecution

open RouteGrammar

/--
The literal fresh route result determined by a dispatcher and direction word.
The fallback clauses cover invalid routes; the execution theorem is indexed by
`Dispatcher.HasRoute`, so those clauses are unreachable there.
-/
def freshRouteResult {Label : Type u} (encode : Label → Term) :
    Dispatcher.Tree Label → Dispatcher.Route → Term → Term
  | .leaf label, [], audit =>
      chosen audit (.app (encode label) audit)
  | .node left right, .left :: route, audit =>
      selectedLeft audit (freshRouteResult encode left route audit)
        (compiledCall encode right audit)
  | .node left right, .right :: route, audit =>
      selectedRight audit (compiledCall encode left audit)
        (freshRouteResult encode right route audit)
  | tree, _, audit => compiledCall encode tree audit

@[simp] theorem freshRouteResult_leaf {Label : Type u}
    (encode : Label → Term) (label : Label) (audit : Term) :
    freshRouteResult encode (.leaf label) [] audit =
      chosen audit (.app (encode label) audit) :=
  rfl

@[simp] theorem freshRouteResult_left {Label : Type u}
    (encode : Label → Term) (left right : Dispatcher.Tree Label)
    (route : Dispatcher.Route) (audit : Term) :
    freshRouteResult encode (.node left right) (.left :: route) audit =
      selectedLeft audit (freshRouteResult encode left route audit)
        (compiledCall encode right audit) :=
  rfl

@[simp] theorem freshRouteResult_right {Label : Type u}
    (encode : Label → Term) (left right : Dispatcher.Tree Label)
    (route : Dispatcher.Route) (audit : Term) :
    freshRouteResult encode (.node left right) (.right :: route) audit =
      selectedRight audit (compiledCall encode left audit)
        (freshRouteResult encode right route audit) :=
  rfl

/--
Reducing an activated child in the selected-left alternative preserves its
independent outer audit and dormant right sibling exactly.
-/
theorem selectedLeft_steps {n : Nat} {source target : Term}
    (h : StepsN n source target) (outerAudit dormantRight : Term) :
    StepsN n (selectedLeft outerAudit source dormantRight)
      (selectedLeft outerAudit target dormantRight) := by
  simpa [selectedLeft, chosen] using
    StepsN.appRight (.app .s outerAudit)
      (StepsN.appLeft h dormantRight)

/--
Reducing an activated child in the selected-right alternative preserves its
independent outer audit and dormant left sibling exactly.
-/
theorem selectedRight_steps {n : Nat} {source target : Term}
    (h : StepsN n source target) (outerAudit dormantLeft : Term) :
    StepsN n (selectedRight outerAudit dormantLeft source)
      (selectedRight outerAudit dormantLeft target) := by
  simpa [selectedRight, chosen] using
    StepsN.appRight (.app .s outerAudit)
      (StepsN.appRight dormantLeft h)

/-- A fresh result is an instance of the mutation-closed route grammar. -/
theorem freshRouteResult_activated
    {Label : Type u} {encode : Label → Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    (path : Dispatcher.HasRoute tree route label) (audit : Term) :
    ActivatedRoute encode tree route label (.app (encode label) audit)
      (freshRouteResult encode tree route audit) := by
  induction path with
  | leaf label =>
      exact .leaf label audit (.app (encode label) audit)
  | @left route label left right path ih =>
      exact .left audit audit ih
  | @right route label left right path ih =>
      exact .right audit audit ih

/--
Executing a valid route contracts twice at every internal node and once at
the selected leaf, hence exactly `2 * route.length + 1` contractions.
-/
theorem compiledCall_executeRoute
    {Label : Type u} {encode : Label → Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    (path : Dispatcher.HasRoute tree route label) (audit : Term) :
    StepsN (2 * route.length + 1) (compiledCall encode tree audit)
      (freshRouteResult encode tree route audit) := by
  induction path with
  | leaf label =>
      simpa [compiledCall] using leafCode_activate (encode label) audit
  | @left route label left right path ih =>
      have expose :
          StepsN 2 (compiledCall encode (.node left right) audit)
            (selectedLeft audit (compiledCall encode left audit)
              (compiledCall encode right audit)) := by
        simpa [compiledCall, selectedLeft] using
          nodeCode_activate (compileDispatcher encode left)
            (compileDispatcher encode right) audit
      have descend :=
        selectedLeft_steps ih audit (compiledCall encode right audit)
      have combined := StepsN.trans expose descend
      simpa [Nat.mul_succ, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using
        combined
  | @right route label left right path ih =>
      have expose :
          StepsN 2 (compiledCall encode (.node left right) audit)
            (selectedRight audit (compiledCall encode left audit)
              (compiledCall encode right audit)) := by
        simpa [compiledCall, selectedRight] using
          nodeCode_activate (compileDispatcher encode left)
            (compileDispatcher encode right) audit
      have descend :=
        selectedRight_steps ih audit (compiledCall encode left audit)
      have combined := StepsN.trans expose descend
      simpa [Nat.mul_succ, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using
        combined

/--
The counted reduction and its mutation-closed grammar certificate, packaged
at the same explicit endpoint.
-/
theorem compiledCall_executeRoute_spec
    {Label : Type u} {encode : Label → Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    (path : Dispatcher.HasRoute tree route label) (audit : Term) :
    StepsN (2 * route.length + 1) (compiledCall encode tree audit)
        (freshRouteResult encode tree route audit) ∧
      ActivatedRoute encode tree route label (.app (encode label) audit)
        (freshRouteResult encode tree route audit) :=
  ⟨compiledCall_executeRoute path audit,
    freshRouteResult_activated path audit⟩

end RouteExecution

end PureSFormal.PureS
