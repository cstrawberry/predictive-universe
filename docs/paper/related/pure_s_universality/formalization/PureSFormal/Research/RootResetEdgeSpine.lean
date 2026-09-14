import PureSFormal.Research.RootResetEdgeFragment

/-!
# A linear finite controller for designated edge descent

The edge fragment's success state feeds back to the same finite entry row.
For a fixed family whose matched paths are proper subterm addresses, every
input terminates within (familyBound + 1) * source.size microsteps. Walks
records exactly the selected syntactic edges. Failed recognition is an
absorbing endpoint; all executions preserve the represented term.
-/

namespace PureSFormal.Research.RootResetEdgeSpine
open PureSFormal.PureS
open FiniteController
open RootResetPatternFragment
open RootResetCarrierEdgePatterns

variable (rows : List EdgeRow)

abbrev Control := RootResetEdgeFragment.Control rows
abbrev base := RootResetEdgeFragment.machine rows
abbrev initial := RootResetEdgeFragment.initial rows
abbrev whole := RootResetEdgeFragment.familyCode rows

def transition (state : Control rows) (node : Probe.NodeKind) (incoming : Probe.Incoming) :
    Command (Control rows) :=
  match state.val with
  | .answer true => .stay ⟨whole rows, ProbeCompiler.Control.self_mem_nodes _⟩
  | _ => (base rows).transition state node incoming

def machine : Machine (Control rows) :=
  ⟨(base rows).stateCover, (base rows).covers, transition rows⟩

def code? (configuration : Configuration (Control rows)) : Option Code :=
  configuration.control.map Subtype.val

theorem true_absorbs (ticks : Nat) (configuration : Configuration (Control rows))
    (atTrue : code? rows configuration = some (.answer true)) :
    run (base rows) ticks configuration = configuration := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => cases atTrue
  | some state =>
      have codeEq : state.val = .answer true := Option.some.inj atTrue
      rcases state with ⟨code, member⟩
      dsimp only at codeEq
      subst code
      exact RootResetPatternFragment.answer_absorbing _ true member cursor ticks

theorem step_eq_before_true (configuration : Configuration (Control rows))
    (notTrue : code? rows configuration ≠ some (.answer true)) :
    step (machine rows) configuration = step (base rows) configuration := by
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

theorem run_eq_before_true (ticks : Nat) (configuration : Configuration (Control rows))
    (notTrue : code? rows (run (base rows) ticks configuration) ≠ some (.answer true)) :
    run (machine rows) ticks configuration = run (base rows) ticks configuration := by
  induction ticks generalizing configuration with
  | zero => rfl
  | succ ticks ih =>
      have initialNotTrue : code? rows configuration ≠ some (.answer true) := by
        intro atTrue
        rw [true_absorbs rows (ticks + 1) configuration atTrue] at notTrue
        exact notTrue atTrue
      rw [run_succ, step_eq_before_true rows configuration initialNotTrue]
      exact ih _ notTrue

theorem path_restart (address : Address) (before after : Cursor)
    (followed : RootResetEdgeFragment.follow address before = some after)
    (member : RootResetEdgeFragment.pathCode address (.answer true) ∈ (whole rows).nodes) :
    run (machine rows) (address.length + 1)
      ⟨some ⟨RootResetEdgeFragment.pathCode address (.answer true), member⟩, before⟩ =
      initial rows after := by
  induction address generalizing before with
  | nil =>
      have equal : before = after := Option.some.inj followed
      subst before
      rfl
  | cons side rest ih =>
      rcases before with ⟨source, parents⟩
      cases source with
      | s => cases side <;> cases followed
      | app fn arg =>
          cases side with
          | left =>
              exact ih ⟨fn, .left arg :: parents⟩ followed
                (nodes_trans member (List.Mem.tail _ (ProbeCompiler.Control.self_mem_nodes _)))
          | right =>
              exact ih ⟨arg, .right fn :: parents⟩ followed
                (nodes_trans member (List.Mem.tail _ (ProbeCompiler.Control.self_mem_nodes _)))

