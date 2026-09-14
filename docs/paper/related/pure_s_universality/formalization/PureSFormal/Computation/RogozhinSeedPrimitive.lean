import PureSFormal.Computation.CookPassPrimitive
import PureSFormal.Computation.RogozhinFramePrimitive
import PureSFormal.Computation.CookSeedReadbackContext

/-!
# Primitive immutable-seed frame readback

Seed inversion decodes the Cook bitword and canonical boundary, reverses the
decoded left side by allocating one cell per input cell, and parses the entire
Rogozhin frame syntax. The frame parser's own structural fuel construction is
included. The output context shares the recovered frame list.
-/

namespace PureSFormal.Computation.RogozhinSeedPrimitive

open PureS PureS.ParserPrimitiveMachine Cook Cook.PassClassification
open PureS.ParserRoutePrimitive (andThen charge andThen_value andThen_operations_le)

def reverseOnto {α : Type} : List α → List α → Result (List α)
  | [], suffix => ⟨suffix, 1⟩
  | first :: rest, suffix =>
      let inner := reverseOnto rest (first :: suffix)
      ⟨inner.value, inner.operations + 4⟩

theorem reverseOnto_value {α : Type} (source suffix : List α) :
    (reverseOnto source suffix).value = source.reverse ++ suffix := by
  induction source generalizing suffix with
  | nil => rfl
  | cons first rest ih =>
      change (reverseOnto rest (first :: suffix)).value = _
      rw [ih, List.reverse_cons, List.append_assoc]
      rfl

theorem reverseOnto_operations {α : Type} (source suffix : List α) :
    (reverseOnto source suffix).operations = 4 * source.length + 1 := by
  induction source generalizing suffix with
  | nil => rfl
  | cons first rest ih =>
      change (reverseOnto rest (first :: suffix)).operations + 4 = _
      rw [ih, List.length_cons, Nat.mul_succ]

def reverse {α : Type} (source : List α) : Result (List α) := charge 1 (reverseOnto source [])

theorem reverse_value {α : Type} (source : List α) : (reverse source).value = source.reverse := by
  change (reverseOnto source []).value = _
  rw [reverseOnto_value, List.append_nil]

theorem reverse_operations {α : Type} (source : List α) : (reverse source).operations = 4 * source.length + 2 := by
  change 1 + (reverseOnto source []).operations = _
  rw [reverseOnto_operations]
  rw [Nat.add_comm 1]

def frames (config : MachineConfig) : Result (Option (List (List Nat))) :=
  let tape := reverse config.left
  charge (tape.operations + 1) (RogozhinFramePrimitive.program tape.value)

def seedBody (word : List TagSymbol) : Result (Option (List (List Nat))) :=
  andThen (CookBoundaryPrimitive.canonical word) frames

def parse (bits : List Bool) : Result (Option (List (List Nat))) :=
  andThen (CookWordPrimitive.parse bits) seedBody

def context (bits : List Bool) : Result (Option CookSeedReadbackContext.Context) :=
  andThen (parse bits) fun recovered => ⟨some ⟨recovered⟩, 2⟩

theorem frames_value (config : MachineConfig) :
    (frames config).value = RogozhinProgramReadback.parseProgram? config.left.reverse := by
  change (RogozhinFramePrimitive.program (reverse config.left).value).value = _
  rw [reverse_value, RogozhinFramePrimitive.program_value]

theorem seedBody_value (word : List TagSymbol) : (seedBody word).value = (do
    let config ← Cook.decodeCanonical? word
    RogozhinProgramReadback.parseProgram? config.left.reverse) := by
  unfold seedBody
  rw [andThen_value, CookBoundaryPrimitive.canonical_value]
  cases Cook.decodeCanonical? word with
  | none => rfl
  | some config => exact frames_value config

theorem parse_value (bits : List Bool) : (parse bits).value = RogozhinProgramReadback.parseSeedFrames? bits := by
  unfold parse RogozhinProgramReadback.parseSeedFrames?
  rw [andThen_value, CookWordPrimitive.parse_value]
  cases Cook.decodeWord? bits with
  | none => rfl
  | some word => exact seedBody_value word

theorem context_value (bits : List Bool) : (context bits).value = CookSeedReadbackContext.decodeContext? bits := by
  unfold context CookSeedReadbackContext.decodeContext?
  rw [andThen_value, parse_value]
  cases RogozhinProgramReadback.parseSeedFrames? bits <;> rfl

theorem frames_operations_le (config : MachineConfig) :
    (frames config).operations ≤ 96 * (config.left.length + 1) ^ 2 := by
  have parsed := RogozhinFramePrimitive.program_operations_le (reverse config.left).value
  rw [reverse_value, List.length_reverse] at parsed
  change (reverse config.left).operations + 1 + (RogozhinFramePrimitive.program _).operations ≤ _
  rw [reverse_operations, reverse_value]
  apply Nat.le_trans (Nat.add_le_add_left parsed (4 * config.left.length + 2 + 1))
  have overhead := Nat.le_trans
    (ParserCarrierPrimitive.linear_bound (by decide : 4 ≤ 16) (by decide : 2 + 1 ≤ 16) config.left.length)
    (ParserCarrierPrimitive.linear_le_square 16 config.left.length)
  have reordered : 4 * config.left.length + 2 + 1 ≤ 16 * (config.left.length + 1) ^ 2 := by
    simpa only [Nat.add_assoc] using overhead
  apply Nat.le_trans (Nat.add_le_add_right reordered (80 * (config.left.length + 1) ^ 2))
  rw [← Nat.add_mul]
  exact Nat.le_refl _

