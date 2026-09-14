import PureSFormal.PureS.RootPath
import PureSFormal.PureS.PendingFrame

/-!
# Exact reachable-audit provenance

The public carrier and route grammars intentionally accept independent audit
fields.  This module records the stronger property of scheduler-produced
responses: every route and Local audit created by one response is the same
literal whole-carrier snapshot, while action histories retain their exact
creation terms.

The invariant distinguishes that frozen creation snapshot from the current
active root reached through the selected accumulator.  Reductions may be
lifted through the accumulator without changing any frozen field.
-/

namespace PureSFormal.PureS

namespace ReachableAudit

/-! ## Routes with one exact creation snapshot -/

/--
An activated route in which the leaf audit, every selected-node audit, and
every dormant-call audit are literally the same `snapshot` term.
-/
inductive SnapshotRoute {Label : Type u} (encode : Label → Term)
    (snapshot : Term) :
    Dispatcher.Tree Label → Dispatcher.Route → Label → Term → Term → Prop where
  | leaf (label : Label) (response : Term) :
      SnapshotRoute encode snapshot (.leaf label) [] label response
        (chosen snapshot response)
  | left
      {left right : Dispatcher.Tree Label}
      {route : Dispatcher.Route} {label : Label}
      {response activatedChild : Term}
      (inner : SnapshotRoute encode snapshot left route label response
        activatedChild) :
      SnapshotRoute encode snapshot (.node left right) (.left :: route) label
        response
        (RouteGrammar.selectedLeft snapshot activatedChild
          (RouteGrammar.compiledCall encode right snapshot))
  | right
      {left right : Dispatcher.Tree Label}
      {route : Dispatcher.Route} {label : Label}
      {response activatedChild : Term}
      (inner : SnapshotRoute encode snapshot right route label response
        activatedChild) :
      SnapshotRoute encode snapshot (.node left right) (.right :: route) label
        response
        (RouteGrammar.selectedRight snapshot
          (RouteGrammar.compiledCall encode left snapshot) activatedChild)

namespace SnapshotRoute

