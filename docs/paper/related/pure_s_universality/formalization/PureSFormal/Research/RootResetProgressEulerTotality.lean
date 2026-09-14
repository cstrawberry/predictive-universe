import PureSFormal.Research.RootResetProgressEulerSelector

/-!
# All-input totality of the guarded progress/Euler controller

The fixed controller first gives the Armed/Open/Closed progress fragment an
opportunity to select a verified redex.  Every rejected progress shape enters
the explicit `abort` state.  Abort climbs to the whole-term root and starts the
complete Euler scan.  The operational transition table contains no fuel,
counter, address, or retained invocation state; the numerical bounds below
occur only in proofs and in the statement of finite runs.

This result is an all-input selector theorem for the combined 47-state
controller.  It is not the still-larger CTS stage classifier or CTS evaluator.
The endpoint certificate records exact NF/redex semantics and the tick/move
bound.  It does not carry the prefix's exact `runMutationCount`, so this module
does not package a `RootResetSelectorContract.Contract`; that additional field
requires a counted version of the structural prefix induction.
-/

namespace PureSFormal.Research.RootResetProgressEulerTotality

set_option maxHeartbeats 1000000

open PureSFormal.PureS
open PureSFormal.PureS.FiniteController
open RootResetSelectorContract
open RootResetProgressEulerSelector

private theorem term_size_app_left_lt (fn arg : Term) :
    fn.size < (Term.app fn arg).size :=
  Nat.lt_succ_of_le (Nat.le_add_right fn.size arg.size)

private theorem term_size_app_right_lt (fn arg : Term) :
    arg.size < (Term.app fn arg).size :=
  Nat.lt_succ_of_le (Nat.le_add_left arg.size fn.size)

/-- A progress prefix either aborts without changing the bare term, or returns
one verified contraction at the cursor's root-relative address. -/
def PrefixResult (source : Term) (final : Configuration Control) : Prop :=
  (final.control = some .abort ∧ final.cursor.erase = source) ∨
    (final.control = some (.euler .doneRedex) ∧
      source.contractAt? (cursorAddress final.cursor) =
        some final.cursor.erase)

theorem PrefixResult.source_eq {first second : Term}
    {final : Configuration Control} (result : PrefixResult first final)
    (sourceEq : first = second) : PrefixResult second final := by
  subst second
  exact result

/-- A prefix result reached no later than the displayed microtick bound. -/
def PrefixHaltsWithin (bound : Nat)
    (configuration : Configuration Control) : Prop :=
  ∃ ticks, ticks ≤ bound ∧
    PrefixResult configuration.cursor.erase
      (run machine ticks configuration)

/-! ## Guarded candidate endpoints -/

theorem armedRoot_reaches_prefixResult (focus : Term)
    (parents : List ParentFrame) :
    ∃ ticks, ticks ≤ 7 ∧
      PrefixResult (Cursor.mk focus parents).erase
        (run machine ticks
          ⟨some (.progress .armedRoot), ⟨focus, parents⟩⟩) := by
  have guarded := armedRoot_verifies_or_aborts focus parents
  cases hroot : focus.contractRoot? with
  | none =>
      simp only [hroot] at guarded
      rcases guarded with ⟨ticks, ticks_le, runEq, _⟩
      refine ⟨ticks, ticks_le, Or.inl ⟨?_, ?_⟩⟩
      · exact congrArg Configuration.control runEq
      · exact congrArg (fun result => result.cursor.erase) runEq
  | some replacement =>
      simp only [hroot] at guarded
      refine ⟨7, by decide, Or.inr ⟨?_, ?_⟩⟩
      · exact congrArg Configuration.control guarded.1
      · rw [guarded.1]
        have atCursor := contractAt?_cursorAddress
          (Cursor.mk focus parents)
        rw [hroot] at atCursor
        simpa [Cursor.erase] using! atCursor

