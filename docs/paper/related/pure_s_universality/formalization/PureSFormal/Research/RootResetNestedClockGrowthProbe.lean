import PureSFormal.Research.RootResetNestedClockCoreProbe

/-! Clock-growth entry at any cursor, with exact local restoration on failure. -/
namespace PureSFormal.Research.RootResetNestedClockGrowthProbe
open PureSFormal.PureS
open FiniteController RootResetCarrierNonemptyProbe

namespace Core
abbrev Control := RootResetNestedClockCoreProbe.Control
abbrev machine := RootResetNestedClockCoreProbe.machine
abbrev initial := RootResetNestedClockCoreProbe.initial
end Core

inductive Control where
  | enter
  | core (state : Core.Control)
  | done (ready : Bool)

def cover : List Control := [.enter, .done false, .done true] ++ Core.machine.states.map .core

theorem covers (state : Control) : state ∈ cover := by
  simp only [cover, List.mem_append]
  cases state with
  | enter => exact Or.inl (List.Mem.head _)
  | done ready =>
      apply Or.inl
      cases ready with
      | false => exact List.Mem.tail _ (List.Mem.head _)
      | true => exact List.Mem.tail _ (List.Mem.tail _ (List.Mem.head _))
  | core state => exact Or.inr (RootResetCompletedLocalPatterns.map_member _ (Core.machine.covers state))

def transition : Control → Probe.NodeKind → Probe.Incoming → Command Control
  | .enter, .s, _ => .stay (.done false)
  | .enter, .app, _ => .exec .L (.core (.descending ⟨RootResetEdgeSpine.whole RootResetNestedClockPatterns.pendingRows,
      ProbeCompiler.Control.self_mem_nodes _⟩))
  | .core (.done true), _, _ => .stay (.done true)
  | .core (.done false), _, _ => .exec .U (.done false)
  | .core state, node, incoming => mapCommand .core (Core.machine.transition state node incoming)
  | .done ready, _, _ => .stay (.done ready)

def machine : Machine Control := ⟨fun _ => cover, covers, transition⟩
def initial (origin : Cursor) : Configuration Control := ⟨some .enter, origin⟩
def working (origin : Cursor) : Configuration Control := liftConfiguration .core (Core.initial origin)

def coreDone? (configuration : Configuration Core.Control) : Bool :=
  match configuration.control with
  | some (.done _) => true
  | _ => false

theorem core_absorbs (configuration : Configuration Core.Control) (ended : coreDone? configuration = true)
    (ticks : Nat) : run Core.machine ticks configuration = configuration := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => cases ended
  | some state => cases state with
    | done ready => exact RootResetNestedClockCoreProbe.done_absorbs ready cursor ticks
    | descending _ => cases ended
    | reading _ => cases ended
    | ascending _ => cases ended

theorem core_step (configuration : Configuration Core.Control) (running : coreDone? configuration = false) :
    step machine (liftConfiguration Control.core configuration) =
      liftConfiguration Control.core (step Core.machine configuration) := by
  apply step_lift
  intro state current
  rcases configuration with ⟨runtime, cursor⟩
  have equal : runtime = some state := current
  subst runtime
  cases state with
  | done ready => cases running
  | descending _ => rfl
  | reading _ => rfl
  | ascending _ => rfl

theorem core_runs (origin endpoint : Cursor) (ticks : Nat) (ready : Bool)
    (execution : run Core.machine ticks (Core.initial origin) = ⟨some (.done ready), endpoint⟩) :
    ∃ used, used ≤ ticks ∧ run machine used (working origin) = ⟨some (.core (.done ready)), endpoint⟩ := by
  obtain ⟨used, bounded, lifted⟩ := run_to_boundary Core.machine machine Control.core coreDone?
    core_absorbs core_step ticks (Core.initial origin) (by rw [execution]; rfl)
  rw [execution] at lifted
  exact ⟨used, bounded, lifted⟩

