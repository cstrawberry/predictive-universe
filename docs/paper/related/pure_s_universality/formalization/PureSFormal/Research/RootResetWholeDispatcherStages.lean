import PureSFormal.Research.RootResetDispatcherNodeStages
import PureSFormal.Research.RootResetWholeStageClassifier

/-!
# Whole-term placement of dispatcher-node half rows

This module lifts the local exposed/forked dispatcher-node parser through the
selected ancestors of the intended dispatcher route, the dispatcher field of
a fresh Local shell, and the canonical outer prefix of completed marked
Locals.  The public parser receives only the fixed program/dispatcher and the
current bare term.

The intended route is reconstructed from syntax.  Its phase is the successor
phase determined by the marked history, and its bit is the head of the literal
word in the fresh shell.  In particular, the direction chosen after a forked
row is not inferred from that row: exposed left and right forks have identical
syntax.  The fixed dispatcher's route for the reconstructed label supplies the
direction.

Audit payloads and call arguments are independent fields: no equality test
compares one payload hole with another.  Descent-first disambiguation may
structurally probe a fork argument for fixed compiled-call syntax.  The parser
also checks the fresh halt prefix, literal word, fixed dispatcher codes,
selected-ancestor layout, and one exposed or forked node row.  The conclusions
below concern these registered dispatcher rows.  Reachable-stage closure and
a complete walker require their separate theorems.
-/

namespace PureSFormal.Research.RootResetWholeDispatcherStages

open PureSFormal.PureS
open RootResetReachableStageGrammar

namespace Local

abbrev StageView := RootResetDispatcherNodeStages.StageView
abbrev ExposedView := RootResetDispatcherNodeStages.ExposedView
abbrev ForkedView := RootResetDispatcherNodeStages.ForkedView

end Local

/-! ## One current node below selected route ancestors -/

/-- Exact term represented by a local dispatcher-node stage. -/
def stageTerm {Label : Type u} (encode : Label → Term)
    (left right : Dispatcher.Tree Label) : Local.StageView → Term
  | .exposed view =>
      RootResetDispatcherNodeStages.exposedTerm encode left right view
  | .forked view =>
      RootResetDispatcherNodeStages.forkedTerm encode left right view

/-- Context extending a hole through one already-selected left ancestor. -/
def selectedLeftContext (outerAudit dormant : Term) (inner : Context) : Context :=
  .appRight (.app .s outerAudit) (.appLeft inner dormant)

/-- Context extending a hole through one already-selected right ancestor. -/
def selectedRightContext (outerAudit dormant : Term) (inner : Context) : Context :=
  .appRight (.app .s outerAudit) (.appRight dormant inner)

/-- Data recovered for the unique current internal node on an intended route. -/
structure RouteView (Label : Type u) where
  /-- Already selected directions above the current node. -/
  routePrefix : Dispatcher.Route
  /-- Exact dispatcher-root context whose hole is the current node row. -/
  context : Context
  left : Dispatcher.Tree Label
  right : Dispatcher.Tree Label
  /-- Intended direction at the current node, recovered from the outer route. -/
  direction : Direction
  /-- Intended route strictly below the current node. -/
  remaining : Dispatcher.Route
  stage : Local.StageView
  deriving Repr

/-- Current node-row term reconstructed from a route view. -/
def RouteView.focusTerm {Label : Type u} (encode : Label → Term)
    (view : RouteView Label) : Term :=
  stageTerm encode view.left view.right view.stage

/-- A route view located at the dispatcher root. -/
def RouteView.root {Label : Type u}
    (left right : Dispatcher.Tree Label) (direction : Direction)
    (remaining : Dispatcher.Route) (stage : Local.StageView) : RouteView Label :=
  ⟨[], .hole, left, right, direction, remaining, stage⟩

/-- Add one already-selected left ancestor to a route view. -/
def RouteView.wrapLeft {Label : Type u}
    (outerAudit dormant : Term) (view : RouteView Label) : RouteView Label :=
  { view with
    routePrefix := .left :: view.routePrefix
    context := selectedLeftContext outerAudit dormant view.context }

/-- Add one already-selected right ancestor to a route view. -/
def RouteView.wrapRight {Label : Type u}
    (outerAudit dormant : Term) (view : RouteView Label) : RouteView Label :=
  { view with
    routePrefix := .right :: view.routePrefix
    context := selectedRightContext outerAudit dormant view.context }

/-- Follow a prefix to its fixed-code dispatcher subtree. -/
def treeAt? {Label : Type u} :
    Dispatcher.Tree Label → Dispatcher.Route → Option (Dispatcher.Tree Label)
  | tree, [] => some tree
  | .leaf _, _ :: _ => none
  | .node left _, .left :: rest => treeAt? left rest
  | .node _ right, .right :: rest => treeAt? right rest

/--
Declarative selected-prefix grammar for an exposed or forked current node.
Every ancestor audit and dormant-call argument is an independent constructor
field.
-/
inductive RouteShape {Label : Type u} (encode : Label → Term) :
    Dispatcher.Tree Label → Dispatcher.Route → RouteView Label → Term → Prop where
  | root
      (left right : Dispatcher.Tree Label) (direction : Direction)
      (remaining : Dispatcher.Route) (stage : Local.StageView) :
      RouteShape encode (.node left right) (direction :: remaining)
        (RouteView.root left right direction remaining stage)
        (stageTerm encode left right stage)
  | left
      {left right : Dispatcher.Tree Label} {remaining : Dispatcher.Route}
      {view : RouteView Label} {term : Term}
      (outerAudit dormantAudit : Term)
      (inner : RouteShape encode left remaining view term) :
      RouteShape encode (.node left right) (.left :: remaining)
        (view.wrapLeft outerAudit
          (RouteGrammar.compiledCall encode right dormantAudit))
        (RouteGrammar.selectedLeft outerAudit term
          (RouteGrammar.compiledCall encode right dormantAudit))
  | right
      {left right : Dispatcher.Tree Label} {remaining : Dispatcher.Route}
      {view : RouteView Label} {term : Term}
      (outerAudit dormantAudit : Term)
      (inner : RouteShape encode right remaining view term) :
      RouteShape encode (.node left right) (.right :: remaining)
        (view.wrapRight outerAudit
          (RouteGrammar.compiledCall encode left dormantAudit))
        (RouteGrammar.selectedRight outerAudit
          (RouteGrammar.compiledCall encode left dormantAudit) term)

namespace RouteShape

/-- A route-stage context literally rebuilds its dispatcher-field source. -/
theorem source_eq
    {Label : Type u} {encode : Label → Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route}
    {view : RouteView Label} {term : Term}
    (shape : RouteShape encode tree route view term) :
    view.context.plug (view.focusTerm encode) = term := by
  induction shape with
  | root => rfl
  | @left left right remaining innerView innerTerm outerAudit dormantAudit
      inner ih =>
      change innerView.context.plug
        (stageTerm encode innerView.left innerView.right innerView.stage) =
          innerTerm at ih
      simp [RouteView.wrapLeft, RouteView.focusTerm, selectedLeftContext,
        Context.plug, RouteGrammar.selectedLeft, chosen, ih]
  | @right left right remaining innerView innerTerm outerAudit dormantAudit
      inner ih =>
      change innerView.context.plug
        (stageTerm encode innerView.left innerView.right innerView.stage) =
          innerTerm at ih
      simp [RouteView.wrapRight, RouteView.focusTerm, selectedRightContext,
        Context.plug, RouteGrammar.selectedRight, chosen, ih]

