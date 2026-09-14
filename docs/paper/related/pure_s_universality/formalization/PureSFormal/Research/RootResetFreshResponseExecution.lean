import PureSFormal.Research.RootResetFreshResponsePass
import PureSFormal.Research.RootResetCompletedResponseAgreement
import PureSFormal.Research.RootResetFreshAncestorExitAgreement

/-! Exact completed-response executions through the finite parent guard and
the root-started fresh-response priority pass. -/
namespace PureSFormal.Research.RootResetFreshResponseExecution
open PureSFormal.PureS
open FiniteController RootResetProbeSequence RootResetCompletedResponseAgreement RootResetCarrierNonemptyProbe

theorem nonpending_forwarded (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin endpoint : Cursor) (ready : Bool) (incoming : Probe.observeIncoming origin ≠ .right)
    (selected : Executes (RootResetCompletedResponseProbe.worker program tree false) origin ready endpoint) :
    Executes (RootResetScopedResponseProbes.completed program tree) origin ready endpoint := by
  let no := RootResetCompletedResponseProbe.worker program tree false
  let yes := RootResetEmptyAwareResponseProbe.worker program tree
  obtain ⟨ticks, state, actual, answered⟩ := selected
  obtain ⟨used, _, execution⟩ := RootResetScopedCarrierWorker.nonpending_runs program tree no yes
    (RootResetCompletedResponseProbe.terminal program tree false) origin endpoint ticks state ready actual answered
  have first : run (RootResetScopedResponseProbes.completed program tree).machine 1
      ((RootResetScopedResponseProbes.completed program tree).initial origin) =
      liftConfiguration RootResetScopedCarrierWorker.Control.nonpending (no.initial origin) := by
    change step (RootResetScopedCarrierWorker.machine program tree no yes) ⟨some .start, origin⟩ = _
    cases observed : Probe.observeIncoming origin with
    | root | left => simp only [step, RootResetScopedCarrierWorker.machine, RootResetScopedCarrierWorker.transition, observed]; rfl
    | right => exact False.elim (incoming observed)
  refine ⟨1 + (used + 1), .done ready, ?_, rfl⟩
  change run (RootResetScopedResponseProbes.completed program tree).machine _ _ = _
  rw [run_add, first]
  exact execution

theorem pending_forwarded (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin endpoint : Cursor) (ready : Bool) (incoming : Probe.observeIncoming origin = .right)
    (pending : RootResetPendingParentProbe.value program tree origin = true)
    (selected : Executes (RootResetEmptyAwareResponseProbe.worker program tree) origin ready endpoint) :
    Executes (RootResetScopedResponseProbes.completed program tree) origin ready endpoint := by
  let no := RootResetCompletedResponseProbe.worker program tree false
  let yes := RootResetEmptyAwareResponseProbe.worker program tree
  obtain ⟨p, _, pr⟩ := RootResetScopedCarrierWorker.pending_runs program tree no yes origin
  rw [pending] at pr
  obtain ⟨ticks, state, actual, answered⟩ := selected
  obtain ⟨used, _, execution⟩ := RootResetScopedCarrierWorker.admitted_runs program tree no yes
    (RootResetEmptyAwareResponseProbe.terminal program tree) origin endpoint ticks state ready actual answered
  have first : run (RootResetScopedResponseProbes.completed program tree).machine 1
      ((RootResetScopedResponseProbes.completed program tree).initial origin) =
      liftConfiguration RootResetScopedCarrierWorker.Control.pending (RootResetPendingParentProbe.initial program tree origin) := by
    change step (RootResetScopedCarrierWorker.machine program tree no yes) ⟨some .start, origin⟩ = _
    simp only [step, RootResetScopedCarrierWorker.machine, RootResetScopedCarrierWorker.transition, incoming]
    rfl
  refine ⟨1 + (p + 1) + (used + 1), .done ready, ?_, rfl⟩
  have enters : run (RootResetScopedResponseProbes.completed program tree).machine (1 + (p + 1))
      ((RootResetScopedResponseProbes.completed program tree).initial origin) =
      liftConfiguration RootResetScopedCarrierWorker.Control.admitted (yes.initial origin) := by
    rw [run_add, first]
    exact pr
  change run (RootResetScopedResponseProbes.completed program tree).machine _ _ = _
  rw [run_add, enters]
  exact execution

theorem candidate_forwarded (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (source : Term) (candidate endpoint : Cursor) (ticks : Nat) (ready : Bool)
    (candidateRun : run (RootResetResponseCandidateProbe.worker program tree).machine ticks
      ((RootResetResponseCandidateProbe.worker program tree).initial (Cursor.atRoot source)) = ⟨some (.done true), candidate⟩)
    (selected : Executes (RootResetScopedResponseProbes.completed program tree) candidate ready endpoint) :
    Executes (RootResetFreshResponsePass.worker program tree) (Cursor.atRoot source) ready endpoint := by
  let test := RootResetResponseCandidateProbe.worker program tree
  let yes := RootResetScopedResponseProbes.completed program tree
  let no := RootResetCompletedResponseProbe.rejectWorker
  obtain ⟨used, _, actual⟩ := RootResetProbeBranch.testing_runs test yes no
    (RootResetResponseCandidateProbe.terminal program tree) (Cursor.atRoot source) candidate ticks (.done true) true candidateRun rfl
  obtain ⟨queryTicks, state, queryRun, answered⟩ := selected
  obtain ⟨last, _, lastRun⟩ := RootResetProbeBranch.positive_runs test yes no
    (RootResetScopedResponseProbes.completed_terminal program tree) candidate endpoint queryTicks state ready queryRun answered
  refine ⟨used + 1 + (last + 1), .done ready, ?_, rfl⟩
  exact (run_add (RootResetProbeBranch.machine test yes no) (used + 1) (last + 1) _).trans
    ((congrArg (run (RootResetProbeBranch.machine test yes no) (last + 1)) actual).trans lastRun)

theorem candidate_missing (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (source : Term) (candidate : Cursor) (ticks : Nat)
    (candidateRun : run (RootResetResponseCandidateProbe.worker program tree).machine ticks
      ((RootResetResponseCandidateProbe.worker program tree).initial (Cursor.atRoot source)) = ⟨some (.done false), candidate⟩) :
    Executes (RootResetFreshResponsePass.worker program tree) (Cursor.atRoot source) false candidate := by
  let test := RootResetResponseCandidateProbe.worker program tree
  let yes := RootResetScopedResponseProbes.completed program tree
  let no := RootResetCompletedResponseProbe.rejectWorker
  obtain ⟨used, _, actual⟩ := RootResetProbeBranch.testing_runs test yes no
    (RootResetResponseCandidateProbe.terminal program tree) (Cursor.atRoot source) candidate ticks (.done false) false candidateRun rfl
  obtain ⟨last, _, lastRun⟩ := RootResetProbeBranch.negative_runs test yes no
    (RootResetCompletedResponseAtoms.code_terminal _) candidate candidate 0
    ⟨.answer false, List.Mem.head _⟩ false rfl rfl
  refine ⟨used + 1 + (last + 1), .done false, ?_, rfl⟩
  exact (run_add (RootResetProbeBranch.machine test yes no) (used + 1) (last + 1) _).trans
    ((congrArg (run (RootResetProbeBranch.machine test yes no) (last + 1)) actual).trans lastRun)

end PureSFormal.Research.RootResetFreshResponseExecution
