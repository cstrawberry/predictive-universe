import PureSFormal.Research.RootResetCompleteEmptyJob

/-!
# All initially empty jobs remaining in one stage

Induction on the residual job count composes complete fuel and response jobs.
Each handoff supplies the completed parents and exact marked placement needed
by the next induction step.
-/

namespace PureSFormal.Research.RootResetEmptyJobsSelectorChain

open PureSFormal.PureS
open SchedulerInvariant
open SchedulerResponseInvariant
open SchedulerCompletedContext
open RootResetReachableStageGrammar
open RootResetPersistentResponseSelector
open RootResetEmptyHandoffContext
open RootResetEmptyJobSelectorChain
open RootResetCompleteEmptyJob

/-- The exact nested parent stack after all residual empty jobs finish. -/
def finalParents (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (fuel : Nat) : Nat → List ParentFrame → List ParentFrame
  | 0, parents => SchedulerRootContinuation.emptyContinuationParents program dispatcher
      (terminalRegisters program fuel) [] (terminalCarrier program dispatcher (fuel + 1) 0 fuel) parents
  | jobs + 1, parents => finalParents program dispatcher fuel jobs
      (SchedulerRootContinuation.emptyContinuationParents program dispatcher
        (terminalRegisters program fuel) []
        (terminalCarrier program dispatcher (fuel + 1) (jobs + 1) fuel) parents)

/-- Every actual contraction of the remaining empty jobs is selected.  The
terminal state is the next clock source in its fully derived marked context. -/
theorem jobs_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program) (fuel : Nat) :
    ∀ jobs, jobs ≤ fuel + 1 →
    ∀ (parents : List ParentFrame) (layers : Nat),
      CompletedParents program dispatcher parents layers →
    ∀ {active : Term} {history : List (CheckpointDecoder.LocalView program)},
      MarkedPrefix program dispatcher.tree (Cursor.rebuild parents active) active
        (contextOfParents parents) history →
    let nextParents := finalParents program dispatcher fuel jobs parents
    let terminal := SchedulerRootContinuation.nextStageSourceConfiguration program dispatcher (fuel + 1)
      (environmentCode (compileActions program dispatcher.tree) []) nextParents
    ∃ samples targetLayers targetHistory,
      ExactMutationChain (SchedulerControl.machine program dispatcher) terminal
        (sourceConfiguration program dispatcher (fuel + 1) jobs parents) samples ∧
      RootResetExactTraceAgreement.SelectorChain (selectStep? program dispatcher)
        (sourceConfiguration program dispatcher (fuel + 1) jobs parents) samples ∧
      MarkedPrefix program dispatcher.tree terminal.cursor.erase (exitTerm program dispatcher (fuel + 1) 0 [])
        (contextOfParents nextParents) targetHistory ∧
      CompletedParents program dispatcher nextParents targetLayers
  | 0, _, parents, layers, outer, _, _, shape => by
      obtain ⟨samples, targetHistory, chain, selected, placed⟩ :=
        terminal_selectorChain program dispatcher fuel parents layers outer shape
      exact ⟨samples, layers + 1, targetHistory, chain, selected, placed,
        outer.empty (terminalRegisters program fuel) []
          (terminalCarrier program dispatcher (fuel + 1) 0 fuel)⟩
  | jobs + 1, bound, parents, layers, outer, _, _, shape => by
      obtain ⟨firstSamples, nextHistory, firstChain, firstSelected, nextShape, nextOuter⟩ :=
        nonterminal_selectorChain program dispatcher fuel jobs bound parents layers outer shape
      obtain ⟨restSamples, targetLayers, targetHistory, restChain, restSelected, finalShape, finalOuter⟩ :=
        jobs_selectorChain program dispatcher fuel jobs
          (Nat.le_trans (Nat.le_succ jobs) bound) _ (layers + 1) nextOuter nextShape
      exact ⟨firstSamples ++ restSamples, targetLayers, targetHistory,
        SchedulerRecurrence.ExactMutationChain.append firstChain restChain,
        RootResetExactTraceAgreement.SelectorChain.append firstChain firstSelected restSelected,
        finalShape, finalOuter⟩

end PureSFormal.Research.RootResetEmptyJobsSelectorChain
