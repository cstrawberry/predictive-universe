import PureSFormal.Research.RootResetPersistentSelectedAddressBridge
import PureSFormal.Research.RootResetDispatcherSelectedHandoff
import PureSFormal.Research.RootResetWholeDispatcherSelectedHandoff
import PureSFormal.Research.RootResetResponseBoundaryStages
import PureSFormal.PureS.SchedulerResponseClassification

/-!
# Response-sample parser bridge

The executable scheduler enumerates every contraction sample of a normal
response by `ResponseRootMutation`.  This module connects the two mutation
families with further contractions to the corresponding bare-term parsers:
unfinished dispatcher-route rows and unfinished Push/appender rows.

The statements retain an explicit marked prefix and an explicit outer
role-indexed context.  Thus the parser recovers its phase and route from the
same whole bare term on which the root-reset selector operates, while a
pending-frame context can still be lifted outside that parsed term.
-/

namespace PureSFormal.Research.RootResetResponseSampleParserBridge

open PureSFormal.PureS
open PureSFormal.PureS.SchedulerResponseInvariant
open PureSFormal.PureS.SchedulerControl
open PureSFormal.PureS.SchedulerCycle
open RootResetReachableStageGrammar

/-! The two syntax-local handoffs for route-A's response coverage
are imported under response-family names.  The first
contracts the terminal fork child and reparses the selected route.  The
second contracts the selected nonempty action and reparses the first Push
row, both through the complete marked-prefix context. -/

abbrev terminalForkChild_exact_selectedRoute
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {view : RootResetWholeDispatcherStages.View program}
    {forked : RootResetDispatcherNodeStages.ForkedView}
    {leafLabel : ActionLabel program}
    (parsed : RootResetWholeDispatcherStages.parse? program layout term =
      some view)
    (stageEq : view.stage = .forked forked)
    (selectedLeaf :
      RootResetWholeDispatcherSelectedHandoff.selectedTree view.endpoint.node =
        .leaf leafLabel)
    (remainingEq : view.endpoint.node.remaining = []) :=
  RootResetWholeDispatcherSelectedHandoff.parsedForked_selectedLeaf_exact_handoff
    parsed stageEq selectedLeaf remainingEq

abbrev selectedAction_nonempty_exact_firstPush
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {view : RootResetWholeDispatcherStages.View program}
    {forked : RootResetDispatcherNodeStages.ForkedView}
    {bit : Bool} {rest : List Bool}
    (parsed : RootResetWholeDispatcherStages.parse? program layout term =
      some view)
    (stageEq : view.stage = .forked forked)
    (selectedLeaf :
      RootResetWholeDispatcherSelectedHandoff.selectedTree view.endpoint.node =
        .leaf view.label)
    (remainingEq : view.endpoint.node.remaining = [])
    (emitted : PrimitiveLocalResponse.emitted program view.label = bit :: rest) :=
  RootResetWholeDispatcherSelectedHandoff.parsedForked_selectedLeaf_nonempty_action_to_firstPush
    parsed stageEq selectedLeaf remainingEq emitted

/-! ## Exact adjacent-pair inversion -/

set_option maxHeartbeats 800000 in
/-- The head of a response-sample pairing exposes the exact script PC,
runtime cursor, rebuilt response root, and mutation-family constructor. -/
theorem responseSamplePairs_head
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {registers : Registers program} {bit : Bool}
    {bits : List Bool} {continuation carrier : Term}
    {parents : List ParentFrame}
    {configuration : SchedulerResponseInvariant.Configuration
      program dispatcher}
    {configurationTail : List
      (SchedulerResponseInvariant.Configuration program dispatcher)}
    {done : Bool} {responseTerm : Term}
    {entryTail : List (Bool × Term)}
    (pairs : ResponseSamplePairs program dispatcher registers bit bits
      continuation carrier parents (configuration :: configurationTail)
      ((done, responseTerm) :: entryTail)) :
    ∃ (pc : SchedulerControl.ScriptPC program dispatcher
          (.normalResponse (registers.phase, bit))) (cursor : Cursor),
      configuration =
          ⟨some (.script (.normalResponse (registers.phase, bit)) pc
            registers), cursor⟩ ∧
        SchedulerInvariant.ControlPosition program dispatcher
          (.script (.normalResponse (registers.phase, bit)) pc registers)
          cursor ∧
        cursor.erase = Cursor.rebuild parents responseTerm ∧
        ResponseRootMutation program dispatcher.tree
          (dispatcher.route_valid (registers.phase, bit)) bits continuation
          carrier done responseTerm := by
  cases pairs with
  | cons pc cursor done responseTerm position eraseEq root tail =>
      exact ⟨pc, cursor, rfl, position, eraseEq, root⟩

/-- Inverting a nonempty exact mutation chain identifies the actual next
contraction sample and leaves the exact suffix chain. -/
theorem exactMutationChain_cons
    {Control : Type} {machine : FiniteController.Machine Control}
    {terminal before sample : FiniteController.Configuration Control}
    {samples : List (FiniteController.Configuration Control)}
    (chain : ExactMutationChain machine terminal before (sample :: samples)) :
    ∃ ticks,
      FiniteController.seekMutation machine ticks before = some sample ∧
        ExactMutationChain machine terminal sample samples := by
  cases chain with
  | next searchTicks found tail => exact ⟨searchTicks, found, tail⟩

namespace RouteBridge

