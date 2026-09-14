import PureSFormal.Computation.RogozhinTagInput

/-!
# Well-formed restricted two-tag dynamics

This module isolates the source-side facts used by the Rogozhin sweep proof.
For a `T2` program, every nonhalting production has two distinguished symbols
as a prefix, so a valid word with at least two cells never stops through
shortness.  Its only stopping boundary is the designated halting label.
-/

namespace PureSFormal.Computation

namespace RogozhinTagInput

/-- Every label below the halting label has the required double prefix. -/
theorem production_shape
    {program : Program} (hT2 : IsT2 program)
    {label : Label} (labelLt : label < symbolCount program) :
    ∃ suffix,
      productionAt program label =
        distinguished program :: distinguished program :: suffix ∧
      LabelsValid program suffix := by
  have labelLe : label ≤ distinguished program := by
    unfold distinguished
    exact Nat.le_sub_one_of_lt labelLt
  rcases Nat.lt_or_eq_of_le labelLe with lower | equal
  · obtain ⟨suffix, nonempty, productionEq, valid⟩ := hT2.2.2 label lower
    exact ⟨suffix, productionEq, valid⟩
  · subst label
    exact ⟨[], hT2.2.1, by
      intro value membership
      cases membership⟩

/-- Every nonhalting production has at least its two prefix cells. -/
theorem two_le_production_length
    {program : Program} (hT2 : IsT2 program)
    {label : Label} (labelLt : label < symbolCount program) :
    2 ≤ (productionAt program label).length := by
  obtain ⟨suffix, productionEq, valid⟩ :=
    production_shape hT2 labelLt
  rw [productionEq]
  simpa only [List.length_cons] using Nat.le_add_left 2 suffix.length

/-- Every symbol emitted by a nonhalting production is a valid label. -/
theorem production_labelsValid
    {program : Program} (hT2 : IsT2 program)
    {label : Label} (labelLt : label < symbolCount program) :
    LabelsValid program (productionAt program label) := by
  obtain ⟨suffix, productionEq, suffixValid⟩ :=
    production_shape hT2 labelLt
  rw [productionEq]
  intro value membership
  simp only [List.mem_cons] at membership
  rcases membership with first | second | inSuffix
  · subst value
    unfold distinguished haltLabel
    exact Nat.sub_le _ _
  · subst value
    unfold distinguished haltLabel
    exact Nat.sub_le _ _
  · exact suffixValid value inSuffix

/-- A list of length at least two has a literal two-cell prefix. -/
theorem exists_two_prefix {word : List α} (lengthTwo : 2 ≤ word.length) :
    ∃ first second rest, word = first :: second :: rest := by
  cases word with
  | nil => contradiction
  | cons first tail =>
      cases tail with
      | nil => contradiction
      | cons second rest => exact ⟨first, second, rest, rfl⟩

/-- A valid source boundary: fixed T2 table, valid labels, and two live cells. -/
structure WellFormed (program : Program) (word : List Label) : Prop where
  isT2 : IsT2 program
  labels : LabelsValid program word
  lengthTwo : 2 ≤ word.length

namespace WellFormed

/-- The syntactic stop test is exactly the designated halting head. -/
theorem halted_iff_head
    {program : Program} {word : List Label}
    (wellFormed : WellFormed program word) :
    Halted program word ↔ word.head? = some (haltLabel program) := by
  obtain ⟨first, second, rest, wordEq⟩ :=
    exists_two_prefix wellFormed.lengthTwo
  subst word
  unfold Halted step?
  by_cases halting : first = haltLabel program
  · subst first
    simp
  · simp [halting]

/-- A nonhalting well-formed boundary performs the ordinary deletion-two step. -/
theorem absorbingStep_eq
    {program : Program} {first second : Label} {rest : List Label}
    (notHalting : first ≠ haltLabel program) :
    absorbingStep program (first :: second :: rest) =
      rest ++ productionAt program first := by
  simp [absorbingStep, step?, notHalting]

