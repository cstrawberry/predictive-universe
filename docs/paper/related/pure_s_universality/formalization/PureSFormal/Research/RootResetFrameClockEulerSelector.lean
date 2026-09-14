import PureSFormal.Research.RootResetClockEulerBound
import PureSFormal.Research.RootResetFrameSpineProbe

/-!
# Bounded FRAME dispatch followed by clock/Euler selection

A 57-control read-only FRAME probe precedes the existing 137-control clock
selector. A successful probe contracts the recognized FRAME residual; a miss
restores the whole root before starting the clock/Euler component. The 194
allocated controls are distinct, and the concrete all-input selector contract
uses a fixed budget of 74 * (source.size + 1), with exactly one contraction on
non-normal inputs. Wrapped FRAME1/FRAME2 equations cover arbitrary pending
layers. Other simulator phases still require their own dispatch agreement.
-/
namespace PureSFormal.Research.RootResetFrameClockEulerSelector

open PureSFormal.PureS
open PureSFormal.PureS.FiniteController
open RootResetSelectorContract

namespace Frame
abbrev Control := RootResetFrameSpineProbe.Control
abbrev machine := RootResetFrameSpineProbe.machine
abbrev initial := RootResetFrameSpineProbe.initial
end Frame

namespace Clock
abbrev Control := RootResetClockEulerSelector.Control
abbrev machine := RootResetClockEulerSelector.machine
end Clock

inductive Control where
  | frame (state : Frame.Control)
  | clock (state : Clock.Control)
  deriving DecidableEq, Repr

def liftCommand {α : Type} (inject : α → Control) : Command α → Command Control
  | .stay next => .stay (inject next)
  | .exec primitive next => .exec primitive (inject next)
  | .reject => .reject

/-- A finite phase boundary; success needs no additional tree parser. -/
def handoff : Frame.Control → Option Clock.Control
  | .ready => some (.euler .contract)
  | .miss => some (.probe (.first .enter))
  | _ => none

def transition : Control → Probe.NodeKind → Probe.Incoming → Command Control
  | .frame state, node, incoming =>
      match handoff state with
      | some next => .stay (.clock next)
      | none => liftCommand .frame (Frame.machine.transition state node incoming)
  | .clock state, node, incoming =>
      liftCommand .clock (Clock.machine.transition state node incoming)

def states : List Control :=
  RootResetFrameSpineProbe.states.map .frame ++ RootResetClockEulerSelector.states.map .clock

private theorem map_mem_of_mem {α β : Type} (map : α → β) {item : α}
    {items : List α} (membership : item ∈ items) : map item ∈ items.map map := by
  induction membership with
  | head => exact List.Mem.head _
  | tail other _ ih => exact List.Mem.tail (map other) ih

theorem mem_states (state : Control) : state ∈ states := by
  cases state with
  | frame state =>
      exact List.mem_append.mpr (Or.inl
        (map_mem_of_mem Control.frame (RootResetFrameSpineProbe.mem_states state)))
  | clock state =>
      exact List.mem_append.mpr (Or.inr
        (map_mem_of_mem Control.clock (RootResetClockEulerSelector.mem_states state)))

def machine : Machine Control := ⟨fun _ => states, mem_states, transition⟩

set_option maxRecDepth 10000 in
theorem states_length : machine.states.length = 194 := rfl

set_option maxRecDepth 10000 in
set_option maxHeartbeats 1000000 in
theorem states_nodup : states.Nodup := by decide

def liftConfiguration {α : Type} (inject : α → Control)
    (configuration : Configuration α) : Configuration Control :=
  ⟨configuration.control.map inject, configuration.cursor⟩

def initial (source : Term) : Configuration Control :=
  ⟨some (.frame .down0), Cursor.atRoot source⟩

theorem step_liftClock (configuration : Configuration Clock.Control) :
    step machine (liftConfiguration .clock configuration) =
      liftConfiguration .clock (step Clock.machine configuration) := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => rfl
  | some state =>
      simp only [step, liftConfiguration, Option.map_some, machine, transition]
      generalize commandEq : Clock.machine.transition state
        (Probe.observeNode cursor) (Probe.observeIncoming cursor) = command
      cases command with
      | stay next => simp [liftCommand, commandEq]
      | reject => simp [liftCommand, commandEq]
      | exec primitive next =>
          cases moved : primitive.exec cursor <;> simp [liftCommand, moved, commandEq]

