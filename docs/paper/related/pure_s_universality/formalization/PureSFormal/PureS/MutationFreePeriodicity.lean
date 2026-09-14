import PureSFormal.PureS.FiniteControllerBound

/-!
# Mutation-free finite-controller trajectories

When every microtransition on one run has mutation count zero, the erased
pure-S term is fixed.  The full runtime configuration therefore ranges over
the explicit finite cover `runtime control × occurrence position` for that
one term.  Determinism and a finite pigeonhole argument give an eventually
periodic full control-and-cursor trajectory.
-/

namespace PureSFormal.PureS

namespace FiniteController

/-- Constructively invert membership in a mapped list. -/
private theorem exists_of_mem_map_constructive (function : α → β) :
    ∀ {values : List α} {result : β},
      result ∈ values.map function →
        ∃ value, value ∈ values ∧ function value = result := by
  intro values result membership
  induction values with
  | nil => cases membership
  | cons first rest ih =>
      rcases List.mem_cons.mp membership with atHead | inTail
      · exact ⟨first, List.Mem.head rest, atHead.symm⟩
      · obtain ⟨value, valueMem, valueEq⟩ := ih inTail
        exact ⟨value, List.Mem.tail first valueMem, valueEq⟩

/-- Constructively expose one occurrence witnessing list membership. -/
private theorem eq_append_cons_of_mem_constructive
    {value : α} : ∀ {values : List α}, value ∈ values →
      ∃ lead suffix, values = lead ++ value :: suffix := by
  intro values membership
  induction values with
  | nil => cases membership
  | cons first rest ih =>
      rcases List.mem_cons.mp membership with firstEq | tailMem
      · subst first
        exact ⟨[], rest, rfl⟩
      · obtain ⟨lead, suffix, restEq⟩ := ih tailMem
        exact ⟨first :: lead, suffix, by simp [restEq]⟩

/-- A finite list with a duplicate has two displayed occurrences in order. -/
theorem exists_duplicate_decomposition [DecidableEq α] :
    ∀ {values : List α}, ¬ values.Nodup →
      ∃ (lead middle suffix : List α) (value : α),
        values = lead ++ value :: middle ++ value :: suffix := by
  intro values
  induction values with
  | nil =>
      intro notNodup
      exact (notNodup List.nodup_nil).elim
  | cons first rest ih =>
      intro notNodup
      by_cases firstMem : first ∈ rest
      · obtain ⟨middle, suffix, restEq⟩ :=
          eq_append_cons_of_mem_constructive firstMem
        exact ⟨[], middle, suffix, first, by simp [restEq]⟩
      · have restNotNodup : ¬ rest.Nodup := by
          intro restNodup
          exact notNodup (List.nodup_cons.mpr ⟨firstMem, restNodup⟩)
        obtain ⟨lead, middle, suffix, value, restEq⟩ :=
          ih restNotNodup
        exact ⟨first :: lead, middle, suffix, value, by simp [restEq]⟩

/--
Constructive finite pigeonhole principle for a sequence whose values all lie
in one explicit finite cover.  A repetition occurs among indices
`0, ..., cover.length`.
-/
theorem finite_sequence_repeats [DecidableEq α]
    (sequence : Nat → α) (cover : List α)
    (covered : ∀ index, sequence index ∈ cover) :
    ∃ first second,
      first < second ∧ second ≤ cover.length ∧
        sequence first = sequence second := by
  let values := (List.range (cover.length + 1)).map sequence
  have valuesNotNodup : ¬ values.Nodup := by
    intro valuesNodup
    have valuesSubset : ∀ value, value ∈ values → value ∈ cover := by
      intro value valueMem
      change value ∈ (List.range (cover.length + 1)).map sequence at valueMem
      obtain ⟨index, _, indexEq⟩ :=
        exists_of_mem_map_constructive sequence valueMem
      rw [← indexEq]
      exact covered index
    have lengthLe :=
      length_le_of_nodup_of_subset valuesNodup valuesSubset
    simp only [values, List.length_map, List.length_range] at lengthLe
    exact (Nat.not_succ_le_self cover.length lengthLe).elim
  obtain ⟨lead, middle, suffix, value, valuesEq⟩ :=
    exists_duplicate_decomposition valuesNotNodup
  let first := lead.length
  let second := (lead ++ value :: middle).length
  have valuesLength : values.length = cover.length + 1 := by
    simp [values]
  have firstValue : values[first]? = some value := by
    simp only [valuesEq]
    simp [first]
  obtain ⟨firstLt, _⟩ := List.getElem?_eq_some_iff.mp firstValue
  have secondValue : values[second]? = some value := by
    rw [valuesEq, List.getElem?_append_right]
    · simp [second]
    · exact Nat.le_refl _
  obtain ⟨secondLt, _⟩ := List.getElem?_eq_some_iff.mp secondValue
  have atIndex (index : Nat) (indexLt : index < values.length) :
      values[index]? = some (sequence index) := by
    have indexBound : index < cover.length + 1 := by
      simpa only [valuesLength] using indexLt
    simp [values, List.getElem?_range indexBound]
  refine ⟨first, second, ?_, ?_, ?_⟩
  · simp only [first, second, List.length_append, List.length_cons]
    exact Nat.lt_add_of_pos_right (Nat.zero_lt_succ middle.length)
  · have : second < cover.length + 1 := by
      simpa only [valuesLength] using secondLt
    exact Nat.le_of_lt_succ this
  · have firstEq : sequence first = value := by
      exact Option.some.inj ((atIndex first firstLt).symm.trans firstValue)
    have secondEq : sequence second = value := by
      exact Option.some.inj ((atIndex second secondLt).symm.trans secondValue)
    exact firstEq.trans secondEq.symm

