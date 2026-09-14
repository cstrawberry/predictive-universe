import PureSFormal.Research.RootResetFiniteClockFuelSelection
import PureSFormal.Research.RootResetMixedStagePhaseSelectorChain
import PureSFormal.Research.RootResetCleanParentPrefix

/-! Complete clock and fuel phases under the actual generated parent invariant. -/
namespace PureSFormal.Research.RootResetFiniteStagePhaseSelectorChain
open PureSFormal.PureS
open SchedulerInvariant
open RootResetCleanTraversableParents RootResetCleanParentPrefix
open RootResetMixedClockFuelSelectorChain RootResetFinitePrioritySelector
open RootResetClockFuelStages RootResetClockFuelCanonicalGrammar
open RootResetPersistentClockFuelAgreement RootResetResponseClockFuelAgreement
open RootResetMarkedClockSelectorChain RootResetEmptyHandoffContext
open RootResetEmptyContinuationSelector RootResetPersistentFuelCarrier

theorem positiveClockMutation_finiteParents_selects_next
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (stage wrappers remaining : Nat) (balance : wrappers + remaining + 1 = stage)
    (outerParents : List ParentFrame) {layers : Nat}
    (shape : CleanParents program layout outerParents layers) :
    selectStep? program layout
      (positiveClockMutationConfiguration program layout registers stage wrappers remaining
        (.left (environmentCode (compileActions program layout.tree) bits) :: outerParents)).cursor.erase =
      some (nextClockSample program layout registers stage wrappers bits outerParents remaining).cursor.erase := by
  rw [positiveClock_erase_rebuild]
  cases remaining with
  | zero =>
      have selected := RootResetFiniteClockFuelSelection.growth shape bits stage (wrappers + 1) 0 _ rfl
      rw [RootResetFiniteClockFuelSelection.clockParents_eq] at selected
      exact selected
  | succ remaining =>
      have selected := RootResetFiniteClockFuelSelection.growth shape bits stage (wrappers + 1) (remaining + 1) _ rfl
      rw [RootResetFiniteClockFuelSelection.clockParents_eq] at selected
      exact selected


theorem clockFirst_finiteParents_selects_first
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program) (stage : Nat)
    (outerParents : List ParentFrame) {layers : Nat}
    (shape : CleanParents program layout outerParents layers) :
    selectStep? program layout
      (clockPhaseSourceConfiguration program layout registers
        (.left (environmentCode (compileActions program layout.tree) bits) :: outerParents) (stage + 1)).cursor.erase =
      some (positiveClockMutationConfiguration program layout registers (stage + 1) 0 stage
        (.left (environmentCode (compileActions program layout.tree) bits) :: outerParents)).cursor.erase := by
  have selected := RootResetFiniteClockFuelSelection.growth shape bits (stage + 1) 0 (stage + 1) _ rfl
  exact selected


theorem clockCompleted_finiteParents_selects_launch
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program) (fuel : Nat)
    (outerParents : List ParentFrame) {layers : Nat}
    (shape : CleanParents program layout outerParents layers) :
    selectStep? program layout
      (clockPhaseCompletedConfiguration program layout registers (fuel + 1)
        (.left (environmentCode (compileActions program layout.tree) bits) :: outerParents)).cursor.erase =
      some (SchedulerNestedPhase.positiveStageLaunchConfigurationAt program layout fuel
        (environmentCode (compileActions program layout.tree) bits) outerParents).cursor.erase := by
  rw [clockPhaseCompleted_erase]
  exact RootResetFiniteClockFuelSelection.launch shape bits (fuel + 1) fuel


