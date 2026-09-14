import PureSFormal.Research.RootResetClockParityWalker

/-!
# All-input completion of the finite clock parity probe

The parity component is read-only and has ordinary composable terminal flags.
This module proves that every whole-root invocation reaches a certified redex
or restores the whole root with a mismatch flag. This is a termination and
soundness result for the component; it does not supply the still-required
reachable-phase invariant for entering it from the complete simulator.
-/

namespace PureSFormal.Research.RootResetClockParityTotality

open PureSFormal.PureS
open PureSFormal.PureS.FiniteController
open PureSFormal.PureS.SchedulerInvariant
open RootResetSelectorContract
open RootResetClockParityWalker

set_option maxHeartbeats 1000000

/-- The probe's success and mismatch flags, all ordinary finite controls. -/
def Terminal (configuration : Configuration Control) : Prop :=
  configuration.control = some (.growth .zero) ∨
  configuration.control = some (.growth .positive) ∨
  configuration.control = some (.growth .miss) ∨
  configuration.control = some .launch ∨
  configuration.control = some .miss

/-- Both accepted phases certify a redex; both mismatch flags restore root. -/
def Answer (source : Term) (final : Configuration Control) : Prop :=
  (((final.control = some (.growth .zero) ∨
        final.control = some (.growth .positive) ∨ final.control = some .launch) ∧
      ∃ first second third, final.cursor.focus = Term.redex first second third) ∨
    ((final.control = some .miss ∨ final.control = some (.growth .miss)) ∧
      final.cursor = Cursor.atRoot source))

theorem Answer.terminal {source : Term} {final : Configuration Control}
    (answer : Answer source final) : Terminal final := by
  rcases answer with ⟨accepted, _⟩ | ⟨missed, _⟩
  · rcases accepted with zero | positive | launch
    · exact Or.inl zero
    · exact Or.inr (Or.inl positive)
    · exact Or.inr (Or.inr (Or.inr (Or.inl launch)))
  · rcases missed with miss | growthMiss
    · exact Or.inr (Or.inr (Or.inr (Or.inr miss)))
    · exact Or.inr (Or.inr (Or.inl growthMiss))

theorem run_terminal (ticks : Nat) (configuration : Configuration Control)
    (terminal : Terminal configuration) : run machine ticks configuration = configuration := by
  rcases configuration with ⟨control, cursor⟩
  rcases terminal with h | h | h | h | h <;>
    change control = _ at h <;> subst control <;>
    induction ticks with
    | zero => rfl
    | succ ticks ih => exact ih

/-- A plain abort can be completed without changing the observed input tree. -/
theorem abort_complete (origin : Configuration Control) (ticks : Nat)
    (failed : (run machine ticks origin).control = some .abort) :
    ∃ total final, run machine total origin = final ∧ Answer origin.cursor.erase final := by
  let after := run machine ticks origin
  have afterEq : after = ⟨some .abort, after.cursor⟩ :=
    congrArg (fun control => Configuration.mk control after.cursor) failed
  refine ⟨ticks + (after.cursor.parents.length + 1),
    ⟨some .miss, Cursor.atRoot origin.cursor.erase⟩, ?_,
    Or.inr ⟨Or.inl rfl, rfl⟩⟩
  rw [run_add]
  change run machine (after.cursor.parents.length + 1) after = _
  rw [afterEq, run_abort]
  have preserved : after.cursor.erase = origin.cursor.erase := erase_run ticks origin
  rw [preserved]

theorem growth_complete (source : Term) :
    ∃ ticks final,
      run machine ticks ⟨some (.growth .enter), Cursor.atRoot source⟩ = final ∧
        Answer source final := by
  obtain ⟨ticks, final, execution, answer⟩ :=
    RootResetClockGrowthWalker.probe_complete source
  refine ⟨ticks, liftGrowthConfiguration final, ?_, ?_⟩
  · change run machine ticks
        (liftGrowthConfiguration (RootResetClockGrowthWalker.initial source)) = _
    rw [run_liftGrowth, execution]
  · rcases answer with ⟨accepted, redex⟩ | missed
    · apply Or.inl
      refine ⟨?_, redex⟩
      rcases accepted with zero | positive
      · exact Or.inl (congrArg liftGrowthRuntime zero)
      · exact Or.inr (Or.inl (congrArg liftGrowthRuntime positive))
    · rw [missed]
      exact Or.inr ⟨Or.inr rfl, rfl⟩

theorem run_restartGrowth (cursor : Cursor) :
    run machine (cursor.parents.length + 1) ⟨some .restartGrowth, cursor⟩ =
      ⟨some (.growth .enter), Cursor.atRoot cursor.erase⟩ := by
  rcases cursor with ⟨focus, parents⟩
  induction parents generalizing focus with
  | nil => rfl
  | cons parent parents ih =>
      cases parent with
      | left sibling =>
          change run machine ((parents.length + 1) + 1)
            ⟨some .restartGrowth, ⟨focus, .left sibling :: parents⟩⟩ = _
          rw [run_succ]
          exact ih (.app focus sibling)
      | right sibling =>
          change run machine ((parents.length + 1) + 1)
            ⟨some .restartGrowth, ⟨focus, .right sibling :: parents⟩⟩ = _
          rw [run_succ]
          exact ih (.app sibling focus)

