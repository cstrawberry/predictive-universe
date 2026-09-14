import PureSFormal.PureS.ParserPrimitiveMachine
import PureSFormal.PureS.RouteParser

/-!
# Primitive observations of dispatcher-route shells

The shell observations inspect only their displayed constructors and return
payloads by reference. Exact arity tests use a precompiled bounded pattern;
they stop after the requested number of left edges. Dormant-call comparison
uses a precompiled code term and short-circuit structural equality.
-/

namespace PureSFormal.PureS.ParserRouteShellPrimitive

open ParserPrimitiveMachine

def chosen : Term → Result (Option RouteParser.ChosenView)
  | .s => ⟨none, 2⟩
  | .app .s _ => ⟨none, 5⟩
  | .app (.app .s audit) response => ⟨some ⟨audit, response⟩, 9⟩
  | .app (.app (.app _ _) _) _ => ⟨none, 8⟩

theorem chosen_value (term : Term) :
    (chosen term).value = RouteParser.unpackChosen? term := by
  fun_cases chosen term <;> rfl

theorem chosen_operations_le (term : Term) : (chosen term).operations ≤ 9 := by
  fun_cases chosen term <;> simp [chosen]

def selectedNode : Term → Result (Option RouteParser.NodeView)
  | .s => ⟨none, 2⟩
  | .app .s _ => ⟨none, 5⟩
  | .app (.app (.app _ _) _) _ => ⟨none, 8⟩
  | .app (.app .s _) .s => ⟨none, 9⟩
  | .app (.app .s audit) (.app left right) => ⟨some ⟨audit, left, right⟩, 12⟩

theorem selectedNode_value (term : Term) :
    (selectedNode term).value = RouteParser.unpackSelectedNode? term := by
  fun_cases selectedNode term <;> rfl

theorem selectedNode_operations_le (term : Term) :
    (selectedNode term).operations ≤ 12 := by
  fun_cases selectedNode term <;> simp [selectedNode]

/-- Compile the bounded shape once; every right argument is an independent hole. -/
def arityPattern : Nat → Pattern
  | 0 => .s
  | .succ count => .app (arityPattern count) .hole

theorem arityPattern_size (expected : Nat) :
    (arityPattern expected).size = 2 * expected + 1 := by
  induction expected with
  | zero => rfl
  | succ expected ih =>
      simp only [arityPattern, Pattern.size, ih, Nat.succ_eq_add_one,
        Nat.mul_add, Nat.mul_one]

theorem arityPattern_value (expected : Nat) (term : Term) :
    (arityPattern expected).matchesBool term = Term.exactHeadArity term expected := by
  induction expected generalizing term with
  | zero => cases term <;> rfl
  | succ expected ih =>
      cases term with
      | s => rfl
      | app fn arg =>
          simpa only [arityPattern, Pattern.matchesBool, Bool.and_true,
            Term.exactHeadArity, Term.headArity, Nat.succ.injEq] using ih fn

def arity (expected : Nat) (term : Term) : Result Bool :=
  pattern (arityPattern expected) term

theorem arity_value (expected : Nat) (term : Term) :
    (arity expected term).value = Term.exactHeadArity term expected :=
  (pattern_value _ _).trans (arityPattern_value expected term)

theorem arity_operations_le (expected : Nat) (term : Term) :
    (arity expected term).operations ≤ 4 * (2 * expected + 1) := by
  simpa only [arity, arityPattern_size] using pattern_operations_le (arityPattern expected) term

def dormant (expected : Term) : Term → Result (Option Term)
  | .s => ⟨none, 2⟩
  | .app code audit =>
      let compared := equal code expected
      if compared.value then ⟨some audit, 5 + compared.operations⟩
      else ⟨none, 5 + compared.operations⟩

theorem dormant_value {Label : Type} (encode : Label → Term)
    (tree : Dispatcher.Tree Label) (term : Term) :
    (dormant (compileDispatcher encode tree) term).value =
      RouteParser.compiledCallAudit? encode tree term := by
  cases term with
  | s => rfl
  | app code audit =>
      simp only [dormant, RouteParser.compiledCallAudit?, equal_value]
      split <;> rfl

theorem dormant_operations_le (expected term : Term) :
    (dormant expected term).operations ≤ 5 + 4 * (term.size + expected.size) := by
  cases term with
  | s => exact Nat.le_trans (by decide : 2 ≤ 5) (Nat.le_add_right _ _)
  | app code audit =>
      have sizeBound : code.size ≤ (Term.app code audit).size :=
        Nat.le_trans (Nat.le_add_right _ _) (Nat.le_add_right _ 1)
      have compared := Nat.le_trans (equal_operations_le code expected)
        (Nat.mul_le_mul_left 4 (Nat.add_le_add_right sizeBound expected.size))
      simp only [dormant]
      split <;> exact Nat.add_le_add_left compared 5

def classify (left right : Term) : Result (Option RouteParser.SelectedBranch) :=
  let leftTwo := arity 2 left
  let rightThree := arity 3 right
  if leftTwo.value && rightThree.value then
    ⟨some .left, leftTwo.operations + rightThree.operations + 3⟩
  else
    let leftThree := arity 3 left
    let rightTwo := arity 2 right
    if leftThree.value && rightTwo.value then
      ⟨some .right, leftTwo.operations + rightThree.operations +
        leftThree.operations + rightTwo.operations + 5⟩
    else
      ⟨none, leftTwo.operations + rightThree.operations +
        leftThree.operations + rightTwo.operations + 5⟩

theorem classify_value (left right : Term) :
    (classify left right).value = RouteParser.classifyChildren left right := by
  simp only [classify, RouteParser.classifyChildren, arity_value]
  split <;> first | rfl | (split <;> rfl)

theorem classify_operations_le (left right : Term) :
    (classify left right).operations ≤ 101 := by
  have first : (arity 2 left).operations + (arity 3 right).operations ≤ 48 :=
    Nat.add_le_add (arity_operations_le 2 left) (arity_operations_le 3 right)
  have second : (arity 3 left).operations + (arity 2 right).operations ≤ 48 :=
    Nat.add_le_add (arity_operations_le 3 left) (arity_operations_le 2 right)
  have combined := Nat.add_le_add_right (Nat.add_le_add first second) 5
  simp only [classify]
  split
  · exact Nat.le_trans (Nat.add_le_add_right first 3) (by decide : 48 + 3 ≤ 101)
  · split <;>
      simpa only [Nat.add_assoc] using combined

end PureSFormal.PureS.ParserRouteShellPrimitive

