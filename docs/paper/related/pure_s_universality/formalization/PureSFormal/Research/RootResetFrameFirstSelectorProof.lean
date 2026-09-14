import PureSFormal.Research.RootResetPersistentResponseSelector
import PureSFormal.Research.RootResetResponseSampleParserBridge
import PureSFormal.Research.RootResetExactTraceAgreement
import PureSFormal.Research.RootResetResponseClockFuelAgreement

namespace PureSFormal.Research.RootResetFrameFirstSelectorProof

open PureSFormal.PureS
open PureSFormal.PureS.SchedulerControl
open PureSFormal.PureS.SchedulerResponseInvariant
open PureSFormal.PureS.SchedulerCycle

private abbrev first
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) : Term :=
  frameFirstRoot (compileActions program dispatcher.tree) bits
    continuation carrier

@[simp] theorem first_headArity
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    (first program dispatcher bits continuation carrier).headArity = 4 := by
  rfl

theorem first_local_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    CheckpointDecoder.parseLocal? program dispatcher.tree
      (first program dispatcher bits continuation carrier) = none := by
  apply CheckpointDecoder.parseLocal?_none_of_headArity
  · simp
  · simp

theorem first_marked_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetReachableStageGrammar.parseMarkedLocal? program dispatcher.tree
      (first program dispatcher bits continuation carrier) = none := by
  simp [RootResetReachableStageGrammar.parseMarkedLocal?,
    first_local_none]

theorem first_fresh_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetPersistentRouteA.parseFreshNonempty? program dispatcher.tree
      (first program dispatcher bits continuation carrier) = none := by
  simp [RootResetPersistentRouteA.parseFreshNonempty?, first_local_none]

theorem first_frameR0_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetReachableStageGrammar.parseFrameR0?
      (compileActions program dispatcher.tree)
      (first program dispatcher bits continuation carrier) = none := by
  simp [first, frameFirstRoot, RootResetReachableStageGrammar.parseFrameR0?,
    CheckpointDecoder.parseEnvironment?, dispatcherCode]

theorem first_pendingActive_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetPersistentRouteA.parsePendingActive? program dispatcher
      (first program dispatcher bits continuation carrier) = none := by
  simp [RootResetPersistentRouteA.parsePendingActive?, first_frameR0_none]

theorem first_next_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetPersistentRouteA.next? program dispatcher
      (first program dispatcher bits continuation carrier) = none := by
  simp [RootResetPersistentRouteA.next?, first_marked_none, first_fresh_none,
    first_pendingActive_none]

theorem first_activeContext
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetPersistentRouteA.activeContext program dispatcher
      (first program dispatcher bits continuation carrier) =
        ⟨first program dispatcher bits continuation carrier,
          .hole, [], [], []⟩ := by
  rw [RootResetPersistentRouteA.activeContext]
  rw [first_next_none]

theorem first_fuelRow_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetClockFuelStages.parseFuelRow?
      (first program dispatcher bits continuation carrier) = none := by
  cases carrier <;> cases continuation <;>
  simp [
    RootResetClockFuelStages.parseFuelRow?,
    RootResetClockFuelStages.parseFuelCall?,
    RootResetClockFuelStages.parsePositiveHalf?,
    RootResetClockFuelStages.parseZeroFirst?,
    RootResetClockFuelStages.parseCanonicalZeroRoot?,
    RootResetClockFuelStages.parseZeroThird?,
    RootResetClockFuelStages.decodeC?, RootResetStageRegistry.parseC?,
    first, frameFirstRoot, dispatcherCode, actCode, seedCode,
    haltCode, haltTag, C, b]

