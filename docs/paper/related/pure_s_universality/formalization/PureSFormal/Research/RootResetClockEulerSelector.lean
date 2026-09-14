import PureSFormal.Research.RootResetClockParityTotality
import PureSFormal.Research.RootResetEulerWalker

/-!
# A finite clock-choice controller with complete Euler fallback

The 122-state clock parity probe is followed by a literal 15-state Euler
controller. A certified clock success enters the Euler contraction row;
an ordinary miss enters its root search row. The transition table uses no
runtime fuel, recursive selector, stored address, or external phase flag.

All-input completion and exact zero/one mutation are proved below. This
module proves neither a linear time bound for this composition nor agreement
of its clock-first priority with complete simulation traces.
-/

namespace PureSFormal.Research.RootResetClockEulerSelector

open PureSFormal.PureS
open PureSFormal.PureS.FiniteController
open RootResetSelectorContract

namespace Parity
abbrev Control := RootResetClockParityWalker.Control
abbrev machine := RootResetClockParityWalker.machine
abbrev initial := RootResetClockParityWalker.initial
end Parity

namespace Euler
abbrev Control := RootResetEulerWalker.Control
abbrev machine := RootResetEulerWalker.machine
end Euler

inductive Control where
  | probe (state : Parity.Control)
  | euler (state : Euler.Control)
  deriving DecidableEq, Repr

def liftCommand {α : Type} (inject : α → Control) : Command α → Command Control
  | .stay next => .stay (inject next)
  | .exec primitive next => .exec primitive (inject next)
  | .reject => .reject

/-- A finite phase boundary; success needs no additional tree parser. -/
def handoff : Parity.Control → Option Euler.Control
  | .growth .zero | .growth .positive | .launch => some .contract
  | .growth .miss | .miss => some .visit
  | _ => none

def transition : Control → Probe.NodeKind → Probe.Incoming → Command Control
  | .probe state, node, incoming =>
      match handoff state with
      | some next => .stay (.euler next)
      | none => liftCommand .probe (Parity.machine.transition state node incoming)
  | .euler state, node, incoming =>
      liftCommand .euler (Euler.machine.transition state node incoming)

def states : List Control :=
  RootResetClockParityWalker.states.map .probe ++ RootResetEulerWalker.states.map .euler

private theorem map_mem_of_mem {α β : Type} (map : α → β) {item : α}
    {items : List α} (membership : item ∈ items) : map item ∈ items.map map := by
  induction membership with
  | head => exact List.Mem.head _
  | tail other _ ih => exact List.Mem.tail (map other) ih

theorem mem_states (state : Control) : state ∈ states := by
  cases state with
  | probe state =>
      exact List.mem_append.mpr (Or.inl
        (map_mem_of_mem Control.probe (RootResetClockParityWalker.mem_states state)))
  | euler state =>
      exact List.mem_append.mpr (Or.inr
        (map_mem_of_mem Control.euler (RootResetEulerWalker.mem_states state)))

def machine : Machine Control := ⟨fun _ => states, mem_states, transition⟩

set_option maxRecDepth 10000 in
theorem states_length : machine.states.length = 137 := rfl

set_option maxRecDepth 10000 in
set_option maxHeartbeats 1000000 in
theorem states_nodup : states.Nodup := by decide

def liftConfiguration {α : Type} (inject : α → Control)
    (configuration : Configuration α) : Configuration Control :=
  ⟨configuration.control.map inject, configuration.cursor⟩

def initial (source : Term) : Configuration Control :=
  ⟨some (.probe (.first .enter)), Cursor.atRoot source⟩

theorem step_liftEuler (configuration : Configuration Euler.Control) :
    step machine (liftConfiguration .euler configuration) =
      liftConfiguration .euler (step Euler.machine configuration) := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => rfl
  | some state =>
      simp only [step, liftConfiguration, Option.map_some, machine, transition]
      generalize commandEq : Euler.machine.transition state
        (Probe.observeNode cursor) (Probe.observeIncoming cursor) = command
      cases command with
      | stay next => simp [liftCommand, commandEq]
      | reject => simp [liftCommand, commandEq]
      | exec primitive next =>
          cases moved : primitive.exec cursor <;> simp [liftCommand, moved, commandEq]

