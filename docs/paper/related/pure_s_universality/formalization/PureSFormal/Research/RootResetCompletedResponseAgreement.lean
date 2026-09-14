import PureSFormal.Research.RootResetCompletedResponseProbe
import PureSFormal.Research.RootResetFrontNonemptyAgreement

/-! Exact C4, COMMIT and handoff runs through the composed response worker. -/
namespace PureSFormal.Research.RootResetCompletedResponseAgreement
open PureSFormal.PureS
open FiniteController RootResetProbeSequence RootResetCompletedResponseAtoms RootResetCompletedResponseProbe
open RootResetSelectedFrontParserAgreement RootResetPersistentResponseSelector

def Executes (worker : Worker) (origin : Cursor) (ready : Bool) (endpoint : Cursor) : Prop :=
  ∃ ticks state, run worker.machine ticks (worker.initial origin) = ⟨some state, endpoint⟩ ∧ worker.answer? state = some ready

theorem branch_yes (test yes no : Worker) (testTerminal : test.Terminal) (yesTerminal : yes.Terminal)
    (origin endpoint : Cursor) (ready : Bool) (query : Executes test origin true origin) (selected : Executes yes origin ready endpoint) :
    Executes (RootResetProbeBranch.worker test yes no) origin ready endpoint := by
  obtain ⟨testTicks, testState, testRun, testAnswer⟩ := query
  obtain ⟨testUsed, _, testActual⟩ := RootResetProbeBranch.testing_runs test yes no testTerminal origin origin testTicks testState true testRun testAnswer
  obtain ⟨ticks, state, actual, answered⟩ := selected
  obtain ⟨used, _, finalRun⟩ := RootResetProbeBranch.positive_runs test yes no yesTerminal origin endpoint ticks state ready actual answered
  refine ⟨testUsed + 1 + (used + 1), .done ready, ?_, rfl⟩
  exact (run_add (RootResetProbeBranch.machine test yes no) (testUsed + 1) (used + 1) _).trans
    ((congrArg (run (RootResetProbeBranch.machine test yes no) (used + 1)) testActual).trans finalRun)

theorem branch_no (test yes no : Worker) (testTerminal : test.Terminal) (noTerminal : no.Terminal)
    (origin endpoint : Cursor) (ready : Bool) (query : Executes test origin false origin) (selected : Executes no origin ready endpoint) :
    Executes (RootResetProbeBranch.worker test yes no) origin ready endpoint := by
  obtain ⟨testTicks, testState, testRun, testAnswer⟩ := query
  obtain ⟨testUsed, _, testActual⟩ := RootResetProbeBranch.testing_runs test yes no testTerminal origin origin testTicks testState false testRun testAnswer
  obtain ⟨ticks, state, actual, answered⟩ := selected
  obtain ⟨used, _, finalRun⟩ := RootResetProbeBranch.negative_runs test yes no noTerminal origin endpoint ticks state ready actual answered
  refine ⟨testUsed + 1 + (used + 1), .done ready, ?_, rfl⟩
  exact (run_add (RootResetProbeBranch.machine test yes no) (testUsed + 1) (used + 1) _).trans
    ((congrArg (run (RootResetProbeBranch.machine test yes no) (used + 1)) testActual).trans finalRun)

theorem sequence_first (first second : Worker) (terminal : first.Terminal) (origin endpoint : Cursor)
    (selected : Executes first origin true endpoint) : Executes (RootResetProbeSequence.worker first second) origin true endpoint := by
  obtain ⟨ticks, state, actual, answered⟩ := selected
  obtain ⟨used, _, finalRun⟩ := RootResetProbeSequence.first_runs first second terminal origin endpoint ticks state true actual answered
  exact ⟨used + 1, .done true, finalRun, rfl⟩

