import PureSFormal.Research.RootResetInverseEdgeFragment

/-!
# Finite inverse-edge family traversal

A fixed family of inverse-edge fragments tests candidate ancestor paths in
order. Failed candidates restore the exact origin; a matching ancestor
restarts the same finite family. Proper paths decrease cursor depth, so
every input terminates within a fixed coefficient times (depth + 1).
The controller preserves the bare term and stores no path or counter.
-/

namespace PureSFormal.Research.RootResetInverseEdgeSpine
open PureSFormal.PureS
open FiniteController
open RootResetPatternFragment
open RootResetCarrierEdgePatterns

def marker : Code := .observeNode (.answer true) (.answer true)

def familyCode : List EdgeRow → Code
  | [] => .answer false
  | row :: rows => RootResetInverseEdgeFragment.backCode row.address.reverse row.pattern marker (familyCode rows)

def familyResult : List EdgeRow → Cursor → Option Cursor
  | [], _ => none
  | row :: rows, origin =>
      match RootResetInverseEdgeFragment.backResult row.address.reverse row.pattern origin with
      | some ancestor => some ancestor
      | none => familyResult rows origin

def familyTicks : List EdgeRow → Cursor → Nat
  | [], _ => 0
  | row :: rows, origin =>
      RootResetInverseEdgeFragment.backTicks row.address.reverse row.pattern origin +
        if (RootResetInverseEdgeFragment.backResult row.address.reverse row.pattern origin).isSome
        then 0 else familyTicks rows origin

def familyBound : List EdgeRow → Nat
  | [] => 0
  | row :: rows => RootResetInverseEdgeFragment.bound row.address.reverse row.pattern + familyBound rows

def selected (result : Option Cursor) : Code := if result.isSome then marker else .answer false

theorem family_runs (rows : List EdgeRow) (whole : Code) (origin : Cursor)
    (included : ∀ pc, pc ∈ (familyCode rows).nodes → pc ∈ whole.nodes) :
    ∃ member : selected (familyResult rows origin) ∈ whole.nodes,
      run (RootResetPatternFragment.machine whole) (familyTicks rows origin)
        ⟨some ⟨familyCode rows, included _ (ProbeCompiler.Control.self_mem_nodes _)⟩, origin⟩ =
        ⟨some ⟨selected (familyResult rows origin), member⟩, (familyResult rows origin).getD origin⟩ := by
  induction rows with
  | nil => exact ⟨included _ (ProbeCompiler.Control.self_mem_nodes _), rfl⟩
  | cons row rows ih =>
      obtain ⟨firstMember, firstRun⟩ := RootResetInverseEdgeFragment.back_runs row.address.reverse
        row.pattern marker (familyCode rows) whole origin included
      cases firstResult : RootResetInverseEdgeFragment.backResult row.address.reverse row.pattern origin with
      | some ancestor =>
          simp only [RootResetInverseEdgeFragment.selected, firstResult, Option.isSome_some, ↓reduceIte,
            Option.getD_some] at firstMember firstRun
          simp only [familyResult, familyTicks, firstResult, Option.isSome_some, ↓reduceIte,
            Option.getD_some, selected, Nat.add_zero]
          exact ⟨firstMember, firstRun⟩
      | none =>
          simp only [RootResetInverseEdgeFragment.selected, firstResult, Option.isSome_none,
            Bool.false_eq_true, ↓reduceIte, Option.getD_none] at firstMember firstRun
          obtain ⟨lastMember, lastRun⟩ := ih (fun pc member => nodes_trans firstMember member)
          simp only [familyResult, familyTicks, firstResult, Option.isSome_none,
            Bool.false_eq_true, ↓reduceIte]
          refine ⟨lastMember, ?_⟩
          simp only [familyCode]
          rw [run_add, firstRun]
          exact lastRun

theorem familyTicks_bound (rows : List EdgeRow) (origin : Cursor) : familyTicks rows origin ≤ familyBound rows := by
  induction rows with
  | nil => exact Nat.le_refl _
  | cons row rows ih =>
      have first := RootResetInverseEdgeFragment.backTicks_bound row.address.reverse row.pattern origin
      cases firstResult : RootResetInverseEdgeFragment.backResult row.address.reverse row.pattern origin with
      | some ancestor =>
          simpa only [familyTicks, firstResult, Option.isSome_some, ↓reduceIte, Nat.add_zero, familyBound] using
            Nat.le_trans first (Nat.le_add_right _ _)
      | none =>
          simpa only [familyTicks, firstResult, Option.isSome_none, Bool.false_eq_true, ↓reduceIte, familyBound] using
            Nat.add_le_add first ih

