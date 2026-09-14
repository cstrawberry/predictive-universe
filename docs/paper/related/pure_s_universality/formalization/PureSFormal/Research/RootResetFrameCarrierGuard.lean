import PureSFormal.PureS.SchedulerResponseInvariant

/-!
# Finite FRAME-head recognition and generated carrier exclusions

The guard checks only arity four/five and the fixed halt-code skeleton.
The actions field in the arity-four branch remains an independent hole.
Generated Base and fresh Local carriers are rejected. A marked Local is
rejected when its retained audit is not the arity-two halt code, as follows
from generated carrier arities; arbitrary independent audit holes are not
claimed to satisfy this provenance condition.
-/

namespace PureSFormal.Research.RootResetFrameCarrierGuard

open PureSFormal.PureS

def frameHeadGuard : Term → Bool
  | .app (.app (.app (.app .s (.app (.app .s halt) _)) _) _) _ => decide (halt = haltCode)
  | .app (.app (.app (.app (.app .s leading) _) _) _) _ => decide (leading = haltCode)
  | _ => false

theorem frameHeadGuard_frameFirst (actions : Term) (bits : List Bool) (continuation carrier : Term) :
    frameHeadGuard (SchedulerResponseInvariant.frameFirstRoot actions bits continuation carrier) = true := by
  simp [frameHeadGuard, SchedulerResponseInvariant.frameFirstRoot, dispatcherCode, actCode]

theorem frameHeadGuard_frameSecond (actions : Term) (bits : List Bool) (continuation carrier : Term) :
    frameHeadGuard (SchedulerResponseInvariant.frameSecondRoot actions bits continuation carrier) = true := by
  simp [frameHeadGuard, SchedulerResponseInvariant.frameSecondRoot, actCode]

theorem C_ne_haltCode (stage : Nat) : C stage ≠ haltCode := by
  have notS (n : Nat) : C n ≠ .s := by cases n <;> simp [C]
  have notTag (n : Nat) : C n ≠ haltTag := by
    cases n <;> simp [C, haltTag, b, notS]
  cases stage <;> simp [C, haltCode, b, notTag]

theorem frameHeadGuard_generatedBase
    (actions : Term) (stage remaining : Nat) (environment queue seedPayload beta : Term) :
    frameHeadGuard (CheckpointDecoder.openBase actions
      (Dovetail.clockExit stage remaining environment) queue seedPayload beta) = false := by
  cases remaining with
  | zero => rfl
  | succ remaining =>
      simp [frameHeadGuard, CheckpointDecoder.openBase, Dovetail.clockExit,
        clockWrappers, C_ne_haltCode]

theorem frameHeadGuard_freshShell
    (audit dispatcher seedPayload seedAudit continuation continuationAudit : Term) :
    frameHeadGuard (CheckpointDecoder.openShell (freshHField audit) dispatcher
      seedPayload seedAudit continuation continuationAudit) = false := rfl

theorem frameHeadGuard_markedShell
    (leftAudit rightAudit dispatcher seedPayload seedAudit continuation continuationAudit : Term)
    (auditNotCode : leftAudit ≠ haltCode) :
    frameHeadGuard (CheckpointDecoder.openShell (Carrier.markedHField leftAudit rightAudit)
      dispatcher seedPayload seedAudit continuation continuationAudit) = false := by
  simp [frameHeadGuard, CheckpointDecoder.openShell, Carrier.markedHField, auditNotCode]

theorem frameHeadGuard_markedShell_of_audit_arity
    (leftAudit rightAudit dispatcher seedPayload seedAudit continuation continuationAudit : Term)
    (notTwo : leftAudit.headArity ≠ 2) :
    frameHeadGuard (CheckpointDecoder.openShell (Carrier.markedHField leftAudit rightAudit)
      dispatcher seedPayload seedAudit continuation continuationAudit) = false := by
  apply frameHeadGuard_markedShell
  intro equal
  apply notTwo
  rw [equal]
  rfl


end PureSFormal.Research.RootResetFrameCarrierGuard
