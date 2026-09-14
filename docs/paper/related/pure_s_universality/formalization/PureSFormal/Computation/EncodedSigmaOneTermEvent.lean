import PureSFormal.Computation.CounterMachinePureS
import PureSFormal.PureS.SchedulerStageAssembly

/-!
# Explicit exponentially initialized source-to-marked-snapshot interface

This module exposes the concrete reduction map used by the fixed event theorem.
A formula and natural input `n` determine a universal two-counter job whose
first counter is initialized with `2^n`; that job determines one generated bare
pure-`S` term.  The theorem below states the exact marked-snapshot observation
equivalence for that named term instead of leaving the reduction function
implicit.
-/

namespace PureSFormal.Computation

open PureSFormal.PureS

namespace EncodedSigmaOneTermEvent

/-- The explicit exponentially encoded formula instance. -/
abbrev formulaJob := BoundedSigmaOne.formulaUniversalInput

/-- The formula's bounded witness is exactly acceptance of its named job. -/
theorem formulaJob_accepts_iff
    (formula : BoundedSigmaOne.Formula) (input : Nat) :
    CounterMachine.UniversalAccepts (formulaJob formula input) ↔
      ∃ witness, BoundedSigmaOne.eval formula input witness = true :=
  BoundedSigmaOne.formulaUniversalInput_accepts_iff formula input

/-- The generated bare pure-`S` term assigned to a universal source job. -/
def encodeJobTerm (job : CounterMachine.UniversalInput) : Term :=
  generator
    (compileActions Cook.rogozhinCookProgram
      CounterMachinePureS.dispatcher.tree)
    (CounterMachineCook.encodeBits job)

/-- The explicit exponentially initialized bounded-run-to-term reduction map. -/
def encodeFormulaTerm (formula : BoundedSigmaOne.Formula) (input : Nat) : Term :=
  encodeJobTerm (formulaJob formula input)

/-- The premise-free scheduler theorem's initial-state certificate type. -/
abbrev InitialGood : Prop :=
  ∀ bits,
    SchedulerInvariant.SampledGood Cook.rogozhinCookProgram
      CounterMachinePureS.dispatcher bits 0
      (SchedulerBound.bound Cook.rogozhinCookProgram
        CounterMachinePureS.dispatcher)
      (SchedulerControl.initialConfiguration Cook.rogozhinCookProgram
        CounterMachinePureS.dispatcher bits)

/-- The exact-checkpoint certificate paired with `InitialGood`. -/
abbrev ExactCheckpoint (initialGood : InitialGood) : Prop :=
  ∀ bits horizon,
    let system := SchedulerInvariant.SampledGood.productiveSystem
      Cook.rogozhinCookProgram CounterMachinePureS.dispatcher bits
      (SchedulerBound.bound Cook.rogozhinCookProgram
        CounterMachinePureS.dispatcher)
      (SchedulerControl.initialConfiguration Cook.rogozhinCookProgram
        CounterMachinePureS.dispatcher bits)
      (initialGood bits)
    PublicDecoder.decode Cook.rogozhinCookProgram
        CounterMachinePureS.dispatcher.tree
        (system.contractionRun
          (ExactCheckpointRun.checkpointTime Cook.rogozhinCookProgram
            CounterMachinePureS.dispatcher bits horizon)).cursor.erase =
      some (horizon,
        CTS.iterate Cook.rogozhinCookProgram horizon
          (CTS.initial Cook.rogozhinCookProgram bits))

/-- Universal source acceptance is exactly marked-snapshot observation of its term. -/
theorem universalJob_accepts_iff_termEvent
    (initialGood : InitialGood)
    (exactCheckpoint : ExactCheckpoint initialGood)
    (job : CounterMachine.UniversalInput) :
    CounterMachine.UniversalAccepts job ↔
      PureSMarkedSnapshotTermEvent Cook.rogozhinCookProgram
        CounterMachinePureS.dispatcher
        (encodeJobTerm job) := by
  simpa [encodeJobTerm] using
    (CounterMachinePureS.universalAccepts_iff_pureSTermEvent
      initialGood exactCheckpoint job)

/--
The named bounded-run-to-term map preserves and reflects the exponentially
initialized two-counter bounded-run predicate.
-/
theorem formula_accepts_iff_termEvent
    (initialGood : InitialGood)
    (exactCheckpoint : ExactCheckpoint initialGood)
    (formula : BoundedSigmaOne.Formula) (input : Nat) :
    (∃ witness, BoundedSigmaOne.eval formula input witness = true) ↔
      PureSMarkedSnapshotTermEvent Cook.rogozhinCookProgram
        CounterMachinePureS.dispatcher
        (encodeFormulaTerm formula input) := by
  exact (formulaJob_accepts_iff formula input).symm.trans
    (universalJob_accepts_iff_termEvent initialGood exactCheckpoint
      (formulaJob formula input))

/-- Completeness for the exponentially initialized bounded-run interface. -/
theorem pureSTermEvent_encodedSigmaOneComplete
    (initialGood : InitialGood)
    (exactCheckpoint : ExactCheckpoint initialGood) :
    BoundedSigmaOne.Complete
      (PureSMarkedSnapshotTermEvent Cook.rogozhinCookProgram
        CounterMachinePureS.dispatcher) := by
  exact CounterMachinePureS.pureSTermEvent_sigmaOneComplete
    initialGood exactCheckpoint

/-- Premise-free exact reduction for the fixed exported scheduler. -/
theorem fixedFormula_accepts_iff_termEvent
    (formula : BoundedSigmaOne.Formula) (input : Nat) :
    (∃ witness, BoundedSigmaOne.eval formula input witness = true) ↔
      PureSMarkedSnapshotTermEvent Cook.rogozhinCookProgram
        CounterMachinePureS.dispatcher
        (encodeFormulaTerm formula input) := by
  exact formula_accepts_iff_termEvent
    (SchedulerRecurrence.initialGood Cook.rogozhinCookProgram
      CounterMachinePureS.dispatcher)
    (SchedulerRecurrence.exactCheckpoint Cook.rogozhinCookProgram
      CounterMachinePureS.dispatcher)
    formula input

/-- Premise-free exponentially initialized completeness under the fixed scheduler. -/
theorem fixedPureSTermEvent_encodedSigmaOneComplete :
    BoundedSigmaOne.Complete
      (PureSMarkedSnapshotTermEvent Cook.rogozhinCookProgram
        CounterMachinePureS.dispatcher) := by
  exact pureSTermEvent_encodedSigmaOneComplete
    (SchedulerRecurrence.initialGood Cook.rogozhinCookProgram
      CounterMachinePureS.dispatcher)
    (SchedulerRecurrence.exactCheckpoint Cook.rogozhinCookProgram
      CounterMachinePureS.dispatcher)

/-! Accurate aliases for the marked-snapshot reduction interface. -/

abbrev formula_accepts_iff_markedSnapshotTermEvent :=
  formula_accepts_iff_termEvent

abbrev fixedFormula_accepts_iff_markedSnapshotTermEvent :=
  fixedFormula_accepts_iff_termEvent

abbrev fixedMarkedSnapshotTermEvent_encodedSigmaOneComplete :=
  fixedPureSTermEvent_encodedSigmaOneComplete

end EncodedSigmaOneTermEvent

end PureSFormal.Computation
