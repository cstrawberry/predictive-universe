import PureSFormal.PureS.Activation
import PureSFormal.CTS.Core

/-!
# Finite CTS actions

For a finite cyclic-tag program, an action is selected by a phase and the
deleted front bit.  The zero action is `p`; the one action is the exact
appender for the current phase.  Results retain both the canonical
accumulator and every push history as literal syntax.
-/

namespace PureSFormal.PureS

/-- The finite action alphabet: a program phase paired with a binary symbol. -/
abbrev ActionLabel (program : CTS.Program) :=
  CTS.Phase program × Bool

/-- The action selected by a phase/bit leaf. -/
def selectedAction (program : CTS.Program) : ActionLabel program → Term
  | (_, false) => p
  | (phase, true) => appender (program.appendant phase)

@[simp] theorem selectedAction_zero (program : CTS.Program)
    (phase : CTS.Phase program) :
    selectedAction program (phase, false) = p :=
  rfl

@[simp] theorem selectedAction_one (program : CTS.Program)
    (phase : CTS.Phase program) :
    selectedAction program (phase, true) =
      appender (program.appendant phase) :=
  rfl

/-- A selected action behind the activation wrapper of its dispatcher leaf. -/
def actionLeaf (program : CTS.Program) (label : ActionLabel program) : Term :=
  leafCode (selectedAction program label)

@[simp] theorem actionLeaf_zero (program : CTS.Program)
    (phase : CTS.Phase program) :
    actionLeaf program (phase, false) = leafCode p :=
  rfl

@[simp] theorem actionLeaf_one (program : CTS.Program)
    (phase : CTS.Phase program) :
    actionLeaf program (phase, true) =
      leafCode (appender (program.appendant phase)) :=
  rfl

/-- Structurally wrap a finite dispatcher whose leaves are CTS actions. -/
def compileActions (program : CTS.Program) :
    Dispatcher.Tree (ActionLabel program) → Term :=
  compileDispatcher (selectedAction program)

@[simp] theorem compileActions_leaf (program : CTS.Program)
    (label : ActionLabel program) :
    compileActions program (.leaf label) = actionLeaf program label :=
  rfl

@[simp] theorem compileActions_node (program : CTS.Program)
    (left right : Dispatcher.Tree (ActionLabel program)) :
    compileActions program (.node left right) =
      nodeCode (compileActions program left) (compileActions program right) :=
  rfl

/-- Activating any compiled action leaf takes exactly one contraction. -/
theorem actionLeaf_activate (program : CTS.Program)
    (label : ActionLabel program) (carrier : Term) :
    StepsN 1 (.app (actionLeaf program label) carrier)
      (chosen carrier (.app (selectedAction program label) carrier)) :=
  leafCode_activate (selectedAction program label) carrier

/-- The accumulator selected by an action before histories are attached. -/
def actionAccumulator (program : CTS.Program) :
    ActionLabel program → Term → Term
  | (_, false), initial => initial
  | (phase, true), initial =>
      appenderAccumulator (program.appendant phase) initial

/-- Every retained push history, in its final literal argument order. -/
def actionHistories (program : CTS.Program) :
    ActionLabel program → Term → List Term
  | (_, false), _ => []
  | (phase, true), initial =>
      retainedHistories (program.appendant phase) initial

/--
The complete selected-action endpoint: a `p` spine containing the explicit
accumulator followed by every retained history argument.
-/
def actionResult (program : CTS.Program) (label : ActionLabel program)
    (initial : Term) : Term :=
  Term.applyArgs (.app p (actionAccumulator program label initial))
    (actionHistories program label initial)

@[simp] theorem actionAccumulator_zero (program : CTS.Program)
    (phase : CTS.Phase program) (initial : Term) :
    actionAccumulator program (phase, false) initial = initial :=
  rfl

@[simp] theorem actionAccumulator_one (program : CTS.Program)
    (phase : CTS.Phase program) (initial : Term) :
    actionAccumulator program (phase, true) initial =
      appenderAccumulator (program.appendant phase) initial :=
  rfl

@[simp] theorem actionHistories_zero (program : CTS.Program)
    (phase : CTS.Phase program) (initial : Term) :
    actionHistories program (phase, false) initial = [] :=
  rfl

@[simp] theorem actionHistories_one (program : CTS.Program)
    (phase : CTS.Phase program) (initial : Term) :
    actionHistories program (phase, true) initial =
      retainedHistories (program.appendant phase) initial :=
  rfl

@[simp] theorem actionResult_zero (program : CTS.Program)
    (phase : CTS.Phase program) (initial : Term) :
    actionResult program (phase, false) initial = .app p initial :=
  rfl

@[simp] theorem actionResult_one (program : CTS.Program)
    (phase : CTS.Phase program) (initial : Term) :
    actionResult program (phase, true) initial =
      appenderResult (program.appendant phase) initial :=
  rfl

/-- The exact number of contractions performed by a selected action. -/
def actionCost (program : CTS.Program) : ActionLabel program → Nat
  | (_, false) => 0
  | (phase, true) => 2 * (program.appendant phase).length

@[simp] theorem actionCost_zero (program : CTS.Program)
    (phase : CTS.Phase program) :
    actionCost program (phase, false) = 0 :=
  rfl

@[simp] theorem actionCost_one (program : CTS.Program)
    (phase : CTS.Phase program) :
    actionCost program (phase, true) =
      2 * (program.appendant phase).length :=
  rfl

/-- A zero action performs no contraction and preserves its accumulator. -/
theorem executeAction_zero (program : CTS.Program)
    (phase : CTS.Phase program) (initial : Term) :
    StepsN 0 (.app (selectedAction program (phase, false)) initial)
      (actionResult program (phase, false) initial) :=
  StepsN.refl _

/--
A one action performs exactly two contractions per appendant bit and reaches
the fully explicit appender endpoint.
-/
theorem executeAction_one (program : CTS.Program)
    (phase : CTS.Phase program) (initial : Term) :
    StepsN (2 * (program.appendant phase).length)
      (.app (selectedAction program (phase, true)) initial)
      (actionResult program (phase, true) initial) := by
  simpa using C6_appender (program.appendant phase) initial

/-- Exact execution uniformly over the finite action alphabet. -/
theorem executeAction (program : CTS.Program)
    (label : ActionLabel program) (initial : Term) :
    StepsN (actionCost program label)
      (.app (selectedAction program label) initial)
      (actionResult program label initial) := by
  rcases label with ⟨phase, bit⟩
  cases bit with
  | false => exact executeAction_zero program phase initial
  | true => exact executeAction_one program phase initial

end PureSFormal.PureS
