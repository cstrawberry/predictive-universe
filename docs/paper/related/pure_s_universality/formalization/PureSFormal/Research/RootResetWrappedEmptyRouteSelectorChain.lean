import PureSFormal.Research.RootResetPendingResponseContext

/-!
# EMPTY route selection beneath outer contexts

Every selected dispatcher edge retains the literal pending frames and the
completed marked continuation history surrounding its fresh response shell.
-/

namespace PureSFormal.Research.RootResetWrappedEmptyRouteSelectorChain

open PureSFormal.PureS
open RootResetEmptyRouteSelectorChain
open RootResetWrappedFrameSelectorProof
open RootResetMarkedFrameSelectorProof
open RootResetPendingResponseContext
open RootResetPersistentResponseSelector
open RootResetReachableStageGrammar
open RootResetClockFuelStages

theorem DispatcherEdge.shell_local_none
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    (bits : List Bool) (continuation carrier : Term)
    (carrierNot3 : carrier.headArity ≠ 3)
    {route : Dispatcher.Route} {label : ActionLabel program} {source target : Term}
    (edge : DispatcherEdge (selectedAction program) carrier dispatcher.tree route label source target) :
    CheckpointDecoder.parseLocal? program dispatcher.tree (shell bits continuation carrier source) = none := by
  cases edge with
  | initial path =>
      have routeNone : RouteParser.parse (selectedAction program) dispatcher.tree
          (RouteGrammar.compiledCall (selectedAction program) dispatcher.tree carrier) = none := by
        cases parsed : RouteParser.parse (selectedAction program) dispatcher.tree
            (RouteGrammar.compiledCall (selectedAction program) dispatcher.tree carrier) with
        | none => rfl
        | some found =>
            obtain ⟨response, shape⟩ := RouteParser.parse_sound parsed
            exact False.elim (shape.result_ne_compiledCall dispatcher.tree carrier rfl)
      have dispatchNone : DispatchParser.parse program dispatcher.tree
          (RouteGrammar.compiledCall (selectedAction program) dispatcher.tree carrier) = none := by
        rw [DispatchParser.parse, DispatchParser.parseRouteDetailed, routeNone]
      simp only [shell, Carrier.activeShell, Carrier.shell, CheckpointDecoder.parseLocal?,
        freshHField, seedCode, CheckpointDecoder.checkHalt?, haltCode, b, ↓reduceIte]
      rw [dispatchNone]
      split <;> rfl
  | row progress view shape contracts =>
      exact shell_local_none_of_routeMutation carrierNot3 progress

theorem shell_contractAt
    (bits : List Bool) (continuation carrier : Term)
    {source target : Term} {address : Address}
    (contracts : source.contractAt? address = some target) :
    (shell bits continuation carrier source).contractAt?
      (RootResetWholeDispatcherStages.shellDispatcherAddress ++ address) =
        some (shell bits continuation carrier target) := by
  exact RootResetWholeStageClassifier.contractAt?_plug_append
    (RootResetResponseBoundaryStages.localDispatcherContext
      (freshHField carrier) (word bits) carrier continuation carrier) address contracts

theorem marked_pending_contract
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    (bits : List Bool) (continuation : Term) (count : Nat)
    {whole source target : Term} {context : Context}
    {history : List (CheckpointDecoder.LocalView program)} {address : Address}
    (shape : MarkedPrefix program dispatcher.tree whole
      (pending (compileActions program dispatcher.tree) bits continuation count source) context history)
    (contracts : source.contractAt? address = some target) :
    whole.contractAt? ((RootResetSelectorContract.contextAddress context ++ rights count) ++ address) =
      some (context.plug (pending (compileActions program dispatcher.tree) bits continuation count target)) := by
  have inner := pending_contractAt (compileActions program dispatcher.tree) bits continuation contracts count
  have lifted := RootResetWholeStageClassifier.contractAt?_plug_append context _ inner
  rw [shape.source_eq] at lifted
  simpa only [List.append_assoc] using lifted

