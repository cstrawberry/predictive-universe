import PureSFormal.Research.RootResetPersistentResponseSelector
import PureSFormal.Research.RootResetPersistentSelector
import PureSFormal.Research.RootResetPersistentInitialBridge
import PureSFormal.Research.RootResetPersistentClockFuelAgreement
import PureSFormal.Research.RootResetExactTraceAgreement

/-!
# Initial exact-chain agreement for the response-aware selector
-/

namespace PureSFormal.Research.RootResetResponseSelectorInitialAgreement

open PureSFormal.PureS

/-- The registered root parser chooses the scheduler's first contraction. -/
theorem twentySeven_selectStep?_initial
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    RootResetTwentySevenStageRegistry.selectStep? program dispatcher
        (generator (compileActions program dispatcher.tree) bits) =
      some (SchedulerInvariant.firstMutationConfiguration
        program dispatcher bits).cursor.erase := by
  unfold RootResetTwentySevenStageRegistry.selectStep?
    RootResetTwentySevenStageRegistry.selectAddress?
  rw [RootResetPersistentInitialBridge.parseTwentySeven?_generator]
  change
    (RootResetPersistentInitialBridge.initialRegisteredView program dispatcher
      bits).selectedAddress?.bind
        (generator (compileActions program dispatcher.tree) bits).contractAt? = _
  rw [show
      (RootResetPersistentInitialBridge.initialRegisteredView program dispatcher
        bits).selectedAddress? =
        some (RootResetSelectorContract.cursorAddress
          (SchedulerInvariant.firstMutationSourceConfiguration
            program dispatcher bits).cursor) by
      exact RootResetPersistentInitialBridge.initial_selectedAddress_eq_schedulerSourceCursor
        program dispatcher bits]
  exact RootResetPersistentInitialBridge.initial_selectedContractum_eq_schedulerTarget
    program dispatcher bits

/-! ## Generator exclusions for the layered selectors -/

/-- The arity-four generator is not a completed Local. -/
theorem parseLocal?_generator_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    CheckpointDecoder.parseLocal? program dispatcher.tree
      (generator (compileActions program dispatcher.tree) bits) = none := by
  apply CheckpointDecoder.parseLocal?_none_of_headArity
  · rw [CheckpointRun.headArity_generator]
    decide
  · rw [CheckpointRun.headArity_generator]
    decide

/-- The generator is not a fresh completed Local with a nonempty accumulator. -/
theorem parseFreshNonempty?_generator_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    RootResetPersistentRouteA.parseFreshNonempty? program dispatcher.tree
      (generator (compileActions program dispatcher.tree) bits) = none := by
  rw [RootResetPersistentRouteA.parseFreshNonempty?,
    parseLocal?_generator_none]

/-- Its left clock numeral cannot be the fixed open environment of `R₀`. -/
theorem parseFrameR0?_generator_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    RootResetReachableStageGrammar.parseFrameR0?
        (compileActions program dispatcher.tree)
        (generator (compileActions program dispatcher.tree) bits) = none := by
  simp [generator, RootResetReachableStageGrammar.parseFrameR0?,
    RootResetClockFuelCanonicalGrammar.parseEnvironment?_none_of_headArity_ne_one,
    RootResetClockFuelCanonicalGrammar.carrierC_headArity]

/-- The generator's immediate function has arity three, not the arity-two
pending-frame function shape. -/
theorem parsePending?_generator_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    RootResetStageRegistry.parsePending?
      (generator (compileActions program dispatcher.tree) bits) = none := by
  unfold RootResetStageRegistry.parsePending?
  apply PendingFrame.guard?_none_of_function_headArity_ne_two
  simp [generator, RootResetClockFuelCanonicalGrammar.carrierC_headArity]

/-- The stricter registered-child pending parser also rejects the generator. -/
theorem parsePendingActive?_generator_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    RootResetPersistentRouteA.parsePendingActive? program dispatcher
      (generator (compileActions program dispatcher.tree) bits) = none := by
  rw [RootResetPersistentRouteA.parsePendingActive?,
    parseFrameR0?_generator_none]

/-- No outer role is peeled before classifying the generator root. -/
theorem routeNext?_generator_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    RootResetPersistentRouteA.next? program dispatcher
      (generator (compileActions program dispatcher.tree) bits) = none := by
  rw [RootResetPersistentRouteA.next?,
    RootResetPersistentInitialBridge.parseMarkedLocal?_generator_none,
    parseFreshNonempty?_generator_none, parsePendingActive?_generator_none]
  rfl

