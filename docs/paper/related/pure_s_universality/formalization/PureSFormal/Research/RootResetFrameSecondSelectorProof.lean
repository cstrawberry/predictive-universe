import PureSFormal.Research.RootResetPersistentResponseSelector
import PureSFormal.Research.RootResetResponseSampleParserBridge
import PureSFormal.Research.RootResetResponseClockFuelAgreement

namespace PureSFormal.Research.RootResetFrameSecondSelectorProof

open PureSFormal.PureS
open PureSFormal.PureS.SchedulerResponseInvariant

theorem frameSecond_contract
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    (frameSecondRoot (compileActions program dispatcher.tree) bits
      continuation carrier).contractAt? [.left, .left] =
      some (freshLocal (compileActions program dispatcher.tree) bits
        continuation carrier) := by
  rfl

theorem response_select_of_base_and_clear
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {source target : Term}
    (clear : RootResetResponseClockFuelAgreement.PrioritiesClear
      program dispatcher source)
    (base : PureSFormal.Research.RootResetPersistentSelector.selectStep?
      program dispatcher source = some target) :
    RootResetPersistentResponseSelector.selectStep?
      program dispatcher source = some target := by
  rw [RootResetResponseClockFuelAgreement.selectStep?_eq_persistent_of_prioritiesClear
    clear]
  exact base

theorem parseLocal_frameSecond_none
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    CheckpointDecoder.parseLocal? program dispatcher.tree
      (frameSecondRoot (compileActions program dispatcher.tree) bits
        continuation carrier) = none := by
  have haltNone : CheckpointDecoder.checkHalt?
      (actCode (compileActions program dispatcher.tree)) = none := by
    cases dispatcher.tree <;>
      simp [CheckpointDecoder.checkHalt?, actCode, compileActions,
        compileDispatcher, actionLeaf, leafCode, nodeCode, fork,
        haltCode, haltTag, b]
  simp [CheckpointDecoder.parseLocal?, frameSecondRoot, seedCode, haltNone]

theorem dispatcherFreshHalt_actCode_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program) :
    RootResetWholeDispatcherStages.parseFreshHalt?
      (actCode (compileActions program dispatcher.tree)) = none := by
  simp [RootResetWholeDispatcherStages.parseFreshHalt?, actCode,
    haltCode, haltTag, b]

theorem appenderFreshHalt_actCode_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program) :
    RootResetWholeAppenderStages.parseFreshHalt?
      (actCode (compileActions program dispatcher.tree)) = none := by
  simp [RootResetWholeAppenderStages.parseFreshHalt?, actCode,
    haltCode, haltTag, b]

theorem parseMarked_frameSecond_none
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetReachableStageGrammar.parseMarkedLocal? program dispatcher.tree
      (frameSecondRoot (compileActions program dispatcher.tree) bits
        continuation carrier) = none := by
  simp [RootResetReachableStageGrammar.parseMarkedLocal?,
    parseLocal_frameSecond_none]

theorem parseFreshNonempty_frameSecond_none
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetPersistentRouteA.parseFreshNonempty? program dispatcher.tree
      (frameSecondRoot (compileActions program dispatcher.tree) bits
        continuation carrier) = none := by
  simp [RootResetPersistentRouteA.parseFreshNonempty?,
    parseLocal_frameSecond_none]

theorem parseFrameR0_frameSecond_none
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetReachableStageGrammar.parseFrameR0?
      (compileActions program dispatcher.tree)
      (frameSecondRoot (compileActions program dispatcher.tree) bits
        continuation carrier) = none := by
  simp [RootResetReachableStageGrammar.parseFrameR0?,
    CheckpointDecoder.parseEnvironment?, frameSecondRoot, actCode]

theorem parsePendingActive_frameSecond_none
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetPersistentRouteA.parsePendingActive? program dispatcher
      (frameSecondRoot (compileActions program dispatcher.tree) bits
        continuation carrier) = none := by
  simp [RootResetPersistentRouteA.parsePendingActive?,
    parseFrameR0_frameSecond_none]

theorem next_frameSecond_none
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetPersistentRouteA.next? program dispatcher
      (frameSecondRoot (compileActions program dispatcher.tree) bits
        continuation carrier) = none := by
  simp [RootResetPersistentRouteA.next?, parseMarked_frameSecond_none,
    parseFreshNonempty_frameSecond_none, parsePendingActive_frameSecond_none]

