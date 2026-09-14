import PureSFormal.Cook.Macroperiod

/-!
# Exact cleanup of certified Rogozhin halt boundaries

The certificate below is the structural content used by Appendix B.4.2.
Arbitrary finite left and right side shapes are retained explicitly.  The
pre-residue word consists of a nonempty sequence of complete eight-symbol
blocks followed by the terminal five-symbol suffix determined by whether the
represented right side is empty and by the boundary form.  Every block is an
unindexed `H/L/R` block at one of the two halt states.
-/

namespace PureSFormal.Cook

namespace HaltCleanup

/-- The two Rogozhin states whose read-3 cells halt. -/
inductive HaltState where
  | C | D
  deriving DecidableEq, Repr

namespace HaltState

def toMachineState : HaltState → MachineState
  | .C => .C
  | .D => .D

end HaltState

/-- The three readable halt-boundary forms from (H1). -/
inductive BoundaryForm where
  | canonical | leftArrival | rightArrival
  deriving DecidableEq, Repr

/-- Unindexed Cook symbol of a specified family and halt state. -/
def unindexed (state : HaltState) : Family → TagSymbol
  | .H => .head state.toMachineState
  | .L => .left state.toMachineState
  | .R => .right state.toMachineState

/-- One complete indexed Cook row. -/
def row (state : HaltState) (family : Family) : List TagSymbol :=
  indices.map fun index => .indexed family state.toMachineState index

/-- Positions `1,2,3` of a complete indexed row. -/
def rowPrefixThree (state : HaltState) (family : Family) : List TagSymbol :=
  [.indexed family state.toMachineState .j1,
   .indexed family state.toMachineState .j2,
   .indexed family state.toMachineState .j3]

/-- Positions `4,...,8` of a complete indexed row: residue (D8). -/
def rowSuffixFive (state : HaltState) (family : Family) : List TagSymbol :=
  [.indexed family state.toMachineState .j4,
   .indexed family state.toMachineState .j5,
   .indexed family state.toMachineState .j6,
   .indexed family state.toMachineState .j7,
   .indexed family state.toMachineState .j8]

@[simp]
theorem row_eq_prefix_append_suffix (state : HaltState) (family : Family) :
    row state family =
      rowPrefixThree state family ++ rowSuffixFive state family := by
  cases state <;> cases family <;> rfl

@[simp]
theorem row_length (state : HaltState) (family : Family) :
    (row state family).length = 8 := by
  cases state <;> cases family <;> rfl

@[simp]
theorem rowSuffixFive_length (state : HaltState) (family : Family) :
    (rowSuffixFive state family).length = 5 := by
  cases state <;> cases family <;> rfl

@[simp]
theorem production_unindexed (state : HaltState) (family : Family) :
    production (unindexed state family) = row state family := by
  cases state <;> cases family <;> rfl

/-- Every indexed `j=4` symbol at either halt state has empty production. -/
@[simp]
theorem production_halt_j4 (state : HaltState) (family : Family) :
    production (.indexed family state.toMachineState .j4) = [] := by
  cases state <;> cases family <;> rfl

/-- An explicit eight-symbol unindexed block. -/
structure FamilyBlock where
  first : Family
  second : Family
  third : Family
  fourth : Family
  fifth : Family
  sixth : Family
  seventh : Family
  eighth : Family
  deriving DecidableEq, Repr

namespace FamilyBlock

def word (state : HaltState) (block : FamilyBlock) : List TagSymbol :=
  [unindexed state block.first,
   unindexed state block.second,
   unindexed state block.third,
   unindexed state block.fourth,
   unindexed state block.fifth,
   unindexed state block.sixth,
   unindexed state block.seventh,
   unindexed state block.eighth]

@[simp]
theorem word_length (state : HaltState) (block : FamilyBlock) :
    (block.word state).length = 8 := rfl

end FamilyBlock

/-- Concatenate a sequence of complete unindexed blocks. -/
def blocksWord (state : HaltState) : List FamilyBlock → List TagSymbol
  | [] => []
  | block :: blocks => block.word state ++ blocksWord state blocks

/-- Selected family of each block, in chronological sweep order. -/
def selectedFamilies (blocks : List FamilyBlock) : List Family :=
  blocks.map FamilyBlock.first

