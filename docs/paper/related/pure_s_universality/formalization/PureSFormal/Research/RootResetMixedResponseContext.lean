import PureSFormal.Research.RootResetFreshNormalResponseChain

/-! Exact response traversal through arbitrary mixed completed histories. -/
namespace PureSFormal.Research.RootResetMixedResponseContext
open PureSFormal.PureS
open RootResetPersistentResponseSelector RootResetReachableStageGrammar
open RootResetMarkedFrameSelectorProof RootResetWrappedFrameSelectorProof
open RootResetFreshClockSelectorChain RootResetFreshResponseSelectorChain RootResetResponseClockFuelAgreement

inductive Prefix (program : CTS.Program) (dispatcher : ActionDispatcher program) :
    Term → Term → Context → List RootResetPersistentRouteA.Role →
      List (CheckpointDecoder.LocalView program) → Prop where
  | here (term : Term) : Prefix program dispatcher term term .hole [] []
  | fresh {term endpoint : Term} {context : Context}
      {roles : List RootResetPersistentRouteA.Role}
      {history : List (CheckpointDecoder.LocalView program)}
      {view : CheckpointDecoder.LocalView program}
      (parsed : CheckpointDecoder.parseLocal? program dispatcher.tree term = some view)
      (status : view.status = .fresh)
      (nonempty : ∃ first rest, CheckpointDecoder.decodeCarrier? program dispatcher.tree
        view.accumulator = some (first :: rest))
      (clean : RootResetAccumulatorClassifier.classify? view.accumulator = none)
      (inner : Prefix program dispatcher view.continuation endpoint context roles history) :
      Prefix program dispatcher term endpoint
        ((localContinuationContext term).comp context)
        (.freshNonemptyContinuation :: roles) (view :: history)
  | marked {term endpoint : Term} {context : Context}
      {roles : List RootResetPersistentRouteA.Role}
      {history : List (CheckpointDecoder.LocalView program)}
      {view : CheckpointDecoder.LocalView program}
      (parsed : CheckpointDecoder.parseLocal? program dispatcher.tree term = some view)
      (status : view.status = .marked)
      (inner : Prefix program dispatcher view.continuation endpoint context roles history) :
      Prefix program dispatcher term endpoint
        ((localContinuationContext term).comp context)
        (.markedContinuation :: roles) (view :: history)

def prepend (context : Context) (roles : List RootResetPersistentRouteA.Role)
    (history : List (CheckpointDecoder.LocalView program))
    (inner : RootResetPersistentRouteA.ActiveContext program) :
    RootResetPersistentRouteA.ActiveContext program :=
  ⟨inner.active, context.comp inner.context,
    RootResetSelectorContract.contextAddress context ++ inner.address,
    roles ++ inner.roles, history ++ inner.history⟩