/-- The recovered prefix/current direction/remainder is the intended route. -/
theorem route_eq
    {Label : Type u} {encode : Label → Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route}
    {view : RouteView Label} {term : Term}
    (shape : RouteShape encode tree route view term) :
    route = view.routePrefix ++ view.direction :: view.remaining := by
  induction shape with
  | root => rfl
  | left outerAudit dormantAudit inner ih =>
      simpa [RouteView.wrapLeft] using congrArg (List.cons Direction.left) ih
  | right outerAudit dormantAudit inner ih =>
      simpa [RouteView.wrapRight] using congrArg (List.cons Direction.right) ih

/-- The recovered current node is exactly the fixed subtree at its prefix. -/
theorem treeAt?_eq
    {Label : Type u} {encode : Label → Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route}
    {view : RouteView Label} {term : Term}
    (shape : RouteShape encode tree route view term) :
    treeAt? tree view.routePrefix = some (.node view.left view.right) := by
  induction shape with
  | root => rfl
  | left outerAudit dormantAudit inner ih =>
      simpa [RouteView.wrapLeft, treeAt?] using ih
  | right outerAudit dormantAudit inner ih =>
      simpa [RouteView.wrapRight, treeAt?] using ih

end RouteShape

/-! ## Executable route-local parser -/

/-- Classify a node at the current dispatcher root. -/
def parseCurrent? {Label : Type u} (encode : Label → Term)
    (left right : Dispatcher.Tree Label) (direction : Direction)
    (remaining : Dispatcher.Route) (term : Term) : Option (RouteView Label) :=
  match RootResetDispatcherNodeStages.classifyNode? encode left right term with
  | none => none
  | some stage => some (RouteView.root left right direction remaining stage)

/--
Follow already-selected ancestors on the intended route, stopping at the first
registered exposed/forked row.  Descent is attempted before root
classification.  Hence an outer selected ancestor is traversed, while a
forked current row falls back after its compiled selected child contains no
node-stage row.
-/
def parseRouteNode? {Label : Type u} (encode : Label → Term) :
    Dispatcher.Tree Label → Dispatcher.Route → Term → Option (RouteView Label)
  | .leaf _, _, _ => none
  | .node _ _, [], _ =>
      none
  | .node left right, direction :: remaining, term =>
      match RouteParser.unpackSelectedNode? term with
      | none => parseCurrent? encode left right direction remaining term
      | some fields =>
          match direction with
          | .left =>
              match RouteParser.compiledCallAudit? encode right
                  fields.rightChild with
              | none => parseCurrent? encode left right direction remaining term
              | some _dormantAudit =>
                  match parseRouteNode? encode left remaining fields.leftChild with
                  | none =>
                      parseCurrent? encode left right direction remaining term
                  | some inner =>
                      some (inner.wrapLeft fields.audit fields.rightChild)
          | .right =>
              match RouteParser.compiledCallAudit? encode left
                  fields.leftChild with
              | none => parseCurrent? encode left right direction remaining term
              | some _dormantAudit =>
                  match parseRouteNode? encode right remaining
                      fields.rightChild with
                  | none =>
                      parseCurrent? encode left right direction remaining term
                  | some inner =>
                      some (inner.wrapRight fields.audit fields.leftChild)
/-- Current-root success reconstructs its exact local row. -/
theorem parseCurrent?_sound
    {Label : Type u} {encode : Label → Term}
    {left right : Dispatcher.Tree Label} {direction : Direction}
    {remaining : Dispatcher.Route} {term : Term} {view : RouteView Label}
    (h : parseCurrent? encode left right direction remaining term = some view) :
    RouteShape encode (.node left right) (direction :: remaining) view term := by
  unfold parseCurrent? at h
  generalize hstage : RootResetDispatcherNodeStages.classifyNode?
    encode left right term = stageResult at h
  cases stageResult with
  | none => contradiction
  | some stage =>
      have hview := Option.some.inj h
      subst view
      rcases RootResetDispatcherNodeStages.classifyNode?_sound hstage with
        ⟨row, rfl, source⟩ | ⟨row, rfl, source⟩
      · rw [source]
        exact .root left right direction remaining (.exposed row)
      · rw [source]
        exact .root left right direction remaining (.forked row)

/-- A fixed compiled call is never itself an exposed/forked node row. -/
theorem parseRouteNode?_compiledCall_none
    {Label : Type u} (encode : Label → Term)
    (tree : Dispatcher.Tree Label) (route : Dispatcher.Route) (audit : Term) :
    parseRouteNode? encode tree route
        (RouteGrammar.compiledCall encode tree audit) = none := by
  cases tree with
  | leaf label => simp [parseRouteNode?]
  | node left right =>
      cases route with
      | nil => simp [parseRouteNode?]
      | cons direction remaining =>
          cases direction <;>
            simp [parseRouteNode?, parseCurrent?,
              RouteGrammar.compiledCall, compileDispatcher, nodeCode, b,
              RouteParser.unpackSelectedNode?,
              RootResetDispatcherNodeStages.classifyNode?,
              RootResetDispatcherNodeStages.parseExposed?,
              RootResetDispatcherNodeStages.parseForked?]

/-- An `S` applied once cannot be a fixed dispatcher code of head arity two. -/
theorem s_app_ne_compileDispatcher
    {Label : Type u} (encode : Label → Term) (argument : Term)
    (tree : Dispatcher.Tree Label) :
    (.app .s argument : Term) ≠ compileDispatcher encode tree := by
  intro equal
  have arity := congrArg Term.headArity equal
  simp [RootResetDispatcherNodeStages.compileDispatcher_headArity] at arity

/-- Bare `S` cannot be a fixed dispatcher code of head arity two. -/
theorem s_ne_compileDispatcher
    {Label : Type u} (encode : Label → Term)
    (tree : Dispatcher.Tree Label) :
    (.s : Term) ≠ compileDispatcher encode tree := by
  intro equal
  have arity := congrArg Term.headArity equal
  simp [RootResetDispatcherNodeStages.compileDispatcher_headArity] at arity

/-- The fixed term `b` is not a compiled dispatcher call. -/
theorem compiledCallAudit?_b_none
    {Label : Type u} (encode : Label → Term)
    (tree : Dispatcher.Tree Label) :
    RouteParser.compiledCallAudit? encode tree b = none := by
  simp [RouteParser.compiledCallAudit?, b, s_ne_compileDispatcher]

/-- A fixed fork of dispatcher codes is not a compiled dispatcher call. -/
theorem compiledCallAudit?_fork_none
    {Label : Type u} (encode : Label → Term)
    (target left right : Dispatcher.Tree Label) :
    RouteParser.compiledCallAudit? encode target
        (fork (compileDispatcher encode left) (compileDispatcher encode right)) =
      none := by
  simp [RouteParser.compiledCallAudit?, fork, s_app_ne_compileDispatcher]

