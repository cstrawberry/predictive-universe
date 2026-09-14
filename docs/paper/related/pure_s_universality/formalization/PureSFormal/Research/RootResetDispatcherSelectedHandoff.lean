import PureSFormal.Research.RootResetWholeDispatcherStages
import PureSFormal.Research.RootResetWholeAppenderStages

/-!
# Exact selected-child dispatcher handoff

This module isolates the contraction immediately after a dispatcher node has
forked.  The selected direction is an explicit premise; it is not recovered
from the direction-erased forked row.  The source parser leaves the outer
audit and the two child arguments independent.

If the selected child is another node, the exact target is accepted as its
exposed row by the route-node parser.  If it is a leaf, the exact target is
accepted by the detailed activated-route parser.  A nonempty selected action
requires one further contraction before the appender parser accepts the first
Push row; that separate handoff is also stated exactly.

These are syntax-local statements.  They do not assert scheduler
reachability, selected-step closure, or global CTS simulation.
-/

namespace PureSFormal.Research.RootResetDispatcherSelectedHandoff

open PureSFormal.PureS

/-- The whole local node row after contracting the chosen compiled child. -/
def selectedTarget {Label : Type u} (encode : Label → Term)
    (left right : Dispatcher.Tree Label)
    (view : RootResetDispatcherNodeStages.ForkedView) :
    Direction → Term
  | .left =>
      chosen view.outerAudit
        (.app (RootResetDispatcherNodeStages.firstActivation encode left
            view.leftArgument)
          (RouteGrammar.compiledCall encode right view.rightArgument))
  | .right =>
      chosen view.outerAudit
        (.app (RouteGrammar.compiledCall encode left view.leftArgument)
          (RootResetDispatcherNodeStages.firstActivation encode right
            view.rightArgument))

/--
Successful forked-row parsing and an explicit selected direction determine
the exact contraction target.  No equality is assumed between any returned
opaque fields.
-/
theorem parseForked?_selected_contracts_exact
    {Label : Type u} {encode : Label → Term}
    {left right : Dispatcher.Tree Label} {term : Term}
    {view : RootResetDispatcherNodeStages.ForkedView}
    (parsed : RootResetDispatcherNodeStages.parseForked? encode left right term =
      some view)
    (direction : Direction) :
    term.contractAt?
        (RootResetDispatcherNodeStages.forkedChildAddress direction) =
      some (selectedTarget encode left right view direction) := by
  rw [RootResetDispatcherNodeStages.parseForked?_sound parsed]
  cases direction with
  | left =>
      cases left <;> rfl
  | right =>
      cases right <;> rfl

/-- Exact next route view after selecting a left child which is a node. -/
def leftNodeView {Label : Type u} (encode : Label → Term)
    (childLeft childRight dormant : Dispatcher.Tree Label)
    (nextDirection : Direction) (remaining : Dispatcher.Route)
    (view : RootResetDispatcherNodeStages.ForkedView) :
    RootResetWholeDispatcherStages.RouteView Label :=
  (RootResetWholeDispatcherStages.RouteView.root childLeft childRight
      nextDirection remaining
      (.exposed ⟨view.leftArgument, view.leftArgument⟩)).wrapLeft
    view.outerAudit
    (RouteGrammar.compiledCall encode dormant view.rightArgument)

/-- Exact next route view after selecting a right child which is a node. -/
def rightNodeView {Label : Type u} (encode : Label → Term)
    (dormant childLeft childRight : Dispatcher.Tree Label)
    (nextDirection : Direction) (remaining : Dispatcher.Route)
    (view : RootResetDispatcherNodeStages.ForkedView) :
    RootResetWholeDispatcherStages.RouteView Label :=
  (RootResetWholeDispatcherStages.RouteView.root childLeft childRight
      nextDirection remaining
      (.exposed ⟨view.rightArgument, view.rightArgument⟩)).wrapRight
    view.outerAudit
    (RouteGrammar.compiledCall encode dormant view.leftArgument)

