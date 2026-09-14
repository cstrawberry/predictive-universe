import PureSFormal.AppendixF.CarrierPath

/-! Expansion of any positive native block system into one-contraction samples. -/
namespace PureSFormal.AppendixF.PositiveBlocks
open PureSFormal.PureS
open PureSFormal.AppendixF.Carrier (Trace sample sample_end sample_member)

structure System (Config : Type) where
  term : Config → Term
  terms : Config → List Term
  next : Config → Config
  native : ∀ c, Trace (term c) (terms c) (term (next c))
  positive : ∀ c, 0 < (terms c).length

def System.run (system : System Config) (n : Nat) (c : Config) : Term :=
  if _h : n < (system.terms c).length then sample (system.terms c) (system.term (system.next c)) n
  else system.run (n - (system.terms c).length) (system.next c)
termination_by n
decreasing_by have := system.positive c; omega

theorem System.run_zero (system : System Config) (c : Config) : system.run 0 c = system.term c := by
  rw [System.run, dif_pos (system.positive c)]
  exact (system.native c).sample_zero

theorem System.run_inside (system : System Config) (c : Config) (n : Nat)
    (h : n < (system.terms c).length) :
    system.run n c = sample (system.terms c) (system.term (system.next c)) n := by
  rw [System.run, dif_pos h]

theorem System.run_skip (system : System Config) (c : Config) (n : Nat) :
    system.run ((system.terms c).length + n) c = system.run n (system.next c) := by
  rw [System.run, dif_neg (by omega)]
  simp only [Nat.add_sub_cancel_left]

theorem System.run_step (system : System Config) (c : Config) (n : Nat) :
    Step (system.run n c) (system.run (n + 1) c) := by
  induction n using Nat.strongRecOn generalizing c with
  | ind n ih =>
    by_cases inside : n < (system.terms c).length
    · rw [system.run_inside c n inside]
      by_cases nextInside : n + 1 < (system.terms c).length
      · rw [system.run_inside c (n + 1) nextInside]
        exact (system.native c).sample_step n inside
      · have atEnd : n + 1 = (system.terms c).length := by omega
        have last : system.run (n + 1) c = system.term (system.next c) := by
          rw [atEnd, ← Nat.add_zero (system.terms c).length, system.run_skip, system.run_zero]
        rw [last]
        have edge := (system.native c).sample_step n inside
        simpa only [atEnd, sample_end] using edge
    · have earlier : n - (system.terms c).length < n := by have := system.positive c; omega
      have base : (system.terms c).length + (n - (system.terms c).length) = n := by omega
      rw [← base, system.run_skip]
      rw [show (system.terms c).length + (n - (system.terms c).length) + 1 =
        (system.terms c).length + ((n - (system.terms c).length) + 1) by omega, system.run_skip]
      exact ih (n - (system.terms c).length) earlier (system.next c)

theorem System.run_in_block (system : System Config) (c : Config) (n : Nat) :
    ∃ block, system.run n c ∈ system.terms (FiniteOrbit.iterate system.next block c) := by
  induction n using Nat.strongRecOn generalizing c with
  | ind n ih =>
    by_cases inside : n < (system.terms c).length
    · refine ⟨0, ?_⟩
      rw [system.run_inside c n inside]
      exact sample_member _ _ inside
    · have bound : n - (system.terms c).length < n := by have := system.positive c; omega
      obtain ⟨block, member⟩ := ih (n - (system.terms c).length) bound (system.next c)
      refine ⟨1 + block, ?_⟩
      rw [FiniteOrbit.iterate_add]
      change system.run n c ∈ system.terms (FiniteOrbit.iterate system.next block (system.next c))
      have eq : (system.terms c).length + (n - (system.terms c).length) = n := by omega
      rw [← eq, system.run_skip]
      exact member

theorem System.run_suffix (system : System Config) (c : Config) (block : Nat) :
    ∃ offset, ∀ n, system.run (offset + n) c =
      system.run n (FiniteOrbit.iterate system.next block c) := by
  induction block generalizing c with
  | zero => exact ⟨0, fun _ => by simp only [Nat.zero_add, FiniteOrbit.iterate]⟩
  | succ block ih =>
    obtain ⟨offset, agrees⟩ := ih (system.next c)
    refine ⟨(system.terms c).length + offset, ?_⟩
    intro n
    rw [Nat.add_assoc, system.run_skip, agrees]
    rw [show block + 1 = 1 + block by omega, FiniteOrbit.iterate_add]
    rfl

theorem System.block_member_on_run (system : System Config) (c : Config) (block : Nat) (term : Term)
    (member : term ∈ system.terms (FiniteOrbit.iterate system.next block c)) :
    ∃ n, system.run n c = term := by
  obtain ⟨index, bound, atIndex⟩ := List.mem_iff_getElem.mp member
  obtain ⟨offset, suffix⟩ := system.run_suffix c block
  refine ⟨offset + index, ?_⟩
  rw [suffix, system.run_inside _ index bound]
  simp only [sample, List.getElem?_eq_getElem bound, Option.getD_some, atIndex]

theorem System.observations_iff (system : System Config) (c : Config) (accepts : Term → Prop) :
    (∃ block term, term ∈ system.terms (FiniteOrbit.iterate system.next block c) ∧ accepts term) ↔
      ∃ n, accepts (system.run n c) := by
  constructor
  · rintro ⟨block, term, member, accepted⟩
    obtain ⟨n, same⟩ := system.block_member_on_run c block term member
    exact ⟨n, same ▸ accepted⟩
  · rintro ⟨n, accepted⟩
    obtain ⟨block, member⟩ := system.run_in_block c n
    exact ⟨block, system.run n c, member, accepted⟩

end PureSFormal.AppendixF.PositiveBlocks
