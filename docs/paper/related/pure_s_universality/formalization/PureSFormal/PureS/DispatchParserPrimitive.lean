import PureSFormal.PureS.ParserRoutePrimitive
import PureSFormal.PureS.ParserActionPrimitive
import PureSFormal.PureS.DispatchParser

/-!
# Primitive completed-dispatch parsing

The prepared grammar stores dormant code terms and unary history counts.
A first traversal validates the route. A second traversal reads its response
and its stored history count. The selected-action parser then checks that
response. Preparation depends only on the fixed program and dispatcher;
input traversal performs no program lookup or construction of expected code.
-/

namespace PureSFormal.PureS.DispatchParserPrimitive

open ParserPrimitiveMachine
open ParserRoutePrimitive (andThen charge andThen_value andThen_operations_le)

def prepareCounts (count : Label → Nat) : Dispatcher.Tree Label → Dispatcher.Tree Nat
  | .leaf label => .leaf (count label)
  | .node left right => .node (prepareCounts count left) (prepareCounts count right)

def responseAt : Dispatcher.Tree Nat → Dispatcher.Route → Term → Result (Option (Nat × Term))
  | .leaf count, [], term =>
      charge 3 (andThen (ParserRouteShellPrimitive.chosen term) fun fields =>
        ⟨some (count, fields.response), 4⟩)
  | .leaf _, _ :: _, _ => ⟨none, 4⟩
  | .node _ _, [], _ => ⟨none, 3⟩
  | .node left _, .left :: rest, term =>
      charge 8 (andThen (ParserRouteShellPrimitive.selectedNode term) fun fields =>
        responseAt left rest fields.leftChild)
  | .node _ right, .right :: rest, term =>
      charge 8 (andThen (ParserRouteShellPrimitive.selectedNode term) fun fields =>
        responseAt right rest fields.rightChild)

def responseBound : Dispatcher.Tree Nat → Nat
  | .leaf _ => 18
  | .node left right => 22 + responseBound left + responseBound right

