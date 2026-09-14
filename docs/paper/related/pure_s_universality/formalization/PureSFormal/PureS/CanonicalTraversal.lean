import PureSFormal.PureS.ReachableAudit

/-!
# Declarative canonical carrier traversal

This module records the registered *kind* of every edge on an exact path
from a `ReachableAudit.Holds` carrier to `omega`.  It does not define an
executable cursor, a scheduler, or the paper's stronger operational history
class `K_(B,w)`.  Queue contexts carry the logical word; carrier contexts
additionally retain the exact Base, Local, route, action, audit, and history
syntax supplied by `ReachableAudit`.
-/

namespace PureSFormal.PureS

namespace CanonicalTraversal

/-! ## Addresses belonging to one-hole contexts -/

/-- The address of the unique hole of a one-hole context. -/
def contextAddress : Context → Address
  | .hole => []
  | .appLeft inner _ => .left :: contextAddress inner
  | .appRight _ inner => .right :: contextAddress inner

@[simp]
theorem context_subterm?_plug (context : Context) (term : Term) :
    (context.plug term).subterm? (contextAddress context) = some term := by
  induction context with
  | hole => simp [contextAddress]
  | appLeft inner right ih =>
      simpa [contextAddress, Term.subterm?] using ih
  | appRight left inner ih =>
      simpa [contextAddress, Term.subterm?] using ih

