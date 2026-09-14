import PureSFormal.Research.RootResetMixedLocalFragment

/-!
# Fixed finite labelled pattern classification

The label of the first matching pattern is retained by a finite control
position. The runtime receives only the cursor. All labels and patterns
are fixed in the compiled row list; the label type itself need not be finite.
Every input returns to its exact initial cursor in a row-list constant bound.
-/
namespace PureSFormal.Research.RootResetLabelledPatternFragment
open PureSFormal.PureS
open FiniteController
open RootResetPatternFragment
open RootResetCarrierNonemptyProbe

abbrev code (pattern : Pattern) : Code :=
  ProbeCompiler.compile pattern (.answer true) (.answer false)

inductive Control {Label : Type} : List (Label × Pattern) → Type where
  | stop : Control []
  | probe {entry rest} (pc : PC (code entry.2)) : Control (entry :: rest)
  | tail {entry rest} (state : Control rest) : Control (entry :: rest)
  | yes {entry rest} : Control (entry :: rest)

def cover {Label : Type} : (rows : List (Label × Pattern)) → List (Control rows)
  | [] => [.stop]
  | entry :: rest => [.yes] ++
      (RootResetPatternFragment.machine (code entry.2)).states.map Control.probe ++
      (cover rest).map Control.tail

theorem covers {Label : Type} (rows : List (Label × Pattern)) (state : Control rows) :
    state ∈ cover rows := by
  induction rows with
  | nil => cases state; exact List.Mem.head _
  | cons entry rest ih =>
      simp only [cover, List.mem_append]
      cases state with
      | yes => exact Or.inl (Or.inl (List.Mem.head _))
      | probe pc => exact Or.inl (Or.inr (RootResetCompletedLocalPatterns.map_member _
          ((RootResetPatternFragment.machine (code entry.2)).covers pc)))
      | tail state => exact Or.inr (RootResetCompletedLocalPatterns.map_member _ (ih state))

def first {Label : Type} : (rows : List (Label × Pattern)) → Control rows
  | [] => .stop
  | entry :: _ => .probe ⟨code entry.2, ProbeCompiler.Control.self_mem_nodes _⟩

def transition {Label : Type} : (rows : List (Label × Pattern)) →
    Control rows → Probe.NodeKind → Probe.Incoming → Command (Control rows)
  | [], .stop, _, _ => .stay .stop
  | _ :: _, .yes, _, _ => .stay .yes
  | entry :: rest, .probe pc, node, incoming => match pc.val with
    | .answer true => .stay .yes
    | .answer false => .stay (.tail (first rest))
    | _ => mapCommand Control.probe
        ((RootResetPatternFragment.machine (code entry.2)).transition pc node incoming)
  | _ :: rest, .tail state, node, incoming =>
      mapCommand Control.tail (transition rest state node incoming)

def machine {Label : Type} (rows : List (Label × Pattern)) : Machine (Control rows) :=
  ⟨fun _ => cover rows, covers rows, transition rows⟩

def initial {Label : Type} (rows : List (Label × Pattern)) (origin : Cursor) :
    Configuration (Control rows) := ⟨some (first rows), origin⟩

def answer? {Label : Type} : {rows : List (Label × Pattern)} → Control rows → Option (Option Label)
  | [], .stop => some none
  | entry :: _, .yes => some (some entry.1)
  | _ :: _, .probe _ => none
  | _ :: _, .tail state => answer? state

def selected {Label : Type} : List (Label × Pattern) → Term → Option Label
  | [], _ => none
  | entry :: rest, source => if Pattern.matchesBool entry.2 source then some entry.1 else selected rest source

def finished {Label : Type} : (rows : List (Label × Pattern)) → Term → Control rows
  | [], _ => .stop
  | entry :: rest, source => if Pattern.matchesBool entry.2 source then .yes else .tail (finished rest source)

def bound {Label : Type} : List (Label × Pattern) → Nat
  | [] => 0
  | entry :: rest => ProbeCompiler.executionBound entry.2 + bound rest