theorem openRight_reaches_prefixResult (focus : Term)
    (parents : List ParentFrame) :
    ∃ ticks, ticks ≤ 7 ∧
      PrefixResult (Cursor.mk focus parents).erase
        (run machine ticks
          ⟨some (.progress .openRight), ⟨focus, parents⟩⟩) := by
  have guarded := openRight_verifies_or_aborts focus parents
  cases hroot : focus.contractRoot? with
  | none =>
      simp only [hroot] at guarded
      rcases guarded with ⟨ticks, ticks_le, runEq, _⟩
      refine ⟨ticks, ticks_le, Or.inl ⟨?_, ?_⟩⟩
      · exact congrArg Configuration.control runEq
      · exact congrArg (fun result => result.cursor.erase) runEq
  | some replacement =>
      simp only [hroot] at guarded
      refine ⟨7, by decide, Or.inr ⟨?_, ?_⟩⟩
      · exact congrArg Configuration.control guarded.1
      · rw [guarded.1]
        have atCursor := contractAt?_cursorAddress
          (Cursor.mk focus parents)
        rw [hroot] at atCursor
        simpa [Cursor.erase] using! atCursor

/-! ## Descent to the first inspection boundary -/

theorem down_reaches_prefixResult_or_afterUp
    (focus : Term) (parents : List ParentFrame) :
    ∃ ticks, ticks ≤ 5 * focus.size ∧
      let final := run machine ticks
        ⟨some (.progress .down), ⟨focus, parents⟩⟩
      PrefixResult (Cursor.mk focus parents).erase final ∨
        (final.control = some (.progress .afterUp) ∧
          final.cursor.erase = (Cursor.mk focus parents).erase) := by
  cases focus with
  | s =>
      cases parents with
      | nil =>
          exact ⟨1, by decide, Or.inl (Or.inl ⟨rfl, rfl⟩)⟩
      | cons frame parents =>
          cases frame with
          | left sibling => exact ⟨1, by decide, Or.inr ⟨rfl, rfl⟩⟩
          | right sibling => exact ⟨1, by decide, Or.inr ⟨rfl, rfl⟩⟩
  | app fn arg =>
      cases fn with
      | s =>
          refine ⟨2, by simp [Nat.mul_add], Or.inl ?_⟩
          exact Or.inl ⟨rfl, rfl⟩
      | app head middle =>
          cases head with
          | s =>
              obtain ⟨ticks, ticks_le, outcome⟩ :=
                down_reaches_prefixResult_or_afterUp middle
                  (.right .s :: .left arg :: parents)
              refine ⟨4 + ticks, ?_, ?_⟩
              · have child_lt : middle.size <
                    (Term.app (Term.app .s middle) arg).size :=
                  Nat.lt_trans
                    (term_size_app_right_lt .s middle)
                    (term_size_app_left_lt (.app .s middle) arg)
                have scaled := Nat.mul_le_mul_left 5
                  (Nat.succ_le_of_lt child_lt)
                calc
                  4 + ticks ≤ 5 + 5 * middle.size :=
                    Nat.add_le_add (by decide) ticks_le
                  _ = 5 * (middle.size + 1) := by
                    simp [Nat.mul_add, Nat.add_comm]
                  _ ≤ 5 * (Term.app (Term.app .s middle) arg).size := scaled
              · rw [run_add]
                simpa [Cursor.erase, Cursor.rebuild] using! outcome
          | app headLeft headRight =>
              obtain ⟨ticks, ticks_le, outcome⟩ :=
                down_reaches_prefixResult_or_afterUp arg
                  (.right (.app (.app headLeft headRight) middle) :: parents)
              refine ⟨5 + ticks, ?_, ?_⟩
              · have child_lt : arg.size <
                    (Term.app
                      (Term.app (Term.app headLeft headRight) middle) arg).size :=
                  term_size_app_right_lt _ _
                have scaled := Nat.mul_le_mul_left 5
                  (Nat.succ_le_of_lt child_lt)
                calc
                  5 + ticks ≤ 5 + 5 * arg.size :=
                    Nat.add_le_add_left ticks_le 5
                  _ = 5 * (arg.size + 1) := by
                    simp [Nat.mul_add, Nat.add_comm]
                  _ ≤ 5 *
                      (Term.app
                        (Term.app (Term.app headLeft headRight) middle) arg).size :=
                    scaled
              · rw [run_add]
                simpa [Cursor.erase, Cursor.rebuild] using! outcome
