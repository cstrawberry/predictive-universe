import PureSFormal.Research.RootResetEmptyResponseSelectorChain

/-!
# FRAME residuals below pending parents

The pending-frame traversal reaches the active FRAME residual through every
generated pending depth.  The supporting exclusions follow the canonical
fuel grammar and the literal arities of the frame rows.
-/

namespace PureSFormal.Research.RootResetWrappedFrameSelectorProof

open PureSFormal.PureS
open RootResetClockFuelStages
open RootResetClockFuelCanonicalGrammar
open RootResetCompositeStageRegistry

def pending (actions : Term) (bits : List Bool) (continuation : Term) : Nat → Term → Term
  | 0, term => term
  | count + 1, term => frame (environmentCode actions bits) continuation
      (pending actions bits continuation count term)

theorem pending_rebuild (actions : Term) (bits : List Bool)
    (continuation term : Term) (count : Nat) :
    pending actions bits continuation count term =
      Cursor.rebuild (PrimitiveFuel.pendingParents (environmentCode actions bits)
        continuation count []) term := by
  rw [PrimitiveFuel.rebuild_pendingParents]
  induction count with
  | zero => rfl
  | succ count ih => exact congrArg (frame (environmentCode actions bits) continuation) ih

theorem frame_local_none (program : CTS.Program)
    (dispatcher : ActionDispatcher program) (bits : List Bool)
    (continuation term : Term) :
    CheckpointDecoder.parseLocal? program dispatcher.tree
      (frame (environmentCode (compileActions program dispatcher.tree) bits)
        continuation term) = none := by
  apply CheckpointDecoder.parseLocal?_none_of_headArity
  · change 3 ≠ 5
    decide
  · change 3 ≠ 6
    decide

/-- Adding a literal pending frame cannot turn an excluded active residual
into canonical fuel syntax. -/
theorem canonicalFuel_none_frame
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation term : Term)
    (innerNone : parseCanonicalFuelActive?
      (compileActions program dispatcher.tree) term = none) :
    parseCanonicalFuelActive? (compileActions program dispatcher.tree)
      (frame (environmentCode (compileActions program dispatcher.tree) bits)
        continuation term) = none := by
  cases parsed : parseCanonicalFuelActive? (compileActions program dispatcher.tree)
      (frame (environmentCode (compileActions program dispatcher.tree) bits)
        continuation term) with
  | none => rfl
  | some view =>
      obtain ⟨source, canonical⟩ := parseCanonicalFuelActive?_sound parsed
      rcases view with ⟨layers, endpoint⟩
      cases layers with
      | nil =>
          cases endpoint with
          | row row =>
              have noPending := RootResetResponseClockFuelAgreement.parsePending?_canonicalFuelRow_none
                program dispatcher row canonical.endpoint
              have hasPending := (RootResetStageRegistry.pendingFrame_frameR0_overlap
                (compileActions program dispatcher.tree) bits continuation term).1
              change frame _ _ _ = row.term at source
              rw [source, noPending] at hasPending
              contradiction
          | carrier base =>
              have admissible := canonical.endpoint.1
              have arity := congrArg Term.headArity source
              rcases admissible with three | four
              · simp [FuelView.term, FuelEndpoint.term, pendingContext,
                  OpenBaseView.term, frame, environmentCode, three] at arity
              · simp [FuelView.term, FuelEndpoint.term, pendingContext,
                  OpenBaseView.term, frame, environmentCode, four] at arity
      | cons layer layers =>
          have childEq : term = FuelView.term (compileActions program dispatcher.tree)
              ⟨layers, endpoint⟩ := by
            change Term.app _ term = Term.app _ _ at source
            exact (Term.app.inj source).2
          have innerCanonical : CanonicalFuelView (compileActions program dispatcher.tree)
              ⟨layers, endpoint⟩ := ⟨canonical.layers.2, canonical.endpoint⟩
          have innerParsed := parseCanonicalFuelActive?_complete childEq innerCanonical
          rw [innerNone] at innerParsed
          contradiction

