import PureSFormal.PureS.SchedulerRecurrence
import PureSFormal.PureS.SchedulerRootContinuation

/-!
# All-stage scheduler recurrence

Construction-facing composition of the exact clock/fuel, selected-response,
and terminal-continuation traces.  The first declarations pin the concrete
generator run to its first public checkpoint in both terminal-status cases.
-/

namespace PureSFormal.PureS

namespace SchedulerRecurrence

open FiniteController SchedulerControl SchedulerInvariant SchedulerCycle
  SchedulerResponseInvariant

abbrev Configuration (program : CTS.Program)
    (dispatcher : ActionDispatcher program) :=
  SchedulerInvariant.Configuration program dispatcher

/-- Sequential composition of two exact sampled-mutation chains. -/
theorem ExactMutationChain.append
    {Control : Type} {machine : FiniteController.Machine Control}
    {terminal middle before : FiniteController.Configuration Control}
    {first second : List (FiniteController.Configuration Control)}
    (left : ExactMutationChain machine middle before first)
    (right : ExactMutationChain machine terminal middle second) :
    ExactMutationChain machine terminal before (first ++ second) := by
  induction left with
  | done ticks suffix =>
      simpa using ExactMutationChain.prepend suffix right
  | next searchTicks found tail ih =>
      exact .next searchTicks found ih

/-- Append one named sampled state to an already indexed finite segment. -/
theorem IndexedResponseSampledStates.appendOne
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) {sampleIndex : Nat}
    {configurations : List
      (SchedulerResponseInvariant.Configuration program dispatcher)}
    (states : IndexedResponseSampledStates program dispatcher inputBits
      sampleIndex configurations)
    (configuration : SchedulerResponseInvariant.Configuration program
      dispatcher)
    (sampled : SampledState program dispatcher inputBits
      (sampleIndex + configurations.length + 1) configuration) :
    IndexedResponseSampledStates program dispatcher inputBits sampleIndex
      (configurations ++ [configuration]) := by
  induction states generalizing configuration with
  | nil sampleIndex =>
      exact .cons sampleIndex (by simpa using sampled) (.nil (sampleIndex + 1))
  | @cons sampleIndex head headSample tail tailStates ih =>
      exact .cons sampleIndex headSample
        (ih configuration (by
          simpa [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using sampled))

/-- Exact first-stage sample produced by the registered empty-output marker. -/
def firstNormalMarkerConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool)
    (outerContext innerContext : Context) : Configuration program dispatcher :=
  let bits := bit :: suffix
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let continuation := Dovetail.clockExit 1 0 environment
  SchedulerRootContinuation.normalMarkerMutationConfiguration program dispatcher
    (responseRegisters program bit suffix) bit bits continuation
    (deletedCarrier bit outerContext innerContext) []

/-- Exact next-stage clock source nested below the first marked terminal. -/
def firstMarkedNextStageConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool)
    (outerContext innerContext : Context) : Configuration program dispatcher :=
  let bits := bit :: suffix
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  SchedulerRootContinuation.markedNextStageSourceConfiguration program
    dispatcher (responseRegisters program bit suffix) bit bits 1 environment
    (deletedCarrier bit outerContext innerContext) []

/-- Public positive result exposed by the first-stage marked terminal. -/
def firstMarkedResult
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) :
    CheckpointDecoder.PositiveView program :=
  let registers := responseRegisters program bit suffix
  ⟨1, dispatcher.route (registers.phase, bit), (registers.phase, bit), []⟩

