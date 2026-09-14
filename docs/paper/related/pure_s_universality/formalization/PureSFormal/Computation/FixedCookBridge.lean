import PureSFormal.Computation.PureSEvent
import PureSFormal.Computation.RogozhinBridge
import PureSFormal.Cook.PassClassification
import PureSFormal.PureS.BalancedActionTree
import PureSFormal.PureS.SchedulerBound

/-!
# Fixed universal-source to Cook-CTS and pure-S marked-snapshot bridge

This module performs the theorem composition around the two construction
certificates proved elsewhere: the source-to-Rogozhin simulation and the
productive exact scheduler run.  The intermediate encoding is the literal
canonical Cook boundary word followed by the printed 114-symbol one-hot code.
-/

namespace PureSFormal.Computation

open PureSFormal.PureS

namespace FixedCookBridge

/-- The operational balanced dispatcher for the fixed 912-phase Cook CTS. -/
def dispatcher : ActionDispatcher Cook.rogozhinCookProgram :=
  BalancedActionTree.dispatcher Cook.rogozhinCookProgram

/-- Canonical Rogozhin boundary, Cook tag word, then 114-bit one-hot blocks. -/
def encodeBits
    (compile : NatMachine.UniversalInput → Rogozhin46.Config)
    (job : NatMachine.UniversalInput) : List Bool :=
  Cook.encodeWord (Cook.PassClassification.canonicalWord (compile job))

/-- Direct halting equivalence is the only source-side fact needed downstream. -/
theorem universalAccepts_iff_ctsEmpty
    (compile : NatMachine.UniversalInput → Rogozhin46.Config)
    (compile_correct : ∀ job,
      NatMachine.UniversalAccepts job ↔
        Rogozhin46.EventuallyHalts (compile job))
    (job : NatMachine.UniversalInput) :
    NatMachine.UniversalAccepts job ↔
      ∃ horizon,
        (CTS.iterate Cook.rogozhinCookProgram horizon
          (CTS.initial Cook.rogozhinCookProgram
            (encodeBits compile job))).data = [] :=
  (compile_correct job).trans
    (Cook.PassClassification.canonical_eventuallyHalts_iff_exists_cts_empty
      (compile job))

/-- Exact source acceptance iff eventual emptiness of the fixed Cook CTS. -/
theorem universalAccepts_iff_ctsEmpty_of_simulation
    (compile : NatMachine.UniversalInput → Rogozhin46.Config)
    (decode : Rogozhin46.Config → Option (PackedSnapshot natMachineSource))
    (boundaryTime : NatMachine.UniversalInput → Nat → Nat)
    (simulation : ExactEffectiveSimulation natMachineSource
      compile decode boundaryTime)
    (job : NatMachine.UniversalInput) :
    NatMachine.UniversalAccepts job ↔
      ∃ horizon,
        (CTS.iterate Cook.rogozhinCookProgram horizon
          (CTS.initial Cook.rogozhinCookProgram
            (encodeBits compile job))).data = [] := by
  exact universalAccepts_iff_ctsEmpty compile
    (universalAcceptance_iff_rogozhinHalting_of_simulation
      compile decode boundaryTime simulation) job

