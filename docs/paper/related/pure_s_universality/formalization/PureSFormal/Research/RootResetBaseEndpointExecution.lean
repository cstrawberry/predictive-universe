import PureSFormal.Research.RootResetActiveBaseAgreement
import PureSFormal.Research.RootResetActiveEndpointExecution

/-! Actual Base queue selections through the whole active endpoint worker. -/
namespace PureSFormal.Research.RootResetBaseEndpointExecution
open PureSFormal.PureS
open FiniteController RootResetProbeSequence RootResetCompletedResponseAgreement
open RootResetActivePendingAgreement

theorem pending_base_pattern_miss (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (payload child : Term) (horizon remaining : Nat) (environment : Term) :
    (RootResetBaseQueueProbe.basePattern program tree).matchesBool
      (frame (CheckpointDecoder.openEnvironment (compileActions program tree) payload)
        (Dovetail.clockExit horizon remaining environment) child) = false := by
  simp only [RootResetBaseQueueProbe.basePattern, RootResetCarrierNonemptyRows.baseRow,
    RootResetCarrierNonemptyRows.basePattern, frame, Pattern.matchesBool,
    RootResetScopedBaseMisses.alphaPattern_exit, Bool.and_false, Bool.false_and]

theorem endpoint_pending_selected (program : CTS.Program) (layout : ActionDispatcher program)
    (payload child : Term) (horizon remaining : Nat) (environment : Term)
    (parents : List ParentFrame) (endpoint : Cursor)
    (matched : (RootResetBaseQueueProbe.basePattern program layout.tree).matchesBool child = true)
    (selected : Executes (RootResetBaseQueueProbe.worker program layout.tree) ⟨child,
      .right (.app (CheckpointDecoder.openEnvironment (compileActions program layout.tree) payload)
        (Dovetail.clockExit horizon remaining environment)) :: parents⟩ true endpoint) :
    ∃ ticks, run (RootResetScopedResponseProbes.endpoint program layout).machine ticks
      ((RootResetScopedResponseProbes.endpoint program layout).initial ⟨frame
        (CheckpointDecoder.openEnvironment (compileActions program layout.tree) payload)
        (Dovetail.clockExit horizon remaining environment) child, parents⟩) = ⟨some (.done true), endpoint⟩ := by
  let origin : Cursor := ⟨frame (CheckpointDecoder.openEnvironment (compileActions program layout.tree) payload)
    (Dovetail.clockExit horizon remaining environment) child, parents⟩
  obtain ⟨missTicks, missRun⟩ := RootResetScopedBaseMisses.scoped_base_missed program layout.tree origin
    (pending_base_pattern_miss program layout.tree payload child horizon remaining environment)
  have adapter := RootResetPendingBaseProbe.pending_selected program layout.tree payload
    (Dovetail.clockExit horizon remaining environment) child parents endpoint matched
    (RootResetPendingBaseProbe.scoped_pending_selected program layout.tree payload
      (Dovetail.clockExit horizon remaining environment) child parents endpoint selected)
  have baseSelected := sequence_second (RootResetScopedResponseProbes.base program layout.tree)
    (RootResetPendingBaseProbe.worker program layout.tree) (RootResetScopedResponseProbes.base_terminal program layout.tree)
    (RootResetPendingBaseProbe.terminal program layout.tree) origin endpoint true ⟨missTicks, .done false, missRun, rfl⟩ adapter
  have finished := sequence_first (RootResetScopedResponseProbes.baseEndpoint program layout.tree)
    (RootResetFuelEndpointPipeline.worker program layout) (RootResetScopedResponseProbes.baseEndpoint_terminal program layout.tree)
    origin endpoint baseSelected
  obtain ⟨ticks, state, actual, answered⟩ := finished
  cases state with
  | first _ | second _ => cases answered
  | done result =>
      have equal := Option.some.inj answered
      subst result
      exact ⟨ticks, actual⟩

theorem pending_base_selected {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {count : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents count)
    (horizon remaining : Nat) (bits : List Bool) (queue beta payload : Term) (layers : List Layer) (endpoint : Cursor)
    (selected : Executes (RootResetBaseQueueProbe.worker program layout.tree)
      ⟨MutableBase.base (compileActions program layout.tree) bits
        (Dovetail.clockExit horizon remaining (environmentCode (compileActions program layout.tree) bits)) queue beta,
       .right (.app (CheckpointDecoder.openEnvironment (compileActions program layout.tree) payload)
         (Dovetail.clockExit horizon remaining (environmentCode (compileActions program layout.tree) bits))) ::
          parentsAfter (compileActions program layout.tree) layers parents⟩ true endpoint) :
    let continuation := Dovetail.clockExit horizon remaining (environmentCode (compileActions program layout.tree) bits)
    let source := Cursor.rebuild parents (wrap (compileActions program layout.tree) layers
      (frame (CheckpointDecoder.openEnvironment (compileActions program layout.tree) payload) continuation
        (MutableBase.base (compileActions program layout.tree) bits continuation queue beta)))
    ∃ ticks, ticks ≤ RootResetActiveEndpointProbe.coefficient program layout * source.size ∧
      run (RootResetActiveEndpointProbe.worker program layout).machine ticks
        ((RootResetActiveEndpointProbe.worker program layout).initial (Cursor.atRoot source)) = ⟨some (.done true), endpoint⟩ := by
  dsimp only
  obtain ⟨frontTicks, _, frontRun⟩ := RootResetActiveBaseAgreement.cleanParents_pending_base_stops outer horizon remaining bits queue beta payload
    (Dovetail.clockExit horizon remaining (environmentCode (compileActions program layout.tree) bits)) layers
  obtain ⟨endpointTicks, endpointRun⟩ := endpoint_pending_selected program layout payload _ horizon remaining
    (environmentCode (compileActions program layout.tree) bits) (parentsAfter (compileActions program layout.tree) layers parents)
    endpoint (RootResetCarrierNonemptyRows.base_matches ..) selected
  obtain ⟨ticks, actual⟩ := RootResetActiveEndpointExecution.endpoint_selected program layout _ _ endpoint
    frontTicks endpointTicks frontRun endpointRun
  exact RootResetActiveEndpointExecution.bounded_selected program layout _ endpoint ticks actual

theorem initial_firstC4 {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {count : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents count)
    (horizon remaining : Nat) (bit : Bool) (suffix : List Bool) (payload : Term) (layers : List Layer) :
    let environment := environmentCode (compileActions program layout.tree) (bit :: suffix)
    let continuation := Dovetail.clockExit horizon remaining environment
    let carrier := baseCarrier environment continuation
    let innerParents := parentsAfter (compileActions program layout.tree) layers parents
    let source := Cursor.rebuild parents (wrap (compileActions program layout.tree) layers
      (frame (CheckpointDecoder.openEnvironment (compileActions program layout.tree) payload) continuation carrier))
    ∃ ticks endpoint, ticks ≤ RootResetActiveEndpointProbe.coefficient program layout * source.size ∧
      run (RootResetActiveEndpointProbe.worker program layout).machine ticks
        ((RootResetActiveEndpointProbe.worker program layout).initial (Cursor.atRoot source)) = ⟨some (.done true), endpoint⟩ ∧
      RootResetEdgeFragment.follow (BasePath.wordAddress ++ List.replicate suffix.length Direction.right)
        ⟨carrier, .right (.app (CheckpointDecoder.openEnvironment (compileActions program layout.tree) payload) continuation) :: innerParents⟩ = some endpoint := by
  dsimp only
  let continuation := Dovetail.clockExit horizon remaining (environmentCode (compileActions program layout.tree) (bit :: suffix))
  let innerParents := parentsAfter (compileActions program layout.tree) layers parents
  obtain ⟨endpoint, baseTicks, state, followed, _, baseRun, answered⟩ := RootResetBaseQueueAgreement.initial_firstC4
    program layout.tree bit suffix continuation (Dovetail.clockExit_admissible ..)
    (.right (.app (CheckpointDecoder.openEnvironment (compileActions program layout.tree) payload) continuation) :: innerParents)
    (RootResetCompleteCarrierRows.pending_boundary ..)
  obtain ⟨ticks, bounded, actual⟩ := pending_base_selected outer horizon remaining (bit :: suffix) (word (bit :: suffix))
    (baseBeta (environmentCode (compileActions program layout.tree) (bit :: suffix)) continuation) payload layers endpoint
    ⟨baseTicks, state, baseRun, answered⟩
  exact ⟨ticks, endpoint, bounded, actual, followed⟩

theorem post_firstC4_handoff {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {count : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents count)
    (horizon remaining : Nat) (bit : Bool) (suffix : List Bool) (payload : Term) (layers : List Layer) :
    let environment := environmentCode (compileActions program layout.tree) (bit :: suffix)
    let continuation := Dovetail.clockExit horizon remaining environment
    let carrier := RootResetResponseCarrierChronology.firstCarrier (compileActions program layout.tree) bit suffix continuation
    let pending := frame (CheckpointDecoder.openEnvironment (compileActions program layout.tree) payload) continuation carrier
    let source := Cursor.rebuild parents (wrap (compileActions program layout.tree) layers pending)
    ∃ ticks, ticks ≤ RootResetActiveEndpointProbe.coefficient program layout * source.size ∧
      run (RootResetActiveEndpointProbe.worker program layout).machine ticks
        ((RootResetActiveEndpointProbe.worker program layout).initial (Cursor.atRoot source)) =
        ⟨some (.done true), ⟨pending, parentsAfter (compileActions program layout.tree) layers parents⟩⟩ := by
  dsimp only
  let continuation := Dovetail.clockExit horizon remaining (environmentCode (compileActions program layout.tree) (bit :: suffix))
  obtain ⟨baseTicks, state, _, baseRun, answered⟩ := RootResetBaseQueueAgreement.post_firstC4_handoff program layout.tree
    bit suffix continuation (Dovetail.clockExit_admissible ..) (compileActions program layout.tree) payload continuation
    (parentsAfter (compileActions program layout.tree) layers parents)
  exact pending_base_selected outer horizon remaining (bit :: suffix)
    (appenderAccumulator suffix (Carrier.tombstone bit omega omega))
    (baseBeta (environmentCode (compileActions program layout.tree) (bit :: suffix)) continuation)
    payload layers _ ⟨baseTicks, state, baseRun, answered⟩

theorem initial_empty_handoff {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {count : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents count)
    (horizon remaining : Nat) (payload : Term) (layers : List Layer) :
    let environment := environmentCode (compileActions program layout.tree) []
    let continuation := Dovetail.clockExit horizon remaining environment
    let pending := frame (CheckpointDecoder.openEnvironment (compileActions program layout.tree) payload) continuation
      (baseCarrier environment continuation)
    let source := Cursor.rebuild parents (wrap (compileActions program layout.tree) layers pending)
    ∃ ticks, ticks ≤ RootResetActiveEndpointProbe.coefficient program layout * source.size ∧
      run (RootResetActiveEndpointProbe.worker program layout).machine ticks
        ((RootResetActiveEndpointProbe.worker program layout).initial (Cursor.atRoot source)) =
        ⟨some (.done true), ⟨pending, parentsAfter (compileActions program layout.tree) layers parents⟩⟩ := by
  dsimp only
  let continuation := Dovetail.clockExit horizon remaining (environmentCode (compileActions program layout.tree) [])
  obtain ⟨baseTicks, state, _, baseRun, answered⟩ := RootResetBaseQueueAgreement.initial_empty_handoff program layout.tree
    continuation (Dovetail.clockExit_admissible ..) (compileActions program layout.tree) payload continuation
    (parentsAfter (compileActions program layout.tree) layers parents)
  exact pending_base_selected outer horizon remaining [] omega
    (baseBeta (environmentCode (compileActions program layout.tree) []) continuation)
    payload layers _ ⟨baseTicks, state, baseRun, answered⟩

theorem scoped_nonpending_selected (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin endpoint : Cursor) (incoming : Probe.observeIncoming origin ≠ .right)
    (selected : Executes (RootResetBaseQueueProbe.worker program tree) origin true endpoint) :
    Executes (RootResetScopedResponseProbes.base program tree) origin true endpoint := by
  obtain ⟨ticks, state, actual, answered⟩ := selected
  obtain ⟨used, _, execution⟩ := RootResetScopedCarrierWorker.nonpending_runs program tree
    (RootResetBaseQueueProbe.worker program tree) (RootResetBaseQueueProbe.worker program tree)
    (RootResetBaseQueueProbe.terminal program tree) origin endpoint ticks state true actual answered
  have first : run (RootResetScopedResponseProbes.base program tree).machine 1
      ((RootResetScopedResponseProbes.base program tree).initial origin) =
      RootResetCarrierNonemptyProbe.liftConfiguration RootResetScopedCarrierWorker.Control.nonpending
        ((RootResetBaseQueueProbe.worker program tree).initial origin) := by
    change step (RootResetScopedCarrierWorker.machine program tree _ _) ⟨some .start, origin⟩ = _
    cases observed : Probe.observeIncoming origin with
    | root | left => simp only [step, RootResetScopedCarrierWorker.machine, RootResetScopedCarrierWorker.transition, observed]; rfl
    | right => exact False.elim (incoming observed)
  refine ⟨1 + (used + 1), .done true, ?_, rfl⟩
  rw [run_add, first]
  exact execution

theorem direct_base_selected {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {count : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents count)
    (horizon remaining : Nat) (bits : List Bool) (queue beta : Term) (endpoint : Cursor)
    (selected : Executes (RootResetBaseQueueProbe.worker program layout.tree)
      ⟨MutableBase.base (compileActions program layout.tree) bits
        (Dovetail.clockExit horizon remaining (environmentCode (compileActions program layout.tree) bits)) queue beta, parents⟩ true endpoint) :
    let carrier := MutableBase.base (compileActions program layout.tree) bits
      (Dovetail.clockExit horizon remaining (environmentCode (compileActions program layout.tree) bits)) queue beta
    let source := Cursor.rebuild parents carrier
    ∃ ticks, ticks ≤ RootResetActiveEndpointProbe.coefficient program layout * source.size ∧
      run (RootResetActiveEndpointProbe.worker program layout).machine ticks
        ((RootResetActiveEndpointProbe.worker program layout).initial (Cursor.atRoot source)) = ⟨some (.done true), endpoint⟩ := by
  dsimp only
  let carrier := MutableBase.base (compileActions program layout.tree) bits
    (Dovetail.clockExit horizon remaining (environmentCode (compileActions program layout.tree) bits)) queue beta
  have boundary := RootResetActiveCleanParentsAgreement.parents_boundary outer carrier
  have incoming : Probe.observeIncoming ⟨carrier, parents⟩ ≠ .right := by
    cases parents with
    | nil => intro h; cases h
    | cons frame parents => cases frame with
      | left _ => intro h; cases h
      | right _ => cases boundary
  have scopedRun :=  scoped_nonpending_selected program layout.tree ⟨carrier, parents⟩ endpoint incoming selected
  have first := sequence_first (RootResetScopedResponseProbes.base program layout.tree)
    (RootResetPendingBaseProbe.worker program layout.tree) (RootResetScopedResponseProbes.base_terminal program layout.tree)
    ⟨carrier, parents⟩ endpoint scopedRun
  obtain ⟨endpointTicks, state, endpointRun, answered⟩ := sequence_first (RootResetScopedResponseProbes.baseEndpoint program layout.tree)
    (RootResetFuelEndpointPipeline.worker program layout) (RootResetScopedResponseProbes.baseEndpoint_terminal program layout.tree)
    ⟨carrier, parents⟩ endpoint first
  have stateEq : state = .done true := by
    cases state with
    | first _ | second _ => cases answered
    | done result => exact congrArg RootResetProbeSequence.Control.done (Option.some.inj answered)
  subst state
  obtain ⟨innerTicks, innerRun⟩ := RootResetActiveBaseAgreement.base_stops program layout.tree horizon remaining bits queue beta parents boundary
  obtain ⟨frontTicks, _, frontRun⟩ := RootResetActiveCleanParentsAgreement.cleanParents_terminal outer carrier innerTicks false _ innerRun
  obtain ⟨ticks, actual⟩ := RootResetActiveEndpointExecution.endpoint_selected program layout _ _ endpoint
    frontTicks endpointTicks frontRun endpointRun
  exact RootResetActiveEndpointExecution.bounded_selected program layout _ endpoint ticks actual

theorem direct_initial_firstC4 {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {count : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents count)
    (horizon remaining : Nat) (bit : Bool) (suffix : List Bool) :
    let environment := environmentCode (compileActions program layout.tree) (bit :: suffix)
    let continuation := Dovetail.clockExit horizon remaining environment
    let carrier := baseCarrier environment continuation
    let source := Cursor.rebuild parents carrier
    ∃ ticks endpoint, ticks ≤ RootResetActiveEndpointProbe.coefficient program layout * source.size ∧
      run (RootResetActiveEndpointProbe.worker program layout).machine ticks
        ((RootResetActiveEndpointProbe.worker program layout).initial (Cursor.atRoot source)) = ⟨some (.done true), endpoint⟩ ∧
      RootResetEdgeFragment.follow (BasePath.wordAddress ++ List.replicate suffix.length Direction.right)
        ⟨carrier, parents⟩ = some endpoint := by
  dsimp only
  let continuation := Dovetail.clockExit horizon remaining (environmentCode (compileActions program layout.tree) (bit :: suffix))
  obtain ⟨endpoint, baseTicks, state, followed, _, baseRun, answered⟩ := RootResetBaseQueueAgreement.initial_firstC4
    program layout.tree bit suffix continuation (Dovetail.clockExit_admissible ..) parents
    (RootResetBaseQueueAgreement.completed_boundary outer _)
  obtain ⟨ticks, bounded, actual⟩ := direct_base_selected outer horizon remaining (bit :: suffix) (word (bit :: suffix))
    (baseBeta (environmentCode (compileActions program layout.tree) (bit :: suffix)) continuation) endpoint
    ⟨baseTicks, state, baseRun, answered⟩
  exact ⟨ticks, endpoint, bounded, actual, followed⟩

theorem parents_replicate (actions payload continuation : Term) (count : Nat) (parents : List ParentFrame) :
    parentsAfter actions (List.replicate count (payload, continuation)) parents =
      PrimitiveFuel.pendingParents (CheckpointDecoder.openEnvironment actions payload) continuation count parents := by
  induction count generalizing parents with
  | zero => rfl
  | succ count ih =>
      change parentsAfter actions (List.replicate count (payload, continuation))
        (.right (.app (CheckpointDecoder.openEnvironment actions payload) continuation) :: parents) = _
      exact ih _

theorem rebuild_repeated_succ (actions payload continuation body : Term) (count : Nat) (parents : List ParentFrame) :
    Cursor.rebuild (PrimitiveFuel.pendingParents (CheckpointDecoder.openEnvironment actions payload) continuation (count + 1) parents) body =
      Cursor.rebuild parents (wrap actions (List.replicate count (payload, continuation))
        (frame (CheckpointDecoder.openEnvironment actions payload) continuation body)) := by
  rw [SchedulerCycle.pendingParents_succ_cons, ← parents_replicate]
  change Cursor.rebuild (parentsAfter actions (List.replicate count (payload, continuation)) parents)
    (frame (CheckpointDecoder.openEnvironment actions payload) continuation body) = _
  exact RootResetFrameSpineWalker.rebuild_spineParents _ _ _

theorem repeated_initial_firstC4 {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {history : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents history)
    (horizon remaining : Nat) (bit : Bool) (suffix : List Bool) (count : Nat) :
    let environment := environmentCode (compileActions program layout.tree) (bit :: suffix)
    let continuation := Dovetail.clockExit horizon remaining environment
    let origin : Cursor := ⟨baseCarrier environment continuation, PrimitiveFuel.pendingParents environment continuation count parents⟩
    ∃ ticks endpoint, ticks ≤ RootResetActiveEndpointProbe.coefficient program layout * origin.erase.size ∧
      run (RootResetActiveEndpointProbe.worker program layout).machine ticks
        ((RootResetActiveEndpointProbe.worker program layout).initial (Cursor.atRoot origin.erase)) = ⟨some (.done true), endpoint⟩ ∧
      RootResetEdgeFragment.follow (BasePath.wordAddress ++ List.replicate suffix.length Direction.right) origin = some endpoint := by
  cases count with
  | zero => exact direct_initial_firstC4 outer horizon remaining bit suffix
  | succ count =>
      dsimp only
      let actions := compileActions program layout.tree
      let environment := environmentCode actions (bit :: suffix)
      let continuation := Dovetail.clockExit horizon remaining environment
      let carrier := baseCarrier environment continuation
      obtain ⟨ticks, endpoint, bounded, actual, followed⟩ := initial_firstC4 outer horizon remaining bit suffix
        (word (bit :: suffix)) (List.replicate count (word (bit :: suffix), continuation))
      have parentEq : PrimitiveFuel.pendingParents environment continuation (count + 1) parents =
          .right (.app environment continuation) :: parentsAfter actions
            (List.replicate count (word (bit :: suffix), continuation)) parents := by
        rw [SchedulerCycle.pendingParents_succ_cons, parents_replicate]
        rfl
      have wholeEq : (Cursor.mk carrier (PrimitiveFuel.pendingParents environment continuation (count + 1) parents)).erase =
          Cursor.rebuild parents (wrap actions (List.replicate count (word (bit :: suffix), continuation))
            (frame environment continuation carrier)) := rebuild_repeated_succ actions (word (bit :: suffix)) continuation carrier count parents
      refine ⟨ticks, endpoint, ?_, ?_, ?_⟩
      · change ticks ≤ _ * (Cursor.mk carrier (PrimitiveFuel.pendingParents environment continuation (count + 1) parents)).erase.size
        rw [wholeEq]
        exact bounded
      · change run _ _ ((RootResetActiveEndpointProbe.worker program layout).initial
          (Cursor.atRoot (Cursor.mk carrier (PrimitiveFuel.pendingParents environment continuation (count + 1) parents)).erase)) = _
        rw [wholeEq]
        exact actual
      · change RootResetEdgeFragment.follow _ ⟨carrier, PrimitiveFuel.pendingParents environment continuation (count + 1) parents⟩ = _
        rw [parentEq]
        exact followed

theorem fuelTerminal_firstC4 {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {history : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents history)
    (registers : SchedulerControl.Registers program) (horizon remaining : Nat)
    (bit : Bool) (suffix : List Bool) (fuel depth : Nat) :
    let origin := (SchedulerNestedPhase.fuelTerminalConfigurationAt program layout (bit :: suffix) registers
      (RootResetEmptyHandoffContext.exitTerm program layout horizon remaining (bit :: suffix)) parents fuel depth).cursor
    ∃ ticks endpoint, ticks ≤ RootResetActiveEndpointProbe.coefficient program layout * origin.erase.size ∧
      run (RootResetActiveEndpointProbe.worker program layout).machine ticks
        ((RootResetActiveEndpointProbe.worker program layout).initial (Cursor.atRoot origin.erase)) = ⟨some (.done true), endpoint⟩ ∧
      RootResetEdgeFragment.follow (BasePath.wordAddress ++ List.replicate suffix.length Direction.right) origin = some endpoint :=
  repeated_initial_firstC4 outer horizon remaining bit suffix (SchedulerInvariant.fuelSampleEndDepth depth fuel)

theorem repeated_post_firstC4_handoff {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {history : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents history)
    (horizon remaining : Nat) (bit : Bool) (suffix : List Bool) (count : Nat) :
    let environment := environmentCode (compileActions program layout.tree) (bit :: suffix)
    let continuation := Dovetail.clockExit horizon remaining environment
    let carrier := RootResetResponseCarrierChronology.firstCarrier (compileActions program layout.tree) bit suffix continuation
    let origin : Cursor := ⟨carrier, PrimitiveFuel.pendingParents environment continuation (count + 1) parents⟩
    let endpoint : Cursor := ⟨frame environment continuation carrier, PrimitiveFuel.pendingParents environment continuation count parents⟩
    ∃ ticks, ticks ≤ RootResetActiveEndpointProbe.coefficient program layout * origin.erase.size ∧
      run (RootResetActiveEndpointProbe.worker program layout).machine ticks
        ((RootResetActiveEndpointProbe.worker program layout).initial (Cursor.atRoot origin.erase)) = ⟨some (.done true), endpoint⟩ := by
  dsimp only
  let actions := compileActions program layout.tree
  let environment := environmentCode actions (bit :: suffix)
  let continuation := Dovetail.clockExit horizon remaining environment
  let carrier := RootResetResponseCarrierChronology.firstCarrier actions bit suffix continuation
  obtain ⟨ticks, bounded, actual⟩ := post_firstC4_handoff outer horizon remaining bit suffix (word (bit :: suffix))
    (List.replicate count (word (bit :: suffix), continuation))
  have wholeEq : (Cursor.mk carrier (PrimitiveFuel.pendingParents environment continuation (count + 1) parents)).erase =
      Cursor.rebuild parents (wrap actions (List.replicate count (word (bit :: suffix), continuation))
        (frame environment continuation carrier)) := rebuild_repeated_succ actions (word (bit :: suffix)) continuation carrier count parents
  rw [parents_replicate] at actual
  refine ⟨ticks, ?_, ?_⟩
  · change ticks ≤ _ * (Cursor.mk carrier (PrimitiveFuel.pendingParents environment continuation (count + 1) parents)).erase.size
    rw [wholeEq]
    exact bounded
  · change run _ _ ((RootResetActiveEndpointProbe.worker program layout).initial
      (Cursor.atRoot (Cursor.mk carrier (PrimitiveFuel.pendingParents environment continuation (count + 1) parents)).erase)) = _
    rw [wholeEq]
    exact actual

theorem fifth_empty_handoff {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {history : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents history)
    (registers : SchedulerControl.Registers program) (horizon remaining count : Nat) :
    let environment := environmentCode (compileActions program layout.tree) []
    let continuation := Dovetail.clockExit horizon remaining environment
    let origin := (SchedulerInvariant.fuelZeroFifthMutationConfiguration program layout registers environment continuation
      (PrimitiveFuel.pendingParents environment continuation (count + 1) parents)).cursor
    let endpoint : Cursor := ⟨frame environment continuation (baseCarrier environment continuation),
      PrimitiveFuel.pendingParents environment continuation count parents⟩
    ∃ ticks, ticks ≤ RootResetActiveEndpointProbe.coefficient program layout * origin.erase.size ∧
      run (RootResetActiveEndpointProbe.worker program layout).machine ticks
        ((RootResetActiveEndpointProbe.worker program layout).initial (Cursor.atRoot origin.erase)) = ⟨some (.done true), endpoint⟩ := by
  dsimp only
  let actions := compileActions program layout.tree
  let environment := environmentCode actions []
  let continuation := Dovetail.clockExit horizon remaining environment
  let carrier := baseCarrier environment continuation
  obtain ⟨ticks, bounded, actual⟩ := initial_empty_handoff outer horizon remaining (word [])
    (List.replicate count (word [], continuation))
  have wholeEq : (Cursor.mk carrier (PrimitiveFuel.pendingParents environment continuation (count + 1) parents)).erase =
      Cursor.rebuild parents (wrap actions (List.replicate count (word [], continuation))
        (frame environment continuation carrier)) := rebuild_repeated_succ actions (word []) continuation carrier count parents
  rw [parents_replicate] at actual
  refine ⟨ticks, ?_, ?_⟩
  · change ticks ≤ _ * (Cursor.mk carrier (PrimitiveFuel.pendingParents environment continuation (count + 1) parents)).erase.size
    rw [wholeEq]
    exact bounded
  · change run _ _ ((RootResetActiveEndpointProbe.worker program layout).initial
      (Cursor.atRoot (Cursor.mk carrier (PrimitiveFuel.pendingParents environment continuation (count + 1) parents)).erase)) = _
    rw [wholeEq]
    exact actual

end PureSFormal.Research.RootResetBaseEndpointExecution
