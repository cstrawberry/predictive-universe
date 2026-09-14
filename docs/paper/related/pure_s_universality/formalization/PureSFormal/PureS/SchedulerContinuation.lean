import PureSFormal.PureS.SchedulerResponse

/-!
# Exact terminal-continuation control

This module proves the disjoint arity-three/arity-four continuation table at
the executable finite-controller level.  The probes are cursor-only; the
arity-three decision performs exactly one strict root contraction and enters
`FUEL`, while the arity-four decision moves left without mutation and enters
clock growth.
-/

namespace PureSFormal.PureS

namespace SchedulerContinuation

open FiniteController SchedulerControl SchedulerInvariant

abbrev Configuration (program : CTS.Program)
    (dispatcher : ActionDispatcher program) :=
  FiniteController.Configuration (SchedulerControl.Control program dispatcher)

def checkConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (cursor : Cursor) :
    Configuration program dispatcher :=
  ⟨some (.macro (.continuationCheck registers.empty) registers), cursor⟩

def arityThreeProbeConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (cursor : Cursor) :
    Configuration program dispatcher :=
  ⟨some (startProbe (.arityThree (.continuation registers.empty)) registers),
    cursor⟩

def arityFourProbeConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (cursor : Cursor) :
    Configuration program dispatcher :=
  ⟨some (startProbe (.arityFour (.continuation registers.empty)) registers),
    cursor⟩

def arityDecisionConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (arityThree : Bool) (cursor : Cursor) :
    Configuration program dispatcher :=
  ⟨some (.macro (.arityDecision (.continuation registers.empty) arityThree)
      registers), cursor⟩

def fuelConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (cursor : Cursor) : Configuration program dispatcher :=
  ⟨some (.macro (.family .fuel) (Registers.newJob program)), cursor⟩

def clockGrowConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (cursor : Cursor) : Configuration program dispatcher :=
  ⟨some (.macro .clockGrow (Registers.newJob program)), cursor⟩

/-! ## Structural consequences of continuation arity -/

/-- Every pure-S term of head arity three is literally one strict root redex. -/
theorem eq_redex_of_headArity_three (term : Term)
    (arity : term.headArity = 3) :
    ∃ x y z, term = Term.redex x y z := by
  cases term with
  | s => simp at arity
  | app first z =>
      cases first with
      | s => simp at arity
      | app second y =>
          cases second with
          | s => simp at arity
          | app third x =>
              cases third with
              | s => exact ⟨x, y, z, rfl⟩
              | app fourth w => simp at arity

/-- A cursor focused at head arity three has a concrete strict contraction. -/
theorem exists_rdx_of_headArity_three (cursor : Cursor)
    (arity : cursor.focus.headArity = 3) :
    ∃ after, cursor.rdx? = some after := by
  obtain ⟨x, y, z, source_eq⟩ :=
    eq_redex_of_headArity_three cursor.focus arity
  rcases cursor with ⟨focus, parents⟩
  simp only at source_eq
  subst focus
  exact ⟨⟨Term.contractum x y z, parents⟩, rfl⟩

/-- Positive head arity, in particular arity four, gives a concrete left move. -/
theorem exists_left_of_headArity_four (cursor : Cursor)
    (arity : cursor.focus.headArity = 4) :
    ∃ after, cursor.left? = some after := by
  rcases cursor with ⟨focus, parents⟩
  cases focus with
  | s => simp at arity
  | app function argument =>
      exact ⟨⟨function, .left argument :: parents⟩, rfl⟩

/-- The continuation-check macro enters the arity-three probe without moving. -/
theorem enterArityThree_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (cursor : Cursor) :
    ZeroMutationRun (SchedulerControl.machine program dispatcher) 1
      (checkConfiguration program dispatcher registers cursor)
      (arityThreeProbeConfiguration program dispatcher registers cursor) := by
  refine ⟨rfl, ?_⟩
  rfl

theorem arityThree_answer_of_eq
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (cursor : Cursor)
    (arity : cursor.focus.headArity = 3) :
    SchedulerControl.compiledProbeAnswer program dispatcher
      (.arityThree (.continuation registers.empty)) cursor = true := by
  unfold SchedulerControl.compiledProbeAnswer SchedulerControl.probeSite
  exact (SchedulerDescent.matchesBool_headArityPattern_eq_true_iff 3
    cursor.focus).2 arity

