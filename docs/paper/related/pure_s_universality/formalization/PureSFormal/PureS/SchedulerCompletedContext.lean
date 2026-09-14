import PureSFormal.PureS.SchedulerRootContinuation

/-!
# Completed continuation contexts

The dovetail scheduler leaves a literal chain of completed `Local` shells
around every later stage.  This module records that an outer cursor-parent
stack parses as such a chain for every term placed at its continuation hole.
The certificate is independent of the current clock, fuel, or carrier term and
can therefore be threaded through the all-stage recurrence.
-/

namespace PureSFormal.PureS

open SchedulerControl SchedulerInvariant

namespace CheckpointExclusion.CompletedPrefix

/-- Compose an outer completed prefix with a completed prefix beginning at its
endpoint.  The layer count is additive. -/
theorem trans
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term middle endpoint : Term} {outerLayers innerLayers : Nat}
    (outer : CheckpointExclusion.CompletedPrefix program tree term middle
      outerLayers)
    (inner : CheckpointExclusion.CompletedPrefix program tree middle endpoint
      innerLayers) :
    CheckpointExclusion.CompletedPrefix program tree term endpoint
      (innerLayers + outerLayers) := by
  induction outer with
  | here =>
      simpa using inner
  | @«local» term middle outerLayers view boundary tail ih =>
      apply CheckpointExclusion.CompletedPrefix.local view boundary
      simpa [Nat.add_assoc] using ih inner

/-- A certified completed prefix wraps any completed inner chain, adding
exactly its recorded number of parser layers. -/
theorem wrapCompleted
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term endpoint : Term} {layers : Nat}
    {chain : CheckpointDecoder.ChainView program}
    (outer : CheckpointExclusion.CompletedPrefix program tree term endpoint
      layers)
    (inner : CheckpointDecoder.ChainShape program tree endpoint
      (.completed chain)) :
    CheckpointDecoder.ChainShape program tree term
      (.completed (CheckpointRun.addLayers layers chain)) := by
  induction outer with
  | here =>
      simpa [CheckpointRun.addLayers] using inner
  | «local» view boundary tailPrefix ih =>
      have wrapped := CheckpointDecoder.ChainShape.local view boundary (ih inner)
      simpa [CheckpointDecoder.prependLocal, CheckpointRun.addLayers,
        Nat.add_assoc] using wrapped

end CheckpointExclusion.CompletedPrefix

namespace SchedulerCompletedContext

/-- An outer parent stack made entirely from completed-Local continuation
holes.  Replacing the current endpoint preserves the same parser depth. -/
structure CompletedParents
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (parents : List ParentFrame) (layers : Nat) : Prop where
  certificate : ∀ endpoint,
    CheckpointExclusion.CompletedPrefix program dispatcher.tree
      (Cursor.rebuild parents endpoint) endpoint layers
  pendingReject : ∀ (use : SchedulerControl.PendingUse) (focus : Term),
    SchedulerControl.compiledProbeAnswer program dispatcher (.pending use)
      ⟨focus, parents⟩ = false
  contextDepth :
    (CanonicalTraversal.contextAddress
      (SchedulerInvariant.contextOfParents parents)).length = 2 * layers

namespace CompletedParents

/-- Uniform access to the completed-prefix certificate at a chosen endpoint. -/
theorem «prefix»
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {parents : List ParentFrame} {layers : Nat}
    (outer : CompletedParents program dispatcher parents layers)
    (endpoint : Term) :
    CheckpointExclusion.CompletedPrefix program dispatcher.tree
      (Cursor.rebuild parents endpoint) endpoint layers :=
  outer.certificate endpoint

/-- Wrap a completed inner parser chain beneath the exact zipper context. -/
theorem wrapCompleted
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {parents : List ParentFrame} {layers : Nat}
    (outer : CompletedParents program dispatcher parents layers)
    {innerTerm : Term} {innerChain : CheckpointDecoder.ChainView program}
    (inner : CheckpointDecoder.ChainShape program dispatcher.tree innerTerm
      (.completed innerChain)) :
    CheckpointDecoder.ChainShape program dispatcher.tree
      ((SchedulerInvariant.contextOfParents parents).plug innerTerm)
      (.completed (CheckpointRun.addLayers layers innerChain)) := by
  rw [SchedulerInvariant.contextOfParents_plug]
  exact CheckpointExclusion.CompletedPrefix.wrapCompleted
    (outer.prefix innerTerm) inner

/-- The empty outer zipper is the zero-layer completed context. -/
theorem root
    (program : CTS.Program) (dispatcher : ActionDispatcher program) :
    CompletedParents program dispatcher [] 0 := by
  constructor
  · intro endpoint
    exact .here endpoint
  · intro use focus
    rfl
  · rfl