theorem sequence_second (first second : Worker) (firstTerminal : first.Terminal) (secondTerminal : second.Terminal)
    (origin endpoint : Cursor) (ready : Bool) (missed : Executes first origin false origin) (selected : Executes second origin ready endpoint) :
    Executes (RootResetProbeSequence.worker first second) origin ready endpoint := by
  obtain ⟨firstTicks, firstState, firstRun, firstAnswer⟩ := missed
  obtain ⟨firstUsed, _, firstActual⟩ := RootResetProbeSequence.first_runs first second firstTerminal origin origin firstTicks firstState false firstRun firstAnswer
  obtain ⟨ticks, state, actual, answered⟩ := selected
  obtain ⟨used, _, finalRun⟩ := RootResetProbeSequence.second_runs first second secondTerminal origin endpoint ticks state ready actual answered
  refine ⟨firstUsed + 1 + (used + 1), .done ready, ?_, rfl⟩
  change run (RootResetProbeSequence.machine first second) _ (RootResetProbeSequence.initial first second origin) = _
  rw [run_add, firstActual]
  exact finalRun

theorem fresh_guard {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)} {source : Term}
    {view : CheckpointDecoder.LocalView program} (parsed : CheckpointDecoder.parseLocal? program tree source = some view)
    (fresh : view.status = .fresh) (origin : Cursor) (atSource : origin.focus = source) : Executes (guardWorker program tree) origin true origin := by
  obtain ⟨ticks, state, _, actual, answered⟩ := guard_runs program tree origin
  have accepted : RootResetCompletedLocalPatterns.accepts .fresh program tree origin.focus = true :=
    atSource ▸ (RootResetCompletedLocalPatterns.accepts_iff_parse .fresh program tree source).mpr ⟨view, fresh, parsed⟩
  rw [accepted] at answered
  exact ⟨ticks, state, actual, answered⟩

theorem finish_body {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)} {source : Term}
    {view : CheckpointDecoder.LocalView program} (parsed : CheckpointDecoder.parseLocal? program tree source = some view)
    (fresh : view.status = .fresh) (pending ready : Bool) (origin endpoint : Cursor) (atSource : origin.focus = source)
    (boundary : RootResetCompleteCarrierRows.Boundary origin) (selected : Executes (body program tree pending) origin ready endpoint) :
    ∃ ticks, ticks ≤ coefficient program tree pending * origin.erase.size ∧
      run (machine program tree pending) ticks (initial program tree pending origin) = ⟨some (.done ready), endpoint⟩ := by
  obtain ⟨ticks, state, actual, answered⟩ := branch_yes (guardWorker program tree) (body program tree pending) rejectWorker
    (code_terminal _) (body_terminal program tree pending) origin endpoint ready (fresh_guard parsed fresh origin atSource) selected
  cases state with
  | testing _ | positive _ | negative _ => cases answered
  | done result =>
      have same : result = ready := Option.some.inj answered
      subst result
      exact bounded_terminal program tree pending ready origin endpoint boundary ticks actual

theorem oldest_local_selected {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term} {decoded : List Bool} {view : CheckpointDecoder.LocalView program}
    (admissible : Carrier.Admissible continuation) (parsed : CheckpointDecoder.parseLocal? program tree source = some view)
    (path : CarrierDecoder.PathDecodes program tree bits continuation view.accumulator decoded)
    (origin endpoint : Cursor) (atSource : origin.focus = source) (boundary : RootResetCompleteCarrierRows.Boundary origin)
    (address : Address) (selected : firstLiveAddress? program tree view.accumulator = some address)
    (followed : RootResetEdgeFragment.follow (RootResetResponseBoundaryStages.localAccumulatorAddress view ++ address) origin = some endpoint) :
    Executes (oldestWorker program tree) origin true endpoint := by
  have value := RootResetCarrierOldestLiveAgreement.Value.local parsed (RootResetCarrierOldestLiveAgreement.Value.path admissible path)
  obtain ⟨ticks, _, actual⟩ := value.generated_runs origin atSource boundary
  have noCell := parseCell?_none_of_headArity_five_or_six (CheckpointDecoder.parseLocal?_headArity parsed)
  have noBase := CheckpointRun.parseBase?_none_of_localShape (CheckpointDecoder.parseLocal?_sound parsed)
  have sourceSelected : firstLiveAddress? program tree source = some (RootResetResponseBoundaryStages.localAccumulatorAddress view ++ address) := by
    rw [firstLiveAddress?, dif_pos noCell, noBase, parsed]
    dsimp only
    rw [selected]
    rfl
  rw [sourceSelected] at actual
  change run _ ticks _ = RootResetCarrierOldestLiveProbe.final program tree origin
    (RootResetEdgeFragment.follow (RootResetResponseBoundaryStages.localAccumulatorAddress view ++ address) origin) at actual
  rw [followed] at actual
  exact ⟨ticks, .done true, actual, rfl⟩

