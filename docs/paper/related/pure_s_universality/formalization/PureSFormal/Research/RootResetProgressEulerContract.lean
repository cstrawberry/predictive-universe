import PureSFormal.Research.RootResetProgressEulerTotality

/-!
# Exact mutation count and selector contract for the 47-state controller

The combined controller has a single mutating table row: lifted Euler
`contract` executes `Rdx` and enters the absorbing `doneRedex` state.  The
state flag below therefore telescopes exactly with `runMutationCount`.  This
closes the counted-history obligation left separate from the structural
totality proof and packages the fixed controller as a root-reset selector
contract.

The result concerns the complete all-input selector only.  It does not claim
that the 47 states classify or execute every CTS stage.
-/

namespace PureSFormal.Research.RootResetProgressEulerContract

set_option maxHeartbeats 1000000

open PureSFormal.PureS
open PureSFormal.PureS.FiniteController
open RootResetSelectorContract

namespace Selector

abbrev Control := RootResetProgressEulerSelector.Control
abbrev machine := RootResetProgressEulerSelector.machine
abbrev initial := RootResetProgressEulerSelector.initial
abbrev haltKind := RootResetProgressEulerSelector.haltKind

end Selector

/-! ## The unique mutating edge -/

theorem transition_stay_doneRedex_iff
    (control : Selector.Control) (node : Probe.NodeKind)
    (incoming : Probe.Incoming) :
    Selector.machine.transition control node incoming =
        .stay (.euler .doneRedex) ↔
      control = .euler .doneRedex := by
  cases control with
  | progress state =>
      cases state <;> cases node <;> cases incoming <;>
        simp [Selector.machine, RootResetProgressEulerSelector.machine,
          RootResetProgressEulerSelector.transition]
  | euler state =>
      cases state <;> cases node <;> cases incoming <;>
        simp [Selector.machine, RootResetProgressEulerSelector.machine,
          RootResetProgressEulerSelector.transition,
          RootResetProgressEulerSelector.liftEulerCommand,
          RootResetEulerWalker.machine, RootResetEulerWalker.transition]
  | verify1 => cases node <;> cases incoming <;> simp [Selector.machine,
      RootResetProgressEulerSelector.machine, RootResetProgressEulerSelector.transition]
  | verify2 => cases node <;> cases incoming <;> simp [Selector.machine,
      RootResetProgressEulerSelector.machine, RootResetProgressEulerSelector.transition]
  | verify3 => cases node <;> cases incoming <;> simp [Selector.machine,
      RootResetProgressEulerSelector.machine, RootResetProgressEulerSelector.transition]
  | verifyFail2 => cases node <;> cases incoming <;> simp [Selector.machine,
      RootResetProgressEulerSelector.machine, RootResetProgressEulerSelector.transition]
  | verifyFail3a => cases node <;> cases incoming <;> simp [Selector.machine,
      RootResetProgressEulerSelector.machine, RootResetProgressEulerSelector.transition]
  | verifyFail3b => cases node <;> cases incoming <;> simp [Selector.machine,
      RootResetProgressEulerSelector.machine, RootResetProgressEulerSelector.transition]
  | verifySuccess3a => cases node <;> cases incoming <;> simp [Selector.machine,
      RootResetProgressEulerSelector.machine, RootResetProgressEulerSelector.transition]
  | verifySuccess3b => cases node <;> cases incoming <;> simp [Selector.machine,
      RootResetProgressEulerSelector.machine, RootResetProgressEulerSelector.transition]
  | abort => cases node <;> cases incoming <;> simp [Selector.machine,
      RootResetProgressEulerSelector.machine, RootResetProgressEulerSelector.transition]

