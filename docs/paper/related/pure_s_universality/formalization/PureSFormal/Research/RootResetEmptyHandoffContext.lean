import PureSFormal.Research.RootResetWrappedEmptyCommit

/-!
# Clock continuations after EMPTY marking

The generated clock exit remains a canonical clock for every residual job
count.  A marked response surrounding that exit is a registered child of its
pending frame, including the final exit into the next positive clock stage.
-/

namespace PureSFormal.Research.RootResetEmptyHandoffContext

open PureSFormal.PureS
open RootResetPersistentResponseSelector
open RootResetReachableStageGrammar
open RootResetClockFuelStages
open RootResetClockFuelCanonicalGrammar
open RootResetPersistentClockFuelAgreement
open RootResetWrappedFrameSelectorProof
open RootResetMarkedFrameSelectorProof
open RootResetPendingResponseContext

def exitTerm (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (horizon remaining : Nat) (bits : List Bool) : Term :=
  Dovetail.clockExit horizon remaining
    (environmentCode (compileActions program dispatcher.tree) bits)

def exitView (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (horizon : Nat) (bits : List Bool) : Nat → ClockView
  | 0 => clockFirstView program dispatcher horizon bits
  | remaining + 1 => ⟨.launch, horizon, 0, remaining + 1,
      environmentCode (compileActions program dispatcher.tree) bits⟩

theorem exitTerm_eq_view
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (horizon remaining : Nat) (bits : List Bool) :
    exitTerm program dispatcher horizon remaining bits =
      (exitView program dispatcher horizon bits remaining).term := by
  cases remaining <;> rfl

theorem exitView_canonical
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (horizon remaining : Nat) (bits : List Bool) (bound : remaining ≤ horizon) :
    CanonicalClock (compileActions program dispatcher.tree)
      (exitView program dispatcher horizon bits remaining) := by
  cases remaining with
  | zero => exact clockFirstView_canonical program dispatcher horizon bits
  | succ remaining =>
      exact ⟨⟨rfl, Nat.zero_lt_succ remaining, bound⟩,
        environmentCode_openField (compileActions program dispatcher.tree) bits⟩

theorem exit_local_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (horizon remaining : Nat) (bits : List Bool) :
    CheckpointDecoder.parseLocal? program dispatcher.tree
      (exitTerm program dispatcher horizon remaining bits) = none := by
  cases remaining with
  | zero => exact parseLocal?_clockFirst_none program dispatcher horizon bits
  | succ remaining =>
      exact CheckpointDecoder.parseLocal?_nonterminalExit_none program dispatcher.tree
        horizon remaining (environmentCode (compileActions program dispatcher.tree) bits)

theorem exit_frame_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (horizon remaining : Nat) (bits : List Bool) :
    parseFrameR0? (compileActions program dispatcher.tree)
      (exitTerm program dispatcher horizon remaining bits) = none := by
  cases remaining with
  | zero => exact parseFrameR0?_clockFirst_none program dispatcher horizon bits
  | succ remaining =>
      simp [exitTerm, Dovetail.clockExit, clockWrappers, parseFrameR0?,
        parseEnvironment?_appS_C_none]

theorem exit_next_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (horizon remaining : Nat) (bits : List Bool) :
    RootResetPersistentRouteA.next? program dispatcher
      (exitTerm program dispatcher horizon remaining bits) = none := by
  simp only [RootResetPersistentRouteA.next?, parseMarkedLocal?, exit_local_none,
    RootResetPersistentRouteA.parseFreshNonempty?,
    RootResetPersistentRouteA.parsePendingActive?, exit_frame_none]
  rfl

theorem exit_pending_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (horizon remaining : Nat) (bits : List Bool) :
    RootResetStageRegistry.parsePending?
      (exitTerm program dispatcher horizon remaining bits) = none := by
  cases remaining with
  | zero =>
      exact RootResetResponseClockFuelAgreement.parsePending?_clockFirst_none
        program dispatcher horizon bits
  | succ remaining =>
      unfold RootResetStageRegistry.parsePending?
      generalize guardedEq : PendingFrame.guard?
        (exitTerm program dispatcher horizon (remaining + 1) bits) [.right] = guarded
      cases guarded with
      | none => rfl
      | some child =>
          have functionMatches := (PendingFrame.guard?_sound guardedEq).function_matches
          change Pattern.Matches (.app PendingFrame.envelopePattern .hole)
            (.app (.app .s (C horizon)) (clockWrappers horizon remaining)) at functionMatches
          cases functionMatches with
          | app envelopeMatches _ =>
              change Pattern.Matches (.app .s PendingFrame.envelopeSlotPattern) _ at envelopeMatches
              cases envelopeMatches with
              | app _ slotMatches =>
                  exact (RootResetResponseClockFuelAgreement.envelopeSlotPattern_not_C horizon slotMatches).elim

theorem exit_fuel_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (horizon remaining : Nat) (bits : List Bool) (bound : remaining ≤ horizon) :
    RootResetPersistentFuelCarrier.parse? (compileActions program dispatcher.tree)
      (exitTerm program dispatcher horizon remaining bits) = none :=
  parseFuelHandoff?_canonicalClock_none (exitTerm_eq_view program dispatcher horizon remaining bits)
    (exitView_canonical program dispatcher horizon remaining bits bound)

theorem exit_contexts
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (horizon remaining : Nat) (bits : List Bool) (bound : remaining ≤ horizon) :
    let term := exitTerm program dispatcher horizon remaining bits
    RootResetPersistentRouteA.activeContext program dispatcher term = ⟨term, .hole, [], [], []⟩ ∧
      RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher term = ⟨term, .hole, [], [], []⟩ ∧
      responseOuter program dispatcher term = ⟨term, .hole, [], [], []⟩ := by
  dsimp only
  have active : RootResetPersistentRouteA.activeContext program dispatcher
      (exitTerm program dispatcher horizon remaining bits) =
        ⟨exitTerm program dispatcher horizon remaining bits, .hole, [], [], []⟩ := by
    rw [RootResetPersistentRouteA.activeContext, exit_next_none]
  have fuel : RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher
      (exitTerm program dispatcher horizon remaining bits) =
        ⟨exitTerm program dispatcher horizon remaining bits, .hole, [], [], []⟩ := by
    rw [RootResetPersistentRouteAFuel.fuelActiveContext, exit_fuel_none program dispatcher horizon remaining bits bound,
      exit_next_none]
  refine ⟨active, fuel, ?_⟩
  rw [responseOuter, fuel]
  change composeActiveContexts _ (responseDescentContext program dispatcher _) = _
  rw [responseDescentContext, parseMarkedLocal?, exit_local_none,
    RootResetPersistentRouteA.parseFreshNonempty?, exit_local_none, exit_pending_none]
  rfl

/-- Any successful strict clock alternative ensures that the enclosing
registered parser returns an eligible stage, irrespective of earlier matches. -/
theorem registry_exists_of_clockFuel
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {term : Term} {clockView : RootResetCompositeStageRegistry.ClockFuelView program}
    (clock : RootResetCompositeStageRegistry.parseClockFuel? program dispatcher.tree term = some clockView) :
    ∃ view, RootResetTwentySevenStageRegistry.parse? program dispatcher term = some view ∧
      RootResetPersistentRouteA.nestedEligible view.stage = true := by
  have found : ∃ composite, RootResetCompositeStageRegistry.parse? program dispatcher term = some composite := by
    unfold RootResetCompositeStageRegistry.parse?
    cases RootResetWholeDispatcherStages.parse? program dispatcher term with
    | some view => exact ⟨_, rfl⟩
    | none =>
        cases RootResetWholeAppenderStages.parse? program dispatcher.tree term with
        | some view => exact ⟨_, rfl⟩
        | none =>
            cases RootResetResponseBoundaryStages.parse? program dispatcher.tree term with
            | some view => exact ⟨_, rfl⟩
            | none => rw [clock]; exact ⟨_, rfl⟩
  obtain ⟨composite, parsed⟩ := found
  refine ⟨.registered composite, ?_, rfl⟩
  rw [RootResetTwentySevenStageRegistry.parse?, parsed]

theorem markedExit_registry
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool)
    (bits : List Bool) (carrier : Term) (horizon remaining : Nat)
    (bound : remaining ≤ horizon) :
    let continuation := exitTerm program dispatcher horizon remaining bits
    let term := LocalResponse.markedCompleted bits continuation carrier
      (SchedulerResponse.completedRoute program dispatcher registers bit carrier)
    ∃ view, RootResetTwentySevenStageRegistry.parse? program dispatcher term = some view ∧
      RootResetPersistentRouteA.nestedEligible view.stage = true := by
  dsimp only
  have parsed := CheckpointDecoder.parseLocal?_markedCompleted
    (continuation := exitTerm program dispatcher horizon remaining bits) bits
    (SchedulerResponse.completedRoute_snapshotDispatch program dispatcher registers bit carrier)
  have stopped : parseMarkedLocal? program dispatcher.tree
      (exitTerm program dispatcher horizon remaining bits) = none := by
    rw [parseMarkedLocal?, exit_local_none]
  have marked : MarkedPrefix program dispatcher.tree _
      (exitTerm program dispatcher horizon remaining bits) _ _ :=
    .local parsed rfl (.here stopped)
  apply registry_exists_of_clockFuel (clockView :=
    ⟨_, _, _, .clock (exitView program dispatcher horizon bits remaining)⟩)
  apply RootResetCompositeStageRegistry.parseClockFuel?_complete
  exact ⟨marked, .clock _ _ (exitTerm_eq_view program dispatcher horizon remaining bits)
    (exitView_canonical program dispatcher horizon remaining bits bound)⟩

theorem pending_local_ne_canonicalCarrier
    {program : CTS.Program} (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation : Term)
    {term : Term} {localView : CheckpointDecoder.LocalView program}
    (shape : CheckpointDecoder.LocalShape program dispatcher.tree localView term)
    (count : Nat) (layers : List PendingLayer) (base : OpenBaseView)
    (canonical : CanonicalFuelView (compileActions program dispatcher.tree) ⟨layers, .carrier base⟩) :
    pending (compileActions program dispatcher.tree) bits continuation count term ≠
      FuelView.term (compileActions program dispatcher.tree) ⟨layers, .carrier base⟩ := by
  induction count generalizing layers with
  | zero =>
      intro source
      cases layers with
      | nil =>
          rcases shape with ⟨haltField, dispatcherTerm, seedAudit, continuationAudit,
            halt, dispatch, localEq⟩
          have same := source.symm.trans localEq
          have boundary := congrArg (fun t =>
            (t.subterm? [.left, .right]).map Term.headArity) same
          simp [pending, FuelView.term, FuelEndpoint.term, pendingContext, OpenBaseView.term,
            CheckpointDecoder.openShell, CheckpointDecoder.openEnvironment, Term.subterm?] at boundary
      | cons layer layers =>
          have localArity := CheckpointDecoder.parseLocal?_headArity
            (CheckpointDecoder.parseLocal?_complete shape)
          have arity := congrArg Term.headArity source
          simp only [pending] at arity
          simp [FuelView.term, pendingContext_cons, Context.plug, frame,
            canonical.layers.1.1, CheckpointDecoder.openEnvironment] at arity
          rcases localArity with five | six
          · rw [five] at arity
            contradiction
          · rw [six] at arity
            contradiction
  | succ count ih =>
      intro source
      cases layers with
      | nil =>
          have arity := congrArg Term.headArity source
          rcases canonical.endpoint.1 with three | four
          · simp [pending, frame, environmentCode, FuelView.term, FuelEndpoint.term,
              pendingContext, OpenBaseView.term, three] at arity
          · simp [pending, frame, environmentCode, FuelView.term, FuelEndpoint.term,
              pendingContext, OpenBaseView.term, four] at arity
      | cons layer layers =>
          exact ih layers ⟨canonical.layers.2, canonical.endpoint⟩ (Term.app.inj source).2

theorem pending_local_fuel_none
    {program : CTS.Program} (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation : Term)
    {term : Term} {localView : CheckpointDecoder.LocalView program}
    (shape : CheckpointDecoder.LocalShape program dispatcher.tree localView term)
    (count : Nat) :
    RootResetPersistentFuelCarrier.parse? (compileActions program dispatcher.tree)
      (pending (compileActions program dispatcher.tree) bits continuation count term) = none := by
  cases parsed : RootResetPersistentFuelCarrier.parse? (compileActions program dispatcher.tree)
      (pending (compileActions program dispatcher.tree) bits continuation count term) with
  | none => rfl
  | some view =>
      have valid := RootResetPersistentFuelCarrier.parse?_sound parsed
      exact False.elim (pending_local_ne_canonicalCarrier dispatcher bits continuation shape
        count view.layers view.base valid.canonical valid.source)

theorem activeContext_pending_lift
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation term : Term)
    (registered : ∃ view, RootResetTwentySevenStageRegistry.parse? program dispatcher
      term = some view ∧ RootResetPersistentRouteA.nestedEligible view.stage = true)
    (count : Nat) :
    RootResetPersistentRouteA.activeContext program dispatcher
      (pending (compileActions program dispatcher.tree) bits continuation count term) =
      composeActiveContexts
        (pendingOuter program (compileActions program dispatcher.tree) bits continuation term count)
        (RootResetPersistentRouteA.activeContext program dispatcher term) := by
  induction count with
  | zero => rfl
  | succ count ih =>
      rw [pending, RootResetPersistentRouteA.activeContext,
        next_frame_of_registry program dispatcher bits continuation _
          (registry_pending_exists program dispatcher bits continuation term registered count)]
      dsimp only
      rw [ih]
      rfl

