import PureSFormal.Research.RootResetMixedClockFuelSelectorChain
import PureSFormal.Research.RootResetCleanParentPrefix
import PureSFormal.Research.RootResetOrderedCarrier

/-!
# Complete normal responses through mixed continuation histories

Arbitrary mixtures of completed fresh and marked histories retain their
certified decoder and accumulator provenance as the active response changes.
Both FRAME residuals and every dispatcher and appender contraction select the
exact scheduler sample, at every pending depth, through normal return.
-/

namespace PureSFormal.Research.RootResetMixedNormalResponseChain
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
open RootResetActivatedRouteExclusion
open RootResetFreshClockSelectorChain
open RootResetFreshFuelSelectorChain
open RootResetFreshResponseSelectorChain
open RootResetWrappedAppenderSelectorChain

open RootResetMixedResponseContext RootResetMixedClockFuelSelectorChain
open RootResetCompositeStageRegistry
theorem earlyPriorities_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (label : ActionLabel program) (outerBits bits : List Bool)
    (outerContinuation continuation carrier response : Term)
    (carrierNot2 : carrier.headArity ≠ 2)
    (phaseEq : carrierPhase? program dispatcher.tree carrier = some label.1)
    (bitEq : carrierResponseBit? program dispatcher.tree carrier = some label.2)
    (localNone : CheckpointDecoder.parseLocal? program dispatcher.tree
      (routeShell program dispatcher label bits continuation carrier response) = none)
    (count : Nat) {whole : Term} {context : Context}
    {roles : List RootResetPersistentRouteA.Role}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : Prefix program dispatcher whole
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (routeShell program dispatcher label bits continuation carrier response)) context roles history) :
    responseOuter program dispatcher whole =
        prepend context roles history
          (pendingOuter program (compileActions program dispatcher.tree) outerBits outerContinuation
            (routeShell program dispatcher label bits continuation carrier response) count) ∧
      freshDispatcherSelection? program dispatcher whole = none ∧
      responseBoundarySelection? program dispatcher whole = none ∧
      responseAppenderSelection? program dispatcher whole = none ∧
      responseCarrierSelection? program dispatcher whole = none ∧
      markedHandoffSelection? program dispatcher whole = none ∧
      dispatcherSelection? program dispatcher whole = none ∧
      (RootResetPersistentRouteAFuel.classifyHandoff program dispatcher whole).fuel = none := by
  obtain ⟨outerEq, noFuel, appenderNone, carrierNone, boundaryNone, markedNone⟩ :=
    Prefix.pending_shell_contexts program dispatcher outerBits bits outerContinuation continuation carrier
      (PrimitiveRoute.withResponse (selectedAction program) dispatcher.tree
        (dispatcher.route label) carrier response) localNone count shape
  refine ⟨outerEq, ?_, boundaryNone, appenderNone, carrierNone, markedNone, ?_, noFuel⟩
  · rw [freshDispatcherSelection?, outerEq]
    dsimp (config := { instances := true }) only [prepend, pendingOuter]
    rw [← routeShell, routeShell_freshCall_false]
    rfl
  · rw [dispatcherSelection?, currentCarrierDispatcherAddress?, outerEq]
    dsimp only [prepend, pendingOuter, shell, Carrier.activeShell, Carrier.shell, seedCode]
    rw [RootResetWholeDispatcherStages.parseFreshHalt?_fresh]
    dsimp only
    rw [phaseEq, bitEq]
    dsimp only
    rw [parseRouteNode?_withResponse_none (selectedAction program) (dispatcher.route_valid label)
      carrier response carrierNot2]
    rfl


