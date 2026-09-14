import PureSFormal.Computation.CookArrivalReflection
import PureSFormal.Computation.DeterministicTapeTagSourceReflection

/-!
# Seed-derived readback at horizon-indexed Cook arrivals

The executable reader uses the immutable seed, the current CTS horizon, and
the current CTS configuration. Arrival parsing is horizon-indexed; the seed
supplies the complete static decoding context and terminal-rule lookup.
-/

namespace PureSFormal.Computation.CookSeedPassReadback

open PureSFormal.Research.ProtectedTrieDeterministicCompiler
open CookSeedReadbackContext CookSeedTerminalReadback CookSeedTerminalSoundness
open DeterministicTapeThreeCounterCompiler
open RogozhinTagInput RogozhinT2Simulation

def decodePassTag? (context : Context) (horizon : Nat)
    (snapshot : CTS.Config Cook.rogozhinCookProgram) : Option (List Nat) :=
  (Cook.passDecode? horizon snapshot).bind context.decodeBoundary?

def decodePassCounter? (context : Context) (horizon : Nat)
    (snapshot : CTS.Config Cook.rogozhinCookProgram) : Option ThreeCounter.State := do
  let normalized ← decodePassTag? context horizon snapshot
  let ordinary ← DeletionTwoT2Readback.decodeWord? context.ordinaryShape normalized
  ThreeCounterCookReadback.decodeCounterWord? context.counterShape ordinary

def decodeTape? (seed : List Bool) (horizon : Nat)
    (snapshot : CTS.Config Cook.rogozhinCookProgram) : Option DeterministicTape.Row := do
  let context ← decodeContext? seed
  let candidate ← decodePassCounter? context horizon snapshot
  DeterministicTapeTrajectoryDecoder.decodeTapeBoundary? candidate

def decodeTerminalTape? (seed : List Bool) (horizon : Nat)
    (snapshot : CTS.Config Cook.rogozhinCookProgram) : Option DeterministicTape.Row := do
  let context ← decodeContext? seed
  let row ← decodeTape? seed horizon snapshot
  if terminalRow context row then some row else none

def decodeScannedOutput? (seed : List Bool) (horizon : Nat)
    (snapshot : CTS.Config Cook.rogozhinCookProgram) : Option Bool :=
  (decodeTerminalTape? seed horizon snapshot).bind
    PureSFormal.Research.ProtectedTrieMachine.scanned?

theorem exists_decodePassTag?_iterate {program : Program} {word : List Label}
    (wellFormed : WellFormed program word) (horizon : Nat)
    (before : NonhaltingBefore program word horizon) :
    ∃ ticks, decodePassTag? (contextOf program) ticks
      (CTS.iterate Cook.rogozhinCookProgram ticks
        (CTS.initial Cook.rogozhinCookProgram (RogozhinT2Cook.encodeBits ⟨program, word⟩))) =
      some (RogozhinTagInput.iterate program horizon word) := by
  have safe := safeThrough_compileWithPadding_nonhaltingRun wellFormed horizon before
  obtain ⟨ticks, decoded⟩ := CookArrivalReflection.exists_passDecode?_actual
    (compile ⟨program, word⟩) (boundaryTime program word horizon)
    (fun earlier earlierLt => safe earlier (Nat.le_of_lt earlierLt))
  refine ⟨ticks, ?_⟩
  change ((Cook.passDecode? ticks
    (CTS.iterate Cook.rogozhinCookProgram ticks
      (CTS.initial Cook.rogozhinCookProgram
        (Cook.encodeWord (Cook.PassClassification.canonicalWord (compile ⟨program, word⟩)))))).bind
    (contextOf program).decodeBoundary?) = _
  rw [decoded, iterate_compileWithPadding_nonhaltingRun wellFormed horizon before]
  exact contextOf_decodeBoundary? program wellFormed.isT2 _ _ (wellFormed.iterate horizon).labels