theorem Prefix.contexts
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {whole endpoint : Term} {context : Context}
    {roles : List RootResetPersistentRouteA.Role}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : Prefix program dispatcher whole endpoint context roles history) :
    RootResetPersistentRouteA.activeContext program dispatcher whole =
      prepend context roles history (RootResetPersistentRouteA.activeContext program dispatcher endpoint) ∧
    RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher whole =
      prepend context roles history (RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher endpoint) ∧
    responseOuter program dispatcher whole =
      prepend context roles history (responseOuter program dispatcher endpoint) := by
  have traversals : RootResetPersistentRouteA.activeContext program dispatcher whole =
      prepend context roles history (RootResetPersistentRouteA.activeContext program dispatcher endpoint) ∧
    RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher whole =
      prepend context roles history (RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher endpoint) := by
    induction shape with
    | here term => exact ⟨rfl, rfl⟩
    | @fresh term endpoint context roles history view parsed status nonempty clean inner ih =>
        have markedNone : parseMarkedLocal? program dispatcher.tree term = none := by
          simp only [parseMarkedLocal?, parsed, status]
          rfl
        have freshSome : RootResetPersistentRouteA.parseFreshNonempty? program dispatcher.tree term = some view := by
          obtain ⟨first, rest, decoded⟩ := nonempty
          simp only [RootResetPersistentRouteA.parseFreshNonempty?, parsed, status, decoded]
        have next := RootResetPersistentRouteAFuel.next?_freshNonempty markedNone freshSome
        have fuelNone := RootResetEmptyResponseSelectorChain.fuelParse_none_of_localShape
          (CheckpointDecoder.parseLocal?_sound parsed)
        constructor
        · rw [RootResetPersistentRouteA.activeContext, next]
          dsimp only [RootResetPersistentRouteA.freshStep]
          rw [ih.1]
          simp only [RootResetPersistentRouteA.wrapOuter, prepend, List.cons_append, List.nil_append,
            RootResetRuntimeContextBridge.context_comp_assoc,
            RootResetSelectorContract.contextAddress_comp,
            RootResetPersistentRouteA.localContinuationContext_address_of_parseLocal? parsed,
            List.append_assoc]
        · rw [RootResetPersistentRouteAFuel.fuelActiveContext, fuelNone, next]
          dsimp only [RootResetPersistentRouteA.freshStep]
          rw [ih.2]
          simp only [RootResetPersistentRouteA.wrapOuter, prepend, List.cons_append, List.nil_append,
            RootResetRuntimeContextBridge.context_comp_assoc,
            RootResetSelectorContract.contextAddress_comp,
            RootResetPersistentRouteA.localContinuationContext_address_of_parseLocal? parsed,
            List.append_assoc]
    | @marked term endpoint context roles history view parsed status inner ih =>
        have markedSome : parseMarkedLocal? program dispatcher.tree term = some view := by
          simp only [parseMarkedLocal?, parsed, if_pos status]
        have next := RootResetPersistentRouteAFuel.next?_marked markedSome
        have fuelNone := RootResetEmptyResponseSelectorChain.fuelParse_none_of_localShape
          (CheckpointDecoder.parseLocal?_sound parsed)
        constructor
        · rw [RootResetPersistentRouteA.activeContext, next]
          dsimp only [RootResetPersistentRouteA.markedStep]
          rw [ih.1]
          simp only [RootResetPersistentRouteA.wrapOuter, prepend, List.cons_append, List.nil_append,
            RootResetRuntimeContextBridge.context_comp_assoc,
            RootResetSelectorContract.contextAddress_comp,
            RootResetPersistentRouteA.localContinuationContext_address_of_parseLocal? parsed,
            List.append_assoc]
        · rw [RootResetPersistentRouteAFuel.fuelActiveContext, fuelNone, next]
          dsimp only [RootResetPersistentRouteA.markedStep]
          rw [ih.2]
          simp only [RootResetPersistentRouteA.wrapOuter, prepend, List.cons_append, List.nil_append,
            RootResetRuntimeContextBridge.context_comp_assoc,
            RootResetSelectorContract.contextAddress_comp,
            RootResetPersistentRouteA.localContinuationContext_address_of_parseLocal? parsed,
            List.append_assoc]
  refine ⟨traversals.1, traversals.2, ?_⟩
  rw [responseOuter, traversals.2]
  simp only [responseOuter, composeActiveContexts, prepend,
    RootResetRuntimeContextBridge.context_comp_assoc, List.append_assoc]



theorem Prefix.source_eq
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {whole endpoint : Term} {context : Context}
    {roles : List RootResetPersistentRouteA.Role}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : Prefix program dispatcher whole endpoint context roles history) :
    context.plug endpoint = whole := by
  induction shape with
  | here term => rfl
  | fresh parsed status nonempty clean inner ih =>
      rw [Context.plug_comp, ih]
      exact localContinuationContext_plug parsed
  | marked parsed status inner ih =>
      rw [Context.plug_comp, ih]
      exact localContinuationContext_plug parsed

