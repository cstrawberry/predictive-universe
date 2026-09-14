import PureSFormal.Computation.SourceChronologyCook

/-! Strict finite source sampling using the actual seed-derived CTS reader. -/

namespace PureSFormal.Computation.SourceChronologySourceCTS

open Cook Cook.PassClassification RogozhinTagInput RogozhinT2Simulation
open SourceChronologyNormalizedTag SourceChronologyRogozhin SourceChronologyCook
open SourceChronologyOrdinaryTag CookSeedReadbackContext
open PureSFormal.Research.ProtectedTrieDeterministicCompiler
open DeterministicTapeThreeCounterCompiler
open ThreeCounterTag ThreeCounterTag.Numeric

theorem sourcePrimitive_tested (source : DeterministicTape.Instance) (fuel : Nat)
    (row : DeterministicTape.Row)
    (sourceRun : DeterministicTape.runFor? source.machine (DeterministicTape.initialRow source) fuel = some row) :
    instructionTested? (ThreeCounter.instructionAt (sourceProgram source)
      (ThreeCounter.run (sourceProgram source)
        (DeterministicTapePrimitiveChronology.sourceTime (DeterministicTapeStatePadding.pad source) fuel)
        (sourceInitial source)).control) = some .right := by
  have decoded := DeterministicTapePrimitiveChronology.padded_sourceTime_decodes source fuel row sourceRun
  obtain ⟨state, left, right, _, candidateEq, rowEq⟩ :=
    DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?_sound decoded
  have stateEq : row.state = state := congrArg (fun result : DeterministicTape.Row => result.state) rowEq
  have bounded : state < (DeterministicTapeStatePadding.pad source).machine.states.length := by
    rw [← stateEq]
    exact DeterministicTapeStatePadding.runFor?_state_lt_padded_length source fuel row sourceRun
  unfold sourceProgram sourceInitial
  rw [candidateEq]
  change instructionTested? (ThreeCounter.instructionAt
    (Compiler.compileMachine (DeterministicTapeStatePadding.pad source).machine)
    (Layout.address state (.right .start))) = some .right
  rw [Compiler.instructionAt_compileMachine bounded]
  rfl

theorem normalized_context_decodes {source : DeterministicTape.Instance} {horizon : Nat}
    (trace : SourcePrefix source horizon) (endpoint : DeterministicTape.Row)
    (endpointRun : DeterministicTape.runFor? source.machine (DeterministicTape.initialRow source) horizon = some endpoint)
    (fuel : Nat) (bounded : fuel ≤ horizon) (row : DeterministicTape.Row)
    (sourceRun : DeterministicTape.runFor? source.machine (DeterministicTape.initialRow source) fuel = some row) :
    DeterministicTapeTagBoundaryReflection.decodeNormalizedTape? (contextOf (sourceT2 source).program)
      (RogozhinTagInput.iterate (sourceT2 source).program (trace.sourceTime fuel) (sourceT2 source).word) = some row := by
  have runningLive := DeterministicTapePrimitiveChronology.padded_sourceTime_running_live source fuel row sourceRun
  have tested := sourcePrimitive_tested source fuel row sourceRun
  unfold DeterministicTapeTagBoundaryReflection.decodeNormalizedTape?
  change (DeletionTwoT2Readback.decodeWord?
    (contextOf (DeletionTwoT2Normalizer.normalizeProgram (ordinaryProgram (sourceProgram source)))).ordinaryShape
    (RogozhinTagInput.iterate (DeletionTwoT2Normalizer.normalizeProgram (ordinaryProgram (sourceProgram source)))
      (trace.sourceTime fuel) (DeletionTwoT2Normalizer.normalizeWord (ordinaryProgram (sourceProgram source)) (sourceWord source)))).bind _ = _
  rw [decodeWord?_sameCount _ _ (contextOf_ordinaryShape_count (ordinaryProgram (sourceProgram source))),
    SourcePrefix.sourceTime, trace.decodes _ (sourceOrdinaryTime_le source horizon endpoint endpointRun fuel bounded)]
  change (ThreeCounterCookReadback.decodeCounterWord? (contextOf (sourceT2 source).program).counterShape
    (RogozhinTagInput.iterate (ordinaryProgram (sourceProgram source)) (sourceOrdinaryTime source fuel)
      (sourceWord source))).bind DeterministicTapeTrajectoryDecoder.decodeTapeBoundary? = some row
  unfold sourceOrdinaryTime sourceWord sourceT2 compileT2 sourceProgram sourceInitial
  rw [ordinaryTime_exact, contextOf_decodeCounterWord? _ _ runningLive.1 runningLive.2 tested]
  exact DeterministicTapePrimitiveChronology.padded_sourceTime_decodes source fuel row sourceRun

