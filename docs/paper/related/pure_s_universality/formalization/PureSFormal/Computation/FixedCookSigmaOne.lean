import PureSFormal.Computation.FixedCookBridge
import PureSFormal.Computation.SigmaOneEvent

/-!
# Conditional exponentially initialized bounded-run bridge for the fixed Cook endpoint

The source compiler may start directly from the finite two-counter syntax.
This keeps malformed natural bytecode outside the universal endpoint theorem
while retaining the exponentially initialized bounded-run completeness
statement.
-/

namespace PureSFormal.Computation

open PureSFormal.PureS

namespace FixedCookSigmaOne

/-- The same fixed balanced scheduler used by the natural-bytecode bridge. -/
abbrev dispatcher : ActionDispatcher Cook.rogozhinCookProgram :=
  FixedCookBridge.dispatcher

/-- Counter job, canonical Rogozhin boundary, Cook tag word, and one-hot CTS. -/
def encodeBits
    (compile : CounterMachine.UniversalInput → Rogozhin46.Config)
    (job : CounterMachine.UniversalInput) : List Bool :=
  Cook.encodeWord (Cook.PassClassification.canonicalWord (compile job))

/-- Conventional universal acceptance is exactly fixed-CTS emptiness. -/
theorem counterAccepts_iff_ctsEmpty
    (compile : CounterMachine.UniversalInput → Rogozhin46.Config)
    (compile_correct : ∀ job,
      CounterMachine.UniversalAccepts job ↔
        Rogozhin46.EventuallyHalts (compile job))
    (job : CounterMachine.UniversalInput) :
    CounterMachine.UniversalAccepts job ↔
      ∃ horizon,
        (CTS.iterate Cook.rogozhinCookProgram horizon
          (CTS.initial Cook.rogozhinCookProgram
            (encodeBits compile job))).data = [] :=
  (compile_correct job).trans
    (Cook.PassClassification.canonical_eventuallyHalts_iff_exists_cts_empty
      (compile job))

/-- Conventional universal acceptance is exactly the fixed pure-S
marked-snapshot observation event. -/
theorem counterAccepts_iff_pureSEvent
    (compile : CounterMachine.UniversalInput → Rogozhin46.Config)
    (compile_correct : ∀ job,
      CounterMachine.UniversalAccepts job ↔
        Rogozhin46.EventuallyHalts (compile job))
    (initialGood : ∀ bits,
      SchedulerInvariant.SampledGood Cook.rogozhinCookProgram dispatcher bits 0
        (SchedulerBound.bound Cook.rogozhinCookProgram dispatcher)
        (SchedulerControl.initialConfiguration Cook.rogozhinCookProgram
          dispatcher bits))
    (exactCheckpoint : ∀ bits horizon,
      let system := SchedulerInvariant.SampledGood.productiveSystem
        Cook.rogozhinCookProgram dispatcher bits
        (SchedulerBound.bound Cook.rogozhinCookProgram dispatcher)
        (SchedulerControl.initialConfiguration Cook.rogozhinCookProgram
          dispatcher bits)
        (initialGood bits)
      PublicDecoder.decode Cook.rogozhinCookProgram dispatcher.tree
          (system.contractionRun
            (ExactCheckpointRun.checkpointTime Cook.rogozhinCookProgram
              dispatcher bits horizon)).cursor.erase =
        some (horizon,
          CTS.iterate Cook.rogozhinCookProgram horizon
            (CTS.initial Cook.rogozhinCookProgram bits)))
    (job : CounterMachine.UniversalInput) :
    CounterMachine.UniversalAccepts job ↔
      PureSMarkedSnapshotControllerEvent Cook.rogozhinCookProgram dispatcher
        (SchedulerControl.initialConfiguration Cook.rogozhinCookProgram
          dispatcher (encodeBits compile job)) := by
  exact (counterAccepts_iff_ctsEmpty compile compile_correct job).trans
    (TermEvent.eventuallyObservesMarkedCheckpointRaw_iff_eventuallyEmpty
      Cook.rogozhinCookProgram dispatcher (encodeBits compile job)
      (SchedulerBound.bound Cook.rogozhinCookProgram dispatcher)
      (initialGood (encodeBits compile job))
      (exactCheckpoint (encodeBits compile job))).symm

/-- The marked-snapshot language of the fixed one-cursor pure-S controller is
complete for the exponentially initialized two-counter bounded-run
interface. -/
theorem pureSControllerEvent_sigmaOneComplete
    (compile : CounterMachine.UniversalInput → Rogozhin46.Config)
    (compile_correct : ∀ job,
      CounterMachine.UniversalAccepts job ↔
        Rogozhin46.EventuallyHalts (compile job))
    (initialGood : ∀ bits,
      SchedulerInvariant.SampledGood Cook.rogozhinCookProgram dispatcher bits 0
        (SchedulerBound.bound Cook.rogozhinCookProgram dispatcher)
        (SchedulerControl.initialConfiguration Cook.rogozhinCookProgram
          dispatcher bits))
    (exactCheckpoint : ∀ bits horizon,
      let system := SchedulerInvariant.SampledGood.productiveSystem
        Cook.rogozhinCookProgram dispatcher bits
        (SchedulerBound.bound Cook.rogozhinCookProgram dispatcher)
        (SchedulerControl.initialConfiguration Cook.rogozhinCookProgram
          dispatcher bits)
        (initialGood bits)
      PublicDecoder.decode Cook.rogozhinCookProgram dispatcher.tree
          (system.contractionRun
            (ExactCheckpointRun.checkpointTime Cook.rogozhinCookProgram
              dispatcher bits horizon)).cursor.erase =
        some (horizon,
          CTS.iterate Cook.rogozhinCookProgram horizon
            (CTS.initial Cook.rogozhinCookProgram bits))) :
    BoundedSigmaOne.Complete
      (PureSMarkedSnapshotControllerEvent Cook.rogozhinCookProgram
        dispatcher) := by
  exact boundedSigmaOne_complete_of_counterUniversal
    (PureSMarkedSnapshotControllerEvent Cook.rogozhinCookProgram dispatcher)
    (pureSMarkedSnapshotControllerEvent_semidecidable
      Cook.rogozhinCookProgram dispatcher)
    (fun job =>
      SchedulerControl.initialConfiguration Cook.rogozhinCookProgram
        dispatcher (encodeBits compile job))
    (counterAccepts_iff_pureSEvent compile compile_correct initialGood
      exactCheckpoint)

/-! Accurate aliases for the marked-snapshot bridge. -/

abbrev counterAccepts_iff_pureSMarkedSnapshotEvent :=
  counterAccepts_iff_pureSEvent

abbrev pureSMarkedSnapshotControllerEvent_sigmaOneComplete :=
  pureSControllerEvent_sigmaOneComplete

end FixedCookSigmaOne

end PureSFormal.Computation
