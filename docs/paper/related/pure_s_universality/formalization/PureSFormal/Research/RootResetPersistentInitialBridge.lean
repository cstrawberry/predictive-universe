import PureSFormal.Research.RootResetTwentySevenStageRegistry
import PureSFormal.PureS.SchedulerInvariant

/-!
# Root-reset agreement at the first persistent-scheduler contraction

The twenty-seven-stage bare-term classifier recognizes the unreduced encoder
as the zero-clock row.  Its selected root-relative address is exactly the
address represented by the persistent scheduler immediately before the first
contraction, and contracting at that address produces exactly the persistent
scheduler's first sampled term.

This is one proved boundary case of path agreement.  It does not assert
closure of the registered grammar under every later scheduler contraction.
-/

namespace PureSFormal.Research.RootResetPersistentInitialBridge

open PureSFormal.PureS
open RootResetReachableStageGrammar
open RootResetClockFuelStages
open RootResetClockFuelCanonicalGrammar
open RootResetCompositeStageRegistry

/-- The root-derived clock view of the unreduced encoder. -/
def initialClockView
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) : ClockView :=
  ⟨.growZero, 0, 0, 0,
    environmentCode (compileActions program dispatcher.tree) bits⟩

/-- The root-derived whole clock/fuel view of the unreduced encoder. -/
def initialClockFuelView
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) : ClockFuelView program :=
  ⟨generator (compileActions program dispatcher.tree) bits, .hole, [],
    .clock (initialClockView program dispatcher bits)⟩

/-- The generator cannot be a completed marked Local. -/
theorem parseMarkedLocal?_generator_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    parseMarkedLocal? program dispatcher.tree
      (generator (compileActions program dispatcher.tree) bits) = none := by
  unfold parseMarkedLocal?
  rw [CheckpointDecoder.parseLocal?_none_of_headArity program dispatcher.tree]
  · rw [CheckpointRun.headArity_generator]
    decide
  · rw [CheckpointRun.headArity_generator]
    decide

/-- The strict clock/fuel parser reconstructs the generator as clock stage zero. -/
theorem parseClockFuel?_generator
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    parseClockFuel? program dispatcher.tree
        (generator (compileActions program dispatcher.tree) bits) =
      some (initialClockFuelView program dispatcher bits) := by
  apply parseClockFuel?_complete
  constructor
  · exact .here (parseMarkedLocal?_generator_none program dispatcher bits)
  · apply ClockFuelActiveShape.clock
    · rfl
    · constructor
      · exact ⟨rfl, rfl⟩
      · exact ⟨word bits, CheckpointDecoder.openEnvironment_word _ _ |>.symm⟩

/-- The marked-prefix traversal stops at the generator root. -/
theorem peelMarked_generator
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    peelMarked program dispatcher.tree
        (generator (compileActions program dispatcher.tree) bits) =
      ⟨generator (compileActions program dispatcher.tree) bits, .hole, []⟩ := by
  have components := markedPrefix_eq_peelMarked
    (.here (parseMarkedLocal?_generator_none program dispatcher bits))
  generalize decompositionEq : peelMarked program dispatcher.tree
    (generator (compileActions program dispatcher.tree) bits) = decomposition
      at components ⊢
  rcases decomposition with ⟨active, context, history⟩
  simp only at components ⊢
  rcases components with ⟨activeEq, contextEq, historyEq⟩
  subst active
  subst context
  subst history
  rfl

/-- The generator is not a dispatcher-node row. -/
theorem dispatcher_parse_generator_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    RootResetWholeDispatcherStages.parse? program dispatcher
        (generator (compileActions program dispatcher.tree) bits) = none := by
  rw [RootResetWholeDispatcherStages.parse?]
  rw [peelMarked_generator]
  rfl

/-- The generator is not a Push row. -/
theorem appender_parse_generator_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    RootResetWholeAppenderStages.parse? program dispatcher.tree
        (generator (compileActions program dispatcher.tree) bits) = none := by
  rw [RootResetWholeAppenderStages.parse?]
  rw [peelMarked_generator]
  rfl

