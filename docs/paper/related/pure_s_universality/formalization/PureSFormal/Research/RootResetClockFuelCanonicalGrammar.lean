import PureSFormal.Research.RootResetClockFuelStages

/-!
# Parser-independent canonical clock/fuel grammar

The executable clock/fuel classifier retains duplicated runtime
fields independently.  This module gives those accepted rows a separate
semantic grammar.  Fixed action wrappers and continuation arities are stated
as propositions about generated syntax; they are not supplied as parser
roles, and no executable check compares two opaque runtime fields.

`CanonicalFuelRow` is the independent-copy grammar used by the restricted
local parser below.  `ZeroPosition.row` is the diagonal generated refinement
used by the scheduler's five-contraction zero-fuel sample.  Keeping these two
levels distinct records exactly where reachability supplies copy equalities.
-/

namespace PureSFormal.Research.RootResetClockFuelCanonicalGrammar

open PureSFormal.PureS
open SchedulerInvariant
open RootResetClockFuelStages

/-! ## Fixed-wrapper fields -/

/-- A field has the fixed public action wrapper and an opaque seed payload. -/
def OpenField (actions field : Term) : Prop :=
  ∃ seedPayload,
    field = CheckpointDecoder.openEnvironment actions seedPayload

/-- A `b` argument whose environment has the fixed public action wrapper. -/
def BOpenField (actions field : Term) : Prop :=
  ∃ seedPayload,
    field = .app b
      (CheckpointDecoder.openEnvironment actions seedPayload)

/-- Executable fixed-wrapper probe; its payload is returned but not inspected. -/
def parseOpenField? (actions : Term) (field : Term) : Option Term :=
  CheckpointDecoder.parseEnvironment? actions field

/-- Executable `b`-argument probe; it compares only the fixed `b` marker. -/
def parseBOpenField? (actions : Term) : Term → Option Term
  | .app foundB environment =>
      if foundB = b then
        CheckpointDecoder.parseEnvironment? actions environment
      else none
  | .s => none

/-- Boolean continuation check used by the canonical parser. -/
def admissibleField (field : Term) : Bool :=
  Term.exactHeadArity field 3 || Term.exactHeadArity field 4

theorem parseOpenField?_sound
    {actions field seedPayload : Term}
    (h : parseOpenField? actions field = some seedPayload) :
    OpenField actions field := by
  exact ⟨seedPayload, CheckpointDecoder.parseEnvironment?_sound h⟩

@[simp]
theorem parseOpenField?_generated (actions seedPayload : Term) :
    parseOpenField? actions
        (CheckpointDecoder.openEnvironment actions seedPayload) =
      some seedPayload := by
  exact CheckpointDecoder.parseEnvironment?_open actions seedPayload

theorem parseOpenField?_complete
    {actions field : Term} (h : OpenField actions field) :
    ∃ seedPayload, parseOpenField? actions field = some seedPayload := by
  rcases h with ⟨seedPayload, rfl⟩
  exact ⟨seedPayload, parseOpenField?_generated actions seedPayload⟩

theorem parseBOpenField?_sound
    {actions field seedPayload : Term}
    (h : parseBOpenField? actions field = some seedPayload) :
    BOpenField actions field := by
  cases field with
  | s => simp [parseBOpenField?] at h
  | app foundB environment =>
      by_cases fixed : foundB = b
      · subst foundB
        exact ⟨seedPayload, congrArg (fun environment => Term.app b environment)
          (CheckpointDecoder.parseEnvironment?_sound (by
            simpa [parseBOpenField?] using h))⟩
      · simp [parseBOpenField?, fixed] at h

@[simp]
theorem parseBOpenField?_generated (actions seedPayload : Term) :
    parseBOpenField? actions
        (.app b (CheckpointDecoder.openEnvironment actions seedPayload)) =
      some seedPayload := by
  simp [parseBOpenField?, CheckpointDecoder.parseEnvironment?_open]

theorem parseBOpenField?_complete
    {actions field : Term} (h : BOpenField actions field) :
    ∃ seedPayload, parseBOpenField? actions field = some seedPayload := by
  rcases h with ⟨seedPayload, rfl⟩
  exact ⟨seedPayload, parseBOpenField?_generated actions seedPayload⟩

@[simp]
theorem openField_open (actions seedPayload : Term) :
    OpenField actions
      (CheckpointDecoder.openEnvironment actions seedPayload) :=
  ⟨seedPayload, rfl⟩

@[simp]
theorem bOpenField_open (actions seedPayload : Term) :
    BOpenField actions
      (.app b (CheckpointDecoder.openEnvironment actions seedPayload)) :=
  ⟨seedPayload, rfl⟩

theorem admissibleField_eq_true_iff (field : Term) :
    admissibleField field = true ↔ Carrier.Admissible field := by
  simp [admissibleField, Carrier.Admissible,
    Term.exactHeadArity_eq_true_iff]

/-! ## Canonical clock rows -/

/-- Numeric constraints represented by each of the three clock alternatives. -/
def ClockCoordinates (view : ClockView) : Prop :=
  match view.stage with
  | .growPositive =>
      0 < view.residual ∧ view.wrappers + view.residual = view.horizon
  | .growZero =>
      view.residual = 0 ∧ view.wrappers = view.horizon
  | .launch =>
      view.wrappers = 0 ∧ 0 < view.residual ∧
        view.residual ≤ view.horizon

/-- Parser-independent clock grammar with a fixed action wrapper. -/
def CanonicalClock (actions : Term) (view : ClockView) : Prop :=
  ClockCoordinates view ∧ OpenField actions view.environment

/-- Every role-free clock result satisfies its literal numeric constraints. -/
theorem parseClock?_coordinates
    {term : Term} {view : ClockView}
    (h : parseClock? term = some view) : ClockCoordinates view := by
  cases term with
  | s => simp [parseClock?] at h
  | app core environment =>
      generalize hgrowth : parseClockCore? core = growthResult at h
      cases growthResult with
      | some growth =>
          by_cases balance :
              growth.wrappers + growth.residual = growth.stage
          · cases residualEq : growth.residual with
            | zero =>
                simp [parseClock?, hgrowth, balance, residualEq] at h
                have viewEq := h.2
                subst view
                simpa [ClockCoordinates, residualEq] using h.1
            | succ residual =>
                simp [parseClock?, hgrowth, balance, residualEq] at h
                have viewEq := h.2
                subst view
                simp [ClockCoordinates, residualEq, h.1]
          · simp [parseClock?, hgrowth, balance] at h
      | none =>
          generalize hexit : parseClockExitCore? core = exitResult at h
          cases exitResult with
          | none => simp [parseClock?, hgrowth, hexit] at h
          | some exit =>
              cases remainingEq : exit.remaining with
              | zero =>
                  simp [parseClock?, hgrowth, hexit, remainingEq] at h
              | succ remaining =>
                  by_cases bound : remaining + 1 ≤ exit.stage
                  · simp [parseClock?, hgrowth, hexit, remainingEq, bound] at h
                    subst view
                    simp [ClockCoordinates, remainingEq, bound]
                  · simp [parseClock?, hgrowth, hexit, remainingEq, bound] at h

