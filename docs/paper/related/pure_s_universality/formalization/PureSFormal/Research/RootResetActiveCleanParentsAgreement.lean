import PureSFormal.Research.RootResetActiveMarkedFrontend
import PureSFormal.Research.RootResetCleanParentPrefix

/-! Exact finite frontend entry through the actual generated completed parent
stacks. The marked guard gives the same priority as the public active-context
parser, including marked audit fields with unrestricted syntax. -/
namespace PureSFormal.Research.RootResetActiveCleanParentsAgreement
open PureSFormal.PureS
open FiniteController
open RootResetCarrierNonemptyProbe (run_to_boundary)
open RootResetActiveMarkedFrontend
open RootResetCleanTraversableParents

theorem pending_misses_local {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    (origin : Cursor) {view : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program tree origin.focus = some view) :
    ∃ ticks, run (RootResetPendingAdmissionFragment.machine program tree) ticks
      (RootResetPendingAdmissionFragment.initial program tree origin) = ⟨some (.done false), origin⟩ := by
  obtain ⟨ticks, entered, after, bounded, execution, outcome⟩ := RootResetPendingAdmissionFragment.bounded_input program tree origin
  cases outcome with
  | stopped refused => exact ⟨ticks, execution⟩
  | entered payload continuation child shape admitted =>
      have none := RootResetPendingAdmissionFragment.pending_excludes_local (.entered payload continuation child shape admitted)
      rw [parsed] at none
      cases none

theorem segment_of_local_run {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    (origin endpoint : Cursor) {view : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program tree origin.focus = some view)
    (ticks : Nat) (execution : run (RootResetMixedLocalFragment.machine program tree) ticks
      (RootResetMixedLocalFragment.initial program tree origin) = ⟨some (.done true), endpoint⟩) :
    ∃ used, run (Segment.machine program tree) used (Segment.initial program tree origin) =
      ⟨some (.done .completedLocal), endpoint⟩ := by
  obtain ⟨pendingTicks, pendingRun⟩ := pending_misses_local origin parsed
  obtain ⟨p, pb, pr⟩ := RootResetPendingAdmissionInterleaved.pending_runs program tree origin origin false pendingTicks pendingRun
  obtain ⟨l, lb, lr⟩ := RootResetPendingAdmissionInterleaved.local_runs program tree origin endpoint true ticks execution
  have firstRun : run (RootResetPendingAdmissionInterleaved.machine program tree) (p + 1 + (l + 1))
      (RootResetPendingAdmissionInterleaved.initial program tree origin) = ⟨some (.done .completedLocal), endpoint⟩ := by
    rw [run_add, pr]
    exact lr
  obtain ⟨used, bounded, lifted⟩ := run_to_boundary (RootResetPendingAdmissionSegment.base program tree)
    (Segment.machine program tree) (fun pc => pc) RootResetPendingAdmissionSegment.done?
    (RootResetPendingAdmissionSegment.base_absorbs program tree)
    (fun configuration running => by
      rw [RootResetMixedContinuationSpine.lift_id, RootResetMixedContinuationSpine.lift_id]
      exact RootResetPendingAdmissionSegment.step_before_done program tree configuration running)
    _ (Segment.initial program tree origin) (by rw [firstRun]; rfl)
  rw [RootResetMixedContinuationSpine.lift_id, firstRun, RootResetMixedContinuationSpine.lift_id] at lifted
  exact ⟨used, lifted⟩

theorem continue_local {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    (origin endpoint : Cursor) {view : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program tree origin.focus = some view)
    (notMarked : RootResetCompletedLocalPatterns.accepts .marked program tree origin.focus = false)
    (frameMiss : RootResetFrameCarrierGuard.frameHeadGuard origin.focus = false)
    (boundary : RootResetNestedFramePatterns.rightParent? origin = false)
    (ticks : Nat) (execution : run (RootResetMixedLocalFragment.machine program tree) ticks
      (RootResetMixedLocalFragment.initial program tree origin) = ⟨some (.done true), endpoint⟩) :
    ∃ used, run (machine program tree) used (initial program tree origin) = initial program tree endpoint := by
  obtain ⟨m, mb, mr⟩ := marked_runs program tree origin
  rw [notMarked] at mr
  obtain ⟨frameTicks, frameBound, frameRun⟩ := RootResetNestedFrameCost.missed_count [] origin.focus origin.parents
    (RootResetNestedFrameCost.parsed_local_stops parsed) frameMiss boundary
  have frameRun' : run RootResetNestedFrameProbe.machine frameTicks (RootResetNestedFrameProbe.initial origin) =
      ⟨some (.done false), origin⟩ := frameRun
  obtain ⟨f, fb, fr⟩ := frame_runs program tree origin origin frameTicks false frameRun'
  obtain ⟨segmentTicks, segmentRun⟩ := segment_of_local_run origin endpoint parsed ticks execution
  obtain ⟨s, sb, sr⟩ := segment_runs program tree origin endpoint segmentTicks .completedLocal (by intro h; cases h) segmentRun
  refine ⟨m + 1 + (f + 1) + s + 1, ?_⟩
  have first : run (machine program tree) (m + 1 + (f + 1)) (initial program tree origin) = segment program tree origin := by
    rw [run_add, mr]
    exact fr
  have second : run (machine program tree) (m + 1 + (f + 1) + s) (initial program tree origin) =
      ⟨some (.segment (.done .completedLocal)), endpoint⟩ := by
    rw [run_add, first]
    exact sr
  rw [run_add, second]
  rfl

theorem marked_continues {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    (origin : Cursor) {view : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program tree origin.focus = some view)
    (marked : view.status = .marked) (left audit : Term)
    (shape : origin.focus = .app left (.app view.continuation audit)) :
    ∃ ticks, run (machine program tree) ticks (initial program tree origin) =
      initial program tree ⟨view.continuation, .left audit :: .right left :: origin.parents⟩ := by
  obtain ⟨m, mb, mr⟩ := marked_runs program tree origin
  have accepted := (RootResetCompletedLocalPatterns.accepts_iff_parse .marked program tree origin.focus).mpr ⟨view, marked, parsed⟩
  rw [accepted] at mr
  refine ⟨m + 1 + 3, ?_⟩
  rw [run_add, mr]
  rcases origin with ⟨source, parents⟩
  change source = _ at shape
  subst source
  rfl

theorem fresh_continues {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    (origin : Cursor) {view : CheckpointDecoder.LocalView program} {first : Bool} {rest : List Bool}
    (parsed : CheckpointDecoder.parseLocal? program tree origin.focus = some view)
    (fresh : view.status = .fresh)
    (decoded : CheckpointDecoder.decodeCarrier? program tree view.accumulator = some (first :: rest))
    (boundary : RootResetNestedFramePatterns.rightParent? origin = false) :
    ∃ ticks left audit, origin.focus = .app left (.app view.continuation audit) ∧
      run (machine program tree) ticks (initial program tree origin) =
        initial program tree ⟨view.continuation, .left audit :: .right left :: origin.parents⟩ := by
  have carrier := CheckpointDecoder.decodeCarrier?_sound program tree decoded
  obtain ⟨ticks, left, audit, bounded, shape, execution⟩ := RootResetDecodedCarrierNonemptyAgreement.decoded_fresh_runs
    parsed fresh carrier origin rfl (notRight_boundary origin boundary)
  have accepted : (RootResetPersistentRouteA.parseFreshNonempty? program tree origin.focus).isSome = true := by
    simp only [RootResetPersistentRouteA.parseFreshNonempty?, parsed, fresh, decoded]
    rfl
  rw [accepted] at execution
  have frameMiss : RootResetFrameCarrierGuard.frameHeadGuard origin.focus = false := by
    obtain ⟨halt, dispatcher, seedAudit, continuationAudit, haltShape, dispatchShape, sourceEq⟩ := CheckpointDecoder.parseLocal?_sound parsed
    rw [fresh] at haltShape
    cases haltShape with
    | fresh haltAudit =>
        rw [sourceEq]
        exact RootResetFrameCarrierGuard.frameHeadGuard_freshShell _ _ _ _ _ _
  obtain ⟨used, result⟩ := continue_local origin _ parsed (RootResetMixedLocalFragment.marked_misses_fresh parsed fresh)
    frameMiss boundary ticks execution
  exact ⟨used, left, audit, shape, result⟩

theorem parents_boundary {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {parents : List ParentFrame} {layers : Nat}
    (outer : CleanParents program dispatcher parents layers) (endpoint : Term) :
    RootResetNestedFramePatterns.rightParent? ⟨endpoint, parents⟩ = false := by
  cases outer <;> rfl

theorem fresh_layer (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool)
    (bits : List Bool) (endpoint carrier : Term) (parents : List ParentFrame)
    (nonempty : ∃ first rest, CheckpointDecoder.decodeCarrier? program dispatcher.tree
      (actionAccumulator program (registers.phase, bit) carrier) = some (first :: rest))
    (boundary : RootResetNestedFramePatterns.rightParent? ⟨LocalResponse.completed bits endpoint carrier
      (SchedulerResponse.completedRoute program dispatcher registers bit carrier), parents⟩ = false) :
    ∃ ticks, run (machine program dispatcher.tree) ticks
      (initial program dispatcher.tree ⟨LocalResponse.completed bits endpoint carrier
        (SchedulerResponse.completedRoute program dispatcher registers bit carrier), parents⟩) =
      initial program dispatcher.tree ⟨endpoint,
        SchedulerRootContinuation.freshContinuationParents program dispatcher registers bit bits carrier parents⟩ := by
  obtain ⟨first, rest, decoded⟩ := nonempty
  have parsed := RootResetTraversableCompletedParents.TraversableParents.parseLocal?_fresh
    program dispatcher registers bit bits endpoint carrier
  obtain ⟨ticks, left, audit, shape, execution⟩ := fresh_continues _ parsed rfl decoded boundary
  have fields := Term.app.inj shape
  have auditEq := (Term.app.inj fields.2).2
  rw [← fields.1, ← auditEq] at execution
  exact ⟨ticks, execution⟩

theorem marked_layer (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool)
    (bits : List Bool) (endpoint carrier : Term) (parents : List ParentFrame) :
    ∃ ticks, run (machine program dispatcher.tree) ticks
      (initial program dispatcher.tree ⟨LocalResponse.markedCompleted bits endpoint carrier
        (SchedulerResponse.completedRoute program dispatcher registers bit carrier), parents⟩) =
      initial program dispatcher.tree ⟨endpoint,
        SchedulerRootContinuation.markedContinuationParents program dispatcher registers bit bits carrier parents⟩ := by
  have parsed := CheckpointDecoder.parseLocal?_markedCompleted (continuation := endpoint) bits
    (SchedulerResponse.completedRoute_snapshotDispatch program dispatcher registers bit carrier)
  exact marked_continues ⟨_, parents⟩ parsed rfl
    (SchedulerResponse.localContinuationLeft bits (Carrier.markedHField carrier carrier)
      (SchedulerResponse.completedRoute program dispatcher registers bit carrier) carrier) carrier rfl

theorem cleanParents_enters {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {parents : List ParentFrame} {layers : Nat}
    (outer : CleanParents program dispatcher parents layers) (endpoint : Term) :
    ∃ ticks, run (machine program dispatcher.tree) ticks
      (initial program dispatcher.tree (Cursor.atRoot (Cursor.rebuild parents endpoint))) =
      initial program dispatcher.tree ⟨endpoint, parents⟩ := by
  induction outer generalizing endpoint with
  | root => exact ⟨0, rfl⟩
  | @fresh parents layers outer registers bit bits carrier nonempty clean ih =>
      let localTerm := LocalResponse.completed bits endpoint carrier
        (SchedulerResponse.completedRoute program dispatcher registers bit carrier)
      obtain ⟨previous, previousRun⟩ := ih localTerm
      obtain ⟨ticks, execution⟩ := fresh_layer program dispatcher registers bit bits endpoint carrier parents
        nonempty (parents_boundary outer localTerm)
      refine ⟨previous + ticks, ?_⟩
      rw [SchedulerCompletedContext.CompletedParents.rebuild_freshContinuationParents, run_add, previousRun]
      exact execution
  | @marked parents layers outer registers bit bits carrier ih =>
      let localTerm := LocalResponse.markedCompleted bits endpoint carrier
        (SchedulerResponse.completedRoute program dispatcher registers bit carrier)
      obtain ⟨previous, previousRun⟩ := ih localTerm
      obtain ⟨ticks, execution⟩ := marked_layer program dispatcher registers bit bits endpoint carrier parents
      refine ⟨previous + ticks, ?_⟩
      rw [SchedulerCompletedContext.CompletedParents.rebuild_markedContinuationParents, run_add, previousRun]
      exact execution

theorem terminal_unique (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin first last : Cursor) (firstTicks lastTicks : Nat) (firstReady lastReady : Bool)
    (firstRun : run (machine program tree) firstTicks (initial program tree origin) = ⟨some (.done firstReady), first⟩)
    (lastRun : run (machine program tree) lastTicks (initial program tree origin) = ⟨some (.done lastReady), last⟩) :
    firstReady = lastReady ∧ first = last := by
  have leftRun : run (machine program tree) (firstTicks + lastTicks) (initial program tree origin) = ⟨some (.done firstReady), first⟩ := by
    rw [run_add, firstRun, done_absorbs]
  have rightRun : run (machine program tree) (firstTicks + lastTicks) (initial program tree origin) = ⟨some (.done lastReady), last⟩ := by
    rw [Nat.add_comm, run_add, lastRun, done_absorbs]
  have equal := leftRun.symm.trans rightRun
  exact ⟨Control.done.inj (Option.some.inj (congrArg Configuration.control equal)), congrArg Configuration.cursor equal⟩

theorem bounded_terminal (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin endpoint : Cursor) (boundary : RootResetNestedFramePatterns.rightParent? origin = false)
    (ticks : Nat) (ready : Bool)
    (execution : run (machine program tree) ticks (initial program tree origin) = ⟨some (.done ready), endpoint⟩) :
    ∃ used, used ≤ coefficient program tree * origin.focus.size ∧
      run (machine program tree) used (initial program tree origin) = ⟨some (.done ready), endpoint⟩ := by
  obtain ⟨used, foundReady, found, bounded, actual, trace, facts⟩ := scan_within program tree origin boundary
  obtain ⟨readyEq, cursorEq⟩ := terminal_unique program tree origin found endpoint used ticks foundReady ready actual execution
  rw [readyEq, cursorEq] at actual
  exact ⟨used, bounded, actual⟩

theorem cleanParents_terminal {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {parents : List ParentFrame} {layers : Nat}
    (outer : CleanParents program dispatcher parents layers) (endpoint : Term)
    (ticks : Nat) (ready : Bool) (after : Cursor)
    (execution : run (machine program dispatcher.tree) ticks (initial program dispatcher.tree ⟨endpoint, parents⟩) =
      ⟨some (.done ready), after⟩) :
    ∃ used, used ≤ coefficient program dispatcher.tree * (Cursor.rebuild parents endpoint).size ∧
      run (machine program dispatcher.tree) used
        (initial program dispatcher.tree (Cursor.atRoot (Cursor.rebuild parents endpoint))) = ⟨some (.done ready), after⟩ := by
  obtain ⟨prefixTicks, prefixRun⟩ := cleanParents_enters outer endpoint
  apply bounded_terminal program dispatcher.tree (Cursor.atRoot (Cursor.rebuild parents endpoint)) after rfl (prefixTicks + ticks) ready
  rw [run_add, prefixRun]
  exact execution

theorem accepted_frame (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin endpoint : Cursor) (ticks : Nat)
    (notMarked : RootResetCompletedLocalPatterns.accepts .marked program tree origin.focus = false)
    (execution : run RootResetNestedFrameProbe.machine ticks (RootResetNestedFrameProbe.initial origin) =
      ⟨some (.done true), endpoint⟩) :
    ∃ used, run (machine program tree) used (initial program tree origin) = ⟨some (.done true), endpoint⟩ := by
  obtain ⟨m, mb, mr⟩ := marked_runs program tree origin
  rw [notMarked] at mr
  obtain ⟨f, fb, fr⟩ := frame_runs program tree origin endpoint ticks true execution
  refine ⟨m + 1 + (f + 1), ?_⟩
  rw [run_add, mr]
  exact fr

theorem notMarked_of_noLocal {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {source : Term} (noLocal : CheckpointDecoder.parseLocal? program tree source = none) :
    RootResetCompletedLocalPatterns.accepts .marked program tree source = false := by
  cases accepted : RootResetCompletedLocalPatterns.accepts .marked program tree source with
  | false => rfl
  | true =>
      obtain ⟨view, status, parsed⟩ := (RootResetCompletedLocalPatterns.accepts_iff_parse .marked program tree source).mp accepted
      rw [noLocal] at parsed
      cases parsed

theorem wrapped_noLocal {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    (layers : List RootResetFrameSpineWalker.Layer) {body : Term}
    (noLocal : CheckpointDecoder.parseLocal? program tree body = none) :
    CheckpointDecoder.parseLocal? program tree (RootResetFrameSpineWalker.wrap layers body) = none := by
  cases layers with
  | nil => exact noLocal
  | cons layer layers =>
      apply CheckpointDecoder.parseLocal?_none_of_headArity
      · change 3 ≠ 5; decide
      · change 3 ≠ 6; decide

theorem cleanParents_frame_first {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {parents : List ParentFrame} {count : Nat} (outer : CleanParents program dispatcher parents count)
    (layers : List RootResetFrameSpineWalker.Layer) (bits : List Bool) (continuation carrier : Term) :
    ∃ used, used ≤ coefficient program dispatcher.tree * (Cursor.rebuild parents
      (RootResetFrameSpineWalker.wrap layers (SchedulerResponseInvariant.frameFirstRoot
        (compileActions program dispatcher.tree) bits continuation carrier))).size ∧
      run (machine program dispatcher.tree) used (initial program dispatcher.tree (Cursor.atRoot (Cursor.rebuild parents
        (RootResetFrameSpineWalker.wrap layers (SchedulerResponseInvariant.frameFirstRoot
          (compileActions program dispatcher.tree) bits continuation carrier))))) =
        ⟨some (.done true), RootResetNestedFrameAgreement.firstCursor (compileActions program dispatcher.tree)
          bits carrier continuation (RootResetFrameSpineWalker.spineParents layers parents)⟩ := by
  obtain ⟨ticks, bound, execution⟩ := RootResetNestedFrameAgreement.generated_first layers
    (compileActions program dispatcher.tree) bits continuation carrier parents
  obtain ⟨used, actual⟩ := accepted_frame program dispatcher.tree _ _ ticks
    (notMarked_of_noLocal (wrapped_noLocal layers
      (RootResetFrameFirstSelectorProof.first_local_none program dispatcher bits continuation carrier))) execution
  exact cleanParents_terminal outer _ used true _ actual

theorem cleanParents_frame_second {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {parents : List ParentFrame} {count : Nat} (outer : CleanParents program dispatcher parents count)
    (layers : List RootResetFrameSpineWalker.Layer) (bits : List Bool) (continuation carrier : Term) :
    ∃ used, used ≤ coefficient program dispatcher.tree * (Cursor.rebuild parents
      (RootResetFrameSpineWalker.wrap layers (SchedulerResponseInvariant.frameSecondRoot
        (compileActions program dispatcher.tree) bits continuation carrier))).size ∧
      run (machine program dispatcher.tree) used (initial program dispatcher.tree (Cursor.atRoot (Cursor.rebuild parents
        (RootResetFrameSpineWalker.wrap layers (SchedulerResponseInvariant.frameSecondRoot
          (compileActions program dispatcher.tree) bits continuation carrier))))) =
        ⟨some (.done true), RootResetNestedFrameAgreement.secondCursor (compileActions program dispatcher.tree)
          carrier bits continuation (RootResetFrameSpineWalker.spineParents layers parents)⟩ := by
  obtain ⟨ticks, bound, execution⟩ := RootResetNestedFrameAgreement.generated_second layers
    (compileActions program dispatcher.tree) bits continuation carrier parents
  obtain ⟨used, actual⟩ := accepted_frame program dispatcher.tree _ _ ticks
    (notMarked_of_noLocal (wrapped_noLocal layers
      (RootResetFrameSecondSelectorProof.parseLocal_frameSecond_none program dispatcher bits continuation carrier))) execution
  exact cleanParents_terminal outer _ used true _ actual

end PureSFormal.Research.RootResetActiveCleanParentsAgreement
