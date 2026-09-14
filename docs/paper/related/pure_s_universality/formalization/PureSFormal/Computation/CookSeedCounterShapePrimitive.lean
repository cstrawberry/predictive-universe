import PureSFormal.Computation.CookSeedTerminalPrimitive

/-!
# Measured allocation of the seed-derived counter codec

The fixed dummy instruction is prepared before input. The entire canonical
table is allocated by the measured replicator, rather than hidden in the
readback call. This table is a codec and is never run as a counter program.
-/

namespace PureSFormal.Computation.CookSeedCounterShapePrimitive

open PureS.ParserPrimitiveMachine CookWordConstructionMachine
open RogozhinFramePrimitiveSize
open CookSeedReadbackContext (Context)

def instruction : ThreeCounter.Instruction := .decrementJump .right 0 0

def shape (context : Context) : Result ThreeCounter.Program :=
  let prepared := CookSeedTerminalPrimitive.prepare context
  let rows := replicateOnto instruction prepared.value.2 []
  ⟨rows.value, prepared.operations + rows.operations + 5⟩

theorem shape_value (context : Context) : (shape context).value = context.counterShape := by
  simp only [shape, replicateOnto_value, List.append_nil, CookSeedTerminalPrimitive.prepare_value,
    CookSeedReadbackContext.Context.counterShape, instruction]

theorem shape_length (context : Context) : (shape context).value.length = context.primitiveLength := by
  rw [shape_value, CookSeedReadbackContext.Context.counterShape, List.length_replicate]

theorem shape_length_le (context : Context) : (shape context).value.length ≤ contextSize context.frames := by
  rw [shape_length]
  have bound := CookSeedTerminalPrimitive.primitive_le context
  rw [CookSeedTerminalPrimitive.prepare_value] at bound
  exact bound

theorem shape_operations_le (context : Context) :
    (shape context).operations ≤ 88 * contextSize context.frames + 40 := by
  have rowsBound := Nat.add_le_add_right (Nat.mul_le_mul_left 4
    (CookSeedTerminalPrimitive.primitive_le context)) 1
  have bound := Nat.add_le_add_right (Nat.add_le_add
    (CookSeedTerminalPrimitive.prepare_operations_le context) rowsBound) 5
  simp only [shape, replicateOnto_operations]
  simpa only [show 88 = 84 + 4 by rfl, Nat.add_mul,
    show 40 = 34 + 1 + 5 by rfl, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using bound

theorem shape_materialization (context : Context) :
    ReplicateExecution instruction (CookSeedTerminalPrimitive.prepare context).value.2 []
      (shape context).value
      (replicateOnto instruction (CookSeedTerminalPrimitive.prepare context).value.2 []).operations :=
  replicateOnto_execution instruction (CookSeedTerminalPrimitive.prepare context).value.2 []

theorem shape_certificate (context : Context) :
    (shape context).value = context.counterShape ∧
    (shape context).value.length ≤ contextSize context.frames ∧
    (shape context).operations ≤ 88 * contextSize context.frames + 40 :=
  ⟨shape_value context, shape_length_le context, shape_operations_le context⟩

end PureSFormal.Computation.CookSeedCounterShapePrimitive
