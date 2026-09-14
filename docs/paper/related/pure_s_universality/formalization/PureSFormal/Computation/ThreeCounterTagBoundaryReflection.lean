import PureSFormal.Computation.ThreeCounterTagOutputBoundary

/-!
# Operational reflection of three-counter tag boundaries

The old queue generation protects the head until each sweep is complete.
After the initial header is consumed, every positive interior microstep has
a data or lane symbol at the head. A live canonical header can therefore
reappear only at an actual primitive-instruction boundary.
-/

namespace PureSFormal.Computation.ThreeCounterTagBoundaryReflection

open ThreeCounter ThreeCounterTag
open CounterMachineTag (tagIterate tagStep tagIterate_add tagIterate_succ_front
  radix radix_is_succ pairWord pairWord_cons)

theorem tagIterate_prefix_head_ne (table : Symbol → List Symbol) (target : Symbol) :
    ∀ (fuel : Nat) (front tail : List Symbol),
      target ∉ front → 2 * fuel < front.length →
      (tagIterate table fuel (front ++ tail)).head? ≠ some target
  | 0, front, tail, absent, bound => by
      cases front with
      | nil => simp at bound
      | cons first rest =>
          have firstNe : first ≠ target := by
            intro equal
            exact absent (equal ▸ List.Mem.head rest)
          simp only [tagIterate, List.cons_append, List.head?_cons, Option.some.injEq]
          exact fun equal => firstNe (Option.some.inj equal)
  | fuel + 1, front, tail, absent, bound => by
      cases front with
      | nil => simp at bound
      | cons first rest =>
          cases rest with
          | nil =>
              simp only [List.length_cons, List.length_nil] at bound
              simp [Nat.mul_succ] at bound
          | cons second rest =>
              rw [tagIterate_succ_front]
              simp only [List.cons_append, tagStep]
              rw [List.append_assoc]
              apply tagIterate_prefix_head_ne table target fuel rest (tail ++ table first)
              · exact fun membership => absent (List.Mem.tail first (List.Mem.tail second membership))
              · simp only [List.length_cons] at bound
                have smaller : 2 * fuel + 2 < rest.length + 2 := by
                  simpa [Nat.mul_succ, Nat.add_assoc] using bound
                exact Nat.lt_of_add_lt_add_right smaller

theorem not_mem_pairWord_of_components (target : Symbol) (pairs : List (Symbol × Symbol))
    (safe : ∀ pair, pair ∈ pairs → pair.1 ≠ target ∧ pair.2 ≠ target) :
    target ∉ pairWord pairs := by
  induction pairs with
  | nil => intro membership; cases membership
  | cons pair pairs ih =>
      rcases pair with ⟨first, second⟩
      intro membership
      simp only [pairWord_cons, List.mem_cons] at membership
      rcases membership with firstEq | secondEq | restMem
      · exact (safe (first, second) (List.Mem.head _)).1 firstEq.symm
      · exact (safe (first, second) (List.Mem.head _)).2 secondEq.symm
      · exact ih (fun pair inRest => safe pair (List.Mem.tail _ inRest)) restMem

theorem head_not_mem_alternativeWord (target control leftCount rightCount scratchCount : Nat) :
    .head target ∉ alternativeWord control leftCount rightCount scratchCount := by
  unfold alternativeWord
  apply not_mem_pairWord_of_components
  intro pair pairMem
  simp only [alternatives, List.mem_append, List.mem_cons,
    List.not_mem_nil, List.mem_replicate] at pairMem
  rcases pairMem with ((((pairEq | impossible) | ⟨_, pairEq⟩) |
      ⟨_, pairEq⟩) | ⟨_, pairEq⟩)
  · subst pair; simp
  · exact False.elim impossible
  · subst pair; simp [positiveSymbol, zeroSymbol]
  · subst pair; simp [positiveSymbol, zeroSymbol]
  · subst pair; simp [positiveSymbol, zeroSymbol]

theorem head_not_mem_dataBlock (program : Program) (target control : Nat)
    (register : Register) (value : Nat) :
    .head target ∉ dataBlock program control register value := by
  unfold dataBlock
  dsimp only
  split <;> simp [dataSymbol]

