import PureSFormal.Research.RootResetFreshResponseSelectorChain

/-!
# Complete appender chains in a fresh continuation history

A completed fresh history retains its certified decoder and accumulator
provenance when its continuation changes. Every selected-action and Push
edge then preserves the literal context, at every pending depth, through the
complete appender list including its completed final response.
-/

namespace PureSFormal.Research.RootResetFreshAppenderSelectorChain
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

inductive FreshPrefix (program : CTS.Program) (dispatcher : ActionDispatcher program) :
    Term → Term → Context → List (CheckpointDecoder.LocalView program) → Prop where
  | completed (registers : SchedulerControl.Registers program) (bit : Bool)
      (bits : List Bool) (carrier endpoint : Term)
      (nonempty : ∃ first rest, CheckpointDecoder.decodeCarrier? program dispatcher.tree
        (actionAccumulator program (registers.phase, bit) carrier) = some (first :: rest))
      (classifierNone : RootResetAccumulatorClassifier.classify?
        (actionAccumulator program (registers.phase, bit) carrier) = none) :
      FreshPrefix program dispatcher
        (freshTerm program dispatcher registers bit bits carrier endpoint) endpoint
        (localContinuationContext (freshTerm program dispatcher registers bit bits carrier endpoint))
        [freshView program dispatcher registers bit bits carrier endpoint]

theorem FreshPrefix.source_eq
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {whole endpoint : Term} {context : Context} {history : List (CheckpointDecoder.LocalView program)}
    (shape : FreshPrefix program dispatcher whole endpoint context history) :
    context.plug endpoint = whole := by
  cases shape
  rfl

theorem freshPrefix_replace
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {whole endpoint target : Term} {context : Context} {history : List (CheckpointDecoder.LocalView program)}
    (shape : FreshPrefix program dispatcher whole endpoint context history)
    (_stopped : parseMarkedLocal? program dispatcher.tree target = none) :
    ∃ nextHistory, FreshPrefix program dispatcher (context.plug target) target context nextHistory := by
  cases shape with
  | completed registers bit bits carrier endpoint nonempty classifierNone =>
      exact ⟨_, .completed registers bit bits carrier target nonempty classifierNone⟩

def prependFreshHistory {program : CTS.Program} (context : Context)
    (history : List (CheckpointDecoder.LocalView program))
    (inner : RootResetPersistentRouteA.ActiveContext program) : RootResetPersistentRouteA.ActiveContext program :=
  ⟨inner.active, context.comp inner.context,
    RootResetSelectorContract.contextAddress context ++ inner.address,
    .freshNonemptyContinuation :: inner.roles, history ++ inner.history⟩

theorem freshPrefix_pending_shell_contexts
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (outerBits bits : List Bool) (outerContinuation continuation carrier dispatcherTerm : Term)
    (localNone : CheckpointDecoder.parseLocal? program dispatcher.tree
      (shell bits continuation carrier dispatcherTerm) = none) (count : Nat)
    {whole : Term} {context : Context} {history : List (CheckpointDecoder.LocalView program)}
    (shape : FreshPrefix program dispatcher whole
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (shell bits continuation carrier dispatcherTerm)) context history) :
    responseOuter program dispatcher whole =
        prependFreshHistory context history
          (pendingOuter program (compileActions program dispatcher.tree) outerBits outerContinuation
            (shell bits continuation carrier dispatcherTerm) count) ∧
      (RootResetPersistentRouteAFuel.classifyHandoff program dispatcher whole).fuel = none ∧
      responseAppenderSelection? program dispatcher whole = none ∧
      responseCarrierSelection? program dispatcher whole = none ∧
      responseBoundarySelection? program dispatcher whole = none ∧
      markedHandoffSelection? program dispatcher whole = none := by
  cases shape with
  | completed registers bit oldBits oldCarrier endpoint nonempty classifierNone =>
      exact fresh_pending_shell_contexts program dispatcher registers bit oldBits oldCarrier nonempty classifierNone
        outerBits bits outerContinuation continuation carrier dispatcherTerm localNone count

