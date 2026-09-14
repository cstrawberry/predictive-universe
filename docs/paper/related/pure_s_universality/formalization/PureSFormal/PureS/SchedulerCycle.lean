import PureSFormal.PureS.SchedulerInvariant
import PureSFormal.PureS.SchedulerAscent
import PureSFormal.PureS.SchedulerResponse
import PureSFormal.PureS.SchedulerContinuation
import PureSFormal.PureS.SchedulerEmpty
import PureSFormal.PureS.SchedulerResponseInvariant
import PureSFormal.PureS.SchedulerProductivity

/-!
# Exact nonempty scheduler cycle

This module joins the construction-facing positive fuel endpoint to the
canonical C4 ascent and the fixed FRAME response.  The result is one exact
finite-controller segment from the literal UP/omega zipper to the completed
RETURN Local, with its mutation count and recursive carrier audit retained.
-/

namespace PureSFormal.PureS

namespace SchedulerCycle

open FiniteController SchedulerControl SchedulerInvariant

abbrev Configuration (program : CTS.Program)
    (dispatcher : ActionDispatcher program) :=
  FiniteController.Configuration (SchedulerControl.Control program dispatcher)

/-- Remaining pending parents after the current positive frame is consumed. -/
def remainingParents
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (fuel : Nat) : List ParentFrame :=
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let continuation := Dovetail.clockExit (fuel + 1) fuel environment
  PrimitiveFuel.pendingParents environment continuation fuel []

/-- Registers after observing the selected front and its complete suffix. -/
def responseRegisters
    (program : CTS.Program) (bit : Bool) (suffix : List Bool) :
    Registers program :=
  SchedulerAscent.scanRegisters
    (((Registers.newJob program).clearScan).observeLive bit) suffix

/-- Literal carrier left by the selected C4 contraction. -/
def deletedCarrier (bit : Bool) (outerContext innerContext : Context) : Term :=
  outerContext.plug
    (Carrier.tombstone bit
      (SchedulerAscent.frontPredecessor innerContext)
      (SchedulerAscent.frontPredecessor innerContext))

/-- The pending-parent stack exposes one frame before the remaining stack. -/
theorem pendingParents_succ_cons
    (environment continuation : Term) :
    ∀ fuel parents,
      PrimitiveFuel.pendingParents environment continuation (fuel + 1) parents =
        .right (.app environment continuation) ::
          PrimitiveFuel.pendingParents environment continuation fuel parents
  | 0, _ => rfl
  | fuel + 1, parents => by
      change PrimitiveFuel.pendingParents environment continuation (fuel + 1)
          (.right (.app environment continuation) :: parents) =
        .right (.app environment continuation) ::
          PrimitiveFuel.pendingParents environment continuation (fuel + 1)
            parents
      rw [pendingParents_succ_cons environment continuation fuel
        (.right (.app environment continuation) :: parents)]
      rfl

/-- Specialized pending-parent split at the positive-stage environment. -/
theorem positiveStageParents_split
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (fuel : Nat) :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    let continuation := Dovetail.clockExit (fuel + 1) fuel environment
    PrimitiveFuel.pendingParents environment continuation (fuel + 1) [] =
      .right (PendingFrame.frameFunction haltCode
        (compileActions program dispatcher.tree) (word bits) continuation) ::
        remainingParents program dispatcher bits fuel := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let continuation := Dovetail.clockExit (fuel + 1) fuel environment
  simpa [remainingParents, PendingFrame.environmentCode_eq_envelope,
    PendingFrame.frameFunction] using!
    pendingParents_succ_cons environment continuation fuel []

/-- The scan records the selected bit and the exact later-live flag. -/
theorem responseRegisters_spec
    (program : CTS.Program) (bit : Bool) (suffix : List Bool) :
    let registers := responseRegisters program bit suffix
    registers.bit = some bit ∧ registers.seen = true ∧
      registers.tail = !suffix.isEmpty := by
  exact SchedulerAscent.scanRegisters_afterFirst_coherent
    (Registers.newJob program).clearScan bit suffix (by rfl) (by rfl)

/-- Scanning never changes the fixed cyclic phase register. -/
theorem scanRegisters_phase
    (registers : Registers program) : ∀ suffix,
    (SchedulerAscent.scanRegisters registers suffix).phase = registers.phase
  | [] => rfl
  | bit :: suffix => by
      change (SchedulerAscent.scanRegisters (registers.observeLive bit)
        suffix).phase = registers.phase
      rw [scanRegisters_phase (registers.observeLive bit) suffix]
      unfold Registers.observeLive
      split <;> rfl

/-- Scanning never changes the normal/empty return flag. -/
theorem scanRegisters_empty
    (registers : Registers program) : ∀ suffix,
    (SchedulerAscent.scanRegisters registers suffix).empty = registers.empty
  | [] => rfl
  | bit :: suffix => by
      change (SchedulerAscent.scanRegisters (registers.observeLive bit)
        suffix).empty = registers.empty
      rw [scanRegisters_empty (registers.observeLive bit) suffix]
      unfold Registers.observeLive
      split <;> rfl

/-- The first response always selects the CTS zero phase. -/
theorem responseRegisters_phase
    (program : CTS.Program) (bit : Bool) (suffix : List Bool) :
    (responseRegisters program bit suffix).phase = CTS.zeroPhase program := by
  rw [responseRegisters, scanRegisters_phase]
  rfl

/-- Complete logical interpretation of the first-response register bank. -/
theorem responseRegisters_coherent
    (program : CTS.Program) (bit : Bool) (suffix : List Bool) :
    RegistersCoherent (responseRegisters program bit suffix)
      (CTS.zeroPhase program) (bit :: suffix) false := by
  obtain ⟨bitEq, seenEq, tailEq⟩ :=
    responseRegisters_spec program bit suffix
  refine ⟨responseRegisters_phase program bit suffix, ?_, ?_, ?_, ?_⟩
  · simpa [scanBit?] using bitEq
  · simpa [scanSeen] using seenEq
  · cases suffix <;> simpa [scanTail] using tailEq
  · rw [responseRegisters, scanRegisters_empty]
    rfl

/-! ## Carrier-generic nonempty response -/

/-- Registers after scanning an arbitrary nonempty decoded carrier. -/
def scannedRegisters
    (registers : Registers program) (bit : Bool) (suffix : List Bool) :
    Registers program :=
  SchedulerAscent.scanRegisters (registers.observeLive bit) suffix

/-- Canonical FRAME/DISPATCH endpoint for an arbitrary selected carrier. -/
def selectedFrameConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (suffix seedBits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    Configuration program dispatcher :=
  SchedulerResponse.frameConfiguration program dispatcher
    (scannedRegisters registers bit suffix) seedBits continuation carrier parents

/-- Canonical completed RETURN endpoint for an arbitrary selected carrier. -/
def selectedReturnConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (suffix seedBits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    Configuration program dispatcher :=
  SchedulerResponse.returnConfiguration program dispatcher
    (scannedRegisters registers bit suffix) bit seedBits continuation carrier
    parents

/-- The generic scan preserves the selected first bit. -/
theorem scannedRegisters_bit
    (registers : Registers program) (bit : Bool) (suffix : List Bool)
    (notSeen : registers.seen = false) :
    (scannedRegisters registers bit suffix).bit = some bit := by
  have firstSeen : (registers.observeLive bit).seen = true := by
    simp [Registers.observeLive, notSeen]
  have firstBit : (registers.observeLive bit).bit = some bit := by
    simp [Registers.observeLive, notSeen]
  exact (SchedulerAscent.scanRegisters_bit_of_seen
    (registers.observeLive bit) suffix firstSeen).trans firstBit

/-- The finite return guard is exactly the successor-data emptiness test. -/
theorem outputEmpty_scannedRegisters
    (program : CTS.Program) (registers : Registers program)
    (bit : Bool) (suffix : List Bool)
    (notSeen : registers.seen = false) (noTail : registers.tail = false) :
    SchedulerControl.outputEmpty program
        (scannedRegisters registers bit suffix) bit =
      (CTS.absorbingStep program
        ⟨registers.phase, bit :: suffix⟩).data.isEmpty := by
  have scanned := SchedulerAscent.scanRegisters_afterFirst_coherent registers
    bit suffix notSeen noTail
  have phaseEq : (scannedRegisters registers bit suffix).phase =
      registers.phase := by
    change (SchedulerAscent.scanRegisters (registers.observeLive bit)
      suffix).phase = registers.phase
    rw [scanRegisters_phase]
    unfold Registers.observeLive
    split <;> rfl
  have tailEq : (scannedRegisters registers bit suffix).tail =
      !suffix.isEmpty := by
    exact scanned.2.2
  unfold SchedulerControl.outputEmpty SchedulerControl.appendantEmpty
  rw [phaseEq, tailEq]
  cases suffix with
  | nil =>
      cases bit with
      | false => rfl
      | true =>
          cases happ : program.appendant registers.phase <;> simp [happ]
  | cons later rest =>
      cases bit <;> rfl

/--
One complete generic nonempty response.  This is the recursive macro theorem:
it consumes a selected decoded front under one canonical pending frame,
performs exactly one C4 plus the fixed route/action response, and returns a
new strongly audited carrier decoding the corresponding CTS successor data.
-/
structure SelectedResponseTrace
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (seedBits : List Bool) (continuation source : Term)
    (admissible : Carrier.Admissible continuation)
    (registers : Registers program) (bit : Bool) (suffix : List Bool)
    (outerContext fullContext innerContext targetContext : Context)
    (parents : List ParentFrame) (ticks : Nat) : Prop where
  sourceDescent : CanonicalTraversal.Descent program dispatcher.tree seedBits
    continuation source (bit :: suffix) fullContext
  selected : CanonicalTraversal.SelectedFront program dispatcher.tree seedBits
    continuation source bit suffix outerContext
  path : SchedulerAscent.FrontPath fullContext outerContext bit innerContext
  targetDescent : CanonicalTraversal.Descent program dispatcher.tree seedBits
    continuation (deletedCarrier bit outerContext innerContext) suffix
    targetContext
  execution : CountedRun (SchedulerControl.machine program dispatcher) ticks
    (1 + LocalResponse.completedCost program
      (dispatcher.route
        ((scannedRegisters registers bit suffix).phase, bit))
      ((scannedRegisters registers bit suffix).phase, bit))
    (upConfiguration program dispatcher registers omega
      (ContextCursor.frames fullContext omega
        (.right (PendingFrame.frameFunction haltCode
          (compileActions program dispatcher.tree) (word seedBits) continuation) ::
          parents)))
    (selectedReturnConfiguration program dispatcher registers bit suffix
      seedBits continuation (deletedCarrier bit outerContext innerContext)
      parents)
  targetHolds : ReachableAudit.Holds program dispatcher.tree seedBits
    continuation (deletedCarrier bit outerContext innerContext)
  resultHolds : ReachableAudit.Holds program dispatcher.tree seedBits
    continuation
    (LocalResponse.completed seedBits continuation
      (deletedCarrier bit outerContext innerContext)
      (SchedulerResponse.completedRoute program dispatcher
        (scannedRegisters registers bit suffix) bit
        (deletedCarrier bit outerContext innerContext)))
  targetDecode : CarrierDecoder.decode? program dispatcher.tree seedBits
    continuation admissible (deletedCarrier bit outerContext innerContext) =
    some suffix
  resultDecode : CarrierDecoder.decode? program dispatcher.tree seedBits
    continuation admissible
    (LocalResponse.completed seedBits continuation
      (deletedCarrier bit outerContext innerContext)
      (SchedulerResponse.completedRoute program dispatcher
        (scannedRegisters registers bit suffix) bit
        (deletedCarrier bit outerContext innerContext))) =
    some ((CTS.absorbingStep program
      ⟨registers.phase, bit :: suffix⟩).data)

/-- Construct the carrier-generic nonempty response macro theorem. -/
theorem selectedResponseTrace
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (seedBits : List Bool) (continuation source : Term)
    (admissible : Carrier.Admissible continuation)
    (registers : Registers program) (bit : Bool) (suffix : List Bool)
    {outerContext : Context}
    (selected : CanonicalTraversal.SelectedFront program dispatcher.tree
      seedBits continuation source bit suffix outerContext)
    (parents : List ParentFrame) (notSeen : registers.seen = false) :
    ∃ fullContext innerContext targetContext ticks,
      SelectedResponseTrace program dispatcher seedBits continuation source
        admissible registers bit suffix outerContext fullContext innerContext
        targetContext parents ticks := by
  obtain ⟨fullContext, innerContext, sourceDescent, path⟩ :=
    SchedulerAscent.FrontPath.ofSelectedFront admissible selected
  obtain ⟨targetContext, targetDescent, certificate⟩ :=
    SchedulerAscent.selectedFront_deleteAtPath selected sourceDescent path
  let carrier := deletedCarrier bit outerContext innerContext
  let finalRegisters := scannedRegisters registers bit suffix
  obtain ⟨ascentTicks, ascent⟩ :=
    SchedulerAscent.selectedFront_frameDispatch_countedRun program dispatcher
      admissible selected registers path haltCode
      (compileActions program dispatcher.tree) (word seedBits) continuation
      parents notSeen
  have ascent' : CountedRun (SchedulerControl.machine program dispatcher)
      ascentTicks 1
      (upConfiguration program dispatcher registers omega
        (ContextCursor.frames fullContext omega
          (.right (PendingFrame.frameFunction haltCode
            (compileActions program dispatcher.tree) (word seedBits)
              continuation) :: parents)))
      (selectedFrameConfiguration program dispatcher registers bit suffix
        seedBits continuation carrier parents) := by
    simpa [selectedFrameConfiguration, SchedulerResponse.frameConfiguration,
      SchedulerResponse.frameCursor, PendingFrame.frame_eq_pending,
      scannedRegisters, finalRegisters, carrier, deletedCarrier] using! ascent
  have bitEq := scannedRegisters_bit registers bit suffix notSeen
  have response := SchedulerResponse.frameResponse_countedRun program dispatcher
    finalRegisters bit seedBits continuation carrier parents bitEq
  have response' : CountedRun (SchedulerControl.machine program dispatcher)
      (1 + ((SchedulerControl.jobScript program dispatcher
        (.normalResponse (finalRegisters.phase, bit))).length + 1))
      (LocalResponse.completedCost program
        (dispatcher.route (finalRegisters.phase, bit))
        (finalRegisters.phase, bit))
      (selectedFrameConfiguration program dispatcher registers bit suffix
        seedBits continuation carrier parents)
      (selectedReturnConfiguration program dispatcher registers bit suffix
        seedBits continuation carrier parents) := by
    simpa [selectedFrameConfiguration, selectedReturnConfiguration,
      finalRegisters] using response
  let ticks := ascentTicks +
    (1 + ((SchedulerControl.jobScript program dispatcher
      (.normalResponse (finalRegisters.phase, bit))).length + 1))
  have execution : CountedRun (SchedulerControl.machine program dispatcher)
      ticks
      (1 + LocalResponse.completedCost program
        (dispatcher.route (finalRegisters.phase, bit))
        (finalRegisters.phase, bit))
      (upConfiguration program dispatcher registers omega
        (ContextCursor.frames fullContext omega
          (.right (PendingFrame.frameFunction haltCode
            (compileActions program dispatcher.tree) (word seedBits)
              continuation) :: parents)))
      (selectedReturnConfiguration program dispatcher registers bit suffix
        seedBits continuation carrier parents) := by
    simpa [ticks] using ascent'.trans response'
  have targetHolds : ReachableAudit.Holds program dispatcher.tree seedBits
      continuation carrier := by
    simpa [carrier] using! targetDescent.holds
  have resultHolds := SchedulerResponse.completed_holds program dispatcher
    finalRegisters bit seedBits continuation carrier targetHolds
  have targetDecode : CarrierDecoder.decode? program dispatcher.tree seedBits
      continuation admissible carrier = some suffix := by
    simpa [carrier] using!
      LocalTransition.Descent.decode_eq program dispatcher.tree seedBits
        continuation admissible targetDescent
  have resultDecode := CarrierActionDecode.decode_completed program
    dispatcher.tree seedBits continuation admissible
    (SchedulerResponse.completedRoute_snapshotDispatch program dispatcher
      finalRegisters bit carrier) targetDecode
  have resultDecode' : CarrierDecoder.decode? program dispatcher.tree seedBits
      continuation admissible
      (LocalResponse.completed seedBits continuation carrier
        (SchedulerResponse.completedRoute program dispatcher finalRegisters bit
          carrier)) =
      some ((CTS.absorbingStep program
        ⟨registers.phase, bit :: suffix⟩).data) := by
    rw [ActionDecode.outputData_eq_ordinaryStep_data] at resultDecode
    have phaseEq : finalRegisters.phase = registers.phase := by
      change (SchedulerAscent.scanRegisters (registers.observeLive bit)
        suffix).phase = registers.phase
      rw [scanRegisters_phase]
      unfold Registers.observeLive
      split <;> rfl
    rw [phaseEq] at resultDecode
    exact resultDecode
  refine ⟨fullContext, innerContext, targetContext, ticks, sourceDescent,
    selected, path, ?_, execution, targetHolds, resultHolds, targetDecode,
    resultDecode'⟩
  simpa [carrier] using! targetDescent

/-- Exact UP/omega endpoint produced by the positive Base descent. -/
def positiveStageUpConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (fuel : Nat)
    (fullContext : Context) : Configuration program dispatcher :=
  let bits := bit :: suffix
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let continuation := Dovetail.clockExit (fuel + 1) fuel environment
  upConfiguration program dispatcher (Registers.newJob program).clearScan omega
    (ContextCursor.frames fullContext omega
      (PrimitiveFuel.pendingParents environment continuation (fuel + 1) []))

/-- Exact FRAME/DISPATCH state after deleting the selected front cell. -/
def firstFrameConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (fuel : Nat)
    (outerContext innerContext : Context) : Configuration program dispatcher :=
  let bits := bit :: suffix
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let continuation := Dovetail.clockExit (fuel + 1) fuel environment
  SchedulerResponse.frameConfiguration program dispatcher
    (responseRegisters program bit suffix) bits continuation
    (deletedCarrier bit outerContext innerContext)
    (remainingParents program dispatcher bits fuel)

/-- Exact completed RETURN Local after the selected normal response. -/
def firstReturnConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (fuel : Nat)
    (outerContext innerContext : Context) : Configuration program dispatcher :=
  let bits := bit :: suffix
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let continuation := Dovetail.clockExit (fuel + 1) fuel environment
  SchedulerResponse.returnConfiguration program dispatcher
    (responseRegisters program bit suffix) bit bits continuation
    (deletedCarrier bit outerContext innerContext)
    (remainingParents program dispatcher bits fuel)

/-- Exact mutation count of the fixed response after the one C4 deletion. -/
def firstResponseMutations
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) : Nat :=
  1 + LocalResponse.completedCost program
    (dispatcher.route ((responseRegisters program bit suffix).phase, bit))
    ((responseRegisters program bit suffix).phase, bit)

/-- The exact FRAME/DISPATCH source is decoder-silent in every outer depth. -/
theorem firstFrame_silent
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (fuel : Nat)
    (outerContext innerContext : Context) :
    SilentEvidence program dispatcher.tree .frameDispatch
      (firstFrameConfiguration program dispatcher bit suffix fuel outerContext
        innerContext).cursor.erase := by
  let bits := bit :: suffix
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let continuation := Dovetail.clockExit (fuel + 1) fuel environment
  let carrier := deletedCarrier bit outerContext innerContext
  cases fuel with
  | zero =>
      apply SilentEvidence.ofEndpointFailure
      apply CheckpointExclusion.PreFrameShape.failure
      refine
        { seedPayload := word bits
          continuation := continuation
          child := carrier
          source_eq := ?_ }
      simp [firstFrameConfiguration, SchedulerResponse.frameConfiguration,
        SchedulerResponse.frameCursor, remainingParents,
        PrimitiveFuel.pendingParents, Cursor.erase, Cursor.rebuild,
        CheckpointDecoder.openEnvironment_word, bits, environment, continuation,
        carrier]
  | succ fuel =>
      apply SilentEvidence.ofEndpointFailure
      change CheckpointExclusion.EndpointFailure program dispatcher.tree
        (Cursor.rebuild
          (PrimitiveFuel.pendingParents environment continuation (fuel + 1) [])
          (frame environment continuation carrier))
      exact pendingParents_failure program dispatcher bits continuation
        (frame environment continuation carrier) (fuel + 1)
        (Nat.succ_ne_zero fuel)

/-- The exact FRAME/DISPATCH source satisfies the simultaneous invariant. -/
theorem firstFrame_holds
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (fuel : Nat)
    (outerContext innerContext targetContext : Context)
    (targetDescent :
      let bits := bit :: suffix
      let environment :=
        environmentCode (compileActions program dispatcher.tree) bits
      let continuation := Dovetail.clockExit (fuel + 1) fuel environment
      CanonicalTraversal.Descent program dispatcher.tree bits continuation
        (deletedCarrier bit outerContext innerContext) suffix targetContext) :
    Holds program dispatcher
      (firstFrameConfiguration program dispatcher bit suffix fuel outerContext
        innerContext) := by
  let bits := bit :: suffix
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let continuation := Dovetail.clockExit (fuel + 1) fuel environment
  let carrier := deletedCarrier bit outerContext innerContext
  have bitEq := (responseRegisters_spec program bit suffix).1
  have coherent := responseRegisters_coherent program bit suffix
  have silent := firstFrame_silent program dispatcher bit suffix fuel
    outerContext innerContext
  have holds := SchedulerResponse.frame_holds program dispatcher
    (responseRegisters program bit suffix) bit bits continuation carrier
    (remainingParents program dispatcher bits fuel) bitEq coherent
    targetDescent.holds silent
  simpa [firstFrameConfiguration, bits, environment, continuation, carrier]
    using holds

/-- Exact tick count of the fixed FRAME/DISPATCH response segment. -/
def frameResponseTicks
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) : Nat :=
  1 + ((SchedulerControl.jobScript program dispatcher
    (.normalResponse ((responseRegisters program bit suffix).phase, bit))).length
      + 1)

