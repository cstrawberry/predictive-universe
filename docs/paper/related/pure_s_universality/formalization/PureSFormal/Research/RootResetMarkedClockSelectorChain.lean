import PureSFormal.Research.RootResetEmptyJobsSelectorChain

/-!
# Clock contraction prefixes inside completed marked histories

Every balanced clock-growth row retains its exact selected contraction after
completed EMPTY jobs have installed an arbitrary marked outer history.
-/

namespace PureSFormal.Research.RootResetMarkedClockSelectorChain

open PureSFormal.PureS
open SchedulerInvariant
open RootResetReachableStageGrammar
open RootResetClockFuelStages
open RootResetPersistentClockFuelAgreement
open RootResetResponseClockFuelAgreement
open RootResetPersistentResponseSelector
open RootResetMarkedFrameSelectorProof
open RootResetEmptyContinuationSelector

theorem clockPostPositive_marked_selectStep?
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage wrappers remaining : Nat) (bits : List Bool)
    (balance : wrappers + 1 + remaining = stage)
    {whole target : Term} {context : Context} {address : Address}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : MarkedPrefix program layout.tree whole
      (clockPostPositiveTerm program layout stage wrappers remaining bits) context history)
    (selected : RouteA.Selects program layout
      (clockPostPositiveTerm program layout stage wrappers remaining bits) target address) :
    selectStep? program layout whole = some (context.plug target) := by
  let term := clockPostPositiveTerm program layout stage wrappers remaining bits
  let outer := prependMarked context history ⟨term, .hole, [], [], []⟩
  have activeEq : RootResetPersistentRouteA.activeContext program layout whole = outer := by
    rw [activeContext_markedPrefix shape, activeContext_clockPostPositive]
  have fuelEq : RootResetPersistentRouteAFuel.fuelActiveContext program layout whole = outer := by
    rw [fuelActiveContext_markedPrefix shape, fuelActiveContext_clockPostPositive _ _ _ _ _ _ balance]
  have outerEq : responseOuter program layout whole = outer := by
    rw [responseOuter_markedPrefix shape, responseOuter_clockPostPositive _ _ _ _ _ _ balance]
  have fuelNone : RootResetPersistentFuelCarrier.parse? (compileActions program layout.tree) term = none :=
    parseFuelHandoff?_canonicalClock_none (by cases remaining <;> rfl)
      (clockPostPositive_canonical program layout stage wrappers remaining bits balance)
  have notSix : term.headArity ≠ 6 := by
    simp [term, clockPostPositiveTerm, clockGrowthCore, clockWrap]
  have result := selectStep?_of_recoveredOuter program layout whole target outer outerEq activeEq fuelEq
    (next?_clockPostPositive_none program layout stage wrappers remaining bits) fuelNone
    (parseLocal?_clockPostPositive_none program layout stage wrappers remaining bits) notSix
    (clockPostPositiveTerm_headArity_ne_two program layout stage wrappers remaining bits)
    (noFresh_marked_pending history.length 0) (noPendingMarked_marked_pending history.length 0)
    address selected.1 selected.2
  simpa only [outer, prependMarked, RootResetRuntimeContextBridge.context_comp_hole] using result

theorem positiveClock_erase_rebuild
    (program : CTS.Program) (layout : ActionDispatcher program)
    (registers : SchedulerControl.Registers program)
    (stage wrappers remaining : Nat) (bits : List Bool) (outerParents : List ParentFrame) :
    (positiveClockMutationConfiguration program layout registers stage wrappers remaining
      (.left (environmentCode (compileActions program layout.tree) bits) :: outerParents)).cursor.erase =
      Cursor.rebuild outerParents (clockPostPositiveTerm program layout stage wrappers remaining bits) := by
  rw [show (positiveClockMutationConfiguration program layout registers stage wrappers remaining
      (.left (environmentCode (compileActions program layout.tree) bits) :: outerParents)).cursor.erase =
      Cursor.rebuild (.left (environmentCode (compileActions program layout.tree) bits) :: outerParents)
        (clockGrowthCore stage (wrappers + 1) remaining) by
    exact erase_clockGrowth_after stage wrappers remaining _]
  rfl

