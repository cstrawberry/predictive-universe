import PureSFormal.Research.RootResetNestedUnaryParity

/-! The first CLOCK parity pass restores its arbitrary nested entry exactly. -/
namespace PureSFormal.Research.RootResetNestedClockFirstPass
open PureSFormal.PureS
open FiniteController RootResetPatternFragment RootResetCarrierNonemptyProbe
open RootResetCarrierEdgePatterns RootResetCompletedLocalPatterns

def firstPattern : Pattern := .app (.app (.app .s .hole) .hole) .hole
def firstRow : EdgeRow := ⟨firstPattern, [.left, .left, .right]⟩
def rows : List EdgeRow := [firstRow]

inductive Result where
  | headMiss
  | parsed (ready bit : Bool)

inductive Control where
  | reading (pc : RootResetEdgeFragment.Control rows)
  | working (pc : RootResetNestedUnaryParity.Control)
  | returnTwo (ready bit : Bool)
  | returnOne (ready bit : Bool)
  | done (result : Result)

def extras : List Control :=
  [.returnTwo false false, .returnTwo false true, .returnTwo true false, .returnTwo true true,
    .returnOne false false, .returnOne false true, .returnOne true false, .returnOne true true,
    .done .headMiss, .done (.parsed false false), .done (.parsed false true), .done (.parsed true false), .done (.parsed true true)]

def cover : List Control := extras ++ (RootResetEdgeFragment.machine rows).states.map .reading ++
  RootResetNestedUnaryParity.machine.states.map .working

theorem covers (state : Control) : state ∈ cover := by
  simp only [cover, List.mem_append]
  cases state with
  | reading pc => exact Or.inl (Or.inr (map_member _ ((RootResetEdgeFragment.machine rows).covers pc)))
  | working pc => exact Or.inr (map_member _ (RootResetNestedUnaryParity.machine.covers pc))
  | returnTwo ready bit =>
      apply Or.inl; apply Or.inl
      cases ready <;> cases bit <;> simp only [extras, List.mem_cons, List.mem_singleton, or_true, true_or]
  | returnOne ready bit =>
      apply Or.inl; apply Or.inl
      cases ready <;> cases bit <;> simp only [extras, List.mem_cons, List.mem_singleton, or_true, true_or]
  | done result =>
      apply Or.inl; apply Or.inl
      cases result with
      | headMiss => simp only [extras, List.mem_cons, List.mem_singleton, or_true, true_or]
      | parsed ready bit => cases ready <;> cases bit <;> simp only [extras, List.mem_cons, List.mem_singleton, or_true, true_or]

def transition (state : Control) (node : Probe.NodeKind) (incoming : Probe.Incoming) : Command Control :=
  match state with
  | .reading pc => match pc.val with
    | .answer false => .stay (.done .headMiss)
    | .answer true => .stay (.working (.descending (.scan false ⟨RootResetEdgeSpine.whole RootResetNestedUnaryScan.rows, ProbeCompiler.Control.self_mem_nodes _⟩)))
    | _ => mapCommand .reading ((RootResetEdgeFragment.machine rows).transition pc node incoming)
  | .working (.done ready bit) => .exec .U (.returnTwo ready bit)
  | .working pc => mapCommand .working (RootResetNestedUnaryParity.machine.transition pc node incoming)
  | .returnTwo ready bit => .exec .U (.returnOne ready bit)
  | .returnOne ready bit => .exec .U (.done (.parsed ready bit))
  | .done result => .stay (.done result)

def machine : Machine Control := ⟨fun _ => cover, covers, transition⟩
def initial (origin : Cursor) : Configuration Control :=
  liftConfiguration .reading (RootResetEdgeFragment.initial rows origin)
def working (origin : Cursor) : Configuration Control :=
  liftConfiguration .working (RootResetNestedUnaryParity.initial false origin)

def unaryDone? (configuration : Configuration RootResetNestedUnaryParity.Control) : Bool :=
  match configuration.control with
  | some (.done _ _) => true
  | _ => false

