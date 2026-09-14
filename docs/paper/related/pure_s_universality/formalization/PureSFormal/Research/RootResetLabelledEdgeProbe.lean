import PureSFormal.Research.RootResetLabelledPatternFragment

/-!
# Finite labelled reading between designated descent and inverse return

Only the fixed row families are machine parameters. The classifier's finite
control position retains its answer during inverse traversal. The all-input
theorem accounts for every executed phase and preserves the represented term.
Exact origin return is obtained by instantiating the displayed inverse-edge
law and stopping boundary; no runtime origin register is introduced.
-/
namespace PureSFormal.Research.RootResetLabelledEdgeProbe
open PureSFormal.PureS
open FiniteController
open RootResetCarrierEdgePatterns
open RootResetCarrierNonemptyProbe

inductive Control {Label : Type} (edges : List EdgeRow) (labels : List (Label × Pattern)) where
  | descending (pc : RootResetEdgeSpine.Control edges)
  | reading (pc : RootResetLabelledPatternFragment.Control labels)
  | ascending (answer : RootResetLabelledPatternFragment.Control labels)
      (pc : RootResetInverseEdgeSpine.Control edges)
  | done (answer : RootResetLabelledPatternFragment.Control labels)

def pairs {α β γ : Type} (join : α → β → γ) (left : List α) (right : List β) : List γ :=
  match left with
  | [] => []
  | head :: rest => right.map (join head) ++ pairs join rest right

theorem pairs_member {α β γ : Type} (join : α → β → γ) (left : List α) (right : List β)
    (a : α) (b : β) (ha : a ∈ left) (hb : b ∈ right) : join a b ∈ pairs join left right := by
  induction ha with
  | head => exact List.mem_append.mpr (Or.inl (RootResetCompletedLocalPatterns.map_member _ hb))
  | tail head ha ih => exact List.mem_append.mpr (Or.inr ih)

def cover {Label : Type} (edges : List EdgeRow) (labels : List (Label × Pattern)) :
    List (Control edges labels) :=
  (RootResetEdgeSpine.machine edges).states.map Control.descending ++
  (RootResetLabelledPatternFragment.machine labels).states.map Control.reading ++
  pairs Control.ascending (RootResetLabelledPatternFragment.machine labels).states
    (RootResetInverseEdgeSpine.machine edges).states ++
  (RootResetLabelledPatternFragment.machine labels).states.map Control.done

theorem covers {Label : Type} (edges : List EdgeRow) (labels : List (Label × Pattern))
    (state : Control edges labels) : state ∈ cover edges labels := by
  simp only [cover, List.mem_append]
  cases state with
  | descending pc => exact Or.inl (Or.inl (Or.inl (RootResetCompletedLocalPatterns.map_member _
      ((RootResetEdgeSpine.machine edges).covers pc))))
  | reading pc => exact Or.inl (Or.inl (Or.inr (RootResetCompletedLocalPatterns.map_member _
      ((RootResetLabelledPatternFragment.machine labels).covers pc))))
  | ascending answer pc => exact Or.inl (Or.inr (pairs_member _ _ _ answer pc
      ((RootResetLabelledPatternFragment.machine labels).covers answer)
      ((RootResetInverseEdgeSpine.machine edges).covers pc)))
  | done answer => exact Or.inr (RootResetCompletedLocalPatterns.map_member _
      ((RootResetLabelledPatternFragment.machine labels).covers answer))

def transition {Label : Type} (edges : List EdgeRow) (labels : List (Label × Pattern))
    (state : Control edges labels) (node : Probe.NodeKind) (incoming : Probe.Incoming) :
    Command (Control edges labels) :=
  match state with
  | .descending pc => match pc.val with
    | .answer false => .stay (.reading (RootResetLabelledPatternFragment.first labels))
    | _ => mapCommand Control.descending ((RootResetEdgeSpine.machine edges).transition pc node incoming)
  | .reading pc =>
      if (RootResetLabelledPatternFragment.answer? pc).isSome then
        .stay (.ascending pc ⟨RootResetInverseEdgeSpine.whole edges, ProbeCompiler.Control.self_mem_nodes _⟩)
      else mapCommand Control.reading ((RootResetLabelledPatternFragment.machine labels).transition pc node incoming)
  | .ascending answer pc => match pc.val with
    | .answer false => .stay (.done answer)
    | _ => mapCommand (Control.ascending answer) ((RootResetInverseEdgeSpine.machine edges).transition pc node incoming)
  | .done answer => .stay (.done answer)