@[simp]
theorem context_replace?_plug
    (context : Context) (source replacement : Term) :
    (context.plug source).replace? (contextAddress context) replacement =
      some (context.plug replacement) := by
  induction context with
  | hole => simp [contextAddress]
  | appLeft inner right ih =>
      change (do
        let fn' ← (inner.plug source).replace? (contextAddress inner) replacement
        pure (Term.app fn' right)) =
          some (Term.app (inner.plug replacement) right)
      rw [ih]
      rfl
  | appRight left inner ih =>
      change (do
        let arg' ← (inner.plug source).replace? (contextAddress inner) replacement
        pure (Term.app left arg')) =
          some (Term.app left (inner.plug replacement))
      rw [ih]
      rfl

@[simp]
theorem contextAddress_comp (outer inner : Context) :
    contextAddress (outer.comp inner) =
      contextAddress outer ++ contextAddress inner := by
  induction outer with
  | hole => rfl
  | appLeft context right ih =>
      simp [Context.comp, contextAddress, ih]
  | appRight left context ih =>
      simp [Context.comp, contextAddress, ih]

/-- Every recorded descent is finite and reaches a strict subterm. -/
theorem contextAddress_length_lt_size
    (context : Context) (term : Term) :
    (contextAddress context).length < (context.plug term).size := by
  induction context with
  | hole => exact term.size_pos
  | appLeft inner right ih =>
      simp only [contextAddress, List.length_cons, Context.plug, Term.size]
      exact Nat.succ_lt_succ
        (Nat.lt_of_lt_of_le ih (Nat.le_add_right _ _))
  | appRight left inner ih =>
      simp only [contextAddress, List.length_cons, Context.plug, Term.size]
      exact Nat.succ_lt_succ
        (Nat.lt_of_lt_of_le ih (Nat.le_add_left _ _))

/-! ## Mutation-closed queue contexts -/

/--
A canonical queue segment represented as a context around its endpoint.
Live labels are accumulated in the order encountered while ascending from
the endpoint; tombstone histories are retained but contribute no label.
-/
inductive QueueContext : Context → List Bool → Prop where
  | hole : QueueContext .hole []
  | live {context : Context} {decoded : List Bool}
      (bit : Bool) (inner : QueueContext context decoded) :
      QueueContext (.appRight (PureSFormal.PureS.live bit) context)
        (decoded ++ [bit])
  | tombstone {context : Context} {decoded : List Bool}
      (bit : Bool) (audit : Term) (inner : QueueContext context decoded) :
      QueueContext (CellDeletion.tombstoneContext bit audit context) decoded

namespace QueueContext

/-- Filling the endpoint gives exactly the public queue-segment grammar. -/
theorem queueSegment
    {context : Context} {decoded : List Bool}
    (h : QueueContext context decoded) (endpoint : Term) :
    Carrier.QueueSegment endpoint (context.plug endpoint) := by
  induction h with
  | hole => exact .endpoint
  | live bit inner ih => exact .live bit ih
  | tombstone bit audit inner ih =>
      simpa [CellDeletion.tombstoneContext, Context.plug] using!
        Carrier.QueueSegment.tombstone bit audit ih

/-- A complete queue context decodes to exactly its recorded labels. -/
theorem decodes
    {context : Context} {decoded : List Bool}
    (h : QueueContext context decoded) :
    CellSpine.Decodes (context.plug omega) decoded := by
  induction h with
  | hole => exact .omega
  | live bit inner ih => exact .live bit ih
  | tombstone bit audit inner ih =>
      simpa [CellDeletion.tombstoneContext, Context.plug] using!
        CellSpine.Decodes.tombstone bit audit ih

/-- A fixed queue context has only one logical labelling. -/
theorem decoded_deterministic
    {context : Context} {first second : List Bool}
    (hfirst : QueueContext context first)
    (hsecond : QueueContext context second) :
    first = second :=
  hfirst.decodes.deterministic hsecond.decodes

/-- Queue contexts compose; inner labels precede outer labels. -/
theorem comp
    {outerContext innerContext : Context}
    {outerBits innerBits : List Bool}
    (outer : QueueContext outerContext outerBits)
    (inner : QueueContext innerContext innerBits) :
    QueueContext (outerContext.comp innerContext)
      (innerBits ++ outerBits) := by
  induction outer with
  | hole => simpa using! inner
  | live bit outer ih =>
      have wrapped := QueueContext.live bit ih
      simpa [Context.comp, List.append_assoc] using wrapped
  | tombstone bit audit outer ih =>
      have wrapped := QueueContext.tombstone bit audit ih
      simpa [CellDeletion.tombstoneContext, Context.comp] using wrapped

/-- Every mutation-closed segment supplies an exact context and its labels. -/
theorem ofQueueSegment
    {endpoint term : Term} (h : Carrier.QueueSegment endpoint term) :
    ∃ context decoded,
      QueueContext context decoded ∧ context.plug endpoint = term := by
  induction h with
  | endpoint => exact ⟨.hole, [], .hole, rfl⟩
  | live bit inner ih =>
      obtain ⟨context, decoded, shape, hplug⟩ := ih
      refine ⟨.appRight (PureSFormal.PureS.live bit) context,
        decoded ++ [bit], .live bit shape, ?_⟩
      simp [Context.plug, hplug]
  | tombstone bit audit inner ih =>
      obtain ⟨context, decoded, shape, hplug⟩ := ih
      refine ⟨CellDeletion.tombstoneContext bit audit context, decoded,
        .tombstone bit audit shape, ?_⟩
      simp [CellDeletion.tombstoneContext, Context.plug, hplug,
        Carrier.tombstone]

/-- Every complete cell spine supplies its exact context around `omega`. -/
theorem ofDecodes
    {term : Term} {decoded : List Bool}
    (h : CellSpine.Decodes term decoded) :
    ∃ context,
      QueueContext context decoded ∧ context.plug omega = term := by
  induction h with
  | omega => exact ⟨.hole, .hole, rfl⟩
  | live bit inner ih =>
      obtain ⟨context, shape, hplug⟩ := ih
      refine ⟨.appRight (PureSFormal.PureS.live bit) context,
        .live bit shape, ?_⟩
      simp [Context.plug, hplug]
  | tombstone bit audit inner ih =>
      obtain ⟨context, shape, hplug⟩ := ih
      refine ⟨CellDeletion.tombstoneContext bit audit context,
        .tombstone bit audit shape, ?_⟩
      simp [CellDeletion.tombstoneContext, Context.plug, hplug,
        Carrier.tombstone]

/-- Forgetting the inferred labels recovers any supplied queue segment. -/
theorem labels_ofQueueSegment
    {endpoint term : Term} (h : Carrier.QueueSegment endpoint term) :
    ∃ context decoded,
      QueueContext context decoded ∧
      context.plug endpoint = term ∧
      Carrier.QueueSegment endpoint term := by
  obtain ⟨context, decoded, shape, hplug⟩ := ofQueueSegment h
  exact ⟨context, decoded, shape, hplug, h⟩

/-- A cell outer-context is the same labelled queue-context with a known address. -/
theorem ofOuterContext
    {context : Context} {address : Address} {decoded : List Bool}
    (h : CellDeletion.OuterContext context address decoded) :
    QueueContext context decoded := by
  induction h with
  | hole => exact .hole
  | live bit inner ih => exact .live bit ih
  | tombstone bit audit inner ih => exact .tombstone bit audit ih

/-- The address index of a cell outer-context is its context's unique hole. -/
theorem outerContext_address
    {context : Context} {address : Address} {decoded : List Bool}
    (h : CellDeletion.OuterContext context address decoded) :
    address = contextAddress context := by
  induction h with
  | hole => rfl
  | live bit inner ih => simp [contextAddress, ih]
  | tombstone bit audit inner ih =>
      simp [CellDeletion.tombstoneContext, contextAddress, ih]

/--
Every nonempty queue context splits at its innermost live constructor.  The
inner context contains no live labels; the outer cell context records exactly
the later labels.
-/
theorem splitFront
    {context : Context} {decoded : List Bool}
    (h : QueueContext context decoded) (hne : decoded ≠ []) :
    ∃ bit suffix innerContext outerContext address,
      decoded = bit :: suffix ∧
      QueueContext innerContext [] ∧
      CellDeletion.OuterContext outerContext address suffix ∧
      context = outerContext.comp
        (.appRight (PureSFormal.PureS.live bit) innerContext) := by
  induction h with
  | hole => exact (hne rfl).elim
  | @live context decoded outerBit inner ih =>
      by_cases hempty : decoded = []
      · subst decoded
        exact ⟨outerBit, [], context, .hole, [], rfl, inner, .hole, rfl⟩
      · obtain ⟨frontBit, suffix, innerContext, outerContext, address,
          hdecoded, innerEmpty, outerShape, hcontext⟩ := ih hempty
        refine ⟨frontBit, suffix ++ [outerBit], innerContext,
          .appRight (PureSFormal.PureS.live outerBit) outerContext,
          .right :: address, ?_, innerEmpty, .live outerBit outerShape, ?_⟩
        · simp [hdecoded, List.append_assoc]
        · simp [hcontext, Context.comp]
  | tombstone outerBit audit inner ih =>
      obtain ⟨frontBit, suffix, innerContext, outerContext, address,
        hdecoded, innerEmpty, outerShape, hcontext⟩ := ih hne
      refine ⟨frontBit, suffix, innerContext,
        CellDeletion.tombstoneContext outerBit audit outerContext,
        .left :: .right :: address, hdecoded, innerEmpty,
        .tombstone outerBit audit outerShape, ?_⟩
      simp [CellDeletion.tombstoneContext, Context.comp, hcontext]

/-- Specialized split with the supplied head and suffix retained literally. -/
theorem splitFront_cons
    {context : Context} {bit : Bool} {suffix : List Bool}
    (h : QueueContext context (bit :: suffix)) :
    ∃ innerContext outerContext address,
      QueueContext innerContext [] ∧
      CellDeletion.OuterContext outerContext address suffix ∧
      context = outerContext.comp
        (.appRight (PureSFormal.PureS.live bit) innerContext) := by
  obtain ⟨foundBit, foundSuffix, innerContext, outerContext, address,
    hword, innerEmpty, outerShape, hcontext⟩ :=
    splitFront h (by simp)
  injection hword with hbit hsuffix
  subst foundBit
  subst foundSuffix
  exact ⟨innerContext, outerContext, address, innerEmpty, outerShape, hcontext⟩

/--
Delete the first logical live cell of a nonempty segment around any endpoint.
The returned target context decodes exactly the suffix and the contraction is
lifted once through the cell-only outer context.
-/
theorem deleteFront
    {sourceContext : Context} {bit : Bool} {suffix : List Bool}
    (h : QueueContext sourceContext (bit :: suffix)) (endpoint : Term) :
    ∃ targetContext predecessor outerContext address,
      QueueContext targetContext suffix ∧
      CellDeletion.OuterContext outerContext address suffix ∧
      sourceContext.plug endpoint =
        outerContext.plug
          (.app (PureSFormal.PureS.live bit) predecessor) ∧
      targetContext.plug endpoint =
        outerContext.plug
          (Carrier.tombstone bit predecessor predecessor) ∧
      StepsN 1 (sourceContext.plug endpoint)
        (targetContext.plug endpoint) := by
  obtain ⟨innerContext, outerContext, address, innerEmpty, outerShape,
    hcontext⟩ := splitFront_cons h
  let predecessor := innerContext.plug endpoint
  let deletedInner :=
    CellDeletion.tombstoneContext bit predecessor innerContext
  let targetContext := outerContext.comp deletedInner
  have deletedShape : QueueContext deletedInner [] := by
    exact .tombstone bit predecessor innerEmpty
  have targetShape : QueueContext targetContext suffix := by
    simpa [targetContext] using
      QueueContext.comp (ofOuterContext outerShape) deletedShape
  have sourceEq : sourceContext.plug endpoint =
      outerContext.plug (.app (PureSFormal.PureS.live bit) predecessor) := by
    simp [hcontext, predecessor, Context.plug_comp]
  have targetEq : targetContext.plug endpoint =
      outerContext.plug (Carrier.tombstone bit predecessor predecessor) := by
    simp [targetContext, deletedInner, predecessor, Context.plug_comp,
      CellDeletion.tombstoneContext, Carrier.tombstone]
  have localStep := C4_live_delete bit predecessor
  have lifted := localStep.inContext outerContext
  refine ⟨targetContext, predecessor, outerContext, address, targetShape,
    outerShape, sourceEq, targetEq, ?_⟩
  rw [sourceEq, targetEq]
  exact lifted

end QueueContext

/-! ## Exact route, action, and Local contexts -/

/-- One-hole context for a selected leaf response. -/
def leafContext (snapshot : Term) : Context :=
  .appRight (.app .s snapshot) .hole

/-- One-hole context for the activated child of a selected-left fork. -/
def selectedLeftContext (snapshot dormant : Term) (inner : Context) : Context :=
  .appRight (.app .s snapshot) (.appLeft inner dormant)

/-- One-hole context for the activated child of a selected-right fork. -/
def selectedRightContext (snapshot dormant : Term) (inner : Context) : Context :=
  .appRight (.app .s snapshot) (.appRight dormant inner)

/-- Exact same-snapshot route context from a leaf response to a dispatcher. -/
inductive RouteContext {Label : Type u} (encode : Label → Term)
    (snapshot : Term) :
    Dispatcher.Tree Label → Dispatcher.Route → Label → Context → Prop where
  | leaf (label : Label) :
      RouteContext encode snapshot (.leaf label) [] label
        (leafContext snapshot)
  | left
      {left right : Dispatcher.Tree Label}
      {route : Dispatcher.Route} {label : Label} {innerContext : Context}
      (inner : RouteContext encode snapshot left route label innerContext) :
      RouteContext encode snapshot (.node left right) (.left :: route) label
        (selectedLeftContext snapshot
          (RouteGrammar.compiledCall encode right snapshot) innerContext)
  | right
      {left right : Dispatcher.Tree Label}
      {route : Dispatcher.Route} {label : Label} {innerContext : Context}
      (inner : RouteContext encode snapshot right route label innerContext) :
      RouteContext encode snapshot (.node left right) (.right :: route) label
        (selectedRightContext snapshot
          (RouteGrammar.compiledCall encode left snapshot) innerContext)

namespace RouteContext

/-- Plugging any response reconstructs the exact same-snapshot route. -/
theorem snapshotRoute
    {Label : Type u} {encode : Label → Term} {snapshot : Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    {context : Context}
    (h : RouteContext encode snapshot tree route label context)
    (response : Term) :
    ReachableAudit.SnapshotRoute encode snapshot tree route label response
      (context.plug response) := by
  induction h with
  | leaf label => exact .leaf label response
  | left inner ih =>
      simpa [selectedLeftContext, Context.plug,
        RouteGrammar.selectedLeft] using!
        ReachableAudit.SnapshotRoute.left ih
  | right inner ih =>
      simpa [selectedRightContext, Context.plug,
        RouteGrammar.selectedRight] using!
        ReachableAudit.SnapshotRoute.right ih

/-- A same-snapshot route proof exposes its literal response context. -/
theorem ofSnapshotRoute
    {Label : Type u} {encode : Label → Term} {snapshot : Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    {response result : Term}
    (h : ReachableAudit.SnapshotRoute encode snapshot tree route label response
      result) :
    ∃ context,
      RouteContext encode snapshot tree route label context ∧
      context.plug response = result := by
  induction h with
  | leaf label response => exact ⟨leafContext snapshot, .leaf label, rfl⟩
  | @left left right route label response activatedChild inner ih =>
      obtain ⟨context, routeShape, hplug⟩ := ih
      refine ⟨selectedLeftContext snapshot
          (RouteGrammar.compiledCall encode right snapshot) context,
        .left routeShape, ?_⟩
      simp [selectedLeftContext, Context.plug, hplug,
        RouteGrammar.selectedLeft, chosen]
  | @right left right route label response activatedChild inner ih =>
      obtain ⟨context, routeShape, hplug⟩ := ih
      refine ⟨selectedRightContext snapshot
          (RouteGrammar.compiledCall encode left snapshot) context,
        .right routeShape, ?_⟩
      simp [selectedRightContext, Context.plug, hplug,
        RouteGrammar.selectedRight, chosen]

/-- The tree route fixes its exact same-snapshot context. -/
theorem deterministic
    {Label : Type u} {encode : Label → Term} {snapshot : Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    {first second : Context}
    (hfirst : RouteContext encode snapshot tree route label first)
    (hsecond : RouteContext encode snapshot tree route label second) :
    first = second := by
  induction hfirst generalizing second with
  | leaf label => cases hsecond; rfl
  | left inner ih =>
      cases hsecond with
      | left other =>
          rw [ih other]
  | right inner ih =>
      cases hsecond with
      | right other =>
          rw [ih other]

/-- Plugging an accumulator response gives the exact completed dispatcher. -/
theorem snapshotDispatchAt
    {program : CTS.Program} {snapshot : Term}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program}
    {context : Context}
    (h : RouteContext (selectedAction program) snapshot tree route label context)
    (accumulator : Term) :
    ReachableAudit.SnapshotDispatchAt program tree snapshot route label
      accumulator
      (context.plug
        (ReachableAudit.actionResponse program label snapshot accumulator)) :=
  ⟨h.snapshotRoute _⟩

end RouteContext

/-- Extend a hole through a left-associated list of retained arguments. -/
def applyArgsContext : Context → List Term → Context
  | context, [] => context
  | context, argument :: rest =>
      applyArgsContext (.appLeft context argument) rest

@[simp]
theorem applyArgsContext_plug
    (context : Context) (arguments : List Term) (term : Term) :
    (applyArgsContext context arguments).plug term =
      Term.applyArgs (context.plug term) arguments := by
  induction arguments generalizing context with
  | nil => rfl
  | cons argument rest ih =>
      simpa [applyArgsContext, Term.applyArgs] using
        ih (.appLeft context argument)

/-- Exact action-spine context from its accumulator to its response. -/
def actionContext (histories : List Term) : Context :=
  applyArgsContext (.appRight p .hole) histories

@[simp]
theorem actionContext_plug (histories : List Term) (accumulator : Term) :
    (actionContext histories).plug accumulator =
      Term.applyArgs (.app p accumulator) histories := by
  simp [actionContext]

/-- Exact Local-shell context from its dispatcher to the carrier root. -/
def localDispatcherContext
    (bits : List Bool) (continuation haltField seedAudit continuationAudit : Term) :
    Context :=
  .appLeft
    (.appLeft
      (.appRight haltField .hole)
      (.app (seedCode bits) seedAudit))
    (.app continuation continuationAudit)

@[simp]
theorem localDispatcherContext_plug
    (bits : List Bool) (continuation haltField seedAudit continuationAudit
      dispatcher : Term) :
    (localDispatcherContext bits continuation haltField seedAudit
      continuationAudit).plug dispatcher =
      Carrier.activeShell bits continuation haltField dispatcher seedAudit
        continuationAudit := by
  rfl

/-- Full context from `omega` through a current root and its appended segment. -/
def accumulatorContext (segmentContext currentContext : Context) : Context :=
  segmentContext.comp currentContext

/-- Full context from `omega` through accumulator, action, and selected route. -/
def dispatcherContext
    (program : CTS.Program) (label : ActionLabel program) (snapshot : Term)
    (routeContext segmentContext currentContext : Context) : Context :=
  routeContext.comp
    ((actionContext (actionHistories program label snapshot)).comp
      (accumulatorContext segmentContext currentContext))

/-- Full exact Local context from `omega` to the carrier root. -/
def localContext
    (program : CTS.Program) (bits : List Bool) (continuation snapshot : Term)
    (status : ReachableAudit.HaltState) (label : ActionLabel program)
    (routeContext segmentContext currentContext : Context) : Context :=
  (localDispatcherContext bits continuation
    (ReachableAudit.haltField status snapshot) snapshot snapshot).comp
    (dispatcherContext program label snapshot routeContext segmentContext
      currentContext)

@[simp]
theorem localContext_plug
    (program : CTS.Program) (bits : List Bool) (continuation snapshot : Term)
    (status : ReachableAudit.HaltState) (label : ActionLabel program)
    (routeContext segmentContext currentContext : Context) (endpoint : Term) :
    (localContext program bits continuation snapshot status label routeContext
      segmentContext currentContext).plug endpoint =
      Carrier.activeShell bits continuation
        (ReachableAudit.haltField status snapshot)
        (routeContext.plug
          (ReachableAudit.actionResponse program label snapshot
            (segmentContext.plug (currentContext.plug endpoint))))
        snapshot snapshot := by
  simp [localContext, dispatcherContext, accumulatorContext,
    Context.plug_comp, ReachableAudit.actionResponse]

/-! ## Exact ascent contexts outside a selected logical cell -/

/--
The registered contexts met while ascending from one selected live cell.
Only `live` contributes a logical later bit.  All remaining constructors are
explicit transparent queue or exact Base/Local/route/action wrappers.
-/
inductive AscentContext : Context → List Bool → Prop where
  | hole : AscentContext .hole []
  | live {context : Context} {suffix : List Bool}
      (bit : Bool) (inner : AscentContext context suffix) :
      AscentContext (.appRight (PureSFormal.PureS.live bit) context)
        (suffix ++ [bit])
  | tombstone {context : Context} {suffix : List Bool}
      (bit : Bool) (audit : Term) (inner : AscentContext context suffix) :
      AscentContext (CellDeletion.tombstoneContext bit audit context) suffix
  | base {context : Context} {suffix : List Bool}
      (actions : Term) (bits : List Bool) (continuation : Term)
      (inner : AscentContext context suffix) :
      AscentContext
        ((MutableBase.queueContext actions bits continuation
          (baseBeta (environmentCode actions bits) continuation)).comp context)
        suffix
  | action {context : Context} {suffix : List Bool}
      (program : CTS.Program) (label : ActionLabel program) (snapshot : Term)
      (inner : AscentContext context suffix) :
      AscentContext
        ((actionContext (actionHistories program label snapshot)).comp context)
        suffix
  | route
      {program : CTS.Program} {snapshot : Term}
      {tree : Dispatcher.Tree (ActionLabel program)}
      {route : Dispatcher.Route} {label : ActionLabel program}
      {routeContext context : Context} {suffix : List Bool}
      (selected : RouteContext (selectedAction program) snapshot tree route label
        routeContext)
      (inner : AscentContext context suffix) :
      AscentContext (routeContext.comp context) suffix
  | local {context : Context} {suffix : List Bool}
      (bits : List Bool) (continuation snapshot : Term)
      (status : ReachableAudit.HaltState)
      (inner : AscentContext context suffix) :
      AscentContext
        ((localDispatcherContext bits continuation
          (ReachableAudit.haltField status snapshot) snapshot snapshot).comp
          context)
        suffix

namespace AscentContext

/-- A flat cell outer-context embeds into the full carrier ascent grammar. -/
theorem ofCellOuter
    {context : Context} {address : Address} {suffix : List Bool}
    (h : CellDeletion.OuterContext context address suffix) :
    AscentContext context suffix := by
  induction h with
  | hole => exact .hole
  | live bit inner ih => exact .live bit ih
  | tombstone bit audit inner ih => exact .tombstone bit audit ih

/-- The later-live flag attached to an exact ascent certificate. -/
def laterLiveFlag {context : Context} {suffix : List Bool}
    (_ : AscentContext context suffix) : Bool :=
  !suffix.isEmpty

/-- The flag is set exactly when the decoded suffix is nonempty. -/
theorem laterLiveFlag_eq_true_iff
    {context : Context} {suffix : List Bool}
    (h : AscentContext context suffix) :
    h.laterLiveFlag = true ↔ suffix ≠ [] := by
  cases suffix <;> simp [laterLiveFlag]

end AscentContext

/--
A structural witness that an exact ascent contains a later `live` wrapper.
The first constructor identifies such a wrapper; all others transport it
only through registered queue or exact neutral contexts.
-/
inductive ContainsLive : Context → List Bool → Prop where
  | live {context : Context} {suffix : List Bool}
      (bit : Bool) (inner : AscentContext context suffix) :
      ContainsLive (.appRight (PureSFormal.PureS.live bit) context)
        (suffix ++ [bit])
  | tombstone {context : Context} {suffix : List Bool}
      (bit : Bool) (audit : Term) (inner : ContainsLive context suffix) :
      ContainsLive (CellDeletion.tombstoneContext bit audit context) suffix
  | base {context : Context} {suffix : List Bool}
      (actions : Term) (bits : List Bool) (continuation : Term)
      (inner : ContainsLive context suffix) :
      ContainsLive
        ((MutableBase.queueContext actions bits continuation
          (baseBeta (environmentCode actions bits) continuation)).comp context)
        suffix
  | action {context : Context} {suffix : List Bool}
      (program : CTS.Program) (label : ActionLabel program) (snapshot : Term)
      (inner : ContainsLive context suffix) :
      ContainsLive
        ((actionContext (actionHistories program label snapshot)).comp context)
        suffix
  | route
      {program : CTS.Program} {snapshot : Term}
      {tree : Dispatcher.Tree (ActionLabel program)}
      {route : Dispatcher.Route} {label : ActionLabel program}
      {routeContext context : Context} {suffix : List Bool}
      (selected : RouteContext (selectedAction program) snapshot tree route label
        routeContext)
      (inner : ContainsLive context suffix) :
      ContainsLive (routeContext.comp context) suffix
  | local {context : Context} {suffix : List Bool}
      (bits : List Bool) (continuation snapshot : Term)
      (status : ReachableAudit.HaltState)
      (inner : ContainsLive context suffix) :
      ContainsLive
        ((localDispatcherContext bits continuation
          (ReachableAudit.haltField status snapshot) snapshot snapshot).comp
          context)
        suffix

namespace ContainsLive

/-- A structural later-live witness always carries a nonempty logical suffix. -/
theorem suffix_ne_nil
    {context : Context} {suffix : List Bool}
    (h : ContainsLive context suffix) : suffix ≠ [] := by
  induction h with
  | live bit inner => simp
  | tombstone bit audit inner ih => exact ih
  | base actions bits continuation inner ih => exact ih
  | action program label snapshot inner ih => exact ih
  | route selected inner ih => exact ih
  | «local» bits continuation snapshot status inner ih => exact ih

end ContainsLive

namespace AscentContext

/-- Exact ascent contains a live wrapper exactly when its suffix is nonempty. -/
theorem containsLive_iff_suffix_ne_nil
    {context : Context} {suffix : List Bool}
    (h : AscentContext context suffix) :
    ContainsLive context suffix ↔ suffix ≠ [] := by
  constructor
  · exact ContainsLive.suffix_ne_nil
  · intro hne
    induction h with
    | hole => exact (hne rfl).elim
    | live bit inner ih => exact .live bit inner
    | tombstone bit audit inner ih => exact .tombstone bit audit (ih hne)
    | base actions bits continuation inner ih =>
        exact .base actions bits continuation (ih hne)
    | action program label snapshot inner ih =>
        exact .action program label snapshot (ih hne)
    | route selected inner ih => exact .route selected (ih hne)
    | «local» bits continuation snapshot status inner ih =>
        exact .local bits continuation snapshot status (ih hne)

/-- The Boolean flag agrees with structural live-constructor existence. -/
theorem laterLiveFlag_eq_true_iff_containsLive
    {context : Context} {suffix : List Bool}
    (h : AscentContext context suffix) :
    h.laterLiveFlag = true ↔ ContainsLive context suffix := by
  rw [h.laterLiveFlag_eq_true_iff, h.containsLive_iff_suffix_ne_nil]

end AscentContext

namespace QueueContext

/-- Queue wrappers transport a full ascent proof and append their live labels. -/
theorem wrapAscent
    {queueContext innerContext : Context}
    {appended suffix : List Bool}
    (queue : QueueContext queueContext appended)
    (inner : AscentContext innerContext suffix) :
    AscentContext (queueContext.comp innerContext) (suffix ++ appended) := by
  induction queue with
  | hole =>
      rw [List.append_nil]
      simpa only [Context.comp] using inner
  | live bit queue ih =>
      have wrapped := AscentContext.live bit ih
      simpa [Context.comp, List.append_assoc] using wrapped
  | tombstone bit audit queue ih =>
      have wrapped := AscentContext.tombstone bit audit ih
      simpa [CellDeletion.tombstoneContext, Context.comp] using wrapped

/--
Two registered queue paths ending at admissible whole roots cannot disagree
about either their endpoint or their logical labels.  Admissibility is used
only at the endpoint, where root arity separates a whole carrier from the
arity-three live and arity-two tombstone constructors.
-/
theorem plug_root_deterministic
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation : Term}
    (hadmissible : Carrier.Admissible continuation)
    {firstRoot secondRoot : Term}
    (firstRootShape : RootPath.Root program tree bits continuation firstRoot)
    (secondRootShape : RootPath.Root program tree bits continuation secondRoot)
    {firstContext secondContext : Context}
    {firstDecoded secondDecoded : List Bool}
    (first : QueueContext firstContext firstDecoded)
    (second : QueueContext secondContext secondDecoded)
    (sameTerm : firstContext.plug firstRoot =
      secondContext.plug secondRoot) :
    firstRoot = secondRoot ∧ firstDecoded = secondDecoded := by
  induction first generalizing secondRoot secondContext secondDecoded with
  | hole =>
      cases second with
      | hole => exact ⟨sameTerm, rfl⟩
      | live bit inner =>
          exact (RootPath.Path.root_ne_live hadmissible firstRootShape bit
            sameTerm).elim
      | tombstone bit audit inner =>
          exact (RootPath.Path.root_ne_tombstone hadmissible firstRootShape bit
            sameTerm).elim
  | @live firstContext firstDecoded firstBit firstInner ih =>
      cases second with
      | hole =>
          exact (RootPath.Path.root_ne_live hadmissible secondRootShape firstBit
            sameTerm.symm).elim
      | @live secondContext secondDecoded secondBit secondInner =>
          have tailsEqual : firstContext.plug firstRoot =
              secondContext.plug secondRoot := by
            injection sameTerm
          have bitsEqual : firstBit = secondBit := by
            cases firstBit <;> cases secondBit <;>
              simp_all [PureSFormal.PureS.live, valueTag, v0, v1, b, C]
          obtain ⟨rootsEqual, decodedEqual⟩ :=
            ih secondRootShape secondInner tailsEqual
          subst secondBit
          exact ⟨rootsEqual, by simp [decodedEqual]⟩
      | @tombstone secondContext secondDecoded secondBit audit secondInner =>
          exact (RootPath.Path.live_ne_tombstone firstBit secondBit
            (firstContext.plug firstRoot) (secondContext.plug secondRoot) audit
            sameTerm).elim
  | @tombstone firstContext firstDecoded firstBit firstAudit firstInner ih =>
      cases second with
      | hole =>
          exact (RootPath.Path.root_ne_tombstone hadmissible secondRootShape
            firstBit sameTerm.symm).elim
      | @live secondContext secondDecoded secondBit secondInner =>
          exact (RootPath.Path.live_ne_tombstone secondBit firstBit
            (secondContext.plug secondRoot) (firstContext.plug firstRoot)
            firstAudit sameTerm.symm).elim
      | @tombstone secondContext secondDecoded secondBit secondAudit secondInner =>
          have functionsEqual :
              Term.app Term.s (firstContext.plug firstRoot) =
                Term.app Term.s (secondContext.plug secondRoot) := by
            injection sameTerm
          have predecessorsEqual : firstContext.plug firstRoot =
              secondContext.plug secondRoot := by
            injection functionsEqual
          exact ih secondRootShape secondInner predecessorsEqual

/-- Strong form retaining the literal queue context, including tombstone audits. -/
theorem plug_root_context_deterministic
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation : Term}
    (hadmissible : Carrier.Admissible continuation)
    {firstRoot secondRoot : Term}
    (firstRootShape : RootPath.Root program tree bits continuation firstRoot)
    (secondRootShape : RootPath.Root program tree bits continuation secondRoot)
    {firstContext secondContext : Context}
    {firstDecoded secondDecoded : List Bool}
    (first : QueueContext firstContext firstDecoded)
    (second : QueueContext secondContext secondDecoded)
    (sameTerm : firstContext.plug firstRoot =
      secondContext.plug secondRoot) :
    firstRoot = secondRoot ∧ firstContext = secondContext ∧
      firstDecoded = secondDecoded := by
  induction first generalizing secondRoot secondContext secondDecoded with
  | hole =>
      cases second with
      | hole => exact ⟨sameTerm, rfl, rfl⟩
      | live bit inner =>
          exact (RootPath.Path.root_ne_live hadmissible firstRootShape bit
            sameTerm).elim
      | tombstone bit audit inner =>
          exact (RootPath.Path.root_ne_tombstone hadmissible firstRootShape bit
            sameTerm).elim
  | @live firstContext firstDecoded firstBit firstInner ih =>
      cases second with
      | hole =>
          exact (RootPath.Path.root_ne_live hadmissible secondRootShape firstBit
            sameTerm.symm).elim
      | @live secondContext secondDecoded secondBit secondInner =>
          have headsEqual : PureSFormal.PureS.live firstBit =
              PureSFormal.PureS.live secondBit := by
            injection sameTerm
          have tailsEqual : firstContext.plug firstRoot =
              secondContext.plug secondRoot := by
            injection sameTerm
          have bitsEqual : firstBit = secondBit := by
            cases firstBit <;> cases secondBit <;>
              simp_all [PureSFormal.PureS.live, valueTag, v0, v1, b, C]
          obtain ⟨rootsEqual, contextsEqual, decodedEqual⟩ :=
            ih secondRootShape secondInner tailsEqual
          subst secondBit
          subst secondContext
          exact ⟨rootsEqual, rfl, by simp [decodedEqual]⟩
      | @tombstone secondContext secondDecoded secondBit audit secondInner =>
          exact (RootPath.Path.live_ne_tombstone firstBit secondBit
            (firstContext.plug firstRoot) (secondContext.plug secondRoot) audit
            sameTerm).elim
  | @tombstone firstContext firstDecoded firstBit firstAudit firstInner ih =>
      cases second with
      | hole =>
          exact (RootPath.Path.root_ne_tombstone hadmissible secondRootShape
            firstBit sameTerm.symm).elim
      | @live secondContext secondDecoded secondBit secondInner =>
          exact (RootPath.Path.live_ne_tombstone secondBit firstBit
            (secondContext.plug secondRoot) (firstContext.plug firstRoot)
            firstAudit sameTerm.symm).elim
      | @tombstone secondContext secondDecoded secondBit secondAudit secondInner =>
          have functionsEqual :
              Term.app Term.s (firstContext.plug firstRoot) =
                Term.app Term.s (secondContext.plug secondRoot) := by
            injection sameTerm
          have argumentsEqual :
              Term.app (valueTag firstBit) firstAudit =
                Term.app (valueTag secondBit) secondAudit := by
            injection sameTerm
          have predecessorsEqual : firstContext.plug firstRoot =
              secondContext.plug secondRoot := by
            injection functionsEqual
          have tagsEqual : valueTag firstBit = valueTag secondBit := by
            injection argumentsEqual
          have auditsEqual : firstAudit = secondAudit := by
            injection argumentsEqual
          have bitsEqual : firstBit = secondBit := by
            cases firstBit <;> cases secondBit <;>
              simp_all [valueTag, v0, v1, C]
          obtain ⟨rootsEqual, contextsEqual, decodedEqual⟩ :=
            ih secondRootShape secondInner predecessorsEqual
          subst secondBit
          subst secondAudit
          subst secondContext
          exact ⟨rootsEqual, rfl, decodedEqual⟩

/-- Complete queue syntax around `omega` also fixes its literal context. -/
theorem plug_omega_context_deterministic
    {firstContext secondContext : Context}
    {firstDecoded secondDecoded : List Bool}
    (first : QueueContext firstContext firstDecoded)
    (second : QueueContext secondContext secondDecoded)
    (sameTerm : firstContext.plug omega = secondContext.plug omega) :
    firstContext = secondContext ∧ firstDecoded = secondDecoded := by
  induction first generalizing secondContext secondDecoded with
  | hole =>
      cases second with
      | hole => exact ⟨rfl, rfl⟩
      | live bit inner =>
          exact (Carrier.omega_ne_liveCell bit _ sameTerm).elim
      | tombstone bit audit inner =>
          exact (Carrier.omega_ne_tombstone bit _ audit sameTerm).elim
  | @live firstContext firstDecoded firstBit firstInner ih =>
      cases second with
      | hole => exact (Carrier.omega_ne_liveCell firstBit _ sameTerm.symm).elim
      | @live secondContext secondDecoded secondBit secondInner =>
          have tailsEqual : firstContext.plug omega =
              secondContext.plug omega := by
            injection sameTerm
          have bitsEqual : firstBit = secondBit := by
            cases firstBit <;> cases secondBit <;>
              simp_all [PureSFormal.PureS.live, valueTag, v0, v1, b, C]
          obtain ⟨contextsEqual, decodedEqual⟩ := ih secondInner tailsEqual
          subst secondBit
          subst secondContext
          exact ⟨rfl, by simp [decodedEqual]⟩
      | @tombstone secondContext secondDecoded secondBit audit secondInner =>
          exact (Carrier.liveCell_ne_tombstone firstBit secondBit _ _ audit
            sameTerm).elim
  | @tombstone firstContext firstDecoded firstBit firstAudit firstInner ih =>
      cases second with
      | hole =>
          exact (Carrier.omega_ne_tombstone firstBit _ firstAudit
            sameTerm.symm).elim
      | @live secondContext secondDecoded secondBit secondInner =>
          exact (Carrier.liveCell_ne_tombstone secondBit firstBit _ _ firstAudit
            sameTerm.symm).elim
      | @tombstone secondContext secondDecoded secondBit secondAudit secondInner =>
          have functionsEqual :
              Term.app Term.s (firstContext.plug omega) =
                Term.app Term.s (secondContext.plug omega) := by
            injection sameTerm
          have argumentsEqual :
              Term.app (valueTag firstBit) firstAudit =
                Term.app (valueTag secondBit) secondAudit := by
            injection sameTerm
          have predecessorsEqual : firstContext.plug omega =
              secondContext.plug omega := by
            injection functionsEqual
          have auditsEqual : firstAudit = secondAudit := by
            injection argumentsEqual
          have bitsEqual : firstBit = secondBit := by
            cases firstBit <;> cases secondBit <;>
              simp_all [valueTag, v0, v1, C]
          obtain ⟨contextsEqual, decodedEqual⟩ := ih secondInner
            predecessorsEqual
          subst secondBit
          subst secondAudit
          subst secondContext
          exact ⟨rfl, decodedEqual⟩

end QueueContext

/-! ## Proof-relevant canonical selection inside one queue segment -/

/--
The innermost live wrapper of a nonempty queue context.  Unlike a bare
`FrontCertificate`, this grammar records that everything below `here` has
logical word `[]`; consequently it cannot select a later live ancestor.
-/
inductive QueueSelection :
    Context → Bool → List Bool → Context → Address → Prop where
  | here {innerContext : Context} (bit : Bool)
      (inner : QueueContext innerContext []) :
      QueueSelection
        (.appRight (PureSFormal.PureS.live bit) innerContext)
        bit [] .hole []
  | live {sourceContext outerContext : Context}
      {bit : Bool} {suffix : List Bool} {address : Address}
      (outerBit : Bool)
      (inner : QueueSelection sourceContext bit suffix outerContext address) :
      QueueSelection
        (.appRight (PureSFormal.PureS.live outerBit) sourceContext)
        bit (suffix ++ [outerBit])
        (.appRight (PureSFormal.PureS.live outerBit) outerContext)
        (.right :: address)
  | tombstone {sourceContext outerContext : Context}
      {bit : Bool} {suffix : List Bool} {address : Address}
      (outerBit : Bool) (audit : Term)
      (inner : QueueSelection sourceContext bit suffix outerContext address) :
      QueueSelection (CellDeletion.tombstoneContext outerBit audit sourceContext)
        bit suffix (CellDeletion.tombstoneContext outerBit audit outerContext)
        (.left :: .right :: address)

namespace QueueSelection

/-- A queue selection reconstructs the full nonempty queue grammar. -/
theorem sourceShape
    {sourceContext outerContext : Context}
    {bit : Bool} {suffix : List Bool} {address : Address}
    (h : QueueSelection sourceContext bit suffix outerContext address) :
    QueueContext sourceContext (bit :: suffix) := by
  induction h with
  | here bit inner => simpa using QueueContext.live bit inner
  | live outerBit inner ih =>
      simpa [List.append_assoc] using QueueContext.live outerBit ih
  | tombstone outerBit audit inner ih =>
      exact QueueContext.tombstone outerBit audit ih

/-- Its outer context is exactly the public cell-deletion ascent grammar. -/
theorem outerShape
    {sourceContext outerContext : Context}
    {bit : Bool} {suffix : List Bool} {address : Address}
    (h : QueueSelection sourceContext bit suffix outerContext address) :
    CellDeletion.OuterContext outerContext address suffix := by
  induction h with
  | here bit inner => exact .hole
  | live outerBit inner ih => exact .live outerBit ih
  | tombstone outerBit audit inner ih => exact .tombstone outerBit audit ih

/-- Build the canonical selection by ascending from an empty inner segment. -/
theorem ofOuter
    {innerContext outerContext : Context}
    {bit : Bool} {suffix : List Bool} {address : Address}
    (inner : QueueContext innerContext [])
    (outer : CellDeletion.OuterContext outerContext address suffix) :
    QueueSelection
      (outerContext.comp
        (.appRight (PureSFormal.PureS.live bit) innerContext))
      bit suffix outerContext address := by
  induction outer with
  | hole => exact .here bit inner
  | live outerBit outer ih =>
      simpa [Context.comp] using QueueSelection.live outerBit ih
  | tombstone outerBit audit outer ih =>
      simpa [CellDeletion.tombstoneContext, Context.comp] using
        QueueSelection.tombstone outerBit audit ih

/-- Every nonempty queue context has a construction-selected front. -/
theorem ofQueueContext
    {sourceContext : Context} {bit : Bool} {suffix : List Bool}
    (h : QueueContext sourceContext (bit :: suffix)) :
    ∃ outerContext address,
      QueueSelection sourceContext bit suffix outerContext address := by
  obtain ⟨innerContext, outerContext, address, inner, outer, contextEq⟩ :=
    h.splitFront_cons
  exact ⟨outerContext, address, contextEq ▸ ofOuter inner outer⟩

/--
The empty-inner side condition makes queue selection proof-independent.  This
is the exact strengthening missing from the permissive `FrontCertificate`.
-/
theorem deterministic_of_eq
    {firstSource secondSource firstOuter secondOuter : Context}
    {firstBit secondBit : Bool}
    {firstSuffix secondSuffix : List Bool}
    {firstAddress secondAddress : Address}
    (first : QueueSelection firstSource firstBit firstSuffix firstOuter
      firstAddress)
    (second : QueueSelection secondSource secondBit secondSuffix secondOuter
      secondAddress)
    (sameSource : firstSource = secondSource) :
    firstBit = secondBit ∧ firstSuffix = secondSuffix ∧
      firstOuter = secondOuter ∧ firstAddress = secondAddress := by
  induction first generalizing secondSource secondBit secondSuffix secondOuter
      secondAddress with
  | @here firstInnerContext firstBit firstInner =>
      cases second with
      | @here secondInnerContext secondBit secondInner =>
          have headsEqual : PureSFormal.PureS.live firstBit =
              PureSFormal.PureS.live secondBit := by
            injection sameSource
          have bitsEqual : firstBit = secondBit := by
            cases firstBit <;> cases secondBit <;>
              simp_all [PureSFormal.PureS.live, valueTag, v0, v1, b, C]
          subst secondBit
          exact ⟨rfl, rfl, rfl, rfl⟩
      | @live secondSource secondOuter secondBit secondSuffix secondAddress
          outerBit secondInner =>
          have contextsEqual : firstInnerContext = secondSource := by
            injection sameSource
          have impossible : ([] : List Bool) = secondBit :: secondSuffix :=
            firstInner.decoded_deterministic
              (contextsEqual ▸ secondInner.sourceShape)
          cases impossible
      | tombstone outerBit audit secondInner => cases sameSource
  | @live firstSource firstOuter firstBit firstSuffix firstAddress outerBit
      firstInner ih =>
      cases second with
      | @here secondInnerContext secondBit secondInner =>
          have contextsEqual : firstSource = secondInnerContext := by
            injection sameSource
          have impossible : firstBit :: firstSuffix = ([] : List Bool) :=
            firstInner.sourceShape.decoded_deterministic
              (contextsEqual ▸ secondInner)
          cases impossible
      | @live secondSource secondOuter secondBit secondSuffix secondAddress
          secondOuterBit secondInner =>
          have sourceContextsEqual : firstSource = secondSource := by
            injection sameSource
          obtain ⟨bitsEqual, suffixesEqual, outersEqual, addressesEqual⟩ :=
            ih secondInner sourceContextsEqual
          have outerBitsEqual : outerBit = secondOuterBit := by
            cases outerBit <;> cases secondOuterBit <;>
              simp_all [PureSFormal.PureS.live, valueTag, v0, v1, b, C]
          subst secondOuterBit
          subst secondBit
          subst secondSuffix
          subst secondOuter
          subst secondAddress
          exact ⟨rfl, rfl, rfl, rfl⟩
      | tombstone secondOuterBit audit secondInner => cases sameSource
  | @tombstone firstSource firstOuter firstBit firstSuffix firstAddress outerBit
      firstAudit firstInner ih =>
      cases second with
      | here secondBit secondInner => cases sameSource
      | live secondOuterBit secondInner => cases sameSource
      | @tombstone secondSource secondOuter secondBit secondSuffix secondAddress
          secondOuterBit secondAudit secondInner =>
          have parentsEqual : Context.appRight Term.s firstSource =
              Context.appRight Term.s secondSource := by
            injection sameSource
          have sourceContextsEqual : firstSource = secondSource := by
            injection parentsEqual
          obtain ⟨bitsEqual, suffixesEqual, outersEqual, addressesEqual⟩ :=
            ih secondInner sourceContextsEqual
          have outerBitsEqual : outerBit = secondOuterBit := by
            have argumentsEqual :
                Term.app (valueTag outerBit) firstAudit =
                  Term.app (valueTag secondOuterBit) secondAudit := by
              injection sameSource
            have tagsEqual : valueTag outerBit = valueTag secondOuterBit := by
              injection argumentsEqual
            cases outerBit <;> cases secondOuterBit <;>
              simp_all [valueTag, v0, v1, C]
          have auditsEqual : firstAudit = secondAudit := by
            have argumentsEqual :
                Term.app (valueTag outerBit) firstAudit =
                  Term.app (valueTag secondOuterBit) secondAudit := by
              injection sameSource
            injection argumentsEqual
          subst secondOuterBit
          subst secondAudit
          subst secondBit
          subst secondSuffix
          subst secondOuter
          subst secondAddress
          exact ⟨rfl, rfl, rfl, rfl⟩

/-- Same-source specialization of canonical queue-front uniqueness. -/
theorem deterministic
    {source firstOuter secondOuter : Context}
    {firstBit secondBit : Bool}
    {firstSuffix secondSuffix : List Bool}
    {firstAddress secondAddress : Address}
    (first : QueueSelection source firstBit firstSuffix firstOuter firstAddress)
    (second : QueueSelection source secondBit secondSuffix secondOuter
      secondAddress) :
    firstBit = secondBit ∧ firstSuffix = secondSuffix ∧
      firstOuter = secondOuter ∧ firstAddress = secondAddress :=
  deterministic_of_eq first second rfl

end QueueSelection

/--
One globally selected logical front and its diagonal C4 endpoint.  The exact
outer context determines both the occurrence address and every retained
sibling.
-/
structure FrontCertificate
    (source target : Term) (bit : Bool) (suffix : List Bool)
    (predecessor : Term) (outerContext : Context) : Prop where
  outer : AscentContext outerContext suffix
  source_eq :
    source = outerContext.plug
      (.app (PureSFormal.PureS.live bit) predecessor)
  target_eq :
    target = outerContext.plug
      (Carrier.tombstone bit predecessor predecessor)

namespace FrontCertificate

/-- The certificate's canonical address selects the registered live cell. -/
theorem selected_subterm
    {source target : Term} {bit : Bool} {suffix : List Bool}
    {predecessor : Term} {outerContext : Context}
    (h : FrontCertificate source target bit suffix predecessor outerContext) :
    source.subterm? (contextAddress outerContext) =
      some (.app (PureSFormal.PureS.live bit) predecessor) := by
  rw [h.source_eq]
  exact context_subterm?_plug outerContext _

/-- Replacing exactly that address gives the certified endpoint. -/
theorem endpoint_replace
    {source target : Term} {bit : Bool} {suffix : List Bool}
    {predecessor : Term} {outerContext : Context}
    (h : FrontCertificate source target bit suffix predecessor outerContext) :
    source.replace? (contextAddress outerContext)
        (Carrier.tombstone bit predecessor predecessor) = some target := by
  rw [h.source_eq, h.target_eq]
  exact context_replace?_plug outerContext _ _

/-- The global replacement is exactly one contextual C4 contraction. -/
theorem steps
    {source target : Term} {bit : Bool} {suffix : List Bool}
    {predecessor : Term} {outerContext : Context}
    (h : FrontCertificate source target bit suffix predecessor outerContext) :
    StepsN 1 source target := by
  rw [h.source_eq, h.target_eq]
  exact (C4_live_delete bit predecessor).inContext outerContext

/-- A later live ancestor exists precisely when the decoded suffix is nonempty. -/
theorem laterLiveFlag_eq_true_iff
    {source target : Term} {bit : Bool} {suffix : List Bool}
    {predecessor : Term} {outerContext : Context}
    (h : FrontCertificate source target bit suffix predecessor outerContext) :
    h.outer.laterLiveFlag = true ↔ suffix ≠ [] :=
  h.outer.laterLiveFlag_eq_true_iff

/-- The returned flag denotes an actual later `live` constructor in the ascent. -/
theorem laterLiveFlag_eq_true_iff_containsLive
    {source target : Term} {bit : Bool} {suffix : List Bool}
    {predecessor : Term} {outerContext : Context}
    (h : FrontCertificate source target bit suffix predecessor outerContext) :
    h.outer.laterLiveFlag = true ↔ ContainsLive outerContext suffix :=
  h.outer.laterLiveFlag_eq_true_iff_containsLive

/-- Transport a selected front through an outer queue segment. -/
theorem wrapQueue
    {source target : Term} {bit : Bool} {suffix appended : List Bool}
    {predecessor : Term} {outerContext queueContext : Context}
    (h : FrontCertificate source target bit suffix predecessor outerContext)
    (queue : QueueContext queueContext appended) :
    FrontCertificate (queueContext.plug source) (queueContext.plug target) bit
      (suffix ++ appended) predecessor (queueContext.comp outerContext) := by
  refine ⟨queue.wrapAscent h.outer, ?_, ?_⟩
  · simp [Context.plug_comp, h.source_eq]
  · simp [Context.plug_comp, h.target_eq]

/-- Transport a selected front through the exact retained-history action spine. -/
theorem wrapAction
    {source target : Term} {bit : Bool} {suffix : List Bool}
    {predecessor : Term} {outerContext : Context}
    (h : FrontCertificate source target bit suffix predecessor outerContext)
    (program : CTS.Program) (label : ActionLabel program) (snapshot : Term) :
    let action := actionContext (actionHistories program label snapshot)
    FrontCertificate (action.plug source) (action.plug target) bit suffix
      predecessor (action.comp outerContext) := by
  dsimp
  refine ⟨.action program label snapshot h.outer, ?_, ?_⟩
  · simp [Context.plug_comp, h.source_eq]
  · simp [Context.plug_comp, h.target_eq]

/-- Transport a selected front through an exact same-snapshot route. -/
theorem wrapRoute
    {program : CTS.Program} {snapshot : Term}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program}
    {routeContext : Context}
    (selected : RouteContext (selectedAction program) snapshot tree route label
      routeContext)
    {source target : Term} {bit : Bool} {suffix : List Bool}
    {predecessor : Term} {outerContext : Context}
    (h : FrontCertificate source target bit suffix predecessor outerContext) :
    FrontCertificate (routeContext.plug source) (routeContext.plug target) bit
      suffix predecessor (routeContext.comp outerContext) := by
  refine ⟨.route selected h.outer, ?_, ?_⟩
  · simp [Context.plug_comp, h.source_eq]
  · simp [Context.plug_comp, h.target_eq]

/-- Transport a selected front through the exact Local dispatcher field. -/
theorem wrapLocal
    {source target : Term} {bit : Bool} {suffix : List Bool}
    {predecessor : Term} {outerContext : Context}
    (h : FrontCertificate source target bit suffix predecessor outerContext)
    (bits : List Bool) (continuation snapshot : Term)
    (status : ReachableAudit.HaltState) :
    let shell := localDispatcherContext bits continuation
      (ReachableAudit.haltField status snapshot) snapshot snapshot
    FrontCertificate (shell.plug source) (shell.plug target) bit suffix
      predecessor (shell.comp outerContext) := by
  dsimp
  refine ⟨.local bits continuation snapshot status h.outer, ?_, ?_⟩
  · simp [Context.plug_comp, h.source_eq]
  · simp [Context.plug_comp, h.target_eq]

/-- Transport a selected queue front through its exact reachable Base. -/
theorem wrapBase
    {source target : Term} {bit : Bool} {suffix : List Bool}
    {predecessor : Term} {outerContext : Context}
    (h : FrontCertificate source target bit suffix predecessor outerContext)
    (actions : Term) (bits : List Bool) (continuation : Term) :
    let base := MutableBase.queueContext actions bits continuation
      (baseBeta (environmentCode actions bits) continuation)
    FrontCertificate (base.plug source) (base.plug target) bit suffix
      predecessor (base.comp outerContext) := by
  dsimp
  refine ⟨.base actions bits continuation h.outer, ?_, ?_⟩
  · simp [Context.plug_comp, h.source_eq]
  · simp [Context.plug_comp, h.target_eq]

end FrontCertificate

/-! ## Full exact carrier descent -/

/--
An exact canonical descent from a reachable carrier to `omega`.

The `context` index is the complete one-hole context around that terminal.
The Local constructor displays, in order, the current carrier, appended queue
segment, exact action spine, exact same-snapshot route, and exact Local shell.
-/
inductive Descent
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation : Term) :
    Term → List Bool → Context → Prop where
  | base
      {queueContext : Context} {decoded : List Bool}
      (queue : QueueContext queueContext decoded) :
      Descent program tree bits continuation
        (MutableBase.mutableBase (compileActions program tree) bits continuation
          (queueContext.plug omega))
        decoded
        ((MutableBase.queueContext (compileActions program tree) bits continuation
          (baseBeta
            (environmentCode (compileActions program tree) bits) continuation)).comp
          queueContext)
  | local
      {snapshot : Term}
      {currentContext segmentContext routeContext : Context}
      {currentWord appended : List Bool}
      {status : ReachableAudit.HaltState}
      {route : Dispatcher.Route} {label : ActionLabel program}
      (snapshotInv : ReachableAudit.Holds program tree bits continuation snapshot)
      (current : Descent program tree bits continuation
        (currentContext.plug omega) currentWord currentContext)
      (segment : QueueContext segmentContext appended)
      (selectedRoute : RouteContext (selectedAction program) snapshot tree route
        label routeContext) :
      Descent program tree bits continuation
        ((localContext program bits continuation snapshot status label
          routeContext segmentContext currentContext).plug omega)
        (currentWord ++ appended)
        (localContext program bits continuation snapshot status label
          routeContext segmentContext currentContext)

/-!
`SelectedFront` is the minimally stronger global invariant needed for the
uniqueness half of Lemma 4.1.  `FrontCertificate` alone says only that a live
occurrence has a suffix-shaped ascent; it does not say that the path below it
contains no earlier live cell.  Here that missing fact is supplied by
`QueueSelection.here`, and the two Local constructors make the choice of
current carrier versus newly appended segment explicit.
-/
inductive SelectedFront
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation : Term) :
    Term → Bool → List Bool → Context → Prop where
  | base
      {queueContext cellOuter : Context}
      {bit : Bool} {suffix : List Bool} {cellAddress : Address}
      (queue : QueueContext queueContext (bit :: suffix))
      (selected : QueueSelection queueContext bit suffix cellOuter cellAddress) :
      SelectedFront program tree bits continuation
        (MutableBase.mutableBase (compileActions program tree) bits continuation
          (queueContext.plug omega))
        bit suffix
        ((MutableBase.queueContext (compileActions program tree) bits continuation
          (baseBeta
            (environmentCode (compileActions program tree) bits) continuation)).comp
          cellOuter)
  | inside
      {snapshot : Term}
      {currentContext segmentContext routeContext currentOuter : Context}
      {bit : Bool} {currentSuffix appended : List Bool}
      {status : ReachableAudit.HaltState}
      {route : Dispatcher.Route} {label : ActionLabel program}
      (snapshotInv : ReachableAudit.Holds program tree bits continuation snapshot)
      (current : Descent program tree bits continuation
        (currentContext.plug omega) (bit :: currentSuffix) currentContext)
      (segment : QueueContext segmentContext appended)
      (selectedRoute : RouteContext (selectedAction program) snapshot tree route
        label routeContext)
      (inner : SelectedFront program tree bits continuation
        (currentContext.plug omega) bit currentSuffix currentOuter) :
      SelectedFront program tree bits continuation
        ((localContext program bits continuation snapshot status label
          routeContext segmentContext currentContext).plug omega)
        bit (currentSuffix ++ appended)
        ((localDispatcherContext bits continuation
          (ReachableAudit.haltField status snapshot) snapshot snapshot).comp
          (routeContext.comp
            ((actionContext (actionHistories program label snapshot)).comp
              (segmentContext.comp currentOuter))))
  | segment
      {snapshot : Term}
      {currentContext segmentContext routeContext cellOuter : Context}
      {bit : Bool} {suffix : List Bool} {cellAddress : Address}
      {status : ReachableAudit.HaltState}
      {route : Dispatcher.Route} {label : ActionLabel program}
      (snapshotInv : ReachableAudit.Holds program tree bits continuation snapshot)
      (current : Descent program tree bits continuation
        (currentContext.plug omega) [] currentContext)
      (queue : QueueContext segmentContext (bit :: suffix))
      (selectedRoute : RouteContext (selectedAction program) snapshot tree route
        label routeContext)
      (selected : QueueSelection segmentContext bit suffix cellOuter
        cellAddress) :
      SelectedFront program tree bits continuation
        ((localContext program bits continuation snapshot status label
          routeContext segmentContext currentContext).plug omega)
        bit suffix
        ((localDispatcherContext bits continuation
          (ReachableAudit.haltField status snapshot) snapshot snapshot).comp
          (routeContext.comp
            ((actionContext (actionHistories program label snapshot)).comp
              cellOuter)))

namespace QueueSelection

/-- Exact context factorization at the construction-selected live wrapper. -/
theorem split
    {sourceContext outerContext : Context}
    {bit : Bool} {suffix : List Bool} {address : Address}
    (h : QueueSelection sourceContext bit suffix outerContext address) :
    ∃ innerContext,
      QueueContext innerContext [] ∧
      sourceContext = outerContext.comp
        (.appRight (PureSFormal.PureS.live bit) innerContext) := by
  induction h with
  | here bit inner => exact ⟨_, inner, rfl⟩
  | live outerBit inner ih =>
      obtain ⟨innerContext, innerEmpty, contextEq⟩ := ih
      refine ⟨innerContext, innerEmpty, ?_⟩
      simp [contextEq, Context.comp]
  | tombstone outerBit audit inner ih =>
      obtain ⟨innerContext, innerEmpty, contextEq⟩ := ih
      refine ⟨innerContext, innerEmpty, ?_⟩
      simp [CellDeletion.tombstoneContext, contextEq, Context.comp]

/--
Replace the construction-selected live cell inside a queue context, around an
arbitrary endpoint.  The returned context retains every audit and decodes the
literal suffix.
-/
theorem deleteContext
    {sourceContext cellOuter : Context}
    {bit : Bool} {suffix : List Bool} {address : Address}
    (h : QueueSelection sourceContext bit suffix cellOuter address)
    (endpoint : Term) :
    ∃ targetContext predecessor,
      QueueContext targetContext suffix ∧
      sourceContext.plug endpoint =
        cellOuter.plug (.app (PureSFormal.PureS.live bit) predecessor) ∧
      targetContext.plug endpoint =
        cellOuter.plug (Carrier.tombstone bit predecessor predecessor) := by
  obtain ⟨innerContext, innerEmpty, sourceContextEq⟩ := h.split
  let predecessor := innerContext.plug endpoint
  let deletedInner :=
    CellDeletion.tombstoneContext bit predecessor innerContext
  let targetContext := cellOuter.comp deletedInner
  have deletedShape : QueueContext deletedInner [] :=
    .tombstone bit predecessor innerEmpty
  have targetShape : QueueContext targetContext suffix := by
    simpa [targetContext] using
      QueueContext.comp (QueueContext.ofOuterContext h.outerShape) deletedShape
  refine ⟨targetContext, predecessor, targetShape, ?_, ?_⟩
  · simp [sourceContextEq, predecessor, Context.plug_comp]
  · simp [targetContext, deletedInner, predecessor, Context.plug_comp,
      CellDeletion.tombstoneContext, Carrier.tombstone]

end QueueSelection

namespace SelectedFront

/-- Every selected front forgets to a complete exact descent. -/
theorem descent
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term}
    {bit : Bool} {suffix : List Bool} {outerContext : Context}
    (h : SelectedFront program tree bits continuation source bit suffix
      outerContext) :
    ∃ context,
      Descent program tree bits continuation source (bit :: suffix) context := by
  cases h with
  | base queue selected => exact ⟨_, .base queue⟩
  | inside snapshotInv current segment selectedRoute inner =>
      exact ⟨_, by
        simpa [List.append_assoc] using
          Descent.local snapshotInv current segment selectedRoute⟩
  | segment snapshotInv current queue selectedRoute selected =>
      exact ⟨_, by
        simpa using Descent.local snapshotInv current queue selectedRoute⟩