theorem arityThree_answer_false_of_four
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (cursor : Cursor)
    (arity : cursor.focus.headArity = 4) :
    SchedulerControl.compiledProbeAnswer program dispatcher
      (.arityThree (.continuation registers.empty)) cursor = false := by
  unfold SchedulerControl.compiledProbeAnswer SchedulerControl.probeSite
  apply SchedulerDescent.matchesBool_headArityPattern_eq_false_of_ne
  rw [arity]
  decide

theorem arityFour_answer_of_eq
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (cursor : Cursor)
    (arity : cursor.focus.headArity = 4) :
    SchedulerControl.compiledProbeAnswer program dispatcher
      (.arityFour (.continuation registers.empty)) cursor = true := by
  unfold SchedulerControl.compiledProbeAnswer SchedulerControl.probeSite
  exact (SchedulerDescent.matchesBool_headArityPattern_eq_true_iff 4
    cursor.focus).2 arity

/-- An arity-three continuation reaches its positive decision by a
mutation-free compiled probe. -/
theorem arityThreeProbe_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (cursor : Cursor)
    (arity : cursor.focus.headArity = 3) :
    ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher
        (.arityThree (.continuation registers.empty)) cursor)
      (arityThreeProbeConfiguration program dispatcher registers cursor)
      (arityDecisionConfiguration program dispatcher registers true cursor) := by
  have answer := arityThree_answer_of_eq program dispatcher registers cursor arity
  refine ⟨?_, ?_⟩
  · have run := SchedulerExecution.run_localProbe program dispatcher
      (.arityThree (.continuation registers.empty)) registers cursor rfl
    simpa [arityThreeProbeConfiguration, arityDecisionConfiguration, answer,
      SchedulerExecution.commandResult, SchedulerControl.probeAnswer] using run
  · exact SchedulerExecution.runMutationCount_localProbe program dispatcher
      (.arityThree (.continuation registers.empty)) registers cursor rfl

/-- An arity-four continuation first rejects arity three, then accepts arity
four, with both origin-restoring probes mutation-free. -/
theorem arityFourProbes_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (cursor : Cursor)
    (arity : cursor.focus.headArity = 4) :
    ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher
          (.arityThree (.continuation registers.empty)) cursor +
        SchedulerControl.compiledProbeCost program dispatcher
          (.arityFour (.continuation registers.empty)) cursor)
      (arityThreeProbeConfiguration program dispatcher registers cursor)
      (arityDecisionConfiguration program dispatcher registers false cursor) := by
  have answerThree := arityThree_answer_false_of_four program dispatcher
    registers cursor arity
  have answerFour := arityFour_answer_of_eq program dispatcher registers cursor arity
  have first : ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher
        (.arityThree (.continuation registers.empty)) cursor)
      (arityThreeProbeConfiguration program dispatcher registers cursor)
      (arityFourProbeConfiguration program dispatcher registers cursor) := by
    refine ⟨?_, ?_⟩
    · have run := SchedulerExecution.run_localProbe program dispatcher
        (.arityThree (.continuation registers.empty)) registers cursor rfl
      simpa [arityThreeProbeConfiguration, arityFourProbeConfiguration,
        answerThree, SchedulerExecution.commandResult,
        SchedulerControl.probeAnswer] using run
    · exact SchedulerExecution.runMutationCount_localProbe program dispatcher
        (.arityThree (.continuation registers.empty)) registers cursor rfl
  have second : ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher
        (.arityFour (.continuation registers.empty)) cursor)
      (arityFourProbeConfiguration program dispatcher registers cursor)
      (arityDecisionConfiguration program dispatcher registers false cursor) := by
    refine ⟨?_, ?_⟩
    · have run := SchedulerExecution.run_localProbe program dispatcher
        (.arityFour (.continuation registers.empty)) registers cursor rfl
      simpa [arityFourProbeConfiguration, arityDecisionConfiguration,
        answerFour, SchedulerExecution.commandResult,
        SchedulerControl.probeAnswer] using run
    · exact SchedulerExecution.runMutationCount_localProbe program dispatcher
        (.arityFour (.continuation registers.empty)) registers cursor rfl
  exact first.trans second

