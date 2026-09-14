import PureSFormal.Research.PureSContractionOccurrenceInjectivity
import PureSFormal.Research.RootResetMarkerTrajectoryCompleteness

namespace PureSFormal.Research.RootResetMarkerPhysicalSoundness
open PureSFormal.PureS
open FiniteController RootResetFiniteMarkerObserver

theorem mutation_rdx_cursor {Control : Type} (machine : Machine Control)
    (configuration : Configuration Control)
    (mutates : mutationCount machine configuration = 1) :
    configuration.cursor.rdx? = some (step machine configuration).cursor := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => cases mutates
  | some state =>
    cases command : machine.transition state (Probe.observeNode cursor) (Probe.observeIncoming cursor) with
    | stay next => simp only [mutationCount, command] at mutates; cases mutates
    | reject => simp only [mutationCount, command] at mutates; cases mutates
    | exec primitive next =>
      cases primitive <;> try (simp only [mutationCount, command] at mutates; cases mutates)
      cases contracted : cursor.rdx? with
      | none => simp only [mutationCount, command, contracted] at mutates; cases mutates
      | some after => simp only [step, command, Primitive.exec, contracted]

theorem sampled_pre_mutation {Control : Type} {machine : Machine Control}
    (system : ProductiveSystem machine) (index : Nat) :
    ∃ lag, runMutationCount machine lag (system.contractionRun index) = 0 ∧
      mutationCount machine (run machine lag (system.contractionRun index)) = 1 ∧
      step machine (run machine lag (system.contractionRun index)) = system.contractionRun (index + 1) := by
  obtain ⟨after, found⟩ := system.finds (system.contractionRun index) (system.contractionRun_good index)
  have nextEq : system.next (system.contractionRun index) = after :=
    advance_eq_of_seekMutation machine system.bound found
  obtain ⟨ticks, _, reached, count, first⟩ := seekMutation_exact_run machine found
  cases ticks with
  | zero => cases count
  | succ lag =>
    have silent := first lag (Nat.lt_succ_self lag)
    rw [runMutationCount_succ_last, silent, Nat.zero_add] at count
    rw [run_succ_last] at reached
    exact ⟨lag, silent, count, reached.trans (by rw [ProductiveSystem.contractionRun_succ, nextEq])⟩

/-- This is physical soundness: the observer-accepted occurrence is the
literal focus of the next successful scheduler contraction. Finite-control
registration of that focus is outside this physical-soundness theorem. -/
theorem accepted_sample_native_fresh_focus
    (program : CTS.Program) (layout : ActionDispatcher program) (bits : List Bool) (index : Nat)
    (accepted : accepts? program layout
      ((SchedulerInvariant.SampledGood.productiveSystem program layout bits
        (SchedulerBound.bound program layout) (SchedulerControl.initialConfiguration program layout bits)
        (SchedulerRecurrence.initialGood program layout bits)).contractionRun index).cursor.erase = true) :
    ∃ ticks, mutationCount (SchedulerControl.machine program layout)
      (run (SchedulerControl.machine program layout) ticks (SchedulerControl.initialConfiguration program layout bits)) = 1 ∧
      (TermEvent.freshHaltPayload?
        (run (SchedulerControl.machine program layout) ticks
          (SchedulerControl.initialConfiguration program layout bits)).cursor.focus).isSome = true := by
  let system := SchedulerInvariant.SampledGood.productiveSystem program layout bits
    (SchedulerBound.bound program layout) (SchedulerControl.initialConfiguration program layout bits)
    (SchedulerRecurrence.initialGood program layout bits)
  obtain ⟨endpoint, ⟨queryTicks, state, actual, answer⟩, marker⟩ :=
    (accepts_iff program layout (system.contractionRun index).cursor.erase).1 accepted
  have preserved := (selectionWorker program layout).erase_run
    (RootResetFinitePrioritySelector.selectionSpec program layout).mutation_zero queryTicks
    ((selectionWorker program layout).initial (Cursor.atRoot (system.contractionRun index).cursor.erase))
  rw [actual] at preserved
  change endpoint.erase = (system.contractionRun index).cursor.erase at preserved
  obtain ⟨payload, shape⟩ := (RegisteredMarkerBridge.freshHaltPayload_isSome_iff endpoint.focus).1 marker
  let rootAfter : Cursor := ⟨Carrier.markedHField payload payload, endpoint.parents⟩
  have rootRdx : endpoint.rdx? = some rootAfter := by
    rcases endpoint with ⟨focus, parents⟩
    change focus = freshHField payload at shape
    change (⟨focus, parents⟩ : Cursor).rdx? = some ⟨Carrier.markedHField payload payload, parents⟩
    rw [shape]
    rfl
  have rootSelected := RootResetFinitePrioritySelector.selected_step program layout
    (system.contractionRun index).cursor.erase queryTicks state endpoint rootAfter actual answer rootRdx
  have schedulerSelected := RootResetFiniteAllInputsTraceAgreement.selectsEveryContractionRun program layout bits index
  have sameTarget : rootAfter.erase = (system.contractionRun (index + 1)).cursor.erase :=
    Option.some.inj (rootSelected.symm.trans schedulerSelected)
  obtain ⟨lag, silent, mutates, next⟩ := sampled_pre_mutation system index
  let before := run (SchedulerControl.machine program layout) lag (system.contractionRun index)
  have persistentRdx : before.cursor.rdx? = some (system.contractionRun (index + 1)).cursor := by
    have contracted := mutation_rdx_cursor (SchedulerControl.machine program layout) before mutates
    rw [next] at contracted
    exact contracted
  have persistentSource : before.cursor.erase = (system.contractionRun index).cursor.erase := by
    have projected := run_projects_stepsN (SchedulerControl.machine program layout) lag (system.contractionRun index)
    rw [silent] at projected
    exact (StepsN.eq_of_zero projected).symm
  have sameOccurrence := PureSContractionOccurrenceInjectivity.same_source_target_occurrence
    endpoint before.cursor rootAfter (system.contractionRun (index + 1)).cursor
    (preserved.trans persistentSource.symm) rootRdx persistentRdx sameTarget
  obtain ⟨prefixTicks, reaches⟩ := system.contractionRun_reachable index
  change run (SchedulerControl.machine program layout) prefixTicks
    (SchedulerControl.initialConfiguration program layout bits) = system.contractionRun index at reaches
  refine ⟨prefixTicks + lag, ?_, ?_⟩
  · rw [run_add, reaches]
    exact mutates
  · rw [run_add, reaches]
    change (TermEvent.freshHaltPayload? before.cursor.focus).isSome = true
    rw [← sameOccurrence.2]
    exact marker

end PureSFormal.Research.RootResetMarkerPhysicalSoundness
