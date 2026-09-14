import PureSFormal.PureS.Pattern
import PureSFormal.PureS.Arity
import PureSFormal.PureS.Dispatcher
import PureSFormal.PureS.RouteGrammar

/-!
# Executable activated-route parser

The parser receives the fixed dispatcher tree and a bare pure-S term.  It
checks only registered constructor positions, exact child-subtree arities,
and the fixed compiled code of a dormant sibling.  Audit arguments are
extracted only so the soundness proof can rebuild the grammar witness; no two
audits are compared.

The leaf response remains unrestricted, exactly as in
`RouteGrammar.ActivatedRoute`.  Validation of a completed selected action is
a later layer.
-/

namespace PureSFormal.PureS

namespace RouteParser

/-- Declarative shape of `Chosen(_,_)`. -/
def chosenPattern : Pattern :=
  .app (.app .s .hole) .hole

/-- Declarative shape of a selected node with its displayed two-child fork. -/
def selectedNodePattern : Pattern :=
  .app (.app .s .hole) (.app .hole .hole)

structure ChosenView where
  audit : Term
  response : Term
  deriving BEq, DecidableEq, Repr

structure NodeView where
  audit : Term
  leftChild : Term
  rightChild : Term
  deriving BEq, DecidableEq, Repr

/-- Decompose exactly one `Chosen` wrapper. -/
def unpackChosen? : Term → Option ChosenView
  | .app (.app .s audit) response => some ⟨audit, response⟩
  | _ => none

/-- Decompose exactly one `Chosen` wrapper whose response is a binary fork. -/
def unpackSelectedNode? : Term → Option NodeView
  | .app (.app .s audit) (.app leftChild rightChild) =>
      some ⟨audit, leftChild, rightChild⟩
  | _ => none

/-- Recover the audit of an exact fixed compiled dormant call. -/
def compiledCallAudit? {Label : Type u}
    (encode : Label → Term) (tree : Dispatcher.Tree Label) : Term → Option Term
  | .app code audit =>
      if code = compileDispatcher encode tree then some audit else none
  | .s => none

inductive SelectedBranch where
  | left
  | right
  deriving BEq, DecidableEq, Repr

/--
Classify the two exact child subtrees by the registered `(2,3)` or `(3,2)`
arity pair.  Every other pair is rejected.
-/
def classifyChildren (leftChild rightChild : Term) : Option SelectedBranch :=
  if Term.exactHeadArity leftChild 2 && Term.exactHeadArity rightChild 3 then
    some .left
  else if Term.exactHeadArity leftChild 3 && Term.exactHeadArity rightChild 2 then
    some .right
  else
    none

@[simp]
theorem matchesBool_chosenPattern (audit response : Term) :
    chosenPattern.matchesBool (chosen audit response) = true := rfl

@[simp]
theorem matchesBool_selectedNodePattern
    (audit leftChild rightChild : Term) :
    selectedNodePattern.matchesBool
      (chosen audit (.app leftChild rightChild)) = true := rfl

@[simp]
theorem unpackChosen?_chosen (audit response : Term) :
    unpackChosen? (chosen audit response) = some ⟨audit, response⟩ := rfl

@[simp]
theorem unpackSelectedNode?_chosen
    (audit leftChild rightChild : Term) :
    unpackSelectedNode? (chosen audit (.app leftChild rightChild)) =
      some ⟨audit, leftChild, rightChild⟩ := rfl

theorem unpackChosen?_sound
    {term : Term} {view : ChosenView}
    (h : unpackChosen? term = some view) :
    term = chosen view.audit view.response := by
  cases view with
  | mk audit response =>
      cases term with
      | s => simp [unpackChosen?] at h
      | app fn arg =>
          cases fn with
          | s => simp [unpackChosen?] at h
          | app head actualAudit =>
              cases head with
              | s =>
                  simp only [unpackChosen?, Option.some.injEq, ChosenView.mk.injEq]
                    at h
                  rcases h with ⟨rfl, rfl⟩
                  rfl
              | app headFn headArg => simp [unpackChosen?] at h

