import PureSFormal.Research.RootResetMixedLocalFragment

/-!
# Sequential finite probes

A worker has only finite control, an initial control position, and a finite
answer observation. A successful first worker ends the sequence. Failure
starts the second worker at the cursor returned by the first. Restoring
workers therefore compose without retaining an invocation cursor at runtime.
-/
namespace PureSFormal.Research.RootResetProbeSequence
open PureSFormal.PureS
open FiniteController RootResetCarrierNonemptyProbe

structure Worker where
  Control : Type
  machine : Machine Control
  start : Control
  answer? : Control → Option Bool

def Worker.initial (worker : Worker) (origin : Cursor) : Configuration worker.Control :=
  ⟨some worker.start, origin⟩

def Worker.Terminal (worker : Worker) : Prop :=
  ∀ state ready, worker.answer? state = some ready → ∀ origin ticks,
    run worker.machine ticks ⟨some state, origin⟩ = ⟨some state, origin⟩

def Worker.ReadOnly (worker : Worker) : Prop :=
  ∀ configuration, mutationCount worker.machine configuration = 0

def Worker.Restoring (worker : Worker) (coefficient : Nat) : Prop :=
  ∀ origin, ∃ ticks ready endpoint state,
    ticks ≤ coefficient * origin.erase.size ∧
    run worker.machine ticks (worker.initial origin) = ⟨some state, endpoint⟩ ∧
    worker.answer? state = some ready ∧
    (if ready then endpoint.rdx?.isSome = true else endpoint = origin)

def ended? (worker : Worker) (configuration : Configuration worker.Control) : Bool :=
  match configuration.control with
  | none => false
  | some state => (worker.answer? state).isSome

theorem terminal_absorbs (worker : Worker) (terminal : worker.Terminal)
    (configuration : Configuration worker.Control) (ended : ended? worker configuration = true)
    (ticks : Nat) : run worker.machine ticks configuration = configuration := by
  rcases configuration with ⟨runtime, origin⟩
  cases runtime with
  | none => cases ended
  | some state =>
      cases answer : worker.answer? state with
      | none => simp only [ended?, answer, Option.isSome_none] at ended; cases ended
      | some ready => exact terminal state ready answer origin ticks

inductive Control (first second : Worker) where
  | first (pc : first.Control)
  | second (pc : second.Control)
  | done (ready : Bool)

def cover (first second : Worker) : List (Control first second) :=
  [.done false, .done true] ++ first.machine.states.map Control.first ++ second.machine.states.map Control.second

theorem covers (first second : Worker) (state : Control first second) : state ∈ cover first second := by
  simp only [cover, List.mem_append]
  cases state with
  | done ready =>
      apply Or.inl; apply Or.inl
      cases ready <;> simp only [List.mem_cons, List.mem_singleton, true_or, or_true]
  | first pc => exact Or.inl (Or.inr (RootResetCompletedLocalPatterns.map_member _ (first.machine.covers pc)))
  | second pc => exact Or.inr (RootResetCompletedLocalPatterns.map_member _ (second.machine.covers pc))

def transition (first second : Worker) (state : Control first second)
    (node : Probe.NodeKind) (incoming : Probe.Incoming) : Command (Control first second) :=
  match state with
  | .first pc => match first.answer? pc with
    | some true => .stay (.done true)
    | some false => .stay (.second second.start)
    | none => mapCommand Control.first (first.machine.transition pc node incoming)
  | .second pc => match second.answer? pc with
    | some ready => .stay (.done ready)
    | none => mapCommand Control.second (second.machine.transition pc node incoming)
  | .done ready => .stay (.done ready)

def machine (first second : Worker) : Machine (Control first second) :=
  ⟨fun _ => cover first second, covers first second, transition first second⟩

def answer? {first second : Worker} : Control first second → Option Bool
  | .done ready => some ready
  | _ => none

def worker (first second : Worker) : Worker :=
  ⟨Control first second, machine first second, .first first.start, answer?⟩

def initial (first second : Worker) (origin : Cursor) : Configuration (Control first second) :=
  (worker first second).initial origin

def secondInitial (first second : Worker) (origin : Cursor) : Configuration (Control first second) :=
  liftConfiguration Control.second (second.initial origin)

theorem first_step (first second : Worker) (configuration : Configuration first.Control)
    (running : ended? first configuration = false) :
    step (machine first second) (liftConfiguration Control.first configuration) =
      liftConfiguration Control.first (step first.machine configuration) := by
  apply step_lift
  intro state current
  rcases configuration with ⟨runtime, origin⟩
  have equal : runtime = some state := current
  subst runtime
  cases result : first.answer? state with
  | none => simp only [machine, transition, result]
  | some ready => simp only [ended?, result, Option.isSome_some] at running; cases running

