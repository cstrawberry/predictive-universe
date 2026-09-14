import PureSFormal.Research.RootResetPendingDeletedResponse

/-!
# A finite immediate-parent boundary for designated carrier scans

The nearest parent inside a carrier path has function S, p, or a literal
live prefix. Root, completed-continuation, and pending-FRAME entry contexts
reject this finite set, while Base queue, Local accumulator, live, and
tombstone edges accept it. These facts identify the exact ascent boundary.
-/

namespace PureSFormal.Research.RootResetCarrierScanParentBoundary
open PureSFormal.PureS

/-- Immediate parent functions of Base queues, completed Local accumulators,
and live/tombstone predecessors. -/
def carrierFunction? (term : Term) : Bool :=
  decide (term = .s) || decide (term = p) || decide (term = live false) || decide (term = live true)

def carrierParent? : Option ParentFrame → Bool
  | some (.right fn) => carrierFunction? fn
  | _ => false

theorem carrierFunction_s : carrierFunction? .s = true := by rfl
theorem carrierFunction_p : carrierFunction? p = true := by rfl
theorem carrierFunction_live (bit : Bool) : carrierFunction? (live bit) = true := by
  cases bit <;> rfl

theorem carrierFunction_pending_false (actions : Term) (bits : List Bool) (continuation : Term) :
    carrierFunction? (.app (environmentCode actions bits) continuation) = false := by
  simp [carrierFunction?, environmentCode, dispatcherCode, p, live, b, valueTag, v0, v1]

theorem carrierParent_root : carrierParent? none = false := rfl
theorem carrierParent_left (audit : Term) : carrierParent? (some (.left audit)) = false := rfl

theorem carrierParent_pending (actions : Term) (bits : List Bool) (continuation : Term) :
    carrierParent? (some (.right (.app (environmentCode actions bits) continuation))) = false :=
  carrierFunction_pending_false actions bits continuation

theorem carrierParent_completedContinuation
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program tree term = some view)
    (parents : List ParentFrame) :
    carrierParent? (ContextCursor.frames
      (RootResetReachableStageGrammar.localContinuationContext term) view.continuation parents).head? = false := by
  rcases CheckpointDecoder.parseLocal?_sound parsed with
    ⟨haltField, dispatcher, seedAudit, continuationAudit, halt, dispatch, sourceEq⟩
  rw [sourceEq]
  rfl

theorem carrierParent_pendingParents (actions : Term) (bits : List Bool)
    (continuation : Term) (count : Nat) (parents : List ParentFrame) :
    carrierParent? (PrimitiveFuel.pendingParents (environmentCode actions bits) continuation
      (count + 1) parents).head? = false := by
  induction count generalizing parents with
  | zero => exact carrierFunction_pending_false actions bits continuation
  | succ count ih => exact ih (.right (.app (environmentCode actions bits) continuation) :: parents)

theorem carrierParent_baseQueue (actions : Term) (bits : List Bool)
    (continuation beta queue : Term) (parents : List ParentFrame) :
    carrierParent? (ContextCursor.frames (MutableBase.queueContext actions bits continuation beta) queue parents).head? = true := rfl

theorem carrierParent_live (bit : Bool) (predecessor : Term) (parents : List ParentFrame) :
    carrierParent? (ContextCursor.frames (.appRight (live bit) .hole) predecessor parents).head? = true :=
  carrierFunction_live bit

theorem carrierParent_tombstone (bit : Bool) (audit predecessor : Term) (parents : List ParentFrame) :
    carrierParent? (ContextCursor.frames (CellDeletion.tombstoneContext bit audit .hole) predecessor parents).head? = true := rfl

theorem carrierParent_applyArgs (context : Context) (arguments : List Term) (term : Term)
    (inside : ∀ parents, carrierParent? (ContextCursor.frames context term parents).head? = true)
    (parents : List ParentFrame) :
    carrierParent? (ContextCursor.frames (CanonicalTraversal.applyArgsContext context arguments) term parents).head? = true := by
  induction arguments generalizing context parents with
  | nil => exact inside parents
  | cons argument rest ih =>
      exact ih (.appLeft context argument) (fun parents => inside (.left argument :: parents)) parents

theorem carrierParent_localAccumulator (histories : List Term) (accumulator : Term) (parents : List ParentFrame) :
    carrierParent? (ContextCursor.frames (CanonicalTraversal.actionContext histories) accumulator parents).head? = true := by
  exact carrierParent_applyArgs (.appRight p .hole) histories accumulator (fun _ => rfl) parents

end PureSFormal.Research.RootResetCarrierScanParentBoundary
