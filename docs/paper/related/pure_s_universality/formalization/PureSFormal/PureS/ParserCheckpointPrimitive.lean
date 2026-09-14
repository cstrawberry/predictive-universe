import PureSFormal.PureS.ParserPositivePrimitive

/-!
# Complete primitive checkpoint decoding

This evaluator has the same all-input result as the public checkpoint decoder.
It first checks the time-zero generator and, on failure, parses a positive
checkpoint. A fixed program and dispatcher prepare the action wrapper, route
grammar, and unary history counts. The measured input is one bare term; the
quadratic coefficient depends only on that fixed prepared grammar. All term
traversals, list copies, and unary phase calculations use counted primitives.
-/

namespace PureSFormal.PureS.ParserCheckpointPrimitive

open ParserPrimitiveMachine

variable {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}

def decodePrepared (context : ParserCarrierPrimitive.Context program tree) (term : Term) :
    Result (Option (CheckpointDecoder.Result program)) :=
  let initial := ParserEnvelopePrimitive.generator context.expectedAct term
  match initial.value with
  | some bits => ⟨some (.zero bits), initial.operations + 4⟩
  | none =>
      let positive := ParserPositivePrimitive.parse context term
      match positive.value with
      | none => ⟨none, initial.operations + 1 + positive.operations + 2⟩
      | some view => ⟨some (.positive view), initial.operations + 1 + positive.operations + 4⟩

theorem decodePrepared_value (context : ParserCarrierPrimitive.Context program tree) (term : Term) :
    (decodePrepared context term).value = CheckpointDecoder.decode? program tree term := by
  unfold decodePrepared
  dsimp only
  rw [context.expectedAct_eq, ParserEnvelopePrimitive.generator_value]
  unfold CheckpointDecoder.decode?
  cases CheckpointDecoder.parseGenerator? (compileActions program tree) term with
  | some bits => rfl
  | none =>
      dsimp only
      rw [ParserPositivePrimitive.parse_value]
      cases CheckpointDecoder.parsePositive? program tree term <;> rfl

theorem decodePrepared_overhead_le (context : ParserCarrierPrimitive.Context program tree) (term : Term) :
    (decodePrepared context term).operations ≤
      (ParserEnvelopePrimitive.generator context.expectedAct term).operations +
        (ParserPositivePrimitive.parse context term).operations + 5 := by
  unfold decodePrepared
  dsimp only
  split
  · exact Nat.le_trans (Nat.add_le_add_left (by decide : 4 ≤ 5) _)
      (Nat.add_le_add_right (Nat.le_add_right _ _) 5)
  · split
    · simpa only [show 5 = 1 + 4 by rfl, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using
        Nat.add_le_add_left (by decide : 2 ≤ 4)
          ((ParserEnvelopePrimitive.generator context.expectedAct term).operations + 1 +
            (ParserPositivePrimitive.parse context term).operations)
    · exact Nat.le_of_eq (by
        simp only [show 5 = 1 + 4 by rfl, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm])

def generatorCoefficient (expected : Term) : Nat := 128 + (4 * expected.size + 134)

theorem generator_operations_le (expected term : Term) :
    (ParserEnvelopePrimitive.generator expected term).operations ≤
      generatorCoefficient expected * (term.size + 1) ^ 2 := by
  have linear : 52 * term.size + (4 * expected.size + 82) ≤
      (4 * expected.size + 134) * (term.size + 1) :=
    ParserCarrierPrimitive.linear_bound
      (Nat.le_trans (by decide : 52 ≤ 134) (Nat.le_add_left _ _))
      (Nat.add_le_add_left (by decide : 82 ≤ 134) _) term.size
  have square := Nat.le_trans linear
    (ParserCarrierPrimitive.linear_le_square (4 * expected.size + 134) term.size)
  have bound := Nat.add_le_add_left square (128 * (term.size + 1) ^ 2)
  exact Nat.le_trans (ParserEnvelopePrimitive.generator_operations_le expected term)
    (by simpa only [generatorCoefficient, Nat.add_mul, Nat.add_assoc] using bound)

def preparedCoefficient (context : ParserCarrierPrimitive.Context program tree) (localCoefficient : Nat) : Nat :=
  generatorCoefficient context.expectedAct + ParserPositivePrimitive.coefficient context localCoefficient + 5

theorem decodePrepared_operations_le (context : ParserCarrierPrimitive.Context program tree)
    (localCoefficient : Nat)
    (localBound : ∀ term, (context.localParser term).operations ≤ localCoefficient * (term.size + 1))
    (term : Term) :
    (decodePrepared context term).operations ≤ preparedCoefficient context localCoefficient * (term.size + 1) ^ 2 := by
  have stages := Nat.add_le_add (generator_operations_le context.expectedAct term)
    (ParserPositivePrimitive.parse_operations_le context localCoefficient localBound term)
  have bound := Nat.add_le_add stages (ParserPositivePrimitive.constant_le_square 5 term.size)
  exact Nat.le_trans (decodePrepared_overhead_le context term)
    (by simpa only [preparedCoefficient, Nat.add_mul, Nat.add_assoc] using bound)

def decode (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : Result (Option (CheckpointDecoder.Result program)) :=
  decodePrepared (ParserLocalPrimitive.context program tree) term

theorem decode_value (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : (decode program tree term).value = CheckpointDecoder.decode? program tree term :=
  decodePrepared_value (ParserLocalPrimitive.context program tree) term

def coefficient (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Nat :=
  preparedCoefficient (ParserLocalPrimitive.context program tree) (ParserLocalPrimitive.coefficient program tree)

theorem decode_operations_le (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : (decode program tree term).operations ≤ coefficient program tree * (term.size + 1) ^ 2 :=
  decodePrepared_operations_le (ParserLocalPrimitive.context program tree) _
    (ParserLocalPrimitive.context_operations_le program tree) term

theorem carrier_operations_le (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) :
    (ParserCarrierPrimitive.decode (ParserLocalPrimitive.context program tree) term).operations ≤
      ParserCarrierPrimitive.coefficient (ParserLocalPrimitive.context program tree)
        (ParserLocalPrimitive.coefficient program tree) * (term.size + 1) ^ 2 :=
  ParserCarrierPrimitive.decode_operations_le (ParserLocalPrimitive.context program tree) _
    (ParserLocalPrimitive.context_operations_le program tree) term

theorem chain_operations_le (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) :
    (ParserChainPrimitive.parse (ParserLocalPrimitive.context program tree) term).operations ≤
      ParserChainPrimitive.coefficient (ParserLocalPrimitive.context program tree)
        (ParserLocalPrimitive.coefficient program tree) * (term.size + 1) ^ 2 + 5 :=
  ParserChainPrimitive.parse_operations_le (ParserLocalPrimitive.context program tree) _
    (ParserLocalPrimitive.context_operations_le program tree) term

theorem positive_operations_le (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) :
    (ParserPositivePrimitive.parse (ParserLocalPrimitive.context program tree) term).operations ≤
      ParserPositivePrimitive.coefficient (ParserLocalPrimitive.context program tree)
        (ParserLocalPrimitive.coefficient program tree) * (term.size + 1) ^ 2 :=
  ParserPositivePrimitive.parse_operations_le (ParserLocalPrimitive.context program tree) _
    (ParserLocalPrimitive.context_operations_le program tree) term

end PureSFormal.PureS.ParserCheckpointPrimitive