theorem first_rawFuel_eq
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetClockFuelStages.parseFuelActive?
        (compileActions program dispatcher.tree)
        (first program dispatcher bits continuation carrier) =
      (RootResetClockFuelStages.parseOpenBase?
          (compileActions program dispatcher.tree)
          (first program dispatcher bits continuation carrier)).map
        (fun base =>
          ({ layers := [], endpoint :=
              RootResetClockFuelStages.FuelEndpoint.carrier base } :
            RootResetClockFuelStages.FuelView)) := by
  have environmentNone : CheckpointDecoder.parseEnvironment?
      (compileActions program dispatcher.tree)
      (dispatcherCode (compileActions program dispatcher.tree) bits) = none := by
    apply RootResetClockFuelCanonicalGrammar.parseEnvironment?_none_of_headArity_ne_one
    simp [dispatcherCode]
  rw [show first program dispatcher bits continuation carrier =
      .app
        (.app (dispatcherCode (compileActions program dispatcher.tree) bits)
          carrier)
        (.app continuation carrier) by rfl]
  rw [RootResetClockFuelStages.parseFuelActive?]
  simp only [environmentNone]
  unfold RootResetClockFuelStages.parseFuelEndpoint?
  rw [show RootResetClockFuelStages.parseFuelRow?
      (.app
        (.app (dispatcherCode (compileActions program dispatcher.tree) bits)
          carrier)
        (.app continuation carrier)) = none by
    exact first_fuelRow_none program dispatcher bits continuation carrier]
  rw [Option.map_map]
  generalize RootResetClockFuelStages.parseOpenBase?
    (compileActions program dispatcher.tree)
    (.app
      (.app (dispatcherCode (compileActions program dispatcher.tree) bits)
        carrier)
      (.app continuation carrier)) = result
  cases result <;> rfl

theorem first_canonicalFuel_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetCompositeStageRegistry.parseCanonicalFuelActive?
        (compileActions program dispatcher.tree)
        (first program dispatcher bits continuation carrier) = none := by
  let actions := compileActions program dispatcher.tree
  let source := first program dispatcher bits continuation carrier
  rw [RootResetCompositeStageRegistry.parseCanonicalFuelActive?,
    first_rawFuel_eq program dispatcher bits continuation carrier]
  generalize baseEq : RootResetClockFuelStages.parseOpenBase? actions source =
    baseResult
  cases baseResult with
  | none => rfl
  | some base =>
      have sourceEq := RootResetClockFuelStages.parseOpenBase?_sound baseEq
      have outerEq :
          base.outerContinuation = dispatcherCode actions bits := by
        change source = base.term actions at sourceEq
        dsimp [source, first, frameFirstRoot] at sourceEq
        injection sourceEq with functionEq _
        injection functionEq with outerEq _
        exact outerEq.symm
      simp [RootResetCompositeStageRegistry.canonicalFuelViewFields,
        RootResetCompositeStageRegistry.canonicalFuelEndpointFields,
        RootResetClockFuelCanonicalGrammar.admissibleField,
        outerEq, dispatcherCode]

theorem first_fuel_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetPersistentFuelCarrier.parse?
      (compileActions program dispatcher.tree)
      (first program dispatcher bits continuation carrier) = none := by
  simp [RootResetPersistentFuelCarrier.parse?,
    first_canonicalFuel_none program dispatcher bits continuation carrier]

theorem first_fuelActiveContext
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher
        (first program dispatcher bits continuation carrier) =
      ⟨first program dispatcher bits continuation carrier,
        .hole, [], [], []⟩ := by
  rw [RootResetPersistentRouteAFuel.fuelActiveContext]
  rw [first_fuel_none program dispatcher bits continuation carrier]
  rw [first_next_none program dispatcher bits continuation carrier]

theorem first_peelMarked
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetReachableStageGrammar.peelMarked program dispatcher.tree
        (first program dispatcher bits continuation carrier) =
      ⟨first program dispatcher bits continuation carrier,
        .hole, []⟩ := by
  rw [RootResetReachableStageGrammar.peelMarked]
  rw [first_marked_none program dispatcher bits continuation carrier]

theorem first_dispatcherActive_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetWholeDispatcherStages.parseActive? program dispatcher []
      (first program dispatcher bits continuation carrier) = none := by
  cases parsed : RootResetWholeDispatcherStages.parseActive? program dispatcher []
      (first program dispatcher bits continuation carrier) with
  | none => rfl
  | some view =>
      have shape := RootResetWholeDispatcherStages.parseActive?_sound parsed
      rcases shape.source_eq with
        ⟨haltField, dispatcherTerm, seedAudit, continuationAudit, halt,
          routeShape, source⟩
      cases halt with
      | fresh haltAudit =>
          have arity := congrArg Term.headArity source
          simp [first, frameFirstRoot, CheckpointDecoder.openShell,
            freshHField] at arity

