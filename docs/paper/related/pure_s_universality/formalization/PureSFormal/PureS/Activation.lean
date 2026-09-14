import PureSFormal.PureS.Appender
import PureSFormal.PureS.Dispatcher

namespace PureSFormal.PureS

/-! The wrapped codes used at leaves and internal dispatcher nodes. -/

def leafCode (function : Term) : Term :=
  .app b function

def chosen (carrier response : Term) : Term :=
  .app (.app .s carrier) response

def fork (left right : Term) : Term :=
  .app (.app .s left) right

def nodeCode (left right : Term) : Term :=
  .app b (fork left right)

/-! A dispatcher tree is compiled by wrapping every leaf and every internal fork. -/

def compileDispatcher {Label : Type u} (encode : Label → Term) :
    Dispatcher.Tree Label → Term
  | .leaf label => leafCode (encode label)
  | .node left right =>
      nodeCode (compileDispatcher encode left) (compileDispatcher encode right)

@[simp] theorem compileDispatcher_leaf {Label : Type u}
    (encode : Label → Term) (label : Label) :
    compileDispatcher encode (.leaf label) = leafCode (encode label) :=
  rfl

@[simp] theorem compileDispatcher_node {Label : Type u}
    (encode : Label → Term) (left right : Dispatcher.Tree Label) :
    compileDispatcher encode (.node left right) =
      nodeCode (compileDispatcher encode left) (compileDispatcher encode right) :=
  rfl

/-! Equation (3): activating a wrapped leaf takes exactly one contraction. -/

theorem leafCode_activate (function carrier : Term) :
    StepsN 1 (.app (leafCode function) carrier)
      (chosen carrier (.app function carrier)) := by
  apply StepsN.single
  simpa [leafCode, chosen, b, Term.redex, Term.contractum] using
    Step.root (.s : Term) function carrier

/-!
Equation (5): the wrapper contracts first, then the exposed fork contracts under
the chosen carrier, for a total of exactly two contractions.
-/

theorem nodeCode_expose (left right carrier : Term) :
    StepsN 1 (.app (nodeCode left right) carrier)
      (chosen carrier (.app (fork left right) carrier)) := by
  apply StepsN.single
  simpa [nodeCode, chosen, b, Term.redex, Term.contractum] using
    Step.root (.s : Term) (fork left right) carrier

theorem nodeCode_activate (left right carrier : Term) :
    StepsN 2 (.app (nodeCode left right) carrier)
      (chosen carrier
        (.app (.app left carrier) (.app right carrier))) := by
  apply StepsN.tail (nodeCode_expose left right carrier)
  simpa [chosen, fork, Term.redex, Term.contractum] using
    Step.appRight (.app .s carrier) (Step.root left right carrier)

end PureSFormal.PureS
