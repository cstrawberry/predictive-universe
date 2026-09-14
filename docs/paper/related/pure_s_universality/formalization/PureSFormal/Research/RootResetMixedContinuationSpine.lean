import PureSFormal.Research.RootResetMixedLocalAmortized

/-!
# One linear finite mixed-continuation traversal

The completed-Local admission fragment receives one finite feedback edge.
Marked Local inputs and admitted generated fresh Local inputs enter their
continuation and repeat; the first refused entry is an absorbing endpoint.
Every finite source terminates within coefficient * source.size ticks.
The linear proof charges each fresh carrier probe to the accumulator branch,
which is disjoint from the next continuation. No path, counter, or semantic
parser is added to runtime control, and every run preserves the bare term.
Pending FRAME/clock and response-phase selection are separate compositions.
-/

namespace PureSFormal.Research.RootResetMixedContinuationSpine
open PureSFormal.PureS
open FiniteController
open RootResetCarrierNonemptyProbe

abbrev Control (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) := RootResetMixedLocalFragment.Control program tree
abbrev base (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) := RootResetMixedLocalFragment.machine program tree
abbrev initial (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) := RootResetMixedLocalFragment.initial program tree
abbrev coefficient (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) := RootResetMixedLocalAmortized.coefficient program tree

def transition (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (state : Control program tree) (node : Probe.NodeKind) (incoming : Probe.Incoming) : Command (Control program tree) :=
  match state with
  | .done true => .stay (.marked ⟨RootResetMixedLocalFragment.classifier .marked program tree, ProbeCompiler.Control.self_mem_nodes _⟩)
  | _ => (base program tree).transition state node incoming

def machine (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Machine (Control program tree) :=
  ⟨(base program tree).stateCover, (base program tree).covers, transition program tree⟩

def done? {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    (configuration : Configuration (Control program tree)) : Bool :=
  match configuration.control with
  | some (.done _) => true
  | _ => false

theorem base_absorbs (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (configuration : Configuration (Control program tree)) (ended : done? configuration = true) (ticks : Nat) :
    run (base program tree) ticks configuration = configuration := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => cases ended
  | some state =>
      cases state with
      | done entered => exact RootResetMixedLocalFragment.done_absorbs program tree entered cursor ticks
      | marked pc => cases ended
      | fresh pc => cases ended
      | probing pc => cases ended
      | enterRight => cases ended
      | enterLeft => cases ended

theorem step_before_done (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (configuration : Configuration (Control program tree)) (running : done? configuration = false) :
    step (machine program tree) configuration = step (base program tree) configuration := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => rfl
  | some state =>
      cases state with
      | done entered => cases running
      | marked pc => rfl
      | fresh pc => rfl
      | probing pc => rfl
      | enterRight => rfl
      | enterLeft => rfl

theorem lift_id {α : Type} (configuration : Configuration α) : liftConfiguration (fun pc => pc) configuration = configuration := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime <;> rfl

theorem one_phase (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin : Cursor) (boundary : RootResetCarrierScanParentBoundary.carrierParent? origin.parents.head? = false) :
    ∃ used entered after,
      RootResetMixedLocalAmortized.Paid program tree origin used entered after ∧
      run (machine program tree) used (initial program tree origin) = ⟨some (.done entered), after⟩ ∧
      RootResetMixedLocalFragment.Outcome program tree origin entered after ∧
      ∃ referenceTicks, run (base program tree) referenceTicks (initial program tree origin) = ⟨some (.done entered), after⟩ := by
  obtain ⟨ticks, entered, after, paid, execution, outcome⟩ := RootResetMixedLocalAmortized.all_input program tree origin boundary
  obtain ⟨used, bounded, lifted⟩ := run_to_boundary (base program tree) (machine program tree) (fun pc => pc)
    done? (base_absorbs program tree) (fun configuration running => by
      rw [lift_id, lift_id]
      exact step_before_done program tree configuration running)
    ticks (initial program tree origin) (by rw [execution]; rfl)
  rw [lift_id, execution, lift_id] at lifted
  exact ⟨used, entered, after,
    Nat.le_trans (Nat.add_le_add_right bounded _) paid, lifted, outcome, ticks, execution⟩

theorem entered_restart (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (after : Cursor) :
    step (machine program tree) ⟨some (.done true), after⟩ = initial program tree after := rfl

theorem stopped_absorbs (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (after : Cursor) (ticks : Nat) :
    run (machine program tree) ticks ⟨some (.done false), after⟩ = ⟨some (.done false), after⟩ := by
  induction ticks with
  | zero => rfl
  | succ ticks ih => exact ih

inductive Peels (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Cursor → Cursor → Prop where
  | done (origin : Cursor)
      (stops : ∃ ticks, run (base program tree) ticks (initial program tree origin) = ⟨some (.done false), origin⟩) :
      Peels program tree origin origin
  | next (origin : Cursor) (view : CheckpointDecoder.LocalView program)
      (parsed : CheckpointDecoder.parseLocal? program tree origin.focus = some view)
      (left audit : Term) (shape : origin.focus = .app left (.app view.continuation audit))
      (enters : ∃ ticks, run (base program tree) ticks (initial program tree origin) =
        ⟨some (.done true), ⟨view.continuation, .left audit :: .right left :: origin.parents⟩⟩)
      {endpoint : Cursor}
      (rest : Peels program tree ⟨view.continuation, .left audit :: .right left :: origin.parents⟩ endpoint) :
      Peels program tree origin endpoint

def Within (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) : Prop :=
  ∃ ticks endpoint, ticks ≤ coefficient program tree * origin.focus.size ∧
    run (machine program tree) ticks (initial program tree origin) = ⟨some (.done false), endpoint⟩ ∧
    Peels program tree origin endpoint ∧
    RootResetCarrierScanParentBoundary.carrierParent? endpoint.parents.head? = false

theorem scan_within (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin : Cursor) (boundary : RootResetCarrierScanParentBoundary.carrierParent? origin.parents.head? = false) :
    Within program tree origin := by
  have auxiliary : ∀ size, ∀ origin : Cursor, origin.focus.size = size →
      RootResetCarrierScanParentBoundary.carrierParent? origin.parents.head? = false → Within program tree origin := by
    intro size
    induction size using Nat.strongRecOn with
    | ind size ih =>
      intro origin sizeEq boundary
      obtain ⟨used, entered, after, paid, execution, outcome, reference⟩ := one_phase program tree origin boundary
      cases outcome with
      | stopped =>
          exact ⟨used, origin, by simpa only [RootResetMixedLocalAmortized.Paid, Bool.false_eq_true, ↓reduceIte, Nat.add_zero] using paid,
            execution, .done origin reference, boundary⟩
      | entered view parsed left audit shape =>
          let after : Cursor := ⟨view.continuation, .left audit :: .right left :: origin.parents⟩
          have nextBoundary : RootResetCarrierScanParentBoundary.carrierParent? after.parents.head? = false := rfl
          have smaller : after.focus.size < origin.focus.size := RootResetMixedLocalAmortized.continuation_gap parsed
          have smallerIndex : after.focus.size < size := by rw [← sizeEq]; exact smaller
          obtain ⟨restTicks, endpoint, restBound, restRun, restPeels, finalBoundary⟩ := ih _ smallerIndex after rfl nextBoundary
          refine ⟨used + 1 + restTicks, endpoint, ?_, ?_, .next origin view parsed left audit shape reference restPeels, finalBoundary⟩
          · have combined := Nat.add_le_add_left restBound (used + 1)
            apply Nat.le_trans combined
            simpa only [RootResetMixedLocalAmortized.Paid, ↓reduceIte, Nat.add_assoc] using paid
          · have firstRun : run (machine program tree) (used + 1) (initial program tree origin) = initial program tree after := by
              rw [run_add, execution]
              exact entered_restart program tree after
            rw [run_add, firstRun]
            exact restRun
  exact auxiliary origin.focus.size origin rfl boundary

theorem mutationCount_zero (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (configuration : Configuration (Control program tree)) : mutationCount (machine program tree) configuration = 0 := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => rfl
  | some state =>
      have zero := RootResetMixedLocalFragment.mutationCount_zero program tree ⟨some state, cursor⟩
      cases state with
      | done entered => cases entered <;> rfl
      | marked pc => exact zero
      | fresh pc => exact zero
      | probing pc => exact zero
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

theorem all_input_atRoot (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (source : Term) :
    ∃ ticks endpoint, ticks ≤ coefficient program tree * source.size ∧
      run (machine program tree) ticks (initial program tree (Cursor.atRoot source)) = ⟨some (.done false), endpoint⟩ ∧
      Peels program tree (Cursor.atRoot source) endpoint ∧ endpoint.erase = source := by
  obtain ⟨ticks, endpoint, bounded, execution, peels, boundary⟩ := scan_within program tree (Cursor.atRoot source) rfl
  have erased := erase_run program tree ticks (initial program tree (Cursor.atRoot source))
  rw [execution] at erased
  exact ⟨ticks, endpoint, bounded, execution, peels, erased⟩

end PureSFormal.Research.RootResetMixedContinuationSpine
