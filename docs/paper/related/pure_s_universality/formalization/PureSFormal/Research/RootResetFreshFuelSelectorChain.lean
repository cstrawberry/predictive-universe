import PureSFormal.Research.RootResetFreshClockSelectorChain
import PureSFormal.Research.RootResetMarkedFuelSelectorChain

/-!
# Fuel expansion inside a fresh completed history

The fresh continuation parser preserves the exact context through all
canonical fuel rows and arbitrary pending depths. Historical response
priorities are excluded from the literal role list and completed accumulator.
Together with the fresh clock chain, this proves every contraction after the
actual first nonempty normal response through stage two's generated Base.
-/

namespace PureSFormal.Research.RootResetFreshFuelSelectorChain

open PureSFormal.PureS
open SchedulerInvariant
open RootResetClockFuelStages
open RootResetClockFuelCanonicalGrammar
open RootResetPersistentClockFuelAgreement
open RootResetPersistentResponseSelector
open RootResetResponseClockFuelAgreement
open RootResetReachableStageGrammar
open RootResetWrappedFrameSelectorProof
open RootResetMarkedFrameSelectorProof
open RootResetFreshClockSelectorChain
open RootResetMarkedFuelSelectorChain

def prependFresh (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool)
    (bits : List Bool) (carrier endpoint : Term)
    (inner : RootResetPersistentRouteA.ActiveContext program) : RootResetPersistentRouteA.ActiveContext program :=
  RootResetPersistentRouteA.wrapOuter
    (RootResetPersistentRouteA.freshStep (freshTerm program dispatcher registers bit bits carrier endpoint)
      (freshView program dispatcher registers bit bits carrier endpoint)) inner

theorem freshTerm_contexts_general
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool)
    (bits : List Bool) (carrier endpoint : Term)
    (nonempty : ∃ first rest, CheckpointDecoder.decodeCarrier? program dispatcher.tree
      (actionAccumulator program (registers.phase, bit) carrier) = some (first :: rest)) :
    RootResetPersistentRouteA.activeContext program dispatcher
        (freshTerm program dispatcher registers bit bits carrier endpoint) =
      prependFresh program dispatcher registers bit bits carrier endpoint
        (RootResetPersistentRouteA.activeContext program dispatcher endpoint) ∧
    RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher
        (freshTerm program dispatcher registers bit bits carrier endpoint) =
      prependFresh program dispatcher registers bit bits carrier endpoint
        (RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher endpoint) ∧
    responseOuter program dispatcher
        (freshTerm program dispatcher registers bit bits carrier endpoint) =
      prependFresh program dispatcher registers bit bits carrier endpoint
        (responseOuter program dispatcher endpoint) := by
  have next := freshTerm_next program dispatcher registers bit bits carrier endpoint nonempty
  have fuelNone := RootResetEmptyResponseSelectorChain.fuelParse_none_of_localShape
    (CheckpointDecoder.parseLocal?_sound (freshTerm_parsed program dispatcher registers bit bits carrier endpoint))
  have fuelEq : RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher
      (freshTerm program dispatcher registers bit bits carrier endpoint) =
      prependFresh program dispatcher registers bit bits carrier endpoint
        (RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher endpoint) := by
    rw [RootResetPersistentRouteAFuel.fuelActiveContext, fuelNone, next]
    rfl
  constructor
  · rw [RootResetPersistentRouteA.activeContext, next]
    rfl
  constructor
  · exact fuelEq
  · rw [responseOuter, fuelEq]
    simp only [responseOuter, prependFresh, RootResetPersistentRouteA.wrapOuter,
      RootResetPersistentRouteA.freshStep, composeActiveContexts,
      RootResetRuntimeContextBridge.context_comp_assoc, List.append_assoc,
      List.cons_append]

theorem pendingBeforeFresh?_replicate_pending_none (count : Nat) :
    pendingBeforeFresh? (List.replicate count .pendingFrameChild) = none := by
  induction count with
  | zero => rfl
  | succ count ih =>
      rw [List.replicate_succ, pendingBeforeFresh?, ih]
      rfl

