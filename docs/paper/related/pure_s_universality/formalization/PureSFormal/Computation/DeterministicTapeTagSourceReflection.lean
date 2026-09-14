import PureSFormal.Computation.DeterministicTapePrimitiveBoundaryReflection
import PureSFormal.Computation.DeterministicTapeTagBoundaryReflection

/-!
# Literal source trajectories recovered from normalized tag execution

The actual normalized execution reflects through normalization, numerical tag
symbols, and primitive microsteps to the source trajectory. Padding preserves
that literal trajectory. The executable decoder is the existing context-based
normalized-word reader.
-/

namespace PureSFormal.Computation.DeterministicTapeTagSourceReflection

open PureSFormal.Research.ProtectedTrieDeterministicCompiler
open CookSeedReadbackContext DeterministicTapeTagBoundaryReflection

@[simp]
theorem decodeNormalizedTape?_nil (context : Context) :
    decodeNormalizedTape? context [] = none := rfl

theorem decodeNormalizedTape?_nonempty (context : Context) (word : List Nat)
    (row : DeterministicTape.Row) (found : decodeNormalizedTape? context word = some row) :
    word ≠ [] := by
  intro emptyWord
  rw [emptyWord, decodeNormalizedTape?_nil] at found
  cases found

/-- Every accepted row at every actual normalized-tag time belongs to the
literal source trajectory, with no supplied source or primitive time witness. -/
theorem decodeNormalizedTape?_source_reflects (source : DeterministicTape.Instance)
    (horizon : Nat) (row : DeterministicTape.Row)
    (found : decodeNormalizedTape? (contextOf (DeterministicTapeCook.compileT2Job source).program)
      (RogozhinTagInput.iterate (DeterministicTapeCook.compileT2Job source).program horizon
        (DeterministicTapeCook.compileT2Job source).word) = some row) :
    ∃ sourceFuel, DeterministicTape.runFor? source.machine
      (DeterministicTape.initialRow source) sourceFuel = some row := by
  obtain ⟨primitiveFuel, primitiveFound⟩ := decodeNormalizedTape?_actual_reflects source horizon row found
  exact DeterministicTapePrimitiveBoundaryReflection.decodeTapeBoundary?_actual_reflects
    source primitiveFuel primitiveFound

/-- Undefined-row padding preserves the exact row, source state ID, and
finite source-time witness recovered from the actual normalized execution. -/
theorem decodeNormalizedTape?_padded_source_reflects (source : DeterministicTape.Instance)
    (horizon : Nat) (row : DeterministicTape.Row)
    (found : decodeNormalizedTape?
      (contextOf (DeterministicTapeCook.compileT2Job (DeterministicTapeStatePadding.pad source)).program)
      (RogozhinTagInput.iterate
        (DeterministicTapeCook.compileT2Job (DeterministicTapeStatePadding.pad source)).program horizon
        (DeterministicTapeCook.compileT2Job (DeterministicTapeStatePadding.pad source)).word) = some row) :
    ∃ sourceFuel, DeterministicTape.runFor? source.machine
      (DeterministicTape.initialRow source) sourceFuel = some row := by
  obtain ⟨sourceFuel, sourceRun⟩ := decodeNormalizedTape?_source_reflects
    (DeterministicTapeStatePadding.pad source) horizon row found
  rw [DeterministicTapeStatePadding.initialRow_pad, DeterministicTapeStatePadding.runFor?_pad] at sourceRun
  exact ⟨sourceFuel, sourceRun⟩

end PureSFormal.Computation.DeterministicTapeTagSourceReflection
