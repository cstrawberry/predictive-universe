import PureSFormal.Research.RootResetResponseBitFiniteValue
import PureSFormal.Research.RootResetOrderedCarrier

/-!
# Construction-generated inputs to the finite dispatcher label queries

Normal response traces supply the carrier path, recovered phase and finite
front-bit value together. Initial empty jobs and recursively marked sweeps
supply the same facts with the canonical false bit. These are consequences
of the actual scheduler constructions, not extra runtime label inputs.
-/
namespace PureSFormal.Research.RootResetGeneratedCarrierLabels
open PureSFormal.PureS
open RootResetPersistentResponseSelector

structure Facts (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation source : Term) (phase : CTS.Phase program) (bit : Bool) : Prop where
  admissible : Carrier.Admissible continuation
  path : ∃ decoded, CarrierDecoder.PathDecodes program tree bits continuation source decoded
  phase_eq : carrierPhase? program tree source = some phase
  bit_eq : RootResetResponseBitFiniteValue.value program tree source = bit

theorem selected_response {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {seedBits : List Bool} {continuation source : Term} {admissible : Carrier.Admissible continuation}
    {registers : SchedulerControl.Registers program} {bit : Bool} {suffix : List Bool}
    {outerContext fullContext innerContext targetContext : Context} {parents : List ParentFrame} {ticks count : Nat}
    (trace : SchedulerCycle.SelectedResponseTrace program dispatcher seedBits continuation source admissible
      registers bit suffix outerContext fullContext innerContext targetContext parents ticks)
    (normal : RootResetOrderedCarrier.NormalInvariant program dispatcher.tree seedBits continuation source
      registers.phase (bit :: suffix) count) :
    Facts program dispatcher.tree seedBits continuation (SchedulerCycle.deletedCarrier bit outerContext innerContext)
      (SchedulerCycle.scannedRegisters registers bit suffix).phase bit := by
  have facts := RootResetOrderedCarrier.selectedResponseTrace_preserves trace normal
  have counts := RootResetCarrierChronologyPreservation.selectedResponseTrace_chronology_preserved trace count
    normal.locals normal.tombstones
  have phaseEq : (SchedulerCycle.scannedRegisters registers bit suffix).phase = registers.phase := by
    rw [SchedulerCycle.scannedRegisters, SchedulerCycle.scanRegisters_phase]
    unfold SchedulerControl.Registers.observeLive
    split <;> rfl
  refine ⟨admissible, ⟨suffix, CarrierDecoder.decode?_sound program dispatcher.tree seedBits continuation admissible trace.targetDecode⟩,
    ?_, RootResetResponseBitFiniteValue.normal_counts count bit counts.1 counts.2.1 facts.2.1⟩
  rw [phaseEq]
  exact facts.1

theorem first_response {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {bit : Bool} {suffix : List Bool} {fuel : Nat}
    {outerContext fullContext innerContext targetContext : Context} {ascentTicks : Nat}
    (trace : SchedulerCycle.FirstResponseTrace program dispatcher bit suffix fuel
      outerContext fullContext innerContext targetContext ascentTicks) :
    Facts program dispatcher.tree (bit :: suffix)
      (Dovetail.clockExit (fuel + 1) fuel (environmentCode (compileActions program dispatcher.tree) (bit :: suffix)))
      (SchedulerCycle.deletedCarrier bit outerContext innerContext) (CTS.zeroPhase program) bit := by
  have facts := RootResetResponseCarrierChronology.firstResponseTrace_chronology program dispatcher bit suffix fuel trace
  exact ⟨Dovetail.clockExit_admissible ..,
    ⟨suffix, CarrierDecoder.decode?_sound program dispatcher.tree (bit :: suffix) _ _ trace.targetDecode⟩,
    facts.2.2.1, RootResetResponseBitFiniteValue.normal_counts 0 bit facts.1 facts.2.1 facts.2.2.2⟩

theorem empty_sweep (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation : Term) (admissible : Carrier.Admissible continuation)
    (count : Nat) (registers : SchedulerControl.Registers program) (carrier : Term)
    (decoded : CarrierDecoder.decode? program dispatcher.tree bits continuation admissible carrier = some [])
    (phaseEq : carrierPhase? program dispatcher.tree carrier = some registers.phase)
    (bitEq : carrierResponseBit? program dispatcher.tree carrier = some false)
    (finiteBit : RootResetResponseBitFiniteValue.value program dispatcher.tree carrier = false) :
    Facts program dispatcher.tree bits continuation
      (SchedulerCycle.emptySweepCarrier program dispatcher bits continuation count registers carrier)
      (SchedulerCycle.emptySweepRegisters program count registers).phase false := by
  exact ⟨admissible,
    ⟨[], CarrierDecoder.decode?_sound program dispatcher.tree bits continuation admissible
      (SchedulerNestedEmpty.emptySweepCarrier_decode_of program dispatcher bits continuation admissible count registers carrier decoded)⟩,
    (RootResetEmptyResponseSelectorChain.emptySweepCarrier_label program dispatcher bits continuation count registers carrier phaseEq bitEq).1,
    RootResetResponseBitFiniteValue.empty_sweep program dispatcher bits continuation count registers carrier finiteBit⟩

theorem initial_empty_sweep (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (continuation : Term) (admissible : Carrier.Admissible continuation) (count : Nat) :
    Facts program dispatcher.tree [] continuation
      (SchedulerCycle.emptySweepCarrier program dispatcher [] continuation count (SchedulerNestedEmpty.initialEmptyRegisters program)
        (baseCarrier (environmentCode (compileActions program dispatcher.tree) []) continuation))
      (SchedulerCycle.emptySweepRegisters program count (SchedulerNestedEmpty.initialEmptyRegisters program)).phase false := by
  exact ⟨admissible,
    ⟨[], CarrierDecoder.decode?_sound program dispatcher.tree [] continuation admissible
      (SchedulerNestedEmpty.emptySweepCarrier_decode program dispatcher continuation admissible count _)⟩,
    (RootResetEmptyResponseSelectorChain.generatedEmptySweep_label program dispatcher continuation count).1,
    RootResetResponseBitFiniteValue.initial_empty_sweep program dispatcher continuation count⟩

/-- The first completed response which empties the queue starts the same
finite false-bit query regime as the later absorbing sweeps. -/
theorem marked_completed_empty (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (admissible : Carrier.Admissible continuation)
    (decoded : List Bool)
    (carrierDecode : CarrierDecoder.decode? program dispatcher.tree bits continuation admissible carrier = some decoded)
    (empty : ActionDecode.outputData program (registers.phase, bit) decoded = []) :
    Facts program dispatcher.tree bits continuation
      (LocalResponse.markedCompleted bits continuation carrier
        (SchedulerResponse.completedRoute program dispatcher registers bit carrier))
      (CTS.nextPhase program registers.phase) false := by
  have outputDecode : CarrierDecoder.decode? program dispatcher.tree bits continuation admissible
      (LocalResponse.markedCompleted bits continuation carrier
        (SchedulerResponse.completedRoute program dispatcher registers bit carrier)) = some [] := by
    rw [CarrierDecoder.decode?_local program dispatcher.tree bits continuation admissible
      (SchedulerResponse.completedRoute_snapshotDispatch program dispatcher registers bit carrier).toDispatchesTo
      (LocalResponse.markedCompleted_localShell bits continuation carrier
        (SchedulerResponse.completedRoute program dispatcher registers bit carrier))]
    have output := CarrierActionDecode.decode_actionAccumulator program dispatcher.tree bits continuation admissible
      (registers.phase, bit) carrierDecode
    rw [empty] at output
    exact output
  exact ⟨admissible,
    ⟨[], CarrierDecoder.decode?_sound program dispatcher.tree bits continuation admissible outputDecode⟩,
    RootResetEmptyResponseSelectorChain.markedCompleted_phase program dispatcher registers bit bits continuation carrier,
    RootResetResponseBitFiniteValue.marked_completed program dispatcher registers bit bits continuation carrier⟩

end PureSFormal.Research.RootResetGeneratedCarrierLabels