/-- Canonical clock rows are accepted exactly by the role-free clock parser. -/
theorem CanonicalClock.parseClock
    {actions : Term} {view : ClockView}
    (canonical : CanonicalClock actions view) :
    parseClock? view.term = some view := by
  rcases canonical with ⟨coordinates, _⟩
  rcases view with ⟨stage, horizon, wrappers, residual, environment⟩
  cases stage with
  | growPositive =>
      simp [ClockCoordinates] at coordinates
      rcases coordinates with ⟨positive, balance⟩
      cases residual with
      | zero => simp at positive
      | succ remaining =>
          simpa [ClockView.term] using
            parseClock?_generated_positive horizon wrappers remaining
              environment balance
  | growZero =>
      simp [ClockCoordinates] at coordinates
      rcases coordinates with ⟨rfl, balance⟩
      simpa [ClockView.term] using
        parseClock?_generated_zero horizon wrappers environment balance
  | launch =>
      simp [ClockCoordinates] at coordinates
      rcases coordinates with ⟨rfl, positive, bound⟩
      cases residual with
      | zero => simp at positive
      | succ remaining =>
          simpa [ClockView.term] using
            parseClock?_generated_launch horizon remaining environment bound

/-- A fixed-wrapper clock parser that does not inspect the seed payload. -/
def parseCanonicalClock? (actions term : Term) : Option ClockView :=
  match parseClock? term with
  | none => none
  | some view =>
      match parseOpenField? actions view.environment with
      | none => none
      | some _ => some view

theorem parseCanonicalClock?_sound
    {actions term : Term} {view : ClockView}
    (h : parseCanonicalClock? actions term = some view) :
    term = view.term ∧ CanonicalClock actions view := by
  unfold parseCanonicalClock? at h
  generalize hclock : parseClock? term = clockResult
  rw [hclock] at h
  cases clockResult with
  | none => simp at h
  | some found =>
      simp only at h
      generalize hfield : parseOpenField? actions found.environment = fieldResult
      rw [hfield] at h
      cases fieldResult with
      | none => simp at h
      | some seedPayload =>
          have foundEq := Option.some.inj h
          subst found
          exact ⟨parseClock?_sound hclock,
            ⟨parseClock?_coordinates hclock,
              parseOpenField?_sound hfield⟩⟩

theorem parseCanonicalClock?_complete
    {actions term : Term} {view : ClockView}
    (source : term = view.term)
    (canonical : CanonicalClock actions view) :
    parseCanonicalClock? actions term = some view := by
  subst term
  obtain ⟨seedPayload, parsed⟩ :=
    parseOpenField?_complete canonical.2
  simp [parseCanonicalClock?, canonical.parseClock, parsed]

/-! ## Independent-copy canonical fuel rows -/

/--
Semantic grammar for a locally actionable fuel row.  Every environment copy
has the fixed action wrapper.  Every retained continuation copy is checked
independently.  No equality between those copies is part of this predicate.
-/
def CanonicalFuelRow (actions : Term) : FuelRow → Prop
  | .call _ environment continuation =>
      OpenField actions environment ∧
      Carrier.Admissible continuation
  | .positiveHalf _ leftEnvironment rightEnvironment continuation =>
      OpenField actions leftEnvironment ∧
      OpenField actions rightEnvironment ∧
      Carrier.Admissible continuation
  | .zeroFirst leftEnvironment rightEnvironment continuation =>
      OpenField actions leftEnvironment ∧
      OpenField actions rightEnvironment ∧
      Carrier.Admissible continuation
  | .zeroSecond leftArgument function rightArgument continuation =>
      BOpenField actions leftArgument ∧
      OpenField actions function ∧
      BOpenField actions rightArgument ∧
      Carrier.Admissible continuation
  | .zeroThird environment leftContinuation function rightArgument
      rightContinuation =>
      OpenField actions environment ∧
      Carrier.Admissible leftContinuation ∧
      OpenField actions function ∧
      BOpenField actions rightArgument ∧
      Carrier.Admissible rightContinuation
  | .zeroFourth leftContinuation environment rightContinuation _ =>
      Carrier.Admissible leftContinuation ∧
      OpenField actions environment ∧
      Carrier.Admissible rightContinuation

/-- Boolean field check used after the role-free row parser succeeds. -/
def canonicalFuelRowFields (actions : Term) : FuelRow → Bool
  | .call _ environment continuation =>
      (parseOpenField? actions environment).isSome &&
      admissibleField continuation
  | .positiveHalf _ leftEnvironment rightEnvironment continuation =>
      (parseOpenField? actions leftEnvironment).isSome &&
      (parseOpenField? actions rightEnvironment).isSome &&
      admissibleField continuation
  | .zeroFirst leftEnvironment rightEnvironment continuation =>
      (parseOpenField? actions leftEnvironment).isSome &&
      (parseOpenField? actions rightEnvironment).isSome &&
      admissibleField continuation
  | .zeroSecond leftArgument function rightArgument continuation =>
      (parseBOpenField? actions leftArgument).isSome &&
      (parseOpenField? actions function).isSome &&
      (parseBOpenField? actions rightArgument).isSome &&
      admissibleField continuation
  | .zeroThird environment leftContinuation function rightArgument
      rightContinuation =>
      (parseOpenField? actions environment).isSome &&
      admissibleField leftContinuation &&
      (parseOpenField? actions function).isSome &&
      (parseBOpenField? actions rightArgument).isSome &&
      admissibleField rightContinuation
  | .zeroFourth leftContinuation environment rightContinuation _ =>
      admissibleField leftContinuation &&
      (parseOpenField? actions environment).isSome &&
      admissibleField rightContinuation

/-- The restricted parser accepts only rows satisfying the semantic grammar. -/
def parseCanonicalFuelRow? (actions term : Term) : Option FuelRow :=
  match parseFuelRow? term with
  | none => none
  | some row =>
      if canonicalFuelRowFields actions row then some row else none

private theorem parseOpenField?_isSome_eq_true_iff
    (actions field : Term) :
    (parseOpenField? actions field).isSome = true ↔
      OpenField actions field := by
  cases parsed : parseOpenField? actions field with
  | none =>
      constructor
      · intro impossible
        simp at impossible
      · intro canonical
        obtain ⟨seedPayload, accepted⟩ := parseOpenField?_complete canonical
        rw [parsed] at accepted
        contradiction
  | some seedPayload =>
      constructor
      · intro _
        exact parseOpenField?_sound parsed
      · intro _
        rfl