theorem responseAt_operations_le (tree : Dispatcher.Tree Nat) (route : Dispatcher.Route)
    (term : Term) : (responseAt tree route term).operations ≤ responseBound tree := by
  induction tree generalizing route term with
  | leaf count =>
      cases route with
      | nil =>
          have counted := andThen_operations_le (ParserRouteShellPrimitive.chosen term)
            (fun fields => ⟨some (count, fields.response), 4⟩) 4 (fun _ _ => Nat.le_refl _)
          have bounded := Nat.le_trans counted
            (Nat.add_le_add_right
              (Nat.add_le_add_right (ParserRouteShellPrimitive.chosen_operations_le term) 2) 4)
          exact Nat.add_le_add_left bounded 3
      | cons direction rest => exact (by decide : 4 ≤ 18)
  | node left right leftIH rightIH =>
      cases route with
      | nil =>
          exact Nat.le_trans (by decide : 3 ≤ 22)
            (Nat.le_trans (Nat.le_add_right _ _) (Nat.le_add_right _ _))
      | cons direction rest =>
          cases direction with
          | left =>
              have counted := andThen_operations_le (ParserRouteShellPrimitive.selectedNode term)
                (fun fields => responseAt left rest fields.leftChild) (responseBound left)
                (fun fields _ => leftIH rest fields.leftChild)
              have bounded := Nat.le_trans counted
                (Nat.add_le_add_right
                  (Nat.add_le_add_right (ParserRouteShellPrimitive.selectedNode_operations_le term) 2) _)
              have total := Nat.add_le_add_left bounded 8
              apply Nat.le_trans total
              simpa only [responseBound, show 22 = 8 + 12 + 2 by rfl, Nat.add_assoc] using
                Nat.le_add_right (22 + responseBound left) (responseBound right)
          | right =>
              have counted := andThen_operations_le (ParserRouteShellPrimitive.selectedNode term)
                (fun fields => responseAt right rest fields.rightChild) (responseBound right)
                (fun fields _ => rightIH rest fields.rightChild)
              have bounded := Nat.le_trans counted
                (Nat.add_le_add_right
                  (Nat.add_le_add_right (ParserRouteShellPrimitive.selectedNode_operations_le term) 2) _)
              have total := Nat.add_le_add_left bounded 8
              apply Nat.le_trans total
              simpa only [responseBound, show 22 = 8 + 12 + 2 by rfl,
                Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using
                Nat.le_add_right (8 + (12 + 2 + responseBound right)) (responseBound left)

theorem chosen_response_size {term : Term} {fields : RouteParser.ChosenView}
    (parsed : (ParserRouteShellPrimitive.chosen term).value = some fields) :
    fields.response.size ≤ term.size := by
  have shape := RouteParser.unpackChosen?_sound
    ((ParserRouteShellPrimitive.chosen_value term).symm.trans parsed)
  rw [shape]
  exact Nat.le_trans (Nat.le_add_left _ _) (Nat.le_add_right _ 1)

theorem responseAt_size {tree : Dispatcher.Tree Nat} {route : Dispatcher.Route}
    {term : Term} {count : Nat} {response : Term}
    (parsed : (responseAt tree route term).value = some (count, response)) :
    response.size ≤ term.size := by
  induction tree generalizing route term count response with
  | leaf stored =>
      cases route with
      | nil =>
          change (andThen (ParserRouteShellPrimitive.chosen term) _).value = _ at parsed
          rw [andThen_value] at parsed
          cases h : (ParserRouteShellPrimitive.chosen term).value with
          | none => rw [h] at parsed; cases parsed
          | some fields =>
              rw [h] at parsed
              have same : (stored, fields.response) = (count, response) := Option.some.inj parsed
              have responseSame := congrArg Prod.snd same
              change fields.response = response at responseSame
              rw [← responseSame]
              exact chosen_response_size h
      | cons direction rest => cases parsed
  | node left right leftIH rightIH =>
      cases route with
      | nil => cases parsed
      | cons direction rest =>
          cases direction with
          | left =>
              change (andThen (ParserRouteShellPrimitive.selectedNode term) _).value = _ at parsed
              rw [andThen_value] at parsed
              cases h : (ParserRouteShellPrimitive.selectedNode term).value with
              | none => rw [h] at parsed; cases parsed
              | some fields =>
                  rw [h] at parsed
                  exact Nat.le_trans (leftIH parsed) (ParserRoutePrimitive.selectedNode_sizes h).1
          | right =>
              change (andThen (ParserRouteShellPrimitive.selectedNode term) _).value = _ at parsed
              rw [andThen_value] at parsed
              cases h : (ParserRouteShellPrimitive.selectedNode term).value with
              | none => rw [h] at parsed; cases parsed
              | some fields =>
                  rw [h] at parsed
                  exact Nat.le_trans (rightIH parsed) (ParserRoutePrimitive.selectedNode_sizes h).2

theorem responseAt_complete {Label : Type} {encode : Label → Term}
    (count : Label → Nat) {tree : Dispatcher.Tree Label} {route : Dispatcher.Route}
    {label : Label} {response result : Term}
    (shape : RouteGrammar.ActivatedRoute encode tree route label response result) :
    (responseAt (prepareCounts count tree) route result).value = some (count label, response) := by
  induction shape with
  | leaf label audit response => rfl
  | @left left right route label response active outerAudit dormantAudit inner ih =>
      exact ih
  | @right left right route label response active outerAudit dormantAudit inner ih =>
      exact ih

def parsePrepared (program : CTS.Program)
    (grammar : ParserRoutePrimitive.Grammar (ActionLabel program))
    (counts : Dispatcher.Tree Nat) (term : Term) : Result (Option (DispatchParser.ParsedDispatch program)) :=
  andThen (ParserRoutePrimitive.parse grammar term) fun (route, label) =>
    charge 3 (andThen (responseAt counts route term) fun (count, response) =>
      charge 3 (andThen (ParserActionPrimitive.parse count response) fun action =>
        ⟨some ⟨route, label, action.accumulator⟩, 4⟩))

def parse (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : Result (Option (DispatchParser.ParsedDispatch program)) :=
  parsePrepared program (ParserRoutePrimitive.prepare (selectedAction program) tree)
    (prepareCounts (ActionParser.historyCount program) tree) term

theorem parse_value (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : (parse program tree term).value = DispatchParser.parse program tree term := by
  change (andThen (ParserRoutePrimitive.parse _ term) _).value = _
  rw [andThen_value, ParserRoutePrimitive.parse_value]
  unfold DispatchParser.parse DispatchParser.parseRouteDetailed
  cases routeParsed : RouteParser.parse (selectedAction program) tree term with
  | none => rfl
  | some pair =>
      cases pair with
      | mk route label =>
          obtain ⟨response, shape⟩ := RouteParser.parse_sound routeParsed
          dsimp only [Option.bind]
          rw [DispatchParser.responseAt?_complete shape]
          dsimp only [Option.bind]
          change (andThen (responseAt _ route term) _).value = _
          rw [andThen_value, responseAt_complete _ shape]
          change (andThen (ParserActionPrimitive.parse (ActionParser.historyCount program label) response) _).value = _
          rw [andThen_value, ParserActionPrimitive.parse_program_value]
          cases ActionParser.parse program label response <;> rfl

def coefficient (grammar : ParserRoutePrimitive.Grammar (ActionLabel program))
    (counts : Dispatcher.Tree Nat) : Nat :=
  ParserRoutePrimitive.coefficient grammar + responseBound counts + 52

theorem parsePrepared_operations_le (program : CTS.Program)
    (grammar : ParserRoutePrimitive.Grammar (ActionLabel program))
    (counts : Dispatcher.Tree Nat) (term : Term) :
    (parsePrepared program grammar counts term).operations ≤
      coefficient grammar counts * (term.size + 1) := by
  let actionBound := 36 * (term.size + 1)
  let responseWork := responseBound counts
  have nextBound (pair : Dispatcher.Route × ActionLabel program) :
      (charge 3 (andThen (responseAt counts pair.1 term) fun (count, response) =>
        charge 3 (andThen (ParserActionPrimitive.parse count response) fun action =>
          ⟨some (DispatchParser.ParsedDispatch.mk pair.1 pair.2 action.accumulator), 4⟩))).operations ≤
        3 + (responseWork + 2 + (3 + (actionBound + 2 + 4))) := by
    have actionWork (entry : Nat × Term)
        (accepted : (responseAt counts pair.1 term).value = some entry) :
        (charge 3 (andThen (ParserActionPrimitive.parse entry.1 entry.2) fun action =>
          ⟨some (DispatchParser.ParsedDispatch.mk pair.1 pair.2 action.accumulator), 4⟩)).operations ≤
            3 + (actionBound + 2 + 4) := by
      have responseSize := responseAt_size accepted
      have actionSize := Nat.le_trans (ParserActionPrimitive.parse_operations_le entry.1 entry.2)
        (Nat.mul_le_mul_left 36 (Nat.add_le_add_right responseSize 1))
      have counted := andThen_operations_le (ParserActionPrimitive.parse entry.1 entry.2)
        (fun action => ⟨some (DispatchParser.ParsedDispatch.mk pair.1 pair.2 action.accumulator), 4⟩)
        4 (fun _ _ => Nat.le_refl _)
      exact Nat.add_le_add_left
        (Nat.le_trans counted (Nat.add_le_add_right (Nat.add_le_add_right actionSize 2) 4)) 3
    have counted := andThen_operations_le (responseAt counts pair.1 term) _
      (3 + (actionBound + 2 + 4)) actionWork
    exact Nat.add_le_add_left
      (Nat.le_trans counted
        (Nat.add_le_add_right
          (Nat.add_le_add_right (responseAt_operations_le counts pair.1 term) 2) _)) 3
  have counted := andThen_operations_le (ParserRoutePrimitive.parse grammar term) _
    (3 + (responseWork + 2 + (3 + (actionBound + 2 + 4)))) (fun pair _ => nextBound pair)
  have bounded := Nat.le_trans counted
    (Nat.add_le_add_right
      (Nat.add_le_add_right (ParserRoutePrimitive.parse_operations_le grammar term) 2) _)
  apply Nat.le_trans bounded
  have scaled := Nat.add_le_add
    (Nat.le_refl (ParserRoutePrimitive.coefficient grammar * (term.size + 1)))
    (Nat.add_le_add (ParserRoutePrimitive.constant_le_scale responseWork term.size)
      (Nat.add_le_add (Nat.le_refl actionBound) (ParserRoutePrimitive.constant_le_scale 16 term.size)))
  simpa only [coefficient, actionBound, responseWork, show 52 = 36 + 16 by rfl,
    show 16 = 2 + 3 + 2 + 3 + 2 + 4 by rfl,
    Nat.add_mul, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using scaled

theorem parse_operations_le (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (term : Term) :
    (parse program tree term).operations ≤
      coefficient (ParserRoutePrimitive.prepare (selectedAction program) tree)
        (prepareCounts (ActionParser.historyCount program) tree) * (term.size + 1) :=
  parsePrepared_operations_le program _ _ term

end PureSFormal.PureS.DispatchParserPrimitive
