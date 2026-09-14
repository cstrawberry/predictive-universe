import PureSFormal.Computation.RogozhinContextDataPrimitive
import PureSFormal.Computation.RogozhinProgramConstructionMachine

/-!
# Primitive immutable program-region validation

Reconstruct every printed exponent frame from the seed-derived context, reverse
the complete program code, strip only the literal audit prefix from the current
left tape, and compare the symbols. `programMatches_value` is exact on all
contexts and left tapes. Its primitive operation bound is
`44 * contextSize context.frames + 4 * left.length + 65`.
-/

namespace PureSFormal.Computation.RogozhinContextProgramPrimitive

open PureS.ParserPrimitiveMachine RogozhinFramePrimitiveSize
open RogozhinProgramConstructionMachine (exponentMass exponentCode exponentCode_value
  exponentCode_operations_le copy copy_value copy_operations)
open Rogozhin46 (Symbol)

theorem exponentSize_eq (row : List Nat) : exponentSize row = exponentMass row + row.length := by
  induction row with
  | nil => rfl
  | cons first rest ih =>
      simp only [exponentSize, exponentMass, List.length_cons, ih,
        Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

theorem exponentTail_length_le (row : List Nat) :
    (row.flatMap fun width => [.s1, .s1] ++ RogozhinTagInput.ones width).length ≤
      2 * exponentSize row := by
  induction row with
  | nil => exact Nat.le_refl _
  | cons first rest ih =>
      have firstBound : first ≤ 2 * first := by
        simpa only [Nat.one_mul] using Nat.mul_le_mul_right first (by decide : 1 ≤ 2)
      have bound := Nat.add_le_add_right (Nat.add_le_add firstBound ih) 2
      simpa only [List.flatMap_cons, List.length_append, List.length_cons, List.length_nil,
        RogozhinTagInput.ones, List.length_replicate, exponentSize, Nat.mul_add, Nat.mul_one,
        Nat.zero_add, Nat.add_zero, show 2 = 1 + 1 by rfl,
        Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using bound

theorem exponentCode_length_le (row : List Nat) :
    (exponentCode row).value.length ≤ 2 * exponentSize row := by
  rw [exponentCode_value]
  cases row with
  | nil => exact Nat.le_refl _
  | cons first rest =>
      have firstBound : first ≤ 2 * first := by
        simpa only [Nat.one_mul] using Nat.mul_le_mul_right first (by decide : 1 ≤ 2)
      have bound := Nat.add_le_add (Nat.add_le_add firstBound (exponentTail_length_le rest))
        (by decide : 1 ≤ 2)
      simpa only [RogozhinTagInput.exponentCode, List.length_cons, List.length_append,
        RogozhinTagInput.ones, List.length_replicate, exponentSize, Nat.mul_add, Nat.mul_one,
        Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using bound

theorem exponentCode_operations_le_size (row : List Nat) :
    (exponentCode row).operations ≤ 6 * exponentSize row + 2 := by
  apply Nat.le_trans (exponentCode_operations_le row)
  rw [exponentSize_eq, Nat.mul_add]
  exact Nat.add_le_add_right (Nat.add_le_add_right
    (Nat.mul_le_mul_right (exponentMass row) (by decide : 4 ≤ 6)) _) 2

def frameOnto (row : List Nat) (suffix : List Symbol) : Result (List Symbol) :=
  let code := exponentCode row
  let joined := copy code.value suffix
  ⟨.s1 :: .s0 :: joined.value, code.operations + joined.operations + 5⟩

theorem frameOnto_value (row : List Nat) (suffix : List Symbol) :
    (frameOnto row suffix).value = RogozhinProgramReadback.frameCode row ++ suffix := by
  simp only [frameOnto, copy_value, exponentCode_value,
    RogozhinProgramReadback.frameCode, List.cons_append, List.nil_append, List.append_assoc]

theorem frameOnto_operations_le (row : List Nat) (suffix : List Symbol) :
    (frameOnto row suffix).operations ≤ 14 * exponentSize row + 8 := by
  have copied : (copy (exponentCode row).value suffix).operations ≤ 4 * (2 * exponentSize row) + 1 := by
    rw [copy_operations]
    exact Nat.add_le_add_right (Nat.mul_le_mul_left 4 (exponentCode_length_le row)) 1
  have bound := Nat.add_le_add_right (Nat.add_le_add (exponentCode_operations_le_size row) copied) 5
  simpa only [frameOnto, show 14 = 6 + 4 * 2 by rfl, show 8 = 2 + 1 + 5 by rfl,
    Nat.add_mul, Nat.mul_assoc, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using bound

theorem frameOnto_length_le (row : List Nat) (suffix : List Symbol) :
    (frameOnto row suffix).value.length ≤ 2 * (1 + exponentSize row) + suffix.length := by
  have bound := Nat.add_le_add_left (Nat.add_le_add_right (exponentCode_length_le row) suffix.length) 2
  simpa only [frameOnto, copy_value, List.length_cons, List.length_append,
    Nat.mul_add, Nat.mul_one, show 2 = 1 + 1 by rfl,
    Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using bound

def frames : List (List Nat) → Result (List Symbol)
  | [] => ⟨[.s1], 2⟩
  | row :: rest =>
      let following := frames rest
      let first := frameOnto row following.value
      ⟨first.value, following.operations + first.operations + 4⟩

theorem frames_value (rows : List (List Nat)) :
    (frames rows).value = RogozhinProgramReadback.framesCode rows := by
  induction rows with
  | nil => rfl
  | cons row rest ih =>
      change (frameOnto row (frames rest).value).value = _
      rw [frameOnto_value, ih]
      simp only [RogozhinProgramReadback.framesCode, List.flatMap_cons, List.append_assoc]

theorem frames_operations_le (rows : List (List Nat)) :
    (frames rows).operations ≤ 14 * contextSize rows + 2 := by
  induction rows with
  | nil => exact Nat.le_refl _
  | cons row rest ih =>
      have first := Nat.le_trans (frameOnto_operations_le row (frames rest).value)
        (Nat.add_le_add_left (by decide : 8 ≤ 10) _)
      have bound := Nat.add_le_add_right (Nat.add_le_add ih first) 4
      simpa only [frames, contextSize, Nat.mul_add, Nat.mul_one,
        show 14 = 10 + 4 by rfl, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using bound

theorem frames_length_le (rows : List (List Nat)) :
    (frames rows).value.length ≤ 2 * contextSize rows + 1 := by
  induction rows with
  | nil => exact Nat.le_refl _
  | cons row rest ih =>
      have bound := Nat.le_trans (frameOnto_length_le row (frames rest).value)
        (Nat.add_le_add_left ih _)
      simpa only [frames, contextSize, Nat.mul_add, Nat.mul_one,
        Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using bound

def program (context : CookSeedReadbackContext.Context) : Result (List Symbol) :=
  let code := frames context.frames
  ⟨.s3 :: .s1 :: code.value, code.operations + 4⟩

theorem program_value (context : CookSeedReadbackContext.Context) :
    (program context).value = context.programCode := by
  simp only [program, frames_value, CookSeedReadbackContext.Context.programCode]

theorem program_operations_le (context : CookSeedReadbackContext.Context) :
    (program context).operations ≤ 14 * contextSize context.frames + 6 := by
  exact Nat.add_le_add_right (frames_operations_le context.frames) 4

theorem program_length_le (context : CookSeedReadbackContext.Context) :
    (program context).value.length ≤ 2 * contextSize context.frames + 3 := by
  have bound := Nat.add_le_add_right (frames_length_le context.frames) 2
  simpa only [program, List.length_cons, Nat.add_assoc] using bound

def reversedProgram (context : CookSeedReadbackContext.Context) : Result (List Symbol) :=
  let code := program context
  let reversed := RogozhinSeedPrimitive.reverse code.value
  ⟨reversed.value, code.operations + reversed.operations + 2⟩

theorem reversedProgram_value (context : CookSeedReadbackContext.Context) :
    (reversedProgram context).value = context.programCode.reverse := by
  simp only [reversedProgram, RogozhinSeedPrimitive.reverse_value, program_value]

theorem reversedProgram_operations_le (context : CookSeedReadbackContext.Context) :
    (reversedProgram context).operations ≤ 22 * contextSize context.frames + 22 := by
  have reverseBound : (RogozhinSeedPrimitive.reverse (program context).value).operations ≤
      4 * (2 * contextSize context.frames + 3) + 2 := by
    rw [RogozhinSeedPrimitive.reverse_operations]
    exact Nat.add_le_add_right (Nat.mul_le_mul_left 4 (program_length_le context)) 2
  have bound := Nat.add_le_add_right (Nat.add_le_add (program_operations_le context) reverseBound) 2
  have sumEq : (14 * contextSize context.frames + 6) +
      (4 * (2 * contextSize context.frames + 3) + 2) + 2 =
      22 * contextSize context.frames + 22 := by
    rw [show 22 * contextSize context.frames =
        14 * contextSize context.frames + (4 * 2) * contextSize context.frames from
        Nat.add_mul 14 (4 * 2) _]
    simp only [Nat.mul_add, Nat.mul_assoc, show 22 = 6 + (4 * 3 + 2) + 2 by rfl,
      Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
  rw [sumEq] at bound
  exact bound

theorem reversedProgram_length_le (context : CookSeedReadbackContext.Context) :
    (reversedProgram context).value.length ≤ 2 * contextSize context.frames + 3 := by
  change (RogozhinSeedPrimitive.reverse (program context).value).value.length ≤ _
  rw [RogozhinSeedPrimitive.reverse_value, List.length_reverse]
  exact program_length_le context

def stripAudit : List Symbol → Result (List Symbol)
  | .s0 :: rest =>
      let stripped := stripAudit rest
      ⟨stripped.value, stripped.operations + 4⟩
  | rest => ⟨rest, 3⟩

theorem stripAudit_value (cells : List Symbol) :
    (stripAudit cells).value = CookSeedReadbackContext.stripAudit cells := by
  induction cells with
  | nil => rfl
  | cons first rest ih => cases first <;> exact (by first | exact ih | rfl)

theorem stripAudit_operations_le (cells : List Symbol) :
    (stripAudit cells).operations ≤ 4 * cells.length + 3 := by
  induction cells with
  | nil => exact Nat.le_refl _
  | cons first rest ih =>
      cases first with
      | s0 =>
          simpa only [stripAudit, List.length_cons, Nat.mul_add, Nat.mul_one,
            Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using Nat.add_le_add_right ih 4
      | s1 | s2 | s3 | s4 | s5 => exact Nat.le_add_left _ _

def programMatches (context : CookSeedReadbackContext.Context) (left : List Symbol) : Result Bool :=
  let stripped := stripAudit left
  let expected := reversedProgram context
  let same := RogozhinContextDataPrimitive.equalCells expected.value stripped.value
  ⟨same.value, stripped.operations + expected.operations + same.operations + 4⟩

theorem programMatches_value (context : CookSeedReadbackContext.Context) (left : List Symbol) :
    (programMatches context left).value = true ↔
      CookSeedReadbackContext.stripAudit left = context.programCode.reverse := by
  change (RogozhinContextDataPrimitive.equalCells (reversedProgram context).value
    (stripAudit left).value).value = true ↔ _
  rw [RogozhinContextDataPrimitive.equalCells_value, reversedProgram_value, stripAudit_value]
  exact ⟨Eq.symm, Eq.symm⟩

theorem programMatches_operations_le (context : CookSeedReadbackContext.Context) (left : List Symbol) :
    (programMatches context left).operations ≤ 44 * contextSize context.frames + 4 * left.length + 65 := by
  have sameBound := Nat.le_trans
    (RogozhinContextDataPrimitive.equalCells_operations_le (reversedProgram context).value
      (stripAudit left).value)
    (Nat.add_le_add_right (Nat.mul_le_mul_left 11 (reversedProgram_length_le context)) 3)
  have bound := Nat.add_le_add_right (Nat.add_le_add
    (Nat.add_le_add (stripAudit_operations_le left) (reversedProgram_operations_le context)) sameBound) 4
  have sumEq : (4 * left.length + 3) + (22 * contextSize context.frames + 22) +
      (11 * (2 * contextSize context.frames + 3) + 3) + 4 =
      44 * contextSize context.frames + 4 * left.length + 65 := by
    rw [show 44 * contextSize context.frames =
        22 * contextSize context.frames + (11 * 2) * contextSize context.frames from
        Nat.add_mul 22 (11 * 2) _]
    simp only [Nat.mul_add, Nat.mul_assoc, show 65 = 3 + 22 + (11 * 3 + 3) + 4 by rfl,
      Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
  rw [sumEq] at bound
  exact bound

end PureSFormal.Computation.RogozhinContextProgramPrimitive