theorem canonicalFuel_none_pending
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation term : Term)
    (innerNone : parseCanonicalFuelActive?
      (compileActions program dispatcher.tree) term = none) (count : Nat) :
    parseCanonicalFuelActive? (compileActions program dispatcher.tree)
      (pending (compileActions program dispatcher.tree) bits continuation count term) =
      none := by
  induction count with
  | zero => exact innerNone
  | succ count ih => exact canonicalFuel_none_frame program dispatcher bits continuation _ ih

/-- The registry always recognizes an exact pending frame with an eligible
stage, regardless of whether its detailed or core branch succeeds. -/
theorem registry_frame_exists
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation term : Term) :
    ∃ view, RootResetTwentySevenStageRegistry.parse? program dispatcher
        (frame (environmentCode (compileActions program dispatcher.tree) bits)
          continuation term) = some view ∧
      RootResetPersistentRouteA.nestedEligible view.stage = true := by
  let source := frame (environmentCode (compileActions program dispatcher.tree) bits)
    continuation term
  cases composite : RootResetCompositeStageRegistry.parse? program dispatcher source with
  | some view =>
      refine ⟨.registered view, ?_, rfl⟩
      rw [RootResetTwentySevenStageRegistry.parse?, composite]
  | none =>
      have notLocal := frame_local_none program dispatcher bits continuation term
      have notMarked : RootResetReachableStageGrammar.parseMarkedLocal? program
          dispatcher.tree source = none := by
        rw [RootResetReachableStageGrammar.parseMarkedLocal?, notLocal]
      have peeled : RootResetReachableStageGrammar.peelMarked program dispatcher.tree
          source = ⟨source, .hole, []⟩ := by
        rw [RootResetReachableStageGrammar.peelMarked, notMarked]
      let core : RootResetTwentySevenStageRegistry.CoreView program :=
        ⟨⟨source, .hole, [],
          ⟨.frameR0, term, some [.right], CTS.zeroPhase program,
            bits.head?, some bits, none, none⟩⟩, .frameR0⟩
      refine ⟨.core core, ?_, rfl⟩
      rw [RootResetTwentySevenStageRegistry.parse?, composite,
        RootResetTwentySevenStageRegistry.parseCore?,
        RootResetWholeStageClassifier.endpointDecomposition, peeled]
      dsimp only
      rw [RootResetWholeStageClassifier.classifyActive_frameR0 program dispatcher.tree
        [] bits continuation term notLocal]
      rfl

/-- The value used to recognize the child does not affect the pending step's
cursor address or child field. -/
theorem next_frame_of_registry
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation term : Term)
    (registered : ∃ view, RootResetTwentySevenStageRegistry.parse? program dispatcher
        term = some view ∧ RootResetPersistentRouteA.nestedEligible view.stage = true) :
    let source := frame (environmentCode (compileActions program dispatcher.tree) bits)
      continuation term
    RootResetPersistentRouteA.next? program dispatcher source =
      some ⟨.pendingFrameChild, [], term,
        .appRight (.app (environmentCode (compileActions program dispatcher.tree) bits)
          continuation) .hole, [.right]⟩ := by
  dsimp only
  obtain ⟨view, parsed, eligible⟩ := registered
  have notLocal := frame_local_none program dispatcher bits continuation term
  rw [RootResetPersistentRouteA.next?, RootResetReachableStageGrammar.parseMarkedLocal?,
    notLocal]
  dsimp only
  rw [RootResetPersistentRouteA.parseFreshNonempty?, notLocal]
  dsimp only
  rw [RootResetPersistentRouteA.parsePendingActive?,
    RootResetReachableStageGrammar.parseFrameR0?_generated]
  dsimp only
  rw [parsed]
  dsimp only
  rw [eligible]
  rfl

def pendingOuter (program : CTS.Program) (actions : Term) (bits : List Bool)
    (continuation term : Term) (count : Nat) : RootResetPersistentRouteA.ActiveContext program :=
  ⟨term, pendingContext (List.replicate count
    (RootResetPersistentFuelCarrier.generatedLayer actions bits continuation)),
    rights count, List.replicate count .pendingFrameChild, []⟩