theorem run_liftClock (ticks : Nat) (configuration : Configuration Clock.Control) :
    run machine ticks (liftConfiguration .clock configuration) =
      liftConfiguration .clock (run Clock.machine ticks configuration) := by
  induction ticks generalizing configuration with
  | zero => rfl
  | succ ticks ih => rw [run_succ, step_liftClock, ih]; rfl

theorem mutationCount_liftClock (configuration : Configuration Clock.Control) :
    mutationCount machine (liftConfiguration .clock configuration) =
      mutationCount Clock.machine configuration := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => rfl
  | some state =>
      simp only [mutationCount, liftConfiguration, Option.map_some, machine, transition]
      generalize commandEq : Clock.machine.transition state
        (Probe.observeNode cursor) (Probe.observeIncoming cursor) = command
      cases command with
      | stay next => simp [liftCommand, commandEq]
      | reject => simp [liftCommand, commandEq]
      | exec primitive next => cases primitive <;> simp [liftCommand, commandEq]

theorem runMutationCount_liftClock (ticks : Nat) (configuration : Configuration Clock.Control) :
    runMutationCount machine ticks (liftConfiguration .clock configuration) =
      runMutationCount Clock.machine ticks configuration := by
  induction ticks generalizing configuration with
  | zero => rfl
  | succ ticks ih =>
      rw [runMutationCount, mutationCount_liftClock, step_liftClock, ih]
      rfl

theorem handoff_none (state : Frame.Control) (cursor : Cursor)
    (notTerminal : ¬ RootResetFrameSpineProbe.Terminal ⟨some state, cursor⟩) :
    handoff state = none := by
  cases state <;> simp_all [handoff, RootResetFrameSpineProbe.Terminal]

theorem step_liftProbe (configuration : Configuration Frame.Control)
    (notTerminal : ¬ RootResetFrameSpineProbe.Terminal configuration) :
    step machine (liftConfiguration .frame configuration) =
      liftConfiguration .frame (step Frame.machine configuration) := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => rfl
  | some state =>
      simp only [step, liftConfiguration, Option.map_some, machine, transition,
        handoff_none state cursor notTerminal]
      generalize commandEq : Frame.machine.transition state
        (Probe.observeNode cursor) (Probe.observeIncoming cursor) = command
      cases command with
      | stay next => simp [liftCommand, commandEq, handoff_none state cursor notTerminal]
      | reject => simp [liftCommand, commandEq, handoff_none state cursor notTerminal]
      | exec primitive next =>
          cases moved : primitive.exec cursor <;>
            simp [liftCommand, moved, commandEq, handoff_none state cursor notTerminal]

theorem mutationCount_probe (configuration : Configuration Frame.Control) :
    mutationCount machine (liftConfiguration .frame configuration) = 0 := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => rfl
  | some state =>
      simp only [mutationCount, liftConfiguration, Option.map_some, machine, transition]
      cases boundary : handoff state with
      | some next => simp [boundary]
      | none =>
          have zero := RootResetFrameSpineProbe.mutationCount_zero ⟨some state, cursor⟩
          dsimp only [mutationCount] at zero
          generalize commandEq : Frame.machine.transition state
            (Probe.observeNode cursor) (Probe.observeIncoming cursor) = command at zero ⊢
          cases command with
          | stay next => simp [boundary, liftCommand, commandEq]
          | reject => simp [boundary, liftCommand, commandEq]
          | exec primitive next =>
              cases primitive with
              | L => simp [boundary, liftCommand, commandEq]
              | R => simp [boundary, liftCommand, commandEq]
              | U => simp [boundary, liftCommand, commandEq]
              | Rdx => simpa [boundary, liftCommand, commandEq] using zero