/-- The fixed term `b` cannot contain a registered node half-row. -/
theorem parseRouteNode?_b_none
    {Label : Type u} (encode : Label → Term)
    (target : Dispatcher.Tree Label) (route : Dispatcher.Route) :
    parseRouteNode? encode target route b = none := by
  cases target with
  | leaf label => simp [parseRouteNode?]
  | node left right =>
      cases route with
      | nil => simp [parseRouteNode?]
      | cons direction remaining =>
          cases direction <;>
            simp [parseRouteNode?, parseCurrent?, b,
              RouteParser.unpackSelectedNode?,
              RootResetDispatcherNodeStages.classifyNode?,
              RootResetDispatcherNodeStages.parseExposed?,
              RootResetDispatcherNodeStages.parseForked?]

/-- A fixed fork of codes is rejected by the local node-row classifier. -/
theorem classifyNode?_forkCodes_none
    {Label : Type u} (encode : Label → Term)
    (targetLeft targetRight left right : Dispatcher.Tree Label) :
    RootResetDispatcherNodeStages.classifyNode? encode targetLeft targetRight
        (fork (compileDispatcher encode left) (compileDispatcher encode right)) =
      none := by
  cases right with
  | leaf label =>
      cases hencode : encode label <;>
        cases targetLeft <;> cases targetRight <;>
          simp [RootResetDispatcherNodeStages.classifyNode?,
            RootResetDispatcherNodeStages.parseExposed?,
            RootResetDispatcherNodeStages.parseForked?,
            fork, compileDispatcher, nodeCode, leafCode, b, hencode,
            s_ne_compileDispatcher, s_app_ne_compileDispatcher]
  | node childLeft childRight =>
      cases targetLeft <;> cases targetRight <;>
        simp [RootResetDispatcherNodeStages.classifyNode?,
          RootResetDispatcherNodeStages.parseExposed?,
          RootResetDispatcherNodeStages.parseForked?,
          fork, compileDispatcher, nodeCode, leafCode, b,
          s_ne_compileDispatcher, s_app_ne_compileDispatcher]

/-- A bare fixed fork of dispatcher codes is not a registered node half-row. -/
theorem parseRouteNode?_forkCodes_none
    {Label : Type u} (encode : Label → Term)
    (target left right : Dispatcher.Tree Label) (route : Dispatcher.Route) :
    parseRouteNode? encode target route
        (fork (compileDispatcher encode left) (compileDispatcher encode right)) =
      none := by
  cases target with
  | leaf label => simp [parseRouteNode?]
  | node targetLeft targetRight =>
      cases route with
      | nil => simp [parseRouteNode?]
      | cons direction remaining =>
          have current : parseCurrent? encode targetLeft targetRight direction
              remaining
              (fork (compileDispatcher encode left)
                (compileDispatcher encode right)) = none := by
            simp [parseCurrent?, classifyNode?_forkCodes_none]
          cases right with
          | leaf label =>
              rw [parseRouteNode?]
              simp only [fork, compileDispatcher, leafCode,
                RouteParser.unpackSelectedNode?]
              cases direction with
              | left =>
                  generalize hdormant : RouteParser.compiledCallAudit? encode
                    targetRight (encode label) = dormant
                  cases dormant <;>
                    simpa [hdormant, parseRouteNode?_b_none, fork,
                      compileDispatcher, leafCode] using current
              | right =>
                  rw [compiledCallAudit?_b_none]
                  simpa [fork, compileDispatcher, leafCode] using current
          | node childLeft childRight =>
              rw [parseRouteNode?]
              simp only [fork, compileDispatcher, nodeCode,
                RouteParser.unpackSelectedNode?]
              cases direction with
              | left =>
                  generalize hdormant : RouteParser.compiledCallAudit? encode
                    targetRight
                      (fork (compileDispatcher encode childLeft)
                        (compileDispatcher encode childRight)) = dormant
                  have hdormant' : RouteParser.compiledCallAudit? encode
                      targetRight
                      (Term.app (Term.app Term.s
                        (compileDispatcher encode childLeft))
                        (compileDispatcher encode childRight)) = dormant := by
                    simpa [fork] using hdormant
                  cases dormant <;>
                    simpa [hdormant', parseRouteNode?_b_none, fork,
                      compileDispatcher, nodeCode] using current
              | right =>
                  rw [compiledCallAudit?_b_none]
                  simpa [fork, compileDispatcher, nodeCode] using current

/-- Every generated exposed row is accepted at the current route root. -/
@[simp]
theorem parseRouteNode?_root_exposed
    {Label : Type u} (encode : Label → Term)
    (left right : Dispatcher.Tree Label) (direction : Direction)
    (remaining : Dispatcher.Route) (view : Local.ExposedView) :
    parseRouteNode? encode (.node left right) (direction :: remaining)
        (RootResetDispatcherNodeStages.exposedTerm encode left right view) =
      some (RouteView.root left right direction remaining (.exposed view)) := by
  have current : parseCurrent? encode left right direction remaining
      (RootResetDispatcherNodeStages.exposedTerm encode left right view) =
      some (RouteView.root left right direction remaining (.exposed view)) := by
    simp [parseCurrent?, RootResetDispatcherNodeStages.classifyNode?_exposed]
  cases direction with
  | left =>
      rw [parseRouteNode?]
      simp only [RootResetDispatcherNodeStages.exposedTerm, chosen, fork,
        RouteParser.unpackSelectedNode?]
      generalize hdormant : RouteParser.compiledCallAudit? encode right
        view.forkArgument = dormant
      cases dormant with
      | none =>
          simpa [hdormant, RootResetDispatcherNodeStages.exposedTerm,
            chosen, fork] using current
      | some dormantAudit =>
          have inner : parseRouteNode? encode left remaining
              (Term.app (Term.app Term.s (compileDispatcher encode left))
                (compileDispatcher encode right)) = none := by
            simpa [fork] using
              parseRouteNode?_forkCodes_none encode left left right remaining
          rw [inner]
          simpa [RootResetDispatcherNodeStages.exposedTerm, chosen, fork] using
            current
  | right =>
      rw [parseRouteNode?]
      simp only [RootResetDispatcherNodeStages.exposedTerm, chosen, fork,
        RouteParser.unpackSelectedNode?]
      have hcall : RouteParser.compiledCallAudit? encode left
          (Term.app (Term.app Term.s (compileDispatcher encode left))
            (compileDispatcher encode right)) = none := by
        simpa [fork] using compiledCallAudit?_fork_none encode left left right
      rw [hcall]
      simpa [RootResetDispatcherNodeStages.exposedTerm, chosen, fork] using
        current

