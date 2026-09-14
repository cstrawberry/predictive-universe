import PureSFormal.PureS.CheckpointDecoder
import PureSFormal.PureS.ReachableAudit

/-!
# Constructor interface for checkpoint parsing

This module supplies the converse and compositional constructor lemmas used
by bounded-job and stage proofs.  It is kept above the bare parser because
exact-provenance `SnapshotDispatchAt` belongs to `ReachableAudit`.
-/

namespace PureSFormal.PureS

namespace CheckpointDecoder

/-! ## Local-parser completeness -/

/-- Every declarative public Local shape is returned with its exact view. -/
theorem parseLocal?_complete
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : LocalView program}
    (h : LocalShape program tree view term) :
    parseLocal? program tree term = some view := by
  cases view with
  | mk status route label accumulator seedPayload continuation =>
      cases h with
      | intro haltField dispatcher seedAudit continuationAudit halt dispatch
          source_eq =>
          subst term
          cases halt with
          | fresh audit =>
              simp [parseLocal?, openShell, checkHalt?, freshHField,
                DispatchParser.parse_complete dispatch]
          | marked leftAudit rightAudit =>
              simp [parseLocal?, openShell, checkHalt?,
                Carrier.markedHField, haltCode, b,
                DispatchParser.parse_complete dispatch]

theorem parseLocal?_eq_some_iff
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) (view : LocalView program) :
    parseLocal? program tree term = some view ↔
      LocalShape program tree view term :=
  ⟨parseLocal?_sound, parseLocal?_complete⟩

/-! ## Exact-provenance Local responses -/

/-- The view recovered from a fresh exact-provenance response. -/
def completedView (program : CTS.Program)
    (route : Dispatcher.Route) (label : ActionLabel program)
    (accumulator : Term) (bits : List Bool) (continuation : Term) :
    LocalView program :=
  ⟨.fresh, route, label, accumulator, word bits, continuation⟩

/-- The view recovered from its marked counterpart. -/
def markedCompletedView (program : CTS.Program)
    (route : Dispatcher.Route) (label : ActionLabel program)
    (accumulator : Term) (bits : List Bool) (continuation : Term) :
    LocalView program :=
  ⟨.marked, route, label, accumulator, word bits, continuation⟩

/-- Exact dispatcher provenance gives the declarative fresh Local shape. -/
theorem localShape_completed
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {snapshot dispatcher accumulator continuation : Term}
    {route : Dispatcher.Route} {label : ActionLabel program}
    (bits : List Bool)
    (dispatch : ReachableAudit.SnapshotDispatchAt program tree snapshot route
      label accumulator dispatcher) :
    LocalShape program tree
      (completedView program route label accumulator bits continuation)
      (LocalResponse.completed bits continuation snapshot dispatcher) := by
  exact ⟨freshHField snapshot, dispatcher, snapshot, snapshot,
    .fresh snapshot, dispatch.toDispatchShape, rfl⟩

/-- Exact dispatcher provenance gives the declarative marked Local shape. -/
theorem localShape_markedCompleted
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {snapshot dispatcher accumulator continuation : Term}
    {route : Dispatcher.Route} {label : ActionLabel program}
    (bits : List Bool)
    (dispatch : ReachableAudit.SnapshotDispatchAt program tree snapshot route
      label accumulator dispatcher) :
    LocalShape program tree
      (markedCompletedView program route label accumulator bits continuation)
      (LocalResponse.markedCompleted bits continuation snapshot dispatcher) := by
  exact ⟨Carrier.markedHField snapshot snapshot, dispatcher, snapshot,
    snapshot, .marked snapshot snapshot, dispatch.toDispatchShape, rfl⟩

@[simp]
theorem parseLocal?_completed
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {snapshot dispatcher accumulator continuation : Term}
    {route : Dispatcher.Route} {label : ActionLabel program}
    (bits : List Bool)
    (dispatch : ReachableAudit.SnapshotDispatchAt program tree snapshot route
      label accumulator dispatcher) :
    parseLocal? program tree
        (LocalResponse.completed bits continuation snapshot dispatcher) =
      some (completedView program route label accumulator bits continuation) :=
  parseLocal?_complete (localShape_completed bits dispatch)

@[simp]
theorem parseLocal?_markedCompleted
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {snapshot dispatcher accumulator continuation : Term}
    {route : Dispatcher.Route} {label : ActionLabel program}
    (bits : List Bool)
    (dispatch : ReachableAudit.SnapshotDispatchAt program tree snapshot route
      label accumulator dispatcher) :
    parseLocal? program tree
        (LocalResponse.markedCompleted bits continuation snapshot dispatcher) =
      some
        (markedCompletedView program route label accumulator bits
          continuation) :=
  parseLocal?_complete (localShape_markedCompleted bits dispatch)

/-! ## Compositional continuation-chain constructors -/

namespace ChainShape

/-- Prepend one declarative Local response to any established chain tail. -/
theorem prepend
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : LocalView program} {tail : ChainTail program}
    (localShape : LocalShape program tree view term)
    (inner : ChainShape program tree view.continuation tail) :
    ChainShape program tree term (prependLocal view tail) :=
  .local view (parseLocal?_complete localShape) inner

