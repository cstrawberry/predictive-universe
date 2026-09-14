import PureSFormal.Computation.CookSeedBoundaryReflection

/-!
# Nonboundary prefixes of Rogozhin's first sweep

A nonempty seed-checked boundary has state A, scans data symbol zero, has a
pristine nearest program mark, and has no temporary symbol three to its right.
An excursion violates one of these local conditions until it has finished;
its completed left prefix begins with a marked unary cell and also fails.
-/

namespace PureSFormal.Computation.RogozhinFirstSweepExclusion

open Rogozhin46 RogozhinTagInput RogozhinT2Simulation CookSeedReadbackContext

def LocalBoundary (configuration : Config) : Prop :=
  configuration.state = .A ∧ configuration.current = .s0 ∧
    (stripAudit configuration.left).head? = some .s1 ∧ .s3 ∉ configuration.right

theorem dataTail_no_three (program : Program) (word : List Label) :
    Symbol.s3 ∉ dataTail program word := by
  induction word with
  | nil => simp [dataTail]
  | cons first rest ih => simp [dataTail, ones, ih]

theorem program_reverse_head (program : Program) :
    (programCode program).reverse.head? = some .s1 := by
  unfold programCode separatorCode
  rw [List.reverse_append]
  rfl

theorem decoded_nonempty_local {program : Program} (isT2 : IsT2 program)
    {configuration : Config} {word : List Label} (nonempty : word ≠ [])
    (accepted : (contextOf program).decodeBoundary? configuration = some word) :
    LocalBoundary configuration := by
  obtain ⟨padding, shape, _⟩ :=
    CookSeedBoundaryReflection.contextOf_decodeBoundary?_sound program isT2 configuration word accepted
  cases word with
  | nil => exact (nonempty rfl).elim
  | cons first rest =>
      rw [shape, compileWithPadding_nonempty]
      refine ⟨rfl, rfl, ?_, ?_⟩
      · rw [stripAudit_replicate, stripAudit_programCode_reverse]
        exact program_reverse_head program
      · simp [List.mem_append, List.mem_replicate, dataTail_no_three]

theorem not_local_of_state {configuration : Config} (different : configuration.state ≠ .A) :
    ¬ LocalBoundary configuration := fun candidate => different candidate.1

theorem not_local_of_current {configuration : Config} (different : configuration.current ≠ .s0) :
    ¬ LocalBoundary configuration := fun candidate => different candidate.2.1

theorem not_local_of_three {configuration : Config} (poisoned : Symbol.s3 ∈ configuration.right) :
    ¬ LocalBoundary configuration := fun candidate => candidate.2.2.2 poisoned

theorem marked_left_not_local (state : State) (current : Symbol) (left right : List Symbol) :
    ¬ LocalBoundary ⟨state, current, .s4 :: left, right⟩ := by
  intro candidate
  have impossible : some Symbol.s4 = some .s1 := candidate.2.2.1
  cases impossible

theorem leftPosition_not_local (remaining : List CrossingLetter) (farLeft right : List Symbol)
    (poisoned : Symbol.s3 ∈ right) : ¬ LocalBoundary (leftPosition remaining farLeft right) := by
  cases remaining <;> exact not_local_of_three poisoned

theorem rightPosition_not_local (remaining : List CrossingLetter) (left right : List Symbol) :
    ¬ LocalBoundary (rightPosition remaining left right) := by
  cases remaining with
  | nil => exact not_local_of_current (by intro impossible; cases impossible)
  | cons first rest =>
      cases first <;> exact not_local_of_current (by intro impossible; cases impossible)

def Through (predicate : Config → Prop) (steps : Nat) (start : Config) : Prop :=
  ∀ time, time ≤ steps → predicate (iterate time start)

theorem through_append {predicate : Config → Prop} {firstSteps nextSteps : Nat}
    {start middle : Config} (endpoint : iterate firstSteps start = middle)
    (first : Through predicate firstSteps start) (next : Through predicate nextSteps middle) :
    Through predicate (nextSteps + firstSteps) start := by
  intro time bounded
  by_cases early : time ≤ firstSteps
  · exact first time early
  · have reached : firstSteps ≤ time := Nat.le_of_lt (Nat.lt_of_not_ge early)
    have remainderBound := Nat.sub_le_sub_right bounded firstSteps
    rw [Nat.add_sub_cancel] at remainderBound
    have timeEq : time = (time - firstSteps) + firstSteps := (Nat.sub_add_cancel reached).symm
    rw [timeEq, iterate_add, endpoint]
    exact next _ remainderBound

