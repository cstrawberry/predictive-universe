import PureSFormal.PureS.FiniteController
import PureSFormal.WeakPath.CheckpointTime

/-!
# Relating microticks to contraction samples
-/

namespace PureSFormal.PureS

namespace FiniteController

/-- Running for one additional microtick is a final `step` after the prefix. -/
theorem run_succ_last
    {Control : Type} (machine : Machine Control) (ticks : Nat)
    (configuration : Configuration Control) :
    run machine (ticks + 1) configuration =
      step machine (run machine ticks configuration) := by
  simpa [run] using run_add machine ticks 1 configuration

/-- The mutation counter likewise splits off its final microtick. -/
theorem runMutationCount_succ_last
    {Control : Type} (machine : Machine Control) (ticks : Nat)
    (configuration : Configuration Control) :
    runMutationCount machine (ticks + 1) configuration =
      runMutationCount machine ticks configuration +
        mutationCount machine (run machine ticks configuration) := by
  simpa [runMutationCount] using
    runMutationCount_add machine ticks 1 configuration

/-- Every prefix of a zero-mutation controller run also has zero mutations. -/
theorem runMutationCount_prefix_zero
    {Control : Type} (machine : Machine Control)
    {earlier total : Nat} (configuration : Configuration Control)
    (hle : earlier ≤ total)
    (hzero : runMutationCount machine total configuration = 0) :
    runMutationCount machine earlier configuration = 0 := by
  obtain ⟨remaining, rfl⟩ := Nat.exists_eq_add_of_le hle
  rw [runMutationCount_add] at hzero
  exact Nat.eq_zero_of_add_eq_zero_right hzero

/-- Executable row count through the first successful mutation in a bounded
search.  Failure returns the exhausted fuel. -/
def seekMutationDelay
    {Control : Type} (machine : Machine Control) :
    Nat → Configuration Control → Nat
  | 0, _ => 0
  | fuel + 1, configuration =>
      if mutationCount machine configuration = 1 then
        1
      else
        seekMutationDelay machine fuel (step machine configuration) + 1

/-- A successful bounded search fixes the executable delay, endpoint, and
exact singleton mutation count. -/
theorem seekMutationDelay_spec
    {Control : Type} (machine : Machine Control) :
    ∀ {fuel : Nat} {before after : Configuration Control},
      seekMutation machine fuel before = some after →
        0 < seekMutationDelay machine fuel before ∧
        seekMutationDelay machine fuel before ≤ fuel ∧
        run machine (seekMutationDelay machine fuel before) before = after ∧
        runMutationCount machine
          (seekMutationDelay machine fuel before) before = 1
  | 0, before, after, found => by
      simp [seekMutation] at found
  | fuel + 1, before, after, found => by
      by_cases currentCount : mutationCount machine before = 1
      · have afterEq : step machine before = after := by
          simpa [seekMutation, currentCount] using found
        subst after
        simp [seekMutationDelay, currentCount, run, runMutationCount]
      · have currentZero : mutationCount machine before = 0 := by
          rcases mutationCount_eq_zero_or_one machine before with zero | one
          · exact zero
          · exact (currentCount one).elim
        have tailFound :
            seekMutation machine fuel (step machine before) = some after := by
          simpa [seekMutation, currentCount] using found
        rcases seekMutationDelay_spec machine tailFound with
          ⟨_tailPositive, tailLe, tailRun, tailCount⟩
        refine ⟨?_, ?_, ?_, ?_⟩
        · simp [seekMutationDelay, currentCount]
        · simpa [seekMutationDelay, currentCount] using
            Nat.succ_le_succ tailLe
        · simpa [seekMutationDelay, currentCount, run_succ] using tailRun
        · simpa [seekMutationDelay, currentCount, runMutationCount,
            currentZero] using tailCount