theorem clockTail_finiteSelectorChain
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (stage : Nat)
    (outerParents : List ParentFrame)
    {layers : Nat} (shape : CleanParents program layout outerParents layers) : ∀ wrappers remaining,
    wrappers + remaining + 1 = stage →
      RootResetExactTraceAgreement.SelectorChain
        (RootResetFinitePrioritySelector.selectStep? program layout)
        (positiveClockMutationConfiguration program layout registers stage
          wrappers remaining
          (.left (environmentCode (compileActions program layout.tree) bits) :: outerParents))
        (SchedulerNestedPhase.clockTailConfigurationsAt program layout bits
          registers stage outerParents wrappers remaining)
  | wrappers, 0, balance => by
      let closing := zeroClockMutationConfiguration program layout registers stage
        (wrappers + 1)
        (.left (environmentCode (compileActions program layout.tree) bits) :: outerParents)
      have selected := positiveClockMutation_finiteParents_selects_next program layout
        bits registers stage wrappers 0 (by simpa only [Nat.add_zero] using balance) outerParents shape
      have selected' : RootResetFinitePrioritySelector.selectStep? program
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
      have selected := positiveClockMutation_finiteParents_selects_next program layout
        bits registers stage wrappers (remaining + 1) balance outerParents shape
      have selected' : RootResetFinitePrioritySelector.selectStep? program
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
      have tail := clockTail_finiteSelectorChain program layout bits registers
        stage outerParents shape (wrappers + 1) remaining tailBalance
      simpa [SchedulerNestedPhase.clockTailConfigurationsAt, next] using
        (RootResetExactTraceAgreement.SelectorChain.next selected' tail)

theorem clock_finiteSelectorChain
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (stage : Nat)
    (outerParents : List ParentFrame)
    {layers : Nat} (shape : CleanParents program layout outerParents layers) :
    RootResetExactTraceAgreement.SelectorChain
      (RootResetFinitePrioritySelector.selectStep? program layout)
      (clockPhaseSourceConfiguration program layout registers
        (.left (environmentCode (compileActions program layout.tree) bits) :: outerParents)
        (stage + 1))
      (SchedulerNestedPhase.clockConfigurationsAt program layout bits registers
        outerParents stage) := by
  let first := positiveClockMutationConfiguration program layout registers
    (stage + 1) 0 stage
    (.left (environmentCode (compileActions program layout.tree) bits) :: outerParents)
  have selected := clockFirst_finiteParents_selects_first program layout bits registers stage outerParents shape
  have selected' : RootResetFinitePrioritySelector.selectStep? program layout
        (clockPhaseSourceConfiguration program layout registers
          (.left (environmentCode (compileActions program layout.tree) bits) :: outerParents) (stage + 1)).cursor.erase =
      some first.cursor.erase := by
    simpa [clockPhaseSourceConfiguration, positiveClockSourceConfiguration,
      clockFirstTerm, first] using selected
  have tail := clockTail_finiteSelectorChain program layout bits registers
    (stage + 1) outerParents shape 0 stage (by simp)
  simpa [SchedulerNestedPhase.clockConfigurationsAt, first] using
    (RootResetExactTraceAgreement.SelectorChain.next selected' tail)


theorem clockLaunch_finite_exact_selectorChain
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
  have clockSelected := clock_finiteSelectorChain program layout bits registers fuel outerParents shape
  have found := SchedulerNestedPhase.clockCompleted_seekLaunchAt program layout registers fuel bits outerParents
  have launchChain := SchedulerResponseInvariant.ExactMutationChain.next _ found
    (SchedulerResponseInvariant.ExactMutationChain.done 0 ⟨rfl, rfl⟩)
  have launchSelected := RootResetExactTraceAgreement.SelectorChain.next
    (clockCompleted_finiteParents_selects_launch program layout bits registers fuel outerParents shape)
    (RootResetExactTraceAgreement.SelectorChain.done _)
  exact ⟨SchedulerRecurrence.ExactMutationChain.append clockChain launchChain,
    RootResetExactTraceAgreement.SelectorChain.append clockChain clockSelected launchSelected⟩




theorem fuelPositiveScriptSource_finite_selects_first
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (fuel depth : Nat) (continuation : Term)
    (admissible : Carrier.Admissible continuation)
    (generated : ∃ horizon remaining, continuation = Dovetail.clockExit horizon remaining (environmentCode (compileActions program layout.tree) bits))
    (outerParents : List ParentFrame)
    {layers : Nat} (shape : CleanParents program layout outerParents layers) :
    RootResetFinitePrioritySelector.selectStep? program layout
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
  have selected := RootResetFiniteClockFuelSelection.call_pending shape depth (fuel + 1) bits continuation admissible
  simpa [fuelPositiveScriptSourceConfiguration,
    fuelPositiveFirstMutationConfiguration, Cursor.erase, FuelRow.term,
    FuelRow.target, FuelRow.localAddress, FuelRow.replacement, Term.replace?,
    C, b, actions] using! selected

theorem fuelPositiveFirst_finite_selects_second
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (fuel depth : Nat) (continuation : Term)
    (admissible : Carrier.Admissible continuation)
    (generated : ∃ horizon remaining, continuation = Dovetail.clockExit horizon remaining (environmentCode (compileActions program layout.tree) bits))
    (outerParents : List ParentFrame)
    {layers : Nat} (shape : CleanParents program layout outerParents layers) :
    RootResetFinitePrioritySelector.selectStep? program layout
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
  have selected := RootResetFiniteClockFuelSelection.positiveHalf_pending shape depth fuel bits continuation generated
  simpa [fuelPositiveFirstMutationConfiguration,
    fuelPositiveSecondMutationConfiguration, Cursor.erase, FuelRow.term,
    FuelRow.target, FuelRow.localAddress, FuelRow.replacement, Term.replace?,
    frame, actions] using! selected

theorem fuelZeroScriptSource_finite_selects_first
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (depth : Nat) (continuation : Term)
    (admissible : Carrier.Admissible continuation)
    (generated : ∃ horizon remaining, continuation = Dovetail.clockExit horizon remaining (environmentCode (compileActions program layout.tree) bits))
    (outerParents : List ParentFrame)
    {layers : Nat} (shape : CleanParents program layout outerParents layers) :
    RootResetFinitePrioritySelector.selectStep? program layout
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
  have selected := RootResetFiniteClockFuelSelection.zero_pending shape depth .call bits continuation generated
  simpa [fuelZeroScriptSourceConfiguration,
    fuelZeroFirstMutationConfiguration, Cursor.erase, ZeroPosition.row,
    zeroEnvironment, CheckpointDecoder.openEnvironment_word, FuelRow.term,
    FuelRow.target, FuelRow.localAddress, FuelRow.replacement, Term.replace?,
    C, b, actions] using! selected

theorem fuelZeroFirst_finite_selects_second
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (depth : Nat) (continuation : Term)
    (admissible : Carrier.Admissible continuation)
    (generated : ∃ horizon remaining, continuation = Dovetail.clockExit horizon remaining (environmentCode (compileActions program layout.tree) bits))
    (outerParents : List ParentFrame)
    {layers : Nat} (shape : CleanParents program layout outerParents layers) :
    RootResetFinitePrioritySelector.selectStep? program layout
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
  have selected := RootResetFiniteClockFuelSelection.zero_pending shape depth .first bits continuation generated
  simpa [fuelZeroFirstMutationConfiguration,
    fuelZeroSecondMutationConfiguration, Cursor.erase, ZeroPosition.row,
    zeroEnvironment, CheckpointDecoder.openEnvironment_word, FuelRow.term,
    FuelRow.target, FuelRow.localAddress, FuelRow.replacement, Term.replace?,
    C, b, actions] using! selected

theorem fuelZeroSecond_finite_selects_third
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (depth : Nat) (continuation : Term)
    (admissible : Carrier.Admissible continuation)
    (generated : ∃ horizon remaining, continuation = Dovetail.clockExit horizon remaining (environmentCode (compileActions program layout.tree) bits))
    (outerParents : List ParentFrame)
    {layers : Nat} (shape : CleanParents program layout outerParents layers) :
    RootResetFinitePrioritySelector.selectStep? program layout
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
  have selected := RootResetFiniteClockFuelSelection.zero_pending shape depth .second bits continuation generated
  simpa [fuelZeroSecondMutationConfiguration,
    fuelZeroThirdMutationConfiguration, Cursor.erase, ZeroPosition.row,
    zeroEnvironment, zeroAlpha, baseAlpha,
    CheckpointDecoder.openEnvironment_word, FuelRow.term, FuelRow.target,
    FuelRow.localAddress, FuelRow.replacement, Term.replace?, C, b, actions]
    using! selected

theorem fuelZeroThird_finite_selects_fourth
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (depth : Nat) (continuation : Term)
    (admissible : Carrier.Admissible continuation)
    (generated : ∃ horizon remaining, continuation = Dovetail.clockExit horizon remaining (environmentCode (compileActions program layout.tree) bits))
    (outerParents : List ParentFrame)
    {layers : Nat} (shape : CleanParents program layout outerParents layers) :
    RootResetFinitePrioritySelector.selectStep? program layout
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
  have selected := RootResetFiniteClockFuelSelection.zero_pending shape depth .third bits continuation generated
  simpa [fuelZeroThirdMutationConfiguration,
    fuelZeroFourthMutationConfiguration, Cursor.erase, ZeroPosition.row,
    zeroEnvironment, zeroAlpha, baseAlpha,
    CheckpointDecoder.openEnvironment_word, FuelRow.term, FuelRow.target,
    FuelRow.localAddress, FuelRow.replacement, Term.replace?, C, b, actions]
    using! selected

theorem fuelZeroFourth_finite_selects_fifth
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (depth : Nat) (continuation : Term)
    (admissible : Carrier.Admissible continuation)
    (generated : ∃ horizon remaining, continuation = Dovetail.clockExit horizon remaining (environmentCode (compileActions program layout.tree) bits))
    (outerParents : List ParentFrame)
    {layers : Nat} (shape : CleanParents program layout outerParents layers) :
    RootResetFinitePrioritySelector.selectStep? program layout
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
  have selected := RootResetFiniteClockFuelSelection.zero_pending shape depth .fourth bits continuation generated
  simpa [fuelZeroFourthMutationConfiguration,
    fuelZeroFifthMutationConfiguration, Cursor.erase, ZeroPosition.row,
    zeroEnvironment, zeroAlpha, baseAlpha, baseCarrier, baseBeta,
    CheckpointDecoder.openEnvironment_word, FuelRow.term, FuelRow.target,
    FuelRow.localAddress, FuelRow.replacement, Term.replace?, C, b, actions]
    using! selected

/-- Every contraction edge in the canonical recursive fuel phase is selected
by the response-aware bare-term selector. -/
theorem fuel_finiteSelectorChain
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (continuation : Term) (admissible : Carrier.Admissible continuation)
    (generated : ∃ horizon remaining, continuation = Dovetail.clockExit horizon remaining (environmentCode (compileActions program layout.tree) bits))
    (outerParents : List ParentFrame)
    {layers : Nat} (shape : CleanParents program layout outerParents layers) :
    ∀ fuel depth,
      RootResetExactTraceAgreement.SelectorChain
        (RootResetFinitePrioritySelector.selectStep? program layout)
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
      have sourceFirst := fuelZeroScriptSource_finite_selects_first program
        layout bits registers depth continuation admissible generated outerParents shape
      have phaseSourceFirst :
          RootResetFinitePrioritySelector.selectStep? program layout
              (fuelPhaseSourceConfiguration program layout registers 0
                environment continuation parents).cursor.erase =
            some first.cursor.erase := by
        simpa [fuelPhaseSourceConfiguration, fuelZeroScriptSourceConfiguration,
          environment, parents, first] using sourceFirst
      have firstSecond := fuelZeroFirst_finite_selects_second program layout
        bits registers depth continuation admissible generated outerParents shape
      have secondThird := fuelZeroSecond_finite_selects_third program layout
        bits registers depth continuation admissible generated outerParents shape
      have thirdFourth := fuelZeroThird_finite_selects_fourth program layout
        bits registers depth continuation admissible generated outerParents shape
      have fourthFifth := fuelZeroFourth_finite_selects_fifth program layout
        bits registers depth continuation admissible generated outerParents shape
      have chain : RootResetExactTraceAgreement.SelectorChain
          (RootResetFinitePrioritySelector.selectStep? program layout)
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
      have sourceFirst := fuelPositiveScriptSource_finite_selects_first program
        layout bits registers fuel depth continuation admissible generated outerParents shape
      have phaseSourceFirst :
          RootResetFinitePrioritySelector.selectStep? program layout
              (fuelPhaseSourceConfiguration program layout registers (fuel + 1)
                environment continuation parents).cursor.erase =
            some first.cursor.erase := by
        simpa [fuelPhaseSourceConfiguration,
          fuelPositiveScriptSourceConfiguration, environment, parents, first]
          using sourceFirst
      have firstSecond := fuelPositiveFirst_finite_selects_second program layout
        bits registers fuel depth continuation admissible generated outerParents shape
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
      have tail := fuel_finiteSelectorChain program layout bits registers
        continuation admissible generated outerParents shape fuel (depth + 1)
      have linked := RootResetExactTraceAgreement.SelectorChain.prepend suffix tail
      have chain : RootResetExactTraceAgreement.SelectorChain
          (RootResetFinitePrioritySelector.selectStep? program layout) source
          (first :: second ::
            SchedulerNestedPhase.fuelConfigurationsAt program layout bits
              registers continuation outerParents fuel (depth + 1)) :=
        .next phaseSourceFirst (.next firstSecond linked)
      simpa [SchedulerNestedPhase.fuelConfigurationsAt,
        fuelPhaseSourceConfiguration, source,
        fuelPositiveScriptSourceConfiguration, first, second, environment,
        parents, nextParents] using chain




theorem positiveStage_finite_exact_selectorChain
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
  have clockChain := clockLaunch_finite_exact_selectorChain program layout bits clockRegisters fuel outerParents shape
  have fuelChain := SchedulerNestedPhase.fuelExactMutationChainAt program layout bits
    (SchedulerControl.Registers.newJob program) continuation outerParents (fuel + 1) 0
  have fuelSelected := fuel_finiteSelectorChain program layout bits (SchedulerControl.Registers.newJob program)
    continuation (Dovetail.clockExit_admissible (fuel + 1) fuel environment) ⟨fuel + 1, fuel, rfl⟩ outerParents shape (fuel + 1) 0
  have complete := SchedulerRecurrence.ExactMutationChain.append clockChain.1 fuelChain
  have completeSelected := RootResetExactTraceAgreement.SelectorChain.append clockChain.1 clockChain.2 fuelSelected
  simpa only [SchedulerNestedPhase.positiveStageConfigurationsAt, environment, continuation,
    List.append_assoc, List.singleton_append] using And.intro complete completeSelected


end PureSFormal.Research.RootResetFiniteStagePhaseSelectorChain