theorem selectStep?_fresh_pendingFuelRow
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool)
    (bits : List Bool) (carrier : Term)
    (nonempty : ∃ first rest, CheckpointDecoder.decodeCarrier? program dispatcher.tree
      (actionAccumulator program (registers.phase, bit) carrier) = some (first :: rest))
    (classifierNone : RootResetAccumulatorClassifier.classify?
      (actionAccumulator program (registers.phase, bit) carrier) = none)
    {layers : List PendingLayer}
    (route : RoutePendingLayers (compileActions program dispatcher.tree) layers)
    (row : FuelRow) (canonical : CanonicalFuelRow (compileActions program dispatcher.tree) row) :
    selectStep? program dispatcher
      (freshTerm program dispatcher registers bit bits carrier
        (pendingFuelRowTerm (compileActions program dispatcher.tree) layers row)) =
      some (freshTerm program dispatcher registers bit bits carrier ((pendingContext layers).plug row.target)) := by
  let endpoint := pendingFuelRowTerm (compileActions program dispatcher.tree) layers row
  let source := freshTerm program dispatcher registers bit bits carrier endpoint
  let outer := prependFresh program dispatcher registers bit bits carrier endpoint
    (pendingFuelRowActiveContext program layers row)
  have contexts := freshTerm_contexts_general program dispatcher registers bit bits carrier endpoint nonempty
  have activeEq : RootResetPersistentRouteA.activeContext program dispatcher source = outer := by
    rw [contexts.1, activeContext_pendingFuelRow program dispatcher route row canonical]
  have fuelEq : RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher source = outer := by
    rw [contexts.2.1, fuelActiveContext_pendingFuelRow program dispatcher route row canonical]
  have outerEq : responseOuter program dispatcher source = outer := by
    rw [contexts.2.2, responseOuter_pendingFuelRow program dispatcher route row canonical]
  have fuelNone : RootResetPersistentFuelCarrier.parse? (compileActions program dispatcher.tree) row.term = none :=
    parseFuelHandoff?_canonicalPendingFuelRow_none program dispatcher [] row trivial canonical
  have freshRoot : freshResponseRoot? program dispatcher source = some ([], source) := by
    rw [freshResponseRoot?, activeEq]
    dsimp only [outer, prependFresh, RootResetPersistentRouteA.wrapOuter,
      RootResetPersistentRouteA.freshStep, pendingFuelRowActiveContext]
    rw [addressBeforeFresh?, addressBeforeFresh?_replicate_pendingFrameChild]
    rfl
  have noBaseFinal : ∀ view : RootResetWholeAppenderStages.View program,
      (RootResetPersistentRouteAFuel.classifyHandoff program dispatcher source).route.endpoint =
        some (.registered (.appender view)) → view.stage ≠ .secondFinal := by
    intro view parsed
    rw [RootResetPersistentRouteAFuel.classifyHandoff, fuelEq] at parsed
    dsimp only [outer, prependFresh, RootResetPersistentRouteA.wrapOuter,
      RootResetPersistentRouteA.freshStep, pendingFuelRowActiveContext] at parsed
    rw [fuelNone] at parsed
    dsimp only at parsed
    rw [RootResetPersistentRouteA.classify, activeEq] at parsed
    dsimp only [outer, prependFresh, RootResetPersistentRouteA.wrapOuter,
      RootResetPersistentRouteA.freshStep, pendingFuelRowActiveContext] at parsed
    rw [parseTwentySeven?_canonicalFuelRow program dispatcher row canonical] at parsed
    cases parsed
  have appenderNone := RootResetCompletedAppenderPriority.responseAppenderSelection_none_of_completed_noPending
    program dispatcher source source [] freshRoot rfl
    (freshView program dispatcher registers bit bits carrier endpoint)
    (freshTerm_parsed program dispatcher registers bit bits carrier endpoint)
    (by
      rw [activeEq]
      dsimp only [outer, prependFresh, RootResetPersistentRouteA.wrapOuter,
        RootResetPersistentRouteA.freshStep, pendingFuelRowActiveContext]
      rw [pendingBeforeFresh?, pendingBeforeFresh?_replicate_pending_none]) noBaseFinal
  have carrierNone : responseCarrierSelection? program dispatcher source = none := by
    rw [responseCarrierSelection?, responseCarrierAddress?, freshRoot]
    dsimp only [Option.bind]
    rw [activeEq]
    dsimp only [outer, prependFresh, RootResetPersistentRouteA.wrapOuter,
      RootResetPersistentRouteA.freshStep, pendingFuelRowActiveContext]
    rw [pendingBeforeFresh?, pendingBeforeFresh?_replicate_pending_none]
  have localNone := parseLocal?_canonicalFuelRow_none program dispatcher row canonical
  have boundaryNone : responseBoundarySelection? program dispatcher source = none := by
    rw [responseBoundarySelection?, responseBoundaryAddress?,
      completedResponseAddress?_none_of_outer_parseLocal_none outerEq localNone, freshRoot]
    dsimp only [Option.bind]
    rw [RootResetResponseBoundaryStages.parseActive?, freshTerm_parsed]
    dsimp only [freshView, CheckpointDecoder.completedView]
    rw [if_pos rfl, classifierNone]
  have noPending : addressBeforePendingMarked? outer.roles = none := by
    dsimp only [outer, prependFresh, RootResetPersistentRouteA.wrapOuter,
      RootResetPersistentRouteA.freshStep, pendingFuelRowActiveContext]
    rw [addressBeforePendingMarked?, addressBeforePendingMarked?_replicate_pendingFrameChild]
    rfl
  have notSix : row.term.headArity ≠ 6 := by
    intro equal
    have bound := row.term_headArity_le_four
    rw [equal] at bound
    exact (by decide : ¬ 6 ≤ 4) bound
  have clear := RootResetFreshClockSelectorChain.prioritiesClear_of_recoveredOuter program dispatcher source outer
    outerEq activeEq localNone notSix (fuelRow_headArity_ne_two row)
    appenderNone carrierNone boundaryNone noPending
  rw [selectStep?_eq_persistent_of_prioritiesClear clear]
  have shape := RootResetPersistentRouteA.activeContext_sound program dispatcher source
  rw [activeEq] at shape
  have selected := canonicalFuelRow_selects program dispatcher row canonical
  have lifted := RootResetWholeStageClassifier.contractAt?_plug_append outer.context row.localAddress selected.2
  have sourceEq : outer.context.plug row.term = source := shape.source_eq
  have addressEq : RootResetSelectorContract.contextAddress outer.context = outer.address := shape.contextAddress_eq
  rw [sourceEq, addressEq] at lifted
  unfold RootResetPersistentSelector.selectStep? RootResetPersistentSelector.selection?
    RootResetPersistentRouteAFuel.classifyHandoff
  rw [fuelEq]
  dsimp only [outer, prependFresh, RootResetPersistentRouteA.wrapOuter,
    RootResetPersistentRouteA.freshStep, pendingFuelRowActiveContext]
  rw [fuelNone]
  dsimp only
  rw [routeAddress_of_recoveredOuter program dispatcher source outer activeEq
    (next?_canonicalFuelRow_none program dispatcher row canonical) row.localAddress selected.1]
  unfold RootResetPersistentRouteAFuel.checkedSelection?
  dsimp only
  rw [lifted]
  rfl


