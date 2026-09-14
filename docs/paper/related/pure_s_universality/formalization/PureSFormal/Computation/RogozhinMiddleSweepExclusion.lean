import PureSFormal.Computation.RogozhinT2Halt

/-!
# Non-boundary observations during the middle Rogozhin sweeps

Middle sweeps may visit state `A` while crossing a separator. Those visits
read `s2` or `s5`; they do not expose the `A,s0` data head required by a
nonempty decoded tag word. The proofs follow the existing executable clocks.
-/

namespace PureSFormal.Computation.RogozhinMiddleSweepExclusion

open Rogozhin46 RogozhinT2Simulation

def NotDataHead (configuration : Config) : Prop :=
  configuration.state ≠ .A ∨ configuration.current ≠ .s0

def PrefixExcluded (duration : Nat) (initial : Config) : Prop :=
  ∀ fuel, fuel < duration → NotDataHead (iterate fuel initial)

theorem prefix_zero (initial : Config) : PrefixExcluded 0 initial :=
  fun fuel less => False.elim (Nat.not_lt_zero fuel less)

theorem prefix_one (initial : Config) (excluded : NotDataHead initial) :
    PrefixExcluded 1 initial := by
  intro fuel less
  cases fuel with
  | zero => exact excluded
  | succ fuel => exact False.elim (Nat.not_lt_zero fuel (Nat.lt_of_succ_lt_succ less))

theorem prefix_prepend (duration : Nat) (initial next : Config)
    (excluded : NotDataHead initial) (stepped : absorbingStep initial = next)
    (later : PrefixExcluded duration next) : PrefixExcluded (duration + 1) initial := by
  intro fuel less
  cases fuel with
  | zero => exact excluded
  | succ fuel =>
      rw [iterate_add, iterate_succ, iterate_zero, stepped]
      exact later fuel (Nat.lt_of_succ_lt_succ less)

theorem prefix_append (first second : Nat) (initial middle : Config)
    (firstRun : iterate first initial = middle)
    (firstSafe : PrefixExcluded first initial) (secondSafe : PrefixExcluded second middle) :
    PrefixExcluded (second + first) initial := by
  intro fuel less
  by_cases before : fuel < first
  · exact firstSafe fuel before
  · have firstLe := Nat.le_of_not_gt before
    have remainderLt : fuel - first < second :=
      Nat.sub_lt_left_of_lt_add firstLe ((Nat.add_comm second first) ▸ less)
    have splitFuel : fuel = (fuel - first) + first := (Nat.sub_add_cancel firstLe).symm
    rw [splitFuel, iterate_add, firstRun]
    exact secondSafe _ remainderLt

theorem DRightBoundary_prefix (remaining : List DScanLetter) (writtenLeft : List Symbol) :
    PrefixExcluded (remaining.length + 1) (DRightBoundary remaining writtenLeft) := by
  induction remaining generalizing writtenLeft with
  | nil => exact prefix_one _ (Or.inl (by intro equal; cases equal))
  | cons letter rest ih =>
      exact prefix_prepend _ _ _ (Or.inl (by intro equal; cases equal))
        (step_DRightBoundary_cons letter rest writtenLeft) (ih _)

theorem BRightBoundary_prefix (remaining : List DScanLetter) (writtenLeft : List Symbol) :
    PrefixExcluded (remaining.length + 1) (BRightBoundary remaining writtenLeft) := by
  induction remaining generalizing writtenLeft with
  | nil => exact prefix_one _ (Or.inl (by intro equal; cases equal))
  | cons letter rest ih =>
      exact prefix_prepend _ _ _ (Or.inl (by intro equal; cases equal))
        (step_BRightBoundary_cons letter rest writtenLeft) (ih _)

theorem activateMark_prefix (front : List DScanLetter) (last : DScanLetter)
    (left : List Symbol) :
    PrefixExcluded (activateMarkFuel (front ++ [last]))
      ⟨.B, .s2, left, dBeforeCode (front ++ [last])⟩ := by
  apply prefix_prepend _ _ _ (Or.inl (by intro equal; cases equal)) (step_B_mark_into_right_scan front last left)
  simpa only [bRightScanFuel, Nat.add_comm 1] using BRightBoundary_prefix (front ++ [last]) (.s3 :: left)

theorem activateOne_prefix (front : List DScanLetter) (last : DScanLetter)
    (left : List Symbol) :
    PrefixExcluded (activateOneFuel (front ++ [last]))
      ⟨.B, .s0, left, dBeforeCode (front ++ [last])⟩ := by
  apply prefix_prepend _ _ _ (Or.inl (by intro equal; cases equal)) (step_B_one_into_right_scan front last left)
  simpa only [bRightScanFuel, Nat.add_comm 1] using BRightBoundary_prefix (front ++ [last]) (.s4 :: left)

theorem separator_prefix (left right : List Symbol) :
    PrefixExcluded 6 ⟨.B, .s1, .s4 :: left, right⟩ := by
  apply prefix_prepend 5 _ ⟨.C, .s4, left, .s2 :: right⟩ (Or.inl (by intro equal; cases equal)) rfl
  apply prefix_prepend 4 _ ⟨.A, .s2, .s5 :: left, right⟩ (Or.inl (by intro equal; cases equal)) rfl
  apply prefix_prepend 3 _ ⟨.A, .s5, left, .s1 :: right⟩ (Or.inr (by intro equal; cases equal)) rfl
  apply prefix_prepend 2 _ ⟨.D, .s1, .s4 :: left, right⟩ (Or.inr (by intro equal; cases equal)) rfl
  apply prefix_prepend 1 _ ⟨.B, .s4, left, .s5 :: right⟩ (Or.inl (by intro equal; cases equal)) rfl
  exact prefix_one _ (Or.inl (by intro equal; cases equal))