theorem transition_exec_doneRedex_iff
    (control : Selector.Control) (node : Probe.NodeKind)
    (incoming : Probe.Incoming) (primitive : Primitive) :
    Selector.machine.transition control node incoming =
        .exec primitive (.euler .doneRedex) ↔
      control = .euler .contract ∧ primitive = .Rdx := by
  cases control with
  | progress state =>
      cases state <;> cases node <;> cases incoming <;> cases primitive <;>
        simp [Selector.machine, RootResetProgressEulerSelector.machine,
          RootResetProgressEulerSelector.transition]
  | euler state =>
      cases state <;> cases node <;> cases incoming <;> cases primitive <;>
        simp [Selector.machine, RootResetProgressEulerSelector.machine,
          RootResetProgressEulerSelector.transition,
          RootResetProgressEulerSelector.liftEulerCommand,
          RootResetEulerWalker.machine, RootResetEulerWalker.transition]
  | verify1 => cases node <;> cases incoming <;> cases primitive <;> simp [Selector.machine,
      RootResetProgressEulerSelector.machine, RootResetProgressEulerSelector.transition]
  | verify2 => cases node <;> cases incoming <;> cases primitive <;> simp [Selector.machine,
      RootResetProgressEulerSelector.machine, RootResetProgressEulerSelector.transition]
  | verify3 => cases node <;> cases incoming <;> cases primitive <;> simp [Selector.machine,
      RootResetProgressEulerSelector.machine, RootResetProgressEulerSelector.transition]
  | verifyFail2 => cases node <;> cases incoming <;> cases primitive <;> simp [Selector.machine,
      RootResetProgressEulerSelector.machine, RootResetProgressEulerSelector.transition]
  | verifyFail3a => cases node <;> cases incoming <;> cases primitive <;> simp [Selector.machine,
      RootResetProgressEulerSelector.machine, RootResetProgressEulerSelector.transition]
  | verifyFail3b => cases node <;> cases incoming <;> cases primitive <;> simp [Selector.machine,
      RootResetProgressEulerSelector.machine, RootResetProgressEulerSelector.transition]
  | verifySuccess3a => cases node <;> cases incoming <;> cases primitive <;> simp [Selector.machine,
      RootResetProgressEulerSelector.machine, RootResetProgressEulerSelector.transition]
  | verifySuccess3b => cases node <;> cases incoming <;> cases primitive <;> simp [Selector.machine,
      RootResetProgressEulerSelector.machine, RootResetProgressEulerSelector.transition]
  | abort => cases node <;> cases incoming <;> cases primitive <;> simp [Selector.machine,
      RootResetProgressEulerSelector.machine, RootResetProgressEulerSelector.transition]

theorem transition_exec_rdx_target
    (control : Selector.Control) (node : Probe.NodeKind)
    (incoming : Probe.Incoming) (next : Selector.Control)
    (command : Selector.machine.transition control node incoming =
      .exec .Rdx next) :
    next = .euler .doneRedex := by
  cases control with
  | progress state =>
      cases state <;> cases node <;> cases incoming <;>
        simp [Selector.machine, RootResetProgressEulerSelector.machine,
          RootResetProgressEulerSelector.transition] at command
  | euler state =>
      cases state <;> cases node <;> cases incoming <;>
        simp_all [Selector.machine, RootResetProgressEulerSelector.machine,
          RootResetProgressEulerSelector.transition,
          RootResetProgressEulerSelector.liftEulerCommand,
          RootResetEulerWalker.machine, RootResetEulerWalker.transition]
  | verify1 => cases node <;> cases incoming <;> simp [Selector.machine,
      RootResetProgressEulerSelector.machine, RootResetProgressEulerSelector.transition] at command
  | verify2 => cases node <;> cases incoming <;> simp [Selector.machine,
      RootResetProgressEulerSelector.machine, RootResetProgressEulerSelector.transition] at command
  | verify3 => cases node <;> cases incoming <;> simp [Selector.machine,
      RootResetProgressEulerSelector.machine, RootResetProgressEulerSelector.transition] at command
  | verifyFail2 => cases node <;> cases incoming <;> simp [Selector.machine,
      RootResetProgressEulerSelector.machine, RootResetProgressEulerSelector.transition] at command
  | verifyFail3a => cases node <;> cases incoming <;> simp [Selector.machine,
      RootResetProgressEulerSelector.machine, RootResetProgressEulerSelector.transition] at command
  | verifyFail3b => cases node <;> cases incoming <;> simp [Selector.machine,
      RootResetProgressEulerSelector.machine, RootResetProgressEulerSelector.transition] at command
  | verifySuccess3a => cases node <;> cases incoming <;> simp [Selector.machine,
      RootResetProgressEulerSelector.machine, RootResetProgressEulerSelector.transition] at command
  | verifySuccess3b => cases node <;> cases incoming <;> simp [Selector.machine,
      RootResetProgressEulerSelector.machine, RootResetProgressEulerSelector.transition] at command
  | abort => cases node <;> cases incoming <;> simp [Selector.machine,
      RootResetProgressEulerSelector.machine, RootResetProgressEulerSelector.transition] at command

