import PureSFormal.Research.RootResetFreshAncestorProbe
import PureSFormal.Research.RootResetActivePendingAgreement

/-! Generated clock exits stop the active frontend and recover their enclosing
completed fresh response. Every clock residual is covered. -/
namespace PureSFormal.Research.RootResetFreshAncestorExitAgreement
open PureSFormal.PureS
open FiniteController
open RootResetActiveMarkedFrontend
open RootResetActiveCleanParentsAgreement
open RootResetActivePendingAgreement
open RootResetEmptyHandoffContext (exitTerm)

theorem pending_misses_exit (program : CTS.Program) (layout : ActionDispatcher program)
    (horizon remaining : Nat) (bits : List Bool) (parents : List ParentFrame) :
    ∃ ticks, run (RootResetPendingAdmissionFragment.machine program layout.tree) ticks
      (RootResetPendingAdmissionFragment.initial program layout.tree ⟨exitTerm program layout horizon remaining bits, parents⟩) =
      ⟨some (.done false), ⟨exitTerm program layout horizon remaining bits, parents⟩⟩ := by
  obtain ⟨ticks, entered, after, bounded, execution, outcome⟩ := RootResetPendingAdmissionFragment.bounded_input program layout.tree
    ⟨exitTerm program layout horizon remaining bits, parents⟩
  cases outcome with
  | stopped refused => exact ⟨ticks, execution⟩
  | entered payload continuation child shape admitted =>
      cases remaining with
      | zero =>
          have arity := congrArg Term.headArity shape
          change 4 = 3 at arity
          cases arity
      | succ remaining =>
          have envEq := (Term.app.inj (Term.app.inj shape).1).1
          have rejects : (RootResetPendingAdmissionPatterns.environmentPattern (compileActions program layout.tree)).matchesBool
              (.app .s (C horizon)) = false := by
            cases horizon <;> rfl
          rw [envEq, RootResetPendingAdmissionPatterns.environment_matches] at rejects
          cases rejects

theorem frame_misses_exit (program : CTS.Program) (layout : ActionDispatcher program)
    (horizon remaining : Nat) (bits : List Bool) (parents : List ParentFrame)
    (boundary : RootResetNestedFramePatterns.rightParent? ⟨exitTerm program layout horizon remaining bits, parents⟩ = false) :
    ∃ ticks, run RootResetNestedFrameProbe.machine ticks
      (RootResetNestedFrameProbe.initial ⟨exitTerm program layout horizon remaining bits, parents⟩) =
      ⟨some (.done false), ⟨exitTerm program layout horizon remaining bits, parents⟩⟩ := by
  cases remaining with
  | zero =>
      obtain ⟨ticks, bounded, execution⟩ := RootResetNestedFrameAgreement.missed []
        (exitTerm program layout horizon 0 bits) parents rfl rfl boundary
      exact ⟨ticks, execution⟩
  | succ remaining =>
      obtain ⟨ticks, bounded, execution⟩ := RootResetNestedFrameAgreement.missed
        [(C horizon, clockWrappers horizon remaining)]
        (environmentCode (compileActions program layout.tree) bits) parents rfl rfl boundary
      exact ⟨ticks, execution⟩

theorem exit_stops (program : CTS.Program) (layout : ActionDispatcher program)
    (horizon remaining : Nat) (bits : List Bool) (parents : List ParentFrame)
    (boundary : RootResetNestedFramePatterns.rightParent? ⟨exitTerm program layout horizon remaining bits, parents⟩ = false) :
    ∃ ticks, run (machine program layout.tree) ticks
      (initial program layout.tree ⟨exitTerm program layout horizon remaining bits, parents⟩) =
      ⟨some (.done false), ⟨exitTerm program layout horizon remaining bits, parents⟩⟩ := by
  have noLocal := RootResetEmptyHandoffContext.exit_local_none program layout horizon remaining bits
  obtain ⟨p, pr⟩ := pending_misses_exit program layout horizon remaining bits parents
  obtain ⟨l, lr⟩ := local_stops_of_noLocal program layout.tree ⟨_, parents⟩ noLocal
  obtain ⟨s, sr⟩ := segment_stops program layout.tree _ p l pr lr
  obtain ⟨f, fr⟩ := frame_misses_exit program layout horizon remaining bits parents boundary
  exact forwarded program layout.tree _ _ f s (notMarked_of_noLocal noLocal) fr .stopped (by intro h; cases h) sr

