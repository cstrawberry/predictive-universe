import PureSFormal.Research.RootResetFrameSpineProbe

/-!
# Generated carriers make the FRAME probe restore its starting root

The executable read-only probe rejects every generated Base and fresh Local,
and marked Locals whose generated halt audit is not the fixed halt code.
Rejection survives arbitrary pending wrappers. In particular, probing an
uncontracted fresh FRAME around such a carrier restores that whole FRAME,
allowing the fallback selector to contract its root.
-/

namespace PureSFormal.Research.RootResetFrameSpineProbeCarriers
open PureSFormal.PureS
open FiniteController
open RootResetFrameSpineProbe

theorem generatedBase_misses
    (actions : Term) (stage remaining : Nat) (environment queue seedPayload beta : Term)
    (parents : List ParentFrame) :
    let source := CheckpointDecoder.openBase actions
      (Dovetail.clockExit stage remaining environment) queue seedPayload beta
    ∃ ticks, run machine ticks ⟨some .down0, ⟨source, parents⟩⟩ =
      ⟨some .miss, Cursor.atRoot (Cursor.rebuild parents source)⟩ := by
  dsimp only
  cases remaining with
  | zero => exact arity6_misses _ _ _ _ _ _ parents
  | succ remaining =>
      exact arity5_misses _ _ _ _ _ parents (RootResetFrameCarrierGuard.C_ne_haltCode _)

theorem freshShell_misses
    (audit dispatcher seedPayload seedAudit continuation continuationAudit : Term)
    (parents : List ParentFrame) :
    let source := CheckpointDecoder.openShell (freshHField audit) dispatcher
      seedPayload seedAudit continuation continuationAudit
    ∃ ticks, run machine ticks ⟨some .down0, ⟨source, parents⟩⟩ =
      ⟨some .miss, Cursor.atRoot (Cursor.rebuild parents source)⟩ := by
  exact arity6_misses _ _ _ _ _ _ parents

theorem markedShell_misses
    (leftAudit rightAudit dispatcher seedPayload seedAudit continuation continuationAudit : Term)
    (parents : List ParentFrame) (auditNotCode : leftAudit ≠ haltCode) :
    let source := CheckpointDecoder.openShell (Carrier.markedHField leftAudit rightAudit)
      dispatcher seedPayload seedAudit continuation continuationAudit
    ∃ ticks, run machine ticks ⟨some .down0, ⟨source, parents⟩⟩ =
      ⟨some .miss, Cursor.atRoot (Cursor.rebuild parents source)⟩ := by
  exact arity5_misses _ _ _ _ _ parents auditNotCode

theorem markedShell_misses_of_audit_arity
    (leftAudit rightAudit dispatcher seedPayload seedAudit continuation continuationAudit : Term)
    (parents : List ParentFrame) (notTwo : leftAudit.headArity ≠ 2) :
    let source := CheckpointDecoder.openShell (Carrier.markedHField leftAudit rightAudit)
      dispatcher seedPayload seedAudit continuation continuationAudit
    ∃ ticks, run machine ticks ⟨some .down0, ⟨source, parents⟩⟩ =
      ⟨some .miss, Cursor.atRoot (Cursor.rebuild parents source)⟩ := by
  apply markedShell_misses
  intro equal
  apply notTwo
  rw [equal]
  rfl

theorem wrapped_misses
    (layers : List RootResetFrameSpineWalker.Layer) (body : Term)
    (miss : ∀ parents : List ParentFrame, ∃ ticks,
      run machine ticks ⟨some .down0, ⟨body, parents⟩⟩ =
        ⟨some .miss, Cursor.atRoot (Cursor.rebuild parents body)⟩) :
    ∃ ticks, run machine ticks (initial (RootResetFrameSpineWalker.wrap layers body)) =
      ⟨some .miss, Cursor.atRoot (RootResetFrameSpineWalker.wrap layers body)⟩ := by
  obtain ⟨ticks, execution⟩ := miss (RootResetFrameSpineWalker.spineParents layers [])
  refine ⟨7 * layers.length + ticks, ?_⟩
  rw [initial, Cursor.atRoot, run_add, run_spine, execution]
  have preserved := erase_run (7 * layers.length)
    (initial (RootResetFrameSpineWalker.wrap layers body))
  rw [initial, Cursor.atRoot, run_spine] at preserved
  exact congrArg (fun term => (⟨some .miss, Cursor.atRoot term⟩ : Configuration Control)) preserved

theorem freshFrame_misses_of_carrier_misses
    (actions : Term) (bits : List Bool) (continuation carrier : Term)
    (miss : ∀ parents : List ParentFrame, ∃ ticks,
      run machine ticks ⟨some .down0, ⟨carrier, parents⟩⟩ =
        ⟨some .miss, Cursor.atRoot (Cursor.rebuild parents carrier)⟩) :
    ∃ ticks, run machine ticks (initial (frame (environmentCode actions bits) continuation carrier)) =
      ⟨some .miss, Cursor.atRoot (frame (environmentCode actions bits) continuation carrier)⟩ :=
  wrapped_misses [(dispatcherCode actions bits, continuation)] carrier miss

theorem freshFrame_generatedBase_misses
    (frameActions : Term) (bits : List Bool) (continuation actions : Term)
    (stage remaining : Nat) (environment queue seedPayload beta : Term) :
    let carrier := CheckpointDecoder.openBase actions
      (Dovetail.clockExit stage remaining environment) queue seedPayload beta
    ∃ ticks, run machine ticks (initial (frame (environmentCode frameActions bits) continuation carrier)) =
      ⟨some .miss, Cursor.atRoot (frame (environmentCode frameActions bits) continuation carrier)⟩ :=
  freshFrame_misses_of_carrier_misses frameActions bits continuation _
    (generatedBase_misses actions stage remaining environment queue seedPayload beta)

theorem freshFrame_freshShell_misses
    (actions : Term) (bits : List Bool) (continuation : Term)
    (audit dispatcher seedPayload seedAudit innerContinuation continuationAudit : Term) :
    let carrier := CheckpointDecoder.openShell (freshHField audit) dispatcher
      seedPayload seedAudit innerContinuation continuationAudit
    ∃ ticks, run machine ticks (initial (frame (environmentCode actions bits) continuation carrier)) =
      ⟨some .miss, Cursor.atRoot (frame (environmentCode actions bits) continuation carrier)⟩ :=
  freshFrame_misses_of_carrier_misses actions bits continuation _
    (freshShell_misses audit dispatcher seedPayload seedAudit innerContinuation continuationAudit)

end PureSFormal.Research.RootResetFrameSpineProbeCarriers
