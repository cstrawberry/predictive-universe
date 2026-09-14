import PureSFormal.Computation.CookSeedTerminalReadback

/-!
# Terminal-predicate soundness for arbitrary accepted snapshots

The live counter decoder bounds the primitive control label. Literal tape
decoding then bounds the recovered source-state identifier, so the static
terminal-rule theorem applies without a caller-supplied bound. The resulting
row has an undefined source transition. Its reachability from the encoded
source input is outside this module's terminal-predicate soundness result.
-/

namespace PureSFormal.Computation.CookSeedTerminalSoundness

open CookSeedReadbackContext CookSeedTerminalReadback
open PureSFormal.Research.ProtectedTrieDeterministicCompiler
open DeterministicTapeThreeCounterCompiler

theorem exists_of_bind_eq_some {α β : Type} {first : Option α}
    {next : α → Option β} {result : β} (found : first.bind next = some result) :
    ∃ value, first = some value ∧ next value = some result := by
  cases first with
  | none => cases found
  | some value => exact ⟨value, rfl, found⟩

theorem decodeCounterWord?_control_lt (program : ThreeCounter.Program)
    (word : List Nat) (candidate : ThreeCounter.State)
    (found : ThreeCounterCookReadback.decodeCounterWord? program word = some candidate) :
    candidate.control < program.length := by
  have shape := ThreeCounterTagOutputBoundary.decodeLive?_sound program
    (word.map (ThreeCounterCookReadback.decodeSymbol program)) candidate found
  exact ThreeCounterTag.Numeric.index_lt_of_instructionLive shape.2.1

theorem decodeCounter?_control_lt (context : Context)
    (snapshot : CTS.Config Cook.rogozhinCookProgram) (candidate : ThreeCounter.State)
    (found : context.decodeCounter? snapshot = some candidate) :
    candidate.control < context.counterShape.length := by
  obtain ⟨normalized, _, ordinaryFound⟩ := exists_of_bind_eq_some found
  obtain ⟨ordinary, _, counterFound⟩ := exists_of_bind_eq_some ordinaryFound
  exact decodeCounterWord?_control_lt context.counterShape ordinary candidate counterFound

theorem sourceState_lt_of_decodedBoundary (machine : DeterministicTape.Machine)
    (candidate : ThreeCounter.State) (row : DeterministicTape.Row)
    (decoded : DeterministicTapeTrajectoryDecoder.decodeTapeBoundary? candidate = some row)
    (bounded : candidate.control < (Compiler.compileMachine machine).length) :
    row.state < machine.states.length := by
  obtain ⟨state, left, right, _, candidateEq, rowEq⟩ :=
    DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?_sound decoded
  rw [candidateEq, Compiler.compileMachine_length] at bounded
  change state * Layout.phaseCount < machine.states.length * Layout.phaseCount at bounded
  rw [rowEq]
  change state < machine.states.length
  by_cases stateBound : state < machine.states.length
  · exact stateBound
  · exact False.elim ((Nat.not_lt_of_ge
      (Nat.mul_le_mul_right Layout.phaseCount (Nat.le_of_not_gt stateBound))) bounded)

/-- Any snapshot accepted using an actual source seed supplies both a literal
primitive tape boundary and a source-state identifier inside the source table. -/
theorem decodeTape?_boundary (source : DeterministicTape.Instance)
    (snapshot : CTS.Config Cook.rogozhinCookProgram) (row : DeterministicTape.Row)
    (found : decodeTape? (DeterministicTapeCook.encodeBits source) snapshot = some row) :
    ∃ candidate,
      DeterministicTapeTrajectoryDecoder.decodeTapeBoundary? candidate = some row ∧
        row.state < source.machine.states.length := by
  unfold decodeTape? at found
  change (decodeContext? (RogozhinT2Cook.encodeBits
    (ThreeCounterTag.Numeric.compileT2 (Compiler.compileMachine source.machine)
      (Execution.compileInitial source)))).bind _ = _ at found
  rw [decodeContext?_encodeBits] at found
  change ((contextOf (DeletionTwoT2Normalizer.normalizeProgram
    (ThreeCounterTag.Numeric.ordinaryProgram (Compiler.compileMachine source.machine)))).decodeCounter?
      snapshot).bind DeterministicTapeTrajectoryDecoder.decodeTapeBoundary? = some row at found
  obtain ⟨candidate, counterFound, tapeFound⟩ := exists_of_bind_eq_some found
  have bounded := decodeCounter?_control_lt _ snapshot candidate counterFound
  rw [contextOf_counterShape_length] at bounded
  exact ⟨candidate, tapeFound, sourceState_lt_of_decodedBoundary source.machine candidate row
    tapeFound bounded⟩

/-- Successful terminal observation certifies an undefined transition on the
returned literal row for every snapshot, without a supplied state bound.
It does not certify that this row occurs in the source run. -/
theorem decodeTerminalTape?_halted (source : DeterministicTape.Instance)
    (snapshot : CTS.Config Cook.rogozhinCookProgram) (row : DeterministicTape.Row)
    (found : decodeTerminalTape? (DeterministicTapeCook.encodeBits source) snapshot = some row) :
    DeterministicTape.step? source.machine row = none := by
  unfold decodeTerminalTape? at found
  change (decodeContext? (RogozhinT2Cook.encodeBits
    (ThreeCounterTag.Numeric.compileT2 (Compiler.compileMachine source.machine)
      (Execution.compileInitial source)))).bind _ = _ at found
  rw [decodeContext?_encodeBits] at found
  change (decodeTape? (DeterministicTapeCook.encodeBits source) snapshot).bind
    (fun result => if terminalRow (contextOf (DeletionTwoT2Normalizer.normalizeProgram
      (ThreeCounterTag.Numeric.ordinaryProgram (Compiler.compileMachine source.machine)))) result
      then some result else none) = some row at found
  obtain ⟨candidate, tapeFound, terminalFound⟩ := exists_of_bind_eq_some found
  split at terminalFound
  next terminal =>
    cases terminalFound
    obtain ⟨primitive, primitiveFound, bounded⟩ := decodeTape?_boundary source snapshot row tapeFound
    exact (terminalRow_of_decodedBoundary source.machine primitive row primitiveFound bounded).mp terminal
  next rejected => cases terminalFound

theorem decodeTerminalTape?_padded_halted (source : DeterministicTape.Instance)
    (snapshot : CTS.Config Cook.rogozhinCookProgram) (row : DeterministicTape.Row)
    (found : decodeTerminalTape?
      (DeterministicTapeCook.encodeBits (DeterministicTapeStatePadding.pad source)) snapshot = some row) :
    DeterministicTape.step? source.machine row = none := by
  have halted := decodeTerminalTape?_halted (DeterministicTapeStatePadding.pad source) snapshot row found
  rw [DeterministicTapeStatePadding.step?_pad] at halted
  exact halted

end PureSFormal.Computation.CookSeedTerminalSoundness
