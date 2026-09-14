import PureSFormal.Research.RootResetCompletedLocalFragment

/-!
# Linear finite traversal of completed marked continuations

The completed-Local pattern fragment is given one feedback transition: its
successful RL-entry boundary restarts the same fragment at the continuation.
For every finite source this fixed finite controller terminates after peeling
exactly a sequence of parsed marked Local parents. The first failed marked
admission is an absorbing endpoint. The bound is coefficient * source.size,
where the explicit coefficient depends only on the fixed program and tree.
No term mutation, counter, stored path, or semantic parser is part of the
transition table. The Peels proof relates execution to completed-Local peeling.
Fresh nonempty and pending-parent admission are separate components.
-/
namespace PureSFormal.Research.RootResetMarkedContinuationSpine

open PureSFormal.PureS
open FiniteController
open RootResetPatternFragment

variable (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))

abbrev Control := RootResetCompletedLocalFragment.Control .marked program tree
abbrev base := RootResetCompletedLocalFragment.machine .marked program tree
abbrev initial := RootResetCompletedLocalFragment.initial .marked program tree
abbrev entry := RootResetCompletedLocalFragment.entry .marked program tree
abbrev whole := RootResetCompletedLocalFragment.whole .marked program tree

def transition (state : Control program tree) (node : Probe.NodeKind) (incoming : Probe.Incoming) :
    Command (Control program tree) :=
  match state.val with
  | .answer true => .stay ⟨entry program tree, RootResetCompletedLocalFragment.entry_mem .marked program tree⟩
  | _ => (base program tree).transition state node incoming

def machine : Machine (Control program tree) :=
  ⟨(base program tree).stateCover, (base program tree).covers, transition program tree⟩

def code? (configuration : Configuration (Control program tree)) : Option Code :=
  configuration.control.map Subtype.val

theorem true_absorbs (ticks : Nat) (configuration : Configuration (Control program tree))
    (atTrue : code? program tree configuration = some (.answer true)) :
    run (base program tree) ticks configuration = configuration := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => cases atTrue
  | some state =>
      have codeEq : state.val = .answer true := Option.some.inj atTrue
      rcases state with ⟨code, member⟩
      dsimp only at codeEq
      subst code
      exact RootResetPatternFragment.answer_absorbing _ true member cursor ticks

theorem step_eq_before_true (configuration : Configuration (Control program tree))
    (notTrue : code? program tree configuration ≠ some (.answer true)) :
    step (machine program tree) configuration = step (base program tree) configuration := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => rfl
  | some state =>
      rcases state with ⟨code, member⟩
      cases code with
      | answer bit =>
          cases bit with
          | false => rfl
          | true => exact False.elim (notTrue rfl)
      | observeNode onS onApp => rfl
      | observeIncoming onRoot onLeft onRight => rfl
      | move primitive next => rfl

theorem run_eq_before_true (ticks : Nat) (configuration : Configuration (Control program tree))
    (notTrue : code? program tree (run (base program tree) ticks configuration) ≠ some (.answer true)) :
    run (machine program tree) ticks configuration = run (base program tree) ticks configuration := by
  induction ticks generalizing configuration with
  | zero => rfl
  | succ ticks ih =>
      have initialNotTrue : code? program tree configuration ≠ some (.answer true) := by
        intro atTrue
        rw [true_absorbs program tree (ticks + 1) configuration atTrue] at notTrue
        exact notTrue atTrue
      rw [run_succ, step_eq_before_true program tree configuration initialNotTrue]
      exact ih _ notTrue

theorem enter_restart (member : RootResetCompletedLocalFragment.enter ∈ (whole program tree).nodes)
    (left continuation audit : Term) (parents : List ParentFrame) :
    run (machine program tree) 3
      ⟨some ⟨RootResetCompletedLocalFragment.enter, member⟩,
        ⟨.app left (.app continuation audit), parents⟩⟩ =
      initial program tree ⟨continuation, .left audit :: .right left :: parents⟩ := rfl

theorem admitted_runs (source : Term) (view : CheckpointDecoder.LocalView program)
    (statusEq : view.status = .marked)
    (parsed : CheckpointDecoder.parseLocal? program tree source = some view)
    (parents : List ParentFrame) :
    ∃ left audit,
      source = .app left (.app view.continuation audit) ∧
      run (machine program tree)
        (RootResetCompletedLocalFragment.familyTicks
          (RootResetCompletedLocalPatterns.localPatterns .marked program tree) source + 3)
        (initial program tree ⟨source, parents⟩) =
      initial program tree ⟨view.continuation, .left audit :: .right left :: parents⟩ := by
  obtain ⟨haltField, dispatcher, seedAudit, continuationAudit, _, _, sourceEq⟩ :=
    CheckpointDecoder.parseLocal?_sound parsed
  subst source
  have accepted := (RootResetCompletedLocalPatterns.accepts_iff_parse .marked program tree _).mpr
    ⟨view, statusEq, parsed⟩
  obtain ⟨member, probeRun⟩ := RootResetCompletedLocalFragment.probe_runs .marked program tree
    ⟨CheckpointDecoder.openShell haltField dispatcher view.seedPayload seedAudit view.continuation continuationAudit, parents⟩
  simp only [accepted, ↓reduceIte] at member probeRun
  have noTrue : code? program tree (run (base program tree)
      (RootResetCompletedLocalFragment.familyTicks
        (RootResetCompletedLocalPatterns.localPatterns .marked program tree)
        (CheckpointDecoder.openShell haltField dispatcher view.seedPayload seedAudit view.continuation continuationAudit))
      (initial program tree ⟨CheckpointDecoder.openShell haltField dispatcher view.seedPayload seedAudit
        view.continuation continuationAudit, parents⟩)) ≠ some (.answer true) := by
    rw [probeRun]
    intro equal
    cases Option.some.inj equal
  refine ⟨_, continuationAudit, rfl, ?_⟩
  rw [run_add, run_eq_before_true program tree _ _ noTrue, probeRun]
  exact enter_restart program tree _ _ _ _ parents

