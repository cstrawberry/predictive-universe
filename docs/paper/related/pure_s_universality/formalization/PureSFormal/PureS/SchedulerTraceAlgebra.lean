import PureSFormal.PureS.SchedulerNestedPhase

/-!
# Finite sampled-trace algebra

The construction-facing stage recurrence produces complete finite mutation
segments.  Productivity may ask for a shorter prefix of the last segment.
This module records the constructive prefix operation once, without changing
the exact configurations or their global sample indices.
-/

namespace PureSFormal.PureS

namespace SchedulerTraceAlgebra

open SchedulerInvariant SchedulerProductivity

/-- An existentially fuelled sampled trace remains valid when truncated to a
shorter requested length. -/
theorem ExistentialAdvance.prefix
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    ∀ {sampleIndex available requested configuration},
      requested ≤ available →
      ExistentialAdvance program dispatcher bits sampleIndex available
          configuration →
        ExistentialAdvance program dispatcher bits sampleIndex requested
          configuration := by
  intro sampleIndex available requested configuration bound advance
  induction requested generalizing sampleIndex available configuration with
  | zero => trivial
  | succ requested ih =>
      cases available with
      | zero => exact False.elim (Nat.not_succ_le_zero _ bound)
      | succ available =>
          rcases advance with ⟨fuel, after, found, sampled, tail⟩
          have tailBound : requested ≤ available := Nat.succ_le_succ_iff.mp bound
          exact ⟨fuel, after, found, sampled, ih tailBound tail⟩

/-- An exact indexed mutation segment supplies every requested prefix no
longer than its literal sample list. -/
theorem ExactMutationChain.toExistentialAdvancePrefix
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (sampleIndex requested : Nat)
    {terminal before : SchedulerInvariant.Configuration program dispatcher}
    {configurations : List
      (SchedulerInvariant.Configuration program dispatcher)}
    (chain : SchedulerResponseInvariant.ExactMutationChain
      (SchedulerControl.machine program dispatcher) terminal before
      configurations)
    (sampled : SchedulerCycle.IndexedResponseSampledStates program dispatcher
      bits sampleIndex configurations)
    (bound : requested ≤ configurations.length) :
    ExistentialAdvance program dispatcher bits sampleIndex requested before :=
  ExistentialAdvance.prefix program dispatcher bits bound
    (SchedulerCycle.ExactMutationChain.toExistentialAdvance program dispatcher
      bits sampleIndex chain sampled)

/-- Forgetting finite control and cursor motion from an exact mutation chain
leaves an exact pure-S reduction with one step per listed sample. -/
theorem ExactMutationChain.toStepsN
    {Control : Type} {machine : FiniteController.Machine Control}
    {terminal before : FiniteController.Configuration Control}
    {configurations : List (FiniteController.Configuration Control)}
    (chain : SchedulerResponseInvariant.ExactMutationChain machine terminal
      before configurations) :
    StepsN configurations.length before.cursor.erase terminal.cursor.erase := by
  induction chain with
  | @done before ticks suffix =>
      have projected := FiniteController.run_projects_stepsN machine ticks before
      rw [suffix.count_eq, suffix.run_eq] at projected
      exact projected
  | @next before sample samples searchTicks found tail ih =>
      have first : StepsN 1 before.cursor.erase sample.cursor.erase :=
        StepsN.single (FiniteController.seekMutation_sound machine found)
      have combined := StepsN.trans first ih
      simpa [Nat.add_comm] using combined

/-- Constructive evidence naming the final element of a nonempty list. -/
inductive LastSample {Alpha : Type} : List Alpha → Alpha → Prop where
  | one (sample : Alpha) : LastSample [sample] sample
  | cons (head : Alpha) {tail : List Alpha} {last : Alpha}
      (rest : LastSample tail last) : LastSample (head :: tail) last

namespace LastSample

@[simp]
theorem length_positive {Alpha : Type} {samples : List Alpha} {last : Alpha}
    (final : LastSample samples last) : 0 < samples.length := by
  cases final with
  | one => exact Nat.zero_lt_succ 0
  | cons head rest => exact Nat.zero_lt_succ _