theorem unary_absorbs (configuration : Configuration RootResetNestedUnaryParity.Control)
    (ended : unaryDone? configuration = true) (ticks : Nat) :
    run RootResetNestedUnaryParity.machine ticks configuration = configuration := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => cases ended
  | some state => cases state with
    | done ready bit => exact RootResetNestedUnaryParity.done_absorbs ready bit cursor ticks
    | descending _ => cases ended
    | reading _ _ => cases ended
    | ascending _ _ _ => cases ended

theorem reading_step (configuration : Configuration (RootResetEdgeFragment.Control rows))
    (running : anyAnswer? configuration = false) :
    step machine (liftConfiguration Control.reading configuration) =
      liftConfiguration Control.reading (step (RootResetEdgeFragment.machine rows) configuration) := by
  apply step_lift
  intro state current
  rcases configuration with ⟨runtime, cursor⟩
  have equal : runtime = some state := current
  subst runtime
  rcases state with ⟨code, member⟩
  cases code with
  | answer bit => cases running
  | observeNode _ _ => rfl
  | observeIncoming _ _ _ => rfl
  | move _ _ => rfl

theorem working_step (configuration : Configuration RootResetNestedUnaryParity.Control)
    (running : unaryDone? configuration = false) :
    step machine (liftConfiguration Control.working configuration) =
      liftConfiguration Control.working (step RootResetNestedUnaryParity.machine configuration) := by
  apply step_lift
  intro state current
  rcases configuration with ⟨runtime, cursor⟩
  have equal : runtime = some state := current
  subst runtime
  cases state with
  | done _ _ => cases running
  | descending _ => rfl
  | reading _ _ => rfl
  | ascending _ _ _ => rfl

theorem reading_runs (origin endpoint : Cursor) (ticks : Nat) (ready : Bool)
    (member : ProbeCompiler.Control.answer ready ∈ (RootResetEdgeFragment.familyCode rows).nodes)
    (execution : run (RootResetEdgeFragment.machine rows) ticks (RootResetEdgeFragment.initial rows origin) =
      ⟨some ⟨.answer ready, member⟩, endpoint⟩) :
    ∃ used, used ≤ ticks ∧ run machine (used + 1) (initial origin) =
      if ready then working endpoint else ⟨some (.done .headMiss), endpoint⟩ := by
  obtain ⟨used, bounded, lifted⟩ := run_to_boundary (RootResetEdgeFragment.machine rows) machine Control.reading
    anyAnswer? (RootResetMixedLocalFragment.classify_absorbs _) reading_step ticks
    (RootResetEdgeFragment.initial rows origin) (by rw [execution]; rfl)
  rw [execution] at lifted
  refine ⟨used, bounded, ?_⟩
  change run machine (used + 1) (liftConfiguration Control.reading (RootResetEdgeFragment.initial rows origin)) = _
  rw [run_add, lifted]
  cases ready <;> rfl

theorem working_runs (origin : Cursor) (ticks : Nat) (ready bit : Bool)
    (execution : run RootResetNestedUnaryParity.machine ticks (RootResetNestedUnaryParity.initial false origin) =
      ⟨some (.done ready bit), origin⟩) :
    ∃ used, used ≤ ticks ∧ run machine used (working origin) = ⟨some (.working (.done ready bit)), origin⟩ := by
  obtain ⟨used, bounded, lifted⟩ := run_to_boundary RootResetNestedUnaryParity.machine machine Control.working
    unaryDone? unary_absorbs working_step ticks (RootResetNestedUnaryParity.initial false origin) (by rw [execution]; rfl)
  rw [execution] at lifted
  exact ⟨used, bounded, lifted⟩

def source (stage body environment : Term) : Term := .app (.app (.app .s stage) body) environment
def inside (stage body environment : Term) (parents : List ParentFrame) : Cursor :=
  ⟨stage, .right .s :: .left body :: .left environment :: parents⟩