private theorem parseBOpenField?_isSome_eq_true_iff
    (actions field : Term) :
    (parseBOpenField? actions field).isSome = true ↔
      BOpenField actions field := by
  cases parsed : parseBOpenField? actions field with
  | none =>
      constructor
      · intro impossible
        simp at impossible
      · intro canonical
        obtain ⟨seedPayload, accepted⟩ := parseBOpenField?_complete canonical
        rw [parsed] at accepted
        contradiction
  | some seedPayload =>
      constructor
      · intro _
        exact parseBOpenField?_sound parsed
      · intro _
        rfl

theorem canonicalFuelRowFields_eq_true_iff
    (actions : Term) (row : FuelRow) :
    canonicalFuelRowFields actions row = true ↔
      CanonicalFuelRow actions row := by
  cases row with
  | call fuel environment continuation =>
      simp only [canonicalFuelRowFields, CanonicalFuelRow,
        Bool.and_eq_true]
      constructor
      · rintro ⟨environmentOpen, continuationAdmissible⟩
        exact ⟨(parseOpenField?_isSome_eq_true_iff actions environment).mp
            environmentOpen,
          (admissibleField_eq_true_iff continuation).mp
            continuationAdmissible⟩
      · rintro ⟨environmentOpen, continuationAdmissible⟩
        exact ⟨(parseOpenField?_isSome_eq_true_iff actions environment).mpr
            environmentOpen,
          (admissibleField_eq_true_iff continuation).mpr
            continuationAdmissible⟩
  | positiveHalf residual leftEnvironment rightEnvironment continuation =>
      simp only [canonicalFuelRowFields, CanonicalFuelRow,
        Bool.and_eq_true]
      constructor
      · rintro ⟨⟨leftOpen, rightOpen⟩, continuationAdmissible⟩
        exact ⟨(parseOpenField?_isSome_eq_true_iff actions leftEnvironment).mp
            leftOpen,
          (parseOpenField?_isSome_eq_true_iff actions rightEnvironment).mp
            rightOpen,
          (admissibleField_eq_true_iff continuation).mp
            continuationAdmissible⟩
      · rintro ⟨leftOpen, rightOpen, continuationAdmissible⟩
        exact ⟨⟨
            (parseOpenField?_isSome_eq_true_iff actions leftEnvironment).mpr
              leftOpen,
            (parseOpenField?_isSome_eq_true_iff actions rightEnvironment).mpr
              rightOpen⟩,
          (admissibleField_eq_true_iff continuation).mpr
            continuationAdmissible⟩
  | zeroFirst leftEnvironment rightEnvironment continuation =>
      simp only [canonicalFuelRowFields, CanonicalFuelRow,
        Bool.and_eq_true]
      constructor
      · rintro ⟨⟨leftOpen, rightOpen⟩, continuationAdmissible⟩
        exact ⟨(parseOpenField?_isSome_eq_true_iff actions leftEnvironment).mp
            leftOpen,
          (parseOpenField?_isSome_eq_true_iff actions rightEnvironment).mp
            rightOpen,
          (admissibleField_eq_true_iff continuation).mp
            continuationAdmissible⟩
      · rintro ⟨leftOpen, rightOpen, continuationAdmissible⟩
        exact ⟨⟨
            (parseOpenField?_isSome_eq_true_iff actions leftEnvironment).mpr
              leftOpen,
            (parseOpenField?_isSome_eq_true_iff actions rightEnvironment).mpr
              rightOpen⟩,
          (admissibleField_eq_true_iff continuation).mpr
            continuationAdmissible⟩
  | zeroSecond leftArgument function rightArgument continuation =>
      simp only [canonicalFuelRowFields, CanonicalFuelRow,
        Bool.and_eq_true]
      constructor
      · rintro ⟨⟨⟨leftOpen, functionOpen⟩, rightOpen⟩,
          continuationAdmissible⟩
        exact ⟨
          (parseBOpenField?_isSome_eq_true_iff actions leftArgument).mp
            leftOpen,
          (parseOpenField?_isSome_eq_true_iff actions function).mp
            functionOpen,
          (parseBOpenField?_isSome_eq_true_iff actions rightArgument).mp
            rightOpen,
          (admissibleField_eq_true_iff continuation).mp
            continuationAdmissible⟩
      · rintro ⟨leftOpen, functionOpen, rightOpen,
          continuationAdmissible⟩
        exact ⟨⟨⟨
          (parseBOpenField?_isSome_eq_true_iff actions leftArgument).mpr
            leftOpen,
          (parseOpenField?_isSome_eq_true_iff actions function).mpr
            functionOpen⟩,
          (parseBOpenField?_isSome_eq_true_iff actions rightArgument).mpr
            rightOpen⟩,
          (admissibleField_eq_true_iff continuation).mpr
            continuationAdmissible⟩
  | zeroThird environment leftContinuation function rightArgument
      rightContinuation =>
      simp only [canonicalFuelRowFields, CanonicalFuelRow,
        Bool.and_eq_true]
      constructor
      · rintro ⟨⟨⟨⟨environmentOpen, leftAdmissible⟩,
          functionOpen⟩, rightArgumentOpen⟩, rightAdmissible⟩
        exact ⟨
          (parseOpenField?_isSome_eq_true_iff actions environment).mp
            environmentOpen,
          (admissibleField_eq_true_iff leftContinuation).mp leftAdmissible,
          (parseOpenField?_isSome_eq_true_iff actions function).mp
            functionOpen,
          (parseBOpenField?_isSome_eq_true_iff actions rightArgument).mp
            rightArgumentOpen,
          (admissibleField_eq_true_iff rightContinuation).mp rightAdmissible⟩
      · rintro ⟨environmentOpen, leftAdmissible, functionOpen,
          rightArgumentOpen, rightAdmissible⟩
        exact ⟨⟨⟨⟨
          (parseOpenField?_isSome_eq_true_iff actions environment).mpr
            environmentOpen,
          (admissibleField_eq_true_iff leftContinuation).mpr
            leftAdmissible⟩,
          (parseOpenField?_isSome_eq_true_iff actions function).mpr
            functionOpen⟩,
          (parseBOpenField?_isSome_eq_true_iff actions rightArgument).mpr
            rightArgumentOpen⟩,
          (admissibleField_eq_true_iff rightContinuation).mpr
            rightAdmissible⟩
  | zeroFourth leftContinuation environment rightContinuation alpha =>
      simp only [canonicalFuelRowFields, CanonicalFuelRow,
        Bool.and_eq_true]
      constructor
      · rintro ⟨⟨leftAdmissible, environmentOpen⟩, rightAdmissible⟩
        exact ⟨
          (admissibleField_eq_true_iff leftContinuation).mp leftAdmissible,
          (parseOpenField?_isSome_eq_true_iff actions environment).mp
            environmentOpen,
          (admissibleField_eq_true_iff rightContinuation).mp rightAdmissible⟩
      · rintro ⟨leftAdmissible, environmentOpen, rightAdmissible⟩
        exact ⟨⟨
          (admissibleField_eq_true_iff leftContinuation).mpr leftAdmissible,
          (parseOpenField?_isSome_eq_true_iff actions environment).mpr
            environmentOpen⟩,
          (admissibleField_eq_true_iff rightContinuation).mpr rightAdmissible⟩

