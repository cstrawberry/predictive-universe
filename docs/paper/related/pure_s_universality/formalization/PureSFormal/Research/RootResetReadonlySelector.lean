import PureSFormal.Research.RootResetCarrierNonemptyProbe
import PureSFormal.Research.RootResetProgressEulerContract

/-!
A finite read-only selection pass followed by exactly one contraction, or
root ascent and the complete Euler search. The pass may move on a miss;
the fallback stores no origin and climbs by the observed incoming edge.
-/
namespace PureSFormal.Research.RootResetReadonlySelector
open PureSFormal.PureS
open FiniteController RootResetSelectorContract RootResetCarrierNonemptyProbe

structure ProbeSpec (α : Type) where
  machine : Machine α
  start : α
  answer : α → Option Bool
  terminal_stay : ∀ state node incoming, (answer state).isSome = true →
    machine.transition state node incoming = .stay state
  mutation_zero : ∀ configuration, mutationCount machine configuration = 0
  coefficient : Nat
  all_input : ∀ source, ∃ ticks state endpoint,
    ticks ≤ coefficient * (source.size + 1) ∧
    run machine ticks ⟨some start, Cursor.atRoot source⟩ = ⟨some state, endpoint⟩ ∧
    (answer state).isSome = true ∧ endpoint.erase = source ∧
    (answer state = some true → endpoint.rdx?.isSome = true)

namespace Tail
abbrev Control := RootResetProgressEulerSelector.Control
abbrev machine := RootResetProgressEulerSelector.machine
end Tail

inductive Control (α : Type) where
  | probe (state : α)
  | tail (state : Tail.Control)

def transition (spec : ProbeSpec α) : Control α → Probe.NodeKind → Probe.Incoming → Command (Control α)
  | .probe state, node, incoming => match spec.answer state with
    | some true => .stay (.tail (.euler .contract))
    | some false => .stay (.tail .abort)
    | none => mapCommand .probe (spec.machine.transition state node incoming)
  | .tail state, node, incoming => mapCommand .tail (Tail.machine.transition state node incoming)

def states (spec : ProbeSpec α) : List (Control α) :=
  spec.machine.states.map .probe ++ Tail.machine.states.map .tail

theorem covers (spec : ProbeSpec α) (state : Control α) : state ∈ states spec := by
  cases state with
  | probe state => exact List.mem_append.mpr (Or.inl
      (RootResetCompletedLocalPatterns.map_member _ (spec.machine.covers state)))
  | tail state => exact List.mem_append.mpr (Or.inr
      (RootResetCompletedLocalPatterns.map_member _ (Tail.machine.covers state)))

def machine (spec : ProbeSpec α) : Machine (Control α) := ⟨fun _ => states spec, covers spec, transition spec⟩
def initial (spec : ProbeSpec α) (source : Term) : Configuration (Control α) :=
  ⟨some (.probe spec.start), Cursor.atRoot source⟩
def ended (spec : ProbeSpec α) (configuration : Configuration α) : Bool :=
  (configuration.control.bind spec.answer).isSome

theorem probe_absorbs (spec : ProbeSpec α) (configuration : Configuration α)
    (terminal : ended spec configuration = true) (ticks : Nat) :
    run spec.machine ticks configuration = configuration := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => cases terminal
  | some state =>
      have stopped := spec.terminal_stay state (Probe.observeNode cursor) (Probe.observeIncoming cursor) terminal
      induction ticks with
      | zero => rfl
      | succ ticks ih => rw [run_succ]; simpa only [step, stopped] using ih

theorem probe_step (spec : ProbeSpec α) (configuration : Configuration α)
    (running : ended spec configuration = false) :
    step (machine spec) (liftConfiguration Control.probe configuration) =
      liftConfiguration Control.probe (step spec.machine configuration) := by
  apply step_lift
  intro state present
  rcases configuration with ⟨runtime, cursor⟩
  have equal : runtime = some state := present
  subst runtime
  change (spec.answer state).isSome = false at running
  have miss : spec.answer state = none := by
    cases value : spec.answer state with
    | none => rfl
    | some bit => rw [value] at running; cases running
  simp only [machine, transition, miss]

