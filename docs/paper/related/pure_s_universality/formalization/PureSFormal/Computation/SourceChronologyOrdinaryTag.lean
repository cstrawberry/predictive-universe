import PureSFormal.Computation.DeterministicTapePrimitiveChronology
import PureSFormal.Computation.DeterministicTapeCookTrajectoryReadback

/-!
# Positive primitive-to-ordinary-tag chronology

The ordinary tag compiler has zero-duration halt cases because its halt
encoding has already discarded the registers. Its clock is therefore strictly
increasing only on prefixes whose primitive endpoint is still running.
Every designated source boundary in the padded compiler is such an endpoint.
No normalized-tag, Rogozhin, CTS, or pure-S clock composition is claimed here.
-/

namespace PureSFormal.Computation.SourceChronologyOrdinaryTag

open ThreeCounterTag ThreeCounterTag.Numeric
open DeterministicTapeThreeCounterCompiler.Execution
open PureSFormal.Research.ProtectedTrieDeterministicCompiler

/-- Duration of the actual ordinary numerical tag macro. -/
def stepDuration (program : ThreeCounter.Program) (state : ThreeCounter.State) : Nat :=
  match state.status with
  | .halted => 0
  | .running =>
      match ThreeCounter.instructionAt program state.control with
      | .halt => 0
      | .increment register _ | .decrementJump register _ _ =>
          macroFuel register state.left state.right state.scratch

theorem stepDuration_exact (program : ThreeCounter.Program) (state : ThreeCounter.State) :
    RogozhinTagInput.iterate (ordinaryProgram program) (stepDuration program state)
      (Numeric.encodeWord program (encodeState program state)) =
      Numeric.encodeWord program (encodeState program (ThreeCounter.step program state)) := by
  rcases state with ⟨control, left, right, scratch, status⟩
  cases status with
  | halted => rfl
  | running =>
      cases instructionEq : ThreeCounter.instructionAt program control with
      | halt =>
          simp only [stepDuration, instructionEq, RogozhinTagInput.iterate_zero, encodeState,
            ThreeCounter.step, ThreeCounter.execute, canonical, header, dataBlock,
            instructionLive, Bool.false_eq_true, if_false, List.append_nil]
      | increment register next =>
          simp only [stepDuration, instructionEq]
          exact numeric_live_macro_step program control left right scratch
            (.increment register next) register instructionEq rfl rfl
      | decrementJump register positive zeroNext =>
          simp only [stepDuration, instructionEq]
          exact numeric_live_macro_step program control left right scratch
            (.decrementJump register positive zeroNext) register instructionEq rfl rfl

theorem stepDuration_positive (program : ThreeCounter.Program) (state : ThreeCounter.State)
    (runningNext : (ThreeCounter.step program state).status = .running) :
    0 < stepDuration program state := by
  rcases state with ⟨control, left, right, scratch, status⟩
  cases status with
  | halted => cases runningNext
  | running =>
      cases instructionEq : ThreeCounter.instructionAt program control with
      | halt =>
          simp only [ThreeCounter.step, instructionEq, ThreeCounter.execute] at runningNext
          cases runningNext
      | increment register next =>
          simp only [stepDuration, instructionEq]
          exact macroFuel_positive register left right scratch
      | decrementJump register positive zeroNext =>
          simp only [stepDuration, instructionEq]
          exact macroFuel_positive register left right scratch

/-- Sum of the exact instruction durations along the actual primitive run. -/
def ordinaryTime (program : ThreeCounter.Program) (initial : ThreeCounter.State) : Nat → Nat
  | 0 => 0
  | fuel + 1 => ordinaryTime program initial fuel +
      stepDuration program (ThreeCounter.run program fuel initial)

theorem ordinaryTime_exact (program : ThreeCounter.Program) (initial : ThreeCounter.State)
    (fuel : Nat) :
    RogozhinTagInput.iterate (ordinaryProgram program) (ordinaryTime program initial fuel)
      (Numeric.encodeWord program (encodeState program initial)) =
      Numeric.encodeWord program (encodeState program (ThreeCounter.run program fuel initial)) := by
  induction fuel with
  | zero => rfl
  | succ fuel ih =>
      rw [ordinaryTime, DeletionTwoT2Normalizer.tagIterate_add, ih, stepDuration_exact]
      rfl