theorem run_liftEuler (ticks : Nat) (configuration : Configuration Euler.Control) :
    run machine ticks (liftConfiguration .euler configuration) =
      liftConfiguration .euler (run Euler.machine ticks configuration) := by
  induction ticks generalizing configuration with
  | zero => rfl
  | succ ticks ih => rw [run_succ, step_liftEuler, ih]; rfl

theorem mutationCount_liftEuler (configuration : Configuration Euler.Control) :
    mutationCount machine (liftConfiguration .euler configuration) =
      mutationCount Euler.machine configuration := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => rfl
  | some state =>
      simp only [mutationCount, liftConfiguration, Option.map_some, machine, transition]
      generalize commandEq : Euler.machine.transition state
        (Probe.observeNode cursor) (Probe.observeIncoming cursor) = command
      cases command with
      | stay next => simp [liftCommand, commandEq]
      | reject => simp [liftCommand, commandEq]
      | exec primitive next => cases primitive <;> simp [liftCommand, commandEq]

theorem runMutationCount_liftEuler (ticks : Nat) (configuration : Configuration Euler.Control) :
    runMutationCount machine ticks (liftConfiguration .euler configuration) =
      runMutationCount Euler.machine ticks configuration := by
  induction ticks generalizing configuration with
  | zero => rfl
  | succ ticks ih =>
      rw [runMutationCount, mutationCount_liftEuler, step_liftEuler, ih]
      rfl

theorem handoff_none (state : Parity.Control) (cursor : Cursor)
    (notTerminal : ¬ RootResetClockParityTotality.Terminal ⟨some state, cursor⟩) :
    handoff state = none := by
  cases state with
  | growth stage =>
      cases stage <;> simp_all [handoff, RootResetClockParityTotality.Terminal]
  | launch => exact False.elim (notTerminal (Or.inr (Or.inr (Or.inr (Or.inl rfl)))))
  | miss => exact False.elim (notTerminal (Or.inr (Or.inr (Or.inr (Or.inr rfl)))))
  | work stage pass bit => rfl
  | done pass bit => rfl
  | first stage => rfl
  | find stage bit => rfl
  | restartGrowth => rfl
  | abort => rfl

theorem step_liftProbe (configuration : Configuration Parity.Control)
    (notTerminal : ¬ RootResetClockParityTotality.Terminal configuration) :
    step machine (liftConfiguration .probe configuration) =
      liftConfiguration .probe (step Parity.machine configuration) := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => rfl
  | some state =>
      simp only [step, liftConfiguration, Option.map_some, machine, transition,
        handoff_none state cursor notTerminal]
      generalize commandEq : Parity.machine.transition state
        (Probe.observeNode cursor) (Probe.observeIncoming cursor) = command
      cases command with
      | stay next => simp [liftCommand, commandEq, handoff_none state cursor notTerminal]
      | reject => simp [liftCommand, commandEq, handoff_none state cursor notTerminal]
      | exec primitive next =>
          cases moved : primitive.exec cursor <;>
            simp [liftCommand, moved, commandEq, handoff_none state cursor notTerminal]

theorem mutationCount_probe (configuration : Configuration Parity.Control) :
    mutationCount machine (liftConfiguration .probe configuration) = 0 := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => rfl
  | some state =>
      simp only [mutationCount, liftConfiguration, Option.map_some, machine, transition]
      cases boundary : handoff state with
      | some next => simp [boundary]
      | none =>
          have zero := RootResetClockParityWalker.mutationCount_zero ⟨some state, cursor⟩
          dsimp only [mutationCount] at zero
          generalize commandEq : Parity.machine.transition state
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
local instance terminal_decidable (configuration : Configuration Parity.Control) :
    Decidable (RootResetClockParityTotality.Terminal configuration) := by
  unfold RootResetClockParityTotality.Terminal
  infer_instance

theorem reaches_boundary (ticks : Nat) (origin : Configuration Parity.Control)
    (finished : RootResetClockParityTotality.Terminal (run Parity.machine ticks origin)) :
    ∃ count,
      RootResetClockParityTotality.Terminal (run Parity.machine count origin) ∧
      run machine count (liftConfiguration .probe origin) =
        liftConfiguration .probe (run Parity.machine count origin) ∧
      runMutationCount machine count (liftConfiguration .probe origin) = 0 := by
  induction ticks generalizing origin with
  | zero => exact ⟨0, finished, rfl, rfl⟩
  | succ ticks ih =>
      by_cases terminal : RootResetClockParityTotality.Terminal origin
      · exact ⟨0, terminal, rfl, rfl⟩
      · obtain ⟨count, terminal, execution, mutations⟩ :=
          ih (step Parity.machine origin) finished
        refine ⟨count + 1, terminal, ?_, ?_⟩
        · rw [run_succ, step_liftProbe origin ‹_›, execution]
          rfl
        · rw [runMutationCount, mutationCount_probe, step_liftProbe origin ‹_›,
            mutations, Nat.zero_add]

