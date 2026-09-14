import PureSFormal.Computation.RogozhinProgramReadback
import PureSFormal.PureS.ParserCheckpointPrimitive

/-!
# Primitive Rogozhin program-frame parsing

Symbols form a fixed finite alphabet. Lists and unary natural numbers are
immutable constructor references. Reading a constructor or child reference,
branching on a Boolean, and allocating a data constructor each cost one.
Exponent increments allocate one successor and share the previous width.
The cost records are proof instrumentation; stopping costs record the fixed
pattern matcher inspections preceding the fallback branch.
-/

namespace PureSFormal.Computation.RogozhinFramePrimitive

open PureS PureS.ParserPrimitiveMachine
open PureS.ParserRoutePrimitive (andThen charge andThen_value andThen_operations_le)

abbrev Symbol := Rogozhin46.Symbol

def exponentStopObservations : List Symbol → Nat
  | [] => 1
  | .s1 :: [] => 5
  | .s1 :: _ :: _ => 7
  | _ :: _ => 3

theorem exponentStopObservations_le (cells : List Symbol) : exponentStopObservations cells ≤ 7 := by
  fun_cases exponentStopObservations cells <;> decide

def exponents (width : Nat) : List Symbol → Result (List Nat × List Symbol)
  | .s0 :: rest =>
      let inner := exponents (.succ width) rest
      ⟨inner.value, inner.operations + 5⟩
  | .s1 :: .s1 :: rest =>
      let inner := exponents 0 rest
      ⟨(width :: inner.value.1, inner.value.2), inner.operations + 13⟩
  | rest => ⟨([width], rest), exponentStopObservations rest + 3⟩

theorem exponents_value (width : Nat) (cells : List Symbol) :
    (exponents width cells).value = RogozhinProgramReadback.parseExponentsAux width cells := by
  fun_induction exponents width cells <;>
    simp_all (config := { zetaDelta := true }) only [exponents, RogozhinProgramReadback.parseExponentsAux]

theorem exponents_suffix_length_le (width : Nat) (cells : List Symbol) :
    (exponents width cells).value.2.length ≤ cells.length := by
  fun_induction exponents width cells
  · next width rest ih => exact Nat.le_trans ih (Nat.le_succ _)
  · next width rest ih => exact Nat.le_trans ih (Nat.le_trans (Nat.le_succ _) (Nat.le_succ _))
  · simp_all only [exponents, Nat.le_refl]

theorem exponents_operations_le (width : Nat) (cells : List Symbol) :
    (exponents width cells).operations ≤ 16 * (cells.length + 1) := by
  fun_induction exponents width cells
  · next width rest ih =>
      have bound := Nat.add_le_add ih (by decide : 5 ≤ 16)
      simpa only [exponents, List.length_cons, Nat.succ_eq_add_one, Nat.mul_add,
        Nat.mul_one, Nat.add_assoc] using bound
  · next width rest ih =>
      have bound := Nat.add_le_add ih (by decide : 13 ≤ 16 + 16)
      simpa only [exponents, List.length_cons, Nat.succ_eq_add_one, Nat.mul_add,
        Nat.mul_one, Nat.add_assoc] using bound
  · next rest excludedZero excludedSeparator =>
      simp_all only [exponents]
      have bound := Nat.add_le_add_right (exponentStopObservations_le rest) 3
      exact Nat.le_trans bound (Nat.le_trans (by decide : 7 + 3 ≤ 16)
        (ParserRoutePrimitive.constant_le_scale 16 rest.length))

def frameStopObservations : List Symbol → Nat
  | [] => 1
  | .s1 :: [] => 5
  | .s1 :: .s0 :: [] => 9
  | .s1 :: .s0 :: _ :: _ => 11
  | .s1 :: _ :: _ => 7
  | _ :: _ => 3

theorem frameStopObservations_le (cells : List Symbol) : frameStopObservations cells ≤ 11 := by
  fun_cases frameStopObservations cells <;> decide