theorem finished_answer {Label : Type} (rows : List (Label × Pattern)) (source : Term) :
    answer? (finished rows source) = some (selected rows source) := by
  induction rows with
  | nil => rfl
  | cons entry rest ih =>
      simp only [finished, selected]
      cases matched : Pattern.matchesBool entry.2 source <;>
        simp only [matched, Bool.false_eq_true, ↓reduceIte, answer?, ih]

theorem probe_step {Label : Type} (entry : Label × Pattern) (rest : List (Label × Pattern))
    (configuration : Configuration (PC (code entry.2))) (running : anyAnswer? configuration = false) :
    step (machine (entry :: rest)) (liftConfiguration Control.probe configuration) =
      liftConfiguration Control.probe (step (RootResetPatternFragment.machine (code entry.2)) configuration) := by
  apply step_lift
  intro state current
  rcases configuration with ⟨runtime, cursor⟩
  have equal : runtime = some state := current
  subst runtime
  rcases state with ⟨pc, member⟩
  cases pc with
  | answer result => cases running
  | observeNode onS onApp => rfl
  | observeIncoming onRoot onLeft onRight => rfl
  | move operation next => rfl

theorem tail_step {Label : Type} (entry : Label × Pattern) (rest : List (Label × Pattern))
    (configuration : Configuration (Control rest)) :
    step (machine (entry :: rest)) (liftConfiguration Control.tail configuration) =
      liftConfiguration Control.tail (step (machine rest) configuration) := by
  apply step_lift
  intro state current
  rfl

theorem tail_runs {Label : Type} (entry : Label × Pattern) (rest : List (Label × Pattern))
    (ticks : Nat) (configuration : Configuration (Control rest)) :
    run (machine (entry :: rest)) ticks (liftConfiguration Control.tail configuration) =
      liftConfiguration Control.tail (run (machine rest) ticks configuration) := by
  induction ticks generalizing configuration with
  | zero => rfl
  | succ ticks ih => rw [run_succ, tail_step, ih]; rfl

theorem first_runs {Label : Type} (entry : Label × Pattern) (rest : List (Label × Pattern))
    (origin : Cursor) :
    ∃ ticks, ticks ≤ ProbeCompiler.executionBound entry.2 ∧
      run (machine (entry :: rest)) ticks (initial (entry :: rest) origin) =
        if Pattern.matchesBool entry.2 origin.focus then ⟨some .yes, origin⟩
        else liftConfiguration Control.tail (initial rest origin) := by
  obtain ⟨member, execution⟩ := RootResetPatternFragment.compile_runs entry.2
    (.answer true) (.answer false) (code entry.2) origin (fun _ h => h)
  change run (RootResetPatternFragment.machine (code entry.2))
    (ProbeCompiler.probeCost entry.2 origin.focus)
    (RootResetPatternFragment.initial (code entry.2) origin) = _ at execution
  have ended : anyAnswer? (run (RootResetPatternFragment.machine (code entry.2))
      (ProbeCompiler.probeCost entry.2 origin.focus)
      (RootResetPatternFragment.initial (code entry.2) origin)) = true := by
    rw [execution]
    generalize matchedEq : Pattern.matchesBool entry.2 origin.focus = matched at *
    cases matched <;> rfl
  obtain ⟨used, bounded, lifted⟩ := run_to_boundary
    (RootResetPatternFragment.machine (code entry.2)) (machine (entry :: rest)) Control.probe
    anyAnswer? (RootResetMixedLocalFragment.classify_absorbs _) (probe_step entry rest)
    (ProbeCompiler.probeCost entry.2 origin.focus)
    (RootResetPatternFragment.initial (code entry.2) origin) ended
  rw [execution] at lifted
  refine ⟨used + 1, Nat.le_trans (Nat.succ_le_succ bounded)
    (ProbeCompiler.probeCost_lt_executionBound entry.2 origin.focus), ?_⟩
  change run (machine (entry :: rest)) (used + 1)
    (liftConfiguration Control.probe (RootResetPatternFragment.initial (code entry.2) origin)) = _
  rw [run_add, lifted]
  generalize matchedEq : Pattern.matchesBool entry.2 origin.focus = matched at *
  cases matched <;> rfl

