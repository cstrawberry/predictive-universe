import PureSFormal.PureS.BalancedActionTree
import PureSFormal.PureS.SchedulerStageAssembly
import PureSFormal.PureS.SchedulerDecoder
import PureSFormal.PureS.CheckpointTime
import PureSFormal.PureS.TermGrowth
import PureSFormal.PureS.ControllerTrajectory
import PureSFormal.Cook.PassDecoder
import PureSFormal.Computation.CounterMachinePureS
import PureSFormal.Computation.DeterministicTapePureS
import PureSFormal.Computation.EncodedSigmaOneTermEvent
import PureSFormal.Computation.EncodedSigmaOneNatEvent

/-!
# Weak Evaluation-Path Universality of the Pure S Combinator under a Persistent One-Cursor Scheduler

This module closes the construction by composing the premise-free scheduler
recurrence with the public weak-path interface.  It then specializes the
generic result to the literal Rogozhin--Cook cyclic tag program and composes
that endpoint with the constructive universal source model.  It also exports
the direct Rogozhin boundary/bare-term decoders and transports the marked
snapshot event through the displayed Cantor coding to a literal language on
natural numbers.
-/

namespace PureSFormal

namespace WeakPathUniversality

open PureS

/-- The canonical balanced finite dispatcher used for an arbitrary CTS. -/
abbrev canonicalDispatcher (program : CTS.Program) :
    PureS.ActionDispatcher program :=
  PureS.BalancedActionTree.dispatcher program

/--
For every finite binary cyclic tag program, one fixed deterministic
finite-control scheduler with one persistent arbitrary-depth cursor and one
fixed total bare-term decoder admit a uniform certificate for every input
bitword.
-/
def finiteCTSUniformCertificate (program : CTS.Program) :
    PureS.ControllerProjection.UniformCertificate program
      (PureS.SchedulerControl.initialControl program
        (canonicalDispatcher program))
      (PureS.SchedulerControl.machine program (canonicalDispatcher program))
      (PureS.PublicDecoder.decode program (canonicalDispatcher program).tree) :=
  PureS.SchedulerInvariant.SampledGood.uniformCertificate
    program (canonicalDispatcher program)
    (fun _ => PureS.SchedulerBound.bound program (canonicalDispatcher program))
    (PureS.SchedulerRecurrence.initialGood program
      (canonicalDispatcher program))
    (PureS.SchedulerRecurrence.exactCheckpoint program
      (canonicalDispatcher program))

/--
Uniform weak evaluation-path realization of every finite binary cyclic tag
program by contextual contractions of the sole pure-`S` rewrite rule.
-/
def finiteCTSWeakPathUniversality (program : CTS.Program) :
    WeakPath.UniformRealizes program
      (PureS.ControllerProjection.Projects
        (PureS.SchedulerControl.initialControl program
          (canonicalDispatcher program))
        (PureS.SchedulerControl.machine program
          (canonicalDispatcher program)))
      (PureS.SchedulerControl.machine program (canonicalDispatcher program))
      (PureS.PublicDecoder.decode program (canonicalDispatcher program).tree) :=
  (finiteCTSUniformCertificate program).uniformRealizes

/-- The generic realization specialized to the literal period-912 endpoint. -/
def fixedCookWeakPathUniversality :
    WeakPath.UniformRealizes Cook.rogozhinCookProgram
      (PureS.ControllerProjection.Projects
        (PureS.SchedulerControl.initialControl Cook.rogozhinCookProgram
          (canonicalDispatcher Cook.rogozhinCookProgram))
        (PureS.SchedulerControl.machine Cook.rogozhinCookProgram
          (canonicalDispatcher Cook.rogozhinCookProgram)))
      (PureS.SchedulerControl.machine Cook.rogozhinCookProgram
        (canonicalDispatcher Cook.rogozhinCookProgram))
      (PureS.PublicDecoder.decode Cook.rogozhinCookProgram
        (canonicalDispatcher Cook.rogozhinCookProgram).tree) :=
  finiteCTSWeakPathUniversality Cook.rogozhinCookProgram