/-- Canonical rows win every priority ambiguity in the role-free parser. -/
theorem CanonicalFuelRow.parseFuelRow
    {actions : Term} {row : FuelRow}
    (canonical : CanonicalFuelRow actions row) :
    parseFuelRow? row.term = some row := by
  cases row with
  | call fuel environment continuation =>
      rcases canonical.1 with ⟨seedPayload, rfl⟩
      exact parseFuelRow?_generated_call fuel _ continuation
  | positiveHalf residual leftEnvironment rightEnvironment continuation =>
      exact parseFuelRow?_generated_positiveHalf residual _ _ continuation
  | zeroFirst leftEnvironment rightEnvironment continuation =>
      rcases canonical.1 with ⟨leftSeed, rfl⟩
      rcases canonical.2.1 with ⟨rightSeed, rfl⟩
      exact parseFuelRow?_generated_zeroFirst actions leftSeed rightSeed
        continuation
  | zeroSecond leftArgument function rightArgument continuation =>
      rcases canonical.1 with ⟨leftSeed, rfl⟩
      rcases canonical.2.1 with ⟨functionSeed, rfl⟩
      rcases canonical.2.2.1 with ⟨rightSeed, rfl⟩
      exact parseFuelRow?_generated_zeroSecond actions leftSeed functionSeed
        rightSeed continuation
  | zeroThird environment leftContinuation function rightArgument
      rightContinuation =>
      rcases canonical.1 with ⟨environmentSeed, rfl⟩
      rcases canonical.2.2.1 with ⟨functionSeed, rfl⟩
      rcases canonical.2.2.2.1 with ⟨argumentSeed, rfl⟩
      exact parseFuelRow?_generated_zeroThird actions environmentSeed
        functionSeed argumentSeed leftContinuation rightContinuation
        canonical.2.1
  | zeroFourth leftContinuation environment rightContinuation alpha =>
      rcases canonical.2.1 with ⟨environmentSeed, rfl⟩
      exact parseFuelRow?_generated_zeroFourth actions environmentSeed
        leftContinuation rightContinuation alpha canonical.1

/-- Restricted-parser soundness against the parser-independent grammar. -/
theorem parseCanonicalFuelRow?_sound
    {actions term : Term} {row : FuelRow}
    (h : parseCanonicalFuelRow? actions term = some row) :
    term = row.term ∧ CanonicalFuelRow actions row := by
  unfold parseCanonicalFuelRow? at h
  generalize hrow : parseFuelRow? term = result at h
  cases result with
  | none => simp at h
  | some found =>
      by_cases canonical : canonicalFuelRowFields actions found = true
      · simp [canonical] at h
        subst found
        exact ⟨parseFuelRow?_sound hrow,
          (canonicalFuelRowFields_eq_true_iff actions row).mp canonical⟩
      · simp [canonical] at h

/-- Restricted-parser completeness on the independent-copy grammar. -/
theorem parseCanonicalFuelRow?_complete
    {actions term : Term} {row : FuelRow}
    (source : term = row.term)
    (canonical : CanonicalFuelRow actions row) :
    parseCanonicalFuelRow? actions term = some row := by
  subst term
  rw [parseCanonicalFuelRow?, canonical.parseFuelRow]
  simp [(canonicalFuelRowFields_eq_true_iff actions row).mpr canonical]

/-- Same-term canonical rows have one unique constructor and field tuple. -/
theorem canonicalFuelRow_unique
    {actions term : Term} {first second : FuelRow}
    (hfirst : term = first.term)
    (cfirst : CanonicalFuelRow actions first)
    (hsecond : term = second.term)
    (csecond : CanonicalFuelRow actions second) :
    first = second := by
  have pfirst := parseCanonicalFuelRow?_complete hfirst cfirst
  have psecond := parseCanonicalFuelRow?_complete hsecond csecond
  rw [pfirst] at psecond
  exact Option.some.inj psecond

/-- An admissible continuation cannot be decoded as a unary clock numeral. -/
@[simp]
theorem carrierC_headArity (number : Nat) : (C number).headArity = 2 := by
  cases number <;> rfl

theorem decodeC?_none_of_admissible
    (continuation : Term) (admissible : Carrier.Admissible continuation) :
    decodeC? continuation = none := by
  cases decodedEq : decodeC? continuation with
  | none => rfl
  | some number =>
      have source := RootResetStageRegistry.parseC?_sound decodedEq
      subst continuation
      rcases admissible with admissible | admissible <;>
        simp [carrierC_headArity] at admissible

theorem parseClock?_canonicalCall_none
    (actions : Term) (fuel : Nat) (seedPayload continuation : Term) :
    parseClock?
        (FuelRow.call fuel
          (CheckpointDecoder.openEnvironment actions seedPayload)
          continuation).term = none := by
  cases fuel <;>
    simp [FuelRow.term, parseClock?, parseClockCore?, parseClockExitCore?,
      decodeC?_openEnvironment_none, decodeC?,
      RootResetStageRegistry.parseC?, CheckpointDecoder.openEnvironment,
      C, b]

theorem parseClock?_canonicalPositiveHalf_none
    (actions : Term) (residual : Nat)
    (leftSeed rightSeed continuation : Term) :
    parseClock?
        (FuelRow.positiveHalf residual
          (CheckpointDecoder.openEnvironment actions leftSeed)
          (CheckpointDecoder.openEnvironment actions rightSeed)
          continuation).term = none := by
  let leftEnvironment := CheckpointDecoder.openEnvironment actions leftSeed
  let rightEnvironment := CheckpointDecoder.openEnvironment actions rightSeed
  let core : Term :=
    .app (.app .s leftEnvironment) (.app (C residual) rightEnvironment)
  have growthNone : parseClockCore? core = none := by
    dsimp only [core]
    rw [parseClockCore?, decodeC?_openEnvironment_none]
  have exitNone : parseClockExitCore? core = none := by
    dsimp only [core]
    rw [parseClockExitCore?, decodeC?_openEnvironment_none]
  change parseClock? (.app core continuation) = none
  rw [parseClock?, growthNone, exitNone]

theorem parseClock?_canonicalZeroFirst_none
    (actions leftSeed rightSeed continuation : Term) :
    parseClock?
        (FuelRow.zeroFirst
          (CheckpointDecoder.openEnvironment actions leftSeed)
          (CheckpointDecoder.openEnvironment actions rightSeed)
          continuation).term = none := by
  simp [FuelRow.term, parseClock?, parseClockCore?, parseClockExitCore?,
    decodeC?_openEnvironment_none, decodeC?,
    RootResetStageRegistry.parseC?, CheckpointDecoder.openEnvironment,
    C, b]

