import PureSFormal.Research.RootResetMixedLocalFragment
import PureSFormal.Research.RootResetProgressTotality

/-! A fixed finite upward search for the nearest completed fresh Local.
It includes the starting cursor, returns the exact first matching ancestor,
and ends at the root when no ancestor matches. -/
namespace PureSFormal.Research.RootResetFreshAncestorProbe
open PureSFormal.PureS
open FiniteController
open RootResetCarrierNonemptyProbe (mapCommand liftConfiguration commandCount_eq_mutationCount commandCount_map)

abbrev classifier (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :=
  RootResetMixedLocalFragment.classifier .fresh program tree

inductive Control (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) where
  | probing (pc : RootResetPatternFragment.PC (classifier program tree))
  | ascend
  | done (found : Bool)

def cover (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : List (Control program tree) :=
  [.ascend, .done false, .done true] ++
    (RootResetPatternFragment.machine (classifier program tree)).states.map .probing

theorem covers (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (state : Control program tree) :
    state ∈ cover program tree := by
  apply List.mem_append.mpr
  cases state with
  | ascend => exact Or.inl (List.Mem.head _)
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
  | .probing pc => match pc.val with
    | .answer true => .stay (.done true)
    | .answer false => .stay .ascend
    | _ => mapCommand .probing ((RootResetPatternFragment.machine (classifier program tree)).transition pc node incoming)
  | .ascend => match incoming with
    | .root => .stay (.done false)
    | .left | .right => .exec .U (.probing ⟨classifier program tree, ProbeCompiler.Control.self_mem_nodes _⟩)
  | .done found => .stay (.done found)

def machine (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Machine (Control program tree) :=
  ⟨fun _ => cover program tree, covers program tree, transition program tree⟩

def initial (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) : Configuration (Control program tree) :=
  liftConfiguration .probing (RootResetPatternFragment.initial (classifier program tree) origin)

def done? {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    (configuration : Configuration (Control program tree)) : Bool :=
  match configuration.control with | some (.done _) => true | _ => false

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

def coefficient (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Nat :=
  RootResetMixedLocalFragment.classifyBound .fresh program tree + 2

theorem classify_runs (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) :
    ∃ used, used ≤ RootResetMixedLocalFragment.classifyBound .fresh program tree ∧
      run (machine program tree) (used + 1) (initial program tree origin) =
        if RootResetCompletedLocalPatterns.accepts .fresh program tree origin.focus then
          ⟨some (.done true), origin⟩ else ⟨some .ascend, origin⟩ := by
  obtain ⟨member, execution⟩ := RootResetMixedLocalFragment.classifier_runs .fresh program tree origin
  obtain ⟨used, bounded, lifted⟩ := RootResetCarrierNonemptyProbe.run_to_boundary
    (RootResetPatternFragment.machine (classifier program tree)) (machine program tree) Control.probing
    RootResetCarrierNonemptyProbe.anyAnswer? (RootResetMixedLocalFragment.classify_absorbs (classifier program tree))
    (probing_step program tree) _ (RootResetPatternFragment.initial (classifier program tree) origin)
    (by rw [execution]; rfl)
  rw [execution] at lifted
  refine ⟨used, Nat.le_trans bounded (RootResetCompletedLocalFragment.familyTicks_bound _ _), ?_⟩
  rw [initial, run_add, lifted]
  have finish (bit : Bool) (member : ProbeCompiler.Control.answer bit ∈ ProbeCompiler.Control.nodes (classifier program tree)) :
      run (machine program tree) 1 (liftConfiguration Control.probing ⟨some ⟨.answer bit, member⟩, origin⟩) =
        if bit then ⟨some (.done true), origin⟩ else ⟨some .ascend, origin⟩ := by
    cases bit <;> rfl
  exact finish _ member

inductive First (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Cursor → Bool → Cursor → Prop where
  | found (origin : Cursor) (accepted : RootResetCompletedLocalPatterns.accepts .fresh program tree origin.focus = true) :
      First program tree origin true origin
  | root (source : Term) (refused : RootResetCompletedLocalPatterns.accepts .fresh program tree source = false) :
      First program tree ⟨source, []⟩ false ⟨source, []⟩
  | parent (source : Term) (frame : ParentFrame) (parents : List ParentFrame)
      (refused : RootResetCompletedLocalPatterns.accepts .fresh program tree source = false)
      {found : Bool} {endpoint : Cursor}
      (rest : First program tree ⟨frame.fill source, parents⟩ found endpoint) :
      First program tree ⟨source, frame :: parents⟩ found endpoint

theorem all_input_depth (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (source : Term) (parents : List ParentFrame) :
    ∃ ticks found endpoint, ticks ≤ coefficient program tree * (parents.length + 1) ∧
      run (machine program tree) ticks (initial program tree ⟨source, parents⟩) = ⟨some (.done found), endpoint⟩ ∧
      First program tree ⟨source, parents⟩ found endpoint := by
  induction parents generalizing source with
  | nil =>
      obtain ⟨used, bounded, execution⟩ := classify_runs program tree ⟨source, []⟩
      cases accepted : RootResetCompletedLocalPatterns.accepts .fresh program tree source with
      | true =>
          rw [accepted] at execution
          refine ⟨used + 1, true, ⟨source, []⟩, ?_, execution, .found _ accepted⟩
          simpa only [List.length_nil, Nat.zero_add, Nat.mul_one, coefficient, Nat.add_assoc] using
            Nat.le_trans (Nat.add_le_add_right bounded 1) (Nat.le_add_right (_ + 1) 1)
      | false =>
          rw [accepted] at execution
          refine ⟨used + 1 + 1, false, ⟨source, []⟩, ?_, ?_, .root source accepted⟩
          · simpa only [List.length_nil, Nat.zero_add, Nat.mul_one, coefficient, Nat.add_assoc] using Nat.add_le_add_right bounded 2
          rw [run_add, execution]
          rfl
  | cons frame parents ih =>
      obtain ⟨used, bounded, execution⟩ := classify_runs program tree ⟨source, frame :: parents⟩
      cases accepted : RootResetCompletedLocalPatterns.accepts .fresh program tree source with
      | true =>
          rw [accepted] at execution
          refine ⟨used + 1, true, ⟨source, frame :: parents⟩, ?_, execution, .found _ accepted⟩
          apply Nat.le_trans (Nat.add_le_add_right bounded 1)
          apply Nat.le_trans (Nat.le_add_right _ 1)
          exact Nat.le_mul_of_pos_right _ (Nat.succ_pos _)
      | false =>
          rw [accepted] at execution
          obtain ⟨rest, found, endpoint, restBound, restRun, first⟩ := ih (frame.fill source)
          refine ⟨used + 1 + 1 + rest, found, endpoint, ?_, ?_, .parent source frame parents accepted first⟩
          · have total := Nat.add_le_add (Nat.add_le_add_right bounded 2) restBound
            simpa only [coefficient, List.length_cons, Nat.mul_add, Nat.mul_one,
              Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using total
          · have firstRun : run (machine program tree) (used + 1 + 1)
                (initial program tree ⟨source, frame :: parents⟩) = initial program tree ⟨frame.fill source, parents⟩ := by
              rw [run_add, execution]
              cases frame <;> rfl
            rw [run_add, firstRun]
            exact restRun

theorem all_input (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) :
    ∃ ticks found endpoint, ticks ≤ coefficient program tree * origin.erase.size ∧
      run (machine program tree) ticks (initial program tree origin) = ⟨some (.done found), endpoint⟩ ∧
      First program tree origin found endpoint := by
  obtain ⟨ticks, found, endpoint, bounded, execution, first⟩ := all_input_depth program tree origin.focus origin.parents
  exact ⟨ticks, found, endpoint, Nat.le_trans bounded
    (Nat.mul_le_mul_left _ (RootResetProgressTotality.depth_succ_le_erase_size origin.focus origin.parents)), execution, first⟩

theorem First.unique {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {origin left right : Cursor} {leftFound rightFound : Bool}
    (first : First program tree origin leftFound left) (second : First program tree origin rightFound right) :
    leftFound = rightFound ∧ left = right := by
  induction first with
  | found origin accepted =>
      cases second with
      | found _ => exact ⟨rfl, rfl⟩
      | root source refused => rw [accepted] at refused; cases refused
      | parent source frame parents refused rest => rw [accepted] at refused; cases refused
  | root source refused =>
      cases second with
      | found origin accepted => rw [refused] at accepted; cases accepted
      | root _ => exact ⟨rfl, rfl⟩
  | parent source frame parents refused rest ih =>
      cases second with
      | found origin accepted => rw [refused] at accepted; cases accepted
      | parent _ _ _ _ other => exact ih other

theorem First.runs {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {origin endpoint : Cursor} {found : Bool} (first : First program tree origin found endpoint) :
    ∃ ticks, ticks ≤ coefficient program tree * origin.erase.size ∧
      run (machine program tree) ticks (initial program tree origin) = ⟨some (.done found), endpoint⟩ := by
  obtain ⟨ticks, actualFound, actualEndpoint, bounded, execution, actual⟩ := all_input program tree origin
  obtain ⟨foundEq, endpointEq⟩ := actual.unique first
  rw [foundEq, endpointEq] at execution
  exact ⟨ticks, bounded, execution⟩

theorem First.found_parsed {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {origin endpoint : Cursor} (first : First program tree origin true endpoint) :
    ∃ view : CheckpointDecoder.LocalView program, view.status = .fresh ∧
      CheckpointDecoder.parseLocal? program tree endpoint.focus = some view := by
  generalize foundEq : true = found at first
  induction first with
  | found origin accepted => exact (RootResetCompletedLocalPatterns.accepts_iff_parse .fresh program tree origin.focus).mp accepted
  | root source refused => cases foundEq
  | parent source frame parents refused rest ih => exact ih foundEq

theorem First.miss_root {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {origin endpoint : Cursor} (first : First program tree origin false endpoint) : endpoint.parents = [] := by
  generalize foundEq : false = found at first
  induction first with
  | found origin accepted => cases foundEq
  | root source refused => rfl
  | parent source frame parents refused rest ih => exact ih foundEq

theorem done_absorbs (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (found : Bool) (origin : Cursor) (ticks : Nat) :
    run (machine program tree) ticks ⟨some (.done found), origin⟩ = ⟨some (.done found), origin⟩ := by
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
    | done found => exact done_absorbs program tree found cursor ticks
    | probing pc => cases ended
    | ascend => cases ended

theorem mutationCount_zero (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (configuration : Configuration (Control program tree)) : mutationCount (machine program tree) configuration = 0 := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => rfl
  | some state =>
      rw [← commandCount_eq_mutationCount]
      cases state with
      | done found => rfl
      | ascend => cases Probe.observeIncoming cursor <;> rfl
      | probing pc =>
          rcases pc with ⟨code, member⟩
          have safe : (classifier program tree).NoRdx :=
            RootResetCompletedLocalFragment.family_readOnly _ _ _ True.intro True.intro
          have zero := RootResetPatternFragment.mutationCount_zero _ safe ⟨some ⟨code, member⟩, cursor⟩
          cases code <;> try { rename_i result; cases result <;> rfl }
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

end PureSFormal.Research.RootResetFreshAncestorProbe
