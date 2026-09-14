import PureSFormal.PureS.RegisteredMarkerCompleteness

namespace PureSFormal.PureS.RegisteredMarkerBridge
open FiniteController SchedulerControl

/-- A successful raw contraction ends at the next literal sampled configuration,
including finite control and cursor location, not merely the erased term. -/
theorem step_eq_sample_of_mutation
    {Control : Type} {machine : Machine Control}
    (system : ProductiveSystem machine) (ticks : Nat)
    (mutation : mutationCount machine (run machine ticks system.initial) = 1) :
    step machine (run machine ticks system.initial) =
      system.contractionRun (runMutationCount machine ticks system.initial + 1) := by
  let index := runMutationCount machine ticks system.initial
  obtain ⟨lag, configurationEq, silent⟩ := system.run_countedBetweenSamples ticks
  obtain ⟨after, found⟩ := system.finds
    (system.contractionRun index) (system.contractionRun_good index)
  obtain ⟨segmentTicks, _, segmentRun, segmentCount, segmentFirst⟩ :=
    seekMutation_exact_run machine found
  have candidateRun : run machine (lag + 1) (system.contractionRun index) =
      step machine (run machine ticks system.initial) := by
    rw [run_succ_last, ← configurationEq]
  have candidateCount :
      runMutationCount machine (lag + 1) (system.contractionRun index) = 1 := by
    rw [runMutationCount_succ_last, ← configurationEq, silent, mutation]
  have candidateFirst : ∀ earlier, earlier < lag + 1 →
      runMutationCount machine earlier (system.contractionRun index) = 0 := by
    intro earlier less
    exact runMutationCount_prefix_zero machine (system.contractionRun index)
      (Nat.le_of_lt_succ less) silent
  have ticksEq : segmentTicks = lag + 1 := by
    rcases Nat.lt_trichotomy segmentTicks (lag + 1) with less | equal | greater
    · have zero := candidateFirst segmentTicks less
      exact False.elim (Nat.zero_ne_one (zero.symm.trans segmentCount))
    · exact equal
    · have zero := segmentFirst (lag + 1) greater
      exact False.elim (Nat.zero_ne_one (zero.symm.trans candidateCount))
  have afterEq : after = step machine (run machine ticks system.initial) := by
    rw [← segmentRun, ticksEq, candidateRun]
  have nextEq : system.next (system.contractionRun index) = after :=
    advance_eq_of_seekMutation machine system.bound found
  change step machine (run machine ticks system.initial) =
    system.contractionRun (index + 1)
  rw [ProductiveSystem.contractionRun_succ, nextEq, afterEq]

/-- No registered event occurs within a mutation-free prefix. -/
theorem noEvent_before_zeroMutationRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (configuration : SchedulerInvariant.Configuration program dispatcher)
    (ticks : Nat) (silent : runMutationCount (machine program dispatcher) ticks configuration = 0)
    (earlier : Nat) (less : earlier < ticks) :
    TermEvent.performsRegisteredMarkH? program dispatcher
      (run (machine program dispatcher) earlier configuration) = false := by
  cases occurs : TermEvent.performsRegisteredMarkH? program dispatcher
      (run (machine program dispatcher) earlier configuration) with
  | false => rfl
  | true =>
      have count := performs_mutationCount program dispatcher _ occurs
      have prefixZero := runMutationCount_prefix_zero (machine program dispatcher)
        configuration (Nat.succ_le_of_lt less) silent
      rw [runMutationCount_succ_last, count] at prefixZero
      exact False.elim (Nat.noConfusion prefixZero)

/-- The registered event is tied to the very next sampled configuration at
its exact mutation index. This preserves event identity across resampling. -/
theorem registeredEvent_post_is_countedSample
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (system : ProductiveSystem (machine program dispatcher)) (ticks : Nat)
    (occurs : TermEvent.performsRegisteredMarkH? program dispatcher
      (run (machine program dispatcher) ticks system.initial) = true) :
    ∃ registers payload parents,
      system.contractionRun
          (runMutationCount (machine program dispatcher) ticks system.initial + 1) =
          step (machine program dispatcher)
            (normalEventConfiguration program dispatcher registers payload parents) ∨
      system.contractionRun
          (runMutationCount (machine program dispatcher) ticks system.initial + 1) =
          step (machine program dispatcher)
            (emptyEventConfiguration program dispatcher registers payload parents) := by
  have exactSample := step_eq_sample_of_mutation system ticks
    (performs_mutationCount program dispatcher _ occurs)
  obtain ⟨registers, payload, parents, shape | shape⟩ :=
    (performs_iff_configuration program dispatcher _).1 occurs
  · exact ⟨registers, payload, parents, Or.inl (by rw [shape] at exactSample; exact exactSample.symm)⟩
  · exact ⟨registers, payload, parents, Or.inr (by rw [shape] at exactSample; exact exactSample.symm)⟩

end PureSFormal.PureS.RegisteredMarkerBridge