/-- Every nonfinal dispatcher-route mutation is exactly one registered
exposed or forked node row on the selected route. -/
theorem exists_routeShape_of_not_done
    {Label : Type} {encode : Label → Term} {carrier : Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    {done : Bool} {term : Term}
    (progress : RouteMutation encode carrier tree route label done term)
    (notDone : done = false) :
    ∃ view, RootResetWholeDispatcherStages.RouteShape
      encode tree route view term := by
  induction progress with
  | leaf label => simp at notDone
  | @exposeLeft left right route label path =>
      exact ⟨RootResetWholeDispatcherStages.RouteView.root left right
        .left route (.exposed ⟨carrier, carrier⟩),
        .root left right .left route (.exposed ⟨carrier, carrier⟩)⟩
  | @selectLeft left right route label path =>
      exact ⟨RootResetWholeDispatcherStages.RouteView.root left right
        .left route (.forked ⟨carrier, carrier, carrier⟩),
        .root left right .left route
          (.forked ⟨carrier, carrier, carrier⟩)⟩
  | @innerLeft left right route label done inner progress ih =>
      obtain ⟨view, shape⟩ := ih notDone
      exact ⟨view.wrapLeft carrier
          (RouteGrammar.compiledCall encode right carrier),
        .left carrier carrier shape⟩
  | @exposeRight left right route label path =>
      exact ⟨RootResetWholeDispatcherStages.RouteView.root left right
        .right route (.exposed ⟨carrier, carrier⟩),
        .root left right .right route (.exposed ⟨carrier, carrier⟩)⟩
  | @selectRight left right route label path =>
      exact ⟨RootResetWholeDispatcherStages.RouteView.root left right
        .right route (.forked ⟨carrier, carrier, carrier⟩),
        .root left right .right route
          (.forked ⟨carrier, carrier, carrier⟩)⟩
  | @innerRight left right route label done inner progress ih =>
      obtain ⟨view, shape⟩ := ih notDone
      exact ⟨view.wrapRight carrier
          (RouteGrammar.compiledCall encode left carrier),
        .right carrier carrier shape⟩

end RouteBridge

namespace ActionBridge

/-- Every appender mutation is one valid registered row.  The Boolean index
agrees exactly with whether that row is the completed final row. -/
theorem exists_valid_row
    {expected : Nat} {emitted remaining : List Bool}
    {initial : Term} {outer : List Term} {done : Bool} {term : Term}
    (progress : ActionMutation expected remaining initial outer done term)
    (suffix : emitted.drop outer.length = remaining) :
    ∃ row : RootResetWholeAppenderStages.Row,
      row.Valid emitted ∧
        row.term = term ∧
        (row.stage = .secondFinal ↔ done = true) := by
  induction progress generalizing emitted with
  | first bit rest initial outer count =>
      refine ⟨.first outer.length bit rest initial initial outer,
        ⟨suffix, rfl⟩, ?_, ?_⟩
      · rfl
      · simp [RootResetWholeAppenderStages.Row.stage]
  | second bit rest initial outer count =>
      cases rest with
      | nil =>
          refine ⟨.secondFinal outer.length bit (extendAccumulator bit initial)
            (pushHistory bit initial) outer, ⟨?_, rfl⟩, ?_, ?_⟩
          · simpa using suffix
          · rfl
          · simp [RootResetWholeAppenderStages.Row.stage]
      | cons next tail =>
          refine ⟨.secondNonfinal outer.length bit next tail
            (extendAccumulator bit initial)
            (pushHistory bit initial) outer, ⟨?_, rfl⟩, ?_, ?_⟩
          · simpa using suffix
          · rfl
          · simp [RootResetWholeAppenderStages.Row.stage]
  | @inner bit rest initial outer done term progress ih =>
      have innerSuffix :
          emitted.drop (pushHistory bit initial :: outer).length = rest := by
        rw [show (pushHistory bit initial :: outer).length = outer.length + 1
          by simp, ← List.drop_drop]
        simp [suffix]
      exact ih innerSuffix

/-- A nonfinal appender mutation has a present selected replacement. -/
theorem exists_selected_row_of_not_done
    {expected : Nat} {emitted remaining : List Bool}
    {initial : Term} {outer : List Term} {done : Bool} {term : Term}
    (progress : ActionMutation expected remaining initial outer done term)
    (suffix : emitted.drop outer.length = remaining)
    (notDone : done = false) :
    ∃ (row : RootResetWholeAppenderStages.Row) (replacement : Term),
      row.Valid emitted ∧
        row.term = term ∧
        row.replacement? = some replacement := by
  obtain ⟨row, valid, source, finalIff⟩ := exists_valid_row progress suffix
  have notFinal : row.stage ≠ .secondFinal := by
    intro final
    have doneTrue := finalIff.mp final
    rw [notDone] at doneTrue
    contradiction
  cases row with
  | first position bit rest accumulator duplicate histories =>
      exact ⟨_,
        RootResetAppenderStages.firstTarget bit rest accumulator duplicate,
        valid, source, rfl⟩
  | secondNonfinal position bit next tail accumulator currentHistory histories =>
      exact ⟨_,
        RootResetAppenderStages.firstRow next tail accumulator accumulator,
        valid, source, rfl⟩
  | secondFinal position bit accumulator currentHistory histories =>
      exact False.elim (notFinal rfl)

end ActionBridge

/-! ## Frame-prefix rows -/

/-- The first sampled frame residual is the registered `R₁` row.  Its next
contraction is the left child and produces the exact second residual. -/
theorem frameFirst_parses_and_contracts
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation carrier : Term) :
    RootResetReachableStageGrammar.classifyEndpoint
        (compileActions program tree)
        (frameFirstRoot (compileActions program tree) bits continuation
          carrier) =
      ⟨.frameR1, carrier, some bits⟩ ∧
    (frameFirstRoot (compileActions program tree) bits continuation
      carrier).contractAt? [.left] =
      some (frameSecondRoot (compileActions program tree) bits continuation
        carrier) := by
  constructor
  · simpa [frameFirstRoot] using
      RootResetReachableStageGrammar.classifyEndpoint_frameR1
        (compileActions program tree) bits carrier continuation carrier
  · rfl

