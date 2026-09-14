import PureSFormal.PureS.SchedulerResponse

set_option backward.isDefEq.respectTransparency false

/-!
# Contraction-sampled FRAME/DISPATCH response invariant

The fixed response is audited at the granularity of individual `Rdx`
instructions.  Route progress is indexed by the actual dispatcher route and
appender progress is indexed by the unconsumed emitted word.  Consequently
the parser failures below are structural theorems, not bounded fixtures.
-/

namespace PureSFormal.PureS

namespace SchedulerResponseInvariant

open FiniteController SchedulerControl SchedulerInvariant

abbrev Configuration (program : CTS.Program)
    (dispatcher : ActionDispatcher program) :=
  FiniteController.Configuration (SchedulerControl.Control program dispatcher)

/-! ## Mutation-closed route progress -/

/-- One dispatcher-field term immediately after a route-selection contraction.
`done` is true only for the selected leaf contraction. -/
inductive RouteMutation {Label : Type} (encode : Label → Term)
    (carrier : Term) :
    (tree : Dispatcher.Tree Label) → Dispatcher.Route → Label →
      Bool → Term → Prop where
  | leaf (label : Label) :
      RouteMutation encode carrier (.leaf label) [] label true
        (chosen carrier (.app (encode label) carrier))
  | exposeLeft {left right route label}
      (path : Dispatcher.HasRoute left route label) :
      RouteMutation encode carrier (.node left right) (.left :: route) label
        false
        (chosen carrier (.app
          (fork (compileDispatcher encode left) (compileDispatcher encode right))
          carrier))
  | selectLeft {left right route label}
      (path : Dispatcher.HasRoute left route label) :
      RouteMutation encode carrier (.node left right) (.left :: route) label
        false
        (RouteGrammar.selectedLeft carrier
          (RouteGrammar.compiledCall encode left carrier)
          (RouteGrammar.compiledCall encode right carrier))
  | innerLeft {left right route label done inner}
      (progress : RouteMutation encode carrier left route label done inner) :
      RouteMutation encode carrier (.node left right) (.left :: route) label done
        (RouteGrammar.selectedLeft carrier inner
          (RouteGrammar.compiledCall encode right carrier))
  | exposeRight {left right route label}
      (path : Dispatcher.HasRoute right route label) :
      RouteMutation encode carrier (.node left right) (.right :: route) label
        false
        (chosen carrier (.app
          (fork (compileDispatcher encode left) (compileDispatcher encode right))
          carrier))
  | selectRight {left right route label}
      (path : Dispatcher.HasRoute right route label) :
      RouteMutation encode carrier (.node left right) (.right :: route) label
        false
        (RouteGrammar.selectedRight carrier
          (RouteGrammar.compiledCall encode left carrier)
          (RouteGrammar.compiledCall encode right carrier))
  | innerRight {left right route label done inner}
      (progress : RouteMutation encode carrier right route label done inner) :
      RouteMutation encode carrier (.node left right) (.right :: route) label done
        (RouteGrammar.selectedRight carrier
          (RouteGrammar.compiledCall encode left carrier) inner)

namespace RouteMutation

