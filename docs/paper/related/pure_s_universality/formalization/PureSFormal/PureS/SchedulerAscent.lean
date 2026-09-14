import PureSFormal.PureS.SchedulerInvariant
import PureSFormal.PureS.SchedulerDescent

/-!
# Executable ascent to the selected queue front

This module connects the declarative canonical cursor path to the compiled
`.up` controller.  The controller first tests the pending-frame parent,
ascends one registered application parent, runs the two live-cell probes, and
uses `Rdx` only at the first live parent.  All probe executions below are the
literal finite tables compiled by `SchedulerExecution`.
-/

namespace PureSFormal.PureS

namespace SchedulerAscent

open FiniteController SchedulerControl SchedulerInvariant

abbrev Configuration (program : CTS.Program)
    (dispatcher : ActionDispatcher program) :=
  FiniteController.Configuration (SchedulerControl.Control program dispatcher)

/-! ## Mutation-free compiled parent probes -/

/-- A complete parent-site structural probe is an exact mutation-free run. -/
theorem parentProbe_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (kind : SchedulerControl.ProbeKind program dispatcher)
    (registers : Registers program) (origin : Cursor) (side : Direction)
    (parentSite : SchedulerControl.probeSite kind = .parent side) :
    ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher kind origin)
      ⟨some (SchedulerControl.startProbe kind registers), origin⟩
      (SchedulerExecution.commandResult
        (SchedulerControl.probeAnswer program dispatcher kind
          (SchedulerControl.compiledProbeAnswer program dispatcher kind origin)
          registers) origin) :=
  ⟨SchedulerExecution.run_parentProbe program dispatcher kind registers
      origin side parentSite,
    SchedulerExecution.runMutationCount_parentProbe program dispatcher kind
      registers origin side parentSite⟩

/-! ## One registered parent -/

/--
The bounded observations needed to classify one immediate application parent
as a registered, non-live, non-pending ascent edge.
-/
structure RegisteredParent (child : Term) (frame : ParentFrame) : Prop where
  pending_reject :
    match frame with
    | .left _ => True
    | .right function =>
        Pattern.matchesBool PendingFrame.pendingPattern
          (.app function child) = false
  liveZero_reject : Pattern.matchesBool
    (SchedulerControl.livePattern false) (frame.fill child) = false
  liveOne_reject : Pattern.matchesBool
    (SchedulerControl.livePattern true) (frame.fill child) = false

/-- A live guard forces the immediate function to have head arity two. -/
theorem livePattern_reject_of_function_arity_ne_two
    (bit : Bool) (function argument : Term)
    (different : function.headArity ≠ 2) :
    Pattern.matchesBool (SchedulerControl.livePattern bit)
      (.app function argument) = false := by
  cases result : Pattern.matchesBool (SchedulerControl.livePattern bit)
      (.app function argument) with
  | false => rfl
  | true =>
      have matched := Pattern.matchesBool_sound result
      change Pattern.Matches
        (.app (SchedulerControl.exactPattern
          (PureSFormal.PureS.live bit)) .hole)
        (.app function argument) at matched
      cases matched with
      | app functionMatched argumentMatched =>
          have functionEq : function = PureSFormal.PureS.live bit :=
            (SchedulerDescent.matchesBool_exactPattern_eq_true_iff
              (PureSFormal.PureS.live bit) function).1
              (Pattern.matchesBool_complete functionMatched)
          have impossible : False := different (by
            rw [functionEq]
            cases bit <;> rfl)
          exact impossible.elim

/-- A non-arity-two function cannot be the function of a pending parent. -/
theorem pendingPattern_reject_of_function_arity_ne_two
    (function argument : Term) (different : function.headArity ≠ 2) :
    Pattern.matchesBool PendingFrame.pendingPattern
      (.app function argument) = false := by
  cases result : Pattern.matchesBool PendingFrame.pendingPattern
      (.app function argument) with
  | false => rfl
  | true =>
      have matched := Pattern.matchesBool_sound result
      change Pattern.Matches
        (.app PendingFrame.frameFunctionPattern .hole)
        (.app function argument) at matched
      cases matched with
      | app functionMatched argumentMatched =>
          exact (different
            (PendingFrame.frameFunctionPattern_headArity functionMatched)).elim

/-- Head-arity disjointness certifies a right-incoming registered parent. -/
theorem registeredRight_of_function_arity_ne_two
    (function child : Term) (different : function.headArity ≠ 2) :
    RegisteredParent child (.right function) :=
  ⟨pendingPattern_reject_of_function_arity_ne_two function child different,
    livePattern_reject_of_function_arity_ne_two false function child different,
    livePattern_reject_of_function_arity_ne_two true function child different⟩

/-- Head-arity disjointness certifies a left-incoming registered parent. -/
theorem registeredLeft_of_child_arity_ne_two
    (child argument : Term) (different : child.headArity ≠ 2) :
    RegisteredParent child (.left argument) :=
  ⟨trivial,
    livePattern_reject_of_function_arity_ne_two false child argument different,
    livePattern_reject_of_function_arity_ne_two true child argument different⟩

/-- Cursor after moving from a child through one registered parent. -/
def parentCursor (child : Term) (frame : ParentFrame)
    (parents : List ParentFrame) : Cursor :=
  ⟨frame.fill child, parents⟩

/-- Exact tick cost of one complete registered-parent UP iteration. -/
def registeredParentTicks
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (child : Term) (frame : ParentFrame) (parents : List ParentFrame) : Nat :=
  let origin : Cursor := ⟨child, frame :: parents⟩
  let parent : Cursor := parentCursor child frame parents
  (((((1 + SchedulerControl.compiledProbeCost program dispatcher
        (.pending .scan) origin) + 1) + 1) +
      SchedulerControl.compiledProbeCost program dispatcher
        (.upLiveZero frame.side) parent) +
    SchedulerControl.compiledProbeCost program dispatcher
      (.upLiveOne frame.side) parent) +
    SchedulerControl.compiledProbeCost program dispatcher
      (.upRegistered frame.side) parent

/--
The actual finite controller crosses one registered parent, restores every
probe cursor exactly, changes no register, and performs no contraction.
-/
theorem registeredParent_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (child : Term) (frame : ParentFrame)
    (parents : List ParentFrame) (shape : RegisteredParent child frame) :
    ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (registeredParentTicks program dispatcher child frame parents)
      (SchedulerInvariant.upConfiguration program dispatcher registers child
        (frame :: parents))
      (SchedulerInvariant.upConfiguration program dispatcher registers
        (frame.fill child) parents) := by
  cases frame with
  | left argument =>
      let origin : Cursor := ⟨child, .left argument :: parents⟩
      let parent : Cursor := ⟨.app child argument, parents⟩
      let pendingStart : Configuration program dispatcher :=
        ⟨some (SchedulerControl.startProbe (.pending .scan) registers), origin⟩
      let moveState : Configuration program dispatcher :=
        ⟨some (.macro .upMove registers), origin⟩
      let ancestorState : Configuration program dispatcher :=
        ⟨some (.macro (.upAncestor .left) registers), parent⟩
      let liveZeroStart : Configuration program dispatcher :=
        ⟨some (SchedulerControl.startProbe (.upLiveZero .left) registers),
          parent⟩
      let liveOneStart : Configuration program dispatcher :=
        ⟨some (SchedulerControl.startProbe (.upLiveOne .left) registers),
          parent⟩
      let registeredStart : Configuration program dispatcher :=
        ⟨some (SchedulerControl.startProbe (.upRegistered .left) registers),
          parent⟩
      have enter : ZeroMutationRun
          (SchedulerControl.machine program dispatcher) 1
          (SchedulerInvariant.upConfiguration program dispatcher registers child
            (.left argument :: parents)) pendingStart := by
        exact ⟨rfl, rfl⟩
      have pendingProbe := parentProbe_zeroRun program dispatcher
        (.pending .scan) registers origin .right rfl
      have pending : ZeroMutationRun
          (SchedulerControl.machine program dispatcher)
          (SchedulerControl.compiledProbeCost program dispatcher
            (.pending .scan) origin)
          pendingStart moveState := by
        simpa [pendingStart, moveState, origin,
          SchedulerExecution.commandResult,
          SchedulerControl.compiledProbeAnswer, SchedulerControl.probeSite,
          Probe.parentMatches, SchedulerControl.probeAnswer] using pendingProbe
      have move : ZeroMutationRun
          (SchedulerControl.machine program dispatcher) 1 moveState
          ancestorState := by
        exact ⟨rfl, rfl⟩
      have enterLive : ZeroMutationRun
          (SchedulerControl.machine program dispatcher) 1 ancestorState
          liveZeroStart := by
        exact ⟨rfl, rfl⟩
      have liveZeroProbe := ZeroMutationRun.localProbe program dispatcher
        (.upLiveZero .left) registers parent rfl
      have liveZeroAnswer : SchedulerControl.compiledProbeAnswer program
          dispatcher (.upLiveZero .left) parent = false := by
        simpa [parent, SchedulerControl.compiledProbeAnswer,
          SchedulerControl.probeSite, SchedulerControl.probePattern] using
          shape.liveZero_reject
      have liveZero : ZeroMutationRun
          (SchedulerControl.machine program dispatcher)
          (SchedulerControl.compiledProbeCost program dispatcher
            (.upLiveZero .left) parent)
          liveZeroStart liveOneStart := by
        simpa [liveZeroStart, liveOneStart, parent,
          SchedulerExecution.commandResult,
          SchedulerControl.probeAnswer, liveZeroAnswer] using liveZeroProbe
      have liveOneProbe := ZeroMutationRun.localProbe program dispatcher
        (.upLiveOne .left) registers parent rfl
      have liveOneAnswer : SchedulerControl.compiledProbeAnswer program
          dispatcher (.upLiveOne .left) parent = false := by
        simpa [parent, SchedulerControl.compiledProbeAnswer,
          SchedulerControl.probeSite, SchedulerControl.probePattern] using
          shape.liveOne_reject
      have liveOne : ZeroMutationRun
          (SchedulerControl.machine program dispatcher)
          (SchedulerControl.compiledProbeCost program dispatcher
            (.upLiveOne .left) parent)
          liveOneStart registeredStart := by
        simpa [liveOneStart, registeredStart, parent,
          SchedulerExecution.commandResult,
          SchedulerControl.probeAnswer, liveOneAnswer] using liveOneProbe
      have registeredProbe := ZeroMutationRun.localProbe program dispatcher
        (.upRegistered .left) registers parent rfl
      have registered : ZeroMutationRun
          (SchedulerControl.machine program dispatcher)
          (SchedulerControl.compiledProbeCost program dispatcher
            (.upRegistered .left) parent)
          registeredStart
          (SchedulerInvariant.upConfiguration program dispatcher registers
            (.app child argument) parents) := by
        simpa [registeredStart, parent, SchedulerInvariant.upConfiguration,
          SchedulerExecution.commandResult,
          SchedulerControl.compiledProbeAnswer, SchedulerControl.probeSite,
          SchedulerControl.probePattern, SchedulerControl.probeAnswer,
          SchedulerControl.registeredAncestorPattern, Pattern.matchesBool]
          using registeredProbe
      have throughPending := enter.trans pending
      have throughMove := throughPending.trans move
      have throughEnter := throughMove.trans enterLive
      have throughZero := throughEnter.trans liveZero
      have throughOne := throughZero.trans liveOne
      have complete := throughOne.trans registered
      simpa [registeredParentTicks, origin, parent,
        parentCursor, ParentFrame.fill, ParentFrame.side] using complete
  | right function =>
      let origin : Cursor := ⟨child, .right function :: parents⟩
      let parent : Cursor := ⟨.app function child, parents⟩
      let pendingStart : Configuration program dispatcher :=
        ⟨some (SchedulerControl.startProbe (.pending .scan) registers), origin⟩
      let moveState : Configuration program dispatcher :=
        ⟨some (.macro .upMove registers), origin⟩
      let ancestorState : Configuration program dispatcher :=
        ⟨some (.macro (.upAncestor .right) registers), parent⟩
      let liveZeroStart : Configuration program dispatcher :=
        ⟨some (SchedulerControl.startProbe (.upLiveZero .right) registers),
          parent⟩
      let liveOneStart : Configuration program dispatcher :=
        ⟨some (SchedulerControl.startProbe (.upLiveOne .right) registers),
          parent⟩
      let registeredStart : Configuration program dispatcher :=
        ⟨some (SchedulerControl.startProbe (.upRegistered .right) registers),
          parent⟩
      have enter : ZeroMutationRun
          (SchedulerControl.machine program dispatcher) 1
          (SchedulerInvariant.upConfiguration program dispatcher registers child
            (.right function :: parents)) pendingStart := by
        exact ⟨rfl, rfl⟩
      have pendingProbe := parentProbe_zeroRun program dispatcher
        (.pending .scan) registers origin .right rfl
      have pending : ZeroMutationRun
          (SchedulerControl.machine program dispatcher)
          (SchedulerControl.compiledProbeCost program dispatcher
            (.pending .scan) origin)
          pendingStart moveState := by
        simpa [pendingStart, moveState, origin,
          SchedulerExecution.commandResult,
          SchedulerControl.compiledProbeAnswer, SchedulerControl.probeSite,
          Probe.parentMatches, SchedulerControl.probePattern,
          SchedulerControl.probeAnswer, shape.pending_reject] using pendingProbe
      have move : ZeroMutationRun
          (SchedulerControl.machine program dispatcher) 1 moveState
          ancestorState := by
        exact ⟨rfl, rfl⟩
      have enterLive : ZeroMutationRun
          (SchedulerControl.machine program dispatcher) 1 ancestorState
          liveZeroStart := by
        exact ⟨rfl, rfl⟩
      have liveZeroProbe := ZeroMutationRun.localProbe program dispatcher
        (.upLiveZero .right) registers parent rfl
      have liveZeroAnswer : SchedulerControl.compiledProbeAnswer program
          dispatcher (.upLiveZero .right) parent = false := by
        simpa [parent, SchedulerControl.compiledProbeAnswer,
          SchedulerControl.probeSite, SchedulerControl.probePattern] using
          shape.liveZero_reject
      have liveZero : ZeroMutationRun
          (SchedulerControl.machine program dispatcher)
          (SchedulerControl.compiledProbeCost program dispatcher
            (.upLiveZero .right) parent)
          liveZeroStart liveOneStart := by
        simpa [liveZeroStart, liveOneStart, parent,
          SchedulerExecution.commandResult,
          SchedulerControl.probeAnswer, liveZeroAnswer] using liveZeroProbe
      have liveOneProbe := ZeroMutationRun.localProbe program dispatcher
        (.upLiveOne .right) registers parent rfl
      have liveOneAnswer : SchedulerControl.compiledProbeAnswer program
          dispatcher (.upLiveOne .right) parent = false := by
        simpa [parent, SchedulerControl.compiledProbeAnswer,
          SchedulerControl.probeSite, SchedulerControl.probePattern] using
          shape.liveOne_reject
      have liveOne : ZeroMutationRun
          (SchedulerControl.machine program dispatcher)
          (SchedulerControl.compiledProbeCost program dispatcher
            (.upLiveOne .right) parent)
          liveOneStart registeredStart := by
        simpa [liveOneStart, registeredStart, parent,
          SchedulerExecution.commandResult,
          SchedulerControl.probeAnswer, liveOneAnswer] using liveOneProbe
      have registeredProbe := ZeroMutationRun.localProbe program dispatcher
        (.upRegistered .right) registers parent rfl
      have registered : ZeroMutationRun
          (SchedulerControl.machine program dispatcher)
          (SchedulerControl.compiledProbeCost program dispatcher
            (.upRegistered .right) parent)
          registeredStart
          (SchedulerInvariant.upConfiguration program dispatcher registers
            (.app function child) parents) := by
        simpa [registeredStart, parent, SchedulerInvariant.upConfiguration,
          SchedulerExecution.commandResult,
          SchedulerControl.compiledProbeAnswer, SchedulerControl.probeSite,
          SchedulerControl.probePattern, SchedulerControl.probeAnswer,
          SchedulerControl.registeredAncestorPattern, Pattern.matchesBool]
          using registeredProbe
      have throughPending := enter.trans pending
      have throughMove := throughPending.trans move
      have throughEnter := throughMove.trans enterLive
      have throughZero := throughEnter.trans liveZero
      have throughOne := throughZero.trans liveOne
      have complete := throughOne.trans registered
      simpa [registeredParentTicks, origin, parent,
        parentCursor, ParentFrame.fill, ParentFrame.side] using complete

