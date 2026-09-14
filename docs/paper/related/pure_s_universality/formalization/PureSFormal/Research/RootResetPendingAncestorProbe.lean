import PureSFormal.Research.RootResetPendingParentProbe
import PureSFormal.Research.RootResetCompletedResponseAtoms

/-! Upward search for the nearest registered pending parent. -/
namespace PureSFormal.Research.RootResetPendingAncestorProbe
open PureSFormal.PureS
open FiniteController RootResetCarrierNonemptyProbe

inductive Control (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) where
  | testing (pc : RootResetPendingParentProbe.Control program tree)
  | ascend
  | done (found : Bool)
def cover (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : List (Control program tree) :=
  [.ascend, .done false, .done true] ++ (RootResetPendingParentProbe.machine program tree).states.map .testing
theorem covers (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (state : Control program tree) : state ∈ cover program tree := by
  apply List.mem_append.mpr
  cases state with
  | ascend => exact Or.inl (List.Mem.head _)
  | done bit =>
      apply Or.inl
      cases bit with
      | false => exact List.Mem.tail _ (List.Mem.head _)
      | true => exact List.Mem.tail _ (List.Mem.tail _ (List.Mem.head _))
  | testing pc => exact Or.inr (RootResetCompletedLocalPatterns.map_member _ ((RootResetPendingParentProbe.machine program tree).covers pc))
def transition (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (state : Control program tree)
    (node : Probe.NodeKind) (incoming : Probe.Incoming) : Command (Control program tree) :=
  match state with
  | .testing pc => match pc with
    | .done true => .exec .U (.done true)
    | .done false => .stay .ascend
    | _ => mapCommand .testing ((RootResetPendingParentProbe.machine program tree).transition pc node incoming)
  | .ascend => match incoming with
    | .root => .stay (.done false)
    | .left | .right => .exec .U (.testing .start)
  | .done found => .stay (.done found)
def machine (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Machine (Control program tree) :=
  ⟨fun _ => cover program tree, covers program tree, transition program tree⟩
def initial (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) : Configuration (Control program tree) :=
  liftConfiguration .testing (RootResetPendingParentProbe.initial program tree origin)
def done? {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)} (configuration : Configuration (Control program tree)) : Bool :=
  match configuration.control with | some (.done _) => true | _ => false

theorem testing_step (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (configuration : Configuration (RootResetPendingParentProbe.Control program tree)) (running : RootResetPendingParentProbe.done? configuration = false) :
    step (machine program tree) (liftConfiguration Control.testing configuration) =
      liftConfiguration Control.testing (step (RootResetPendingParentProbe.machine program tree) configuration) := by
  apply step_lift
  intro state current
  rcases configuration with ⟨runtime, cursor⟩
  have equal : runtime = some state := current
  subst runtime
  cases state with
  | done _ => cases running
  | start | probing _ => rfl

def selected (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) : Configuration (Control program tree) :=
  if RootResetPendingParentProbe.value program tree origin then
    match origin.up? with | some parent => ⟨some (.done true), parent⟩ | none => ⟨none, origin⟩
  else ⟨some .ascend, origin⟩

theorem testing_runs (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) :
    ∃ used, used ≤ RootResetPendingParentProbe.coefficient program tree ∧
      run (machine program tree) (used + 1) (initial program tree origin) = selected program tree origin := by
  obtain ⟨ticks, bounded, actual⟩ := RootResetPendingParentProbe.all_input program tree origin
  obtain ⟨used, usedBound, lifted⟩ := run_to_boundary (RootResetPendingParentProbe.machine program tree) (machine program tree)
    Control.testing RootResetPendingParentProbe.done? (RootResetPendingParentProbe.terminal_absorbs program tree)
    (testing_step program tree) ticks (RootResetPendingParentProbe.initial program tree origin) (by rw [actual]; rfl)
  rw [actual] at lifted
  refine ⟨used, Nat.le_trans usedBound bounded, ?_⟩
  rw [initial, run_add, lifted]
  cases result : RootResetPendingParentProbe.value program tree origin <;>
    simp only [selected, result, Bool.false_eq_true, ↓reduceIte]
  · rfl
  · rcases origin with ⟨focus, parents⟩
    cases parents with
    | nil => cases result
    | cons frame parents => cases frame <;> rfl

theorem accepted_parent {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)} {origin : Cursor}
    (accepted : RootResetPendingParentProbe.value program tree origin = true) :
    ∃ parent, origin.up? = some parent ∧ parent.rdx?.isSome = true := by
  rcases origin with ⟨source, parents⟩
  cases parents with
  | nil => cases accepted
  | cons frame parents => cases frame with
    | left sibling => cases accepted
    | right sibling =>
        obtain ⟨payload, continuation, child, shape, _⟩ := RootResetPendingAdmissionPatterns.pending_sound
          (compileActions program tree) (.app sibling source) .hole accepted
        refine ⟨⟨.app sibling source, parents⟩, rfl, ?_⟩
        rw [shape]
        rfl

inductive First (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Cursor → Bool → Cursor → Prop where
  | found (origin endpoint : Cursor) (accepted : RootResetPendingParentProbe.value program tree origin = true) (up : origin.up? = some endpoint) :
      First program tree origin true endpoint
  | root (source : Term) : First program tree ⟨source, []⟩ false ⟨source, []⟩
  | parent (source : Term) (frame : ParentFrame) (parents : List ParentFrame)
      (refused : RootResetPendingParentProbe.value program tree ⟨source, frame :: parents⟩ = false)
      {found : Bool} {endpoint : Cursor} (rest : First program tree ⟨frame.fill source, parents⟩ found endpoint) :
      First program tree ⟨source, frame :: parents⟩ found endpoint

def coefficient (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Nat := RootResetPendingParentProbe.coefficient program tree + 2

theorem all_input_depth (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (source : Term) (parents : List ParentFrame) :
    ∃ ticks found endpoint, ticks ≤ coefficient program tree * (parents.length + 1) ∧
      run (machine program tree) ticks (initial program tree ⟨source, parents⟩) = ⟨some (.done found), endpoint⟩ ∧
      First program tree ⟨source, parents⟩ found endpoint := by
  induction parents generalizing source with
  | nil =>
      obtain ⟨used, bounded, actual⟩ := testing_runs program tree ⟨source, []⟩
      change run (machine program tree) (used + 1) _ = ⟨some .ascend, ⟨source, []⟩⟩ at actual
      refine ⟨used + 1 + 1, false, ⟨source, []⟩, ?_, ?_, .root source⟩
      · simpa only [coefficient, List.length_nil, Nat.zero_add, Nat.mul_one, Nat.add_assoc] using Nat.add_le_add_right bounded 2
      · rw [run_add, actual]
        rfl
  | cons frame parents ih =>
      obtain ⟨used, bounded, actual⟩ := testing_runs program tree ⟨source, frame :: parents⟩
      cases accepted : RootResetPendingParentProbe.value program tree ⟨source, frame :: parents⟩ with
      | true =>
          obtain ⟨parent, up, _⟩ := accepted_parent accepted
          simp only [selected, accepted, ↓reduceIte, up] at actual
          refine ⟨used + 1, true, parent, ?_, actual, .found _ parent accepted up⟩
          apply Nat.le_trans (Nat.add_le_add_right bounded 1)
          apply Nat.le_trans (Nat.le_add_right _ 1)
          exact Nat.le_mul_of_pos_right _ (Nat.succ_pos _)
      | false =>
          simp only [selected, accepted, Bool.false_eq_true, ↓reduceIte] at actual
          obtain ⟨restTicks, found, endpoint, restBound, restRun, first⟩ := ih (frame.fill source)
          refine ⟨used + 1 + 1 + restTicks, found, endpoint, ?_, ?_, .parent source frame parents accepted first⟩
          · have total := Nat.add_le_add (Nat.add_le_add_right bounded 2) restBound
            simpa only [coefficient, List.length_cons, Nat.mul_add, Nat.mul_one, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using total
          · have firstRun : run (machine program tree) (used + 1 + 1) (initial program tree ⟨source, frame :: parents⟩) =
                initial program tree ⟨frame.fill source, parents⟩ := by
              rw [run_add, actual]
              cases frame <;> rfl
            rw [run_add, firstRun]
            exact restRun

theorem First.redex {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)} {origin endpoint : Cursor}
    (first : First program tree origin true endpoint) : endpoint.rdx?.isSome = true := by
  generalize foundEq : true = found at first
  induction first with
  | found origin endpoint accepted up =>
      obtain ⟨parent, parentEq, redex⟩ := accepted_parent accepted
      exact (Option.some.inj (parentEq.symm.trans up)) ▸ redex
  | root source => cases foundEq
  | parent source frame parents refused rest ih => exact ih foundEq

theorem all_input (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) :
    ∃ ticks found endpoint, ticks ≤ coefficient program tree * origin.erase.size ∧
      run (machine program tree) ticks (initial program tree origin) = ⟨some (.done found), endpoint⟩ ∧
      First program tree origin found endpoint ∧ (found = true → endpoint.rdx?.isSome = true) := by
  obtain ⟨ticks, found, endpoint, bounded, actual, first⟩ := all_input_depth program tree origin.focus origin.parents
  refine ⟨ticks, found, endpoint, Nat.le_trans bounded (Nat.mul_le_mul_left _
    (RootResetProgressTotality.depth_succ_le_erase_size origin.focus origin.parents)), actual, first, ?_⟩
  intro yes
  subst found
  exact first.redex

theorem First.unique {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {origin left right : Cursor} {leftFound rightFound : Bool}
    (first : First program tree origin leftFound left) (second : First program tree origin rightFound right) :
    leftFound = rightFound ∧ left = right := by
  induction first with
  | found origin endpoint accepted up =>
      cases second with
      | found _ other _ otherUp => exact ⟨rfl, Option.some.inj (up.symm.trans otherUp)⟩
      | root source => cases accepted
      | parent source frame parents refused rest => rw [accepted] at refused; cases refused
  | root source =>
      cases second with
      | found origin endpoint accepted up => cases accepted
      | root _ => exact ⟨rfl, rfl⟩
  | parent source frame parents refused rest ih =>
      cases second with
      | found origin endpoint accepted up => rw [refused] at accepted; cases accepted
      | parent _ _ _ _ other => exact ih other

theorem First.runs {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {origin endpoint : Cursor} {found : Bool} (first : First program tree origin found endpoint) :
    ∃ ticks, ticks ≤ coefficient program tree * origin.erase.size ∧
      run (machine program tree) ticks (initial program tree origin) = ⟨some (.done found), endpoint⟩ := by
  obtain ⟨ticks, actualFound, actualEndpoint, bounded, execution, actual, _⟩ := all_input program tree origin
  obtain ⟨foundEq, endpointEq⟩ := actual.unique first
  rw [foundEq, endpointEq] at execution
  exact ⟨ticks, bounded, execution⟩

theorem done_absorbs (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (found : Bool) (origin : Cursor) (ticks : Nat) :
    run (machine program tree) ticks ⟨some (.done found), origin⟩ = ⟨some (.done found), origin⟩ := by
  induction ticks with
  | zero => rfl
  | succ ticks ih => exact ih

theorem mutationCount_zero (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (configuration : Configuration (Control program tree)) : mutationCount (machine program tree) configuration = 0 := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => rfl
  | some state =>
      rw [← commandCount_eq_mutationCount]
      cases state with
      | done _ => rfl
      | ascend => cases Probe.observeIncoming cursor <;> rfl
      | testing pc =>
          have zero := RootResetPendingParentProbe.mutationCount_zero program tree ⟨some pc, cursor⟩
          cases pc with
          | done ready => cases ready <;> rfl
          | start | probing _ =>
              simp only [machine, transition, commandCount_map]
              rw [commandCount_eq_mutationCount]
              exact zero

theorem runMutationCount_zero (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (ticks : Nat)
    (configuration : Configuration (Control program tree)) : runMutationCount (machine program tree) ticks configuration = 0 := by
  induction ticks generalizing configuration with
  | zero => rfl
  | succ ticks ih => rw [runMutationCount, mutationCount_zero, ih, Nat.zero_add]
theorem erase_run (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (ticks : Nat)
    (configuration : Configuration (Control program tree)) :
    (run (machine program tree) ticks configuration).cursor.erase = configuration.cursor.erase := by
  have projected := run_projects_stepsN (machine program tree) ticks configuration
  rw [runMutationCount_zero] at projected
  exact (StepsN.eq_of_zero projected).symm

end PureSFormal.Research.RootResetPendingAncestorProbe
