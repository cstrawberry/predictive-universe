import PureSFormal.Research.RootResetCompletedLocalPatterns

/-!
# Finite completed-Local admission and continuation entry

A fixed program and dispatcher determine a finite pattern family and one
concrete finite controller. Every input is checked within an explicit
program-dependent constant. Ordinary mismatch restores its exact origin;
success certifies the requested-status completed Local parse and enters the
literal RL continuation. UU return preserves arbitrary enclosing parents
and rebuilds the shell around any replacement continuation. All runs are
read-only. Marked success is a valid continuation admission; fresh success
still requires the separate nonempty-carrier test.
-/
namespace PureSFormal.Research.RootResetCompletedLocalFragment

open PureSFormal.PureS
open FiniteController
open RootResetPatternFragment

def familyCode : List Pattern → Code → Code → Code
  | [], _, no => no
  | pattern :: patterns, yes, no => ProbeCompiler.compile pattern yes (familyCode patterns yes no)

def familyTicks : List Pattern → Term → Nat
  | [], _ => 0
  | pattern :: patterns, source => ProbeCompiler.probeCost pattern source +
      if pattern.matchesBool source then 0 else familyTicks patterns source

def familyBound : List Pattern → Nat
  | [] => 0
  | pattern :: patterns => ProbeCompiler.executionBound pattern + familyBound patterns

theorem familyTicks_bound (patterns : List Pattern) (source : Term) :
    familyTicks patterns source ≤ familyBound patterns := by
  induction patterns with
  | nil => exact Nat.le_refl _
  | cons pattern patterns ih =>
      have first := Nat.le_of_lt (ProbeCompiler.probeCost_lt_executionBound pattern source)
      cases matched : pattern.matchesBool source with
      | true =>
          simpa only [familyTicks, familyBound, matched, ↓reduceIte, Nat.add_zero] using
            Nat.le_trans first (Nat.le_add_right _ _)
      | false =>
          simpa only [familyTicks, familyBound, matched, Bool.false_eq_true, ↓reduceIte] using
            Nat.add_le_add first ih

theorem family_runs (patterns : List Pattern) (yes no whole : Code) (origin : Cursor)
    (included : ∀ pc, pc ∈ (familyCode patterns yes no).nodes → pc ∈ whole.nodes) :
    let firstMember := included _ (ProbeCompiler.Control.self_mem_nodes _)
    let selected := if patterns.any (fun pattern => pattern.matchesBool origin.focus) then yes else no
    ∃ selectedMember : selected ∈ whole.nodes,
      run (RootResetPatternFragment.machine whole) (familyTicks patterns origin.focus)
        ⟨some ⟨familyCode patterns yes no, firstMember⟩, origin⟩ =
        ⟨some ⟨selected, selectedMember⟩, origin⟩ := by
  dsimp only
  induction patterns with
  | nil => exact ⟨included _ (ProbeCompiler.Control.self_mem_nodes _), rfl⟩
  | cons pattern patterns ih =>
      obtain ⟨firstMember, firstRun⟩ := RootResetPatternFragment.compile_runs pattern yes
        (familyCode patterns yes no) whole origin included
      cases matched : pattern.matchesBool origin.focus with
      | true =>
          simp only [matched, ↓reduceIte] at firstMember firstRun
          simp only [List.any_cons, matched, Bool.true_or, ↓reduceIte,
            familyTicks, Nat.add_zero]
          exact ⟨firstMember, firstRun⟩
      | false =>
          simp only [matched, Bool.false_eq_true, ↓reduceIte] at firstMember firstRun
          have tailIncluded : ∀ pc, pc ∈ (familyCode patterns yes no).nodes → pc ∈ whole.nodes := by
            intro pc member
            apply included
            have selectedMember := ProbeCompiler.selected_nodes_in_compile pattern yes
              (familyCode patterns yes no) origin.focus pc
            simp only [matched, Bool.false_eq_true, ↓reduceIte] at selectedMember
            exact selectedMember member
          obtain ⟨lastMember, lastRun⟩ := ih tailIncluded
          simp only [List.any_cons, matched, Bool.false_or, familyTicks,
            Bool.false_eq_true, ↓reduceIte]
          refine ⟨lastMember, ?_⟩
          simp only [familyCode]
          rw [run_add, firstRun]
          exact lastRun