/-! ## A registered context below the selected live cell -/

/--
A one-hole context all of whose parents are registered non-live ascent edges.
The endpoint is an index because the literal parent terms retain it.
-/
inductive RegisteredContext (endpoint : Term) : Context → Prop where
  | hole : RegisteredContext endpoint .hole
  | appLeft {inner : Context} {argument : Term}
      (inside : RegisteredContext endpoint inner)
      (parent : RegisteredParent (inner.plug endpoint) (.left argument)) :
      RegisteredContext endpoint (.appLeft inner argument)
  | appRight {function : Term} {inner : Context}
      (inside : RegisteredContext endpoint inner)
      (parent : RegisteredParent (inner.plug endpoint) (.right function)) :
      RegisteredContext endpoint (.appRight function inner)

/-- Registered contexts compose, with the inner walk executed first. -/
theorem RegisteredContext.comp
    {endpoint : Term} {outer inner : Context}
    (outerShape : RegisteredContext (inner.plug endpoint) outer)
    (innerShape : RegisteredContext endpoint inner) :
    RegisteredContext endpoint (outer.comp inner) := by
  induction outerShape with
  | hole => exact innerShape
  | appLeft inside parent ih =>
      exact .appLeft ih (by
        simpa [Context.plug_comp] using parent)
  | appRight inside parent ih =>
      exact .appRight ih (by
        simpa [Context.plug_comp] using parent)

/-- A queue whose index is empty contains only registered tombstone edges. -/
theorem RegisteredContext.ofQueueEmptyAux
    {context : Context} {decoded : List Bool}
    (endpoint : Term)
    (queue : CanonicalTraversal.QueueContext context decoded)
    (empty : decoded = []) : RegisteredContext endpoint context := by
  induction queue with
  | hole => exact .hole
  | @live innerContext innerDecoded bit inner ih =>
      have impossible : innerDecoded ++ [bit] = [] := empty
      simp at impossible
  | @tombstone innerContext innerDecoded bit audit inner ih =>
      have inside := ih empty
      have throughS : RegisteredContext endpoint
          (.appRight .s innerContext) := by
        apply RegisteredContext.appRight inside
        apply registeredRight_of_function_arity_ne_two
        intro equality
        cases equality
      have throughTombstone : RegisteredContext endpoint
          (.appLeft (.appRight .s innerContext)
            (.app (valueTag bit) audit)) := by
        apply RegisteredContext.appLeft throughS
        apply registeredLeft_of_child_arity_ne_two
        intro equality
        change 1 = 2 at equality
        cases equality
      simpa [CellDeletion.tombstoneContext] using throughTombstone

/-- A logically empty queue segment contains only registered tombstone edges. -/
theorem RegisteredContext.ofQueueEmpty
    {context : Context}
    (queue : CanonicalTraversal.QueueContext context []) :
    RegisteredContext omega context :=
  RegisteredContext.ofQueueEmptyAux omega queue rfl

/-- The fixed mutable-Base path is a registered ascent in every queue hole. -/
theorem RegisteredContext.mutableBase
    (actions : Term) (bits : List Bool) (continuation beta queue : Term)
    (admissible : Carrier.Admissible continuation) :
    RegisteredContext queue
      (MutableBase.queueContext actions bits continuation beta) := by
  let environment := environmentCode actions bits
  let first : Context := .appRight .s .hole
  let second : Context :=
    .appRight (.app .s (actCode actions)) first
  let third : Context :=
    .appRight .s second
  let fourth : Context :=
    .appLeft third (.app b environment)
  let fifth : Context := .appLeft fourth continuation
  let sixth : Context := .appRight continuation fifth
  let seventh : Context := .appLeft sixth beta
  have h0 : RegisteredContext queue .hole := .hole
  have h1 : RegisteredContext queue first := by
    apply RegisteredContext.appRight h0
    apply registeredRight_of_function_arity_ne_two
    intro equality
    cases equality
  have h2 : RegisteredContext queue second := by
    apply RegisteredContext.appRight h1
    apply registeredRight_of_function_arity_ne_two
    intro equality
    change 1 = 2 at equality
    cases equality
  have h3 : RegisteredContext queue third := by
    apply RegisteredContext.appRight h2
    apply registeredRight_of_function_arity_ne_two
    intro equality
    cases equality
  have h4 : RegisteredContext queue fourth := by
    apply RegisteredContext.appLeft h3
    apply registeredLeft_of_child_arity_ne_two
    intro equality
    change 1 = 2 at equality
    cases equality
  have h5 : RegisteredContext queue fifth := by
    apply RegisteredContext.appLeft h4
    constructor
    · trivial
    · rfl
    · rfl
  have h6 : RegisteredContext queue sixth := by
    apply RegisteredContext.appRight h5
    apply registeredRight_of_function_arity_ne_two
    intro equality
    rcases admissible with hthree | hfour
    · rw [hthree] at equality
      cases equality
    · rw [hfour] at equality
      cases equality
  have h7 : RegisteredContext queue seventh := by
    apply RegisteredContext.appLeft h6
    apply registeredLeft_of_child_arity_ne_two
    intro equality
    rcases admissible with hthree | hfour
    · change continuation.headArity + 1 = 2 at equality
      rw [hthree] at equality
      cases equality
    · change continuation.headArity + 1 = 2 at equality
      rw [hfour] at equality
      cases equality
  simpa [MutableBase.queueContext, seventh, sixth, fifth, fourth, third,
    second, first, environment] using h7

/-- Left-associated retained arguments preserve a registered path above arity two. -/
theorem RegisteredContext.applyArgs
    {endpoint : Term} {context : Context}
    (shape : RegisteredContext endpoint context)
    (arity : 3 ≤ (context.plug endpoint).headArity)
    (arguments : List Term) :
    RegisteredContext endpoint
      (CanonicalTraversal.applyArgsContext context arguments) := by
  induction arguments generalizing context with
  | nil => exact shape
  | cons argument rest ih =>
      have different : (context.plug endpoint).headArity ≠ 2 := by
        intro equality
        rw [equality] at arity
        exact (Nat.not_succ_le_self 2 arity)
      have next : RegisteredContext endpoint (.appLeft context argument) :=
        .appLeft shape
          (registeredLeft_of_child_arity_ne_two _ _ different)
      have nextArity : 3 ≤
          ((.appLeft context argument : Context).plug endpoint).headArity := by
        change 3 ≤ (context.plug endpoint).headArity + 1
        exact Nat.le_trans arity (Nat.le_add_right _ _)
      exact ih next nextArity

/-- The exact action-response spine is a registered ascent. -/
theorem RegisteredContext.action
    (program : CTS.Program) (label : ActionLabel program)
    (snapshot accumulator : Term) :
    RegisteredContext accumulator
      (CanonicalTraversal.actionContext
        (actionHistories program label snapshot)) := by
  let baseContext : Context := .appRight p .hole
  have baseShape : RegisteredContext accumulator baseContext := by
    apply RegisteredContext.appRight .hole
    apply registeredRight_of_function_arity_ne_two
    intro equality
    change 1 = 2 at equality
    cases equality
  cases histories : actionHistories program label snapshot with
  | nil =>
      simpa [CanonicalTraversal.actionContext,
        CanonicalTraversal.applyArgsContext, histories, baseContext] using
        baseShape
  | cons first rest =>
      let firstContext : Context := .appLeft baseContext first
      have firstShape : RegisteredContext accumulator firstContext := by
        apply RegisteredContext.appLeft baseShape
        constructor
        · trivial
        · rfl
        · rfl
      have firstArity : 3 ≤
          (firstContext.plug accumulator).headArity := by
        exact Nat.le_refl 3
      have restShape := RegisteredContext.applyArgs firstShape firstArity rest
      simpa [CanonicalTraversal.actionContext,
        CanonicalTraversal.applyArgsContext, histories, baseContext,
        firstContext] using restShape

