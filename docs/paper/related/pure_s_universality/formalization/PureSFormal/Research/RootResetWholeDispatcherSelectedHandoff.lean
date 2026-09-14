import PureSFormal.Research.RootResetDispatcherSelectedHandoff
import PureSFormal.Research.RootResetResponseBoundaryStages

/-!
# Whole-term selected-child dispatcher handoff

A successful whole dispatcher parse reconstructs the marked-history prefix,
the fresh active shell, the current dispatcher node, and the direction fixed
by the literal history phase and front bit.  Contracting the selected child
therefore uses a root-relative address computed from the current bare term.

The target term retargets the continuation field of every enclosing marked
Local.  Internal-node targets expose the next dispatcher row.  Leaf targets
expose the selected action inside the activated route.  The action-to-Push
contraction has a separate nonempty-response premise.

These statements concern one syntax-local handoff.  They imply no scheduler
reachability, selected-step closure, phase sequence, or CTS simulation.
-/

namespace PureSFormal.Research.RootResetWholeDispatcherSelectedHandoff

open PureSFormal.PureS
open RootResetReachableStageGrammar

/-! ## Contexts and marked-prefix retargeting -/

/-- One-hole context surrounding the dispatcher field of an open Local shell. -/
def shellDispatcherContext
    (haltField seedPayload seedAudit continuation continuationAudit : Term) :
    Context :=
  .appLeft
    (.appLeft
      (.appRight haltField .hole)
      (.app (.app .s seedPayload) seedAudit))
    (.app continuation continuationAudit)

@[simp]
theorem shellDispatcherContext_plug
    (haltField dispatcher seedPayload seedAudit continuation
      continuationAudit : Term) :
    (shellDispatcherContext haltField seedPayload seedAudit continuation
        continuationAudit).plug dispatcher =
      CheckpointDecoder.openShell haltField dispatcher seedPayload seedAudit
        continuation continuationAudit :=
  rfl

@[simp]
theorem shellDispatcherContext_address
    (haltField seedPayload seedAudit continuation continuationAudit : Term) :
    RootResetSelectorContract.contextAddress
        (shellDispatcherContext haltField seedPayload seedAudit continuation
          continuationAudit) =
      RootResetWholeDispatcherStages.shellDispatcherAddress :=
  rfl

/-- A shell carrying a literal fresh halt field is rejected by the marked parser. -/
theorem parseMarkedLocal?_fresh_openShell_none
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (haltAudit dispatcher seedPayload seedAudit continuation
      continuationAudit : Term) :
    parseMarkedLocal? program tree
        (CheckpointDecoder.openShell (freshHField haltAudit) dispatcher
          seedPayload seedAudit continuation continuationAudit) = none := by
  simp only [parseMarkedLocal?, CheckpointDecoder.parseLocal?,
    CheckpointDecoder.openShell, CheckpointDecoder.checkHalt?, freshHField,
    haltCode, b, ↓reduceIte]
  generalize DispatchParser.parse program tree dispatcher = result
  cases result <;> simp

/-- Every parsed completed Local has the literal `RL` continuation address. -/
theorem localContinuationContext_address_of_parseLocal?
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program tree term = some view) :
    RootResetSelectorContract.contextAddress (localContinuationContext term) =
      [.right, .left] := by
  rcases CheckpointDecoder.parseLocal?_sound parsed with
    ⟨haltField, dispatcher, seedAudit, continuationAudit, halt, dispatch,
      source⟩
  rw [source]
  rfl

/--
Retargeting the active hole preserves a canonical marked prefix.  Historical
records receive their new literal continuations and retain marked status.
-/
theorem rewrap_marked_prefix
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term active replacement : Term} {context : Context}
    {history : List (CheckpointDecoder.LocalView program)}
    (markedPrefix : MarkedPrefix program tree term active context history)
    (stop : parseMarkedLocal? program tree replacement = none) :
    ∃ targetContext targetHistory,
      MarkedPrefix program tree (context.plug replacement) replacement
          targetContext targetHistory ∧
        RootResetWholeStageClassifier.innermostLabel? targetHistory =
          RootResetWholeStageClassifier.innermostLabel? history ∧
        RootResetSelectorContract.contextAddress targetContext =
          RootResetSelectorContract.contextAddress context := by
  induction markedPrefix with
  | here oldStop =>
      exact ⟨.hole, [], .here stop, rfl, rfl⟩
  | @«local» source oldActive innerContext view history boundary marked inner ih =>
      obtain ⟨targetInnerContext, targetHistory, targetPrefix, headers,
        targetAddress⟩ := ih
      let innerTarget := innerContext.plug replacement
      let targetView :=
        RootResetResponseBoundaryStages.replaceContinuation view innerTarget
      let targetSource :=
        (localContinuationContext source).plug innerTarget
      have targetShape : CheckpointDecoder.LocalShape program tree targetView
          targetSource := by
        exact RootResetResponseBoundaryStages.localShape_replaceContinuation
          (CheckpointDecoder.parseLocal?_sound boundary) innerTarget
      have targetBoundary : CheckpointDecoder.parseLocal? program tree
          targetSource = some targetView :=
        CheckpointDecoder.parseLocal?_complete targetShape
      have targetMarked : targetView.status = .marked := by
        exact marked
      have rebuilt :
          MarkedPrefix program tree targetSource replacement
            ((localContinuationContext targetSource).comp targetInnerContext)
            (targetView :: targetHistory) :=
        .local targetBoundary targetMarked targetPrefix
      refine ⟨(localContinuationContext targetSource).comp targetInnerContext,
        targetView :: targetHistory, ?_, ?_, ?_⟩
      · simpa [targetSource, innerTarget, Context.plug_comp] using rebuilt
      · simp only [RootResetWholeStageClassifier.innermostLabel?]
        rw [headers]
        rfl
      · rw [RootResetSelectorContract.contextAddress_comp,
          localContinuationContext_address_of_parseLocal? targetBoundary,
          RootResetSelectorContract.contextAddress_comp,
          localContinuationContext_address_of_parseLocal? boundary,
          targetAddress]

