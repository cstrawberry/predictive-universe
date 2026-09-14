import PureSFormal.PureS.Probe
import PureSFormal.PureS.Script
import PureSFormal.WeakPath.Interface

/-!
# Finite one-cursor controller semantics

This module isolates the operational model used by the scheduler.  A
controller transition sees only the current node kind and incoming edge.  It
may update finite control without moving, execute exactly one of `L/R/U/Rdx`,
or reject.  The configuration contains exactly one occurrence-tree cursor.

Finiteness is witnessed constructively by a list covering the controller's
control type.  No term, address, counter, stack, or history occurs in the
finite control state.
-/

namespace PureSFormal.PureS

namespace FiniteController

/-- One microinstruction chosen from the two permitted local observations. -/
inductive Command (Control : Type) where
  | stay (next : Control)
  | exec (primitive : Primitive) (next : Control)
  | reject
  deriving Repr

/--
A deterministic finite controller.  `covers` is explicit evidence that the
runtime control type has only the entries listed in `states`.
-/
structure Machine (Control : Type) where
  stateCover : Unit → List Control
  covers : ∀ control, control ∈ stateCover ()
  transition : Control → Probe.NodeKind → Probe.Incoming → Command Control

/-- Force the finite-state certificate when a proof or resource bound needs it. -/
def Machine.states (machine : Machine Control) : List Control :=
  machine.stateCover ()

/-- `none` is the unique rejecting sink; `some q` is an ordinary microstate. -/
abbrev RuntimeControl (Control : Type) := Option Control

/-- One finite-control value paired with exactly one occurrence-tree cursor. -/
structure Configuration (Control : Type) where
  control : RuntimeControl Control
  cursor : Cursor
  deriving Repr

/-- The finite list covering every runtime control value, including reject. -/
def runtimeStates (machine : Machine Control) : List (RuntimeControl Control) :=
  none :: machine.states.map some

/-- Mapping `some` preserves constructive list membership. -/
private theorem some_mem_map_of_mem {states : List Control} {control : Control}
    (h : control ∈ states) : some control ∈ states.map some := by
  induction h with
  | head => exact List.Mem.head _
  | tail other _ ih => exact List.Mem.tail _ ih

theorem mem_runtimeStates (machine : Machine Control)
    (control : RuntimeControl Control) :
    control ∈ runtimeStates machine := by
  cases control with
  | none => exact List.Mem.head _
  | some control =>
      exact List.Mem.tail _ (some_mem_map_of_mem (machine.covers control))

/-- Execute one deterministic controller microtransition. -/
def step (machine : Machine Control) (configuration : Configuration Control) :
    Configuration Control :=
  match configuration.control with
  | none => configuration
  | some control =>
      match machine.transition control
          (Probe.observeNode configuration.cursor)
          (Probe.observeIncoming configuration.cursor) with
      | .stay next => ⟨some next, configuration.cursor⟩
      | .reject => ⟨none, configuration.cursor⟩
      | .exec primitive next =>
          match primitive.exec configuration.cursor with
          | none => ⟨none, configuration.cursor⟩
          | some cursor => ⟨some next, cursor⟩

@[simp]
theorem step_reject (machine : Machine Control) (cursor : Cursor) :
    step machine ⟨none, cursor⟩ = ⟨none, cursor⟩ :=
  rfl

/-- Whether this microtransition successfully executes `Rdx`. -/
def mutationCount (machine : Machine Control)
    (configuration : Configuration Control) : Nat :=
  match configuration.control with
  | none => 0
  | some control =>
      match machine.transition control
          (Probe.observeNode configuration.cursor)
          (Probe.observeIncoming configuration.cursor) with
      | .exec .Rdx _ =>
          match configuration.cursor.rdx? with
          | some _ => 1
          | none => 0
      | _ => 0

