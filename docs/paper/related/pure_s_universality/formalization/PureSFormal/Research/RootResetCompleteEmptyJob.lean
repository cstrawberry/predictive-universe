import PureSFormal.Research.RootResetMarkedFuelSelectorChain

/-!
# Complete initially empty jobs from their fuel source

The fuel phase, every pending and terminal response, and the continuation
handoff form one exact selector chain.  The completed outer context is carried
to the literal source of the next job or clock stage.
-/

namespace PureSFormal.Research.RootResetCompleteEmptyJob

open PureSFormal.PureS
open SchedulerInvariant
open SchedulerResponseInvariant
open SchedulerCompletedContext
open RootResetReachableStageGrammar
open RootResetPersistentResponseSelector
open RootResetWrappedFrameSelectorProof
open RootResetMarkedFrameSelectorProof
open RootResetEmptyHandoffContext
open RootResetInitialEmptySweep
open RootResetEmptyJobSelectorChain
open RootResetMarkedFuelSelectorChain

def sourceConfiguration (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (horizon remaining : Nat) (parents : List ParentFrame) :
    FiniteController.Configuration (SchedulerControl.Control program dispatcher) :=
  fuelPhaseSourceConfiguration program dispatcher (SchedulerControl.Registers.newJob program)
    horizon (environmentCode (compileActions program dispatcher.tree) [])
    (exitTerm program dispatcher horizon remaining []) parents

theorem fuelTerminal_eq_fifth (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (fuel remaining : Nat) (parents : List ParentFrame) :
    SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher []
      (SchedulerControl.Registers.newJob program) (exitTerm program dispatcher (fuel + 1) remaining [])
      parents (fuel + 1) 0 = fifthConfiguration program dispatcher (fuel + 1) remaining fuel parents := by
  simp only [SchedulerNestedPhase.fuelTerminalConfigurationAt, fuelSampleEndDepth_eq, Nat.zero_add]
  rfl

theorem fuelPrefix_exact_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (fuel remaining : Nat) (parents : List ParentFrame)
    {active : Term} {history : List (CheckpointDecoder.LocalView program)}
    (shape : MarkedPrefix program dispatcher.tree (Cursor.rebuild parents active) active
      (contextOfParents parents) history) :
    let samples := SchedulerNestedPhase.fuelConfigurationsAt program dispatcher []
      (SchedulerControl.Registers.newJob program) (exitTerm program dispatcher (fuel + 1) remaining [])
      parents (fuel + 1) 0
    ExactMutationChain (SchedulerControl.machine program dispatcher)
      (fifthConfiguration program dispatcher (fuel + 1) remaining fuel parents)
      (sourceConfiguration program dispatcher (fuel + 1) remaining parents) samples ∧
    RootResetExactTraceAgreement.SelectorChain (selectStep? program dispatcher)
      (sourceConfiguration program dispatcher (fuel + 1) remaining parents) samples := by
  dsimp only
  have chain := SchedulerNestedPhase.fuelExactMutationChainAt program dispatcher []
    (SchedulerControl.Registers.newJob program) (exitTerm program dispatcher (fuel + 1) remaining [])
    parents (fuel + 1) 0
  rw [fuelTerminal_eq_fifth] at chain
  have selected := fuel_markedSelectorChain program dispatcher []
    (SchedulerControl.Registers.newJob program) (exitTerm program dispatcher (fuel + 1) remaining [])
    (exit_admissible program dispatcher (fuel + 1) remaining []) parents shape (fuel + 1) 0
  exact ⟨chain, selected⟩

/-- The installed nonempty pending-frame stack is the literal active term
after the fuel prefix, in the same completed outer context. -/
theorem initialPending_placement
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (horizon remaining count : Nat) (parents : List ParentFrame)
    {active : Term} {history : List (CheckpointDecoder.LocalView program)}
    (shape : MarkedPrefix program dispatcher.tree (Cursor.rebuild parents active) active
      (contextOfParents parents) history) :
    ∃ nextHistory,
      MarkedPrefix program dispatcher.tree
        (Cursor.rebuild parents (initialPending program dispatcher horizon remaining count))
        (initialPending program dispatcher horizon remaining count)
        (contextOfParents parents) nextHistory := by
  have stopped : parseMarkedLocal? program dispatcher.tree
      (initialPending program dispatcher horizon remaining count) = none := by
    change parseMarkedLocal? program dispatcher.tree
      (frame (environmentCode (compileActions program dispatcher.tree) [])
        (exitTerm program dispatcher horizon remaining []) _) = none
    rw [parseMarkedLocal?, frame_local_none]
  obtain ⟨nextHistory, placed⟩ := markedPrefix_replace shape stopped
  exact ⟨nextHistory, by simpa only [contextOfParents_plug] using placed⟩

/-- A complete initially empty job with another launch remaining has exact
agreement from its fuel source to the next job's fuel source. -/
theorem nonterminal_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (fuel jobs : Nat) (bound : jobs + 1 ≤ fuel + 1)
    (parents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher parents layers)
    {active : Term} {history : List (CheckpointDecoder.LocalView program)}
    (shape : MarkedPrefix program dispatcher.tree (Cursor.rebuild parents active) active
      (contextOfParents parents) history) :
    let registers := terminalRegisters program fuel
    let carrier := terminalCarrier program dispatcher (fuel + 1) (jobs + 1) fuel
    let nextParents := SchedulerRootContinuation.emptyContinuationParents program dispatcher
      registers [] carrier parents
    let terminal := sourceConfiguration program dispatcher (fuel + 1) jobs nextParents
    let nextActive := Dovetail.jobSource (fuel + 1) jobs
      (environmentCode (compileActions program dispatcher.tree) [])
    ∃ samples targetHistory,
      ExactMutationChain (SchedulerControl.machine program dispatcher) terminal
        (sourceConfiguration program dispatcher (fuel + 1) (jobs + 1) parents) samples ∧
      RootResetExactTraceAgreement.SelectorChain (selectStep? program dispatcher)
        (sourceConfiguration program dispatcher (fuel + 1) (jobs + 1) parents) samples ∧
      MarkedPrefix program dispatcher.tree terminal.cursor.erase nextActive
        (contextOfParents nextParents) targetHistory ∧
      CompletedParents program dispatcher nextParents (layers + 1) := by
  dsimp only
  have fuelPrefix := fuelPrefix_exact_selectorChain program dispatcher fuel (jobs + 1) parents shape
  obtain ⟨_, placed⟩ := initialPending_placement program dispatcher (fuel + 1) (jobs + 1) fuel parents shape
  obtain ⟨responseSamples, targetHistory, responses, responseSelected, nextShape, nextOuter⟩ :=
    initialEmpty_nonterminal_job_selectorChain program dispatcher fuel jobs fuel bound parents layers outer placed
  exact ⟨_ ++ responseSamples, targetHistory,
    SchedulerRecurrence.ExactMutationChain.append fuelPrefix.1 responses,
    RootResetExactTraceAgreement.SelectorChain.append fuelPrefix.1 fuelPrefix.2 responseSelected,
    nextShape, nextOuter⟩

/-- A complete final initially empty job reaches the exact next-stage clock
source, with selector agreement on every sampled contraction. -/
theorem terminal_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (fuel : Nat) (parents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher parents layers)
    {active : Term} {history : List (CheckpointDecoder.LocalView program)}
    (shape : MarkedPrefix program dispatcher.tree (Cursor.rebuild parents active) active
      (contextOfParents parents) history) :
    let registers := terminalRegisters program fuel
    let carrier := terminalCarrier program dispatcher (fuel + 1) 0 fuel
    let nextParents := SchedulerRootContinuation.emptyContinuationParents program dispatcher
      registers [] carrier parents
    let terminal := SchedulerRootContinuation.nextStageSourceConfiguration program dispatcher (fuel + 1)
      (environmentCode (compileActions program dispatcher.tree) []) nextParents
    ∃ samples targetHistory,
      ExactMutationChain (SchedulerControl.machine program dispatcher) terminal
        (sourceConfiguration program dispatcher (fuel + 1) 0 parents) samples ∧
      RootResetExactTraceAgreement.SelectorChain (selectStep? program dispatcher)
        (sourceConfiguration program dispatcher (fuel + 1) 0 parents) samples ∧
      MarkedPrefix program dispatcher.tree terminal.cursor.erase (exitTerm program dispatcher (fuel + 1) 0 [])
        (contextOfParents nextParents) targetHistory := by
  dsimp only
  have fuelPrefix := fuelPrefix_exact_selectorChain program dispatcher fuel 0 parents shape
  obtain ⟨_, placed⟩ := initialPending_placement program dispatcher (fuel + 1) 0 fuel parents shape
  obtain ⟨responseSamples, targetHistory, responses, responseSelected, nextShape⟩ :=
    initialEmpty_terminal_job_selectorChain program dispatcher fuel fuel parents layers outer placed
  exact ⟨_ ++ responseSamples, targetHistory,
    SchedulerRecurrence.ExactMutationChain.append fuelPrefix.1 responses,
    RootResetExactTraceAgreement.SelectorChain.append fuelPrefix.1 fuelPrefix.2 responseSelected,
    nextShape⟩

end PureSFormal.Research.RootResetCompleteEmptyJob
