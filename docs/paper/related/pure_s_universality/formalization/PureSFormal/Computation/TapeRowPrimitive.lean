import PureSFormal.Computation.TapeStackPrimitive
import PureSFormal.Computation.DeterministicTapeTrajectoryDecoder
import PureSFormal.PureS.ParserPositivePrimitive

/-!
# Primitive source-row decoding

The decoder checks the primitive state tag and empty scratch register, divides
the control index by the fixed unary phase count, and parses both stack codes.
One list pass constructs the reversed left tape onto the shared right tape
while counting the head position. Every output cell and unary successor is
charged. The fixed phase-count constant is prepared before the input state.
-/

namespace PureSFormal.Computation.TapeRowPrimitive

open PureS ParserPrimitiveMachine ParserNatDivisionPrimitive
open ParserRoutePrimitive (andThen andThen_value andThen_operations_le)
open PureSFormal.Research.ProtectedTrieDeterministicCompiler
open DeterministicTapeCounterCompiler DeterministicTapeThreeCounterCompiler

def collect : List Bool → List Bool → Nat → Result (Nat × List Bool)
  | [], tape, count => ⟨(count, tape), 2⟩
  | bit :: rest, tape, count =>
      let inner := collect rest (bit :: tape) (Nat.succ count)
      ⟨inner.value, inner.operations + 6⟩

theorem collect_value (left tape : List Bool) (count : Nat) :
    (collect left tape count).value = (count + left.length, left.reverse ++ tape) := by
  induction left generalizing tape count with
  | nil => rfl
  | cons bit rest ih =>
      simp only [collect, ih, List.length_cons, List.reverse_cons, List.append_assoc,
        List.cons_append, List.nil_append, Nat.succ_add, Nat.add_succ]

