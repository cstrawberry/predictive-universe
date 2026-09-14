import PureSFormal.Research.RootResetGeneratedFreshResponseExecution

/-! The absorbing EMPTY response over a marked carrier selects COMMIT.
The provenance query stops at that marked carrier, independent of the number
of previous EMPTY responses and independently of global count parity. -/
namespace PureSFormal.Research.RootResetMarkedEmptyCommitAgreement
open PureSFormal.PureS
open FiniteController RootResetCompletedResponseAgreement
open RootResetActivePendingAgreement RootResetGeneratedFreshResponseExecution

theorem generated_local (program : CTS.Program) (layout : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bits : List Bool) (continuation carrier : Term)
    (view : CheckpointDecoder.LocalView program)
    (parsed : CheckpointDecoder.parseLocal? program layout.tree carrier = some view)
    (marked : view.status = .marked)
    (empty : CheckpointDecoder.decodeCarrier? program layout.tree carrier = some [])
    (parents : List ParentFrame)
    (boundary : RootResetCompleteCarrierRows.Boundary
      ⟨LocalResponse.completed bits continuation carrier (SchedulerResponse.completedRoute program layout registers false carrier), parents⟩) :
    let source := LocalResponse.completed bits continuation carrier (SchedulerResponse.completedRoute program layout registers false carrier)
    ∃ endpoint, RootResetEdgeFragment.follow [.left, .left, .left] ⟨source, parents⟩ = some endpoint ∧
      Executes (RootResetEmptyAwareResponseProbe.worker program layout.tree) ⟨source, parents⟩ true endpoint := by
  dsimp only
  let source := LocalResponse.completed bits continuation carrier (SchedulerResponse.completedRoute program layout registers false carrier)
  let origin : Cursor := ⟨source, parents⟩
  have freshParsed := RootResetTraversableCompletedParents.TraversableParents.parseLocal?_fresh program layout registers false bits continuation carrier
  have reads := RootResetEmptyOriginProbe.Reads.local freshParsed rfl (RootResetEmptyOriginProbe.Reads.marked parsed marked)
  obtain ⟨originTicks, originState, _, originRun, originAnswer⟩ := reads.generated_runs origin rfl boundary
  have decoded := RootResetDecodedCarrierNonemptyAgreement.decoded_value (CheckpointDecoder.decodeCarrier?_sound program layout.tree empty)
  have value := RootResetCarrierNonemptyAgreement.ReadValue.local freshParsed decoded
  obtain ⟨emptyTicks, descended, _, emptyRun, walked⟩ := RootResetCarrierInverseUnique.all_input_restores program layout.tree origin boundary.1
  rw [value.walks walked rfl] at emptyRun
  have emptyQuery : Executes (RootResetCompletedResponseProbe.nonemptyWorker program layout.tree) origin false origin :=
    ⟨emptyTicks, .done false, emptyRun, rfl⟩
  obtain ⟨endpoint, followed⟩ := commit_follow freshParsed parents
  obtain ⟨commitTicks, commitState, _, commitRun, commitAnswer⟩ := RootResetCompletedResponseAtoms.commit_generated freshParsed rfl origin endpoint rfl followed
  exact ⟨endpoint, followed, RootResetEmptyAwareResponseAgreement.empty_commit freshParsed rfl origin endpoint rfl
    emptyQuery ⟨originTicks, originState, originRun, originAnswer⟩ ⟨commitTicks, commitState, commitRun, commitAnswer⟩⟩