theorem selectedAction_selects_firstPush_mixed_pending
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (label : ActionLabel program) (outerBits bits : List Bool)
    (outerContinuation continuation carrier : Term)
    (first : Bool) (rest : List Bool)
    (emitted : PrimitiveLocalResponse.emitted program label = first :: rest)
    (carrierNot2 : carrier.headArity ≠ 2)
    (phaseEq : carrierPhase? program dispatcher.tree carrier = some label.1)
    (bitEq : carrierResponseBit? program dispatcher.tree carrier = some label.2)
    (count : Nat) {whole : Term} {context : Context}
    {roles : List RootResetPersistentRouteA.Role}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : Prefix program dispatcher whole
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (routeShell program dispatcher label bits continuation carrier
          (.app (selectedAction program label) carrier))) context roles history) :
    selectStep? program dispatcher whole =
      some (context.plug (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (routeShell program dispatcher label bits continuation carrier
          (RootResetAppenderStages.firstRow first rest carrier carrier)))) := by
  let target := context.plug (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
    (routeShell program dispatcher label bits continuation carrier
      (RootResetAppenderStages.firstRow first rest carrier carrier)))
  have rejected : ActionParser.parse program label (.app (selectedAction program label) carrier) = none := by
    rw [PrimitiveLocalResponse.selectedAction_eq_appender, emitted]
    rcases label with ⟨phase, bit⟩
    cases bit with
    | false => simp [PrimitiveLocalResponse.emitted] at emitted
    | true => cases rest <;> rfl
  have localNone := routeShell_parseLocal_none_of_actionRejected program dispatcher label bits continuation carrier _ rejected
  obtain ⟨outerEq, freshNone, boundaryNone, appenderNone, carrierNone, markedNone, dispatcherNone, fuelNone⟩ :=
    earlyPriorities_none program dispatcher label outerBits bits outerContinuation continuation carrier _
      carrierNot2 phaseEq bitEq localNone count shape
  have parsed := DispatchParser.parseRouteDetailed_complete
    (PrimitiveRoute.withResponse_activated (encode := selectedAction program)
      (dispatcher.route_valid label) carrier (.app (selectedAction program label) carrier))
  let address := (RootResetSelectorContract.contextAddress context ++ rights count) ++
    (RootResetWholeDispatcherStages.shellDispatcherAddress ++ routeResponseAddress (dispatcher.route label))
  have addressEq : selectedActionAddress? program dispatcher whole = some address := by
    rw [selectedActionAddress?, outerEq]
    dsimp only [prepend, pendingOuter, routeShell, shell, Carrier.activeShell, Carrier.shell, seedCode]
    rw [RootResetWholeDispatcherStages.parseFreshHalt?_fresh]
    dsimp only
    rw [CheckpointDecoder.parseWord?_word]
    dsimp only
    rw [parsed]
    simp only [↓reduceIte]
    rfl
  have responseContracts := RootResetDispatcherSelectedHandoff.selectedAction_nonempty_contractRoot?_firstRow
    program label carrier first rest emitted
  have dispatcherContracts := RootResetResponseSampleParserBridge.RouteBridge.withResponse_contractAt?
    (encode := selectedAction program) (carrier := carrier) (dispatcher.route_valid label) responseContracts
  have contracts : whole.contractAt? address = some target :=
    Prefix.pending_contract outerBits outerContinuation count shape
      (shell_contractAt bits continuation carrier dispatcherContracts)
  have chosen : selectedActionSelection? program dispatcher whole = some ⟨address, target⟩ := by
    rw [selectedActionSelection?, addressEq]
    change checkedAt? whole address = _
    rw [checkedAt?, RootResetPersistentRouteAFuel.checkedSelection?, contracts]
  change (classify program dispatcher whole).selected?.map (·.target) = some target
  simp only [classify, fuelNone, classifyAfterFuel, freshNone, boundaryNone, appenderNone,
    carrierNone, markedNone, dispatcherNone, chosen]
  rfl

/-- A literal unfinished Push row cannot be mistaken for a new selected
action call, including when the recovered address has outer contexts. -/
theorem selectedActionSelection?_validRow_mixed_pending_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (label : ActionLabel program) (outerBits bits : List Bool)
    (outerContinuation continuation carrier : Term)
    (row : RootResetWholeAppenderStages.Row)
    (valid : row.Valid (PrimitiveLocalResponse.emitted program label))
    (count : Nat) {whole : Term} {context : Context}
    {roles : List RootResetPersistentRouteA.Role}
    {history : List (CheckpointDecoder.LocalView program)}
    (outerEq : responseOuter program dispatcher whole =
      prepend context roles history
        (pendingOuter program (compileActions program dispatcher.tree) outerBits outerContinuation
          (routeShell program dispatcher label bits continuation carrier row.term) count)) :
    selectedActionSelection? program dispatcher whole = none := by
  have detailed := DispatchParser.parseRouteDetailed_complete
    (PrimitiveRoute.withResponse_activated (encode := selectedAction program)
      (dispatcher.route_valid label) carrier row.term)
  rw [selectedActionSelection?, selectedActionAddress?, outerEq]
  dsimp only [prepend, pendingOuter, routeShell, shell, Carrier.activeShell, Carrier.shell, seedCode]
  rw [RootResetWholeDispatcherStages.parseFreshHalt?_fresh]
  dsimp only
  rw [CheckpointDecoder.parseWord?_word]
  dsimp only
  rw [detailed]
  dsimp only
  cases sourceEq : row.term with
  | s => rfl
  | app action argument =>
      have different : action ≠ selectedAction program label := by
        intro equal
        apply validRow_ne_selectedActionCall program label row valid argument
        rw [sourceEq, equal]
      dsimp only
      rw [if_neg different]
      rfl