/-- A selected left node target is parsed as that child's exposed row. -/
theorem parseRouteNode?_selectedTarget_left_node
    {Label : Type u} (encode : Label → Term)
    (childLeft childRight dormant : Dispatcher.Tree Label)
    (nextDirection : Direction) (remaining : Dispatcher.Route)
    (view : RootResetDispatcherNodeStages.ForkedView) :
    RootResetWholeDispatcherStages.parseRouteNode? encode
        (.node (.node childLeft childRight) dormant)
        (.left :: nextDirection :: remaining)
        (selectedTarget encode (.node childLeft childRight) dormant view .left) =
      some (leftNodeView encode childLeft childRight dormant nextDirection
        remaining view) := by
  apply RootResetWholeDispatcherStages.parseRouteNode?_complete
  simpa [leftNodeView, selectedTarget,
    RootResetDispatcherNodeStages.firstActivation,
    RootResetWholeDispatcherStages.stageTerm] using!
    (RootResetWholeDispatcherStages.RouteShape.left view.outerAudit
      view.rightArgument
      (RootResetWholeDispatcherStages.RouteShape.root childLeft childRight
        nextDirection
        remaining
        (.exposed ⟨view.leftArgument, view.leftArgument⟩)))

/-- A selected right node target is parsed as that child's exposed row. -/
theorem parseRouteNode?_selectedTarget_right_node
    {Label : Type u} (encode : Label → Term)
    (dormant childLeft childRight : Dispatcher.Tree Label)
    (nextDirection : Direction) (remaining : Dispatcher.Route)
    (view : RootResetDispatcherNodeStages.ForkedView) :
    RootResetWholeDispatcherStages.parseRouteNode? encode
        (.node dormant (.node childLeft childRight))
        (.right :: nextDirection :: remaining)
        (selectedTarget encode dormant (.node childLeft childRight) view .right) =
      some (rightNodeView encode dormant childLeft childRight nextDirection
        remaining view) := by
  apply RootResetWholeDispatcherStages.parseRouteNode?_complete
  simpa [rightNodeView, selectedTarget,
    RootResetDispatcherNodeStages.firstActivation,
    RootResetWholeDispatcherStages.stageTerm] using!
    (RootResetWholeDispatcherStages.RouteShape.right view.outerAudit
      view.leftArgument
      (RootResetWholeDispatcherStages.RouteShape.root childLeft childRight
        nextDirection
        remaining
        (.exposed ⟨view.rightArgument, view.rightArgument⟩)))

/-- Parsed forked source, exact left-child contraction, and next-node parse. -/
theorem parsedForked_left_node_exact_handoff
    {Label : Type u} (encode : Label → Term)
    (childLeft childRight dormant : Dispatcher.Tree Label)
    (nextDirection : Direction) (remaining : Dispatcher.Route)
    {term : Term} {view : RootResetDispatcherNodeStages.ForkedView}
    (parsed : RootResetDispatcherNodeStages.parseForked? encode
      (.node childLeft childRight) dormant term = some view) :
    term.contractAt?
        (RootResetDispatcherNodeStages.forkedChildAddress .left) =
        some (selectedTarget encode (.node childLeft childRight) dormant view
          .left) ∧
      RootResetWholeDispatcherStages.parseRouteNode? encode
          (.node (.node childLeft childRight) dormant)
          (.left :: nextDirection :: remaining)
          (selectedTarget encode (.node childLeft childRight) dormant view
            .left) =
        some (leftNodeView encode childLeft childRight dormant nextDirection
          remaining view) :=
  ⟨parseForked?_selected_contracts_exact parsed .left,
    parseRouteNode?_selectedTarget_left_node encode childLeft childRight dormant
      nextDirection remaining view⟩

