import PureSFormal.Research.RootResetResponseSelectorInitialAgreement
import PureSFormal.Research.RootResetResponseClockFuelAgreement
import PureSFormal.Research.RootResetFirstResponseSelectorChain
import PureSFormal.Research.RootResetTermOnlyTransfer

/-!
# Exact initial contraction prefixes

The generator prelude, positive clock, launch, and recursive fuel expansion
form eleven successive contractions.  A nonempty input contributes the next
selected-front contraction.  These certificates use the literal scheduler
configuration lists and the response-aware selector at every edge.
-/

namespace PureSFormal.Research.RootResetInitialContractionPrefix

open PureSFormal.PureS
open PureSFormal.PureS.SchedulerControl
open PureSFormal.PureS.SchedulerInvariant
open PureSFormal.PureS.SchedulerResponseInvariant
open RootResetExactTraceAgreement

/-- The complete generated prefix through the first Base-producing sample. -/
def clockFuelSamples (program : CTS.Program)
    (dispatcher : ActionDispatcher program) (bits : List Bool) :
    List (SchedulerInvariant.Configuration program dispatcher) :=
  SchedulerRecurrence.initialPreludeConfigurations program dispatcher bits ++
    SchedulerNestedPhase.positiveStageConfigurationsAt program dispatcher bits
      (Registers.newJob program) [] 0

/-- Literal terminal configuration of the first clock/fuel prefix. -/
def clockFuelTerminal (program : CTS.Program)
    (dispatcher : ActionDispatcher program) (bits : List Bool) :
    SchedulerInvariant.Configuration program dispatcher :=
  let environment := environmentCode (compileActions program dispatcher.tree) bits
  SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher bits
    (Registers.newJob program) (Dovetail.clockExit 1 0 environment) [] 1 0

@[simp]
theorem clockFuelSamples_length (program : CTS.Program)
    (dispatcher : ActionDispatcher program) (bits : List Bool) :
    (clockFuelSamples program dispatcher bits).length = 11 := by
  simp [clockFuelSamples]

/-- Every listed sample is the next actual mutation of the fixed scheduler. -/
theorem clockFuel_exactMutationChain (program : CTS.Program)
    (dispatcher : ActionDispatcher program) (bits : List Bool) :
    ExactMutationChain (SchedulerControl.machine program dispatcher)
      (clockFuelTerminal program dispatcher bits)
      (SchedulerControl.initialConfiguration program dispatcher bits)
      (clockFuelSamples program dispatcher bits) := by
  have phase := SchedulerNestedPhase.positiveStagePhaseInvariantAt program
    dispatcher bits (Registers.newJob program) (CTS.zeroPhase program) [] false
    (RegistersCoherent.initial program) [] 0
    (SchedulerCompletedContext.CompletedParents.root program dispatcher) 1 0
  exact SchedulerRecurrence.ExactMutationChain.append
    (SchedulerRecurrence.initialPreludeChain program dispatcher bits) phase.chain

/-- The same eleven edges are selected from their erased terms alone. -/
theorem clockFuel_selectorChain (program : CTS.Program)
    (dispatcher : ActionDispatcher program) (bits : List Bool) :
    SelectorChain
      (RootResetPersistentResponseSelector.selectStep? program dispatcher)
      (SchedulerControl.initialConfiguration program dispatcher bits)
      (clockFuelSamples program dispatcher bits) := by
  exact SelectorChain.append
    (SchedulerRecurrence.initialPreludeChain program dispatcher bits)
    (RootResetResponseSelectorInitialAgreement.initialPrelude_selectorChain
      program dispatcher bits)
    (RootResetResponseClockFuelAgreement.clockLaunchFuel_responseSelectorChain
      program dispatcher bits (Registers.newJob program) 0)

