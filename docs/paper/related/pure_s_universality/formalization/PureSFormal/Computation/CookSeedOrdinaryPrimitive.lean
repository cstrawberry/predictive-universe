import PureSFormal.Computation.CookSeedTerminalPrimitive
import PureSFormal.Computation.RogozhinContextBoundaryPrimitive

/-!
# Seed-specialized ordinary-word readback

The dummy ordinary table is used only in the agreement statement. Execution
counts the real immutable frames, subtracts one, and runs the measured padding
inverse with those two unary labels. Every accepted label is bounded, including
on arbitrary malformed input. This prevents a later numeric reader from
receiving unaccounted large integers from a superficially short word.
-/

namespace PureSFormal.Computation.CookSeedOrdinaryPrimitive

open PureS.ParserPrimitiveMachine PureS.ParserNatPrimitive PureS.ParserRoutePrimitive
open RogozhinTagInput DeletionTwoT2Normalizer DeletionTwoT2Readback
open DeletionTwoReadbackPrimitive RogozhinFramePrimitiveSize
open RogozhinContextWeightPrimitive (length_le_contextSize)
open CookSeedReadbackContext (Context)

theorem decodedLabel_le (program : Program) (label : Nat)
    (bounded : label ≤ targetHaltLabel program) : decodeLabel program label ≤ haltLabel program := by
  unfold decodeLabel
  split
  · exact Nat.le_refl _
  next different =>
    exact Nat.le_of_lt_succ (Nat.lt_of_le_of_ne bounded different)

theorem aligned_labels (program : Program) (word output : List Nat)
    (accepted : decodeAligned? program word = some output) :
    ∀ label ∈ output, label ≤ haltLabel program := by
  induction word using pairInduction generalizing output with
  | nil =>
      cases accepted
      intro label membership
      cases membership
  | singleton first =>
      rw [decodeAligned?_cons] at accepted
      split at accepted
      · cases accepted
      · split at accepted
        next bounded =>
          cases accepted
          intro label membership
          cases membership with
          | head => exact decodedLabel_le program first bounded
          | tail _ impossible => cases impossible
        · cases accepted
  | cons_cons first second tail ihTail ihRest =>
      rw [decodeAligned?_cons] at accepted
      split at accepted
      · dsimp only at accepted
        split at accepted
        · exact ihTail output accepted
        · cases accepted
      · split at accepted
        next bounded =>
          cases parsed : decodeAligned? program (second :: tail) with
          | none => rw [parsed] at accepted; cases accepted
          | some rest =>
              rw [parsed] at accepted
              cases accepted
              intro label membership
              cases membership with
              | head => exact decodedLabel_le program first bounded
              | tail _ membership => exact ihRest rest parsed label membership
        · cases accepted

theorem word_labels (program : Program) (word output : List Nat)
    (accepted : decodeWord? program word = some output) :
    ∀ label ∈ output, label ≤ haltLabel program := by
  rw [decodeWord?.eq_def] at accepted
  cases parsed : decodeAligned? program word with
  | some result =>
      rw [parsed] at accepted
      cases accepted
      exact aligned_labels program word _ parsed
  | none =>
      rw [parsed] at accepted
      cases word with
      | nil => cases accepted
      | cons first rest =>
          dsimp only at accepted
          split at accepted
          · cases retried : decodeAligned? program rest with
            | none => rw [retried] at accepted; cases accepted
            | some result =>
                rw [retried] at accepted
                cases accepted
                intro label membership
                exact aligned_labels program rest result retried label (List.mem_of_mem_tail membership)
          · cases accepted

def ordinary (context : Context) (word : List Nat) : Result (Option (List Nat)) :=
  let count := RogozhinInputConstructionMachine.length context.frames
  let rows := subtract count.value 1
  let parsed := wordPrepared rows.value (Nat.succ rows.value) word
  ⟨parsed.value, count.operations + rows.operations + parsed.operations + 4⟩

theorem ordinary_value (context : Context) (word : List Nat) :
    (ordinary context word).value = decodeWord? context.ordinaryShape word := by
  simp only [ordinary, RogozhinInputConstructionMachine.length_value, subtract_value]
  have result := wordPrepared_value context.ordinaryShape word
  simpa only [delayLabel, targetHaltLabel, symbolCount,
    CookSeedReadbackContext.Context.ordinaryShape, CookSeedReadbackContext.Context.symbolCount,
    List.length_replicate, Nat.succ_eq_add_one] using result

def ordinaryBudget (size cells : Nat) : Nat :=
  4 * size + 12 + (36 * size + 104) * (cells + 1)