/-! ## Selected-route splicing -/

/--
A replacement route rooted at the current node splices through every
already-selected ancestor of the original route.
-/
theorem RouteShape.splice_current
    {Label : Type u} {encode : Label → Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route}
    {view : RootResetWholeDispatcherStages.RouteView Label} {term : Term}
    (shape : RootResetWholeDispatcherStages.RouteShape encode tree route view
      term)
    {replacementView : RootResetWholeDispatcherStages.RouteView Label}
    {replacementTerm : Term}
    (replacementShape : RootResetWholeDispatcherStages.RouteShape encode
      (.node view.left view.right) (view.direction :: view.remaining)
      replacementView replacementTerm) :
    ∃ liftedView,
      RootResetWholeDispatcherStages.RouteShape encode tree route liftedView
          (view.context.plug replacementTerm) ∧
        liftedView.stage = replacementView.stage := by
  induction shape with
  | root left right direction remaining stage =>
      exact ⟨replacementView, by
        simpa [RootResetWholeDispatcherStages.RouteView.root] using
          replacementShape, rfl⟩
  | @left left right remaining innerView innerTerm outerAudit dormantAudit
      inner ih =>
      have innerReplacement :
          RootResetWholeDispatcherStages.RouteShape encode
            (.node innerView.left innerView.right)
            (innerView.direction :: innerView.remaining)
            replacementView replacementTerm := by
        simpa [RootResetWholeDispatcherStages.RouteView.wrapLeft] using
          replacementShape
      obtain ⟨liftedView, liftedShape, liftedStage⟩ := ih innerReplacement
      let dormant := RouteGrammar.compiledCall encode right dormantAudit
      refine ⟨liftedView.wrapLeft outerAudit dormant, ?_, ?_⟩
      have wrapped := RootResetWholeDispatcherStages.RouteShape.left
        (right := right) outerAudit dormantAudit liftedShape
      simpa [dormant, RootResetWholeDispatcherStages.RouteView.wrapLeft,
        RootResetWholeDispatcherStages.selectedLeftContext,
        RouteGrammar.selectedLeft, chosen] using wrapped
      · exact liftedStage
  | @right left right remaining innerView innerTerm outerAudit dormantAudit
      inner ih =>
      have innerReplacement :
          RootResetWholeDispatcherStages.RouteShape encode
            (.node innerView.left innerView.right)
            (innerView.direction :: innerView.remaining)
            replacementView replacementTerm := by
        simpa [RootResetWholeDispatcherStages.RouteView.wrapRight] using
          replacementShape
      obtain ⟨liftedView, liftedShape, liftedStage⟩ := ih innerReplacement
      let dormant := RouteGrammar.compiledCall encode left dormantAudit
      refine ⟨liftedView.wrapRight outerAudit dormant, ?_, ?_⟩
      have wrapped := RootResetWholeDispatcherStages.RouteShape.right
        (left := left) outerAudit dormantAudit liftedShape
      simpa [dormant, RootResetWholeDispatcherStages.RouteView.wrapRight,
        RootResetWholeDispatcherStages.selectedRightContext,
        RouteGrammar.selectedRight, chosen] using wrapped
      · exact liftedStage