def machine {Label : Type} (edges : List EdgeRow) (labels : List (Label × Pattern)) :
    Machine (Control edges labels) := ⟨fun _ => cover edges labels, covers edges labels, transition edges labels⟩

def initial {Label : Type} (edges : List EdgeRow) (labels : List (Label × Pattern)) (origin : Cursor) :
    Configuration (Control edges labels) := liftConfiguration Control.descending (RootResetEdgeSpine.initial edges origin)

theorem descending_step {Label : Type} (edges : List EdgeRow) (labels : List (Label × Pattern))
    (configuration : Configuration (RootResetEdgeSpine.Control edges)) (running : falseAnswer? configuration = false) :
    step (machine edges labels) (liftConfiguration Control.descending configuration) =
      liftConfiguration Control.descending (step (RootResetEdgeSpine.machine edges) configuration) := by
  apply step_lift
  intro state current
  rcases configuration with ⟨runtime, cursor⟩
  have equal : runtime = some state := current
  subst runtime
  rcases state with ⟨pc, member⟩
  cases pc with
  | answer bit => cases bit with
    | false => cases running
    | true => rfl
  | observeNode onS onApp => rfl
  | observeIncoming onRoot onLeft onRight => rfl
  | move operation next => rfl

theorem reading_step {Label : Type} (edges : List EdgeRow) (labels : List (Label × Pattern))
    (configuration : Configuration (RootResetLabelledPatternFragment.Control labels))
    (running : RootResetLabelledPatternFragment.ended? configuration = false) :
    step (machine edges labels) (liftConfiguration Control.reading configuration) =
      liftConfiguration Control.reading (step (RootResetLabelledPatternFragment.machine labels) configuration) := by
  apply step_lift
  intro state current
  rcases configuration with ⟨runtime, cursor⟩
  have equal : runtime = some state := current
  subst runtime
  change (RootResetLabelledPatternFragment.answer? state).isSome = false at running
  simp only [machine, transition, running, Bool.false_eq_true, ↓reduceIte]

theorem ascending_step {Label : Type} (edges : List EdgeRow) (labels : List (Label × Pattern))
    (answer : RootResetLabelledPatternFragment.Control labels)
    (configuration : Configuration (RootResetInverseEdgeSpine.Control edges)) (running : falseAnswer? configuration = false) :
    step (machine edges labels) (liftConfiguration (Control.ascending answer) configuration) =
      liftConfiguration (Control.ascending answer) (step (RootResetInverseEdgeSpine.machine edges) configuration) := by
  apply step_lift
  intro state current
  rcases configuration with ⟨runtime, cursor⟩
  have equal : runtime = some state := current
  subst runtime
  rcases state with ⟨pc, member⟩
  cases pc with
  | answer bit => cases bit with
    | false => cases running
    | true => rfl
  | observeNode onS onApp => rfl
  | observeIncoming onRoot onLeft onRight => rfl
  | move operation next => rfl

theorem descending_runs {Label : Type} (edges : List EdgeRow) (labels : List (Label × Pattern))
    (origin endpoint : Cursor) (ticks : Nat)
    (member : ProbeCompiler.Control.answer false ∈ (RootResetEdgeSpine.whole edges).nodes)
    (execution : run (RootResetEdgeSpine.machine edges) ticks (RootResetEdgeSpine.initial edges origin) =
      ⟨some ⟨.answer false, member⟩, endpoint⟩) :
    ∃ used, used ≤ ticks ∧ run (machine edges labels) (used + 1) (initial edges labels origin) =
      liftConfiguration Control.reading (RootResetLabelledPatternFragment.initial labels endpoint) := by
  obtain ⟨used, bounded, actual⟩ := run_to_boundary (RootResetEdgeSpine.machine edges)
    (machine edges labels) Control.descending falseAnswer?
    (false_terminal_absorbs _ _ (fun member cursor ticks => RootResetEdgeSpine.false_absorbs _ ticks member cursor))
    (descending_step edges labels) ticks (RootResetEdgeSpine.initial edges origin) (by rw [execution]; rfl)
  rw [execution] at actual
  refine ⟨used, bounded, ?_⟩
  change run (machine edges labels) (used + 1)
    (liftConfiguration Control.descending (RootResetEdgeSpine.initial edges origin)) = _
  rw [run_add, actual]
  rfl

