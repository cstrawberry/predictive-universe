import PureSFormal.PureS.ParserRouteShellPrimitive
import PureSFormal.PureS.CheckpointDecoder

/-!
# Primitive halt-field and completed-local shell observations

The fresh halt code and marked halt tag are fixed grammar constants. Both
comparisons use counted short-circuit tree equality. Marked audit payloads
remain independent references; no audit equality or recursive audit inspection
is performed. The returned halt status agrees with the public checked parser
on arbitrary terms.
-/

namespace PureSFormal.PureS.ParserLocalShellPrimitive

open ParserPrimitiveMachine

def marked (field : Term) : Result (Option CheckpointDecoder.HaltStatus) :=
  let node := ParserRouteShellPrimitive.selectedNode field
  match node.value with
  | none => ⟨none, node.operations + 2⟩
  | some fields =>
      let tag := equal fields.leftChild haltTag
      if tag.value then
        ⟨some .marked, node.operations + tag.operations + 3⟩
      else
        ⟨none, node.operations + tag.operations + 3⟩

theorem marked_value (field : Term) :
    (marked field).value =
      match field with
      | .app (.app .s _) (.app tag _) => if tag = haltTag then some .marked else none
      | _ => none := by
  fun_cases ParserRouteShellPrimitive.selectedNode field <;>
    simp only [marked, ParserRouteShellPrimitive.selectedNode, equal_value] <;>
      first | rfl | (split <;> rfl)

theorem marked_tag_le {field : Term} {fields : RouteParser.NodeView}
    (found : (ParserRouteShellPrimitive.selectedNode field).value = some fields) :
    fields.leftChild.size ≤ field.size := by
  have shape := RouteParser.unpackSelectedNode?_sound
    ((ParserRouteShellPrimitive.selectedNode_value field).symm.trans found)
  rw [shape]
  exact Nat.le_trans (Nat.le_add_right _ _)
    (Nat.le_trans (Nat.le_add_right _ 1)
      (Nat.le_trans (Nat.le_add_left _ _) (Nat.le_add_right _ 1)))