/-- Pending-frame construction is independent of the already-completed suffix:
the new pending frames are prepended literally to the supplied outer zipper. -/
theorem pendingParents_eq_append
    (environment continuation : Term) :
    ∀ depth parents,
      PrimitiveFuel.pendingParents environment continuation depth parents =
        PrimitiveFuel.pendingParents environment continuation depth [] ++
          parents
  | 0, parents => rfl
  | depth + 1, parents => by
      change PrimitiveFuel.pendingParents environment continuation depth
          (.right (.app environment continuation) :: parents) =
        PrimitiveFuel.pendingParents environment continuation depth
            [.right (.app environment continuation)] ++ parents
      rw [pendingParents_eq_append environment continuation depth
        (.right (.app environment continuation) :: parents)]
      rw [pendingParents_eq_append environment continuation depth
        [.right (.app environment continuation)]]
      simp [List.append_assoc]

/-- Any direct parser failure at the continuation endpoint remains silent
under the certified completed outer parents. -/
theorem silentOfFailure
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {parents : List ParentFrame} {layers : Nat}
    (outer : CompletedParents program dispatcher parents layers)
    (family : SchedulerControl.Family) {endpoint : Term}
    (failure : CheckpointExclusion.EndpointFailure program dispatcher.tree
      endpoint) :
    SilentEvidence program dispatcher.tree family
      (Cursor.rebuild parents endpoint) :=
  SilentEvidence.ofState (.endpointFailure (outer.prefix endpoint) failure)

/-- Endpoint failure may be established below an arbitrary local zipper before
the completed outer suffix is applied. -/
theorem silentOfLocalFailure
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {parents : List ParentFrame} {layers : Nat}
    (outer : CompletedParents program dispatcher parents layers)
    (family : SchedulerControl.Family) (localParents : List ParentFrame)
    (focus : Term)
    (failure : CheckpointExclusion.EndpointFailure program dispatcher.tree
      (Cursor.rebuild localParents focus)) :
    SilentEvidence program dispatcher.tree family
      (Cursor.mk focus (localParents ++ parents)).erase := by
  rw [Cursor.erase, SchedulerInvariant.rebuild_append]
  exact outer.silentOfFailure family failure

/-- A positive pending-frame stack is silent beneath every certified completed
outer continuation context. -/
theorem pendingSilent
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {parents : List ParentFrame} {layers : Nat}
    (outer : CompletedParents program dispatcher parents layers)
    (family : SchedulerControl.Family) (bits : List Bool)
    (continuation body : Term) (depth : Nat) (positive : depth ≠ 0) :
    SilentEvidence program dispatcher.tree family
      (Cursor.rebuild
        (PrimitiveFuel.pendingParents
          (environmentCode (compileActions program dispatcher.tree) bits)
          continuation depth parents)
        body) := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  have failure := pendingParents_failure program dispatcher bits continuation
    body depth positive
  rw [pendingParents_eq_append environment continuation depth parents]
  rw [SchedulerInvariant.rebuild_append]
  exact outer.silentOfFailure family failure

/-- Rebuilding the continuation zipper of a fresh completed Local is exactly
the corresponding Local term in the old outer zipper. -/
theorem rebuild_freshContinuationParents
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (carrier endpoint : Term) (parents : List ParentFrame) :
    Cursor.rebuild
        (SchedulerRootContinuation.freshContinuationParents program dispatcher
          registers bit bits carrier parents)
        endpoint =
      Cursor.rebuild parents
        (LocalResponse.completed bits endpoint carrier
          (SchedulerResponse.completedRoute program dispatcher registers bit
            carrier)) := by
  rfl

/-- Rebuilding the continuation zipper of a marked completed Local is exactly
the corresponding marked Local term in the old outer zipper. -/
theorem rebuild_markedContinuationParents
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (carrier endpoint : Term) (parents : List ParentFrame) :
    Cursor.rebuild
        (SchedulerRootContinuation.markedContinuationParents program dispatcher
          registers bit bits carrier parents)
        endpoint =
      Cursor.rebuild parents
        (LocalResponse.markedCompleted bits endpoint carrier
          (SchedulerResponse.completedRoute program dispatcher registers bit
            carrier)) := by
  rfl

/-- Rebuilding the terminal EMPTY continuation zipper has the same exact
marked-Local form, with the registered zero-action label. -/
theorem rebuild_emptyContinuationParents
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bits : List Bool)
    (carrier endpoint : Term) (parents : List ParentFrame) :
    Cursor.rebuild
        (SchedulerRootContinuation.emptyContinuationParents program dispatcher
          registers bits carrier parents)
        endpoint =
      Cursor.rebuild parents
        (LocalResponse.markedCompleted bits endpoint carrier
          (SchedulerResponse.completedRoute program dispatcher registers false
            carrier)) := by
  rfl