theorem return_runs (ready bit : Bool) (stage body environment : Term) (parents : List ParentFrame) :
    run machine 3 ⟨some (.working (.done ready bit)), inside stage body environment parents⟩ =
      ⟨some (.done (.parsed ready bit)), ⟨source stage body environment, parents⟩⟩ := rfl

def coefficient : Nat := RootResetEdgeFragment.bound rows + RootResetNestedUnaryParity.coefficient + 4

theorem parsed_runs (stage body environment : Term) (parents : List ParentFrame)
    (ticks : Nat) (ready bit : Bool)
    (bounded : ticks ≤ RootResetNestedUnaryParity.coefficient * stage.size)
    (execution : run RootResetNestedUnaryParity.machine ticks
      (RootResetNestedUnaryParity.initial false (inside stage body environment parents)) =
      ⟨some (.done ready bit), inside stage body environment parents⟩) :
    ∃ used, used ≤ coefficient * (source stage body environment).size ∧
      run machine used (initial ⟨source stage body environment, parents⟩) =
        ⟨some (.done (.parsed ready bit)), ⟨source stage body environment, parents⟩⟩ := by
  let start : Cursor := ⟨source stage body environment, parents⟩
  let nested := inside stage body environment parents
  obtain ⟨member, headRun⟩ := RootResetEdgeFragment.selected_runs rows start nested firstRow rfl rfl
  obtain ⟨headUsed, headBound, headActual⟩ := reading_runs start nested _ true member headRun
  obtain ⟨unaryUsed, unaryBound, unaryActual⟩ := working_runs nested ticks ready bit execution
  refine ⟨headUsed + 1 + unaryUsed + 3, ?_, ?_⟩
  · have smaller : stage.size ≤ start.focus.size := Nat.le_of_lt
      (RootResetEdgeFragment.follow_size_lt firstRow.address start nested (by intro h; cases h) rfl)
    have constant (value : Nat) : value ≤ value * start.focus.size := by
      simpa only [Nat.mul_one] using Nat.mul_le_mul_left value (Term.size_pos start.focus)
    have headTotal := Nat.le_trans (Nat.le_trans headBound (RootResetEdgeFragment.ticks_bound rows start.focus)) (constant _)
    have unaryTotal := Nat.le_trans (Nat.le_trans unaryBound bounded) (Nat.mul_le_mul_left _ smaller)
    have total := Nat.add_le_add (Nat.add_le_add headTotal unaryTotal) (constant 4)
    simpa only [coefficient, Nat.add_mul, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using total
  · have firstTwo : run machine (headUsed + 1 + unaryUsed) (initial start) =
        ⟨some (.working (.done ready bit)), nested⟩ := by
      rw [run_add, headActual]
      exact unaryActual
    rw [run_add, firstTwo]
    exact return_runs ready bit stage body environment parents

theorem matched_shape (term : Term) (matched : firstPattern.matchesBool term = true) :
    ∃ stage body environment, term = source stage body environment := by
  obtain ⟨first, environment, termEq, firstMatch, _⟩ := app_matches matched
  obtain ⟨second, body, firstEq, secondMatch, _⟩ := app_matches firstMatch
  obtain ⟨head, stage, secondEq, headMatch, _⟩ := app_matches secondMatch
  have headEq : head = .s := (Pattern.matches_s_iff head).mp (Pattern.matchesBool_sound headMatch)
  exact ⟨stage, body, environment, by rw [termEq, firstEq, secondEq, headEq]; rfl⟩

theorem all_input (origin : Cursor) :
    ∃ ticks result, ticks ≤ coefficient * origin.focus.size ∧
      run machine ticks (initial origin) = ⟨some (.done result), origin⟩ ∧
      (match result with | .headMiss => True | .parsed _ _ => origin.rdx?.isSome = true) := by
  cases matched : firstPattern.matchesBool origin.focus with
  | false =>
      have missed : RootResetEdgeFragment.select rows origin.focus = none := by
        simp only [rows, firstRow, RootResetEdgeFragment.select, matched, Bool.false_eq_true, ↓reduceIte]
      obtain ⟨member, headRun⟩ := RootResetEdgeFragment.missed_runs rows origin missed
      obtain ⟨used, bounded, actual⟩ := reading_runs origin origin _ false member headRun
      refine ⟨used + 1, .headMiss, ?_, actual, trivial⟩
      have bound : used + 1 ≤ coefficient := by
        exact Nat.le_trans (Nat.add_le_add_right (Nat.le_trans bounded (RootResetEdgeFragment.ticks_bound _ _)) 1)
          (by simpa only [coefficient, Nat.add_assoc] using Nat.add_le_add_left (Nat.le_trans (Nat.le_add_left 1 RootResetNestedUnaryParity.coefficient)
            (Nat.add_le_add_left (by decide : 1 ≤ 4) RootResetNestedUnaryParity.coefficient)) (RootResetEdgeFragment.bound rows))
      exact Nat.le_trans bound (by simpa only [Nat.mul_one] using Nat.mul_le_mul_left coefficient (Term.size_pos origin.focus))
  | true =>
      obtain ⟨stage, body, environment, shape⟩ := matched_shape origin.focus matched
      rcases origin with ⟨focus, parents⟩
      change focus = _ at shape
      subst focus
      obtain ⟨ticks, count, endpoint, bounded, execution, shape, stops⟩ :=
        RootResetNestedUnaryParity.all_input false (inside stage body environment parents)
          (RootResetNestedUnaryParity.first_pass_boundary stage body environment parents)
      obtain ⟨used, usedBound, actual⟩ := parsed_runs stage body environment parents ticks _ _ bounded execution
      exact ⟨used, .parsed _ _, usedBound, actual, rfl⟩

theorem generated (number : Nat) (body environment : Term) (parents : List ParentFrame) :
    ∃ ticks, ticks ≤ coefficient * (source (C number) body environment).size ∧
      run machine ticks (initial ⟨source (C number) body environment, parents⟩) =
        ⟨some (.done (.parsed true (RootResetClockParityWalker.xor false (RootResetClockParityWalker.parity number)))),
          ⟨source (C number) body environment, parents⟩⟩ := by
  obtain ⟨ticks, bounded, execution⟩ := RootResetNestedUnaryParity.generated false number
    (.right .s :: .left body :: .left environment :: parents)
    (RootResetNestedUnaryParity.first_pass_boundary (C number) body environment parents)
  exact parsed_runs (C number) body environment parents ticks _ _ bounded execution

theorem done_absorbs (result : Result) (origin : Cursor) (ticks : Nat) :
    run machine ticks ⟨some (.done result), origin⟩ = ⟨some (.done result), origin⟩ := by
  induction ticks with
  | zero => rfl
  | succ ticks ih => exact ih

theorem mutationCount_zero (configuration : Configuration Control) : mutationCount machine configuration = 0 := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => rfl
  | some state =>
      rw [← commandCount_eq_mutationCount]
      cases state with
      | done _ => rfl
      | returnOne _ _ => rfl
      | returnTwo _ _ => rfl
      | reading pc =>
          rcases pc with ⟨code, member⟩
          have zero := RootResetPatternFragment.mutationCount_zero _ (RootResetEdgeFragment.family_readOnly rows)
            ⟨some ⟨code, member⟩, cursor⟩
          cases code <;> try { rename_i result; cases result <;> rfl }
          all_goals
            simp only [machine, transition, commandCount_map]
            rw [commandCount_eq_mutationCount]
            exact zero
      | working pc =>
          have zero := RootResetNestedUnaryParity.mutationCount_zero ⟨some pc, cursor⟩
          cases pc with
          | done _ _ => rfl
          | descending _ =>
              simp only [machine, transition, commandCount_map]
              rw [commandCount_eq_mutationCount]
              exact zero
          | reading _ _ =>
              simp only [machine, transition, commandCount_map]
              rw [commandCount_eq_mutationCount]
              exact zero
          | ascending _ _ _ =>
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

end PureSFormal.Research.RootResetNestedClockFirstPass