/-- Direct source/Rogozhin halting equivalence plus the scheduler certificate
for marked-snapshot observation. -/
theorem universalAccepts_iff_pureSEvent
    (compile : NatMachine.UniversalInput → Rogozhin46.Config)
    (compile_correct : ∀ job,
      NatMachine.UniversalAccepts job ↔
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
    (job : NatMachine.UniversalInput) :
    NatMachine.UniversalAccepts job ↔
      PureSMarkedSnapshotControllerEvent Cook.rogozhinCookProgram dispatcher
        (SchedulerControl.initialConfiguration Cook.rogozhinCookProgram
          dispatcher (encodeBits compile job)) := by
  exact (universalAccepts_iff_ctsEmpty compile compile_correct job).trans
    (TermEvent.eventuallyObservesMarkedCheckpointRaw_iff_eventuallyEmpty
      Cook.rogozhinCookProgram dispatcher (encodeBits compile job)
      (SchedulerBound.bound Cook.rogozhinCookProgram dispatcher)
      (initialGood (encodeBits compile job))
      (exactCheckpoint (encodeBits compile job))).symm

/--
Once the exact scheduler certificate is supplied, natural universal
acceptance reduces to marked-snapshot observation on the literal microtick
trajectory of the fixed one-cursor pure-S controller.
-/
theorem universalAccepts_iff_pureSEvent_of_simulation
    (compile : NatMachine.UniversalInput → Rogozhin46.Config)
    (decode : Rogozhin46.Config → Option (PackedSnapshot natMachineSource))
    (boundaryTime : NatMachine.UniversalInput → Nat → Nat)
    (simulation : ExactEffectiveSimulation natMachineSource
      compile decode boundaryTime)
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
    (job : NatMachine.UniversalInput) :
    NatMachine.UniversalAccepts job ↔
      PureSMarkedSnapshotControllerEvent Cook.rogozhinCookProgram dispatcher
        (SchedulerControl.initialConfiguration Cook.rogozhinCookProgram
          dispatcher (encodeBits compile job)) := by
  exact universalAccepts_iff_pureSEvent compile
    (universalAcceptance_iff_rogozhinHalting_of_simulation
      compile decode boundaryTime simulation)
    initialGood exactCheckpoint job

/-- Direct source/Rogozhin reduction yields `NatMachine`-relative pure-S
marked-snapshot completeness. -/
theorem pureSControllerEvent_complete
    (compile : NatMachine.UniversalInput → Rogozhin46.Config)
    (compile_correct : ∀ job,
      NatMachine.UniversalAccepts job ↔
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
    NatMachineComplete
      (PureSMarkedSnapshotControllerEvent Cook.rogozhinCookProgram
        dispatcher) := by
  exact pureSMarkedSnapshotControllerEvent_complete_of_cts_source
    NatMachine.UniversalAccepts universalAcceptance_complete
    Cook.rogozhinCookProgram dispatcher (encodeBits compile)
    (universalAccepts_iff_ctsEmpty compile compile_correct)
    (fun _ => SchedulerBound.bound Cook.rogozhinCookProgram dispatcher)
    initialGood exactCheckpoint

/-- The fixed pure-S marked-snapshot trajectory language is complete relative
to the direct-input `NatMachine` interpreter. -/
theorem pureSControllerEvent_complete_of_simulation
    (compile : NatMachine.UniversalInput → Rogozhin46.Config)
    (decode : Rogozhin46.Config → Option (PackedSnapshot natMachineSource))
    (boundaryTime : NatMachine.UniversalInput → Nat → Nat)
    (simulation : ExactEffectiveSimulation natMachineSource
      compile decode boundaryTime)
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
    NatMachineComplete
      (PureSMarkedSnapshotControllerEvent Cook.rogozhinCookProgram
        dispatcher) := by
  exact pureSControllerEvent_complete compile
    (universalAcceptance_iff_rogozhinHalting_of_simulation
      compile decode boundaryTime simulation)
    initialGood exactCheckpoint

/-! Accurate aliases for the marked-snapshot bridge. -/

abbrev universalAccepts_iff_pureSMarkedSnapshotEvent :=
  universalAccepts_iff_pureSEvent

abbrev universalAccepts_iff_pureSMarkedSnapshotEvent_of_simulation :=
  universalAccepts_iff_pureSEvent_of_simulation

abbrev pureSMarkedSnapshotControllerEvent_complete :=
  pureSControllerEvent_complete

abbrev pureSMarkedSnapshotControllerEvent_complete_of_simulation :=
  pureSControllerEvent_complete_of_simulation

end FixedCookBridge

end PureSFormal.Computation