/-- Every generated forked row is accepted at the current route root. -/
@[simp]
theorem parseRouteNode?_root_forked
    {Label : Type u} (encode : Label → Term)
    (left right : Dispatcher.Tree Label) (direction : Direction)
    (remaining : Dispatcher.Route) (view : Local.ForkedView) :
    parseRouteNode? encode (.node left right) (direction :: remaining)
        (RootResetDispatcherNodeStages.forkedTerm encode left right view) =
      some (RouteView.root left right direction remaining (.forked view)) := by
  have current : parseCurrent? encode left right direction remaining
      (RootResetDispatcherNodeStages.forkedTerm encode left right view) =
      some (RouteView.root left right direction remaining (.forked view)) := by
    simp [parseCurrent?, RootResetDispatcherNodeStages.classifyNode?_forked]
  cases direction with
  | left =>
      rw [parseRouteNode?]
      simp only [RootResetDispatcherNodeStages.forkedTerm,
        RouteParser.unpackSelectedNode?_chosen]
      rw [RouteParser.compiledCallAudit?_compiledCall,
        parseRouteNode?_compiledCall_none]
      exact current
  | right =>
      rw [parseRouteNode?]
      simp only [RootResetDispatcherNodeStages.forkedTerm,
        RouteParser.unpackSelectedNode?_chosen]
      rw [RouteParser.compiledCallAudit?_compiledCall,
        parseRouteNode?_compiledCall_none]
      exact current

/-- Parser success supplies the exact independent-hole selected-prefix grammar. -/
theorem parseRouteNode?_sound
    {Label : Type u} {encode : Label → Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route}
    {term : Term} {view : RouteView Label}
    (h : parseRouteNode? encode tree route term = some view) :
    RouteShape encode tree route view term := by
  induction tree generalizing route term view with
  | leaf label =>
      simp [parseRouteNode?] at h
  | node left right leftIH rightIH =>
      cases route with
      | nil => simp [parseRouteNode?] at h
      | cons direction remaining =>
          cases direction with
          | left =>
              simp only [parseRouteNode?] at h
              generalize hunpack : RouteParser.unpackSelectedNode? term =
                unpacked at h
              cases unpacked with
              | none =>
                  simp only at h
                  exact parseCurrent?_sound h
              | some fields =>
                  simp only at h
                  generalize hdormant : RouteParser.compiledCallAudit?
                    encode right fields.rightChild = dormant at h
                  cases dormant with
                  | none =>
                      simp only at h
                      exact parseCurrent?_sound h
                  | some dormantAudit =>
                      simp only at h
                      generalize hinner : parseRouteNode? encode left remaining
                        fields.leftChild = innerResult at h
                      cases innerResult with
                      | none =>
                          simp only at h
                          exact parseCurrent?_sound h
                      | some inner =>
                          simp only at h
                          have hview := Option.some.inj h
                          have innerShape := leftIH hinner
                          have dormantEq :=
                            RouteParser.compiledCallAudit?_sound hdormant
                          have source := RouteParser.unpackSelectedNode?_sound hunpack
                          rw [dormantEq] at hview source
                          subst view
                          rw [source]
                          exact .left fields.audit dormantAudit innerShape
          | right =>
              simp only [parseRouteNode?] at h
              generalize hunpack : RouteParser.unpackSelectedNode? term =
                unpacked at h
              cases unpacked with
              | none =>
                  simp only at h
                  exact parseCurrent?_sound h
              | some fields =>
                  simp only at h
                  generalize hdormant : RouteParser.compiledCallAudit?
                    encode left fields.leftChild = dormant at h
                  cases dormant with
                  | none =>
                      simp only at h
                      exact parseCurrent?_sound h
                  | some dormantAudit =>
                      simp only at h
                      generalize hinner : parseRouteNode? encode right remaining
                        fields.rightChild = innerResult at h
                      cases innerResult with
                      | none =>
                          simp only at h
                          exact parseCurrent?_sound h
                      | some inner =>
                          simp only at h
                          have hview := Option.some.inj h
                          have innerShape := rightIH hinner
                          have dormantEq :=
                            RouteParser.compiledCallAudit?_sound hdormant
                          have source := RouteParser.unpackSelectedNode?_sound hunpack
                          rw [dormantEq] at hview source
                          subst view
                          rw [source]
                          exact .right fields.audit dormantAudit innerShape

/-- Every declaratively generated selected-prefix node row is accepted exactly. -/
theorem parseRouteNode?_complete
    {Label : Type u} {encode : Label → Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route}
    {term : Term} {view : RouteView Label}
    (shape : RouteShape encode tree route view term) :
    parseRouteNode? encode tree route term = some view := by
  induction shape with
  | root left right direction remaining stage =>
      cases stage with
      | exposed view =>
          simp [stageTerm]
      | forked view =>
          simp [stageTerm]
  | left outerAudit dormantAudit inner ih =>
      rw [parseRouteNode?]
      simp only [RouteGrammar.selectedLeft,
        RouteParser.unpackSelectedNode?_chosen]
      rw [RouteParser.compiledCallAudit?_compiledCall, ih]
  | right outerAudit dormantAudit inner ih =>
      rw [parseRouteNode?]
      simp only [RouteGrammar.selectedRight,
        RouteParser.unpackSelectedNode?_chosen]
      rw [RouteParser.compiledCallAudit?_compiledCall, ih]

/-- Route parsing is functionally unique. -/
theorem parseRouteNode?_unique
    {Label : Type u} {encode : Label → Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route}
    {term : Term} {first second : RouteView Label}
    (hfirst : parseRouteNode? encode tree route term = some first)
    (hsecond : parseRouteNode? encode tree route term = some second) :
    first = second := by
  rw [hfirst] at hsecond
  exact Option.some.inj hsecond

/-- Declarative selected-prefix placements are jointly unique. -/
theorem RouteShape.deterministic
    {Label : Type u} {encode : Label → Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route}
    {term : Term} {first second : RouteView Label}
    (hfirst : RouteShape encode tree route first term)
    (hsecond : RouteShape encode tree route second term) :
    first = second :=
  parseRouteNode?_unique (parseRouteNode?_complete hfirst)
    (parseRouteNode?_complete hsecond)

/-! ## Exact current-node contraction -/

/-- Address relative to the current node row chosen from the intended route. -/
def RouteView.localRedexAddress {Label : Type u} (view : RouteView Label) : Address :=
  match view.stage with
  | .exposed _ => RootResetDispatcherNodeStages.exposedRedexAddress
  | .forked _ =>
      RootResetDispatcherNodeStages.forkedChildAddress view.direction

/-- Exact saturated redex at the selected current-node occurrence. -/
def RouteView.redexTerm {Label : Type u} (encode : Label → Term)
    (view : RouteView Label) : Term :=
  match view.stage with
  | .exposed exposed =>
      .app (fork (compileDispatcher encode view.left)
        (compileDispatcher encode view.right)) exposed.forkArgument
  | .forked forked =>
      match view.direction with
      | .left => RouteGrammar.compiledCall encode view.left forked.leftArgument
      | .right => RouteGrammar.compiledCall encode view.right forked.rightArgument

/-- Exact contractum of the selected current-node redex. -/
def RouteView.replacement {Label : Type u} (encode : Label → Term)
    (view : RouteView Label) : Term :=
  match view.stage with
  | .exposed exposed =>
      .app
        (RouteGrammar.compiledCall encode view.left exposed.forkArgument)
        (RouteGrammar.compiledCall encode view.right exposed.forkArgument)
  | .forked forked =>
      match view.direction with
      | .left =>
          RootResetDispatcherNodeStages.firstActivation encode view.left
            forked.leftArgument
      | .right =>
          RootResetDispatcherNodeStages.firstActivation encode view.right
            forked.rightArgument