theorem generated_pending {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {history : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents history)
    (layers : List Layer) (payload next : Term)
    (registers : SchedulerControl.Registers program) (bits : List Bool) (horizon remaining : Nat) (carrier : Term)
    (view : CheckpointDecoder.LocalView program)
    (parsed : CheckpointDecoder.parseLocal? program layout.tree carrier = some view)
    (marked : view.status = .marked)
    (empty : CheckpointDecoder.decodeCarrier? program layout.tree carrier = some []) :
    let continuation := RootResetEmptyHandoffContext.exitTerm program layout horizon remaining bits
    let source := LocalResponse.completed bits continuation carrier (SchedulerResponse.completedRoute program layout registers false carrier)
    let sourceParents := .right (.app (CheckpointDecoder.openEnvironment (compileActions program layout.tree) payload) next) ::
      parentsAfter (compileActions program layout.tree) layers parents
    ∃ endpoint after, RootResetEdgeFragment.follow [.left, .left, .left] ⟨source, sourceParents⟩ = some endpoint ∧
      Executes (RootResetFreshResponsePass.worker program layout.tree)
        (Cursor.atRoot (Cursor.rebuild parents (wrap (compileActions program layout.tree) (layers ++ [(payload, next)]) source))) true endpoint ∧
      endpoint.rdx? = some after ∧ RootResetFinitePrioritySelector.selectStep? program layout
        (Cursor.rebuild parents (wrap (compileActions program layout.tree) (layers ++ [(payload, next)]) source)) = some after.erase := by
  dsimp only
  let continuation := RootResetEmptyHandoffContext.exitTerm program layout horizon remaining bits
  let source := LocalResponse.completed bits continuation carrier (SchedulerResponse.completedRoute program layout registers false carrier)
  let sourceParents := .right (.app (CheckpointDecoder.openEnvironment (compileActions program layout.tree) payload) next) ::
    parentsAfter (compileActions program layout.tree) layers parents
  obtain ⟨endpoint, followed, selected⟩ := generated_local program layout registers bits continuation carrier view parsed marked empty sourceParents
    (RootResetCompleteCarrierRows.pending_boundary ..)
  have freshParsed := RootResetTraversableCompletedParents.TraversableParents.parseLocal?_fresh program layout registers false bits continuation carrier
  have actual := pending_parsed_forwarded outer layers payload next source _ freshParsed rfl [] empty horizon remaining bits rfl endpoint selected
  obtain ⟨after, contracted, fullSelected⟩ := pass_selected program layout _ endpoint actual
  exact ⟨endpoint, after, followed, actual, contracted, fullSelected⟩

theorem emptySweepCarrier_marked (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (continuation : Term) (count : Nat) (registers : SchedulerControl.Registers program) (carrier : Term)
    (initial : ∃ view, CheckpointDecoder.parseLocal? program layout.tree carrier = some view ∧ view.status = .marked) :
    ∃ view, CheckpointDecoder.parseLocal? program layout.tree
      (SchedulerCycle.emptySweepCarrier program layout bits continuation count registers carrier) = some view ∧ view.status = .marked := by
  induction count generalizing registers carrier with
  | zero => exact initial
  | succ count ih =>
      apply ih registers.advanceEmpty _
      exact ⟨_, CheckpointDecoder.parseLocal?_markedCompleted bits
        (SchedulerResponse.completedRoute_snapshotDispatch program layout registers false carrier), rfl⟩

theorem generated_sweep {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {history : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents history)
    (layers : List Layer) (payload next : Term)
    (registers : SchedulerControl.Registers program) (bits : List Bool) (horizon remaining count : Nat) (carrier : Term)
    (initial : ∃ view, CheckpointDecoder.parseLocal? program layout.tree carrier = some view ∧ view.status = .marked)
    (decoded : CarrierDecoder.decode? program layout.tree bits
      (RootResetEmptyHandoffContext.exitTerm program layout horizon remaining bits) (Dovetail.clockExit_admissible ..) carrier = some []) :
    let continuation := RootResetEmptyHandoffContext.exitTerm program layout horizon remaining bits
    let current := SchedulerCycle.emptySweepCarrier program layout bits continuation count registers carrier
    let currentRegisters := SchedulerCycle.emptySweepRegisters program count registers
    let source := LocalResponse.completed bits continuation current (SchedulerResponse.completedRoute program layout currentRegisters false current)
    let sourceParents := .right (.app (CheckpointDecoder.openEnvironment (compileActions program layout.tree) payload) next) ::
      parentsAfter (compileActions program layout.tree) layers parents
    ∃ endpoint after, RootResetEdgeFragment.follow [.left, .left, .left] ⟨source, sourceParents⟩ = some endpoint ∧
      Executes (RootResetFreshResponsePass.worker program layout.tree)
        (Cursor.atRoot (Cursor.rebuild parents (wrap (compileActions program layout.tree) (layers ++ [(payload, next)]) source))) true endpoint ∧
      endpoint.rdx? = some after ∧ RootResetFinitePrioritySelector.selectStep? program layout
        (Cursor.rebuild parents (wrap (compileActions program layout.tree) (layers ++ [(payload, next)]) source)) = some after.erase := by
  dsimp only
  obtain ⟨view, parsed, marked⟩ := emptySweepCarrier_marked program layout bits _ count registers carrier initial
  have empty := SchedulerNestedEmpty.emptySweepCarrier_decode_of program layout bits _ (Dovetail.clockExit_admissible ..)
    count registers carrier decoded
  have publicDecoded := CheckpointRun.decodeCarrier?_of_decode program layout.tree bits _ (Dovetail.clockExit_admissible ..) empty
  exact generated_pending outer layers payload next (SchedulerCycle.emptySweepRegisters program count registers) bits horizon remaining _ view parsed marked publicDecoded

end PureSFormal.Research.RootResetMarkedEmptyCommitAgreement