theorem registry_pending_exists
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation term : Term)
    (registered : ∃ view, RootResetTwentySevenStageRegistry.parse? program dispatcher
        term = some view ∧ RootResetPersistentRouteA.nestedEligible view.stage = true)
    (count : Nat) :
    ∃ view, RootResetTwentySevenStageRegistry.parse? program dispatcher
        (pending (compileActions program dispatcher.tree) bits continuation count term) =
          some view ∧ RootResetPersistentRouteA.nestedEligible view.stage = true := by
  cases count with
  | zero => exact registered
  | succ count => exact registry_frame_exists program dispatcher bits continuation _

theorem activeContext_pending
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation term : Term)
    (stopped : RootResetPersistentRouteA.next? program dispatcher term = none)
    (registered : ∃ view, RootResetTwentySevenStageRegistry.parse? program dispatcher
        term = some view ∧ RootResetPersistentRouteA.nestedEligible view.stage = true)
    (count : Nat) :
    RootResetPersistentRouteA.activeContext program dispatcher
      (pending (compileActions program dispatcher.tree) bits continuation count term) =
        pendingOuter program (compileActions program dispatcher.tree) bits
          continuation term count := by
  induction count with
  | zero =>
      change RootResetPersistentRouteA.activeContext program dispatcher term = _
      rw [RootResetPersistentRouteA.activeContext, stopped]
      rfl
  | succ count ih =>
      rw [pending, RootResetPersistentRouteA.activeContext,
        next_frame_of_registry program dispatcher bits continuation _
          (registry_pending_exists program dispatcher bits continuation term registered count)]
      dsimp only
      rw [ih]
      rfl

theorem fuelActiveContext_pending
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation term : Term)
    (stopped : RootResetPersistentRouteA.next? program dispatcher term = none)
    (registered : ∃ view, RootResetTwentySevenStageRegistry.parse? program dispatcher
        term = some view ∧ RootResetPersistentRouteA.nestedEligible view.stage = true)
    (canonicalNone : parseCanonicalFuelActive?
      (compileActions program dispatcher.tree) term = none)
    (count : Nat) :
    RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher
      (pending (compileActions program dispatcher.tree) bits continuation count term) =
        pendingOuter program (compileActions program dispatcher.tree) bits
          continuation term count := by
  have fuelNone (n : Nat) : RootResetPersistentFuelCarrier.parse?
      (compileActions program dispatcher.tree)
      (pending (compileActions program dispatcher.tree) bits continuation n term) = none := by
    rw [RootResetPersistentFuelCarrier.parse?,
      canonicalFuel_none_pending program dispatcher bits continuation term canonicalNone n]
  induction count with
  | zero =>
      rw [RootResetPersistentRouteAFuel.fuelActiveContext, fuelNone 0]
      dsimp only
      simp only [pending]
      rw [stopped]
      rfl
  | succ count ih =>
      rw [RootResetPersistentRouteAFuel.fuelActiveContext, fuelNone (count + 1)]
      dsimp only
      simp only [pending]
      rw [next_frame_of_registry program dispatcher bits continuation _
        (registry_pending_exists program dispatcher bits continuation term registered count)]
      dsimp only
      rw [ih]
      rfl

theorem responseOuter_pending
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation term : Term)
    (stopped : RootResetPersistentRouteA.next? program dispatcher term = none)
    (registered : ∃ view, RootResetTwentySevenStageRegistry.parse? program dispatcher
        term = some view ∧ RootResetPersistentRouteA.nestedEligible view.stage = true)
    (canonicalNone : parseCanonicalFuelActive?
      (compileActions program dispatcher.tree) term = none)
    (descent : RootResetPersistentResponseSelector.responseDescentContext program dispatcher
      term = ⟨term, .hole, [], [], []⟩)
    (count : Nat) :
    RootResetPersistentResponseSelector.responseOuter program dispatcher
      (pending (compileActions program dispatcher.tree) bits continuation count term) =
        pendingOuter program (compileActions program dispatcher.tree) bits
          continuation term count := by
  rw [RootResetPersistentResponseSelector.responseOuter,
    fuelActiveContext_pending program dispatcher bits continuation term stopped registered
      canonicalNone count]
  dsimp only [pendingOuter]
  rw [descent]
  unfold RootResetPersistentResponseSelector.composeActiveContexts
  simp only [RootResetRuntimeContextBridge.context_comp_hole, List.append_nil]