theorem parseClock?_canonicalZeroSecond_none
    (actions leftSeed functionSeed rightSeed continuation : Term) :
    parseClock?
        (FuelRow.zeroSecond
          (.app b (CheckpointDecoder.openEnvironment actions leftSeed))
          (CheckpointDecoder.openEnvironment actions functionSeed)
          (.app b (CheckpointDecoder.openEnvironment actions rightSeed))
          continuation).term = none := by
  have leftNotCode :
      decodeC? (.app b
        (CheckpointDecoder.openEnvironment actions leftSeed)) = none := by
    change RootResetStageRegistry.parseC?
      (.app b (CheckpointDecoder.openEnvironment actions leftSeed)) = none
    rw [RootResetStageRegistry.parseC?]
    simp only [if_pos rfl]
    change (decodeC?
      (CheckpointDecoder.openEnvironment actions leftSeed)).map Nat.succ = none
    rw [decodeC?_openEnvironment_none]
    rfl
  simp only [FuelRow.term, parseClock?, parseClockCore?, leftNotCode,
    parseClockExitCore?]

theorem parseClock?_canonicalZeroThird_none
    (actions environmentSeed functionSeed argumentSeed : Term)
    (leftContinuation rightContinuation : Term)
    (admissible : Carrier.Admissible leftContinuation) :
    parseClock?
        (FuelRow.zeroThird
          (CheckpointDecoder.openEnvironment actions environmentSeed)
          leftContinuation
          (CheckpointDecoder.openEnvironment actions functionSeed)
          (.app b (CheckpointDecoder.openEnvironment actions argumentSeed))
          rightContinuation).term = none := by
  have notCode := decodeC?_none_of_admissible leftContinuation admissible
  simp [FuelRow.term, parseClock?, parseClockCore?, parseClockExitCore?,
    decodeC?_openEnvironment_none, decodeC?,
    RootResetStageRegistry.parseC?, CheckpointDecoder.openEnvironment,
    notCode, C, b]

theorem parseClock?_canonicalZeroFourth_none
    (actions environmentSeed leftContinuation rightContinuation alpha : Term)
    (admissible : Carrier.Admissible leftContinuation) :
    parseClock?
        (FuelRow.zeroFourth leftContinuation
          (CheckpointDecoder.openEnvironment actions environmentSeed)
          rightContinuation alpha).term = none := by
  have notCode := decodeC?_none_of_admissible leftContinuation admissible
  simp only [FuelRow.term, parseClock?, parseClockCore?, notCode,
    parseClockExitCore?]

/-- Canonical local fuel syntax is outside the clock-row term language. -/
theorem parseClock?_canonicalFuelRow_none
    {actions : Term} {row : FuelRow}
    (canonical : CanonicalFuelRow actions row) :
    parseClock? row.term = none := by
  cases row with
  | call fuel environment continuation =>
      rcases canonical.1 with ⟨seedPayload, rfl⟩
      exact parseClock?_canonicalCall_none actions fuel seedPayload continuation
  | positiveHalf residual leftEnvironment rightEnvironment continuation =>
      rcases canonical.1 with ⟨leftSeed, rfl⟩
      rcases canonical.2.1 with ⟨rightSeed, rfl⟩
      exact parseClock?_canonicalPositiveHalf_none actions residual leftSeed
        rightSeed continuation
  | zeroFirst leftEnvironment rightEnvironment continuation =>
      rcases canonical.1 with ⟨leftSeed, rfl⟩
      rcases canonical.2.1 with ⟨rightSeed, rfl⟩
      exact parseClock?_canonicalZeroFirst_none actions leftSeed rightSeed
        continuation
  | zeroSecond leftArgument function rightArgument continuation =>
      rcases canonical.1 with ⟨leftSeed, rfl⟩
      rcases canonical.2.1 with ⟨functionSeed, rfl⟩
      rcases canonical.2.2.1 with ⟨rightSeed, rfl⟩
      exact parseClock?_canonicalZeroSecond_none actions leftSeed functionSeed
        rightSeed continuation
  | zeroThird environment leftContinuation function rightArgument
      rightContinuation =>
      rcases canonical.1 with ⟨environmentSeed, rfl⟩
      rcases canonical.2.2.1 with ⟨functionSeed, rfl⟩
      rcases canonical.2.2.2.1 with ⟨argumentSeed, rfl⟩
      exact parseClock?_canonicalZeroThird_none actions environmentSeed
        functionSeed argumentSeed leftContinuation rightContinuation
        canonical.2.1
  | zeroFourth leftContinuation environment rightContinuation alpha =>
      rcases canonical.2.1 with ⟨environmentSeed, rfl⟩
      exact parseClock?_canonicalZeroFourth_none actions environmentSeed
        leftContinuation rightContinuation alpha canonical.1

/-- Canonical clock and canonical local-fuel languages are term-disjoint. -/
theorem canonicalClock_fuelRow_disjoint
    {actions term : Term} {clock : ClockView} {fuel : FuelRow}
    (clockSource : term = clock.term)
    (clockCanonical : CanonicalClock actions clock)
    (fuelSource : term = fuel.term)
    (fuelCanonical : CanonicalFuelRow actions fuel) : False := by
  have acceptedClock : parseClock? term = some clock := by
    rw [clockSource]
    exact clockCanonical.parseClock
  have rejectedFuel : parseClock? term = none := by
    rw [fuelSource]
    exact parseClock?_canonicalFuelRow_none fuelCanonical
  rw [acceptedClock] at rejectedFuel
  contradiction

/-! ## Diagonal zero-fuel sample -/

/-- The five actionable positions of the zero-fuel script. -/
inductive ZeroPosition where
  | call
  | first
  | second
  | third
  | fourth
  deriving BEq, DecidableEq, Inhabited, Repr

def zeroEnvironment (actions seedPayload : Term) : Term :=
  CheckpointDecoder.openEnvironment actions seedPayload

def zeroAlpha (actions seedPayload continuation : Term) : Term :=
  baseAlpha (zeroEnvironment actions seedPayload) continuation

/-- The literal generated row at a zero-fuel script position. -/
def ZeroPosition.row
    (actions seedPayload continuation : Term) : ZeroPosition → FuelRow
  | .call => .call 0 (zeroEnvironment actions seedPayload) continuation
  | .first =>
      .zeroFirst (zeroEnvironment actions seedPayload)
        (zeroEnvironment actions seedPayload) continuation
  | .second =>
      .zeroSecond (.app b (zeroEnvironment actions seedPayload))
        (zeroEnvironment actions seedPayload)
        (.app b (zeroEnvironment actions seedPayload)) continuation
  | .third =>
      .zeroThird (zeroEnvironment actions seedPayload) continuation
        (zeroEnvironment actions seedPayload)
        (.app b (zeroEnvironment actions seedPayload)) continuation
  | .fourth =>
      .zeroFourth continuation (zeroEnvironment actions seedPayload)
        continuation (zeroAlpha actions seedPayload continuation)

