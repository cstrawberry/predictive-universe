import PureSFormal.PureS.CursorPositions
import PureSFormal.PureS.FiniteController

/-!
# Uniform bounded search for finite one-cursor machines

Between two successful contractions the erased occurrence tree is fixed.  A
finite controller can therefore visit only

`runtime controls × occurrence positions`

distinct full runtime configurations.  Determinism rules out repetition on a
finite prefix that eventually reaches its first contraction.  Consequently
the size of that explicit finite product is a computable, configuration-only
bound for `seekMutation`, whenever any later mutation exists.
-/

namespace PureSFormal.PureS

namespace FiniteController

deriving instance DecidableEq for Configuration

/-! ## Elementary finite-list bound -/

private theorem mem_append_left {value : α} {left right : List α}
    (membership : value ∈ left) : value ∈ left ++ right := by
  induction membership with
  | head => exact List.Mem.head _
  | tail first _ ih => exact List.Mem.tail first ih

private theorem mem_append_right (left : List α) {value : α} {right : List α}
    (membership : value ∈ right) : value ∈ left ++ right := by
  induction left with
  | nil => exact membership
  | cons first rest ih => exact List.Mem.tail first ih

private theorem mem_map_clean (function : α → β)
    {value : α} {values : List α} (membership : value ∈ values) :
    function value ∈ values.map function := by
  induction membership with
  | head => exact List.Mem.head _
  | tail first _ ih => exact List.Mem.tail _ ih

private theorem mem_flatMap_clean (function : α → List β)
    {value : α} {values : List α} (valueMem : value ∈ values)
    {result : β} (resultMem : result ∈ function value) :
    result ∈ values.flatMap function := by
  induction valueMem with
  | head => exact mem_append_left resultMem
  | tail first _ ih => exact mem_append_right (function first) ih

/-- Remove the first propositionally equal entry, using only supplied equality. -/
private def removeFirst [DecidableEq α] (target : α) : List α → List α
  | [] => []
  | first :: rest =>
      if first = target then rest else first :: removeFirst target rest

private theorem mem_removeFirst_of_ne [DecidableEq α]
    {value target : α} (different : value ≠ target) :
    ∀ {values : List α},
      value ∈ removeFirst target values ↔ value ∈ values
  | [] => by simp [removeFirst]
  | first :: rest => by
      by_cases firstEq : first = target
      · subst first
        simp [removeFirst, different]
      · simp [removeFirst, firstEq, mem_removeFirst_of_ne different]

private theorem length_removeFirst_add_one [DecidableEq α]
    {target : α} : ∀ {values : List α},
      target ∈ values →
      (removeFirst target values).length + 1 = values.length
  | [], membership => by cases membership
  | first :: rest, membership => by
      by_cases firstEq : first = target
      · subst first
        simp [removeFirst]
      · have tailMem : target ∈ rest := by
          rcases List.mem_cons.mp membership with equal | inTail
          · exact (firstEq equal.symm).elim
          · exact inTail
        simp only [removeFirst, firstEq, ↓reduceIte, List.length_cons]
        rw [length_removeFirst_add_one tailMem]

/-- A duplicate-free list contained in a finite cover is no longer than it. -/
theorem length_le_of_nodup_of_subset [DecidableEq α] :
    ∀ {values cover : List α},
      values.Nodup →
      (∀ value, value ∈ values → value ∈ cover) →
      values.length ≤ cover.length
  | [], cover, _, _ => Nat.zero_le _
  | first :: rest, cover, nodup, subset => by
      have firstMem : first ∈ cover :=
        subset first (List.Mem.head rest)
      have restNodup : rest.Nodup := by
        exact (List.nodup_cons.mp nodup).2
      have firstNotMem : first ∉ rest := by
        exact (List.nodup_cons.mp nodup).1
      have restSubset : ∀ value, value ∈ rest →
          value ∈ removeFirst first cover := by
        intro value valueMem
        have valueNe : value ≠ first := by
          intro equality
          subst value
          exact firstNotMem valueMem
        exact (mem_removeFirst_of_ne valueNe).2
          (subset value (List.Mem.tail first valueMem))
      have recurse := length_le_of_nodup_of_subset restNodup restSubset
      have erasedLength : (removeFirst first cover).length + 1 = cover.length :=
        length_removeFirst_add_one firstMem
      rw [List.length_cons]
      calc
        rest.length + 1 ≤ (removeFirst first cover).length + 1 :=
          Nat.add_le_add_right recurse 1
        _ = cover.length := erasedLength

/-! ## Exact first-mutation prefixes -/

/--
An exact deterministic prefix ending with its first successful contraction.
The tick count is positive by construction; every preceding row has mutation
count zero.
-/
inductive FirstMutationRun (machine : Machine Control) :
    Nat → Configuration Control → Configuration Control → Prop where
  | here {before : Configuration Control}
      (count : mutationCount machine before = 1) :
      FirstMutationRun machine 1 before (step machine before)
  | later {ticks : Nat} {before after : Configuration Control}
      (count : mutationCount machine before = 0)
      (tail : FirstMutationRun machine ticks (step machine before) after) :
      FirstMutationRun machine (ticks + 1) before after