/-- Every exact dispatcher edge has full-selector priority beneath arbitrary
pending frames and a completed marked history. -/
theorem DispatcherEdge.selectStep?_marked_pending
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
    (shape : MarkedPrefix program dispatcher.tree whole
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (shell bits continuation carrier source)) context history) :
    selectStep? program dispatcher whole =
      some (context.plug (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (shell bits continuation carrier target))) := by
  have localNone := DispatcherEdge.shell_local_none bits continuation carrier carrierNot3 edge
  have freshNone : RootResetPersistentRouteA.parseFreshNonempty? program dispatcher.tree
      (shell bits continuation carrier source) = none := by
    rw [RootResetPersistentRouteA.parseFreshNonempty?, localNone]
  obtain ⟨outerEq, noFuel, freshRootNone, markedNone⟩ := marked_pending_shell_contexts
    program dispatcher outerBits bits outerContinuation continuation carrier source freshNone count shape
  let addressBase := RootResetSelectorContract.contextAddress context ++ rights count
  cases edge with
  | initial path =>
      have fresh : parseFreshDispatcherCall? program dispatcher.tree
          (shell bits continuation carrier
            (RouteGrammar.compiledCall (selectedAction program) dispatcher.tree carrier)) = true :=
        parseFreshDispatcherCall?_freshLocal program dispatcher.tree bits continuation carrier
      have callContracts : (RouteGrammar.compiledCall (selectedAction program) dispatcher.tree carrier).contractAt? [] =
          some (RootResetDispatcherNodeStages.firstActivation (selectedAction program) dispatcher.tree carrier) := by
        cases dispatcher.tree <;> rfl
      have contracts := marked_pending_contract outerBits outerContinuation count shape
        (shell_contractAt bits continuation carrier callContracts)
      simp only [List.append_nil] at contracts
      let finalTerm := context.plug (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (shell bits continuation carrier
          (RootResetDispatcherNodeStages.firstActivation (selectedAction program) dispatcher.tree carrier)))
      have selected : freshDispatcherSelection? program dispatcher whole =
          some ⟨addressBase ++ RootResetWholeDispatcherStages.shellDispatcherAddress, finalTerm⟩ := by
        simp only [freshDispatcherSelection?, outerEq, prependMarked, pendingOuter]
        rw [fresh]
        change checkedAt? whole (addressBase ++ RootResetWholeDispatcherStages.shellDispatcherAddress) = _
        rw [checkedAt?, RootResetPersistentRouteAFuel.checkedSelection?, contracts]
      change (classify program dispatcher whole).selected?.map (·.target) = some finalTerm
      rw [classify, noFuel]
      simp only [classifyAfterFuel, selected]
      rfl
  | row progress view routeShape contracts =>
      have freshSelectionNone : freshDispatcherSelection? program dispatcher whole = none := by
        simp only [freshDispatcherSelection?, outerEq, prependMarked, pendingOuter]
        rw [shell_route_freshCall_false bits continuation carrier progress]
        rfl
      have appenderNone : responseAppenderSelection? program dispatcher whole = none := by
        rw [responseAppenderSelection?, responseAppenderAddress?, freshRootNone]
        rfl
      have carrierNone : responseCarrierSelection? program dispatcher whole = none := by
        rw [responseCarrierSelection?, responseCarrierAddress?, freshRootNone]
        rfl
      have boundaryNone : responseBoundarySelection? program dispatcher whole = none := by
        rw [responseBoundarySelection?, responseBoundaryAddress?,
          RootResetResponseClockFuelAgreement.completedResponseAddress?_none_of_outer_parseLocal_none
            outerEq localNone, freshRootNone]
        rfl
      let address := addressBase ++ (RootResetWholeDispatcherStages.shellDispatcherAddress ++
        (RootResetSelectorContract.contextAddress view.context ++ view.localRedexAddress))
      have selectedAddress : currentCarrierDispatcherAddress? program dispatcher whole = some address := by
        rw [currentCarrierDispatcherAddress?, outerEq]
        dsimp only [prependMarked, pendingOuter, shell, Carrier.activeShell, Carrier.shell, seedCode]
        rw [RootResetWholeDispatcherStages.parseFreshHalt?_fresh]
        dsimp only
        rw [phaseEq, bitEq]
        dsimp only
        rw [RootResetWholeDispatcherStages.parseRouteNode?_complete routeShape]
        rfl
      have wholeContracts := marked_pending_contract outerBits outerContinuation count shape
        (shell_contractAt bits continuation carrier contracts)
      let finalTerm := context.plug (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (shell bits continuation carrier target))
      have selected : dispatcherSelection? program dispatcher whole = some ⟨address, finalTerm⟩ := by
        rw [dispatcherSelection?, selectedAddress]
        change checkedAt? whole address = _
        rw [checkedAt?, RootResetPersistentRouteAFuel.checkedSelection?, wholeContracts]
      have priority := (classify_dispatcher_priority freshSelectionNone boundaryNone appenderNone
        carrierNone markedNone noFuel selected).2
      rw [selectStep?, priority]
      rfl

