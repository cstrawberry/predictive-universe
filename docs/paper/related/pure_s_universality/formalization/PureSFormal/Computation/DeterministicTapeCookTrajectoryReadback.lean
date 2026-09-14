import PureSFormal.Computation.DeterministicTapeStatePadding
import PureSFormal.Computation.DeterministicTapeCook

/-!
# Literal source rows at actual Cook execution endpoints

This assembly follows each defined source prefix through the padded primitive
compiler, ordinary tag macros, deletion-two normalization, Rogozhin sweeps,
and Cook registered boundaries. The observer takes the finite primitive
program and the current CTS snapshot. It receives no source-run witness or
execution time. Eliminating its explicit program parameter is a separate
immutable-seed readback obligation for a uniform pure-S term observer.
-/

namespace PureSFormal.Computation.DeterministicTapeCookTrajectoryReadback

open PureSFormal.Research.ProtectedTrieDeterministicCompiler
open DeterministicTapeThreeCounterCompiler
open RogozhinTagInput DeletionTwoT2Normalizer RogozhinT2Simulation
open ThreeCounterTag ThreeCounterTag.Numeric

theorem iterate_eq_self_of_halted (program : RogozhinTagInput.Program)
    (word : List Label) (halted : Halted program word) (fuel : Nat) :
    RogozhinTagInput.iterate program fuel word = word := by
  induction fuel with
  | zero => rfl
  | succ fuel ih =>
      rw [RogozhinTagInput.iterate_succ, ih]
      unfold absorbingStep
      rw [halted]

theorem nonhaltingBefore_of_endpoint (program : RogozhinTagInput.Program)
    (word : List Label) (horizon : Nat)
    (live : ¬ Halted program (RogozhinTagInput.iterate program horizon word)) :
    NonhaltingBefore program word horizon := by
  intro earlier earlierLt halted
  have same := tagIterate_add program word earlier (horizon - earlier)
  rw [Nat.add_comm earlier (horizon - earlier),
    Nat.sub_add_cancel (Nat.le_of_lt earlierLt),
    iterate_eq_self_of_halted program _ halted] at same
  exact live (same.symm ▸ halted)

/-- Every primitive instruction has an exact ordinary numerical tag macro;
the absorbing halt case uses zero additional tag steps. -/
theorem ordinary_encodeState_step (program : ThreeCounter.Program)
    (state : ThreeCounter.State) :
    ∃ fuel,
      RogozhinTagInput.iterate (ordinaryProgram program) fuel
        (Numeric.encodeWord program (encodeState program state)) =
      Numeric.encodeWord program (encodeState program (ThreeCounter.step program state)) := by
  rcases state with ⟨control, left, right, scratch, status⟩
  cases status with
  | halted => exact ⟨0, rfl⟩
  | running =>
      cases instructionEq : ThreeCounter.instructionAt program control with
      | halt =>
          refine ⟨0, ?_⟩
          simp only [RogozhinTagInput.iterate_zero, encodeState, ThreeCounter.step,
            ThreeCounter.execute, instructionEq, canonical, header, dataBlock,
            instructionLive, Bool.false_eq_true, if_false, List.append_nil]
      | increment register next =>
          exact ⟨macroFuel register left right scratch,
            numeric_live_macro_step program control left right scratch
              (.increment register next) register instructionEq rfl rfl⟩
      | decrementJump register positive zeroNext =>
          exact ⟨macroFuel register left right scratch,
            numeric_live_macro_step program control left right scratch
              (.decrementJump register positive zeroNext) register instructionEq rfl rfl⟩

theorem ordinary_encodeState_run (program : ThreeCounter.Program)
    (initial : ThreeCounter.State) (primitiveFuel : Nat) :
    ∃ tagFuel,
      RogozhinTagInput.iterate (ordinaryProgram program) tagFuel
        (Numeric.encodeWord program (encodeState program initial)) =
      Numeric.encodeWord program
        (encodeState program (ThreeCounter.run program primitiveFuel initial)) := by
  induction primitiveFuel with
  | zero => exact ⟨0, rfl⟩
  | succ primitiveFuel ih =>
      obtain ⟨prefixFuel, prefixRun⟩ := ih
      obtain ⟨stepFuel, next⟩ := ordinary_encodeState_step program
        (ThreeCounter.run program primitiveFuel initial)
      refine ⟨prefixFuel + stepFuel, ?_⟩
      rw [tagIterate_add, prefixRun, next]
      rfl

