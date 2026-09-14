import PureSFormal.PureS.MutationFreePeriodicity

/-! Executable finite-orbit observation, including a bound independent of the
length of a concrete trajectory. The cover need not be duplicate-free. -/
namespace PureSFormal.AppendixF.FiniteOrbit

def iterate (next : State → State) : Nat → State → State
  | 0, state => state
  | n + 1, state => next (iterate next n state)

theorem iterate_add (next : State → State) (m n : Nat) (state : State) :
    iterate next (m + n) state = iterate next n (iterate next m state) := by
  induction n with
  | zero => rfl
  | succ n ih => exact congrArg next ih

theorem every_state_has_bounded_index [DecidableEq State]
    (next : State → State) (cover : List State)
    (covers : ∀ state, state ∈ cover) (initial : State) (n : Nat) :
    ∃ k, k ≤ cover.length ∧ iterate next k initial = iterate next n initial := by
  obtain ⟨i, j, lt, bound, same⟩ :=
    PureS.FiniteController.finite_sequence_repeats
      (fun n => iterate next n initial) cover (fun _ => covers _)
  induction n using Nat.strongRecOn with
  | ind n ih =>
    by_cases small : n ≤ cover.length
    · exact ⟨n, small, rfl⟩
    · have jn : j ≤ n := by omega
      have earlier : i + (n - j) < n := by omega
      obtain ⟨k, kb, ke⟩ := ih (i + (n - j)) earlier
      refine ⟨k, kb, ke.trans ?_⟩
      rw [iterate_add, same, ← iterate_add]
      congr 1
      omega

def acceptsWithin (next : State → State) (accepts : State → Bool)
    (bound : Nat) (initial : State) : Bool :=
  ((List.range (bound + 1)).map (fun n => accepts (iterate next n initial))).any id

theorem acceptsWithin_iff [DecidableEq State]
    (next : State → State) (accepts : State → Bool)
    (cover : List State) (covers : ∀ state, state ∈ cover) (initial : State) :
    acceptsWithin next accepts cover.length initial = true ↔
      ∃ n, accepts (iterate next n initial) = true := by
  simp only [acceptsWithin, List.any_map, List.any_eq_true, List.mem_range,
    Function.comp_apply, id_eq]
  constructor
  · rintro ⟨n, _, yes⟩
    exact ⟨n, yes⟩
  · rintro ⟨n, yes⟩
    obtain ⟨k, bound, same⟩ := every_state_has_bounded_index next cover covers initial n
    exact ⟨k, by omega, same ▸ yes⟩

end PureSFormal.AppendixF.FiniteOrbit
