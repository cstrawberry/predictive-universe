import PureSFormal.Computation.Enumerable
import PureSFormal.PureS.TermEvent

/-!
# Completeness interfaces for pure-S trajectory observations

The complete target language in this module observes decoder-recognized marked
checkpoint snapshots on the actual microtick trajectory.  The separate
decoder-free predicate records literal performance of the registered marker
contraction and has the bounded semideciders proved below.
-/

namespace PureSFormal.Computation

open PureSFormal.PureS

/-- Decoder-recognized marked snapshots for one fixed CTS scheduler. -/
def PureSMarkedSnapshotControllerEvent
    (program : CTS.Program) (dispatcher : ActionDispatcher program) :
    SchedulerInvariant.Configuration program dispatcher → Prop :=
  TermEvent.EventuallyObservesMarkedCheckpointRaw
    (SchedulerControl.machine program dispatcher) program dispatcher.tree

/-- Compatibility name for the marked-snapshot controller language. -/
abbrev PureSControllerEvent := PureSMarkedSnapshotControllerEvent

/-- Initialize the fixed scheduler at the root of an arbitrary bare term. -/
def initialTermConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (term : Term) :
    SchedulerInvariant.Configuration program dispatcher :=
  ⟨some (SchedulerControl.initialControl program dispatcher), ⟨term, []⟩⟩

/-- The marked-snapshot language as a predicate of a bare pure-S term. -/
def PureSMarkedSnapshotTermEvent
    (program : CTS.Program) (dispatcher : ActionDispatcher program) :
    Term → Prop :=
  fun term => PureSMarkedSnapshotControllerEvent program dispatcher
    (initialTermConfiguration program dispatcher term)

/-- Compatibility name for the marked-snapshot bare-term language. -/
abbrev PureSTermEvent := PureSMarkedSnapshotTermEvent

/-- Decoder-free occurrence of the literal registered marker contraction. -/
def PureSRegisteredMarkControllerEvent
    (program : CTS.Program) (dispatcher : ActionDispatcher program) :
    SchedulerInvariant.Configuration program dispatcher → Prop :=
  TermEvent.EventuallyPerformsRegisteredMarkHRaw program dispatcher

/-- The registered-contraction language as a predicate of a bare pure-S term. -/
def PureSRegisteredMarkTermEvent
    (program : CTS.Program) (dispatcher : ActionDispatcher program) :
    Term → Prop :=
  fun term => PureSRegisteredMarkControllerEvent program dispatcher
    (initialTermConfiguration program dispatcher term)

@[simp]
theorem initialTermConfiguration_generator
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    initialTermConfiguration program dispatcher
        (generator (compileActions program dispatcher.tree) bits) =
      SchedulerControl.initialConfiguration program dispatcher bits :=
  rfl

/-- The marked-snapshot controller language has a bounded semidecider. -/
theorem pureSMarkedSnapshotControllerEvent_semidecidable
    (program : CTS.Program) (dispatcher : ActionDispatcher program) :
    BoundedlySemidecidable
      (PureSMarkedSnapshotControllerEvent program dispatcher) := by
  refine ⟨fun initial ticks =>
    TermEvent.observesMarkedCheckpoint? program dispatcher.tree
      (FiniteController.run (SchedulerControl.machine program dispatcher)
        ticks initial).cursor.erase, ?_⟩
  intro initial
  exact Iff.rfl

/-- Compatibility theorem for the marked-snapshot controller language. -/
theorem pureSControllerEvent_semidecidable
    (program : CTS.Program) (dispatcher : ActionDispatcher program) :
    BoundedlySemidecidable (PureSControllerEvent program dispatcher) :=
  pureSMarkedSnapshotControllerEvent_semidecidable program dispatcher

/-- The bare-term marked-snapshot language has a bounded semidecider. -/
theorem pureSMarkedSnapshotTermEvent_semidecidable
    (program : CTS.Program) (dispatcher : ActionDispatcher program) :
    BoundedlySemidecidable
      (PureSMarkedSnapshotTermEvent program dispatcher) := by
  refine ⟨fun term ticks =>
    TermEvent.observesMarkedCheckpoint? program dispatcher.tree
      (FiniteController.run (SchedulerControl.machine program dispatcher)
        ticks (initialTermConfiguration program dispatcher term)).cursor.erase,
    ?_⟩
  intro term
  exact Iff.rfl

/-- Compatibility theorem for the bare-term marked-snapshot language. -/
theorem pureSTermEvent_semidecidable
    (program : CTS.Program) (dispatcher : ActionDispatcher program) :
    BoundedlySemidecidable (PureSTermEvent program dispatcher) :=
  pureSMarkedSnapshotTermEvent_semidecidable program dispatcher

/-- The registered-contraction controller language has a bounded semidecider. -/
theorem pureSRegisteredMarkControllerEvent_semidecidable
    (program : CTS.Program) (dispatcher : ActionDispatcher program) :
    BoundedlySemidecidable
      (PureSRegisteredMarkControllerEvent program dispatcher) := by
  refine ⟨fun initial ticks =>
    TermEvent.performsRegisteredMarkH? program dispatcher
      (FiniteController.run (SchedulerControl.machine program dispatcher)
        ticks initial), ?_⟩
  intro initial
  exact Iff.rfl