theorem first_dispatcher_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetWholeDispatcherStages.parse? program dispatcher
      (first program dispatcher bits continuation carrier) = none := by
  unfold RootResetWholeDispatcherStages.parse?
  rw [first_peelMarked program dispatcher bits continuation carrier]
  simp [first_dispatcherActive_none]

theorem first_appenderActive_none_early
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetWholeAppenderStages.parseActive? program dispatcher.tree
      (first program dispatcher bits continuation carrier) = none := by
  cases parsed : RootResetWholeAppenderStages.parseActive? program
      dispatcher.tree (first program dispatcher bits continuation carrier) with
  | none => rfl
  | some view =>
      have shape := RootResetWholeAppenderStages.parseActive?_sound parsed
      rcases shape.source_eq with
        ⟨haltField, dispatcherTerm, seedAudit, continuationAudit, halt,
          routeShape, source⟩
      cases halt with
      | fresh haltAudit =>
          have arity := congrArg Term.headArity source
          simp [first, frameFirstRoot, CheckpointDecoder.openShell,
            freshHField] at arity

theorem first_appender_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetWholeAppenderStages.parse? program dispatcher.tree
      (first program dispatcher bits continuation carrier) = none := by
  unfold RootResetWholeAppenderStages.parse?
  rw [first_peelMarked program dispatcher bits continuation carrier]
  simp [first_appenderActive_none_early]

theorem first_responseBoundary_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetResponseBoundaryStages.parse? program dispatcher.tree
      (first program dispatcher bits continuation carrier) = none := by
  unfold RootResetResponseBoundaryStages.parse?
  rw [first_peelMarked program dispatcher bits continuation carrier]
  simp [RootResetResponseBoundaryStages.parseCleanMarkedHistory?,
    RootResetResponseBoundaryStages.parseActive?, first_local_none]

theorem first_canonicalClock_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetClockFuelCanonicalGrammar.parseCanonicalClock?
      (compileActions program dispatcher.tree)
      (first program dispatcher bits continuation carrier) = none := by
  simp [RootResetClockFuelCanonicalGrammar.parseCanonicalClock?,
    RootResetClockFuelStages.parseClock?,
    RootResetClockFuelStages.parseClockCore?,
    RootResetClockFuelStages.parseClockExitCore?,
    RootResetClockFuelStages.decodeC?, RootResetStageRegistry.parseC?,
    first, frameFirstRoot, dispatcherCode, actCode, seedCode,
    haltCode, haltTag, C, b]

theorem first_clockFuel_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetCompositeStageRegistry.parseClockFuel? program dispatcher.tree
      (first program dispatcher bits continuation carrier) = none := by
  unfold RootResetCompositeStageRegistry.parseClockFuel?
  rw [first_peelMarked program dispatcher bits continuation carrier]
  simp [RootResetCompositeStageRegistry.parseCanonicalClockFuelActive?,
    first_canonicalClock_none program dispatcher bits continuation carrier,
    first_canonicalFuel_none program dispatcher bits continuation carrier]

theorem first_composite_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetCompositeStageRegistry.parse? program dispatcher
      (first program dispatcher bits continuation carrier) = none := by
  simp [RootResetCompositeStageRegistry.parse?,
    first_dispatcher_none program dispatcher bits continuation carrier,
    first_appender_none program dispatcher bits continuation carrier,
    first_responseBoundary_none program dispatcher bits continuation carrier,
    first_clockFuel_none program dispatcher bits continuation carrier]

