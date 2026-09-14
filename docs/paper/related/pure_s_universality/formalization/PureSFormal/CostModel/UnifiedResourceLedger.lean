import PureSFormal.WeakPathUniversality
import PureSFormal.PureS.ParentLinkedController
import PureSFormal.CostModel.SharedCostTheorem

/-!
# Unified resource ledger for the selected pure-S trajectory

This module places the three exact operational accounts used by Result A in
one kernel-checked statement.  The raw finite controller is charged in
one-edge microticks.  The parent-linked implementation reaches the identical
bare term with exactly the advertised number of contractions.  A supplied
root-relative contraction path lifts to the shared arena with its exact
copy-plus-contraction move count.  The final certificate records the sum of
the controller and arena charges rather than comparing incomparable units.

The bound is deliberately conservative.  It uses the general fact that one
pure-S contraction can at most double tree size, so it applies without an
amortized sharing assumption.
-/

namespace PureSFormal

open PureS

namespace PureS.FiniteController.ProductiveSystem

/-- The wait to the next mutation is bounded by the scheduler's declared
totality bound at the current canonical contraction sample. -/
theorem contractionGap_le_bound
    {Control : Type} {machine : FiniteController.Machine Control}
    (system : FiniteController.ProductiveSystem machine) (index : Nat) :
    system.contractionGap index ≤
      system.bound (system.contractionRun index) := by
  unfold contractionGap
  obtain ⟨after, found⟩ := system.finds (system.contractionRun index)
    (system.contractionRun_good index)
  exact (FiniteController.seekMutationDelay_spec machine found).2.1

/-- Summing locally linear search bounds against the general exponential
tree-size envelope gives a closed raw-microtick bound. -/
theorem sampleTick_le_geometric_envelope
    {Control : Type} {machine : FiniteController.Machine Control}
    (system : FiniteController.ProductiveSystem machine)
    (q initialSize : Nat)
    (boundAt : ∀ index,
      system.bound (system.contractionRun index) ≤
        q * (2 ^ index * initialSize)) :
    ∀ index,
      system.sampleTick index ≤ index * q * 2 ^ index * initialSize := by
  intro index
  induction index with
  | zero => simp
  | succ index ih =>
      rw [sampleTick_succ]
      have gapBound : system.contractionGap index ≤
          q * (2 ^ index * initialSize) :=
        Nat.le_trans (contractionGap_le_bound system index) (boundAt index)
      calc
        system.sampleTick index + system.contractionGap index ≤
            index * q * 2 ^ index * initialSize +
              q * (2 ^ index * initialSize) := Nat.add_le_add ih gapBound
        _ = (index + 1) * q * 2 ^ index * initialSize := by
          simp [Nat.add_mul, Nat.mul_add, Nat.mul_assoc, Nat.mul_comm,
            Nat.mul_left_comm]
        _ ≤ (index + 1) * q * 2 ^ (index + 1) * initialSize := by
          exact Nat.mul_le_mul_right initialSize
            (Nat.mul_le_mul_left ((index + 1) * q)
              (by
                rw [Nat.pow_succ]
                exact Nat.le_mul_of_pos_right (2 ^ index)
                  (by decide : 0 < 2)))

end PureS.FiniteController.ProductiveSystem

namespace WeakPathUniversality

/-- Explicit all-invocation microtick bound for the finite-CTS controller.
The finite factor is the exact number of covered runtime states. -/
theorem finiteCTS_sampleTick_le_explicit
    (program : CTS.Program) (bits : List Bool) (index : Nat) :
    let certificate := (finiteCTSUniformCertificate program).certificate bits
    let system := certificate.system
    let qA := (PureS.FiniteController.runtimeStates
      (PureS.SchedulerControl.machine program
        (canonicalDispatcher program))).length
    system.sampleTick index ≤
      index * qA * 2 ^ index *
        ((finiteCTSUniformCertificate program).encode bits).size := by
  let certificate := (finiteCTSUniformCertificate program).certificate bits
  let system := certificate.system
  let qA := (PureS.FiniteController.runtimeStates
    (PureS.SchedulerControl.machine program
      (canonicalDispatcher program))).length
  apply system.sampleTick_le_geometric_envelope qA
    ((finiteCTSUniformCertificate program).encode bits).size
  intro stepIndex
  change PureS.SchedulerBound.bound program (canonicalDispatcher program)
      (system.contractionRun stepIndex) ≤
    qA * (2 ^ stepIndex *
      ((finiteCTSUniformCertificate program).encode bits).size)
  rw [PureS.SchedulerBound.bound_eq]
  exact Nat.mul_le_mul_left qA
    (system.reductionPath.term_size_le_pow stepIndex)

end WeakPathUniversality

namespace CostModel.UnifiedResourceLedger

open PureS

/-- Charged one-edge controller operations through contraction sample
`index`. -/
def controllerTickBound (qA index initialSize : Nat) : Nat :=
  index * qA * 2 ^ index * initialSize

/-- Exact general upper envelope for arena copies plus shared contractions
along `index` supplied tree contractions. -/
def sharedMoveBound (index initialSize : Nat) : Nat :=
  index * initialSize + index * (index - 1) / 2

/-- The single structural-operation ledger: controller edge ticks plus shared
arena copy/contraction moves. -/
def totalChargedBound (qA index initialSize : Nat) : Nat :=
  controllerTickBound qA index initialSize + sharedMoveBound index initialSize