/-- The selected outer context carries exactly the logical suffix. -/
theorem outerAscent
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term}
    {bit : Bool} {suffix : List Bool} {outerContext : Context}
    (h : SelectedFront program tree bits continuation source bit suffix
      outerContext) :
    AscentContext outerContext suffix := by
  induction h with
  | base queue selected =>
      exact .base (compileActions program tree) bits continuation
        (AscentContext.ofCellOuter selected.outerShape)
  | @inside snapshot currentContext segmentContext routeContext currentOuter bit
      currentSuffix appended status route label snapshotInv current segment
      selectedRoute inner ih =>
      exact .local bits continuation snapshot status
        (.route selectedRoute
          (.action program label snapshot (segment.wrapAscent ih)))
  | @segment snapshot currentContext segmentContext routeContext cellOuter bit
      suffix cellAddress status route label snapshotInv current queue
      selectedRoute selected =>
      exact .local bits continuation snapshot status
        (.route selectedRoute
          (.action program label snapshot
            (AscentContext.ofCellOuter selected.outerShape)))

/-- The selected context literally exposes one live occurrence in the source. -/
theorem source_split
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term}
    {bit : Bool} {suffix : List Bool} {outerContext : Context}
    (h : SelectedFront program tree bits continuation source bit suffix
      outerContext) :
    ∃ predecessor,
      source = outerContext.plug
        (.app (PureSFormal.PureS.live bit) predecessor) := by
  induction h with
  | @base queueContext cellOuter bit suffix cellAddress queue selected =>
      obtain ⟨innerContext, innerEmpty, contextEq⟩ := selected.split
      refine ⟨innerContext.plug omega, ?_⟩
      simp [MutableBase.mutableBase, contextEq, Context.plug_comp]
  | @inside snapshot currentContext segmentContext routeContext currentOuter bit
      currentSuffix appended status route label snapshotInv current segment
      selectedRoute inner ih =>
      obtain ⟨predecessor, sourceEq⟩ := ih
      refine ⟨predecessor, ?_⟩
      simp [localContext, dispatcherContext, accumulatorContext,
        Context.plug_comp, sourceEq]
  | @segment snapshot currentContext segmentContext routeContext cellOuter bit
      suffix cellAddress status route label snapshotInv current queue
      selectedRoute selected =>
      obtain ⟨innerContext, innerEmpty, contextEq⟩ := selected.split
      refine ⟨innerContext.plug (currentContext.plug omega), ?_⟩
      simp [localContext, dispatcherContext, accumulatorContext,
        Context.plug_comp, contextEq]