def nextClockSample (program : CTS.Program) (layout : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (stage wrappers : Nat)
    (bits : List Bool) (outerParents : List ParentFrame) : Nat →
    FiniteController.Configuration (SchedulerControl.Control program layout)
  | 0 => zeroClockMutationConfiguration program layout registers stage (wrappers + 1)
      (.left (environmentCode (compileActions program layout.tree) bits) :: outerParents)
  | remaining + 1 => positiveClockMutationConfiguration program layout registers stage (wrappers + 1) remaining
      (.left (environmentCode (compileActions program layout.tree) bits) :: outerParents)

theorem nextClockSample_erase_rebuild
    (program : CTS.Program) (layout : ActionDispatcher program)
    (registers : SchedulerControl.Registers program)
    (stage wrappers remaining : Nat) (bits : List Bool) (outerParents : List ParentFrame) :
    (nextClockSample program layout registers stage wrappers bits outerParents remaining).cursor.erase =
      Cursor.rebuild outerParents (positiveClockSampleNextTerm program layout registers stage wrappers remaining bits) := by
  cases remaining with
  | zero =>
      simp only [nextClockSample, positiveClockSampleNextTerm, zeroClockMutation_erase]
      rfl
  | succ remaining =>
      rw [nextClockSample, positiveClock_erase_rebuild]
      rw [positiveClockSampleNextTerm, positiveClockMutation_erase_eq_clockPostPositiveTerm]

theorem positiveClockMutation_marked_selects_next
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (stage wrappers remaining : Nat) (balance : wrappers + remaining + 1 = stage)
    (outerParents : List ParentFrame)
    {active : Term} {history : List (CheckpointDecoder.LocalView program)}
    (shape : MarkedPrefix program layout.tree (Cursor.rebuild outerParents active) active
      (contextOfParents outerParents) history) :
    selectStep? program layout
      (positiveClockMutationConfiguration program layout registers stage wrappers remaining
        (.left (environmentCode (compileActions program layout.tree) bits) :: outerParents)).cursor.erase =
      some (nextClockSample program layout registers stage wrappers bits outerParents remaining).cursor.erase := by
  have postBalance : wrappers + 1 + remaining = stage := by
    calc
      wrappers + 1 + remaining = wrappers + (1 + remaining) := Nat.add_assoc _ _ _
      _ = wrappers + (remaining + 1) := by rw [Nat.add_comm 1 remaining]
      _ = wrappers + remaining + 1 := (Nat.add_assoc _ _ _).symm
      _ = stage := balance
  obtain ⟨targetHistory, placed⟩ := markedPrefix_replace shape
    (parseMarkedLocal?_clockPostPositive_none program layout stage wrappers remaining bits)
  have route := positiveClockSample_routeA program layout registers stage wrappers remaining bits balance
  rw [positiveClockMutation_erase_eq_clockPostPositiveTerm] at route
  have selected := clockPostPositive_marked_selectStep? program layout stage wrappers remaining bits
    postBalance placed route
  rw [contextOfParents_plug, contextOfParents_plug] at selected
  rw [positiveClock_erase_rebuild, nextClockSample_erase_rebuild]
  exact selected

theorem clockFirst_marked_selects_first
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program) (stage : Nat)
    (outerParents : List ParentFrame)
    {active : Term} {history : List (CheckpointDecoder.LocalView program)}
    (shape : MarkedPrefix program layout.tree (Cursor.rebuild outerParents active) active
      (contextOfParents outerParents) history) :
    selectStep? program layout
      (clockPhaseSourceConfiguration program layout registers
        (.left (environmentCode (compileActions program layout.tree) bits) :: outerParents) (stage + 1)).cursor.erase =
      some (positiveClockMutationConfiguration program layout registers (stage + 1) 0 stage
        (.left (environmentCode (compileActions program layout.tree) bits) :: outerParents)).cursor.erase := by
  obtain ⟨targetHistory, placed⟩ := markedPrefix_replace shape
    (parseMarkedLocal?_clockFirst_none program layout stage bits)
  have selected := selectStep?_markedPrefix_exit program layout stage 0 bits (Nat.zero_le _) placed
  rw [contextOfParents_plug, contextOfParents_plug] at selected
  exact selected

