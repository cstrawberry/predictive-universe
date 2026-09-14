import PureSFormal.WeakPathUniversality
import PureSFormal.EvaluatorBounds
import PureSFormal.PureS.CountedCheckpointDecoder
import PureSFormal.PureS.EncoderSize
import PureSFormal.Computation.FixedEndpointUniformity
import PureSFormal.Computation.DeterministicTapePureSComputability

/-!
# Challenge-facing persistent-cursor universality package

This module gathers the already proved fixed-endpoint results in one
proposition.  Its evaluator configuration contains fixed finite control, one
persistent cursor of unbounded possible depth, and the current pure-`S` term.
It makes no term-only selector or tape-row trajectory claim.  Its
computability field concerns the Boolean-word-code to generator-term-code map;
the tape-to-word compiler is outside this persistent-CTS contract's scope.
-/

namespace PureSFormal.Challenge

open PureSFormal.PureS

/-- The closed period-912 cyclic-tag program used at the fixed endpoint. -/
abbrev UniversalProgram : CTS.Program := Cook.rogozhinCookProgram

/-- The closed balanced dispatcher used at the fixed endpoint. -/
abbrev UniversalDispatcher : ActionDispatcher UniversalProgram :=
  WeakPathUniversality.canonicalDispatcher UniversalProgram

/-- The finite control type of the fixed persistent-cursor evaluator. -/
abbrev UniversalControl :=
  SchedulerControl.Control UniversalProgram UniversalDispatcher

/-- The fixed finite-controller transition table. -/
abbrev UniversalController : FiniteController.Machine UniversalControl :=
  SchedulerControl.machine UniversalProgram UniversalDispatcher

/-- The fixed total decoder of the current bare term. -/
abbrev UniversalDecoder : WeakPath.BareTermDecoder UniversalProgram :=
  PublicDecoder.decode UniversalProgram UniversalDispatcher.tree

/-- The fixed total marked-checkpoint detector on the current bare term. -/
abbrev UniversalDetector : Term -> Bool :=
  TermEvent.observesMarkedCheckpoint? UniversalProgram
    UniversalDispatcher.tree

/-- The fixed exact CTS realization used throughout the aggregate theorem. -/
abbrev UniversalRealization :=
  WeakPathUniversality.fixedCookWeakPathUniversality

/-- The fixed action term supplied to every encoded CTS input word. -/
abbrev UniversalActions : Term :=
  compileActions UniversalProgram UniversalDispatcher.tree

/--
The exact rung-5 result in one public proposition.  Every field refers to the
same closed period-912 program, controller, decoder, and detector.  Input words
or tape instances vary only where their quantifiers are displayed.
-/
structure ChallengePathUniversality : Prop where
  programPeriod : UniversalProgram.period = 912
  controllerStatesNoDuplicates : UniversalController.states.Nodup
  controllerCoverComplete : forall control : UniversalControl,
    control ∈ UniversalController.states
  controllerTextbookAgreement : forall control node incoming,
    ((FiniteController.machineEquivTextbook UniversalControl).backward
        ((FiniteController.machineEquivTextbook UniversalControl).forward
          UniversalController)).transition control node incoming =
      UniversalController.transition control node incoming
  fixedEndpointCounts :
    (SchedulerControl.registerStates UniversalProgram).length = 21888 /\
    (SchedulerControl.codeNodeStates UniversalDispatcher).length = 3647 /\
    SchedulerControl.controlTemplateCount UniversalProgram
        UniversalDispatcher = 3457625 /\
    (SchedulerControl.controlStates UniversalProgram
        UniversalDispatcher).length = 75680496000 /\
    (SchedulerControl.controlStates UniversalProgram
        UniversalDispatcher).length + 1 = 75680496001
  realizesEveryInput : forall bits,
    WeakPath.Realizes UniversalProgram
      (ControllerProjection.Projects
        (SchedulerControl.initialControl UniversalProgram UniversalDispatcher)
        UniversalController)
      UniversalController
      (UniversalRealization.encode bits)
      (CTS.initial UniversalProgram bits)
      UniversalDecoder
      (UniversalRealization.path bits)
      (UniversalRealization.checkpointTime bits)
  everySampledEdgeIsS : forall bits index,
    Step
      ((UniversalRealization.path bits).term index)
      ((UniversalRealization.path bits).term (index + 1))
  checkpointsStrictlyIncrease : forall bits,
    WeakPath.StrictlyIncreasing (UniversalRealization.checkpointTime bits)
  exactCTSDecoding : forall bits index horizon config,
    UniversalDecoder ((UniversalRealization.path bits).term index) =
        some (horizon, config) <->
      index = UniversalRealization.checkpointTime bits horizon /\
        config = CTS.iterate UniversalProgram horizon
          (CTS.initial UniversalProgram bits)
  fixedTapeHaltingEndpoint : forall source,
    Research.ProtectedTrieDeterministicCompiler.DeterministicTape.Halts source <->
      WeakPathUniversality.FixedPureSMarkedSnapshotTermEvent
        (WeakPathUniversality.fixedPureSMarkedSnapshotTapeEncoder source)
  fixedTapeEncoderShape : forall source,
    WeakPathUniversality.fixedPureSMarkedSnapshotTapeEncoder source =
      generator UniversalActions
        (Computation.DeterministicTapeCook.encodeBits source)
  ctsEncoderSize : forall bits,
    (UniversalRealization.encode bits).size <=
      encoderConstant UniversalActions + 18 * bits.length
  ctsEncoderComputable :
    Computation.PartialRecursive.Computable
      (fun number =>
        (generator UniversalActions
          (Computation.DeterministicTapeCode.bitListDecode number)).code)
  nextContractionBound : forall bits index,
    let system := EvaluatorBounds.finiteCTSSystem UniversalProgram bits
    let before := system.contractionRun index
    let stateCount :=
      (FiniteController.runtimeStates UniversalController).length
    let fuel := stateCount * before.cursor.erase.size
    exists after,
      FiniteController.seekMutation UniversalController fuel before =
          some after /\
        FiniteController.seekMutationDelay UniversalController fuel before <= fuel
  selectorTotalDecision : forall
      (before : SchedulerBound.Configuration UniversalProgram
        UniversalDispatcher),
    (exists after,
      FiniteController.seekMutation UniversalController
          (SchedulerBound.bound UniversalProgram UniversalDispatcher before)
          before = some after) \/
      (forall fuel,
        FiniteController.seekMutation UniversalController fuel before = none)
  decoderBound : forall term,
    (CountedCheckpointDecoder.countedDecode UniversalProgram
        UniversalDispatcher.tree term).value = UniversalDecoder term /\
      (CountedCheckpointDecoder.countedDecode UniversalProgram
        UniversalDispatcher.tree term).ticks <=
        CountedCheckpointDecoder.decoderCoefficient UniversalProgram
          UniversalDispatcher.tree * (term.size + 1) ^ 3
  detectorBound : forall term,
    (CountedTermEvent.countedObservesMarkedCheckpoint? UniversalProgram
        UniversalDispatcher.tree term).value = UniversalDetector term /\
      (CountedTermEvent.countedObservesMarkedCheckpoint? UniversalProgram
        UniversalDispatcher.tree term).ticks <=
        CountedTermEvent.detectorCoefficient UniversalProgram
          UniversalDispatcher.tree * (term.size + 1) ^ 3
  withoutSIsEventuallyPeriodic : forall
      (initial : FiniteController.Configuration UniversalControl),
    exists preperiod period,
      0 < period /\
      preperiod + period <=
        (FiniteController.runtimeStates UniversalController).length *
          initial.cursor.erase.size /\
      forall offset,
        FiniteController.run
            (EvaluatorBounds.withoutContraction UniversalController)
            (preperiod + offset) initial =
          FiniteController.run
            (EvaluatorBounds.withoutContraction UniversalController)
            (preperiod + period + offset) initial