/--
A successful bounded mutation search has an exact first-mutating microtick.
All shorter prefixes have zero mutation count.
-/
theorem seekMutation_exact_run
    {Control : Type} (machine : Machine Control) :
    ∀ {fuel : Nat} {before after : Configuration Control},
      seekMutation machine fuel before = some after →
        ∃ ticks,
          ticks ≤ fuel ∧
          run machine ticks before = after ∧
          runMutationCount machine ticks before = 1 ∧
          ∀ earlier, earlier < ticks →
            runMutationCount machine earlier before = 0
  | 0, before, after, found => by
      simp [seekMutation] at found
  | fuel + 1, before, after, found => by
      by_cases currentCount : mutationCount machine before = 1
      · have afterEq : after = step machine before := by
          simpa [seekMutation, currentCount] using found.symm
        subst after
        refine ⟨1, Nat.succ_le_succ (Nat.zero_le fuel), rfl, ?_, ?_⟩
        · simp [runMutationCount, currentCount]
        · intro earlier earlierLt
          have earlierEq : earlier = 0 :=
            Nat.eq_zero_of_le_zero (Nat.le_of_lt_succ earlierLt)
          subst earlier
          rfl
      · have currentZero : mutationCount machine before = 0 := by
          rcases mutationCount_eq_zero_or_one machine before with zero | one
          · exact zero
          · exact (currentCount one).elim
        have tailFound : seekMutation machine fuel (step machine before) =
            some after := by
          simpa [seekMutation, currentCount] using found
        obtain ⟨ticks, ticksLe, reaches, countOne, first⟩ :=
          seekMutation_exact_run machine tailFound
        refine ⟨ticks + 1, Nat.succ_le_succ ticksLe, ?_, ?_, ?_⟩
        · simpa [run_succ] using reaches
        · simp [runMutationCount, currentZero, countOne]
        · intro earlier earlierLt
          cases earlier with
          | zero => rfl
          | succ earlier =>
              have earlierTail : earlier < ticks :=
                Nat.succ_lt_succ_iff.mp earlierLt
              simp [runMutationCount, currentZero, first earlier earlierTail]

/-- Productivity makes the executable first-mutation delay positive. -/
theorem ProductiveSystem.seekMutationDelay_pos_of_good
    {Control : Type} {machine : Machine Control}
    (system : ProductiveSystem machine)
    {configuration : Configuration Control}
    (good : system.good configuration) :
    0 < seekMutationDelay machine (system.bound configuration) configuration := by
  obtain ⟨after, found⟩ := system.finds configuration good
  exact (seekMutationDelay_spec machine found).1

/-- Running for the executable delay reaches the productive next sample. -/
theorem ProductiveSystem.run_seekMutationDelay_eq_next
    {Control : Type} {machine : Machine Control}
    (system : ProductiveSystem machine)
    {configuration : Configuration Control}
    (good : system.good configuration) :
    run machine
        (seekMutationDelay machine (system.bound configuration) configuration)
        configuration =
      system.next configuration := by
  obtain ⟨after, found⟩ := system.finds configuration good
  have nextEq : system.next configuration = after :=
    advance_eq_of_seekMutation machine system.bound found
  rw [nextEq]
  exact (seekMutationDelay_spec machine found).2.2.1

/-- The executable delay contains exactly one successful contraction. -/
theorem ProductiveSystem.runMutationCount_seekMutationDelay_eq_one
    {Control : Type} {machine : Machine Control}
    (system : ProductiveSystem machine)
    {configuration : Configuration Control}
    (good : system.good configuration) :
    runMutationCount machine
        (seekMutationDelay machine (system.bound configuration) configuration)
        configuration = 1 := by
  obtain ⟨after, found⟩ := system.finds configuration good
  exact (seekMutationDelay_spec machine found).2.2.2

/-- Raw-controller rows consumed between consecutive contraction samples. -/
def ProductiveSystem.contractionGap
    {Control : Type} {machine : Machine Control}
    (system : ProductiveSystem machine) (index : Nat) : Nat :=
  seekMutationDelay machine
    (system.bound (system.contractionRun index))
    (system.contractionRun index)

/-- Every contraction-sample gap contains at least its final mutating row. -/
theorem ProductiveSystem.contractionGap_pos
    {Control : Type} {machine : Machine Control}
    (system : ProductiveSystem machine) (index : Nat) :
    0 < system.contractionGap index := by
  unfold ProductiveSystem.contractionGap
  exact ProductiveSystem.seekMutationDelay_pos_of_good system
    (system.contractionRun_good index)

/-- Canonical raw microtick at which contraction sample `index` is reached. -/
def ProductiveSystem.sampleTick
    {Control : Type} {machine : Machine Control}
    (system : ProductiveSystem machine) : Nat → Nat :=
  WeakPath.cumulativeTime system.contractionGap

@[simp]
theorem ProductiveSystem.sampleTick_zero
    {Control : Type} {machine : Machine Control}
    (system : ProductiveSystem machine) :
    system.sampleTick 0 = 0 :=
  rfl

@[simp]
theorem ProductiveSystem.sampleTick_succ
    {Control : Type} {machine : Machine Control}
    (system : ProductiveSystem machine) (index : Nat) :
    system.sampleTick (index + 1) =
      system.sampleTick index + system.contractionGap index :=
  rfl