/-! ## Explicit contraction-time and occurrence-tree bounds -/

/--
If any finite search fuel reaches the scheduler's next contraction from a
configuration, then the same first contraction is reached within
`q_A * |T|` raw controller microticks, where `q_A` is the number of runtime
states of the fixed program scheduler and `T` is the current erased term.

This is a per-contraction search bound.  It does not turn the cubic bound on
strict contractions between checkpoints into a polynomial bound on raw
controller microticks, because the unshared current term may grow.
-/
theorem finiteCTSNextContractionMicroticks_le_linear
    (program : CTS.Program)
    {fuel : Nat}
    {before after : PureS.FiniteController.Configuration
      (PureS.SchedulerControl.Control program (canonicalDispatcher program))}
    (found : PureS.FiniteController.seekMutation
      (PureS.SchedulerControl.machine program (canonicalDispatcher program))
      fuel before = some after) :
    let qA := (PureS.FiniteController.runtimeStates
      (PureS.SchedulerControl.machine program
        (canonicalDispatcher program))).length
    let linearFuel := qA * before.cursor.erase.size
    PureS.FiniteController.seekMutation
          (PureS.SchedulerControl.machine program
            (canonicalDispatcher program))
          linearFuel before = some after ∧
      PureS.FiniteController.seekMutationDelay
          (PureS.SchedulerControl.machine program
            (canonicalDispatcher program))
          linearFuel before ≤ linearFuel := by
  have bounded := PureS.SchedulerBound.seekMutation_bound
    program (canonicalDispatcher program) found
  rw [PureS.SchedulerBound.bound_eq] at bounded
  exact ⟨bounded,
    (PureS.FiniteController.seekMutationDelay_spec _ bounded).2.1⟩

/-- The exact checkpoint index of the public generic realization satisfies a
literal cubic bound with a finite coefficient determined only by the fixed
program and dispatcher. -/
theorem finiteCTSCheckpointTime_le_explicit_cubic
    (program : CTS.Program) (bits : List Bool) (horizon : Nat) :
    (finiteCTSWeakPathUniversality program).checkpointTime bits horizon ≤
      (12 +
        (PureS.allActionLabels program |>.map fun label =>
          PureS.LocalResponse.completedCost program
            ((canonicalDispatcher program).route label) label).sum) *
        (horizon + 1) ^ 3 := by
  exact PureS.CheckpointTime.checkpointTime_le_explicit_cubic
    program (canonicalDispatcher program) bits horizon

/-- The registered checkpoint term of the public generic realization has the
fully explicit unfolded occurrence-tree bound obtained by composing the
one-step factor-two theorem with the cubic contraction bound. -/
theorem finiteCTSCheckpointTerm_size_le_explicit
    (program : CTS.Program) (bits : List Bool) (horizon : Nat) :
    let realization := finiteCTSWeakPathUniversality program
    (realization.path bits |>.term
      (realization.checkpointTime bits horizon)).size ≤
      2 ^ ((12 +
        (PureS.allActionLabels program |>.map fun label =>
          PureS.LocalResponse.completedCost program
            ((canonicalDispatcher program).route label) label).sum) *
        (horizon + 1) ^ 3) * (realization.encode bits).size := by
  let realization := finiteCTSWeakPathUniversality program
  have exactBound :=
    (realization.realizes bits).checkpoint_term_size_le_pow horizon
  have timeBound :=
    finiteCTSCheckpointTime_le_explicit_cubic program bits horizon
  have powerBound :
      2 ^ (realization.checkpointTime bits horizon) ≤
        2 ^ ((12 +
          (PureS.allActionLabels program |>.map fun label =>
            PureS.LocalResponse.completedCost program
              ((canonicalDispatcher program).route label) label).sum) *
          (horizon + 1) ^ 3) :=
    Nat.pow_le_pow_right (by decide : 0 < 2) timeBound
  exact Nat.le_trans exactBound
    (Nat.mul_le_mul_right (realization.encode bits).size powerBound)