/-- A selected arity-two route call is not either reserved live constructor. -/
theorem registeredLeft_selectedRoute
    (snapshot response dormant : Term)
    (audit : PendingFrame.WholeCarrierAudit snapshot) :
    RegisteredParent (.app (.app .s snapshot) response) (.left dormant) := by
  cases snapshot with
  | s =>
      rcases audit with hfive | hsix
      · cases hfive
      · cases hsix
  | app function argument =>
      exact ⟨trivial, rfl, rfl⟩

/-- Every selected route result retains the same outer chosen-snapshot shell. -/
theorem routeContext_plug_eq_chosen
    {program : CTS.Program} {snapshot : Term}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program}
    {routeContext : Context}
    (selected : CanonicalTraversal.RouteContext
      (selectedAction program) snapshot tree route label routeContext)
    (response : Term) :
    ∃ body, routeContext.plug response = chosen snapshot body := by
  induction selected with
  | leaf label => exact ⟨response, rfl⟩
  | @left left right route label innerContext inner ih =>
      exact ⟨.app (innerContext.plug response)
          (RouteGrammar.compiledCall (selectedAction program) right snapshot),
        rfl⟩
  | @right left right route label innerContext inner ih =>
      exact ⟨.app (RouteGrammar.compiledCall (selectedAction program) left
          snapshot) (innerContext.plug response), rfl⟩

/-- Every exact same-snapshot dispatcher route is a registered ascent. -/
theorem RegisteredContext.route
    {program : CTS.Program} {snapshot : Term}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program}
    {routeContext : Context}
    (audit : PendingFrame.WholeCarrierAudit snapshot)
    (selected : CanonicalTraversal.RouteContext
      (selectedAction program) snapshot tree route label routeContext)
    (response : Term) : RegisteredContext response routeContext := by
  induction selected with
  | leaf label =>
      apply RegisteredContext.appRight .hole
      apply registeredRight_of_function_arity_ne_two
      intro equality
      change 1 = 2 at equality
      cases equality
  | @left left right route label innerContext inner ih =>
      let active := innerContext.plug response
      let dormant := RouteGrammar.compiledCall (selectedAction program) right
        snapshot
      have throughInner : RegisteredContext response innerContext := ih
      obtain ⟨activeBody, activeEq⟩ :=
        routeContext_plug_eq_chosen inner response
      have throughFork : RegisteredContext response
          (.appLeft innerContext dormant) := by
        apply RegisteredContext.appLeft throughInner
        rw [activeEq]
        simpa [chosen] using
          registeredLeft_selectedRoute snapshot activeBody dormant audit
      have throughChosen : RegisteredContext response
          (.appRight (.app .s snapshot) (.appLeft innerContext dormant)) := by
        apply RegisteredContext.appRight throughFork
        apply registeredRight_of_function_arity_ne_two
        intro equality
        change 1 = 2 at equality
        cases equality
      simpa [CanonicalTraversal.selectedLeftContext, dormant] using throughChosen
  | @right left right route label innerContext inner ih =>
      let dormant := RouteGrammar.compiledCall (selectedAction program) left
        snapshot
      have throughInner : RegisteredContext response innerContext := ih
      have throughFork : RegisteredContext response
          (.appRight dormant innerContext) := by
        apply RegisteredContext.appRight throughInner
        apply registeredRight_of_function_arity_ne_two
        intro equality
        rw [RouteGrammar.compiledCall_headArity] at equality
        cases equality
      have throughChosen : RegisteredContext response
          (.appRight (.app .s snapshot) (.appRight dormant innerContext)) := by
        apply RegisteredContext.appRight throughFork
        apply registeredRight_of_function_arity_ne_two
        intro equality
        change 1 = 2 at equality
        cases equality
      simpa [CanonicalTraversal.selectedRightContext, dormant] using throughChosen

/-- The marked Local dispatcher parent passes neither pending nor live guards. -/
theorem registeredRight_markedDispatcher
    (snapshot dispatcherTerm : Term)
    (audit : PendingFrame.WholeCarrierAudit snapshot) :
    RegisteredParent dispatcherTerm
      (.right (Carrier.markedHField snapshot snapshot)) := by
  have pendingGuard := PendingFrame.guard?_markedLocalDispatcher
    snapshot dispatcherTerm audit
  have pendingReject : Pattern.matchesBool PendingFrame.pendingPattern
      (.app (Carrier.markedHField snapshot snapshot) dispatcherTerm) = false := by
    cases matched : Pattern.matchesBool PendingFrame.pendingPattern
        (.app (Carrier.markedHField snapshot snapshot) dispatcherTerm) with
    | false => rfl
    | true =>
        have impossible : PendingFrame.guard?
            (.app (Carrier.markedHField snapshot snapshot) dispatcherTerm)
            [.right] = some dispatcherTerm := by
          unfold PendingFrame.guard?
          rw [if_pos rfl, if_pos matched]
          simp [Term.subterm?]
        rw [pendingGuard] at impossible
        cases impossible
  cases snapshot with
  | s =>
      rcases audit with hfive | hsix
      · cases hfive
      · cases hsix
  | app function argument =>
      exact ⟨pendingReject, rfl, rfl⟩

/-- Either exact halt-field state is a registered dispatcher parent. -/
theorem registeredRight_haltField
    (status : ReachableAudit.HaltState) (snapshot dispatcherTerm : Term)
    (audit : PendingFrame.WholeCarrierAudit snapshot) :
    RegisteredParent dispatcherTerm
      (.right (ReachableAudit.haltField status snapshot)) := by
  cases status with
  | fresh =>
      apply registeredRight_of_function_arity_ne_two
      intro equality
      rw [ReachableAudit.haltField_fresh, headArity_freshHField] at equality
      cases equality
  | marked =>
      simpa [ReachableAudit.haltField_marked] using
        registeredRight_markedDispatcher snapshot dispatcherTerm audit

/-- The exact Local shell above its dispatcher is a registered ascent. -/
theorem RegisteredContext.localDispatcher
    (bits : List Bool) (continuation snapshot dispatcherTerm : Term)
    (status : ReachableAudit.HaltState)
    (audit : PendingFrame.WholeCarrierAudit snapshot) :
    RegisteredContext dispatcherTerm
      (CanonicalTraversal.localDispatcherContext bits continuation
        (ReachableAudit.haltField status snapshot) snapshot snapshot) := by
  let first : Context :=
    .appRight (ReachableAudit.haltField status snapshot) .hole
  let second : Context :=
    .appLeft first (.app (seedCode bits) snapshot)
  let third : Context :=
    .appLeft second (.app continuation snapshot)
  have h0 : RegisteredContext dispatcherTerm .hole := .hole
  have h1 : RegisteredContext dispatcherTerm first := by
    apply RegisteredContext.appRight h0
    exact registeredRight_haltField status snapshot dispatcherTerm audit
  have h2 : RegisteredContext dispatcherTerm second := by
    apply RegisteredContext.appLeft h1
    apply registeredLeft_of_child_arity_ne_two
    intro equality
    cases status with
    | fresh =>
        change 4 = 2 at equality
        cases equality
    | marked =>
        change 3 = 2 at equality
        cases equality
  have h3 : RegisteredContext dispatcherTerm third := by
    apply RegisteredContext.appLeft h2
    apply registeredLeft_of_child_arity_ne_two
    intro equality
    cases status with
    | fresh =>
        change 5 = 2 at equality
        cases equality
    | marked =>
        change 4 = 2 at equality
        cases equality
  simpa [CanonicalTraversal.localDispatcherContext, third, second, first]
    using h3

/-- Constructive components of an empty list append. -/
theorem append_eq_nil_parts
    {first second : List α} (empty : first ++ second = []) :
    first = [] ∧ second = [] := by
  cases first with
  | nil => exact ⟨rfl, empty⟩
  | cons head tail => cases empty

/-- Associativity of one-hole context composition. -/
theorem context_comp_assoc (first second third : Context) :
    (first.comp second).comp third = first.comp (second.comp third) := by
  induction first with
  | hole => rfl
  | appLeft inner argument ih =>
      simp [Context.comp, ih]
  | appRight function inner ih =>
      simp [Context.comp, ih]

/-- An exact empty descent consists entirely of registered ascent parents. -/
theorem RegisteredContext.ofDescentEmptyAux
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term}
    (admissible : Carrier.Admissible continuation)
    {decoded : List Bool} {context : Context}
    (descent : CanonicalTraversal.Descent program tree bits continuation
      source decoded context)
    (empty : decoded = []) : RegisteredContext omega context := by
  induction descent with
  | @base queueContext decoded queue =>
      have queueShape := RegisteredContext.ofQueueEmptyAux omega queue empty
      let actions := compileActions program tree
      let beta := baseBeta (environmentCode actions bits) continuation
      let queueTerm := queueContext.plug omega
      have baseShape := RegisteredContext.mutableBase actions bits continuation
        beta queueTerm admissible
      have complete := baseShape.comp queueShape
      simpa [actions, beta, queueTerm, Context.plug_comp] using complete
  | @«local» snapshot currentContext segmentContext routeContext currentWord
      appended status route label snapshotInv current segment selectedRoute ih =>
      obtain ⟨currentEmpty, appendedEmpty⟩ := append_eq_nil_parts empty
      have currentShape := ih currentEmpty
      let currentRoot := currentContext.plug omega
      have segmentShape := RegisteredContext.ofQueueEmptyAux currentRoot segment
        appendedEmpty
      have accumulatorShape : RegisteredContext omega
          (segmentContext.comp currentContext) :=
        segmentShape.comp currentShape
      let accumulator := segmentContext.plug currentRoot
      have actionOuter := RegisteredContext.action program label snapshot
        accumulator
      have responseShape : RegisteredContext omega
          ((CanonicalTraversal.actionContext
            (actionHistories program label snapshot)).comp
            (segmentContext.comp currentContext)) :=
        RegisteredContext.comp
          (endpoint := omega)
          (outer := CanonicalTraversal.actionContext
            (actionHistories program label snapshot))
          (inner := segmentContext.comp currentContext)
          (by
            simpa [accumulator, currentRoot, Context.plug_comp] using
              actionOuter)
          accumulatorShape
      let actionResponse :=
        (CanonicalTraversal.actionContext
          (actionHistories program label snapshot)).plug accumulator
      have snapshotAudit := snapshotInv.wholeCarrierAudit admissible
      have routeOuter := RegisteredContext.route snapshotAudit selectedRoute
        actionResponse
      have dispatcherShape : RegisteredContext omega
          (routeContext.comp
            ((CanonicalTraversal.actionContext
              (actionHistories program label snapshot)).comp
              (segmentContext.comp currentContext))) :=
        RegisteredContext.comp
          (endpoint := omega) (outer := routeContext)
          (inner :=
            (CanonicalTraversal.actionContext
              (actionHistories program label snapshot)).comp
              (segmentContext.comp currentContext))
          (by
            simpa [actionResponse, accumulator, currentRoot,
              Context.plug_comp] using routeOuter)
          responseShape
      let dispatcherTerm := routeContext.plug actionResponse
      have localOuter := RegisteredContext.localDispatcher bits continuation
        snapshot dispatcherTerm status snapshotAudit
      have complete := RegisteredContext.comp
        (endpoint := omega)
        (outer := CanonicalTraversal.localDispatcherContext bits continuation
          (ReachableAudit.haltField status snapshot) snapshot snapshot)
        (inner := routeContext.comp
          ((CanonicalTraversal.actionContext
            (actionHistories program label snapshot)).comp
            (segmentContext.comp currentContext)))
        (by
          simpa [dispatcherTerm, actionResponse, accumulator, currentRoot,
            Context.plug_comp] using localOuter)
        dispatcherShape
      simpa [CanonicalTraversal.localContext,
        CanonicalTraversal.dispatcherContext,
        CanonicalTraversal.accumulatorContext, currentRoot, accumulator,
        actionResponse, dispatcherTerm] using complete

/-- Specialized exact-empty descent theorem. -/
theorem RegisteredContext.ofDescentEmpty
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term}
    (admissible : Carrier.Admissible continuation)
    {context : Context}
    (descent : CanonicalTraversal.Descent program tree bits continuation
      source [] context) : RegisteredContext omega context :=
  RegisteredContext.ofDescentEmptyAux admissible descent rfl