/-- The literal first marker sample has the registered marked-terminal shape. -/
def firstNormalMarker_terminalShape
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool)
    {outerContext fullContext innerContext targetContext : Context}
    {ascentTicks : Nat}
    (trace : FirstResponseTrace program dispatcher bit suffix 0 outerContext
      fullContext innerContext targetContext ascentTicks)
    (dataEq : (CTS.absorbingStep program
      ⟨CTS.zeroPhase program, bit :: suffix⟩).data = []) :
    CheckpointExclusion.TerminalCheckpointShape program dispatcher.tree .marked
      (firstMarkedResult program dispatcher bit suffix)
      (firstNormalMarkerConfiguration program dispatcher bit suffix
        outerContext innerContext).cursor.erase := by
  let bits := bit :: suffix
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let continuation := Dovetail.clockExit 1 0 environment
  let carrier := deletedCarrier bit outerContext innerContext
  let registers := responseRegisters program bit suffix
  let label : ActionLabel program := (registers.phase, bit)
  let accumulator := actionAccumulator program label carrier
  let terminal := CheckpointRun.terminalView 1 bits
  have inner : CheckpointDecoder.ChainShape program dispatcher.tree continuation
      (.terminal terminal) := by
    apply CheckpointDecoder.ChainShape.terminal terminal
    · exact CheckpointDecoder.parseLocal?_terminal_none program dispatcher.tree
        1 environment
    · simpa [continuation, terminal, environment, bits] using!
        (CheckpointDecoder.parseTerminal?_clockExit
          (compileActions program dispatcher.tree) (word bits) 0)
  have dispatch := SchedulerResponse.completedRoute_snapshotDispatch program
    dispatcher registers bit carrier
  have accumulatorDecode : CarrierDecoder.decode? program dispatcher.tree bits
      continuation (Dovetail.clockExit_admissible 1 0 environment) accumulator =
        some [] := by
    have decoded := CarrierActionDecode.decode_actionAccumulator program
      dispatcher.tree bits continuation
      (Dovetail.clockExit_admissible 1 0 environment) label trace.targetDecode
    have phaseEq : registers.phase = CTS.zeroPhase program :=
      responseRegisters_phase program bit suffix
    rw [ActionDecode.outputData_eq_ordinaryStep_data, phaseEq, dataEq] at decoded
    simpa [accumulator, label, carrier] using decoded
  have publicDecode : CheckpointDecoder.decodeCarrier? program dispatcher.tree
      accumulator = some [] :=
    CheckpointRun.decodeCarrier?_of_decode program dispatcher.tree bits
      continuation (Dovetail.clockExit_admissible 1 0 environment)
      accumulatorDecode
  have empty : CheckpointDecoder.CarrierDecodes program dispatcher.tree
      accumulator [] :=
    CheckpointDecoder.decodeCarrier?_sound program dispatcher.tree publicDecode
  have phase : label.1 =
      CheckpointDecoder.expectedPhase program terminal.horizon := by
    simpa [label, registers, responseRegisters_phase, terminal] using!
      (CheckpointRun.iterate_phase_eq_expectedPhase program bits 0)
  have shape := SchedulerRootContinuation.markedRootTerminalShape bits dispatch
    inner phase empty
  have erased := SchedulerRootContinuation.normalMarkerMutation_erase program
    dispatcher registers bit bits continuation carrier []
  simpa [firstMarkedResult, firstNormalMarkerConfiguration, bits, environment,
    continuation, carrier, registers, label, terminal,
    SchedulerResponse.markedCursor, Cursor.erase, Cursor.rebuild] using!
    (show CheckpointExclusion.TerminalCheckpointShape program dispatcher.tree
      .marked (firstMarkedResult program dispatcher bit suffix)
      (LocalResponse.markedCompleted bits continuation carrier
        (SchedulerResponse.completedRoute program dispatcher registers bit
          carrier)) from shape)