theorem ordinary_encodeState_notHalted (program : ThreeCounter.Program)
    (state : ThreeCounter.State) (running : state.status = .running)
    (live : instructionLive (ThreeCounter.instructionAt program state.control) = true) :
    ¬ Halted (ordinaryProgram program)
      (Numeric.encodeWord program (encodeState program state)) := by
  intro halted
  have head := (ordinaryTrajectory_boundary program 0 state).halted_iff_head.mp halted
  have typedHead := (encodeWord_head_halt_iff (encodeState_wordBounded program state)).mp head
  rw [ThreeCounterTagOutputBoundary.encodeState_live_head program state running live] at typedHead
  cases typedHead

theorem tokensValid_iterate (program : RogozhinTagInput.Program)
    (productions : DeletionTwoT2Readback.ProductionsValid program)
    (fuel : Nat) (state : QueueState)
    (valid : DeletionTwoT2Readback.TokensValid program state.tokens) :
    DeletionTwoT2Readback.TokensValid program (state.iterate program fuel).tokens := by
  induction fuel generalizing state with
  | zero => exact valid
  | succ fuel ih =>
      exact ih (state.step program) (DeletionTwoT2Readback.tokensValid_step
        program productions state valid)

/-- Every requested ordinary prefix before its halt is reached by actual
normalization steps, retaining valid tokens and the precise source alignment. -/
theorem exists_normalized_source_boundary (program : RogozhinTagInput.Program)
    (word : List Label) (productions : DeletionTwoT2Readback.ProductionsValid program)
    (trajectory : ∀ horizon, Boundary program (RogozhinTagInput.iterate program horizon word))
    (sourceHorizon : Nat) (before : NonhaltingBefore program word sourceHorizon) :
    ∃ targetHorizon, ∃ state : QueueState,
      state.targetWord program = RogozhinTagInput.iterate (normalizeProgram program)
        targetHorizon (normalizeWord program word) ∧
      state.sourceView = RogozhinTagInput.iterate program sourceHorizon word ∧
      DeletionTwoT2Readback.TokensValid program state.tokens := by
  induction sourceHorizon with
  | zero =>
      exact ⟨0, ⟨.aligned, dataTokens word ++ [Token.pad]⟩,
        targetOf_initialTokens program word, sourceOf_initialTokens word,
        DeletionTwoT2Readback.tokensValid_initial program word (trajectory 0).labels⟩
  | succ sourceHorizon ih =>
      obtain ⟨targetHorizon, state, targetEq, sourceEq, valid⟩ := ih
        (nonhaltingBefore_mono before (Nat.le_succ sourceHorizon))
      have boundary : Boundary program state.sourceView := sourceEq ▸ trajectory sourceHorizon
      have live : ¬ Halted program state.sourceView := by
        rw [sourceEq]
        exact before sourceHorizon (Nat.lt_succ_self sourceHorizon)
      obtain ⟨fuel, next, _, advanced, nextSource⟩ :=
        state.advances_finitely program boundary live
      let represented : Represents program word
          (RogozhinTagInput.iterate (normalizeProgram program) targetHorizon
            (normalizeWord program word)) :=
        ⟨sourceHorizon, state, sourceEq, targetEq⟩
      let followed := represented.steps trajectory fuel
      have followedState : followed.state = next := by
        rw [Represents.steps_state]
        exact advanced
      refine ⟨targetHorizon + fuel, next, ?_, ?_, ?_⟩
      · have followedTarget := followed.target_eq
        rw [followedState, frontIterate_eq_iterate] at followedTarget
        exact followedTarget.trans
          (tagIterate_add (normalizeProgram program) (normalizeWord program word)
            targetHorizon fuel).symm
      · rw [nextSource, sourceEq]
        rfl
      · rw [← advanced]
        exact tokensValid_iterate program productions fuel state valid

