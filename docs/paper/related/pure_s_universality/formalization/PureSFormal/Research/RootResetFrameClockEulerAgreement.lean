import PureSFormal.Research.RootResetFrameClockEulerSelector
import PureSFormal.Research.RootResetFrameSpineProbeCarriers
import PureSFormal.Research.RootResetClockEulerPhaseGap

/-!
# Generated FRAME equations for the bounded composed selector

The actual 194-control selector, run at its fixed linear budget, agrees with
both response-aware FRAME residual steps beneath every literal pending depth.
A fresh FRAME around generated Base, fresh Local, or an appropriately marked
Local carrier instead uses the root-restored clock/Euler fallback to produce
FRAME1. The marked case retains the required halt-audit provenance condition.
These equations do not establish agreement on all simulator phases.
-/
namespace PureSFormal.Research.RootResetFrameClockEulerAgreement

open PureSFormal.PureS
open FiniteController
open RootResetFrameClockEulerSelector

theorem pending_eq_wrap (actions : Term) (bits : List Bool)
    (continuation body : Term) (count : Nat) :
    RootResetWrappedFrameSelectorProof.pending actions bits continuation count body =
      RootResetFrameSpineWalker.wrap
        (List.replicate count (dispatcherCode actions bits, continuation)) body := by
  rw [RootResetWrappedFrameSelectorProof.pending_rebuild]
  exact RootResetFrameSpineWalker.rebuild_pending_eq_wrap count _ _ _

theorem pending_first_agrees (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (outerBits bits : List Bool) (outerContinuation continuation carrier : Term) (count : Nat) :
    let actions := compileActions program dispatcher.tree
    let source := RootResetWrappedFrameSelectorProof.pending actions outerBits outerContinuation count
      (SchedulerResponseInvariant.frameFirstRoot actions bits continuation carrier)
    some (final source).cursor.erase =
      RootResetPersistentResponseSelector.selectStep? program dispatcher source := by
  dsimp only
  rw [RootResetWrappedFrameSelectorProof.selectStep?_pending_frameFirst,
    pending_eq_wrap, pending_eq_wrap, generated_first_erase]

theorem pending_second_agrees (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (outerBits bits : List Bool) (outerContinuation continuation carrier : Term) (count : Nat) :
    let actions := compileActions program dispatcher.tree
    let source := RootResetWrappedFrameSelectorProof.pending actions outerBits outerContinuation count
      (SchedulerResponseInvariant.frameSecondRoot actions bits continuation carrier)
    some (final source).cursor.erase =
      RootResetPersistentResponseSelector.selectStep? program dispatcher source := by
  dsimp only
  rw [RootResetWrappedFrameSelectorProof.selectStep?_pending_frameSecond,
    pending_eq_wrap, pending_eq_wrap, generated_second_erase]

theorem fresh_frame_of_carrier_misses (actions : Term) (bits : List Bool)
    (continuation carrier : Term)
    (miss : ∀ parents : List ParentFrame, ∃ ticks,
      run Frame.machine ticks ⟨some .down0, ⟨carrier, parents⟩⟩ =
        ⟨some .miss, Cursor.atRoot (Cursor.rebuild parents carrier)⟩) :
    final (frame (environmentCode actions bits) continuation carrier) =
      ⟨some (.clock (.euler .doneRedex)), Cursor.atRoot
        (SchedulerResponseInvariant.frameFirstRoot actions bits continuation carrier)⟩ := by
  rw [miss_inherits_clock _
    (RootResetFrameSpineProbeCarriers.freshFrame_misses_of_carrier_misses
      actions bits continuation carrier miss)]
  change liftConfiguration .clock
    (RootResetClockEulerBound.Composed.final (frame (environmentCode actions bits) continuation carrier)) = _
  rw [RootResetClockEulerPhaseGap.fixed_budget_pending]
  rfl

theorem fresh_frame_generatedBase (frameActions : Term) (bits : List Bool)
    (continuation actions : Term) (stage remaining : Nat)
    (environment queue seedPayload beta : Term) :
    let carrier := CheckpointDecoder.openBase actions
      (Dovetail.clockExit stage remaining environment) queue seedPayload beta
    final (frame (environmentCode frameActions bits) continuation carrier) =
      ⟨some (.clock (.euler .doneRedex)), Cursor.atRoot
        (SchedulerResponseInvariant.frameFirstRoot frameActions bits continuation carrier)⟩ := by
  dsimp only
  exact fresh_frame_of_carrier_misses frameActions bits continuation _
    (RootResetFrameSpineProbeCarriers.generatedBase_misses actions stage remaining
      environment queue seedPayload beta)

theorem fresh_frame_freshShell (actions : Term) (bits : List Bool) (continuation : Term)
    (audit dispatcher seedPayload seedAudit innerContinuation continuationAudit : Term) :
    let carrier := CheckpointDecoder.openShell (freshHField audit) dispatcher
      seedPayload seedAudit innerContinuation continuationAudit
    final (frame (environmentCode actions bits) continuation carrier) =
      ⟨some (.clock (.euler .doneRedex)), Cursor.atRoot
        (SchedulerResponseInvariant.frameFirstRoot actions bits continuation carrier)⟩ := by
  dsimp only
  exact fresh_frame_of_carrier_misses actions bits continuation _
    (RootResetFrameSpineProbeCarriers.freshShell_misses audit dispatcher seedPayload
      seedAudit innerContinuation continuationAudit)

theorem fresh_frame_markedShell (actions : Term) (bits : List Bool) (continuation : Term)
    (leftAudit rightAudit dispatcher seedPayload seedAudit innerContinuation continuationAudit : Term)
    (auditNotCode : leftAudit ≠ haltCode) :
    let carrier := CheckpointDecoder.openShell (Carrier.markedHField leftAudit rightAudit)
      dispatcher seedPayload seedAudit innerContinuation continuationAudit
    final (frame (environmentCode actions bits) continuation carrier) =
      ⟨some (.clock (.euler .doneRedex)), Cursor.atRoot
        (SchedulerResponseInvariant.frameFirstRoot actions bits continuation carrier)⟩ := by
  dsimp only
  exact fresh_frame_of_carrier_misses actions bits continuation _
    (fun parents => RootResetFrameSpineProbeCarriers.markedShell_misses leftAudit rightAudit
      dispatcher seedPayload seedAudit innerContinuation continuationAudit parents auditNotCode)


end PureSFormal.Research.RootResetFrameClockEulerAgreement
