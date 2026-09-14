import PureSFormal.Research.RootResetFreshAppenderSelectorChain

/-!
# Complete normal response bodies inside fresh history

The two FRAME intermediates, every dispatcher edge, and the whole appender
form the exact selected normal-response list beneath a certified completed
fresh continuation and arbitrary pending depth. The theorem pairs that list
with the scheduler's actual positioned mutation samples through return.
-/

namespace PureSFormal.Research.RootResetFreshNormalResponseChain
open PureSFormal.PureS
open SchedulerResponseInvariant
open RootResetNonemptyAppenderSelector
open RootResetEmptyRouteSelectorChain
open RootResetWrappedEmptyRouteSelectorChain
open RootResetWrappedFrameSelectorProof
open RootResetMarkedFrameSelectorProof
open RootResetPendingResponseContext
open RootResetPersistentResponseSelector
open RootResetReachableStageGrammar
open RootResetClockFuelStages
open RootResetClockFuelCanonicalGrammar
open RootResetActivatedRouteExclusion
open RootResetFreshClockSelectorChain
open RootResetFreshFuelSelectorChain
open RootResetFreshResponseSelectorChain
open RootResetFreshAppenderSelectorChain
open RootResetResponseClockFuelAgreement
open RootResetPersistentClockFuelAgreement
open RootResetCompositeStageRegistry
open RootResetWrappedAppenderSelectorChain
open RootResetNormalResponseBodyChain