/-- Finite execution reaches its first ordinary probe boundary without mutation. -/
local instance terminal_decidable (configuration : Configuration Frame.Control) :
    Decidable (RootResetFrameSpineProbe.Terminal configuration) := by
  unfold RootResetFrameSpineProbe.Terminal
  infer_instance

theorem reaches_boundary (ticks : Nat) (origin : Configuration Frame.Control)
    (finished : RootResetFrameSpineProbe.Terminal (run Frame.machine ticks origin)) :
    ∃ count, count ≤ ticks ∧
      RootResetFrameSpineProbe.Terminal (run Frame.machine count origin) ∧
      run machine count (liftConfiguration .frame origin) =
        liftConfiguration .frame (run Frame.machine count origin) ∧
      runMutationCount machine count (liftConfiguration .frame origin) = 0 := by
  induction ticks generalizing origin with
  | zero => exact ⟨0, Nat.le_refl _, finished, rfl, rfl⟩
  | succ ticks ih =>
      by_cases terminal : RootResetFrameSpineProbe.Terminal origin
      · exact ⟨0, Nat.zero_le _, terminal, rfl, rfl⟩
      · obtain ⟨count, bound, terminal, execution, mutations⟩ :=
          ih (step Frame.machine origin) finished
        refine ⟨count + 1, Nat.succ_le_succ bound, terminal, ?_, ?_⟩
        · rw [run_succ, step_liftProbe origin ‹_›, execution]; rfl
        · rw [runMutationCount, mutationCount_probe, step_liftProbe origin ‹_›,
            mutations, Nat.zero_add]


def Result (source : Term) (ticks : Nat) (final : Configuration Control) : Prop :=
  (final.control = some (.clock (.euler .doneNF)) ∧ AddressNormal source ∧
    final.cursor.erase = source ∧ runMutationCount machine ticks (initial source) = 0) ∨
  (final.control = some (.clock (.euler .doneRedex)) ∧
    source.contractAt? (cursorAddress final.cursor) = some final.cursor.erase ∧
    runMutationCount machine ticks (initial source) = 1)

theorem success_suffix (first second third : Term) (parents : List ParentFrame) :
    run machine 2 ⟨some (.frame .ready), ⟨Term.redex first second third, parents⟩⟩ =
      ⟨some (.clock (.euler .doneRedex)), ⟨Term.contractum first second third, parents⟩⟩ := by
  simp [run, step, machine, transition, handoff, liftCommand,
    Clock.machine, RootResetClockEulerSelector.machine, RootResetClockEulerSelector.transition,
    RootResetClockEulerSelector.liftCommand,
    RootResetEulerWalker.machine, RootResetEulerWalker.transition,
    Primitive.exec, Cursor.rdx?, Term.contractRoot?_redex]

theorem success_suffix_mutations (first second third : Term) (parents : List ParentFrame) :
    runMutationCount machine 2 ⟨some (.frame .ready), ⟨Term.redex first second third, parents⟩⟩ = 1 := by
  simp [runMutationCount, mutationCount, step, machine, transition, handoff, liftCommand,
    Clock.machine, RootResetClockEulerSelector.machine, RootResetClockEulerSelector.transition,
    RootResetClockEulerSelector.liftCommand,
    RootResetEulerWalker.machine, RootResetEulerWalker.transition,
    Primitive.exec, Cursor.rdx?, Term.contractRoot?_redex]

abbrev clockTime := RootResetClockEulerBound.Composed.stoppingTime
abbrev clockFinal := RootResetClockEulerBound.Composed.final

theorem failure_suffix (source : Term) :
    run machine (1 + clockTime source) ⟨some (.frame .miss), Cursor.atRoot source⟩ =
      liftConfiguration .clock (clockFinal source) := by
  rw [run_add]
  change run machine (clockTime source)
    (liftConfiguration .clock (RootResetClockEulerSelector.initial source)) = _
  rw [run_liftClock]
  rfl