theorem ZeroPosition.row_canonical
    (position : ZeroPosition) (actions seedPayload continuation : Term)
    (admissible : Carrier.Admissible continuation) :
    CanonicalFuelRow actions
      (position.row actions seedPayload continuation) := by
  have hopen : OpenField actions (zeroEnvironment actions seedPayload) :=
    ⟨seedPayload, rfl⟩
  have hbopen : BOpenField actions
      (.app b (zeroEnvironment actions seedPayload)) :=
    ⟨seedPayload, rfl⟩
  cases position with
  | call => exact ⟨hopen, admissible⟩
  | first => exact ⟨hopen, hopen, admissible⟩
  | second => exact ⟨hbopen, hopen, hbopen, admissible⟩
  | third => exact ⟨hopen, admissible, hopen, hbopen, admissible⟩
  | fourth => exact ⟨admissible, hopen, admissible⟩

@[simp]
theorem parseCanonicalFuelRow?_zero
    (position : ZeroPosition) (actions seedPayload continuation : Term)
    (admissible : Carrier.Admissible continuation) :
    parseCanonicalFuelRow? actions
        ((position.row actions seedPayload continuation).term) =
      some (position.row actions seedPayload continuation) := by
  exact parseCanonicalFuelRow?_complete rfl
    (position.row_canonical actions seedPayload continuation admissible)

/-- Literal zero-script rows are disjoint as term languages. -/
theorem zeroRow_term_injective
    {actions seedPayload continuation : Term}
    (admissible : Carrier.Admissible continuation)
    {firstPosition secondPosition : ZeroPosition}
    (equal :
      (firstPosition.row actions seedPayload continuation).term =
        (secondPosition.row actions seedPayload continuation).term) :
    firstPosition = secondPosition := by
  have parsedFirst := parseCanonicalFuelRow?_zero firstPosition actions
    seedPayload continuation admissible
  have parsedSecond := parseCanonicalFuelRow?_zero secondPosition actions
    seedPayload continuation admissible
  rw [equal] at parsedFirst
  rw [parsedSecond] at parsedFirst
  have rowEqual := Option.some.inj parsedFirst
  cases firstPosition <;> cases secondPosition <;>
    simp [ZeroPosition.row] at rowEqual ⊢

/-- The canonical child is reached without inspecting any payload copy. -/
theorem canonicalFuelRow_child_subterm (row : FuelRow) :
    row.term.subterm? row.localAddress = some row.focus :=
  row.focus_subterm

/-- The selected local occurrence contracts to the displayed row target. -/
theorem canonicalFuelRow_contractAt_eq_target (row : FuelRow) :
    row.term.contractAt? row.localAddress = some row.target :=
  row.contractAt?_eq_some_target

/-- Every canonical row's selected address is an actual contraction. -/
theorem canonicalFuelRow_selected_contracts (row : FuelRow) :
    ∃ target, row.term.contractAt? row.localAddress = some target := by
  obtain ⟨context, _, replace⟩ := Term.context_of_subterm row.focus_subterm
  rw [row.contractAt?_eq]
  exact ⟨context.plug row.replacement, replace row.replacement⟩

/-! ## Canonical open-Base handoff and literal horizon -/

/-- Independent open-Base fields; continuation copies need not be equal. -/
def CanonicalOpenBase (view : OpenBaseView) : Prop :=
  Carrier.Admissible view.outerContinuation ∧
  Carrier.Admissible view.innerContinuation

/-- Diagonal generated Base view reached by the fifth zero contraction. -/
def generatedBaseView
    (actions seedPayload continuation : Term) : OpenBaseView :=
  ⟨seedPayload, continuation, continuation, seedPayload,
    baseBeta (zeroEnvironment actions seedPayload) continuation⟩

theorem generatedBaseView_canonical
    (actions seedPayload continuation : Term)
    (admissible : Carrier.Admissible continuation) :
    CanonicalOpenBase
      (generatedBaseView actions seedPayload continuation) :=
  ⟨admissible, admissible⟩

@[simp]
theorem parseOpenBase?_generatedBase
    (actions seedPayload continuation : Term) :
    parseOpenBase? actions
        ((generatedBaseView actions seedPayload continuation).term actions) =
      some (generatedBaseView actions seedPayload continuation) := by
  exact parseOpenBase?_generated actions continuation continuation seedPayload
    seedPayload (baseBeta (zeroEnvironment actions seedPayload) continuation)

theorem generatedBaseView_term_eq
    (actions seedPayload continuation : Term) :
    (generatedBaseView actions seedPayload continuation).term actions =
      baseCarrier (zeroEnvironment actions seedPayload) continuation :=
  rfl

/-- A canonical pending layer keeps the environment and continuation local. -/
def CanonicalPendingLayer (actions : Term) (layer : PendingLayer) : Prop :=
  layer.environment =
      CheckpointDecoder.openEnvironment actions layer.seedPayload ∧
    Carrier.Admissible layer.continuation

def CanonicalPendingLayers
    (actions : Term) : List PendingLayer → Prop
  | [] => True
  | layer :: layers =>
      CanonicalPendingLayer actions layer ∧
      CanonicalPendingLayers actions layers

/-- Fuel-stage grammar under a valid independent-copy pending prefix. -/
structure CanonicalFuelView (actions : Term) (view : FuelView) : Prop where
  layers : CanonicalPendingLayers actions view.layers
  endpoint :
    match view.endpoint with
    | .row row => CanonicalFuelRow actions row
    | .carrier base => CanonicalOpenBase base

theorem CanonicalPendingLayers.toPendingLayersValid
    {actions : Term} {layers : List PendingLayer}
    (canonical : CanonicalPendingLayers actions layers) :
    PendingLayersValid actions layers := by
  induction layers with
  | nil => trivial
  | cons layer layers ih =>
      exact ⟨canonical.1.1, ih canonical.2⟩

/-- An independent canonical Base is accepted as the no-row endpoint. -/
theorem parseFuelEndpoint?_canonicalOpenBase
    (actions : Term) (view : OpenBaseView)
    (canonical : CanonicalOpenBase view) :
    parseFuelEndpoint? actions (view.term actions) =
      some (.carrier view) := by
  apply parseFuelEndpoint?_carrier
  apply parseFuelRow?_none_of_four_lt_headArity
  simp only [FuelEndpoint.term]
  rw [OpenBaseView.term_headArity]
  rcases canonical.1 with arity | arity
  · rw [arity]
    decide
  · rw [arity]
    decide

theorem parseEnvironment?_none_of_headArity_ne_one
    (actions field : Term) (different : field.headArity ≠ 1) :
    CheckpointDecoder.parseEnvironment? actions field = none := by
  cases parsed : CheckpointDecoder.parseEnvironment? actions field with
  | none => rfl
  | some seedPayload =>
      have source := CheckpointDecoder.parseEnvironment?_sound parsed
      have arity := congrArg Term.headArity source
      exfalso
      apply different
      simpa [CheckpointDecoder.openEnvironment] using arity