/-! ## Fixed Rogozhin boundary and bare-term decoders -/

/-- The total direct Rogozhin boundary decoder used as `Pass_R` in the
manuscript.  It accepts a canonical Cook word only at horizon zero and a
directional arrival word only at a positive phase-zero horizon. -/
abbrev fixedRogozhinPassDecoder := Cook.passDecode?

/-- The fixed total bare-term decoder `Dec_R = Pass_R ∘ Dec_S`. -/
def fixedRogozhinBareTermDecoder (term : PureS.Term) :
    Option Cook.PassClassification.MachineConfig :=
  match PureS.PublicDecoder.decode Cook.rogozhinCookProgram
      (canonicalDispatcher Cook.rogozhinCookProgram).tree term with
  | none => none
  | some (horizon, snapshot) =>
      fixedRogozhinPassDecoder horizon snapshot

/-- Exact composition equation for the fixed Rogozhin bare-term decoder. -/
theorem fixedRogozhinBareTermDecoder_eq
    (term : PureS.Term) :
    fixedRogozhinBareTermDecoder term =
      (PureS.PublicDecoder.decode Cook.rogozhinCookProgram
        (canonicalDispatcher Cook.rogozhinCookProgram).tree term).bind
        (fun checkpoint =>
          fixedRogozhinPassDecoder checkpoint.1 checkpoint.2) := by
  unfold fixedRogozhinBareTermDecoder
  cases PureS.PublicDecoder.decode Cook.rogozhinCookProgram
      (canonicalDispatcher Cook.rogozhinCookProgram).tree term <;> rfl

/-- A successful literal CTS snapshot and successful boundary parse compose
to the same Rogozhin configuration at the bare-term interface. -/
theorem fixedRogozhinBareTermDecoder_of_decode
    {term : PureS.Term} {horizon : Nat}
    {snapshot : CTS.Config Cook.rogozhinCookProgram}
    {config : Cook.PassClassification.MachineConfig}
    (hterm : PureS.PublicDecoder.decode Cook.rogozhinCookProgram
      (canonicalDispatcher Cook.rogozhinCookProgram).tree term =
        some (horizon, snapshot))
    (hpass : fixedRogozhinPassDecoder horizon snapshot = some config) :
    fixedRogozhinBareTermDecoder term = some config := by
  rw [fixedRogozhinBareTermDecoder_eq, hterm]
  exact hpass

/-! ## Explicit source-to-marked-snapshot interfaces -/

/-- The fixed marked-snapshot predicate on bare pure-`S` terms. -/
abbrev FixedPureSMarkedSnapshotTermEvent : PureS.Term → Prop :=
  Computation.PureSMarkedSnapshotTermEvent Cook.rogozhinCookProgram
    Computation.CounterMachinePureS.dispatcher

/-- The named total source-job-to-bare-term encoder. -/
abbrev fixedPureSMarkedSnapshotJobEncoder :=
  Computation.EncodedSigmaOneTermEvent.encodeJobTerm

/-! ### Premise-free deterministic-tape endpoint -/

/-- The transparent deterministic-tape-instance-to-bare-pure-S-term map. -/
abbrev fixedPureSMarkedSnapshotTapeEncoder :=
  Computation.DeterministicTapePureS.encodeTerm

/--
Premise-free selected-path endpoint from the independently defined finite
deterministic Boolean-tape source.  Source halting is equivalent to eventual
marked-checkpoint observation on the actual scheduler trajectory starting at
the displayed bare pure-S term.
-/
theorem deterministicTapeHalts_iff_fixedPureSMarkedSnapshotTermEvent
    (source :
      Research.ProtectedTrieDeterministicCompiler.DeterministicTape.Instance) :
    Research.ProtectedTrieDeterministicCompiler.DeterministicTape.Halts source ↔
      FixedPureSMarkedSnapshotTermEvent
        (fixedPureSMarkedSnapshotTapeEncoder source) := by
  exact
    Computation.DeterministicTapePureS.halts_iff_fixedPureSMarkedSnapshotTermEvent
      source