/-- The generator is not a completed-response boundary. -/
theorem response_parse_generator_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    RootResetResponseBoundaryStages.parse? program dispatcher.tree
        (generator (compileActions program dispatcher.tree) bits) = none := by
  rw [RootResetResponseBoundaryStages.parse?]
  rw [peelMarked_generator]
  rfl

/-- The exact composite-parser result at the encoder. -/
def initialCompositeView
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) : RootResetCompositeStageRegistry.View program :=
  .clockFuel (initialClockFuelView program dispatcher bits)

/-- Composite priority leaves the zero-clock classification unchanged. -/
theorem parseComposite?_generator
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    RootResetCompositeStageRegistry.parse? program dispatcher
        (generator (compileActions program dispatcher.tree) bits) =
      some (initialCompositeView program dispatcher bits) := by
  rw [RootResetCompositeStageRegistry.parse?]
  rw [dispatcher_parse_generator_none, appender_parse_generator_none,
    response_parse_generator_none, parseClockFuel?_generator]
  rfl

/-- The corresponding exact result of the twenty-seven-stage parser. -/
def initialRegisteredView
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) : RootResetTwentySevenStageRegistry.View program :=
  .registered (initialCompositeView program dispatcher bits)

/-- The twenty-seven-stage bare-root parser identifies the encoder exactly. -/
theorem parseTwentySeven?_generator
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    RootResetTwentySevenStageRegistry.parse? program dispatcher
        (generator (compileActions program dispatcher.tree) bits) =
      some (initialRegisteredView program dispatcher bits) := by
  rw [RootResetTwentySevenStageRegistry.parse?, parseComposite?_generator]
  rfl

/-- The reconstructed finite tag at the encoder is `clockGrowZero`. -/
theorem initialRegisteredView_stage
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    (initialRegisteredView program dispatcher bits).stage =
      .registered .clockGrowZero := by
  rfl

/-- The root-derived selection equals the persistent scheduler's focused address. -/
theorem initial_selectedAddress_eq_schedulerSourceCursor
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    (initialRegisteredView program dispatcher bits).selectedAddress? =
      some (RootResetSelectorContract.cursorAddress
        (SchedulerInvariant.firstMutationSourceConfiguration
          program dispatcher bits).cursor) := by
  rfl

/-- The root-derived contraction produces the persistent scheduler's target term. -/
theorem initial_selectedContractum_eq_schedulerTarget
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    (generator (compileActions program dispatcher.tree) bits).contractAt?
        (RootResetSelectorContract.cursorAddress
          (SchedulerInvariant.firstMutationSourceConfiguration
            program dispatcher bits).cursor) =
      some (SchedulerInvariant.firstMutationConfiguration
        program dispatcher bits).cursor.erase := by
  rfl

/--
The bare-root stage classifier and the persistent controller agree completely
on the first sampled edge: tag, selected address, and resulting bare term.
-/
theorem firstPersistentEdge_rootResetAgreement
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    RootResetTwentySevenStageRegistry.parse? program dispatcher
        (SchedulerControl.initialConfiguration program dispatcher bits).cursor.erase =
        some (initialRegisteredView program dispatcher bits) ∧
      (initialRegisteredView program dispatcher bits).stage =
        .registered .clockGrowZero ∧
      (initialRegisteredView program dispatcher bits).selectedAddress? =
        some (RootResetSelectorContract.cursorAddress
          (SchedulerInvariant.firstMutationSourceConfiguration
            program dispatcher bits).cursor) ∧
      (SchedulerControl.initialConfiguration program dispatcher bits).cursor.erase.contractAt?
          (RootResetSelectorContract.cursorAddress
            (SchedulerInvariant.firstMutationSourceConfiguration
              program dispatcher bits).cursor) =
        some (SchedulerInvariant.firstMutationConfiguration
          program dispatcher bits).cursor.erase ∧
      FiniteController.step (SchedulerControl.machine program dispatcher)
          (SchedulerInvariant.firstMutationSourceConfiguration
            program dispatcher bits) =
        SchedulerInvariant.firstMutationConfiguration program dispatcher bits := by
  exact ⟨parseTwentySeven?_generator program dispatcher bits,
    initialRegisteredView_stage program dispatcher bits,
    initial_selectedAddress_eq_schedulerSourceCursor program dispatcher bits,
    initial_selectedContractum_eq_schedulerTarget program dispatcher bits,
    SchedulerInvariant.firstMutation_step program dispatcher bits⟩