/-- Concatenate complete indexed rows for a family sequence. -/
def rowsWord (state : HaltState) : List Family → List TagSymbol
  | [] => []
  | family :: families => row state family ++ rowsWord state families

@[simp]
theorem blocksWord_length (state : HaltState) (blocks : List FamilyBlock) :
    (blocksWord state blocks).length = 8 * blocks.length := by
  induction blocks with
  | nil => rfl
  | cons block blocks ih =>
      simp only [blocksWord, List.length_append, FamilyBlock.word_length,
        ih, List.length_cons, Nat.mul_succ, Nat.add_comm]

@[simp]
theorem selectedFamilies_length (blocks : List FamilyBlock) :
    (selectedFamilies blocks).length = blocks.length := by
  simp only [selectedFamilies, List.length_map]

@[simp]
theorem rowsWord_cons (state : HaltState) (family : Family)
    (families : List Family) :
    rowsWord state (family :: families) =
      row state family ++ rowsWord state families := rfl

/-- Certified H1/H2/H3 cleanup family with arbitrary finite side shapes. -/
structure Certified where
  state : HaltState
  form : BoundaryForm
  leftSide : List MachineSymbol
  rightSide : List MachineSymbol
  blocks : List FamilyBlock
  blocks_nonempty : blocks ≠ []

namespace Certified

/-- H3: `R` iff the represented right side is nonempty, otherwise `L`. -/
def terminalFamily (certificate : Certified) : Family :=
  match certificate.rightSide with
  | [] => .L
  | _ :: _ => .R

/-- The exact five-symbol terminal suffix `U` of (H2). -/
def terminalWord (certificate : Certified) : List TagSymbol :=
  match certificate.rightSide, certificate.form with
  | [], .rightArrival =>
      [unindexed certificate.state .L,
       unindexed certificate.state .R,
       unindexed certificate.state .R,
       unindexed certificate.state .R,
       unindexed certificate.state .R]
  | [], _ => List.replicate 5 (unindexed certificate.state .L)
  | _ :: _, _ => List.replicate 5 (unindexed certificate.state .R)

/-- The certified halting word before its first complete sweep. -/
def word (certificate : Certified) : List TagSymbol :=
  blocksWord certificate.state certificate.blocks ++ certificate.terminalWord

/-- Number `a=floor(m/8)` of complete blocks in each of the first two sweeps. -/
def sweepCount (certificate : Certified) : Nat := certificate.blocks.length

/-- Five-symbol residue (D8). -/
def residue (certificate : Certified) : List TagSymbol :=
  rowSuffixFive certificate.state certificate.terminalFamily

@[simp]
theorem terminalWord_length (certificate : Certified) :
    certificate.terminalWord.length = 5 := by
  rcases certificate with ⟨state, form, leftSide, rightSide, blocks, hblocks⟩
  cases rightSide <;> cases form <;> rfl

@[simp]
theorem terminalWord_head (certificate : Certified) :
    certificate.terminalWord =
      unindexed certificate.state certificate.terminalFamily ::
        certificate.terminalWord.tail := by
  rcases certificate with ⟨state, form, leftSide, rightSide, blocks, hblocks⟩
  cases rightSide <;> cases form <;> rfl

@[simp]
theorem word_length (certificate : Certified) :
    certificate.word.length = 8 * certificate.sweepCount + 5 := by
  rw [word, List.length_append, blocksWord_length, terminalWord_length]
  rfl

theorem sweepCount_pos (certificate : Certified) :
    0 < certificate.sweepCount := by
  cases hblocks : certificate.blocks with
  | nil => exact (certificate.blocks_nonempty hblocks).elim
  | cons block blocks =>
      rw [sweepCount, hblocks]
      exact Nat.zero_lt_succ blocks.length

@[simp]
theorem word_length_div_eight (certificate : Certified) :
    certificate.word.length / 8 = certificate.sweepCount := by
  rw [word_length, Nat.add_comm, Nat.mul_comm 8]
  rw [Nat.add_mul_div_right 5 certificate.sweepCount (by decide : 0 < 8)]
  rw [Nat.div_eq_of_lt (by decide : 5 < 8), Nat.zero_add]

@[simp]
theorem residue_length (certificate : Certified) :
    certificate.residue.length = 5 := by
  rw [residue, rowSuffixFive_length]

