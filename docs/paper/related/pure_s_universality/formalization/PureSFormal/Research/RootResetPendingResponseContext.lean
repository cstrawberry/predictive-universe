import PureSFormal.Research.RootResetEmptyRouteSelectorChain

/-!
# Pending contexts around fresh responses

The response traversal crosses literal pending frames even when an unfinished
dispatcher row is absent from the core stage registry.  Any earlier stop of
the core traversal retains only pending roles and cannot create a fresh or
marked continuation priority.
-/

namespace PureSFormal.Research.RootResetPendingResponseContext

open PureSFormal.PureS
open RootResetClockFuelStages
open RootResetClockFuelCanonicalGrammar
open RootResetWrappedFrameSelectorProof
open RootResetEmptyRouteSelectorChain
open RootResetPersistentResponseSelector

theorem pending_shell_ne_canonicalCarrier
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (outerBits bits : List Bool) (outerContinuation continuation carrier dispatcherTerm : Term)
    (count : Nat) (layers : List PendingLayer) (base : OpenBaseView)
    (canonical : CanonicalFuelView (compileActions program dispatcher.tree) ⟨layers, .carrier base⟩) :
    pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (shell bits continuation carrier dispatcherTerm) ≠
      FuelView.term (compileActions program dispatcher.tree) ⟨layers, .carrier base⟩ := by
  induction count generalizing layers with
  | zero =>
      intro source
      cases layers with
      | nil =>
          have boundary := congrArg (fun t => (t.subterm? [.left, .right]).map Term.headArity) source
          simp [pending, shell, Carrier.activeShell, Carrier.shell,
            FuelView.term, FuelEndpoint.term, pendingContext, OpenBaseView.term,
            CheckpointDecoder.openEnvironment, Term.subterm?] at boundary
      | cons layer layers =>
          have arity := congrArg Term.headArity source
          simp [pending, shell, Carrier.activeShell, Carrier.shell, freshHField,
            haltCode, b, FuelView.term, pendingContext_cons, Context.plug, frame,
            canonical.layers.1.1, CheckpointDecoder.openEnvironment] at arity
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
          have childEq : pending (compileActions program dispatcher.tree) outerBits
              outerContinuation count (shell bits continuation carrier dispatcherTerm) =
            FuelView.term (compileActions program dispatcher.tree) ⟨layers, .carrier base⟩ :=
            (Term.app.inj source).2
          exact ih layers ⟨canonical.layers.2, canonical.endpoint⟩ childEq

theorem pending_shell_fuel_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (outerBits bits : List Bool) (outerContinuation continuation carrier dispatcherTerm : Term)
    (count : Nat) :
    RootResetPersistentFuelCarrier.parse? (compileActions program dispatcher.tree)
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (shell bits continuation carrier dispatcherTerm)) = none := by
  cases accepted : RootResetPersistentFuelCarrier.parse? (compileActions program dispatcher.tree)
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (shell bits continuation carrier dispatcherTerm)) with
  | none => rfl
  | some view =>
      have valid := RootResetPersistentFuelCarrier.parse?_sound accepted
      exact False.elim (pending_shell_ne_canonicalCarrier program dispatcher outerBits bits
        outerContinuation continuation carrier dispatcherTerm count view.layers view.base
        valid.canonical valid.source)

