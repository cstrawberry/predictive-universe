import PureSFormal.Research.RootResetNestedClockFirstPass
import PureSFormal.Research.RootResetNestedClockSecondPass

/-!
The finite nested CLOCK probe: two restored parity passes, followed by the
growth occurrence or the original launch redex. Every rejection preserves
the exact invocation cursor; the controller contains no origin witness.
-/
namespace PureSFormal.Research.RootResetNestedClockProbe
open PureSFormal.PureS
open FiniteController RootResetCarrierNonemptyProbe

namespace First
abbrev Control := RootResetNestedClockFirstPass.Control
abbrev Result := RootResetNestedClockFirstPass.Result
abbrev machine := RootResetNestedClockFirstPass.machine
abbrev initial := RootResetNestedClockFirstPass.initial
end First
namespace Second
abbrev Control := RootResetNestedClockSecondPass.Control
abbrev machine := RootResetNestedClockSecondPass.machine
abbrev initial := RootResetNestedClockSecondPass.initial
end Second
namespace Growth
abbrev Control := RootResetNestedClockGrowthProbe.Control
abbrev machine := RootResetNestedClockGrowthProbe.machine
abbrev initial := RootResetNestedClockGrowthProbe.initial
end Growth

inductive Control where
  | first (pc : First.Control)
  | second (pc : Second.Control)
  | growth (pc : Growth.Control)
  | done (ready : Bool)

def cover : List Control := [.done false, .done true] ++ First.machine.states.map .first ++
  Second.machine.states.map .second ++ Growth.machine.states.map .growth

theorem covers (state : Control) : state ∈ cover := by
  simp only [cover, List.mem_append]
  cases state with
  | done ready =>
      apply Or.inl; apply Or.inl; apply Or.inl
      cases ready <;> simp only [List.mem_cons, List.mem_singleton, or_true, true_or]
  | first pc => exact Or.inl (Or.inl (Or.inr (RootResetCompletedLocalPatterns.map_member _ (First.machine.covers pc))))
  | second pc => exact Or.inl (Or.inr (RootResetCompletedLocalPatterns.map_member _ (Second.machine.covers pc)))
  | growth pc => exact Or.inr (RootResetCompletedLocalPatterns.map_member _ (Growth.machine.covers pc))

def transition (state : Control) (node : Probe.NodeKind) (incoming : Probe.Incoming) : Command Control :=
  match state with
  | .first (.done .headMiss) => .stay (.growth .enter)
  | .first (.done (.parsed false _)) => .stay (.done false)
  | .first (.done (.parsed true bit)) => .stay (.second (.enter bit))
  | .first pc => mapCommand .first (First.machine.transition pc node incoming)
  | .second (.done false _) => .stay (.done false)
  | .second (.done true false) => .stay (.growth .enter)
  | .second (.done true true) => .stay (.done true)
  | .second pc => mapCommand .second (Second.machine.transition pc node incoming)
  | .growth (.done ready) => .stay (.done ready)
  | .growth pc => mapCommand .growth (Growth.machine.transition pc node incoming)
  | .done ready => .stay (.done ready)

def machine : Machine Control := ⟨fun _ => cover, covers, transition⟩
def initial (origin : Cursor) : Configuration Control := liftConfiguration .first (First.initial origin)
def second (bit : Bool) (origin : Cursor) : Configuration Control := liftConfiguration .second (Second.initial bit origin)
def growth (origin : Cursor) : Configuration Control := liftConfiguration .growth (Growth.initial origin)

def afterFirst (result : First.Result) (origin : Cursor) : Configuration Control :=
  match result with
  | .headMiss => growth origin
  | .parsed false _ => ⟨some (.done false), origin⟩
  | .parsed true bit => second bit origin

def afterSecond (ready bit : Bool) (origin : Cursor) : Configuration Control :=
  if ready then if bit then ⟨some (.done true), origin⟩ else growth origin else ⟨some (.done false), origin⟩

def firstDone? (configuration : Configuration First.Control) : Bool :=
  match configuration.control with | some (.done _) => true | _ => false
