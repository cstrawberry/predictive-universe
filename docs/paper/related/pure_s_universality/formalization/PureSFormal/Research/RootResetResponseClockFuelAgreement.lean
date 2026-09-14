import PureSFormal.Research.RootResetResponseSelectorInitialAgreement
import PureSFormal.Research.RootResetTraversableCompletedParents

/-!
# Response-aware agreement on canonical clock and fuel stages

The response-aware selector agrees with its clock/fuel base when its
higher-priority response parsers are absent.
-/

namespace PureSFormal.Research.RootResetResponseClockFuelAgreement

open PureSFormal.PureS
open PureSFormal.PureS.SchedulerInvariant
open RootResetPersistentClockFuelAgreement
open RootResetClockFuelStages
open RootResetClockFuelCanonicalGrammar

/-- Exact absence of every response-only branch above the fuel-aware base. -/
structure PrioritiesClear
    (program : CTS.Program) (layout : ActionDispatcher program)
    (term : Term) : Prop where
  freshDispatcher :
    RootResetPersistentResponseSelector.freshDispatcherSelection?
      program layout term = none
  responseAppender :
    RootResetPersistentResponseSelector.responseAppenderSelection?
      program layout term = none
  responseCarrier :
    RootResetPersistentResponseSelector.responseCarrierSelection?
      program layout term = none
  responseBoundary :
    RootResetPersistentResponseSelector.responseBoundarySelection?
      program layout term = none
  markedHandoff :
    RootResetPersistentResponseSelector.markedHandoffSelection?
      program layout term = none
  dispatcher :
    RootResetPersistentResponseSelector.dispatcherSelection?
      program layout term = none
  selectedAction :
    RootResetPersistentResponseSelector.selectedActionSelection?
      program layout term = none
  appender :
    RootResetPersistentResponseSelector.appenderSelection?
      program layout term = none
  activatedRoute :
    RootResetPersistentResponseSelector.activatedRouteSelection?
      program layout term = none

/-- Pointwise response-priority exclusion aligned with an exact sampled list. -/
inductive PrioritiesClearChain
    (program : CTS.Program) (layout : ActionDispatcher program) :
    FiniteController.Configuration
        (SchedulerControl.Control program layout) →
      List (FiniteController.Configuration
        (SchedulerControl.Control program layout)) → Prop where
  | done (before) : PrioritiesClearChain program layout before []
  | next {before sample samples}
      (clear : PrioritiesClear program layout before.cursor.erase)
      (tail : PrioritiesClearChain program layout sample samples) :
      PrioritiesClearChain program layout before (sample :: samples)

/-- Clearing the nine response priorities makes the layered selector
definitionally equal to its persistent clock/fuel base on this term. -/
theorem selectStep?_eq_persistent_of_prioritiesClear
    {program : CTS.Program} {layout : ActionDispatcher program} {term : Term}
    (clear : PrioritiesClear program layout term) :
    RootResetPersistentResponseSelector.selectStep? program layout term =
      RootResetPersistentSelector.selectStep? program layout term := by
  unfold RootResetPersistentResponseSelector.selectStep?
    RootResetPersistentResponseSelector.classify
  dsimp only
  generalize handoffEq :
      RootResetPersistentRouteAFuel.classifyHandoff program layout term = handoff
  cases fuelEq : handoff.fuel <;> cases selectedEq : handoff.selected? <;>
    simp [fuelEq, selectedEq,
      RootResetPersistentResponseSelector.classifyAfterFuel,
      RootResetPersistentSelector.selectStep?,
      RootResetPersistentSelector.selection?, handoffEq,
      clear.freshDispatcher, clear.responseAppender, clear.responseCarrier,
      clear.responseBoundary,
      clear.markedHandoff,
      clear.dispatcher, clear.selectedAction, clear.appender,
      clear.activatedRoute]

/-- A persistent-selector chain transfers unchanged once every source term is
proved disjoint from the nine higher-priority response branches. -/
theorem selectorChain_of_persistent_of_prioritiesClear
    {program : CTS.Program} {layout : ActionDispatcher program}
    {before : FiniteController.Configuration
      (SchedulerControl.Control program layout)}
    {samples : List (FiniteController.Configuration
      (SchedulerControl.Control program layout))}
    (persistent : RootResetExactTraceAgreement.SelectorChain
      (RootResetPersistentSelector.selectStep? program layout) before samples)
    (clear : PrioritiesClearChain program layout before samples) :
    RootResetExactTraceAgreement.SelectorChain
      (RootResetPersistentResponseSelector.selectStep? program layout)
      before samples := by
  induction persistent with
  | done before => exact .done before
  | @next before sample samples selected tail ih =>
      cases clear with
      | next sourceClear tailClear =>
          apply RootResetExactTraceAgreement.SelectorChain.next
          · rw [selectStep?_eq_persistent_of_prioritiesClear sourceClear]
            exact selected
          · exact ih tailClear

/-- The completed-response fallback cannot fire when the response-aware
outer endpoint is not a completed Local. -/
theorem completedResponseAddress?_none_of_outer_parseLocal_none
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {outer : RootResetPersistentRouteA.ActiveContext program}
    (outerEq : RootResetPersistentResponseSelector.responseOuter program layout
      term = outer)
    (localNone : CheckpointDecoder.parseLocal? program layout.tree
      outer.active = none) :
    RootResetPersistentResponseSelector.completedResponseAddress?
      program layout term = none := by
  unfold RootResetPersistentResponseSelector.completedResponseAddress?
  rw [outerEq]
  generalize endpointEq : RootResetWholeStageClassifier.classifyActive program
      layout.tree outer.history outer.active = endpoint
  rcases endpoint with ⟨stage, child, queue⟩
  cases stage <;> simp [localNone]

/-! ## Root clock rows -/

theorem parsePending?_clockFirst_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage : Nat) (bits : List Bool) :
    RootResetStageRegistry.parsePending?
      (clockFirstTerm program layout stage bits) = none := by
  unfold RootResetStageRegistry.parsePending?
  apply PendingFrame.guard?_none_of_function_headArity_ne_two
  simp [clockFirstTerm, clockGrowthCore, clockWrap, C, b]

theorem fuelActiveContext_clockFirst
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage : Nat) (bits : List Bool) :
    RootResetPersistentRouteAFuel.fuelActiveContext program layout
        (clockFirstTerm program layout stage bits) =
      ⟨clockFirstTerm program layout stage bits, .hole, [], [], []⟩ := by
  rw [RootResetPersistentRouteAFuel.fuelActiveContext]
  rw [show RootResetPersistentFuelCarrier.parse?
      (compileActions program layout.tree)
        (clockFirstTerm program layout stage bits) = none by
    exact parseFuelHandoff?_canonicalClock_none rfl
      (clockFirstView_canonical program layout stage bits)]
  rw [next?_clockFirst_none]

theorem responseOuter_clockFirst
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage : Nat) (bits : List Bool) :
    RootResetPersistentResponseSelector.responseOuter program layout
        (clockFirstTerm program layout stage bits) =
      ⟨clockFirstTerm program layout stage bits, .hole, [], [], []⟩ := by
  unfold RootResetPersistentResponseSelector.responseOuter
  rw [fuelActiveContext_clockFirst]
  change RootResetPersistentResponseSelector.composeActiveContexts
      ⟨clockFirstTerm program layout stage bits, .hole, [], [], []⟩
      (RootResetPersistentResponseSelector.responseDescentContext program layout
        (clockFirstTerm program layout stage bits)) = _
  have descent :
      RootResetPersistentResponseSelector.responseDescentContext program layout
          (clockFirstTerm program layout stage bits) =
        ⟨clockFirstTerm program layout stage bits, .hole, [], [], []⟩ := by
    rw [RootResetPersistentResponseSelector.responseDescentContext]
    rw [parseMarkedLocal?_clockFirst_none,
      parseFreshNonempty?_clockFirst_none, parsePending?_clockFirst_none]
  rw [descent]
  rfl

theorem activeContext_clockFirst
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage : Nat) (bits : List Bool) :
    RootResetPersistentRouteA.activeContext program layout
        (clockFirstTerm program layout stage bits) =
      ⟨clockFirstTerm program layout stage bits, .hole, [], [], []⟩ := by
  rw [RootResetPersistentRouteA.activeContext, next?_clockFirst_none]

theorem freshResponseRoot?_clockFirst_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage : Nat) (bits : List Bool) :
    RootResetPersistentResponseSelector.freshResponseRoot? program layout
      (clockFirstTerm program layout stage bits) = none := by
  unfold RootResetPersistentResponseSelector.freshResponseRoot?
  rw [activeContext_clockFirst]
  rfl

theorem parseFreshDispatcherCall?_clockFirst_false
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage : Nat) (bits : List Bool) :
    RootResetPersistentResponseSelector.parseFreshDispatcherCall? program
      layout.tree (clockFirstTerm program layout stage bits) = false := by
  cases stage <;>
    simp [RootResetPersistentResponseSelector.parseFreshDispatcherCall?,
      RootResetWholeDispatcherStages.parseFreshHalt?, clockFirstTerm,
      clockGrowthCore, clockWrap, C, b, haltCode, haltTag, environmentCode,
      dispatcherCode, actCode, seedCode, PendingFrame.envelope,
      PendingFrame.envelopeSlot]

theorem currentCarrierDispatcherAddress?_clockFirst_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage : Nat) (bits : List Bool) :
    RootResetPersistentResponseSelector.currentCarrierDispatcherAddress?
      program layout (clockFirstTerm program layout stage bits) = none := by
  unfold RootResetPersistentResponseSelector.currentCarrierDispatcherAddress?
  rw [responseOuter_clockFirst]
  cases stage <;>
    simp [RootResetWholeDispatcherStages.parseFreshHalt?, clockFirstTerm,
      clockGrowthCore, clockWrap, C, b, haltCode, haltTag, environmentCode,
      dispatcherCode, actCode, seedCode, PendingFrame.envelope,
      PendingFrame.envelopeSlot]

theorem selectedActionAddress?_clockFirst_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage : Nat) (bits : List Bool) :
    RootResetPersistentResponseSelector.selectedActionAddress? program layout
      (clockFirstTerm program layout stage bits) = none := by
  unfold RootResetPersistentResponseSelector.selectedActionAddress?
  rw [responseOuter_clockFirst]
  cases stage <;>
    simp [RootResetWholeDispatcherStages.parseFreshHalt?, clockFirstTerm,
      clockGrowthCore, clockWrap, C, b, haltCode, haltTag, environmentCode,
      dispatcherCode, actCode, seedCode, PendingFrame.envelope,
      PendingFrame.envelopeSlot]