end Certified

/-- One valid deletion-eight tag transition. -/
def TagStep (source target : List TagSymbol) : Prop :=
  Macroperiod.tagStep? source = some target

/-- Exactly counted valid deletion-eight transitions. -/
inductive TagStepsN : Nat → List TagSymbol → List TagSymbol → Prop where
  | zero (word : List TagSymbol) : TagStepsN 0 word word
  | succ {source middle target : List TagSymbol} {steps : Nat} :
      TagStep source middle →
      TagStepsN steps middle target →
      TagStepsN (steps + 1) source target

namespace TagStepsN

/-- Concatenate two exactly counted tag trajectories. -/
theorem append {left middle right : List TagSymbol} {m n : Nat}
    (first : TagStepsN m left middle)
    (second : TagStepsN n middle right) :
    TagStepsN (n + m) left right := by
  induction first with
  | zero => simpa only [Nat.add_zero] using second
  | @succ source next middle steps hstep hrest ih =>
      simpa only [Nat.add_succ] using TagStepsN.succ hstep (ih second)

/-- One explicit block is deleted and its selected complete row is appended. -/
theorem block_step (state : HaltState) (block : FamilyBlock)
    (suffix : List TagSymbol) :
    TagStep (block.word state ++ suffix)
      (suffix ++ row state block.first) := by
  cases block with
  | mk first second third fourth fifth sixth seventh eighth =>
      cases state <;> cases first <;> rfl

/-- First sweep: each complete source block appends its selected indexed row. -/
theorem firstSweep (state : HaltState) (blocks : List FamilyBlock)
    (suffix : List TagSymbol) :
    TagStepsN blocks.length (blocksWord state blocks ++ suffix)
      (suffix ++ rowsWord state (selectedFamilies blocks)) := by
  induction blocks generalizing suffix with
  | nil =>
      simpa only [blocksWord, selectedFamilies, rowsWord,
        List.map_nil, List.length_nil, List.nil_append, List.append_nil] using
        TagStepsN.zero suffix
  | cons block blocks ih =>
      have hone :
          TagStep
            (block.word state ++ (blocksWord state blocks ++ suffix))
            ((blocksWord state blocks ++ suffix) ++ row state block.first) :=
        block_step state block (blocksWord state blocks ++ suffix)
      have hrest := ih (suffix ++ row state block.first)
      have hchain :
          TagStepsN (blocks.length + 1)
            (block.word state ++ (blocksWord state blocks ++ suffix))
            ((suffix ++ row state block.first) ++
              rowsWord state (selectedFamilies blocks)) :=
        .succ hone (by
          simpa only [List.append_assoc] using hrest)
      simpa only [blocksWord, selectedFamilies, rowsWord_cons,
        List.length_cons, List.append_assoc] using! hchain

/-- Last family in a nonempty sequence, presented by head and tail. -/
def lastFamily : Family → List Family → Family
  | first, [] => first
  | _, next :: rest => lastFamily next rest

/-- One second-sweep deletion advances from one row suffix to the next. -/
theorem rowSuffix_step (state : HaltState) (current next : Family)
    (tail : List TagSymbol) :
    TagStep
      (rowSuffixFive state current ++ row state next ++ tail)
      (rowSuffixFive state next ++ tail) := by
  rw [row_eq_prefix_append_suffix]
  cases state <;> cases current <;> cases next <;>
    simp only [TagStep, rowSuffixFive, rowPrefixThree, List.cons_append,
      List.nil_append, Macroperiod.tagStep?_eight, production_halt_j4,
      List.append_nil]

/-- Repeated empty `j=4` productions expose the final complete-row suffix. -/
theorem drainRows (state : HaltState) (first : Family)
    (rest : List Family) (tail : List TagSymbol) :
    TagStepsN rest.length
      (rowSuffixFive state first ++ rowsWord state rest ++ tail)
      (rowSuffixFive state (lastFamily first rest) ++ tail) := by
  induction rest generalizing first with
  | nil =>
      simpa only [rowsWord, List.nil_append, lastFamily] using!
        TagStepsN.zero (rowSuffixFive state first ++ tail)
  | cons next rest ih =>
      have hone :
          TagStep
            (rowSuffixFive state first ++ row state next ++
              (rowsWord state rest ++ tail))
            (rowSuffixFive state next ++ (rowsWord state rest ++ tail)) :=
        rowSuffix_step state first next (rowsWord state rest ++ tail)
      have hchain := TagStepsN.succ hone (ih next)
      simpa only [rowsWord_cons, List.length_cons, lastFamily,
        List.append_assoc] using hchain