theorem activeContext_frameSecond
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetPersistentRouteA.activeContext program dispatcher
      (frameSecondRoot (compileActions program dispatcher.tree) bits
        continuation carrier) =
      ⟨frameSecondRoot (compileActions program dispatcher.tree) bits
          continuation carrier, .hole, [], [], []⟩ := by
  rw [RootResetPersistentRouteA.activeContext]
  rw [next_frameSecond_none]

theorem peelMarked_frameSecond
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetReachableStageGrammar.peelMarked program dispatcher.tree
      (frameSecondRoot (compileActions program dispatcher.tree) bits
        continuation carrier) =
      ⟨frameSecondRoot (compileActions program dispatcher.tree) bits
          continuation carrier, .hole, []⟩ := by
  rw [RootResetReachableStageGrammar.peelMarked]
  rw [parseMarked_frameSecond_none]

theorem dispatcherActive_frameSecond_none
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetWholeDispatcherStages.parseActive? program dispatcher []
      (frameSecondRoot (compileActions program dispatcher.tree) bits
        continuation carrier) = none := by
  unfold RootResetWholeDispatcherStages.parseActive?
  simp only [frameSecondRoot, seedCode]
  rw [dispatcherFreshHalt_actCode_none]

theorem appenderActive_frameSecond_none
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetWholeAppenderStages.parseActive? program dispatcher.tree
      (frameSecondRoot (compileActions program dispatcher.tree) bits
        continuation carrier) = none := by
  unfold RootResetWholeAppenderStages.parseActive?
  simp only [frameSecondRoot, seedCode]
  rw [appenderFreshHalt_actCode_none]

theorem wholeDispatcher_frameSecond_none
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetWholeDispatcherStages.parse? program dispatcher
      (frameSecondRoot (compileActions program dispatcher.tree) bits
        continuation carrier) = none := by
  unfold RootResetWholeDispatcherStages.parse?
  dsimp only
  rw [peelMarked_frameSecond]
  rw [dispatcherActive_frameSecond_none]

theorem wholeAppender_frameSecond_none
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetWholeAppenderStages.parse? program dispatcher.tree
      (frameSecondRoot (compileActions program dispatcher.tree) bits
        continuation carrier) = none := by
  unfold RootResetWholeAppenderStages.parse?
  dsimp only
  rw [peelMarked_frameSecond]
  rw [appenderActive_frameSecond_none]

theorem responseBoundary_frameSecond_none
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetResponseBoundaryStages.parse? program dispatcher.tree
      (frameSecondRoot (compileActions program dispatcher.tree) bits
        continuation carrier) = none := by
  unfold RootResetResponseBoundaryStages.parse?
  dsimp only
  rw [peelMarked_frameSecond]
  rw [show RootResetResponseBoundaryStages.parseCleanMarkedHistory? [] =
      some [] by rfl]
  simp [RootResetResponseBoundaryStages.parseActive?,
    parseLocal_frameSecond_none]

theorem decodeC_actCarrier_none
    (actions carrier : Term) :
    RootResetClockFuelStages.decodeC? (.app (actCode actions) carrier) = none := by
  simp [RootResetClockFuelStages.decodeC?, RootResetStageRegistry.parseC?,
    actCode, haltCode, haltTag, b, C]

theorem parseClockCore_frameSecond_none
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (carrier : Term) :
    RootResetClockFuelStages.parseClockCore?
      (.app
        (.app (actCode (compileActions program dispatcher.tree)) carrier)
        (.app (seedCode bits) carrier)) = none := by
  rw [RootResetClockFuelStages.parseClockCore?.eq_def]
  simp only [actCode]
  have decoded : RootResetClockFuelStages.decodeC?
      (.app (.app (.app .s haltCode)
        (compileActions program dispatcher.tree)) carrier) = none := by
    simpa only [actCode] using decodeC_actCarrier_none
      (compileActions program dispatcher.tree) carrier
  rw [decoded]

theorem parseClockExitCore_frameSecond_none
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (carrier : Term) :
    RootResetClockFuelStages.parseClockExitCore?
      (.app
        (.app (actCode (compileActions program dispatcher.tree)) carrier)
        (.app (seedCode bits) carrier)) = none := by
  rw [RootResetClockFuelStages.parseClockExitCore?.eq_def]
  simp only [actCode]
  have decoded : RootResetClockFuelStages.decodeC?
      (.app (.app (.app .s haltCode)
        (compileActions program dispatcher.tree)) carrier) = none := by
    simpa only [actCode] using decodeC_actCarrier_none
      (compileActions program dispatcher.tree) carrier
  rw [decoded]