theorem selectStep?_fresh_pending
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
    (count : Nat) {whole : Term} {context : Context}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : FreshPrefix program dispatcher whole
      (pending (compileActions program dispatcher.tree) bits continuation count term)
      context history) :
    RootResetPersistentResponseSelector.selectStep? program dispatcher whole =
      some (context.plug
        (pending (compileActions program dispatcher.tree) bits continuation count target)) := by
  cases shape with
  | completed registers oldBit oldBits oldCarrier endpoint nonempty classifierNone =>
      let endpoint := pending (compileActions program dispatcher.tree) bits continuation count term
      let whole := freshTerm program dispatcher registers oldBit oldBits oldCarrier endpoint
      let outer := prependFresh program dispatcher registers oldBit oldBits oldCarrier endpoint
        (pendingOuter program (compileActions program dispatcher.tree) bits continuation term count)
      have contexts := freshTerm_contexts_general program dispatcher registers oldBit oldBits oldCarrier endpoint nonempty
      have activeEq : RootResetPersistentRouteA.activeContext program dispatcher whole = outer := by
        rw [contexts.1, activeContext_pending program dispatcher bits continuation term stopped registered count]
      have fuelEq : RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher whole = outer := by
        rw [contexts.2.1, fuelActiveContext_pending program dispatcher bits continuation term stopped registered canonicalNone count]
      have outerEq : responseOuter program dispatcher whole = outer := by
        rw [contexts.2.2, responseOuter_pending program dispatcher bits continuation term stopped registered canonicalNone descent count]
      have fuelNone : RootResetPersistentFuelCarrier.parse? (compileActions program dispatcher.tree) term = none := by
        rw [RootResetPersistentFuelCarrier.parse?, canonicalNone]
      have freshRoot : freshResponseRoot? program dispatcher whole = some ([], whole) := by
        rw [freshResponseRoot?, activeEq]
        dsimp only [outer, prependFresh, RootResetPersistentRouteA.wrapOuter, RootResetPersistentRouteA.freshStep, pendingOuter]
        rw [addressBeforeFresh?, addressBeforeFresh?_replicate_pendingFrameChild]
        rfl
      have zeroPending : pendingBeforeFresh? (RootResetPersistentRouteA.activeContext program dispatcher whole).roles = some 0 := by
        rw [activeEq]
        dsimp only [outer, prependFresh, RootResetPersistentRouteA.wrapOuter, RootResetPersistentRouteA.freshStep, pendingOuter]
        rw [pendingBeforeFresh?, pendingBeforeFresh?_replicate_pending_none]
      have noBaseFinal : ∀ view : RootResetWholeAppenderStages.View program,
          (RootResetPersistentRouteAFuel.classifyHandoff program dispatcher whole).route.endpoint =
            some (.registered (.appender view)) → view.stage ≠ .secondFinal := by
        intro view parsed
        rw [RootResetPersistentRouteAFuel.classifyHandoff, fuelEq] at parsed
        dsimp only [outer, prependFresh, RootResetPersistentRouteA.wrapOuter, pendingOuter] at parsed
        rw [fuelNone] at parsed
        change (RootResetPersistentRouteA.classify program dispatcher whole).endpoint = _ at parsed
        rw [RootResetPersistentRouteA.classify, activeEq] at parsed
        exact registeredAppender_not_final_of_local_none localNone parsed
      have appenderNone := RootResetCompletedAppenderPriority.responseAppenderSelection_none_of_completed_noPending
        program dispatcher whole whole [] freshRoot rfl
        (freshView program dispatcher registers oldBit oldBits oldCarrier endpoint)
        (freshTerm_parsed program dispatcher registers oldBit oldBits oldCarrier endpoint) zeroPending noBaseFinal
      have carrierNone : responseCarrierSelection? program dispatcher whole = none := by
        rw [responseCarrierSelection?, responseCarrierAddress?, freshRoot]
        dsimp only [Option.bind]
        rw [zeroPending]
      have boundaryNone : responseBoundarySelection? program dispatcher whole = none := by
        rw [responseBoundarySelection?, responseBoundaryAddress?,
          completedResponseAddress?_none_of_outer_parseLocal_none outerEq localNone, freshRoot]
        dsimp only [Option.bind]
        rw [RootResetResponseBoundaryStages.parseActive?, freshTerm_parsed]
        dsimp only [freshView, CheckpointDecoder.completedView]
        rw [if_pos rfl, classifierNone]
      have noPendingMarked : addressBeforePendingMarked? outer.roles = none := by
        dsimp only [outer, prependFresh, RootResetPersistentRouteA.wrapOuter, RootResetPersistentRouteA.freshStep, pendingOuter]
        rw [addressBeforePendingMarked?, addressBeforePendingMarked?_replicate_pendingFrameChild]
        rfl
      have clear := RootResetFreshClockSelectorChain.prioritiesClear_of_recoveredOuter
        program dispatcher whole outer outerEq activeEq localNone notSix notTwo
        appenderNone carrierNone boundaryNone noPendingMarked
      rw [selectStep?_eq_persistent_of_prioritiesClear clear]
      have recovered := RootResetPersistentRouteA.activeContext_sound program dispatcher whole
      rw [activeEq] at recovered
      have lifted := RootResetWholeStageClassifier.contractAt?_plug_append outer.context address contracts
      change (outer.context.plug outer.active).contractAt?
        (RootResetSelectorContract.contextAddress outer.context ++ address) = some (outer.context.plug target) at lifted
      rw [recovered.source_eq, recovered.contextAddress_eq] at lifted
      unfold RootResetPersistentSelector.selectStep? RootResetPersistentSelector.selection?
        RootResetPersistentRouteAFuel.classifyHandoff
      rw [fuelEq]
      dsimp only [outer, prependFresh, RootResetPersistentRouteA.wrapOuter, pendingOuter]
      rw [fuelNone]
      dsimp only
      rw [routeAddress_of_recoveredOuter program dispatcher whole outer activeEq stopped address selected]
      unfold RootResetPersistentRouteAFuel.checkedSelection?
      dsimp only
      rw [lifted]
      change some (outer.context.plug target) = _
      simp only [outer, prependFresh, RootResetPersistentRouteA.wrapOuter, pendingOuter,
        Context.plug_comp, pendingContext_plug]
      rfl