theorem BLeftBoundary_excluded (chunks : List BChunk) (next : Symbol)
    (farLeft writtenRight : List Symbol) :
    NotDataHead (BLeftBoundary chunks next farLeft writtenRight) := by
  cases chunks with
  | nil => exact Or.inl (by intro equal; cases equal)
  | cons chunk rest => cases chunk <;> exact Or.inl (by intro equal; cases equal)

theorem BLeftBoundary_prefix (chunks : List BChunk) (next : Symbol)
    (farLeft writtenRight : List Symbol) :
    PrefixExcluded (bLeftFuel chunks) (BLeftBoundary chunks next farLeft writtenRight) := by
  induction chunks generalizing writtenRight with
  | nil => exact prefix_zero _
  | cons chunk rest ih =>
      cases chunk with
      | one =>
          exact prefix_append _ _ _ _ (iterate_BChunk_one rest next farLeft writtenRight)
            (prefix_one _ (BLeftBoundary_excluded _ _ _ _)) (ih _)
      | markedMark =>
          exact prefix_append _ _ _ _ (iterate_BChunk_markedMark rest next farLeft writtenRight)
            (prefix_one _ (BLeftBoundary_excluded _ _ _ _)) (ih _)
      | separatorOne =>
          exact prefix_append _ _ _ _ (iterate_BChunk_separatorOne rest next farLeft writtenRight)
            (separator_prefix _ _) (ih _)

theorem DProductionRightBoundary_prefix (remaining : List DScanLetter) (writtenLeft : List Symbol) :
    PrefixExcluded (remaining.length + 1) (DProductionRightBoundary remaining writtenLeft) :=
  DRightBoundary_prefix remaining writtenLeft

theorem activateDoubleMark_prefix (front : List DScanLetter) (last : DScanLetter)
    (left : List Symbol) :
    PrefixExcluded (activateDoubleMarkFuel (front ++ [last]))
      ⟨.B, .s1, .s1 :: left, dBeforeCode (front ++ [last])⟩ := by
  apply prefix_append 3 _ _ _ (iterate_B_doubleMark_into_D_scan (front ++ [last]) left)
  · apply prefix_prepend 2 _ ⟨.C, .s1, left, .s2 :: dBeforeCode (front ++ [last])⟩
      (Or.inl (by intro equal; cases equal)) rfl
    apply prefix_prepend 1 _ ⟨.D, .s2, .s3 :: left, dBeforeCode (front ++ [last])⟩
      (Or.inl (by intro equal; cases equal)) rfl
    exact prefix_one _ (Or.inl (by intro equal; cases equal))
  · simpa only [dProductionRightScanFuel, Nat.add_comm 1] using
      DProductionRightBoundary_prefix (front ++ [last]) (.s3 :: .s3 :: left)

theorem CProgramBoundary_prefix (remaining : List ProgramRightLetter)
    (writtenLeft : List Symbol) (next : Symbol) (farRight : List Symbol) :
    PrefixExcluded (remaining.length + 1) (CProgramBoundary remaining writtenLeft next farRight) := by
  induction remaining generalizing writtenLeft with
  | nil => exact prefix_one _ (Or.inl (by intro equal; cases equal))
  | cons letter rest ih =>
      exact prefix_prepend _ _ _ (Or.inl (by intro equal; cases equal))
        (step_CProgramBoundary_cons letter rest writtenLeft next farRight) (ih _)

theorem COnesBoundary_prefix (remaining : Nat) (writtenLeft : List Symbol)
    (next : Symbol) (farRight : List Symbol) :
    PrefixExcluded (remaining + 1) (COnesBoundary remaining writtenLeft next farRight) := by
  induction remaining generalizing writtenLeft with
  | zero => exact prefix_one _ (Or.inl (by intro equal; cases equal))
  | succ remaining ih =>
      exact prefix_prepend _ _ _ (Or.inl (by intro equal; cases equal))
        (step_COnesBoundary_succ remaining writtenLeft next farRight) (ih _)

theorem fullMarkExcursion_prefix (program : RogozhinTagInput.Program)
    (processed : List ProgramRightLetter) (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes appended : Nat)
    (next : Symbol) (farLeft : List Symbol) :
    PrefixExcluded (fullMarkExcursionFuel program processed second rest extraOnes appended)
      ⟨.B, .s2, next :: farLeft,
        programRightCode processed ++ List.replicate extraOnes .s0 ++
          RogozhinTagInput.dataCode program (second :: rest) ++ [.s5] ++
          List.replicate appended .s0⟩ := by
  let front := fullMarkCycleFront program processed second rest extraOnes appended
  let last := fullMarkCycleLast appended
  let chunks := fullMarkReturnChunks program processed second rest extraOnes appended
  have hactivate := iterate_activateMark front last (next :: farLeft)
  have activateSafe := activateMark_prefix front last (next :: farLeft)
  have hright := dBeforeCode_fullMarkCycleLetters program processed second rest extraOnes appended
  have hletters : fullMarkCycleLetters program processed second rest extraOnes appended = front ++ [last] := rfl
  rw [← hletters, hright] at hactivate activateSafe
  have hinput := bInputNear_fullMarkReturnChunks program processed second rest extraOnes appended
  change bInputNear chunks = last.after :: (dAfterCode front).reverse at hinput
  have hboundary := BLeftBoundary_eq_of_bInputNear chunks last.after
    (dAfterCode front).reverse .s3 (next :: farLeft) [.s0] hinput
  rw [fullMarkExcursionFuel, ← Nat.add_assoc]
  apply prefix_append _ _ _ _ hactivate activateSafe
  rw [← hboundary]
  apply prefix_append _ _ _ _ (iterate_BLeftBoundary chunks .s3 (next :: farLeft) [.s0])
    (BLeftBoundary_prefix chunks .s3 (next :: farLeft) [.s0])
  exact prefix_one _ (Or.inl (by intro equal; cases equal))