/-- A completed leaf route splices through every selected node ancestor. -/
theorem RouteShape.splice_activated
    {Label : Type u} {encode : Label → Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route}
    {view : RootResetWholeDispatcherStages.RouteView Label} {term : Term}
    (shape : RootResetWholeDispatcherStages.RouteShape encode tree route view
      term)
    {label : Label} {response replacementTerm : Term}
    (replacementShape : RouteGrammar.ActivatedRoute encode
      (.node view.left view.right) (view.direction :: view.remaining)
      label response replacementTerm) :
    RouteGrammar.ActivatedRoute encode tree route label response
      (view.context.plug replacementTerm) := by
  induction shape with
  | root left right direction remaining stage =>
      simpa [RootResetWholeDispatcherStages.RouteView.root] using
        replacementShape
  | @left left right remaining innerView innerTerm outerAudit dormantAudit
      inner ih =>
      have innerReplacement : RouteGrammar.ActivatedRoute encode
          (.node innerView.left innerView.right)
          (innerView.direction :: innerView.remaining) label response
          replacementTerm := by
        simpa [RootResetWholeDispatcherStages.RouteView.wrapLeft] using
          replacementShape
      have innerTarget := ih innerReplacement
      have wrapped := RouteGrammar.ActivatedRoute.left (right := right)
        outerAudit dormantAudit innerTarget
      simpa [RootResetWholeDispatcherStages.RouteView.wrapLeft,
        RootResetWholeDispatcherStages.selectedLeftContext,
        RouteGrammar.selectedLeft, chosen] using wrapped
  | @right left right remaining innerView innerTerm outerAudit dormantAudit
      inner ih =>
      have innerReplacement : RouteGrammar.ActivatedRoute encode
          (.node innerView.left innerView.right)
          (innerView.direction :: innerView.remaining) label response
          replacementTerm := by
        simpa [RootResetWholeDispatcherStages.RouteView.wrapRight] using
          replacementShape
      have innerTarget := ih innerReplacement
      have wrapped := RouteGrammar.ActivatedRoute.right (left := left)
        outerAudit dormantAudit innerTarget
      simpa [RootResetWholeDispatcherStages.RouteView.wrapRight,
        RootResetWholeDispatcherStages.selectedRightContext,
        RouteGrammar.selectedRight, chosen] using wrapped

/-! ## Exact whole selected-child contraction -/

/-- Forked-node target at the current node focus. -/
def forkedFocusTarget
    {Label : Type u} (encode : Label → Term)
    (node : RootResetWholeDispatcherStages.RouteView Label)
    (forked : RootResetDispatcherNodeStages.ForkedView) : Term :=
  RootResetDispatcherSelectedHandoff.selectedTarget encode node.left node.right
    forked node.direction

/-- Fresh active shell after the syntax-selected child contracts. -/
def forkedActiveTarget
    {program : CTS.Program}
    (view : RootResetWholeDispatcherStages.View program)
    (forked : RootResetDispatcherNodeStages.ForkedView)
    (haltField seedAudit continuationAudit : Term) : Term :=
  CheckpointDecoder.openShell haltField
    (view.endpoint.node.context.plug
      (forkedFocusTarget (selectedAction program) view.endpoint.node forked))
    (word view.endpoint.bits) seedAudit view.endpoint.continuation
    continuationAudit

/-- Whole target after retargeting the active hole of every marked ancestor. -/
def forkedWholeTarget
    {program : CTS.Program}
    (view : RootResetWholeDispatcherStages.View program)
    (forked : RootResetDispatcherNodeStages.ForkedView)
    (haltField seedAudit continuationAudit : Term) : Term :=
  view.context.plug
    (forkedActiveTarget view forked haltField seedAudit continuationAudit)

/-- The direction used by a parsed fork is the direction in the reconstructed route. -/
theorem parsedForked_direction_recovered
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {view : RootResetWholeDispatcherStages.View program}
    {forked : RootResetDispatcherNodeStages.ForkedView}
    (parsed : RootResetWholeDispatcherStages.parse? program layout term =
      some view)
    (_stageEq : view.stage = .forked forked) :
    layout.route view.label =
      view.endpoint.node.routePrefix ++
        view.endpoint.node.direction :: view.endpoint.node.remaining :=
  RootResetWholeDispatcherStages.parse?_direction_from_outer_route parsed