theorem selectStep?_fresh_pending_frameFirst
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (outerBits bits : List Bool) (outerContinuation continuation carrier : Term)
    (count : Nat) {whole : Term} {context : Context}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : FreshPrefix program dispatcher whole
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (SchedulerResponseInvariant.frameFirstRoot
          (compileActions program dispatcher.tree) bits continuation carrier)) context history) :
    RootResetPersistentResponseSelector.selectStep? program dispatcher whole =
      some (context.plug
        (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
          (SchedulerResponseInvariant.frameSecondRoot
            (compileActions program dispatcher.tree) bits continuation carrier))) := by
  refine selectStep?_fresh_pending program dispatcher outerBits outerContinuation _ _ [.left]
    ?_ ?_ ?_ ?_ ?_ ?_ ?_ ?_ ?_ count shape
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

/-- The second FRAME residual selects the fresh Local shell through the
same arbitrary completed fresh history and pending frames. -/
theorem selectStep?_fresh_pending_frameSecond
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (outerBits bits : List Bool) (outerContinuation continuation carrier : Term)
    (count : Nat) {whole : Term} {context : Context}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : FreshPrefix program dispatcher whole
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (SchedulerResponseInvariant.frameSecondRoot
          (compileActions program dispatcher.tree) bits continuation carrier)) context history) :
    RootResetPersistentResponseSelector.selectStep? program dispatcher whole =
      some (context.plug
        (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
          (freshLocal
            (compileActions program dispatcher.tree) bits continuation carrier))) := by
  refine selectStep?_fresh_pending program dispatcher outerBits outerContinuation _ _ [.left, .left]
    ?_ ?_ ?_ ?_ ?_ ?_ ?_ ?_ ?_ count shape
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

theorem fresh_pending_frame_edges
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (outerBits bits : List Bool) (outerContinuation continuation carrier : Term)
    (count : Nat) {whole : Term} {context : Context}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : FreshPrefix program dispatcher whole
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (SchedulerResponseInvariant.frameFirstRoot
          (compileActions program dispatcher.tree) bits continuation carrier)) context history) :
    let actions := compileActions program dispatcher.tree
    let second := context.plug (pending actions outerBits outerContinuation count
      (SchedulerResponseInvariant.frameSecondRoot actions bits continuation carrier))
    let third := context.plug (pending actions outerBits outerContinuation count
      (freshLocal actions bits continuation carrier))
    RootResetPersistentResponseSelector.selectStep? program dispatcher whole = some second ∧
      RootResetPersistentResponseSelector.selectStep? program dispatcher second = some third := by
  dsimp only
  refine ⟨selectStep?_fresh_pending_frameFirst program dispatcher outerBits bits
    outerContinuation continuation carrier count shape, ?_⟩
  have stopped := pending_parseMarked_none program dispatcher outerBits outerContinuation _
    (RootResetFrameSecondSelectorProof.parseMarked_frameSecond_none
      program dispatcher bits continuation carrier) count
  obtain ⟨secondHistory, secondShape⟩ := freshPrefix_replace shape stopped
  exact selectStep?_fresh_pending_frameSecond program dispatcher outerBits bits
    outerContinuation continuation carrier count secondShape


theorem DispatcherEdge.selectStep?_freshPrefix_pending
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
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : FreshPrefix program dispatcher whole
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (shell bits continuation carrier source)) context history) :
    selectStep? program dispatcher whole =
      some (context.plug (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (shell bits continuation carrier target))) := by
  cases shape with
  | completed registers oldBit oldBits oldCarrier endpoint nonempty classifierNone =>
      exact RootResetFreshResponseSelectorChain.DispatcherEdge.selectStep?_fresh_pending
        registers oldBit oldBits oldCarrier nonempty classifierNone
        outerBits bits outerContinuation continuation carrier phase bit carrierNot3 phaseEq bitEq edge count

