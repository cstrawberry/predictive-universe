import PureSFormal.Research.RootResetScopedCarrierWorker
import PureSFormal.Research.RootResetBaseQueueProbe
import PureSFormal.Research.RootResetPendingAdmissionPatterns
import PureSFormal.Research.RootResetCompletedResponseAgreement

/-! A fixed pending-to-Base adapter. Its entry guard is a finite pattern;
the entered state remembers one R descent, so a failed Base query returns U.
No invocation cursor or unbounded parser is stored in finite control. -/
namespace PureSFormal.Research.RootResetPendingBaseProbe
open PureSFormal.PureS
open FiniteController RootResetProbeSequence
open RootResetCarrierNonemptyProbe (mapCommand liftConfiguration step_lift run_to_boundary
  commandCount_eq_mutationCount commandCount_map)
open RootResetCompletedResponseAtoms RootResetCompletedResponseAgreement RootResetCompletedResponseProbe

def base (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Worker :=
  RootResetScopedCarrierWorker.worker program tree (RootResetBaseQueueProbe.worker program tree)
    (RootResetBaseQueueProbe.worker program tree)

def baseCoefficient (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Nat :=
  RootResetScopedCarrierWorker.coefficient program tree (RootResetBaseQueueProbe.coefficient program tree)
    (RootResetBaseQueueProbe.coefficient program tree)

theorem base_terminal (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :
    (base program tree).Terminal := RootResetScopedCarrierWorker.terminal program tree _ _

theorem base_restoring (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :
    (base program tree).Restoring (baseCoefficient program tree) :=
  RootResetScopedCarrierWorker.restoring program tree _ _ _ _ (RootResetBaseQueueProbe.terminal program tree)
    (RootResetBaseQueueProbe.terminal program tree) (RootResetBaseQueueProbe.all_input program tree)
    (RootResetBaseQueueProbe.all_input program tree)

theorem base_readOnly (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :
    (base program tree).ReadOnly := RootResetScopedCarrierWorker.readOnly program tree _ _
      (RootResetBaseQueueProbe.readOnly program tree) (RootResetBaseQueueProbe.readOnly program tree)

inductive Control (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) where
  | start
  | base (pc : (base program tree).Control)
  | done (ready : Bool)

def cover (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : List (Control program tree) :=
  [.start, .done false, .done true] ++ (base program tree).machine.states.map .base

theorem covers (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (state : Control program tree) : state ∈ cover program tree := by
  cases state with
  | start => exact List.mem_append.mpr (Or.inl (List.Mem.head _))
  | done ready =>
      apply List.mem_append.mpr; apply Or.inl
      cases ready
      · exact List.Mem.tail _ (List.Mem.head _)
      · exact List.Mem.tail _ (List.Mem.tail _ (List.Mem.head _))
  | base pc => exact List.mem_append.mpr (Or.inr (RootResetCompletedLocalPatterns.map_member _
      ((base program tree).machine.covers pc)))

def transition (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (state : Control program tree) (node : Probe.NodeKind) (incoming : Probe.Incoming) : Command (Control program tree) :=
  match state with
  | .start => match node with
    | .s => .stay (.done false)
    | .app => .exec .R (.base (base program tree).start)
  | .base pc => match (base program tree).answer? pc with
    | some true => .stay (.done true)
    | some false => .exec .U (.done false)
    | none => mapCommand .base ((base program tree).machine.transition pc node incoming)
  | .done ready => .stay (.done ready)

def machine (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Machine (Control program tree) :=
  ⟨fun _ => cover program tree, covers program tree, transition program tree⟩

def answer? {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)} : Control program tree → Option Bool
  | .done ready => some ready
  | _ => none

def body (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Worker :=
  ⟨Control program tree, machine program tree, .start, answer?⟩

theorem base_step (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (configuration : Configuration (base program tree).Control) (running : ended? (base program tree) configuration = false) :
    step (machine program tree) (liftConfiguration Control.base configuration) =
      liftConfiguration Control.base (step (base program tree).machine configuration) := by
  apply step_lift
  intro state present
  rcases configuration with ⟨runtime, origin⟩
  have equal : runtime = some state := present
  subst runtime
  cases result : (base program tree).answer? state with
  | none => simp only [machine, transition, result]
  | some ready => simp only [ended?, result, Option.isSome_some] at running; cases running

theorem base_runs (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin endpoint : Cursor) (ticks : Nat) (state : (base program tree).Control) (ready : Bool)
    (actual : run (base program tree).machine ticks ((base program tree).initial origin) = ⟨some state, endpoint⟩)
    (answered : (base program tree).answer? state = some ready) :
    ∃ used, used ≤ ticks ∧ run (machine program tree) used
      (liftConfiguration Control.base ((base program tree).initial origin)) = ⟨some (.base state), endpoint⟩ := by
  obtain ⟨used, bounded, lifted⟩ := run_to_boundary (base program tree).machine (machine program tree) Control.base
    (ended? (base program tree)) (terminal_absorbs _ (base_terminal program tree)) (base_step program tree)
    ticks ((base program tree).initial origin) (by rw [actual]; exact congrArg Option.isSome answered)
  rw [actual] at lifted
  exact ⟨used, bounded, lifted⟩

theorem body_terminal (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :
    (body program tree).Terminal := by
  intro state ready answered origin ticks
  cases state with
  | start | base _ => cases answered
  | done result => induction ticks with
    | zero => rfl
    | succ ticks ih => exact ih

theorem body_readOnly (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :
    (body program tree).ReadOnly := by
  intro configuration
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => rfl
  | some state =>
      rw [← commandCount_eq_mutationCount]
      cases state with
      | start => cases Probe.observeNode cursor <;> rfl
      | done ready => rfl
      | base pc =>
          cases answered : (base program tree).answer? pc with
          | some ready => cases ready <;> simp only [body, machine, transition, answered] <;> rfl
          | none =>
              simp only [body, machine, transition, answered, commandCount_map]
              rw [commandCount_eq_mutationCount]
              exact base_readOnly program tree ⟨some pc, cursor⟩

theorem body_restoring (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :
    (body program tree).Restoring (baseCoefficient program tree + 2) := by
  rintro ⟨source, parents⟩
  cases source with
  | s =>
      refine ⟨1, false, ⟨.s, parents⟩, .done false, ?_, rfl, rfl, rfl⟩
      exact Nat.le_trans (Nat.le_trans (by decide : 1 ≤ 2) (Nat.le_add_left 2 (baseCoefficient program tree)))
        (RootResetCompletedResponseProbe.constant_bound _ _)
  | app function child =>
      let origin : Cursor := ⟨.app function child, parents⟩
      let entered : Cursor := ⟨child, .right function :: parents⟩
      obtain ⟨ticks, ready, endpoint, state, bounded, actual, answered, facts⟩ := base_restoring program tree entered
      obtain ⟨used, usedBound, lifted⟩ := base_runs program tree entered endpoint ticks state ready actual answered
      have enters : run (machine program tree) 1 ((body program tree).initial origin) =
          liftConfiguration Control.base ((base program tree).initial entered) := rfl
      have bound : 1 + used + 1 ≤ (baseCoefficient program tree + 2) * origin.erase.size := by
        have small : used ≤ baseCoefficient program tree * origin.erase.size := Nat.le_trans usedBound bounded
        have constants := RootResetCompletedResponseProbe.constant_bound origin 2
        rw [Nat.add_mul]
        simpa only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using Nat.add_le_add small constants
      have enteredRun := (run_add (machine program tree) 1 used _).trans
        ((congrArg (run (machine program tree) used) enters).trans lifted)
      cases ready with
      | false =>
          change endpoint = entered at facts
          subst endpoint
          refine ⟨1 + used + 1, false, origin, .done false, bound, ?_, rfl, rfl⟩
          refine (run_add (machine program tree) (1 + used) 1 _).trans
            ((congrArg (run (machine program tree) 1) enteredRun).trans ?_)
          simp only [run, step, machine, transition, answered]
          rfl
      | true =>
          refine ⟨1 + used + 1, true, endpoint, .done true, bound, ?_, rfl, facts⟩
          refine (run_add (machine program tree) (1 + used) 1 _).trans
            ((congrArg (run (machine program tree) 1) enteredRun).trans ?_)
          simp only [run, step, machine, transition, answered]
          rfl

def pattern (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Pattern :=
  RootResetPendingAdmissionPatterns.pendingPattern (compileActions program tree) (RootResetBaseQueueProbe.basePattern program tree)

def code (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : ProbeCompiler.Control :=
  RootResetCompletedLocalFragment.familyCode [pattern program tree] (.answer true) (.answer false)

def guard (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Worker := codeWorker (code program tree)

def guardBound (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Nat :=
  RootResetCompletedLocalFragment.familyBound [pattern program tree]

theorem guard_query (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) :
    ∃ ticks state, ticks ≤ guardBound program tree ∧ run (guard program tree).machine ticks
      ((guard program tree).initial origin) = ⟨some state, origin⟩ ∧
      (guard program tree).answer? state = some ((pattern program tree).matchesBool origin.focus) := by
  obtain ⟨member, actual⟩ := RootResetCompletedLocalFragment.family_runs [pattern program tree]
    (.answer true) (.answer false) (code program tree) origin (fun _ h => h)
  simp only [List.any_cons, List.any_nil, Bool.or_false] at member actual
  cases matched : (pattern program tree).matchesBool origin.focus <;>
    simp only [matched, Bool.false_eq_true, ↓reduceIte] at member actual ⊢ <;>
    exact ⟨_, ⟨.answer _, member⟩, RootResetCompletedLocalFragment.familyTicks_bound _ _, actual, rfl⟩

def worker (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Worker :=
  RootResetProbeBranch.worker (guard program tree) (body program tree) rejectWorker

def coefficient (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Nat :=
  guardBound program tree + (baseCoefficient program tree + 2) + 0 + 2

theorem terminal (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :
    (worker program tree).Terminal := RootResetProbeBranch.terminal _ _ _

theorem readOnly (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :
    (worker program tree).ReadOnly := RootResetProbeBranch.readOnly _ _ _
      (code_readOnly _ (RootResetCompletedLocalFragment.family_readOnly _ _ _ True.intro True.intro))
      (body_readOnly program tree) (code_readOnly _ True.intro)

theorem all_input (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :
    (worker program tree).Restoring (coefficient program tree) := by
  intro origin
  obtain ⟨ticks, state, bounded, actual, answered⟩ := guard_query program tree origin
  exact RootResetProbeBranch.restoring_at (guard program tree) (body program tree) rejectWorker (guardBound program tree) (baseCoefficient program tree + 2) 0 (code_terminal _) (body_terminal program tree)
    (code_terminal _) origin ⟨ticks, _, state, Nat.le_trans bounded (RootResetCompletedResponseProbe.constant_bound _ _), actual, answered⟩
    (body_restoring program tree origin) (reject_at origin)

theorem missed (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor)
    (refused : (pattern program tree).matchesBool origin.focus = false) :
    Executes (worker program tree) origin false origin := by
  obtain ⟨ticks, state, _, actual, answered⟩ := guard_query program tree origin
  rw [refused] at answered
  apply branch_no (guard program tree) (body program tree) rejectWorker (code_terminal _) (code_terminal _)
    origin origin false ⟨ticks, state, actual, answered⟩
  exact ⟨0, ⟨.answer false, List.Mem.head _⟩, rfl, rfl⟩

theorem body_selected (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (function child : Term) (parents : List ParentFrame) (endpoint : Cursor)
    (selected : Executes (base program tree) ⟨child, .right function :: parents⟩ true endpoint) :
    Executes (body program tree) ⟨.app function child, parents⟩ true endpoint := by
  obtain ⟨ticks, state, actual, answered⟩ := selected
  obtain ⟨used, _, lifted⟩ := base_runs program tree _ endpoint ticks state true actual answered
  have enters : run (machine program tree) 1 ((body program tree).initial ⟨.app function child, parents⟩) =
      liftConfiguration Control.base ((base program tree).initial ⟨child, .right function :: parents⟩) := rfl
  refine ⟨1 + used + 1, .done true, ?_, rfl⟩
  have enteredRun := (run_add (machine program tree) 1 used _).trans
    ((congrArg (run (machine program tree) used) enters).trans lifted)
  refine (run_add (machine program tree) (1 + used) 1 _).trans
    ((congrArg (run (machine program tree) 1) enteredRun).trans ?_)
  simp only [run, step, machine, transition, answered]
  rfl

theorem pending_selected (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (payload continuation child : Term) (parents : List ParentFrame) (endpoint : Cursor)
    (matched : (RootResetBaseQueueProbe.basePattern program tree).matchesBool child = true)
    (selected : Executes (base program tree) ⟨child,
      .right (.app (CheckpointDecoder.openEnvironment (compileActions program tree) payload) continuation) :: parents⟩ true endpoint) :
    Executes (worker program tree) ⟨.app (.app (CheckpointDecoder.openEnvironment
      (compileActions program tree) payload) continuation) child, parents⟩ true endpoint := by
  obtain ⟨ticks, state, _, actual, answered⟩ := guard_query program tree
    ⟨.app (.app (CheckpointDecoder.openEnvironment (compileActions program tree) payload) continuation) child, parents⟩
  have matchPending : (pattern program tree).matchesBool (.app (.app (CheckpointDecoder.openEnvironment (compileActions program tree) payload) continuation) child) = true := RootResetPendingAdmissionPatterns.pending_matches _ _ _ _ _ matched
  rw [matchPending] at answered
  exact branch_yes (guard program tree) (body program tree) rejectWorker (code_terminal _) (body_terminal program tree)
    _ endpoint true ⟨ticks, state, actual, answered⟩ (body_selected program tree _ child parents endpoint selected)

theorem scoped_pending_selected (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (payload continuation child : Term) (parents : List ParentFrame) (endpoint : Cursor)
    (selected : Executes (RootResetBaseQueueProbe.worker program tree) ⟨child,
      .right (.app (CheckpointDecoder.openEnvironment (compileActions program tree) payload) continuation) :: parents⟩ true endpoint) :
    Executes (base program tree) ⟨child,
      .right (.app (CheckpointDecoder.openEnvironment (compileActions program tree) payload) continuation) :: parents⟩ true endpoint := by
  let origin : Cursor := ⟨child, .right (.app (CheckpointDecoder.openEnvironment (compileActions program tree) payload) continuation) :: parents⟩
  obtain ⟨p, _, pr⟩ := RootResetScopedCarrierWorker.pending_runs program tree
    (RootResetBaseQueueProbe.worker program tree) (RootResetBaseQueueProbe.worker program tree) origin
  rw [RootResetPendingParentProbe.pending_value] at pr
  obtain ⟨ticks, state, actual, answered⟩ := selected
  obtain ⟨used, _, execution⟩ := RootResetScopedCarrierWorker.admitted_runs program tree
    (RootResetBaseQueueProbe.worker program tree) (RootResetBaseQueueProbe.worker program tree)
    (RootResetBaseQueueProbe.terminal program tree) origin endpoint ticks state true actual answered
  have first : run (base program tree).machine 1 ((base program tree).initial origin) =
      liftConfiguration RootResetScopedCarrierWorker.Control.pending (RootResetPendingParentProbe.initial program tree origin) := rfl
  refine ⟨1 + (p + 1) + (used + 1), .done true, ?_, rfl⟩
  change run (base program tree).machine _ _ = _
  have enters : run (base program tree).machine (1 + (p + 1)) ((base program tree).initial origin) =
      liftConfiguration RootResetScopedCarrierWorker.Control.admitted ((RootResetBaseQueueProbe.worker program tree).initial origin) := by
    rw [run_add, first]
    exact pr
  rw [run_add, enters]
  exact execution

theorem pending_base_selected (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (payload next continuation queue seed beta : Term) (parents : List ParentFrame) (endpoint : Cursor)
    (selected : Executes (RootResetBaseQueueProbe.worker program tree)
      ⟨CheckpointDecoder.openBase (compileActions program tree) continuation queue seed beta,
        .right (.app (CheckpointDecoder.openEnvironment (compileActions program tree) payload) next) :: parents⟩ true endpoint) :
    Executes (worker program tree) ⟨.app (.app (CheckpointDecoder.openEnvironment (compileActions program tree) payload) next)
      (CheckpointDecoder.openBase (compileActions program tree) continuation queue seed beta), parents⟩ true endpoint := by
  exact pending_selected program tree payload next _ parents endpoint
    (RootResetCarrierNonemptyRows.base_matches _ _ _ _ _)
    (scoped_pending_selected program tree payload next _ parents endpoint selected)

end PureSFormal.Research.RootResetPendingBaseProbe