/-- The selected local address reaches its exact saturated redex. -/
theorem RouteView.localRedex_subterm
    {Label : Type u} (encode : Label → Term) (view : RouteView Label) :
    (view.focusTerm encode).subterm? view.localRedexAddress =
      some (view.redexTerm encode) := by
  rcases view with
    ⟨routePrefix, context, left, right, direction, remaining, stage⟩
  cases stage with
  | exposed exposed =>
      simp [RouteView.focusTerm, stageTerm, RouteView.localRedexAddress,
        RouteView.redexTerm]
  | forked forked =>
      cases direction <;> rfl

/-- The selected local occurrence contracts to the exact replacement. -/
theorem RouteView.redex_contractRoot
    {Label : Type u} (encode : Label → Term) (view : RouteView Label) :
    (view.redexTerm encode).contractRoot? = some (view.replacement encode) := by
  rcases view with
    ⟨routePrefix, context, left, right, direction, remaining, stage⟩
  cases stage with
  | exposed exposed => rfl
  | forked forked =>
      cases direction with
      | left =>
          simp [RouteView.redexTerm, RouteView.replacement]
      | right =>
          simp [RouteView.redexTerm, RouteView.replacement]

/-- A selected-prefix shape exposes the current-node focus at its exact address. -/
theorem RouteShape.focus_subterm
    {Label : Type u} {encode : Label → Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route}
    {view : RouteView Label} {term : Term}
    (shape : RouteShape encode tree route view term) :
    term.subterm? (RootResetSelectorContract.contextAddress view.context) =
      some (view.focusTerm encode) := by
  rw [← shape.source_eq]
  simpa using RootResetWholeStageClassifier.subterm?_plug_contextAddress_append
    view.context (view.focusTerm encode) []

/-- The selected-prefix/current-node address reaches the exact redex. -/
theorem RouteShape.redex_subterm
    {Label : Type u} {encode : Label → Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route}
    {view : RouteView Label} {term : Term}
    (shape : RouteShape encode tree route view term) :
    term.subterm?
        (RootResetSelectorContract.contextAddress view.context ++
          view.localRedexAddress) = some (view.redexTerm encode) := by
  rw [← shape.source_eq]
  rw [RootResetWholeStageClassifier.subterm?_plug_contextAddress_append]
  exact view.localRedex_subterm encode

/-! ## Fresh Local shell and syntax-derived route -/

/-- Literal dispatcher-field address in a Local shell. -/
def shellDispatcherAddress : Address := [.left, .left, .right]

/-- Data recovered at one fresh active Local containing a dispatcher half-row. -/
structure ActiveView (program : CTS.Program) where
  bits : List Bool
  continuation : Term
  phase : CTS.Phase program
  frontBit : Bool
  route : Dispatcher.Route
  node : RouteView (ActionLabel program)
  deriving Repr

/-- The action label reconstructed from history phase and literal front bit. -/
def ActiveView.label {program : CTS.Program} (view : ActiveView program) :
    ActionLabel program :=
  (view.phase, view.frontBit)

/-- Address of the current node row relative to the active Local root. -/
def ActiveView.nodeAddress {program : CTS.Program}
    (view : ActiveView program) : Address :=
  shellDispatcherAddress ++
    RootResetSelectorContract.contextAddress view.node.context

/-- Address of the selected saturated redex relative to the active Local root. -/
def ActiveView.redexAddress {program : CTS.Program}
    (view : ActiveView program) : Address :=
  view.nodeAddress ++ view.node.localRedexAddress

/-- Exact redex selected at the current dispatcher node. -/
def ActiveView.redexTerm {program : CTS.Program} (view : ActiveView program) :
    Term :=
  view.node.redexTerm (selectedAction program)

/-- Exact contractum selected at the current dispatcher node. -/
def ActiveView.replacement {program : CTS.Program}
    (view : ActiveView program) : Term :=
  view.node.replacement (selectedAction program)

/--
Independent-hole grammar for a fresh Local whose dispatcher field contains
one selected-prefix node row.  The intended route is fixed by the phase from
the marked history and the front bit from the literal word.
-/
inductive ActiveShape
    (program : CTS.Program)
    (layout : ActionDispatcher program)
    (history : List (CheckpointDecoder.LocalView program))
    (view : ActiveView program) (term : Term) : Prop where
  | intro
      (haltField dispatcherTerm seedAudit continuationAudit : Term)
      (halt : CheckpointDecoder.HaltShape .fresh haltField)
      (phase_eq : view.phase =
        RootResetWholeStageClassifier.historyPhase program history)
      (frontBit_eq : view.bits.head? = some view.frontBit)
      (route_eq : view.route = layout.route view.label)
      (routeShape : RouteShape (selectedAction program) layout.tree view.route
        view.node dispatcherTerm)
      (source_eq : term = CheckpointDecoder.openShell haltField dispatcherTerm
        (word view.bits) seedAudit view.continuation continuationAudit) :
      ActiveShape program layout history view term

namespace ActiveShape

theorem phase_eq
    {program : CTS.Program} {layout : ActionDispatcher program}
    {history : List (CheckpointDecoder.LocalView program)}
    {view : ActiveView program} {term : Term}
    (shape : ActiveShape program layout history view term) :
    view.phase = RootResetWholeStageClassifier.historyPhase program history := by
  cases shape with
  | intro haltField dispatcherTerm seedAudit continuationAudit halt phase
      front route routeShape source =>
      exact phase

theorem frontBit_eq
    {program : CTS.Program} {layout : ActionDispatcher program}
    {history : List (CheckpointDecoder.LocalView program)}
    {view : ActiveView program} {term : Term}
    (shape : ActiveShape program layout history view term) :
    view.bits.head? = some view.frontBit := by
  cases shape with
  | intro haltField dispatcherTerm seedAudit continuationAudit halt phase
      front route routeShape source =>
      exact front

theorem route_eq
    {program : CTS.Program} {layout : ActionDispatcher program}
    {history : List (CheckpointDecoder.LocalView program)}
    {view : ActiveView program} {term : Term}
    (shape : ActiveShape program layout history view term) :
    view.route = layout.route view.label := by
  cases shape with
  | intro haltField dispatcherTerm seedAudit continuationAudit halt phase
      front route routeShape source =>
      exact route

theorem routeShape
    {program : CTS.Program} {layout : ActionDispatcher program}
    {history : List (CheckpointDecoder.LocalView program)}
    {view : ActiveView program} {term : Term}
    (shape : ActiveShape program layout history view term) :
    ∃ dispatcherTerm,
      RouteShape (selectedAction program) layout.tree view.route view.node
        dispatcherTerm := by
  cases shape with
  | intro haltField dispatcherTerm seedAudit continuationAudit halt phase
      front route routeShape source =>
      exact ⟨dispatcherTerm, routeShape⟩

theorem source_eq
    {program : CTS.Program} {layout : ActionDispatcher program}
    {history : List (CheckpointDecoder.LocalView program)}
    {view : ActiveView program} {term : Term}
    (shape : ActiveShape program layout history view term) :
    ∃ haltField dispatcherTerm seedAudit continuationAudit,
      CheckpointDecoder.HaltShape .fresh haltField ∧
      RouteShape (selectedAction program) layout.tree view.route view.node
          dispatcherTerm ∧
      term = CheckpointDecoder.openShell haltField dispatcherTerm
        (word view.bits) seedAudit view.continuation continuationAudit := by
  cases shape with
  | intro haltField dispatcherTerm seedAudit continuationAudit halt phase
      front route routeShape source =>
      exact ⟨haltField, dispatcherTerm, seedAudit, continuationAudit,
        halt, routeShape, source⟩