/-- The second sampled frame residual is the registered `R₂` row.  Its next
contraction is the left-left child and produces the exact fresh Local. -/
theorem frameSecond_parses_and_contracts
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation carrier : Term) :
    RootResetReachableStageGrammar.classifyEndpoint
        (compileActions program tree)
        (frameSecondRoot (compileActions program tree) bits continuation
          carrier) =
      ⟨.frameR2, carrier, some bits⟩ ∧
    (frameSecondRoot (compileActions program tree) bits continuation
      carrier).contractAt? [.left, .left] =
      some (freshLocal (compileActions program tree) bits continuation
        carrier) := by
  constructor
  · simpa [frameSecondRoot] using
      RootResetReachableStageGrammar.classifyEndpoint_frameR2
        (compileActions program tree) bits carrier carrier continuation carrier
  · rfl

/-! The next three lemmas expose the mutation-free cursor movement between
the three frame samples.  Their scripts are the literal rows between the
`Rdx` entries of `PrimitiveScripts.framePrefixScript`. -/

/-- After the first frame contraction, the single cursor-only `L` row reaches
the same left-child address returned by the root-reset frame classifier. -/
theorem frameFirst_zeroPrefix_reaches_selected
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation carrier : Term)
    (parents : List ParentFrame) :
    ∃ selected after,
      Script.CursorOnly [.L] ∧
      Script.run [.L]
          ⟨frameFirstRoot (compileActions program tree) bits continuation
            carrier, parents⟩ = some selected ∧
      RootResetSelectorContract.cursorAddress selected =
        RootResetSelectorContract.addressFromParents parents ++ [.left] ∧
      selected.rdx? = some after ∧
      after.erase = Cursor.rebuild parents
        (frameSecondRoot (compileActions program tree) bits continuation
          carrier) := by
  refine ⟨⟨.app (dispatcherCode (compileActions program tree) bits) carrier,
      .left (.app continuation carrier) :: parents⟩,
    ⟨.app (.app (actCode (compileActions program tree)) carrier)
        (.app (seedCode bits) carrier),
      .left (.app continuation carrier) :: parents⟩,
    trivial, rfl, ?_, rfl, rfl⟩
  simp [RootResetSelectorContract.cursorAddress,
    RootResetSelectorContract.addressFromParents]

/-- After the second frame contraction, the exact cursor-only `U,L,L` rows
reach the left-left redex returned by the root-reset frame classifier. -/
theorem frameSecond_zeroPrefix_reaches_selected
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation carrier : Term)
    (parents : List ParentFrame) :
    let afterSecond : Cursor :=
      ⟨.app (.app (actCode (compileActions program tree)) carrier)
          (.app (seedCode bits) carrier),
        .left (.app continuation carrier) :: parents⟩
    ∃ selected after,
      Script.CursorOnly [.U, .L, .L] ∧
      Script.run [.U, .L, .L] afterSecond = some selected ∧
      RootResetSelectorContract.cursorAddress selected =
        RootResetSelectorContract.addressFromParents parents ++
          [.left, .left] ∧
      selected.rdx? = some after ∧
      after.erase = Cursor.rebuild parents
        (freshLocal (compileActions program tree) bits continuation carrier) := by
  dsimp only
  refine ⟨⟨.app (actCode (compileActions program tree)) carrier,
      .left (.app (seedCode bits) carrier) ::
        .left (.app continuation carrier) :: parents⟩,
    ⟨.app (freshHField carrier)
        (.app (compileActions program tree) carrier),
      .left (.app (seedCode bits) carrier) ::
        .left (.app continuation carrier) :: parents⟩,
    trivial, rfl, ?_, rfl, rfl⟩
  simp [RootResetSelectorContract.cursorAddress,
    RootResetSelectorContract.addressFromParents, List.append_assoc]

/-- After the third frame contraction, the exact cursor-only `R` row reaches
the dispatcher-field redex returned by the whole dispatcher grammar. -/
theorem frameThird_zeroPrefix_reaches_dispatcher
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation carrier : Term)
    (parents : List ParentFrame) :
    let afterThird : Cursor :=
      ⟨.app (freshHField carrier)
          (.app (compileActions program tree) carrier),
        .left (.app (seedCode bits) carrier) ::
          .left (.app continuation carrier) :: parents⟩
    ∃ selected after,
      Script.CursorOnly [.R] ∧
      Script.run [.R] afterThird = some selected ∧
      RootResetSelectorContract.cursorAddress selected =
        RootResetSelectorContract.addressFromParents parents ++
          RootResetWholeDispatcherStages.shellDispatcherAddress ∧
      selected.rdx? = some after ∧
      after.erase = Cursor.rebuild parents
        (Carrier.activeShell bits continuation (freshHField carrier)
          (RootResetDispatcherNodeStages.firstActivation
            (selectedAction program) tree carrier) carrier carrier) := by
  dsimp only
  refine ⟨⟨.app (compileActions program tree) carrier,
      .right (freshHField carrier) ::
        .left (.app (seedCode bits) carrier) ::
        .left (.app continuation carrier) :: parents⟩,
    ⟨RootResetDispatcherNodeStages.firstActivation
        (selectedAction program) tree carrier,
      .right (freshHField carrier) ::
        .left (.app (seedCode bits) carrier) ::
        .left (.app continuation carrier) :: parents⟩,
    trivial, rfl, ?_, ?_, rfl⟩
  · simp [RootResetSelectorContract.cursorAddress,
      RootResetSelectorContract.addressFromParents,
      RootResetWholeDispatcherStages.shellDispatcherAddress,
      List.append_assoc]
  · have hcontract :
        (Term.app (compileActions program tree) carrier).contractRoot? =
          some (RootResetDispatcherNodeStages.firstActivation
            (selectedAction program) tree carrier) := by
      change (RouteGrammar.compiledCall (selectedAction program) tree
        carrier).contractRoot? = some
          (RootResetDispatcherNodeStages.firstActivation
            (selectedAction program) tree carrier)
      exact RootResetDispatcherNodeStages.contractRoot?_compiledCall
        (selectedAction program) tree carrier
    unfold Cursor.rdx?
    rw [hcontract]