theorem first_parseCore
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetTwentySevenStageRegistry.parseCore? program dispatcher.tree
        (first program dispatcher bits continuation carrier) =
      some
        { decomposition :=
            { active := first program dispatcher bits continuation carrier
              context := .hole
              history := []
              endpoint :=
                { stage := .frameR1
                  canonicalChild := carrier
                  canonicalChildAddress := some [.left, .right]
                  phase := CTS.zeroPhase program
                  frontBit := bits.head?
                  queue := some bits
                  selectedAddress := none
                  dispatcherRoute := none } }
          stage := .frameR1 } := by
  unfold RootResetTwentySevenStageRegistry.parseCore?
  unfold RootResetWholeStageClassifier.endpointDecomposition
  rw [first_peelMarked program dispatcher bits continuation carrier]
  dsimp only
  have endpointEq :
      RootResetWholeStageClassifier.classifyActive program dispatcher.tree []
          (first program dispatcher bits continuation carrier) =
        { stage := .frameR1
          canonicalChild := carrier
          canonicalChildAddress := some [.left, .right]
          phase := CTS.zeroPhase program
          frontBit := bits.head?
          queue := some bits
          selectedAddress := none
          dispatcherRoute := none } := by
    simpa [first, frameFirstRoot] using
      RootResetWholeStageClassifier.classifyActive_frameR1 program
        dispatcher.tree [] bits carrier continuation carrier
        (first_local_none program dispatcher bits continuation carrier)
  rw [endpointEq]
  rfl

theorem first_registry
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetTwentySevenStageRegistry.parse? program dispatcher
        (first program dispatcher bits continuation carrier) =
      some (.core
        { decomposition :=
            { active := first program dispatcher bits continuation carrier
              context := .hole
              history := []
              endpoint :=
                { stage := .frameR1
                  canonicalChild := carrier
                  canonicalChildAddress := some [.left, .right]
                  phase := CTS.zeroPhase program
                  frontBit := bits.head?
                  queue := some bits
                  selectedAddress := none
                  dispatcherRoute := none } }
          stage := .frameR1 }) := by
  simp [RootResetTwentySevenStageRegistry.parse?,
    first_composite_none program dispatcher bits continuation carrier,
    first_parseCore program dispatcher bits continuation carrier]

theorem first_route_selectedAddress
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    (RootResetPersistentRouteA.classify program dispatcher
      (first program dispatcher bits continuation carrier)).selectedAddress? =
      some [.left] := by
  unfold RootResetPersistentRouteA.classify
  rw [first_activeContext program dispatcher bits continuation carrier]
  dsimp only
  rw [first_registry program dispatcher bits continuation carrier]
  dsimp [RootResetPersistentRouteA.endpointCandidate?,
    RootResetTwentySevenStageRegistry.View.context,
    RootResetTwentySevenStageRegistry.CoreView.context,
    RootResetPersistentRouteA.verifiedCandidate?]
  simp [RootResetSelectorContract.contextAddress,
    first, (RootResetResponseSampleParserBridge.frameFirst_parses_and_contracts
      program dispatcher.tree bits continuation carrier).2]

theorem first_base_selected
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    (RootResetPersistentRouteAFuel.classifyHandoff program dispatcher
      (first program dispatcher bits continuation carrier)).selected? =
      some ⟨[.left],
        frameSecondRoot (compileActions program dispatcher.tree) bits
          continuation carrier⟩ := by
  unfold RootResetPersistentRouteAFuel.classifyHandoff
  rw [first_fuelActiveContext program dispatcher bits continuation carrier]
  dsimp only
  rw [first_fuel_none program dispatcher bits continuation carrier]
  change RootResetPersistentRouteAFuel.checkedSelection?
      (first program dispatcher bits continuation carrier)
      (RootResetPersistentRouteA.classify program dispatcher
        (first program dispatcher bits continuation carrier)).selectedAddress? = _
  rw [first_route_selectedAddress program dispatcher bits continuation carrier]
  simp [RootResetPersistentRouteAFuel.checkedSelection?,
    (RootResetResponseSampleParserBridge.frameFirst_parses_and_contracts
      program dispatcher.tree bits continuation carrier).2]

