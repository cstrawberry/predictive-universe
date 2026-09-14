import PureSFormal.Research.RootResetProgressTotality
import PureSFormal.Research.RootResetEulerWalker

/-!
# A guarded progress-first controller with Euler fallback

This module gives one concrete finite controller that first runs the
Armed/Open/Closed progress-fragment scan and falls back to the complete Euler
redex scan after a mismatch.  Fallback is not implemented with
`FiniteController.Command.reject`: that command, and every failed primitive,
enters the uncatchable runtime `none` sink.  Instead an explicit `abort` state
climbs to the whole-term root and then enters the Euler `visit` state.

The two progress-fragment `Rdx` sites are guarded by an origin-restoring
depth-three saturation probe.  A successful probe executes one verified
contraction.  A failed probe restores the candidate root and enters `abort`.
Thus malformed candidate shapes cannot bypass fallback through a failed
primitive.

The controller and the fallback phase are complete here.  The theorem that
the progress-first prefix reaches either the guarded contraction or `abort`
on every input is kept separate: this module does not claim a complete CTS
walker or a complete root-reset CTS evaluator.
-/

namespace PureSFormal.Research.RootResetProgressEulerSelector

open PureSFormal.PureS
open PureSFormal.PureS.FiniteController
open RootResetSelectorContract

set_option maxHeartbeats 1000000

namespace Progress

abbrev Control := RootResetProgressWalker.Control
abbrev machine := RootResetProgressWalker.machine
abbrev states := RootResetProgressWalker.states

end Progress

namespace Euler

abbrev Control := RootResetEulerWalker.Control
abbrev machine := RootResetEulerWalker.machine
abbrev states := RootResetEulerWalker.states

end Euler

/-! ## Finite combined transition table -/

/--
The ordinary progress and Euler controls, eight verifier controls, and one
root-reset abort control.
-/
inductive Control where
  | progress (state : Progress.Control)
  | verify1
  | verify2
  | verify3
  | verifyFail2
  | verifyFail3a
  | verifyFail3b
  | verifySuccess3a
  | verifySuccess3b
  | abort
  | euler (state : Euler.Control)
  deriving BEq, DecidableEq, Inhabited, Repr

/-- Lift one Euler command without changing its primitive. -/
def liftEulerCommand : Command Euler.Control → Command Control
  | .stay next => .stay (.euler next)
  | .exec primitive next => .exec primitive (.euler next)
  | .reject => .reject