/-! ## Agreement on the second persistent contraction -/

/-- The bare term at the first contraction sample. -/
def firstSampleTerm
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) : Term :=
  .app (clockBase 0)
    (environmentCode (compileActions program dispatcher.tree) bits)

/-- The root-derived positive-clock view at the first contraction sample. -/
def firstSampleClockView
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) : ClockView :=
  ⟨.growPositive, 1, 0, 1,
    environmentCode (compileActions program dispatcher.tree) bits⟩

/-- The whole clock/fuel view at the first contraction sample. -/
def firstSampleClockFuelView
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) : ClockFuelView program :=
  ⟨firstSampleTerm program dispatcher bits, .hole, [],
    .clock (firstSampleClockView program dispatcher bits)⟩

/-- Erasing the persistent zipper at sample one gives the literal staging term. -/
theorem firstMutation_erase_eq_firstSampleTerm
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    (SchedulerInvariant.firstMutationConfiguration
      program dispatcher bits).cursor.erase =
        firstSampleTerm program dispatcher bits := by
  rfl

/-- The staging term cannot be a completed marked Local. -/
theorem parseMarkedLocal?_firstSample_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    parseMarkedLocal? program dispatcher.tree
      (firstSampleTerm program dispatcher bits) = none := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  have localNone := CheckpointDecoder.parseLocal?_terminal_none
    program dispatcher.tree 0 environment
  change CheckpointDecoder.parseLocal? program dispatcher.tree
      (.app (clockBase 0) environment) = none at localNone
  change parseMarkedLocal? program dispatcher.tree
      (.app (clockBase 0) environment) = none
  simp only [parseMarkedLocal?, localNone]

/-- Marked-prefix traversal stops at the staging root. -/
theorem peelMarked_firstSample
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    peelMarked program dispatcher.tree
        (firstSampleTerm program dispatcher bits) =
      ⟨firstSampleTerm program dispatcher bits, .hole, []⟩ := by
  have components := markedPrefix_eq_peelMarked
    (.here (parseMarkedLocal?_firstSample_none program dispatcher bits))
  generalize decompositionEq : peelMarked program dispatcher.tree
    (firstSampleTerm program dispatcher bits) = decomposition
      at components ⊢
  rcases decomposition with ⟨active, context, history⟩
  simp only at components ⊢
  rcases components with ⟨activeEq, contextEq, historyEq⟩
  subst active
  subst context
  subst history
  rfl

/-- The strict clock/fuel parser recognizes sample one as positive growth. -/
theorem parseClockFuel?_firstSample
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    parseClockFuel? program dispatcher.tree
        (firstSampleTerm program dispatcher bits) =
      some (firstSampleClockFuelView program dispatcher bits) := by
  apply parseClockFuel?_complete
  constructor
  · exact .here (parseMarkedLocal?_firstSample_none program dispatcher bits)
  · apply ClockFuelActiveShape.clock
    · rfl
    · constructor
      · change 0 < 1 ∧ 0 + 1 = 1
        exact ⟨Nat.zero_lt_succ 0, rfl⟩
      · exact ⟨word bits, CheckpointDecoder.openEnvironment_word _ _ |>.symm⟩

/-- The staging term is not a dispatcher-node row. -/
theorem dispatcher_parse_firstSample_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    RootResetWholeDispatcherStages.parse? program dispatcher
        (firstSampleTerm program dispatcher bits) = none := by
  rw [RootResetWholeDispatcherStages.parse?, peelMarked_firstSample]
  rfl