/-- Prepending an arbitrary finite segment does not change the named last
sample of a nonempty suffix. -/
theorem appendLeft {Alpha : Type} (leading : List Alpha)
    {samples : List Alpha} {last : Alpha}
    (final : LastSample samples last) :
    LastSample (leading ++ samples) last := by
  induction leading with
  | nil => simpa using final
  | cons head tail ih => exact .cons head ih

end LastSample

/-- The cursor-only suffix after the final listed mutation preserves the bare
term, so the named last sample and the chain endpoint erase identically. -/
theorem ExactMutationChain.last_erase_terminal
    {Control : Type} {machine : FiniteController.Machine Control}
    {terminal before last : FiniteController.Configuration Control}
    {configurations : List (FiniteController.Configuration Control)}
    (chain : SchedulerResponseInvariant.ExactMutationChain machine terminal
      before configurations)
    (final : LastSample configurations last) :
    last.cursor.erase = terminal.cursor.erase := by
  induction chain with
  | done ticks suffix => cases final
  | @next before sample samples searchTicks found tail ih =>
      cases final with
      | one =>
          cases tail with
          | done suffixTicks zeroSuffix =>
              have projected :=
                FiniteController.run_projects_stepsN machine suffixTicks last
              rw [zeroSuffix.count_eq, zeroSuffix.run_eq] at projected
              exact StepsN.eq_of_zero projected
      | cons head rest => exact ih rest

/-- An exact chain fixes the executable contraction run at its named final
sample.  The chain's mutation-free terminal suffix is intentionally absent
from the sample count; it is absorbed by the next appended segment. -/
theorem ExactMutationChain.contractionRun_eq_last
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool)
    (initialGood : SampledGood program dispatcher bits 0
      (SchedulerBound.bound program dispatcher)
      (SchedulerControl.initialConfiguration program dispatcher bits)) :
    let system := SchedulerInvariant.SampledGood.productiveSystem program
      dispatcher bits
      (SchedulerBound.bound program dispatcher)
      (SchedulerControl.initialConfiguration program dispatcher bits)
      initialGood
    ∀ {terminal before configurations last sampleIndex},
      SchedulerResponseInvariant.ExactMutationChain
          (SchedulerControl.machine program dispatcher) terminal before
          configurations →
        LastSample configurations last →
        system.contractionRun sampleIndex = before →
        system.contractionRun (sampleIndex + configurations.length) = last := by
  dsimp only
  intro terminal before configurations last sampleIndex chain final beforeEq
  revert last sampleIndex
  induction chain with
  | done ticks suffix =>
      intro last sampleIndex final beforeEq
      cases final
  | @next before sample samples searchTicks found tail ih =>
      intro last sampleIndex final beforeEq
      have boundedFound := SchedulerBound.seekMutation_bound program dispatcher
        found
      have nextEq :
          (SchedulerInvariant.SampledGood.productiveSystem program dispatcher bits
            (SchedulerBound.bound program dispatcher)
            (SchedulerControl.initialConfiguration program dispatcher bits)
            initialGood).next before = sample :=
        FiniteController.advance_eq_of_seekMutation
          (SchedulerControl.machine program dispatcher)
          (SchedulerBound.bound program dispatcher) boundedFound
      have runNext :
          (SchedulerInvariant.SampledGood.productiveSystem program dispatcher bits
            (SchedulerBound.bound program dispatcher)
            (SchedulerControl.initialConfiguration program dispatcher bits)
            initialGood).contractionRun (sampleIndex + 1) = sample := by
        rw [show sampleIndex + 1 = Nat.succ sampleIndex by rfl,
          FiniteController.ProductiveSystem.contractionRun_succ, beforeEq,
          nextEq]
      cases final with
      | one =>
          cases tail with
          | done suffixTicks suffix =>
              simpa using runNext
      | cons head rest =>
          have tailResult := ih rest runNext
          simpa [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using tailResult

end SchedulerTraceAlgebra

end PureSFormal.PureS