termination_by focus.size
decreasing_by
  · exact Nat.lt_trans
      (term_size_app_right_lt _ _)
      (term_size_app_left_lt _ _)
  · exact term_size_app_right_lt _ _

/-! ## Inspection and return blocks -/

/-- Exact closed-like root inspection in the guarded table. -/
theorem inspect_closed_eleven_root
    (predecessor leftAudit rightArgument : Term) :
    run machine 11
        ⟨some (.progress .inspect),
          ⟨.app (.app .s predecessor)
              (.app (.app .s leftAudit) rightArgument), []⟩⟩ =
      ⟨some .abort,
        ⟨.app (.app .s predecessor)
            (.app (.app .s leftAudit) rightArgument), []⟩⟩ := by
  rfl

/-- Exact closed-like parent return in the guarded table. -/
theorem inspect_closed_eleven_parent
    (predecessor leftAudit rightArgument : Term)
    (frame : ParentFrame) (parents : List ParentFrame) :
    run machine 11
        ⟨some (.progress .inspect),
          ⟨.app (.app .s predecessor)
              (.app (.app .s leftAudit) rightArgument),
            frame :: parents⟩⟩ =
      ⟨some (.progress .afterUp),
        ⟨frame.fill
            (.app (.app .s predecessor)
              (.app (.app .s leftAudit) rightArgument)),
          parents⟩⟩ := by
  cases frame <;> rfl

/-- Inspection either reaches a certified prefix endpoint within sixteen
ticks or crosses one closed-like ancestor and resumes at `afterUp`.  Audit
payloads are never compared. -/
theorem inspect_reaches_prefixResult_or_afterUp
    (focus : Term) (parents : List ParentFrame) :
    ∃ ticks, ticks ≤ 16 ∧
      let final := run machine ticks
        ⟨some (.progress .inspect), ⟨focus, parents⟩⟩
      PrefixResult (Cursor.mk focus parents).erase final ∨
        (final.control = some (.progress .afterUp) ∧
          final.cursor.parents.length < parents.length ∧
          final.cursor.erase = (Cursor.mk focus parents).erase) := by
  cases focus with
  | s =>
      exact ⟨1, by decide, Or.inl (Or.inl ⟨rfl, rfl⟩)⟩
  | app fn arg =>
      cases fn with
      | s =>
          exact ⟨2, by decide, Or.inl (Or.inl ⟨rfl, rfl⟩)⟩
      | app head predecessor =>
          cases head with
          | app armedHead armedArgument =>
              obtain ⟨ticks, ticks_le, result⟩ :=
                armedRoot_reaches_prefixResult
                  (.app (.app (.app armedHead armedArgument) predecessor) arg)
                  parents
              refine ⟨4 + ticks, ?_, ?_⟩
              · calc
                  4 + ticks ≤ 4 + 7 := Nat.add_le_add_left ticks_le 4
                  _ ≤ 16 := by decide
              · rw [run_add]
                exact Or.inl result
          | s =>
              cases arg with
              | s =>
                  exact ⟨6, by decide, Or.inl (Or.inl ⟨rfl, rfl⟩)⟩
              | app rightFn rightArgument =>
                  cases rightFn with
                  | s =>
                      exact ⟨7, by decide, Or.inl (Or.inl ⟨rfl, rfl⟩)⟩
                  | app rightHead leftAudit =>
                      cases rightHead with
                      | app openHead openArgument =>
                          obtain ⟨ticks, ticks_le, result⟩ :=
                            openRight_reaches_prefixResult
                              (.app
                                (.app (.app openHead openArgument) leftAudit)
                                rightArgument)
                              (.right (.app .s predecessor) :: parents)
                          refine ⟨9 + ticks, ?_, ?_⟩
                          · exact Nat.le_trans
                              (Nat.add_le_add_left ticks_le 9) (by decide)
                          · rw [run_add]
                            exact Or.inl result
                      | s =>
                          cases parents with
                          | nil =>
                              refine ⟨11, by decide, ?_⟩
                              rw [inspect_closed_eleven_root]
                              exact Or.inl (Or.inl ⟨rfl, rfl⟩)
                          | cons frame parents =>
                              refine ⟨11, by decide, ?_⟩
                              rw [inspect_closed_eleven_parent]
                              exact Or.inr ⟨rfl, by simp, rfl⟩