/-- Full arity-three checking prefix through the positive decision. -/
theorem arityThreeDecision_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (cursor : Cursor)
    (arity : cursor.focus.headArity = 3) :
    ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (1 + SchedulerControl.compiledProbeCost program dispatcher
        (.arityThree (.continuation registers.empty)) cursor)
      (checkConfiguration program dispatcher registers cursor)
      (arityDecisionConfiguration program dispatcher registers true cursor) := by
  exact (enterArityThree_zeroRun program dispatcher registers cursor).trans
    (arityThreeProbe_zeroRun program dispatcher registers cursor arity)

/-- Full arity-four checking prefix through the negative-three/positive-four
decision. -/
theorem arityFourDecision_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (cursor : Cursor)
    (arity : cursor.focus.headArity = 4) :
    ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (1 +
        (SchedulerControl.compiledProbeCost program dispatcher
            (.arityThree (.continuation registers.empty)) cursor +
          SchedulerControl.compiledProbeCost program dispatcher
            (.arityFour (.continuation registers.empty)) cursor))
      (checkConfiguration program dispatcher registers cursor)
      (arityDecisionConfiguration program dispatcher registers false cursor) := by
  exact (enterArityThree_zeroRun program dispatcher registers cursor).trans
    (arityFourProbes_zeroRun program dispatcher registers cursor arity)

/-- The positive arity-three decision performs exactly one strict contraction
and enters `FUEL` with reset registers. -/
theorem arityThreeDecision_countedStep
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (cursor after : Cursor)
    (contracts : cursor.rdx? = some after) :
    CountedRun (SchedulerControl.machine program dispatcher) 1 1
      (arityDecisionConfiguration program dispatcher registers true cursor)
      (fuelConfiguration program dispatcher after) := by
  refine ⟨?_, ?_⟩
  · simp [FiniteController.run, arityDecisionConfiguration,
      fuelConfiguration, FiniteController.step, SchedulerControl.machine,
      SchedulerControl.transition, Primitive.exec, contracts]
  · simp [FiniteController.runMutationCount, arityDecisionConfiguration,
      FiniteController.mutationCount, SchedulerControl.machine,
      SchedulerControl.transition, contracts]

/-- The arity-four checkpoint decision moves left and enters clock growth
without changing the bare term. -/
theorem arityFourDecision_zeroStep
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (cursor after : Cursor)
    (moves : cursor.left? = some after) :
    ZeroMutationRun (SchedulerControl.machine program dispatcher) 1
      (arityDecisionConfiguration program dispatcher registers false cursor)
      (clockGrowConfiguration program dispatcher after) := by
  refine ⟨?_, ?_⟩
  · simp [FiniteController.run, arityDecisionConfiguration,
      clockGrowConfiguration, FiniteController.step, SchedulerControl.machine,
      SchedulerControl.transition, Primitive.exec, moves]
  · simp [FiniteController.runMutationCount, arityDecisionConfiguration,
      FiniteController.mutationCount, SchedulerControl.machine,
      SchedulerControl.transition]

/-- Complete arity-three table: zero-mutation probes followed by exactly one
strict contraction into the next fuel phase. -/
theorem arityThreeLaunch_countedRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (cursor : Cursor)
    (arity : cursor.focus.headArity = 3) :
    ∃ after,
      CountedRun (SchedulerControl.machine program dispatcher)
        ((1 + SchedulerControl.compiledProbeCost program dispatcher
            (.arityThree (.continuation registers.empty)) cursor) + 1)
        1
        (checkConfiguration program dispatcher registers cursor)
        (fuelConfiguration program dispatcher after) := by
  obtain ⟨after, contracts⟩ := exists_rdx_of_headArity_three cursor arity
  have checked := arityThreeDecision_zeroRun program dispatcher registers cursor
    arity
  have launched := arityThreeDecision_countedStep program dispatcher registers
    cursor after contracts
  exact ⟨after, checked.toCounted.trans launched⟩