/--
The compiled UP loop follows every edge of a registered context without a
term mutation and returns at its exact context root.
-/
theorem run_registeredContext
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) {endpoint : Term} {context : Context}
    (shape : RegisteredContext endpoint context)
    (parents : List ParentFrame) :
    ∃ ticks,
      ZeroMutationRun (SchedulerControl.machine program dispatcher) ticks
        (SchedulerInvariant.upConfiguration program dispatcher registers
          endpoint (ContextCursor.frames context endpoint parents))
        (SchedulerInvariant.upConfiguration program dispatcher registers
          (context.plug endpoint) parents) := by
  induction shape generalizing parents with
  | hole => exact ⟨0, ⟨rfl, rfl⟩⟩
  | @appLeft inner argument inside parent ih =>
      obtain ⟨insideTicks, insideRun⟩ :=
        ih (.left argument :: parents)
      have edgeRun := registeredParent_zeroRun program dispatcher registers
        (inner.plug endpoint) (.left argument) parents parent
      exact ⟨insideTicks +
          registeredParentTicks program dispatcher (inner.plug endpoint)
            (.left argument) parents,
        by
          simpa [ContextCursor.frames, Context.plug] using
            insideRun.trans edgeRun⟩
  | @appRight function inner inside parent ih =>
      obtain ⟨insideTicks, insideRun⟩ :=
        ih (.right function :: parents)
      have edgeRun := registeredParent_zeroRun program dispatcher registers
        (inner.plug endpoint) (.right function) parents parent
      exact ⟨insideTicks +
          registeredParentTicks program dispatcher (inner.plug endpoint)
            (.right function) parents,
        by
          simpa [ContextCursor.frames, Context.plug] using
            insideRun.trans edgeRun⟩

/-- Context composition exposes the inner zipper frames first. -/
theorem frames_comp (outer inner : Context) (endpoint : Term)
    (parents : List ParentFrame) :
    ContextCursor.frames (outer.comp inner) endpoint parents =
      ContextCursor.frames inner endpoint
        (ContextCursor.frames outer (inner.plug endpoint) parents) := by
  induction outer generalizing parents with
  | hole => rfl
  | appLeft context argument ih => exact ih _
  | appRight function context ih => exact ih _

/-- Rebuilding exact context frames is literal context plugging. -/
theorem rebuild_frames (context : Context) (endpoint : Term)
    (parents : List ParentFrame) :
    Cursor.rebuild (ContextCursor.frames context endpoint parents) endpoint =
      Cursor.rebuild parents (context.plug endpoint) := by
  induction context generalizing parents with
  | hole => rfl
  | appLeft inner argument ih => exact ih _
  | appRight function inner ih => exact ih _

/-- Filling a fixed one-hole context is injective in the endpoint. -/
theorem context_plug_injective (context : Context) :
    ∀ {first second : Term},
      context.plug first = context.plug second → first = second := by
  induction context with
  | hole =>
      intro first second equality
      exact equality
  | appLeft inner argument ih =>
      intro first second equality
      apply ih
      injection equality
  | appRight function inner ih =>
      intro first second equality
      apply ih
      injection equality

/--
Proof-only factorization of a complete descent context at its selected first
live parent.  The inner context is registered and contains no earlier live
cell; `outerContext` is exactly the retained `FrontCertificate` context.
-/
structure FrontPath (fullContext outerContext : Context) (bit : Bool)
    (innerContext : Context) : Prop where
  full_eq : fullContext = outerContext.comp
    (.appRight (PureSFormal.PureS.live bit) innerContext)
  inner_registered : RegisteredContext omega innerContext

/-- The literal predecessor immediately below the selected live cell. -/
def frontPredecessor (innerContext : Context) : Term :=
  innerContext.plug omega

/-- Exact zipper suffix outside the selected live occurrence. -/
def frontOuterParents (outerContext : Context) (bit : Bool)
    (innerContext : Context)
    (parents : List ParentFrame) : List ParentFrame :=
  ContextCursor.frames outerContext
    (.app (PureSFormal.PureS.live bit) (frontPredecessor innerContext)) parents

/--
Every construction-selected front supplies its complete terminal context and
the registered inner factor required by the executable ascent theorem.
-/
theorem FrontPath.ofSelectedFront
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term}
    (admissible : Carrier.Admissible continuation)
    {bit : Bool} {suffix : List Bool} {outerContext : Context}
    (selected : CanonicalTraversal.SelectedFront program tree bits continuation
      source bit suffix outerContext) :
    ∃ fullContext innerContext,
      CanonicalTraversal.Descent program tree bits continuation source
        (bit :: suffix) fullContext ∧
      FrontPath fullContext outerContext bit innerContext := by
  induction selected with
  | @base queueContext cellOuter bit suffix cellAddress queue selection =>
      obtain ⟨innerContext, innerEmpty, contextEq⟩ := selection.split
      let baseContext := MutableBase.queueContext (compileActions program tree)
        bits continuation
        (baseBeta
          (environmentCode (compileActions program tree) bits) continuation)
      let fullContext := baseContext.comp queueContext
      have registered := RegisteredContext.ofQueueEmpty innerEmpty
      have factor : fullContext =
          (baseContext.comp cellOuter).comp
            (.appRight (PureSFormal.PureS.live bit) innerContext) := by
        dsimp [fullContext]
        rw [contextEq]
        exact (context_comp_assoc baseContext cellOuter
          (.appRight (PureSFormal.PureS.live bit) innerContext)).symm
      refine ⟨fullContext, innerContext, ?_, ?_⟩
      · simpa [fullContext, baseContext] using
          (CanonicalTraversal.Descent.base queue :
            CanonicalTraversal.Descent program tree bits continuation _ _ _)
      · exact ⟨by simpa [baseContext] using factor, registered⟩
  | @inside snapshot currentContext segmentContext routeContext currentOuter bit
      currentSuffix appended status route label snapshotInv current segment
      selectedRoute inner ih =>
      obtain ⟨innerFull, innerContext, innerDescent, innerPath⟩ := ih
      have currentContextEq : currentContext = innerFull :=
        (current.deterministic admissible innerDescent).1
      subst innerFull
      let prefixContext :=
        (CanonicalTraversal.localDispatcherContext bits continuation
          (ReachableAudit.haltField status snapshot) snapshot snapshot).comp
          (routeContext.comp
            ((CanonicalTraversal.actionContext
              (actionHistories program label snapshot)).comp segmentContext))
      let fullContext := prefixContext.comp currentContext
      have factor : fullContext =
          ((CanonicalTraversal.localDispatcherContext bits continuation
            (ReachableAudit.haltField status snapshot) snapshot snapshot).comp
            (routeContext.comp
              ((CanonicalTraversal.actionContext
                (actionHistories program label snapshot)).comp
                (segmentContext.comp currentOuter)))).comp
            (.appRight (PureSFormal.PureS.live bit)
              innerContext) := by
        dsimp [fullContext, prefixContext]
        rw [innerPath.full_eq]
        simp only [context_comp_assoc]
      have wholeDescent : CanonicalTraversal.Descent program tree bits
          continuation (fullContext.plug omega)
          ((bit :: currentSuffix) ++ appended) fullContext := by
        simpa [fullContext, prefixContext, CanonicalTraversal.localContext,
          CanonicalTraversal.dispatcherContext,
          CanonicalTraversal.accumulatorContext, context_comp_assoc] using
            (CanonicalTraversal.Descent.local snapshotInv current segment
              selectedRoute)
      refine ⟨fullContext, innerContext, ?_, ?_⟩
      · simpa [fullContext, prefixContext, List.append_assoc] using!
          wholeDescent
      · exact ⟨factor, innerPath.inner_registered⟩
  | @segment snapshot currentContext segmentContext routeContext cellOuter bit
      suffix cellAddress status route label snapshotInv current queue
      selectedRoute selection =>
      obtain ⟨innerSegment, innerEmpty, segmentEq⟩ := selection.split
      let currentRoot := currentContext.plug omega
      have currentRegistered :=
        RegisteredContext.ofDescentEmpty admissible current
      have segmentRegistered := RegisteredContext.ofQueueEmptyAux currentRoot
        innerEmpty rfl
      have innerRegistered : RegisteredContext omega
          (innerSegment.comp currentContext) := by
        exact RegisteredContext.comp
          (endpoint := omega) (outer := innerSegment) (inner := currentContext)
          (by simpa [currentRoot] using segmentRegistered) currentRegistered
      let innerContext := innerSegment.comp currentContext
      let prefixContext :=
        (CanonicalTraversal.localDispatcherContext bits continuation
          (ReachableAudit.haltField status snapshot) snapshot snapshot).comp
          (routeContext.comp
            (CanonicalTraversal.actionContext
              (actionHistories program label snapshot)))
      let fullContext := prefixContext.comp
        (segmentContext.comp currentContext)
      have factor : fullContext =
          ((CanonicalTraversal.localDispatcherContext bits continuation
            (ReachableAudit.haltField status snapshot) snapshot snapshot).comp
            (routeContext.comp
              ((CanonicalTraversal.actionContext
                (actionHistories program label snapshot)).comp
                cellOuter))).comp
            (.appRight (PureSFormal.PureS.live bit) innerContext) := by
        dsimp [fullContext, innerContext, prefixContext]
        rw [segmentEq]
        simp only [context_comp_assoc, Context.comp]
      have wholeDescent : CanonicalTraversal.Descent program tree bits
          continuation (fullContext.plug omega) (bit :: suffix) fullContext := by
        simpa [fullContext, prefixContext, CanonicalTraversal.localContext,
          CanonicalTraversal.dispatcherContext,
          CanonicalTraversal.accumulatorContext, context_comp_assoc] using
            (CanonicalTraversal.Descent.local snapshotInv current queue
              selectedRoute)
      refine ⟨fullContext, innerContext, ?_, ?_⟩
      · simpa [fullContext, prefixContext] using! wholeDescent
      · exact ⟨factor, innerRegistered⟩

/-! ## The first live parent and its unique C4 mutation -/

/-- Exact zero-mutation prefix cost before the first-live `Rdx` row. -/
def firstLivePrefixTicks
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (predecessor : Term) (parents : List ParentFrame) : Nat :=
  let origin : Cursor :=
    ⟨predecessor, .right (PureSFormal.PureS.live bit) :: parents⟩
  let parent : Cursor :=
    ⟨.app (PureSFormal.PureS.live bit) predecessor, parents⟩
  ((((1 + SchedulerControl.compiledProbeCost program dispatcher
      (.pending .scan) origin) + 1) + 1) +
    SchedulerControl.compiledProbeCost program dispatcher
      (.upLiveZero .right) parent) +
    if bit then
      SchedulerControl.compiledProbeCost program dispatcher
        (.upLiveOne .right) parent
    else 0

