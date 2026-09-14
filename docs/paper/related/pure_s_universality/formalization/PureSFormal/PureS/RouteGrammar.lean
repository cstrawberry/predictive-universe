import PureSFormal.PureS.Dispatcher
import PureSFormal.PureS.Activation
import PureSFormal.PureS.Arity

/-!
# Mutation-closed activated-route grammar

This module formalizes the syntax of equations (8) and (8a).  It is a
semantic grammar, not the executable arity parser or the reduction
script which constructs a fresh route.

Every audit argument below is a separate constructor argument.  In
particular, the grammar never requires the audits at two route levels, or the
audit of a dormant sibling and an activated child, to be equal.
-/

namespace PureSFormal.PureS

namespace RouteGrammar

/-- A compiled wrapped dispatcher subtree applied to an arbitrary audit. -/
def compiledCall {Label : Type u}
    (encode : Label → Term) (tree : Dispatcher.Tree Label) (audit : Term) : Term :=
  .app (compileDispatcher encode tree) audit

/-- The selected-left node alternative from (8a). -/
def selectedLeft (outerAudit activatedChild dormantRight : Term) : Term :=
  chosen outerAudit (.app activatedChild dormantRight)

/-- The selected-right node alternative from (8a). -/
def selectedRight (outerAudit dormantLeft activatedChild : Term) : Term :=
  chosen outerAudit (.app dormantLeft activatedChild)

@[simp]
theorem compiledCall_headArity {Label : Type u}
    (encode : Label → Term) (tree : Dispatcher.Tree Label) (audit : Term) :
    (compiledCall encode tree audit).headArity = 3 := by
  cases tree <;> rfl

/--
The mutation-closed skeleton relation keyed by the selected root-to-leaf
route.  `response` is the final selected action response `Y`; `result` is the
complete activated-route term.

The leaf audit, each node's outer audit, and every dormant-call audit are
independent terms.  Recursive evidence contains fresh independent audits at
all lower route levels.
-/
inductive ActivatedRoute {Label : Type u} (encode : Label → Term) :
    Dispatcher.Tree Label → Dispatcher.Route → Label → Term → Term → Prop where
  | leaf (label : Label) (audit response : Term) :
      ActivatedRoute encode (.leaf label) [] label response
        (chosen audit response)
  | left
      {left right : Dispatcher.Tree Label}
      {route : Dispatcher.Route} {label : Label}
      {response activatedChild : Term}
      (outerAudit dormantAudit : Term)
      (inner : ActivatedRoute encode left route label response activatedChild) :
      ActivatedRoute encode (.node left right) (.left :: route) label response
        (selectedLeft outerAudit activatedChild
          (compiledCall encode right dormantAudit))
  | right
      {left right : Dispatcher.Tree Label}
      {route : Dispatcher.Route} {label : Label}
      {response activatedChild : Term}
      (outerAudit dormantAudit : Term)
      (inner : ActivatedRoute encode right route label response activatedChild) :
      ActivatedRoute encode (.node left right) (.right :: route) label response
        (selectedRight outerAudit (compiledCall encode left dormantAudit)
          activatedChild)

namespace ActivatedRoute

/-- Every accepted skeleton is indexed by an actual structural leaf route. -/
theorem hasRoute
    {Label : Type u} {encode : Label → Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    {response result : Term}
    (h : ActivatedRoute encode tree route label response result) :
    Dispatcher.HasRoute tree route label := by
  induction h with
  | leaf => exact .leaf _
  | left outerAudit dormantAudit inner ih => exact .left ih
  | right outerAudit dormantAudit inner ih => exact .right ih

/-- The selected route fixes its leaf label independently of all audit terms. -/
theorem label_deterministic
    {Label : Type u} {encode : Label → Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route}
    {label₁ label₂ : Label} {response₁ response₂ result₁ result₂ : Term}
    (h₁ : ActivatedRoute encode tree route label₁ response₁ result₁)
    (h₂ : ActivatedRoute encode tree route label₂ response₂ result₂) :
    label₁ = label₂ :=
  h₁.hasRoute.deterministic h₂.hasRoute

/-- Every activated-route skeleton retains the outer `Chosen` syntax. -/
theorem result_headArity
    {Label : Type u} {encode : Label → Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    {response result : Term}
    (h : ActivatedRoute encode tree route label response result) :
    result.headArity = 2 := by
  cases h <;> rfl

/-- An activated route cannot equal any compiled dormant sibling call. -/
theorem result_ne_compiledCall
    {Label : Type u} {encode : Label → Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    {response result : Term}
    (h : ActivatedRoute encode tree route label response result)
    (dormantTree : Dispatcher.Tree Label) (audit : Term) :
    result ≠ compiledCall encode dormantTree audit := by
  intro heq
  have harity := congrArg Term.headArity heq
  rw [h.result_headArity, compiledCall_headArity] at harity
  cases harity

end ActivatedRoute

/-- A left-prefixed selected route is never a right-prefixed route. -/
theorem leftRoute_ne_rightRoute
    (leftRoute rightRoute : Dispatcher.Route) :
    (.left :: leftRoute) ≠ (.right :: rightRoute) := by
  intro h
  cases h

/--
The two node alternatives have disjoint outer syntax.  Injectivity of
application exposes an activated child on the left of one fork and a compiled
dormant call on the left of the other; their head arities are respectively
two and three.
-/
theorem selectedLeft_ne_selectedRight
    {Label : Type u} {encode : Label → Term}
    {left right : Dispatcher.Tree Label}
    {leftRoute : Dispatcher.Route}
    {leftLabel : Label}
    {leftResponse leftChild rightChild : Term}
    (hleft : ActivatedRoute encode left leftRoute leftLabel leftResponse leftChild)
    (leftOuterAudit leftDormantAudit rightOuterAudit rightDormantAudit : Term) :
    selectedLeft leftOuterAudit leftChild
        (compiledCall encode right leftDormantAudit) ≠
      selectedRight rightOuterAudit
        (compiledCall encode left rightDormantAudit) rightChild := by
  intro heq
  unfold selectedLeft selectedRight chosen at heq
  injection heq with _ hchildren
  injection hchildren with hactive _
  exact hleft.result_ne_compiledCall left rightDormantAudit hactive

/--
At a dispatcher node, left- and right-selected skeletons differ both in their
route direction and in the resulting pure-`S` syntax.
-/
theorem nodeAlternatives_disjoint
    {Label : Type u} {encode : Label → Term}
    {left right : Dispatcher.Tree Label}
    {leftRoute rightRoute : Dispatcher.Route}
    {leftLabel rightLabel : Label}
    {leftResponse rightResponse leftResult rightResult : Term}
    (hleft : ActivatedRoute encode (.node left right) (.left :: leftRoute)
      leftLabel leftResponse leftResult)
    (hright : ActivatedRoute encode (.node left right) (.right :: rightRoute)
      rightLabel rightResponse rightResult) :
    (.left :: leftRoute) ≠ (.right :: rightRoute) ∧ leftResult ≠ rightResult := by
  constructor
  · exact leftRoute_ne_rightRoute leftRoute rightRoute
  · cases hleft with
    | left leftOuterAudit leftDormantAudit leftInner =>
        cases hright with
        | right rightOuterAudit rightDormantAudit rightInner =>
            exact selectedLeft_ne_selectedRight leftInner
              leftOuterAudit leftDormantAudit rightOuterAudit rightDormantAudit

end RouteGrammar

end PureSFormal.PureS
