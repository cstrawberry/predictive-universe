import PureSFormal.Computation.CookSeedPassReadback
import PureSFormal.Computation.RogozhinBoundaryOperationalReflection
import PureSFormal.Computation.CookSeedOutputExample

/-!
# Exact source trajectories and outputs at Cook arrivals

Every accepted row at an actual CTS horizon belongs to the encoded source
trajectory. Conversely, every defined source row has an accepted checkpoint
after state padding. Terminal observations and scanned-bit outputs therefore
agree exactly with the source computation.
-/

namespace PureSFormal.Computation.CookSeedPassSourceReflection

open PureSFormal.Research.ProtectedTrieDeterministicCompiler
open CookSeedReadbackContext (contextOf decodeContext? decodeContext?_encodeBits)
open CookSeedTerminalSoundness (exists_of_bind_eq_some)
open CookSeedPassReadback
open DeterministicTapeTagBoundaryReflection (decodeNormalizedTape?)

abbrev actualSnapshot (source : DeterministicTape.Instance) (horizon : Nat) :=
  CTS.iterate Cook.rogozhinCookProgram horizon
    (CTS.initial Cook.rogozhinCookProgram (DeterministicTapeCook.encodeBits source))

/-- At every actual CTS time, successful row decoding yields the exact
returned row at a finite source time. -/
theorem decodeTape?_actual_reflects (source : DeterministicTape.Instance)
    (horizon : Nat) (row : DeterministicTape.Row)
    (found : decodeTape? (DeterministicTapeCook.encodeBits source) horizon
      (actualSnapshot source horizon) = some row) :
    ∃ sourceFuel, DeterministicTape.runFor? source.machine
      (DeterministicTape.initialRow source) sourceFuel = some row := by
  rw [decodeTape?_factors] at found
  change (decodeContext? (RogozhinT2Cook.encodeBits (DeterministicTapeCook.compileT2Job source))).bind _ = _ at found
  rw [decodeContext?_encodeBits] at found
  change (decodePassTag? (contextOf (DeterministicTapeCook.compileT2Job source).program)
    horizon (actualSnapshot source horizon)).bind
    (decodeNormalizedTape? (contextOf (DeterministicTapeCook.compileT2Job source).program)) = some row at found
  obtain ⟨normalized, tagFound, normalizedFound⟩ := exists_of_bind_eq_some found
  obtain ⟨configuration, passFound, boundaryFound⟩ := exists_of_bind_eq_some tagFound
  obtain ⟨machineSteps, reflected⟩ := CookArrivalReflection.passDecode?_actual_reflects
    (RogozhinTagInput.compile (DeterministicTapeCook.compileT2Job source)) horizon configuration passFound
  rw [reflected] at boundaryFound
  have nonempty := DeterministicTapeTagSourceReflection.decodeNormalizedTape?_nonempty _ _ row normalizedFound
  have boundaryFound' : (contextOf (DeterministicTapeCook.compileT2Job source).program).decodeBoundary?
      (Rogozhin46.iterate machineSteps
        (RogozhinT2Simulation.compileWithPadding (DeterministicTapeCook.compileT2Job source).program 0
          (DeterministicTapeCook.compileT2Job source).word)) = some normalized := by
    simpa only [RogozhinT2Simulation.compileWithPadding_zero] using boundaryFound
  obtain ⟨tagSteps, wordEq⟩ := RogozhinBoundaryOperationalReflection.decodeBoundary?_actual_nonempty_reflects
    machineSteps (DeterministicTapeCook.compileT2Job source).program
    (DeterministicTapeCook.compileT2Job source).word (DeterministicTapeCook.compileT2Job_wellFormed source)
    0 normalized nonempty boundaryFound'
  rw [wordEq] at normalizedFound
  exact DeterministicTapeTagSourceReflection.decodeNormalizedTape?_source_reflects source tagSteps row normalizedFound