/--
One microtransition either preserves the bare term or performs exactly one
contextual pure-S contraction.  The latter case is counted by
`mutationCount`.
-/
theorem step_projects_stepsN (machine : Machine Control)
    (configuration : Configuration Control) :
    StepsN (mutationCount machine configuration)
      configuration.cursor.erase
      (step machine configuration).cursor.erase := by
  cases configuration with
  | mk runtime cursor =>
      cases runtime with
      | none =>
          simp only [mutationCount, step]
          exact StepsN.refl _
      | some control =>
          generalize hcommand : machine.transition control
            (Probe.observeNode cursor) (Probe.observeIncoming cursor) = command
          cases command with
          | stay next =>
              simp only [mutationCount, step, hcommand]
              exact StepsN.refl _
          | reject =>
              simp only [mutationCount, step, hcommand]
              exact StepsN.refl _
          | exec primitive next =>
              cases primitive with
              | L =>
                  generalize hmove : cursor.left? = moved
                  cases moved with
                  | none =>
                      simp only [mutationCount, step, hcommand, Primitive.exec,
                        hmove]
                      exact StepsN.refl _
                  | some after =>
                      have herase := Cursor.left?_preserves_erase hmove
                      simpa only [mutationCount, step, hcommand, Primitive.exec, hmove,
                        herase] using StepsN.refl cursor.erase
              | R =>
                  generalize hmove : cursor.right? = moved
                  cases moved with
                  | none =>
                      simp only [mutationCount, step, hcommand, Primitive.exec,
                        hmove]
                      exact StepsN.refl _
                  | some after =>
                      have herase := Cursor.right?_preserves_erase hmove
                      simpa only [mutationCount, step, hcommand, Primitive.exec, hmove,
                        herase] using StepsN.refl cursor.erase
              | U =>
                  generalize hmove : cursor.up? = moved
                  cases moved with
                  | none =>
                      simp only [mutationCount, step, hcommand, Primitive.exec,
                        hmove]
                      exact StepsN.refl _
                  | some after =>
                      have herase := Cursor.up?_preserves_erase hmove
                      simpa only [mutationCount, step, hcommand, Primitive.exec, hmove,
                        herase] using StepsN.refl cursor.erase
              | Rdx =>
                  generalize hmove : cursor.rdx? = moved
                  cases moved with
                  | none =>
                      simp only [mutationCount, step, hcommand, Primitive.exec,
                        hmove]
                      exact StepsN.refl _
                  | some after =>
                      simpa only [mutationCount, step, hcommand, Primitive.exec, hmove] using
                        StepsN.single (Cursor.rdx?_sound hmove)

/-- Deterministic controller state after exactly `ticks` microtransitions. -/
def run (machine : Machine Control) : Nat → Configuration Control →
    Configuration Control
  | 0, configuration => configuration
  | ticks + 1, configuration => run machine ticks (step machine configuration)

/-- Number of successful strict contractions during a finite controller run. -/
def runMutationCount (machine : Machine Control) :
    Nat → Configuration Control → Nat
  | 0, _ => 0
  | ticks + 1, configuration =>
      mutationCount machine configuration +
        runMutationCount machine ticks (step machine configuration)

@[simp]
theorem run_zero (machine : Machine Control)
    (configuration : Configuration Control) :
    run machine 0 configuration = configuration :=
  rfl

@[simp]
theorem run_succ (machine : Machine Control) (ticks : Nat)
    (configuration : Configuration Control) :
    run machine (ticks + 1) configuration =
      run machine ticks (step machine configuration) :=
  rfl

/-- Splitting a finite controller run at an exact tick boundary. -/
theorem run_add (machine : Machine Control) (first second : Nat)
    (configuration : Configuration Control) :
    run machine (first + second) configuration =
      run machine second (run machine first configuration) := by
  induction first generalizing configuration with
  | zero => simp only [Nat.zero_add, run_zero]
  | succ first ih =>
      simpa only [Nat.succ_add, run_succ] using
        ih (step machine configuration)