theorem all_input {Label : Type} (rows : List (Label × Pattern)) (origin : Cursor) :
    ∃ ticks, ticks ≤ bound rows ∧
      run (machine rows) ticks (initial rows origin) = ⟨some (finished rows origin.focus), origin⟩ := by
  induction rows with
  | nil => exact ⟨0, Nat.le_refl _, rfl⟩
  | cons entry rest ih =>
      obtain ⟨used, bounded, execution⟩ := first_runs entry rest origin
      cases matched : Pattern.matchesBool entry.2 origin.focus with
      | true =>
          refine ⟨used, Nat.le_trans bounded (Nat.le_add_right _ _), ?_⟩
          simpa only [matched, ↓reduceIte, finished] using execution
      | false =>
          obtain ⟨more, moreBound, moreRun⟩ := ih
          refine ⟨used + more, Nat.add_le_add bounded moreBound, ?_⟩
          simp only [matched, Bool.false_eq_true, ↓reduceIte] at execution
          rw [run_add, execution, tail_runs, moreRun]
          simp only [finished, matched, Bool.false_eq_true, ↓reduceIte]
          rfl

theorem finished_absorbs {Label : Type} (rows : List (Label × Pattern))
    (source : Term) (origin : Cursor) (ticks : Nat) :
    run (machine rows) ticks ⟨some (finished rows source), origin⟩ =
      ⟨some (finished rows source), origin⟩ := by
  induction rows with
  | nil => induction ticks with
    | zero => rfl
    | succ ticks ih => exact ih
  | cons entry rest ih =>
      simp only [finished]
      cases matched : Pattern.matchesBool entry.2 source with
      | true =>
          simp only [matched, ↓reduceIte]
          clear ih
          induction ticks with
          | zero => rfl
          | succ ticks tickIH => exact tickIH
      | false =>
          simp only [matched, Bool.false_eq_true, ↓reduceIte]
          change run (machine (entry :: rest)) ticks
            (liftConfiguration Control.tail ⟨some (finished rest source), origin⟩) = _
          rw [tail_runs, ih]
          rfl

theorem mutationCount_zero {Label : Type} (rows : List (Label × Pattern))
    (configuration : Configuration (Control rows)) : mutationCount (machine rows) configuration = 0 := by
  induction rows with
  | nil =>
      rcases configuration with ⟨runtime, cursor⟩
      cases runtime with
      | none => rfl
      | some state => cases state; rfl
  | cons entry rest ih =>
      rcases configuration with ⟨runtime, cursor⟩
      cases runtime with
      | none => rfl
      | some state =>
          rw [← commandCount_eq_mutationCount]
          cases state with
          | yes => rfl
          | tail state =>
              simp only [machine, transition, commandCount_map]
              change commandCount cursor ((machine rest).transition state
                (Probe.observeNode cursor) (Probe.observeIncoming cursor)) = 0
              rw [commandCount_eq_mutationCount]
              exact ih ⟨some state, cursor⟩
          | probe pc =>
              rcases pc with ⟨pc, member⟩
              have safe : (code entry.2).NoRdx := ProbeCompiler.compile_noRdx _ True.intro True.intro
              have zero := RootResetPatternFragment.mutationCount_zero _ safe ⟨some ⟨pc, member⟩, cursor⟩
              cases pc <;> try { rename_i result; cases result <;> rfl }
              all_goals
                simp only [machine, transition, commandCount_map]
                rw [commandCount_eq_mutationCount]
                exact zero