theorem pending_c4 {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term} {decoded : List Bool} {view : CheckpointDecoder.LocalView program}
    (admissible : Carrier.Admissible continuation) (parsed : CheckpointDecoder.parseLocal? program tree source = some view)
    (fresh : view.status = .fresh) (path : CarrierDecoder.PathDecodes program tree bits continuation view.accumulator decoded)
    (locals : Nat) (localCount : carrierLocalCount? program tree view.accumulator = some locals)
    (tombCount : carrierTombstoneCount? program tree view.accumulator = some (locals + 1))
    (origin endpoint : Cursor) (atSource : origin.focus = source) (boundary : RootResetCompleteCarrierRows.Boundary origin)
    (address : Address) (selected : firstLiveAddress? program tree view.accumulator = some address)
    (followed : RootResetEdgeFragment.follow (RootResetResponseBoundaryStages.localAccumulatorAddress view ++ address) origin = some endpoint) :
    ∃ ticks, ticks ≤ coefficient program tree true * origin.erase.size ∧
      run (machine program tree true) ticks (initial program tree true origin) = ⟨some (.done true), endpoint⟩ := by
  obtain ⟨ticks, _, actual⟩ := RootResetCarrierParityAgreement.local_one_excess admissible parsed path locals localCount tombCount origin atSource boundary
  have parity : Executes (parityWorker program tree) origin true origin := ⟨ticks, .done true, actual, rfl⟩
  have front := oldest_local_selected admissible parsed path origin endpoint atSource boundary address selected followed
  have selectedBody : Executes (body program tree true) origin true endpoint :=
    branch_yes _ _ _ (parity_terminal program tree) (RootResetProbeSequence.terminal _ _) origin endpoint true parity
      (sequence_first _ _ (oldest_terminal program tree) origin endpoint front)
  exact finish_body parsed fresh true true origin endpoint atSource boundary selectedBody

theorem pending_handoff {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term} {decoded : List Bool} {view : CheckpointDecoder.LocalView program}
    (admissible : Carrier.Admissible continuation) (parsed : CheckpointDecoder.parseLocal? program tree source = some view)
    (fresh : view.status = .fresh) (path : CarrierDecoder.PathDecodes program tree bits continuation view.accumulator decoded)
    (locals : Nat) (localCount : carrierLocalCount? program tree view.accumulator = some locals)
    (tombCount : carrierTombstoneCount? program tree view.accumulator = some (locals + 2))
    (actions payload next : Term) (parents : List ParentFrame) :
    let origin : Cursor := ⟨source, .right (.app (CheckpointDecoder.openEnvironment actions payload) next) :: parents⟩
    ∃ ticks, ticks ≤ coefficient program tree true * origin.erase.size ∧
      run (machine program tree true) ticks (initial program tree true origin) =
        ⟨some (.done true), ⟨.app (.app (CheckpointDecoder.openEnvironment actions payload) next) source, parents⟩⟩ := by
  dsimp only
  let origin : Cursor := ⟨source, .right (.app (CheckpointDecoder.openEnvironment actions payload) next) :: parents⟩
  have boundary := RootResetCompleteCarrierRows.pending_boundary actions payload next source parents
  obtain ⟨ticks, _, actual⟩ := RootResetCarrierParityAgreement.local_two_excess admissible parsed path locals localCount tombCount origin rfl boundary
  have parity : Executes (parityWorker program tree) origin false origin := ⟨ticks, .done false, actual, rfl⟩
  obtain ⟨handoffTicks, state, _, handoffRun, answered⟩ := handoff_generated actions payload next source parents
  have selectedBody : Executes (body program tree true) origin true _ :=
    branch_no _ _ _ (parity_terminal program tree) (code_terminal _) origin _ true parity ⟨handoffTicks, state, handoffRun, answered⟩
  exact finish_body parsed fresh true true origin _ rfl boundary selectedBody