theorem Prefix.replace
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {whole endpoint : Term} {context : Context}
    {roles : List RootResetPersistentRouteA.Role}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : Prefix program dispatcher whole endpoint context roles history)
    (replacement : Term) :
    ∃ nextHistory, Prefix program dispatcher (context.plug replacement) replacement
      context roles nextHistory := by
  induction shape with
  | here term => exact ⟨[], .here replacement⟩
  | @fresh term endpoint context roles history view parsed status nonempty clean inner ih =>
      obtain ⟨targetHistory, targetPrefix⟩ := ih
      let innerTarget := context.plug replacement
      let targetView := RootResetResponseBoundaryStages.replaceContinuation view innerTarget
      let targetSource := (localContinuationContext term).plug innerTarget
      have targetShape := RootResetResponseBoundaryStages.localShape_replaceContinuation
        (CheckpointDecoder.parseLocal?_sound parsed) innerTarget
      have targetBoundary := CheckpointDecoder.parseLocal?_complete targetShape
      have contextEq : localContinuationContext targetSource = localContinuationContext term := by
        rcases CheckpointDecoder.parseLocal?_sound parsed with
          ⟨haltField, dispatcherTerm, seedAudit, continuationAudit, halt, dispatch, sourceEq⟩
        simp only [targetSource, sourceEq, localContinuationContext,
          CheckpointDecoder.openShell, Context.plug]
      have rebuilt := Prefix.fresh targetBoundary (show targetView.status = .fresh from status)
        (show ∃ first rest, CheckpointDecoder.decodeCarrier? program dispatcher.tree targetView.accumulator =
          some (first :: rest) from nonempty)
        (show RootResetAccumulatorClassifier.classify? targetView.accumulator = none from clean) targetPrefix
      rw [contextEq] at rebuilt
      exact ⟨targetView :: targetHistory, by simpa only [targetSource, innerTarget, Context.plug_comp] using rebuilt⟩
  | @marked term endpoint context roles history view parsed status inner ih =>
      obtain ⟨targetHistory, targetPrefix⟩ := ih
      let innerTarget := context.plug replacement
      let targetView := RootResetResponseBoundaryStages.replaceContinuation view innerTarget
      let targetSource := (localContinuationContext term).plug innerTarget
      have targetShape := RootResetResponseBoundaryStages.localShape_replaceContinuation
        (CheckpointDecoder.parseLocal?_sound parsed) innerTarget
      have targetBoundary := CheckpointDecoder.parseLocal?_complete targetShape
      have contextEq : localContinuationContext targetSource = localContinuationContext term := by
        rcases CheckpointDecoder.parseLocal?_sound parsed with
          ⟨haltField, dispatcherTerm, seedAudit, continuationAudit, halt, dispatch, sourceEq⟩
        simp only [targetSource, sourceEq, localContinuationContext,
          CheckpointDecoder.openShell, Context.plug]
      have rebuilt := Prefix.marked targetBoundary (show targetView.status = .marked from status) targetPrefix
      rw [contextEq] at rebuilt
      exact ⟨targetView :: targetHistory, by simpa only [targetSource, innerTarget, Context.plug_comp] using rebuilt⟩

theorem continuation_found {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program tree term = some view) :
    term.subterm? [.right, .left] = some view.continuation := by
  rcases CheckpointDecoder.parseLocal?_sound parsed with
    ⟨haltField, dispatcherTerm, seedAudit, continuationAudit, halt, dispatch, sourceEq⟩
  rw [sourceEq]
  simp only [CheckpointDecoder.openShell, Term.subterm?]

