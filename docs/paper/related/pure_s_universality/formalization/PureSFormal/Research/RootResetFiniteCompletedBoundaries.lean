import PureSFormal.Research.RootResetGeneratedFreshResponseExecution
import PureSFormal.Research.RootResetFiniteNormalResponseChain

/-! The complete finite selector takes the literal C4 and following FRAME
contractions of each completed normal response, including its last live cell. -/
namespace PureSFormal.Research.RootResetFiniteCompletedBoundaries
open PureSFormal.PureS
open RootResetGeneratedFreshResponseExecution RootResetActivePendingAgreement
open RootResetWrappedFrameSelectorProof RootResetMarkedFrameSelectorProof
open RootResetPersistentResponseSelector (carrierLocalCount? carrierTombstoneCount?)

def BoundarySelections (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation source deleted : Term)
    (remaining : Nat) (parents : List ParentFrame) : Prop :=
  let context := SchedulerInvariant.contextOfParents parents
  RootResetFinitePrioritySelector.selectStep? program dispatcher
    (context.plug (pending (compileActions program dispatcher.tree) bits continuation (remaining + 1) source)) =
    some (context.plug (pending (compileActions program dispatcher.tree) bits continuation (remaining + 1) deleted)) ∧
  RootResetFinitePrioritySelector.selectStep? program dispatcher
    (context.plug (pending (compileActions program dispatcher.tree) bits continuation (remaining + 1) deleted)) =
    some (context.plug (pending (compileActions program dispatcher.tree) bits continuation remaining
      (SchedulerResponseInvariant.frameFirstRoot (compileActions program dispatcher.tree) bits continuation deleted)))

theorem follow_contract {source target : Term} (address : Address) (parents : List ParentFrame) (endpoint : Cursor)
    (followed : RootResetEdgeFragment.follow address ⟨source, parents⟩ = some endpoint)
    (contracts : source.contractAt? address = some target) :
    ∃ after, endpoint.rdx? = some after ∧ after.erase = Cursor.rebuild parents target := by
  induction address generalizing source target parents with
  | nil =>
      have equal := Option.some.inj followed
      subst endpoint
      have root : source.contractRoot? = some target := by
        cases result : source.contractRoot? with
        | none => cases source <;> simp only [Term.contractAt?, Term.subterm?, result] at contracts <;> cases contracts
        | some replacement =>
            have same : replacement = target := by
              cases source <;> simpa only [Term.contractAt?, Term.subterm?, result, Term.replace?, Option.some.injEq] using contracts
            exact congrArg some same
      refine ⟨⟨target, parents⟩, ?_, rfl⟩
      simp only [Cursor.rdx?, root]
  | cons side rest ih =>
      cases source with
      | s => cases side <;> cases followed
      | app fn arg =>
          cases side with
          | left =>
              rw [RootResetEulerWalker.contractAt?_app_left] at contracts
              obtain ⟨next, contracted, shape⟩ := RootResetStageRegistry.optionMap_eq_some contracts
              obtain ⟨after, actual, erased⟩ := ih (.left arg :: parents) followed contracted
              exact ⟨after, actual, shape ▸ erased⟩
          | right =>
              rw [RootResetEulerWalker.contractAt?_app_right] at contracts
              obtain ⟨next, contracted, shape⟩ := RootResetStageRegistry.optionMap_eq_some contracts
              obtain ⟨after, actual, erased⟩ := ih (.right fn :: parents) followed contracted
              exact ⟨after, actual, shape ▸ erased⟩