theorem parseEnvironment?_appS_none_of_headArity_ne_two
    (actions field : Term) (different : field.headArity ≠ 2) :
    CheckpointDecoder.parseEnvironment? actions (.app .s field) = none := by
  cases parsed : CheckpointDecoder.parseEnvironment? actions (.app .s field) with
  | none => rfl
  | some seedPayload =>
      have source := CheckpointDecoder.parseEnvironment?_sound parsed
      have fieldEq := congrArg (fun term => term.subterm? [.right]) source
      have arity := congrArg Term.headArity
        (show field =
            .app (.app .s (actCode actions)) (.app .s seedPayload) by
          simpa [CheckpointDecoder.openEnvironment, Term.subterm?] using fieldEq)
      exfalso
      apply different
      simpa using arity

theorem parseFuelActive?_endpoint_of_outer_rejected
    (actions environment continuation child : Term)
    {endpoint : FuelEndpoint}
    (environmentRejected :
      CheckpointDecoder.parseEnvironment? actions environment = none)
    (endpointParsed :
      parseFuelEndpoint? actions (.app (.app environment continuation) child) =
        some endpoint) :
    parseFuelActive? actions (.app (.app environment continuation) child) =
      some ⟨[], endpoint⟩ := by
  rw [parseFuelActive?, environmentRejected, endpointParsed]
  rfl

/-- An independent canonical Base is accepted below no pending layers. -/
theorem parseFuelActive?_canonicalOpenBase
    (actions : Term) (view : OpenBaseView)
    (canonical : CanonicalOpenBase view) :
    parseFuelActive? actions (view.term actions) =
      some ⟨[], .carrier view⟩ := by
  rcases view with
    ⟨queue, outerContinuation, innerContinuation, seedPayload, beta⟩
  apply parseFuelActive?_endpoint_of_outer_rejected
  · exact parseEnvironment?_none_of_admissible actions outerContinuation
      canonical.1
  · exact parseFuelEndpoint?_canonicalOpenBase actions
      ⟨queue, outerContinuation, innerContinuation, seedPayload, beta⟩
      canonical

/-- A canonical row is accepted below no pending layers. -/
theorem parseFuelActive?_canonicalRow
    (actions : Term) (row : FuelRow)
    (canonical : CanonicalFuelRow actions row) :
    parseFuelActive? actions row.term = some ⟨[], .row row⟩ := by
  have endpoint : parseFuelEndpoint? actions row.term = some (.row row) :=
    parseFuelEndpoint?_row actions row canonical.parseFuelRow
  cases row with
  | call fuel environment continuation =>
      rcases canonical.1 with ⟨seedPayload, rfl⟩
      apply parseFuelActive?_endpoint_of_outer_rejected
      · apply parseEnvironment?_none_of_headArity_ne_one
        simp [carrierC_headArity]
      · simpa [FuelRow.term] using endpoint
  | positiveHalf residual leftEnvironment rightEnvironment continuation =>
      rcases canonical.1 with ⟨leftSeed, rfl⟩
      rcases canonical.2.1 with ⟨rightSeed, rfl⟩
      apply parseFuelActive?_endpoint_of_outer_rejected
      · apply parseEnvironment?_appS_none_of_headArity_ne_two
        simp [CheckpointDecoder.openEnvironment]
      · simpa [FuelRow.term] using endpoint
  | zeroFirst leftEnvironment rightEnvironment continuation =>
      rcases canonical.1 with ⟨leftSeed, rfl⟩
      rcases canonical.2.1 with ⟨rightSeed, rfl⟩
      apply parseFuelActive?_endpoint_of_outer_rejected
      · apply parseEnvironment?_none_of_headArity_ne_one
        simp [b]
      · simpa [FuelRow.term] using endpoint
  | zeroSecond leftArgument function rightArgument continuation =>
      rcases canonical.1 with ⟨leftSeed, rfl⟩
      rcases canonical.2.1 with ⟨functionSeed, rfl⟩
      rcases canonical.2.2.1 with ⟨rightSeed, rfl⟩
      apply parseFuelActive?_endpoint_of_outer_rejected
      · simp [CheckpointDecoder.parseEnvironment?,
          CheckpointDecoder.openEnvironment, actCode, haltCode, b]
      · simpa [FuelRow.term] using endpoint
  | zeroThird environment leftContinuation function rightArgument
      rightContinuation =>
      rcases canonical.1 with ⟨environmentSeed, rfl⟩
      rcases canonical.2.2.1 with ⟨functionSeed, rfl⟩
      rcases canonical.2.2.2.1 with ⟨argumentSeed, rfl⟩
      apply parseFuelActive?_endpoint_of_outer_rejected
      · apply parseEnvironment?_none_of_headArity_ne_one
        simp [b]
      · simpa [FuelRow.term] using endpoint
  | zeroFourth leftContinuation environment rightContinuation alpha =>
      rcases canonical.2.1 with ⟨environmentSeed, rfl⟩
      apply parseFuelActive?_endpoint_of_outer_rejected
      · apply parseEnvironment?_appS_none_of_headArity_ne_two
        rcases canonical.1 with arity | arity <;> simp [arity]
      · simpa [FuelRow.term] using endpoint

/-- Canonical pending layers parse completely around their endpoint. -/
theorem CanonicalFuelView.parseFuelActive
    {actions : Term} {view : FuelView}
    (canonical : CanonicalFuelView actions view) :
    parseFuelActive? actions (view.term actions) = some view := by
  rcases view with ⟨layers, endpoint⟩
  cases endpoint with
  | row row =>
      apply parseFuelActive?_complete actions layers (.row row)
        canonical.layers.toPendingLayersValid
      exact parseFuelActive?_canonicalRow actions row canonical.endpoint
  | carrier base =>
      apply parseFuelActive?_complete actions layers (.carrier base)
        canonical.layers.toPendingLayersValid
      exact parseFuelActive?_canonicalOpenBase actions base canonical.endpoint

theorem clockGrowthCore_headArity_le_three
    (stage wrappers residual : Nat) :
    (clockGrowthCore stage wrappers residual).headArity ≤ 3 := by
  cases wrappers <;>
    simp [clockGrowthCore, clockWrap, Term.headArity_app_eq,
      carrierC_headArity]

theorem clockWrappers_headArity_le_three
    (stage remaining : Nat) :
    (clockWrappers stage remaining).headArity ≤ 3 := by
  cases remaining <;>
    simp [clockWrappers, clockBase, Term.headArity_app_eq,
      carrierC_headArity]

/-- Every canonical clock term has at most four root-spine arguments. -/
theorem clockView_term_headArity_le_four (view : ClockView) :
    view.term.headArity ≤ 4 := by
  cases stageEq : view.stage with
  | growPositive | growZero =>
      simp only [ClockView.term, stageEq, Term.headArity_app_eq]
      exact Nat.add_le_add_right
        (clockGrowthCore_headArity_le_three view.horizon view.wrappers
          view.residual) 1
  | launch =>
      simp only [ClockView.term, stageEq, Dovetail.clockExit,
        Term.headArity_app_eq]
      exact Nat.add_le_add_right
        (clockWrappers_headArity_le_three view.horizon view.residual) 1

