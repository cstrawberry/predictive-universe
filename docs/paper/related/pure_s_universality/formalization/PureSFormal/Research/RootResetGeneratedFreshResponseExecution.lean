import PureSFormal.Research.RootResetFreshResponseExecution
import PureSFormal.Research.RootResetFinitePriorityExecution
import PureSFormal.Research.RootResetGeneratedCarrierLabels
import PureSFormal.Research.RootResetEmptyAwareResponseAgreement
import PureSFormal.Research.RootResetNormalCarrierEmptyExclusion

/-! Whole-root executions of the fresh-response priority pass on actual
completed response carriers. Generated chronology supplies the worker tests. -/
namespace PureSFormal.Research.RootResetGeneratedFreshResponseExecution
open PureSFormal.PureS
open FiniteController RootResetProbeSequence RootResetCompletedResponseAgreement
open RootResetActivePendingAgreement RootResetActiveCleanParentsAgreement
open RootResetFreshAncestorExitAgreement RootResetFreshResponseExecution
open RootResetPersistentResponseSelector (carrierLocalCount? carrierTombstoneCount?)

theorem candidate_parsed_fresh {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {history : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents history)
    (layers : List Layer) (source : Term) (view : CheckpointDecoder.LocalView program)
    (parsed : CheckpointDecoder.parseLocal? program layout.tree source = some view) (fresh : view.status = .fresh)
    (data : List Bool) (decoded : CheckpointDecoder.decodeCarrier? program layout.tree view.accumulator = some data)
    (horizon remaining : Nat) (bits : List Bool)
    (continuationEq : view.continuation = RootResetEmptyHandoffContext.exitTerm program layout horizon remaining bits) :
    ∃ ticks, run (RootResetResponseCandidateProbe.worker program layout.tree).machine ticks
      ((RootResetResponseCandidateProbe.worker program layout.tree).initial (Cursor.atRoot
        (Cursor.rebuild parents (wrap (compileActions program layout.tree) layers source)))) =
      ⟨some (.done true), ⟨source, parentsAfter (compileActions program layout.tree) layers parents⟩⟩ := by
  let innerParents := parentsAfter (compileActions program layout.tree) layers parents
  let origin : Cursor := ⟨source, innerParents⟩
  have noMarked := RootResetMixedLocalFragment.marked_misses_fresh parsed fresh
  have wholeNoMarked : RootResetCompletedLocalPatterns.accepts .marked program layout.tree
      (wrap (compileActions program layout.tree) layers source) = false := by
    cases layers with
    | nil => exact noMarked
    | cons layer layers =>
        apply notMarked_of_noLocal
        apply CheckpointDecoder.parseLocal?_none_of_headArity
        · change 3 ≠ 5; decide
        · change 3 ≠ 6; decide
  have frameMiss : RootResetFrameCarrierGuard.frameHeadGuard source = false := by
    obtain ⟨halt, dispatcher, seedAudit, continuationAudit, haltShape, dispatchShape, sourceEq⟩ := CheckpointDecoder.parseLocal?_sound parsed
    rw [fresh] at haltShape
    cases haltShape with
    | fresh haltAudit => rw [sourceEq]; exact RootResetFrameCarrierGuard.frameHeadGuard_freshShell ..
  obtain ⟨frameTicks, _, frameRun⟩ := RootResetNestedFrameCost.missed_count (frameLayers (compileActions program layout.tree) layers)
    source parents (RootResetNestedFrameCost.parsed_local_stops parsed) frameMiss (parents_boundary outer _)
  obtain ⟨localTicks, left, audit, _, shape, localRun⟩ := RootResetDecodedCarrierNonemptyAgreement.decoded_fresh_runs
    parsed fresh (CheckpointDecoder.decodeCarrier?_sound program layout.tree decoded) origin rfl
    (parentsAfter_boundary program layout.tree layers parents (RootResetActiveMarkedFrontend.notRight_boundary _ (parents_boundary outer source)))
  have admitted := RootResetPendingAdmissionPatterns.childAdmitted_local parsed
  have found : RootResetFreshAncestorProbe.First program layout.tree origin true origin :=
    .found _ ((RootResetCompletedLocalPatterns.accepts_iff_parse .fresh program layout.tree source).mpr ⟨view, fresh, parsed⟩)
  cases data with
  | nil =>
      have refused : (RootResetPersistentRouteA.parseFreshNonempty? program layout.tree source).isSome = false := by
        simp only [RootResetPersistentRouteA.parseFreshNonempty?, parsed, fresh, decoded]
        rfl
      rw [refused] at localRun
      obtain ⟨p, pr⟩ := pending_misses_local origin parsed
      obtain ⟨s, sr⟩ := segment_stops program layout.tree origin p localTicks pr localRun
      obtain ⟨allTicks, allRun⟩ := segment_layers_terminal program layout.tree layers source parents admitted s .stopped origin sr
      obtain ⟨front, frontRun⟩ := forwarded program layout.tree _ origin frameTicks allTicks wholeNoMarked frameRun .stopped (by intro h; cases h) allRun
      obtain ⟨rootTicks, _, rootRun⟩ := cleanParents_terminal outer _ front false origin frontRun
      obtain ⟨searchTicks, _, searchRun⟩ := found.runs
      obtain ⟨ticks, _, actual⟩ := RootResetResponseCandidateProbe.generated program layout.tree _ rootTicks searchTicks false true origin origin rootRun searchRun
      exact ⟨ticks, actual⟩
  | cons first rest =>
      have accepted : (RootResetPersistentRouteA.parseFreshNonempty? program layout.tree source).isSome = true := by
        simp only [RootResetPersistentRouteA.parseFreshNonempty?, parsed, fresh, decoded]
        rfl
      rw [accepted] at localRun
      let exitCursor : Cursor := ⟨view.continuation, .left audit :: .right left :: innerParents⟩
      obtain ⟨s, sr⟩ := segment_of_local_run origin exitCursor parsed localTicks localRun
      obtain ⟨allTicks, allRun⟩ := segment_layers_terminal program layout.tree layers source parents admitted s .completedLocal exitCursor sr
      obtain ⟨front, frontRun⟩ := forwarded program layout.tree _ exitCursor frameTicks allTicks wholeNoMarked frameRun .completedLocal (by intro h; cases h) allRun
      obtain ⟨restTicks, restRun⟩ := exit_stops program layout horizon remaining bits (.left audit :: .right left :: innerParents) rfl
      rw [← continuationEq] at restRun
      have finish : run (RootResetActiveMarkedFrontend.machine program layout.tree) (front + restTicks)
          (RootResetActiveMarkedFrontend.initial program layout.tree ⟨wrap (compileActions program layout.tree) layers source, parents⟩) =
          ⟨some (.done false), exitCursor⟩ := by
        rw [run_add, frontRun]
        exact restRun
      obtain ⟨rootTicks, _, rootRun⟩ := cleanParents_terminal outer _ (front + restTicks) false exitCursor finish
      have firstNo : RootResetCompletedLocalPatterns.accepts .fresh program layout.tree view.continuation = false := by
        apply fresh_rejects_arity
        rw [continuationEq]
        cases remaining
        · change 4 ≠ 6; decide
        · change 3 ≠ 6; decide
      have secondNo : RootResetCompletedLocalPatterns.accepts .fresh program layout.tree (.app view.continuation audit) = false := by
        apply fresh_rejects_arity
        rw [continuationEq]
        cases remaining
        · change 5 ≠ 6; decide
        · change 4 ≠ 6; decide
      have recovered : RootResetFreshAncestorProbe.First program layout.tree exitCursor true origin := by
        apply RootResetFreshAncestorProbe.First.parent _ (.left audit) _ firstNo
        apply RootResetFreshAncestorProbe.First.parent _ (.right left) _ secondNo
        change RootResetFreshAncestorProbe.First program layout.tree ⟨.app left (.app view.continuation audit), innerParents⟩ true origin
        rw [← shape]
        exact found
      obtain ⟨searchTicks, _, searchRun⟩ := recovered.runs
      obtain ⟨ticks, _, actual⟩ := RootResetResponseCandidateProbe.generated program layout.tree _ rootTicks searchTicks false true exitCursor origin rootRun searchRun
      exact ⟨ticks, actual⟩

theorem parentsAfter_last (actions : Term) (layers : List Layer) (payload next : Term) (parents : List ParentFrame) :
    parentsAfter actions (layers ++ [(payload, next)]) parents =
      .right (.app (CheckpointDecoder.openEnvironment actions payload) next) :: parentsAfter actions layers parents := by
  induction layers generalizing parents with
  | nil => rfl
  | cons layer layers ih => exact ih _

theorem public_decode_of_path {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term} {data : List Bool}
    (admissible : Carrier.Admissible continuation) (path : CarrierDecoder.PathDecodes program tree bits continuation source data) :
    CheckpointDecoder.decodeCarrier? program tree source = some data :=
  CheckpointRun.decodeCarrier?_of_decode program tree bits continuation admissible
    (CarrierDecoder.decode?_complete program tree bits continuation admissible path)

theorem pending_parsed_forwarded {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {history : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents history)
    (layers : List Layer) (payload next source : Term) (view : CheckpointDecoder.LocalView program)
    (parsed : CheckpointDecoder.parseLocal? program layout.tree source = some view) (fresh : view.status = .fresh)
    (data : List Bool) (decoded : CheckpointDecoder.decodeCarrier? program layout.tree view.accumulator = some data)
    (horizon remaining : Nat) (bits : List Bool)
    (continuationEq : view.continuation = RootResetEmptyHandoffContext.exitTerm program layout horizon remaining bits)
    (endpoint : Cursor)
    (selected : Executes (RootResetEmptyAwareResponseProbe.worker program layout.tree)
      ⟨source, .right (.app (CheckpointDecoder.openEnvironment (compileActions program layout.tree) payload) next) ::
        parentsAfter (compileActions program layout.tree) layers parents⟩ true endpoint) :
    Executes (RootResetFreshResponsePass.worker program layout.tree)
      (Cursor.atRoot (Cursor.rebuild parents (wrap (compileActions program layout.tree) (layers ++ [(payload, next)]) source))) true endpoint := by
  obtain ⟨ticks, actual⟩ := candidate_parsed_fresh outer (layers ++ [(payload, next)]) source view parsed fresh data decoded horizon remaining bits continuationEq
  rw [parentsAfter_last] at actual
  have checkedRun := pending_forwarded program layout.tree _ endpoint true rfl (RootResetPendingParentProbe.pending_value ..) selected
  exact candidate_forwarded program layout.tree _ _ endpoint ticks true actual checkedRun

theorem pending_parsed_c4 {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {history : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents history)
    (layers : List Layer) (payload next source : Term) (view : CheckpointDecoder.LocalView program)
    (parsed : CheckpointDecoder.parseLocal? program layout.tree source = some view) (fresh : view.status = .fresh)
    (horizon remaining : Nat) (bits : List Bool)
    (continuationEq : view.continuation = RootResetEmptyHandoffContext.exitTerm program layout horizon remaining bits)
    (first : Bool) (rest : List Bool)
    (path : CarrierDecoder.PathDecodes program layout.tree bits
      (RootResetEmptyHandoffContext.exitTerm program layout horizon remaining bits) view.accumulator (first :: rest))
    (count : Nat) (locals : carrierLocalCount? program layout.tree view.accumulator = some count)
    (tombs : carrierTombstoneCount? program layout.tree view.accumulator = some (count + 1)) :
    ∃ address endpoint,
      RootResetSelectedFrontParserAgreement.firstLiveAddress? program layout.tree view.accumulator = some address ∧
      RootResetEdgeFragment.follow (RootResetResponseBoundaryStages.localAccumulatorAddress view ++ address)
        ⟨source, .right (.app (CheckpointDecoder.openEnvironment (compileActions program layout.tree) payload) next) ::
          parentsAfter (compileActions program layout.tree) layers parents⟩ = some endpoint ∧
      Executes (RootResetFreshResponsePass.worker program layout.tree)
        (Cursor.atRoot (Cursor.rebuild parents (wrap (compileActions program layout.tree) (layers ++ [(payload, next)]) source))) true endpoint := by
  have admissible := Dovetail.clockExit_admissible horizon remaining (environmentCode (compileActions program layout.tree) bits)
  have front := RootResetFrontNonemptyAgreement.generated_front_nonempty admissible path
  cases selected : RootResetSelectedFrontParserAgreement.firstLiveAddress? program layout.tree view.accumulator with
  | none => rw [selected] at front; cases front
  | some address =>
      have noCell := RootResetSelectedFrontParserAgreement.parseCell?_none_of_headArity_five_or_six (CheckpointDecoder.parseLocal?_headArity parsed)
      have wholeFront : RootResetSelectedFrontParserAgreement.firstLiveAddress? program layout.tree source =
          some (RootResetResponseBoundaryStages.localAccumulatorAddress view ++ address) := by
        rw [RootResetSelectedFrontParserAgreement.firstLiveAddress?, dif_pos noCell,
          CheckpointRun.parseBase?_none_of_localShape (CheckpointDecoder.parseLocal?_sound parsed), parsed]
        dsimp only
        rw [selected]
        rfl
      let origin : Cursor := ⟨source, .right (.app (CheckpointDecoder.openEnvironment (compileActions program layout.tree) payload) next) ::
        parentsAfter (compileActions program layout.tree) layers parents⟩
      obtain ⟨endpoint, followed⟩ := (RootResetCarrierOldestLiveAgreement.Value.local parsed
        (RootResetCarrierOldestLiveAgreement.Value.path admissible path)).follows origin rfl _ wholeFront
      obtain ⟨ticks, _, actual⟩ := RootResetCompletedResponseAgreement.pending_c4 admissible parsed fresh path count locals tombs
        origin endpoint rfl (RootResetCompleteCarrierRows.pending_boundary ..) address selected followed
      have nonempty := RootResetCompletedResponseAgreement.nonempty_local admissible parsed path origin rfl
        (RootResetCompleteCarrierRows.pending_boundary ..)
      have corrected := RootResetEmptyAwareResponseAgreement.nonempty_forwarded parsed fresh origin endpoint true rfl nonempty
        ⟨ticks, .done true, actual, rfl⟩
      exact ⟨address, endpoint, rfl, followed, pending_parsed_forwarded outer layers payload next source view parsed fresh
        (first :: rest) (public_decode_of_path admissible path) horizon remaining bits continuationEq endpoint corrected⟩

theorem commit_follow {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {source : Term} {view : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program tree source = some view) (parents : List ParentFrame) :
    ∃ endpoint, RootResetEdgeFragment.follow [.left, .left, .left] ⟨source, parents⟩ = some endpoint := by
  obtain ⟨halt, dispatch, seedAudit, continuationAudit, haltShape, dispatchShape, shape⟩ := CheckpointDecoder.parseLocal?_sound parsed
  rw [shape]
  exact ⟨_, rfl⟩

theorem pending_parsed_commit {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {history : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents history)
    (layers : List Layer) (payload next source : Term) (view : CheckpointDecoder.LocalView program)
    (parsed : CheckpointDecoder.parseLocal? program layout.tree source = some view) (fresh : view.status = .fresh)
    (horizon remaining : Nat) (bits : List Bool)
    (continuationEq : view.continuation = RootResetEmptyHandoffContext.exitTerm program layout horizon remaining bits)
    (path : CarrierDecoder.PathDecodes program layout.tree bits
      (RootResetEmptyHandoffContext.exitTerm program layout horizon remaining bits) view.accumulator [])
    (count : Nat) (locals : carrierLocalCount? program layout.tree view.accumulator = some count)
    (tombs : carrierTombstoneCount? program layout.tree view.accumulator = some (count + 1)) :
    ∃ endpoint, RootResetEdgeFragment.follow [.left, .left, .left]
        ⟨source, .right (.app (CheckpointDecoder.openEnvironment (compileActions program layout.tree) payload) next) ::
          parentsAfter (compileActions program layout.tree) layers parents⟩ = some endpoint ∧
      Executes (RootResetFreshResponsePass.worker program layout.tree)
        (Cursor.atRoot (Cursor.rebuild parents (wrap (compileActions program layout.tree) (layers ++ [(payload, next)]) source))) true endpoint := by
  have admissible := Dovetail.clockExit_admissible horizon remaining (environmentCode (compileActions program layout.tree) bits)
  obtain ⟨endpoint, followed⟩ := commit_follow parsed (.right (.app (CheckpointDecoder.openEnvironment (compileActions program layout.tree) payload) next) ::
    parentsAfter (compileActions program layout.tree) layers parents)
  obtain ⟨ticks, _, actual⟩ := RootResetCompletedResponseAgreement.pending_commit admissible parsed fresh path count locals tombs
    _ endpoint rfl (RootResetCompleteCarrierRows.pending_boundary ..) followed
  obtain ⟨commitTicks, commitState, _, commitRun, commitAnswer⟩ := RootResetCompletedResponseAtoms.commit_generated parsed fresh _ endpoint rfl followed
  have corrected := RootResetEmptyAwareResponseAgreement.commit_forwarded parsed fresh _ endpoint rfl
    (RootResetCompleteCarrierRows.pending_boundary ..) ⟨ticks, .done true, actual, rfl⟩
    ⟨commitTicks, commitState, commitRun, commitAnswer⟩
  exact ⟨endpoint, followed, pending_parsed_forwarded outer layers payload next source view parsed fresh []
    (public_decode_of_path admissible path) horizon remaining bits continuationEq endpoint corrected⟩

theorem pending_parsed_handoff {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {history : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents history)
    (layers : List Layer) (payload next source : Term) (view : CheckpointDecoder.LocalView program)
    (parsed : CheckpointDecoder.parseLocal? program layout.tree source = some view) (fresh : view.status = .fresh)
    (horizon remaining : Nat) (bits data : List Bool)
    (continuationEq : view.continuation = RootResetEmptyHandoffContext.exitTerm program layout horizon remaining bits)
    (path : CarrierDecoder.PathDecodes program layout.tree bits
      (RootResetEmptyHandoffContext.exitTerm program layout horizon remaining bits) view.accumulator data)
    (count : Nat) (locals : carrierLocalCount? program layout.tree view.accumulator = some count)
    (tombs : carrierTombstoneCount? program layout.tree view.accumulator = some (count + 2))
    (ordinaryOrigin : Executes (RootResetEmptyOriginProbe.worker program layout.tree)
      ⟨source, .right (.app (CheckpointDecoder.openEnvironment (compileActions program layout.tree) payload) next) ::
        parentsAfter (compileActions program layout.tree) layers parents⟩ false
      ⟨source, .right (.app (CheckpointDecoder.openEnvironment (compileActions program layout.tree) payload) next) ::
        parentsAfter (compileActions program layout.tree) layers parents⟩) :
    Executes (RootResetFreshResponsePass.worker program layout.tree)
      (Cursor.atRoot (Cursor.rebuild parents (wrap (compileActions program layout.tree) (layers ++ [(payload, next)]) source))) true
      ⟨frame (CheckpointDecoder.openEnvironment (compileActions program layout.tree) payload) next source,
        parentsAfter (compileActions program layout.tree) layers parents⟩ := by
  have admissible := Dovetail.clockExit_admissible horizon remaining (environmentCode (compileActions program layout.tree) bits)
  obtain ⟨ticks, _, actual⟩ := RootResetCompletedResponseAgreement.pending_handoff admissible parsed fresh path count locals tombs
    (compileActions program layout.tree) payload next (parentsAfter (compileActions program layout.tree) layers parents)
  have corrected := RootResetEmptyAwareResponseAgreement.ordinary_forwarded parsed fresh _ _ true rfl
    (RootResetCompleteCarrierRows.pending_boundary ..) ordinaryOrigin ⟨ticks, .done true, actual, rfl⟩
  exact pending_parsed_forwarded outer layers payload next source view parsed fresh data (public_decode_of_path admissible path)
    horizon remaining bits continuationEq _ corrected

theorem pass_selected (program : CTS.Program) (layout : ActionDispatcher program) (source : Term) (endpoint : Cursor)
    (selected : Executes (RootResetFreshResponsePass.worker program layout.tree) (Cursor.atRoot source) true endpoint) :
    ∃ after, endpoint.rdx? = some after ∧ RootResetFinitePrioritySelector.selectStep? program layout source = some after.erase := by
  obtain ⟨ticks, state, execution, answered⟩ := selected
  cases state with
  | testing _ | positive _ | negative _ => cases answered
  | done result =>
      have resultEq := Option.some.inj answered
      subst result
      obtain ⟨used, ready, returned, _, actual, _, safe⟩ := RootResetFreshResponsePass.all_input program layout.tree source
      have common := congrArg (run (RootResetFreshResponsePass.worker program layout.tree).machine used) execution
      rw [RootResetFreshResponsePass.terminal program layout.tree (.done true) true rfl,
        ← run_add, Nat.add_comm, run_add, actual,
        RootResetFreshResponsePass.terminal program layout.tree (.done ready) ready rfl] at common
      have cursorEq := congrArg Configuration.cursor common
      change returned = endpoint at cursorEq
      have stateEq : ready = true := by
        have equal := Option.some.inj (congrArg Configuration.control common)
        exact RootResetProbeBranch.Control.done.inj equal
      rw [cursorEq, stateEq] at safe
      cases contracted : endpoint.rdx? with
      | none => rw [contracted] at safe; cases safe
      | some after => exact ⟨after, rfl, RootResetFinitePriorityExecution.fresh_selected program layout source ticks
          (.done true) endpoint after execution rfl contracted⟩

theorem selectedResponseTrace_accumulator_facts
    {program : CTS.Program} {layout : ActionDispatcher program}
    {bits : List Bool} {continuation source : Term} {admissible : Carrier.Admissible continuation}
    {registers : SchedulerControl.Registers program} {bit : Bool} {suffix : List Bool}
    {outerContext fullContext innerContext targetContext : Context} {traceParents : List ParentFrame} {ticks count : Nat}
    (trace : SchedulerCycle.SelectedResponseTrace program layout bits continuation source admissible registers bit suffix
      outerContext fullContext innerContext targetContext traceParents ticks)
    (normal : RootResetOrderedCarrier.NormalInvariant program layout.tree bits continuation source registers.phase (bit :: suffix) count) :
    let responseRegisters := SchedulerCycle.scannedRegisters registers bit suffix
    let carrier := SchedulerCycle.deletedCarrier bit outerContext innerContext
    let accumulator := actionAccumulator program (responseRegisters.phase, bit) carrier
    CarrierDecoder.PathDecodes program layout.tree bits continuation accumulator
      (CTS.absorbingStep program ⟨registers.phase, bit :: suffix⟩).data ∧
      carrierLocalCount? program layout.tree accumulator = some count ∧
      carrierTombstoneCount? program layout.tree accumulator = some (count + 1) := by
  dsimp only
  have phaseEq : (SchedulerCycle.scannedRegisters registers bit suffix).phase = registers.phase := by
    rw [SchedulerCycle.scannedRegisters, SchedulerCycle.scanRegisters_phase]
    unfold SchedulerControl.Registers.observeLive
    split <;> rfl
  have decoded := CarrierActionDecode.decode_actionAccumulator program layout.tree bits continuation admissible
    ((SchedulerCycle.scannedRegisters registers bit suffix).phase, bit) trace.targetDecode
  rw [ActionDecode.outputData_eq_ordinaryStep_data, phaseEq] at decoded
  have counts := RootResetCarrierChronologyPreservation.selectedResponseTrace_chronology_preserved trace count normal.locals normal.tombstones
  have accumulatorCounts := RootResetResponseCarrierChronology.actionAccumulator_chronology program layout.tree
    ((SchedulerCycle.scannedRegisters registers bit suffix).phase, bit) (SchedulerCycle.deletedCarrier bit outerContext innerContext)
  refine ⟨?_, accumulatorCounts.1.trans counts.1, accumulatorCounts.2.trans counts.2.1⟩
  have path := CarrierDecoder.decode?_sound program layout.tree bits continuation admissible decoded
  rw [phaseEq]
  exact path

theorem selected_response_c4
    {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {history : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents history)
    (layers : List Layer) (payload next : Term) (horizon remaining : Nat) (bits : List Bool)
    {source : Term} {registers : SchedulerControl.Registers program} {bit : Bool} {suffix : List Bool}
    {outerContext fullContext innerContext targetContext : Context} {traceParents : List ParentFrame} {ticks count : Nat}
    (trace : SchedulerCycle.SelectedResponseTrace program layout bits
      (RootResetEmptyHandoffContext.exitTerm program layout horizon remaining bits) source (Dovetail.clockExit_admissible ..)
      registers bit suffix outerContext fullContext innerContext targetContext traceParents ticks)
    (normal : RootResetOrderedCarrier.NormalInvariant program layout.tree bits
      (RootResetEmptyHandoffContext.exitTerm program layout horizon remaining bits) source registers.phase (bit :: suffix) count)
    (first : Bool) (rest : List Bool) (output : (CTS.absorbingStep program ⟨registers.phase, bit :: suffix⟩).data = first :: rest) :
    let responseRegisters := SchedulerCycle.scannedRegisters registers bit suffix
    let carrier := SchedulerCycle.deletedCarrier bit outerContext innerContext
    let completed := LocalResponse.completed bits (RootResetEmptyHandoffContext.exitTerm program layout horizon remaining bits) carrier
      (SchedulerResponse.completedRoute program layout responseRegisters bit carrier)
    let view := CheckpointDecoder.completedView program (layout.route (responseRegisters.phase, bit)) (responseRegisters.phase, bit)
      (actionAccumulator program (responseRegisters.phase, bit) carrier) bits (RootResetEmptyHandoffContext.exitTerm program layout horizon remaining bits)
    ∃ address endpoint,
      RootResetSelectedFrontParserAgreement.firstLiveAddress? program layout.tree
        (actionAccumulator program (responseRegisters.phase, bit) carrier) = some address ∧
      RootResetEdgeFragment.follow (RootResetResponseBoundaryStages.localAccumulatorAddress view ++ address)
        ⟨completed, .right (.app (CheckpointDecoder.openEnvironment (compileActions program layout.tree) payload) next) ::
          parentsAfter (compileActions program layout.tree) layers parents⟩ = some endpoint ∧
      Executes (RootResetFreshResponsePass.worker program layout.tree)
        (Cursor.atRoot (Cursor.rebuild parents (wrap (compileActions program layout.tree) (layers ++ [(payload, next)]) completed))) true endpoint ∧
      ∃ after, endpoint.rdx? = some after ∧ RootResetFinitePrioritySelector.selectStep? program layout
        (Cursor.rebuild parents (wrap (compileActions program layout.tree) (layers ++ [(payload, next)]) completed)) = some after.erase := by
  dsimp only
  have facts := selectedResponseTrace_accumulator_facts trace normal
  dsimp only at facts
  rw [output] at facts
  have parsed := RootResetTraversableCompletedParents.TraversableParents.parseLocal?_fresh program layout
    (SchedulerCycle.scannedRegisters registers bit suffix) bit bits
    (RootResetEmptyHandoffContext.exitTerm program layout horizon remaining bits) (SchedulerCycle.deletedCarrier bit outerContext innerContext)
  obtain ⟨address, endpoint, selected, followed, actual⟩ := pending_parsed_c4 outer layers payload next _ _ parsed rfl horizon remaining bits rfl
    first rest facts.1 count facts.2.1 facts.2.2
  exact ⟨address, endpoint, selected, followed, actual, pass_selected program layout _ endpoint actual⟩

theorem selected_response_pending_commit
    {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {history : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents history)
    (layers : List Layer) (payload next : Term) (horizon remaining : Nat) (bits : List Bool)
    {source : Term} {registers : SchedulerControl.Registers program} {bit : Bool} {suffix : List Bool}
    {outerContext fullContext innerContext targetContext : Context} {traceParents : List ParentFrame} {ticks count : Nat}
    (trace : SchedulerCycle.SelectedResponseTrace program layout bits
      (RootResetEmptyHandoffContext.exitTerm program layout horizon remaining bits) source (Dovetail.clockExit_admissible ..)
      registers bit suffix outerContext fullContext innerContext targetContext traceParents ticks)
    (normal : RootResetOrderedCarrier.NormalInvariant program layout.tree bits
      (RootResetEmptyHandoffContext.exitTerm program layout horizon remaining bits) source registers.phase (bit :: suffix) count)
    (output : (CTS.absorbingStep program ⟨registers.phase, bit :: suffix⟩).data = []) :
    let responseRegisters := SchedulerCycle.scannedRegisters registers bit suffix
    let carrier := SchedulerCycle.deletedCarrier bit outerContext innerContext
    let completed := LocalResponse.completed bits (RootResetEmptyHandoffContext.exitTerm program layout horizon remaining bits) carrier
      (SchedulerResponse.completedRoute program layout responseRegisters bit carrier)
    ∃ endpoint, RootResetEdgeFragment.follow [.left, .left, .left]
        ⟨completed, .right (.app (CheckpointDecoder.openEnvironment (compileActions program layout.tree) payload) next) ::
          parentsAfter (compileActions program layout.tree) layers parents⟩ = some endpoint ∧
      Executes (RootResetFreshResponsePass.worker program layout.tree)
        (Cursor.atRoot (Cursor.rebuild parents (wrap (compileActions program layout.tree) (layers ++ [(payload, next)]) completed))) true endpoint ∧
      ∃ after, endpoint.rdx? = some after ∧ RootResetFinitePrioritySelector.selectStep? program layout
        (Cursor.rebuild parents (wrap (compileActions program layout.tree) (layers ++ [(payload, next)]) completed)) = some after.erase := by
  dsimp only
  have facts := selectedResponseTrace_accumulator_facts trace normal
  dsimp only at facts
  rw [output] at facts
  have parsed := RootResetTraversableCompletedParents.TraversableParents.parseLocal?_fresh program layout
    (SchedulerCycle.scannedRegisters registers bit suffix) bit bits
    (RootResetEmptyHandoffContext.exitTerm program layout horizon remaining bits) (SchedulerCycle.deletedCarrier bit outerContext innerContext)
  obtain ⟨endpoint, followed, actual⟩ := pending_parsed_commit outer layers payload next _ _ parsed rfl horizon remaining bits rfl facts.1 count facts.2.1 facts.2.2
  exact ⟨endpoint, followed, actual, pass_selected program layout _ endpoint actual⟩

theorem nonpending_parsed_commit {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {history : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents history)
    (source : Term) (view : CheckpointDecoder.LocalView program)
    (parsed : CheckpointDecoder.parseLocal? program layout.tree source = some view) (fresh : view.status = .fresh)
    (horizon remaining : Nat) (bits : List Bool)
    (continuationEq : view.continuation = RootResetEmptyHandoffContext.exitTerm program layout horizon remaining bits)
    (path : CarrierDecoder.PathDecodes program layout.tree bits
      (RootResetEmptyHandoffContext.exitTerm program layout horizon remaining bits) view.accumulator []) :
    ∃ endpoint, RootResetEdgeFragment.follow [.left, .left, .left] ⟨source, parents⟩ = some endpoint ∧
      Executes (RootResetFreshResponsePass.worker program layout.tree) (Cursor.atRoot (Cursor.rebuild parents source)) true endpoint := by
  have admissible := Dovetail.clockExit_admissible horizon remaining (environmentCode (compileActions program layout.tree) bits)
  obtain ⟨endpoint, followed⟩ := commit_follow parsed parents
  have boundary : RootResetCompleteCarrierRows.Boundary ⟨source, parents⟩ := by
    cases outer
    · exact RootResetCompleteCarrierRows.root_boundary source
    · exact RootResetCompleteCarrierRows.left_boundary source _ _
    · exact RootResetCompleteCarrierRows.left_boundary source _ _
  obtain ⟨ticks, _, actual⟩ := RootResetCompletedResponseAgreement.nonpending_commit admissible parsed fresh path
    ⟨source, parents⟩ endpoint rfl boundary followed
  have incoming : Probe.observeIncoming ⟨source, parents⟩ ≠ .right := by
    have notRight := parents_boundary outer source
    cases parents with
    | nil => intro h; cases h
    | cons frame parents => cases frame with
      | left _ => intro h; cases h
      | right _ => cases notRight
  have selected := nonpending_forwarded program layout.tree _ endpoint true incoming ⟨ticks, .done true, actual, rfl⟩
  obtain ⟨candidateTicks, candidateRun⟩ := candidate_parsed_fresh outer [] source view parsed fresh []
    (public_decode_of_path admissible path) horizon remaining bits continuationEq
  exact ⟨endpoint, followed, candidate_forwarded program layout.tree _ _ endpoint candidateTicks true candidateRun selected⟩

theorem selected_response_nonpending_commit
    {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {history : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents history)
    (horizon remaining : Nat) (bits : List Bool)
    {source : Term} {registers : SchedulerControl.Registers program} {bit : Bool} {suffix : List Bool}
    {outerContext fullContext innerContext targetContext : Context} {traceParents : List ParentFrame} {ticks count : Nat}
    (trace : SchedulerCycle.SelectedResponseTrace program layout bits
      (RootResetEmptyHandoffContext.exitTerm program layout horizon remaining bits) source (Dovetail.clockExit_admissible ..)
      registers bit suffix outerContext fullContext innerContext targetContext traceParents ticks)
    (normal : RootResetOrderedCarrier.NormalInvariant program layout.tree bits
      (RootResetEmptyHandoffContext.exitTerm program layout horizon remaining bits) source registers.phase (bit :: suffix) count)
    (output : (CTS.absorbingStep program ⟨registers.phase, bit :: suffix⟩).data = []) :
    let responseRegisters := SchedulerCycle.scannedRegisters registers bit suffix
    let carrier := SchedulerCycle.deletedCarrier bit outerContext innerContext
    let completed := LocalResponse.completed bits (RootResetEmptyHandoffContext.exitTerm program layout horizon remaining bits) carrier
      (SchedulerResponse.completedRoute program layout responseRegisters bit carrier)
    ∃ endpoint after, RootResetEdgeFragment.follow [.left, .left, .left] ⟨completed, parents⟩ = some endpoint ∧
      endpoint.rdx? = some after ∧ RootResetFinitePrioritySelector.selectStep? program layout (Cursor.rebuild parents completed) = some after.erase := by
  dsimp only
  have facts := selectedResponseTrace_accumulator_facts trace normal
  dsimp only at facts
  rw [output] at facts
  have parsed := RootResetTraversableCompletedParents.TraversableParents.parseLocal?_fresh program layout
    (SchedulerCycle.scannedRegisters registers bit suffix) bit bits
    (RootResetEmptyHandoffContext.exitTerm program layout horizon remaining bits) (SchedulerCycle.deletedCarrier bit outerContext innerContext)
  obtain ⟨endpoint, followed, actual⟩ := nonpending_parsed_commit outer _ _ parsed rfl horizon remaining bits rfl facts.1
  obtain ⟨after, contracted, selected⟩ := pass_selected program layout _ endpoint actual
  exact ⟨endpoint, after, followed, contracted, selected⟩

theorem path_local_accumulator {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term} {data : List Bool} {view : CheckpointDecoder.LocalView program}
    (path : CarrierDecoder.PathDecodes program tree bits continuation source data)
    (parsed : CheckpointDecoder.parseLocal? program tree source = some view) :
    CarrierDecoder.PathDecodes program tree bits continuation view.accumulator data := by
  cases path with
  | root inner => cases inner with
    | base queue beta decoded =>
        have rejected := CheckpointRun.parseBase?_none_of_localShape (CheckpointDecoder.parseLocal?_sound parsed)
        rw [CheckpointDecoder.parseBase?_mutableBase] at rejected
        cases rejected
    | @«local» accumulator dispatcher result data inner dispatch shell =>
        obtain ⟨route, label, dispatchShape⟩ := dispatch
        cases shell with
        | fresh haltAudit seedAudit continuationAudit =>
            let foundView : CheckpointDecoder.LocalView program := ⟨.fresh, route, label, accumulator, word bits, continuation⟩
            have shape : CheckpointDecoder.LocalShape program tree foundView
                (Carrier.activeShell bits continuation (freshHField haltAudit) dispatcher seedAudit continuationAudit) :=
              ⟨freshHField haltAudit, dispatcher, seedAudit, continuationAudit, .fresh haltAudit, dispatchShape, rfl⟩
            have equal := Option.some.inj (parsed.symm.trans (CheckpointDecoder.parseLocal?_complete shape))
            rw [equal]
            exact inner
        | marked leftAudit rightAudit seedAudit continuationAudit =>
            let foundView : CheckpointDecoder.LocalView program := ⟨.marked, route, label, accumulator, word bits, continuation⟩
            have shape : CheckpointDecoder.LocalShape program tree foundView
                (Carrier.activeShell bits continuation (Carrier.markedHField leftAudit rightAudit) dispatcher seedAudit continuationAudit) :=
              ⟨Carrier.markedHField leftAudit rightAudit, dispatcher, seedAudit, continuationAudit, .marked leftAudit rightAudit, dispatchShape, rfl⟩
            have equal := Option.some.inj (parsed.symm.trans (CheckpointDecoder.parseLocal?_complete shape))
            rw [equal]
            exact inner
  | @live tail data bit inner =>
      have rejected := CheckpointDecoder.parseLocal?_none_of_headArity program tree (.app (live bit) tail)
        (by change 3 ≠ 5; decide) (by change 3 ≠ 6; decide)
      rw [parsed] at rejected
      cases rejected
  | @tombstone predecessor data bit audit inner =>
      have rejected := CheckpointDecoder.parseLocal?_none_of_headArity program tree (Carrier.tombstone bit predecessor audit)
        (by change 2 ≠ 5; decide) (by change 2 ≠ 6; decide)
      rw [parsed] at rejected
      cases rejected

theorem selected_response_handoff
    {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {history : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents history)
    (layers : List Layer) (payload next : Term) (horizon remaining : Nat) (bits : List Bool)
    {source : Term} {view : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program layout.tree source = some view) (fresh : view.status = .fresh)
    (continuationEq : view.continuation = RootResetEmptyHandoffContext.exitTerm program layout horizon remaining bits)
    {registers : SchedulerControl.Registers program} {bit : Bool} {suffix : List Bool}
    {outerContext fullContext innerContext targetContext : Context} {traceParents : List ParentFrame} {ticks count : Nat}
    (trace : SchedulerCycle.SelectedResponseTrace program layout bits
      (RootResetEmptyHandoffContext.exitTerm program layout horizon remaining bits) source (Dovetail.clockExit_admissible ..)
      registers bit suffix outerContext fullContext innerContext targetContext traceParents ticks)
    (normal : RootResetOrderedCarrier.NormalInvariant program layout.tree bits
      (RootResetEmptyHandoffContext.exitTerm program layout horizon remaining bits) source registers.phase (bit :: suffix) (count + 1)) :
    let target := SchedulerCycle.deletedCarrier bit outerContext innerContext
    let endpoint : Cursor := ⟨frame (CheckpointDecoder.openEnvironment (compileActions program layout.tree) payload) next target,
      parentsAfter (compileActions program layout.tree) layers parents⟩
    ∃ after, Executes (RootResetFreshResponsePass.worker program layout.tree)
        (Cursor.atRoot (Cursor.rebuild parents (wrap (compileActions program layout.tree) (layers ++ [(payload, next)]) target))) true endpoint ∧
      endpoint.rdx? = some after ∧ RootResetFinitePrioritySelector.selectStep? program layout
        (Cursor.rebuild parents (wrap (compileActions program layout.tree) (layers ++ [(payload, next)]) target)) = some after.erase := by
  dsimp only
  have admissible := Dovetail.clockExit_admissible horizon remaining (environmentCode (compileActions program layout.tree) bits)
  have sourceNoBase := CheckpointRun.parseBase?_none_of_localShape (CheckpointDecoder.parseLocal?_sound parsed)
  have sourceLocals : carrierLocalCount? program layout.tree view.accumulator = some count := by
    have mapped := normal.locals
    rw [RootResetPersistentResponseSelector.carrierLocalCount?, sourceNoBase, parsed] at mapped
    exact RootResetCompletedFrontPreservation.map_succ_injective mapped
  have sourceTombs : carrierTombstoneCount? program layout.tree view.accumulator = some (count + 1) := by
    have counted := normal.tombstones
    rw [RootResetPersistentResponseSelector.carrierTombstoneCount?, sourceNoBase, parsed] at counted
    exact counted
  obtain ⟨_, _, certificate⟩ := SchedulerAscent.selectedFront_deleteAtPath trace.selected trace.sourceDescent trace.path
  have contracts : source.contractAt? (CanonicalTraversal.contextAddress outerContext) =
      some (SchedulerCycle.deletedCarrier bit outerContext innerContext) := by
    rw [Term.contractAt?, certificate.selected_subterm]
    exact certificate.endpoint_replace
  obtain ⟨accumulator, shape⟩ := RootResetCompletedFrontPreservation.localShape_after_selectedFront admissible parsed trace.selected contracts
  have targetParsed := CheckpointDecoder.parseLocal?_complete shape
  have stepCounts := RootResetCompletedFrontPreservation.localCountStep_accumulators parsed targetParsed
    (RootResetCarrierChronologyPreservation.selectedResponseTrace_countStep trace)
  change RootResetCarrierChronologyPreservation.CountStep program layout.tree view.accumulator accumulator at stepCounts
  have locals : carrierLocalCount? program layout.tree accumulator = some count := stepCounts.locals.trans sourceLocals
  have tombs : carrierTombstoneCount? program layout.tree accumulator = some (count + 2) := by
    rw [stepCounts.tombstones, sourceTombs]
    rfl
  have targetPath := CarrierDecoder.decode?_sound program layout.tree bits _ admissible trace.targetDecode
  have accPath := path_local_accumulator targetPath targetParsed
  obtain ⟨originTicks, originState, _, originRun, originAnswer⟩ := RootResetNormalCarrierEmptyExclusion.selected_deleted_runs trace normal
    ⟨SchedulerCycle.deletedCarrier bit outerContext innerContext,
      .right (.app (CheckpointDecoder.openEnvironment (compileActions program layout.tree) payload) next) ::
        parentsAfter (compileActions program layout.tree) layers parents⟩ rfl (RootResetCompleteCarrierRows.pending_boundary ..)
  have actual := pending_parsed_handoff outer layers payload next _ _ targetParsed fresh horizon remaining bits suffix continuationEq
    accPath count locals tombs ⟨originTicks, originState, originRun, originAnswer⟩
  obtain ⟨after, contracted, selected⟩ := pass_selected program layout _ _ actual
  exact ⟨after, actual, contracted, selected⟩

end PureSFormal.Research.RootResetGeneratedFreshResponseExecution