/-- The raw run at the canonical tick is exactly the indexed contraction sample. -/
theorem ProductiveSystem.run_sampleTick
    {Control : Type} {machine : Machine Control}
    (system : ProductiveSystem machine) :
    ∀ index,
      run machine (system.sampleTick index) system.initial =
        system.contractionRun index
  | 0 => rfl
  | index + 1 => by
      rw [ProductiveSystem.sampleTick_succ, run_add,
        ProductiveSystem.run_sampleTick system index,
        ProductiveSystem.contractionRun_succ]
      simpa [ProductiveSystem.contractionGap] using
        (ProductiveSystem.run_seekMutationDelay_eq_next system
          (system.contractionRun_good index))

/-- Exactly `index` contractions have occurred at canonical sample tick `index`. -/
theorem ProductiveSystem.runMutationCount_sampleTick
    {Control : Type} {machine : Machine Control}
    (system : ProductiveSystem machine) :
    ∀ index,
      runMutationCount machine (system.sampleTick index) system.initial = index
  | 0 => rfl
  | index + 1 => by
      have gapCount :
          runMutationCount machine (system.contractionGap index)
              (system.contractionRun index) = 1 := by
        simpa [ProductiveSystem.contractionGap] using
          (ProductiveSystem.runMutationCount_seekMutationDelay_eq_one system
            (system.contractionRun_good index))
      rw [ProductiveSystem.sampleTick_succ, runMutationCount_add,
        ProductiveSystem.runMutationCount_sampleTick system index,
        ProductiveSystem.run_sampleTick system index, gapCount]

/-- Canonical contraction-sample ticks are strictly increasing. -/
theorem ProductiveSystem.sampleTick_strictMono
    {Control : Type} {machine : Machine Control}
    (system : ProductiveSystem machine) :
    WeakPath.StrictlyIncreasing system.sampleTick := by
  unfold ProductiveSystem.sampleTick
  exact WeakPath.cumulativeTime_strictlyIncreasing system.contractionGap
    (ProductiveSystem.contractionGap_pos system)

/-- Every contraction sample is reached after finitely many controller rows. -/
theorem ProductiveSystem.contractionRun_reachable
    {Control : Type} {machine : Machine Control}
    (system : ProductiveSystem machine) :
    ∀ index, ∃ ticks,
      run machine ticks system.initial = system.contractionRun index
  | 0 => ⟨0, rfl⟩
  | index + 1 => by
      obtain ⟨prefixTicks, prefixRun⟩ :=
        system.contractionRun_reachable index
      have good := system.contractionRun_good index
      obtain ⟨after, found⟩ := system.finds _ good
      have nextEq : system.next (system.contractionRun index) = after :=
        advance_eq_of_seekMutation machine system.bound found
      obtain ⟨segmentTicks, _segmentLe, segment, _count, _first⟩ :=
        seekMutation_exact_run machine found
      refine ⟨prefixTicks + segmentTicks, ?_⟩
      rw [run_add, prefixRun, segment, contractionRun_succ, nextEq]

/-! ## Every raw microtick lies between two contraction samples -/

/--
`configuration` is an administrative suffix of a unique sampled prefix:
starting from the recorded contraction sample, `lag` microticks reach it and
none of those microticks contracts the erased term.
-/
inductive ProductiveSystem.BetweenSamples
    {Control : Type} {machine : Machine Control}
    (system : ProductiveSystem machine) : Configuration Control → Prop where
  | intro {configuration : Configuration Control}
      (sampleIndex lag : Nat)
      (configuration_eq : configuration =
        run machine lag (system.contractionRun sampleIndex))
      (lag_silent : runMutationCount machine lag
        (system.contractionRun sampleIndex) = 0) :
      ProductiveSystem.BetweenSamples system configuration