/--
The progress table with explicit fallback and guarded contraction, followed
by a literal lift of the complete Euler table.
-/
def transition : Control → Probe.NodeKind → Probe.Incoming → Command Control
  | .progress .down, .s, .root => .stay .abort
  | .progress .down, .s, .left => .exec .U (.progress .afterUp)
  | .progress .down, .s, .right => .exec .U (.progress .afterUp)
  | .progress .down, .app, _ => .exec .L (.progress .downL)
  | .progress .downL, .app, _ => .exec .L (.progress .downLL)
  | .progress .downL, .s, _ => .stay .abort
  | .progress .downLL, .app, _ => .exec .U (.progress .downArmedL)
  | .progress .downLL, .s, _ => .exec .U (.progress .downOtherL)
  | .progress .downArmedL, _, _ => .exec .U (.progress .downArmedRoot)
  | .progress .downArmedRoot, _, _ => .exec .R (.progress .down)
  | .progress .downOtherL, _, _ => .exec .R (.progress .down)
  | .progress .afterUp, _, .left => .exec .U (.progress .inspect)
  | .progress .afterUp, _, .root => .stay (.progress .inspect)
  | .progress .afterUp, _, .right => .stay (.progress .inspect)
  | .progress .inspect, .app, _ => .exec .L (.progress .inspectL)
  | .progress .inspect, .s, _ => .stay .abort
  | .progress .inspectL, .app, _ => .exec .L (.progress .inspectLL)
  | .progress .inspectL, .s, _ => .stay .abort
  | .progress .inspectLL, .app, _ => .exec .U (.progress .armedL)
  | .progress .inspectLL, .s, _ => .exec .U (.progress .otherL)
  | .progress .armedL, _, _ => .exec .U (.progress .armedRoot)
  | .progress .armedRoot, .app, _ => .exec .L .verify1
  | .progress .armedRoot, .s, _ => .stay .abort
  | .progress .otherL, _, _ => .exec .U (.progress .otherRoot)
  | .progress .otherRoot, _, _ => .exec .R (.progress .right)
  | .progress .right, .app, _ => .exec .L (.progress .rightL)
  | .progress .right, .s, _ => .stay .abort
  | .progress .rightL, .app, _ => .exec .L (.progress .rightLL)
  | .progress .rightL, .s, _ => .stay .abort
  | .progress .rightLL, .app, _ => .exec .U (.progress .openRL)
  | .progress .rightLL, .s, _ => .exec .U (.progress .closedRL)
  | .progress .openRL, _, _ => .exec .U (.progress .openRight)
  | .progress .openRight, .app, _ => .exec .L .verify1
  | .progress .openRight, .s, _ => .stay .abort
  | .progress .closedRL, _, _ => .exec .U (.progress .closedRight)
  | .progress .closedRight, _, _ => .exec .U (.progress .closedRoot)
  | .progress .closedRoot, _, .root => .stay .abort
  | .progress .closedRoot, _, .left => .exec .U (.progress .afterUp)
  | .progress .closedRoot, _, .right => .exec .U (.progress .afterUp)
  | .progress .halt, _, _ => .stay (.progress .halt)
  | .verify1, .s, _ => .exec .U .abort
  | .verify1, .app, _ => .exec .L .verify2
  | .verify2, .s, _ => .exec .U .verifyFail2
  | .verify2, .app, _ => .exec .L .verify3
  | .verify3, .s, _ => .exec .U .verifySuccess3a
  | .verify3, .app, _ => .exec .U .verifyFail3a
  | .verifyFail2, _, _ => .exec .U .abort
  | .verifyFail3a, _, _ => .exec .U .verifyFail3b
  | .verifyFail3b, _, _ => .exec .U .abort
  | .verifySuccess3a, _, _ => .exec .U .verifySuccess3b
  | .verifySuccess3b, _, _ => .exec .U (.euler .contract)
  | .abort, _, .root => .stay (.euler .visit)
  | .abort, _, .left => .exec .U .abort
  | .abort, _, .right => .exec .U .abort
  | .euler state, node, incoming =>
      liftEulerCommand (Euler.machine.transition state node incoming)

/-- Explicit finite cover of all combined controls. -/
def states : List Control :=
  Progress.states.map .progress ++
    [.verify1, .verify2, .verify3, .verifyFail2, .verifyFail3a,
      .verifyFail3b, .verifySuccess3a, .verifySuccess3b, .abort] ++
    Euler.states.map .euler

/-- Constructor-level map membership, avoiding any decidable list search. -/
private theorem map_mem_of_mem {α β : Type} (map : α → β) {item : α}
    {items : List α} (membership : item ∈ items) :
    map item ∈ items.map map := by
  induction membership with
  | head => exact List.Mem.head _
  | tail other _ ih => exact List.Mem.tail (map other) ih

