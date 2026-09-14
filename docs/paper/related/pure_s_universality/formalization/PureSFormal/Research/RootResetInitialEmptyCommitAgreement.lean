import PureSFormal.Research.RootResetEmptyAwareResponseAgreement
import PureSFormal.Research.RootResetGeneratedFreshResponseExecution

/-! Exact COMMIT for an empty response, including the first empty Base
and every marked EMPTY predecessor. Both classifiers are actual finite runs. -/
namespace PureSFormal.Research.RootResetInitialEmptyCommitAgreement
open PureSFormal.PureS
open FiniteController RootResetCompletedResponseAgreement RootResetCompletedResponseAtoms
open RootResetActivePendingAgreement RootResetActiveCleanParentsAgreement

theorem local_commit {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term} {view : CheckpointDecoder.LocalView program}
    (admissible : Carrier.Admissible continuation) (parsed : CheckpointDecoder.parseLocal? program tree source = some view)
    (fresh : view.status = .fresh) (path : CarrierDecoder.PathDecodes program tree bits continuation view.accumulator [])
    (emptyOrigin : RootResetEmptyOriginProbe.Reads program tree view.accumulator none)
    (origin endpoint : Cursor) (atSource : origin.focus = source) (boundary : RootResetCompleteCarrierRows.Boundary origin)
    (followed : RootResetEdgeFragment.follow [.left, .left, .left] origin = some endpoint) :
    Executes (RootResetEmptyAwareResponseProbe.worker program tree) origin true endpoint := by
  have empty := RootResetCompletedResponseAgreement.nonempty_local admissible parsed path origin atSource boundary
  obtain ⟨queryTicks, queryState, _, queryRun, queryAnswer⟩ :=
    (RootResetEmptyOriginProbe.Reads.local parsed fresh emptyOrigin).generated_runs origin atSource boundary
  obtain ⟨commitTicks, commitState, _, commitRun, commitAnswer⟩ := commit_generated parsed fresh origin endpoint atSource followed
  exact RootResetEmptyAwareResponseAgreement.empty_commit parsed fresh origin endpoint atSource empty
    ⟨queryTicks, queryState, queryRun, queryAnswer⟩ ⟨commitTicks, commitState, commitRun, commitAnswer⟩

def commitCursor (bits : List Bool) (continuation carrier dispatch : Term) (parents : List ParentFrame) : Cursor :=
  ⟨freshHField carrier, .left dispatch :: .left (.app (seedCode bits) carrier) :: .left (.app continuation carrier) :: parents⟩

theorem generated_local {program : CTS.Program} (layout : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bits : List Bool) (continuation carrier : Term)
    (admissible : Carrier.Admissible continuation)
    (path : CarrierDecoder.PathDecodes program layout.tree bits continuation carrier [])
    (emptyOrigin : RootResetEmptyOriginProbe.Reads program layout.tree carrier none)
    (parents : List ParentFrame)
    (boundary : RootResetCompleteCarrierRows.Boundary
      ⟨LocalResponse.completed bits continuation carrier (SchedulerResponse.completedRoute program layout registers false carrier), parents⟩) :
    Executes (RootResetEmptyAwareResponseProbe.worker program layout.tree)
      ⟨LocalResponse.completed bits continuation carrier (SchedulerResponse.completedRoute program layout registers false carrier), parents⟩ true
      (commitCursor bits continuation carrier (SchedulerResponse.completedRoute program layout registers false carrier) parents) := by
  have parsed := CheckpointDecoder.parseLocal?_completed (continuation := continuation) bits
    (SchedulerResponse.completedRoute_snapshotDispatch program layout registers false carrier)
  exact local_commit admissible parsed rfl path emptyOrigin _ _ rfl boundary rfl

theorem generated_pending {program : CTS.Program} (layout : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bits : List Bool) (continuation carrier : Term)
    (admissible : Carrier.Admissible continuation)
    (path : CarrierDecoder.PathDecodes program layout.tree bits continuation carrier [])
    (emptyOrigin : RootResetEmptyOriginProbe.Reads program layout.tree carrier none)
    (actions payload next : Term) (parents : List ParentFrame) :
    let localParents := .right (.app (CheckpointDecoder.openEnvironment actions payload) next) :: parents
    Executes (RootResetEmptyAwareResponseProbe.worker program layout.tree)
      ⟨LocalResponse.completed bits continuation carrier (SchedulerResponse.completedRoute program layout registers false carrier), localParents⟩ true
      (commitCursor bits continuation carrier (SchedulerResponse.completedRoute program layout registers false carrier) localParents) :=
  generated_local layout registers bits continuation carrier admissible path emptyOrigin _ (RootResetCompleteCarrierRows.pending_boundary ..)