theorem decodeTape?_padded_actual_reflects (source : DeterministicTape.Instance)
    (horizon : Nat) (row : DeterministicTape.Row)
    (found : decodeTape? (DeterministicTapeCook.encodeBits (DeterministicTapeStatePadding.pad source)) horizon
      (actualSnapshot (DeterministicTapeStatePadding.pad source) horizon) = some row) :
    ∃ sourceFuel, DeterministicTape.runFor? source.machine
      (DeterministicTape.initialRow source) sourceFuel = some row := by
  obtain ⟨sourceFuel, sourceRun⟩ := decodeTape?_actual_reflects (DeterministicTapeStatePadding.pad source) horizon row found
  rw [DeterministicTapeStatePadding.initialRow_pad, DeterministicTapeStatePadding.runFor?_pad] at sourceRun
  exact ⟨sourceFuel, sourceRun⟩

/-- Exact equality of the observed row set and the literal finite source
trajectory under the unchanged padded encoder. -/
theorem exists_literalRow_iff (source : DeterministicTape.Instance) (row : DeterministicTape.Row) :
    (∃ horizon, decodeTape? (DeterministicTapeCook.encodeBits (DeterministicTapeStatePadding.pad source)) horizon
      (actualSnapshot (DeterministicTapeStatePadding.pad source) horizon) = some row) ↔
    ∃ sourceFuel, DeterministicTape.runFor? source.machine
      (DeterministicTape.initialRow source) sourceFuel = some row := by
  constructor
  · rintro ⟨horizon, found⟩
    exact decodeTape?_padded_actual_reflects source horizon row found
  · rintro ⟨sourceFuel, sourceRun⟩
    exact exists_literalRow_at_actualCTS source sourceFuel row sourceRun

theorem decodeTerminalTape?_actual_reflects (source : DeterministicTape.Instance)
    (horizon : Nat) (row : DeterministicTape.Row)
    (found : decodeTerminalTape? (DeterministicTapeCook.encodeBits (DeterministicTapeStatePadding.pad source)) horizon
      (actualSnapshot (DeterministicTapeStatePadding.pad source) horizon) = some row) :
    (∃ sourceFuel, DeterministicTape.runFor? source.machine
      (DeterministicTape.initialRow source) sourceFuel = some row) ∧
      DeterministicTape.step? source.machine row = none := by
  have sourceRun := decodeTape?_padded_actual_reflects source horizon row
    (decodeTerminalTape?_row _ _ _ _ found)
  have halted := decodeTerminalTape?_halted (DeterministicTapeStatePadding.pad source) horizon _ row found
  rw [DeterministicTapeStatePadding.step?_pad] at halted
  exact ⟨sourceRun, halted⟩

theorem exists_terminalRow_iff (source : DeterministicTape.Instance) (row : DeterministicTape.Row) :
    (∃ horizon, decodeTerminalTape? (DeterministicTapeCook.encodeBits (DeterministicTapeStatePadding.pad source)) horizon
      (actualSnapshot (DeterministicTapeStatePadding.pad source) horizon) = some row) ↔
    (∃ sourceFuel, DeterministicTape.runFor? source.machine
      (DeterministicTape.initialRow source) sourceFuel = some row) ∧
      DeterministicTape.step? source.machine row = none := by
  constructor
  · rintro ⟨horizon, found⟩
    exact decodeTerminalTape?_actual_reflects source horizon row found
  · rintro ⟨⟨sourceFuel, sourceRun⟩, halted⟩
    exact exists_terminalRow_of_runFor? source sourceFuel row sourceRun halted

theorem halts_iff_exists_terminalRow (source : DeterministicTape.Instance) :
    DeterministicTape.Halts source ↔
    ∃ horizon row, decodeTerminalTape? (DeterministicTapeCook.encodeBits (DeterministicTapeStatePadding.pad source)) horizon
      (actualSnapshot (DeterministicTapeStatePadding.pad source) horizon) = some row := by
  constructor
  · rintro ⟨sourceFuel, row, sourceRun, halted⟩
    obtain ⟨horizon, found⟩ := (exists_terminalRow_iff source row).mpr ⟨⟨sourceFuel, sourceRun⟩, halted⟩
    exact ⟨horizon, row, found⟩
  · rintro ⟨horizon, row, found⟩
    obtain ⟨⟨sourceFuel, sourceRun⟩, halted⟩ := decodeTerminalTape?_actual_reflects source horizon row found
    exact ⟨sourceFuel, row, sourceRun, halted⟩