/-- Forgetting exact provenance gives the mutation-closed route grammar. -/
theorem toActivatedRoute
    {Label : Type u} {encode : Label → Term} {snapshot : Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    {response result : Term}
    (h : SnapshotRoute encode snapshot tree route label response result) :
    RouteGrammar.ActivatedRoute encode tree route label response result := by
  induction h with
  | leaf label response => exact .leaf label snapshot response
  | left inner ih => exact .left snapshot snapshot ih
  | right inner ih => exact .right snapshot snapshot ih

/-- Exact provenance still determines a genuine dispatcher route. -/
theorem hasRoute
    {Label : Type u} {encode : Label → Term} {snapshot : Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    {response result : Term}
    (h : SnapshotRoute encode snapshot tree route label response result) :
    Dispatcher.HasRoute tree route label :=
  h.toActivatedRoute.hasRoute

/-- Fresh route execution installs the supplied snapshot in every audit slot. -/
theorem fresh
    {Label : Type u} {encode : Label → Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    (path : Dispatcher.HasRoute tree route label) (snapshot : Term) :
    SnapshotRoute encode snapshot tree route label
      (.app (encode label) snapshot)
      (RouteExecution.freshRouteResult encode tree route snapshot) := by
  induction path with
  | leaf label => exact .leaf label (.app (encode label) snapshot)
  | left path ih => exact .left ih
  | right path ih => exact .right ih

/--
Reducing only the selected response preserves every exact route and dormant
audit.  The target route term is returned together with the counted lift.
-/
theorem reduceResponse
    {Label : Type u} {encode : Label → Term} {snapshot : Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    {sourceResponse sourceResult targetResponse : Term} {n : Nat}
    (routeShape : SnapshotRoute encode snapshot tree route label sourceResponse
      sourceResult)
    (responseSteps : StepsN n sourceResponse targetResponse) :
    ∃ targetResult,
      StepsN n sourceResult targetResult ∧
      SnapshotRoute encode snapshot tree route label targetResponse
        targetResult := by
  induction routeShape with
  | leaf label sourceResponse =>
      refine ⟨chosen snapshot targetResponse, ?_, ?_⟩
      · simpa [chosen] using
          StepsN.appRight (.app .s snapshot) responseSteps
      · exact .leaf label targetResponse
  | @left left right route label sourceResponse activatedChild inner ih =>
      obtain ⟨targetChild, childSteps, targetShape⟩ := ih responseSteps
      refine ⟨RouteGrammar.selectedLeft snapshot targetChild
          (RouteGrammar.compiledCall encode right snapshot), ?_, ?_⟩
      · exact RouteExecution.selectedLeft_steps childSteps snapshot
          (RouteGrammar.compiledCall encode right snapshot)
      · exact .left targetShape
  | @right left right route label sourceResponse activatedChild inner ih =>
      obtain ⟨targetChild, childSteps, targetShape⟩ := ih responseSteps
      refine ⟨RouteGrammar.selectedRight snapshot
          (RouteGrammar.compiledCall encode left snapshot) targetChild, ?_, ?_⟩
      · exact RouteExecution.selectedRight_steps childSteps snapshot
          (RouteGrammar.compiledCall encode left snapshot)
      · exact .right targetShape

end SnapshotRoute

/-! ## Exact action histories -/

/--
The selected-action response after its accumulator has evolved.  Every
history argument remains the exact term created from the original snapshot.
-/
def actionResponse (program : CTS.Program) (label : ActionLabel program)
    (snapshot accumulator : Term) : Term :=
  Term.applyArgs (.app p accumulator) (actionHistories program label snapshot)

@[simp]
theorem actionResponse_initial
    (program : CTS.Program) (label : ActionLabel program) (snapshot : Term) :
    actionResponse program label snapshot
        (actionAccumulator program label snapshot) =
      actionResult program label snapshot :=
  rfl

/-- The exact-history response is accepted by the public action grammar. -/
theorem actionResponse_shape
    (program : CTS.Program) (label : ActionLabel program)
    (snapshot accumulator : Term) :
    ActionParser.ActionShape program label accumulator
      (actionHistories program label snapshot)
      (actionResponse program label snapshot accumulator) := by
  exact ⟨ActionParser.actionHistories_length program label snapshot, rfl⟩

/-- A counted reduction lifts through an unchanged right-argument spine. -/
theorem applyArgs_steps
    {n : Nat} {source target : Term}
    (steps : StepsN n source target) (arguments : List Term) :
    StepsN n (Term.applyArgs source arguments)
      (Term.applyArgs target arguments) := by
  induction arguments generalizing source target with
  | nil => simpa
  | cons argument arguments ih =>
      simp only [Term.applyArgs]
      exact ih (StepsN.appLeft steps argument)

/-- Accumulator reduction leaves every exact action-history sibling unchanged. -/
theorem actionResponse_steps
    (program : CTS.Program) (label : ActionLabel program) (snapshot : Term)
    {n : Nat} {source target : Term}
    (steps : StepsN n source target) :
    StepsN n (actionResponse program label snapshot source)
      (actionResponse program label snapshot target) := by
  exact applyArgs_steps (StepsN.appRight p steps)
    (actionHistories program label snapshot)

/-! ## Completed dispatchers with exact provenance -/

/--
A completed dispatcher at a fixed route and label.  Its route audits all equal
`snapshot`, and its action histories are the exact creation histories from
that same snapshot; only `accumulator` is allowed to evolve.
-/
structure SnapshotDispatchAt
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (snapshot : Term) (route : Dispatcher.Route)
    (label : ActionLabel program) (accumulator dispatcher : Term) : Prop where
  routeShape :
    SnapshotRoute (selectedAction program) snapshot tree route label
      (actionResponse program label snapshot accumulator) dispatcher

namespace SnapshotDispatchAt

/-- Exact provenance forgets to the public route/action parser shape. -/
theorem toDispatchShape
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {snapshot : Term} {route : Dispatcher.Route}
    {label : ActionLabel program} {accumulator dispatcher : Term}
    (h : SnapshotDispatchAt program tree snapshot route label accumulator
      dispatcher) :
    DispatchParser.DispatchShape program tree route label accumulator
      dispatcher := by
  refine ⟨actionResponse program label snapshot accumulator,
    actionHistories program label snapshot, h.routeShape.toActivatedRoute, ?_⟩
  exact actionResponse_shape program label snapshot accumulator

/-- Exact provenance implies the relation consumed by the carrier grammar. -/
theorem toDispatchesTo
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {snapshot : Term} {route : Dispatcher.Route}
    {label : ActionLabel program} {accumulator dispatcher : Term}
    (h : SnapshotDispatchAt program tree snapshot route label accumulator
      dispatcher) :
    DispatchParser.dispatchesTo program tree dispatcher accumulator :=
  ⟨route, label, h.toDispatchShape⟩

/-- The exact dispatcher witness is indexed by a genuine tree route. -/
theorem hasRoute
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {snapshot : Term} {route : Dispatcher.Route}
    {label : ActionLabel program} {accumulator dispatcher : Term}
    (h : SnapshotDispatchAt program tree snapshot route label accumulator
      dispatcher) :
    Dispatcher.HasRoute tree route label :=
  h.routeShape.hasRoute

/--
Route selection followed by the selected action constructs an exact-provenance
dispatcher in the existing route/action contraction count.
-/
theorem execute
    (program : CTS.Program)
    {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program}
    (path : Dispatcher.HasRoute tree route label) (snapshot : Term) :
    ∃ dispatcher,
      StepsN (RouteAction.completedCost program route label)
        (RouteGrammar.compiledCall (selectedAction program) tree snapshot)
        dispatcher ∧
      SnapshotDispatchAt program tree snapshot route label
        (actionAccumulator program label snapshot) dispatcher := by
  have routeSteps := RouteExecution.compiledCall_executeRoute
    (encode := selectedAction program) path snapshot
  have freshShape :
      SnapshotRoute (selectedAction program) snapshot tree route label
        (.app (selectedAction program label) snapshot)
        (RouteExecution.freshRouteResult (selectedAction program) tree route
          snapshot) :=
    SnapshotRoute.fresh path snapshot
  obtain ⟨dispatcher, actionSteps, completedShape⟩ :=
    freshShape.reduceResponse (executeAction program label snapshot)
  refine ⟨dispatcher, ?_, ?_⟩
  · simpa [RouteAction.completedCost] using
      StepsN.trans routeSteps actionSteps
  · refine ⟨?_⟩
    simpa using completedShape

/--
Changing only the selected accumulator produces a new dispatcher with the
same route, label, snapshot audits, and history fields.
-/
theorem reduceAccumulator
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {snapshot : Term} {route : Dispatcher.Route}
    {label : ActionLabel program}
    {sourceAccumulator sourceDispatcher targetAccumulator : Term} {n : Nat}
    (h : SnapshotDispatchAt program tree snapshot route label sourceAccumulator
      sourceDispatcher)
    (steps : StepsN n sourceAccumulator targetAccumulator) :
    ∃ targetDispatcher,
      StepsN n sourceDispatcher targetDispatcher ∧
      SnapshotDispatchAt program tree snapshot route label targetAccumulator
        targetDispatcher := by
  have responseSteps :=
    actionResponse_steps program label snapshot steps
  obtain ⟨targetDispatcher, dispatcherSteps, targetShape⟩ :=
    h.routeShape.reduceResponse responseSteps
  exact ⟨targetDispatcher, dispatcherSteps, ⟨targetShape⟩⟩

end SnapshotDispatchAt

/-! ## Exact Local layers -/

/-- Whether the registered halt field is still fresh or has been marked. -/
inductive HaltState where
  | fresh
  | marked
  deriving BEq, DecidableEq, Repr

/-- Both registered halt states retain the same exact creation snapshot. -/
def haltField : HaltState → Term → Term
  | .fresh, snapshot => freshHField snapshot
  | .marked, snapshot => Carrier.markedHField snapshot snapshot

@[simp]
theorem haltField_fresh (snapshot : Term) :
    haltField .fresh snapshot = freshHField snapshot :=
  rfl

@[simp]
theorem haltField_marked (snapshot : Term) :
    haltField .marked snapshot = Carrier.markedHField snapshot snapshot :=
  rfl

/-- Either exact halt state is accepted by the public halt-field grammar. -/
theorem haltField_shape (state : HaltState) (snapshot : Term) :
    Carrier.HField (haltField state snapshot) := by
  cases state with
  | fresh => exact .fresh snapshot
  | marked => exact .marked snapshot snapshot

/--
One completed Local layer with exact provenance.  Its three Local audits and
all audits inside its completed dispatcher descend from the same `snapshot`.
-/
structure Layer
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation : Term)
    (snapshot accumulator result : Term)
    (status : HaltState) (route : Dispatcher.Route)
    (label : ActionLabel program) (dispatcher : Term) : Prop where
  dispatch : SnapshotDispatchAt program tree snapshot route label accumulator
    dispatcher
  result_eq :
    result = Carrier.activeShell bits continuation (haltField status snapshot)
      dispatcher snapshot snapshot

namespace Layer

/-- Forgetting provenance gives the public mutation-closed Local shell. -/
theorem toLocalShell
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation snapshot accumulator result : Term}
    {status : HaltState} {route : Dispatcher.Route}
    {label : ActionLabel program} {dispatcher : Term}
    (h : Layer program tree bits continuation snapshot accumulator result status
      route label dispatcher) :
    Carrier.LocalShell bits continuation dispatcher result := by
  have shell : Carrier.LocalShell bits continuation dispatcher
      (Carrier.activeShell bits continuation (haltField status snapshot)
        dispatcher snapshot snapshot) := by
    cases status with
    | fresh => exact .fresh dispatcher snapshot snapshot snapshot
    | marked => exact .marked dispatcher snapshot snapshot snapshot snapshot
  exact h.result_eq.symm ▸ shell

/-- Every exact Local layer has whole-carrier root arity five or six. -/
theorem root_headArity
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation snapshot accumulator result : Term}
    {status : HaltState} {route : Dispatcher.Route}
    {label : ActionLabel program} {dispatcher : Term}
    (h : Layer program tree bits continuation snapshot accumulator result status
      route label dispatcher) :
    result.headArity = 5 ∨ result.headArity = 6 :=
  h.toLocalShell.result_headArity

/--
Accumulator reduction lifts through the exact action, route, and Local shell;
the halt state and every snapshot field remain literally unchanged.
-/
theorem reduceAccumulator
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation snapshot : Term}
    {sourceAccumulator sourceResult targetAccumulator : Term} {n : Nat}
    {status : HaltState} {route : Dispatcher.Route}
    {label : ActionLabel program} {sourceDispatcher : Term}
    (h : Layer program tree bits continuation snapshot sourceAccumulator
      sourceResult status route label sourceDispatcher)
    (steps : StepsN n sourceAccumulator targetAccumulator) :
    ∃ targetDispatcher targetResult,
      StepsN n sourceResult targetResult ∧
      Layer program tree bits continuation snapshot targetAccumulator
        targetResult status route label targetDispatcher := by
  obtain ⟨targetDispatcher, dispatcherSteps, targetDispatch⟩ :=
    h.dispatch.reduceAccumulator steps
  let targetResult : Term :=
    Carrier.activeShell bits continuation (haltField status snapshot)
      targetDispatcher snapshot snapshot
  have inDispatcher :=
    StepsN.appRight (haltField status snapshot) dispatcherSteps
  have withSeed :=
    StepsN.appLeft inDispatcher (.app (seedCode bits) snapshot)
  have withContinuation :=
    StepsN.appLeft withSeed (.app continuation snapshot)
  have shellSteps : StepsN n
      (Carrier.activeShell bits continuation (haltField status snapshot)
        sourceDispatcher snapshot snapshot)
      targetResult := by
    simpa [targetResult, Carrier.activeShell, Carrier.shell] using
      withContinuation
  refine ⟨targetDispatcher, targetResult, ?_, ?_⟩
  · exact h.result_eq.symm ▸ shellSteps
  · exact
      { dispatch := targetDispatch
        result_eq := rfl }