theorem mem_states (control : Control) : control ∈ states := by
  cases control with
  | progress state =>
      apply List.mem_append.mpr
      apply Or.inl
      apply List.mem_append.mpr
      apply Or.inl
      exact map_mem_of_mem (fun state => Control.progress state)
        (RootResetProgressWalker.mem_states state)
  | euler state =>
      apply List.mem_append.mpr
      exact Or.inr (map_mem_of_mem (fun state => Control.euler state)
        (RootResetEulerWalker.mem_states state))
  | verify1 =>
      apply List.mem_append.mpr
      apply Or.inl
      apply List.mem_append.mpr
      exact Or.inr (List.Mem.head _)
  | verify2 =>
      apply List.mem_append.mpr
      apply Or.inl
      apply List.mem_append.mpr
      apply Or.inr
      exact List.Mem.tail _ (List.Mem.head _)
  | verify3 =>
      apply List.mem_append.mpr
      apply Or.inl
      apply List.mem_append.mpr
      apply Or.inr
      exact List.Mem.tail _ (List.Mem.tail _ (List.Mem.head _))
  | verifyFail2 =>
      apply List.mem_append.mpr
      apply Or.inl
      apply List.mem_append.mpr
      apply Or.inr
      exact List.Mem.tail _ (List.Mem.tail _
        (List.Mem.tail _ (List.Mem.head _)))
  | verifyFail3a =>
      apply List.mem_append.mpr
      apply Or.inl
      apply List.mem_append.mpr
      apply Or.inr
      exact List.Mem.tail _ (List.Mem.tail _ (List.Mem.tail _
        (List.Mem.tail _ (List.Mem.head _))))
  | verifyFail3b =>
      apply List.mem_append.mpr
      apply Or.inl
      apply List.mem_append.mpr
      apply Or.inr
      exact List.Mem.tail _ (List.Mem.tail _ (List.Mem.tail _
        (List.Mem.tail _ (List.Mem.tail _ (List.Mem.head _)))))
  | verifySuccess3a =>
      apply List.mem_append.mpr
      apply Or.inl
      apply List.mem_append.mpr
      apply Or.inr
      exact List.Mem.tail _ (List.Mem.tail _ (List.Mem.tail _
        (List.Mem.tail _ (List.Mem.tail _
          (List.Mem.tail _ (List.Mem.head _))))))
  | verifySuccess3b =>
      apply List.mem_append.mpr
      apply Or.inl
      apply List.mem_append.mpr
      apply Or.inr
      exact List.Mem.tail _ (List.Mem.tail _ (List.Mem.tail _
        (List.Mem.tail _ (List.Mem.tail _ (List.Mem.tail _
          (List.Mem.tail _ (List.Mem.head _)))))))
  | abort =>
      apply List.mem_append.mpr
      apply Or.inl
      apply List.mem_append.mpr
      apply Or.inr
      exact List.Mem.tail _ (List.Mem.tail _ (List.Mem.tail _
        (List.Mem.tail _ (List.Mem.tail _ (List.Mem.tail _
          (List.Mem.tail _ (List.Mem.tail _ (List.Mem.head _))))))))

theorem states_nodup : states.Nodup := by
  decide

@[simp]
theorem states_length : states.length = 47 := by
  decide

/-- The actual fixed 47-state combined controller. -/
def machine : Machine Control where
  stateCover := fun _ => states
  covers := mem_states
  transition := transition

/-- Every invocation starts at the bare root in progress mode. -/
def initial (term : Term) : Configuration Control :=
  ⟨some (.progress .down), Cursor.atRoot term⟩

/-- The two redex halts and the Euler normal-form halt. -/
def haltKind : Control → Option HaltKind
  | .progress .halt => some .redex
  | .euler .doneNF => some .nf
  | .euler .doneRedex => some .redex
  | _ => none

/-- All declared terminal controls are absorbing. -/
theorem terminal_controls_absorbing (control : Control)
    (node : Probe.NodeKind) (incoming : Probe.Incoming)
    (halted : (haltKind control).isSome = true) :
    machine.transition control node incoming = .stay control := by
  cases control <;> simp [haltKind] at halted
  case progress state =>
    cases state <;> simp [haltKind] at halted
    all_goals cases node <;> cases incoming <;> rfl
  case euler state =>
    cases state <;> simp [haltKind] at halted
    all_goals cases node <;> cases incoming <;> rfl