/-- The exact route-entry list keeps the same outer context throughout every
selected dispatcher contraction. -/
theorem DispatcherChain.selectsSamples_marked_pending
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    (outerBits bits : List Bool) (outerContinuation continuation carrier : Term)
    (phase : CTS.Phase program) (bit : Bool)
    (carrierNot3 : carrier.headArity ≠ 3)
    (phaseEq : carrierPhase? program dispatcher.tree carrier = some phase)
    (bitEq : carrierResponseBit? program dispatcher.tree carrier = some bit)
    {source : Term} {entries : List Term}
    (chain : DispatcherChain (selectedAction program) carrier dispatcher.tree
      (dispatcher.route (phase, bit)) (phase, bit) source entries)
    (count : Nat) {context : Context}
    {Control : Type} {before : FiniteController.Configuration Control}
    {samples : List (FiniteController.Configuration Control)}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : MarkedPrefix program dispatcher.tree before.cursor.erase
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (shell bits continuation carrier source)) context history)
    (samplesEq : samples.map (fun sample => sample.cursor.erase) =
      entries.map (fun term => context.plug
        (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
          (shell bits continuation carrier term)))) :
    RootResetExactTraceAgreement.SelectorChain (selectStep? program dispatcher) before samples := by
  induction chain generalizing before samples history with
  | done source =>
      cases samples with
      | nil => exact .done before
      | cons sample rest => cases samplesEq
  | @next source target rest edge tail ih =>
      cases samples with
      | nil => cases samplesEq
      | cons sample samples =>
          have equalities := List.cons.inj samplesEq
          dsimp only at equalities
          have stopped := pending_parseMarked_none program dispatcher outerBits outerContinuation _
            (RootResetWholeDispatcherSelectedHandoff.parseMarkedLocal?_fresh_openShell_none
              program dispatcher.tree carrier target (word bits) carrier continuation carrier) count
          obtain ⟨nextHistory, nextShape⟩ := markedPrefix_replace shape stopped
          refine .next ?_ (ih (history := nextHistory) ?_ equalities.2)
          · rw [equalities.1]
            exact DispatcherEdge.selectStep?_marked_pending outerBits bits outerContinuation
              continuation carrier phase bit carrierNot3 phaseEq bitEq edge count shape
          · rw [equalities.1]
            exact nextShape