/-- Complete arity-four table: the checkpoint term is preserved while the
cursor enters its left clock-growth child. -/
theorem arityFourCheckpoint_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (cursor : Cursor)
    (arity : cursor.focus.headArity = 4) :
    ∃ after,
      ZeroMutationRun (SchedulerControl.machine program dispatcher)
        ((1 +
            (SchedulerControl.compiledProbeCost program dispatcher
                (.arityThree (.continuation registers.empty)) cursor +
              SchedulerControl.compiledProbeCost program dispatcher
                (.arityFour (.continuation registers.empty)) cursor)) + 1)
        (checkConfiguration program dispatcher registers cursor)
        (clockGrowConfiguration program dispatcher after) := by
  obtain ⟨after, moves⟩ := exists_left_of_headArity_four cursor arity
  have checked := arityFourDecision_zeroRun program dispatcher registers cursor
    arity
  have moved := arityFourDecision_zeroStep program dispatcher registers cursor
    after moves
  exact ⟨after, checked.trans moved⟩

/-! ## Complete terminal RETURN branches -/

/-- A fresh non-pending Local with an arity-three continuation advances to
the next fuel phase with exactly the continuation contraction. -/
theorem freshReturnArityThree_countedRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame)
    (bit_eq : registers.bit = some bit)
    (output_eq : SchedulerControl.outputEmpty program registers bit = false)
    (pendingReject : SchedulerControl.compiledProbeAnswer program dispatcher
      (.pending .normalReturn)
      (SchedulerResponse.completedCursor program dispatcher registers bit bits
        continuation carrier parents) = false)
    (arity : continuation.headArity = 3) :
    ∃ ticks after,
      CountedRun (SchedulerControl.machine program dispatcher) ticks 1
        (SchedulerResponse.returnConfiguration program dispatcher registers bit
          bits continuation carrier parents)
        (fuelConfiguration program dispatcher after) := by
  have enter := SchedulerResponse.returnNoMark_zeroRun program dispatcher
    registers bit bits continuation carrier parents bit_eq output_eq
  have handoff := SchedulerResponse.freshTerminalContinuation_zeroRun program
    dispatcher registers bit bits continuation carrier parents pendingReject
  let cursor := SchedulerResponse.freshContinuationCursor program dispatcher
    registers bit bits continuation carrier parents
  have cursorArity : cursor.focus.headArity = 3 := by
    simpa [cursor, SchedulerResponse.freshContinuationCursor,
      SchedulerResponse.literalContinuationCursor] using arity
  obtain ⟨after, launch⟩ := arityThreeLaunch_countedRun program dispatcher
    registers.advance cursor cursorArity
  have beforeLaunch : ZeroMutationRun
      (SchedulerControl.machine program dispatcher)
      (1 +
        (SchedulerControl.compiledProbeCost program dispatcher
            (.pending .normalReturn)
            (SchedulerResponse.completedCursor program dispatcher registers bit
              bits continuation carrier parents) +
          ((SchedulerControl.jobScript program dispatcher .continuation).length + 1)))
      (SchedulerResponse.returnConfiguration program dispatcher registers bit
        bits continuation carrier parents)
      (checkConfiguration program dispatcher registers.advance cursor) := by
    simpa [cursor, checkConfiguration] using! enter.trans handoff
  exact ⟨_, after, beforeLaunch.toCounted.trans launch⟩

/-- A fresh terminal arity-four continuation emits its checkpoint and enters
clock growth without any further contraction. -/
theorem freshReturnArityFour_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame)
    (bit_eq : registers.bit = some bit)
    (output_eq : SchedulerControl.outputEmpty program registers bit = false)
    (pendingReject : SchedulerControl.compiledProbeAnswer program dispatcher
      (.pending .normalReturn)
      (SchedulerResponse.completedCursor program dispatcher registers bit bits
        continuation carrier parents) = false)
    (arity : continuation.headArity = 4) :
    ∃ ticks after,
      ZeroMutationRun (SchedulerControl.machine program dispatcher) ticks
        (SchedulerResponse.returnConfiguration program dispatcher registers bit
          bits continuation carrier parents)
        (clockGrowConfiguration program dispatcher after) := by
  have enter := SchedulerResponse.returnNoMark_zeroRun program dispatcher
    registers bit bits continuation carrier parents bit_eq output_eq
  have handoff := SchedulerResponse.freshTerminalContinuation_zeroRun program
    dispatcher registers bit bits continuation carrier parents pendingReject
  let cursor := SchedulerResponse.freshContinuationCursor program dispatcher
    registers bit bits continuation carrier parents
  have cursorArity : cursor.focus.headArity = 4 := by
    simpa [cursor, SchedulerResponse.freshContinuationCursor,
      SchedulerResponse.literalContinuationCursor] using arity
  obtain ⟨after, checkpoint⟩ := arityFourCheckpoint_zeroRun program
    dispatcher registers.advance cursor cursorArity
  exact ⟨_, after, (enter.trans handoff).trans checkpoint⟩

