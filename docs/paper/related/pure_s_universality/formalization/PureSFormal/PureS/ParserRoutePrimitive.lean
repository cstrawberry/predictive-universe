import PureSFormal.PureS.ParserRouteShellPrimitive

/-!
# Primitive traversal of a prepared dispatcher grammar

Each grammar node stores its compiled code by reference. Grammar preparation
depends only on the fixed dispatcher. The input parser visits one selected
branch and compares the other branch with its stored code. Failed comparisons
and failed recursive calls retain all work already performed.

Option sequencing charges the constructor inspection and, on success, the
payload read. Returning a route charges its new list, pair, and option cells.
The resulting bound is linear in input tree size for every prepared grammar.
-/

namespace PureSFormal.PureS.ParserRoutePrimitive

open ParserPrimitiveMachine
namespace Shell
export ParserRouteShellPrimitive (chosen selectedNode classify dormant)
end Shell

def charge (count : Nat) (result : Result α) : Result α :=
  ⟨result.value, count + result.operations⟩

def andThen (first : Result (Option α))
    (next : α → Result (Option β)) : Result (Option β) :=
  match first.value with
  | none => ⟨none, first.operations + 1⟩
  | some value =>
      let second := next value
      ⟨second.value, first.operations + 2 + second.operations⟩

theorem andThen_operations_le (first : Result (Option α))
    (next : α → Result (Option β)) (bound : Nat)
    (bounded : ∀ value, first.value = some value → (next value).operations ≤ bound) :
    (andThen first next).operations ≤ first.operations + 2 + bound := by
  cases h : first.value with
  | none =>
      simp only [andThen, h]
      exact Nat.le_trans (Nat.add_le_add_left (by decide : 1 ≤ 2) _)
        (Nat.le_add_right _ _)
  | some value =>
      simp only [andThen, h]
      exact Nat.add_le_add_left (bounded value h) _

inductive Grammar (Label : Type) where
  | leaf (label : Label) (code : Term)
  | node (left right : Grammar Label) (code : Term)

def Grammar.code : Grammar Label → Term
  | .leaf _ code => code
  | .node _ _ code => code

def prepare (encode : Label → Term) : Dispatcher.Tree Label → Grammar Label
  | .leaf label => .leaf label (leafCode (encode label))
  | .node left right =>
      let preparedLeft := prepare encode left
      let preparedRight := prepare encode right
      .node preparedLeft preparedRight (nodeCode preparedLeft.code preparedRight.code)

theorem prepare_code (encode : Label → Term) (tree : Dispatcher.Tree Label) :
    (prepare encode tree).code = compileDispatcher encode tree := by
  induction tree with
  | leaf label => rfl
  | node left right leftIH rightIH =>
      change nodeCode (prepare encode left).code (prepare encode right).code = _
      rw [leftIH, rightIH]
      rfl

def parse : Grammar Label → Term → Result (Option (Dispatcher.Route × Label))
  | .leaf label _, term =>
      charge 2 (andThen (Shell.chosen term) fun _ => ⟨some ([], label), 4⟩)
  | .node left right _, term =>
      charge 8 (andThen (Shell.selectedNode term) fun fields =>
        andThen (Shell.classify fields.leftChild fields.rightChild) fun branch =>
          match branch with
          | .left =>
              andThen (parse left fields.leftChild) fun (route, label) =>
                andThen (Shell.dormant right.code fields.rightChild) fun _ =>
                  ⟨some (.left :: route, label), 3⟩
          | .right =>
              andThen (Shell.dormant left.code fields.leftChild) fun _ =>
                andThen (parse right fields.rightChild) fun (route, label) =>
                  ⟨some (.right :: route, label), 3⟩)

theorem chosen_guard (term : Term) :
    RouteParser.chosenPattern.matchesBool term = (RouteParser.unpackChosen? term).isSome := by
  fun_cases ParserRouteShellPrimitive.chosen term <;> rfl