end ActiveShape

/-- Recognize the fresh halt prefix while leaving its audit term opaque. -/
def parseFreshHalt? : Term → Option Term
  | .app fn audit => if fn = haltCode then some audit else none
  | .s => none

/-- Fresh-halt success reconstructs the exact independent audit field. -/
theorem parseFreshHalt?_sound
    {field audit : Term} (h : parseFreshHalt? field = some audit) :
    field = freshHField audit := by
  cases field with
  | s => simp [parseFreshHalt?] at h
  | app fn foundAudit =>
      simp only [parseFreshHalt?] at h
      split at h
      next hfn =>
        have haudit := Option.some.inj h
        subst audit
        subst fn
        rfl
      next => contradiction

@[simp]
theorem parseFreshHalt?_fresh (audit : Term) :
    parseFreshHalt? (freshHField audit) = some audit := by
  simp [parseFreshHalt?, freshHField]

/--
Parse a fresh Local from its root.  Phase, bit, and the route to follow are
computed during this invocation from the current syntax and fixed layout.
-/
def parseActive?
    (program : CTS.Program)
    (layout : ActionDispatcher program)
    (history : List (CheckpointDecoder.LocalView program))
    (term : Term) : Option (ActiveView program) :=
  match term with
  | .app
      (.app
        (.app haltField dispatcherTerm)
        (.app (.app .s seedPayload) _seedAudit))
      (.app continuation _continuationAudit) =>
      match parseFreshHalt? haltField with
      | none => none
      | some _haltAudit =>
          match CheckpointDecoder.parseWord? seedPayload with
          | none => none
          | some bits =>
              match bits.head? with
              | none => none
              | some frontBit =>
                  let phase :=
                    RootResetWholeStageClassifier.historyPhase program history
                  let label : ActionLabel program := (phase, frontBit)
                  let route := layout.route label
                  match parseRouteNode? (selectedAction program) layout.tree
                      route dispatcherTerm with
                  | none => none
                  | some node =>
                      some ⟨bits, continuation, phase, frontBit, route, node⟩
  | _ => none

/-- Active parsing is sound for the fresh-shell selected-prefix grammar. -/
theorem parseActive?_sound
    {program : CTS.Program}
    {layout : ActionDispatcher program}
    {history : List (CheckpointDecoder.LocalView program)}
    {term : Term} {view : ActiveView program}
    (h : parseActive? program layout history term = some view) :
    ActiveShape program layout history view term := by
  unfold parseActive? at h
  split at h <;> try contradiction
  next source haltField dispatcherTerm seedPayload seedAudit continuation
      continuationAudit =>
    generalize hhalt : parseFreshHalt? haltField = haltResult at h
    cases haltResult with
    | none => contradiction
    | some haltAudit =>
        simp only at h
        generalize hword : CheckpointDecoder.parseWord? seedPayload =
          wordResult at h
        cases wordResult with
        | none => contradiction
        | some bits =>
            simp only at h
            cases hbits : bits.head? with
            | none => simp [hbits] at h
            | some frontBit =>
                simp only [hbits] at h
                let phase :=
                  RootResetWholeStageClassifier.historyPhase program history
                let label : ActionLabel program := (phase, frontBit)
                let route := layout.route label
                generalize hnode : parseRouteNode? (selectedAction program)
                  layout.tree route dispatcherTerm = nodeResult at h
                cases nodeResult with
                | none => contradiction
                | some node =>
                    have hview := Option.some.inj h
                    subst view
                    refine .intro haltField dispatcherTerm seedAudit
                      continuationAudit ?_ rfl hbits rfl
                      (parseRouteNode?_sound hnode) ?_
                    · rw [parseFreshHalt?_sound hhalt]
                      exact .fresh haltAudit
                    · rw [CheckpointDecoder.parseWord?_sound hword]
                      rfl

/-- Every exact fresh-shell selected-prefix shape is parsed completely. -/
theorem parseActive?_complete
    {program : CTS.Program}
    {layout : ActionDispatcher program}
    {history : List (CheckpointDecoder.LocalView program)}
    {term : Term} {view : ActiveView program}
    (shape : ActiveShape program layout history view term) :
    parseActive? program layout history term = some view := by
  rcases view with ⟨bits, continuation, phase, frontBit, route, node⟩
  rcases shape with
    ⟨haltField, dispatcherTerm, seedAudit, continuationAudit, halt,
      phaseEq, frontBitEq, routeEq, routeShape, rfl⟩
  have hphase : phase =
      RootResetWholeStageClassifier.historyPhase program history := by
    simpa only using phaseEq
  subst phase
  have hroute : route = layout.route
      (RootResetWholeStageClassifier.historyPhase program history,
        frontBit) := by
    simpa only [ActiveView.label] using routeEq
  subst route
  cases halt with
  | fresh haltAudit =>
      have hnode := parseRouteNode?_complete routeShape
      simp [parseActive?, CheckpointDecoder.openShell, parseFreshHalt?,
        freshHField, CheckpointDecoder.parseWord?_word, frontBitEq, hnode]

/-- Active parsing recovers the phase exactly from the marked history. -/
theorem ActiveShape.phase_recovered
    {program : CTS.Program} {layout : ActionDispatcher program}
    {history : List (CheckpointDecoder.LocalView program)}
    {view : ActiveView program} {term : Term}
    (shape : ActiveShape program layout history view term) :
    view.phase = RootResetWholeStageClassifier.historyPhase program history :=
  shape.phase_eq

/-- Active parsing recovers the front bit from the literal word. -/
theorem ActiveShape.frontBit_recovered
    {program : CTS.Program} {layout : ActionDispatcher program}
    {history : List (CheckpointDecoder.LocalView program)}
    {view : ActiveView program} {term : Term}
    (shape : ActiveShape program layout history view term) :
    view.bits.head? = some view.frontBit :=
  shape.frontBit_eq

/-- Active parsing follows exactly the fixed layout's route for that label. -/
theorem ActiveShape.route_recovered
    {program : CTS.Program} {layout : ActionDispatcher program}
    {history : List (CheckpointDecoder.LocalView program)}
    {view : ActiveView program} {term : Term}
    (shape : ActiveShape program layout history view term) :
    view.route = layout.route view.label :=
  shape.route_eq

/-- The recovered route reaches exactly the syntax-derived action label. -/
theorem ActiveShape.route_valid
    {program : CTS.Program} {layout : ActionDispatcher program}
    {history : List (CheckpointDecoder.LocalView program)}
    {view : ActiveView program} {term : Term}
    (shape : ActiveShape program layout history view term) :
    Dispatcher.HasRoute layout.tree view.route view.label := by
  rw [shape.route_eq]
  exact layout.route_valid view.label