theorem tail_step (spec : ProbeSpec α) (configuration : Configuration Tail.Control) :
    step (machine spec) (liftConfiguration Control.tail configuration) =
      liftConfiguration Control.tail (step Tail.machine configuration) := by
  apply step_lift
  intro state _
  rfl

theorem tail_runs (spec : ProbeSpec α) (ticks : Nat) (configuration : Configuration Tail.Control) :
    run (machine spec) ticks (liftConfiguration Control.tail configuration) =
      liftConfiguration Control.tail (run Tail.machine ticks configuration) := by
  induction ticks generalizing configuration with
  | zero => rfl
  | succ ticks ih => rw [run_succ, tail_step, ih]; rfl

theorem probe_runs (spec : ProbeSpec α) (source : Term) (ticks : Nat) (state : α) (endpoint : Cursor)
    (execution : run spec.machine ticks ⟨some spec.start, Cursor.atRoot source⟩ = ⟨some state, endpoint⟩)
    (terminal : (spec.answer state).isSome = true) :
    ∃ used, used ≤ ticks ∧ run (machine spec) used (initial spec source) = ⟨some (.probe state), endpoint⟩ := by
  obtain ⟨used, bounded, actual⟩ := run_to_boundary spec.machine (machine spec) Control.probe (ended spec)
    (probe_absorbs spec) (probe_step spec) ticks ⟨some spec.start, Cursor.atRoot source⟩
    (by rw [execution]; exact terminal)
  rw [execution] at actual
  exact ⟨used, bounded, actual⟩

def haltKind : Control α → Option HaltKind
  | .probe _ => none
  | .tail state => RootResetProgressEulerSelector.haltKind state

def Result (source : Term) (configuration : Configuration (Control α)) : Prop :=
  (configuration.control = some (.tail (.euler .doneNF)) ∧ AddressNormal source ∧ configuration.cursor.erase = source) ∨
  (configuration.control = some (.tail (.euler .doneRedex)) ∧
    source.contractAt? (cursorAddress configuration.cursor) = some configuration.cursor.erase)

theorem tail_result (source : Term) (configuration : Configuration Tail.Control)
    (result : RootResetProgressEulerTotality.WholeResult source configuration) :
    Result (α := α) source (liftConfiguration Control.tail configuration) := by
  rcases result with normal | redex
  · exact Or.inl ⟨congrArg (Option.map Control.tail) normal.1, normal.2⟩
  · exact Or.inr ⟨congrArg (Option.map Control.tail) redex.1, redex.2⟩

theorem terminal_stay (spec : ProbeSpec α) (state : Control α) (node : Probe.NodeKind) (incoming : Probe.Incoming)
    (terminal : (haltKind state).isSome = true) : (machine spec).transition state node incoming = .stay state := by
  cases state with
  | probe _ => cases terminal
  | tail state =>
      change mapCommand Control.tail (Tail.machine.transition state node incoming) = _
      rw [RootResetProgressEulerSelector.terminal_controls_absorbing state node incoming terminal]
      rfl

theorem result_absorbs (spec : ProbeSpec α) (source : Term) (configuration : Configuration (Control α))
    (result : Result source configuration) (ticks : Nat) : run (machine spec) ticks configuration = configuration := by
  have terminal : (runtimeHaltKind haltKind configuration.control).isSome = true := by
    rcases result with normal | redex
    · rw [normal.1]; rfl
    · rw [redex.1]; rfl
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => cases terminal
  | some state =>
      have stopped := terminal_stay spec state (Probe.observeNode cursor) (Probe.observeIncoming cursor) terminal
      induction ticks with
      | zero => rfl
      | succ ticks ih => rw [run_succ]; simpa only [step, stopped] using ih

theorem contract_result (origin : Cursor) (ready : origin.rdx?.isSome = true) :
    RootResetProgressEulerTotality.WholeResult origin.erase
      (run Tail.machine 1 ⟨some (.euler .contract), origin⟩) := by
  rcases origin with ⟨focus, parents⟩
  cases contracted : focus.contractRoot? with
  | none => simp only [Cursor.rdx?, contracted, Option.map_none, Option.isSome_none] at ready; cases ready
  | some replacement =>
      have execution : run Tail.machine 1 ⟨some (.euler .contract), ⟨focus, parents⟩⟩ =
          ⟨some (.euler .doneRedex), ⟨replacement, parents⟩⟩ := by
        simp only [run, step, Tail.machine, RootResetProgressEulerSelector.machine,
          RootResetProgressEulerSelector.transition, RootResetProgressEulerSelector.liftEulerCommand,
          RootResetEulerWalker.machine, RootResetEulerWalker.transition, Primitive.exec, Cursor.rdx?, contracted]
      rw [execution]
      refine Or.inr ⟨rfl, ?_⟩
      have literal := contractAt?_cursorAddress ⟨focus, parents⟩
      rw [contracted] at literal
      exact literal