/-- The five-symbol terminal prefix starts the second sweep and appends row X. -/
theorem terminal_step (certificate : Certified) (first : Family)
    (rest : List Family) :
    TagStep
      (certificate.terminalWord ++
        rowsWord certificate.state (first :: rest))
      ((rowSuffixFive certificate.state first ++
          rowsWord certificate.state rest) ++
        row certificate.state certificate.terminalFamily) := by
  rcases certificate with
    ⟨state, form, leftSide, rightSide, blocks, hblocks⟩
  cases state <;> cases rightSide <;> cases form <;> cases first <;> rfl

/-- The second sweep has exactly as many steps as complete first-sweep rows. -/
theorem secondSweep (certificate : Certified) :
    ∃ last : Family,
      TagStepsN certificate.sweepCount
        (certificate.terminalWord ++
          rowsWord certificate.state
            (selectedFamilies certificate.blocks))
        (rowSuffixFive certificate.state last ++
          row certificate.state certificate.terminalFamily) := by
  cases hblocks : certificate.blocks with
  | nil => exact (certificate.blocks_nonempty hblocks).elim
  | cons block blocks =>
      let restFamilies := selectedFamilies blocks
      let last := lastFamily block.first restFamilies
      have hone := terminal_step certificate block.first restFamilies
      have hrest := drainRows certificate.state block.first restFamilies
        (row certificate.state certificate.terminalFamily)
      have hchain := TagStepsN.succ hone hrest
      refine ⟨last, ?_⟩
      simpa only [Certified.sweepCount, hblocks, List.length_cons,
        selectedFamilies, List.map_cons, List.length_map, rowsWord_cons, restFamilies,
        last, List.append_assoc] using hchain

/-- The third-sweep step leaves exactly residue (D8). -/
theorem thirdSweep (certificate : Certified) (last : Family) :
    TagStep
      (rowSuffixFive certificate.state last ++
        row certificate.state certificate.terminalFamily)
      certificate.residue := by
  simpa only [Certified.residue, List.append_nil] using
    rowSuffix_step certificate.state last certificate.terminalFamily []

/-- H5: exact counted cleanup from every certified halting word to (D8). -/
theorem certified_cleanup (certificate : Certified) :
    TagStepsN
      (2 * (certificate.word.length / 8) + 1)
      certificate.word certificate.residue := by
  have hfirst := firstSweep certificate.state certificate.blocks
    certificate.terminalWord
  obtain ⟨last, hsecond⟩ := secondSweep certificate
  have hthird : TagStepsN 1
      (rowSuffixFive certificate.state last ++
        row certificate.state certificate.terminalFamily)
      certificate.residue :=
    TagStepsN.succ (thirdSweep certificate last)
      (TagStepsN.zero certificate.residue)
  have hfirst' :
      TagStepsN certificate.sweepCount certificate.word
        (certificate.terminalWord ++
          rowsWord certificate.state (selectedFamilies certificate.blocks)) := by
    simpa only [Certified.word] using! hfirst
  have htwo := TagStepsN.append hfirst' hsecond
  have hall := TagStepsN.append htwo hthird
  rw [Certified.word_length_div_eight]
  simpa only [Nat.two_mul, Nat.add_assoc, Nat.add_comm,
    Nat.add_left_comm] using hall

/-- Every exactly counted tag trajectory lifts to the corresponding number
of complete 912-phase CTS macroperiods. -/
theorem toCTS {steps : Nat} {source target : List TagSymbol}
    (trajectory : TagStepsN steps source target) :
    CTS.iterate rogozhinCookProgram (ctsPeriod * steps)
      (CTS.initial rogozhinCookProgram (encodeWord source)) =
      CTS.initial rogozhinCookProgram (encodeWord target) := by
  induction trajectory with
  | zero => rfl
  | @succ source middle target steps hstep hrest ih =>
      rw [Nat.mul_add, Nat.mul_one, CTS.iterate_add]
      rw [Macroperiod.macroperiod_of_some hstep]
      exact ih

