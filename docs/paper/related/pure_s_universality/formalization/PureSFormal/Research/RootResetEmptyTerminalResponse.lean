import PureSFormal.Research.RootResetInitialEmptySweep

/-!
# The terminal EMPTY response

The final generated carrier is either the initial Base or the last marked
response of the pending sweep.  Both cases have complete selector agreement
through the terminal frame's dispatcher response and COMMIT contraction.
-/

namespace PureSFormal.Research.RootResetEmptyTerminalResponse

open PureSFormal.PureS
open RootResetPersistentResponseSelector
open RootResetReachableStageGrammar
open RootResetWrappedFrameSelectorProof
open RootResetMarkedFrameSelectorProof
open RootResetWrappedEmptyCommit
open RootResetEmptyHandoffContext
open RootResetEmptySweepSelectorChain
open RootResetInitialEmptySweep

theorem emptySweepRegisters_succ_last
    (program : CTS.Program) (count : Nat) (registers : SchedulerControl.Registers program) :
    SchedulerCycle.emptySweepRegisters program (count + 1) registers =
      (SchedulerCycle.emptySweepRegisters program count registers).advanceEmpty := by
  induction count generalizing registers with
  | zero => rfl
  | succ count ih => exact ih registers.advanceEmpty

theorem emptySweepCarrier_succ_last
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation : Term) (count : Nat)
    (registers : SchedulerControl.Registers program) (carrier : Term) :
    SchedulerCycle.emptySweepCarrier program dispatcher bits continuation (count + 1) registers carrier =
      LocalResponse.markedCompleted bits continuation
        (SchedulerCycle.emptySweepCarrier program dispatcher bits continuation count registers carrier)
        (SchedulerResponse.completedRoute program dispatcher
          (SchedulerCycle.emptySweepRegisters program count registers) false
          (SchedulerCycle.emptySweepCarrier program dispatcher bits continuation count registers carrier)) := by
  induction count generalizing registers carrier with
  | zero => rfl
  | succ count ih =>
      exact ih registers.advanceEmpty (LocalResponse.markedCompleted bits continuation carrier
        (SchedulerResponse.completedRoute program dispatcher registers false carrier))

/-- The terminal frame has complete agreement for every generated sweep
length, including the zero-length sweep whose carrier is still the Base. -/
theorem generatedTerminal_frame_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (horizon remaining : Nat) (bound : remaining ≤ horizon)
    (count : Nat) (parents : List ParentFrame)
    {history : List (CheckpointDecoder.LocalView program)} :
    let continuation := exitTerm program dispatcher horizon remaining []
    let actions := compileActions program dispatcher.tree
    let initial := SchedulerNestedEmpty.initialEmptyRegisters program
    let registers := SchedulerCycle.emptySweepRegisters program count initial
    let carrier := SchedulerCycle.emptySweepCarrier program dispatcher [] continuation count initial
      (baseCarrier (environmentCode actions []) continuation)
    let active := frame (environmentCode actions []) continuation carrier
    MarkedPrefix program dispatcher.tree (Cursor.rebuild parents active) active
      (SchedulerInvariant.contextOfParents parents) history →
    ∃ samples,
      SchedulerResponseInvariant.ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerEmpty.markedPendingConfiguration program dispatcher registers [] continuation carrier parents)
        (SchedulerEmpty.frameConfiguration program dispatcher registers [] continuation carrier parents) samples ∧
      RootResetExactTraceAgreement.SelectorChain (selectStep? program dispatcher)
        (SchedulerEmpty.frameConfiguration program dispatcher registers [] continuation carrier parents) samples := by
  dsimp only
  intro shape
  cases count with
  | zero =>
      exact initialEmpty_frame_selectorChain program dispatcher _
        (exit_admissible program dispatcher horizon remaining []) 0 parents shape
  | succ count =>
      let continuation := exitTerm program dispatcher horizon remaining []
      let initial := SchedulerNestedEmpty.initialEmptyRegisters program
      let initialCarrier := baseCarrier (environmentCode (compileActions program dispatcher.tree) []) continuation
      have empty : CheckpointDecoder.decodeCarrier? program dispatcher.tree
          (SchedulerCycle.emptySweepCarrier program dispatcher [] continuation (count + 1) initial initialCarrier) =
          some [] :=
        CheckpointRun.decodeCarrier?_of_decode program dispatcher.tree [] continuation
          (exit_admissible program dispatcher horizon remaining [])
          (SchedulerNestedEmpty.emptySweepCarrier_decode program dispatcher continuation
            (exit_admissible program dispatcher horizon remaining []) (count + 1) initial)
      have tombstones := generatedEmptySweep_tombstoneCount program dispatcher continuation (count + 1)
      rw [emptySweepCarrier_succ_last] at empty tombstones shape ⊢
      rw [emptySweepRegisters_succ_last]
      exact markedOrigin_frame_selectorChain program dispatcher
        (SchedulerCycle.emptySweepRegisters program count initial) false []
        (SchedulerCycle.emptySweepCarrier program dispatcher [] continuation count initial initialCarrier)
        horizon remaining bound 0 parents empty tombstones shape

