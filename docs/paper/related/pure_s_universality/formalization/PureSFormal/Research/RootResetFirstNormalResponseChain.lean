import PureSFormal.Research.RootResetNormalResponseContextChain

/-!
# Complete generated first normal response

The construction-generated carrier discharges the response label and arity
premises.  The selector therefore agrees with every contraction from the
first C4 sample through the completed first normal response at any positive
stage horizon, including arbitrary nonempty appendants.
-/

namespace PureSFormal.Research.RootResetFirstNormalResponseChain

open PureSFormal.PureS
open SchedulerResponseInvariant
open RootResetPersistentResponseSelector
open RootResetResponseCarrierChronology
open RootResetReachableStageGrammar
open RootResetClockFuelStages
open RootResetWrappedFrameSelectorProof
open RootResetMarkedFrameSelectorProof
open RootResetNormalResponseContextChain

/-- The actual first response carrier has the admissible Base arity, so
neither action nor dispatcher parsing requires an external arity premise. -/
theorem firstResponseTrace_carrier_arities
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (fuel : Nat)
    {outerContext fullContext innerContext targetContext : Context}
    {ascentTicks : Nat}
    (trace : SchedulerCycle.FirstResponseTrace program dispatcher bit suffix
      fuel outerContext fullContext innerContext targetContext ascentTicks) :
    (SchedulerCycle.deletedCarrier bit outerContext innerContext).headArity ≠ 2 ∧
      (SchedulerCycle.deletedCarrier bit outerContext innerContext).headArity ≠ 3 := by
  rw [firstResponseTrace_carrier program dispatcher bit suffix fuel trace]
  have admissible := Dovetail.clockExit_admissible (fuel + 1) fuel
    (environmentCode (compileActions program dispatcher.tree) (bit :: suffix))
  change
    (Dovetail.clockExit (fuel + 1) fuel
        (environmentCode (compileActions program dispatcher.tree) (bit :: suffix))).headArity + 2 ≠ 2 ∧
    (Dovetail.clockExit (fuel + 1) fuel
        (environmentCode (compileActions program dispatcher.tree) (bit :: suffix))).headArity + 2 ≠ 3
  rcases admissible with first | second
  · rw [first]
    decide
  · rw [second]
    decide

/-- Every contraction after the first C4 through the first completed normal
response is selected on the actual scheduler trace.  All carrier and label
premises are supplied by the generated trace. -/
theorem firstC4_to_return_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (fuel : Nat)
    {outerContext fullContext innerContext targetContext : Context}
    {ascentTicks : Nat}
    (trace : SchedulerCycle.FirstResponseTrace program dispatcher bit suffix
      fuel outerContext fullContext innerContext targetContext ascentTicks) :
    ∃ first rest,
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerCycle.firstReturnConfiguration program dispatcher bit suffix fuel outerContext innerContext)
        (SchedulerCycle.firstC4Configuration program dispatcher bit suffix fuel outerContext innerContext)
        (first :: rest) ∧
      RootResetExactTraceAgreement.SelectorChain (selectStep? program dispatcher)
        (SchedulerCycle.firstC4Configuration program dispatcher bit suffix fuel outerContext innerContext)
        (first :: rest) := by
  let actions := compileActions program dispatcher.tree
  let bits := bit :: suffix
  let continuation := Dovetail.clockExit (fuel + 1) fuel (environmentCode actions bits)
  let carrier := SchedulerCycle.deletedCarrier bit outerContext innerContext
  let registers := SchedulerCycle.responseRegisters program bit suffix
  let parents := PrimitiveFuel.pendingParents (environmentCode actions bits) continuation fuel []
  have arities := firstResponseTrace_carrier_arities program dispatcher bit suffix fuel trace
  have chronology := firstResponseTrace_chronology program dispatcher bit suffix fuel trace
  have phaseEq : carrierPhase? program dispatcher.tree carrier = some registers.phase := by
    rw [SchedulerCycle.responseRegisters_phase]
    exact chronology.2.2.1
  have stopped := pending_parseMarked_none program dispatcher bits continuation _
    (RootResetFrameFirstSelectorProof.first_marked_none program dispatcher bits continuation carrier) fuel
  have shape : MarkedPrefix program dispatcher.tree
      (Cursor.rebuild [] (pending actions bits continuation fuel
        (frameFirstRoot actions bits continuation carrier)))
      (pending actions bits continuation fuel (frameFirstRoot actions bits continuation carrier))
      (SchedulerInvariant.contextOfParents []) [] :=
    .here stopped
  obtain ⟨first, rest, responseChain, responseSelected, firstErase⟩ :=
    normalResponse_body_marked_selectorChain program dispatcher registers bit bits bits
      continuation continuation carrier arities.1 arities.2 phaseEq chronology.2.2.2 fuel [] shape
  obtain ⟨ticks, c4ToFrame⟩ := SchedulerCycle.firstC4_toFrame_zeroRun
    program dispatcher bit suffix fuel trace
  have enter := SchedulerResponse.enterResponse_zeroRun program dispatcher registers bit
    bits continuation carrier parents (SchedulerCycle.responseRegisters_spec program bit suffix).1
  have zeroPrefix := c4ToFrame.trans enter
  have allChain := ExactMutationChain.prepend zeroPrefix responseChain
  have firstChoice := RootResetFirstResponseSelectorChain.firstC4_selectStep_eq_firstFrameRoot
    program dispatcher bit suffix fuel trace
  refine ⟨first, rest, allChain, .next ?_ responseSelected⟩
  rw [firstErase]
  simpa only [pending_rebuild_under_parents] using firstChoice

end PureSFormal.Research.RootResetFirstNormalResponseChain
