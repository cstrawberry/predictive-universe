import PureSFormal.Computation.ThreeCounterTagBoundaryReflection
import PureSFormal.Computation.CookSeedTerminalSoundness

/-!
# Operational reflection through the numerical tag alphabet

Every numerical iterate has an exact represented typed iterate, including
the numerical absorbing halt convention. A successful live decoder using
the same alphabet width forces a canonical typed header, and therefore an
actual primitive-instruction endpoint.
-/

namespace PureSFormal.Computation.ThreeCounterNumericBoundaryReflection

open ThreeCounter ThreeCounterTag ThreeCounterTag.Numeric
open CounterMachineTag (tagIterate tagStep)

theorem numeric_halt_head_fixed (program : Program) (word : List Symbol)
    (head : word.head? = some .halt) :
    RogozhinTagInput.absorbingStep (ordinaryProgram program) (encodeWord program word) =
      encodeWord program word := by
  cases word with
  | nil => cases head
  | cons first rest =>
      have firstEq := Option.some.inj head
      subst first
      cases rest with
      | nil => rfl
      | cons second rest =>
          unfold RogozhinTagInput.absorbingStep
          simp only [encodeWord, List.map_cons, RogozhinTagInput.step?, ordinaryProgram_haltLabel]
          rw [if_pos (show encodeSymbol program .halt = ordinaryCount program from rfl)]

theorem numeric_iterate_succ_front (program : RogozhinTagInput.Program)
    (fuel : Nat) (word : List Nat) :
    RogozhinTagInput.iterate program (fuel + 1) word =
      RogozhinTagInput.iterate program fuel (RogozhinTagInput.absorbingStep program word) := by
  have composed := DeletionTwoT2Normalizer.tagIterate_add program word 1 fuel
  rw [Nat.add_comm 1 fuel] at composed
  exact composed

/-- Numerical absorption may retain an earlier typed halted word; every
current numerical word nevertheless has an exact actual typed witness. -/
theorem numeric_iterate_represented (program : Program) :
    ∀ fuel word, WordBounded program word →
      ∃ typedFuel,
        RogozhinTagInput.iterate (ordinaryProgram program) fuel (encodeWord program word) =
          encodeWord program (tagIterate (production program) typedFuel word) := by
  intro fuel
  induction fuel with
  | zero => intro word bounded; exact ⟨0, rfl⟩
  | succ fuel ih =>
      intro word bounded
      by_cases halted : word.head? = some .halt
      · exact ⟨0, CounterMachineTag.Numeric.iterate_eq_self_of_absorbingStep_eq
          (numeric_halt_head_fixed program word halted) (fuel + 1)⟩
      · obtain ⟨typedFuel, represented⟩ := ih (tagStep (production program) word)
          (tagStep_wordBounded bounded)
        refine ⟨typedFuel + 1, ?_⟩
        rw [numeric_iterate_succ_front, absorbingStep_encodeWord bounded halted, represented,
          CounterMachineTag.tagIterate_succ_front]

theorem decodeSymbol_sameLength (first second : Program)
    (same : first.length = second.length) (label : Nat) :
    ThreeCounterCookReadback.decodeSymbol first label =
      ThreeCounterCookReadback.decodeSymbol second label := by
  have enumerations : enumerationProgram first = enumerationProgram second :=
    congrArg (fun length => List.replicate (3 * length) CounterMachine.Instruction.reject) same
  unfold ThreeCounterCookReadback.decodeSymbol
  unfold ordinaryCount decodeSymbol
  rw [enumerations]

theorem decodeSymbols_sameLength (first second : Program)
    (same : first.length = second.length) (word : List Nat) :
    word.map (ThreeCounterCookReadback.decodeSymbol first) =
      word.map (ThreeCounterCookReadback.decodeSymbol second) := by
  induction word with
  | nil => rfl
  | cons head rest ih =>
      rw [List.map_cons, List.map_cons, decodeSymbol_sameLength first second same head, ih]

/-- A successful canonical decoder of the same numerical width reflects to
the full encoding of an actual primitive endpoint, even when its instruction
table is only a readback codec. -/
theorem decodeCounterWord?_actual_reflects (program codec : Program)
    (same : codec.length = program.length) (initial : State) (fuel : Nat)
    (candidate : State)
    (found : ThreeCounterCookReadback.decodeCounterWord? codec
      (RogozhinTagInput.iterate (ordinaryProgram program) fuel
        (encodeWord program (encodeState program initial))) = some candidate) :
    ∃ sourceFuel,
      RogozhinTagInput.iterate (ordinaryProgram program) fuel
        (encodeWord program (encodeState program initial)) =
        encodeWord program (encodeState program (ThreeCounter.run program sourceFuel initial)) := by
  obtain ⟨typedFuel, represented⟩ := numeric_iterate_represented program fuel
    (encodeState program initial) (encodeState_wordBounded program initial)
  unfold ThreeCounterCookReadback.decodeCounterWord? at found
  rw [represented, decodeSymbols_sameLength codec program same,
    ThreeCounterCookReadback.decodeSymbols_encodeWord program _
      (tagIterate_wordBounded (encodeState_wordBounded program initial) typedFuel)] at found
  have shape := ThreeCounterTagOutputBoundary.decodeLive?_sound codec _ candidate found
  have observed : (tagIterate (production program) typedFuel (encodeState program initial)).head? =
      some (.head candidate.control) := by
    rw [← shape.2.2]
    exact ThreeCounterTagOutputBoundary.encodeState_live_head codec candidate shape.1 shape.2.1
  obtain ⟨sourceFuel, exactWord⟩ := ThreeCounterTagBoundaryReflection.tagIterate_head_reflects_source
    program candidate.control typedFuel initial observed
  exact ⟨sourceFuel, represented.trans (congrArg (encodeWord program) exactWord)⟩