def frame : List Symbol → Result (Option (List Nat × List Symbol))
  | .s1 :: .s0 :: .s1 :: rest =>
      let parsed := exponents 0 rest
      ⟨some parsed.value, parsed.operations + 14⟩
  | cells => ⟨none, frameStopObservations cells + 1⟩

theorem frame_value (cells : List Symbol) :
    (frame cells).value = RogozhinProgramReadback.parseFrame? cells := by
  fun_cases frame cells <;> simp_all (config := { zetaDelta := true }) only [frame, RogozhinProgramReadback.parseFrame?, exponents_value]

theorem frame_suffix_length_le {cells : List Symbol} {parsed : List Nat × List Symbol}
    (found : (frame cells).value = some parsed) : parsed.2.length ≤ cells.length := by
  unfold frame at found
  split at found
  · next rest =>
      change some (exponents 0 rest).value = some parsed at found
      cases found
      exact Nat.le_trans (exponents_suffix_length_le 0 rest)
        (Nat.le_trans (Nat.le_succ _) (Nat.le_trans (Nat.le_succ _) (Nat.le_succ _)))
  · cases found

theorem frame_operations_le (cells : List Symbol) : (frame cells).operations ≤ 32 * (cells.length + 1) := by
  unfold frame
  split
  · next rest =>
      have first := Nat.add_le_add_right (exponents_operations_le 0 rest) 14
      have size : rest.length + 1 ≤ (.s1 :: .s0 :: .s1 :: rest).length + 1 :=
        Nat.add_le_add_right (Nat.le_trans (Nat.le_succ _)
          (Nat.le_trans (Nat.le_succ _) (Nat.le_succ _))) 1
      have second := Nat.add_le_add (Nat.mul_le_mul_left 16 size)
        (Nat.le_trans (by decide : 14 ≤ 16)
          (ParserRoutePrimitive.constant_le_scale 16 ((.s1 :: .s0 :: .s1 :: rest) : List Symbol).length))
      exact Nat.le_trans first (by simpa only [show 32 = 16 + 16 by rfl, Nat.add_mul] using second)
  ·
      exact Nat.le_trans (Nat.add_le_add_right (frameStopObservations_le cells) 1)
        (Nat.le_trans (by decide : 11 + 1 ≤ 32) (ParserRoutePrimitive.constant_le_scale 32 cells.length))

def separator : List Symbol → Result Bool
  | [] => ⟨false, 1⟩
  | .s1 :: [] => ⟨true, 5⟩
  | .s1 :: _ :: _ => ⟨false, 5⟩
  | _ :: _ => ⟨false, 3⟩

theorem separator_value (cells : List Symbol) : (separator cells).value = true ↔ cells = [.s1] := by
  fun_cases separator cells <;> simp_all [separator]

theorem separator_operations_le (cells : List Symbol) : (separator cells).operations ≤ 5 := by
  fun_cases separator cells <;> simp_all only [separator] <;> decide

def frames : Nat → List Symbol → Result (Option (List (List Nat)))
  | 0, cells =>
      let boundary := separator cells
      if boundary.value then ⟨some [], boundary.operations + 4⟩
      else ⟨none, boundary.operations + 3⟩
  | .succ fuel, cells =>
      let boundary := separator cells
      if boundary.value then ⟨some [], boundary.operations + 5⟩
      else
        let output := andThen (frame cells) fun parsed =>
          charge 2 (andThen (frames fuel parsed.2) fun remaining => ⟨some (parsed.1 :: remaining), 2⟩)
        ⟨output.value, boundary.operations + 3 + output.operations⟩