theorem DispatcherChain.selections_fresh_pending
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {label : ActionLabel program} {carrier source : Term} {entries : List Term}
    (chain : DispatcherChain (selectedAction program) carrier dispatcher.tree
      (dispatcher.route label) label source entries)
    (outerBits bits : List Bool) (outerContinuation continuation : Term)
    (carrierNot3 : carrier.headArity ≠ 3)
    (phaseEq : carrierPhase? program dispatcher.tree carrier = some label.1)
    (bitEq : carrierResponseBit? program dispatcher.tree carrier = some label.2)
    (count : Nat) {whole : Term} {context : Context}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : FreshPrefix program dispatcher whole
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (shell bits continuation carrier source)) context history) :
    TermSelections (selectStep? program dispatcher) whole
      (entries.map fun term => context.plug
        (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
          (shell bits continuation carrier term))) := by
  induction chain generalizing whole history with
  | done source => exact .done _
  | @next source target rest edge tail ih =>
      have stopped := pending_parseMarked_none program dispatcher outerBits outerContinuation _
        (RootResetWholeDispatcherSelectedHandoff.parseMarkedLocal?_fresh_openShell_none
          program dispatcher.tree carrier target (word bits) carrier continuation carrier) count
      obtain ⟨nextHistory, nextShape⟩ := freshPrefix_replace shape stopped
      exact .next (DispatcherEdge.selectStep?_freshPrefix_pending outerBits bits outerContinuation
        continuation carrier label.1 label.2 carrierNot3 phaseEq bitEq edge count shape) (ih nextShape)

/-- Every response entry after the first FRAME residual is selected in the
literal surrounding context, for every emitted action and route length. -/
theorem responseEntries_tail_selections_fresh_pending
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (label : ActionLabel program) (outerBits bits : List Bool)
    (outerContinuation continuation carrier : Term)
    (carrierNot2 : carrier.headArity ≠ 2) (carrierNot3 : carrier.headArity ≠ 3)
    (phaseEq : carrierPhase? program dispatcher.tree carrier = some label.1)
    (bitEq : carrierResponseBit? program dispatcher.tree carrier = some label.2)
    (count : Nat) {whole : Term} {context : Context}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : FreshPrefix program dispatcher whole
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (frameFirstRoot (compileActions program dispatcher.tree) bits continuation carrier)) context history) :
    TermSelections (selectStep? program dispatcher) whole
      ((responseEntries program (dispatcher.route_valid label) bits continuation carrier).tail.map
        (fun entry => context.plug
          (pending (compileActions program dispatcher.tree) outerBits outerContinuation count entry.2))) := by
  have edges := fresh_pending_frame_edges program dispatcher outerBits bits
    outerContinuation continuation carrier count shape
  dsimp only at edges
  have freshStopped := pending_parseMarked_none program dispatcher outerBits outerContinuation _
    (RootResetWholeDispatcherSelectedHandoff.parseMarkedLocal?_fresh_openShell_none
      program dispatcher.tree carrier (RouteGrammar.compiledCall (selectedAction program) dispatcher.tree carrier)
      (word bits) carrier continuation carrier) count
  obtain ⟨freshHistory, freshShape⟩ := freshPrefix_replace shape freshStopped
  have routed := DispatcherChain.selections_fresh_pending
    (routeEntries_dispatcherChain (selectedAction program) carrier (dispatcher.route_valid label))
    outerBits bits outerContinuation continuation carrierNot3 phaseEq bitEq count freshShape
  have actionStopped := pending_parseMarked_none program dispatcher outerBits outerContinuation _
    (RootResetWholeDispatcherSelectedHandoff.parseMarkedLocal?_fresh_openShell_none
      program dispatcher.tree carrier
      (PrimitiveRoute.withResponse (selectedAction program) dispatcher.tree (dispatcher.route label)
        carrier (.app (selectedAction program label) carrier))
      (word bits) carrier continuation carrier) count
  obtain ⟨actionHistory, actionShape⟩ := freshPrefix_replace shape actionStopped
  have action := RootResetFreshAppenderSelectorChain.AppenderChain.selections_fresh_pending (actionEntries_appenderChain program label carrier)
    outerBits bits outerContinuation continuation carrierNot2 phaseEq bitEq count actionShape
  have endpoint := routeEntries_lastTerm (selectedAction program) carrier (dispatcher.route_valid label)
    (RouteGrammar.compiledCall (selectedAction program) dispatcher.tree carrier)
  have mapped := lastTerm_map (fun term => context.plug
    (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
      (shell bits continuation carrier term)))
    (RouteGrammar.compiledCall (selectedAction program) dispatcher.tree carrier)
    ((routeEntries (selectedAction program) carrier dispatcher.tree (dispatcher.route label)).map Prod.snd)
  rw [endpoint] at mapped
  have joined := routed.append (mapped.symm ▸ action)
  refine .next edges.1 (.next edges.2 ?_)
  simpa only [responseEntries, List.tail_cons, List.append_eq, List.map_append, List.map_cons, List.map_nil,
    List.map_map, List.append_assoc, List.cons_append, List.nil_append,
    shell, routeShell, Function.comp_def] using! joined