def secondDone? (configuration : Configuration Second.Control) : Bool :=
  match configuration.control with | some (.done _ _) => true | _ => false
def growthDone? (configuration : Configuration Growth.Control) : Bool :=
  match configuration.control with | some (.done _) => true | _ => false

theorem first_absorbs (configuration : Configuration First.Control) (ended : firstDone? configuration = true)
    (ticks : Nat) : run First.machine ticks configuration = configuration := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => cases ended
  | some state => cases state with
    | done result => exact RootResetNestedClockFirstPass.done_absorbs result cursor ticks
    | reading _ => cases ended
    | working _ => cases ended
    | returnOne _ _ => cases ended
    | returnTwo _ _ => cases ended

theorem second_absorbs (configuration : Configuration Second.Control) (ended : secondDone? configuration = true)
    (ticks : Nat) : run Second.machine ticks configuration = configuration := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => cases ended
  | some state => cases state with
    | done ready bit =>
        induction ticks with
        | zero => rfl
        | succ ticks ih => exact ih
    | enter _ => cases ended
    | core _ _ => cases ended
    | unary _ => cases ended
    | ascending _ _ _ => cases ended

theorem growth_absorbs (configuration : Configuration Growth.Control) (ended : growthDone? configuration = true)
    (ticks : Nat) : run Growth.machine ticks configuration = configuration := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => cases ended
  | some state => cases state with
    | done ready => exact RootResetNestedClockGrowthProbe.done_absorbs ready cursor ticks
    | enter => cases ended
    | core _ => cases ended

theorem first_step (configuration : Configuration First.Control) (running : firstDone? configuration = false) :
    step machine (liftConfiguration Control.first configuration) = liftConfiguration Control.first (step First.machine configuration) := by
  apply step_lift
  intro state current
  rcases configuration with ⟨runtime, cursor⟩
  have equal : runtime = some state := current
  subst runtime
  cases state with
  | done _ => cases running
  | reading _ => rfl
  | working _ => rfl
  | returnOne _ _ => rfl
  | returnTwo _ _ => rfl

theorem second_step (configuration : Configuration Second.Control) (running : secondDone? configuration = false) :
    step machine (liftConfiguration Control.second configuration) = liftConfiguration Control.second (step Second.machine configuration) := by
  apply step_lift
  intro state current
  rcases configuration with ⟨runtime, cursor⟩
  have equal : runtime = some state := current
  subst runtime
  cases state with
  | done _ _ => cases running
  | enter _ => rfl
  | core _ _ => rfl
  | unary _ => rfl
  | ascending _ _ _ => rfl

theorem growth_step (configuration : Configuration Growth.Control) (running : growthDone? configuration = false) :
    step machine (liftConfiguration Control.growth configuration) = liftConfiguration Control.growth (step Growth.machine configuration) := by
  apply step_lift
  intro state current
  rcases configuration with ⟨runtime, cursor⟩
  have equal : runtime = some state := current
  subst runtime
  cases state with
  | done _ => cases running
  | enter => rfl
  | core _ => rfl

theorem first_runs (origin : Cursor) (ticks : Nat) (result : First.Result)
    (execution : run First.machine ticks (First.initial origin) = ⟨some (.done result), origin⟩) :
    ∃ used, used ≤ ticks ∧ run machine (used + 1) (initial origin) = afterFirst result origin := by
  obtain ⟨used, bounded, lifted⟩ := run_to_boundary First.machine machine Control.first firstDone?
    first_absorbs first_step ticks (First.initial origin) (by rw [execution]; rfl)
  rw [execution] at lifted
  refine ⟨used, bounded, ?_⟩
  change run machine (used + 1) (liftConfiguration Control.first (First.initial origin)) = _
  rw [run_add, lifted]
  cases result with
  | headMiss => rfl
  | parsed ready bit => cases ready <;> rfl

