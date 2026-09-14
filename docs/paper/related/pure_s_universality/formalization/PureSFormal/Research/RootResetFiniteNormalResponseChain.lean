import PureSFormal.Research.RootResetFiniteResponseEndpointAgreement
import PureSFormal.Research.RootResetFiniteFrameAgreement
import PureSFormal.Research.RootResetMixedNormalResponseChain
import PureSFormal.Research.RootResetBaseEndpointExecution

/-! Exact normal response bodies for the full finite selector. -/
namespace PureSFormal.Research.RootResetFiniteNormalResponseChain
open PureSFormal.PureS
open SchedulerResponseInvariant
open RootResetActivePendingAgreement RootResetFiniteResponseEndpointAgreement
open RootResetEmptyRouteSelectorChain RootResetWrappedAppenderSelectorChain
open RootResetNormalResponseBodyChain

theorem follow_replace (address : Address) (origin endpoint : Cursor)
    (followed : RootResetEdgeFragment.follow address origin = some endpoint) (replacement : Term) :
    (origin.focus.replace? address replacement).map (Cursor.rebuild origin.parents) =
      some (Cursor.rebuild endpoint.parents replacement) := by
  induction address generalizing origin with
  | nil =>
      have same : origin = endpoint := Option.some.inj followed
      subst origin
      simp only [Term.replace?_root, Option.map_some]

  | cons direction address ih =>
      rcases origin with ⟨source, parents⟩
      cases source with
      | s => cases direction <;> cases followed
      | app fn arg =>
          cases direction with
          | left =>
              have result := ih ⟨fn, .left arg :: parents⟩ followed
              change ((do let changed ← fn.replace? address replacement; pure (Term.app changed arg))).map (Cursor.rebuild parents) = _
              cases changed : fn.replace? address replacement with
              | none => rw [changed] at result; exact result
              | some term => rw [changed] at result; exact result
          | right =>
              have result := ih ⟨arg, .right fn :: parents⟩ followed
              change ((do let changed ← arg.replace? address replacement; pure (Term.app fn changed))).map (Cursor.rebuild parents) = _
              cases changed : arg.replace? address replacement with
              | none => rw [changed] at result; exact result
              | some term => rw [changed] at result; exact result

theorem follow_contract (address : Address) (origin endpoint after : Cursor) (target : Term)
    (followed : RootResetEdgeFragment.follow address origin = some endpoint)
    (contracted : endpoint.rdx? = some after) (contracts : origin.focus.contractAt? address = some target) :
    after.erase = Cursor.rebuild origin.parents target := by
  have subterm := RootResetEdgeFragment.follow_subterm address origin endpoint followed
  cases root : endpoint.focus.contractRoot? with
  | none => simp only [Cursor.rdx?, root] at contracted; cases contracted
  | some replacement =>
      simp only [Cursor.rdx?, root] at contracted
      have equal : { endpoint with focus := replacement } = after := Option.some.inj contracted
      subst after
      simp only [Term.contractAt?, subterm, root] at contracts
      have result := follow_replace address origin endpoint followed replacement
      rw [contracts] at result
      exact (Option.some.inj result).symm

