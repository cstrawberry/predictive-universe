import PureSFormal.Computation.CounterMachineTag
import PureSFormal.Computation.RogozhinT2Cook
import PureSFormal.Computation.SigmaOneEvent

/-!
# Conventional two-counter acceptance at the fixed Cook endpoint

The constructive source compiler, the generic deletion-two normalizer, the
literal restricted-`T2` interpretation by Rogozhin's fixed machine, and Cook's
fixed period-912 cyclic tag system compose without a simulation premise.
-/

namespace PureSFormal.Computation

namespace CounterMachineCook

/-- The literal bit word supplied to the fixed period-912 Cook system. -/
def encodeBits (job : CounterMachine.UniversalInput) : List Bool :=
  RogozhinT2Cook.encodeBits
    (CounterMachineTag.Numeric.compileUniversalInput job)

/-- Eventual emptiness for the literal fixed period-912 Cook program. -/
def EventuallyEmpty (bits : List Bool) : Prop :=
  ∃ horizon,
    (CTS.iterate Cook.rogozhinCookProgram horizon
      (CTS.initial Cook.rogozhinCookProgram bits)).data = []

/-- The fixed Cook emptiness event has a direct bounded semidecider. -/
theorem eventuallyEmpty_semidecidable :
    BoundedlySemidecidable EventuallyEmpty := by
  refine ⟨fun bits horizon =>
    (CTS.iterate Cook.rogozhinCookProgram horizon
      (CTS.initial Cook.rogozhinCookProgram bits)).data.isEmpty, ?_⟩
  intro bits
  constructor
  · rintro ⟨horizon, empty⟩
    refine ⟨horizon, ?_⟩
    exact List.isEmpty_iff.mpr empty
  · rintro ⟨horizon, empty⟩
    exact ⟨horizon, List.isEmpty_iff.mp empty⟩

/-- Conventional universal two-counter acceptance is exactly eventual
emptiness of the literal fixed period-912 Cook cyclic tag system. -/
theorem universalAccepts_iff_fixedCookEmpty
    (job : CounterMachine.UniversalInput) :
    CounterMachine.UniversalAccepts job ↔
      EventuallyEmpty (encodeBits job) := by
  exact
    (CounterMachineTag.Numeric.universalAccepts_iff_compileUniversalInput
      job).trans
      (RogozhinT2Cook.eventuallyHalts_iff_fixedCookEmpty
        (CounterMachineTag.Numeric.compileUniversalInput job)
        (CounterMachineTag.Numeric.compileT2_wellFormed
          job.program job.input))

/-- Eventual emptiness of the literal fixed Cook system is complete for the
exponentially initialized two-counter bounded-run interface. -/
theorem eventuallyEmpty_sigmaOneComplete :
    BoundedSigmaOne.Complete EventuallyEmpty := by
  exact boundedSigmaOne_complete_of_counterUniversal EventuallyEmpty
    eventuallyEmpty_semidecidable encodeBits
    universalAccepts_iff_fixedCookEmpty

end CounterMachineCook

end PureSFormal.Computation