private def rawCounts (program : CTS.Program) (dispatcher : ActionDispatcher program) : Prop :=
    (SchedulerControl.registerStates program).length = 21888 /\
    (SchedulerControl.codeNodeStates dispatcher).length = 3647 /\
    SchedulerControl.controlTemplateCount program
        dispatcher = 3457625 /\
    (SchedulerControl.controlStates program
        dispatcher).length = 75680496000 /\
    (SchedulerControl.controlStates program
        dispatcher).length + 1 = 75680496001

private theorem rawCounts_congr (program other : CTS.Program)
    (dispatcher : ActionDispatcher program) (target : ActionDispatcher other)
    (hp : program = other) (hd : HEq dispatcher target) :
    rawCounts program dispatcher = rawCounts other target := by
  cases hp
  cases hd
  rfl

/-- The fixed persistent-cursor evaluator satisfies the aggregate contract. -/
theorem sCombinatorIsChallengePathUniversal :
    ChallengePathUniversality where
  programPeriod :=
    Computation.FixedEndpointUniformity.fixedProgram_period
  controllerStatesNoDuplicates :=
    Computation.FixedEndpointUniformity.fixedController_states_nodup
  controllerCoverComplete :=
    Computation.FixedEndpointUniformity.fixedController_covers
  controllerTextbookAgreement :=
    Computation.FixedEndpointUniformity.fixedController_textbookAgreement
  fixedEndpointCounts := by
    have equalCounts := rawCounts_congr UniversalProgram Cook.rogozhinCookProgram
      UniversalDispatcher Computation.FixedEndpointUniformity.FixedDispatcher rfl HEq.rfl
    exact Eq.mpr equalCounts
      Computation.FixedEndpointUniformity.fixedEndpoint_rawCoverCounts
  realizesEveryInput := fun bits => UniversalRealization.realizes bits
  everySampledEdgeIsS := fun bits index =>
    (UniversalRealization.path bits).contracts index
  checkpointsStrictlyIncrease := fun bits =>
    (UniversalRealization.realizes bits).checkpointsIncrease
  exactCTSDecoding := fun bits index horizon config =>
    (UniversalRealization.realizes bits).decode_eq_some_iff
      index horizon config
  fixedTapeHaltingEndpoint :=
    WeakPathUniversality.deterministicTapeHalts_iff_fixedPureSMarkedSnapshotTermEvent
  fixedTapeEncoderShape :=
    Computation.FixedEndpointUniformity.fixedEncoder_eq_generator
  ctsEncoderSize := by
    intro bits
    change (generator UniversalActions bits).size <=
      encoderConstant UniversalActions + 18 * bits.length
    exact generator_size_le_eighteen UniversalActions bits
  ctsEncoderComputable :=
    Computation.DeterministicTapePureSComputability.FixedEndpoint.generatorCode_computable
  nextContractionBound :=
    EvaluatorBounds.selectNext_on_run_halts_within UniversalProgram
  selectorTotalDecision :=
    EvaluatorBounds.selectNext_total_decision UniversalProgram
      UniversalDispatcher
  decoderBound :=
    CountedCheckpointDecoder.publicDecoder_resource_certificate
      UniversalProgram UniversalDispatcher.tree
  detectorBound :=
    CountedTermEvent.detector_resource_certificate
      UniversalProgram UniversalDispatcher.tree
  withoutSIsEventuallyPeriodic :=
    EvaluatorBounds.withoutContraction_run_eventuallyPeriodic
      UniversalController

end PureSFormal.Challenge