theorem selected_runs (origin after : Cursor) (row : EdgeRow)
    (selected : RootResetEdgeFragment.select rows origin.focus = some row)
    (proper : row.address ≠ [])
    (followed : RootResetEdgeFragment.follow row.address origin = some after) :
    run (machine rows) (RootResetEdgeFragment.ticks rows origin.focus + 1) (initial rows origin) =
      initial rows after := by
  obtain ⟨member, probeRun⟩ := RootResetEdgeFragment.probe_runs rows (whole rows) origin (fun _ h => h)
  simp only [RootResetEdgeFragment.selectedCode, selected] at member probeRun
  have baseRun : run (base rows) (RootResetEdgeFragment.probeTicks rows origin.focus)
      (initial rows origin) =
      ⟨some ⟨RootResetEdgeFragment.pathCode row.address (.answer true), member⟩, origin⟩ := probeRun
  have notTrue : code? rows (run (base rows) (RootResetEdgeFragment.probeTicks rows origin.focus)
      (initial rows origin)) ≠ some (.answer true) := by
    rw [baseRun]
    change some (RootResetEdgeFragment.pathCode row.address (.answer true)) ≠ some (.answer true)
    cases addressEq : row.address with
    | nil => exact False.elim (proper addressEq)
    | cons side rest =>
        intro equal
        cases side <;> cases Option.some.inj equal
  have before := (run_eq_before_true rows _ _ notTrue).trans baseRun
  have afterRun := path_restart rows row.address origin after followed member
  have combined := (congrArg (run (machine rows) (row.address.length + 1)) before).trans afterRun
  simpa only [RootResetEdgeFragment.ticks, selected, run_add, Nat.add_assoc] using combined

theorem missed_runs (origin : Cursor)
    (selected : RootResetEdgeFragment.select rows origin.focus = none) :
    ∃ member : ProbeCompiler.Control.answer false ∈ (whole rows).nodes,
      run (machine rows) (RootResetEdgeFragment.ticks rows origin.focus) (initial rows origin) =
        ⟨some ⟨.answer false, member⟩, origin⟩ := by
  obtain ⟨member, execution⟩ := RootResetEdgeFragment.missed_runs rows origin selected
  refine ⟨member, (run_eq_before_true rows _ _ ?_).trans execution⟩
  rw [execution]
  intro equal
  cases Option.some.inj equal

def coefficient : Nat := RootResetEdgeFragment.bound rows + 1

inductive Walks : Cursor → Cursor → Prop where
  | done (origin : Cursor) (missed : RootResetEdgeFragment.select rows origin.focus = none) :
      Walks origin origin
  | next (origin after : Cursor) (row : EdgeRow)
      (selected : RootResetEdgeFragment.select rows origin.focus = some row)
      (followed : RootResetEdgeFragment.follow row.address origin = some after)
      {endpoint : Cursor} (rest : Walks after endpoint) : Walks origin endpoint

def Within (origin : Cursor) : Prop :=
  ∃ ticks endpoint noMember,
    ticks ≤ coefficient rows * origin.focus.size ∧
    run (machine rows) ticks (initial rows origin) =
      ⟨some ⟨ProbeCompiler.Control.answer false, noMember⟩, endpoint⟩ ∧
    Walks rows origin endpoint

theorem prefix_bound (source : Term) :
    RootResetEdgeFragment.ticks rows source + 1 ≤ coefficient rows :=
  Nat.add_le_add_right (RootResetEdgeFragment.ticks_bound rows source) 1

theorem missed_bound (source : Term) :
    RootResetEdgeFragment.ticks rows source ≤ coefficient rows * source.size := by
  apply Nat.le_trans (RootResetEdgeFragment.ticks_bound rows source)
  apply Nat.le_trans (Nat.le_add_right _ 1)
  simpa only [Nat.mul_one] using! Nat.mul_le_mul_left (coefficient rows) (Term.size_pos source)

theorem combine_bound (source target : Term) (before after : Nat)
    (beforeBound : before ≤ coefficient rows)
    (afterBound : after ≤ coefficient rows * target.size)
    (smaller : target.size < source.size) : before + after ≤ coefficient rows * source.size := by
  calc
    before + after ≤ coefficient rows + coefficient rows * target.size := Nat.add_le_add beforeBound afterBound
    _ = coefficient rows * (target.size + 1) := by rw [Nat.mul_add, Nat.mul_one, Nat.add_comm]
    _ ≤ coefficient rows * source.size := Nat.mul_le_mul_left _ smaller