theorem failure_suffix_mutations (source : Term) :
    runMutationCount machine (1 + clockTime source) ⟨some (.frame .miss), Cursor.atRoot source⟩ =
      runMutationCount Clock.machine (clockTime source) (RootResetClockEulerSelector.initial source) := by
  rw [runMutationCount_add]
  have zero : runMutationCount machine 1 ⟨some (.frame .miss), Cursor.atRoot source⟩ = 0 := rfl
  rw [zero, Nat.zero_add]
  change runMutationCount machine (clockTime source)
    (liftConfiguration .clock (RootResetClockEulerSelector.initial source)) = _
  rw [runMutationCount_liftClock]

theorem success_budget (size ticks : Nat) (bound : ticks ≤ 40 * size) :
    ticks + 2 ≤ 74 * (size + 1) := by
  apply Nat.le_trans (Nat.add_le_add_right bound 2)
  apply Nat.le.intro (k := 34 * size + 72)
  calc
    40 * size + 2 + (34 * size + 72) = (40 * size + 34 * size) + 74 := by
      simp only [Nat.add_assoc, Nat.add_left_comm, Nat.add_comm]
      simp only [Nat.succ_add, Nat.add_succ, Nat.zero_add, Nat.add_zero]
    _ = 74 * size + 74 := by rw [← Nat.add_mul]
    _ = 74 * (size + 1) := by rw [Nat.mul_add, Nat.mul_one]

theorem failure_budget (size ticks : Nat) (bound : ticks ≤ 40 * size) :
    ticks + (1 + 34 * (size + 1)) ≤ 74 * (size + 1) := by
  apply Nat.le_trans (Nat.add_le_add_right bound (1 + 34 * (size + 1)))
  apply Nat.le.intro (k := 39)
  calc
    40 * size + (1 + 34 * (size + 1)) + 39 = (40 * size + 34 * size) + 74 := by
      simp only [Nat.mul_add, Nat.mul_one, Nat.add_assoc, Nat.add_left_comm, Nat.add_comm]
      simp only [Nat.succ_add, Nat.add_succ, Nat.zero_add, Nat.add_zero]
    _ = 74 * size + 74 := by rw [← Nat.add_mul]
    _ = 74 * (size + 1) := by rw [Nat.mul_add, Nat.mul_one]

theorem invocation_within (source : Term) :
    ∃ ticks final, ticks ≤ 74 * (source.size + 1) ∧ run machine ticks (initial source) = final ∧
      Result source ticks final := by
  obtain ⟨doneTicks, done, doneBound, execution, answer⟩ := RootResetFrameSpineProbe.probe_within source
  have completed : RootResetFrameSpineProbe.Terminal (run Frame.machine doneTicks (Frame.initial source)) := by
    rw [execution]; exact answer.terminal
  obtain ⟨ticks, tickBound, terminal, prefixRun, prefixMutations⟩ :=
    reaches_boundary doneTicks (Frame.initial source) completed
  let after := run Frame.machine ticks (Frame.initial source)
  have afterAnswer : RootResetFrameSpineProbe.Answer (Cursor.atRoot source) after :=
    RootResetFrameSpineProbe.terminal_answer source ticks terminal
  have prefixExecution : run machine ticks (initial source) = liftConfiguration .frame after := prefixRun
  have prefixZero : runMutationCount machine ticks (initial source) = 0 := prefixMutations
  rcases afterAnswer with ⟨accepted, first, second, third, focusEq⟩ | ⟨missed, restored⟩
  · have afterEq : liftConfiguration .frame after =
        ⟨some (.frame .ready), ⟨Term.redex first second third, after.cursor.parents⟩⟩ := by
      rcases after with ⟨control, ⟨focus, parents⟩⟩
      simp_all [liftConfiguration]
    let final : Configuration Control :=
      ⟨some (.clock (.euler .doneRedex)), ⟨Term.contractum first second third, after.cursor.parents⟩⟩
    refine ⟨ticks + 2, final, success_budget source.size ticks (Nat.le_trans tickBound doneBound),
      ?_, Or.inr ⟨rfl, ?_, ?_⟩⟩
    · rw [run_add, prefixExecution, afterEq, success_suffix]
    · have preserved : after.cursor.erase = source := RootResetFrameSpineProbe.erase_run ticks (Frame.initial source)
      have contracts := contractAt?_cursorAddress after.cursor
      rw [focusEq, Term.contractRoot?_redex, preserved] at contracts
      exact contracts
    · rw [runMutationCount_add, prefixZero, prefixExecution, afterEq,
        success_suffix_mutations, Nat.zero_add]
  · have afterEq : liftConfiguration .frame after = ⟨some (.frame .miss), Cursor.atRoot source⟩ := by
      simp [liftConfiguration, missed, restored]
    let suffix := 1 + clockTime source
    let final := liftConfiguration .clock (clockFinal source)
    have countEq : runMutationCount machine (ticks + suffix) (initial source) =
        runMutationCount Clock.machine (clockTime source) (RootResetClockEulerSelector.initial source) := by
      rw [runMutationCount_add, prefixZero, prefixExecution, afterEq, Nat.zero_add]
      exact failure_suffix_mutations source
    refine ⟨ticks + suffix, final,
      failure_budget source.size ticks (Nat.le_trans tickBound doneBound), ?_, ?_⟩
    · rw [run_add, prefixExecution, afterEq]; exact failure_suffix source
    · rcases RootResetClockEulerBound.Composed.final_certificate source with
        ⟨normal, normalProof, preserved, mutations⟩ | ⟨redex, contracts, mutations⟩
      · exact Or.inl ⟨congrArg (Option.map Control.clock) normal, normalProof, preserved, countEq.trans mutations⟩
      · exact Or.inr ⟨congrArg (Option.map Control.clock) redex, contracts, countEq.trans mutations⟩