theorem selectedNode_guard (term : Term) :
    RouteParser.selectedNodePattern.matchesBool term =
      (RouteParser.unpackSelectedNode? term).isSome := by
  fun_cases ParserRouteShellPrimitive.selectedNode term <;> rfl

theorem andThen_value (first : Result (Option α)) (next : α → Result (Option β)) :
    (andThen first next).value = first.value.bind (fun value => (next value).value) := by
  cases h : first.value <;> simp only [andThen, h, Option.bind]

theorem parse_value (encode : Label → Term) (tree : Dispatcher.Tree Label) (term : Term) :
    (parse (prepare encode tree) term).value = RouteParser.parse encode tree term := by
  induction tree generalizing term with
  | leaf label =>
      change (andThen (Shell.chosen term) _).value = _
      rw [andThen_value, ParserRouteShellPrimitive.chosen_value,
        RouteParser.parse, chosen_guard]
      cases RouteParser.unpackChosen? term <;> rfl
  | node left right leftIH rightIH =>
      change (andThen (Shell.selectedNode term) _).value = _
      rw [andThen_value, ParserRouteShellPrimitive.selectedNode_value,
        RouteParser.parse, selectedNode_guard]
      cases RouteParser.unpackSelectedNode? term with
      | none => rfl
      | some fields =>
          simp only [Option.bind, Option.isSome, Bool.true_eq, ite_true]
          change (andThen (Shell.classify fields.leftChild fields.rightChild) _).value = _
          rw [andThen_value, ParserRouteShellPrimitive.classify_value]
          cases RouteParser.classifyChildren fields.leftChild fields.rightChild with
          | none => rfl
          | some branch =>
              cases branch with
              | left =>
                  dsimp only [Option.bind]
                  change (andThen (parse (prepare encode left) fields.leftChild) _).value = _
                  rw [andThen_value, leftIH]
                  cases RouteParser.parse encode left fields.leftChild with
                  | none => rfl
                  | some pair =>
                      cases pair with
                      | mk route label =>
                          dsimp only [Option.bind]
                          change (andThen (Shell.dormant (prepare encode right).code fields.rightChild) _).value = _
                          rw [andThen_value, prepare_code, ParserRouteShellPrimitive.dormant_value]
                          cases RouteParser.compiledCallAudit? encode right fields.rightChild <;> rfl
              | right =>
                  dsimp only [Option.bind]
                  change (andThen (Shell.dormant (prepare encode left).code fields.leftChild) _).value = _
                  rw [andThen_value, prepare_code, ParserRouteShellPrimitive.dormant_value]
                  cases RouteParser.compiledCallAudit? encode left fields.leftChild with
                  | none => rfl
                  | some audit =>
                      dsimp only [Option.bind]
                      change (andThen (parse (prepare encode right) fields.rightChild) _).value = _
                      rw [andThen_value, rightIH]
                      cases RouteParser.parse encode right fields.rightChild with
                      | none => rfl
                      | some pair => cases pair; rfl

def coefficient : Grammar Label → Nat
  | .leaf _ _ => 17
  | .node left right _ =>
      132 + coefficient left + coefficient right +
        (9 + 4 * left.code.size) + (9 + 4 * right.code.size)

theorem selectedNode_sizes {term : Term} {fields : RouteParser.NodeView}
    (parsed : (Shell.selectedNode term).value = some fields) :
    fields.leftChild.size ≤ term.size ∧ fields.rightChild.size ≤ term.size := by
  have shape := RouteParser.unpackSelectedNode?_sound
    ((ParserRouteShellPrimitive.selectedNode_value term).symm.trans parsed)
  rw [shape]
  have left : fields.leftChild.size ≤ (Term.app fields.leftChild fields.rightChild).size :=
    Nat.le_trans (Nat.le_add_right _ _) (Nat.le_add_right _ 1)
  have right : fields.rightChild.size ≤ (Term.app fields.leftChild fields.rightChild).size :=
    Nat.le_trans (Nat.le_add_left _ _) (Nat.le_add_right _ 1)
  have outer : (Term.app fields.leftChild fields.rightChild).size ≤
      (PureS.chosen fields.audit (.app fields.leftChild fields.rightChild)).size :=
    Nat.le_trans (Nat.le_add_left _ _) (Nat.le_add_right _ 1)
  exact ⟨Nat.le_trans left outer, Nat.le_trans right outer⟩

