import PureSFormal.Computation.RogozhinContextProgramPrimitive
import PureSFormal.Computation.CookSeedPassReadback

/-!
# Primitive seed-derived boundary and Cook-pass readback

The reader validates the machine state, immutable program region, blank-marker
case, and entire literal data code. `boundary_value` and `passTag_value` agree
with the existing observers on every input, without reachability assumptions.
`boundaryBudget` and `passTagBudget` are explicit polynomials in context mass
and the inspected input lengths, derived from the measured primitive calls.
-/

namespace PureSFormal.Computation.RogozhinContextBoundaryPrimitive

open PureS.ParserPrimitiveMachine RogozhinFramePrimitiveSize
open RogozhinContextDataPrimitive (dataBudget decode_operations_le decode_length_le)
open RogozhinContextProgramPrimitive (programMatches programMatches_value programMatches_operations_le)
open Rogozhin46 (Symbol Config)

def dataAt (context : CookSeedReadbackContext.Context) : Symbol → List Symbol → Result (Option (List Nat))
  | .s4, [] => ⟨some [], 3⟩
  | .s4, _ :: _ => ⟨none, 3⟩
  | current, right =>
      let found := RogozhinContextDataPrimitive.decode context (current :: right)
      ⟨found.value, found.operations + 2⟩

theorem dataAt_value (context : CookSeedReadbackContext.Context) (current : Symbol) (right : List Symbol) :
    (dataAt context current right).value =
      if current = .s4 then (if right = [] then some [] else none)
      else context.decodeData? (current :: right) := by
  cases current <;> cases right <;>
    simp only [dataAt, RogozhinContextDataPrimitive.decode_value,
      reduceCtorEq, ↓reduceIte]

theorem dataAt_operations_le (context : CookSeedReadbackContext.Context) (current : Symbol) (right : List Symbol) :
    (dataAt context current right).operations ≤ dataBudget (contextSize context.frames) (right.length + 1) + 3 := by
  have bound := Nat.le_trans (Nat.add_le_add_right (decode_operations_le context (current :: right)) 2)
    (Nat.add_le_add_left (by decide : 2 ≤ 3) _)
  cases current with
  | s0 | s1 | s2 | s3 | s5 => exact bound
  | s4 => cases right <;> exact Nat.le_add_left _ _

theorem dataAt_length_le (context : CookSeedReadbackContext.Context) (current : Symbol) (right : List Symbol)
    (word : List Nat) (accepted : (dataAt context current right).value = some word) :
    word.length ≤ right.length + 2 := by
  cases current with
  | s0 | s1 | s2 | s3 | s5 => exact decode_length_le context _ word accepted
  | s4 => cases right <;> cases accepted; exact Nat.zero_le _

def afterProgram (context : CookSeedReadbackContext.Context) (current : Symbol) (right : List Symbol)
    (guardPassed : Bool) : Result (Option (List Nat)) :=
  if guardPassed then dataAt context current right else ⟨none, 2⟩

theorem afterProgram_operations_le (context : CookSeedReadbackContext.Context)
    (current : Symbol) (right : List Symbol) (guardPassed : Bool) :
    (afterProgram context current right guardPassed).operations ≤
      dataBudget (contextSize context.frames) (right.length + 1) + 3 := by
  cases guardPassed with
  | true => exact dataAt_operations_le context current right
  | false => exact Nat.le_trans (by decide : 2 ≤ 3) (Nat.le_add_left _ _)

def boundary (context : CookSeedReadbackContext.Context) (configuration : Config) : Result (Option (List Nat)) :=
  match configuration.state with
  | .A =>
      let guardPassed := programMatches context configuration.left
      let parsed := afterProgram context configuration.current configuration.right guardPassed.value
      ⟨parsed.value, guardPassed.operations + parsed.operations + 8⟩
  | _ => ⟨none, 2⟩

theorem boundary_value (context : CookSeedReadbackContext.Context) (configuration : Config) :
    (boundary context configuration).value = context.decodeBoundary? configuration := by
  cases configuration with
  | mk state current left right =>
      cases state with
      | B | C | D =>
          simp only [boundary, CookSeedReadbackContext.Context.decodeBoundary?, reduceCtorEq,
            false_and, ↓reduceIte]
      | A =>
          simp only [boundary, CookSeedReadbackContext.Context.decodeBoundary?, true_and]
          cases matched : (programMatches context left).value with
          | true =>
              have eq := (programMatches_value context left).mp matched
              rw [if_pos eq]
              exact dataAt_value context current right
          | false =>
              have different : CookSeedReadbackContext.stripAudit left ≠ context.programCode.reverse := by
                intro eq
                have positive := (programMatches_value context left).mpr eq
                rw [matched] at positive
                cases positive
              rw [if_neg different]
              rfl

def boundaryBudget (size left right : Nat) : Nat :=
  44 * size + 4 * left + dataBudget size (right + 1) + 76