/-- The run at `ticks + 1` is one step after the run at `ticks`. -/
theorem run_succ_eq_step_run (machine : Machine Control) (ticks : Nat)
    (initial : Configuration Control) :
    run machine (ticks + 1) initial =
      step machine (run machine ticks initial) := by
  rw [run_add machine ticks 1 initial]
  rfl

/--
If every visited microstate has mutation count zero, erasing the cursor at
any later tick gives exactly the initial bare term.
-/
theorem erase_run_eq_of_mutation_free
    (machine : Machine Control) (initial : Configuration Control)
    (mutationFree : ∀ ticks,
      mutationCount machine (run machine ticks initial) = 0) :
    ∀ ticks,
      (run machine ticks initial).cursor.erase = initial.cursor.erase := by
  intro ticks
  induction ticks with
  | zero => rfl
  | succ ticks ih =>
      rw [run_succ_eq_step_run]
      exact (erase_step_of_mutationCount_zero machine
        (run machine ticks initial) (mutationFree ticks)).trans ih

/--
The full control-and-cursor trajectory of a mutation-free run repeats within
the explicit finite configuration bound for its fixed erased term.
-/
theorem exists_repeat_within_stateBound_of_mutation_free
    [DecidableEq Control]
    (machine : Machine Control) (initial : Configuration Control)
    (mutationFree : ∀ ticks,
      mutationCount machine (run machine ticks initial) = 0) :
    ∃ first second,
      first < second ∧ second ≤ stateBound machine initial ∧
        run machine first initial = run machine second initial := by
  apply finite_sequence_repeats
    (fun ticks => run machine ticks initial)
    (configurationStates machine initial.cursor.erase)
  intro ticks
  have eraseEq := erase_run_eq_of_mutation_free machine initial mutationFree ticks
  rw [← eraseEq]
  exact mem_configurationStates machine (run machine ticks initial)

/-- Equal runtime configurations have equal deterministic futures. -/
theorem run_eq_run_add_period_of_run_eq
    (machine : Machine Control) (initial : Configuration Control)
    {first second : Nat}
    (repeatedEq : run machine first initial = run machine second initial) :
    ∀ offset,
      run machine (first + offset) initial =
        run machine (second + offset) initial := by
  intro offset
  rw [run_add machine first offset initial,
    run_add machine second offset initial, repeatedEq]

/--
Every mutation-free deterministic finite-controller run is eventually
periodic as a full control-and-cursor trajectory.  The preperiod and the first
repeated index are bounded by `stateBound`; the positive period is their
difference.
-/
theorem eventually_periodic_of_mutation_free
    [DecidableEq Control]
    (machine : Machine Control) (initial : Configuration Control)
    (mutationFree : ∀ ticks,
      mutationCount machine (run machine ticks initial) = 0) :
    ∃ preperiod period,
      0 < period ∧
      preperiod + period ≤ stateBound machine initial ∧
      ∀ offset,
        run machine (preperiod + offset) initial =
          run machine (preperiod + period + offset) initial := by
  obtain ⟨first, second, firstLt, secondLe, repeatedEq⟩ :=
    exists_repeat_within_stateBound_of_mutation_free
      machine initial mutationFree
  refine ⟨first, second - first, Nat.sub_pos_of_lt firstLt, ?_, ?_⟩
  · simpa [Nat.add_sub_of_le (Nat.le_of_lt firstLt)] using secondLe
  · intro offset
    have future := run_eq_run_add_period_of_run_eq
      machine initial repeatedEq offset
    simpa [Nat.add_sub_of_le (Nat.le_of_lt firstLt), Nat.add_assoc] using future

end FiniteController

end PureSFormal.PureS