/-- The displayed tape-instance encoder is a pointwise reduction to the fixed
bare-term marked-snapshot event. -/
theorem fixedPureSMarkedSnapshotTapeEncoder_reducesVia :
    Computation.ReducesVia fixedPureSMarkedSnapshotTapeEncoder
      Research.ProtectedTrieDeterministicCompiler.DeterministicTape.Halts
      FixedPureSMarkedSnapshotTermEvent :=
  deterministicTapeHalts_iff_fixedPureSMarkedSnapshotTermEvent

/-- The same transparent encoder supplies the corresponding extensional
many-one reduction. -/
theorem deterministicTapeHalts_manyOne_fixedPureSMarkedSnapshotTermEvent :
    Computation.ManyOneReduces
      Research.ProtectedTrieDeterministicCompiler.DeterministicTape.Halts
      FixedPureSMarkedSnapshotTermEvent :=
  ⟨fixedPureSMarkedSnapshotTapeEncoder,
    deterministicTapeHalts_iff_fixedPureSMarkedSnapshotTermEvent⟩

/--
Explicit job-level two-counter acceptance is exactly eventual
observation of a decoder-recognized marked checkpoint on the actual scheduler
trajectory of the term returned by the named structural encoder.
-/
theorem universalAccepts_iff_fixedPureSMarkedSnapshotTermEvent
    (job : Computation.CounterMachine.UniversalInput) :
    Computation.CounterMachine.UniversalAccepts job ↔
      FixedPureSMarkedSnapshotTermEvent
        (fixedPureSMarkedSnapshotJobEncoder job) := by
  exact
    Computation.EncodedSigmaOneTermEvent.universalJob_accepts_iff_termEvent
      (PureS.SchedulerRecurrence.initialGood Cook.rogozhinCookProgram
        Computation.CounterMachinePureS.dispatcher)
      (PureS.SchedulerRecurrence.exactCheckpoint Cook.rogozhinCookProgram
        Computation.CounterMachinePureS.dispatcher)
      job

/-- The named source-job encoder itself is a pointwise reduction; no
existentially selected map occurs in this statement. -/
theorem fixedPureSMarkedSnapshotJobEncoder_reducesVia :
    Computation.ReducesVia fixedPureSMarkedSnapshotJobEncoder
      Computation.CounterMachine.UniversalAccepts
      FixedPureSMarkedSnapshotTermEvent :=
  universalAccepts_iff_fixedPureSMarkedSnapshotTermEvent

/-- Direct pointwise acceptance equivalence for every source program and input. -/
theorem counterProgram_accepts_iff_fixedPureSMarkedSnapshotTermEvent
    (program : Computation.CounterMachine.Program) (input : Nat) :
    Computation.CounterMachine.Accepts program input ↔
      FixedPureSMarkedSnapshotTermEvent
        (fixedPureSMarkedSnapshotJobEncoder ⟨program, input⟩) := by
  exact universalAccepts_iff_fixedPureSMarkedSnapshotTermEvent ⟨program, input⟩

/-- The named exponentially initialized bounded-run-to-bare-term map. -/
abbrev fixedPureSMarkedSnapshotFormulaEncoder :=
  Computation.EncodedSigmaOneTermEvent.encodeFormulaTerm

/--
The named bounded-run specification encoder preserves and reflects the exponentially initialized
two-counter bounded-run predicate.
-/
theorem encodedBoundedWitnessFormula_iff_fixedPureSMarkedSnapshotTermEvent
    (formula : Computation.BoundedSigmaOne.Formula) (input : Nat) :
    (∃ witness,
      Computation.BoundedSigmaOne.eval formula input witness = true) ↔
      FixedPureSMarkedSnapshotTermEvent
        (fixedPureSMarkedSnapshotFormulaEncoder formula input) := by
  exact
    Computation.EncodedSigmaOneTermEvent.fixedFormula_accepts_iff_markedSnapshotTermEvent
      formula input

