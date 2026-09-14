import PureSFormal.Research.RootResetMarkedHandoffAgreement
import PureSFormal.Research.RootResetFreshResponsePass

/-! Historical fresh responses are nonempty and therefore decline the first priority pass. -/
namespace PureSFormal.Research.RootResetFreshHistoryRejection
open PureSFormal.PureS
open FiniteController RootResetProbeSequence RootResetCompletedResponseAgreement
open RootResetCompletedResponseAtoms RootResetCompletedResponseProbe
open RootResetActivePendingAgreement

def Clear (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (source : Term) : Prop :=
  RootResetCompletedLocalPatterns.accepts .fresh program tree source = false ∧
    ∀ audit, RootResetCompletedLocalPatterns.accepts .fresh program tree (.app source audit) = false

theorem marked_clear (program : CTS.Program) (layout : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool) (bits : List Bool) (continuation carrier : Term) :
    Clear program layout.tree (LocalResponse.markedCompleted bits continuation carrier
      (SchedulerResponse.completedRoute program layout registers bit carrier)) := by
  refine ⟨RootResetFreshAncestorExitAgreement.fresh_rejects_arity (by change 5 ≠ 6; decide), ?_⟩
  intro audit
  cases accepted : RootResetCompletedLocalPatterns.accepts .fresh program layout.tree
      (.app (LocalResponse.markedCompleted bits continuation carrier
        (SchedulerResponse.completedRoute program layout registers bit carrier)) audit) with
  | false => rfl
  | true =>
      obtain ⟨view, fresh, parsed⟩ := (RootResetCompletedLocalPatterns.accepts_iff_parse .fresh program layout.tree _).mp accepted
      obtain ⟨halt, dispatcher, seedAudit, continuationAudit, haltShape, dispatchShape, shape⟩ := CheckpointDecoder.parseLocal?_sound parsed
      rw [fresh] at haltShape
      cases haltShape with
      | fresh fieldAudit =>
          have fields := (Term.app.inj (Term.app.inj (Term.app.inj shape).1).1).1
          have haltEq := (Term.app.inj fields).1
          have impossible := (Term.app.inj (Term.app.inj haltEq).2).1
          change haltTag = b at impossible
          cases impossible

theorem wrapped_clear {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    (layers : List Layer) {body : Term} (clear : Clear program tree body) :
    Clear program tree (wrap (compileActions program tree) layers body) := by
  cases layers with
  | nil => exact clear
  | cons layer layers =>
      refine ⟨RootResetFreshAncestorExitAgreement.fresh_rejects_arity (by change 3 ≠ 6; decide), ?_⟩
      intro audit
      exact RootResetFreshAncestorExitAgreement.fresh_rejects_arity (by change 4 ≠ 6; decide)

theorem decoded_nonpending_rejected {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {source : Term} {view : CheckpointDecoder.LocalView program} {first : Bool} {rest : List Bool}
    (parsed : CheckpointDecoder.parseLocal? program tree source = some view) (fresh : view.status = .fresh)
    (decoded : CheckpointDecoder.decodeCarrier? program tree view.accumulator = some (first :: rest))
    (origin : Cursor) (atSource : origin.focus = source) (boundary : RootResetCompleteCarrierRows.Boundary origin) :
    Executes (RootResetCompletedResponseProbe.worker program tree false) origin false origin := by
  obtain ⟨ticks, bounded, actual⟩ := RootResetDecodedCarrierNonemptyAgreement.fresh_admission_restores parsed fresh
    (CheckpointDecoder.decodeCarrier?_sound program tree decoded) origin atSource boundary.1
  have accepted : (RootResetPersistentRouteA.parseFreshNonempty? program tree source).isSome = true := by
    simp only [RootResetPersistentRouteA.parseFreshNonempty?, parsed, fresh, decoded]
    rfl
  rw [accepted] at actual
  have nonempty : Executes (nonemptyWorker program tree) origin true origin := ⟨ticks, .done true, actual, rfl⟩
  have declined : Executes rejectWorker origin false origin := ⟨0, ⟨.answer false, ProbeCompiler.Control.self_mem_nodes _⟩, rfl, rfl⟩
  have bodyRun : Executes (body program tree false) origin false origin :=
    branch_yes _ _ _ (nonempty_terminal program tree) (code_terminal _) origin origin false nonempty declined
  exact branch_yes _ _ _ (code_terminal _) (body_terminal program tree false) origin origin false
    (fresh_guard parsed fresh origin atSource) bodyRun

theorem scoped_nonpending (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor)
    (incoming : Probe.observeIncoming origin ≠ .right)
    (declined : Executes (RootResetCompletedResponseProbe.worker program tree false) origin false origin) :
    Executes (RootResetScopedResponseProbes.completed program tree) origin false origin := by
  let no := RootResetCompletedResponseProbe.worker program tree false
  let yes := RootResetEmptyAwareResponseProbe.worker program tree
  obtain ⟨ticks, state, actual, answered⟩ := declined
  obtain ⟨used, bound, execution⟩ := RootResetScopedCarrierWorker.nonpending_runs program tree no yes
    (RootResetCompletedResponseProbe.terminal program tree false) origin origin ticks state false actual answered
  have initialRun : run (RootResetScopedCarrierWorker.machine program tree no yes) 1
      ((RootResetScopedCarrierWorker.worker program tree no yes).initial origin) =
        RootResetCarrierNonemptyProbe.liftConfiguration RootResetScopedCarrierWorker.Control.nonpending (no.initial origin) := by
    change step (RootResetScopedCarrierWorker.machine program tree no yes) ⟨some .start, origin⟩ = _
    cases observed : Probe.observeIncoming origin with
    | root | left => simp only [step, RootResetScopedCarrierWorker.machine, RootResetScopedCarrierWorker.transition, observed]; rfl
    | right => exact False.elim (incoming observed)
  refine ⟨1 + (used + 1), .done false, ?_, rfl⟩
  exact (run_add (RootResetScopedCarrierWorker.machine program tree no yes) 1 (used + 1) _).trans
    ((congrArg (run (RootResetScopedCarrierWorker.machine program tree no yes) (used + 1)) initialRun).trans execution)

theorem history_rejected {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {layers : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents layers)
    (registers : SchedulerControl.Registers program) (bit : Bool) (bits : List Bool) (continuation carrier : Term)
    (nonempty : ∃ first rest, CheckpointDecoder.decodeCarrier? program layout.tree
      (actionAccumulator program (registers.phase, bit) carrier) = some (first :: rest)) :
    Executes (RootResetScopedResponseProbes.completed program layout.tree)
      ⟨LocalResponse.completed bits continuation carrier (SchedulerResponse.completedRoute program layout registers bit carrier), parents⟩ false
      ⟨LocalResponse.completed bits continuation carrier (SchedulerResponse.completedRoute program layout registers bit carrier), parents⟩ := by
  apply scoped_nonpending
  · cases outer <;> intro impossible <;> cases impossible
  obtain ⟨first, rest, decoded⟩ := nonempty
  have parsed := RootResetTraversableCompletedParents.TraversableParents.parseLocal?_fresh program layout registers bit bits continuation carrier
  apply decoded_nonpending_rejected parsed rfl decoded _ rfl
  cases outer
  · exact RootResetCompleteCarrierRows.root_boundary _
  · exact RootResetCompleteCarrierRows.left_boundary _ _ _
  · exact RootResetCompleteCarrierRows.left_boundary _ _ _

def Declined (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (found : Bool) (candidate : Cursor) : Prop :=
  if found then Executes (RootResetScopedResponseProbes.completed program tree) candidate false candidate else True

theorem cleanParents_search {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {layers : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents layers) (source : Term)
    (clear : Clear program layout.tree source) :
    ∃ found candidate, RootResetFreshAncestorProbe.First program layout.tree ⟨source, parents⟩ found candidate ∧
      Declined program layout.tree found candidate := by
  induction outer generalizing source with
  | root => exact ⟨false, _, .root source clear.1, trivial⟩
  | @fresh parents layers outer registers bit bits carrier nonempty clean ih =>
      have parsed := RootResetTraversableCompletedParents.TraversableParents.parseLocal?_fresh program layout registers bit bits source carrier
      refine ⟨true, _, .parent source (.left carrier) _ clear.1 (.parent _ _ _ (clear.2 carrier) (.found _ ?_)), ?_⟩
      · exact (RootResetCompletedLocalPatterns.accepts_iff_parse .fresh program layout.tree _).mpr ⟨_, rfl, parsed⟩
      · exact history_rejected outer registers bit bits source carrier nonempty
  | @marked parents layers outer registers bit bits carrier ih =>
      obtain ⟨found, candidate, search, declined⟩ := ih _ (marked_clear program layout registers bit bits source carrier)
      exact ⟨found, candidate, .parent source (.left carrier) _ clear.1 (.parent _ _ _ (clear.2 carrier) search), declined⟩

theorem pending_search {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    (layers : List Layer) (body : Term) (parents : List ParentFrame) {found : Bool} {candidate : Cursor}
    (clear : Clear program tree body)
    (search : RootResetFreshAncestorProbe.First program tree
      ⟨wrap (compileActions program tree) layers body, parents⟩ found candidate) :
    RootResetFreshAncestorProbe.First program tree
      ⟨body, parentsAfter (compileActions program tree) layers parents⟩ found candidate := by
  induction layers generalizing parents with
  | nil => exact search
  | cons layer layers ih =>
      exact ih _ (.parent _ _ _ (wrapped_clear layers clear).1 search)

theorem exit_skips_marked (program : CTS.Program) (layout : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool) (bits exitBits : List Bool)
    (carrier : Term) (horizon remaining : Nat) (parents : List ParentFrame) {found : Bool} {candidate : Cursor}
    (search : RootResetFreshAncestorProbe.First program layout.tree
      ⟨LocalResponse.markedCompleted bits (RootResetEmptyHandoffContext.exitTerm program layout horizon remaining exitBits) carrier
        (SchedulerResponse.completedRoute program layout registers bit carrier), parents⟩ found candidate) :
    RootResetFreshAncestorProbe.First program layout.tree
      ⟨RootResetEmptyHandoffContext.exitTerm program layout horizon remaining exitBits,
        SchedulerRootContinuation.markedContinuationParents program layout registers bit bits carrier parents⟩ found candidate := by
  refine .parent _ _ _ ?_ (.parent _ _ _ ?_ search)
  · apply RootResetFreshAncestorExitAgreement.fresh_rejects_arity
    cases remaining
    · change 4 ≠ 6; decide
    · change 3 ≠ 6; decide
  · apply RootResetFreshAncestorExitAgreement.fresh_rejects_arity
    cases remaining
    · change 5 ≠ 6; decide
    · change 4 ≠ 6; decide

theorem pass_declined (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (source : Term) (ticks : Nat) (ready found : Bool) (endpoint candidate : Cursor)
    (frontRun : run (RootResetActiveMarkedFrontend.machine program tree) ticks
      (RootResetActiveMarkedFrontend.initial program tree (Cursor.atRoot source)) = ⟨some (.done ready), endpoint⟩)
    (search : RootResetFreshAncestorProbe.First program tree endpoint found candidate)
    (declined : Declined program tree found candidate) :
    ∃ used, run (RootResetFreshResponsePass.worker program tree).machine used
      ((RootResetFreshResponsePass.worker program tree).initial (Cursor.atRoot source)) = ⟨some (.done false), candidate⟩ := by
  let test := RootResetResponseCandidateProbe.worker program tree
  let yes := RootResetScopedResponseProbes.completed program tree
  let no := RootResetCompletedResponseProbe.rejectWorker
  obtain ⟨searchTicks, searchBound, searchRun⟩ := search.runs
  obtain ⟨candidateTicks, candidateBound, candidateRun⟩ := RootResetResponseCandidateProbe.generated program tree source
    ticks searchTicks ready found endpoint candidate frontRun searchRun
  obtain ⟨t, tb, tr⟩ := RootResetProbeBranch.testing_runs test yes no (RootResetResponseCandidateProbe.terminal program tree)
    (Cursor.atRoot source) candidate candidateTicks (.done found) found candidateRun rfl
  cases found with
  | false =>
      obtain ⟨p, pb, pr⟩ := RootResetProbeBranch.negative_runs test yes no (code_terminal _) candidate candidate 0
        ⟨.answer false, ProbeCompiler.Control.self_mem_nodes _⟩ false rfl rfl
      refine ⟨t + 1 + (p + 1), ?_⟩
      exact (run_add (RootResetProbeBranch.machine test yes no) (t + 1) (p + 1) _).trans
        ((congrArg (run (RootResetProbeBranch.machine test yes no) (p + 1)) tr).trans pr)
  | true =>
      obtain ⟨queryTicks, state, queryRun, queryAnswer⟩ := declined
      obtain ⟨p, pb, pr⟩ := RootResetProbeBranch.positive_runs test yes no (RootResetScopedResponseProbes.completed_terminal program tree)
        candidate candidate queryTicks state false queryRun queryAnswer
      refine ⟨t + 1 + (p + 1), ?_⟩
      exact (run_add (RootResetProbeBranch.machine test yes no) (t + 1) (p + 1) _).trans
        ((congrArg (run (RootResetProbeBranch.machine test yes no) (p + 1)) tr).trans pr)

open RootResetActiveMarkedFrontend RootResetActiveCleanParentsAgreement RootResetMarkedHandoffAgreement
open RootResetEmptyHandoffContext (exitTerm)

theorem pendingMarked_rejected {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {count : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents count)
    (pendingLayers : List Layer)
    (registers : SchedulerControl.Registers program) (bit : Bool) (bits exitBits : List Bool)
    (carrier : Term) (horizon remaining : Nat) :
    let body := LocalResponse.markedCompleted bits (exitTerm program layout horizon remaining exitBits) carrier
      (SchedulerResponse.completedRoute program layout registers bit carrier)
    let source := Cursor.rebuild parents (wrap (compileActions program layout.tree) pendingLayers body)
    ∃ ticks candidate, run (RootResetFreshResponsePass.worker program layout.tree).machine ticks
      ((RootResetFreshResponsePass.worker program layout.tree).initial (Cursor.atRoot source)) =
        ⟨some (.done false), candidate⟩ := by
  dsimp only
  let continuation := exitTerm program layout horizon remaining exitBits
  let body := LocalResponse.markedCompleted bits continuation carrier (SchedulerResponse.completedRoute program layout registers bit carrier)
  let innerParents := parentsAfter (compileActions program layout.tree) pendingLayers parents
  have clear := marked_clear program layout registers bit bits continuation carrier
  obtain ⟨found, candidate, outside, declined⟩ := cleanParents_search outer
    (wrap (compileActions program layout.tree) pendingLayers body) (wrapped_clear pendingLayers clear)
  have search := pending_search pendingLayers body parents clear outside
  have parsed := CheckpointDecoder.parseLocal?_markedCompleted (continuation := continuation) bits
    (SchedulerResponse.completedRoute_snapshotDispatch program layout registers bit carrier)
  cases pendingLayers with
  | nil =>
      obtain ⟨ticks, bound, actual⟩ := completedMarked_exit_frontend outer registers bit bits exitBits carrier horizon remaining
      obtain ⟨used, execution⟩ := pass_declined program layout.tree _ ticks false found _ candidate actual
        (exit_skips_marked program layout registers bit bits exitBits carrier horizon remaining parents search) declined
      exact ⟨used, candidate, execution⟩
  | cons layer layers =>
      have noMarked : RootResetCompletedLocalPatterns.accepts .marked program layout.tree
          (wrap (compileActions program layout.tree) (layer :: layers) body) = false := by
        apply marked_rejects_arity
        change 3 ≠ 5
        decide
      cases guardValue : RootResetFrameCarrierGuard.frameHeadGuard body with
      | false =>
          obtain ⟨l, lr⟩ := completedMarked_local_runs program layout registers bit bits continuation carrier innerParents
          obtain ⟨s, sr⟩ := segment_of_local_run ⟨body, innerParents⟩ _ parsed l lr
          obtain ⟨allTicks, allRun⟩ := segment_layers_terminal program layout.tree (layer :: layers) body parents
            (RootResetPendingAdmissionPatterns.childAdmitted_local parsed) s .completedLocal _ sr
          obtain ⟨f, fb, fr⟩ := RootResetNestedFrameCost.missed_count (frameLayers (compileActions program layout.tree) (layer :: layers))
            body parents (RootResetNestedFrameCost.parsed_local_stops parsed) guardValue (parents_boundary outer _)
          obtain ⟨p, pr⟩ := RootResetActivePendingAgreement.forwarded program layout.tree _ _ f allTicks noMarked fr .completedLocal (by intro h; cases h) allRun
          obtain ⟨rest, rr⟩ := RootResetFreshAncestorExitAgreement.exit_stops program layout horizon remaining exitBits
            (SchedulerRootContinuation.markedContinuationParents program layout registers bit bits carrier innerParents) rfl
          have terminalRun : run (RootResetActiveMarkedFrontend.machine program layout.tree) (p + rest) (RootResetActiveMarkedFrontend.initial program layout.tree
              ⟨wrap (compileActions program layout.tree) (layer :: layers) body, parents⟩) =
                ⟨some (.done false), ⟨continuation,
                  SchedulerRootContinuation.markedContinuationParents program layout registers bit bits carrier innerParents⟩⟩ := by
            rw [run_add, pr]
            exact rr
          obtain ⟨ticks, tb, tr⟩ := cleanParents_terminal outer _ (p + rest) false _ terminalRun
          obtain ⟨used, execution⟩ := pass_declined program layout.tree _ ticks false found _ candidate tr
            (exit_skips_marked program layout registers bit bits exitBits carrier horizon remaining innerParents search) declined
          exact ⟨used, candidate, execution⟩
      | true =>
          let endpoint : Cursor :=
            ⟨.app (Carrier.markedHField carrier carrier) (SchedulerResponse.completedRoute program layout registers bit carrier),
              .left (.app (seedCode bits) carrier) :: .left (.app continuation carrier) :: innerParents⟩
          obtain ⟨f, fb, fr⟩ := RootResetNestedFrameAgreement.selected (frameLayers (compileActions program layout.tree) (layer :: layers))
            body parents (RootResetNestedFrameCost.parsed_local_stops parsed) RootResetNestedFramePatterns.secondRow endpoint
            (marked_frame_selected program layout registers bit bits continuation carrier guardValue) rfl
          obtain ⟨p, pr⟩ := accepted_frame program layout.tree _ _ f noMarked fr
          obtain ⟨ticks, tb, tr⟩ := cleanParents_terminal outer _ p true endpoint pr
          have recovered : RootResetFreshAncestorProbe.First program layout.tree endpoint found candidate := by
            exact .parent _ _ _ (RootResetFreshAncestorExitAgreement.fresh_rejects_arity (by change 3 ≠ 6; decide))
              (.parent _ _ _ (RootResetFreshAncestorExitAgreement.fresh_rejects_arity (by change 4 ≠ 6; decide)) search)
          obtain ⟨used, execution⟩ := pass_declined program layout.tree _ ticks true found endpoint candidate tr recovered declined
          exact ⟨used, candidate, execution⟩

end PureSFormal.Research.RootResetFreshHistoryRejection