theorem headArity
    {Label : Type} {encode : Label → Term} {carrier : Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    {done : Bool} {term : Term}
    (progress : RouteMutation encode carrier tree route label done term) :
    term.headArity = 2 := by
  cases progress <;> rfl

/-- Before the leaf row the executable route parser rejects; at the leaf row
the exact mutation-closed activated route is present. -/
theorem parser
    {Label : Type} {encode : Label → Term} {carrier : Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    {done : Bool} {term : Term} (carrierNot3 : carrier.headArity ≠ 3)
    (progress : RouteMutation encode carrier tree route label done term) :
    (done = false → RouteParser.parse encode tree term = none) ∧
    (done = true → RouteGrammar.ActivatedRoute encode tree route label
      (.app (encode label) carrier) term) := by
  induction progress with
  | leaf label => exact ⟨by simp, fun _ => .leaf label carrier _⟩
  | exposeLeft path =>
      exact ⟨fun _ => by simp [RouteParser.parse, RouteParser.classifyChildren,
        Term.exactHeadArity, carrierNot3], by simp⟩
  | @selectLeft left right route label path =>
      constructor
      · intro _
        cases left <;> cases right <;> rfl
      · simp
  | innerLeft progress ih =>
      constructor
      · intro doneEq
        have innerNone := ih.1 doneEq
        have innerArity := progress.headArity
        simp only [RouteParser.parse, RouteGrammar.selectedLeft,
          RouteParser.matchesBool_selectedNodePattern, if_true,
          RouteParser.unpackSelectedNode?_chosen]
        simp [RouteParser.classifyChildren, Term.exactHeadArity, innerArity,
          innerNone]
      · intro doneEq
        exact .left carrier carrier (ih.2 doneEq)
  | exposeRight path =>
      exact ⟨fun _ => by simp [RouteParser.parse, RouteParser.classifyChildren,
        Term.exactHeadArity, carrierNot3], by simp⟩
  | @selectRight left right route label path =>
      constructor
      · intro _
        cases left <;> cases right <;> rfl
      · simp
  | innerRight progress ih =>
      constructor
      · intro doneEq
        have innerNone := ih.1 doneEq
        have innerArity := progress.headArity
        simp only [RouteParser.parse, RouteGrammar.selectedRight,
          RouteParser.matchesBool_selectedNodePattern, if_true,
          RouteParser.unpackSelectedNode?_chosen]
        simp [RouteParser.classifyChildren, Term.exactHeadArity, innerArity,
          innerNone]
      · intro doneEq
        exact .right carrier carrier (ih.2 doneEq)

/-- The unique done mutation is the literal route compiler endpoint, not merely
some permissive activated-route inhabitant. -/
theorem done_eq
    {Label : Type} {encode : Label → Term} {carrier : Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    {done : Bool} {term : Term}
    (progress : RouteMutation encode carrier tree route label done term)
    (doneEq : done = true) :
    term = PrimitiveRoute.withResponse encode tree route carrier
      (.app (encode label) carrier) := by
  induction progress with
  | leaf label => rfl
  | exposeLeft path => simp at doneEq
  | selectLeft path => simp at doneEq
  | innerLeft progress ih =>
      simp only [PrimitiveRoute.withResponse, RouteGrammar.selectedLeft]
      rw [ih doneEq]
  | exposeRight path => simp at doneEq
  | selectRight path => simp at doneEq
  | innerRight progress ih =>
      simp only [PrimitiveRoute.withResponse, RouteGrammar.selectedRight]
      rw [ih doneEq]

end RouteMutation

/-! ## Mutation-closed appender progress -/

/-- Term after the first contraction of one `Push` layer. -/
def pushFirst (bit : Bool) (rest : List Bool) (initial : Term) : Term :=
  .app (.app (.app .s (appender rest)) initial) (.app (live bit) initial)

/-- Term after the second contraction of one `Push` layer. -/
def pushSecond (bit : Bool) (rest : List Bool) (initial : Term) : Term :=
  .app (.app (appender rest) (extendAccumulator bit initial))
    (pushHistory bit initial)

/-- One action-field term immediately after an appender contraction.
`outer` is the exact list of already retained histories. -/
inductive ActionMutation (expected : Nat) :
    List Bool → Term → List Term → Bool → Term → Prop where
  | first (bit rest initial outer)
      (count : expected = (bit :: rest).length + outer.length) :
      ActionMutation expected (bit :: rest) initial outer false
        (Term.applyArgs (pushFirst bit rest initial) outer)
  | second (bit rest initial outer)
      (count : expected = (bit :: rest).length + outer.length) :
      ActionMutation expected (bit :: rest) initial outer rest.isEmpty
        (Term.applyArgs (pushSecond bit rest initial) outer)
  | inner {bit rest initial outer done term}
      (progress : ActionMutation expected rest (extendAccumulator bit initial)
        (pushHistory bit initial :: outer) done term) :
      ActionMutation expected (bit :: rest) initial outer done term

namespace ActionMutation

theorem appender_ne_s (bits : List Bool) : appender bits ≠ .s := by
  cases bits <;> simp [appender, p, push]

theorem appender_ne_b (bits : List Bool) : appender bits ≠ b := by
  cases bits with
  | nil => simp [appender, p, b]
  | cons bit rest => simp [appender, push, b, appender_ne_s rest]

/-- Every proper appender mutation is rejected by the exact action parser;
the unique final mutation has the exact expected public spine. -/
theorem parser
    {expected : Nat} {remaining : List Bool} {initial : Term}
    {outer : List Term} {done : Bool} {term : Term}
    (progress : ActionMutation expected remaining initial outer done term) :
    (done = false → ActionParser.parseSpine? expected term.spineArgs = none) ∧
    (done = true → ∃ accumulator histories,
      ActionParser.parseSpine? expected term.spineArgs =
        some ⟨accumulator, histories⟩) := by
  induction progress with
  | first bit rest initial outer count =>
      constructor
      · intro _
        rw [Term.spineArgs_applyArgs]
        simp [pushFirst, ActionParser.parseSpine?, appender_ne_b]
      · simp
  | second bit rest initial outer count =>
      constructor
      · intro emptyFalse
        cases rest with
        | nil => simp at emptyFalse
        | cons next tail =>
            rw [Term.spineArgs_applyArgs]
            simp [pushSecond, ActionParser.parseSpine?, appender_cons, push, p,
              b, appender_ne_s tail, count]
      · intro emptyTrue
        cases rest with
        | nil =>
            refine ⟨extendAccumulator bit initial,
              pushHistory bit initial :: outer, ?_⟩
            rw [Term.spineArgs_applyArgs]
            simp [pushSecond, ActionParser.parseSpine?, count, p, b,
              Nat.add_comm]
        | cons next tail => simp at emptyTrue
  | inner progress ih => exact ih

/-- The done action term is exactly `appenderResult`, including every retained
history in its literal order. -/
theorem done_eq
    {expected : Nat} {remaining : List Bool} {initial : Term}
    {outer : List Term} {done : Bool} {term : Term}
    (progress : ActionMutation expected remaining initial outer done term)
    (doneEq : done = true) :
    term = Term.applyArgs (appenderResult remaining initial) outer := by
  induction progress with
  | first bit rest initial outer count => simp at doneEq
  | second bit rest initial outer count =>
      cases rest with
      | nil => rfl
      | cons next tail => simp at doneEq
  | inner progress ih =>
      rw [ih doneEq]
      simp only [appenderResult_cons, Term.applyArgs]

end ActionMutation

/-! ## All response-root mutation shapes -/

def frameFirstRoot (actions : Term) (bits : List Bool)
    (continuation carrier : Term) : Term :=
  .app (.app (dispatcherCode actions bits) carrier)
    (.app continuation carrier)

def frameSecondRoot (actions : Term) (bits : List Bool)
    (continuation carrier : Term) : Term :=
  .app
    (.app (.app (actCode actions) carrier) (.app (seedCode bits) carrier))
    (.app continuation carrier)

/-- Exact bare root after any one of the response's contractions.  The
constructors cover the three frame rows, every route row, and every appender
row. -/
inductive ResponseRootMutation
    (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    {route : Dispatcher.Route} {label : ActionLabel program}
    (path : Dispatcher.HasRoute tree route label)
    (bits : List Bool) (continuation carrier : Term) :
    Bool → Term → Prop where
  | frameFirst : ResponseRootMutation program tree path bits continuation carrier
      false (frameFirstRoot (compileActions program tree) bits continuation carrier)
  | frameSecond : ResponseRootMutation program tree path bits continuation carrier
      false (frameSecondRoot (compileActions program tree) bits continuation carrier)
  | frameThird : ResponseRootMutation program tree path bits continuation carrier
      false (freshLocal (compileActions program tree) bits continuation carrier)
  | routeIncomplete {term : Term}
      (progress : RouteMutation (selectedAction program) carrier tree route label
        false term) :
      ResponseRootMutation program tree path bits continuation carrier false
        (Carrier.activeShell bits continuation (freshHField carrier) term
          carrier carrier)
  | routeCompleteEmpty {term : Term}
      (progress : RouteMutation (selectedAction program) carrier tree route label
        true term)
      (empty : PrimitiveLocalResponse.emitted program label = []) :
      ResponseRootMutation program tree path bits continuation carrier true
        (Carrier.activeShell bits continuation (freshHField carrier) term
          carrier carrier)
  | routeCompleteNonempty {term : Term} (first : Bool) (rest : List Bool)
      (progress : RouteMutation (selectedAction program) carrier tree route label
        true term)
      (nonempty : PrimitiveLocalResponse.emitted program label = first :: rest) :
      ResponseRootMutation program tree path bits continuation carrier false
        (Carrier.activeShell bits continuation (freshHField carrier) term
          carrier carrier)
  | action {actionTerm : Term} {done : Bool}
      (progress : ActionMutation
        (PrimitiveLocalResponse.emitted program label).length
        (PrimitiveLocalResponse.emitted program label) carrier [] done actionTerm) :
      ResponseRootMutation program tree path bits continuation carrier done
        (Carrier.activeShell bits continuation (freshHField carrier)
          (PrimitiveRoute.withResponse (selectedAction program) tree route carrier
            actionTerm) carrier carrier)

namespace ResponseRootMutation

theorem carrier_headArity_ne_three
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation carrier : Term}
    (hadmissible : Carrier.Admissible continuation)
    (snapshotInv : ReachableAudit.Holds program tree bits continuation carrier) :
    carrier.headArity ≠ 3 := by
  have arity := snapshotInv.wholeCarrierAudit hadmissible
  rcases arity with five | six
  · rw [five]
    decide
  · rw [six]
    decide

def openFreshShape
    (program : CTS.Program) (bits : List Bool)
    (continuation carrier dispatch : Term) :
    CheckpointExclusion.OpenLocalShape program
      (Carrier.activeShell bits continuation (freshHField carrier) dispatch
        carrier carrier) :=
  ⟨.fresh, freshHField carrier, dispatch, word bits, carrier, continuation,
    carrier, .fresh carrier, rfl⟩

/-- Every nonfinal contraction is rejected by the decoder at the active
endpoint, proved by the corresponding frame/route/action grammar failure. -/
theorem failure
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program}
    {bits : List Bool} {continuation carrier term : Term}
    {done : Bool} (hadmissible : Carrier.Admissible continuation)
    (snapshotInv : ReachableAudit.Holds program tree bits continuation carrier)
    {path : Dispatcher.HasRoute tree route label}
    (sample : ResponseRootMutation program tree path bits continuation carrier
      done term) (doneEq : done = false) :
    CheckpointExclusion.EndpointFailure program tree term := by
  have carrierNot3 := carrier_headArity_ne_three hadmissible snapshotInv
  cases sample with
  | frameFirst =>
      constructor
      · simp [frameFirstRoot, CheckpointDecoder.parseGenerator?,
          CheckpointDecoder.parseCarrier?, CheckpointDecoder.openEnvironment,
          dispatcherCode, actCode, seedCode]
      · apply CheckpointDecoder.parseLocal?_none_of_headArity program tree
        · simp [frameFirstRoot, dispatcherCode]
        · simp [frameFirstRoot, dispatcherCode]
      · simp [frameFirstRoot, CheckpointDecoder.parseTerminal?,
          CheckpointDecoder.parseCarrier?, CheckpointDecoder.openEnvironment,
          dispatcherCode, actCode, seedCode]
  | frameSecond =>
      constructor
      · simp [frameSecondRoot, CheckpointDecoder.parseGenerator?,
          CheckpointDecoder.parseCarrier?, CheckpointDecoder.openEnvironment,
          actCode, seedCode]
      · cases tree <;> rfl
      · simp [frameSecondRoot, CheckpointDecoder.parseTerminal?,
          CheckpointDecoder.parseCarrier?, CheckpointDecoder.openEnvironment,
          actCode, seedCode]
  | frameThird =>
      apply (CheckpointExclusion.PreDispatchShape.mk
        (openFreshShape program bits continuation carrier
          (.app (compileActions program tree) carrier)) ?_).failure
      cases tree <;> rfl
  | @routeIncomplete term progress =>
      apply (CheckpointExclusion.PreDispatchShape.mk
        (openFreshShape program bits continuation carrier term) ?_).failure
      simp [openFreshShape, DispatchParser.parseRouteDetailed,
        (progress.parser carrierNot3).1 rfl]
  | routeCompleteEmpty progress empty => simp at doneEq
  | @routeCompleteNonempty term first rest progress nonempty =>
      let detailed : DispatchParser.DetailedRoute (ActionLabel program) :=
        ⟨route, label, .app (selectedAction program label) carrier⟩
      have routeEq : DispatchParser.parseRouteDetailed
          (selectedAction program) tree term = some detailed :=
        DispatchParser.parseRouteDetailed_complete
          ((progress.parser carrierNot3).2 rfl)
      have actionNone : ActionParser.parse program detailed.label
          detailed.response = none := by
        dsimp [detailed]
        rw [show selectedAction program label = appender (first :: rest) by
              rw [← nonempty]
              exact PrimitiveLocalResponse.selectedAction_eq_appender program label]
        rcases label with ⟨phase, bit⟩
        cases bit with
        | false => simp [PrimitiveLocalResponse.emitted] at nonempty
        | true => cases rest <;> rfl
      exact (CheckpointExclusion.PreActionShape.mk
        (openFreshShape program bits continuation carrier term)
        detailed routeEq actionNone).failure
  | @action actionTerm done progress =>
      let detailed : DispatchParser.DetailedRoute (ActionLabel program) :=
        ⟨route, label, actionTerm⟩
      have routeEq : DispatchParser.parseRouteDetailed
          (selectedAction program) tree
          (PrimitiveRoute.withResponse (selectedAction program) tree route carrier
            actionTerm) = some detailed :=
        DispatchParser.parseRouteDetailed_complete
          (PrimitiveRoute.withResponse_activated path carrier actionTerm)
      have actionNone : ActionParser.parse program detailed.label
          detailed.response = none := by
        dsimp [detailed]
        unfold ActionParser.parse
        have expectedEq : ActionParser.historyCount program label =
            (PrimitiveLocalResponse.emitted program label).length := by
          rcases label with ⟨phase, bit⟩
          cases bit <;> rfl
        rw [expectedEq]
        exact progress.parser.1 doneEq
      exact (CheckpointExclusion.PreActionShape.mk
        (openFreshShape program bits continuation carrier
          (PrimitiveRoute.withResponse (selectedAction program) tree route carrier
            actionTerm)) detailed routeEq actionNone).failure

/-- The unique final response mutation is the exact completed Local root. -/
theorem done_eq
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program}
    {bits : List Bool} {continuation carrier term : Term}
    {done : Bool} {path : Dispatcher.HasRoute tree route label}
    (sample : ResponseRootMutation program tree path bits continuation carrier
      done term) (doneEq : done = true) :
    term = LocalResponse.completed bits continuation carrier
      (PrimitiveLocalResponse.completedRoute program tree route label carrier) := by
  cases sample with
  | frameFirst => simp at doneEq
  | frameSecond => simp at doneEq
  | frameThird => simp at doneEq
  | routeIncomplete progress => simp at doneEq
  | routeCompleteEmpty progress empty =>
      rw [progress.done_eq rfl]
      simp [LocalResponse.completed, PrimitiveLocalResponse.completedRoute,
        PrimitiveLocalResponse.selectedAction_eq_appender, empty]
  | routeCompleteNonempty progress first rest nonempty => simp at doneEq
  | action progress =>
      rw [progress.done_eq doneEq]
      simp [PrimitiveLocalResponse.completedRoute, LocalResponse.completed,
        PrimitiveLocalResponse.actionResult_eq_appenderResult]

/-- Every response sample retains the original audited carrier at the literal
right-argument child of the continuation call. -/
theorem carrier_subterm
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program}
    {bits : List Bool} {continuation carrier term : Term}
    {done : Bool} {path : Dispatcher.HasRoute tree route label}
    (sample : ResponseRootMutation program tree path bits continuation carrier
      done term) :
    term.subterm? [.right, .right] = some carrier := by
  cases sample with
  | frameFirst => simp [frameFirstRoot, Term.subterm?]
  | frameSecond => simp [frameSecondRoot, Term.subterm?]
  | frameThird =>
      simp [freshLocal, Term.applyArgs, Term.subterm?]
  | routeIncomplete progress =>
      simp [Carrier.activeShell, Carrier.shell, Term.subterm?]
  | routeCompleteEmpty progress empty =>
      simp [Carrier.activeShell, Carrier.shell, Term.subterm?]
  | routeCompleteNonempty progress first rest nonempty =>
      simp [Carrier.activeShell, Carrier.shell, Term.subterm?]
  | action progress =>
      simp [Carrier.activeShell, Carrier.shell, Term.subterm?]