theorem boundary_operations_le (context : CookSeedReadbackContext.Context) (configuration : Config) :
    (boundary context configuration).operations ≤
      boundaryBudget (contextSize context.frames) configuration.left.length configuration.right.length := by
  cases configuration with
  | mk state current left right =>
      cases state with
      | B | C | D =>
          exact Nat.le_trans (by decide : 2 ≤ 76) (Nat.le_add_left _ _)
      | A =>
          have bound := Nat.add_le_add_right (Nat.add_le_add (programMatches_operations_le context left)
            (afterProgram_operations_le context current right (programMatches context left).value)) 8
          simpa only [boundary, boundaryBudget, show 76 = 65 + 3 + 8 by rfl,
            Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using bound

theorem boundary_length_le (context : CookSeedReadbackContext.Context) (configuration : Config)
    (word : List Nat) (accepted : (boundary context configuration).value = some word) :
    word.length ≤ configuration.right.length + 2 := by
  cases configuration with
  | mk state current left right =>
      cases state with
      | B | C | D => cases accepted
      | A =>
          change (afterProgram context current right (programMatches context left).value).value = some word at accepted
          unfold afterProgram at accepted
          split at accepted
          · exact dataAt_length_le context current right word accepted
          · cases accepted

theorem dataBudget_mono {firstSize secondSize firstCells secondCells : Nat}
    (sizeLe : firstSize ≤ secondSize) (cellsLe : firstCells ≤ secondCells) :
    dataBudget firstSize firstCells ≤ dataBudget secondSize secondCells := by
  have coefficient := Nat.add_le_add_right (Nat.add_le_add
    (Nat.mul_le_mul_left 85 (PureS.ParserPositivePrimitive.square_mono sizeLe))
    (Nat.mul_le_mul_left 40 sizeLe)) 137
  exact Nat.add_le_add_right (Nat.add_le_add (Nat.mul_le_mul_left 6 cellsLe)
    (Nat.mul_le_mul (Nat.add_le_add_right cellsLe 1) coefficient)) 18

theorem boundaryBudget_mono {firstSize secondSize firstLeft secondLeft firstRight secondRight : Nat}
    (sizeLe : firstSize ≤ secondSize) (leftLe : firstLeft ≤ secondLeft) (rightLe : firstRight ≤ secondRight) :
    boundaryBudget firstSize firstLeft firstRight ≤ boundaryBudget secondSize secondLeft secondRight := by
  exact Nat.add_le_add_right (Nat.add_le_add
    (Nat.add_le_add (Nat.mul_le_mul_left 44 sizeLe) (Nat.mul_le_mul_left 4 leftLe))
    (dataBudget_mono sizeLe (Nat.add_le_add_right rightLe 1))) 76

def passTag (context : CookSeedReadbackContext.Context) (horizon : Nat)
    (snapshot : CTS.Config Cook.rogozhinCookProgram) : Result (Option (List Nat)) :=
  PureS.ParserRoutePrimitive.andThen (CookPassPrimitive.parse horizon snapshot) (boundary context)

theorem passTag_value (context : CookSeedReadbackContext.Context) (horizon : Nat)
    (snapshot : CTS.Config Cook.rogozhinCookProgram) :
    (passTag context horizon snapshot).value = CookSeedPassReadback.decodePassTag? context horizon snapshot := by
  rw [passTag, PureS.ParserRoutePrimitive.andThen_value, CookSeedPassReadback.decodePassTag?]
  cases found : (CookPassPrimitive.parse horizon snapshot).value with
  | none =>
      have parsed := CookPassPrimitive.parse_value horizon snapshot
      rw [found] at parsed
      rw [← parsed]
      rfl
  | some configuration =>
      have parsed := CookPassPrimitive.parse_value horizon snapshot
      rw [found] at parsed
      rw [← parsed]
      change (boundary context configuration).value = context.decodeBoundary? configuration
      exact boundary_value context configuration

def passTagBudget (size cells : Nat) : Nat :=
  6144 * (cells + 1) ^ 2 + 2 + boundaryBudget size cells cells

theorem passTag_operations_le (context : CookSeedReadbackContext.Context) (horizon : Nat)
    (snapshot : CTS.Config Cook.rogozhinCookProgram) :
    (passTag context horizon snapshot).operations ≤
      passTagBudget (contextSize context.frames) snapshot.data.length := by
  have output (configuration : Config)
      (accepted : (CookPassPrimitive.parse horizon snapshot).value = some configuration) :
      (boundary context configuration).operations ≤
        boundaryBudget (contextSize context.frames) snapshot.data.length snapshot.data.length := by
    have fields := CookPassPrimitive.parse_fields horizon snapshot configuration accepted
    exact Nat.le_trans (boundary_operations_le context configuration)
      (boundaryBudget_mono (Nat.le_refl _) fields.1 fields.2)
  have bound := PureS.ParserRoutePrimitive.andThen_operations_le (CookPassPrimitive.parse horizon snapshot)
    (boundary context) (boundaryBudget (contextSize context.frames) snapshot.data.length snapshot.data.length) output
  exact Nat.le_trans bound (Nat.add_le_add_right
    (Nat.add_le_add_right (CookPassPrimitive.parse_operations_le horizon snapshot) 2) _)

theorem passTag_length_le (context : CookSeedReadbackContext.Context) (horizon : Nat)
    (snapshot : CTS.Config Cook.rogozhinCookProgram) (word : List Nat)
    (accepted : (passTag context horizon snapshot).value = some word) :
    word.length ≤ snapshot.data.length + 2 := by
  unfold passTag at accepted
  rw [PureS.ParserRoutePrimitive.andThen_value] at accepted
  cases found : (CookPassPrimitive.parse horizon snapshot).value with
  | none => rw [found] at accepted; cases accepted
  | some configuration =>
      rw [found] at accepted
      exact Nat.le_trans (boundary_length_le context configuration word accepted)
        (Nat.add_le_add_right (CookPassPrimitive.parse_fields horizon snapshot configuration found).2 2)

end PureSFormal.Computation.RogozhinContextBoundaryPrimitive
