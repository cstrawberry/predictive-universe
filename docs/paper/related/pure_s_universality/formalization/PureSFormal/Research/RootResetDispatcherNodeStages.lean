import PureSFormal.PureS.SchedulerResponseInvariant

/-!
# Term-only dispatcher-node stage parsers

This module isolates the two consecutive bare dispatcher-field rows produced
at one internal node.  The `exposed` row follows the wrapper contraction and
contains the still-saturated fork at its right child.  The `forked` row follows
that fork contraction and contains the two compiled child calls.

Both parsers start from the supplied term root and compare only the fixed
compiled child codes.  The outer audit and every call argument are returned as
independent holes; no equality between them is tested.

The post-fork term is identical before a left or a right descent.  Accordingly
the parser does not manufacture a branch direction.  It supplies both genuine
child-redex addresses, and a later classifier may choose one only after
recovering the CTS phase and front bit from other syntax.

These are local node-stage results.  They do not assert that every reachable
root-reset term has such a node at a particular whole-term address, and they do
not supply a complete CTS walker or simulation theorem.
-/

namespace PureSFormal.Research.RootResetDispatcherNodeStages

open PureSFormal.PureS

/-- Data retained from the row after the first internal-node contraction. -/
structure ExposedView where
  outerAudit : Term
  forkArgument : Term
  deriving BEq, DecidableEq, Repr

/-- Data retained from the row after the second internal-node contraction. -/
structure ForkedView where
  outerAudit : Term
  leftArgument : Term
  rightArgument : Term
  deriving BEq, DecidableEq, Repr

/-- The exact first-contraction node row, with independent opaque holes. -/
def exposedTerm {Label : Type u} (encode : Label → Term)
    (left right : Dispatcher.Tree Label) (view : ExposedView) : Term :=
  chosen view.outerAudit
    (.app (fork (compileDispatcher encode left)
      (compileDispatcher encode right)) view.forkArgument)

/-- The exact second-contraction node row, with independent call arguments. -/
def forkedTerm {Label : Type u} (encode : Label → Term)
    (left right : Dispatcher.Tree Label) (view : ForkedView) : Term :=
  chosen view.outerAudit
    (.app
      (RouteGrammar.compiledCall encode left view.leftArgument)
      (RouteGrammar.compiledCall encode right view.rightArgument))

/--
Parse the first internal-node row.  Only the two fixed compiled codes are
compared.  The duplicated runtime carrier is deliberately not compared with
the outer audit.
-/
def parseExposed? {Label : Type u} (encode : Label → Term)
    (left right : Dispatcher.Tree Label) : Term → Option ExposedView
  | .app (.app .s outerAudit)
      (.app (.app (.app .s foundLeft) foundRight) forkArgument) =>
      if foundLeft = compileDispatcher encode left then
        if foundRight = compileDispatcher encode right then
          some ⟨outerAudit, forkArgument⟩
        else
          none
      else
        none
  | _ => none

/--
Parse the second internal-node row.  Only the fixed code at the head of each
child call is compared; all three returned holes remain independent.
-/
def parseForked? {Label : Type u} (encode : Label → Term)
    (left right : Dispatcher.Tree Label) : Term → Option ForkedView
  | .app (.app .s outerAudit)
      (.app (.app foundLeft leftArgument) (.app foundRight rightArgument)) =>
      if foundLeft = compileDispatcher encode left then
        if foundRight = compileDispatcher encode right then
          some ⟨outerAudit, leftArgument, rightArgument⟩
        else
          none
      else
        none
  | _ => none

@[simp]
theorem parseExposed?_exposedTerm
    {Label : Type u} (encode : Label → Term)
    (left right : Dispatcher.Tree Label) (view : ExposedView) :
    parseExposed? encode left right (exposedTerm encode left right view) =
      some view := by
  cases view
  simp [parseExposed?, exposedTerm, chosen, fork]

@[simp]
theorem parseForked?_forkedTerm
    {Label : Type u} (encode : Label → Term)
    (left right : Dispatcher.Tree Label) (view : ForkedView) :
    parseForked? encode left right (forkedTerm encode left right view) =
      some view := by
  cases view
  simp [parseForked?, forkedTerm, RouteGrammar.compiledCall, chosen]