theorem scan_within (valid : RootResetEdgeFragment.Valid rows) (origin : Cursor) : Within rows origin := by
  have auxiliary : ∀ size, ∀ origin : Cursor, origin.focus.size = size → Within rows origin := by
    intro size
    induction size using Nat.strongRecOn with
    | ind size ih =>
      intro origin sizeEq
      cases selected : RootResetEdgeFragment.select rows origin.focus with
      | none =>
          obtain ⟨member, execution⟩ := missed_runs rows origin selected
          exact ⟨_, _, member, missed_bound rows origin.focus, execution, .done origin selected⟩
      | some row =>
          obtain ⟨member, matched⟩ := RootResetEdgeFragment.select_sound rows origin.focus row selected
          obtain ⟨proper, subtermExists⟩ := valid row member
          obtain ⟨target, subterm⟩ := subtermExists origin.focus matched
          obtain ⟨after, followed, focusEq⟩ :=
            RootResetEdgeFragment.follow_exists row.address origin.focus target subterm origin.parents
          have smaller := RootResetEdgeFragment.follow_size_lt row.address origin after proper followed
          have smallerIndex : after.focus.size < size := by rw [← sizeEq]; exact smaller
          obtain ⟨afterTicks, endpoint, noMember, afterBound, afterRun, afterWalks⟩ := ih _ smallerIndex after rfl
          have beforeRun := selected_runs rows origin after row selected proper followed
          refine ⟨_ + afterTicks, endpoint, noMember,
            combine_bound rows origin.focus after.focus _ _ (prefix_bound rows origin.focus) afterBound smaller,
            ?_, .next origin after row selected followed afterWalks⟩
          rw [run_add, beforeRun]
          exact afterRun
  exact auxiliary origin.focus.size origin rfl

theorem mutationCount_eq (configuration : Configuration (Control rows)) :
    mutationCount (machine rows) configuration = mutationCount (base rows) configuration := by
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

theorem mutationCount_zero (configuration : Configuration (Control rows)) :
    mutationCount (machine rows) configuration = 0 := by
  rw [mutationCount_eq]
  exact RootResetPatternFragment.mutationCount_zero _ (RootResetEdgeFragment.family_readOnly rows) configuration

theorem runMutationCount_zero (ticks : Nat) (configuration : Configuration (Control rows)) :
    runMutationCount (machine rows) ticks configuration = 0 := by
  induction ticks generalizing configuration with
  | zero => rfl
  | succ ticks ih => rw [runMutationCount, mutationCount_zero, ih, Nat.zero_add]

theorem erase_run (ticks : Nat) (configuration : Configuration (Control rows)) :
    (run (machine rows) ticks configuration).cursor.erase = configuration.cursor.erase := by
  have projection := run_projects_stepsN (machine rows) ticks configuration
  rw [runMutationCount_zero] at projection
  exact (StepsN.eq_of_zero projection).symm

theorem false_absorbs (ticks : Nat) (member : ProbeCompiler.Control.answer false ∈ (whole rows).nodes)
    (cursor : Cursor) :
    run (machine rows) ticks ⟨some ⟨.answer false, member⟩, cursor⟩ =
      ⟨some ⟨.answer false, member⟩, cursor⟩ := by
  induction ticks with
  | zero => rfl
  | succ ticks ih => exact ih

theorem Walks.endpoint_misses {origin endpoint : Cursor} (walk : Walks rows origin endpoint) :
    RootResetEdgeFragment.select rows endpoint.focus = none := by
  induction walk with
  | done origin missed => exact missed
  | next origin after row selected followed rest ih => exact ih

theorem Walks.erase {origin endpoint : Cursor} (walk : Walks rows origin endpoint) :
    endpoint.erase = origin.erase := by
  induction walk with
  | done origin missed => rfl
  | next origin after row selected followed rest ih =>
      exact ih.trans (RootResetEdgeFragment.follow_erase row.address origin after followed)

theorem states_length : (machine rows).states.length = (whole rows).size :=
  RootResetPatternFragment.states_length _

theorem atRoot_within (valid : RootResetEdgeFragment.Valid rows) (source : Term) :
    ∃ ticks endpoint noMember,
      ticks ≤ coefficient rows * source.size ∧
      run (machine rows) ticks (initial rows (Cursor.atRoot source)) =
        ⟨some ⟨ProbeCompiler.Control.answer false, noMember⟩, endpoint⟩ ∧
      Walks rows (Cursor.atRoot source) endpoint ∧ endpoint.erase = source ∧
      RootResetEdgeFragment.select rows endpoint.focus = none := by
  obtain ⟨ticks, endpoint, member, bound, execution, walk⟩ := scan_within rows valid (Cursor.atRoot source)
  exact ⟨ticks, endpoint, member, bound, execution, walk, Walks.erase rows walk, Walks.endpoint_misses rows walk⟩

end PureSFormal.Research.RootResetEdgeSpine


