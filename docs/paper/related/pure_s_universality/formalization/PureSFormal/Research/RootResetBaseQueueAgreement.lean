import PureSFormal.Research.RootResetBaseQueueProbe
import PureSFormal.Research.RootResetCompletedResponseAgreement
import PureSFormal.Research.RootResetCleanTraversableParents
import PureSFormal.PureS.SchedulerNestedPhase

/-! Exact generated Base chronology branches of the finite queue worker. -/
namespace PureSFormal.Research.RootResetBaseQueueAgreement
open PureSFormal.PureS
open FiniteController RootResetProbeSequence
open RootResetCompletedResponseAgreement RootResetCompletedResponseAtoms
open RootResetCompletedResponseProbe (parityWorker oldestWorker parity_terminal oldest_terminal rejectWorker)
open RootResetBaseQueueProbe
open RootResetPersistentResponseSelector (carrierLocalCount? carrierTombstoneCount? spineTombstoneCount?)
open RootResetSelectedFrontParserAgreement

theorem base_guard (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (continuation queue seed beta : Term) (parents : List ParentFrame) :
    Executes (baseWorker program tree) ⟨CheckpointDecoder.openBase (compileActions program tree) continuation queue seed beta, parents⟩
      true ⟨CheckpointDecoder.openBase (compileActions program tree) continuation queue seed beta, parents⟩ := by
  obtain ⟨ticks, state, bound, actual, answered⟩ := base_query program tree
    ⟨CheckpointDecoder.openBase (compileActions program tree) continuation queue seed beta, parents⟩
  have matched := RootResetCarrierNonemptyRows.base_matches (compileActions program tree) continuation queue seed beta
  change (baseWorker program tree).answer? state = some ((RootResetCarrierNonemptyRows.basePattern
    (compileActions program tree)).matchesBool (CheckpointDecoder.openBase (compileActions program tree) continuation queue seed beta)) at answered
  rw [matched] at answered
  exact ⟨ticks, state, actual, answered⟩

theorem bounded_exec (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin endpoint : Cursor) (ready : Bool) (boundary : RootResetCompleteCarrierRows.Boundary origin)
    (selected : Executes (worker program tree) origin ready endpoint) :
    ∃ ticks state, ticks ≤ coefficient program tree * origin.erase.size ∧
      run (worker program tree).machine ticks ((worker program tree).initial origin) = ⟨some state, endpoint⟩ ∧
      (worker program tree).answer? state = some ready := by
  obtain ⟨ticks, state, actual, answered⟩ := selected
  obtain ⟨used, found, returned, finalState, bound, execution, finalAnswer, facts⟩ := all_input program tree origin boundary
  have common := congrArg (run (worker program tree).machine used) actual
  rw [terminal program tree state ready answered, ← run_add, Nat.add_comm, run_add, execution,
    terminal program tree finalState found finalAnswer] at common
  exact ⟨used, state, bound, execution.trans common, answered⟩

theorem finish_base (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (continuation queue seed beta : Term) (parents : List ParentFrame) (endpoint : Cursor) (ready : Bool)
    (boundary : RootResetCompleteCarrierRows.Boundary ⟨CheckpointDecoder.openBase (compileActions program tree) continuation queue seed beta, parents⟩)
    (selected : Executes (body program tree) ⟨CheckpointDecoder.openBase (compileActions program tree) continuation queue seed beta, parents⟩ ready endpoint) :
    ∃ ticks state, ticks ≤ coefficient program tree * (Cursor.mk
      (CheckpointDecoder.openBase (compileActions program tree) continuation queue seed beta) parents).erase.size ∧
      run (worker program tree).machine ticks ((worker program tree).initial
        ⟨CheckpointDecoder.openBase (compileActions program tree) continuation queue seed beta, parents⟩) = ⟨some state, endpoint⟩ ∧
      (worker program tree).answer? state = some ready := by
  apply bounded_exec program tree _ endpoint ready boundary
  exact branch_yes (baseWorker program tree) (body program tree) rejectWorker (code_terminal _)
    (RootResetProbeBranch.terminal _ _ _) _ endpoint ready (base_guard program tree continuation queue seed beta parents) selected

theorem zero_tombs_c4 {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    (bits : List Bool) (continuation queue beta : Term) (admissible : Carrier.Admissible continuation)
    {decoded : List Bool} (decodedQueue : CellSpine.Decodes queue decoded)
    (noTombs : spineTombstoneCount? queue = some 0)
    (parents : List ParentFrame) (endpoint : Cursor)
    (boundary : RootResetCompleteCarrierRows.Boundary ⟨MutableBase.base (compileActions program tree) bits continuation queue beta, parents⟩)
    (address : Address)
    (selected : firstLiveAddress? program tree (MutableBase.base (compileActions program tree) bits continuation queue beta) = some address)
    (followed : RootResetEdgeFragment.follow address
      ⟨MutableBase.base (compileActions program tree) bits continuation queue beta, parents⟩ = some endpoint) :
    ∃ ticks state, ticks ≤ coefficient program tree * (Cursor.mk
      (MutableBase.base (compileActions program tree) bits continuation queue beta) parents).erase.size ∧
      run (worker program tree).machine ticks ((worker program tree).initial
        ⟨MutableBase.base (compileActions program tree) bits continuation queue beta, parents⟩) = ⟨some state, endpoint⟩ ∧
      (worker program tree).answer? state = some true := by
  let source := MutableBase.base (compileActions program tree) bits continuation queue beta
  let origin : Cursor := ⟨source, parents⟩
  have path : CarrierDecoder.PathDecodes program tree bits continuation source decoded := .root (.base queue beta decodedQueue)
  have parsed := CheckpointDecoder.parseBase?_mutableBase (compileActions program tree) bits continuation queue beta
  have lc : carrierLocalCount? program tree source = some 0 := by rw [carrierLocalCount?, parsed]
  have tc : carrierTombstoneCount? program tree source = some 0 := by rw [carrierTombstoneCount?, parsed]; exact noTombs
  obtain ⟨parityTicks, parityBound, parityRun⟩ := RootResetCarrierParityAgreement.generated_runs admissible path 0 0 lc tc origin rfl true boundary
  have parity : Executes (parityWorker program tree) origin true origin := ⟨parityTicks, .done true, parityRun, rfl⟩
  obtain ⟨liveTicks, liveBound, liveRun⟩ := RootResetCarrierOldestLiveAgreement.selected_runs admissible path origin endpoint rfl boundary address selected followed
  have oldest : Executes (oldestWorker program tree) origin true endpoint := ⟨liveTicks, .done true, liveRun, rfl⟩
  apply finish_base program tree continuation queue (word bits) beta parents endpoint true boundary
  exact branch_yes _ _ _ (parity_terminal program tree) (RootResetProbeSequence.terminal _ _) origin endpoint true parity
    (sequence_first _ _ (oldest_terminal program tree) origin endpoint oldest)

theorem one_tomb_handoff {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    (bits : List Bool) (continuation queue beta : Term) (admissible : Carrier.Admissible continuation)
    {decoded : List Bool} (decodedQueue : CellSpine.Decodes queue decoded)
    (oneTomb : spineTombstoneCount? queue = some 1)
    (actions payload next : Term) (parents : List ParentFrame) :
    let source := MutableBase.base (compileActions program tree) bits continuation queue beta
    let origin : Cursor := ⟨source, .right (.app (CheckpointDecoder.openEnvironment actions payload) next) :: parents⟩
    ∃ ticks state, ticks ≤ coefficient program tree * origin.erase.size ∧
      run (worker program tree).machine ticks ((worker program tree).initial origin) =
        ⟨some state, ⟨.app (.app (CheckpointDecoder.openEnvironment actions payload) next) source, parents⟩⟩ ∧
      (worker program tree).answer? state = some true := by
  dsimp only
  let source := MutableBase.base (compileActions program tree) bits continuation queue beta
  let origin : Cursor := ⟨source, .right (.app (CheckpointDecoder.openEnvironment actions payload) next) :: parents⟩
  have path : CarrierDecoder.PathDecodes program tree bits continuation source decoded := .root (.base queue beta decodedQueue)
  have boundary := RootResetCompleteCarrierRows.pending_boundary actions payload next source parents
  have parsed := CheckpointDecoder.parseBase?_mutableBase (compileActions program tree) bits continuation queue beta
  have lc : carrierLocalCount? program tree source = some 0 := by rw [carrierLocalCount?, parsed]
  have tc : carrierTombstoneCount? program tree source = some 1 := by rw [carrierTombstoneCount?, parsed]; exact oneTomb
  obtain ⟨parityTicks, parityBound, parityRun⟩ := RootResetCarrierParityAgreement.generated_runs admissible path 0 1 lc tc origin rfl true boundary
  have parity : Executes (parityWorker program tree) origin false origin := ⟨parityTicks, .done false, parityRun, rfl⟩
  obtain ⟨ticks, state, bounded, actual, answered⟩ := handoff_generated actions payload next source parents
  apply finish_base program tree continuation queue (word bits) beta _ _ true boundary
  exact branch_no _ _ _ (parity_terminal program tree) (code_terminal _) origin _ true parity ⟨ticks, state, actual, answered⟩

theorem initial_empty_handoff (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (continuation : Term) (admissible : Carrier.Admissible continuation)
    (actions payload next : Term) (parents : List ParentFrame) :
    let source := baseCarrier (environmentCode (compileActions program tree) []) continuation
    let origin : Cursor := ⟨source, .right (.app (CheckpointDecoder.openEnvironment actions payload) next) :: parents⟩
    ∃ ticks state, ticks ≤ coefficient program tree * origin.erase.size ∧
      run (worker program tree).machine ticks ((worker program tree).initial origin) =
        ⟨some state, ⟨.app (.app (CheckpointDecoder.openEnvironment actions payload) next) source, parents⟩⟩ ∧
      (worker program tree).answer? state = some true := by
  dsimp only
  let beta := baseBeta (environmentCode (compileActions program tree) []) continuation
  let source := MutableBase.base (compileActions program tree) [] continuation omega beta
  let origin : Cursor := ⟨source, .right (.app (CheckpointDecoder.openEnvironment actions payload) next) :: parents⟩
  have boundary := RootResetCompleteCarrierRows.pending_boundary actions payload next source parents
  have path : CarrierDecoder.PathDecodes program tree [] continuation source [] := .root (.base omega beta .omega)
  have parsed := CheckpointDecoder.parseBase?_mutableBase (compileActions program tree) [] continuation omega beta
  have lc : carrierLocalCount? program tree source = some 0 := by rw [carrierLocalCount?, parsed]
  have tc : carrierTombstoneCount? program tree source = some 0 := by
    rw [carrierTombstoneCount?, parsed]
    change spineTombstoneCount? omega = some 0
    rw [spineTombstoneCount?, if_pos rfl]
  obtain ⟨parityTicks, _, parityRun⟩ := RootResetCarrierParityAgreement.generated_runs admissible path 0 0 lc tc origin rfl true boundary
  have parity : Executes (parityWorker program tree) origin true origin := ⟨parityTicks, .done true, parityRun, rfl⟩
  have empty : firstLiveAddress? program tree source = none := by
    change firstLiveAddress? program tree (MutableBase.mutableBase (compileActions program tree) [] continuation omega) = none
    rw [firstLiveAddress?_mutableBase program tree [] continuation omega admissible, spineFirstLiveAddress?_omega]
    rfl
  obtain ⟨liveTicks, _, liveRun⟩ := RootResetCarrierOldestLiveAgreement.empty_runs admissible path origin rfl boundary empty
  have oldest : Executes (oldestWorker program tree) origin false origin := ⟨liveTicks, .done false, liveRun, rfl⟩
  obtain ⟨ticks, state, bounded, actual, answered⟩ := handoff_generated actions payload next source parents
  apply finish_base program tree continuation omega (word []) beta _ _ true boundary
  exact branch_yes _ _ _ (parity_terminal program tree) (RootResetProbeSequence.terminal _ _) origin _ true parity
    (sequence_second _ _ (oldest_terminal program tree) (code_terminal _) origin _ true oldest ⟨ticks, state, actual, answered⟩)

theorem post_firstC4_handoff (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (bit : Bool) (suffix : List Bool) (continuation : Term) (admissible : Carrier.Admissible continuation)
    (actions payload next : Term) (parents : List ParentFrame) :
    let source := RootResetResponseCarrierChronology.firstCarrier (compileActions program tree) bit suffix continuation
    let origin : Cursor := ⟨source, .right (.app (CheckpointDecoder.openEnvironment actions payload) next) :: parents⟩
    ∃ ticks state, ticks ≤ coefficient program tree * origin.erase.size ∧
      run (worker program tree).machine ticks ((worker program tree).initial origin) =
        ⟨some state, ⟨.app (.app (CheckpointDecoder.openEnvironment actions payload) next) source, parents⟩⟩ ∧
      (worker program tree).answer? state = some true := by
  have decoded : CellSpine.decode? (appenderAccumulator suffix (Carrier.tombstone bit omega omega)) = some suffix := by
    have empty : CellSpine.decode? (Carrier.tombstone bit omega omega) = some [] := by simp
    simpa only [List.nil_append] using ActionDecode.decode_appenderAccumulator suffix empty
  have count : spineTombstoneCount? (appenderAccumulator suffix (Carrier.tombstone bit omega omega)) = some 1 := by
    rw [RootResetResponseCarrierChronology.spineTombstoneCount?_appenderAccumulator,
      RootResetResponseCarrierChronology.spineTombstoneCount?_tombstone, spineTombstoneCount?, if_pos rfl]
    rfl
  exact one_tomb_handoff (bit :: suffix) continuation _ _ admissible (CellSpine.decode?_sound decoded) count actions payload next parents

theorem spineFirstLive_appender (suffix : List Bool) (source : Term) (address : Address)
    (selected : spineFirstLiveAddress? source = some address) :
    spineFirstLiveAddress? (appenderAccumulator suffix source) =
      some (List.replicate suffix.length Direction.right ++ address) := by
  induction suffix generalizing source address with
  | nil => exact selected
  | cons bit suffix ih =>
      have inner : spineFirstLiveAddress? (.app (live bit) source) = some (.right :: address) := by
        rw [spineFirstLiveAddress?_live, selected]
      change spineFirstLiveAddress? (appenderAccumulator suffix (.app (live bit) source)) = _
      rw [ih _ _ inner]
      rw [List.length_cons, List.replicate_succ', List.append_assoc]
      rfl

theorem initial_firstC4 (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (bit : Bool) (suffix : List Bool) (continuation : Term) (admissible : Carrier.Admissible continuation)
    (parents : List ParentFrame)
    (boundary : RootResetCompleteCarrierRows.Boundary
      ⟨baseCarrier (environmentCode (compileActions program tree) (bit :: suffix)) continuation, parents⟩) :
    let source := baseCarrier (environmentCode (compileActions program tree) (bit :: suffix)) continuation
    let address := BasePath.wordAddress ++ List.replicate suffix.length Direction.right
    ∃ endpoint ticks state,
      RootResetEdgeFragment.follow address ⟨source, parents⟩ = some endpoint ∧
      ticks ≤ coefficient program tree * (Cursor.mk source parents).erase.size ∧
      run (worker program tree).machine ticks ((worker program tree).initial ⟨source, parents⟩) = ⟨some state, endpoint⟩ ∧
      (worker program tree).answer? state = some true := by
  dsimp only
  let source := baseCarrier (environmentCode (compileActions program tree) (bit :: suffix)) continuation
  let address := BasePath.wordAddress ++ List.replicate suffix.length Direction.right
  have path : CarrierDecoder.PathDecodes program tree (bit :: suffix) continuation source (bit :: suffix) :=
    .root (.base (word (bit :: suffix)) (baseBeta (environmentCode (compileActions program tree) (bit :: suffix)) continuation)
      (CellSpine.decodes_word (bit :: suffix)))
  have front : spineFirstLiveAddress? (word (bit :: suffix)) = some (List.replicate suffix.length Direction.right) := by
    have base : spineFirstLiveAddress? (.app (live bit) omega) = some [] := by
      rw [spineFirstLiveAddress?_live, spineFirstLiveAddress?_omega]
    simpa only [List.append_nil] using! spineFirstLive_appender suffix _ [] base
  have selected : firstLiveAddress? program tree source = some address := by
    change firstLiveAddress? program tree (MutableBase.mutableBase (compileActions program tree) (bit :: suffix) continuation (word (bit :: suffix))) = some address
    rw [firstLiveAddress?_mutableBase program tree (bit :: suffix) continuation (word (bit :: suffix)) admissible, front]
    rfl
  obtain ⟨endpoint, followed⟩ := (RootResetCarrierOldestLiveAgreement.Value.path admissible path).follows
    ⟨source, parents⟩ rfl address selected
  have noTombs : spineTombstoneCount? (word (bit :: suffix)) = some 0 := by
    change spineTombstoneCount? (appenderAccumulator (bit :: suffix) omega) = some 0
    rw [RootResetResponseCarrierChronology.spineTombstoneCount?_appenderAccumulator, spineTombstoneCount?, if_pos rfl]
  obtain ⟨ticks, state, bound, actual, answered⟩ := zero_tombs_c4 (bit :: suffix) continuation (word (bit :: suffix)) _ admissible
    (CellSpine.decodes_word (bit :: suffix)) noTombs parents endpoint boundary address selected followed
  exact ⟨endpoint, ticks, state, followed, bound, actual, answered⟩

theorem completed_boundary {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {layers : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents layers) (source : Term) :
    RootResetCompleteCarrierRows.Boundary ⟨source, parents⟩ := by
  cases outer with
  | root => exact RootResetCompleteCarrierRows.root_boundary source
  | fresh => exact RootResetCompleteCarrierRows.left_boundary _ _ _
  | marked => exact RootResetCompleteCarrierRows.left_boundary _ _ _

theorem pendingParents_boundary (actions : Term) (bits : List Bool) (continuation source : Term)
    (count : Nat) (parents : List ParentFrame) (outer : RootResetCompleteCarrierRows.Boundary ⟨source, parents⟩) :
    RootResetCompleteCarrierRows.Boundary
      ⟨source, PrimitiveFuel.pendingParents (environmentCode actions bits) continuation count parents⟩ := by
  induction count generalizing parents with
  | zero => exact outer
  | succ count ih => exact ih _ (RootResetCompleteCarrierRows.pending_boundary actions (word bits) continuation source parents)

theorem fuelTerminal_firstC4 {program : CTS.Program} {layout : ActionDispatcher program}
    {outerParents : List ParentFrame} {layers : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout outerParents layers)
    (registers : SchedulerControl.Registers program) (bit : Bool) (suffix : List Bool)
    (horizon remaining fuel depth : Nat) :
    let continuation := RootResetEmptyHandoffContext.exitTerm program layout horizon remaining (bit :: suffix)
    let origin := (SchedulerNestedPhase.fuelTerminalConfigurationAt program layout (bit :: suffix) registers continuation outerParents fuel depth).cursor
    let address := BasePath.wordAddress ++ List.replicate suffix.length Direction.right
    ∃ endpoint ticks state, RootResetEdgeFragment.follow address origin = some endpoint ∧
      ticks ≤ coefficient program layout.tree * origin.erase.size ∧
      run (worker program layout.tree).machine ticks ((worker program layout.tree).initial origin) = ⟨some state, endpoint⟩ ∧
      (worker program layout.tree).answer? state = some true := by
  dsimp only
  apply initial_firstC4 program layout.tree bit suffix _ (Dovetail.clockExit_admissible ..)
  exact pendingParents_boundary (compileActions program layout.tree) (bit :: suffix) _ _ _ outerParents (completed_boundary outer _)

theorem fifth_empty_handoff (program : CTS.Program) (layout : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (horizon remaining count : Nat) (parents : List ParentFrame) :
    let environment := environmentCode (compileActions program layout.tree) []
    let continuation := Dovetail.clockExit horizon remaining environment
    let origin := (SchedulerInvariant.fuelZeroFifthMutationConfiguration program layout registers environment continuation
      (PrimitiveFuel.pendingParents environment continuation (count + 1) parents)).cursor
    let endpoint : Cursor := ⟨frame environment continuation (baseCarrier environment continuation),
      PrimitiveFuel.pendingParents environment continuation count parents⟩
    ∃ ticks state, ticks ≤ coefficient program layout.tree * origin.erase.size ∧
      run (worker program layout.tree).machine ticks ((worker program layout.tree).initial origin) = ⟨some state, endpoint⟩ ∧
      (worker program layout.tree).answer? state = some true := by
  dsimp only
  rw [SchedulerCycle.pendingParents_succ_cons]
  exact initial_empty_handoff program layout.tree _ (Dovetail.clockExit_admissible ..)
    (compileActions program layout.tree) (word []) _ _

end PureSFormal.Research.RootResetBaseQueueAgreement