/-- Turn the retained literal carrier into the scheduler's context-based audit
witness. -/
theorem auditedOccurrence
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program}
    {bits : List Bool} {continuation carrier term : Term}
    {done : Bool} {path : Dispatcher.HasRoute tree route label}
    (sample : ResponseRootMutation program tree path bits continuation carrier
      done term)
    (snapshotInv : ReachableAudit.Holds program tree bits continuation carrier)
    (parents : List ParentFrame) :
    AuditedOccurrence program tree (Cursor.rebuild parents term) := by
  obtain ⟨inner, rootEq, _⟩ := Term.context_of_subterm sample.carrier_subterm
  refine .intro bits continuation carrier
    ((contextOfParents parents).comp inner) snapshotInv ?_
  rw [Context.plug_comp, ← rootEq, contextOfParents_plug]

end ResponseRootMutation

/-! ## Structural enumeration of every response contraction -/

/-- Quotient-free inversion of membership in a mapped list. -/
theorem exists_of_mem_map_clean (function : α → β) {result : β} :
    ∀ {values : List α}, result ∈ values.map function →
      ∃ value, value ∈ values ∧ function value = result
  | [], membership => by cases membership
  | first :: rest, membership => by
      change result ∈ function first :: rest.map function at membership
      cases membership with
      | head => exact ⟨first, List.Mem.head rest, rfl⟩
      | tail _ tailMembership =>
          obtain ⟨value, valueMembership, equality⟩ :=
            exists_of_mem_map_clean function tailMembership
          exact ⟨value, List.Mem.tail first valueMembership, equality⟩

