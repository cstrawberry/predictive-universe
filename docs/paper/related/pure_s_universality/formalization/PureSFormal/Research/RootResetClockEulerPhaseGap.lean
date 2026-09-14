import PureSFormal.Research.RootResetClockEulerBound
import PureSFormal.Research.RootResetWrappedFrameSelectorProof
/-!
# An explicit limitation of clock-first Euler fallback

The certified 137-state component always contracts the outer root of a
pending FRAME wrapper. The response-aware structural selector instead
contracts the inner FRAME1 residual. The disagreement below holds for every
program, dispatcher, and displayed parameter choice, at the component's
actual fixed stopping time. Full simulation therefore needs an additional
syntax-derived phase dispatcher before this component.
-/

namespace PureSFormal.Research.RootResetClockEulerPhaseGap
open PureSFormal.PureS
open PureSFormal.PureS.FiniteController
open RootResetClockEulerSelector
open RootResetSelectorContract

theorem pending_root_selected (actions : Term) (bits : List Bool)
    (continuation body : Term) :
    run machine 26 (initial (frame (environmentCode actions bits) continuation body)) =
      ⟨some (.euler .doneRedex), Cursor.atRoot
        (Term.contractum (dispatcherCode actions bits) continuation body)⟩ := by
  simp only [run, step, machine, transition, handoff, liftCommand,
    RootResetClockParityWalker.machine, RootResetClockParityWalker.transition,
    RootResetClockParityWalker.liftGrowthCommand, RootResetClockGrowthWalker.machine,
    RootResetClockGrowthWalker.transition, RootResetEulerWalker.machine,
    RootResetEulerWalker.transition, initial, frame, environmentCode, dispatcherCode,
    actCode, Probe.observeNode, Probe.observeIncoming, Primitive.exec,
    Cursor.incomingSide, Cursor.atRoot, Cursor.left?, Cursor.right?, Cursor.up?, Cursor.rdx?,
    ParentFrame.side, ParentFrame.fill, Term.contractRoot?, Term.contractum]


theorem fixed_budget_pending (actions : Term) (bits : List Bool)
    (continuation body : Term) :
    RootResetClockEulerBound.Composed.final (frame (environmentCode actions bits) continuation body) =
      ⟨some (.euler .doneRedex), Cursor.atRoot
        (Term.contractum (dispatcherCode actions bits) continuation body)⟩ := by
  have bound : 26 ≤ RootResetClockEulerBound.Composed.stoppingTime
      (frame (environmentCode actions bits) continuation body) := by
    apply Nat.le_trans (by decide : 26 ≤ 34)
    exact Nat.le.intro (k := 34 * (frame (environmentCode actions bits) continuation body).size)
      (by simp only [RootResetClockEulerBound.Composed.stoppingTime, Nat.mul_add, Nat.mul_one, Nat.add_comm])
  obtain ⟨extra, timeEq⟩ := Nat.exists_eq_add_of_le bound
  unfold RootResetClockEulerBound.Composed.final
  rw [timeEq, run_add, pending_root_selected]
  exact RootResetClockEulerBound.Composed.terminal_run extra _ (Or.inr rfl)

theorem pending_frameFirst_disagrees (program : CTS.Program)
    (dispatcher : ActionDispatcher program) (outerBits bits : List Bool)
    (outerContinuation continuation carrier : Term) :
    let actions := compileActions program dispatcher.tree
    let source := frame (environmentCode actions outerBits) outerContinuation
      (SchedulerResponseInvariant.frameFirstRoot actions bits continuation carrier)
    some (RootResetClockEulerBound.Composed.final source).cursor.erase ≠
      RootResetPersistentResponseSelector.selectStep? program dispatcher source := by
  dsimp only
  rw [fixed_budget_pending]
  have selected := RootResetWrappedFrameSelectorProof.selectStep?_pending_frameFirst
    program dispatcher outerBits bits outerContinuation continuation carrier 1
  simp only [RootResetWrappedFrameSelectorProof.pending] at selected
  rw [selected]
  intro same
  have arityEq := congrArg Term.headArity (Option.some.inj same)
  change 4 = 3 at arityEq
  cases arityEq

end PureSFormal.Research.RootResetClockEulerPhaseGap