/--
The complete nonempty first response, indexed by every proof-relevant context
appearing in the canonical C4 selection.  Its executable endpoint is the
literal completed Local used by subsequent RETURN control.
-/
structure FirstResponseTrace
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (fuel : Nat)
    (outerContext fullContext innerContext targetContext : Context)
    (ascentTicks : Nat) : Prop where
  sourceDescent :
    let bits := bit :: suffix
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    let continuation := Dovetail.clockExit (fuel + 1) fuel environment
    CanonicalTraversal.Descent program dispatcher.tree bits continuation
      (baseCarrier environment continuation) bits fullContext
  selected :
    let bits := bit :: suffix
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    let continuation := Dovetail.clockExit (fuel + 1) fuel environment
    CanonicalTraversal.SelectedFront program dispatcher.tree bits continuation
      (baseCarrier environment continuation) bit suffix outerContext
  path : SchedulerAscent.FrontPath fullContext outerContext bit innerContext
  targetDescent :
    let bits := bit :: suffix
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    let continuation := Dovetail.clockExit (fuel + 1) fuel environment
    CanonicalTraversal.Descent program dispatcher.tree bits continuation
      (deletedCarrier bit outerContext innerContext) suffix targetContext
  ascent : CountedRun (SchedulerControl.machine program dispatcher)
    ascentTicks 1
    (positiveStageUpConfiguration program dispatcher bit suffix fuel fullContext)
    (firstFrameConfiguration program dispatcher bit suffix fuel outerContext
      innerContext)
  frameInvariant : Holds program dispatcher
    (firstFrameConfiguration program dispatcher bit suffix fuel outerContext
      innerContext)
  response : CountedRun (SchedulerControl.machine program dispatcher)
    (frameResponseTicks program dispatcher bit suffix)
    (LocalResponse.completedCost program
      (dispatcher.route ((responseRegisters program bit suffix).phase, bit))
      ((responseRegisters program bit suffix).phase, bit))
    (firstFrameConfiguration program dispatcher bit suffix fuel outerContext
      innerContext)
    (firstReturnConfiguration program dispatcher bit suffix fuel outerContext
      innerContext)
  complete : CountedRun (SchedulerControl.machine program dispatcher)
    (ascentTicks + frameResponseTicks program dispatcher bit suffix)
    (firstResponseMutations program dispatcher bit suffix)
    (positiveStageUpConfiguration program dispatcher bit suffix fuel fullContext)
    (firstReturnConfiguration program dispatcher bit suffix fuel outerContext
      innerContext)
  termReduction : StepsN (firstResponseMutations program dispatcher bit suffix)
    (positiveStageUpConfiguration program dispatcher bit suffix fuel
      fullContext).cursor.erase
    (firstReturnConfiguration program dispatcher bit suffix fuel outerContext
      innerContext).cursor.erase
  targetHolds :
    let bits := bit :: suffix
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    let continuation := Dovetail.clockExit (fuel + 1) fuel environment
    ReachableAudit.Holds program dispatcher.tree bits continuation
      (deletedCarrier bit outerContext innerContext)
  returnHolds :
    let bits := bit :: suffix
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    let continuation := Dovetail.clockExit (fuel + 1) fuel environment
    ReachableAudit.Holds program dispatcher.tree bits continuation
      (LocalResponse.completed bits continuation
        (deletedCarrier bit outerContext innerContext)
        (SchedulerResponse.completedRoute program dispatcher
          (responseRegisters program bit suffix) bit
          (deletedCarrier bit outerContext innerContext)))
  targetDecode :
    let bits := bit :: suffix
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    let continuation := Dovetail.clockExit (fuel + 1) fuel environment
    CarrierDecoder.decode? program dispatcher.tree bits continuation
      (Dovetail.clockExit_admissible (fuel + 1) fuel environment)
      (deletedCarrier bit outerContext innerContext) = some suffix
  returnDecode :
    let bits := bit :: suffix
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    let continuation := Dovetail.clockExit (fuel + 1) fuel environment
    CarrierDecoder.decode? program dispatcher.tree bits continuation
      (Dovetail.clockExit_admissible (fuel + 1) fuel environment)
      (LocalResponse.completed bits continuation
        (deletedCarrier bit outerContext innerContext)
        (SchedulerResponse.completedRoute program dispatcher
          (responseRegisters program bit suffix) bit
          (deletedCarrier bit outerContext innerContext))) =
      some ((CTS.absorbingStep program
        ⟨CTS.zeroPhase program, bit :: suffix⟩).data)

/--
Construct the exact UP-to-RETURN segment for every nonempty seed word and
every positive fuel layer.  The existential contexts are the canonical
descent/front witnesses themselves; no cursor address is chosen externally.
-/
theorem firstResponseTrace
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (fuel : Nat) :
    ∃ outerContext fullContext innerContext targetContext ascentTicks,
      FirstResponseTrace program dispatcher bit suffix fuel outerContext
        fullContext innerContext targetContext ascentTicks := by
  let bits := bit :: suffix
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let continuation := Dovetail.clockExit (fuel + 1) fuel environment
  let baseRegisters := (Registers.newJob program).clearScan
  let registers := responseRegisters program bit suffix
  let parents := remainingParents program dispatcher bits fuel
  have admissible : Carrier.Admissible continuation :=
    Dovetail.clockExit_admissible (fuel + 1) fuel environment
  obtain ⟨baseContext, baseDescent⟩ :=
    positiveStageBaseDescent program dispatcher bits fuel
  obtain ⟨outerContext, selected⟩ := baseDescent.selectedFront
  obtain ⟨fullContext, innerContext, sourceDescent, path⟩ :=
    SchedulerAscent.FrontPath.ofSelectedFront admissible selected
  obtain ⟨targetContext, targetDescent, certificate⟩ :=
    SchedulerAscent.selectedFront_deleteAtPath selected sourceDescent path
  let carrier := deletedCarrier bit outerContext innerContext
  obtain ⟨ascentTicks, ascent⟩ :=
    SchedulerAscent.selectedFront_frameDispatch_countedRun program dispatcher
      admissible selected baseRegisters path haltCode
      (compileActions program dispatcher.tree) (word bits) continuation parents
      (by rfl)
  have parentSplit := positiveStageParents_split program dispatcher bits fuel
  have ascent' : CountedRun (SchedulerControl.machine program dispatcher)
      ascentTicks 1
      (positiveStageUpConfiguration program dispatcher bit suffix fuel
        fullContext)
      (firstFrameConfiguration program dispatcher bit suffix fuel outerContext
        innerContext) := by
    rw [positiveStageUpConfiguration]
    change CountedRun (SchedulerControl.machine program dispatcher) ascentTicks 1
      (upConfiguration program dispatcher baseRegisters omega
        (ContextCursor.frames fullContext omega
          (PrimitiveFuel.pendingParents environment continuation (fuel + 1) [])))
      (firstFrameConfiguration program dispatcher bit suffix fuel outerContext
        innerContext)
    rw [parentSplit]
    simpa [firstFrameConfiguration, SchedulerResponse.frameConfiguration,
      SchedulerResponse.frameCursor, PendingFrame.frame_eq_pending,
      responseRegisters, registers, carrier, deletedCarrier, remainingParents,
      bits, environment, continuation, baseRegisters, parents] using! ascent
  have registersSpec := responseRegisters_spec program bit suffix
  have response := SchedulerResponse.frameResponse_countedRun program dispatcher
    registers bit bits continuation carrier parents registersSpec.1
  have response' : CountedRun (SchedulerControl.machine program dispatcher)
      (frameResponseTicks program dispatcher bit suffix)
      (LocalResponse.completedCost program
        (dispatcher.route ((responseRegisters program bit suffix).phase, bit))
        ((responseRegisters program bit suffix).phase, bit))
      (firstFrameConfiguration program dispatcher bit suffix fuel outerContext
        innerContext)
      (firstReturnConfiguration program dispatcher bit suffix fuel outerContext
        innerContext) := by
    simpa [frameResponseTicks, firstFrameConfiguration,
      firstReturnConfiguration, bits, environment, continuation, carrier,
      registers, parents] using response
  have complete' := ascent'.trans response'
  have complete : CountedRun (SchedulerControl.machine program dispatcher)
      (ascentTicks + frameResponseTicks program dispatcher bit suffix)
      (firstResponseMutations program dispatcher bit suffix)
      (positiveStageUpConfiguration program dispatcher bit suffix fuel
        fullContext)
      (firstReturnConfiguration program dispatcher bit suffix fuel outerContext
        innerContext) := by
    simpa [firstResponseMutations] using complete'
  have termReduction := FiniteController.run_projects_stepsN
    (SchedulerControl.machine program dispatcher)
    (ascentTicks + frameResponseTicks program dispatcher bit suffix)
    (positiveStageUpConfiguration program dispatcher bit suffix fuel
      fullContext)
  rw [complete.count_eq, complete.run_eq] at termReduction
  have targetHolds : ReachableAudit.Holds program dispatcher.tree bits
      continuation carrier := by
    simpa [carrier] using! targetDescent.holds
  have completedHolds : ReachableAudit.Holds program dispatcher.tree bits
      continuation
      (LocalResponse.completed bits continuation carrier
        (SchedulerResponse.completedRoute program dispatcher registers bit
          carrier)) :=
    SchedulerResponse.completed_holds program dispatcher registers bit bits
      continuation carrier targetHolds
  have targetDecode : CarrierDecoder.decode? program dispatcher.tree bits
      continuation admissible carrier = some suffix := by
    simpa [carrier] using!
      LocalTransition.Descent.decode_eq program dispatcher.tree bits continuation
        admissible targetDescent
  have completedDecode := CarrierActionDecode.decode_completed program
    dispatcher.tree bits continuation admissible
    (SchedulerResponse.completedRoute_snapshotDispatch program dispatcher
      registers bit carrier) targetDecode
  have completedDecode' : CarrierDecoder.decode? program dispatcher.tree bits
      continuation admissible
      (LocalResponse.completed bits continuation carrier
        (SchedulerResponse.completedRoute program dispatcher registers bit
          carrier)) =
      some ((CTS.absorbingStep program
        ⟨CTS.zeroPhase program, bit :: suffix⟩).data) := by
    rw [ActionDecode.outputData_eq_ordinaryStep_data,
      responseRegisters_phase program bit suffix] at completedDecode
    exact completedDecode
  refine ⟨outerContext, fullContext, innerContext, targetContext, ascentTicks,
    sourceDescent, selected, path, ?_, ascent', ?_, response', complete,
    termReduction,
    targetHolds, completedHolds, targetDecode, completedDecode'⟩
  · simpa [carrier] using! targetDescent
  · exact firstFrame_holds program dispatcher bit suffix fuel outerContext
      innerContext targetContext (by simpa [carrier] using! targetDescent)

/-! ## Positive stage through its first completed response -/

