import PureSFormal.Research.RootResetClockFuelStages

/-!
# A finite clock-growth probe with root-restoring mismatch

This seventeen-state read-only component starts at the whole-term root,
enters its left child, and traverses an unbounded spine of `S field [-]`
wrappers. At a saturated head redex it records whether the first argument is
an S leaf or an application. On generated clock-growth terms these two cases
are exactly positive residual fuel and zero residual fuel. Every mismatch
returns to the whole-term root with the original tree intact.

The probe does not validate equality between different unary numerals or the
clock balance equation. Its exact clock interpretation is proved on the
generated family. Outside that family success certifies a saturated redex;
it does not certify the clock phase. The terminal `miss` state is an ordinary
composable result, not the rejecting runtime sink.
-/

namespace PureSFormal.Research.RootResetClockGrowthWalker

open PureSFormal.PureS
open PureSFormal.PureS.FiniteController
open PureSFormal.PureS.SchedulerInvariant
open RootResetSelectorContract

inductive Control where
  | enter | scan | inspect1 | inspect2 | head | tagParent | tag
  | zeroUp2 | zeroUp1 | zero
  | positiveUp2 | positiveUp1 | positive
  | wrapper1 | wrapperRoot | abort | miss
  deriving DecidableEq, Repr

def states : List Control :=
  [.enter, .scan, .inspect1, .inspect2, .head, .tagParent, .tag,
    .zeroUp2, .zeroUp1, .zero, .positiveUp2, .positiveUp1, .positive,
    .wrapper1, .wrapperRoot, .abort, .miss]

theorem mem_states (state : Control) : state ∈ states := by
  cases state <;> decide

def transition : Control → Probe.NodeKind → Probe.Incoming → Command Control
  | .enter, .app, _ => .exec .L .scan
  | .enter, .s, _ => .stay .abort
  | .scan, .app, _ => .exec .L .inspect1
  | .scan, .s, _ => .stay .abort
  | .inspect1, .app, _ => .exec .L .inspect2
  | .inspect1, .s, _ => .stay .abort
  | .inspect2, .s, _ => .exec .U .wrapper1
  | .inspect2, .app, _ => .exec .L .head
  | .wrapper1, _, _ => .exec .U .wrapperRoot
  | .wrapperRoot, _, _ => .exec .R .scan
  | .head, .s, _ => .exec .U .tagParent
  | .head, .app, _ => .stay .abort
  | .tagParent, _, _ => .exec .R .tag
  | .tag, .s, _ => .exec .U .positiveUp2
  | .tag, .app, _ => .exec .U .zeroUp2
  | .zeroUp2, _, _ => .exec .U .zeroUp1
  | .zeroUp1, _, _ => .exec .U .zero
  | .positiveUp2, _, _ => .exec .U .positiveUp1
  | .positiveUp1, _, _ => .exec .U .positive
  | .abort, _, .root => .stay .miss
  | .abort, _, .left => .exec .U .abort
  | .abort, _, .right => .exec .U .abort
  | .zero, _, _ => .stay .zero
  | .positive, _, _ => .stay .positive
  | .miss, _, _ => .stay .miss

def machine : Machine Control := ⟨fun _ => states, mem_states, transition⟩

theorem states_length : machine.states.length = 17 := rfl

def initial (term : Term) : Configuration Control :=
  ⟨some .enter, Cursor.atRoot term⟩

theorem mutationCount_zero (configuration : Configuration Control) :
    mutationCount machine configuration = 0 := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => rfl
  | some state =>
      cases state <;>
        cases nodeEq : Probe.observeNode cursor <;>
        cases incomingEq : Probe.observeIncoming cursor <;>
        simp only [mutationCount, machine, transition, nodeEq, incomingEq]

theorem runMutationCount_zero (ticks : Nat) (configuration : Configuration Control) :
    runMutationCount machine ticks configuration = 0 := by
  induction ticks generalizing configuration with
  | zero => rfl
  | succ ticks ih =>
      rw [runMutationCount, mutationCount_zero, ih, Nat.zero_add]