theorem fullOneExcursion_prefix (program : RogozhinTagInput.Program)
    (processed : List ProgramRightLetter) (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes appended : Nat)
    (next : Symbol) (farLeft : List Symbol) :
    PrefixExcluded (fullOneExcursionFuel program processed second rest extraOnes appended)
      ⟨.B, .s0, next :: farLeft,
        programRightCode processed ++ List.replicate extraOnes .s0 ++
          RogozhinTagInput.dataCode program (second :: rest) ++ [.s5] ++
          List.replicate appended .s0⟩ := by
  let front := fullMarkCycleFront program processed second rest extraOnes appended
  let last := fullMarkCycleLast appended
  let chunks := fullMarkReturnChunks program processed second rest extraOnes appended
  have hactivate := iterate_activateOne front last (next :: farLeft)
  have activateSafe := activateOne_prefix front last (next :: farLeft)
  have hright := dBeforeCode_fullMarkCycleLetters program processed second rest extraOnes appended
  have hletters : fullMarkCycleLetters program processed second rest extraOnes appended = front ++ [last] := rfl
  rw [← hletters, hright] at hactivate activateSafe
  have hinput := bInputNear_fullMarkReturnChunks program processed second rest extraOnes appended
  change bInputNear chunks = last.after :: (dAfterCode front).reverse at hinput
  have hboundary := BLeftBoundary_eq_of_bInputNear chunks last.after
    (dAfterCode front).reverse .s4 (next :: farLeft) [.s0] hinput
  rw [fullOneExcursionFuel, ← Nat.add_assoc]
  apply prefix_append _ _ _ _ hactivate activateSafe
  rw [← hboundary]
  apply prefix_append _ _ _ _ (iterate_BLeftBoundary chunks .s4 (next :: farLeft) [.s0])
    (BLeftBoundary_prefix chunks .s4 (next :: farLeft) [.s0])
  exact prefix_one _ (Or.inl (by intro equal; cases equal))

theorem fullDoubleMarkExcursion_prefix (program : RogozhinTagInput.Program)
    (processed : List ProgramRightLetter) (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes appended : Nat)
    (next : Symbol) (farLeft : List Symbol) :
    PrefixExcluded (fullDoubleMarkExcursionFuel program processed second rest extraOnes appended)
      ⟨.B, .s1, .s1 :: next :: farLeft,
        programRightCode processed ++ List.replicate extraOnes .s0 ++
          RogozhinTagInput.dataCode program (second :: rest) ++ [.s5] ++
          List.replicate appended .s0⟩ := by
  let front := fullMarkCycleFront program processed second rest extraOnes appended
  let last := fullMarkCycleLast appended
  let chunks := fullMarkReturnChunks program processed second rest extraOnes appended
  have hactivate := iterate_activateDoubleMark front last (next :: farLeft)
  have activateSafe := activateDoubleMark_prefix front last (next :: farLeft)
  have hright := dBeforeCode_fullMarkCycleLetters program processed second rest extraOnes appended
  have hletters : fullMarkCycleLetters program processed second rest extraOnes appended = front ++ [last] := rfl
  rw [← hletters, hright] at hactivate activateSafe
  have hinput := bInputNear_fullMarkReturnChunks program processed second rest extraOnes appended
  change bInputNear chunks = last.after :: (dAfterCode front).reverse at hinput
  have hboundary := BLeftBoundary_eq_of_bInputNear chunks last.after
    (dAfterCode front).reverse .s3 (.s3 :: next :: farLeft) [.s5] hinput
  rw [fullDoubleMarkExcursionFuel, ← Nat.add_assoc]
  apply prefix_append _ _ _ _ hactivate activateSafe
  rw [← hboundary]
  apply prefix_append _ _ _ _ (iterate_BLeftBoundary chunks .s3 (.s3 :: next :: farLeft) [.s5])
    (BLeftBoundary_prefix chunks .s3 (.s3 :: next :: farLeft) [.s5])
  apply prefix_prepend 1 _
    ⟨.B, .s3, next :: farLeft, .s2 :: bFinishRight chunks [.s5]⟩
    (Or.inl (by intro equal; cases equal)) rfl
  exact prefix_one _ (Or.inl (by intro equal; cases equal))

theorem SelectorBoundary_one_prefix (program : RogozhinTagInput.Program)
    (remaining : List MarkedLetter) (processed : List ProgramRightLetter)
    (second : RogozhinTagInput.Label) (rest : List RogozhinTagInput.Label)
    (extraOnes appended : Nat) (next : Symbol) (farLeft : List Symbol) :
    PrefixExcluded 1 (SelectorBoundary program (.one :: remaining) processed
      second rest extraOnes appended next farLeft) :=
  prefix_one _ (Or.inl (by intro equal; cases equal))

