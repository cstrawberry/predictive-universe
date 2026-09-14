import PureSFormal.Computation.DeletionTwoT2Normalizer

/-!
# Literal readback through deletion-two normalization

The decoder receives only the ordinary finite program and the current
normalized word. Paired delay symbols denote padding. A single leading delay
denotes the pending alignment, in which the next ordinary symbol has already
been consumed logically and must be omitted from readback.

This distinction is essential: deleting all delay symbols would return the
wrong source word at pending boundaries. No trajectory, time index, or
alignment witness is an argument of the executable decoder.
-/

namespace PureSFormal.Computation.DeletionTwoT2Readback

open RogozhinTagInput DeletionTwoT2Normalizer

def decodeLabel (program : Program) (label : Label) : Label :=
  if label = targetHaltLabel program then haltLabel program else label

theorem decodeLabel_encodeLabel (program : Program) (label : Label)
    (valid : label ≤ haltLabel program) :
    decodeLabel program (encodeLabel program label) = label := by
  unfold decodeLabel
  by_cases halting : label = haltLabel program
  · rw [(encodeLabel_eq_targetHalt_iff program valid).mpr halting, if_pos rfl]
    exact halting.symm
  · rw [if_neg (fun equal => halting
      ((encodeLabel_eq_targetHalt_iff program valid).mp equal))]
    exact if_neg halting

/-- Parse whole padding pairs and invert the ordinary-label embedding. -/
def decodeAligned? (program : Program) : List Label → Option (List Label)
  | [] => some []
  | first :: rest =>
      if first = delayLabel program then
        match rest with
        | second :: tail =>
            if second = delayLabel program then decodeAligned? program tail else none
        | [] => none
      else if first ≤ targetHaltLabel program then
        (decodeAligned? program rest).map (List.cons (decodeLabel program first))
      else none

theorem decodeAligned?_cons (program : Program) (first : Label) (rest : List Label) :
    decodeAligned? program (first :: rest) =
      if first = delayLabel program then
        match rest with
        | second :: tail =>
            if second = delayLabel program then decodeAligned? program tail else none
        | [] => none
      else if first ≤ targetHaltLabel program then
        (decodeAligned? program rest).map (List.cons (decodeLabel program first))
      else none := by
  rw [decodeAligned?.eq_def]

/-- Checked alignment recovery from the literal current normalized word. -/
def decodeWord? (program : Program) (word : List Label) : Option (List Label) :=
  match decodeAligned? program word with
  | some source => some source
  | none =>
      match word with
      | first :: rest =>
          if first = delayLabel program then
            (decodeAligned? program rest).map List.tail
          else none
      | [] => none

def TokensValid (program : Program) (tokens : List Token) : Prop :=
  LabelsValid program (sourceOf tokens)

theorem tokensValid_tail {program : Program} {first : Token} {rest : List Token}
    (valid : TokensValid program (first :: rest)) : TokensValid program rest := by
  cases first with
  | data label => exact WellFormed.labelsValid_tail valid
  | pad => exact valid

theorem decodeAligned?_targetOf (program : Program) (tokens : List Token)
    (valid : TokensValid program tokens) :
    decodeAligned? program (targetOf program tokens) = some (sourceOf tokens) := by
  induction tokens with
  | nil => rfl
  | cons token tokens ih =>
      have tailValid := tokensValid_tail valid
      cases token with
      | data label =>
          have labelValid : label ≤ haltLabel program := valid label (List.Mem.head _)
          rw [targetOf, decodeAligned?_cons, if_neg (encodeLabel_ne_delay program labelValid),
            if_pos (encodeLabel_le_targetHalt program labelValid), ih tailValid,
            decodeLabel_encodeLabel program label labelValid]
          rfl
      | pad =>
          simpa only [targetOf, decodeAligned?_cons, if_true, sourceOf] using ih tailValid

/-- A pending alignment cannot be mistaken for a whole-token alignment. -/
theorem decodeAligned?_pending_none (program : Program) (tokens : List Token)
    (valid : TokensValid program tokens) :
    decodeAligned? program (delayLabel program :: targetOf program tokens) = none := by
  induction tokens with
  | nil => simp only [targetOf, decodeAligned?_cons, if_true]
  | cons token tokens ih =>
      have tailValid := tokensValid_tail valid
      cases token with
      | data label =>
          have labelValid : label ≤ haltLabel program := valid label (List.Mem.head _)
          simp only [targetOf, decodeAligned?_cons, if_true,
            if_neg (encodeLabel_ne_delay program labelValid)]
      | pad =>
          simpa only [targetOf, decodeAligned?_cons, if_true] using ih tailValid

