import PureSFormal.Research.RootResetNormalResponseBodyChain
import PureSFormal.Research.RootResetWrappedEmptyRouteSelectorChain

/-!
# Appender selection beneath pending frames and marked histories

Every unfinished action response retains its exact selected route while the
outer pending frames and completed marked histories are recovered from the
bare term.  The theorems here discharge the priority and context premises
for the first Push contraction and every unfinished Push row.
-/

namespace PureSFormal.Research.RootResetWrappedAppenderSelectorChain

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

/-- The full selector's earlier branches reject an unfinished appender below
arbitrary pending frames and completed marked history. -/
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
    (shape : MarkedPrefix program dispatcher.tree whole
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (routeShell program dispatcher label bits continuation carrier response)) context history) :
    responseOuter program dispatcher whole =
        prependMarked context history
          (pendingOuter program (compileActions program dispatcher.tree) outerBits outerContinuation
            (routeShell program dispatcher label bits continuation carrier response) count) ∧
      freshDispatcherSelection? program dispatcher whole = none ∧
      responseBoundarySelection? program dispatcher whole = none ∧
      responseAppenderSelection? program dispatcher whole = none ∧
      responseCarrierSelection? program dispatcher whole = none ∧
      markedHandoffSelection? program dispatcher whole = none ∧
      dispatcherSelection? program dispatcher whole = none ∧
      (RootResetPersistentRouteAFuel.classifyHandoff program dispatcher whole).fuel = none := by
  have freshNone : RootResetPersistentRouteA.parseFreshNonempty? program dispatcher.tree
      (routeShell program dispatcher label bits continuation carrier response) = none := by
    rw [RootResetPersistentRouteA.parseFreshNonempty?, localNone]
  obtain ⟨outerEq, noFuel, freshRootNone, markedNone⟩ := marked_pending_shell_contexts
    program dispatcher outerBits bits outerContinuation continuation carrier
      (PrimitiveRoute.withResponse (selectedAction program) dispatcher.tree
        (dispatcher.route label) carrier response) freshNone count shape
  refine ⟨outerEq, ?_, ?_, ?_, ?_, markedNone, ?_, noFuel⟩
  · rw [freshDispatcherSelection?, outerEq]
    dsimp (config := { instances := true }) only [prependMarked, pendingOuter]
    rw [← routeShell, routeShell_freshCall_false]
    rfl
  · rw [responseBoundarySelection?, responseBoundaryAddress?,
      RootResetResponseClockFuelAgreement.completedResponseAddress?_none_of_outer_parseLocal_none
        outerEq localNone, freshRootNone]
    rfl
  · rw [responseAppenderSelection?, responseAppenderAddress?, freshRootNone]
    rfl
  · rw [responseCarrierSelection?, responseCarrierAddress?, freshRootNone]
    rfl
  · rw [dispatcherSelection?, currentCarrierDispatcherAddress?, outerEq]
    dsimp only [prependMarked, pendingOuter, shell, Carrier.activeShell, Carrier.shell, seedCode]
    rw [RootResetWholeDispatcherStages.parseFreshHalt?_fresh]
    dsimp only
    rw [phaseEq, bitEq]
    dsimp only
    rw [parseRouteNode?_withResponse_none (selectedAction program) (dispatcher.route_valid label)
      carrier response carrierNot2]
    rfl