/--
The UP loop reaches the first live parent with no mutation and with the exact
Boolean guard result stored in finite control.
-/
theorem firstLive_prefix_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (predecessor : Term)
    (parents : List ParentFrame) :
    ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (firstLivePrefixTicks program dispatcher bit predecessor parents)
      (SchedulerInvariant.upConfiguration program dispatcher registers
        predecessor
        (.right (PureSFormal.PureS.live bit) :: parents))
      ⟨some (.macro (.upLiveFound bit) registers),
        ⟨.app (PureSFormal.PureS.live bit) predecessor, parents⟩⟩ := by
  cases bit with
  | false =>
      let origin : Cursor :=
        ⟨predecessor,
          .right (PureSFormal.PureS.live false) :: parents⟩
      let parent : Cursor :=
        ⟨.app (PureSFormal.PureS.live false) predecessor, parents⟩
      let pendingStart : Configuration program dispatcher :=
        ⟨some (SchedulerControl.startProbe (.pending .scan) registers), origin⟩
      let moveState : Configuration program dispatcher :=
        ⟨some (.macro .upMove registers), origin⟩
      let ancestorState : Configuration program dispatcher :=
        ⟨some (.macro (.upAncestor .right) registers), parent⟩
      let liveZeroStart : Configuration program dispatcher :=
        ⟨some (SchedulerControl.startProbe (.upLiveZero .right) registers),
          parent⟩
      have enter : ZeroMutationRun
          (SchedulerControl.machine program dispatcher) 1
          (SchedulerInvariant.upConfiguration program dispatcher registers
            predecessor
            (.right (PureSFormal.PureS.live false) :: parents))
          pendingStart := by
        exact ⟨rfl, rfl⟩
      have pendingProbe := parentProbe_zeroRun program dispatcher
        (.pending .scan) registers origin .right rfl
      have pendingAnswer : SchedulerControl.compiledProbeAnswer program
          dispatcher (.pending .scan) origin = false := by
        rfl
      have pending : ZeroMutationRun
          (SchedulerControl.machine program dispatcher)
          (SchedulerControl.compiledProbeCost program dispatcher
            (.pending .scan) origin)
          pendingStart moveState := by
        simpa [pendingStart, moveState, origin,
          SchedulerExecution.commandResult, SchedulerControl.probeAnswer,
          pendingAnswer] using pendingProbe
      have move : ZeroMutationRun
          (SchedulerControl.machine program dispatcher) 1 moveState
          ancestorState := by
        exact ⟨rfl, rfl⟩
      have enterLive : ZeroMutationRun
          (SchedulerControl.machine program dispatcher) 1 ancestorState
          liveZeroStart := by
        exact ⟨rfl, rfl⟩
      have liveProbe := ZeroMutationRun.localProbe program dispatcher
        (.upLiveZero .right) registers parent rfl
      have liveAnswer : SchedulerControl.compiledProbeAnswer program dispatcher
          (.upLiveZero .right) parent = true := by
        rfl
      have live : ZeroMutationRun
          (SchedulerControl.machine program dispatcher)
          (SchedulerControl.compiledProbeCost program dispatcher
            (.upLiveZero .right) parent)
          liveZeroStart
          ⟨some (.macro (.upLiveFound false) registers), parent⟩ := by
        simpa [liveZeroStart, parent, SchedulerExecution.commandResult,
          SchedulerControl.probeAnswer, liveAnswer] using liveProbe
      have throughPending := enter.trans pending
      have throughMove := throughPending.trans move
      have throughEnter := throughMove.trans enterLive
      have complete := throughEnter.trans live
      simpa [firstLivePrefixTicks, origin, parent] using complete
  | true =>
      let origin : Cursor :=
        ⟨predecessor,
          .right (PureSFormal.PureS.live true) :: parents⟩
      let parent : Cursor :=
        ⟨.app (PureSFormal.PureS.live true) predecessor, parents⟩
      let pendingStart : Configuration program dispatcher :=
        ⟨some (SchedulerControl.startProbe (.pending .scan) registers), origin⟩
      let moveState : Configuration program dispatcher :=
        ⟨some (.macro .upMove registers), origin⟩
      let ancestorState : Configuration program dispatcher :=
        ⟨some (.macro (.upAncestor .right) registers), parent⟩
      let liveZeroStart : Configuration program dispatcher :=
        ⟨some (SchedulerControl.startProbe (.upLiveZero .right) registers),
          parent⟩
      let liveOneStart : Configuration program dispatcher :=
        ⟨some (SchedulerControl.startProbe (.upLiveOne .right) registers),
          parent⟩
      have enter : ZeroMutationRun
          (SchedulerControl.machine program dispatcher) 1
          (SchedulerInvariant.upConfiguration program dispatcher registers
            predecessor
            (.right (PureSFormal.PureS.live true) :: parents))
          pendingStart := by
        exact ⟨rfl, rfl⟩
      have pendingProbe := parentProbe_zeroRun program dispatcher
        (.pending .scan) registers origin .right rfl
      have pendingAnswer : SchedulerControl.compiledProbeAnswer program
          dispatcher (.pending .scan) origin = false := by
        rfl
      have pending : ZeroMutationRun
          (SchedulerControl.machine program dispatcher)
          (SchedulerControl.compiledProbeCost program dispatcher
            (.pending .scan) origin)
          pendingStart moveState := by
        simpa [pendingStart, moveState, origin,
          SchedulerExecution.commandResult, SchedulerControl.probeAnswer,
          pendingAnswer] using pendingProbe
      have move : ZeroMutationRun
          (SchedulerControl.machine program dispatcher) 1 moveState
          ancestorState := by
        exact ⟨rfl, rfl⟩
      have enterLive : ZeroMutationRun
          (SchedulerControl.machine program dispatcher) 1 ancestorState
          liveZeroStart := by
        exact ⟨rfl, rfl⟩
      have zeroProbe := ZeroMutationRun.localProbe program dispatcher
        (.upLiveZero .right) registers parent rfl
      have zeroAnswer : SchedulerControl.compiledProbeAnswer program dispatcher
          (.upLiveZero .right) parent = false := by
        rfl
      have zero : ZeroMutationRun
          (SchedulerControl.machine program dispatcher)
          (SchedulerControl.compiledProbeCost program dispatcher
            (.upLiveZero .right) parent)
          liveZeroStart liveOneStart := by
        simpa [liveZeroStart, liveOneStart, parent,
          SchedulerExecution.commandResult, SchedulerControl.probeAnswer,
          zeroAnswer] using zeroProbe
      have oneProbe := ZeroMutationRun.localProbe program dispatcher
        (.upLiveOne .right) registers parent rfl
      have oneAnswer : SchedulerControl.compiledProbeAnswer program dispatcher
          (.upLiveOne .right) parent = true := by
        rfl
      have one : ZeroMutationRun
          (SchedulerControl.machine program dispatcher)
          (SchedulerControl.compiledProbeCost program dispatcher
            (.upLiveOne .right) parent)
          liveOneStart
          ⟨some (.macro (.upLiveFound true) registers), parent⟩ := by
        simpa [liveOneStart, parent, SchedulerExecution.commandResult,
          SchedulerControl.probeAnswer, oneAnswer] using oneProbe
      have throughPending := enter.trans pending
      have throughMove := throughPending.trans move
      have throughEnter := throughMove.trans enterLive
      have throughZero := throughEnter.trans zero
      have complete := throughZero.trans one
      simpa [firstLivePrefixTicks, origin, parent] using complete

/-- The first-live controller row is exactly the diagonal C4 contraction. -/
theorem firstLive_mutation
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (predecessor : Term)
    (parents : List ParentFrame) (notSeen : registers.seen = false) :
    CountedRun (SchedulerControl.machine program dispatcher) 1 1
      ⟨some (.macro (.upLiveFound bit) registers),
        ⟨.app (PureSFormal.PureS.live bit) predecessor, parents⟩⟩
      (SchedulerInvariant.upConfiguration program dispatcher
        (registers.observeLive bit)
        (Carrier.tombstone bit predecessor predecessor) parents) := by
  have contracted :
      (⟨.app (PureSFormal.PureS.live bit) predecessor, parents⟩ : Cursor).rdx? =
        some ⟨Carrier.tombstone bit predecessor predecessor, parents⟩ := by
    simpa [PureSFormal.PureS.live, b, Carrier.tombstone, Term.redex,
      Term.contractum] using
      Cursor.rdx?_redex (.s : Term) (valueTag bit) predecessor parents
  have executed : Primitive.Rdx.exec
      ⟨.app (PureSFormal.PureS.live bit) predecessor, parents⟩ =
        some ⟨Carrier.tombstone bit predecessor predecessor, parents⟩ := by
    simpa [Primitive.exec] using contracted
  constructor
  · simp [FiniteController.run, FiniteController.step,
      SchedulerControl.machine, SchedulerControl.transition,
      SchedulerInvariant.upConfiguration, notSeen,
      SchedulerControl.Registers.observeLive, executed]
  · simp [FiniteController.runMutationCount,
      FiniteController.mutationCount, SchedulerControl.machine,
      SchedulerControl.transition, notSeen, contracted]

/--
Complete first-live segment: a mutation-free compiled-probe prefix followed by
the unique C4 contraction.
-/
theorem firstLive_countedRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (predecessor : Term)
    (parents : List ParentFrame) (notSeen : registers.seen = false) :
    CountedRun (SchedulerControl.machine program dispatcher)
      (firstLivePrefixTicks program dispatcher bit predecessor parents + 1) 1
      (SchedulerInvariant.upConfiguration program dispatcher registers
        predecessor
        (.right (PureSFormal.PureS.live bit) :: parents))
      (SchedulerInvariant.upConfiguration program dispatcher
        (registers.observeLive bit)
        (Carrier.tombstone bit predecessor predecessor) parents) := by
  have prefixRun := firstLive_prefix_zeroRun program dispatcher registers bit
    predecessor parents
  have mutation := firstLive_mutation program dispatcher registers bit
    predecessor parents notSeen
  simpa using prefixRun.toCounted.trans mutation

/-- Executable bounded search returns exactly the post-C4 configuration. -/
theorem firstLive_seekMutation
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (predecessor : Term)
    (parents : List ParentFrame) (notSeen : registers.seen = false) :
    FiniteController.seekMutation
      (SchedulerControl.machine program dispatcher)
      (firstLivePrefixTicks program dispatcher bit predecessor parents + 1)
      (SchedulerInvariant.upConfiguration program dispatcher registers
        predecessor
        (.right (PureSFormal.PureS.live bit) :: parents)) =
      some (SchedulerInvariant.upConfiguration program dispatcher
        (registers.observeLive bit)
        (Carrier.tombstone bit predecessor predecessor) parents) := by
  have prefixRun := firstLive_prefix_zeroRun program dispatcher registers bit
    predecessor parents
  have mutation := firstLive_mutation program dispatcher registers bit
    predecessor parents notSeen
  have finalCount : FiniteController.mutationCount
      (SchedulerControl.machine program dispatcher)
      ⟨some (.macro (.upLiveFound bit) registers),
        ⟨.app (PureSFormal.PureS.live bit) predecessor, parents⟩⟩ = 1 := by
    simpa [FiniteController.runMutationCount] using mutation.count_eq
  have found := SchedulerInvariant.seekMutation_after_zero_prefix
    (SchedulerControl.machine program dispatcher)
    (firstLivePrefixTicks program dispatcher bit predecessor parents)
    (SchedulerInvariant.upConfiguration program dispatcher registers
      predecessor (.right (PureSFormal.PureS.live bit) :: parents))
    prefixRun.count_eq (by simpa [prefixRun.run_eq] using finalCount)
  have stepEq : FiniteController.step
      (SchedulerControl.machine program dispatcher)
      ⟨some (.macro (.upLiveFound bit) registers),
        ⟨.app (PureSFormal.PureS.live bit) predecessor, parents⟩⟩ =
      SchedulerInvariant.upConfiguration program dispatcher
        (registers.observeLive bit)
        (Carrier.tombstone bit predecessor predecessor) parents := by
    simpa [FiniteController.run] using mutation.run_eq
  simpa [prefixRun.run_eq, stepEq] using found

/-! ## Later live ancestors and the pending-frame exit -/

/-- Once a first bit has been recorded, a live parent is observed in place. -/
theorem laterLive_finish_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (predecessor : Term)
    (parents : List ParentFrame) (seen : registers.seen = true) :
    ZeroMutationRun (SchedulerControl.machine program dispatcher) 1
      ⟨some (.macro (.upLiveFound bit) registers),
        ⟨.app (PureSFormal.PureS.live bit) predecessor, parents⟩⟩
      (SchedulerInvariant.upConfiguration program dispatcher
        (registers.observeLive bit)
        (.app (PureSFormal.PureS.live bit) predecessor) parents) := by
  constructor
  · simp [FiniteController.run, FiniteController.step,
      SchedulerControl.machine, SchedulerControl.transition,
      SchedulerInvariant.upConfiguration, seen]
  · simp [FiniteController.runMutationCount,
      FiniteController.mutationCount, SchedulerControl.machine,
      SchedulerControl.transition, seen]

/-- Exact zero-mutation UP iteration across a later live ancestor. -/
theorem laterLiveParent_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (predecessor : Term)
    (parents : List ParentFrame) (seen : registers.seen = true) :
    ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (firstLivePrefixTicks program dispatcher bit predecessor parents + 1)
      (SchedulerInvariant.upConfiguration program dispatcher registers
        predecessor (.right (PureSFormal.PureS.live bit) :: parents))
      (SchedulerInvariant.upConfiguration program dispatcher
        (registers.observeLive bit)
        (.app (PureSFormal.PureS.live bit) predecessor) parents) := by
  have prefixRun := firstLive_prefix_zeroRun program dispatcher registers bit
    predecessor parents
  have finish := laterLive_finish_zeroRun program dispatcher registers bit
    predecessor parents seen
  exact prefixRun.trans finish