theorem fuelActiveContext_pending_lift
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation term : Term)
    (registered : ∃ view, RootResetTwentySevenStageRegistry.parse? program dispatcher
      term = some view ∧ RootResetPersistentRouteA.nestedEligible view.stage = true)
    (fuelNone : ∀ count, RootResetPersistentFuelCarrier.parse? (compileActions program dispatcher.tree)
      (pending (compileActions program dispatcher.tree) bits continuation count term) = none)
    (count : Nat) :
    RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher
      (pending (compileActions program dispatcher.tree) bits continuation count term) =
      composeActiveContexts
        (pendingOuter program (compileActions program dispatcher.tree) bits continuation term count)
        (RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher term) := by
  induction count with
  | zero => rfl
  | succ count ih =>
      rw [RootResetPersistentRouteAFuel.fuelActiveContext, fuelNone (count + 1)]
      dsimp only
      simp only [pending]
      rw [next_frame_of_registry program dispatcher bits continuation _
        (registry_pending_exists program dispatcher bits continuation term registered count)]
      dsimp only
      rw [ih]
      rfl

theorem responseOuter_pending_lift
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation term : Term)
    (registered : ∃ view, RootResetTwentySevenStageRegistry.parse? program dispatcher
      term = some view ∧ RootResetPersistentRouteA.nestedEligible view.stage = true)
    (fuelNone : ∀ count, RootResetPersistentFuelCarrier.parse? (compileActions program dispatcher.tree)
      (pending (compileActions program dispatcher.tree) bits continuation count term) = none)
    (count : Nat) :
    responseOuter program dispatcher
      (pending (compileActions program dispatcher.tree) bits continuation count term) =
      composeActiveContexts
        (pendingOuter program (compileActions program dispatcher.tree) bits continuation term count)
        (responseOuter program dispatcher term) := by
  rw [responseOuter, fuelActiveContext_pending_lift program dispatcher bits continuation term registered fuelNone count]
  simp only [responseOuter, composeActiveContexts, RootResetRuntimeContextBridge.context_comp_assoc,
    List.append_assoc]