theorem SelectorBoundary_mark_prefix (program : RogozhinTagInput.Program)
    (remaining : List MarkedLetter) (processed : List ProgramRightLetter)
    (second : RogozhinTagInput.Label) (rest : List RogozhinTagInput.Label)
    (extraOnes appended : Nat) (next : Symbol) (farLeft : List Symbol) :
    PrefixExcluded (fullMarkExcursionFuel program processed second rest extraOnes appended)
      (SelectorBoundary program (.mark :: remaining) processed
        second rest extraOnes appended next farLeft) := by
  cases remaining with
  | nil => exact fullMarkExcursion_prefix program processed second rest extraOnes appended next farLeft
  | cons letter remaining =>
      cases letter with
      | one =>
          exact fullMarkExcursion_prefix program processed second rest extraOnes appended .s4
            (processedCode remaining ++ next :: farLeft)
      | mark =>
          exact fullMarkExcursion_prefix program processed second rest extraOnes appended .s2
            (processedCode remaining ++ next :: farLeft)

theorem SelectorBoundary_prefix (program : RogozhinTagInput.Program)
    (remaining : List MarkedLetter) (processed : List ProgramRightLetter)
    (second : RogozhinTagInput.Label) (rest : List RogozhinTagInput.Label)
    (extraOnes appended : Nat) (next : Symbol) (farLeft : List Symbol) :
    PrefixExcluded (selectorFuel program second rest extraOnes processed appended remaining)
      (SelectorBoundary program remaining processed second rest extraOnes appended next farLeft) := by
  induction remaining generalizing processed appended with
  | nil => exact prefix_zero _
  | cons letter remaining ih =>
      cases letter with
      | one =>
          exact prefix_append _ _ _ _
            (iterate_SelectorBoundary_one program remaining processed second rest extraOnes appended next farLeft)
            (SelectorBoundary_one_prefix program remaining processed second rest extraOnes appended next farLeft)
            (ih _ _)
      | mark =>
          exact prefix_append _ _ _ _
            (iterate_SelectorBoundary_mark program remaining processed second rest extraOnes appended next farLeft)
            (SelectorBoundary_mark_prefix program remaining processed second rest extraOnes appended next farLeft)
            (ih _ _)

theorem UnaryOutputBoundary_step_prefix (program : RogozhinTagInput.Program)
    (count : Nat) (processed : List ProgramRightLetter) (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes appended : Nat)
    (next : Symbol) (farLeft : List Symbol) :
    PrefixExcluded (fullOneExcursionFuel program processed second rest extraOnes appended)
      (UnaryOutputBoundary program (count + 1) processed second rest extraOnes appended next farLeft) := by
  cases count with
  | zero => exact fullOneExcursion_prefix program processed second rest extraOnes appended next farLeft
  | succ count =>
      simpa only [UnaryOutputBoundary, List.replicate_succ, List.cons_append] using
        fullOneExcursion_prefix program processed second rest extraOnes appended .s0
          (List.replicate count .s0 ++ next :: farLeft)

theorem UnaryOutputBoundary_prefix (program : RogozhinTagInput.Program)
    (count : Nat) (processed : List ProgramRightLetter) (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes appended : Nat)
    (next : Symbol) (farLeft : List Symbol) :
    PrefixExcluded (unaryOutputFuel program second rest extraOnes processed appended count)
      (UnaryOutputBoundary program count processed second rest extraOnes appended next farLeft) := by
  induction count generalizing processed appended with
  | zero => exact prefix_zero _
  | succ count ih =>
      exact prefix_append _ _ _ _
        (iterate_UnaryOutputBoundary_step program count processed second rest extraOnes appended next farLeft)
        (UnaryOutputBoundary_step_prefix program count processed second rest extraOnes appended next farLeft)
        (ih _ _)

theorem prefix_mono {first second : Nat} {initial : Config}
    (safe : PrefixExcluded second initial) (bound : first ≤ second) : PrefixExcluded first initial :=
  fun fuel less => safe fuel (Nat.lt_of_lt_of_le less bound)

theorem beginThirdSweep_prefix (first : ProgramRightLetter) (remaining : List ProgramRightLetter)
    (farLeft : List Symbol) (next : Symbol) (farRight : List Symbol) :
    PrefixExcluded 3 ⟨.B, .s1, .s0 :: .s1 :: farLeft,
      programRightCode (first :: remaining) ++ next :: farRight⟩ := by
  apply prefix_prepend 2 _
    ⟨.C, .s0, .s1 :: farLeft, .s2 :: programRightCode (first :: remaining) ++ next :: farRight⟩
    (Or.inl (by intro equal; cases equal)) rfl
  apply prefix_prepend 1 _
    ⟨.C, .s2, .s0 :: .s1 :: farLeft, programRightCode (first :: remaining) ++ next :: farRight⟩
    (Or.inl (by intro equal; cases equal)) rfl
  exact prefix_one _ (Or.inl (by intro equal; cases equal))

theorem beginSecondSweep_prefix (front : List DScanLetter) (last : DScanLetter) (left : List Symbol) :
    PrefixExcluded (beginSecondSweepFuel (front ++ [last]))
      ⟨.A, .s5, left, dBeforeCode (front ++ [last])⟩ := by
  apply prefix_prepend _ _ _ (Or.inr (by intro equal; cases equal))
    (step_A_c_into_DRightScan front last left)
  simpa only [dRightScanFuel, Nat.add_comm 1] using DRightBoundary_prefix (front ++ [last]) (.s4 :: left)