/-- One `afterUp` microtick followed by inspection reaches a prefix endpoint
or resumes at `afterUp` with a strictly shorter parent chain. -/
theorem afterUp_block
    (focus : Term) (parents : List ParentFrame) :
    ∃ ticks, ticks ≤ 17 ∧
      let final := run machine ticks
        ⟨some (.progress .afterUp), ⟨focus, parents⟩⟩
      PrefixResult (Cursor.mk focus parents).erase final ∨
        (final.control = some (.progress .afterUp) ∧
          final.cursor.parents.length < parents.length ∧
          final.cursor.erase = (Cursor.mk focus parents).erase) := by
  cases parents with
  | nil =>
      obtain ⟨ticks, ticks_le, outcome⟩ :=
        inspect_reaches_prefixResult_or_afterUp focus []
      refine ⟨1 + ticks, ?_, ?_⟩
      · exact Nat.le_trans (Nat.add_le_add_left ticks_le 1) (by decide)
      · rw [run_add]
        rcases outcome with result | resumed
        · exact Or.inl result
        · exact False.elim (Nat.not_lt_zero _ resumed.2.1)
  | cons frame parents =>
      cases frame with
      | right leftSibling =>
          obtain ⟨ticks, ticks_le, outcome⟩ :=
            inspect_reaches_prefixResult_or_afterUp focus
              (.right leftSibling :: parents)
          refine ⟨1 + ticks, ?_, ?_⟩
          · exact Nat.le_trans (Nat.add_le_add_left ticks_le 1) (by decide)
          · rw [run_add]
            exact outcome
      | left rightSibling =>
          obtain ⟨ticks, ticks_le, outcome⟩ :=
            inspect_reaches_prefixResult_or_afterUp
              (.app focus rightSibling) parents
          refine ⟨1 + ticks, ?_, ?_⟩
          · exact Nat.le_trans (Nat.add_le_add_left ticks_le 1) (by decide)
          · rw [run_add]
            rcases outcome with result | resumed
            · exact Or.inl (result.source_eq (by
                simp [Cursor.erase, Cursor.rebuild]))
            · exact Or.inr ⟨resumed.1,
                Nat.lt_trans resumed.2.1 (by simp), by
                  simpa [Cursor.erase, Cursor.rebuild] using! resumed.2.2⟩