theorem encodeState_head_fields (program : Program) (state : State) (target : Nat)
    (observed : (encodeState program state).head? = some (.head target)) :
    state.status = .running ∧ instructionLive (instructionAt program state.control) = true ∧
      state.control = target := by
  rcases state with ⟨control, left, right, scratch, status⟩
  cases status with
  | halted => cases observed
  | running =>
      cases instructionEq : instructionAt program control with
      | halt =>
          have shape := ThreeCounterTagOutputBoundary.canonical_halt program control left right scratch instructionEq
          change (canonical program control left right scratch).head? = _ at observed
          rw [shape] at observed
          cases observed
      | increment register next =>
          simp only [encodeState, canonical, header, instructionEq,
            List.cons_append, List.nil_append, List.head?_cons] at observed
          exact ⟨rfl, rfl, CounterMachineTag.Symbol.head.inj (Option.some.inj observed)⟩
      | decrementJump register next zeroNext =>
          simp only [encodeState, canonical, header, instructionEq,
            List.cons_append, List.nil_append, List.head?_cons] at observed
          exact ⟨rfl, rfl, CounterMachineTag.Symbol.head.inj (Option.some.inj observed)⟩

open PureSFormal.Research.ProtectedTrieDeterministicCompiler
open DeterministicTapeThreeCounterCompiler CookSeedReadbackContext

/-- At a decoded tape boundary of an actual numerical tag run, the fixed
right-tested seed codec recovers the actual primitive state itself. -/
theorem decodeCounterWord?_compiled_reflects (machine : DeterministicTape.Machine)
    (initial : State) (fuel : Nat) (candidate : State) (row : DeterministicTape.Row)
    (found : ThreeCounterCookReadback.decodeCounterWord?
      (contextOf (DeletionTwoT2Normalizer.normalizeProgram
        (ordinaryProgram (Compiler.compileMachine machine)))).counterShape
      (RogozhinTagInput.iterate (ordinaryProgram (Compiler.compileMachine machine)) fuel
        (encodeWord (Compiler.compileMachine machine)
          (encodeState (Compiler.compileMachine machine) initial))) = some candidate)
    (tapeFound : DeterministicTapeTrajectoryDecoder.decodeTapeBoundary? candidate = some row) :
    ∃ sourceFuel, ThreeCounter.run (Compiler.compileMachine machine) sourceFuel initial = candidate := by
  let program := Compiler.compileMachine machine
  let context := contextOf (DeletionTwoT2Normalizer.normalizeProgram (ordinaryProgram program))
  have same : context.counterShape.length = program.length := contextOf_counterShape_length program
  obtain ⟨sourceFuel, exactWord⟩ := decodeCounterWord?_actual_reflects program context.counterShape
    same initial fuel candidate found
  let actual := ThreeCounter.run program sourceFuel initial
  have decoded : ThreeCounterCookReadback.decodeCounterWord? context.counterShape
      (encodeWord program (encodeState program actual)) = some candidate := by
    rw [← exactWord]
    exact found
  have typedDecoded := decoded
  unfold ThreeCounterCookReadback.decodeCounterWord? at typedDecoded
  rw [decodeSymbols_sameLength context.counterShape program same,
    ThreeCounterCookReadback.decodeSymbols_encodeWord program _
      (encodeState_wordBounded program actual)] at typedDecoded
  have shape := ThreeCounterTagOutputBoundary.decodeLive?_sound context.counterShape
    (encodeState program actual) candidate typedDecoded
  have observed : (encodeState program actual).head? = some (.head candidate.control) := by
    rw [← shape.2.2]
    exact ThreeCounterTagOutputBoundary.encodeState_live_head context.counterShape candidate shape.1 shape.2.1
  obtain ⟨running, live, controlEq⟩ := encodeState_head_fields program actual candidate.control observed
  have controlBound := CookSeedTerminalSoundness.decodeCounterWord?_control_lt
    context.counterShape _ candidate decoded
  rw [same] at controlBound
  have stateBound := CookSeedTerminalSoundness.sourceState_lt_of_decodedBoundary
    machine candidate row tapeFound controlBound
  obtain ⟨state, left, right, _, candidateEq, rowEq⟩ :=
    DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?_sound tapeFound
  have stateEq : row.state = state := congrArg (fun result : DeterministicTape.Row => result.state) rowEq
  have tested : instructionTested? (instructionAt program actual.control) = some .right := by
    rw [controlEq, candidateEq]
    change instructionTested? (instructionAt (Compiler.compileMachine machine)
      (Layout.address state (.right .start))) = some .right
    rw [Compiler.instructionAt_compileMachine (stateEq ▸ stateBound)]
    rfl
  have recovered := contextOf_decodeCounterWord? program actual running live tested
  exact ⟨sourceFuel, Option.some.inj (recovered.symm.trans decoded)⟩

end PureSFormal.Computation.ThreeCounterNumericBoundaryReflection