theorem familyResult_sound (rows : List EdgeRow) (origin ancestor : Cursor)
    (found : familyResult rows origin = some ancestor) :
    ∃ row ∈ rows, RootResetInverseEdgeFragment.backResult row.address.reverse row.pattern origin = some ancestor := by
  induction rows with
  | nil => cases found
  | cons row rows ih =>
      cases firstResult : RootResetInverseEdgeFragment.backResult row.address.reverse row.pattern origin with
      | some firstAncestor =>
          have equal : firstAncestor = ancestor := Option.some.inj (by simpa only [familyResult, firstResult] using found)
          subst firstAncestor
          exact ⟨row, List.Mem.head _, firstResult⟩
      | none =>
          have later : familyResult rows origin = some ancestor := by simpa only [familyResult, firstResult] using found
          obtain ⟨row, member, selected⟩ := ih later
          exact ⟨row, List.Mem.tail _ member, selected⟩

theorem family_readOnly (rows : List EdgeRow) : (familyCode rows).NoRdx := by
  induction rows with
  | nil => trivial
  | cons row rows ih => exact RootResetInverseEdgeFragment.back_readOnly _ _ _ _ ⟨True.intro, True.intro⟩ ih

variable (rows : List EdgeRow)

abbrev Control := PC (familyCode rows)
abbrev base := RootResetPatternFragment.machine (familyCode rows)
abbrev initial := RootResetPatternFragment.initial (familyCode rows)
abbrev whole := familyCode rows

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
  exact RootResetPatternFragment.mutationCount_zero _ (family_readOnly rows) configuration

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

theorem marker_restart (member : marker ∈ (whole rows).nodes) (origin : Cursor) :
    run (machine rows) 2 ⟨some ⟨marker, member⟩, origin⟩ = initial rows origin := by
  rcases origin with ⟨focus, parents⟩
  cases focus <;> rfl

theorem selected_runs (origin ancestor : Cursor)
    (found : familyResult rows origin = some ancestor) :
    run (machine rows) (familyTicks rows origin + 2) (initial rows origin) = initial rows ancestor := by
  obtain ⟨member, execution⟩ := family_runs rows (whole rows) origin (fun _ h => h)
  simp only [selected, found, Option.isSome_some, ↓reduceIte, Option.getD_some] at member execution
  have baseRun : run (base rows) (familyTicks rows origin) (initial rows origin) =
      ⟨some ⟨marker, member⟩, ancestor⟩ := execution
  have notTrue : code? rows (run (base rows) (familyTicks rows origin) (initial rows origin)) ≠ some (.answer true) := by
    rw [baseRun]
    intro equal
    cases Option.some.inj equal
  rw [run_add, run_eq_before_true rows _ _ notTrue, baseRun]
  exact marker_restart rows member ancestor

theorem missed_runs (origin : Cursor) (found : familyResult rows origin = none) :
    ∃ member : ProbeCompiler.Control.answer false ∈ (whole rows).nodes,
      run (machine rows) (familyTicks rows origin) (initial rows origin) =
        ⟨some ⟨.answer false, member⟩, origin⟩ := by
  obtain ⟨member, execution⟩ := family_runs rows (whole rows) origin (fun _ h => h)
  simp only [selected, found, Option.isSome_none, Bool.false_eq_true, ↓reduceIte, Option.getD_none] at member execution
  have baseRun : run (base rows) (familyTicks rows origin) (initial rows origin) =
      ⟨some ⟨.answer false, member⟩, origin⟩ := execution
  refine ⟨member, (run_eq_before_true rows _ _ ?_).trans baseRun⟩
  rw [baseRun]
  intro equal
  cases Option.some.inj equal

def coefficient : Nat := familyBound rows + 2

def Proper : Prop := ∀ row ∈ rows, row.address ≠ []

inductive Walks : Cursor → Cursor → Prop where
  | done (origin : Cursor) (missed : familyResult rows origin = none) : Walks origin origin
  | next (origin ancestor : Cursor) (found : familyResult rows origin = some ancestor)
      {endpoint : Cursor} (rest : Walks ancestor endpoint) : Walks origin endpoint

