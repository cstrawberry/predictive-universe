import PureSFormal.Research.RootResetNestedFrameAgreement
import PureSFormal.Research.RootResetNestedClockProbe

/-!
Scoped finite FRAME priority followed by CLOCK at an endpoint. The caller
must establish the intended response/admission priority before invoking it.
The all-input bound and exact failure return hold independently of that
generated-phase agreement obligation.
-/
namespace PureSFormal.Research.RootResetNestedFrameClockProbe
open PureSFormal.PureS
open FiniteController RootResetCarrierNonemptyProbe

namespace Frame
abbrev Control := RootResetNestedFrameProbe.Control
abbrev machine := RootResetNestedFrameProbe.machine
abbrev initial := RootResetNestedFrameProbe.initial
end Frame
namespace Clock
abbrev Control := RootResetNestedClockProbe.Control
abbrev machine := RootResetNestedClockProbe.machine
abbrev initial := RootResetNestedClockProbe.initial
end Clock

inductive Control where
  | frame (pc : Frame.Control)
  | clock (pc : Clock.Control)
  | done (ready : Bool)

def cover : List Control := [.done false, .done true] ++ Frame.machine.states.map .frame ++ Clock.machine.states.map .clock

theorem covers (state : Control) : state ∈ cover := by
  simp only [cover, List.mem_append]
  cases state with
  | done ready =>
      apply Or.inl; apply Or.inl
      cases ready <;> simp only [List.mem_cons, List.mem_singleton, or_true, true_or]
  | frame pc => exact Or.inl (Or.inr (RootResetCompletedLocalPatterns.map_member _ (Frame.machine.covers pc)))
  | clock pc => exact Or.inr (RootResetCompletedLocalPatterns.map_member _ (Clock.machine.covers pc))

def transition (state : Control) (node : Probe.NodeKind) (incoming : Probe.Incoming) : Command Control :=
  match state with
  | .frame (.done false) => .stay (.clock (.first (.reading ⟨RootResetEdgeFragment.familyCode RootResetNestedClockFirstPass.rows,
      ProbeCompiler.Control.self_mem_nodes _⟩)))
  | .frame (.done true) => .stay (.done true)
  | .frame pc => mapCommand .frame (Frame.machine.transition pc node incoming)
  | .clock (.done ready) => .stay (.done ready)
  | .clock pc => mapCommand .clock (Clock.machine.transition pc node incoming)
  | .done ready => .stay (.done ready)

def machine : Machine Control := ⟨fun _ => cover, covers, transition⟩
def initial (origin : Cursor) : Configuration Control := liftConfiguration .frame (Frame.initial origin)
def clock (origin : Cursor) : Configuration Control := liftConfiguration .clock (Clock.initial origin)

def frameDone? (configuration : Configuration Frame.Control) : Bool :=
  match configuration.control with | some (.done _) => true | _ => false
def clockDone? (configuration : Configuration Clock.Control) : Bool :=
  match configuration.control with | some (.done _) => true | _ => false

theorem frame_absorbs (configuration : Configuration Frame.Control) (ended : frameDone? configuration = true)
    (ticks : Nat) : run Frame.machine ticks configuration = configuration := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => cases ended
  | some state => cases state with
    | done ready => exact RootResetNestedFrameProbe.done_absorbs ready cursor ticks
    | descending _ | reading _ | ascending _ => cases ended

theorem clock_absorbs (configuration : Configuration Clock.Control) (ended : clockDone? configuration = true)
    (ticks : Nat) : run Clock.machine ticks configuration = configuration := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => cases ended
  | some state => cases state with
    | done ready => exact RootResetNestedClockProbe.done_absorbs ready cursor ticks
    | first _ | second _ | growth _ => cases ended

theorem frame_step (configuration : Configuration Frame.Control) (running : frameDone? configuration = false) :
    step machine (liftConfiguration Control.frame configuration) = liftConfiguration Control.frame (step Frame.machine configuration) := by
  apply step_lift
  intro state current
  rcases configuration with ⟨runtime, cursor⟩
  have equal : runtime = some state := current
  subst runtime
  cases state with
  | done _ => cases running
  | descending _ | reading _ | ascending _ => rfl

theorem clock_step (configuration : Configuration Clock.Control) (running : clockDone? configuration = false) :
    step machine (liftConfiguration Control.clock configuration) = liftConfiguration Control.clock (step Clock.machine configuration) := by
  apply step_lift
  intro state current
  rcases configuration with ⟨runtime, cursor⟩
  have equal : runtime = some state := current
  subst runtime
  cases state with
  | done _ => cases running
  | first _ | second _ | growth _ => rfl

