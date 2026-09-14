import PureSFormal.Research.RootResetMixedClockFuelSelectorChain
import PureSFormal.Research.RootResetCleanParentPrefix

/-! Complete clock and fuel phases under the actual generated parent invariant. -/
namespace PureSFormal.Research.RootResetMixedStagePhaseSelectorChain
open PureSFormal.PureS
open SchedulerInvariant
open RootResetCleanTraversableParents RootResetCleanParentPrefix
open RootResetMixedClockFuelSelectorChain RootResetPersistentResponseSelector
open RootResetClockFuelStages RootResetClockFuelCanonicalGrammar
open RootResetPersistentClockFuelAgreement RootResetResponseClockFuelAgreement
open RootResetMarkedClockSelectorChain RootResetEmptyHandoffContext
open RootResetEmptyContinuationSelector RootResetPersistentFuelCarrier

theorem positiveClockMutation_mixedParents_selects_next
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (stage wrappers remaining : Nat) (balance : wrappers + remaining + 1 = stage)
    (outerParents : List ParentFrame) {layers : Nat}
    (shape : CleanParents program layout outerParents layers) :
    selectStep? program layout
      (positiveClockMutationConfiguration program layout registers stage wrappers remaining
        (.left (environmentCode (compileActions program layout.tree) bits) :: outerParents)).cursor.erase =
      some (nextClockSample program layout registers stage wrappers bits outerParents remaining).cursor.erase := by
  have postBalance : wrappers + 1 + remaining = stage := by
    rw [Nat.add_assoc, Nat.add_comm 1 remaining, ← Nat.add_assoc]
    exact balance
  have route := positiveClockSample_routeA program layout registers stage wrappers remaining bits balance
  rw [positiveClockMutation_erase_eq_clockPostPositiveTerm] at route
  obtain ⟨roles, history, placed⟩ := toPrefix shape
    (clockPostPositiveTerm program layout stage wrappers remaining bits)
  have selected := selectStep?_mixed_clockPostPositive program layout stage wrappers remaining
    bits postBalance placed route
  rw [positiveClock_erase_rebuild, nextClockSample_erase_rebuild]
  rw [contextOfParents_plug] at selected
  exact selected

theorem clockFirst_mixedParents_selects_first
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program) (stage : Nat)
    (outerParents : List ParentFrame) {layers : Nat}
    (shape : CleanParents program layout outerParents layers) :
    selectStep? program layout
      (clockPhaseSourceConfiguration program layout registers
        (.left (environmentCode (compileActions program layout.tree) bits) :: outerParents) (stage + 1)).cursor.erase =
      some (positiveClockMutationConfiguration program layout registers (stage + 1) 0 stage
        (.left (environmentCode (compileActions program layout.tree) bits) :: outerParents)).cursor.erase := by
  obtain ⟨roles, history, placed⟩ := toPrefix shape (exitTerm program layout stage 0 bits)
  have selected := selectStep?_mixed_exit program layout stage 0 bits (Nat.zero_le stage) placed
  rw [contextOfParents_plug] at selected
  change selectStep? program layout (Cursor.rebuild outerParents (exitTerm program layout stage 0 bits)) = _
  rw [selected]
  apply congrArg some
  rw [positiveClock_erase_rebuild]
  rfl

theorem clockCompleted_mixedParents_selects_launch
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program) (fuel : Nat)
    (outerParents : List ParentFrame) {layers : Nat}
    (shape : CleanParents program layout outerParents layers) :
    selectStep? program layout
      (clockPhaseCompletedConfiguration program layout registers (fuel + 1)
        (.left (environmentCode (compileActions program layout.tree) bits) :: outerParents)).cursor.erase =
      some (SchedulerNestedPhase.positiveStageLaunchConfigurationAt program layout fuel
        (environmentCode (compileActions program layout.tree) bits) outerParents).cursor.erase := by
  obtain ⟨roles, history, placed⟩ := toPrefix shape (exitTerm program layout (fuel + 1) (fuel + 1) bits)
  have selected := selectStep?_mixed_exit program layout (fuel + 1) (fuel + 1) bits (Nat.le_refl _) placed
  rw [contextOfParents_plug] at selected
  rw [clockPhaseCompleted_erase]
  exact selected