theorem exists_decodePassCounter?_iterate (program : ThreeCounter.Program)
    (initial : ThreeCounter.State) (primitiveFuel : Nat)
    (running : (ThreeCounter.run program primitiveFuel initial).status = .running)
    (live : ThreeCounterTag.instructionLive (ThreeCounter.instructionAt program
      (ThreeCounter.run program primitiveFuel initial).control) = true)
    (tested : ThreeCounterTag.instructionTested? (ThreeCounter.instructionAt program
      (ThreeCounter.run program primitiveFuel initial).control) = some .right) :
    ∃ ticks,
      decodePassCounter? (contextOf (ThreeCounterTag.Numeric.compileT2 program initial).program) ticks
        (CTS.iterate Cook.rogozhinCookProgram ticks
          (CTS.initial Cook.rogozhinCookProgram
            (RogozhinT2Cook.encodeBits (ThreeCounterTag.Numeric.compileT2 program initial)))) =
        some (ThreeCounter.run program primitiveFuel initial) := by
  open DeterministicTapeCookTrajectoryReadback ThreeCounterTag ThreeCounterTag.Numeric in
  obtain ⟨ordinaryFuel, ordinaryRun⟩ := ordinary_encodeState_run program initial primitiveFuel
  have ordinaryLive : ¬ Halted (ThreeCounterTag.Numeric.ordinaryProgram program)
      (RogozhinTagInput.iterate (ThreeCounterTag.Numeric.ordinaryProgram program) ordinaryFuel
        (ThreeCounterTag.Numeric.encodeWord program (ThreeCounterTag.encodeState program initial))) := by
    rw [ordinaryRun]
    exact DeterministicTapeCookTrajectoryReadback.ordinary_encodeState_notHalted
      program _ running live
  obtain ⟨targetHorizon, before, aligned⟩ :=
    DeterministicTapeCookTrajectoryReadback.exists_normalized_decoded_boundary
      (ThreeCounterTag.Numeric.ordinaryProgram program)
      (ThreeCounterTag.Numeric.encodeWord program (ThreeCounterTag.encodeState program initial))
      (ThreeCounterTag.Numeric.ordinaryProgram_productionLabelsValid program)
      (fun horizon => ThreeCounterTag.Numeric.ordinaryTrajectory_boundary program horizon initial)
      (ThreeCounterTag.Numeric.compileT2_wellFormed program initial) ordinaryFuel ordinaryLive
  obtain ⟨ticks, decoded⟩ := exists_decodePassTag?_iterate
    (ThreeCounterTag.Numeric.compileT2_wellFormed program initial) targetHorizon before
  refine ⟨ticks, ?_⟩
  unfold decodePassCounter?
  change (decodePassTag? (contextOf (ThreeCounterTag.Numeric.compileT2 program initial).program) ticks
    (CTS.iterate Cook.rogozhinCookProgram ticks
      (CTS.initial Cook.rogozhinCookProgram
        (RogozhinT2Cook.encodeBits (ThreeCounterTag.Numeric.compileT2 program initial))))).bind _ = _
  rw [decoded]
  change (DeletionTwoT2Readback.decodeWord?
    (contextOf (DeletionTwoT2Normalizer.normalizeProgram
      (ThreeCounterTag.Numeric.ordinaryProgram program))).ordinaryShape
    (RogozhinTagInput.iterate (DeletionTwoT2Normalizer.normalizeProgram
      (ThreeCounterTag.Numeric.ordinaryProgram program)) targetHorizon
      (ThreeCounterTag.Numeric.compileT2 program initial).word)).bind
      (ThreeCounterCookReadback.decodeCounterWord?
        (contextOf (ThreeCounterTag.Numeric.compileT2 program initial).program).counterShape) = _
  rw [decodeWord?_sameCount _ _
    (contextOf_ordinaryShape_count (ThreeCounterTag.Numeric.ordinaryProgram program))]
  exact (congrArg (fun value => value.bind
    (ThreeCounterCookReadback.decodeCounterWord?
      (contextOf (ThreeCounterTag.Numeric.compileT2 program initial).program).counterShape))
    (aligned.trans (congrArg some ordinaryRun))).trans
      (contextOf_decodeCounterWord? program _ running live tested)