/-- All nonempty inputs have a twelve-edge exact selector-certified prefix. -/
theorem nonempty_twelveEdgePrefix (program : CTS.Program)
    (dispatcher : ActionDispatcher program) (bit : Bool) (suffix : List Bool) :
    ∃ terminal samples,
      samples.length = 12 ∧
      ExactMutationChain (SchedulerControl.machine program dispatcher) terminal
        (SchedulerControl.initialConfiguration program dispatcher (bit :: suffix))
        samples ∧
      SelectorChain
        (RootResetPersistentResponseSelector.selectStep? program dispatcher)
        (SchedulerControl.initialConfiguration program dispatcher (bit :: suffix))
        samples := by
  obtain ⟨outerContext, fullContext, innerContext, targetContext, descentTicks,
      ascentTicks, trace⟩ := SchedulerCycle.positiveStageFirstResponseTrace program
    dispatcher bit suffix (Registers.newJob program) (CTS.zeroPhase program) []
    false (RegistersCoherent.initial program) 1 0
  let c4 := SchedulerCycle.firstC4Configuration program dispatcher bit suffix 0
    outerContext innerContext
  obtain ⟨bound, _view, found, _parsed, _contracted⟩ :=
    RootResetPersistentRouteAFuelSchedulerBridge.positiveStageFifth_selects_exact_firstC4
      program dispatcher bit suffix (Registers.newJob program)
      (CTS.zeroPhase program) [] false (RegistersCoherent.initial program) 1 0 trace
  have seam : ExactMutationChain (SchedulerControl.machine program dispatcher)
      c4 (clockFuelTerminal program dispatcher (bit :: suffix)) [c4] := by
    exact .next bound found (.done 0 ⟨rfl, rfl⟩)
  have selectedSeam : SelectorChain
      (RootResetPersistentResponseSelector.selectStep? program dispatcher)
      (clockFuelTerminal program dispatcher (bit :: suffix)) [c4] := by
    exact RootResetFirstResponseSelectorChain.positiveStageFifth_firstC4_selectorChain
      program dispatcher bit suffix (Registers.newJob program)
      (CTS.zeroPhase program) [] false (RegistersCoherent.initial program) 1 0 trace
  refine ⟨c4, clockFuelSamples program dispatcher (bit :: suffix) ++ [c4], ?_,
    SchedulerRecurrence.ExactMutationChain.append
      (clockFuel_exactMutationChain program dispatcher (bit :: suffix)) seam,
    SelectorChain.append
      (clockFuel_exactMutationChain program dispatcher (bit :: suffix))
      (clockFuel_selectorChain program dispatcher (bit :: suffix)) selectedSeam⟩
  simp

/-- The response-aware selector agrees with the productive contraction run at
each of its first eleven edges, uniformly over the input word. -/
theorem selects_first_eleven (program : CTS.Program)
    (dispatcher : ActionDispatcher program) (bits : List Bool)
    (index : Nat) (within : index < 11) :
    let system := SampledGood.productiveSystem program dispatcher bits
      (SchedulerBound.bound program dispatcher)
      (SchedulerControl.initialConfiguration program dispatcher bits)
      (SchedulerRecurrence.initialGood program dispatcher bits)
    RootResetPersistentResponseSelector.selectStep? program dispatcher
        (system.contractionRun index).cursor.erase =
      some (system.contractionRun (index + 1)).cursor.erase := by
  simpa using SelectorChain.selects_contractionRun
    (clockFuel_exactMutationChain program dispatcher bits)
    (clockFuel_selectorChain program dispatcher bits)
    (SchedulerRecurrence.initialGood program dispatcher bits)
    (base := 0) (offset := index) rfl (by simpa using within)

/-- Nonempty inputs extend exact productive-run agreement through their first
selected-front deletion, the twelfth contraction. -/
theorem selects_first_twelve_nonempty (program : CTS.Program)
    (dispatcher : ActionDispatcher program) (bit : Bool) (suffix : List Bool)
    (index : Nat) (within : index < 12) :
    let bits := bit :: suffix
    let system := SampledGood.productiveSystem program dispatcher bits
      (SchedulerBound.bound program dispatcher)
      (SchedulerControl.initialConfiguration program dispatcher bits)
      (SchedulerRecurrence.initialGood program dispatcher bits)
    RootResetPersistentResponseSelector.selectStep? program dispatcher
        (system.contractionRun index).cursor.erase =
      some (system.contractionRun (index + 1)).cursor.erase := by
  obtain ⟨terminal, samples, count, exact, selected⟩ :=
    nonempty_twelveEdgePrefix program dispatcher bit suffix
  simpa using SelectorChain.selects_contractionRun exact selected
    (SchedulerRecurrence.initialGood program dispatcher (bit :: suffix))
    (base := 0) (offset := index) rfl (by simpa [count] using within)

