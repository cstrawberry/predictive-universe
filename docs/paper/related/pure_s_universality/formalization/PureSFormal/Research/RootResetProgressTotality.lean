import PureSFormal.Research.RootResetProgressCompleteness
import PureSFormal.Research.RootResetSelectorContract

/-!
# All-input termination of the progress-fragment walker

This module proves a bare-controller totality theorem for the fixed 23-state
walker in `RootResetProgressWalker`.  The theorem applies to every finite
pure-S term and does not put a fuel counter in the controller: the numerical
bound is used only to state and verify the finite execution.

The result concerns only the Armed/Open/Closed progress-spine fragment.  It is
not a classifier or evaluator for the clock, fuel, frame, dispatcher,
appender, CLOSE, COMMIT, or continuation-handoff stages of a CTS simulation.
-/

namespace PureSFormal.Research.RootResetProgressTotality

set_option maxHeartbeats 1000000

open PureSFormal.PureS
open PureSFormal.PureS.FiniteController
open RootResetProgressWalker
open RootResetSelectorContract

private theorem term_size_app_left_lt (fn arg : Term) :
    fn.size < (Term.app fn arg).size :=
  Nat.lt_succ_of_le (Nat.le_add_right fn.size arg.size)

private theorem term_size_app_right_lt (fn arg : Term) :
    arg.size < (Term.app fn arg).size :=
  Nat.lt_succ_of_le (Nat.le_add_left arg.size fn.size)

private theorem one_add_size_le_app_left (fn arg : Term) :
    1 + fn.size ≤ (Term.app fn arg).size := by
  have enlarged := Nat.add_le_add_left
    (Nat.le_add_right fn.size arg.size) 1
  simp [Term.size, Nat.add_comm] at enlarged ⊢

private theorem one_add_size_le_app_right (fn arg : Term) :
    1 + arg.size ≤ (Term.app fn arg).size := by
  have enlarged := Nat.add_le_add_left
    (Nat.le_add_left arg.size fn.size) 1
  simp [Term.size, Nat.add_comm, Nat.add_left_comm, Nat.add_assoc] at enlarged ⊢

/-- Rejection and the explicit `halt` state are the two terminal outcomes of
the progress-fragment walker. -/
def Terminal (configuration : Configuration Control) : Prop :=
  configuration.control = none ∨ configuration.control = some .halt

/-- Both terminal outcomes are absorbing. -/
theorem step_terminal {configuration : Configuration Control}
    (terminal : Terminal configuration) :
    step machine configuration = configuration := by
  rcases configuration with ⟨control, cursor⟩
  change control = none ∨ control = some .halt at terminal
  rcases terminal with rejected | halted
  · subst control
    rfl
  · subst control
    rfl

/-- An arbitrary suffix leaves a terminal configuration unchanged. -/
theorem run_terminal (ticks : Nat) {configuration : Configuration Control}
    (terminal : Terminal configuration) :
    run machine ticks configuration = configuration := by
  induction ticks generalizing configuration with
  | zero => rfl
  | succ ticks ih =>
      rw [run_succ, step_terminal terminal]
      exact ih terminal

/-- A terminal configuration is reached no later than the displayed bound. -/
def HaltsWithin (bound : Nat) (configuration : Configuration Control) : Prop :=
  ∃ ticks, ticks ≤ bound ∧ Terminal (run machine ticks configuration)

/-- A bounded terminal witness can be padded to the whole stated bound. -/
theorem HaltsWithin.run_bound_terminal
    {bound : Nat} {configuration : Configuration Control}
    (halts : HaltsWithin bound configuration) :
    Terminal (run machine bound configuration) := by
  rcases halts with ⟨ticks, ticks_le, terminal⟩
  have split : ticks + (bound - ticks) = bound := Nat.add_sub_of_le ticks_le
  rw [← split, run_add]
  rw [run_terminal (bound - ticks) terminal]
  exact terminal

/-! ## Descent to the first inspection boundary -/