theorem sourceRunning {source : DeterministicTape.Instance} {horizon : Nat}
    (trace : SourcePrefix source horizon) (endpoint : DeterministicTape.Row)
    (endpointRun : DeterministicTape.runFor? source.machine (DeterministicTape.initialRow source) horizon = some endpoint) :
    RunningBefore (RogozhinTagInput.compile (sourceT2 source)) (machineTime trace horizon) := by
  intro earlier bounded
  exact machineTime_safeThrough trace endpoint endpointRun horizon (Nat.le_refl _) endpoint endpointRun earlier (Nat.le_of_lt bounded)

theorem machineTime_le {source : DeterministicTape.Instance} {horizon : Nat}
    (trace : SourcePrefix source horizon) (endpoint : DeterministicTape.Row)
    (endpointRun : DeterministicTape.runFor? source.machine (DeterministicTape.initialRow source) horizon = some endpoint)
    (fuel : Nat) (bounded : fuel ≤ horizon) : machineTime trace fuel ≤ machineTime trace horizon := by
  cases Nat.eq_or_lt_of_le bounded with
  | inl same => subst fuel; exact Nat.le_refl _
  | inr earlier => exact Nat.le_of_lt (machineTime_strict trace endpoint endpointRun fuel horizon earlier (Nat.le_refl _))

def sourceCTSTime {source : DeterministicTape.Instance} {horizon : Nat}
    (trace : SourcePrefix source horizon) (endpoint : DeterministicTape.Row)
    (endpointRun : DeterministicTape.runFor? source.machine (DeterministicTape.initialRow source) horizon = some endpoint)
    (fuel : Nat) : Nat :=
  ctsTime (RogozhinTagInput.compile (sourceT2 source)) (machineTime trace horizon)
    (sourceRunning trace endpoint endpointRun) (machineTime trace fuel)

theorem sourceCTSTime_zero {source : DeterministicTape.Instance} {horizon : Nat}
    (trace : SourcePrefix source horizon) (endpoint : DeterministicTape.Row)
    (endpointRun : DeterministicTape.runFor? source.machine (DeterministicTape.initialRow source) horizon = some endpoint) :
    sourceCTSTime trace endpoint endpointRun 0 = 0 := by
  rw [sourceCTSTime, machineTime_zero, ctsTime_zero]

theorem sourceCTSTime_strict {source : DeterministicTape.Instance} {horizon : Nat}
    (trace : SourcePrefix source horizon) (endpoint : DeterministicTape.Row)
    (endpointRun : DeterministicTape.runFor? source.machine (DeterministicTape.initialRow source) horizon = some endpoint)
    (first second : Nat) (ordered : first < second) (bounded : second ≤ horizon) :
    sourceCTSTime trace endpoint endpointRun first < sourceCTSTime trace endpoint endpointRun second := by
  exact ctsTime_strict _ _ _ _ _ (machineTime_strict trace endpoint endpointRun first second ordered bounded)
    (machineTime_le trace endpoint endpointRun second bounded)

theorem sourceCTSTime_passDecode {source : DeterministicTape.Instance} {horizon : Nat}
    (trace : SourcePrefix source horizon) (endpoint : DeterministicTape.Row)
    (endpointRun : DeterministicTape.runFor? source.machine (DeterministicTape.initialRow source) horizon = some endpoint)
    (fuel : Nat) (bounded : fuel ≤ horizon) :
    Cook.passDecode? (sourceCTSTime trace endpoint endpointRun fuel)
      (CTS.iterate rogozhinCookProgram (sourceCTSTime trace endpoint endpointRun fuel)
        (CTS.initial rogozhinCookProgram (DeterministicTapeCook.encodeBits (DeterministicTapeStatePadding.pad source)))) =
      some (Rogozhin46.iterate (machineTime trace fuel) (RogozhinTagInput.compile (sourceT2 source))) :=
  ctsTime_decodes _ _ _ _ (machineTime_le trace endpoint endpointRun fuel bounded)