theorem marked_operations_le (field : Term) :
    (marked field).operations ≤ 15 + 4 * (field.size + haltTag.size) := by
  have node := ParserRouteShellPrimitive.selectedNode_operations_le field
  unfold marked
  dsimp only
  split
  · exact Nat.le_trans (Nat.add_le_add_right node 2)
      (Nat.le_trans (by decide : 12 + 2 ≤ 15) (Nat.le_add_right _ _))
  · next fields found =>
      have tag := Nat.le_trans (equal_operations_le fields.leftChild haltTag)
        (Nat.mul_le_mul_left 4 (Nat.add_le_add_right (marked_tag_le found) _))
      have bound := Nat.add_le_add_right (Nat.add_le_add node tag) 3
      split <;> simpa only [show 15 = 12 + 3 by rfl,
        Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using bound

def halt : Term → Result (Option CheckpointDecoder.HaltStatus)
  | .s => ⟨none, 2⟩
  | field@(.app fn _audit) =>
      let fresh := equal fn haltCode
      if fresh.value then
        ⟨some .fresh, 3 + fresh.operations + 2⟩
      else
        let result := marked field
        ⟨result.value, 3 + fresh.operations + 1 + result.operations⟩

theorem halt_value (field : Term) :
    (halt field).value = (CheckpointDecoder.checkHalt? field).map
      CheckpointDecoder.CheckedHalt.status := by
  cases field with
  | s => rfl
  | app fn audit =>
      unfold halt CheckpointDecoder.checkHalt?
      simp only [equal_value]
      by_cases same : fn = haltCode
      · subst fn
        rfl
      · simp only [same, ↓reduceIte, ↓reduceDIte]
        rw [marked_value]
        cases fn with
        | s => rfl
        | app head leftAudit =>
            cases head with
            | app first second => rfl
            | s =>
                cases audit with
                | s => rfl
                | app tag rightAudit =>
                    by_cases sameTag : tag = haltTag
                    · subst tag
                      rfl
                    · simp only [sameTag, ↓reduceIte, ↓reduceDIte]
                      rfl

theorem halt_operations_bound (field : Term) :
    (halt field).operations ≤
      20 + 4 * (field.size + haltCode.size) + 4 * (field.size + haltTag.size) := by
  cases field with
  | s =>
      exact Nat.le_trans (by decide : 2 ≤ 20)
        (Nat.le_trans (Nat.le_add_right _ _) (Nat.le_add_right _ _))
  | app fn audit =>
      have fnSize : fn.size ≤ (Term.app fn audit).size :=
        Nat.le_trans (Nat.le_add_right _ _) (Nat.le_add_right _ 1)
      have fresh := Nat.le_trans (equal_operations_le fn haltCode)
        (Nat.mul_le_mul_left 4 (Nat.add_le_add_right fnSize _))
      have markedBound := marked_operations_le (.app fn audit)
      unfold halt
      dsimp only
      split
      · have first := Nat.add_le_add_right (Nat.add_le_add_left fresh 3) 2
        have second := Nat.add_le_add_right (by decide : 3 + 2 ≤ 20)
          (4 * ((Term.app fn audit).size + haltCode.size))
        exact Nat.le_trans first (Nat.le_trans
          (by simpa only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using second)
          (Nat.le_add_right _ _))
      · have first := Nat.add_le_add
          (Nat.add_le_add_right (Nat.add_le_add_left fresh 3) 1) markedBound
        have second := Nat.add_le_add_right
          (Nat.add_le_add_right (by decide : 3 + 1 + 15 ≤ 20)
            (4 * ((Term.app fn audit).size + haltCode.size)))
          (4 * ((Term.app fn audit).size + haltTag.size))
        exact Nat.le_trans first
          (by simpa only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using second)

theorem halt_operations_le (field : Term) : (halt field).operations ≤ 8 * field.size + 76 := by
  have bound := halt_operations_bound field
  rw [show haltCode.size = 9 by rfl, show haltTag.size = 5 by rfl] at bound
  rw [show 8 = 4 + 4 by rfl, show 76 = 20 + 4 * 9 + 4 * 5 by rfl]
  simpa only [Nat.mul_add, Nat.add_mul, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using bound

structure Fields where
  haltField : Term
  dispatcher : Term
  seedPayload : Term
  seedAudit : Term
  continuation : Term
  continuationAudit : Term

def Fields.term (fields : Fields) : Term :=
  CheckpointDecoder.openShell fields.haltField fields.dispatcher fields.seedPayload
    fields.seedAudit fields.continuation fields.continuationAudit

def Fields.weight (fields : Fields) : Nat :=
  fields.haltField.size + fields.dispatcher.size + fields.seedPayload.size +
    fields.seedAudit.size + fields.continuation.size + fields.continuationAudit.size

def view : Term → Result (Option Fields)
  | .s => ⟨none, 2⟩
  | .app .s _ => ⟨none, 5⟩
  | .app (.app .s _) _ => ⟨none, 8⟩
  | .app (.app (.app _ _) .s) _ => ⟨none, 11⟩
  | .app (.app (.app _ _) (.app .s _)) _ => ⟨none, 14⟩
  | .app (.app (.app _ _) (.app (.app (.app _ _) _) _)) _ => ⟨none, 17⟩
  | .app (.app (.app _ _) (.app (.app .s _) _)) .s => ⟨none, 18⟩
  | .app (.app (.app haltField dispatcher) (.app (.app .s seedPayload) seedAudit))
      (.app continuation continuationAudit) =>
      ⟨some ⟨haltField, dispatcher, seedPayload, seedAudit, continuation, continuationAudit⟩, 21⟩

theorem view_operations_le (term : Term) : (view term).operations ≤ 21 := by
  fun_cases view term <;> simp [view]

theorem view_fields {term : Term} {fields : Fields}
    (found : (view term).value = some fields) : term = fields.term := by
  fun_cases view term <;> simp only [view, Option.some.injEq] at found <;>
    cases found <;> rfl

theorem view_weight_le {term : Term} {fields : Fields}
    (found : (view term).value = some fields) : fields.weight ≤ term.size := by
  rw [view_fields found]
  have size : fields.term.size = fields.weight + 7 := by
    rw [show 7 = 1 + 1 + 1 + 1 + 1 + 1 + 1 by rfl]
    simp only [Fields.term, Fields.weight, CheckpointDecoder.openShell, Term.size,
      Nat.succ_eq_add_one, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
  rw [size]
  exact Nat.le_add_right _ _

theorem view_field_bounds {term : Term} {fields : Fields}
    (found : (view term).value = some fields) :
    fields.haltField.size ≤ term.size ∧ fields.dispatcher.size ≤ term.size := by
  have weight := view_weight_le found
  have haltWeight : fields.haltField.size ≤ fields.weight :=
    Nat.le_trans (Nat.le_add_right _ _)
      (Nat.le_trans (Nat.le_add_right _ _)
        (Nat.le_trans (Nat.le_add_right _ _)
          (Nat.le_trans (Nat.le_add_right _ _) (Nat.le_add_right _ _))))
  have dispatcherWeight : fields.dispatcher.size ≤ fields.weight :=
    Nat.le_trans (Nat.le_add_left _ _)
      (Nat.le_trans (Nat.le_add_right _ _)
        (Nat.le_trans (Nat.le_add_right _ _)
          (Nat.le_trans (Nat.le_add_right _ _) (Nat.le_add_right _ _))))
  exact ⟨Nat.le_trans haltWeight weight, Nat.le_trans dispatcherWeight weight⟩

theorem view_none {term : Term} (found : (view term).value = none)
    (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :
    CheckpointDecoder.parseLocal? program tree term = none := by
  fun_cases view term <;> simp_all [view, CheckpointDecoder.parseLocal?]

/-- Compose shell and halt observations with a counted dispatcher parser. -/
def localWith (program : CTS.Program)
    (dispatch : Term → Result (Option (DispatchParser.ParsedDispatch program)))
    (term : Term) : Result (Option (CheckpointDecoder.LocalView program)) :=
  let shell := view term
  match shell.value with
  | none => ⟨none, shell.operations + 2⟩
  | some fields =>
      let haltResult := halt fields.haltField
      match haltResult.value with
      | none => ⟨none, shell.operations + 1 + haltResult.operations + 2⟩
      | some status =>
          let parsed := dispatch fields.dispatcher
          match parsed.value with
          | none => ⟨none, shell.operations + 1 + haltResult.operations + 1 + parsed.operations + 2⟩
          | some result =>
              ⟨some ⟨status, result.route, result.label, result.accumulator,
                  fields.seedPayload, fields.continuation⟩,
                shell.operations + 1 + haltResult.operations + 1 + parsed.operations + 3⟩

theorem localWith_value (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (dispatch : Term → Result (Option (DispatchParser.ParsedDispatch program)))
    (agreement : ∀ field, (dispatch field).value = DispatchParser.parse program tree field)
    (term : Term) :
    (localWith program dispatch term).value = CheckpointDecoder.parseLocal? program tree term := by
  rw [localWith]
  split
  · next found => exact (view_none found program tree).symm
  · next fields found =>
      rw [view_fields found]
      dsimp only
      rw [halt_value]
      dsimp only [Fields.term, CheckpointDecoder.openShell, CheckpointDecoder.parseLocal?]
      cases checked : CheckpointDecoder.checkHalt? fields.haltField with
      | none => rfl
      | some checked =>
          dsimp only
          rw [agreement]
          cases DispatchParser.parse program tree fields.dispatcher <;> rfl

theorem localWith_operations_le (program : CTS.Program)
    (dispatch : Term → Result (Option (DispatchParser.ParsedDispatch program)))
    (term : Term) (bound : Nat)
    (dispatchBound : ∀ field, field.size ≤ term.size → (dispatch field).operations ≤ bound) :
    (localWith program dispatch term).operations ≤ 8 * term.size + bound + 102 := by
  have shell := view_operations_le term
  rw [localWith]
  split
  · exact Nat.le_trans (Nat.add_le_add_right shell 2)
      (Nat.le_trans (by decide : 21 + 2 ≤ 102) (Nat.le_add_left _ _))
  · next fields found =>
      obtain ⟨haltSize, dispatchSize⟩ := view_field_bounds found
      have haltBound := Nat.le_trans (halt_operations_le fields.haltField)
        (Nat.add_le_add_right (Nat.mul_le_mul_left 8 haltSize) 76)
      have dispatcher := dispatchBound fields.dispatcher dispatchSize
      have common : (view term).operations + 1 + (halt fields.haltField).operations + 1 +
          (dispatch fields.dispatcher).operations + 3 ≤ 8 * term.size + bound + 102 := by
        have combined := Nat.add_le_add_right
          (Nat.add_le_add (Nat.add_le_add_right
            (Nat.add_le_add (Nat.add_le_add_right shell 1) haltBound) 1) dispatcher) 3
        rw [show 102 = 21 + 1 + 76 + 1 + 3 by rfl]
        simpa only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using combined
      dsimp only
      split
      · have first := Nat.add_le_add_right
          (Nat.add_le_add (Nat.add_le_add_right shell 1) haltBound) 2
        have second := Nat.add_le_add_left (by decide : 21 + 1 + 76 + 2 ≤ 102)
          (8 * term.size)
        have third := Nat.add_le_add_right (Nat.le_add_right (8 * term.size) bound) 102
        exact Nat.le_trans first (Nat.le_trans
          (by simpa only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using second) third)
      · split
        · exact Nat.le_trans (Nat.add_le_add_left (by decide : 2 ≤ 3) _) common
        · exact common

end PureSFormal.PureS.ParserLocalShellPrimitive