theorem firstSweep_prefix_ne_head (target : Nat)
    (program : Program) (control left right scratch fuel : Nat)
    (instruction : Instruction) (register : Register)
    (instructionEq : instructionAt program control = instruction)
    (liveEq : instructionLive instruction = true)
    (testedEq : instructionTested? instruction = some register)
    (positive : 0 < fuel)
    (fuelLt : fuel < halfFuel register left right scratch) :
    (tagIterate (production program) fuel
      (canonical program control left right scratch)).head? ≠ some (.head target) := by
  have bound := canonical_prefix_bound_of_tested program control left right scratch fuel
    instruction register instructionEq liveEq testedEq fuelLt
  have headerEq : header program control = [.head control, .filler control] := by
    cases instruction with
    | halt => cases liveEq
    | increment register next => rw [header, instructionEq]
    | decrementJump register next zeroNext => rw [header, instructionEq]
  have canonicalEq : canonical program control left right scratch =
      .head control :: .filler control ::
        (dataBlock program control .left left ++ dataBlock program control .right right ++
          dataBlock program control .scratch scratch) := by
    rw [canonical, headerEq]
    rfl
  rw [canonicalEq] at bound ⊢
  cases fuel with
  | zero => exact False.elim (Nat.not_lt_zero _ positive)
  | succ fuel =>
      rw [tagIterate_succ_front, tagStep]
      apply tagIterate_prefix_head_ne
      · intro membership
        rcases List.mem_append.mp membership with inFirst | inScratch
        · rcases List.mem_append.mp inFirst with inLeft | inRight
          · exact head_not_mem_dataBlock program target control .left left inLeft
          · exact head_not_mem_dataBlock program target control .right right inRight
        · exact head_not_mem_dataBlock program target control .scratch scratch inScratch
      · simp only [List.length_cons] at bound
        have smaller : 2 * fuel + 2 <
            (dataBlock program control .left left ++ dataBlock program control .right right ++
              dataBlock program control .scratch scratch).length + 2 := by
          simpa only [Nat.mul_succ, Nat.add_assoc] using bound
        exact Nat.lt_of_add_lt_add_right smaller

theorem positiveLane_prefix_ne_head (target : Nat)
    (program : Program) (control leftCount rightCount scratchCount fuel : Nat)
    (fuelLt : fuel < 1 + leftCount + rightCount + scratchCount) :
    (tagIterate (production program) fuel
      (alternativeWord control leftCount rightCount scratchCount)).head? ≠ some (.head target) := by
  have bound : 2 * fuel < (alternativeWord control leftCount rightCount scratchCount).length := by
    rw [alternativeWord_length]
    exact Nat.mul_lt_mul_of_pos_left fuelLt (by decide)
  simpa only [List.append_nil] using tagIterate_prefix_head_ne (production program) (.head target)
    fuel (alternativeWord control leftCount rightCount scratchCount) []
    (head_not_mem_alternativeWord target control leftCount rightCount scratchCount) bound