/-- One raw controller microtick preserves the between-samples invariant. -/
theorem ProductiveSystem.BetweenSamples.step
    {Control : Type} {machine : Machine Control}
    {system : ProductiveSystem machine}
    {configuration : Configuration Control}
    (between : system.BetweenSamples configuration) :
    system.BetweenSamples (FiniteController.step machine configuration) := by
  rcases between with
    ⟨sampleIndex, lag, configuration_eq, lag_silent⟩
  rcases mutationCount_eq_zero_or_one machine configuration with
    currentSilent | currentMutation
  · refine ⟨sampleIndex, lag + 1, ?_, ?_⟩
    · rw [run_succ_last, ← configuration_eq]
    · rw [runMutationCount_succ_last, ← configuration_eq,
        lag_silent, currentSilent]
  · have sampleGood := system.contractionRun_good sampleIndex
    obtain ⟨after, found⟩ :=
      system.finds (system.contractionRun sampleIndex) sampleGood
    obtain ⟨segmentTicks, _withinBound, segmentRun, segmentCount,
        segmentFirst⟩ := seekMutation_exact_run machine found
    have candidateRun :
        run machine (lag + 1) (system.contractionRun sampleIndex) =
          FiniteController.step machine configuration := by
      rw [run_succ_last, ← configuration_eq]
    have candidateCount :
        runMutationCount machine (lag + 1)
            (system.contractionRun sampleIndex) = 1 := by
      rw [runMutationCount_succ_last, ← configuration_eq,
        lag_silent, currentMutation]
    have candidateFirst : ∀ earlier, earlier < lag + 1 →
        runMutationCount machine earlier
            (system.contractionRun sampleIndex) = 0 := by
      intro earlier earlierLt
      exact runMutationCount_prefix_zero machine
        (system.contractionRun sampleIndex)
        (Nat.le_of_lt_succ earlierLt) lag_silent
    have ticksEq : segmentTicks = lag + 1 := by
      rcases Nat.lt_trichotomy segmentTicks (lag + 1) with
        less | equal | greater
      · have zero := candidateFirst segmentTicks less
        exact False.elim
          (Nat.zero_ne_one (zero.symm.trans segmentCount))
      · exact equal
      · have zero := segmentFirst (lag + 1) greater
        exact False.elim
          (Nat.zero_ne_one (zero.symm.trans candidateCount))
    have afterEq : after = FiniteController.step machine configuration := by
      rw [← segmentRun, ticksEq, candidateRun]
    have nextEq : system.next (system.contractionRun sampleIndex) = after :=
      advance_eq_of_seekMutation machine system.bound found
    refine ⟨sampleIndex + 1, 0, ?_, rfl⟩
    rw [contractionRun_succ, nextEq, afterEq, run_zero]

/-- Every raw finite prefix from the initial controller state lies between samples. -/
theorem ProductiveSystem.run_betweenSamples
    {Control : Type} {machine : Machine Control}
    (system : ProductiveSystem machine) :
    ∀ ticks, system.BetweenSamples (run machine ticks system.initial)
  | 0 => ⟨0, 0, rfl, rfl⟩
  | ticks + 1 => by
      rw [run_succ_last]
      exact (system.run_betweenSamples ticks).step

/--
Every raw prefix is a silent administrative suffix of the contraction sample
whose index is its exact cumulative mutation count.
-/
theorem ProductiveSystem.run_countedBetweenSamples
    {Control : Type} {machine : Machine Control}
    (system : ProductiveSystem machine) :
    ∀ ticks, ∃ lag,
      run machine ticks system.initial =
          run machine lag
            (system.contractionRun
              (runMutationCount machine ticks system.initial)) ∧
        runMutationCount machine lag
          (system.contractionRun
            (runMutationCount machine ticks system.initial)) = 0
  | 0 => ⟨0, rfl, rfl⟩
  | ticks + 1 => by
      obtain ⟨lag, configuration_eq, lag_silent⟩ :=
        system.run_countedBetweenSamples ticks
      rcases mutationCount_eq_zero_or_one machine
          (run machine ticks system.initial) with
        currentSilent | currentMutation
      · refine ⟨lag + 1, ?_, ?_⟩
        · have totalCountEq :
              runMutationCount machine (ticks + 1) system.initial =
                runMutationCount machine ticks system.initial := by
            rw [runMutationCount_succ_last, currentSilent, Nat.add_zero]
          rw [totalCountEq, run_succ_last, run_succ_last]
          exact congrArg (FiniteController.step machine) configuration_eq
        · have totalCountEq :
              runMutationCount machine (ticks + 1) system.initial =
                runMutationCount machine ticks system.initial := by
            rw [runMutationCount_succ_last, currentSilent, Nat.add_zero]
          rw [totalCountEq, runMutationCount_succ_last, lag_silent]
          rw [← configuration_eq, currentSilent]
      · have sampleGood := system.contractionRun_good
          (runMutationCount machine ticks system.initial)
        obtain ⟨after, found⟩ := system.finds
          (system.contractionRun
            (runMutationCount machine ticks system.initial)) sampleGood
        obtain ⟨segmentTicks, _withinBound, segmentRun, segmentCount,
            segmentFirst⟩ := seekMutation_exact_run machine found
        have candidateRun :
            run machine (lag + 1)
                (system.contractionRun
                  (runMutationCount machine ticks system.initial)) =
              FiniteController.step machine
                (run machine ticks system.initial) := by
          rw [run_succ_last, ← configuration_eq]
        have candidateCount :
            runMutationCount machine (lag + 1)
                (system.contractionRun
                  (runMutationCount machine ticks system.initial)) = 1 := by
          rw [runMutationCount_succ_last, ← configuration_eq,
            lag_silent, currentMutation]
        have candidateFirst : ∀ earlier, earlier < lag + 1 →
            runMutationCount machine earlier
                (system.contractionRun
                  (runMutationCount machine ticks system.initial)) = 0 := by
          intro earlier earlierLt
          exact runMutationCount_prefix_zero machine
            (system.contractionRun
              (runMutationCount machine ticks system.initial))
            (Nat.le_of_lt_succ earlierLt) lag_silent
        have ticksEq : segmentTicks = lag + 1 := by
          rcases Nat.lt_trichotomy segmentTicks (lag + 1) with
            less | equal | greater
          · have zero := candidateFirst segmentTicks less
            exact False.elim
              (Nat.zero_ne_one (zero.symm.trans segmentCount))
          · exact equal
          · have zero := segmentFirst (lag + 1) greater
            exact False.elim
              (Nat.zero_ne_one (zero.symm.trans candidateCount))
        have afterEq :
            after = FiniteController.step machine
              (run machine ticks system.initial) := by
          rw [← segmentRun, ticksEq, candidateRun]
        have nextEq :
            system.next
                (system.contractionRun
                  (runMutationCount machine ticks system.initial)) = after :=
          advance_eq_of_seekMutation machine system.bound found
        have totalCountEq :
            runMutationCount machine (ticks + 1) system.initial =
              runMutationCount machine ticks system.initial + 1 := by
          rw [runMutationCount_succ_last, currentMutation]
        refine ⟨0, ?_, rfl⟩
        rw [run_succ_last, totalCountEq, contractionRun_succ, nextEq,
          afterEq, run_zero]