theorem decodeWord?_targetWord (program : Program) (state : QueueState)
    (valid : TokensValid program state.tokens) :
    decodeWord? program (state.targetWord program) = some state.sourceView := by
  rcases state with ⟨alignment, tokens⟩
  cases alignment with
  | aligned =>
      rw [QueueState.targetWord, decodeWord?.eq_def, decodeAligned?_targetOf program tokens valid]
      rfl
  | pending =>
      simp only [QueueState.targetWord, decodeWord?.eq_def,
        decodeAligned?_pending_none program tokens valid, if_true,
        decodeAligned?_targetOf program tokens valid, Option.map_some]
      rfl

theorem tokensValid_initial (program : Program) (word : List Label)
    (valid : LabelsValid program word) :
    TokensValid program (dataTokens word ++ [.pad]) := by
  unfold TokensValid
  rw [sourceOf_initialTokens]
  exact valid

/-- Label validity for all ordinary nonhalting productions. -/
def ProductionsValid (program : Program) : Prop :=
  ∀ label, label < symbolCount program → LabelsValid program (productionAt program label)

theorem tokensValid_step (program : Program) (productions : ProductionsValid program)
    (state : QueueState) (valid : TokensValid program state.tokens) :
    TokensValid program (state.step program).tokens := by
  rcases state with ⟨alignment, tokens⟩
  cases alignment with
  | aligned =>
      cases tokens with
      | nil => exact valid
      | cons first rest =>
          have restValid := tokensValid_tail valid
          cases first with
          | pad =>
              simpa only [QueueState.step, TokensValid, sourceOf_append, sourceOf_pad,
                sourceOf_nil, List.append_nil] using restValid
          | data first =>
              cases rest with
              | nil => exact valid
              | cons second rest =>
                  by_cases halting : first = haltLabel program
                  · simpa only [QueueState.step, if_pos halting] using valid
                  · have firstValid : first ≤ haltLabel program :=
                      valid first (List.Mem.head _)
                    have firstLt : first < symbolCount program :=
                      Nat.lt_of_le_of_ne firstValid halting
                    have remainingValid := tokensValid_tail restValid
                    have rhsValid := productions first firstLt
                    have appended : TokensValid program (rest ++ rhsTokens program first) := by
                      unfold TokensValid
                      rw [sourceOf_append, sourceOf_rhsTokens]
                      exact WellFormed.labelsValid_append remainingValid rhsValid
                    cases second <;>
                      simpa only [QueueState.step, if_neg halting] using appended
  | pending =>
      cases tokens with
      | nil => exact valid
      | cons first rest =>
          have restValid := tokensValid_tail valid
          cases first <;>
            simpa only [QueueState.step, TokensValid, sourceOf_append, sourceOf_pad,
              sourceOf_nil, List.append_nil] using restValid

theorem represents_iterate_tokensValid (program : Program) (initialWord : List Label)
    (productions : ProductionsValid program)
    (trajectory : ∀ horizon, Boundary program (iterate program horizon initialWord)) :
    ∀ targetHorizon,
      TokensValid program
        (represents_iterate program initialWord trajectory targetHorizon).state.tokens
  | 0 => tokensValid_initial program initialWord (trajectory 0).labels
  | targetHorizon + 1 => by
      exact tokensValid_step program productions
        (represents_iterate program initialWord trajectory targetHorizon).state
        (represents_iterate_tokensValid program initialWord productions trajectory targetHorizon)

/-- Every actual normalized iterate decodes to its represented ordinary source word. -/
theorem decodeWord?_iterate (program : Program) (initialWord : List Label)
    (productions : ProductionsValid program)
    (trajectory : ∀ horizon, Boundary program (iterate program horizon initialWord))
    (targetHorizon : Nat) :
    ∃ sourceHorizon,
      decodeWord? program
        (iterate (normalizeProgram program) targetHorizon (normalizeWord program initialWord)) =
      some (iterate program sourceHorizon initialWord) := by
  let represented := represents_iterate program initialWord trajectory targetHorizon
  refine ⟨represented.horizon, ?_⟩
  have decoded := decodeWord?_targetWord program represented.state
    (represents_iterate_tokensValid program initialWord productions trajectory targetHorizon)
  exact (congrArg (decodeWord? program) represented.target_eq).symm.trans
    (decoded.trans (congrArg some represented.source_eq))

theorem decodeWord?_normalizeWord (program : Program) (word : List Label)
    (valid : LabelsValid program word) :
    decodeWord? program (normalizeWord program word) = some word := by
  have decoded := decodeWord?_targetWord program
    ⟨.aligned, dataTokens word ++ [.pad]⟩ (tokensValid_initial program word valid)
  simpa only [QueueState.targetWord, QueueState.sourceView,
    targetOf_initialTokens, sourceOf_initialTokens] using decoded

end PureSFormal.Computation.DeletionTwoT2Readback