/-! ## Mutation-count conservation -/

/-- The redex terminal contributes one unit; every other runtime control
contributes zero. -/
def redexFlag (configuration : Configuration Selector.Control) : Nat :=
  if configuration.control = some (.euler .doneRedex) then 1 else 0

/-- One controller tick changes the redex flag by exactly its successful
mutation count. -/
theorem redexFlag_step (configuration : Configuration Selector.Control) :
    redexFlag (step Selector.machine configuration) =
      redexFlag configuration + mutationCount Selector.machine configuration := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => rfl
  | some control =>
      by_cases done : control = .euler .doneRedex
      · subst control
        rfl
      · generalize hcommand : Selector.machine.transition control
          (Probe.observeNode cursor) (Probe.observeIncoming cursor) = command
        cases command with
        | stay next =>
            have nextNotDone : next ≠ .euler .doneRedex := by
              intro nextDone
              subst next
              exact done ((transition_stay_doneRedex_iff control
                (Probe.observeNode cursor)
                (Probe.observeIncoming cursor)).mp hcommand)
            simp [redexFlag, step, mutationCount, hcommand, done, nextNotDone]
        | reject =>
            simp [redexFlag, step, mutationCount, hcommand, done]
        | exec primitive next =>
            cases primitive with
            | L =>
                have nextNotDone : next ≠ .euler .doneRedex := by
                  intro nextDone
                  subst next
                  have impossible :=
                    (transition_exec_doneRedex_iff control
                      (Probe.observeNode cursor)
                      (Probe.observeIncoming cursor) .L).mp hcommand
                  cases impossible.2
                cases moved : Primitive.L.exec cursor <;>
                  simp [redexFlag, step, mutationCount, hcommand, done,
                    nextNotDone, moved]
            | R =>
                have nextNotDone : next ≠ .euler .doneRedex := by
                  intro nextDone
                  subst next
                  have impossible :=
                    (transition_exec_doneRedex_iff control
                      (Probe.observeNode cursor)
                      (Probe.observeIncoming cursor) .R).mp hcommand
                  cases impossible.2
                cases moved : Primitive.R.exec cursor <;>
                  simp [redexFlag, step, mutationCount, hcommand, done,
                    nextNotDone, moved]
            | U =>
                have nextNotDone : next ≠ .euler .doneRedex := by
                  intro nextDone
                  subst next
                  have impossible :=
                    (transition_exec_doneRedex_iff control
                      (Probe.observeNode cursor)
                      (Probe.observeIncoming cursor) .U).mp hcommand
                  cases impossible.2
                cases moved : Primitive.U.exec cursor <;>
                  simp [redexFlag, step, mutationCount, hcommand, done,
                    nextNotDone, moved]
            | Rdx =>
                have nextDone := transition_exec_rdx_target control
                  (Probe.observeNode cursor) (Probe.observeIncoming cursor)
                  next hcommand
                subst next
                cases moved : cursor.rdx? <;>
                  simp [redexFlag, step, mutationCount, hcommand, done,
                    Primitive.exec, moved]

/-- The flag telescopes over every finite controller run. -/
theorem redexFlag_run (ticks : Nat)
    (configuration : Configuration Selector.Control) :
    redexFlag (run Selector.machine ticks configuration) =
      redexFlag configuration +
        runMutationCount Selector.machine ticks configuration := by
  induction ticks generalizing configuration with
  | zero => simp [runMutationCount]
  | succ ticks ih =>
      rw [run_succ, ih, redexFlag_step]
      simp [runMutationCount, Nat.add_assoc]

/-! ## Fixed-bound exact mutation count -/

/-- The proof-certified fixed stopping time.  It is not present in the
operational controller configuration or transition table. -/
def stoppingTime (term : Term) : Nat :=
  51 * (term.size + 1)

