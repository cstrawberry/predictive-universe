import PureSFormal.Research.RootResetMarkedClockSelectorChain
import PureSFormal.Research.RootResetResponseSelectorInitialAgreement

/-!
# Every positive stage for the initially empty input

Complete clock, fuel, response, and continuation chains compose through every
positive stage.  Their increasing sample counts cover every contraction index
of the actual scheduler run on the empty immutable input.
-/

namespace PureSFormal.Research.RootResetEmptyStagesSelectorChain

open PureSFormal.PureS
open SchedulerInvariant
open SchedulerResponseInvariant
open SchedulerCompletedContext
open RootResetReachableStageGrammar
open RootResetPersistentResponseSelector
open RootResetMarkedFrameSelectorProof
open RootResetEmptyHandoffContext
open RootResetMarkedClockSelectorChain
open RootResetEmptyJobsSelectorChain

def stageConfiguration (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (fuel : Nat) (parents : List ParentFrame) :
    FiniteController.Configuration (SchedulerControl.Control program dispatcher) :=
  clockPhaseSourceConfiguration program dispatcher (SchedulerControl.Registers.newJob program)
    (.left (environmentCode (compileActions program dispatcher.tree) []) :: parents) (fuel + 1)

/-- Every contraction of one complete initially empty stage is selected,
and its exact marked context supports the next stage. -/
theorem stage_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (fuel : Nat) (parents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher parents layers)
    {active : Term} {history : List (CheckpointDecoder.LocalView program)}
    (shape : MarkedPrefix program dispatcher.tree (Cursor.rebuild parents active) active
      (contextOfParents parents) history) :
    let nextParents := finalParents program dispatcher fuel fuel parents
    ∃ samples nextLayers nextHistory,
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (stageConfiguration program dispatcher (fuel + 1) nextParents)
        (stageConfiguration program dispatcher fuel parents) samples ∧
      RootResetExactTraceAgreement.SelectorChain (selectStep? program dispatcher)
        (stageConfiguration program dispatcher fuel parents) samples ∧
      MarkedPrefix program dispatcher.tree
        (stageConfiguration program dispatcher (fuel + 1) nextParents).cursor.erase
        (exitTerm program dispatcher (fuel + 1) 0 [])
        (contextOfParents nextParents) nextHistory ∧
      CompletedParents program dispatcher nextParents nextLayers ∧
      1 ≤ samples.length := by
  dsimp only
  have clocks := clockLaunch_exact_selectorChain program dispatcher []
    (SchedulerControl.Registers.newJob program) fuel parents shape
  obtain ⟨jobSamples, nextLayers, nextHistory, jobs, jobsSelected, placed, nextOuter⟩ :=
    jobs_selectorChain program dispatcher fuel fuel (Nat.le_succ fuel) parents layers outer shape
  refine ⟨_ ++ jobSamples, nextLayers, nextHistory,
    SchedulerRecurrence.ExactMutationChain.append clocks.1 jobs,
    RootResetExactTraceAgreement.SelectorChain.append clocks.1 clocks.2 jobsSelected,
    placed, nextOuter, ?_⟩
  rw [List.length_append, List.length_append, List.length_singleton]
  exact Nat.le_trans (Nat.succ_le_succ (Nat.zero_le _)) (Nat.le_add_right _ _)

/-- Exact outer parents after a finite sequence of complete stages. -/
def parentsAfter (program : CTS.Program) (dispatcher : ActionDispatcher program) :
    Nat → Nat → List ParentFrame → List ParentFrame
  | 0, _, parents => parents
  | count + 1, fuel, parents => parentsAfter program dispatcher count (fuel + 1)
      (finalParents program dispatcher fuel fuel parents)

/-- Arbitrarily many complete initially empty stages have a single exact
selector chain whose length is at least the stage count. -/
theorem stages_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program) :
    ∀ count fuel (parents : List ParentFrame) (layers : Nat),
      CompletedParents program dispatcher parents layers →
    ∀ {active : Term} {history : List (CheckpointDecoder.LocalView program)},
      MarkedPrefix program dispatcher.tree (Cursor.rebuild parents active) active
        (contextOfParents parents) history →
    let nextParents := parentsAfter program dispatcher count fuel parents
    ∃ samples nextLayers nextHistory,
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (stageConfiguration program dispatcher (fuel + count) nextParents)
        (stageConfiguration program dispatcher fuel parents) samples ∧
      RootResetExactTraceAgreement.SelectorChain (selectStep? program dispatcher)
        (stageConfiguration program dispatcher fuel parents) samples ∧
      MarkedPrefix program dispatcher.tree
        (stageConfiguration program dispatcher (fuel + count) nextParents).cursor.erase
        (exitTerm program dispatcher (fuel + count) 0 [])
        (contextOfParents nextParents) nextHistory ∧
      CompletedParents program dispatcher nextParents nextLayers ∧
      count ≤ samples.length
  | 0, fuel, parents, layers, outer, _, _, shape => by
      have stopped : parseMarkedLocal? program dispatcher.tree
          (exitTerm program dispatcher fuel 0 []) = none := by
        rw [parseMarkedLocal?, exit_local_none]
      obtain ⟨nextHistory, placed⟩ := markedPrefix_replace shape stopped
      rw [contextOfParents_plug] at placed
      exact ⟨[], layers, nextHistory, .done 0 ⟨rfl, rfl⟩, .done _, placed, outer, Nat.zero_le _⟩
  | count + 1, fuel, parents, layers, outer, _, _, shape => by
      obtain ⟨firstSamples, middleLayers, middleHistory, firstChain, firstSelected, middleShape,
        middleOuter, firstLength⟩ := stage_selectorChain program dispatcher fuel parents layers outer shape
      obtain ⟨restSamples, nextLayers, nextHistory, restChain, restSelected, nextShape,
        nextOuter, restLength⟩ := stages_selectorChain program dispatcher count (fuel + 1) _
          middleLayers middleOuter middleShape
      have indexEq : fuel + 1 + count = fuel + (count + 1) := by
        rw [Nat.add_assoc, Nat.add_comm 1 count]
      rw [indexEq] at restChain nextShape
      refine ⟨firstSamples ++ restSamples, nextLayers, nextHistory,
        SchedulerRecurrence.ExactMutationChain.append firstChain restChain,
        RootResetExactTraceAgreement.SelectorChain.append firstChain firstSelected restSelected,
        nextShape, nextOuter, ?_⟩
      rw [List.length_append, Nat.add_comm count 1]
      exact Nat.add_le_add firstLength restLength