theorem second_runs (bit : Bool) (origin : Cursor) (ticks : Nat) (ready result : Bool)
    (execution : run Second.machine ticks (Second.initial bit origin) = ⟨some (.done ready result), origin⟩) :
    ∃ used, used ≤ ticks ∧ run machine (used + 1) (second bit origin) = afterSecond ready result origin := by
  obtain ⟨used, bounded, lifted⟩ := run_to_boundary Second.machine machine Control.second secondDone?
    second_absorbs second_step ticks (Second.initial bit origin) (by rw [execution]; rfl)
  rw [execution] at lifted
  refine ⟨used, bounded, ?_⟩
  change run machine (used + 1) (liftConfiguration Control.second (Second.initial bit origin)) = _
  rw [run_add, lifted]
  cases ready <;> cases result <;> rfl

theorem growth_runs (origin endpoint : Cursor) (ticks : Nat) (ready : Bool)
    (execution : run Growth.machine ticks (Growth.initial origin) = ⟨some (.done ready), endpoint⟩) :
    ∃ used, used ≤ ticks ∧ run machine (used + 1) (growth origin) = ⟨some (.done ready), endpoint⟩ := by
  obtain ⟨used, bounded, lifted⟩ := run_to_boundary Growth.machine machine Control.growth growthDone?
    growth_absorbs growth_step ticks (Growth.initial origin) (by rw [execution]; rfl)
  rw [execution] at lifted
  refine ⟨used, bounded, ?_⟩
  change run machine (used + 1) (liftConfiguration Control.growth (Growth.initial origin)) = _
  rw [run_add, lifted]
  rfl

def coefficient : Nat := RootResetNestedClockFirstPass.coefficient + RootResetNestedClockSecondPass.coefficient +
  RootResetNestedClockGrowthProbe.coefficient + 3