/-- Every historical fresh root selected by the literal role parser has a
clean nonempty accumulator, and no pending FRAME occurs before it. -/
theorem Prefix.fresh_witness
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {whole endpoint : Term} {context : Context}
    {roles : List RootResetPersistentRouteA.Role}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : Prefix program dispatcher whole endpoint context roles history) (count : Nat) :
    (addressBeforeFresh? (roles ++ List.replicate count .pendingFrameChild) = none ∧
      pendingBeforeFresh? (roles ++ List.replicate count .pendingFrameChild) = none) ∨
    ∃ (address : Address) (term : Term) (view : CheckpointDecoder.LocalView program),
      addressBeforeFresh? (roles ++ List.replicate count .pendingFrameChild) = some address ∧
      pendingBeforeFresh? (roles ++ List.replicate count .pendingFrameChild) = some 0 ∧
      whole.subterm? address = some term ∧
      CheckpointDecoder.parseLocal? program dispatcher.tree term = some view ∧
      view.status = .fresh ∧
      RootResetAccumulatorClassifier.classify? view.accumulator = none ∧
      ∃ first rest, CheckpointDecoder.decodeCarrier? program dispatcher.tree view.accumulator = some (first :: rest) := by
  induction shape with
  | here term =>
      exact .inl ⟨addressBeforeFresh?_replicate_pendingFrameChild count,
        RootResetFreshFuelSelectorChain.pendingBeforeFresh?_replicate_pending_none count⟩
  | @fresh term endpoint context roles history view parsed status nonempty clean inner ih =>
      rcases ih with ⟨addressNone, countNone⟩ | ⟨address, target, foundView, addressEq, countEq, found, localParsed, fresh, classifier, decoded⟩
      · exact .inr ⟨[], term, view, by simp only [List.cons_append, addressBeforeFresh?, addressNone],
          by simp only [List.cons_append, pendingBeforeFresh?, countNone], by simp only [Term.subterm?], parsed, status, clean, nonempty⟩
      · refine .inr ⟨[.right, .left] ++ address, target, foundView, ?_, ?_, ?_, localParsed, fresh, classifier, decoded⟩
        · simp only [List.cons_append, addressBeforeFresh?, addressEq]
        · simp only [List.cons_append, pendingBeforeFresh?, countEq]
        · rw [CarrierDecoder.subterm?_append, continuation_found parsed]
          exact found
  | @marked term endpoint context roles history view parsed status inner ih =>
      rcases ih with ⟨addressNone, countNone⟩ | ⟨address, target, foundView, addressEq, countEq, found, localParsed, fresh, classifier, decoded⟩
      · exact .inl ⟨by simp only [List.cons_append, addressBeforeFresh?, addressNone, Option.map],
          by simp only [List.cons_append, pendingBeforeFresh?, countNone]⟩
      · refine .inr ⟨[.right, .left] ++ address, target, foundView, ?_, ?_, ?_, localParsed, fresh, classifier, decoded⟩
        · simp only [List.cons_append, addressBeforeFresh?, addressEq, Option.map]
        · simp only [List.cons_append, pendingBeforeFresh?, countEq]
        · rw [CarrierDecoder.subterm?_append, continuation_found parsed]
          exact found

theorem Prefix.noPendingMarked
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {whole endpoint : Term} {context : Context}
    {roles : List RootResetPersistentRouteA.Role}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : Prefix program dispatcher whole endpoint context roles history) (count : Nat) :
    addressBeforePendingMarked? (roles ++ List.replicate count .pendingFrameChild) = none := by
  induction shape with
  | here term => exact addressBeforePendingMarked?_replicate_pendingFrameChild count
  | fresh parsed status nonempty clean inner ih =>
      simp only [List.cons_append, addressBeforePendingMarked?, ih, Option.map]
  | marked parsed status inner ih =>
      simp only [List.cons_append, addressBeforePendingMarked?, ih, Option.map]



