import PureSFormal.Research.RootResetWrappedFrameSelectorProof

/-!
# FRAME residuals beneath completed marked histories

A marked completed Local exposes its continuation by a literal `RL` descent.
The following equations lift the pending-FRAME selector through any finite
history of these completed boundaries.
-/

namespace PureSFormal.Research.RootResetMarkedFrameSelectorProof

open PureSFormal.PureS
open RootResetWrappedFrameSelectorProof
open RootResetReachableStageGrammar
open RootResetClockFuelCanonicalGrammar
open RootResetCompositeStageRegistry

def prependMarked (context : Context)
    (history : List (CheckpointDecoder.LocalView program))
    (inner : RootResetPersistentRouteA.ActiveContext program) :
    RootResetPersistentRouteA.ActiveContext program :=
  ⟨inner.active, context.comp inner.context,
    RootResetSelectorContract.contextAddress context ++ inner.address,
    List.replicate history.length .markedContinuation ++ inner.roles,
    history ++ inner.history⟩

theorem activeContext_markedPrefix
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {whole active : Term} {context : Context}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : MarkedPrefix program dispatcher.tree whole active context history) :
    RootResetPersistentRouteA.activeContext program dispatcher whole =
      prependMarked context history
        (RootResetPersistentRouteA.activeContext program dispatcher active) := by
  induction shape with
  | here stop => rfl
  | @«local» term active innerContext view history boundary marked inner ih =>
      have found : parseMarkedLocal? program dispatcher.tree term = some view := by
        rw [parseMarkedLocal?, boundary]
        exact if_pos marked
      rw [RootResetPersistentRouteA.activeContext,
        RootResetPersistentRouteA.next?, found]
      dsimp only [RootResetPersistentRouteA.markedStep]
      rw [ih]
      simp only [RootResetPersistentRouteA.wrapOuter, prependMarked,
        List.length_cons, List.replicate_succ, List.cons_append,
        List.singleton_append, List.nil_append,
        RootResetRuntimeContextBridge.context_comp_assoc,
        RootResetSelectorContract.contextAddress_comp,
        RootResetPersistentRouteA.localContinuationContext_address_of_parseLocal? boundary,
        List.append_assoc]

theorem fuelActiveContext_markedPrefix
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {whole active : Term} {context : Context}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : MarkedPrefix program dispatcher.tree whole active context history) :
    RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher whole =
      prependMarked context history
        (RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher active) := by
  induction shape with
  | here stop => rfl
  | @«local» term active innerContext view history boundary marked inner ih =>
      have found : parseMarkedLocal? program dispatcher.tree term = some view := by
        rw [parseMarkedLocal?, boundary]
        exact if_pos marked
      have fuelNone := RootResetEmptyResponseSelectorChain.fuelParse_none_of_localShape
        (CheckpointDecoder.parseLocal?_sound boundary)
      rw [RootResetPersistentRouteAFuel.fuelActiveContext, fuelNone]
      dsimp only
      rw [RootResetPersistentRouteA.next?, found]
      dsimp only [RootResetPersistentRouteA.markedStep]
      rw [ih]
      simp only [RootResetPersistentRouteA.wrapOuter, prependMarked,
        List.length_cons, List.replicate_succ, List.cons_append,
        List.singleton_append, List.nil_append,
        RootResetRuntimeContextBridge.context_comp_assoc,
        RootResetSelectorContract.contextAddress_comp,
        RootResetPersistentRouteA.localContinuationContext_address_of_parseLocal? boundary,
        List.append_assoc]

theorem responseOuter_markedPrefix
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {whole active : Term} {context : Context}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : MarkedPrefix program dispatcher.tree whole active context history) :
    RootResetPersistentResponseSelector.responseOuter program dispatcher whole =
      prependMarked context history
        (RootResetPersistentResponseSelector.responseOuter program dispatcher active) := by
  rw [RootResetPersistentResponseSelector.responseOuter,
    fuelActiveContext_markedPrefix shape]
  simp only [RootResetPersistentResponseSelector.responseOuter,
    RootResetPersistentResponseSelector.composeActiveContexts, prependMarked,
    RootResetRuntimeContextBridge.context_comp_assoc, List.append_assoc]

theorem noFresh_marked_pending (markedCount pendingCount : Nat) :
    RootResetPersistentResponseSelector.addressBeforeFresh?
      (List.replicate markedCount .markedContinuation ++
        List.replicate pendingCount .pendingFrameChild) = none := by
  induction markedCount with
  | zero => exact RootResetResponseClockFuelAgreement.addressBeforeFresh?_replicate_pendingFrameChild _
  | succ count ih =>
      simp only [List.replicate_succ, List.cons_append,
        RootResetPersistentResponseSelector.addressBeforeFresh?, ih, Option.map_none]