theorem generatedFuelRow_mixed_selectStep?
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (continuation : Term) (admissible : Carrier.Admissible continuation)
    (outerParents : List ParentFrame) {layers : Nat}
    (shape : CleanParents program layout outerParents layers)
    (depth : Nat) (row : FuelRow)
    (canonical : CanonicalFuelRow (compileActions program layout.tree) row) :
    selectStep? program layout
      (Cursor.mk row.term (PrimitiveFuel.pendingParents
        (environmentCode (compileActions program layout.tree) bits) continuation depth outerParents)).erase =
      some (Cursor.rebuild (PrimitiveFuel.pendingParents
        (environmentCode (compileActions program layout.tree) bits) continuation depth outerParents) row.target) := by
  let actions := compileActions program layout.tree
  let pendingLayers := generatedPendingLayers actions bits continuation depth
  have route := generatedPendingLayers_route actions bits continuation admissible depth
  have sourceEq : Cursor.rebuild
      (PrimitiveFuel.pendingParents (environmentCode actions bits) continuation depth outerParents) row.term =
      Cursor.rebuild outerParents (pendingFuelRowTerm actions pendingLayers row) := by
    rw [PrimitiveFuel.rebuild_pendingParents]
    rw [← fuelRowCursor_erase actions bits continuation depth row]
    rw [Cursor.erase, PrimitiveFuel.rebuild_pendingParents]
    rfl
  have targetEq : Cursor.rebuild
      (PrimitiveFuel.pendingParents (environmentCode actions bits) continuation depth outerParents) row.target =
      Cursor.rebuild outerParents ((pendingContext pendingLayers).plug row.target) := by
    rw [PrimitiveFuel.rebuild_pendingParents]
    rw [← rebuild_pendingParents_eq_generatedPendingContext actions bits continuation depth row.target]
    rw [PrimitiveFuel.rebuild_pendingParents]
    rfl
  change selectStep? program layout (Cursor.rebuild _ row.term) = some (Cursor.rebuild _ row.target)
  rw [sourceEq, targetEq]
  obtain ⟨roles, history, placed⟩ := toPrefix shape (pendingFuelRowTerm actions pendingLayers row)
  have selected := selectStep?_mixed_pendingFuelRow program layout route row canonical placed
  rw [contextOfParents_plug] at selected
  exact selected