theorem erase_run (ticks : Nat) (configuration : Configuration Control) :
    (run machine ticks configuration).cursor.erase = configuration.cursor.erase := by
  have projected := run_projects_stepsN machine ticks configuration
  rw [runMutationCount_zero] at projected
  exact (StepsN.eq_of_zero projected).symm

/-- Mismatch recovery has no stored return path: it follows parent links to root. -/
theorem run_abort (cursor : Cursor) :
    run machine (cursor.parents.length + 1) ⟨some .abort, cursor⟩ =
      ⟨some .miss, Cursor.atRoot cursor.erase⟩ := by
  rcases cursor with ⟨focus, parents⟩
  induction parents generalizing focus with
  | nil => rfl
  | cons parent parents ih =>
      cases parent with
      | left sibling =>
          change run machine ((parents.length + 1) + 1)
            ⟨some .abort, ⟨focus, .left sibling :: parents⟩⟩ = _
          rw [run_succ]
          exact ih (.app focus sibling)
      | right sibling =>
          change run machine ((parents.length + 1) + 1)
            ⟨some .abort, ⟨focus, .right sibling :: parents⟩⟩ = _
          rw [run_succ]
          exact ih (.app sibling focus)

theorem run_enter (core environment : Term) :
    run machine 1 (initial (.app core environment)) =
      ⟨some .scan, ⟨core, [.left environment]⟩⟩ := rfl

theorem run_wrapper (field body : Term) (parents : List ParentFrame) :
    run machine 5 ⟨some .scan, ⟨.app (.app .s field) body, parents⟩⟩ =
      ⟨some .scan, ⟨body, .right (.app .s field) :: parents⟩⟩ := rfl

theorem run_leaf_redex (second third : Term) (parents : List ParentFrame) :
    run machine 8 ⟨some .scan, ⟨Term.redex .s second third, parents⟩⟩ =
      ⟨some .positive, ⟨Term.redex .s second third, parents⟩⟩ := rfl

theorem run_app_redex (left right second third : Term)
    (parents : List ParentFrame) :
    run machine 8
        ⟨some .scan, ⟨Term.redex (.app left right) second third, parents⟩⟩ =
      ⟨some .zero, ⟨Term.redex (.app left right) second third, parents⟩⟩ := rfl

/-- A successful compositional result carries a saturated occurrence. -/
def Ready (configuration : Configuration Control) : Prop :=
  (configuration.control = some .zero ∨ configuration.control = some .positive) ∧
    ∃ first second third, configuration.cursor.focus = Term.redex first second third

/-- Every scan reaches either a certified redex or the ordinary recovery state. -/
theorem scan_complete (core : Term) (parents : List ParentFrame) :
    ∃ ticks final,
      run machine ticks ⟨some .scan, ⟨core, parents⟩⟩ = final ∧
        (Ready final ∨ final.control = some .abort) := by
  induction core generalizing parents with
  | s => exact ⟨1, ⟨some .abort, ⟨.s, parents⟩⟩, rfl, Or.inr rfl⟩
  | app fn arg fnIH argIH =>
      cases fn with
      | s =>
          exact ⟨2, ⟨some .abort, ⟨.s, .left arg :: parents⟩⟩, rfl, Or.inr rfl⟩
      | app middle second =>
          cases middle with
          | s =>
              obtain ⟨ticks, final, execution, result⟩ :=
                argIH (.right (.app .s second) :: parents)
              refine ⟨5 + ticks, final, ?_, result⟩
              rw [run_add, run_wrapper, execution]
          | app head first =>
              cases head with
              | s =>
                  cases first with
                  | s =>
                      exact ⟨8, ⟨some .positive,
                        ⟨Term.redex .s second arg, parents⟩⟩,
                        run_leaf_redex second arg parents,
                        Or.inl ⟨Or.inr rfl, .s, second, arg, rfl⟩⟩
                  | app left right =>
                      exact ⟨8, ⟨some .zero,
                        ⟨Term.redex (.app left right) second arg, parents⟩⟩,
                        run_app_redex left right second arg parents,
                        Or.inl ⟨Or.inl rfl, .app left right, second, arg, rfl⟩⟩
              | app left right =>
                  exact ⟨4, ⟨some .abort, ⟨.app left right,
                    .left first :: .left second :: .left arg :: parents⟩⟩,
                    rfl, Or.inr rfl⟩