theorem shell_stops
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier dispatcherTerm : Term)
    (freshNone : RootResetPersistentRouteA.parseFreshNonempty? program dispatcher.tree
      (shell bits continuation carrier dispatcherTerm) = none) :
    let source := shell bits continuation carrier dispatcherTerm
    RootResetPersistentRouteA.next? program dispatcher source = none ∧
      responseDescentContext program dispatcher source = ⟨source, .hole, [], [], []⟩ := by
  dsimp only
  let source := shell bits continuation carrier dispatcherTerm
  have markedNone : RootResetReachableStageGrammar.parseMarkedLocal? program dispatcher.tree source = none :=
    RootResetWholeDispatcherSelectedHandoff.parseMarkedLocal?_fresh_openShell_none
      program dispatcher.tree carrier dispatcherTerm (word bits) carrier continuation carrier
  have frameNone : RootResetReachableStageGrammar.parseFrameR0?
      (compileActions program dispatcher.tree) source = none := by
    cases parsed : RootResetReachableStageGrammar.parseFrameR0?
        (compileActions program dispatcher.tree) source with
    | none => rfl
    | some view =>
        have arity := congrArg Term.headArity
          (RootResetReachableStageGrammar.parseFrameR0?_sound parsed)
        simp [source, shell, Carrier.activeShell, Carrier.shell, freshHField,
          haltCode, b, frame, environmentCode, dispatcherCode] at arity
  have pendingNone : RootResetStageRegistry.parsePending? source = none := by
    apply PendingFrame.guard?_none_of_function_headArity_ne_two
    change 5 ≠ 2
    decide
  constructor
  · rw [RootResetPersistentRouteA.next?, markedNone, freshNone]
    simp only [RootResetPersistentRouteA.parsePendingActive?, frameNone]
    rfl
  · rw [responseDescentContext, markedNone, freshNone, pendingNone]

theorem responseDescent_pending
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation term : Term)
    (stopped : responseDescentContext program dispatcher term = ⟨term, .hole, [], [], []⟩)
    (count : Nat) :
    responseDescentContext program dispatcher
      (pending (compileActions program dispatcher.tree) bits continuation count term) =
      pendingOuter program (compileActions program dispatcher.tree) bits continuation term count := by
  induction count with
  | zero => exact stopped
  | succ count ih =>
      have localNone := frame_local_none program dispatcher bits continuation
        (pending (compileActions program dispatcher.tree) bits continuation count term)
      have markedNone : RootResetReachableStageGrammar.parseMarkedLocal? program dispatcher.tree
          (pending (compileActions program dispatcher.tree) bits continuation (count + 1) term) = none := by
        rw [pending, RootResetReachableStageGrammar.parseMarkedLocal?, localNone]
      have freshNone : RootResetPersistentRouteA.parseFreshNonempty? program dispatcher.tree
          (pending (compileActions program dispatcher.tree) bits continuation (count + 1) term) = none := by
        rw [pending, RootResetPersistentRouteA.parseFreshNonempty?, localNone]
      have pendingSome := (RootResetStageRegistry.pendingFrame_frameR0_overlap
        (compileActions program dispatcher.tree) bits continuation
        (pending (compileActions program dispatcher.tree) bits continuation count term)).1
      change RootResetStageRegistry.parsePending?
          (pending (compileActions program dispatcher.tree) bits continuation (count + 1) term) =
        some (pending (compileActions program dispatcher.tree) bits continuation count term) at pendingSome
      rw [responseDescentContext, markedNone, freshNone, pendingSome]
      dsimp only
      rw [ih]
      rfl

def frameStep (program : CTS.Program) (actions : Term) (bits : List Bool)
    (continuation child : Term) : RootResetPersistentRouteA.OuterStep program :=
  ⟨.pendingFrameChild, [], child,
    .appRight (.app (environmentCode actions bits) continuation) .hole, [.right]⟩

theorem next_frame_cases
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation child : Term) :
    let source := frame (environmentCode (compileActions program dispatcher.tree) bits) continuation child
    RootResetPersistentRouteA.next? program dispatcher source = none ∨
      RootResetPersistentRouteA.next? program dispatcher source =
        some (frameStep program (compileActions program dispatcher.tree) bits continuation child) := by
  dsimp only
  have localNone := frame_local_none program dispatcher bits continuation child
  cases parsed : RootResetTwentySevenStageRegistry.parse? program dispatcher child with
  | none =>
      left
      simp only [RootResetPersistentRouteA.next?,
        RootResetReachableStageGrammar.parseMarkedLocal?, localNone,
        RootResetPersistentRouteA.parseFreshNonempty?,
        RootResetPersistentRouteA.parsePendingActive?,
        RootResetReachableStageGrammar.parseFrameR0?_generated, parsed]
      rfl
  | some view =>
      cases eligible : RootResetPersistentRouteA.nestedEligible view.stage with
      | false =>
          left
          simp only [RootResetPersistentRouteA.next?,
            RootResetReachableStageGrammar.parseMarkedLocal?, localNone,
            RootResetPersistentRouteA.parseFreshNonempty?,
            RootResetPersistentRouteA.parsePendingActive?,
            RootResetReachableStageGrammar.parseFrameR0?_generated, parsed, eligible]
          rfl
      | true =>
          right
          exact next_frame_of_registry program dispatcher bits continuation child
            ⟨view, parsed, eligible⟩