/-- The generator is a canonical zero-clock endpoint. -/
theorem initialClockView_canonical
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    RootResetClockFuelCanonicalGrammar.CanonicalClock
      (compileActions program dispatcher.tree)
      (RootResetPersistentInitialBridge.initialClockView program dispatcher bits) := by
  exact ⟨⟨rfl, rfl⟩,
    ⟨word bits, (CheckpointDecoder.openEnvironment_word _ _).symm⟩⟩

/-- The specialized fifth-sample handoff parser cannot mask the zero clock. -/
theorem fuelParser_generator_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    RootResetPersistentFuelCarrier.parse?
        (compileActions program dispatcher.tree)
        (generator (compileActions program dispatcher.tree) bits) = none := by
  exact RootResetPersistentClockFuelAgreement.parseFuelHandoff?_canonicalClock_none
    rfl (initialClockView_canonical program dispatcher bits)

/-- Fuel-aware descent also stops at the generator root. -/
theorem fuelActiveContext_generator
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher
        (generator (compileActions program dispatcher.tree) bits) =
      ⟨generator (compileActions program dispatcher.tree) bits,
        .hole, [], [], []⟩ := by
  rw [RootResetPersistentRouteAFuel.fuelActiveContext,
    fuelParser_generator_none, routeNext?_generator_none]

/-- The ordinary active-context parser likewise stops at the root. -/
theorem activeContext_generator
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    RootResetPersistentRouteA.activeContext program dispatcher
        (generator (compileActions program dispatcher.tree) bits) =
      ⟨generator (compileActions program dispatcher.tree) bits,
        .hole, [], [], []⟩ := by
  rw [RootResetPersistentRouteA.activeContext, routeNext?_generator_none]

/-- The fuel-aware fallback leaves the generator selection unchanged. -/
theorem persistent_selectStep?_initial
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    RootResetPersistentSelector.selectStep? program dispatcher
        (generator (compileActions program dispatcher.tree) bits) =
      some (SchedulerInvariant.firstMutationConfiguration
        program dispatcher bits).cursor.erase := by
  let source := generator (compileActions program dispatcher.tree) bits
  let target := (SchedulerInvariant.firstMutationConfiguration
    program dispatcher bits).cursor.erase
  let address := RootResetSelectorContract.cursorAddress
    (SchedulerInvariant.firstMutationSourceConfiguration
      program dispatcher bits).cursor
  have candidate : RootResetPersistentRouteA.endpointCandidate? program
      dispatcher.tree source
        (RootResetPersistentInitialBridge.initialRegisteredView
          program dispatcher bits) = some address := by
    change
      (RootResetPersistentInitialBridge.initialRegisteredView program dispatcher
        bits).selectedAddress? = some address
    exact RootResetPersistentInitialBridge.initial_selectedAddress_eq_schedulerSourceCursor
      program dispatcher bits
  have route := RootResetPersistentClockFuelAgreement.RouteA.selects_of_root
    (source := source) (target := target)
    (routeNext?_generator_none program dispatcher bits)
    (RootResetPersistentInitialBridge.parseTwentySeven?_generator
      program dispatcher bits)
    candidate
    (RootResetPersistentInitialBridge.initial_selectedContractum_eq_schedulerTarget
      program dispatcher bits)
  exact route.to_selectStep?_of_root
    (fuelParser_generator_none program dispatcher bits)
    (routeNext?_generator_none program dispatcher bits)

/-! ## Response-layer exclusions at the generator -/

/-- Response-only descent has no Local or pending-frame edge at the generator. -/
theorem responseDescentContext_generator
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    RootResetPersistentResponseSelector.responseDescentContext program dispatcher
        (generator (compileActions program dispatcher.tree) bits) =
      ⟨generator (compileActions program dispatcher.tree) bits,
        .hole, [], [], []⟩ := by
  rw [RootResetPersistentResponseSelector.responseDescentContext,
    RootResetPersistentInitialBridge.parseMarkedLocal?_generator_none,
    parseFreshNonempty?_generator_none, parsePending?_generator_none]

/-- The composed response traversal therefore has the generator as endpoint. -/
theorem responseOuter_generator
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    RootResetPersistentResponseSelector.responseOuter program dispatcher
        (generator (compileActions program dispatcher.tree) bits) =
      ⟨generator (compileActions program dispatcher.tree) bits,
        .hole, [], [], []⟩ := by
  unfold RootResetPersistentResponseSelector.responseOuter
  rw [fuelActiveContext_generator]
  simp only [responseDescentContext_generator]
  rfl