theorem wrap_last (actions : Term) (bits : List Bool) (continuation source : Term) (remaining : Nat) :
    wrap actions (List.replicate remaining (word bits, continuation) ++ [(word bits, continuation)]) source =
      pending actions bits continuation (remaining + 1) source := by
  rw [← List.replicate_succ']
  exact RootResetFiniteNormalResponseChain.wrap_replicate actions bits continuation (remaining + 1) source

theorem boundaries_of_completed
    {program : CTS.Program} {dispatcher : ActionDispatcher program} {bits : List Bool} {source : Term}
    (horizon jobs : Nat)
    {registers : SchedulerControl.Registers program} {bit : Bool} {suffix : List Bool}
    {outerContext fullContext innerContext targetContext : Context}
    (remaining : Nat) (parents : List ParentFrame) {layers ticks locals : Nat}
    (clean : RootResetCleanTraversableParents.CleanParents program dispatcher parents layers)
    (trace : SchedulerCycle.SelectedResponseTrace program dispatcher bits
      (RootResetEmptyHandoffContext.exitTerm program dispatcher horizon jobs bits) source (Dovetail.clockExit_admissible ..)
      registers bit suffix outerContext fullContext innerContext targetContext
      (PrimitiveFuel.pendingParents (environmentCode (compileActions program dispatcher.tree) bits)
        (RootResetEmptyHandoffContext.exitTerm program dispatcher horizon jobs bits) remaining parents) ticks)
    {view : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program dispatcher.tree source = some view)
    (fresh : view.status = .fresh)
    (continuation : view.continuation = RootResetEmptyHandoffContext.exitTerm program dispatcher horizon jobs bits)
    (normal : RootResetOrderedCarrier.NormalInvariant program dispatcher.tree bits
      (RootResetEmptyHandoffContext.exitTerm program dispatcher horizon jobs bits) source registers.phase (bit :: suffix) (locals + 1)) :
    BoundarySelections program dispatcher bits (RootResetEmptyHandoffContext.exitTerm program dispatcher horizon jobs bits)
      source (SchedulerCycle.deletedCarrier bit outerContext innerContext) remaining parents := by
  let actions := compileActions program dispatcher.tree
  let exit := RootResetEmptyHandoffContext.exitTerm program dispatcher horizon jobs bits
  let pendingLayers := List.replicate remaining (word bits, exit)
  let allParents := .right (.app (CheckpointDecoder.openEnvironment actions (word bits)) exit) :: parentsAfter actions pendingLayers parents
  have admissible := Dovetail.clockExit_admissible horizon jobs (environmentCode actions bits)
  have path := RootResetCarrierChronologyPreservation.descent_pathDecodes admissible trace.sourceDescent
  have accPath := path_local_accumulator path parsed
  have noBase := CheckpointRun.parseBase?_none_of_localShape (CheckpointDecoder.parseLocal?_sound parsed)
  have localCount : carrierLocalCount? program dispatcher.tree view.accumulator = some locals := by
    have counted := normal.locals
    rw [RootResetPersistentResponseSelector.carrierLocalCount?, noBase, parsed] at counted
    exact RootResetCompletedFrontPreservation.map_succ_injective counted
  have tombCount : carrierTombstoneCount? program dispatcher.tree view.accumulator = some (locals + 1) := by
    have counted := normal.tombstones
    rw [RootResetPersistentResponseSelector.carrierTombstoneCount?, noBase, parsed] at counted
    exact counted
  obtain ⟨address, endpoint, selectedAddress, followed, executed⟩ := pending_parsed_c4 clean pendingLayers (word bits) exit source view
    parsed fresh horizon jobs bits continuation bit suffix accPath locals localCount tombCount
  have wholeAddress := RootResetSelectedFrontParserAgreement.firstLiveAddress?_ofSelectedFront admissible trace.selected
  have noCell := RootResetSelectedFrontParserAgreement.parseCell?_none_of_headArity_five_or_six (CheckpointDecoder.parseLocal?_headArity parsed)
  rw [RootResetSelectedFrontParserAgreement.firstLiveAddress?, dif_pos noCell, noBase, parsed] at wholeAddress
  dsimp only at wholeAddress
  rw [selectedAddress] at wholeAddress
  have addressEq := Option.some.inj wholeAddress
  change RootResetResponseBoundaryStages.localAccumulatorAddress view ++ address = CanonicalTraversal.contextAddress outerContext at addressEq
  obtain ⟨_, _, certificate⟩ := SchedulerAscent.selectedFront_deleteAtPath trace.selected trace.sourceDescent trace.path
  have contracts : source.contractAt? (CanonicalTraversal.contextAddress outerContext) =
      some (SchedulerCycle.deletedCarrier bit outerContext innerContext) := by
    rw [Term.contractAt?, certificate.selected_subterm]
    exact certificate.endpoint_replace
  rw [addressEq] at followed
  obtain ⟨after, contracted, erased⟩ := follow_contract _ allParents endpoint followed contracts
  obtain ⟨foundAfter, foundContract, c4⟩ := pass_selected program dispatcher _ endpoint executed
  have equal := Option.some.inj (foundContract.symm.trans contracted)
  subst foundAfter
  rw [erased] at c4
  have parentsEq : allParents = PrimitiveFuel.pendingParents (environmentCode actions bits) exit (remaining + 1) parents := by
    dsimp only [allParents, pendingLayers]
    rw [RootResetBaseEndpointExecution.parents_replicate, CheckpointDecoder.openEnvironment_word]
    exact (SchedulerCycle.pendingParents_succ_cons _ _ remaining parents).symm
  rw [parentsEq, pending_rebuild_under_parents] at c4
  have handoff := selected_response_handoff clean pendingLayers (word bits) exit horizon jobs bits parsed fresh continuation trace normal
  obtain ⟨handoffAfter, _, handoffContract, handoffSelected⟩ := handoff
  have handoffEq : handoffAfter =
      ⟨SchedulerResponseInvariant.frameFirstRoot actions bits exit (SchedulerCycle.deletedCarrier bit outerContext innerContext),
        parentsAfter actions pendingLayers parents⟩ := Option.some.inj handoffContract.symm
  rw [handoffEq] at handoffSelected
  change RootResetFinitePrioritySelector.selectStep? _ _ _ = some (Cursor.rebuild (parentsAfter actions pendingLayers parents) _) at handoffSelected
  rw [RootResetBaseEndpointExecution.parents_replicate, CheckpointDecoder.openEnvironment_word, pending_rebuild_under_parents] at handoffSelected
  constructor
  · simpa only [pendingLayers, wrap_last, SchedulerInvariant.contextOfParents_plug] using c4
  · simpa only [pendingLayers, wrap_last, SchedulerInvariant.contextOfParents_plug] using handoffSelected

theorem completed_commit_erase (bits : List Bool) (continuation carrier dispatch : Term)
    (parents : List ParentFrame) (endpoint after : Cursor)
    (followed : RootResetEdgeFragment.follow [.left, .left, .left]
      ⟨LocalResponse.completed bits continuation carrier dispatch, parents⟩ = some endpoint)
    (contracted : endpoint.rdx? = some after) :
    after.erase = Cursor.rebuild parents (LocalResponse.markedCompleted bits continuation carrier dispatch) := by
  have contracts : (LocalResponse.completed bits continuation carrier dispatch).contractAt? [.left, .left, .left] =
      some (LocalResponse.markedCompleted bits continuation carrier dispatch) := rfl
  obtain ⟨found, actual, erased⟩ := follow_contract _ parents endpoint followed contracts
  have equal := Option.some.inj (actual.symm.trans contracted)
  exact equal ▸ erased

theorem selected_response_commit
    {program : CTS.Program} {dispatcher : ActionDispatcher program} {bits : List Bool} {source : Term}
    (horizon jobs remaining : Nat) (parents : List ParentFrame) {layers : Nat}
    (clean : RootResetCleanTraversableParents.CleanParents program dispatcher parents layers)
    {registers : SchedulerControl.Registers program} {bit : Bool} {suffix : List Bool}
    {outerContext fullContext innerContext targetContext : Context} {traceParents : List ParentFrame} {ticks count : Nat}
    (trace : SchedulerCycle.SelectedResponseTrace program dispatcher bits
      (RootResetEmptyHandoffContext.exitTerm program dispatcher horizon jobs bits) source (Dovetail.clockExit_admissible ..)
      registers bit suffix outerContext fullContext innerContext targetContext traceParents ticks)
    (normal : RootResetOrderedCarrier.NormalInvariant program dispatcher.tree bits
      (RootResetEmptyHandoffContext.exitTerm program dispatcher horizon jobs bits) source registers.phase (bit :: suffix) count)
    (output : (CTS.absorbingStep program ⟨registers.phase, bit :: suffix⟩).data = []) :
    let continuation := RootResetEmptyHandoffContext.exitTerm program dispatcher horizon jobs bits
    let finalRegisters := SchedulerCycle.scannedRegisters registers bit suffix
    let carrier := SchedulerCycle.deletedCarrier bit outerContext innerContext
    let allParents := PrimitiveFuel.pendingParents (environmentCode (compileActions program dispatcher.tree) bits) continuation remaining parents
    RootResetFinitePrioritySelector.selectStep? program dispatcher
      (Cursor.rebuild allParents (LocalResponse.completed bits continuation carrier
        (SchedulerResponse.completedRoute program dispatcher finalRegisters bit carrier))) =
      some (Cursor.rebuild allParents (LocalResponse.markedCompleted bits continuation carrier
        (SchedulerResponse.completedRoute program dispatcher finalRegisters bit carrier))) := by
  dsimp only
  let actions := compileActions program dispatcher.tree
  let exit := RootResetEmptyHandoffContext.exitTerm program dispatcher horizon jobs bits
  let carrier := SchedulerCycle.deletedCarrier bit outerContext innerContext
  let dispatch := SchedulerResponse.completedRoute program dispatcher (SchedulerCycle.scannedRegisters registers bit suffix) bit carrier
  cases remaining with
  | zero =>
      obtain ⟨endpoint, after, followed, contracted, selected⟩ := selected_response_nonpending_commit clean horizon jobs bits trace normal output
      rw [completed_commit_erase bits exit carrier dispatch parents endpoint after followed contracted] at selected
      exact selected
  | succ remaining =>
      let pendingLayers := List.replicate remaining (word bits, exit)
      let allParents := .right (.app (CheckpointDecoder.openEnvironment actions (word bits)) exit) :: parentsAfter actions pendingLayers parents
      obtain ⟨endpoint, followed, _, after, contracted, selected⟩ := selected_response_pending_commit clean pendingLayers (word bits) exit horizon jobs bits trace normal output
      rw [completed_commit_erase bits exit carrier dispatch allParents endpoint after followed contracted] at selected
      have parentsEq : allParents = PrimitiveFuel.pendingParents (environmentCode actions bits) exit (remaining + 1) parents := by
        dsimp only [allParents, pendingLayers]
        rw [RootResetBaseEndpointExecution.parents_replicate, CheckpointDecoder.openEnvironment_word]
        exact (SchedulerCycle.pendingParents_succ_cons _ _ remaining parents).symm
      rw [parentsEq] at selected
      rw [pending_rebuild_under_parents, SchedulerInvariant.contextOfParents_plug]
      simpa only [pendingLayers, wrap_last] using selected

end PureSFormal.Research.RootResetFiniteCompletedBoundaries