/-- The staging term is not a Push row. -/
theorem appender_parse_firstSample_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    RootResetWholeAppenderStages.parse? program dispatcher.tree
        (firstSampleTerm program dispatcher bits) = none := by
  rw [RootResetWholeAppenderStages.parse?, peelMarked_firstSample]
  rfl

/-- The staging term is not a completed-response boundary. -/
theorem response_parse_firstSample_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    RootResetResponseBoundaryStages.parse? program dispatcher.tree
        (firstSampleTerm program dispatcher bits) = none := by
  rw [RootResetResponseBoundaryStages.parse?, peelMarked_firstSample]
  rfl

/-- The exact composite-parser result at sample one. -/
def firstSampleCompositeView
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) : RootResetCompositeStageRegistry.View program :=
  .clockFuel (firstSampleClockFuelView program dispatcher bits)

/-- Composite priority preserves the positive-clock classification. -/
theorem parseComposite?_firstSample
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    RootResetCompositeStageRegistry.parse? program dispatcher
        (firstSampleTerm program dispatcher bits) =
      some (firstSampleCompositeView program dispatcher bits) := by
  rw [RootResetCompositeStageRegistry.parse?]
  rw [dispatcher_parse_firstSample_none, appender_parse_firstSample_none,
    response_parse_firstSample_none, parseClockFuel?_firstSample]
  rfl

/-- The exact twenty-seven-stage view at sample one. -/
def firstSampleRegisteredView
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) : RootResetTwentySevenStageRegistry.View program :=
  .registered (firstSampleCompositeView program dispatcher bits)

/-- The twenty-seven-stage parser recognizes the first sampled bare term. -/
theorem parseTwentySeven?_firstSample
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    RootResetTwentySevenStageRegistry.parse? program dispatcher
        (firstSampleTerm program dispatcher bits) =
      some (firstSampleRegisteredView program dispatcher bits) := by
  rw [RootResetTwentySevenStageRegistry.parse?, parseComposite?_firstSample]
  rfl

/-- The reconstructed finite tag at sample one is positive clock growth. -/
theorem firstSampleRegisteredView_stage
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    (firstSampleRegisteredView program dispatcher bits).stage =
      .registered .clockGrowPositive := by
  rfl

/-- Its root-derived address is exactly the persistent second-mutation focus. -/
theorem firstSample_selectedAddress_eq_schedulerSourceCursor
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    (firstSampleRegisteredView program dispatcher bits).selectedAddress? =
      some (RootResetSelectorContract.cursorAddress
        (SchedulerInvariant.secondMutationSourceConfiguration
          program dispatcher bits).cursor) := by
  rfl

/-- The registered term-only selector produces the second persistent sample. -/
theorem firstSample_selectStep_eq_secondMutation
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    RootResetTwentySevenStageRegistry.selectStep? program dispatcher
        (firstSampleTerm program dispatcher bits) =
      some (SchedulerInvariant.secondMutationConfiguration
        program dispatcher bits).cursor.erase := by
  simp [RootResetTwentySevenStageRegistry.selectStep?,
    RootResetTwentySevenStageRegistry.selectAddress?,
    parseTwentySeven?_firstSample, firstSampleRegisteredView]
  rfl