abbrev composedMachine := RootResetFrameClockEulerSelector.machine
abbrev composedInitial := RootResetFrameClockEulerSelector.initial
abbrev ComposedControl := RootResetFrameClockEulerSelector.Control

def haltKind : ComposedControl → Option HaltKind
  | .clock (.euler .doneNF) => some .nf
  | .clock (.euler .doneRedex) => some .redex
  | _ => none

theorem terminal_absorbing (state : ComposedControl) (node : Probe.NodeKind)
    (incoming : Probe.Incoming) (halted : (haltKind state).isSome = true) :
    composedMachine.transition state node incoming = .stay state := by
  cases state with
  | frame state => cases halted
  | clock state =>
      cases state with
      | probe state => cases halted
      | euler state => cases state <;> first | rfl | cases halted

theorem terminal_run (ticks : Nat) (configuration : Configuration ComposedControl)
    (terminal : configuration.control = some (.clock (.euler .doneNF)) ∨
      configuration.control = some (.clock (.euler .doneRedex))) :
    run composedMachine ticks configuration = configuration := by
  rcases configuration with ⟨control, cursor⟩
  rcases terminal with h | h <;> change control = _ at h <;> subst control <;>
    induction ticks with
    | zero => rfl
    | succ ticks ih => exact ih

theorem terminal_mutations (ticks : Nat) (configuration : Configuration ComposedControl)
    (terminal : configuration.control = some (.clock (.euler .doneNF)) ∨
      configuration.control = some (.clock (.euler .doneRedex))) :
    runMutationCount composedMachine ticks configuration = 0 := by
  rcases configuration with ⟨control, cursor⟩
  rcases terminal with h | h <;> change control = _ at h <;> subst control <;>
    induction ticks with
    | zero => rfl
    | succ ticks ih => change 0 + _ = 0; rw [Nat.zero_add]; exact ih

def stoppingTime (source : Term) : Nat := 74 * (source.size + 1)
def final (source : Term) : Configuration ComposedControl :=
  run composedMachine (stoppingTime source) (composedInitial source)