/-- A live ordinary endpoint has a nonhalting normalized checkpoint that
decodes to that exact endpoint, suitable for the actual Rogozhin sweep theorem. -/
theorem exists_normalized_decoded_boundary (program : RogozhinTagInput.Program)
    (word : List Label) (productions : DeletionTwoT2Readback.ProductionsValid program)
    (trajectory : ∀ horizon, Boundary program (RogozhinTagInput.iterate program horizon word))
    (wellFormed : WellFormed (normalizeProgram program) (normalizeWord program word))
    (sourceHorizon : Nat)
    (live : ¬ Halted program (RogozhinTagInput.iterate program sourceHorizon word)) :
    ∃ targetHorizon,
      NonhaltingBefore (normalizeProgram program) (normalizeWord program word) targetHorizon ∧
      DeletionTwoT2Readback.decodeWord? program
        (RogozhinTagInput.iterate (normalizeProgram program) targetHorizon
          (normalizeWord program word)) =
        some (RogozhinTagInput.iterate program sourceHorizon word) := by
  obtain ⟨targetHorizon, state, targetEq, sourceEq, valid⟩ :=
    exists_normalized_source_boundary program word productions trajectory sourceHorizon
      (nonhaltingBefore_of_endpoint program word sourceHorizon live)
  let represented : Represents program word
      (RogozhinTagInput.iterate (normalizeProgram program) targetHorizon
        (normalizeWord program word)) :=
    ⟨sourceHorizon, state, sourceEq, targetEq⟩
  have targetLive : ¬ Halted (normalizeProgram program)
      (RogozhinTagInput.iterate (normalizeProgram program) targetHorizon
        (normalizeWord program word)) := by
    intro halted
    have head := (wellFormed.iterate targetHorizon).halted_iff_head.mp halted
    rw [normalize_haltLabel] at head
    exact live (represented_halt_reflects program word trajectory represented head)
  refine ⟨targetHorizon, nonhaltingBefore_of_endpoint _ _ _ targetLive, ?_⟩
  have decoded := DeletionTwoT2Readback.decodeWord?_targetWord program state valid
  exact (congrArg (DeletionTwoT2Readback.decodeWord? program) targetEq).symm.trans
    (decoded.trans (congrArg some sourceEq))

/-- Every live primitive endpoint is exposed at an actual CTS iterate of the
same compiled initial job. No independently re-encoded endpoint is substituted
for that execution. -/
theorem exists_decodeCounter?_iterate (program : ThreeCounter.Program)
    (initial : ThreeCounter.State) (primitiveFuel : Nat)
    (running : (ThreeCounter.run program primitiveFuel initial).status = .running)
    (live : instructionLive (ThreeCounter.instructionAt program
      (ThreeCounter.run program primitiveFuel initial).control) = true) :
    ∃ ticks,
      ThreeCounterCookReadback.decodeCounter? program
        (CTS.iterate Cook.rogozhinCookProgram ticks
          (CTS.initial Cook.rogozhinCookProgram
            (RogozhinT2Cook.encodeBits (compileT2 program initial)))) =
        some (ThreeCounter.run program primitiveFuel initial) := by
  obtain ⟨ordinaryFuel, ordinaryRun⟩ := ordinary_encodeState_run program initial primitiveFuel
  have ordinaryLive : ¬ Halted (ordinaryProgram program)
      (RogozhinTagInput.iterate (ordinaryProgram program) ordinaryFuel
        (Numeric.encodeWord program (encodeState program initial))) := by
    rw [ordinaryRun]
    exact ordinary_encodeState_notHalted program _ running live
  obtain ⟨targetHorizon, before, aligned⟩ := exists_normalized_decoded_boundary
    (ordinaryProgram program) (Numeric.encodeWord program (encodeState program initial))
    (ordinaryProgram_productionLabelsValid program)
    (fun horizon => ordinaryTrajectory_boundary program horizon initial)
    (compileT2_wellFormed program initial) ordinaryFuel ordinaryLive
  obtain ⟨ticks, decoded⟩ := CookRegisteredReadback.exists_decodeTag?_iterate
    (compileT2_wellFormed program initial) targetHorizon before
  change CookRegisteredReadback.decodeTag? (compileT2 program initial).program
    (CTS.iterate Cook.rogozhinCookProgram ticks
      (CTS.initial Cook.rogozhinCookProgram
        (RogozhinT2Cook.encodeBits (compileT2 program initial)))) = _ at decoded
  have ordinaryDecoded :
      CookRegisteredReadback.decodeOrdinary? (ordinaryProgram program)
        (CTS.iterate Cook.rogozhinCookProgram ticks
          (CTS.initial Cook.rogozhinCookProgram
            (RogozhinT2Cook.encodeBits (compileT2 program initial)))) =
        some (Numeric.encodeWord program
          (encodeState program (ThreeCounter.run program primitiveFuel initial))) := by
    unfold CookRegisteredReadback.decodeOrdinary?
    change (CookRegisteredReadback.decodeTag? (compileT2 program initial).program
      (CTS.iterate Cook.rogozhinCookProgram ticks
        (CTS.initial Cook.rogozhinCookProgram
          (RogozhinT2Cook.encodeBits (compileT2 program initial))))).bind
      (DeletionTwoT2Readback.decodeWord? (ordinaryProgram program)) = _
    rw [decoded]
    exact aligned.trans (congrArg some ordinaryRun)
  refine ⟨ticks, ?_⟩
  rw [ThreeCounterCookReadback.decodeCounter?, ordinaryDecoded]
  exact ThreeCounterCookReadback.decodeCounterWord?_encodeState program _ running live

