import PureSFormal.Research.RootResetPersistentRouteAFuelSchedulerBridge
import PureSFormal.Research.RootResetPersistentResponseSelector
import PureSFormal.Research.RootResetExactTraceAgreement

/-!
# Generated first-response selector chain

This module connects the construction-generated fifth fuel sample to the
response-aware bare selector.  Unlike the generic selected-response bridge,
the source here carries the exact positive-stage provenance: its ordinary
fuel view is the generated Base carrier beneath the canonical pending stack.
Consequently the fuel-priority theorem determines the executable selector
without any assumptions about the other response parser branches.
-/

namespace PureSFormal.Research.RootResetFirstResponseSelectorChain

open PureSFormal.PureS
open RootResetClockFuelStages
open RootResetClockFuelCanonicalGrammar
open RootResetPersistentFuelCarrier
open RootResetPersistentRouteAFuelSchedulerBridge

/-- On the construction-generated positive stage, restarting the complete
bare selector at the fifth fuel sample returns exactly the persistent
scheduler's C4 sample.  No parser-disjointness or `BaseWinsAt` premise is
needed: the literal generated fuel carrier has priority by construction. -/
theorem positiveStageFifth_selectStep_eq_firstC4
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool)
    (clockRegisters : SchedulerControl.Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (clockCoherent : SchedulerInvariant.RegistersCoherent clockRegisters
      phase scanned emptyMode)
    (sampleIndex fuel : Nat)
    {outerContext fullContext innerContext targetContext : Context}
    {descentTicks ascentTicks : Nat}
    (trace : SchedulerCycle.PositiveStageFirstResponseTrace program dispatcher
      bit suffix clockRegisters phase scanned emptyMode clockCoherent sampleIndex
      fuel outerContext fullContext innerContext targetContext descentTicks
      ascentTicks) :
    let actions := compileActions program dispatcher.tree
    let bits := bit :: suffix
    let environment := environmentCode actions bits
    let continuation := Dovetail.clockExit (fuel + 1) fuel environment
    let parents :=
      PrimitiveFuel.pendingParents environment continuation (fuel + 1) []
    let fifth := SchedulerInvariant.fuelZeroFifthMutationConfiguration
      program dispatcher (SchedulerControl.Registers.newJob program)
      environment continuation parents
    let firstC4 := SchedulerCycle.firstC4Configuration program dispatcher bit
      suffix fuel outerContext innerContext
    RootResetPersistentResponseSelector.selectStep? program dispatcher
      fifth.cursor.erase = some firstC4.cursor.erase := by
  dsimp only
  let actions := compileActions program dispatcher.tree
  let bits := bit :: suffix
  let environment := environmentCode actions bits
  let continuation := Dovetail.clockExit (fuel + 1) fuel environment
  let parents :=
    PrimitiveFuel.pendingParents environment continuation (fuel + 1) []
  let fifth := SchedulerInvariant.fuelZeroFifthMutationConfiguration
    program dispatcher (SchedulerControl.Registers.newJob program)
    environment continuation parents
  let firstC4 := SchedulerCycle.firstC4Configuration program dispatcher bit
    suffix fuel outerContext innerContext
  obtain ⟨_bound, view, _found, parsed, contracted⟩ :=
    positiveStageFifth_selects_exact_firstC4 program dispatcher bit suffix
      clockRegisters phase scanned emptyMode clockCoherent sampleIndex fuel trace
  have fuelOuterEq :
      RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher
          fifth.cursor.erase =
        ⟨fifth.cursor.erase, .hole, [], [], []⟩ := by
    rw [RootResetPersistentRouteAFuel.fuelActiveContext]
    rw [parsed]
  have parsedAtFuelOuter : RootResetPersistentFuelCarrier.parse? actions
      (RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher
        fifth.cursor.erase).active = some view := by
    rw [fuelOuterEq]
    exact parsed
  have basePriority :=
    RootResetPersistentRouteAFuel.classifyHandoff_fuel_priority
      (program := program) (layout := dispatcher) parsedAtFuelOuter
  let selection := RootResetPersistentRouteAFuel.fuelSelection dispatcher.tree
    (RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher
      fifth.cursor.erase) view
  have selectionTarget : selection.target = view.target actions := by
    simp [selection, RootResetPersistentRouteAFuel.fuelSelection, fuelOuterEq,
      actions]
  have viewContract := view.selected_contracts parsed
  have viewTarget : view.target actions = firstC4.cursor.erase := by
    exact Option.some.inj (viewContract.symm.trans contracted)
  exact RootResetPersistentResponseSelector.selectStep?_eq_some_of_baseFuel
    basePriority.1 basePriority.2 (selectionTarget.trans viewTarget)

/-- The exact generated first C4 edge is a singleton selector certificate,
ready for composition with the scheduler's existing exact mutation chain. -/
theorem positiveStageFifth_firstC4_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool)
    (clockRegisters : SchedulerControl.Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (clockCoherent : SchedulerInvariant.RegistersCoherent clockRegisters
      phase scanned emptyMode)
    (sampleIndex fuel : Nat)
    {outerContext fullContext innerContext targetContext : Context}
    {descentTicks ascentTicks : Nat}
    (trace : SchedulerCycle.PositiveStageFirstResponseTrace program dispatcher
      bit suffix clockRegisters phase scanned emptyMode clockCoherent sampleIndex
      fuel outerContext fullContext innerContext targetContext descentTicks
      ascentTicks) :
    let actions := compileActions program dispatcher.tree
    let bits := bit :: suffix
    let environment := environmentCode actions bits
    let continuation := Dovetail.clockExit (fuel + 1) fuel environment
    let parents :=
      PrimitiveFuel.pendingParents environment continuation (fuel + 1) []
    let fifth := SchedulerInvariant.fuelZeroFifthMutationConfiguration
      program dispatcher (SchedulerControl.Registers.newJob program)
      environment continuation parents
    let firstC4 := SchedulerCycle.firstC4Configuration program dispatcher bit
      suffix fuel outerContext innerContext
    RootResetExactTraceAgreement.SelectorChain
      (RootResetPersistentResponseSelector.selectStep? program dispatcher)
      fifth [firstC4] := by
  dsimp only
  exact .next
    (positiveStageFifth_selectStep_eq_firstC4 program dispatcher bit suffix
      clockRegisters phase scanned emptyMode clockCoherent sampleIndex fuel
      trace)
    (.done _)

/-- After the generated C4 contraction, the complete response-aware selector
performs the first FRAME contraction at its syntax-recovered pending depth. -/
theorem firstC4_selectStep_eq_firstFrameRoot
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (fuel : Nat)
    {outerContext fullContext innerContext targetContext : Context}
    {ascentTicks : Nat}
    (trace : SchedulerCycle.FirstResponseTrace program dispatcher bit suffix
      fuel outerContext fullContext innerContext targetContext ascentTicks) :
    let actions := compileActions program dispatcher.tree
    let bits := bit :: suffix
    let environment := environmentCode actions bits
    let continuation := Dovetail.clockExit (fuel + 1) fuel environment
    let firstC4 := SchedulerCycle.firstC4Configuration program dispatcher bit
      suffix fuel outerContext innerContext
    RootResetPersistentResponseSelector.selectStep? program dispatcher
        firstC4.cursor.erase =
      some
        (Cursor.rebuild
          (PrimitiveFuel.pendingParents environment continuation fuel [])
          (SchedulerResponseInvariant.frameFirstRoot actions bits continuation
            (SchedulerCycle.deletedCarrier bit outerContext innerContext))) := by
  dsimp only
  let actions := compileActions program dispatcher.tree
  let bits := bit :: suffix
  let environment := environmentCode actions bits
  let continuation := Dovetail.clockExit (fuel + 1) fuel environment
  let firstC4 := SchedulerCycle.firstC4Configuration program dispatcher bit
    suffix fuel outerContext innerContext
  obtain ⟨_seed, view, _seedParsed, parsed, _stageEq, _addressEq,
      _persistentAddress, _erasedEq, contracted⟩ :=
    firstC4Configuration_parse_postC4_selects_firstFrameRoot program dispatcher
      bit suffix fuel trace
  have outerEq : RootResetPersistentRouteAFuel.fuelActiveContext program
      dispatcher firstC4.cursor.erase =
        ⟨firstC4.cursor.erase, .hole, [], [], []⟩ := by
    rw [RootResetPersistentRouteAFuel.fuelActiveContext, parsed]
  have parsedAtOuter : RootResetPersistentFuelCarrier.parse? actions
      (RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher
        firstC4.cursor.erase).active = some view := by
    rw [outerEq]
    exact parsed
  have priority := RootResetPersistentRouteAFuel.classifyHandoff_fuel_priority
    (program := program) (layout := dispatcher) parsedAtOuter
  have targetEq := Option.some.inj
    ((view.selected_contracts parsed).symm.trans contracted)
  apply RootResetPersistentResponseSelector.selectStep?_eq_some_of_baseFuel
    priority.1 priority.2
  simpa [RootResetPersistentRouteAFuel.fuelSelection, outerEq, actions, bits,
    environment, continuation] using targetEq

end PureSFormal.Research.RootResetFirstResponseSelectorChain