/-- The second pass terminates on arbitrary trees, including malformed endpoints. -/
theorem find_complete (bit : Bool) (term : Term) (parents : List ParentFrame) :
    ∃ ticks final,
      run machine ticks ⟨some (.find .scan bit), ⟨term, parents⟩⟩ = final ∧
      ((∃ result, final = ⟨some (.done .second result),
          Cursor.atRoot (Cursor.rebuild parents term)⟩) ∨
        final = ⟨some .miss, Cursor.atRoot (Cursor.rebuild parents term)⟩) := by
  induction term generalizing parents with
  | s =>
      refine ⟨1 + (parents.length + 1),
        ⟨some .miss, Cursor.atRoot (Cursor.rebuild parents .s)⟩, ?_, Or.inr rfl⟩
      rw [run_add]
      exact run_abort ⟨.s, parents⟩
  | app fn arg fnIH argIH =>
      cases fn with
      | s =>
          refine ⟨2 + ((.left arg :: parents).length + 1),
            ⟨some .miss, Cursor.atRoot (Cursor.rebuild parents (.app .s arg))⟩,
            ?_, Or.inr rfl⟩
          rw [run_add]
          exact run_abort ⟨.s, .left arg :: parents⟩
      | app head field =>
          cases head with
          | s =>
              obtain ⟨ticks, final, execution, answer⟩ :=
                argIH (.right (.app .s field) :: parents)
              refine ⟨5 + ticks, final, ?_, answer⟩
              rw [run_add, run_find_wrapper, execution]
          | app left right =>
              obtain ⟨ticks, final, execution, answer⟩ :=
                worker_complete .second bit arg
                  (.right (.app (.app left right) field) :: parents)
              refine ⟨5 + ticks, final, ?_, ?_⟩
              · rw [run_add]
                exact execution
              · rcases answer with ⟨number, _, result⟩ | missed
                · exact Or.inl ⟨RootResetClockParityWalker.xor bit (parity number), result⟩
                · exact Or.inr missed

/-- The second pass plus its finite decision row is complete on every redex root. -/
theorem second_complete (bit : Bool) (first second third : Term) :
    ∃ ticks final,
      run machine ticks ⟨some (.find .enter bit),
        Cursor.atRoot (Term.redex first second third)⟩ = final ∧
      Answer (Term.redex first second third) final := by
  obtain ⟨ticks, after, execution, answer⟩ :=
    find_complete bit (.app (.app .s first) second) [.left third]
  have prefixRun : run machine (1 + ticks)
      ⟨some (.find .enter bit), Cursor.atRoot (Term.redex first second third)⟩ =
        after := by
    rw [run_add]
    exact execution
  rcases answer with ⟨result, finished⟩ | missed
  · cases result with
    | false =>
        obtain ⟨suffix, final, suffixRun, answer⟩ :=
          growth_complete (Term.redex first second third)
        refine ⟨(1 + ticks) + (1 + suffix), final, ?_, answer⟩
        rw [run_add, prefixRun, finished, run_add]
        exact suffixRun
    | true =>
        refine ⟨(1 + ticks) + 1,
          ⟨some .launch, Cursor.atRoot (Term.redex first second third)⟩,
          ?_, Or.inl ⟨Or.inr (Or.inr rfl), first, second, third, rfl⟩⟩
        rw [run_add, prefixRun, finished]
        rfl
  · refine ⟨1 + ticks, after, prefixRun, ?_⟩
    rw [missed]
    exact Or.inr ⟨Or.inl rfl, rfl⟩

