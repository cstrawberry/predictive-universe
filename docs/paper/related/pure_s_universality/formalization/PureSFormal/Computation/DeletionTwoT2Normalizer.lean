import PureSFormal.Computation.RogozhinT2Semantics

/-!
# Pair-padding normalization of deletion-two tag systems

An ordinary finite deletion-two table is embedded into Rogozhin's restricted
class `T2` by adjoining one distinguished delay symbol `D`.  Every ordinary
production `alpha` becomes `D D alpha`; an empty production becomes
`D D D D`; and `D` produces `D D`.  The old halt label is shifted past `D`.

The proof below does not assume even production lengths.  A one-symbol phase
records the only possible alignment crossing: after a selected ordinary
symbol consumes the first half of a `D D` pair, the remaining `D` consumes
the next ordinary symbol as the ignored deletion-two cell.
-/

namespace PureSFormal.Computation

namespace DeletionTwoT2Normalizer

open RogozhinTagInput

/-- The new distinguished delay label. -/
def delayLabel (program : Program) : Label := symbolCount program

/-- The shifted target halt label. -/
def targetHaltLabel (program : Program) : Label := symbolCount program + 1

/-- Embed an ordinary label, shifting only the old halt label past `D`. -/
def encodeLabel (program : Program) (label : Label) : Label :=
  if label = haltLabel program then targetHaltLabel program else label

/-- Pointwise label embedding. -/
def encodeWord (program : Program) (word : List Label) : List Label :=
  word.map (encodeLabel program)

/-- The normalized right-hand side, including its nonempty `D D` suffix. -/
def normalizedRhs (program : Program) (rhs : List Label) : List Label :=
  if rhs = [] then
    [delayLabel program, delayLabel program,
      delayLabel program, delayLabel program]
  else
    delayLabel program :: delayLabel program :: encodeWord program rhs

/-- The finite restricted table: old rows, followed by the `D -> D D` row. -/
def normalizeProgram (program : Program) : Program :=
  ⟨program.productions.map (normalizedRhs program) ++
    [[delayLabel program, delayLabel program]]⟩

/-- Aligned queue tokens; `pad` denotes the literal pair `D D`. -/
inductive Token where
  | data (label : Label)
  | pad
  deriving DecidableEq, Repr

/-- Ordinary source word obtained by deleting padding tokens. -/
def sourceOf : List Token → List Label
  | [] => []
  | .data label :: rest => label :: sourceOf rest
  | .pad :: rest => sourceOf rest

/-- Literal normalized word represented by an aligned token queue. -/
def targetOf (program : Program) : List Token → List Label
  | [] => []
  | .data label :: rest => encodeLabel program label :: targetOf program rest
  | .pad :: rest =>
      delayLabel program :: delayLabel program :: targetOf program rest

/-- Turn an ordinary word into data tokens. -/
def dataTokens (word : List Label) : List Token := word.map Token.data

/-- Token form of the normalized appendant. -/
def rhsTokens (program : Program) (label : Label) : List Token :=
  let rhs := productionAt program label
  if rhs = [] then [.pad, .pad] else .pad :: dataTokens rhs

/-- The canonical normalized initial word `encode(beta) D D`. -/
def normalizeWord (program : Program) (word : List Label) : List Label :=
  encodeWord program word ++ [delayLabel program, delayLabel program]

@[simp]
theorem sourceOf_nil : sourceOf [] = [] := rfl

@[simp]
theorem targetOf_nil (program : Program) : targetOf program [] = [] := rfl

@[simp]
theorem sourceOf_data (label : Label) (rest : List Token) :
    sourceOf (.data label :: rest) = label :: sourceOf rest := rfl

@[simp]
theorem sourceOf_pad (rest : List Token) :
    sourceOf (.pad :: rest) = sourceOf rest := rfl

@[simp]
theorem targetOf_data (program : Program) (label : Label)
    (rest : List Token) :
    targetOf program (.data label :: rest) =
      encodeLabel program label :: targetOf program rest := rfl

@[simp]
theorem targetOf_pad (program : Program) (rest : List Token) :
    targetOf program (.pad :: rest) =
      delayLabel program :: delayLabel program :: targetOf program rest := rfl

@[simp]
theorem sourceOf_append (left right : List Token) :
    sourceOf (left ++ right) = sourceOf left ++ sourceOf right := by
  induction left with
  | nil => rfl
  | cons token left ih =>
      cases token <;> simp [sourceOf, ih]

@[simp]
theorem targetOf_append (program : Program) (left right : List Token) :
    targetOf program (left ++ right) =
      targetOf program left ++ targetOf program right := by
  induction left with
  | nil => rfl
  | cons token left ih =>
      cases token <;> simp [targetOf, ih]

@[simp]
theorem sourceOf_dataTokens (word : List Label) :
    sourceOf (dataTokens word) = word := by
  induction word with
  | nil => rfl
  | cons label word ih =>
      change sourceOf (.data label :: dataTokens word) = label :: word
      simp [ih]

@[simp]
theorem targetOf_dataTokens (program : Program) (word : List Label) :
    targetOf program (dataTokens word) = encodeWord program word := by
  induction word with
  | nil => rfl
  | cons label word ih =>
      change targetOf program (.data label :: dataTokens word) =
        encodeLabel program label :: encodeWord program word
      simp [ih]

@[simp]
theorem sourceOf_rhsTokens (program : Program) (label : Label) :
    sourceOf (rhsTokens program label) = productionAt program label := by
  by_cases empty : productionAt program label = []
  · simp [rhsTokens, empty]
  · simp [rhsTokens, empty]

@[simp]
theorem targetOf_rhsTokens (program : Program) (label : Label) :
    targetOf program (rhsTokens program label) =
      normalizedRhs program (productionAt program label) := by
  by_cases empty : productionAt program label = []
  · simp [rhsTokens, normalizedRhs, empty]
  · simp [rhsTokens, normalizedRhs, empty]

@[simp]
theorem sourceOf_initialTokens (word : List Label) :
    sourceOf (dataTokens word ++ [.pad]) = word := by simp

@[simp]
theorem targetOf_initialTokens (program : Program) (word : List Label) :
    targetOf program (dataTokens word ++ [.pad]) =
      normalizeWord program word := by
  simp [normalizeWord]