/-- A marked non-pending Local with an arity-three continuation performs the
marker and continuation contractions, exactly two in total. -/
theorem markedReturnArityThree_countedRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame)
    (bit_eq : registers.bit = some bit)
    (output_eq : SchedulerControl.outputEmpty program registers bit = true)
    (pendingReject : SchedulerControl.compiledProbeAnswer program dispatcher
      (.pending .normalReturn)
      (SchedulerResponse.markedCursor program dispatcher registers bit bits
        continuation carrier parents) = false)
    (arity : continuation.headArity = 3) :
    ∃ ticks after,
      CountedRun (SchedulerControl.machine program dispatcher) ticks 2
        (SchedulerResponse.returnConfiguration program dispatcher registers bit
          bits continuation carrier parents)
        (fuelConfiguration program dispatcher after) := by
  have marked := SchedulerResponse.returnMark_countedRun program dispatcher
    registers bit bits continuation carrier parents bit_eq output_eq
  have handoff := SchedulerResponse.markedTerminalContinuation_zeroRun program
    dispatcher registers bit bits continuation carrier parents pendingReject
  let cursor := SchedulerResponse.markedContinuationCursor program dispatcher
    registers bit bits continuation carrier parents
  have cursorArity : cursor.focus.headArity = 3 := by
    simpa [cursor, SchedulerResponse.markedContinuationCursor,
      SchedulerResponse.literalContinuationCursor] using arity
  obtain ⟨after, launch⟩ := arityThreeLaunch_countedRun program dispatcher
    registers.advance cursor cursorArity
  have combined := (marked.trans handoff.toCounted).trans launch
  exact ⟨_, after, by simpa using combined⟩

/-- A marked terminal arity-four continuation performs exactly the one marker
contraction before exposing its checkpoint and entering clock growth. -/
theorem markedReturnArityFour_countedRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame)
    (bit_eq : registers.bit = some bit)
    (output_eq : SchedulerControl.outputEmpty program registers bit = true)
    (pendingReject : SchedulerControl.compiledProbeAnswer program dispatcher
      (.pending .normalReturn)
      (SchedulerResponse.markedCursor program dispatcher registers bit bits
        continuation carrier parents) = false)
    (arity : continuation.headArity = 4) :
    ∃ ticks after,
      CountedRun (SchedulerControl.machine program dispatcher) ticks 1
        (SchedulerResponse.returnConfiguration program dispatcher registers bit
          bits continuation carrier parents)
        (clockGrowConfiguration program dispatcher after) := by
  have marked := SchedulerResponse.returnMark_countedRun program dispatcher
    registers bit bits continuation carrier parents bit_eq output_eq
  have handoff := SchedulerResponse.markedTerminalContinuation_zeroRun program
    dispatcher registers bit bits continuation carrier parents pendingReject
  let cursor := SchedulerResponse.markedContinuationCursor program dispatcher
    registers bit bits continuation carrier parents
  have cursorArity : cursor.focus.headArity = 4 := by
    simpa [cursor, SchedulerResponse.markedContinuationCursor,
      SchedulerResponse.literalContinuationCursor] using arity
  obtain ⟨after, checkpoint⟩ := arityFourCheckpoint_zeroRun program
    dispatcher registers.advance cursor cursorArity
  have combined := (marked.trans handoff.toCounted).trans checkpoint.toCounted
  exact ⟨_, after, by simpa using combined⟩

end SchedulerContinuation

end PureSFormal.PureS