theorem parseClock_frameSecond_none
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetClockFuelStages.parseClock?
      (frameSecondRoot (compileActions program dispatcher.tree) bits
        continuation carrier) = none := by
  unfold RootResetClockFuelStages.parseClock?
  simp only [frameSecondRoot]
  rw [parseClockCore_frameSecond_none, parseClockExitCore_frameSecond_none]

theorem parseCanonicalClock_frameSecond_none
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetClockFuelCanonicalGrammar.parseCanonicalClock?
      (compileActions program dispatcher.tree)
      (frameSecondRoot (compileActions program dispatcher.tree) bits
        continuation carrier) = none := by
  simp [RootResetClockFuelCanonicalGrammar.parseCanonicalClock?,
    parseClock_frameSecond_none]

theorem parseFuelRow_frameSecond_none
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetClockFuelStages.parseFuelRow?
      (frameSecondRoot (compileActions program dispatcher.tree) bits
        continuation carrier) = none := by
  have decoded : RootResetClockFuelStages.decodeC?
      (.app (.app (.app .s haltCode)
        (compileActions program dispatcher.tree)) carrier) = none := by
    simpa only [actCode] using decodeC_actCarrier_none
      (compileActions program dispatcher.tree) carrier
  simp [RootResetClockFuelStages.parseFuelRow?,
    RootResetClockFuelStages.parseFuelCall?,
    RootResetClockFuelStages.parsePositiveHalf?,
    RootResetClockFuelStages.parseZeroFirst?,
    RootResetClockFuelStages.parseCanonicalZeroRoot?,
    RootResetClockFuelStages.parseZeroThird?, frameSecondRoot,
    decoded, actCode, b]
  cases continuation <;> simp [actCode, b]

theorem word_ne_app_b (bits : List Bool) (tail : Term) :
    word bits ≠ .app b tail := by
  have arityInvariant : ∀ (rest : List Bool) (acc : Term),
      acc.headArity = 0 ∨ acc.headArity = 3 →
      (rest.foldl (fun current bit => .app (live bit) current) acc).headArity =
          0 ∨
        (rest.foldl (fun current bit => .app (live bit) current) acc).headArity =
          3 := by
    intro rest
    induction rest with
    | nil =>
        intro acc invariant
        exact invariant
    | cons bit rest ih =>
        intro acc _
        apply ih (.app (live bit) acc)
        exact Or.inr rfl
  intro wordEq
  have encodedArity : (word bits).headArity = 0 ∨
      (word bits).headArity = 3 := by
    unfold word
    apply arityInvariant bits omega
    exact Or.inl rfl
  have arityEq := congrArg Term.headArity wordEq
  have rhsArity : (Term.app b tail).headArity = 2 := rfl
  rw [rhsArity] at arityEq
  cases encodedArity with
  | inl zero =>
      rw [zero] at arityEq
      contradiction
  | inr three =>
      rw [three] at arityEq
      contradiction

theorem parseOpenBase_frameSecond_none
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetClockFuelStages.parseOpenBase?
      (compileActions program dispatcher.tree)
      (frameSecondRoot (compileActions program dispatcher.tree) bits
        continuation carrier) = none := by
  generalize wordEq : word bits = encoded
  cases encoded with
  | s =>
      simp [RootResetClockFuelStages.parseOpenBase?, frameSecondRoot,
        seedCode, wordEq]
  | app fn arg =>
      have fnNe : fn ≠ b := by
        intro fnEq
        subst fn
        exact word_ne_app_b bits arg wordEq
      simp [RootResetClockFuelStages.parseOpenBase?, frameSecondRoot,
        seedCode, wordEq, fnNe]

theorem parseFuelEndpoint_frameSecond_none
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetClockFuelStages.parseFuelEndpoint?
      (compileActions program dispatcher.tree)
      (frameSecondRoot (compileActions program dispatcher.tree) bits
        continuation carrier) = none := by
  simp [RootResetClockFuelStages.parseFuelEndpoint?,
    parseFuelRow_frameSecond_none, parseOpenBase_frameSecond_none]

theorem parseEnvironment_actCarrier_none
    (actions carrier : Term) :
    CheckpointDecoder.parseEnvironment? actions (.app (actCode actions) carrier) =
      none := by
  simp [CheckpointDecoder.parseEnvironment?, actCode]