/--
Rebuild the positive-stage DOWN/UP certificate at a caller-supplied canonical
Base descent.  This pins the zero-mutation endpoint to the same full context
used by the subsequent selected-front ascent.
-/
theorem positiveStageDownUpAtDescent
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (clockRegisters : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (clockCoherent : RegistersCoherent clockRegisters phase scanned emptyMode)
    (sampleIndex fuel : Nat) {fullContext : Context}
    (descent :
      let environment :=
        environmentCode (compileActions program dispatcher.tree) bits
      let continuation := Dovetail.clockExit (fuel + 1) fuel environment
      CanonicalTraversal.Descent program dispatcher.tree bits continuation
        (baseCarrier environment continuation) bits fullContext) :
    ∃ descentTicks,
      PositiveStageDownUpTrace program dispatcher bits clockRegisters phase
        scanned emptyMode clockCoherent sampleIndex fuel fullContext
        descentTicks := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let continuation := Dovetail.clockExit (fuel + 1) fuel environment
  let parents :=
    PrimitiveFuel.pendingParents environment continuation (fuel + 1) []
  have phaseTrace := positiveStagePhaseTrace program dispatcher bits
    clockRegisters phase scanned emptyMode clockCoherent sampleIndex fuel
  obtain ⟨descentTicks, descentRun⟩ := run_downDescent
    (registers := (Registers.newJob program).clearScan) descent parents
  have upSilent := positiveStageUp_silent program dispatcher bits fuel descent
  have coherent := (RegistersCoherent.initial program).clearScan
  have upHolds := upDescent_holds (Registers.newJob program).clearScan descent
    parents coherent upSilent
  have finalToUp := phaseTrace.final_to_down.trans descentRun
  refine ⟨descentTicks, phaseTrace, descent, ?_, upHolds, ?_⟩
  · simpa [fuelPhaseCompletedConfiguration, downConfiguration, environment,
      continuation, parents] using descentRun
  · simpa [environment, continuation, parents, Nat.add_assoc] using finalToUp

/--
One positive stage followed by the first nonempty carrier response, with a
single shared canonical descent context at the DOWN/UP/selected-front seam.
-/
structure PositiveStageFirstResponseTrace
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (clockRegisters : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (clockCoherent : RegistersCoherent clockRegisters phase scanned emptyMode)
    (sampleIndex fuel : Nat)
    (outerContext fullContext innerContext targetContext : Context)
    (descentTicks ascentTicks : Nat) : Prop where
  stage : PositiveStageDownUpTrace program dispatcher (bit :: suffix)
    clockRegisters phase scanned emptyMode clockCoherent sampleIndex fuel
    fullContext descentTicks
  response : FirstResponseTrace program dispatcher bit suffix fuel outerContext
    fullContext innerContext targetContext ascentTicks
  finalSample_to_return :
    let bits := bit :: suffix
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    let continuation := Dovetail.clockExit (fuel + 1) fuel environment
    let parents :=
      PrimitiveFuel.pendingParents environment continuation (fuel + 1) []
    CountedRun (SchedulerControl.machine program dispatcher)
      ((1 + descentTicks) +
        (ascentTicks + frameResponseTicks program dispatcher bit suffix))
      (firstResponseMutations program dispatcher bit suffix)
      (fuelZeroFifthMutationConfiguration program dispatcher
        (Registers.newJob program) environment continuation parents)
      (firstReturnConfiguration program dispatcher bit suffix fuel outerContext
        innerContext)

/-- Construct the full positive-stage/first-response seam certificate. -/
theorem positiveStageFirstResponseTrace
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (clockRegisters : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (clockCoherent : RegistersCoherent clockRegisters phase scanned emptyMode)
    (sampleIndex fuel : Nat) :
    ∃ outerContext fullContext innerContext targetContext descentTicks
        ascentTicks,
      PositiveStageFirstResponseTrace program dispatcher bit suffix
        clockRegisters phase scanned emptyMode clockCoherent sampleIndex fuel
        outerContext fullContext innerContext targetContext descentTicks
        ascentTicks := by
  obtain ⟨outerContext, fullContext, innerContext, targetContext, ascentTicks,
      response⟩ := firstResponseTrace program dispatcher bit suffix fuel
  obtain ⟨descentTicks, stage⟩ := positiveStageDownUpAtDescent program
    dispatcher (bit :: suffix) clockRegisters phase scanned emptyMode
    clockCoherent sampleIndex fuel response.sourceDescent
  have complete := stage.finalSample_to_up.toCounted.trans response.complete
  refine ⟨outerContext, fullContext, innerContext, targetContext, descentTicks,
    ascentTicks, stage, response, ?_⟩
  simpa [Nat.add_assoc] using complete

/-! ## Recursive nonempty pending-frame cycle -/

/-- A completed response whose next enclosing layer is still pending. -/
def pendingReturnConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (suffix seedBits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    Configuration program dispatcher :=
  SchedulerResponse.nestedReturnConfiguration program dispatcher
    (scannedRegisters registers bit suffix) bit seedBits continuation carrier
    parents

/-- The exact DOWN source after a nonempty response passes its pending guard. -/
def freshPendingDownConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (suffix seedBits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    Configuration program dispatcher :=
  SchedulerResponse.freshNestedDownConfiguration program dispatcher
    (scannedRegisters registers bit suffix) bit seedBits continuation carrier
    parents

/-- Mutation count of the next selected-front response block. -/
def nextResponseMutations
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (suffix : List Bool)
    (nextBit : Bool) (nextSuffix : List Bool) : Nat :=
  1 + LocalResponse.completedCost program
    (dispatcher.route
      ((scannedRegisters (scannedRegisters registers bit suffix).advance
        nextBit nextSuffix).phase, nextBit))
    ((scannedRegisters (scannedRegisters registers bit suffix).advance
      nextBit nextSuffix).phase, nextBit)

/--
One recursive nonempty layer of a bounded job.  The current completed Local
passes the enclosing pending guard, descends through its exact audited
successor carrier, deletes the next canonical front, and finishes the next
route/action response.  The first two segments are mutation-free, so the
whole RETURN-to-RETURN mutation count is exactly the next response count.
-/
structure PendingNonemptyCycleTrace
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (seedBits : List Bool) (continuation source : Term)
    (admissible : Carrier.Admissible continuation)
    (registers : Registers program) (bit : Bool) (suffix : List Bool)
    (outerContext fullContext innerContext targetContext : Context)
    (parents : List ParentFrame) (responseTicks : Nat)
    (current : SelectedResponseTrace program dispatcher seedBits continuation
      source admissible registers bit suffix outerContext fullContext
      innerContext targetContext
      (.right (SchedulerResponse.pendingFunction program dispatcher seedBits
        continuation) :: parents) responseTicks)
    (nextBit : Bool) (nextSuffix : List Bool)
    (nextContext nextOuterContext nextFullContext nextInnerContext
      nextTargetContext : Context)
    (returnTicks downTicks nextTicks : Nat) : Prop where
  data_eq :
    (CTS.absorbingStep program ⟨registers.phase, bit :: suffix⟩).data =
      nextBit :: nextSuffix
  returnToDown : ZeroMutationRun
    (SchedulerControl.machine program dispatcher) returnTicks
    (pendingReturnConfiguration program dispatcher registers bit suffix
      seedBits continuation (deletedCarrier bit outerContext innerContext)
      parents)
    (freshPendingDownConfiguration program dispatcher registers bit suffix
      seedBits continuation (deletedCarrier bit outerContext innerContext)
      parents)
  nextDescent : CanonicalTraversal.Descent program dispatcher.tree seedBits
    continuation
    (LocalResponse.completed seedBits continuation
      (deletedCarrier bit outerContext innerContext)
      (SchedulerResponse.completedRoute program dispatcher
        (scannedRegisters registers bit suffix) bit
        (deletedCarrier bit outerContext innerContext)))
    (nextBit :: nextSuffix) nextContext
  nextSelected : CanonicalTraversal.SelectedFront program dispatcher.tree
    seedBits continuation
    (LocalResponse.completed seedBits continuation
      (deletedCarrier bit outerContext innerContext)
      (SchedulerResponse.completedRoute program dispatcher
        (scannedRegisters registers bit suffix) bit
        (deletedCarrier bit outerContext innerContext)))
    nextBit nextSuffix nextOuterContext
  downToUp : ZeroMutationRun (SchedulerControl.machine program dispatcher)
    downTicks
    (freshPendingDownConfiguration program dispatcher registers bit suffix
      seedBits continuation (deletedCarrier bit outerContext innerContext)
      parents)
    (upConfiguration program dispatcher
      (scannedRegisters registers bit suffix).advance omega
      (ContextCursor.frames nextContext omega
        (.right (SchedulerResponse.pendingFunction program dispatcher seedBits
          continuation) :: parents)))
  nextResponse : SelectedResponseTrace program dispatcher seedBits continuation
    (LocalResponse.completed seedBits continuation
      (deletedCarrier bit outerContext innerContext)
      (SchedulerResponse.completedRoute program dispatcher
        (scannedRegisters registers bit suffix) bit
        (deletedCarrier bit outerContext innerContext)))
    admissible (scannedRegisters registers bit suffix).advance nextBit
    nextSuffix nextOuterContext nextFullContext nextInnerContext
    nextTargetContext parents nextTicks
  complete : CountedRun (SchedulerControl.machine program dispatcher)
    ((returnTicks + downTicks) + nextTicks)
    (nextResponseMutations program dispatcher registers bit suffix nextBit
      nextSuffix)
    (pendingReturnConfiguration program dispatcher registers bit suffix
      seedBits continuation (deletedCarrier bit outerContext innerContext)
      parents)
    (selectedReturnConfiguration program dispatcher
      (scannedRegisters registers bit suffix).advance nextBit nextSuffix
      seedBits continuation
      (deletedCarrier nextBit nextOuterContext nextInnerContext) parents)

/-- Construct one exact recursive pending-frame cycle for a nonempty CTS
successor. -/
theorem pendingNonemptyCycleTrace
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (seedBits : List Bool) (continuation source : Term)
    (admissible : Carrier.Admissible continuation)
    (registers : Registers program) (bit : Bool) (suffix : List Bool)
    {outerContext fullContext innerContext targetContext : Context}
    (parents : List ParentFrame) (responseTicks : Nat)
    (current : SelectedResponseTrace program dispatcher seedBits continuation
      source admissible registers bit suffix outerContext fullContext
      innerContext targetContext
      (.right (SchedulerResponse.pendingFunction program dispatcher seedBits
        continuation) :: parents) responseTicks)
    (notSeen : registers.seen = false) (noTail : registers.tail = false)
    (nextBit : Bool) (nextSuffix : List Bool)
    (dataEq :
      (CTS.absorbingStep program ⟨registers.phase, bit :: suffix⟩).data =
        nextBit :: nextSuffix) :
    ∃ nextContext nextOuterContext nextFullContext nextInnerContext
        nextTargetContext returnTicks downTicks nextTicks,
      PendingNonemptyCycleTrace program dispatcher seedBits continuation source
        admissible registers bit suffix outerContext fullContext innerContext
        targetContext parents responseTicks current nextBit nextSuffix
        nextContext nextOuterContext nextFullContext nextInnerContext
        nextTargetContext returnTicks downTicks nextTicks := by
  let finalRegisters := scannedRegisters registers bit suffix
  let carrier := deletedCarrier bit outerContext innerContext
  let completed := LocalResponse.completed seedBits continuation carrier
    (SchedulerResponse.completedRoute program dispatcher finalRegisters bit
      carrier)
  have bitEq : finalRegisters.bit = some bit := by
    simpa [finalRegisters] using
      scannedRegisters_bit registers bit suffix notSeen
  have outputEq : SchedulerControl.outputEmpty program finalRegisters bit =
      false := by
    have exactOutput := outputEmpty_scannedRegisters program registers bit
      suffix notSeen noTail
    rw [dataEq] at exactOutput
    simpa [finalRegisters] using exactOutput
  have returnRun := SchedulerResponse.returnNoMark_pending_zeroRun program
    dispatcher finalRegisters bit seedBits continuation carrier parents bitEq
    outputEq
  obtain ⟨decoded, nextContext, descent⟩ :=
    CanonicalTraversal.Descent.ofHolds current.resultHolds
  have descentDecode := LocalTransition.Descent.decode_eq program
    dispatcher.tree seedBits continuation admissible descent
  have decodedEq : decoded = nextBit :: nextSuffix := by
    exact (Option.some.inj
      (descentDecode.symm.trans current.resultDecode)).trans dataEq
  subst decoded
  obtain ⟨nextOuterContext, nextSelected⟩ := descent.selectedFront
  obtain ⟨nextFullContext, nextInnerContext, nextTargetContext, nextTicks,
      nextResponse⟩ := selectedResponseTrace program dispatcher seedBits
    continuation completed admissible finalRegisters.advance nextBit nextSuffix
    nextSelected parents (by rfl)
  obtain ⟨downTicks, downRun⟩ := run_downDescent finalRegisters.advance
    nextResponse.sourceDescent
    (.right (SchedulerResponse.pendingFunction program dispatcher seedBits
      continuation) :: parents)
  let returnTicks :=
    1 +
      (SchedulerControl.compiledProbeCost program dispatcher
        (.pending .normalReturn)
        (SchedulerResponse.pendingChildCursor program dispatcher seedBits
          continuation completed parents) + 1)
  have returnRun' : ZeroMutationRun
      (SchedulerControl.machine program dispatcher) returnTicks
      (pendingReturnConfiguration program dispatcher registers bit suffix
        seedBits continuation carrier parents)
      (freshPendingDownConfiguration program dispatcher registers bit suffix
        seedBits continuation carrier parents) := by
    simpa [returnTicks, pendingReturnConfiguration,
      freshPendingDownConfiguration, finalRegisters, carrier, completed] using
      returnRun
  have downRun' : ZeroMutationRun
      (SchedulerControl.machine program dispatcher) downTicks
      (freshPendingDownConfiguration program dispatcher registers bit suffix
        seedBits continuation carrier parents)
      (upConfiguration program dispatcher finalRegisters.advance omega
        (ContextCursor.frames nextFullContext omega
          (.right (SchedulerResponse.pendingFunction program dispatcher
            seedBits continuation) :: parents))) := by
    simpa [freshPendingDownConfiguration, SchedulerResponse.freshNestedDownConfiguration,
      SchedulerResponse.normalPendingDownConfiguration, finalRegisters, carrier,
      completed] using! downRun
  have combined := (returnRun'.trans downRun').toCounted.trans
    nextResponse.execution
  have complete : CountedRun (SchedulerControl.machine program dispatcher)
      ((returnTicks + downTicks) + nextTicks)
      (nextResponseMutations program dispatcher registers bit suffix nextBit
        nextSuffix)
      (pendingReturnConfiguration program dispatcher registers bit suffix
        seedBits continuation carrier parents)
      (selectedReturnConfiguration program dispatcher finalRegisters.advance
        nextBit nextSuffix seedBits continuation
        (deletedCarrier nextBit nextOuterContext nextInnerContext) parents) := by
    simpa [nextResponseMutations, finalRegisters, Nat.add_assoc] using combined
  refine ⟨nextFullContext, nextOuterContext, nextFullContext, nextInnerContext,
    nextTargetContext, returnTicks, downTicks, nextTicks, dataEq, returnRun',
    ?_, nextSelected, downRun', nextResponse, complete⟩
  simpa [completed, finalRegisters, carrier] using nextResponse.sourceDescent

/-! ## Transition into absorbing-empty mode -/

/-- Marking a completed Local does not change its decoded CTS successor. -/
theorem markedCompleted_decode
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (seedBits : List Bool) (continuation carrier : Term)
    (admissible : Carrier.Admissible continuation)
    (registers : Registers program) (bit : Bool) (suffix : List Bool)
    (carrierDecode : CarrierDecoder.decode? program dispatcher.tree seedBits
      continuation admissible carrier = some suffix) :
    CarrierDecoder.decode? program dispatcher.tree seedBits continuation
      admissible
      (LocalResponse.markedCompleted seedBits continuation carrier
        (SchedulerResponse.completedRoute program dispatcher registers bit
          carrier)) =
      some ((CTS.absorbingStep program
        ⟨registers.phase, bit :: suffix⟩).data) := by
  rw [CarrierDecoder.decode?_local program dispatcher.tree seedBits continuation
    admissible
    (SchedulerResponse.completedRoute_snapshotDispatch program dispatcher
      registers bit carrier).toDispatchesTo
    (LocalResponse.markedCompleted_localShell seedBits continuation carrier
      (SchedulerResponse.completedRoute program dispatcher registers bit
        carrier))]
  exact CarrierActionDecode.decode_actionAccumulator_eq_CTS program
    dispatcher.tree seedBits continuation admissible registers.phase bit
    carrierDecode

/-- Register bank selected when an empty scan reaches its enclosing frame. -/
def enteredEmptyRegisters
    (registers : Registers program) : Registers program :=
  { registers with empty := true }

/-- Exact first EMPTY-family endpoint reached from an empty normal response. -/
def enteredEmptyFrameConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (suffix seedBits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    Configuration program dispatcher :=
  let finalRegisters := scannedRegisters registers bit suffix
  let marked := LocalResponse.markedCompleted seedBits continuation carrier
    (SchedulerResponse.completedRoute program dispatcher finalRegisters bit
      carrier)
  SchedulerEmpty.frameConfiguration program dispatcher
    (enteredEmptyRegisters finalRegisters.advance) seedBits continuation marked
    parents

/--
At a pending frame, a scan with no live occurrence takes the EMPTY branch.
The probe, decision, and cursor ascent are all mutation-free.
-/
theorem pendingFrameEmpty_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program)
    (bits : List Bool) (continuation child : Term)
    (parents : List ParentFrame) (notSeen : registers.seen = false) :
    ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (SchedulerAscent.pendingFrameDispatchTicks program dispatcher
        haltCode (compileActions program dispatcher.tree) (word bits)
        continuation child parents)
      (upConfiguration program dispatcher registers child
        (.right (SchedulerResponse.pendingFunction program dispatcher bits
          continuation) :: parents))
      (SchedulerEmpty.frameConfiguration program dispatcher
        (enteredEmptyRegisters registers) bits continuation child parents) := by
  let origin : Cursor :=
    ⟨child, .right (SchedulerResponse.pendingFunction program dispatcher bits
      continuation) :: parents⟩
  let probeStart : Configuration program dispatcher :=
    ⟨some (SchedulerControl.startProbe (.pending .scan) registers), origin⟩
  let decision : Configuration program dispatcher :=
    ⟨some (.macro (.pendingDecision .scan) registers), origin⟩
  have enter : ZeroMutationRun (SchedulerControl.machine program dispatcher) 1
      (upConfiguration program dispatcher registers child
        (.right (SchedulerResponse.pendingFunction program dispatcher bits
          continuation) :: parents)) probeStart := by
    exact ⟨rfl, rfl⟩
  have probeRun := SchedulerAscent.parentProbe_zeroRun program dispatcher
    (.pending .scan) registers origin .right rfl
  have probe : ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher (.pending .scan)
        origin) probeStart decision := by
    simpa [probeStart, decision, origin, SchedulerExecution.commandResult,
      SchedulerControl.compiledProbeAnswer, SchedulerControl.probeSite,
      Probe.parentMatches, SchedulerControl.probePattern,
      SchedulerControl.probeAnswer, PendingFrame.pending,
      ParentFrame.fill] using! probeRun
  have leave : ZeroMutationRun (SchedulerControl.machine program dispatcher) 1
      decision
      (SchedulerEmpty.frameConfiguration program dispatcher
        (enteredEmptyRegisters registers) bits continuation child parents) := by
    constructor
    · simp [FiniteController.run, FiniteController.step,
        SchedulerControl.machine, SchedulerControl.transition, decision,
        origin, SchedulerEmpty.frameConfiguration,
        SchedulerResponse.frameCursor, enteredEmptyRegisters, notSeen,
        SchedulerResponse.pendingFunction,
        PendingFrame.pending, PendingFrame.frameFunction,
        PendingFrame.environmentCode_eq_envelope, frame,
        PendingFrame.frame_eq_pending, ParentFrame.fill,
        Primitive.exec, Cursor.up?]
    · simp [FiniteController.runMutationCount,
        FiniteController.mutationCount, SchedulerControl.machine,
        SchedulerControl.transition, decision, origin, notSeen]
  have complete := (enter.trans probe).trans leave
  simpa [SchedulerAscent.pendingFrameDispatchTicks, origin,
    SchedulerResponse.pendingFunction, Nat.add_assoc] using! complete

/--
Exact RETURN-to-EMPTY seam when a normal response first produces the empty
word.  It performs exactly the registered normal marker, then follows the
empty canonical descent and registered ascent without further contraction.
-/
structure EnterEmptyTrace
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (seedBits : List Bool) (continuation source : Term)
    (admissible : Carrier.Admissible continuation)
    (registers : Registers program) (bit : Bool) (suffix : List Bool)
    (outerContext fullContext innerContext targetContext : Context)
    (parents : List ParentFrame) (responseTicks : Nat)
    (current : SelectedResponseTrace program dispatcher seedBits continuation
      source admissible registers bit suffix outerContext fullContext
      innerContext targetContext
      (.right (SchedulerResponse.pendingFunction program dispatcher seedBits
        continuation) :: parents) responseTicks)
    (emptyContext : Context) (returnTicks downTicks ascentTicks : Nat) : Prop where
  data_eq :
    (CTS.absorbingStep program ⟨registers.phase, bit :: suffix⟩).data = []
  markedHolds : ReachableAudit.Holds program dispatcher.tree seedBits
    continuation
    (LocalResponse.markedCompleted seedBits continuation
      (deletedCarrier bit outerContext innerContext)
      (SchedulerResponse.completedRoute program dispatcher
        (scannedRegisters registers bit suffix) bit
        (deletedCarrier bit outerContext innerContext)))
  emptyDescent : CanonicalTraversal.Descent program dispatcher.tree seedBits
    continuation
    (LocalResponse.markedCompleted seedBits continuation
      (deletedCarrier bit outerContext innerContext)
      (SchedulerResponse.completedRoute program dispatcher
        (scannedRegisters registers bit suffix) bit
        (deletedCarrier bit outerContext innerContext))) [] emptyContext
  returnToDown : CountedRun (SchedulerControl.machine program dispatcher)
    returnTicks 1
    (pendingReturnConfiguration program dispatcher registers bit suffix
      seedBits continuation (deletedCarrier bit outerContext innerContext)
      parents)
    (SchedulerResponse.markedNestedDownConfiguration program dispatcher
      (scannedRegisters registers bit suffix) bit seedBits continuation
      (deletedCarrier bit outerContext innerContext) parents)
  downToUp : ZeroMutationRun (SchedulerControl.machine program dispatcher)
    downTicks
    (SchedulerResponse.markedNestedDownConfiguration program dispatcher
      (scannedRegisters registers bit suffix) bit seedBits continuation
      (deletedCarrier bit outerContext innerContext) parents)
    (upConfiguration program dispatcher
      (scannedRegisters registers bit suffix).advance omega
      (ContextCursor.frames emptyContext omega
        (.right (SchedulerResponse.pendingFunction program dispatcher seedBits
          continuation) :: parents)))
  upToEmpty : ZeroMutationRun (SchedulerControl.machine program dispatcher)
    ascentTicks
    (upConfiguration program dispatcher
      (scannedRegisters registers bit suffix).advance omega
      (ContextCursor.frames emptyContext omega
        (.right (SchedulerResponse.pendingFunction program dispatcher seedBits
          continuation) :: parents)))
    (enteredEmptyFrameConfiguration program dispatcher registers bit suffix
      seedBits continuation (deletedCarrier bit outerContext innerContext)
      parents)
  complete : CountedRun (SchedulerControl.machine program dispatcher)
    ((returnTicks + downTicks) + ascentTicks) 1
    (pendingReturnConfiguration program dispatcher registers bit suffix
      seedBits continuation (deletedCarrier bit outerContext innerContext)
      parents)
    (enteredEmptyFrameConfiguration program dispatcher registers bit suffix
      seedBits continuation (deletedCarrier bit outerContext innerContext)
      parents)

/-- Construct the exact entry into absorbing-empty mode. -/
theorem enterEmptyTrace
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (seedBits : List Bool) (continuation source : Term)
    (admissible : Carrier.Admissible continuation)
    (registers : Registers program) (bit : Bool) (suffix : List Bool)
    {outerContext fullContext innerContext targetContext : Context}
    (parents : List ParentFrame) (responseTicks : Nat)
    (current : SelectedResponseTrace program dispatcher seedBits continuation
      source admissible registers bit suffix outerContext fullContext
      innerContext targetContext
      (.right (SchedulerResponse.pendingFunction program dispatcher seedBits
        continuation) :: parents) responseTicks)
    (notSeen : registers.seen = false) (noTail : registers.tail = false)
    (dataEq :
      (CTS.absorbingStep program ⟨registers.phase, bit :: suffix⟩).data = []) :
    ∃ emptyContext returnTicks downTicks ascentTicks,
      EnterEmptyTrace program dispatcher seedBits continuation source admissible
        registers bit suffix outerContext fullContext innerContext targetContext
        parents responseTicks current emptyContext returnTicks downTicks
        ascentTicks := by
  let finalRegisters := scannedRegisters registers bit suffix
  let carrier := deletedCarrier bit outerContext innerContext
  let completed := LocalResponse.completed seedBits continuation carrier
    (SchedulerResponse.completedRoute program dispatcher finalRegisters bit
      carrier)
  let marked := LocalResponse.markedCompleted seedBits continuation carrier
    (SchedulerResponse.completedRoute program dispatcher finalRegisters bit
      carrier)
  have bitEq : finalRegisters.bit = some bit := by
    simpa [finalRegisters] using
      scannedRegisters_bit registers bit suffix notSeen
  have outputEq : SchedulerControl.outputEmpty program finalRegisters bit =
      true := by
    have exactOutput := outputEmpty_scannedRegisters program registers bit
      suffix notSeen noTail
    rw [dataEq] at exactOutput
    simpa [finalRegisters] using exactOutput
  have returnRun := SchedulerResponse.returnMark_pending_countedRun program
    dispatcher finalRegisters bit seedBits continuation carrier parents bitEq
    outputEq
  have markedHolds : ReachableAudit.Holds program dispatcher.tree seedBits
      continuation marked := by
    simpa [marked, finalRegisters, carrier] using
      SchedulerResponse.marked_holds program dispatcher finalRegisters bit
        seedBits continuation carrier current.targetHolds
  have markedDecode : CarrierDecoder.decode? program dispatcher.tree seedBits
      continuation admissible marked = some [] := by
    have decoded := markedCompleted_decode program dispatcher seedBits
      continuation carrier admissible finalRegisters bit suffix
      current.targetDecode
    have phaseEq : finalRegisters.phase = registers.phase := by
      change (SchedulerAscent.scanRegisters (registers.observeLive bit)
        suffix).phase = registers.phase
      rw [scanRegisters_phase]
      unfold Registers.observeLive
      split <;> rfl
    rw [phaseEq, dataEq] at decoded
    simpa [marked, finalRegisters, carrier] using decoded
  obtain ⟨decoded, emptyContext, descent⟩ :=
    CanonicalTraversal.Descent.ofHolds markedHolds
  have descentDecode := LocalTransition.Descent.decode_eq program
    dispatcher.tree seedBits continuation admissible descent
  have decodedEq : decoded = [] :=
    Option.some.inj (descentDecode.symm.trans markedDecode)
  subst decoded
  obtain ⟨downTicks, downRun⟩ := run_downDescent finalRegisters.advance
    descent
    (.right (SchedulerResponse.pendingFunction program dispatcher seedBits
      continuation) :: parents)
  have registered := SchedulerAscent.RegisteredContext.ofDescentEmpty admissible
    descent
  obtain ⟨registeredTicks, registeredRun⟩ :=
    SchedulerAscent.run_registeredContext program dispatcher
      finalRegisters.advance registered
      (.right (SchedulerResponse.pendingFunction program dispatcher seedBits
        continuation) :: parents)
  have finalNotSeen : finalRegisters.advance.seen = false := rfl
  have enterEmpty := pendingFrameEmpty_zeroRun program dispatcher
    finalRegisters.advance seedBits continuation marked parents finalNotSeen
  let returnTicks :=
    (1 + ((SchedulerControl.jobScript program dispatcher .markNormal).length +
      1)) +
      (SchedulerControl.compiledProbeCost program dispatcher
        (.pending .normalReturn)
        (SchedulerResponse.pendingChildCursor program dispatcher seedBits
          continuation marked parents) + 1)
  let ascentTicks := registeredTicks +
    SchedulerAscent.pendingFrameDispatchTicks program dispatcher haltCode
      (compileActions program dispatcher.tree) (word seedBits) continuation
      marked parents
  have returnRun' : CountedRun (SchedulerControl.machine program dispatcher)
      returnTicks 1
      (pendingReturnConfiguration program dispatcher registers bit suffix
        seedBits continuation carrier parents)
      (SchedulerResponse.markedNestedDownConfiguration program dispatcher
        finalRegisters bit seedBits continuation carrier parents) := by
    simpa [returnTicks, pendingReturnConfiguration, finalRegisters, carrier,
      completed, marked] using returnRun
  have downRun' : ZeroMutationRun (SchedulerControl.machine program dispatcher)
      downTicks
      (SchedulerResponse.markedNestedDownConfiguration program dispatcher
        finalRegisters bit seedBits continuation carrier parents)
      (upConfiguration program dispatcher finalRegisters.advance omega
        (ContextCursor.frames emptyContext omega
          (.right (SchedulerResponse.pendingFunction program dispatcher
            seedBits continuation) :: parents))) := by
    simpa [SchedulerResponse.markedNestedDownConfiguration,
      SchedulerResponse.normalPendingDownConfiguration, finalRegisters,
      carrier, marked] using! downRun
  have upToEmpty' : ZeroMutationRun
      (SchedulerControl.machine program dispatcher) ascentTicks
      (upConfiguration program dispatcher finalRegisters.advance omega
        (ContextCursor.frames emptyContext omega
          (.right (SchedulerResponse.pendingFunction program dispatcher
            seedBits continuation) :: parents)))
      (enteredEmptyFrameConfiguration program dispatcher registers bit suffix
        seedBits continuation carrier parents) := by
    have registeredRun' : ZeroMutationRun
        (SchedulerControl.machine program dispatcher) registeredTicks
        (upConfiguration program dispatcher finalRegisters.advance omega
          (ContextCursor.frames emptyContext omega
            (.right (SchedulerResponse.pendingFunction program dispatcher
              seedBits continuation) :: parents)))
        (upConfiguration program dispatcher finalRegisters.advance marked
          (.right (SchedulerResponse.pendingFunction program dispatcher
            seedBits continuation) :: parents)) := by
      simpa [CanonicalTraversal.Descent.source_eq descent] using registeredRun
    have combined := registeredRun'.trans enterEmpty
    simpa [ascentTicks, enteredEmptyFrameConfiguration, finalRegisters, carrier,
      marked, CanonicalTraversal.Descent.source_eq descent, Nat.add_assoc] using
      combined
  have complete' :=
    (returnRun'.trans downRun'.toCounted).trans upToEmpty'.toCounted
  have complete : CountedRun (SchedulerControl.machine program dispatcher)
      ((returnTicks + downTicks) + ascentTicks) 1
      (pendingReturnConfiguration program dispatcher registers bit suffix
        seedBits continuation carrier parents)
      (enteredEmptyFrameConfiguration program dispatcher registers bit suffix
        seedBits continuation carrier parents) := by
    simpa [Nat.add_assoc] using complete'
  exact ⟨emptyContext, returnTicks, downTicks, ascentTicks, dataEq,
    markedHolds, descent, returnRun', downRun', upToEmpty', complete⟩

/-! ## Exact absorbing-empty sweep through pending layers -/

/-- Register bank after `count` absorbing-empty frame responses. -/
def emptySweepRegisters (program : CTS.Program) :
    Nat → Registers program → Registers program
  | 0, registers => registers
  | count + 1, registers =>
      emptySweepRegisters program count registers.advanceEmpty

/-- Carrier nested by the exact marked zero-action response at each empty
frame. -/
def emptySweepCarrier
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation : Term) :
    Nat → Registers program → Term → Term
  | 0, _, carrier => carrier
  | count + 1, registers, carrier =>
      emptySweepCarrier program dispatcher bits continuation count
        registers.advanceEmpty
        (LocalResponse.markedCompleted bits continuation carrier
          (SchedulerResponse.completedRoute program dispatcher registers false
            carrier))

/-- Exact contraction total of an absorbing-empty pending-frame sweep. -/
def emptySweepMutations
    (program : CTS.Program) (dispatcher : ActionDispatcher program) :
    Nat → Registers program → Nat
  | 0, _ => 0
  | count + 1, registers =>
      (LocalResponse.completedCost program
          (dispatcher.route (registers.phase, false))
          (registers.phase, false) + 1) +
        emptySweepMutations program dispatcher count registers.advanceEmpty

/--
The EMPTY family consumes every remaining canonical pending parent.  At each
layer it performs the selected zero action plus the registered marker, then
advances phase in empty mode.  The final frame itself is left unexecuted for
the terminal continuation theorem.
-/
theorem emptyPendingSweep
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation carrier : Term)
    (registers : Registers program) :
    ∀ count parents,
      ∃ ticks,
        CountedRun (SchedulerControl.machine program dispatcher) ticks
          (emptySweepMutations program dispatcher count registers)
          (SchedulerEmpty.frameConfiguration program dispatcher registers bits
            continuation carrier
            (PrimitiveFuel.pendingParents
              (environmentCode (compileActions program dispatcher.tree) bits)
              continuation count parents))
          (SchedulerEmpty.frameConfiguration program dispatcher
            (emptySweepRegisters program count registers) bits continuation
            (emptySweepCarrier program dispatcher bits continuation count
              registers carrier) parents)
  | 0, parents => ⟨0, by
      exact ⟨rfl, rfl⟩⟩
  | count + 1, parents => by
      let environment :=
        environmentCode (compileActions program dispatcher.tree) bits
      let nextCarrier := LocalResponse.markedCompleted bits continuation carrier
        (SchedulerResponse.completedRoute program dispatcher registers false
          carrier)
      obtain ⟨firstTicks, first⟩ := SchedulerEmpty.frame_toNext_countedRun
        program dispatcher registers bits continuation carrier
        (PrimitiveFuel.pendingParents environment continuation count parents)
      obtain ⟨restTicks, rest⟩ := emptyPendingSweep program dispatcher bits
        continuation nextCarrier registers.advanceEmpty count parents
      have first' : CountedRun (SchedulerControl.machine program dispatcher)
          firstTicks
          (LocalResponse.completedCost program
              (dispatcher.route (registers.phase, false))
              (registers.phase, false) + 1)
          (SchedulerEmpty.frameConfiguration program dispatcher registers bits
            continuation carrier
            (PrimitiveFuel.pendingParents environment continuation (count + 1)
              parents))
          (SchedulerEmpty.frameConfiguration program dispatcher
            registers.advanceEmpty bits continuation nextCarrier
            (PrimitiveFuel.pendingParents environment continuation count
              parents)) := by
        rw [pendingParents_succ_cons environment continuation count parents]
        simpa [environment, nextCarrier, SchedulerResponse.pendingFunction,
          PendingFrame.environmentCode_eq_envelope,
          PendingFrame.frameFunction] using first
      refine ⟨firstTicks + restTicks, ?_⟩
      have combined := first'.trans rest
      simpa [emptySweepRegisters, emptySweepCarrier, emptySweepMutations,
        nextCarrier, environment, Nat.add_assoc] using combined

/-- An absorbing-empty sweep whose continuation has arity three launches the
next bounded job. -/
theorem emptySweepArityThree
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (stage remaining : Nat)
    (registers : Registers program) (carrier : Term) :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    let continuation := Dovetail.clockExit stage (remaining + 1) environment
    ∃ ticks after,
      CountedRun (SchedulerControl.machine program dispatcher) ticks
        (emptySweepMutations program dispatcher (remaining + 1) registers +
          (LocalResponse.completedCost program
              (dispatcher.route
                ((emptySweepRegisters program (remaining + 1) registers).phase,
                  false))
              ((emptySweepRegisters program (remaining + 1) registers).phase,
                false) + 2))
        (SchedulerEmpty.frameConfiguration program dispatcher registers bits
          continuation carrier
          (PrimitiveFuel.pendingParents environment continuation
            (remaining + 1) []))
        (SchedulerContinuation.fuelConfiguration program dispatcher after) := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let continuation := Dovetail.clockExit stage (remaining + 1) environment
  obtain ⟨sweepTicks, sweep⟩ := emptyPendingSweep program dispatcher bits
    continuation carrier registers (remaining + 1) []
  let finalRegisters := emptySweepRegisters program (remaining + 1) registers
  let finalCarrier := emptySweepCarrier program dispatcher bits continuation
    (remaining + 1) registers carrier
  have pendingReject : SchedulerControl.compiledProbeAnswer program dispatcher
      (.pending .emptyReturn)
      (SchedulerEmpty.markedCursor program dispatcher finalRegisters bits
        continuation finalCarrier []) = false := by
    rfl
  have arity : continuation.headArity = 3 := by
    exact Dovetail.headArity_clockExit_succ stage remaining environment
  obtain ⟨terminalTicks, after, terminal⟩ :=
    SchedulerEmpty.terminalArityThree_countedRun program dispatcher
      finalRegisters bits continuation finalCarrier [] pendingReject arity
  refine ⟨sweepTicks + terminalTicks, after, ?_⟩
  have combined := sweep.trans terminal
  simpa [environment, continuation, finalRegisters, finalCarrier,
    Nat.add_assoc] using combined

/-- The horizon-ending absorbing-empty sweep exposes the arity-four terminal
checkpoint and enters clock growth. -/
theorem emptySweepArityFour
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (stage : Nat)
    (registers : Registers program) (carrier : Term) :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    let continuation := Dovetail.clockExit stage 0 environment
    ∃ ticks after,
      CountedRun (SchedulerControl.machine program dispatcher) ticks
        (LocalResponse.completedCost program
            (dispatcher.route (registers.phase, false))
            (registers.phase, false) + 1)
        (SchedulerEmpty.frameConfiguration program dispatcher registers bits
          continuation carrier [])
        (SchedulerContinuation.clockGrowConfiguration program dispatcher
          after) := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let continuation := Dovetail.clockExit stage 0 environment
  have pendingReject : SchedulerControl.compiledProbeAnswer program dispatcher
      (.pending .emptyReturn)
      (SchedulerEmpty.markedCursor program dispatcher registers bits
        continuation carrier []) = false := by
    rfl
  have arity : continuation.headArity = 4 := by
    exact Dovetail.headArity_clockExit_zero stage environment
  simpa [environment, continuation] using
    SchedulerEmpty.terminalArityFour_countedRun program dispatcher registers
      bits continuation carrier [] pendingReject arity

/-! ## Terminal normal-response branches -/

/-- A final nonempty response with an arity-three continuation launches the
next bounded job with exactly the continuation contraction. -/
theorem terminalNonemptyArityThree
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (seedBits : List Bool) (continuation source : Term)
    (admissible : Carrier.Admissible continuation)
    (registers : Registers program) (bit : Bool) (suffix : List Bool)
    {outerContext fullContext innerContext targetContext : Context}
    (responseTicks : Nat)
    (current : SelectedResponseTrace program dispatcher seedBits continuation
      source admissible registers bit suffix outerContext fullContext
      innerContext targetContext [] responseTicks)
    (notSeen : registers.seen = false) (noTail : registers.tail = false)
    (nextBit : Bool) (nextSuffix : List Bool)
    (dataEq :
      (CTS.absorbingStep program ⟨registers.phase, bit :: suffix⟩).data =
        nextBit :: nextSuffix)
    (arity : continuation.headArity = 3) :
    ∃ ticks after,
      CountedRun (SchedulerControl.machine program dispatcher) ticks 1
        (selectedReturnConfiguration program dispatcher registers bit suffix
          seedBits continuation (deletedCarrier bit outerContext innerContext)
          [])
        (SchedulerContinuation.fuelConfiguration program dispatcher after) := by
  let finalRegisters := scannedRegisters registers bit suffix
  let carrier := deletedCarrier bit outerContext innerContext
  have bitEq : finalRegisters.bit = some bit := by
    simpa [finalRegisters] using
      scannedRegisters_bit registers bit suffix notSeen
  have outputEq : SchedulerControl.outputEmpty program finalRegisters bit =
      false := by
    have exactOutput := outputEmpty_scannedRegisters program registers bit
      suffix notSeen noTail
    rw [dataEq] at exactOutput
    simpa [finalRegisters] using exactOutput
  have pendingReject : SchedulerControl.compiledProbeAnswer program dispatcher
      (.pending .normalReturn)
      (SchedulerResponse.completedCursor program dispatcher finalRegisters bit
        seedBits continuation carrier []) = false := by
    rfl
  simpa [selectedReturnConfiguration, finalRegisters, carrier] using
    SchedulerContinuation.freshReturnArityThree_countedRun program dispatcher
      finalRegisters bit seedBits continuation carrier [] bitEq outputEq
      pendingReject arity

/-- A final nonempty response with an arity-four continuation is already the
checkpoint term; cursor-only control enters clock growth. -/
theorem terminalNonemptyArityFour
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (seedBits : List Bool) (continuation source : Term)
    (admissible : Carrier.Admissible continuation)
    (registers : Registers program) (bit : Bool) (suffix : List Bool)
    {outerContext fullContext innerContext targetContext : Context}
    (responseTicks : Nat)
    (current : SelectedResponseTrace program dispatcher seedBits continuation
      source admissible registers bit suffix outerContext fullContext
      innerContext targetContext [] responseTicks)
    (notSeen : registers.seen = false) (noTail : registers.tail = false)
    (nextBit : Bool) (nextSuffix : List Bool)
    (dataEq :
      (CTS.absorbingStep program ⟨registers.phase, bit :: suffix⟩).data =
        nextBit :: nextSuffix)
    (arity : continuation.headArity = 4) :
    ∃ ticks after,
      ZeroMutationRun (SchedulerControl.machine program dispatcher) ticks
        (selectedReturnConfiguration program dispatcher registers bit suffix
          seedBits continuation (deletedCarrier bit outerContext innerContext)
          [])
        (SchedulerContinuation.clockGrowConfiguration program dispatcher
          after) := by
  let finalRegisters := scannedRegisters registers bit suffix
  let carrier := deletedCarrier bit outerContext innerContext
  have bitEq : finalRegisters.bit = some bit := by
    simpa [finalRegisters] using
      scannedRegisters_bit registers bit suffix notSeen
  have outputEq : SchedulerControl.outputEmpty program finalRegisters bit =
      false := by
    have exactOutput := outputEmpty_scannedRegisters program registers bit
      suffix notSeen noTail
    rw [dataEq] at exactOutput
    simpa [finalRegisters] using exactOutput
  have pendingReject : SchedulerControl.compiledProbeAnswer program dispatcher
      (.pending .normalReturn)
      (SchedulerResponse.completedCursor program dispatcher finalRegisters bit
        seedBits continuation carrier []) = false := by
    rfl
  simpa [selectedReturnConfiguration, finalRegisters, carrier] using
    SchedulerContinuation.freshReturnArityFour_zeroRun program dispatcher
      finalRegisters bit seedBits continuation carrier [] bitEq outputEq
      pendingReject arity

/-- A final empty response with arity three performs the marker and
continuation contractions, then launches the next job. -/
theorem terminalEmptyArityThree
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (seedBits : List Bool) (continuation source : Term)
    (admissible : Carrier.Admissible continuation)
    (registers : Registers program) (bit : Bool) (suffix : List Bool)
    {outerContext fullContext innerContext targetContext : Context}
    (responseTicks : Nat)
    (current : SelectedResponseTrace program dispatcher seedBits continuation
      source admissible registers bit suffix outerContext fullContext
      innerContext targetContext [] responseTicks)
    (notSeen : registers.seen = false) (noTail : registers.tail = false)
    (dataEq :
      (CTS.absorbingStep program ⟨registers.phase, bit :: suffix⟩).data = [])
    (arity : continuation.headArity = 3) :
    ∃ ticks after,
      CountedRun (SchedulerControl.machine program dispatcher) ticks 2
        (selectedReturnConfiguration program dispatcher registers bit suffix
          seedBits continuation (deletedCarrier bit outerContext innerContext)
          [])
        (SchedulerContinuation.fuelConfiguration program dispatcher after) := by
  let finalRegisters := scannedRegisters registers bit suffix
  let carrier := deletedCarrier bit outerContext innerContext
  have bitEq : finalRegisters.bit = some bit := by
    simpa [finalRegisters] using
      scannedRegisters_bit registers bit suffix notSeen
  have outputEq : SchedulerControl.outputEmpty program finalRegisters bit =
      true := by
    have exactOutput := outputEmpty_scannedRegisters program registers bit
      suffix notSeen noTail
    rw [dataEq] at exactOutput
    simpa [finalRegisters] using exactOutput
  have pendingReject : SchedulerControl.compiledProbeAnswer program dispatcher
      (.pending .normalReturn)
      (SchedulerResponse.markedCursor program dispatcher finalRegisters bit
        seedBits continuation carrier []) = false := by
    rfl
  simpa [selectedReturnConfiguration, finalRegisters, carrier] using
    SchedulerContinuation.markedReturnArityThree_countedRun program dispatcher
      finalRegisters bit seedBits continuation carrier [] bitEq outputEq
      pendingReject arity

/-- A final empty response with arity four performs exactly its marker before
entering clock growth at the marked checkpoint. -/
theorem terminalEmptyArityFour
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (seedBits : List Bool) (continuation source : Term)
    (admissible : Carrier.Admissible continuation)
    (registers : Registers program) (bit : Bool) (suffix : List Bool)
    {outerContext fullContext innerContext targetContext : Context}
    (responseTicks : Nat)
    (current : SelectedResponseTrace program dispatcher seedBits continuation
      source admissible registers bit suffix outerContext fullContext
      innerContext targetContext [] responseTicks)
    (notSeen : registers.seen = false) (noTail : registers.tail = false)
    (dataEq :
      (CTS.absorbingStep program ⟨registers.phase, bit :: suffix⟩).data = [])
    (arity : continuation.headArity = 4) :
    ∃ ticks after,
      CountedRun (SchedulerControl.machine program dispatcher) ticks 1
        (selectedReturnConfiguration program dispatcher registers bit suffix
          seedBits continuation (deletedCarrier bit outerContext innerContext)
          [])
        (SchedulerContinuation.clockGrowConfiguration program dispatcher
          after) := by
  let finalRegisters := scannedRegisters registers bit suffix
  let carrier := deletedCarrier bit outerContext innerContext
  have bitEq : finalRegisters.bit = some bit := by
    simpa [finalRegisters] using
      scannedRegisters_bit registers bit suffix notSeen
  have outputEq : SchedulerControl.outputEmpty program finalRegisters bit =
      true := by
    have exactOutput := outputEmpty_scannedRegisters program registers bit
      suffix notSeen noTail
    rw [dataEq] at exactOutput
    simpa [finalRegisters] using exactOutput
  have pendingReject : SchedulerControl.compiledProbeAnswer program dispatcher
      (.pending .normalReturn)
      (SchedulerResponse.markedCursor program dispatcher finalRegisters bit
        seedBits continuation carrier []) = false := by
    rfl
  simpa [selectedReturnConfiguration, finalRegisters, carrier] using
    SchedulerContinuation.markedReturnArityFour_countedRun program dispatcher
      finalRegisters bit seedBits continuation carrier [] bitEq outputEq
      pendingReject arity

/-! ## Recursive completion of a bounded job -/

/--
From any completed nonempty-input response with the canonical remaining
pending stack, an arity-four job has a finite exact controller execution to
clock growth.  The returned mutation total is explicit in the `CountedRun`;
the recursive proof follows the actual CTS successor, switching permanently
to the EMPTY sweep exactly when that successor is empty.
-/
theorem finishJobArityFour
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (seedBits : List Bool) (continuation : Term)
    (admissible : Carrier.Admissible continuation)
    (arity : continuation.headArity = 4) :
    ∀ remaining (registers : Registers program) (bit : Bool)
      (suffix : List Bool) (source : Term)
      (outerContext fullContext innerContext targetContext : Context)
      (responseTicks : Nat),
      SelectedResponseTrace program dispatcher seedBits continuation source
        admissible registers bit suffix outerContext fullContext innerContext
        targetContext
        (PrimitiveFuel.pendingParents
          (environmentCode (compileActions program dispatcher.tree) seedBits)
          continuation remaining []) responseTicks →
      registers.seen = false → registers.tail = false →
      ∃ ticks mutations after,
        CountedRun (SchedulerControl.machine program dispatcher) ticks mutations
          (selectedReturnConfiguration program dispatcher registers bit suffix
            seedBits continuation (deletedCarrier bit outerContext innerContext)
            (PrimitiveFuel.pendingParents
              (environmentCode
                (compileActions program dispatcher.tree) seedBits)
              continuation remaining []))
          (SchedulerContinuation.clockGrowConfiguration program dispatcher
            after)
  | 0, registers, bit, suffix, source, outerContext, fullContext, innerContext,
      targetContext, responseTicks, current, notSeen, noTail => by
      have current' : SelectedResponseTrace program dispatcher seedBits
          continuation source admissible registers bit suffix outerContext
          fullContext innerContext targetContext [] responseTicks := by
        simpa [PrimitiveFuel.pendingParents] using current
      cases dataEq :
          (CTS.absorbingStep program
            ⟨registers.phase, bit :: suffix⟩).data with
      | nil =>
          obtain ⟨ticks, after, run⟩ := terminalEmptyArityFour program
            dispatcher seedBits continuation source admissible registers bit
            suffix responseTicks current' notSeen noTail dataEq arity
          exact ⟨ticks, 1, after, by
            simpa [PrimitiveFuel.pendingParents] using run⟩
      | cons nextBit nextSuffix =>
          obtain ⟨ticks, after, run⟩ := terminalNonemptyArityFour program
            dispatcher seedBits continuation source admissible registers bit
            suffix responseTicks current' notSeen noTail nextBit nextSuffix
            dataEq arity
          exact ⟨ticks, 0, after, by
            simpa [PrimitiveFuel.pendingParents] using run.toCounted⟩
  | remaining + 1, registers, bit, suffix, source, outerContext, fullContext,
      innerContext, targetContext, responseTicks, current, notSeen, noTail => by
      let environment :=
        environmentCode (compileActions program dispatcher.tree) seedBits
      have parentSplit := pendingParents_succ_cons environment continuation
        remaining []
      have sourceParentsEq :
          PrimitiveFuel.pendingParents
              (environmentCode
                (compileActions program dispatcher.tree) seedBits)
              continuation (remaining + 1) [] =
            .right (SchedulerResponse.pendingFunction program dispatcher
              seedBits continuation) ::
              PrimitiveFuel.pendingParents
                (environmentCode
                  (compileActions program dispatcher.tree) seedBits)
                continuation remaining [] := by
        simpa [environment, SchedulerResponse.pendingFunction,
          PendingFrame.environmentCode_eq_envelope,
          PendingFrame.frameFunction] using parentSplit
      have current' : SelectedResponseTrace program dispatcher seedBits
          continuation source admissible registers bit suffix outerContext
          fullContext innerContext targetContext
          (.right (SchedulerResponse.pendingFunction program dispatcher
            seedBits continuation) ::
            PrimitiveFuel.pendingParents environment continuation remaining [])
          responseTicks := by
        simpa [environment, SchedulerResponse.pendingFunction,
          PendingFrame.environmentCode_eq_envelope,
          PendingFrame.frameFunction] using parentSplit ▸ current
      cases dataEq :
          (CTS.absorbingStep program
            ⟨registers.phase, bit :: suffix⟩).data with
      | cons nextBit nextSuffix =>
          obtain ⟨nextContext, nextOuterContext, nextFullContext,
              nextInnerContext, nextTargetContext, returnTicks, downTicks,
              nextTicks, cycle⟩ := pendingNonemptyCycleTrace program dispatcher
            seedBits continuation source admissible registers bit suffix
            (PrimitiveFuel.pendingParents environment continuation remaining [])
            responseTicks current' notSeen noTail nextBit nextSuffix dataEq
          obtain ⟨tailTicks, tailMutations, after, tail⟩ :=
            finishJobArityFour program dispatcher seedBits continuation
              admissible arity remaining
              (scannedRegisters registers bit suffix).advance nextBit nextSuffix
              (LocalResponse.completed seedBits continuation
                (deletedCarrier bit outerContext innerContext)
                (SchedulerResponse.completedRoute program dispatcher
                  (scannedRegisters registers bit suffix) bit
                  (deletedCarrier bit outerContext innerContext)))
              nextOuterContext nextFullContext nextInnerContext nextTargetContext
              nextTicks cycle.nextResponse rfl rfl
          refine ⟨((returnTicks + downTicks) + nextTicks) + tailTicks,
            nextResponseMutations program dispatcher registers bit suffix
              nextBit nextSuffix + tailMutations,
            after, ?_⟩
          have combined := cycle.complete.trans tail
          rw [sourceParentsEq]
          simpa [environment, pendingReturnConfiguration,
            SchedulerResponse.nestedReturnConfiguration,
            selectedReturnConfiguration, Nat.add_assoc] using combined
      | nil =>
          obtain ⟨emptyContext, returnTicks, downTicks, ascentTicks, entry⟩ :=
            enterEmptyTrace program dispatcher seedBits continuation source
              admissible registers bit suffix
              (PrimitiveFuel.pendingParents environment continuation remaining
                []) responseTicks current' notSeen noTail dataEq
          let finalRegisters := scannedRegisters registers bit suffix
          let carrier := deletedCarrier bit outerContext innerContext
          let marked := LocalResponse.markedCompleted seedBits continuation
            carrier
            (SchedulerResponse.completedRoute program dispatcher finalRegisters
              bit carrier)
          let emptyRegisters := enteredEmptyRegisters finalRegisters.advance
          obtain ⟨sweepTicks, sweep⟩ := emptyPendingSweep program dispatcher
            seedBits continuation marked emptyRegisters remaining []
          let terminalRegisters :=
            emptySweepRegisters program remaining emptyRegisters
          let terminalCarrier := emptySweepCarrier program dispatcher seedBits
            continuation remaining emptyRegisters marked
          have pendingReject : SchedulerControl.compiledProbeAnswer program
              dispatcher (.pending .emptyReturn)
              (SchedulerEmpty.markedCursor program dispatcher terminalRegisters
                seedBits continuation terminalCarrier []) = false := by
            rfl
          obtain ⟨terminalTicks, after, terminal⟩ :=
            SchedulerEmpty.terminalArityFour_countedRun program dispatcher
              terminalRegisters seedBits continuation terminalCarrier []
              pendingReject arity
          refine ⟨((returnTicks + downTicks) + ascentTicks) +
              (sweepTicks + terminalTicks),
            1 +
              (emptySweepMutations program dispatcher remaining emptyRegisters +
                (LocalResponse.completedCost program
                    (dispatcher.route (terminalRegisters.phase, false))
                    (terminalRegisters.phase, false) + 1)),
            after, ?_⟩
          have combined := (entry.complete.trans sweep).trans terminal
          rw [sourceParentsEq]
          simpa [environment, finalRegisters, carrier, marked,
            emptyRegisters, terminalRegisters, terminalCarrier,
            enteredEmptyFrameConfiguration, pendingReturnConfiguration,
            SchedulerResponse.nestedReturnConfiguration,
            selectedReturnConfiguration, Nat.add_assoc] using combined

/--
Arity-three companion to `finishJobArityFour`.  It executes the same exact
bounded CTS trajectory and performs the one final continuation contraction
that launches the next job's fuel phase.
-/
theorem finishJobArityThree
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (seedBits : List Bool) (continuation : Term)
    (admissible : Carrier.Admissible continuation)
    (arity : continuation.headArity = 3) :
    ∀ remaining (registers : Registers program) (bit : Bool)
      (suffix : List Bool) (source : Term)
      (outerContext fullContext innerContext targetContext : Context)
      (responseTicks : Nat),
      SelectedResponseTrace program dispatcher seedBits continuation source
        admissible registers bit suffix outerContext fullContext innerContext
        targetContext
        (PrimitiveFuel.pendingParents
          (environmentCode (compileActions program dispatcher.tree) seedBits)
          continuation remaining []) responseTicks →
      registers.seen = false → registers.tail = false →
      ∃ ticks mutations after,
        CountedRun (SchedulerControl.machine program dispatcher) ticks mutations
          (selectedReturnConfiguration program dispatcher registers bit suffix
            seedBits continuation (deletedCarrier bit outerContext innerContext)
            (PrimitiveFuel.pendingParents
              (environmentCode
                (compileActions program dispatcher.tree) seedBits)
              continuation remaining []))
          (SchedulerContinuation.fuelConfiguration program dispatcher after)
  | 0, registers, bit, suffix, source, outerContext, fullContext, innerContext,
      targetContext, responseTicks, current, notSeen, noTail => by
      have current' : SelectedResponseTrace program dispatcher seedBits
          continuation source admissible registers bit suffix outerContext
          fullContext innerContext targetContext [] responseTicks := by
        simpa [PrimitiveFuel.pendingParents] using current
      cases dataEq :
          (CTS.absorbingStep program
            ⟨registers.phase, bit :: suffix⟩).data with
      | nil =>
          obtain ⟨ticks, after, run⟩ := terminalEmptyArityThree program
            dispatcher seedBits continuation source admissible registers bit
            suffix responseTicks current' notSeen noTail dataEq arity
          exact ⟨ticks, 2, after, by
            simpa [PrimitiveFuel.pendingParents] using run⟩
      | cons nextBit nextSuffix =>
          obtain ⟨ticks, after, run⟩ := terminalNonemptyArityThree program
            dispatcher seedBits continuation source admissible registers bit
            suffix responseTicks current' notSeen noTail nextBit nextSuffix
            dataEq arity
          exact ⟨ticks, 1, after, by
            simpa [PrimitiveFuel.pendingParents] using run⟩
  | remaining + 1, registers, bit, suffix, source, outerContext, fullContext,
      innerContext, targetContext, responseTicks, current, notSeen, noTail => by
      let environment :=
        environmentCode (compileActions program dispatcher.tree) seedBits
      have parentSplit := pendingParents_succ_cons environment continuation
        remaining []
      have sourceParentsEq :
          PrimitiveFuel.pendingParents
              (environmentCode
                (compileActions program dispatcher.tree) seedBits)
              continuation (remaining + 1) [] =
            .right (SchedulerResponse.pendingFunction program dispatcher
              seedBits continuation) ::
              PrimitiveFuel.pendingParents
                (environmentCode
                  (compileActions program dispatcher.tree) seedBits)
                continuation remaining [] := by
        simpa [environment, SchedulerResponse.pendingFunction,
          PendingFrame.environmentCode_eq_envelope,
          PendingFrame.frameFunction] using parentSplit
      have current' : SelectedResponseTrace program dispatcher seedBits
          continuation source admissible registers bit suffix outerContext
          fullContext innerContext targetContext
          (.right (SchedulerResponse.pendingFunction program dispatcher
            seedBits continuation) ::
            PrimitiveFuel.pendingParents environment continuation remaining [])
          responseTicks := by
        simpa [environment, SchedulerResponse.pendingFunction,
          PendingFrame.environmentCode_eq_envelope,
          PendingFrame.frameFunction] using parentSplit ▸ current
      cases dataEq :
          (CTS.absorbingStep program
            ⟨registers.phase, bit :: suffix⟩).data with
      | cons nextBit nextSuffix =>
          obtain ⟨nextContext, nextOuterContext, nextFullContext,
              nextInnerContext, nextTargetContext, returnTicks, downTicks,
              nextTicks, cycle⟩ := pendingNonemptyCycleTrace program dispatcher
            seedBits continuation source admissible registers bit suffix
            (PrimitiveFuel.pendingParents environment continuation remaining [])
            responseTicks current' notSeen noTail nextBit nextSuffix dataEq
          obtain ⟨tailTicks, tailMutations, after, tail⟩ :=
            finishJobArityThree program dispatcher seedBits continuation
              admissible arity remaining
              (scannedRegisters registers bit suffix).advance nextBit nextSuffix
              (LocalResponse.completed seedBits continuation
                (deletedCarrier bit outerContext innerContext)
                (SchedulerResponse.completedRoute program dispatcher
                  (scannedRegisters registers bit suffix) bit
                  (deletedCarrier bit outerContext innerContext)))
              nextOuterContext nextFullContext nextInnerContext nextTargetContext
              nextTicks cycle.nextResponse rfl rfl
          refine ⟨((returnTicks + downTicks) + nextTicks) + tailTicks,
            nextResponseMutations program dispatcher registers bit suffix
              nextBit nextSuffix + tailMutations,
            after, ?_⟩
          have combined := cycle.complete.trans tail
          rw [sourceParentsEq]
          simpa [environment, pendingReturnConfiguration,
            SchedulerResponse.nestedReturnConfiguration,
            selectedReturnConfiguration, Nat.add_assoc] using combined
      | nil =>
          obtain ⟨emptyContext, returnTicks, downTicks, ascentTicks, entry⟩ :=
            enterEmptyTrace program dispatcher seedBits continuation source
              admissible registers bit suffix
              (PrimitiveFuel.pendingParents environment continuation remaining
                []) responseTicks current' notSeen noTail dataEq
          let finalRegisters := scannedRegisters registers bit suffix
          let carrier := deletedCarrier bit outerContext innerContext
          let marked := LocalResponse.markedCompleted seedBits continuation
            carrier
            (SchedulerResponse.completedRoute program dispatcher finalRegisters
              bit carrier)
          let emptyRegisters := enteredEmptyRegisters finalRegisters.advance
          obtain ⟨sweepTicks, sweep⟩ := emptyPendingSweep program dispatcher
            seedBits continuation marked emptyRegisters remaining []
          let terminalRegisters :=
            emptySweepRegisters program remaining emptyRegisters
          let terminalCarrier := emptySweepCarrier program dispatcher seedBits
            continuation remaining emptyRegisters marked
          have pendingReject : SchedulerControl.compiledProbeAnswer program
              dispatcher (.pending .emptyReturn)
              (SchedulerEmpty.markedCursor program dispatcher terminalRegisters
                seedBits continuation terminalCarrier []) = false := by
            rfl
          obtain ⟨terminalTicks, after, terminal⟩ :=
            SchedulerEmpty.terminalArityThree_countedRun program dispatcher
              terminalRegisters seedBits continuation terminalCarrier []
              pendingReject arity
          refine ⟨((returnTicks + downTicks) + ascentTicks) +
              (sweepTicks + terminalTicks),
            1 +
              (emptySweepMutations program dispatcher remaining emptyRegisters +
                (LocalResponse.completedCost program
                    (dispatcher.route (terminalRegisters.phase, false))
                    (terminalRegisters.phase, false) + 2)),
            after, ?_⟩
          have combined := (entry.complete.trans sweep).trans terminal
          rw [sourceParentsEq]
          simpa [environment, finalRegisters, carrier, marked,
            emptyRegisters, terminalRegisters, terminalCarrier,
            enteredEmptyFrameConfiguration, pendingReturnConfiguration,
            SchedulerResponse.nestedReturnConfiguration,
            selectedReturnConfiguration, Nat.add_assoc] using combined

/-! ## Exact structural pairing of normal-response samples -/

open SchedulerResponseInvariant

theorem trace_append
    {first second : Script} {before middle after : Cursor}
    {firstSamples secondSamples : List Cursor}
    (left : CursorMutationTrace first before firstSamples middle)
    (right : CursorMutationTrace second middle secondSamples after) :
    CursorMutationTrace (first ++ second) before
      (firstSamples ++ secondSamples) after := by
  induction left with
  | nil => simpa using right
  | @step operation rest before middle endpoint samples executes tail ih =>
      cases operation <;> exact .step executes (ih right)

/-- Pointwise list-map congruence without function extensionality. -/
theorem map_eq_each {α β : Type} (function₁ function₂ : α → β) :
    ∀ values : List α, (∀ value, function₁ value = function₂ value) →
      values.map function₁ = values.map function₂
  | [], _ => rfl
  | value :: values, equal => by
      simp only [List.map]
      rw [equal value]
      exact congrArg (List.cons (function₂ value))
        (map_eq_each function₁ function₂ values equal)

theorem frame_trace
    (actions : Term) (bits : List Bool) (continuation carrier : Term)
    (parents : List ParentFrame) :
    ∃ samples,
      CursorMutationTrace PrimitiveScripts.framePrefixScript
        ⟨frame (environmentCode actions bits) continuation carrier, parents⟩
        samples
        ⟨.app actions carrier,
          .right (freshHField carrier) ::
          .left (.app (seedCode bits) carrier) ::
          .left (.app continuation carrier) :: parents⟩ ∧
      samples.map Cursor.erase =
        [Cursor.rebuild parents
          (frameFirstRoot actions bits continuation carrier),
         Cursor.rebuild parents
          (frameSecondRoot actions bits continuation carrier),
         Cursor.rebuild parents
          (freshLocal actions bits continuation carrier)] := by
  unfold PrimitiveScripts.framePrefixScript
  refine ⟨_, .step rfl (.step rfl (.step rfl (.step rfl
    (.step rfl (.step rfl (.step rfl (.step rfl (.nil _)))))))), ?_⟩
  rfl

theorem nodeLeft_trace
    {Label : Type} (encode : Label → Term)
    (left right : Dispatcher.Tree Label) (carrier : Term)
    (parents : List ParentFrame) :
    ∃ samples,
      CursorMutationTrace PrimitiveScripts.nodeLeft
        ⟨.app (nodeCode (compileDispatcher encode left)
          (compileDispatcher encode right)) carrier, parents⟩ samples
        ⟨RouteGrammar.compiledCall encode left carrier,
          .left (RouteGrammar.compiledCall encode right carrier) ::
          .right (.app .s carrier) :: parents⟩ ∧
      samples.map Cursor.erase =
        [Cursor.rebuild parents
          (chosen carrier (.app
            (fork (compileDispatcher encode left)
              (compileDispatcher encode right)) carrier)),
         Cursor.rebuild parents
          (RouteGrammar.selectedLeft carrier
            (RouteGrammar.compiledCall encode left carrier)
            (RouteGrammar.compiledCall encode right carrier))] := by
  unfold PrimitiveScripts.nodeLeft
  refine ⟨_, .step rfl (.step rfl (.step rfl (.step rfl (.nil _)))), ?_⟩
  rfl

theorem nodeRight_trace
    {Label : Type} (encode : Label → Term)
    (left right : Dispatcher.Tree Label) (carrier : Term)
    (parents : List ParentFrame) :
    ∃ samples,
      CursorMutationTrace PrimitiveScripts.nodeRight
        ⟨.app (nodeCode (compileDispatcher encode left)
          (compileDispatcher encode right)) carrier, parents⟩ samples
        ⟨RouteGrammar.compiledCall encode right carrier,
          .right (RouteGrammar.compiledCall encode left carrier) ::
          .right (.app .s carrier) :: parents⟩ ∧
      samples.map Cursor.erase =
        [Cursor.rebuild parents
          (chosen carrier (.app
            (fork (compileDispatcher encode left)
              (compileDispatcher encode right)) carrier)),
         Cursor.rebuild parents
          (RouteGrammar.selectedRight carrier
            (RouteGrammar.compiledCall encode left carrier)
            (RouteGrammar.compiledCall encode right carrier))] := by
  unfold PrimitiveScripts.nodeRight
  refine ⟨_, .step rfl (.step rfl (.step rfl (.step rfl (.nil _)))), ?_⟩
  rfl

theorem leaf_trace
    {Label : Type} (encode : Label → Term) (label : Label)
    (carrier : Term) (parents : List ParentFrame) :
    ∃ samples,
      CursorMutationTrace PrimitiveScripts.leaf
        ⟨.app (leafCode (encode label)) carrier, parents⟩ samples
        ⟨.app (encode label) carrier,
          .right (.app .s carrier) :: parents⟩ ∧
      samples.map Cursor.erase =
        [Cursor.rebuild parents
          (chosen carrier (.app (encode label) carrier))] := by
  unfold PrimitiveScripts.leaf
  refine ⟨_, .step rfl (.step rfl (.nil _)), ?_⟩
  rfl

theorem map_rebuild_selectedLeft
    (carrier sibling : Term) (parents : List ParentFrame)
    (entries : List (Bool × Term)) :
    entries.map (fun entry => Cursor.rebuild
        (.left sibling :: .right (.app .s carrier) :: parents) entry.2) =
      entries.map (fun entry => Cursor.rebuild parents
        (RouteGrammar.selectedLeft carrier entry.2 sibling)) := by
  exact map_eq_each _ _ entries (fun _ => rfl)

theorem map_rebuild_selectedRight
    (carrier sibling : Term) (parents : List ParentFrame)
    (entries : List (Bool × Term)) :
    entries.map (fun entry => Cursor.rebuild
        (.right sibling :: .right (.app .s carrier) :: parents) entry.2) =
      entries.map (fun entry => Cursor.rebuild parents
        (RouteGrammar.selectedRight carrier sibling entry.2)) := by
  exact map_eq_each _ _ entries (fun _ => rfl)

theorem forward_trace
    {Label : Type} {encode : Label → Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    (path : Dispatcher.HasRoute tree route label)
    (carrier : Term) (parents : List ParentFrame) :
    ∃ samples,
      CursorMutationTrace (PrimitiveRoute.forward route)
        ⟨RouteGrammar.compiledCall encode tree carrier, parents⟩ samples
        ⟨.app (encode label) carrier,
          PrimitiveRoute.selectedParents encode carrier tree route parents⟩ ∧
      samples.map Cursor.erase =
        (routeEntries encode carrier tree route).map
          (fun entry => Cursor.rebuild parents entry.2) := by
  induction path generalizing parents with
  | leaf stored =>
      obtain ⟨samples, trace, roots⟩ := leaf_trace encode stored carrier parents
      refine ⟨samples, ?_, ?_⟩
      · exact trace
      · exact roots
  | @left route label left right path ih =>
      let nextParents :=
        .left (RouteGrammar.compiledCall encode right carrier) ::
          .right (.app .s carrier) :: parents
      obtain ⟨prefixSamples, prefixTrace, prefixRoots⟩ :=
        nodeLeft_trace encode left right carrier parents
      obtain ⟨innerSamples, inner, innerRoots⟩ :=
        ih (parents := nextParents)
      refine ⟨prefixSamples ++ innerSamples, ?_, ?_⟩
      · exact trace_append prefixTrace inner
      · rw [List.map_append, prefixRoots, innerRoots]
        simp only [routeEntries, List.map_cons, List.map_map]
        rw [map_rebuild_selectedLeft]
        rfl
  | @right route label left right path ih =>
      let nextParents :=
        .right (RouteGrammar.compiledCall encode left carrier) ::
          .right (.app .s carrier) :: parents
      obtain ⟨prefixSamples, prefixTrace, prefixRoots⟩ :=
        nodeRight_trace encode left right carrier parents
      obtain ⟨innerSamples, inner, innerRoots⟩ :=
        ih (parents := nextParents)
      refine ⟨prefixSamples ++ innerSamples, ?_, ?_⟩
      · exact trace_append prefixTrace inner
      · rw [List.map_append, prefixRoots, innerRoots]
        simp only [routeEntries, List.map_cons, List.map_map]
        rw [map_rebuild_selectedRight]
        rfl

theorem rebuild_leftFrames (outer : List Term) (parents : List ParentFrame)
    (term : Term) :
    Cursor.rebuild (outer.map ParentFrame.left ++ parents) term =
      Cursor.rebuild parents (Term.applyArgs term outer) := by
  induction outer generalizing term with
  | nil => rfl
  | cons argument rest ih =>
      simpa [Cursor.rebuild, ParentFrame.fill] using ih (.app term argument)

/-- The one-bit action trace, stated explicitly so its root pairing needs no
function extensionality. -/
theorem actionSingleton_trace
    (expected : Nat) (bit : Bool) (initial : Term) (outer : List Term)
    (count : expected = [bit].length + outer.length)
    (parents : List ParentFrame) :
    ∃ samples,
      CursorMutationTrace (PrimitiveScripts.actionDescent [bit])
        ⟨.app (appender [bit]) initial,
          outer.map ParentFrame.left ++ parents⟩ samples
        ⟨PrimitiveScripts.actionFocus [bit] initial,
          PrimitiveScripts.actionParents [bit] initial
            (outer.map ParentFrame.left ++ parents)⟩ ∧
      samples.map Cursor.erase =
        (actionEntries expected [bit] initial outer count).map
          (fun entry => Cursor.rebuild parents entry.2) := by
  let leftParents := outer.map ParentFrame.left ++ parents
  let first : Cursor := ⟨pushFirst bit [] initial, leftParents⟩
  let second : Cursor :=
    ⟨PrimitiveScripts.actionFocus [bit] initial,
      PrimitiveScripts.actionParents [bit] initial leftParents⟩
  refine ⟨[first, second], ?_, ?_⟩
  · exact .step rfl (.step rfl (.nil _))
  · change [first.erase, second.erase] =
      [Cursor.rebuild parents
          (Term.applyArgs (pushFirst bit [] initial) outer),
       Cursor.rebuild parents
          (Term.applyArgs (pushSecond bit [] initial) outer)]
    have firstEq : first.erase = Cursor.rebuild parents
        (Term.applyArgs (pushFirst bit [] initial) outer) := by
      exact rebuild_leftFrames outer parents (pushFirst bit [] initial)
    have secondEq : second.erase = Cursor.rebuild parents
        (Term.applyArgs (pushSecond bit [] initial) outer) := by
      exact rebuild_leftFrames outer parents (pushSecond bit [] initial)
    rw [firstEq, secondEq]

theorem actionDescent_trace
    (expected : Nat) : ∀ (remaining : List Bool) (initial : Term)
      (outer : List Term)
      (count : expected = remaining.length + outer.length)
      (parents : List ParentFrame),
      ∃ samples,
        CursorMutationTrace (PrimitiveScripts.actionDescent remaining)
          ⟨.app (appender remaining) initial,
            outer.map ParentFrame.left ++ parents⟩ samples
          ⟨PrimitiveScripts.actionFocus remaining initial,
            PrimitiveScripts.actionParents remaining initial
              (outer.map ParentFrame.left ++ parents)⟩ ∧
        samples.map Cursor.erase =
          (actionEntries expected remaining initial outer count).map
            (fun entry => Cursor.rebuild parents entry.2)
  | [], initial, outer, count, parents => by
      exact ⟨[], .nil _, rfl⟩
  | [bit], initial, outer, count, parents => by
      exact actionSingleton_trace expected bit initial outer count parents
  | bit :: next :: rest, initial, outer, count, parents => by
      let history := pushHistory bit initial
      let extended := extendAccumulator bit initial
      have nextCount : expected = (next :: rest).length +
          (history :: outer).length := by
        simpa [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using count
      obtain ⟨innerSamples, inner, innerRoots⟩ :=
        actionDescent_trace expected (next :: rest) extended
          (history :: outer) nextCount parents
      obtain ⟨firstSamples, firstTrace, firstRoots⟩ :
          ∃ samples,
            CursorMutationTrace [.Rdx, .Rdx, .L]
              ⟨.app (appender (bit :: next :: rest)) initial,
                outer.map ParentFrame.left ++ parents⟩ samples
              ⟨.app (appender (next :: rest)) extended,
                (history :: outer).map ParentFrame.left ++ parents⟩ ∧
            samples.map Cursor.erase =
              [Cursor.rebuild parents
                (Term.applyArgs (pushFirst bit (next :: rest) initial) outer),
               Cursor.rebuild parents
                (Term.applyArgs (pushSecond bit (next :: rest) initial)
                  outer)] := by
        refine ⟨_, .step rfl (.step rfl (.step rfl (.nil _))), ?_⟩
        simp [Cursor.erase, rebuild_leftFrames, history, extended, pushFirst, pushSecond,
          Term.contractum, appender, push, extendAccumulator, pushHistory]
      refine ⟨firstSamples ++ innerSamples, ?_, ?_⟩
      · exact trace_append firstTrace inner
      · rw [List.map_append, firstRoots, innerRoots]
        simp [actionEntries_nil, actionEntries_cons, history, extended, rebuild_leftFrames,
          Cursor.erase, pushFirst, pushSecond, Term.contractum,
          PrimitiveScripts.actionFocus, PrimitiveScripts.actionParents,
          appender, push, appenderResult, extendAccumulator, pushHistory]

theorem cursorOnly_trace
    {script : Script} {before after : Cursor}
    (only : Script.CursorOnly script)
    (run : Script.run script before = some after) :
    CursorMutationTrace script before [] after := by
  obtain ⟨samples, trace⟩ := CursorMutationTrace.of_run run
  have lengthZero : samples.length = 0 := by
    rw [trace.length_eq]
    exact Script.rdxCount_eq_zero_of_cursorOnly only
  have samplesNil : samples = [] := List.length_eq_zero_iff.mp lengthZero
  subst samples
  exact trace

theorem action_trace
    (bits : List Bool) (initial : Term) (parents : List ParentFrame) :
    ∃ samples,
      CursorMutationTrace (PrimitiveScripts.action bits)
        ⟨.app (appender bits) initial, parents⟩ samples
        ⟨appenderResult bits initial, parents⟩ ∧
      samples.map Cursor.erase =
        (actionEntries bits.length bits initial [] (by simp)).map
          (fun entry => Cursor.rebuild parents entry.2) := by
  obtain ⟨descentSamples, descent, roots⟩ :=
    actionDescent_trace bits.length bits initial [] (by simp) parents
  have ascent := cursorOnly_trace
    (PrimitiveScripts.actionReturn_cursorOnly bits)
    (PrimitiveScripts.run_actionReturn bits initial parents)
  refine ⟨descentSamples, ?_, roots⟩
  simpa [PrimitiveScripts.action] using trace_append descent ascent

theorem rebuild_localParents
    (bits : List Bool) (continuation haltField seedAudit continuationAudit : Term)
    (parents : List ParentFrame) (term : Term) :
    Cursor.rebuild
        (.right haltField ::
          .left (.app (seedCode bits) seedAudit) ::
          .left (.app continuation continuationAudit) :: parents)
        term =
      Cursor.rebuild parents
        (Carrier.activeShell bits continuation haltField term seedAudit
          continuationAudit) := by
  rfl

theorem rebuild_selectedParents
    {Label : Type} {encode : Label → Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    (path : Dispatcher.HasRoute tree route label)
    (carrier response : Term) (parents : List ParentFrame) :
    Cursor.rebuild
        (PrimitiveRoute.selectedParents encode carrier tree route parents)
        response =
      Cursor.rebuild parents
        (PrimitiveRoute.withResponse encode tree route carrier response) := by
  induction path generalizing parents with
  | leaf stored => rfl
  | @left route label left right path ih =>
      simpa [PrimitiveRoute.selectedParents, PrimitiveRoute.withResponse,
        Cursor.rebuild, ParentFrame.fill, RouteGrammar.selectedLeft] using!
        ih (.left (RouteGrammar.compiledCall encode right carrier) ::
          .right (.app .s carrier) :: parents)
  | @right route label left right path ih =>
      simpa [PrimitiveRoute.selectedParents, PrimitiveRoute.withResponse,
        Cursor.rebuild, ParentFrame.fill, RouteGrammar.selectedRight] using!
        ih (.right (RouteGrammar.compiledCall encode left carrier) ::
          .right (.app .s carrier) :: parents)

theorem normalResponse_canonicalMutationTrace
    (program : CTS.Program)
    {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program}
    (path : Dispatcher.HasRoute tree route label)
    (bits : List Bool) (continuation carrier : Term)
    (parents : List ParentFrame) :
    ∃ samples,
      CursorMutationTrace
        (PrimitiveLocalResponse.execute program route label)
        ⟨frame (environmentCode (compileActions program tree) bits)
          continuation carrier, parents⟩ samples
        ⟨LocalResponse.completed bits continuation carrier
          (PrimitiveLocalResponse.completedRoute program tree route label
            carrier), parents⟩ ∧
      samples.map Cursor.erase =
        (responseEntries program path bits continuation carrier).map
          (fun entry => Cursor.rebuild parents entry.2) := by
  let localParents : List ParentFrame :=
    .right (freshHField carrier) ::
      .left (.app (seedCode bits) carrier) ::
      .left (.app continuation carrier) :: parents
  obtain ⟨frameSamples, frameTrace, frameRoots⟩ :=
    frame_trace (compileActions program tree) bits continuation carrier parents
  obtain ⟨routeSamples, routeTrace, routeRoots⟩ :=
    forward_trace (encode := selectedAction program) path carrier localParents
  obtain ⟨actionSamples, rawActionTrace, actionRoots⟩ :=
    action_trace (PrimitiveLocalResponse.emitted program label) carrier
      (PrimitiveRoute.selectedParents (selectedAction program) carrier tree
        route localParents)
  have actionTrace :
      CursorMutationTrace
        (PrimitiveScripts.action
          (PrimitiveLocalResponse.emitted program label))
        ⟨.app (selectedAction program label) carrier,
          PrimitiveRoute.selectedParents (selectedAction program) carrier tree
            route localParents⟩
        actionSamples
        ⟨actionResult program label carrier,
          PrimitiveRoute.selectedParents (selectedAction program) carrier tree
            route localParents⟩ := by
    simpa using rawActionTrace
  have backwardTrace := cursorOnly_trace
    (PrimitiveRoute.backward_cursorOnly route)
    (PrimitiveRoute.run_backward_withResponse (encode := selectedAction program)
      path carrier
      (actionResult program label carrier) localParents)
  have localTrace :
      CursorMutationTrace PrimitiveLocalResponse.localReturn
        ⟨PrimitiveRoute.withResponse (selectedAction program) tree route carrier
            (actionResult program label carrier), localParents⟩ []
        ⟨LocalResponse.completed bits continuation carrier
            (PrimitiveLocalResponse.completedRoute program tree route label
              carrier), parents⟩ := by
    apply cursorOnly_trace PrimitiveLocalResponse.localReturn_cursorOnly
    rfl
  refine ⟨frameSamples ++ routeSamples ++ actionSamples, ?_, ?_⟩
  · unfold PrimitiveLocalResponse.execute
    simpa [localParents, List.append_assoc] using
      trace_append frameTrace
        (trace_append routeTrace
          (trace_append actionTrace (trace_append backwardTrace localTrace)))
  · rw [List.map_append, List.map_append, frameRoots, routeRoots, actionRoots]
    unfold responseEntries
    let routeList :=
      routeEntries (selectedAction program) carrier tree route
    let actionList :=
      actionEntries (PrimitiveLocalResponse.emitted program label).length
        (PrimitiveLocalResponse.emitted program label) carrier [] (by simp)
    let routeWrap := fun (entry : Bool × Term) =>
      (entry.1 && (PrimitiveLocalResponse.emitted program label).isEmpty,
        Carrier.activeShell bits continuation (freshHField carrier) entry.2
          carrier carrier)
    let actionWrap := fun (entry : Bool × Term) =>
      (entry.1,
        Carrier.activeShell bits continuation (freshHField carrier)
          (PrimitiveRoute.withResponse (selectedAction program) tree route
            carrier entry.2) carrier carrier)
    have routeEq :
        routeList.map (fun entry => Cursor.rebuild localParents entry.2) =
          (routeList.map routeWrap).map
            (fun entry => Cursor.rebuild parents entry.2) := by
      rw [List.map_map]
      apply map_eq_each
      intro entry
      exact rebuild_localParents bits continuation (freshHField carrier)
        carrier carrier parents entry.2
    have actionEq :
        actionList.map (fun entry => Cursor.rebuild
            (PrimitiveRoute.selectedParents (selectedAction program) carrier
              tree route localParents) entry.2) =
          (actionList.map actionWrap).map
            (fun entry => Cursor.rebuild parents entry.2) := by
      rw [List.map_map]
      apply map_eq_each
      intro entry
      calc
        Cursor.rebuild
            (PrimitiveRoute.selectedParents (selectedAction program) carrier
              tree route localParents) entry.2 =
            Cursor.rebuild localParents
              (PrimitiveRoute.withResponse (selectedAction program) tree route
                carrier entry.2) :=
          rebuild_selectedParents path carrier entry.2 localParents
        _ = Cursor.rebuild parents
            (Carrier.activeShell bits continuation (freshHField carrier)
              (PrimitiveRoute.withResponse (selectedAction program) tree route
                carrier entry.2) carrier carrier) :=
          rebuild_localParents bits continuation (freshHField carrier)
            carrier carrier parents _
    simp only [List.map_append, List.map]
    change
      [Cursor.rebuild parents
          (frameFirstRoot (compileActions program tree) bits continuation
            carrier),
       Cursor.rebuild parents
          (frameSecondRoot (compileActions program tree) bits continuation
            carrier),
       Cursor.rebuild parents
          (freshLocal (compileActions program tree) bits continuation carrier)] ++
          routeList.map
            (fun entry => Cursor.rebuild localParents entry.2) ++
          actionList.map (fun entry => Cursor.rebuild
            (PrimitiveRoute.selectedParents (selectedAction program) carrier
              tree route localParents) entry.2) =
        ([Cursor.rebuild parents
            (frameFirstRoot (compileActions program tree) bits continuation
              carrier),
          Cursor.rebuild parents
            (frameSecondRoot (compileActions program tree) bits continuation
              carrier),
          Cursor.rebuild parents
            (freshLocal (compileActions program tree) bits continuation
              carrier)] ++
          (routeList.map routeWrap).map
            (fun entry => Cursor.rebuild parents entry.2)) ++
          (actionList.map actionWrap).map
            (fun entry => Cursor.rebuild parents entry.2)
    rw [routeEq, actionEq]

theorem cursorMutationTrace_deterministic
    {script : Script} {before endpoint₁ endpoint₂ : Cursor}
    {samples₁ samples₂ : List Cursor}
    (first : CursorMutationTrace script before samples₁ endpoint₁)
    (second : CursorMutationTrace script before samples₂ endpoint₂) :
    samples₁ = samples₂ ∧ endpoint₁ = endpoint₂ := by
  induction first generalizing samples₂ endpoint₂ with
  | nil =>
      cases second
      exact ⟨rfl, rfl⟩
  | @step operation rest before middle endpoint samples executes tail ih =>
      cases second with
      | @step _ _ _ middle₂ endpoint₂ samples₂ executes₂ tail₂ =>
          have middleEq : middle = middle₂ := by
            exact Option.some.inj (executes.symm.trans executes₂)
          subst middle₂
          obtain ⟨samplesEq, endpointEq⟩ := ih tail₂
          cases operation <;> simp_all

theorem normalResponse_exactMutationChain_paired
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    ∃ configurationSamples : List
        (SchedulerResponseInvariant.Configuration program dispatcher),
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerResponse.returnConfiguration program dispatcher registers
          bit bits continuation carrier parents)
        (SchedulerResponse.responseStartConfiguration program dispatcher
          registers bit bits continuation carrier parents)
        configurationSamples ∧
      configurationSamples.map
          (fun configuration => configuration.cursor.erase) =
        (responseEntries program
          (dispatcher.route_valid (registers.phase, bit)) bits continuation
          carrier).map
          (fun entry => Cursor.rebuild parents entry.2) ∧
      configurationSamples.length =
        LocalResponse.completedCost program
          (dispatcher.route (registers.phase, bit)) (registers.phase, bit) := by
  obtain ⟨cursorSamples, configurationSamples, actualTrace, cursorsEq,
      lengthEq, chain⟩ :=
    normalResponse_exactMutationChain program dispatcher registers bit bits
      continuation carrier parents
  obtain ⟨canonicalSamples, canonicalTrace, canonicalRoots⟩ :=
    normalResponse_canonicalMutationTrace program
      (dispatcher.route_valid (registers.phase, bit)) bits continuation carrier
      parents
  have tracesAgree := cursorMutationTrace_deterministic actualTrace
    canonicalTrace
  have sampleEq : cursorSamples = canonicalSamples := tracesAgree.1
  refine ⟨configurationSamples, chain, ?_, lengthEq⟩
  calc
    configurationSamples.map
        (fun configuration => configuration.cursor.erase) =
        cursorSamples.map Cursor.erase := by
          simpa [List.map_map] using! congrArg (List.map Cursor.erase) cursorsEq
    _ = canonicalSamples.map Cursor.erase := by rw [sampleEq]
    _ = _ := canonicalRoots
/-! ## Control-position refinement of response samples -/

theorem script_commandSafe_of_suffixRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (job : SchedulerControl.ScriptJob program)
    (registers : Registers program)
    (pc : SchedulerControl.ScriptPC program dispatcher job)
    (cursor endpoint : Cursor)
    (suffixRun : Script.run
      (List.drop pc.val (SchedulerControl.jobScript program dispatcher job))
      cursor = some endpoint) :
    CommandSafe cursor
      (SchedulerControl.transition program dispatcher
        (.script job pc registers) (Probe.observeNode cursor)
        (Probe.observeIncoming cursor)) := by
  by_cases active : pc.val <
      (SchedulerControl.jobScript program dispatcher job).length
  · have dropped := List.drop_eq_getElem_cons active
    have runCons : Script.run
        ((SchedulerControl.jobScript program dispatcher job).get
            ⟨pc.val, active⟩ ::
          List.drop (pc.val + 1)
            (SchedulerControl.jobScript program dispatcher job)) cursor =
        some endpoint := by
      rw [dropped] at suffixRun
      exact suffixRun
    obtain ⟨middle, executes, tail⟩ :=
      (Script.run_cons_eq_some_iff _ _ cursor endpoint).mp runCons
    rw [SchedulerControl.transition_script_step job pc registers _ _ active]
    exact ⟨middle, executes⟩
  · rw [SchedulerControl.transition_script_done job pc registers _ _ active]
    trivial

inductive PositionedSamples
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (job : SchedulerControl.ScriptJob program)
    (registers : Registers program) :
    List (SchedulerResponseInvariant.Configuration program dispatcher) → Prop
  | nil : PositionedSamples program dispatcher job registers []
  | cons
      (pc : SchedulerControl.ScriptPC program dispatcher job)
      (cursor : Cursor)
      (position : ControlPosition program dispatcher
        (.script job pc registers) cursor)
      {tail : List (SchedulerResponseInvariant.Configuration program dispatcher)}
      (tailPositions : PositionedSamples program dispatcher job registers tail) :
      PositionedSamples program dispatcher job registers
        (⟨some (.script job pc registers), cursor⟩ :: tail)

/-- One-for-one pairing between executable response samples and the exact
structural response-root enumeration. -/
inductive ResponseSamplePairs
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool)
    (bits : List Bool) (continuation carrier : Term)
    (parents : List ParentFrame) :
    List (SchedulerResponseInvariant.Configuration program dispatcher) →
      List (Bool × Term) → Prop where
  | nil : ResponseSamplePairs program dispatcher registers bit bits
      continuation carrier parents [] []
  | cons
      (pc : SchedulerControl.ScriptPC program dispatcher
        (.normalResponse (registers.phase, bit)))
      (cursor : Cursor) (done : Bool) (term : Term)
      (position : ControlPosition program dispatcher
        (.script (.normalResponse (registers.phase, bit)) pc registers) cursor)
      (eraseEq : cursor.erase = Cursor.rebuild parents term)
      (root : ResponseRootMutation program dispatcher.tree
        (dispatcher.route_valid (registers.phase, bit)) bits continuation carrier
        done term)
      {configurationTail : List
        (SchedulerResponseInvariant.Configuration program dispatcher)}
      {entryTail : List (Bool × Term)}
      (tail : ResponseSamplePairs program dispatcher registers bit bits
        continuation carrier parents configurationTail entryTail) :
      ResponseSamplePairs program dispatcher registers bit bits continuation
        carrier parents
        (⟨some (.script (.normalResponse (registers.phase, bit)) pc registers),
          cursor⟩ :: configurationTail)
        ((done, term) :: entryTail)

/-- Decoder and exact checkpoint classification supplied for each response
sample, with its global contraction index advanced one sample at a time. -/
inductive ResponseClassifications
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) (registers : Registers program) (bit : Bool) :
    Nat → List (SchedulerResponseInvariant.Configuration program dispatcher) →
      Prop where
  | nil (sampleIndex : Nat) :
      ResponseClassifications program dispatcher inputBits registers bit
        sampleIndex []
  | cons
      (sampleIndex : Nat)
      (pc : SchedulerControl.ScriptPC program dispatcher
        (.normalResponse (registers.phase, bit)))
      (cursor : Cursor)
      (decoder : DecoderEvidence program dispatcher.tree .frameDispatch
        cursor.erase)
      (event : EventEvidence program dispatcher inputBits (sampleIndex + 1)
        .frameDispatch cursor.erase)
      {tail : List
        (SchedulerResponseInvariant.Configuration program dispatcher)}
      (tailClassifications : ResponseClassifications program dispatcher
        inputBits registers bit (sampleIndex + 1) tail) :
      ResponseClassifications program dispatcher inputBits registers bit
        sampleIndex
        (⟨some (.script (.normalResponse (registers.phase, bit)) pc registers),
          cursor⟩ :: tail)

/-- Every configuration in a finite response segment is a sampled state at
its exact successive global contraction index. -/
inductive IndexedResponseSampledStates
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) :
    Nat → List (SchedulerResponseInvariant.Configuration program dispatcher) →
      Prop where
  | nil (sampleIndex : Nat) :
      IndexedResponseSampledStates program dispatcher inputBits sampleIndex []
  | cons
      (sampleIndex : Nat)
      {configuration : SchedulerResponseInvariant.Configuration program
        dispatcher}
      (sampled : SampledState program dispatcher inputBits (sampleIndex + 1)
        configuration)
      {tail : List
        (SchedulerResponseInvariant.Configuration program dispatcher)}
      (tailSampled : IndexedResponseSampledStates program dispatcher inputBits
        (sampleIndex + 1) tail) :
      IndexedResponseSampledStates program dispatcher inputBits sampleIndex
        (configuration :: tail)

/-- An exact response mutation chain whose samples carry the indexed scheduler
invariant is, verbatim, an existentially fuelled productivity segment. -/
theorem ExactMutationChain.toExistentialAdvance
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) (sampleIndex : Nat)
    {terminal before : SchedulerResponseInvariant.Configuration program
      dispatcher}
    {configurations : List
      (SchedulerResponseInvariant.Configuration program dispatcher)}
    (chain : ExactMutationChain (SchedulerControl.machine program dispatcher)
      terminal before configurations)
    (sampled : IndexedResponseSampledStates program dispatcher inputBits
      sampleIndex configurations) :
    SchedulerProductivity.ExistentialAdvance program dispatcher inputBits
      sampleIndex configurations.length before := by
  induction chain generalizing sampleIndex with
  | done ticks suffix =>
      cases sampled
      trivial
  | @next before configuration configurations searchTicks found tail ih =>
      cases sampled with
      | cons _ state tailSampled =>
          exact ⟨searchTicks, configuration, found, state,
            ih (sampleIndex + 1) tailSampled⟩