theorem outputLabels_prefix (program : RogozhinTagInput.Program)
    (processed : List ProgramRightLetter) (first : RogozhinTagInput.Label)
    (remaining : List RogozhinTagInput.Label) (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes : Nat) (farLeft : List Symbol) :
    PrefixExcluded (outputLabelsFuel program second rest extraOnes processed first remaining)
      ⟨.B, .s0, (outputCells program (first :: remaining)).tail ++ farLeft,
        programRightCode processed ++ List.replicate extraOnes .s0 ++
          RogozhinTagInput.dataCode program (second :: rest) ++ [.s5]⟩ := by
  induction remaining generalizing processed rest first with
  | nil =>
      obtain ⟨predecessor, hweight⟩ := RogozhinTagInput.weight_is_succ program first
      simpa [outputLabelsFuel, outputCells, hweight, UnaryOutputBoundary,
        List.replicate_succ, List.append_assoc] using
        UnaryOutputBoundary_prefix program (RogozhinTagInput.weight program first) processed
          second rest extraOnes 0 .s1 (.s0 :: .s1 :: farLeft)
  | cons next remaining ih =>
      obtain ⟨predecessor, hweight⟩ := RogozhinTagInput.weight_is_succ program first
      let afterUnary : List ProgramRightLetter :=
        List.replicate (RogozhinTagInput.weight program first) .unary ++ processed
      have hunary := iterate_UnaryOutputBoundary program
        (RogozhinTagInput.weight program first) processed second rest extraOnes 0 .s1
        (.s1 :: outputCells program (next :: remaining) ++ farLeft)
      have unarySafe := UnaryOutputBoundary_prefix program
        (RogozhinTagInput.weight program first) processed second rest extraOnes 0 .s1
        (.s1 :: outputCells program (next :: remaining) ++ farLeft)
      have hstartUnary :
          (⟨State.B, Symbol.s0,
            (outputCells program (first :: next :: remaining)).tail ++ farLeft,
            programRightCode processed ++ List.replicate extraOnes .s0 ++
              RogozhinTagInput.dataCode program (second :: rest) ++ [.s5]⟩ : Config) =
          UnaryOutputBoundary program (RogozhinTagInput.weight program first) processed second rest
            extraOnes 0 .s1 (.s1 :: outputCells program (next :: remaining) ++ farLeft) := by
        simp [outputCells, UnaryOutputBoundary, hweight, List.replicate_succ, List.append_assoc]
      rw [outputLabelsFuel, ← Nat.add_assoc, hstartUnary]
      apply prefix_append _ _ _ _ hunary unarySafe
      obtain ⟨nextTail, hnextCells⟩ := outputCells_cons_shape program next remaining
      have hafterUnary :
          UnaryOutputBoundary program 0 afterUnary second rest extraOnes
              (0 + RogozhinTagInput.weight program first) .s1
              (.s1 :: outputCells program (next :: remaining) ++ farLeft) =
            ⟨.B, .s1, .s1 :: .s0 :: ((outputCells program (next :: remaining)).tail ++ farLeft),
              programRightCode afterUnary ++ List.replicate extraOnes .s0 ++
                RogozhinTagInput.dataCode program (second :: rest) ++ [.s5] ++
                List.replicate (RogozhinTagInput.weight program first) .s0⟩ := by
        rw [hnextCells]
        simp [UnaryOutputBoundary, afterUnary, List.append_assoc]
      rw [hafterUnary]
      apply prefix_append _ _ _ _
        (iterate_completeOutputLabel program afterUnary second rest extraOnes first .s0
          ((outputCells program (next :: remaining)).tail ++ farLeft))
        (fullDoubleMarkExcursion_prefix program afterUnary second rest extraOnes
          (RogozhinTagInput.weight program first) .s0
          ((outputCells program (next :: remaining)).tail ++ farLeft))
      simpa only [List.cons_append] using ih (.mark :: .mark :: afterUnary) next (rest ++ [first])

theorem concreteSelector_withCarry_prefix (program : RogozhinTagInput.Program)
    (first second : RogozhinTagInput.Label) (rest : List RogozhinTagInput.Label)
    (extraOnes : Nat) :
    PrefixExcluded (concreteSelectorTimeWithCarry program first second rest extraOnes)
      ⟨.B, .s2, markedNear (programGapTail program first) ++ (upperProgramCode program first).reverse,
        List.replicate extraOnes .s0 ++ RogozhinTagInput.dataCode program (second :: rest) ++ [.s5]⟩ := by
  obtain ⟨next, farLeft, hupper⟩ := upperProgramCode_reverse_eq_cons program first
  obtain ⟨gapRest, hgap⟩ := programGaps_eq_zero_cons program first
  simpa [concreteSelectorTimeWithCarry, SelectorBoundary, selectorRight,
    hgap, hupper, programGapTail, selectorCells, processedCode_selectorCells,
    programRightCode, MarkedLetter.crossing, CrossingLetter.before, List.append_assoc] using
    SelectorBoundary_prefix program (selectorCells (programGaps program first)) []
      second rest extraOnes 0 next farLeft

theorem beginSecondSweep_encoded_prefix (program : RogozhinTagInput.Program)
    (second : RogozhinTagInput.Label) (rest : List RogozhinTagInput.Label) (left : List Symbol) :
    PrefixExcluded (concreteBeginSecondSweepTime program second rest)
      ⟨.A, .s5, left, followingData program second rest⟩ := by
  obtain ⟨front, hfront⟩ := dataScanLetters_eq_append_one program second rest
  rw [concreteBeginSecondSweepTime, followingData_eq_dBeforeCode, hfront]
  exact beginSecondSweep_prefix front .one left