/-- A completed invocation carries its exact normal-form or address-contraction equation. -/
def Result (source : Term) (ticks : Nat) (final : Configuration Control) : Prop :=
  (final.control = some (.euler .doneNF) ∧ AddressNormal source ∧
    final.cursor.erase = source ∧ runMutationCount machine ticks (initial source) = 0) ∨
  (final.control = some (.euler .doneRedex) ∧
    source.contractAt? (cursorAddress final.cursor) = some final.cursor.erase ∧
    runMutationCount machine ticks (initial source) = 1)

theorem success_suffix (state : Parity.Control) (boundary : handoff state = some .contract)
    (first second third : Term) (parents : List ParentFrame) :
    run machine 2 ⟨some (.probe state), ⟨Term.redex first second third, parents⟩⟩ =
      ⟨some (.euler .doneRedex), ⟨Term.contractum first second third, parents⟩⟩ := by
  simp [run, step, machine, transition, boundary, liftCommand,
    Euler.machine, RootResetEulerWalker.machine, RootResetEulerWalker.transition,
    Primitive.exec, Cursor.rdx?, Term.contractRoot?_redex]

theorem success_suffix_mutations (state : Parity.Control)
    (boundary : handoff state = some .contract)
    (first second third : Term) (parents : List ParentFrame) :
    runMutationCount machine 2
      ⟨some (.probe state), ⟨Term.redex first second third, parents⟩⟩ = 1 := by
  simp [runMutationCount, mutationCount, step, machine, transition, boundary, liftCommand,
    Euler.machine, RootResetEulerWalker.machine, RootResetEulerWalker.transition,
    Primitive.exec, Cursor.rdx?, Term.contractRoot?_redex]

theorem failure_suffix (state : Parity.Control) (boundary : handoff state = some .visit)
    (source : Term) :
    run machine (1 + (RootResetEulerWalker.rootExecution source).ticks)
      ⟨some (.probe state), Cursor.atRoot source⟩ =
      liftConfiguration .euler (RootResetEulerWalker.rootExecution source).final := by
  rw [run_add]
  have start : run machine 1 ⟨some (.probe state), Cursor.atRoot source⟩ =
      liftConfiguration .euler (RootResetEulerWalker.initial source) := by
    simp [run, step, machine, transition, boundary, liftConfiguration,
      RootResetEulerWalker.initial]
  rw [start, run_liftEuler, RootResetEulerWalker.run_rootExecution_eq]

theorem failure_suffix_mutations (state : Parity.Control)
    (boundary : handoff state = some .visit) (source : Term) :
    runMutationCount machine (1 + (RootResetEulerWalker.rootExecution source).ticks)
      ⟨some (.probe state), Cursor.atRoot source⟩ =
      RootResetEulerWalker.terminalMutationCount
        (RootResetEulerWalker.rootExecution source).final.control := by
  rw [runMutationCount_add]
  have start : run machine 1 ⟨some (.probe state), Cursor.atRoot source⟩ =
      liftConfiguration .euler (RootResetEulerWalker.initial source) := by
    simp [run, step, machine, transition, boundary, liftConfiguration,
      RootResetEulerWalker.initial]
  have zero : runMutationCount machine 1
      ⟨some (.probe state), Cursor.atRoot source⟩ = 0 := by
    simp [runMutationCount, mutationCount, machine, transition, boundary]
  rw [zero, start, Nat.zero_add, runMutationCount_liftEuler,
    RootResetEulerWalker.rootExecution_runMutationCount]

