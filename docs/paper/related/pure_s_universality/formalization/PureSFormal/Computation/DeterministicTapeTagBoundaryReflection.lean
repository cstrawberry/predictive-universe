import PureSFormal.Computation.ThreeCounterNumericBoundaryReflection

/-!
# Actual primitive rows recovered from actual normalized tag execution

Normalization alignment, numerical alphabet decoding, and canonical-header
reflection compose without an external trajectory witness in the decoder.
Every accepted row on an actual normalized tag iterate is read from an actual
primitive-machine iterate. Reflection of that primitive boundary to a source
tape prefix remains a separate operational theorem.
-/

namespace PureSFormal.Computation.DeterministicTapeTagBoundaryReflection

open CookSeedReadbackContext CookSeedTerminalSoundness
open PureSFormal.Research.ProtectedTrieDeterministicCompiler
open DeterministicTapeThreeCounterCompiler

def decodeNormalizedTape? (context : Context) (word : List Nat) :
    Option DeterministicTape.Row := do
  let ordinary ← DeletionTwoT2Readback.decodeWord? context.ordinaryShape word
  let primitive ← ThreeCounterCookReadback.decodeCounterWord? context.counterShape ordinary
  DeterministicTapeTrajectoryDecoder.decodeTapeBoundary? primitive

/-- At every actual normalized-tag horizon, acceptance yields an actual
primitive execution state with the returned literal tape row. -/
theorem decodeNormalizedTape?_actual_reflects (source : DeterministicTape.Instance)
    (horizon : Nat) (row : DeterministicTape.Row)
    (found : decodeNormalizedTape?
      (contextOf (ThreeCounterTag.Numeric.compileT2 (Compiler.compileMachine source.machine)
        (Execution.compileInitial source)).program)
      (RogozhinTagInput.iterate
        (ThreeCounterTag.Numeric.compileT2 (Compiler.compileMachine source.machine)
          (Execution.compileInitial source)).program horizon
        (ThreeCounterTag.Numeric.compileT2 (Compiler.compileMachine source.machine)
          (Execution.compileInitial source)).word) = some row) :
    ∃ primitiveFuel,
      DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?
        (ThreeCounter.run (Compiler.compileMachine source.machine) primitiveFuel
          (Execution.compileInitial source)) = some row := by
  let program := Compiler.compileMachine source.machine
  let initial := Execution.compileInitial source
  obtain ⟨ordinaryFuel, aligned⟩ := DeletionTwoT2Readback.decodeWord?_iterate
    (ThreeCounterTag.Numeric.ordinaryProgram program)
    (ThreeCounterTag.Numeric.encodeWord program (ThreeCounterTag.encodeState program initial))
    (ThreeCounterTag.Numeric.ordinaryProgram_productionLabelsValid program)
    (fun horizon => ThreeCounterTag.Numeric.ordinaryTrajectory_boundary program horizon initial) horizon
  unfold decodeNormalizedTape? at found
  change (DeletionTwoT2Readback.decodeWord?
    (contextOf (DeletionTwoT2Normalizer.normalizeProgram
      (ThreeCounterTag.Numeric.ordinaryProgram program))).ordinaryShape
    (RogozhinTagInput.iterate (DeletionTwoT2Normalizer.normalizeProgram
      (ThreeCounterTag.Numeric.ordinaryProgram program)) horizon
      (DeletionTwoT2Normalizer.normalizeWord (ThreeCounterTag.Numeric.ordinaryProgram program)
        (ThreeCounterTag.Numeric.encodeWord program (ThreeCounterTag.encodeState program initial))))).bind _ = _ at found
  rw [decodeWord?_sameCount _ _ (contextOf_ordinaryShape_count
    (ThreeCounterTag.Numeric.ordinaryProgram program)), aligned] at found
  change (ThreeCounterCookReadback.decodeCounterWord?
    (contextOf (DeletionTwoT2Normalizer.normalizeProgram
      (ThreeCounterTag.Numeric.ordinaryProgram program))).counterShape
    (RogozhinTagInput.iterate (ThreeCounterTag.Numeric.ordinaryProgram program) ordinaryFuel
      (ThreeCounterTag.Numeric.encodeWord program (ThreeCounterTag.encodeState program initial)))).bind
    DeterministicTapeTrajectoryDecoder.decodeTapeBoundary? = some row at found
  obtain ⟨candidate, counterFound, tapeFound⟩ := exists_of_bind_eq_some found
  obtain ⟨primitiveFuel, exactState⟩ :=
    ThreeCounterNumericBoundaryReflection.decodeCounterWord?_compiled_reflects
      source.machine initial ordinaryFuel candidate row counterFound tapeFound
  exact ⟨primitiveFuel, exactState ▸ tapeFound⟩