/--
The bare-root classifier and registered term-only selector agree with the
persistent controller on the second sampled edge.
-/
theorem secondPersistentEdge_rootResetAgreement
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    RootResetTwentySevenStageRegistry.parse? program dispatcher
        (SchedulerInvariant.firstMutationConfiguration
          program dispatcher bits).cursor.erase =
        some (firstSampleRegisteredView program dispatcher bits) ∧
      (firstSampleRegisteredView program dispatcher bits).stage =
        .registered .clockGrowPositive ∧
      (firstSampleRegisteredView program dispatcher bits).selectedAddress? =
        some (RootResetSelectorContract.cursorAddress
          (SchedulerInvariant.secondMutationSourceConfiguration
            program dispatcher bits).cursor) ∧
      RootResetTwentySevenStageRegistry.selectStep? program dispatcher
          (SchedulerInvariant.firstMutationConfiguration
            program dispatcher bits).cursor.erase =
        some (SchedulerInvariant.secondMutationConfiguration
          program dispatcher bits).cursor.erase ∧
      FiniteController.step (SchedulerControl.machine program dispatcher)
          (SchedulerInvariant.secondMutationSourceConfiguration
            program dispatcher bits) =
        SchedulerInvariant.secondMutationConfiguration
          program dispatcher bits := by
  rw [firstMutation_erase_eq_firstSampleTerm]
  exact ⟨parseTwentySeven?_firstSample program dispatcher bits,
    firstSampleRegisteredView_stage program dispatcher bits,
    firstSample_selectedAddress_eq_schedulerSourceCursor
      program dispatcher bits,
    firstSample_selectStep_eq_secondMutation program dispatcher bits,
    SchedulerInvariant.secondMutation_step program dispatcher bits⟩

/-! ## Agreement on the third persistent contraction -/

/-- The bare term at the second contraction sample. -/
def secondSampleTerm
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) : Term :=
  .app (SchedulerInvariant.clockGrowthCore 1 1 0)
    (environmentCode (compileActions program dispatcher.tree) bits)

/-- The root-derived zero-clock view at the second contraction sample. -/
def secondSampleClockView
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) : ClockView :=
  ⟨.growZero, 1, 1, 0,
    environmentCode (compileActions program dispatcher.tree) bits⟩

/-- The whole clock/fuel view at the second contraction sample. -/
def secondSampleClockFuelView
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) : ClockFuelView program :=
  ⟨secondSampleTerm program dispatcher bits, .hole, [],
    .clock (secondSampleClockView program dispatcher bits)⟩

/-- Erasing sample two gives the literal completed-growth term. -/
theorem secondMutation_erase_eq_secondSampleTerm
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    (SchedulerInvariant.secondMutationConfiguration
      program dispatcher bits).cursor.erase =
        secondSampleTerm program dispatcher bits := by
  rfl

/-- The completed-growth term cannot be a completed marked Local. -/
theorem parseMarkedLocal?_secondSample_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    parseMarkedLocal? program dispatcher.tree
      (secondSampleTerm program dispatcher bits) = none := by
  have notFive :
      (secondSampleTerm program dispatcher bits).headArity ≠ 5 := by
    change 3 ≠ 5
    decide
  have notSix :
      (secondSampleTerm program dispatcher bits).headArity ≠ 6 := by
    change 3 ≠ 6
    decide
  have localNone := CheckpointDecoder.parseLocal?_none_of_headArity
    program dispatcher.tree (secondSampleTerm program dispatcher bits)
      notFive notSix
  simp only [parseMarkedLocal?, localNone]

/-- Marked-prefix traversal stops at the second-sample root. -/
theorem peelMarked_secondSample
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    peelMarked program dispatcher.tree
        (secondSampleTerm program dispatcher bits) =
      ⟨secondSampleTerm program dispatcher bits, .hole, []⟩ := by
  have components := markedPrefix_eq_peelMarked
    (.here (parseMarkedLocal?_secondSample_none program dispatcher bits))
  generalize decompositionEq : peelMarked program dispatcher.tree
    (secondSampleTerm program dispatcher bits) = decomposition
      at components ⊢
  rcases decomposition with ⟨active, context, history⟩
  simp only at components ⊢
  rcases components with ⟨activeEq, contextEq, historyEq⟩
  subst active
  subst context
  subst history
  rfl

/-- The strict clock/fuel parser recognizes sample two as zero growth. -/
theorem parseClockFuel?_secondSample
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    parseClockFuel? program dispatcher.tree
        (secondSampleTerm program dispatcher bits) =
      some (secondSampleClockFuelView program dispatcher bits) := by
  apply parseClockFuel?_complete
  constructor
  · exact .here (parseMarkedLocal?_secondSample_none program dispatcher bits)
  · apply ClockFuelActiveShape.clock
    · rfl
    · constructor
      · exact ⟨rfl, rfl⟩
      · exact ⟨word bits, CheckpointDecoder.openEnvironment_word _ _ |>.symm⟩