/-- The exact route-field root after every dispatcher contraction, in runtime
order.  The Boolean component marks only the leaf contraction. -/
def routeEntries {Label : Type} (encode : Label → Term) (carrier : Term) :
    Dispatcher.Tree Label → Dispatcher.Route → List (Bool × Term)
  | .leaf label, [] =>
      [(true, chosen carrier (.app (encode label) carrier))]
  | .leaf _, _ :: _ => []
  | .node _ _, [] => []
  | .node left right, .left :: route =>
      (false, chosen carrier (.app
        (fork (compileDispatcher encode left) (compileDispatcher encode right))
        carrier)) ::
      (false, RouteGrammar.selectedLeft carrier
        (RouteGrammar.compiledCall encode left carrier)
        (RouteGrammar.compiledCall encode right carrier)) ::
      (routeEntries encode carrier left route).map fun entry =>
        (entry.1, RouteGrammar.selectedLeft carrier entry.2
          (RouteGrammar.compiledCall encode right carrier))
  | .node left right, .right :: route =>
      (false, chosen carrier (.app
        (fork (compileDispatcher encode left) (compileDispatcher encode right))
        carrier)) ::
      (false, RouteGrammar.selectedRight carrier
        (RouteGrammar.compiledCall encode left carrier)
        (RouteGrammar.compiledCall encode right carrier)) ::
      (routeEntries encode carrier right route).map fun entry =>
        (entry.1, RouteGrammar.selectedRight carrier
          (RouteGrammar.compiledCall encode left carrier) entry.2)

@[simp] theorem routeEntries_length
    {Label : Type} (encode : Label → Term) (carrier : Term)
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    (path : Dispatcher.HasRoute tree route label) :
    (routeEntries encode carrier tree route).length = 2 * route.length + 1 := by
  induction path with
  | leaf => rfl
  | left path ih => simp [routeEntries, ih, Nat.mul_add, Nat.add_assoc]
  | right path ih => simp [routeEntries, ih, Nat.mul_add, Nat.add_assoc]

