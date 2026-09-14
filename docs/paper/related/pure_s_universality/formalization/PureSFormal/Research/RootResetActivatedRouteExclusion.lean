import PureSFormal.Research.RootResetWrappedEmptyCommit

/-!
# Completed selected routes exclude unfinished dispatcher nodes

An activated response remains inside its exact selected route while the
appender contracts.  A generated carrier's arity prevents this completed
route from being mistaken for an exposed or forked dispatcher node.
-/

namespace PureSFormal.Research.RootResetActivatedRouteExclusion

open PureSFormal.PureS
open RootResetWholeDispatcherStages
open RootResetDispatcherNodeStages
open RootResetWrappedEmptyCommit

theorem carrier_ne_dispatcherCode
    {Label : Type} (encode : Label → Term) (tree : Dispatcher.Tree Label)
    {carrier : Term} (arity : carrier.headArity ≠ 2) :
    carrier ≠ compileDispatcher encode tree := by
  intro equal
  apply arity
  rw [equal]
  cases tree <;> rfl

theorem parseCurrent?_selectedLeft_chosen_none
    {Label : Type} (encode : Label → Term) (left right sibling : Dispatcher.Tree Label)
    (direction : Direction) (remaining : Dispatcher.Route)
    (outerAudit carrier payload dormantAudit : Term) (arity : carrier.headArity ≠ 2) :
    parseCurrent? encode left right direction remaining
      (RouteGrammar.selectedLeft outerAudit (chosen carrier payload)
        (RouteGrammar.compiledCall encode sibling dormantAudit)) = none := by
  cases parsed : classifyNode? encode left right
      (RouteGrammar.selectedLeft outerAudit (chosen carrier payload)
        (RouteGrammar.compiledCall encode sibling dormantAudit)) with
  | none => rw [parseCurrent?, parsed]
  | some view =>
      apply False.elim
      rcases classifyNode?_sound parsed with ⟨row, _, source⟩ | ⟨row, _, source⟩
      · have innerEq : chosen carrier payload = fork (compileDispatcher encode left)
            (compileDispatcher encode right) := (Term.app.inj (Term.app.inj source).2).1
        have carrierEq : carrier = compileDispatcher encode left :=
          (Term.app.inj (Term.app.inj innerEq).1).2
        exact carrier_ne_dispatcherCode encode left arity carrierEq
      · have innerEq : chosen carrier payload = RouteGrammar.compiledCall encode left row.leftArgument :=
          (Term.app.inj (Term.app.inj source).2).1
        have impossible := congrArg Term.headArity innerEq
        cases left <;> cases impossible

theorem parseCurrent?_selectedRight_chosen_none
    {Label : Type} (encode : Label → Term) (left right sibling : Dispatcher.Tree Label)
    (direction : Direction) (remaining : Dispatcher.Route)
    (outerAudit carrier payload dormantAudit : Term) :
    parseCurrent? encode left right direction remaining
      (RouteGrammar.selectedRight outerAudit
        (RouteGrammar.compiledCall encode sibling dormantAudit) (chosen carrier payload)) = none := by
  cases parsed : classifyNode? encode left right
      (RouteGrammar.selectedRight outerAudit
        (RouteGrammar.compiledCall encode sibling dormantAudit) (chosen carrier payload)) with
  | none => rw [parseCurrent?, parsed]
  | some view =>
      apply False.elim
      rcases classifyNode?_sound parsed with ⟨row, _, source⟩ | ⟨row, _, source⟩
      · have innerEq : RouteGrammar.compiledCall encode sibling dormantAudit =
            fork (compileDispatcher encode left) (compileDispatcher encode right) :=
          (Term.app.inj (Term.app.inj source).2).1
        have impossible := congrArg Term.headArity innerEq
        cases sibling <;> cases impossible
      · have innerEq : chosen carrier payload = RouteGrammar.compiledCall encode right row.rightArgument :=
          (Term.app.inj (Term.app.inj source).2).2
        have impossible := congrArg Term.headArity innerEq
        cases right <;> cases impossible

/-- Every selected route has finished its node contractions before the
appender starts, independently of the current action-field response. -/
theorem parseRouteNode?_withResponse_none
    {Label : Type} (encode : Label → Term)
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    (path : Dispatcher.HasRoute tree route label) (carrier response : Term)
    (arity : carrier.headArity ≠ 2) :
    parseRouteNode? encode tree route
      (PrimitiveRoute.withResponse encode tree route carrier response) = none := by
  induction path with
  | leaf label => rfl
  | @left route label left right path ih =>
      rw [PrimitiveRoute.withResponse, parseRouteNode?]
      simp only [RouteGrammar.selectedLeft, RouteParser.unpackSelectedNode?_chosen]
      rw [RouteParser.compiledCallAudit?_compiledCall, ih]
      obtain ⟨payload, innerEq⟩ := withResponse_chosen encode path carrier response
      rw [innerEq]
      exact parseCurrent?_selectedLeft_chosen_none encode left right right .left route
        carrier carrier payload carrier arity
  | @right route label left right path ih =>
      rw [PrimitiveRoute.withResponse, parseRouteNode?]
      simp only [RouteGrammar.selectedRight, RouteParser.unpackSelectedNode?_chosen]
      rw [RouteParser.compiledCallAudit?_compiledCall, ih]
      obtain ⟨payload, innerEq⟩ := withResponse_chosen encode path carrier response
      rw [innerEq]
      exact parseCurrent?_selectedRight_chosen_none encode left right left .right route
        carrier carrier payload carrier

end PureSFormal.Research.RootResetActivatedRouteExclusion