/-- Entering the continuation of a fresh completed response adds one certified
parser layer to any existing completed outer context. -/
theorem fresh
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {parents : List ParentFrame} {layers : Nat}
    (outer : CompletedParents program dispatcher parents layers)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (carrier : Term) :
    CompletedParents program dispatcher
      (SchedulerRootContinuation.freshContinuationParents program dispatcher
        registers bit bits carrier parents)
      (layers + 1) := by
  refine ⟨?_, ?_, ?_⟩
  · intro endpoint
    let route := dispatcher.route (registers.phase, bit)
    let label : ActionLabel program := (registers.phase, bit)
    let accumulator := actionAccumulator program label carrier
    let dispatcherTerm :=
      SchedulerResponse.completedRoute program dispatcher registers bit carrier
    let localTerm :=
      LocalResponse.completed bits endpoint carrier dispatcherTerm
    let view := CheckpointDecoder.completedView program route label accumulator
      bits endpoint
    have dispatch := SchedulerResponse.completedRoute_snapshotDispatch program
      dispatcher registers bit carrier
    have boundary : CheckpointDecoder.parseLocal? program dispatcher.tree
        localTerm = some view := by
      simpa [localTerm, view, route, label, accumulator, dispatcherTerm] using
        (CheckpointDecoder.parseLocal?_completed bits dispatch)
    have localPrefix : CheckpointExclusion.CompletedPrefix program dispatcher.tree
        localTerm endpoint 1 := by
      exact .local view boundary (.here endpoint)
    have combined := (outer.prefix localTerm).trans localPrefix
    rw [rebuild_freshContinuationParents]
    simpa [localTerm, Nat.add_comm] using combined
  · intro use focus
    rfl
  · simp [SchedulerRootContinuation.freshContinuationParents,
      SchedulerInvariant.contextOfParents,
      CanonicalTraversal.contextAddress_comp, outer.contextDepth,
      CanonicalTraversal.contextAddress, Nat.mul_add]

/-- Entering the continuation of a marked completed response adds one certified
parser layer to any existing completed outer context. -/
theorem marked
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {parents : List ParentFrame} {layers : Nat}
    (outer : CompletedParents program dispatcher parents layers)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (carrier : Term) :
    CompletedParents program dispatcher
      (SchedulerRootContinuation.markedContinuationParents program dispatcher
        registers bit bits carrier parents)
      (layers + 1) := by
  refine ⟨?_, ?_, ?_⟩
  · intro endpoint
    let route := dispatcher.route (registers.phase, bit)
    let label : ActionLabel program := (registers.phase, bit)
    let accumulator := actionAccumulator program label carrier
    let dispatcherTerm :=
      SchedulerResponse.completedRoute program dispatcher registers bit carrier
    let localTerm :=
      LocalResponse.markedCompleted bits endpoint carrier dispatcherTerm
    let view := CheckpointDecoder.markedCompletedView program route label
      accumulator bits endpoint
    have dispatch := SchedulerResponse.completedRoute_snapshotDispatch program
      dispatcher registers bit carrier
    have boundary : CheckpointDecoder.parseLocal? program dispatcher.tree
        localTerm = some view := by
      simpa [localTerm, view, route, label, accumulator, dispatcherTerm] using
        (CheckpointDecoder.parseLocal?_markedCompleted bits dispatch)
    have localPrefix : CheckpointExclusion.CompletedPrefix program dispatcher.tree
        localTerm endpoint 1 := by
      exact .local view boundary (.here endpoint)
    have combined := (outer.prefix localTerm).trans localPrefix
    rw [rebuild_markedContinuationParents]
    simpa [localTerm, Nat.add_comm] using combined
  · intro use focus
    rfl
  · simp [SchedulerRootContinuation.markedContinuationParents,
      SchedulerInvariant.contextOfParents,
      CanonicalTraversal.contextAddress_comp, outer.contextDepth,
      CanonicalTraversal.contextAddress, Nat.mul_add]

/-- The terminal EMPTY response is the marked zero-action specialization. -/
theorem empty
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {parents : List ParentFrame} {layers : Nat}
    (outer : CompletedParents program dispatcher parents layers)
    (registers : Registers program) (bits : List Bool) (carrier : Term) :
    CompletedParents program dispatcher
      (SchedulerRootContinuation.emptyContinuationParents program dispatcher
        registers bits carrier parents)
      (layers + 1) := by
  simpa [SchedulerRootContinuation.emptyContinuationParents,
    SchedulerRootContinuation.markedContinuationParents] using
    outer.marked registers false bits carrier

end CompletedParents

end SchedulerCompletedContext

end PureSFormal.PureS