/-- Every defined source prefix has an actual CTS checkpoint decoded from
the immutable input seed, current horizon, and current snapshot. -/
theorem exists_literalRow_at_actualCTS (source : DeterministicTape.Instance)
    (sourceFuel : Nat) (row : DeterministicTape.Row)
    (run : DeterministicTape.runFor? source.machine
      (DeterministicTape.initialRow source) sourceFuel = some row) :
    ∃ ticks,
      decodeTape? (DeterministicTapeCook.encodeBits (DeterministicTapeStatePadding.pad source)) ticks
        (CTS.iterate Cook.rogozhinCookProgram ticks
          (CTS.initial Cook.rogozhinCookProgram
            (DeterministicTapeCook.encodeBits (DeterministicTapeStatePadding.pad source)))) =
        some row := by
  obtain ⟨primitiveFuel, decoded, running, live⟩ :=
    DeterministicTapeStatePadding.exists_live_decodedPrimitiveBoundary source sourceFuel row run
  have tested : ThreeCounterTag.instructionTested?
      (ThreeCounter.instructionAt (Compiler.compileMachine (DeterministicTapeStatePadding.pad source).machine)
        (ThreeCounter.run (Compiler.compileMachine (DeterministicTapeStatePadding.pad source).machine)
          primitiveFuel (Execution.compileInitial (DeterministicTapeStatePadding.pad source))).control) =
      some .right := by
    obtain ⟨state, left, right, _, candidateEq, rowEq⟩ :=
      DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?_sound decoded
    have stateEq : row.state = state := congrArg (fun result : DeterministicTape.Row => result.state) rowEq
    have bounded : state < (DeterministicTapeStatePadding.pad source).machine.states.length := by
      rw [← stateEq]
      exact DeterministicTapeStatePadding.runFor?_state_lt_padded_length source sourceFuel row run
    rw [candidateEq]
    change ThreeCounterTag.instructionTested?
      (ThreeCounter.instructionAt (Compiler.compileMachine (DeterministicTapeStatePadding.pad source).machine)
        (Layout.address state (.right .start))) = some .right
    rw [Compiler.instructionAt_compileMachine bounded]
    rfl
  obtain ⟨ticks, counterDecoded⟩ := exists_decodePassCounter?_iterate
    (Compiler.compileMachine (DeterministicTapeStatePadding.pad source).machine)
    (Execution.compileInitial (DeterministicTapeStatePadding.pad source))
    primitiveFuel running live tested
  refine ⟨ticks, ?_⟩
  unfold decodeTape?
  change (decodeContext? (RogozhinT2Cook.encodeBits
    (ThreeCounterTag.Numeric.compileT2
      (Compiler.compileMachine (DeterministicTapeStatePadding.pad source).machine)
      (Execution.compileInitial (DeterministicTapeStatePadding.pad source))))).bind _ = _
  rw [decodeContext?_encodeBits]
  change (decodePassCounter? (contextOf
    (ThreeCounterTag.Numeric.compileT2
      (Compiler.compileMachine (DeterministicTapeStatePadding.pad source).machine)
      (Execution.compileInitial (DeterministicTapeStatePadding.pad source))).program) ticks
    (CTS.iterate Cook.rogozhinCookProgram ticks
      (CTS.initial Cook.rogozhinCookProgram
        (DeterministicTapeCook.encodeBits (DeterministicTapeStatePadding.pad source))))).bind
    DeterministicTapeTrajectoryDecoder.decodeTapeBoundary? = _
  exact (congrArg (fun value => value.bind
    DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?) counterDecoded).trans decoded


theorem decodeTape?_factors (seed : List Bool) (horizon : Nat)
    (snapshot : CTS.Config Cook.rogozhinCookProgram) :
    decodeTape? seed horizon snapshot =
      (decodeContext? seed).bind (fun context =>
        (decodePassTag? context horizon snapshot).bind
          (DeterministicTapeTagBoundaryReflection.decodeNormalizedTape? context)) := by
  unfold decodeTape?
  cases parsed : decodeContext? seed with
  | none => rfl
  | some context =>
      change ((decodePassCounter? context horizon snapshot).bind
        DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?) =
        (decodePassTag? context horizon snapshot).bind
          (DeterministicTapeTagBoundaryReflection.decodeNormalizedTape? context)
      unfold decodePassCounter? DeterministicTapeTagBoundaryReflection.decodeNormalizedTape?
      cases tag : decodePassTag? context horizon snapshot with
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

theorem decodeTape?_boundary (source : DeterministicTape.Instance) (horizon : Nat)
    (snapshot : CTS.Config Cook.rogozhinCookProgram) (row : DeterministicTape.Row)
    (found : decodeTape? (DeterministicTapeCook.encodeBits source) horizon snapshot = some row) :
    ∃ candidate, DeterministicTapeTrajectoryDecoder.decodeTapeBoundary? candidate = some row ∧
      row.state < source.machine.states.length := by
  unfold decodeTape? at found
  change (decodeContext? (RogozhinT2Cook.encodeBits (DeterministicTapeCook.compileT2Job source))).bind _ = _ at found
  rw [decodeContext?_encodeBits] at found
  change (decodePassCounter? (contextOf (DeterministicTapeCook.compileT2Job source).program)
    horizon snapshot).bind DeterministicTapeTrajectoryDecoder.decodeTapeBoundary? = some row at found
  obtain ⟨candidate, counterFound, tapeFound⟩ := exists_of_bind_eq_some found
  obtain ⟨normalized, _, ordinaryFound⟩ := exists_of_bind_eq_some counterFound
  obtain ⟨ordinary, _, primitiveFound⟩ := exists_of_bind_eq_some ordinaryFound
  have bounded := decodeCounterWord?_control_lt _ ordinary candidate primitiveFound
  change candidate.control < (contextOf (DeletionTwoT2Normalizer.normalizeProgram
    (ThreeCounterTag.Numeric.ordinaryProgram (Compiler.compileMachine source.machine)))).counterShape.length at bounded
  rw [contextOf_counterShape_length] at bounded
  exact ⟨candidate, tapeFound, sourceState_lt_of_decodedBoundary source.machine candidate row tapeFound bounded⟩