theorem final_certificate (source : Term) : Result source (stoppingTime source) (final source) := by
  obtain ⟨ticks, after, bound, execution, result⟩ := invocation_within source
  obtain ⟨extra, budgetEq⟩ := Nat.exists_eq_add_of_le bound
  have terminal : after.control = some (.clock (.euler .doneNF)) ∨
      after.control = some (.clock (.euler .doneRedex)) := by
    rcases result with h | h
    · exact Or.inl h.1
    · exact Or.inr h.1
  have finalEq : final source = after := by
    unfold final stoppingTime
    rw [budgetEq, run_add, execution, terminal_run extra after terminal]
  rw [finalEq]
  have countEq : runMutationCount composedMachine (stoppingTime source) (composedInitial source) =
      runMutationCount composedMachine ticks (composedInitial source) := by
    unfold stoppingTime
    rw [budgetEq, runMutationCount_add, execution, terminal_mutations extra after terminal,
      Nat.add_zero]
  rcases result with ⟨normal, normalProof, preserved, mutations⟩ | ⟨redex, contracts, mutations⟩
  · exact Or.inl ⟨normal, normalProof, preserved, countEq.trans mutations⟩
  · exact Or.inr ⟨redex, contracts, countEq.trans mutations⟩

theorem final_terminal (source : Term) :
    (final source).control = some (.clock (.euler .doneNF)) ∨
      (final source).control = some (.clock (.euler .doneRedex)) := by
  rcases final_certificate source with h | h
  · exact Or.inl h.1
  · exact Or.inr h.1

theorem final_nf (source : Term) (halted : (final source).control = some (.clock (.euler .doneNF))) :
    AddressNormal source ∧ (final source).cursor.erase = source ∧
      runMutationCount composedMachine (stoppingTime source) (composedInitial source) = 0 := by
  rcases final_certificate source with h | h
  · exact h.2
  · rw [halted] at h
    cases Option.some.inj h.1

theorem final_redex (source : Term)
    (halted : (final source).control = some (.clock (.euler .doneRedex))) :
    source.contractAt? (cursorAddress (final source).cursor) = some (final source).cursor.erase ∧
      runMutationCount composedMachine (stoppingTime source) (composedInitial source) = 1 := by
  rcases final_certificate source with h | h
  · rw [halted] at h
    cases Option.some.inj h.1
  · exact h.2

def outcome (source : Term) : Outcome source :=
  if halted : (final source).control = some (.clock (.euler .doneNF)) then
    .nf (final_nf source halted).1
  else
    have redexHalt : (final source).control = some (.clock (.euler .doneRedex)) := by
      rcases final_terminal source with normal | redex
      · exact False.elim (halted normal)
      · exact redex
    .redex (cursorAddress (final source).cursor) (final source).cursor.erase
      (final_redex source redexHalt).1

theorem outcome_agrees (source : Term) :
    match outcome source with
    | .nf _ => runtimeHaltKind haltKind (final source).control = some .nf ∧
        (final source).cursor.erase = source
    | .redex address target _ => runtimeHaltKind haltKind (final source).control = some .redex ∧
        cursorAddress (final source).cursor = address ∧ (final source).cursor.erase = target := by
  by_cases halted : (final source).control = some (.clock (.euler .doneNF))
  · simp only [outcome, halted, dite_true]
    exact ⟨by simp [runtimeHaltKind, haltKind, halted], (final_nf source halted).2.1⟩
  · have redexHalt : (final source).control = some (.clock (.euler .doneRedex)) := by
      rcases final_terminal source with normal | redex
      · exact False.elim (halted normal)
      · exact redex
    simp only [outcome, halted, dite_false]
    simp [runtimeHaltKind, haltKind, redexHalt]

theorem outcome_mutations (source : Term) :
    match outcome source with
    | .nf _ => runMutationCount composedMachine (stoppingTime source) (composedInitial source) = 0
    | .redex _ _ _ =>
        runMutationCount composedMachine (stoppingTime source) (composedInitial source) = 1 := by
  by_cases halted : (final source).control = some (.clock (.euler .doneNF))
  · simp only [outcome, halted, dite_true]
    exact (final_nf source halted).2.2
  · have redexHalt : (final source).control = some (.clock (.euler .doneRedex)) := by
      rcases final_terminal source with normal | redex
      · exact False.elim (halted normal)
      · exact redex
    simp only [outcome, halted, dite_false]
    exact (final_redex source redexHalt).2