/-- The registered marker turns an empty first-stage successor into the exact
marked positive checkpoint at executable checkpoint time one. -/
theorem firstResponse_markedPositivePrefix
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool)
    {outerContext fullContext innerContext targetContext : Context}
    {ascentTicks : Nat}
    (trace : FirstResponseTrace program dispatcher bit suffix 0 outerContext
      fullContext innerContext targetContext ascentTicks)
    (dataEq : (CTS.absorbingStep program
      ⟨CTS.zeroPhase program, bit :: suffix⟩).data = []) :
    ∃ activeContext chain,
      CheckpointRun.PositivePrefix program dispatcher (bit :: suffix) 1
        (firstNormalMarkerConfiguration program dispatcher bit suffix
          outerContext innerContext).cursor.erase
        (ExactCheckpointRun.checkpointTime program dispatcher
          (bit :: suffix) 1)
        activeContext chain := by
  let bits := bit :: suffix
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let continuation := Dovetail.clockExit 1 0 environment
  let carrier := deletedCarrier bit outerContext innerContext
  let registers := responseRegisters program bit suffix
  let route := dispatcher.route (registers.phase, bit)
  let label : ActionLabel program := (registers.phase, bit)
  let accumulator := actionAccumulator program label carrier
  let completedRoute :=
    SchedulerResponse.completedRoute program dispatcher registers bit carrier
  let terminal := CheckpointRun.terminalView 1 bits
  let view := CheckpointDecoder.markedCompletedView program route label
    accumulator bits continuation
  let chain : CheckpointDecoder.ChainView program := ⟨1, terminal, view⟩
  let activeContext :=
    BoundedJob.markedContinuationContext bits carrier completedRoute
  have terminalShape : CheckpointDecoder.ChainShape program dispatcher.tree
      continuation (.terminal terminal) := by
    apply CheckpointDecoder.ChainShape.terminal terminal
    · exact CheckpointDecoder.parseLocal?_terminal_none program dispatcher.tree
        1 environment
    · simpa [continuation, terminal, environment, bits] using!
        (CheckpointDecoder.parseTerminal?_clockExit
          (compileActions program dispatcher.tree) (word bits) 0)
  have dispatch := SchedulerResponse.completedRoute_snapshotDispatch program
    dispatcher registers bit carrier
  have chainShape : CheckpointDecoder.ChainShape program dispatcher.tree
      (LocalResponse.markedCompleted bits continuation carrier completedRoute)
      (.completed chain) := by
    simpa [chain, view, route, label, accumulator, completedRoute] using
      (CheckpointDecoder.ChainShape.prepend_markedResponse_terminal bits dispatch
        terminalShape)
  have accumulatorDecode : CarrierDecoder.decode? program dispatcher.tree bits
      continuation (Dovetail.clockExit_admissible 1 0 environment) accumulator =
        some [] := by
    have decoded := CarrierActionDecode.decode_actionAccumulator program
      dispatcher.tree bits continuation
      (Dovetail.clockExit_admissible 1 0 environment) label trace.targetDecode
    have phaseEq : registers.phase = CTS.zeroPhase program :=
      responseRegisters_phase program bit suffix
    rw [ActionDecode.outputData_eq_ordinaryStep_data, phaseEq, dataEq] at decoded
    simpa [accumulator, label, carrier] using decoded
  have publicDecode : CheckpointDecoder.decodeCarrier? program dispatcher.tree
      accumulator = some [] :=
    CheckpointRun.decodeCarrier?_of_decode program dispatcher.tree bits
      continuation (Dovetail.clockExit_admissible 1 0 environment)
      accumulatorDecode
  have carrierShape : CheckpointDecoder.CarrierDecodes program dispatcher.tree
      accumulator [] :=
    CheckpointDecoder.decodeCarrier?_sound program dispatcher.tree publicDecode
  have responseReduction : StepsN
      (firstResponseMutations program dispatcher bit suffix)
      (nestedFrames environment continuation 1)
      (firstReturnConfiguration program dispatcher bit suffix 0 outerContext
        innerContext).cursor.erase := by
    have reduced := trace.termReduction
    have sourceEq :
        (positiveStageUpConfiguration program dispatcher bit suffix 0
          fullContext).cursor.erase = nestedFrames environment continuation 1 := by
      change Cursor.rebuild
          (ContextCursor.frames fullContext omega
            (PrimitiveFuel.pendingParents environment continuation 1 []))
          omega = nestedFrames environment continuation 1
      rw [rebuild_contextFrames, trace.sourceDescent.source_eq]
      simpa [nestedFrames] using!
        (PrimitiveFuel.rebuild_pendingParents 1 environment continuation
          (baseCarrier environment continuation) [])
    rw [sourceEq] at reduced
    exact reduced
  have bitEq : registers.bit = some bit :=
    (responseRegisters_spec program bit suffix).1
  have outputEq : SchedulerControl.outputEmpty program registers bit = true := by
    have exactOutput := outputEmpty_scannedRegisters program
      (Registers.newJob program).clearScan bit suffix rfl rfl
    have initialPhase : (Registers.newJob program).clearScan.phase =
        CTS.zeroPhase program := rfl
    rw [initialPhase, dataEq] at exactOutput
    simpa [registers, responseRegisters, scannedRegisters] using exactOutput
  have markRun := SchedulerResponse.returnMark_countedRun program dispatcher
    registers bit bits continuation carrier [] bitEq outputEq
  have markerReductionRaw := FiniteController.run_projects_stepsN
    (SchedulerControl.machine program dispatcher)
    (1 + ((SchedulerControl.jobScript program dispatcher .markNormal).length + 1))
    (SchedulerResponse.returnConfiguration program dispatcher registers bit bits
      continuation carrier [])
  rw [markRun.count_eq, markRun.run_eq] at markerReductionRaw
  have markerReduction : StepsN 1
      (firstReturnConfiguration program dispatcher bit suffix 0 outerContext
        innerContext).cursor.erase
      (firstNormalMarkerConfiguration program dispatcher bit suffix outerContext
        innerContext).cursor.erase := by
    simpa [firstReturnConfiguration, firstNormalMarkerConfiguration, bits,
      environment, continuation, carrier, registers, remainingParents,
      SchedulerResponse.markedPendingConfiguration,
      SchedulerRootContinuation.normalMarkerMutation_erase] using!
      markerReductionRaw
  have responseAndMarker := StepsN.trans responseReduction markerReduction
  have staging := Dovetail.generator_to_staging
    (compileActions program dispatcher.tree) bits
  have stageExpansion := Dovetail.stage_expand 1 environment
  have launch := Dovetail.launch_expandJob 1 0 environment
  have allSteps := StepsN.trans staging
    (StepsN.trans stageExpansion
      (StepsN.trans launch responseAndMarker))
  have countEq : 1 + ((1 + 1) +
      ((2 * 1 + 6) +
        (firstResponseMutations program dispatcher bit suffix + 1))) =
      ExactCheckpointRun.checkpointTime program dispatcher bits 1 := by
    simp [ExactCheckpointRun.checkpointTime_one,
      ExactCheckpointRun.stageCost, ExactCheckpointRun.jobsCost,
      ExactCheckpointRun.jobCost, CheckedTransition.totalCost_cons,
      CheckedTransition.markerCost, CheckedTransition.needsMark,
      firstResponseMutations, responseRegisters_phase, bits, dataEq,
      Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
  have exactSteps : StepsN
      (ExactCheckpointRun.checkpointTime program dispatcher bits 1)
      (generator (compileActions program dispatcher.tree) bits)
      (firstNormalMarkerConfiguration program dispatcher bit suffix outerContext
        innerContext).cursor.erase := by
    rw [← countEq]
    exact allSteps
  have phaseSpec : view.label.1 =
      CheckpointDecoder.expectedPhase program 1 := by
    simpa [view, label, registers, responseRegisters_phase] using!
      (CheckpointRun.iterate_phase_eq_expectedPhase program bits 0)
  have iterateEmpty :
      (CTS.iterate program 1 (CTS.initial program bits)).data = [] := by
    simpa [CTS.iterate_succ, bits] using! dataEq
  have markerSpec : CheckpointDecoder.markerCompatible view.status
      (CTS.iterate program 1 (CTS.initial program bits)).data = true := by
    rw [iterateEmpty]
    rfl
  have endpointEq :
      LocalResponse.markedCompleted bits continuation carrier completedRoute =
        (firstNormalMarkerConfiguration program dispatcher bit suffix outerContext
          innerContext).cursor.erase := by
    have erased := SchedulerRootContinuation.normalMarkerMutation_erase program
      dispatcher registers bit bits continuation carrier []
    simpa [firstNormalMarkerConfiguration, bits, environment, continuation,
      carrier, registers, completedRoute, SchedulerResponse.markedCursor,
      Cursor.erase, Cursor.rebuild] using erased.symm
  refine ⟨activeContext, chain, ?_⟩
  refine
    { run := ?_
      chainShape := ?_
      layers := rfl
      terminal := rfl
      last := ?_
      wrapsCompleted := ?_ }
  · refine ⟨exactSteps, ?_, rfl⟩
    simpa [activeContext, continuation, environment, bits] using! endpointEq
  · rw [← endpointEq]
    exact chainShape
  · exact ⟨by simpa [chain] using phaseSpec,
      by
        rw [iterateEmpty]
        simpa [chain, view] using! carrierShape,
      by simpa [chain] using markerSpec⟩
  · intro innerTerm innerChain innerShape
    have wrapped :=
      CheckpointDecoder.ChainShape.prepend_markedResponse_completed bits dispatch
        innerShape
    simpa [activeContext, chain, view, route, label, accumulator,
      completedRoute, CheckpointRun.cumulativeLayers, CheckpointRun.addLayers]
      using wrapped

/-- The concrete first stage, C4 deletion, and normal response form one exact
sampled segment whose last response contraction is checkpoint one whenever
the CTS successor is nonempty. -/
theorem initialNonemptyResponseSegment
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool)
    (nonempty : (CTS.absorbingStep program
      ⟨CTS.zeroPhase program, bit :: suffix⟩).data ≠ []) :
    ∃ outerContext fullContext innerContext targetContext : Context,
      ∃ descentTicks ascentTicks : Nat,
      ∃ configurations : List
        (SchedulerResponseInvariant.Configuration program dispatcher),
      let bits := bit :: suffix
      let environment :=
        environmentCode (compileActions program dispatcher.tree) bits
      let continuation := Dovetail.clockExit 1 0 environment
      let parents :=
        PrimitiveFuel.pendingParents environment continuation 1 []
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (firstReturnConfiguration program dispatcher bit suffix 0 outerContext
          innerContext)
        (fuelZeroFifthMutationConfiguration program dispatcher
          (Registers.newJob program) environment continuation parents)
        configurations ∧
      IndexedResponseSampledStates program dispatcher bits 11 configurations ∧
      configurations.length = firstResponseMutations program dispatcher bit
        suffix ∧
      SchedulerProductivity.ExistentialAdvance program dispatcher bits 11
        configurations.length
        (fuelZeroFifthMutationConfiguration program dispatcher
          (Registers.newJob program) environment continuation parents) := by
  let bits := bit :: suffix
  obtain ⟨outerContext, fullContext, innerContext, targetContext, descentTicks,
      ascentTicks, trace⟩ := positiveStageFirstResponseTrace program dispatcher
    bit suffix (Registers.initial program) (CTS.zeroPhase program) [] false
    (RegistersCoherent.initial program) 1 0
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let continuation := Dovetail.clockExit 1 0 environment
  let parents := PrimitiveFuel.pendingParents environment continuation 1 []
  let carrier := deletedCarrier bit outerContext innerContext
  let registers := responseRegisters program bit suffix
  let c4 := firstC4Configuration program dispatcher bit suffix 0 outerContext
    innerContext
  obtain ⟨activeContext, chain, certificate⟩ :=
    firstResponse_positivePrefix program dispatcher bit suffix trace.response
      nonempty
  have certificate' : CheckpointRun.PositivePrefix program dispatcher bits 1
      (LocalResponse.completed bits continuation carrier
        (SchedulerResponse.completedRoute program dispatcher registers bit
          carrier))
      (ExactCheckpointRun.checkpointTime program dispatcher bits 1)
      activeContext chain := by
    simpa [bits, environment, continuation, carrier, registers,
      firstReturnConfiguration, remainingParents,
      PrimitiveFuel.pendingParents, SchedulerResponse.returnConfiguration,
      SchedulerResponse.completedCursor, Cursor.erase, Cursor.rebuild] using
      certificate
  have indexEq : 12 + LocalResponse.completedCost program
        (dispatcher.route (registers.phase, bit)) (registers.phase, bit) =
      ExactCheckpointRun.checkpointTime program dispatcher bits 1 := by
    cases outputEq : (CTS.absorbingStep program
      ⟨CTS.zeroPhase program, bit :: suffix⟩).data with
    | nil => exact (nonempty outputEq).elim
    | cons outputBit outputSuffix =>
        simp [ExactCheckpointRun.checkpointTime_one,
          ExactCheckpointRun.stageCost, ExactCheckpointRun.jobsCost,
          ExactCheckpointRun.jobCost, CheckedTransition.totalCost_cons,
          CheckedTransition.markerCost, CheckedTransition.needsMark,
          registers, responseRegisters_phase, bits, outputEq]
        let cost := LocalResponse.completedCost program
          (dispatcher.route (CTS.zeroPhase program, bit))
          (CTS.zeroPhase program, bit)
        change 12 + cost = 1 + (2 + (8 + (1 + cost)))
        calc
          12 + cost = (((1 + 2) + 8) + 1) + cost := rfl
          _ = ((1 + 2) + 8) + (1 + cost) :=
            Nat.add_assoc ((1 + 2) + 8) 1 cost
          _ = (1 + 2) + (8 + (1 + cost)) :=
            Nat.add_assoc (1 + 2) 8 (1 + cost)
          _ = 1 + (2 + (8 + (1 + cost))) :=
            Nat.add_assoc 1 2 (8 + (1 + cost))
  have bitEq : registers.bit = some bit :=
    (responseRegisters_spec program bit suffix).1
  have coherent := responseRegisters_coherent program bit suffix
  obtain ⟨responseConfigurations, responseChain, responseSampled,
      responseLength, responseAdvance⟩ :=
    positiveRootResponseSegment program dispatcher bits registers bit bits
      continuation carrier 12 0 bitEq coherent
      (Dovetail.clockExit_admissible 1 0 environment)
      trace.response.targetHolds certificate' nonempty indexEq
  obtain ⟨c4Bound, c4Found⟩ := positiveStageFinal_seekFirstC4 program
    dispatcher bit suffix (Registers.initial program) (CTS.zeroPhase program)
    [] false (RegistersCoherent.initial program) 1 0 trace
  have c4Sample : SampledState program dispatcher bits 12 c4 := by
    simpa [c4] using firstC4_sampledState program dispatcher bits bit suffix 0
      trace.response
  obtain ⟨frameTicks, c4ToFrame⟩ := firstC4_toFrame_zeroRun program
    dispatcher bit suffix 0 trace.response
  have responseChain' : ExactMutationChain
      (SchedulerControl.machine program dispatcher)
      (firstReturnConfiguration program dispatcher bit suffix 0 outerContext
        innerContext)
      (firstFrameConfiguration program dispatcher bit suffix 0 outerContext
        innerContext) responseConfigurations := by
    simpa [firstReturnConfiguration, firstFrameConfiguration, registers, bits,
      environment, continuation, carrier, remainingParents,
      PrimitiveFuel.pendingParents] using responseChain
  have fromC4 := ExactMutationChain.prepend c4ToFrame responseChain'
  have completeChain : ExactMutationChain
      (SchedulerControl.machine program dispatcher)
      (firstReturnConfiguration program dispatcher bit suffix 0 outerContext
        innerContext)
      (fuelZeroFifthMutationConfiguration program dispatcher
        (Registers.newJob program) environment continuation parents)
      (c4 :: responseConfigurations) :=
    .next c4Bound (by simpa [c4, bits, environment, continuation, parents]
      using c4Found) fromC4
  have completeSampled : IndexedResponseSampledStates program dispatcher bits
      11 (c4 :: responseConfigurations) :=
    .cons 11 c4Sample responseSampled
  have completeLength : (c4 :: responseConfigurations).length =
      firstResponseMutations program dispatcher bit suffix := by
    simp only [List.length_cons, firstResponseMutations]
    rw [responseLength]
    exact Nat.add_comm _ _
  exact ⟨outerContext, fullContext, innerContext, targetContext, descentTicks,
    ascentTicks, c4 :: responseConfigurations, completeChain,
    completeSampled, completeLength,
    ExactMutationChain.toExistentialAdvance program dispatcher bits 11
      completeChain completeSampled⟩