theorem initial_empty (program : CTS.Program) (layout : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (continuation : Term) (admissible : Carrier.Admissible continuation)
    (actions payload next : Term) (parents : List ParentFrame) :
    let carrier := baseCarrier (environmentCode (compileActions program layout.tree) []) continuation
    let localParents := .right (.app (CheckpointDecoder.openEnvironment actions payload) next) :: parents
    Executes (RootResetEmptyAwareResponseProbe.worker program layout.tree)
      ⟨LocalResponse.completed [] continuation carrier (SchedulerResponse.completedRoute program layout registers false carrier), localParents⟩ true
      (commitCursor [] continuation carrier (SchedulerResponse.completedRoute program layout registers false carrier) localParents) :=
  generated_pending layout registers [] continuation _ admissible
    (.root (.base omega (baseBeta (environmentCode (compileActions program layout.tree) []) continuation) .omega))
    (RootResetEmptyOriginProbe.Reads.empty_base program layout.tree continuation (word [])
      (baseBeta (environmentCode (compileActions program layout.tree) []) continuation)) actions payload next parents

theorem cleanParents_incoming {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {count : Nat} (outer : RootResetCleanTraversableParents.CleanParents program layout parents count)
    (source : Term) : Probe.observeIncoming ⟨source, parents⟩ ≠ .right := by
  cases outer <;> intro impossible <;> cases impossible

theorem cleanParents_boundary {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {count : Nat} (outer : RootResetCleanTraversableParents.CleanParents program layout parents count)
    (source : Term) : RootResetCompleteCarrierRows.Boundary ⟨source, parents⟩ := by
  cases outer
  · exact RootResetCompleteCarrierRows.root_boundary source
  · exact RootResetCompleteCarrierRows.left_boundary ..
  · exact RootResetCompleteCarrierRows.left_boundary ..

theorem fresh_pass {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {count : Nat} (outer : RootResetCleanTraversableParents.CleanParents program layout parents count)
    (layers : List Layer) (registers : SchedulerControl.Registers program) (bits : List Bool) (horizon remaining : Nat) (carrier : Term)
    (path : CarrierDecoder.PathDecodes program layout.tree bits (RootResetEmptyHandoffContext.exitTerm program layout horizon remaining bits) carrier [])
    (emptyOrigin : RootResetEmptyOriginProbe.Reads program layout.tree carrier none) :
    let continuation := RootResetEmptyHandoffContext.exitTerm program layout horizon remaining bits
    let dispatch := SchedulerResponse.completedRoute program layout registers false carrier
    let source := LocalResponse.completed bits continuation carrier dispatch
    Executes (RootResetFreshResponsePass.worker program layout.tree)
      (Cursor.atRoot (Cursor.rebuild parents (wrap (compileActions program layout.tree) layers source))) true
      (commitCursor bits continuation carrier dispatch (parentsAfter (compileActions program layout.tree) layers parents)) := by
  let continuation := RootResetEmptyHandoffContext.exitTerm program layout horizon remaining bits
  let dispatch := SchedulerResponse.completedRoute program layout registers false carrier
  let source := LocalResponse.completed bits continuation carrier dispatch
  have admissible : Carrier.Admissible continuation := Dovetail.clockExit_admissible ..
  have parsed := CheckpointDecoder.parseLocal?_completed (continuation := continuation) bits
    (SchedulerResponse.completedRoute_snapshotDispatch program layout registers false carrier)
  have decoded := RootResetGeneratedFreshResponseExecution.public_decode_of_path admissible path
  rcases List.eq_nil_or_concat layers with rfl | ⟨layers, layer, equal⟩
  ·
      obtain ⟨candidateTicks, candidateRun⟩ := RootResetGeneratedFreshResponseExecution.candidate_parsed_fresh outer [] source _ parsed rfl [] decoded horizon remaining bits rfl
      obtain ⟨ticks, _, actual⟩ := RootResetCompletedResponseAgreement.nonpending_commit admissible parsed rfl path
        ⟨source, parents⟩ (commitCursor bits continuation carrier dispatch parents) rfl
        (cleanParents_boundary outer source) rfl
      have checkedRun := RootResetFreshResponseExecution.nonpending_forwarded program layout.tree _ _ true
        (cleanParents_incoming outer source) ⟨ticks, .done true, actual, rfl⟩
      exact RootResetFreshResponseExecution.candidate_forwarded program layout.tree _ _ _ candidateTicks true candidateRun checkedRun
  · rw [equal, List.concat_eq_append]
    rcases layer with ⟨payload, next⟩
    have selected := generated_pending layout registers bits continuation carrier admissible path emptyOrigin
      (compileActions program layout.tree) payload next (parentsAfter (compileActions program layout.tree) layers parents)
    have passed := RootResetGeneratedFreshResponseExecution.pending_parsed_forwarded outer layers payload next source _ parsed rfl [] decoded
      horizon remaining bits rfl _ selected
    rw [RootResetGeneratedFreshResponseExecution.parentsAfter_last]
    exact passed

theorem selectStep?_completed_empty {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {count : Nat} (outer : RootResetCleanTraversableParents.CleanParents program layout parents count)
    (layers : List Layer) (registers : SchedulerControl.Registers program) (bits : List Bool) (horizon remaining : Nat) (carrier : Term)
    (path : CarrierDecoder.PathDecodes program layout.tree bits (RootResetEmptyHandoffContext.exitTerm program layout horizon remaining bits) carrier [])
    (emptyOrigin : RootResetEmptyOriginProbe.Reads program layout.tree carrier none) :
    let continuation := RootResetEmptyHandoffContext.exitTerm program layout horizon remaining bits
    let dispatch := SchedulerResponse.completedRoute program layout registers false carrier
    RootResetFinitePrioritySelector.selectStep? program layout
      (Cursor.rebuild parents (wrap (compileActions program layout.tree) layers (LocalResponse.completed bits continuation carrier dispatch))) =
      some (Cursor.rebuild parents (wrap (compileActions program layout.tree) layers (LocalResponse.markedCompleted bits continuation carrier dispatch))) := by
  obtain ⟨ticks, state, execution, answered⟩ := fresh_pass outer layers registers bits horizon remaining carrier path emptyOrigin
  have selected := RootResetFinitePriorityExecution.fresh_selected program layout _ ticks state _ _ execution answered rfl
  change _ = some (Cursor.rebuild (parentsAfter (compileActions program layout.tree) layers parents)
    (LocalResponse.markedCompleted bits (RootResetEmptyHandoffContext.exitTerm program layout horizon remaining bits) carrier
      (SchedulerResponse.completedRoute program layout registers false carrier))) at selected
  rw [RootResetFrameSpineWalker.rebuild_spineParents] at selected
  exact selected

end PureSFormal.Research.RootResetInitialEmptyCommitAgreement