/-- Every unfinished Push contraction has full-selector priority beneath
arbitrary pending frames and completed fresh history. -/
theorem nonfinalRow_selectStep?_mixed_pending
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (label : ActionLabel program) (outerBits bits : List Bool)
    (outerContinuation continuation carrier : Term)
    (row : RootResetWholeAppenderStages.Row) (target : Term)
    (valid : row.Valid (PrimitiveLocalResponse.emitted program label))
    (progress : ActionMutation (PrimitiveLocalResponse.emitted program label).length
      (PrimitiveLocalResponse.emitted program label) carrier [] false row.term)
    (targetEq : row.target? = some target)
    (carrierNot2 : carrier.headArity ≠ 2)
    (phaseEq : carrierPhase? program dispatcher.tree carrier = some label.1)
    (bitEq : carrierResponseBit? program dispatcher.tree carrier = some label.2)
    (count : Nat) {whole : Term} {context : Context}
    {roles : List RootResetPersistentRouteA.Role}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : Prefix program dispatcher whole
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (routeShell program dispatcher label bits continuation carrier row.term)) context roles history) :
    selectStep? program dispatcher whole =
      some (context.plug (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (routeShell program dispatcher label bits continuation carrier target))) := by
  let endpoint : RootResetWholeAppenderStages.ActiveView program :=
    ⟨bits, continuation, dispatcher.route label, label, row⟩
  have localNone := routeShell_parseLocal_none_of_actionMutation program dispatcher label bits continuation carrier row.term progress
  obtain ⟨outerEq, freshNone, boundaryNone, appenderNone, carrierNone, markedNone, dispatcherNone, fuelNone⟩ :=
    earlyPriorities_none program dispatcher label outerBits bits outerContinuation continuation carrier _
      carrierNot2 phaseEq bitEq localNone count shape
  have actionNone := selectedActionSelection?_validRow_mixed_pending_none program dispatcher label
    outerBits bits outerContinuation continuation carrier row valid count outerEq
  have rowShape : RootResetWholeAppenderStages.ActiveShape program dispatcher.tree endpoint
      (routeShell program dispatcher label bits continuation carrier row.term) := by
    exact .intro (freshHField carrier) _ carrier carrier (.fresh carrier)
      (PrimitiveRoute.withResponse_activated (dispatcher.route_valid label) carrier row.term) valid rfl
  have parsed := RootResetWholeAppenderStages.parseActive?_complete rowShape
  have dispatcherContracts := withResponse_contractAt?_append (selectedAction program)
    (dispatcher.route_valid label) carrier (row.contracts_of_target?_eq_some valid targetEq)
  let address := (RootResetSelectorContract.contextAddress context ++ rights count) ++ endpoint.focusAddress
  let finalTerm := context.plug (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
    (routeShell program dispatcher label bits continuation carrier target))
  have contracts : whole.contractAt? address = some finalTerm :=
    Prefix.pending_contract outerBits outerContinuation count shape
      (shell_contractAt bits continuation carrier dispatcherContracts)
  have appenderSelected : appenderSelection? program dispatcher whole = some ⟨address, finalTerm⟩ := by
    rw [appenderSelection?, outerEq]
    dsimp only [prepend, pendingOuter]
    rw [parsed]
    change checkedAt? whole address = _
    rw [checkedAt?, RootResetPersistentRouteAFuel.checkedSelection?, contracts]
  have priority := (classify_appender_priority dispatcherNone freshNone boundaryNone appenderNone
    carrierNone markedNone fuelNone actionNone appenderSelected).2
  rw [selectStep?, priority]
  rfl


theorem AppenderEdge.selectStep?_mixed_pending
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {label : ActionLabel program} {carrier source target : Term}
    (edge : AppenderEdge program label carrier source target)
    (outerBits bits : List Bool) (outerContinuation continuation : Term)
    (carrierNot2 : carrier.headArity ≠ 2)
    (phaseEq : carrierPhase? program dispatcher.tree carrier = some label.1)
    (bitEq : carrierResponseBit? program dispatcher.tree carrier = some label.2)
    (count : Nat) {whole : Term} {context : Context}
    {roles : List RootResetPersistentRouteA.Role}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : Prefix program dispatcher whole
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (routeShell program dispatcher label bits continuation carrier source)) context roles history) :
    selectStep? program dispatcher whole =
      some (context.plug (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (routeShell program dispatcher label bits continuation carrier target))) := by
  cases edge with
  | initial first rest emitted =>
      exact selectedAction_selects_firstPush_mixed_pending program dispatcher label outerBits bits
        outerContinuation continuation carrier first rest emitted carrierNot2 phaseEq bitEq count shape
  | row row target valid progress targetEq =>
      exact nonfinalRow_selectStep?_mixed_pending program dispatcher label outerBits bits
        outerContinuation continuation carrier row target valid progress targetEq carrierNot2 phaseEq bitEq count shape

/-- The entire appender is selected beneath any pending depth and completed
fresh history, with the same context after every contraction. -/
theorem AppenderChain.selections_mixed_pending
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {label : ActionLabel program} {carrier source : Term} {entries : List Term}
    (chain : AppenderChain program label carrier source entries)
    (outerBits bits : List Bool) (outerContinuation continuation : Term)
    (carrierNot2 : carrier.headArity ≠ 2)
    (phaseEq : carrierPhase? program dispatcher.tree carrier = some label.1)
    (bitEq : carrierResponseBit? program dispatcher.tree carrier = some label.2)
    (count : Nat) {whole : Term} {context : Context}
    {roles : List RootResetPersistentRouteA.Role}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : Prefix program dispatcher whole
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (routeShell program dispatcher label bits continuation carrier source)) context roles history) :
    RootResetNormalResponseBodyChain.TermSelections (selectStep? program dispatcher) whole
      (entries.map fun term => context.plug
        (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
          (routeShell program dispatcher label bits continuation carrier term))) := by
  induction chain generalizing whole history with
  | done source => exact .done _
  | @next source target rest edge tail ih =>
      obtain ⟨nextHistory, nextShape⟩ := shape.replace
        (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
          (routeShell program dispatcher label bits continuation carrier target))
      exact .next (AppenderEdge.selectStep?_mixed_pending edge outerBits bits outerContinuation continuation
        carrierNot2 phaseEq bitEq count shape) (ih nextShape)



