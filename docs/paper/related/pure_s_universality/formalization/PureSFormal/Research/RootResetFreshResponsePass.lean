import PureSFormal.Research.RootResetResponseCandidateProbe
import PureSFormal.Research.RootResetScopedResponseProbes

/-! The actual root-started fresh-response priority pass: recover one current
candidate, validate its parent, and run the corresponding completed-response
query. A declined pass is read-only and may return a different cursor. -/
namespace PureSFormal.Research.RootResetFreshResponsePass
open PureSFormal.PureS
open FiniteController RootResetProbeSequence

def worker (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Worker :=
  RootResetProbeBranch.worker (RootResetResponseCandidateProbe.worker program tree)
    (RootResetScopedResponseProbes.completed program tree) RootResetCompletedResponseProbe.rejectWorker

def coefficient (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Nat :=
  RootResetResponseCandidateProbe.coefficient program tree + RootResetScopedResponseProbes.completedCoefficient program tree + 2

theorem terminal (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : (worker program tree).Terminal :=
  RootResetProbeBranch.terminal _ _ _

theorem terminal_stay (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (state : (worker program tree).Control) (node : Probe.NodeKind) (incoming : Probe.Incoming)
    (ended : ((worker program tree).answer? state).isSome = true) :
    (worker program tree).machine.transition state node incoming = .stay state := by
  cases state with
  | done ready => rfl
  | testing _ | positive _ | negative _ => cases ended

theorem readOnly (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : (worker program tree).ReadOnly :=
  RootResetProbeBranch.readOnly _ _ _ (RootResetResponseCandidateProbe.readOnly program tree)
    (RootResetScopedResponseProbes.completed_readOnly program tree) (RootResetCompletedResponseAtoms.code_readOnly _ True.intro)

theorem all_input (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (source : Term) :
    ∃ ticks ready endpoint, ticks ≤ coefficient program tree * source.size ∧
      run (worker program tree).machine ticks ((worker program tree).initial (Cursor.atRoot source)) = ⟨some (.done ready), endpoint⟩ ∧
      endpoint.erase = source ∧ (if ready then endpoint.rdx?.isSome = true else True) := by
  let test := RootResetResponseCandidateProbe.worker program tree
  let yes := RootResetScopedResponseProbes.completed program tree
  let no := RootResetCompletedResponseProbe.rejectWorker
  obtain ⟨ticks, found, candidate, bounded, actual, result⟩ := RootResetResponseCandidateProbe.all_input program tree source
  obtain ⟨used, usedBound, execution⟩ := RootResetProbeBranch.testing_runs test yes no
    (RootResetResponseCandidateProbe.terminal program tree) (Cursor.atRoot source) candidate ticks (.done found) found actual rfl
  have paid := Nat.le_trans usedBound bounded
  cases found with
  | false =>
      obtain ⟨afterUsed, afterBound, afterRun⟩ := RootResetProbeBranch.negative_runs test yes no
        (RootResetCompletedResponseAtoms.code_terminal (.answer false)) candidate candidate 0
        ⟨.answer false, ProbeCompiler.Control.self_mem_nodes _⟩ false rfl rfl
      have zero : afterUsed = 0 := Nat.eq_zero_of_le_zero afterBound
      subst afterUsed
      refine ⟨used + 1 + (0 + 1), false, candidate, ?_, ?_, result.preserved, trivial⟩
      · simpa only [coefficient, Nat.zero_add, Nat.add_zero, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm,
          Cursor.atRoot, Cursor.erase, Cursor.rebuild] using combined_bound (Cursor.atRoot source)
          (RootResetResponseCandidateProbe.coefficient program tree) (RootResetScopedResponseProbes.completedCoefficient program tree)
          used 0 2 paid (Nat.zero_le _) (Nat.le_refl _)
      · exact (run_add (RootResetProbeBranch.machine test yes no) (used + 1) (0 + 1) _).trans
          ((congrArg (run (RootResetProbeBranch.machine test yes no) (0 + 1)) execution).trans afterRun)
  | true =>
      obtain ⟨queryTicks, ready, endpoint, state, queryBound, queryRun, answered, facts⟩ :=
        RootResetScopedResponseProbes.completed_restoring program tree candidate
      obtain ⟨queryUsed, queryUsedBound, queryActual⟩ := RootResetProbeBranch.positive_runs test yes no
        (RootResetScopedResponseProbes.completed_terminal program tree) candidate endpoint queryTicks state ready queryRun answered
      have queryPaid := Nat.le_trans queryUsedBound queryBound
      rw [result.preserved] at queryPaid
      refine ⟨used + 1 + (queryUsed + 1), ready, endpoint, ?_, ?_, ?_, ?_⟩
      · simpa only [coefficient, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm, Cursor.atRoot, Cursor.erase, Cursor.rebuild]
          using combined_bound (Cursor.atRoot source) (RootResetResponseCandidateProbe.coefficient program tree)
            (RootResetScopedResponseProbes.completedCoefficient program tree) used queryUsed 2 paid queryPaid (Nat.le_refl _)
      · exact (run_add (RootResetProbeBranch.machine test yes no) (used + 1) (queryUsed + 1) _).trans
          ((congrArg (run (RootResetProbeBranch.machine test yes no) (queryUsed + 1)) execution).trans queryActual)
      · have preserved := yes.erase_run (RootResetScopedResponseProbes.completed_readOnly program tree) queryTicks (yes.initial candidate)
        rw [queryRun] at preserved
        exact preserved.trans result.preserved
      · cases ready with
        | false => trivial
        | true => exact facts

def probeSpec (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :
    RootResetReadonlySelector.ProbeSpec (worker program tree).Control where
  machine := (worker program tree).machine
  start := (worker program tree).start
  answer := (worker program tree).answer?
  terminal_stay := terminal_stay program tree
  mutation_zero := readOnly program tree
  coefficient := coefficient program tree
  all_input := by
    intro source
    obtain ⟨ticks, ready, endpoint, bounded, actual, preserved, facts⟩ := all_input program tree source
    refine ⟨ticks, .done ready, endpoint, Nat.le_trans bounded (Nat.mul_le_mul_left _ (Nat.le_succ _)), actual, rfl, preserved, ?_⟩
    intro successful
    have equal : ready = true := Option.some.inj successful
    subst ready
    exact facts

end PureSFormal.Research.RootResetFreshResponsePass