theorem constant_le_scale (constant size : Nat) : constant ≤ constant * (size + 1) := by
  simpa only [Nat.mul_one] using Nat.mul_le_mul_left constant (Nat.le_add_left 1 size)

theorem dormant_scaled (expected term : Term) (size : Nat) (bounded : term.size ≤ size) :
    (Shell.dormant expected term).operations ≤ (9 + 4 * expected.size) * (size + 1) := by
  have raw := Nat.le_trans (ParserRouteShellPrimitive.dormant_operations_le expected term)
    (Nat.add_le_add_left (Nat.mul_le_mul_left 4 (Nat.add_le_add_right bounded expected.size)) 5)
  have constant := constant_le_scale (5 + 4 * expected.size) size
  have growing := Nat.mul_le_mul_left 4 (Nat.le_add_right size 1)
  have combined := Nat.add_le_add constant growing
  apply Nat.le_trans raw
  simpa only [show 9 = 5 + 4 by rfl, Nat.add_mul, Nat.mul_add, Nat.mul_one, Nat.add_assoc, Nat.add_comm,
    Nat.add_left_comm] using combined

theorem parse_operations_le (grammar : Grammar Label) (term : Term) :
    (parse grammar term).operations ≤ coefficient grammar * (term.size + 1) := by
  induction grammar generalizing term with
  | leaf label code =>
      have counted := andThen_operations_le (Shell.chosen term)
        (fun _ => ⟨some (([] : Dispatcher.Route), label), 4⟩) 4 (fun _ _ => Nat.le_refl _)
      have bounded := Nat.le_trans counted
        (Nat.add_le_add_right
          (Nat.add_le_add_right (ParserRouteShellPrimitive.chosen_operations_le term) 2) 4)
      exact Nat.le_trans (Nat.add_le_add_left bounded 2) (constant_le_scale 17 term.size)
  | node left right code leftIH rightIH =>
      let leftBound := coefficient left * (term.size + 1)
      let rightBound := coefficient right * (term.size + 1)
      let leftDormant := (9 + 4 * left.code.size) * (term.size + 1)
      let rightDormant := (9 + 4 * right.code.size) * (term.size + 1)
      let branchBound := leftBound + rightBound + leftDormant + rightDormant + 7
      have fieldsBound (fields : RouteParser.NodeView)
          (accepted : (Shell.selectedNode term).value = some fields) :
          (andThen (Shell.classify fields.leftChild fields.rightChild) fun branch =>
            match branch with
            | .left => andThen (parse left fields.leftChild) fun (route, label) =>
                andThen (Shell.dormant right.code fields.rightChild) fun _ =>
                  ⟨some (.left :: route, label), 3⟩
            | .right => andThen (Shell.dormant left.code fields.leftChild) fun _ =>
                andThen (parse right fields.rightChild) fun (route, label) =>
                  ⟨some (.right :: route, label), 3⟩).operations ≤ 101 + 2 + branchBound := by
        obtain ⟨leftSize, rightSize⟩ := selectedNode_sizes accepted
        have leftWork : (parse left fields.leftChild).operations ≤ leftBound :=
          Nat.le_trans (leftIH fields.leftChild)
            (Nat.mul_le_mul_left _ (Nat.add_le_add_right leftSize 1))
        have rightWork : (parse right fields.rightChild).operations ≤ rightBound :=
          Nat.le_trans (rightIH fields.rightChild)
            (Nat.mul_le_mul_left _ (Nat.add_le_add_right rightSize 1))
        have leftComparison := dormant_scaled left.code fields.leftChild term.size leftSize
        have rightComparison := dormant_scaled right.code fields.rightChild term.size rightSize
        change (Shell.dormant left.code fields.leftChild).operations ≤ leftDormant at leftComparison
        change (Shell.dormant right.code fields.rightChild).operations ≤ rightDormant at rightComparison
        apply Nat.le_trans (andThen_operations_le _ _ branchBound ?_)
        · exact Nat.add_le_add_right
            (Nat.add_le_add_right
              (ParserRouteShellPrimitive.classify_operations_le _ _) 2) branchBound
        · intro branch classified
          cases branch with
          | left =>
              have inner (pair : Dispatcher.Route × Label) :
                  (andThen (Shell.dormant right.code fields.rightChild) fun _ =>
                    ⟨some (.left :: pair.1, pair.2), 3⟩).operations ≤ rightDormant + 2 + 3 :=
                Nat.le_trans (andThen_operations_le _ _ 3 (fun _ _ => Nat.le_refl _))
                  (Nat.add_le_add_right (Nat.add_le_add_right rightComparison 2) 3)
              have counted := andThen_operations_le (parse left fields.leftChild)
                (fun pair => andThen (Shell.dormant right.code fields.rightChild) fun _ =>
                  ⟨some (.left :: pair.1, pair.2), 3⟩)
                (rightDormant + 2 + 3) (fun pair _ => inner pair)
              have bounded := Nat.le_trans counted
                (Nat.add_le_add_right (Nat.add_le_add_right leftWork 2) _)
              apply Nat.le_trans bounded
              have extra := Nat.le_add_right (leftBound + 2 + (rightDormant + 2 + 3))
                (rightBound + leftDormant)
              simpa only [branchBound, show 7 = 2 + 2 + 3 by rfl,
                Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using extra
          | right =>
              have inner (audit : Term) :
                  (andThen (parse right fields.rightChild) fun pair =>
                    ⟨some (.right :: pair.1, pair.2), 3⟩).operations ≤ rightBound + 2 + 3 :=
                Nat.le_trans (andThen_operations_le _ _ 3 (fun _ _ => Nat.le_refl _))
                  (Nat.add_le_add_right (Nat.add_le_add_right rightWork 2) 3)
              have counted := andThen_operations_le (Shell.dormant left.code fields.leftChild)
                (fun _ => andThen (parse right fields.rightChild) fun pair =>
                  ⟨some (.right :: pair.1, pair.2), 3⟩)
                (rightBound + 2 + 3) (fun audit _ => inner audit)
              have bounded := Nat.le_trans counted
                (Nat.add_le_add_right (Nat.add_le_add_right leftComparison 2) _)
              apply Nat.le_trans bounded
              have extra := Nat.le_add_right (leftDormant + 2 + (rightBound + 2 + 3))
                (leftBound + rightDormant)
              simpa only [branchBound, show 7 = 2 + 2 + 3 by rfl,
                Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using extra
      have counted := andThen_operations_le (Shell.selectedNode term) _
        (101 + 2 + branchBound) fieldsBound
      have bounded := Nat.le_trans counted
        (Nat.add_le_add_right
          (Nat.add_le_add_right (ParserRouteShellPrimitive.selectedNode_operations_le term) 2) _)
      have total := Nat.add_le_add_left bounded 8
      change (parse (.node left right code) term).operations ≤ _ at total
      apply Nat.le_trans total
      have scaled := Nat.add_le_add_right
        (Nat.add_le_add_right
          (Nat.add_le_add_right
            (Nat.add_le_add_right (constant_le_scale 132 term.size) leftBound) rightBound)
              leftDormant) rightDormant
      simpa only [coefficient, branchBound, leftBound, rightBound, leftDormant,
        rightDormant, show 132 = 8 + 12 + 2 + 101 + 2 + 7 by rfl,
        Nat.add_mul, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using scaled

end PureSFormal.PureS.ParserRoutePrimitive