theorem zeroLane_prefix_ne_head (target : Nat)
    (program : Program) (control leftPredecessor rightCount scratchCount fuel : Nat)
    (fuelLt : fuel < 2 + leftPredecessor + rightCount + scratchCount) :
    (tagIterate (production program) fuel
      (alternativeWord control (leftPredecessor + 1) rightCount scratchCount).tail).head? ≠
      some (.head target) := by
  have bound : 2 * fuel <
      (alternativeWord control (leftPredecessor + 1) rightCount scratchCount).tail.length := by
    rw [List.length_tail, alternativeWord_length]
    have doubled := Nat.mul_le_mul_left 2 (Nat.succ_le_of_lt fuelLt)
    have plusTwo : 2 * fuel + 1 + 1 ≤ 2 * (2 + leftPredecessor + rightCount + scratchCount) := by
      rw [show 2 * fuel + 1 + 1 = 2 * (fuel + 1) by simp [Nat.mul_add, Nat.add_assoc]]
      exact doubled
    have subBound := Nat.le_sub_of_add_le plusTwo
    exact Nat.lt_of_succ_le (by
      simpa [Nat.succ_eq_add_one, Nat.mul_add, Nat.add_mul,
        Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using subBound)
  simpa only [List.append_nil] using tagIterate_prefix_head_ne (production program) (.head target)
    fuel (alternativeWord control (leftPredecessor + 1) rightCount scratchCount).tail []
    (fun membership => head_not_mem_alternativeWord target control (leftPredecessor + 1)
      rightCount scratchCount (List.mem_of_mem_tail membership)) bound

theorem twoPhase_prefix_ne_head (target : Nat)
    (table : Symbol → List Symbol) (start middle : List Symbol) (duration fuel : Nat)
    (firstRun : tagIterate table duration start = middle)
    (firstSafe : ∀ firstFuel, 0 < firstFuel → firstFuel < duration →
      (tagIterate table firstFuel start).head? ≠ some (.head target))
    (secondSafe : ∀ secondFuel, secondFuel < duration →
      (tagIterate table secondFuel middle).head? ≠ some (.head target))
    (fuelLt : fuel < duration + duration) (positive : 0 < fuel) :
    (tagIterate table fuel start).head? ≠ some (.head target) := by
  by_cases inFirst : fuel < duration
  · exact firstSafe fuel positive inFirst
  · have durationLe := Nat.le_of_not_gt inFirst
    have fuelEq : fuel = (fuel - duration) + duration := (Nat.sub_add_cancel durationLe).symm
    rw [fuelEq, tagIterate_add, firstRun]
    exact secondSafe (fuel - duration) (Nat.sub_lt_left_of_lt_add durationLe fuelLt)

theorem live_macro_prefix_ne_head (target : Nat)
    (program : Program) (control left right scratch fuel : Nat)
    (instruction : Instruction) (register : Register)
    (instructionEq : instructionAt program control = instruction)
    (liveEq : instructionLive instruction = true)
    (testedEq : instructionTested? instruction = some register)
    (positive : 0 < fuel)
    (fuelLt : fuel < macroFuel register left right scratch) :
    (tagIterate (production program) fuel
      (canonical program control left right scratch)).head? ≠ some (.head target) := by
  cases register with
  | left =>
      cases left with
      | zero =>
          simp only [macroFuel, halfFuel] at fuelLt
          apply twoPhase_prefix_ne_head target (production program)
            (canonical program control 0 right scratch)
            (alternativeWord control 1 (radix right) (radix scratch)).tail
            (2 + radix right + radix scratch) fuel
            (firstSweep_left_zero program control right scratch instruction
              instructionEq liveEq testedEq)
          · intro firstFuel firstPositive firstFuelLt
            exact firstSweep_prefix_ne_head target program control 0 right scratch
              firstFuel instruction .left instructionEq liveEq testedEq firstPositive
              firstFuelLt
          · intro secondFuel secondFuelLt
            exact zeroLane_prefix_ne_head target program control 0 (radix right)
              (radix scratch) secondFuel (by simpa using secondFuelLt)
          · exact fuelLt
          · exact positive
      | succ predecessor =>
          simp only [macroFuel, halfFuel] at fuelLt
          apply twoPhase_prefix_ne_head target (production program)
            (canonical program control (predecessor + 1) right scratch)
            (alternativeWord control (radix predecessor) (radix right)
              (radix scratch))
            (1 + radix predecessor + radix right + radix scratch) fuel
            (firstSweep_left_positive program control predecessor right scratch
              instruction instructionEq liveEq testedEq)
          · intro firstFuel firstPositive firstFuelLt
            exact firstSweep_prefix_ne_head target program control (predecessor + 1)
              right scratch firstFuel instruction .left instructionEq liveEq
              testedEq firstPositive firstFuelLt
          · intro secondFuel secondFuelLt
            exact positiveLane_prefix_ne_head target program control
              (radix predecessor) (radix right) (radix scratch) secondFuel
              secondFuelLt
          · exact fuelLt
          · exact positive
  | right =>
      cases right with
      | zero =>
          simp only [macroFuel, halfFuel] at fuelLt
          obtain ⟨leftPredecessor, radixLeft⟩ := radix_is_succ left
          apply twoPhase_prefix_ne_head target (production program)
            (canonical program control left 0 scratch)
            (alternativeWord control (radix left) 1 (radix scratch)).tail
            (2 + radix left + radix scratch) fuel
            (firstSweep_right_zero program control left scratch instruction
              instructionEq liveEq testedEq)
          · intro firstFuel firstPositive firstFuelLt
            exact firstSweep_prefix_ne_head target program control left 0 scratch
              firstFuel instruction .right instructionEq liveEq testedEq firstPositive
              firstFuelLt
          · intro secondFuel secondFuelLt
            rw [radixLeft] at secondFuelLt ⊢
            exact zeroLane_prefix_ne_head target program control leftPredecessor 1
              (radix scratch) secondFuel (by
                simpa [Nat.add_assoc] using secondFuelLt)
          · exact fuelLt
          · exact positive
      | succ predecessor =>
          simp only [macroFuel, halfFuel] at fuelLt
          apply twoPhase_prefix_ne_head target (production program)
            (canonical program control left (predecessor + 1) scratch)
            (alternativeWord control (radix left) (radix predecessor)
              (radix scratch))
            (1 + radix left + radix predecessor + radix scratch) fuel
            (firstSweep_right_positive program control left predecessor scratch
              instruction instructionEq liveEq testedEq)
          · intro firstFuel firstPositive firstFuelLt
            exact firstSweep_prefix_ne_head target program control left
              (predecessor + 1) scratch firstFuel instruction .right
              instructionEq liveEq testedEq firstPositive firstFuelLt
          · intro secondFuel secondFuelLt
            exact positiveLane_prefix_ne_head target program control (radix left)
              (radix predecessor) (radix scratch) secondFuel secondFuelLt
          · exact fuelLt
          · exact positive
  | scratch =>
      cases scratch with
      | zero =>
          simp only [macroFuel, halfFuel] at fuelLt
          obtain ⟨leftPredecessor, radixLeft⟩ := radix_is_succ left
          apply twoPhase_prefix_ne_head target (production program)
            (canonical program control left right 0)
            (alternativeWord control (radix left) (radix right) 1).tail
            (2 + radix left + radix right) fuel
            (firstSweep_scratch_zero program control left right instruction
              instructionEq liveEq testedEq)
          · intro firstFuel firstPositive firstFuelLt
            exact firstSweep_prefix_ne_head target program control left right 0
              firstFuel instruction .scratch instructionEq liveEq testedEq firstPositive
              firstFuelLt
          · intro secondFuel secondFuelLt
            rw [radixLeft] at secondFuelLt ⊢
            exact zeroLane_prefix_ne_head target program control leftPredecessor
              (radix right) 1 secondFuel (by
                have durationEq :
                    2 + leftPredecessor + radix right + 1 =
                      2 + (leftPredecessor + 1) + radix right := by
                  calc
                    2 + leftPredecessor + radix right + 1 =
                        (2 + leftPredecessor) + (radix right + 1) :=
                      Nat.add_assoc _ _ _
                    _ = (2 + leftPredecessor) + (1 + radix right) :=
                      congrArg (Nat.add (2 + leftPredecessor))
                        (Nat.add_comm (radix right) 1)
                    _ = (2 + leftPredecessor + 1) + radix right :=
                      (Nat.add_assoc _ _ _).symm
                    _ = (2 + (leftPredecessor + 1)) + radix right :=
                      congrArg (fun value => value + radix right)
                        (Nat.add_assoc 2 leftPredecessor 1)
                rw [durationEq]
                exact secondFuelLt)
          · exact fuelLt
          · exact positive
      | succ predecessor =>
          simp only [macroFuel, halfFuel] at fuelLt
          apply twoPhase_prefix_ne_head target (production program)
            (canonical program control left right (predecessor + 1))
            (alternativeWord control (radix left) (radix right)
              (radix predecessor))
            (1 + radix left + radix right + radix predecessor) fuel
            (firstSweep_scratch_positive program control left right predecessor
              instruction instructionEq liveEq testedEq)
          · intro firstFuel firstPositive firstFuelLt
            exact firstSweep_prefix_ne_head target program control left right
              (predecessor + 1) firstFuel instruction .scratch instructionEq
              liveEq testedEq firstPositive firstFuelLt
          · intro secondFuel secondFuelLt
            exact positiveLane_prefix_ne_head target program control (radix left)
              (radix right) (radix predecessor) secondFuel secondFuelLt
          · exact fuelLt
          · exact positive

theorem tagIterate_nil (table : Symbol → List Symbol) (fuel : Nat) :
    tagIterate table fuel [] = [] := by
  induction fuel with
  | zero => rfl
  | succ fuel ih => rw [CounterMachineTag.tagIterate, ih]; rfl

theorem haltPair_head_ne (program : Program) (target fuel : Nat) :
    (tagIterate (production program) fuel [.halt, .sink]).head? ≠ some (.head target) := by
  cases fuel with
  | zero => intro equal; cases equal
  | succ fuel =>
      rw [tagIterate_succ_front]
      change (tagIterate (production program) fuel []).head? ≠ _
      rw [tagIterate_nil]
      intro equal
      cases equal

/-- Any canonical control header observed on the actual typed tag trajectory
occurs at an actual primitive-instruction boundary, with the complete word. -/
theorem tagIterate_head_reflects_source (program : Program) (target : Nat) :
    ∀ fuel initial,
      (tagIterate (production program) fuel (encodeState program initial)).head? =
        some (.head target) →
      ∃ sourceFuel,
        tagIterate (production program) fuel (encodeState program initial) =
          encodeState program (ThreeCounter.run program sourceFuel initial) := by
  intro fuel
  induction fuel using Nat.strongRecOn with
  | ind fuel ih =>
      intro initial observed
      by_cases zero : fuel = 0
      · subst fuel
        exact ⟨0, rfl⟩
      have positive : 0 < fuel := Nat.pos_of_ne_zero zero
      rcases initial with ⟨control, left, right, scratch, status⟩
      cases status with
      | halted => exact False.elim (haltPair_head_ne program target fuel observed)
      | running =>
          let current : State := ⟨control, left, right, scratch, .running⟩
          have reflectLiveMacro (instruction : Instruction) (register : Register)
              (instructionEq : instructionAt program control = instruction)
              (liveEq : instructionLive instruction = true)
              (testedEq : instructionTested? instruction = some register) :
              ∃ sourceFuel,
                tagIterate (production program) fuel (encodeState program current) =
                  encodeState program (ThreeCounter.run program sourceFuel current) := by
            by_cases interior : fuel < macroFuel register left right scratch
            · exact False.elim (live_macro_prefix_ne_head target program control left right scratch fuel
                instruction register instructionEq liveEq testedEq positive interior observed)
            · have durationLe := Nat.le_of_not_gt interior
              have durationPositive := macroFuel_positive register left right scratch
              have remainderLt : fuel - macroFuel register left right scratch < fuel :=
                Nat.sub_lt positive durationPositive
              have fuelEq : fuel = (fuel - macroFuel register left right scratch) +
                  macroFuel register left right scratch := (Nat.sub_add_cancel durationLe).symm
              have boundary := ThreeCounterTag.Numeric.live_macro_step program control left right scratch instruction register
                instructionEq liveEq testedEq
              have followed : tagIterate (production program) fuel (encodeState program current) =
                  tagIterate (production program) (fuel - macroFuel register left right scratch)
                    (encodeState program (ThreeCounter.step program current)) := by
                rw [fuelEq, tagIterate_add, Nat.add_sub_cancel]
                exact congrArg (tagIterate (production program) (fuel - macroFuel register left right scratch)) boundary
              have nextObserved :
                  (tagIterate (production program) (fuel - macroFuel register left right scratch)
                    (encodeState program (ThreeCounter.step program current))).head? = some (.head target) := by
                rw [← followed]
                exact observed
              obtain ⟨nextFuel, nextEq⟩ := ih _ remainderLt (ThreeCounter.step program current) nextObserved
              refine ⟨nextFuel + 1, ?_⟩
              rw [source_run_succ_front]
              exact followed.trans nextEq
          cases instructionEq : instructionAt program control with
          | halt =>
              have encoded : encodeState program current = [.halt, .sink] :=
                ThreeCounterTagOutputBoundary.canonical_halt program control left right scratch instructionEq
              change (tagIterate (production program) fuel (encodeState program current)).head? = _ at observed
              rw [encoded] at observed
              exact False.elim (haltPair_head_ne program target fuel observed)
          | increment register next =>
              exact reflectLiveMacro (.increment register next) register instructionEq rfl rfl
          | decrementJump register next zeroNext =>
              exact reflectLiveMacro (.decrementJump register next zeroNext) register instructionEq rfl rfl

end PureSFormal.Computation.ThreeCounterTagBoundaryReflection