/-- No explicit progress, verifier, or abort row uses the rejecting command. -/
theorem preFallback_transition_ne_reject
    (control : Control) (node : Probe.NodeKind) (incoming : Probe.Incoming)
    (notEuler : ∀ state, control ≠ .euler state) :
    machine.transition control node incoming ≠ .reject := by
  cases control with
  | progress state =>
      cases state <;> cases node <;> cases incoming <;>
        simp [machine, transition]
  | euler state => exact False.elim (notEuler state rfl)
  | verify1 => cases node <;> cases incoming <;> simp [machine, transition]
  | verify2 => cases node <;> cases incoming <;> simp [machine, transition]
  | verify3 => cases node <;> cases incoming <;> simp [machine, transition]
  | verifyFail2 => cases node <;> cases incoming <;> simp [machine, transition]
  | verifyFail3a => cases node <;> cases incoming <;> simp [machine, transition]
  | verifyFail3b => cases node <;> cases incoming <;> simp [machine, transition]
  | verifySuccess3a => cases node <;> cases incoming <;> simp [machine, transition]
  | verifySuccess3b => cases node <;> cases incoming <;> simp [machine, transition]
  | abort => cases node <;> cases incoming <;> simp [machine, transition]

/-! ## Guarded progress contractions -/

/-- The guarded Armed candidate either contracts one saturated redex after
seven ticks or restores its origin and enters `abort` without mutation. -/
theorem armedRoot_verifies_or_aborts (focus : Term)
    (parents : List ParentFrame) :
    match focus.contractRoot? with
    | none =>
        ∃ ticks, ticks ≤ 7 ∧
          run machine ticks
              ⟨some (.progress .armedRoot), ⟨focus, parents⟩⟩ =
            ⟨some .abort, ⟨focus, parents⟩⟩ ∧
          runMutationCount machine ticks
              ⟨some (.progress .armedRoot), ⟨focus, parents⟩⟩ = 0
    | some replacement =>
        run machine 7
            ⟨some (.progress .armedRoot), ⟨focus, parents⟩⟩ =
          ⟨some (.euler .doneRedex), ⟨replacement, parents⟩⟩ ∧
        runMutationCount machine 7
            ⟨some (.progress .armedRoot), ⟨focus, parents⟩⟩ = 1 := by
  cases focus with
  | s => exact ⟨1, by decide, rfl, rfl⟩
  | app fn arg =>
      cases fn with
      | s => exact ⟨2, by decide, rfl, rfl⟩
      | app fn₂ y =>
          cases fn₂ with
          | s => exact ⟨4, by decide, rfl, rfl⟩
          | app head x =>
              cases head with
              | s => exact ⟨rfl, rfl⟩
              | app headFn headArg => exact ⟨6, by decide, rfl, rfl⟩

/-- The guarded Open-right candidate has the identical verified behavior. -/
theorem openRight_verifies_or_aborts (focus : Term)
    (parents : List ParentFrame) :
    match focus.contractRoot? with
    | none =>
        ∃ ticks, ticks ≤ 7 ∧
          run machine ticks
              ⟨some (.progress .openRight), ⟨focus, parents⟩⟩ =
            ⟨some .abort, ⟨focus, parents⟩⟩ ∧
          runMutationCount machine ticks
              ⟨some (.progress .openRight), ⟨focus, parents⟩⟩ = 0
    | some replacement =>
        run machine 7
            ⟨some (.progress .openRight), ⟨focus, parents⟩⟩ =
          ⟨some (.euler .doneRedex), ⟨replacement, parents⟩⟩ ∧
        runMutationCount machine 7
            ⟨some (.progress .openRight), ⟨focus, parents⟩⟩ = 1 := by
  cases focus with
  | s => exact ⟨1, by decide, rfl, rfl⟩
  | app fn arg =>
      cases fn with
      | s => exact ⟨2, by decide, rfl, rfl⟩
      | app fn₂ y =>
          cases fn₂ with
          | s => exact ⟨4, by decide, rfl, rfl⟩
          | app head x =>
              cases head with
              | s => exact ⟨rfl, rfl⟩
              | app headFn headArg => exact ⟨6, by decide, rfl, rfl⟩