theorem clockTail_mixedSelectorChain
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (stage : Nat)
    (outerParents : List ParentFrame)
    {layers : Nat} (shape : CleanParents program layout outerParents layers) : ∀ wrappers remaining,
    wrappers + remaining + 1 = stage →
      RootResetExactTraceAgreement.SelectorChain
        (RootResetPersistentResponseSelector.selectStep? program layout)
        (positiveClockMutationConfiguration program layout registers stage
          wrappers remaining
          (.left (environmentCode (compileActions program layout.tree) bits) :: outerParents))
        (SchedulerNestedPhase.clockTailConfigurationsAt program layout bits
          registers stage outerParents wrappers remaining)
  | wrappers, 0, balance => by
      let closing := zeroClockMutationConfiguration program layout registers stage
        (wrappers + 1)
        (.left (environmentCode (compileActions program layout.tree) bits) :: outerParents)
      have selected := positiveClockMutation_mixedParents_selects_next program layout
        bits registers stage wrappers 0 (by simpa only [Nat.add_zero] using balance) outerParents shape
      have selected' : RootResetPersistentResponseSelector.selectStep? program
          layout
          (positiveClockMutationConfiguration program layout registers stage
            wrappers 0
            (.left (environmentCode (compileActions program layout.tree) bits) :: outerParents)).cursor.erase =
        some closing.cursor.erase := by
        simpa [nextClockSample, closing] using selected
      simpa [SchedulerNestedPhase.clockTailConfigurationsAt, closing] using
        (RootResetExactTraceAgreement.SelectorChain.next selected'
          (RootResetExactTraceAgreement.SelectorChain.done closing))
  | wrappers, remaining + 1, balance => by
      let next := positiveClockMutationConfiguration program layout registers stage
        (wrappers + 1) remaining
        (.left (environmentCode (compileActions program layout.tree) bits) :: outerParents)
      have selected := positiveClockMutation_mixedParents_selects_next program layout
        bits registers stage wrappers (remaining + 1) balance outerParents shape
      have selected' : RootResetPersistentResponseSelector.selectStep? program
          layout
          (positiveClockMutationConfiguration program layout registers stage
            wrappers (remaining + 1)
            (.left (environmentCode (compileActions program layout.tree) bits) :: outerParents)).cursor.erase =
        some next.cursor.erase := by
        simpa [nextClockSample, next] using selected
      have tailBalance : wrappers + 1 + remaining + 1 = stage := by
        calc
          wrappers + 1 + remaining + 1 =
              (wrappers + (1 + remaining)) + 1 := by
                rw [Nat.add_assoc wrappers 1 remaining]
          _ = (wrappers + (remaining + 1)) + 1 := by
                rw [Nat.add_comm 1 remaining]
          _ = wrappers + (remaining + 1) + 1 := rfl
          _ = stage := balance
      have tail := clockTail_mixedSelectorChain program layout bits registers
        stage outerParents shape (wrappers + 1) remaining tailBalance
      simpa [SchedulerNestedPhase.clockTailConfigurationsAt, next] using
        (RootResetExactTraceAgreement.SelectorChain.next selected' tail)

theorem clock_mixedSelectorChain
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (stage : Nat)
    (outerParents : List ParentFrame)
    {layers : Nat} (shape : CleanParents program layout outerParents layers) :
    RootResetExactTraceAgreement.SelectorChain
      (RootResetPersistentResponseSelector.selectStep? program layout)
      (clockPhaseSourceConfiguration program layout registers
        (.left (environmentCode (compileActions program layout.tree) bits) :: outerParents)
        (stage + 1))
      (SchedulerNestedPhase.clockConfigurationsAt program layout bits registers
        outerParents stage) := by
  let first := positiveClockMutationConfiguration program layout registers
    (stage + 1) 0 stage
    (.left (environmentCode (compileActions program layout.tree) bits) :: outerParents)
  have selected := clockFirst_mixedParents_selects_first program layout bits registers stage outerParents shape
  have selected' : RootResetPersistentResponseSelector.selectStep? program layout
        (clockPhaseSourceConfiguration program layout registers
          (.left (environmentCode (compileActions program layout.tree) bits) :: outerParents) (stage + 1)).cursor.erase =
      some first.cursor.erase := by
    simpa [clockPhaseSourceConfiguration, positiveClockSourceConfiguration,
      clockFirstTerm, first] using selected
  have tail := clockTail_mixedSelectorChain program layout bits registers
    (stage + 1) outerParents shape 0 stage (by simp)
  simpa [SchedulerNestedPhase.clockConfigurationsAt, first] using
    (RootResetExactTraceAgreement.SelectorChain.next selected' tail)


theorem clockLaunch_mixed_exact_selectorChain
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program) (fuel : Nat)
    (outerParents : List ParentFrame)
    {layers : Nat} (shape : CleanParents program layout outerParents layers) :
    let environment := environmentCode (compileActions program layout.tree) bits
    let source := clockPhaseSourceConfiguration program layout registers (.left environment :: outerParents) (fuel + 1)
    let launch := SchedulerNestedPhase.positiveStageLaunchConfigurationAt program layout fuel environment outerParents
    let samples := SchedulerNestedPhase.clockConfigurationsAt program layout bits registers outerParents fuel ++ [launch]
    SchedulerResponseInvariant.ExactMutationChain (SchedulerControl.machine program layout) launch source samples ∧
      RootResetExactTraceAgreement.SelectorChain (selectStep? program layout) source samples := by
  dsimp only
  have clockChain := SchedulerNestedPhase.clockExactMutationChainAt program layout bits registers outerParents fuel
  have clockSelected := clock_mixedSelectorChain program layout bits registers fuel outerParents shape
  have found := SchedulerNestedPhase.clockCompleted_seekLaunchAt program layout registers fuel bits outerParents
  have launchChain := SchedulerResponseInvariant.ExactMutationChain.next _ found
    (SchedulerResponseInvariant.ExactMutationChain.done 0 ⟨rfl, rfl⟩)
  have launchSelected := RootResetExactTraceAgreement.SelectorChain.next
    (clockCompleted_mixedParents_selects_launch program layout bits registers fuel outerParents shape)
    (RootResetExactTraceAgreement.SelectorChain.done _)
  exact ⟨SchedulerRecurrence.ExactMutationChain.append clockChain launchChain,
    RootResetExactTraceAgreement.SelectorChain.append clockChain clockSelected launchSelected⟩




theorem fuelPositiveScriptSource_mixed_selects_first
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (fuel depth : Nat) (continuation : Term)
    (admissible : Carrier.Admissible continuation)
    (outerParents : List ParentFrame)
    {layers : Nat} (shape : CleanParents program layout outerParents layers) :
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
  have selected := generatedFuelRow_mixed_selectStep? program layout bits
    continuation admissible outerParents shape depth
    (.call (fuel + 1) (environmentCode actions bits) continuation)
    (generatedCallRow_canonical actions bits continuation admissible (fuel + 1))
  simpa [fuelPositiveScriptSourceConfiguration,
    fuelPositiveFirstMutationConfiguration, Cursor.erase, FuelRow.term,
    FuelRow.target, FuelRow.localAddress, FuelRow.replacement, Term.replace?,
    C, b, actions] using! selected

theorem fuelPositiveFirst_mixed_selects_second
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (fuel depth : Nat) (continuation : Term)
    (admissible : Carrier.Admissible continuation)
    (outerParents : List ParentFrame)
    {layers : Nat} (shape : CleanParents program layout outerParents layers) :
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
  have selected := generatedFuelRow_mixed_selectStep? program layout bits
    continuation admissible outerParents shape depth
    (.positiveHalf fuel (environmentCode actions bits)
      (environmentCode actions bits) continuation)
    (generatedPositiveHalfRow_canonical actions bits continuation admissible fuel)
  simpa [fuelPositiveFirstMutationConfiguration,
    fuelPositiveSecondMutationConfiguration, Cursor.erase, FuelRow.term,
    FuelRow.target, FuelRow.localAddress, FuelRow.replacement, Term.replace?,
    frame, actions] using! selected

theorem fuelZeroScriptSource_mixed_selects_first
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (depth : Nat) (continuation : Term)
    (admissible : Carrier.Admissible continuation)
    (outerParents : List ParentFrame)
    {layers : Nat} (shape : CleanParents program layout outerParents layers) :
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
  have selected := generatedFuelRow_mixed_selectStep? program layout bits
    continuation admissible outerParents shape depth
    ((ZeroPosition.call).row actions (word bits) continuation)
    (generatedZeroRow_canonical actions bits continuation admissible .call)
  simpa [fuelZeroScriptSourceConfiguration,
    fuelZeroFirstMutationConfiguration, Cursor.erase, ZeroPosition.row,
    zeroEnvironment, CheckpointDecoder.openEnvironment_word, FuelRow.term,
    FuelRow.target, FuelRow.localAddress, FuelRow.replacement, Term.replace?,
    C, b, actions] using! selected

theorem fuelZeroFirst_mixed_selects_second
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (depth : Nat) (continuation : Term)
    (admissible : Carrier.Admissible continuation)
    (outerParents : List ParentFrame)
    {layers : Nat} (shape : CleanParents program layout outerParents layers) :
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
  have selected := generatedFuelRow_mixed_selectStep? program layout bits
    continuation admissible outerParents shape depth
    ((ZeroPosition.first).row actions (word bits) continuation)
    (generatedZeroRow_canonical actions bits continuation admissible .first)
  simpa [fuelZeroFirstMutationConfiguration,
    fuelZeroSecondMutationConfiguration, Cursor.erase, ZeroPosition.row,
    zeroEnvironment, CheckpointDecoder.openEnvironment_word, FuelRow.term,
    FuelRow.target, FuelRow.localAddress, FuelRow.replacement, Term.replace?,
    C, b, actions] using! selected

theorem fuelZeroSecond_mixed_selects_third
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (depth : Nat) (continuation : Term)
    (admissible : Carrier.Admissible continuation)
    (outerParents : List ParentFrame)
    {layers : Nat} (shape : CleanParents program layout outerParents layers) :
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
  have selected := generatedFuelRow_mixed_selectStep? program layout bits
    continuation admissible outerParents shape depth
    ((ZeroPosition.second).row actions (word bits) continuation)
    (generatedZeroRow_canonical actions bits continuation admissible .second)
  simpa [fuelZeroSecondMutationConfiguration,
    fuelZeroThirdMutationConfiguration, Cursor.erase, ZeroPosition.row,
    zeroEnvironment, zeroAlpha, baseAlpha,
    CheckpointDecoder.openEnvironment_word, FuelRow.term, FuelRow.target,
    FuelRow.localAddress, FuelRow.replacement, Term.replace?, C, b, actions]
    using! selected

theorem fuelZeroThird_mixed_selects_fourth
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (depth : Nat) (continuation : Term)
    (admissible : Carrier.Admissible continuation)
    (outerParents : List ParentFrame)
    {layers : Nat} (shape : CleanParents program layout outerParents layers) :
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
  have selected := generatedFuelRow_mixed_selectStep? program layout bits
    continuation admissible outerParents shape depth
    ((ZeroPosition.third).row actions (word bits) continuation)
    (generatedZeroRow_canonical actions bits continuation admissible .third)
  simpa [fuelZeroThirdMutationConfiguration,
    fuelZeroFourthMutationConfiguration, Cursor.erase, ZeroPosition.row,
    zeroEnvironment, zeroAlpha, baseAlpha,
    CheckpointDecoder.openEnvironment_word, FuelRow.term, FuelRow.target,
    FuelRow.localAddress, FuelRow.replacement, Term.replace?, C, b, actions]
    using! selected

theorem fuelZeroFourth_mixed_selects_fifth
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (depth : Nat) (continuation : Term)
    (admissible : Carrier.Admissible continuation)
    (outerParents : List ParentFrame)
    {layers : Nat} (shape : CleanParents program layout outerParents layers) :
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
  have selected := generatedFuelRow_mixed_selectStep? program layout bits
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
theorem fuel_mixedSelectorChain
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (continuation : Term) (admissible : Carrier.Admissible continuation)
    (outerParents : List ParentFrame)
    {layers : Nat} (shape : CleanParents program layout outerParents layers) :
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
      have sourceFirst := fuelZeroScriptSource_mixed_selects_first program
        layout bits registers depth continuation admissible outerParents shape
      have phaseSourceFirst :
          RootResetPersistentResponseSelector.selectStep? program layout
              (fuelPhaseSourceConfiguration program layout registers 0
                environment continuation parents).cursor.erase =
            some first.cursor.erase := by
        simpa [fuelPhaseSourceConfiguration, fuelZeroScriptSourceConfiguration,
          environment, parents, first] using sourceFirst
      have firstSecond := fuelZeroFirst_mixed_selects_second program layout
        bits registers depth continuation admissible outerParents shape
      have secondThird := fuelZeroSecond_mixed_selects_third program layout
        bits registers depth continuation admissible outerParents shape
      have thirdFourth := fuelZeroThird_mixed_selects_fourth program layout
        bits registers depth continuation admissible outerParents shape
      have fourthFifth := fuelZeroFourth_mixed_selects_fifth program layout
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
      have sourceFirst := fuelPositiveScriptSource_mixed_selects_first program
        layout bits registers fuel depth continuation admissible outerParents shape
      have phaseSourceFirst :
          RootResetPersistentResponseSelector.selectStep? program layout
              (fuelPhaseSourceConfiguration program layout registers (fuel + 1)
                environment continuation parents).cursor.erase =
            some first.cursor.erase := by
        simpa [fuelPhaseSourceConfiguration,
          fuelPositiveScriptSourceConfiguration, environment, parents, first]
          using sourceFirst
      have firstSecond := fuelPositiveFirst_mixed_selects_second program layout
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
      have tail := fuel_mixedSelectorChain program layout bits registers
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




theorem positiveStage_mixed_exact_selectorChain
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (clockRegisters : SchedulerControl.Registers program)
    (outerParents : List ParentFrame) {layers : Nat} (shape : CleanParents program layout outerParents layers)
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
  have clockChain := clockLaunch_mixed_exact_selectorChain program layout bits clockRegisters fuel outerParents shape
  have fuelChain := SchedulerNestedPhase.fuelExactMutationChainAt program layout bits
    (SchedulerControl.Registers.newJob program) continuation outerParents (fuel + 1) 0
  have fuelSelected := fuel_mixedSelectorChain program layout bits (SchedulerControl.Registers.newJob program)
    continuation (Dovetail.clockExit_admissible (fuel + 1) fuel environment) outerParents shape (fuel + 1) 0
  have complete := SchedulerRecurrence.ExactMutationChain.append clockChain.1 fuelChain
  have completeSelected := RootResetExactTraceAgreement.SelectorChain.append clockChain.1 clockChain.2 fuelSelected
  simpa only [SchedulerNestedPhase.positiveStageConfigurationsAt, environment, continuation,
    List.append_assoc, List.singleton_append] using And.intro complete completeSelected


end PureSFormal.Research.RootResetMixedStagePhaseSelectorChain