/-- Exact contextual target for one displayed fresh-shell decomposition. -/
theorem parsedForked_contracts_target
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {view : RootResetWholeDispatcherStages.View program}
    {forked : RootResetDispatcherNodeStages.ForkedView}
    {haltField dispatcherTerm seedAudit continuationAudit : Term}
    (parsed : RootResetWholeDispatcherStages.parse? program layout term =
      some view)
    (stageEq : view.stage = .forked forked)
    (routeShape : RootResetWholeDispatcherStages.RouteShape
      (selectedAction program) layout.tree view.route view.endpoint.node
      dispatcherTerm)
    (activeSource : view.active =
      CheckpointDecoder.openShell haltField dispatcherTerm
        (word view.endpoint.bits) seedAudit view.endpoint.continuation
        continuationAudit) :
    term.contractAt? view.redexAddress =
      some (forkedWholeTarget view forked haltField seedAudit
        continuationAudit) := by
  have wholeShape := RootResetWholeDispatcherStages.parse?_sound parsed
  have nodeStage : view.endpoint.node.stage = .forked forked := by
    simpa [RootResetWholeDispatcherStages.View.stage] using stageEq
  have forkedParsed :
      RootResetDispatcherNodeStages.parseForked? (selectedAction program)
        view.endpoint.node.left view.endpoint.node.right
        (view.endpoint.node.focusTerm (selectedAction program)) =
      some forked := by
    simp [RootResetWholeDispatcherStages.RouteView.focusTerm,
      RootResetWholeDispatcherStages.stageTerm, nodeStage]
  have focusContracts :
      (view.endpoint.node.focusTerm (selectedAction program)).contractAt?
          (RootResetDispatcherNodeStages.forkedChildAddress
            view.endpoint.node.direction) =
        some (forkedFocusTarget (selectedAction program)
          view.endpoint.node forked) := by
    exact RootResetDispatcherSelectedHandoff.parseForked?_selected_contracts_exact
      forkedParsed view.endpoint.node.direction
  have dispatcherContracts :=
    RootResetWholeStageClassifier.contractAt?_plug_append
      view.endpoint.node.context
      (RootResetDispatcherNodeStages.forkedChildAddress
        view.endpoint.node.direction)
      focusContracts
  rw [routeShape.source_eq] at dispatcherContracts
  let shellContext := shellDispatcherContext haltField (word view.endpoint.bits)
    seedAudit view.endpoint.continuation continuationAudit
  have activeContractsRaw :=
    RootResetWholeStageClassifier.contractAt?_plug_append shellContext
      (RootResetSelectorContract.contextAddress view.endpoint.node.context ++
        RootResetDispatcherNodeStages.forkedChildAddress
          view.endpoint.node.direction)
      dispatcherContracts
  have activeContracts :
      view.active.contractAt? view.endpoint.redexAddress =
        some (forkedActiveTarget view forked haltField seedAudit
          continuationAudit) := by
    rw [activeSource]
    simpa [shellContext, forkedActiveTarget,
      RootResetWholeDispatcherStages.ActiveView.redexAddress,
      RootResetWholeDispatcherStages.ActiveView.nodeAddress,
      RootResetWholeDispatcherStages.RouteView.localRedexAddress, nodeStage,
      List.append_assoc] using activeContractsRaw
  have wholeContracts :=
    RootResetWholeStageClassifier.contractAt?_plug_append view.context
      view.endpoint.redexAddress activeContracts
  rw [wholeShape.markedPrefix.source_eq] at wholeContracts
  simpa [forkedWholeTarget,
    RootResetWholeDispatcherStages.View.redexAddress] using wholeContracts

/--
The selected fork child contracts at the exact root-relative address.  The
contractum is the literal marked-prefix retargeting of the fresh active shell.
-/
theorem parsedForked_contracts_exact
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {view : RootResetWholeDispatcherStages.View program}
    {forked : RootResetDispatcherNodeStages.ForkedView}
    (parsed : RootResetWholeDispatcherStages.parse? program layout term =
      some view)
    (stageEq : view.stage = .forked forked) :
    ∃ haltField seedAudit continuationAudit,
      CheckpointDecoder.HaltShape .fresh haltField ∧
      term.contractAt? view.redexAddress =
        some (forkedWholeTarget view forked haltField seedAudit
          continuationAudit) := by
  have wholeShape := RootResetWholeDispatcherStages.parse?_sound parsed
  rcases wholeShape.activeShape.source_eq with
    ⟨haltField, dispatcherTerm, seedAudit, continuationAudit, halt,
      routeShape, activeSource⟩
  exact ⟨haltField, seedAudit, continuationAudit, halt,
    parsedForked_contracts_target parsed stageEq routeShape activeSource⟩

/-! ## Internal-node handoff -/

/-- Child tree selected by the syntax-derived current direction. -/
def selectedTree
    {Label : Type u}
    (node : RootResetWholeDispatcherStages.RouteView Label) :
    Dispatcher.Tree Label :=
  match node.direction with
  | .left => node.left
  | .right => node.right

/-- Fork argument selected by the syntax-derived current direction. -/
def selectedArgument
    (forked : RootResetDispatcherNodeStages.ForkedView)
    (direction : Direction) : Term :=
  match direction with
  | .left => forked.leftArgument
  | .right => forked.rightArgument