/-- Marking changes only the registered fresh halt field. -/
theorem mark
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation snapshot accumulator result : Term}
    {status : HaltState} {route : Dispatcher.Route}
    {label : ActionLabel program} {dispatcher : Term}
    (h : Layer program tree bits continuation snapshot accumulator result status
      route label dispatcher)
    (hstatus : status = .fresh) :
    StepsN 1 result
        (LocalResponse.markedCompleted bits continuation snapshot dispatcher) ∧
      Layer program tree bits continuation snapshot accumulator
        (LocalResponse.markedCompleted bits continuation snapshot
          dispatcher) .marked route label dispatcher := by
  subst status
  have sourceEq :
      result = LocalResponse.completed bits continuation snapshot dispatcher := by
    exact h.result_eq
  constructor
  · exact sourceEq.symm ▸
      LocalResponse.completed_mark bits continuation snapshot dispatcher
  · exact
      { dispatch := h.dispatch
        result_eq := rfl }

/--
The dispatcher parent rejects the shallow pending guard.  The marked case is
the one place where the whole-root arity of the creation snapshot is used.
-/
theorem dispatcher_noncollision
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation snapshot accumulator result : Term}
    {status : HaltState} {route : Dispatcher.Route}
    {label : ActionLabel program} {dispatcher : Term}
    (h : Layer program tree bits continuation snapshot accumulator result status
      route label dispatcher)
    (snapshotWhole : PendingFrame.WholeCarrierAudit snapshot) :
    PendingFrame.guard?
        (.app (haltField status snapshot) dispatcher) [.right] = none := by
  cases status with
  | fresh => exact PendingFrame.guard?_freshLocalDispatcher snapshot dispatcher
  | marked =>
      exact PendingFrame.guard?_markedLocalDispatcher snapshot dispatcher
        snapshotWhole