/-- The operational and semantic positive-clock tails are the same finite
productivity segment, starting at the already sampled head contraction. -/
theorem ClockTailSamples.toExistentialAdvance
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) (registers : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    (stage : Nat) {sampleIndex wrappers remaining : Nat}
    (execution : ClockTailSamples program dispatcher registers stage
      [.left (environmentCode
        (compileActions program dispatcher.tree) inputBits)]
      wrappers remaining)
    (sampled : ClockRootTailSampled program dispatcher inputBits registers
      phase scanned emptyMode coherent stage sampleIndex wrappers remaining) :
    SchedulerProductivity.ExistentialAdvance program dispatcher inputBits
      sampleIndex (remaining + 1)
      (positiveClockMutationConfiguration program dispatcher registers stage
        wrappers remaining
        [.left (environmentCode
          (compileActions program dispatcher.tree) inputBits)]) := by
  induction execution generalizing sampleIndex with
  | zero wrappers found =>
      cases sampled with
      | zero _ _ closing =>
          exact ⟨_, _, found, closing, trivial⟩
  | succ wrappers remaining found tail ih =>
      cases sampled with
      | succ _ _ _ next tailSampled =>
          exact ⟨_, _, found, next, ih tailSampled⟩

/-- A complete root clock phase is an exact finite productivity segment with
its public contraction count. -/
theorem ClockRootPhaseInvariant.toExistentialAdvance
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) (registers : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    {sampleIndex stage : Nat}
    (trace : ClockRootPhaseInvariant program dispatcher inputBits registers
      phase scanned emptyMode coherent sampleIndex stage) :
    SchedulerProductivity.ExistentialAdvance program dispatcher inputBits
      sampleIndex (stage + 1)
      (clockPhaseSourceConfiguration program dispatcher registers
        [.left (environmentCode
          (compileActions program dispatcher.tree) inputBits)] stage) := by
  cases trace.execution with
  | zero found =>
      cases trace.invariant with
      | zero closing =>
          exact ⟨_, _, found, closing, trivial⟩
  | succ stage found tailExecution =>
      cases trace.invariant with
      | succ _ first tailSampled =>
          exact ⟨_, _, found, first,
            ClockTailSamples.toExistentialAdvance program dispatcher inputBits
              registers phase scanned emptyMode coherent (stage + 1)
              tailExecution tailSampled⟩

/-- Continuation-passing form of a positive clock tail.  Besides exposing every
clock sample, it composes an arbitrary already-certified future beginning at
the exact closing wrapper configuration. -/
theorem ClockTailSamples.prependExistentialAdvance
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) (registers : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    (stage : Nat) {sampleIndex wrappers remaining extra : Nat}
    (execution : ClockTailSamples program dispatcher registers stage
      [.left (environmentCode
        (compileActions program dispatcher.tree) inputBits)]
      wrappers remaining)
    (sampled : ClockRootTailSampled program dispatcher inputBits registers
      phase scanned emptyMode coherent stage sampleIndex wrappers remaining)
    (future : SchedulerProductivity.ExistentialAdvance program dispatcher
      inputBits (sampleIndex + (remaining + 1)) extra
      (zeroClockMutationConfiguration program dispatcher registers stage
        (wrappers + remaining + 1)
        [.left (environmentCode
          (compileActions program dispatcher.tree) inputBits)])) :
    SchedulerProductivity.ExistentialAdvance program dispatcher inputBits
      sampleIndex ((remaining + 1) + extra)
      (positiveClockMutationConfiguration program dispatcher registers stage
        wrappers remaining
        [.left (environmentCode
          (compileActions program dispatcher.tree) inputBits)]) := by
  rw [Nat.add_comm (remaining + 1) extra]
  induction execution generalizing sampleIndex extra with
  | zero wrappers found =>
      cases sampled with
      | zero _ _ closing =>
          exact ⟨_, _, found, closing,
            (by simpa [Nat.add_assoc] using future)⟩
  | succ wrappers remaining found tailExecution ih =>
      cases sampled with
      | succ _ _ _ next tailSampled =>
          have futureTail : SchedulerProductivity.ExistentialAdvance program
              dispatcher inputBits
              ((sampleIndex + 1) + (remaining + 1)) extra
              (zeroClockMutationConfiguration program dispatcher registers
                stage ((wrappers + 1) + remaining + 1)
                [.left (environmentCode
                  (compileActions program dispatcher.tree) inputBits)]) := by
            simpa [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using future
          exact ⟨_, _, found, next,
            ih tailSampled futureTail⟩

/-- Continuation-passing whole-clock certificate at the root environment. -/
theorem ClockRootPhaseInvariant.prependExistentialAdvance
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) (registers : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    {sampleIndex stage extra : Nat}
    (trace : ClockRootPhaseInvariant program dispatcher inputBits registers
      phase scanned emptyMode coherent sampleIndex stage)
    (future : SchedulerProductivity.ExistentialAdvance program dispatcher
      inputBits (sampleIndex + (stage + 1)) extra
      (clockPhaseCompletedConfiguration program dispatcher registers stage
        [.left (environmentCode
          (compileActions program dispatcher.tree) inputBits)])) :
    SchedulerProductivity.ExistentialAdvance program dispatcher inputBits
      sampleIndex ((stage + 1) + extra)
      (clockPhaseSourceConfiguration program dispatcher registers
        [.left (environmentCode
          (compileActions program dispatcher.tree) inputBits)] stage) := by
  rw [Nat.add_comm (stage + 1) extra]
  cases trace.execution with
  | zero found =>
      cases trace.invariant with
      | zero closing =>
          exact ⟨_, _, found, closing,
            (by simpa [clockPhaseCompletedConfiguration] using future)⟩
  | succ stage found tailExecution =>
      cases trace.invariant with
      | succ _ first tailSampled =>
          have tailFuture : SchedulerProductivity.ExistentialAdvance program
              dispatcher inputBits
              ((sampleIndex + 1) + (stage + 1)) extra
              (zeroClockMutationConfiguration program dispatcher registers
                (stage + 1) (0 + stage + 1)
                [.left (environmentCode
                  (compileActions program dispatcher.tree) inputBits)]) := by
            simpa [clockPhaseCompletedConfiguration, Nat.add_assoc,
              Nat.add_comm, Nat.add_left_comm] using future
          have tailAdvance :=
            ClockTailSamples.prependExistentialAdvance program dispatcher
              inputBits registers phase scanned emptyMode coherent (stage + 1)
              tailExecution tailSampled tailFuture
          exact ⟨_, _, found, first,
            (by simpa [Nat.add_comm] using tailAdvance)⟩

/-- Uniform name for the first contraction sample of either a positive or a
zero residual fuel call. -/
def fuelFirstConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) :
    Nat → Term → Term → List ParentFrame → Configuration program dispatcher
  | 0, environment, continuation, parents =>
      fuelZeroFirstMutationConfiguration program dispatcher registers
        environment continuation parents
  | fuel + 1, environment, continuation, parents =>
      fuelPositiveFirstMutationConfiguration program dispatcher registers fuel
        environment continuation parents

/-- The first semantic sample of a fuel trace, independent of whether the
residual unary fuel is zero or positive. -/
theorem FuelSampledTrace.first
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) (registers : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (continuation : Term) (hadmissible : Carrier.Admissible continuation)
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    {sampleIndex fuel depth : Nat}
    (trace : FuelSampledTrace program dispatcher inputBits registers phase
      scanned emptyMode continuation hadmissible coherent sampleIndex fuel
      depth) :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) inputBits
    let parents :=
      PrimitiveFuel.pendingParents environment continuation depth []
    SampledState program dispatcher inputBits (sampleIndex + 1)
      (fuelFirstConfiguration program dispatcher registers fuel environment
        continuation parents) := by
  cases trace with
  | zero _ _ states =>
      simpa [fuelFirstConfiguration] using states.first
  | succ _ _ _ states tail =>
      simpa [fuelFirstConfiguration] using states.first

