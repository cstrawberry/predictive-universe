import PureSFormal.Research.RootResetEmptyContinuationSelector

/-!
# Exact continuation chains after terminal EMPTY responses

The new terminal marker extends the existing completed context.  Its clock
exit then either launches one more job by one selected contraction or enters
the next clock phase through a mutation-free continuation traversal.
-/

namespace PureSFormal.Research.RootResetEmptyContinuationChain

open PureSFormal.PureS
open RootResetPersistentResponseSelector
open RootResetReachableStageGrammar
open RootResetWrappedFrameSelectorProof
open RootResetMarkedFrameSelectorProof
open RootResetEmptyHandoffContext
open RootResetEmptyContinuationSelector
open SchedulerResponseInvariant
open SchedulerCompletedContext

/-- The literal continuation zipper is the context exposed by the marked
response parser. -/
theorem emptyContinuationParents_rebuild
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bits : List Bool)
    (carrier : Term) (horizon remaining : Nat) (parents : List ParentFrame)
    (replacement : Term) :
    Cursor.rebuild (SchedulerRootContinuation.emptyContinuationParents program dispatcher
      registers bits carrier parents) replacement =
      Cursor.rebuild parents ((localContinuationContext
        (markedExitTerm program dispatcher registers false bits carrier horizon remaining)).plug replacement) := by
  rfl

/-- The terminal marker adds its own exact continuation field to every
previously completed outer history. -/
theorem markedExit_placement
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bits : List Bool)
    (carrier : Term) (horizon remaining : Nat) (parents : List ParentFrame)
    {active : Term} {history : List (CheckpointDecoder.LocalView program)}
    (shape : MarkedPrefix program dispatcher.tree (Cursor.rebuild parents active) active
      (SchedulerInvariant.contextOfParents parents) history) :
    ∃ targetHistory,
      MarkedPrefix program dispatcher.tree
        (Cursor.rebuild parents
          (markedExitTerm program dispatcher registers false bits carrier horizon remaining))
        (exitTerm program dispatcher horizon remaining bits)
        (SchedulerInvariant.contextOfParents
          (SchedulerRootContinuation.emptyContinuationParents program dispatcher
            registers bits carrier parents)) targetHistory := by
  have stopped : parseMarkedLocal? program dispatcher.tree
      (exitTerm program dispatcher horizon remaining bits) = none := by
    rw [parseMarkedLocal?, exit_local_none]
  have inner := MarkedPrefix.local
    (markedExit_parsed program dispatcher registers false bits carrier horizon remaining)
    rfl (MarkedPrefix.here stopped)
  obtain ⟨targetHistory, targetShape⟩ := markedPrefix_graft shape inner
  refine ⟨targetHistory, ?_⟩
  change MarkedPrefix program dispatcher.tree
    ((SchedulerInvariant.contextOfParents parents).plug
      (markedExitTerm program dispatcher registers false bits carrier horizon remaining))
    (exitTerm program dispatcher horizon remaining bits)
    ((SchedulerInvariant.contextOfParents parents).comp
      ((localContinuationContext
        (markedExitTerm program dispatcher registers false bits carrier horizon remaining)).comp .hole))
    targetHistory at targetShape
  rw [SchedulerInvariant.contextOfParents_plug,
    RootResetRuntimeContextBridge.context_comp_hole] at targetShape
  have contexts : SchedulerInvariant.contextOfParents
      (SchedulerRootContinuation.emptyContinuationParents program dispatcher
        registers bits carrier parents) =
      (SchedulerInvariant.contextOfParents parents).comp
        (localContinuationContext
          (markedExitTerm program dispatcher registers false bits carrier horizon remaining)) := by
    change ((SchedulerInvariant.contextOfParents parents).comp
      (.appRight (SchedulerResponse.localContinuationLeft bits
        (Carrier.markedHField carrier carrier)
        (SchedulerResponse.completedRoute program dispatcher registers false carrier) carrier) .hole)).comp
      (.appLeft .hole carrier) = _
    rw [RootResetRuntimeContextBridge.context_comp_assoc]
    rfl
  rw [contexts]
  exact targetShape