/-- The proof-independent address selects the registered live occurrence. -/
theorem selected_subterm
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term}
    {bit : Bool} {suffix : List Bool} {outerContext : Context}
    (h : SelectedFront program tree bits continuation source bit suffix
      outerContext) :
    ∃ predecessor,
      source.subterm? (contextAddress outerContext) =
        some (.app (PureSFormal.PureS.live bit) predecessor) := by
  obtain ⟨predecessor, sourceEq⟩ := h.source_split
  exact ⟨predecessor, sourceEq ▸ context_subterm?_plug outerContext _⟩

end SelectedFront

namespace Descent

/-- The recorded context really selects the unique terminal `omega`. -/
theorem source_eq
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term}
    {decoded : List Bool} {context : Context}
    (h : Descent program tree bits continuation source decoded context) :
    context.plug omega = source := by
  cases h <;> rfl

/-- The complete canonical address selects `omega`. -/
theorem omega_subterm
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term}
    {decoded : List Bool} {context : Context}
    (h : Descent program tree bits continuation source decoded context) :
    source.subterm? (contextAddress context) = some omega := by
  rw [← h.source_eq]
  exact context_subterm?_plug context omega

/-- The finite context address is strictly shorter than the carrier tree. -/
theorem terminates
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term}
    {decoded : List Bool} {context : Context}
    (h : Descent program tree bits continuation source decoded context) :
    (contextAddress context).length < source.size := by
  rw [← h.source_eq]
  exact contextAddress_length_lt_size context omega