def coefficient : Nat := RootResetNestedClockCoreProbe.coefficient + 2

theorem all_input (origin : Cursor) :
    ∃ ticks ready endpoint, ticks ≤ coefficient * origin.focus.size ∧
      run machine ticks (initial origin) = ⟨some (.done ready), endpoint⟩ ∧
      (if ready then endpoint.rdx?.isSome = true else endpoint = origin) := by
  rcases origin with ⟨source, parents⟩
  cases source with
  | s => exact ⟨1, false, ⟨.s, parents⟩, by simp [coefficient, Term.size], rfl, rfl⟩
  | app core environment =>
      let inside : Cursor := ⟨core, .left environment :: parents⟩
      obtain ⟨ticks, ready, endpoint, bounded, execution, answer⟩ :=
        RootResetNestedClockCoreProbe.all_input inside rfl
      obtain ⟨used, usedBound, actual⟩ := core_runs inside endpoint ticks ready execution
      have bound : 1 + (used + 1) ≤ coefficient * (Term.app core environment).size := by
        have sourceSize : core.size ≤ (Term.app core environment).size := by
          change core.size ≤ core.size + environment.size + 1
          exact Nat.le_trans (Nat.le_add_right _ _) (Nat.le_succ _)
        have coreBound := Nat.le_trans (Nat.le_trans usedBound bounded)
          (Nat.mul_le_mul_left RootResetNestedClockCoreProbe.coefficient sourceSize)
        have constant : 2 ≤ 2 * (Term.app core environment).size := by
          simpa only [Nat.mul_one] using Nat.mul_le_mul_left 2 (Term.size_pos (Term.app core environment))
        simpa only [coefficient, Nat.add_mul, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using
          Nat.add_le_add coreBound constant
      cases ready with
      | false =>
          change endpoint = inside at answer
          subst endpoint
          refine ⟨1 + (used + 1), false, ⟨.app core environment, parents⟩, bound, ?_, rfl⟩
          rw [run_add]
          change run machine (used + 1) (working inside) = _
          rw [run_add, actual]
          rfl
      | true =>
          refine ⟨1 + (used + 1), true, endpoint, bound, ?_, answer⟩
          rw [run_add]
          change run machine (used + 1) (working inside) = _
          rw [run_add, actual]
          rfl

theorem mutationCount_zero (configuration : Configuration Control) : mutationCount machine configuration = 0 := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => rfl
  | some state =>
      rw [← commandCount_eq_mutationCount]
      cases state with
      | enter => cases nodeEq : Probe.observeNode cursor <;> simp only [machine, transition, nodeEq, commandCount]
      | done ready => rfl
      | core state =>
          have zero := RootResetNestedClockCoreProbe.mutationCount_zero ⟨some state, cursor⟩
          cases state with
          | done ready => cases ready <;> rfl
          | descending _ | reading _ | ascending _ =>
              simp only [machine, transition, commandCount_map]
              rw [commandCount_eq_mutationCount]
              exact zero

theorem runMutationCount_zero (ticks : Nat) (configuration : Configuration Control) :
    runMutationCount machine ticks configuration = 0 := by
  induction ticks generalizing configuration with
  | zero => rfl
  | succ ticks ih => rw [runMutationCount, mutationCount_zero, ih, Nat.zero_add]

theorem erase_run (ticks : Nat) (configuration : Configuration Control) :
    (run machine ticks configuration).cursor.erase = configuration.cursor.erase := by
  have projected := run_projects_stepsN machine ticks configuration
  rw [runMutationCount_zero] at projected
  exact (StepsN.eq_of_zero projected).symm

theorem done_absorbs (ready : Bool) (origin : Cursor) (ticks : Nat) :
    run machine ticks ⟨some (.done ready), origin⟩ = ⟨some (.done ready), origin⟩ := by
  induction ticks with
  | zero => rfl
  | succ ticks ih => exact ih

end PureSFormal.Research.RootResetNestedClockGrowthProbe