/-- Concrete endpoint of a fresh whole-term invocation. -/
def final (term : Term) : Configuration Selector.Control :=
  run Selector.machine (stoppingTime term) (Selector.initial term)

theorem final_result (term : Term) :
    RootResetProgressEulerTotality.WholeResult term (final term) := by
  simpa [final, stoppingTime, Selector.machine, Selector.initial] using
    RootResetProgressEulerTotality.wholeInvocation_run_linear_result term

/-- The fresh initial configuration has zero redex-terminal flag. -/
@[simp]
theorem redexFlag_initial (term : Term) :
    redexFlag (Selector.initial term) = 0 :=
  rfl

/-- On the complete fresh-root run, mutation count is exactly the final
redex-terminal flag. -/
theorem wholeInvocation_mutationCount_eq_redexFlag (term : Term) :
    runMutationCount Selector.machine (stoppingTime term)
        (Selector.initial term) =
      redexFlag (final term) := by
  have conserved := redexFlag_run (stoppingTime term) (Selector.initial term)
  simpa [final] using conserved.symm

theorem final_terminal_cases (term : Term) :
    (final term).control = some (.euler .doneNF) ∨
      (final term).control = some (.euler .doneRedex) :=
  (final_result term).terminal

theorem final_nf_normal (term : Term)
    (halted : (final term).control = some (.euler .doneNF)) :
    AddressNormal term := by
  rcases final_result term with normal | redex
  · exact normal.2.1
  · have impossible : RootResetProgressEulerSelector.Control.euler .doneNF =
        RootResetProgressEulerSelector.Control.euler .doneRedex :=
      Option.some.inj (halted.symm.trans redex.1)
    cases impossible

theorem final_nf_erase (term : Term)
    (halted : (final term).control = some (.euler .doneNF)) :
    (final term).cursor.erase = term := by
  rcases final_result term with normal | redex
  · exact normal.2.2
  · have impossible : RootResetProgressEulerSelector.Control.euler .doneNF =
        RootResetProgressEulerSelector.Control.euler .doneRedex :=
      Option.some.inj (halted.symm.trans redex.1)
    cases impossible

theorem final_redex_contracts (term : Term)
    (halted : (final term).control = some (.euler .doneRedex)) :
    term.contractAt? (cursorAddress (final term).cursor) =
      some (final term).cursor.erase := by
  rcases final_result term with normal | redex
  · have impossible : RootResetProgressEulerSelector.Control.euler .doneRedex =
        RootResetProgressEulerSelector.Control.euler .doneNF :=
      Option.some.inj (halted.symm.trans normal.1)
    cases impossible
  · exact redex.2

/-- An NF endpoint performs exactly zero successful target contractions. -/
theorem final_nf_mutationCount (term : Term)
    (halted : (final term).control = some (.euler .doneNF)) :
    runMutationCount Selector.machine (stoppingTime term)
        (Selector.initial term) = 0 := by
  rw [wholeInvocation_mutationCount_eq_redexFlag]
  simp [redexFlag, halted]

/-- A redex endpoint performs exactly one successful target contraction. -/
theorem final_redex_mutationCount (term : Term)
    (halted : (final term).control = some (.euler .doneRedex)) :
    runMutationCount Selector.machine (stoppingTime term)
        (Selector.initial term) = 1 := by
  rw [wholeInvocation_mutationCount_eq_redexFlag]
  simp [redexFlag, halted]

/-! ## Dependent outcome and complete contract -/

/-- Total dependent NF/redex answer extracted from the certified endpoint. -/
def outcome (term : Term) : Outcome term :=
  let endpoint := final term
  if halted : endpoint.control = some (.euler .doneNF) then
    .nf (final_nf_normal term halted)
  else
    have redexHalt : endpoint.control = some (.euler .doneRedex) := by
      rcases final_terminal_cases term with normal | redex
      · exact False.elim (halted normal)
      · exact redex
    .redex (cursorAddress endpoint.cursor) endpoint.cursor.erase
      (final_redex_contracts term redexHalt)