/--
From `down`, each accepted four- or five-tick block moves to a strict
descendant.  Every malformed block rejects.  Thus descent reaches either a
terminal state or `afterUp`, preserving the erased bare term, within five
ticks per node of the current focus.
-/
theorem down_reaches_terminal_or_afterUp
    (focus : Term) (parents : List ParentFrame) :
    ∃ ticks, ticks ≤ 5 * focus.size ∧
      (Terminal
          (run machine ticks ⟨some .down, ⟨focus, parents⟩⟩) ∨
        ((run machine ticks ⟨some .down, ⟨focus, parents⟩⟩).control =
            some .afterUp ∧
          (run machine ticks ⟨some .down, ⟨focus, parents⟩⟩).cursor.erase =
            (Cursor.mk focus parents).erase)) := by
  cases focus with
  | s =>
      cases parents with
      | nil =>
          refine ⟨1, by decide, Or.inl ?_⟩
          exact Or.inl rfl
      | cons frame parents =>
          cases frame with
          | left sibling =>
              refine ⟨1, by decide, Or.inr ⟨rfl, ?_⟩⟩
              rfl
          | right sibling =>
              refine ⟨1, by decide, Or.inr ⟨rfl, ?_⟩⟩
              rfl
  | app fn arg =>
      cases fn with
      | s =>
          refine ⟨2, by simp [Nat.mul_add], Or.inl ?_⟩
          exact Or.inl rfl
      | app head middle =>
          cases head with
          | s =>
              obtain ⟨ticks, ticks_le, outcome⟩ :=
                down_reaches_terminal_or_afterUp middle
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
                down_reaches_terminal_or_afterUp arg
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

/-! ## Returning through candidate Closed ancestors -/

/-- The exact eleven-tick return through one syntactically closed-like shell. -/
theorem inspect_closed_eleven_parent
    (predecessor leftAudit rightArgument : Term)
    (frame : ParentFrame) (parents : List ParentFrame) :
    run machine 11
        ⟨some .inspect,
          ⟨.app (.app .s predecessor)
              (.app (.app .s leftAudit) rightArgument),
            frame :: parents⟩⟩ =
      ⟨some .afterUp,
        ⟨frame.fill
            (.app (.app .s predecessor)
              (.app (.app .s leftAudit) rightArgument)),
          parents⟩⟩ := by
  cases frame <;> rfl

/-- The same closed-like inspection rejects when its shell is the whole root. -/
theorem inspect_closed_eleven_root
    (predecessor leftAudit rightArgument : Term) :
    (run machine 11
        ⟨some .inspect,
          ⟨.app (.app .s predecessor)
              (.app (.app .s leftAudit) rightArgument), []⟩⟩).control = none := by
  rfl

/--
Eleven inspection ticks either terminate or recognize one closed-like shell
and return to `afterUp` at its strict parent.  The shell test deliberately
does not inspect the recorded audit payloads.
-/
theorem inspect_eleven_terminal_or_afterUp
    (focus : Term) (parents : List ParentFrame) :
    let final := run machine 11 ⟨some .inspect, ⟨focus, parents⟩⟩
    Terminal final ∨
      (final.control = some .afterUp ∧
        final.cursor.parents.length < parents.length) := by
  cases focus with
  | s =>
      exact Or.inl (Or.inl rfl)
  | app fn arg =>
      cases fn with
      | s =>
          exact Or.inl (Or.inl rfl)
      | app head predecessor =>
          cases head with
          | app armedHead armedArgument =>
              cases armedHead with
              | s => exact Or.inl (Or.inr rfl)
              | app left right => exact Or.inl (Or.inl rfl)
          | s =>
              cases arg with
              | s => exact Or.inl (Or.inl rfl)
              | app rightFn rightArgument =>
                  cases rightFn with
                  | s => exact Or.inl (Or.inl rfl)
                  | app rightHead leftAudit =>
                      cases rightHead with
                      | app openHead openArgument =>
                          cases openHead with
                          | s => exact Or.inl (Or.inr rfl)
                          | app left right => exact Or.inl (Or.inl rfl)
                      | s =>
                          cases parents with
                          | nil =>
                              exact Or.inl (Or.inl
                                (inspect_closed_eleven_root predecessor
                                  leftAudit rightArgument))
                          | cons frame parents =>
                              rw [inspect_closed_eleven_parent predecessor
                                leftAudit rightArgument frame parents]
                              exact Or.inr ⟨rfl, by simp⟩