def coefficient (spec : ProbeSpec α) : Nat := spec.coefficient + 31

theorem coefficient_pos (spec : ProbeSpec α) : 0 < coefficient spec :=
  Nat.zero_lt_succ _

theorem combined_bound (spec : ProbeSpec α) (source : Term) (first rest : Nat)
    (firstBound : first ≤ spec.coefficient * (source.size + 1))
    (restBound : rest ≤ 31 * (source.size + 1)) :
    first + rest ≤ coefficient spec * (source.size + 1) := by
  simpa only [coefficient, Nat.add_mul] using Nat.add_le_add firstBound restBound

theorem all_input (spec : ProbeSpec α) (source : Term) :
    ∃ ticks, ticks ≤ coefficient spec * (source.size + 1) ∧
      Result source (run (machine spec) ticks (initial spec source)) := by
  obtain ⟨ticks, state, endpoint, bounded, execution, terminal, preserved, sound⟩ := spec.all_input source
  obtain ⟨used, usedBound, actual⟩ := probe_runs spec source ticks state endpoint execution terminal
  have paid := Nat.le_trans usedBound bounded
  cases answerEq : spec.answer state with
  | none => rw [answerEq] at terminal; cases terminal
  | some ready => cases ready with
    | true =>
        have handoff : run (machine spec) 1 ⟨some (.probe state), endpoint⟩ =
            liftConfiguration Control.tail ⟨some (.euler .contract), endpoint⟩ := by
          simp only [run, step, machine, transition, answerEq]; rfl
        refine ⟨used + (1 + 1), combined_bound spec source used 2 paid ?_, ?_⟩
        · exact Nat.le_trans (by decide : 2 ≤ 31)
            (by simpa only [Nat.mul_one] using Nat.mul_le_mul_left 31 (Nat.succ_le_succ (Nat.zero_le source.size)))
        · rw [run_add, actual, run_add, handoff, tail_runs]
          have result := contract_result endpoint (sound answerEq)
          rw [preserved] at result
          exact tail_result source _ result
    | false =>
        obtain ⟨suffix, suffixBound, result⟩ := RootResetProgressEulerTotality.abort_suffix_result endpoint.focus endpoint.parents
        change suffix ≤ 29 * (endpoint.erase.size + 1) at suffixBound
        change RootResetProgressEulerTotality.WholeResult endpoint.erase
          (run Tail.machine suffix ⟨some .abort, endpoint⟩) at result
        rw [preserved] at suffixBound result
        have handoff : run (machine spec) 1 ⟨some (.probe state), endpoint⟩ =
            liftConfiguration Control.tail ⟨some .abort, endpoint⟩ := by
          simp only [run, step, machine, transition, answerEq]; rfl
        refine ⟨used + (1 + suffix), combined_bound spec source used (1 + suffix) paid ?_, ?_⟩
        · have one : 1 ≤ 2 * (source.size + 1) := Nat.le_trans (by decide : 1 ≤ 2)
            (by simpa only [Nat.mul_one] using Nat.mul_le_mul_left 2 (Nat.succ_le_succ (Nat.zero_le source.size)))
          have total := Nat.add_le_add one suffixBound
          simpa only [← Nat.add_mul] using total
        · rw [run_add, actual, run_add, handoff, tail_runs]
          exact tail_result source _ result

def redexFlag (configuration : Configuration (Control α)) : Nat :=
  match configuration.control with
  | some (.tail state) => RootResetProgressEulerContract.redexFlag ⟨some state, configuration.cursor⟩
  | _ => 0

theorem flag_tail (configuration : Configuration Tail.Control) :
    redexFlag (α := α) (liftConfiguration Control.tail configuration) =
      RootResetProgressEulerContract.redexFlag configuration := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime <;> rfl