end TagStepsN

namespace Certified

/-- First symbol of residue (D8), at the empty-production index `j=4`. -/
def residueHead (certificate : Certified) : TagSymbol :=
  .indexed certificate.terminalFamily certificate.state.toMachineState .j4

/-- Remaining four symbols of residue (D8). -/
def residueTail (certificate : Certified) : List TagSymbol :=
  [.indexed certificate.terminalFamily certificate.state.toMachineState .j5,
   .indexed certificate.terminalFamily certificate.state.toMachineState .j6,
   .indexed certificate.terminalFamily certificate.state.toMachineState .j7,
   .indexed certificate.terminalFamily certificate.state.toMachineState .j8]

@[simp]
theorem residue_eq_head_append_tail (certificate : Certified) :
    certificate.residue =
      certificate.residueHead :: certificate.residueTail := by
  rfl

@[simp]
theorem residueTail_length (certificate : Certified) :
    certificate.residueTail.length = 4 := by
  rfl

@[simp]
theorem residueTail_encoded_length (certificate : Certified) :
    (encodeWord certificate.residueTail).length = 456 := by
  rw [encodeWord_length, residueTail_length]
  rfl

@[simp]
theorem residue_encoded_length (certificate : Certified) :
    (encodeWord certificate.residue).length = 570 := by
  rw [encodeWord_length, residue_length]
  rfl

@[simp]
theorem binaryProduction_residueHead (certificate : Certified) :
    binaryProduction certificate.residueHead = [] := by
  rw [binaryProduction, residueHead, production_halt_j4]
  rfl

end Certified

/-- The phase reached when all four trailing residue blocks have been
consumed inside the zero-production padding portion of the macroperiod. -/
def residueEndPhase : CTS.Phase rogozhinCookProgram :=
  CTS.iteratePhase rogozhinCookProgram 456 Macroperiod.paddingStart

/-- The first 114 deletion-one steps consume the residue head and emit no
bits, leaving precisely the four trailing unary blocks. -/
theorem residue_after_production_block (certificate : Certified) :
    CTS.iterate rogozhinCookProgram alphabetSize
      (CTS.initial rogozhinCookProgram
        (encodeWord certificate.residue)) =
      ⟨Macroperiod.paddingStart, encodeWord certificate.residueTail⟩ := by
  rw [certificate.residue_eq_head_append_tail]
  simpa only [encodeWord_cons, Certified.binaryProduction_residueHead,
    List.append_nil] using!
    Macroperiod.run_production_block certificate.residueHead
      (encodeWord certificate.residueTail)

/-- Residue (D8) becomes empty after exactly 570 deletion-one CTS steps. -/
theorem residue_empties_at_570 (certificate : Certified) :
    CTS.iterate rogozhinCookProgram 570
      (CTS.initial rogozhinCookProgram
        (encodeWord certificate.residue)) =
      ⟨residueEndPhase, []⟩ := by
  have hemitted :
      Macroperiod.emitted rogozhinCookProgram Macroperiod.paddingStart
        (encodeWord certificate.residueTail) = [] := by
    have hbound :
        0 + (encodeWord certificate.residueTail).length ≤ paddingPhases := by
      rw [Nat.zero_add, Certified.residueTail_encoded_length]
      decide
    simpa only [CTS.iteratePhase_zero] using
      Macroperiod.emitted_padding 0
        (encodeWord certificate.residueTail) hbound
  have htail :
      CTS.iterate rogozhinCookProgram 456
        ⟨Macroperiod.paddingStart, encodeWord certificate.residueTail⟩ =
        ⟨residueEndPhase, []⟩ := by
    simpa only [Certified.residueTail_encoded_length, List.append_nil,
      hemitted, residueEndPhase] using
      Macroperiod.scanPrefix rogozhinCookProgram Macroperiod.paddingStart
        (encodeWord certificate.residueTail) []
  change CTS.iterate rogozhinCookProgram (456 + alphabetSize)
      (CTS.initial rogozhinCookProgram
        (encodeWord certificate.residue)) = _
  rw [CTS.iterate_add, residue_after_production_block]
  exact htail