open RootResetNormalResponseBodyChain

theorem DispatcherChain.selections_mixed_pending
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {label : ActionLabel program} {carrier source : Term} {entries : List Term}
    (chain : DispatcherChain (selectedAction program) carrier dispatcher.tree
      (dispatcher.route label) label source entries)
    (outerBits bits : List Bool) (outerContinuation continuation : Term)
    (carrierNot3 : carrier.headArity ≠ 3)
    (phaseEq : carrierPhase? program dispatcher.tree carrier = some label.1)
    (bitEq : carrierResponseBit? program dispatcher.tree carrier = some label.2)
    (count : Nat) {whole : Term} {context : Context}
    {roles : List RootResetPersistentRouteA.Role}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : Prefix program dispatcher whole
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (shell bits continuation carrier source)) context roles history) :
    TermSelections (selectStep? program dispatcher) whole
      (entries.map fun term => context.plug
        (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
          (shell bits continuation carrier term))) := by
  induction chain generalizing whole history with
  | done source => exact .done _
  | @next source target rest edge tail ih =>
      obtain ⟨nextHistory, nextShape⟩ := shape.replace
        (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
          (shell bits continuation carrier target))
      exact .next (DispatcherEdge.selectStep?_mixed_pending outerBits bits outerContinuation
        continuation carrier label.1 label.2 carrierNot3 phaseEq bitEq edge count shape) (ih nextShape)

theorem selectStep?_mixed_pending_frameFirst
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (outerBits bits : List Bool) (outerContinuation continuation carrier : Term)
    (count : Nat) {whole : Term} {context : Context}
    {roles : List RootResetPersistentRouteA.Role}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : Prefix program dispatcher whole
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (SchedulerResponseInvariant.frameFirstRoot
          (compileActions program dispatcher.tree) bits continuation carrier)) context roles history) :
    RootResetPersistentResponseSelector.selectStep? program dispatcher whole =
      some (context.plug
        (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
          (SchedulerResponseInvariant.frameSecondRoot
            (compileActions program dispatcher.tree) bits continuation carrier))) := by
  refine selectStep?_mixed_pending program dispatcher outerBits outerContinuation _ _ [.left]
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
theorem selectStep?_mixed_pending_frameSecond
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (outerBits bits : List Bool) (outerContinuation continuation carrier : Term)
    (count : Nat) {whole : Term} {context : Context}
    {roles : List RootResetPersistentRouteA.Role}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : Prefix program dispatcher whole
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (SchedulerResponseInvariant.frameSecondRoot
          (compileActions program dispatcher.tree) bits continuation carrier)) context roles history) :
    RootResetPersistentResponseSelector.selectStep? program dispatcher whole =
      some (context.plug
        (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
          (freshLocal
            (compileActions program dispatcher.tree) bits continuation carrier))) := by
  refine selectStep?_mixed_pending program dispatcher outerBits outerContinuation _ _ [.left, .left]
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

theorem mixed_pending_frame_edges
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (outerBits bits : List Bool) (outerContinuation continuation carrier : Term)
    (count : Nat) {whole : Term} {context : Context}
    {roles : List RootResetPersistentRouteA.Role}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : Prefix program dispatcher whole
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (SchedulerResponseInvariant.frameFirstRoot
          (compileActions program dispatcher.tree) bits continuation carrier)) context roles history) :
    let actions := compileActions program dispatcher.tree
    let second := context.plug (pending actions outerBits outerContinuation count
      (SchedulerResponseInvariant.frameSecondRoot actions bits continuation carrier))
    let third := context.plug (pending actions outerBits outerContinuation count
      (freshLocal actions bits continuation carrier))
    RootResetPersistentResponseSelector.selectStep? program dispatcher whole = some second ∧
      RootResetPersistentResponseSelector.selectStep? program dispatcher second = some third := by
  dsimp only
  refine ⟨selectStep?_mixed_pending_frameFirst program dispatcher outerBits bits
    outerContinuation continuation carrier count shape, ?_⟩
  obtain ⟨secondHistory, secondShape⟩ := shape.replace
    (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
      (SchedulerResponseInvariant.frameSecondRoot (compileActions program dispatcher.tree) bits continuation carrier))
  exact selectStep?_mixed_pending_frameSecond program dispatcher outerBits bits
    outerContinuation continuation carrier count secondShape