theorem reading_runs {Label : Type} (edges : List EdgeRow) (labels : List (Label × Pattern)) (origin : Cursor) :
    ∃ used, used ≤ RootResetLabelledPatternFragment.bound labels ∧
      run (machine edges labels) (used + 1)
        (liftConfiguration Control.reading (RootResetLabelledPatternFragment.initial labels origin)) =
        liftConfiguration (Control.ascending (RootResetLabelledPatternFragment.finished labels origin.focus))
          (RootResetInverseEdgeSpine.initial edges origin) := by
  obtain ⟨ticks, bounded, execution⟩ := RootResetLabelledPatternFragment.all_input labels origin
  obtain ⟨used, usedBound, actual⟩ := run_to_boundary (RootResetLabelledPatternFragment.machine labels)
    (machine edges labels) Control.reading RootResetLabelledPatternFragment.ended?
    (RootResetLabelledPatternFragment.terminal_absorbs labels) (reading_step edges labels)
    ticks (RootResetLabelledPatternFragment.initial labels origin)
    (by rw [execution]; exact RootResetLabelledPatternFragment.finished_ended labels origin.focus)
  rw [execution] at actual
  refine ⟨used, Nat.le_trans usedBound bounded, ?_⟩
  rw [run_add, actual]
  change step (machine edges labels)
    ⟨some (.reading (RootResetLabelledPatternFragment.finished labels origin.focus)), origin⟩ = _
  simp only [step,
    machine, transition, RootResetLabelledPatternFragment.finished_ended, ↓reduceIte]
  rfl

theorem ascending_runs {Label : Type} (edges : List EdgeRow) (labels : List (Label × Pattern))
    (answer : RootResetLabelledPatternFragment.Control labels) (origin endpoint : Cursor) (ticks : Nat)
    (member : ProbeCompiler.Control.answer false ∈ (RootResetInverseEdgeSpine.whole edges).nodes)
    (execution : run (RootResetInverseEdgeSpine.machine edges) ticks (RootResetInverseEdgeSpine.initial edges origin) =
      ⟨some ⟨.answer false, member⟩, endpoint⟩) :
    ∃ used, used ≤ ticks ∧ run (machine edges labels) (used + 1)
      (liftConfiguration (Control.ascending answer) (RootResetInverseEdgeSpine.initial edges origin)) =
        ⟨some (.done answer), endpoint⟩ := by
  obtain ⟨used, bounded, actual⟩ := run_to_boundary (RootResetInverseEdgeSpine.machine edges)
    (machine edges labels) (Control.ascending answer) falseAnswer?
    (false_terminal_absorbs _ _ (fun member cursor ticks => RootResetInverseEdgeSpine.false_absorbs _ ticks member cursor))
    (ascending_step edges labels answer) ticks (RootResetInverseEdgeSpine.initial edges origin) (by rw [execution]; rfl)
  rw [execution] at actual
  refine ⟨used, bounded, ?_⟩
  rw [run_add, actual]
  rfl

def budget {Label : Type} (edges : List EdgeRow) (labels : List (Label × Pattern)) (origin : Cursor) : Nat :=
  RootResetEdgeSpine.coefficient edges * origin.focus.size + RootResetLabelledPatternFragment.bound labels +
    RootResetInverseEdgeSpine.coefficient edges * origin.erase.size + 3

