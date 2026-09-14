import PureSFormal.PureS.PublicDecoder
import PureSFormal.PureS.SchedulerInvariant
import PureSFormal.PureS.ControllerProjection

/-!
# Public decoder consequences of the sampled scheduler invariant
-/

namespace PureSFormal.PureS

namespace SchedulerInvariant

namespace EventEvidence

/--
Any successful public decode from an indexed sampled event fixes both the
canonical checkpoint index and the exact CTS iterate.  This is the direction
needed by the public `acceptsOnly` contract; silent samples need not carry an
artificial inequality against every future checkpoint index.
-/
theorem publicAcceptsOnly
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {bits : List Bool} {sampleIndex : Nat}
    {family : SchedulerControl.Family} {term : Term}
    (evidence : EventEvidence program dispatcher bits sampleIndex family term)
    (horizon : Nat) (config : CTS.Config program)
    (decoded : PublicDecoder.decode program dispatcher.tree term =
      some (horizon, config)) :
    sampleIndex = ExactCheckpointRun.checkpointTime
        program dispatcher bits horizon ∧
      config = CTS.iterate program horizon (CTS.initial program bits) := by
  cases evidence with
  | timeZero =>
      have exactZero := PublicDecoder.decode_timeZero program dispatcher bits
      rw [exactZero] at decoded
      have pairEq := Option.some.inj decoded
      have horizonEq : horizon = 0 := (congrArg Prod.fst pairEq).symm
      have configEq : config = CTS.initial program bits :=
        (congrArg Prod.snd pairEq).symm
      subst horizon
      subst config
      exact ⟨rfl, rfl⟩
  | silent silent =>
      unfold PublicDecoder.decode at decoded
      rw [silent.rejected] at decoded
      contradiction
  | positive offset certificate index_eq =>
      have exactPositive := PublicDecoder.decode_positivePrefix certificate
      rw [exactPositive] at decoded
      have pairEq := Option.some.inj decoded
      have horizonEq : horizon = offset + 1 :=
        (congrArg Prod.fst pairEq).symm
      have configEq : config =
          CTS.iterate program (offset + 1) (CTS.initial program bits) :=
        (congrArg Prod.snd pairEq).symm
      subst horizon
      subst config
      exact ⟨index_eq, rfl⟩

end EventEvidence

namespace SampledGood

/-- Every successful public decode on the executable sampled run is exact. -/
theorem contractionRun_publicAcceptsOnly
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool)
    (bound : Configuration program dispatcher → Nat)
    (initialConfiguration : Configuration program dispatcher)
    (initialGood : SampledGood program dispatcher bits 0 bound
      initialConfiguration)
    (index horizon : Nat) (config : CTS.Config program)
    (decoded :
      let system := productiveSystem program dispatcher bits bound
        initialConfiguration initialGood
      PublicDecoder.decode program dispatcher.tree
        (system.contractionRun index).cursor.erase = some (horizon, config)) :
    index = ExactCheckpointRun.checkpointTime
        program dispatcher bits horizon ∧
      config = CTS.iterate program horizon (CTS.initial program bits) := by
  dsimp only at decoded
  obtain ⟨control, controlEq, evidence⟩ :=
    contractionRun_event program dispatcher bits bound initialConfiguration
      initialGood index
  exact evidence.publicAcceptsOnly horizon config decoded

/--
Productivity plus the positive-checkpoint direction gives the complete public
controller certificate.  The converse decoder direction is already forced by
the indexed event invariant above.
-/
def controllerCertificate
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool)
    (bound : Configuration program dispatcher → Nat)
    (initialGood : SampledGood program dispatcher bits 0 bound
      (SchedulerControl.initialConfiguration program dispatcher bits))
    (exactCheckpoint : ∀ horizon,
      let system := productiveSystem program dispatcher bits bound
        (SchedulerControl.initialConfiguration program dispatcher bits)
        initialGood
      PublicDecoder.decode program dispatcher.tree
          (system.contractionRun
            (ExactCheckpointRun.checkpointTime program dispatcher bits
              horizon)).cursor.erase =
        some (horizon,
          CTS.iterate program horizon (CTS.initial program bits))) :
    ControllerProjection.Certificate program
      (SchedulerControl.initialControl program dispatcher)
      (generator (compileActions program dispatcher.tree) bits)
      (CTS.initial program bits)
      (PublicDecoder.decode program dispatcher.tree)
      (machine := SchedulerControl.machine program dispatcher) := by
  let system := productiveSystem program dispatcher bits bound
    (SchedulerControl.initialConfiguration program dispatcher bits) initialGood
  refine
    { system := system
      startsAt := rfl
      checkpointTime := ExactCheckpointRun.checkpointTime
        program dispatcher bits
      checkpointZero := ExactCheckpointRun.checkpointTime_zero
        program dispatcher bits
      checkpointsIncrease :=
        ExactCheckpointRun.checkpointTime_strictlyIncreasing
          program dispatcher bits
      exactCheckpoint := ?_
      acceptsOnly := ?_ }
  · intro horizon
    simpa [FiniteController.ProductiveSystem.reductionPath, system] using
      exactCheckpoint horizon
  · intro index horizon config decoded
    apply contractionRun_publicAcceptsOnly program dispatcher bits bound
      (SchedulerControl.initialConfiguration program dispatcher bits)
      initialGood index horizon config
    simpa [FiniteController.ProductiveSystem.reductionPath, system] using decoded

/-- Uniformly package input-indexed productivity/checkpoint proofs. -/
def uniformCertificate
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bound : List Bool → Configuration program dispatcher → Nat)
    (initialGood : ∀ bits,
      SampledGood program dispatcher bits 0 (bound bits)
        (SchedulerControl.initialConfiguration program dispatcher bits))
    (exactCheckpoint : ∀ bits horizon,
      let system := productiveSystem program dispatcher bits (bound bits)
        (SchedulerControl.initialConfiguration program dispatcher bits)
        (initialGood bits)
      PublicDecoder.decode program dispatcher.tree
          (system.contractionRun
            (ExactCheckpointRun.checkpointTime program dispatcher bits
              horizon)).cursor.erase =
        some (horizon,
          CTS.iterate program horizon (CTS.initial program bits))) :
    ControllerProjection.UniformCertificate program
      (SchedulerControl.initialControl program dispatcher)
      (SchedulerControl.machine program dispatcher)
      (PublicDecoder.decode program dispatcher.tree) where
  encode bits := generator (compileActions program dispatcher.tree) bits
  certificate bits := controllerCertificate program dispatcher bits
    (bound bits) (initialGood bits) (exactCheckpoint bits)

end SampledGood

end SchedulerInvariant

end PureSFormal.PureS