theorem generatedFuelRow_fresh_selectStep?
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (continuation : Term) (admissible : Carrier.Admissible continuation)
    (outerParents : List ParentFrame) (shape : FreshClockParents program layout outerParents)
    (depth : Nat) (row : FuelRow)
    (canonical : CanonicalFuelRow (compileActions program layout.tree) row) :
    selectStep? program layout
      (Cursor.mk row.term (PrimitiveFuel.pendingParents
        (environmentCode (compileActions program layout.tree) bits) continuation depth outerParents)).erase =
      some (Cursor.rebuild (PrimitiveFuel.pendingParents
        (environmentCode (compileActions program layout.tree) bits) continuation depth outerParents) row.target) := by
  let actions := compileActions program layout.tree
  let layers := generatedPendingLayers actions bits continuation depth
  have route := generatedPendingLayers_route actions bits continuation admissible depth
  have sourceEq : Cursor.rebuild
      (PrimitiveFuel.pendingParents (environmentCode actions bits) continuation depth outerParents) row.term =
      Cursor.rebuild outerParents (pendingFuelRowTerm actions layers row) := by
    rw [PrimitiveFuel.rebuild_pendingParents]
    rw [← fuelRowCursor_erase actions bits continuation depth row]
    rw [Cursor.erase, PrimitiveFuel.rebuild_pendingParents]
    rfl
  have targetEq : Cursor.rebuild
      (PrimitiveFuel.pendingParents (environmentCode actions bits) continuation depth outerParents) row.target =
      Cursor.rebuild outerParents ((pendingContext layers).plug row.target) := by
    rw [PrimitiveFuel.rebuild_pendingParents]
    rw [← rebuild_pendingParents_eq_generatedPendingContext actions bits continuation depth row.target]
    rw [PrimitiveFuel.rebuild_pendingParents]
    rfl
  change selectStep? program layout (Cursor.rebuild _ row.term) = some (Cursor.rebuild _ row.target)
  rw [sourceEq, targetEq]
  cases shape with
  | fresh registers bit previousBits carrier nonempty classifierNone =>
      exact selectStep?_fresh_pendingFuelRow program layout registers bit previousBits carrier
        nonempty classifierNone route row canonical


theorem fuelPositiveScriptSource_fresh_selects_first
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (fuel depth : Nat) (continuation : Term)
    (admissible : Carrier.Admissible continuation)
    (outerParents : List ParentFrame)
    (shape : FreshClockParents program layout outerParents) :
    RootResetPersistentResponseSelector.selectStep? program layout
        (fuelPositiveScriptSourceConfiguration program layout registers fuel
          (environmentCode (compileActions program layout.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program layout.tree) bits)
            continuation depth outerParents)).cursor.erase =
      some
        (fuelPositiveFirstMutationConfiguration program layout registers fuel
          (environmentCode (compileActions program layout.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program layout.tree) bits)
            continuation depth outerParents)).cursor.erase := by
  let actions := compileActions program layout.tree
  have selected := generatedFuelRow_fresh_selectStep? program layout bits
    continuation admissible outerParents shape depth
    (.call (fuel + 1) (environmentCode actions bits) continuation)
    (generatedCallRow_canonical actions bits continuation admissible (fuel + 1))
  simpa [fuelPositiveScriptSourceConfiguration,
    fuelPositiveFirstMutationConfiguration, Cursor.erase, FuelRow.term,
    FuelRow.target, FuelRow.localAddress, FuelRow.replacement, Term.replace?,
    C, b, actions] using! selected