/-- Every FRAME residual and dispatcher edge of the actual EMPTY response
agrees beneath arbitrary pending depth and actual marked parent frames. -/
theorem emptyResponseSamplePairs_wrapped_erases
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {registers : SchedulerControl.Registers program}
    (outerBits : List Bool) (outerContinuation : Term) (count : Nat)
    {bits : List Bool} {continuation carrier : Term} {parents : List ParentFrame}
    {samples : List (SchedulerInvariant.Configuration program dispatcher)}
    {entries : List (Bool × Term)}
    (pairs : SchedulerNestedEmpty.EmptyResponseSamplePairs program dispatcher registers bits
      continuation carrier
      (PrimitiveFuel.pendingParents (environmentCode (compileActions program dispatcher.tree) outerBits)
        outerContinuation count parents) samples entries) :
    samples.map (fun sample => sample.cursor.erase) =
      entries.map (fun entry => (SchedulerInvariant.contextOfParents parents).plug
        (pending (compileActions program dispatcher.tree) outerBits outerContinuation count entry.2)) := by
  induction pairs with
  | nil => rfl
  | cons pc cursor done term position erase root tail ih =>
      change cursor.erase :: _ = _ :: _
      rw [erase, pending_rebuild_under_parents, ih]

theorem emptyResponse_marked_dispatcher_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program)
    (outerBits bits : List Bool) (outerContinuation continuation carrier : Term)
    (carrierNot3 : carrier.headArity ≠ 3)
    (phaseEq : carrierPhase? program dispatcher.tree carrier = some registers.phase)
    (bitEq : carrierResponseBit? program dispatcher.tree carrier = some false)
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
    ∃ first second third rest,
      SchedulerResponseInvariant.ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerEmpty.markStartConfiguration program dispatcher registers bits continuation carrier allParents)
        (SchedulerEmpty.responseStartConfiguration program dispatcher registers bits continuation carrier allParents)
        (first :: second :: third :: rest) ∧
      RootResetExactTraceAgreement.SelectorChain (selectStep? program dispatcher) first
        (second :: third :: rest) := by
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
              refine ⟨_, _, _, _, chain, .next ?_ (.next ?_ ?_)⟩
              · change selectStep? program dispatcher cursor1.erase = some cursor2.erase
                rw [erase1, erase2]
                simpa only [allParents, pending_rebuild_under_parents,
                  SchedulerInvariant.contextOfParents_plug] using edges.1
              · change selectStep? program dispatcher cursor2.erase = some cursor3.erase
                rw [erase2, erase3]
                simpa only [allParents, pending_rebuild_under_parents] using edges.2
              ·
                have routeChain := routeEntries_dispatcherChain (selectedAction program) carrier
                  (dispatcher.route_valid (registers.phase, false))
                have freshStop := pending_parseMarked_none program dispatcher outerBits outerContinuation _
                  (RootResetWholeDispatcherSelectedHandoff.parseMarkedLocal?_fresh_openShell_none
                    program dispatcher.tree carrier
                    (RouteGrammar.compiledCall (selectedAction program) dispatcher.tree carrier)
                    (word bits) carrier continuation carrier) count
                obtain ⟨freshHistory, freshShape⟩ := markedPrefix_replace shape freshStop
                apply DispatcherChain.selectsSamples_marked_pending outerBits bits outerContinuation
                  continuation carrier registers.phase false carrierNot3 phaseEq bitEq routeChain count
                  (context := SchedulerInvariant.contextOfParents parents) (history := freshHistory)
                · change MarkedPrefix program dispatcher.tree cursor3.erase _ _ _
                  rw [erase3]
                  simpa only [allParents, pending_rebuild_under_parents] using! freshShape
                · have erases := emptyResponseSamplePairs_wrapped_erases outerBits outerContinuation count tail3
                  simpa only [PrimitiveLocalResponse.emitted,
                    SchedulerResponseInvariant.actionEntries_nil, SchedulerResponseInvariant.actionEntries_cons, List.append_eq, List.map_append,
                    List.map_nil, List.append_nil, List.nil_append, List.map_map] using! erases

end PureSFormal.Research.RootResetWrappedEmptyRouteSelectorChain