@[simp]
theorem clockFirstTerm_headArity
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage : Nat) (bits : List Bool) :
    (clockFirstTerm program layout stage bits).headArity = 4 :=
  rfl

theorem parseRouteDetailed_clockFirst_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage : Nat) (bits : List Bool) :
    DispatchParser.parseRouteDetailed (selectedAction program) layout.tree
      (clockFirstTerm program layout stage bits) = none := by
  cases parsedEq : DispatchParser.parseRouteDetailed (selectedAction program)
      layout.tree (clockFirstTerm program layout stage bits) with
  | none => rfl
  | some parsed =>
      have arity :=
        (DispatchParser.parseRouteDetailed_sound parsedEq).result_headArity
      rw [clockFirstTerm_headArity] at arity
      exact ((by decide : (4 : Nat) ≠ 2) arity).elim

theorem classify_clockFirst_ne_activatedRoute
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage : Nat) (bits : List Bool) :
    (RootResetWholeStageClassifier.classify program layout.tree
      (clockFirstTerm program layout stage bits)).endpoint.stage ≠
        .activatedRoute := by
  intro stageEq
  unfold RootResetWholeStageClassifier.classify at stageEq
  dsimp only at stageEq
  rw [peelMarked_clockFirst] at stageEq
  obtain ⟨parsed, parsedEq, _⟩ :=
    RootResetWholeStageClassifier.classifyActive_activatedRoute_sound program
      layout.tree [] (clockFirstTerm program layout stage bits) stageEq
  rw [parseRouteDetailed_clockFirst_none] at parsedEq
  contradiction

theorem completedResponseAddress?_clockFirst_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage : Nat) (bits : List Bool) :
    RootResetPersistentResponseSelector.completedResponseAddress? program layout
      (clockFirstTerm program layout stage bits) = none := by
  apply completedResponseAddress?_none_of_outer_parseLocal_none
    (responseOuter_clockFirst program layout stage bits)
  exact parseLocal?_clockFirst_none program layout stage bits

theorem prioritiesClear_clockFirst
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage : Nat) (bits : List Bool) :
    PrioritiesClear program layout
      (clockFirstTerm program layout stage bits) := by
  constructor
  · unfold RootResetPersistentResponseSelector.freshDispatcherSelection?
    rw [responseOuter_clockFirst]
    dsimp only
    rw [parseFreshDispatcherCall?_clockFirst_false]
    rfl
  · unfold RootResetPersistentResponseSelector.responseAppenderSelection?
      RootResetPersistentResponseSelector.responseAppenderAddress?
    rw [freshResponseRoot?_clockFirst_none]
    rfl
  · unfold RootResetPersistentResponseSelector.responseCarrierSelection?
      RootResetPersistentResponseSelector.responseCarrierAddress?
    rw [freshResponseRoot?_clockFirst_none]
    rfl
  · unfold RootResetPersistentResponseSelector.responseBoundarySelection?
      RootResetPersistentResponseSelector.responseBoundaryAddress?
    rw [completedResponseAddress?_clockFirst_none,
      freshResponseRoot?_clockFirst_none]
    rfl
  · unfold RootResetPersistentResponseSelector.markedHandoffSelection?
    rw [activeContext_clockFirst]
    rfl
  · unfold RootResetPersistentResponseSelector.dispatcherSelection?
    rw [currentCarrierDispatcherAddress?_clockFirst_none]
    rfl
  · unfold RootResetPersistentResponseSelector.selectedActionSelection?
    rw [selectedActionAddress?_clockFirst_none]
    rfl
  · unfold RootResetPersistentResponseSelector.appenderSelection?
    rw [responseOuter_clockFirst]
    dsimp only
    rw [appender_active_clockFirst_none]
    rfl
  · unfold RootResetPersistentResponseSelector.activatedRouteSelection?
      RootResetPersistentResponseSelector.activatedRouteAddress?
    rw [responseOuter_clockFirst, if_neg
      (classify_clockFirst_ne_activatedRoute program layout stage bits)]
    rfl

/-- The response-aware selector therefore agrees on the first contraction of
every canonical positive clock. -/
theorem clockFirst_response_selectStep?
    (program : CTS.Program) (layout : ActionDispatcher program)
    (registers : SchedulerControl.Registers program)
    (stage : Nat) (bits : List Bool) :
    RootResetPersistentResponseSelector.selectStep? program layout
        (clockFirstTerm program layout stage bits) =
      some
        (positiveClockMutationConfiguration program layout registers (stage + 1)
          0 stage
          [.left (environmentCode
            (compileActions program layout.tree) bits)]).cursor.erase := by
  rw [selectStep?_eq_persistent_of_prioritiesClear
    (prioritiesClear_clockFirst program layout stage bits)]
  exact clockFirst_selectStep? program layout registers stage bits

/-! ## Remaining root clock rows -/

theorem envelopeSlotPattern_not_C (stage : Nat) :
    ¬ Pattern.Matches PendingFrame.envelopeSlotPattern (C stage) := by
  cases stage with
  | zero =>
      intro matched
      change Pattern.Matches
        (.app (.app .s PendingFrame.pairPattern) (.app .s .hole))
        (.app (.app .s b) b) at matched
      cases matched with
      | app matchedFn _ =>
          cases matchedFn with
          | app _ matchedPair =>
              change Pattern.Matches
                (.app (.app .s .hole) .hole) (.app .s .s) at matchedPair
              cases matchedPair with
              | app matchedPairFn _ => cases matchedPairFn
  | succ stage =>
      intro matched
      change Pattern.Matches
        (.app (.app .s PendingFrame.pairPattern) (.app .s .hole))
        (.app b (C stage)) at matched
      cases matched with
      | app matchedFn _ =>
          cases matchedFn with
          | app _ matchedPair =>
              change Pattern.Matches
                (.app (.app .s .hole) .hole) .s at matchedPair
              cases matchedPair

theorem parsePending?_clockPostPositive_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage wrappers remaining : Nat) (bits : List Bool) :
    RootResetStageRegistry.parsePending?
      (clockPostPositiveTerm program layout stage wrappers remaining bits) =
        none := by
  unfold RootResetStageRegistry.parsePending?
  generalize guardedEq : PendingFrame.guard?
      (clockPostPositiveTerm program layout stage wrappers remaining bits)
        [.right] = guarded
  cases guarded with
  | none => rfl
  | some child =>
      have pending := PendingFrame.guard?_sound guardedEq
      have functionMatches := pending.function_matches
      simp only [clockPostPositiveTerm, clockGrowthCore, clockWrap] at functionMatches
      change Pattern.Matches PendingFrame.frameFunctionPattern
        (.app (.app .s (C stage))
          (clockWrap stage wrappers (.app (C remaining) (C stage)))) at functionMatches
      change Pattern.Matches
        (.app PendingFrame.envelopePattern .hole) _ at functionMatches
      cases functionMatches with
      | app envelopeMatches _ =>
          change Pattern.Matches
            (.app .s PendingFrame.envelopeSlotPattern) _ at envelopeMatches
          cases envelopeMatches with
          | app _ slotMatches =>
              exact (envelopeSlotPattern_not_C stage slotMatches).elim

theorem fuelActiveContext_clockPostPositive
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage wrappers remaining : Nat) (bits : List Bool)
    (balance : wrappers + 1 + remaining = stage) :
    RootResetPersistentRouteAFuel.fuelActiveContext program layout
        (clockPostPositiveTerm program layout stage wrappers remaining bits) =
      ⟨clockPostPositiveTerm program layout stage wrappers remaining bits,
        .hole, [], [], []⟩ := by
  rw [RootResetPersistentRouteAFuel.fuelActiveContext]
  have sourceEq :
      clockPostPositiveTerm program layout stage wrappers remaining bits =
        (clockPostPositiveView program layout stage wrappers remaining bits).term := by
    cases remaining <;> rfl
  rw [show RootResetPersistentFuelCarrier.parse?
      (compileActions program layout.tree)
        (clockPostPositiveTerm program layout stage wrappers remaining bits) =
          none by
    exact parseFuelHandoff?_canonicalClock_none sourceEq
      (clockPostPositive_canonical program layout stage wrappers remaining bits
        balance)]
  rw [next?_clockPostPositive_none]

theorem responseOuter_clockPostPositive
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage wrappers remaining : Nat) (bits : List Bool)
    (balance : wrappers + 1 + remaining = stage) :
    RootResetPersistentResponseSelector.responseOuter program layout
        (clockPostPositiveTerm program layout stage wrappers remaining bits) =
      ⟨clockPostPositiveTerm program layout stage wrappers remaining bits,
        .hole, [], [], []⟩ := by
  unfold RootResetPersistentResponseSelector.responseOuter
  rw [fuelActiveContext_clockPostPositive _ _ _ _ _ _ balance]
  change RootResetPersistentResponseSelector.composeActiveContexts
      ⟨clockPostPositiveTerm program layout stage wrappers remaining bits,
        .hole, [], [], []⟩
      (RootResetPersistentResponseSelector.responseDescentContext program layout
        (clockPostPositiveTerm program layout stage wrappers remaining bits)) = _
  have descent :
      RootResetPersistentResponseSelector.responseDescentContext program layout
          (clockPostPositiveTerm program layout stage wrappers remaining bits) =
        ⟨clockPostPositiveTerm program layout stage wrappers remaining bits,
          .hole, [], [], []⟩ := by
    rw [RootResetPersistentResponseSelector.responseDescentContext]
    rw [parseMarkedLocal?_clockPostPositive_none,
      parseFreshNonempty?_clockPostPositive_none,
      parsePending?_clockPostPositive_none]
  rw [descent]
  rfl

theorem activeContext_clockPostPositive
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage wrappers remaining : Nat) (bits : List Bool) :
    RootResetPersistentRouteA.activeContext program layout
        (clockPostPositiveTerm program layout stage wrappers remaining bits) =
      ⟨clockPostPositiveTerm program layout stage wrappers remaining bits,
        .hole, [], [], []⟩ := by
  rw [RootResetPersistentRouteA.activeContext,
    next?_clockPostPositive_none]

theorem freshResponseRoot?_clockPostPositive_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage wrappers remaining : Nat) (bits : List Bool) :
    RootResetPersistentResponseSelector.freshResponseRoot? program layout
      (clockPostPositiveTerm program layout stage wrappers remaining bits) =
        none := by
  unfold RootResetPersistentResponseSelector.freshResponseRoot?
  rw [activeContext_clockPostPositive]
  rfl