/-- Historical priorities are excluded uniformly, independently of how many
fresh and marked completed parents precede the current pending response. -/
theorem Prefix.historical_priorities
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {whole endpoint : Term} {context : Context}
    {roles : List RootResetPersistentRouteA.Role}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : Prefix program dispatcher whole endpoint context roles history)
    (count : Nat)
    (endpointRoles : (RootResetPersistentRouteA.activeContext program dispatcher endpoint).roles =
      List.replicate count .pendingFrameChild)
    (responseLocalNone : CheckpointDecoder.parseLocal? program dispatcher.tree
      (responseOuter program dispatcher whole).active = none)
    (noBaseFinal : ∀ view : RootResetWholeAppenderStages.View program,
      (RootResetPersistentRouteAFuel.classifyHandoff program dispatcher whole).route.endpoint =
        some (.registered (.appender view)) → view.stage ≠ .secondFinal) :
    responseAppenderSelection? program dispatcher whole = none ∧
      responseCarrierSelection? program dispatcher whole = none ∧
      responseBoundarySelection? program dispatcher whole = none ∧
      markedHandoffSelection? program dispatcher whole = none := by
  have rolesEq : (RootResetPersistentRouteA.activeContext program dispatcher whole).roles =
      roles ++ List.replicate count .pendingFrameChild := by
    rw [shape.contexts.1]
    exact congrArg (fun remaining => roles ++ remaining) endpointRoles
  have completedNone := completedResponseAddress?_none_of_outer_parseLocal_none
    (show responseOuter program dispatcher whole = responseOuter program dispatcher whole from rfl)
    responseLocalNone
  have markedNone : markedHandoffSelection? program dispatcher whole = none := by
    rw [markedHandoffSelection?, rolesEq, shape.noPendingMarked count]
    rfl
  rcases shape.fresh_witness count with ⟨addressNone, countNone⟩ |
    ⟨address, term, view, addressEq, countEq, found, parsed, status, clean, nonempty⟩
  · have rootNone : freshResponseRoot? program dispatcher whole = none := by
      rw [freshResponseRoot?, rolesEq, addressNone]
      rfl
    refine ⟨?_, ?_, ?_, markedNone⟩
    · rw [responseAppenderSelection?, responseAppenderAddress?, rootNone]
      rfl
    · rw [responseCarrierSelection?, responseCarrierAddress?, rootNone]
      rfl
    · rw [responseBoundarySelection?, responseBoundaryAddress?, completedNone, rootNone]
      rfl
  · have rootSome : freshResponseRoot? program dispatcher whole = some (address, term) := by
      rw [freshResponseRoot?, rolesEq, addressEq]
      dsimp only [Option.bind]
      rw [found]
      rfl
    have pendingZero : pendingBeforeFresh?
        (RootResetPersistentRouteA.activeContext program dispatcher whole).roles = some 0 := by
      rw [rolesEq, countEq]
    refine ⟨RootResetCompletedAppenderPriority.responseAppenderSelection_none_of_completed_noPending
      program dispatcher whole term address rootSome found view parsed pendingZero noBaseFinal, ?_, ?_, markedNone⟩
    · rw [responseCarrierSelection?, responseCarrierAddress?, rootSome]
      dsimp only [Option.bind]
      rw [pendingZero]
    · rw [responseBoundarySelection?, responseBoundaryAddress?, completedNone, rootSome]
      dsimp only [Option.bind]
      rw [RootResetResponseBoundaryStages.parseActive?, parsed]
      dsimp only
      rw [if_pos status, clean]

open RootResetPendingResponseContext RootResetEmptyRouteSelectorChain