/-- Successful first-row parsing reconstructs the exact registered syntax. -/
theorem parseExposed?_sound
    {Label : Type u} {encode : Label → Term}
    {left right : Dispatcher.Tree Label} {term : Term} {view : ExposedView}
    (h : parseExposed? encode left right term = some view) :
    term = exposedTerm encode left right view := by
  cases term with
  | s => simp [parseExposed?] at h
  | app fn response =>
      cases fn with
      | s => simp [parseExposed?] at h
      | app head outerAudit =>
          cases head with
          | app headFn headArg => simp [parseExposed?] at h
          | s =>
              cases response with
              | s => simp [parseExposed?] at h
              | app forkCall forkArgument =>
                  cases forkCall with
                  | s => simp [parseExposed?] at h
                  | app forkHead foundRight =>
                      cases forkHead with
                      | s => simp [parseExposed?] at h
                      | app forkS foundLeft =>
                          cases forkS with
                          | app forkFn forkArg => simp [parseExposed?] at h
                          | s =>
                              simp only [parseExposed?] at h
                              split at h
                              next hleft =>
                                split at h
                                next hright =>
                                  have hview := Option.some.inj h
                                  subst view
                                  subst foundLeft
                                  subst foundRight
                                  rfl
                                next => contradiction
                              next => contradiction

/-- Successful second-row parsing reconstructs the exact registered syntax. -/
theorem parseForked?_sound
    {Label : Type u} {encode : Label → Term}
    {left right : Dispatcher.Tree Label} {term : Term} {view : ForkedView}
    (h : parseForked? encode left right term = some view) :
    term = forkedTerm encode left right view := by
  cases term with
  | s => simp [parseForked?] at h
  | app fn response =>
      cases fn with
      | s => simp [parseForked?] at h
      | app head outerAudit =>
          cases head with
          | app headFn headArg => simp [parseForked?] at h
          | s =>
              cases response with
              | s => simp [parseForked?] at h
              | app leftCall rightCall =>
                  cases leftCall with
                  | s => simp [parseForked?] at h
                  | app foundLeft leftArgument =>
                      cases rightCall with
                      | s => simp [parseForked?] at h
                      | app foundRight rightArgument =>
                          simp only [parseForked?] at h
                          split at h
                          next hleft =>
                            split at h
                            next hright =>
                              have hview := Option.some.inj h
                              subst view
                              subst foundLeft
                              subst foundRight
                              rfl
                            next => contradiction
                          next => contradiction

/-- The fixed compiled code of any dispatcher subtree has head arity two. -/
@[simp]
theorem compileDispatcher_headArity
    {Label : Type u} (encode : Label → Term)
    (tree : Dispatcher.Tree Label) :
    (compileDispatcher encode tree).headArity = 2 := by
  cases tree <;> rfl

/-- First- and second-contraction node rows have disjoint registered syntax. -/
theorem exposedTerm_ne_forkedTerm
    {Label : Type u} (encode : Label → Term)
    (left right : Dispatcher.Tree Label)
    (exposed : ExposedView) (forkedView : ForkedView) :
    exposedTerm encode left right exposed ≠
      forkedTerm encode left right forkedView := by
  intro equal
  have childEqual := congrArg
    (fun term => (term.subterm? [.right, .left]).map Term.headArity) equal
  simp [exposedTerm, forkedTerm, RouteGrammar.compiledCall, chosen, fork,
    Term.subterm?] at childEqual

/-- Exposed success forces rejection by the forked-row parser. -/
theorem parseForked?_none_of_parseExposed?_some
    {Label : Type u} {encode : Label → Term}
    {left right : Dispatcher.Tree Label} {term : Term} {view : ExposedView}
    (h : parseExposed? encode left right term = some view) :
    parseForked? encode left right term = none := by
  generalize hforked : parseForked? encode left right term = result
  cases result with
  | none => rfl
  | some forkedView =>
      have exposedShape := parseExposed?_sound h
      have forkedShape := parseForked?_sound hforked
      exact False.elim
        (exposedTerm_ne_forkedTerm encode left right view forkedView
          (exposedShape.symm.trans forkedShape))

/-- Forked success forces rejection by the exposed-row parser. -/
theorem parseExposed?_none_of_parseForked?_some
    {Label : Type u} {encode : Label → Term}
    {left right : Dispatcher.Tree Label} {term : Term} {view : ForkedView}
    (h : parseForked? encode left right term = some view) :
    parseExposed? encode left right term = none := by
  generalize hexposed : parseExposed? encode left right term = result
  cases result with
  | none => rfl
  | some exposed =>
      have exposedShape := parseExposed?_sound hexposed
      have forkedShape := parseForked?_sound h
      exact False.elim
        (exposedTerm_ne_forkedTerm encode left right exposed view
          (exposedShape.symm.trans forkedShape))