def selectorContract : RootResetSelectorContract.Contract where
  Control := ComposedControl
  machine := composedMachine
  start := .frame .down0
  haltKind := haltKind
  coefficient := 74
  coefficient_pos := by decide
  stoppingTime := stoppingTime
  outcome := outcome
  stoppingTime_le := fun _ => Nat.le_refl _
  terminal := by
    intro source
    change (runtimeHaltKind haltKind (final source).control).isSome = true
    rcases final_terminal source with h | h <;> simp [runtimeHaltKind, haltKind, h]
  terminal_absorbing := terminal_absorbing
  outcome_agrees := outcome_agrees
  mutationCount_agrees := outcome_mutations



theorem probe_success_simulated (source : Term) (probeTicks : Nat)
    (first second third : Term) (parents : List ParentFrame)
    (execution : run Frame.machine probeTicks (Frame.initial source) =
      ⟨some .ready, ⟨Term.redex first second third, parents⟩⟩) :
    ∃ ticks, run machine ticks (initial source) =
      ⟨some (.clock (.euler .doneRedex)), ⟨Term.contractum first second third, parents⟩⟩ := by
  have completed : RootResetFrameSpineProbe.Terminal (run Frame.machine probeTicks (Frame.initial source)) := by
    rw [execution]; exact Or.inl rfl
  obtain ⟨ticks, _, firstTerminal, prefixRun, _⟩ :=
    reaches_boundary probeTicks (Frame.initial source) completed
  have commute := congrArg (fun count => run Frame.machine count (Frame.initial source))
    (Nat.add_comm ticks probeTicks)
  rw [run_add Frame.machine ticks probeTicks,
    RootResetFrameSpineProbe.run_terminal probeTicks _ firstTerminal,
    run_add Frame.machine probeTicks ticks,
    RootResetFrameSpineProbe.run_terminal ticks _ completed, execution] at commute
  have prefixExecution : run machine ticks (initial source) =
      ⟨some (.frame .ready), ⟨Term.redex first second third, parents⟩⟩ := by
    rw [commute] at prefixRun; exact prefixRun
  refine ⟨ticks + 2, ?_⟩
  rw [run_add, prefixExecution, success_suffix]

theorem final_of_terminal_run (source : Term) (ticks : Nat) (configuration : Configuration Control)
    (execution : run machine ticks (initial source) = configuration)
    (terminal : configuration.control = some (.clock (.euler .doneNF)) ∨
      configuration.control = some (.clock (.euler .doneRedex))) : final source = configuration := by
  have commute := congrArg (fun count => run machine count (initial source))
    (Nat.add_comm (stoppingTime source) ticks)
  rw [run_add machine (stoppingTime source) ticks] at commute
  change run machine ticks (final source) = _ at commute
  rw [terminal_run ticks _ (final_terminal source),
    run_add machine ticks (stoppingTime source), execution,
    terminal_run (stoppingTime source) _ terminal] at commute
  exact commute

theorem generated_first (layers : List RootResetFrameSpineWalker.Layer) (actions : Term)
    (bits : List Bool) (continuation carrier : Term) :
    final (RootResetFrameSpineWalker.wrap layers
      (SchedulerResponseInvariant.frameFirstRoot actions bits continuation carrier)) =
      ⟨some (.clock (.euler .doneRedex)),
        ⟨Term.contractum (actCode actions) (seedCode bits) carrier,
          .left (.app continuation carrier) :: RootResetFrameSpineWalker.spineParents layers []⟩⟩ := by
  obtain ⟨ticks, execution⟩ := probe_success_simulated _ (7 * layers.length + 31) _ _ _ _
    (RootResetFrameSpineProbe.run_wrapped_first layers actions bits continuation carrier)
  exact final_of_terminal_run _ ticks _ execution (Or.inr rfl)