/-- Membership in `routeEntries` is exactly one of the mutation-closed route
forms.  Thus the list cannot conceal an unchecked route PC. -/
theorem routeEntries_spec
    {Label : Type} {encode : Label → Term} {carrier : Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    (path : Dispatcher.HasRoute tree route label) {done : Bool} {term : Term}
    (member : (done, term) ∈ routeEntries encode carrier tree route) :
    RouteMutation encode carrier tree route label done term := by
  induction path generalizing done term with
  | leaf stored =>
      simp only [routeEntries, List.mem_singleton, Prod.mk.injEq] at member
      rcases member with ⟨rfl, rfl⟩
      exact .leaf stored
  | @left route label left right path ih =>
      simp only [routeEntries, List.mem_cons] at member
      rcases member with first | second | inner
      · rcases first with ⟨rfl, rfl⟩
        exact .exposeLeft path
      · rcases second with ⟨rfl, rfl⟩
        exact .selectLeft path
      · obtain ⟨⟨innerDone, innerTerm⟩, innerMember, equal⟩ :=
          exists_of_mem_map_clean _ inner
        simp only [Prod.mk.injEq] at equal
        rcases equal with ⟨rfl, rfl⟩
        exact .innerLeft (ih innerMember)
  | @right route label left right path ih =>
      simp only [routeEntries, List.mem_cons] at member
      rcases member with first | second | inner
      · rcases first with ⟨rfl, rfl⟩
        exact .exposeRight path
      · rcases second with ⟨rfl, rfl⟩
        exact .selectRight path
      · obtain ⟨⟨innerDone, innerTerm⟩, innerMember, equal⟩ :=
          exists_of_mem_map_clean _ inner
        simp only [Prod.mk.injEq] at equal
        rcases equal with ⟨rfl, rfl⟩
        exact .innerRight (ih innerMember)

/-- The exact action-field root after each `Push` contraction. -/
def actionEntries (expected : Nat) :
    (remaining : List Bool) → (initial : Term) → (outer : List Term) →
      expected = remaining.length + outer.length → List (Bool × Term)
  | [], _, _, _ => []
  | bit :: rest, initial, outer, count =>
      (false, Term.applyArgs (pushFirst bit rest initial) outer) ::
      (rest.isEmpty, Term.applyArgs (pushSecond bit rest initial) outer) ::
      actionEntries expected rest (extendAccumulator bit initial)
        (pushHistory bit initial :: outer) (by
          simpa [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using count)

@[simp] theorem actionEntries_nil (expected : Nat) (initial : Term)
    (outer : List Term) (count : expected = ([] : List Bool).length + outer.length) :
    actionEntries expected [] initial outer count = [] := rfl

@[simp] theorem actionEntries_cons (expected : Nat) (bit : Bool)
    (rest : List Bool) (initial : Term) (outer : List Term)
    (count : expected = (bit :: rest).length + outer.length) :
    actionEntries expected (bit :: rest) initial outer count =
      (false, Term.applyArgs (pushFirst bit rest initial) outer) ::
      (rest.isEmpty, Term.applyArgs (pushSecond bit rest initial) outer) ::
      actionEntries expected rest (extendAccumulator bit initial)
        (pushHistory bit initial :: outer) (by
          simpa [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using! count) := rfl

@[simp] theorem actionEntries_length
    (expected : Nat) (remaining : List Bool) (initial : Term)
    (outer : List Term) (count : expected = remaining.length + outer.length) :
    (actionEntries expected remaining initial outer count).length =
      2 * remaining.length := by
  induction remaining generalizing initial outer with
  | nil => rfl
  | cons bit rest ih =>
      simp only [actionEntries_cons, List.length_cons]
      rw [ih]
      simp [Nat.mul_add]

/-- Every enumerated action entry carries its exact unconsumed-word and
history index, reconstructed structurally from the appendant. -/
theorem actionEntries_spec
    {expected : Nat} (remaining : List Bool) (initial : Term)
    (outer : List Term) (count : expected = remaining.length + outer.length)
    {done : Bool} {term : Term}
    (member : (done, term) ∈
      actionEntries expected remaining initial outer count) :
    ActionMutation expected remaining initial outer done term := by
  induction remaining generalizing initial outer with
  | nil => simp only [actionEntries_nil, List.not_mem_nil] at member
  | cons bit rest ih =>
      simp only [actionEntries_cons, List.mem_cons] at member
      rcases member with first | second | inner
      · rcases first with ⟨rfl, rfl⟩
        exact .first bit rest initial outer count
      · rcases second with ⟨rfl, rfl⟩
        exact .second bit rest initial outer count
      · exact .inner (ih (initial := extendAccumulator bit initial)
          (outer := pushHistory bit initial :: outer) (by
            simpa [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using count)
          inner)

/-- All response-root terms sampled at contractions, in exact execution order.
The final flag is structural: it occurs at the route leaf for an empty
appendant, and at the last Push contraction otherwise. -/
def responseEntries
    (program : CTS.Program) {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program}
    (path : Dispatcher.HasRoute tree route label)
    (bits : List Bool) (continuation carrier : Term) : List (Bool × Term) :=
  let emitted := PrimitiveLocalResponse.emitted program label
  let wrap := fun (entry : Bool × Term) =>
    (entry.1 && emitted.isEmpty,
      Carrier.activeShell bits continuation (freshHField carrier) entry.2
        carrier carrier)
  [(false, frameFirstRoot (compileActions program tree) bits continuation carrier),
   (false, frameSecondRoot (compileActions program tree) bits continuation carrier),
   (false, freshLocal (compileActions program tree) bits continuation carrier)] ++
  (routeEntries (selectedAction program) carrier tree route).map wrap ++
  (actionEntries emitted.length emitted carrier [] (by simp)).map fun entry =>
    (entry.1,
      Carrier.activeShell bits continuation (freshHField carrier)
        (PrimitiveRoute.withResponse (selectedAction program) tree route carrier
          entry.2) carrier carrier)

@[simp] theorem responseEntries_length
    (program : CTS.Program) {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program}
    (path : Dispatcher.HasRoute tree route label)
    (bits : List Bool) (continuation carrier : Term) :
    (responseEntries program path bits continuation carrier).length =
      LocalResponse.completedCost program route label := by
  unfold responseEntries
  simp only [List.length_append, List.length_map, List.length_cons,
    List.length_nil]
  rw [routeEntries_length (selectedAction program) carrier path,
    actionEntries_length]
  unfold LocalResponse.completedCost
  rw [PrimitiveLocalResponse.actionCost_eq]
  simp [Nat.add_assoc]

/-- No contraction sample in the complete structural enumeration lacks its
exact response-root grammar witness. -/
theorem responseEntries_spec
    (program : CTS.Program) {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program}
    (path : Dispatcher.HasRoute tree route label)
    (bits : List Bool) (continuation carrier : Term)
    {done : Bool} {term : Term}
    (member : (done, term) ∈
      responseEntries program path bits continuation carrier) :
    ResponseRootMutation program tree path bits continuation carrier done term := by
  unfold responseEntries at member
  rw [List.mem_append] at member
  rcases member with beforeAction | actionEntry
  · rw [List.mem_append] at beforeAction
    rcases beforeAction with frameEntry | routeEntry
    · simp only [List.mem_cons, List.not_mem_nil, or_false] at frameEntry
      rcases frameEntry with first | second | third
      · rcases first with ⟨rfl, rfl⟩
        exact .frameFirst
      · rcases second with ⟨rfl, rfl⟩
        exact .frameSecond
      · rcases third with ⟨rfl, rfl⟩
        exact .frameThird
    · obtain ⟨⟨routeDone, routeTerm⟩, routeMember, equal⟩ :=
        exists_of_mem_map_clean _ routeEntry
      have progress := routeEntries_spec path routeMember
      by_cases empty : PrimitiveLocalResponse.emitted program label = []
      · have emptyFlag :
            (PrimitiveLocalResponse.emitted program label).isEmpty = true := by
          simp [empty]
        simp only [emptyFlag, Bool.and_true, Prod.mk.injEq] at equal
        rcases equal with ⟨rfl, rfl⟩
        cases routeDone with
        | false => exact .routeIncomplete progress
        | true => exact .routeCompleteEmpty progress empty
      · obtain ⟨first, rest, nonempty⟩ := List.exists_cons_of_ne_nil empty
        have emptyFlag :
            (PrimitiveLocalResponse.emitted program label).isEmpty = false := by
          simp [nonempty]
        simp only [emptyFlag, Bool.and_false, Prod.mk.injEq] at equal
        rcases equal with ⟨rfl, rfl⟩
        cases routeDone with
        | false => exact .routeIncomplete progress
        | true => exact .routeCompleteNonempty first rest progress nonempty
  · obtain ⟨⟨actionDone, actionTerm⟩, actionMember, equal⟩ :=
      exists_of_mem_map_clean _ actionEntry
    simp only [Prod.mk.injEq] at equal
    rcases equal with ⟨rfl, rfl⟩
    exact .action (actionEntries_spec
      (PrimitiveLocalResponse.emitted program label) carrier [] (by simp)
      actionMember)

/-! ## Invariant witnesses at exact script PCs -/

/-- An exact normal-response script PC, paired with one structurally audited
root sample, satisfies the simultaneous scheduler invariant.  The caller
supplies the literal prefix/suffix `ControlPosition`; no arbitrary PC can be
introduced through this theorem. -/
theorem responseScript_holds
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool)
    (bits : List Bool) (continuation carrier : Term)
    (parents : List ParentFrame)
    {done : Bool} {term : Term}
    (sample : ResponseRootMutation program dispatcher.tree
      (dispatcher.route_valid (registers.phase, bit)) bits continuation carrier
      done term)
    (snapshotInv : ReachableAudit.Holds program dispatcher.tree bits
      continuation carrier)
    {pc : SchedulerControl.ScriptPC program dispatcher
      (.normalResponse (registers.phase, bit))}
    {cursor : Cursor}
    (position : ControlPosition program dispatcher
      (.script (.normalResponse (registers.phase, bit)) pc registers) cursor)
    (erase_eq : cursor.erase = Cursor.rebuild parents term)
    {phase : CTS.Phase program} {scanned : List Bool} {emptyMode : Bool}
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    (decoder : DecoderEvidence program dispatcher.tree .frameDispatch
      cursor.erase) :
    Holds program dispatcher
      ⟨some (.script (.normalResponse (registers.phase, bit)) pc registers),
        cursor⟩ := by
  have audit : AuditedOccurrence program dispatcher.tree cursor.erase := by
    rw [erase_eq]
    exact sample.auditedOccurrence snapshotInv parents
  exact .intro
    (.script (.normalResponse (registers.phase, bit)) pc registers) rfl
    phase scanned emptyMode coherent position (.frameDispatch decoder audit)

/-- Every nonfinal response contraction is decoder-silent even when enclosed
by an arbitrary already-completed Local prefix. -/
theorem responseScript_intermediate_holds
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool)
    (bits : List Bool) (continuation carrier : Term)
    (parents : List ParentFrame)
    {term : Term}
    (sample : ResponseRootMutation program dispatcher.tree
      (dispatcher.route_valid (registers.phase, bit)) bits continuation carrier
      false term)
    (hadmissible : Carrier.Admissible continuation)
    (snapshotInv : ReachableAudit.Holds program dispatcher.tree bits
      continuation carrier)
    {pc : SchedulerControl.ScriptPC program dispatcher
      (.normalResponse (registers.phase, bit))}
    {cursor : Cursor}
    (position : ControlPosition program dispatcher
      (.script (.normalResponse (registers.phase, bit)) pc registers) cursor)
    (erase_eq : cursor.erase = Cursor.rebuild parents term)
    {layers : Nat}
    (outer : CheckpointExclusion.CompletedPrefix program dispatcher.tree
      cursor.erase term layers)
    {phase : CTS.Phase program} {scanned : List Bool} {emptyMode : Bool}
    (coherent : RegistersCoherent registers phase scanned emptyMode) :
    Holds program dispatcher
      ⟨some (.script (.normalResponse (registers.phase, bit)) pc registers),
        cursor⟩ := by
  let silent : SilentEvidence program dispatcher.tree .frameDispatch
      cursor.erase := .ofState (.endpointFailure outer
        (sample.failure hadmissible snapshotInv rfl))
  exact responseScript_holds program dispatcher registers bit bits continuation
    carrier parents sample snapshotInv position erase_eq coherent
    (.silent silent)

/-- The last response contraction may already expose the fresh terminal
checkpoint while the finite controller is still at a FRAME/DISPATCH script
PC.  This is the contraction-index semantics used by the public decoder. -/
theorem responseScript_terminal_holds
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool)
    (bits : List Bool) (continuation carrier : Term)
    (parents : List ParentFrame)
    {term : Term}
    (sample : ResponseRootMutation program dispatcher.tree
      (dispatcher.route_valid (registers.phase, bit)) bits continuation carrier
      true term)
    (snapshotInv : ReachableAudit.Holds program dispatcher.tree bits
      continuation carrier)
    {pc : SchedulerControl.ScriptPC program dispatcher
      (.normalResponse (registers.phase, bit))}
    {cursor : Cursor}
    (position : ControlPosition program dispatcher
      (.script (.normalResponse (registers.phase, bit)) pc registers) cursor)
    (erase_eq : cursor.erase = Cursor.rebuild parents term)
    {result : CheckpointDecoder.PositiveView program}
    (terminal : CheckpointExclusion.TerminalCheckpointShape program
      dispatcher.tree .fresh result cursor.erase)
    {phase : CTS.Phase program} {scanned : List Bool} {emptyMode : Bool}
    (coherent : RegistersCoherent registers phase scanned emptyMode) :
    Holds program dispatcher
      ⟨some (.script (.normalResponse (registers.phase, bit)) pc registers),
        cursor⟩ :=
  responseScript_holds program dispatcher registers bit bits continuation
    carrier parents sample snapshotInv position erase_eq coherent
    (.public (.frameTerminal terminal))

/-! ## RETURN endpoint with accepting decoder evidence -/

/-- The completed RETURN endpoint satisfies `Holds` with either silent or
public decoder evidence.  This generalizes the silent-only response lemma so
the same completed terminal can remain accepted after the script's epsilon
family change. -/
theorem return_holds_of_decoder
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame)
    {phase : CTS.Phase program} {scanned : List Bool} {emptyMode : Bool}
    (bit_eq : registers.bit = some bit)
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    (snapshotInv : ReachableAudit.Holds program dispatcher.tree bits
      continuation carrier)
    (decoder : DecoderEvidence program dispatcher.tree .return
      (SchedulerResponse.returnConfiguration program dispatcher registers bit
        bits continuation carrier parents).cursor.erase) :
    Holds program dispatcher
      (SchedulerResponse.returnConfiguration program dispatcher registers bit
        bits continuation carrier parents) := by
  let focus := LocalResponse.completed bits continuation carrier
    (SchedulerResponse.completedRoute program dispatcher registers bit carrier)
  exact .intro (.macro (.family .return) registers) rfl
    phase scanned emptyMode coherent
    (.macro
      (SchedulerInvariant.cursorAtContextOfParents focus parents)
      (by
        unfold CommandSafe
        by_cases output_eq :
          SchedulerControl.outputEmpty program registers bit = true
        · simp [SchedulerControl.transition, bit_eq, output_eq]
        · simp [SchedulerControl.transition, bit_eq, output_eq]))
    (.return decoder
      (SchedulerResponse.return_auditedOccurrence program dispatcher registers
        bit bits continuation carrier parents snapshotInv))

