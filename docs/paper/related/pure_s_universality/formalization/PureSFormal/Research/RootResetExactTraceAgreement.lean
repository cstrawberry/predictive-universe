import PureSFormal.PureS.SchedulerTraceAlgebra
import PureSFormal.PureS.SchedulerGlobalRecurrence
import PureSFormal.PureS.SchedulerAllStages
import PureSFormal.PureS.SchedulerStageAssembly

/-!
# Bare-selector agreement along exact scheduler traces

The scheduler recurrence is assembled from `ExactMutationChain` values.  This
module adds the matching proof object for a term-only selector.  The two
objects have the same source and sample list: the scheduler chain proves how
the next contraction is reached, while `SelectorChain` proves that restarting
the selector on the erased source returns the erased sample.

The predicate is deliberately attached to the exact construction trace.  The
coarser `SampledState` invariant also describes unreachable combinations of a
term and register bank and therefore is not, by itself, a sufficient premise
for root-reset agreement.
-/

namespace PureSFormal.Research.RootResetExactTraceAgreement

open PureSFormal.PureS

/-- Pointwise bare-term agreement for the samples in an exact mutation chain. -/
inductive SelectorChain {Control : Type}
    (selector : Term → Option Term) :
    FiniteController.Configuration Control →
      List (FiniteController.Configuration Control) → Prop where
  | done (before : FiniteController.Configuration Control) :
      SelectorChain selector before []
  | next
      {before sample : FiniteController.Configuration Control}
      {samples : List (FiniteController.Configuration Control)}
      (selected : selector before.cursor.erase = some sample.cursor.erase)
      (tail : SelectorChain selector sample samples) :
      SelectorChain selector before (sample :: samples)

namespace SelectorChain

/-- The first link of a nonempty certified chain is the selector equation. -/
theorem head
    {Control : Type} {selector : Term → Option Term}
    {before sample : FiniteController.Configuration Control}
    {samples : List (FiniteController.Configuration Control)}
    (chain : SelectorChain selector before (sample :: samples)) :
    selector before.cursor.erase = some sample.cursor.erase := by
  cases chain with
  | next selected tail => exact selected

/-- A zero-mutation controller segment preserves the erased bare term. -/
theorem erase_eq_of_zeroMutationRun
    {Control : Type} {machine : FiniteController.Machine Control}
    {ticks : Nat}
    {before after : FiniteController.Configuration Control}
    (run : SchedulerInvariant.ZeroMutationRun machine ticks before after) :
    before.cursor.erase = after.cursor.erase := by
  have projected := FiniteController.run_projects_stepsN machine ticks before
  rw [run.count_eq, run.run_eq] at projected
  exact StepsN.eq_of_zero projected

/-- A mutation-free prefix can be absorbed without changing term-only choice. -/
theorem prepend
    {Control : Type} {machine : FiniteController.Machine Control}
    {selector : Term → Option Term} {ticks : Nat}
    {before middle : FiniteController.Configuration Control}
    {samples : List (FiniteController.Configuration Control)}
    (segment : SchedulerInvariant.ZeroMutationRun machine ticks before middle)
    (chain : SelectorChain selector middle samples) :
    SelectorChain selector before samples := by
  cases chain with
  | done middle => exact .done before
  | @next _ sample samples selected tail =>
      exact .next (by
        rw [erase_eq_of_zeroMutationRun segment]
        exact selected) tail

/-- Sequential exact segments preserve the selector certificate. -/
theorem append
    {Control : Type} {machine : FiniteController.Machine Control}
    {selector : Term → Option Term}
    {before middle : FiniteController.Configuration Control}
    {first second : List (FiniteController.Configuration Control)}
    (exact : SchedulerResponseInvariant.ExactMutationChain machine middle before first)
    (left : SelectorChain selector before first)
    (right : SelectorChain selector middle second) :
    SelectorChain selector before (first ++ second) := by
  induction exact with
  | done ticks suffix =>
      cases left
      simpa using prepend suffix right
  | next searchTicks found tail ih =>
      cases left with
      | next selected selectedTail =>
          exact .next selected (ih selectedTail)