/-- End-to-end structural certificate at one selected-path contraction
sample.  The address list is the ordinary path being implemented in the
shared arena; no address is reconstructed by this theorem. -/
structure FiniteCTSLedgerCertificate
    (program : CTS.Program) (bits : List Bool) (index : Nat)
    {ι : Type} [DecidableEq ι] (arena : Arena ι)
    (addresses : List Address) : Prop where
  rootReadback : arena.rootReadback =
    (WeakPathUniversality.finiteCTSUniformCertificate program).encode bits
  addressLength : addresses.length = index
  addressedPath : AddressedPath addresses
    ((WeakPathUniversality.finiteCTSUniformCertificate program).encode bits)
    (((WeakPathUniversality.finiteCTSUniformCertificate program).certificate
      bits).system.reductionPath.term index)
  parentLinkedTerm :
    (PureS.ParentLinked.Controller.run
      (PureS.SchedulerControl.machine program
        (WeakPathUniversality.canonicalDispatcher program))
      (((WeakPathUniversality.finiteCTSUniformCertificate program).certificate
        bits).system.sampleTick index)
      (PureS.ParentLinked.Controller.ofZipper
        ((WeakPathUniversality.finiteCTSUniformCertificate program).certificate
          bits).system.initial)).cursor.erase =
      ((WeakPathUniversality.finiteCTSUniformCertificate program).certificate
        bits).system.reductionPath.term index
  parentLinkedContractions :
    PureS.ParentLinked.Controller.runMutationCount
      (PureS.SchedulerControl.machine program
        (WeakPathUniversality.canonicalDispatcher program))
      (((WeakPathUniversality.finiteCTSUniformCertificate program).certificate
        bits).system.sampleTick index)
      (PureS.ParentLinked.Controller.ofZipper
        ((WeakPathUniversality.finiteCTSUniformCertificate program).certificate
          bits).system.initial) = index
  controllerTicks :
    ((WeakPathUniversality.finiteCTSUniformCertificate program).certificate
      bits).system.sampleTick index ≤
      controllerTickBound
        (PureS.FiniteController.runtimeStates
          (PureS.SchedulerControl.machine program
            (WeakPathUniversality.canonicalDispatcher program))).length
        index
        ((WeakPathUniversality.finiteCTSUniformCertificate program).encode
          bits).size
  sharedMoves :
    addressMoveCount addresses ≤ sharedMoveBound index
      ((WeakPathUniversality.finiteCTSUniformCertificate program).encode
        bits).size
  totalCharged :
    ((WeakPathUniversality.finiteCTSUniformCertificate program).certificate
      bits).system.sampleTick index + addressMoveCount addresses ≤
      totalChargedBound
        (PureS.FiniteController.runtimeStates
          (PureS.SchedulerControl.machine program
            (WeakPathUniversality.canonicalDispatcher program))).length
        index
        ((WeakPathUniversality.finiteCTSUniformCertificate program).encode
          bits).size
  sharedLift :
    ∃ (Final : Type) (_finalDecEq : DecidableEq Final)
      (finalArena : Arena Final),
      StorePathLift ι arena addresses Final finalArena
          (addressMoveCount addresses) ∧
        finalArena.rootReadback =
          (((WeakPathUniversality.finiteCTSUniformCertificate program).certificate
            bits).system.reductionPath.term index)

/-- The selected pure-S trajectory simultaneously inhabits the parent-linked
and shared-arena implementations with one explicit combined charge. -/
theorem finiteCTS_endToEndLedger
    (program : CTS.Program) (bits : List Bool) (index : Nat)
    {ι : Type} [DecidableEq ι] (arena : Arena ι)
    (addresses : List Address)
    (rootReadback : arena.rootReadback =
      (WeakPathUniversality.finiteCTSUniformCertificate program).encode bits)
    (addressLength : addresses.length = index)
    (addressedPath : AddressedPath addresses
      ((WeakPathUniversality.finiteCTSUniformCertificate program).encode bits)
      (((WeakPathUniversality.finiteCTSUniformCertificate program).certificate
        bits).system.reductionPath.term index)) :
    FiniteCTSLedgerCertificate program bits index arena addresses := by
  let certificate :=
    (WeakPathUniversality.finiteCTSUniformCertificate program).certificate bits
  let system := certificate.system
  let qA := (PureS.FiniteController.runtimeStates
    (PureS.SchedulerControl.machine program
      (WeakPathUniversality.canonicalDispatcher program))).length
  have controllerTicks : system.sampleTick index ≤
      controllerTickBound qA index
        ((WeakPathUniversality.finiteCTSUniformCertificate program).encode
          bits).size := by
    exact WeakPathUniversality.finiteCTS_sampleTick_le_explicit
      program bits index
  have sharedMoves : addressMoveCount addresses ≤
      sharedMoveBound index
        ((WeakPathUniversality.finiteCTSUniformCertificate program).encode
          bits).size := by
    have bound := addressedPath.addressMoveCount_le_initial_size
    rw [addressLength] at bound
    exact bound
  refine
    { rootReadback := rootReadback
      addressLength := addressLength
      addressedPath := addressedPath
      parentLinkedTerm := ?_
      parentLinkedContractions := ?_
      controllerTicks := controllerTicks
      sharedMoves := sharedMoves
      totalCharged := ?_
      sharedLift := ?_ }
  · exact PureS.ParentLinked.Controller.ProductiveSystem.run_sampleTick_erase
      system index
  · exact
      PureS.ParentLinked.Controller.ProductiveSystem.runMutationCount_sampleTick_parentLinked
        system index
  · exact Nat.add_le_add controllerTicks sharedMoves
  · exact arena.lift_addressed_path rootReadback addressedPath

end CostModel.UnifiedResourceLedger

end PureSFormal
