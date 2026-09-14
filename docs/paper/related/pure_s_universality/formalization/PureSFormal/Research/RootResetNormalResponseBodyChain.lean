import PureSFormal.Research.RootResetAppenderSelectorChain

/-!
# Exact normal-response body chains

The literal dispatcher entries end at the chosen action call.  This endpoint
joins the appender entry chain, so the actual scheduler samples agree from
the first FRAME residual through the complete response body.
-/

namespace PureSFormal.Research.RootResetNormalResponseBodyChain

open PureSFormal.PureS
open SchedulerResponseInvariant
open RootResetPersistentResponseSelector
open RootResetEmptyRouteSelectorChain
open RootResetNonemptyAppenderSelector
open RootResetAppenderSelectorChain

def lastTerm (source : Term) : List Term → Term
  | [] => source
  | next :: rest => lastTerm next rest

theorem lastTerm_map (function : Term → Term) (source : Term) (entries : List Term) :
    lastTerm (function source) (entries.map function) = function (lastTerm source entries) := by
  induction entries generalizing source with
  | nil => rfl
  | cons next rest ih => exact ih next

theorem routeEntries_lastTerm
    {Label : Type} (encode : Label → Term) (carrier : Term)
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    (path : Dispatcher.HasRoute tree route label) (source : Term) :
    lastTerm source ((routeEntries encode carrier tree route).map Prod.snd) =
      PrimitiveRoute.withResponse encode tree route carrier (.app (encode label) carrier) := by
  induction path generalizing source with
  | leaf => rfl
  | @left route label left right path ih =>
      change lastTerm (RouteGrammar.selectedLeft carrier
        (RouteGrammar.compiledCall encode left carrier) (RouteGrammar.compiledCall encode right carrier))
        (((routeEntries encode carrier left route).map
          (fun entry => (entry.1, RouteGrammar.selectedLeft carrier entry.2
            (RouteGrammar.compiledCall encode right carrier)))).map Prod.snd) = _
      rw [List.map_map]
      have mapped := lastTerm_map (fun term => RouteGrammar.selectedLeft carrier term
        (RouteGrammar.compiledCall encode right carrier))
        (RouteGrammar.compiledCall encode left carrier)
        ((routeEntries encode carrier left route).map Prod.snd)
      simp only [List.map_map] at mapped
      rw [ih] at mapped
      simpa only [Function.comp_def, PrimitiveRoute.withResponse] using mapped
  | @right route label left right path ih =>
      change lastTerm (RouteGrammar.selectedRight carrier
        (RouteGrammar.compiledCall encode left carrier) (RouteGrammar.compiledCall encode right carrier))
        (((routeEntries encode carrier right route).map
          (fun entry => (entry.1, RouteGrammar.selectedRight carrier
            (RouteGrammar.compiledCall encode left carrier) entry.2))).map Prod.snd) = _
      rw [List.map_map]
      have mapped := lastTerm_map (fun term => RouteGrammar.selectedRight carrier
        (RouteGrammar.compiledCall encode left carrier) term)
        (RouteGrammar.compiledCall encode right carrier)
        ((routeEntries encode carrier right route).map Prod.snd)
      simp only [List.map_map] at mapped
      rw [ih] at mapped
      simpa only [Function.comp_def, PrimitiveRoute.withResponse] using mapped

inductive TermSelections (select : Term → Option Term) : Term → List Term → Prop where
  | done (source : Term) : TermSelections select source []
  | next {source target : Term} {rest : List Term}
      (selected : select source = some target)
      (tail : TermSelections select target rest) :
      TermSelections select source (target :: rest)

theorem TermSelections.append {select : Term → Option Term}
    {source : Term} {entries suffix : List Term}
    (chain : TermSelections select source entries)
    (tail : TermSelections select (lastTerm source entries) suffix) :
    TermSelections select source (entries ++ suffix) := by
  induction chain with
  | done source => exact tail
  | next selected chain ih => exact .next selected (ih tail)

theorem dispatcher_selections
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (label : ActionLabel program) (bits : List Bool) (continuation carrier : Term)
    (carrierNot3 : carrier.headArity ≠ 3)
    (phaseEq : carrierPhase? program dispatcher.tree carrier = some label.1)
    (bitEq : carrierResponseBit? program dispatcher.tree carrier = some label.2)
    {source : Term} {entries : List Term}
    (chain : DispatcherChain (selectedAction program) carrier dispatcher.tree
      (dispatcher.route label) label source entries) :
    TermSelections (selectStep? program dispatcher) (shell bits continuation carrier source)
      (entries.map (shell bits continuation carrier)) := by
  induction chain with
  | done source => exact .done _
  | next edge tail ih =>
      exact .next (edge.selectStep? bits continuation carrier label.1 label.2 carrierNot3 phaseEq bitEq) ih

