import PureSFormal.PureS.RegisteredMarkerGlobalSoundness
import PureSFormal.Research.RootResetInitialEmptyCommitAgreement

/-! Cursor-preserving marker selection. These statements concern the actual
fresh-root machine execution and the literal contracted occurrence. -/
namespace PureSFormal.Research.RootResetRegisteredMarkerOccurrence
open PureSFormal.PureS
open FiniteController RootResetFinitePrioritySelector
open RootResetCompletedResponseAgreement RootResetInitialEmptyCommitAgreement
open RootResetActivePendingAgreement

abbrev Configuration (program : CTS.Program) (layout : ActionDispatcher program) :=
  FiniteController.Configuration
    (RootResetReadonlySelector.Control (SelectionControl program layout))

def contractConfiguration (program : CTS.Program) (layout : ActionDispatcher program)
    (cursor : Cursor) : Configuration program layout :=
  ⟨some (.tail (.euler .contract)), cursor⟩

/-- This retains the pre-contraction cursor of an actual fresh-root run. -/
def SelectsCursor (program : CTS.Program) (layout : ActionDispatcher program)
    (source : Term) (endpoint : Cursor) : Prop :=
  ∃ ticks, run (selectorContract program layout).machine ticks
    ((selectorContract program layout).initial source) =
      contractConfiguration program layout endpoint

/-- A decoder-free predicate on the actual contracting root-selector row. -/
def performsMarkH? (program : CTS.Program) (layout : ActionDispatcher program)
    (configuration : Configuration program layout) : Bool :=
  match configuration.control with
  | some (.tail (.euler .contract)) =>
      (TermEvent.freshHaltPayload? configuration.cursor.focus).isSome
  | _ => false