/-- Every bare term reaches a truthful normal-form halt or exactly one contraction. -/
theorem invocation_complete (source : Term) :
    ∃ ticks final, run machine ticks (initial source) = final ∧ Result source ticks final := by
  obtain ⟨doneTicks, done, execution, answer⟩ :=
    RootResetClockParityTotality.probe_complete source
  have completed : RootResetClockParityTotality.Terminal
      (run Parity.machine doneTicks (Parity.initial source)) := by
    rw [execution]
    exact answer.terminal
  obtain ⟨ticks, terminal, prefixRun, prefixMutations⟩ :=
    reaches_boundary doneTicks (Parity.initial source) completed
  let after := run Parity.machine ticks (Parity.initial source)
  have afterAnswer : RootResetClockParityTotality.Answer source after :=
    RootResetClockParityTotality.terminal_answer source ticks terminal
  have prefixExecution : run machine ticks (initial source) =
      liftConfiguration .probe after := prefixRun
  have prefixZero : runMutationCount machine ticks (initial source) = 0 := prefixMutations
  rcases afterAnswer with ⟨accepted, first, second, third, focusEq⟩ | ⟨missed, restored⟩
  · have selected : ∃ state, after.control = some state ∧ handoff state = some .contract := by
      rcases accepted with h | h | h
      · exact ⟨.growth .zero, h, rfl⟩
      · exact ⟨.growth .positive, h, rfl⟩
      · exact ⟨.launch, h, rfl⟩
    obtain ⟨state, stateEq, boundary⟩ := selected
    have afterEq : liftConfiguration .probe after =
        ⟨some (.probe state), ⟨Term.redex first second third, after.cursor.parents⟩⟩ := by
      rcases after with ⟨control, ⟨focus, parents⟩⟩
      simp_all [liftConfiguration]
    let final : Configuration Control :=
      ⟨some (.euler .doneRedex),
        ⟨Term.contractum first second third, after.cursor.parents⟩⟩
    refine ⟨ticks + 2, final, ?_, Or.inr ⟨rfl, ?_, ?_⟩⟩
    · rw [run_add, prefixExecution, afterEq, success_suffix state boundary]
    · have preserved : after.cursor.erase = source := by
        exact RootResetClockParityWalker.erase_run ticks (Parity.initial source)
      have contracts := contractAt?_cursorAddress after.cursor
      rw [focusEq, Term.contractRoot?_redex, preserved] at contracts
      exact contracts
    · rw [runMutationCount_add, prefixZero, prefixExecution, afterEq,
        success_suffix_mutations state boundary, Nat.zero_add]
  · have selected : ∃ state, after.control = some state ∧ handoff state = some .visit := by
      rcases missed with h | h
      · exact ⟨.miss, h, rfl⟩
      · exact ⟨.growth .miss, h, rfl⟩
    obtain ⟨state, stateEq, boundary⟩ := selected
    have afterEq : liftConfiguration .probe after =
        ⟨some (.probe state), Cursor.atRoot source⟩ := by
      simp [liftConfiguration, stateEq, restored]
    let suffix := 1 + (RootResetEulerWalker.rootExecution source).ticks
    let final := liftConfiguration .euler (RootResetEulerWalker.rootExecution source).final
    have countEq : runMutationCount machine (ticks + suffix) (initial source) =
        RootResetEulerWalker.terminalMutationCount
          (RootResetEulerWalker.rootExecution source).final.control := by
      rw [runMutationCount_add, prefixZero, prefixExecution, afterEq, Nat.zero_add]
      exact failure_suffix_mutations state boundary source
    refine ⟨ticks + suffix, final, ?_, ?_⟩
    · rw [run_add, prefixExecution, afterEq]
      exact failure_suffix state boundary source
    · rcases RootResetEulerWalker.rootExecution_certificate source with
        ⟨normal, normalProof, preserved⟩ | ⟨redex, contracts⟩
      · refine Or.inl ⟨?_, normalProof, preserved, ?_⟩
        · exact congrArg (Option.map Control.euler) normal
        · rw [countEq, normal]
          rfl
      · refine Or.inr ⟨?_, contracts, ?_⟩
        · exact congrArg (Option.map Control.euler) redex
        · rw [countEq, redex]
          rfl

