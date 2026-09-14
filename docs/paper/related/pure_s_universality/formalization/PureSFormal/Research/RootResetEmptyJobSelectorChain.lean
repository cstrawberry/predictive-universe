import PureSFormal.Research.RootResetEmptyContinuationChain

/-!
# Complete initially empty response jobs

The exact pending sweep, terminal response, and continuation handoff compose
without losing any sampled contraction.  The resulting marked parent context
also contains the next job or the next clock phase at its literal placement.
-/

namespace PureSFormal.Research.RootResetEmptyJobSelectorChain

open PureSFormal.PureS
open RootResetPersistentResponseSelector
open RootResetReachableStageGrammar
open RootResetWrappedFrameSelectorProof
open RootResetMarkedFrameSelectorProof
open RootResetEmptyHandoffContext
open RootResetEmptyTerminalResponse
open RootResetEmptyContinuationChain
open SchedulerResponseInvariant
open SchedulerCompletedContext

/-- The response part of an initially empty job starts at the exact fifth
zero-fuel sample below its generated pending frames. -/
def fifthConfiguration (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (horizon remaining count : Nat) (parents : List ParentFrame) :
    FiniteController.Configuration (SchedulerControl.Control program dispatcher) :=
  let environment := environmentCode (compileActions program dispatcher.tree) []
  let continuation := exitTerm program dispatcher horizon remaining []
  SchedulerInvariant.fuelZeroFifthMutationConfiguration program dispatcher
    (SchedulerControl.Registers.newJob program) environment continuation
    (PrimitiveFuel.pendingParents environment continuation (count + 1) parents)

def initialPending (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (horizon remaining count : Nat) : Term :=
  let actions := compileActions program dispatcher.tree
  let continuation := exitTerm program dispatcher horizon remaining []
  pending actions [] continuation (count + 1)
    (baseCarrier (environmentCode actions []) continuation)

def terminalRegisters (program : CTS.Program) (count : Nat) : SchedulerControl.Registers program :=
  SchedulerCycle.emptySweepRegisters program count (SchedulerNestedEmpty.initialEmptyRegisters program)

def terminalCarrier (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (horizon remaining count : Nat) : Term :=
  let continuation := exitTerm program dispatcher horizon remaining []
  SchedulerCycle.emptySweepCarrier program dispatcher [] continuation count
    (SchedulerNestedEmpty.initialEmptyRegisters program)
    (baseCarrier (environmentCode (compileActions program dispatcher.tree) []) continuation)

/-- Replacing the active continuation after marking gives the exact new
parent context, with all stored continuation audits preserved. -/
theorem afterMarker_placement
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bits : List Bool)
    (carrier : Term) (horizon remaining : Nat) (parents : List ParentFrame)
    {active replacement : Term} {history : List (CheckpointDecoder.LocalView program)}
    (shape : MarkedPrefix program dispatcher.tree (Cursor.rebuild parents active) active
      (SchedulerInvariant.contextOfParents parents) history)
    (stopped : parseMarkedLocal? program dispatcher.tree replacement = none) :
    ∃ targetHistory,
      MarkedPrefix program dispatcher.tree
        (Cursor.rebuild (SchedulerRootContinuation.emptyContinuationParents program dispatcher
          registers bits carrier parents) replacement) replacement
        (SchedulerInvariant.contextOfParents
          (SchedulerRootContinuation.emptyContinuationParents program dispatcher
            registers bits carrier parents)) targetHistory := by
  obtain ⟨_, placed⟩ := markedExit_placement program dispatcher registers bits carrier
    horizon remaining parents shape
  obtain ⟨targetHistory, targetShape⟩ := markedPrefix_replace placed stopped
  exact ⟨targetHistory, by
    simpa only [SchedulerInvariant.contextOfParents_plug] using targetShape⟩

theorem jobSource_marked_none (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (horizon remaining : Nat) (environment : Term) :
    parseMarkedLocal? program dispatcher.tree (Dovetail.jobSource horizon remaining environment) = none := by
  have arity : (Dovetail.jobSource horizon remaining environment).headArity = 4 := by
    simp only [Dovetail.jobSource, Term.headArity,
      RootResetClockFuelCanonicalGrammar.carrierC_headArity]
  have localNone := CheckpointDecoder.parseLocal?_none_of_headArity program dispatcher.tree
    (Dovetail.jobSource horizon remaining environment)
    (by rw [arity]; decide) (by rw [arity]; decide)
  rw [parseMarkedLocal?, localNone]

/-- Every contraction from the fifth zero-fuel sample through a nonterminal
job launch agrees with the selector, for arbitrary sweep and outer history. -/
theorem initialEmpty_nonterminal_job_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (fuel jobs count : Nat) (bound : jobs + 1 ≤ fuel + 1)
    (parents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher parents layers)
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : MarkedPrefix program dispatcher.tree
      (Cursor.rebuild parents (initialPending program dispatcher (fuel + 1) (jobs + 1) count))
      (initialPending program dispatcher (fuel + 1) (jobs + 1) count)
      (SchedulerInvariant.contextOfParents parents) history) :
    let registers := terminalRegisters program count
    let carrier := terminalCarrier program dispatcher (fuel + 1) (jobs + 1) count
    let terminal := SchedulerNestedEmpty.nextEmptyJobSourceConfiguration program dispatcher
      fuel jobs registers carrier parents
    let nextParents := SchedulerRootContinuation.emptyContinuationParents program dispatcher
      registers [] carrier parents
    let nextActive := Dovetail.jobSource (fuel + 1) jobs
      (environmentCode (compileActions program dispatcher.tree) [])
    ∃ samples targetHistory,
      ExactMutationChain (SchedulerControl.machine program dispatcher) terminal
        (fifthConfiguration program dispatcher (fuel + 1) (jobs + 1) count parents) samples ∧
      RootResetExactTraceAgreement.SelectorChain (selectStep? program dispatcher)
        (fifthConfiguration program dispatcher (fuel + 1) (jobs + 1) count parents) samples ∧
      MarkedPrefix program dispatcher.tree terminal.cursor.erase nextActive
        (SchedulerInvariant.contextOfParents nextParents) targetHistory ∧
      CompletedParents program dispatcher nextParents (layers + 1) := by
  dsimp only
  obtain ⟨responseSamples, responseChain, responseSelected⟩ :=
    initialEmpty_completeResponses_selectorChain program dispatcher (fuel + 1) (jobs + 1)
      bound count parents shape
  obtain ⟨handoffSamples, handoffChain, handoffSelected, _, nextOuter⟩ :=
    nonterminalEmptyHandoff_selectorChain program dispatcher fuel jobs bound
      (terminalRegisters program count) (terminalCarrier program dispatcher (fuel + 1) (jobs + 1) count)
      parents layers outer shape
  obtain ⟨targetHistory, placed⟩ := afterMarker_placement program dispatcher
    (terminalRegisters program count) []
    (terminalCarrier program dispatcher (fuel + 1) (jobs + 1) count)
    (fuel + 1) (jobs + 1) parents shape
    (jobSource_marked_none program dispatcher (fuel + 1) jobs
      (environmentCode (compileActions program dispatcher.tree) []))
  exact ⟨responseSamples ++ handoffSamples, targetHistory,
    SchedulerRecurrence.ExactMutationChain.append responseChain handoffChain,
    RootResetExactTraceAgreement.SelectorChain.append responseChain responseSelected handoffSelected,
    placed, nextOuter⟩

/-- Every contraction from the fifth zero-fuel sample through the final
empty response is selected; the same exact term then enters the next stage. -/
theorem initialEmpty_terminal_job_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (fuel count : Nat) (parents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher parents layers)
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : MarkedPrefix program dispatcher.tree
      (Cursor.rebuild parents (initialPending program dispatcher (fuel + 1) 0 count))
      (initialPending program dispatcher (fuel + 1) 0 count)
      (SchedulerInvariant.contextOfParents parents) history) :
    let registers := terminalRegisters program count
    let carrier := terminalCarrier program dispatcher (fuel + 1) 0 count
    let environment := environmentCode (compileActions program dispatcher.tree) []
    let terminal := SchedulerRootContinuation.emptyNextStageSourceConfiguration program dispatcher
      registers [] (fuel + 1) environment carrier parents
    let nextParents := SchedulerRootContinuation.emptyContinuationParents program dispatcher
      registers [] carrier parents
    ∃ samples targetHistory,
      ExactMutationChain (SchedulerControl.machine program dispatcher) terminal
        (fifthConfiguration program dispatcher (fuel + 1) 0 count parents) samples ∧
      RootResetExactTraceAgreement.SelectorChain (selectStep? program dispatcher)
        (fifthConfiguration program dispatcher (fuel + 1) 0 count parents) samples ∧
      MarkedPrefix program dispatcher.tree terminal.cursor.erase
        (exitTerm program dispatcher (fuel + 1) 0 [])
        (SchedulerInvariant.contextOfParents nextParents) targetHistory := by
  dsimp only
  obtain ⟨responseSamples, responseChain, responseSelected⟩ :=
    initialEmpty_completeResponses_selectorChain program dispatcher (fuel + 1) 0
      (Nat.zero_le _) count parents shape
  have handoff := terminalEmptyHandoff_selectorChain program dispatcher fuel
    (terminalRegisters program count) (terminalCarrier program dispatcher (fuel + 1) 0 count)
    parents layers outer
  obtain ⟨targetHistory, placed⟩ := markedExit_placement program dispatcher
    (terminalRegisters program count) [] (terminalCarrier program dispatcher (fuel + 1) 0 count)
    (fuel + 1) 0 parents shape
  have chain := SchedulerRecurrence.ExactMutationChain.append responseChain handoff.1
  rw [List.append_nil] at chain
  exact ⟨responseSamples, targetHistory, chain, responseSelected, placed⟩

/-- The final empty job and the first mutation of the next stage form one
exact selector chain across the completed-history boundary. -/
theorem initialEmpty_terminal_job_firstClock_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (fuel count : Nat) (parents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher parents layers)
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : MarkedPrefix program dispatcher.tree
      (Cursor.rebuild parents (initialPending program dispatcher (fuel + 1) 0 count))
      (initialPending program dispatcher (fuel + 1) 0 count)
      (SchedulerInvariant.contextOfParents parents) history) :
    let registers := terminalRegisters program count
    let carrier := terminalCarrier program dispatcher (fuel + 1) 0 count
    let environment := environmentCode (compileActions program dispatcher.tree) []
    let first := SchedulerInvariant.positiveClockMutationConfiguration program dispatcher
      (SchedulerControl.Registers.newJob program) (fuel + 1 + 1) 0 (fuel + 1)
      (.left environment :: SchedulerRootContinuation.emptyContinuationParents program dispatcher
        registers [] carrier parents)
    ∃ samples,
      ExactMutationChain (SchedulerControl.machine program dispatcher) first
        (fifthConfiguration program dispatcher (fuel + 1) 0 count parents) samples ∧
      RootResetExactTraceAgreement.SelectorChain (selectStep? program dispatcher)
        (fifthConfiguration program dispatcher (fuel + 1) 0 count parents) samples := by
  dsimp only
  obtain ⟨responseSamples, responseChain, responseSelected⟩ :=
    initialEmpty_completeResponses_selectorChain program dispatcher (fuel + 1) 0
      (Nat.zero_le _) count parents shape
  have handoff := terminalEmptyHandoff_firstClock_selectorChain program dispatcher fuel
    (terminalRegisters program count) (terminalCarrier program dispatcher (fuel + 1) 0 count)
    parents layers outer shape
  exact ⟨responseSamples ++ [_],
    SchedulerRecurrence.ExactMutationChain.append responseChain handoff.1,
    RootResetExactTraceAgreement.SelectorChain.append responseChain responseSelected handoff.2⟩

end PureSFormal.Research.RootResetEmptyJobSelectorChain