/--
At every raw microtick, erasure is exactly the contraction sample indexed by
the cumulative number of successful `Rdx` instructions.
-/
theorem ProductiveSystem.run_erase_eq_countedContractionSample
    {Control : Type} {machine : Machine Control}
    (system : ProductiveSystem machine) (ticks : Nat) :
    (run machine ticks system.initial).cursor.erase =
      (system.contractionRun
        (runMutationCount machine ticks system.initial)).cursor.erase := by
  obtain ⟨lag, configuration_eq, lag_silent⟩ :=
    system.run_countedBetweenSamples ticks
  rw [configuration_eq]
  have projected := run_projects_stepsN machine lag
    (system.contractionRun
      (runMutationCount machine ticks system.initial))
  rw [lag_silent] at projected
  exact (StepsN.eq_of_zero projected).symm

/--
At every raw controller microtick, the bare term is exactly the term at some
contraction sample.  Administrative cursor motion and finite-control work add
no extra terms to the observable trajectory.
-/
theorem ProductiveSystem.run_erase_eq_contractionSample
    {Control : Type} {machine : Machine Control}
    (system : ProductiveSystem machine) (ticks : Nat) :
    ∃ sampleIndex,
      (run machine ticks system.initial).cursor.erase =
        (system.contractionRun sampleIndex).cursor.erase := by
  rcases system.run_betweenSamples ticks with
    ⟨sampleIndex, lag, configuration_eq, lag_silent⟩
  refine ⟨sampleIndex, ?_⟩
  rw [configuration_eq]
  have projected := run_projects_stepsN machine lag
    (system.contractionRun sampleIndex)
  rw [lag_silent] at projected
  exact (StepsN.eq_of_zero projected).symm

/-- A bare-term event occurs on the raw microtrajectory iff it occurs on the
contraction-sampled path. -/
theorem ProductiveSystem.eventually_raw_iff_sampled
    {Control : Type} {machine : Machine Control}
    (system : ProductiveSystem machine) (observes : Term → Bool) :
    (∃ ticks, observes (run machine ticks system.initial).cursor.erase = true) ↔
      ∃ sampleIndex,
        observes (system.contractionRun sampleIndex).cursor.erase = true := by
  constructor
  · rintro ⟨ticks, observed⟩
    obtain ⟨sampleIndex, erasedEq⟩ :=
      system.run_erase_eq_contractionSample ticks
    exact ⟨sampleIndex, by rw [← erasedEq]; exact observed⟩
  · rintro ⟨sampleIndex, observed⟩
    obtain ⟨ticks, reached⟩ := system.contractionRun_reachable sampleIndex
    exact ⟨ticks, by rw [reached]; exact observed⟩

end FiniteController

end PureSFormal.PureS