theorem parseFuelActive_frameSecond_none
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetClockFuelStages.parseFuelActive?
      (compileActions program dispatcher.tree)
      (frameSecondRoot (compileActions program dispatcher.tree) bits
        continuation carrier) = none := by
  rw [RootResetClockFuelStages.parseFuelActive?.eq_def]
  simp only [frameSecondRoot]
  rw [parseEnvironment_actCarrier_none]
  have endpointNone : RootResetClockFuelStages.parseFuelEndpoint?
      (compileActions program dispatcher.tree)
      (.app
        (.app
          (.app (actCode (compileActions program dispatcher.tree)) carrier)
          (.app (seedCode bits) carrier))
        (.app continuation carrier)) = none := by
    simpa only [frameSecondRoot] using
      parseFuelEndpoint_frameSecond_none program dispatcher bits continuation
        carrier
  rw [endpointNone]
  rfl

theorem parseCanonicalFuelActive_frameSecond_none
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetCompositeStageRegistry.parseCanonicalFuelActive?
      (compileActions program dispatcher.tree)
      (frameSecondRoot (compileActions program dispatcher.tree) bits
        continuation carrier) = none := by
  simp [RootResetCompositeStageRegistry.parseCanonicalFuelActive?,
    parseFuelActive_frameSecond_none]

theorem clockFuel_frameSecond_none
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetCompositeStageRegistry.parseClockFuel? program dispatcher.tree
      (frameSecondRoot (compileActions program dispatcher.tree) bits
        continuation carrier) = none := by
  unfold RootResetCompositeStageRegistry.parseClockFuel?
  dsimp only
  rw [peelMarked_frameSecond]
  unfold RootResetCompositeStageRegistry.parseCanonicalClockFuelActive?
  rw [parseCanonicalClock_frameSecond_none,
    parseCanonicalFuelActive_frameSecond_none]
  rfl

theorem compositeParse_frameSecond_none
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetCompositeStageRegistry.parse? program dispatcher
      (frameSecondRoot (compileActions program dispatcher.tree) bits
        continuation carrier) = none := by
  unfold RootResetCompositeStageRegistry.parse?
  rw [wholeDispatcher_frameSecond_none, wholeAppender_frameSecond_none,
    responseBoundary_frameSecond_none, clockFuel_frameSecond_none]
  rfl

set_option maxHeartbeats 1000000 in
set_option maxRecDepth 10000 in
theorem route_selectedAddress_frameSecond
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    (RootResetPersistentRouteA.classify program dispatcher
      (frameSecondRoot (compileActions program dispatcher.tree) bits
        continuation carrier)).selectedAddress? =
      some [.left, .left] := by
  unfold RootResetPersistentRouteA.classify
  dsimp only
  rw [activeContext_frameSecond]
  simp only [RootResetTwentySevenStageRegistry.parse?,
    compositeParse_frameSecond_none]
  unfold RootResetTwentySevenStageRegistry.parseCore?
  unfold RootResetWholeStageClassifier.endpointDecomposition
  rw [peelMarked_frameSecond]
  dsimp only
  have classified : RootResetWholeStageClassifier.classifyActive program
      dispatcher.tree []
        (frameSecondRoot (compileActions program dispatcher.tree) bits
          continuation carrier) =
      ⟨.frameR2, carrier, some [.left, .left, .right],
        RootResetWholeStageClassifier.historyPhase program [], bits.head?,
        some bits, none, none⟩ := by
    simpa only [frameSecondRoot] using
      RootResetWholeStageClassifier.classifyActive_frameR2 program
        dispatcher.tree [] bits carrier carrier continuation carrier
        (parseLocal_frameSecond_none program dispatcher bits continuation carrier)
  rw [classified]
  change Option.map (fun address => [] ++ address)
      (RootResetPersistentRouteA.verifiedCandidate?
        (frameSecondRoot (compileActions program dispatcher.tree) bits
          continuation carrier)
        (some [.left, .left])) = some [.left, .left]
  unfold RootResetPersistentRouteA.verifiedCandidate?
  change
    ((frameSecondRoot (compileActions program dispatcher.tree) bits
      continuation carrier).contractAt?
        [Direction.left, Direction.left]).map
        (fun _ => ([Direction.left, Direction.left] : Address)) =
      some ([Direction.left, Direction.left] : Address)
  rw [frameSecond_contract]
  rfl