/-- The two local node stages returned by the term-only classifier. -/
inductive StageView where
  | exposed (view : ExposedView)
  | forked (view : ForkedView)
  deriving BEq, DecidableEq, Repr

/-- Classify a local internal-node focus, with first-row priority. -/
def classifyNode? {Label : Type u} (encode : Label → Term)
    (left right : Dispatcher.Tree Label) (term : Term) : Option StageView :=
  match parseExposed? encode left right term with
  | some view => some (.exposed view)
  | none =>
      match parseForked? encode left right term with
      | some view => some (.forked view)
      | none => none

/-- Classifier success always has one of the two exact registered forms. -/
theorem classifyNode?_sound
    {Label : Type u} {encode : Label → Term}
    {left right : Dispatcher.Tree Label} {term : Term} {stage : StageView}
    (h : classifyNode? encode left right term = some stage) :
    (∃ view, stage = .exposed view ∧
      term = exposedTerm encode left right view) ∨
    (∃ view, stage = .forked view ∧
      term = forkedTerm encode left right view) := by
  unfold classifyNode? at h
  generalize hexposed : parseExposed? encode left right term = exposedResult at h
  cases exposedResult with
  | some view =>
      simp only at h
      have hstage : StageView.exposed view = stage := Option.some.inj h
      cases hstage
      exact Or.inl ⟨view, rfl, parseExposed?_sound hexposed⟩
  | none =>
      simp only at h
      generalize hforked : parseForked? encode left right term = forkedResult at h
      cases forkedResult with
      | none => contradiction
      | some view =>
          simp only at h
          have hstage : StageView.forked view = stage := Option.some.inj h
          cases hstage
          exact Or.inr ⟨view, rfl, parseForked?_sound hforked⟩

@[simp]
theorem classifyNode?_exposed
    {Label : Type u} (encode : Label → Term)
    (left right : Dispatcher.Tree Label) (view : ExposedView) :
    classifyNode? encode left right (exposedTerm encode left right view) =
      some (.exposed view) := by
  simp [classifyNode?]

@[simp]
theorem classifyNode?_forked
    {Label : Type u} (encode : Label → Term)
    (left right : Dispatcher.Tree Label) (view : ForkedView) :
    classifyNode? encode left right (forkedTerm encode left right view) =
      some (.forked view) := by
  simp [classifyNode?, parseExposed?_none_of_parseForked?_some]

/-! ## Registered child addresses -/

/-- The exposed fork redex is always the response child of `Chosen`. -/
def exposedRedexAddress : Address := [.right]

/-- The two child calls of a forked row, indexed by a later branch choice. -/
def forkedChildAddress : Direction → Address
  | .left => [.right, .left]
  | .right => [.right, .right]

/-- The exposed address reaches the literal saturated fork redex. -/
@[simp]
theorem exposedRedexAddress_subterm
    {Label : Type u} (encode : Label → Term)
    (left right : Dispatcher.Tree Label) (view : ExposedView) :
    (exposedTerm encode left right view).subterm? exposedRedexAddress =
      some (.app (fork (compileDispatcher encode left)
        (compileDispatcher encode right)) view.forkArgument) :=
  rfl

/-- The exposed address contracts the exact second-row fork. -/
@[simp]
theorem contractAt?_exposedRedexAddress
    {Label : Type u} (encode : Label → Term)
    (left right : Dispatcher.Tree Label) (view : ExposedView) :
    (exposedTerm encode left right view).contractAt? exposedRedexAddress =
      some (forkedTerm encode left right
        ⟨view.outerAudit, view.forkArgument, view.forkArgument⟩) :=
  rfl

/-- A branch-indexed forked address reaches its exact compiled child call. -/
@[simp]
theorem forkedChildAddress_subterm
    {Label : Type u} (encode : Label → Term)
    (left right : Dispatcher.Tree Label) (view : ForkedView)
    (direction : Direction) :
    (forkedTerm encode left right view).subterm?
        (forkedChildAddress direction) =
      some (match direction with
        | .left => RouteGrammar.compiledCall encode left view.leftArgument
        | .right => RouteGrammar.compiledCall encode right view.rightArgument) := by
  cases direction <;> rfl