theorem prioritiesClear_of_recoveredOuter
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (source : Term) (outer : RootResetPersistentRouteA.ActiveContext program)
    (outerEq : RootResetPersistentResponseSelector.responseOuter program dispatcher source = outer)
    (activeEq : RootResetPersistentRouteA.activeContext program dispatcher source = outer)
    (localNone : CheckpointDecoder.parseLocal? program dispatcher.tree outer.active = none)
    (notSix : outer.active.headArity ≠ 6) (notTwo : outer.active.headArity ≠ 2)
    (noFresh : RootResetPersistentResponseSelector.addressBeforeFresh? outer.roles = none)
    (noPendingMarked : RootResetPersistentResponseSelector.addressBeforePendingMarked? outer.roles = none) :
    RootResetResponseClockFuelAgreement.PrioritiesClear program dispatcher source := by
  rcases outer with ⟨term, context, address, roles, history⟩
  dsimp only at localNone notSix notTwo noFresh noPendingMarked
  have freshNone : RootResetPersistentResponseSelector.freshResponseRoot? program
      dispatcher source = none := by
    rw [RootResetPersistentResponseSelector.freshResponseRoot?, activeEq]
    dsimp only
    rw [noFresh]
    rfl
  have dispatcherAddressNone : RootResetPersistentResponseSelector.currentCarrierDispatcherAddress?
      program dispatcher source = none := by
    rw [RootResetPersistentResponseSelector.currentCarrierDispatcherAddress?, outerEq]
    dsimp only
    split
    next haltField dispatcherTerm seedPayload seedAudit nextContinuation
        continuationAudit =>
      cases haltEq : RootResetWholeDispatcherStages.parseFreshHalt? haltField with
      | none => rfl
      | some audit =>
          have haltSource := RootResetWholeDispatcherStages.parseFreshHalt?_sound haltEq
          apply False.elim
          apply notSix
          rw [haltSource]
          rfl
    next => rfl
  have actionAddressNone : RootResetPersistentResponseSelector.selectedActionAddress?
      program dispatcher source = none := by
    rw [RootResetPersistentResponseSelector.selectedActionAddress?, outerEq]
    dsimp only
    split
    next haltField dispatcherTerm seedPayload seedAudit nextContinuation
        continuationAudit =>
      cases haltEq : RootResetWholeDispatcherStages.parseFreshHalt? haltField with
      | none => rfl
      | some audit =>
          have haltSource := RootResetWholeDispatcherStages.parseFreshHalt?_sound haltEq
          apply False.elim
          apply notSix
          rw [haltSource]
          rfl
    next => rfl
  have appenderNone : RootResetWholeAppenderStages.parseActive? program dispatcher.tree
      term = none := by
    cases parsed : RootResetWholeAppenderStages.parseActive? program dispatcher.tree term with
    | none => rfl
    | some view =>
        have shape := RootResetWholeAppenderStages.parseActive?_sound parsed
        rcases shape.source_eq with
          ⟨haltField, dispatcherTerm, seedAudit, continuationAudit, halt, route, sourceEq⟩
        cases halt with
        | fresh audit =>
            apply False.elim
            apply notSix
            rw [sourceEq]
            rfl
  have noActivated : (RootResetWholeStageClassifier.classify program dispatcher.tree term).endpoint.stage ≠
      .activatedRoute := by
    have notMarked : RootResetReachableStageGrammar.parseMarkedLocal? program
        dispatcher.tree term = none := by
      rw [RootResetReachableStageGrammar.parseMarkedLocal?, localNone]
    have peeled : RootResetReachableStageGrammar.peelMarked program dispatcher.tree term =
        ⟨term, .hole, []⟩ := by
      rw [RootResetReachableStageGrammar.peelMarked, notMarked]
    intro classified
    rw [RootResetWholeStageClassifier.classify, peeled] at classified
    obtain ⟨route, parsed, _⟩ := RootResetWholeStageClassifier.classifyActive_activatedRoute_sound
      program dispatcher.tree [] term classified
    exact notTwo (DispatchParser.parseRouteDetailed_sound parsed).result_headArity
  constructor
  · rw [RootResetPersistentResponseSelector.freshDispatcherSelection?, outerEq]
    dsimp only
    cases parsed : RootResetPersistentResponseSelector.parseFreshDispatcherCall?
        program dispatcher.tree term with
    | false => rfl
    | true => exact False.elim (notSix
        (RootResetResponseClockFuelAgreement.parseFreshDispatcherCall?_headArity_six parsed))
  · rw [RootResetPersistentResponseSelector.responseAppenderSelection?,
      RootResetPersistentResponseSelector.responseAppenderAddress?, freshNone]
    rfl
  · rw [RootResetPersistentResponseSelector.responseCarrierSelection?,
      RootResetPersistentResponseSelector.responseCarrierAddress?, freshNone]
    rfl
  · rw [RootResetPersistentResponseSelector.responseBoundarySelection?,
      RootResetPersistentResponseSelector.responseBoundaryAddress?,
      RootResetResponseClockFuelAgreement.completedResponseAddress?_none_of_outer_parseLocal_none
        outerEq localNone, freshNone]
    rfl
  · rw [RootResetPersistentResponseSelector.markedHandoffSelection?, activeEq]
    dsimp only
    rw [noPendingMarked]
    rfl
  · rw [RootResetPersistentResponseSelector.dispatcherSelection?, dispatcherAddressNone]
    rfl
  · rw [RootResetPersistentResponseSelector.selectedActionSelection?, actionAddressNone]
    rfl
  · rw [RootResetPersistentResponseSelector.appenderSelection?, outerEq]
    dsimp only
    rw [appenderNone]
    rfl
  · rw [RootResetPersistentResponseSelector.activatedRouteSelection?,
      RootResetPersistentResponseSelector.activatedRouteAddress?, outerEq]
    dsimp only
    rw [if_neg noActivated]
    rfl