/-- The return phase terminates structurally.  Each block consumes at most
seventeen ticks and every nonterminal block moves to a strict ancestor. -/
theorem afterUp_prefixHaltsWithin
    (focus : Term) (parents : List ParentFrame) :
    PrefixHaltsWithin (17 * (parents.length + 1))
      ⟨some (.progress .afterUp), ⟨focus, parents⟩⟩ := by
  let start : Configuration Control :=
    ⟨some (.progress .afterUp), ⟨focus, parents⟩⟩
  obtain ⟨blockTicks, blockTicks_le, blockOutcome⟩ :=
    afterUp_block focus parents
  change PrefixResult (Cursor.mk focus parents).erase
      (run machine blockTicks start) ∨
    ((run machine blockTicks start).control =
        some (.progress .afterUp) ∧
      (run machine blockTicks start).cursor.parents.length < parents.length ∧
      (run machine blockTicks start).cursor.erase =
        (Cursor.mk focus parents).erase) at blockOutcome
  let middle := run machine blockTicks start
  change PrefixResult (Cursor.mk focus parents).erase middle ∨
    (middle.control = some (.progress .afterUp) ∧
      middle.cursor.parents.length < parents.length ∧
      middle.cursor.erase = (Cursor.mk focus parents).erase) at blockOutcome
  rcases blockOutcome with result | resumed
  · refine ⟨blockTicks, ?_, result⟩
    exact Nat.le_trans blockTicks_le (by
      simpa using Nat.mul_le_mul_left 17 (Nat.succ_pos parents.length))
  · have recurse := afterUp_prefixHaltsWithin middle.cursor.focus
        middle.cursor.parents
    rcases recurse with ⟨tailTicks, tailTicks_le, tailResult⟩
    have middle_eq : middle =
        ⟨some (.progress .afterUp),
          ⟨middle.cursor.focus, middle.cursor.parents⟩⟩ := by
      have controlEq := resumed.1
      rcases middle with ⟨control, cursor⟩
      change control = some (.progress .afterUp) at controlEq
      simp only at controlEq ⊢
      subst control
      rfl
    rw [← middle_eq] at tailResult
    refine ⟨blockTicks + tailTicks, ?_, ?_⟩
    · have shorter := Nat.succ_le_of_lt resumed.2.1
      have scaled := Nat.mul_le_mul_left 17 shorter
      calc
        blockTicks + tailTicks ≤
            17 + 17 * (middle.cursor.parents.length + 1) :=
          Nat.add_le_add blockTicks_le tailTicks_le
        _ ≤ 17 + 17 * parents.length :=
          Nat.add_le_add_left scaled 17
        _ = 17 * (parents.length + 1) := by
          simp [Nat.mul_add, Nat.add_comm]
    · rw [run_add]
      change PrefixResult (Cursor.mk focus parents).erase
        (run machine tailTicks middle)
      exact tailResult.source_eq resumed.2.2
termination_by parents.length
decreasing_by
  exact resumed.2.1

/-! ## Fresh-root progress-prefix totality -/

/-- The complete progress prefix reaches an abort or a verified redex within
`22 * term.size` microticks on every finite term. -/
theorem progressPrefix_haltsWithin_linear (term : Term) :
    PrefixHaltsWithin (22 * term.size) (initial term) := by
  obtain ⟨downTicks, downTicks_le, downOutcome⟩ :=
    down_reaches_prefixResult_or_afterUp term []
  rcases downOutcome with result | afterUp
  · refine ⟨downTicks, ?_, ?_⟩
    · exact Nat.le_trans downTicks_le
        (Nat.mul_le_mul_right term.size (by decide : 5 ≤ 22))
    · simpa [initial, Cursor.erase, Cursor.rebuild] using! result
  · let middle :=
      run machine downTicks ⟨some (.progress .down), ⟨term, []⟩⟩
    have middleControl : middle.control = some (.progress .afterUp) :=
      afterUp.1
    have middleErase : middle.cursor.erase = term := by
      simpa [middle, Cursor.erase, Cursor.rebuild] using afterUp.2
    have ascent := afterUp_prefixHaltsWithin middle.cursor.focus
      middle.cursor.parents
    rcases ascent with ⟨ascentTicks, ascentTicks_le, ascentResult⟩
    have depth_le := RootResetProgressTotality.depth_succ_le_erase_size
      middle.cursor.focus middle.cursor.parents
    have cursor_eta :
        Cursor.mk middle.cursor.focus middle.cursor.parents = middle.cursor := by
      cases middle.cursor
      rfl
    rw [cursor_eta] at depth_le
    have erasedSize : middle.cursor.erase.size = term.size :=
      congrArg Term.size middleErase
    have ascentTicks_le_term : ascentTicks ≤ 17 * term.size := by
      calc
        ascentTicks ≤ 17 * (middle.cursor.parents.length + 1) :=
          ascentTicks_le
        _ ≤ 17 * middle.cursor.erase.size :=
          Nat.mul_le_mul_left 17 depth_le
        _ = 17 * term.size := congrArg (Nat.mul 17) erasedSize
    have middle_eq : middle =
        ⟨some (.progress .afterUp),
          ⟨middle.cursor.focus, middle.cursor.parents⟩⟩ := by
      rcases middle with ⟨control, cursor⟩
      change control = some (.progress .afterUp) at middleControl
      simp only at middleControl ⊢
      subst control
      rfl
    rw [← middle_eq] at ascentResult
    refine ⟨downTicks + ascentTicks, ?_, ?_⟩
    · calc
        downTicks + ascentTicks ≤
            5 * term.size + 17 * term.size :=
          Nat.add_le_add downTicks_le ascentTicks_le_term
        _ = 22 * term.size := by rw [← Nat.add_mul]
    · rw [run_add]
      change PrefixResult term (run machine ascentTicks middle)
      exact ascentResult.source_eq middleErase