/-- Factor the existing seed/snapshot decoder through its actual normalized
word. This identity changes neither executable decoder nor acceptance. -/
theorem decodeTape?_factors (seed : List Bool)
    (snapshot : CTS.Config Cook.rogozhinCookProgram) :
    decodeTape? seed snapshot =
      (decodeContext? seed).bind (fun context =>
        (context.decodeTag? snapshot).bind (decodeNormalizedTape? context)) := by
  unfold decodeTape?
  cases parsed : decodeContext? seed with
  | none => rfl
  | some context =>
      change ((context.decodeCounter? snapshot).bind
        DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?) =
        (context.decodeTag? snapshot).bind (decodeNormalizedTape? context)
      unfold Context.decodeCounter? decodeNormalizedTape?
      cases tag : context.decodeTag? snapshot with
      | none => rfl
      | some normalized =>
          change ((DeletionTwoT2Readback.decodeWord? context.ordinaryShape normalized).bind
            (ThreeCounterCookReadback.decodeCounterWord? context.counterShape)).bind
              DeterministicTapeTrajectoryDecoder.decodeTapeBoundary? =
            (DeletionTwoT2Readback.decodeWord? context.ordinaryShape normalized).bind
              (fun word => (ThreeCounterCookReadback.decodeCounterWord? context.counterShape word).bind
                DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?)
          cases ordinary : DeletionTwoT2Readback.decodeWord? context.ordinaryShape normalized with
          | none => rfl
          | some word => rfl

/-- Every successful seed/snapshot decode exposes its concrete machine
configuration and normalized word, ready for operational upstream reflection. -/
theorem decodeTape?_intermediate (source : DeterministicTape.Instance)
    (snapshot : CTS.Config Cook.rogozhinCookProgram) (row : DeterministicTape.Row)
    (found : decodeTape? (DeterministicTapeCook.encodeBits source) snapshot = some row) :
    ∃ configuration normalized,
      CookRegisteredReadback.decodeSnapshot? snapshot = some configuration ∧
      (contextOf (ThreeCounterTag.Numeric.compileT2 (Compiler.compileMachine source.machine)
        (Execution.compileInitial source)).program).decodeBoundary? configuration = some normalized ∧
      decodeNormalizedTape?
        (contextOf (ThreeCounterTag.Numeric.compileT2 (Compiler.compileMachine source.machine)
          (Execution.compileInitial source)).program) normalized = some row := by
  rw [decodeTape?_factors] at found
  change (decodeContext? (RogozhinT2Cook.encodeBits
    (ThreeCounterTag.Numeric.compileT2 (Compiler.compileMachine source.machine)
      (Execution.compileInitial source)))).bind _ = _ at found
  rw [decodeContext?_encodeBits] at found
  change ((contextOf (ThreeCounterTag.Numeric.compileT2 (Compiler.compileMachine source.machine)
    (Execution.compileInitial source)).program).decodeTag? snapshot).bind _ = _ at found
  obtain ⟨normalized, tagFound, rowFound⟩ := exists_of_bind_eq_some found
  obtain ⟨configuration, snapshotFound, boundaryFound⟩ := exists_of_bind_eq_some tagFound
  exact ⟨configuration, normalized, snapshotFound, boundaryFound, rowFound⟩

end PureSFormal.Computation.DeterministicTapeTagBoundaryReflection