theorem fuelPositiveFirst_fresh_selects_second
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (fuel depth : Nat) (continuation : Term)
    (admissible : Carrier.Admissible continuation)
    (outerParents : List ParentFrame)
    (shape : FreshClockParents program layout outerParents) :
    RootResetPersistentResponseSelector.selectStep? program layout
        (fuelPositiveFirstMutationConfiguration program layout registers fuel
          (environmentCode (compileActions program layout.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program layout.tree) bits)
            continuation depth outerParents)).cursor.erase =
      some
        (fuelPositiveSecondMutationConfiguration program layout registers fuel
          (environmentCode (compileActions program layout.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program layout.tree) bits)
            continuation depth outerParents)).cursor.erase := by
  let actions := compileActions program layout.tree
  have selected := generatedFuelRow_fresh_selectStep? program layout bits
    continuation admissible outerParents shape depth
    (.positiveHalf fuel (environmentCode actions bits)
      (environmentCode actions bits) continuation)
    (generatedPositiveHalfRow_canonical actions bits continuation admissible fuel)
  simpa [fuelPositiveFirstMutationConfiguration,
    fuelPositiveSecondMutationConfiguration, Cursor.erase, FuelRow.term,
    FuelRow.target, FuelRow.localAddress, FuelRow.replacement, Term.replace?,
    frame, actions] using! selected

theorem fuelZeroScriptSource_fresh_selects_first
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (depth : Nat) (continuation : Term)
    (admissible : Carrier.Admissible continuation)
    (outerParents : List ParentFrame)
    (shape : FreshClockParents program layout outerParents) :
    RootResetPersistentResponseSelector.selectStep? program layout
        (fuelZeroScriptSourceConfiguration program layout registers
          (environmentCode (compileActions program layout.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program layout.tree) bits)
            continuation depth outerParents)).cursor.erase =
      some
        (fuelZeroFirstMutationConfiguration program layout registers
          (environmentCode (compileActions program layout.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program layout.tree) bits)
            continuation depth outerParents)).cursor.erase := by
  let actions := compileActions program layout.tree
  have selected := generatedFuelRow_fresh_selectStep? program layout bits
    continuation admissible outerParents shape depth
    ((ZeroPosition.call).row actions (word bits) continuation)
    (generatedZeroRow_canonical actions bits continuation admissible .call)
  simpa [fuelZeroScriptSourceConfiguration,
    fuelZeroFirstMutationConfiguration, Cursor.erase, ZeroPosition.row,
    zeroEnvironment, CheckpointDecoder.openEnvironment_word, FuelRow.term,
    FuelRow.target, FuelRow.localAddress, FuelRow.replacement, Term.replace?,
    C, b, actions] using! selected

theorem fuelZeroFirst_fresh_selects_second
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (depth : Nat) (continuation : Term)
    (admissible : Carrier.Admissible continuation)
    (outerParents : List ParentFrame)
    (shape : FreshClockParents program layout outerParents) :
    RootResetPersistentResponseSelector.selectStep? program layout
        (fuelZeroFirstMutationConfiguration program layout registers
          (environmentCode (compileActions program layout.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program layout.tree) bits)
            continuation depth outerParents)).cursor.erase =
      some
        (fuelZeroSecondMutationConfiguration program layout registers
          (environmentCode (compileActions program layout.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program layout.tree) bits)
            continuation depth outerParents)).cursor.erase := by
  let actions := compileActions program layout.tree
  have selected := generatedFuelRow_fresh_selectStep? program layout bits
    continuation admissible outerParents shape depth
    ((ZeroPosition.first).row actions (word bits) continuation)
    (generatedZeroRow_canonical actions bits continuation admissible .first)
  simpa [fuelZeroFirstMutationConfiguration,
    fuelZeroSecondMutationConfiguration, Cursor.erase, ZeroPosition.row,
    zeroEnvironment, CheckpointDecoder.openEnvironment_word, FuelRow.term,
    FuelRow.target, FuelRow.localAddress, FuelRow.replacement, Term.replace?,
    C, b, actions] using! selected