theorem prioritiesClear_pending
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation term : Term)
    (stopped : RootResetPersistentRouteA.next? program dispatcher term = none)
    (registered : ∃ view, RootResetTwentySevenStageRegistry.parse? program dispatcher
        term = some view ∧ RootResetPersistentRouteA.nestedEligible view.stage = true)
    (canonicalNone : parseCanonicalFuelActive?
      (compileActions program dispatcher.tree) term = none)
    (descent : RootResetPersistentResponseSelector.responseDescentContext program dispatcher
      term = ⟨term, .hole, [], [], []⟩)
    (localNone : CheckpointDecoder.parseLocal? program dispatcher.tree term = none)
    (notSix : term.headArity ≠ 6) (notTwo : term.headArity ≠ 2)
    (count : Nat) :
    RootResetResponseClockFuelAgreement.PrioritiesClear program dispatcher
      (pending (compileActions program dispatcher.tree) bits continuation count term) := by
  exact prioritiesClear_of_recoveredOuter program dispatcher _
    (pendingOuter program (compileActions program dispatcher.tree) bits continuation term count)
    (responseOuter_pending program dispatcher bits continuation term stopped registered canonicalNone descent count)
    (activeContext_pending program dispatcher bits continuation term stopped registered count)
    localNone notSix notTwo
    (RootResetResponseClockFuelAgreement.addressBeforeFresh?_replicate_pendingFrameChild count)
    (RootResetResponseClockFuelAgreement.addressBeforePendingMarked?_replicate_pendingFrameChild count)

theorem pendingContext_plug
    (actions : Term) (bits : List Bool) (continuation term : Term) (count : Nat) :
    (pendingContext (List.replicate count
      (RootResetPersistentFuelCarrier.generatedLayer actions bits continuation))).plug term =
      pending actions bits continuation count term := by
  induction count with
  | zero => rfl
  | succ count ih =>
      change frame (environmentCode actions bits) continuation
        ((pendingContext (List.replicate count
          (RootResetPersistentFuelCarrier.generatedLayer actions bits continuation))).plug term) = _
      rw [ih]
      rfl