/-- After a positive fuel layer's second contraction, the next contraction is
the first sample of the residual call.  The existential tick count hides only
the zero-versus-successor guard choice; both branches are exact searches. -/
theorem fuelPositive_seekNextFirst
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (fuel : Nat)
    (environment continuation : Term) (parents : List ParentFrame) :
    let nextParents := .right (.app environment continuation) :: parents
    ∃ ticks,
      FiniteController.seekMutation
          (SchedulerControl.machine program dispatcher) ticks
          (fuelPositiveSecondMutationConfiguration program dispatcher registers
            fuel environment continuation parents) =
        some (fuelFirstConfiguration program dispatcher registers fuel
          environment continuation nextParents) := by
  cases fuel with
  | zero =>
      exact ⟨_, fuelPositive_seekNextZero program dispatcher registers
        environment continuation parents⟩
  | succ fuel =>
      exact ⟨_, fuelPositive_seekNextPositive program dispatcher registers
        fuel environment continuation parents⟩

/-- Once the first fuel contraction has been sampled, the remaining script
and recursive residual calls form an exact indexed productivity segment. -/
theorem FuelScriptSamples.afterFirst_toExistentialAdvance
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) (registers : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (continuation : Term) (hadmissible : Carrier.Admissible continuation)
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    {sampleIndex fuel depth : Nat}
    (execution : FuelScriptSamples program dispatcher inputBits registers
      continuation hadmissible fuel depth)
    (sampled : FuelSampledTrace program dispatcher inputBits registers phase
      scanned emptyMode continuation hadmissible coherent sampleIndex fuel
      depth) :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) inputBits
    let parents :=
      PrimitiveFuel.pendingParents environment continuation depth []
    SchedulerProductivity.ExistentialAdvance program dispatcher inputBits
      (sampleIndex + 1) (2 * fuel + 4)
      (fuelFirstConfiguration program dispatcher registers fuel environment
        continuation parents) := by
  induction execution generalizing sampleIndex with
  | zero depth evidence first second third fourth fifth =>
      cases sampled with
      | zero _ _ states =>
          exact ⟨_, _, second, states.second,
            ⟨_, _, third, states.third,
              ⟨_, _, fourth, states.fourth,
                ⟨_, _, fifth, states.fifth, trivial⟩⟩⟩⟩
  | succ fuel depth evidence first second tailExecution ih =>
      cases sampled with
      | succ _ _ _ states tailSampled =>
          obtain ⟨bridgeTicks, bridge⟩ :=
            fuelPositive_seekNextFirst program dispatcher registers fuel
              (environmentCode
                (compileActions program dispatcher.tree) inputBits)
              continuation
              (PrimitiveFuel.pendingParents
                (environmentCode
                  (compileActions program dispatcher.tree) inputBits)
                continuation depth [])
          have nextSample := FuelSampledTrace.first program dispatcher inputBits
            registers phase scanned emptyMode continuation hadmissible coherent
            tailSampled
          dsimp only at nextSample
          rw [pendingParents_succ_cons
            (environmentCode
              (compileActions program dispatcher.tree) inputBits)
            continuation depth []] at nextSample
          have tailAdvance := ih tailSampled
          dsimp only at tailAdvance
          rw [pendingParents_succ_cons
            (environmentCode
              (compileActions program dispatcher.tree) inputBits)
            continuation depth []] at tailAdvance
          exact ⟨_, _, second, states.second,
            ⟨bridgeTicks, _, bridge,
              (by simpa [Nat.add_assoc] using nextSample),
              (by simpa [Nat.add_assoc] using! tailAdvance)⟩⟩