/-- The current node prefix and direction split the reconstructed route. -/
theorem ActiveShape.route_split
    {program : CTS.Program} {layout : ActionDispatcher program}
    {history : List (CheckpointDecoder.LocalView program)}
    {view : ActiveView program} {term : Term}
  (shape : ActiveShape program layout history view term) :
    layout.route view.label =
      view.node.routePrefix ++ view.node.direction :: view.node.remaining := by
  rw [← shape.route_eq]
  obtain ⟨dispatcherTerm, routeShape⟩ := shape.routeShape
  exact routeShape.route_eq

/-- The current node is the exact fixed subtree at its recovered prefix. -/
theorem ActiveShape.current_subtree
    {program : CTS.Program} {layout : ActionDispatcher program}
    {history : List (CheckpointDecoder.LocalView program)}
    {view : ActiveView program} {term : Term}
  (shape : ActiveShape program layout history view term) :
    treeAt? layout.tree view.node.routePrefix =
      some (.node view.node.left view.node.right) := by
  obtain ⟨dispatcherTerm, routeShape⟩ := shape.routeShape
  exact routeShape.treeAt?_eq

/-- The active-root node address reaches the exact exposed/forked row. -/
theorem ActiveShape.node_subterm
    {program : CTS.Program} {layout : ActionDispatcher program}
    {history : List (CheckpointDecoder.LocalView program)}
    {view : ActiveView program} {term : Term}
    (shape : ActiveShape program layout history view term) :
    term.subterm? view.nodeAddress =
      some (view.node.focusTerm (selectedAction program)) := by
  rcases shape.source_eq with
    ⟨haltField, dispatcherTerm, seedAudit, continuationAudit, halt,
      routeShape, source⟩
  rw [source, CheckpointDecoder.openShell_word]
  unfold ActiveView.nodeAddress shellDispatcherAddress
  rw [CarrierDecoder.subterm?_append, Carrier.shell_dispatcher_subterm]
  exact routeShape.focus_subterm

/-- The active-root selected address reaches the exact saturated redex. -/
theorem ActiveShape.redex_subterm
    {program : CTS.Program} {layout : ActionDispatcher program}
    {history : List (CheckpointDecoder.LocalView program)}
    {view : ActiveView program} {term : Term}
    (shape : ActiveShape program layout history view term) :
    term.subterm? view.redexAddress = some view.redexTerm := by
  rcases shape.source_eq with
    ⟨haltField, dispatcherTerm, seedAudit, continuationAudit, halt,
      routeShape, source⟩
  rw [source, CheckpointDecoder.openShell_word]
  unfold ActiveView.redexAddress ActiveView.nodeAddress
    shellDispatcherAddress ActiveView.redexTerm
  rw [List.append_assoc]
  rw [CarrierDecoder.subterm?_append, Carrier.shell_dispatcher_subterm]
  exact routeShape.redex_subterm

/-- The selected active occurrence contracts to its exact node replacement. -/
theorem ActiveView.redex_contractRoot
    {program : CTS.Program} (view : ActiveView program) :
    view.redexTerm.contractRoot? = some view.replacement := by
  exact view.node.redex_contractRoot (selectedAction program)

/-- Shell audit holes do not affect any recovered dispatcher-row data. -/
theorem parseActive?_shell_audits_opaque
    (program : CTS.Program) (layout : ActionDispatcher program)
    (history : List (CheckpointDecoder.LocalView program))
    (bits : List Bool) (continuation dispatcherTerm : Term)
    (firstHaltAudit firstSeedAudit firstContinuationAudit
      secondHaltAudit secondSeedAudit secondContinuationAudit : Term) :
    parseActive? program layout history
        (Carrier.activeShell bits continuation (freshHField firstHaltAudit)
          dispatcherTerm firstSeedAudit firstContinuationAudit) =
      parseActive? program layout history
        (Carrier.activeShell bits continuation (freshHField secondHaltAudit)
          dispatcherTerm secondSeedAudit secondContinuationAudit) := by
  simp [parseActive?, Carrier.activeShell, Carrier.shell,
    parseFreshHalt?, freshHField, seedCode,
    CheckpointDecoder.parseWord?_word]

/-! ## Bare whole-term parser -/

/-- Result of one root-starting whole dispatcher-row classification. -/
structure View (program : CTS.Program) where
  active : Term
  context : Context
  history : List (CheckpointDecoder.LocalView program)
  endpoint : ActiveView program
  deriving Repr

/-- Root-relative address of the current exposed/forked node row. -/
def View.nodeAddress {program : CTS.Program} (view : View program) : Address :=
  RootResetSelectorContract.contextAddress view.context ++
    view.endpoint.nodeAddress

/-- Root-relative address of the exact selected saturated redex. -/
def View.redexAddress {program : CTS.Program} (view : View program) : Address :=
  RootResetSelectorContract.contextAddress view.context ++
    view.endpoint.redexAddress

def View.phase {program : CTS.Program} (view : View program) :
    CTS.Phase program :=
  view.endpoint.phase

def View.frontBit {program : CTS.Program} (view : View program) : Bool :=
  view.endpoint.frontBit

def View.label {program : CTS.Program} (view : View program) :
    ActionLabel program :=
  view.endpoint.label

def View.route {program : CTS.Program} (view : View program) :
    Dispatcher.Route :=
  view.endpoint.route

def View.stage {program : CTS.Program} (view : View program) : Local.StageView :=
  view.endpoint.node.stage

/-- Parse the current bare term from the root, with no supplied role or path. -/
def parse?
    (program : CTS.Program)
    (layout : ActionDispatcher program)
    (term : Term) : Option (View program) :=
  let decomposition := peelMarked program layout.tree term
  match parseActive? program layout decomposition.history
      decomposition.active with
  | none => none
  | some endpoint =>
      some ⟨decomposition.active, decomposition.context,
        decomposition.history, endpoint⟩

/-- Declarative whole placement: marked history plus one fresh active row. -/
structure WholeShape
    (program : CTS.Program)
    (layout : ActionDispatcher program)
    (view : View program) (term : Term) : Prop where
  markedPrefix : MarkedPrefix program layout.tree term view.active view.context
    view.history
  activeShape : ActiveShape program layout view.history view.endpoint
    view.active

/-- Whole-parser success supplies the exact marked-prefix/active-row grammar. -/
theorem parse?_sound
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {view : View program}
    (h : parse? program layout term = some view) :
    WholeShape program layout view term := by
  dsimp [parse?] at h
  generalize hactive : parseActive? program layout
    (peelMarked program layout.tree term).history
    (peelMarked program layout.tree term).active = activeResult at h
  cases activeResult with
  | none => simp [hactive] at h
  | some endpoint =>
      simp only at h
      have hview := Option.some.inj h
      subst view
      exact ⟨peelMarked_sound program layout.tree term,
        parseActive?_sound hactive⟩

/-- Every declaratively placed whole dispatcher row is accepted exactly. -/
theorem parse?_complete
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {view : View program}
    (shape : WholeShape program layout view term) :
    parse? program layout term = some view := by
  have unique := markedPrefix_eq_peelMarked shape.markedPrefix
  rcases view with ⟨active, context, history, endpoint⟩
  simp only at unique shape ⊢
  rcases unique with ⟨activeEq, contextEq, historyEq⟩
  subst active
  subst context
  subst history
  simp only [parse?]
  rw [parseActive?_complete shape.activeShape]

