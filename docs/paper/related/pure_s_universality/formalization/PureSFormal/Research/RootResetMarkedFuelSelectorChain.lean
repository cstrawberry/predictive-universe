import PureSFormal.Research.RootResetEmptyJobSelectorChain

/-!
# Fuel contraction prefixes inside completed marked histories

Canonical fuel rows retain their exact selections under the marked context
created by a completed EMPTY response.  The historical continuation fields
are rebuilt for every literal scheduler sample.
-/

namespace PureSFormal.Research.RootResetMarkedFuelSelectorChain

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

theorem fuelRow_headArity_ne_two (row : FuelRow) : row.term.headArity ≠ 2 := by
  cases row <;> simp [FuelRow.term, carrierC_headArity, b]

/-- Canonical fuel rows below pending frames preserve every response-selector
priority when surrounded by an arbitrary exact marked history. -/
theorem selectStep?_markedPrefix_pendingFuelRow
    (program : CTS.Program) (layout : ActionDispatcher program)
    {layers : List PendingLayer}
    (route : RoutePendingLayers (compileActions program layout.tree) layers)
    (row : FuelRow) (canonical : CanonicalFuelRow (compileActions program layout.tree) row)
    {whole : Term} {context : Context} {history : List (CheckpointDecoder.LocalView program)}
    (shape : MarkedPrefix program layout.tree whole
      (pendingFuelRowTerm (compileActions program layout.tree) layers row) context history) :
    selectStep? program layout whole = some (context.plug ((pendingContext layers).plug row.target)) := by
  let outer := prependMarked context history (pendingFuelRowActiveContext program layers row)
  have activeEq : RootResetPersistentRouteA.activeContext program layout whole = outer := by
    rw [activeContext_markedPrefix shape, activeContext_pendingFuelRow program layout route row canonical]
  have fuelEq : RootResetPersistentRouteAFuel.fuelActiveContext program layout whole = outer := by
    rw [fuelActiveContext_markedPrefix shape, fuelActiveContext_pendingFuelRow program layout route row canonical]
  have outerEq : responseOuter program layout whole = outer := by
    rw [responseOuter_markedPrefix shape, responseOuter_pendingFuelRow program layout route row canonical]
  have fuelNone : RootResetPersistentFuelCarrier.parse? (compileActions program layout.tree) row.term = none := by
    exact parseFuelHandoff?_canonicalPendingFuelRow_none program layout [] row trivial canonical
  have notSix : row.term.headArity ≠ 6 := by
    intro equal
    have bound := row.term_headArity_le_four
    rw [equal] at bound
    exact (by decide : ¬ 6 ≤ 4) bound
  have selected := canonicalFuelRow_selects program layout row canonical
  have result := selectStep?_of_recoveredOuter program layout whole row.target outer outerEq activeEq fuelEq
    (next?_canonicalFuelRow_none program layout row canonical) fuelNone
    (parseLocal?_canonicalFuelRow_none program layout row canonical) notSix
    (fuelRow_headArity_ne_two row)
    (noFresh_marked_pending history.length layers.length)
    (noPendingMarked_marked_pending history.length layers.length)
    row.localAddress selected.1 selected.2
  simpa only [outer, prependMarked, pendingFuelRowActiveContext, Context.plug_comp] using result

/-- The generated scheduler row is selected in every marked outer zipper;
all parser exclusions are derived from its constructor grammar. -/
theorem generatedFuelRow_marked_selectStep?
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (continuation : Term) (admissible : Carrier.Admissible continuation)
    (outerParents : List ParentFrame)
    {active : Term} {history : List (CheckpointDecoder.LocalView program)}
    (shape : MarkedPrefix program layout.tree (Cursor.rebuild outerParents active) active
      (contextOfParents outerParents) history)
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
  obtain ⟨targetHistory, placed⟩ := markedPrefix_replace shape
    (parseMarkedLocal?_canonicalPendingFuelRow_none program layout layers row route.canonical)
  have selected := selectStep?_markedPrefix_pendingFuelRow program layout route row canonical placed
  rw [contextOfParents_plug, contextOfParents_plug] at selected
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
  exact selected