/-- Core traversal may stop before the response shell, but every traversed
role is pending and the fuel-aware traversal makes exactly the same stops. -/
theorem pending_traversal
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (outerBits bits : List Bool) (outerContinuation continuation carrier dispatcherTerm : Term)
    (stopped : RootResetPersistentRouteA.next? program dispatcher
      (shell bits continuation carrier dispatcherTerm) = none) (count : Nat) :
    let source := pending (compileActions program dispatcher.tree) outerBits outerContinuation count
      (shell bits continuation carrier dispatcherTerm)
    ∃ remaining crossed,
      (RootResetPersistentRouteA.activeContext program dispatcher source).active =
        pending (compileActions program dispatcher.tree) outerBits outerContinuation remaining
          (shell bits continuation carrier dispatcherTerm) ∧
      (RootResetPersistentRouteA.activeContext program dispatcher source).roles =
        List.replicate crossed .pendingFrameChild ∧
      RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher source =
        RootResetPersistentRouteA.activeContext program dispatcher source := by
  dsimp only
  induction count with
  | zero =>
      have fuelNone := shell_fuel_none program dispatcher bits continuation carrier dispatcherTerm
      refine ⟨0, 0, ?_, ?_, ?_⟩
      · rw [pending, RootResetPersistentRouteA.activeContext, stopped]
      · rw [pending, RootResetPersistentRouteA.activeContext, stopped]
        rfl
      · rw [pending, RootResetPersistentRouteAFuel.fuelActiveContext, fuelNone, stopped,
          RootResetPersistentRouteA.activeContext, stopped]
  | succ count ih =>
      let child := pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (shell bits continuation carrier dispatcherTerm)
      let source := frame (environmentCode (compileActions program dispatcher.tree) outerBits)
        outerContinuation child
      have fuelNone := pending_shell_fuel_none program dispatcher outerBits bits outerContinuation
        continuation carrier dispatcherTerm (count + 1)
      obtain stoppedHere | found := next_frame_cases program dispatcher outerBits outerContinuation child
      · refine ⟨count + 1, 0, ?_, ?_, ?_⟩
        · rw [pending, RootResetPersistentRouteA.activeContext, stoppedHere]
        · rw [pending, RootResetPersistentRouteA.activeContext, stoppedHere]
          rfl
        · rw [RootResetPersistentRouteAFuel.fuelActiveContext, fuelNone]
          dsimp only
          rw [pending, stoppedHere, RootResetPersistentRouteA.activeContext, stoppedHere]
      · obtain ⟨remaining, crossed, activeEq, rolesEq, fuelEq⟩ := ih
        refine ⟨remaining, crossed + 1, ?_, ?_, ?_⟩
        · rw [pending, RootResetPersistentRouteA.activeContext, found]
          exact activeEq
        · rw [pending, RootResetPersistentRouteA.activeContext, found]
          change RootResetPersistentRouteA.Role.pendingFrameChild ::
              (RootResetPersistentRouteA.activeContext program dispatcher child).roles = _
          rw [rolesEq]
          rfl
        · rw [RootResetPersistentRouteAFuel.fuelActiveContext, fuelNone]
          dsimp only
          rw [pending, found, RootResetPersistentRouteA.activeContext, found]
          dsimp only [frameStep]
          rw [fuelEq]