theorem clockPostPositiveTerm_headArity_ne_two
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage wrappers remaining : Nat) (bits : List Bool) :
    (clockPostPositiveTerm program layout stage wrappers remaining bits).headArity ≠
      2 := by
  cases stage <;> cases wrappers <;> cases remaining <;>
    simp [clockPostPositiveTerm, clockGrowthCore, clockWrap, C, b]

theorem parseRouteDetailed_clockPostPositive_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage wrappers remaining : Nat) (bits : List Bool) :
    DispatchParser.parseRouteDetailed (selectedAction program) layout.tree
      (clockPostPositiveTerm program layout stage wrappers remaining bits) = none := by
  cases parsedEq : DispatchParser.parseRouteDetailed (selectedAction program)
      layout.tree
      (clockPostPositiveTerm program layout stage wrappers remaining bits) with
  | none => rfl
  | some parsed =>
      have arity :=
        (DispatchParser.parseRouteDetailed_sound parsedEq).result_headArity
      exact (clockPostPositiveTerm_headArity_ne_two program layout stage wrappers
        remaining bits arity).elim

theorem classify_clockPostPositive_ne_activatedRoute
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage wrappers remaining : Nat) (bits : List Bool) :
    (RootResetWholeStageClassifier.classify program layout.tree
      (clockPostPositiveTerm program layout stage wrappers remaining bits)).endpoint.stage ≠
        .activatedRoute := by
  intro stageEq
  unfold RootResetWholeStageClassifier.classify at stageEq
  dsimp only at stageEq
  rw [peelMarked_clockPostPositive] at stageEq
  obtain ⟨parsed, parsedEq, _⟩ :=
    RootResetWholeStageClassifier.classifyActive_activatedRoute_sound program
      layout.tree []
        (clockPostPositiveTerm program layout stage wrappers remaining bits)
        stageEq
  rw [parseRouteDetailed_clockPostPositive_none] at parsedEq
  contradiction

theorem activatedRouteSelection?_clockPostPositive_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage wrappers remaining : Nat) (bits : List Bool)
    (balance : wrappers + 1 + remaining = stage) :
    RootResetPersistentResponseSelector.activatedRouteSelection? program layout
      (clockPostPositiveTerm program layout stage wrappers remaining bits) = none := by
  unfold RootResetPersistentResponseSelector.activatedRouteSelection?
    RootResetPersistentResponseSelector.activatedRouteAddress?
  rw [responseOuter_clockPostPositive _ _ _ _ _ _ balance]
  simp [classify_clockPostPositive_ne_activatedRoute]

theorem completedResponseAddress?_clockPostPositive_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage wrappers remaining : Nat) (bits : List Bool)
    (balance : wrappers + 1 + remaining = stage) :
    RootResetPersistentResponseSelector.completedResponseAddress? program layout
      (clockPostPositiveTerm program layout stage wrappers remaining bits) = none := by
  apply completedResponseAddress?_none_of_outer_parseLocal_none
    (responseOuter_clockPostPositive program layout stage wrappers remaining bits
      balance)
  exact parseLocal?_clockPostPositive_none program layout stage wrappers remaining
    bits

theorem prioritiesClear_clockPostPositive
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage wrappers remaining : Nat) (bits : List Bool)
    (balance : wrappers + 1 + remaining = stage) :
    PrioritiesClear program layout
      (clockPostPositiveTerm program layout stage wrappers remaining bits) := by
  constructor
  · unfold RootResetPersistentResponseSelector.freshDispatcherSelection?
    rw [responseOuter_clockPostPositive _ _ _ _ _ _ balance]
    cases stage <;> cases wrappers <;> cases remaining <;>
      simp [RootResetPersistentResponseSelector.parseFreshDispatcherCall?,
        RootResetWholeDispatcherStages.parseFreshHalt?, clockPostPositiveTerm,
        clockGrowthCore, clockWrap, C, b, haltCode, haltTag, environmentCode,
        dispatcherCode, actCode, seedCode, PendingFrame.envelope,
        PendingFrame.envelopeSlot]
  · unfold RootResetPersistentResponseSelector.responseAppenderSelection?
      RootResetPersistentResponseSelector.responseAppenderAddress?
    rw [freshResponseRoot?_clockPostPositive_none]
    rfl
  · unfold RootResetPersistentResponseSelector.responseCarrierSelection?
      RootResetPersistentResponseSelector.responseCarrierAddress?
    rw [freshResponseRoot?_clockPostPositive_none]
    rfl
  · unfold RootResetPersistentResponseSelector.responseBoundarySelection?
      RootResetPersistentResponseSelector.responseBoundaryAddress?
    rw [completedResponseAddress?_clockPostPositive_none program layout stage
      wrappers remaining bits balance]
    rw [freshResponseRoot?_clockPostPositive_none]
    rfl
  · unfold RootResetPersistentResponseSelector.markedHandoffSelection?
    rw [activeContext_clockPostPositive]
    rfl
  · unfold RootResetPersistentResponseSelector.dispatcherSelection?
      RootResetPersistentResponseSelector.currentCarrierDispatcherAddress?
    rw [responseOuter_clockPostPositive _ _ _ _ _ _ balance]
    cases stage <;> cases wrappers <;> cases remaining <;>
      simp [RootResetWholeDispatcherStages.parseFreshHalt?,
        clockPostPositiveTerm, clockGrowthCore, clockWrap, C, b, haltCode,
        haltTag, environmentCode, dispatcherCode, actCode, seedCode,
        PendingFrame.envelope, PendingFrame.envelopeSlot]
  · unfold RootResetPersistentResponseSelector.selectedActionSelection?
      RootResetPersistentResponseSelector.selectedActionAddress?
    rw [responseOuter_clockPostPositive _ _ _ _ _ _ balance]
    cases stage <;> cases wrappers <;> cases remaining <;>
      simp [RootResetWholeDispatcherStages.parseFreshHalt?,
        clockPostPositiveTerm, clockGrowthCore, clockWrap, C, b, haltCode,
        haltTag, environmentCode, dispatcherCode, actCode, seedCode,
        PendingFrame.envelope, PendingFrame.envelopeSlot]
  · unfold RootResetPersistentResponseSelector.appenderSelection?
    rw [responseOuter_clockPostPositive _ _ _ _ _ _ balance]
    dsimp only
    rw [appender_active_clockPostPositive_none]
    rfl
  · exact activatedRouteSelection?_clockPostPositive_none program layout stage
      wrappers remaining bits balance

/-! ## Completed clock launch -/

theorem parsePending?_clockLaunch_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (fuel : Nat) (bits : List Bool) :
    RootResetStageRegistry.parsePending?
      (clockLaunchTerm program layout fuel bits) = none := by
  unfold RootResetStageRegistry.parsePending?
  generalize guardedEq : PendingFrame.guard?
      (clockLaunchTerm program layout fuel bits) [.right] = guarded
  cases guarded with
  | none => rfl
  | some child =>
      have pending := PendingFrame.guard?_sound guardedEq
      have functionMatches := pending.function_matches
      simp only [clockLaunchTerm, Dovetail.clockExit, clockWrappers] at functionMatches
      change Pattern.Matches PendingFrame.frameFunctionPattern
        (.app (.app .s (C (fuel + 1)))
          (clockWrappers (fuel + 1) fuel)) at functionMatches
      change Pattern.Matches (.app PendingFrame.envelopePattern .hole) _
        at functionMatches
      cases functionMatches with
      | app envelopeMatches _ =>
          change Pattern.Matches (.app .s PendingFrame.envelopeSlotPattern) _
            at envelopeMatches
          cases envelopeMatches with
          | app _ slotMatches =>
              exact (envelopeSlotPattern_not_C (fuel + 1) slotMatches).elim

theorem fuelActiveContext_clockLaunch
    (program : CTS.Program) (layout : ActionDispatcher program)
    (fuel : Nat) (bits : List Bool) :
    RootResetPersistentRouteAFuel.fuelActiveContext program layout
        (clockLaunchTerm program layout fuel bits) =
      ⟨clockLaunchTerm program layout fuel bits, .hole, [], [], []⟩ := by
  rw [RootResetPersistentRouteAFuel.fuelActiveContext]
  rw [show RootResetPersistentFuelCarrier.parse?
      (compileActions program layout.tree)
        (clockLaunchTerm program layout fuel bits) = none by
    exact parseFuelHandoff?_canonicalClock_none rfl
      (clockLaunch_canonical program layout fuel bits)]
  rw [next?_clockLaunch_none]

theorem responseOuter_clockLaunch
    (program : CTS.Program) (layout : ActionDispatcher program)
    (fuel : Nat) (bits : List Bool) :
    RootResetPersistentResponseSelector.responseOuter program layout
        (clockLaunchTerm program layout fuel bits) =
      ⟨clockLaunchTerm program layout fuel bits, .hole, [], [], []⟩ := by
  unfold RootResetPersistentResponseSelector.responseOuter
  rw [fuelActiveContext_clockLaunch]
  change RootResetPersistentResponseSelector.composeActiveContexts
      ⟨clockLaunchTerm program layout fuel bits, .hole, [], [], []⟩
      (RootResetPersistentResponseSelector.responseDescentContext program layout
        (clockLaunchTerm program layout fuel bits)) = _
  have descent :
      RootResetPersistentResponseSelector.responseDescentContext program layout
          (clockLaunchTerm program layout fuel bits) =
        ⟨clockLaunchTerm program layout fuel bits, .hole, [], [], []⟩ := by
    rw [RootResetPersistentResponseSelector.responseDescentContext]
    rw [parseMarkedLocal?_clockLaunch_none,
      parseFreshNonempty?_clockLaunch_none, parsePending?_clockLaunch_none]
  rw [descent]
  rfl

theorem activeContext_clockLaunch
    (program : CTS.Program) (layout : ActionDispatcher program)
    (fuel : Nat) (bits : List Bool) :
    RootResetPersistentRouteA.activeContext program layout
        (clockLaunchTerm program layout fuel bits) =
      ⟨clockLaunchTerm program layout fuel bits, .hole, [], [], []⟩ := by
  rw [RootResetPersistentRouteA.activeContext, next?_clockLaunch_none]

theorem freshResponseRoot?_clockLaunch_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (fuel : Nat) (bits : List Bool) :
    RootResetPersistentResponseSelector.freshResponseRoot? program layout
      (clockLaunchTerm program layout fuel bits) = none := by
  unfold RootResetPersistentResponseSelector.freshResponseRoot?
  rw [activeContext_clockLaunch]
  rfl