theorem through_one {predicate : Config → Prop} {start endpoint : Config}
    (step : absorbingStep start = endpoint) (first : predicate start) (last : predicate endpoint) :
    Through predicate 1 start := by
  intro time bounded
  cases time with
  | zero => exact first
  | succ time =>
      have timeZero : time = 0 := Nat.le_antisymm (Nat.le_of_succ_le_succ bounded) (Nat.zero_le _)
      subst time
      rw [Rogozhin46.iterate_succ, Rogozhin46.iterate_zero, step]
      exact last

theorem leftPosition_through (remaining : List CrossingLetter) (farLeft right : List Symbol)
    (poisoned : Symbol.s3 ∈ right) :
    Through (fun configuration => ¬ LocalBoundary configuration) remaining.length
      (leftPosition remaining farLeft right) := by
  induction remaining generalizing right with
  | nil =>
      intro time bounded
      have zero : time = 0 := Nat.le_antisymm bounded (Nat.zero_le _)
      subst time
      exact leftPosition_not_local [] farLeft right poisoned
  | cons first rest ih =>
      intro time bounded
      cases time with
      | zero => exact leftPosition_not_local _ _ _ poisoned
      | succ time =>
          have shorter : time ≤ rest.length := Nat.le_of_succ_le_succ bounded
          rw [iterate_add, Rogozhin46.iterate_succ, Rogozhin46.iterate_zero, step_leftPosition_cons]
          exact ih (first.transient :: right) (List.mem_cons_of_mem _ poisoned) time shorter

theorem rightPosition_through (remaining : List CrossingLetter) (left right : List Symbol) :
    Through (fun configuration => ¬ LocalBoundary configuration) remaining.length
      (rightPosition remaining left right) := by
  induction remaining generalizing left with
  | nil =>
      intro time bounded
      have zero : time = 0 := Nat.le_antisymm bounded (Nat.zero_le _)
      subst time
      exact rightPosition_not_local [] left right
  | cons first rest ih =>
      intro time bounded
      cases time with
      | zero => exact rightPosition_not_local _ _ _
      | succ time =>
          have shorter : time ≤ rest.length := Nat.le_of_succ_le_succ bounded
          rw [iterate_add, Rogozhin46.iterate_succ, Rogozhin46.iterate_zero, step_rightPosition_cons]
          exact ih (first.after :: left) time shorter