end Layer

/-! ## Recursive whole-carrier audit invariant -/

/-- A queue segment over a certified whole root is a registered RootPath path. -/
theorem queueSegment_path
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation endpoint term : Term}
    (segment : Carrier.QueueSegment endpoint term)
    (root : RootPath.Root program tree bits continuation endpoint) :
    RootPath.Path program tree bits continuation term := by
  induction segment with
  | endpoint => exact .root root
  | live bit inner ih => exact .live bit ih
  | tombstone bit audit inner ih => exact .tombstone bit audit ih

/-- The generated action accumulator is a queue segment over its input root. -/
theorem actionAccumulator_segment
    (program : CTS.Program) (label : ActionLabel program) (snapshot : Term) :
    Carrier.QueueSegment snapshot
      (actionAccumulator program label snapshot) := by
  rcases label with ⟨phase, bit⟩
  cases bit with
  | false => exact .endpoint
  | true =>
      simpa [actionAccumulator, appenderAccumulator, extendAccumulator] using
        Carrier.QueueSegment.foldl_live (program.appendant phase)
          (.endpoint : Carrier.QueueSegment snapshot snapshot)

/--
The strong audit invariant for whole carrier roots.

The Base case contains the exact mutable Base and a complete queue.  A Local
case stores both the frozen creation snapshot and the current active root.
The accumulator is a mutation-closed queue segment over that current root,
while `Layer` fixes all retained audits and histories to their creation data.
-/
inductive Holds
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation : Term) : Term → Prop where
  | base
      {queue : Term} {decoded : List Bool}
      (queueComplete : CellSpine.Decodes queue decoded) :
      Holds program tree bits continuation
        (MutableBase.mutableBase (compileActions program tree) bits
          continuation queue)
  | local
      {snapshot currentRoot accumulator result dispatcher : Term}
      {status : HaltState} {route : Dispatcher.Route}
      {label : ActionLabel program}
      (snapshotInv : Holds program tree bits continuation snapshot)
      (currentInv : Holds program tree bits continuation currentRoot)
      (between : Carrier.QueueSegment currentRoot accumulator)
      (layer : Layer program tree bits continuation snapshot accumulator result
        status route label dispatcher) :
      Holds program tree bits continuation result