theorem freshPrefix_pending_contract
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    (bits : List Bool) (continuation : Term) (count : Nat)
    {whole source target : Term} {context : Context}
    {history : List (CheckpointDecoder.LocalView program)} {address : Address}
    (shape : FreshPrefix program dispatcher whole
      (pending (compileActions program dispatcher.tree) bits continuation count source) context history)
    (contracts : source.contractAt? address = some target) :
    whole.contractAt? ((RootResetSelectorContract.contextAddress context ++ rights count) ++ address) =
      some (context.plug (pending (compileActions program dispatcher.tree) bits continuation count target)) := by
  cases shape with
  | completed registers bit oldBits oldCarrier endpoint nonempty classifierNone =>
      exact fresh_pending_contract program dispatcher registers bit oldBits oldCarrier bits continuation count contracts

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
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : FreshPrefix program dispatcher whole
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (routeShell program dispatcher label bits continuation carrier response)) context history) :
    responseOuter program dispatcher whole =
        prependFreshHistory context history
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
    freshPrefix_pending_shell_contexts program dispatcher outerBits bits outerContinuation continuation carrier
      (PrimitiveRoute.withResponse (selectedAction program) dispatcher.tree
        (dispatcher.route label) carrier response) localNone count shape
  refine ⟨outerEq, ?_, boundaryNone, appenderNone, carrierNone, markedNone, ?_, noFuel⟩
  · rw [freshDispatcherSelection?, outerEq]
    dsimp (config := { instances := true }) only [prependFreshHistory, pendingOuter]
    rw [← routeShell, routeShell_freshCall_false]
    rfl
  · rw [dispatcherSelection?, currentCarrierDispatcherAddress?, outerEq]
    dsimp only [prependFreshHistory, pendingOuter, shell, Carrier.activeShell, Carrier.shell, seedCode]
    rw [RootResetWholeDispatcherStages.parseFreshHalt?_fresh]
    dsimp only
    rw [phaseEq, bitEq]
    dsimp only
    rw [parseRouteNode?_withResponse_none (selectedAction program) (dispatcher.route_valid label)
      carrier response carrierNot2]
    rfl


theorem selectedAction_selects_firstPush_fresh_pending
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (label : ActionLabel program) (outerBits bits : List Bool)
    (outerContinuation continuation carrier : Term)
    (first : Bool) (rest : List Bool)
    (emitted : PrimitiveLocalResponse.emitted program label = first :: rest)
    (carrierNot2 : carrier.headArity ≠ 2)
    (phaseEq : carrierPhase? program dispatcher.tree carrier = some label.1)
    (bitEq : carrierResponseBit? program dispatcher.tree carrier = some label.2)
    (count : Nat) {whole : Term} {context : Context}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : FreshPrefix program dispatcher whole
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (routeShell program dispatcher label bits continuation carrier
          (.app (selectedAction program label) carrier))) context history) :
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
    dsimp only [prependFreshHistory, pendingOuter, routeShell, shell, Carrier.activeShell, Carrier.shell, seedCode]
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
    freshPrefix_pending_contract outerBits outerContinuation count shape
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
theorem selectedActionSelection?_validRow_fresh_pending_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (label : ActionLabel program) (outerBits bits : List Bool)
    (outerContinuation continuation carrier : Term)
    (row : RootResetWholeAppenderStages.Row)
    (valid : row.Valid (PrimitiveLocalResponse.emitted program label))
    (count : Nat) {whole : Term} {context : Context}
    {history : List (CheckpointDecoder.LocalView program)}
    (outerEq : responseOuter program dispatcher whole =
      prependFreshHistory context history
        (pendingOuter program (compileActions program dispatcher.tree) outerBits outerContinuation
          (routeShell program dispatcher label bits continuation carrier row.term) count)) :
    selectedActionSelection? program dispatcher whole = none := by
  have detailed := DispatchParser.parseRouteDetailed_complete
    (PrimitiveRoute.withResponse_activated (encode := selectedAction program)
      (dispatcher.route_valid label) carrier row.term)
  rw [selectedActionSelection?, selectedActionAddress?, outerEq]
  dsimp only [prependFreshHistory, pendingOuter, routeShell, shell, Carrier.activeShell, Carrier.shell, seedCode]
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
theorem nonfinalRow_selectStep?_fresh_pending
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
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : FreshPrefix program dispatcher whole
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (routeShell program dispatcher label bits continuation carrier row.term)) context history) :
    selectStep? program dispatcher whole =
      some (context.plug (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (routeShell program dispatcher label bits continuation carrier target))) := by
  let endpoint : RootResetWholeAppenderStages.ActiveView program :=
    ⟨bits, continuation, dispatcher.route label, label, row⟩
  have localNone := routeShell_parseLocal_none_of_actionMutation program dispatcher label bits continuation carrier row.term progress
  obtain ⟨outerEq, freshNone, boundaryNone, appenderNone, carrierNone, markedNone, dispatcherNone, fuelNone⟩ :=
    earlyPriorities_none program dispatcher label outerBits bits outerContinuation continuation carrier _
      carrierNot2 phaseEq bitEq localNone count shape
  have actionNone := selectedActionSelection?_validRow_fresh_pending_none program dispatcher label
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
    freshPrefix_pending_contract outerBits outerContinuation count shape
      (shell_contractAt bits continuation carrier dispatcherContracts)
  have appenderSelected : appenderSelection? program dispatcher whole = some ⟨address, finalTerm⟩ := by
    rw [appenderSelection?, outerEq]
    dsimp only [prependFreshHistory, pendingOuter]
    rw [parsed]
    change checkedAt? whole address = _
    rw [checkedAt?, RootResetPersistentRouteAFuel.checkedSelection?, contracts]
  have priority := (classify_appender_priority dispatcherNone freshNone boundaryNone appenderNone
    carrierNone markedNone fuelNone actionNone appenderSelected).2
  rw [selectStep?, priority]
  rfl