theorem responseEntries_tail_selections_mixed_pending
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (label : ActionLabel program) (outerBits bits : List Bool)
    (outerContinuation continuation carrier : Term)
    (carrierNot2 : carrier.headArity ≠ 2) (carrierNot3 : carrier.headArity ≠ 3)
    (phaseEq : carrierPhase? program dispatcher.tree carrier = some label.1)
    (bitEq : carrierResponseBit? program dispatcher.tree carrier = some label.2)
    (count : Nat) {whole : Term} {context : Context}
    {roles : List RootResetPersistentRouteA.Role}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : Prefix program dispatcher whole
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (frameFirstRoot (compileActions program dispatcher.tree) bits continuation carrier)) context roles history) :
    TermSelections (selectStep? program dispatcher) whole
      ((responseEntries program (dispatcher.route_valid label) bits continuation carrier).tail.map
        (fun entry => context.plug
          (pending (compileActions program dispatcher.tree) outerBits outerContinuation count entry.2))) := by
  have edges := mixed_pending_frame_edges program dispatcher outerBits bits
    outerContinuation continuation carrier count shape
  dsimp only at edges
  obtain ⟨freshHistory, freshShape⟩ := shape.replace
    (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
      (freshLocal (compileActions program dispatcher.tree) bits continuation carrier))
  have routed := DispatcherChain.selections_mixed_pending
    (routeEntries_dispatcherChain (selectedAction program) carrier (dispatcher.route_valid label))
    outerBits bits outerContinuation continuation carrierNot3 phaseEq bitEq count freshShape
  obtain ⟨actionHistory, actionShape⟩ := shape.replace
    (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
      (routeShell program dispatcher label bits continuation carrier (.app (selectedAction program label) carrier)))
  have action := AppenderChain.selections_mixed_pending (actionEntries_appenderChain program label carrier)
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
    shell, routeShell, Function.comp_def] using joined

/-- The actual normal scheduler response has complete selector agreement
from its first FRAME residual to the return configuration, under arbitrary
pending depth and completed fresh parents. -/
theorem normalResponse_body_mixed_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool)
    (outerBits bits : List Bool) (outerContinuation continuation carrier : Term)
    (carrierNot2 : carrier.headArity ≠ 2) (carrierNot3 : carrier.headArity ≠ 3)
    (phaseEq : carrierPhase? program dispatcher.tree carrier = some registers.phase)
    (bitEq : carrierResponseBit? program dispatcher.tree carrier = some bit)
    (count : Nat) (parents : List ParentFrame)
    {roles : List RootResetPersistentRouteA.Role}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : Prefix program dispatcher
      (Cursor.rebuild parents
        (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
          (frameFirstRoot (compileActions program dispatcher.tree) bits continuation carrier)))
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (frameFirstRoot (compileActions program dispatcher.tree) bits continuation carrier))
      (SchedulerInvariant.contextOfParents parents) roles history) :
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
      apply (responseEntries_tail_selections_mixed_pending program dispatcher (registers.phase, bit)
        outerBits bits outerContinuation continuation carrier carrierNot2 carrierNot3 phaseEq bitEq count shape).selectsSamples
      · simpa only [SchedulerInvariant.contextOfParents_plug] using equalities.1
      · exact equalities.2


theorem normalResponse_body_cleanParents_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool)
    (outerBits bits : List Bool) (outerContinuation continuation carrier : Term)
    (carrierNot2 : carrier.headArity ≠ 2) (carrierNot3 : carrier.headArity ≠ 3)
    (phaseEq : carrierPhase? program dispatcher.tree carrier = some registers.phase)
    (bitEq : carrierResponseBit? program dispatcher.tree carrier = some bit)
    (count : Nat) (parents : List ParentFrame)
    {layers : Nat}
    (clean : RootResetCleanTraversableParents.CleanParents program dispatcher parents layers) :
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
  obtain ⟨roles, history, shape⟩ := RootResetCleanParentPrefix.toPrefix clean
    (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
      (frameFirstRoot (compileActions program dispatcher.tree) bits continuation carrier))
  exact normalResponse_body_mixed_selectorChain program dispatcher registers bit outerBits bits
    outerContinuation continuation carrier carrierNot2 carrierNot3 phaseEq bitEq count parents shape