/-- Before an explicitly supplied dataword has been completely scanned, its
untouched suffix witnesses nonemptiness, independently of emitted bits. -/
theorem iterate_data_ne_nil_before_input_length
    (program : CTS.Program) (phase : CTS.Phase program)
    (data : List Bool) (steps : Nat) (hsteps : steps < data.length) :
    (CTS.iterate program steps ⟨phase, data⟩).data ≠ [] := by
  have hrun := Macroperiod.scanPrefix program phase
    (data.take steps) (data.drop steps)
  rw [List.length_take_of_le (Nat.le_of_lt hsteps)] at hrun
  rw [List.take_append_drop] at hrun
  rw [hrun]
  intro hempty
  have hdrop : data.drop steps = [] :=
    (List.append_eq_nil_iff.mp hempty).1
  have hle : data.length ≤ steps :=
    List.drop_eq_nil_iff.mp hdrop
  exact (Nat.not_le_of_gt hsteps) hle

/-- Step 570 is the first empty point of the residue CTS trajectory. -/
theorem residue_nonempty_before_570 (certificate : Certified)
    (steps : Nat) (hsteps : steps < 570) :
    (CTS.iterate rogozhinCookProgram steps
      (CTS.initial rogozhinCookProgram
        (encodeWord certificate.residue))).data ≠ [] := by
  apply iterate_data_ne_nil_before_input_length
  simpa only [Certified.residue_encoded_length] using hsteps

/-- Number of deletion-eight cleanup steps prescribed by (H5). -/
def cleanupTagSteps (certificate : Certified) : Nat :=
  2 * (certificate.word.length / 8) + 1

/-- The exact macroperiod lift reaches residue (D8) at phase zero. -/
theorem certified_reaches_residue (certificate : Certified) :
    CTS.iterate rogozhinCookProgram (ctsPeriod * cleanupTagSteps certificate)
      (CTS.initial rogozhinCookProgram
        (encodeWord certificate.word)) =
      CTS.initial rogozhinCookProgram
        (encodeWord certificate.residue) := by
  exact TagStepsN.toCTS (TagStepsN.certified_cleanup certificate)

/-- Once residue (D8) has been reached, none of its first 569 CTS steps is
empty, stated directly on the trajectory from the certified halting word. -/
theorem certified_nonempty_during_residue_cleanup (certificate : Certified)
    (steps : Nat) (hsteps : steps < 570) :
    (CTS.iterate rogozhinCookProgram
      (ctsPeriod * cleanupTagSteps certificate + steps)
      (CTS.initial rogozhinCookProgram
        (encodeWord certificate.word))).data ≠ [] := by
  rw [Nat.add_comm (ctsPeriod * cleanupTagSteps certificate) steps,
    CTS.iterate_add, certified_reaches_residue]
  exact residue_nonempty_before_570 certificate steps hsteps

/-- Exact full horizon, from the certified halting word through the first
empty deletion-one CTS dataword. -/
def fullCleanupHorizon (certificate : Certified) : Nat :=
  912 * (2 * (certificate.word.length / 8) + 1) + 570

@[simp]
theorem fullCleanupHorizon_formula (certificate : Certified) :
    fullCleanupHorizon certificate =
      912 * (2 * (certificate.word.length / 8) + 1) + 570 :=
  rfl

/-- From a certified word of length `m`, the complete endpoint occurs at
`912 * (2 * (m / 8) + 1) + 570`, with empty data and phase 570. -/
theorem certified_empties_at_full_horizon (certificate : Certified) :
    CTS.iterate rogozhinCookProgram (fullCleanupHorizon certificate)
      (CTS.initial rogozhinCookProgram
        (encodeWord certificate.word)) =
      ⟨residueEndPhase, []⟩ := by
  change CTS.iterate rogozhinCookProgram
      (ctsPeriod * cleanupTagSteps certificate + 570)
      (CTS.initial rogozhinCookProgram
        (encodeWord certificate.word)) = _
  rw [Nat.add_comm, CTS.iterate_add, certified_reaches_residue]
  exact residue_empties_at_570 certificate

/-- The endpoint phase is numerically 570, as stated in Appendix B.4.2. -/
@[simp]
theorem residueEndPhase_val : residueEndPhase.val = 570 := by
  rw [residueEndPhase, CTS.iteratePhase_val,
    Macroperiod.paddingStart_val]
  decide

end HaltCleanup

end PureSFormal.Cook