theorem mutation_tail (spec : ProbeSpec α) (configuration : Configuration Tail.Control) :
    mutationCount (machine spec) (liftConfiguration Control.tail configuration) = mutationCount Tail.machine configuration := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => rfl
  | some state =>
      change mutationCount (machine spec) ⟨some (.tail state), cursor⟩ = _
      rw [← commandCount_eq_mutationCount]
      change commandCount cursor (mapCommand Control.tail _) = _
      rw [commandCount_map, commandCount_eq_mutationCount]

theorem mutation_probe (spec : ProbeSpec α) (state : α) (cursor : Cursor) :
    mutationCount (machine spec) ⟨some (.probe state), cursor⟩ = 0 := by
  rw [← commandCount_eq_mutationCount]
  change commandCount cursor (transition spec (.probe state) _ _) = _
  cases answerEq : spec.answer state with
  | some bit => cases bit <;> simp only [transition, answerEq, commandCount]
  | none =>
      simp only [transition, answerEq, commandCount_map]
      rw [commandCount_eq_mutationCount]
      exact spec.mutation_zero _

theorem flag_probe_step (spec : ProbeSpec α) (state : α) (cursor : Cursor) :
    redexFlag (step (machine spec) ⟨some (.probe state), cursor⟩) = 0 := by
  cases answerEq : spec.answer state with
  | some bit => cases bit <;> simp only [step, machine, transition, answerEq] <;> rfl
  | none =>
      simp only [step, machine, transition, answerEq]
      cases commandEq : spec.machine.transition state (Probe.observeNode cursor) (Probe.observeIncoming cursor) with
      | stay next => rfl
      | reject => rfl
      | exec operation next =>
          simp only [mapCommand]
          cases moved : operation.exec cursor <;> rfl

theorem flag_step (spec : ProbeSpec α) (configuration : Configuration (Control α)) :
    redexFlag (step (machine spec) configuration) = redexFlag configuration + mutationCount (machine spec) configuration := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => rfl
  | some state => cases state with
    | probe state => rw [flag_probe_step, mutation_probe]; rfl
    | tail state =>
        change redexFlag (step (machine spec) (liftConfiguration Control.tail ⟨some state, cursor⟩)) = _
        rw [tail_step, flag_tail]
        change _ = redexFlag (liftConfiguration Control.tail ⟨some state, cursor⟩) +
          mutationCount (machine spec) (liftConfiguration Control.tail ⟨some state, cursor⟩)
        rw [flag_tail, mutation_tail]
        exact RootResetProgressEulerContract.redexFlag_step _

theorem flag_run (spec : ProbeSpec α) (ticks : Nat) (configuration : Configuration (Control α)) :
    redexFlag (run (machine spec) ticks configuration) = redexFlag configuration +
      runMutationCount (machine spec) ticks configuration := by
  induction ticks generalizing configuration with
  | zero => rfl
  | succ ticks ih => rw [run_succ, ih, flag_step, runMutationCount, Nat.add_assoc]

def stoppingTime (spec : ProbeSpec α) (source : Term) : Nat := coefficient spec * (source.size + 1)
def final (spec : ProbeSpec α) (source : Term) : Configuration (Control α) :=
  run (machine spec) (stoppingTime spec source) (initial spec source)

theorem final_result (spec : ProbeSpec α) (source : Term) : Result source (final spec source) := by
  obtain ⟨ticks, bounded, result⟩ := all_input spec source
  have split : ticks + (stoppingTime spec source - ticks) = stoppingTime spec source := Nat.add_sub_of_le bounded
  unfold final
  rw [← split, run_add, result_absorbs spec source _ result]
  exact result

theorem final_flag (spec : ProbeSpec α) (source : Term) :
    runMutationCount (machine spec) (stoppingTime spec source) (initial spec source) = redexFlag (final spec source) := by
  have counted := flag_run spec (stoppingTime spec source) (initial spec source)
  change redexFlag (final spec source) = 0 + _ at counted
  simpa only [Nat.zero_add] using counted.symm