/-- A fresh terminal accepted at the final response contraction remains the
same accepted bare term at the cursor-only RETURN endpoint. -/
theorem returnTerminal_holds
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame)
    {phase : CTS.Phase program} {scanned : List Bool} {emptyMode : Bool}
    (bit_eq : registers.bit = some bit)
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    (snapshotInv : ReachableAudit.Holds program dispatcher.tree bits
      continuation carrier)
    {result : CheckpointDecoder.PositiveView program}
    (terminal : CheckpointExclusion.TerminalCheckpointShape program
      dispatcher.tree .fresh result
      (SchedulerResponse.returnConfiguration program dispatcher registers bit
        bits continuation carrier parents).cursor.erase) :
    Holds program dispatcher
      (SchedulerResponse.returnConfiguration program dispatcher registers bit
        bits continuation carrier parents) :=
  return_holds_of_decoder program dispatcher registers bit bits continuation
    carrier parents bit_eq coherent snapshotInv
    (.public (.returnTerminal terminal))

/-- Semantic sampled-state wrapper for a final response contraction still
owned by FRAME/DISPATCH.  The positive-prefix certificate fixes the global
contraction index rather than merely re-parsing the terminal syntax. -/
theorem responseScript_terminal_sampledState
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) (sampleIndex offset : Nat)
    {configuration : Configuration program dispatcher}
    (holds : Holds program dispatcher configuration)
    {control : SchedulerControl.Control program dispatcher}
    (control_eq : configuration.control = some control)
    (family_eq : control.family = .frameDispatch)
    {activeContext : Context} {chain : CheckpointDecoder.ChainView program}
    (certificate : CheckpointRun.PositivePrefix program dispatcher inputBits
      (offset + 1) configuration.cursor.erase
      (ExactCheckpointRun.checkpointTime program dispatcher inputBits
        (offset + 1)) activeContext chain)
    (index_eq : sampleIndex =
      ExactCheckpointRun.checkpointTime program dispatcher inputBits
        (offset + 1)) :
    SampledState program dispatcher inputBits sampleIndex configuration := by
  refine ⟨holds, ⟨control, control_eq, ?_⟩⟩
  rw [family_eq]
  exact .positive offset certificate index_eq