theorem fresh_rejects_arity {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {source : Term} (arity : source.headArity ≠ 6) :
    RootResetCompletedLocalPatterns.accepts .fresh program tree source = false := by
  cases accepted : RootResetCompletedLocalPatterns.accepts .fresh program tree source with
  | false => rfl
  | true =>
      obtain ⟨view, fresh, parsed⟩ := (RootResetCompletedLocalPatterns.accepts_iff_parse .fresh program tree source).mp accepted
      obtain ⟨halt, dispatcher, seedAudit, continuationAudit, haltShape, dispatchShape, shape⟩ := CheckpointDecoder.parseLocal?_sound parsed
      rw [fresh] at haltShape
      cases haltShape with
      | fresh audit =>
          apply False.elim
          apply arity
          rw [shape]
          rfl

theorem exit_recovers_fresh (program : CTS.Program) (layout : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool) (bits exitBits : List Bool)
    (carrier : Term) (horizon remaining : Nat) (parents : List ParentFrame) :
    RootResetFreshAncestorProbe.First program layout.tree
      ⟨exitTerm program layout horizon remaining exitBits,
        SchedulerRootContinuation.freshContinuationParents program layout registers bit bits carrier parents⟩ true
      ⟨LocalResponse.completed bits (exitTerm program layout horizon remaining exitBits) carrier
        (SchedulerResponse.completedRoute program layout registers bit carrier), parents⟩ := by
  have firstNo : RootResetCompletedLocalPatterns.accepts .fresh program layout.tree
      (exitTerm program layout horizon remaining exitBits) = false := by
    apply fresh_rejects_arity
    cases remaining
    · change 4 ≠ 6; decide
    · change 3 ≠ 6; decide
  have secondNo : RootResetCompletedLocalPatterns.accepts .fresh program layout.tree
      (.app (exitTerm program layout horizon remaining exitBits) carrier) = false := by
    apply fresh_rejects_arity
    cases remaining
    · change 5 ≠ 6; decide
    · change 4 ≠ 6; decide
  have parsed := RootResetTraversableCompletedParents.TraversableParents.parseLocal?_fresh
    program layout registers bit bits (exitTerm program layout horizon remaining exitBits) carrier
  exact .parent _ (.left carrier) _ firstNo
    (.parent _ (.right (SchedulerResponse.localContinuationLeft bits (freshHField carrier)
      (SchedulerResponse.completedRoute program layout registers bit carrier) carrier)) parents secondNo
      (.found _ ((RootResetCompletedLocalPatterns.accepts_iff_parse .fresh program layout.tree _).mpr ⟨_, rfl, parsed⟩)))

theorem completedFresh_exit_frontend {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {layers : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents layers)
    (registers : SchedulerControl.Registers program) (bit : Bool) (bits exitBits : List Bool)
    (carrier : Term) (horizon remaining : Nat)
    (nonempty : ∃ first rest, CheckpointDecoder.decodeCarrier? program layout.tree
      (actionAccumulator program (registers.phase, bit) carrier) = some (first :: rest)) :
    ∃ ticks, ticks ≤ coefficient program layout.tree * (Cursor.rebuild parents
      (LocalResponse.completed bits (exitTerm program layout horizon remaining exitBits) carrier
        (SchedulerResponse.completedRoute program layout registers bit carrier))).size ∧
      run (machine program layout.tree) ticks (initial program layout.tree (Cursor.atRoot (Cursor.rebuild parents
        (LocalResponse.completed bits (exitTerm program layout horizon remaining exitBits) carrier
          (SchedulerResponse.completedRoute program layout registers bit carrier))))) =
        ⟨some (.done false), ⟨exitTerm program layout horizon remaining exitBits,
          SchedulerRootContinuation.freshContinuationParents program layout registers bit bits carrier parents⟩⟩ := by
  obtain ⟨p, pr⟩ := fresh_layer program layout registers bit bits (exitTerm program layout horizon remaining exitBits) carrier parents
    nonempty (parents_boundary outer _)
  obtain ⟨rest, rr⟩ := exit_stops program layout horizon remaining exitBits
    (SchedulerRootContinuation.freshContinuationParents program layout registers bit bits carrier parents) rfl
  apply cleanParents_terminal outer _ (p + rest) false _
  rw [run_add, pr]
  exact rr

theorem completedFresh_local_runs (program : CTS.Program) (layout : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame)
    (boundary : RootResetCarrierScanParentBoundary.carrierParent? parents.head? = false)
    (nonempty : ∃ first rest, CheckpointDecoder.decodeCarrier? program layout.tree
      (actionAccumulator program (registers.phase, bit) carrier) = some (first :: rest)) :
    ∃ ticks, run (RootResetMixedLocalFragment.machine program layout.tree) ticks
      (RootResetMixedLocalFragment.initial program layout.tree ⟨LocalResponse.completed bits continuation carrier
        (SchedulerResponse.completedRoute program layout registers bit carrier), parents⟩) =
      ⟨some (.done true), ⟨continuation,
        SchedulerRootContinuation.freshContinuationParents program layout registers bit bits carrier parents⟩⟩ := by
  obtain ⟨first, rest, decoded⟩ := nonempty
  have parsed := RootResetTraversableCompletedParents.TraversableParents.parseLocal?_fresh
    program layout registers bit bits continuation carrier
  obtain ⟨ticks, left, audit, bounded, shape, execution⟩ := RootResetDecodedCarrierNonemptyAgreement.decoded_fresh_runs parsed rfl
    (CheckpointDecoder.decodeCarrier?_sound program layout.tree decoded) ⟨_, parents⟩ rfl boundary
  have accepted : (RootResetPersistentRouteA.parseFreshNonempty? program layout.tree
      (LocalResponse.completed bits continuation carrier (SchedulerResponse.completedRoute program layout registers bit carrier))).isSome = true := by
    simp only [RootResetPersistentRouteA.parseFreshNonempty?, parsed, CheckpointDecoder.completedView, decoded]
    rfl
  rw [accepted] at execution
  have fields := Term.app.inj shape
  have auditEq := (Term.app.inj fields.2).2
  rw [← fields.1, ← auditEq] at execution
  exact ⟨ticks, execution⟩

theorem parentsAfter_boundary (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (layers : List Layer) (parents : List ParentFrame)
    (boundary : RootResetCarrierScanParentBoundary.carrierParent? parents.head? = false) :
    RootResetCarrierScanParentBoundary.carrierParent? (parentsAfter (compileActions program tree) layers parents).head? = false := by
  induction layers generalizing parents with
  | nil => exact boundary
  | cons layer layers ih => exact ih _ (RootResetPendingAdmissionPatterns.admitted_parent_boundary _ _ _)

theorem pendingFresh_exit_frontend {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {count : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents count)
    (pendingLayers : List Layer)
    (registers : SchedulerControl.Registers program) (bit : Bool) (bits exitBits : List Bool)
    (carrier : Term) (horizon remaining : Nat)
    (nonempty : ∃ first rest, CheckpointDecoder.decodeCarrier? program layout.tree
      (actionAccumulator program (registers.phase, bit) carrier) = some (first :: rest)) :
    ∃ ticks, ticks ≤ coefficient program layout.tree * (Cursor.rebuild parents
      (wrap (compileActions program layout.tree) pendingLayers (LocalResponse.completed bits
        (exitTerm program layout horizon remaining exitBits) carrier
        (SchedulerResponse.completedRoute program layout registers bit carrier)))).size ∧
      run (machine program layout.tree) ticks (initial program layout.tree (Cursor.atRoot (Cursor.rebuild parents
        (wrap (compileActions program layout.tree) pendingLayers (LocalResponse.completed bits
          (exitTerm program layout horizon remaining exitBits) carrier
          (SchedulerResponse.completedRoute program layout registers bit carrier)))))) =
        ⟨some (.done false), ⟨exitTerm program layout horizon remaining exitBits,
          SchedulerRootContinuation.freshContinuationParents program layout registers bit bits carrier
            (parentsAfter (compileActions program layout.tree) pendingLayers parents)⟩⟩ := by
  let continuation := exitTerm program layout horizon remaining exitBits
  let body := LocalResponse.completed bits continuation carrier (SchedulerResponse.completedRoute program layout registers bit carrier)
  let innerParents := parentsAfter (compileActions program layout.tree) pendingLayers parents
  have parsed := RootResetTraversableCompletedParents.TraversableParents.parseLocal?_fresh
    program layout registers bit bits continuation carrier
  obtain ⟨l, lr⟩ := completedFresh_local_runs program layout registers bit bits continuation carrier innerParents
    (parentsAfter_boundary program layout.tree pendingLayers parents (notRight_boundary ⟨body, parents⟩ (parents_boundary outer body))) nonempty
  obtain ⟨s, sr⟩ := segment_of_local_run ⟨body, innerParents⟩ _ parsed l lr
  obtain ⟨allTicks, allRun⟩ := segment_layers_terminal program layout.tree pendingLayers body parents
    (RootResetPendingAdmissionPatterns.childAdmitted_local parsed) s .completedLocal _ sr
  have noMarked : RootResetCompletedLocalPatterns.accepts .marked program layout.tree
      (wrap (compileActions program layout.tree) pendingLayers body) = false := by
    cases pendingLayers with
    | nil => exact RootResetMixedLocalFragment.marked_misses_fresh parsed rfl
    | cons layer layers =>
        apply notMarked_of_noLocal
        apply CheckpointDecoder.parseLocal?_none_of_headArity
        · change 3 ≠ 5; decide
        · change 3 ≠ 6; decide
  obtain ⟨f, fb, fr⟩ := RootResetNestedFrameCost.missed_count (frameLayers (compileActions program layout.tree) pendingLayers)
    body parents (RootResetNestedFrameCost.parsed_local_stops parsed)
    (RootResetFrameCarrierGuard.frameHeadGuard_freshShell ..) (parents_boundary outer _)
  obtain ⟨prefixTicks, prefixRun⟩ := forwarded program layout.tree _ _ f allTicks noMarked fr .completedLocal (by intro h; cases h) allRun
  obtain ⟨rest, restRun⟩ := exit_stops program layout horizon remaining exitBits
    (SchedulerRootContinuation.freshContinuationParents program layout registers bit bits carrier innerParents) rfl
  apply cleanParents_terminal outer _ (prefixTicks + rest) false _
  rw [run_add, prefixRun]
  exact restRun

theorem pendingEmptyFresh_frontend {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {count : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents count)
    (pendingLayers : List Layer)
    (registers : SchedulerControl.Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term)
    (empty : CheckpointDecoder.decodeCarrier? program layout.tree
      (actionAccumulator program (registers.phase, bit) carrier) = some []) :
    ∃ ticks, ticks ≤ coefficient program layout.tree * (Cursor.rebuild parents
      (wrap (compileActions program layout.tree) pendingLayers (LocalResponse.completed bits continuation carrier
        (SchedulerResponse.completedRoute program layout registers bit carrier)))).size ∧
      run (machine program layout.tree) ticks (initial program layout.tree (Cursor.atRoot (Cursor.rebuild parents
        (wrap (compileActions program layout.tree) pendingLayers (LocalResponse.completed bits continuation carrier
          (SchedulerResponse.completedRoute program layout registers bit carrier)))))) =
        ⟨some (.done false), ⟨LocalResponse.completed bits continuation carrier
          (SchedulerResponse.completedRoute program layout registers bit carrier),
          parentsAfter (compileActions program layout.tree) pendingLayers parents⟩⟩ := by
  let body := LocalResponse.completed bits continuation carrier (SchedulerResponse.completedRoute program layout registers bit carrier)
  let innerParents := parentsAfter (compileActions program layout.tree) pendingLayers parents
  have parsed := RootResetTraversableCompletedParents.TraversableParents.parseLocal?_fresh
    program layout registers bit bits continuation carrier
  obtain ⟨l, left, audit, bounded, shape, localRun⟩ := RootResetDecodedCarrierNonemptyAgreement.decoded_fresh_runs parsed rfl
    (CheckpointDecoder.decodeCarrier?_sound program layout.tree empty) ⟨body, innerParents⟩ rfl
    (parentsAfter_boundary program layout.tree pendingLayers parents (notRight_boundary ⟨body, parents⟩ (parents_boundary outer body)))
  have rejected : (RootResetPersistentRouteA.parseFreshNonempty? program layout.tree body).isSome = false := by
    simp only [body, RootResetPersistentRouteA.parseFreshNonempty?, parsed, CheckpointDecoder.completedView, empty]
    rfl
  rw [rejected] at localRun
  obtain ⟨ticks, execution⟩ := pendingLayers_freshShell_stops program layout.tree pendingLayers carrier
    (SchedulerResponse.completedRoute program layout registers bit carrier) (word bits) carrier continuation carrier parents
    (parents_boundary outer _) (RootResetMixedLocalFragment.marked_misses_fresh parsed rfl) l localRun
  exact cleanParents_terminal outer _ ticks false _ execution

theorem completedFresh_recovers_self (program : CTS.Program) (layout : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    RootResetFreshAncestorProbe.First program layout.tree
      ⟨LocalResponse.completed bits continuation carrier (SchedulerResponse.completedRoute program layout registers bit carrier), parents⟩ true
      ⟨LocalResponse.completed bits continuation carrier (SchedulerResponse.completedRoute program layout registers bit carrier), parents⟩ := by
  exact .found _ ((RootResetCompletedLocalPatterns.accepts_iff_parse .fresh program layout.tree _).mpr
    ⟨_, rfl, RootResetTraversableCompletedParents.TraversableParents.parseLocal?_fresh program layout registers bit bits continuation carrier⟩)

end PureSFormal.Research.RootResetFreshAncestorExitAgreement
