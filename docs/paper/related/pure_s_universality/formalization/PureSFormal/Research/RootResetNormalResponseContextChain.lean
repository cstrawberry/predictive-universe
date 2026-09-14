import PureSFormal.Research.RootResetWrappedAppenderSelectorChain

/-!
# Complete normal response bodies in recovered outer contexts

The FRAME prefix, dispatcher route, and complete appender compose through
arbitrary pending frames and completed marked history.  This is the exact
scheduler sample list, including every unfinished intermediate response.
-/

namespace PureSFormal.Research.RootResetNormalResponseContextChain

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
open RootResetWrappedAppenderSelectorChain
open RootResetNormalResponseBodyChain

/-- The dispatcher terms alone form a selected chain in the recovered
pending and marked context. -/
theorem DispatcherChain.selections_marked_pending
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
    (shape : MarkedPrefix program dispatcher.tree whole
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
      obtain ⟨nextHistory, nextShape⟩ := markedPrefix_replace shape stopped
      exact .next (DispatcherEdge.selectStep?_marked_pending outerBits bits outerContinuation
        continuation carrier label.1 label.2 carrierNot3 phaseEq bitEq edge count shape) (ih nextShape)

/-- Every response entry after the first FRAME residual is selected in the
literal surrounding context, for every emitted action and route length. -/
theorem responseEntries_tail_selections_marked_pending
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (label : ActionLabel program) (outerBits bits : List Bool)
    (outerContinuation continuation carrier : Term)
    (carrierNot2 : carrier.headArity ≠ 2) (carrierNot3 : carrier.headArity ≠ 3)
    (phaseEq : carrierPhase? program dispatcher.tree carrier = some label.1)
    (bitEq : carrierResponseBit? program dispatcher.tree carrier = some label.2)
    (count : Nat) {whole : Term} {context : Context}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : MarkedPrefix program dispatcher.tree whole
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (frameFirstRoot (compileActions program dispatcher.tree) bits continuation carrier)) context history) :
    TermSelections (selectStep? program dispatcher) whole
      ((responseEntries program (dispatcher.route_valid label) bits continuation carrier).tail.map
        (fun entry => context.plug
          (pending (compileActions program dispatcher.tree) outerBits outerContinuation count entry.2))) := by
  have edges := marked_pending_frame_edges program dispatcher outerBits bits
    outerContinuation continuation carrier count shape
  dsimp only at edges
  have freshStopped := pending_parseMarked_none program dispatcher outerBits outerContinuation _
    (RootResetWholeDispatcherSelectedHandoff.parseMarkedLocal?_fresh_openShell_none
      program dispatcher.tree carrier (RouteGrammar.compiledCall (selectedAction program) dispatcher.tree carrier)
      (word bits) carrier continuation carrier) count
  obtain ⟨freshHistory, freshShape⟩ := markedPrefix_replace shape freshStopped
  have routed := DispatcherChain.selections_marked_pending
    (routeEntries_dispatcherChain (selectedAction program) carrier (dispatcher.route_valid label))
    outerBits bits outerContinuation continuation carrierNot3 phaseEq bitEq count freshShape
  have actionStopped := pending_parseMarked_none program dispatcher outerBits outerContinuation _
    (RootResetWholeDispatcherSelectedHandoff.parseMarkedLocal?_fresh_openShell_none
      program dispatcher.tree carrier
      (PrimitiveRoute.withResponse (selectedAction program) dispatcher.tree (dispatcher.route label)
        carrier (.app (selectedAction program label) carrier))
      (word bits) carrier continuation carrier) count
  obtain ⟨actionHistory, actionShape⟩ := markedPrefix_replace shape actionStopped
  have action := (actionEntries_appenderChain program label carrier).selections_marked_pending
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
pending depth and completed marked parents. -/
theorem normalResponse_body_marked_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool)
    (outerBits bits : List Bool) (outerContinuation continuation carrier : Term)
    (carrierNot2 : carrier.headArity ≠ 2) (carrierNot3 : carrier.headArity ≠ 3)
    (phaseEq : carrierPhase? program dispatcher.tree carrier = some registers.phase)
    (bitEq : carrierResponseBit? program dispatcher.tree carrier = some bit)
    (count : Nat) (parents : List ParentFrame)
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : MarkedPrefix program dispatcher.tree
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
      apply (responseEntries_tail_selections_marked_pending program dispatcher (registers.phase, bit)
        outerBits bits outerContinuation continuation carrier carrierNot2 carrierNot3 phaseEq bitEq count shape).selectsSamples
      · simpa only [SchedulerInvariant.contextOfParents_plug] using equalities.1
      · exact equalities.2

end PureSFormal.Research.RootResetNormalResponseContextChain