theorem first_responseDescentContext
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetPersistentResponseSelector.responseDescentContext program dispatcher
        (first program dispatcher bits continuation carrier) =
      ⟨first program dispatcher bits continuation carrier,
        .hole, [], [], []⟩ := by
  have pendingNone : RootResetStageRegistry.parsePending?
      (first program dispatcher bits continuation carrier) = none := by
    unfold RootResetStageRegistry.parsePending?
    apply PendingFrame.guard?_none_of_function_headArity_ne_two
    simp [first, frameFirstRoot, dispatcherCode]
  rw [RootResetPersistentResponseSelector.responseDescentContext]
  rw [first_marked_none program dispatcher bits continuation carrier]
  rw [first_fresh_none program dispatcher bits continuation carrier]
  rw [pendingNone]

theorem first_responseOuter
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetPersistentResponseSelector.responseOuter program dispatcher
        (first program dispatcher bits continuation carrier) =
      ⟨first program dispatcher bits continuation carrier,
        .hole, [], [], []⟩ := by
  unfold RootResetPersistentResponseSelector.responseOuter
  rw [first_fuelActiveContext program dispatcher bits continuation carrier]
  change RootResetPersistentResponseSelector.composeActiveContexts
      ⟨first program dispatcher bits continuation carrier,
        .hole, [], [], []⟩
      (RootResetPersistentResponseSelector.responseDescentContext
        program dispatcher
        (first program dispatcher bits continuation carrier)) = _
  rw [first_responseDescentContext program dispatcher bits continuation carrier]
  rfl

theorem first_freshResponseRoot_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetPersistentResponseSelector.freshResponseRoot? program dispatcher
      (first program dispatcher bits continuation carrier) = none := by
  unfold RootResetPersistentResponseSelector.freshResponseRoot?
  rw [first_activeContext program dispatcher bits continuation carrier]
  rfl

theorem first_parseFreshDispatcher_false
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetPersistentResponseSelector.parseFreshDispatcherCall? program
      dispatcher.tree (first program dispatcher bits continuation carrier) =
        false := by
  cases accepted :
      RootResetPersistentResponseSelector.parseFreshDispatcherCall? program
        dispatcher.tree
        (first program dispatcher bits continuation carrier) with
  | false => rfl
  | true =>
      have arity :=
        RootResetResponseClockFuelAgreement.parseFreshDispatcherCall?_headArity_six
          accepted
      rw [first_headArity program dispatcher bits continuation carrier] at arity
      contradiction

theorem first_freshDispatcherSelection_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetPersistentResponseSelector.freshDispatcherSelection? program
      dispatcher (first program dispatcher bits continuation carrier) = none := by
  unfold RootResetPersistentResponseSelector.freshDispatcherSelection?
  rw [first_responseOuter program dispatcher bits continuation carrier]
  simp [first_parseFreshDispatcher_false program dispatcher bits continuation
    carrier]

theorem first_responseAppenderSelection_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetPersistentResponseSelector.responseAppenderSelection? program
      dispatcher (first program dispatcher bits continuation carrier) = none := by
  unfold RootResetPersistentResponseSelector.responseAppenderSelection?
    RootResetPersistentResponseSelector.responseAppenderAddress?
  rw [first_freshResponseRoot_none program dispatcher bits continuation carrier]
  rfl

theorem first_responseCarrierSelection_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetPersistentResponseSelector.responseCarrierSelection? program
      dispatcher (first program dispatcher bits continuation carrier) = none := by
  unfold RootResetPersistentResponseSelector.responseCarrierSelection?
    RootResetPersistentResponseSelector.responseCarrierAddress?
  rw [first_freshResponseRoot_none program dispatcher bits continuation carrier]
  rfl

theorem first_markedHandoffSelection_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetPersistentResponseSelector.markedHandoffSelection? program
      dispatcher (first program dispatcher bits continuation carrier) = none := by
  unfold RootResetPersistentResponseSelector.markedHandoffSelection?
  rw [first_activeContext program dispatcher bits continuation carrier]
  rfl

