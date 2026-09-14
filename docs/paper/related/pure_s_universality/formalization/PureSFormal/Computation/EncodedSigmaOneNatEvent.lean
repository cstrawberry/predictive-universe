import PureSFormal.PureS.TermNatCode
import PureSFormal.Computation.EncodedSigmaOneTermEvent

/-!
# Natural-coded fixed pure-S marked-snapshot language

This module transports the existing reductions whose target is bare
`PureS.Term` to a literal language on `Nat`.  Membership first invokes the
total `Option`-valued term decoder from `PureS.TermNatCode`.  The exact Cantor
coding is bijective, so the decoder succeeds on every natural number.  The
displayed job and formula reductions are the compositions of the existing
structural encoders with `Term.code`.
-/

namespace PureSFormal.Computation

open PureSFormal.PureS

namespace EncodedSigmaOneNatEvent

/-- The existing fixed marked-snapshot predicate on bare pure-`S` terms. -/
abbrev FixedPureSMarkedSnapshotTermEvent : Term → Prop :=
  PureSMarkedSnapshotTermEvent Cook.rogozhinCookProgram
    CounterMachinePureS.dispatcher

/--
The fixed marked-snapshot language as a literal set of natural codes.
Although membership handles a `none` result defensively, `Term.decodeCode?`
is proved to return `some` at every natural number for this exact code.
-/
def FixedPureSMarkedSnapshotNatLanguage : Nat → Prop :=
  Term.CodedLanguage FixedPureSMarkedSnapshotTermEvent

/--
The generic rejection implication; its decoder-failure premise is impossible
for the total Cantor coding.
-/
theorem invalidCode_not_mem {number : Nat}
    (invalid : Term.decodeCode? number = none) :
    ¬ FixedPureSMarkedSnapshotNatLanguage number := by
  exact Term.not_codedLanguage_of_decodeCode?_eq_none
    FixedPureSMarkedSnapshotTermEvent invalid

/-- The explicit universal-job-to-natural-code reduction map. -/
def encodeJobCode (job : CounterMachine.UniversalInput) : Nat :=
  Term.code (EncodedSigmaOneTermEvent.encodeJobTerm job)

/-- The explicit bounded-run-specification/input-to-natural-code reduction map. -/
def encodeFormulaCode (formula : BoundedSigmaOne.Formula) (input : Nat) : Nat :=
  Term.code (EncodedSigmaOneTermEvent.encodeFormulaTerm formula input)

@[simp]
theorem decodeCode?_encodeJobCode (job : CounterMachine.UniversalInput) :
    Term.decodeCode? (encodeJobCode job) =
      some (EncodedSigmaOneTermEvent.encodeJobTerm job) := by
  exact Term.decodeCode?_code _

@[simp]
theorem decodeCode?_encodeFormulaCode
    (formula : BoundedSigmaOne.Formula) (input : Nat) :
    Term.decodeCode? (encodeFormulaCode formula input) =
      some (EncodedSigmaOneTermEvent.encodeFormulaTerm formula input) := by
  exact Term.decodeCode?_code _

/-! ## Generic transport facts -/

/-- Coding a term preserves and reflects an arbitrary term predicate. -/
theorem termCode_reducesVia (predicate : Term → Prop) :
    ReducesVia Term.code predicate (Term.CodedLanguage predicate) := by
  intro term
  exact (Term.codedLanguage_code_iff predicate term).symm

/-- Bounded semidecidability survives transport through the total inverse. -/
theorem codedLanguage_semidecidable {predicate : Term → Prop}
    (semi : BoundedlySemidecidable predicate) :
    BoundedlySemidecidable (Term.CodedLanguage predicate) := by
  rcases semi with ⟨test, correct⟩
  refine ⟨fun number witness =>
    match Term.decodeCode? number with
    | none => false
    | some term => test term witness, ?_⟩
  intro number
  constructor
  · intro membership
    cases hdecode : Term.decodeCode? number with
    | none =>
        rw [Term.CodedLanguage, hdecode] at membership
        contradiction
    | some term =>
        have accepted : predicate term := by
          rw [Term.CodedLanguage, hdecode] at membership
          exact membership
        rcases (correct term).1 accepted with ⟨witness, tested⟩
        refine ⟨witness, ?_⟩
        change
          (match Term.decodeCode? number with
          | none => false
          | some decoded => test decoded witness) = true
        rw [hdecode]
        exact tested
  · rintro ⟨witness, tested⟩
    cases hdecode : Term.decodeCode? number with
    | none =>
        change
          (match Term.decodeCode? number with
          | none => false
          | some decoded => test decoded witness) = true at tested
        rw [hdecode] at tested
        cases tested
    | some term =>
        have testTerm : test term witness = true := by
          change
            (match Term.decodeCode? number with
            | none => false
            | some decoded => test decoded witness) = true at tested
          rw [hdecode] at tested
          exact tested
        have accepted : predicate term :=
          (correct term).2 ⟨witness, testTerm⟩
        rw [Term.CodedLanguage, hdecode]
        exact accepted

/-- The fixed term-to-code map is itself a pointwise reduction. -/
theorem fixedTermCode_reducesVia :
    ReducesVia Term.code FixedPureSMarkedSnapshotTermEvent
      FixedPureSMarkedSnapshotNatLanguage :=
  termCode_reducesVia FixedPureSMarkedSnapshotTermEvent

/-! ## Named source reductions -/