namespace RouteBridge

/-- Contracting the selected response root is transported through the exact
generated route context, with no equality test on route audit fields. -/
theorem withResponse_contractAt?
    {Label : Type} {encode : Label → Term} {carrier : Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    (path : Dispatcher.HasRoute tree route label)
    {response target : Term}
    (contracts : response.contractRoot? = some target) :
    (PrimitiveRoute.withResponse encode tree route carrier response).contractAt?
        (RootResetReachableStageGrammar.routeResponseAddress route) =
      some (PrimitiveRoute.withResponse encode tree route carrier target) := by
  induction path with
  | leaf label =>
      let context : Context := .appRight (.app .s carrier) .hole
      have localContract : response.contractAt? [] = some target := by
        simp [Term.contractAt?, contracts]
      have lifted := RootResetWholeStageClassifier.contractAt?_plug_append
        context [] localContract
      simpa [context, PrimitiveRoute.withResponse,
        RootResetReachableStageGrammar.routeResponseAddress, chosen,
        RootResetSelectorContract.contextAddress] using lifted
  | @left route label left right path ih =>
      let context := RootResetWholeDispatcherStages.selectedLeftContext carrier
        (RouteGrammar.compiledCall encode right carrier) .hole
      have lifted := RootResetWholeStageClassifier.contractAt?_plug_append
        context (RootResetReachableStageGrammar.routeResponseAddress route) ih
      simpa [context, PrimitiveRoute.withResponse,
        RootResetReachableStageGrammar.routeResponseAddress,
        RootResetWholeDispatcherStages.selectedLeftContext,
        RootResetSelectorContract.contextAddress,
        RouteGrammar.selectedLeft, chosen, List.append_assoc] using lifted
  | @right route label left right path ih =>
      let context := RootResetWholeDispatcherStages.selectedRightContext carrier
        (RouteGrammar.compiledCall encode left carrier) .hole
      have lifted := RootResetWholeStageClassifier.contractAt?_plug_append
        context (RootResetReachableStageGrammar.routeResponseAddress route) ih
      simpa [context, PrimitiveRoute.withResponse,
        RootResetReachableStageGrammar.routeResponseAddress,
        RootResetWholeDispatcherStages.selectedRightContext,
        RootResetSelectorContract.contextAddress,
        RouteGrammar.selectedRight, chosen, List.append_assoc] using lifted

end RouteBridge

/-- The third frame contraction exposes the exact selected dispatcher route.
The next contraction is the first route-row mutation at the dispatcher field
of the fresh Local. -/
theorem frameThird_contracts_firstRoute
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program}
    (path : Dispatcher.HasRoute tree route label)
    (bits : List Bool) (continuation carrier : Term) :
    ∃ done dispatcherTerm,
      RouteMutation (selectedAction program) carrier tree route label done
          dispatcherTerm ∧
        (freshLocal (compileActions program tree) bits continuation
          carrier).contractAt?
            RootResetWholeDispatcherStages.shellDispatcherAddress =
          some (Carrier.activeShell bits continuation (freshHField carrier)
            dispatcherTerm carrier carrier) := by
  induction path with
  | leaf label =>
      refine ⟨true, chosen carrier
        (.app (selectedAction program label) carrier), .leaf label, ?_⟩
      rfl
  | @left route label left right path =>
      refine ⟨false, chosen carrier (.app
        (fork (compileDispatcher (selectedAction program) left)
          (compileDispatcher (selectedAction program) right)) carrier),
        .exposeLeft path, ?_⟩
      rfl
  | @right route label left right path =>
      refine ⟨false, chosen carrier (.app
        (fork (compileDispatcher (selectedAction program) left)
          (compileDispatcher (selectedAction program) right)) carrier),
        .exposeRight path, ?_⟩
      rfl

/-! ## Route-to-action and completed-response boundaries -/

/-- The completed route of a nonempty response contracts at its exact
route-response address to the first registered Push row. -/
theorem routeCompleteNonempty_contracts_firstPush
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program}
    (path : Dispatcher.HasRoute tree route label)
    (bits : List Bool) (continuation carrier : Term)
    {dispatcherTerm : Term} (first : Bool) (rest : List Bool)
    (progress : RouteMutation (selectedAction program) carrier tree route label
      true dispatcherTerm)
    (nonempty : PrimitiveLocalResponse.emitted program label = first :: rest) :
    (Carrier.activeShell bits continuation (freshHField carrier)
      dispatcherTerm carrier carrier).contractAt?
        (RootResetWholeDispatcherStages.shellDispatcherAddress ++
          RootResetReachableStageGrammar.routeResponseAddress route) =
      some (Carrier.activeShell bits continuation (freshHField carrier)
        (PrimitiveRoute.withResponse (selectedAction program) tree route carrier
          (RootResetAppenderStages.firstRow first rest carrier carrier))
        carrier carrier) := by
  rw [progress.done_eq rfl]
  have responseContracts :=
    RootResetDispatcherSelectedHandoff.selectedAction_nonempty_contractRoot?_firstRow
      program label carrier first rest nonempty
  have dispatcherContracts := RouteBridge.withResponse_contractAt?
    (encode := selectedAction program) (carrier := carrier) path
    responseContracts
  let shellContext :=
    RootResetResponseBoundaryStages.localDispatcherContext
      (freshHField carrier) (word bits) carrier continuation carrier
  have lifted := RootResetWholeStageClassifier.contractAt?_plug_append
    shellContext
    (RootResetReachableStageGrammar.routeResponseAddress route)
    dispatcherContracts
  simpa [shellContext,
    RootResetResponseBoundaryStages.contextAddress_localDispatcherContext,
    RootResetResponseBoundaryStages.localDispatcherContext,
    CheckpointDecoder.openShell_word, List.append_assoc] using! lifted