theorem fuelPositiveScriptSource_marked_selects_first
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (fuel depth : Nat) (continuation : Term)
    (admissible : Carrier.Admissible continuation)
    (outerParents : List ParentFrame)
    {active : Term} {history : List (CheckpointDecoder.LocalView program)}
    (shape : MarkedPrefix program layout.tree (Cursor.rebuild outerParents active) active
      (contextOfParents outerParents) history) :
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
  have selected := generatedFuelRow_marked_selectStep? program layout bits
    continuation admissible outerParents shape depth
    (.call (fuel + 1) (environmentCode actions bits) continuation)
    (generatedCallRow_canonical actions bits continuation admissible (fuel + 1))
  simpa [fuelPositiveScriptSourceConfiguration,
    fuelPositiveFirstMutationConfiguration, Cursor.erase, FuelRow.term,
    FuelRow.target, FuelRow.localAddress, FuelRow.replacement, Term.replace?,
    C, b, actions] using! selected

theorem fuelPositiveFirst_marked_selects_second
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (fuel depth : Nat) (continuation : Term)
    (admissible : Carrier.Admissible continuation)
    (outerParents : List ParentFrame)
    {active : Term} {history : List (CheckpointDecoder.LocalView program)}
    (shape : MarkedPrefix program layout.tree (Cursor.rebuild outerParents active) active
      (contextOfParents outerParents) history) :
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
  have selected := generatedFuelRow_marked_selectStep? program layout bits
    continuation admissible outerParents shape depth
    (.positiveHalf fuel (environmentCode actions bits)
      (environmentCode actions bits) continuation)
    (generatedPositiveHalfRow_canonical actions bits continuation admissible fuel)
  simpa [fuelPositiveFirstMutationConfiguration,
    fuelPositiveSecondMutationConfiguration, Cursor.erase, FuelRow.term,
    FuelRow.target, FuelRow.localAddress, FuelRow.replacement, Term.replace?,
    frame, actions] using! selected

theorem fuelZeroScriptSource_marked_selects_first
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (depth : Nat) (continuation : Term)
    (admissible : Carrier.Admissible continuation)
    (outerParents : List ParentFrame)
    {active : Term} {history : List (CheckpointDecoder.LocalView program)}
    (shape : MarkedPrefix program layout.tree (Cursor.rebuild outerParents active) active
      (contextOfParents outerParents) history) :
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
  have selected := generatedFuelRow_marked_selectStep? program layout bits
    continuation admissible outerParents shape depth
    ((ZeroPosition.call).row actions (word bits) continuation)
    (generatedZeroRow_canonical actions bits continuation admissible .call)
  simpa [fuelZeroScriptSourceConfiguration,
    fuelZeroFirstMutationConfiguration, Cursor.erase, ZeroPosition.row,
    zeroEnvironment, CheckpointDecoder.openEnvironment_word, FuelRow.term,
    FuelRow.target, FuelRow.localAddress, FuelRow.replacement, Term.replace?,
    C, b, actions] using! selected

theorem fuelZeroFirst_marked_selects_second
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (depth : Nat) (continuation : Term)
    (admissible : Carrier.Admissible continuation)
    (outerParents : List ParentFrame)
    {active : Term} {history : List (CheckpointDecoder.LocalView program)}
    (shape : MarkedPrefix program layout.tree (Cursor.rebuild outerParents active) active
      (contextOfParents outerParents) history) :
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
  have selected := generatedFuelRow_marked_selectStep? program layout bits
    continuation admissible outerParents shape depth
    ((ZeroPosition.first).row actions (word bits) continuation)
    (generatedZeroRow_canonical actions bits continuation admissible .first)
  simpa [fuelZeroFirstMutationConfiguration,
    fuelZeroSecondMutationConfiguration, Cursor.erase, ZeroPosition.row,
    zeroEnvironment, CheckpointDecoder.openEnvironment_word, FuelRow.term,
    FuelRow.target, FuelRow.localAddress, FuelRow.replacement, Term.replace?,
    C, b, actions] using! selected

