import PureSFormal.Research.RootResetProbeSequence

/-! Finite conditional composition for restored Boolean queries. -/
namespace PureSFormal.Research.RootResetProbeBranch
open PureSFormal.PureS
open FiniteController RootResetCarrierNonemptyProbe
open RootResetProbeSequence (Worker ended? terminal_absorbs)

inductive Control (test yes no : Worker) where
  | testing (pc : test.Control)
  | positive (pc : yes.Control)
  | negative (pc : no.Control)
  | done (ready : Bool)
def cover (test yes no : Worker) : List (Control test yes no) :=
  [.done false, .done true] ++ test.machine.states.map .testing ++ yes.machine.states.map .positive ++ no.machine.states.map .negative
theorem covers (test yes no : Worker) (state : Control test yes no) : state ∈ cover test yes no := by
  simp only [cover, List.mem_append]
  cases state with
  | done ready =>
      apply Or.inl; apply Or.inl; apply Or.inl
      cases ready <;> simp only [List.mem_cons, List.mem_singleton, true_or, or_true]
  | testing pc => exact Or.inl (Or.inl (Or.inr (RootResetCompletedLocalPatterns.map_member _ (test.machine.covers pc))))
  | positive pc => exact Or.inl (Or.inr (RootResetCompletedLocalPatterns.map_member _ (yes.machine.covers pc)))
  | negative pc => exact Or.inr (RootResetCompletedLocalPatterns.map_member _ (no.machine.covers pc))
def transition (test yes no : Worker) (state : Control test yes no) (node : Probe.NodeKind) (incoming : Probe.Incoming) : Command (Control test yes no) :=
  match state with
  | .testing pc => match test.answer? pc with
    | none => mapCommand .testing (test.machine.transition pc node incoming)
    | some true => .stay (.positive yes.start)
    | some false => .stay (.negative no.start)
  | .positive pc => match yes.answer? pc with
    | none => mapCommand .positive (yes.machine.transition pc node incoming)
    | some ready => .stay (.done ready)
  | .negative pc => match no.answer? pc with
    | none => mapCommand .negative (no.machine.transition pc node incoming)
    | some ready => .stay (.done ready)
  | .done ready => .stay (.done ready)
def machine (test yes no : Worker) : Machine (Control test yes no) := ⟨fun _ => cover test yes no, covers test yes no, transition test yes no⟩
def answer? {test yes no : Worker} : Control test yes no → Option Bool
  | .done ready => some ready
  | _ => none
def worker (test yes no : Worker) : Worker := ⟨Control test yes no, machine test yes no, .testing test.start, answer?⟩
def positive (test yes no : Worker) (origin : Cursor) : Configuration (Control test yes no) := liftConfiguration .positive (yes.initial origin)
def negative (test yes no : Worker) (origin : Cursor) : Configuration (Control test yes no) := liftConfiguration .negative (no.initial origin)

theorem testing_step (test yes no : Worker) (configuration : Configuration test.Control) (running : ended? test configuration = false) :
    step (machine test yes no) (liftConfiguration Control.testing configuration) =
      liftConfiguration Control.testing (step test.machine configuration) := by
  apply step_lift
  intro state current
  rcases configuration with ⟨runtime, origin⟩
  have equal : runtime = some state := current
  subst runtime
  cases result : test.answer? state with
  | none => simp only [machine, transition, result]
  | some ready => simp only [ended?, result, Option.isSome_some] at running; cases running
theorem positive_step (test yes no : Worker) (configuration : Configuration yes.Control) (running : ended? yes configuration = false) :
    step (machine test yes no) (liftConfiguration Control.positive configuration) =
      liftConfiguration Control.positive (step yes.machine configuration) := by
  apply step_lift
  intro state current
  rcases configuration with ⟨runtime, origin⟩
  have equal : runtime = some state := current
  subst runtime
  cases result : yes.answer? state with
  | none => simp only [machine, transition, result]
  | some ready => simp only [ended?, result, Option.isSome_some] at running; cases running
theorem negative_step (test yes no : Worker) (configuration : Configuration no.Control) (running : ended? no configuration = false) :
    step (machine test yes no) (liftConfiguration Control.negative configuration) =
      liftConfiguration Control.negative (step no.machine configuration) := by
  apply step_lift
  intro state current
  rcases configuration with ⟨runtime, origin⟩
  have equal : runtime = some state := current
  subst runtime
  cases result : no.answer? state with
  | none => simp only [machine, transition, result]
  | some ready => simp only [ended?, result, Option.isSome_some] at running; cases running