/-- Generated front deletion supplies all body-parser arity and label facts;
there is no externally supplied dispatcher phase, response bit, or arity. -/
theorem selectedResponseTrace_body_selectorChain
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {seedBits : List Bool} {continuation source : Term}
    {admissible : Carrier.Admissible continuation}
    {registers : SchedulerControl.Registers program} {bit : Bool} {suffix : List Bool}
    {outerContext fullContext innerContext targetContext : Context}
    {traceParents : List ParentFrame} {ticks count : Nat}
    (trace : SchedulerCycle.SelectedResponseTrace program dispatcher seedBits continuation source
      admissible registers bit suffix outerContext fullContext innerContext targetContext traceParents ticks)
    (invariant : RootResetOrderedCarrier.NormalInvariant program dispatcher.tree seedBits continuation
      source registers.phase (bit :: suffix) count)
    (outerBits : List Bool) (outerContinuation : Term) (pendingCount : Nat)
    (parents : List ParentFrame) {layers : Nat}
    (clean : RootResetCleanTraversableParents.CleanParents program dispatcher parents layers) :
    let responseRegisters := SchedulerCycle.scannedRegisters registers bit suffix
    let carrier := SchedulerCycle.deletedCarrier bit outerContext innerContext
    let allParents := PrimitiveFuel.pendingParents
      (environmentCode (compileActions program dispatcher.tree) outerBits) outerContinuation pendingCount parents
    ∃ first rest,
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerResponse.returnConfiguration program dispatcher responseRegisters bit seedBits continuation carrier allParents)
        (SchedulerResponse.responseStartConfiguration program dispatcher responseRegisters bit seedBits continuation carrier allParents)
        (first :: rest) ∧
      RootResetExactTraceAgreement.SelectorChain (selectStep? program dispatcher) first rest ∧
      first.cursor.erase = (SchedulerInvariant.contextOfParents parents).plug
        (pending (compileActions program dispatcher.tree) outerBits outerContinuation pendingCount
          (frameFirstRoot (compileActions program dispatcher.tree) seedBits continuation carrier)) := by
  dsimp only
  have arity := trace.targetHolds.wholeCarrierAudit admissible
  have notTwo : (SchedulerCycle.deletedCarrier bit outerContext innerContext).headArity ≠ 2 := by
    rcases arity with five | six
    · rw [five]; decide
    · rw [six]; decide
  have notThree : (SchedulerCycle.deletedCarrier bit outerContext innerContext).headArity ≠ 3 := by
    rcases arity with five | six
    · rw [five]; decide
    · rw [six]; decide
  have phaseEq : (SchedulerCycle.scannedRegisters registers bit suffix).phase = registers.phase := by
    rw [SchedulerCycle.scannedRegisters, SchedulerCycle.scanRegisters_phase]
    unfold SchedulerControl.Registers.observeLive
    split <;> rfl
  have facts := RootResetOrderedCarrier.selectedResponseTrace_preserves trace invariant
  exact normalResponse_body_cleanParents_selectorChain program dispatcher
    (SchedulerCycle.scannedRegisters registers bit suffix) bit outerBits seedBits outerContinuation continuation
    (SchedulerCycle.deletedCarrier bit outerContext innerContext) notTwo notThree
    (by rw [phaseEq]; exact facts.1) facts.2.1 pendingCount parents clean



/-- Exact samples depend only on the initial controller state and the number
of contractions, not the search bounds or administrative final suffix. This
identifies a selector-certified construction with an existing raw-stage list. -/
theorem exactMutationChain_samples_eq_of_length
    {Control : Type} {machine : FiniteController.Machine Control}
    {firstTerminal secondTerminal before : FiniteController.Configuration Control}
    {first second : List (FiniteController.Configuration Control)}
    (firstChain : ExactMutationChain machine firstTerminal before first)
    (secondChain : ExactMutationChain machine secondTerminal before second)
    (lengthEq : first.length = second.length) : first = second := by
  induction firstChain generalizing second with
  | done ticks suffix =>
      cases second with
      | nil => rfl
      | cons sample rest => cases lengthEq
  | @next before sample samples searchTicks found tail ih =>
      cases secondChain with
      | done ticks suffix => cases lengthEq
      | @next _ otherSample otherSamples otherTicks otherFound otherTail =>
          have same := RootResetEmptyPostMarkerHandoff.seekMutation_unique machine found otherFound
          cases same
          exact congrArg (sample :: ·) (ih otherTail (Nat.succ.inj lengthEq))

/-- Transfer a completed selector proof onto the literal samples already
returned by the scheduler recurrence. -/
theorem selectorChain_of_same_exact_length
    {Control : Type} {machine : FiniteController.Machine Control}
    {selector : Term → Option Term}
    {firstTerminal secondTerminal before : FiniteController.Configuration Control}
    {first second : List (FiniteController.Configuration Control)}
    (firstChain : ExactMutationChain machine firstTerminal before first)
    (secondChain : ExactMutationChain machine secondTerminal before second)
    (lengthEq : first.length = second.length)
    (selected : RootResetExactTraceAgreement.SelectorChain selector before first) :
    RootResetExactTraceAgreement.SelectorChain selector before second := by
  rw [← exactMutationChain_samples_eq_of_length firstChain secondChain lengthEq]
  exact selected