theorem family_readOnly (patterns : List Pattern) (yes no : Code)
    (yesReadOnly : yes.NoRdx) (noReadOnly : no.NoRdx) : (familyCode patterns yes no).NoRdx := by
  induction patterns with
  | nil => exact noReadOnly
  | cons pattern patterns ih => exact ProbeCompiler.compile_noRdx pattern yesReadOnly ih

def enter : Code := .move .R (.move .L (.answer true))
def leave : Code := .move .U (.move .U (.answer false))
def entry (status : CheckpointDecoder.HaltStatus) (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) : Code :=
  familyCode (RootResetCompletedLocalPatterns.localPatterns status program tree) enter (.answer false)
def whole (status : CheckpointDecoder.HaltStatus) (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) : Code := .observeNode (entry status program tree) leave

abbrev Control (status : CheckpointDecoder.HaltStatus) (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) := PC (whole status program tree)
abbrev machine (status : CheckpointDecoder.HaltStatus) (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) := RootResetPatternFragment.machine (whole status program tree)

theorem entry_mem (status : CheckpointDecoder.HaltStatus) (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) : entry status program tree ∈ (whole status program tree).nodes :=
  List.Mem.tail _ (List.mem_append.mpr (Or.inl (ProbeCompiler.Control.self_mem_nodes _)))