/-- From the actual initial configuration, exact selected prefixes exist
beyond every prescribed contraction index for the empty input. -/
theorem emptyInput_unbounded_exact_selectorChains
    (program : CTS.Program) (dispatcher : ActionDispatcher program) (count : Nat) :
    ∃ terminal samples,
      ExactMutationChain (SchedulerControl.machine program dispatcher) terminal
        (SchedulerControl.initialConfiguration program dispatcher []) samples ∧
      RootResetExactTraceAgreement.SelectorChain (selectStep? program dispatcher)
        (SchedulerControl.initialConfiguration program dispatcher []) samples ∧
      count ≤ samples.length := by
  have rootShape : MarkedPrefix program dispatcher.tree (exitTerm program dispatcher 0 0 [])
      (exitTerm program dispatcher 0 0 []) .hole [] := by
    apply MarkedPrefix.here
    rw [parseMarkedLocal?, exit_local_none]
  obtain ⟨samples, _, _, chain, selected, _, _, lengthBound⟩ :=
    stages_selectorChain program dispatcher count 0 [] 0
      (CompletedParents.root program dispatcher) rootShape
  have prelude := SchedulerRecurrence.initialPreludeChain program dispatcher []
  have preludeSelected := RootResetResponseSelectorInitialAgreement.initialPrelude_selectorChain program dispatcher []
  refine ⟨_, _ ++ samples,
    SchedulerRecurrence.ExactMutationChain.append prelude chain,
    RootResetExactTraceAgreement.SelectorChain.append prelude preludeSelected selected, ?_⟩
  rw [List.length_append]
  exact Nat.le_trans lengthBound (Nat.le_add_left _ _)

/-- Every contraction of the actual productive run on the initially empty
input agrees with the response-aware term-only selector. -/
theorem emptyInput_selectsEveryContractionRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program) (index : Nat) :
    let system := SchedulerInvariant.SampledGood.productiveSystem program dispatcher []
      (SchedulerBound.bound program dispatcher) (SchedulerControl.initialConfiguration program dispatcher [])
      (SchedulerRecurrence.initialGood program dispatcher [])
    selectStep? program dispatcher (system.contractionRun index).cursor.erase =
      some (system.contractionRun (index + 1)).cursor.erase := by
  obtain ⟨terminal, samples, chain, selected, lengthBound⟩ :=
    emptyInput_unbounded_exact_selectorChains program dispatcher (index + 1)
  simpa only [Nat.zero_add] using RootResetExactTraceAgreement.SelectorChain.selects_contractionRun chain selected
    (SchedulerRecurrence.initialGood program dispatcher [])
    (base := 0) (offset := index) rfl (Nat.lt_of_succ_le lengthBound)

end PureSFormal.Research.RootResetEmptyStagesSelectorChain