theorem normalResponse_body_mixed_selectorChain_with_length
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool)
    (outerBits bits : List Bool) (outerContinuation continuation carrier : Term)
    (carrierNot2 : carrier.headArity ≠ 2) (carrierNot3 : carrier.headArity ≠ 3)
    (phaseEq : carrierPhase? program dispatcher.tree carrier = some registers.phase)
    (bitEq : carrierResponseBit? program dispatcher.tree carrier = some bit)
    (count : Nat) (parents : List ParentFrame)
    {roles : List RootResetPersistentRouteA.Role}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : Prefix program dispatcher
      (Cursor.rebuild parents
        (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
          (frameFirstRoot (compileActions program dispatcher.tree) bits continuation carrier)))
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (frameFirstRoot (compileActions program dispatcher.tree) bits continuation carrier))
      (SchedulerInvariant.contextOfParents parents) roles history) :
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
          (frameFirstRoot (compileActions program dispatcher.tree) bits continuation carrier)) ∧
      (first :: rest).length = LocalResponse.completedCost program
        (dispatcher.route (registers.phase, bit)) (registers.phase, bit) := by
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
  have lengthEq := congrArg List.length erases
  simp only [List.length_map] at lengthEq
  rw [responseEntries_length] at lengthEq
  replace erases := erases.trans (wrapped _)
  cases samples with
  | nil => cases erases
  | cons first rest =>
      have equalities := List.cons.inj erases
      refine ⟨first, rest, exactChain, ?_, equalities.1, lengthEq⟩
      apply (responseEntries_tail_selections_mixed_pending program dispatcher (registers.phase, bit)
        outerBits bits outerContinuation continuation carrier carrierNot2 carrierNot3 phaseEq bitEq count shape).selectsSamples
      · simpa only [SchedulerInvariant.contextOfParents_plug] using equalities.1
      · exact equalities.2




/-- Close the complete operational nonempty-response segment once its two
front-boundary selections are established. All subsequent contractions and
its exact length are proved here from the generated carrier invariant. -/
theorem selectedResponseTrace_complete_selectorChain
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {seedBits : List Bool} {continuation source : Term}
    {admissible : Carrier.Admissible continuation}
    {registers : SchedulerControl.Registers program} {bit : Bool} {suffix : List Bool}
    {outerContext fullContext innerContext targetContext : Context}
    (remaining : Nat) (outerParents : List ParentFrame) {layers ticks count : Nat}
    (clean : RootResetCleanTraversableParents.CleanParents program dispatcher outerParents layers)
    (trace : SchedulerCycle.SelectedResponseTrace program dispatcher seedBits continuation source
      admissible registers bit suffix outerContext fullContext innerContext targetContext
      (PrimitiveFuel.pendingParents (environmentCode (compileActions program dispatcher.tree) seedBits)
        continuation remaining outerParents) ticks)
    (invariant : RootResetOrderedCarrier.NormalInvariant program dispatcher.tree seedBits continuation
      source registers.phase (bit :: suffix) count)
    (notSeen : registers.seen = false) :
    let parents := PrimitiveFuel.pendingParents (environmentCode (compileActions program dispatcher.tree) seedBits)
      continuation remaining outerParents
    let c4 := SchedulerNestedResponse.selectedC4Configuration program dispatcher registers bit
      outerContext innerContext
      (.right (SchedulerResponse.pendingFunction program dispatcher seedBits continuation) :: parents)
    let start := SchedulerInvariant.upConfiguration program dispatcher registers omega
      (ContextCursor.frames fullContext omega
        (.right (SchedulerResponse.pendingFunction program dispatcher seedBits continuation) :: parents))
    selectStep? program dispatcher start.cursor.erase = some c4.cursor.erase →
    selectStep? program dispatcher c4.cursor.erase =
      some (Cursor.rebuild parents (frameFirstRoot (compileActions program dispatcher.tree) seedBits
        continuation (SchedulerCycle.deletedCarrier bit outerContext innerContext))) →
    ∃ configurations,
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerCycle.selectedReturnConfiguration program dispatcher registers bit suffix seedBits continuation
          (SchedulerCycle.deletedCarrier bit outerContext innerContext) parents) start configurations ∧
      RootResetExactTraceAgreement.SelectorChain (selectStep? program dispatcher) start configurations ∧
      configurations.length = 1 + LocalResponse.completedCost program
        (dispatcher.route ((SchedulerCycle.scannedRegisters registers bit suffix).phase, bit))
        ((SchedulerCycle.scannedRegisters registers bit suffix).phase, bit) := by
  dsimp only
  intro c4Selected frameSelected
  let parents := PrimitiveFuel.pendingParents (environmentCode (compileActions program dispatcher.tree) seedBits)
    continuation remaining outerParents
  let c4 := SchedulerNestedResponse.selectedC4Configuration program dispatcher registers bit outerContext innerContext
    (.right (SchedulerResponse.pendingFunction program dispatcher seedBits continuation) :: parents)
  let finalRegisters := SchedulerCycle.scannedRegisters registers bit suffix
  let carrier := SchedulerCycle.deletedCarrier bit outerContext innerContext
  have arity := trace.targetHolds.wholeCarrierAudit admissible
  have notTwo : carrier.headArity ≠ 2 := by
    rcases arity with five | six
    · rw [show carrier.headArity = 5 from five]; decide
    · rw [show carrier.headArity = 6 from six]; decide
  have notThree : carrier.headArity ≠ 3 := by
    rcases arity with five | six
    · rw [show carrier.headArity = 5 from five]; decide
    · rw [show carrier.headArity = 6 from six]; decide
  have phaseEq : finalRegisters.phase = registers.phase := by
    dsimp only [finalRegisters]
    rw [SchedulerCycle.scannedRegisters, SchedulerCycle.scanRegisters_phase]
    unfold SchedulerControl.Registers.observeLive
    split <;> rfl
  have facts := RootResetOrderedCarrier.selectedResponseTrace_preserves trace invariant
  obtain ⟨roles, history, shape⟩ := RootResetCleanParentPrefix.toPrefix clean
    (pending (compileActions program dispatcher.tree) seedBits continuation remaining
      (frameFirstRoot (compileActions program dispatcher.tree) seedBits continuation carrier))
  obtain ⟨first, rest, body, selectedBody, firstErase, lengthEq⟩ :=
    normalResponse_body_mixed_selectorChain_with_length program dispatcher finalRegisters bit
      seedBits seedBits continuation continuation carrier notTwo notThree
      (by rw [phaseEq]; exact facts.1) facts.2.1 remaining outerParents shape
  obtain ⟨seekTicks, found⟩ := SchedulerNestedResponse.selected_seekC4 program dispatcher seedBits continuation
    source admissible registers bit suffix parents trace notSeen
  obtain ⟨ascentTicks, ascent⟩ := SchedulerNestedResponse.selectedC4_toFrame_zeroRunAt program dispatcher seedBits
    continuation source admissible registers bit suffix remaining outerParents trace notSeen
  have enter := SchedulerResponse.enterResponse_zeroRun program dispatcher finalRegisters bit seedBits continuation
    carrier parents (SchedulerCycle.scannedRegisters_bit registers bit suffix notSeen)
  have zeroPrefix := ascent.trans enter
  have afterC4 := ExactMutationChain.prepend zeroPrefix body
  refine ⟨c4 :: first :: rest, .next seekTicks found afterC4, .next c4Selected (.next ?_ selectedBody), ?_⟩
  · rw [firstErase]
    simpa only [pending_rebuild_under_parents] using frameSelected
  · rw [List.length_cons, lengthEq, Nat.add_comm]