/-- The identical accepted term at RETURN has the same positive sampled-state
certificate; the family switch is cursor-only and does not create a new
contraction sample. -/
theorem returnTerminal_sampledState
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) (sampleIndex offset : Nat)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame)
    (holds : Holds program dispatcher
      (SchedulerResponse.returnConfiguration program dispatcher registers bit
        bits continuation carrier parents))
    {activeContext : Context} {chain : CheckpointDecoder.ChainView program}
    (certificate : CheckpointRun.PositivePrefix program dispatcher inputBits
      (offset + 1)
      (SchedulerResponse.returnConfiguration program dispatcher registers bit
        bits continuation carrier parents).cursor.erase
      (ExactCheckpointRun.checkpointTime program dispatcher inputBits
        (offset + 1)) activeContext chain)
    (index_eq : sampleIndex =
      ExactCheckpointRun.checkpointTime program dispatcher inputBits
        (offset + 1)) :
    SampledState program dispatcher inputBits sampleIndex
      (SchedulerResponse.returnConfiguration program dispatcher registers bit
        bits continuation carrier parents) := by
  refine ⟨holds, ⟨.macro (.family .return) registers, rfl, ?_⟩⟩
  exact .positive offset certificate index_eq

/-! ## Executable mutation-chain refinement of fixed scripts -/

/-- A successful cursor script together with the cursor immediately after
every `Rdx`.  Cursor-only operations are retained in the derivation but do not
appear in `samples`. -/
inductive CursorMutationTrace : Script → Cursor → List Cursor → Cursor → Prop where
  | nil (cursor : Cursor) : CursorMutationTrace [] cursor [] cursor
  | step {operation : Primitive} {rest : Script}
      {before middle endpoint : Cursor} {samples : List Cursor}
      (executes : operation.exec before = some middle)
      (tail : CursorMutationTrace rest middle samples endpoint) :
      CursorMutationTrace (operation :: rest) before
        (match operation with
        | .Rdx => middle :: samples
        | _ => samples) endpoint

namespace CursorMutationTrace

theorem run_eq
    {script : Script} {before endpoint : Cursor} {samples : List Cursor}
    (trace : CursorMutationTrace script before samples endpoint) :
    Script.run script before = some endpoint := by
  induction trace with
  | nil => rfl
  | step executes tail ih => simp only [Script.run, executes, ih]

theorem length_eq
    {script : Script} {before endpoint : Cursor} {samples : List Cursor}
    (trace : CursorMutationTrace script before samples endpoint) :
    samples.length = script.rdxCount := by
  induction trace with
  | @step operation rest before middle endpoint samples executes tail ih =>
      cases operation <;> simp [Script.rdxCount, ih, Nat.add_comm]
  | nil => rfl

/-- Successful deterministic script execution always yields the complete
contraction trace; there is no bounded search or fixture in this extraction. -/
theorem of_run
    {script : Script} {before endpoint : Cursor}
    (executes : Script.run script before = some endpoint) :
    ∃ samples, CursorMutationTrace script before samples endpoint := by
  induction script generalizing before with
  | nil =>
      have endpoint_eq : endpoint = before := Option.some.inj executes.symm
      subst endpoint
      exact ⟨[], .nil before⟩
  | cons operation rest ih =>
      obtain ⟨middle, first, remaining⟩ :=
        (Script.run_cons_eq_some_iff operation rest before endpoint).mp executes
      obtain ⟨samples, tail⟩ := ih remaining
      cases operation with
      | L => exact ⟨samples, .step first tail⟩
      | R => exact ⟨samples, .step first tail⟩
      | U => exact ⟨samples, .step first tail⟩
      | Rdx => exact ⟨middle :: samples, .step first tail⟩

end CursorMutationTrace

/-- A list of actual finite-controller contraction samples.  Every link uses
the executable `seekMutation`; the terminal constructor records the exact
cursor-only suffix to the prescribed endpoint. -/
inductive ExactMutationChain {Control : Type}
    (machine : FiniteController.Machine Control)
    (terminal : FiniteController.Configuration Control) :
    FiniteController.Configuration Control →
      List (FiniteController.Configuration Control) → Prop where
  | done {before : FiniteController.Configuration Control} (ticks : Nat)
      (suffix : ZeroMutationRun machine ticks before terminal) :
      ExactMutationChain machine terminal before []
  | next {before sample : FiniteController.Configuration Control}
      {samples : List (FiniteController.Configuration Control)}
      (searchTicks : Nat)
      (found : FiniteController.seekMutation machine searchTicks before =
        some sample)
      (tail : ExactMutationChain machine terminal sample samples) :
      ExactMutationChain machine terminal before (sample :: samples)

namespace ExactMutationChain

/-- A mutation-free prefix is absorbed into the first exact search, or into
the final mutation-free suffix when no contraction remains. -/
theorem prepend
    {Control : Type} {machine : FiniteController.Machine Control}
    {terminal before middle : FiniteController.Configuration Control}
    {samples : List (FiniteController.Configuration Control)} {ticks : Nat}
    (zeroPrefix : ZeroMutationRun machine ticks before middle)
    (chain : ExactMutationChain machine terminal middle samples) :
    ExactMutationChain machine terminal before samples := by
  cases chain with
  | done suffixTicks suffix =>
      exact .done (ticks + suffixTicks) (zeroPrefix.trans suffix)
  | next searchTicks found tail =>
      exact .next (ticks + searchTicks)
        (zeroPrefix.seekMutation_prepend found) tail

end ExactMutationChain