theorem noPendingMarked_marked_pending (markedCount pendingCount : Nat) :
    RootResetPersistentResponseSelector.addressBeforePendingMarked?
      (List.replicate markedCount .markedContinuation ++
        List.replicate pendingCount .pendingFrameChild) = none := by
  induction markedCount with
  | zero => exact RootResetResponseClockFuelAgreement.addressBeforePendingMarked?_replicate_pendingFrameChild _
  | succ count ih =>
      simp only [List.replicate_succ, List.cons_append,
        RootResetPersistentResponseSelector.addressBeforePendingMarked?, ih, Option.map_none]

theorem routeAddress_of_recoveredOuter
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (source : Term) (outer : RootResetPersistentRouteA.ActiveContext program)
    (activeEq : RootResetPersistentRouteA.activeContext program dispatcher source = outer)
    (stopped : RootResetPersistentRouteA.next? program dispatcher outer.active = none)
    (address : Address)
    (selected : (RootResetPersistentRouteA.classify program dispatcher outer.active).selectedAddress? =
      some address) :
    (RootResetPersistentRouteA.classify program dispatcher source).selectedAddress? =
      some (outer.address ++ address) := by
  have rootActive : RootResetPersistentRouteA.activeContext program dispatcher outer.active =
      ⟨outer.active, .hole, [], [], []⟩ := by
    rw [RootResetPersistentRouteA.activeContext, stopped]
  rw [RootResetPersistentRouteA.classify, rootActive] at selected
  rw [RootResetPersistentRouteA.classify, activeEq]
  dsimp only at selected ⊢
  generalize resultEq : ((RootResetTwentySevenStageRegistry.parse? program dispatcher outer.active).bind
    fun view => RootResetPersistentRouteA.verifiedCandidate? outer.active
      (RootResetPersistentRouteA.endpointCandidate? program dispatcher.tree outer.active view)) = result
      at selected ⊢
  cases result with
  | none => contradiction
  | some found =>
      have addressEq : found = address := Option.some.inj selected
      rw [addressEq]
      rfl

theorem selectStep?_of_recoveredOuter
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (source target : Term) (outer : RootResetPersistentRouteA.ActiveContext program)
    (outerEq : RootResetPersistentResponseSelector.responseOuter program dispatcher source = outer)
    (activeEq : RootResetPersistentRouteA.activeContext program dispatcher source = outer)
    (fuelEq : RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher source = outer)
    (stopped : RootResetPersistentRouteA.next? program dispatcher outer.active = none)
    (fuelNone : RootResetPersistentFuelCarrier.parse?
      (compileActions program dispatcher.tree) outer.active = none)
    (localNone : CheckpointDecoder.parseLocal? program dispatcher.tree outer.active = none)
    (notSix : outer.active.headArity ≠ 6) (notTwo : outer.active.headArity ≠ 2)
    (noFresh : RootResetPersistentResponseSelector.addressBeforeFresh? outer.roles = none)
    (noPendingMarked : RootResetPersistentResponseSelector.addressBeforePendingMarked? outer.roles = none)
    (address : Address)
    (selected : (RootResetPersistentRouteA.classify program dispatcher outer.active).selectedAddress? =
      some address)
    (contracts : outer.active.contractAt? address = some target) :
    RootResetPersistentResponseSelector.selectStep? program dispatcher source =
      some (outer.context.plug target) := by
  have clear := prioritiesClear_of_recoveredOuter program dispatcher source outer
    outerEq activeEq localNone notSix notTwo noFresh noPendingMarked
  rw [RootResetResponseClockFuelAgreement.selectStep?_eq_persistent_of_prioritiesClear clear]
  have shape := RootResetPersistentRouteA.activeContext_sound program dispatcher source
  rw [activeEq] at shape
  have lifted := RootResetWholeStageClassifier.contractAt?_plug_append
    outer.context address contracts
  rw [shape.source_eq, shape.contextAddress_eq] at lifted
  unfold RootResetPersistentSelector.selectStep? RootResetPersistentSelector.selection?
    RootResetPersistentRouteAFuel.classifyHandoff
  rw [fuelEq]
  dsimp only
  rw [fuelNone]
  dsimp only
  rw [routeAddress_of_recoveredOuter program dispatcher source outer activeEq stopped address selected]
  unfold RootResetPersistentRouteAFuel.checkedSelection?
  dsimp only
  rw [lifted]
  rfl

