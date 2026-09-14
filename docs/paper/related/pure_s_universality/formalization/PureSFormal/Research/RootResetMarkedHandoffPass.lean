import PureSFormal.Research.RootResetMarkedCandidateProbe
import PureSFormal.Research.RootResetPendingAncestorProbe
import PureSFormal.Research.RootResetCompletedResponseProbe

/-! Root-started marked handoff: enter the active context, recover its nearest
marked Local, then select the first pending ancestor above that Local. -/
namespace PureSFormal.Research.RootResetMarkedHandoffPass
open PureSFormal.PureS
open FiniteController RootResetProbeSequence

def pendingAnswer? {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)} :
    RootResetPendingAncestorProbe.Control program tree → Option Bool
  | .done ready => some ready
  | _ => none

def pendingWorker (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Worker :=
  ⟨RootResetPendingAncestorProbe.Control program tree, RootResetPendingAncestorProbe.machine program tree,
    .testing .start, pendingAnswer?⟩

theorem pending_terminal (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :
    (pendingWorker program tree).Terminal := by
  intro state ready answered origin ticks
  cases state with
  | done result => exact RootResetPendingAncestorProbe.done_absorbs program tree result origin ticks
  | testing _ | ascend => cases answered

theorem pending_readOnly (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :
    (pendingWorker program tree).ReadOnly := RootResetPendingAncestorProbe.mutationCount_zero program tree

def worker (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Worker :=
  RootResetProbeBranch.worker (RootResetMarkedCandidateProbe.worker program tree)
    (pendingWorker program tree) RootResetCompletedResponseProbe.rejectWorker

def coefficient (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Nat :=
  RootResetMarkedCandidateProbe.coefficient program tree + RootResetPendingAncestorProbe.coefficient program tree + 2

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
  RootResetProbeBranch.readOnly _ _ _ (RootResetMarkedCandidateProbe.readOnly program tree)
    (pending_readOnly program tree) (RootResetCompletedResponseAtoms.code_readOnly _ True.intro)

theorem all_input (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (source : Term) :
    ∃ ticks ready endpoint, ticks ≤ coefficient program tree * source.size ∧
      run (worker program tree).machine ticks ((worker program tree).initial (Cursor.atRoot source)) = ⟨some (.done ready), endpoint⟩ ∧
      endpoint.erase = source ∧ (if ready then endpoint.rdx?.isSome = true else True) := by
  let test := RootResetMarkedCandidateProbe.worker program tree
  let yes := pendingWorker program tree
  let no := RootResetCompletedResponseProbe.rejectWorker
  obtain ⟨ticks, found, candidate, bounded, actual, result⟩ := RootResetMarkedCandidateProbe.all_input program tree source
  obtain ⟨used, usedBound, execution⟩ := RootResetProbeBranch.testing_runs test yes no
    (RootResetMarkedCandidateProbe.terminal program tree) (Cursor.atRoot source) candidate ticks (.done found) found actual rfl
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
          (RootResetMarkedCandidateProbe.coefficient program tree) (RootResetPendingAncestorProbe.coefficient program tree)
          used 0 2 paid (Nat.zero_le _) (Nat.le_refl _)
      · exact (run_add (RootResetProbeBranch.machine test yes no) (used + 1) (0 + 1) _).trans
          ((congrArg (run (RootResetProbeBranch.machine test yes no) (0 + 1)) execution).trans afterRun)
  | true =>
      obtain ⟨queryTicks, ready, endpoint, queryBound, queryRun, first, facts⟩ :=
        RootResetPendingAncestorProbe.all_input program tree candidate
      obtain ⟨queryUsed, queryUsedBound, queryActual⟩ := RootResetProbeBranch.positive_runs test yes no
        (pending_terminal program tree) candidate endpoint queryTicks (.done ready) ready queryRun rfl
      have queryPaid := Nat.le_trans queryUsedBound queryBound
      rw [result.preserved] at queryPaid
      refine ⟨used + 1 + (queryUsed + 1), ready, endpoint, ?_, ?_, ?_, ?_⟩
      · simpa only [coefficient, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm, Cursor.atRoot, Cursor.erase, Cursor.rebuild]
          using combined_bound (Cursor.atRoot source) (RootResetMarkedCandidateProbe.coefficient program tree)
            (RootResetPendingAncestorProbe.coefficient program tree) used queryUsed 2 paid queryPaid (Nat.le_refl _)
      · exact (run_add (RootResetProbeBranch.machine test yes no) (used + 1) (queryUsed + 1) _).trans
          ((congrArg (run (RootResetProbeBranch.machine test yes no) (queryUsed + 1)) execution).trans queryActual)
      · have preserved := RootResetPendingAncestorProbe.erase_run program tree queryTicks (RootResetPendingAncestorProbe.initial program tree candidate)
        rw [queryRun] at preserved
        exact preserved.trans result.preserved
      · cases ready with
        | false => trivial
        | true => exact facts rfl

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

end PureSFormal.Research.RootResetMarkedHandoffPass