/-- The exact public view shared by both ways a response reaches its final
completed Local. -/
def completedLocalView
    (program : CTS.Program) (route : Dispatcher.Route)
    (label : ActionLabel program) (bits : List Bool)
    (continuation carrier : Term) : CheckpointDecoder.LocalView program :=
  ⟨.fresh, route, label, actionAccumulator program label carrier,
    word bits, continuation⟩

/-- Every response mutation whose index is `true` is exactly the completed
fresh Local and therefore parses to the canonical response view. -/
theorem responseDone_parsesLocal
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program}
    {path : Dispatcher.HasRoute tree route label}
    {bits : List Bool} {continuation carrier term : Term}
    {done : Bool}
    (sample : ResponseRootMutation program tree path bits continuation carrier
      done term)
    (doneEq : done = true) :
    CheckpointDecoder.parseLocal? program tree term =
      some (completedLocalView program route label bits continuation carrier) := by
  rw [sample.done_eq doneEq]
  apply CheckpointDecoder.parseLocal?_complete
  refine .intro (freshHField carrier)
    (PrimitiveLocalResponse.completedRoute program tree route label carrier)
    carrier carrier (.fresh carrier) ?_ rfl
  exact ⟨actionResult program label carrier,
    actionHistories program label carrier,
    PrimitiveLocalResponse.completedRoute_activated program path carrier,
    ActionParser.actionResult_shape program label carrier⟩

/-- A final response sample with a classified clean accumulator is accepted
as the exact complete-clean boundary. -/
theorem responseDone_parses_completeClean
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program}
    {path : Dispatcher.HasRoute tree route label}
    {bits queue : List Bool} {continuation carrier term : Term}
    {done : Bool}
    (sample : ResponseRootMutation program tree path bits continuation carrier
      done term)
    (doneEq : done = true)
    (classification : RootResetAccumulatorClassifier.classify?
        (actionAccumulator program label carrier) = some ⟨queue, .clean⟩) :
    RootResetResponseBoundaryStages.parseActive? program tree term =
      some ⟨completedLocalView program route label bits continuation carrier,
        queue, .completeClean⟩ := by
  apply RootResetResponseBoundaryStages.parseActive?_of_localShape_completeClean
    (localShape := CheckpointDecoder.parseLocal?_sound
      (responseDone_parsesLocal sample doneEq))
    (fresh := rfl)
    (classification := by simpa [completedLocalView] using classification)

/-- A final response sample with one classified Open is accepted as the exact
CLOSE-ready boundary. -/
theorem responseDone_parses_completeOpen
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program}
    {path : Dispatcher.HasRoute tree route label}
    {bits queue : List Bool} {continuation carrier term : Term}
    {done : Bool} {address : Address}
    (sample : ResponseRootMutation program tree path bits continuation carrier
      done term)
    (doneEq : done = true)
    (classification : RootResetAccumulatorClassifier.classify?
        (actionAccumulator program label carrier) =
          some ⟨queue, .close address⟩) :
    RootResetResponseBoundaryStages.parseActive? program tree term =
      some ⟨completedLocalView program route label bits continuation carrier,
        queue, .completeOpen address⟩ := by
  apply RootResetResponseBoundaryStages.parseActive?_of_localShape_completeOpen
    (localShape := CheckpointDecoder.parseLocal?_sound
      (responseDone_parsesLocal sample doneEq))
    (fresh := rfl)
    (classification := by simpa [completedLocalView] using classification)

/-- Empty route completion is one of the two exact completed-response boundary
constructors; the accumulator classifier determines CLEAN versus CLOSE. -/
theorem routeCompleteEmpty_parses_boundary
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program}
    {path : Dispatcher.HasRoute tree route label}
    {bits queue : List Bool} {continuation carrier dispatcherTerm : Term}
    (progress : RouteMutation (selectedAction program) carrier tree route label
      true dispatcherTerm)
    (empty : PrimitiveLocalResponse.emitted program label = [])
    (classification : RootResetAccumulatorClassifier.classify?
        (actionAccumulator program label carrier) = some ⟨queue, .clean⟩) :
    RootResetResponseBoundaryStages.parseActive? program tree
        (Carrier.activeShell bits continuation (freshHField carrier)
          dispatcherTerm carrier carrier) =
      some ⟨completedLocalView program route label bits continuation carrier,
        queue, .completeClean⟩ := by
  exact responseDone_parses_completeClean
    (path := path) (.routeCompleteEmpty (path := path) progress empty) rfl
    classification