/-- Boundary descent also has no outer edge at the generator. -/
theorem responseBoundaryOuter_generator
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    RootResetPersistentResponseSelector.responseBoundaryOuter program dispatcher
        (generator (compileActions program dispatcher.tree) bits) =
      ⟨generator (compileActions program dispatcher.tree) bits,
        .hole, [], [], []⟩ := by
  rw [RootResetPersistentResponseSelector.responseBoundaryOuter,
    RootResetPersistentInitialBridge.parseMarkedLocal?_generator_none,
    parseLocal?_generator_none, parsePending?_generator_none]

/-- No fresh completed response occurs on the generator's outer-role path. -/
theorem freshResponseRoot?_generator_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    RootResetPersistentResponseSelector.freshResponseRoot? program dispatcher
      (generator (compileActions program dispatcher.tree) bits) = none := by
  unfold RootResetPersistentResponseSelector.freshResponseRoot?
  rw [activeContext_generator]
  rfl

/-- The arity-four clock generator is not a fresh dispatcher-call shell. -/
theorem parseFreshDispatcherCall?_generator_false
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    RootResetPersistentResponseSelector.parseFreshDispatcherCall?
      program dispatcher.tree
      (generator (compileActions program dispatcher.tree) bits) = false := by
  rfl

/-- The fresh-dispatcher priority is absent at the initial generator. -/
theorem freshDispatcherSelection?_generator_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    RootResetPersistentResponseSelector.freshDispatcherSelection?
      program dispatcher
      (generator (compileActions program dispatcher.tree) bits) = none := by
  unfold RootResetPersistentResponseSelector.freshDispatcherSelection?
  rw [responseOuter_generator]
  simp only [parseFreshDispatcherCall?_generator_false]
  rfl

/-- The completed-response fallback also rejects the arity-four generator. -/
theorem completedResponseAddress?_generator_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    RootResetPersistentResponseSelector.completedResponseAddress?
      program dispatcher
        (generator (compileActions program dispatcher.tree) bits) = none := by
  unfold RootResetPersistentResponseSelector.completedResponseAddress?
  rw [responseOuter_generator]
  by_cases stageEq :
      (RootResetWholeStageClassifier.classifyActive program dispatcher.tree []
        (generator (compileActions program dispatcher.tree) bits)).stage =
          .commitReady
  · rw [if_pos stageEq, parseLocal?_generator_none]
    rfl
  · rw [if_neg stageEq]

/-- CLOSE/COMMIT cannot be proposed without a fresh response root. -/
theorem responseBoundarySelection?_generator_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    RootResetPersistentResponseSelector.responseBoundarySelection?
      program dispatcher
      (generator (compileActions program dispatcher.tree) bits) = none := by
  unfold RootResetPersistentResponseSelector.responseBoundarySelection?
    RootResetPersistentResponseSelector.responseBoundaryAddress?
  rw [completedResponseAddress?_generator_none,
    freshResponseRoot?_generator_none]
  rfl

/-- No response-internal appender can occur without a fresh response root. -/
theorem responseAppenderSelection?_generator_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    RootResetPersistentResponseSelector.responseAppenderSelection?
      program dispatcher
      (generator (compileActions program dispatcher.tree) bits) = none := by
  unfold RootResetPersistentResponseSelector.responseAppenderSelection?
    RootResetPersistentResponseSelector.responseAppenderAddress?
  rw [freshResponseRoot?_generator_none]
  rfl

/-- No response-internal carrier traversal can occur without a fresh response root. -/
theorem responseCarrierSelection?_generator_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    RootResetPersistentResponseSelector.responseCarrierSelection?
      program dispatcher
      (generator (compileActions program dispatcher.tree) bits) = none := by
  unfold RootResetPersistentResponseSelector.responseCarrierSelection?
    RootResetPersistentResponseSelector.responseCarrierAddress?
  rw [freshResponseRoot?_generator_none]
  rfl

/-- The generator has no marked Local below a pending-frame edge. -/
theorem markedHandoffSelection?_generator_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    RootResetPersistentResponseSelector.markedHandoffSelection?
      program dispatcher
        (generator (compileActions program dispatcher.tree) bits) = none := by
  unfold RootResetPersistentResponseSelector.markedHandoffSelection?
  rw [activeContext_generator]
  rfl

