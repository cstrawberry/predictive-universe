import PureSFormal.Research.RootResetCompletedResponseAgreement

/-! A concrete limitation of the original pending-parity worker. A completed
fresh response above an untouched EMPTY Base has one Local and no tombstone;
its parity selects the pending handoff before the required COMMIT. -/
namespace PureSFormal.Research.RootResetEmptyParityCounterexample
open PureSFormal.PureS
open FiniteController RootResetCompletedResponseAgreement RootResetCompletedResponseAtoms RootResetCompletedResponseProbe
open RootResetPersistentResponseSelector

theorem zero_accumulator_parity {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term} {decoded : List Bool} {view : CheckpointDecoder.LocalView program}
    (admissible : Carrier.Admissible continuation) (parsed : CheckpointDecoder.parseLocal? program tree source = some view)
    (path : CarrierDecoder.PathDecodes program tree bits continuation view.accumulator decoded)
    (localCount : carrierLocalCount? program tree view.accumulator = some 0)
    (tombCount : carrierTombstoneCount? program tree view.accumulator = some 0)
    (origin : Cursor) (atSource : origin.focus = source) (boundary : RootResetCompleteCarrierRows.Boundary origin) :
    ∃ ticks, ticks ≤ RootResetCarrierParityProbe.coefficient program tree * origin.erase.size ∧
      run (RootResetCarrierParityProbe.machine program tree) ticks (RootResetCarrierParityProbe.initial program tree true origin) =
        ⟨some (.done false), origin⟩ := by
  obtain ⟨locals, tombs, countedLocals, countedTombs, value⟩ := RootResetCarrierParityAgreement.Value.path admissible path
  have localEq := Option.some.inj (countedLocals.symm.trans localCount)
  have tombEq := Option.some.inj (countedTombs.symm.trans tombCount)
  subst locals
  subst tombs
  exact (RootResetCarrierParityAgreement.Value.local_counts parsed 0 0 localCount tombCount value).2.2.generated_runs origin atSource true boundary

theorem pending_zero_accumulator_handoff {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term} {decoded : List Bool} {view : CheckpointDecoder.LocalView program}
    (admissible : Carrier.Admissible continuation) (parsed : CheckpointDecoder.parseLocal? program tree source = some view)
    (fresh : view.status = .fresh) (path : CarrierDecoder.PathDecodes program tree bits continuation view.accumulator decoded)
    (localCount : carrierLocalCount? program tree view.accumulator = some 0)
    (tombCount : carrierTombstoneCount? program tree view.accumulator = some 0)
    (actions payload next : Term) (parents : List ParentFrame) :
    let origin : Cursor := ⟨source, .right (.app (CheckpointDecoder.openEnvironment actions payload) next) :: parents⟩
    ∃ ticks, ticks ≤ coefficient program tree true * origin.erase.size ∧
      run (machine program tree true) ticks (initial program tree true origin) =
        ⟨some (.done true), ⟨.app (.app (CheckpointDecoder.openEnvironment actions payload) next) source, parents⟩⟩ := by
  dsimp only
  let origin : Cursor := ⟨source, .right (.app (CheckpointDecoder.openEnvironment actions payload) next) :: parents⟩
  have boundary := RootResetCompleteCarrierRows.pending_boundary actions payload next source parents
  obtain ⟨ticks, _, actual⟩ := zero_accumulator_parity admissible parsed path localCount tombCount origin rfl boundary
  have parity : Executes (parityWorker program tree) origin false origin := ⟨ticks, .done false, actual, rfl⟩
  obtain ⟨handoffTicks, state, _, handoffRun, answered⟩ := handoff_generated actions payload next source parents
  have selectedBody : Executes (body program tree true) origin true _ :=
    branch_no _ _ _ (parity_terminal program tree) (code_terminal _) origin _ true parity ⟨handoffTicks, state, handoffRun, answered⟩
  exact finish_body parsed fresh true true origin _ rfl boundary selectedBody

theorem initial_empty_completed_handoff (program : CTS.Program) (layout : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (continuation : Term) (admissible : Carrier.Admissible continuation)
    (actions payload next : Term) (parents : List ParentFrame) :
    let carrier := baseCarrier (environmentCode (compileActions program layout.tree) []) continuation
    let source := LocalResponse.completed [] continuation carrier (SchedulerResponse.completedRoute program layout registers false carrier)
    let origin : Cursor := ⟨source, .right (.app (CheckpointDecoder.openEnvironment actions payload) next) :: parents⟩
    ∃ ticks, ticks ≤ coefficient program layout.tree true * origin.erase.size ∧
      run (machine program layout.tree true) ticks (initial program layout.tree true origin) =
        ⟨some (.done true), ⟨.app (.app (CheckpointDecoder.openEnvironment actions payload) next) source, parents⟩⟩ := by
  let carrier := baseCarrier (environmentCode (compileActions program layout.tree) []) continuation
  have parsed := CheckpointDecoder.parseLocal?_completed (continuation := continuation) [] (SchedulerResponse.completedRoute_snapshotDispatch program layout registers false carrier)
  have path : CarrierDecoder.PathDecodes program layout.tree [] continuation carrier [] :=
    .root (.base omega (baseBeta (environmentCode (compileActions program layout.tree) []) continuation) .omega)
  have localCount : carrierLocalCount? program layout.tree carrier = some 0 := by
    change carrierLocalCount? program layout.tree (MutableBase.base (compileActions program layout.tree) [] continuation omega (baseBeta (environmentCode (compileActions program layout.tree) []) continuation)) = _
    rw [carrierLocalCount?, CheckpointDecoder.parseBase?_mutableBase]
  have tombCount : carrierTombstoneCount? program layout.tree carrier = some 0 := by
    change carrierTombstoneCount? program layout.tree (MutableBase.base (compileActions program layout.tree) [] continuation omega (baseBeta (environmentCode (compileActions program layout.tree) []) continuation)) = _
    rw [carrierTombstoneCount?, CheckpointDecoder.parseBase?_mutableBase]
    change spineTombstoneCount? omega = some 0
    rw [spineTombstoneCount?, if_pos rfl]
  exact pending_zero_accumulator_handoff admissible parsed rfl path localCount tombCount actions payload next parents

end PureSFormal.Research.RootResetEmptyParityCounterexample
