import PureSFormal.Research.RootResetPendingAdmissionFragment
import PureSFormal.Research.RootResetMixedContinuationSpine

/-! One finite interleaved admission phase. The result distinguishes pending R
from Local RL, allowing the complete selector to insert its scoped endpoint
lookahead at the required Local boundary. No stage registry is run at runtime. -/
namespace PureSFormal.Research.RootResetPendingAdmissionInterleaved
open PureSFormal.PureS
open FiniteController RootResetCarrierNonemptyProbe

inductive Entry where | stopped | pending | completedLocal
  deriving DecidableEq, Repr

def Entry.entered : Entry → Bool
  | .stopped => false
  | _ => true

inductive Control (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) where
  | pending (pc : RootResetPendingAdmissionFragment.Control program tree)
  | completedLocal (pc : RootResetMixedLocalFragment.Control program tree)
  | done (entry : Entry)

def cover (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : List (Control program tree) :=
  [.done .stopped, .done .pending, .done .completedLocal] ++
    (RootResetPendingAdmissionFragment.machine program tree).states.map Control.pending ++
    (RootResetMixedLocalFragment.machine program tree).states.map Control.completedLocal

theorem covers (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (state : Control program tree) :
    state ∈ cover program tree := by
  cases state with
  | done entry =>
      apply List.mem_append.mpr ∘ Or.inl ∘ List.mem_append.mpr ∘ Or.inl
      cases entry
      · exact List.Mem.head _
      · exact List.Mem.tail _ (List.Mem.head _)
      · exact List.Mem.tail _ (List.Mem.tail _ (List.Mem.head _))
  | pending pc => exact List.mem_append.mpr (Or.inl (List.mem_append.mpr (Or.inr
      (RootResetCompletedLocalPatterns.map_member _ ((RootResetPendingAdmissionFragment.machine program tree).covers pc)))))
  | completedLocal pc => exact List.mem_append.mpr (Or.inr
      (RootResetCompletedLocalPatterns.map_member _ ((RootResetMixedLocalFragment.machine program tree).covers pc)))

def transition (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (state : Control program tree) (node : Probe.NodeKind) (incoming : Probe.Incoming) : Command (Control program tree) :=
  match state with
  | .pending pc => match pc with
    | .done true => .stay (.done .pending)
    | .done false => .stay (.completedLocal (.marked
        ⟨RootResetMixedLocalFragment.classifier .marked program tree, ProbeCompiler.Control.self_mem_nodes _⟩))
    | _ => mapCommand Control.pending ((RootResetPendingAdmissionFragment.machine program tree).transition pc node incoming)
  | .completedLocal pc => match pc with
    | .done true => .stay (.done .completedLocal)
    | .done false => .stay (.done .stopped)
    | _ => mapCommand Control.completedLocal ((RootResetMixedLocalFragment.machine program tree).transition pc node incoming)
  | .done entry => .stay (.done entry)

def machine (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Machine (Control program tree) :=
  ⟨fun _ => cover program tree, covers program tree, transition program tree⟩

def initial (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) : Configuration (Control program tree) :=
  liftConfiguration Control.pending (RootResetPendingAdmissionFragment.initial program tree origin)

def localInitial (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) : Configuration (Control program tree) :=
  liftConfiguration Control.completedLocal (RootResetMixedLocalFragment.initial program tree origin)

def pendingDone? {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    (configuration : Configuration (RootResetPendingAdmissionFragment.Control program tree)) : Bool :=
  match configuration.control with | some (.done _) => true | _ => false

theorem pending_absorbs (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (configuration : Configuration (RootResetPendingAdmissionFragment.Control program tree))
    (ended : pendingDone? configuration = true) (ticks : Nat) :
    run (RootResetPendingAdmissionFragment.machine program tree) ticks configuration = configuration := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => cases ended
  | some state => cases state with
    | done entered => exact RootResetPendingAdmissionFragment.done_absorbs program tree entered cursor ticks
    | probing pc => cases ended

theorem pending_step (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (configuration : Configuration (RootResetPendingAdmissionFragment.Control program tree))
    (running : pendingDone? configuration = false) :
    step (machine program tree) (liftConfiguration Control.pending configuration) =
      liftConfiguration Control.pending (step (RootResetPendingAdmissionFragment.machine program tree) configuration) := by
  apply step_lift
  intro state current
  rcases configuration with ⟨runtime, cursor⟩
  have equal : runtime = some state := current
  subst runtime
  cases state with
  | done entered => cases running
  | probing pc => rfl

theorem local_step (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (configuration : Configuration (RootResetMixedLocalFragment.Control program tree))
    (running : RootResetMixedContinuationSpine.done? configuration = false) :
    step (machine program tree) (liftConfiguration Control.completedLocal configuration) =
      liftConfiguration Control.completedLocal (step (RootResetMixedLocalFragment.machine program tree) configuration) := by
  apply step_lift
  intro state current
  rcases configuration with ⟨runtime, cursor⟩
  have equal : runtime = some state := current
  subst runtime
  cases state with
  | done entered => cases running
  | marked pc => rfl
  | fresh pc => rfl
  | probing pc => rfl
  | enterRight => rfl
  | enterLeft => rfl

theorem pending_runs (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin after : Cursor) (entered : Bool) (ticks : Nat)
    (execution : run (RootResetPendingAdmissionFragment.machine program tree) ticks
      (RootResetPendingAdmissionFragment.initial program tree origin) = ⟨some (.done entered), after⟩) :
    ∃ used, used ≤ ticks ∧ run (machine program tree) (used + 1) (initial program tree origin) =
      if entered then ⟨some (.done .pending), after⟩ else localInitial program tree after := by
  obtain ⟨used, bounded, lifted⟩ := run_to_boundary (RootResetPendingAdmissionFragment.machine program tree)
    (machine program tree) Control.pending pendingDone? (pending_absorbs program tree) (pending_step program tree)
    ticks (RootResetPendingAdmissionFragment.initial program tree origin) (by rw [execution]; rfl)
  rw [execution] at lifted
  refine ⟨used, bounded, ?_⟩
  rw [initial, run_add, lifted]
  cases entered <;> rfl

theorem local_runs (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin after : Cursor) (entered : Bool) (ticks : Nat)
    (execution : run (RootResetMixedLocalFragment.machine program tree) ticks
      (RootResetMixedLocalFragment.initial program tree origin) = ⟨some (.done entered), after⟩) :
    ∃ used, used ≤ ticks ∧ run (machine program tree) (used + 1) (localInitial program tree origin) =
      ⟨some (.done (if entered then .completedLocal else .stopped)), after⟩ := by
  obtain ⟨used, bounded, lifted⟩ := run_to_boundary (RootResetMixedLocalFragment.machine program tree)
    (machine program tree) Control.completedLocal RootResetMixedContinuationSpine.done?
    (RootResetMixedContinuationSpine.base_absorbs program tree) (local_step program tree)
    ticks (RootResetMixedLocalFragment.initial program tree origin) (by rw [execution]; rfl)
  rw [execution] at lifted
  refine ⟨used, bounded, ?_⟩
  rw [localInitial, run_add, lifted]
  cases entered <;> rfl

def coefficient (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Nat :=
  RootResetMixedLocalAmortized.coefficient program tree + (RootResetPendingAdmissionFragment.coefficient program tree + 4)

def Paid (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin : Cursor) (ticks : Nat) (entry : Entry) (after : Cursor) : Prop :=
  ticks + (if entry.entered then 1 + coefficient program tree * after.focus.size else 0) ≤ coefficient program tree * origin.focus.size

inductive Outcome (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) : Entry → Cursor → Prop where
  | stopped (refused : RootResetEdgeFragment.select (RootResetPendingAdmissionPatterns.rows program tree) origin.focus = none) :
      Outcome program tree origin .stopped origin
  | pending {after : Cursor} (entry : RootResetPendingAdmissionFragment.Outcome program tree origin true after) :
      Outcome program tree origin .pending after
  | completedLocal {after : Cursor}
      (refused : RootResetEdgeFragment.select (RootResetPendingAdmissionPatterns.rows program tree) origin.focus = none)
      (entry : RootResetMixedLocalFragment.Outcome program tree origin true after) :
      Outcome program tree origin .completedLocal after

theorem all_input (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin : Cursor) (boundary : RootResetCarrierScanParentBoundary.carrierParent? origin.parents.head? = false) :
    ∃ ticks entry after, Paid program tree origin ticks entry after ∧
      run (machine program tree) ticks (initial program tree origin) = ⟨some (.done entry), after⟩ ∧
      Outcome program tree origin entry after := by
  obtain ⟨pendingTicks, entered, after, pendingBound, pendingRun, pendingOutcome⟩ :=
    RootResetPendingAdmissionFragment.bounded_input program tree origin
  obtain ⟨p, pb, pr⟩ := pending_runs program tree origin after entered pendingTicks pendingRun
  have small : p ≤ RootResetPendingAdmissionFragment.coefficient program tree := Nat.le_trans pb pendingBound
  cases pendingOutcome with
  | entered payload continuation child shape admitted =>
      let after : Cursor := ⟨child, .right (.app (CheckpointDecoder.openEnvironment (compileActions program tree) payload) continuation) :: origin.parents⟩
      refine ⟨p + 1, .pending, after, ?_, pr, .pending (.entered payload continuation child shape admitted)⟩
      have gap : after.focus.size + 1 ≤ origin.focus.size := by
        rw [shape]
        exact Nat.le_add_left _ _
      have constant : p + 1 + 1 ≤ coefficient program tree := by
        exact Nat.le_trans (by simpa only [Nat.add_assoc] using Nat.add_le_add_right small 2)
          (Nat.le_trans (Nat.le_add_right _ 2) (Nat.le_add_left _ _))
      change p + 1 + (1 + coefficient program tree * after.focus.size) ≤ _
      rw [← Nat.add_assoc]
      apply Nat.le_trans (Nat.add_le_add_right constant _)
      rw [Nat.add_comm (coefficient program tree), ← Nat.mul_succ]
      exact Nat.mul_le_mul_left _ gap
  | stopped refused =>
      obtain ⟨localTicks, entered, after, localPaid, localRun, localOutcome⟩ := RootResetMixedLocalAmortized.all_input program tree origin boundary
      obtain ⟨l, lb, lr⟩ := local_runs program tree origin after entered localTicks localRun
      have localPaid' := Nat.le_trans (Nat.add_le_add_right lb _) localPaid
      have overhead : p + 1 + 1 ≤ RootResetPendingAdmissionFragment.coefficient program tree + 4 := by
        exact Nat.le_trans (by simpa only [Nat.add_assoc] using Nat.add_le_add_right small 2) (Nat.le_add_right _ 2)
      have combinedRun := (run_add (machine program tree) (p + 1) (l + 1) (initial program tree origin)).trans
        ((congrArg (run (machine program tree) (l + 1)) pr).trans lr)
      cases localOutcome with
      | stopped =>
          refine ⟨p + 1 + (l + 1), .stopped, origin, ?_, combinedRun, .stopped refused⟩
          have scale : RootResetPendingAdmissionFragment.coefficient program tree + 4 ≤
              (RootResetPendingAdmissionFragment.coefficient program tree + 4) * origin.focus.size := by
            simpa only [Nat.mul_one] using (Nat.mul_le_mul_left
              (RootResetPendingAdmissionFragment.coefficient program tree + 4) (Term.size_pos origin.focus))
          have total := Nat.add_le_add localPaid' (Nat.le_trans overhead scale)
          simpa only [Paid, Entry.entered, RootResetMixedLocalAmortized.Paid,
            Bool.false_eq_true, ↓reduceIte, Nat.add_zero, coefficient, Nat.add_mul,
            Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using total
      | entered view parsed left audit shape =>
          let after : Cursor := ⟨view.continuation, .left audit :: .right left :: origin.parents⟩
          refine ⟨p + 1 + (l + 1), .completedLocal, after, ?_, combinedRun,
            .completedLocal refused (.entered view parsed left audit shape)⟩
          have extra : p + 1 + 1 + (RootResetPendingAdmissionFragment.coefficient program tree + 4) * after.focus.size ≤
              (RootResetPendingAdmissionFragment.coefficient program tree + 4) * origin.focus.size := by
            apply Nat.le_trans (Nat.add_le_add_right overhead _)
            rw [Nat.add_comm (RootResetPendingAdmissionFragment.coefficient program tree + 4), ← Nat.mul_succ]
            exact Nat.mul_le_mul_left _ (RootResetMixedLocalAmortized.continuation_gap parsed)
          have total := Nat.add_le_add localPaid' extra
          simpa only [Paid, Entry.entered, RootResetMixedLocalAmortized.Paid, ↓reduceIte,
            coefficient, Nat.add_mul, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using total

theorem outcome_boundary {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {origin after : Cursor} {entry : Entry} (outcome : Outcome program tree origin entry after)
    (boundary : RootResetCarrierScanParentBoundary.carrierParent? origin.parents.head? = false) :
    RootResetCarrierScanParentBoundary.carrierParent? after.parents.head? = false := by
  cases outcome with
  | stopped refused => exact boundary
  | pending admitted => exact RootResetPendingAdmissionFragment.outcome_boundary admitted boundary
  | completedLocal refused admitted => cases admitted with
    | entered view parsed left audit shape => rfl

theorem outcome_gap {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {origin after : Cursor} {entry : Entry} (outcome : Outcome program tree origin entry after)
    (entered : entry.entered = true) : after.focus.size < origin.focus.size := by
  cases outcome with
  | stopped refused => cases entered
  | pending admitted => cases admitted with
    | entered payload continuation child shape admitted =>
        rw [shape]
        exact Nat.le_add_left _ _
  | completedLocal refused admitted => cases admitted with
    | entered view parsed left audit shape => exact RootResetMixedLocalAmortized.continuation_gap parsed

theorem done_absorbs (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (entry : Entry) (cursor : Cursor) (ticks : Nat) :
    run (machine program tree) ticks ⟨some (.done entry), cursor⟩ = ⟨some (.done entry), cursor⟩ := by
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
      | done entry => rfl
      | pending pc =>
          have baseZero := RootResetPendingAdmissionFragment.mutationCount_zero program tree ⟨some pc, cursor⟩
          rw [← commandCount_eq_mutationCount] at baseZero
          cases pc with
          | done entered => cases entered <;> rfl
          | probing pc =>
              simp only [machine, transition, commandCount_map]
              exact baseZero
      | completedLocal pc =>
          have baseZero := RootResetMixedLocalFragment.mutationCount_zero program tree ⟨some pc, cursor⟩
          rw [← commandCount_eq_mutationCount] at baseZero
          cases pc with
          | done entered => cases entered <;> rfl
          | marked pc =>
              simp only [machine, transition, commandCount_map]
              exact baseZero
          | fresh pc =>
              simp only [machine, transition, commandCount_map]
              exact baseZero
          | probing pc =>
              simp only [machine, transition, commandCount_map]
              exact baseZero
          | enterRight => rfl
          | enterLeft => rfl

theorem runMutationCount_zero (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (ticks : Nat) (configuration : Configuration (Control program tree)) :
    runMutationCount (machine program tree) ticks configuration = 0 := by
  induction ticks generalizing configuration with
  | zero => rfl
  | succ ticks ih => rw [runMutationCount, mutationCount_zero, ih, Nat.zero_add]

theorem erase_run (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (ticks : Nat) (configuration : Configuration (Control program tree)) :
    (run (machine program tree) ticks configuration).cursor.erase = configuration.cursor.erase := by
  have projected := run_projects_stepsN (machine program tree) ticks configuration
  rw [runMutationCount_zero] at projected
  exact (StepsN.eq_of_zero projected).symm

end PureSFormal.Research.RootResetPendingAdmissionInterleaved