/--
When the selected child is internal, the exact whole target reparses as that
child's exposed dispatcher row.  Selection uses the direction stored in the
bare-term parse result, and the route tail supplies the next direction.
-/
theorem parsedForked_selectedNode_exact_handoff
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {view : RootResetWholeDispatcherStages.View program}
    {forked : RootResetDispatcherNodeStages.ForkedView}
    {childLeft childRight : Dispatcher.Tree (ActionLabel program)}
    {nextDirection : Direction} {remaining : Dispatcher.Route}
    (parsed : RootResetWholeDispatcherStages.parse? program layout term =
      some view)
    (stageEq : view.stage = .forked forked)
    (selectedNode : selectedTree view.endpoint.node =
      .node childLeft childRight)
    (remainingEq : view.endpoint.node.remaining =
      nextDirection :: remaining) :
    ∃ haltField seedAudit continuationAudit targetView,
      CheckpointDecoder.HaltShape .fresh haltField ∧
      term.contractAt? view.redexAddress =
        some (forkedWholeTarget view forked haltField seedAudit
          continuationAudit) ∧
      RootResetWholeDispatcherStages.parse? program layout
          (forkedWholeTarget view forked haltField seedAudit
            continuationAudit) = some targetView ∧
      targetView.stage = .exposed
        ⟨selectedArgument forked view.endpoint.node.direction,
          selectedArgument forked view.endpoint.node.direction⟩ := by
  have wholeShape := RootResetWholeDispatcherStages.parse?_sound parsed
  rcases wholeShape.activeShape.source_eq with
    ⟨haltField, dispatcherTerm, seedAudit, continuationAudit, halt,
      routeShape, activeSource⟩
  have nodeStage : view.endpoint.node.stage = .forked forked := by
    simpa [RootResetWholeDispatcherStages.View.stage] using stageEq
  have replacementRouteShape :
      ∃ replacementView,
        RootResetWholeDispatcherStages.RouteShape (selectedAction program)
          (.node view.endpoint.node.left view.endpoint.node.right)
          (view.endpoint.node.direction :: view.endpoint.node.remaining)
          replacementView
          (forkedFocusTarget (selectedAction program) view.endpoint.node
            forked) ∧
        replacementView.stage = .exposed
          ⟨selectedArgument forked view.endpoint.node.direction,
            selectedArgument forked view.endpoint.node.direction⟩ := by
    cases directionEq : view.endpoint.node.direction with
    | left =>
        have leftNode : view.endpoint.node.left =
            .node childLeft childRight := by
          simpa [selectedTree, directionEq] using selectedNode
        let replacementView :=
          RootResetDispatcherSelectedHandoff.leftNodeView
            (selectedAction program) childLeft childRight
            view.endpoint.node.right nextDirection remaining forked
        have replacementParsed :=
          RootResetDispatcherSelectedHandoff.parseRouteNode?_selectedTarget_left_node
            (selectedAction program) childLeft childRight
            view.endpoint.node.right nextDirection remaining forked
        have replacementShape :=
          RootResetWholeDispatcherStages.parseRouteNode?_sound replacementParsed
        refine ⟨replacementView, ?_, ?_⟩
        · simpa [forkedFocusTarget, directionEq, leftNode, remainingEq] using
            replacementShape
        · rfl
    | right =>
        have rightNode : view.endpoint.node.right =
            .node childLeft childRight := by
          simpa [selectedTree, directionEq] using selectedNode
        let replacementView :=
          RootResetDispatcherSelectedHandoff.rightNodeView
            (selectedAction program) view.endpoint.node.left childLeft
            childRight nextDirection remaining forked
        have replacementParsed :=
          RootResetDispatcherSelectedHandoff.parseRouteNode?_selectedTarget_right_node
            (selectedAction program) view.endpoint.node.left childLeft
            childRight nextDirection remaining forked
        have replacementShape :=
          RootResetWholeDispatcherStages.parseRouteNode?_sound replacementParsed
        refine ⟨replacementView, ?_, ?_⟩
        · simpa [forkedFocusTarget, directionEq, rightNode, remainingEq] using
            replacementShape
        · rfl
  obtain ⟨replacementView, replacementShape, replacementStage⟩ :=
    replacementRouteShape
  obtain ⟨targetNode, targetRouteShape, targetNodeStage⟩ :=
    RouteShape.splice_current routeShape replacementShape
  let targetActive :=
    forkedActiveTarget view forked haltField seedAudit continuationAudit
  cases halt with
  | fresh haltAudit =>
      have targetStop :
          parseMarkedLocal? program layout.tree targetActive = none := by
        exact parseMarkedLocal?_fresh_openShell_none program layout.tree
          haltAudit
          (view.endpoint.node.context.plug
            (forkedFocusTarget (selectedAction program) view.endpoint.node
              forked))
          (word view.endpoint.bits) seedAudit view.endpoint.continuation
          continuationAudit
      obtain ⟨targetContext, targetHistory, targetPrefix, headers,
        targetAddress⟩ :=
        rewrap_marked_prefix wholeShape.markedPrefix targetStop
      have targetPhase : view.endpoint.phase =
          RootResetWholeStageClassifier.historyPhase program targetHistory := by
        rw [wholeShape.activeShape.phase_eq]
        simp only [RootResetWholeStageClassifier.historyPhase]
        rw [headers]
      let targetEndpoint : RootResetWholeDispatcherStages.ActiveView program :=
        { view.endpoint with node := targetNode }
      have targetActiveShape :
          RootResetWholeDispatcherStages.ActiveShape program layout
            targetHistory targetEndpoint targetActive := by
        refine .intro (freshHField haltAudit)
          (view.endpoint.node.context.plug
            (forkedFocusTarget (selectedAction program) view.endpoint.node
              forked))
          seedAudit continuationAudit (.fresh haltAudit) ?_ ?_ ?_
          targetRouteShape ?_
        · exact targetPhase
        · exact wholeShape.activeShape.frontBit_eq
        · exact wholeShape.activeShape.route_eq
        · rfl
      let targetView : RootResetWholeDispatcherStages.View program :=
        ⟨targetActive, targetContext, targetHistory, targetEndpoint⟩
      have targetWholeShape :
          RootResetWholeDispatcherStages.WholeShape program layout targetView
            (forkedWholeTarget view forked (freshHField haltAudit) seedAudit
              continuationAudit) := by
        refine ⟨?_, targetActiveShape⟩
        simpa [targetView, targetActive, forkedWholeTarget] using targetPrefix
      refine ⟨freshHField haltAudit, seedAudit, continuationAudit, targetView,
        .fresh haltAudit, ?_,
        RootResetWholeDispatcherStages.parse?_complete targetWholeShape, ?_⟩
      · exact parsedForked_contracts_target parsed stageEq routeShape
          activeSource
      · change targetNode.stage = .exposed
          ⟨selectedArgument forked view.endpoint.node.direction,
            selectedArgument forked view.endpoint.node.direction⟩
        exact targetNodeStage.trans replacementStage