theorem frame_runs (origin endpoint : Cursor) (ticks : Nat) (ready : Bool)
    (execution : run Frame.machine ticks (Frame.initial origin) = ⟨some (.done ready), endpoint⟩) :
    ∃ used, used ≤ ticks ∧ run machine (used + 1) (initial origin) =
      if ready then ⟨some (.done true), endpoint⟩ else clock endpoint := by
  obtain ⟨used, bounded, lifted⟩ := run_to_boundary Frame.machine machine Control.frame frameDone?
    frame_absorbs frame_step ticks (Frame.initial origin) (by rw [execution]; rfl)
  rw [execution] at lifted
  refine ⟨used, bounded, ?_⟩
  change run machine (used + 1) (liftConfiguration Control.frame (Frame.initial origin)) = _
  rw [run_add, lifted]
  cases ready <;> rfl

theorem clock_runs (origin endpoint : Cursor) (ticks : Nat) (ready : Bool)
    (execution : run Clock.machine ticks (Clock.initial origin) = ⟨some (.done ready), endpoint⟩) :
    ∃ used, used ≤ ticks ∧ run machine (used + 1) (clock origin) = ⟨some (.done ready), endpoint⟩ := by
  obtain ⟨used, bounded, lifted⟩ := run_to_boundary Clock.machine machine Control.clock clockDone?
    clock_absorbs clock_step ticks (Clock.initial origin) (by rw [execution]; rfl)
  rw [execution] at lifted
  refine ⟨used, bounded, ?_⟩
  change run machine (used + 1) (liftConfiguration Control.clock (Clock.initial origin)) = _
  rw [run_add, lifted]
  rfl

def coefficient : Nat := RootResetNestedFrameProbe.coefficient + RootResetNestedClockProbe.coefficient + 2

theorem combined_bound (source : Term) (frame clock handoffs : Nat) (handoffBound : handoffs ≤ 2)
    (frameBound : frame ≤ RootResetNestedFrameProbe.coefficient * source.size)
    (clockBound : clock ≤ RootResetNestedClockProbe.coefficient * source.size) :
    frame + clock + handoffs ≤ coefficient * source.size := by
  have constant : handoffs ≤ 2 * source.size := Nat.le_trans handoffBound
    (by simpa only [Nat.mul_one] using Nat.mul_le_mul_left 2 (Term.size_pos source))
  simpa only [coefficient, Nat.add_mul] using Nat.add_le_add (Nat.add_le_add frameBound clockBound) constant

theorem all_input (origin : Cursor) (boundary : RootResetNestedFramePatterns.rightParent? origin = false) :
    ∃ ticks ready endpoint, ticks ≤ coefficient * origin.focus.size ∧
      run machine ticks (initial origin) = ⟨some (.done ready), endpoint⟩ ∧
      (if ready then endpoint.rdx?.isSome = true else endpoint = origin) := by
  obtain ⟨frameTicks, ready, endpoint, frameBound, frameRun, facts⟩ := RootResetNestedFrameProbe.all_input origin boundary
  obtain ⟨frameUsed, frameUsedBound, frameActual⟩ := frame_runs origin endpoint frameTicks ready frameRun
  cases ready with
  | true =>
      refine ⟨frameUsed + 1, true, endpoint, ?_, frameActual, facts⟩
      simpa only [Nat.add_zero] using combined_bound origin.focus frameUsed 0 1 (by decide)
        (Nat.le_trans frameUsedBound frameBound) (Nat.zero_le _)
  | false =>
      have equal : endpoint = origin := facts
      subst endpoint
      obtain ⟨clockTicks, ready, endpoint, clockBound, clockRun, facts⟩ := RootResetNestedClockProbe.all_input origin
      obtain ⟨clockUsed, clockUsedBound, clockActual⟩ := clock_runs origin endpoint clockTicks ready clockRun
      refine ⟨frameUsed + 1 + (clockUsed + 1), ready, endpoint, ?_, ?_, facts⟩
      · simpa only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using
          combined_bound origin.focus frameUsed clockUsed 2 (Nat.le_refl _) (Nat.le_trans frameUsedBound frameBound)
            (Nat.le_trans clockUsedBound clockBound)
      · rw [run_add, frameActual]
        exact clockActual

theorem mutationCount_zero (configuration : Configuration Control) : mutationCount machine configuration = 0 := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => rfl
  | some state =>
      rw [← commandCount_eq_mutationCount]
      cases state with
      | done _ => rfl
      | frame pc =>
          have zero := RootResetNestedFrameProbe.mutationCount_zero ⟨some pc, cursor⟩
          cases pc with
          | done ready => cases ready <;> rfl
          | descending _ | reading _ | ascending _ =>
              simp only [machine, transition, commandCount_map]
              rw [commandCount_eq_mutationCount]
              exact zero
      | clock pc =>
          have zero := RootResetNestedClockProbe.mutationCount_zero ⟨some pc, cursor⟩
          cases pc with
          | done _ => rfl
          | first _ | second _ | growth _ =>
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

end PureSFormal.Research.RootResetNestedFrameClockProbe