def markedExitTerm (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool)
    (bits : List Bool) (carrier : Term) (horizon remaining : Nat) : Term :=
  LocalResponse.markedCompleted bits (exitTerm program dispatcher horizon remaining bits) carrier
    (SchedulerResponse.completedRoute program dispatcher registers bit carrier)

def markedExitView (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool)
    (bits : List Bool) (carrier : Term) (horizon remaining : Nat) :
    CheckpointDecoder.LocalView program :=
  CheckpointDecoder.markedCompletedView program (dispatcher.route (registers.phase, bit))
    (registers.phase, bit) (actionAccumulator program (registers.phase, bit) carrier) bits
    (exitTerm program dispatcher horizon remaining bits)

def markedExitOuter (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool)
    (bits : List Bool) (carrier : Term) (horizon remaining : Nat) :
    RootResetPersistentRouteA.ActiveContext program :=
  ⟨exitTerm program dispatcher horizon remaining bits,
    localContinuationContext (markedExitTerm program dispatcher registers bit bits carrier horizon remaining),
    [.right, .left], [.markedContinuation],
    [markedExitView program dispatcher registers bit bits carrier horizon remaining]⟩

theorem markedExit_parsed
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool)
    (bits : List Bool) (carrier : Term) (horizon remaining : Nat) :
    CheckpointDecoder.parseLocal? program dispatcher.tree
      (markedExitTerm program dispatcher registers bit bits carrier horizon remaining) =
      some (markedExitView program dispatcher registers bit bits carrier horizon remaining) :=
  CheckpointDecoder.parseLocal?_markedCompleted bits
    (SchedulerResponse.completedRoute_snapshotDispatch program dispatcher registers bit carrier)