namespace FirstMutationRun

/-- Determinism makes both the first-mutation time and endpoint unique. -/
theorem unique
    {machine : Machine Control}
    {firstTicks secondTicks : Nat}
    {before firstAfter secondAfter : Configuration Control}
    (first : FirstMutationRun machine firstTicks before firstAfter)
    (second : FirstMutationRun machine secondTicks before secondAfter) :
    firstTicks = secondTicks ∧ firstAfter = secondAfter := by
  induction first generalizing secondTicks secondAfter with
  | here firstCount =>
      cases second with
      | here secondCount => exact ⟨rfl, rfl⟩
      | later secondCount tail =>
          rw [firstCount] at secondCount
          contradiction
  | later firstCount firstTail ih =>
      cases second with
      | here secondCount =>
          rw [firstCount] at secondCount
          contradiction
      | later secondCount secondTail =>
          obtain ⟨ticksEq, afterEq⟩ := ih secondTail
          exact ⟨congrArg (fun ticks => ticks + 1) ticksEq, afterEq⟩

/-- Runtime configurations inspected by a prefix of `ticks` rows. -/
def states (machine : Machine Control) :
    Nat → Configuration Control → List (Configuration Control)
  | 0, _ => []
  | ticks + 1, configuration =>
      configuration :: states machine ticks (step machine configuration)

@[simp]
theorem length_states (machine : Machine Control) (ticks : Nat)
    (configuration : Configuration Control) :
    (states machine ticks configuration).length = ticks := by
  induction ticks generalizing configuration with
  | zero => rfl
  | succ ticks ih =>
      simp only [states, List.length_cons, ih]

/-- Every inspected state inherits a suffix ending at the same first mutation. -/
theorem suffix_of_mem
    {machine : Machine Control}
    {ticks : Nat} {before after current : Configuration Control}
    (run : FirstMutationRun machine ticks before after)
    (membership : current ∈ states machine ticks before) :
    ∃ suffixTicks,
      suffixTicks ≤ ticks ∧
      FirstMutationRun machine suffixTicks current after := by
  induction run with
  | here count =>
      simp only [states, List.mem_singleton] at membership
      cases membership
      exact ⟨1, Nat.le_refl 1, .here count⟩
  | @later tailTicks before after count tail ih =>
      simp only [states, List.mem_cons] at membership
      rcases membership with atHead | inTail
      · cases atHead
        exact ⟨tailTicks + 1, Nat.le_refl _, .later count tail⟩
      · obtain ⟨suffixTicks, suffixLe, suffix⟩ := ih inTail
        exact ⟨suffixTicks, Nat.le_trans suffixLe
          (Nat.le_add_right tailTicks 1), suffix⟩

/-- No full runtime configuration repeats before the first contraction. -/
theorem states_nodup
    {machine : Machine Control}
    {ticks : Nat} {before after : Configuration Control}
    (run : FirstMutationRun machine ticks before after) :
    (states machine ticks before).Nodup := by
  induction run with
  | here count =>
      simp only [states]
      simp
  | @later tailTicks before after count tail tailNodup =>
      simp only [states]
      apply List.nodup_cons.mpr
      constructor
      · intro beforeMem
        obtain ⟨suffixTicks, suffixLe, suffix⟩ :=
          tail.suffix_of_mem beforeMem
        have ticksEq : tailTicks + 1 = suffixTicks :=
          (FirstMutationRun.unique (.later count tail) suffix).1
        have impossible : tailTicks + 1 ≤ tailTicks := by
          simpa only [ticksEq] using suffixLe
        exact (Nat.not_succ_le_self tailTicks impossible).elim
      · exact tailNodup

/-- Every inspected configuration still erases to the initial bare term. -/
theorem erase_eq_of_mem_states
    {machine : Machine Control}
    {ticks : Nat} {before after current : Configuration Control}
    (run : FirstMutationRun machine ticks before after)
    (membership : current ∈ states machine ticks before) :
    current.cursor.erase = before.cursor.erase := by
  induction run with
  | here count =>
      simp only [states, List.mem_singleton] at membership
      cases membership
      rfl
  | @later tailTicks before after count tail ih =>
      simp only [states, List.mem_cons] at membership
      rcases membership with atHead | inTail
      · cases atHead
        rfl
      · exact (ih inTail).trans
          (erase_step_of_mutationCount_zero machine before count)

/-- A first-mutation prefix is exactly what bounded search executes. -/
theorem seekMutation_eq
    {machine : Machine Control}
    {ticks : Nat} {before after : Configuration Control}
    (run : FirstMutationRun machine ticks before after) :
    seekMutation machine ticks before = some after := by
  induction run with
  | @here before count => simp [seekMutation, count]
  | @later ticks before after count tail ih =>
      have countNe : mutationCount machine before ≠ 1 := by
        rw [count]
        exact Nat.zero_ne_add_one 0
      simp only [seekMutation, countNe, ↓reduceIte]
      exact ih