theorem fuelZeroSecond_fresh_selects_third
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (depth : Nat) (continuation : Term)
    (admissible : Carrier.Admissible continuation)
    (outerParents : List ParentFrame)
    (shape : FreshClockParents program layout outerParents) :
    RootResetPersistentResponseSelector.selectStep? program layout
        (fuelZeroSecondMutationConfiguration program layout registers
          (environmentCode (compileActions program layout.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program layout.tree) bits)
            continuation depth outerParents)).cursor.erase =
      some
        (fuelZeroThirdMutationConfiguration program layout registers
          (environmentCode (compileActions program layout.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program layout.tree) bits)
            continuation depth outerParents)).cursor.erase := by
  let actions := compileActions program layout.tree
  have selected := generatedFuelRow_fresh_selectStep? program layout bits
    continuation admissible outerParents shape depth
    ((ZeroPosition.second).row actions (word bits) continuation)
    (generatedZeroRow_canonical actions bits continuation admissible .second)
  simpa [fuelZeroSecondMutationConfiguration,
    fuelZeroThirdMutationConfiguration, Cursor.erase, ZeroPosition.row,
    zeroEnvironment, zeroAlpha, baseAlpha,
    CheckpointDecoder.openEnvironment_word, FuelRow.term, FuelRow.target,
    FuelRow.localAddress, FuelRow.replacement, Term.replace?, C, b, actions]
    using! selected

theorem fuelZeroThird_fresh_selects_fourth
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (depth : Nat) (continuation : Term)
    (admissible : Carrier.Admissible continuation)
    (outerParents : List ParentFrame)
    (shape : FreshClockParents program layout outerParents) :
    RootResetPersistentResponseSelector.selectStep? program layout
        (fuelZeroThirdMutationConfiguration program layout registers
          (environmentCode (compileActions program layout.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program layout.tree) bits)
            continuation depth outerParents)).cursor.erase =
      some
        (fuelZeroFourthMutationConfiguration program layout registers
          (environmentCode (compileActions program layout.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program layout.tree) bits)
            continuation depth outerParents)).cursor.erase := by
  let actions := compileActions program layout.tree
  have selected := generatedFuelRow_fresh_selectStep? program layout bits
    continuation admissible outerParents shape depth
    ((ZeroPosition.third).row actions (word bits) continuation)
    (generatedZeroRow_canonical actions bits continuation admissible .third)
  simpa [fuelZeroThirdMutationConfiguration,
    fuelZeroFourthMutationConfiguration, Cursor.erase, ZeroPosition.row,
    zeroEnvironment, zeroAlpha, baseAlpha,
    CheckpointDecoder.openEnvironment_word, FuelRow.term, FuelRow.target,
    FuelRow.localAddress, FuelRow.replacement, Term.replace?, C, b, actions]
    using! selected

theorem fuelZeroFourth_fresh_selects_fifth
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (depth : Nat) (continuation : Term)
    (admissible : Carrier.Admissible continuation)
    (outerParents : List ParentFrame)
    (shape : FreshClockParents program layout outerParents) :
    RootResetPersistentResponseSelector.selectStep? program layout
        (fuelZeroFourthMutationConfiguration program layout registers
          (environmentCode (compileActions program layout.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program layout.tree) bits)
            continuation depth outerParents)).cursor.erase =
      some
        (fuelZeroFifthMutationConfiguration program layout registers
          (environmentCode (compileActions program layout.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program layout.tree) bits)
            continuation depth outerParents)).cursor.erase := by
  let actions := compileActions program layout.tree
  have selected := generatedFuelRow_fresh_selectStep? program layout bits
    continuation admissible outerParents shape depth
    ((ZeroPosition.fourth).row actions (word bits) continuation)
    (generatedZeroRow_canonical actions bits continuation admissible .fourth)
  simpa [fuelZeroFourthMutationConfiguration,
    fuelZeroFifthMutationConfiguration, Cursor.erase, ZeroPosition.row,
    zeroEnvironment, zeroAlpha, baseAlpha, baseCarrier, baseBeta,
    CheckpointDecoder.openEnvironment_word, FuelRow.term, FuelRow.target,
    FuelRow.localAddress, FuelRow.replacement, Term.replace?, C, b, actions]
    using! selected