/-- A complete invocation result has exactly the NF or verified-redex shape
required by the root-reset selector interface. -/
def WholeResult (source : Term) (final : Configuration Control) : Prop :=
  (final.control = some (.euler .doneNF) ∧
      AddressNormal source ∧ final.cursor.erase = source) ∨
    (final.control = some (.euler .doneRedex) ∧
      source.contractAt? (cursorAddress final.cursor) =
        some final.cursor.erase)

theorem WholeResult.source_eq {first second : Term}
    {final : Configuration Control} (result : WholeResult first final)
    (sourceEq : first = second) : WholeResult second final := by
  subst second
  exact result

/-- Every whole result is in one of the two absorbing terminal controls. -/
theorem WholeResult.terminal {source : Term} {final : Configuration Control}
    (result : WholeResult source final) :
    final.control = some (.euler .doneNF) ∨
      final.control = some (.euler .doneRedex) := by
  rcases result with normal | redex
  · exact Or.inl normal.1
  · exact Or.inr redex.1

/-- The certified Euler endpoint lifted into the combined controller has the
same exact NF/redex certificate. -/
theorem lifted_rootExecution_result (term : Term) :
    WholeResult term
      (liftEulerConfiguration (RootResetEulerWalker.rootExecution term).final) := by
  rcases RootResetEulerWalker.rootExecution_certificate term with normal | redex
  · exact Or.inl ⟨by
        change liftEulerRuntime
          (RootResetEulerWalker.rootExecution term).final.control =
            some (.euler .doneNF)
        rw [normal.1]
        rfl,
      normal.2.1, by
        simpa [liftEulerConfiguration] using normal.2.2⟩
  · exact Or.inr ⟨by
        change liftEulerRuntime
          (RootResetEulerWalker.rootExecution term).final.control =
            some (.euler .doneRedex)
        rw [redex.1]
        rfl,
      by simpa [liftEulerConfiguration] using redex.2⟩

/-- Starting in `abort`, root reset plus the Euler scan returns an exact whole
result within the existing 29-coefficient suffix bound. -/
theorem abort_suffix_result (focus : Term) (parents : List ParentFrame) :
    let source := (Cursor.mk focus parents).erase
    ∃ ticks, ticks ≤ 29 * (source.size + 1) ∧
      WholeResult source
        (run machine ticks ⟨some .abort, ⟨focus, parents⟩⟩) := by
  dsimp only
  let ticks := parents.length + 1 +
    (RootResetEulerWalker.rootExecution
      (Cursor.mk focus parents).erase).ticks
  refine ⟨ticks, ?_, ?_⟩
  · exact abort_then_rootExecution_ticks_le focus parents
  · have endpoint := run_abort_then_rootExecution focus parents
    change run machine ticks ⟨some .abort, ⟨focus, parents⟩⟩ = _ at endpoint
    rw [endpoint]
    exact lifted_rootExecution_result (Cursor.mk focus parents).erase

/-! ## Whole-invocation totality and linear bounds -/

