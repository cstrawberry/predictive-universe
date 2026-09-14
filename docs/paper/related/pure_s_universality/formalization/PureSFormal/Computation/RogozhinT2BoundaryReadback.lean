import PureSFormal.Computation.RogozhinT2Iteration
import PureSFormal.Computation.DeletionTwoT2Readback

/-!
# Literal source-word readback at Rogozhin sweep boundaries

The executable decoder reads the current cell and the right tape. It does not
receive a source trajectory, a macro index, or the accumulated left padding.
At every encoded sweep boundary it recovers the complete tag word. The final
theorem transports this readback to actual fixed-machine execution times.

Acceptance validates the literal data encoding. It does not establish that an
arbitrary machine configuration is a reachable completed-sweep boundary.
-/

namespace PureSFormal.Computation.RogozhinT2BoundaryReadback

open RogozhinTagInput RogozhinT2Simulation

theorem weight_lt_of_lt (program : Program) (isT2 : IsT2 program)
    {first second : Label} (lt : first < second) (bounded : second ≤ haltLabel program) :
    weight program first < weight program second := by
  have firstLt : first < symbolCount program := Nat.lt_of_lt_of_le lt bounded
  have positive : 0 < (productionAt program first).length :=
    Nat.lt_of_lt_of_le (by decide : 0 < 2) (two_le_production_length isT2 firstLt)
  have stepLt : weight program first < weight program (first + 1) := by
    rw [weight]
    exact Nat.lt_add_of_pos_right (Nat.mul_pos (by decide) positive)
  exact Nat.lt_of_lt_of_le stepLt (weight_mono program lt)

/-- Search the finite alphabet for the label with this unary width. -/
def labelForWeight (program : Program) : Nat → Nat → Label
  | 0, _ => 0
  | limit + 1, width =>
      if weight program limit = width then limit else labelForWeight program limit width

theorem labelForWeight_weight (program : Program) (isT2 : IsT2 program)
    (limit : Nat) (bounded : limit ≤ haltLabel program + 1)
    (label : Label) (lt : label < limit) :
    labelForWeight program limit (weight program label) = label := by
  induction limit with
  | zero => exact False.elim (Nat.not_lt_zero _ lt)
  | succ limit ih =>
      by_cases same : label = limit
      · subst label
        rw [labelForWeight, if_pos rfl]
      · have labelLt : label < limit := Nat.lt_of_le_of_ne (Nat.le_of_lt_succ lt) same
        have weightNe : weight program limit ≠ weight program label :=
          Ne.symm (Nat.ne_of_lt (weight_lt_of_lt program isT2 labelLt
            (Nat.le_of_succ_le_succ bounded)))
        rw [labelForWeight, if_neg weightNe]
        exact ih (Nat.le_trans (Nat.le_succ limit) bounded) labelLt

/-- Unary widths separated by the literal data marker. Re-encoding below
rejects malformed inputs, including symbols outside this data alphabet. -/
def readWidthsAux (width : Nat) : List Rogozhin46.Symbol → List Nat
  | [] => [width]
  | .s0 :: rest => readWidthsAux (width + 1) rest
  | .s5 :: rest => width :: readWidthsAux 0 rest
  | _ :: _ => []

theorem readWidthsAux_ones (count width : Nat) (rest : List Rogozhin46.Symbol) :
    readWidthsAux width (List.replicate count .s0 ++ rest) =
      readWidthsAux (width + count) rest := by
  induction count generalizing width with
  | zero => rfl
  | succ count ih =>
      simp only [List.replicate_succ, List.cons_append, readWidthsAux]
      rw [ih, Nat.add_assoc, Nat.add_comm 1 count]

theorem readWidthsAux_dataTail (program : Program) (word : List Label) (width : Nat) :
    readWidthsAux width (dataTail program word) = width :: word.map (weight program) := by
  induction word generalizing width with
  | nil => rfl
  | cons label word ih =>
      rw [dataTail, readWidthsAux, ones, readWidthsAux_ones, Nat.zero_add, ih]
      rfl

theorem readWidthsAux_dataCode (program : Program) (first : Label) (rest : List Label) :
    readWidthsAux 0 (dataCode program (first :: rest)) =
      (first :: rest).map (weight program) := by
  rw [dataCode, ones, readWidthsAux_ones, Nat.zero_add, readWidthsAux_dataTail]
  rfl