theorem testing_runs (test yes no : Worker) (terminal : test.Terminal) (origin endpoint : Cursor)
    (ticks : Nat) (state : test.Control) (ready : Bool)
    (actual : run test.machine ticks (test.initial origin) = ⟨some state, endpoint⟩) (answered : test.answer? state = some ready) :
    ∃ used, used ≤ ticks ∧ run (machine test yes no) (used + 1) ((worker test yes no).initial origin) =
      if ready then positive test yes no endpoint else negative test yes no endpoint := by
  obtain ⟨used, bounded, lifted⟩ := run_to_boundary test.machine (machine test yes no) Control.testing (ended? test)
    (terminal_absorbs test terminal) (testing_step test yes no) ticks (test.initial origin)
    (by rw [actual]; simp only [ended?, answered, Option.isSome_some])
  rw [actual] at lifted
  refine ⟨used, bounded, ?_⟩
  change run (machine test yes no) (used + 1) (liftConfiguration Control.testing (test.initial origin)) = _
  rw [run_add, lifted]
  change run (machine test yes no) 1 ⟨some (.testing state), endpoint⟩ = _
  cases ready <;> simp only [run, step, machine, transition, answered, ↓reduceIte] <;> rfl
theorem positive_runs (test yes no : Worker) (terminal : yes.Terminal) (origin endpoint : Cursor)
    (ticks : Nat) (state : yes.Control) (ready : Bool)
    (actual : run yes.machine ticks (yes.initial origin) = ⟨some state, endpoint⟩) (answered : yes.answer? state = some ready) :
    ∃ used, used ≤ ticks ∧ run (machine test yes no) (used + 1) (positive test yes no origin) = ⟨some (.done ready), endpoint⟩ := by
  obtain ⟨used, bounded, lifted⟩ := run_to_boundary yes.machine (machine test yes no) Control.positive (ended? yes)
    (terminal_absorbs yes terminal) (positive_step test yes no) ticks (yes.initial origin)
    (by rw [actual]; simp only [ended?, answered, Option.isSome_some])
  rw [actual] at lifted
  refine ⟨used, bounded, ?_⟩
  rw [positive, run_add, lifted]
  change run (machine test yes no) 1 ⟨some (.positive state), endpoint⟩ = _
  simp only [run, step, machine, transition, answered]
theorem negative_runs (test yes no : Worker) (terminal : no.Terminal) (origin endpoint : Cursor)
    (ticks : Nat) (state : no.Control) (ready : Bool)
    (actual : run no.machine ticks (no.initial origin) = ⟨some state, endpoint⟩) (answered : no.answer? state = some ready) :
    ∃ used, used ≤ ticks ∧ run (machine test yes no) (used + 1) (negative test yes no origin) = ⟨some (.done ready), endpoint⟩ := by
  obtain ⟨used, bounded, lifted⟩ := run_to_boundary no.machine (machine test yes no) Control.negative (ended? no)
    (terminal_absorbs no terminal) (negative_step test yes no) ticks (no.initial origin)
    (by rw [actual]; simp only [ended?, answered, Option.isSome_some])
  rw [actual] at lifted
  refine ⟨used, bounded, ?_⟩
  rw [negative, run_add, lifted]
  change run (machine test yes no) 1 ⟨some (.negative state), endpoint⟩ = _
  simp only [run, step, machine, transition, answered]

theorem done_absorbs (test yes no : Worker) (ready : Bool) (origin : Cursor) (ticks : Nat) :
    run (machine test yes no) ticks ⟨some (.done ready), origin⟩ = ⟨some (.done ready), origin⟩ := by
  induction ticks with
  | zero => rfl
  | succ ticks ih => exact ih
theorem terminal (test yes no : Worker) : (worker test yes no).Terminal := by
  intro state ready answered origin ticks
  cases state with
  | testing _ | positive _ | negative _ => cases answered
  | done result => exact done_absorbs test yes no result origin ticks

def RestoringAt (worker : Worker) (coefficient : Nat) (origin : Cursor) : Prop :=
  ∃ ticks ready endpoint state, ticks ≤ coefficient * origin.erase.size ∧
    run worker.machine ticks (worker.initial origin) = ⟨some state, endpoint⟩ ∧
    worker.answer? state = some ready ∧ (if ready then endpoint.rdx?.isSome = true else endpoint = origin)
