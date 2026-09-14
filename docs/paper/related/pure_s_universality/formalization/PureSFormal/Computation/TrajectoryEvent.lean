import PureSFormal.Computation.Enumerable

/-!
# Nat-machine-complete events on executable trajectories
-/

namespace PureSFormal.Computation

/-- Total iteration of an executable deterministic transition. -/
def iterateState (step : State → State) : Nat → State → State
  | 0, state => state
  | ticks + 1, state => step (iterateState step ticks state)

/-- A Boolean-observable event occurs at some finite trajectory index. -/
def Eventually
    (step : State → State) (observes : State → Bool) (initial : State) : Prop :=
  ∃ ticks, observes (iterateState step ticks initial) = true

/-- Every executable Boolean trajectory event has a bounded semidecider. -/
theorem eventually_semidecidable
    (step : State → State) (observes : State → Bool) :
    BoundedlySemidecidable (Eventually step observes) := by
  exact ⟨fun initial ticks => observes (iterateState step ticks initial),
    fun _ => Iff.rfl⟩

/--
An exact executable encoding of a complete source event transfers
`NatMachine`-relative completeness to a trajectory event.
-/
theorem eventually_complete_of_source
    {Input State : Type}
    {source : Input → Prop}
    (sourceComplete : NatMachineComplete source)
    (step : State → State) (observes : State → Bool)
    (encode : Input → State)
    (correct : ∀ input,
      source input ↔ Eventually step observes (encode input)) :
    NatMachineComplete (Eventually step observes) := by
  apply complete_of_complete_reduces sourceComplete
  · exact ⟨encode, correct⟩
  · exact eventually_semidecidable step observes

end PureSFormal.Computation