theorem seedBody_operations_le (word : List TagSymbol) :
    (seedBody word).operations ≤ 896 * (word.length + 1) ^ 2 := by
  have output (config : MachineConfig) (accepted : (CookBoundaryPrimitive.canonical word).value = some config) :
      (frames config).operations ≤ 96 * (word.length + 1) ^ 2 :=
    Nat.le_trans (frames_operations_le config) (Nat.mul_le_mul_left 96
      (ParserPositivePrimitive.square_mono (CookBoundaryPrimitive.canonical_fields word config accepted).1))
  have inner := andThen_operations_le (CookBoundaryPrimitive.canonical word) frames
    (96 * (word.length + 1) ^ 2) output
  apply Nat.le_trans inner
  apply Nat.le_trans (Nat.add_le_add_right (Nat.add_le_add_right
    (CookBoundaryPrimitive.canonical_operations_le word) 2) (96 * (word.length + 1) ^ 2))
  calc
    _ = (768 * (word.length + 1) ^ 2 + 96 * (word.length + 1) ^ 2) + 2 := by
      rw [Nat.add_assoc, Nat.add_comm 2, ← Nat.add_assoc]
    _ ≤ (768 * (word.length + 1) ^ 2 + 96 * (word.length + 1) ^ 2) +
        32 * (word.length + 1) ^ 2 :=
      Nat.add_le_add_left (Nat.le_trans (by decide : 2 ≤ 32)
        (ParserPositivePrimitive.constant_le_square 32 word.length)) _
    _ = _ := by rw [← Nat.add_mul, ← Nat.add_mul]

set_option maxRecDepth 8192 in
theorem parse_cost_bound (size : Nat) :
    4000 * (size + 1) ^ 2 + 2 + 896 * (size + 1) ^ 2 ≤ 5120 * (size + 1) ^ 2 := by
  calc
    _ = (4000 * (size + 1) ^ 2 + 896 * (size + 1) ^ 2) + 2 := by
      rw [Nat.add_assoc, Nat.add_comm 2, ← Nat.add_assoc]
    _ ≤ (4000 * (size + 1) ^ 2 + 896 * (size + 1) ^ 2) + 224 * (size + 1) ^ 2 :=
      Nat.add_le_add_left (Nat.le_trans (by decide : 2 ≤ 224)
        (ParserPositivePrimitive.constant_le_square 224 size)) _
    _ = _ := by rw [← Nat.add_mul, ← Nat.add_mul]

theorem parse_operations_le (bits : List Bool) : (parse bits).operations ≤ 5120 * (bits.length + 1) ^ 2 := by
  have output (word : List TagSymbol) (accepted : (CookWordPrimitive.parse bits).value = some word) :
      (seedBody word).operations ≤ 896 * (bits.length + 1) ^ 2 :=
    Nat.le_trans (seedBody_operations_le word) (Nat.mul_le_mul_left 896
      (ParserPositivePrimitive.square_mono (CookPassPrimitive.word_length_le bits word accepted)))
  have inner := andThen_operations_le (CookWordPrimitive.parse bits) seedBody
    (896 * (bits.length + 1) ^ 2) output
  apply Nat.le_trans inner
  have word := Nat.le_trans (CookWordPrimitive.parse_operations_le bits)
    (ParserCarrierPrimitive.linear_le_square 4000 bits.length)
  exact Nat.le_trans (Nat.add_le_add_right (Nat.add_le_add_right word 2) (896 * (bits.length + 1) ^ 2))
    (parse_cost_bound bits.length)

theorem context_operations_le (bits : List Bool) :
    (context bits).operations ≤ 5124 * (bits.length + 1) ^ 2 := by
  have inner := andThen_operations_le (parse bits)
    (fun recovered => (⟨some ⟨recovered⟩, 2⟩ : Result (Option CookSeedReadbackContext.Context)))
    2 (fun _ _ => Nat.le_refl _)
  apply Nat.le_trans inner
  apply Nat.le_trans (Nat.add_le_add_right (Nat.add_le_add_right (parse_operations_le bits) 2) 2)
  calc
    _ = 5120 * (bits.length + 1) ^ 2 + 4 := rfl
    _ ≤ (5120 + 4) * (bits.length + 1) ^ 2 := by
      rw [Nat.add_mul]
      exact Nat.add_le_add_left (ParserPositivePrimitive.constant_le_square 4 bits.length) _
    _ = _ := rfl

end PureSFormal.Computation.RogozhinSeedPrimitive