theorem generated_second (layers : List RootResetFrameSpineWalker.Layer) (actions : Term)
    (bits : List Bool) (continuation carrier : Term) :
    final (RootResetFrameSpineWalker.wrap layers
      (SchedulerResponseInvariant.frameSecondRoot actions bits continuation carrier)) =
      ⟨some (.clock (.euler .doneRedex)),
        ⟨Term.contractum haltCode actions carrier,
          .left (.app (seedCode bits) carrier) :: .left (.app continuation carrier) ::
            RootResetFrameSpineWalker.spineParents layers []⟩⟩ := by
  obtain ⟨ticks, execution⟩ := probe_success_simulated _ (7 * layers.length + 27) _ _ _ _
    (RootResetFrameSpineProbe.run_wrapped_second layers actions bits continuation carrier)
  exact final_of_terminal_run _ ticks _ execution (Or.inr rfl)

theorem generated_first_erase (layers : List RootResetFrameSpineWalker.Layer) (actions : Term)
    (bits : List Bool) (continuation carrier : Term) :
    (final (RootResetFrameSpineWalker.wrap layers
      (SchedulerResponseInvariant.frameFirstRoot actions bits continuation carrier))).cursor.erase =
      RootResetFrameSpineWalker.wrap layers
        (SchedulerResponseInvariant.frameSecondRoot actions bits continuation carrier) := by
  rw [generated_first]
  change Cursor.rebuild (RootResetFrameSpineWalker.spineParents layers [])
    (SchedulerResponseInvariant.frameSecondRoot actions bits continuation carrier) = _
  rw [RootResetFrameSpineWalker.rebuild_spineParents]
  rfl

theorem generated_second_erase (layers : List RootResetFrameSpineWalker.Layer) (actions : Term)
    (bits : List Bool) (continuation carrier : Term) :
    (final (RootResetFrameSpineWalker.wrap layers
      (SchedulerResponseInvariant.frameSecondRoot actions bits continuation carrier))).cursor.erase =
      RootResetFrameSpineWalker.wrap layers (freshLocal actions bits continuation carrier) := by
  rw [generated_second]
  change Cursor.rebuild (RootResetFrameSpineWalker.spineParents layers [])
    (freshLocal actions bits continuation carrier) = _
  rw [RootResetFrameSpineWalker.rebuild_spineParents]
  rfl

theorem probe_miss_simulated (source : Term) (probeTicks : Nat)
    (execution : run Frame.machine probeTicks (Frame.initial source) =
      ⟨some .miss, Cursor.atRoot source⟩) :
    ∃ ticks, run machine ticks (initial source) = liftConfiguration .clock (clockFinal source) := by
  have completed : RootResetFrameSpineProbe.Terminal (run Frame.machine probeTicks (Frame.initial source)) := by
    rw [execution]; exact Or.inr rfl
  obtain ⟨ticks, _, firstTerminal, prefixRun, _⟩ :=
    reaches_boundary probeTicks (Frame.initial source) completed
  have commute := congrArg (fun count => run Frame.machine count (Frame.initial source))
    (Nat.add_comm ticks probeTicks)
  rw [run_add Frame.machine ticks probeTicks,
    RootResetFrameSpineProbe.run_terminal probeTicks _ firstTerminal,
    run_add Frame.machine probeTicks ticks,
    RootResetFrameSpineProbe.run_terminal ticks _ completed, execution] at commute
  have prefixExecution : run machine ticks (initial source) = ⟨some (.frame .miss), Cursor.atRoot source⟩ := by
    rw [commute] at prefixRun; exact prefixRun
  refine ⟨ticks + (1 + clockTime source), ?_⟩
  rw [run_add, prefixExecution, failure_suffix]

theorem miss_inherits_clock (source : Term)
    (missed : ∃ ticks, run Frame.machine ticks (Frame.initial source) = ⟨some .miss, Cursor.atRoot source⟩) :
    final source = liftConfiguration .clock (clockFinal source) := by
  obtain ⟨probeTicks, execution⟩ := missed
  obtain ⟨ticks, execution⟩ := probe_miss_simulated source probeTicks execution
  apply final_of_terminal_run source ticks _ execution
  rcases RootResetClockEulerBound.Composed.final_terminal source with h | h
  · exact Or.inl (congrArg (Option.map Control.clock) h)
  · exact Or.inr (congrArg (Option.map Control.clock) h)

end PureSFormal.Research.RootResetFrameClockEulerSelector