/--
One twelve-tick ascent block either terminates or resumes at `afterUp` with a
strictly shorter parent chain.  An incoming-left row first moves to its
parent, so it may consume two ancestors in one block.
-/
theorem afterUp_twelve_terminal_or_shorter
    (focus : Term) (parents : List ParentFrame) :
    let final := run machine 12 ⟨some .afterUp, ⟨focus, parents⟩⟩
    Terminal final ∨
      (final.control = some .afterUp ∧
        final.cursor.parents.length < parents.length) := by
  cases parents with
  | nil =>
      simpa [run_add] using!
        inspect_eleven_terminal_or_afterUp focus ([] : List ParentFrame)
  | cons frame parents =>
      cases frame with
      | right leftSibling =>
          simpa [run_add] using!
            inspect_eleven_terminal_or_afterUp focus
              (.right leftSibling :: parents)
      | left rightSibling =>
          have inspected := inspect_eleven_terminal_or_afterUp
            (.app focus rightSibling) parents
          have firstTick :
              run machine 12
                  ⟨some .afterUp,
                    ⟨focus, .left rightSibling :: parents⟩⟩ =
                run machine 11
                  ⟨some .inspect, ⟨.app focus rightSibling, parents⟩⟩ := by
            rfl
          rw [firstTick]
          rcases inspected with terminal | resumed
          · exact Or.inl terminal
          · exact Or.inr ⟨resumed.1, by
              exact Nat.lt_trans resumed.2 (by simp)⟩

/--
The ascent phase terminates on every cursor.  The induction measure is the
actual parent-chain length; the controller never reads that measure.
-/
theorem afterUp_haltsWithin
    (focus : Term) (parents : List ParentFrame) :
    HaltsWithin (12 * (parents.length + 1))
      ⟨some .afterUp, ⟨focus, parents⟩⟩ := by
  let start : Configuration Control :=
    ⟨some .afterUp, ⟨focus, parents⟩⟩
  let final := run machine 12 start
  have block := afterUp_twelve_terminal_or_shorter focus parents
  change Terminal final ∨
    (final.control = some .afterUp ∧
      final.cursor.parents.length < parents.length) at block
  rcases block with terminal | resumed
  · refine ⟨12, ?_, ?_⟩
    · simp [Nat.mul_succ]
    · exact terminal
  · have recurse := afterUp_haltsWithin final.cursor.focus
      final.cursor.parents
    rcases recurse with ⟨ticks, ticks_le, terminal⟩
    refine ⟨12 + ticks, ?_, ?_⟩
    · calc
        12 + ticks ≤ 12 + 12 * (final.cursor.parents.length + 1) :=
          Nat.add_le_add_left ticks_le 12
        _ ≤ 12 * (parents.length + 1) := by
          have shorter := Nat.succ_le_of_lt resumed.2
          have scaled := Nat.mul_le_mul_left 12 shorter
          have enlarged := Nat.add_le_add_left scaled 12
          simpa [Nat.mul_succ, Nat.add_comm] using enlarged
    · rw [run_add]
      have firstBlock : run machine 12 start = final := rfl
      rw [firstBlock]
      have final_eq : final =
          ⟨some .afterUp, ⟨final.cursor.focus, final.cursor.parents⟩⟩ := by
        have controlEq := resumed.1
        rcases final with ⟨control, cursor⟩
        change control = some .afterUp at controlEq
        simp only at controlEq ⊢
        subst control
        rfl
      rw [final_eq]
      exact terminal
termination_by parents.length
decreasing_by
  exact resumed.2

/-! ## Structural conversion to the advertised term-size bound -/

/-- Every parent frame and the current nonempty focus fit inside the erased
bare term. -/
theorem depth_add_focus_size_le_erase_size
    (focus : Term) (parents : List ParentFrame) :
    parents.length + focus.size ≤ (Cursor.mk focus parents).erase.size := by
  induction parents generalizing focus with
  | nil => simp [Cursor.erase, Cursor.rebuild]
  | cons frame parents ih =>
      cases frame with
      | left sibling =>
          have inside := ih (.app focus sibling)
          have localBound : parents.length + 1 + focus.size ≤
              parents.length + (Term.app focus sibling).size := by
            rw [Nat.add_assoc]
            exact Nat.add_le_add_left
              (one_add_size_le_app_left focus sibling) parents.length
          exact Nat.le_trans localBound
            (by simpa [Cursor.erase, Cursor.rebuild] using inside)
      | right sibling =>
          have inside := ih (.app sibling focus)
          have localBound : parents.length + 1 + focus.size ≤
              parents.length + (Term.app sibling focus).size := by
            rw [Nat.add_assoc]
            exact Nat.add_le_add_left
              (one_add_size_le_app_right sibling focus) parents.length
          exact Nat.le_trans localBound
            (by simpa [Cursor.erase, Cursor.rebuild] using inside)

/-- Cursor depth plus one is bounded by the size of its erased bare term. -/
theorem depth_succ_le_erase_size (focus : Term)
    (parents : List ParentFrame) :
    parents.length + 1 ≤ (Cursor.mk focus parents).erase.size := by
  have inside := depth_add_focus_size_le_erase_size focus parents
  have positive := Term.size_pos focus
  exact Nat.le_trans
    (Nat.add_le_add_left (Nat.succ_le_of_lt positive) parents.length)
    inside