/-- The final appender mutation is likewise recovered as the exact completed
response boundary. -/
theorem actionFinal_parses_boundary
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program}
    {path : Dispatcher.HasRoute tree route label}
    {bits queue : List Bool} {continuation carrier actionTerm : Term}
    (progress : ActionMutation
      (PrimitiveLocalResponse.emitted program label).length
      (PrimitiveLocalResponse.emitted program label) carrier [] true actionTerm)
    (classification : RootResetAccumulatorClassifier.classify?
        (actionAccumulator program label carrier) = some ⟨queue, .clean⟩) :
    RootResetResponseBoundaryStages.parseActive? program tree
        (Carrier.activeShell bits continuation (freshHField carrier)
          (PrimitiveRoute.withResponse (selectedAction program) tree route
            carrier actionTerm) carrier carrier) =
      some ⟨completedLocalView program route label bits continuation carrier,
        queue, .completeClean⟩ := by
  exact responseDone_parses_completeClean (path := path)
    (.action (path := path) progress) rfl classification

/-! ## Exhaustive local response-family coverage -/

/-- Parser/selection evidence for every local response mutation constructor.
This is deliberately local: marked-prefix and role-indexed lifting are
supplied by the companion whole-term lemmas above and below. -/
inductive ResponseLocalCoverage
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    {route : Dispatcher.Route} {label : ActionLabel program}
    (path : Dispatcher.HasRoute tree route label)
    (bits : List Bool) (continuation carrier : Term) : Bool → Term → Prop where
  | frameFirst
      (classifies : RootResetReachableStageGrammar.classifyEndpoint
          (compileActions program tree)
          (frameFirstRoot (compileActions program tree) bits continuation
            carrier) = ⟨.frameR1, carrier, some bits⟩)
      (contracts :
        (frameFirstRoot (compileActions program tree) bits continuation
          carrier).contractAt? [.left] =
        some (frameSecondRoot (compileActions program tree) bits continuation
          carrier)) :
      ResponseLocalCoverage program tree path bits continuation carrier false
        (frameFirstRoot (compileActions program tree) bits continuation carrier)
  | frameSecond
      (classifies : RootResetReachableStageGrammar.classifyEndpoint
          (compileActions program tree)
          (frameSecondRoot (compileActions program tree) bits continuation
            carrier) = ⟨.frameR2, carrier, some bits⟩)
      (contracts :
        (frameSecondRoot (compileActions program tree) bits continuation
          carrier).contractAt? [.left, .left] =
        some (freshLocal (compileActions program tree) bits continuation
          carrier)) :
      ResponseLocalCoverage program tree path bits continuation carrier false
        (frameSecondRoot (compileActions program tree) bits continuation carrier)
  | frameThird {nextDone : Bool} {dispatcherTerm : Term}
      (progress : RouteMutation (selectedAction program) carrier tree route
        label nextDone dispatcherTerm)
      (contracts :
        (freshLocal (compileActions program tree) bits continuation
          carrier).contractAt?
            RootResetWholeDispatcherStages.shellDispatcherAddress =
          some (Carrier.activeShell bits continuation (freshHField carrier)
            dispatcherTerm carrier carrier)) :
      ResponseLocalCoverage program tree path bits continuation carrier false
        (freshLocal (compileActions program tree) bits continuation carrier)
  | routeIncomplete {dispatcherTerm : Term}
      {view : RootResetWholeDispatcherStages.RouteView (ActionLabel program)}
      (progress : RouteMutation (selectedAction program) carrier tree route
        label false dispatcherTerm)
      (shape : RootResetWholeDispatcherStages.RouteShape
        (selectedAction program) tree route view dispatcherTerm) :
      ResponseLocalCoverage program tree path bits continuation carrier false
        (Carrier.activeShell bits continuation (freshHField carrier)
          dispatcherTerm carrier carrier)
  | routeCompleteNonempty {dispatcherTerm : Term} (first : Bool)
      (rest : List Bool)
      (progress : RouteMutation (selectedAction program) carrier tree route
        label true dispatcherTerm)
      (nonempty : PrimitiveLocalResponse.emitted program label = first :: rest)
      (contracts :
        (Carrier.activeShell bits continuation (freshHField carrier)
          dispatcherTerm carrier carrier).contractAt?
            (RootResetWholeDispatcherStages.shellDispatcherAddress ++
              RootResetReachableStageGrammar.routeResponseAddress route) =
          some (Carrier.activeShell bits continuation (freshHField carrier)
            (PrimitiveRoute.withResponse (selectedAction program) tree route
              carrier
              (RootResetAppenderStages.firstRow first rest carrier carrier))
            carrier carrier)) :
      ResponseLocalCoverage program tree path bits continuation carrier false
        (Carrier.activeShell bits continuation (freshHField carrier)
          dispatcherTerm carrier carrier)
  | actionIncomplete {actionTerm : Term}
      (progress : ActionMutation
        (PrimitiveLocalResponse.emitted program label).length
        (PrimitiveLocalResponse.emitted program label) carrier [] false
        actionTerm)
      {row : RootResetWholeAppenderStages.Row} {replacement : Term}
      (valid : row.Valid (PrimitiveLocalResponse.emitted program label))
      (source : row.term = actionTerm)
      (selected : row.replacement? = some replacement) :
      ResponseLocalCoverage program tree path bits continuation carrier false
        (Carrier.activeShell bits continuation (freshHField carrier)
          (PrimitiveRoute.withResponse (selectedAction program) tree route
            carrier actionTerm) carrier carrier)
  | completed {term : Term}
      (parsed : CheckpointDecoder.parseLocal? program tree term =
        some (completedLocalView program route label bits continuation carrier)) :
      ResponseLocalCoverage program tree path bits continuation carrier true term

