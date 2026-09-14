import PureSFormal.Computation.CookSeedTerminalPrimitive
import PureSFormal.Computation.TapeRowPrimitive

/-!
# Measured literal row, terminal row, and scanned-bit suffixes

This composes the actual stack/row decoder with static terminal recognition and
a structural tape lookup. Rejection and all repeated scans are charged. The cap
is a theorem parameter only, never an execution input or runtime countdown.
-/

namespace PureSFormal.Computation.CookDecodedRowPrimitive

open PureS.ParserPrimitiveMachine PureS.ParserRoutePrimitive
open PureSFormal.Research.ProtectedTrieDeterministicCompiler
open RogozhinFramePrimitiveSize
open CookSeedReadbackContext (Context)

def guardRow (context : Context) (row : DeterministicTape.Row) : Result (Option DeterministicTape.Row) :=
  let checked := CookSeedTerminalPrimitive.terminalRow context row
  ⟨if checked.value then some row else none, checked.operations + 3⟩

theorem guardRow_value (context : Context) (row : DeterministicTape.Row) :
    (guardRow context row).value = if CookSeedTerminalReadback.terminalRow context row then some row else none := by
  simp only [guardRow, CookSeedTerminalPrimitive.terminalRow_value]

theorem guardRow_identity (context : Context) (row output : DeterministicTape.Row)
    (accepted : (guardRow context row).value = some output) : output = row := by
  unfold guardRow at accepted
  dsimp only at accepted
  split at accepted
  · exact (Option.some.inj accepted).symm
  · cases accepted

theorem guardRow_operations_le (context : Context) (row : DeterministicTape.Row) :
    (guardRow context row).operations ≤
      CookSeedTerminalPrimitive.terminalBudget (contextSize context.frames) row.state row.tape.length + 3 :=
  Nat.add_le_add_right (CookSeedTerminalPrimitive.terminalRow_operations_le context row) 3

def terminal (context : Context) (candidate : ThreeCounter.State) : Result (Option DeterministicTape.Row) :=
  andThen (TapeRowPrimitive.parse candidate) (guardRow context)

theorem terminal_value (context : Context) (candidate : ThreeCounter.State) :
    (terminal context candidate).value =
      (DeterministicTapeTrajectoryDecoder.decodeTapeBoundary? candidate).bind
        (fun row => if CookSeedTerminalReadback.terminalRow context row then some row else none) := by
  rw [terminal, andThen_value, TapeRowPrimitive.parse_value]
  cases DeterministicTapeTrajectoryDecoder.decodeTapeBoundary? candidate with
  | none => rfl
  | some row => exact guardRow_value context row

theorem terminal_fields (context : Context) (candidate : ThreeCounter.State) (row : DeterministicTape.Row)
    (accepted : (terminal context candidate).value = some row) :
    row.state ≤ candidate.control ∧ row.head ≤ candidate.left ∧
      row.tape.length ≤ candidate.left + candidate.right := by
  rw [terminal, andThen_value] at accepted
  cases decoded : (TapeRowPrimitive.parse candidate).value with
  | none => rw [decoded] at accepted; cases accepted
  | some output =>
      rw [decoded] at accepted
      rw [guardRow_identity context output row accepted]
      exact TapeRowPrimitive.parse_fields candidate output decoded

def terminalBudget (size cap : Nat) : Nat :=
  640 * (cap + 1)^2 + CookSeedTerminalPrimitive.terminalBudget size cap (cap + cap) + 5