theorem frames_value (fuel : Nat) (cells : List Symbol) :
    (frames fuel cells).value = RogozhinProgramReadback.parseFramesAux fuel cells := by
  induction fuel generalizing cells with
  | zero =>
      unfold frames RogozhinProgramReadback.parseFramesAux
      dsimp only
      by_cases boundary : cells = [.s1]
      · rw [if_pos ((separator_value cells).mpr boundary), if_pos boundary]
      · rw [if_neg (fun accepted => boundary ((separator_value cells).mp accepted)), if_neg boundary]
  | succ fuel ih =>
      unfold frames RogozhinProgramReadback.parseFramesAux
      dsimp only
      by_cases boundary : cells = [.s1]
      · rw [if_pos ((separator_value cells).mpr boundary), if_pos boundary]
      · rw [if_neg (fun accepted => boundary ((separator_value cells).mp accepted)), if_neg boundary]
        change (andThen _ _).value = _
        rw [andThen_value, frame_value]
        cases RogozhinProgramReadback.parseFrame? cells with
        | none => rfl
        | some parsed =>
            dsimp only [Option.bind]
            change (andThen _ _).value = _
            rw [andThen_value, ih]
            cases RogozhinProgramReadback.parseFramesAux fuel parsed.2 <;> rfl

def framesBound (fuel size : Nat) : Nat := 64 * (fuel + 1) * (size + 1)

theorem minimum_framesBound (fuel size : Nat) : 64 ≤ framesBound fuel size :=
  Nat.le_trans (ParserRoutePrimitive.constant_le_scale 64 fuel)
    (ParserRoutePrimitive.constant_le_scale (64 * (fuel + 1)) size)