theorem compose_wrapOuter
    (step : RootResetPersistentRouteA.OuterStep program)
    (inner finalContext : RootResetPersistentRouteA.ActiveContext program) :
    composeActiveContexts (RootResetPersistentRouteA.wrapOuter step inner) finalContext =
      RootResetPersistentRouteA.wrapOuter step (composeActiveContexts inner finalContext) := by
  simp only [composeActiveContexts, RootResetPersistentRouteA.wrapOuter,
    RootResetRuntimeContextBridge.context_comp_assoc, List.cons_append, List.append_assoc]

theorem responseOuter_pending_shell
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (outerBits bits : List Bool) (outerContinuation continuation carrier dispatcherTerm : Term)
    (stopped : RootResetPersistentRouteA.next? program dispatcher
      (shell bits continuation carrier dispatcherTerm) = none)
    (descent : responseDescentContext program dispatcher
      (shell bits continuation carrier dispatcherTerm) =
        ⟨shell bits continuation carrier dispatcherTerm, .hole, [], [], []⟩)
    (count : Nat) :
    responseOuter program dispatcher
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (shell bits continuation carrier dispatcherTerm)) =
      pendingOuter program (compileActions program dispatcher.tree) outerBits outerContinuation
        (shell bits continuation carrier dispatcherTerm) count := by
  induction count with
  | zero =>
      rw [pending, responseOuter, RootResetPersistentRouteAFuel.fuelActiveContext,
        shell_fuel_none, stopped]
      dsimp only
      rw [descent]
      rfl
  | succ count ih =>
      let child := pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (shell bits continuation carrier dispatcherTerm)
      have fuelNone := pending_shell_fuel_none program dispatcher outerBits bits outerContinuation
        continuation carrier dispatcherTerm (count + 1)
      obtain stoppedHere | found := next_frame_cases program dispatcher outerBits outerContinuation child
      · rw [responseOuter, RootResetPersistentRouteAFuel.fuelActiveContext, fuelNone]
        dsimp only
        rw [pending, stoppedHere]
        change composeActiveContexts _ (responseDescentContext program dispatcher
          (pending (compileActions program dispatcher.tree) outerBits outerContinuation (count + 1)
            (shell bits continuation carrier dispatcherTerm))) = _
        rw [responseDescent_pending program dispatcher outerBits outerContinuation _ descent]
        rfl
      · rw [responseOuter, RootResetPersistentRouteAFuel.fuelActiveContext, fuelNone]
        dsimp only
        rw [pending, found]
        change composeActiveContexts
          (RootResetPersistentRouteA.wrapOuter
            (frameStep program (compileActions program dispatcher.tree) outerBits outerContinuation child)
            (RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher child))
          (responseDescentContext program dispatcher
            (RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher child).active) = _
        rw [compose_wrapOuter]
        change RootResetPersistentRouteA.wrapOuter
          (frameStep program (compileActions program dispatcher.tree) outerBits outerContinuation child)
          (responseOuter program dispatcher child) = _
        dsimp only [child]
        rw [ih]
        rfl