/-! ## Exact abort-to-root and Euler lift -/

/-- Abort climbs through every parent edge and enters Euler `visit` at the
whole-term root. -/
theorem run_abort_to_euler_visit (focus : Term)
    (parents : List ParentFrame) :
    run machine (parents.length + 1) ⟨some .abort, ⟨focus, parents⟩⟩ =
      ⟨some (.euler .visit), Cursor.atRoot (Cursor.mk focus parents).erase⟩ := by
  induction parents generalizing focus with
  | nil => rfl
  | cons frame parents ih =>
      cases frame with
      | left sibling =>
          rw [show (List.length (.left sibling :: parents) + 1) =
              (parents.length + 1) + 1 by rfl, run_succ]
          simpa [Cursor.erase, Cursor.rebuild] using! ih (.app focus sibling)
      | right sibling =>
          rw [show (List.length (.right sibling :: parents) + 1) =
              (parents.length + 1) + 1 by rfl, run_succ]
          simpa [Cursor.erase, Cursor.rebuild] using! ih (.app sibling focus)

/-- The exact abort prefix is bounded by the current bare term size. -/
theorem abort_ticks_le_erase_size (focus : Term)
    (parents : List ParentFrame) :
    parents.length + 1 ≤ (Cursor.mk focus parents).erase.size :=
  RootResetProgressTotality.depth_succ_le_erase_size focus parents

/-- Embed an Euler runtime control in the combined controller. -/
def liftEulerRuntime : RuntimeControl Euler.Control → RuntimeControl Control
  | none => none
  | some state => some (.euler state)

/-- Embed a complete Euler configuration without moving its cursor. -/
def liftEulerConfiguration
    (configuration : Configuration Euler.Control) : Configuration Control :=
  ⟨liftEulerRuntime configuration.control, configuration.cursor⟩

@[simp]
theorem transition_euler (state : Euler.Control) (node : Probe.NodeKind)
    (incoming : Probe.Incoming) :
    machine.transition (.euler state) node incoming =
      liftEulerCommand (Euler.machine.transition state node incoming) :=
  rfl

/-- One combined Euler row is exactly one row of the original Euler machine. -/
theorem step_liftEuler (configuration : Configuration Euler.Control) :
    step machine (liftEulerConfiguration configuration) =
      liftEulerConfiguration (step Euler.machine configuration) := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => rfl
  | some state =>
      simp only [step, liftEulerConfiguration, liftEulerRuntime,
        transition_euler]
      generalize hcommand : Euler.machine.transition state
        (Probe.observeNode cursor) (Probe.observeIncoming cursor) = command
      cases command with
      | stay next => simp [hcommand, liftEulerCommand]
      | reject => simp [hcommand, liftEulerCommand]
      | exec primitive next =>
          cases moved : primitive.exec cursor <;>
            simp [hcommand, liftEulerCommand, moved]

/-- Every finite lifted Euler run agrees exactly. -/
theorem run_liftEuler (ticks : Nat)
    (configuration : Configuration Euler.Control) :
    run machine ticks (liftEulerConfiguration configuration) =
      liftEulerConfiguration (run Euler.machine ticks configuration) := by
  induction ticks generalizing configuration with
  | zero => rfl
  | succ ticks ih =>
      rw [run_succ, step_liftEuler, ih]
      rfl

/-- One lifted Euler row has exactly the original mutation count. -/
theorem mutationCount_liftEuler
    (configuration : Configuration Euler.Control) :
    mutationCount machine (liftEulerConfiguration configuration) =
      mutationCount Euler.machine configuration := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => rfl
  | some state =>
      simp only [mutationCount, liftEulerConfiguration, liftEulerRuntime,
        transition_euler]
      generalize hcommand : Euler.machine.transition state
        (Probe.observeNode cursor) (Probe.observeIncoming cursor) = command
      cases command with
      | stay next => simp [hcommand, liftEulerCommand]
      | reject => simp [hcommand, liftEulerCommand]
      | exec primitive next =>
          cases primitive <;> simp [hcommand, liftEulerCommand]