theorem combined_bound {Label : Type} (edges : List EdgeRow) (labels : List (Label × Pattern))
    (origin descended : Cursor) (down read up : Nat)
    (downBound : down ≤ RootResetEdgeSpine.coefficient edges * origin.focus.size)
    (readBound : read ≤ RootResetLabelledPatternFragment.bound labels)
    (upBound : up ≤ RootResetInverseEdgeSpine.coefficient edges * (descended.parents.length + 1))
    (erase : descended.erase = origin.erase) :
    down + 1 + (read + 1) + (up + 1) ≤ budget edges labels origin := by
  have toWhole : descended.parents.length + 1 ≤ origin.erase.size := by
    simpa only [erase] using RootResetProgressTotality.depth_succ_le_erase_size descended.focus descended.parents
  have finalUp := Nat.le_trans upBound (Nat.mul_le_mul_left _ toWhole)
  have combined := Nat.add_le_add_right (Nat.add_le_add (Nat.add_le_add downBound readBound) finalUp) 3
  simpa only [budget, show 3 = 1 + 1 + 1 by rfl, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using combined

theorem all_input {Label : Type} (edges : List EdgeRow) (labels : List (Label × Pattern))
    (valid : RootResetEdgeFragment.Valid edges) (origin : Cursor) :
    ∃ ticks descended returned, ticks ≤ budget edges labels origin ∧
      run (machine edges labels) ticks (initial edges labels origin) =
        ⟨some (.done (RootResetLabelledPatternFragment.finished labels descended.focus)), returned⟩ ∧
      RootResetEdgeSpine.Walks edges origin descended ∧
      RootResetInverseEdgeSpine.Walks edges descended returned ∧ returned.erase = origin.erase := by
  obtain ⟨downTicks, descended, downMember, downBound, downRun, downWalk⟩ :=
    RootResetEdgeSpine.scan_within edges valid origin
  obtain ⟨down, downUsed, actualDown⟩ := descending_runs edges labels origin descended downTicks downMember downRun
  obtain ⟨read, readBound, actualRead⟩ := reading_runs edges labels descended
  obtain ⟨upTicks, returned, upMember, upBound, upRun, upWalk⟩ :=
    RootResetInverseEdgeSpine.scan_within edges (fun row member => (valid row member).1) descended
  obtain ⟨up, upUsed, actualUp⟩ := ascending_runs edges labels
    (RootResetLabelledPatternFragment.finished labels descended.focus) descended returned upTicks upMember upRun
  have downErase := RootResetEdgeSpine.Walks.erase edges downWalk
  refine ⟨_, descended, returned, combined_bound edges labels origin descended down read up
    (Nat.le_trans downUsed downBound) readBound (Nat.le_trans upUsed upBound) downErase,
    ?_, downWalk, upWalk, (RootResetInverseEdgeSpine.Walks.erase edges upWalk).trans downErase⟩
  have firstTwo : run (machine edges labels) (down + 1 + (read + 1)) (initial edges labels origin) =
      liftConfiguration (Control.ascending (RootResetLabelledPatternFragment.finished labels descended.focus))
        (RootResetInverseEdgeSpine.initial edges descended) := by
    rw [run_add, actualDown]
    exact actualRead
  rw [run_add, firstTwo]
  exact actualUp

def Inverts (edges : List EdgeRow) : Prop :=
  ∀ row ∈ edges, ∀ origin endpoint, row.pattern.matchesBool origin.focus = true →
    RootResetEdgeFragment.follow row.address origin = some endpoint →
    RootResetInverseEdgeSpine.familyResult edges endpoint = some origin

theorem walks_backs (edges : List EdgeRow) (inverts : Inverts edges) {origin endpoint : Cursor}
    (walk : RootResetEdgeSpine.Walks edges origin endpoint) :
    RootResetCarrierInverseUnique.Backs edges endpoint origin := by
  induction walk with
  | done origin missed => exact .refl origin
  | next origin after row selected followed rest ih =>
      obtain ⟨member, matched⟩ := RootResetEdgeFragment.select_sound _ origin.focus row selected
      exact ih.trans (.next after origin (inverts row member origin after matched followed) (.refl origin))

theorem all_input_restores {Label : Type} (edges : List EdgeRow) (labels : List (Label × Pattern))
    (valid : RootResetEdgeFragment.Valid edges) (inverts : Inverts edges) (origin : Cursor)
    (boundary : RootResetInverseEdgeSpine.familyResult edges origin = none) :
    ∃ ticks descended, ticks ≤ budget edges labels origin ∧
      run (machine edges labels) ticks (initial edges labels origin) =
        ⟨some (.done (RootResetLabelledPatternFragment.finished labels descended.focus)), origin⟩ ∧
      RootResetEdgeSpine.Walks edges origin descended := by
  obtain ⟨ticks, descended, returned, bounded, execution, down, up, erased⟩ := all_input edges labels valid origin
  have equal := (walks_backs edges inverts down).stops_at boundary up
  subst returned
  exact ⟨ticks, descended, bounded, execution, down⟩

theorem mutationCount_zero {Label : Type} (edges : List EdgeRow) (labels : List (Label × Pattern))
    (configuration : Configuration (Control edges labels)) : mutationCount (machine edges labels) configuration = 0 := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => rfl
  | some state =>
      rw [← commandCount_eq_mutationCount]
      cases state with
      | done answer => rfl
      | reading pc =>
          cases ended : (RootResetLabelledPatternFragment.answer? pc).isSome <;>
            simp only [machine, transition, ended, Bool.false_eq_true, ↓reduceIte, commandCount_map]
          · rw [commandCount_eq_mutationCount]
            exact RootResetLabelledPatternFragment.mutationCount_zero labels ⟨some pc, cursor⟩
          · rfl
      | descending pc =>
          rcases pc with ⟨pc, member⟩
          have zero := RootResetEdgeSpine.mutationCount_zero edges ⟨some ⟨pc, member⟩, cursor⟩
          cases pc <;> try { rename_i result; cases result <;> rfl }
          all_goals
            simp only [machine, transition, commandCount_map]
            rw [commandCount_eq_mutationCount]
            exact zero
      | ascending answer pc =>
          rcases pc with ⟨pc, member⟩
          have zero := RootResetInverseEdgeSpine.mutationCount_zero edges ⟨some ⟨pc, member⟩, cursor⟩
          cases pc <;> try { rename_i result; cases result <;> rfl }
          all_goals
            simp only [machine, transition, commandCount_map]
            rw [commandCount_eq_mutationCount]
            exact zero

theorem runMutationCount_zero {Label : Type} (edges : List EdgeRow) (labels : List (Label × Pattern))
    (ticks : Nat) (configuration : Configuration (Control edges labels)) :
    runMutationCount (machine edges labels) ticks configuration = 0 := by
  induction ticks generalizing configuration with
  | zero => rfl
  | succ ticks ih => rw [runMutationCount, mutationCount_zero, ih, Nat.zero_add]

def done? {Label : Type} {edges : List EdgeRow} {labels : List (Label × Pattern)}
    (configuration : Configuration (Control edges labels)) : Bool :=
  match configuration.control with
  | some (.done _) => true
  | _ => false

theorem done_absorbs {Label : Type} (edges : List EdgeRow) (labels : List (Label × Pattern))
    (answer : RootResetLabelledPatternFragment.Control labels) (origin : Cursor) (ticks : Nat) :
    run (machine edges labels) ticks ⟨some (.done answer), origin⟩ = ⟨some (.done answer), origin⟩ := by
  induction ticks with
  | zero => rfl
  | succ ticks ih => exact ih

theorem terminal_absorbs {Label : Type} (edges : List EdgeRow) (labels : List (Label × Pattern))
    (configuration : Configuration (Control edges labels)) (ended : done? configuration = true) (ticks : Nat) :
    run (machine edges labels) ticks configuration = configuration := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => cases ended
  | some state =>
      cases state with
      | done answer => exact done_absorbs edges labels answer cursor ticks
      | descending pc => cases ended
      | reading pc => cases ended
      | ascending answer pc => cases ended

def coefficient {Label : Type} (edges : List EdgeRow) (labels : List (Label × Pattern)) : Nat :=
  RootResetEdgeSpine.coefficient edges + RootResetLabelledPatternFragment.bound labels +
    RootResetInverseEdgeSpine.coefficient edges + 3

theorem budget_erase {Label : Type} (edges : List EdgeRow) (labels : List (Label × Pattern)) (origin : Cursor) :
    budget edges labels origin ≤ coefficient edges labels * origin.erase.size := by
  have focusBound : origin.focus.size ≤ origin.erase.size :=
    Nat.le_trans (Nat.le_add_left _ _) (RootResetProgressTotality.depth_add_focus_size_le_erase_size origin.focus origin.parents)
  have first := Nat.mul_le_mul_left (RootResetEdgeSpine.coefficient edges) focusBound
  have second : RootResetLabelledPatternFragment.bound labels ≤
      RootResetLabelledPatternFragment.bound labels * origin.erase.size := by
    simpa only [Nat.mul_one] using Nat.mul_le_mul_left (RootResetLabelledPatternFragment.bound labels) (Term.size_pos origin.erase)
  have last : 3 ≤ 3 * origin.erase.size := by
    simpa only [Nat.mul_one] using Nat.mul_le_mul_left 3 (Term.size_pos origin.erase)
  have combined := Nat.add_le_add
    (Nat.add_le_add_right (Nat.add_le_add first second) (RootResetInverseEdgeSpine.coefficient edges * origin.erase.size)) last
  simpa only [budget, coefficient, Nat.add_mul] using combined

end PureSFormal.Research.RootResetLabelledEdgeProbe