/-- Forgetting exact traversal data recovers the reachable-audit invariant. -/
theorem holds
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term}
    {decoded : List Bool} {context : Context}
    (h : Descent program tree bits continuation source decoded context) :
    ReachableAudit.Holds program tree bits continuation source := by
  induction h with
  | base queue => exact .base queue.decodes
  | @«local» snapshot currentContext segmentContext routeContext currentWord
      appended status route label snapshotInv current segment selectedRoute ih =>
      let accumulatorContext := segmentContext.comp currentContext
      let actionSpine := actionContext
        (actionHistories program label snapshot)
      let dispatcherContext := routeContext.comp
        (actionSpine.comp accumulatorContext)
      let dispatcher := dispatcherContext.plug omega
      let wholeContext :=
        (localDispatcherContext bits continuation
          (ReachableAudit.haltField status snapshot) snapshot snapshot).comp
          dispatcherContext
      have dispatch : ReachableAudit.SnapshotDispatchAt program tree snapshot
          route label (accumulatorContext.plug omega) dispatcher := by
        refine ⟨?_⟩
        have routeShape := selectedRoute.snapshotRoute
          (ReachableAudit.actionResponse program label snapshot
            (accumulatorContext.plug omega))
        simpa [dispatcher, dispatcherContext, actionSpine, accumulatorContext,
          ReachableAudit.actionResponse, Context.plug_comp] using routeShape
      have layer : ReachableAudit.Layer program tree bits continuation snapshot
          (accumulatorContext.plug omega) (wholeContext.plug omega) status route
          label dispatcher := by
        refine ⟨dispatch, ?_⟩
        simp [wholeContext, dispatcher, dispatcherContext, Context.plug_comp]
      exact .local snapshotInv ih
        (by
          simpa [accumulatorContext, Context.plug_comp] using
            segment.queueSegment (currentContext.plug omega))
        layer

/--
An admissible carrier term has only one logical decoding, even when the two
proofs were assembled from different `Holds`, route, audit, or queue-segment
witnesses.  The Local case first uses the public parser's right-uniqueness to
identify the two accumulator terms; `QueueContext.plug_root_deterministic`
then separates their whole-root endpoints from their queue wrappers.
-/
theorem decoded_deterministic_of_eq
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation : Term}
    (hadmissible : Carrier.Admissible continuation)
    {firstSource secondSource : Term}
    {firstDecoded secondDecoded : List Bool}
    {firstContext secondContext : Context}
    (first : Descent program tree bits continuation firstSource firstDecoded
      firstContext)
    (second : Descent program tree bits continuation secondSource secondDecoded
      secondContext)
    (sameSource : firstSource = secondSource) :
    firstDecoded = secondDecoded := by
  induction first generalizing secondSource secondDecoded secondContext with
  | @base firstQueueContext firstDecoded firstQueue =>
      cases second with
      | @base secondQueueContext secondDecoded secondQueue =>
          have queuesEqual : firstQueueContext.plug omega =
              secondQueueContext.plug omega := by
            have extracted := congrArg
              (fun term => term.subterm? BasePath.wordAddress) sameSource
            simp only [MutableBase.mutableBase_queue_subterm] at extracted
            exact Option.some.inj extracted
          have secondComplete : CellSpine.Decodes
              (firstQueueContext.plug omega) secondDecoded := by
            rw [queuesEqual]
            exact secondQueue.decodes
          exact firstQueue.decodes.deterministic secondComplete
      | @«local» snapshot currentContext segmentContext routeContext currentWord
          appended status route label snapshotInv current segment selectedRoute =>
          let accumulator := segmentContext.plug (currentContext.plug omega)
          let dispatcher := routeContext.plug
            (ReachableAudit.actionResponse program label snapshot accumulator)
          have impossible := MutableBase.base_ne_shell
            (compileActions program tree) bits continuation
            (firstQueueContext.plug omega)
            (baseBeta
              (environmentCode (compileActions program tree) bits) continuation)
            (ReachableAudit.haltField status snapshot) dispatcher snapshot snapshot
          exact (impossible (by
            simpa [MutableBase.mutableBase, accumulator, dispatcher] using!
              sameSource)).elim
  | @«local» firstSnapshot firstCurrentContext firstSegmentContext
      firstRouteContext firstCurrentWord firstAppended firstStatus firstRoute
      firstLabel firstSnapshotInv firstCurrent firstSegment firstSelected ih =>
      cases second with
      | @base secondQueueContext secondDecoded secondQueue =>
          let accumulator :=
            firstSegmentContext.plug (firstCurrentContext.plug omega)
          let dispatcher := firstRouteContext.plug
            (ReachableAudit.actionResponse program firstLabel firstSnapshot
              accumulator)
          have impossible := MutableBase.base_ne_shell
            (compileActions program tree) bits continuation
            (secondQueueContext.plug omega)
            (baseBeta
              (environmentCode (compileActions program tree) bits) continuation)
            (ReachableAudit.haltField firstStatus firstSnapshot) dispatcher
            firstSnapshot firstSnapshot
          exact (impossible (by
            simpa [MutableBase.mutableBase, accumulator, dispatcher] using!
              sameSource.symm)).elim
      | @«local» secondSnapshot secondCurrentContext secondSegmentContext
          secondRouteContext secondCurrentWord secondAppended secondStatus
          secondRoute secondLabel secondSnapshotInv secondCurrent secondSegment
          secondSelected =>
          let firstAccumulator :=
            firstSegmentContext.plug (firstCurrentContext.plug omega)
          let secondAccumulator :=
            secondSegmentContext.plug (secondCurrentContext.plug omega)
          let firstDispatcher := firstRouteContext.plug
            (ReachableAudit.actionResponse program firstLabel firstSnapshot
              firstAccumulator)
          let secondDispatcher := secondRouteContext.plug
            (ReachableAudit.actionResponse program secondLabel secondSnapshot
              secondAccumulator)
          have dispatchersEqual : firstDispatcher = secondDispatcher := by
            have extracted := congrArg
              (fun term => term.subterm? [.left, .left, .right]) sameSource
            simp only [localContext_plug, Carrier.activeShell,
              Carrier.shell_dispatcher_subterm] at extracted
            exact Option.some.inj extracted
          have firstDispatch : DispatchParser.dispatchesTo program tree
              firstDispatcher firstAccumulator := by
            exact (firstSelected.snapshotDispatchAt firstAccumulator).toDispatchesTo
          have secondDispatch : DispatchParser.dispatchesTo program tree
              firstDispatcher secondAccumulator := by
            rw [dispatchersEqual]
            exact (secondSelected.snapshotDispatchAt
              secondAccumulator).toDispatchesTo
          have accumulatorsEqual : firstAccumulator = secondAccumulator :=
            DispatchParser.dispatchesTo_rightUnique program tree firstDispatch
              secondDispatch
          obtain ⟨rootsEqual, appendedEqual⟩ :=
            QueueContext.plug_root_deterministic hadmissible
              firstCurrent.holds.toRoot secondCurrent.holds.toRoot firstSegment
              secondSegment accumulatorsEqual
          have currentWordsEqual : firstCurrentWord = secondCurrentWord :=
            ih secondCurrent rootsEqual
          simp [currentWordsEqual, appendedEqual]

/-- Same-source specialization of cross-proof logical determinism. -/
theorem decoded_deterministic
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term}
    (hadmissible : Carrier.Admissible continuation)
    {firstDecoded secondDecoded : List Bool}
    {firstContext secondContext : Context}
    (first : Descent program tree bits continuation source firstDecoded
      firstContext)
    (second : Descent program tree bits continuation source secondDecoded
      secondContext) :
    firstDecoded = secondDecoded :=
  decoded_deterministic_of_eq hadmissible first second rfl

/--
Strong cross-proof determinism: besides the word, the literal one-hole route
to `omega` is fixed by an admissible source term.  Thus audit proof objects may
differ, but no syntactic sibling or traversal edge in the selected carrier
path can differ.
-/
theorem deterministic_of_eq
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation : Term}
    (hadmissible : Carrier.Admissible continuation)
    {firstSource secondSource : Term}
    {firstDecoded secondDecoded : List Bool}
    {firstContext secondContext : Context}
    (first : Descent program tree bits continuation firstSource firstDecoded
      firstContext)
    (second : Descent program tree bits continuation secondSource secondDecoded
      secondContext)
    (sameSource : firstSource = secondSource) :
    firstContext = secondContext ∧ firstDecoded = secondDecoded := by
  induction first generalizing secondSource secondDecoded secondContext with
  | @base firstQueueContext firstDecoded firstQueue =>
      cases second with
      | @base secondQueueContext secondDecoded secondQueue =>
          have queuesEqual : firstQueueContext.plug omega =
              secondQueueContext.plug omega := by
            have extracted := congrArg
              (fun term => term.subterm? BasePath.wordAddress) sameSource
            simp only [MutableBase.mutableBase_queue_subterm] at extracted
            exact Option.some.inj extracted
          obtain ⟨queueContextsEqual, decodedEqual⟩ :=
            QueueContext.plug_omega_context_deterministic firstQueue secondQueue
              queuesEqual
          subst secondQueueContext
          exact ⟨rfl, decodedEqual⟩
      | @«local» snapshot currentContext segmentContext routeContext currentWord
          appended status route label snapshotInv current segment selectedRoute =>
          let accumulator := segmentContext.plug (currentContext.plug omega)
          let dispatcher := routeContext.plug
            (ReachableAudit.actionResponse program label snapshot accumulator)
          have impossible := MutableBase.base_ne_shell
            (compileActions program tree) bits continuation
            (firstQueueContext.plug omega)
            (baseBeta
              (environmentCode (compileActions program tree) bits) continuation)
            (ReachableAudit.haltField status snapshot) dispatcher snapshot snapshot
          exact (impossible (by
            simpa [MutableBase.mutableBase, accumulator, dispatcher] using!
              sameSource)).elim
  | @«local» firstSnapshot firstCurrentContext firstSegmentContext
      firstRouteContext firstCurrentWord firstAppended firstStatus firstRoute
      firstLabel firstSnapshotInv firstCurrent firstSegment firstSelected ih =>
      cases second with
      | @base secondQueueContext secondDecoded secondQueue =>
          let accumulator :=
            firstSegmentContext.plug (firstCurrentContext.plug omega)
          let dispatcher := firstRouteContext.plug
            (ReachableAudit.actionResponse program firstLabel firstSnapshot
              accumulator)
          have impossible := MutableBase.base_ne_shell
            (compileActions program tree) bits continuation
            (secondQueueContext.plug omega)
            (baseBeta
              (environmentCode (compileActions program tree) bits) continuation)
            (ReachableAudit.haltField firstStatus firstSnapshot) dispatcher
            firstSnapshot firstSnapshot
          exact (impossible (by
            simpa [MutableBase.mutableBase, accumulator, dispatcher] using!
              sameSource.symm)).elim
      | @«local» secondSnapshot secondCurrentContext secondSegmentContext
          secondRouteContext secondCurrentWord secondAppended secondStatus
          secondRoute secondLabel secondSnapshotInv secondCurrent secondSegment
          secondSelected =>
          let firstAccumulator :=
            firstSegmentContext.plug (firstCurrentContext.plug omega)
          let secondAccumulator :=
            secondSegmentContext.plug (secondCurrentContext.plug omega)
          let firstDispatcher := firstRouteContext.plug
            (ReachableAudit.actionResponse program firstLabel firstSnapshot
              firstAccumulator)
          let secondDispatcher := secondRouteContext.plug
            (ReachableAudit.actionResponse program secondLabel secondSnapshot
              secondAccumulator)
          have snapshotsEqual : firstSnapshot = secondSnapshot := by
            have extracted := congrArg
              (fun term => term.subterm? [.right]) sameSource
            simp only [localContext_plug, Carrier.activeShell, Carrier.shell,
              Term.subterm?] at extracted
            injection extracted with fieldsEqual
            injection fieldsEqual
          have dispatchersEqual : firstDispatcher = secondDispatcher := by
            have extracted := congrArg
              (fun term => term.subterm? [.left, .left, .right]) sameSource
            simp only [localContext_plug, Carrier.activeShell,
              Carrier.shell_dispatcher_subterm] at extracted
            exact Option.some.inj extracted
          have haltFieldsEqual :
              ReachableAudit.haltField firstStatus firstSnapshot =
                ReachableAudit.haltField secondStatus secondSnapshot := by
            have extracted := congrArg
              (fun term => term.subterm? [.left, .left, .left]) sameSource
            simp only [localContext_plug, Carrier.activeShell, Carrier.shell,
              Term.subterm?] at extracted
            exact Option.some.inj extracted
          have firstDispatch :=
            (firstSelected.snapshotDispatchAt firstAccumulator)
          have secondDispatch :=
            (secondSelected.snapshotDispatchAt secondAccumulator)
          have firstParse : DispatchParser.parse program tree firstDispatcher =
              some ⟨firstRoute, firstLabel, firstAccumulator⟩ :=
            DispatchParser.parse_complete firstDispatch.toDispatchShape
          have secondParse : DispatchParser.parse program tree secondDispatcher =
              some ⟨secondRoute, secondLabel, secondAccumulator⟩ :=
            DispatchParser.parse_complete secondDispatch.toDispatchShape
          have parsedEqual :
              (DispatchParser.ParsedDispatch.mk firstRoute firstLabel
                firstAccumulator) =
              DispatchParser.ParsedDispatch.mk secondRoute secondLabel
                secondAccumulator := by
            apply Option.some.inj
            exact firstParse.symm.trans (dispatchersEqual ▸ secondParse)
          have routesEqual : firstRoute = secondRoute :=
            congrArg DispatchParser.ParsedDispatch.route parsedEqual
          have labelsEqual : firstLabel = secondLabel :=
            congrArg DispatchParser.ParsedDispatch.label parsedEqual
          have accumulatorsEqual : firstAccumulator = secondAccumulator :=
            congrArg DispatchParser.ParsedDispatch.accumulator parsedEqual
          obtain ⟨rootsEqual, segmentContextsEqual, appendedEqual⟩ :=
            QueueContext.plug_root_context_deterministic hadmissible
              firstCurrent.holds.toRoot secondCurrent.holds.toRoot firstSegment
              secondSegment accumulatorsEqual
          obtain ⟨currentContextsEqual, currentWordsEqual⟩ :=
            ih secondCurrent rootsEqual
          subst secondSnapshot
          have statusesEqual : firstStatus = secondStatus := by
            cases firstStatus <;> cases secondStatus
            · rfl
            · exact (Carrier.HField.fresh_ne_marked firstSnapshot
                firstSnapshot firstSnapshot haltFieldsEqual).elim
            · exact (Carrier.HField.fresh_ne_marked firstSnapshot
                firstSnapshot firstSnapshot haltFieldsEqual.symm).elim
            · rfl
          subst secondStatus
          subst secondRoute
          subst secondLabel
          have routeContextsEqual : firstRouteContext = secondRouteContext :=
            firstSelected.deterministic secondSelected
          subst secondRouteContext
          subst secondSegmentContext
          subst secondCurrentContext
          exact ⟨rfl, by simp [currentWordsEqual, appendedEqual]⟩

