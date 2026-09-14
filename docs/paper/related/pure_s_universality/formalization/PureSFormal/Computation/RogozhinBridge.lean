import PureSFormal.Computation.Enumerable
import PureSFormal.Computation.Simulation

/-!
# Exact boundary from universal bytecode to Rogozhin (4,6)

This module states the precise certificate needed to turn the fixed Rogozhin
machine into a universal machine for the concrete natural-number interpreter.
It proves every composition theorem after that certificate is supplied.  It
does not postulate or manufacture the certificate: constructing its compiler,
history-free decoder, boundary clock, and proofs is the remaining external
universality formalization.
-/

namespace PureSFormal.Computation

/-- A source snapshot retains the immutable program beside its live state. -/
structure NatMachineSnapshot where
  program : Nat
  state : NatMachine.State
  deriving DecidableEq, Repr

/-- The universal bytecode interpreter as an instance-indexed source model. -/
def natMachineSource : SourceModel where
  Instance := NatMachine.UniversalInput
  Snapshot := NatMachineSnapshot
  initial job := ⟨job.program, NatMachine.initial job.input⟩
  step snapshot :=
    ⟨snapshot.program, NatMachine.step snapshot.program snapshot.state⟩
  halted snapshot := snapshot.state.status = .accepted

/-- Source-model iteration is exactly the executable bytecode runner. -/
theorem natMachineSource_iterate
    (job : NatMachine.UniversalInput) (fuel : Nat) :
    natMachineSource.iterate fuel (natMachineSource.initial job) =
      ⟨job.program,
        NatMachine.run job.program fuel (NatMachine.initial job.input)⟩ := by
  induction fuel with
  | zero => rfl
  | succ fuel ih =>
      rw [SourceModel.iterate_succ, ih, NatMachine.run_succ]
      rfl

/-- The Boolean acceptance test is true exactly in accepting status. -/
theorem acceptsWithin_eq_true_iff
    (program input fuel : Nat) :
    NatMachine.acceptsWithin program input fuel = true ↔
      (NatMachine.run program fuel
        (NatMachine.initial input)).status = .accepted := by
  unfold NatMachine.acceptsWithin
  cases hstatus : (NatMachine.run program fuel
    (NatMachine.initial input)).status with
  | running =>
      constructor
      · intro impossible
        cases impossible
      · intro impossible
        cases impossible
  | accepted =>
      constructor
      · intro _
        rfl
      · intro _
        rfl
  | rejected =>
      constructor
      · intro impossible
        cases impossible
      · intro impossible
        cases impossible

/-- Universal acceptance equals source-level eventual halting. -/
theorem universalAccepts_iff_sourceEventuallyHalts
    (job : NatMachine.UniversalInput) :
    NatMachine.UniversalAccepts job ↔
      natMachineSource.EventuallyHalts job := by
  unfold NatMachine.UniversalAccepts NatMachine.Accepts
  unfold SourceModel.EventuallyHalts
  constructor
  · rintro ⟨fuel, haccepts⟩
    refine ⟨fuel, ?_⟩
    rw [natMachineSource_iterate]
    exact (acceptsWithin_eq_true_iff job.program job.input fuel).1 haccepts
  · rintro ⟨fuel, hhalted⟩
    refine ⟨fuel, ?_⟩
    rw [natMachineSource_iterate] at hhalted
    exact (acceptsWithin_eq_true_iff job.program job.input fuel).2 hhalted

/--
A supplied compiler and exact simulation proof yield the required halting
equivalence. The three maps and their proof are visible arguments;
this module contains no declaration that constructs them.
-/
theorem universalAcceptance_iff_rogozhinHalting_of_simulation
    (compile : NatMachine.UniversalInput → Rogozhin46.Config)
    (decode : Rogozhin46.Config → Option (PackedSnapshot natMachineSource))
    (boundaryTime : NatMachine.UniversalInput → Nat → Nat)
    (simulation : ExactEffectiveSimulation natMachineSource
      compile decode boundaryTime)
    (job : NatMachine.UniversalInput) :
    NatMachine.UniversalAccepts job ↔
      Rogozhin46.EventuallyHalts (compile job) :=
  (universalAccepts_iff_sourceEventuallyHalts job).trans
    (simulation.haltsIff job)

/-- The displayed compiler component witnesses the extensional
`ManyOneReduces` relation. -/
theorem universalAcceptance_reduces_to_rogozhin_of_simulation
    (compile : NatMachine.UniversalInput → Rogozhin46.Config)
    (decode : Rogozhin46.Config → Option (PackedSnapshot natMachineSource))
    (boundaryTime : NatMachine.UniversalInput → Nat → Nat)
    (simulation : ExactEffectiveSimulation natMachineSource
      compile decode boundaryTime) :
    ManyOneReduces NatMachine.UniversalAccepts
      Rogozhin46.EventuallyHalts :=
  ⟨compile, universalAcceptance_iff_rogozhinHalting_of_simulation
    compile decode boundaryTime simulation⟩

/-- Executable Boolean observation of a Rogozhin halting table cell. -/
def rogozhinHalted? (config : Rogozhin46.Config) : Bool :=
  match Rogozhin46.transition config.state config.current with
  | .halt => true
  | .step _ _ _ => false

/-- The Boolean observation agrees exactly with the propositional predicate. -/
theorem rogozhinHalted?_eq_true_iff (config : Rogozhin46.Config) :
    rogozhinHalted? config = true ↔ Rogozhin46.Halted config := by
  unfold rogozhinHalted? Rogozhin46.Halted
  cases htransition : Rogozhin46.transition config.state config.current with
  | halt =>
      constructor
      · intro _
        rfl
      · intro _
        rfl
  | step next written direction =>
      constructor
      · intro impossible
        cases impossible
      · intro impossible
        cases impossible

/-- Rogozhin eventual halting has its exact machine horizon as a witness. -/
theorem rogozhinEventuallyHalts_semidecidable :
    BoundedlySemidecidable Rogozhin46.EventuallyHalts := by
  refine ⟨fun config fuel =>
    rogozhinHalted? (Rogozhin46.iterate fuel config), ?_⟩
  intro config
  unfold Rogozhin46.EventuallyHalts
  constructor
  · rintro ⟨fuel, hhalted⟩
    exact ⟨fuel,
      (rogozhinHalted?_eq_true_iff
        (Rogozhin46.iterate fuel config)).2 hhalted⟩
  · rintro ⟨fuel, hhalted⟩
    exact ⟨fuel,
      (rogozhinHalted?_eq_true_iff
        (Rogozhin46.iterate fuel config)).1 hhalted⟩

/--
Conditional completeness transfer.  Its sole substantive premise is the
explicit exact simulation certificate; no declaration in this module claims
that such a certificate has already been constructed.
-/
theorem rogozhinEventuallyHalts_complete_of_simulation
    (compile : NatMachine.UniversalInput → Rogozhin46.Config)
    (decode : Rogozhin46.Config → Option (PackedSnapshot natMachineSource))
    (boundaryTime : NatMachine.UniversalInput → Nat → Nat)
    (simulation : ExactEffectiveSimulation natMachineSource
      compile decode boundaryTime) :
    NatMachineComplete Rogozhin46.EventuallyHalts := by
  exact complete_of_complete_reduces universalAcceptance_complete
    (universalAcceptance_reduces_to_rogozhin_of_simulation
      compile decode boundaryTime simulation)
    rogozhinEventuallyHalts_semidecidable

end PureSFormal.Computation