theorem exit_descent
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (horizon remaining : Nat) (bits : List Bool) :
    responseDescentContext program dispatcher (exitTerm program dispatcher horizon remaining bits) =
      ⟨exitTerm program dispatcher horizon remaining bits, .hole, [], [], []⟩ := by
  rw [responseDescentContext, parseMarkedLocal?, exit_local_none,
    RootResetPersistentRouteA.parseFreshNonempty?, exit_local_none, exit_pending_none]

theorem markedExit_contexts
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool)
    (bits : List Bool) (carrier : Term) (horizon remaining : Nat)
    (bound : remaining ≤ horizon) :
    let term := markedExitTerm program dispatcher registers bit bits carrier horizon remaining
    let outer := markedExitOuter program dispatcher registers bit bits carrier horizon remaining
    RootResetPersistentRouteA.activeContext program dispatcher term = outer ∧
      RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher term = outer ∧
      responseOuter program dispatcher term = outer := by
  dsimp only
  have parsed := markedExit_parsed program dispatcher registers bit bits carrier horizon remaining
  have marked : parseMarkedLocal? program dispatcher.tree
      (markedExitTerm program dispatcher registers bit bits carrier horizon remaining) =
      some (markedExitView program dispatcher registers bit bits carrier horizon remaining) := by
    rw [parseMarkedLocal?, parsed]
    rfl
  have boundary := exit_contexts program dispatcher horizon remaining bits bound
  have active : RootResetPersistentRouteA.activeContext program dispatcher
      (markedExitTerm program dispatcher registers bit bits carrier horizon remaining) =
      markedExitOuter program dispatcher registers bit bits carrier horizon remaining := by
    rw [RootResetPersistentRouteA.activeContext, RootResetPersistentRouteA.next?, marked]
    dsimp only [RootResetPersistentRouteA.markedStep, markedExitView, CheckpointDecoder.markedCompletedView]
    rw [boundary.1]
    simp only [RootResetPersistentRouteA.wrapOuter, RootResetRuntimeContextBridge.context_comp_hole,
      List.append_nil]
    rfl
  have fuel : RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher
      (markedExitTerm program dispatcher registers bit bits carrier horizon remaining) =
      markedExitOuter program dispatcher registers bit bits carrier horizon remaining := by
    rw [RootResetPersistentRouteAFuel.fuelActiveContext,
      RootResetEmptyResponseSelectorChain.fuelParse_none_of_localShape
        (CheckpointDecoder.parseLocal?_sound parsed)]
    dsimp only
    rw [RootResetPersistentRouteA.next?, marked]
    dsimp only [RootResetPersistentRouteA.markedStep, markedExitView, CheckpointDecoder.markedCompletedView]
    rw [boundary.2.1]
    simp only [RootResetPersistentRouteA.wrapOuter, RootResetRuntimeContextBridge.context_comp_hole,
      List.append_nil]
    rfl
  refine ⟨active, fuel, ?_⟩
  rw [responseOuter, fuel]
  dsimp only [markedExitOuter]
  rw [exit_descent]
  simp only [composeActiveContexts, RootResetRuntimeContextBridge.context_comp_hole, List.append_nil]