/-- The actual normal scheduler response has complete selector agreement
from its first FRAME residual to the return configuration, under arbitrary
pending depth and completed fresh parents. -/
theorem normalResponse_body_fresh_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool)
    (outerBits bits : List Bool) (outerContinuation continuation carrier : Term)
    (carrierNot2 : carrier.headArity ≠ 2) (carrierNot3 : carrier.headArity ≠ 3)
    (phaseEq : carrierPhase? program dispatcher.tree carrier = some registers.phase)
    (bitEq : carrierResponseBit? program dispatcher.tree carrier = some bit)
    (count : Nat) (parents : List ParentFrame)
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : FreshPrefix program dispatcher
      (Cursor.rebuild parents
        (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
          (frameFirstRoot (compileActions program dispatcher.tree) bits continuation carrier)))
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (frameFirstRoot (compileActions program dispatcher.tree) bits continuation carrier))
      (SchedulerInvariant.contextOfParents parents) history) :
    let allParents := PrimitiveFuel.pendingParents
      (environmentCode (compileActions program dispatcher.tree) outerBits) outerContinuation count parents
    ∃ first rest,
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerResponse.returnConfiguration program dispatcher registers bit bits continuation carrier allParents)
        (SchedulerResponse.responseStartConfiguration program dispatcher registers bit bits continuation carrier allParents)
        (first :: rest) ∧
      RootResetExactTraceAgreement.SelectorChain (selectStep? program dispatcher) first rest ∧
      first.cursor.erase = (SchedulerInvariant.contextOfParents parents).plug
        (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
          (frameFirstRoot (compileActions program dispatcher.tree) bits continuation carrier)) := by
  dsimp only
  obtain ⟨samples, exactChain, _, erases⟩ := SchedulerCycle.normalResponse_exactPositionedMutationChain
    program dispatcher registers bit bits continuation carrier
      (PrimitiveFuel.pendingParents (environmentCode (compileActions program dispatcher.tree) outerBits)
        outerContinuation count parents)
  have wrapped : ∀ entries : List (Bool × Term),
      entries.map (fun entry => Cursor.rebuild
        (PrimitiveFuel.pendingParents (environmentCode (compileActions program dispatcher.tree) outerBits)
          outerContinuation count parents) entry.2) =
      entries.map (fun entry => (SchedulerInvariant.contextOfParents parents).plug
        (pending (compileActions program dispatcher.tree) outerBits outerContinuation count entry.2)) := by
    intro entries
    induction entries with
    | nil => rfl
    | cons entry rest ih =>
        change _ :: _ = _ :: _
        dsimp only
        rw [pending_rebuild_under_parents, ih]
  replace erases := erases.trans (wrapped _)
  cases samples with
  | nil => cases erases
  | cons first rest =>
      have equalities := List.cons.inj erases
      refine ⟨first, rest, exactChain, ?_, equalities.1⟩
      apply (responseEntries_tail_selections_fresh_pending program dispatcher (registers.phase, bit)
        outerBits bits outerContinuation continuation carrier carrierNot2 carrierNot3 phaseEq bitEq count shape).selectsSamples
      · simpa only [SchedulerInvariant.contextOfParents_plug] using equalities.1
      · exact equalities.2


end PureSFormal.Research.RootResetFreshNormalResponseChain