/-- The exact context and every historical exclusion for an unfinished
response shell, including a dispatcher or nonfinal appender of any length. -/
theorem Prefix.pending_shell_contexts
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (outerBits bits : List Bool) (outerContinuation continuation carrier dispatcherTerm : Term)
    (localNone : CheckpointDecoder.parseLocal? program dispatcher.tree
      (shell bits continuation carrier dispatcherTerm) = none) (count : Nat)
    {whole : Term} {context : Context} {roles : List RootResetPersistentRouteA.Role}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : Prefix program dispatcher whole
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (shell bits continuation carrier dispatcherTerm)) context roles history) :
    responseOuter program dispatcher whole =
        prepend context roles history
          (pendingOuter program (compileActions program dispatcher.tree) outerBits outerContinuation
            (shell bits continuation carrier dispatcherTerm) count) ∧
      (RootResetPersistentRouteAFuel.classifyHandoff program dispatcher whole).fuel = none ∧
      responseAppenderSelection? program dispatcher whole = none ∧
      responseCarrierSelection? program dispatcher whole = none ∧
      responseBoundarySelection? program dispatcher whole = none ∧
      markedHandoffSelection? program dispatcher whole = none := by
  have freshNone : RootResetPersistentRouteA.parseFreshNonempty? program dispatcher.tree
      (shell bits continuation carrier dispatcherTerm) = none := by
    rw [RootResetPersistentRouteA.parseFreshNonempty?, localNone]
  obtain ⟨stopped, descent⟩ := shell_stops program dispatcher bits continuation carrier dispatcherTerm freshNone
  obtain ⟨remaining, crossed, activeEq, rolesEq, fuelEq⟩ := pending_traversal program dispatcher
    outerBits bits outerContinuation continuation carrier dispatcherTerm stopped count
  have contexts := shape.contexts
  have outerEq := contexts.2.2
  rw [responseOuter_pending_shell program dispatcher outerBits bits outerContinuation
    continuation carrier dispatcherTerm stopped descent count] at outerEq
  have noFuel : (RootResetPersistentRouteAFuel.classifyHandoff program dispatcher whole).fuel = none := by
    rw [RootResetPersistentRouteAFuel.classifyHandoff, contexts.2.1]
    dsimp only [prepend]
    rw [fuelEq, activeEq, pending_shell_fuel_none]
  have noBaseFinal : ∀ view : RootResetWholeAppenderStages.View program,
      (RootResetPersistentRouteAFuel.classifyHandoff program dispatcher whole).route.endpoint =
        some (.registered (.appender view)) → view.stage ≠ .secondFinal := by
    intro view parsed
    rw [RootResetPersistentRouteAFuel.classifyHandoff, contexts.2.1] at parsed
    dsimp only [prepend] at parsed
    rw [fuelEq, activeEq, pending_shell_fuel_none] at parsed
    change (RootResetPersistentRouteA.classify program dispatcher whole).endpoint = _ at parsed
    rw [RootResetPersistentRouteA.classify, contexts.1] at parsed
    dsimp only [prepend] at parsed
    rw [activeEq] at parsed
    apply registeredAppender_not_final_of_local_none (registered := parsed)
    cases remaining with
    | zero => exact localNone
    | succ remaining => exact frame_local_none program dispatcher outerBits outerContinuation _
  refine ⟨outerEq, noFuel, shape.historical_priorities crossed rolesEq ?_ noBaseFinal⟩
  rw [outerEq]
  exact localNone



open RootResetWrappedEmptyRouteSelectorChain RootResetClockFuelStages

theorem Prefix.pending_contract
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    (bits : List Bool) (continuation : Term) (count : Nat)
    {whole source target : Term} {context : Context}
    {roles : List RootResetPersistentRouteA.Role}
    {history : List (CheckpointDecoder.LocalView program)} {address : Address}
    (shape : Prefix program dispatcher whole
      (pending (compileActions program dispatcher.tree) bits continuation count source) context roles history)
    (contracts : source.contractAt? address = some target) :
    whole.contractAt? ((RootResetSelectorContract.contextAddress context ++ rights count) ++ address) =
      some (context.plug (pending (compileActions program dispatcher.tree) bits continuation count target)) := by
  have lifted := RootResetWholeStageClassifier.contractAt?_plug_append context _
    (pending_contractAt (compileActions program dispatcher.tree) bits continuation contracts count)
  rw [shape.source_eq] at lifted
  simpa only [List.append_assoc] using lifted

