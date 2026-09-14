import PureSFormal.Research.RootResetFinitePriorityAgreement

/-! Both historical priority passes decline a clear active endpoint. -/
namespace PureSFormal.Research.RootResetHistoricalPriorityRejection
open PureSFormal.PureS
open FiniteController RootResetActivePendingAgreement

def Clear (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (source : Term) : Prop :=
  RootResetCompletedLocalPatterns.accepts .marked program tree source = false ∧
    ∀ audit, RootResetCompletedLocalPatterns.accepts .marked program tree (.app source audit) = false

theorem fresh_clear (program : CTS.Program) (layout : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool) (bits : List Bool) (continuation carrier : Term) :
    Clear program layout.tree (LocalResponse.completed bits continuation carrier
      (SchedulerResponse.completedRoute program layout registers bit carrier)) := by
  refine ⟨RootResetMarkedHandoffAgreement.marked_rejects_arity (by change 6 ≠ 5; decide), ?_⟩
  intro audit
  exact RootResetMarkedHandoffAgreement.marked_rejects_arity (by change 7 ≠ 5; decide)

theorem wrapped_clear {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    (layers : List Layer) {body : Term} (clear : Clear program tree body) :
    Clear program tree (wrap (compileActions program tree) layers body) := by
  cases layers with
  | nil => exact clear
  | cons layer layers =>
      refine ⟨RootResetMarkedHandoffAgreement.marked_rejects_arity (by change 3 ≠ 5; decide), ?_⟩
      intro audit
      exact RootResetMarkedHandoffAgreement.marked_rejects_arity (by change 4 ≠ 5; decide)

def Declined (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (found : Bool) (candidate : Cursor) : Prop :=
  if found then ∃ endpoint, RootResetPendingAncestorProbe.First program tree candidate false endpoint else True

theorem cleanParents_search {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {layers : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents layers) (source : Term)
    (clear : Clear program layout.tree source) :
    ∃ found candidate, RootResetMarkedAncestorProbe.First program layout.tree ⟨source, parents⟩ found candidate ∧
      Declined program layout.tree found candidate := by
  induction outer generalizing source with
  | root => exact ⟨false, _, .root source clear.1, trivial⟩
  | @fresh parents layers outer registers bit bits carrier nonempty clean ih =>
      obtain ⟨found, candidate, search, declined⟩ := ih _ (fresh_clear program layout registers bit bits source carrier)
      exact ⟨found, candidate, .parent source (.left carrier) _ clear.1 (.parent _ _ _ (clear.2 carrier) search), declined⟩
  | @marked parents layers outer registers bit bits carrier ih =>
      have parsed := CheckpointDecoder.parseLocal?_markedCompleted (continuation := source) bits
        (SchedulerResponse.completedRoute_snapshotDispatch program layout registers bit carrier)
      refine ⟨true, _, .parent source (.left carrier) _ clear.1 (.parent _ _ _ (clear.2 carrier) (.found _ ?_)), ?_⟩
      · exact (RootResetCompletedLocalPatterns.accepts_iff_parse .marked program layout.tree _).mpr ⟨_, rfl, parsed⟩
      · exact ⟨_, RootResetMarkedHandoffAgreement.cleanParents_noPending outer _⟩

theorem pending_search {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    (layers : List Layer) (body : Term) (parents : List ParentFrame) {found : Bool} {candidate : Cursor}
    (clear : Clear program tree body)
    (search : RootResetMarkedAncestorProbe.First program tree
      ⟨wrap (compileActions program tree) layers body, parents⟩ found candidate) :
    RootResetMarkedAncestorProbe.First program tree
      ⟨body, parentsAfter (compileActions program tree) layers parents⟩ found candidate := by
  induction layers generalizing parents with
  | nil => exact search
  | cons layer layers ih => exact ih _ (.parent _ _ _ (wrapped_clear layers clear).1 search)

theorem pass_declined (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (source : Term) (ticks : Nat) (ready found : Bool) (endpoint candidate : Cursor)
    (frontRun : run (RootResetActiveMarkedFrontend.machine program tree) ticks
      (RootResetActiveMarkedFrontend.initial program tree (Cursor.atRoot source)) = ⟨some (.done ready), endpoint⟩)
    (search : RootResetMarkedAncestorProbe.First program tree endpoint found candidate)
    (declined : Declined program tree found candidate) :
    ∃ used after, run (RootResetMarkedHandoffPass.worker program tree).machine used
      ((RootResetMarkedHandoffPass.worker program tree).initial (Cursor.atRoot source)) = ⟨some (.done false), after⟩ := by
  let test := RootResetMarkedCandidateProbe.worker program tree
  let yes := RootResetMarkedHandoffPass.pendingWorker program tree
  let no := RootResetCompletedResponseProbe.rejectWorker
  obtain ⟨searchTicks, searchBound, searchRun⟩ := search.runs
  obtain ⟨candidateTicks, candidateBound, candidateRun⟩ := RootResetMarkedCandidateProbe.generated program tree source
    ticks searchTicks ready found endpoint candidate frontRun searchRun
  obtain ⟨t, tb, tr⟩ := RootResetProbeBranch.testing_runs test yes no (RootResetMarkedCandidateProbe.terminal program tree)
    (Cursor.atRoot source) candidate candidateTicks (.done found) found candidateRun rfl
  cases found with
  | false =>
      obtain ⟨p, pb, pr⟩ := RootResetProbeBranch.negative_runs test yes no (RootResetCompletedResponseAtoms.code_terminal _) candidate candidate 0
        ⟨.answer false, ProbeCompiler.Control.self_mem_nodes _⟩ false rfl rfl
      refine ⟨t + 1 + (p + 1), candidate, ?_⟩
      exact (run_add (RootResetProbeBranch.machine test yes no) (t + 1) (p + 1) _).trans
        ((congrArg (run (RootResetProbeBranch.machine test yes no) (p + 1)) tr).trans pr)
  | true =>
      obtain ⟨after, first⟩ := declined
      obtain ⟨queryTicks, queryBound, queryRun⟩ := first.runs
      obtain ⟨p, pb, pr⟩ := RootResetProbeBranch.positive_runs test yes no (RootResetMarkedHandoffPass.pending_terminal program tree)
        candidate after queryTicks (.done false) false queryRun rfl
      refine ⟨t + 1 + (p + 1), after, ?_⟩
      exact (run_add (RootResetProbeBranch.machine test yes no) (t + 1) (p + 1) _).trans
        ((congrArg (run (RootResetProbeBranch.machine test yes no) (p + 1)) tr).trans pr)

theorem preceding_passes_declined {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {count : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents count)
    (pendingLayers : List Layer) (endpoint : Term)
    (freshClear : RootResetFreshHistoryRejection.Clear program layout.tree endpoint)
    (markedClear : Clear program layout.tree endpoint)
    (frontTicks : Nat) (ready : Bool)
    (frontRun : run (RootResetActiveMarkedFrontend.machine program layout.tree) frontTicks
      (RootResetActiveMarkedFrontend.initial program layout.tree
        (Cursor.atRoot (Cursor.rebuild parents (wrap (compileActions program layout.tree) pendingLayers endpoint)))) =
          ⟨some (.done ready), ⟨endpoint, parentsAfter (compileActions program layout.tree) pendingLayers parents⟩⟩) :
    let source := Cursor.rebuild parents (wrap (compileActions program layout.tree) pendingLayers endpoint)
    (∃ ticks candidate, run (RootResetFreshResponsePass.worker program layout.tree).machine ticks
      ((RootResetFreshResponsePass.worker program layout.tree).initial (Cursor.atRoot source)) = ⟨some (.done false), candidate⟩) ∧
    (∃ ticks candidate, run (RootResetMarkedHandoffPass.worker program layout.tree).machine ticks
      ((RootResetMarkedHandoffPass.worker program layout.tree).initial (Cursor.atRoot source)) = ⟨some (.done false), candidate⟩) := by
  dsimp only
  constructor
  · obtain ⟨found, candidate, search, declined⟩ := RootResetFreshHistoryRejection.cleanParents_search outer
      (wrap (compileActions program layout.tree) pendingLayers endpoint) (RootResetFreshHistoryRejection.wrapped_clear pendingLayers freshClear)
    obtain ⟨ticks, actual⟩ := RootResetFreshHistoryRejection.pass_declined program layout.tree _ frontTicks ready found _ candidate frontRun
      (RootResetFreshHistoryRejection.pending_search pendingLayers endpoint parents freshClear search) declined
    exact ⟨ticks, candidate, actual⟩
  · obtain ⟨found, candidate, search, declined⟩ := cleanParents_search outer
      (wrap (compileActions program layout.tree) pendingLayers endpoint) (wrapped_clear pendingLayers markedClear)
    exact pass_declined program layout.tree _ frontTicks ready found _ candidate frontRun
      (pending_search pendingLayers endpoint parents markedClear search) declined

theorem endpoint_selected {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {count : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents count)
    (pendingLayers : List Layer) (endpoint : Term)
    (freshClear : RootResetFreshHistoryRejection.Clear program layout.tree endpoint)
    (markedClear : Clear program layout.tree endpoint)
    (frontTicks : Nat) (ready : Bool)
    (frontRun : run (RootResetActiveMarkedFrontend.machine program layout.tree) frontTicks
      (RootResetActiveMarkedFrontend.initial program layout.tree
        (Cursor.atRoot (Cursor.rebuild parents (wrap (compileActions program layout.tree) pendingLayers endpoint)))) =
          ⟨some (.done ready), ⟨endpoint, parentsAfter (compileActions program layout.tree) pendingLayers parents⟩⟩)
    (endpointTicks : Nat) (endpointState : (RootResetActiveEndpointProbe.worker program layout).Control)
    (selected after : Cursor)
    (endpointRun : run (RootResetActiveEndpointProbe.probeSpec program layout).machine endpointTicks
      ⟨some (RootResetActiveEndpointProbe.probeSpec program layout).start,
        Cursor.atRoot (Cursor.rebuild parents (wrap (compileActions program layout.tree) pendingLayers endpoint))⟩ = ⟨some endpointState, selected⟩)
    (endpointAnswer : (RootResetActiveEndpointProbe.probeSpec program layout).answer endpointState = some true)
    (contracted : selected.rdx? = some after) :
    RootResetFinitePrioritySelector.selectStep? program layout
      (Cursor.rebuild parents (wrap (compileActions program layout.tree) pendingLayers endpoint)) = some after.erase := by
  obtain ⟨⟨f, fc, fr⟩, ⟨m, mc, mr⟩⟩ := preceding_passes_declined outer pendingLayers endpoint freshClear markedClear frontTicks ready frontRun
  exact RootResetFinitePriorityExecution.endpoint_selected program layout _ f m endpointTicks
    (.done false) (.done false) endpointState fc mc selected after fr rfl mr rfl endpointRun endpointAnswer contracted

end PureSFormal.Research.RootResetHistoricalPriorityRejection