/-- The initial generator has no syntax-derived current-carrier dispatcher row. -/
theorem dispatcherSelection?_generator_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    RootResetPersistentResponseSelector.dispatcherSelection? program dispatcher
      (generator (compileActions program dispatcher.tree) bits) = none := by
  unfold RootResetPersistentResponseSelector.dispatcherSelection?
    RootResetPersistentResponseSelector.currentCarrierDispatcherAddress?
  rw [responseOuter_generator]
  rfl

/-- The initial generator has no completed selected-action call. -/
theorem selectedActionSelection?_generator_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    RootResetPersistentResponseSelector.selectedActionSelection?
      program dispatcher
      (generator (compileActions program dispatcher.tree) bits) = none := by
  unfold RootResetPersistentResponseSelector.selectedActionSelection?
    RootResetPersistentResponseSelector.selectedActionAddress?
  rw [responseOuter_generator]
  rfl

/-- The active endpoint is not a Push row. -/
theorem appenderSelection?_generator_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    RootResetPersistentResponseSelector.appenderSelection? program dispatcher
      (generator (compileActions program dispatcher.tree) bits) = none := by
  unfold RootResetPersistentResponseSelector.appenderSelection?
  rw [responseOuter_generator]
  have rejected := RootResetPersistentInitialBridge.appender_parse_generator_none
    program dispatcher bits
  rw [RootResetWholeAppenderStages.parse?,
    RootResetPersistentInitialBridge.peelMarked_generator] at rejected
  have rejectedActive : RootResetWholeAppenderStages.parseActive?
      program dispatcher.tree
      (generator (compileActions program dispatcher.tree) bits) = none := by
    cases parsed : RootResetWholeAppenderStages.parseActive? program dispatcher.tree
        (generator (compileActions program dispatcher.tree) bits) with
    | none => rfl
    | some view =>
        rw [parsed] at rejected
        contradiction
  simp only [rejectedActive, Option.bind_none]

/-- The role-free endpoint classifier cannot assign an activated-route tag
to an arity-four generator; every activated route has arity two. -/
theorem classifyActive_generator_ne_activatedRoute
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    (RootResetWholeStageClassifier.classifyActive program dispatcher.tree []
      (generator (compileActions program dispatcher.tree) bits)).stage ≠
        .activatedRoute := by
  intro stageEq
  obtain ⟨parsed, routeParsed, childEq, phaseEq, bitEq, dispatcherEq⟩ :=
    RootResetWholeStageClassifier.classifyActive_activatedRoute_sound
      program dispatcher.tree []
        (generator (compileActions program dispatcher.tree) bits) stageEq
  have shape := DispatchParser.parseRouteDetailed_sound routeParsed
  have arity := shape.result_headArity
  rw [CheckpointRun.headArity_generator] at arity
  contradiction

/-- The same exclusion holds after the marked-prefix wrapper used by the
whole-stage classifier. -/
theorem classify_generator_ne_activatedRoute
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    (RootResetWholeStageClassifier.classify program dispatcher.tree
      (generator (compileActions program dispatcher.tree) bits)).endpoint.stage ≠
        .activatedRoute := by
  intro stageEq
  apply classifyActive_generator_ne_activatedRoute program dispatcher bits
  unfold RootResetWholeStageClassifier.classify at stageEq
  dsimp only at stageEq
  rw [RootResetPersistentInitialBridge.peelMarked_generator] at stageEq
  exact stageEq

/-- The zero-clock generator cannot be a completed activated dispatcher route. -/
theorem activatedRouteSelection?_generator_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    RootResetPersistentResponseSelector.activatedRouteSelection?
      program dispatcher
      (generator (compileActions program dispatcher.tree) bits) = none := by
  unfold RootResetPersistentResponseSelector.activatedRouteSelection?
    RootResetPersistentResponseSelector.activatedRouteAddress?
  rw [responseOuter_generator]
  simp only [classify_generator_ne_activatedRoute, ↓reduceIte,
    Option.bind_none]