/-- The second-sample term is not a dispatcher-node row. -/
theorem dispatcher_parse_secondSample_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    RootResetWholeDispatcherStages.parse? program dispatcher
        (secondSampleTerm program dispatcher bits) = none := by
  rw [RootResetWholeDispatcherStages.parse?, peelMarked_secondSample]
  rfl

/-- The second-sample term is not a Push row. -/
theorem appender_parse_secondSample_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    RootResetWholeAppenderStages.parse? program dispatcher.tree
        (secondSampleTerm program dispatcher bits) = none := by
  rw [RootResetWholeAppenderStages.parse?, peelMarked_secondSample]
  rfl

/-- The second-sample term is not a completed-response boundary. -/
theorem response_parse_secondSample_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    RootResetResponseBoundaryStages.parse? program dispatcher.tree
        (secondSampleTerm program dispatcher bits) = none := by
  rw [RootResetResponseBoundaryStages.parse?, peelMarked_secondSample]
  rfl

/-- The exact composite-parser result at sample two. -/
def secondSampleCompositeView
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) : RootResetCompositeStageRegistry.View program :=
  .clockFuel (secondSampleClockFuelView program dispatcher bits)

/-- Composite priority preserves the zero-clock classification. -/
theorem parseComposite?_secondSample
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    RootResetCompositeStageRegistry.parse? program dispatcher
        (secondSampleTerm program dispatcher bits) =
      some (secondSampleCompositeView program dispatcher bits) := by
  rw [RootResetCompositeStageRegistry.parse?]
  rw [dispatcher_parse_secondSample_none, appender_parse_secondSample_none,
    response_parse_secondSample_none, parseClockFuel?_secondSample]
  rfl

/-- The exact twenty-seven-stage view at sample two. -/
def secondSampleRegisteredView
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) : RootResetTwentySevenStageRegistry.View program :=
  .registered (secondSampleCompositeView program dispatcher bits)

/-- The twenty-seven-stage parser recognizes the second sampled bare term. -/
theorem parseTwentySeven?_secondSample
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    RootResetTwentySevenStageRegistry.parse? program dispatcher
        (secondSampleTerm program dispatcher bits) =
      some (secondSampleRegisteredView program dispatcher bits) := by
  rw [RootResetTwentySevenStageRegistry.parse?, parseComposite?_secondSample]
  rfl

/-- The reconstructed finite tag at sample two is zero clock growth. -/
theorem secondSampleRegisteredView_stage
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    (secondSampleRegisteredView program dispatcher bits).stage =
      .registered .clockGrowZero := by
  rfl

/-- Its address is the persistent closing-zero focus. -/
theorem secondSample_selectedAddress_eq_schedulerSourceCursor
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    (secondSampleRegisteredView program dispatcher bits).selectedAddress? =
      some (RootResetSelectorContract.cursorAddress
        (SchedulerInvariant.zeroClockSourceConfiguration program dispatcher
          (SchedulerControl.Registers.initial program) 1 1
          [.left (environmentCode
            (compileActions program dispatcher.tree) bits)]).cursor) := by
  rfl

/-- The registered selector produces the persistent closing-zero sample. -/
theorem secondSample_selectStep_eq_zeroClockMutation
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    RootResetTwentySevenStageRegistry.selectStep? program dispatcher
        (secondSampleTerm program dispatcher bits) =
      some (SchedulerInvariant.zeroClockMutationConfiguration program dispatcher
        (SchedulerControl.Registers.initial program) 1 1
        [.left (environmentCode
          (compileActions program dispatcher.tree) bits)]).cursor.erase := by
  simp [RootResetTwentySevenStageRegistry.selectStep?,
    RootResetTwentySevenStageRegistry.selectAddress?,
    parseTwentySeven?_secondSample, secondSampleRegisteredView]
  rfl