/-! ## Leaf handoff -/

/-- Dispatcher field after the selected child reaches an action leaf. -/
def activatedDispatcherTarget
    {program : CTS.Program}
    (view : RootResetWholeDispatcherStages.View program)
    (forked : RootResetDispatcherNodeStages.ForkedView) : Term :=
  view.endpoint.node.context.plug
    (forkedFocusTarget (selectedAction program) view.endpoint.node forked)

/--
When the selected child is a leaf, the exact whole target retains a canonical
marked prefix and fresh shell.  The root-relative dispatcher field parses as
the complete activated route for the syntax-derived phase, bit, and path.
-/
theorem parsedForked_selectedLeaf_exact_handoff
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {view : RootResetWholeDispatcherStages.View program}
    {forked : RootResetDispatcherNodeStages.ForkedView}
    {leafLabel : ActionLabel program}
    (parsed : RootResetWholeDispatcherStages.parse? program layout term =
      some view)
    (stageEq : view.stage = .forked forked)
    (selectedLeaf : selectedTree view.endpoint.node = .leaf leafLabel)
    (remainingEq : view.endpoint.node.remaining = []) :
    ∃ haltAudit seedAudit continuationAudit targetContext targetHistory,
      term.contractAt? view.redexAddress =
        some (forkedWholeTarget view forked (freshHField haltAudit) seedAudit
          continuationAudit) ∧
      MarkedPrefix program layout.tree
          (forkedWholeTarget view forked (freshHField haltAudit) seedAudit
            continuationAudit)
          (forkedActiveTarget view forked (freshHField haltAudit) seedAudit
            continuationAudit)
          targetContext targetHistory ∧
      leafLabel = view.label ∧
      DispatchParser.parseRouteDetailed (selectedAction program) layout.tree
          (activatedDispatcherTarget view forked) =
        some
          ⟨view.route, view.label,
            .app (selectedAction program view.label)
              (selectedArgument forked view.endpoint.node.direction)⟩ ∧
      (forkedWholeTarget view forked (freshHField haltAudit) seedAudit
          continuationAudit).subterm?
          (RootResetSelectorContract.contextAddress targetContext ++
            RootResetWholeDispatcherStages.shellDispatcherAddress) =
        some (activatedDispatcherTarget view forked) := by
  have wholeShape := RootResetWholeDispatcherStages.parse?_sound parsed
  rcases wholeShape.activeShape.source_eq with
    ⟨haltField, dispatcherTerm, seedAudit, continuationAudit, halt,
      routeShape, activeSource⟩
  have localActivated : RouteGrammar.ActivatedRoute (selectedAction program)
      (.node view.endpoint.node.left view.endpoint.node.right)
      (view.endpoint.node.direction :: view.endpoint.node.remaining)
      leafLabel
      (.app (selectedAction program leafLabel)
        (selectedArgument forked view.endpoint.node.direction))
      (forkedFocusTarget (selectedAction program) view.endpoint.node
        forked) := by
    cases directionEq : view.endpoint.node.direction with
    | left =>
        have leftLeaf : view.endpoint.node.left = .leaf leafLabel := by
          simpa [selectedTree, directionEq] using selectedLeaf
        have localParsed :=
          RootResetDispatcherSelectedHandoff.parseRouteDetailed_selectedTarget_left_leaf
            (selectedAction program) leafLabel view.endpoint.node.right forked
        have localShape := DispatchParser.parseRouteDetailed_sound localParsed
        simpa [forkedFocusTarget, selectedArgument, directionEq, leftLeaf,
          remainingEq] using localShape
    | right =>
        have rightLeaf : view.endpoint.node.right = .leaf leafLabel := by
          simpa [selectedTree, directionEq] using selectedLeaf
        have localParsed :=
          RootResetDispatcherSelectedHandoff.parseRouteDetailed_selectedTarget_right_leaf
            (selectedAction program) leafLabel view.endpoint.node.left forked
        have localShape := DispatchParser.parseRouteDetailed_sound localParsed
        simpa [forkedFocusTarget, selectedArgument, directionEq, rightLeaf,
          remainingEq] using localShape
  have activatedShape := RouteShape.splice_activated routeShape localActivated
  have labelEq : leafLabel = view.label :=
    activatedShape.hasRoute.deterministic
      (RootResetWholeDispatcherStages.parse?_route_valid parsed)
  have activatedParsed :
      DispatchParser.parseRouteDetailed (selectedAction program) layout.tree
          (activatedDispatcherTarget view forked) =
        some
          ⟨view.route, view.label,
            .app (selectedAction program view.label)
              (selectedArgument forked view.endpoint.node.direction)⟩ := by
    subst leafLabel
    exact DispatchParser.parseRouteDetailed_complete activatedShape
  cases halt with
  | fresh haltAudit =>
      let targetActive := forkedActiveTarget view forked
        (freshHField haltAudit) seedAudit continuationAudit
      have targetStop :
          parseMarkedLocal? program layout.tree targetActive = none := by
        exact parseMarkedLocal?_fresh_openShell_none program layout.tree
          haltAudit (activatedDispatcherTarget view forked)
          (word view.endpoint.bits) seedAudit view.endpoint.continuation
          continuationAudit
      obtain ⟨targetContext, targetHistory, targetPrefix, headers,
        targetAddress⟩ :=
        rewrap_marked_prefix wholeShape.markedPrefix targetStop
      have exactContracts := parsedForked_contracts_target parsed stageEq
        routeShape activeSource
      have dispatcherSubtermActive :
          targetActive.subterm?
              RootResetWholeDispatcherStages.shellDispatcherAddress =
            some (activatedDispatcherTarget view forked) := by
        simp [targetActive, forkedActiveTarget, activatedDispatcherTarget,
          RootResetWholeDispatcherStages.shellDispatcherAddress,
          Term.subterm?]
      have dispatcherSubtermWhole :
          (forkedWholeTarget view forked (freshHField haltAudit) seedAudit
              continuationAudit).subterm?
              (RootResetSelectorContract.contextAddress targetContext ++
                RootResetWholeDispatcherStages.shellDispatcherAddress) =
            some (activatedDispatcherTarget view forked) := by
        change (view.context.plug targetActive).subterm?
            (RootResetSelectorContract.contextAddress targetContext ++
              RootResetWholeDispatcherStages.shellDispatcherAddress) =
          some (activatedDispatcherTarget view forked)
        rw [← targetPrefix.source_eq]
        rw [RootResetWholeStageClassifier.subterm?_plug_contextAddress_append]
        exact dispatcherSubtermActive
      refine ⟨haltAudit, seedAudit, continuationAudit, targetContext,
        targetHistory, exactContracts, ?_, labelEq, activatedParsed,
        dispatcherSubtermWhole⟩
      simpa [targetActive, forkedWholeTarget] using targetPrefix