def QueryAt (worker : Worker) (coefficient : Nat) (origin : Cursor) : Prop :=
  ∃ ticks result state, ticks ≤ coefficient * origin.erase.size ∧
    run worker.machine ticks (worker.initial origin) = ⟨some state, origin⟩ ∧ worker.answer? state = some result

theorem restoring_at (test yes no : Worker) (testCoefficient yesCoefficient noCoefficient : Nat)
    (testTerminal : test.Terminal) (yesTerminal : yes.Terminal) (noTerminal : no.Terminal) (origin : Cursor)
    (query : QueryAt test testCoefficient origin) (positiveRestores : RestoringAt yes yesCoefficient origin)
    (negativeRestores : RestoringAt no noCoefficient origin) :
    RestoringAt (worker test yes no) (testCoefficient + yesCoefficient + noCoefficient + 2) origin := by
  obtain ⟨testTicks, result, testState, testBound, testRun, testAnswer⟩ := query
  obtain ⟨testUsed, testUsedBound, testActual⟩ := testing_runs test yes no testTerminal origin origin testTicks testState result testRun testAnswer
  have paid (ticks coefficient : Nat) (bounded : ticks ≤ coefficient * origin.erase.size)
      (allowance : coefficient ≤ yesCoefficient + noCoefficient) :
      testUsed + 1 + (ticks + 1) ≤ (testCoefficient + yesCoefficient + noCoefficient + 2) * origin.erase.size := by
    have total := RootResetProbeSequence.combined_bound origin testCoefficient (yesCoefficient + noCoefficient) testUsed ticks 2
      (Nat.le_trans testUsedBound testBound) (Nat.le_trans bounded (Nat.mul_le_mul_right _ allowance)) (Nat.le_refl _)
    simpa only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using total
  cases result with
  | true =>
      obtain ⟨ticks, ready, endpoint, state, bounded, actual, answered, facts⟩ := positiveRestores
      obtain ⟨used, usedBound, usedRun⟩ := positive_runs test yes no yesTerminal origin endpoint ticks state ready actual answered
      refine ⟨testUsed + 1 + (used + 1), ready, endpoint, .done ready,
        paid used yesCoefficient (Nat.le_trans usedBound bounded) (Nat.le_add_right _ _), ?_, rfl, facts⟩
      exact (run_add (machine test yes no) (testUsed + 1) (used + 1) _).trans
        ((congrArg (run (machine test yes no) (used + 1)) testActual).trans usedRun)
  | false =>
      obtain ⟨ticks, ready, endpoint, state, bounded, actual, answered, facts⟩ := negativeRestores
      obtain ⟨used, usedBound, usedRun⟩ := negative_runs test yes no noTerminal origin endpoint ticks state ready actual answered
      refine ⟨testUsed + 1 + (used + 1), ready, endpoint, .done ready,
        paid used noCoefficient (Nat.le_trans usedBound bounded) (Nat.le_add_left _ _), ?_, rfl, facts⟩
      exact (run_add (machine test yes no) (testUsed + 1) (used + 1) _).trans
        ((congrArg (run (machine test yes no) (used + 1)) testActual).trans usedRun)

theorem readOnly (test yes no : Worker) (testSafe : test.ReadOnly) (yesSafe : yes.ReadOnly) (noSafe : no.ReadOnly) :
    (worker test yes no).ReadOnly := by
  intro configuration
  rcases configuration with ⟨runtime, origin⟩
  cases runtime with
  | none => rfl
  | some state =>
      rw [← commandCount_eq_mutationCount]
      cases state with
      | done _ => rfl
      | testing pc =>
          cases answer : test.answer? pc with
          | none =>
              simp only [worker, machine, transition, answer, commandCount_map]
              rw [commandCount_eq_mutationCount]
              exact testSafe ⟨some pc, origin⟩
          | some ready => cases ready <;> simp only [worker, machine, transition, answer, commandCount]
      | positive pc =>
          cases answer : yes.answer? pc with
          | none =>
              simp only [worker, machine, transition, answer, commandCount_map]
              rw [commandCount_eq_mutationCount]
              exact yesSafe ⟨some pc, origin⟩
          | some ready => simp only [worker, machine, transition, answer, commandCount]
      | negative pc =>
          cases answer : no.answer? pc with
          | none =>
              simp only [worker, machine, transition, answer, commandCount_map]
              rw [commandCount_eq_mutationCount]
              exact noSafe ⟨some pc, origin⟩
          | some ready => simp only [worker, machine, transition, answer, commandCount]

end PureSFormal.Research.RootResetProbeBranch
