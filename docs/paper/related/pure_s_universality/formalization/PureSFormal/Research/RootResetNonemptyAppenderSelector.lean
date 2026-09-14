import PureSFormal.Research.RootResetActivatedRouteExclusion
import PureSFormal.Research.RootResetResponseCarrierChronology

/-!
# Selected nonempty appender responses

The completed route keeps the current appender response at its literal
selected address.  Its generated carrier supplies the control label while
the action grammar excludes every earlier response-selector branch.
-/

namespace PureSFormal.Research.RootResetNonemptyAppenderSelector

open PureSFormal.PureS
open SchedulerResponseInvariant
open RootResetReachableStageGrammar
open RootResetPersistentResponseSelector
open RootResetEmptyRouteSelectorChain
open RootResetWrappedEmptyCommit
open RootResetActivatedRouteExclusion

def routeShell (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (label : ActionLabel program) (bits : List Bool) (continuation carrier response : Term) : Term :=
  shell bits continuation carrier (PrimitiveRoute.withResponse (selectedAction program)
    dispatcher.tree (dispatcher.route label) carrier response)

theorem routeShell_parseLocal_none_of_actionRejected
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (label : ActionLabel program) (bits : List Bool) (continuation carrier response : Term)
    (rejected : ActionParser.parse program label response = none) :
    CheckpointDecoder.parseLocal? program dispatcher.tree
      (routeShell program dispatcher label bits continuation carrier response) = none := by
  have detailed := DispatchParser.parseRouteDetailed_complete
    (PrimitiveRoute.withResponse_activated (encode := selectedAction program)
      (dispatcher.route_valid label) carrier response)
  have dispatchNone : DispatchParser.parse program dispatcher.tree
      (PrimitiveRoute.withResponse (selectedAction program) dispatcher.tree
        (dispatcher.route label) carrier response) = none := by
    rw [DispatchParser.parse, detailed]
    dsimp only
    rw [rejected]
  simp only [routeShell, shell, Carrier.activeShell, Carrier.shell, CheckpointDecoder.parseLocal?,
    freshHField, seedCode, CheckpointDecoder.checkHalt?, haltCode, b, ↓reduceIte]
  rw [dispatchNone]
  split <;> rfl

theorem routeShell_parseLocal_none_of_actionMutation
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (label : ActionLabel program) (bits : List Bool) (continuation carrier response : Term)
    (progress : ActionMutation (PrimitiveLocalResponse.emitted program label).length
      (PrimitiveLocalResponse.emitted program label) carrier [] false response) :
    CheckpointDecoder.parseLocal? program dispatcher.tree
      (routeShell program dispatcher label bits continuation carrier response) = none := by
  apply routeShell_parseLocal_none_of_actionRejected
  unfold ActionParser.parse
  have expected : ActionParser.historyCount program label = (PrimitiveLocalResponse.emitted program label).length := by
    rcases label with ⟨phase, bit⟩
    cases bit <;> rfl
  rw [expected]
  exact progress.parser.1 rfl

theorem routeShell_freshCall_false
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (label : ActionLabel program) (bits : List Bool) (continuation carrier response : Term) :
    parseFreshDispatcherCall? program dispatcher.tree
      (routeShell program dispatcher label bits continuation carrier response) = false := by
  obtain ⟨payload, sourceEq⟩ := withResponse_chosen (selectedAction program)
    (dispatcher.route_valid label) carrier response
  unfold routeShell
  rw [sourceEq]
  simp [parseFreshDispatcherCall?, shell, Carrier.activeShell, Carrier.shell,
    seedCode, chosen, compileActions_ne_s_app program dispatcher.tree carrier]

/-- Every selector branch preceding the selected action or appender rejects
an unfinished literal action response with its carrier-derived label. -/
theorem routeShell_earlyPriorities_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (label : ActionLabel program) (bits : List Bool) (continuation carrier response : Term)
    (carrierNot2 : carrier.headArity ≠ 2)
    (phaseEq : carrierPhase? program dispatcher.tree carrier = some label.1)
    (bitEq : carrierResponseBit? program dispatcher.tree carrier = some label.2)
    (localNone : CheckpointDecoder.parseLocal? program dispatcher.tree
      (routeShell program dispatcher label bits continuation carrier response) = none) :
    let source := routeShell program dispatcher label bits continuation carrier response
    freshDispatcherSelection? program dispatcher source = none ∧
      responseBoundarySelection? program dispatcher source = none ∧
      responseAppenderSelection? program dispatcher source = none ∧
      responseCarrierSelection? program dispatcher source = none ∧
      markedHandoffSelection? program dispatcher source = none ∧
      dispatcherSelection? program dispatcher source = none ∧
      (RootResetPersistentRouteAFuel.classifyHandoff program dispatcher source).fuel = none := by
  dsimp only
  let source := routeShell program dispatcher label bits continuation carrier response
  obtain ⟨activeEq, fuelEq, outerEq⟩ := shell_contexts program dispatcher bits continuation carrier
    (PrimitiveRoute.withResponse (selectedAction program) dispatcher.tree (dispatcher.route label) carrier response)
    localNone
  change RootResetPersistentRouteA.activeContext program dispatcher source = ⟨source, .hole, [], [], []⟩ at activeEq
  change RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher source = ⟨source, .hole, [], [], []⟩ at fuelEq
  change responseOuter program dispatcher source = ⟨source, .hole, [], [], []⟩ at outerEq
  have freshRootNone : freshResponseRoot? program dispatcher source = none := by
    rw [freshResponseRoot?, activeEq]
    rfl
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_, ?_⟩
  · rw [freshDispatcherSelection?, outerEq]
    dsimp only
    rw [routeShell_freshCall_false]
    rfl
  · rw [responseBoundarySelection?, responseBoundaryAddress?,
      RootResetResponseClockFuelAgreement.completedResponseAddress?_none_of_outer_parseLocal_none
        outerEq localNone, freshRootNone]
    rfl
  · rw [responseAppenderSelection?, responseAppenderAddress?, freshRootNone]
    rfl
  · rw [responseCarrierSelection?, responseCarrierAddress?, freshRootNone]
    rfl
  · rw [markedHandoffSelection?, activeEq]
    rfl
  · rw [dispatcherSelection?, currentCarrierDispatcherAddress?, outerEq]
    dsimp only [source, routeShell, shell, Carrier.activeShell, Carrier.shell, seedCode]
    rw [RootResetWholeDispatcherStages.parseFreshHalt?_fresh]
    dsimp only
    rw [phaseEq, bitEq]
    dsimp only
    rw [parseRouteNode?_withResponse_none (selectedAction program) (dispatcher.route_valid label)
      carrier response carrierNot2]
    rfl
  · rw [RootResetPersistentRouteAFuel.classifyHandoff, fuelEq]
    dsimp only [source, routeShell]
    rw [shell_fuel_none]

/-- The first nonempty Push is selected at the actual completed route,
independently of the route length and the emitted word's tail. -/
theorem selectedAction_selects_firstPush
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (label : ActionLabel program) (bits : List Bool) (continuation carrier : Term)
    (first : Bool) (rest : List Bool)
    (emitted : PrimitiveLocalResponse.emitted program label = first :: rest)
    (carrierNot2 : carrier.headArity ≠ 2)
    (phaseEq : carrierPhase? program dispatcher.tree carrier = some label.1)
    (bitEq : carrierResponseBit? program dispatcher.tree carrier = some label.2) :
    selectStep? program dispatcher
      (routeShell program dispatcher label bits continuation carrier (.app (selectedAction program label) carrier)) =
      some (routeShell program dispatcher label bits continuation carrier
        (RootResetAppenderStages.firstRow first rest carrier carrier)) := by
  let source := routeShell program dispatcher label bits continuation carrier (.app (selectedAction program label) carrier)
  let target := routeShell program dispatcher label bits continuation carrier
    (RootResetAppenderStages.firstRow first rest carrier carrier)
  have rejected : ActionParser.parse program label (.app (selectedAction program label) carrier) = none := by
    rw [PrimitiveLocalResponse.selectedAction_eq_appender, emitted]
    rcases label with ⟨phase, bit⟩
    cases bit with
    | false => simp [PrimitiveLocalResponse.emitted] at emitted
    | true => cases rest <;> rfl
  have localNone := routeShell_parseLocal_none_of_actionRejected program dispatcher label bits continuation carrier _ rejected
  obtain ⟨freshNone, boundaryNone, appenderNone, carrierNone, markedNone, dispatcherNone, fuelNone⟩ :=
    routeShell_earlyPriorities_none program dispatcher label bits continuation carrier _ carrierNot2 phaseEq bitEq localNone
  obtain ⟨_, _, outerEq⟩ := shell_contexts program dispatcher bits continuation carrier
    (PrimitiveRoute.withResponse (selectedAction program) dispatcher.tree (dispatcher.route label) carrier
      (.app (selectedAction program label) carrier)) localNone
  change responseOuter program dispatcher source = ⟨source, .hole, [], [], []⟩ at outerEq
  have parsed := DispatchParser.parseRouteDetailed_complete
    (PrimitiveRoute.withResponse_activated (encode := selectedAction program)
      (dispatcher.route_valid label) carrier (.app (selectedAction program label) carrier))
  let address := RootResetWholeDispatcherStages.shellDispatcherAddress ++ routeResponseAddress (dispatcher.route label)
  have addressEq : selectedActionAddress? program dispatcher source = some address := by
    rw [selectedActionAddress?, outerEq]
    dsimp only [source, routeShell, shell, Carrier.activeShell, Carrier.shell, seedCode]
    rw [RootResetWholeDispatcherStages.parseFreshHalt?_fresh]
    dsimp only
    rw [CheckpointDecoder.parseWord?_word]
    dsimp only
    rw [parsed]
    simp only [↓reduceIte, List.nil_append]
    rfl
  have contracts : source.contractAt? address = some target := by
    have responseContracts := RootResetDispatcherSelectedHandoff.selectedAction_nonempty_contractRoot?_firstRow
      program label carrier first rest emitted
    have dispatcherContracts := RootResetResponseSampleParserBridge.RouteBridge.withResponse_contractAt?
      (encode := selectedAction program) (carrier := carrier) (dispatcher.route_valid label) responseContracts
    exact RootResetWholeStageClassifier.contractAt?_plug_append
      (RootResetResponseBoundaryStages.localDispatcherContext
        (freshHField carrier) (word bits) carrier continuation carrier) _ dispatcherContracts
  have chosen : selectedActionSelection? program dispatcher source = some ⟨address, target⟩ := by
    rw [selectedActionSelection?, addressEq]
    change checkedAt? source address = _
    rw [checkedAt?, RootResetPersistentRouteAFuel.checkedSelection?, contracts]
  change (classify program dispatcher source).selected?.map (·.target) = some target
  dsimp only [source] at chosen ⊢
  simp only [classify, fuelNone, classifyAfterFuel, freshNone, boundaryNone, appenderNone,
    carrierNone, markedNone, dispatcherNone, chosen]
  rfl

theorem parseFirstWord?_appenderCall_none (emitted : List Bool) (argument : Term) :
    RootResetAppenderStages.parseFirstWord? emitted (.app (appender emitted) argument) = none := by
  cases emitted with
  | nil => rfl
  | cons bit rest =>
      cases argument <;>
        simp [RootResetAppenderStages.parseFirstWord?, appender_cons, push, Term.spineArgs,
          RootResetAppenderStages.s_appender_ne_appender]

theorem parseSecondWord?_appenderCall_none (emitted : List Bool) (argument : Term) :
    RootResetAppenderStages.parseSecondWord? emitted (.app (appender emitted) argument) = none := by
  cases emitted with
  | nil => rfl
  | cons bit rest =>
      cases rest <;>
        simp [RootResetAppenderStages.parseSecondWord?, RootResetAppenderStages.parseSecondFinalWord?,
          RootResetAppenderStages.parseSecondNonfinalWord?, appender, push, Term.spineArgs,
          RootResetAppenderStages.s_appender_ne_b, ActionMutation.appender_ne_s, p, b]

theorem parseRow?_selectedActionCall_none (program : CTS.Program)
    (label : ActionLabel program) (argument : Term) :
    RootResetWholeAppenderStages.parseRow? program label (.app (selectedAction program label) argument) = none := by
  rw [PrimitiveLocalResponse.selectedAction_eq_appender,
    RootResetWholeAppenderStages.parseRow?, RootResetAppenderStages.parseFirst?,
    parseFirstWord?_appenderCall_none]
  rw [RootResetAppenderStages.parseSecond?, parseSecondWord?_appenderCall_none]

theorem validRow_ne_selectedActionCall (program : CTS.Program)
    (label : ActionLabel program) (row : RootResetWholeAppenderStages.Row)
    (valid : row.Valid (PrimitiveLocalResponse.emitted program label)) (argument : Term) :
    row.term ≠ .app (selectedAction program label) argument := by
  intro equal
  have parsed := RootResetWholeAppenderStages.parseRow?_complete valid
  rw [equal, parseRow?_selectedActionCall_none] at parsed
  cases parsed

/-- A registered Push row cannot be reinterpreted as a new call to its
selected appender, so appender-row selection has priority at that boundary. -/
theorem selectedActionSelection?_validRow_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (label : ActionLabel program) (bits : List Bool) (continuation carrier : Term)
    (row : RootResetWholeAppenderStages.Row)
    (valid : row.Valid (PrimitiveLocalResponse.emitted program label))
    (localNone : CheckpointDecoder.parseLocal? program dispatcher.tree
      (routeShell program dispatcher label bits continuation carrier row.term) = none) :
    selectedActionSelection? program dispatcher
      (routeShell program dispatcher label bits continuation carrier row.term) = none := by
  let source := routeShell program dispatcher label bits continuation carrier row.term
  obtain ⟨_, _, outerEq⟩ := shell_contexts program dispatcher bits continuation carrier
    (PrimitiveRoute.withResponse (selectedAction program) dispatcher.tree (dispatcher.route label) carrier row.term)
    localNone
  change responseOuter program dispatcher source = ⟨source, .hole, [], [], []⟩ at outerEq
  have detailed := DispatchParser.parseRouteDetailed_complete
    (PrimitiveRoute.withResponse_activated (encode := selectedAction program)
      (dispatcher.route_valid label) carrier row.term)
  rw [selectedActionSelection?, selectedActionAddress?, outerEq]
  dsimp only [source, routeShell, shell, Carrier.activeShell, Carrier.shell, seedCode]
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

theorem withResponse_contractAt?_append
    {Label : Type} (encode : Label → Term)
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    (path : Dispatcher.HasRoute tree route label) (carrier : Term)
    {response target : Term} {address : Address}
    (contracts : response.contractAt? address = some target) :
    (PrimitiveRoute.withResponse encode tree route carrier response).contractAt?
      (routeResponseAddress route ++ address) =
      some (PrimitiveRoute.withResponse encode tree route carrier target) := by
  induction path with
  | leaf label =>
      have lifted := RootResetWholeStageClassifier.contractAt?_plug_append
        (.appRight (.app .s carrier) .hole) address contracts
      simpa [PrimitiveRoute.withResponse, routeResponseAddress, chosen,
        RootResetSelectorContract.contextAddress] using lifted
  | @left route label left right path ih =>
      let context := RootResetWholeDispatcherStages.selectedLeftContext carrier
        (RouteGrammar.compiledCall encode right carrier) .hole
      have lifted := RootResetWholeStageClassifier.contractAt?_plug_append context _ ih
      simpa [context, PrimitiveRoute.withResponse, routeResponseAddress,
        RootResetWholeDispatcherStages.selectedLeftContext, RootResetSelectorContract.contextAddress,
        RouteGrammar.selectedLeft, chosen, List.append_assoc] using lifted
  | @right route label left right path ih =>
      let context := RootResetWholeDispatcherStages.selectedRightContext carrier
        (RouteGrammar.compiledCall encode left carrier) .hole
      have lifted := RootResetWholeStageClassifier.contractAt?_plug_append context _ ih
      simpa [context, PrimitiveRoute.withResponse, routeResponseAddress,
        RootResetWholeDispatcherStages.selectedRightContext, RootResetSelectorContract.contextAddress,
        RouteGrammar.selectedRight, chosen, List.append_assoc] using lifted

theorem nonfinalRow_selectStep?
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (label : ActionLabel program) (bits : List Bool) (continuation carrier : Term)
    (row : RootResetWholeAppenderStages.Row) (target : Term)
    (valid : row.Valid (PrimitiveLocalResponse.emitted program label))
    (progress : ActionMutation (PrimitiveLocalResponse.emitted program label).length
      (PrimitiveLocalResponse.emitted program label) carrier [] false row.term)
    (targetEq : row.target? = some target)
    (carrierNot2 : carrier.headArity ≠ 2)
    (phaseEq : carrierPhase? program dispatcher.tree carrier = some label.1)
    (bitEq : carrierResponseBit? program dispatcher.tree carrier = some label.2) :
    selectStep? program dispatcher (routeShell program dispatcher label bits continuation carrier row.term) =
      some (routeShell program dispatcher label bits continuation carrier target) := by
  let source := routeShell program dispatcher label bits continuation carrier row.term
  let endpoint : RootResetWholeAppenderStages.ActiveView program :=
    ⟨bits, continuation, dispatcher.route label, label, row⟩
  have localNone := routeShell_parseLocal_none_of_actionMutation program dispatcher label bits continuation carrier row.term progress
  obtain ⟨freshNone, boundaryNone, appenderNone, carrierNone, markedNone, dispatcherNone, fuelNone⟩ :=
    routeShell_earlyPriorities_none program dispatcher label bits continuation carrier row.term carrierNot2 phaseEq bitEq localNone
  have actionNone := selectedActionSelection?_validRow_none program dispatcher label bits continuation carrier row valid localNone
  obtain ⟨_, _, outerEq⟩ := shell_contexts program dispatcher bits continuation carrier
    (PrimitiveRoute.withResponse (selectedAction program) dispatcher.tree (dispatcher.route label) carrier row.term) localNone
  change responseOuter program dispatcher source = ⟨source, .hole, [], [], []⟩ at outerEq
  have rowShape : RootResetWholeAppenderStages.ActiveShape program dispatcher.tree endpoint source := by
    exact .intro (freshHField carrier) _ carrier carrier (.fresh carrier)
      (PrimitiveRoute.withResponse_activated (dispatcher.route_valid label) carrier row.term) valid rfl
  have parsed := RootResetWholeAppenderStages.parseActive?_complete rowShape
  have dispatcherContracts := withResponse_contractAt?_append (selectedAction program)
    (dispatcher.route_valid label) carrier (row.contracts_of_target?_eq_some valid targetEq)
  have contracts : source.contractAt? endpoint.focusAddress =
      some (routeShell program dispatcher label bits continuation carrier target) := by
    exact RootResetWholeStageClassifier.contractAt?_plug_append
      (RootResetResponseBoundaryStages.localDispatcherContext
        (freshHField carrier) (word bits) carrier continuation carrier) _ dispatcherContracts
  have appenderSelected : appenderSelection? program dispatcher source =
      some ⟨endpoint.focusAddress, routeShell program dispatcher label bits continuation carrier target⟩ := by
    rw [appenderSelection?, outerEq]
    dsimp only
    rw [parsed]
    change checkedAt? source endpoint.focusAddress = _
    rw [checkedAt?, RootResetPersistentRouteAFuel.checkedSelection?, contracts]
  have priority := (classify_appender_priority dispatcherNone freshNone boundaryNone appenderNone
    carrierNone markedNone fuelNone actionNone appenderSelected).2
  rw [selectStep?, priority]
  rfl

end PureSFormal.Research.RootResetNonemptyAppenderSelector