theorem final_runtime_terminal (term : Term) :
    (runtimeHaltKind Selector.haltKind (final term).control).isSome = true := by
  rcases final_terminal_cases term with normal | redex
  · simp [Selector.haltKind, RootResetProgressEulerSelector.haltKind,
      runtimeHaltKind, normal]
  · simp [Selector.haltKind, RootResetProgressEulerSelector.haltKind,
      runtimeHaltKind, redex]

theorem outcome_agrees (term : Term) :
    let endpoint := final term
    match outcome term with
    | .nf _ =>
        runtimeHaltKind Selector.haltKind endpoint.control = some .nf ∧
          endpoint.cursor.erase = term
    | .redex address target _ =>
        runtimeHaltKind Selector.haltKind endpoint.control = some .redex ∧
          cursorAddress endpoint.cursor = address ∧
          endpoint.cursor.erase = target := by
  by_cases halted : (final term).control = some (.euler .doneNF)
  · simp only [outcome, halted, dite_true]
    exact ⟨by
      simp [Selector.haltKind, RootResetProgressEulerSelector.haltKind,
        runtimeHaltKind, halted], final_nf_erase term halted⟩
  · have redexHalt :
        (final term).control = some (.euler .doneRedex) := by
      rcases final_terminal_cases term with normal | redex
      · exact False.elim (halted normal)
      · exact redex
    simp only [outcome, halted, dite_false]
    simp [Selector.haltKind, RootResetProgressEulerSelector.haltKind,
      runtimeHaltKind, redexHalt]

theorem mutationCount_agrees (term : Term) :
    match outcome term with
    | .nf _ =>
        runMutationCount Selector.machine (stoppingTime term)
          (Selector.initial term) = 0
    | .redex _ _ _ =>
        runMutationCount Selector.machine (stoppingTime term)
          (Selector.initial term) = 1 := by
  by_cases halted : (final term).control = some (.euler .doneNF)
  · simp only [outcome, halted, dite_true]
    exact final_nf_mutationCount term halted
  · have redexHalt :
        (final term).control = some (.euler .doneRedex) := by
      rcases final_terminal_cases term with normal | redex
      · exact False.elim (halted normal)
      · exact redex
    simp only [outcome, halted, dite_false]
    exact final_redex_mutationCount term redexHalt

/-- Complete fixed, term-only, fresh-root selector contract for the 47-state
progress/Euler controller. -/
def selectorContract : RootResetSelectorContract.Contract where
  Control := Selector.Control
  machine := Selector.machine
  start := .progress .down
  haltKind := Selector.haltKind
  coefficient := 51
  coefficient_pos := by decide
  stoppingTime := stoppingTime
  outcome := outcome
  stoppingTime_le := fun _ => Nat.le_refl _
  terminal := by
    intro term
    simpa [final, Selector.initial,
      RootResetProgressEulerSelector.initial] using final_runtime_terminal term
  terminal_absorbing := by
    intro control node incoming halted
    exact RootResetProgressEulerSelector.terminal_controls_absorbing
      control node incoming halted
  outcome_agrees := by
    intro term
    simpa [final, Selector.initial,
      RootResetProgressEulerSelector.initial] using! outcome_agrees term
  mutationCount_agrees := mutationCount_agrees

/-- The packaged selector performs exactly zero or one contraction according
to its dependent answer. -/
theorem selector_exact_mutation_count (term : Term) :
    match selectorContract.select term with
    | .nf _ =>
        runMutationCount selectorContract.machine
          (selectorContract.stoppingTime term)
          (selectorContract.initial term) = 0
    | .redex _ _ _ =>
        runMutationCount selectorContract.machine
          (selectorContract.stoppingTime term)
          (selectorContract.initial term) = 1 :=
  selectorContract.exact_mutation_count term

theorem selector_halts_linear (term : Term) :
    ∃ ticks ≤ 51 * (term.size + 1),
      let endpoint := run selectorContract.machine ticks
        (selectorContract.initial term)
      (runtimeHaltKind selectorContract.haltKind endpoint.control).isSome = true :=
  selectorContract.halts_within term

theorem selector_moves_linear (term : Term) :
    runMoveCount selectorContract.machine (selectorContract.stoppingTime term)
        (selectorContract.initial term) ≤ 51 * (term.size + 1) :=
  selectorContract.moves_le term

end PureSFormal.Research.RootResetProgressEulerContract