theorem clockTail_markedSelectorChain
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (stage : Nat)
    (outerParents : List ParentFrame)
    {active : Term} {history : List (CheckpointDecoder.LocalView program)}
    (shape : MarkedPrefix program layout.tree (Cursor.rebuild outerParents active) active
      (contextOfParents outerParents) history) : ∀ wrappers remaining,
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
      have selected := positiveClockMutation_marked_selects_next program layout
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
      have selected := positiveClockMutation_marked_selects_next program layout
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
      have tail := clockTail_markedSelectorChain program layout bits registers
        stage outerParents shape (wrappers + 1) remaining tailBalance
      simpa [SchedulerNestedPhase.clockTailConfigurationsAt, next] using
        (RootResetExactTraceAgreement.SelectorChain.next selected' tail)

theorem clock_markedSelectorChain
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (stage : Nat)
    (outerParents : List ParentFrame)
    {active : Term} {history : List (CheckpointDecoder.LocalView program)}
    (shape : MarkedPrefix program layout.tree (Cursor.rebuild outerParents active) active
      (contextOfParents outerParents) history) :
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
  have selected := clockFirst_marked_selects_first program layout bits registers stage outerParents shape
  have selected' : RootResetPersistentResponseSelector.selectStep? program layout
        (clockPhaseSourceConfiguration program layout registers
          (.left (environmentCode (compileActions program layout.tree) bits) :: outerParents) (stage + 1)).cursor.erase =
      some first.cursor.erase := by
    simpa [clockPhaseSourceConfiguration, positiveClockSourceConfiguration,
      clockFirstTerm, first] using selected
  have tail := clockTail_markedSelectorChain program layout bits registers
    (stage + 1) outerParents shape 0 stage (by simp)
  simpa [SchedulerNestedPhase.clockConfigurationsAt, first] using
    (RootResetExactTraceAgreement.SelectorChain.next selected' tail)


theorem clockCompleted_marked_selects_launch
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program) (fuel : Nat)
    (outerParents : List ParentFrame)
    {active : Term} {history : List (CheckpointDecoder.LocalView program)}
    (shape : MarkedPrefix program layout.tree (Cursor.rebuild outerParents active) active
      (contextOfParents outerParents) history) :
    selectStep? program layout
      (clockPhaseCompletedConfiguration program layout registers (fuel + 1)
        (.left (environmentCode (compileActions program layout.tree) bits) :: outerParents)).cursor.erase =
      some (SchedulerNestedPhase.positiveStageLaunchConfigurationAt program layout fuel
        (environmentCode (compileActions program layout.tree) bits) outerParents).cursor.erase := by
  have stopped : parseMarkedLocal? program layout.tree
      (RootResetEmptyHandoffContext.exitTerm program layout (fuel + 1) (fuel + 1) bits) = none := by
    rw [parseMarkedLocal?, RootResetEmptyHandoffContext.exit_local_none]
  obtain ⟨targetHistory, placed⟩ := markedPrefix_replace shape stopped
  have selected := selectStep?_markedPrefix_exit program layout (fuel + 1) (fuel + 1) bits
    (Nat.le_refl _) placed
  rw [contextOfParents_plug, contextOfParents_plug] at selected
  rw [clockPhaseCompleted_erase]
  exact selected

/-- The complete clock phase and its first job launch form an exact selected
sample chain inside the generated marked context. -/
theorem clockLaunch_exact_selectorChain
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program) (fuel : Nat)
    (outerParents : List ParentFrame)
    {active : Term} {history : List (CheckpointDecoder.LocalView program)}
    (shape : MarkedPrefix program layout.tree (Cursor.rebuild outerParents active) active
      (contextOfParents outerParents) history) :
    let environment := environmentCode (compileActions program layout.tree) bits
    let source := clockPhaseSourceConfiguration program layout registers (.left environment :: outerParents) (fuel + 1)
    let launch := SchedulerNestedPhase.positiveStageLaunchConfigurationAt program layout fuel environment outerParents
    let samples := SchedulerNestedPhase.clockConfigurationsAt program layout bits registers outerParents fuel ++ [launch]
    SchedulerResponseInvariant.ExactMutationChain (SchedulerControl.machine program layout) launch source samples ∧
      RootResetExactTraceAgreement.SelectorChain (selectStep? program layout) source samples := by
  dsimp only
  have clockChain := SchedulerNestedPhase.clockExactMutationChainAt program layout bits registers outerParents fuel
  have clockSelected := clock_markedSelectorChain program layout bits registers fuel outerParents shape
  have found := SchedulerNestedPhase.clockCompleted_seekLaunchAt program layout registers fuel bits outerParents
  have launchChain := SchedulerResponseInvariant.ExactMutationChain.next _ found
    (SchedulerResponseInvariant.ExactMutationChain.done 0 ⟨rfl, rfl⟩)
  have launchSelected := RootResetExactTraceAgreement.SelectorChain.next
    (clockCompleted_marked_selects_launch program layout bits registers fuel outerParents shape)
    (RootResetExactTraceAgreement.SelectorChain.done _)
  exact ⟨SchedulerRecurrence.ExactMutationChain.append clockChain launchChain,
    RootResetExactTraceAgreement.SelectorChain.append clockChain clockSelected launchSelected⟩

end PureSFormal.Research.RootResetMarkedClockSelectorChain