theorem ordinaryTime_strict (program : ThreeCounter.Program) (initial : ThreeCounter.State)
    (horizon : Nat) (endpoint : (ThreeCounter.run program horizon initial).status = .running)
    (first second : Nat) (ordered : first < second) (bounded : second ≤ horizon) :
    ordinaryTime program initial first < ordinaryTime program initial second := by
  induction second with
  | zero => exact False.elim (Nat.not_lt_zero first ordered)
  | succ second ih =>
      have runningNext := running_prefix_of_running_endpoint program initial horizon (second + 1) bounded endpoint
      have durationPositive := stepDuration_positive program (ThreeCounter.run program second initial) runningNext
      have nextLt : ordinaryTime program initial second < ordinaryTime program initial (second + 1) :=
        Nat.lt_add_of_pos_right durationPositive
      have firstLe : first ≤ second := Nat.le_of_lt_succ ordered
      cases Nat.eq_or_lt_of_le firstLe with
      | inl same => simpa only [same] using nextLt
      | inr before => exact Nat.lt_trans (ih before (Nat.le_trans (Nat.le_succ second) bounded)) nextLt

/-- The same padded compiler and initial primitive state as the output path. -/
def sourceOrdinaryTime (source : DeterministicTape.Instance) (sourceFuel : Nat) : Nat :=
  let padded := DeterministicTapeStatePadding.pad source
  ordinaryTime (DeterministicTapeThreeCounterCompiler.Compiler.compileMachine padded.machine)
    (DeterministicTapeThreeCounterCompiler.Execution.compileInitial padded)
    (DeterministicTapePrimitiveChronology.sourceTime padded sourceFuel)

/-- Actual ordinary-tag execution at the chronological source sample admits
literal tape readback. This intermediate reader still has a program argument;
it is not being substituted for the final fixed bare-term observer. -/
theorem sourceOrdinaryTime_decodes (source : DeterministicTape.Instance)
    (fuel : Nat) (row : DeterministicTape.Row)
    (sourceRun : DeterministicTape.runFor? source.machine (DeterministicTape.initialRow source) fuel = some row) :
    let padded := DeterministicTapeStatePadding.pad source
    let program := DeterministicTapeThreeCounterCompiler.Compiler.compileMachine padded.machine
    let initial := DeterministicTapeThreeCounterCompiler.Execution.compileInitial padded
    (ThreeCounterCookReadback.decodeCounterWord? program
      (RogozhinTagInput.iterate (ordinaryProgram program) (sourceOrdinaryTime source fuel)
        (Numeric.encodeWord program (encodeState program initial)))).bind
      DeterministicTapeTrajectoryDecoder.decodeTapeBoundary? = some row := by
  have runningLive := DeterministicTapePrimitiveChronology.padded_sourceTime_running_live source fuel row sourceRun
  dsimp only
  unfold sourceOrdinaryTime
  rw [ordinaryTime_exact, ThreeCounterCookReadback.decodeCounterWord?_encodeState _ _ runningLive.1 runningLive.2]
  exact DeterministicTapePrimitiveChronology.padded_sourceTime_decodes source fuel row sourceRun

/-- Designated source indices retain strict order at ordinary tag times. -/
theorem sourceOrdinaryTime_strict (source : DeterministicTape.Instance)
    (horizon : Nat) (row : DeterministicTape.Row)
    (sourceRun : DeterministicTape.runFor? source.machine (DeterministicTape.initialRow source) horizon = some row)
    (first second : Nat) (ordered : first < second) (bounded : second ≤ horizon) :
    sourceOrdinaryTime source first < sourceOrdinaryTime source second := by
  obtain ⟨atSecond, secondRun⟩ := DeterministicTapePrimitiveChronology.source_prefix_defined
    source.machine _ row horizon sourceRun second bounded
  have decoded := DeterministicTapePrimitiveChronology.padded_sourceTime_decodes source second atSecond secondRun
  obtain ⟨state, left, right, _, candidateEq, _⟩ :=
    DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?_sound decoded
  have endpoint : (ThreeCounter.run
      (DeterministicTapeThreeCounterCompiler.Compiler.compileMachine (DeterministicTapeStatePadding.pad source).machine)
      (DeterministicTapePrimitiveChronology.sourceTime (DeterministicTapeStatePadding.pad source) second)
      (DeterministicTapeThreeCounterCompiler.Execution.compileInitial (DeterministicTapeStatePadding.pad source))).status = .running := by
    rw [candidateEq]
    rfl
  exact ordinaryTime_strict _ _ _ endpoint _ _
    (DeterministicTapePrimitiveChronology.padded_sourceTime_strict source horizon row sourceRun first second ordered bounded)
    (Nat.le_refl _)

end PureSFormal.Computation.SourceChronologyOrdinaryTag