theorem persistentFuelParse_frameSecond_none
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetPersistentFuelCarrier.parse?
      (compileActions program dispatcher.tree)
      (frameSecondRoot (compileActions program dispatcher.tree) bits
        continuation carrier) = none := by
  unfold RootResetPersistentFuelCarrier.parse?
  rw [parseCanonicalFuelActive_frameSecond_none]

theorem fuelActiveContext_frameSecond
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher
      (frameSecondRoot (compileActions program dispatcher.tree) bits
        continuation carrier) =
      ⟨frameSecondRoot (compileActions program dispatcher.tree) bits
          continuation carrier, .hole, [], [], []⟩ := by
  rw [RootResetPersistentRouteAFuel.fuelActiveContext]
  rw [persistentFuelParse_frameSecond_none, next_frameSecond_none]

theorem classifyHandoff_selected_frameSecond
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    (RootResetPersistentRouteAFuel.classifyHandoff program dispatcher
      (frameSecondRoot (compileActions program dispatcher.tree) bits
        continuation carrier)).selected? =
      some ⟨[.left, .left],
        freshLocal (compileActions program dispatcher.tree) bits continuation
          carrier⟩ := by
  unfold RootResetPersistentRouteAFuel.classifyHandoff
  dsimp only
  rw [fuelActiveContext_frameSecond, persistentFuelParse_frameSecond_none]
  simp [route_selectedAddress_frameSecond,
    RootResetPersistentRouteAFuel.checkedSelection?, frameSecond_contract]

theorem persistentSelect_frameSecond
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetPersistentSelector.selectStep? program dispatcher
      (frameSecondRoot (compileActions program dispatcher.tree) bits
        continuation carrier) =
      some (freshLocal (compileActions program dispatcher.tree) bits
        continuation carrier) := by
  unfold RootResetPersistentSelector.selectStep?
    RootResetPersistentSelector.selection?
  rw [classifyHandoff_selected_frameSecond]
  rfl

theorem parsePending_frameSecond_none
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetStageRegistry.parsePending?
      (frameSecondRoot (compileActions program dispatcher.tree) bits
        continuation carrier) = none := by
  simp [RootResetStageRegistry.parsePending?, PendingFrame.guard?,
    PendingFrame.pendingPattern, PendingFrame.frameFunctionPattern,
    PendingFrame.envelopePattern, PendingFrame.envelopeSlotPattern,
    PendingFrame.pairPattern, Pattern.matchesBool, frameSecondRoot, actCode]

theorem responseDescentContext_frameSecond
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetPersistentResponseSelector.responseDescentContext program
      dispatcher
      (frameSecondRoot (compileActions program dispatcher.tree) bits
        continuation carrier) =
      ⟨frameSecondRoot (compileActions program dispatcher.tree) bits
          continuation carrier, .hole, [], [], []⟩ := by
  rw [RootResetPersistentResponseSelector.responseDescentContext]
  rw [parseMarked_frameSecond_none, parseFreshNonempty_frameSecond_none,
    parsePending_frameSecond_none]

theorem responseOuter_frameSecond
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetPersistentResponseSelector.responseOuter program dispatcher
      (frameSecondRoot (compileActions program dispatcher.tree) bits
        continuation carrier) =
      ⟨frameSecondRoot (compileActions program dispatcher.tree) bits
          continuation carrier, .hole, [], [], []⟩ := by
  unfold RootResetPersistentResponseSelector.responseOuter
  rw [fuelActiveContext_frameSecond]
  simp [RootResetPersistentResponseSelector.composeActiveContexts,
    responseDescentContext_frameSecond]

theorem freshResponseRoot_frameSecond_none
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetPersistentResponseSelector.freshResponseRoot? program dispatcher
      (frameSecondRoot (compileActions program dispatcher.tree) bits
        continuation carrier) = none := by
  simp [RootResetPersistentResponseSelector.freshResponseRoot?,
    activeContext_frameSecond,
    RootResetPersistentResponseSelector.addressBeforeFresh?]

theorem currentCarrierDispatcher_frameSecond_none
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetPersistentResponseSelector.currentCarrierDispatcherAddress?
      program dispatcher
      (frameSecondRoot (compileActions program dispatcher.tree) bits
        continuation carrier) = none := by
  unfold RootResetPersistentResponseSelector.currentCarrierDispatcherAddress?
  rw [responseOuter_frameSecond]
  simp only [frameSecondRoot, seedCode]
  rw [dispatcherFreshHalt_actCode_none]