/-- Case analysis on `ResponseRootMutation` supplies the matching frame,
dispatcher, appender, or completed-boundary evidence with no unhandled row. -/
theorem responseRootMutation_localCoverage
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program}
    {path : Dispatcher.HasRoute tree route label}
    {bits : List Bool} {continuation carrier term : Term} {done : Bool}
    (sample : ResponseRootMutation program tree path bits continuation carrier
      done term) :
    ResponseLocalCoverage program tree path bits continuation carrier done
      term := by
  cases sample with
  | frameFirst =>
      exact .frameFirst (frameFirst_parses_and_contracts program tree bits
        continuation carrier).1 (frameFirst_parses_and_contracts program tree
          bits continuation carrier).2
  | frameSecond =>
      exact .frameSecond (frameSecond_parses_and_contracts program tree bits
        continuation carrier).1 (frameSecond_parses_and_contracts program tree
          bits continuation carrier).2
  | frameThird =>
      obtain ⟨nextDone, dispatcherTerm, progress, contracts⟩ :=
        frameThird_contracts_firstRoute path bits continuation carrier
      exact .frameThird progress contracts
  | routeIncomplete progress =>
      obtain ⟨view, shape⟩ := RouteBridge.exists_routeShape_of_not_done
        progress rfl
      exact .routeIncomplete progress shape
  | routeCompleteEmpty progress empty =>
      exact .completed
        (responseDone_parsesLocal (path := path)
          (.routeCompleteEmpty (path := path) progress empty) rfl)
  | @routeCompleteNonempty dispatcherTerm first rest progress nonempty =>
      exact .routeCompleteNonempty first rest progress nonempty
        (routeCompleteNonempty_contracts_firstPush path bits continuation
          carrier first rest progress nonempty)
  | @action actionTerm done progress =>
      cases done with
      | false =>
          obtain ⟨row, replacement, valid, source, selected⟩ :=
            ActionBridge.exists_selected_row_of_not_done
              (emitted := PrimitiveLocalResponse.emitted program label)
              progress (by simp) rfl
          exact .actionIncomplete progress valid source selected
      | true =>
          exact .completed
            (responseDone_parsesLocal (path := path)
              (.action (path := path) progress) rfl)

/-- An unfinished route sample, surrounded by its actual marked history,
parses as one whole dispatcher stage and exposes an exact next contraction. -/
theorem routeIncomplete_parses_dispatcher
    {program : CTS.Program} {layout : ActionDispatcher program}
    {route : Dispatcher.Route} {label : ActionLabel program}
    {bits : List Bool} {continuation carrier dispatcherTerm whole : Term}
    {context : Context}
    {history : List (CheckpointDecoder.LocalView program)}
    (progress : RouteMutation (selectedAction program) carrier layout.tree
      route label false dispatcherTerm)
    (routeEq : route = layout.route label)
    {frontBit : Bool}
    (front : bits.head? = some frontBit)
    (labelEq : label =
      (RootResetWholeStageClassifier.historyPhase program history, frontBit))
    (marked : MarkedPrefix program layout.tree whole
      (Carrier.activeShell bits continuation (freshHField carrier)
        dispatcherTerm carrier carrier) context history) :
    ∃ (view : RootResetWholeDispatcherStages.View program) (target : Term),
      RootResetWholeDispatcherStages.parse? program layout whole = some view ∧
        whole.contractAt? view.redexAddress = some target := by
  obtain ⟨node, routeShape⟩ :=
    RouteBridge.exists_routeShape_of_not_done progress rfl
  let endpoint : RootResetWholeDispatcherStages.ActiveView program :=
    ⟨bits, continuation,
      RootResetWholeStageClassifier.historyPhase program history,
      frontBit, route, node⟩
  have activeShape : RootResetWholeDispatcherStages.ActiveShape
      program layout history endpoint
        (Carrier.activeShell bits continuation (freshHField carrier)
          dispatcherTerm carrier carrier) := by
    refine .intro (freshHField carrier) dispatcherTerm carrier carrier
      (.fresh carrier) rfl front ?_ routeShape rfl
    simpa [endpoint, RootResetWholeDispatcherStages.ActiveView.label,
      labelEq] using routeEq
  let view : RootResetWholeDispatcherStages.View program :=
    ⟨Carrier.activeShell bits continuation (freshHField carrier)
      dispatcherTerm carrier carrier, context, history, endpoint⟩
  have parsed : RootResetWholeDispatcherStages.parse? program layout whole =
      some view :=
    RootResetWholeDispatcherStages.parse?_complete ⟨marked, activeShape⟩
  obtain ⟨target, _replaced, contracts⟩ := view.contracts parsed
  exact ⟨view, target, parsed, contracts⟩

/-- The dispatcher result above lifts through any additional role-indexed
outer context, such as pending-frame children. -/
theorem routeIncomplete_lifts_through_roles
    {program : CTS.Program} {layout : ActionDispatcher program}
    {roles : List RootResetReachableActiveContext.Role}
    {term : Term} {outerView : RootResetReachableActiveContext.View}
    (outerShape : RootResetReachableActiveContext.Describes
      program layout.tree roles term outerView)
    {route : Dispatcher.Route} {label : ActionLabel program}
    {bits : List Bool} {continuation carrier dispatcherTerm : Term}
    {context : Context}
    {history : List (CheckpointDecoder.LocalView program)}
    (progress : RouteMutation (selectedAction program) carrier layout.tree
      route label false dispatcherTerm)
    (routeEq : route = layout.route label)
    {frontBit : Bool}
    (front : bits.head? = some frontBit)
    (labelEq : label =
      (RootResetWholeStageClassifier.historyPhase program history, frontBit))
    (marked : MarkedPrefix program layout.tree outerView.active
      (Carrier.activeShell bits continuation (freshHField carrier)
        dispatcherTerm carrier carrier) context history) :
    ∃ (view : RootResetWholeDispatcherStages.View program)
        (localTarget : Term),
      RootResetWholeDispatcherStages.parse? program layout outerView.active =
          some view ∧
        outerView.active.contractAt? view.redexAddress = some localTarget ∧
        term.contractAt?
            (RootResetPersistentSelectedAddressBridge.wholeAddress outerView
              view.redexAddress) =
          some (RootResetPersistentSelectedAddressBridge.wholeTarget outerView
            localTarget) := by
  obtain ⟨view, localTarget, parsed, contracts⟩ :=
    routeIncomplete_parses_dispatcher progress routeEq front labelEq marked
  exact ⟨view, localTarget, parsed, contracts,
    RootResetPersistentSelectedAddressBridge.lift_contractAt?
      outerShape contracts⟩