/-! ## Separate action-to-Push handoff -/

/-- Root-relative selected-action address after the leaf target is reparsed. -/
def leafActionAddress
    {program : CTS.Program}
    (targetContext : Context)
    (view : RootResetWholeDispatcherStages.View program) : Address :=
  RootResetSelectorContract.contextAddress targetContext ++
    (RootResetWholeDispatcherStages.shellDispatcherAddress ++
      routeResponseAddress view.route)

/--
A nonempty selected action performs one additional contraction to the first
Push row.  The source is the exact leaf target, and the Push target reparses
from the whole bare root with a newly retargeted marked history.
-/
theorem parsedForked_selectedLeaf_nonempty_action_to_firstPush
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {view : RootResetWholeDispatcherStages.View program}
    {forked : RootResetDispatcherNodeStages.ForkedView}
    {bit : Bool} {rest : List Bool}
    (parsed : RootResetWholeDispatcherStages.parse? program layout term =
      some view)
    (stageEq : view.stage = .forked forked)
    (selectedLeaf : selectedTree view.endpoint.node = .leaf view.label)
    (remainingEq : view.endpoint.node.remaining = [])
    (emitted : PrimitiveLocalResponse.emitted program view.label =
      bit :: rest) :
    ∃ haltAudit seedAudit continuationAudit leafContext leafHistory
        pushDispatcher pushActive pushContext pushHistory pushView,
      term.contractAt? view.redexAddress =
        some (forkedWholeTarget view forked (freshHField haltAudit) seedAudit
          continuationAudit) ∧
      MarkedPrefix program layout.tree
          (forkedWholeTarget view forked (freshHField haltAudit) seedAudit
            continuationAudit)
          (forkedActiveTarget view forked (freshHField haltAudit) seedAudit
            continuationAudit)
          leafContext leafHistory ∧
      (forkedWholeTarget view forked (freshHField haltAudit) seedAudit
          continuationAudit).contractAt? (leafActionAddress leafContext view) =
        some (leafContext.plug pushActive) ∧
      pushActive = CheckpointDecoder.openShell (freshHField haltAudit)
        pushDispatcher (word view.endpoint.bits) seedAudit
        view.endpoint.continuation continuationAudit ∧
      MarkedPrefix program layout.tree (leafContext.plug pushActive) pushActive
        pushContext pushHistory ∧
      RootResetWholeAppenderStages.parse? program layout.tree
          (leafContext.plug pushActive) = some pushView ∧
      pushView.stage = .first ∧
      pushView.position = 0 ∧
      pushView.label = view.label := by
  obtain ⟨haltAudit, seedAudit, continuationAudit, leafContext, leafHistory,
      leafContracts, leafPrefix, _labelEq, routeParsed, _dispatcherSubterm⟩ :=
    parsedForked_selectedLeaf_exact_handoff parsed stageEq selectedLeaf
      remainingEq
  have activatedShape := DispatchParser.parseRouteDetailed_sound routeParsed
  let carrier := selectedArgument forked view.endpoint.node.direction
  have responseRootContracts :
      (Term.app (selectedAction program view.label) carrier).contractRoot? =
        some (RootResetAppenderStages.firstRow bit rest carrier carrier) := by
    exact RootResetDispatcherSelectedHandoff.selectedAction_nonempty_contractRoot?_firstRow
      program view.label carrier bit rest emitted
  have responseContracts :
      (Term.app (selectedAction program view.label) carrier).contractAt?
          ([] : Address) =
        some (RootResetAppenderStages.firstRow bit rest carrier carrier) := by
    unfold Term.contractAt?
    rw [Term.subterm?_root]
    simp only
    rw [responseRootContracts]
    rfl
  obtain ⟨pushDispatcher, dispatcherContractsRaw, pushRouteShape⟩ :=
    RootResetResponseBoundaryStages.activatedRoute_contractResponse
      activatedShape responseContracts
  have dispatcherContracts :
      (activatedDispatcherTarget view forked).contractAt?
          (routeResponseAddress view.route) = some pushDispatcher := by
    simpa using dispatcherContractsRaw
  let leafActive := forkedActiveTarget view forked (freshHField haltAudit)
    seedAudit continuationAudit
  let shellContext := shellDispatcherContext (freshHField haltAudit)
    (word view.endpoint.bits) seedAudit view.endpoint.continuation
    continuationAudit
  let pushActive := CheckpointDecoder.openShell (freshHField haltAudit)
    pushDispatcher (word view.endpoint.bits) seedAudit view.endpoint.continuation
    continuationAudit
  have activeActionContractsRaw :=
    RootResetWholeStageClassifier.contractAt?_plug_append shellContext
      (routeResponseAddress view.route) dispatcherContracts
  have activeActionContracts :
      leafActive.contractAt?
          (RootResetWholeDispatcherStages.shellDispatcherAddress ++
            routeResponseAddress view.route) = some pushActive := by
    simpa [leafActive, shellContext, pushActive, forkedActiveTarget,
      activatedDispatcherTarget] using activeActionContractsRaw
  have wholeActionContractsRaw :=
    RootResetWholeStageClassifier.contractAt?_plug_append leafContext
      (RootResetWholeDispatcherStages.shellDispatcherAddress ++
        routeResponseAddress view.route) activeActionContracts
  have wholeActionContracts :
      (forkedWholeTarget view forked (freshHField haltAudit) seedAudit
          continuationAudit).contractAt? (leafActionAddress leafContext view) =
        some (leafContext.plug pushActive) := by
    rw [leafPrefix.source_eq] at wholeActionContractsRaw
    simpa [leafActionAddress] using wholeActionContractsRaw
  have pushStop : parseMarkedLocal? program layout.tree pushActive = none := by
    exact parseMarkedLocal?_fresh_openShell_none program layout.tree haltAudit
      pushDispatcher (word view.endpoint.bits) seedAudit
      view.endpoint.continuation continuationAudit
  obtain ⟨pushContext, pushHistory, pushPrefix, _pushHeaders,
      _pushContextAddress⟩ := rewrap_marked_prefix leafPrefix pushStop
  let pushRow : RootResetWholeAppenderStages.Row :=
    .first 0 bit rest carrier carrier []
  have pushRowValid : pushRow.Valid
      (PrimitiveLocalResponse.emitted program view.label) := by
    exact ⟨by simpa [pushRow] using emitted, rfl⟩
  let pushEndpoint : RootResetWholeAppenderStages.ActiveView program :=
    ⟨view.endpoint.bits, view.endpoint.continuation, view.route, view.label,
      pushRow⟩
  have pushActiveShape : RootResetWholeAppenderStages.ActiveShape program
      layout.tree pushEndpoint pushActive := by
    refine .intro (freshHField haltAudit) pushDispatcher seedAudit
      continuationAudit (.fresh haltAudit) ?_ pushRowValid ?_
    · simpa [pushRow] using! pushRouteShape
    · rfl
  let pushView : RootResetWholeAppenderStages.View program :=
    ⟨pushActive, pushContext, pushHistory, pushEndpoint⟩
  have pushWholeShape : RootResetWholeAppenderStages.WholeShape program
      layout.tree pushView (leafContext.plug pushActive) :=
    ⟨pushPrefix, pushActiveShape⟩
  refine ⟨haltAudit, seedAudit, continuationAudit, leafContext, leafHistory,
    pushDispatcher, pushActive, pushContext, pushHistory, pushView,
    leafContracts, leafPrefix, wholeActionContracts, rfl, pushPrefix,
    RootResetWholeAppenderStages.parse?_complete pushWholeShape, ?_, ?_, ?_⟩
  · rfl
  · rfl
  · rfl

end PureSFormal.Research.RootResetWholeDispatcherSelectedHandoff
