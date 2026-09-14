import PureSFormal.Research.RootResetCompletedResponseAtoms
import PureSFormal.Research.RootResetProbeBranch

/-! Finite completed-response choice: oldest C4, COMMIT, or pending handoff. -/
namespace PureSFormal.Research.RootResetCompletedResponseProbe
open PureSFormal.PureS
open FiniteController RootResetProbeSequence RootResetProbeBranch RootResetCompletedResponseAtoms

def oldestAnswer? {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)} : RootResetCarrierOldestLiveProbe.Control program tree → Option Bool
  | .done ready => some ready
  | _ => none
def oldestWorker (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Worker :=
  ⟨RootResetCarrierOldestLiveProbe.Control program tree, RootResetCarrierOldestLiveProbe.machine program tree,
    .descending ⟨RootResetEdgeSpine.whole (RootResetCompleteCarrierRows.rows program tree), ProbeCompiler.Control.self_mem_nodes _⟩, oldestAnswer?⟩
theorem oldest_terminal (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : (oldestWorker program tree).Terminal := by
  intro state ready answered origin ticks
  cases state with
  | done result => exact RootResetCarrierOldestLiveProbe.done_absorbs program tree result origin ticks
  | descending _ | ascending _ | reading _ => cases answered
theorem oldest_readOnly (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : (oldestWorker program tree).ReadOnly :=
  RootResetCarrierOldestLiveProbe.mutationCount_zero program tree

def parityAnswer? {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)} : RootResetCarrierParityProbe.Control program tree → Option Bool
  | .done ready => some ready
  | _ => none
def parityWorker (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Worker :=
  ⟨RootResetCarrierParityProbe.Control program tree, RootResetCarrierParityProbe.machine program tree,
    .descending true ⟨RootResetEdgeSpine.whole (RootResetCompleteCarrierRows.rows program tree), ProbeCompiler.Control.self_mem_nodes _⟩, parityAnswer?⟩
theorem parity_terminal (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : (parityWorker program tree).Terminal := by
  intro state ready answered origin ticks
  cases state with
  | done result => exact RootResetCarrierParityProbe.done_absorbs program tree result origin ticks
  | descending _ _ | ascending _ _ | reading _ _ => cases answered
theorem parity_readOnly (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : (parityWorker program tree).ReadOnly :=
  RootResetCarrierParityProbe.mutationCount_zero program tree

def nonemptyAnswer? {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)} : RootResetCarrierNonemptyProbe.Control program tree → Option Bool
  | .done ready => some ready
  | _ => none
def nonemptyWorker (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Worker :=
  ⟨RootResetCarrierNonemptyProbe.Control program tree, RootResetCarrierNonemptyProbe.machine program tree,
    .descending ⟨RootResetEdgeSpine.whole (RootResetCarrierNonemptyRows.rows program tree), ProbeCompiler.Control.self_mem_nodes _⟩, nonemptyAnswer?⟩
theorem nonempty_terminal (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : (nonemptyWorker program tree).Terminal := by
  intro state ready answered origin ticks
  cases state with
  | done result => exact RootResetCarrierNonemptyProbe.done_absorbs program tree result origin ticks
  | descending _ | ascending _ _ | reading _ => cases answered
theorem nonempty_readOnly (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : (nonemptyWorker program tree).ReadOnly :=
  RootResetCarrierNonemptyProbe.mutationCount_zero program tree

def rejectWorker : Worker := codeWorker (.answer false)
def oldestOrCommit (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Worker :=
  RootResetProbeSequence.worker (oldestWorker program tree) (commitWorker program tree)
def body (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (pending : Bool) : Worker :=
  if pending then RootResetProbeBranch.worker (parityWorker program tree) (oldestOrCommit program tree) handoffWorker
  else RootResetProbeBranch.worker (nonemptyWorker program tree) rejectWorker (commitWorker program tree)
def worker (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (pending : Bool) : Worker :=
  RootResetProbeBranch.worker (guardWorker program tree) (body program tree pending) rejectWorker
abbrev Control (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (pending : Bool) := (worker program tree pending).Control
abbrev machine (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (pending : Bool) := (worker program tree pending).machine
def initial (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (pending : Bool) (origin : Cursor) :=
  (worker program tree pending).initial origin

theorem constant_bound (origin : Cursor) (value : Nat) : value ≤ value * origin.erase.size := by
  simpa only [Nat.mul_one] using Nat.mul_le_mul_left value (Term.size_pos origin.erase)
theorem focus_bound (origin : Cursor) : origin.focus.size ≤ origin.erase.size :=
  Nat.le_trans (Nat.le_add_left _ _) (RootResetProgressTotality.depth_add_focus_size_le_erase_size origin.focus origin.parents)
theorem nonempty_budget (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) :
    RootResetCarrierNonemptyProbe.budget program tree origin ≤ RootResetCarrierNonemptyProbe.coefficient program tree * origin.erase.size := by
  have first := Nat.mul_le_mul_left (RootResetEdgeSpine.coefficient (RootResetCarrierNonemptyRows.rows program tree)) (focus_bound origin)
  have middle := constant_bound origin RootResetCarrierNonemptyProbe.liveBound
  have last := constant_bound origin 3
  have combined := Nat.add_le_add (Nat.add_le_add_right (Nat.add_le_add first middle)
    (RootResetInverseEdgeSpine.coefficient (RootResetCarrierNonemptyRows.rows program tree) * origin.erase.size)) last
  simpa only [RootResetCarrierNonemptyProbe.budget, RootResetCarrierNonemptyProbe.coefficient, Nat.add_mul] using combined

theorem oldest_at (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor)
    (boundary : RootResetCompleteCarrierRows.Boundary origin) :
    RestoringAt (oldestWorker program tree) (RootResetCarrierOldestLiveProbe.coefficient program tree) origin := by
  obtain ⟨ticks, ready, endpoint, bounded, actual, facts⟩ := RootResetCarrierOldestLiveProbe.all_input program tree origin boundary
  exact ⟨ticks, ready, endpoint, .done ready, Nat.le_trans bounded (Nat.mul_le_mul_left _ (focus_bound origin)), actual, rfl, facts⟩
theorem parity_at (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor)
    (boundary : RootResetCompleteCarrierRows.Boundary origin) :
    QueryAt (parityWorker program tree) (RootResetCarrierParityProbe.coefficient program tree) origin := by
  obtain ⟨ticks, result, _, bounded, actual, _, _⟩ := RootResetCarrierParityProbe.all_input program tree true origin boundary
  exact ⟨ticks, result, .done result, bounded, actual, rfl⟩
theorem nonempty_at (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor)
    (boundary : RootResetCompleteCarrierRows.Boundary origin) :
    QueryAt (nonemptyWorker program tree) (RootResetCarrierNonemptyProbe.coefficient program tree) origin := by
  obtain ⟨ticks, descended, bounded, actual, _⟩ := RootResetCarrierInverseUnique.all_input_restores program tree origin boundary.1
  exact ⟨ticks, RootResetCarrierNonemptyAgreement.isLive? descended.focus, .done _, Nat.le_trans bounded (nonempty_budget program tree origin), actual, rfl⟩
theorem guard_at (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) :
    QueryAt (guardWorker program tree) (guardBound program tree) origin := by
  obtain ⟨ticks, state, bounded, actual, answered⟩ := guard_runs program tree origin
  exact ⟨ticks, _, state, Nat.le_trans bounded (constant_bound origin _), actual, answered⟩
theorem commit_at (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) :
    RestoringAt (commitWorker program tree) (commitBound program tree) origin := by
  obtain ⟨ticks, ready, endpoint, state, bounded, actual, answered, facts⟩ := commit_runs program tree origin
  exact ⟨ticks, ready, endpoint, state, Nat.le_trans bounded (constant_bound origin _), actual, answered, facts⟩
theorem handoff_at (origin : Cursor) : RestoringAt handoffWorker handoffBound origin := by
  obtain ⟨ticks, ready, endpoint, state, bounded, actual, answered, facts⟩ := handoff_runs origin
  exact ⟨ticks, ready, endpoint, state, Nat.le_trans bounded (constant_bound origin _), actual, answered, facts⟩
theorem reject_at (origin : Cursor) : RestoringAt rejectWorker 0 origin :=
  ⟨0, false, origin, ⟨.answer false, ProbeCompiler.Control.self_mem_nodes _⟩, Nat.zero_le _, rfl, rfl, rfl⟩

theorem sequence_at (first second : Worker) (firstCoefficient secondCoefficient : Nat)
    (firstTerminal : first.Terminal) (secondTerminal : second.Terminal) (origin : Cursor)
    (firstRestores : RestoringAt first firstCoefficient origin) (secondRestores : RestoringAt second secondCoefficient origin) :
    RestoringAt (RootResetProbeSequence.worker first second) (firstCoefficient + secondCoefficient + 2) origin := by
  obtain ⟨ticks, ready, endpoint, state, bounded, actual, answered, facts⟩ := firstRestores
  obtain ⟨used, usedBound, usedRun⟩ := RootResetProbeSequence.first_runs first second firstTerminal origin endpoint ticks state ready actual answered
  cases ready with
  | true =>
      refine ⟨used + 1, true, endpoint, .done true, ?_, usedRun, rfl, facts⟩
      simpa only [Nat.add_zero] using RootResetProbeSequence.combined_bound origin firstCoefficient secondCoefficient used 0 1
        (Nat.le_trans usedBound bounded) (Nat.zero_le _) (by decide)
  | false =>
      have same : endpoint = origin := facts
      subst endpoint
      obtain ⟨secondTicks, ready, endpoint, secondState, secondBound, secondRun, secondAnswer, secondFacts⟩ := secondRestores
      obtain ⟨secondUsed, secondUsedBound, secondActual⟩ := RootResetProbeSequence.second_runs first second secondTerminal origin endpoint secondTicks secondState ready secondRun secondAnswer
      refine ⟨used + 1 + (secondUsed + 1), ready, endpoint, .done ready, ?_, ?_, rfl, secondFacts⟩
      · simpa only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using RootResetProbeSequence.combined_bound origin firstCoefficient secondCoefficient used secondUsed 2
          (Nat.le_trans usedBound bounded) (Nat.le_trans secondUsedBound secondBound) (Nat.le_refl _)
      · change run (RootResetProbeSequence.machine first second) _ (RootResetProbeSequence.initial first second origin) = _
        rw [run_add, usedRun]
        exact secondActual

def oldestCoefficient (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Nat :=
  RootResetCarrierOldestLiveProbe.coefficient program tree + commitBound program tree + 2
def bodyCoefficient (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (pending : Bool) : Nat :=
  if pending then RootResetCarrierParityProbe.coefficient program tree + oldestCoefficient program tree + handoffBound + 2
  else RootResetCarrierNonemptyProbe.coefficient program tree + 0 + commitBound program tree + 2
def coefficient (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (pending : Bool) : Nat :=
  guardBound program tree + bodyCoefficient program tree pending + 0 + 2

theorem body_terminal (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (pending : Bool) : (body program tree pending).Terminal := by
  cases pending <;> exact RootResetProbeBranch.terminal _ _ _
theorem terminal (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (pending : Bool) : (worker program tree pending).Terminal :=
  RootResetProbeBranch.terminal _ _ _

theorem all_input (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (pending : Bool)
    (origin : Cursor) (boundary : RootResetCompleteCarrierRows.Boundary origin) :
    ∃ ticks ready endpoint, ticks ≤ coefficient program tree pending * origin.erase.size ∧
      run (machine program tree pending) ticks (initial program tree pending origin) = ⟨some (.done ready), endpoint⟩ ∧
      (if ready then endpoint.rdx?.isSome = true else endpoint = origin) := by
  have oldestRestores : RestoringAt (oldestOrCommit program tree) (oldestCoefficient program tree) origin :=
    sequence_at _ _ _ _ (oldest_terminal program tree) (code_terminal _) origin (oldest_at program tree origin boundary) (commit_at program tree origin)
  have bodyRestores : RestoringAt (body program tree pending) (bodyCoefficient program tree pending) origin := by
    cases pending with
    | false =>
        exact RootResetProbeBranch.restoring_at _ _ _ _ _ _ (nonempty_terminal program tree) (code_terminal _) (code_terminal _) origin
          (nonempty_at program tree origin boundary) (reject_at origin) (commit_at program tree origin)
    | true =>
        exact RootResetProbeBranch.restoring_at _ _ _ _ _ _ (parity_terminal program tree) (RootResetProbeSequence.terminal _ _) (code_terminal _) origin
          (parity_at program tree origin boundary) oldestRestores (handoff_at origin)
  obtain ⟨ticks, ready, endpoint, state, bounded, actual, answered, facts⟩ := RootResetProbeBranch.restoring_at _ _ _ _ _ _
    (code_terminal _) (body_terminal program tree pending) (code_terminal _) origin (guard_at program tree origin) bodyRestores (reject_at origin)
  cases state with
  | testing _ | positive _ | negative _ => cases answered
  | done result =>
      have same : result = ready := Option.some.inj answered
      subst result
      exact ⟨ticks, ready, endpoint, bounded, actual, facts⟩

theorem readOnly (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (pending : Bool) : (worker program tree pending).ReadOnly := by
  apply RootResetProbeBranch.readOnly
  · exact guard_readOnly program tree
  · cases pending with
    | false => exact RootResetProbeBranch.readOnly _ _ _ (nonempty_readOnly program tree) (code_readOnly _ True.intro) (commit_readOnly program tree)
    | true =>
        exact RootResetProbeBranch.readOnly _ _ _ (parity_readOnly program tree)
          (RootResetProbeSequence.readOnly _ _ (oldest_readOnly program tree) (commit_readOnly program tree)) handoff_readOnly
  · exact code_readOnly _ True.intro

theorem done_absorbs (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (pending ready : Bool) (origin : Cursor) (ticks : Nat) :
    run (machine program tree pending) ticks ⟨some (.done ready), origin⟩ = ⟨some (.done ready), origin⟩ :=
  RootResetProbeBranch.done_absorbs _ _ _ ready origin ticks

theorem mutationCount_zero (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (pending : Bool)
    (configuration : Configuration (Control program tree pending)) : mutationCount (machine program tree pending) configuration = 0 :=
  readOnly program tree pending configuration

theorem runMutationCount_zero (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (pending : Bool)
    (ticks : Nat) (configuration : Configuration (Control program tree pending)) : runMutationCount (machine program tree pending) ticks configuration = 0 := by
  induction ticks generalizing configuration with
  | zero => rfl
  | succ ticks ih => rw [runMutationCount, mutationCount_zero, ih, Nat.zero_add]

theorem erase_run (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (pending : Bool)
    (ticks : Nat) (configuration : Configuration (Control program tree pending)) :
    (run (machine program tree pending) ticks configuration).cursor.erase = configuration.cursor.erase := by
  have projected := run_projects_stepsN (machine program tree pending) ticks configuration
  rw [runMutationCount_zero] at projected
  exact (StepsN.eq_of_zero projected).symm

theorem bounded_terminal (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (pending ready : Bool)
    (origin endpoint : Cursor) (boundary : RootResetCompleteCarrierRows.Boundary origin) (ticks : Nat)
    (actual : run (machine program tree pending) ticks (initial program tree pending origin) = ⟨some (.done ready), endpoint⟩) :
    ∃ used, used ≤ coefficient program tree pending * origin.erase.size ∧
      run (machine program tree pending) used (initial program tree pending origin) = ⟨some (.done ready), endpoint⟩ := by
  obtain ⟨used, found, returned, bounded, execution, _⟩ := all_input program tree pending origin boundary
  have common := congrArg (run (machine program tree pending) used) actual
  rw [done_absorbs, ← run_add, Nat.add_comm, run_add, execution, done_absorbs] at common
  exact ⟨used, bounded, execution.trans common⟩

end PureSFormal.Research.RootResetCompletedResponseProbe