theorem secondSweep_toProgram_withCarry_prefix (program : RogozhinTagInput.Program)
    (first second : RogozhinTagInput.Label) (rest : List RogozhinTagInput.Label) (carried : Nat) :
    PrefixExcluded (secondSweepToProgramFuelWithCarry program carried second rest)
      ⟨.A, .s5, List.replicate carried .s4 ++ markedNear (programGaps program first) ++
        (upperProgramCode program first).reverse, followingData program second rest⟩ := by
  obtain ⟨dataFront, hdata, hbegin⟩ := iterate_beginSecondSweep_encoded program second rest
    (List.replicate carried .s4 ++ markedNear (programGaps program first) ++
      (upperProgramCode program first).reverse)
  obtain ⟨gapRest, hgap⟩ := programGaps_eq_zero_cons program first
  let chunks := secondSweepBChunksWithCarry program carried second rest
  have hinput : bInputNear chunks = .s4 ::
      ((dAfterCode dataFront).reverse ++ .s4 :: List.replicate carried .s4) := by
    unfold chunks secondSweepBChunksWithCarry
    rw [bInputNear_encodedBChunks, hdata]
    simp [dAfterCode, DScanLetter.after, List.map_reverse,
      List.reverse_append, List.replicate_succ, List.append_assoc]
  have hboundary := BLeftBoundary_eq_of_bInputNear chunks .s4
    ((dAfterCode dataFront).reverse ++ .s4 :: List.replicate carried .s4) .s2
    (markedNear gapRest ++ (upperProgramCode program first).reverse) [.s5] hinput
  have hconfig :
      (⟨State.B, Symbol.s4,
        (dAfterCode dataFront).reverse ++ .s4 ::
          (List.replicate carried .s4 ++ markedNear (programGaps program first) ++
            (upperProgramCode program first).reverse), [.s5]⟩ : Config) =
      BLeftBoundary chunks .s2 (markedNear gapRest ++ (upperProgramCode program first).reverse) [.s5] := by
    rw [hboundary]
    simp [hgap, markedNear, List.append_assoc]
  apply prefix_append _ _ _ _ hbegin (beginSecondSweep_encoded_prefix program second rest _)
  rw [hconfig]
  exact BLeftBoundary_prefix chunks .s2 _ [.s5]

theorem thirdSweep_coreWithCarry_prefix (program : RogozhinTagInput.Program)
    (carried : Nat) (second : RogozhinTagInput.Label) (nextWord : List RogozhinTagInput.Label)
    (processed : List ProgramRightLetter) (upper : List Symbol)
    (processedHead : ProgramRightLetter) (processedTail : List ProgramRightLetter)
    (next : RogozhinTagInput.Label) (nextRest : List RogozhinTagInput.Label)
    (hprocessed : processed = processedHead :: processedTail)
    (hnextWord : nextWord = next :: nextRest) :
    PrefixExcluded (thirdSweepFuelWithCarry program carried second processed)
      ⟨.B, .s1, .s0 :: .s1 :: upper, programRightCode processed ++
        List.replicate (carried + 1) .s0 ++ RogozhinTagInput.dataCode program (second :: nextWord)⟩ := by
  have hbegin := iterate_beginThirdSweep processedHead processedTail upper .s0
    (List.replicate carried .s0 ++ RogozhinTagInput.dataCode program (second :: nextWord))
  have beginSafe := beginThirdSweep_prefix processedHead processedTail upper .s0
    (List.replicate carried .s0 ++ RogozhinTagInput.dataCode program (second :: nextWord))
  rw [← hprocessed] at hbegin beginSafe
  have hbegin' : iterate 3
      ⟨State.B, Symbol.s1, .s0 :: .s1 :: upper, programRightCode processed ++
        List.replicate (carried + 1) .s0 ++ RogozhinTagInput.dataCode program (second :: nextWord)⟩ =
      CProgramBoundary processed (.s1 :: .s0 :: .s1 :: upper) .s0
        (List.replicate carried .s0 ++ RogozhinTagInput.dataCode program (second :: nextWord)) := by
    simpa [List.replicate_succ, List.append_assoc] using hbegin
  rw [thirdSweepFuelWithCarry]
  simp only [← Nat.add_assoc]
  apply prefix_append _ _ _ _ hbegin'
  · simpa [List.replicate_succ, List.append_assoc] using beginSafe
  · apply prefix_append _ _ _ _ (iterate_CProgramBoundary processed _ _ _)
      (prefix_mono (CProgramBoundary_prefix processed _ _ _) (Nat.le_succ _))
    let writtenLeft := (restoredProgramCode processed).reverse ++ .s1 :: .s0 :: .s1 :: upper
    let onesCount := carried + 1 + RogozhinTagInput.weight program second
    have hdataScanShape :
        (⟨State.C, Symbol.s0, writtenLeft,
          List.replicate carried .s0 ++ RogozhinTagInput.dataCode program (second :: nextWord)⟩ : Config) =
        COnesBoundary onesCount writtenLeft .s5 (RogozhinTagInput.dataCode program nextWord) := by
      obtain ⟨secondPredecessor, hsecondWeight⟩ := RogozhinTagInput.weight_is_succ program second
      rw [hnextWord]
      simp [onesCount, COnesBoundary, dataCode_cons_nonempty, hsecondWeight,
        List.replicate_succ, ← List.replicate_append_replicate, Nat.add_assoc, List.append_assoc]
    rw [Nat.add_assoc 1 carried 1, Nat.add_assoc 1 (carried + 1)]
    change PrefixExcluded (1 + onesCount) ⟨.C, .s0, writtenLeft,
      List.replicate carried .s0 ++ RogozhinTagInput.dataCode program (second :: nextWord)⟩
    rw [hdataScanShape, Nat.add_comm 1]
    exact COnesBoundary_prefix onesCount writtenLeft .s5 _