theorem selectStep?_marked_pending
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
    (shape : MarkedPrefix program dispatcher.tree whole
      (pending (compileActions program dispatcher.tree) bits continuation count term)
      context history) :
    RootResetPersistentResponseSelector.selectStep? program dispatcher whole =
      some (context.plug
        (pending (compileActions program dispatcher.tree) bits continuation count target)) := by
  let outer := prependMarked context history
    (pendingOuter program (compileActions program dispatcher.tree) bits continuation term count)
  have activeEq : RootResetPersistentRouteA.activeContext program dispatcher whole = outer := by
    rw [activeContext_markedPrefix shape, activeContext_pending program dispatcher bits
      continuation term stopped registered count]
  have fuelEq : RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher whole = outer := by
    rw [fuelActiveContext_markedPrefix shape, fuelActiveContext_pending program dispatcher bits
      continuation term stopped registered canonicalNone count]
  have outerEq : RootResetPersistentResponseSelector.responseOuter program dispatcher whole = outer := by
    rw [responseOuter_markedPrefix shape, responseOuter_pending program dispatcher bits
      continuation term stopped registered canonicalNone descent count]
  have fuelNone : RootResetPersistentFuelCarrier.parse?
      (compileActions program dispatcher.tree) term = none := by
    rw [RootResetPersistentFuelCarrier.parse?, canonicalNone]
  have result := selectStep?_of_recoveredOuter program dispatcher whole target outer
    outerEq activeEq fuelEq stopped fuelNone localNone notSix notTwo
    (noFresh_marked_pending history.length count)
    (noPendingMarked_marked_pending history.length count) address selected contracts
  simpa only [outer, prependMarked, pendingOuter, Context.plug_comp, pendingContext_plug]
    using result

/-- The first FRAME residual is selected through every completed marked
history and every pending depth.  Its carrier and continuations are opaque. -/
theorem selectStep?_marked_pending_frameFirst
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (outerBits bits : List Bool) (outerContinuation continuation carrier : Term)
    (count : Nat) {whole : Term} {context : Context}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : MarkedPrefix program dispatcher.tree whole
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (SchedulerResponseInvariant.frameFirstRoot
          (compileActions program dispatcher.tree) bits continuation carrier)) context history) :
    RootResetPersistentResponseSelector.selectStep? program dispatcher whole =
      some (context.plug
        (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
          (SchedulerResponseInvariant.frameSecondRoot
            (compileActions program dispatcher.tree) bits continuation carrier))) := by
  refine selectStep?_marked_pending program dispatcher outerBits outerContinuation _ _ [.left]
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
same arbitrary completed marked history and pending frames. -/
theorem selectStep?_marked_pending_frameSecond
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (outerBits bits : List Bool) (outerContinuation continuation carrier : Term)
    (count : Nat) {whole : Term} {context : Context}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : MarkedPrefix program dispatcher.tree whole
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (SchedulerResponseInvariant.frameSecondRoot
          (compileActions program dispatcher.tree) bits continuation carrier)) context history) :
    RootResetPersistentResponseSelector.selectStep? program dispatcher whole =
      some (context.plug
        (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
          (freshLocal
            (compileActions program dispatcher.tree) bits continuation carrier))) := by
  refine selectStep?_marked_pending program dispatcher outerBits outerContinuation _ _ [.left, .left]
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

/-- Replacing the active term preserves the exact one-hole context of a
marked history.  Only the historical records' continuation fields change. -/
theorem markedPrefix_replace
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {whole active replacement : Term} {context : Context}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : MarkedPrefix program tree whole active context history)
    (stop : parseMarkedLocal? program tree replacement = none) :
    ∃ targetHistory, MarkedPrefix program tree (context.plug replacement)
      replacement context targetHistory := by
  induction shape with
  | here oldStop => exact ⟨[], .here stop⟩
  | @«local» source oldActive innerContext view history boundary marked inner ih =>
      obtain ⟨targetHistory, targetPrefix⟩ := ih
      let innerTarget := innerContext.plug replacement
      let targetView := RootResetResponseBoundaryStages.replaceContinuation view innerTarget
      let targetSource := (localContinuationContext source).plug innerTarget
      have targetShape : CheckpointDecoder.LocalShape program tree targetView targetSource :=
        RootResetResponseBoundaryStages.localShape_replaceContinuation
          (CheckpointDecoder.parseLocal?_sound boundary) innerTarget
      have targetBoundary := CheckpointDecoder.parseLocal?_complete targetShape
      have targetMarked : targetView.status = .marked := marked
      have contextEq : localContinuationContext targetSource =
          localContinuationContext source := by
        rcases CheckpointDecoder.parseLocal?_sound boundary with
          ⟨haltField, dispatcherTerm, seedAudit, continuationAudit, halt, dispatch, sourceEq⟩
        simp only [targetSource, sourceEq, localContinuationContext,
          CheckpointDecoder.openShell, Context.plug]
      have rebuilt := MarkedPrefix.local targetBoundary targetMarked targetPrefix
      rw [contextEq] at rebuilt
      exact ⟨targetView :: targetHistory, by
        simpa only [targetSource, innerTarget, Context.plug_comp] using rebuilt⟩