@[simp] theorem clockLaunchTerm_headArity
    (program : CTS.Program) (layout : ActionDispatcher program)
    (fuel : Nat) (bits : List Bool) :
    (clockLaunchTerm program layout fuel bits).headArity = 3 := by
  exact Dovetail.headArity_clockExit_succ (fuel + 1) fuel _

theorem parseRouteDetailed_clockLaunch_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (fuel : Nat) (bits : List Bool) :
    DispatchParser.parseRouteDetailed (selectedAction program) layout.tree
      (clockLaunchTerm program layout fuel bits) = none := by
  cases parsedEq : DispatchParser.parseRouteDetailed (selectedAction program)
      layout.tree (clockLaunchTerm program layout fuel bits) with
  | none => rfl
  | some parsed =>
      have arity :=
        (DispatchParser.parseRouteDetailed_sound parsedEq).result_headArity
      rw [clockLaunchTerm_headArity] at arity
      exact ((by decide : (3 : Nat) ≠ 2) arity).elim

theorem classify_clockLaunch_ne_activatedRoute
    (program : CTS.Program) (layout : ActionDispatcher program)
    (fuel : Nat) (bits : List Bool) :
    (RootResetWholeStageClassifier.classify program layout.tree
      (clockLaunchTerm program layout fuel bits)).endpoint.stage ≠
        .activatedRoute := by
  intro stageEq
  unfold RootResetWholeStageClassifier.classify at stageEq
  dsimp only at stageEq
  rw [peelMarked_clockLaunch] at stageEq
  obtain ⟨parsed, parsedEq, _⟩ :=
    RootResetWholeStageClassifier.classifyActive_activatedRoute_sound program
      layout.tree [] (clockLaunchTerm program layout fuel bits) stageEq
  rw [parseRouteDetailed_clockLaunch_none] at parsedEq
  contradiction

theorem completedResponseAddress?_clockLaunch_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (fuel : Nat) (bits : List Bool) :
    RootResetPersistentResponseSelector.completedResponseAddress? program layout
      (clockLaunchTerm program layout fuel bits) = none := by
  apply completedResponseAddress?_none_of_outer_parseLocal_none
    (responseOuter_clockLaunch program layout fuel bits)
  exact parseLocal?_clockLaunch_none program layout fuel bits

theorem prioritiesClear_clockLaunch
    (program : CTS.Program) (layout : ActionDispatcher program)
    (fuel : Nat) (bits : List Bool) :
    PrioritiesClear program layout (clockLaunchTerm program layout fuel bits) := by
  constructor
  · unfold RootResetPersistentResponseSelector.freshDispatcherSelection?
    rw [responseOuter_clockLaunch]
    cases fuel <;>
      simp [RootResetPersistentResponseSelector.parseFreshDispatcherCall?,
        RootResetWholeDispatcherStages.parseFreshHalt?, clockLaunchTerm,
        Dovetail.clockExit, clockWrappers, clockBase, C, b, haltCode, haltTag,
        environmentCode, dispatcherCode, actCode, seedCode,
        PendingFrame.envelope, PendingFrame.envelopeSlot,
        RootResetPersistentResponseSelector.checkedAt?,
        RootResetPersistentRouteAFuel.checkedSelection?, Term.contractAt?,
        Term.contractRoot?]
  · unfold RootResetPersistentResponseSelector.responseAppenderSelection?
      RootResetPersistentResponseSelector.responseAppenderAddress?
    rw [freshResponseRoot?_clockLaunch_none]
    rfl
  · unfold RootResetPersistentResponseSelector.responseCarrierSelection?
      RootResetPersistentResponseSelector.responseCarrierAddress?
    rw [freshResponseRoot?_clockLaunch_none]
    rfl
  · unfold RootResetPersistentResponseSelector.responseBoundarySelection?
      RootResetPersistentResponseSelector.responseBoundaryAddress?
    rw [completedResponseAddress?_clockLaunch_none,
      freshResponseRoot?_clockLaunch_none]
    rfl
  · unfold RootResetPersistentResponseSelector.markedHandoffSelection?
    rw [activeContext_clockLaunch]
    rfl
  · unfold RootResetPersistentResponseSelector.dispatcherSelection?
      RootResetPersistentResponseSelector.currentCarrierDispatcherAddress?
    rw [responseOuter_clockLaunch]
    cases fuel <;>
      simp [RootResetWholeDispatcherStages.parseFreshHalt?, clockLaunchTerm,
        Dovetail.clockExit, clockWrappers, clockBase, C, b, haltCode, haltTag,
        environmentCode, dispatcherCode, actCode, seedCode,
        PendingFrame.envelope, PendingFrame.envelopeSlot,
        RootResetPersistentResponseSelector.checkedAt?,
        RootResetPersistentRouteAFuel.checkedSelection?, Term.contractAt?,
        Term.contractRoot?]
  · unfold RootResetPersistentResponseSelector.selectedActionSelection?
      RootResetPersistentResponseSelector.selectedActionAddress?
    rw [responseOuter_clockLaunch]
    cases fuel <;>
      simp [RootResetWholeDispatcherStages.parseFreshHalt?, clockLaunchTerm,
        Dovetail.clockExit, clockWrappers, clockBase, C, b, haltCode, haltTag,
        environmentCode, dispatcherCode, actCode, seedCode,
        PendingFrame.envelope, PendingFrame.envelopeSlot,
        RootResetPersistentResponseSelector.checkedAt?,
        RootResetPersistentRouteAFuel.checkedSelection?, Term.contractAt?,
        Term.contractRoot?]
  · unfold RootResetPersistentResponseSelector.appenderSelection?
    rw [responseOuter_clockLaunch]
    dsimp only
    rw [appender_active_clockLaunch_none]
    rfl
  · unfold RootResetPersistentResponseSelector.activatedRouteSelection?
      RootResetPersistentResponseSelector.activatedRouteAddress?
    rw [responseOuter_clockLaunch, if_neg
      (classify_clockLaunch_ne_activatedRoute program layout fuel bits)]
    rfl

theorem clockLaunch_response_selectStep?
    (program : CTS.Program) (layout : ActionDispatcher program)
    (registers : SchedulerControl.Registers program)
    (fuel : Nat) (bits : List Bool) :
    RootResetPersistentResponseSelector.selectStep? program layout
        (clockLaunchTerm program layout fuel bits) =
      some (positiveStageLaunchConfiguration program layout fuel
        (environmentCode (compileActions program layout.tree) bits)).cursor.erase := by
  rw [selectStep?_eq_persistent_of_prioritiesClear
    (prioritiesClear_clockLaunch program layout fuel bits)]
  exact clockLaunch_selectStep? program layout registers fuel bits

/-! ## Complete root clock selector chain -/

theorem positiveClockMutation_response_selects_next
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (stage wrappers remaining : Nat)
    (balance : wrappers + remaining + 1 = stage) :
    RootResetPersistentResponseSelector.selectStep? program layout
        (positiveClockMutationConfiguration program layout registers stage
          wrappers remaining
          [.left (environmentCode
            (compileActions program layout.tree) bits)]).cursor.erase =
      some (positiveClockSampleNextTerm program layout registers stage wrappers
        remaining bits) := by
  rw [positiveClockMutation_erase_eq_clockPostPositiveTerm]
  have postBalance : wrappers + 1 + remaining = stage := by
    calc
      wrappers + 1 + remaining = wrappers + (1 + remaining) :=
        Nat.add_assoc wrappers 1 remaining
      _ = wrappers + (remaining + 1) := by rw [Nat.add_comm 1 remaining]
      _ = wrappers + remaining + 1 := (Nat.add_assoc wrappers remaining 1).symm
      _ = stage := balance
  rw [selectStep?_eq_persistent_of_prioritiesClear
    (prioritiesClear_clockPostPositive program layout stage wrappers remaining
      bits postBalance)]
  have selected := positiveClockMutation_selects_next program layout bits
    registers stage wrappers remaining balance
  rw [positiveClockMutation_erase_eq_clockPostPositiveTerm] at selected
  exact selected