theorem unpackSelectedNode?_sound
    {term : Term} {view : NodeView}
    (h : unpackSelectedNode? term = some view) :
    term = chosen view.audit (.app view.leftChild view.rightChild) := by
  cases view with
  | mk audit leftChild rightChild =>
      cases term with
      | s => simp [unpackSelectedNode?] at h
      | app fn response =>
          cases fn with
          | s => simp [unpackSelectedNode?] at h
          | app head actualAudit =>
              cases head with
              | s =>
                  cases response with
                  | s => simp [unpackSelectedNode?] at h
                  | app actualLeft actualRight =>
                      simp only [unpackSelectedNode?, Option.some.injEq,
                        NodeView.mk.injEq] at h
                      rcases h with ⟨rfl, rfl, rfl⟩
                      rfl
              | app headFn headArg => simp [unpackSelectedNode?] at h

@[simp]
theorem compiledCallAudit?_compiledCall
    {Label : Type u} (encode : Label → Term)
    (tree : Dispatcher.Tree Label) (audit : Term) :
    compiledCallAudit? encode tree
      (RouteGrammar.compiledCall encode tree audit) = some audit := by
  simp [RouteGrammar.compiledCall, compiledCallAudit?]

theorem compiledCallAudit?_sound
    {Label : Type u} {encode : Label → Term} {tree : Dispatcher.Tree Label}
    {term audit : Term}
    (h : compiledCallAudit? encode tree term = some audit) :
    term = RouteGrammar.compiledCall encode tree audit := by
  cases term with
  | s => simp [compiledCallAudit?] at h
  | app code actualAudit =>
      simp only [compiledCallAudit?] at h
      split at h
      next hcode =>
        have haudit : actualAudit = audit := Option.some.inj h
        rw [hcode, haudit]
        rfl
      next hcode => contradiction