/-- A complete guarded fuel phase is an exact finite productivity segment at
the public `2 * fuel + 5` contraction count. -/
theorem FuelPhaseInvariant.toExistentialAdvance
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) (registers : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (continuation : Term) (hadmissible : Carrier.Admissible continuation)
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    {sampleIndex fuel depth : Nat}
    (trace : FuelPhaseInvariant program dispatcher inputBits registers phase
      scanned emptyMode continuation hadmissible coherent sampleIndex fuel
      depth) :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) inputBits
    let parents :=
      PrimitiveFuel.pendingParents environment continuation depth []
    SchedulerProductivity.ExistentialAdvance program dispatcher inputBits
      sampleIndex (2 * fuel + 5)
      (fuelPhaseSourceConfiguration program dispatcher registers fuel
        environment continuation parents) := by
  have firstSample := FuelSampledTrace.first program dispatcher inputBits
    registers phase scanned emptyMode continuation hadmissible coherent
    trace.invariant
  cases trace.execution with
  | zero depth scripts starts =>
      exact ⟨_, _, starts, firstSample,
        FuelScriptSamples.afterFirst_toExistentialAdvance program dispatcher
          inputBits registers phase scanned emptyMode continuation hadmissible
          coherent scripts trace.invariant⟩
  | succ fuel depth scripts starts =>
      exact ⟨_, _, starts, firstSample,
        FuelScriptSamples.afterFirst_toExistentialAdvance program dispatcher
          inputBits registers phase scanned emptyMode continuation hadmissible
          coherent scripts trace.invariant⟩