theorem clockTail_responseSelectorChain
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (stage : Nat) : ∀ wrappers remaining,
    wrappers + remaining + 1 = stage →
      RootResetExactTraceAgreement.SelectorChain
        (RootResetPersistentResponseSelector.selectStep? program layout)
        (positiveClockMutationConfiguration program layout registers stage
          wrappers remaining
          [.left (environmentCode
            (compileActions program layout.tree) bits)])
        (SchedulerNestedPhase.clockTailConfigurationsAt program layout bits
          registers stage [] wrappers remaining)
  | wrappers, 0, balance => by
      let closing := zeroClockMutationConfiguration program layout registers stage
        (wrappers + 1)
        [.left (environmentCode (compileActions program layout.tree) bits)]
      have selected := positiveClockMutation_response_selects_next program layout
        bits registers stage wrappers 0 (by simpa only [Nat.add_zero] using balance)
      have selected' : RootResetPersistentResponseSelector.selectStep? program
          layout
          (positiveClockMutationConfiguration program layout registers stage
            wrappers 0
            [.left (environmentCode
              (compileActions program layout.tree) bits)]).cursor.erase =
        some closing.cursor.erase := by
        simpa [positiveClockSampleNextTerm, closing] using selected
      simpa [SchedulerNestedPhase.clockTailConfigurationsAt, closing] using
        (RootResetExactTraceAgreement.SelectorChain.next selected'
          (RootResetExactTraceAgreement.SelectorChain.done closing))
  | wrappers, remaining + 1, balance => by
      let next := positiveClockMutationConfiguration program layout registers stage
        (wrappers + 1) remaining
        [.left (environmentCode (compileActions program layout.tree) bits)]
      have selected := positiveClockMutation_response_selects_next program layout
        bits registers stage wrappers (remaining + 1) balance
      have selected' : RootResetPersistentResponseSelector.selectStep? program
          layout
          (positiveClockMutationConfiguration program layout registers stage
            wrappers (remaining + 1)
            [.left (environmentCode
              (compileActions program layout.tree) bits)]).cursor.erase =
        some next.cursor.erase := by
        simpa [positiveClockSampleNextTerm, next] using selected
      have tailBalance : wrappers + 1 + remaining + 1 = stage := by
        calc
          wrappers + 1 + remaining + 1 =
              (wrappers + (1 + remaining)) + 1 := by
                rw [Nat.add_assoc wrappers 1 remaining]
          _ = (wrappers + (remaining + 1)) + 1 := by
                rw [Nat.add_comm 1 remaining]
          _ = wrappers + (remaining + 1) + 1 := rfl
          _ = stage := balance
      have tail := clockTail_responseSelectorChain program layout bits registers
        stage (wrappers + 1) remaining tailBalance
      simpa [SchedulerNestedPhase.clockTailConfigurationsAt, next] using
        (RootResetExactTraceAgreement.SelectorChain.next selected' tail)

theorem clock_responseSelectorChain
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (stage : Nat) :
    RootResetExactTraceAgreement.SelectorChain
      (RootResetPersistentResponseSelector.selectStep? program layout)
      (clockPhaseSourceConfiguration program layout registers
        [.left (environmentCode (compileActions program layout.tree) bits)]
        (stage + 1))
      (SchedulerNestedPhase.clockConfigurationsAt program layout bits registers
        [] stage) := by
  let first := positiveClockMutationConfiguration program layout registers
    (stage + 1) 0 stage
    [.left (environmentCode (compileActions program layout.tree) bits)]
  have selected := clockFirst_response_selectStep? program layout registers stage
    bits
  have selected' : RootResetPersistentResponseSelector.selectStep? program layout
        (clockPhaseSourceConfiguration program layout registers
          [.left (environmentCode
            (compileActions program layout.tree) bits)] (stage + 1)).cursor.erase =
      some first.cursor.erase := by
    simpa [clockPhaseSourceConfiguration, positiveClockSourceConfiguration,
      clockFirstTerm, first] using! selected
  have tail := clockTail_responseSelectorChain program layout bits registers
    (stage + 1) 0 stage (by simp)
  simpa [SchedulerNestedPhase.clockConfigurationsAt, first] using
    (RootResetExactTraceAgreement.SelectorChain.next selected' tail)

/-! ## Canonical root fuel rows -/

theorem parsePending?_canonicalFuelRow_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (row : FuelRow)
    (canonical : CanonicalFuelRow (compileActions program layout.tree) row) :
    RootResetStageRegistry.parsePending? row.term = none := by
  unfold RootResetStageRegistry.parsePending? PendingFrame.guard?
  cases row with
  | call fuel environment continuation =>
      rcases canonical.1 with ⟨seedPayload, rfl⟩
      cases fuel <;>
        simp [FuelRow.term, PendingFrame.pendingPattern,
          PendingFrame.frameFunctionPattern, PendingFrame.envelopePattern,
          PendingFrame.envelopeSlotPattern, PendingFrame.pairPattern,
          Pattern.matchesBool, C, b, CheckpointDecoder.openEnvironment,
          environmentCode, dispatcherCode, actCode, seedCode, haltCode,
          haltTag, PendingFrame.envelope, PendingFrame.envelopeSlot,
          Term.subterm?]
  | positiveHalf residual leftEnvironment rightEnvironment continuation =>
      rcases canonical.1 with ⟨leftSeed, rfl⟩
      rcases canonical.2.1 with ⟨rightSeed, rfl⟩
      cases residual <;>
        simp [FuelRow.term, PendingFrame.pendingPattern,
          PendingFrame.frameFunctionPattern, PendingFrame.envelopePattern,
          PendingFrame.envelopeSlotPattern, PendingFrame.pairPattern,
          Pattern.matchesBool, C, b, CheckpointDecoder.openEnvironment,
          environmentCode, dispatcherCode, actCode, seedCode, haltCode,
          haltTag, PendingFrame.envelope, PendingFrame.envelopeSlot,
          Term.subterm?]
  | zeroFirst leftEnvironment rightEnvironment continuation =>
      rcases canonical.1 with ⟨leftSeed, rfl⟩
      rcases canonical.2.1 with ⟨rightSeed, rfl⟩
      simp [FuelRow.term, PendingFrame.pendingPattern,
        PendingFrame.frameFunctionPattern, PendingFrame.envelopePattern,
        PendingFrame.envelopeSlotPattern, PendingFrame.pairPattern,
        Pattern.matchesBool, C, b, CheckpointDecoder.openEnvironment,
        environmentCode, dispatcherCode, actCode, seedCode, haltCode,
        haltTag, PendingFrame.envelope, PendingFrame.envelopeSlot,
        Term.subterm?]
  | zeroSecond leftArgument function rightArgument continuation =>
      rcases canonical.1 with ⟨leftSeed, rfl⟩
      rcases canonical.2.1 with ⟨functionSeed, rfl⟩
      rcases canonical.2.2.1 with ⟨rightSeed, rfl⟩
      simp [FuelRow.term, PendingFrame.pendingPattern,
        PendingFrame.frameFunctionPattern, PendingFrame.envelopePattern,
        PendingFrame.envelopeSlotPattern, PendingFrame.pairPattern,
        Pattern.matchesBool, C, b, CheckpointDecoder.openEnvironment,
        environmentCode, dispatcherCode, actCode, seedCode, haltCode,
        haltTag, PendingFrame.envelope, PendingFrame.envelopeSlot,
        Term.subterm?]
  | zeroThird environment leftContinuation function rightArgument
      rightContinuation =>
      rcases canonical.1 with ⟨environmentSeed, rfl⟩
      rcases canonical.2.2.1 with ⟨functionSeed, rfl⟩
      rcases canonical.2.2.2.1 with ⟨rightSeed, rfl⟩
      simp [FuelRow.term, PendingFrame.pendingPattern,
        PendingFrame.frameFunctionPattern, PendingFrame.envelopePattern,
        PendingFrame.envelopeSlotPattern, PendingFrame.pairPattern,
        Pattern.matchesBool, C, b, CheckpointDecoder.openEnvironment,
        environmentCode, dispatcherCode, actCode, seedCode, haltCode,
        haltTag, PendingFrame.envelope, PendingFrame.envelopeSlot,
        Term.subterm?]
  | zeroFourth leftContinuation environment rightContinuation alpha =>
      rcases canonical.2.1 with ⟨environmentSeed, rfl⟩
      have slotFalse :
          PendingFrame.envelopeSlotPattern.matchesBool leftContinuation = false := by
        cases matchedEq :
            PendingFrame.envelopeSlotPattern.matchesBool leftContinuation with
        | false => rfl
        | true =>
            have shape := Pattern.matchesBool_sound matchedEq
            have arity := PendingFrame.envelopeSlotPattern_headArity shape
            rcases canonical.1 with admissible | admissible <;>
              rw [admissible] at arity <;> contradiction
      have pendingFalse : PendingFrame.pendingPattern.matchesBool
          (FuelRow.zeroFourth leftContinuation
            (CheckpointDecoder.openEnvironment
              (compileActions program layout.tree) environmentSeed)
            rightContinuation alpha).term = false := by
        cases matchedEq : PendingFrame.pendingPattern.matchesBool
            (FuelRow.zeroFourth leftContinuation
              (CheckpointDecoder.openEnvironment
                (compileActions program layout.tree) environmentSeed)
              rightContinuation alpha).term with
        | false => rfl
        | true =>
            have matched := Pattern.matchesBool_sound matchedEq
            change Pattern.Matches
              (.app PendingFrame.frameFunctionPattern .hole) _ at matched
            cases matched with
            | app functionMatches _ =>
                change Pattern.Matches
                  (.app PendingFrame.envelopePattern .hole) _ at functionMatches
                cases functionMatches with
                | app envelopeMatches _ =>
                    change Pattern.Matches
                      (.app .s PendingFrame.envelopeSlotPattern) _
                      at envelopeMatches
                    cases envelopeMatches with
                    | app _ slotMatches =>
                        have accepted := Pattern.matchesBool_complete slotMatches
                        rw [slotFalse] at accepted
                        contradiction
      simp [pendingFalse]

theorem responseDescentContext_canonicalFuelRow
    (program : CTS.Program) (layout : ActionDispatcher program)
    (row : FuelRow)
    (canonical : CanonicalFuelRow (compileActions program layout.tree) row) :
    RootResetPersistentResponseSelector.responseDescentContext program layout
        row.term = ⟨row.term, .hole, [], [], []⟩ := by
  rw [RootResetPersistentResponseSelector.responseDescentContext]
  rw [parseMarkedLocal?_canonicalFuelRow_none program layout row canonical]
  rw [show RootResetPersistentRouteA.parseFreshNonempty? program layout.tree
      row.term = none by
    simp [RootResetPersistentRouteA.parseFreshNonempty?,
      parseLocal?_canonicalFuelRow_none program layout row canonical]]
  rw [parsePending?_canonicalFuelRow_none program layout row canonical]

theorem responseOuter_pendingFuelRow
    (program : CTS.Program) (layout : ActionDispatcher program)
    {layers : List PendingLayer}
    (route : RoutePendingLayers (compileActions program layout.tree) layers)
    (row : FuelRow)
    (canonical : CanonicalFuelRow (compileActions program layout.tree) row) :
    RootResetPersistentResponseSelector.responseOuter program layout
        (pendingFuelRowTerm (compileActions program layout.tree) layers row) =
      pendingFuelRowActiveContext program layers row := by
  unfold RootResetPersistentResponseSelector.responseOuter
  rw [fuelActiveContext_pendingFuelRow program layout route row canonical]
  change RootResetPersistentResponseSelector.composeActiveContexts
      (pendingFuelRowActiveContext program layers row)
      (RootResetPersistentResponseSelector.responseDescentContext program layout
        row.term) = _
  rw [responseDescentContext_canonicalFuelRow program layout row canonical]
  unfold RootResetPersistentResponseSelector.composeActiveContexts
    pendingFuelRowActiveContext
  simp only [List.append_nil]
  congr
  induction pendingContext layers with
  | hole => rfl
  | appLeft context argument ih => simp [Context.comp, ih]
  | appRight function context ih => simp [Context.comp, ih]

@[simp] theorem addressBeforeFresh?_replicate_pendingFrameChild : ∀ count,
    RootResetPersistentResponseSelector.addressBeforeFresh?
        (List.replicate count
          RootResetPersistentRouteA.Role.pendingFrameChild) = none
  | 0 => rfl
  | count + 1 => by
      rw [List.replicate_succ]
      simp only [RootResetPersistentResponseSelector.addressBeforeFresh?]
      rw [addressBeforeFresh?_replicate_pendingFrameChild count]
      rfl

theorem anyMarked_replicate_pendingFrameChild : ∀ count,
    (List.replicate count RootResetPersistentRouteA.Role.pendingFrameChild).any
        (fun role =>
          role == RootResetPersistentRouteA.Role.markedContinuation) = false
  | 0 => rfl
  | count + 1 => by
      rw [List.replicate_succ]
      change Bool.or false
        ((List.replicate count
            RootResetPersistentRouteA.Role.pendingFrameChild).any
              (fun role =>
                role == RootResetPersistentRouteA.Role.markedContinuation)) = false
      rw [anyMarked_replicate_pendingFrameChild count]
      rfl

@[simp] theorem addressBeforePendingMarked?_replicate_pendingFrameChild : ∀ count,
    RootResetPersistentResponseSelector.addressBeforePendingMarked?
        (List.replicate count
          RootResetPersistentRouteA.Role.pendingFrameChild) = none
  | 0 => rfl
  | count + 1 => by
      rw [List.replicate_succ]
      simp only [RootResetPersistentResponseSelector.addressBeforePendingMarked?]
      rw [addressBeforePendingMarked?_replicate_pendingFrameChild count]
      rw [anyMarked_replicate_pendingFrameChild count]
      rfl

theorem freshResponseRoot?_pendingFuelRow_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    {layers : List PendingLayer}
    (route : RoutePendingLayers (compileActions program layout.tree) layers)
    (row : FuelRow)
    (canonical : CanonicalFuelRow (compileActions program layout.tree) row) :
    RootResetPersistentResponseSelector.freshResponseRoot? program layout
      (pendingFuelRowTerm (compileActions program layout.tree) layers row) = none := by
  unfold RootResetPersistentResponseSelector.freshResponseRoot?
  rw [activeContext_pendingFuelRow program layout route row canonical]
  simp [pendingFuelRowActiveContext,
    addressBeforeFresh?_replicate_pendingFrameChild]

theorem currentCarrierDispatcherAddress?_pendingFuelRow_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    {layers : List PendingLayer}
    (route : RoutePendingLayers (compileActions program layout.tree) layers)
    (row : FuelRow)
    (canonical : CanonicalFuelRow (compileActions program layout.tree) row) :
    RootResetPersistentResponseSelector.currentCarrierDispatcherAddress?
      program layout
        (pendingFuelRowTerm (compileActions program layout.tree) layers row) = none := by
  unfold RootResetPersistentResponseSelector.currentCarrierDispatcherAddress?
  rw [responseOuter_pendingFuelRow program layout route row canonical]
  dsimp only [pendingFuelRowActiveContext]
  split
  next haltField dispatcherTerm seedPayload seedAudit continuation
      continuationAudit sourceEq =>
    cases haltEq : RootResetWholeDispatcherStages.parseFreshHalt? haltField with
    | none => rfl
    | some carrier =>
        have haltSource :=
          RootResetWholeDispatcherStages.parseFreshHalt?_sound haltEq
        have arity : row.term.headArity = 6 := by
          rw [sourceEq, haltSource]
          rfl
        have bound := row.term_headArity_le_four
        rw [arity] at bound
        exact (by decide : ¬ 6 ≤ 4) bound |>.elim
  next => rfl

theorem selectedActionAddress?_pendingFuelRow_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    {layers : List PendingLayer}
    (route : RoutePendingLayers (compileActions program layout.tree) layers)
    (row : FuelRow)
    (canonical : CanonicalFuelRow (compileActions program layout.tree) row) :
    RootResetPersistentResponseSelector.selectedActionAddress?
      program layout
        (pendingFuelRowTerm (compileActions program layout.tree) layers row) = none := by
  unfold RootResetPersistentResponseSelector.selectedActionAddress?
  rw [responseOuter_pendingFuelRow program layout route row canonical]
  dsimp only [pendingFuelRowActiveContext]
  split
  next haltField dispatcher seedPayload seedAudit continuation continuationAudit
      sourceEq =>
    cases haltEq : RootResetWholeDispatcherStages.parseFreshHalt? haltField with
    | none => rfl
    | some haltAudit =>
        have haltSource :=
          RootResetWholeDispatcherStages.parseFreshHalt?_sound haltEq
        have arity : row.term.headArity = 6 := by
          rw [sourceEq, haltSource]
          rfl
        have bound := row.term_headArity_le_four
        rw [arity] at bound
        exact (by decide : ¬ 6 ≤ 4) bound |>.elim
  next => rfl

theorem fuelRow_term_headArity_ne_two (row : FuelRow) :
    row.term.headArity ≠ 2 := by
  cases row with
  | call fuel environment continuation =>
      cases fuel <;> simp [FuelRow.term, C, b]
  | positiveHalf => simp [FuelRow.term]
  | zeroFirst => simp [FuelRow.term, b]
  | zeroSecond => simp [FuelRow.term]
  | zeroThird => simp [FuelRow.term, b]
  | zeroFourth => simp [FuelRow.term]

theorem parseFreshDispatcherCall?_headArity_six
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)} {term : Term}
    (accepted : RootResetPersistentResponseSelector.parseFreshDispatcherCall?
      program tree term = true) :
    term.headArity = 6 := by
  unfold RootResetPersistentResponseSelector.parseFreshDispatcherCall? at accepted
  split at accepted
  next haltField actionsArgument dispatcherArgument seedPayload seedAudit
      continuation continuationAudit sourceEq =>
    simp only [Bool.and_eq_true] at accepted
    obtain ⟨⟨haltSome, wordSome⟩, actionsEq⟩ := accepted
    cases haltEq : RootResetWholeDispatcherStages.parseFreshHalt? actionsArgument with
    | none => simp [haltEq] at haltSome
    | some audit =>
        have haltSource := RootResetWholeDispatcherStages.parseFreshHalt?_sound
          haltEq
        rw [haltSource]
        rfl
  next => contradiction

