import PureSFormal.Computation.CookSeedOutputPrimitive
import PureSFormal.Computation.BareTermReadbackFields
import PureSFormal.Computation.DeterministicTapePureSOutput

/-!
# Complete measured bare-term source-output observers

The three executable observers receive only a bare term. Their fixed parser
grammar is prepared before that input, and every extracted input field is
bounded by its literal tree size. Exact value agreement holds for arbitrary
terms, including malformed terms and noncheckpoints. Source correctness is
then inherited on the already proved persistent-cursor path; root-reset path
transfer remains a separate theorem.
-/

namespace PureSFormal.Computation.DeterministicTapeOutputPrimitive

open PureS PureS.ParserPrimitiveMachine
open PureSFormal.Research.ProtectedTrieDeterministicCompiler

abbrev tree := DeterministicTapePureSOutput.dispatcher.tree

def row : Term → Result (Option DeterministicTape.Row) :=
  BareTermReadbackFields.observe Cook.rogozhinCookProgram tree CookSeedOutputPrimitive.row

def terminal : Term → Result (Option DeterministicTape.Row) :=
  BareTermReadbackFields.observe Cook.rogozhinCookProgram tree CookSeedOutputPrimitive.terminal

def scanned : Term → Result (Option Bool) :=
  BareTermReadbackFields.observe Cook.rogozhinCookProgram tree CookSeedOutputPrimitive.scanned

theorem row_value (term : Term) : (row term).value = DeterministicTapePureSOutput.decodeRow? term := by
  rw [row, BareTermReadbackFields.observe_value]
  unfold DeterministicTapePureSOutput.decodeRow? CheckpointSeedReflection.observe
  cases CheckpointSeedReadback.decode? Cook.rogozhinCookProgram tree term with
  | none => rfl
  | some decoded => exact CookSeedOutputPrimitive.row_value decoded.1 decoded.2.1 decoded.2.2

theorem terminal_value (term : Term) : (terminal term).value = DeterministicTapePureSOutput.decodeTerminalRow? term := by
  rw [terminal, BareTermReadbackFields.observe_value]
  unfold DeterministicTapePureSOutput.decodeTerminalRow? CheckpointSeedReflection.observe
  cases CheckpointSeedReadback.decode? Cook.rogozhinCookProgram tree term with
  | none => rfl
  | some decoded => exact CookSeedOutputPrimitive.terminal_value decoded.1 decoded.2.1 decoded.2.2

theorem scanned_value (term : Term) : (scanned term).value = DeterministicTapePureSOutput.decodeScannedOutput? term := by
  rw [scanned, BareTermReadbackFields.observe_value]
  unfold DeterministicTapePureSOutput.decodeScannedOutput? CheckpointSeedReflection.observe
  cases CheckpointSeedReadback.decode? Cook.rogozhinCookProgram tree term with
  | none => rfl
  | some decoded => exact CookSeedOutputPrimitive.scanned_value decoded.1 decoded.2.1 decoded.2.2

def coefficient : Nat := CheckpointSeedReadbackPrimitive.coefficient Cook.rogozhinCookProgram tree

def rowBudget (size : Nat) : Nat :=
  coefficient * (size + 1)^2 + CookSeedOutputPrimitive.seedBudget CookSeedOutputPrimitive.rowBudget size size + 8

def terminalBudget (size : Nat) : Nat :=
  coefficient * (size + 1)^2 + CookSeedOutputPrimitive.seedBudget CookSeedOutputPrimitive.terminalBudget size size + 8

def scannedBudget (size : Nat) : Nat :=
  coefficient * (size + 1)^2 + CookSeedOutputPrimitive.seedBudget CookSeedOutputPrimitive.scannedBudget size size + 8

theorem row_operations_le (term : Term) : (row term).operations ≤ rowBudget term.size := by
  apply BareTermReadbackFields.observe_operations_le
  intro seed horizon snapshot seedBound dataBound
  exact Nat.le_trans (CookSeedOutputPrimitive.row_operations_le seed horizon snapshot)
    (CookSeedOutputPrimitive.seedBudget_mono _ (fun h => CookSeedOutputPrimitive.rowBudget_mono h) seedBound dataBound)

theorem terminal_operations_le (term : Term) : (terminal term).operations ≤ terminalBudget term.size := by
  apply BareTermReadbackFields.observe_operations_le
  intro seed horizon snapshot seedBound dataBound
  exact Nat.le_trans (CookSeedOutputPrimitive.terminal_operations_le seed horizon snapshot)
    (CookSeedOutputPrimitive.seedBudget_mono _ (fun h => CookSeedOutputPrimitive.terminalBudget_mono h) seedBound dataBound)

theorem scanned_operations_le (term : Term) : (scanned term).operations ≤ scannedBudget term.size := by
  apply BareTermReadbackFields.observe_operations_le
  intro seed horizon snapshot seedBound dataBound
  exact Nat.le_trans (CookSeedOutputPrimitive.scanned_operations_le seed horizon snapshot)
    (CookSeedOutputPrimitive.seedBudget_mono _ (fun h => CookSeedOutputPrimitive.scannedBudget_mono h) seedBound dataBound)

theorem row_resource_certificate (term : Term) :
    (row term).value = DeterministicTapePureSOutput.decodeRow? term ∧ (row term).operations ≤ rowBudget term.size :=
  ⟨row_value term, row_operations_le term⟩

theorem terminal_resource_certificate (term : Term) :
    (terminal term).value = DeterministicTapePureSOutput.decodeTerminalRow? term ∧ (terminal term).operations ≤ terminalBudget term.size :=
  ⟨terminal_value term, terminal_operations_le term⟩

theorem scanned_resource_certificate (term : Term) :
    (scanned term).value = DeterministicTapePureSOutput.decodeScannedOutput? term ∧ (scanned term).operations ≤ scannedBudget term.size :=
  ⟨scanned_value term, scanned_operations_le term⟩

theorem source_output_iff (source : DeterministicTape.Instance) (output : Bool) :
    (∃ sample, (scanned (DeterministicTapePureSOutput.termAt source sample)).value = some output) ↔
      DeterministicTapePureSOutput.Returns source output := by
  constructor
  · rintro ⟨sample, found⟩
    rw [scanned_value] at found
    exact DeterministicTapePureSOutput.decodeScannedOutput?_actual_reflects source sample output found
  · intro returned
    obtain ⟨sample, found⟩ := (DeterministicTapePureSOutput.exists_scannedOutput_iff source output).mpr returned
    exact ⟨sample, (scanned_value _).trans found⟩

theorem source_terminal_iff (source : DeterministicTape.Instance) :
    DeterministicTape.Halts source ↔
      ∃ sample result, (terminal (DeterministicTapePureSOutput.termAt source sample)).value = some result := by
  constructor
  · intro halted
    obtain ⟨sample, result, found⟩ := (DeterministicTapePureSOutput.halts_iff_exists_terminalRow source).mp halted
    exact ⟨sample, result, (terminal_value _).trans found⟩
  · rintro ⟨sample, result, found⟩
    apply (DeterministicTapePureSOutput.halts_iff_exists_terminalRow source).mpr
    exact ⟨sample, result, (terminal_value _).symm.trans found⟩

end PureSFormal.Computation.DeterministicTapeOutputPrimitive
