import PureSFormal.Research.RootResetFrameClockEulerClockAgreement
import PureSFormal.Research.RootResetFreshClockSelectorChain

/-!
# Failure of completed-Local dispatch in the FRAME/clock/Euler component

The 194-control FRAME/clock/Euler component marks a fresh Local halt field.
During a generated nonempty completed response, the structural selector must
instead enter the Local continuation and contract its clock. The final
inequality below uses exactly the same nonempty-response and accumulator
conditions as the checked fresh-clock equation. The actual controller result
has head arity five; the intended continuation step preserves arity six.
Thus this bounded FRAME/clock/Euler component does not realize that dispatch.
-/
namespace PureSFormal.Research.RootResetFrameClockEulerLocalGap

open PureSFormal.PureS
open FiniteController
open RootResetFrameClockEulerSelector

theorem clock_marks_freshShell
    (audit dispatcher seedPayload seedAudit continuation continuationAudit : Term) :
    run Clock.machine 47 (RootResetClockEulerSelector.initial
      (CheckpointDecoder.openShell (freshHField audit) dispatcher
        seedPayload seedAudit continuation continuationAudit)) =
      ⟨some (.euler .doneRedex), ⟨Carrier.markedHField audit audit,
        [.left dispatcher, .left (.app (.app .s seedPayload) seedAudit),
          .left (.app continuation continuationAudit)]⟩⟩ := by
  simp only [run, step, RootResetClockEulerSelector.machine,
    RootResetClockEulerSelector.transition, RootResetClockEulerSelector.handoff,
    RootResetClockEulerSelector.liftCommand,
    RootResetClockParityWalker.machine, RootResetClockParityWalker.transition,
    RootResetClockParityWalker.liftGrowthCommand, RootResetClockGrowthWalker.machine,
    RootResetClockGrowthWalker.transition, RootResetEulerWalker.machine,
    RootResetEulerWalker.transition, RootResetClockEulerSelector.initial,
    CheckpointDecoder.openShell, freshHField, haltCode, haltTag, b,
    Probe.observeNode, Probe.observeIncoming, Primitive.exec,
    Cursor.incomingSide, Cursor.atRoot, Cursor.left?, Cursor.right?, Cursor.up?, Cursor.rdx?,
    ParentFrame.side, ParentFrame.fill, Term.contractRoot?, Term.contractum, Carrier.markedHField,
    Clock.machine]

theorem final_marks_freshShell
    (audit dispatcher seedPayload seedAudit continuation continuationAudit : Term) :
    (final (CheckpointDecoder.openShell (freshHField audit) dispatcher
      seedPayload seedAudit continuation continuationAudit)).cursor.erase =
      CheckpointDecoder.openShell (Carrier.markedHField audit audit) dispatcher
        seedPayload seedAudit continuation continuationAudit := by
  rw [miss_inherits_clock _
    (RootResetFrameSpineProbeCarriers.freshShell_misses audit dispatcher seedPayload
      seedAudit continuation continuationAudit [])]
  rw [RootResetFrameClockEulerClockAgreement.clock_final_of_terminal_run _ 47 _
    (clock_marks_freshShell audit dispatcher seedPayload seedAudit continuation continuationAudit)
    (Or.inr rfl)]
  rfl


theorem fresh_clock_disagrees (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool)
    (bits exitBits : List Bool) (carrier : Term)
    (horizon remaining : Nat) (bound : remaining ≤ horizon)
    (nonempty : ∃ first rest, CheckpointDecoder.decodeCarrier? program dispatcher.tree
      (actionAccumulator program (registers.phase, bit) carrier) = some (first :: rest))
    (classifierNone : RootResetAccumulatorClassifier.classify?
      (actionAccumulator program (registers.phase, bit) carrier) = none) :
    let source := RootResetFreshClockSelectorChain.freshTerm program dispatcher registers bit bits carrier
      (RootResetEmptyHandoffContext.exitTerm program dispatcher horizon remaining exitBits)
    some (final source).cursor.erase ≠
      RootResetPersistentResponseSelector.selectStep? program dispatcher source := by
  dsimp only
  rw [RootResetFreshClockSelectorChain.freshTerm_selectStep_exit program dispatcher registers bit
    bits exitBits carrier horizon remaining bound nonempty classifierNone]
  have arity : (final (RootResetFreshClockSelectorChain.freshTerm program dispatcher registers bit bits carrier
      (RootResetEmptyHandoffContext.exitTerm program dispatcher horizon remaining exitBits))).cursor.erase.headArity = 5 := by
    change (final (CheckpointDecoder.openShell (freshHField carrier)
      (SchedulerResponse.completedRoute program dispatcher registers bit carrier)
      (word bits) carrier (RootResetEmptyHandoffContext.exitTerm program dispatcher horizon remaining exitBits)
      carrier)).cursor.erase.headArity = 5
    rw [final_marks_freshShell]
    rfl
  intro equal
  have arityEq := congrArg Term.headArity (Option.some.inj equal)
  rw [arity] at arityEq
  change 5 = 6 at arityEq
  cases arityEq


end PureSFormal.Research.RootResetFrameClockEulerLocalGap