/-- Every contraction edge in the canonical recursive fuel phase is selected
by the response-aware bare-term selector. -/
theorem fuel_freshSelectorChain
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (continuation : Term) (admissible : Carrier.Admissible continuation)
    (outerParents : List ParentFrame)
    (shape : FreshClockParents program layout outerParents) :
    ∀ fuel depth,
      RootResetExactTraceAgreement.SelectorChain
        (RootResetPersistentResponseSelector.selectStep? program layout)
        (fuelPhaseSourceConfiguration program layout registers fuel
          (environmentCode (compileActions program layout.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program layout.tree) bits)
            continuation depth outerParents))
        (SchedulerNestedPhase.fuelConfigurationsAt program layout bits registers
          continuation outerParents fuel depth)
  | 0, depth => by
      let environment :=
        environmentCode (compileActions program layout.tree) bits
      let parents :=
        PrimitiveFuel.pendingParents environment continuation depth outerParents
      let first := fuelZeroFirstMutationConfiguration program layout registers
        environment continuation parents
      let second := fuelZeroSecondMutationConfiguration program layout registers
        environment continuation parents
      let third := fuelZeroThirdMutationConfiguration program layout registers
        environment continuation parents
      let fourth := fuelZeroFourthMutationConfiguration program layout registers
        environment continuation parents
      let fifth := fuelZeroFifthMutationConfiguration program layout registers
        environment continuation parents
      have sourceFirst := fuelZeroScriptSource_fresh_selects_first program
        layout bits registers depth continuation admissible outerParents shape
      have phaseSourceFirst :
          RootResetPersistentResponseSelector.selectStep? program layout
              (fuelPhaseSourceConfiguration program layout registers 0
                environment continuation parents).cursor.erase =
            some first.cursor.erase := by
        simpa [fuelPhaseSourceConfiguration, fuelZeroScriptSourceConfiguration,
          environment, parents, first] using sourceFirst
      have firstSecond := fuelZeroFirst_fresh_selects_second program layout
        bits registers depth continuation admissible outerParents shape
      have secondThird := fuelZeroSecond_fresh_selects_third program layout
        bits registers depth continuation admissible outerParents shape
      have thirdFourth := fuelZeroThird_fresh_selects_fourth program layout
        bits registers depth continuation admissible outerParents shape
      have fourthFifth := fuelZeroFourth_fresh_selects_fifth program layout
        bits registers depth continuation admissible outerParents shape
      have chain : RootResetExactTraceAgreement.SelectorChain
          (RootResetPersistentResponseSelector.selectStep? program layout)
          (fuelPhaseSourceConfiguration program layout registers 0
            environment continuation parents)
          [first, second, third, fourth, fifth] :=
        .next phaseSourceFirst
          (.next firstSecond
            (.next secondThird
              (.next thirdFourth
                (.next fourthFifth (.done fifth)))))
      simpa [SchedulerNestedPhase.fuelConfigurationsAt,
        fuelPhaseSourceConfiguration, fuelZeroScriptSourceConfiguration,
        environment, parents, first, second, third, fourth, fifth] using chain
  | fuel + 1, depth => by
      let environment :=
        environmentCode (compileActions program layout.tree) bits
      let parents :=
        PrimitiveFuel.pendingParents environment continuation depth outerParents
      let nextParents :=
        PrimitiveFuel.pendingParents environment continuation (depth + 1) outerParents
      let source := fuelPhaseSourceConfiguration program layout registers
        (fuel + 1) environment continuation parents
      let first := fuelPositiveFirstMutationConfiguration program layout registers
        fuel environment continuation parents
      let second := fuelPositiveSecondMutationConfiguration program layout registers
        fuel environment continuation parents
      let nextSource := fuelPhaseSourceConfiguration program layout registers fuel
        environment continuation nextParents
      have sourceFirst := fuelPositiveScriptSource_fresh_selects_first program
        layout bits registers fuel depth continuation admissible outerParents shape
      have phaseSourceFirst :
          RootResetPersistentResponseSelector.selectStep? program layout
              (fuelPhaseSourceConfiguration program layout registers (fuel + 1)
                environment continuation parents).cursor.erase =
            some first.cursor.erase := by
        simpa [fuelPhaseSourceConfiguration,
          fuelPositiveScriptSourceConfiguration, environment, parents, first]
          using sourceFirst
      have firstSecond := fuelPositiveFirst_fresh_selects_second program layout
        bits registers fuel depth continuation admissible outerParents shape
      have suffixRaw := fuelPositiveSampleSuffix_zeroRun program layout registers
        fuel environment continuation parents
      have parentEq :
          .right (.app environment continuation) :: parents = nextParents := by
        simpa [parents, nextParents] using
          (SchedulerCycle.pendingParents_succ_cons environment continuation depth
            outerParents).symm
      rw [parentEq] at suffixRaw
      have suffix : ZeroMutationRun (SchedulerControl.machine program layout) 2
          second nextSource := by
        simpa [second, nextSource] using suffixRaw
      have tail := fuel_freshSelectorChain program layout bits registers
        continuation admissible outerParents shape fuel (depth + 1)
      have linked := RootResetExactTraceAgreement.SelectorChain.prepend suffix tail
      have chain : RootResetExactTraceAgreement.SelectorChain
          (RootResetPersistentResponseSelector.selectStep? program layout) source
          (first :: second ::
            SchedulerNestedPhase.fuelConfigurationsAt program layout bits
              registers continuation outerParents fuel (depth + 1)) :=
        .next phaseSourceFirst (.next firstSecond linked)
      simpa [SchedulerNestedPhase.fuelConfigurationsAt,
        fuelPhaseSourceConfiguration, source,
        fuelPositiveScriptSourceConfiguration, first, second, environment,
        parents, nextParents] using chain