/-- Every contraction of an initially empty bounded job, from its fifth
zero-fuel sample through the terminal response's COMMIT, is selected exactly. -/
theorem initialEmpty_completeResponses_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (horizon remaining : Nat) (bound : remaining ≤ horizon)
    (count : Nat) (parents : List ParentFrame)
    {history : List (CheckpointDecoder.LocalView program)} :
    let continuation := exitTerm program dispatcher horizon remaining []
    let actions := compileActions program dispatcher.tree
    let environment := environmentCode actions []
    let initialCarrier := baseCarrier environment continuation
    let initial := SchedulerNestedEmpty.initialEmptyRegisters program
    let registers := SchedulerCycle.emptySweepRegisters program count initial
    let carrier := SchedulerCycle.emptySweepCarrier program dispatcher [] continuation count initial initialCarrier
    let active := pending actions [] continuation (count + 1) initialCarrier
    let fifth := SchedulerInvariant.fuelZeroFifthMutationConfiguration program dispatcher
      (SchedulerControl.Registers.newJob program) environment continuation
      (PrimitiveFuel.pendingParents environment continuation (count + 1) parents)
    MarkedPrefix program dispatcher.tree (Cursor.rebuild parents active) active
      (SchedulerInvariant.contextOfParents parents) history →
    ∃ samples,
      SchedulerResponseInvariant.ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerEmpty.markedPendingConfiguration program dispatcher registers [] continuation carrier parents)
        fifth samples ∧
      RootResetExactTraceAgreement.SelectorChain (selectStep? program dispatcher) fifth samples := by
  dsimp only
  intro shape
  let continuation := exitTerm program dispatcher horizon remaining []
  let actions := compileActions program dispatcher.tree
  let initial := SchedulerNestedEmpty.initialEmptyRegisters program
  let initialCarrier := baseCarrier (environmentCode actions []) continuation
  let carrier := SchedulerCycle.emptySweepCarrier program dispatcher [] continuation count initial initialCarrier
  obtain ⟨sweepSamples, sweepChain, sweepSelected⟩ := initialEmpty_from_fifth_selectorChain
    program dispatcher horizon remaining bound count parents shape
  have stopped : parseMarkedLocal? program dispatcher.tree
      (frame (environmentCode actions []) continuation carrier) = none := by
    rw [parseMarkedLocal?, frame_local_none]
  obtain ⟨terminalHistory, terminalShape⟩ := markedPrefix_replace shape stopped
  have terminalShape' : MarkedPrefix program dispatcher.tree
      (Cursor.rebuild parents (frame (environmentCode actions []) continuation carrier))
      (frame (environmentCode actions []) continuation carrier)
      (SchedulerInvariant.contextOfParents parents) terminalHistory := by
    rw [← SchedulerInvariant.contextOfParents_plug]
    exact terminalShape
  obtain ⟨terminalSamples, terminalChain, terminalSelected⟩ := generatedTerminal_frame_selectorChain
    program dispatcher horizon remaining bound count parents terminalShape'
  exact ⟨sweepSamples ++ terminalSamples,
    SchedulerRecurrence.ExactMutationChain.append sweepChain terminalChain,
    RootResetExactTraceAgreement.SelectorChain.append sweepChain sweepSelected terminalSelected⟩

end PureSFormal.Research.RootResetEmptyTerminalResponse
