import PureSFormal.Research.RootResetMixedContinuationSpine
import PureSFormal.Research.RootResetNestedFrameProbe

/-!
# Linear finite Local traversal followed by scoped FRAME recognition

A finite handoff connects the mixed marked/fresh continuation machine to
the nested FRAME probe. FRAME misses preserve the selected endpoint;
successes focus a genuine redex. The complete read-only composition has an
explicit linear all-input bound. It does not interleave pending active
children with completed parents or implement clock/response/fallback choice.
-/

namespace PureSFormal.Research.RootResetMixedFrameProbe
open PureSFormal.PureS
open FiniteController
open RootResetCarrierNonemptyProbe

inductive Control (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) where
  | locals (pc : RootResetMixedContinuationSpine.Control program tree)
  | frame (pc : RootResetNestedFrameProbe.Control)

def cover (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : List (Control program tree) :=
  (RootResetMixedContinuationSpine.machine program tree).states.map Control.locals ++
  RootResetNestedFrameProbe.machine.states.map Control.frame

theorem covers (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (state : Control program tree) :
    state ∈ cover program tree := by
  cases state with
  | locals pc => exact List.mem_append.mpr (Or.inl (RootResetCompletedLocalPatterns.map_member _
      ((RootResetMixedContinuationSpine.machine program tree).covers pc)))
  | frame pc => exact List.mem_append.mpr (Or.inr (RootResetCompletedLocalPatterns.map_member _ (RootResetNestedFrameProbe.machine.covers pc)))

def transition (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (state : Control program tree) (node : Probe.NodeKind) (incoming : Probe.Incoming) : Command (Control program tree) :=
  match state with
  | .locals pc => match pc with
    | .done false => .stay (.frame (.descending ⟨RootResetEdgeSpine.whole RootResetNestedFramePatterns.pendingRows, ProbeCompiler.Control.self_mem_nodes _⟩))
    | _ => mapCommand Control.locals ((RootResetMixedContinuationSpine.machine program tree).transition pc node incoming)
  | .frame pc => mapCommand Control.frame (RootResetNestedFrameProbe.machine.transition pc node incoming)

def machine (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Machine (Control program tree) :=
  ⟨fun _ => cover program tree, covers program tree, transition program tree⟩

def initial (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) : Configuration (Control program tree) :=
  liftConfiguration Control.locals (RootResetMixedContinuationSpine.initial program tree origin)

def localDone? {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    (configuration : Configuration (RootResetMixedContinuationSpine.Control program tree)) : Bool :=
  match configuration.control with
  | some (.done false) => true
  | _ => false

theorem local_absorbs (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (configuration : Configuration (RootResetMixedContinuationSpine.Control program tree))
    (ended : localDone? configuration = true) (ticks : Nat) :
    run (RootResetMixedContinuationSpine.machine program tree) ticks configuration = configuration := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => cases ended
  | some state =>
      cases state with
      | done entered => cases entered with
        | false => exact RootResetMixedContinuationSpine.stopped_absorbs program tree cursor ticks
        | true => cases ended
      | marked pc => cases ended
      | fresh pc => cases ended
      | probing pc => cases ended
      | enterRight => cases ended
      | enterLeft => cases ended

theorem local_step (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (configuration : Configuration (RootResetMixedContinuationSpine.Control program tree))
    (running : localDone? configuration = false) :
    step (machine program tree) (liftConfiguration Control.locals configuration) =
      liftConfiguration Control.locals (step (RootResetMixedContinuationSpine.machine program tree) configuration) := by
  apply step_lift
  intro state current
  rcases configuration with ⟨runtime, cursor⟩
  have equal : runtime = some state := current
  subst runtime
  cases state with
  | done entered => cases entered with
    | false => cases running
    | true => rfl
  | marked pc => rfl
  | fresh pc => rfl
  | probing pc => rfl
  | enterRight => rfl
  | enterLeft => rfl

theorem frame_step (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (configuration : Configuration RootResetNestedFrameProbe.Control) :
    step (machine program tree) (liftConfiguration Control.frame configuration) =
      liftConfiguration Control.frame (step RootResetNestedFrameProbe.machine configuration) := by
  apply step_lift
  intro state current
  rfl

theorem frame_run (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (ticks : Nat) (configuration : Configuration RootResetNestedFrameProbe.Control) :
    run (machine program tree) ticks (liftConfiguration Control.frame configuration) =
      liftConfiguration Control.frame (run RootResetNestedFrameProbe.machine ticks configuration) := by
  induction ticks generalizing configuration with
  | zero => rfl
  | succ ticks ih => rw [run_succ, frame_step]; exact ih _

theorem local_run (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin endpoint : Cursor) (ticks : Nat)
    (execution : run (RootResetMixedContinuationSpine.machine program tree) ticks
      (RootResetMixedContinuationSpine.initial program tree origin) = ⟨some (.done false), endpoint⟩) :
    ∃ used, used ≤ ticks ∧ run (machine program tree) (used + 1) (initial program tree origin) =
      liftConfiguration Control.frame (RootResetNestedFrameProbe.initial endpoint) := by
  obtain ⟨used, bounded, lifted⟩ := run_to_boundary (RootResetMixedContinuationSpine.machine program tree)
    (machine program tree) Control.locals localDone? (local_absorbs program tree) (local_step program tree)
    ticks (RootResetMixedContinuationSpine.initial program tree origin) (by rw [execution]; rfl)
  rw [execution] at lifted
  refine ⟨used, bounded, ?_⟩
  change run (machine program tree) (used + 1)
    (liftConfiguration Control.locals (RootResetMixedContinuationSpine.initial program tree origin)) = _
  rw [run_add, lifted]
  rfl

theorem notRight_boundary (origin : Cursor) (notRight : RootResetNestedFramePatterns.rightParent? origin = false) :
    RootResetCarrierScanParentBoundary.carrierParent? origin.parents.head? = false := by
  rcases origin with ⟨focus, parents⟩
  cases parents with
  | nil => rfl
  | cons frame parents => cases frame with
    | left sibling => rfl
    | right sibling => cases notRight

theorem peels_notRight {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {origin endpoint : Cursor} (peels : RootResetMixedContinuationSpine.Peels program tree origin endpoint)
    (notRight : RootResetNestedFramePatterns.rightParent? origin = false) :
    RootResetNestedFramePatterns.rightParent? endpoint = false := by
  induction peels with
  | done origin stops => exact notRight
  | next origin view parsed left audit shape enters rest ih => exact ih rfl

theorem peels_size {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {origin endpoint : Cursor} (peels : RootResetMixedContinuationSpine.Peels program tree origin endpoint) :
    endpoint.focus.size ≤ origin.focus.size := by
  induction peels with
  | done origin stops => exact Nat.le_refl _
  | next origin view parsed left audit shape enters rest ih =>
      exact Nat.le_trans ih (Nat.le_of_lt (RootResetMixedLocalAmortized.continuation_gap parsed))

def coefficient (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Nat :=
  RootResetMixedContinuationSpine.coefficient program tree + RootResetNestedFrameProbe.coefficient + 1

theorem all_input (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin : Cursor) (notRight : RootResetNestedFramePatterns.rightParent? origin = false) :
    ∃ ticks selected ready endpoint, ticks ≤ coefficient program tree * origin.focus.size ∧
      run (machine program tree) ticks (initial program tree origin) = ⟨some (.frame (.done ready)), endpoint⟩ ∧
      RootResetMixedContinuationSpine.Peels program tree origin selected ∧
      (if ready then endpoint.rdx?.isSome = true else endpoint = selected) := by
  obtain ⟨localTicks, selected, localBound, localRun, peels, boundary⟩ :=
    RootResetMixedContinuationSpine.scan_within program tree origin (notRight_boundary origin notRight)
  obtain ⟨used, usedBound, handoffRun⟩ := local_run program tree origin selected localTicks localRun
  obtain ⟨frameTicks, ready, endpoint, frameBound, frameRun, result⟩ :=
    RootResetNestedFrameProbe.all_input selected (peels_notRight peels notRight)
  refine ⟨used + 1 + frameTicks, selected, ready, endpoint, ?_, ?_, peels, result⟩
  · have frameTotal := Nat.le_trans frameBound (Nat.mul_le_mul_left _ (peels_size peels))
    have combined := Nat.add_le_add (Nat.add_le_add (Nat.le_trans usedBound localBound) (Term.size_pos origin.focus)) frameTotal
    simpa only [coefficient, Nat.add_mul, Nat.one_mul, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using combined
  · rw [run_add, handoffRun, frame_run, frameRun]
    rfl


theorem mutationCount_zero (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (configuration : Configuration (Control program tree)) : mutationCount (machine program tree) configuration = 0 := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => rfl
  | some state =>
      rw [← commandCount_eq_mutationCount]
      cases state with
      | frame pc =>
          simp only [machine, transition, commandCount_map]
          rw [commandCount_eq_mutationCount]
          exact RootResetNestedFrameProbe.mutationCount_zero _
      | locals pc =>
          have zero := RootResetMixedContinuationSpine.mutationCount_zero program tree ⟨some pc, cursor⟩
          cases pc <;> try { rename_i entered; cases entered <;> rfl }
          all_goals
            simp only [machine, transition, commandCount_map]
            rw [commandCount_eq_mutationCount]
            exact zero

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
    ∃ ticks selected ready endpoint, ticks ≤ coefficient program tree * source.size ∧
      run (machine program tree) ticks (initial program tree (Cursor.atRoot source)) = ⟨some (.frame (.done ready)), endpoint⟩ ∧
      RootResetMixedContinuationSpine.Peels program tree (Cursor.atRoot source) selected ∧
      (if ready then endpoint.rdx?.isSome = true else endpoint = selected) ∧ endpoint.erase = source := by
  obtain ⟨ticks, selected, ready, endpoint, bounded, execution, peels, result⟩ := all_input program tree (Cursor.atRoot source) rfl
  have erased := erase_run program tree ticks (initial program tree (Cursor.atRoot source))
  rw [execution] at erased
  exact ⟨ticks, selected, ready, endpoint, bounded, execution, peels, result, erased⟩

end PureSFormal.Research.RootResetMixedFrameProbe