/-- Shared context and priority facts for any fresh response that has not
entered its continuation.  Registry membership is not a hypothesis. -/
theorem pending_shell_contexts
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (outerBits bits : List Bool) (outerContinuation continuation carrier dispatcherTerm : Term)
    (freshNone : RootResetPersistentRouteA.parseFreshNonempty? program dispatcher.tree
      (shell bits continuation carrier dispatcherTerm) = none) (count : Nat) :
    let source := pending (compileActions program dispatcher.tree) outerBits outerContinuation count
      (shell bits continuation carrier dispatcherTerm)
    responseOuter program dispatcher source =
        pendingOuter program (compileActions program dispatcher.tree) outerBits outerContinuation
          (shell bits continuation carrier dispatcherTerm) count ∧
      (RootResetPersistentRouteAFuel.classifyHandoff program dispatcher source).fuel = none ∧
      freshResponseRoot? program dispatcher source = none ∧
      markedHandoffSelection? program dispatcher source = none := by
  dsimp only
  obtain ⟨stopped, descent⟩ := shell_stops program dispatcher bits continuation carrier dispatcherTerm freshNone
  obtain ⟨remaining, crossed, activeEq, rolesEq, fuelEq⟩ := pending_traversal program dispatcher
    outerBits bits outerContinuation continuation carrier dispatcherTerm stopped count
  refine ⟨responseOuter_pending_shell program dispatcher outerBits bits outerContinuation
    continuation carrier dispatcherTerm stopped descent count, ?_, ?_, ?_⟩
  · rw [RootResetPersistentRouteAFuel.classifyHandoff, fuelEq]
    rw [activeEq, pending_shell_fuel_none]
  · rw [freshResponseRoot?]
    rw [rolesEq, RootResetResponseClockFuelAgreement.addressBeforeFresh?_replicate_pendingFrameChild]
    rfl
  · rw [markedHandoffSelection?]
    rw [rolesEq, RootResetResponseClockFuelAgreement.addressBeforePendingMarked?_replicate_pendingFrameChild]
    rfl

/-- A completed marked history adds its exact context to the recovered fresh
response; it does not introduce a stale response or handoff priority. -/
theorem marked_pending_shell_contexts
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (outerBits bits : List Bool) (outerContinuation continuation carrier dispatcherTerm : Term)
    (freshNone : RootResetPersistentRouteA.parseFreshNonempty? program dispatcher.tree
      (shell bits continuation carrier dispatcherTerm) = none) (count : Nat)
    {whole : Term} {context : Context} {history : List (CheckpointDecoder.LocalView program)}
    (shape : RootResetReachableStageGrammar.MarkedPrefix program dispatcher.tree whole
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (shell bits continuation carrier dispatcherTerm)) context history) :
    responseOuter program dispatcher whole =
        RootResetMarkedFrameSelectorProof.prependMarked context history
          (pendingOuter program (compileActions program dispatcher.tree) outerBits outerContinuation
            (shell bits continuation carrier dispatcherTerm) count) ∧
      (RootResetPersistentRouteAFuel.classifyHandoff program dispatcher whole).fuel = none ∧
      freshResponseRoot? program dispatcher whole = none ∧
      markedHandoffSelection? program dispatcher whole = none := by
  obtain ⟨stopped, descent⟩ := shell_stops program dispatcher bits continuation carrier dispatcherTerm freshNone
  obtain ⟨remaining, crossed, activeEq, rolesEq, fuelEq⟩ := pending_traversal program dispatcher
    outerBits bits outerContinuation continuation carrier dispatcherTerm stopped count
  refine ⟨?_, ?_, ?_, ?_⟩
  · rw [RootResetMarkedFrameSelectorProof.responseOuter_markedPrefix shape,
      responseOuter_pending_shell program dispatcher outerBits bits outerContinuation
        continuation carrier dispatcherTerm stopped descent count]
  · rw [RootResetPersistentRouteAFuel.classifyHandoff,
      RootResetMarkedFrameSelectorProof.fuelActiveContext_markedPrefix shape]
    dsimp only [RootResetMarkedFrameSelectorProof.prependMarked]
    rw [fuelEq, activeEq, pending_shell_fuel_none]
  · rw [freshResponseRoot?, RootResetMarkedFrameSelectorProof.activeContext_markedPrefix shape]
    dsimp only [RootResetMarkedFrameSelectorProof.prependMarked]
    rw [rolesEq, RootResetMarkedFrameSelectorProof.noFresh_marked_pending]
    rfl
  · rw [markedHandoffSelection?, RootResetMarkedFrameSelectorProof.activeContext_markedPrefix shape]
    dsimp only [RootResetMarkedFrameSelectorProof.prependMarked]
    rw [rolesEq, RootResetMarkedFrameSelectorProof.noPendingMarked_marked_pending]
    rfl

end PureSFormal.Research.RootResetPendingResponseContext