theorem nonempty_local {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term} {decoded : List Bool} {view : CheckpointDecoder.LocalView program}
    (admissible : Carrier.Admissible continuation) (parsed : CheckpointDecoder.parseLocal? program tree source = some view)
    (path : CarrierDecoder.PathDecodes program tree bits continuation view.accumulator decoded)
    (origin : Cursor) (atSource : origin.focus = source) (boundary : RootResetCompleteCarrierRows.Boundary origin) :
    Executes (nonemptyWorker program tree) origin (!decoded.isEmpty) origin := by
  obtain ⟨ticks, descended, _, actual, walked⟩ := RootResetCarrierInverseUnique.all_input_restores program tree origin boundary.1
  have value := RootResetCarrierNonemptyAgreement.ReadValue.local parsed (RootResetCarrierNonemptyAgreement.ReadValue.path admissible path)
  rw [value.walks walked atSource] at actual
  exact ⟨ticks, .done _, actual, rfl⟩

theorem nonpending_commit {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term} {view : CheckpointDecoder.LocalView program}
    (admissible : Carrier.Admissible continuation) (parsed : CheckpointDecoder.parseLocal? program tree source = some view)
    (fresh : view.status = .fresh) (path : CarrierDecoder.PathDecodes program tree bits continuation view.accumulator [])
    (origin endpoint : Cursor) (atSource : origin.focus = source) (boundary : RootResetCompleteCarrierRows.Boundary origin)
    (followed : RootResetEdgeFragment.follow [.left, .left, .left] origin = some endpoint) :
    ∃ ticks, ticks ≤ coefficient program tree false * origin.erase.size ∧
      run (machine program tree false) ticks (initial program tree false origin) = ⟨some (.done true), endpoint⟩ := by
  have empty := nonempty_local admissible parsed path origin atSource boundary
  obtain ⟨ticks, state, _, actual, answered⟩ := commit_generated parsed fresh origin endpoint atSource followed
  have selectedBody : Executes (body program tree false) origin true endpoint :=
    branch_no _ _ _ (nonempty_terminal program tree) (code_terminal _) origin endpoint true empty ⟨ticks, state, actual, answered⟩
  exact finish_body parsed fresh false true origin endpoint atSource boundary selectedBody

theorem oldest_local_empty {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term} {view : CheckpointDecoder.LocalView program}
    (admissible : Carrier.Admissible continuation) (parsed : CheckpointDecoder.parseLocal? program tree source = some view)
    (path : CarrierDecoder.PathDecodes program tree bits continuation view.accumulator [])
    (origin : Cursor) (atSource : origin.focus = source) (boundary : RootResetCompleteCarrierRows.Boundary origin) :
    Executes (oldestWorker program tree) origin false origin := by
  have noFront := RootResetFrontNonemptyAgreement.generated_front_nonempty admissible path
  have empty : firstLiveAddress? program tree view.accumulator = none := by
    cases selected : firstLiveAddress? program tree view.accumulator with
    | none => rfl
    | some address => rw [selected] at noFront; cases noFront
  have value := RootResetCarrierOldestLiveAgreement.Value.local parsed (RootResetCarrierOldestLiveAgreement.Value.path admissible path)
  obtain ⟨ticks, _, actual⟩ := value.generated_runs origin atSource boundary
  have noCell := parseCell?_none_of_headArity_five_or_six (CheckpointDecoder.parseLocal?_headArity parsed)
  have noBase := CheckpointRun.parseBase?_none_of_localShape (CheckpointDecoder.parseLocal?_sound parsed)
  have noSource : firstLiveAddress? program tree source = none := by
    rw [firstLiveAddress?, dif_pos noCell, noBase, parsed]
    dsimp only
    rw [empty]
    rfl
  rw [noSource] at actual
  exact ⟨ticks, .done false, actual, rfl⟩