/--
The exact controller chain and its selector certificate identify every
successive term of the productive contraction run covered by the chain.
-/
theorem selects_contractionRun
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {selector : Term → Option Term}
    {terminal before : SchedulerInvariant.Configuration program dispatcher}
    {samples : List (SchedulerInvariant.Configuration program dispatcher)}
    (exact : SchedulerResponseInvariant.ExactMutationChain
      (SchedulerControl.machine program dispatcher) terminal before samples)
    (selected : SelectorChain selector before samples)
    {bits : List Bool}
    (initialGood : SchedulerInvariant.SampledGood program dispatcher bits 0
      (SchedulerBound.bound program dispatcher)
      (SchedulerControl.initialConfiguration program dispatcher bits)) :
    let system := SchedulerInvariant.SampledGood.productiveSystem program
      dispatcher bits (SchedulerBound.bound program dispatcher)
      (SchedulerControl.initialConfiguration program dispatcher bits) initialGood
    ∀ {base offset : Nat},
      system.contractionRun base = before →
      offset < samples.length →
      selector (system.contractionRun (base + offset)).cursor.erase =
        some (system.contractionRun (base + offset + 1)).cursor.erase := by
  dsimp only
  let system := SchedulerInvariant.SampledGood.productiveSystem program
    dispatcher bits (SchedulerBound.bound program dispatcher)
    (SchedulerControl.initialConfiguration program dispatcher bits) initialGood
  induction exact with
  | done ticks suffix =>
      intro base offset beforeEq offsetLt
      simp at offsetLt
  | @next before sample samples searchTicks found tail ih =>
      cases selected with
      | next firstSelected selectedTail =>
          intro base offset beforeEq offsetLt
          have boundedFound := SchedulerBound.seekMutation_bound program dispatcher found
          have nextEq : system.next before = sample :=
            FiniteController.advance_eq_of_seekMutation
              (SchedulerControl.machine program dispatcher)
              (SchedulerBound.bound program dispatcher) boundedFound
          cases offset with
          | zero =>
              have runNext : system.contractionRun (base + 1) = sample := by
                rw [show base + 1 = Nat.succ base by rfl,
                  FiniteController.ProductiveSystem.contractionRun_succ,
                  beforeEq, nextEq]
              change selector (system.contractionRun base).cursor.erase =
                some (system.contractionRun (base + 1)).cursor.erase
              rw [beforeEq, runNext]
              exact firstSelected
          | succ offset =>
              have runSample :
                  system.contractionRun (base + 1) = sample := by
                rw [show base + 1 = Nat.succ base by rfl,
                  FiniteController.ProductiveSystem.contractionRun_succ,
                  beforeEq, nextEq]
              have tailLt : offset < samples.length := by
                simpa using offsetLt
              have tailResult := ih selectedTail runSample tailLt
              simpa [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using tailResult

end SelectorChain

/-- A positive-stage prefix together with term-only agreement at every edge. -/
structure CertifiedPositiveStages
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (selector : Term → Option Term) (horizon : Nat) where
  stages : SchedulerRecurrence.PositiveStages program dispatcher bits horizon
  selected : SelectorChain selector
    (SchedulerControl.initialConfiguration program dispatcher bits)
    stages.configurations

/--
Arbitrarily long certified positive prefixes establish selector agreement at
every contraction index of the actual productive scheduler run.
-/
theorem selectsEveryContractionRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (selector : Term → Option Term)
    (certified : ∀ (bits : List Bool) (offset : Nat),
      Nonempty (CertifiedPositiveStages program dispatcher bits selector
        (offset + 1))) :
    ∀ (bits : List Bool) (index : Nat),
      let system := SchedulerInvariant.SampledGood.productiveSystem program
        dispatcher bits (SchedulerBound.bound program dispatcher)
        (SchedulerControl.initialConfiguration program dispatcher bits)
        (SchedulerRecurrence.initialGood program dispatcher bits)
      selector (system.contractionRun index).cursor.erase =
        some (system.contractionRun (index + 1)).cursor.erase := by
  intro bits index
  obtain ⟨certificate⟩ := certified bits index
  let initialGood := SchedulerRecurrence.initialGood program dispatcher bits
  let system := SchedulerInvariant.SampledGood.productiveSystem program
    dispatcher bits (SchedulerBound.bound program dispatcher)
    (SchedulerControl.initialConfiguration program dispatcher bits) initialGood
  have within : index < certificate.stages.configurations.length := by
    have lower := certificate.stages.horizonLower
    exact Nat.lt_of_succ_le (by simpa using lower)
  have selected := SelectorChain.selects_contractionRun
    certificate.stages.chain certificate.selected initialGood
      (base := 0) (offset := index)
    (by rfl) within
  simpa [system, initialGood] using selected

end PureSFormal.Research.RootResetExactTraceAgreement