def initial (status : CheckpointDecoder.HaltStatus) (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (cursor : Cursor) :
    Configuration (Control status program tree) := ⟨some ⟨entry status program tree, entry_mem status program tree⟩, cursor⟩

theorem probe_runs (status : CheckpointDecoder.HaltStatus) (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) :
    let selected := if RootResetCompletedLocalPatterns.accepts status program tree origin.focus then enter else .answer false
    ∃ selectedMember : selected ∈ (whole status program tree).nodes,
      run (machine status program tree)
        (familyTicks (RootResetCompletedLocalPatterns.localPatterns status program tree) origin.focus)
        (initial status program tree origin) = ⟨some ⟨selected, selectedMember⟩, origin⟩ :=
  family_runs _ _ _ _ origin (fun _ member => nodes_trans (entry_mem status program tree) member)


def bound (status : CheckpointDecoder.HaltStatus) (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) : Nat :=
  familyBound (RootResetCompletedLocalPatterns.localPatterns status program tree) + 2

theorem readOnly (status : CheckpointDecoder.HaltStatus) (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) : (whole status program tree).NoRdx := by
  exact ⟨family_readOnly _ _ _ (by trivial) (by trivial), by trivial⟩

theorem enter_runs (status : CheckpointDecoder.HaltStatus) (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (member : enter ∈ (whole status program tree).nodes)
    (left continuation audit : Term) (parents : List ParentFrame) :
    ∃ yesMember : ProbeCompiler.Control.answer true ∈ (whole status program tree).nodes,
      run (machine status program tree) 2
        ⟨some ⟨enter, member⟩, ⟨.app left (.app continuation audit), parents⟩⟩ =
        ⟨some ⟨.answer true, yesMember⟩, ⟨continuation, .left audit :: .right left :: parents⟩⟩ :=
  ⟨nodes_trans member (List.Mem.tail _ (List.Mem.tail _ (List.Mem.head _))), rfl⟩

theorem parsed_enters (status : CheckpointDecoder.HaltStatus) (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (source : Term)
    (view : CheckpointDecoder.LocalView program) (statusEq : view.status = status)
    (parsed : CheckpointDecoder.parseLocal? program tree source = some view)
    (parents : List ParentFrame) :
    ∃ ticks left audit, ∃ yesMember : ProbeCompiler.Control.answer true ∈ (whole status program tree).nodes,
      ticks ≤ bound status program tree ∧ source = .app left (.app view.continuation audit) ∧
      run (machine status program tree) ticks (initial status program tree ⟨source, parents⟩) =
        ⟨some ⟨.answer true, yesMember⟩,
          ⟨view.continuation, .left audit :: .right left :: parents⟩⟩ := by
  obtain ⟨haltField, dispatcher, seedAudit, continuationAudit, _, _, sourceEq⟩ :=
    CheckpointDecoder.parseLocal?_sound parsed
  subst source
  have accepted := (RootResetCompletedLocalPatterns.accepts_iff_parse status program tree _).mpr
    ⟨view, statusEq, parsed⟩
  obtain ⟨member, probeRun⟩ := probe_runs status program tree
    ⟨CheckpointDecoder.openShell haltField dispatcher view.seedPayload seedAudit view.continuation continuationAudit, parents⟩
  simp only [accepted, ↓reduceIte] at member probeRun
  obtain ⟨yesMember, enterRun⟩ := enter_runs status program tree member _ _ _ parents
  refine ⟨familyTicks (RootResetCompletedLocalPatterns.localPatterns status program tree)
    (CheckpointDecoder.openShell haltField dispatcher view.seedPayload seedAudit view.continuation continuationAudit) + 2,
    _, continuationAudit, yesMember, Nat.add_le_add_right (familyTicks_bound _ _) 2, rfl, ?_⟩
  rw [run_add, probeRun]
  exact enterRun

theorem missed_runs (status : CheckpointDecoder.HaltStatus) (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor)
    (missed : RootResetCompletedLocalPatterns.accepts status program tree origin.focus = false) :
    ∃ noMember : ProbeCompiler.Control.answer false ∈ (whole status program tree).nodes,
      run (machine status program tree)
        (familyTicks (RootResetCompletedLocalPatterns.localPatterns status program tree) origin.focus)
        (initial status program tree origin) = ⟨some ⟨.answer false, noMember⟩, origin⟩ := by
  simpa only [missed, Bool.false_eq_true, ↓reduceIte] using probe_runs status program tree origin

theorem leave_mem (status : CheckpointDecoder.HaltStatus) (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) : leave ∈ (whole status program tree).nodes :=
  List.Mem.tail _ (List.mem_append.mpr (Or.inr (ProbeCompiler.Control.self_mem_nodes _)))

def returning (status : CheckpointDecoder.HaltStatus) (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (cursor : Cursor) :
    Configuration (Control status program tree) := ⟨some ⟨leave, leave_mem status program tree⟩, cursor⟩

theorem leave_runs (status : CheckpointDecoder.HaltStatus) (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (left continuation audit : Term) (parents : List ParentFrame) :
    ∃ noMember : ProbeCompiler.Control.answer false ∈ (whole status program tree).nodes,
      run (machine status program tree) 2
        (returning status program tree ⟨continuation, .left audit :: .right left :: parents⟩) =
        ⟨some ⟨.answer false, noMember⟩, ⟨.app left (.app continuation audit), parents⟩⟩ :=
  ⟨nodes_trans (leave_mem status program tree) (List.Mem.tail _ (List.Mem.tail _ (List.Mem.head _))), rfl⟩

theorem runMutationCount_zero (status : CheckpointDecoder.HaltStatus) (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (ticks : Nat)
    (configuration : Configuration (Control status program tree)) :
    runMutationCount (machine status program tree) ticks configuration = 0 :=
  RootResetPatternFragment.runMutationCount_zero _ (readOnly status program tree) ticks configuration

theorem all_input (status : CheckpointDecoder.HaltStatus) (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) :
    ∃ ticks configuration, ticks ≤ bound status program tree ∧
      run (machine status program tree) ticks (initial status program tree origin) = configuration ∧
      ((∃ noMember, configuration = ⟨some ⟨ProbeCompiler.Control.answer false, noMember⟩, origin⟩ ∧
          RootResetCompletedLocalPatterns.accepts status program tree origin.focus = false) ∨
       (∃ view : CheckpointDecoder.LocalView program, ∃ left audit yesMember,
        view.status = status ∧ CheckpointDecoder.parseLocal? program tree origin.focus = some view ∧
        origin.focus = .app left (.app view.continuation audit) ∧
        configuration = ⟨some ⟨ProbeCompiler.Control.answer true, yesMember⟩,
          ⟨view.continuation, .left audit :: .right left :: origin.parents⟩⟩)) := by
  rcases origin with ⟨source, parents⟩
  cases accepted : RootResetCompletedLocalPatterns.accepts status program tree source with
  | false =>
      obtain ⟨member, execution⟩ := missed_runs status program tree ⟨source, parents⟩ accepted
      refine ⟨_, _, Nat.le_trans (familyTicks_bound _ _) (Nat.le_add_right _ 2),
        execution, Or.inl ⟨member, rfl, rfl⟩⟩
  | true =>
      obtain ⟨view, statusEq, parsed⟩ :=
        (RootResetCompletedLocalPatterns.accepts_iff_parse status program tree source).mp accepted
      obtain ⟨ticks, left, audit, member, timeBound, shape, execution⟩ :=
        parsed_enters status program tree source view statusEq parsed parents
      exact ⟨ticks, _, timeBound, execution,
        Or.inr ⟨view, left, audit, member, statusEq, parsed, shape, rfl⟩⟩


end PureSFormal.Research.RootResetCompletedLocalFragment