theorem pending_contractAt
    (actions : Term) (bits : List Bool) (continuation : Term)
    {term target : Term} {address : Address}
    (contracts : term.contractAt? address = some target) (count : Nat) :
    (pending actions bits continuation count term).contractAt? (rights count ++ address) =
      some (pending actions bits continuation count target) := by
  have lifted := RootResetWholeStageClassifier.contractAt?_plug_append
    (pendingContext (List.replicate count
      (RootResetPersistentFuelCarrier.generatedLayer actions bits continuation)))
    address contracts
  simpa only [pendingContext_address, List.length_replicate, pendingContext_plug]
    using lifted

theorem routeAddress_pending
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation term : Term)
    (stopped : RootResetPersistentRouteA.next? program dispatcher term = none)
    (registered : ∃ view, RootResetTwentySevenStageRegistry.parse? program dispatcher
        term = some view ∧ RootResetPersistentRouteA.nestedEligible view.stage = true)
    (address : Address)
    (selected : (RootResetPersistentRouteA.classify program dispatcher term).selectedAddress? =
      some address) (count : Nat) :
    (RootResetPersistentRouteA.classify program dispatcher
      (pending (compileActions program dispatcher.tree) bits continuation count term)).selectedAddress? =
        some (rights count ++ address) := by
  have rootActive : RootResetPersistentRouteA.activeContext program dispatcher term =
      ⟨term, .hole, [], [], []⟩ := by
    rw [RootResetPersistentRouteA.activeContext, stopped]
  rw [RootResetPersistentRouteA.classify, rootActive] at selected
  rw [RootResetPersistentRouteA.classify,
    activeContext_pending program dispatcher bits continuation term stopped registered count]
  dsimp only [pendingOuter] at selected ⊢
  generalize resultEq : ((RootResetTwentySevenStageRegistry.parse? program dispatcher term).bind
    fun view => RootResetPersistentRouteA.verifiedCandidate? term
      (RootResetPersistentRouteA.endpointCandidate? program dispatcher.tree term view)) = result
      at selected ⊢
  cases result with
  | none => contradiction
  | some found =>
      have addressEq : found = address := Option.some.inj selected
      rw [addressEq]
      rfl

theorem selectStep?_pending
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation term target : Term) (address : Address)
    (stopped : RootResetPersistentRouteA.next? program dispatcher term = none)
    (registered : ∃ view, RootResetTwentySevenStageRegistry.parse? program dispatcher
        term = some view ∧ RootResetPersistentRouteA.nestedEligible view.stage = true)
    (canonicalNone : parseCanonicalFuelActive?
      (compileActions program dispatcher.tree) term = none)
    (descent : RootResetPersistentResponseSelector.responseDescentContext program dispatcher
      term = ⟨term, .hole, [], [], []⟩)
    (localNone : CheckpointDecoder.parseLocal? program dispatcher.tree term = none)
    (notSix : term.headArity ≠ 6) (notTwo : term.headArity ≠ 2)
    (selected : (RootResetPersistentRouteA.classify program dispatcher term).selectedAddress? =
      some address)
    (contracts : term.contractAt? address = some target)
    (count : Nat) :
    RootResetPersistentResponseSelector.selectStep? program dispatcher
      (pending (compileActions program dispatcher.tree) bits continuation count term) =
        some (pending (compileActions program dispatcher.tree) bits continuation count target) := by
  have clear := prioritiesClear_pending program dispatcher bits continuation term
    stopped registered canonicalNone descent localNone notSix notTwo count
  rw [RootResetResponseClockFuelAgreement.selectStep?_eq_persistent_of_prioritiesClear clear]
  have fuelNone : RootResetPersistentFuelCarrier.parse?
      (compileActions program dispatcher.tree) term = none := by
    rw [RootResetPersistentFuelCarrier.parse?, canonicalNone]
  unfold RootResetPersistentSelector.selectStep? RootResetPersistentSelector.selection?
    RootResetPersistentRouteAFuel.classifyHandoff
  rw [fuelActiveContext_pending program dispatcher bits continuation term stopped registered
    canonicalNone count]
  dsimp only [pendingOuter]
  rw [fuelNone]
  dsimp only
  rw [routeAddress_pending program dispatcher bits continuation term stopped registered address
    selected count]
  unfold RootResetPersistentRouteAFuel.checkedSelection?
  dsimp only
  rw [pending_contractAt _ bits continuation contracts count]
  rfl