theorem parseFreshDispatcherCall?_canonicalFuelRow_false
    (program : CTS.Program) (layout : ActionDispatcher program)
    (row : FuelRow) :
    RootResetPersistentResponseSelector.parseFreshDispatcherCall? program
      layout.tree row.term = false := by
  cases acceptedEq : RootResetPersistentResponseSelector.parseFreshDispatcherCall?
      program layout.tree row.term with
  | false => rfl
  | true =>
      have arity := parseFreshDispatcherCall?_headArity_six acceptedEq
      have bound := row.term_headArity_le_four
      rw [arity] at bound
      exact (by decide : ¬ 6 ≤ 4) bound |>.elim

theorem parseRouteDetailed_canonicalFuelRow_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (row : FuelRow) :
    DispatchParser.parseRouteDetailed (selectedAction program) layout.tree
      row.term = none := by
  cases parsedEq : DispatchParser.parseRouteDetailed (selectedAction program)
      layout.tree row.term with
  | none => rfl
  | some parsed =>
      have arity :=
        (DispatchParser.parseRouteDetailed_sound parsedEq).result_headArity
      exact (fuelRow_term_headArity_ne_two row arity).elim

theorem classify_canonicalFuelRow_ne_activatedRoute
    (program : CTS.Program) (layout : ActionDispatcher program)
    (row : FuelRow)
    (canonical : CanonicalFuelRow (compileActions program layout.tree) row) :
    (RootResetWholeStageClassifier.classify program layout.tree row.term).endpoint.stage ≠
      .activatedRoute := by
  intro stageEq
  unfold RootResetWholeStageClassifier.classify at stageEq
  dsimp only at stageEq
  rw [peelMarked_canonicalFuelRow program layout row canonical] at stageEq
  obtain ⟨parsed, parsedEq, _⟩ :=
    RootResetWholeStageClassifier.classifyActive_activatedRoute_sound program
      layout.tree [] row.term stageEq
  rw [parseRouteDetailed_canonicalFuelRow_none] at parsedEq
  contradiction

theorem completedResponseAddress?_pendingFuelRow_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    {layers : List PendingLayer}
    (route : RoutePendingLayers (compileActions program layout.tree) layers)
    (row : FuelRow)
    (canonical : CanonicalFuelRow (compileActions program layout.tree) row) :
    RootResetPersistentResponseSelector.completedResponseAddress? program layout
      (pendingFuelRowTerm (compileActions program layout.tree) layers row) = none := by
  apply completedResponseAddress?_none_of_outer_parseLocal_none
    (responseOuter_pendingFuelRow program layout route row canonical)
  exact parseLocal?_canonicalFuelRow_none program layout row canonical

/-- Every response-only priority is absent on a canonical fuel row below an
arbitrary role-certified pending-frame stack. -/
theorem prioritiesClear_pendingFuelRow
    (program : CTS.Program) (layout : ActionDispatcher program)
    {layers : List PendingLayer}
    (route : RoutePendingLayers (compileActions program layout.tree) layers)
    (row : FuelRow)
    (canonical : CanonicalFuelRow (compileActions program layout.tree) row) :
    PrioritiesClear program layout
      (pendingFuelRowTerm (compileActions program layout.tree) layers row) := by
  constructor
  · unfold RootResetPersistentResponseSelector.freshDispatcherSelection?
    rw [responseOuter_pendingFuelRow program layout route row canonical]
    simp [pendingFuelRowActiveContext,
      parseFreshDispatcherCall?_canonicalFuelRow_false]
  · unfold RootResetPersistentResponseSelector.responseAppenderSelection?
      RootResetPersistentResponseSelector.responseAppenderAddress?
    rw [freshResponseRoot?_pendingFuelRow_none program layout route row
      canonical]
    rfl
  · unfold RootResetPersistentResponseSelector.responseCarrierSelection?
      RootResetPersistentResponseSelector.responseCarrierAddress?
    rw [freshResponseRoot?_pendingFuelRow_none program layout route row
      canonical]
    rfl
  · unfold RootResetPersistentResponseSelector.responseBoundarySelection?
      RootResetPersistentResponseSelector.responseBoundaryAddress?
    rw [completedResponseAddress?_pendingFuelRow_none program layout route row
      canonical]
    rw [freshResponseRoot?_pendingFuelRow_none program layout route row
      canonical]
    rfl
  · unfold RootResetPersistentResponseSelector.markedHandoffSelection?
    rw [activeContext_pendingFuelRow program layout route row canonical]
    simp [pendingFuelRowActiveContext,
      addressBeforePendingMarked?_replicate_pendingFrameChild]
  · unfold RootResetPersistentResponseSelector.dispatcherSelection?
    simp [currentCarrierDispatcherAddress?_pendingFuelRow_none program layout
      route row canonical]
  · unfold RootResetPersistentResponseSelector.selectedActionSelection?
    simp [selectedActionAddress?_pendingFuelRow_none program layout route row
      canonical]
  · unfold RootResetPersistentResponseSelector.appenderSelection?
    rw [responseOuter_pendingFuelRow program layout route row canonical]
    simp [pendingFuelRowActiveContext,
      appender_active_canonicalFuelRow_none program layout row canonical]
  · unfold RootResetPersistentResponseSelector.activatedRouteSelection?
      RootResetPersistentResponseSelector.activatedRouteAddress?
    rw [responseOuter_pendingFuelRow program layout route row canonical]
    simp [pendingFuelRowActiveContext,
      classify_canonicalFuelRow_ne_activatedRoute program layout row canonical]