/-- The operational UP and C4 states erase to the exact pending carrier terms
used by the completed-response front and FRAME selection lemmas. -/
theorem selectedResponseTrace_boundary_erases
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {seedBits : List Bool} {continuation source : Term}
    {admissible : Carrier.Admissible continuation}
    {registers : SchedulerControl.Registers program} {bit : Bool} {suffix : List Bool}
    {outerContext fullContext innerContext targetContext : Context}
    (remaining : Nat) (outerParents : List ParentFrame) {ticks : Nat}
    (trace : SchedulerCycle.SelectedResponseTrace program dispatcher seedBits continuation source
      admissible registers bit suffix outerContext fullContext innerContext targetContext
      (PrimitiveFuel.pendingParents (environmentCode (compileActions program dispatcher.tree) seedBits)
        continuation remaining outerParents) ticks) :
    let parents := PrimitiveFuel.pendingParents (environmentCode (compileActions program dispatcher.tree) seedBits)
      continuation remaining outerParents
    (SchedulerInvariant.upConfiguration program dispatcher registers omega
      (ContextCursor.frames fullContext omega
        (.right (SchedulerResponse.pendingFunction program dispatcher seedBits continuation) :: parents))).cursor.erase =
      (SchedulerInvariant.contextOfParents outerParents).plug
        (pending (compileActions program dispatcher.tree) seedBits continuation (remaining + 1) source) ∧
    (SchedulerNestedResponse.selectedC4Configuration program dispatcher registers bit outerContext innerContext
      (.right (SchedulerResponse.pendingFunction program dispatcher seedBits continuation) :: parents)).cursor.erase =
      (SchedulerInvariant.contextOfParents outerParents).plug
        (pending (compileActions program dispatcher.tree) seedBits continuation (remaining + 1)
          (SchedulerCycle.deletedCarrier bit outerContext innerContext)) := by
  dsimp only
  have parentEq : (.right (SchedulerResponse.pendingFunction program dispatcher seedBits continuation) ::
      PrimitiveFuel.pendingParents (environmentCode (compileActions program dispatcher.tree) seedBits)
        continuation remaining outerParents) =
      PrimitiveFuel.pendingParents (environmentCode (compileActions program dispatcher.tree) seedBits)
        continuation (remaining + 1) outerParents := by
    rw [SchedulerCycle.pendingParents_succ_cons]
    rfl
  constructor
  · change Cursor.rebuild (ContextCursor.frames fullContext omega _) omega = _
    rw [SchedulerAscent.rebuild_frames, trace.sourceDescent.source_eq, parentEq,
      pending_rebuild_under_parents]
  · change Cursor.rebuild (ContextCursor.frames outerContext
      (Carrier.tombstone bit (SchedulerAscent.frontPredecessor innerContext)
        (SchedulerAscent.frontPredecessor innerContext)) _)
      (Carrier.tombstone bit (SchedulerAscent.frontPredecessor innerContext)
        (SchedulerAscent.frontPredecessor innerContext)) = _
    rw [SchedulerAscent.rebuild_frames, parentEq, pending_rebuild_under_parents]
    rfl

end PureSFormal.Research.RootResetMixedNormalResponseChain