theorem first_currentCarrierDispatcherAddress_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetPersistentResponseSelector.currentCarrierDispatcherAddress?
      program dispatcher (first program dispatcher bits continuation carrier) =
        none := by
  unfold RootResetPersistentResponseSelector.currentCarrierDispatcherAddress?
  rw [first_responseOuter program dispatcher bits continuation carrier]
  dsimp only
  split
  next haltField dispatcherTerm seedPayload seedAudit nextContinuation
      continuationAudit sourceEq =>
    cases haltEq : RootResetWholeDispatcherStages.parseFreshHalt? haltField with
    | none => rfl
    | some haltAudit =>
        have haltSource :=
          RootResetWholeDispatcherStages.parseFreshHalt?_sound haltEq
        have arity :
            (first program dispatcher bits continuation carrier).headArity = 6 := by
          rw [sourceEq, haltSource]
          rfl
        rw [first_headArity program dispatcher bits continuation carrier] at arity
        contradiction
  next => rfl

theorem first_dispatcherSelection_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetPersistentResponseSelector.dispatcherSelection? program dispatcher
      (first program dispatcher bits continuation carrier) = none := by
  unfold RootResetPersistentResponseSelector.dispatcherSelection?
  rw [first_currentCarrierDispatcherAddress_none program dispatcher bits
    continuation carrier]
  rfl

theorem first_selectedActionAddress_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetPersistentResponseSelector.selectedActionAddress? program dispatcher
      (first program dispatcher bits continuation carrier) = none := by
  unfold RootResetPersistentResponseSelector.selectedActionAddress?
  rw [first_responseOuter program dispatcher bits continuation carrier]
  dsimp only
  split
  next haltField dispatcherTerm seedPayload seedAudit nextContinuation
      continuationAudit sourceEq =>
    cases haltEq : RootResetWholeDispatcherStages.parseFreshHalt? haltField with
    | none => rfl
    | some haltAudit =>
        have haltSource :=
          RootResetWholeDispatcherStages.parseFreshHalt?_sound haltEq
        have arity :
            (first program dispatcher bits continuation carrier).headArity = 6 := by
          rw [sourceEq, haltSource]
          rfl
        rw [first_headArity program dispatcher bits continuation carrier] at arity
        contradiction
  next => rfl

theorem first_selectedActionSelection_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetPersistentResponseSelector.selectedActionSelection? program
      dispatcher (first program dispatcher bits continuation carrier) = none := by
  unfold RootResetPersistentResponseSelector.selectedActionSelection?
  rw [first_selectedActionAddress_none program dispatcher bits continuation
    carrier]
  rfl

theorem first_appenderActive_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetWholeAppenderStages.parseActive? program dispatcher.tree
      (first program dispatcher bits continuation carrier) = none := by
  cases activeEq : RootResetWholeAppenderStages.parseActive? program
      dispatcher.tree (first program dispatcher bits continuation carrier) with
  | none => rfl
  | some active =>
      have wholeSome : RootResetWholeAppenderStages.parse? program
          dispatcher.tree (first program dispatcher bits continuation carrier) =
            some ⟨first program dispatcher bits continuation carrier,
              .hole, [], active⟩ := by
        unfold RootResetWholeAppenderStages.parse?
        rw [first_peelMarked program dispatcher bits continuation carrier]
        simp [activeEq]
      rw [first_appender_none program dispatcher bits continuation carrier]
        at wholeSome
      contradiction

theorem first_appenderSelection_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetPersistentResponseSelector.appenderSelection? program dispatcher
      (first program dispatcher bits continuation carrier) = none := by
  unfold RootResetPersistentResponseSelector.appenderSelection?
  rw [first_responseOuter program dispatcher bits continuation carrier]
  simp [first_appenderActive_none program dispatcher bits continuation carrier]

theorem first_classifyActive
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetWholeStageClassifier.classifyActive program dispatcher.tree []
        (first program dispatcher bits continuation carrier) =
      { stage := .frameR1
        canonicalChild := carrier
        canonicalChildAddress := some [.left, .right]
        phase := CTS.zeroPhase program
        frontBit := bits.head?
        queue := some bits
        selectedAddress := none
        dispatcherRoute := none } := by
  simpa [first, frameFirstRoot] using
    RootResetWholeStageClassifier.classifyActive_frameR1 program
      dispatcher.tree [] bits carrier continuation carrier
      (first_local_none program dispatcher bits continuation carrier)