/--
Universal two-counter acceptance is exactly membership of the natural code
returned by the displayed executable encoder.
-/
theorem universalAccepts_iff_fixedPureSMarkedSnapshotNatLanguage
    (job : CounterMachine.UniversalInput) :
    CounterMachine.UniversalAccepts job ↔
      FixedPureSMarkedSnapshotNatLanguage (encodeJobCode job) := by
  exact
    (EncodedSigmaOneTermEvent.universalJob_accepts_iff_termEvent
      (SchedulerRecurrence.initialGood Cook.rogozhinCookProgram
        CounterMachinePureS.dispatcher)
      (SchedulerRecurrence.exactCheckpoint Cook.rogozhinCookProgram
        CounterMachinePureS.dispatcher)
      job).trans
    (Term.codedLanguage_code_iff FixedPureSMarkedSnapshotTermEvent
      (EncodedSigmaOneTermEvent.encodeJobTerm job)).symm

/-- The named universal-job code encoder is a pointwise reduction. -/
theorem encodeJobCode_reducesVia :
    ReducesVia encodeJobCode CounterMachine.UniversalAccepts
      FixedPureSMarkedSnapshotNatLanguage :=
  universalAccepts_iff_fixedPureSMarkedSnapshotNatLanguage

/-- Direct natural-coded reduction for every conventional source program. -/
theorem counterProgram_accepts_iff_fixedPureSMarkedSnapshotNatLanguage
    (program : CounterMachine.Program) (input : Nat) :
    CounterMachine.Accepts program input ↔
      FixedPureSMarkedSnapshotNatLanguage
        (encodeJobCode ⟨program, input⟩) := by
  exact universalAccepts_iff_fixedPureSMarkedSnapshotNatLanguage
    ⟨program, input⟩

/-- The named specification code preserves and reflects existential
bounded-run acceptance. -/
theorem encodedBoundedWitnessFormula_iff_fixedPureSMarkedSnapshotNatLanguage
    (formula : BoundedSigmaOne.Formula) (input : Nat) :
    (∃ witness, BoundedSigmaOne.eval formula input witness = true) ↔
      FixedPureSMarkedSnapshotNatLanguage
        (encodeFormulaCode formula input) := by
  exact
    (EncodedSigmaOneTermEvent.fixedFormula_accepts_iff_markedSnapshotTermEvent
      formula input).trans
    (Term.codedLanguage_code_iff FixedPureSMarkedSnapshotTermEvent
      (EncodedSigmaOneTermEvent.encodeFormulaTerm formula input)).symm

/-- Every fixed formula has its displayed pointwise reduction to natural codes. -/
theorem encodeFormulaCode_reducesVia (formula : BoundedSigmaOne.Formula) :
    ReducesVia (encodeFormulaCode formula)
      (fun input => ∃ witness,
        BoundedSigmaOne.eval formula input witness = true)
      FixedPureSMarkedSnapshotNatLanguage :=
  encodedBoundedWitnessFormula_iff_fixedPureSMarkedSnapshotNatLanguage formula

/-- Direct-input two-counter hardness through the displayed code map. -/
theorem fixedPureSMarkedSnapshotNatLanguage_counterMachineHardViaNamedEncoder
    (source : Nat → Prop) (program : CounterMachine.Program)
    (recognizes : ∀ input,
      source input ↔ CounterMachine.Accepts program input) :
    ReducesVia (fun input => encodeJobCode ⟨program, input⟩)
      source FixedPureSMarkedSnapshotNatLanguage := by
  intro input
  exact (recognizes input).trans
    (universalAccepts_iff_fixedPureSMarkedSnapshotNatLanguage
      ⟨program, input⟩)

/-- Exponentially initialized bounded-run hardness through the displayed
specification-code map. -/
theorem fixedPureSMarkedSnapshotNatLanguage_encodedBoundedWitnessHardViaNamedEncoder
    (source : Nat → Prop) (formula : BoundedSigmaOne.Formula)
    (defines : ∀ input, source input ↔ ∃ witness,
      BoundedSigmaOne.eval formula input witness = true) :
    ReducesVia (encodeFormulaCode formula)
      source FixedPureSMarkedSnapshotNatLanguage := by
  intro input
  exact (defines input).trans
    (encodedBoundedWitnessFormula_iff_fixedPureSMarkedSnapshotNatLanguage
      formula input)

/-! ## Literal natural-code-language completeness -/

/-- The natural-coded marked-snapshot language has an executable bounded test. -/
theorem fixedPureSMarkedSnapshotNatLanguage_semidecidable :
    BoundedlySemidecidable FixedPureSMarkedSnapshotNatLanguage := by
  exact codedLanguage_semidecidable
    (pureSMarkedSnapshotTermEvent_semidecidable Cook.rogozhinCookProgram
      CounterMachinePureS.dispatcher)

/-- Completeness for the exponentially initialized bounded-run interface. -/
theorem fixedPureSMarkedSnapshotNatLanguage_encodedBoundedWitnessComplete :
    BoundedSigmaOne.Complete FixedPureSMarkedSnapshotNatLanguage := by
  exact boundedSigmaOne_complete_of_counterUniversal
    FixedPureSMarkedSnapshotNatLanguage
    fixedPureSMarkedSnapshotNatLanguage_semidecidable
    encodeJobCode
    universalAccepts_iff_fixedPureSMarkedSnapshotNatLanguage

/-- Completeness relative to the direct-input two-counter source model. -/
theorem fixedPureSMarkedSnapshotNatLanguage_counterMachineComplete :
    CounterMachine.Complete FixedPureSMarkedSnapshotNatLanguage := by
  refine ⟨fixedPureSMarkedSnapshotNatLanguage_semidecidable, ?_⟩
  intro source recognizable
  rcases recognizable with ⟨program, recognizes⟩
  exact
    (fixedPureSMarkedSnapshotNatLanguage_counterMachineHardViaNamedEncoder
      source program recognizes).manyOne

end EncodedSigmaOneNatEvent

end PureSFormal.Computation