@[simp]
theorem sourceOf_replicate_pad (count : Nat) :
    sourceOf (List.replicate count .pad) = [] := by
  induction count with
  | zero => rfl
  | succ count ih => simp [List.replicate_succ, ih]

/-! ## Finite-table arithmetic -/

@[simp]
theorem normalize_symbolCount (program : Program) :
    symbolCount (normalizeProgram program) = symbolCount program + 1 := by
  simp [symbolCount, normalizeProgram]

@[simp]
theorem normalize_distinguished (program : Program) :
    distinguished (normalizeProgram program) = delayLabel program := by
  simp [distinguished, delayLabel]

@[simp]
theorem normalize_haltLabel (program : Program) :
    haltLabel (normalizeProgram program) = targetHaltLabel program := by
  simp [haltLabel, targetHaltLabel]

theorem productionAt_normalize_old
    (program : Program) {label : Label}
    (labelLt : label < symbolCount program) :
    productionAt (normalizeProgram program) label =
      normalizedRhs program (productionAt program label) := by
  unfold symbolCount at labelLt
  unfold productionAt normalizeProgram
  change (program.productions.map (normalizedRhs program) ++
      [[delayLabel program, delayLabel program]]).getD label [] =
    normalizedRhs program (program.productions.getD label [])
  rw [List.getD_eq_getElem?_getD, List.getD_eq_getElem?_getD]
  rw [List.getElem?_append_left (by simpa using labelLt)]
  simp [labelLt]

@[simp]
theorem productionAt_normalize_delay (program : Program) :
    productionAt (normalizeProgram program) (delayLabel program) =
      [delayLabel program, delayLabel program] := by
  unfold productionAt normalizeProgram delayLabel symbolCount
  simp

theorem encodeLabel_eq_self
    (program : Program) {label : Label}
    (labelLt : label < symbolCount program) :
    encodeLabel program label = label := by
  unfold encodeLabel haltLabel
  simp [Nat.ne_of_lt labelLt]

@[simp]
theorem encodeLabel_halt (program : Program) :
    encodeLabel program (haltLabel program) = targetHaltLabel program := by
  simp [encodeLabel]

theorem encodeLabel_ne_delay
    (program : Program) {label : Label}
    (_valid : label ≤ haltLabel program) :
    encodeLabel program label ≠ delayLabel program := by
  unfold encodeLabel
  split
  next equal =>
    exact Nat.succ_ne_self (symbolCount program)
  next different =>
    exact different

theorem encodeLabel_le_targetHalt
    (program : Program) {label : Label}
    (valid : label ≤ haltLabel program) :
    encodeLabel program label ≤ targetHaltLabel program := by
  unfold encodeLabel
  split
  · exact Nat.le_refl _
  · exact Nat.le_trans valid (by
      simp [haltLabel, targetHaltLabel])