theorem selectedActionAddress_frameSecond_none
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetPersistentResponseSelector.selectedActionAddress? program dispatcher
      (frameSecondRoot (compileActions program dispatcher.tree) bits
        continuation carrier) = none := by
  unfold RootResetPersistentResponseSelector.selectedActionAddress?
  rw [responseOuter_frameSecond]
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
            (frameSecondRoot (compileActions program dispatcher.tree) bits
              continuation carrier).headArity = 6 := by
          rw [sourceEq, haltSource]
          rfl
        have actual :
            (frameSecondRoot (compileActions program dispatcher.tree) bits
              continuation carrier).headArity = 5 := rfl
        rw [actual] at arity
        contradiction
  next => rfl

theorem classifyActive_frameSecond
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetWholeStageClassifier.classifyActive program dispatcher.tree []
      (frameSecondRoot (compileActions program dispatcher.tree) bits
        continuation carrier) =
      ⟨.frameR2, carrier, some [.left, .left, .right],
        RootResetWholeStageClassifier.historyPhase program [], bits.head?,
        some bits, none, none⟩ := by
  simpa only [frameSecondRoot] using
    RootResetWholeStageClassifier.classifyActive_frameR2 program
      dispatcher.tree [] bits carrier carrier continuation carrier
      (parseLocal_frameSecond_none program dispatcher bits continuation carrier)

theorem parseFreshDispatcherCall_frameSecond_false
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetPersistentResponseSelector.parseFreshDispatcherCall?
      program dispatcher.tree
      (frameSecondRoot (compileActions program dispatcher.tree) bits
        continuation carrier) = false := by
  cases carrier <;>
    simp [RootResetPersistentResponseSelector.parseFreshDispatcherCall?,
      frameSecondRoot, seedCode, dispatcherFreshHalt_actCode_none]

theorem freshDispatcherSelection_frameSecond_none
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetPersistentResponseSelector.freshDispatcherSelection?
      program dispatcher
      (frameSecondRoot (compileActions program dispatcher.tree) bits
        continuation carrier) = none := by
  unfold RootResetPersistentResponseSelector.freshDispatcherSelection?
  rw [responseOuter_frameSecond]
  dsimp only
  rw [parseFreshDispatcherCall_frameSecond_false]
  rfl

theorem responseAppenderSelection_frameSecond_none
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetPersistentResponseSelector.responseAppenderSelection?
      program dispatcher
      (frameSecondRoot (compileActions program dispatcher.tree) bits
        continuation carrier) = none := by
  unfold RootResetPersistentResponseSelector.responseAppenderSelection?
    RootResetPersistentResponseSelector.responseAppenderAddress?
  rw [freshResponseRoot_frameSecond_none]
  rfl

theorem responseCarrierSelection_frameSecond_none
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetPersistentResponseSelector.responseCarrierSelection?
      program dispatcher
      (frameSecondRoot (compileActions program dispatcher.tree) bits
        continuation carrier) = none := by
  unfold RootResetPersistentResponseSelector.responseCarrierSelection?
    RootResetPersistentResponseSelector.responseCarrierAddress?
  rw [freshResponseRoot_frameSecond_none]
  rfl

theorem completedResponseAddress_frameSecond_none
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetPersistentResponseSelector.completedResponseAddress?
      program dispatcher
      (frameSecondRoot (compileActions program dispatcher.tree) bits
        continuation carrier) = none := by
  unfold RootResetPersistentResponseSelector.completedResponseAddress?
  rw [responseOuter_frameSecond]
  dsimp only
  rw [classifyActive_frameSecond]
  rfl

theorem responseBoundarySelection_frameSecond_none
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetPersistentResponseSelector.responseBoundarySelection?
      program dispatcher
      (frameSecondRoot (compileActions program dispatcher.tree) bits
        continuation carrier) = none := by
  unfold RootResetPersistentResponseSelector.responseBoundarySelection?
    RootResetPersistentResponseSelector.responseBoundaryAddress?
  rw [completedResponseAddress_frameSecond_none,
    freshResponseRoot_frameSecond_none]
  rfl

theorem markedHandoffSelection_frameSecond_none
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetPersistentResponseSelector.markedHandoffSelection?
      program dispatcher
      (frameSecondRoot (compileActions program dispatcher.tree) bits
        continuation carrier) = none := by
  unfold RootResetPersistentResponseSelector.markedHandoffSelection?
  rw [activeContext_frameSecond]
  rfl