theorem decodeTerminalTape?_row (seed : List Bool) (horizon : Nat)
    (snapshot : CTS.Config Cook.rogozhinCookProgram) (row : DeterministicTape.Row)
    (found : decodeTerminalTape? seed horizon snapshot = some row) :
    decodeTape? seed horizon snapshot = some row := by
  obtain ⟨context, _, rowFound⟩ := exists_of_bind_eq_some found
  obtain ⟨candidate, decoded, terminalFound⟩ := exists_of_bind_eq_some rowFound
  split at terminalFound
  · cases terminalFound
    exact decoded
  · cases terminalFound

theorem decodeTerminalTape?_halted (source : DeterministicTape.Instance) (horizon : Nat)
    (snapshot : CTS.Config Cook.rogozhinCookProgram) (row : DeterministicTape.Row)
    (found : decodeTerminalTape? (DeterministicTapeCook.encodeBits source) horizon snapshot = some row) :
    DeterministicTape.step? source.machine row = none := by
  unfold decodeTerminalTape? at found
  change (decodeContext? (RogozhinT2Cook.encodeBits (DeterministicTapeCook.compileT2Job source))).bind _ = _ at found
  rw [decodeContext?_encodeBits] at found
  change (decodeTape? (DeterministicTapeCook.encodeBits source) horizon snapshot).bind
    (fun result => if terminalRow (contextOf (DeterministicTapeCook.compileT2Job source).program) result
      then some result else none) = some row at found
  obtain ⟨candidate, tapeFound, terminalFound⟩ := exists_of_bind_eq_some found
  split at terminalFound
  next terminal =>
    cases terminalFound
    obtain ⟨primitive, primitiveFound, bounded⟩ := decodeTape?_boundary source horizon snapshot row tapeFound
    exact (terminalRow_of_decodedBoundary source.machine primitive row primitiveFound bounded).mp terminal
  next rejected => cases terminalFound

theorem exists_terminalRow_of_runFor? (source : DeterministicTape.Instance)
    (sourceFuel : Nat) (row : DeterministicTape.Row)
    (run : DeterministicTape.runFor? source.machine
      (DeterministicTape.initialRow source) sourceFuel = some row)
    (halted : DeterministicTape.step? source.machine row = none) :
    ∃ ticks, decodeTerminalTape?
      (DeterministicTapeCook.encodeBits (DeterministicTapeStatePadding.pad source)) ticks
      (CTS.iterate Cook.rogozhinCookProgram ticks
        (CTS.initial Cook.rogozhinCookProgram
          (DeterministicTapeCook.encodeBits (DeterministicTapeStatePadding.pad source)))) = some row := by
  obtain ⟨ticks, rowDecoded⟩ := exists_literalRow_at_actualCTS source sourceFuel row run
  obtain ⟨primitiveFuel, primitiveDecoded, _, _⟩ :=
    DeterministicTapeStatePadding.exists_live_decodedPrimitiveBoundary source sourceFuel row run
  have terminal := (terminalRow_of_decodedBoundary
    (DeterministicTapeStatePadding.pad source).machine _ row primitiveDecoded
    (DeterministicTapeStatePadding.runFor?_state_lt_padded_length source sourceFuel row run)).mpr
      (show DeterministicTape.step? (DeterministicTapeStatePadding.pad source).machine row = none by
        rw [DeterministicTapeStatePadding.step?_pad]
        exact halted)
  refine ⟨ticks, ?_⟩
  unfold decodeTerminalTape?
  change (decodeContext? (RogozhinT2Cook.encodeBits
    (DeterministicTapeCook.compileT2Job (DeterministicTapeStatePadding.pad source)))).bind _ = _
  rw [decodeContext?_encodeBits]
  change (decodeTape? (DeterministicTapeCook.encodeBits (DeterministicTapeStatePadding.pad source)) ticks
    (CTS.iterate Cook.rogozhinCookProgram ticks
      (CTS.initial Cook.rogozhinCookProgram
        (DeterministicTapeCook.encodeBits (DeterministicTapeStatePadding.pad source))))).bind _ = _
  rw [rowDecoded]
  exact if_pos terminal

end PureSFormal.Computation.CookSeedPassReadback