theorem collect_operations (left tape : List Bool) (count : Nat) :
    (collect left tape count).operations = 6 * left.length + 2 := by
  induction left generalizing tape count with
  | nil => rfl
  | cons bit rest ih =>
      simp only [collect, ih, List.length_cons, Nat.mul_succ,
        Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

def row (state : Nat) (left right : List Bool) : Result DeterministicTape.Row :=
  let tape := collect left right 0
  ⟨{ state := state, head := tape.value.1, tape := tape.value.2 }, tape.operations + 4⟩

theorem row_value (state : Nat) (left right : List Bool) :
    (row state left right).value = rowOf state left right := by
  rw [row, collect_value, Nat.zero_add]
  rfl

theorem row_operations (state : Nat) (left right : List Bool) :
    (row state left right).operations = 6 * left.length + 6 := by
  rw [row, collect_operations]

def finish (state : Nat) (left right : List Bool) : Result (Option DeterministicTape.Row) :=
  match right with
  | [] => ⟨none, 2⟩
  | _ :: _ =>
      let result := row state left right
      ⟨some result.value, result.operations + 2⟩

theorem finish_value (state : Nat) (left right : List Bool) :
    (finish state left right).value = if right = [] then none else some (rowOf state left right) := by
  cases right with
  | nil => rfl
  | cons bit rest =>
      rw [finish, row_value, if_neg (List.cons_ne_nil bit rest)]

theorem finish_operations_le (state : Nat) (left right : List Bool) :
    (finish state left right).operations ≤ 6 * left.length + 8 := by
  cases right with
  | nil => exact Nat.le_trans (by decide : 2 ≤ 8) (Nat.le_add_left _ _)
  | cons bit rest =>
      rw [finish, row_operations]
      exact Nat.le_refl _

def stacks (state leftCode rightCode : Nat) : Result (Option DeterministicTape.Row) :=
  andThen (TapeStackPrimitive.parse leftCode) fun left =>
    andThen (TapeStackPrimitive.parse rightCode) fun right => finish state left right

theorem stacks_value (state leftCode rightCode : Nat) :
    (stacks state leftCode rightCode).value =
      match StackCode.decode? leftCode, StackCode.decode? rightCode with
      | some left, some right => if right = [] then none else some (rowOf state left right)
      | _, _ => none := by
  rw [stacks, andThen_value, TapeStackPrimitive.parse_value]
  cases StackCode.decode? leftCode with
  | none => rfl
  | some left =>
      dsimp only [Option.bind]
      rw [andThen_value, TapeStackPrimitive.parse_value]
      cases StackCode.decode? rightCode with
      | none => rfl
      | some right => exact finish_value state left right

theorem stacks_fields (state leftCode rightCode : Nat) (decoded : DeterministicTape.Row)
    (found : (stacks state leftCode rightCode).value = some decoded) :
    decoded.state = state ∧ decoded.head ≤ leftCode ∧ decoded.tape.length ≤ leftCode + rightCode := by
  rw [stacks_value] at found
  cases leftFound : StackCode.decode? leftCode with
  | none => rw [leftFound] at found; cases found
  | some left =>
      rw [leftFound] at found
      cases rightFound : StackCode.decode? rightCode with
      | none => rw [rightFound] at found; cases found
      | some right =>
          rw [rightFound] at found
          change (if right = [] then none else some (rowOf state left right)) = some decoded at found
          by_cases empty : right = []
          · rw [if_pos empty] at found
            cases found
          · rw [if_neg empty] at found
            have rowEq := Option.some.inj found
            subst decoded
            have leftLength := TapeStackPrimitive.parsed_length_le leftCode left
              ((TapeStackPrimitive.parse_value leftCode).trans leftFound)
            have rightLength := TapeStackPrimitive.parsed_length_le rightCode right
              ((TapeStackPrimitive.parse_value rightCode).trans rightFound)
            refine ⟨rfl, leftLength, ?_⟩
            simpa only [rowOf, List.length_append, List.length_reverse] using
              Nat.add_le_add leftLength rightLength

theorem stacks_operations_le (state leftCode rightCode : Nat) :
    (stacks state leftCode rightCode).operations ≤
      32 * (leftCode + 1) ^ 2 + 32 * (rightCode + 1) ^ 2 + 6 * leftCode + 12 := by
  have continuationBound (left : List Bool)
      (found : (TapeStackPrimitive.parse leftCode).value = some left) :
      (andThen (TapeStackPrimitive.parse rightCode) fun right => finish state left right).operations ≤
        32 * (rightCode + 1) ^ 2 + 6 * leftCode + 10 := by
    have finishBound (right : List Bool) : (finish state left right).operations ≤ 6 * leftCode + 8 :=
      Nat.le_trans (finish_operations_le state left right)
        (Nat.add_le_add_right (Nat.mul_le_mul_left 6 (TapeStackPrimitive.parsed_length_le leftCode left found)) 8)
    have counted := andThen_operations_le (TapeStackPrimitive.parse rightCode) _ (6 * leftCode + 8)
      (fun right _ => finishBound right)
    have bounded := Nat.add_le_add_right
      (Nat.add_le_add_right (TapeStackPrimitive.parse_operations_le rightCode) 2) (6 * leftCode + 8)
    exact Nat.le_trans counted (by simpa only [show 10 = 2 + 8 by rfl,
      Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using bounded)
  have counted := andThen_operations_le (TapeStackPrimitive.parse leftCode) _
    (32 * (rightCode + 1) ^ 2 + 6 * leftCode + 10) continuationBound
  have bounded := Nat.add_le_add_right
    (Nat.add_le_add_right (TapeStackPrimitive.parse_operations_le leftCode) 2)
    (32 * (rightCode + 1) ^ 2 + 6 * leftCode + 10)
  exact Nat.le_trans counted (by simpa only [show 12 = 2 + 10 by rfl,
    Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using bounded)

def control (code leftCode rightCode : Nat) : Result (Option DeterministicTape.Row) :=
  let divided := divMod Layout.phaseCount code
  match divided.value.2 with
  | 0 =>
      let decoded := stacks divided.value.1 leftCode rightCode
      ⟨decoded.value, divided.operations + decoded.operations + 3⟩
  | .succ _ => ⟨none, divided.operations + 3⟩

theorem control_value (code leftCode rightCode : Nat) :
    (control code leftCode rightCode).value =
      if code % Layout.phaseCount = 0 then (stacks (code / Layout.phaseCount) leftCode rightCode).value
      else none := by
  rw [control, divMod_value]
  cases code % Layout.phaseCount with
  | zero => rfl
  | succ remainder => rfl

theorem control_operations_le (code leftCode rightCode : Nat) :
    (control code leftCode rightCode).operations ≤
      522 * code + 32 * (leftCode + 1) ^ 2 + 32 * (rightCode + 1) ^ 2 + 6 * leftCode + 18 := by
  have divided : (divMod Layout.phaseCount code).operations ≤ 522 * code + 3 :=
    divMod_operations_le Layout.phaseCount code
  have stacksBound := stacks_operations_le (divMod Layout.phaseCount code).value.1 leftCode rightCode
  have bound := Nat.add_le_add_right (Nat.add_le_add divided stacksBound) 3
  rw [control]
  split
  · simpa only [show 18 = 3 + 12 + 3 by rfl,
      Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using bound
  · apply Nat.le_trans (Nat.add_le_add_right (Nat.le_add_right
      (divMod Layout.phaseCount code).operations
      (stacks (divMod Layout.phaseCount code).value.1 leftCode rightCode).operations) 3)
    simpa only [show 18 = 3 + 12 + 3 by rfl,
      Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using bound

def parse (candidate : ThreeCounter.State) : Result (Option DeterministicTape.Row) :=
  match candidate.status with
  | .halted => ⟨none, 3⟩
  | .running =>
      match candidate.scratch with
      | 0 =>
          let decoded := control candidate.control candidate.left candidate.right
          ⟨decoded.value, decoded.operations + 7⟩
      | .succ _ => ⟨none, 5⟩

theorem parse_value (candidate : ThreeCounter.State) :
    (parse candidate).value = DeterministicTapeTrajectoryDecoder.decodeTapeBoundary? candidate := by
  cases candidate with
  | mk code left right scratch status =>
      cases status with
      | halted => rfl
      | running =>
          cases scratch with
          | succ scratch => rfl
          | zero =>
              change (control code left right).value = _
              rw [control_value]
              change (if code % Layout.phaseCount = 0 then (stacks (code / Layout.phaseCount) left right).value else none) =
                (if code % Layout.phaseCount = 0 then _ else none)
              split
              · exact stacks_value _ _ _
              · rfl

theorem parse_operations_le_cap (candidate : ThreeCounter.State) (cap : Nat)
    (controlLe : candidate.control ≤ cap) (leftLe : candidate.left ≤ cap) (rightLe : candidate.right ≤ cap) :
    (parse candidate).operations ≤ 640 * (cap + 1) ^ 2 := by
  have linear (coefficient value : Nat) (bounded : value ≤ cap) :
      coefficient * value ≤ coefficient * (cap + 1) ^ 2 :=
    Nat.le_trans (Nat.mul_le_mul_left coefficient (Nat.le_trans bounded (Nat.le_succ cap)))
      (ParserCarrierPrimitive.linear_le_square coefficient cap)
  have square (coefficient value : Nat) (bounded : value ≤ cap) :
      coefficient * (value + 1) ^ 2 ≤ coefficient * (cap + 1) ^ 2 :=
    Nat.mul_le_mul_left coefficient (Nat.pow_le_pow_left (Nat.succ_le_succ bounded) 2)
  have budget := Nat.add_le_add
    (Nat.add_le_add
      (Nat.add_le_add (Nat.add_le_add (linear 522 candidate.control controlLe)
        (square 32 candidate.left leftLe)) (square 32 candidate.right rightLe))
      (linear 6 candidate.left leftLe)) (ParserPositivePrimitive.constant_le_square 25 cap)
  have enlarged := Nat.mul_le_mul_right ((cap + 1) ^ 2) (by decide : 522 + 32 + 32 + 6 + 25 ≤ 640)
  have ceiling : 522 * candidate.control + 32 * (candidate.left + 1) ^ 2 +
      32 * (candidate.right + 1) ^ 2 + 6 * candidate.left + 25 ≤ 640 * (cap + 1) ^ 2 :=
    Nat.le_trans budget (by simpa only [Nat.add_mul] using enlarged)
  have minimum := ParserPositivePrimitive.constant_le_square 640 cap
  rw [parse]
  split
  · exact Nat.le_trans (by decide : 3 ≤ 640) minimum
  · split
    · have counted := Nat.add_le_add_right
        (control_operations_le candidate.control candidate.left candidate.right) 7
      exact Nat.le_trans (by simpa only [show 25 = 18 + 7 by rfl, Nat.add_assoc] using counted) ceiling
    · exact Nat.le_trans (by decide : 5 ≤ 640) minimum

theorem parse_operations_le (candidate : ThreeCounter.State) :
    (parse candidate).operations ≤
      640 * (candidate.control + candidate.left + candidate.right + 1) ^ 2 := by
  apply parse_operations_le_cap
  · exact Nat.le_trans (Nat.le_add_right _ _) (Nat.le_add_right _ _)
  · exact Nat.le_trans (Nat.le_add_left _ _) (Nat.le_add_right _ _)
  · exact Nat.le_add_left _ _

theorem parse_fields (candidate : ThreeCounter.State) (decoded : DeterministicTape.Row)
    (found : (parse candidate).value = some decoded) :
    decoded.state ≤ candidate.control ∧ decoded.head ≤ candidate.left ∧
      decoded.tape.length ≤ candidate.left + candidate.right := by
  rw [parse] at found
  split at found
  · cases found
  · split at found
    · change (control candidate.control candidate.left candidate.right).value = some decoded at found
      rw [control_value] at found
      split at found
      · have fields := stacks_fields _ _ _ decoded found
        exact ⟨Nat.le_trans (Nat.le_of_eq fields.1)
          (Nat.div_le_self candidate.control Layout.phaseCount), fields.2⟩
      · cases found
    · cases found

end PureSFormal.Computation.TapeRowPrimitive