/-- Mutation counts split additively at an exact tick boundary. -/
theorem runMutationCount_add (machine : Machine Control)
    (first second : Nat) (configuration : Configuration Control) :
    runMutationCount machine (first + second) configuration =
      runMutationCount machine first configuration +
        runMutationCount machine second (run machine first configuration) := by
  induction first generalizing configuration with
  | zero => simp only [Nat.zero_add, runMutationCount, Nat.zero_add, run_zero]
  | succ first ih =>
      simp only [Nat.succ_add, runMutationCount, run_succ]
      rw [ih (step machine configuration), Nat.add_assoc]

/--
Erasing a finite run gives an ordinary pure-S reduction with exactly the
number of successful focused `Rdx` instructions executed by the controller.
-/
theorem run_projects_stepsN (machine : Machine Control) (ticks : Nat)
    (configuration : Configuration Control) :
    StepsN (runMutationCount machine ticks configuration)
      configuration.cursor.erase
      (run machine ticks configuration).cursor.erase := by
  induction ticks generalizing configuration with
  | zero => exact StepsN.refl _
  | succ ticks ih =>
      exact StepsN.trans
        (step_projects_stepsN machine configuration)
        (ih (step machine configuration))

/-- Once rejected, every later controller configuration is the same sink. -/
theorem run_reject (machine : Machine Control) (ticks : Nat)
    (cursor : Cursor) :
    run machine ticks ⟨none, cursor⟩ = ⟨none, cursor⟩ := by
  induction ticks with
  | zero => rfl
  | succ ticks ih =>
      simpa only [run_succ, step_reject] using ih

/-- A counted mutating microstep is literally one pure-S contraction. -/
theorem mutationCount_one_sound
    (machine : Machine Control) (configuration : Configuration Control)
    (hcount : mutationCount machine configuration = 1) :
    Step configuration.cursor.erase
      (step machine configuration).cursor.erase := by
  cases configuration with
  | mk runtime cursor =>
      cases runtime with
      | none =>
          simp [mutationCount] at hcount
      | some control =>
          generalize hcommand : machine.transition control
            (Probe.observeNode cursor) (Probe.observeIncoming cursor) = command
          cases command with
          | stay next =>
              simp [mutationCount, hcommand] at hcount
          | reject =>
              simp [mutationCount, hcommand] at hcount
          | exec primitive next =>
              cases primitive with
              | L =>
                  generalize hmove : cursor.left? = moved
                  cases moved with
                  | none => simp [mutationCount, hcommand] at hcount
                  | some after => simp [mutationCount, hcommand] at hcount
              | R =>
                  generalize hmove : cursor.right? = moved
                  cases moved with
                  | none => simp [mutationCount, hcommand] at hcount
                  | some after => simp [mutationCount, hcommand] at hcount
              | U =>
                  generalize hmove : cursor.up? = moved
                  cases moved with
                  | none => simp [mutationCount, hcommand] at hcount
                  | some after => simp [mutationCount, hcommand] at hcount
              | Rdx =>
                  generalize hmove : cursor.rdx? = moved
                  cases moved with
                  | none =>
                      simp [mutationCount, hcommand, hmove] at hcount
                  | some after =>
                      simpa only [step, hcommand, Primitive.exec, hmove] using
                        Cursor.rdx?_sound hmove

/-- A microtransition can perform at most one strict contraction. -/
theorem mutationCount_le_one
    (machine : Machine Control) (configuration : Configuration Control) :
    mutationCount machine configuration ≤ 1 := by
  cases configuration with
  | mk runtime cursor =>
      cases runtime with
      | none => exact Nat.zero_le 1
      | some control =>
          generalize hcommand : machine.transition control
            (Probe.observeNode cursor) (Probe.observeIncoming cursor) = command
          cases command with
          | stay next => simpa [mutationCount, hcommand]
          | reject => simpa [mutationCount, hcommand]
          | exec primitive next =>
              cases primitive with
              | L => simpa [mutationCount, hcommand]
              | R => simpa [mutationCount, hcommand]
              | U => simpa [mutationCount, hcommand]
              | Rdx =>
                  generalize hmove : cursor.rdx? = moved
                  cases moved <;> simp [mutationCount, hcommand, hmove]