theorem combined_bound (source : Term) (first second growth : Nat)
    (firstBound : first ≤ RootResetNestedClockFirstPass.coefficient * source.size)
    (secondBound : second ≤ RootResetNestedClockSecondPass.coefficient * source.size)
    (growthBound : growth ≤ RootResetNestedClockGrowthProbe.coefficient * source.size) :
    first + 1 + (second + 1) + (growth + 1) ≤ coefficient * source.size := by
  have constant : 3 ≤ 3 * source.size := by
    simpa only [Nat.mul_one] using Nat.mul_le_mul_left 3 (Term.size_pos source)
  have total := Nat.add_le_add (Nat.add_le_add (Nat.add_le_add firstBound secondBound) growthBound) constant
  simpa only [coefficient, Nat.add_mul, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using total

theorem phase_bound (source : Term) (first second growth handoffs : Nat)
    (handoffBound : handoffs ≤ 3)
    (firstBound : first ≤ RootResetNestedClockFirstPass.coefficient * source.size)
    (secondBound : second ≤ RootResetNestedClockSecondPass.coefficient * source.size)
    (growthBound : growth ≤ RootResetNestedClockGrowthProbe.coefficient * source.size) :
    first + second + growth + handoffs ≤ coefficient * source.size := by
  exact Nat.le_trans (Nat.add_le_add_left handoffBound _)
    (by simpa only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using
      combined_bound source first second growth firstBound secondBound growthBound)

theorem all_input (origin : Cursor) :
    ∃ ticks ready endpoint, ticks ≤ coefficient * origin.focus.size ∧
      run machine ticks (initial origin) = ⟨some (.done ready), endpoint⟩ ∧
      (if ready then endpoint.rdx?.isSome = true else endpoint = origin) := by
  obtain ⟨firstTicks, result, firstBound, firstRun, firstFacts⟩ := RootResetNestedClockFirstPass.all_input origin
  obtain ⟨firstUsed, firstUsedBound, firstActual⟩ := first_runs origin firstTicks result firstRun
  have paidFirst := Nat.le_trans firstUsedBound firstBound
  cases result with
  | headMiss =>
      obtain ⟨growthTicks, ready, endpoint, growthBound, growthRun, facts⟩ := RootResetNestedClockGrowthProbe.all_input origin
      obtain ⟨growthUsed, growthUsedBound, growthActual⟩ := growth_runs origin endpoint growthTicks ready growthRun
      refine ⟨firstUsed + 1 + (growthUsed + 1), ready, endpoint, ?_, ?_, facts⟩
      · simpa only [Nat.add_zero, Nat.zero_add, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using
          phase_bound origin.focus firstUsed 0 growthUsed 2 (by decide) paidFirst (Nat.zero_le _)
            (Nat.le_trans growthUsedBound growthBound)
      · rw [run_add, firstActual]
        exact growthActual
  | parsed accepted bit =>
      cases accepted with
      | false =>
          refine ⟨firstUsed + 1, false, origin, ?_, firstActual, rfl⟩
          simpa only [Nat.add_zero] using phase_bound origin.focus firstUsed 0 0 1 (by decide)
            paidFirst (Nat.zero_le _) (Nat.zero_le _)
      | true =>
          obtain ⟨secondTicks, ready, result, secondBound, secondRun⟩ := RootResetNestedClockSecondPass.all_input bit origin
          obtain ⟨secondUsed, secondUsedBound, secondActual⟩ := second_runs bit origin secondTicks ready result secondRun
          have paidSecond := Nat.le_trans secondUsedBound secondBound
          have firstTwo : run machine (firstUsed + 1 + (secondUsed + 1)) (initial origin) = afterSecond ready result origin := by
            rw [run_add, firstActual]
            exact secondActual
          cases ready with
          | false =>
              refine ⟨firstUsed + 1 + (secondUsed + 1), false, origin, ?_, firstTwo, rfl⟩
              simpa only [Nat.add_zero, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using
                phase_bound origin.focus firstUsed secondUsed 0 2 (by decide) paidFirst paidSecond (Nat.zero_le _)
          | true =>
              cases result with
              | false =>
                  obtain ⟨growthTicks, ready, endpoint, growthBound, growthRun, facts⟩ := RootResetNestedClockGrowthProbe.all_input origin
                  obtain ⟨growthUsed, growthUsedBound, growthActual⟩ := growth_runs origin endpoint growthTicks ready growthRun
                  refine ⟨firstUsed + 1 + (secondUsed + 1) + (growthUsed + 1), ready, endpoint,
                    combined_bound origin.focus firstUsed secondUsed growthUsed paidFirst paidSecond
                      (Nat.le_trans growthUsedBound growthBound), ?_, facts⟩
                  rw [run_add, firstTwo]
                  exact growthActual
              | true =>
                  refine ⟨firstUsed + 1 + (secondUsed + 1), true, origin, ?_, firstTwo, firstFacts⟩
                  simpa only [Nat.add_zero, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using
                    phase_bound origin.focus firstUsed secondUsed 0 2 (by decide) paidFirst paidSecond (Nat.zero_le _)

theorem mutationCount_zero (configuration : Configuration Control) : mutationCount machine configuration = 0 := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => rfl
  | some state =>
      rw [← commandCount_eq_mutationCount]
      cases state with
      | done _ => rfl
      | first pc =>
          have zero := RootResetNestedClockFirstPass.mutationCount_zero ⟨some pc, cursor⟩
          cases pc with
          | done result => cases result with
            | headMiss => rfl
            | parsed ready bit => cases ready <;> rfl
          | reading _ | working _ | returnOne _ _ | returnTwo _ _ =>
              simp only [machine, transition, commandCount_map]
              rw [commandCount_eq_mutationCount]
              exact zero
      | second pc =>
          have zero := RootResetNestedClockSecondPass.mutationCount_zero ⟨some pc, cursor⟩
          cases pc with
          | done ready bit => cases ready <;> cases bit <;> rfl
          | enter _ | core _ _ | unary _ | ascending _ _ _ =>
              simp only [machine, transition, commandCount_map]
              rw [commandCount_eq_mutationCount]
              exact zero
      | growth pc =>
          have zero := RootResetNestedClockGrowthProbe.mutationCount_zero ⟨some pc, cursor⟩
          cases pc with
          | done _ => rfl
          | enter | core _ =>
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

end PureSFormal.Research.RootResetNestedClockProbe
