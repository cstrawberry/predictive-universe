import PureSFormal.Research.RootResetFirstNormalResponseChain
import PureSFormal.Research.RootResetTraversableCompletedParents

/-!
# Generated fresh continuation provenance

The actual carrier decoder and nonempty CTS output construct the completed
continuation certificate used by the bare-term traversal.
-/

namespace PureSFormal.Research.RootResetGeneratedTraversableParents

open PureSFormal.PureS

open RootResetTraversableCompletedParents

namespace TraversableParents

/-- Construction provenance supplies the fresh traversal premise directly:
the action decoder agrees with the public decoder and the output is nonempty. -/
theorem fresh_of_carrierDecode
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {parents : List ParentFrame} {layers : Nat}
    (outer : TraversableParents program dispatcher parents layers)
    (registers : SchedulerControl.Registers program) (bit : Bool)
    (bits : List Bool) (continuation carrier : Term)
    (admissible : Carrier.Admissible continuation) {decoded : List Bool}
    (carrierDecode : CarrierDecoder.decode? program dispatcher.tree bits
      continuation admissible carrier = some decoded)
    (nonempty : ActionDecode.outputData program (registers.phase, bit) decoded ≠ []) :
    TraversableParents program dispatcher
      (SchedulerRootContinuation.freshContinuationParents program dispatcher
        registers bit bits carrier parents) (layers + 1) := by
  have actionDecode := CarrierActionDecode.decode_actionAccumulator program
    dispatcher.tree bits continuation admissible (registers.phase, bit) carrierDecode
  have publicDecode := CheckpointRun.decodeCarrier?_of_decode program
    dispatcher.tree bits continuation admissible actionDecode
  apply TraversableParents.fresh outer registers bit bits carrier
  cases outputEq : ActionDecode.outputData program (registers.phase, bit) decoded with
  | nil => exact False.elim (nonempty outputEq)
  | cons first rest =>
      exact ⟨first, rest, outputEq ▸ publicDecode⟩

/-- The first actual normal response may be carried into a later clock stage
using nonempty output alone, with no clean-progress-spine hypothesis. -/
theorem firstResponseTrace_fresh
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (fuel : Nat)
    {outerContext fullContext innerContext targetContext : Context}
    {ascentTicks : Nat}
    (trace : SchedulerCycle.FirstResponseTrace program dispatcher bit suffix
      fuel outerContext fullContext innerContext targetContext ascentTicks)
    (nonempty : (CTS.absorbingStep program
      ⟨CTS.zeroPhase program, bit :: suffix⟩).data ≠ []) :
    TraversableParents program dispatcher
      (SchedulerRootContinuation.freshContinuationParents program dispatcher
        (SchedulerCycle.responseRegisters program bit suffix) bit (bit :: suffix)
        (SchedulerCycle.deletedCarrier bit outerContext innerContext) []) 1 := by
  apply fresh_of_carrierDecode .root
    (SchedulerCycle.responseRegisters program bit suffix) bit (bit :: suffix)
    (Dovetail.clockExit (fuel + 1) fuel
      (environmentCode (compileActions program dispatcher.tree) (bit :: suffix)))
    (SchedulerCycle.deletedCarrier bit outerContext innerContext)
    (Dovetail.clockExit_admissible (fuel + 1) fuel
      (environmentCode (compileActions program dispatcher.tree) (bit :: suffix)))
    trace.targetDecode
  rw [ActionDecode.outputData_eq_ordinaryStep_data,
    SchedulerCycle.responseRegisters_phase]
  exact nonempty


end TraversableParents
end PureSFormal.Research.RootResetGeneratedTraversableParents