theorem pending_parseMarked_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation term : Term)
    (stop : parseMarkedLocal? program dispatcher.tree term = none) (count : Nat) :
    parseMarkedLocal? program dispatcher.tree
      (pending (compileActions program dispatcher.tree) bits continuation count term) = none := by
  cases count with
  | zero => exact stop
  | succ count =>
      rw [pending, parseMarkedLocal?, frame_local_none]

/-- Both FRAME edges hold consecutively under the same arbitrary marked
history.  The second history is reconstructed from the first contraction. -/
theorem marked_pending_frame_edges
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (outerBits bits : List Bool) (outerContinuation continuation carrier : Term)
    (count : Nat) {whole : Term} {context : Context}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : MarkedPrefix program dispatcher.tree whole
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
  refine ⟨selectStep?_marked_pending_frameFirst program dispatcher outerBits bits
    outerContinuation continuation carrier count shape, ?_⟩
  have stopped := pending_parseMarked_none program dispatcher outerBits outerContinuation _
    (RootResetFrameSecondSelectorProof.parseMarked_frameSecond_none
      program dispatcher bits continuation carrier) count
  obtain ⟨secondHistory, secondShape⟩ := markedPrefix_replace shape stopped
  exact selectStep?_marked_pending_frameSecond program dispatcher outerBits bits
    outerContinuation continuation carrier count secondShape

theorem pending_rebuild_under_parents (actions : Term) (bits : List Bool)
    (continuation term : Term) (count : Nat) (parents : List ParentFrame) :
    Cursor.rebuild (PrimitiveFuel.pendingParents (environmentCode actions bits)
        continuation count parents) term =
      (SchedulerInvariant.contextOfParents parents).plug
        (pending actions bits continuation count term) := by
  rw [SchedulerInvariant.contextOfParents_plug, PrimitiveFuel.rebuild_pendingParents]
  apply congrArg (Cursor.rebuild parents)
  induction count with
  | zero => rfl
  | succ count ih => exact congrArg (frame (environmentCode actions bits) continuation) ih

/-- The exact EMPTY compiler samples obey both FRAME selector equations under
arbitrary marked completed parent frames and arbitrary pending depth. -/
theorem emptyResponse_marked_frameResiduals_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program)
    (outerBits bits : List Bool) (outerContinuation continuation carrier : Term)
    (count : Nat) (parents : List ParentFrame)
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : MarkedPrefix program dispatcher.tree
      (Cursor.rebuild parents
        (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
          (SchedulerResponseInvariant.frameFirstRoot
            (compileActions program dispatcher.tree) bits continuation carrier)))
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (SchedulerResponseInvariant.frameFirstRoot
          (compileActions program dispatcher.tree) bits continuation carrier))
      (SchedulerInvariant.contextOfParents parents) history) :
    let actions := compileActions program dispatcher.tree
    let allParents := PrimitiveFuel.pendingParents (environmentCode actions outerBits)
      outerContinuation count parents
    ∃ first second third tail,
      SchedulerResponseInvariant.ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerEmpty.markStartConfiguration program dispatcher registers bits continuation carrier allParents)
        (SchedulerEmpty.responseStartConfiguration program dispatcher registers bits continuation carrier allParents)
        (first :: second :: third :: tail) ∧
      RootResetExactTraceAgreement.SelectorChain
        (RootResetPersistentResponseSelector.selectStep? program dispatcher) first [second, third] := by
  dsimp only
  let allParents := PrimitiveFuel.pendingParents
    (environmentCode (compileActions program dispatcher.tree) outerBits)
    outerContinuation count parents
  obtain ⟨samples, chain, paired⟩ := SchedulerNestedEmpty.emptyResponse_exactPairedMutationChain
    program dispatcher registers bits continuation carrier allParents
  have edges := marked_pending_frame_edges program dispatcher outerBits bits
    outerContinuation continuation carrier count shape
  dsimp only at edges
  change SchedulerNestedEmpty.EmptyResponseSamplePairs program dispatcher registers bits
    continuation carrier allParents samples
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
              refine ⟨_, _, _, _, chain, .next ?_ (.next ?_ (.done _))⟩
              · change RootResetPersistentResponseSelector.selectStep? program dispatcher
                  cursor1.erase = some cursor2.erase
                rw [erase1, erase2]
                simpa only [allParents, pending_rebuild_under_parents,
                  SchedulerInvariant.contextOfParents_plug] using edges.1
              · change RootResetPersistentResponseSelector.selectStep? program dispatcher
                  cursor2.erase = some cursor3.erase
                rw [erase2, erase3]
                simpa only [allParents, pending_rebuild_under_parents] using edges.2

end PureSFormal.Research.RootResetMarkedFrameSelectorProof