/-! ## Fuel selection below traversable completed parents -/

/-- A literal fuel parse remains the highest-priority response-selector branch
below any completed-parent prefix carrying the exact fuel-traversal
provenance.  The selected contractum is the local fuel contractum rebuilt in
the unchanged historical context. -/
theorem fuelSelection_response_selectStep?_of_traversable
    {program : CTS.Program} {layout : ActionDispatcher program}
    {outerParents : List ParentFrame} {layers : Nat} {endpoint : Term}
    (outer : RootResetTraversableCompletedParents.TraversableParents.FuelTraversableAt
      program layout outerParents layers endpoint)
    {view : RootResetPersistentFuelCarrier.View}
    (parsed : RootResetPersistentFuelCarrier.parse?
      (compileActions program layout.tree)
      (RootResetPersistentRouteAFuel.fuelActiveContext program layout
        endpoint).active = some view) :
    RootResetPersistentResponseSelector.selectStep? program layout
        (Cursor.rebuild outerParents endpoint) =
      some (Cursor.rebuild outerParents
        ((RootResetPersistentRouteAFuel.fuelActiveContext program layout
          endpoint).context.plug
            (view.target (compileActions program layout.tree)))) := by
  let whole := RootResetPersistentRouteAFuel.fuelActiveContext program layout
    (Cursor.rebuild outerParents endpoint)
  let inner := RootResetPersistentRouteAFuel.fuelActiveContext program layout
    endpoint
  have parsedWhole : RootResetPersistentFuelCarrier.parse?
      (compileActions program layout.tree) whole.active = some view := by
    simpa [whole, inner, outer.fuelActiveContext_rebuild_active] using parsed
  have priority :=
    RootResetPersistentRouteAFuel.classifyHandoff_fuel_priority parsedWhole
  apply RootResetPersistentResponseSelector.selectStep?_eq_some_of_baseFuel
    priority.1 priority.2
  simp only [RootResetPersistentRouteAFuel.fuelSelection]
  change whole.context.plug
      (view.target (compileActions program layout.tree)) = _
  rw [show whole.context =
      (SchedulerInvariant.contextOfParents outerParents).comp inner.context by
    simpa [whole, inner] using outer.fuelActiveContext_rebuild_context]
  rw [Context.plug_comp, SchedulerInvariant.contextOfParents_plug]

/-- Generic response-aware selector bridge for every generated canonical fuel
row, including all of its literal pending-frame parents. -/
theorem generatedFuelRow_response_selectStep?
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (continuation : Term)
    (admissible : Carrier.Admissible continuation)
    (depth : Nat) (row : FuelRow)
    (canonical : CanonicalFuelRow (compileActions program layout.tree) row) :
    RootResetPersistentResponseSelector.selectStep? program layout
        (Cursor.mk row.term
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program layout.tree) bits)
            continuation depth [])).erase =
      some
        (Cursor.rebuild
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program layout.tree) bits)
            continuation depth []) row.target) := by
  let actions := compileActions program layout.tree
  let layers := generatedPendingLayers actions bits continuation depth
  have route : RoutePendingLayers actions layers :=
    generatedPendingLayers_route actions bits continuation admissible depth
  have clear : PrioritiesClear program layout
      (Cursor.mk row.term
        (PrimitiveFuel.pendingParents
          (environmentCode actions bits) continuation depth [])).erase := by
    rw [fuelRowCursor_erase actions bits continuation depth row]
    exact prioritiesClear_pendingFuelRow program layout route row canonical
  rw [selectStep?_eq_persistent_of_prioritiesClear clear]
  exact generatedFuelRow_selectStep? program layout bits continuation admissible
    depth row canonical

theorem fuelPositiveScriptSource_response_selects_first
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (fuel depth : Nat) (continuation : Term)
    (admissible : Carrier.Admissible continuation) :
    RootResetPersistentResponseSelector.selectStep? program layout
        (fuelPositiveScriptSourceConfiguration program layout registers fuel
          (environmentCode (compileActions program layout.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program layout.tree) bits)
            continuation depth [])).cursor.erase =
      some
        (fuelPositiveFirstMutationConfiguration program layout registers fuel
          (environmentCode (compileActions program layout.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program layout.tree) bits)
            continuation depth [])).cursor.erase := by
  let actions := compileActions program layout.tree
  have selected := generatedFuelRow_response_selectStep? program layout bits
    continuation admissible depth
    (.call (fuel + 1) (environmentCode actions bits) continuation)
    (generatedCallRow_canonical actions bits continuation admissible (fuel + 1))
  simpa [fuelPositiveScriptSourceConfiguration,
    fuelPositiveFirstMutationConfiguration, Cursor.erase, FuelRow.term,
    FuelRow.target, FuelRow.localAddress, FuelRow.replacement, Term.replace?,
    C, b, actions] using! selected

theorem fuelPositiveFirst_response_selects_second
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (fuel depth : Nat) (continuation : Term)
    (admissible : Carrier.Admissible continuation) :
    RootResetPersistentResponseSelector.selectStep? program layout
        (fuelPositiveFirstMutationConfiguration program layout registers fuel
          (environmentCode (compileActions program layout.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program layout.tree) bits)
            continuation depth [])).cursor.erase =
      some
        (fuelPositiveSecondMutationConfiguration program layout registers fuel
          (environmentCode (compileActions program layout.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program layout.tree) bits)
            continuation depth [])).cursor.erase := by
  let actions := compileActions program layout.tree
  have selected := generatedFuelRow_response_selectStep? program layout bits
    continuation admissible depth
    (.positiveHalf fuel (environmentCode actions bits)
      (environmentCode actions bits) continuation)
    (generatedPositiveHalfRow_canonical actions bits continuation admissible fuel)
  simpa [fuelPositiveFirstMutationConfiguration,
    fuelPositiveSecondMutationConfiguration, Cursor.erase, FuelRow.term,
    FuelRow.target, FuelRow.localAddress, FuelRow.replacement, Term.replace?,
    frame, actions] using! selected

theorem fuelZeroScriptSource_response_selects_first
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (depth : Nat) (continuation : Term)
    (admissible : Carrier.Admissible continuation) :
    RootResetPersistentResponseSelector.selectStep? program layout
        (fuelZeroScriptSourceConfiguration program layout registers
          (environmentCode (compileActions program layout.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program layout.tree) bits)
            continuation depth [])).cursor.erase =
      some
        (fuelZeroFirstMutationConfiguration program layout registers
          (environmentCode (compileActions program layout.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program layout.tree) bits)
            continuation depth [])).cursor.erase := by
  let actions := compileActions program layout.tree
  have selected := generatedFuelRow_response_selectStep? program layout bits
    continuation admissible depth
    ((ZeroPosition.call).row actions (word bits) continuation)
    (generatedZeroRow_canonical actions bits continuation admissible .call)
  simpa [fuelZeroScriptSourceConfiguration,
    fuelZeroFirstMutationConfiguration, Cursor.erase, ZeroPosition.row,
    zeroEnvironment, CheckpointDecoder.openEnvironment_word, FuelRow.term,
    FuelRow.target, FuelRow.localAddress, FuelRow.replacement, Term.replace?,
    C, b, actions] using! selected

theorem fuelZeroFirst_response_selects_second
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (depth : Nat) (continuation : Term)
    (admissible : Carrier.Admissible continuation) :
    RootResetPersistentResponseSelector.selectStep? program layout
        (fuelZeroFirstMutationConfiguration program layout registers
          (environmentCode (compileActions program layout.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program layout.tree) bits)
            continuation depth [])).cursor.erase =
      some
        (fuelZeroSecondMutationConfiguration program layout registers
          (environmentCode (compileActions program layout.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program layout.tree) bits)
            continuation depth [])).cursor.erase := by
  let actions := compileActions program layout.tree
  have selected := generatedFuelRow_response_selectStep? program layout bits
    continuation admissible depth
    ((ZeroPosition.first).row actions (word bits) continuation)
    (generatedZeroRow_canonical actions bits continuation admissible .first)
  simpa [fuelZeroFirstMutationConfiguration,
    fuelZeroSecondMutationConfiguration, Cursor.erase, ZeroPosition.row,
    zeroEnvironment, CheckpointDecoder.openEnvironment_word, FuelRow.term,
    FuelRow.target, FuelRow.localAddress, FuelRow.replacement, Term.replace?,
    C, b, actions] using! selected

theorem fuelZeroSecond_response_selects_third
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (depth : Nat) (continuation : Term)
    (admissible : Carrier.Admissible continuation) :
    RootResetPersistentResponseSelector.selectStep? program layout
        (fuelZeroSecondMutationConfiguration program layout registers
          (environmentCode (compileActions program layout.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program layout.tree) bits)
            continuation depth [])).cursor.erase =
      some
        (fuelZeroThirdMutationConfiguration program layout registers
          (environmentCode (compileActions program layout.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program layout.tree) bits)
            continuation depth [])).cursor.erase := by
  let actions := compileActions program layout.tree
  have selected := generatedFuelRow_response_selectStep? program layout bits
    continuation admissible depth
    ((ZeroPosition.second).row actions (word bits) continuation)
    (generatedZeroRow_canonical actions bits continuation admissible .second)
  simpa [fuelZeroSecondMutationConfiguration,
    fuelZeroThirdMutationConfiguration, Cursor.erase, ZeroPosition.row,
    zeroEnvironment, zeroAlpha, baseAlpha,
    CheckpointDecoder.openEnvironment_word, FuelRow.term, FuelRow.target,
    FuelRow.localAddress, FuelRow.replacement, Term.replace?, C, b, actions]
    using! selected