/-- Every whole-root invocation terminates successfully or restores its start. -/
theorem probe_complete (term : Term) :
    ∃ ticks final,
      run machine ticks (initial term) = final ∧
        (Ready final ∨ final = ⟨some .miss, Cursor.atRoot term⟩) := by
  cases term with
  | s => exact ⟨2, ⟨some .miss, Cursor.atRoot .s⟩, rfl, Or.inr rfl⟩
  | app core environment =>
      obtain ⟨ticks, final, execution, result⟩ :=
        scan_complete core [.left environment]
      have prefixRun : run machine (1 + ticks) (initial (.app core environment)) =
          final := by rw [run_add, run_enter, execution]
      rcases result with ready | aborted
      · exact ⟨1 + ticks, final, prefixRun, Or.inl ready⟩
      · have preserved : final.cursor.erase = .app core environment := by
          rw [← prefixRun, erase_run]
          rfl
        have finalEq : final = ⟨some .abort, final.cursor⟩ := by
          cases final with
          | mk control cursor =>
              change control = some .abort at aborted
              cases aborted
              rfl
        refine ⟨(1 + ticks) + (final.cursor.parents.length + 1),
          ⟨some .miss, Cursor.atRoot (.app core environment)⟩, ?_, Or.inr rfl⟩
        rw [run_add, prefixRun, finalEq, run_abort]
        rw [preserved]

theorem run_terminal (ticks : Nat) (configuration : Configuration Control)
    (terminal : configuration.control = some .zero ∨
      configuration.control = some .positive ∨ configuration.control = some .miss) :
    run machine ticks configuration = configuration := by
  rcases configuration with ⟨control, cursor⟩
  rcases terminal with controlEq | controlEq | controlEq <;>
    change control = _ at controlEq <;> subst control <;>
    induction ticks with
    | zero => rfl
    | succ ticks ih => exact ih

/-- Every ordinary mismatch, at any observed time, restores the exact start. -/
theorem failure_restores (term : Term) (ticks : Nat)
    (failed : (run machine ticks (initial term)).control = some .miss) :
    run machine ticks (initial term) = ⟨some .miss, Cursor.atRoot term⟩ := by
  obtain ⟨doneTicks, final, execution, result⟩ := probe_complete term
  have commute := congrArg (fun count => run machine count (initial term))
    (Nat.add_comm ticks doneTicks)
  rw [run_add, run_terminal doneTicks _ (Or.inr (Or.inr failed)),
    run_add, execution] at commute
  rcases result with ready | restored
  · have terminal : final.control = some .zero ∨
        final.control = some .positive ∨ final.control = some .miss := by
      rcases ready.1 with zero | positive
      · exact Or.inl zero
      · exact Or.inr (Or.inl positive)
    rw [run_terminal ticks final terminal] at commute
    have finalFailed : final.control = some .miss := by rw [← commute]; exact failed
    rcases ready.1 with zero | positive
    · rw [zero] at finalFailed
      cases finalFailed
    · rw [positive] at finalFailed
      cases finalFailed
  · rw [restored, run_terminal ticks ⟨some .miss, Cursor.atRoot term⟩
      (Or.inr (Or.inr rfl))] at commute
    exact commute