theorem selected_contract {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {layers : List Layer} {source target : Term} {address : Address}
    (selected : Selected program layout parents layers source address)
    (contracts : source.contractAt? address = some target) :
    RootResetFinitePrioritySelector.selectStep? program layout
      (Cursor.rebuild parents (wrap (compileActions program layout.tree) layers source)) =
        some (Cursor.rebuild parents (wrap (compileActions program layout.tree) layers target)) := by
  obtain ⟨endpoint, after, followed, contracted, execution⟩ := selected
  have targetEq := follow_contract address ⟨source, parentsAfter (compileActions program layout.tree) layers parents⟩ endpoint after target
    followed contracted contracts
  rw [targetEq, RootResetFrameSpineWalker.rebuild_spineParents] at execution
  exact execution

theorem dispatcher_edge {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {layers : List Layer} {bits : List Bool} {continuation carrier : Term} {label : ActionLabel program}
    (endpoints : Endpoints program layout parents layers bits continuation carrier label) {source target : Term}
    (edge : DispatcherEdge (selectedAction program) carrier layout.tree (layout.route label) label source target) :
    RootResetFinitePrioritySelector.selectStep? program layout
      (Cursor.rebuild parents (wrap (compileActions program layout.tree) layers (shell bits continuation carrier source))) =
        some (Cursor.rebuild parents (wrap (compileActions program layout.tree) layers (shell bits continuation carrier target))) := by
  cases edge with
  | initial path =>
      apply selected_contract endpoints.initial
      have contracts : (RouteGrammar.compiledCall (selectedAction program) layout.tree carrier).contractAt? [] =
          some (RootResetDispatcherNodeStages.firstActivation (selectedAction program) layout.tree carrier) := by
        cases layout.tree <;> rfl
      simpa only [List.append_nil] using! RootResetWrappedEmptyRouteSelectorChain.shell_contractAt bits continuation carrier contracts
  | row progress view shape contracts =>
      obtain ⟨actualView, actualShape, selected⟩ := endpoints.route source progress
      have equal := RootResetWholeDispatcherStages.RouteShape.deterministic actualShape shape
      subst actualView
      apply selected_contract selected
      exact RootResetWrappedEmptyRouteSelectorChain.shell_contractAt bits continuation carrier contracts

theorem route_complete {Label : Type} (encode : Label → Term) (carrier : Term)
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    (path : Dispatcher.HasRoute tree route label) :
    RouteMutation encode carrier tree route label true
      (PrimitiveRoute.withResponse encode tree route carrier (.app (encode label) carrier)) := by
  induction path with
  | leaf label => exact .leaf label
  | left path ih => exact .innerLeft ih
  | right path ih => exact .innerRight ih

theorem spec_row_address (spec : RootResetAppenderFiniteRows.Spec) (row : RootResetWholeAppenderStages.Row)
    (matched : spec.pattern.matchesBool row.term = true) {target : Term} (targetEq : row.target? = some target) :
    spec.address = row.localAddress := by
  cases row with
  | first position bit rest accumulator duplicate histories =>
      exact (RootResetAppenderFiniteRows.matching_addresses_eq spec
        (.first bit rest histories.length) _ matched (RootResetAppenderFiniteRows.first_matches bit rest accumulator duplicate histories)).trans
          (RootResetAppenderFiniteRows.first_address bit rest histories)
  | secondNonfinal position bit next tail accumulator history histories =>
      exact (RootResetAppenderFiniteRows.matching_addresses_eq spec
        (.second next tail histories.length) _ matched (RootResetAppenderFiniteRows.second_matches next tail accumulator history histories)).trans
          (RootResetAppenderFiniteRows.second_address next tail histories)
  | secondFinal position bit accumulator history histories => cases targetEq

theorem appender_edge {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {layers : List Layer} {bits : List Bool} {continuation carrier : Term} {label : ActionLabel program}
    (endpoints : Endpoints program layout parents layers bits continuation carrier label) {source target : Term}
    (edge : AppenderEdge program label carrier source target) :
    RootResetFinitePrioritySelector.selectStep? program layout
      (Cursor.rebuild parents (wrap (compileActions program layout.tree) layers
        (RootResetNonemptyAppenderSelector.routeShell program layout label bits continuation carrier source))) =
        some (Cursor.rebuild parents (wrap (compileActions program layout.tree) layers
          (RootResetNonemptyAppenderSelector.routeShell program layout label bits continuation carrier target))) := by
  cases edge with
  | initial first rest emitted =>
      have selected := endpoints.action_call _ (route_complete (selectedAction program) carrier (layout.route_valid label)) first rest emitted
      apply selected_contract selected
      exact RootResetWrappedEmptyRouteSelectorChain.shell_contractAt bits continuation carrier
        (RootResetResponseSampleParserBridge.RouteBridge.withResponse_contractAt? (layout.route_valid label)
          (RootResetDispatcherSelectedHandoff.selectedAction_nonempty_contractRoot?_firstRow program label carrier first rest emitted))
  | row row target valid progress targetEq =>
      obtain ⟨spec, member, matched, selected⟩ := endpoints.appender row.term progress
      rw [spec_row_address spec row matched targetEq] at selected
      apply selected_contract selected
      exact RootResetWrappedEmptyRouteSelectorChain.shell_contractAt bits continuation carrier
        (RootResetNonemptyAppenderSelector.withResponse_contractAt?_append (selectedAction program) (layout.route_valid label) carrier
          (row.contracts_of_target?_eq_some valid targetEq))

theorem dispatcher_chain {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {layers : List Layer} {bits : List Bool} {continuation carrier : Term} {label : ActionLabel program}
    (endpoints : Endpoints program layout parents layers bits continuation carrier label) {source : Term} {entries : List Term}
    (chain : DispatcherChain (selectedAction program) carrier layout.tree (layout.route label) label source entries) :
    TermSelections (RootResetFinitePrioritySelector.selectStep? program layout)
      (Cursor.rebuild parents (wrap (compileActions program layout.tree) layers (shell bits continuation carrier source)))
      (entries.map (fun target => Cursor.rebuild parents (wrap (compileActions program layout.tree) layers (shell bits continuation carrier target)))) := by
  induction chain with
  | done source => exact .done _
  | next edge tail ih => exact .next (dispatcher_edge endpoints edge) ih

theorem appender_chain {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {layers : List Layer} {bits : List Bool} {continuation carrier : Term} {label : ActionLabel program}
    (endpoints : Endpoints program layout parents layers bits continuation carrier label) {source : Term} {entries : List Term}
    (chain : AppenderChain program label carrier source entries) :
    TermSelections (RootResetFinitePrioritySelector.selectStep? program layout)
      (Cursor.rebuild parents (wrap (compileActions program layout.tree) layers
        (RootResetNonemptyAppenderSelector.routeShell program layout label bits continuation carrier source)))
      (entries.map (fun target => Cursor.rebuild parents (wrap (compileActions program layout.tree) layers
        (RootResetNonemptyAppenderSelector.routeShell program layout label bits continuation carrier target)))) := by
  induction chain with
  | done source => exact .done _
  | next edge tail ih => exact .next (appender_edge endpoints edge) ih

theorem responseEntries_tail_selections {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {history : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents history)
    (layers : List Layer) (label : ActionLabel program) (bits : List Bool) (continuation carrier : Term)
    (endpoints : Endpoints program layout parents layers bits continuation carrier label) :
    TermSelections (RootResetFinitePrioritySelector.selectStep? program layout)
      (Cursor.rebuild parents (wrap (compileActions program layout.tree) layers
        (frameFirstRoot (compileActions program layout.tree) bits continuation carrier)))
      ((responseEntries program (layout.route_valid label) bits continuation carrier).tail.map
        (fun entry => Cursor.rebuild parents (wrap (compileActions program layout.tree) layers entry.2))) := by
  have first := RootResetFiniteFrameAgreement.first outer layers bits continuation carrier
  have second := RootResetFiniteFrameAgreement.second outer layers bits continuation carrier
  have routed := dispatcher_chain endpoints (routeEntries_dispatcherChain (selectedAction program) carrier (layout.route_valid label))
  have action := appender_chain endpoints (actionEntries_appenderChain program label carrier)
  have endpoint := routeEntries_lastTerm (selectedAction program) carrier (layout.route_valid label)
    (RouteGrammar.compiledCall (selectedAction program) layout.tree carrier)
  have mapped := lastTerm_map (fun term => Cursor.rebuild parents
    (wrap (compileActions program layout.tree) layers (shell bits continuation carrier term)))
    (RouteGrammar.compiledCall (selectedAction program) layout.tree carrier)
    ((routeEntries (selectedAction program) carrier layout.tree (layout.route label)).map Prod.snd)
  rw [endpoint] at mapped
  have joined := routed.append (mapped.symm ▸ action)
  refine .next first (.next second ?_)
  simpa only [responseEntries, List.tail_cons, List.append_eq, List.map_append, List.map_cons, List.map_nil,
    List.map_map, List.append_assoc, List.cons_append, List.nil_append,
    shell, RootResetNonemptyAppenderSelector.routeShell, Function.comp_def] using! joined

theorem entries_rebuild (actions : Term) (layers : List Layer) (parents : List ParentFrame)
    (entries : List (Bool × Term)) :
    entries.map (fun entry => Cursor.rebuild (parentsAfter actions layers parents) entry.2) =
      entries.map (fun entry => Cursor.rebuild parents (wrap actions layers entry.2)) := by
  induction entries with
  | nil => rfl
  | cons entry entries ih =>
      change _ :: _ = _ :: _
      rw [ih]
      exact congrArg (fun term => term :: _) (RootResetFrameSpineWalker.rebuild_spineParents _ _ _)

theorem normalResponse_body_selectorChain {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {history : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents history)
    (layers : List Layer) (registers : SchedulerControl.Registers program) (bit : Bool)
    (bits : List Bool) (continuation carrier : Term)
    (endpoints : Endpoints program layout parents layers bits continuation carrier (registers.phase, bit)) :
    let allParents := parentsAfter (compileActions program layout.tree) layers parents
    ∃ first rest,
      ExactMutationChain (SchedulerControl.machine program layout)
        (SchedulerResponse.returnConfiguration program layout registers bit bits continuation carrier allParents)
        (SchedulerResponse.responseStartConfiguration program layout registers bit bits continuation carrier allParents)
        (first :: rest) ∧
      RootResetExactTraceAgreement.SelectorChain (RootResetFinitePrioritySelector.selectStep? program layout) first rest ∧
      first.cursor.erase = Cursor.rebuild parents (wrap (compileActions program layout.tree) layers
        (frameFirstRoot (compileActions program layout.tree) bits continuation carrier)) := by
  dsimp only
  obtain ⟨samples, exactChain, _, erases⟩ := SchedulerCycle.normalResponse_exactPositionedMutationChain
    program layout registers bit bits continuation carrier (parentsAfter (compileActions program layout.tree) layers parents)
  replace erases := erases.trans (entries_rebuild _ _ _ _)
  cases samples with
  | nil => cases erases
  | cons first rest =>
      have equalities := List.cons.inj erases
      exact ⟨first, rest, exactChain,
        (responseEntries_tail_selections outer layers (registers.phase, bit) bits continuation carrier endpoints).selectsSamples
          equalities.1 equalities.2, equalities.1⟩

theorem wrap_replicate (actions : Term) (bits : List Bool) (continuation : Term)
    (count : Nat) (body : Term) :
    wrap actions (List.replicate count (word bits, continuation)) body =
      RootResetWrappedFrameSelectorProof.pending actions bits continuation count body := by
  induction count with
  | zero => rfl
  | succ count ih =>
      exact congrArg (frame (environmentCode actions bits) continuation) ih

theorem normalResponse_body_selectorChain_with_length {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {history : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents history)
    (layers : List Layer) (registers : SchedulerControl.Registers program) (bit : Bool)
    (bits : List Bool) (continuation carrier : Term)
    (endpoints : Endpoints program layout parents layers bits continuation carrier (registers.phase, bit)) :
    let allParents := parentsAfter (compileActions program layout.tree) layers parents
    ∃ first rest,
      ExactMutationChain (SchedulerControl.machine program layout)
        (SchedulerResponse.returnConfiguration program layout registers bit bits continuation carrier allParents)
        (SchedulerResponse.responseStartConfiguration program layout registers bit bits continuation carrier allParents)
        (first :: rest) ∧
      RootResetExactTraceAgreement.SelectorChain (RootResetFinitePrioritySelector.selectStep? program layout) first rest ∧
      first.cursor.erase = Cursor.rebuild parents (wrap (compileActions program layout.tree) layers
        (frameFirstRoot (compileActions program layout.tree) bits continuation carrier)) ∧
      (first :: rest).length = LocalResponse.completedCost program
        (layout.route (registers.phase, bit)) (registers.phase, bit) := by
  dsimp only
  obtain ⟨samples, exactChain, _, erases⟩ := SchedulerCycle.normalResponse_exactPositionedMutationChain
    program layout registers bit bits continuation carrier (parentsAfter (compileActions program layout.tree) layers parents)
  have lengthEq := congrArg List.length erases
  simp only [List.length_map, responseEntries_length] at lengthEq
  replace erases := erases.trans (entries_rebuild _ _ _ _)
  cases samples with
  | nil => cases erases
  | cons first rest =>
      have equalities := List.cons.inj erases
      exact ⟨first, rest, exactChain,
        (responseEntries_tail_selections outer layers (registers.phase, bit) bits continuation carrier endpoints).selectsSamples
          equalities.1 equalities.2, equalities.1, lengthEq⟩

/-- Every actual selected-response trace supplies the finite label and carrier
facts needed by the whole selector throughout the normal response body. -/
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
      RootResetExactTraceAgreement.SelectorChain (RootResetFinitePrioritySelector.selectStep? program dispatcher) first rest ∧
      first.cursor.erase = (SchedulerInvariant.contextOfParents parents).plug
        (RootResetWrappedFrameSelectorProof.pending (compileActions program dispatcher.tree) outerBits outerContinuation pendingCount
          (frameFirstRoot (compileActions program dispatcher.tree) seedBits continuation carrier)) := by
  dsimp only
  obtain ⟨first, rest, body, selected, firstErase⟩ := normalResponse_body_selectorChain clean
    (List.replicate pendingCount (word outerBits, outerContinuation))
    (SchedulerCycle.scannedRegisters registers bit suffix) bit seedBits continuation
    (SchedulerCycle.deletedCarrier bit outerContext innerContext)
    (RootResetFiniteResponseEndpointAgreement.selected_response clean _ trace invariant)
  refine ⟨first, rest, ?_, selected, ?_⟩
  · simpa only [RootResetBaseEndpointExecution.parents_replicate, CheckpointDecoder.openEnvironment_word] using body
  · rw [SchedulerInvariant.contextOfParents_plug, ← wrap_replicate]
    exact firstErase

theorem selectedResponseTrace_body_selectorChain_with_length
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
      RootResetExactTraceAgreement.SelectorChain (RootResetFinitePrioritySelector.selectStep? program dispatcher) first rest ∧
      first.cursor.erase = (SchedulerInvariant.contextOfParents parents).plug
        (RootResetWrappedFrameSelectorProof.pending (compileActions program dispatcher.tree) outerBits outerContinuation pendingCount
          (frameFirstRoot (compileActions program dispatcher.tree) seedBits continuation carrier)) ∧
      (first :: rest).length = LocalResponse.completedCost program
        (dispatcher.route (responseRegisters.phase, bit)) (responseRegisters.phase, bit) := by
  dsimp only
  obtain ⟨first, rest, body, selected, firstErase, lengthEq⟩ := normalResponse_body_selectorChain_with_length clean
    (List.replicate pendingCount (word outerBits, outerContinuation))
    (SchedulerCycle.scannedRegisters registers bit suffix) bit seedBits continuation
    (SchedulerCycle.deletedCarrier bit outerContext innerContext)
    (RootResetFiniteResponseEndpointAgreement.selected_response clean _ trace invariant)
  refine ⟨first, rest, ?_, selected, ?_, lengthEq⟩
  · simpa only [RootResetBaseEndpointExecution.parents_replicate, CheckpointDecoder.openEnvironment_word] using body
  · rw [SchedulerInvariant.contextOfParents_plug, ← wrap_replicate]
    exact firstErase

/-- The complete operational response has only its two front-boundary
selections as inputs; every body step is supplied by the generated trace. -/
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
    RootResetFinitePrioritySelector.selectStep? program dispatcher start.cursor.erase = some c4.cursor.erase →
    RootResetFinitePrioritySelector.selectStep? program dispatcher c4.cursor.erase =
      some (Cursor.rebuild parents (frameFirstRoot (compileActions program dispatcher.tree) seedBits
        continuation (SchedulerCycle.deletedCarrier bit outerContext innerContext))) →
    ∃ configurations,
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerCycle.selectedReturnConfiguration program dispatcher registers bit suffix seedBits continuation
          (SchedulerCycle.deletedCarrier bit outerContext innerContext) parents) start configurations ∧
      RootResetExactTraceAgreement.SelectorChain (RootResetFinitePrioritySelector.selectStep? program dispatcher) start configurations ∧
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
  obtain ⟨first, rest, body, selectedBody, firstErase, lengthEq⟩ :=
    selectedResponseTrace_body_selectorChain_with_length trace invariant seedBits continuation remaining outerParents clean
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
    simpa only [RootResetMarkedFrameSelectorProof.pending_rebuild_under_parents] using frameSelected
  · rw [List.length_cons, lengthEq, Nat.add_comm]

end PureSFormal.Research.RootResetFiniteNormalResponseChain