/-- The response-aware selector chooses the scheduler's first contraction. -/
theorem selectStep?_initial
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    RootResetPersistentResponseSelector.selectStep? program dispatcher
        (SchedulerControl.initialConfiguration program dispatcher bits).cursor.erase =
      some (SchedulerInvariant.firstMutationConfiguration
        program dispatcher bits).cursor.erase := by
  rw [SchedulerControl.initialConfiguration_erase]
  have fresh : RootResetPersistentResponseSelector.freshDispatcherSelection?
      program dispatcher
        (generator (compileActions program dispatcher.tree) bits) = none :=
    freshDispatcherSelection?_generator_none program dispatcher bits
  have boundary : RootResetPersistentResponseSelector.responseBoundarySelection?
      program dispatcher
        (generator (compileActions program dispatcher.tree) bits) = none :=
    responseBoundarySelection?_generator_none program dispatcher bits
  have responseAppender :
      RootResetPersistentResponseSelector.responseAppenderSelection?
        program dispatcher
          (generator (compileActions program dispatcher.tree) bits) = none :=
    responseAppenderSelection?_generator_none program dispatcher bits
  have responseCarrier :
      RootResetPersistentResponseSelector.responseCarrierSelection?
        program dispatcher
          (generator (compileActions program dispatcher.tree) bits) = none :=
    responseCarrierSelection?_generator_none program dispatcher bits
  have markedHandoff :
      RootResetPersistentResponseSelector.markedHandoffSelection?
        program dispatcher
          (generator (compileActions program dispatcher.tree) bits) = none :=
    markedHandoffSelection?_generator_none program dispatcher bits
  have dispatch : RootResetPersistentResponseSelector.dispatcherSelection?
      program dispatcher
        (generator (compileActions program dispatcher.tree) bits) = none :=
    dispatcherSelection?_generator_none program dispatcher bits
  have action : RootResetPersistentResponseSelector.selectedActionSelection?
      program dispatcher
        (generator (compileActions program dispatcher.tree) bits) = none :=
    selectedActionSelection?_generator_none program dispatcher bits
  have appender : RootResetPersistentResponseSelector.appenderSelection?
      program dispatcher
        (generator (compileActions program dispatcher.tree) bits) = none :=
    appenderSelection?_generator_none program dispatcher bits
  have activated : RootResetPersistentResponseSelector.activatedRouteSelection?
      program dispatcher
        (generator (compileActions program dispatcher.tree) bits) = none :=
    activatedRouteSelection?_generator_none program dispatcher bits
  have selectorEq :
      RootResetPersistentResponseSelector.selectStep? program dispatcher
          (generator (compileActions program dispatcher.tree) bits) =
        RootResetPersistentSelector.selectStep? program dispatcher
          (generator (compileActions program dispatcher.tree) bits) := by
    let source := generator (compileActions program dispatcher.tree) bits
    change RootResetPersistentResponseSelector.selectStep? program dispatcher
        source = RootResetPersistentSelector.selectStep? program dispatcher source
    have fresh' := fresh
    have boundary' := boundary
    have responseAppender' := responseAppender
    have responseCarrier' := responseCarrier
    have markedHandoff' := markedHandoff
    have dispatch' := dispatch
    have action' := action
    have appender' := appender
    have activated' := activated
    change RootResetPersistentResponseSelector.freshDispatcherSelection?
      program dispatcher source = none at fresh'
    change RootResetPersistentResponseSelector.responseBoundarySelection?
      program dispatcher source = none at boundary'
    change RootResetPersistentResponseSelector.responseAppenderSelection?
      program dispatcher source = none at responseAppender'
    change RootResetPersistentResponseSelector.responseCarrierSelection?
      program dispatcher source = none at responseCarrier'
    change RootResetPersistentResponseSelector.markedHandoffSelection?
      program dispatcher source = none at markedHandoff'
    change RootResetPersistentResponseSelector.dispatcherSelection?
      program dispatcher source = none at dispatch'
    change RootResetPersistentResponseSelector.selectedActionSelection?
      program dispatcher source = none at action'
    change RootResetPersistentResponseSelector.appenderSelection?
      program dispatcher source = none at appender'
    change RootResetPersistentResponseSelector.activatedRouteSelection?
      program dispatcher source = none at activated'
    unfold RootResetPersistentResponseSelector.selectStep?
      RootResetPersistentResponseSelector.classify
    dsimp only
    generalize handoffEq :
        RootResetPersistentRouteAFuel.classifyHandoff program dispatcher source =
          handoff
    cases fuelEq : handoff.fuel <;> cases selectedEq : handoff.selected? <;>
      simp [fuelEq, selectedEq,
        RootResetPersistentResponseSelector.classifyAfterFuel,
        RootResetPersistentSelector.selectStep?,
        RootResetPersistentSelector.selection?, handoffEq, fresh',
        responseAppender', responseCarrier', boundary', markedHandoff', dispatch',
        action', appender', activated']
  rw [selectorEq]
  exact persistent_selectStep?_initial program dispatcher bits

/-- The generator prelude carries its exact term-only selector certificate. -/
theorem initialPrelude_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    RootResetExactTraceAgreement.SelectorChain
      (RootResetPersistentResponseSelector.selectStep? program dispatcher)
      (SchedulerControl.initialConfiguration program dispatcher bits)
      (SchedulerRecurrence.initialPreludeConfigurations program dispatcher bits) := by
  exact .next (selectStep?_initial program dispatcher bits)
    (.done (SchedulerInvariant.firstMutationConfiguration program dispatcher bits))

/-! ## Canonical clock/launch/fuel exact-chain package -/

/--
The already proved clock, launch, and recursive-fuel equations form one
selector certificate from the canonical positive-clock source through the
fifth, Base-producing fuel sample.  This package deliberately names the
fuel-aware persistent selector: the response-aware layer requires separate
priority-exclusion proofs on these rows before the same certificate can be
lifted unchanged.
-/
theorem clockLaunchFuel_persistentSelectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (clockRegisters : SchedulerControl.Registers program)
    (fuel : Nat) :
    RootResetExactTraceAgreement.SelectorChain
      (RootResetPersistentSelector.selectStep? program dispatcher)
      (SchedulerInvariant.clockPhaseSourceConfiguration program dispatcher
        clockRegisters
        [.left (environmentCode
          (compileActions program dispatcher.tree) bits)] (fuel + 1))
      (SchedulerNestedPhase.positiveStageConfigurationsAt program dispatcher
        bits clockRegisters [] fuel) := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let continuation := Dovetail.clockExit (fuel + 1) fuel environment
  let clockList := SchedulerNestedPhase.clockConfigurationsAt program dispatcher
    bits clockRegisters [] fuel
  let clockTerminal := SchedulerInvariant.clockPhaseCompletedConfiguration
    program dispatcher clockRegisters (fuel + 1) [.left environment]
  let launch := SchedulerNestedPhase.positiveStageLaunchConfigurationAt program
    dispatcher fuel environment []
  let fuelList := SchedulerNestedPhase.fuelConfigurationsAt program dispatcher
    bits (SchedulerControl.Registers.newJob program) continuation [] (fuel + 1) 0
  have clockSelected :=
    RootResetPersistentClockFuelAgreement.clockSelectorChain program dispatcher
      bits clockRegisters fuel
  have clockExact := SchedulerNestedPhase.clockExactMutationChainAt program
    dispatcher bits clockRegisters [] fuel
  have launchRaw :=
    RootResetPersistentClockFuelAgreement.clockLaunch_selectStep? program
      dispatcher clockRegisters fuel bits
  have launchSelected :
      RootResetPersistentSelector.selectStep? program dispatcher
          clockTerminal.cursor.erase = some launch.cursor.erase := by
    simpa [clockTerminal, launch,
      SchedulerNestedPhase.positiveStageLaunchConfigurationAt,
      SchedulerInvariant.positiveStageLaunchConfiguration,
      SchedulerInvariant.clockPhaseCompleted_erase,
      RootResetPersistentClockFuelAgreement.clockLaunchTerm,
      Dovetail.clockExit, environment] using! launchRaw
  have fuelSelectedRaw :=
    RootResetPersistentClockFuelAgreement.fuelSelectorChain program dispatcher
      bits (SchedulerControl.Registers.newJob program) continuation
      (Dovetail.clockExit_admissible (fuel + 1) fuel environment)
      (fuel + 1) 0
  have fuelSelected : RootResetExactTraceAgreement.SelectorChain
      (RootResetPersistentSelector.selectStep? program dispatcher)
      launch fuelList := by
    simpa [launch, fuelList,
      SchedulerNestedPhase.positiveStageLaunchConfigurationAt,
      continuation, environment] using! fuelSelectedRaw
  have postClock : RootResetExactTraceAgreement.SelectorChain
      (RootResetPersistentSelector.selectStep? program dispatcher)
      clockTerminal (launch :: fuelList) :=
    .next launchSelected fuelSelected
  have complete := RootResetExactTraceAgreement.SelectorChain.append
    clockExact clockSelected postClock
  simpa [SchedulerNestedPhase.positiveStageConfigurationsAt, clockList,
    fuelList, launch, continuation, environment] using complete

end PureSFormal.Research.RootResetResponseSelectorInitialAgreement