theorem registry_frameSecond_exists
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    ∃ view, RootResetTwentySevenStageRegistry.parse? program dispatcher
        (SchedulerResponseInvariant.frameSecondRoot
          (compileActions program dispatcher.tree) bits continuation carrier) = some view ∧
      RootResetPersistentRouteA.nestedEligible view.stage = true := by
  let source := SchedulerResponseInvariant.frameSecondRoot
    (compileActions program dispatcher.tree) bits continuation carrier
  let endpoint := RootResetWholeStageClassifier.classifyActive program dispatcher.tree [] source
  let core : RootResetTwentySevenStageRegistry.CoreView program :=
    ⟨⟨source, .hole, [], endpoint⟩, .frameR2⟩
  refine ⟨.core core, ?_, rfl⟩
  rw [RootResetTwentySevenStageRegistry.parse?,
    RootResetFrameSecondSelectorProof.compositeParse_frameSecond_none,
    RootResetTwentySevenStageRegistry.parseCore?,
    RootResetWholeStageClassifier.endpointDecomposition,
    RootResetFrameSecondSelectorProof.peelMarked_frameSecond]
  dsimp only
  dsimp only [core, source, endpoint]
  rw [RootResetFrameSecondSelectorProof.classifyActive_frameSecond]
  rfl

/-- Every first FRAME residual selects its second residual beneath any number
of literal pending frames; no parser-priority condition is supplied. -/
theorem selectStep?_pending_frameFirst
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (outerBits bits : List Bool) (outerContinuation continuation carrier : Term)
    (count : Nat) :
    let actions := compileActions program dispatcher.tree
    RootResetPersistentResponseSelector.selectStep? program dispatcher
      (pending actions outerBits outerContinuation count
        (SchedulerResponseInvariant.frameFirstRoot actions bits continuation carrier)) =
      some (pending actions outerBits outerContinuation count
        (SchedulerResponseInvariant.frameSecondRoot actions bits continuation carrier)) := by
  dsimp only
  apply selectStep?_pending program dispatcher outerBits outerContinuation _ _ [.left]
  · exact RootResetFrameFirstSelectorProof.first_next_none program dispatcher bits continuation carrier
  · exact ⟨_, RootResetFrameFirstSelectorProof.first_registry program dispatcher bits continuation carrier,
      rfl⟩
  · exact RootResetFrameFirstSelectorProof.first_canonicalFuel_none program dispatcher bits continuation carrier
  · exact RootResetFrameFirstSelectorProof.first_responseDescentContext program dispatcher bits continuation carrier
  · exact RootResetFrameFirstSelectorProof.first_local_none program dispatcher bits continuation carrier
  · change 4 ≠ 6
    decide
  · change 4 ≠ 2
    decide
  · exact RootResetFrameFirstSelectorProof.first_route_selectedAddress program dispatcher bits continuation carrier
  · exact (RootResetResponseSampleParserBridge.frameFirst_parses_and_contracts
      program dispatcher.tree bits continuation carrier).2

/-- Every second FRAME residual selects the fresh Local shell beneath any
number of literal pending frames, with all competing priorities excluded. -/
theorem selectStep?_pending_frameSecond
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (outerBits bits : List Bool) (outerContinuation continuation carrier : Term)
    (count : Nat) :
    let actions := compileActions program dispatcher.tree
    RootResetPersistentResponseSelector.selectStep? program dispatcher
      (pending actions outerBits outerContinuation count
        (SchedulerResponseInvariant.frameSecondRoot actions bits continuation carrier)) =
      some (pending actions outerBits outerContinuation count
        (freshLocal actions bits continuation carrier)) := by
  dsimp only
  apply selectStep?_pending program dispatcher outerBits outerContinuation _ _ [.left, .left]
  · exact RootResetFrameSecondSelectorProof.next_frameSecond_none program dispatcher bits continuation carrier
  · exact registry_frameSecond_exists program dispatcher bits continuation carrier
  · exact RootResetFrameSecondSelectorProof.parseCanonicalFuelActive_frameSecond_none
      program dispatcher bits continuation carrier
  · exact RootResetFrameSecondSelectorProof.responseDescentContext_frameSecond
      program dispatcher bits continuation carrier
  · exact RootResetFrameSecondSelectorProof.parseLocal_frameSecond_none program dispatcher bits continuation carrier
  · change 5 ≠ 6
    decide
  · change 5 ≠ 2
    decide
  · exact RootResetFrameSecondSelectorProof.route_selectedAddress_frameSecond
      program dispatcher bits continuation carrier
  · exact RootResetFrameSecondSelectorProof.frameSecond_contract program dispatcher bits continuation carrier