/-- Parsed forked source, exact right-child contraction, and next-node parse. -/
theorem parsedForked_right_node_exact_handoff
    {Label : Type u} (encode : Label → Term)
    (dormant childLeft childRight : Dispatcher.Tree Label)
    (nextDirection : Direction) (remaining : Dispatcher.Route)
    {term : Term} {view : RootResetDispatcherNodeStages.ForkedView}
    (parsed : RootResetDispatcherNodeStages.parseForked? encode dormant
      (.node childLeft childRight) term = some view) :
    term.contractAt?
        (RootResetDispatcherNodeStages.forkedChildAddress .right) =
        some (selectedTarget encode dormant (.node childLeft childRight) view
          .right) ∧
      RootResetWholeDispatcherStages.parseRouteNode? encode
          (.node dormant (.node childLeft childRight))
          (.right :: nextDirection :: remaining)
          (selectedTarget encode dormant (.node childLeft childRight) view
            .right) =
        some (rightNodeView encode dormant childLeft childRight nextDirection
          remaining view) :=
  ⟨parseForked?_selected_contracts_exact parsed .right,
    parseRouteNode?_selectedTarget_right_node encode dormant childLeft childRight
      nextDirection remaining view⟩

/-- A selected left leaf target recovers its exact route, label, and response. -/
theorem parseRouteDetailed_selectedTarget_left_leaf
    {Label : Type u} (encode : Label → Term) (label : Label)
    (dormant : Dispatcher.Tree Label)
    (view : RootResetDispatcherNodeStages.ForkedView) :
    DispatchParser.parseRouteDetailed encode (.node (.leaf label) dormant)
        (selectedTarget encode (.leaf label) dormant view .left) =
      some ⟨[.left], label, .app (encode label) view.leftArgument⟩ := by
  apply DispatchParser.parseRouteDetailed_complete
  simpa [selectedTarget, RootResetDispatcherNodeStages.firstActivation] using!
    (RouteGrammar.ActivatedRoute.left view.outerAudit view.rightArgument
      (RouteGrammar.ActivatedRoute.leaf label view.leftArgument
        (.app (encode label) view.leftArgument)))

/-- A selected right leaf target recovers its exact route, label, and response. -/
theorem parseRouteDetailed_selectedTarget_right_leaf
    {Label : Type u} (encode : Label → Term) (label : Label)
    (dormant : Dispatcher.Tree Label)
    (view : RootResetDispatcherNodeStages.ForkedView) :
    DispatchParser.parseRouteDetailed encode (.node dormant (.leaf label))
        (selectedTarget encode dormant (.leaf label) view .right) =
      some ⟨[.right], label, .app (encode label) view.rightArgument⟩ := by
  apply DispatchParser.parseRouteDetailed_complete
  simpa [selectedTarget, RootResetDispatcherNodeStages.firstActivation] using!
    (RouteGrammar.ActivatedRoute.right view.outerAudit view.leftArgument
      (RouteGrammar.ActivatedRoute.leaf label view.rightArgument
        (.app (encode label) view.rightArgument)))

/-- Parsed forked source, exact left-leaf contraction, and leaf-response parse. -/
theorem parsedForked_left_leaf_exact_handoff
    {Label : Type u} (encode : Label → Term) (label : Label)
    (dormant : Dispatcher.Tree Label) {term : Term}
    {view : RootResetDispatcherNodeStages.ForkedView}
    (parsed : RootResetDispatcherNodeStages.parseForked? encode (.leaf label)
      dormant term = some view) :
    term.contractAt?
        (RootResetDispatcherNodeStages.forkedChildAddress .left) =
        some (selectedTarget encode (.leaf label) dormant view .left) ∧
      DispatchParser.parseRouteDetailed encode (.node (.leaf label) dormant)
          (selectedTarget encode (.leaf label) dormant view .left) =
        some ⟨[.left], label, .app (encode label) view.leftArgument⟩ :=
  ⟨parseForked?_selected_contracts_exact parsed .left,
    parseRouteDetailed_selectedTarget_left_leaf encode label dormant view⟩

/-- Parsed forked source, exact right-leaf contraction, and leaf-response parse. -/
theorem parsedForked_right_leaf_exact_handoff
    {Label : Type u} (encode : Label → Term) (label : Label)
    (dormant : Dispatcher.Tree Label) {term : Term}
    {view : RootResetDispatcherNodeStages.ForkedView}
    (parsed : RootResetDispatcherNodeStages.parseForked? encode dormant
      (.leaf label) term = some view) :
    term.contractAt?
        (RootResetDispatcherNodeStages.forkedChildAddress .right) =
        some (selectedTarget encode dormant (.leaf label) view .right) ∧
      DispatchParser.parseRouteDetailed encode (.node dormant (.leaf label))
          (selectedTarget encode dormant (.leaf label) view .right) =
        some ⟨[.right], label, .app (encode label) view.rightArgument⟩ :=
  ⟨parseForked?_selected_contracts_exact parsed .right,
    parseRouteDetailed_selectedTarget_right_leaf encode label dormant view⟩

