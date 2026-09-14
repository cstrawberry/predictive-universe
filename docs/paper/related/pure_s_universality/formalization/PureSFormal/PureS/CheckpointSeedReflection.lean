import PureSFormal.PureS.CheckpointSeedReadback
import PureSFormal.PureS.SchedulerDecoder

/-!
# Exact seed and checkpoint observation on the actual contraction run

An accepted snapshot contains the original seed, the actual cyclic-tag
horizon, and the configuration reached at that horizon. The observation
function receives only the current term. The run and its indices occur only
in the correctness statements.
-/

namespace PureSFormal.PureS.CheckpointSeedReflection

def sampleTerm (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (sample : Nat) : Term :=
  let system := SchedulerInvariant.SampledGood.productiveSystem program dispatcher bits
    (SchedulerBound.bound program dispatcher)
    (SchedulerControl.initialConfiguration program dispatcher bits)
    (SchedulerRecurrence.initialGood program dispatcher bits)
  (system.contractionRun sample).cursor.erase

theorem decode?_actual_reflects
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (sample horizon : Nat) (original : List Bool)
    (configuration : CTS.Config program)
    (accepted : CheckpointSeedReadback.decode? program dispatcher.tree
      (sampleTerm program dispatcher bits sample) = some (original, horizon, configuration)) :
    sample = ExactCheckpointRun.checkpointTime program dispatcher bits horizon ∧
      original = bits ∧ configuration = CTS.iterate program horizon (CTS.initial program bits) := by
  have publicAccepted := CheckpointSeedReadback.decode?_public accepted
  have reflected := SchedulerInvariant.SampledGood.contractionRun_publicAcceptsOnly
    program dispatcher bits (SchedulerBound.bound program dispatcher)
    (SchedulerControl.initialConfiguration program dispatcher bits)
    (SchedulerRecurrence.initialGood program dispatcher bits)
    sample horizon configuration publicAccepted
  have atCheckpoint := CheckpointSeedReadback.decode?_actualCheckpoint program dispatcher bits horizon
  change CheckpointSeedReadback.decode? program dispatcher.tree
    (sampleTerm program dispatcher bits
      (ExactCheckpointRun.checkpointTime program dispatcher bits horizon)) = _ at atCheckpoint
  rw [reflected.1, atCheckpoint] at accepted
  have seedEq := congrArg Prod.fst (Option.some.inj accepted)
  exact ⟨reflected.1, seedEq.symm, reflected.2⟩

theorem decode?_actual_iff
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (sample horizon : Nat) (original : List Bool)
    (configuration : CTS.Config program) :
    CheckpointSeedReadback.decode? program dispatcher.tree
      (sampleTerm program dispatcher bits sample) = some (original, horizon, configuration) ↔
    sample = ExactCheckpointRun.checkpointTime program dispatcher bits horizon ∧
      original = bits ∧ configuration = CTS.iterate program horizon (CTS.initial program bits) := by
  constructor
  · exact decode?_actual_reflects program dispatcher bits sample horizon original configuration
  · rintro ⟨sampleEq, originalEq, configurationEq⟩
    rw [sampleEq, originalEq, configurationEq]
    exact CheckpointSeedReadback.decode?_actualCheckpoint program dispatcher bits horizon

def observe {α : Type} (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (read : List Bool → Nat → CTS.Config program → Option α) (term : Term) : Option α :=
  (CheckpointSeedReadback.decode? program tree term).bind
    (fun decoded => read decoded.1 decoded.2.1 decoded.2.2)

theorem observe_at_checkpoint {α : Type}
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (read : List Bool → Nat → CTS.Config program → Option α)
    (bits : List Bool) (horizon : Nat) :
    observe program dispatcher.tree read
      (sampleTerm program dispatcher bits
        (ExactCheckpointRun.checkpointTime program dispatcher bits horizon)) =
      read bits horizon (CTS.iterate program horizon (CTS.initial program bits)) := by
  have checkpoint := CheckpointSeedReadback.decode?_actualCheckpoint program dispatcher bits horizon
  change CheckpointSeedReadback.decode? program dispatcher.tree
    (sampleTerm program dispatcher bits
      (ExactCheckpointRun.checkpointTime program dispatcher bits horizon)) = _ at checkpoint
  rw [observe, checkpoint]
  rfl

theorem observe_actual_iff {α : Type}
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (read : List Bool → Nat → CTS.Config program → Option α)
    (bits : List Bool) (sample : Nat) (value : α) :
    observe program dispatcher.tree read (sampleTerm program dispatcher bits sample) = some value ↔
      ∃ horizon, sample = ExactCheckpointRun.checkpointTime program dispatcher bits horizon ∧
        read bits horizon (CTS.iterate program horizon (CTS.initial program bits)) = some value := by
  constructor
  · intro accepted
    rw [observe] at accepted
    cases decoded : CheckpointSeedReadback.decode? program dispatcher.tree
        (sampleTerm program dispatcher bits sample) with
    | none => rw [decoded] at accepted; cases accepted
    | some snapshot =>
        rcases snapshot with ⟨original, horizon, configuration⟩
        rw [decoded] at accepted
        have reflected := decode?_actual_reflects program dispatcher bits sample horizon original configuration decoded
        change read original horizon configuration = some value at accepted
        rw [reflected.2.1, reflected.2.2] at accepted
        exact ⟨horizon, reflected.1, accepted⟩
  · rintro ⟨horizon, rfl, accepted⟩
    rw [observe_at_checkpoint]
    exact accepted

theorem exists_observe_actual_iff {α : Type}
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (read : List Bool → Nat → CTS.Config program → Option α)
    (bits : List Bool) (value : α) :
    (∃ sample, observe program dispatcher.tree read
      (sampleTerm program dispatcher bits sample) = some value) ↔
    ∃ horizon, read bits horizon (CTS.iterate program horizon (CTS.initial program bits)) = some value := by
  constructor
  · rintro ⟨sample, accepted⟩
    obtain ⟨horizon, _, found⟩ := (observe_actual_iff program dispatcher read bits sample value).mp accepted
    exact ⟨horizon, found⟩
  · rintro ⟨horizon, found⟩
    exact ⟨ExactCheckpointRun.checkpointTime program dispatcher bits horizon,
      (observe_actual_iff program dispatcher read bits _ value).mpr ⟨horizon, rfl, found⟩⟩

end PureSFormal.PureS.CheckpointSeedReflection