/-- The concrete first stage with an empty successor contains the rejected
fresh pre-marker sample followed by exactly one marked checkpoint sample. -/
theorem initialEmptyResponseSegment
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool)
    (dataEq : (CTS.absorbingStep program
      ⟨CTS.zeroPhase program, bit :: suffix⟩).data = []) :
    ∃ outerContext fullContext innerContext targetContext : Context,
      ∃ descentTicks ascentTicks : Nat,
      ∃ configurations : List
        (SchedulerResponseInvariant.Configuration program dispatcher),
      let bits := bit :: suffix
      let environment :=
        environmentCode (compileActions program dispatcher.tree) bits
      let continuation := Dovetail.clockExit 1 0 environment
      let parents :=
        PrimitiveFuel.pendingParents environment continuation 1 []
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (firstMarkedNextStageConfiguration program dispatcher bit suffix
          outerContext innerContext)
        (fuelZeroFifthMutationConfiguration program dispatcher
          (Registers.newJob program) environment continuation parents)
        configurations ∧
      IndexedResponseSampledStates program dispatcher bits 11 configurations ∧
      configurations.length =
        firstResponseMutations program dispatcher bit suffix + 1 ∧
      SchedulerProductivity.ExistentialAdvance program dispatcher bits 11
        configurations.length
        (fuelZeroFifthMutationConfiguration program dispatcher
          (Registers.newJob program) environment continuation parents) ∧
      ∃ activeContext chain,
        CheckpointRun.PositivePrefix program dispatcher bits 1
          (firstNormalMarkerConfiguration program dispatcher bit suffix
            outerContext innerContext).cursor.erase
          (ExactCheckpointRun.checkpointTime program dispatcher bits 1)
          activeContext chain := by
  let bits := bit :: suffix
  obtain ⟨outerContext, fullContext, innerContext, targetContext, descentTicks,
      ascentTicks, trace⟩ := positiveStageFirstResponseTrace program dispatcher
    bit suffix (Registers.initial program) (CTS.zeroPhase program) [] false
    (RegistersCoherent.initial program) 1 0
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let continuation := Dovetail.clockExit 1 0 environment
  let parents := PrimitiveFuel.pendingParents environment continuation 1 []
  let carrier := deletedCarrier bit outerContext innerContext
  let registers := responseRegisters program bit suffix
  let c4 := firstC4Configuration program dispatcher bit suffix 0 outerContext
    innerContext
  let marker := firstNormalMarkerConfiguration program dispatcher bit suffix
    outerContext innerContext
  have preMarker := firstResponse_preMarkerShape program dispatcher bit suffix
    trace.response dataEq
  have preMarker' : CheckpointExclusion.PreMarkerEmptyShape program
      dispatcher.tree
      (LocalResponse.completed bits continuation carrier
        (SchedulerResponse.completedRoute program dispatcher registers bit
          carrier)) := by
    simpa [firstReturnConfiguration, bits, environment, continuation, carrier,
      registers, remainingParents, PrimitiveFuel.pendingParents,
      SchedulerResponse.returnConfiguration, SchedulerResponse.completedCursor,
      Cursor.erase, Cursor.rebuild] using preMarker
  have bitEq : registers.bit = some bit :=
    (responseRegisters_spec program bit suffix).1
  have coherent := responseRegisters_coherent program bit suffix
  obtain ⟨responseConfigurations, responseChain, responseSampled,
      responseLength, responseAdvance⟩ :=
    preMarkerRootResponseSegment program dispatcher bits registers bit bits
      continuation carrier 12 bitEq coherent
      (Dovetail.clockExit_admissible 1 0 environment)
      trace.response.targetHolds preMarker'
  obtain ⟨c4Bound, c4Found⟩ := positiveStageFinal_seekFirstC4 program
    dispatcher bit suffix (Registers.initial program) (CTS.zeroPhase program)
    [] false (RegistersCoherent.initial program) 1 0 trace
  have c4Sample : SampledState program dispatcher bits 12 c4 := by
    simpa [c4] using firstC4_sampledState program dispatcher bits bit suffix 0
      trace.response
  obtain ⟨frameTicks, c4ToFrame⟩ := firstC4_toFrame_zeroRun program
    dispatcher bit suffix 0 trace.response
  have responseChain' : ExactMutationChain
      (SchedulerControl.machine program dispatcher)
      (firstReturnConfiguration program dispatcher bit suffix 0 outerContext
        innerContext)
      (firstFrameConfiguration program dispatcher bit suffix 0 outerContext
        innerContext) responseConfigurations := by
    simpa [firstReturnConfiguration, firstFrameConfiguration, registers, bits,
      environment, continuation, carrier, remainingParents,
      PrimitiveFuel.pendingParents] using responseChain
  have fromC4 := ExactMutationChain.prepend c4ToFrame responseChain'
  have beforeMarker : ExactMutationChain
      (SchedulerControl.machine program dispatcher)
      (firstReturnConfiguration program dispatcher bit suffix 0 outerContext
        innerContext)
      (fuelZeroFifthMutationConfiguration program dispatcher
        (Registers.newJob program) environment continuation parents)
      (c4 :: responseConfigurations) :=
    .next c4Bound (by simpa [c4, bits, environment, continuation, parents]
      using c4Found) fromC4
  have outputEq : SchedulerControl.outputEmpty program registers bit = true := by
    have exactOutput := outputEmpty_scannedRegisters program
      (Registers.newJob program).clearScan bit suffix rfl rfl
    have initialPhase : (Registers.newJob program).clearScan.phase =
        CTS.zeroPhase program := rfl
    rw [initialPhase, dataEq] at exactOutput
    simpa [registers, responseRegisters, scannedRegisters] using exactOutput
  have pendingReject : SchedulerControl.compiledProbeAnswer program dispatcher
      (.pending .normalReturn)
      (SchedulerResponse.markedCursor program dispatcher registers bit bits
        continuation carrier []) = false := by
    rfl
  have markerChain : ExactMutationChain
      (SchedulerControl.machine program dispatcher)
      (firstMarkedNextStageConfiguration program dispatcher bit suffix
        outerContext innerContext)
      (firstReturnConfiguration program dispatcher bit suffix 0 outerContext
        innerContext) [marker] := by
    simpa [firstMarkedNextStageConfiguration, firstNormalMarkerConfiguration,
      firstReturnConfiguration, marker, registers, bits, environment,
      continuation, carrier, remainingParents, PrimitiveFuel.pendingParents]
      using
        (SchedulerRootContinuation.markedReturn_exactMutationChain program
          dispatcher registers bit bits 1 environment carrier [] bitEq outputEq
          pendingReject)
  have completeChain : ExactMutationChain
      (SchedulerControl.machine program dispatcher)
      (firstMarkedNextStageConfiguration program dispatcher bit suffix
        outerContext innerContext)
      (fuelZeroFifthMutationConfiguration program dispatcher
        (Registers.newJob program) environment continuation parents)
      ((c4 :: responseConfigurations) ++ [marker]) :=
    ExactMutationChain.append beforeMarker markerChain
  obtain ⟨activeContext, chain, certificate⟩ :=
    firstResponse_markedPositivePrefix program dispatcher bit suffix
      trace.response dataEq
  have certificate' : CheckpointRun.PositivePrefix program dispatcher bits 1
      marker.cursor.erase
      (ExactCheckpointRun.checkpointTime program dispatcher bits 1)
      activeContext chain := by
    simpa [marker] using certificate
  have terminal := firstNormalMarker_terminalShape program dispatcher bit suffix
    trace.response dataEq
  have terminal' : CheckpointExclusion.TerminalCheckpointShape program
      dispatcher.tree .marked (firstMarkedResult program dispatcher bit suffix)
      marker.cursor.erase := by
    simpa [marker] using terminal
  have markerHolds : Holds program dispatcher marker := by
    simpa [marker, firstNormalMarkerConfiguration, registers, bits, environment,
      continuation, carrier] using
      (SchedulerRootContinuation.normalMarker_holds program dispatcher registers
        bit bits continuation carrier [] coherent trace.response.targetHolds
        terminal')
  have markerIndexEq : 12 + responseConfigurations.length + 1 =
      ExactCheckpointRun.checkpointTime program dispatcher bits 1 := by
    rw [responseLength]
    simp [ExactCheckpointRun.checkpointTime_one,
      ExactCheckpointRun.stageCost, ExactCheckpointRun.jobsCost,
      ExactCheckpointRun.jobCost, CheckedTransition.totalCost_cons,
      CheckedTransition.markerCost, CheckedTransition.needsMark,
      registers, responseRegisters_phase, bits, dataEq,
      Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
    let cost := LocalResponse.completedCost program
      (dispatcher.route (CTS.zeroPhase program, bit))
      (CTS.zeroPhase program, bit)
    change 12 + cost = 1 + (1 + (2 + (8 + cost)))
    calc
      12 + cost = (((1 + 1) + 2) + 8) + cost := rfl
      _ = ((1 + 1) + 2) + (8 + cost) :=
        Nat.add_assoc ((1 + 1) + 2) 8 cost
      _ = (1 + 1) + (2 + (8 + cost)) :=
        Nat.add_assoc (1 + 1) 2 (8 + cost)
      _ = 1 + (1 + (2 + (8 + cost))) :=
        Nat.add_assoc 1 1 (2 + (8 + cost))
  have markerSample : SampledState program dispatcher bits
      (12 + responseConfigurations.length + 1) marker := by
    simpa [marker] using!
      (SchedulerRootContinuation.normalMarker_sampledState program dispatcher
        bits (12 + responseConfigurations.length + 1) 0 registers bit bits
        continuation carrier [] markerHolds certificate' markerIndexEq)
  have responseAndMarkerSampled : IndexedResponseSampledStates program dispatcher
      bits 12 (responseConfigurations ++ [marker]) :=
    IndexedResponseSampledStates.appendOne program dispatcher bits
      responseSampled marker markerSample
  have completeSampled : IndexedResponseSampledStates program dispatcher bits 11
      ((c4 :: responseConfigurations) ++ [marker]) := by
    exact .cons 11 c4Sample responseAndMarkerSampled
  have completeLength : ((c4 :: responseConfigurations) ++ [marker]).length =
      firstResponseMutations program dispatcher bit suffix + 1 := by
    simp only [List.length_append, List.length_cons, List.length_singleton]
    rw [responseLength]
    simp [firstResponseMutations, Nat.add_assoc, Nat.add_comm,
      Nat.add_left_comm]
    rfl
  exact ⟨outerContext, fullContext, innerContext, targetContext, descentTicks,
    ascentTicks, (c4 :: responseConfigurations) ++ [marker], completeChain,
    completeSampled, completeLength,
    ExactMutationChain.toExistentialAdvance program dispatcher bits 11
      completeChain completeSampled,
    activeContext, chain, certificate'⟩

end SchedulerRecurrence

end PureSFormal.PureS