theorem excursion_positive_not_local (letters : List CrossingLetter)
    (farLeft : List Symbol) (next : Symbol) (farRight : List Symbol)
    (time : Nat) (positive : 0 < time) (bounded : time ≤ excursionFuel letters) :
    ¬ LocalBoundary (iterate time
      ⟨.A, .s0, beforeCode letters ++ .s1 :: farLeft, next :: farRight⟩) := by
  let leftStart := leftPosition letters farLeft (.s3 :: next :: farRight)
  let leftEnd := leftPosition [] farLeft
    ((transientCode letters).reverse ++ .s3 :: next :: farRight)
  let rightStart := rightPosition letters.reverse (.s2 :: farLeft) (next :: farRight)
  let rightEnd := rightPosition []
    ((afterCode letters.reverse).reverse ++ .s2 :: farLeft) (next :: farRight)
  have leftRun : iterate letters.length leftStart = leftEnd := iterate_leftPosition _ _ _
  have leftSafe := leftPosition_through letters farLeft (.s3 :: next :: farRight) List.mem_cons_self
  have across : absorbingStep leftEnd = rightStart := by
    simpa only [leftEnd, rightStart, transientCode, List.map_reverse] using
      step_across_boundary letters.reverse farLeft (next :: farRight)
  have leftEndSafe : ¬ LocalBoundary leftEnd := by
    rw [← leftRun]
    exact leftSafe _ (Nat.le_refl _)
  have acrossSafe := through_one (predicate := fun configuration => ¬ LocalBoundary configuration) across
    leftEndSafe
    (rightPosition_not_local _ _ _)
  have rightRun : iterate letters.length rightStart = rightEnd := by
    simpa only [List.length_reverse] using iterate_rightPosition letters.reverse (.s2 :: farLeft) (next :: farRight)
  have rightSafe : Through (fun configuration => ¬ LocalBoundary configuration) letters.length rightStart := by
    simpa only [List.length_reverse] using rightPosition_through letters.reverse (.s2 :: farLeft) (next :: farRight)
  have out := step_out_of_rightPosition ((afterCode letters.reverse).reverse ++ .s2 :: farLeft) next farRight
  have outSafe := through_one (predicate := fun configuration => ¬ LocalBoundary configuration)
    out (rightPosition_not_local _ _ _)
    (marked_left_not_local .A next _ farRight)
  have fullRight := through_append rightRun rightSafe outSafe
  have acrossRun : iterate 1 leftEnd = rightStart := across
  have fromLeftEnd := through_append acrossRun acrossSafe fullRight
  have afterStart := through_append leftRun leftSafe fromLeftEnd
  have fuelEq : excursionFuel letters = ((1 + letters.length) + 1 + letters.length) + 1 := by
    simp only [excursionFuel, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
  cases time with
  | zero => exact (Nat.lt_irrefl 0 positive).elim
  | succ time =>
      rw [fuelEq] at bounded
      have remainderBound := Nat.le_of_succ_le_succ bounded
      rw [iterate_add, Rogozhin46.iterate_succ, Rogozhin46.iterate_zero, step_into_leftPosition]
      exact afterStart time remainderBound

theorem firstBoundary_step_positive_not_local (processed : List MarkedLetter)
    (gap : Nat) (rest : List Nat) (farLeft farRight : List Symbol)
    (time : Nat) (positive : 0 < time)
    (bounded : time ≤ excursionFuel (processedCrossing processed ++ plainGap gap)) :
    ¬ LocalBoundary (iterate time (FirstBoundary processed (gap :: rest) farLeft farRight)) := by
  cases rest with
  | nil =>
      simpa only [FirstBoundary, unprocessedNear, beforeCode_append,
        beforeCode_processedCrossing, beforeCode_plainGap, List.length_nil,
        List.replicate_zero, List.nil_append, List.append_nil, List.append_assoc,
        List.cons_append] using
        excursion_positive_not_local (processedCrossing processed ++ plainGap gap)
          farLeft .s5 farRight time positive bounded
  | cons nextGap tail =>
      simpa only [FirstBoundary, unprocessedNear, beforeCode_append,
        beforeCode_processedCrossing, beforeCode_plainGap, List.length_cons,
        List.replicate_succ, List.append_assoc, List.cons_append] using
        excursion_positive_not_local (processedCrossing processed ++ plainGap gap)
          (unprocessedNear (nextGap :: tail) ++ farLeft) .s0
          (List.replicate tail.length .s0 ++ .s5 :: farRight) time positive bounded

theorem firstSweep_positive_not_local (processed : List MarkedLetter) (gaps : List Nat)
    (farLeft farRight : List Symbol) (time : Nat) (positive : 0 < time)
    (bounded : time ≤ firstSweepFuel processed gaps) :
    ¬ LocalBoundary (iterate time (FirstBoundary processed gaps farLeft farRight)) := by
  induction gaps generalizing processed time with
  | nil => exact (Nat.not_le_of_gt positive bounded).elim
  | cons gap rest ih =>
      let excursion := excursionFuel (processedCrossing processed ++ plainGap gap)
      by_cases before : time ≤ excursion
      · exact firstBoundary_step_positive_not_local processed gap rest farLeft farRight time positive before
      · have reached : excursion < time := Nat.lt_of_not_ge before
        have remainderPositive : 0 < time - excursion := Nat.sub_pos_of_lt reached
        have remainderBound := Nat.sub_le_sub_right bounded excursion
        change time - excursion ≤ (firstSweepFuel (advance processed gap) rest + excursion) - excursion at remainderBound
        rw [Nat.add_sub_cancel] at remainderBound
        have timeEq : time = (time - excursion) + excursion :=
          (Nat.sub_add_cancel (Nat.le_of_lt reached)).symm
        rw [timeEq, iterate_add]
        change ¬ LocalBoundary (iterate (time - excursion)
          (iterate (excursionFuel (processedCrossing processed ++ plainGap gap))
            (FirstBoundary processed (gap :: rest) farLeft farRight)))
        rw [iterate_firstBoundary_step]
        exact ih (advance processed gap) _ remainderPositive remainderBound

theorem compiled_firstSweep_positive_not_local (program : Program) (isT2 : IsT2 program)
    (padding : Nat) (first second : Label) (rest : List Label)
    (valid : first ≤ symbolCount program) (time : Nat) (positive : 0 < time)
    (bounded : time ≤ firstSweepFuel [] (paddedProgramGaps program first padding)) :
    ¬ LocalBoundary (iterate time (compileWithPadding program padding (first :: second :: rest))) := by
  rw [compileWithPadding_eq_firstBoundary program isT2 padding first second rest valid]
  exact firstSweep_positive_not_local _ _ _ _ time positive bounded

theorem compiled_firstSweep_rejects_nonempty (program : Program) (isT2 : IsT2 program)
    (padding : Nat) (first second : Label) (rest : List Label)
    (valid : first ≤ symbolCount program) (time : Nat) (positive : 0 < time)
    (bounded : time ≤ firstSweepFuel [] (paddedProgramGaps program first padding))
    (word : List Label) (nonempty : word ≠ []) :
    (contextOf program).decodeBoundary?
      (iterate time (compileWithPadding program padding (first :: second :: rest))) ≠ some word := by
  intro accepted
  exact compiled_firstSweep_positive_not_local program isT2 padding first second rest valid time positive bounded
    (decoded_nonempty_local isT2 nonempty accepted)

end PureSFormal.Computation.RogozhinFirstSweepExclusion