/-- Same-source specialization fixing both context and word. -/
theorem deterministic
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term}
    (hadmissible : Carrier.Admissible continuation)
    {firstDecoded secondDecoded : List Bool}
    {firstContext secondContext : Context}
    (first : Descent program tree bits continuation source firstDecoded
      firstContext)
    (second : Descent program tree bits continuation source secondDecoded
      secondContext) :
    firstContext = secondContext ∧ firstDecoded = secondDecoded :=
  deterministic_of_eq hadmissible first second rfl

/--
Equal exact Local sources expose equal traversal-relevant components.  This
packages the parser and admissible root-separation argument used by global
front uniqueness; proof fields such as `snapshotInv` are intentionally absent
from the conclusion.
-/
theorem local_components_deterministic
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation : Term}
    (hadmissible : Carrier.Admissible continuation)
    {firstSnapshot secondSnapshot : Term}
    {firstCurrentContext secondCurrentContext : Context}
    {firstSegmentContext secondSegmentContext : Context}
    {firstRouteContext secondRouteContext : Context}
    {firstCurrentWord secondCurrentWord : List Bool}
    {firstAppended secondAppended : List Bool}
    {firstStatus secondStatus : ReachableAudit.HaltState}
    {firstRoute secondRoute : Dispatcher.Route}
    {firstLabel secondLabel : ActionLabel program}
    (_firstSnapshotInv : ReachableAudit.Holds program tree bits continuation
      firstSnapshot)
    (firstCurrent : Descent program tree bits continuation
      (firstCurrentContext.plug omega) firstCurrentWord firstCurrentContext)
    (firstSegment : QueueContext firstSegmentContext firstAppended)
    (firstSelected : RouteContext (selectedAction program) firstSnapshot tree
      firstRoute firstLabel firstRouteContext)
    (_secondSnapshotInv : ReachableAudit.Holds program tree bits continuation
      secondSnapshot)
    (secondCurrent : Descent program tree bits continuation
      (secondCurrentContext.plug omega) secondCurrentWord secondCurrentContext)
    (secondSegment : QueueContext secondSegmentContext secondAppended)
    (secondSelected : RouteContext (selectedAction program) secondSnapshot tree
      secondRoute secondLabel secondRouteContext)
    (sameSource :
      (localContext program bits continuation firstSnapshot firstStatus
        firstLabel firstRouteContext firstSegmentContext firstCurrentContext).plug
          omega =
      (localContext program bits continuation secondSnapshot secondStatus
        secondLabel secondRouteContext secondSegmentContext
          secondCurrentContext).plug omega) :
    firstSnapshot = secondSnapshot ∧
      firstStatus = secondStatus ∧
      firstLabel = secondLabel ∧
      firstRouteContext = secondRouteContext ∧
      firstSegmentContext = secondSegmentContext ∧
      firstCurrentContext.plug omega = secondCurrentContext.plug omega ∧
      firstAppended = secondAppended := by
  let firstAccumulator :=
    firstSegmentContext.plug (firstCurrentContext.plug omega)
  let secondAccumulator :=
    secondSegmentContext.plug (secondCurrentContext.plug omega)
  let firstDispatcher := firstRouteContext.plug
    (ReachableAudit.actionResponse program firstLabel firstSnapshot
      firstAccumulator)
  let secondDispatcher := secondRouteContext.plug
    (ReachableAudit.actionResponse program secondLabel secondSnapshot
      secondAccumulator)
  have snapshotsEqual : firstSnapshot = secondSnapshot := by
    have extracted := congrArg (fun term => term.subterm? [.right]) sameSource
    simp only [localContext_plug, Carrier.activeShell, Carrier.shell,
      Term.subterm?] at extracted
    injection extracted with fieldsEqual
    injection fieldsEqual
  have dispatchersEqual : firstDispatcher = secondDispatcher := by
    have extracted := congrArg
      (fun term => term.subterm? [.left, .left, .right]) sameSource
    simp only [localContext_plug, Carrier.activeShell,
      Carrier.shell_dispatcher_subterm] at extracted
    exact Option.some.inj extracted
  have haltFieldsEqual :
      ReachableAudit.haltField firstStatus firstSnapshot =
        ReachableAudit.haltField secondStatus secondSnapshot := by
    have extracted := congrArg
      (fun term => term.subterm? [.left, .left, .left]) sameSource
    simp only [localContext_plug, Carrier.activeShell, Carrier.shell,
      Term.subterm?] at extracted
    exact Option.some.inj extracted
  have firstDispatch := firstSelected.snapshotDispatchAt firstAccumulator
  have secondDispatch := secondSelected.snapshotDispatchAt secondAccumulator
  have firstParse : DispatchParser.parse program tree firstDispatcher =
      some ⟨firstRoute, firstLabel, firstAccumulator⟩ :=
    DispatchParser.parse_complete firstDispatch.toDispatchShape
  have secondParse : DispatchParser.parse program tree secondDispatcher =
      some ⟨secondRoute, secondLabel, secondAccumulator⟩ :=
    DispatchParser.parse_complete secondDispatch.toDispatchShape
  have parsedEqual :
      (DispatchParser.ParsedDispatch.mk firstRoute firstLabel firstAccumulator) =
        DispatchParser.ParsedDispatch.mk secondRoute secondLabel
          secondAccumulator := by
    apply Option.some.inj
    exact firstParse.symm.trans (dispatchersEqual ▸ secondParse)
  have routesEqual : firstRoute = secondRoute :=
    congrArg DispatchParser.ParsedDispatch.route parsedEqual
  have labelsEqual : firstLabel = secondLabel :=
    congrArg DispatchParser.ParsedDispatch.label parsedEqual
  have accumulatorsEqual : firstAccumulator = secondAccumulator :=
    congrArg DispatchParser.ParsedDispatch.accumulator parsedEqual
  obtain ⟨rootsEqual, segmentContextsEqual, appendedEqual⟩ :=
    QueueContext.plug_root_context_deterministic hadmissible
      firstCurrent.holds.toRoot secondCurrent.holds.toRoot firstSegment
      secondSegment accumulatorsEqual
  subst secondSnapshot
  have statusesEqual : firstStatus = secondStatus := by
    cases firstStatus <;> cases secondStatus
    · rfl
    · exact (Carrier.HField.fresh_ne_marked firstSnapshot firstSnapshot
        firstSnapshot haltFieldsEqual).elim
    · exact (Carrier.HField.fresh_ne_marked firstSnapshot firstSnapshot
        firstSnapshot haltFieldsEqual.symm).elim
    · rfl
  subst secondStatus
  subst secondRoute
  subst secondLabel
  have routeContextsEqual : firstRouteContext = secondRouteContext :=
    firstSelected.deterministic secondSelected
  exact ⟨rfl, rfl, rfl, routeContextsEqual, segmentContextsEqual, rootsEqual,
    appendedEqual⟩

end Descent

namespace SelectedFront

/--
Global construction-selected fronts are unique across independently assembled
proofs.  In particular the literal outer context, hence its address, is fixed
by the admissible source term.
-/
theorem deterministic_of_eq
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation : Term}
    (hadmissible : Carrier.Admissible continuation)
    {firstSource secondSource : Term}
    {firstBit secondBit : Bool}
    {firstSuffix secondSuffix : List Bool}
    {firstOuter secondOuter : Context}
    (first : SelectedFront program tree bits continuation firstSource firstBit
      firstSuffix firstOuter)
    (second : SelectedFront program tree bits continuation secondSource secondBit
      secondSuffix secondOuter)
    (sameSource : firstSource = secondSource) :
    firstBit = secondBit ∧ firstSuffix = secondSuffix ∧
      firstOuter = secondOuter := by
  induction first generalizing secondSource secondBit secondSuffix secondOuter with
  | @base firstQueueContext firstCellOuter firstBit firstSuffix firstCellAddress
      firstQueue firstSelected =>
      cases second with
      | @base secondQueueContext secondCellOuter secondBit secondSuffix
          secondCellAddress secondQueue secondSelected =>
          have queuesEqual : firstQueueContext.plug omega =
              secondQueueContext.plug omega := by
            have extracted := congrArg
              (fun term => term.subterm? BasePath.wordAddress) sameSource
            simp only [MutableBase.mutableBase_queue_subterm] at extracted
            exact Option.some.inj extracted
          obtain ⟨queueContextsEqual, decodedEqual⟩ :=
            QueueContext.plug_omega_context_deterministic firstQueue secondQueue
              queuesEqual
          subst secondQueueContext
          obtain ⟨bitsEqual, suffixesEqual, cellOutersEqual, addressesEqual⟩ :=
            firstSelected.deterministic secondSelected
          subst secondBit
          subst secondSuffix
          subst secondCellOuter
          exact ⟨rfl, rfl, rfl⟩
      | @inside snapshot currentContext segmentContext routeContext currentOuter
          bit currentSuffix appended status route label snapshotInv current
          segment selectedRoute inner =>
          let accumulator := segmentContext.plug (currentContext.plug omega)
          let dispatcher := routeContext.plug
            (ReachableAudit.actionResponse program label snapshot accumulator)
          have impossible := MutableBase.base_ne_shell
            (compileActions program tree) bits continuation
            (firstQueueContext.plug omega)
            (baseBeta
              (environmentCode (compileActions program tree) bits) continuation)
            (ReachableAudit.haltField status snapshot) dispatcher snapshot snapshot
          exact (impossible (by
            simpa [MutableBase.mutableBase, accumulator, dispatcher] using!
              sameSource)).elim
      | @segment snapshot currentContext segmentContext routeContext cellOuter bit
          suffix cellAddress status route label snapshotInv current queue
          selectedRoute selected =>
          let accumulator := segmentContext.plug (currentContext.plug omega)
          let dispatcher := routeContext.plug
            (ReachableAudit.actionResponse program label snapshot accumulator)
          have impossible := MutableBase.base_ne_shell
            (compileActions program tree) bits continuation
            (firstQueueContext.plug omega)
            (baseBeta
              (environmentCode (compileActions program tree) bits) continuation)
            (ReachableAudit.haltField status snapshot) dispatcher snapshot snapshot
          exact (impossible (by
            simpa [MutableBase.mutableBase, accumulator, dispatcher] using!
              sameSource)).elim
  | @inside firstSnapshot firstCurrentContext firstSegmentContext
      firstRouteContext firstCurrentOuter firstBit firstCurrentSuffix
      firstAppended firstStatus firstRoute firstLabel firstSnapshotInv
      firstCurrent firstSegment firstSelected firstInner ih =>
      cases second with
      | @base secondQueueContext secondCellOuter secondBit secondSuffix
          secondCellAddress secondQueue secondSelected =>
          let accumulator :=
            firstSegmentContext.plug (firstCurrentContext.plug omega)
          let dispatcher := firstRouteContext.plug
            (ReachableAudit.actionResponse program firstLabel firstSnapshot
              accumulator)
          have impossible := MutableBase.base_ne_shell
            (compileActions program tree) bits continuation
            (secondQueueContext.plug omega)
            (baseBeta
              (environmentCode (compileActions program tree) bits) continuation)
            (ReachableAudit.haltField firstStatus firstSnapshot) dispatcher
            firstSnapshot firstSnapshot
          exact (impossible (by
            simpa [MutableBase.mutableBase, accumulator, dispatcher] using!
              sameSource.symm)).elim
      | @inside secondSnapshot secondCurrentContext secondSegmentContext
          secondRouteContext secondCurrentOuter secondBit secondCurrentSuffix
          secondAppended secondStatus secondRoute secondLabel secondSnapshotInv
          secondCurrent secondSegment secondSelected secondInner =>
          obtain ⟨snapshotsEqual, statusesEqual, labelsEqual,
            routeContextsEqual, segmentContextsEqual, rootsEqual,
            appendedEqual⟩ :=
            Descent.local_components_deterministic hadmissible firstSnapshotInv
              firstCurrent firstSegment firstSelected secondSnapshotInv
              secondCurrent secondSegment secondSelected sameSource
          obtain ⟨bitsEqual, currentSuffixesEqual, currentOutersEqual⟩ :=
            ih secondInner rootsEqual
          subst secondSnapshot
          subst secondStatus
          subst secondLabel
          subst secondRouteContext
          subst secondSegmentContext
          subst secondBit
          subst secondCurrentSuffix
          subst secondCurrentOuter
          subst secondAppended
          exact ⟨rfl, rfl, rfl⟩
      | @segment secondSnapshot secondCurrentContext secondSegmentContext
          secondRouteContext secondCellOuter secondBit secondSuffix
          secondCellAddress secondStatus secondRoute secondLabel secondSnapshotInv
          secondCurrent secondQueue secondSelected secondSelection =>
          obtain ⟨snapshotsEqual, statusesEqual, labelsEqual,
            routeContextsEqual, segmentContextsEqual, rootsEqual,
            appendedEqual⟩ :=
            Descent.local_components_deterministic hadmissible firstSnapshotInv
              firstCurrent firstSegment firstSelected secondSnapshotInv
              secondCurrent secondQueue secondSelected sameSource
          have impossible : firstBit :: firstCurrentSuffix = ([] : List Bool) :=
            firstCurrent.decoded_deterministic hadmissible
              (rootsEqual ▸ secondCurrent)
          cases impossible
  | @segment firstSnapshot firstCurrentContext firstSegmentContext
      firstRouteContext firstCellOuter firstBit firstSuffix firstCellAddress
      firstStatus firstRoute firstLabel firstSnapshotInv firstCurrent firstQueue
      firstSelected firstSelection =>
      cases second with
      | @base secondQueueContext secondCellOuter secondBit secondSuffix
          secondCellAddress secondQueue secondSelected =>
          let accumulator :=
            firstSegmentContext.plug (firstCurrentContext.plug omega)
          let dispatcher := firstRouteContext.plug
            (ReachableAudit.actionResponse program firstLabel firstSnapshot
              accumulator)
          have impossible := MutableBase.base_ne_shell
            (compileActions program tree) bits continuation
            (secondQueueContext.plug omega)
            (baseBeta
              (environmentCode (compileActions program tree) bits) continuation)
            (ReachableAudit.haltField firstStatus firstSnapshot) dispatcher
            firstSnapshot firstSnapshot
          exact (impossible (by
            simpa [MutableBase.mutableBase, accumulator, dispatcher] using!
              sameSource.symm)).elim
      | @inside secondSnapshot secondCurrentContext secondSegmentContext
          secondRouteContext secondCurrentOuter secondBit secondCurrentSuffix
          secondAppended secondStatus secondRoute secondLabel secondSnapshotInv
          secondCurrent secondSegment secondSelected secondInner =>
          obtain ⟨snapshotsEqual, statusesEqual, labelsEqual,
            routeContextsEqual, segmentContextsEqual, rootsEqual,
            appendedEqual⟩ :=
            Descent.local_components_deterministic hadmissible firstSnapshotInv
              firstCurrent firstQueue firstSelected secondSnapshotInv
              secondCurrent secondSegment secondSelected sameSource
          have impossible : ([] : List Bool) =
              secondBit :: secondCurrentSuffix :=
            firstCurrent.decoded_deterministic hadmissible
              (rootsEqual ▸ secondCurrent)
          cases impossible
      | @segment secondSnapshot secondCurrentContext secondSegmentContext
          secondRouteContext secondCellOuter secondBit secondSuffix
          secondCellAddress secondStatus secondRoute secondLabel secondSnapshotInv
          secondCurrent secondQueue secondSelected secondSelection =>
          obtain ⟨snapshotsEqual, statusesEqual, labelsEqual,
            routeContextsEqual, segmentContextsEqual, rootsEqual,
            appendedEqual⟩ :=
            Descent.local_components_deterministic hadmissible firstSnapshotInv
              firstCurrent firstQueue firstSelected secondSnapshotInv
              secondCurrent secondQueue secondSelected sameSource
          subst secondSnapshot
          subst secondStatus
          subst secondLabel
          subst secondRouteContext
          subst secondSegmentContext
          obtain ⟨bitsEqual, suffixesEqual, cellOutersEqual, addressesEqual⟩ :=
            firstSelection.deterministic secondSelection
          subst secondBit
          subst secondSuffix
          subst secondCellOuter
          exact ⟨rfl, rfl, rfl⟩