/-- The total probe never enters the uncatchable runtime rejecting sink. -/
theorem never_rejects (term : Term) (ticks : Nat) :
    (run machine ticks (initial term)).control ≠ none := by
  intro rejected
  obtain ⟨doneTicks, final, execution, result⟩ := probe_complete term
  have rejectedEq : run machine ticks (initial term) =
      ⟨none, (run machine ticks (initial term)).cursor⟩ := by
    generalize run machine ticks (initial term) = after at rejected ⊢
    cases after with
    | mk control cursor =>
        change control = none at rejected
        subst control
        rfl
  have commute := congrArg (fun count => run machine count (initial term))
    (Nat.add_comm ticks doneTicks)
  rw [run_add, rejectedEq, run_reject, run_add, execution] at commute
  have terminal : final.control = some .zero ∨
      final.control = some .positive ∨ final.control = some .miss := by
    rcases result with ready | restored
    · rcases ready.1 with zero | positive
      · exact Or.inl zero
      · exact Or.inr (Or.inl positive)
    · rw [restored]
      exact Or.inr (Or.inr rfl)
  rw [run_terminal ticks final terminal] at commute
  have finalRejected : final.control = none := by rw [← commute]
  rcases terminal with zero | positive | miss
  · rw [zero] at finalRejected
    cases finalRejected
  · rw [positive] at finalRejected
    cases finalRejected
  · rw [miss] at finalRejected
    cases finalRejected

/-- A successful runtime answer denotes an actual contraction of the input tree. -/
theorem ready_contracts (term : Term) (ticks : Nat)
    (ready : Ready (run machine ticks (initial term))) :
    ∃ target, term.contractAt?
      (cursorAddress (run machine ticks (initial term)).cursor) = some target := by
  obtain ⟨first, second, third, focusEq⟩ := ready.2
  have preserved : (run machine ticks (initial term)).cursor.erase = term := by
    rw [erase_run]
    rfl
  have contracted := contractAt?_cursorAddress
    (run machine ticks (initial term)).cursor
  rw [focusEq, Term.contractRoot?_redex, preserved] at contracted
  exact ⟨_, contracted⟩

/-- The two finite success flags suffice to recover the redex certificate. -/
theorem success_ready (term : Term) (ticks : Nat)
    (accepted : (run machine ticks (initial term)).control = some .zero ∨
      (run machine ticks (initial term)).control = some .positive) :
    Ready (run machine ticks (initial term)) := by
  obtain ⟨doneTicks, final, execution, result⟩ := probe_complete term
  have terminal : (run machine ticks (initial term)).control = some .zero ∨
      (run machine ticks (initial term)).control = some .positive ∨
      (run machine ticks (initial term)).control = some .miss := by
    rcases accepted with zero | positive
    · exact Or.inl zero
    · exact Or.inr (Or.inl positive)
  have commute := congrArg (fun count => run machine count (initial term))
    (Nat.add_comm ticks doneTicks)
  rw [run_add, run_terminal doneTicks _ terminal, run_add, execution] at commute
  rcases result with ready | restored
  · have finalTerminal : final.control = some .zero ∨
        final.control = some .positive ∨ final.control = some .miss := by
      rcases ready.1 with zero | positive
      · exact Or.inl zero
      · exact Or.inr (Or.inl positive)
    rw [run_terminal ticks final finalTerminal] at commute
    rw [commute]
    exact ready
  · rw [restored, run_terminal ticks ⟨some .miss, Cursor.atRoot term⟩
      (Or.inr (Or.inr rfl))] at commute
    rw [commute] at accepted
    rcases accepted with zero | positive
    · cases zero
    · cases positive

theorem success_contracts (term : Term) (ticks : Nat)
    (accepted : (run machine ticks (initial term)).control = some .zero ∨
      (run machine ticks (initial term)).control = some .positive) :
    ∃ target, term.contractAt?
      (cursorAddress (run machine ticks (initial term)).cursor) = some target :=
  ready_contracts term ticks (success_ready term ticks accepted)

def clockParents (stage : Nat) : Nat → List ParentFrame → List ParentFrame
  | 0, parents => parents
  | wrappers + 1, parents =>
      clockParents stage wrappers (.right (.app .s (C stage)) :: parents)

