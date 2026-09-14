import PureSFormal.AppendixF.Carrier

/-! Expansion of the positive carrier blocks into an infinite native path.
The equivalence includes every intermediate term and every boundary. -/
namespace PureSFormal.AppendixF.Carrier
open PureSFormal.PureS
open PureSFormal.Research.FiniteTreeAutomatonPowerset
set_option maxHeartbeats 1000000

def sample (terms : List Term) (last : Term) (n : Nat) : Term :=
  (terms[n]?).getD last

theorem Trace.sample_zero {first last : Term} {terms : List Term}
    (trace : Trace first terms last) : sample terms last 0 = first := by
  cases trace <;> rfl

theorem sample_end (terms : List Term) (last : Term) : sample terms last terms.length = last := by
  simp [sample]

theorem Trace.sample_step {first last : Term} {terms : List Term}
    (trace : Trace first terms last) (n : Nat) (bound : n < terms.length) :
    Step (sample terms last n) (sample terms last (n + 1)) := by
  induction trace generalizing n with
  | nil => simp at bound
  | cons edge trace ih =>
    cases n with
    | zero =>
      change Step _ (sample _ _ 0)
      rw [trace.sample_zero]
      exact edge
    | succ n => exact ih n (Nat.lt_of_succ_lt_succ bound)

def Configuration.run (n : Nat) (c : Configuration) : Term :=
  if _h : n < c.terms.length then sample c.terms c.next.term n
  else c.next.run (n - c.terms.length)
termination_by n
decreasing_by have := c.positive; omega

theorem Configuration.run_zero (c : Configuration) : c.run 0 = c.term := by
  rw [Configuration.run, dif_pos (by have := c.positive; omega)]
  exact c.native.sample_zero

theorem Configuration.run_inside (c : Configuration) (n : Nat) (h : n < c.terms.length) :
    c.run n = sample c.terms c.next.term n := by rw [Configuration.run, dif_pos h]

theorem Configuration.run_skip (c : Configuration) (n : Nat) :
    c.run (c.terms.length + n) = c.next.run n := by
  rw [Configuration.run, dif_neg (by omega)]
  simp only [Nat.add_sub_cancel_left]

theorem Configuration.run_step (c : Configuration) (n : Nat) : Step (c.run n) (c.run (n + 1)) := by
  induction n using Nat.strongRecOn generalizing c with
  | ind n ih =>
    by_cases inside : n < c.terms.length
    · rw [c.run_inside n inside]
      by_cases nextInside : n + 1 < c.terms.length
      · rw [c.run_inside (n + 1) nextInside]
        exact c.native.sample_step n inside
      · have atEnd : n + 1 = c.terms.length := by omega
        have last : c.run (n + 1) = c.next.term := by
          rw [atEnd, ← Nat.add_zero c.terms.length, c.run_skip, Configuration.run_zero]
        rw [last]
        have edge := c.native.sample_step n inside
        simpa only [atEnd, sample_end] using edge
    · have lengthLe : c.terms.length ≤ n := by omega
      have earlier : n - c.terms.length < n := by have := c.positive; omega
      have base : c.terms.length + (n - c.terms.length) = n := by omega
      have next : c.terms.length + ((n - c.terms.length) + 1) = n + 1 := by omega
      rw [← base, c.run_skip]
      rw [show c.terms.length + (n - c.terms.length) + 1 =
        c.terms.length + ((n - c.terms.length) + 1) by omega, c.run_skip]
      exact ih (n - c.terms.length) earlier c.next

theorem sample_member {terms : List Term} (last : Term) (n : Nat) (bound : n < terms.length) :
    sample terms last n ∈ terms := by
  simp only [sample, List.getElem?_eq_getElem bound, Option.getD_some]
  exact List.getElem_mem bound

theorem Configuration.run_in_block (c : Configuration) (n : Nat) :
    ∃ block, c.run n ∈ (FiniteOrbit.iterate Configuration.next block c).terms := by
  induction n using Nat.strongRecOn generalizing c with
  | ind n ih =>
    by_cases inside : n < c.terms.length
    · refine ⟨0, ?_⟩
      rw [c.run_inside n inside]
      exact sample_member _ _ inside
    · have bound : n - c.terms.length < n := by have := c.positive; omega
      obtain ⟨block, member⟩ := ih (n - c.terms.length) bound c.next
      refine ⟨1 + block, ?_⟩
      rw [FiniteOrbit.iterate_add]
      change c.run n ∈ (FiniteOrbit.iterate Configuration.next block c.next).terms
      have eq : c.terms.length + (n - c.terms.length) = n := by omega
      rw [← eq, c.run_skip]
      exact member

theorem Configuration.run_suffix (c : Configuration) (block : Nat) :
    ∃ offset, ∀ n, c.run (offset + n) =
      (FiniteOrbit.iterate Configuration.next block c).run n := by
  induction block generalizing c with
  | zero => exact ⟨0, fun _ => by simp only [Nat.zero_add, FiniteOrbit.iterate]⟩
  | succ block ih =>
    obtain ⟨offset, agrees⟩ := ih c.next
    refine ⟨c.terms.length + offset, ?_⟩
    intro n
    rw [Nat.add_assoc, c.run_skip, agrees]
    have shift : block + 1 = 1 + block := by omega
    rw [shift, FiniteOrbit.iterate_add]
    rfl

theorem Configuration.block_member_on_run (c : Configuration) (block : Nat) (term : Term)
    (member : term ∈ (FiniteOrbit.iterate Configuration.next block c).terms) :
    ∃ n, c.run n = term := by
  obtain ⟨index, bound, atIndex⟩ := List.mem_iff_getElem.mp member
  obtain ⟨offset, suffix⟩ := c.run_suffix block
  refine ⟨offset + index, ?_⟩
  rw [suffix, Configuration.run_inside _ index bound]
  simp only [sample, List.getElem?_eq_getElem bound, Option.getD_some, atIndex]

/-- Exact regular observation along the infinite legal native trajectory. -/
theorem eventuallyAccepts_path_iff [DecidableEq State] (automaton : Deterministic State) (c : Configuration) :
    eventuallyAccepts automaton c = true ↔ ∃ n, automaton.accepts (c.run n) = true := by
  rw [eventuallyAccepts_correct]
  constructor
  · rintro ⟨block, term, member, accepted⟩
    obtain ⟨n, eq⟩ := c.block_member_on_run block term member
    exact ⟨n, eq ▸ accepted⟩
  · rintro ⟨n, accepted⟩
    obtain ⟨block, member⟩ := c.run_in_block n
    exact ⟨block, c.run n, member, accepted⟩

end PureSFormal.AppendixF.Carrier
