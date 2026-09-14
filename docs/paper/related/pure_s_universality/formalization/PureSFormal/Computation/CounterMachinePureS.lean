import PureSFormal.Computation.CounterMachineCook
import PureSFormal.Computation.PureSEvent
import PureSFormal.Computation.SigmaOneEvent
import PureSFormal.PureS.BalancedActionTree
import PureSFormal.PureS.SchedulerBound

/-!
# Conventional two-counter acceptance at the fixed pure-S snapshot language

This module composes the premise-free source-to-Cook theorem with the generic
productive-scheduler interface.  Its only arguments are the two generic
scheduler certificates that establish productivity and exact checkpoints for
every binary input word.
-/

namespace PureSFormal.Computation

open PureSFormal.PureS

namespace CounterMachinePureS

/-- The fixed balanced dispatcher for Cook's literal period-912 CTS. -/
abbrev dispatcher : ActionDispatcher Cook.rogozhinCookProgram :=
  BalancedActionTree.dispatcher Cook.rogozhinCookProgram

/-- Conventional universal acceptance is exactly eventual observation of a
decoder-recognized marked checkpoint on the fixed controller trajectory. -/
theorem universalAccepts_iff_pureSEvent
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
          dispatcher (CounterMachineCook.encodeBits job)) := by
  exact (CounterMachineCook.universalAccepts_iff_fixedCookEmpty job).trans
    (TermEvent.eventuallyObservesMarkedCheckpointRaw_iff_eventuallyEmpty
      Cook.rogozhinCookProgram dispatcher (CounterMachineCook.encodeBits job)
      (SchedulerBound.bound Cook.rogozhinCookProgram dispatcher)
      (initialGood (CounterMachineCook.encodeBits job))
      (exactCheckpoint (CounterMachineCook.encodeBits job))).symm

/-- Conventional universal acceptance is exactly marked-snapshot observation
for the encoded bare pure-S term under the fixed initialized scheduler. -/
theorem universalAccepts_iff_pureSTermEvent
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
      PureSMarkedSnapshotTermEvent Cook.rogozhinCookProgram dispatcher
        (generator
          (compileActions Cook.rogozhinCookProgram dispatcher.tree)
          (CounterMachineCook.encodeBits job)) := by
  unfold PureSMarkedSnapshotTermEvent
  rw [initialTermConfiguration_generator]
  exact universalAccepts_iff_pureSEvent initialGood exactCheckpoint job

/-- The fixed marked-snapshot controller language is complete for the
exponentially initialized two-counter bounded-run interface. -/
theorem pureSControllerEvent_sigmaOneComplete
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
      SchedulerControl.initialConfiguration Cook.rogozhinCookProgram dispatcher
        (CounterMachineCook.encodeBits job))
    (universalAccepts_iff_pureSEvent initialGood exactCheckpoint)

/-- The fixed marked-snapshot language on bare pure-S terms is complete for
the exponentially initialized two-counter bounded-run interface. -/
theorem pureSTermEvent_sigmaOneComplete
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
      (PureSMarkedSnapshotTermEvent Cook.rogozhinCookProgram dispatcher) := by
  exact boundedSigmaOne_complete_of_counterUniversal
    (PureSMarkedSnapshotTermEvent Cook.rogozhinCookProgram dispatcher)
    (pureSMarkedSnapshotTermEvent_semidecidable Cook.rogozhinCookProgram
      dispatcher)
    (fun job =>
      generator (compileActions Cook.rogozhinCookProgram dispatcher.tree)
        (CounterMachineCook.encodeBits job))
    (universalAccepts_iff_pureSTermEvent initialGood exactCheckpoint)

/-! Accurate aliases for the marked-snapshot theorem chain. -/

abbrev universalAccepts_iff_pureSMarkedSnapshotEvent :=
  universalAccepts_iff_pureSEvent

abbrev universalAccepts_iff_pureSMarkedSnapshotTermEvent :=
  universalAccepts_iff_pureSTermEvent

abbrev pureSMarkedSnapshotControllerEvent_sigmaOneComplete :=
  pureSControllerEvent_sigmaOneComplete

abbrev pureSMarkedSnapshotTermEvent_sigmaOneComplete :=
  pureSTermEvent_sigmaOneComplete

end CounterMachinePureS

end PureSFormal.Computation