/-- Validity is inherited by every list suffix. -/
theorem labelsValid_tail
    {program : Program} {first : Label} {rest : List Label}
    (valid : LabelsValid program (first :: rest)) :
    LabelsValid program rest := by
  intro label membership
  exact valid label (List.Mem.tail first membership)

/-- Validity is closed under concatenation. -/
theorem labelsValid_append
    {program : Program} {left right : List Label}
    (leftValid : LabelsValid program left)
    (rightValid : LabelsValid program right) :
    LabelsValid program (left ++ right) := by
  intro label membership
  rcases List.mem_append.mp membership with inLeft | inRight
  · exact leftValid label inLeft
  · exact rightValid label inRight

/-- One nonhalting deletion-two step preserves the full source invariant. -/
theorem step
    {program : Program} {first second : Label} {rest : List Label}
    (wellFormed : WellFormed program (first :: second :: rest))
    (notHalting : first ≠ haltLabel program) :
    WellFormed program (rest ++ productionAt program first) := by
  have firstLe : first ≤ haltLabel program :=
    wellFormed.labels first (List.Mem.head _)
  have firstLt : first < symbolCount program := by
    unfold haltLabel at firstLe notHalting
    exact Nat.lt_of_le_of_ne firstLe notHalting
  have restValid : LabelsValid program rest :=
    labelsValid_tail (labelsValid_tail wellFormed.labels)
  have productionValid := production_labelsValid wellFormed.isT2 firstLt
  refine ⟨wellFormed.isT2,
    labelsValid_append restValid productionValid, ?_⟩
  have productionLe : (productionAt program first).length ≤
      (rest ++ productionAt program first).length := by
    rw [List.length_append]
    exact Nat.le_add_left _ _
  exact Nat.le_trans
    (two_le_production_length wellFormed.isT2 firstLt) productionLe

/-- The total absorbing extension preserves well-formedness at every step. -/
theorem absorbingStep
    {program : Program} {word : List Label}
    (wellFormed : WellFormed program word) :
    WellFormed program (RogozhinTagInput.absorbingStep program word) := by
  obtain ⟨first, second, rest, wordEq⟩ :=
    exists_two_prefix wellFormed.lengthTwo
  subst word
  by_cases halting : first = haltLabel program
  · have unchanged : RogozhinTagInput.absorbingStep program
        (first :: second :: rest) = first :: second :: rest := by
      simp [RogozhinTagInput.absorbingStep, step?, halting]
    rw [unchanged]
    exact wellFormed
  · rw [WellFormed.absorbingStep_eq halting]
    exact wellFormed.step halting

/-- Every totalized source iterate remains a valid two-cell boundary. -/
theorem iterate
    {program : Program} {word : List Label}
    (wellFormed : WellFormed program word) :
    ∀ horizon,
      WellFormed program (RogozhinTagInput.iterate program horizon word)
  | 0 => wellFormed
  | horizon + 1 => (iterate wellFormed horizon).absorbingStep

/-- Eventual source stopping is exactly eventual arrival of the halt head. -/
theorem eventuallyHalts_iff_exists_haltHead
    {program : Program} {word : List Label}
    (wellFormed : WellFormed program word) :
    EventuallyHalts ⟨program, word⟩ ↔
      ∃ horizon,
        (RogozhinTagInput.iterate program horizon word).head? =
          some (haltLabel program) := by
  unfold EventuallyHalts
  constructor
  · rintro ⟨horizon, halted⟩
    exact ⟨horizon,
      ((wellFormed.iterate horizon).halted_iff_head).1 halted⟩
  · rintro ⟨horizon, haltHead⟩
    exact ⟨horizon,
      ((wellFormed.iterate horizon).halted_iff_head).2 haltHead⟩

end WellFormed

end RogozhinTagInput

end PureSFormal.Computation