theorem missed_runs (source : Term) (parents : List ParentFrame)
    (missed : RootResetCompletedLocalPatterns.accepts .marked program tree source = false) :
    ∃ noMember : ProbeCompiler.Control.answer false ∈ (whole program tree).nodes,
      run (machine program tree)
        (RootResetCompletedLocalFragment.familyTicks
          (RootResetCompletedLocalPatterns.localPatterns .marked program tree) source)
        (initial program tree ⟨source, parents⟩) =
        ⟨some ⟨.answer false, noMember⟩, ⟨source, parents⟩⟩ := by
  obtain ⟨member, execution⟩ := RootResetCompletedLocalFragment.missed_runs .marked program tree
    ⟨source, parents⟩ missed
  refine ⟨member, ?_⟩
  rw [run_eq_before_true program tree _ _]
  · exact execution
  · rw [execution]
    intro equal
    cases Option.some.inj equal


def coefficient : Nat := RootResetCompletedLocalFragment.familyBound
  (RootResetCompletedLocalPatterns.localPatterns .marked program tree) + 3

inductive Peels : Cursor → Cursor → Prop where
  | done (source : Term) (parents : List ParentFrame)
      (missed : RootResetCompletedLocalPatterns.accepts .marked program tree source = false) :
      Peels ⟨source, parents⟩ ⟨source, parents⟩
  | next (source : Term) (parents : List ParentFrame)
      (view : CheckpointDecoder.LocalView program) (marked : view.status = .marked)
      (parsed : CheckpointDecoder.parseLocal? program tree source = some view)
      (left audit : Term) (shape : source = .app left (.app view.continuation audit))
      {endpoint : Cursor}
      (rest : Peels ⟨view.continuation, .left audit :: .right left :: parents⟩ endpoint) :
      Peels ⟨source, parents⟩ endpoint

def Within (source : Term) (parents : List ParentFrame) : Prop :=
  ∃ ticks endpoint noMember,
    ticks ≤ coefficient program tree * source.size ∧
    run (machine program tree) ticks (initial program tree ⟨source, parents⟩) =
      ⟨some ⟨ProbeCompiler.Control.answer false, noMember⟩, endpoint⟩ ∧
    Peels program tree ⟨source, parents⟩ endpoint

theorem prefix_bound (source : Term) :
    RootResetCompletedLocalFragment.familyTicks
      (RootResetCompletedLocalPatterns.localPatterns .marked program tree) source + 3 ≤
      coefficient program tree :=
  Nat.add_le_add_right (RootResetCompletedLocalFragment.familyTicks_bound _ source) 3

theorem missed_bound (source : Term) :
    RootResetCompletedLocalFragment.familyTicks
      (RootResetCompletedLocalPatterns.localPatterns .marked program tree) source ≤
      coefficient program tree * source.size := by
  apply Nat.le_trans (RootResetCompletedLocalFragment.familyTicks_bound _ source)
  apply Nat.le_trans (Nat.le_add_right _ 3)
  simpa only [Nat.mul_one] using! Nat.mul_le_mul_left (coefficient program tree) (Term.size_pos source)

theorem combine_bound (source continuation : Term) (before after : Nat)
    (beforeBound : before ≤ coefficient program tree)
    (afterBound : after ≤ coefficient program tree * continuation.size)
    (smaller : continuation.size < source.size) :
    before + after ≤ coefficient program tree * source.size := by
  calc
    before + after ≤ coefficient program tree + coefficient program tree * continuation.size :=
      Nat.add_le_add beforeBound afterBound
    _ = coefficient program tree * (continuation.size + 1) := by
      rw [Nat.mul_add, Nat.mul_one, Nat.add_comm]
    _ ≤ coefficient program tree * source.size := Nat.mul_le_mul_left _ smaller