theorem classifyChildren_left
    {Label : Type u} {encode : Label → Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    {response active : Term}
    (hactive : RouteGrammar.ActivatedRoute encode tree route label response active)
    (dormantTree : Dispatcher.Tree Label) (dormantAudit : Term) :
    classifyChildren active
      (RouteGrammar.compiledCall encode dormantTree dormantAudit) =
        some .left := by
  simp [classifyChildren, Term.exactHeadArity,
    hactive.result_headArity, RouteGrammar.compiledCall_headArity,
    Bool.true_and]

theorem classifyChildren_right
    {Label : Type u} {encode : Label → Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    {response active : Term}
    (hactive : RouteGrammar.ActivatedRoute encode tree route label response active)
    (dormantTree : Dispatcher.Tree Label) (dormantAudit : Term) :
    classifyChildren
      (RouteGrammar.compiledCall encode dormantTree dormantAudit) active =
        some .right := by
  simp [classifyChildren, Term.exactHeadArity,
    RouteGrammar.compiledCall_headArity, hactive.result_headArity,
    Bool.false_and, Bool.true_and]

/-- Parse a bare activated-route term and recover its route and leaf label. -/
def parse {Label : Type u} (encode : Label → Term) :
    (tree : Dispatcher.Tree Label) → Term →
      Option (Dispatcher.Route × Label)
  | .leaf label, result =>
      if chosenPattern.matchesBool result then
        match unpackChosen? result with
        | some _ => some ([], label)
        | none => none
      else
        none
  | .node left right, result =>
      if selectedNodePattern.matchesBool result then
        match unpackSelectedNode? result with
        | none => none
        | some fields =>
            match classifyChildren fields.leftChild fields.rightChild with
            | none => none
            | some .left =>
                match parse encode left fields.leftChild with
                | none => none
                | some (route, label) =>
                    match compiledCallAudit? encode right fields.rightChild with
                    | none => none
                    | some _ => some (.left :: route, label)
            | some .right =>
                match compiledCallAudit? encode left fields.leftChild with
                | none => none
                | some _ =>
                    match parse encode right fields.rightChild with
                    | none => none
                    | some (route, label) => some (.right :: route, label)
      else
        none

/-- Successful parsing yields a mutation-closed activated-route witness. -/
theorem parse_sound
    {Label : Type u} {encode : Label → Term}
    {tree : Dispatcher.Tree Label} {result : Term}
    {route : Dispatcher.Route} {label : Label}
    (h : parse encode tree result = some (route, label)) :
    ∃ response,
      RouteGrammar.ActivatedRoute encode tree route label response result := by
  induction tree generalizing result route label with
  | leaf stored =>
      simp only [parse] at h
      split at h
      next hpattern =>
        generalize hunpack : unpackChosen? result = view? at h
        cases view? with
        | none => contradiction
        | some view =>
            cases h
            have hshape := unpackChosen?_sound hunpack
            cases view with
            | mk audit response =>
                refine ⟨response, ?_⟩
                rw [hshape]
                exact .leaf stored audit response
      next hpattern => contradiction
  | node left right leftIH rightIH =>
      simp only [parse] at h
      split at h
      next hpattern =>
        generalize hunpack : unpackSelectedNode? result = view? at h
        cases view? with
        | none => contradiction
        | some view =>
            cases view with
            | mk outerAudit leftChild rightChild =>
                simp only at h
                generalize hbranch : classifyChildren leftChild rightChild = branch? at h
                cases branch? with
                | none => contradiction
                | some branch =>
                    cases branch with
                    | left =>
                        simp only at h
                        generalize hinner : parse encode left leftChild = parsed? at h
                        cases parsed? with
                        | none => contradiction
                        | some parsed =>
                            cases parsed with
                            | mk innerRoute innerLabel =>
                                simp only at h
                                generalize hdormant :
                                  compiledCallAudit? encode right rightChild = audit? at h
                                cases audit? with
                                | none => contradiction
                                | some dormantAudit =>
                                    cases h
                                    obtain ⟨response, inner⟩ :=
                                      leftIH hinner
                                    have hshape := unpackSelectedNode?_sound hunpack
                                    have hdormantShape :=
                                      compiledCallAudit?_sound hdormant
                                    refine ⟨response, ?_⟩
                                    rw [hshape, hdormantShape]
                                    exact .left outerAudit dormantAudit inner
                    | right =>
                        simp only at h
                        generalize hdormant :
                          compiledCallAudit? encode left leftChild = audit? at h
                        cases audit? with
                        | none => contradiction
                        | some dormantAudit =>
                            simp only at h
                            generalize hinner : parse encode right rightChild = parsed? at h
                            cases parsed? with
                            | none => contradiction
                            | some parsed =>
                                cases parsed with
                                | mk innerRoute innerLabel =>
                                    cases h
                                    obtain ⟨response, inner⟩ :=
                                      rightIH hinner
                                    have hshape := unpackSelectedNode?_sound hunpack
                                    have hdormantShape :=
                                      compiledCallAudit?_sound hdormant
                                    refine ⟨response, ?_⟩
                                    rw [hshape, hdormantShape]
                                    exact .right outerAudit dormantAudit inner
      next hpattern => contradiction

/-- Every generated mutation-closed activated route is accepted exactly. -/
theorem parse_complete
    {Label : Type u} {encode : Label → Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    {response result : Term}
    (h : RouteGrammar.ActivatedRoute encode tree route label response result) :
    parse encode tree result = some (route, label) := by
  induction h with
  | leaf label audit response =>
      rfl
  | @left left right route label response active outerAudit dormantAudit inner ih =>
      simp only [parse, RouteGrammar.selectedLeft,
        matchesBool_selectedNodePattern, if_true,
        unpackSelectedNode?_chosen, classifyChildren_left inner right dormantAudit,
        ih, compiledCallAudit?_compiledCall]
  | @right left right route label response active outerAudit dormantAudit inner ih =>
      simp only [parse, RouteGrammar.selectedRight,
        matchesBool_selectedNodePattern, if_true,
        unpackSelectedNode?_chosen, classifyChildren_right inner left dormantAudit,
        compiledCallAudit?_compiledCall, ih]

/-- A successful parse has a unique returned route-label pair. -/
theorem parse_deterministic
    {Label : Type u} {encode : Label → Term}
    {tree : Dispatcher.Tree Label} {result : Term}
    {route₁ route₂ : Dispatcher.Route} {label₁ label₂ : Label}
    (h₁ : parse encode tree result = some (route₁, label₁))
    (h₂ : parse encode tree result = some (route₂, label₂)) :
    route₁ = route₂ ∧ label₁ = label₂ := by
  rw [h₁] at h₂
  have hpairs := Option.some.inj h₂
  cases hpairs
  exact ⟨rfl, rfl⟩

/-- One generated bare route term determines its route and label uniquely. -/
theorem generated_route_unique
    {Label : Type u} {encode : Label → Term}
    {tree : Dispatcher.Tree Label} {result : Term}
    {route₁ route₂ : Dispatcher.Route} {label₁ label₂ : Label}
    {response₁ response₂ : Term}
    (h₁ : RouteGrammar.ActivatedRoute encode tree route₁ label₁ response₁ result)
    (h₂ : RouteGrammar.ActivatedRoute encode tree route₂ label₂ response₂ result) :
    route₁ = route₂ ∧ label₁ = label₂ :=
  parse_deterministic (parse_complete h₁) (parse_complete h₂)

end RouteParser

end PureSFormal.PureS