/-- Exact cost of recognizing the outer pending frame and leaving scan mode. -/
def pendingFrameDispatchTicks
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (hole₀ hole₁ hole₂ continuation child : Term)
    (parents : List ParentFrame) : Nat :=
  let origin : Cursor :=
    ⟨child, .right (PendingFrame.frameFunction hole₀ hole₁ hole₂
      continuation) :: parents⟩
  1 + SchedulerControl.compiledProbeCost program dispatcher
    (.pending .scan) origin + 1

/--
At the exact outer pending frame, a nonempty scan takes the accepted pending
branch and moves up into `.frameDispatch`, without another term mutation.
-/
theorem pendingFrameDispatch_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program)
    (hole₀ hole₁ hole₂ continuation child : Term)
    (parents : List ParentFrame) (seen : registers.seen = true) :
    ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (pendingFrameDispatchTicks program dispatcher
        hole₀ hole₁ hole₂ continuation child parents)
      (SchedulerInvariant.upConfiguration program dispatcher registers child
        (.right (PendingFrame.frameFunction hole₀ hole₁ hole₂
          continuation) :: parents))
      ⟨some (.macro (.family .frameDispatch) registers),
        ⟨PendingFrame.pending hole₀ hole₁ hole₂ continuation child,
          parents⟩⟩ := by
  let origin : Cursor :=
    ⟨child, .right (PendingFrame.frameFunction hole₀ hole₁ hole₂
      continuation) :: parents⟩
  let probeStart : Configuration program dispatcher :=
    ⟨some (SchedulerControl.startProbe (.pending .scan) registers), origin⟩
  let decision : Configuration program dispatcher :=
    ⟨some (.macro (.pendingDecision .scan) registers), origin⟩
  have enter : ZeroMutationRun
      (SchedulerControl.machine program dispatcher) 1
      (SchedulerInvariant.upConfiguration program dispatcher registers child
        (.right (PendingFrame.frameFunction hole₀ hole₁ hole₂
          continuation) :: parents)) probeStart := by
    exact ⟨rfl, rfl⟩
  have probeRun := parentProbe_zeroRun program dispatcher (.pending .scan)
    registers origin .right rfl
  have probe : ZeroMutationRun
      (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher
        (.pending .scan) origin) probeStart decision := by
    simpa [probeStart, decision, origin,
      SchedulerExecution.commandResult,
      SchedulerControl.compiledProbeAnswer, SchedulerControl.probeSite,
      Probe.parentMatches, SchedulerControl.probePattern,
      SchedulerControl.probeAnswer, PendingFrame.pending,
      ParentFrame.fill] using! probeRun
  have leave : ZeroMutationRun
      (SchedulerControl.machine program dispatcher) 1 decision
      ⟨some (.macro (.family .frameDispatch) registers),
        ⟨PendingFrame.pending hole₀ hole₁ hole₂ continuation child,
          parents⟩⟩ := by
    constructor
    · simp [FiniteController.run, FiniteController.step,
        SchedulerControl.machine, SchedulerControl.transition, decision,
        origin, SchedulerInvariant.upConfiguration, seen,
        PendingFrame.pending, ParentFrame.fill, Primitive.exec, Cursor.up?]
    · simp [FiniteController.runMutationCount,
        FiniteController.mutationCount, SchedulerControl.machine,
        SchedulerControl.transition, decision, origin, seen]
  have complete := (enter.trans probe).trans leave
  simpa [pendingFrameDispatchTicks, origin, Nat.add_assoc] using complete

/-! ## Exact mutation-free ascent outside the selected cell -/

/-- Register state after observing the later live labels in ascent order. -/
def scanRegisters (registers : Registers program) (suffix : List Bool) :
    Registers program :=
  suffix.foldl Registers.observeLive registers

@[simp]
theorem scanRegisters_nil (registers : Registers program) :
    scanRegisters registers [] = registers :=
  rfl

@[simp]
theorem scanRegisters_append_singleton
    (registers : Registers program) (suffix : List Bool) (bit : Bool) :
    scanRegisters registers (suffix ++ [bit]) =
      (scanRegisters registers suffix).observeLive bit := by
  induction suffix generalizing registers with
  | nil => rfl
  | cons head tail ih =>
      exact ih (registers.observeLive head)

/-- Once set, the `seen` register remains set throughout an outer ascent. -/
theorem scanRegisters_seen
    (registers : Registers program) (suffix : List Bool)
    (seen : registers.seen = true) :
    (scanRegisters registers suffix).seen = true := by
  induction suffix generalizing registers with
  | nil => exact seen
  | cons bit rest ih =>
      apply ih (registers := registers.observeLive bit)
      simp [Registers.observeLive, seen]

/-- Later-live observations preserve the already recorded first bit. -/
theorem scanRegisters_bit_of_seen
    (registers : Registers program) (suffix : List Bool)
    (seen : registers.seen = true) :
    (scanRegisters registers suffix).bit = registers.bit := by
  induction suffix generalizing registers with
  | nil => rfl
  | cons bit rest ih =>
      rw [show scanRegisters registers (bit :: rest) =
        scanRegisters (registers.observeLive bit) rest by rfl]
      rw [ih (registers := registers.observeLive bit) (by
        simp [Registers.observeLive, seen])]
      simp [Registers.observeLive, seen]

/-- A true tail flag remains true through all subsequent observations. -/
theorem scanRegisters_tail_true
    (registers : Registers program) (suffix : List Bool)
    (tail : registers.tail = true) :
    (scanRegisters registers suffix).tail = true := by
  induction suffix generalizing registers with
  | nil => exact tail
  | cons bit rest ih =>
      apply ih (registers := registers.observeLive bit)
      unfold Registers.observeLive
      split <;> simp [tail]

/-- A nonempty suffix sets the later-live tail flag. -/
theorem scanRegisters_tail_true_of_nonempty
    (registers : Registers program) (suffix : List Bool)
    (seen : registers.seen = true) (nonempty : suffix ≠ []) :
    (scanRegisters registers suffix).tail = true := by
  cases suffix with
  | nil => exact (nonempty rfl).elim
  | cons bit rest =>
      apply scanRegisters_tail_true (registers.observeLive bit) rest
      simp [Registers.observeLive, seen]

/--
Starting from cleared scan registers, the complete scan retains the selected
first bit and sets `tail` exactly when the selected word has a suffix.
-/
theorem scanRegisters_afterFirst_coherent
    (registers : Registers program) (bit : Bool) (suffix : List Bool)
    (notSeen : registers.seen = false) (noTail : registers.tail = false) :
    let final := scanRegisters (registers.observeLive bit) suffix
    final.bit = some bit ∧ final.seen = true ∧
      final.tail = !suffix.isEmpty := by
  dsimp
  have firstSeen : (registers.observeLive bit).seen = true := by
    simp [Registers.observeLive, notSeen]
  have firstBit : (registers.observeLive bit).bit = some bit := by
    simp [Registers.observeLive, notSeen]
  refine ⟨(scanRegisters_bit_of_seen (registers.observeLive bit) suffix
      firstSeen).trans firstBit, scanRegisters_seen _ _ firstSeen, ?_⟩
  cases suffix with
  | nil => simp [scanRegisters, Registers.observeLive, notSeen, noTail]
  | cons later rest =>
      simpa using scanRegisters_tail_true_of_nonempty
        (registers.observeLive bit) (later :: rest) firstSeen (by simp)

/--
An executable outer-ascent context.  Live constructors are the later logical
cells.  A `registered` layer packages any exact neutral context whose parents
are all accepted by the controller's registered-ancestor probe.
-/
inductive OperationalAscent (endpoint : Term) : Context → List Bool → Prop where
  | hole : OperationalAscent endpoint .hole []
  | live {context : Context} {suffix : List Bool}
      (bit : Bool) (inner : OperationalAscent endpoint context suffix) :
      OperationalAscent endpoint
        (.appRight (PureSFormal.PureS.live bit) context) (suffix ++ [bit])
  | registered {outerContext innerContext : Context} {suffix : List Bool}
      (inner : OperationalAscent endpoint innerContext suffix)
      (outer : RegisteredContext (innerContext.plug endpoint) outerContext) :
      OperationalAscent endpoint (outerContext.comp innerContext) suffix

namespace OperationalAscent

/-- A tombstone wrapper is one exact neutral registered layer. -/
theorem wrapTombstone
    {endpoint : Term} {context : Context} {suffix : List Bool}
    (bit : Bool) (audit : Term)
    (inner : OperationalAscent endpoint context suffix) :
    OperationalAscent endpoint
      (CellDeletion.tombstoneContext bit audit context) suffix := by
  have neutral : RegisteredContext (context.plug endpoint)
      (CellDeletion.tombstoneContext bit audit .hole) := by
    exact RegisteredContext.ofQueueEmptyAux (context.plug endpoint)
      (.tombstone bit audit .hole) rfl
  have wrapped := OperationalAscent.registered inner neutral
  simpa [CellDeletion.tombstoneContext, Context.comp] using wrapped

/-- Every exact cell-outer context has executable ascent semantics. -/
theorem ofOuterContext
    {context : Context} {address : Address} {suffix : List Bool}
    (endpoint : Term)
    (outer : CellDeletion.OuterContext context address suffix) :
    OperationalAscent endpoint context suffix := by
  induction outer with
  | hole => exact .hole
  | live bit inner ih => exact .live bit ih
  | tombstone bit audit inner ih => exact wrapTombstone bit audit ih

/-- A canonical queue segment extends executable ascent in logical order. -/
theorem wrapQueue
    {endpoint : Term} {queueContext innerContext : Context}
    {appended suffix : List Bool}
    (queue : CanonicalTraversal.QueueContext queueContext appended)
    (inner : OperationalAscent endpoint innerContext suffix) :
    OperationalAscent endpoint (queueContext.comp innerContext)
      (suffix ++ appended) := by
  induction queue with
  | hole => simpa only [Context.comp, List.append_nil] using inner
  | live bit queue ih =>
      have wrapped := OperationalAscent.live bit ih
      simpa [Context.comp, List.append_assoc] using wrapped
  | tombstone bit audit queue ih =>
      have wrapped := wrapTombstone bit audit ih
      simpa [CellDeletion.tombstoneContext, Context.comp] using wrapped