theorem positiveStage_fresh_exact_selectorChain
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (clockRegisters : SchedulerControl.Registers program)
    (outerParents : List ParentFrame) (shape : FreshClockParents program layout outerParents)
    (fuel : Nat) :
    let environment := environmentCode (compileActions program layout.tree) bits
    let continuation := Dovetail.clockExit (fuel + 1) fuel environment
    let terminal := SchedulerNestedPhase.fuelTerminalConfigurationAt program layout bits
      (SchedulerControl.Registers.newJob program) continuation outerParents (fuel + 1) 0
    let source := clockPhaseSourceConfiguration program layout clockRegisters
      (.left environment :: outerParents) (fuel + 1)
    let samples := SchedulerNestedPhase.positiveStageConfigurationsAt program layout bits clockRegisters outerParents fuel
    SchedulerResponseInvariant.ExactMutationChain (SchedulerControl.machine program layout) terminal source samples ∧
      RootResetExactTraceAgreement.SelectorChain (selectStep? program layout) source samples := by
  dsimp only
  let environment := environmentCode (compileActions program layout.tree) bits
  let continuation := Dovetail.clockExit (fuel + 1) fuel environment
  have clockChain := clockLaunch_fresh_exact_selectorChain program layout bits clockRegisters fuel outerParents shape
  have fuelChain := SchedulerNestedPhase.fuelExactMutationChainAt program layout bits
    (SchedulerControl.Registers.newJob program) continuation outerParents (fuel + 1) 0
  have fuelSelected := fuel_freshSelectorChain program layout bits (SchedulerControl.Registers.newJob program)
    continuation (Dovetail.clockExit_admissible (fuel + 1) fuel environment) outerParents shape (fuel + 1) 0
  have complete := SchedulerRecurrence.ExactMutationChain.append clockChain.1 fuelChain
  have completeSelected := RootResetExactTraceAgreement.SelectorChain.append clockChain.1 clockChain.2 fuelSelected
  simpa only [SchedulerNestedPhase.positiveStageConfigurationsAt, environment, continuation,
    List.append_assoc, List.singleton_append] using And.intro complete completeSelected

/-- After the actual first nonempty normal response, all later clock and
fuel contractions through stage two's generated Base sample are selected. -/
theorem firstReturn_nextBase_exact_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool)
    {outerContext fullContext innerContext targetContext : Context} {ascentTicks : Nat}
    (trace : SchedulerCycle.FirstResponseTrace program dispatcher bit suffix 0
      outerContext fullContext innerContext targetContext ascentTicks)
    (nonempty : (CTS.absorbingStep program ⟨CTS.zeroPhase program, bit :: suffix⟩).data ≠ []) :
    let bits := bit :: suffix
    let environment := environmentCode (compileActions program dispatcher.tree) bits
    let continuation := Dovetail.clockExit 2 1 environment
    let parents := SchedulerRootContinuation.freshContinuationParents program dispatcher
      (SchedulerCycle.responseRegisters program bit suffix) bit bits
      (SchedulerCycle.deletedCarrier bit outerContext innerContext) []
    let terminal := SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher bits
      (SchedulerControl.Registers.newJob program) continuation parents 2 0
    let samples := SchedulerNestedPhase.positiveStageConfigurationsAt program dispatcher bits
      (SchedulerControl.Registers.newJob program) parents 1
    SchedulerResponseInvariant.ExactMutationChain (SchedulerControl.machine program dispatcher) terminal
      (SchedulerCycle.firstReturnConfiguration program dispatcher bit suffix 0 outerContext innerContext) samples ∧
    RootResetExactTraceAgreement.SelectorChain (selectStep? program dispatcher)
      (SchedulerCycle.firstReturnConfiguration program dispatcher bit suffix 0 outerContext innerContext) samples := by
  dsimp only
  let bits := bit :: suffix
  let environment := environmentCode (compileActions program dispatcher.tree) bits
  let continuation := Dovetail.clockExit 2 1 environment
  let registers := SchedulerCycle.responseRegisters program bit suffix
  let carrier := SchedulerCycle.deletedCarrier bit outerContext innerContext
  let parents := SchedulerRootContinuation.freshContinuationParents program dispatcher registers bit bits carrier []
  have facts := firstResponseTrace_freshClock_facts program dispatcher bit suffix 0 trace nonempty
  have shape : FreshClockParents program dispatcher parents :=
    .fresh registers bit bits carrier facts.1 facts.2
  have clockChain := firstReturn_nextClockLaunch_exact_selectorChain program dispatcher bit suffix trace nonempty
  have fuelChain := SchedulerNestedPhase.fuelExactMutationChainAt program dispatcher bits
    (SchedulerControl.Registers.newJob program) continuation parents 2 0
  have fuelSelected := fuel_freshSelectorChain program dispatcher bits (SchedulerControl.Registers.newJob program)
    continuation (Dovetail.clockExit_admissible 2 1 environment) parents shape 2 0
  have complete := SchedulerRecurrence.ExactMutationChain.append clockChain.1 fuelChain
  have completeSelected := RootResetExactTraceAgreement.SelectorChain.append clockChain.1 clockChain.2 fuelSelected
  simpa only [SchedulerNestedPhase.positiveStageConfigurationsAt, bits, environment, continuation,
    registers, carrier, parents, List.append_assoc, List.singleton_append] using And.intro complete completeSelected