theorem first_wholeClassify
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetWholeStageClassifier.classify program dispatcher.tree
        (first program dispatcher bits continuation carrier) =
      { active := first program dispatcher bits continuation carrier
        context := .hole
        history := []
        endpoint :=
          { stage := .frameR1
            canonicalChild := carrier
            canonicalChildAddress := some [.left, .right]
            phase := CTS.zeroPhase program
            frontBit := bits.head?
            queue := some bits
            selectedAddress := none
            dispatcherRoute := none }
        selectedAddress := none } := by
  unfold RootResetWholeStageClassifier.classify
  rw [first_peelMarked program dispatcher bits continuation carrier]
  dsimp only
  rw [first_classifyActive program dispatcher bits continuation carrier]
  rfl

theorem first_activatedRouteSelection_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetPersistentResponseSelector.activatedRouteSelection? program
      dispatcher (first program dispatcher bits continuation carrier) = none := by
  unfold RootResetPersistentResponseSelector.activatedRouteSelection?
  unfold RootResetPersistentResponseSelector.activatedRouteAddress?
  rw [first_responseOuter program dispatcher bits continuation carrier]
  dsimp only
  rw [first_wholeClassify program dispatcher bits continuation carrier]
  rfl

theorem first_completedResponseAddress_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetPersistentResponseSelector.completedResponseAddress? program
      dispatcher (first program dispatcher bits continuation carrier) = none := by
  unfold RootResetPersistentResponseSelector.completedResponseAddress?
  rw [first_responseOuter program dispatcher bits continuation carrier]
  dsimp only
  rw [first_classifyActive program dispatcher bits continuation carrier]
  rfl

theorem first_responseBoundarySelection_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetPersistentResponseSelector.responseBoundarySelection? program
      dispatcher (first program dispatcher bits continuation carrier) = none := by
  unfold RootResetPersistentResponseSelector.responseBoundarySelection?
  unfold RootResetPersistentResponseSelector.responseBoundaryAddress?
  rw [first_completedResponseAddress_none program dispatcher bits continuation
    carrier]
  rw [first_freshResponseRoot_none program dispatcher bits continuation carrier]
  rfl

theorem first_prioritiesClear
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetResponseClockFuelAgreement.PrioritiesClear program dispatcher
      (first program dispatcher bits continuation carrier) :=
  { freshDispatcher :=
      first_freshDispatcherSelection_none program dispatcher bits continuation
        carrier
    responseAppender :=
      first_responseAppenderSelection_none program dispatcher bits continuation
        carrier
    responseCarrier :=
      first_responseCarrierSelection_none program dispatcher bits continuation
        carrier
    responseBoundary :=
      first_responseBoundarySelection_none program dispatcher bits continuation
        carrier
    markedHandoff :=
      first_markedHandoffSelection_none program dispatcher bits continuation
        carrier
    dispatcher :=
      first_dispatcherSelection_none program dispatcher bits continuation carrier
    selectedAction :=
      first_selectedActionSelection_none program dispatcher bits continuation
        carrier
    appender :=
      first_appenderSelection_none program dispatcher bits continuation carrier
    activatedRoute :=
      first_activatedRouteSelection_none program dispatcher bits continuation
        carrier }

theorem selectStep?_frameFirstRoot_structured
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetPersistentResponseSelector.selectStep? program dispatcher
        (frameFirstRoot (compileActions program dispatcher.tree) bits
          continuation carrier) =
      some (frameSecondRoot (compileActions program dispatcher.tree) bits
        continuation carrier) := by
  rw [RootResetResponseClockFuelAgreement.selectStep?_eq_persistent_of_prioritiesClear
    (first_prioritiesClear program dispatcher bits continuation carrier)]
  unfold RootResetPersistentSelector.selectStep?
    RootResetPersistentSelector.selection?
  rw [first_base_selected program dispatcher bits continuation carrier]
  rfl

end PureSFormal.Research.RootResetFrameFirstSelectorProof