theorem grammarCoefficient (count : Nat) :
    2 * DeletionTwoReadbackPrimitive.coefficient count (count + 1) + 4 * count + 24 = 36 * count + 104 := by
  simp only [DeletionTwoReadbackPrimitive.coefficient, Nat.mul_add, Nat.mul_one, ← Nat.mul_assoc]
  change (16 * count + (16 * count + 16) + 64) + 4 * count + 24 = _
  rw [show 36 * count = 16 * count + 16 * count + 4 * count from
    (Nat.add_mul (16 + 16) 4 count).trans (congrArg (fun n => n + 4 * count) (Nat.add_mul 16 16 count))]
  simp only [show 104 = 16 + 64 + 24 by rfl, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

theorem ordinary_operations_le (context : Context) (word : List Nat) :
    (ordinary context word).operations ≤ ordinaryBudget (contextSize context.frames) word.length := by
  let count := RogozhinInputConstructionMachine.length context.frames
  let rows := subtract count.value 1
  have rowsBound : rows.value ≤ contextSize context.frames := by
    dsimp only [rows, count]
    rw [subtract_value, RogozhinInputConstructionMachine.length_value]
    exact Nat.le_trans (Nat.sub_le _ _) (length_le_contextSize context.frames)
  have countBound : count.operations ≤ 4 * contextSize context.frames + 2 := by
    rw [RogozhinInputConstructionMachine.length_operations]
    exact Nat.add_le_add_right (Nat.mul_le_mul_left 4 (length_le_contextSize context.frames)) 2
  have parsedBound := wordPrepared_operations_le rows.value (rows.value + 1) word
  rw [grammarCoefficient] at parsedBound
  have parsedBound' := Nat.le_trans parsedBound (Nat.mul_le_mul_right (word.length + 1)
    (Nat.add_le_add_right (Nat.mul_le_mul_left 36 rowsBound) 104))
  have bound := Nat.add_le_add_right (Nat.add_le_add
    (Nat.add_le_add countBound (subtract_operations_le count.value 1)) parsedBound') 4
  simpa only [ordinary, ordinaryBudget, count, rows, Nat.succ_eq_add_one,
    show 12 = 2 + (4 * 1 + 2) + 4 by rfl,
    Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using bound

theorem ordinary_length_le (context : Context) (word output : List Nat)
    (accepted : (ordinary context word).value = some output) : output.length ≤ word.length :=
  decodeWord_length_le context.ordinaryShape word output ((ordinary_value context word).symm.trans accepted)

theorem ordinary_labels (context : Context) (word output : List Nat)
    (accepted : (ordinary context word).value = some output) :
    ∀ label ∈ output, label ≤ contextSize context.frames := by
  intro label membership
  have bounded := word_labels context.ordinaryShape word output
    ((ordinary_value context word).symm.trans accepted) label membership
  have countBound : haltLabel context.ordinaryShape ≤ contextSize context.frames := by
    unfold haltLabel symbolCount CookSeedReadbackContext.Context.ordinaryShape
    rw [List.length_replicate]
    exact Nat.le_trans (Nat.sub_le _ _) (length_le_contextSize context.frames)
  exact Nat.le_trans bounded countBound

theorem ordinaryBudget_mono {firstSize secondSize firstCells secondCells : Nat}
    (size : firstSize ≤ secondSize) (cells : firstCells ≤ secondCells) :
    ordinaryBudget firstSize firstCells ≤ ordinaryBudget secondSize secondCells :=
  Nat.add_le_add (Nat.add_le_add_right (Nat.mul_le_mul_left 4 size) 12)
    (Nat.mul_le_mul (Nat.add_le_add_right (Nat.mul_le_mul_left 36 size) 104)
      (Nat.add_le_add_right cells 1))

def passOrdinary (context : Context) (horizon : Nat)
    (snapshot : CTS.Config Cook.rogozhinCookProgram) : Result (Option (List Nat)) :=
  andThen (RogozhinContextBoundaryPrimitive.passTag context horizon snapshot) (ordinary context)

theorem passOrdinary_value (context : Context) (horizon : Nat)
    (snapshot : CTS.Config Cook.rogozhinCookProgram) :
    (passOrdinary context horizon snapshot).value =
      (CookSeedPassReadback.decodePassTag? context horizon snapshot).bind
        (decodeWord? context.ordinaryShape) := by
  rw [passOrdinary, andThen_value, RogozhinContextBoundaryPrimitive.passTag_value]
  cases CookSeedPassReadback.decodePassTag? context horizon snapshot with
  | none => rfl
  | some word => exact ordinary_value context word

def passOrdinaryBudget (size cells : Nat) : Nat :=
  RogozhinContextBoundaryPrimitive.passTagBudget size cells + 2 + ordinaryBudget size (cells + 2)

theorem passOrdinary_operations_le (context : Context) (horizon : Nat)
    (snapshot : CTS.Config Cook.rogozhinCookProgram) :
    (passOrdinary context horizon snapshot).operations ≤
      passOrdinaryBudget (contextSize context.frames) snapshot.data.length := by
  have continuation (word : List Nat)
      (found : (RogozhinContextBoundaryPrimitive.passTag context horizon snapshot).value = some word) :
      (ordinary context word).operations ≤ ordinaryBudget (contextSize context.frames) (snapshot.data.length + 2) :=
    Nat.le_trans (ordinary_operations_le context word) (ordinaryBudget_mono (Nat.le_refl _)
      (RogozhinContextBoundaryPrimitive.passTag_length_le context horizon snapshot word found))
  have bound := andThen_operations_le (RogozhinContextBoundaryPrimitive.passTag context horizon snapshot)
    (ordinary context) (ordinaryBudget (contextSize context.frames) (snapshot.data.length + 2)) continuation
  exact Nat.le_trans bound (Nat.add_le_add_right (Nat.add_le_add_right
    (RogozhinContextBoundaryPrimitive.passTag_operations_le context horizon snapshot) 2) _)

theorem passOrdinary_fields (context : Context) (horizon : Nat)
    (snapshot : CTS.Config Cook.rogozhinCookProgram) (word : List Nat)
    (accepted : (passOrdinary context horizon snapshot).value = some word) :
    word.length ≤ snapshot.data.length + 2 ∧ ∀ label ∈ word, label ≤ contextSize context.frames := by
  rw [passOrdinary, andThen_value] at accepted
  cases found : (RogozhinContextBoundaryPrimitive.passTag context horizon snapshot).value with
  | none => rw [found] at accepted; cases accepted
  | some normalized =>
      rw [found] at accepted
      exact ⟨Nat.le_trans (ordinary_length_le context normalized word accepted)
        (RogozhinContextBoundaryPrimitive.passTag_length_le context horizon snapshot normalized found),
        ordinary_labels context normalized word accepted⟩

end PureSFormal.Computation.CookSeedOrdinaryPrimitive