/-- A single exact selected chain starts at the actual encoder and crosses
the complete first nonempty job into the second stage's Base sample. The
first response's witness is shared by the deletion, response body, completed
parents, and next clock/fuel phase, so all handoffs refer to the same run. -/
theorem initial_to_secondBase_exact_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool)
    (nonempty : (CTS.absorbingStep program
      ⟨CTS.zeroPhase program, bit :: suffix⟩).data ≠ []) :
    ∃ (outerContext innerContext : Context)
      (samples : List (SchedulerInvariant.Configuration program dispatcher)),
      let bits := bit :: suffix
      let environment := environmentCode (compileActions program dispatcher.tree) bits
      let parents := SchedulerRootContinuation.freshContinuationParents program dispatcher
        (SchedulerCycle.responseRegisters program bit suffix) bit bits
        (SchedulerCycle.deletedCarrier bit outerContext innerContext) []
      let terminal := SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher
        bits (SchedulerControl.Registers.newJob program)
        (Dovetail.clockExit 2 1 environment) parents 2 0
      SchedulerResponseInvariant.ExactMutationChain
        (SchedulerControl.machine program dispatcher) terminal
        (SchedulerControl.initialConfiguration program dispatcher bits) samples ∧
      RootResetExactTraceAgreement.SelectorChain (selectStep? program dispatcher)
        (SchedulerControl.initialConfiguration program dispatcher bits) samples := by
  obtain ⟨outerContext, fullContext, innerContext, targetContext, descentTicks,
      ascentTicks, trace⟩ := SchedulerCycle.positiveStageFirstResponseTrace program
    dispatcher bit suffix (SchedulerControl.Registers.newJob program)
    (CTS.zeroPhase program) [] false (RegistersCoherent.initial program) 1 0
  let c4 := SchedulerCycle.firstC4Configuration program dispatcher bit suffix 0
    outerContext innerContext
  obtain ⟨bound, _view, found, _parsed, _contracted⟩ :=
    RootResetPersistentRouteAFuelSchedulerBridge.positiveStageFifth_selects_exact_firstC4
      program dispatcher bit suffix (SchedulerControl.Registers.newJob program)
      (CTS.zeroPhase program) [] false (RegistersCoherent.initial program) 1 0 trace
  have deletion : SchedulerResponseInvariant.ExactMutationChain
      (SchedulerControl.machine program dispatcher) c4
      (RootResetInitialContractionPrefix.clockFuelTerminal program dispatcher (bit :: suffix))
      [c4] := .next bound found (.done 0 ⟨rfl, rfl⟩)
  have deletionSelected :=
    RootResetFirstResponseSelectorChain.positiveStageFifth_firstC4_selectorChain
      program dispatcher bit suffix (SchedulerControl.Registers.newJob program)
      (CTS.zeroPhase program) [] false (RegistersCoherent.initial program) 1 0 trace
  have initialChain := RootResetInitialContractionPrefix.clockFuel_exactMutationChain
    program dispatcher (bit :: suffix)
  have initialSelected := RootResetInitialContractionPrefix.clockFuel_selectorChain
    program dispatcher (bit :: suffix)
  have toC4 := SchedulerRecurrence.ExactMutationChain.append initialChain deletion
  have toC4Selected := RootResetExactTraceAgreement.SelectorChain.append
    initialChain initialSelected deletionSelected
  obtain ⟨first, rest, response, responseSelected⟩ :=
    RootResetFirstNormalResponseChain.firstC4_to_return_selectorChain
      program dispatcher bit suffix 0 trace.response
  have nextStage := firstReturn_nextBase_exact_selectorChain
    program dispatcher bit suffix trace.response nonempty
  have toReturn := SchedulerRecurrence.ExactMutationChain.append toC4 response
  have toReturnSelected := RootResetExactTraceAgreement.SelectorChain.append
    toC4 toC4Selected responseSelected
  exact ⟨outerContext, innerContext, _,
    SchedulerRecurrence.ExactMutationChain.append toReturn nextStage.1,
    RootResetExactTraceAgreement.SelectorChain.append
      toReturn toReturnSelected nextStage.2⟩

end PureSFormal.Research.RootResetFreshFuelSelectorChain