/--
A nonempty selected leaf action contracts once to the exact first Push row.
The nonempty emitted-word equality is the necessary explicit premise.
-/
theorem selectedAction_nonempty_contractRoot?_firstRow
    (program : CTS.Program) (label : ActionLabel program)
    (carrier : Term) (bit : Bool) (rest : List Bool)
    (emitted : PrimitiveLocalResponse.emitted program label = bit :: rest) :
    (Term.app (selectedAction program label) carrier).contractRoot? =
      some (RootResetAppenderStages.firstRow bit rest carrier carrier) := by
  rw [PrimitiveLocalResponse.selectedAction_eq_appender, emitted]
  rfl

/-- The exact post-contraction action term is accepted as Push position zero. -/
theorem parseRow?_selectedAction_nonempty_first
    (program : CTS.Program) (label : ActionLabel program)
    (carrier : Term) (bit : Bool) (rest : List Bool)
    (emitted : PrimitiveLocalResponse.emitted program label = bit :: rest) :
    RootResetWholeAppenderStages.parseRow? program label
        (RootResetAppenderStages.firstRow bit rest carrier carrier) =
      some (.first 0 bit rest carrier carrier []) := by
  have valid : RootResetWholeAppenderStages.Row.Valid
      (PrimitiveLocalResponse.emitted program label)
      (.first 0 bit rest carrier carrier []) :=
    ⟨by simpa using emitted, rfl⟩
  simpa [RootResetWholeAppenderStages.Row.term] using
    (RootResetWholeAppenderStages.parseRow?_complete valid)

/-- One exact action contraction and its immediate first-Push parser recovery. -/
theorem selectedAction_nonempty_exact_appender_handoff
    (program : CTS.Program) (label : ActionLabel program)
    (carrier : Term) (bit : Bool) (rest : List Bool)
    (emitted : PrimitiveLocalResponse.emitted program label = bit :: rest) :
    (Term.app (selectedAction program label) carrier).contractRoot? =
        some (RootResetAppenderStages.firstRow bit rest carrier carrier) ∧
      RootResetWholeAppenderStages.parseRow? program label
          (RootResetAppenderStages.firstRow bit rest carrier carrier) =
        some (.first 0 bit rest carrier carrier []) :=
  ⟨selectedAction_nonempty_contractRoot?_firstRow program label carrier bit
      rest emitted,
    parseRow?_selectedAction_nonempty_first program label carrier bit rest
      emitted⟩

/--
The generated fresh Local containing that exact first Push row is recovered by
the whole active-shell appender parser.  Shell and route audit arguments stay
independent.
-/
theorem parseActive?_selectedAction_nonempty_first
    (program : CTS.Program)
    {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program}
    (path : Dispatcher.HasRoute tree route label)
    (bits : List Bool) (continuation haltAudit seedAudit continuationAudit : Term)
    (carrier : Term) (bit : Bool) (rest : List Bool)
    (emitted : PrimitiveLocalResponse.emitted program label = bit :: rest) :
    RootResetWholeAppenderStages.parseActive? program tree
        (RootResetWholeAppenderStages.generatedActive tree bits continuation
          haltAudit
          seedAudit continuationAudit route carrier
          (RootResetAppenderStages.firstRow bit rest carrier carrier)) =
      some ⟨bits, continuation, route, label,
        .first 0 bit rest carrier carrier []⟩ := by
  simpa using
    (RootResetWholeAppenderStages.parseActive?_generated_first program path bits
      continuation
      haltAudit seedAudit continuationAudit carrier 0 bit rest carrier carrier
      [] rfl (by simpa using emitted))

end PureSFormal.Research.RootResetDispatcherSelectedHandoff