/-- The registered-contraction bare-term language has a bounded semidecider. -/
theorem pureSRegisteredMarkTermEvent_semidecidable
    (program : CTS.Program) (dispatcher : ActionDispatcher program) :
    BoundedlySemidecidable
      (PureSRegisteredMarkTermEvent program dispatcher) := by
  refine ⟨fun term ticks =>
    TermEvent.performsRegisteredMarkH? program dispatcher
      (FiniteController.run (SchedulerControl.machine program dispatcher)
        ticks (initialTermConfiguration program dispatcher term)), ?_⟩
  intro term
  exact Iff.rfl

/--
Any complete source compiled exactly to eventual CTS emptiness reduces to the
marked-snapshot scheduler language.  Scheduler productivity and checkpoint
exactness are stated for every encoded bitword; they are construction proofs,
not runtime data.
-/
theorem pureSMarkedSnapshotControllerEvent_complete_of_cts_source
    {Input : Type} (source : Input → Prop)
    (sourceComplete : NatMachineComplete source)
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (encodeBits : Input → List Bool)
    (source_iff_empty : ∀ input,
      source input ↔
        ∃ horizon,
          (CTS.iterate program horizon
            (CTS.initial program (encodeBits input))).data = [])
    (bound : List Bool →
      SchedulerInvariant.Configuration program dispatcher → Nat)
    (initialGood : ∀ bits,
      SchedulerInvariant.SampledGood program dispatcher bits 0 (bound bits)
        (SchedulerControl.initialConfiguration program dispatcher bits))
    (exactCheckpoint : ∀ bits horizon,
      let system := SchedulerInvariant.SampledGood.productiveSystem
        program dispatcher bits (bound bits)
        (SchedulerControl.initialConfiguration program dispatcher bits)
        (initialGood bits)
      PublicDecoder.decode program dispatcher.tree
          (system.contractionRun
            (ExactCheckpointRun.checkpointTime program dispatcher bits
              horizon)).cursor.erase =
        some (horizon,
          CTS.iterate program horizon (CTS.initial program bits))) :
    NatMachineComplete
      (PureSMarkedSnapshotControllerEvent program dispatcher) := by
  apply complete_of_complete_reduces sourceComplete
  · refine ⟨fun input =>
      SchedulerControl.initialConfiguration program dispatcher
        (encodeBits input), ?_⟩
    intro input
    exact (source_iff_empty input).trans
      (TermEvent.eventuallyObservesMarkedCheckpointRaw_iff_eventuallyEmpty
        program dispatcher (encodeBits input) (bound (encodeBits input))
        (initialGood (encodeBits input))
        (exactCheckpoint (encodeBits input))).symm
  · exact pureSMarkedSnapshotControllerEvent_semidecidable program dispatcher

/-- Compatibility name for marked-snapshot controller completeness. -/
abbrev pureSControllerEvent_complete_of_cts_source {Input : Type} :=
  @pureSMarkedSnapshotControllerEvent_complete_of_cts_source Input

/--
Any complete source compiled to eventual CTS emptiness many-one reduces to
the marked-snapshot language on encoded bare pure-S terms.  The target input
contains no cursor, control state, phase, or decoder annotation.
-/
theorem pureSMarkedSnapshotTermEvent_complete_of_cts_source
    {Input : Type} (source : Input → Prop)
    (sourceComplete : NatMachineComplete source)
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (encodeBits : Input → List Bool)
    (source_iff_empty : ∀ input,
      source input ↔
        ∃ horizon,
          (CTS.iterate program horizon
            (CTS.initial program (encodeBits input))).data = [])
    (bound : List Bool →
      SchedulerInvariant.Configuration program dispatcher → Nat)
    (initialGood : ∀ bits,
      SchedulerInvariant.SampledGood program dispatcher bits 0 (bound bits)
        (SchedulerControl.initialConfiguration program dispatcher bits))
    (exactCheckpoint : ∀ bits horizon,
      let system := SchedulerInvariant.SampledGood.productiveSystem
        program dispatcher bits (bound bits)
        (SchedulerControl.initialConfiguration program dispatcher bits)
        (initialGood bits)
      PublicDecoder.decode program dispatcher.tree
          (system.contractionRun
            (ExactCheckpointRun.checkpointTime program dispatcher bits
              horizon)).cursor.erase =
        some (horizon,
          CTS.iterate program horizon (CTS.initial program bits))) :
    NatMachineComplete
      (PureSMarkedSnapshotTermEvent program dispatcher) := by
  apply complete_of_complete_reduces sourceComplete
  · refine ⟨fun input =>
      generator (compileActions program dispatcher.tree) (encodeBits input), ?_⟩
    intro input
    exact (source_iff_empty input).trans
      (TermEvent.eventuallyObservesMarkedCheckpointRaw_iff_eventuallyEmpty
        program dispatcher (encodeBits input) (bound (encodeBits input))
        (initialGood (encodeBits input))
        (exactCheckpoint (encodeBits input))).symm
  · exact pureSMarkedSnapshotTermEvent_semidecidable program dispatcher

/-- Compatibility name for marked-snapshot bare-term completeness. -/
abbrev pureSTermEvent_complete_of_cts_source {Input : Type} :=
  @pureSMarkedSnapshotTermEvent_complete_of_cts_source Input

end PureSFormal.Computation