theorem fresh_pass_selects_cursor (program : CTS.Program) (layout : ActionDispatcher program)
    (source : Term) (endpoint : Cursor)
    (actual : Executes (RootResetFreshResponsePass.worker program layout.tree)
      (Cursor.atRoot source) true endpoint) :
    SelectsCursor program layout source endpoint := by
  obtain ⟨ticks, state, execution, answered⟩ := actual
  obtain ⟨used, _, selected⟩ := RootResetPriorityReplay.first_selected
    (RootResetFreshResponsePass.probeSpec program layout.tree)
    (laterSpec program layout) source ticks state endpoint execution answered
  obtain ⟨used', _, selected'⟩ := RootResetReadonlySelector.probe_runs
    (selectionSpec program layout) source used (.done true) endpoint selected rfl
  refine ⟨used' + 1, ?_⟩
  change run (RootResetReadonlySelector.machine (selectionSpec program layout)) _
    (RootResetReadonlySelector.initial (selectionSpec program layout) source) = _
  rw [run_add, selected']
  rfl

/-- The advertised fixed-budget invocation ends at the same literal cursor
after contraction, so the cursor lift is also an outcome/address lift. -/
theorem fresh_pass_final_cursor (program : CTS.Program) (layout : ActionDispatcher program)
    (source : Term) (endpoint after : Cursor)
    (actual : Executes (RootResetFreshResponsePass.worker program layout.tree)
      (Cursor.atRoot source) true endpoint)
    (contracted : endpoint.rdx? = some after) :
    run (selectorContract program layout).machine
      ((selectorContract program layout).stoppingTime source)
      ((selectorContract program layout).initial source) =
        ⟨some (.tail (.euler .doneRedex)), after⟩ := by
  obtain ⟨ticks, state, execution, answered⟩ := actual
  obtain ⟨used, _, selected⟩ := RootResetPriorityReplay.first_selected
    (RootResetFreshResponsePass.probeSpec program layout.tree)
    (laterSpec program layout) source ticks state endpoint execution answered
  exact RootResetReadonlySelector.selected_final
    (selectionSpec program layout) source used (.done true) endpoint after selected rfl contracted

theorem commit_follow (bits : List Bool) (continuation carrier dispatch : Term)
    (parents : List ParentFrame) :
    RootResetEdgeFragment.follow [.left, .left, .left]
      ⟨LocalResponse.completed bits continuation carrier dispatch, parents⟩ =
        some (commitCursor bits continuation carrier dispatch parents) := rfl

theorem normal_start_cursor (program : CTS.Program) (layout : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    (run (SchedulerControl.machine program layout) 3
      (SchedulerResponse.markStartConfiguration program layout registers bit bits continuation carrier parents)).cursor =
      commitCursor bits continuation carrier
        (SchedulerResponse.completedRoute program layout registers bit carrier) parents := rfl

theorem empty_start_cursor (program : CTS.Program) (layout : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    (run (SchedulerControl.machine program layout) 3
      (SchedulerEmpty.markStartConfiguration program layout registers bits continuation carrier parents)).cursor =
      commitCursor bits continuation carrier
        (SchedulerResponse.completedRoute program layout registers false carrier) parents := rfl

theorem commit_rdx (bits : List Bool) (continuation carrier dispatch : Term)
    (parents : List ParentFrame) :
    (commitCursor bits continuation carrier dispatch parents).rdx? =
      some ⟨Carrier.markedHField carrier carrier,
        (commitCursor bits continuation carrier dispatch parents).parents⟩ := rfl

theorem contract_performs (program : CTS.Program) (layout : ActionDispatcher program)
    (payload : Term) (parents : List ParentFrame) :
    performsMarkH? program layout
      (contractConfiguration program layout ⟨freshHField payload, parents⟩) = true := by
  change (TermEvent.freshHaltPayload? (freshHField payload)).isSome = true
  rw [TermEvent.freshHaltPayload?_freshHField]
  rfl

theorem contract_step (program : CTS.Program) (layout : ActionDispatcher program)
    (payload : Term) (parents : List ParentFrame) :
    step (selectorContract program layout).machine
      (contractConfiguration program layout ⟨freshHField payload, parents⟩) =
      ⟨some (.tail (.euler .doneRedex)), ⟨Carrier.markedHField payload payload, parents⟩⟩ := rfl

theorem contract_mutation (program : CTS.Program) (layout : ActionDispatcher program)
    (payload : Term) (parents : List ParentFrame) :
    mutationCount (selectorContract program layout).machine
      (contractConfiguration program layout ⟨freshHField payload, parents⟩) = 1 := rfl

/-- Both controllers contract the identical cursor, including every parent. -/
theorem normal_post_cursor (program : CTS.Program) (layout : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    (step (selectorContract program layout).machine
      (contractConfiguration program layout
        (commitCursor bits continuation carrier
          (SchedulerResponse.completedRoute program layout registers bit carrier) parents))).cursor =
    (run (SchedulerControl.machine program layout) 4
      (SchedulerResponse.markStartConfiguration program layout registers bit bits continuation carrier parents)).cursor := rfl

theorem empty_post_cursor (program : CTS.Program) (layout : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    (step (selectorContract program layout).machine
      (contractConfiguration program layout
        (commitCursor bits continuation carrier
          (SchedulerResponse.completedRoute program layout registers false carrier) parents))).cursor =
    (run (SchedulerControl.machine program layout) 4
      (SchedulerEmpty.markStartConfiguration program layout registers bits continuation carrier parents)).cursor := rfl

theorem empty_fresh_root_occurrence
    {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {count : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents count)
    (layers : List Layer) (registers : SchedulerControl.Registers program)
    (bits : List Bool) (horizon remaining : Nat) (carrier : Term)
    (path : CarrierDecoder.PathDecodes program layout.tree bits
      (RootResetEmptyHandoffContext.exitTerm program layout horizon remaining bits) carrier [])
    (emptyOrigin : RootResetEmptyOriginProbe.Reads program layout.tree carrier none) :
    let continuation := RootResetEmptyHandoffContext.exitTerm program layout horizon remaining bits
    let dispatch := SchedulerResponse.completedRoute program layout registers false carrier
    let source := Cursor.rebuild parents (wrap (compileActions program layout.tree) layers
      (LocalResponse.completed bits continuation carrier dispatch))
    let endpoint := commitCursor bits continuation carrier dispatch
      (parentsAfter (compileActions program layout.tree) layers parents)
    SelectsCursor program layout source endpoint ∧
      performsMarkH? program layout (contractConfiguration program layout endpoint) = true := by
  dsimp only
  exact ⟨fresh_pass_selects_cursor program layout _ _
    (RootResetInitialEmptyCommitAgreement.fresh_pass outer layers registers bits horizon remaining carrier path emptyOrigin),
    contract_performs program layout _ _⟩

/-- Normal empty-output responses select the literal halt-field cursor under
every pending-frame depth, including the nonpending outer boundary. -/
theorem normal_fresh_pass
    {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {history : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents history)
    (layers : List Layer) (horizon remaining : Nat) (bits : List Bool)
    {source : Term} {registers : SchedulerControl.Registers program} {bit : Bool} {suffix : List Bool}
    {outerContext fullContext innerContext targetContext : Context}
    {traceParents : List ParentFrame} {ticks count : Nat}
    (trace : SchedulerCycle.SelectedResponseTrace program layout bits
      (RootResetEmptyHandoffContext.exitTerm program layout horizon remaining bits) source
      (Dovetail.clockExit_admissible ..) registers bit suffix
      outerContext fullContext innerContext targetContext traceParents ticks)
    (normal : RootResetOrderedCarrier.NormalInvariant program layout.tree bits
      (RootResetEmptyHandoffContext.exitTerm program layout horizon remaining bits)
      source registers.phase (bit :: suffix) count)
    (output : (CTS.absorbingStep program ⟨registers.phase, bit :: suffix⟩).data = []) :
    let continuation := RootResetEmptyHandoffContext.exitTerm program layout horizon remaining bits
    let carrier := SchedulerCycle.deletedCarrier bit outerContext innerContext
    let dispatch := SchedulerResponse.completedRoute program layout
      (SchedulerCycle.scannedRegisters registers bit suffix) bit carrier
    Executes (RootResetFreshResponsePass.worker program layout.tree)
      (Cursor.atRoot (Cursor.rebuild parents (wrap (compileActions program layout.tree) layers
        (LocalResponse.completed bits continuation carrier dispatch)))) true
      (commitCursor bits continuation carrier dispatch
        (parentsAfter (compileActions program layout.tree) layers parents)) := by
  dsimp only
  rcases List.eq_nil_or_concat layers with rfl | ⟨layers, layer, equal⟩
  · have facts := RootResetGeneratedFreshResponseExecution.selectedResponseTrace_accumulator_facts trace normal
    dsimp only at facts
    rw [output] at facts
    have parsed := RootResetTraversableCompletedParents.TraversableParents.parseLocal?_fresh program layout
      (SchedulerCycle.scannedRegisters registers bit suffix) bit bits
      (RootResetEmptyHandoffContext.exitTerm program layout horizon remaining bits)
      (SchedulerCycle.deletedCarrier bit outerContext innerContext)
    obtain ⟨endpoint, followed, actual⟩ :=
      RootResetGeneratedFreshResponseExecution.nonpending_parsed_commit outer _ _ parsed rfl
        horizon remaining bits rfl facts.1
    have literal := (commit_follow bits
      (RootResetEmptyHandoffContext.exitTerm program layout horizon remaining bits)
      (SchedulerCycle.deletedCarrier bit outerContext innerContext)
      (SchedulerResponse.completedRoute program layout
        (SchedulerCycle.scannedRegisters registers bit suffix) bit
        (SchedulerCycle.deletedCarrier bit outerContext innerContext)) parents).symm.trans followed
    have endpointEq := Option.some.inj literal
    rw [← endpointEq] at actual
    exact actual
  · rw [equal, List.concat_eq_append]
    rcases layer with ⟨payload, next⟩
    obtain ⟨endpoint, followed, actual, _⟩ :=
      RootResetGeneratedFreshResponseExecution.selected_response_pending_commit
        outer layers payload next horizon remaining bits trace normal output
    have literal := (commit_follow bits
      (RootResetEmptyHandoffContext.exitTerm program layout horizon remaining bits)
      (SchedulerCycle.deletedCarrier bit outerContext innerContext)
      (SchedulerResponse.completedRoute program layout
        (SchedulerCycle.scannedRegisters registers bit suffix) bit
        (SchedulerCycle.deletedCarrier bit outerContext innerContext))
      (.right (.app (CheckpointDecoder.openEnvironment (compileActions program layout.tree) payload) next) ::
        parentsAfter (compileActions program layout.tree) layers parents)).symm.trans followed
    have endpointEq := Option.some.inj literal
    rw [← endpointEq] at actual
    rw [RootResetGeneratedFreshResponseExecution.parentsAfter_last]
    exact actual

theorem normal_fresh_root_occurrence
    {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {history : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents history)
    (layers : List Layer) (horizon remaining : Nat) (bits : List Bool)
    {source : Term} {registers : SchedulerControl.Registers program} {bit : Bool} {suffix : List Bool}
    {outerContext fullContext innerContext targetContext : Context}
    {traceParents : List ParentFrame} {ticks count : Nat}
    (trace : SchedulerCycle.SelectedResponseTrace program layout bits
      (RootResetEmptyHandoffContext.exitTerm program layout horizon remaining bits) source
      (Dovetail.clockExit_admissible ..) registers bit suffix
      outerContext fullContext innerContext targetContext traceParents ticks)
    (normal : RootResetOrderedCarrier.NormalInvariant program layout.tree bits
      (RootResetEmptyHandoffContext.exitTerm program layout horizon remaining bits)
      source registers.phase (bit :: suffix) count)
    (output : (CTS.absorbingStep program ⟨registers.phase, bit :: suffix⟩).data = []) :
    let continuation := RootResetEmptyHandoffContext.exitTerm program layout horizon remaining bits
    let carrier := SchedulerCycle.deletedCarrier bit outerContext innerContext
    let dispatch := SchedulerResponse.completedRoute program layout
      (SchedulerCycle.scannedRegisters registers bit suffix) bit carrier
    let whole := Cursor.rebuild parents (wrap (compileActions program layout.tree) layers
      (LocalResponse.completed bits continuation carrier dispatch))
    let endpoint := commitCursor bits continuation carrier dispatch
      (parentsAfter (compileActions program layout.tree) layers parents)
    SelectsCursor program layout whole endpoint ∧
      performsMarkH? program layout (contractConfiguration program layout endpoint) = true := by
  dsimp only
  exact ⟨fresh_pass_selects_cursor program layout _ _
    (normal_fresh_pass outer layers horizon remaining bits trace normal output),
    contract_performs program layout _ _⟩

end PureSFormal.Research.RootResetRegisteredMarkerOccurrence