/--
A construction-selected front carries all audit hypotheses required to turn
its declarative outer `AscentContext` into executable registered/live layers.
-/
theorem ofSelectedFront
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term}
    (admissible : Carrier.Admissible continuation)
    {bit : Bool} {suffix : List Bool} {outerContext : Context}
    (selected : CanonicalTraversal.SelectedFront program tree bits continuation
      source bit suffix outerContext)
    (endpoint : Term) : OperationalAscent endpoint outerContext suffix := by
  induction selected with
  | @base queueContext cellOuter bit suffix cellAddress queue selection =>
      have cellAscent := ofOuterContext endpoint selection.outerShape
      let actions := compileActions program tree
      let beta := baseBeta (environmentCode actions bits) continuation
      let baseContext := MutableBase.queueContext actions bits continuation beta
      have baseShape : RegisteredContext (cellOuter.plug endpoint) baseContext :=
        RegisteredContext.mutableBase actions bits continuation beta
          (cellOuter.plug endpoint) admissible
      have complete := OperationalAscent.registered cellAscent baseShape
      simpa [actions, beta, baseContext] using complete
  | @inside snapshot currentContext segmentContext routeContext currentOuter bit
      currentSuffix appended status route label snapshotInv current segment
      selectedRoute inner ih =>
      let accumulatorContext := segmentContext.comp currentOuter
      have accumulatorAscent : OperationalAscent endpoint accumulatorContext
          (currentSuffix ++ appended) := by
        simpa [accumulatorContext] using wrapQueue segment ih
      let actionContext := CanonicalTraversal.actionContext
        (actionHistories program label snapshot)
      have actionShape : RegisteredContext (accumulatorContext.plug endpoint)
          actionContext := by
        exact RegisteredContext.action program label snapshot
          (accumulatorContext.plug endpoint)
      have actionAscent : OperationalAscent endpoint
          (actionContext.comp accumulatorContext) (currentSuffix ++ appended) :=
        .registered accumulatorAscent actionShape
      have snapshotAudit := snapshotInv.wholeCarrierAudit admissible
      let response := actionContext.plug (accumulatorContext.plug endpoint)
      have routeShape : RegisteredContext
          ((actionContext.comp accumulatorContext).plug endpoint)
          routeContext := by
        simpa [response, Context.plug_comp] using
          (RegisteredContext.route snapshotAudit selectedRoute response)
      have routeAscent : OperationalAscent endpoint
          (routeContext.comp (actionContext.comp accumulatorContext))
          (currentSuffix ++ appended) :=
        .registered actionAscent routeShape
      let dispatcherTerm := routeContext.plug response
      let localContext := CanonicalTraversal.localDispatcherContext bits
        continuation (ReachableAudit.haltField status snapshot) snapshot snapshot
      have localShape : RegisteredContext
          ((routeContext.comp
            (actionContext.comp accumulatorContext)).plug endpoint)
          localContext := by
        simpa [dispatcherTerm, response, Context.plug_comp] using
          (RegisteredContext.localDispatcher bits continuation snapshot
            dispatcherTerm status snapshotAudit)
      have localAscent : OperationalAscent endpoint
          (localContext.comp
            (routeContext.comp (actionContext.comp accumulatorContext)))
          (currentSuffix ++ appended) :=
        .registered routeAscent localShape
      simpa [accumulatorContext, actionContext, localContext] using localAscent
  | @segment snapshot currentContext segmentContext routeContext cellOuter bit
      suffix cellAddress status route label snapshotInv current queue
      selectedRoute selection =>
      have cellAscent := ofOuterContext endpoint selection.outerShape
      let actionContext := CanonicalTraversal.actionContext
        (actionHistories program label snapshot)
      have actionShape : RegisteredContext (cellOuter.plug endpoint)
          actionContext := by
        exact RegisteredContext.action program label snapshot
          (cellOuter.plug endpoint)
      have actionAscent : OperationalAscent endpoint
          (actionContext.comp cellOuter) suffix :=
        .registered cellAscent actionShape
      have snapshotAudit := snapshotInv.wholeCarrierAudit admissible
      let response := actionContext.plug (cellOuter.plug endpoint)
      have routeShape : RegisteredContext
          ((actionContext.comp cellOuter).plug endpoint) routeContext := by
        simpa [response, Context.plug_comp] using
          (RegisteredContext.route snapshotAudit selectedRoute response)
      have routeAscent : OperationalAscent endpoint
          (routeContext.comp (actionContext.comp cellOuter)) suffix :=
        .registered actionAscent routeShape
      let dispatcherTerm := routeContext.plug response
      let localContext := CanonicalTraversal.localDispatcherContext bits
        continuation (ReachableAudit.haltField status snapshot) snapshot snapshot
      have localShape : RegisteredContext
          ((routeContext.comp (actionContext.comp cellOuter)).plug endpoint)
          localContext := by
        simpa [dispatcherTerm, response, Context.plug_comp] using
          (RegisteredContext.localDispatcher bits continuation snapshot
            dispatcherTerm status snapshotAudit)
      have localAscent : OperationalAscent endpoint
          (localContext.comp (routeContext.comp (actionContext.comp cellOuter)))
          suffix :=
        .registered routeAscent localShape
      simpa [actionContext, localContext] using localAscent

/--
The literal compiled `.up` loop executes every operational outer ascent,
observing later lives in order and performing no additional contraction.
-/
theorem zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) {endpoint : Term}
    {context : Context} {suffix : List Bool}
    (shape : OperationalAscent endpoint context suffix)
    (parents : List ParentFrame) (seen : registers.seen = true) :
    ∃ ticks,
      ZeroMutationRun (SchedulerControl.machine program dispatcher) ticks
        (SchedulerInvariant.upConfiguration program dispatcher registers
          endpoint (ContextCursor.frames context endpoint parents))
        (SchedulerInvariant.upConfiguration program dispatcher
          (scanRegisters registers suffix) (context.plug endpoint) parents) := by
  induction shape generalizing registers parents with
  | hole => exact ⟨0, ⟨rfl, rfl⟩⟩
  | @live context suffix bit inner ih =>
      obtain ⟨innerTicks, innerRun⟩ := ih registers
        (.right (PureSFormal.PureS.live bit) :: parents) seen
      have afterSeen : (scanRegisters registers suffix).seen = true :=
        scanRegisters_seen registers suffix seen
      have edgeRun := laterLiveParent_zeroRun program dispatcher
        (scanRegisters registers suffix) bit (context.plug endpoint) parents
        afterSeen
      refine ⟨innerTicks +
          (firstLivePrefixTicks program dispatcher bit (context.plug endpoint)
            parents + 1), ?_⟩
      simpa [ContextCursor.frames, Context.plug] using innerRun.trans edgeRun
  | @registered outerContext innerContext suffix inner outer ih =>
      obtain ⟨innerTicks, innerRun⟩ := ih registers
        (ContextCursor.frames outerContext (innerContext.plug endpoint) parents)
        seen
      obtain ⟨outerTicks, outerRun⟩ := run_registeredContext program
        dispatcher (scanRegisters registers suffix) outer parents
      refine ⟨innerTicks + outerTicks, ?_⟩
      simpa [frames_comp, Context.plug_comp] using innerRun.trans outerRun

end OperationalAscent

/-! ## Complete endpoint-to-C4 bridge -/

/--
From the terminal `omega` of a factored canonical descent, the actual
compiled controller follows only registered parents and performs exactly one
mutation: C4 at the selected first live cell.
-/
theorem selectedFront_countedRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program)
    {fullContext outerContext innerContext : Context} {bit : Bool}
    (path : FrontPath fullContext outerContext bit innerContext)
    (parents : List ParentFrame) (notSeen : registers.seen = false) :
    ∃ ticks,
      CountedRun (SchedulerControl.machine program dispatcher) ticks 1
        (SchedulerInvariant.upConfiguration program dispatcher registers omega
          (ContextCursor.frames fullContext omega parents))
        (SchedulerInvariant.upConfiguration program dispatcher
          (registers.observeLive bit)
          (Carrier.tombstone bit (frontPredecessor innerContext)
            (frontPredecessor innerContext))
          (ContextCursor.frames outerContext
            (Carrier.tombstone bit (frontPredecessor innerContext)
              (frontPredecessor innerContext))
            parents)) := by
  obtain ⟨registeredTicks, registeredRun⟩ :=
    run_registeredContext program dispatcher registers path.inner_registered
      (.right (PureSFormal.PureS.live bit) ::
        frontOuterParents outerContext bit innerContext parents)
  have registeredRun' : ZeroMutationRun
      (SchedulerControl.machine program dispatcher) registeredTicks
      (SchedulerInvariant.upConfiguration program dispatcher registers omega
        (ContextCursor.frames innerContext omega
          (.right (PureSFormal.PureS.live bit) ::
            frontOuterParents outerContext bit innerContext parents)))
      (SchedulerInvariant.upConfiguration program dispatcher registers
        (frontPredecessor innerContext)
        (.right (PureSFormal.PureS.live bit) ::
          frontOuterParents outerContext bit innerContext parents)) := by
    simpa [frontPredecessor] using registeredRun
  have mutation := firstLive_countedRun program dispatcher registers bit
    (frontPredecessor innerContext)
    (frontOuterParents outerContext bit innerContext parents) notSeen
  have outerFrames :
      ContextCursor.frames outerContext
          (.app (PureSFormal.PureS.live bit)
            (frontPredecessor innerContext)) parents =
        ContextCursor.frames outerContext
          (Carrier.tombstone bit (frontPredecessor innerContext)
            (frontPredecessor innerContext)) parents :=
    ContextCursor.frames_term_irrelevant outerContext _ _ parents
  have mutation' : CountedRun (SchedulerControl.machine program dispatcher)
      (firstLivePrefixTicks program dispatcher bit
        (frontPredecessor innerContext)
        (frontOuterParents outerContext bit innerContext parents) + 1) 1
      (SchedulerInvariant.upConfiguration program dispatcher registers
        (frontPredecessor innerContext)
        (.right (PureSFormal.PureS.live bit) ::
          frontOuterParents outerContext bit innerContext parents))
      (SchedulerInvariant.upConfiguration program dispatcher
        (registers.observeLive bit)
        (Carrier.tombstone bit (frontPredecessor innerContext)
          (frontPredecessor innerContext))
        (ContextCursor.frames outerContext
          (Carrier.tombstone bit (frontPredecessor innerContext)
            (frontPredecessor innerContext))
          parents)) := by
    simpa [frontOuterParents, outerFrames] using mutation
  refine ⟨registeredTicks +
      (firstLivePrefixTicks program dispatcher bit
        (frontPredecessor innerContext)
        (frontOuterParents outerContext bit innerContext parents) + 1), ?_⟩
  have complete := registeredRun'.toCounted.trans mutation'
  simpa [path.full_eq, frames_comp, frontPredecessor,
    frontOuterParents, ContextCursor.frames, Context.plug] using complete

/-- The selected front's retained outer context is an exact zero-mutation run. -/
theorem selectedFront_outer_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source endpoint : Term}
    (admissible : Carrier.Admissible continuation)
    {bit : Bool} {suffix : List Bool} {outerContext : Context}
    (selected : CanonicalTraversal.SelectedFront program tree bits continuation
      source bit suffix outerContext)
    (registers : Registers program) (parents : List ParentFrame)
    (seen : registers.seen = true) :
    ∃ ticks,
      ZeroMutationRun (SchedulerControl.machine program dispatcher) ticks
        (SchedulerInvariant.upConfiguration program dispatcher registers
          endpoint (ContextCursor.frames outerContext endpoint parents))
        (SchedulerInvariant.upConfiguration program dispatcher
          (scanRegisters registers suffix) (outerContext.plug endpoint)
          parents) := by
  have shape := OperationalAscent.ofSelectedFront admissible selected endpoint
  exact OperationalAscent.zeroRun program dispatcher registers shape parents seen

/--
Starting at the descent endpoint, the controller performs the unique C4 and
then scans the complete retained outer context without another mutation.
-/
theorem selectedFront_scan_countedRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term}
    (admissible : Carrier.Admissible continuation)
    {bit : Bool} {suffix : List Bool} {outerContext : Context}
    (selected : CanonicalTraversal.SelectedFront program tree bits continuation
      source bit suffix outerContext)
    (registers : Registers program)
    {fullContext innerContext : Context}
    (path : FrontPath fullContext outerContext bit innerContext)
    (parents : List ParentFrame) (notSeen : registers.seen = false) :
    ∃ ticks,
      CountedRun (SchedulerControl.machine program dispatcher) ticks 1
        (SchedulerInvariant.upConfiguration program dispatcher registers omega
          (ContextCursor.frames fullContext omega parents))
        (SchedulerInvariant.upConfiguration program dispatcher
          (scanRegisters (registers.observeLive bit) suffix)
          (outerContext.plug
            (Carrier.tombstone bit (frontPredecessor innerContext)
              (frontPredecessor innerContext))) parents) := by
  obtain ⟨mutationTicks, mutationRun⟩ := selectedFront_countedRun program
    dispatcher registers path parents notSeen
  have firstSeen : (registers.observeLive bit).seen = true := by
    simp [Registers.observeLive, notSeen]
  obtain ⟨outerTicks, outerRun⟩ := selectedFront_outer_zeroRun program
    dispatcher admissible selected (endpoint :=
      Carrier.tombstone bit (frontPredecessor innerContext)
        (frontPredecessor innerContext))
      (registers.observeLive bit) parents firstSeen
  refine ⟨mutationTicks + outerTicks, ?_⟩
  have complete := mutationRun.trans outerRun.toCounted
  simpa using complete