/-- For each exponentially initialized bounded-run specification, its named
term encoder is a pointwise reduction from the specification's natural-input
predicate. -/
theorem fixedPureSMarkedSnapshotFormulaEncoder_reducesVia
    (formula : Computation.BoundedSigmaOne.Formula) :
    Computation.ReducesVia
      (fixedPureSMarkedSnapshotFormulaEncoder formula)
      (fun input => ∃ witness,
        Computation.BoundedSigmaOne.eval formula input witness = true)
      FixedPureSMarkedSnapshotTermEvent :=
  encodedBoundedWitnessFormula_iff_fixedPureSMarkedSnapshotTermEvent formula

/-- Hardness for the direct-input two-counter source model through exactly
the displayed job encoder.  The recognizing program and the induced map are
present in the theorem statement. -/
theorem fixedPureSMarkedSnapshotTermEvent_counterMachineHardViaNamedEncoder
    (source : Nat → Prop) (program : Computation.CounterMachine.Program)
    (recognizes : ∀ input,
      source input ↔ Computation.CounterMachine.Accepts program input) :
    Computation.ReducesVia
      (fun input => fixedPureSMarkedSnapshotJobEncoder ⟨program, input⟩)
      source FixedPureSMarkedSnapshotTermEvent := by
  intro input
  exact (recognizes input).trans
    (universalAccepts_iff_fixedPureSMarkedSnapshotTermEvent
      ⟨program, input⟩)

/-- Hardness for the exponentially initialized bounded-run syntax through
exactly the displayed specification encoder.  No arbitrary reduction
function is quantified. -/
theorem fixedPureSMarkedSnapshotTermEvent_encodedBoundedWitnessHardViaNamedEncoder
    (source : Nat → Prop) (formula : Computation.BoundedSigmaOne.Formula)
    (defines : ∀ input, source input ↔ ∃ witness,
      Computation.BoundedSigmaOne.eval formula input witness = true) :
    Computation.ReducesVia
      (fixedPureSMarkedSnapshotFormulaEncoder formula)
      source FixedPureSMarkedSnapshotTermEvent := by
  intro input
  exact (defines input).trans
    (encodedBoundedWitnessFormula_iff_fixedPureSMarkedSnapshotTermEvent
      formula input)

/--
The fixed marked-snapshot language is complete for the exponentially
initialized two-counter bounded-run interface.
-/
theorem fixedPureSMarkedSnapshotTermEvent_exponentialCounterBoundedRunComplete :
    Computation.ExponentialCounterBoundedRun.Complete
      FixedPureSMarkedSnapshotTermEvent := by
  exact
    Computation.EncodedSigmaOneTermEvent.fixedMarkedSnapshotTermEvent_encodedSigmaOneComplete

/-- Completeness relative to the direct-input two-counter source model. -/
theorem fixedPureSMarkedSnapshotTermEvent_directInputCounterComplete :
    Computation.CounterMachine.Complete
      FixedPureSMarkedSnapshotTermEvent := by
  refine ⟨Computation.pureSMarkedSnapshotTermEvent_semidecidable
    Cook.rogozhinCookProgram Computation.CounterMachinePureS.dispatcher, ?_⟩
  intro source recognizable
  exact Computation.ManyOneReduces.trans
    (Computation.CounterMachine.universalAccepts_hard source recognizable)
    ⟨fixedPureSMarkedSnapshotJobEncoder,
      universalAccepts_iff_fixedPureSMarkedSnapshotTermEvent⟩

/-! ## The same marked-snapshot language on literal natural codes -/