/-! ## Fresh-root all-input theorem -/

/--
Every finite bare term reaches rejection or the explicit halt state within
`24 * term.size` microticks.  The operational machine is exactly `machine`;
the bound is not stored in or inspected by its 23-state control.
-/
theorem progressFragment_haltsWithin_linear (term : Term) :
    HaltsWithin (24 * term.size) (initial term) := by
  obtain ⟨downTicks, downTicks_le, downOutcome⟩ :=
    down_reaches_terminal_or_afterUp term []
  rcases downOutcome with terminal | afterUp
  · refine ⟨downTicks, ?_, by simpa [initial] using! terminal⟩
    exact Nat.le_trans downTicks_le
      (Nat.mul_le_mul_right term.size (by decide : 5 ≤ 24))
  · let middle :=
      run machine downTicks ⟨some .down, ⟨term, []⟩⟩
    have middleControl : middle.control = some .afterUp := afterUp.1
    have middleErase : middle.cursor.erase = term := by
      simpa [middle, Cursor.erase, Cursor.rebuild] using afterUp.2
    have ascent := afterUp_haltsWithin middle.cursor.focus
      middle.cursor.parents
    rcases ascent with ⟨ascentTicks, ascentTicks_le, terminal⟩
    have depth_le := depth_succ_le_erase_size middle.cursor.focus
      middle.cursor.parents
    have cursor_eta :
        Cursor.mk middle.cursor.focus middle.cursor.parents = middle.cursor := by
      cases middle.cursor
      rfl
    rw [cursor_eta] at depth_le
    have erasedSize : middle.cursor.erase.size = term.size :=
      congrArg Term.size middleErase
    have ascentTicks_le_term : ascentTicks ≤ 12 * term.size := by
      calc
        ascentTicks ≤ 12 * (middle.cursor.parents.length + 1) :=
          ascentTicks_le
        _ ≤ 12 * middle.cursor.erase.size :=
          Nat.mul_le_mul_left 12 depth_le
        _ = 12 * term.size := congrArg (Nat.mul 12) erasedSize
    refine ⟨downTicks + ascentTicks, ?_, ?_⟩
    · calc
        downTicks + ascentTicks ≤
            5 * term.size + 12 * term.size :=
          Nat.add_le_add downTicks_le ascentTicks_le_term
        _ = 17 * term.size := by
          rw [← Nat.add_mul]
        _ ≤ 24 * term.size :=
          Nat.mul_le_mul_right term.size (by decide : 17 ≤ 24)
    · rw [run_add]
      change Terminal
        (run machine ascentTicks
          (run machine downTicks ⟨some .down, ⟨term, []⟩⟩))
      change Terminal (run machine ascentTicks middle)
      have middle_eq : middle =
          ⟨some .afterUp,
            ⟨middle.cursor.focus, middle.cursor.parents⟩⟩ := by
        rcases middle with ⟨control, cursor⟩
        change control = some .afterUp at middleControl
        simp only at middleControl ⊢
        subst control
        rfl
      rw [middle_eq]
      exact terminal

/-- Running for the complete structural bound is already terminal. -/
theorem progressFragment_run_linear_terminal (term : Term) :
    Terminal (run machine (24 * term.size) (initial term)) :=
  (progressFragment_haltsWithin_linear term).run_bound_terminal

/-- The terminal-control form of the all-input theorem. -/
theorem progressFragment_bare_controller_total (term : Term) :
    let final := run machine (24 * term.size) (initial term)
    final.control = none ∨ final.control = some .halt := by
  exact progressFragment_run_linear_terminal term

/-- Issued `L`/`R`/`U` movement instructions satisfy the same linear envelope. -/
theorem progressFragment_moves_linear (term : Term) :
    runMoveCount machine (24 * term.size) (initial term) ≤
      24 * (term.size + 1) := by
  exact Nat.le_trans
    (runMoveCount_le_ticks machine (24 * term.size) (initial term))
    (Nat.mul_le_mul_left 24 (Nat.le_succ term.size))

/-- The same result at the generic finite-configuration bound already used by
the progress completeness interface. -/
theorem progressFragment_haltsWithin_finiteStateBound (term : Term) :
    HaltsWithin (FiniteController.stateBound machine (initial term))
      (initial term) := by
  rw [RootResetProgressCompleteness.stateBound_initial_eq]
  exact progressFragment_haltsWithin_linear term

end PureSFormal.Research.RootResetProgressTotality