theorem final_nf (spec : ProbeSpec α) (source : Term)
    (normal : runtimeHaltKind haltKind (final spec source).control = some .nf) :
    AddressNormal source ∧ (final spec source).cursor.erase = source ∧
      runMutationCount (machine spec) (stoppingTime spec source) (initial spec source) = 0 := by
  rcases final_result spec source with nf | redex
  · refine ⟨nf.2.1, nf.2.2, ?_⟩
    rw [final_flag]
    simp only [redexFlag, nf.1]
    rfl
  · rw [redex.1] at normal
    cases normal

theorem final_redex (spec : ProbeSpec α) (source : Term)
    (nonNormal : runtimeHaltKind haltKind (final spec source).control ≠ some .nf) :
    runtimeHaltKind haltKind (final spec source).control = some .redex ∧
      source.contractAt? (cursorAddress (final spec source).cursor) = some (final spec source).cursor.erase ∧
      runMutationCount (machine spec) (stoppingTime spec source) (initial spec source) = 1 := by
  rcases final_result spec source with nf | redex
  · exact False.elim (nonNormal (by rw [nf.1]; rfl))
  · refine ⟨by rw [redex.1]; rfl, redex.2, ?_⟩
    rw [final_flag]
    simp only [redexFlag, redex.1]
    rfl

def outcome (spec : ProbeSpec α) (source : Term) : Outcome source :=
  if normal : runtimeHaltKind haltKind (final spec source).control = some .nf then
    .nf (final_nf spec source normal).1
  else
    .redex (cursorAddress (final spec source).cursor) (final spec source).cursor.erase
      (final_redex spec source normal).2.1

theorem outcome_agrees (spec : ProbeSpec α) (source : Term) :
    match outcome spec source with
    | .nf _ => runtimeHaltKind haltKind (final spec source).control = some .nf ∧
        (final spec source).cursor.erase = source
    | .redex address target _ => runtimeHaltKind haltKind (final spec source).control = some .redex ∧
        cursorAddress (final spec source).cursor = address ∧ (final spec source).cursor.erase = target := by
  by_cases normal : runtimeHaltKind haltKind (final spec source).control = some .nf
  · simp only [outcome, normal, dite_true]
    exact ⟨True.intro, (final_nf spec source normal).2.1⟩
  · simp only [outcome, normal, dite_false]
    exact ⟨(final_redex spec source normal).1, True.intro, True.intro⟩

theorem mutation_agrees (spec : ProbeSpec α) (source : Term) :
    match outcome spec source with
    | .nf _ => runMutationCount (machine spec) (stoppingTime spec source) (initial spec source) = 0
    | .redex _ _ _ => runMutationCount (machine spec) (stoppingTime spec source) (initial spec source) = 1 := by
  by_cases normal : runtimeHaltKind haltKind (final spec source).control = some .nf
  · simp only [outcome, normal, dite_true]
    exact (final_nf spec source normal).2.2
  · simp only [outcome, normal, dite_false]
    exact (final_redex spec source normal).2.2

def selectorContract (spec : ProbeSpec α) : Contract where
  Control := Control α
  machine := machine spec
  start := .probe spec.start
  haltKind := haltKind
  coefficient := coefficient spec
  coefficient_pos := coefficient_pos spec
  stoppingTime := stoppingTime spec
  outcome := outcome spec
  stoppingTime_le := fun _ => Nat.le_refl _
  terminal := by
    intro source
    change (runtimeHaltKind haltKind (final spec source).control).isSome = true
    rcases final_result spec source with nf | redex
    · rw [nf.1]; rfl
    · rw [redex.1]; rfl
  terminal_absorbing := terminal_stay spec
  outcome_agrees := outcome_agrees spec
  mutationCount_agrees := mutation_agrees spec

theorem probe_terminal_unique (spec : ProbeSpec α) (source : Term)
    (firstTicks secondTicks : Nat) (firstState secondState : α) (firstCursor secondCursor : Cursor)
    (firstRun : run spec.machine firstTicks ⟨some spec.start, Cursor.atRoot source⟩ = ⟨some firstState, firstCursor⟩)
    (secondRun : run spec.machine secondTicks ⟨some spec.start, Cursor.atRoot source⟩ = ⟨some secondState, secondCursor⟩)
    (firstTerminal : (spec.answer firstState).isSome = true)
    (secondTerminal : (spec.answer secondState).isSome = true) :
    (⟨some firstState, firstCursor⟩ : Configuration α) = ⟨some secondState, secondCursor⟩ := by
  have common := congrArg (fun ticks => run spec.machine ticks ⟨some spec.start, Cursor.atRoot source⟩)
    (Nat.add_comm firstTicks secondTicks)

  rw [run_add, firstRun, probe_absorbs spec ⟨some firstState, firstCursor⟩ firstTerminal,
    run_add, secondRun, probe_absorbs spec ⟨some secondState, secondCursor⟩ secondTerminal] at common
  exact common