/-- A microtransition's mutation count is definitionally either zero or one. -/
theorem mutationCount_eq_zero_or_one
    (machine : Machine Control) (configuration : Configuration Control) :
    mutationCount machine configuration = 0 ∨
      mutationCount machine configuration = 1 := by
  cases configuration with
  | mk runtime cursor =>
      cases runtime with
      | none => exact Or.inl rfl
      | some control =>
          generalize hcommand : machine.transition control
            (Probe.observeNode cursor) (Probe.observeIncoming cursor) = command
          cases command with
          | stay next => exact Or.inl (by simp [mutationCount, hcommand])
          | reject => exact Or.inl (by simp [mutationCount, hcommand])
          | exec primitive next =>
              cases primitive with
              | L => exact Or.inl (by simp [mutationCount, hcommand])
              | R => exact Or.inl (by simp [mutationCount, hcommand])
              | U => exact Or.inl (by simp [mutationCount, hcommand])
              | Rdx =>
                  generalize hmove : cursor.rdx? = moved
                  cases moved with
                  | none => exact Or.inl (by simp [mutationCount, hcommand, hmove])
                  | some after =>
                      exact Or.inr (by simp [mutationCount, hcommand, hmove])

/-- A zero-count microtransition preserves the erased term exactly. -/
theorem erase_step_of_mutationCount_zero
    (machine : Machine Control) (configuration : Configuration Control)
    (hcount : mutationCount machine configuration = 0) :
    (step machine configuration).cursor.erase =
      configuration.cursor.erase := by
  have projected := step_projects_stepsN machine configuration
  rw [hcount] at projected
  exact (StepsN.eq_of_zero projected).symm

/-! ## Constructive contraction projection -/

/--
Search at most `fuel` microtransitions for the first successful `Rdx`,
returning the configuration immediately after it.  This is executable and
uses no choice operator.
-/
def seekMutation (machine : Machine Control) :
    Nat → Configuration Control → Option (Configuration Control)
  | 0, _ => none
  | fuel + 1, configuration =>
      let after := step machine configuration
      if mutationCount machine configuration = 1 then
        some after
      else
        seekMutation machine fuel after

/-- Every successful bounded search projects to exactly one pure-S step. -/
theorem seekMutation_sound
    (machine : Machine Control) {fuel : Nat}
    {before after : Configuration Control}
    (h : seekMutation machine fuel before = some after) :
    Step before.cursor.erase after.cursor.erase := by
  induction fuel generalizing before with
  | zero => simp [seekMutation] at h
  | succ fuel ih =>
      simp only [seekMutation] at h
      by_cases hcount : mutationCount machine before = 1
      · simp only [hcount, ↓reduceIte, Option.some.injEq] at h
        subst after
        exact mutationCount_one_sound machine before hcount
      · simp only [hcount, ↓reduceIte] at h
        have hzero : mutationCount machine before = 0 := by
          rcases mutationCount_eq_zero_or_one machine before with hzero | hone
          · exact hzero
          · exact (hcount hone).elim
        have herase := erase_step_of_mutationCount_zero machine before hzero
        have htail := ih h
        rw [herase] at htail
        exact htail

/-- Successful search never returns the rejecting start as a fake mutation. -/
theorem seekMutation_reject
    (machine : Machine Control) (fuel : Nat) (cursor : Cursor) :
    seekMutation machine fuel ⟨none, cursor⟩ = none := by
  induction fuel with
  | zero => rfl
  | succ fuel ih =>
      simp [seekMutation, step_reject, mutationCount, ih]

/--
If a finite controller run contains at least one successful mutation, the
executable bounded search returns a concrete first post-mutation state.
-/
theorem exists_seekMutation_of_runMutationCount_pos
    (machine : Machine Control) {fuel : Nat}
    {configuration : Configuration Control}
    (hpositive : 0 < runMutationCount machine fuel configuration) :
    ∃ after, seekMutation machine fuel configuration = some after := by
  induction fuel generalizing configuration with
  | zero =>
      simp [runMutationCount] at hpositive
  | succ fuel ih =>
      simp only [runMutationCount] at hpositive
      by_cases hcount : mutationCount machine configuration = 1
      · exact ⟨step machine configuration, by simp [seekMutation, hcount]⟩
      · have hzero : mutationCount machine configuration = 0 := by
          rcases mutationCount_eq_zero_or_one machine configuration with
            hzero | hone
          · exact hzero
          · exact (hcount hone).elim
        rw [hzero, Nat.zero_add] at hpositive
        obtain ⟨after, hafter⟩ := ih hpositive
        exact ⟨after, by simp [seekMutation, hcount, hafter]⟩