theorem terminal_operations_le_cap (context : Context) (candidate : ThreeCounter.State) (cap : Nat)
    (controlLe : candidate.control ≤ cap) (leftLe : candidate.left ≤ cap) (rightLe : candidate.right ≤ cap) :
    (terminal context candidate).operations ≤ terminalBudget (contextSize context.frames) cap := by
  have continuation (row : DeterministicTape.Row)
      (found : (TapeRowPrimitive.parse candidate).value = some row) :
      (guardRow context row).operations ≤
        CookSeedTerminalPrimitive.terminalBudget (contextSize context.frames) cap (cap + cap) + 3 := by
    have fields := TapeRowPrimitive.parse_fields candidate row found
    exact Nat.le_trans (guardRow_operations_le context row) (Nat.add_le_add_right
      (CookSeedTerminalPrimitive.terminalBudget_mono (Nat.le_refl _)
        (Nat.le_trans fields.1 controlLe) (Nat.le_trans fields.2.2 (Nat.add_le_add leftLe rightLe))) 3)
  have bound := andThen_operations_le (TapeRowPrimitive.parse candidate) (guardRow context)
    (CookSeedTerminalPrimitive.terminalBudget (contextSize context.frames) cap (cap + cap) + 3) continuation
  have bounded := Nat.le_trans bound (Nat.add_le_add_right (Nat.add_le_add_right
    (TapeRowPrimitive.parse_operations_le_cap candidate cap controlLe leftLe rightLe) 2) _)
  simpa only [terminal, terminalBudget, show 5 = 2 + 3 by rfl,
    Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using bounded

def scannedRow (row : DeterministicTape.Row) : Result (Option Bool) :=
  let found := CookSeedTerminalPrimitive.lookupOption row.tape row.head
  ⟨found.value, found.operations + 3⟩

theorem scannedRow_value (row : DeterministicTape.Row) :
    (scannedRow row).value = PureSFormal.Research.ProtectedTrieMachine.scanned? row :=
  CookSeedTerminalPrimitive.lookupOption_value row.tape row.head

theorem scannedRow_operations_le (row : DeterministicTape.Row) :
    (scannedRow row).operations ≤ 5 * row.tape.length + 7 := by
  simpa only [scannedRow, show 7 = 4 + 3 by rfl, Nat.add_assoc] using
    Nat.add_le_add_right (CookSeedTerminalPrimitive.lookupOption_operations_le row.tape row.head) 3

def scanned (context : Context) (candidate : ThreeCounter.State) : Result (Option Bool) :=
  andThen (terminal context candidate) scannedRow

theorem scanned_value (context : Context) (candidate : ThreeCounter.State) :
    (scanned context candidate).value =
      ((DeterministicTapeTrajectoryDecoder.decodeTapeBoundary? candidate).bind
        (fun row => if CookSeedTerminalReadback.terminalRow context row then some row else none)).bind
          PureSFormal.Research.ProtectedTrieMachine.scanned? := by
  rw [scanned, andThen_value, terminal_value]
  cases (DeterministicTapeTrajectoryDecoder.decodeTapeBoundary? candidate).bind
      (fun row => if CookSeedTerminalReadback.terminalRow context row then some row else none) with
  | none => rfl
  | some row => exact scannedRow_value row

def scannedBudget (size cap : Nat) : Nat := terminalBudget size cap + 10 * cap + 9

theorem scanned_operations_le_cap (context : Context) (candidate : ThreeCounter.State) (cap : Nat)
    (controlLe : candidate.control ≤ cap) (leftLe : candidate.left ≤ cap) (rightLe : candidate.right ≤ cap) :
    (scanned context candidate).operations ≤ scannedBudget (contextSize context.frames) cap := by
  have continuation (row : DeterministicTape.Row)
      (found : (terminal context candidate).value = some row) :
      (scannedRow row).operations ≤ 10 * cap + 7 := by
    have fields := terminal_fields context candidate row found
    have bound := Nat.add_le_add_right (Nat.mul_le_mul_left 5
      (Nat.le_trans fields.2.2 (Nat.add_le_add leftLe rightLe))) 7
    exact Nat.le_trans (scannedRow_operations_le row) (by
      simpa only [Nat.mul_add, show 10 * cap = 5 * cap + 5 * cap from Nat.add_mul 5 5 cap] using bound)
  have bound := andThen_operations_le (terminal context candidate) scannedRow (10 * cap + 7) continuation
  have bounded := Nat.le_trans bound (Nat.add_le_add_right (Nat.add_le_add_right
    (terminal_operations_le_cap context candidate cap controlLe leftLe rightLe) 2) _)
  simpa only [scanned, scannedBudget, show 9 = 2 + 7 by rfl,
    Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using bounded

theorem terminalBudget_mono {firstSize secondSize firstCap secondCap : Nat}
    (size : firstSize ≤ secondSize) (cap : firstCap ≤ secondCap) :
    terminalBudget firstSize firstCap ≤ terminalBudget secondSize secondCap :=
  Nat.add_le_add_right (Nat.add_le_add
    (Nat.mul_le_mul_left 640 (Nat.pow_le_pow_left (Nat.add_le_add_right cap 1) 2))
    (CookSeedTerminalPrimitive.terminalBudget_mono size cap (Nat.add_le_add cap cap))) 5

theorem scannedBudget_mono {firstSize secondSize firstCap secondCap : Nat}
    (size : firstSize ≤ secondSize) (cap : firstCap ≤ secondCap) :
    scannedBudget firstSize firstCap ≤ scannedBudget secondSize secondCap :=
  Nat.add_le_add_right (Nat.add_le_add (terminalBudget_mono size cap) (Nat.mul_le_mul_left 10 cap)) 9

end PureSFormal.Computation.CookDecodedRowPrimitive