/-- Total number of contraction samples in one positive clock/launch/fuel
phase, counted from its already-sampled clock source. -/
def positiveStageSampleCount (fuel : Nat) : Nat :=
  ((fuel + 1) + 1) + ((2 * (fuel + 1) + 5) + 1)

/-- The relative phase count lands at the same global index used by the
construction-facing endpoint theorem. -/
theorem sampleIndex_add_positiveStageSampleCount
    (sampleIndex fuel : Nat) :
    sampleIndex + positiveStageSampleCount fuel =
      positiveStageEndIndex sampleIndex fuel := by
  simp only [positiveStageSampleCount, positiveStageEndIndex,
    positiveStageLaunchIndex]
  simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
  let count := 2 * (fuel + 1)
  change 1 + (2 + (count + 5)) = count + 8
  calc
    1 + (2 + (count + 5)) = (1 + 2) + (count + 5) := by
      rw [Nat.add_assoc]
    _ = (3 + count) + 5 := by rw [← Nat.add_assoc]
    _ = (count + 3) + 5 := by rw [Nat.add_comm 3 count]
    _ = count + (3 + 5) := by rw [Nat.add_assoc]
    _ = count + 8 := rfl

/-- Compose clock samples, the exact launch contraction, and every fuel sample
into one construction-facing productivity segment. -/
theorem PositiveStagePhaseTrace.toExistentialAdvance
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) (clockRegisters : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (clockCoherent : RegistersCoherent clockRegisters phase scanned emptyMode)
    {sampleIndex fuel : Nat}
    (trace : PositiveStagePhaseTrace program dispatcher inputBits clockRegisters
      phase scanned emptyMode clockCoherent sampleIndex fuel) :
    SchedulerProductivity.ExistentialAdvance program dispatcher inputBits
      sampleIndex (positiveStageSampleCount fuel)
      (clockPhaseSourceConfiguration program dispatcher clockRegisters
        [.left (environmentCode
          (compileActions program dispatcher.tree) inputBits)] (fuel + 1)) := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) inputBits
  let continuation := Dovetail.clockExit (fuel + 1) fuel environment
  let clockCount := (fuel + 1) + 1
  let fuelCount := 2 * (fuel + 1) + 5
  have fuelAdvance := FuelPhaseInvariant.toExistentialAdvance program dispatcher
    inputBits (Registers.newJob program) (CTS.zeroPhase program) [] false
    continuation (Dovetail.clockExit_admissible (fuel + 1) fuel environment)
    (RegistersCoherent.initial program) trace.fuelTrace
  dsimp only at fuelAdvance
  have launchSample : SampledState program dispatcher inputBits
      ((sampleIndex + clockCount) + 1)
      (positiveStageLaunchConfiguration program dispatcher fuel environment) := by
    simpa [positiveStageLaunchIndex, clockCount, environment, Nat.add_assoc]
      using trace.launch
  have fuelAdvance' : SchedulerProductivity.ExistentialAdvance program
      dispatcher inputBits ((sampleIndex + clockCount) + 1) fuelCount
      (positiveStageLaunchConfiguration program dispatcher fuel environment) := by
    simpa [positiveStageLaunchIndex, fuelCount, environment, continuation,
      Nat.add_assoc] using! fuelAdvance
  have launchFuture : SchedulerProductivity.ExistentialAdvance program
      dispatcher inputBits (sampleIndex + clockCount) (fuelCount + 1)
      (clockPhaseCompletedConfiguration program dispatcher clockRegisters
        (fuel + 1) [.left environment]) := by
    exact ⟨_, _, trace.launch_seek, launchSample, fuelAdvance'⟩
  have complete := ClockRootPhaseInvariant.prependExistentialAdvance program
    dispatcher inputBits clockRegisters phase scanned emptyMode clockCoherent
    trace.clock launchFuture
  simpa [positiveStageSampleCount, clockCount, fuelCount, environment,
    Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using complete

/-- Samples remaining after the first positive-clock contraction of a stage. -/
def positiveStageAfterFirstCount (fuel : Nat) : Nat :=
  (fuel + 1) + ((2 * (fuel + 1) + 5) + 1)

/-- Continuation of a positive stage from its already-sampled first clock
contraction.  This is the bridge needed by the literal generator trace, whose
cursor-only prefix enters the stage-one clock row before that contraction. -/
theorem PositiveStagePhaseTrace.afterFirst_toExistentialAdvance
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) (clockRegisters : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (clockCoherent : RegistersCoherent clockRegisters phase scanned emptyMode)
    {sampleIndex fuel : Nat}
    (trace : PositiveStagePhaseTrace program dispatcher inputBits clockRegisters
      phase scanned emptyMode clockCoherent sampleIndex fuel) :
    SchedulerProductivity.ExistentialAdvance program dispatcher inputBits
      (sampleIndex + 1) (positiveStageAfterFirstCount fuel)
      (positiveClockMutationConfiguration program dispatcher clockRegisters
        (fuel + 1) 0 fuel
        [.left (environmentCode
          (compileActions program dispatcher.tree) inputBits)]) := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) inputBits
  let continuation := Dovetail.clockExit (fuel + 1) fuel environment
  let clockCount := (fuel + 1) + 1
  let fuelCount := 2 * (fuel + 1) + 5
  have fuelAdvance := FuelPhaseInvariant.toExistentialAdvance program dispatcher
    inputBits (Registers.newJob program) (CTS.zeroPhase program) [] false
    continuation (Dovetail.clockExit_admissible (fuel + 1) fuel environment)
    (RegistersCoherent.initial program) trace.fuelTrace
  dsimp only at fuelAdvance
  have launchSample : SampledState program dispatcher inputBits
      ((sampleIndex + clockCount) + 1)
      (positiveStageLaunchConfiguration program dispatcher fuel environment) := by
    simpa [positiveStageLaunchIndex, clockCount, environment, Nat.add_assoc]
      using trace.launch
  have fuelAdvance' : SchedulerProductivity.ExistentialAdvance program
      dispatcher inputBits ((sampleIndex + clockCount) + 1) fuelCount
      (positiveStageLaunchConfiguration program dispatcher fuel environment) := by
    simpa [positiveStageLaunchIndex, fuelCount, environment, continuation,
      Nat.add_assoc] using! fuelAdvance
  have launchFuture : SchedulerProductivity.ExistentialAdvance program
      dispatcher inputBits (sampleIndex + clockCount) (fuelCount + 1)
      (clockPhaseCompletedConfiguration program dispatcher clockRegisters
        (fuel + 1) [.left environment]) := by
    exact ⟨_, _, trace.launch_seek, launchSample, fuelAdvance'⟩
  cases trace.clock.execution with
  | succ stage found tailExecution =>
      cases trace.clock.invariant with
      | succ _ first tailSampled =>
          have tailFuture : SchedulerProductivity.ExistentialAdvance program
              dispatcher inputBits
              (((sampleIndex + 1) + (fuel + 1))) (fuelCount + 1)
              (zeroClockMutationConfiguration program dispatcher clockRegisters
                (fuel + 1) (0 + fuel + 1) [.left environment]) := by
            simpa [clockCount, clockPhaseCompletedConfiguration,
              Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using launchFuture
          have tailAdvance := ClockTailSamples.prependExistentialAdvance program
            dispatcher inputBits clockRegisters phase scanned emptyMode
            clockCoherent (fuel + 1) tailExecution tailSampled tailFuture
          simpa [positiveStageAfterFirstCount, fuelCount, environment,
            Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using tailAdvance

/-- The concrete generator has eleven fully classified successor samples,
ending at the first Base-producing fuel contraction. -/
theorem InitialPositiveStageTrace.toExistentialAdvance
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) {context : Context} {descentTicks : Nat}
    (trace : InitialPositiveStageTrace program dispatcher inputBits context
      descentTicks) :
    SchedulerProductivity.ExistentialAdvance program dispatcher inputBits 0 11
      (SchedulerControl.initialConfiguration program dispatcher inputBits) := by
  have stageTail :=
    PositiveStagePhaseTrace.afterFirst_toExistentialAdvance program dispatcher
      inputBits (Registers.initial program) (CTS.zeroPhase program) [] false
      (RegistersCoherent.initial program) trace.stage.phaseTrace
  have stageTail' : SchedulerProductivity.ExistentialAdvance program dispatcher
      inputBits 2 9 (secondMutationConfiguration program dispatcher inputBits) := by
    simpa [positiveStageAfterFirstCount, secondMutationConfiguration,
      positiveClockMutationConfiguration, clockPhaseSourceConfiguration,
      clockBase] using! stageTail
  have secondSample : SampledState program dispatcher inputBits 2
      (secondMutationConfiguration program dispatcher inputBits) := by
    cases trace.stage.phaseTrace.clock.invariant with
    | succ _ first tail =>
        simpa [secondMutationConfiguration,
          positiveClockMutationConfiguration, clockBase] using! first
  have afterFirst : SchedulerProductivity.ExistentialAdvance program dispatcher
      inputBits 1 10 (firstMutationConfiguration program dispatcher inputBits) :=
    ⟨_, _, trace.first_seek_clock, secondSample, stageTail'⟩
  exact ⟨_, _, trace.initial_seek_first, trace.first, afterFirst⟩

theorem ResponseSamplePairs.ofPositioned
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool)
    (bits : List Bool) (continuation carrier : Term)
    (parents : List ParentFrame) :
    ∀ {configurations : List
        (SchedulerResponseInvariant.Configuration program dispatcher)}
      {entries : List (Bool × Term)},
      PositionedSamples program dispatcher
          (.normalResponse (registers.phase, bit)) registers configurations →
      configurations.map
          (fun configuration => configuration.cursor.erase) =
        entries.map (fun entry => Cursor.rebuild parents entry.2) →
      (∀ {done term}, (done, term) ∈ entries →
        ResponseRootMutation program dispatcher.tree
          (dispatcher.route_valid (registers.phase, bit)) bits continuation
          carrier done term) →
      ResponseSamplePairs program dispatcher registers bit bits continuation
        carrier parents configurations entries
  | [], [], .nil, _, _ => .nil
  | [], _ :: _, .nil, rootsEq, _ => by
      simp only [List.map] at rootsEq
      contradiction
  | _ :: _, [], .cons pc cursor position tail, rootsEq, _ => by
      simp only [List.map] at rootsEq
      contradiction
  | _, (done, term) :: entries,
      .cons pc cursor position tail, rootsEq, spec => by
      simp only [List.map, List.cons.injEq] at rootsEq
      exact .cons pc cursor done term position rootsEq.1
        (spec (List.Mem.head entries))
        (ResponseSamplePairs.ofPositioned program dispatcher registers bit bits
          continuation carrier parents tail rootsEq.2
          (fun member => spec (List.Mem.tail (done, term) member)))