theorem fuelZeroSecond_marked_selects_third
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (depth : Nat) (continuation : Term)
    (admissible : Carrier.Admissible continuation)
    (outerParents : List ParentFrame)
    {active : Term} {history : List (CheckpointDecoder.LocalView program)}
    (shape : MarkedPrefix program layout.tree (Cursor.rebuild outerParents active) active
      (contextOfParents outerParents) history) :
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
  have selected := generatedFuelRow_marked_selectStep? program layout bits
    continuation admissible outerParents shape depth
    ((ZeroPosition.second).row actions (word bits) continuation)
    (generatedZeroRow_canonical actions bits continuation admissible .second)
  simpa [fuelZeroSecondMutationConfiguration,
    fuelZeroThirdMutationConfiguration, Cursor.erase, ZeroPosition.row,
    zeroEnvironment, zeroAlpha, baseAlpha,
    CheckpointDecoder.openEnvironment_word, FuelRow.term, FuelRow.target,
    FuelRow.localAddress, FuelRow.replacement, Term.replace?, C, b, actions]
    using! selected

theorem fuelZeroThird_marked_selects_fourth
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (depth : Nat) (continuation : Term)
    (admissible : Carrier.Admissible continuation)
    (outerParents : List ParentFrame)
    {active : Term} {history : List (CheckpointDecoder.LocalView program)}
    (shape : MarkedPrefix program layout.tree (Cursor.rebuild outerParents active) active
      (contextOfParents outerParents) history) :
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
  have selected := generatedFuelRow_marked_selectStep? program layout bits
    continuation admissible outerParents shape depth
    ((ZeroPosition.third).row actions (word bits) continuation)
    (generatedZeroRow_canonical actions bits continuation admissible .third)
  simpa [fuelZeroThirdMutationConfiguration,
    fuelZeroFourthMutationConfiguration, Cursor.erase, ZeroPosition.row,
    zeroEnvironment, zeroAlpha, baseAlpha,
    CheckpointDecoder.openEnvironment_word, FuelRow.term, FuelRow.target,
    FuelRow.localAddress, FuelRow.replacement, Term.replace?, C, b, actions]
    using! selected

theorem fuelZeroFourth_marked_selects_fifth
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (depth : Nat) (continuation : Term)
    (admissible : Carrier.Admissible continuation)
    (outerParents : List ParentFrame)
    {active : Term} {history : List (CheckpointDecoder.LocalView program)}
    (shape : MarkedPrefix program layout.tree (Cursor.rebuild outerParents active) active
      (contextOfParents outerParents) history) :
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
  have selected := generatedFuelRow_marked_selectStep? program layout bits
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
theorem fuel_markedSelectorChain
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (continuation : Term) (admissible : Carrier.Admissible continuation)
    (outerParents : List ParentFrame)
    {active : Term} {history : List (CheckpointDecoder.LocalView program)}
    (shape : MarkedPrefix program layout.tree (Cursor.rebuild outerParents active) active
      (contextOfParents outerParents) history) :
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
      have sourceFirst := fuelZeroScriptSource_marked_selects_first program
        layout bits registers depth continuation admissible outerParents shape
      have phaseSourceFirst :
          RootResetPersistentResponseSelector.selectStep? program layout
              (fuelPhaseSourceConfiguration program layout registers 0
                environment continuation parents).cursor.erase =
            some first.cursor.erase := by
        simpa [fuelPhaseSourceConfiguration, fuelZeroScriptSourceConfiguration,
          environment, parents, first] using sourceFirst
      have firstSecond := fuelZeroFirst_marked_selects_second program layout
        bits registers depth continuation admissible outerParents shape
      have secondThird := fuelZeroSecond_marked_selects_third program layout
        bits registers depth continuation admissible outerParents shape
      have thirdFourth := fuelZeroThird_marked_selects_fourth program layout
        bits registers depth continuation admissible outerParents shape
      have fourthFifth := fuelZeroFourth_marked_selects_fifth program layout
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
      have sourceFirst := fuelPositiveScriptSource_marked_selects_first program
        layout bits registers fuel depth continuation admissible outerParents shape
      have phaseSourceFirst :
          RootResetPersistentResponseSelector.selectStep? program layout
              (fuelPhaseSourceConfiguration program layout registers (fuel + 1)
                environment continuation parents).cursor.erase =
            some first.cursor.erase := by
        simpa [fuelPhaseSourceConfiguration,
          fuelPositiveScriptSourceConfiguration, environment, parents, first]
          using sourceFirst
      have firstSecond := fuelPositiveFirst_marked_selects_second program layout
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
      have tail := fuel_markedSelectorChain program layout bits registers
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


end PureSFormal.Research.RootResetMarkedFuelSelectorChain