theorem dispatcherSelection_frameSecond_none
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetPersistentResponseSelector.dispatcherSelection?
      program dispatcher
      (frameSecondRoot (compileActions program dispatcher.tree) bits
        continuation carrier) = none := by
  unfold RootResetPersistentResponseSelector.dispatcherSelection?
  rw [currentCarrierDispatcher_frameSecond_none]
  rfl

theorem selectedActionSelection_frameSecond_none
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetPersistentResponseSelector.selectedActionSelection?
      program dispatcher
      (frameSecondRoot (compileActions program dispatcher.tree) bits
        continuation carrier) = none := by
  unfold RootResetPersistentResponseSelector.selectedActionSelection?
  rw [selectedActionAddress_frameSecond_none]
  rfl

theorem appenderSelection_frameSecond_none
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetPersistentResponseSelector.appenderSelection?
      program dispatcher
      (frameSecondRoot (compileActions program dispatcher.tree) bits
        continuation carrier) = none := by
  unfold RootResetPersistentResponseSelector.appenderSelection?
  rw [responseOuter_frameSecond]
  dsimp only
  rw [appenderActive_frameSecond_none]
  rfl

theorem activatedRouteSelection_frameSecond_none
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetPersistentResponseSelector.activatedRouteSelection?
      program dispatcher
      (frameSecondRoot (compileActions program dispatcher.tree) bits
        continuation carrier) = none := by
  unfold RootResetPersistentResponseSelector.activatedRouteSelection?
    RootResetPersistentResponseSelector.activatedRouteAddress?
  rw [responseOuter_frameSecond]
  dsimp only
  unfold RootResetWholeStageClassifier.classify
  dsimp only
  simp only [peelMarked_frameSecond, classifyActive_frameSecond]
  rfl

theorem prioritiesClear_frameSecond
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetResponseClockFuelAgreement.PrioritiesClear program dispatcher
      (frameSecondRoot (compileActions program dispatcher.tree) bits
        continuation carrier) := by
  exact
    ⟨freshDispatcherSelection_frameSecond_none program dispatcher bits
        continuation carrier,
      responseAppenderSelection_frameSecond_none program dispatcher bits
        continuation carrier,
      responseCarrierSelection_frameSecond_none program dispatcher bits
        continuation carrier,
      responseBoundarySelection_frameSecond_none program dispatcher bits
        continuation carrier,
      markedHandoffSelection_frameSecond_none program dispatcher bits
        continuation carrier,
      dispatcherSelection_frameSecond_none program dispatcher bits
        continuation carrier,
      selectedActionSelection_frameSecond_none program dispatcher bits
        continuation carrier,
      appenderSelection_frameSecond_none program dispatcher bits continuation
        carrier,
      activatedRouteSelection_frameSecond_none program dispatcher bits
        continuation carrier⟩

theorem selectStep?_frameSecondRoot
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetPersistentResponseSelector.selectStep? program dispatcher
      (frameSecondRoot (compileActions program dispatcher.tree) bits
        continuation carrier) =
      some (freshLocal (compileActions program dispatcher.tree) bits
        continuation carrier) := by
  rw [RootResetResponseClockFuelAgreement.selectStep?_eq_persistent_of_prioritiesClear
    (prioritiesClear_frameSecond program dispatcher bits continuation carrier)]
  exact persistentSelect_frameSecond program dispatcher bits continuation carrier

theorem selectStep?_frameSecondRoot_of_base_and_clear
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term)
    (clear : RootResetResponseClockFuelAgreement.PrioritiesClear
      program dispatcher
        (frameSecondRoot (compileActions program dispatcher.tree) bits
          continuation carrier))
    (base : RootResetPersistentSelector.selectStep? program dispatcher
      (frameSecondRoot (compileActions program dispatcher.tree) bits
        continuation carrier) =
      some (freshLocal (compileActions program dispatcher.tree) bits
        continuation carrier)) :
    RootResetPersistentResponseSelector.selectStep? program dispatcher
      (frameSecondRoot (compileActions program dispatcher.tree) bits
        continuation carrier) =
      some (freshLocal (compileActions program dispatcher.tree) bits
        continuation carrier) := by
  exact response_select_of_base_and_clear clear base

end PureSFormal.Research.RootResetFrameSecondSelectorProof
