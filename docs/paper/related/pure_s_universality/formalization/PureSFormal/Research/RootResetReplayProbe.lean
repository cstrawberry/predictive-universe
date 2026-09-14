import PureSFormal.Research.RootResetReadonlySelector
import PureSFormal.Research.RootResetProbeSequence

/-! An explicit finite root-ascent pass before replaying a root-certified
read-only worker. The incoming side controls ascent; no root cursor is saved. -/
namespace PureSFormal.Research.RootResetReplayProbe
open PureSFormal.PureS
open FiniteController RootResetCarrierNonemptyProbe RootResetReadonlySelector

inductive Control (α : Type) where
  | reset
  | work (state : α)

def transition (spec : ProbeSpec α) : Control α → Probe.NodeKind → Probe.Incoming → Command (Control α)
  | .reset, _, .root => .stay (.work spec.start)
  | .reset, _, _ => .exec .U .reset
  | .work state, node, incoming => mapCommand .work (spec.machine.transition state node incoming)

def cover (spec : ProbeSpec α) : List (Control α) := .reset :: spec.machine.states.map .work

theorem covers (spec : ProbeSpec α) (state : Control α) : state ∈ cover spec := by
  cases state with
  | reset => exact List.Mem.head _
  | work state => exact List.Mem.tail _ (RootResetCompletedLocalPatterns.map_member _ (spec.machine.covers state))

def machine (spec : ProbeSpec α) : Machine (Control α) := ⟨fun _ => cover spec, covers spec, transition spec⟩
def answer? (spec : ProbeSpec α) : Control α → Option Bool
  | .reset => none
  | .work state => spec.answer state

def worker (spec : ProbeSpec α) : RootResetProbeSequence.Worker :=
  ⟨Control α, machine spec, .reset, answer? spec⟩

theorem work_step (spec : ProbeSpec α) (configuration : Configuration α) :
    step (machine spec) (liftConfiguration Control.work configuration) =
      liftConfiguration Control.work (step spec.machine configuration) := by
  apply step_lift
  intro state _
  rfl

theorem work_runs (spec : ProbeSpec α) (ticks : Nat) (configuration : Configuration α) :
    run (machine spec) ticks (liftConfiguration Control.work configuration) =
      liftConfiguration Control.work (run spec.machine ticks configuration) := by
  induction ticks generalizing configuration with
  | zero => rfl
  | succ ticks ih => rw [run_succ, work_step, ih]; rfl

theorem ascent (spec : ProbeSpec α) (parents : List ParentFrame) (focus : Term) :
    run (machine spec) parents.length ⟨some .reset, ⟨focus, parents⟩⟩ =
      ⟨some .reset, Cursor.atRoot (Cursor.rebuild parents focus)⟩ := by
  induction parents generalizing focus with
  | nil => rfl
  | cons frame parents ih =>
      rw [List.length_cons, run_succ]
      cases frame with
      | left sibling => exact ih (.app focus sibling)
      | right sibling => exact ih (.app sibling focus)

theorem enters_root (spec : ProbeSpec α) (origin : Cursor) :
    run (machine spec) (origin.parents.length + 1) ((worker spec).initial origin) =
      liftConfiguration Control.work ⟨some spec.start, Cursor.atRoot origin.erase⟩ := by
  change run (machine spec) _ ⟨some .reset, origin⟩ = _
  rcases origin with ⟨focus, parents⟩
  rw [run_add, ascent]
  rfl

theorem readOnly (spec : ProbeSpec α) : (worker spec).ReadOnly := by
  intro configuration
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => rfl
  | some state =>
      rw [← commandCount_eq_mutationCount]
      cases state with
      | reset => cases Probe.observeIncoming cursor <;> rfl
      | work state =>
          change commandCount cursor (mapCommand Control.work _) = 0
          rw [commandCount_map, commandCount_eq_mutationCount]
          exact spec.mutation_zero _

theorem terminal_stay (spec : ProbeSpec α) (state : Control α) (node : Probe.NodeKind) (incoming : Probe.Incoming)
    (terminal : (answer? spec state).isSome = true) : (machine spec).transition state node incoming = .stay state := by
  cases state with
  | reset => cases terminal
  | work state =>
      change mapCommand Control.work (spec.machine.transition state node incoming) = _
      rw [spec.terminal_stay state node incoming terminal]
      rfl

theorem terminal (spec : ProbeSpec α) : (worker spec).Terminal := by
  intro state ready answered origin ticks
  change answer? spec state = some ready at answered
  have stopped := terminal_stay spec state (Probe.observeNode origin) (Probe.observeIncoming origin) (by rw [answered]; rfl)
  induction ticks with
  | zero => rfl
  | succ ticks ih => rw [run_succ]; simpa only [worker, step, stopped] using ih

def coefficient (spec : ProbeSpec α) : Nat := spec.coefficient + 1

theorem all_input (spec : ProbeSpec α) (origin : Cursor) :
    ∃ ticks state endpoint, ticks ≤ coefficient spec * (origin.erase.size + 1) ∧
      run (worker spec).machine ticks ((worker spec).initial origin) = ⟨some state, endpoint⟩ ∧
      ((worker spec).answer? state).isSome = true ∧ endpoint.erase = origin.erase ∧
      ((worker spec).answer? state = some true → endpoint.rdx?.isSome = true) := by
  obtain ⟨ticks, state, endpoint, bounded, execution, answered, preserved, sound⟩ := spec.all_input origin.erase
  have depth := RootResetProgressTotality.depth_succ_le_erase_size origin.focus origin.parents
  have ascentBound : origin.parents.length + 1 ≤ origin.erase.size + 1 := Nat.le_trans depth (Nat.le_succ _)
  refine ⟨origin.parents.length + 1 + ticks, .work state, endpoint, ?_, ?_, answered, preserved, sound⟩
  · have total := Nat.add_le_add bounded ascentBound
    simpa only [coefficient, Nat.add_mul, Nat.one_mul, Nat.add_comm] using total
  · exact (run_add (machine spec) (origin.parents.length + 1) ticks _).trans
      ((congrArg (run (machine spec) ticks) (enters_root spec origin)).trans
        ((work_runs spec ticks _).trans (congrArg (liftConfiguration Control.work) execution)))

/-- Exact replay forwarding, without an all-input certificate as an extra
runtime argument. -/
theorem generated (spec : ProbeSpec α) (origin : Cursor) (ticks : Nat) (state : α) (endpoint : Cursor)
    (execution : run spec.machine ticks ⟨some spec.start, Cursor.atRoot origin.erase⟩ = ⟨some state, endpoint⟩) :
    run (worker spec).machine (origin.parents.length + 1 + ticks) ((worker spec).initial origin) =
      ⟨some (.work state), endpoint⟩ := by
  exact (run_add (machine spec) (origin.parents.length + 1) ticks _).trans
    ((congrArg (run (machine spec) ticks) (enters_root spec origin)).trans
      ((work_runs spec ticks _).trans (congrArg (liftConfiguration Control.work) execution)))

end PureSFormal.Research.RootResetReplayProbe
