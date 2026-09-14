import PureSFormal.Research.RootResetMarkedFrameSelectorProof
import PureSFormal.Research.RootResetEmptyResponseCommit

/-!
# Selected EMPTY dispatcher rows

The current phase and false action are read from the generated carrier.
Unfinished route rows are selected through their exact dispatcher ancestors;
the immutable seed need not have a front cell.
-/

namespace PureSFormal.Research.RootResetEmptyRouteSelectorChain

open PureSFormal.PureS
open SchedulerResponseInvariant
open RootResetPersistentResponseSelector
open RootResetClockFuelCanonicalGrammar
open RootResetClockFuelStages
open RootResetCompositeStageRegistry

def shell (bits : List Bool) (continuation carrier dispatcherTerm : Term) : Term :=
  Carrier.activeShell bits continuation (freshHField carrier) dispatcherTerm carrier carrier

theorem shell_fuel_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier dispatcherTerm : Term) :
    RootResetPersistentFuelCarrier.parse? (compileActions program dispatcher.tree)
      (shell bits continuation carrier dispatcherTerm) = none := by
  cases accepted : RootResetPersistentFuelCarrier.parse? (compileActions program dispatcher.tree)
      (shell bits continuation carrier dispatcherTerm) with
  | none => rfl
  | some view =>
      have valid := RootResetPersistentFuelCarrier.parse?_sound accepted
      have source := valid.source
      cases layersEq : view.layers with
      | nil =>
          have boundary := congrArg (fun t =>
            (t.subterm? [.left, .right]).map Term.headArity) source
          simp [shell, Carrier.activeShell, Carrier.shell,
            RootResetPersistentFuelCarrier.View.source,
            RootResetPersistentFuelCarrier.View.fuelView,
            FuelView.term, FuelEndpoint.term, layersEq, pendingContext,
            OpenBaseView.term, CheckpointDecoder.openShell,
            CheckpointDecoder.openEnvironment, Term.subterm?] at boundary
      | cons layer layers =>
          have canonical : CanonicalPendingLayers (compileActions program dispatcher.tree)
              (layer :: layers) := by
            simpa [RootResetPersistentFuelCarrier.View.fuelView, layersEq] using valid.canonical.layers
          have arity := congrArg Term.headArity source
          simp [shell, Carrier.activeShell, Carrier.shell, freshHField,
            haltCode, b, RootResetPersistentFuelCarrier.View.source,
            RootResetPersistentFuelCarrier.View.fuelView, FuelView.term, layersEq,
            pendingContext_cons, Context.plug, frame, canonical.1.1,
            CheckpointDecoder.openEnvironment] at arity

theorem shell_contexts
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier dispatcherTerm : Term)
    (localNone : CheckpointDecoder.parseLocal? program dispatcher.tree
      (shell bits continuation carrier dispatcherTerm) = none) :
    let source := shell bits continuation carrier dispatcherTerm
    RootResetPersistentRouteA.activeContext program dispatcher source =
        ⟨source, .hole, [], [], []⟩ ∧
      RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher source =
        ⟨source, .hole, [], [], []⟩ ∧
      responseOuter program dispatcher source = ⟨source, .hole, [], [], []⟩ := by
  dsimp only
  let source := shell bits continuation carrier dispatcherTerm
  have markedNone : RootResetReachableStageGrammar.parseMarkedLocal? program
      dispatcher.tree source = none := by
    rw [RootResetReachableStageGrammar.parseMarkedLocal?, localNone]
  have freshNone : RootResetPersistentRouteA.parseFreshNonempty? program
      dispatcher.tree source = none := by
    rw [RootResetPersistentRouteA.parseFreshNonempty?, localNone]
  have frameNone : RootResetReachableStageGrammar.parseFrameR0?
      (compileActions program dispatcher.tree) source = none := by
    cases parsed : RootResetReachableStageGrammar.parseFrameR0?
        (compileActions program dispatcher.tree) source with
    | none => rfl
    | some view =>
        have same := RootResetReachableStageGrammar.parseFrameR0?_sound parsed
        have arity := congrArg Term.headArity same
        simp [source, shell, Carrier.activeShell, Carrier.shell, freshHField,
          haltCode, b, frame, environmentCode, dispatcherCode] at arity
  have pendingNone : RootResetStageRegistry.parsePending? source = none := by
    apply PendingFrame.guard?_none_of_function_headArity_ne_two
    change 5 ≠ 2
    decide
  have nextNone : RootResetPersistentRouteA.next? program dispatcher source = none := by
    rw [RootResetPersistentRouteA.next?, markedNone, freshNone]
    simp only [RootResetPersistentRouteA.parsePendingActive?, frameNone]
    rfl
  have fuelNone := shell_fuel_none program dispatcher bits continuation carrier dispatcherTerm
  have activeEq : RootResetPersistentRouteA.activeContext program dispatcher source =
      ⟨source, .hole, [], [], []⟩ := by
    rw [RootResetPersistentRouteA.activeContext, nextNone]
  have fuelEq : RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher source =
      ⟨source, .hole, [], [], []⟩ := by
    rw [RootResetPersistentRouteAFuel.fuelActiveContext, fuelNone, nextNone]
  refine ⟨activeEq, fuelEq, ?_⟩
  rw [responseOuter, fuelEq]
  change composeActiveContexts _ (responseDescentContext program dispatcher source) = _
  rw [responseDescentContext, markedNone, freshNone, pendingNone]
  rfl