theorem runMutationCount_zero {Label : Type} (rows : List (Label × Pattern))
    (ticks : Nat) (configuration : Configuration (Control rows)) :
    runMutationCount (machine rows) ticks configuration = 0 := by
  induction ticks generalizing configuration with
  | zero => rfl
  | succ ticks ih => rw [runMutationCount, mutationCount_zero, ih, Nat.zero_add]

def ended? {Label : Type} {rows : List (Label × Pattern)}
    (configuration : Configuration (Control rows)) : Bool :=
  match configuration.control with
  | none => false
  | some state => (answer? state).isSome

theorem terminal_transition {Label : Type} (rows : List (Label × Pattern))
    (state : Control rows) (ended : (answer? state).isSome = true)
    (node : Probe.NodeKind) (incoming : Probe.Incoming) :
    (machine rows).transition state node incoming = .stay state := by
  induction rows with
  | nil => cases state; rfl
  | cons entry rest ih =>
      cases state with
      | yes => rfl
      | probe pc => cases ended
      | tail state =>
          change mapCommand Control.tail ((machine rest).transition state node incoming) = _
          rw [ih state ended]
          rfl

theorem terminal_absorbs {Label : Type} (rows : List (Label × Pattern))
    (configuration : Configuration (Control rows)) (ended : ended? configuration = true) (ticks : Nat) :
    run (machine rows) ticks configuration = configuration := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => cases ended
  | some state =>
      have same : step (machine rows) ⟨some state, cursor⟩ = ⟨some state, cursor⟩ := by
        simp only [step, terminal_transition rows state ended]
      induction ticks with
      | zero => rfl
      | succ ticks ih => rw [run_succ, same, ih]

theorem finished_ended {Label : Type} (rows : List (Label × Pattern)) (source : Term) :
    (answer? (finished rows source)).isSome = true := by rw [finished_answer]; rfl

theorem selected_sound {Label : Type} (rows : List (Label × Pattern)) (source : Term) (label : Label)
    (found : selected rows source = some label) :
    ∃ entry ∈ rows, entry.1 = label ∧ entry.2.matchesBool source = true := by
  induction rows with
  | nil => cases found
  | cons entry rest ih =>
      cases matched : entry.2.matchesBool source with
      | true =>
          rw [selected, matched] at found
          exact ⟨entry, List.Mem.head _, Option.some.inj found, matched⟩
      | false =>
          rw [selected, matched] at found
          obtain ⟨entry, member, labelEq, matchEq⟩ := ih found
          exact ⟨entry, List.Mem.tail _ member, labelEq, matchEq⟩

theorem selected_exists {Label : Type} (rows : List (Label × Pattern)) (source : Term)
    (entry : Label × Pattern) (member : entry ∈ rows) (matched : entry.2.matchesBool source = true) :
    ∃ label, selected rows source = some label := by
  induction rows with
  | nil => cases member
  | cons head rest ih =>
      cases firstMatched : head.2.matchesBool source with
      | true => exact ⟨head.1, by rw [selected, firstMatched]; rfl⟩
      | false =>
          rcases List.mem_cons.mp member with equal | later
          · subst head; rw [matched] at firstMatched; contradiction
          · obtain ⟨label, found⟩ := ih later
            exact ⟨label, by rw [selected, firstMatched]; exact found⟩

theorem selected_of_unique {Label : Type} (rows : List (Label × Pattern)) (source : Term)
    (label : Label) (existsMatch : ∃ entry ∈ rows, entry.2.matchesBool source = true)
    (unique : ∀ entry ∈ rows, entry.2.matchesBool source = true → entry.1 = label) :
    selected rows source = some label := by
  obtain ⟨entry, member, matched⟩ := existsMatch
  obtain ⟨found, selectedEq⟩ := selected_exists rows source entry member matched
  obtain ⟨first, firstMember, labelEq, firstMatch⟩ := selected_sound rows source found selectedEq
  have equal := labelEq.symm.trans (unique first firstMember firstMatch)
  exact equal ▸ selectedEq

end PureSFormal.Research.RootResetLabelledPatternFragment
