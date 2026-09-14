import PureSFormal.Research.RootResetPendingAdmissionPatterns
import PureSFormal.Research.RootResetMixedLocalAmortized

/-! A fixed finite pending-child admission machine. Every failed probe restores
its exact entry cursor. Success makes one R entry under a noncarrier parent;
its constant cost is paid by the strict source-to-child size gap. -/
namespace PureSFormal.Research.RootResetPendingAdmissionFragment
open PureSFormal.PureS
open FiniteController
open RootResetCarrierNonemptyProbe RootResetPendingAdmissionPatterns

inductive Control (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) where
  | probing (pc : RootResetEdgeFragment.Control (rows program tree))
  | done (entered : Bool)

def cover (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : List (Control program tree) :=
  [.done false, .done true] ++ (RootResetEdgeFragment.machine (rows program tree)).states.map Control.probing

theorem covers (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (state : Control program tree) :
    state ∈ cover program tree := by
  cases state with
  | done entered =>
      apply List.mem_append.mpr ∘ Or.inl
      cases entered
      · exact List.Mem.head _
      · exact List.Mem.tail _ (List.Mem.head _)
  | probing pc => exact List.mem_append.mpr (Or.inr (RootResetCompletedLocalPatterns.map_member _
      ((RootResetEdgeFragment.machine (rows program tree)).covers pc)))

def transition (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (state : Control program tree) (node : Probe.NodeKind) (incoming : Probe.Incoming) : Command (Control program tree) :=
  match state with
  | .probing pc => match pc.val with
    | .answer entered => .stay (.done entered)
    | _ => mapCommand Control.probing ((RootResetEdgeFragment.machine (rows program tree)).transition pc node incoming)
  | .done entered => .stay (.done entered)

def machine (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Machine (Control program tree) :=
  ⟨fun _ => cover program tree, covers program tree, transition program tree⟩

def initial (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) :
    Configuration (Control program tree) := liftConfiguration Control.probing (RootResetEdgeFragment.initial (rows program tree) origin)

theorem probe_step (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (configuration : Configuration (RootResetEdgeFragment.Control (rows program tree)))
    (running : anyAnswer? configuration = false) :
    step (machine program tree) (liftConfiguration Control.probing configuration) =
      liftConfiguration Control.probing (step (RootResetEdgeFragment.machine (rows program tree)) configuration) := by
  apply step_lift
  intro state current
  rcases configuration with ⟨runtime, cursor⟩
  have equal : runtime = some state := current
  subst runtime
  rcases state with ⟨code, member⟩
  cases code with
  | answer entered => cases running
  | observeNode onS onApp => rfl
  | observeIncoming onRoot onLeft onRight => rfl
  | move operation next => rfl

theorem probe_runs (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin after : Cursor) (entered : Bool) (ticks : Nat)
    (member : ProbeCompiler.Control.answer entered ∈ (RootResetEdgeFragment.familyCode (rows program tree)).nodes)
    (execution : run (RootResetEdgeFragment.machine (rows program tree)) ticks
      (RootResetEdgeFragment.initial (rows program tree) origin) = ⟨some ⟨.answer entered, member⟩, after⟩) :
    ∃ used, used ≤ ticks ∧ run (machine program tree) (used + 1) (initial program tree origin) =
      ⟨some (.done entered), after⟩ := by
  obtain ⟨used, bounded, lifted⟩ := run_to_boundary (RootResetEdgeFragment.machine (rows program tree))
    (machine program tree) Control.probing anyAnswer?
    (RootResetMixedLocalFragment.classify_absorbs (RootResetEdgeFragment.familyCode (rows program tree)))
    (probe_step program tree) ticks (RootResetEdgeFragment.initial (rows program tree) origin) (by rw [execution]; rfl)
  rw [execution] at lifted
  exact ⟨used, bounded, by rw [initial, run_add, lifted]; rfl⟩

inductive Outcome (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) : Bool → Cursor → Prop where
  | stopped (refused : RootResetEdgeFragment.select (rows program tree) origin.focus = none) : Outcome program tree origin false origin
  | entered (payload continuation child : Term)
      (shape : origin.focus = .app (.app (CheckpointDecoder.openEnvironment (compileActions program tree) payload) continuation) child)
      (admitted : childAdmitted program tree child = true) :
      Outcome program tree origin true
        ⟨child, .right (.app (CheckpointDecoder.openEnvironment (compileActions program tree) payload) continuation) :: origin.parents⟩

def coefficient (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Nat :=
  RootResetEdgeFragment.bound (rows program tree) + 2

def Paid (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin : Cursor) (ticks : Nat) (entered : Bool) (after : Cursor) : Prop :=
  ticks + (if entered then 1 + coefficient program tree * after.focus.size else 0) ≤
    coefficient program tree * origin.focus.size

theorem bounded_input (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) :
    ∃ ticks entered after, ticks ≤ coefficient program tree ∧
      run (machine program tree) ticks (initial program tree origin) = ⟨some (.done entered), after⟩ ∧
      Outcome program tree origin entered after := by
  cases selected : RootResetEdgeFragment.select (rows program tree) origin.focus with
  | none =>
      obtain ⟨member, execution⟩ := RootResetEdgeFragment.missed_runs (rows program tree) origin selected
      obtain ⟨used, bounded, actual⟩ := probe_runs program tree origin origin false _ member execution
      refine ⟨used + 1, false, origin, ?_, actual, .stopped selected⟩
      exact Nat.le_trans (Nat.add_le_add_right
        (Nat.le_trans bounded (RootResetEdgeFragment.ticks_bound (rows program tree) origin.focus)) 1) (Nat.le_succ _)
  | some row =>
      obtain ⟨payload, continuation, child, shape, address, admitted⟩ := selected_sound program tree origin.focus row selected
      let after : Cursor := ⟨child, .right (.app (CheckpointDecoder.openEnvironment (compileActions program tree) payload) continuation) :: origin.parents⟩
      have followed : RootResetEdgeFragment.follow row.address origin = some after := by
        rw [address]
        rcases origin with ⟨source, parents⟩
        change source = _ at shape
        subst source
        rfl
      obtain ⟨member, execution⟩ := RootResetEdgeFragment.selected_runs (rows program tree) origin after row selected followed
      obtain ⟨used, bounded, actual⟩ := probe_runs program tree origin after true _ member execution
      refine ⟨used + 1, true, after, ?_, actual, .entered payload continuation child shape admitted⟩
      exact Nat.le_trans (Nat.add_le_add_right
        (Nat.le_trans bounded (RootResetEdgeFragment.ticks_bound (rows program tree) origin.focus)) 1) (Nat.le_succ _)

theorem all_input (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) :
    ∃ ticks entered after, Paid program tree origin ticks entered after ∧
      run (machine program tree) ticks (initial program tree origin) = ⟨some (.done entered), after⟩ ∧
      Outcome program tree origin entered after := by
  cases selected : RootResetEdgeFragment.select (rows program tree) origin.focus with
  | none =>
      obtain ⟨member, execution⟩ := RootResetEdgeFragment.missed_runs (rows program tree) origin selected
      obtain ⟨used, bounded, actual⟩ := probe_runs program tree origin origin false _ member execution
      refine ⟨used + 1, false, origin, ?_, actual, .stopped selected⟩
      change used + 1 + 0 ≤ _
      rw [Nat.add_zero]
      have small := Nat.le_trans bounded (RootResetEdgeFragment.ticks_bound (rows program tree) origin.focus)
      have constant : used + 1 ≤ coefficient program tree :=
        Nat.le_trans (Nat.add_le_add_right small 1) (Nat.le_succ _)
      exact Nat.le_trans constant (by
        simpa only [Nat.mul_one] using Nat.mul_le_mul_left (coefficient program tree) (Term.size_pos origin.focus))
  | some row =>
      obtain ⟨payload, continuation, child, shape, address, admitted⟩ := selected_sound program tree origin.focus row selected
      let after : Cursor := ⟨child, .right (.app (CheckpointDecoder.openEnvironment (compileActions program tree) payload) continuation) :: origin.parents⟩
      have followed : RootResetEdgeFragment.follow row.address origin = some after := by
        rw [address]
        rcases origin with ⟨source, parents⟩
        change source = _ at shape
        subst source
        rfl
      obtain ⟨member, execution⟩ := RootResetEdgeFragment.selected_runs (rows program tree) origin after row selected followed
      obtain ⟨used, bounded, actual⟩ := probe_runs program tree origin after true _ member execution
      refine ⟨used + 1, true, after, ?_, actual, .entered payload continuation child shape admitted⟩
      have small := Nat.le_trans bounded (RootResetEdgeFragment.ticks_bound (rows program tree) origin.focus)
      have gap : after.focus.size + 1 ≤ origin.focus.size :=
        RootResetEdgeFragment.follow_size_lt _ _ _ (by rw [address]; intro h; cases h) followed
      have constant : used + 1 + 1 ≤ coefficient program tree := by
        simpa only [coefficient, Nat.add_assoc] using Nat.add_le_add_right small 2
      change used + 1 + (1 + coefficient program tree * after.focus.size) ≤ _
      rw [← Nat.add_assoc]
      apply Nat.le_trans (Nat.add_le_add_right constant _)
      rw [Nat.add_comm (coefficient program tree), ← Nat.mul_succ]
      exact Nat.mul_le_mul_left _ gap

theorem outcome_boundary {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {origin after : Cursor} {entered : Bool} (outcome : Outcome program tree origin entered after)
    (boundary : RootResetCarrierScanParentBoundary.carrierParent? origin.parents.head? = false) :
    RootResetCarrierScanParentBoundary.carrierParent? after.parents.head? = false := by
  cases outcome with
  | stopped refused => exact boundary
  | entered payload continuation child shape admitted => exact admitted_parent_boundary _ _ _

theorem admitted_child_runs (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (payload continuation child : Term) (parents : List ParentFrame)
    (admitted : childAdmitted program tree child = true) :
    let origin : Cursor := ⟨.app (.app (CheckpointDecoder.openEnvironment (compileActions program tree) payload) continuation) child, parents⟩
    let after : Cursor := ⟨child, .right (.app (CheckpointDecoder.openEnvironment (compileActions program tree) payload) continuation) :: parents⟩
    ∃ ticks, ticks ≤ coefficient program tree ∧
      run (machine program tree) ticks (initial program tree origin) = ⟨some (.done true), after⟩ := by
  dsimp only
  obtain ⟨row, selected⟩ := select_of_child program tree payload continuation child admitted
  obtain ⟨ticks, entered, after, bounded, execution, outcome⟩ := bounded_input program tree
    ⟨.app (.app (CheckpointDecoder.openEnvironment (compileActions program tree) payload) continuation) child, parents⟩
  cases outcome with
  | stopped refused => rw [selected] at refused; cases refused
  | entered foundPayload foundContinuation foundChild shape accepted =>
      obtain ⟨functionEq, childEq⟩ := Term.app.inj shape
      rw [← functionEq, ← childEq] at execution
      exact ⟨ticks, bounded, execution⟩

theorem pending_excludes_local {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {origin after : Cursor} (outcome : Outcome program tree origin true after) :
    CheckpointDecoder.parseLocal? program tree origin.focus = none := by
  cases outcome with
  | entered payload continuation child shape admitted =>
      rw [shape]
      exact CheckpointDecoder.parseLocal?_none_of_headArity program tree _
        (by change 3 ≠ 5; decide) (by change 3 ≠ 6; decide)

theorem refused_child_runs (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (payload continuation child : Term) (parents : List ParentFrame)
    (refused : childAdmitted program tree child = false) :
    let origin : Cursor := ⟨.app (.app (CheckpointDecoder.openEnvironment (compileActions program tree) payload) continuation) child, parents⟩
    ∃ ticks, ticks ≤ coefficient program tree ∧
      run (machine program tree) ticks (initial program tree origin) = ⟨some (.done false), origin⟩ := by
  dsimp only
  obtain ⟨ticks, entered, after, bounded, execution, outcome⟩ := bounded_input program tree
    ⟨.app (.app (CheckpointDecoder.openEnvironment (compileActions program tree) payload) continuation) child, parents⟩
  cases outcome with
  | stopped refused => exact ⟨ticks, bounded, execution⟩
  | entered foundPayload foundContinuation foundChild shape accepted =>
      obtain ⟨functionEq, childEq⟩ := Term.app.inj shape
      rw [← childEq, refused] at accepted
      cases accepted

theorem done_absorbs (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (entered : Bool) (cursor : Cursor) (ticks : Nat) :
    run (machine program tree) ticks ⟨some (.done entered), cursor⟩ = ⟨some (.done entered), cursor⟩ := by
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
      | done entered => rfl
      | probing pc =>
          rcases pc with ⟨code, member⟩
          have baseZero := RootResetPatternFragment.mutationCount_zero _ (RootResetEdgeFragment.family_readOnly (rows program tree))
            ⟨some ⟨code, member⟩, cursor⟩
          rw [← commandCount_eq_mutationCount] at baseZero
          cases code with
          | answer entered => rfl
          | observeNode onS onApp =>
              simp only [machine, transition, commandCount_map]
              exact baseZero
          | observeIncoming onRoot onLeft onRight =>
              simp only [machine, transition, commandCount_map]
              exact baseZero
          | move operation next =>
              simp only [machine, transition, commandCount_map]
              exact baseZero

end PureSFormal.Research.RootResetPendingAdmissionFragment