theorem action_selections
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {label : ActionLabel program} {bits : List Bool} {continuation carrier source : Term}
    {entries : List Term}
    (chain : ActionSelections program dispatcher label bits continuation carrier source entries) :
    TermSelections (selectStep? program dispatcher)
      (routeShell program dispatcher label bits continuation carrier source)
      (entries.map (routeShell program dispatcher label bits continuation carrier)) := by
  induction chain with
  | done source => exact .done _
  | next selected tail ih => exact .next selected ih

theorem responseEntries_tail_selections
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (label : ActionLabel program) (bits : List Bool) (continuation carrier : Term)
    (carrierNot2 : carrier.headArity ≠ 2) (carrierNot3 : carrier.headArity ≠ 3)
    (phaseEq : carrierPhase? program dispatcher.tree carrier = some label.1)
    (bitEq : carrierResponseBit? program dispatcher.tree carrier = some label.2) :
    TermSelections (selectStep? program dispatcher)
      (frameFirstRoot (compileActions program dispatcher.tree) bits continuation carrier)
      ((responseEntries program (dispatcher.route_valid label) bits continuation carrier).tail.map Prod.snd) := by
  have routed := dispatcher_selections program dispatcher label bits continuation carrier
    carrierNot3 phaseEq bitEq (routeEntries_dispatcherChain (selectedAction program) carrier
      (dispatcher.route_valid label))
  have action := action_selections (actionEntries_selections program dispatcher label bits continuation carrier
    carrierNot2 phaseEq bitEq)
  have endpoint := routeEntries_lastTerm (selectedAction program) carrier (dispatcher.route_valid label)
    (RouteGrammar.compiledCall (selectedAction program) dispatcher.tree carrier)
  have joined := routed.append (by
    rw [lastTerm_map, endpoint]
    exact action)
  refine .next (RootResetNormalResponseSelectorChain.selectStep?_frameFirstRoot
    program dispatcher bits continuation carrier) (.next
    (RootResetNormalResponseSelectorChain.selectStep?_frameSecondRoot
      program dispatcher bits continuation carrier) ?_)
  simpa only [responseEntries, List.tail_cons, List.append_eq, List.map_append, List.map_cons, List.map_nil,
    List.map_map, List.append_assoc, List.cons_append, List.nil_append,
    shell, routeShell] using! joined

theorem TermSelections.selectsSamples
    {select : Term → Option Term} {source : Term} {entries : List Term}
    (chain : TermSelections select source entries)
    {Control : Type} {before : FiniteController.Configuration Control}
    {samples : List (FiniteController.Configuration Control)}
    (beforeEq : before.cursor.erase = source)
    (samplesEq : samples.map (fun sample => sample.cursor.erase) = entries) :
    RootResetExactTraceAgreement.SelectorChain select before samples := by
  induction chain generalizing before samples with
  | done source =>
      cases samples with
      | nil => exact .done before
      | cons sample rest => cases samplesEq
  | @next source target rest selected tail ih =>
      cases samples with
      | nil => cases samplesEq
      | cons sample samples =>
          have equalities := List.cons.inj samplesEq
          dsimp only at equalities
          exact .next (by rw [beforeEq, equalities.1]; exact selected)
            (ih equalities.1 equalities.2)

/-- Every response contraction after the first FRAME residual, on the
actual scheduler trace, for arbitrary action words and dispatcher routes. -/
theorem normalResponse_body_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool)
    (bits : List Bool) (continuation carrier : Term)
    (carrierNot2 : carrier.headArity ≠ 2) (carrierNot3 : carrier.headArity ≠ 3)
    (phaseEq : carrierPhase? program dispatcher.tree carrier = some registers.phase)
    (bitEq : carrierResponseBit? program dispatcher.tree carrier = some bit) :
    ∃ first rest,
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerResponse.returnConfiguration program dispatcher registers bit bits continuation carrier [])
        (SchedulerResponse.responseStartConfiguration program dispatcher registers bit bits continuation carrier [])
        (first :: rest) ∧
      RootResetExactTraceAgreement.SelectorChain (selectStep? program dispatcher) first rest := by
  obtain ⟨samples, exactChain, _, erases⟩ := SchedulerCycle.normalResponse_exactPositionedMutationChain
    program dispatcher registers bit bits continuation carrier []
  cases samples with
  | nil => cases erases
  | cons first rest =>
      have equalities := List.cons.inj erases
      refine ⟨first, rest, exactChain, ?_⟩
      exact (responseEntries_tail_selections program dispatcher (registers.phase, bit) bits continuation carrier
        carrierNot2 carrierNot3 phaseEq bitEq).selectsSamples equalities.1 equalities.2

end PureSFormal.Research.RootResetNormalResponseBodyChain