/-- Every defined prefix of the original source reaches an actual CTS
snapshot from which the full literal row is recovered. The observer's finite
primitive-program parameter is displayed explicitly in the statement. -/
theorem exists_literalRow_at_actualCTS (source : DeterministicTape.Instance)
    (sourceFuel : Nat) (row : DeterministicTape.Row)
    (run : DeterministicTape.runFor? source.machine
      (DeterministicTape.initialRow source) sourceFuel = some row) :
    ∃ ticks,
      ThreeCounterCookReadback.decodeTape?
        (Compiler.compileMachine (DeterministicTapeStatePadding.pad source).machine)
        (CTS.iterate Cook.rogozhinCookProgram ticks
          (CTS.initial Cook.rogozhinCookProgram
            (DeterministicTapeCook.encodeBits (DeterministicTapeStatePadding.pad source)))) =
        some row := by
  obtain ⟨primitiveFuel, decoded, running, live⟩ :=
    DeterministicTapeStatePadding.exists_live_decodedPrimitiveBoundary source sourceFuel row run
  obtain ⟨ticks, counterDecoded⟩ := exists_decodeCounter?_iterate
    (Compiler.compileMachine (DeterministicTapeStatePadding.pad source).machine)
    (Execution.compileInitial (DeterministicTapeStatePadding.pad source))
    primitiveFuel running live
  change ThreeCounterCookReadback.decodeCounter?
    (Compiler.compileMachine (DeterministicTapeStatePadding.pad source).machine)
    (CTS.iterate Cook.rogozhinCookProgram ticks
      (CTS.initial Cook.rogozhinCookProgram
        (DeterministicTapeCook.encodeBits (DeterministicTapeStatePadding.pad source)))) = _
    at counterDecoded
  refine ⟨ticks, ?_⟩
  rw [ThreeCounterCookReadback.decodeTape?, counterDecoded]
  exact decoded

/-- A halting source's literal final row occurs at a readable actual CTS
snapshot before the later data-erasing cleanup. The decoder uses the snapshot
and explicit finite program, without rerunning the source. -/
theorem exists_terminalRow_at_actualCTS (source : DeterministicTape.Instance)
    (halts : DeterministicTape.Halts source) :
    ∃ ticks row,
      ThreeCounterCookReadback.decodeTape?
        (Compiler.compileMachine (DeterministicTapeStatePadding.pad source).machine)
        (CTS.iterate Cook.rogozhinCookProgram ticks
          (CTS.initial Cook.rogozhinCookProgram
            (DeterministicTapeCook.encodeBits (DeterministicTapeStatePadding.pad source)))) =
        some row ∧ DeterministicTape.step? source.machine row = none := by
  obtain ⟨sourceFuel, row, run, halted⟩ := halts
  obtain ⟨ticks, decoded⟩ := exists_literalRow_at_actualCTS source sourceFuel row run
  exact ⟨ticks, row, decoded, halted⟩

end PureSFormal.Computation.DeterministicTapeCookTrajectoryReadback