/-- Refine an exact cursor trace of an arbitrary unconsumed scheduler-script
suffix into its exact `seekMutation` chain.  The proof follows the bounded PC
one instruction at a time and finishes with the unique epsilon exit row. -/
theorem scriptTrace_exactMutationChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (job : SchedulerControl.ScriptJob program) (registers : Registers program)
    {script : Script} {before endpoint : Cursor} {cursorSamples : List Cursor}
    (trace : CursorMutationTrace script before cursorSamples endpoint) :
    ∀ (pc : SchedulerControl.ScriptPC program dispatcher job),
      List.drop pc.val (SchedulerControl.jobScript program dispatcher job) =
        script →
      pc.val + script.length =
        (SchedulerControl.jobScript program dispatcher job).length →
      ∃ configurationSamples : List (Configuration program dispatcher),
        configurationSamples.map (fun configuration => configuration.cursor) =
          cursorSamples ∧
        ExactMutationChain (SchedulerControl.machine program dispatcher)
          ⟨some (SchedulerControl.afterScript program dispatcher job registers),
            endpoint⟩
          ⟨some (.script job pc registers), before⟩ configurationSamples := by
  induction trace with
  | nil cursor =>
      intro pc suffix_eq length_eq
      have pc_at_end : pc.val =
          (SchedulerControl.jobScript program dispatcher job).length := by
        simpa using length_eq
      have runSuffix := SchedulerExecution.run_script_suffix program dispatcher
        job registers pc 0 cursor cursor (by simpa using pc_at_end) (by
          rw [suffix_eq]
          rfl)
      have countSuffix :=
        SchedulerExecution.runMutationCount_script_suffix program dispatcher
          job registers pc 0 cursor cursor (by simpa using pc_at_end) (by
            rw [suffix_eq]
            rfl)
      refine ⟨[], rfl, .done 1 ⟨?_, ?_⟩⟩
      · simpa using runSuffix
      · simpa [suffix_eq] using countSuffix
  | @step operation rest before middle endpoint samples executes tail ih =>
      intro pc suffix_eq length_eq
      have pc_lt : pc.val <
          (SchedulerControl.jobScript program dispatcher job).length := by
        exact Nat.lt_of_lt_of_eq (Nat.lt_add_of_pos_right (by simp)) length_eq
      have dropped := List.drop_eq_getElem_cons pc_lt
      have pieces : operation :: rest =
          (SchedulerControl.jobScript program dispatcher job).get
              ⟨pc.val, pc_lt⟩ ::
            List.drop (pc.val + 1)
              (SchedulerControl.jobScript program dispatcher job) :=
        suffix_eq.symm.trans dropped
      have operation_eq :
          (SchedulerControl.jobScript program dispatcher job).get
              ⟨pc.val, pc_lt⟩ = operation :=
        (List.cons.inj pieces).1.symm
      have tail_eq :
          List.drop (pc.val + 1)
              (SchedulerControl.jobScript program dispatcher job) = rest :=
        (List.cons.inj pieces).2.symm
      let next := SchedulerControl.nextScriptPC program dispatcher job pc pc_lt
      have next_length : next.val + rest.length =
          (SchedulerControl.jobScript program dispatcher job).length := by
        change (pc.val + 1) + rest.length = _
        calc
          (pc.val + 1) + rest.length = pc.val + (1 + rest.length) :=
            Nat.add_assoc _ _ _
          _ = pc.val + (rest.length + 1) := by
            rw [Nat.add_comm 1 rest.length]
          _ = _ := by simpa using length_eq
      obtain ⟨configurationSamples, cursors_eq, chain⟩ :=
        ih next (by simpa [next, SchedulerControl.nextScriptPC] using tail_eq)
          next_length
      let source : Configuration program dispatcher :=
        ⟨some (.script job pc registers), before⟩
      let target : Configuration program dispatcher :=
        ⟨some (.script job next registers), middle⟩
      have actualExec :
          ((SchedulerControl.jobScript program dispatcher job).get
            ⟨pc.val, pc_lt⟩).exec before = some middle := by
        rw [operation_eq]
        exact executes
      have step_eq : FiniteController.step
          (SchedulerControl.machine program dispatcher) source = target := by
        simpa [source, target, next] using
          SchedulerExecution.step_script program dispatcher job registers pc
            before middle pc_lt actualExec
      have mutation_eq : FiniteController.mutationCount
          (SchedulerControl.machine program dispatcher) source =
            Script.rdxCount [operation] := by
        have counted := SchedulerExecution.mutationCount_script program
          dispatcher job registers pc before middle pc_lt actualExec
        rw [operation_eq] at counted
        simpa [source] using counted
      cases operation with
      | L =>
          let zeroPrefix : ZeroMutationRun
              (SchedulerControl.machine program dispatcher) 1 source target := by
            refine ⟨?_, ?_⟩
            · simpa [FiniteController.run] using step_eq
            · simp [FiniteController.runMutationCount, mutation_eq,
                Script.rdxCount]
          exact ⟨configurationSamples, cursors_eq,
            ExactMutationChain.prepend zeroPrefix chain⟩
      | R =>
          let zeroPrefix : ZeroMutationRun
              (SchedulerControl.machine program dispatcher) 1 source target := by
            refine ⟨?_, ?_⟩
            · simpa [FiniteController.run] using step_eq
            · simp [FiniteController.runMutationCount, mutation_eq,
                Script.rdxCount]
          exact ⟨configurationSamples, cursors_eq,
            ExactMutationChain.prepend zeroPrefix chain⟩
      | U =>
          let zeroPrefix : ZeroMutationRun
              (SchedulerControl.machine program dispatcher) 1 source target := by
            refine ⟨?_, ?_⟩
            · simpa [FiniteController.run] using step_eq
            · simp [FiniteController.runMutationCount, mutation_eq,
                Script.rdxCount]
          exact ⟨configurationSamples, cursors_eq,
            ExactMutationChain.prepend zeroPrefix chain⟩
      | Rdx =>
          have found : FiniteController.seekMutation
              (SchedulerControl.machine program dispatcher) 1 source =
                some target := by
            simp [FiniteController.seekMutation, mutation_eq, step_eq,
              Script.rdxCount]
          exact ⟨target :: configurationSamples, by simp [target, cursors_eq],
            .next 1 found chain⟩

/-- The complete normal response has an exact executable contraction chain,
one sample per syntactic `Rdx`, ending at the literal RETURN configuration. -/
theorem normalResponse_exactMutationChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    ∃ cursorSamples : List Cursor,
      ∃ configurationSamples : List (Configuration program dispatcher),
        CursorMutationTrace
          (SchedulerControl.jobScript program dispatcher
            (.normalResponse (registers.phase, bit)))
          (SchedulerResponse.frameCursor program dispatcher bits continuation
            carrier parents)
          cursorSamples
          (SchedulerResponse.completedCursor program dispatcher registers bit
            bits continuation carrier parents) ∧
        configurationSamples.map (fun configuration => configuration.cursor) =
          cursorSamples ∧
        configurationSamples.length =
          LocalResponse.completedCost program
            (dispatcher.route (registers.phase, bit)) (registers.phase, bit) ∧
        ExactMutationChain (SchedulerControl.machine program dispatcher)
          (SchedulerResponse.returnConfiguration program dispatcher registers
            bit bits continuation carrier parents)
          (SchedulerResponse.responseStartConfiguration program dispatcher
            registers bit bits continuation carrier parents)
          configurationSamples := by
  have run := SchedulerControl.run_normalResponse program dispatcher
    (registers.phase, bit) bits continuation carrier parents
  obtain ⟨cursorSamples, trace⟩ := CursorMutationTrace.of_run run
  obtain ⟨configurationSamples, cursors_eq, chain⟩ :=
    scriptTrace_exactMutationChain program dispatcher
      (.normalResponse (registers.phase, bit)) registers trace
      (SchedulerControl.firstScriptPC program dispatcher
        (.normalResponse (registers.phase, bit))) (by
          simp [SchedulerControl.firstScriptPC]) (by
            simp [SchedulerControl.firstScriptPC])
  refine ⟨cursorSamples, configurationSamples, trace, cursors_eq, ?_, ?_⟩
  · calc
      configurationSamples.length = cursorSamples.length := by
        simpa using congrArg List.length cursors_eq
      _ = (SchedulerControl.jobScript program dispatcher
          (.normalResponse (registers.phase, bit))).rdxCount := trace.length_eq
      _ = LocalResponse.completedCost program
          (dispatcher.route (registers.phase, bit))
          (registers.phase, bit) := by
        exact PrimitiveLocalResponse.execute_rdxCount program
          (dispatcher.route (registers.phase, bit)) (registers.phase, bit)
  · simpa [SchedulerResponse.responseStartConfiguration,
      SchedulerResponse.returnConfiguration] using! chain

end SchedulerResponseInvariant

end PureSFormal.PureS