theorem selectedProductionBoundary_withCarry_prefix (program : RogozhinTagInput.Program)
    (first second : RogozhinTagInput.Label) (rest : List RogozhinTagInput.Label)
    (extraOnes : Nat) (hfirst : first < RogozhinTagInput.symbolCount program) :
    let distinguished := RogozhinTagInput.distinguished program
    let payload := (RogozhinTagInput.productionAt program first).drop 2
    let processed := selectedProgramRight program first
    let difference := RogozhinTagInput.weight program distinguished - RogozhinTagInput.weight program first
    PrefixExcluded (selectedProductionFuelWithCarry program first second rest extraOnes)
      (UnaryOutputBoundary program difference processed second rest extraOnes
        (RogozhinTagInput.weight program first) .s1
        (.s1 :: outputCells program (distinguished :: payload) ++
          (upperProgramCode program (first + 1)).reverse)) := by
  dsimp only
  let distinguished := RogozhinTagInput.distinguished program
  let payload := (RogozhinTagInput.productionAt program first).drop 2
  let processed := selectedProgramRight program first
  let difference := RogozhinTagInput.weight program distinguished - RogozhinTagInput.weight program first
  let afterDifference := List.replicate difference .unary ++ processed
  have hfirstLe : first ≤ distinguished := Nat.le_sub_one_of_lt hfirst
  have hweightSum : RogozhinTagInput.weight program first + difference =
      RogozhinTagInput.weight program distinguished := Nat.add_sub_of_le (weight_mono program hfirstLe)
  have hunary := iterate_UnaryOutputBoundary program difference processed second rest extraOnes
    (RogozhinTagInput.weight program first) .s1
    (.s1 :: outputCells program (distinguished :: payload) ++ (upperProgramCode program (first + 1)).reverse)
  have unarySafe := UnaryOutputBoundary_prefix program difference processed second rest extraOnes
    (RogozhinTagInput.weight program first) .s1
    (.s1 :: outputCells program (distinguished :: payload) ++ (upperProgramCode program (first + 1)).reverse)
  rw [selectedProductionFuelWithCarry, ← Nat.add_assoc]
  apply prefix_append _ _ _ _ hunary unarySafe
  rw [hweightSum]
  obtain ⟨outputTail, houtput⟩ := outputCells_cons_shape program distinguished payload
  have hzero : UnaryOutputBoundary program 0 afterDifference second rest extraOnes
      (RogozhinTagInput.weight program distinguished) .s1
      (.s1 :: outputCells program (distinguished :: payload) ++ (upperProgramCode program (first + 1)).reverse) =
      ⟨.B, .s1, .s1 :: .s0 :: ((outputCells program (distinguished :: payload)).tail ++
        (upperProgramCode program (first + 1)).reverse),
        programRightCode afterDifference ++ List.replicate extraOnes .s0 ++
          RogozhinTagInput.dataCode program (second :: rest) ++ [.s5] ++
          List.replicate (RogozhinTagInput.weight program distinguished) .s0⟩ := by
    rw [houtput]
    simp [UnaryOutputBoundary, List.append_assoc]
  rw [hzero]
  apply prefix_append _ _ _ _
    (iterate_completeOutputLabel program afterDifference second rest extraOnes distinguished .s0
      ((outputCells program (distinguished :: payload)).tail ++ (upperProgramCode program (first + 1)).reverse))
    (fullDoubleMarkExcursion_prefix program afterDifference second rest extraOnes
      (RogozhinTagInput.weight program distinguished) .s0
      ((outputCells program (distinguished :: payload)).tail ++ (upperProgramCode program (first + 1)).reverse))
  simpa only [List.cons_append] using outputLabels_prefix program
    (.mark :: .mark :: afterDifference) distinguished payload second (rest ++ [distinguished]) extraOnes
    (upperProgramCode program (first + 1)).reverse

theorem selectorAndProduction_withCarry_prefix (program : RogozhinTagInput.Program)
    (hT2 : RogozhinTagInput.IsT2 program) (first second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) (extraOnes : Nat)
    (hfirst : first < RogozhinTagInput.symbolCount program) :
    PrefixExcluded (selectorAndProductionFuelWithCarry program first second rest extraOnes)
      ⟨.B, .s2, markedNear (programGapTail program first) ++ (upperProgramCode program first).reverse,
        List.replicate extraOnes .s0 ++ RogozhinTagInput.dataCode program (second :: rest) ++ [.s5]⟩ := by
  obtain ⟨selectedCurrent, selectedLeft, hselectedCode, hselector⟩ :=
    iterate_concreteSelector_withCarry program hT2 first second rest extraOnes (Nat.le_of_lt hfirst)
  obtain ⟨entryCurrent, entryLeft, hentryCode, hentry⟩ :=
    selectedProduction_entry_withCarry program hT2 first second rest extraOnes hfirst
  have hcurrent : selectedCurrent = entryCurrent := by
    rw [hentryCode] at hselectedCode
    exact (List.cons.inj hselectedCode).1.symm
  have hleft : selectedLeft = entryLeft := by
    rw [hentryCode] at hselectedCode
    exact (List.cons.inj hselectedCode).2.symm
  subst selectedCurrent
  subst selectedLeft
  apply prefix_append _ _ _ _ hselector (concreteSelector_withCarry_prefix program first second rest extraOnes)
  rw [hentry]
  exact selectedProductionBoundary_withCarry_prefix program first second rest extraOnes hfirst