/-- Once bounded search succeeds, appending unused fuel preserves its result. -/
theorem seekMutation_eq_add
    {machine : Machine Control}
    {ticks : Nat} {before after : Configuration Control}
    (found : seekMutation machine ticks before = some after) :
    ∀ extra,
      seekMutation machine (ticks + extra) before = some after := by
  induction ticks generalizing before with
  | zero => simp [seekMutation] at found
  | succ ticks ih =>
      intro extra
      by_cases count : mutationCount machine before = 1
      · have afterEq : step machine before = after := by
          exact Option.some.inj (by
            simpa only [seekMutation, count, ↓reduceIte] using found)
        subst after
        simp only [Nat.succ_add, seekMutation, count, ↓reduceIte]
      · simp only [seekMutation, count, ↓reduceIte] at found
        have tail := ih found extra
        simpa only [Nat.succ_add, seekMutation, count, ↓reduceIte] using tail

/-- Extra search fuel does not change an already-determined first mutation. -/
theorem seekMutation_eq_of_le
    {machine : Machine Control}
    {ticks fuel : Nat} {before after : Configuration Control}
    (run : FirstMutationRun machine ticks before after)
    (ticksLe : ticks ≤ fuel) :
    seekMutation machine fuel before = some after := by
  obtain ⟨extra, rfl⟩ := Nat.exists_eq_add_of_le ticksLe
  exact seekMutation_eq_add run.seekMutation_eq extra

/-- Successful bounded search exposes its exact positive first-mutation prefix. -/
theorem of_seekMutation
    {machine : Machine Control}
    {fuel : Nat} {before after : Configuration Control}
    (found : seekMutation machine fuel before = some after) :
    ∃ ticks,
      ticks ≤ fuel ∧ FirstMutationRun machine ticks before after := by
  induction fuel generalizing before with
  | zero => simp [seekMutation] at found
  | succ fuel ih =>
      by_cases count : mutationCount machine before = 1
      · simp only [seekMutation, count, ↓reduceIte,
          Option.some.injEq] at found
        subst after
        exact ⟨1, Nat.succ_le_succ (Nat.zero_le fuel), .here count⟩
      · simp only [seekMutation, count, ↓reduceIte] at found
        obtain ⟨ticks, ticksLe, tail⟩ := ih found
        have countZero : mutationCount machine before = 0 := by
          rcases mutationCount_eq_zero_or_one machine before with zero | one
          · exact zero
          · exact (count one).elim
        exact ⟨ticks + 1,
          Nat.succ_le_succ ticksLe,
          .later countZero tail⟩

end FirstMutationRun

/-! ## Explicit runtime-state cover and uniform bound -/

/-- All full runtime configurations over one fixed erased occurrence tree. -/
def configurationStates (machine : Machine Control) (term : Term) :
    List (Configuration Control) :=
  (runtimeStates machine).flatMap fun control =>
    (Cursor.positions term []).map fun cursor => ⟨control, cursor⟩

/-- Every configuration belongs to the finite cover of its own erased term. -/
theorem mem_configurationStates (machine : Machine Control)
    (configuration : Configuration Control) :
    configuration ∈ configurationStates machine configuration.cursor.erase := by
  rcases configuration with ⟨control, cursor⟩
  exact mem_flatMap_clean _ (mem_runtimeStates machine control)
    (mem_map_clean _ (Cursor.mem_positions_erase cursor))

/-- The executable number of possible pre-mutation runtime configurations. -/
def stateBound (machine : Machine Control)
    (configuration : Configuration Control) : Nat :=
  (configurationStates machine configuration.cursor.erase).length

theorem stateBound_eq (machine : Machine Control)
    (configuration : Configuration Control) :
    stateBound machine configuration =
      (runtimeStates machine).length * configuration.cursor.erase.size := by
  unfold stateBound configurationStates
  induction runtimeStates machine with
  | nil => simp
  | cons control controls ih =>
      simp only [List.flatMap_cons, List.length_append, List.length_map,
        Cursor.length_positions, List.length_cons, ih, Nat.succ_mul]
      exact Nat.add_comm _ _

/--
If any bounded search finds a contraction, the uniform finite-state bound
finds that same first contraction.  No semantic scheduler invariant is needed.
-/
theorem seekMutation_stateBound [DecidableEq Control]
    (machine : Machine Control)
    {fuel : Nat} {before after : Configuration Control}
    (found : seekMutation machine fuel before = some after) :
    seekMutation machine (stateBound machine before) before = some after := by
  obtain ⟨ticks, ticksLeFuel, first⟩ :=
    FirstMutationRun.of_seekMutation found
  have subset : ∀ current,
      current ∈ FirstMutationRun.states machine ticks before →
        current ∈ configurationStates machine before.cursor.erase := by
    intro current currentMem
    have eraseEq := first.erase_eq_of_mem_states currentMem
    rw [← eraseEq]
    exact mem_configurationStates machine current
  have ticksLeBound : ticks ≤ stateBound machine before := by
    unfold stateBound
    rw [← FirstMutationRun.length_states machine ticks before]
    exact length_le_of_nodup_of_subset first.states_nodup subset
  exact first.seekMutation_eq_of_le ticksLeBound

end FiniteController

end PureSFormal.PureS