theorem shell_local_none_of_routeMutation
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {bits : List Bool} {continuation carrier dispatcherTerm : Term}
    {route : Dispatcher.Route} {label : ActionLabel program}
    (carrierNot3 : carrier.headArity ≠ 3)
    (progress : RouteMutation (selectedAction program) carrier dispatcher.tree
      route label false dispatcherTerm) :
    CheckpointDecoder.parseLocal? program dispatcher.tree
      (shell bits continuation carrier dispatcherTerm) = none := by
  have routeNone := (progress.parser carrierNot3).1 rfl
  have dispatchNone : DispatchParser.parse program dispatcher.tree dispatcherTerm = none := by
    rw [DispatchParser.parse, DispatchParser.parseRouteDetailed, routeNone]
  simp only [shell, Carrier.activeShell, Carrier.shell, CheckpointDecoder.parseLocal?,
    freshHField, seedCode, CheckpointDecoder.checkHalt?, haltCode, b, ↓reduceIte]
  rw [dispatchNone]
  split <;> rfl

theorem routeMutation_chosen
    {Label : Type} {encode : Label → Term} {carrier : Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    {done : Bool} {term : Term}
    (progress : RouteMutation encode carrier tree route label done term) :
    ∃ payload, term = chosen carrier payload := by
  cases progress <;> exact ⟨_, rfl⟩

theorem compileActions_ne_s_app
    (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (carrier : Term) : .app .s carrier ≠ compileActions program tree := by
  intro equal
  have arity := congrArg Term.headArity equal
  cases tree <;>
    simp [compileActions, compileDispatcher, leafCode, nodeCode, b] at arity

theorem shell_route_freshCall_false
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    (bits : List Bool) (continuation carrier : Term)
    {route : Dispatcher.Route} {label : ActionLabel program}
    {done : Bool} {dispatcherTerm : Term}
    (progress : RouteMutation (selectedAction program) carrier dispatcher.tree
      route label done dispatcherTerm) :
    parseFreshDispatcherCall? program dispatcher.tree
      (shell bits continuation carrier dispatcherTerm) = false := by
  obtain ⟨payload, source⟩ := routeMutation_chosen progress
  rw [source]
  simp [parseFreshDispatcherCall?, shell, Carrier.activeShell, Carrier.shell,
    seedCode, chosen, compileActions_ne_s_app program dispatcher.tree carrier]

/-- Every unfinished route row uses its carrier-derived phase and bit.  All
competing full-selector branches are discharged from the literal shell. -/
theorem selectStep?_routeMutation
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term)
    (phase : CTS.Phase program) (bit : Bool)
    (carrierNot3 : carrier.headArity ≠ 3)
    (phaseEq : carrierPhase? program dispatcher.tree carrier = some phase)
    (bitEq : carrierResponseBit? program dispatcher.tree carrier = some bit)
    {dispatcherTerm target : Term}
    (progress : RouteMutation (selectedAction program) carrier dispatcher.tree
      (dispatcher.route (phase, bit)) (phase, bit) false dispatcherTerm)
    (view : RootResetWholeDispatcherStages.RouteView (ActionLabel program))
    (shape : RootResetWholeDispatcherStages.RouteShape (selectedAction program)
      dispatcher.tree (dispatcher.route (phase, bit)) view dispatcherTerm)
    (contracts : dispatcherTerm.contractAt?
      (RootResetSelectorContract.contextAddress view.context ++ view.localRedexAddress) = some target) :
    selectStep? program dispatcher (shell bits continuation carrier dispatcherTerm) =
      some (shell bits continuation carrier target) := by
  let source := shell bits continuation carrier dispatcherTerm
  have localNone := shell_local_none_of_routeMutation (bits := bits)
    (continuation := continuation) carrierNot3 progress
  obtain ⟨activeEq, fuelEq, outerEq⟩ := shell_contexts program dispatcher
    bits continuation carrier dispatcherTerm localNone
  have freshRootNone : freshResponseRoot? program dispatcher source = none := by
    rw [freshResponseRoot?, activeEq]
    rfl
  have freshNone : freshDispatcherSelection? program dispatcher source = none := by
    rw [freshDispatcherSelection?, outerEq]
    dsimp only
    rw [shell_route_freshCall_false bits continuation carrier progress]
    rfl
  have appenderNone : responseAppenderSelection? program dispatcher source = none := by
    rw [responseAppenderSelection?, responseAppenderAddress?, freshRootNone]
    rfl
  have carrierNone : responseCarrierSelection? program dispatcher source = none := by
    rw [responseCarrierSelection?, responseCarrierAddress?, freshRootNone]
    rfl
  have boundaryNone : responseBoundarySelection? program dispatcher source = none := by
    rw [responseBoundarySelection?, responseBoundaryAddress?,
      RootResetResponseClockFuelAgreement.completedResponseAddress?_none_of_outer_parseLocal_none
        outerEq localNone, freshRootNone]
    rfl
  have markedNone : markedHandoffSelection? program dispatcher source = none := by
    rw [markedHandoffSelection?, activeEq]
    rfl
  have noFuel : (RootResetPersistentRouteAFuel.classifyHandoff program dispatcher source).fuel = none := by
    rw [RootResetPersistentRouteAFuel.classifyHandoff, fuelEq]
    dsimp only
    rw [shell_fuel_none]
  let address := RootResetWholeDispatcherStages.shellDispatcherAddress ++
    (RootResetSelectorContract.contextAddress view.context ++ view.localRedexAddress)
  have selectedAddress : currentCarrierDispatcherAddress? program dispatcher source = some address := by
    rw [currentCarrierDispatcherAddress?, outerEq]
    dsimp only [shell, Carrier.activeShell, Carrier.shell, seedCode]
    rw [RootResetWholeDispatcherStages.parseFreshHalt?_fresh]
    dsimp only
    rw [phaseEq, bitEq]
    dsimp only
    rw [RootResetWholeDispatcherStages.parseRouteNode?_complete shape]
    rfl
  let shellContext := RootResetResponseBoundaryStages.localDispatcherContext
    (freshHField carrier) (word bits) carrier continuation carrier
  have lifted := RootResetWholeStageClassifier.contractAt?_plug_append
    shellContext _ contracts
  have sourceContracts : source.contractAt? address =
      some (shell bits continuation carrier target) := by
    exact lifted
  have selected : dispatcherSelection? program dispatcher source =
      some ⟨address, shell bits continuation carrier target⟩ := by
    rw [dispatcherSelection?, selectedAddress]
    change checkedAt? source address = _
    rw [checkedAt?, RootResetPersistentRouteAFuel.checkedSelection?, sourceContracts]
  have priority := (classify_dispatcher_priority freshNone boundaryNone appenderNone
    carrierNone markedNone noFuel selected).2
  rw [selectStep?, priority]
  rfl

theorem selectStep?_initialCall
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term) :
    selectStep? program dispatcher
      (shell bits continuation carrier
        (RouteGrammar.compiledCall (selectedAction program) dispatcher.tree carrier)) =
      some (shell bits continuation carrier
        (RootResetDispatcherNodeStages.firstActivation (selectedAction program)
          dispatcher.tree carrier)) := by
  let call := RouteGrammar.compiledCall (selectedAction program) dispatcher.tree carrier
  let source := shell bits continuation carrier call
  let target := shell bits continuation carrier
    (RootResetDispatcherNodeStages.firstActivation (selectedAction program) dispatcher.tree carrier)
  have routeNone : RouteParser.parse (selectedAction program) dispatcher.tree call = none := by
    cases parsed : RouteParser.parse (selectedAction program) dispatcher.tree call with
    | none => rfl
    | some found =>
        obtain ⟨response, shape⟩ := RouteParser.parse_sound parsed
        exact False.elim (shape.result_ne_compiledCall dispatcher.tree carrier rfl)
  have dispatchNone : DispatchParser.parse program dispatcher.tree call = none := by
    rw [DispatchParser.parse, DispatchParser.parseRouteDetailed, routeNone]
  have localNone : CheckpointDecoder.parseLocal? program dispatcher.tree source = none := by
    simp only [source, shell, Carrier.activeShell, Carrier.shell, CheckpointDecoder.parseLocal?,
      freshHField, seedCode, CheckpointDecoder.checkHalt?, haltCode, b, ↓reduceIte]
    rw [dispatchNone]
    split <;> rfl
  obtain ⟨activeEq, fuelEq, outerEq⟩ := shell_contexts program dispatcher bits
    continuation carrier call localNone
  have fresh : parseFreshDispatcherCall? program dispatcher.tree source = true :=
    parseFreshDispatcherCall?_freshLocal program dispatcher.tree bits continuation carrier
  have contracts : source.contractAt? RootResetWholeDispatcherStages.shellDispatcherAddress =
      some target := by
    have atRoot : call.contractAt? [] = some
        (RootResetDispatcherNodeStages.firstActivation (selectedAction program) dispatcher.tree carrier) := by
      dsimp only [call]
      cases dispatcher.tree <;> rfl
    have lifted := RootResetWholeStageClassifier.contractAt?_plug_append
      (RootResetResponseBoundaryStages.localDispatcherContext
        (freshHField carrier) (word bits) carrier continuation carrier) [] atRoot
    simpa only [List.append_nil] using! lifted
  have chosen : freshDispatcherSelection? program dispatcher source =
      some ⟨RootResetWholeDispatcherStages.shellDispatcherAddress, target⟩ := by
    rw [freshDispatcherSelection?, outerEq]
    dsimp only
    rw [fresh]
    change checkedAt? source RootResetWholeDispatcherStages.shellDispatcherAddress = _
    rw [checkedAt?, RootResetPersistentRouteAFuel.checkedSelection?, contracts]
  have noFuel : (RootResetPersistentRouteAFuel.classifyHandoff program dispatcher source).fuel = none := by
    rw [RootResetPersistentRouteAFuel.classifyHandoff, fuelEq]
    dsimp only
    rw [shell_fuel_none]
  change (classify program dispatcher source).selected?.map (·.target) = some target
  rw [classify, noFuel]
  simp only [classifyAfterFuel, chosen]
  rfl

