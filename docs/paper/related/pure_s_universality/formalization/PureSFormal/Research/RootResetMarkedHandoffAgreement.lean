import PureSFormal.Research.RootResetMarkedHandoffPass
import PureSFormal.Research.RootResetFreshAncestorExitAgreement

/-! Exact current marked-response handoff and rejection of history without a pending ancestor. -/
namespace PureSFormal.Research.RootResetMarkedHandoffAgreement
open PureSFormal.PureS
open FiniteController
open RootResetActiveMarkedFrontend RootResetActiveCleanParentsAgreement RootResetActivePendingAgreement
open RootResetEmptyHandoffContext (exitTerm)

theorem marked_rejects_arity {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {source : Term} (arity : source.headArity ≠ 5) :
    RootResetCompletedLocalPatterns.accepts .marked program tree source = false := by
  cases accepted : RootResetCompletedLocalPatterns.accepts .marked program tree source with
  | false => rfl
  | true =>
      obtain ⟨view, marked, parsed⟩ := (RootResetCompletedLocalPatterns.accepts_iff_parse .marked program tree source).mp accepted
      obtain ⟨halt, dispatcher, seedAudit, continuationAudit, haltShape, dispatchShape, shape⟩ := CheckpointDecoder.parseLocal?_sound parsed
      rw [marked] at haltShape
      cases haltShape with
      | marked left right =>
          apply False.elim
          apply arity
          rw [shape]
          rfl

theorem exit_application_notMarked (program : CTS.Program) (layout : ActionDispatcher program)
    (horizon remaining : Nat) (bits : List Bool) (audit : Term) :
    RootResetCompletedLocalPatterns.accepts .marked program layout.tree
      (.app (exitTerm program layout horizon remaining bits) audit) = false := by
  cases remaining with
  | succ remaining => apply marked_rejects_arity; change 4 ≠ 5; decide
  | zero =>
      cases accepted : RootResetCompletedLocalPatterns.accepts .marked program layout.tree
          (.app (exitTerm program layout horizon 0 bits) audit) with
      | false => rfl
      | true =>
          obtain ⟨view, marked, parsed⟩ := (RootResetCompletedLocalPatterns.accepts_iff_parse .marked program layout.tree _).mp accepted
          obtain ⟨halt, dispatcher, seedAudit, continuationAudit, haltShape, dispatchShape, shape⟩ := CheckpointDecoder.parseLocal?_sound parsed
          rw [marked] at haltShape
          cases haltShape with
          | marked left right =>
              have fields := (Term.app.inj (Term.app.inj (Term.app.inj shape).1).1).1
              have impossible := (Term.app.inj fields).2
              change C horizon = .app haltTag right at impossible
              cases horizon <;> simp [C, b, haltTag] at impossible

theorem exit_recovers_marked (program : CTS.Program) (layout : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool) (bits exitBits : List Bool)
    (carrier : Term) (horizon remaining : Nat) (parents : List ParentFrame) :
    RootResetMarkedAncestorProbe.First program layout.tree
      ⟨exitTerm program layout horizon remaining exitBits,
        SchedulerRootContinuation.markedContinuationParents program layout registers bit bits carrier parents⟩ true
      ⟨LocalResponse.markedCompleted bits (exitTerm program layout horizon remaining exitBits) carrier
        (SchedulerResponse.completedRoute program layout registers bit carrier), parents⟩ := by
  have firstNo := notMarked_of_noLocal (RootResetEmptyHandoffContext.exit_local_none program layout horizon remaining exitBits)
  have secondNo := exit_application_notMarked program layout horizon remaining exitBits carrier
  have parsed := CheckpointDecoder.parseLocal?_markedCompleted
    (continuation := exitTerm program layout horizon remaining exitBits) bits
    (SchedulerResponse.completedRoute_snapshotDispatch program layout registers bit carrier)
  exact .parent _ (.left carrier) _ firstNo
    (.parent _ (.right (SchedulerResponse.localContinuationLeft bits (Carrier.markedHField carrier carrier)
      (SchedulerResponse.completedRoute program layout registers bit carrier) carrier)) parents secondNo
      (.found _ ((RootResetCompletedLocalPatterns.accepts_iff_parse .marked program layout.tree _).mpr ⟨_, rfl, parsed⟩)))

theorem completedMarked_exit_frontend {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {layers : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents layers)
    (registers : SchedulerControl.Registers program) (bit : Bool) (bits exitBits : List Bool)
    (carrier : Term) (horizon remaining : Nat) :
    ∃ ticks, ticks ≤ coefficient program layout.tree * (Cursor.rebuild parents
      (LocalResponse.markedCompleted bits (exitTerm program layout horizon remaining exitBits) carrier
        (SchedulerResponse.completedRoute program layout registers bit carrier))).size ∧
      run (machine program layout.tree) ticks (initial program layout.tree (Cursor.atRoot (Cursor.rebuild parents
        (LocalResponse.markedCompleted bits (exitTerm program layout horizon remaining exitBits) carrier
          (SchedulerResponse.completedRoute program layout registers bit carrier))))) =
        ⟨some (.done false), ⟨exitTerm program layout horizon remaining exitBits,
          SchedulerRootContinuation.markedContinuationParents program layout registers bit bits carrier parents⟩⟩ := by
  obtain ⟨p, pr⟩ := marked_layer program layout registers bit bits (exitTerm program layout horizon remaining exitBits) carrier parents
  obtain ⟨rest, rr⟩ := RootResetFreshAncestorExitAgreement.exit_stops program layout horizon remaining exitBits
    (SchedulerRootContinuation.markedContinuationParents program layout registers bit bits carrier parents) rfl
  apply cleanParents_terminal outer _ (p + rest) false _
  rw [run_add, pr]
  exact rr

theorem pending_rejected_arity (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (source : Term) (frame : ParentFrame) (parents : List ParentFrame)
    (arity : (frame.fill source).headArity ≠ 3) :
    RootResetPendingParentProbe.value program tree ⟨source, frame :: parents⟩ = false := by
  cases frame with
  | left sibling => rfl
  | right sibling =>
      cases accepted : RootResetPendingParentProbe.value program tree ⟨source, .right sibling :: parents⟩ with
      | false => rfl
      | true =>
          obtain ⟨payload, continuation, child, shape, _⟩ := RootResetPendingAdmissionPatterns.pending_sound
            (compileActions program tree) (.app sibling source) .hole accepted
          apply False.elim
          apply arity
          change (Term.app sibling source).headArity = 3
          rw [shape]
          rfl

theorem cleanParents_noPending {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {layers : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents layers) (source : Term) :
    RootResetPendingAncestorProbe.First program layout.tree ⟨source, parents⟩ false
      (Cursor.atRoot (Cursor.rebuild parents source)) := by
  induction outer generalizing source with
  | root => exact .root source
  | @fresh parents layers outer registers bit bits carrier nonempty clean ih =>
      refine .parent source (.left carrier) _ rfl (.parent _
        (.right (SchedulerResponse.localContinuationLeft bits (freshHField carrier)
          (SchedulerResponse.completedRoute program layout registers bit carrier) carrier)) parents ?_ (ih _))
      apply pending_rejected_arity
      change 6 ≠ 3
      decide
  | @marked parents layers outer registers bit bits carrier ih =>
      refine .parent source (.left carrier) _ rfl (.parent _
        (.right (SchedulerResponse.localContinuationLeft bits (Carrier.markedHField carrier carrier)
          (SchedulerResponse.completedRoute program layout registers bit carrier) carrier)) parents ?_ (ih _))
      apply pending_rejected_arity
      change 5 ≠ 3
      decide

theorem completedMarked_local_runs (program : CTS.Program) (layout : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    ∃ ticks, run (RootResetMixedLocalFragment.machine program layout.tree) ticks
      (RootResetMixedLocalFragment.initial program layout.tree ⟨LocalResponse.markedCompleted bits continuation carrier
        (SchedulerResponse.completedRoute program layout registers bit carrier), parents⟩) =
      ⟨some (.done true), ⟨continuation,
        SchedulerRootContinuation.markedContinuationParents program layout registers bit bits carrier parents⟩⟩ := by
  have parsed := CheckpointDecoder.parseLocal?_markedCompleted (continuation := continuation) bits
    (SchedulerResponse.completedRoute_snapshotDispatch program layout registers bit carrier)
  obtain ⟨ticks, bound, actual⟩ := RootResetMixedLocalFragment.marked_runs program layout.tree
    ⟨LocalResponse.markedCompleted bits continuation carrier (SchedulerResponse.completedRoute program layout registers bit carrier), parents⟩
  have accepted := (RootResetCompletedLocalPatterns.accepts_iff_parse .marked program layout.tree _).mpr ⟨_, rfl, parsed⟩
  rw [accepted] at actual
  refine ⟨ticks + 1 + 2, ?_⟩
  rw [run_add, actual]
  rfl

theorem marked_frame_selected (program : CTS.Program) (layout : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool) (bits : List Bool) (continuation carrier : Term)
    (accepted : RootResetFrameCarrierGuard.frameHeadGuard (LocalResponse.markedCompleted bits continuation carrier
      (SchedulerResponse.completedRoute program layout registers bit carrier)) = true) :
    RootResetEdgeFragment.select RootResetNestedFramePatterns.headRows
      (LocalResponse.markedCompleted bits continuation carrier (SchedulerResponse.completedRoute program layout registers bit carrier)) =
        some RootResetNestedFramePatterns.secondRow := by
  cases selected : RootResetEdgeFragment.select RootResetNestedFramePatterns.headRows
      (LocalResponse.markedCompleted bits continuation carrier (SchedulerResponse.completedRoute program layout registers bit carrier)) with
  | none =>
      have refused := (RootResetNestedFrameAgreement.head_misses_iff _).mp selected
      rw [accepted] at refused
      cases refused
  | some row =>
      obtain ⟨member, matched⟩ := RootResetEdgeFragment.select_sound _ _ row selected
      rcases List.mem_cons.mp member with first | rest
      · subst row
        obtain ⟨x, y, z, tail, shape⟩ := RootResetNestedFramePatterns.first_reaches_redex _ matched
        have arity := congrArg Term.headArity shape
        change 5 = 4 at arity
        cases arity
      · exact congrArg some (List.mem_singleton.mp rest)

theorem pendingMarked_frontend_recovers {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {count : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents count)
    (pendingLayers : List Layer)
    (registers : SchedulerControl.Registers program) (bit : Bool) (bits exitBits : List Bool)
    (carrier : Term) (horizon remaining : Nat) :
    let body := LocalResponse.markedCompleted bits (exitTerm program layout horizon remaining exitBits) carrier
      (SchedulerResponse.completedRoute program layout registers bit carrier)
    ∃ frontTicks ready endpoint searchTicks,
      run (machine program layout.tree) frontTicks (initial program layout.tree
        (Cursor.atRoot (Cursor.rebuild parents (wrap (compileActions program layout.tree) pendingLayers body)))) =
          ⟨some (.done ready), endpoint⟩ ∧
      run (RootResetMarkedAncestorProbe.machine program layout.tree) searchTicks
        (RootResetMarkedAncestorProbe.initial program layout.tree endpoint) =
          ⟨some (.done true), ⟨body, parentsAfter (compileActions program layout.tree) pendingLayers parents⟩⟩ := by
  dsimp only
  let continuation := exitTerm program layout horizon remaining exitBits
  let body := LocalResponse.markedCompleted bits continuation carrier (SchedulerResponse.completedRoute program layout registers bit carrier)
  let innerParents := parentsAfter (compileActions program layout.tree) pendingLayers parents
  have parsed := CheckpointDecoder.parseLocal?_markedCompleted (continuation := continuation) bits
    (SchedulerResponse.completedRoute_snapshotDispatch program layout registers bit carrier)
  cases pendingLayers with
  | nil =>
      obtain ⟨ticks, bound, actual⟩ := completedMarked_exit_frontend outer registers bit bits exitBits carrier horizon remaining
      obtain ⟨search, sb, sr⟩ := (exit_recovers_marked program layout registers bit bits exitBits carrier horizon remaining parents).runs
      exact ⟨ticks, false, _, search, actual, sr⟩
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
          obtain ⟨p, pr⟩ := forwarded program layout.tree _ _ f allTicks noMarked fr .completedLocal (by intro h; cases h) allRun
          obtain ⟨rest, rr⟩ := RootResetFreshAncestorExitAgreement.exit_stops program layout horizon remaining exitBits
            (SchedulerRootContinuation.markedContinuationParents program layout registers bit bits carrier innerParents) rfl
          have terminalRun : run (machine program layout.tree) (p + rest) (initial program layout.tree
              ⟨wrap (compileActions program layout.tree) (layer :: layers) body, parents⟩) =
                ⟨some (.done false), ⟨continuation,
                  SchedulerRootContinuation.markedContinuationParents program layout registers bit bits carrier innerParents⟩⟩ := by
            rw [run_add, pr]
            exact rr
          obtain ⟨ticks, tb, tr⟩ := cleanParents_terminal outer _ (p + rest) false _ terminalRun
          obtain ⟨search, sb, sr⟩ := (exit_recovers_marked program layout registers bit bits exitBits carrier horizon remaining innerParents).runs
          exact ⟨ticks, false, _, search, tr, sr⟩
      | true =>
          let endpoint : Cursor :=
            ⟨.app (Carrier.markedHField carrier carrier) (SchedulerResponse.completedRoute program layout registers bit carrier),
              .left (.app (seedCode bits) carrier) ::
              .left (.app continuation carrier) :: innerParents⟩
          obtain ⟨f, fb, fr⟩ := RootResetNestedFrameAgreement.selected (frameLayers (compileActions program layout.tree) (layer :: layers))
            body parents (RootResetNestedFrameCost.parsed_local_stops parsed) RootResetNestedFramePatterns.secondRow endpoint
            (marked_frame_selected program layout registers bit bits continuation carrier guardValue) rfl
          obtain ⟨p, pr⟩ := accepted_frame program layout.tree _ _ f noMarked fr
          obtain ⟨ticks, tb, tr⟩ := cleanParents_terminal outer _ p true endpoint pr
          have recovered : RootResetMarkedAncestorProbe.First program layout.tree endpoint true ⟨body, innerParents⟩ := by
            refine .parent _ _ _ (marked_rejects_arity (by change 3 ≠ 5; decide))
              (.parent _ _ _ (marked_rejects_arity (by change 4 ≠ 5; decide)) (.found _ ?_))
            exact (RootResetCompletedLocalPatterns.accepts_iff_parse .marked program layout.tree _).mpr ⟨_, rfl, parsed⟩
          obtain ⟨search, sb, sr⟩ := recovered.runs
          exact ⟨ticks, true, endpoint, search, tr, sr⟩

theorem bounded_terminal (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (source : Term) (ticks : Nat) (ready : Bool) (endpoint : Cursor)
    (actual : run (RootResetMarkedHandoffPass.worker program tree).machine ticks
      ((RootResetMarkedHandoffPass.worker program tree).initial (Cursor.atRoot source)) = ⟨some (.done ready), endpoint⟩) :
    ∃ used, used ≤ RootResetMarkedHandoffPass.coefficient program tree * source.size ∧
      run (RootResetMarkedHandoffPass.worker program tree).machine used
        ((RootResetMarkedHandoffPass.worker program tree).initial (Cursor.atRoot source)) = ⟨some (.done ready), endpoint⟩ := by
  obtain ⟨used, otherReady, other, bounded, execution, preserved, facts⟩ := RootResetMarkedHandoffPass.all_input program tree source
  have first : run (RootResetMarkedHandoffPass.worker program tree).machine (used + ticks)
      ((RootResetMarkedHandoffPass.worker program tree).initial (Cursor.atRoot source)) = ⟨some (.done otherReady), other⟩ := by
    rw [run_add, execution]
    exact RootResetMarkedHandoffPass.terminal program tree (.done otherReady) otherReady rfl other ticks
  have second : run (RootResetMarkedHandoffPass.worker program tree).machine (used + ticks)
      ((RootResetMarkedHandoffPass.worker program tree).initial (Cursor.atRoot source)) = ⟨some (.done ready), endpoint⟩ := by
    rw [Nat.add_comm, run_add, actual]
    exact RootResetMarkedHandoffPass.terminal program tree (.done ready) ready rfl endpoint used
  rw [first.symm.trans second] at execution
  exact ⟨used, bounded, execution⟩

theorem generated (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (source : Term) (frontTicks searchTicks : Nat) (frontReady ready : Bool) (active candidate endpoint : Cursor)
    (frontRun : run (machine program tree) frontTicks (initial program tree (Cursor.atRoot source)) =
      ⟨some (.done frontReady), active⟩)
    (searchRun : run (RootResetMarkedAncestorProbe.machine program tree) searchTicks
      (RootResetMarkedAncestorProbe.initial program tree active) = ⟨some (.done true), candidate⟩)
    (pending : RootResetPendingAncestorProbe.First program tree candidate ready endpoint) :
    ∃ used, used ≤ RootResetMarkedHandoffPass.coefficient program tree * source.size ∧
      run (RootResetMarkedHandoffPass.worker program tree).machine used
        ((RootResetMarkedHandoffPass.worker program tree).initial (Cursor.atRoot source)) = ⟨some (.done ready), endpoint⟩ := by
  let test := RootResetMarkedCandidateProbe.worker program tree
  let yes := RootResetMarkedHandoffPass.pendingWorker program tree
  let no := RootResetCompletedResponseProbe.rejectWorker
  obtain ⟨candidateTicks, candidateBound, candidateRun⟩ := RootResetMarkedCandidateProbe.generated program tree source
    frontTicks searchTicks frontReady true active candidate frontRun searchRun
  obtain ⟨t, tb, tr⟩ := RootResetProbeBranch.testing_runs test yes no
    (RootResetMarkedCandidateProbe.terminal program tree) (Cursor.atRoot source) candidate candidateTicks (.done true) true candidateRun rfl
  obtain ⟨pendingTicks, pendingBound, pendingRun⟩ := pending.runs
  obtain ⟨p, pb, pr⟩ := RootResetProbeBranch.positive_runs test yes no
    (RootResetMarkedHandoffPass.pending_terminal program tree) candidate endpoint pendingTicks (.done ready) ready pendingRun rfl
  apply bounded_terminal program tree source (t + 1 + (p + 1)) ready endpoint
  exact (run_add (RootResetProbeBranch.machine test yes no) (t + 1) (p + 1) _).trans
    ((congrArg (run (RootResetProbeBranch.machine test yes no) (p + 1)) tr).trans pr)

theorem parentsAfter_append (actions : Term) (before after : List Layer) (parents : List ParentFrame) :
    parentsAfter actions (before ++ after) parents = parentsAfter actions after (parentsAfter actions before parents) := by
  induction before generalizing parents with
  | nil => rfl
  | cons layer before ih => exact ih _

theorem pendingMarked_handoff {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {count : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents count)
    (outerPending : List Layer) (payload next : Term)
    (registers : SchedulerControl.Registers program) (bit : Bool) (bits exitBits : List Bool)
    (carrier : Term) (horizon remaining : Nat) :
    let body := LocalResponse.markedCompleted bits (exitTerm program layout horizon remaining exitBits) carrier
      (SchedulerResponse.completedRoute program layout registers bit carrier)
    let source := Cursor.rebuild parents (wrap (compileActions program layout.tree) (outerPending ++ [(payload, next)]) body)
    ∃ ticks, ticks ≤ RootResetMarkedHandoffPass.coefficient program layout.tree * source.size ∧
      run (RootResetMarkedHandoffPass.worker program layout.tree).machine ticks
        ((RootResetMarkedHandoffPass.worker program layout.tree).initial (Cursor.atRoot source)) =
          ⟨some (.done true), ⟨.app (.app (CheckpointDecoder.openEnvironment (compileActions program layout.tree) payload) next) body,
            parentsAfter (compileActions program layout.tree) outerPending parents⟩⟩ := by
  dsimp only
  obtain ⟨frontTicks, ready, endpoint, searchTicks, frontRun, searchRun⟩ := pendingMarked_frontend_recovers outer
    (outerPending ++ [(payload, next)]) registers bit bits exitBits carrier horizon remaining
  apply generated program layout.tree _ frontTicks searchTicks ready true endpoint _ _ frontRun searchRun
  rw [parentsAfter_append]
  exact .found _ _ (RootResetPendingParentProbe.pending_value program layout.tree payload next _ _) rfl

theorem completedMarked_rejected {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {count : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents count)
    (registers : SchedulerControl.Registers program) (bit : Bool) (bits exitBits : List Bool)
    (carrier : Term) (horizon remaining : Nat) :
    let body := LocalResponse.markedCompleted bits (exitTerm program layout horizon remaining exitBits) carrier
      (SchedulerResponse.completedRoute program layout registers bit carrier)
    let source := Cursor.rebuild parents body
    ∃ ticks, ticks ≤ RootResetMarkedHandoffPass.coefficient program layout.tree * source.size ∧
      run (RootResetMarkedHandoffPass.worker program layout.tree).machine ticks
        ((RootResetMarkedHandoffPass.worker program layout.tree).initial (Cursor.atRoot source)) =
          ⟨some (.done false), Cursor.atRoot source⟩ := by
  dsimp only
  obtain ⟨frontTicks, frontBound, frontRun⟩ := completedMarked_exit_frontend outer registers bit bits exitBits carrier horizon remaining
  obtain ⟨searchTicks, searchBound, searchRun⟩ := (exit_recovers_marked program layout registers bit bits exitBits carrier horizon remaining parents).runs
  exact generated program layout.tree _ frontTicks searchTicks false false _ _ _ frontRun searchRun (cleanParents_noPending outer _)

end PureSFormal.Research.RootResetMarkedHandoffAgreement