theorem marked_pending_exit_contexts
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool)
    (outerBits bits : List Bool) (outerContinuation carrier : Term)
    (horizon remaining : Nat) (bound : remaining ≤ horizon)
    (count : Nat) {whole : Term} {context : Context}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : MarkedPrefix program dispatcher.tree whole
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (markedExitTerm program dispatcher registers bit bits carrier horizon remaining)) context history) :
    let inner := markedExitOuter program dispatcher registers bit bits carrier horizon remaining
    let pendingOuterView := pendingOuter program (compileActions program dispatcher.tree)
      outerBits outerContinuation (markedExitTerm program dispatcher registers bit bits carrier horizon remaining) count
    let outer := prependMarked context history (composeActiveContexts pendingOuterView inner)
    RootResetPersistentRouteA.activeContext program dispatcher whole = outer ∧
      RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher whole = outer ∧
      responseOuter program dispatcher whole = outer := by
  dsimp only
  have registered := markedExit_registry program dispatcher registers bit bits carrier horizon remaining bound
  change ∃ view, RootResetTwentySevenStageRegistry.parse? program dispatcher
      (markedExitTerm program dispatcher registers bit bits carrier horizon remaining) = some view ∧
      RootResetPersistentRouteA.nestedEligible view.stage = true at registered
  have parsed := markedExit_parsed program dispatcher registers bit bits carrier horizon remaining
  have fuelNone := pending_local_fuel_none dispatcher outerBits outerContinuation
    (CheckpointDecoder.parseLocal?_sound parsed)
  have inner := markedExit_contexts program dispatcher registers bit bits carrier horizon remaining bound
  refine ⟨?_, ?_, ?_⟩
  · rw [activeContext_markedPrefix shape,
      activeContext_pending_lift program dispatcher outerBits outerContinuation _ registered count, inner.1]
  · rw [fuelActiveContext_markedPrefix shape,
      fuelActiveContext_pending_lift program dispatcher outerBits outerContinuation _ registered fuelNone count,
      inner.2.1]
  · rw [responseOuter_markedPrefix shape,
      responseOuter_pending_lift program dispatcher outerBits outerContinuation _ registered fuelNone count,
      inner.2.2]

end PureSFormal.Research.RootResetEmptyHandoffContext