/-- Any proved successful selection is the exact endpoint of the advertised
fixed-budget invocation, including its literal contracted cursor. -/
theorem selected_final (spec : ProbeSpec α) (source : Term) (ticks : Nat) (state : α) (endpoint after : Cursor)
    (execution : run spec.machine ticks ⟨some spec.start, Cursor.atRoot source⟩ = ⟨some state, endpoint⟩)
    (answer : spec.answer state = some true) (contracted : endpoint.rdx? = some after) :
    final spec source = ⟨some (.tail (.euler .doneRedex)), after⟩ := by
  obtain ⟨boundedTicks, boundedState, boundedEndpoint, bounded, boundedRun, terminal, _, _⟩ := spec.all_input source
  have same := probe_terminal_unique spec source boundedTicks ticks boundedState state boundedEndpoint endpoint
    boundedRun execution terminal (by rw [answer]; rfl)
  have stateEq : boundedState = state := Option.some.inj (congrArg Configuration.control same)
  have cursorEq : boundedEndpoint = endpoint := congrArg Configuration.cursor same
  subst boundedState boundedEndpoint
  obtain ⟨used, usedBound, actual⟩ := probe_runs spec source boundedTicks state endpoint boundedRun terminal
  have paid := Nat.le_trans usedBound bounded
  have suffix : run (machine spec) 2 ⟨some (.probe state), endpoint⟩ =
      ⟨some (.tail (.euler .doneRedex)), after⟩ := by
    simp only [run, step, machine, transition, answer, mapCommand,
      Tail.machine, RootResetProgressEulerSelector.machine, RootResetProgressEulerSelector.transition,
      RootResetProgressEulerSelector.liftEulerCommand, RootResetEulerWalker.machine,
      RootResetEulerWalker.transition, Primitive.exec, contracted]
  have resultRun : run (machine spec) (used + 2) (initial spec source) =
      ⟨some (.tail (.euler .doneRedex)), after⟩ := by rw [run_add, actual, suffix]
  have runBound : used + 2 ≤ stoppingTime spec source :=
    combined_bound spec source used 2 paid (Nat.le_trans (by decide : 2 ≤ 31)
      (by simpa only [Nat.mul_one] using Nat.mul_le_mul_left 31 (Nat.succ_le_succ (Nat.zero_le source.size))))
  have absorbs : ∀ rest, run (machine spec) rest ⟨some (.tail (.euler .doneRedex)), after⟩ =
      ⟨some (.tail (.euler .doneRedex)), after⟩ := by
    intro rest
    induction rest with
    | zero => rfl
    | succ rest ih => exact ih
  have split := Nat.add_sub_of_le runBound
  unfold final
  rw [← split, run_add, resultRun, absorbs]

def selectStep? (spec : ProbeSpec α) (source : Term) : Option Term :=
  match (selectorContract spec).select source with
  | .nf _ => none
  | .redex _ target _ => some target

theorem selected_step (spec : ProbeSpec α) (source : Term) (ticks : Nat) (state : α) (endpoint after : Cursor)
    (execution : run spec.machine ticks ⟨some spec.start, Cursor.atRoot source⟩ = ⟨some state, endpoint⟩)
    (answer : spec.answer state = some true) (contracted : endpoint.rdx? = some after) :
    selectStep? spec source = some after.erase := by
  have reached := selected_final spec source ticks state endpoint after execution answer contracted
  have nonNormal : runtimeHaltKind haltKind (final spec source).control ≠ some .nf := by
    rw [reached]
    intro impossible
    cases impossible
  change (match outcome spec source with | .nf _ => none | .redex _ target _ => some target) = _
  unfold outcome
  rw [dif_neg nonNormal]
  change some (final spec source).cursor.erase = some after.erase
  rw [reached]

end PureSFormal.Research.RootResetReadonlySelector