/--
The full nonempty UP phase reaches the exact pending root in
`.frameDispatch`, with exactly one term mutation in the entire phase.
-/
theorem selectedFront_frameDispatch_countedRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term}
    (admissible : Carrier.Admissible continuation)
    {bit : Bool} {suffix : List Bool} {outerContext : Context}
    (selected : CanonicalTraversal.SelectedFront program tree bits continuation
      source bit suffix outerContext)
    (registers : Registers program)
    {fullContext innerContext : Context}
    (path : FrontPath fullContext outerContext bit innerContext)
    (hole₀ hole₁ hole₂ frameContinuation : Term)
    (parents : List ParentFrame) (notSeen : registers.seen = false) :
    ∃ ticks,
      CountedRun (SchedulerControl.machine program dispatcher) ticks 1
        (SchedulerInvariant.upConfiguration program dispatcher registers omega
          (ContextCursor.frames fullContext omega
            (.right (PendingFrame.frameFunction hole₀ hole₁ hole₂
              frameContinuation) :: parents)))
        ⟨some (.macro (.family .frameDispatch)
            (scanRegisters (registers.observeLive bit) suffix)),
          ⟨PendingFrame.pending hole₀ hole₁ hole₂ frameContinuation
            (outerContext.plug
              (Carrier.tombstone bit (frontPredecessor innerContext)
                (frontPredecessor innerContext))), parents⟩⟩ := by
  let frameParents :=
    .right (PendingFrame.frameFunction hole₀ hole₁ hole₂
      frameContinuation) :: parents
  obtain ⟨scanTicks, scanRun⟩ := selectedFront_scan_countedRun program
    dispatcher admissible selected registers path frameParents notSeen
  have firstSeen : (registers.observeLive bit).seen = true := by
    simp [Registers.observeLive, notSeen]
  have finalSeen :
      (scanRegisters (registers.observeLive bit) suffix).seen = true :=
    scanRegisters_seen _ _ firstSeen
  have leaveRun := pendingFrameDispatch_zeroRun program dispatcher
    (scanRegisters (registers.observeLive bit) suffix)
    hole₀ hole₁ hole₂ frameContinuation
    (outerContext.plug
      (Carrier.tombstone bit (frontPredecessor innerContext)
        (frontPredecessor innerContext))) parents finalSeen
  refine ⟨scanTicks + pendingFrameDispatchTicks program dispatcher
      hole₀ hole₁ hole₂ frameContinuation
      (outerContext.plug
        (Carrier.tombstone bit (frontPredecessor innerContext)
          (frontPredecessor innerContext))) parents, ?_⟩
  have complete := scanRun.trans leaveRun.toCounted
  simpa [frameParents] using complete

/--
Direct construction-facing form: no factorization witness is required from
the caller; the selected-front proof supplies the exact descent and UP run.
-/
theorem selectedFront_toFrameDispatch
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    {bits : List Bool} {continuation source : Term}
    (admissible : Carrier.Admissible continuation)
    {bit : Bool} {suffix : List Bool} {outerContext : Context}
    (selected : CanonicalTraversal.SelectedFront program dispatcher.tree bits
      continuation source bit suffix outerContext)
    (registers : Registers program)
    (hole₀ hole₁ hole₂ frameContinuation : Term)
    (parents : List ParentFrame) (notSeen : registers.seen = false) :
    ∃ fullContext innerContext ticks,
      CanonicalTraversal.Descent program dispatcher.tree bits continuation
        source (bit :: suffix) fullContext ∧
      CountedRun (SchedulerControl.machine program dispatcher) ticks 1
        (SchedulerInvariant.upConfiguration program dispatcher registers omega
          (ContextCursor.frames fullContext omega
            (.right (PendingFrame.frameFunction hole₀ hole₁ hole₂
              frameContinuation) :: parents)))
        ⟨some (.macro (.family .frameDispatch)
            (scanRegisters (registers.observeLive bit) suffix)),
          ⟨PendingFrame.pending hole₀ hole₁ hole₂ frameContinuation
            (outerContext.plug
              (Carrier.tombstone bit (frontPredecessor innerContext)
                (frontPredecessor innerContext))), parents⟩⟩ := by
  obtain ⟨fullContext, innerContext, descent, path⟩ :=
    FrontPath.ofSelectedFront admissible selected
  obtain ⟨ticks, execution⟩ := selectedFront_frameDispatch_countedRun
    program dispatcher admissible selected registers path hole₀ hole₁ hole₂
      frameContinuation parents notSeen
  exact ⟨fullContext, innerContext, ticks, descent, execution⟩

/-! ## Declarative deletion and decoder-silence audit -/

/-- A factored descent and its front certificate name the same predecessor. -/
theorem FrontPath.predecessor_eq_certificate
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source target predecessor : Term}
    {bit : Bool} {suffix : List Bool}
    {fullContext outerContext innerContext : Context}
    (descent : CanonicalTraversal.Descent program tree bits continuation source
      (bit :: suffix) fullContext)
    (path : FrontPath fullContext outerContext bit innerContext)
    (certificate : CanonicalTraversal.FrontCertificate source target bit suffix
      predecessor outerContext) :
    frontPredecessor innerContext = predecessor := by
  have sourceByPath : source = outerContext.plug
      (.app (PureSFormal.PureS.live bit) (frontPredecessor innerContext)) := by
    rw [← descent.source_eq, path.full_eq]
    simp [Context.plug_comp, frontPredecessor]
  have filledEqual : outerContext.plug
        (.app (PureSFormal.PureS.live bit) (frontPredecessor innerContext)) =
      outerContext.plug
        (.app (PureSFormal.PureS.live bit) predecessor) :=
    sourceByPath.symm.trans certificate.source_eq
  have cellEqual := context_plug_injective outerContext filledEqual
  injection cellEqual

/--
The exact controller C4 target is the canonical deletion target and therefore
again carries a complete canonical descent for the decoded suffix.
-/
theorem selectedFront_deleteAtPath
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term}
    {bit : Bool} {suffix : List Bool} {outerContext : Context}
    (selected : CanonicalTraversal.SelectedFront program tree bits continuation
      source bit suffix outerContext)
    {fullContext innerContext : Context}
    (descent : CanonicalTraversal.Descent program tree bits continuation source
      (bit :: suffix) fullContext)
    (path : FrontPath fullContext outerContext bit innerContext) :
    ∃ targetContext,
      CanonicalTraversal.Descent program tree bits continuation
        (outerContext.plug
          (Carrier.tombstone bit (frontPredecessor innerContext)
            (frontPredecessor innerContext))) suffix targetContext ∧
      CanonicalTraversal.FrontCertificate source
        (outerContext.plug
          (Carrier.tombstone bit (frontPredecessor innerContext)
            (frontPredecessor innerContext))) bit suffix
        (frontPredecessor innerContext) outerContext := by
  obtain ⟨target, targetContext, predecessor, targetDescent, certificate⟩ :=
    selected.delete
  have predecessorEq := path.predecessor_eq_certificate descent certificate
  subst predecessor
  have targetEq := certificate.target_eq
  subst target
  exact ⟨targetContext, targetDescent, certificate⟩

/-- A pending reachable carrier is decoder-silent while the controller is UP. -/
theorem pendingActive_silent
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation carrier term : Term}
    {decoded : List Bool} {carrierContext : Context}
    (descent : CanonicalTraversal.Descent program tree bits continuation carrier
      decoded carrierContext)
    (hole₀ hole₁ hole₂ : Term) {layers : Nat}
    (outer : CheckpointExclusion.CompletedPrefix program tree term
      (PendingFrame.pending hole₀ hole₁ hole₂ continuation carrier)
      layers) :
    SilentEvidence program tree .up term := by
  apply SilentEvidence.ofPublic
  apply CheckpointExclusion.Noncheckpoint.upActive outer
  exact ⟨bits, continuation, carrier, hole₀, hole₁, hole₂,
    .root descent.holds.toRoot, rfl⟩

/--
Decoder-silence witness for the exact post-C4 term sampled by the executable
selected-front run, including any certified completed outer prefix.
-/
theorem selectedFront_postC4_silent
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source term : Term}
    {bit : Bool} {suffix : List Bool} {outerContext : Context}
    (selected : CanonicalTraversal.SelectedFront program tree bits continuation
      source bit suffix outerContext)
    {fullContext innerContext : Context}
    (descent : CanonicalTraversal.Descent program tree bits continuation source
      (bit :: suffix) fullContext)
    (path : FrontPath fullContext outerContext bit innerContext)
    (hole₀ hole₁ hole₂ : Term) {layers : Nat}
    (outer : CheckpointExclusion.CompletedPrefix program tree term
      (PendingFrame.pending hole₀ hole₁ hole₂ continuation
        (outerContext.plug
          (Carrier.tombstone bit (frontPredecessor innerContext)
            (frontPredecessor innerContext)))) layers) :
    SilentEvidence program tree .up term := by
  obtain ⟨targetContext, targetDescent, certificate⟩ :=
    selectedFront_deleteAtPath selected descent path
  exact pendingActive_silent targetDescent hole₀ hole₁ hole₂ outer

/--
The executable first-mutation search returns exactly the selected C4 endpoint,
with the same retained outer context and the coherent observed-bit register.
-/
theorem selectedFront_seekMutation
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program)
    {fullContext outerContext innerContext : Context} {bit : Bool}
    (path : FrontPath fullContext outerContext bit innerContext)
    (parents : List ParentFrame) (notSeen : registers.seen = false) :
    ∃ bound,
      FiniteController.seekMutation
        (SchedulerControl.machine program dispatcher) bound
        (SchedulerInvariant.upConfiguration program dispatcher registers omega
          (ContextCursor.frames fullContext omega parents)) =
      some (SchedulerInvariant.upConfiguration program dispatcher
        (registers.observeLive bit)
        (Carrier.tombstone bit (frontPredecessor innerContext)
          (frontPredecessor innerContext))
        (ContextCursor.frames outerContext
          (Carrier.tombstone bit (frontPredecessor innerContext)
            (frontPredecessor innerContext)) parents)) := by
  obtain ⟨registeredTicks, registeredRun⟩ :=
    run_registeredContext program dispatcher registers path.inner_registered
      (.right (PureSFormal.PureS.live bit) ::
        frontOuterParents outerContext bit innerContext parents)
  have registeredRun' : ZeroMutationRun
      (SchedulerControl.machine program dispatcher) registeredTicks
      (SchedulerInvariant.upConfiguration program dispatcher registers omega
        (ContextCursor.frames innerContext omega
          (.right (PureSFormal.PureS.live bit) ::
            frontOuterParents outerContext bit innerContext parents)))
      (SchedulerInvariant.upConfiguration program dispatcher registers
        (frontPredecessor innerContext)
        (.right (PureSFormal.PureS.live bit) ::
          frontOuterParents outerContext bit innerContext parents)) := by
    simpa [frontPredecessor] using registeredRun
  have selected := firstLive_seekMutation program dispatcher registers bit
    (frontPredecessor innerContext)
    (frontOuterParents outerContext bit innerContext parents) notSeen
  have found := registeredRun'.seekMutation_prepend selected
  have outerFrames :
      ContextCursor.frames outerContext
          (.app (PureSFormal.PureS.live bit)
            (frontPredecessor innerContext)) parents =
        ContextCursor.frames outerContext
          (Carrier.tombstone bit (frontPredecessor innerContext)
            (frontPredecessor innerContext)) parents :=
    ContextCursor.frames_term_irrelevant outerContext _ _ parents
  refine ⟨registeredTicks +
      (firstLivePrefixTicks program dispatcher bit
        (frontPredecessor innerContext)
        (frontOuterParents outerContext bit innerContext parents) + 1), ?_⟩
  rw [← outerFrames]
  simpa [path.full_eq, frames_comp, frontPredecessor,
    frontOuterParents, ContextCursor.frames, Context.plug]
    using found

/-- At root outer parents, erasure is exactly the declarative C4 target. -/
theorem selectedFront_target_erase
    {fullContext outerContext innerContext : Context} {bit : Bool}
    (_path : FrontPath fullContext outerContext bit innerContext) :
    (⟨Carrier.tombstone bit (frontPredecessor innerContext)
        (frontPredecessor innerContext),
      ContextCursor.frames outerContext
        (Carrier.tombstone bit (frontPredecessor innerContext)
          (frontPredecessor innerContext)) []⟩ : Cursor).erase =
      outerContext.plug
        (Carrier.tombstone bit (frontPredecessor innerContext)
          (frontPredecessor innerContext)) := by
  exact rebuild_frames outerContext _ []

end SchedulerAscent

end PureSFormal.PureS