theorem ResponseSamplePairs.toIndexedSampledStates
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool)
    (bits : List Bool) (continuation carrier : Term)
    (parents : List ParentFrame)
    {phase : CTS.Phase program} {scanned : List Bool} {emptyMode : Bool}
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    (snapshotInv : ReachableAudit.Holds program dispatcher.tree bits
      continuation carrier) :
    ∀ {configurations : List
        (SchedulerResponseInvariant.Configuration program dispatcher)}
      {entries : List (Bool × Term)} {inputBits : List Bool}
      {sampleIndex : Nat},
      ResponseSamplePairs program dispatcher registers bit bits continuation
        carrier parents configurations entries →
      ResponseClassifications program dispatcher inputBits registers bit
        sampleIndex configurations →
      IndexedResponseSampledStates program dispatcher inputBits sampleIndex
        configurations := by
  intro configurations entries inputBits sampleIndex pairs classifications
  induction pairs generalizing sampleIndex with
  | nil =>
      cases classifications
      exact .nil _
  | @cons pc cursor done term position eraseEq root configurationTail entryTail
      tail ih =>
      cases classifications with
      | cons index pc' cursor' decoder event tailClassifications =>
          have holds := responseScript_holds program dispatcher registers bit
            bits continuation carrier parents root snapshotInv position eraseEq
            coherent decoder
          exact .cons _ ⟨holds,
            ⟨.script (.normalResponse (registers.phase, bit)) pc registers,
              rfl, event⟩⟩
            (ih tailClassifications)

theorem scriptTrace_exactPositionedMutationChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (job : SchedulerControl.ScriptJob program) (registers : Registers program)
    (origin : Cursor)
    {script : Script} {before endpoint : Cursor} {cursorSamples : List Cursor}
    (trace : CursorMutationTrace script before cursorSamples endpoint) :
    ∀ (pc : SchedulerControl.ScriptPC program dispatcher job),
      Script.run
          (List.take pc.val
            (SchedulerControl.jobScript program dispatcher job)) origin =
        some before →
      List.drop pc.val (SchedulerControl.jobScript program dispatcher job) =
        script →
      pc.val + script.length =
        (SchedulerControl.jobScript program dispatcher job).length →
      ∃ configurationSamples : List
          (SchedulerResponseInvariant.Configuration program dispatcher),
        configurationSamples.map (fun configuration => configuration.cursor) =
          cursorSamples ∧
        ExactMutationChain (SchedulerControl.machine program dispatcher)
          ⟨some (SchedulerControl.afterScript program dispatcher job registers),
            endpoint⟩
          ⟨some (.script job pc registers), before⟩ configurationSamples ∧
        PositionedSamples program dispatcher job registers
          configurationSamples := by
  induction trace with
  | nil cursor =>
      intro pc prefixRun suffixEq lengthEq
      have pcAtEnd : pc.val =
          (SchedulerControl.jobScript program dispatcher job).length := by
        simpa using lengthEq
      have runSuffix := SchedulerExecution.run_script_suffix program dispatcher
        job registers pc 0 cursor cursor (by simpa using pcAtEnd) (by
          rw [suffixEq]
          rfl)
      have countSuffix :=
        SchedulerExecution.runMutationCount_script_suffix program dispatcher
          job registers pc 0 cursor cursor (by simpa using pcAtEnd) (by
            rw [suffixEq]
            rfl)
      exact ⟨[], rfl, .done 1 ⟨by simpa using runSuffix,
        by simpa [suffixEq] using countSuffix⟩, .nil⟩
  | @step operation rest before middle endpoint samples executes tail ih =>
      intro pc prefixRun suffixEq lengthEq
      have pcLt : pc.val <
          (SchedulerControl.jobScript program dispatcher job).length := by
        exact Nat.lt_of_lt_of_eq (Nat.lt_add_of_pos_right (by simp)) lengthEq
      have dropped := List.drop_eq_getElem_cons pcLt
      have pieces : operation :: rest =
          (SchedulerControl.jobScript program dispatcher job).get
              ⟨pc.val, pcLt⟩ ::
            List.drop (pc.val + 1)
              (SchedulerControl.jobScript program dispatcher job) :=
        suffixEq.symm.trans dropped
      have operationEq :
          (SchedulerControl.jobScript program dispatcher job).get
              ⟨pc.val, pcLt⟩ = operation :=
        (List.cons.inj pieces).1.symm
      have tailEq :
          List.drop (pc.val + 1)
              (SchedulerControl.jobScript program dispatcher job) = rest :=
        (List.cons.inj pieces).2.symm
      let next := SchedulerControl.nextScriptPC program dispatcher job pc pcLt
      have nextLength : next.val + rest.length =
          (SchedulerControl.jobScript program dispatcher job).length := by
        change (pc.val + 1) + rest.length = _
        calc
          (pc.val + 1) + rest.length = pc.val + (1 + rest.length) :=
            Nat.add_assoc _ _ _
          _ = pc.val + (rest.length + 1) := by
            rw [Nat.add_comm 1 rest.length]
          _ = _ := by simpa using lengthEq
      have actualExec :
          ((SchedulerControl.jobScript program dispatcher job).get
            ⟨pc.val, pcLt⟩).exec before = some middle := by
        rw [operationEq]
        exact executes
      have nextPrefix : Script.run
          (List.take next.val
            (SchedulerControl.jobScript program dispatcher job)) origin =
          some middle := by
        rw [show next.val = pc.val + 1 by rfl,
          List.take_succ_eq_append_getElem pcLt, Script.run_append, prefixRun]
        change Script.run
          [(SchedulerControl.jobScript program dispatcher job).get
            ⟨pc.val, pcLt⟩] before = some middle
        simp only [Script.run]
        rw [operationEq, executes]
      obtain ⟨configurationSamples, cursorsEq, chain, positions⟩ :=
        ih next nextPrefix
          (by simpa [next, SchedulerControl.nextScriptPC] using tailEq)
          nextLength
      let source : SchedulerResponseInvariant.Configuration program dispatcher :=
        ⟨some (.script job pc registers), before⟩
      let target : SchedulerResponseInvariant.Configuration program dispatcher :=
        ⟨some (.script job next registers), middle⟩
      have stepEq : FiniteController.step
          (SchedulerControl.machine program dispatcher) source = target := by
        simpa [source, target, next] using
          SchedulerExecution.step_script program dispatcher job registers pc
            before middle pcLt actualExec
      have mutationEq : FiniteController.mutationCount
          (SchedulerControl.machine program dispatcher) source =
            Script.rdxCount [operation] := by
        have counted := SchedulerExecution.mutationCount_script program
          dispatcher job registers pc before middle pcLt actualExec
        rw [operationEq] at counted
        simpa [source] using counted
      have nextSuffix : Script.run
          (List.drop next.val
            (SchedulerControl.jobScript program dispatcher job)) middle =
          some endpoint := by
        rw [show next.val = pc.val + 1 by rfl, tailEq]
        exact tail.run_eq
      have nextPosition : ControlPosition program dispatcher
          (.script job next registers) middle :=
        .script nextPrefix nextSuffix
          (script_commandSafe_of_suffixRun program dispatcher job registers
            next middle endpoint nextSuffix)
      cases operation with
      | L =>
          let zeroPrefix : ZeroMutationRun
              (SchedulerControl.machine program dispatcher) 1 source target := by
            refine ⟨?_, ?_⟩
            · simpa [FiniteController.run] using stepEq
            · simp [FiniteController.runMutationCount, mutationEq,
                Script.rdxCount]
          exact ⟨configurationSamples, cursorsEq,
            ExactMutationChain.prepend zeroPrefix chain, positions⟩
      | R =>
          let zeroPrefix : ZeroMutationRun
              (SchedulerControl.machine program dispatcher) 1 source target := by
            refine ⟨?_, ?_⟩
            · simpa [FiniteController.run] using stepEq
            · simp [FiniteController.runMutationCount, mutationEq,
                Script.rdxCount]
          exact ⟨configurationSamples, cursorsEq,
            ExactMutationChain.prepend zeroPrefix chain, positions⟩
      | U =>
          let zeroPrefix : ZeroMutationRun
              (SchedulerControl.machine program dispatcher) 1 source target := by
            refine ⟨?_, ?_⟩
            · simpa [FiniteController.run] using stepEq
            · simp [FiniteController.runMutationCount, mutationEq,
                Script.rdxCount]
          exact ⟨configurationSamples, cursorsEq,
            ExactMutationChain.prepend zeroPrefix chain, positions⟩
      | Rdx =>
          have found : FiniteController.seekMutation
              (SchedulerControl.machine program dispatcher) 1 source =
                some target := by
            simp [FiniteController.seekMutation, mutationEq, stepEq,
              Script.rdxCount]
          exact ⟨target :: configurationSamples, by simp [target, cursorsEq],
            .next 1 found chain, .cons next middle nextPosition positions⟩

theorem normalResponse_exactPositionedMutationChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    ∃ configurationSamples : List
        (SchedulerResponseInvariant.Configuration program dispatcher),
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerResponse.returnConfiguration program dispatcher registers
          bit bits continuation carrier parents)
        (SchedulerResponse.responseStartConfiguration program dispatcher
          registers bit bits continuation carrier parents)
        configurationSamples ∧
      PositionedSamples program dispatcher
        (.normalResponse (registers.phase, bit)) registers
        configurationSamples ∧
      configurationSamples.map
          (fun configuration => configuration.cursor.erase) =
        (responseEntries program
          (dispatcher.route_valid (registers.phase, bit)) bits continuation
          carrier).map
          (fun entry => Cursor.rebuild parents entry.2) := by
  obtain ⟨cursorSamples, trace, roots⟩ :=
    SchedulerCycle.normalResponse_canonicalMutationTrace program
      (dispatcher.route_valid (registers.phase, bit)) bits continuation carrier
      parents
  obtain ⟨configurationSamples, cursorsEq, chain, positions⟩ :=
    scriptTrace_exactPositionedMutationChain program dispatcher
      (.normalResponse (registers.phase, bit)) registers
      (SchedulerResponse.frameCursor program dispatcher bits continuation
        carrier parents) trace
      (SchedulerControl.firstScriptPC program dispatcher
        (.normalResponse (registers.phase, bit))) (by rfl) (by rfl) (by
          simp [SchedulerControl.firstScriptPC])
  refine ⟨configurationSamples, ?_, positions, ?_⟩
  · simpa [SchedulerResponse.responseStartConfiguration,
      SchedulerResponse.returnConfiguration] using! chain
  · calc
      configurationSamples.map
          (fun configuration => configuration.cursor.erase) =
          cursorSamples.map Cursor.erase := by
            simpa [List.map_map] using!
              congrArg (List.map Cursor.erase) cursorsEq
      _ = _ := roots

theorem normalResponse_exactPairedMutationChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    ∃ configurationSamples : List
        (SchedulerResponseInvariant.Configuration program dispatcher),
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerResponse.returnConfiguration program dispatcher registers
          bit bits continuation carrier parents)
        (SchedulerResponse.responseStartConfiguration program dispatcher
          registers bit bits continuation carrier parents)
        configurationSamples ∧
      ResponseSamplePairs program dispatcher registers bit bits continuation
        carrier parents configurationSamples
        (responseEntries program
          (dispatcher.route_valid (registers.phase, bit)) bits continuation
          carrier) := by
  obtain ⟨configurationSamples, chain, positions, roots⟩ :=
    normalResponse_exactPositionedMutationChain program dispatcher registers
      bit bits continuation carrier parents
  refine ⟨configurationSamples, chain, ?_⟩
  exact ResponseSamplePairs.ofPositioned program dispatcher registers bit bits
    continuation carrier parents positions roots
    (fun member => responseEntries_spec program
      (dispatcher.route_valid (registers.phase, bit)) bits continuation carrier
      member)

end SchedulerCycle

end PureSFormal.PureS