/-- A computable bound function turns bounded search into a total next state. -/
def advance (machine : Machine Control)
    (bound : Configuration Control → Nat)
    (configuration : Configuration Control) : Configuration Control :=
  (seekMutation machine (bound configuration) configuration).getD configuration

theorem advance_eq_of_seekMutation
    (machine : Machine Control) (bound : Configuration Control → Nat)
    {configuration after : Configuration Control}
    (h : seekMutation machine (bound configuration) configuration = some after) :
    advance machine bound configuration = after := by
  simp [advance, h]

/--
Data sufficient to extract an infinite contraction-only path from a finite
microcontroller.  `bound` is executable; `good` and its proofs are erased
logical invariants and never enter runtime scheduler state.
-/
structure ProductiveSystem (machine : Machine Control) where
  bound : Configuration Control → Nat
  good : Configuration Control → Prop
  initial : Configuration Control
  initial_good : good initial
  finds : ∀ configuration, good configuration →
    ∃ after,
      seekMutation machine (bound configuration) configuration = some after
  closed : ∀ {configuration after}, good configuration →
    seekMutation machine (bound configuration) configuration = some after →
      good after

namespace ProductiveSystem

variable {Control : Type} {machine : Machine Control}

/-- Executable configuration at the next contraction event. -/
def next (system : ProductiveSystem machine)
    (configuration : Configuration Control) : Configuration Control :=
  advance machine system.bound configuration

theorem next_step (system : ProductiveSystem machine)
    {configuration : Configuration Control}
    (hgood : system.good configuration) :
    Step configuration.cursor.erase (next system configuration).cursor.erase := by
  obtain ⟨after, hafter⟩ := system.finds configuration hgood
  have hnext : next system configuration = after :=
    advance_eq_of_seekMutation machine system.bound hafter
  rw [hnext]
  exact seekMutation_sound machine hafter

theorem next_good (system : ProductiveSystem machine)
    {configuration : Configuration Control}
    (hgood : system.good configuration) :
    system.good (next system configuration) := by
  obtain ⟨after, hafter⟩ := system.finds configuration hgood
  have hnext : next system configuration = after :=
    advance_eq_of_seekMutation machine system.bound hafter
  rw [hnext]
  exact system.closed hgood hafter

/-- Infinite executable run sampled exactly after each contraction. -/
def contractionRun (system : ProductiveSystem machine) :
    Nat → Configuration Control
  | 0 => system.initial
  | n + 1 => next system (contractionRun system n)

@[simp]
theorem contractionRun_zero (system : ProductiveSystem machine) :
    contractionRun system 0 = system.initial :=
  rfl

@[simp]
theorem contractionRun_succ (system : ProductiveSystem machine) (n : Nat) :
    contractionRun system (n + 1) =
      next system (contractionRun system n) :=
  rfl

theorem contractionRun_good (system : ProductiveSystem machine) (n : Nat) :
    system.good (contractionRun system n) := by
  induction n with
  | zero => exact system.initial_good
  | succ n ih => exact next_good system ih

/-- The sampled run is an ordinary infinite pure-S reduction path. -/
def reductionPath (system : ProductiveSystem machine) :
    WeakPath.ReductionPath where
  term n := (contractionRun system n).cursor.erase
  contracts n := next_step system (contractionRun_good system n)

@[simp]
theorem reductionPath_zero (system : ProductiveSystem machine) :
    (reductionPath system).term 0 = system.initial.cursor.erase :=
  rfl

end ProductiveSystem

end FiniteController

end PureSFormal.PureS