/-- Same-source specialization of global selected-front uniqueness. -/
theorem deterministic
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term}
    (hadmissible : Carrier.Admissible continuation)
    {firstBit secondBit : Bool}
    {firstSuffix secondSuffix : List Bool}
    {firstOuter secondOuter : Context}
    (first : SelectedFront program tree bits continuation source firstBit
      firstSuffix firstOuter)
    (second : SelectedFront program tree bits continuation source secondBit
      secondSuffix secondOuter) :
    firstBit = secondBit ∧ firstSuffix = secondSuffix ∧
      firstOuter = secondOuter :=
  deterministic_of_eq hadmissible first second rfl

/-- The selected occurrence address is independent of every proof witness. -/
theorem address_unique
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term}
    (hadmissible : Carrier.Admissible continuation)
    {firstBit secondBit : Bool}
    {firstSuffix secondSuffix : List Bool}
    {firstOuter secondOuter : Context}
    (first : SelectedFront program tree bits continuation source firstBit
      firstSuffix firstOuter)
    (second : SelectedFront program tree bits continuation source secondBit
      secondSuffix secondOuter) :
    contextAddress firstOuter = contextAddress secondOuter := by
  have outerEqual := (SelectedFront.deterministic hadmissible first second).2.2
  exact congrArg contextAddress outerEqual

/--
Delete exactly the construction-selected occurrence.  This theorem is the
bridge between the proof-independent `SelectedFront` relation and the
one-contraction mutation-closed endpoint used by the older scan interface.
-/
theorem delete
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term}
    {bit : Bool} {suffix : List Bool} {outerContext : Context}
    (h : SelectedFront program tree bits continuation source bit suffix
      outerContext) :
    ∃ target targetContext predecessor,
      Descent program tree bits continuation target suffix targetContext ∧
      FrontCertificate source target bit suffix predecessor outerContext := by
  induction h with
  | @base queueContext cellOuter bit suffix cellAddress queue selected =>
      obtain ⟨targetQueueContext, predecessor, targetQueue, sourceEq, targetEq⟩ :=
        selected.deleteContext omega
      let sourceQueue := queueContext.plug omega
      let targetQueueTerm := targetQueueContext.plug omega
      let target := MutableBase.mutableBase (compileActions program tree) bits
        continuation targetQueueTerm
      let targetContext :=
        (MutableBase.queueContext (compileActions program tree) bits continuation
          (baseBeta
            (environmentCode (compileActions program tree) bits)
            continuation)).comp targetQueueContext
      have targetDescent : Descent program tree bits continuation target suffix
          targetContext :=
        Descent.base targetQueue
      have cellCertificate : FrontCertificate sourceQueue targetQueueTerm bit
          suffix predecessor cellOuter :=
        ⟨AscentContext.ofCellOuter selected.outerShape, sourceEq, targetEq⟩
      have wholeCertificate : FrontCertificate
          (MutableBase.mutableBase (compileActions program tree) bits continuation
            sourceQueue)
          target bit suffix predecessor
          ((MutableBase.queueContext (compileActions program tree) bits
            continuation
            (baseBeta
              (environmentCode (compileActions program tree) bits)
              continuation)).comp cellOuter) := by
        simpa [target, targetQueueTerm, MutableBase.mutableBase] using
          cellCertificate.wrapBase (compileActions program tree) bits continuation
      exact ⟨target, targetContext, predecessor, targetDescent,
        wholeCertificate⟩
  | @inside snapshot currentContext segmentContext routeContext currentOuter bit
      currentSuffix appended status route label snapshotInv current segment
      selectedRoute inner ih =>
      obtain ⟨targetCurrent, targetCurrentContext, predecessor,
        targetCurrentDescent, currentCertificate⟩ := ih
      have targetCurrentAtHole : Descent program tree bits continuation
          (targetCurrentContext.plug omega) currentSuffix targetCurrentContext :=
        targetCurrentDescent.source_eq.symm ▸ targetCurrentDescent
      have currentCertificateAtHole : FrontCertificate
          (currentContext.plug omega) (targetCurrentContext.plug omega) bit
          currentSuffix predecessor currentOuter :=
        targetCurrentDescent.source_eq.symm ▸ currentCertificate
      have segmentCertificate := currentCertificateAtHole.wrapQueue segment
      have actionCertificate := segmentCertificate.wrapAction program label
        snapshot
      have routeCertificate :=
        FrontCertificate.wrapRoute selectedRoute actionCertificate
      have wholeCertificate := routeCertificate.wrapLocal bits continuation
        snapshot status
      let targetContext := localContext program bits continuation snapshot status
        label routeContext segmentContext targetCurrentContext
      have targetDescent : Descent program tree bits continuation
          (targetContext.plug omega) (currentSuffix ++ appended) targetContext :=
        Descent.local snapshotInv targetCurrentAtHole segment selectedRoute
      refine ⟨targetContext.plug omega, targetContext, predecessor,
        targetDescent, ?_⟩
      simpa [targetContext, localContext, dispatcherContext, accumulatorContext,
        Context.plug_comp] using wholeCertificate
  | @segment snapshot currentContext segmentContext routeContext cellOuter bit
      suffix cellAddress status route label snapshotInv current queue
      selectedRoute selected =>
      obtain ⟨targetSegmentContext, predecessor, targetSegment, sourceEq,
        targetEq⟩ := selected.deleteContext (currentContext.plug omega)
      let sourceAccumulator := segmentContext.plug (currentContext.plug omega)
      let targetAccumulator :=
        targetSegmentContext.plug (currentContext.plug omega)
      have cellCertificate : FrontCertificate sourceAccumulator targetAccumulator
          bit suffix predecessor cellOuter :=
        ⟨AscentContext.ofCellOuter selected.outerShape, sourceEq, targetEq⟩
      have actionCertificate := cellCertificate.wrapAction program label snapshot
      have routeCertificate :=
        FrontCertificate.wrapRoute selectedRoute actionCertificate
      have wholeCertificate := routeCertificate.wrapLocal bits continuation
        snapshot status
      let targetContext := localContext program bits continuation snapshot status
        label routeContext targetSegmentContext currentContext
      have targetDescent : Descent program tree bits continuation
          (targetContext.plug omega) suffix targetContext := by
        simpa [targetContext] using
          Descent.local (status := status) snapshotInv current targetSegment
            selectedRoute
      refine ⟨targetContext.plug omega, targetContext, predecessor,
        targetDescent, ?_⟩
      simpa [sourceAccumulator, targetAccumulator, targetContext, localContext,
        dispatcherContext, accumulatorContext, Context.plug_comp] using
          wholeCertificate

end SelectedFront

namespace Descent

/--
Every reachable-audit carrier exposes a finite exact canonical descent and a
front-to-rear logical word.  No audit or history occurrence is selected by
the constructed context.
-/
theorem ofHolds
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term}
    (h : ReachableAudit.Holds program tree bits continuation source) :
    ∃ decoded context,
      Descent program tree bits continuation source decoded context := by
  induction h with
  | @base queue decoded queueComplete =>
      obtain ⟨queueContext, queueShape, queueEq⟩ :=
        QueueContext.ofDecodes queueComplete
      refine ⟨decoded,
        (MutableBase.queueContext (compileActions program tree) bits continuation
          (baseBeta
            (environmentCode (compileActions program tree) bits)
            continuation)).comp queueContext, ?_⟩
      exact queueEq ▸ Descent.base queueShape
  | @«local» snapshot currentRoot accumulator result dispatcher status route
      label snapshotInv currentInv between layer snapshotIH currentIH =>
      obtain ⟨currentWord, currentContext, currentDescent⟩ := currentIH
      obtain ⟨segmentContext, appended, segmentShape, segmentEq⟩ :=
        QueueContext.ofQueueSegment between
      obtain ⟨routeContext, routeShape, routeEq⟩ :=
        RouteContext.ofSnapshotRoute layer.dispatch.routeShape
      let wholeContext := localContext program bits continuation snapshot status
        label routeContext segmentContext currentContext
      have currentAtHole :
          Descent program tree bits continuation (currentContext.plug omega)
            currentWord currentContext :=
        currentDescent.source_eq.symm ▸ currentDescent
      have generated :
          Descent program tree bits continuation (wholeContext.plug omega)
            (currentWord ++ appended) wholeContext := by
        exact Descent.local snapshotInv currentAtHole segmentShape routeShape
      have wholeEq : wholeContext.plug omega = result := by
        have routeEq' :
            routeContext.plug
                (Term.applyArgs (.app p accumulator)
                  (actionHistories program label snapshot)) =
              dispatcher := by
          simpa [ReachableAudit.actionResponse] using routeEq
        have shellEq : wholeContext.plug omega =
            Carrier.activeShell bits continuation
              (ReachableAudit.haltField status snapshot) dispatcher snapshot
              snapshot := by
          simp [wholeContext, localContext, dispatcherContext,
            accumulatorContext, Context.plug_comp,
            currentDescent.source_eq, segmentEq, routeEq',
            ReachableAudit.actionResponse]
        exact shellEq.trans layer.result_eq.symm
      exact ⟨currentWord ++ appended, wholeContext, wholeEq ▸ generated⟩

/--
Structural front selection with the empty-inner side condition retained.
This is the proof-relevant companion to `scan`; unlike a bare existential
`FrontCertificate`, its result is suitable for cross-proof uniqueness.
-/
theorem select
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term}
    {decoded : List Bool} {context : Context}
    (h : Descent program tree bits continuation source decoded context) :
    decoded = [] ∨
      ∃ bit suffix outerContext,
        decoded = bit :: suffix ∧
        SelectedFront program tree bits continuation source bit suffix
          outerContext := by
  induction h with
  | @base queueContext decoded queue =>
      cases decoded with
      | nil => exact Or.inl rfl
      | cons bit suffix =>
          obtain ⟨cellOuter, cellAddress, selected⟩ :=
            QueueSelection.ofQueueContext queue
          exact Or.inr ⟨bit, suffix, _, rfl, .base queue selected⟩
  | @«local» snapshot currentContext segmentContext routeContext currentWord
      appended status route label snapshotInv current segment selectedRoute ih =>
      rcases ih with currentEmpty | currentSelected
      · subst currentWord
        cases appended with
        | nil => exact Or.inl rfl
        | cons bit suffix =>
            obtain ⟨cellOuter, cellAddress, selected⟩ :=
              QueueSelection.ofQueueContext segment
            exact Or.inr ⟨bit, suffix, _, rfl,
              .segment snapshotInv current segment selectedRoute selected⟩
      · obtain ⟨bit, currentSuffix, currentOuter, currentWordEq,
          currentSelection⟩ := currentSelected
        subst currentWord
        exact Or.inr ⟨bit, currentSuffix ++ appended, _, by simp,
          .inside snapshotInv current segment selectedRoute currentSelection⟩

/-- Specialized construction of a selected front for a nonempty descent. -/
theorem selectedFront
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term}
    {bit : Bool} {suffix : List Bool} {context : Context}
    (h : Descent program tree bits continuation source (bit :: suffix) context) :
    ∃ outerContext,
      SelectedFront program tree bits continuation source bit suffix
        outerContext := by
  rcases h.select with impossible | found
  · cases impossible
  · obtain ⟨foundBit, foundSuffix, outerContext, wordEq, selected⟩ := found
    injection wordEq with bitEq suffixEq
    subst foundBit
    subst foundSuffix
    exact ⟨outerContext, selected⟩