theorem second_step (first second : Worker) (configuration : Configuration second.Control)
    (running : ended? second configuration = false) :
    step (machine first second) (liftConfiguration Control.second configuration) =
      liftConfiguration Control.second (step second.machine configuration) := by
  apply step_lift
  intro state current
  rcases configuration with ⟨runtime, origin⟩
  have equal : runtime = some state := current
  subst runtime
  cases result : second.answer? state with
  | none => simp only [machine, transition, result]
  | some ready => simp only [ended?, result, Option.isSome_some] at running; cases running

theorem first_runs (first second : Worker) (terminal : first.Terminal)
    (origin endpoint : Cursor) (ticks : Nat) (state : first.Control) (ready : Bool)
    (execution : run first.machine ticks (first.initial origin) = ⟨some state, endpoint⟩)
    (answered : first.answer? state = some ready) :
    ∃ used, used ≤ ticks ∧ run (machine first second) (used + 1) (initial first second origin) =
      if ready then ⟨some (.done true), endpoint⟩ else secondInitial first second endpoint := by
  obtain ⟨used, bounded, lifted⟩ := run_to_boundary first.machine (machine first second) Control.first (ended? first)
    (terminal_absorbs first terminal) (first_step first second) ticks (first.initial origin)
    (by rw [execution]; simp only [ended?, answered, Option.isSome_some])
  rw [execution] at lifted
  refine ⟨used, bounded, ?_⟩
  change run (machine first second) (used + 1) (liftConfiguration Control.first (first.initial origin)) = _
  rw [run_add, lifted]
  change run (machine first second) 1 ⟨some (.first state), endpoint⟩ = _
  cases ready <;> simp only [run, step, machine, transition, answered, ↓reduceIte] <;> rfl

theorem second_runs (first second : Worker) (terminal : second.Terminal)
    (origin endpoint : Cursor) (ticks : Nat) (state : second.Control) (ready : Bool)
    (execution : run second.machine ticks (second.initial origin) = ⟨some state, endpoint⟩)
    (answered : second.answer? state = some ready) :
    ∃ used, used ≤ ticks ∧ run (machine first second) (used + 1) (secondInitial first second origin) =
      ⟨some (.done ready), endpoint⟩ := by
  obtain ⟨used, bounded, lifted⟩ := run_to_boundary second.machine (machine first second) Control.second (ended? second)
    (terminal_absorbs second terminal) (second_step first second) ticks (second.initial origin)
    (by rw [execution]; simp only [ended?, answered, Option.isSome_some])
  rw [execution] at lifted
  refine ⟨used, bounded, ?_⟩
  rw [secondInitial, run_add, lifted]
  change run (machine first second) 1 ⟨some (.second state), endpoint⟩ = _
  simp only [run, step, machine, transition, answered]

theorem done_absorbs (first second : Worker) (ready : Bool) (origin : Cursor) (ticks : Nat) :
    run (machine first second) ticks ⟨some (.done ready), origin⟩ = ⟨some (.done ready), origin⟩ := by
  induction ticks with
  | zero => rfl
  | succ ticks ih => exact ih

theorem terminal (first second : Worker) : (worker first second).Terminal := by
  intro state ready answered origin ticks
  cases state with
  | first pc => cases answered
  | second pc => cases answered
  | done result => exact done_absorbs first second result origin ticks

theorem terminal_stay (first second : Worker) (state : (worker first second).Control)
    (ended : ((worker first second).answer? state).isSome = true)
    (node : Probe.NodeKind) (incoming : Probe.Incoming) :
    (worker first second).machine.transition state node incoming = .stay state := by
  cases state with
  | first pc => cases ended
  | second pc => cases ended
  | done ready => rfl

theorem combined_bound (origin : Cursor) (firstCoefficient secondCoefficient first second handoffs : Nat)
    (firstBound : first ≤ firstCoefficient * origin.erase.size)
    (secondBound : second ≤ secondCoefficient * origin.erase.size) (handoffBound : handoffs ≤ 2) :
    first + second + handoffs ≤ (firstCoefficient + secondCoefficient + 2) * origin.erase.size := by
  have constants : handoffs ≤ 2 * origin.erase.size := Nat.le_trans handoffBound
    (by simpa only [Nat.mul_one] using Nat.mul_le_mul_left 2 (Term.size_pos origin.erase))
  simpa only [Nat.add_mul] using Nat.add_le_add (Nat.add_le_add firstBound secondBound) constants