/-- One exact dispatcher contraction, including the initial compiled call.
The row case stores construction syntax and the literal selected address. -/
inductive DispatcherEdge {Label : Type} (encode : Label → Term) (carrier : Term) :
    Dispatcher.Tree Label → Dispatcher.Route → Label → Term → Term → Prop where
  | initial {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
      (path : Dispatcher.HasRoute tree route label) :
      DispatcherEdge encode carrier tree route label
        (RouteGrammar.compiledCall encode tree carrier)
        (RootResetDispatcherNodeStages.firstActivation encode tree carrier)
  | row {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
      {source target : Term}
      (progress : RouteMutation encode carrier tree route label false source)
      (view : RootResetWholeDispatcherStages.RouteView Label)
      (shape : RootResetWholeDispatcherStages.RouteShape encode tree route view source)
      (contracts : source.contractAt?
        (RootResetSelectorContract.contextAddress view.context ++ view.localRedexAddress) = some target) :
      DispatcherEdge encode carrier tree route label source target

theorem DispatcherEdge.selectStep?
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    (bits : List Bool) (continuation carrier : Term)
    (phase : CTS.Phase program) (bit : Bool)
    (carrierNot3 : carrier.headArity ≠ 3)
    (phaseEq : carrierPhase? program dispatcher.tree carrier = some phase)
    (bitEq : carrierResponseBit? program dispatcher.tree carrier = some bit)
    {source target : Term}
    (edge : DispatcherEdge (selectedAction program) carrier dispatcher.tree
      (dispatcher.route (phase, bit)) (phase, bit) source target) :
    selectStep? program dispatcher (shell bits continuation carrier source) =
      some (shell bits continuation carrier target) := by
  cases edge with
  | initial path => exact selectStep?_initialCall program dispatcher bits continuation carrier
  | row progress view shape contracts =>
      exact selectStep?_routeMutation program dispatcher bits continuation carrier phase bit
        carrierNot3 phaseEq bitEq progress view shape contracts

theorem DispatcherEdge.left
    {Label : Type} {encode : Label → Term} {carrier : Term}
    {left : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    {source target : Term} (edge : DispatcherEdge encode carrier left route label source target)
    (right : Dispatcher.Tree Label) :
    DispatcherEdge encode carrier (.node left right) (.left :: route) label
      (RouteGrammar.selectedLeft carrier source (RouteGrammar.compiledCall encode right carrier))
      (RouteGrammar.selectedLeft carrier target (RouteGrammar.compiledCall encode right carrier)) := by
  cases edge with
  | initial path =>
      refine .row (.selectLeft path)
        (RootResetWholeDispatcherStages.RouteView.root left right .left route
          (.forked ⟨carrier, carrier, carrier⟩))
        (.root left right .left route (.forked ⟨carrier, carrier, carrier⟩)) ?_
      cases left <;> rfl
  | row progress view shape contracts =>
      refine .row (.innerLeft progress)
        (view.wrapLeft carrier (RouteGrammar.compiledCall encode right carrier))
        (.left carrier carrier shape) ?_
      have lifted := RootResetWholeStageClassifier.contractAt?_plug_append
        (RootResetWholeDispatcherStages.selectedLeftContext carrier
          (RouteGrammar.compiledCall encode right carrier) .hole) _ contracts
      simpa only [RootResetWholeDispatcherStages.RouteView.wrapLeft,
        RootResetWholeDispatcherStages.selectedLeftContext, Context.plug,
        RootResetSelectorContract.contextAddress, List.cons_append, List.nil_append,
        RouteGrammar.selectedLeft, chosen,
        RootResetWholeDispatcherStages.RouteView.localRedexAddress] using lifted

theorem DispatcherEdge.right
    {Label : Type} {encode : Label → Term} {carrier : Term}
    {right : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    {source target : Term} (edge : DispatcherEdge encode carrier right route label source target)
    (left : Dispatcher.Tree Label) :
    DispatcherEdge encode carrier (.node left right) (.right :: route) label
      (RouteGrammar.selectedRight carrier (RouteGrammar.compiledCall encode left carrier) source)
      (RouteGrammar.selectedRight carrier (RouteGrammar.compiledCall encode left carrier) target) := by
  cases edge with
  | initial path =>
      refine .row (.selectRight path)
        (RootResetWholeDispatcherStages.RouteView.root left right .right route
          (.forked ⟨carrier, carrier, carrier⟩))
        (.root left right .right route (.forked ⟨carrier, carrier, carrier⟩)) ?_
      cases right <;> rfl
  | row progress view shape contracts =>
      refine .row (.innerRight progress)
        (view.wrapRight carrier (RouteGrammar.compiledCall encode left carrier))
        (.right carrier carrier shape) ?_
      have lifted := RootResetWholeStageClassifier.contractAt?_plug_append
        (RootResetWholeDispatcherStages.selectedRightContext carrier
          (RouteGrammar.compiledCall encode left carrier) .hole) _ contracts
      simpa only [RootResetWholeDispatcherStages.RouteView.wrapRight,
        RootResetWholeDispatcherStages.selectedRightContext, Context.plug,
        RootResetSelectorContract.contextAddress, List.cons_append, List.nil_append,
        RouteGrammar.selectedRight, chosen,
        RootResetWholeDispatcherStages.RouteView.localRedexAddress] using lifted

/-- The leaf contraction remains a selected parent-row edge, retaining the
actual sibling and the original dispatcher's route. -/
theorem DispatcherEdge.left_leaf
    {Label : Type} (encode : Label → Term) (carrier : Term)
    (label : Label) (right : Dispatcher.Tree Label) :
    DispatcherEdge encode carrier (.node (.leaf label) right) [.left] label
      (RouteGrammar.selectedLeft carrier
        (RouteGrammar.compiledCall encode (.leaf label) carrier)
        (RouteGrammar.compiledCall encode right carrier))
      (RouteGrammar.selectedLeft carrier (chosen carrier (.app (encode label) carrier))
        (RouteGrammar.compiledCall encode right carrier)) :=
  DispatcherEdge.left (.initial (.leaf label)) right

theorem DispatcherEdge.right_leaf
    {Label : Type} (encode : Label → Term) (carrier : Term)
    (label : Label) (left : Dispatcher.Tree Label) :
    DispatcherEdge encode carrier (.node left (.leaf label)) [.right] label
      (RouteGrammar.selectedRight carrier (RouteGrammar.compiledCall encode left carrier)
        (RouteGrammar.compiledCall encode (.leaf label) carrier))
      (RouteGrammar.selectedRight carrier (RouteGrammar.compiledCall encode left carrier)
        (chosen carrier (.app (encode label) carrier))) :=
  DispatcherEdge.right (.initial (.leaf label)) left

inductive DispatcherChain {Label : Type} (encode : Label → Term) (carrier : Term)
    (tree : Dispatcher.Tree Label) (route : Dispatcher.Route) (label : Label) :
    Term → List Term → Prop where
  | done (source : Term) : DispatcherChain encode carrier tree route label source []
  | next {source target : Term} {rest : List Term}
      (edge : DispatcherEdge encode carrier tree route label source target)
      (tail : DispatcherChain encode carrier tree route label target rest) :
      DispatcherChain encode carrier tree route label source (target :: rest)

theorem DispatcherChain.left
    {Label : Type} {encode : Label → Term} {carrier : Term}
    {left : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    {source : Term} {rest : List Term}
    (chain : DispatcherChain encode carrier left route label source rest)
    (right : Dispatcher.Tree Label) :
    DispatcherChain encode carrier (.node left right) (.left :: route) label
      (RouteGrammar.selectedLeft carrier source (RouteGrammar.compiledCall encode right carrier))
      (rest.map fun term => RouteGrammar.selectedLeft carrier term
        (RouteGrammar.compiledCall encode right carrier)) := by
  induction chain with
  | done source => exact .done _
  | next edge tail ih => exact .next (edge.left right) ih

theorem DispatcherChain.right
    {Label : Type} {encode : Label → Term} {carrier : Term}
    {right : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    {source : Term} {rest : List Term}
    (chain : DispatcherChain encode carrier right route label source rest)
    (left : Dispatcher.Tree Label) :
    DispatcherChain encode carrier (.node left right) (.right :: route) label
      (RouteGrammar.selectedRight carrier (RouteGrammar.compiledCall encode left carrier) source)
      (rest.map fun term => RouteGrammar.selectedRight carrier
        (RouteGrammar.compiledCall encode left carrier) term) := by
  induction chain with
  | done source => exact .done _
  | next edge tail ih => exact .next (edge.right left) ih

/-- The entire exact route-entry list follows selected dispatcher addresses,
including every exposed row, chosen child, and final leaf contraction. -/
theorem routeEntries_dispatcherChain
    {Label : Type} (encode : Label → Term) (carrier : Term)
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    (path : Dispatcher.HasRoute tree route label) :
    DispatcherChain encode carrier tree route label
      (RouteGrammar.compiledCall encode tree carrier)
      ((routeEntries encode carrier tree route).map Prod.snd) := by
  induction path with
  | leaf label => exact .next (.initial (.leaf label)) (.done _)
  | @left route label left right path ih =>
      refine .next (.initial (.left path)) (.next
        (.row (.exposeLeft path)
          (RootResetWholeDispatcherStages.RouteView.root left right .left route
            (.exposed ⟨carrier, carrier⟩))
          (.root left right .left route (.exposed ⟨carrier, carrier⟩)) (by rfl)) ?_)
      simpa only [routeEntries, List.map, List.map_map] using! ih.left right
  | @right route label left right path ih =>
      refine .next (.initial (.right path)) (.next
        (.row (.exposeRight path)
          (RootResetWholeDispatcherStages.RouteView.root left right .right route
            (.exposed ⟨carrier, carrier⟩))
          (.root left right .right route (.exposed ⟨carrier, carrier⟩)) (by rfl)) ?_)
      simpa only [routeEntries, List.map, List.map_map] using! ih.right left

/-- Literal dispatcher-entry pairing transfers the row proof to arbitrary
controller configurations carrying those exact erased terms. -/
theorem DispatcherChain.selectsSamples
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    (bits : List Bool) (continuation carrier : Term)
    (phase : CTS.Phase program) (bit : Bool)
    (carrierNot3 : carrier.headArity ≠ 3)
    (phaseEq : carrierPhase? program dispatcher.tree carrier = some phase)
    (bitEq : carrierResponseBit? program dispatcher.tree carrier = some bit)
    {source : Term} {entries : List Term}
    (chain : DispatcherChain (selectedAction program) carrier dispatcher.tree
      (dispatcher.route (phase, bit)) (phase, bit) source entries)
    {Control : Type} {before : FiniteController.Configuration Control}
    {samples : List (FiniteController.Configuration Control)}
    (beforeEq : before.cursor.erase = shell bits continuation carrier source)
    (samplesEq : samples.map (fun sample => sample.cursor.erase) =
      entries.map (shell bits continuation carrier)) :
    RootResetExactTraceAgreement.SelectorChain (selectStep? program dispatcher) before samples := by
  induction chain generalizing before samples with
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
          refine .next ?_ (ih equalities.1 equalities.2)
          rw [beforeEq, equalities.1]
          exact edge.selectStep? bits continuation carrier phase bit carrierNot3 phaseEq bitEq

theorem emptyResponseSamplePairs_erases
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {registers : SchedulerControl.Registers program} {bits : List Bool}
    {continuation carrier : Term} {parents : List ParentFrame}
    {samples : List (SchedulerInvariant.Configuration program dispatcher)}
    {entries : List (Bool × Term)}
    (pairs : SchedulerNestedEmpty.EmptyResponseSamplePairs program dispatcher registers bits
      continuation carrier parents samples entries) :
    samples.map (fun sample => sample.cursor.erase) =
      entries.map (fun entry => Cursor.rebuild parents entry.2) := by
  induction pairs with
  | nil => rfl
  | cons pc cursor done term position erase root tail ih =>
      change cursor.erase :: _ = _ :: _
      rw [erase, ih]

/-- The exact EMPTY response agrees from its first FRAME residual through
the dispatcher call, all internal route rows, and the final selected leaf. -/
theorem emptyResponse_dispatcher_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program)
    (bits : List Bool) (continuation carrier : Term)
    (carrierNot3 : carrier.headArity ≠ 3)
    (phaseEq : carrierPhase? program dispatcher.tree carrier = some registers.phase)
    (bitEq : carrierResponseBit? program dispatcher.tree carrier = some false) :
    ∃ first second third rest,
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerEmpty.markStartConfiguration program dispatcher registers bits continuation carrier [])
        (SchedulerEmpty.responseStartConfiguration program dispatcher registers bits continuation carrier [])
        (first :: second :: third :: rest) ∧
      RootResetExactTraceAgreement.SelectorChain (selectStep? program dispatcher) first
        (second :: third :: rest) := by
  obtain ⟨samples, chain, paired⟩ := SchedulerNestedEmpty.emptyResponse_exactPairedMutationChain
    program dispatcher registers bits continuation carrier []
  change SchedulerNestedEmpty.EmptyResponseSamplePairs program dispatcher registers bits
    continuation carrier [] samples
      ((false, frameFirstRoot (compileActions program dispatcher.tree) bits continuation carrier) ::
       (false, frameSecondRoot (compileActions program dispatcher.tree) bits continuation carrier) ::
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
                exact RootResetNormalResponseSelectorChain.selectStep?_frameFirstRoot
                  program dispatcher bits continuation carrier
              · change selectStep? program dispatcher cursor2.erase = some cursor3.erase
                rw [erase2, erase3]
                exact RootResetNormalResponseSelectorChain.selectStep?_frameSecondRoot
                  program dispatcher bits continuation carrier
              ·
                have routeChain := routeEntries_dispatcherChain (selectedAction program) carrier
                  (dispatcher.route_valid (registers.phase, false))
                apply routeChain.selectsSamples bits continuation carrier registers.phase false
                  carrierNot3 phaseEq bitEq
                · exact erase3
                · have erases := emptyResponseSamplePairs_erases tail3
                  simpa only [PrimitiveLocalResponse.emitted, actionEntries_nil, actionEntries_cons,
                    List.append_eq, List.map_append, List.map_nil, List.append_nil, List.nil_append,
                    List.map_map, Cursor.rebuild] using! erases

theorem emptySweepCarrier_not_three
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation : Term) (count : Nat)
    (registers : SchedulerControl.Registers program) (carrier : Term)
    (carrierNot3 : carrier.headArity ≠ 3) :
    (SchedulerCycle.emptySweepCarrier program dispatcher bits continuation count registers carrier).headArity ≠ 3 := by
  induction count generalizing registers carrier with
  | zero => exact carrierNot3
  | succ count ih =>
      apply ih
      change 5 ≠ 3
      decide

/-- An arbitrary generated EMPTY sweep carrier supplies every data premise
needed by the complete dispatcher route, independently of stage horizon. -/
theorem generatedEmptyResponse_dispatcher_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (continuation : Term) (admissible : Carrier.Admissible continuation) (count : Nat) :
    let initial := SchedulerNestedEmpty.initialEmptyRegisters program
    let registers := SchedulerCycle.emptySweepRegisters program count initial
    let carrier := SchedulerCycle.emptySweepCarrier program dispatcher [] continuation count initial
      (baseCarrier (environmentCode (compileActions program dispatcher.tree) []) continuation)
    ∃ first second third rest,
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerEmpty.markStartConfiguration program dispatcher registers [] continuation carrier [])
        (SchedulerEmpty.responseStartConfiguration program dispatcher registers [] continuation carrier [])
        (first :: second :: third :: rest) ∧
      RootResetExactTraceAgreement.SelectorChain (selectStep? program dispatcher) first
        (second :: third :: rest) := by
  dsimp only
  have labels := RootResetEmptyResponseSelectorChain.generatedEmptySweep_label
    program dispatcher continuation count
  apply emptyResponse_dispatcher_selectorChain program dispatcher _ [] continuation _
  · apply emptySweepCarrier_not_three
    rcases Carrier.baseCarrier_headArity
      (environmentCode (compileActions program dispatcher.tree) []) admissible with five | six
    · rw [five]
      decide
    · rw [six]
      decide
  · exact labels.1
  · exact labels.2

/-- The exact generated response chain includes COMMIT after the selected
leaf.  Every edge following the first FRAME sample agrees with the selector. -/
theorem generatedEmptyResponse_through_marker_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (continuation : Term) (admissible : Carrier.Admissible continuation) (count : Nat) :
    let initial := SchedulerNestedEmpty.initialEmptyRegisters program
    let registers := SchedulerCycle.emptySweepRegisters program count initial
    let carrier := SchedulerCycle.emptySweepCarrier program dispatcher [] continuation count initial
      (baseCarrier (environmentCode (compileActions program dispatcher.tree) []) continuation)
    ∃ first rest,
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerEmpty.markedPendingConfiguration program dispatcher registers [] continuation carrier [])
        (SchedulerEmpty.responseStartConfiguration program dispatcher registers [] continuation carrier [])
        (first :: rest) ∧
      RootResetExactTraceAgreement.SelectorChain (selectStep? program dispatcher) first rest := by
  dsimp only
  let initial := SchedulerNestedEmpty.initialEmptyRegisters program
  let registers := SchedulerCycle.emptySweepRegisters program count initial
  let carrier := SchedulerCycle.emptySweepCarrier program dispatcher [] continuation count initial
    (baseCarrier (environmentCode (compileActions program dispatcher.tree) []) continuation)
  let marker := SchedulerRootContinuation.emptyMarkerMutationConfiguration program dispatcher
    registers [] continuation carrier []
  obtain ⟨first, second, third, rest, responseChain, selected⟩ :=
    generatedEmptyResponse_dispatcher_selectorChain program dispatcher continuation admissible count
  have markerChain : ExactMutationChain (SchedulerControl.machine program dispatcher)
      (SchedulerEmpty.markedPendingConfiguration program dispatcher registers [] continuation carrier [])
      (SchedulerEmpty.markStartConfiguration program dispatcher registers [] continuation carrier [])
      [marker] := by
    exact .next 4 (SchedulerRootContinuation.emptyMarkStart_seekMutation ..)
      (.done 4 (SchedulerRootContinuation.emptyMarkerSuffix_zeroRun ..))
  have markerSelected := (RootResetEmptyResponseCommit.generatedEmptySweep_commit_selectorChain
    program dispatcher continuation admissible count).2
  obtain ⟨ticks, searched, tailExact⟩ := RootResetResponseSampleParserBridge.exactMutationChain_cons
    responseChain
  refine ⟨first, (second :: third :: rest) ++ [marker], ?_, ?_⟩
  · exact SchedulerRecurrence.ExactMutationChain.append responseChain markerChain
  · exact RootResetExactTraceAgreement.SelectorChain.append tailExact selected markerSelected

end PureSFormal.Research.RootResetEmptyRouteSelectorChain