theorem encodeLabel_eq_targetHalt_iff
    (program : Program) {label : Label}
    (valid : label ≤ haltLabel program) :
    encodeLabel program label = targetHaltLabel program ↔
      label = haltLabel program := by
  constructor
  · intro equal
    unfold encodeLabel at equal
    split at equal
    next halt => exact halt
    next notHalt =>
      have valid' : label ≤ symbolCount program := by
        simpa [haltLabel] using valid
      have equal' : label = symbolCount program + 1 := by
        simpa [targetHaltLabel] using equal
      rw [equal'] at valid'
      exact (Nat.not_succ_le_self (symbolCount program) valid').elim
  · rintro rfl
    exact encodeLabel_halt program

/-! ## Well-formedness of the restricted table -/

/-- Every ordinary nonhalting row emits only ordinary or halt labels. -/
def ProductionLabelsValid (program : Program) : Prop :=
  ∀ label, label < symbolCount program →
    LabelsValid program (productionAt program label)

/-- The source-side invariant needed by the event-equivalence theorem. -/
structure Boundary (program : Program) (word : List Label) : Prop where
  labels : LabelsValid program word
  lengthTwo : 2 ≤ word.length

theorem encodeWord_labelsValid
    (program : Program) : ∀ {word : List Label},
    LabelsValid program word →
      LabelsValid (normalizeProgram program) (encodeWord program word)
  | [], _ => by
      intro label membership
      cases membership
  | first :: rest, valid => by
      intro label membership
      simp only [encodeWord, List.map, List.mem_cons] at membership
      rcases membership with equal | inRest
      · subst label
        rw [normalize_haltLabel]
        exact encodeLabel_le_targetHalt program
          (valid first (List.Mem.head rest))
      · exact encodeWord_labelsValid program
          (fun value inTail => valid value (List.Mem.tail first inTail))
          label inRest

theorem delay_labelsValid (program : Program) :
    LabelsValid (normalizeProgram program)
      [delayLabel program, delayLabel program] := by
  intro label membership
  simp only [List.mem_cons, List.not_mem_nil, or_false] at membership
  rcases membership with rfl | rfl
  · rw [normalize_haltLabel]
    simp [delayLabel, targetHaltLabel]
  · rw [normalize_haltLabel]
    simp [delayLabel, targetHaltLabel]

/-- The βDD table transformation lands in Rogozhin's literal `T2` class. -/
theorem normalize_isT2
    (program : Program) (rowsValid : ProductionLabelsValid program) :
    IsT2 (normalizeProgram program) := by
  refine ⟨by simp, ?_, ?_⟩
  · simpa using productionAt_normalize_delay program
  intro label labelLt
  have oldLt : label < symbolCount program := by
    simpa [delayLabel] using labelLt
  rw [productionAt_normalize_old program oldLt]
  by_cases empty : productionAt program label = []
  · refine ⟨[delayLabel program, delayLabel program], by simp, ?_,
      delay_labelsValid program⟩
    simp [normalizedRhs, empty]
  · refine ⟨encodeWord program (productionAt program label), ?_, ?_, ?_⟩
    · intro encodedEmpty
      have sourceEmpty : productionAt program label = [] := by
        simpa [encodeWord] using congrArg List.length encodedEmpty
      exact empty sourceEmpty
    · simp [normalizedRhs, empty]
    · exact encodeWord_labelsValid program (rowsValid label oldLt)

/-- Canonical normalized words are valid and retain at least two cells. -/
theorem normalize_wellFormed
    (program : Program) (rowsValid : ProductionLabelsValid program)
    {word : List Label} (boundary : Boundary program word) :
    WellFormed (normalizeProgram program) (normalizeWord program word) := by
  refine ⟨normalize_isT2 program rowsValid, ?_, ?_⟩
  · unfold normalizeWord
    exact WellFormed.labelsValid_append
      (encodeWord_labelsValid program boundary.labels)
      (delay_labelsValid program)
  · simp [normalizeWord]

theorem boundary_two_prefix
    {program : Program} {word : List Label}
    (boundary : Boundary program word) :
    ∃ first second rest, word = first :: second :: rest :=
  RogozhinTagInput.exists_two_prefix boundary.lengthTwo

/-! ## Exact normalized queue dynamics -/

theorem targetHalt_ne_delay (program : Program) :
    targetHaltLabel program ≠ delayLabel program := by
  change Nat.succ (symbolCount program) ≠ symbolCount program
  exact Nat.succ_ne_self _

theorem delay_ne_targetHalt (program : Program) :
    delayLabel program ≠ targetHaltLabel program := by
  intro equal
  exact targetHalt_ne_delay program equal.symm

/-- One selected padding pair rotates to the back of the aligned queue. -/
theorem absorbingStep_pad (program : Program) (tokens : List Token) :
    absorbingStep (normalizeProgram program)
        (targetOf program (.pad :: tokens)) =
      targetOf program (tokens ++ [.pad]) := by
  simp [absorbingStep, step?, targetOf, normalize_haltLabel,
    delay_ne_targetHalt, productionAt_normalize_delay]

/-- An ordinary selected symbol with an ordinary ignored neighbor. -/
theorem absorbingStep_data_data
    (program : Program) {first : Label} (firstLt : first < symbolCount program)
    (second : Label) (tokens : List Token) :
    absorbingStep (normalizeProgram program)
        (targetOf program (.data first :: .data second :: tokens)) =
      targetOf program (tokens ++ rhsTokens program first) := by
  have firstNe : first ≠ targetHaltLabel program := by
    unfold targetHaltLabel
    exact Nat.ne_of_lt
      (Nat.lt_trans firstLt (Nat.lt_succ_self (symbolCount program)))
  simp [absorbingStep, step?, targetOf, encodeLabel_eq_self program firstLt,
    normalize_haltLabel, firstNe, productionAt_normalize_old program
      firstLt]

/-- Crossing the first half of a padding pair enters the one-symbol phase. -/
theorem absorbingStep_data_pad
    (program : Program) {first : Label} (firstLt : first < symbolCount program)
    (tokens : List Token) :
    absorbingStep (normalizeProgram program)
        (targetOf program (.data first :: .pad :: tokens)) =
      delayLabel program ::
        targetOf program (tokens ++ rhsTokens program first) := by
  have firstNe : first ≠ targetHaltLabel program := by
    unfold targetHaltLabel
    exact Nat.ne_of_lt
      (Nat.lt_trans firstLt (Nat.lt_succ_self (symbolCount program)))
  simp [absorbingStep, step?, targetOf, encodeLabel_eq_self program firstLt,
    normalize_haltLabel, firstNe, productionAt_normalize_old program
      firstLt]

/-- A leading unmatched `D` crosses a complete padding token. -/
theorem absorbingStep_pending_pad
    (program : Program) (tokens : List Token) :
    absorbingStep (normalizeProgram program)
        (delayLabel program :: targetOf program (.pad :: tokens)) =
      delayLabel program :: targetOf program (tokens ++ [.pad]) := by
  simp [absorbingStep, step?, targetOf, normalize_haltLabel,
    delay_ne_targetHalt, productionAt_normalize_delay]

/-- A leading unmatched `D` consumes the ignored ordinary source symbol. -/
theorem absorbingStep_pending_data
    (program : Program) (ignored : Label) (tokens : List Token) :
    absorbingStep (normalizeProgram program)
        (delayLabel program :: targetOf program (.data ignored :: tokens)) =
      targetOf program (tokens ++ [.pad]) := by
  simp [absorbingStep, step?, targetOf, normalize_haltLabel,
    delay_ne_targetHalt, productionAt_normalize_delay]

/-- The embedded old halt head is an absorbing target word. -/
theorem absorbingStep_data_halt
    (program : Program) (tokens : List Token) :
    absorbingStep (normalizeProgram program)
        (targetOf program (.data (haltLabel program) :: tokens)) =
      targetOf program (.data (haltLabel program) :: tokens) := by
  cases tokens with
  | nil =>
      simp [absorbingStep, step?, targetOf]
  | cons token tokens =>
      cases token <;>
        simp [absorbingStep, step?, targetOf, normalize_haltLabel]

/-! ## The alignment automaton -/

/-- Aligned queues use whole `D D` tokens; pending queues have one leading D. -/
inductive Alignment where
  | aligned | pending
  deriving DecidableEq, Repr

structure QueueState where
  alignment : Alignment
  tokens : List Token
  deriving DecidableEq, Repr

/-- Source boundary represented by an alignment state. -/
def QueueState.sourceView : QueueState → List Label
  | ⟨.aligned, tokens⟩ => sourceOf tokens
  | ⟨.pending, tokens⟩ => (sourceOf tokens).tail

/-- Literal normalized word represented by an alignment state. -/
def QueueState.targetWord (program : Program) : QueueState → List Label
  | ⟨.aligned, tokens⟩ => targetOf program tokens
  | ⟨.pending, tokens⟩ => delayLabel program :: targetOf program tokens

/-- Whether this alignment step performs one ordinary source transition. -/
def QueueState.advances (program : Program) : QueueState → Bool
  | ⟨.aligned, .data first :: _second :: _rest⟩ =>
      decide (first ≠ haltLabel program)
  | _ => false

/-- Executable alignment update corresponding to one normalized tag step. -/
def QueueState.step (program : Program) : QueueState → QueueState
  | state@⟨.aligned, []⟩ => state
  | ⟨.aligned, .pad :: rest⟩ => ⟨.aligned, rest ++ [.pad]⟩
  | state@⟨.aligned, [.data _first]⟩ => state
  | state@⟨.aligned, .data first :: second :: rest⟩ =>
      if first = haltLabel program then state
      else
        match second with
        | .data _ignored => ⟨.aligned, rest ++ rhsTokens program first⟩
        | .pad => ⟨.pending, rest ++ rhsTokens program first⟩
  | state@⟨.pending, []⟩ => state
  | ⟨.pending, .pad :: rest⟩ => ⟨.pending, rest ++ [.pad]⟩
  | ⟨.pending, .data _ignored :: rest⟩ =>
      ⟨.aligned, rest ++ [.pad]⟩

@[simp]
theorem QueueState.sourceView_aligned (tokens : List Token) :
    (QueueState.mk .aligned tokens).sourceView = sourceOf tokens := rfl

@[simp]
theorem QueueState.sourceView_pending (tokens : List Token) :
    (QueueState.mk .pending tokens).sourceView = (sourceOf tokens).tail := rfl

@[simp]
theorem QueueState.targetWord_aligned
    (program : Program) (tokens : List Token) :
    (QueueState.mk .aligned tokens).targetWord program =
      targetOf program tokens := rfl

@[simp]
theorem QueueState.targetWord_pending
    (program : Program) (tokens : List Token) :
    (QueueState.mk .pending tokens).targetWord program =
      delayLabel program :: targetOf program tokens := rfl

/-- An aligned nonempty source view exposes a first data token after padding. -/
theorem firstData_decompose : ∀ {tokens : List Token} {first : Label}
    {rest : List Label},
    sourceOf tokens = first :: rest →
      ∃ padding tail,
        tokens = List.replicate padding .pad ++ .data first :: tail ∧
        sourceOf tail = rest := by
  intro tokens first rest equal
  induction tokens generalizing first rest with
  | nil => cases equal
  | cons token tail ih =>
      cases token with
      | data label =>
          simp only [sourceOf, List.cons.injEq] at equal
          rcases equal with ⟨rfl, tailEq⟩
          exact ⟨0, tail, rfl, tailEq⟩
      | pad =>
          obtain ⟨padding, suffix, tokensEq, sourceEq⟩ := ih equal
          refine ⟨padding + 1, suffix, ?_, sourceEq⟩
          simp [tokensEq, List.replicate_succ, Nat.add_comm]

/-- Two source cells determine the first two data tokens, with arbitrary pad. -/
theorem twoData_decompose
    {tokens : List Token} {first second : Label} {rest : List Label}
    (equal : sourceOf tokens = first :: second :: rest) :
    ∃ firstPadding secondPadding tail,
      tokens = List.replicate firstPadding .pad ++ .data first ::
        List.replicate secondPadding .pad ++ .data second :: tail ∧
      sourceOf tail = rest := by
  obtain ⟨firstPadding, afterFirst, tokensEq, afterFirstEq⟩ :=
    firstData_decompose equal
  obtain ⟨secondPadding, tail, afterFirstTokensEq, tailEq⟩ :=
    firstData_decompose afterFirstEq
  refine ⟨firstPadding, secondPadding, tail, ?_, tailEq⟩
  rw [tokensEq, afterFirstTokensEq]
  simp [List.append_assoc]

/-- The normalized queue update is literally one normalized absorbing step. -/
theorem QueueState.targetWord_step
    (program : Program) (state : QueueState)
    (boundary : Boundary program state.sourceView) :
    (state.step program).targetWord program =
      absorbingStep (normalizeProgram program) (state.targetWord program) := by
  rcases state with ⟨alignment, tokens⟩
  cases alignment with
  | aligned =>
      cases tokens with
      | nil =>
          have impossible := boundary.lengthTwo
          simp [QueueState.sourceView] at impossible
      | cons token rest =>
          cases token with
          | pad =>
              simpa [QueueState.step] using
                (absorbingStep_pad program rest).symm
          | data first =>
              cases rest with
              | nil =>
                  have impossible := boundary.lengthTwo
                  simp [QueueState.sourceView] at impossible
              | cons second tail =>
                  by_cases halt : first = haltLabel program
                  · subst first
                    simpa [QueueState.step] using
                      (absorbingStep_data_halt program (second :: tail)).symm
                  · have firstLe : first ≤ haltLabel program :=
                      boundary.labels first (by simp [QueueState.sourceView])
                    have firstLt : first < symbolCount program := by
                      unfold haltLabel at firstLe halt
                      exact Nat.lt_of_le_of_ne firstLe halt
                    cases second with
                    | data ignored =>
                        simpa [QueueState.step, halt] using
                          (absorbingStep_data_data program firstLt ignored tail).symm
                    | pad =>
                        simpa [QueueState.step, halt] using
                          (absorbingStep_data_pad program firstLt tail).symm
  | pending =>
      cases tokens with
      | nil =>
          have impossible := boundary.lengthTwo
          simp [QueueState.sourceView] at impossible
      | cons token rest =>
          cases token with
          | pad =>
              simpa [QueueState.step] using
                (absorbingStep_pending_pad program rest).symm
          | data ignored =>
              simpa [QueueState.step] using
                (absorbingStep_pending_data program ignored rest).symm

/-- At the source level, one queue step is either stuttering or one tag step. -/
theorem QueueState.sourceView_step
    (program : Program) (state : QueueState)
    (boundary : Boundary program state.sourceView) :
    (state.step program).sourceView =
      if state.advances program then
        absorbingStep program state.sourceView
      else state.sourceView := by
  rcases state with ⟨alignment, tokens⟩
  cases alignment with
  | aligned =>
      cases tokens with
      | nil =>
          have impossible := boundary.lengthTwo
          simp [QueueState.sourceView] at impossible
      | cons token rest =>
          cases token with
          | pad => simp [QueueState.step, QueueState.advances]
          | data first =>
              cases rest with
              | nil =>
                  have impossible := boundary.lengthTwo
                  simp [QueueState.sourceView] at impossible
              | cons second tail =>
                  by_cases halt : first = haltLabel program
                  · subst first
                    simp [QueueState.step, QueueState.advances,
                      absorbingStep, step?]
                  · cases second with
                    | data ignored =>
                        simp [QueueState.step, QueueState.advances, halt,
                          absorbingStep, step?]
                    | pad =>
                        cases sourceTail : sourceOf tail with
                        | nil =>
                            have tooShort := boundary.lengthTwo
                            simp [QueueState.sourceView, sourceTail] at tooShort
                        | cons ignored sourceRest =>
                            simp [QueueState.step, QueueState.advances, halt,
                              QueueState.sourceView, sourceTail, absorbingStep,
                              step?, List.tail_append]
  | pending =>
      cases tokens with
      | nil =>
          have impossible := boundary.lengthTwo
          simp [QueueState.sourceView] at impossible
      | cons token rest =>
          cases token <;>
            simp [QueueState.step, QueueState.advances,
              QueueState.sourceView]

/-! ## Every normalized iterate has a source-alignment witness -/

def QueueState.nextHorizon (program : Program) (state : QueueState)
    (horizon : Nat) : Nat :=
  if state.advances program then horizon + 1 else horizon

/-- Front-recursive iteration, convenient for literal queue execution. -/
def frontIterate (program : Program) : Nat → List Label → List Label
  | 0, word => word
  | fuel + 1, word => frontIterate program fuel (absorbingStep program word)

@[simp]
theorem frontIterate_zero (program : Program) (word : List Label) :
    frontIterate program 0 word = word := rfl

@[simp]
theorem frontIterate_succ (program : Program) (fuel : Nat)
    (word : List Label) :
    frontIterate program (fuel + 1) word =
      frontIterate program fuel (absorbingStep program word) := rfl

theorem frontIterate_eq_iterate (program : Program) :
    ∀ fuel word, frontIterate program fuel word = iterate program fuel word
  | 0, _ => rfl
  | fuel + 1, word => by
      rw [frontIterate_succ, frontIterate_eq_iterate]
      induction fuel with
      | zero => rfl
      | succ fuel ih =>
          rw [iterate_succ, iterate_succ, ih]

theorem tagIterate_add (program : Program) (word : List Label) :
    ∀ first second,
      iterate program (first + second) word =
        iterate program second (iterate program first word)
  | _, 0 => by simp
  | first, second + 1 => by
      rw [Nat.add_succ, iterate_succ, iterate_succ,
        tagIterate_add program word first second]

def QueueState.iterate (program : Program) : Nat → QueueState → QueueState
  | 0, state => state
  | fuel + 1, state => QueueState.iterate program fuel (state.step program)

/-- A target word paired with its exact source horizon and alignment state. -/
structure Represents
    (program : Program) (initialWord targetWord : List Label) where
  horizon : Nat
  state : QueueState
  source_eq : state.sourceView = iterate program horizon initialWord
  target_eq : state.targetWord program = targetWord

namespace Represents

/-- One target step preserves the source/alignment representation. -/
def step
    {program : Program} {initialWord targetWord : List Label}
    (trajectory : ∀ horizon,
      Boundary program (iterate program horizon initialWord))
    (represented : Represents program initialWord targetWord) :
    Represents program initialWord
      (absorbingStep (normalizeProgram program) targetWord) := by
  let nextState := represented.state.step program
  let nextHorizon := represented.state.nextHorizon program represented.horizon
  have currentBoundary : Boundary program represented.state.sourceView := by
    rw [represented.source_eq]
    exact trajectory represented.horizon
  refine ⟨nextHorizon, nextState, ?_, ?_⟩
  · have sourceStep := represented.state.sourceView_step program currentBoundary
    rw [represented.source_eq] at sourceStep
    cases advancesEq : represented.state.advances program with
    | false =>
        simpa [nextState, nextHorizon, QueueState.nextHorizon, advancesEq]
          using sourceStep
    | true =>
        simpa [nextState, nextHorizon, QueueState.nextHorizon, advancesEq]
          using sourceStep
  · have targetStep := represented.state.targetWord_step program currentBoundary
    rw [represented.target_eq] at targetStep
    exact targetStep

/-- Follow a finite number of normalized/alignment steps. -/
def steps
    {program : Program} {initialWord targetWord : List Label}
    (trajectory : ∀ horizon,
      Boundary program (iterate program horizon initialWord)) :
    (fuel : Nat) → Represents program initialWord targetWord →
      Represents program initialWord
        (frontIterate (normalizeProgram program) fuel targetWord)
  | 0, represented => represented
  | fuel + 1, represented =>
      steps trajectory fuel (represented.step trajectory)

@[simp]
theorem steps_state
    {program : Program} {initialWord targetWord : List Label}
    (trajectory : ∀ horizon,
      Boundary program (iterate program horizon initialWord)) :
    ∀ (fuel : Nat) (represented : Represents program initialWord targetWord),
      (represented.steps trajectory fuel).state =
        represented.state.iterate program fuel
  | 0, _ => rfl
  | fuel + 1, represented => by
      change (steps trajectory fuel (represented.step trajectory)).state = _
      rw [steps_state]
      rfl

end Represents

/-- Every concrete target iterate retains an explicit alignment witness. -/
def represents_iterate
    (program : Program) (initialWord : List Label)
    (trajectory : ∀ horizon,
      Boundary program (iterate program horizon initialWord)) :
    ∀ targetHorizon,
      Represents program initialWord
        (iterate (normalizeProgram program) targetHorizon
          (normalizeWord program initialWord))
  | 0 => by
      refine ⟨0, ⟨.aligned, dataTokens initialWord ++ [.pad]⟩, ?_, ?_⟩
      · simp
      · exact targetOf_initialTokens program initialWord
  | targetHorizon + 1 => by
      have previous := represents_iterate program initialWord trajectory
        targetHorizon
      exact previous.step trajectory

/-- For a two-cell source boundary, stopping is exactly the explicit halt head. -/
theorem Boundary.halted_iff_head
    {program : Program} {word : List Label}
    (boundary : Boundary program word) :
    Halted program word ↔ word.head? = some (haltLabel program) := by
  obtain ⟨first, second, rest, rfl⟩ := boundary_two_prefix boundary
  unfold Halted step?
  by_cases halt : first = haltLabel program
  · subst first
    simp
  · simp [halt]

/-- Computational decision procedure for the explicit tag stopping test. -/
def haltedDecidable (program : Program) (word : List Label) :
    Decidable (Halted program word) := by
  unfold Halted
  infer_instance

/-- A represented target halt exposes the old source halt at its own horizon. -/
theorem represented_halt_reflects
    (program : Program) (initialWord : List Label)
    (trajectory : ∀ horizon,
      Boundary program (iterate program horizon initialWord))
    {targetWord : List Label}
    (represented : Represents program initialWord targetWord)
    (targetHead : targetWord.head? =
      some (targetHaltLabel program)) :
    Halted program (iterate program represented.horizon initialWord) := by
  rcases represented with ⟨horizon, state, sourceEq, targetEq⟩
  have currentBoundary := trajectory horizon
  have stateBoundary : Boundary program state.sourceView := by
    rw [sourceEq]
    exact currentBoundary
  have targetHead' : (state.targetWord program).head? =
      some (targetHaltLabel program) := by
    rw [targetEq]
    exact targetHead
  rcases state with ⟨alignment, tokens⟩
  cases alignment with
  | pending =>
      simp only [QueueState.targetWord_pending, List.head?_cons,
        Option.some.injEq] at targetHead'
      exact (targetHalt_ne_delay program targetHead'.symm).elim
  | aligned =>
      cases tokens with
      | nil => simp at targetHead'
      | cons token rest =>
          cases token with
          | pad =>
              simp only [QueueState.targetWord_aligned, targetOf_pad,
                List.head?_cons, Option.some.injEq] at targetHead'
              exact (targetHalt_ne_delay program targetHead'.symm).elim
          | data label =>
              simp only [QueueState.targetWord_aligned, targetOf_data,
                List.head?_cons, Option.some.injEq] at targetHead'
              have labelValid : label ≤ haltLabel program := by
                exact stateBoundary.labels label (by
                  simp [QueueState.sourceView])
              have labelHalt :=
                (encodeLabel_eq_targetHalt_iff program labelValid).1 targetHead'
              apply (currentBoundary.halted_iff_head).2
              rw [← sourceEq]
              simp [QueueState.sourceView, labelHalt]

/-- Target halting cannot be introduced by the βDD padding dynamics. -/
theorem eventuallyHalts_reflects
    (program : Program) (initialWord : List Label)
    (rowsValid : ProductionLabelsValid program)
    (initialBoundary : Boundary program initialWord)
    (trajectory : ∀ horizon,
      Boundary program (iterate program horizon initialWord)) :
    EventuallyHalts
        ⟨normalizeProgram program, normalizeWord program initialWord⟩ →
      EventuallyHalts ⟨program, initialWord⟩ := by
  rintro ⟨targetHorizon, targetHalted⟩
  have targetWellFormed :=
    (normalize_wellFormed program rowsValid initialBoundary).iterate
      targetHorizon
  have targetHead :=
    (targetWellFormed.halted_iff_head).1 targetHalted
  rw [normalize_haltLabel] at targetHead
  let represented :=
    represents_iterate program initialWord trajectory targetHorizon
  exact ⟨represented.horizon,
    represented_halt_reflects program initialWord trajectory represented
      targetHead⟩

/-! ## Finite progress through padding -/

@[simp]
theorem QueueState.iterate_zero (program : Program) (state : QueueState) :
    state.iterate program 0 = state := rfl

@[simp]
theorem QueueState.iterate_succ (program : Program) (fuel : Nat)
    (state : QueueState) :
    state.iterate program (fuel + 1) =
      (state.step program).iterate program fuel := rfl

theorem QueueState.iterate_add (program : Program) :
    ∀ (first second : Nat) (state : QueueState),
      state.iterate program (first + second) =
        (state.iterate program first).iterate program second
  | 0, _, _ => by simp
  | first + 1, second, state => by
      rw [Nat.succ_add, QueueState.iterate_succ,
        QueueState.iterate_succ, QueueState.iterate_add]

/-- Exact rotation of a finite aligned padding prefix. -/
theorem QueueState.iterate_aligned_padding
    (program : Program) : ∀ padding rest,
    (QueueState.mk .aligned
      (List.replicate padding .pad ++ rest)).iterate program padding =
      ⟨.aligned, rest ++ List.replicate padding .pad⟩
  | 0, rest => by simp
  | padding + 1, rest => by
      rw [List.replicate_succ]
      simp only [List.cons_append, QueueState.iterate_succ, QueueState.step]
      rw [List.append_assoc]
      change (QueueState.mk .aligned
        (List.replicate padding Token.pad ++ (rest ++ [.pad]))).iterate
          program padding = _
      exact (QueueState.iterate_aligned_padding program padding
        (rest ++ [Token.pad])).trans (by
          simp [List.replicate_succ, List.append_assoc])

/-- Exact rotation of a finite pending padding prefix. -/
theorem QueueState.iterate_pending_padding
    (program : Program) : ∀ padding rest,
    (QueueState.mk .pending
      (List.replicate padding .pad ++ rest)).iterate program padding =
      ⟨.pending, rest ++ List.replicate padding .pad⟩
  | 0, rest => by simp
  | padding + 1, rest => by
      rw [List.replicate_succ]
      simp only [List.cons_append, QueueState.iterate_succ, QueueState.step]
      rw [List.append_assoc]
      change (QueueState.mk .pending
        (List.replicate padding Token.pad ++ (rest ++ [.pad]))).iterate
          program padding = _
      exact (QueueState.iterate_pending_padding program padding
        (rest ++ [Token.pad])).trans (by
          simp [List.replicate_succ, List.append_assoc])

/-- A pending phase reaches an aligned queue after finitely many stutters. -/
theorem QueueState.pending_settles
    (program : Program) {tokens : List Token} {sourceWord : List Label}
    (sourceEq : (sourceOf tokens).tail = sourceWord)
    (nonempty : sourceWord ≠ []) :
    ∃ fuel alignedTokens,
      0 < fuel ∧
      (QueueState.mk .pending tokens).iterate program fuel =
        ⟨.aligned, alignedTokens⟩ ∧
      sourceOf alignedTokens = sourceWord := by
  cases sourceTokens : sourceOf tokens with
  | nil =>
      have sourceEmpty : sourceWord = [] := by
        simpa [sourceTokens] using sourceEq.symm
      exact (nonempty sourceEmpty).elim
  | cons ignored afterIgnored =>
      have afterEq : afterIgnored = sourceWord := by
        simpa [sourceTokens] using sourceEq
      obtain ⟨padding, tail, tokensEq, tailEq⟩ :=
        firstData_decompose sourceTokens
      let alignedTokens :=
        (tail ++ List.replicate padding .pad) ++ [.pad]
      refine ⟨padding + 1, alignedTokens, Nat.zero_lt_succ padding, ?_, ?_⟩
      · rw [tokensEq, QueueState.iterate_add]
        rw [QueueState.iterate_pending_padding program padding
          (.data ignored :: tail)]
        simp [QueueState.step, alignedTokens]
      · simp [alignedTokens, tailEq, afterEq]

/-- From an aligned nonhalting boundary, padding cannot delay forever. -/
theorem QueueState.aligned_advances
    (program : Program) {tokens : List Token}
    (boundary : Boundary program (sourceOf tokens))
    (notHalted : ¬Halted program (sourceOf tokens)) :
    ∃ fuel next,
      0 < fuel ∧
      (QueueState.mk .aligned tokens).iterate program fuel = next ∧
      next.sourceView = absorbingStep program (sourceOf tokens) := by
  obtain ⟨first, second, rest, sourceEq⟩ :=
    boundary_two_prefix boundary
  have notHaltHead : first ≠ haltLabel program := by
    intro equal
    apply notHalted
    apply (boundary.halted_iff_head).2
    rw [sourceEq, equal]
    rfl
  obtain ⟨padding, tail, tokensEq, tailEq⟩ :=
    firstData_decompose sourceEq
  let exposed : QueueState :=
    ⟨.aligned, .data first :: tail ++ List.replicate padding .pad⟩
  let next := exposed.step program
  have rotated : (QueueState.mk .aligned tokens).iterate program padding =
      exposed := by
    rw [tokensEq, QueueState.iterate_aligned_padding]
  have exposedSource : exposed.sourceView = sourceOf tokens := by
    simp [exposed, sourceEq, tailEq]
  have exposedBoundary : Boundary program exposed.sourceView := by
    rw [exposedSource]
    exact boundary
  have advances : exposed.advances program = true := by
    have tailNonempty : tail ≠ [] := by
      intro tailEmpty
      subst tail
      simp at tailEq
    cases tail with
    | nil => contradiction
    | cons token tail =>
        simp [exposed, QueueState.advances, notHaltHead]
  have sourceStep := exposed.sourceView_step program exposedBoundary
  simp [advances, exposedSource] at sourceStep
  refine ⟨padding + 1, next, Nat.zero_lt_succ padding, ?_, ?_⟩
  · rw [QueueState.iterate_add, rotated]
    rfl
  · exact sourceStep

/-- Every nonhalting represented boundary reaches its next source boundary. -/
theorem QueueState.advances_finitely
    (program : Program) (state : QueueState)
    (boundary : Boundary program state.sourceView)
    (notHalted : ¬Halted program state.sourceView) :
    ∃ fuel next,
      0 < fuel ∧ state.iterate program fuel = next ∧
      next.sourceView = absorbingStep program state.sourceView := by
  rcases state with ⟨alignment, tokens⟩
  cases alignment with
  | aligned =>
      exact QueueState.aligned_advances program boundary notHalted
  | pending =>
      have sourceNonempty : (sourceOf tokens).tail ≠ [] := by
        intro empty
        have tooShort := boundary.lengthTwo
        simp [QueueState.sourceView, empty] at tooShort
      obtain ⟨settleFuel, alignedTokens, settlePositive, settles,
          alignedSource⟩ :=
        QueueState.pending_settles program rfl sourceNonempty
      have alignedBoundary : Boundary program (sourceOf alignedTokens) := by
        rw [alignedSource]
        exact boundary
      have alignedNotHalted : ¬Halted program (sourceOf alignedTokens) := by
        rw [alignedSource]
        exact notHalted
      obtain ⟨advanceFuel, next, advancePositive, advances,
          nextSource⟩ :=
        QueueState.aligned_advances program alignedBoundary alignedNotHalted
      refine ⟨settleFuel + advanceFuel, next, Nat.add_pos_left settlePositive _,
        ?_, ?_⟩
      · rw [QueueState.iterate_add, settles]
        exact advances
      · rw [alignedSource] at nextSource
        exact nextSource

/-! ## Source halts are reached after finitely many padding steps -/

theorem halted_targetOf_data_halt
    (program : Program) (tokens : List Token) :
    Halted (normalizeProgram program)
      (targetOf program (.data (haltLabel program) :: tokens)) := by
  unfold Halted step?
  cases tokens with
  | nil => rfl
  | cons token tokens =>
      cases token <;> simp [targetOf, normalize_haltLabel]

/-- Any alignment state can first settle to a whole-token boundary. -/
theorem QueueState.settles
    (program : Program) (state : QueueState)
    (boundary : Boundary program state.sourceView) :
    ∃ fuel alignedTokens,
      state.iterate program fuel = ⟨.aligned, alignedTokens⟩ ∧
      sourceOf alignedTokens = state.sourceView := by
  rcases state with ⟨alignment, tokens⟩
  cases alignment with
  | aligned => exact ⟨0, tokens, rfl, rfl⟩
  | pending =>
      have sourceNonempty : (sourceOf tokens).tail ≠ [] := by
        intro empty
        have tooShort := boundary.lengthTwo
        simp [QueueState.sourceView, empty] at tooShort
      obtain ⟨fuel, alignedTokens, positive, run, sourceEq⟩ :=
        QueueState.pending_settles program rfl sourceNonempty
      exact ⟨fuel, alignedTokens, run, sourceEq⟩

/-- A represented source halt becomes a literal normalized halt after finite delay. -/
theorem represented_halt_reaches
    (program : Program) (initialWord : List Label)
    (trajectory : ∀ horizon,
      Boundary program (iterate program horizon initialWord))
    {targetWord : List Label}
    (represented : Represents program initialWord targetWord)
    (sourceHalted : Halted program represented.state.sourceView) :
    ∃ fuel,
      Halted (normalizeProgram program)
        (frontIterate (normalizeProgram program) fuel targetWord) := by
  have stateBoundary : Boundary program represented.state.sourceView := by
    rw [represented.source_eq]
    exact trajectory represented.horizon
  obtain ⟨settleFuel, alignedTokens, settles, alignedSource⟩ :=
    represented.state.settles program stateBoundary
  have haltHead : represented.state.sourceView.head? =
      some (haltLabel program) :=
    (stateBoundary.halted_iff_head).1 sourceHalted
  have alignedHead : (sourceOf alignedTokens).head? =
      some (haltLabel program) := by
    rw [alignedSource]
    exact haltHead
  cases alignedSourceEq : sourceOf alignedTokens with
  | nil => simp [alignedSourceEq] at alignedHead
  | cons first sourceRest =>
      simp only [alignedSourceEq, List.head?_cons, Option.some.injEq]
        at alignedHead
      subst first
      obtain ⟨padding, tail, tokensEq, tailEq⟩ :=
        firstData_decompose alignedSourceEq
      let totalFuel := settleFuel + padding
      have finalState : represented.state.iterate program totalFuel =
          ⟨.aligned, .data (haltLabel program) ::
            tail ++ List.replicate padding .pad⟩ := by
        dsimp [totalFuel]
        rw [QueueState.iterate_add, settles, tokensEq,
          QueueState.iterate_aligned_padding]
        rfl
      let followed := represented.steps trajectory totalFuel
      have followedState : followed.state =
          ⟨.aligned, .data (haltLabel program) ::
            tail ++ List.replicate padding .pad⟩ := by
        rw [Represents.steps_state]
        exact finalState
      refine ⟨totalFuel, ?_⟩
      have halted := halted_targetOf_data_halt program
        (tail ++ List.replicate padding .pad)
      have targetEq := followed.target_eq
      rw [followedState] at targetEq
      rw [← targetEq]
      exact halted

/--
After any requested number of source horizons, either the target has already
halted or an explicit normalized iterate represents that source boundary.
-/
theorem simulate_or_halt
    (program : Program) (initialWord : List Label)
    (trajectory : ∀ horizon,
      Boundary program (iterate program horizon initialWord)) :
    ∀ sourceHorizon,
      EventuallyHalts
          ⟨normalizeProgram program, normalizeWord program initialWord⟩ ∨
        ∃ targetHorizon,
          ∃ represented : Represents program initialWord
            (iterate (normalizeProgram program) targetHorizon
              (normalizeWord program initialWord)),
          represented.state.sourceView =
            iterate program sourceHorizon initialWord
  | 0 => by
      right
      let represented := represents_iterate program initialWord trajectory 0
      refine ⟨0, represented, ?_⟩
      simp [represented, represents_iterate, QueueState.sourceView]
  | sourceHorizon + 1 => by
      rcases simulate_or_halt program initialWord trajectory sourceHorizon with
        alreadyHalted | ⟨targetHorizon, represented, stateSource⟩
      · exact Or.inl alreadyHalted
      · cases haltedDecidable program
          (iterate program sourceHorizon initialWord) with
        | isTrue currentHalted =>
          left
          have representedHalted : Halted program represented.state.sourceView := by
            rw [stateSource]
            exact currentHalted
          obtain ⟨fuel, targetHalted⟩ :=
            represented_halt_reaches program initialWord trajectory represented
              representedHalted
          refine ⟨targetHorizon + fuel, ?_⟩
          rw [frontIterate_eq_iterate] at targetHalted
          rw [tagIterate_add (normalizeProgram program)
            (normalizeWord program initialWord) targetHorizon fuel]
          exact targetHalted
        | isFalse currentHalted =>
          right
          have stateBoundary : Boundary program represented.state.sourceView := by
            rw [stateSource]
            exact trajectory sourceHorizon
          have stateNotHalted : ¬Halted program represented.state.sourceView := by
            rw [stateSource]
            exact currentHalted
          obtain ⟨fuel, next, positive, queueRun, nextSource⟩ :=
            represented.state.advances_finitely program stateBoundary
              stateNotHalted
          let followed := represented.steps trajectory fuel
          have followedState : followed.state = next := by
            rw [Represents.steps_state]
            exact queueRun
          have combinedTarget :
              frontIterate (normalizeProgram program) fuel
                  (iterate (normalizeProgram program) targetHorizon
                    (normalizeWord program initialWord)) =
                iterate (normalizeProgram program) (targetHorizon + fuel)
                  (normalizeWord program initialWord) := by
            rw [frontIterate_eq_iterate]
            exact (tagIterate_add (normalizeProgram program)
              (normalizeWord program initialWord) targetHorizon fuel).symm
          let global : Represents program initialWord
              (iterate (normalizeProgram program) (targetHorizon + fuel)
                (normalizeWord program initialWord)) :=
            { horizon := followed.horizon
              state := followed.state
              source_eq := followed.source_eq
              target_eq := followed.target_eq.trans combinedTarget }
          refine ⟨targetHorizon + fuel, global, ?_⟩
          change followed.state.sourceView = _
          rw [followedState, nextSource, stateSource]
          rfl

/-- Every explicit source halt is eventually exposed as the shifted halt head. -/
theorem eventuallyHalts_forward
    (program : Program) (initialWord : List Label)
    (trajectory : ∀ horizon,
      Boundary program (iterate program horizon initialWord)) :
    EventuallyHalts ⟨program, initialWord⟩ →
      EventuallyHalts
        ⟨normalizeProgram program, normalizeWord program initialWord⟩ := by
  rintro ⟨sourceHorizon, sourceHalted⟩
  rcases simulate_or_halt program initialWord trajectory sourceHorizon with
    alreadyHalted | ⟨targetHorizon, represented, stateSource⟩
  · exact alreadyHalted
  · have representedHalted : Halted program represented.state.sourceView := by
      rw [stateSource]
      exact sourceHalted
    obtain ⟨fuel, targetHalted⟩ :=
      represented_halt_reaches program initialWord trajectory represented
        representedHalted
    refine ⟨targetHorizon + fuel, ?_⟩
    rw [frontIterate_eq_iterate] at targetHalted
    rw [tagIterate_add (normalizeProgram program)
      (normalizeWord program initialWord) targetHorizon fuel]
    exact targetHalted

/-- Full halt-event equivalence for every invariant-preserving ordinary job. -/
theorem eventuallyHalts_iff
    (program : Program) (initialWord : List Label)
    (rowsValid : ProductionLabelsValid program)
    (initialBoundary : Boundary program initialWord)
    (trajectory : ∀ horizon,
      Boundary program (iterate program horizon initialWord)) :
    EventuallyHalts
        ⟨normalizeProgram program, normalizeWord program initialWord⟩ ↔
      EventuallyHalts ⟨program, initialWord⟩ := by
  constructor
  · exact eventuallyHalts_reflects program initialWord rowsValid
      initialBoundary trajectory
  · exact eventuallyHalts_forward program initialWord trajectory

end DeletionTwoT2Normalizer

end PureSFormal.Computation
