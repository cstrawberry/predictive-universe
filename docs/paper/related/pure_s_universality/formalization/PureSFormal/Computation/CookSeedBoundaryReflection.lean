import PureSFormal.Computation.CookSeedReadbackContext

/-!
# Syntactic reflection of the seed-checked machine boundary

Successful machine-boundary decoding reconstructs the entire literal encoded
configuration, including its unchanged program region and unary audit prefix.
This proves a parser property for all inputs. Showing that such an accepted
configuration occurs only at a simulated source boundary on the actual run
requires the corresponding operational first-return theorem.
-/

namespace PureSFormal.Computation.CookSeedBoundaryReflection

open RogozhinTagInput RogozhinT2Simulation CookSeedReadbackContext

theorem labelForWeight_le_bound (context : Context) (bound : Nat) (width : Nat) :
    ∀ limit, limit ≤ bound + 1 → context.labelForWeight limit width ≤ bound := by
  intro limit
  induction limit with
  | zero => intro _; exact Nat.zero_le _
  | succ limit ih =>
      intro bounded
      rw [Context.labelForWeight]
      split
      · exact Nat.le_of_succ_le_succ bounded
      · exact ih (Nat.le_trans (Nat.le_succ limit) bounded)

theorem labels_map_bounded (context : Context) (widths : List Nat) :
    ∀ label, label ∈ widths.map (context.labelForWeight (context.symbolCount + 1)) →
      label ≤ context.symbolCount := by
  induction widths with
  | nil => intro label membership; cases membership
  | cons first rest ih =>
      intro label membership
      rw [List.map_cons] at membership
      rcases List.mem_cons.mp membership with equal | inTail
      · rw [equal]
        exact labelForWeight_le_bound context _ first _ (Nat.le_refl _)
      · exact ih label inTail

/-- Accepted data is the entire checked encoding of a bounded label word. -/
theorem decodeData?_sound (context : Context) (cells : List Rogozhin46.Symbol)
    (word : List Label) (found : context.decodeData? cells = some word) :
    context.dataCode word = cells ∧
      ∀ label, label ∈ word → label ≤ context.symbolCount := by
  unfold Context.decodeData? at found
  by_cases empty : cells = []
  · rw [if_pos empty] at found
    cases found
    exact ⟨empty.symm, fun label membership => nomatch membership⟩
  · rw [if_neg empty] at found
    dsimp only at found
    split at found
    · cases found
      exact ⟨‹_ = cells›, labels_map_bounded context _⟩
    · cases found

theorem stripAudit_decomposition (cells : List Rogozhin46.Symbol) :
    ∃ padding, cells = List.replicate padding .s0 ++ stripAudit cells := by
  induction cells with
  | nil => exact ⟨0, rfl⟩
  | cons first rest ih =>
      cases first with
      | s0 =>
          obtain ⟨padding, restEq⟩ := ih
          exact ⟨padding + 1, congrArg (List.cons .s0) restEq⟩
      | s1 => exact ⟨0, rfl⟩
      | s2 => exact ⟨0, rfl⟩
      | s3 => exact ⟨0, rfl⟩
      | s4 => exact ⟨0, rfl⟩
      | s5 => exact ⟨0, rfl⟩

/-- Every accepted fixed-machine configuration is literally one of the
encoder's padded boundaries, with its recovered word and original program. -/
theorem contextOf_decodeBoundary?_sound (program : Program) (isT2 : IsT2 program)
    (configuration : Rogozhin46.Config) (word : List Label)
    (found : (contextOf program).decodeBoundary? configuration = some word) :
    ∃ padding,
      configuration = compileWithPadding program padding word ∧ LabelsValid program word := by
  rcases configuration with ⟨state, current, left, right⟩
  unfold Context.decodeBoundary? at found
  split at found
  next shape =>
    obtain ⟨stateEq, programEq⟩ := shape
    obtain ⟨padding, leftEq⟩ := stripAudit_decomposition left
    change state = .A at stateEq
    change stripAudit left = (contextOf program).programCode.reverse at programEq
    rw [programEq, contextOf_programCode] at leftEq
    subst state
    by_cases blank : current = .s4
    · rw [if_pos blank] at found
      by_cases rightEmpty : right = []
      · rw [if_pos rightEmpty] at found
        cases found
        refine ⟨padding, ?_, ?_⟩
        · rw [blank, rightEmpty, leftEq]
          rfl
        · intro label membership
          cases membership
      · rw [if_neg rightEmpty] at found
        cases found
    · rw [if_neg blank] at found
      obtain ⟨encoded, valid⟩ := decodeData?_sound (contextOf program) (current :: right) word found
      have labels : LabelsValid program word := by
        intro label membership
        have bounded := valid label membership
        rw [contextOf_symbolCount] at bounded
        exact bounded
      rw [contextOf_dataCode program isT2 word labels] at encoded
      refine ⟨padding, ?_, labels⟩
      rw [compileWithPadding, encoded, leftEq]
  next rejected => cases found

end PureSFormal.Computation.CookSeedBoundaryReflection