theorem scan_within (source : Term) (parents : List ParentFrame) : Within program tree source parents := by
  have auxiliary : ∀ size, ∀ source : Term, source.size = size →
      ∀ parents : List ParentFrame, Within program tree source parents := by
    intro size
    induction size using Nat.strongRecOn with
    | ind size ih =>
      intro source sizeEq parents
      cases accepted : RootResetCompletedLocalPatterns.accepts .marked program tree source with
      | false =>
          obtain ⟨member, execution⟩ := missed_runs program tree source parents accepted
          exact ⟨_, _, member, missed_bound program tree source, execution, .done source parents accepted⟩
      | true =>
          obtain ⟨view, marked, parsed⟩ :=
            (RootResetCompletedLocalPatterns.accepts_iff_parse .marked program tree source).mp accepted
          have smaller := CheckpointDecoder.parseLocal?_continuation_size_lt parsed
          obtain ⟨left, audit, shape, beforeRun⟩ := admitted_runs program tree source view marked parsed parents
          have smallerIndex : view.continuation.size < size := by rw [← sizeEq]; exact smaller
          obtain ⟨afterTicks, endpoint, member, afterBound, afterRun, afterPeels⟩ :=
            ih view.continuation.size smallerIndex view.continuation rfl (.left audit :: .right left :: parents)
          refine ⟨_ + afterTicks, endpoint, member,
            combine_bound program tree source view.continuation _ _ (prefix_bound program tree source) afterBound smaller,
            ?_, .next source parents view marked parsed left audit shape afterPeels⟩
          rw [run_add, beforeRun]
          exact afterRun
  exact auxiliary source.size source rfl parents

theorem mutationCount_eq (configuration : Configuration (Control program tree)) :
    mutationCount (machine program tree) configuration = mutationCount (base program tree) configuration := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => rfl
  | some state =>
      rcases state with ⟨code, member⟩
      cases code with
      | answer bit => cases bit <;> rfl
      | observeNode onS onApp => rfl
      | observeIncoming onRoot onLeft onRight => rfl
      | move primitive next => rfl

theorem mutationCount_zero (configuration : Configuration (Control program tree)) :
    mutationCount (machine program tree) configuration = 0 := by
  rw [mutationCount_eq]
  exact RootResetPatternFragment.mutationCount_zero _
    (RootResetCompletedLocalFragment.readOnly .marked program tree) configuration

theorem runMutationCount_zero (ticks : Nat) (configuration : Configuration (Control program tree)) :
    runMutationCount (machine program tree) ticks configuration = 0 := by
  induction ticks generalizing configuration with
  | zero => rfl
  | succ ticks ih => rw [runMutationCount, mutationCount_zero, ih, Nat.zero_add]

theorem erase_run (ticks : Nat) (configuration : Configuration (Control program tree)) :
    (run (machine program tree) ticks configuration).cursor.erase = configuration.cursor.erase := by
  have projection := run_projects_stepsN (machine program tree) ticks configuration
  rw [runMutationCount_zero] at projection
  exact (StepsN.eq_of_zero projection).symm

theorem false_absorbs (ticks : Nat) (member : ProbeCompiler.Control.answer false ∈ (whole program tree).nodes)
    (cursor : Cursor) :
    run (machine program tree) ticks ⟨some ⟨.answer false, member⟩, cursor⟩ =
      ⟨some ⟨.answer false, member⟩, cursor⟩ := by
  induction ticks with
  | zero => rfl
  | succ ticks ih => exact ih


theorem Peels.endpoint_misses {origin endpoint : Cursor} (peeled : Peels program tree origin endpoint) :
    RootResetCompletedLocalPatterns.accepts .marked program tree endpoint.focus = false := by
  induction peeled with
  | done source parents missed => exact missed
  | next source parents view marked parsed left audit shape rest ih => exact ih

theorem Peels.erase {origin endpoint : Cursor} (peeled : Peels program tree origin endpoint) :
    endpoint.erase = origin.erase := by
  induction peeled with
  | done source parents missed => rfl
  | next source parents view marked parsed left audit shape rest ih =>
      rw [ih]
      change Cursor.rebuild parents (.app left (.app view.continuation audit)) = Cursor.rebuild parents source
      rw [shape]

theorem states_length : (machine program tree).states.length = (whole program tree).size :=
  RootResetPatternFragment.states_length _

theorem coefficient_pos : 0 < coefficient program tree :=
  Nat.lt_of_lt_of_le (by decide : 0 < 3) (Nat.le_add_left 3 _)

theorem atRoot_within (source : Term) :
    ∃ ticks endpoint noMember,
      ticks ≤ coefficient program tree * source.size ∧
      run (machine program tree) ticks (initial program tree (Cursor.atRoot source)) =
        ⟨some ⟨ProbeCompiler.Control.answer false, noMember⟩, endpoint⟩ ∧
      Peels program tree (Cursor.atRoot source) endpoint ∧
      endpoint.erase = source ∧
      RootResetCompletedLocalPatterns.accepts .marked program tree endpoint.focus = false := by
  obtain ⟨ticks, endpoint, member, bound, execution, peels⟩ := scan_within program tree source []
  exact ⟨ticks, endpoint, member, bound, execution, peels,
    Peels.erase program tree peels, Peels.endpoint_misses program tree peels⟩


end PureSFormal.Research.RootResetMarkedContinuationSpine