/-- At a terminal, prepending creates a one-layer completed chain. -/
theorem prepend_terminal
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : LocalView program} {terminal : TerminalView}
    (localShape : LocalShape program tree view term)
    (inner : ChainShape program tree view.continuation (.terminal terminal)) :
    ChainShape program tree term
      (.completed ⟨1, terminal, view⟩) := by
  simpa [prependLocal] using prepend localShape inner

/-- Prepending above a chain increments only its layer count. -/
theorem prepend_completed
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : LocalView program} {innerView : ChainView program}
    (localShape : LocalShape program tree view term)
    (inner : ChainShape program tree view.continuation
      (.completed innerView)) :
    ChainShape program tree term
      (.completed
        ⟨innerView.layers + 1, innerView.terminal, innerView.last⟩) := by
  simpa [prependLocal] using prepend localShape inner

/-- Prepend an exact fresh response to an arbitrary existing chain tail. -/
theorem prepend_response
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {snapshot dispatcher accumulator continuation : Term}
    {route : Dispatcher.Route} {label : ActionLabel program}
    {tail : ChainTail program} (bits : List Bool)
    (dispatch : ReachableAudit.SnapshotDispatchAt program tree snapshot route
      label accumulator dispatcher)
    (inner : ChainShape program tree continuation tail) :
    ChainShape program tree
      (LocalResponse.completed bits continuation snapshot dispatcher)
      (prependLocal
        (completedView program route label accumulator bits continuation)
        tail) :=
  prepend (localShape_completed bits dispatch) inner

/-- Prepend an exact marked response to an arbitrary existing chain tail. -/
theorem prepend_markedResponse
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {snapshot dispatcher accumulator continuation : Term}
    {route : Dispatcher.Route} {label : ActionLabel program}
    {tail : ChainTail program} (bits : List Bool)
    (dispatch : ReachableAudit.SnapshotDispatchAt program tree snapshot route
      label accumulator dispatcher)
    (inner : ChainShape program tree continuation tail) :
    ChainShape program tree
      (LocalResponse.markedCompleted bits continuation snapshot dispatcher)
      (prependLocal
        (markedCompletedView program route label accumulator bits continuation)
        tail) :=
  prepend (localShape_markedCompleted bits dispatch) inner

/-- Fresh response over a terminal: exact count one and exact innermost view. -/
theorem prepend_response_terminal
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {snapshot dispatcher accumulator continuation : Term}
    {route : Dispatcher.Route} {label : ActionLabel program}
    {terminal : TerminalView} (bits : List Bool)
    (dispatch : ReachableAudit.SnapshotDispatchAt program tree snapshot route
      label accumulator dispatcher)
    (inner : ChainShape program tree continuation (.terminal terminal)) :
    ChainShape program tree
      (LocalResponse.completed bits continuation snapshot dispatcher)
      (.completed
        ⟨1, terminal,
          completedView program route label accumulator bits continuation⟩) := by
  simpa [prependLocal] using prepend_response bits dispatch inner

/-- Marked response over a terminal: exact count one and exact innermost view. -/
theorem prepend_markedResponse_terminal
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {snapshot dispatcher accumulator continuation : Term}
    {route : Dispatcher.Route} {label : ActionLabel program}
    {terminal : TerminalView} (bits : List Bool)
    (dispatch : ReachableAudit.SnapshotDispatchAt program tree snapshot route
      label accumulator dispatcher)
    (inner : ChainShape program tree continuation (.terminal terminal)) :
    ChainShape program tree
      (LocalResponse.markedCompleted bits continuation snapshot dispatcher)
      (.completed
        ⟨1, terminal,
          markedCompletedView program route label accumulator bits
            continuation⟩) := by
  simpa [prependLocal] using prepend_markedResponse bits dispatch inner

/-- Fresh response above a chain preserves terminal/last and increments count. -/
theorem prepend_response_completed
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {snapshot dispatcher accumulator continuation : Term}
    {route : Dispatcher.Route} {label : ActionLabel program}
    {innerView : ChainView program} (bits : List Bool)
    (dispatch : ReachableAudit.SnapshotDispatchAt program tree snapshot route
      label accumulator dispatcher)
    (inner : ChainShape program tree continuation (.completed innerView)) :
    ChainShape program tree
      (LocalResponse.completed bits continuation snapshot dispatcher)
      (.completed
        ⟨innerView.layers + 1, innerView.terminal, innerView.last⟩) := by
  simpa [prependLocal] using prepend_response bits dispatch inner

/-- Marked response above a chain has the same compositional indices. -/
theorem prepend_markedResponse_completed
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {snapshot dispatcher accumulator continuation : Term}
    {route : Dispatcher.Route} {label : ActionLabel program}
    {innerView : ChainView program} (bits : List Bool)
    (dispatch : ReachableAudit.SnapshotDispatchAt program tree snapshot route
      label accumulator dispatcher)
    (inner : ChainShape program tree continuation (.completed innerView)) :
    ChainShape program tree
      (LocalResponse.markedCompleted bits continuation snapshot dispatcher)
      (.completed
        ⟨innerView.layers + 1, innerView.terminal, innerView.last⟩) := by
  simpa [prependLocal] using prepend_markedResponse bits dispatch inner

end ChainShape

end CheckpointDecoder

end PureSFormal.PureS