namespace Holds

/-- The stronger audit invariant forgets to the static whole-root grammar. -/
theorem toRoot
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation result : Term}
    (h : Holds program tree bits continuation result) :
    RootPath.Root program tree bits continuation result := by
  induction h with
  | base queueComplete => exact .base queueComplete
  | «local» snapshotInv currentInv between layer snapshotIH currentIH =>
      exact .local (queueSegment_path between currentIH)
        layer.dispatch.toDispatchesTo layer.toLocalShell

/-- Every carrier satisfying the strong invariant has arity five or six. -/
theorem wholeCarrierAudit
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation result : Term}
    (hadmissible : Carrier.Admissible continuation)
    (h : Holds program tree bits continuation result) :
    PendingFrame.WholeCarrierAudit result :=
  RootPath.Root.headArity hadmissible h.toRoot

/-- The exact initial Base satisfies the strong audit invariant. -/
theorem initial
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation : Term) :
    Holds program tree bits continuation
      (baseCarrier
        (environmentCode (compileActions program tree) bits)
        continuation) := by
  rw [← MutableBase.mutableBase_word]
  exact .base (CellSpine.decodes_word bits)

/--
Executing one fresh frame/route/action layer preserves the strong invariant
and returns an exact-provenance dispatcher witness at the same endpoint.
-/
theorem executeLayer
    (program : CTS.Program)
    {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program}
    (path : Dispatcher.HasRoute tree route label)
    (bits : List Bool) (continuation snapshot : Term)
    (snapshotInv : Holds program tree bits continuation snapshot) :
    ∃ dispatcher,
      StepsN (LocalResponse.completedCost program route label)
        (frame
          (environmentCode (compileActions program tree) bits)
          continuation snapshot)
        (LocalResponse.completed bits continuation snapshot dispatcher) ∧
      Holds program tree bits continuation
        (LocalResponse.completed bits continuation snapshot dispatcher) ∧
      SnapshotDispatchAt program tree snapshot route label
        (actionAccumulator program label snapshot) dispatcher := by
  obtain ⟨dispatcher, dispatcherSteps, dispatchShape⟩ :=
    SnapshotDispatchAt.execute program path snapshot
  have prefixSteps :=
    framePrefix (compileActions program tree) bits continuation snapshot
  have inDispatcher :=
    StepsN.appRight (freshHField snapshot) dispatcherSteps
  have withSeed :=
    StepsN.appLeft inDispatcher (.app (seedCode bits) snapshot)
  have withContinuation :=
    StepsN.appLeft withSeed (.app continuation snapshot)
  have localSteps :
      StepsN (RouteAction.completedCost program route label)
        (freshLocal (compileActions program tree) bits continuation snapshot)
        (LocalResponse.completed bits continuation snapshot dispatcher) := by
    simpa [freshLocal, LocalResponse.completed, freshHField, compileActions,
      RouteGrammar.compiledCall, Term.applyArgs, Carrier.activeShell,
      Carrier.shell] using withContinuation
  have allSteps := StepsN.trans prefixSteps localSteps
  have counted :
      StepsN (LocalResponse.completedCost program route label)
        (frame
          (environmentCode (compileActions program tree) bits)
          continuation snapshot)
        (LocalResponse.completed bits continuation snapshot dispatcher) := by
    simpa [LocalResponse.completedCost, RouteAction.completedCost] using allSteps
  let layer : Layer program tree bits continuation snapshot
      (actionAccumulator program label snapshot)
      (LocalResponse.completed bits continuation snapshot dispatcher)
      .fresh route label dispatcher :=
    { dispatch := dispatchShape
      result_eq := rfl }
  have resultInv :
      Holds program tree bits continuation
        (LocalResponse.completed bits continuation snapshot dispatcher) :=
    .local snapshotInv snapshotInv
      (actionAccumulator_segment program label snapshot) layer
  exact ⟨dispatcher, counted, resultInv, dispatchShape⟩