/--
Admissible canonical-front theorem with the uniqueness statement tied to the
same occurrence that is contracted.  This is the declarative Lemma-4.1 slice:
the word, front bit/suffix, literal occurrence context, and occurrence address
are independent of all `Descent`/audit proofs.
-/
theorem deleteCanonical
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term}
    (hadmissible : Carrier.Admissible continuation)
    {bit : Bool} {suffix : List Bool} {context : Context}
    (h : Descent program tree bits continuation source (bit :: suffix) context) :
    ∃ target targetContext predecessor outerContext,
      SelectedFront program tree bits continuation source bit suffix
        outerContext ∧
      (∀ {otherBit : Bool} {otherSuffix : List Bool}
          {otherOuter : Context},
        SelectedFront program tree bits continuation source otherBit otherSuffix
          otherOuter →
        otherBit = bit ∧ otherSuffix = suffix ∧
          contextAddress otherOuter = contextAddress outerContext) ∧
      Descent program tree bits continuation target suffix targetContext ∧
      ReachableAudit.Holds program tree bits continuation target ∧
      ∃ certificate :
          FrontCertificate source target bit suffix predecessor outerContext,
        StepsN 1 source target ∧
        source.subterm? (contextAddress outerContext) =
          some (.app (PureSFormal.PureS.live bit) predecessor) ∧
        source.replace? (contextAddress outerContext)
            (Carrier.tombstone bit predecessor predecessor) = some target ∧
        (certificate.outer.laterLiveFlag = true ↔ suffix ≠ []) := by
  obtain ⟨outerContext, selected⟩ := h.selectedFront
  obtain ⟨target, targetContext, predecessor, targetDescent, certificate⟩ :=
    SelectedFront.delete selected
  refine ⟨target, targetContext, predecessor, outerContext, selected, ?_,
    targetDescent, targetDescent.holds, certificate, certificate.steps,
    certificate.selected_subterm, certificate.endpoint_replace,
    certificate.laterLiveFlag_eq_true_iff⟩
  intro otherBit otherSuffix otherOuter other
  obtain ⟨bitsEqual, suffixesEqual, outersEqual⟩ :=
    SelectedFront.deterministic hadmissible other selected
  exact ⟨bitsEqual, suffixesEqual,
    congrArg contextAddress outersEqual⟩

/-!
The following structural scan is the declarative counterpart of descending to
`omega` and ascending to the first live constructor.  Recursion is on the
finite `Descent` certificate, then on its finite queue contexts; it is not a
cursor implementation.
-/

/--
An exact descent is either logically empty or supplies its unique
construction-selected first live occurrence, one-step endpoint, and a new
exact descent decoding the suffix.
-/
theorem scan
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term}
    {decoded : List Bool} {context : Context}
    (h : Descent program tree bits continuation source decoded context) :
    decoded = [] ∨
      ∃ bit suffix target targetContext predecessor outerContext,
        decoded = bit :: suffix ∧
        Descent program tree bits continuation target suffix targetContext ∧
        FrontCertificate source target bit suffix predecessor outerContext := by
  induction h with
  | @base queueContext decoded queue =>
      cases decoded with
      | nil => exact Or.inl rfl
      | cons bit suffix =>
          obtain ⟨targetQueueContext, predecessor, cellOuter, address,
            targetQueue, cellOuterShape, sourceEq, targetEq, queueSteps⟩ :=
            QueueContext.deleteFront queue omega
          let sourceQueue := queueContext.plug omega
          let targetQueueTerm := targetQueueContext.plug omega
          have cellCertificate : FrontCertificate sourceQueue targetQueueTerm
              bit suffix predecessor cellOuter := by
            exact ⟨AscentContext.ofCellOuter cellOuterShape, sourceEq, targetEq⟩
          let target : Term :=
            MutableBase.mutableBase (compileActions program tree) bits
              continuation targetQueueTerm
          let targetContext :=
            (MutableBase.queueContext (compileActions program tree) bits
              continuation
              (baseBeta
                (environmentCode (compileActions program tree) bits)
                continuation)).comp targetQueueContext
          have targetDescent :
              Descent program tree bits continuation target suffix
                targetContext := by
            exact Descent.base targetQueue
          have wholeCertificate : FrontCertificate
              (MutableBase.mutableBase (compileActions program tree) bits
                continuation sourceQueue)
              target bit suffix predecessor
              ((MutableBase.queueContext (compileActions program tree) bits
                continuation
                (baseBeta
                  (environmentCode (compileActions program tree) bits)
                  continuation)).comp cellOuter) := by
            simpa [sourceQueue, targetQueueTerm, target,
              MutableBase.mutableBase] using
              cellCertificate.wrapBase (compileActions program tree) bits
                continuation
          exact Or.inr ⟨bit, suffix, target, targetContext, predecessor,
            _, rfl, targetDescent, wholeCertificate⟩
  | @«local» snapshot currentContext segmentContext routeContext currentWord
      appended status route label snapshotInv current segment selectedRoute ih =>
      rcases ih with currentEmpty | currentNonempty
      · subst currentWord
        cases appended with
        | nil => exact Or.inl rfl
        | cons bit suffix =>
            obtain ⟨targetSegmentContext, predecessor, cellOuter, address,
              targetSegment, cellOuterShape, sourceEq, targetEq, segmentSteps⟩ :=
              QueueContext.deleteFront segment (currentContext.plug omega)
            let sourceAccumulator := segmentContext.plug
              (currentContext.plug omega)
            let targetAccumulator := targetSegmentContext.plug
              (currentContext.plug omega)
            have segmentCertificate : FrontCertificate sourceAccumulator
                targetAccumulator bit suffix predecessor cellOuter := by
              exact ⟨AscentContext.ofCellOuter cellOuterShape, sourceEq, targetEq⟩
            have actionCertificate := segmentCertificate.wrapAction program label
              snapshot
            have routeCertificate :=
              FrontCertificate.wrapRoute selectedRoute actionCertificate
            have wholeCertificate := routeCertificate.wrapLocal bits continuation
              snapshot status
            let wholeOuterContext :=
              (localDispatcherContext bits continuation
                (ReachableAudit.haltField status snapshot) snapshot snapshot).comp
                (routeContext.comp
                  ((actionContext (actionHistories program label snapshot)).comp
                    cellOuter))
            let targetContext := localContext program bits continuation snapshot
              status label routeContext targetSegmentContext currentContext
            have targetDescent : Descent program tree bits continuation
                (targetContext.plug omega) suffix targetContext := by
              simpa [targetContext] using
                Descent.local (status := status) snapshotInv current
                  targetSegment selectedRoute
            refine Or.inr ⟨bit, suffix, targetContext.plug omega, targetContext,
              predecessor, wholeOuterContext, rfl, targetDescent, ?_⟩
            simpa [sourceAccumulator, targetAccumulator, targetContext,
              wholeOuterContext,
              localContext, dispatcherContext, accumulatorContext,
              Context.plug_comp] using wholeCertificate
      · obtain ⟨frontBit, currentSuffix, targetCurrent, targetCurrentContext,
          predecessor, currentOuter, hcurrentWord, targetCurrentDescent,
          currentCertificate⟩ := currentNonempty
        have targetCurrentAtHole :
            Descent program tree bits continuation
              (targetCurrentContext.plug omega) currentSuffix
              targetCurrentContext :=
          targetCurrentDescent.source_eq.symm ▸ targetCurrentDescent
        have currentCertificateAtHole : FrontCertificate
            (currentContext.plug omega) (targetCurrentContext.plug omega)
            frontBit currentSuffix predecessor currentOuter :=
          targetCurrentDescent.source_eq.symm ▸ currentCertificate
        have segmentCertificate := currentCertificateAtHole.wrapQueue segment
        have actionCertificate := segmentCertificate.wrapAction program label
          snapshot
        have routeCertificate :=
          FrontCertificate.wrapRoute selectedRoute actionCertificate
        have wholeCertificate := routeCertificate.wrapLocal bits continuation
          snapshot status
        let wholeOuterContext :=
          (localDispatcherContext bits continuation
            (ReachableAudit.haltField status snapshot) snapshot snapshot).comp
            (routeContext.comp
              ((actionContext (actionHistories program label snapshot)).comp
                (segmentContext.comp currentOuter)))
        let targetContext := localContext program bits continuation snapshot status
          label routeContext segmentContext targetCurrentContext
        have targetDescent : Descent program tree bits continuation
            (targetContext.plug omega) (currentSuffix ++ appended)
            targetContext := by
          exact Descent.local snapshotInv targetCurrentAtHole segment selectedRoute
        refine Or.inr ⟨frontBit, currentSuffix ++ appended,
          targetContext.plug omega, targetContext, predecessor,
          wholeOuterContext, ?_,
          targetDescent, ?_⟩
        · simp [hcurrentWord, List.append_assoc]
        · simpa [targetContext, wholeOuterContext, localContext, dispatcherContext,
            accumulatorContext, Context.plug_comp] using wholeCertificate

/--
Canonical deletion specialized to a nonempty decoded carrier.  It exposes the
literal occurrence context, performs exactly one C4 contraction, preserves
the exact traversal and `Holds`, decodes precisely the supplied suffix, and
returns the later-live flag theorem.
-/
theorem deleteFront
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term}
    {bit : Bool} {suffix : List Bool} {context : Context}
    (h : Descent program tree bits continuation source (bit :: suffix) context) :
    ∃ target targetContext predecessor outerContext,
      Descent program tree bits continuation target suffix targetContext ∧
      ReachableAudit.Holds program tree bits continuation target ∧
      ∃ certificate :
          FrontCertificate source target bit suffix predecessor outerContext,
        StepsN 1 source target ∧
        source.subterm? (contextAddress outerContext) =
          some (.app (PureSFormal.PureS.live bit) predecessor) ∧
        source.replace? (contextAddress outerContext)
            (Carrier.tombstone bit predecessor predecessor) = some target ∧
        (certificate.outer.laterLiveFlag = true ↔ suffix ≠ []) := by
  rcases h.scan with hempty | found
  · cases hempty
  · obtain ⟨foundBit, foundSuffix, target, targetContext, predecessor,
      outerContext, hword, targetDescent, certificate⟩ := found
    injection hword with hbit hsuffix
    subst foundBit
    subst foundSuffix
    refine ⟨target, targetContext, predecessor, outerContext, targetDescent,
      targetDescent.holds, certificate, certificate.steps,
      certificate.selected_subterm, certificate.endpoint_replace, ?_⟩
    exact certificate.laterLiveFlag_eq_true_iff

end Descent

/-! ## Public whole-carrier decoding interface -/

/-- A whole carrier decodes when it has an exact canonical descent to `omega`. -/
def Decodes
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation source : Term)
    (decoded : List Bool) : Prop :=
  ∃ context, Descent program tree bits continuation source decoded context

namespace Decodes

/-- `Holds` always supplies some exact whole-carrier decoding. -/
theorem ofHolds
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term}
    (h : ReachableAudit.Holds program tree bits continuation source) :
    ∃ decoded, Decodes program tree bits continuation source decoded := by
  obtain ⟨decoded, context, descent⟩ := Descent.ofHolds h
  exact ⟨decoded, context, descent⟩

/-- Whole-carrier decoding retains the exact reachable-audit shape invariant. -/
theorem holds
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term}
    {decoded : List Bool}
    (h : Decodes program tree bits continuation source decoded) :
    ReachableAudit.Holds program tree bits continuation source := by
  obtain ⟨context, descent⟩ := h
  exact descent.holds

/-- Cross-proof uniqueness of the logical carrier word under (10e). -/
theorem deterministic
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term}
    (hadmissible : Carrier.Admissible continuation)
    {first second : List Bool}
    (hfirst : Decodes program tree bits continuation source first)
    (hsecond : Decodes program tree bits continuation source second) :
    first = second := by
  obtain ⟨firstContext, firstDescent⟩ := hfirst
  obtain ⟨secondContext, secondDescent⟩ := hsecond
  exact firstDescent.decoded_deterministic hadmissible secondDescent

/--
Every nonempty admissible decoding has one proof-independent front occurrence.
The conclusion quantifies over fronts obtained from any other descent proof of
the same source, not merely over witnesses returned by one invocation.
-/
theorem front_unique
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term}
    (hadmissible : Carrier.Admissible continuation)
    {bit : Bool} {suffix : List Bool}
    (h : Decodes program tree bits continuation source (bit :: suffix)) :
    ∃ outerContext,
      SelectedFront program tree bits continuation source bit suffix
        outerContext ∧
      ∀ {otherBit : Bool} {otherSuffix : List Bool} {otherOuter : Context},
        SelectedFront program tree bits continuation source otherBit otherSuffix
          otherOuter →
        otherBit = bit ∧ otherSuffix = suffix ∧
          contextAddress otherOuter = contextAddress outerContext := by
  obtain ⟨context, descent⟩ := h
  obtain ⟨outerContext, selected⟩ := descent.selectedFront
  refine ⟨outerContext, selected, ?_⟩
  intro otherBit otherSuffix otherOuter other
  obtain ⟨bitsEqual, suffixesEqual, outersEqual⟩ :=
    SelectedFront.deterministic hadmissible other selected
  exact ⟨bitsEqual, suffixesEqual, congrArg contextAddress outersEqual⟩

/-- Every whole-carrier decoding has a finite strict-descent address to `omega`. -/
theorem terminates
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term}
    {decoded : List Bool}
    (h : Decodes program tree bits continuation source decoded) :
    ∃ context,
      source.subterm? (contextAddress context) = some omega ∧
      (contextAddress context).length < source.size := by
  obtain ⟨context, descent⟩ := h
  exact ⟨context, descent.omega_subterm, descent.terminates⟩

/--
Public admissible deletion theorem tied to the globally unique selected
occurrence.  It preserves the exact descent and `Holds`, performs one C4
contraction, and decodes the literal suffix.
-/
theorem deleteCanonical
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term}
    (hadmissible : Carrier.Admissible continuation)
    {bit : Bool} {suffix : List Bool}
    (h : Decodes program tree bits continuation source (bit :: suffix)) :
    ∃ target predecessor outerContext,
      Decodes program tree bits continuation target suffix ∧
      ReachableAudit.Holds program tree bits continuation target ∧
      SelectedFront program tree bits continuation source bit suffix
        outerContext ∧
      (∀ {otherBit : Bool} {otherSuffix : List Bool}
          {otherOuter : Context},
        SelectedFront program tree bits continuation source otherBit otherSuffix
          otherOuter →
        otherBit = bit ∧ otherSuffix = suffix ∧
          contextAddress otherOuter = contextAddress outerContext) ∧
      ∃ certificate :
          FrontCertificate source target bit suffix predecessor outerContext,
        StepsN 1 source target ∧
        source.subterm? (contextAddress outerContext) =
          some (.app (PureSFormal.PureS.live bit) predecessor) ∧
        source.replace? (contextAddress outerContext)
            (Carrier.tombstone bit predecessor predecessor) = some target ∧
        (certificate.outer.laterLiveFlag = true ↔ suffix ≠ []) := by
  obtain ⟨context, descent⟩ := h
  obtain ⟨target, targetContext, predecessor, outerContext, selected, unique,
    targetDescent, targetHolds, certificate, steps, subterm, replace, later⟩ :=
    descent.deleteCanonical hadmissible
  exact ⟨target, predecessor, outerContext, ⟨targetContext, targetDescent⟩,
    targetHolds, selected, unique, certificate, steps, subterm, replace, later⟩

/--
Whole-carrier form of canonical deletion.  The target decodes exactly the
suffix, remains in `Holds`, and the explicit ascent witness proves that the
later-live flag denotes an actual later live constructor.
-/
theorem deleteFront
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term}
    {bit : Bool} {suffix : List Bool}
    (h : Decodes program tree bits continuation source (bit :: suffix)) :
    ∃ target predecessor outerContext,
      Decodes program tree bits continuation target suffix ∧
      ReachableAudit.Holds program tree bits continuation target ∧
      ∃ certificate :
          FrontCertificate source target bit suffix predecessor outerContext,
        StepsN 1 source target ∧
        source.subterm? (contextAddress outerContext) =
          some (.app (PureSFormal.PureS.live bit) predecessor) ∧
        source.replace? (contextAddress outerContext)
            (Carrier.tombstone bit predecessor predecessor) = some target ∧
        (certificate.outer.laterLiveFlag = true ↔
          ContainsLive outerContext suffix) ∧
        (ContainsLive outerContext suffix ↔ suffix ≠ []) := by
  obtain ⟨context, descent⟩ := h
  obtain ⟨target, targetContext, predecessor, outerContext, targetDescent,
    targetHolds, certificate, steps, selected, replaced, later⟩ :=
    descent.deleteFront
  refine ⟨target, predecessor, outerContext, ⟨targetContext, targetDescent⟩,
    targetHolds, certificate, steps, selected, replaced, ?_, ?_⟩
  · exact certificate.laterLiveFlag_eq_true_iff_containsLive
  · exact certificate.outer.containsLive_iff_suffix_ne_nil

end Decodes

end CanonicalTraversal

end PureSFormal.PureS