/-- An unfinished action sample, surrounded by its actual marked history,
parses as one whole Push/appender stage and exposes its exact next
contraction. -/
theorem actionIncomplete_parses_appender
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program}
    {bits : List Bool} {continuation carrier actionTerm whole : Term}
    {context : Context}
    {history : List (CheckpointDecoder.LocalView program)}
    (path : Dispatcher.HasRoute tree route label)
    (progress : ActionMutation
      (PrimitiveLocalResponse.emitted program label).length
      (PrimitiveLocalResponse.emitted program label) carrier [] false
      actionTerm)
    (marked : MarkedPrefix program tree whole
      (Carrier.activeShell bits continuation (freshHField carrier)
        (PrimitiveRoute.withResponse (selectedAction program) tree route
          carrier actionTerm) carrier carrier) context history) :
    ∃ (view : RootResetWholeAppenderStages.View program)
        (replacement target : Term),
      RootResetWholeAppenderStages.parse? program tree whole = some view ∧
        view.endpoint.row.replacement? = some replacement ∧
        whole.contractAt? view.focusAddress = some target := by
  obtain ⟨row, replacement, valid, source, replacementEq⟩ :=
    ActionBridge.exists_selected_row_of_not_done
      (emitted := PrimitiveLocalResponse.emitted program label)
      progress (by simp) rfl
  let endpoint : RootResetWholeAppenderStages.ActiveView program :=
    ⟨bits, continuation, route, label, row⟩
  have activeShape : RootResetWholeAppenderStages.ActiveShape program tree
      endpoint
        (Carrier.activeShell bits continuation (freshHField carrier)
          (PrimitiveRoute.withResponse (selectedAction program) tree route
            carrier actionTerm) carrier carrier) := by
    refine .intro (freshHField carrier)
      (PrimitiveRoute.withResponse (selectedAction program) tree route carrier
        actionTerm) carrier carrier (.fresh carrier) ?_ valid ?_
    · simpa [endpoint, source] using
        (PrimitiveRoute.withResponse_activated path carrier actionTerm)
    · rfl
  let view : RootResetWholeAppenderStages.View program :=
    ⟨Carrier.activeShell bits continuation (freshHField carrier)
      (PrimitiveRoute.withResponse (selectedAction program) tree route carrier
        actionTerm) carrier carrier, context, history, endpoint⟩
  have parsed : RootResetWholeAppenderStages.parse? program tree whole =
      some view :=
    RootResetWholeAppenderStages.parse?_complete ⟨marked, activeShape⟩
  obtain ⟨target, _selected, _replaced, contracts⟩ :=
    view.selected_contracts parsed (by simpa [view, endpoint] using replacementEq)
  exact ⟨view, replacement, target, parsed,
    by simpa [view, endpoint] using replacementEq, contracts⟩

/-- The appender result above lifts through any additional role-indexed outer
context. -/
theorem actionIncomplete_lifts_through_roles
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {roles : List RootResetReachableActiveContext.Role}
    {term : Term} {outerView : RootResetReachableActiveContext.View}
    (outerShape : RootResetReachableActiveContext.Describes
      program tree roles term outerView)
    {route : Dispatcher.Route} {label : ActionLabel program}
    {bits : List Bool} {continuation carrier actionTerm : Term}
    {context : Context}
    {history : List (CheckpointDecoder.LocalView program)}
    (path : Dispatcher.HasRoute tree route label)
    (progress : ActionMutation
      (PrimitiveLocalResponse.emitted program label).length
      (PrimitiveLocalResponse.emitted program label) carrier [] false
      actionTerm)
    (marked : MarkedPrefix program tree outerView.active
      (Carrier.activeShell bits continuation (freshHField carrier)
        (PrimitiveRoute.withResponse (selectedAction program) tree route
          carrier actionTerm) carrier carrier) context history) :
    ∃ (view : RootResetWholeAppenderStages.View program)
        (replacement localTarget : Term),
      RootResetWholeAppenderStages.parse? program tree outerView.active =
          some view ∧
        view.endpoint.row.replacement? = some replacement ∧
        outerView.active.contractAt? view.focusAddress = some localTarget ∧
        term.contractAt?
            (RootResetPersistentSelectedAddressBridge.wholeAddress outerView
              view.focusAddress) =
          some (RootResetPersistentSelectedAddressBridge.wholeTarget outerView
            localTarget) := by
  obtain ⟨view, replacement, localTarget, parsed, replacementEq, contracts⟩ :=
    actionIncomplete_parses_appender path progress marked
  exact ⟨view, replacement, localTarget, parsed, replacementEq, contracts,
    RootResetPersistentSelectedAddressBridge.lift_contractAt?
      outerShape contracts⟩

end PureSFormal.Research.RootResetResponseSampleParserBridge