/-- Every input terminates at a genuine redex or an ordinary root-restored miss. -/
theorem probe_complete (source : Term) :
    ∃ ticks final, run machine ticks (initial source) = final ∧ Answer source final := by
  cases source with
  | s => exact abort_complete (initial .s) 1 rfl
  | app core environment =>
      cases core with
      | s => exact abort_complete (initial (.app .s environment)) 2 rfl
      | app fn body =>
          cases fn with
          | s => exact abort_complete (initial (.app (.app .s body) environment)) 3 rfl
          | app head field =>
              cases head with
              | app left right =>
                  let source : Term := .app (.app (.app (.app left right) field) body) environment
                  let cursor : Cursor :=
                    ⟨.app left right, [.left field, .left body, .left environment]⟩
                  obtain ⟨ticks, final, execution, answer⟩ := growth_complete source
                  refine ⟨4 + ((cursor.parents.length + 1) + ticks), final, ?_, answer⟩
                  rw [run_add]
                  change run machine ((cursor.parents.length + 1) + ticks)
                    ⟨some .restartGrowth, cursor⟩ = final
                  rw [run_add, run_restartGrowth]
                  exact execution
              | s =>
                  obtain ⟨ticks, after, execution, answer⟩ :=
                    worker_complete .first false field
                      [.right .s, .left body, .left environment]
                  have prefixRun : run machine (5 + ticks)
                      (initial (Term.redex field body environment)) = after := by
                    rw [run_add]
                    exact execution
                  rcases answer with ⟨number, _, finished⟩ | missed
                  · obtain ⟨suffix, final, suffixRun, finalAnswer⟩ :=
                      second_complete (RootResetClockParityWalker.xor false (parity number)) field body environment
                    refine ⟨(5 + ticks) + (1 + suffix), final, ?_, finalAnswer⟩
                    change run machine ((5 + ticks) + (1 + suffix))
                      (initial (Term.redex field body environment)) = final
                    rw [run_add, prefixRun, finished, run_add]
                    exact suffixRun
                  · refine ⟨5 + ticks, after, prefixRun, ?_⟩
                    rw [missed]
                    exact Or.inr ⟨Or.inl rfl, rfl⟩

/-- Any observed terminal flag has the same certified answer as completed execution. -/
theorem terminal_answer (source : Term) (ticks : Nat)
    (terminal : Terminal (run machine ticks (initial source))) :
    Answer source (run machine ticks (initial source)) := by
  obtain ⟨doneTicks, final, execution, answer⟩ := probe_complete source
  have commute := congrArg (fun count => run machine count (initial source))
    (Nat.add_comm ticks doneTicks)
  rw [run_add, run_terminal doneTicks _ terminal,
    run_add, execution, run_terminal ticks final answer.terminal] at commute
  rw [commute]
  exact answer

/-- Total invocation cannot enter the uncatchable failed-primitive sink. -/
theorem never_rejects (source : Term) (ticks : Nat) :
    (run machine ticks (initial source)).control ≠ none := by
  intro rejected
  obtain ⟨doneTicks, final, execution, answer⟩ := probe_complete source
  let after := run machine ticks (initial source)
  have rejectedEq : after = ⟨none, after.cursor⟩ :=
    congrArg (fun control => Configuration.mk control after.cursor) rejected
  have commute := congrArg (fun count => run machine count (initial source))
    (Nat.add_comm ticks doneTicks)
  rw [run_add] at commute
  change run machine doneTicks after = _ at commute
  rw [rejectedEq, run_reject, run_add, execution,
    run_terminal ticks final answer.terminal] at commute
  have rejectedFinal : final.control = none := by rw [← commute]
  rcases answer.terminal with h | h | h | h | h <;>
    rw [h] at rejectedFinal <;> cases rejectedFinal

/-- A success flag by itself certifies a genuine contraction in the input tree. -/
theorem success_contracts (source : Term) (ticks : Nat)
    (accepted : (run machine ticks (initial source)).control = some (.growth .zero) ∨
      (run machine ticks (initial source)).control = some (.growth .positive) ∨
      (run machine ticks (initial source)).control = some .launch) :
    ∃ target, source.contractAt?
      (cursorAddress (run machine ticks (initial source)).cursor) = some target := by
  have terminal : Terminal (run machine ticks (initial source)) := by
    rcases accepted with h | h | h
    · exact Or.inl h
    · exact Or.inr (Or.inl h)
    · exact Or.inr (Or.inr (Or.inr (Or.inl h)))
  have answer := terminal_answer source ticks terminal
  rcases answer with ⟨_, first, second, third, focusEq⟩ | ⟨missed, _⟩
  · have preserved : (run machine ticks (initial source)).cursor.erase = source := by
      rw [erase_run]
      rfl
    have contracts := contractAt?_cursorAddress (run machine ticks (initial source)).cursor
    rw [focusEq, Term.contractRoot?_redex, preserved] at contracts
    exact ⟨_, contracts⟩
  · rcases missed with h | h <;> rcases accepted with h' | h' | h' <;>
      rw [h] at h' <;> cases h'

/-- Ordinary mismatch always hands the exact whole-term root to its continuation. -/
theorem failure_restores (source : Term) (ticks : Nat)
    (missed : (run machine ticks (initial source)).control = some .miss ∨
      (run machine ticks (initial source)).control = some (.growth .miss)) :
    (run machine ticks (initial source)).cursor = Cursor.atRoot source := by
  have terminal : Terminal (run machine ticks (initial source)) := by
    rcases missed with h | h
    · exact Or.inr (Or.inr (Or.inr (Or.inr h)))
    · exact Or.inr (Or.inr (Or.inl h))
  rcases terminal_answer source ticks terminal with ⟨accepted, _⟩ | ⟨_, restored⟩
  · rcases missed with h | h <;> rcases accepted with h' | h' | h' <;>
      rw [h] at h' <;> cases h'
  · exact restored

end PureSFormal.Research.RootResetClockParityTotality