/-- The contraction selected in the new marked term agrees with the literal
continuation zipper used by the scheduler. -/
theorem markedPending_selects_exit
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bits : List Bool)
    (carrier : Term) (horizon remaining : Nat) (bound : remaining ≤ horizon)
    (parents : List ParentFrame)
    {active : Term} {history : List (CheckpointDecoder.LocalView program)}
    (shape : MarkedPrefix program dispatcher.tree (Cursor.rebuild parents active) active
      (SchedulerInvariant.contextOfParents parents) history) :
    selectStep? program dispatcher
      (SchedulerEmpty.markedPendingConfiguration program dispatcher registers bits
        (exitTerm program dispatcher horizon remaining bits) carrier parents).cursor.erase =
      some (Cursor.rebuild (SchedulerRootContinuation.emptyContinuationParents program dispatcher
        registers bits carrier parents) (exitTarget program dispatcher horizon bits remaining)) := by
  obtain ⟨_, placed⟩ := markedExit_placement program dispatcher registers bits carrier
    horizon remaining parents shape
  simpa only [SchedulerInvariant.contextOfParents_plug] using!
    selectStep?_markedPrefix_exit program dispatcher horizon remaining bits bound placed

/-- In a one-sample exact chain, the sampled term is also the final term;
only cursor and control motion can follow that sample. -/
theorem singleton_sample_erase
    {State : Type} (machine : FiniteController.Machine State)
    {terminal before sample : FiniteController.Configuration State}
    (chain : ExactMutationChain machine terminal before [sample]) :
    sample.cursor.erase = terminal.cursor.erase := by
  cases chain with
  | next _ _ tail =>
      cases tail with
      | done ticks zero =>
          exact RootResetExactTraceAgreement.SelectorChain.erase_eq_of_zeroMutationRun zero

/-- Every nonterminal empty-job handoff has exactly one selected mutation.
Its structural outer-parent premise is inherited by the next job. -/
theorem nonterminalEmptyHandoff_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (fuel jobs : Nat) (bound : jobs + 1 ≤ fuel + 1)
    (registers : SchedulerControl.Registers program) (carrier : Term)
    (parents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher parents layers)
    {active : Term} {history : List (CheckpointDecoder.LocalView program)}
    (shape : MarkedPrefix program dispatcher.tree (Cursor.rebuild parents active) active
      (SchedulerInvariant.contextOfParents parents) history) :
    let continuation := exitTerm program dispatcher (fuel + 1) (jobs + 1) []
    let before := SchedulerEmpty.markedPendingConfiguration program dispatcher registers []
      continuation carrier parents
    let terminal := SchedulerNestedEmpty.nextEmptyJobSourceConfiguration program dispatcher
      fuel jobs registers carrier parents
    ∃ samples,
      ExactMutationChain (SchedulerControl.machine program dispatcher) terminal before samples ∧
      RootResetExactTraceAgreement.SelectorChain (selectStep? program dispatcher) before samples ∧
      samples.length = 1 ∧
      CompletedParents program dispatcher
        (SchedulerRootContinuation.emptyContinuationParents program dispatcher registers [] carrier parents)
        (layers + 1) := by
  dsimp only
  obtain ⟨samples, chain, _, lengthEq, nextOuter⟩ :=
    SchedulerNestedEmpty.nonterminalEmptyHandoff program dispatcher [] 0 fuel jobs
      registers carrier parents layers outer
  have selected := markedPending_selects_exit program dispatcher registers [] carrier
    (fuel + 1) (jobs + 1) bound parents shape
  cases samples with
  | nil => cases lengthEq
  | cons sample rest =>
      cases rest with
      | nil =>
          have eraseEq := singleton_sample_erase (SchedulerControl.machine program dispatcher) chain
          have selected' : selectStep? program dispatcher
              (SchedulerEmpty.markedPendingConfiguration program dispatcher registers []
                (exitTerm program dispatcher (fuel + 1) (jobs + 1) []) carrier parents).cursor.erase =
              some sample.cursor.erase := by
            rw [eraseEq]
            exact selected
          exact ⟨[sample], chain, .next selected' (.done sample), rfl, nextOuter⟩
      | cons second rest =>
          cases lengthEq