/-- A certified successful probe endpoint determines the actual composed mutation. -/
theorem probe_success_simulated (source : Term) (probeTicks : Nat)
    (state : Parity.Control) (first second third : Term) (parents : List ParentFrame)
    (execution : run Parity.machine probeTicks (Parity.initial source) =
      ⟨some state, ⟨Term.redex first second third, parents⟩⟩)
    (terminal : RootResetClockParityTotality.Terminal
      ⟨some state, ⟨Term.redex first second third, parents⟩⟩)
    (boundary : handoff state = some .contract) :
    ∃ ticks,
      run machine ticks (initial source) =
        ⟨some (.euler .doneRedex), ⟨Term.contractum first second third, parents⟩⟩ ∧
      runMutationCount machine ticks (initial source) = 1 := by
  have completed : RootResetClockParityTotality.Terminal
      (run Parity.machine probeTicks (Parity.initial source)) := by
    rw [execution]
    exact terminal
  obtain ⟨ticks, firstTerminal, prefixRun, prefixMutations⟩ :=
    reaches_boundary probeTicks (Parity.initial source) completed
  have commute := congrArg (fun count => run Parity.machine count (Parity.initial source))
    (Nat.add_comm ticks probeTicks)
  rw [run_add, RootResetClockParityTotality.run_terminal probeTicks _ firstTerminal,
    run_add, execution, RootResetClockParityTotality.run_terminal ticks _ terminal] at commute
  have prefixExecution : run machine ticks (initial source) =
      ⟨some (.probe state), ⟨Term.redex first second third, parents⟩⟩ := by
    rw [commute] at prefixRun
    exact prefixRun
  refine ⟨ticks + 2, ?_, ?_⟩
  · rw [run_add, prefixExecution, success_suffix state boundary]
  · change runMutationCount machine (ticks + 2)
      (liftConfiguration .probe (Parity.initial source)) = 1
    rw [runMutationCount_add, prefixMutations, Nat.zero_add]
    change runMutationCount machine 2 (run machine ticks (initial source)) = 1
    rw [prefixExecution, success_suffix_mutations state boundary]

open PureSFormal.PureS.SchedulerInvariant

/-- Every generated positive growth sample receives exactly its intended contraction. -/
theorem generated_positive_growth (stage wrappers residual : Nat) (environment : Term) :
    ∃ ticks,
      run machine ticks
        (initial (.app (clockGrowthCore stage (wrappers + 1) (residual + 1)) environment)) =
        ⟨some (.euler .doneRedex),
          ⟨Term.contractum .s (C residual) (C stage),
            RootResetClockGrowthWalker.clockParents stage (wrappers + 1)
              [.left environment]⟩⟩ ∧
      runMutationCount machine ticks
        (initial (.app (clockGrowthCore stage (wrappers + 1) (residual + 1)) environment)) = 1 := by
  exact probe_success_simulated _ (RootResetClockParityWalker.growthTicks stage (wrappers + 1))
    (.growth .positive) .s (C residual) (C stage) _
    (RootResetClockParityWalker.run_generated_growth stage wrappers (residual + 1) environment)
    (Or.inr (Or.inl rfl)) rfl

/-- Every generated zero-residual growth sample receives exactly its intended contraction. -/
theorem generated_zero_growth (stage wrappers : Nat) (environment : Term) :
    ∃ ticks,
      run machine ticks
        (initial (.app (clockGrowthCore stage (wrappers + 1) 0) environment)) =
        ⟨some (.euler .doneRedex),
          ⟨Term.contractum (.app .s .s) b (C stage),
            RootResetClockGrowthWalker.clockParents stage (wrappers + 1)
              [.left environment]⟩⟩ ∧
      runMutationCount machine ticks
        (initial (.app (clockGrowthCore stage (wrappers + 1) 0) environment)) = 1 := by
  exact probe_success_simulated _ (RootResetClockParityWalker.growthTicks stage (wrappers + 1))
    (.growth .zero) (.app .s .s) b (C stage) _
    (RootResetClockParityWalker.run_generated_growth stage wrappers 0 environment)
    (Or.inl rfl) rfl

/-- Every generated launch sample contracts its whole-term root once. -/
theorem generated_launch (stage wrappers : Nat) (environment : Term) :
    ∃ ticks,
      run machine ticks
        (initial (.app (clockWrappers stage (wrappers + 1)) environment)) =
        ⟨some (.euler .doneRedex), Cursor.atRoot
          (.app (.app (C stage) environment)
            (.app (clockWrappers stage wrappers) environment))⟩ ∧
      runMutationCount machine ticks
        (initial (.app (clockWrappers stage (wrappers + 1)) environment)) = 1 := by
  exact probe_success_simulated _ (RootResetClockParityWalker.launchTicks stage (wrappers + 1))
    .launch (C stage) (clockWrappers stage wrappers) environment []
    (RootResetClockParityWalker.run_generated_launch stage wrappers environment)
    (Or.inr (Or.inr (Or.inr (Or.inl rfl)))) rfl

end PureSFormal.Research.RootResetClockEulerSelector