/-- A completed route locates its selected nonempty action through all outer
pending and marked contexts. -/
theorem selectedAction_selects_firstPush_marked_pending
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
    (shape : MarkedPrefix program dispatcher.tree whole
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
    dsimp only [prependMarked, pendingOuter, routeShell, shell, Carrier.activeShell, Carrier.shell, seedCode]
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
    marked_pending_contract outerBits outerContinuation count shape
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
theorem selectedActionSelection?_validRow_marked_pending_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (label : ActionLabel program) (outerBits bits : List Bool)
    (outerContinuation continuation carrier : Term)
    (row : RootResetWholeAppenderStages.Row)
    (valid : row.Valid (PrimitiveLocalResponse.emitted program label))
    (count : Nat) {whole : Term} {context : Context}
    {history : List (CheckpointDecoder.LocalView program)}
    (outerEq : responseOuter program dispatcher whole =
      prependMarked context history
        (pendingOuter program (compileActions program dispatcher.tree) outerBits outerContinuation
          (routeShell program dispatcher label bits continuation carrier row.term) count)) :
    selectedActionSelection? program dispatcher whole = none := by
  have detailed := DispatchParser.parseRouteDetailed_complete
    (PrimitiveRoute.withResponse_activated (encode := selectedAction program)
      (dispatcher.route_valid label) carrier row.term)
  rw [selectedActionSelection?, selectedActionAddress?, outerEq]
  dsimp only [prependMarked, pendingOuter, routeShell, shell, Carrier.activeShell, Carrier.shell, seedCode]
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
arbitrary pending frames and completed marked history. -/
theorem nonfinalRow_selectStep?_marked_pending
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
    (shape : MarkedPrefix program dispatcher.tree whole
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
  have actionNone := selectedActionSelection?_validRow_marked_pending_none program dispatcher label
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
    marked_pending_contract outerBits outerContinuation count shape
      (shell_contractAt bits continuation carrier dispatcherContracts)
  have appenderSelected : appenderSelection? program dispatcher whole = some ⟨address, finalTerm⟩ := by
    rw [appenderSelection?, outerEq]
    dsimp only [prependMarked, pendingOuter]
    rw [parsed]
    change checkedAt? whole address = _
    rw [checkedAt?, RootResetPersistentRouteAFuel.checkedSelection?, contracts]
  have priority := (classify_appender_priority dispatcherNone freshNone boundaryNone appenderNone
    carrierNone markedNone fuelNone actionNone appenderSelected).2
  rw [selectStep?, priority]
  rfl


/-- Exact action-field edges, retaining the grammar proof that prevents a
completed response from being selected again as an unfinished Push. -/
inductive AppenderEdge (program : CTS.Program) (label : ActionLabel program)
    (carrier : Term) : Term → Term → Prop where
  | initial (first : Bool) (rest : List Bool)
      (emitted : PrimitiveLocalResponse.emitted program label = first :: rest) :
      AppenderEdge program label carrier (.app (selectedAction program label) carrier)
        (RootResetAppenderStages.firstRow first rest carrier carrier)
  | row (row : RootResetWholeAppenderStages.Row) (target : Term)
      (valid : row.Valid (PrimitiveLocalResponse.emitted program label))
      (progress : ActionMutation (PrimitiveLocalResponse.emitted program label).length
        (PrimitiveLocalResponse.emitted program label) carrier [] false row.term)
      (targetEq : row.target? = some target) :
      AppenderEdge program label carrier row.term target

inductive AppenderChain (program : CTS.Program) (label : ActionLabel program)
    (carrier : Term) : Term → List Term → Prop where
  | done (source : Term) : AppenderChain program label carrier source []
  | next {source target : Term} {rest : List Term}
      (edge : AppenderEdge program label carrier source target)
      (tail : AppenderChain program label carrier target rest) :
      AppenderChain program label carrier source (target :: rest)

/-- Each entry after a first Push row has its exact unfinished grammar
certificate, independent of any outer controller state. -/
theorem actionTail_appenderChain
    (program : CTS.Program) (label : ActionLabel program) (carrier : Term) :
    ∀ (rest : List Bool) (bit : Bool) (initial : Term) (outer : List Term)
      (count : (PrimitiveLocalResponse.emitted program label).length = (bit :: rest).length + outer.length),
      (PrimitiveLocalResponse.emitted program label).drop outer.length = bit :: rest →
      (∀ {done term}, ActionMutation (PrimitiveLocalResponse.emitted program label).length
        (bit :: rest) initial outer done term →
        ActionMutation (PrimitiveLocalResponse.emitted program label).length
          (PrimitiveLocalResponse.emitted program label) carrier [] done term) →
      AppenderChain program label carrier
        (Term.applyArgs (pushFirst bit rest initial) outer)
        ((actionEntries (PrimitiveLocalResponse.emitted program label).length
          (bit :: rest) initial outer count).tail.map Prod.snd)
  | rest, bit, initial, outer, count, suffix, embed => by
      let firstRow : RootResetWholeAppenderStages.Row :=
        .first outer.length bit rest initial initial outer
      have firstValid : firstRow.Valid (PrimitiveLocalResponse.emitted program label) := ⟨suffix, rfl⟩
      have firstProgress : ActionMutation (PrimitiveLocalResponse.emitted program label).length
          (PrimitiveLocalResponse.emitted program label) carrier [] false firstRow.term :=
        embed (.first bit rest initial outer count)
      have firstChoice := AppenderEdge.row firstRow
        (Term.applyArgs (pushSecond bit rest initial) outer) firstValid firstProgress rfl
      cases rest with
      | nil => exact .next firstChoice (.done _)
      | cons next tail =>
          let accumulator := extendAccumulator bit initial
          let currentHistory := pushHistory bit initial
          let secondRow : RootResetWholeAppenderStages.Row :=
            .secondNonfinal outer.length bit next tail accumulator currentHistory outer
          have secondValid : secondRow.Valid (PrimitiveLocalResponse.emitted program label) := ⟨suffix, rfl⟩
          have secondProgress : ActionMutation (PrimitiveLocalResponse.emitted program label).length
              (PrimitiveLocalResponse.emitted program label) carrier [] false secondRow.term :=
            embed (.second bit (next :: tail) initial outer count)
          have secondChoice := AppenderEdge.row secondRow
            (Term.applyArgs (pushFirst next tail accumulator) (currentHistory :: outer))
            secondValid secondProgress rfl
          have nextCount : (PrimitiveLocalResponse.emitted program label).length =
              (next :: tail).length + (currentHistory :: outer).length := by
            simpa [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using count
          have nextSuffix : (PrimitiveLocalResponse.emitted program label).drop (currentHistory :: outer).length =
              next :: tail := by
            rw [List.length_cons, ← List.drop_drop]
            simp only [suffix, List.drop_succ_cons, List.drop_zero]
          have nextEmbed : ∀ {done term},
              ActionMutation (PrimitiveLocalResponse.emitted program label).length
                (next :: tail) accumulator (currentHistory :: outer) done term →
              ActionMutation (PrimitiveLocalResponse.emitted program label).length
                (PrimitiveLocalResponse.emitted program label) carrier [] done term := by
            intro done term progress
            exact embed (.inner progress)
          have remaining := actionTail_appenderChain program label carrier
            tail next accumulator (currentHistory :: outer) nextCount nextSuffix nextEmbed
          exact .next firstChoice (.next secondChoice remaining)

/-- The actual complete appender entry list is an exact action grammar chain,
including arbitrary nonempty words and the empty appendant. -/
theorem actionEntries_appenderChain
    (program : CTS.Program) (label : ActionLabel program) (carrier : Term) :
    AppenderChain program label carrier (.app (selectedAction program label) carrier)
      ((actionEntries (PrimitiveLocalResponse.emitted program label).length
        (PrimitiveLocalResponse.emitted program label) carrier [] (by simp)).map Prod.snd) := by
  cases emitted : PrimitiveLocalResponse.emitted program label with
  | nil =>
      simp only [emitted, actionEntries_nil, actionEntries_cons, List.map]
      exact .done _
  | cons first rest =>
      have count : (PrimitiveLocalResponse.emitted program label).length =
          (first :: rest).length + ([] : List Term).length := by rw [emitted]; rfl
      have suffix : (PrimitiveLocalResponse.emitted program label).drop ([] : List Term).length =
          first :: rest := emitted
      have embed : ∀ {done term},
          ActionMutation (PrimitiveLocalResponse.emitted program label).length (first :: rest) carrier [] done term →
          ActionMutation (PrimitiveLocalResponse.emitted program label).length
            (PrimitiveLocalResponse.emitted program label) carrier [] done term := by
        intro done term progress
        simpa only [emitted] using progress
      have tail := actionTail_appenderChain program label carrier rest first carrier [] count suffix embed
      have selected := AppenderChain.next (AppenderEdge.initial first rest emitted) tail
      simpa only [emitted, actionEntries_nil, actionEntries_cons, List.map, Term.applyArgs] using! selected

/-- Every exact action-field edge is selected in its literal outer context. -/
theorem AppenderEdge.selectStep?_marked_pending
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {label : ActionLabel program} {carrier source target : Term}
    (edge : AppenderEdge program label carrier source target)
    (outerBits bits : List Bool) (outerContinuation continuation : Term)
    (carrierNot2 : carrier.headArity ≠ 2)
    (phaseEq : carrierPhase? program dispatcher.tree carrier = some label.1)
    (bitEq : carrierResponseBit? program dispatcher.tree carrier = some label.2)
    (count : Nat) {whole : Term} {context : Context}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : MarkedPrefix program dispatcher.tree whole
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (routeShell program dispatcher label bits continuation carrier source)) context history) :
    selectStep? program dispatcher whole =
      some (context.plug (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (routeShell program dispatcher label bits continuation carrier target))) := by
  cases edge with
  | initial first rest emitted =>
      exact selectedAction_selects_firstPush_marked_pending program dispatcher label outerBits bits
        outerContinuation continuation carrier first rest emitted carrierNot2 phaseEq bitEq count shape
  | row row target valid progress targetEq =>
      exact nonfinalRow_selectStep?_marked_pending program dispatcher label outerBits bits
        outerContinuation continuation carrier row target valid progress targetEq carrierNot2 phaseEq bitEq count shape

/-- The entire appender is selected beneath any pending depth and completed
marked history, with the same context after every contraction. -/
theorem AppenderChain.selections_marked_pending
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {label : ActionLabel program} {carrier source : Term} {entries : List Term}
    (chain : AppenderChain program label carrier source entries)
    (outerBits bits : List Bool) (outerContinuation continuation : Term)
    (carrierNot2 : carrier.headArity ≠ 2)
    (phaseEq : carrierPhase? program dispatcher.tree carrier = some label.1)
    (bitEq : carrierResponseBit? program dispatcher.tree carrier = some label.2)
    (count : Nat) {whole : Term} {context : Context}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : MarkedPrefix program dispatcher.tree whole
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
      obtain ⟨nextHistory, nextShape⟩ := markedPrefix_replace shape stopped
      exact .next (edge.selectStep?_marked_pending outerBits bits outerContinuation continuation
        carrierNot2 phaseEq bitEq count shape) (ih nextShape)

/-- Pairing the exact appender terms with actual scheduler configurations
preserves every sampled contraction in the contextual chain. -/
theorem AppenderChain.selectsSamples_marked_pending
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
    (shape : MarkedPrefix program dispatcher.tree before.cursor.erase
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (routeShell program dispatcher label bits continuation carrier source)) context history)
    (samplesEq : samples.map (fun sample => sample.cursor.erase) =
      entries.map (fun term => context.plug
        (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
          (routeShell program dispatcher label bits continuation carrier term)))) :
    RootResetExactTraceAgreement.SelectorChain (selectStep? program dispatcher) before samples := by
  exact (chain.selections_marked_pending outerBits bits outerContinuation continuation
    carrierNot2 phaseEq bitEq count shape).selectsSamples rfl samplesEq

end PureSFormal.Research.RootResetWrappedAppenderSelectorChain