/-- The terminal empty-job handoff adds no sample: the literal arity-four
continuation traversal reaches the next clock source without contraction. -/
theorem terminalEmptyHandoff_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (fuel : Nat) (registers : SchedulerControl.Registers program) (carrier : Term)
    (parents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher parents layers) :
    let environment := environmentCode (compileActions program dispatcher.tree) []
    let continuation := exitTerm program dispatcher (fuel + 1) 0 []
    let before := SchedulerEmpty.markedPendingConfiguration program dispatcher registers []
      continuation carrier parents
    let terminal := SchedulerRootContinuation.emptyNextStageSourceConfiguration program dispatcher
      registers [] (fuel + 1) environment carrier parents
    ExactMutationChain (SchedulerControl.machine program dispatcher) terminal before [] ∧
      RootResetExactTraceAgreement.SelectorChain (selectStep? program dispatcher) before [] := by
  dsimp only
  obtain ⟨ticks, zero⟩ := SchedulerNestedEmpty.terminalEmptyPostMarker_zeroRun program dispatcher
    fuel registers carrier parents layers outer
  exact ⟨.done ticks zero, .done _⟩

/-- The arity-four handoff followed by the first clock contraction agrees
with the selector on the original marked response term. -/
theorem terminalEmptyHandoff_firstClock_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (fuel : Nat) (registers : SchedulerControl.Registers program) (carrier : Term)
    (parents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher parents layers)
    {active : Term} {history : List (CheckpointDecoder.LocalView program)}
    (shape : MarkedPrefix program dispatcher.tree (Cursor.rebuild parents active) active
      (SchedulerInvariant.contextOfParents parents) history) :
    let environment := environmentCode (compileActions program dispatcher.tree) []
    let continuation := exitTerm program dispatcher (fuel + 1) 0 []
    let before := SchedulerEmpty.markedPendingConfiguration program dispatcher registers []
      continuation carrier parents
    let first := SchedulerInvariant.positiveClockMutationConfiguration program dispatcher
      (SchedulerControl.Registers.newJob program) (fuel + 1 + 1) 0 (fuel + 1)
      (.left environment :: SchedulerRootContinuation.emptyContinuationParents program dispatcher
        registers [] carrier parents)
    ExactMutationChain (SchedulerControl.machine program dispatcher) first before [first] ∧
      RootResetExactTraceAgreement.SelectorChain (selectStep? program dispatcher) before [first] := by
  dsimp only
  obtain ⟨ticks, zero⟩ := SchedulerNestedEmpty.terminalEmptyPostMarker_zeroRun program dispatcher
    fuel registers carrier parents layers outer
  have clock := SchedulerInvariant.positiveClockMutation_seek program dispatcher
    (SchedulerControl.Registers.newJob program) (fuel + 1 + 1) 0 (fuel + 1)
    (.left (environmentCode (compileActions program dispatcher.tree) []) ::
      SchedulerRootContinuation.emptyContinuationParents program dispatcher registers [] carrier parents)
  have found := zero.seekMutation_prepend clock
  have selected := markedPending_selects_exit program dispatcher registers [] carrier
    (fuel + 1) 0 (Nat.zero_le _) parents shape
  exact ⟨.next _ found (.done 0 ⟨rfl, rfl⟩), .next selected (.done _)⟩

end PureSFormal.Research.RootResetEmptyContinuationChain