/-- The fixed marked-snapshot language transported through the displayed
bijective Cantor coding of closed pure-`S` terms. -/
abbrev FixedPureSMarkedSnapshotNatLanguage : Nat → Prop :=
  Computation.EncodedSigmaOneNatEvent.FixedPureSMarkedSnapshotNatLanguage

/-- The named total universal-job-to-natural-code encoder. -/
abbrev fixedPureSMarkedSnapshotJobCodeEncoder :=
  Computation.EncodedSigmaOneNatEvent.encodeJobCode

/-- The named total bounded-run-specification/input-to-natural-code encoder. -/
abbrev fixedPureSMarkedSnapshotFormulaCodeEncoder :=
  Computation.EncodedSigmaOneNatEvent.encodeFormulaCode

/-- Universal two-counter acceptance is exactly membership of the natural
code returned by the displayed encoder. -/
theorem universalAccepts_iff_fixedPureSMarkedSnapshotNatLanguage
    (job : Computation.CounterMachine.UniversalInput) :
    Computation.CounterMachine.UniversalAccepts job ↔
      FixedPureSMarkedSnapshotNatLanguage
        (fixedPureSMarkedSnapshotJobCodeEncoder job) :=
  Computation.EncodedSigmaOneNatEvent.universalAccepts_iff_fixedPureSMarkedSnapshotNatLanguage
    job

/-- The displayed job-code encoder is a pointwise reduction to the literal
natural-number language. -/
theorem fixedPureSMarkedSnapshotJobCodeEncoder_reducesVia :
    Computation.ReducesVia fixedPureSMarkedSnapshotJobCodeEncoder
      Computation.CounterMachine.UniversalAccepts
      FixedPureSMarkedSnapshotNatLanguage :=
  Computation.EncodedSigmaOneNatEvent.encodeJobCode_reducesVia

/-- The displayed specification-code encoder preserves and reflects
existential bounded-run acceptance. -/
theorem encodedBoundedWitnessFormula_iff_fixedPureSMarkedSnapshotNatLanguage
    (formula : Computation.BoundedSigmaOne.Formula) (input : Nat) :
    (∃ witness,
      Computation.BoundedSigmaOne.eval formula input witness = true) ↔
      FixedPureSMarkedSnapshotNatLanguage
        (fixedPureSMarkedSnapshotFormulaCodeEncoder formula input) :=
  Computation.EncodedSigmaOneNatEvent.encodedBoundedWitnessFormula_iff_fixedPureSMarkedSnapshotNatLanguage
    formula input

/-- Each displayed specification-code encoder is a pointwise reduction to
the literal natural-number language. -/
theorem fixedPureSMarkedSnapshotFormulaCodeEncoder_reducesVia
    (formula : Computation.BoundedSigmaOne.Formula) :
    Computation.ReducesVia
      (fixedPureSMarkedSnapshotFormulaCodeEncoder formula)
      (fun input => ∃ witness,
        Computation.BoundedSigmaOne.eval formula input witness = true)
      FixedPureSMarkedSnapshotNatLanguage :=
  Computation.EncodedSigmaOneNatEvent.encodeFormulaCode_reducesVia formula

/-- The literal natural-code language is complete for the exponentially
initialized two-counter bounded-run interface. -/
theorem fixedPureSMarkedSnapshotNatLanguage_exponentialCounterBoundedRunComplete :
    Computation.ExponentialCounterBoundedRun.Complete
      FixedPureSMarkedSnapshotNatLanguage :=
  Computation.EncodedSigmaOneNatEvent.fixedPureSMarkedSnapshotNatLanguage_encodedBoundedWitnessComplete

/-- The literal natural-code language is complete relative to the direct-input
two-counter source model. -/
theorem fixedPureSMarkedSnapshotNatLanguage_directInputCounterComplete :
    Computation.CounterMachine.Complete
      FixedPureSMarkedSnapshotNatLanguage :=
  Computation.EncodedSigmaOneNatEvent.fixedPureSMarkedSnapshotNatLanguage_counterMachineComplete

end WeakPathUniversality

end PureSFormal
