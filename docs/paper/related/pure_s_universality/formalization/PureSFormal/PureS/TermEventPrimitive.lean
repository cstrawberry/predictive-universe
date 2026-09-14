import PureSFormal.PureS.ParserCheckpointPrimitive
import PureSFormal.PureS.TermEvent

/-!
# Primitive marked-checkpoint observation

The fixed prepared checkpoint parser supplies the only tree traversal. The
observer inspects the decoded result and, for a positive result, the literal
queue constructor. It computes the existing marked-snapshot Boolean on every
bare term. Registered controller contractions remain a separate observable.
-/

namespace PureSFormal.PureS.TermEventPrimitive

open ParserPrimitiveMachine

def observeResult {program : CTS.Program} : Option (CheckpointDecoder.Result program) → Result Bool
  | none => ⟨false, 1⟩
  | some (.zero _) => ⟨false, 3⟩
  | some (.positive view) =>
      match view.queue with
      | [] => ⟨true, 6⟩
      | _ :: _ => ⟨false, 6⟩

theorem observeResult_operations_le {program : CTS.Program}
    (result : Option (CheckpointDecoder.Result program)) : (observeResult result).operations ≤ 6 := by
  cases result with
  | none => exact (by decide : 1 ≤ 6)
  | some result =>
      cases result with
      | zero bits => exact (by decide : 3 ≤ 6)
      | positive view =>
          cases view with
          | mk horizon route label queue => cases queue <;> exact Nat.le_refl _

def observesMarkedCheckpoint (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :
    Term → Result Bool :=
  let context := ParserLocalPrimitive.context program tree
  fun term =>
    let decoded := ParserCheckpointPrimitive.decodePrepared context term
    let result := observeResult decoded.value
    ⟨result.value, decoded.operations + result.operations⟩

theorem observesMarkedCheckpoint_value (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (term : Term) :
    (observesMarkedCheckpoint program tree term).value = TermEvent.observesMarkedCheckpoint? program tree term := by
  change (observeResult (ParserCheckpointPrimitive.decodePrepared _ term).value).value = _
  rw [ParserCheckpointPrimitive.decodePrepared_value]
  unfold TermEvent.observesMarkedCheckpoint?
  cases CheckpointDecoder.decode? program tree term with
  | none => rfl
  | some result =>
      cases result with
      | zero bits => rfl
      | positive view =>
          cases view with
          | mk horizon route label queue => cases queue <;> rfl

def coefficient (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Nat :=
  ParserCheckpointPrimitive.coefficient program tree + 6

theorem observesMarkedCheckpoint_operations_le (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (term : Term) :
    (observesMarkedCheckpoint program tree term).operations ≤ coefficient program tree * (term.size + 1) ^ 2 := by
  have first := Nat.add_le_add
    (ParserCheckpointPrimitive.decode_operations_le program tree term)
    (observeResult_operations_le (ParserCheckpointPrimitive.decode program tree term).value)
  have second := Nat.add_le_add_left (ParserPositivePrimitive.constant_le_square 6 term.size)
    (ParserCheckpointPrimitive.coefficient program tree * (term.size + 1) ^ 2)
  exact Nat.le_trans first (by simpa only [coefficient, Nat.add_mul] using second)

end PureSFormal.PureS.TermEventPrimitive