def Within (origin : Cursor) : Prop :=
  ∃ ticks endpoint noMember,
    ticks ≤ coefficient rows * (origin.parents.length + 1) ∧
    run (machine rows) ticks (initial rows origin) =
      ⟨some ⟨ProbeCompiler.Control.answer false, noMember⟩, endpoint⟩ ∧
    Walks rows origin endpoint

theorem familyResult_depth_lt (proper : Proper rows) (origin ancestor : Cursor)
    (found : familyResult rows origin = some ancestor) : ancestor.parents.length < origin.parents.length := by
  obtain ⟨row, member, backFound⟩ := familyResult_sound rows origin ancestor found
  apply RootResetInverseEdgeFragment.backResult_depth_lt row.address.reverse row.pattern origin ancestor _ backFound
  intro empty
  have forwardEmpty := congrArg List.reverse empty
  simp only [List.reverse_reverse, List.reverse_nil] at forwardEmpty
  exact proper row member forwardEmpty

theorem missed_bound (origin : Cursor) : familyTicks rows origin ≤ coefficient rows * (origin.parents.length + 1) := by
  apply Nat.le_trans (familyTicks_bound rows origin)
  apply Nat.le_trans (Nat.le_add_right _ 2)
  simpa only [Nat.mul_one] using! Nat.mul_le_mul_left (coefficient rows) (Nat.succ_le_succ (Nat.zero_le _))

theorem combine_bound (origin ancestor : Cursor) (after : Nat)
    (smaller : ancestor.parents.length < origin.parents.length)
    (afterBound : after ≤ coefficient rows * (ancestor.parents.length + 1)) :
    familyTicks rows origin + 2 + after ≤ coefficient rows * (origin.parents.length + 1) := by
  calc
    familyTicks rows origin + 2 + after ≤ coefficient rows + coefficient rows * (ancestor.parents.length + 1) :=
      Nat.add_le_add (Nat.add_le_add_right (familyTicks_bound rows origin) 2) afterBound
    _ = coefficient rows * (ancestor.parents.length + 1 + 1) := by
      simp only [Nat.mul_add, Nat.mul_one, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
    _ ≤ coefficient rows * (origin.parents.length + 1) := Nat.mul_le_mul_left _ (Nat.add_le_add_right smaller 1)

theorem scan_within (proper : Proper rows) (origin : Cursor) : Within rows origin := by
  have auxiliary : ∀ depth, ∀ origin : Cursor, origin.parents.length = depth → Within rows origin := by
    intro depth
    induction depth using Nat.strongRecOn with
    | ind depth ih =>
      intro origin depthEq
      cases found : familyResult rows origin with
      | none =>
          obtain ⟨member, execution⟩ := missed_runs rows origin found
          exact ⟨_, _, member, missed_bound rows origin, execution, .done origin found⟩
      | some ancestor =>
          have smaller := familyResult_depth_lt rows proper origin ancestor found
          have smallerIndex : ancestor.parents.length < depth := by rw [← depthEq]; exact smaller
          obtain ⟨afterTicks, endpoint, member, afterBound, afterRun, afterWalks⟩ := ih _ smallerIndex ancestor rfl
          refine ⟨_ + afterTicks, endpoint, member, combine_bound rows origin ancestor afterTicks smaller afterBound,
            ?_, .next origin ancestor found afterWalks⟩
          rw [run_add, selected_runs rows origin ancestor found]
          exact afterRun
  exact auxiliary origin.parents.length origin rfl

theorem Walks.endpoint_misses {origin endpoint : Cursor} (walk : Walks rows origin endpoint) :
    familyResult rows endpoint = none := by
  induction walk with
  | done origin missed => exact missed
  | next origin ancestor found rest ih => exact ih

theorem Walks.erase {origin endpoint : Cursor} (walk : Walks rows origin endpoint) : endpoint.erase = origin.erase := by
  induction walk with
  | done origin missed => rfl
  | next origin ancestor found rest ih =>
      obtain ⟨row, _, backFound⟩ := familyResult_sound rows origin ancestor found
      exact ih.trans (RootResetInverseEdgeFragment.backResult_erase _ _ _ _ backFound)

theorem states_length : (machine rows).states.length = (whole rows).size := RootResetPatternFragment.states_length _

end PureSFormal.Research.RootResetInverseEdgeSpine