/-- The exact seed/horizon/snapshot reader used by the final bare-term observer. -/
theorem sourceCTSTime_decodes {source : DeterministicTape.Instance} {horizon : Nat}
    (trace : SourcePrefix source horizon) (endpoint : DeterministicTape.Row)
    (endpointRun : DeterministicTape.runFor? source.machine (DeterministicTape.initialRow source) horizon = some endpoint)
    (fuel : Nat) (bounded : fuel ≤ horizon) (row : DeterministicTape.Row)
    (sourceRun : DeterministicTape.runFor? source.machine (DeterministicTape.initialRow source) fuel = some row) :
    CookSeedPassReadback.decodeTape? (DeterministicTapeCook.encodeBits (DeterministicTapeStatePadding.pad source))
      (sourceCTSTime trace endpoint endpointRun fuel)
      (CTS.iterate rogozhinCookProgram (sourceCTSTime trace endpoint endpointRun fuel)
        (CTS.initial rogozhinCookProgram (DeterministicTapeCook.encodeBits (DeterministicTapeStatePadding.pad source)))) = some row := by
  rw [CookSeedPassReadback.decodeTape?_factors]
  change (decodeContext? (RogozhinT2Cook.encodeBits (sourceT2 source))).bind _ = _
  rw [decodeContext?_encodeBits]
  change (CookSeedPassReadback.decodePassTag? (contextOf (sourceT2 source).program)
    (sourceCTSTime trace endpoint endpointRun fuel)
    (CTS.iterate rogozhinCookProgram (sourceCTSTime trace endpoint endpointRun fuel)
      (CTS.initial rogozhinCookProgram (DeterministicTapeCook.encodeBits (DeterministicTapeStatePadding.pad source))))).bind _ = _
  unfold CookSeedPassReadback.decodePassTag?
  rw [sourceCTSTime_passDecode trace endpoint endpointRun fuel bounded]
  change ((contextOf (sourceT2 source).program).decodeBoundary?
    (Rogozhin46.iterate (machineTime trace fuel) (RogozhinTagInput.compile (sourceT2 source)))).bind _ = _
  rw [machineTime_exact trace endpoint endpointRun fuel bounded row sourceRun]
  unfold sourceT2
  rw [contextOf_decodeBoundary? _ (compileT2_wellFormed (sourceProgram source) (sourceInitial source)).isT2 _ _
      ((compileT2_wellFormed (sourceProgram source) (sourceInitial source)).iterate (trace.sourceTime fuel)).labels]
  exact normalized_context_decodes trace endpoint endpointRun fuel bounded row sourceRun

theorem exists_sourceCTSClock (source : DeterministicTape.Instance) (horizon : Nat)
    (endpoint : DeterministicTape.Row)
    (endpointRun : DeterministicTape.runFor? source.machine (DeterministicTape.initialRow source) horizon = some endpoint) :
    ∃ clock : Nat → Nat, clock 0 = 0 ∧
      (∀ first second, first < second → second ≤ horizon → clock first < clock second) ∧
      (∀ fuel, fuel ≤ horizon → ∀ row,
        DeterministicTape.runFor? source.machine (DeterministicTape.initialRow source) fuel = some row →
        CookSeedPassReadback.decodeTape? (DeterministicTapeCook.encodeBits (DeterministicTapeStatePadding.pad source))
          (clock fuel) (CTS.iterate rogozhinCookProgram (clock fuel)
            (CTS.initial rogozhinCookProgram (DeterministicTapeCook.encodeBits (DeterministicTapeStatePadding.pad source)))) = some row) := by
  obtain ⟨trace⟩ := exists_sourcePrefix source horizon endpoint endpointRun
  refine ⟨sourceCTSTime trace endpoint endpointRun, sourceCTSTime_zero trace endpoint endpointRun, ?_, ?_⟩
  · exact sourceCTSTime_strict trace endpoint endpointRun
  · exact sourceCTSTime_decodes trace endpoint endpointRun

end PureSFormal.Computation.SourceChronologySourceCTS
