import PureSFormal.Research.RootResetPendingAdmissionPatterns
import PureSFormal.Research.RootResetMixedLocalFragment
import PureSFormal.Research.RootResetCleanTraversableParents
import PureSFormal.Research.RootResetCompleteCarrierRows

/-! A constant-cost, exact-restoring test for the immediate pending parent.
Only a right child is inspected: one U, a fixed pattern, and one R restore. -/
namespace PureSFormal.Research.RootResetPendingParentProbe
open PureSFormal.PureS
open FiniteController
open RootResetCarrierNonemptyProbe (mapCommand liftConfiguration commandCount_eq_mutationCount commandCount_map)

abbrev pattern (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :=
  RootResetPendingAdmissionPatterns.pendingPattern (compileActions program tree) .hole
abbrev classifier (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :=
  RootResetCompletedLocalFragment.familyCode [pattern program tree] (.answer true) (.answer false)

inductive Control (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) where
  | start
  | probing (pc : RootResetPatternFragment.PC (classifier program tree))
  | done (pending : Bool)

def cover (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : List (Control program tree) :=
  [.start, .done false, .done true] ++
    (RootResetPatternFragment.machine (classifier program tree)).states.map .probing

theorem covers (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (state : Control program tree) :
    state ∈ cover program tree := by
  apply List.mem_append.mpr
  cases state with
  | start => exact Or.inl (List.Mem.head _)
  | done bit =>
      apply Or.inl
      cases bit
      · exact List.Mem.tail _ (List.Mem.head _)
      · exact List.Mem.tail _ (List.Mem.tail _ (List.Mem.head _))
  | probing pc => exact Or.inr (RootResetCompletedLocalPatterns.map_member _
      ((RootResetPatternFragment.machine (classifier program tree)).covers pc))

def transition (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (state : Control program tree) (node : Probe.NodeKind) (incoming : Probe.Incoming) : Command (Control program tree) :=
  match state with
  | .start => match incoming with
    | .root | .left => .stay (.done false)
    | .right => .exec .U (.probing ⟨classifier program tree, ProbeCompiler.Control.self_mem_nodes _⟩)
  | .probing pc => match pc.val with
    | .answer bit => .exec .R (.done bit)
    | _ => mapCommand .probing ((RootResetPatternFragment.machine (classifier program tree)).transition pc node incoming)
  | .done pending => .stay (.done pending)

def machine (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Machine (Control program tree) :=
  ⟨fun _ => cover program tree, covers program tree, transition program tree⟩

def initial (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) : Configuration (Control program tree) :=
  ⟨some .start, origin⟩
def probeInitial (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) : Configuration (Control program tree) :=
  liftConfiguration .probing (RootResetPatternFragment.initial (classifier program tree) origin)

def value (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) : Bool :=
  match origin.parents with
  | .right sibling :: _ => (pattern program tree).matchesBool (.app sibling origin.focus)
  | _ => false

def done? {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    (configuration : Configuration (Control program tree)) : Bool :=
  match configuration.control with | some (.done _) => true | _ => false

def coefficient (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Nat :=
  RootResetCompletedLocalFragment.familyBound [pattern program tree] + 2

theorem probing_step (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (configuration : Configuration (RootResetPatternFragment.PC (classifier program tree)))
    (running : RootResetCarrierNonemptyProbe.anyAnswer? configuration = false) :
    step (machine program tree) (liftConfiguration Control.probing configuration) =
      liftConfiguration Control.probing (step (RootResetPatternFragment.machine (classifier program tree)) configuration) := by
  apply RootResetCarrierNonemptyProbe.step_lift
  intro state current
  rcases configuration with ⟨runtime, cursor⟩
  have equal : runtime = some state := current
  subst runtime
  rcases state with ⟨pc, member⟩
  cases pc with
  | answer bit => cases running
  | observeNode onS onApp => rfl
  | observeIncoming onRoot onLeft onRight => rfl
  | move operation next => rfl

theorem classify_runs (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (sibling child : Term) (parents : List ParentFrame) :
    ∃ used, used ≤ RootResetCompletedLocalFragment.familyBound [pattern program tree] ∧
      run (machine program tree) (used + 1) (probeInitial program tree ⟨.app sibling child, parents⟩) =
        ⟨some (.done ((pattern program tree).matchesBool (.app sibling child))), ⟨child, .right sibling :: parents⟩⟩ := by
  obtain ⟨member, execution⟩ := RootResetCompletedLocalFragment.family_runs [pattern program tree]
    (.answer true) (.answer false) (classifier program tree) ⟨.app sibling child, parents⟩ (fun _ h => h)
  simp only [List.any_cons, List.any_nil, Bool.or_false] at member execution
  have selectedEq : (if (pattern program tree).matchesBool (.app sibling child) = true then
      ProbeCompiler.Control.answer true else ProbeCompiler.Control.answer false) =
      ProbeCompiler.Control.answer ((pattern program tree).matchesBool (.app sibling child)) := by
    cases (pattern program tree).matchesBool (.app sibling child) <;> rfl
  rw [selectedEq] at member
  simp only [selectedEq] at execution
  change run (RootResetPatternFragment.machine (classifier program tree))
    (RootResetCompletedLocalFragment.familyTicks [pattern program tree] (.app sibling child))
    (RootResetPatternFragment.initial (classifier program tree) ⟨.app sibling child, parents⟩) = _ at execution
  obtain ⟨used, bounded, lifted⟩ := RootResetCarrierNonemptyProbe.run_to_boundary
    (RootResetPatternFragment.machine (classifier program tree)) (machine program tree) Control.probing
    RootResetCarrierNonemptyProbe.anyAnswer? (RootResetMixedLocalFragment.classify_absorbs (classifier program tree))
    (probing_step program tree) (RootResetCompletedLocalFragment.familyTicks [pattern program tree] (.app sibling child))
    (RootResetPatternFragment.initial (classifier program tree) ⟨.app sibling child, parents⟩)
    (by rw [execution]; rfl)
  rw [execution] at lifted
  refine ⟨used, Nat.le_trans bounded (RootResetCompletedLocalFragment.familyTicks_bound _ _), ?_⟩
  rw [probeInitial, run_add, lifted]
  have finish (bit : Bool) (member : ProbeCompiler.Control.answer bit ∈ ProbeCompiler.Control.nodes (classifier program tree)) :
      run (machine program tree) 1 (liftConfiguration Control.probing
        ⟨some ⟨.answer bit, member⟩, ⟨.app sibling child, parents⟩⟩) =
        ⟨some (.done bit), ⟨child, .right sibling :: parents⟩⟩ := rfl
  exact finish _ member

theorem all_input (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) :
    ∃ ticks, ticks ≤ coefficient program tree ∧
      run (machine program tree) ticks (initial program tree origin) = ⟨some (.done (value program tree origin)), origin⟩ := by
  rcases origin with ⟨source, parents⟩
  cases parents with
  | nil => exact ⟨1, Nat.le_trans (by decide : 1 ≤ 2) (Nat.le_add_left _ _), rfl⟩
  | cons frame parents => cases frame with
    | left sibling => exact ⟨1, Nat.le_trans (by decide : 1 ≤ 2) (Nat.le_add_left _ _), rfl⟩
    | right sibling =>
        obtain ⟨used, bounded, execution⟩ := classify_runs program tree sibling source parents
        refine ⟨1 + (used + 1), ?_, ?_⟩
        · simpa only [coefficient, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using Nat.add_le_add_right bounded 2
        · rw [run_add]
          exact execution

theorem pending_value (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (payload continuation child : Term) (parents : List ParentFrame) :
    value program tree ⟨child, .right (.app (CheckpointDecoder.openEnvironment (compileActions program tree) payload) continuation) :: parents⟩ = true :=
  RootResetPendingAdmissionPatterns.pending_matches _ _ _ _ .hole rfl

theorem cleanParents_value {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {layers : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents layers) (endpoint : Term) :
    value program layout.tree ⟨endpoint, parents⟩ = false := by
  cases outer <;> rfl

theorem true_boundary {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {origin : Cursor} (accepted : value program tree origin = true) : RootResetCompleteCarrierRows.Boundary origin := by
  rcases origin with ⟨source, parents⟩
  cases parents with
  | nil => cases accepted
  | cons frame parents => cases frame with
    | left sibling => cases accepted
    | right sibling =>
        obtain ⟨payload, continuation, child, shape, matched⟩ := RootResetPendingAdmissionPatterns.pending_sound
          (compileActions program tree) (.app sibling source) .hole accepted
        have siblingEq := (Term.app.inj shape).1
        rw [siblingEq]
        refine ⟨RootResetPendingAdmissionPatterns.admitted_parent_boundary _ _ _, ?_, ?_⟩
        all_goals
          simp [RootResetCarrierInverseUnique.parentFunction, CheckpointDecoder.openEnvironment,
            live, b, actCode, haltCode, haltTag, valueTag, v0, v1]

theorem done_absorbs (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (pending : Bool) (origin : Cursor) (ticks : Nat) :
    run (machine program tree) ticks ⟨some (.done pending), origin⟩ = ⟨some (.done pending), origin⟩ := by
  induction ticks with
  | zero => rfl
  | succ ticks ih => exact ih

theorem terminal_absorbs (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (configuration : Configuration (Control program tree)) (ended : done? configuration = true) (ticks : Nat) :
    run (machine program tree) ticks configuration = configuration := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => cases ended
  | some state => cases state with
    | done pending => exact done_absorbs program tree pending cursor ticks
    | probing pc => cases ended
    | start => cases ended

theorem mutationCount_zero (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (configuration : Configuration (Control program tree)) : mutationCount (machine program tree) configuration = 0 := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => rfl
  | some state =>
      rw [← commandCount_eq_mutationCount]
      cases state with
      | done pending => rfl
      | start => cases Probe.observeIncoming cursor <;> rfl
      | probing pc =>
          rcases pc with ⟨code, member⟩
          have safe : (classifier program tree).NoRdx :=
            RootResetCompletedLocalFragment.family_readOnly _ _ _ True.intro True.intro
          have zero := RootResetPatternFragment.mutationCount_zero _ safe ⟨some ⟨code, member⟩, cursor⟩
          cases code <;> try rfl
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

end PureSFormal.Research.RootResetPendingParentProbe