theorem parseClock?_none_of_four_lt_headArity
    (term : Term) (large : 4 < term.headArity) :
    parseClock? term = none := by
  cases parsed : parseClock? term with
  | none => rfl
  | some view =>
      have source := parseClock?_sound parsed
      have bound := clockView_term_headArity_le_four view
      rw [source] at large
      exact False.elim ((Nat.not_lt_of_ge bound) large)

theorem parseClock?_pending_none
    (actions seedPayload continuation child : Term)
    (admissible : Carrier.Admissible continuation) :
    parseClock?
        (frame (CheckpointDecoder.openEnvironment actions seedPayload)
          continuation child) = none := by
  have continuationNotCode :=
    decodeC?_none_of_admissible continuation admissible
  simp [frame, parseClock?, parseClockCore?, parseClockExitCore?,
    decodeC?, RootResetStageRegistry.parseC?,
    CheckpointDecoder.openEnvironment, actCode, haltCode,
    continuationNotCode, C, b]

/-- The full canonical fuel language is disjoint from the clock language. -/
theorem CanonicalFuelView.parseClock_none
    {actions : Term} {view : FuelView}
    (canonical : CanonicalFuelView actions view) :
    parseClock? (view.term actions) = none := by
  rcases view with ⟨layers, endpoint⟩
  cases layers with
  | nil =>
      cases endpoint with
      | row row =>
          simpa [FuelView.term, pendingContext, FuelEndpoint.term] using
            parseClock?_canonicalFuelRow_none canonical.endpoint
      | carrier base =>
          apply parseClock?_none_of_four_lt_headArity
          simp only [FuelView.term, pendingContext, Context.plug,
            FuelEndpoint.term]
          rw [OpenBaseView.term_headArity]
          rcases canonical.endpoint.1 with arity | arity
          · rw [arity]
            decide
          · rw [arity]
            decide
  | cons layer layers =>
      rcases canonical.layers.1 with ⟨environment, admissible⟩
      simp only [FuelView.term, pendingContext, Context.plug]
      rw [environment]
      simpa using!
        parseClock?_pending_none actions layer.seedPayload layer.continuation
          ((pendingContext layers).plug (endpoint.term actions)) admissible

/-- Canonical clock and full canonical fuel languages are term-disjoint. -/
theorem canonicalClock_fuel_disjoint
    {actions term : Term} {clock : ClockView} {fuel : FuelView}
    (clockSource : term = clock.term)
    (clockCanonical : CanonicalClock actions clock)
    (fuelSource : term = fuel.term actions)
    (fuelCanonical : CanonicalFuelView actions fuel) : False := by
  have acceptedClock : parseClock? term = some clock := by
    rw [clockSource]
    exact clockCanonical.parseClock
  have rejectedFuel : parseClock? term = none := by
    rw [fuelSource]
    exact fuelCanonical.parseClock_none
  rw [acceptedClock] at rejectedFuel
  contradiction

/-! ## Unified canonical active and whole-term grammar -/

def CanonicalActive (actions : Term) : Active → Prop
  | .clock clock => CanonicalClock actions clock
  | .fuel fuel => CanonicalFuelView actions fuel

theorem CanonicalActive.parseActive
    {actions : Term} {active : Active}
    (canonical : CanonicalActive actions active) :
    parseActive? actions (active.term actions) = some active := by
  cases active with
  | clock clock =>
      simp [parseActive?, Active.term, canonical.parseClock]
  | fuel fuel =>
      simp [parseActive?, Active.term, canonical.parseClock_none,
        canonical.parseFuelActive]

/--
Parser-independent whole placement: a declarative marked prefix surrounds one
canonical active clock/fuel term.  The permissive package parser is complete on
this language, and its result type also covers noncanonical forms.
-/
structure CanonicalWhole
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (view : View program) (term : Term) : Prop where
  markedPrefix :
    RootResetReachableStageGrammar.MarkedPrefix program tree term
      view.activeTerm view.context view.history
  activeSource :
    view.activeTerm = view.active.term (compileActions program tree)
  activeCanonical :
    CanonicalActive (compileActions program tree) view.active

theorem CanonicalWhole.activeParse
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {view : View program} {term : Term}
    (canonical : CanonicalWhole program tree view term) :
    parseActive? (compileActions program tree) view.activeTerm =
      some view.active := by
  rw [canonical.activeSource]
  exact canonical.activeCanonical.parseActive

/-- Every canonical whole decomposition is accepted from the bare root. -/
theorem parse?_canonical_complete
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {view : View program} {term : Term}
    (canonical : CanonicalWhole program tree view term) :
    parse? program tree term = some view := by
  apply parse?_complete
  exact ⟨canonical.markedPrefix, canonical.activeParse,
    canonical.activeSource⟩

/-- Same-term canonical whole decompositions have one stage and field tuple. -/
theorem canonicalWhole_unique
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {firstView secondView : View program}
    (firstCanonical : CanonicalWhole program tree firstView term)
    (secondCanonical : CanonicalWhole program tree secondView term) :
    firstView = secondView := by
  exact parse?_unique (parse?_canonical_complete firstCanonical)
    (parse?_canonical_complete secondCanonical)

/-- Whole root-relative lookup reaches the canonical active child exactly. -/
theorem CanonicalWhole.canonicalChild_subterm
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {view : View program} {term : Term}
    (canonical : CanonicalWhole program tree view term) :
    term.subterm? view.canonicalChildAddress =
      some view.active.canonicalChild :=
  view.canonicalChild_subterm (parse?_canonical_complete canonical)

/-- Every advertised whole selected address is a verified contraction. -/
theorem CanonicalWhole.selected_contracts
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {view : View program} {term : Term} {address : Address}
    (canonical : CanonicalWhole program tree view term)
    (selected : view.selectedAddress? = some address) :
    ∃ target, term.contractAt? address = some target :=
  view.selected_contracts (parse?_canonical_complete canonical) selected

/-- Historical Locals in a canonical whole decomposition are marked. -/
theorem CanonicalWhole.history_marked
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {view : View program} {term : Term}
    (canonical : CanonicalWhole program tree view term) :
    RootResetReachableStageGrammar.MarkedHistory program view.history :=
  canonical.markedPrefix.historical_views_marked

/-- Every zero-fuel row under `depth` pending frames has literal horizon `depth`. -/
theorem zeroFuelView_horizon
    (depth : Nat) (layer : PendingLayer) (position : ZeroPosition)
    (actions seedPayload continuation : Term) :
    FuelView.horizon
        ⟨List.replicate depth layer,
          .row (position.row actions seedPayload continuation)⟩ =
      depth := by
  cases position <;> simp [FuelView.horizon, FuelEndpoint.residual,
    FuelRow.residual, ZeroPosition.row]

end PureSFormal.Research.RootResetClockFuelCanonicalGrammar