theorem restoring (first second : Worker) (firstCoefficient secondCoefficient : Nat)
    (firstTerminal : first.Terminal) (secondTerminal : second.Terminal)
    (firstRestores : first.Restoring firstCoefficient) (secondRestores : second.Restoring secondCoefficient) :
    (worker first second).Restoring (firstCoefficient + secondCoefficient + 2) := by
  intro origin
  obtain ⟨firstTicks, ready, endpoint, firstState, firstBound, firstExecution, firstAnswer, facts⟩ := firstRestores origin
  obtain ⟨firstUsed, firstUsedBound, firstActual⟩ := first_runs first second firstTerminal origin endpoint firstTicks firstState ready firstExecution firstAnswer
  cases ready with
  | true =>
      refine ⟨firstUsed + 1, true, endpoint, .done true, ?_, firstActual, rfl, facts⟩
      simpa only [Nat.add_zero] using combined_bound origin firstCoefficient secondCoefficient firstUsed 0 1
        (Nat.le_trans firstUsedBound firstBound) (Nat.zero_le _) (by decide)
  | false =>
      have equal : endpoint = origin := facts
      subst endpoint
      obtain ⟨secondTicks, ready, endpoint, secondState, secondBound, secondExecution, secondAnswer, facts⟩ := secondRestores origin
      obtain ⟨secondUsed, secondUsedBound, secondActual⟩ := second_runs first second secondTerminal origin endpoint secondTicks secondState ready secondExecution secondAnswer
      refine ⟨firstUsed + 1 + (secondUsed + 1), ready, endpoint, .done ready, ?_, ?_, rfl, facts⟩
      · simpa only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using combined_bound origin firstCoefficient secondCoefficient
          firstUsed secondUsed 2 (Nat.le_trans firstUsedBound firstBound) (Nat.le_trans secondUsedBound secondBound) (Nat.le_refl _)
      · change run (machine first second) _ (initial first second origin) = _
        rw [run_add, firstActual]
        exact secondActual

theorem readOnly (first second : Worker) (firstSafe : first.ReadOnly) (secondSafe : second.ReadOnly) :
    (worker first second).ReadOnly := by
  intro configuration
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => rfl
  | some state =>
      rw [← commandCount_eq_mutationCount]
      cases state with
      | done ready => rfl
      | first pc =>
          have zero := firstSafe ⟨some pc, cursor⟩
          rw [← commandCount_eq_mutationCount] at zero
          cases result : first.answer? pc with
          | none => simp only [worker, machine, transition, result, commandCount_map]; exact zero
          | some ready => cases ready <;> simp only [worker, machine, transition, result] <;> rfl
      | second pc =>
          have zero := secondSafe ⟨some pc, cursor⟩
          rw [← commandCount_eq_mutationCount] at zero
          cases result : second.answer? pc with
          | none => simp only [worker, machine, transition, result, commandCount_map]; exact zero
          | some ready => simp only [worker, machine, transition, result]; rfl

theorem Worker.runMutationCount_zero (worker : Worker) (safe : worker.ReadOnly)
    (ticks : Nat) (configuration : Configuration worker.Control) : runMutationCount worker.machine ticks configuration = 0 := by
  induction ticks generalizing configuration with
  | zero => rfl
  | succ ticks ih => rw [runMutationCount, safe, ih, Nat.zero_add]

theorem Worker.erase_run (worker : Worker) (safe : worker.ReadOnly)
    (ticks : Nat) (configuration : Configuration worker.Control) :
    (run worker.machine ticks configuration).cursor.erase = configuration.cursor.erase := by
  have projected := run_projects_stepsN worker.machine ticks configuration
  rw [worker.runMutationCount_zero safe] at projected
  exact (StepsN.eq_of_zero projected).symm

theorem first_selected (first second : Worker) (terminal : first.Terminal)
    (origin endpoint : Cursor) (ticks : Nat) (state : first.Control)
    (execution : run first.machine ticks (first.initial origin) = ⟨some state, endpoint⟩)
    (answered : first.answer? state = some true) :
    ∃ used, used ≤ ticks + 1 ∧ run (machine first second) used (initial first second origin) =
      ⟨some (.done true), endpoint⟩ := by
  obtain ⟨used, bounded, actual⟩ := first_runs first second terminal origin endpoint ticks state true execution answered
  exact ⟨used + 1, Nat.add_le_add_right bounded 1, actual⟩

theorem second_selected (first second : Worker) (firstTerminal : first.Terminal) (secondTerminal : second.Terminal)
    (origin endpoint : Cursor) (firstTicks secondTicks : Nat) (firstState : first.Control) (secondState : second.Control)
    (firstExecution : run first.machine firstTicks (first.initial origin) = ⟨some firstState, origin⟩)
    (firstAnswer : first.answer? firstState = some false)
    (secondExecution : run second.machine secondTicks (second.initial origin) = ⟨some secondState, endpoint⟩)
    (secondAnswer : second.answer? secondState = some true) :
    ∃ used, used ≤ firstTicks + secondTicks + 2 ∧ run (machine first second) used (initial first second origin) =
      ⟨some (.done true), endpoint⟩ := by
  obtain ⟨firstUsed, firstBound, firstActual⟩ := first_runs first second firstTerminal origin origin firstTicks firstState false firstExecution firstAnswer
  obtain ⟨secondUsed, secondBound, secondActual⟩ := second_runs first second secondTerminal origin endpoint secondTicks secondState true secondExecution secondAnswer
  refine ⟨firstUsed + 1 + (secondUsed + 1), ?_, ?_⟩
  · simpa only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using Nat.add_le_add_right (Nat.add_le_add firstBound secondBound) 2
  · rw [run_add, firstActual]
    exact secondActual

end PureSFormal.Research.RootResetProbeSequence