/-- One wrapper contraction at a compiled child call. -/
def firstActivation {Label : Type u} (encode : Label → Term) :
    Dispatcher.Tree Label → Term → Term
  | .leaf label, argument =>
      chosen argument (.app (encode label) argument)
  | .node left right, argument =>
      chosen argument
        (.app (fork (compileDispatcher encode left)
          (compileDispatcher encode right)) argument)

@[simp]
theorem contractRoot?_compiledCall
    {Label : Type u} (encode : Label → Term)
    (tree : Dispatcher.Tree Label) (argument : Term) :
    (RouteGrammar.compiledCall encode tree argument).contractRoot? =
      some (firstActivation encode tree argument) := by
  cases tree <;> rfl

/-- Each direction-indexed child address names a genuine saturated redex. -/
theorem forkedChildAddress_contracts
    {Label : Type u} (encode : Label → Term)
    (left right : Dispatcher.Tree Label) (view : ForkedView)
    (direction : Direction) :
    ∃ target,
      (forkedTerm encode left right view).contractAt?
        (forkedChildAddress direction) = some target := by
  cases direction with
  | left =>
      refine ⟨chosen view.outerAudit
        (.app (firstActivation encode left view.leftArgument)
          (RouteGrammar.compiledCall encode right view.rightArgument)), ?_⟩
      cases left <;> rfl
  | right =>
      refine ⟨chosen view.outerAudit
        (.app (RouteGrammar.compiledCall encode left view.leftArgument)
          (firstActivation encode right view.rightArgument)), ?_⟩
      cases right <;> rfl

/--
The exact post-fork term is independent of which child the controller will
enter.  Direction must therefore come from other syntax, not from this node
row itself.
-/
theorem forked_row_direction_erasure
    {Label : Type u} (encode : Label → Term)
    (left right : Dispatcher.Tree Label) (carrier : Term) :
    RouteGrammar.selectedLeft carrier
        (RouteGrammar.compiledCall encode left carrier)
        (RouteGrammar.compiledCall encode right carrier) =
      RouteGrammar.selectedRight carrier
        (RouteGrammar.compiledCall encode left carrier)
        (RouteGrammar.compiledCall encode right carrier) :=
  rfl

/-- The exact scheduler expose-left constructor is accepted as exposed. -/
theorem classifyNode?_routeMutation_exposeLeft
    {Label : Type u} (encode : Label → Term) (carrier : Term)
    {left right : Dispatcher.Tree Label} {route : Dispatcher.Route}
    {label : Label} (_path : Dispatcher.HasRoute left route label) :
    classifyNode? encode left right
        (chosen carrier (.app
          (fork (compileDispatcher encode left)
            (compileDispatcher encode right)) carrier)) =
      some (.exposed ⟨carrier, carrier⟩) := by
  simpa [exposedTerm] using
    classifyNode?_exposed encode left right ⟨carrier, carrier⟩

/-- The exact scheduler expose-right constructor is accepted identically. -/
theorem classifyNode?_routeMutation_exposeRight
    {Label : Type u} (encode : Label → Term) (carrier : Term)
    {left right : Dispatcher.Tree Label} {route : Dispatcher.Route}
    {label : Label} (_path : Dispatcher.HasRoute right route label) :
    classifyNode? encode left right
        (chosen carrier (.app
          (fork (compileDispatcher encode left)
            (compileDispatcher encode right)) carrier)) =
      some (.exposed ⟨carrier, carrier⟩) := by
  simpa [exposedTerm] using
    classifyNode?_exposed encode left right ⟨carrier, carrier⟩

/-- Both exact scheduler select constructors are accepted as the same row. -/
theorem classifyNode?_routeMutation_select
    {Label : Type u} (encode : Label → Term) (carrier : Term)
    (left right : Dispatcher.Tree Label) :
    classifyNode? encode left right
        (RouteGrammar.selectedLeft carrier
          (RouteGrammar.compiledCall encode left carrier)
          (RouteGrammar.compiledCall encode right carrier)) =
      some (.forked ⟨carrier, carrier, carrier⟩) := by
  simpa [forkedTerm] using!
    classifyNode?_forked encode left right ⟨carrier, carrier, carrier⟩

end PureSFormal.Research.RootResetDispatcherNodeStages