theorem thirdSweep_withCarry_prefix (program : RogozhinTagInput.Program)
    (hT2 : RogozhinTagInput.IsT2 program) (carried : Nat)
    (first second : RogozhinTagInput.Label) (rest : List RogozhinTagInput.Label)
    (hfirst : first < RogozhinTagInput.symbolCount program) :
    let distinguished := RogozhinTagInput.distinguished program
    let payload := (RogozhinTagInput.productionAt program first).drop 2
    let processed := selectedFinalProcessed program first
    PrefixExcluded (thirdSweepFuelWithCarry program carried second processed)
      ⟨.B, .s1, .s0 :: .s1 :: (upperProgramCode program (first + 1)).reverse,
        programRightCode processed ++ List.replicate (carried + 1) .s0 ++
          RogozhinTagInput.dataCode program
            (second :: ((rest ++ [distinguished]) ++ outputCompleted distinguished payload)) ++ [.s5] ++
          List.replicate (RogozhinTagInput.weight program (outputLast distinguished payload)) .s0⟩ := by
  dsimp only
  let distinguished := RogozhinTagInput.distinguished program
  let payload := (RogozhinTagInput.productionAt program first).drop 2
  let afterDifference := List.replicate
    (RogozhinTagInput.weight program distinguished - RogozhinTagInput.weight program first)
    .unary ++ selectedProgramRight program first
  let processed := selectedFinalProcessed program first
  let nextWord := rest ++ RogozhinTagInput.productionAt program first
  have hdata := selectedProductionData_eq program hT2 first second rest hfirst
  obtain ⟨processedHead, processedTail, hprocessed⟩ := outputFinishProcessed_nonempty program
    (.mark :: .mark :: afterDifference) distinguished payload
  obtain ⟨next, nextSecond, nextRest, hnextWord⟩ := nextTagWord_two_prefix program hT2 first rest hfirst
  have hcore := thirdSweep_coreWithCarry_prefix program carried second nextWord processed
    (upperProgramCode program (first + 1)).reverse processedHead processedTail next
    (nextSecond :: nextRest) hprocessed hnextWord
  simp only [List.append_assoc] at hdata ⊢
  rw [hdata]
  simpa only [List.append_assoc] using hcore

/-- Complete middle segment of a nonhalting T2 macro, starting on the old
separator and excluding the returned tag boundary. -/
theorem nonhalting_middle_prefix (program : RogozhinTagInput.Program)
    (hT2 : RogozhinTagInput.IsT2 program) (carried : Nat)
    (first second : RogozhinTagInput.Label) (rest : List RogozhinTagInput.Label)
    (hfirst : first < RogozhinTagInput.symbolCount program) :
    PrefixExcluded
      (thirdSweepFuelWithCarry program carried second (selectedFinalProcessed program first) +
        (selectorAndProductionFuelWithCarry program first second rest (carried + 1) +
          secondSweepToProgramFuelWithCarry program carried second rest))
      ⟨.A, .s5, List.replicate carried .s4 ++ markedNear (programGaps program first) ++
        (upperProgramCode program first).reverse, followingData program second rest⟩ := by
  rw [← Nat.add_assoc]
  apply prefix_append _ _ _ _ (iterate_secondSweep_toProgram_withCarry program first second rest carried)
    (secondSweep_toProgram_withCarry_prefix program first second rest carried)
  apply prefix_append _ _ _ _ (iterate_selectorAndProduction_withCarry program hT2 first second rest (carried + 1) hfirst)
    (selectorAndProduction_withCarry_prefix program hT2 first second rest (carried + 1) hfirst)
  exact thirdSweep_withCarry_prefix program hT2 carried first second rest hfirst

/-- The middle segment for the halting tag label also has no nonempty
data-head observation, including its final pre-halt selector endpoint. -/
theorem halting_middle_prefix (program : RogozhinTagInput.Program)
    (hT2 : RogozhinTagInput.IsT2 program) (carried : Nat)
    (second : RogozhinTagInput.Label) (rest : List RogozhinTagInput.Label) :
    let halt := RogozhinTagInput.haltLabel program
    PrefixExcluded
      (1 + (concreteSelectorTimeWithCarry program halt second rest (carried + 1) +
        secondSweepToProgramFuelWithCarry program carried second rest))
      ⟨.A, .s5, List.replicate carried .s4 ++ markedNear (programGaps program halt) ++
        (upperProgramCode program halt).reverse, followingData program second rest⟩ := by
  dsimp only
  let halt := RogozhinTagInput.haltLabel program
  rw [← Nat.add_assoc]
  apply prefix_append _ _ _ _ (iterate_secondSweep_toProgram_withCarry program halt second rest carried)
    (secondSweep_toProgram_withCarry_prefix program halt second rest carried)
  obtain ⟨next, farLeft, upperShape, selector⟩ := iterate_concreteSelector_withCarry program hT2
    halt second rest (carried + 1) (Nat.le_refl _)
  apply prefix_append _ _ _ _ selector (concreteSelector_withCarry_prefix program halt second rest (carried + 1))
  exact prefix_one _ (Or.inl (by intro equal; cases equal))

theorem halted_notDataHead (configuration : Config) (halted : Halted configuration) :
    NotDataHead configuration := by
  apply Or.inl
  intro stateA
  unfold Halted at halted
  rw [stateA] at halted
  cases currentEq : configuration.current <;> rw [currentEq] at halted <;> cases halted

/-- Absorbing halts cannot subsequently expose a nonempty data head. -/
theorem halted_prefix (configuration : Config) (halted : Halted configuration) (duration : Nat) :
    PrefixExcluded duration configuration := by
  intro fuel _
  rw [iterate_of_halted halted]
  exact halted_notDataHead configuration halted

end PureSFormal.Computation.RogozhinMiddleSweepExclusion