/-- Every actual dispatcher contraction selects the exact lifted successor
through an arbitrary mixture of clean fresh and marked completed parents. -/
theorem DispatcherEdge.selectStep?_mixed_pending
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    (outerBits bits : List Bool) (outerContinuation continuation carrier : Term)
    (phase : CTS.Phase program) (bit : Bool)
    (carrierNot3 : carrier.headArity ≠ 3)
    (phaseEq : carrierPhase? program dispatcher.tree carrier = some phase)
    (bitEq : carrierResponseBit? program dispatcher.tree carrier = some bit)
    {source target : Term}
    (edge : DispatcherEdge (selectedAction program) carrier dispatcher.tree
      (dispatcher.route (phase, bit)) (phase, bit) source target)
    (count : Nat) {whole : Term} {context : Context}
    {roles : List RootResetPersistentRouteA.Role}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : Prefix program dispatcher whole
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (shell bits continuation carrier source)) context roles history) :
    selectStep? program dispatcher whole =
      some (context.plug (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
          (shell bits continuation carrier target))) := by
  have localNone := DispatcherEdge.shell_local_none bits continuation carrier carrierNot3 edge
  obtain ⟨outerEq, noFuel, appenderNone, carrierNone, boundaryNone, markedNone⟩ :=
    shape.pending_shell_contexts program dispatcher outerBits bits outerContinuation continuation carrier source localNone count
  let addressBase : Address := RootResetSelectorContract.contextAddress context ++ rights count
  cases edge with
  | initial path =>
      have fresh : parseFreshDispatcherCall? program dispatcher.tree
          (shell bits continuation carrier
            (RouteGrammar.compiledCall (selectedAction program) dispatcher.tree carrier)) = true :=
        parseFreshDispatcherCall?_freshLocal program dispatcher.tree bits continuation carrier
      have callContracts : (RouteGrammar.compiledCall (selectedAction program) dispatcher.tree carrier).contractAt? [] =
          some (RootResetDispatcherNodeStages.firstActivation (selectedAction program) dispatcher.tree carrier) := by
        cases dispatcher.tree <;> rfl
      have contracts := shape.pending_contract outerBits outerContinuation count
        (shell_contractAt bits continuation carrier callContracts)
      simp only [List.append_nil] at contracts
      let finalTerm := context.plug
        (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
          (shell bits continuation carrier
            (RootResetDispatcherNodeStages.firstActivation (selectedAction program) dispatcher.tree carrier)))
      have selected : freshDispatcherSelection? program dispatcher whole =
          some ⟨addressBase ++ RootResetWholeDispatcherStages.shellDispatcherAddress, finalTerm⟩ := by
        rw [freshDispatcherSelection?, outerEq]
        dsimp (config := { instances := true }) only [prepend, pendingOuter]
        rw [fresh]
        change checkedAt? whole (addressBase ++ RootResetWholeDispatcherStages.shellDispatcherAddress) = _
        rw [checkedAt?, RootResetPersistentRouteAFuel.checkedSelection?, contracts]
      change (classify program dispatcher whole).selected?.map (·.target) = some finalTerm
      rw [classify, noFuel]
      simp only [classifyAfterFuel, selected]
      rfl
  | row progress view routeShape contracts =>
      have freshSelectionNone : freshDispatcherSelection? program dispatcher whole = none := by
        rw [freshDispatcherSelection?, outerEq]
        dsimp (config := { instances := true }) only [prepend, pendingOuter]
        rw [shell_route_freshCall_false bits continuation carrier progress]
        rfl
      let address := addressBase ++ (RootResetWholeDispatcherStages.shellDispatcherAddress ++
        (RootResetSelectorContract.contextAddress view.context ++ view.localRedexAddress))
      have selectedAddress : currentCarrierDispatcherAddress? program dispatcher whole = some address := by
        rw [currentCarrierDispatcherAddress?, outerEq]
        dsimp only [prepend, pendingOuter, shell, Carrier.activeShell, Carrier.shell, seedCode]
        rw [RootResetWholeDispatcherStages.parseFreshHalt?_fresh]
        dsimp only
        rw [phaseEq, bitEq]
        dsimp only
        rw [RootResetWholeDispatcherStages.parseRouteNode?_complete routeShape]
        rfl
      have wholeContracts := shape.pending_contract outerBits outerContinuation count
        (shell_contractAt bits continuation carrier contracts)
      let finalTerm := context.plug
        (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
          (shell bits continuation carrier target))
      have selected : dispatcherSelection? program dispatcher whole = some ⟨address, finalTerm⟩ := by
        rw [dispatcherSelection?, selectedAddress]
        change checkedAt? whole address = _
        rw [checkedAt?, RootResetPersistentRouteAFuel.checkedSelection?, wholeContracts]
      have priority := (classify_dispatcher_priority freshSelectionNone boundaryNone appenderNone
        carrierNone markedNone noFuel selected).2
      rw [selectStep?, priority]
      rfl

end PureSFormal.Research.RootResetMixedResponseContext