/-- Every fresh-root invocation reaches an exact whole result within
`51 * (term.size + 1)` microticks. -/
theorem wholeInvocation_haltsWithin_linear (term : Term) :
    ∃ ticks, ticks ≤ 51 * (term.size + 1) ∧
      WholeResult term (run machine ticks (initial term)) := by
  rcases progressPrefix_haltsWithin_linear term with
    ⟨prefixTicks, prefixTicks_le, prefixResult⟩
  let middle := run machine prefixTicks (initial term)
  change PrefixResult term middle at prefixResult
  rcases prefixResult with aborted | redex
  · obtain ⟨suffixTicks, suffixTicks_le, suffixResult⟩ :=
      abort_suffix_result middle.cursor.focus middle.cursor.parents
    have cursor_eta :
        Cursor.mk middle.cursor.focus middle.cursor.parents = middle.cursor := by
      cases middle.cursor
      rfl
    rw [cursor_eta] at suffixTicks_le suffixResult
    have middle_eq : middle = ⟨some .abort, middle.cursor⟩ := by
      have controlEq := aborted.1
      rcases middle with ⟨control, cursor⟩
      change control = some .abort at controlEq
      simp only at controlEq ⊢
      subst control
      rfl
    rw [← middle_eq] at suffixResult
    have suffixTicks_term :
        suffixTicks ≤ 29 * (term.size + 1) := by
      simpa [aborted.2] using suffixTicks_le
    refine ⟨prefixTicks + suffixTicks, ?_, ?_⟩
    · calc
        prefixTicks + suffixTicks ≤
            22 * term.size + 29 * (term.size + 1) :=
          Nat.add_le_add prefixTicks_le suffixTicks_term
        _ ≤ 22 * (term.size + 1) + 29 * (term.size + 1) :=
          Nat.add_le_add_right
            (Nat.mul_le_mul_left 22 (Nat.le_succ term.size)) _
        _ = 51 * (term.size + 1) := by rw [← Nat.add_mul]
    · rw [run_add]
      change WholeResult term (run machine suffixTicks middle)
      exact suffixResult.source_eq aborted.2
  · refine ⟨prefixTicks, ?_, Or.inr redex⟩
    exact Nat.le_trans prefixTicks_le <| Nat.le_trans
      (Nat.mul_le_mul_left 22 (Nat.le_succ term.size))
      (Nat.mul_le_mul_right (term.size + 1) (by decide : 22 ≤ 51))

/-- The two whole-result controls are absorbing. -/
def Terminal (configuration : Configuration Control) : Prop :=
  configuration.control = some (.euler .doneNF) ∨
    configuration.control = some (.euler .doneRedex)

theorem step_terminal {configuration : Configuration Control}
    (terminal : Terminal configuration) :
    step machine configuration = configuration := by
  rcases configuration with ⟨control, cursor⟩
  change control = some (.euler .doneNF) ∨
    control = some (.euler .doneRedex) at terminal
  rcases terminal with normal | redex
  · subst control
    rfl
  · subst control
    rfl

theorem run_terminal (ticks : Nat) {configuration : Configuration Control}
    (terminal : Terminal configuration) :
    run machine ticks configuration = configuration := by
  induction ticks generalizing configuration with
  | zero => rfl
  | succ ticks ih =>
      rw [run_succ, step_terminal terminal]
      exact ih terminal

/-- Padding to the fixed advertised bound preserves the exact certificate. -/
theorem wholeInvocation_run_linear_result (term : Term) :
    WholeResult term
      (run machine (51 * (term.size + 1)) (initial term)) := by
  rcases wholeInvocation_haltsWithin_linear term with
    ⟨ticks, ticks_le, result⟩
  have split : ticks + (51 * (term.size + 1) - ticks) =
      51 * (term.size + 1) := Nat.add_sub_of_le ticks_le
  rw [← split, run_add]
  rw [run_terminal (51 * (term.size + 1) - ticks) result.terminal]
  exact result

/-- The fixed-bound bare run always finishes in Euler NF or verified-redex
control. -/
theorem wholeInvocation_bare_controller_total (term : Term) :
    Terminal (run machine (51 * (term.size + 1)) (initial term)) :=
  (wholeInvocation_run_linear_result term).terminal

/-- At the fixed terminal bound, issued movement instructions satisfy the same
coefficient.  `runMoveCount` charges every issued `L`, `R`, or `U`, including
a failed attempt, and never charges finite-control stays or `Rdx`. -/
theorem wholeInvocation_moves_linear (term : Term) :
    runMoveCount machine (51 * (term.size + 1)) (initial term) ≤
      51 * (term.size + 1) :=
  runMoveCount_le_ticks machine _ (initial term)

end PureSFormal.Research.RootResetProgressEulerTotality