/-- The two wrapped residual equations apply to the first three literal
samples of the exact EMPTY response compiler, for every pending depth. -/
theorem emptyResponse_frameResiduals_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program)
    (outerBits bits : List Bool) (outerContinuation continuation carrier : Term)
    (count : Nat) :
    let actions := compileActions program dispatcher.tree
    let parents := PrimitiveFuel.pendingParents (environmentCode actions outerBits)
      outerContinuation count []
    ∃ first second third tail,
      SchedulerResponseInvariant.ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerEmpty.markStartConfiguration program dispatcher registers bits continuation carrier parents)
        (SchedulerEmpty.responseStartConfiguration program dispatcher registers bits continuation carrier parents)
        (first :: second :: third :: tail) ∧
      first.cursor.erase = Cursor.rebuild parents
        (SchedulerResponseInvariant.frameFirstRoot actions bits continuation carrier) ∧
      second.cursor.erase = Cursor.rebuild parents
        (SchedulerResponseInvariant.frameSecondRoot actions bits continuation carrier) ∧
      third.cursor.erase = Cursor.rebuild parents (freshLocal actions bits continuation carrier) ∧
      RootResetExactTraceAgreement.SelectorChain
        (RootResetPersistentResponseSelector.selectStep? program dispatcher) first [second, third] := by
  dsimp only
  let parents := PrimitiveFuel.pendingParents
    (environmentCode (compileActions program dispatcher.tree) outerBits)
    outerContinuation count []
  obtain ⟨samples, chain, paired⟩ := SchedulerNestedEmpty.emptyResponse_exactPairedMutationChain
    program dispatcher registers bits continuation carrier parents
  change SchedulerNestedEmpty.EmptyResponseSamplePairs program dispatcher registers bits
    continuation carrier parents samples
      ((false, SchedulerResponseInvariant.frameFirstRoot
        (compileActions program dispatcher.tree) bits continuation carrier) ::
       (false, SchedulerResponseInvariant.frameSecondRoot
        (compileActions program dispatcher.tree) bits continuation carrier) ::
       (false, freshLocal (compileActions program dispatcher.tree) bits continuation carrier) :: _) at paired
  cases paired with
  | cons pc1 cursor1 done1 term1 position1 erase1 root1 tail1 =>
      cases tail1 with
      | cons pc2 cursor2 done2 term2 position2 erase2 root2 tail2 =>
          cases tail2 with
          | cons pc3 cursor3 done3 term3 position3 erase3 root3 tail3 =>
              refine ⟨_, _, _, _, chain, erase1, erase2, erase3,
                .next ?_ (.next ?_ (.done _))⟩
              · change RootResetPersistentResponseSelector.selectStep? program dispatcher
                  cursor1.erase = some cursor2.erase
                rw [erase1, erase2]
                simpa only [pending_rebuild] using selectStep?_pending_frameFirst program dispatcher
                  outerBits bits outerContinuation continuation carrier count
              · change RootResetPersistentResponseSelector.selectStep? program dispatcher
                  cursor2.erase = some cursor3.erase
                rw [erase2, erase3]
                simpa only [pending_rebuild] using selectStep?_pending_frameSecond program dispatcher
                  outerBits bits outerContinuation continuation carrier count

end PureSFormal.Research.RootResetWrappedFrameSelectorProof