theorem pending_commit {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term} {view : CheckpointDecoder.LocalView program}
    (admissible : Carrier.Admissible continuation) (parsed : CheckpointDecoder.parseLocal? program tree source = some view)
    (fresh : view.status = .fresh) (path : CarrierDecoder.PathDecodes program tree bits continuation view.accumulator [])
    (locals : Nat) (localCount : carrierLocalCount? program tree view.accumulator = some locals)
    (tombCount : carrierTombstoneCount? program tree view.accumulator = some (locals + 1))
    (origin endpoint : Cursor) (atSource : origin.focus = source) (boundary : RootResetCompleteCarrierRows.Boundary origin)
    (followed : RootResetEdgeFragment.follow [.left, .left, .left] origin = some endpoint) :
    ∃ ticks, ticks ≤ coefficient program tree true * origin.erase.size ∧
      run (machine program tree true) ticks (initial program tree true origin) = ⟨some (.done true), endpoint⟩ := by
  obtain ⟨ticks, _, actual⟩ := RootResetCarrierParityAgreement.local_one_excess admissible parsed path locals localCount tombCount origin atSource boundary
  have parity : Executes (parityWorker program tree) origin true origin := ⟨ticks, .done true, actual, rfl⟩
  have empty := oldest_local_empty admissible parsed path origin atSource boundary
  obtain ⟨commitTicks, state, _, commitRun, answered⟩ := commit_generated parsed fresh origin endpoint atSource followed
  have choice := sequence_second _ _ (oldest_terminal program tree) (code_terminal _) origin endpoint true empty ⟨commitTicks, state, commitRun, answered⟩
  have selectedBody : Executes (body program tree true) origin true endpoint :=
    branch_yes _ _ _ (parity_terminal program tree) (RootResetProbeSequence.terminal _ _) origin endpoint true parity choice
  exact finish_body parsed fresh true true origin endpoint atSource boundary selectedBody

theorem nonpending_nonempty_rejected {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term} {view : CheckpointDecoder.LocalView program}
    (admissible : Carrier.Admissible continuation) (parsed : CheckpointDecoder.parseLocal? program tree source = some view)
    (fresh : view.status = .fresh) (bit : Bool) (tail : List Bool)
    (path : CarrierDecoder.PathDecodes program tree bits continuation view.accumulator (bit :: tail))
    (origin : Cursor) (atSource : origin.focus = source) (boundary : RootResetCompleteCarrierRows.Boundary origin) :
    ∃ ticks, ticks ≤ coefficient program tree false * origin.erase.size ∧
      run (machine program tree false) ticks (initial program tree false origin) = ⟨some (.done false), origin⟩ := by
  have nonempty := nonempty_local admissible parsed path origin atSource boundary
  have rejected : Executes rejectWorker origin false origin := ⟨0, ⟨.answer false, ProbeCompiler.Control.self_mem_nodes _⟩, rfl, rfl⟩
  have selectedBody : Executes (body program tree false) origin false origin :=
    branch_yes _ _ _ (nonempty_terminal program tree) (code_terminal _) origin origin false nonempty rejected
  exact finish_body parsed fresh false false origin origin atSource boundary selectedBody

theorem rejected_notFresh (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (pending : Bool) (origin : Cursor)
    (rejected : RootResetCompletedLocalPatterns.accepts .fresh program tree origin.focus = false) :
    ∃ ticks, run (machine program tree pending) ticks (initial program tree pending origin) = ⟨some (.done false), origin⟩ := by
  obtain ⟨guardTicks, state, _, guardRun, answered⟩ := guard_runs program tree origin
  rw [rejected] at answered
  have query : Executes (guardWorker program tree) origin false origin := ⟨guardTicks, state, guardRun, answered⟩
  have reject : Executes rejectWorker origin false origin := ⟨0, ⟨.answer false, ProbeCompiler.Control.self_mem_nodes _⟩, rfl, rfl⟩
  obtain ⟨ticks, state, actual, answered⟩ := branch_no (guardWorker program tree) (body program tree pending) rejectWorker (code_terminal _) (code_terminal _) origin origin false query reject
  cases state with
  | testing _ | positive _ | negative _ => cases answered
  | done result =>
      have same : result = false := Option.some.inj answered
      subst result
      exact ⟨ticks, actual⟩

end PureSFormal.Research.RootResetCompletedResponseAgreement