theorem fuelZeroThird_response_selects_fourth
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (depth : Nat) (continuation : Term)
    (admissible : Carrier.Admissible continuation) :
    RootResetPersistentResponseSelector.selectStep? program layout
        (fuelZeroThirdMutationConfiguration program layout registers
          (environmentCode (compileActions program layout.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program layout.tree) bits)
            continuation depth [])).cursor.erase =
      some
        (fuelZeroFourthMutationConfiguration program layout registers
          (environmentCode (compileActions program layout.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program layout.tree) bits)
            continuation depth [])).cursor.erase := by
  let actions := compileActions program layout.tree
  have selected := generatedFuelRow_response_selectStep? program layout bits
    continuation admissible depth
    ((ZeroPosition.third).row actions (word bits) continuation)
    (generatedZeroRow_canonical actions bits continuation admissible .third)
  simpa [fuelZeroThirdMutationConfiguration,
    fuelZeroFourthMutationConfiguration, Cursor.erase, ZeroPosition.row,
    zeroEnvironment, zeroAlpha, baseAlpha,
    CheckpointDecoder.openEnvironment_word, FuelRow.term, FuelRow.target,
    FuelRow.localAddress, FuelRow.replacement, Term.replace?, C, b, actions]
    using! selected

theorem fuelZeroFourth_response_selects_fifth
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (depth : Nat) (continuation : Term)
    (admissible : Carrier.Admissible continuation) :
    RootResetPersistentResponseSelector.selectStep? program layout
        (fuelZeroFourthMutationConfiguration program layout registers
          (environmentCode (compileActions program layout.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program layout.tree) bits)
            continuation depth [])).cursor.erase =
      some
        (fuelZeroFifthMutationConfiguration program layout registers
          (environmentCode (compileActions program layout.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program layout.tree) bits)
            continuation depth [])).cursor.erase := by
  let actions := compileActions program layout.tree
  have selected := generatedFuelRow_response_selectStep? program layout bits
    continuation admissible depth
    ((ZeroPosition.fourth).row actions (word bits) continuation)
    (generatedZeroRow_canonical actions bits continuation admissible .fourth)
  simpa [fuelZeroFourthMutationConfiguration,
    fuelZeroFifthMutationConfiguration, Cursor.erase, ZeroPosition.row,
    zeroEnvironment, zeroAlpha, baseAlpha, baseCarrier, baseBeta,
    CheckpointDecoder.openEnvironment_word, FuelRow.term, FuelRow.target,
    FuelRow.localAddress, FuelRow.replacement, Term.replace?, C, b, actions]
    using! selected

/-- Every contraction edge in the canonical recursive fuel phase is selected
by the response-aware bare-term selector. -/
theorem fuel_responseSelectorChain
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (continuation : Term) (admissible : Carrier.Admissible continuation) :
    ∀ fuel depth,
      RootResetExactTraceAgreement.SelectorChain
        (RootResetPersistentResponseSelector.selectStep? program layout)
        (fuelPhaseSourceConfiguration program layout registers fuel
          (environmentCode (compileActions program layout.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program layout.tree) bits)
            continuation depth []))
        (SchedulerNestedPhase.fuelConfigurationsAt program layout bits registers
          continuation [] fuel depth)
  | 0, depth => by
      let environment :=
        environmentCode (compileActions program layout.tree) bits
      let parents :=
        PrimitiveFuel.pendingParents environment continuation depth []
      let first := fuelZeroFirstMutationConfiguration program layout registers
        environment continuation parents
      let second := fuelZeroSecondMutationConfiguration program layout registers
        environment continuation parents
      let third := fuelZeroThirdMutationConfiguration program layout registers
        environment continuation parents
      let fourth := fuelZeroFourthMutationConfiguration program layout registers
        environment continuation parents
      let fifth := fuelZeroFifthMutationConfiguration program layout registers
        environment continuation parents
      have sourceFirst := fuelZeroScriptSource_response_selects_first program
        layout bits registers depth continuation admissible
      have phaseSourceFirst :
          RootResetPersistentResponseSelector.selectStep? program layout
              (fuelPhaseSourceConfiguration program layout registers 0
                environment continuation parents).cursor.erase =
            some first.cursor.erase := by
        simpa [fuelPhaseSourceConfiguration, fuelZeroScriptSourceConfiguration,
          environment, parents, first] using sourceFirst
      have firstSecond := fuelZeroFirst_response_selects_second program layout
        bits registers depth continuation admissible
      have secondThird := fuelZeroSecond_response_selects_third program layout
        bits registers depth continuation admissible
      have thirdFourth := fuelZeroThird_response_selects_fourth program layout
        bits registers depth continuation admissible
      have fourthFifth := fuelZeroFourth_response_selects_fifth program layout
        bits registers depth continuation admissible
      have chain : RootResetExactTraceAgreement.SelectorChain
          (RootResetPersistentResponseSelector.selectStep? program layout)
          (fuelPhaseSourceConfiguration program layout registers 0
            environment continuation parents)
          [first, second, third, fourth, fifth] :=
        .next phaseSourceFirst
          (.next firstSecond
            (.next secondThird
              (.next thirdFourth
                (.next fourthFifth (.done fifth)))))
      simpa [SchedulerNestedPhase.fuelConfigurationsAt,
        fuelPhaseSourceConfiguration, fuelZeroScriptSourceConfiguration,
        environment, parents, first, second, third, fourth, fifth] using chain
  | fuel + 1, depth => by
      let environment :=
        environmentCode (compileActions program layout.tree) bits
      let parents :=
        PrimitiveFuel.pendingParents environment continuation depth []
      let nextParents :=
        PrimitiveFuel.pendingParents environment continuation (depth + 1) []
      let source := fuelPhaseSourceConfiguration program layout registers
        (fuel + 1) environment continuation parents
      let first := fuelPositiveFirstMutationConfiguration program layout registers
        fuel environment continuation parents
      let second := fuelPositiveSecondMutationConfiguration program layout registers
        fuel environment continuation parents
      let nextSource := fuelPhaseSourceConfiguration program layout registers fuel
        environment continuation nextParents
      have sourceFirst := fuelPositiveScriptSource_response_selects_first program
        layout bits registers fuel depth continuation admissible
      have phaseSourceFirst :
          RootResetPersistentResponseSelector.selectStep? program layout
              (fuelPhaseSourceConfiguration program layout registers (fuel + 1)
                environment continuation parents).cursor.erase =
            some first.cursor.erase := by
        simpa [fuelPhaseSourceConfiguration,
          fuelPositiveScriptSourceConfiguration, environment, parents, first]
          using sourceFirst
      have firstSecond := fuelPositiveFirst_response_selects_second program layout
        bits registers fuel depth continuation admissible
      have suffixRaw := fuelPositiveSampleSuffix_zeroRun program layout registers
        fuel environment continuation parents
      have parentEq :
          .right (.app environment continuation) :: parents = nextParents := by
        simpa [parents, nextParents] using
          (SchedulerCycle.pendingParents_succ_cons environment continuation depth
            []).symm
      rw [parentEq] at suffixRaw
      have suffix : ZeroMutationRun (SchedulerControl.machine program layout) 2
          second nextSource := by
        simpa [second, nextSource] using suffixRaw
      have tail := fuel_responseSelectorChain program layout bits registers
        continuation admissible fuel (depth + 1)
      have linked := RootResetExactTraceAgreement.SelectorChain.prepend suffix tail
      have chain : RootResetExactTraceAgreement.SelectorChain
          (RootResetPersistentResponseSelector.selectStep? program layout) source
          (first :: second ::
            SchedulerNestedPhase.fuelConfigurationsAt program layout bits
              registers continuation [] fuel (depth + 1)) :=
        .next phaseSourceFirst (.next firstSecond linked)
      simpa [SchedulerNestedPhase.fuelConfigurationsAt,
        fuelPhaseSourceConfiguration, source,
        fuelPositiveScriptSourceConfiguration, first, second, environment,
        parents, nextParents] using chain

/-- The response-aware selector certifies the complete root clock, launch, and
recursive-fuel segment of every positive stage. -/
theorem clockLaunchFuel_responseSelectorChain
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (clockRegisters : SchedulerControl.Registers program)
    (fuel : Nat) :
    RootResetExactTraceAgreement.SelectorChain
      (RootResetPersistentResponseSelector.selectStep? program layout)
      (clockPhaseSourceConfiguration program layout clockRegisters
        [.left (environmentCode
          (compileActions program layout.tree) bits)] (fuel + 1))
      (SchedulerNestedPhase.positiveStageConfigurationsAt program layout
        bits clockRegisters [] fuel) := by
  let environment :=
    environmentCode (compileActions program layout.tree) bits
  let continuation := Dovetail.clockExit (fuel + 1) fuel environment
  let clockList := SchedulerNestedPhase.clockConfigurationsAt program layout
    bits clockRegisters [] fuel
  let clockTerminal := clockPhaseCompletedConfiguration
    program layout clockRegisters (fuel + 1) [.left environment]
  let launch := SchedulerNestedPhase.positiveStageLaunchConfigurationAt program
    layout fuel environment []
  let fuelList := SchedulerNestedPhase.fuelConfigurationsAt program layout
    bits (SchedulerControl.Registers.newJob program) continuation [] (fuel + 1) 0
  have clockSelected := clock_responseSelectorChain program layout bits
    clockRegisters fuel
  have clockExact := SchedulerNestedPhase.clockExactMutationChainAt program
    layout bits clockRegisters [] fuel
  have launchRaw := clockLaunch_response_selectStep? program layout
    clockRegisters fuel bits
  have launchSelected :
      RootResetPersistentResponseSelector.selectStep? program layout
          clockTerminal.cursor.erase = some launch.cursor.erase := by
    simpa [clockTerminal, launch,
      SchedulerNestedPhase.positiveStageLaunchConfigurationAt,
      positiveStageLaunchConfiguration,
      clockPhaseCompleted_erase, clockLaunchTerm,
      Dovetail.clockExit, environment] using! launchRaw
  have fuelSelectedRaw := fuel_responseSelectorChain program layout bits
    (SchedulerControl.Registers.newJob program) continuation
    (Dovetail.clockExit_admissible (fuel + 1) fuel environment)
    (fuel + 1) 0
  have fuelSelected : RootResetExactTraceAgreement.SelectorChain
      (RootResetPersistentResponseSelector.selectStep? program layout)
      launch fuelList := by
    simpa [launch, fuelList,
      SchedulerNestedPhase.positiveStageLaunchConfigurationAt,
      continuation, environment] using! fuelSelectedRaw
  have postClock : RootResetExactTraceAgreement.SelectorChain
      (RootResetPersistentResponseSelector.selectStep? program layout)
      clockTerminal (launch :: fuelList) :=
    .next launchSelected fuelSelected
  have complete := RootResetExactTraceAgreement.SelectorChain.append
    clockExact clockSelected postClock
  simpa [SchedulerNestedPhase.positiveStageConfigurationsAt, clockList,
    fuelList, launch, continuation, environment] using complete

end PureSFormal.Research.RootResetResponseClockFuelAgreement