theorem labelsOfWidths_map_weight (program : Program) (isT2 : IsT2 program)
    (word : List Label) (valid : LabelsValid program word) :
    (word.map (weight program)).map
      (labelForWeight program (haltLabel program + 1)) = word := by
  induction word with
  | nil => rfl
  | cons first rest ih =>
      rw [List.map_cons, List.map_cons,
        labelForWeight_weight program isT2 _ (Nat.le_refl _)
          first (Nat.lt_succ_of_le (valid first (List.Mem.head _))),
        ih (WellFormed.labelsValid_tail valid)]

/-- Recover and validate the complete finite data word. -/
def decodeData? (program : Program) (cells : List Rogozhin46.Symbol) :
    Option (List Label) :=
  if cells = [] then some [] else
    let candidate := (readWidthsAux 0 cells).map
      (labelForWeight program (haltLabel program + 1))
    if dataCode program candidate = cells then some candidate else none

theorem dataCode_cons_ne_nil (program : Program) (first : Label) (rest : List Label) :
    dataCode program (first :: rest) ≠ [] := by
  obtain ⟨predecessor, positive⟩ := weight_is_succ program first
  simp only [dataCode, ones, positive, List.replicate_succ, List.cons_append,
    List.noConfusion]
  exact List.cons_ne_nil _ _

theorem decodeData?_dataCode (program : Program) (isT2 : IsT2 program)
    (word : List Label) (valid : LabelsValid program word) :
    decodeData? program (dataCode program word) = some word := by
  cases word with
  | nil => rfl
  | cons first rest =>
      rw [decodeData?, if_neg (dataCode_cons_ne_nil program first rest)]
      rw [readWidthsAux_dataCode, labelsOfWidths_map_weight program isT2 _ valid]
      exact if_pos rfl

theorem decodeData?_sound (program : Program) (cells : List Rogozhin46.Symbol)
    (word : List Label) (found : decodeData? program cells = some word) :
    dataCode program word = cells := by
  unfold decodeData? at found
  split at found
  · cases found
    exact ‹cells = []›.symm
  · dsimp only at found
    split at found
    · cases found
      assumption
    · cases found

/-- The current configuration alone supplies the complete data region at a
completed sweep. Left audit padding is not an argument of this decoder. -/
def decodeBoundary? (program : Program) (configuration : Rogozhin46.Config) :
    Option (List Label) :=
  if configuration.state = .A then
    if configuration.current = .s4 then
      if configuration.right = [] then some [] else none
    else decodeData? program (configuration.current :: configuration.right)
  else none

theorem decodeBoundary?_compileWithPadding (program : Program) (isT2 : IsT2 program)
    (padding : Nat) (word : List Label) (valid : LabelsValid program word) :
    decodeBoundary? program (compileWithPadding program padding word) = some word := by
  cases word with
  | nil => rfl
  | cons first rest =>
      rw [compileWithPadding_nonempty]
      change decodeData? program
        (.s0 :: (List.replicate (weight program first - 1) .s0 ++ dataTail program rest)) = _
      have cells :
          .s0 :: (List.replicate (weight program first - 1) .s0 ++ dataTail program rest) =
            dataCode program (first :: rest) := by
        obtain ⟨predecessor, positive⟩ := weight_is_succ program first
        simp only [dataCode, ones, positive, Nat.add_sub_cancel,
          List.replicate_succ, List.cons_append]
      rw [cells]
      exact decodeData?_dataCode program isT2 _ valid

theorem decodeBoundary?_compile (job : Job) (wellFormed : WellFormed job.program job.word) :
    decodeBoundary? job.program (compile job) = some job.word := by
  rw [← compileWithPadding_zero]
  exact decodeBoundary?_compileWithPadding job.program wellFormed.isT2 0 job.word
    wellFormed.labels

/-- Every actual returned sweep boundary exposes its exact current tag word.
The execution time occurs only in the theorem, never in the decoder. -/
theorem decodeBoundary?_iterate_nonhaltingRun
    {program : Program} {word : List Label}
    (wellFormed : WellFormed program word) (horizon : Nat)
    (before : NonhaltingBefore program word horizon) :
    decodeBoundary? program
      (Rogozhin46.iterate (boundaryTime program word horizon) (compile ⟨program, word⟩)) =
      some (iterate program horizon word) := by
  rw [iterate_compileWithPadding_nonhaltingRun wellFormed horizon before]
  exact decodeBoundary?_compileWithPadding program wellFormed.isT2 _ _
    (wellFormed.iterate horizon).labels

end PureSFormal.Computation.RogozhinT2BoundaryReadback
