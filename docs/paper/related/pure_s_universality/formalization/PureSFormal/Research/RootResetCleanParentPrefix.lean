import PureSFormal.Research.RootResetCleanTraversableParents
import PureSFormal.Research.RootResetMixedResponseContext

/-! The generated parent invariant constructs the exact term-only prefix. -/
namespace PureSFormal.Research.RootResetCleanParentPrefix

open PureSFormal.PureS
open RootResetCleanTraversableParents RootResetMixedResponseContext
open RootResetReachableStageGrammar

theorem append
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {whole middle endpoint : Term} {outerContext innerContext : Context}
    {outerRoles innerRoles : List RootResetPersistentRouteA.Role}
    {outerHistory innerHistory : List (CheckpointDecoder.LocalView program)}
    (outer : Prefix program dispatcher whole middle outerContext outerRoles outerHistory)
    (inner : Prefix program dispatcher middle endpoint innerContext innerRoles innerHistory) :
    Prefix program dispatcher whole endpoint (outerContext.comp innerContext)
      (outerRoles ++ innerRoles) (outerHistory ++ innerHistory) := by
  induction outer with
  | here term => exact inner
  | fresh parsed status nonempty clean previous ih =>
      simpa only [List.cons_append,
        RootResetRuntimeContextBridge.context_comp_assoc] using
        Prefix.fresh parsed status nonempty clean (ih inner)
  | marked parsed status previous ih =>
      simpa only [List.cons_append,
        RootResetRuntimeContextBridge.context_comp_assoc] using
        Prefix.marked parsed status (ih inner)

theorem toPrefix
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {parents : List ParentFrame} {layers : Nat}
    (outer : CleanParents program dispatcher parents layers)
    (endpoint : Term) :
    ∃ roles history, Prefix program dispatcher (Cursor.rebuild parents endpoint)
      endpoint (SchedulerInvariant.contextOfParents parents) roles history := by
  induction outer generalizing endpoint with
  | root => exact ⟨[], [], .here endpoint⟩
  | @fresh parents layers outer registers bit bits carrier nonempty clean ih =>
      let localTerm := LocalResponse.completed bits endpoint carrier
        (SchedulerResponse.completedRoute program dispatcher registers bit carrier)
      have parsed := RootResetTraversableCompletedParents.TraversableParents.parseLocal?_fresh
        program dispatcher registers bit bits endpoint carrier
      have localPrefix := Prefix.fresh parsed rfl nonempty clean (.here endpoint)
      obtain ⟨roles, history, previous⟩ := ih localTerm
      have combined := append previous localPrefix
      refine ⟨roles ++ [.freshNonemptyContinuation], history ++
        [CheckpointDecoder.completedView program (dispatcher.route (registers.phase, bit))
          (registers.phase, bit) (actionAccumulator program (registers.phase, bit) carrier)
          bits endpoint], ?_⟩
      rw [SchedulerCompletedContext.CompletedParents.rebuild_freshContinuationParents]
      have contextEq : SchedulerInvariant.contextOfParents
          (SchedulerRootContinuation.freshContinuationParents program dispatcher
            registers bit bits carrier parents) =
          (SchedulerInvariant.contextOfParents parents).comp
            ((localContinuationContext localTerm).comp .hole) := by
        change ((SchedulerInvariant.contextOfParents parents).comp
          (.appRight (SchedulerResponse.localContinuationLeft bits (freshHField carrier)
            (SchedulerResponse.completedRoute program dispatcher registers bit carrier) carrier) .hole)).comp
          (.appLeft .hole carrier) = _
        rw [RootResetRuntimeContextBridge.context_comp_assoc]
        rfl
      rw [contextEq]
      exact combined
  | @marked parents layers outer registers bit bits carrier ih =>
      let localTerm := LocalResponse.markedCompleted bits endpoint carrier
        (SchedulerResponse.completedRoute program dispatcher registers bit carrier)
      have parsed := CheckpointDecoder.parseLocal?_markedCompleted (continuation := endpoint) bits
        (SchedulerResponse.completedRoute_snapshotDispatch program dispatcher registers bit carrier)
      have localPrefix := Prefix.marked parsed rfl (.here endpoint)
      obtain ⟨roles, history, previous⟩ := ih localTerm
      have combined := append previous localPrefix
      refine ⟨roles ++ [.markedContinuation], history ++
        [CheckpointDecoder.markedCompletedView program (dispatcher.route (registers.phase, bit))
          (registers.phase, bit) (actionAccumulator program (registers.phase, bit) carrier)
          bits endpoint], ?_⟩
      rw [SchedulerCompletedContext.CompletedParents.rebuild_markedContinuationParents]
      have contextEq : SchedulerInvariant.contextOfParents
          (SchedulerRootContinuation.markedContinuationParents program dispatcher
            registers bit bits carrier parents) =
          (SchedulerInvariant.contextOfParents parents).comp
            ((localContinuationContext localTerm).comp .hole) := by
        change ((SchedulerInvariant.contextOfParents parents).comp
          (.appRight (SchedulerResponse.localContinuationLeft bits
            (Carrier.markedHField carrier carrier)
            (SchedulerResponse.completedRoute program dispatcher registers bit carrier) carrier) .hole)).comp
          (.appLeft .hole carrier) = _
        rw [RootResetRuntimeContextBridge.context_comp_assoc]
        rfl
      rw [contextEq]
      exact combined

end PureSFormal.Research.RootResetCleanParentPrefix