/-- Mutation counts are also unchanged by the Euler lift. -/
theorem runMutationCount_liftEuler (ticks : Nat)
    (configuration : Configuration Euler.Control) :
    runMutationCount machine ticks (liftEulerConfiguration configuration) =
      runMutationCount Euler.machine ticks configuration := by
  induction ticks generalizing configuration with
  | zero => rfl
  | succ ticks ih =>
      simp only [runMutationCount]
      rw [mutationCount_liftEuler, step_liftEuler, ih]

/-- After abort, the combined machine reaches the exact certified Euler root
endpoint. -/
theorem run_abort_then_rootExecution (focus : Term)
    (parents : List ParentFrame) :
    let term := (Cursor.mk focus parents).erase
    run machine
        (parents.length + 1 + (RootResetEulerWalker.rootExecution term).ticks)
        ⟨some .abort, ⟨focus, parents⟩⟩ =
      liftEulerConfiguration (RootResetEulerWalker.rootExecution term).final := by
  dsimp only
  rw [run_add, run_abort_to_euler_visit]
  have liftedInitial :
      (Configuration.mk (some (.euler .visit))
          (Cursor.atRoot (Cursor.mk focus parents).erase)) =
        liftEulerConfiguration
          (RootResetEulerWalker.initial (Cursor.mk focus parents).erase) := rfl
  rw [liftedInitial, run_liftEuler]
  exact congrArg liftEulerConfiguration
    (RootResetEulerWalker.run_rootExecution_eq
      (Cursor.mk focus parents).erase)

/-- The complete abort-plus-Euler suffix is linearly bounded. -/
theorem abort_then_rootExecution_ticks_le (focus : Term)
    (parents : List ParentFrame) :
    let term := (Cursor.mk focus parents).erase
    parents.length + 1 + (RootResetEulerWalker.rootExecution term).ticks ≤
      29 * (term.size + 1) := by
  dsimp only
  have abortBound := abort_ticks_le_erase_size focus parents
  have eulerBound := RootResetEulerWalker.rootExecution_ticks_le
    (Cursor.mk focus parents).erase
  calc
    parents.length + 1 +
        (RootResetEulerWalker.rootExecution
          (Cursor.mk focus parents).erase).ticks ≤
      (Cursor.mk focus parents).erase.size +
        28 * ((Cursor.mk focus parents).erase.size + 1) :=
      Nat.add_le_add abortBound eulerBound
    _ ≤ 29 * ((Cursor.mk focus parents).erase.size + 1) := by
      calc
        (Cursor.mk focus parents).erase.size +
            28 * ((Cursor.mk focus parents).erase.size + 1) ≤
          ((Cursor.mk focus parents).erase.size + 1) +
            28 * ((Cursor.mk focus parents).erase.size + 1) :=
          Nat.add_le_add_right
            (Nat.le_add_right (Cursor.mk focus parents).erase.size 1) _
        _ = 29 * ((Cursor.mk focus parents).erase.size + 1) := by
          calc
            ((Cursor.mk focus parents).erase.size + 1) +
                28 * ((Cursor.mk focus parents).erase.size + 1) =
              1 * ((Cursor.mk focus parents).erase.size + 1) +
                28 * ((Cursor.mk focus parents).erase.size + 1) := by simp
            _ = (1 + 28) * ((Cursor.mk focus parents).erase.size + 1) :=
              (Nat.add_mul 1 28
                ((Cursor.mk focus parents).erase.size + 1)).symm
            _ = 29 * ((Cursor.mk focus parents).erase.size + 1) := rfl

/-- The combined controller has exactly forty-seven ordinary states. -/
theorem compiled_control_state_cardinality : machine.states.length = 47 :=
  states_length

end PureSFormal.Research.RootResetProgressEulerSelector