theorem frames_operations_le (fuel : Nat) (cells : List Symbol) :
    (frames fuel cells).operations ≤ framesBound fuel cells.length := by
  induction fuel generalizing cells with
  | zero =>
      unfold frames
      dsimp only
      have bound := Nat.add_le_add_right (separator_operations_le cells) 4
      have ceiling := Nat.le_trans (by decide : 5 + 4 ≤ 64) (minimum_framesBound 0 cells.length)
      split
      · exact Nat.le_trans bound ceiling
      · exact Nat.le_trans (Nat.add_le_add_left (by decide : 3 ≤ 4) _) (Nat.le_trans bound ceiling)
  | succ fuel ih =>
      unfold frames
      dsimp only
      split
      · exact Nat.le_trans (Nat.add_le_add_right (separator_operations_le cells) 5)
          (Nat.le_trans (by decide : 5 + 5 ≤ 64) (minimum_framesBound (.succ fuel) cells.length))
      · have continuationBound (parsed : List Nat × List Symbol)
            (found : (frame cells).value = some parsed) :
            (charge 2 (andThen (frames fuel parsed.2) fun remaining =>
              ⟨some (parsed.1 :: remaining), 2⟩)).operations ≤ framesBound fuel cells.length + 6 := by
          have inner := Nat.le_trans (ih parsed.2)
            (Nat.mul_le_mul_left (64 * (fuel + 1))
              (Nat.add_le_add_right (frame_suffix_length_le found) 1))
          have counted := andThen_operations_le (frames fuel parsed.2)
            (fun remaining => ⟨some (parsed.1 :: remaining), 2⟩) 2 (fun _ _ => Nat.le_refl _)
          have bound := Nat.add_le_add_left
            (Nat.le_trans counted (Nat.add_le_add_right (Nat.add_le_add_right inner 2) 2)) 2
          simpa only [show 6 = 2 + 2 + 2 by rfl, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using! bound
        have counted := andThen_operations_le (frame cells)
          (fun parsed => charge 2 (andThen (frames fuel parsed.2) fun remaining =>
            ⟨some (parsed.1 :: remaining), 2⟩)) (framesBound fuel cells.length + 6) continuationBound
        have bounded := Nat.add_le_add
          (Nat.add_le_add_right (separator_operations_le cells) 3)
          (Nat.le_trans counted (Nat.add_le_add_right (Nat.add_le_add_right (frame_operations_le cells) 2) _))
        have overhead : 32 * (cells.length + 1) + 16 ≤ 64 * (cells.length + 1) := by
          have constant := Nat.le_trans (by decide : 16 ≤ 32)
            (ParserRoutePrimitive.constant_le_scale 32 cells.length)
          simpa only [show 64 = 32 + 32 by rfl, Nat.add_mul] using
            Nat.add_le_add_left constant (32 * (cells.length + 1))
        have finalBound := Nat.add_le_add_right overhead (framesBound fuel cells.length)
        exact Nat.le_trans bounded (by
          simpa only [framesBound, show 16 = 5 + 3 + 2 + 6 by rfl,
            Nat.succ_eq_add_one, Nat.mul_add, Nat.add_mul, Nat.mul_one,
            Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using finalBound)

def fuelLength : List Symbol → Result Nat
  | [] => ⟨0, 2⟩
  | _ :: rest =>
      let inner := fuelLength rest
      ⟨.succ inner.value, inner.operations + 3⟩

theorem fuelLength_value (cells : List Symbol) : (fuelLength cells).value = cells.length := by
  induction cells with
  | nil => rfl
  | cons first rest ih => exact congrArg Nat.succ ih

theorem fuelLength_operations (cells : List Symbol) : (fuelLength cells).operations = 3 * cells.length + 2 := by
  induction cells with
  | nil => rfl
  | cons first rest ih =>
      change (fuelLength rest).operations + 3 = 3 * (rest.length + 1) + 2
      rw [ih]
      simp only [Nat.mul_add, Nat.mul_one, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

def programStopObservations : List Symbol → Nat
  | [] => 1
  | .s3 :: [] => 5
  | .s3 :: _ :: _ => 7
  | _ :: _ => 3

theorem programStopObservations_le (cells : List Symbol) : programStopObservations cells ≤ 7 := by
  fun_cases programStopObservations cells <;> decide

def program : List Symbol → Result (Option (List (List Nat)))
  | .s3 :: .s1 :: rest =>
      let fuel := fuelLength rest
      let parsed := frames fuel.value rest
      ⟨parsed.value, 8 + fuel.operations + parsed.operations⟩
  | cells => ⟨none, programStopObservations cells + 1⟩

theorem program_value (cells : List Symbol) :
    (program cells).value = RogozhinProgramReadback.parseProgram? cells := by
  fun_cases program cells <;>
    simp_all (config := { zetaDelta := true }) only [program, RogozhinProgramReadback.parseProgram?, fuelLength_value, frames_value]

theorem program_operations_le (cells : List Symbol) :
    (program cells).operations ≤ 80 * (cells.length + 1) ^ 2 := by
  unfold program
  split
  · next rest =>
      dsimp only
      have inner := frames_operations_le rest.length rest
      have overhead : 8 + (3 * rest.length + 2) ≤ 16 * (rest.length + 1) ^ 2 := by
        have linear := ParserCarrierPrimitive.linear_bound (by decide : 3 ≤ 16)
          (by decide : 10 ≤ 16) rest.length
        exact Nat.le_trans (by simpa only [show 10 = 8 + 2 by rfl,
          Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using linear)
          (ParserCarrierPrimitive.linear_le_square 16 rest.length)
      rw [fuelLength_value, fuelLength_operations]
      have bound := Nat.add_le_add overhead inner
      have localBound : 8 + (3 * rest.length + 2) + (frames rest.length rest).operations ≤
          80 * (rest.length + 1) ^ 2 := by
        simpa only [framesBound, Nat.pow_two, Nat.mul_assoc,
          show 80 = 16 + 64 by rfl, Nat.add_mul] using bound
      have sizeBound : rest.length ≤ ((.s3 :: .s1 :: rest) : List Symbol).length :=
        Nat.le_trans (Nat.le_succ _) (Nat.le_succ _)
      exact Nat.le_trans localBound
        (Nat.mul_le_mul_left 80 (ParserPositivePrimitive.square_mono sizeBound))
  · exact Nat.le_trans (Nat.add_le_add_right (programStopObservations_le cells) 1)
      (Nat.le_trans (by decide : 7 + 1 ≤ 80) (ParserPositivePrimitive.constant_le_square 80 cells.length))

end PureSFormal.Computation.RogozhinFramePrimitive