/-- Marking a fresh exact Local layer preserves its recursive audit invariant. -/
theorem markLayer
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation snapshot currentRoot accumulator result : Term}
    {route : Dispatcher.Route} {label : ActionLabel program}
    {dispatcher : Term}
    (snapshotInv : Holds program tree bits continuation snapshot)
    (currentInv : Holds program tree bits continuation currentRoot)
    (between : Carrier.QueueSegment currentRoot accumulator)
    (layer : Layer program tree bits continuation snapshot accumulator result
      .fresh route label dispatcher) :
    StepsN 1 result
        (LocalResponse.markedCompleted bits continuation snapshot
          dispatcher) ∧
      Holds program tree bits continuation
        (LocalResponse.markedCompleted bits continuation snapshot
          dispatcher) := by
  obtain ⟨steps, markedLayer⟩ := layer.mark rfl
  exact ⟨steps, .local snapshotInv currentInv between markedLayer⟩

/--
The apparent marked-Local/pending-frame collision is impossible for every
layer whose creation snapshot satisfies the recursive invariant.
-/
theorem markedLocal_dispatcher_noncollision
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation snapshot accumulator result : Term}
    {route : Dispatcher.Route} {label : ActionLabel program}
    {dispatcher : Term}
    (hadmissible : Carrier.Admissible continuation)
    (snapshotInv : Holds program tree bits continuation snapshot)
    (layer : Layer program tree bits continuation snapshot accumulator result
      .marked route label dispatcher) :
    PendingFrame.guard?
        (.app (Carrier.markedHField snapshot snapshot) dispatcher)
        [.right] = none := by
  have whole := snapshotInv.wholeCarrierAudit hadmissible
  have guarded := layer.dispatcher_noncollision whole
  exact guarded

end Holds

end ReachableAudit

end PureSFormal.PureS