/-- Agreement on a bounded prefix identifies literal selector iteration at
every sample through its endpoint. -/
theorem run_eq_of_prefix
    (selector : Term → Option Term) (path : Nat → Term) (bound : Nat)
    (selected : ∀ index, index < bound →
      selector (path index) = some (path (index + 1))) :
    ∀ index, index ≤ bound →
      RootResetTermOnlyTransfer.run selector index (path 0) = path index := by
  intro index
  induction index with
  | zero => intro _; rfl
  | succ index ih =>
      intro within
      have stepWithin : index < bound := Nat.lt_of_succ_le within
      rw [RootResetTermOnlyTransfer.run_succ, ih (Nat.le_of_lt stepWithin),
        selected index stepWithin]
      rfl

/-- Eleven fresh-root selector invocations produce the literal scheduler
samples for every encoded word. -/
theorem run_eq_first_eleven (program : CTS.Program)
    (dispatcher : ActionDispatcher program) (bits : List Bool)
    (index : Nat) (within : index ≤ 11) :
    let system := SampledGood.productiveSystem program dispatcher bits
      (SchedulerBound.bound program dispatcher)
      (SchedulerControl.initialConfiguration program dispatcher bits)
      (SchedulerRecurrence.initialGood program dispatcher bits)
    RootResetTermOnlyTransfer.run
        (RootResetPersistentResponseSelector.selectStep? program dispatcher)
        index (generator (compileActions program dispatcher.tree) bits) =
      (system.contractionRun index).cursor.erase := by
  apply run_eq_of_prefix
    (RootResetPersistentResponseSelector.selectStep? program dispatcher)
    (fun sample => ((SampledGood.productiveSystem program dispatcher bits
      (SchedulerBound.bound program dispatcher)
      (SchedulerControl.initialConfiguration program dispatcher bits)
      (SchedulerRecurrence.initialGood program dispatcher bits)).contractionRun
        sample).cursor.erase) 11
  · exact selects_first_eleven program dispatcher bits
  · exact within

/-- Twelve fresh-root selector invocations recover the same sampled terms on
every nonempty encoded word. -/
theorem run_eq_first_twelve_nonempty (program : CTS.Program)
    (dispatcher : ActionDispatcher program) (bit : Bool) (suffix : List Bool)
    (index : Nat) (within : index ≤ 12) :
    let bits := bit :: suffix
    let system := SampledGood.productiveSystem program dispatcher bits
      (SchedulerBound.bound program dispatcher)
      (SchedulerControl.initialConfiguration program dispatcher bits)
      (SchedulerRecurrence.initialGood program dispatcher bits)
    RootResetTermOnlyTransfer.run
        (RootResetPersistentResponseSelector.selectStep? program dispatcher)
        index (generator (compileActions program dispatcher.tree) bits) =
      (system.contractionRun index).cursor.erase := by
  apply run_eq_of_prefix
    (RootResetPersistentResponseSelector.selectStep? program dispatcher)
    (fun sample => ((SampledGood.productiveSystem program dispatcher (bit :: suffix)
      (SchedulerBound.bound program dispatcher)
      (SchedulerControl.initialConfiguration program dispatcher (bit :: suffix))
      (SchedulerRecurrence.initialGood program dispatcher (bit :: suffix))).contractionRun
        sample).cursor.erase) 12
  · exact selects_first_twelve_nonempty program dispatcher bit suffix
  · exact within

end PureSFormal.Research.RootResetInitialContractionPrefix