/-- Whole parsing is a function of the current bare term and fixed layout. -/
theorem parse?_unique
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {first second : View program}
    (hfirst : parse? program layout term = some first)
    (hsecond : parse? program layout term = some second) :
    first = second := by
  rw [hfirst] at hsecond
  exact Option.some.inj hsecond

/-- Declarative whole placements are jointly unique. -/
theorem WholeShape.deterministic
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {first second : View program}
    (hfirst : WholeShape program layout first term)
    (hsecond : WholeShape program layout second term) :
    first = second :=
  parse?_unique (parse?_complete hfirst) (parse?_complete hsecond)

/-- Every Local view in the canonical recorded outer history is marked. -/
theorem parse?_history_marked
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {view : View program}
    (h : parse? program layout term = some view) :
    MarkedHistory program view.history :=
  (parse?_sound h).markedPrefix.historical_views_marked

/-- The whole parser recovers phase from its unique marked history. -/
theorem parse?_phase_recovered
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {view : View program}
    (h : parse? program layout term = some view) :
    view.phase =
      RootResetWholeStageClassifier.historyPhase program view.history :=
  (parse?_sound h).activeShape.phase_recovered

/-- The whole parser recovers the front bit from the active literal word. -/
theorem parse?_frontBit_recovered
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {view : View program}
    (h : parse? program layout term = some view) :
    view.endpoint.bits.head? = some view.frontBit :=
  (parse?_sound h).activeShape.frontBit_recovered

/-- The whole parser recovers the fixed route for its syntax-derived label. -/
theorem parse?_route_recovered
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {view : View program}
    (h : parse? program layout term = some view) :
    view.route = layout.route view.label :=
  (parse?_sound h).activeShape.route_recovered

/-- The whole-term recovered route reaches its reconstructed phase/bit label. -/
theorem parse?_route_valid
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {view : View program}
    (h : parse? program layout term = some view) :
    Dispatcher.HasRoute layout.tree view.route view.label :=
  (parse?_sound h).activeShape.route_valid

/-- The whole-term recovered prefix identifies its exact fixed internal node. -/
theorem parse?_current_subtree
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {view : View program}
    (h : parse? program layout term = some view) :
    treeAt? layout.tree view.endpoint.node.routePrefix =
      some (.node view.endpoint.node.left view.endpoint.node.right) :=
  (parse?_sound h).activeShape.current_subtree

/--
Even on a forked row, current direction is exactly the next direction in the
outer syntax-derived route; it is not information stored in the forked row.
-/
theorem parse?_direction_from_outer_route
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {view : View program}
    (h : parse? program layout term = some view) :
    layout.route view.label =
      view.endpoint.node.routePrefix ++
        view.endpoint.node.direction :: view.endpoint.node.remaining :=
  (parse?_sound h).activeShape.route_split

/-- The root-relative node address reaches the exact registered node row. -/
theorem View.node_subterm
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {view : View program}
    (h : parse? program layout term = some view) :
    term.subterm? view.nodeAddress =
      some (view.endpoint.node.focusTerm (selectedAction program)) := by
  have shape := parse?_sound h
  rw [← shape.markedPrefix.source_eq]
  unfold View.nodeAddress
  rw [RootResetWholeStageClassifier.subterm?_plug_contextAddress_append]
  exact shape.activeShape.node_subterm

/-- The root-relative selected address reaches its exact saturated redex. -/
theorem View.redex_subterm
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {view : View program}
    (h : parse? program layout term = some view) :
    term.subterm? view.redexAddress = some view.endpoint.redexTerm := by
  have shape := parse?_sound h
  rw [← shape.markedPrefix.source_eq]
  unfold View.redexAddress
  rw [RootResetWholeStageClassifier.subterm?_plug_contextAddress_append]
  exact shape.activeShape.redex_subterm

/-- Whole contraction is exact replacement of the certified saturated redex. -/
theorem View.contracts
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {view : View program}
    (h : parse? program layout term = some view) :
    ∃ target,
      term.replace? view.redexAddress view.endpoint.replacement = some target ∧
      term.contractAt? view.redexAddress = some target := by
  have wholeRedex := view.redex_subterm h
  have hroot := view.endpoint.redex_contractRoot
  obtain ⟨context, plug, replace⟩ := Term.context_of_subterm wholeRedex
  refine ⟨context.plug view.endpoint.replacement,
    replace view.endpoint.replacement, ?_⟩
  unfold Term.contractAt?
  rw [wholeRedex]
  simp only
  rw [hroot]
  exact replace view.endpoint.replacement

/-! ## Generated completeness and stage disjointness -/

/-- Exact fresh active shell containing an arbitrary registered route row. -/
def generatedActive
    (bits : List Bool) (continuation haltAudit seedAudit continuationAudit : Term)
    (dispatcherTerm : Term) : Term :=
  Carrier.activeShell bits continuation (freshHField haltAudit)
    dispatcherTerm seedAudit continuationAudit

/-- Every generated selected-prefix row for the syntax-derived route is found. -/
theorem parseActive?_generated
    (program : CTS.Program) (layout : ActionDispatcher program)
    (history : List (CheckpointDecoder.LocalView program))
    (bits : List Bool) (frontBit : Bool)
    (head : bits.head? = some frontBit)
    (continuation haltAudit seedAudit continuationAudit dispatcherTerm : Term)
    (node : RouteView (ActionLabel program))
    (routeShape : RouteShape (selectedAction program) layout.tree
      (layout.route
        (RootResetWholeStageClassifier.historyPhase program history, frontBit))
      node dispatcherTerm) :
    parseActive? program layout history
        (generatedActive bits continuation haltAudit seedAudit
          continuationAudit dispatcherTerm) =
      some
        ⟨bits, continuation,
          RootResetWholeStageClassifier.historyPhase program history, frontBit,
          layout.route
            (RootResetWholeStageClassifier.historyPhase program history,
              frontBit),
          node⟩ := by
  apply parseActive?_complete
  exact .intro (freshHField haltAudit) dispatcherTerm seedAudit
    continuationAudit (.fresh haltAudit) rfl head rfl routeShape rfl

/-- Generated active rows lift through any canonical marked-history prefix. -/
theorem parse?_of_markedPrefix_generated
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term active : Term} {context : Context}
    {history : List (CheckpointDecoder.LocalView program)}
    {endpoint : ActiveView program}
    (marked : MarkedPrefix program layout.tree term active context history)
    (activeShape : ActiveShape program layout history endpoint active) :
    parse? program layout term =
      some ⟨active, context, history, endpoint⟩ := by
  apply parse?_complete
  exact ⟨marked, activeShape⟩

/-- Exposed and forked whole-row alternatives cannot classify the same term. -/
theorem parse?_exposed_forked_disjoint
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {exposedView forkedView : View program}
    {exposed : Local.ExposedView} {forkedViewData : Local.ForkedView}
    (hexposed : parse? program layout term = some exposedView)
    (hforked : parse? program layout term = some forkedView)
    (exposedStage : exposedView.stage = .exposed exposed)
    (forkedStage : forkedView.stage = .forked forkedViewData) : False := by
  have equal := parse?_unique hexposed hforked
  subst forkedView
  rw [exposedStage] at forkedStage
  contradiction

end PureSFormal.Research.RootResetWholeDispatcherStages