theorem run_clockWrap (stage wrappers : Nat) (endpoint : Term)
    (parents : List ParentFrame) :
    run machine (5 * wrappers)
        ⟨some .scan, ⟨clockWrap stage wrappers endpoint, parents⟩⟩ =
      ⟨some .scan, ⟨endpoint, clockParents stage wrappers parents⟩⟩ := by
  induction wrappers generalizing parents with
  | zero => rfl
  | succ wrappers ih =>
      rw [Nat.mul_succ, Nat.add_comm (5 * wrappers) 5, run_add,
        clockWrap, run_wrapper]
      exact ih _

theorem clockParents_address (stage wrappers : Nat) (parents : List ParentFrame) :
    addressFromParents (clockParents stage wrappers parents) =
      addressFromParents parents ++ RootResetClockFuelStages.rights wrappers := by
  induction wrappers generalizing parents with
  | zero => exact (List.append_nil _).symm
  | succ wrappers ih =>
      rw [clockParents, ih, addressFromParents, RootResetClockFuelStages.rights]
      exact List.append_assoc _ _ _

/-- The zero-residual generated family reaches its exact clock occurrence. -/
theorem run_generated_zero (stage wrappers : Nat) (environment : Term) :
    run machine (1 + (5 * wrappers + 8))
        (initial (.app (clockGrowthCore stage wrappers 0) environment)) =
      ⟨some .zero,
        ⟨.app (C 0) (C stage), clockParents stage wrappers [.left environment]⟩⟩ := by
  rw [run_add, run_enter]
  change run machine (5 * wrappers + 8)
    ⟨some .scan, ⟨clockWrap stage wrappers (.app (C 0) (C stage)),
      [.left environment]⟩⟩ = _
  rw [run_add, run_clockWrap]
  exact run_app_redex .s .s b (C stage) _

theorem run_generated_positive (stage wrappers residual : Nat) (environment : Term) :
    run machine (1 + (5 * wrappers + 8))
        (initial (.app (clockGrowthCore stage wrappers (residual + 1)) environment)) =
      ⟨some .positive,
        ⟨.app (C (residual + 1)) (C stage),
          clockParents stage wrappers [.left environment]⟩⟩ := by
  rw [run_add, run_enter]
  change run machine (5 * wrappers + 8)
    ⟨some .scan, ⟨clockWrap stage wrappers (.app (C (residual + 1)) (C stage)),
      [.left environment]⟩⟩ = _
  rw [run_add, run_clockWrap]
  exact run_leaf_redex (C residual) (C stage) _

theorem generated_zero_address (stage wrappers : Nat) (environment : Term) :
    cursorAddress (run machine (1 + (5 * wrappers + 8))
      (initial (.app (clockGrowthCore stage wrappers 0) environment))).cursor =
      .left :: RootResetClockFuelStages.rights wrappers := by
  rw [run_generated_zero]
  change addressFromParents (clockParents stage wrappers [.left environment]) = _
  rw [clockParents_address]
  rfl

theorem generated_positive_address (stage wrappers residual : Nat) (environment : Term) :
    cursorAddress (run machine (1 + (5 * wrappers + 8))
      (initial (.app (clockGrowthCore stage wrappers (residual + 1)) environment))).cursor =
      .left :: RootResetClockFuelStages.rights wrappers := by
  rw [run_generated_positive]
  change addressFromParents (clockParents stage wrappers [.left environment]) = _
  rw [clockParents_address]
  rfl

theorem generated_zero_contracts (stage wrappers : Nat) (environment : Term) :
    (run machine (1 + (5 * wrappers + 8))
      (initial (.app (clockGrowthCore stage wrappers 0) environment))).cursor.rdx? =
      some ⟨clockBase stage, clockParents stage wrappers [.left environment]⟩ := by
  rw [run_generated_zero]
  rfl

theorem generated_positive_contracts (stage wrappers residual : Nat) (environment : Term) :
    (run machine (1 + (5 * wrappers + 8))
      (initial (.app (clockGrowthCore stage wrappers (residual + 1)) environment))).cursor.rdx? =
      some ⟨.app (.app .s (C stage)) (.app (C residual) (C stage)),
        clockParents stage wrappers [.left environment]⟩ := by
  rw [run_generated_positive]
  rfl

end PureSFormal.Research.RootResetClockGrowthWalker