/-- Sample two is the uniform positive-clock post-state used by the scheduler proof. -/
theorem secondMutationConfiguration_eq_positiveClockMutation
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    SchedulerInvariant.secondMutationConfiguration program dispatcher bits =
      SchedulerInvariant.positiveClockMutationConfiguration program dispatcher
        (SchedulerControl.Registers.initial program) 1 0 0
        [.left (environmentCode
          (compileActions program dispatcher.tree) bits)] := by
  rfl

/-- Executable mutation sampling links samples two and three exactly. -/
theorem secondMutation_seekThirdMutation
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    FiniteController.seekMutation (SchedulerControl.machine program dispatcher)
        (SchedulerInvariant.positiveClockToZeroPrefixTicks program dispatcher
          1 0 [.left (environmentCode
            (compileActions program dispatcher.tree) bits)] + 1)
        (SchedulerInvariant.secondMutationConfiguration
          program dispatcher bits) =
      some (SchedulerInvariant.zeroClockMutationConfiguration program dispatcher
        (SchedulerControl.Registers.initial program) 1 1
        [.left (environmentCode
          (compileActions program dispatcher.tree) bits)]) := by
  rw [secondMutationConfiguration_eq_positiveClockMutation]
  exact SchedulerInvariant.positiveClockMutation_seekZero
    program dispatcher (SchedulerControl.Registers.initial program) 1 0
    [.left (environmentCode (compileActions program dispatcher.tree) bits)]

/--
The bare-root parser and registered selector agree with the persistent
controller on the third sampled edge.
-/
theorem thirdPersistentEdge_rootResetAgreement
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    RootResetTwentySevenStageRegistry.parse? program dispatcher
        (SchedulerInvariant.secondMutationConfiguration
          program dispatcher bits).cursor.erase =
        some (secondSampleRegisteredView program dispatcher bits) ∧
      (secondSampleRegisteredView program dispatcher bits).stage =
        .registered .clockGrowZero ∧
      (secondSampleRegisteredView program dispatcher bits).selectedAddress? =
        some (RootResetSelectorContract.cursorAddress
          (SchedulerInvariant.zeroClockSourceConfiguration program dispatcher
            (SchedulerControl.Registers.initial program) 1 1
            [.left (environmentCode
              (compileActions program dispatcher.tree) bits)]).cursor) ∧
      RootResetTwentySevenStageRegistry.selectStep? program dispatcher
          (SchedulerInvariant.secondMutationConfiguration
            program dispatcher bits).cursor.erase =
        some (SchedulerInvariant.zeroClockMutationConfiguration program dispatcher
          (SchedulerControl.Registers.initial program) 1 1
          [.left (environmentCode
            (compileActions program dispatcher.tree) bits)]).cursor.erase ∧
      FiniteController.seekMutation (SchedulerControl.machine program dispatcher)
          (SchedulerInvariant.positiveClockToZeroPrefixTicks program dispatcher
            1 0 [.left (environmentCode
              (compileActions program dispatcher.tree) bits)] + 1)
          (SchedulerInvariant.secondMutationConfiguration
            program dispatcher bits) =
        some (SchedulerInvariant.zeroClockMutationConfiguration program dispatcher
          (SchedulerControl.Registers.initial program) 1 1
          [.left (environmentCode
            (compileActions program dispatcher.tree) bits)]) := by
  rw [secondMutation_erase_eq_secondSampleTerm]
  exact ⟨parseTwentySeven?_secondSample program dispatcher bits,
    secondSampleRegisteredView_stage program dispatcher bits,
    secondSample_selectedAddress_eq_schedulerSourceCursor
      program dispatcher bits,
    secondSample_selectStep_eq_zeroClockMutation program dispatcher bits,
    secondMutation_seekThirdMutation program dispatcher bits⟩

end PureSFormal.Research.RootResetPersistentInitialBridge