theorem AppenderEdge.selectStep?_fresh_pending
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {label : ActionLabel program} {carrier source target : Term}
    (edge : AppenderEdge program label carrier source target)
    (outerBits bits : List Bool) (outerContinuation continuation : Term)
    (carrierNot2 : carrier.headArity ≠ 2)
    (phaseEq : carrierPhase? program dispatcher.tree carrier = some label.1)
    (bitEq : carrierResponseBit? program dispatcher.tree carrier = some label.2)
    (count : Nat) {whole : Term} {context : Context}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : FreshPrefix program dispatcher whole
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (routeShell program dispatcher label bits continuation carrier source)) context history) :
    selectStep? program dispatcher whole =
      some (context.plug (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (routeShell program dispatcher label bits continuation carrier target))) := by
  cases edge with
  | initial first rest emitted =>
      exact selectedAction_selects_firstPush_fresh_pending program dispatcher label outerBits bits
        outerContinuation continuation carrier first rest emitted carrierNot2 phaseEq bitEq count shape
  | row row target valid progress targetEq =>
      exact nonfinalRow_selectStep?_fresh_pending program dispatcher label outerBits bits
        outerContinuation continuation carrier row target valid progress targetEq carrierNot2 phaseEq bitEq count shape

/-- The entire appender is selected beneath any pending depth and completed
fresh history, with the same context after every contraction. -/
theorem AppenderChain.selections_fresh_pending
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {label : ActionLabel program} {carrier source : Term} {entries : List Term}
    (chain : AppenderChain program label carrier source entries)
    (outerBits bits : List Bool) (outerContinuation continuation : Term)
    (carrierNot2 : carrier.headArity ≠ 2)
    (phaseEq : carrierPhase? program dispatcher.tree carrier = some label.1)
    (bitEq : carrierResponseBit? program dispatcher.tree carrier = some label.2)
    (count : Nat) {whole : Term} {context : Context}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : FreshPrefix program dispatcher whole
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (routeShell program dispatcher label bits continuation carrier source)) context history) :
    RootResetNormalResponseBodyChain.TermSelections (selectStep? program dispatcher) whole
      (entries.map fun term => context.plug
        (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
          (routeShell program dispatcher label bits continuation carrier term))) := by
  induction chain generalizing whole history with
  | done source => exact .done _
  | @next source target rest edge tail ih =>
      have stopped := pending_parseMarked_none program dispatcher outerBits outerContinuation _
        (RootResetWholeDispatcherSelectedHandoff.parseMarkedLocal?_fresh_openShell_none
          program dispatcher.tree carrier
          (PrimitiveRoute.withResponse (selectedAction program) dispatcher.tree
            (dispatcher.route label) carrier target)
          (word bits) carrier continuation carrier) count
      obtain ⟨nextHistory, nextShape⟩ := freshPrefix_replace shape stopped
      exact .next (AppenderEdge.selectStep?_fresh_pending edge outerBits bits outerContinuation continuation
        carrierNot2 phaseEq bitEq count shape) (ih nextShape)

/-- Pairing the exact appender terms with actual scheduler configurations
preserves every sampled contraction in the contextual chain. -/
theorem AppenderChain.selectsSamples_fresh_pending
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {label : ActionLabel program} {carrier source : Term} {entries : List Term}
    (chain : AppenderChain program label carrier source entries)
    (outerBits bits : List Bool) (outerContinuation continuation : Term)
    (carrierNot2 : carrier.headArity ≠ 2)
    (phaseEq : carrierPhase? program dispatcher.tree carrier = some label.1)
    (bitEq : carrierResponseBit? program dispatcher.tree carrier = some label.2)
    (count : Nat) {context : Context}
    {Control : Type} {before : FiniteController.Configuration Control}
    {samples : List (FiniteController.Configuration Control)}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : FreshPrefix program dispatcher before.cursor.erase
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (routeShell program dispatcher label bits continuation carrier source)) context history)
    (samplesEq : samples.map (fun sample => sample.cursor.erase) =
      entries.map (fun term => context.plug
        (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
          (routeShell program dispatcher label bits continuation carrier term)))) :
    RootResetExactTraceAgreement.SelectorChain (selectStep? program dispatcher) before samples := by
  exact (AppenderChain.selections_fresh_pending chain outerBits bits outerContinuation continuation
    carrierNot2 phaseEq bitEq count shape).selectsSamples rfl samplesEq



end PureSFormal.Research.RootResetFreshAppenderSelectorChain
