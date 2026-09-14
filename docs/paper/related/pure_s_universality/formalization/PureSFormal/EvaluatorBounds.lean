import PureSFormal.WeakPathUniversality
import PureSFormal.PureS.MutationFreePeriodicity

/-!
# Explicit boundaries for the persistent-cursor evaluator

This module packages three operational facts already implicit in the
finite-controller construction.  Along the realized trajectory, the next
contraction is found within a program-dependent linear bound in the current
bare-term size.  On an arbitrary controller configuration, the same bounded
search either returns the first contraction or proves that no amount of
search fuel can return one.  If contractions are disabled on a run, the
complete finite-control/cursor configuration is eventually periodic within
the explicit finite-state/occurrence bound.
-/

namespace PureSFormal.EvaluatorBounds

open PureSFormal.PureS

/-! ## Removing the sole mutating instruction -/

/-- Replace every `Rdx` command by rejection, leaving the state cover and all
cursor-only transition rows unchanged. -/
def withoutContraction
    (machine : FiniteController.Machine Control) :
    FiniteController.Machine Control where
  stateCover := machine.stateCover
  covers := machine.covers
  transition := fun control node incoming =>
    match machine.transition control node incoming with
    | .exec .Rdx _ => .reject
    | command => command

/-- The contraction-suppressed machine has zero mutations at every state. -/
theorem withoutContraction_mutationCount_zero
    (machine : FiniteController.Machine Control)
    (configuration : FiniteController.Configuration Control) :
    FiniteController.mutationCount (withoutContraction machine) configuration =
      0 := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => rfl
  | some control =>
      generalize hcommand : machine.transition control
        (Probe.observeNode cursor) (Probe.observeIncoming cursor) = command
      cases command with
      | stay next => simp [FiniteController.mutationCount,
          withoutContraction, hcommand]
      | reject => simp [FiniteController.mutationCount,
          withoutContraction, hcommand]
      | exec primitive next =>
          cases primitive <;> simp [FiniteController.mutationCount,
            withoutContraction, hcommand]

/--
With `Rdx` disabled, every finite one-cursor controller is eventually
periodic.  The preperiod plus period is at most its runtime-state count times
the number of occurrences in the unchanged bare term.
-/
theorem withoutContraction_run_eventuallyPeriodic
    [DecidableEq Control]
    (machine : FiniteController.Machine Control)
    (initial : FiniteController.Configuration Control) :
    exists preperiod period,
      0 < period /\
      preperiod + period <=
        (FiniteController.runtimeStates machine).length *
          initial.cursor.erase.size /\
      forall offset,
        FiniteController.run (withoutContraction machine)
            (preperiod + offset) initial =
          FiniteController.run (withoutContraction machine)
            (preperiod + period + offset) initial := by
  obtain ⟨preperiod, period, positive, bounded, repeats⟩ :=
    FiniteController.eventually_periodic_of_mutation_free
      (withoutContraction machine) initial
      (fun ticks => withoutContraction_mutationCount_zero machine
        (FiniteController.run (withoutContraction machine) ticks initial))
  refine ⟨preperiod, period, positive, ?_, repeats⟩
  rw [FiniteController.stateBound_eq] at bounded
  exact bounded

abbrev Dispatcher (program : CTS.Program) : ActionDispatcher program :=
  WeakPathUniversality.canonicalDispatcher program

abbrev Control (program : CTS.Program) :=
  SchedulerControl.Control program (Dispatcher program)

abbrev Machine (program : CTS.Program) :=
  SchedulerControl.machine program (Dispatcher program)

/-- The productive system used by the public exact-trajectory realization. -/
def finiteCTSSystem (program : CTS.Program) (bits : List Bool) :
    FiniteController.ProductiveSystem (Machine program) :=
  (WeakPathUniversality.finiteCTSUniformCertificate program).certificate
    bits |>.system

/--
At every contraction sample of the realized run, bounded search returns the
actual next sample within `q_P * |T|` microticks.  Here `q_P` is the published
runtime-state-list length of the scheduler fixed by `program`.
-/
theorem selectNext_on_run_halts_within
    (program : CTS.Program) (bits : List Bool) (index : Nat) :
    let system := finiteCTSSystem program bits
    let before := system.contractionRun index
    let qP := (FiniteController.runtimeStates (Machine program)).length
    let linearFuel := qP * before.cursor.erase.size
    exists after,
      FiniteController.seekMutation (Machine program) linearFuel before =
          some after /\
        FiniteController.seekMutationDelay (Machine program) linearFuel before
          <= linearFuel := by
  dsimp only
  let system := finiteCTSSystem program bits
  have good := system.contractionRun_good index
  obtain ⟨after, found⟩ := system.finds (system.contractionRun index) good
  have bounded :=
    WeakPathUniversality.finiteCTSNextContractionMicroticks_le_linear
      program found
  exact ⟨after, bounded.1, bounded.2⟩

/--
The scheduler makes a total bounded decision on every arbitrary runtime
configuration: either its uniform finite-state/occurrence search finds a
contraction, or no larger fuel can find one.
-/
theorem selectNext_total_decision
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (before : SchedulerBound.Configuration program dispatcher) :
    (exists after,
      FiniteController.seekMutation
          (SchedulerControl.machine program dispatcher)
          (SchedulerBound.bound program dispatcher before) before =
        some after) \/
      (forall fuel,
        FiniteController.seekMutation
            (SchedulerControl.machine program dispatcher) fuel before = none) := by
  cases boundedResult : FiniteController.seekMutation
      (SchedulerControl.machine program dispatcher)
      (SchedulerBound.bound program dispatcher before) before with
  | none =>
      right
      intro fuel
      cases fuelResult : FiniteController.seekMutation
          (SchedulerControl.machine program dispatcher) fuel before with
      | none => rfl
      | some after =>
          have foundAtBound := SchedulerBound.seekMutation_bound
            program dispatcher fuelResult
          rw [boundedResult] at foundAtBound
          contradiction
  | some after =>
      left
      exact ⟨after, rfl⟩

/--
With every contraction command operationally disabled on a run, the fixed
scheduler is eventually periodic as a complete control-and-cursor machine.
Both the preperiod and period lie within `q_P * |T|`.
-/
theorem mutationFree_run_eventuallyPeriodic
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (initial : SchedulerBound.Configuration program dispatcher)
    (mutationFree : forall ticks,
      FiniteController.mutationCount
          (SchedulerControl.machine program dispatcher)
          (FiniteController.run
            (SchedulerControl.machine program dispatcher) ticks initial) = 0) :
    exists preperiod period,
      0 < period /\
      preperiod + period <= SchedulerBound.bound program dispatcher initial /\
      forall offset,
        FiniteController.run (SchedulerControl.machine program dispatcher)
            (preperiod + offset) initial =
          FiniteController.run (SchedulerControl.machine program dispatcher)
            (preperiod + period + offset) initial := by
  exact FiniteController.eventually_periodic_of_mutation_free
    (SchedulerControl.machine program dispatcher) initial mutationFree

/-- The periodicity bound is literally runtime-state count times term size. -/
theorem mutationFree_periodicityBound_eq_linear
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (initial : SchedulerBound.Configuration program dispatcher) :
    SchedulerBound.bound program dispatcher initial =
      (FiniteController.runtimeStates
        (SchedulerControl.machine program dispatcher)).length *
        initial.cursor.erase.size :=
  SchedulerBound.bound_eq program dispatcher initial

end PureSFormal.EvaluatorBounds
