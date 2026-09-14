import PureSFormal.PureS.SchedulerInvariant
import PureSFormal.PureS.SchedulerBound

/-!
# From structural finite traces to uniform scheduler productivity

The scheduler proof naturally constructs each next contraction with an exact
phase-local microtick count.  This module separates that semantic obligation
from the global executable bound: existentially fuelled finite chains are
converted edge-by-edge to `CanAdvance` using the finite-state bound theorem.
-/

namespace PureSFormal.PureS

namespace SchedulerProductivity

open FiniteController SchedulerControl SchedulerInvariant

abbrev Configuration (program : CTS.Program)
    (dispatcher : ActionDispatcher program) :=
  SchedulerInvariant.Configuration program dispatcher

/--
An arbitrary finite chain of contraction samples.  Each edge carries some
explicit finite search fuel, but the fuel need not be uniform or computed
from the source configuration.
-/
def ExistentialAdvance
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    Nat → Nat → Configuration program dispatcher → Prop
  | _, 0, _ => True
  | sampleIndex, remaining + 1, configuration =>
      ∃ fuel after,
        FiniteController.seekMutation
            (SchedulerControl.machine program dispatcher)
            fuel configuration = some after ∧
          SampledState program dispatcher bits (sampleIndex + 1) after ∧
          ExistentialAdvance program dispatcher bits (sampleIndex + 1)
            remaining after

/-- Normalize every existential edge to the one configuration-only bound. -/
theorem existentialAdvance_to_canAdvance
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    ∀ sampleIndex remaining configuration,
      ExistentialAdvance program dispatcher bits sampleIndex remaining
          configuration →
        CanAdvance program dispatcher bits
          (SchedulerBound.bound program dispatcher)
          sampleIndex remaining configuration
  | _, 0, _, _ => trivial
  | sampleIndex, remaining + 1, configuration, chain => by
      rcases chain with ⟨fuel, after, found, sampled, tail⟩
      exact ⟨after,
        SchedulerBound.seekMutation_bound program dispatcher found,
        sampled,
        existentialAdvance_to_canAdvance program dispatcher bits
          (sampleIndex + 1) remaining after tail⟩

/-- Full sampled invariant stated with phase-local existential search fuels. -/
structure ExistentialGood
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (sampleIndex : Nat)
    (configuration : Configuration program dispatcher) : Prop where
  current : SampledState program dispatcher bits sampleIndex configuration
  future : ∀ remaining,
    ExistentialAdvance program dispatcher bits sampleIndex remaining
      configuration

/-- Package a structural all-future trace as the productive sampled invariant. -/
theorem ExistentialGood.toSampledGood
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {bits : List Bool} {sampleIndex : Nat}
    {configuration : Configuration program dispatcher}
    (good : ExistentialGood program dispatcher bits sampleIndex configuration) :
    SampledGood program dispatcher bits sampleIndex
      (SchedulerBound.bound program dispatcher) configuration := by
  refine ⟨good.current, ?_⟩
  intro remaining
  exact existentialAdvance_to_canAdvance program dispatcher bits sampleIndex
    remaining configuration (good.future remaining)

end SchedulerProductivity

end PureSFormal.PureS