/-- Scanned-bit output is preserved and reflected, including nontermination
and every possible accepted CTS horizon. -/
theorem exists_scannedOutput_iff (source : DeterministicTape.Instance) (output : Bool) :
    (∃ horizon, decodeScannedOutput? (DeterministicTapeCook.encodeBits (DeterministicTapeStatePadding.pad source)) horizon
      (actualSnapshot (DeterministicTapeStatePadding.pad source) horizon) = some output) ↔
    ∃ sourceFuel row, DeterministicTape.runFor? source.machine
      (DeterministicTape.initialRow source) sourceFuel = some row ∧
      DeterministicTape.step? source.machine row = none ∧
      PureSFormal.Research.ProtectedTrieMachine.scanned? row = some output := by
  constructor
  · rintro ⟨horizon, found⟩
    obtain ⟨row, terminalFound, outputFound⟩ := exists_of_bind_eq_some found
    obtain ⟨⟨sourceFuel, sourceRun⟩, halted⟩ := decodeTerminalTape?_actual_reflects source horizon row terminalFound
    exact ⟨sourceFuel, row, sourceRun, halted, outputFound⟩
  · rintro ⟨sourceFuel, row, sourceRun, halted, outputFound⟩
    obtain ⟨horizon, found⟩ := exists_terminalRow_of_runFor? source sourceFuel row sourceRun halted
    refine ⟨horizon, ?_⟩
    rw [decodeScannedOutput?, found]
    exact outputFound

theorem bitToggle_terminal_unique (input : Bool) (fuel : Nat) (row : DeterministicTape.Row)
    (run : DeterministicTape.runFor? CookSeedOutputExample.machine
      (DeterministicTape.initialRow (CookSeedOutputExample.source input)) fuel = some row)
    (halted : DeterministicTape.step? CookSeedOutputExample.machine row = none) :
    row = CookSeedOutputExample.finalRow input := by
  have firstStep : DeterministicTape.step? CookSeedOutputExample.machine
      (DeterministicTape.initialRow (CookSeedOutputExample.source input)) =
      some (CookSeedOutputExample.finalRow input) := by
    cases input <;> decide
  cases fuel with
  | zero =>
      change some (DeterministicTape.initialRow (CookSeedOutputExample.source input)) = some row at run
      cases run
      rw [firstStep] at halted
      cases halted
  | succ fuel =>
      rw [DeterministicTape.runFor?, firstStep] at run
      cases fuel with
      | zero => exact (Option.some.inj run).symm
      | succ fuel =>
          change DeterministicTape.runFor? CookSeedOutputExample.machine
            (CookSeedOutputExample.finalRow input) (fuel + 1) = some row at run
          rw [DeterministicTape.runFor?, CookSeedOutputExample.final_halted] at run
          cases run

/-- A fixed source table computes Boolean negation through the same observer.
The equivalence rules out every incorrect output at every actual CTS time. -/
theorem bitToggle_output_iff (input output : Bool) :
    (∃ horizon, decodeScannedOutput? (CookSeedOutputExample.seed input) horizon
      (actualSnapshot (DeterministicTapeStatePadding.pad (CookSeedOutputExample.source input)) horizon) = some output) ↔
    output = !input := by
  rw [show CookSeedOutputExample.seed input =
      DeterministicTapeCook.encodeBits (DeterministicTapeStatePadding.pad (CookSeedOutputExample.source input)) from rfl]
  rw [exists_scannedOutput_iff]
  constructor
  · rintro ⟨sourceFuel, row, sourceRun, halted, outputFound⟩
    have rowEq := bitToggle_terminal_unique input sourceFuel row sourceRun halted
    rw [rowEq] at outputFound
    exact (Option.some.inj outputFound).symm
  · intro outputEq
    subst output
    exact ⟨1, CookSeedOutputExample.finalRow input,
      CookSeedOutputExample.run_one input, CookSeedOutputExample.final_halted input, rfl⟩

end PureSFormal.Computation.CookSeedPassSourceReflection
