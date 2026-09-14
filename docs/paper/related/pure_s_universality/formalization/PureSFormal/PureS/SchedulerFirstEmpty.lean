import PureSFormal.PureS.SchedulerNestedResponse
import PureSFormal.PureS.SchedulerNestedEmpty

/-!
# First-empty bounded jobs

This module connects an ordinary nonempty response prefix to the absorbing
EMPTY scheduler.  The cost lemmas below identify the EMPTY family's forward
mutation count with the same checked-transition sum used by `jobCost`.
-/

namespace PureSFormal.PureS

namespace SchedulerFirstEmpty

open SchedulerControl SchedulerInvariant SchedulerCycle
  SchedulerCompletedContext SchedulerNestedResponse SchedulerNestedEmpty

/-- One absorbing-empty frame has exactly the checked-transition cost at its
registered phase. -/
theorem emptyFrameCost_eq_totalCost
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (phase : CTS.Phase program) :
    LocalResponse.completedCost program
          (dispatcher.route (phase, false)) (phase, false) + 1 =
      CheckedTransition.totalCost program dispatcher phase [] := by
  rw [CheckedTransition.totalCost_empty]
  simp only [LocalResponse.completedCost, actionCost_zero, Nat.add_zero]
  let routeCost := 2 * (dispatcher.route (phase, false)).length
  change 3 + (routeCost + 1) + 1 = 5 + routeCost
  calc
    3 + (routeCost + 1) + 1 = 3 + ((routeCost + 1) + 1) :=
      Nat.add_assoc 3 (routeCost + 1) 1
    _ = 3 + (routeCost + (1 + 1)) := by
      rw [Nat.add_assoc routeCost 1 1]
    _ = 3 + (2 + routeCost) := by
      rw [Nat.add_comm routeCost (1 + 1)]
    _ = (3 + 2) + routeCost := by
      rw [Nat.add_assoc]
    _ = 5 + routeCost := rfl

/-- The EMPTY register recurrence and the CTS phase recurrence denote the
same finite phase advance. -/
theorem emptySweepPhase_eq_iteratePhase
    (program : CTS.Program) : ∀ (count : Nat) (phase : CTS.Phase program),
    SchedulerNestedEmpty.emptySweepPhase program count phase =
      CTS.iteratePhase program count phase
  | 0, phase => rfl
  | count + 1, phase => by
      rw [SchedulerNestedEmpty.emptySweepPhase,
        emptySweepPhase_eq_iteratePhase program count
          (CTS.nextPhase program phase)]
      apply Fin.ext
      simp [CTS.nextPhase, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

/-- A recursive EMPTY sweep is the forward checked-transition sum from the
corresponding absorbing-empty configuration. -/
theorem emptySweepMutations_eq_nonemptySweepCost
    (program : CTS.Program) (dispatcher : ActionDispatcher program) :
    ∀ (count : Nat) (registers : Registers program)
      (phase : CTS.Phase program),
      RegistersCoherent registers phase [] true →
      SchedulerCycle.emptySweepMutations program dispatcher count registers =
        SchedulerNestedResponse.nonemptySweepCost program dispatcher count
          ⟨phase, []⟩
  | 0, registers, phase, coherent => rfl
  | count + 1, registers, phase, coherent => by
      have nextCoherent : RegistersCoherent registers.advanceEmpty
          (CTS.nextPhase program phase) [] true := coherent.advanceEmpty
      rw [SchedulerCycle.emptySweepMutations,
        SchedulerNestedResponse.nonemptySweepCost_succ,
        emptySweepMutations_eq_nonemptySweepCost program dispatcher count
          registers.advanceEmpty (CTS.nextPhase program phase) nextCoherent]
      rw [coherent.phase_eq]
      simp only [CTS.absorbingStep_empty, CTS.advance]
      rw [emptyFrameCost_eq_totalCost]

/-- The pending EMPTY sweep followed by its terminal frame accounts for one
more absorbing transition in the same forward sum. -/
theorem emptyCleanupMutations_eq_nonemptySweepCost
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (count : Nat) (registers : Registers program)
    (phase : CTS.Phase program)
    (coherent : RegistersCoherent registers phase [] true) :
    SchedulerRootContinuation.emptyCleanupMutations program dispatcher count
        registers =
      SchedulerNestedResponse.nonemptySweepCost program dispatcher (count + 1)
        ⟨phase, []⟩ := by
  rw [SchedulerRootContinuation.emptyCleanupMutations,
    SchedulerNestedResponse.nonemptySweepCost_succ_last,
    emptySweepMutations_eq_nonemptySweepCost program dispatcher count registers
      phase coherent]
  have sweptCoherent := SchedulerNestedEmpty.emptySweepRegisters_coherent
    program count registers phase coherent
  have iteratePhase := CTS.iterate_phase program count ⟨phase, []⟩
  have iterateEmpty : (CTS.iterate program count ⟨phase, []⟩).data = [] := by
    exact congrArg CTS.Config.data (CTS.iterate_empty program count phase)
  have sweptPhase :
      (SchedulerCycle.emptySweepRegisters program count registers).phase =
        (CTS.iterate program count ⟨phase, []⟩).phase := by
    calc
      (SchedulerCycle.emptySweepRegisters program count registers).phase =
          SchedulerNestedEmpty.emptySweepPhase program count phase :=
        sweptCoherent.phase_eq
      _ = CTS.iteratePhase program count phase :=
        emptySweepPhase_eq_iteratePhase program count phase
      _ = (CTS.iterate program count ⟨phase, []⟩).phase := by
        exact (CTS.iterate_phase program count ⟨phase, []⟩).symm
  rw [iterateEmpty]
  rw [sweptPhase]
  exact congrArg
    (fun cost =>
      SchedulerNestedResponse.nonemptySweepCost program dispatcher count
          ⟨phase, []⟩ + cost)
    (emptyFrameCost_eq_totalCost program dispatcher
      (CTS.iterate program count ⟨phase, []⟩).phase)

/-- Forward checked-transition costs split at an arbitrary finite horizon. -/
theorem nonemptySweepCost_add
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (first : Nat) (current : CTS.Config program) : ∀ second,
    SchedulerNestedResponse.nonemptySweepCost program dispatcher
        (first + second) current =
      SchedulerNestedResponse.nonemptySweepCost program dispatcher first
          current +
        SchedulerNestedResponse.nonemptySweepCost program dispatcher second
          (CTS.iterate program first current)
  | 0 => by simp
  | second + 1 => by
      rw [show first + (second + 1) = (first + second) + 1 by
        simp [Nat.add_assoc]]
      rw [SchedulerNestedResponse.nonemptySweepCost_succ_last,
        SchedulerNestedResponse.nonemptySweepCost_succ_last,
        nonemptySweepCost_add program dispatcher first current second]
      have iterateEq : CTS.iterate program (first + second) current =
          CTS.iterate program second (CTS.iterate program first current) := by
        rw [Nat.add_comm first second]
        exact CTS.iterate_add program second first current
      rw [iterateEq]
      simp [Nat.add_assoc]

/-! ## Exact entry at the first empty successor -/

/-- Pending-frame construction distributes over addition.  This is the zipper
identity used to split the nonempty prefix from the absorbing suffix. -/
theorem pendingParents_add
    (environment continuation : Term) : ∀ first second parents,
    PrimitiveFuel.pendingParents environment continuation (first + second)
        parents =
      PrimitiveFuel.pendingParents environment continuation first
        (PrimitiveFuel.pendingParents environment continuation second parents)
  | first, 0, parents => rfl
  | first, second + 1, parents => by
      change PrimitiveFuel.pendingParents environment continuation
          (first + second)
            (.right (.app environment continuation) :: parents) =
        PrimitiveFuel.pendingParents environment continuation first
          (PrimitiveFuel.pendingParents environment continuation second
            (.right (.app environment continuation) :: parents))
      exact pendingParents_add environment continuation first second
        (.right (.app environment continuation) :: parents)

/-- The normal marker contraction has the simultaneous invariant for an
arbitrary decoder classification.  Terminal and pending uses differ only in
this evidence, not in the controller position or reachable-carrier audit. -/
theorem normalMarker_holdsWith
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame)
    {phase : CTS.Phase program} {scanned : List Bool} {emptyMode : Bool}
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    (snapshotInv : ReachableAudit.Holds program dispatcher.tree bits
      continuation carrier)
    (decoder : DecoderEvidence program dispatcher.tree .return
      (SchedulerRootContinuation.normalMarkerMutationConfiguration program
        dispatcher registers bit bits continuation carrier parents).cursor.erase) :
    Holds program dispatcher
      (SchedulerRootContinuation.normalMarkerMutationConfiguration program
        dispatcher registers bit bits continuation carrier parents) := by
  let completed := SchedulerResponse.completedCursor program dispatcher
    registers bit bits continuation carrier parents
  let marked := SchedulerResponse.markedCursor program dispatcher registers bit
    bits continuation carrier parents
  let sample := SchedulerRootContinuation.normalMarkerCursor program dispatcher
    registers bit bits continuation carrier parents
  have prefixRun : Script.run
      (List.take 4
        (SchedulerControl.jobScript program dispatcher .markNormal)) completed =
      some sample := by
    rfl
  have suffixRun : Script.run
      (List.drop 4
        (SchedulerControl.jobScript program dispatcher .markNormal)) sample =
      some marked := by
    rfl
  have safe : CommandSafe sample
      (SchedulerControl.transition program dispatcher
        (.script .markNormal ⟨4, by
          simp [SchedulerControl.jobScript, PrimitiveScripts.mark]⟩ registers)
        (Probe.observeNode sample) (Probe.observeIncoming sample)) := by
    exact ⟨_, rfl⟩
  have position : ControlPosition program dispatcher
      (.script .markNormal ⟨4, by
        simp [SchedulerControl.jobScript, PrimitiveScripts.mark]⟩ registers)
      sample :=
    .script prefixRun suffixRun safe
  let markedTerm := LocalResponse.markedCompleted bits continuation carrier
    (SchedulerResponse.completedRoute program dispatcher registers bit carrier)
  have markedInv : ReachableAudit.Holds program dispatcher.tree bits continuation
      markedTerm :=
    SchedulerResponse.marked_holds program dispatcher registers bit bits
      continuation carrier snapshotInv
  have audit : AuditedOccurrence program dispatcher.tree sample.erase := by
    refine .intro bits continuation markedTerm
      (SchedulerInvariant.contextOfParents parents) markedInv ?_
    have sampleErase : sample.erase =
        (SchedulerResponse.markedCursor program dispatcher registers bit bits
          continuation carrier parents).erase := by
      simpa [sample] using!
        (SchedulerRootContinuation.normalMarkerMutation_erase program dispatcher
          registers bit bits continuation carrier parents)
    rw [sampleErase]
    change Cursor.rebuild parents markedTerm =
      (SchedulerInvariant.contextOfParents parents).plug markedTerm
    exact (SchedulerInvariant.contextOfParents_plug parents markedTerm).symm
  exact .intro
    (.script .markNormal ⟨4, by
      simp [SchedulerControl.jobScript, PrimitiveScripts.mark]⟩ registers)
    rfl phase scanned emptyMode coherent position (.return decoder audit)

/-- The first normal marker is silent whenever at least one pending fuel frame
still encloses it. -/
theorem pendingNormalMarker_sampledAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) (sampleNumber : Nat)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (depth : Nat) (positive : depth ≠ 0)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers)
    {phase : CTS.Phase program} {scanned : List Bool} {emptyMode : Bool}
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    (snapshotInv : ReachableAudit.Holds program dispatcher.tree bits
      continuation carrier) :
    SampledState program dispatcher inputBits sampleNumber
      (SchedulerRootContinuation.normalMarkerMutationConfiguration program
        dispatcher registers bit bits continuation carrier
        (PrimitiveFuel.pendingParents
          (environmentCode (compileActions program dispatcher.tree) bits)
          continuation depth outerParents)) := by
  let parents := PrimitiveFuel.pendingParents
    (environmentCode (compileActions program dispatcher.tree) bits)
    continuation depth outerParents
  let marker := SchedulerRootContinuation.normalMarkerMutationConfiguration
    program dispatcher registers bit bits continuation carrier parents
  let markedTerm := LocalResponse.markedCompleted bits continuation carrier
    (SchedulerResponse.completedRoute program dispatcher registers bit carrier)
  have silent : SilentEvidence program dispatcher.tree .return
      marker.cursor.erase := by
    rw [show marker.cursor.erase = Cursor.rebuild parents markedTerm by
      simpa [marker, markedTerm] using!
        (SchedulerRootContinuation.normalMarkerMutation_erase program dispatcher
          registers bit bits continuation carrier parents)]
    exact outer.pendingSilent .return bits continuation markedTerm depth positive
  have holds := normalMarker_holdsWith program dispatcher registers bit bits
    continuation carrier parents coherent snapshotInv (.silent silent)
  exact SampledState.ofSilent
    (.script .markNormal ⟨4, by
      simp [SchedulerControl.jobScript, PrimitiveScripts.mark]⟩ registers)
    holds rfl silent

/-- Coherence at the first EMPTY-family frame.  The normal response has
advanced the phase and cleared the scan registers; entry changes only the
absorbing-mode bit. -/
theorem enteredEmptyRegisters_coherent
    {program : CTS.Program} {registers : Registers program}
    {phase : CTS.Phase program} {scanned : List Bool} {emptyMode : Bool}
    (coherent : RegistersCoherent registers phase scanned emptyMode) :
    RegistersCoherent (SchedulerCycle.enteredEmptyRegisters registers.advance)
      (CTS.nextPhase program phase) [] true := by
  have advanced := coherent.advance
  exact ⟨advanced.phase_eq, advanced.bit_eq, advanced.seen_eq,
    advanced.tail_eq, rfl⟩

/-- Execute the selected response whose successor is the first empty word,
while at least one fuel frame remains.  The ordinary response samples and its
single normal marker are all silent below that positive pending stack.  The
endpoint is the exact first EMPTY frame, with the decoded marked carrier and
register coherence exposed for the absorbing suffix. -/
theorem selectedFirstEmptyEntryAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits seedBits : List Bool) (continuation source : Term)
    (hadmissible : Carrier.Admissible continuation)
    (registers : Registers program) (phase : CTS.Phase program)
    (coherent : RegistersCoherent registers phase [] false)
    (bit : Bool) (suffix : List Bool) (count sampleIndex : Nat)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers)
    {outerContext fullContext innerContext targetContext : Context}
    {ticks : Nat}
    (trace : SelectedResponseTrace program dispatcher seedBits continuation
      source hadmissible registers bit suffix outerContext fullContext
      innerContext targetContext
      (PrimitiveFuel.pendingParents
        (environmentCode (compileActions program dispatcher.tree) seedBits)
        continuation (count + 1) outerParents) ticks)
    (dataEq :
      (CTS.absorbingStep program ⟨registers.phase, bit :: suffix⟩).data = []) :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) seedBits
    let finalRegisters := scannedRegisters registers bit suffix
    let carrier := deletedCarrier bit outerContext innerContext
    let marked := LocalResponse.markedCompleted seedBits continuation carrier
      (SchedulerResponse.completedRoute program dispatcher finalRegisters bit
        carrier)
    let emptyRegisters :=
      SchedulerCycle.enteredEmptyRegisters finalRegisters.advance
    ∃ configurations : List (SchedulerInvariant.Configuration program dispatcher),
      SchedulerResponseInvariant.ExactMutationChain
        (SchedulerControl.machine program dispatcher)
        (SchedulerEmpty.frameConfiguration program dispatcher emptyRegisters
          seedBits continuation marked
          (PrimitiveFuel.pendingParents environment continuation count
            outerParents))
        (upConfiguration program dispatcher registers omega
          (ContextCursor.frames fullContext omega
            (.right (SchedulerResponse.pendingFunction program dispatcher
              seedBits continuation) ::
              PrimitiveFuel.pendingParents environment continuation (count + 1)
                outerParents))) configurations ∧
      IndexedResponseSampledStates program dispatcher inputBits sampleIndex
        configurations ∧
      configurations.length =
        CheckedTransition.totalCost program dispatcher phase (bit :: suffix) ∧
      RegistersCoherent emptyRegisters (CTS.nextPhase program phase) [] true ∧
      ReachableAudit.Holds program dispatcher.tree seedBits continuation marked ∧
      CarrierDecoder.decode? program dispatcher.tree seedBits continuation
        hadmissible marked = some [] := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) seedBits
  let finalRegisters := scannedRegisters registers bit suffix
  let carrier := deletedCarrier bit outerContext innerContext
  let marked := LocalResponse.markedCompleted seedBits continuation carrier
    (SchedulerResponse.completedRoute program dispatcher finalRegisters bit
      carrier)
  let emptyRegisters :=
    SchedulerCycle.enteredEmptyRegisters finalRegisters.advance
  let parents := PrimitiveFuel.pendingParents environment continuation
    (count + 1) outerParents
  let nextParents := PrimitiveFuel.pendingParents environment continuation count
    outerParents
  let marker := SchedulerRootContinuation.normalMarkerMutationConfiguration
    program dispatcher finalRegisters bit seedBits continuation carrier parents
  have parentSplit : parents =
      .right (SchedulerResponse.pendingFunction program dispatcher seedBits
        continuation) :: nextParents := by
    simpa [parents, nextParents, environment, SchedulerResponse.pendingFunction,
      PendingFrame.environmentCode_eq_envelope, PendingFrame.frameFunction] using
      (SchedulerCycle.pendingParents_succ_cons environment continuation count
        outerParents)
  have notSeen : registers.seen = false := by
    simpa using! coherent.seen_eq
  have noTail : registers.tail = false := by
    simpa using! coherent.tail_eq
  have bitEq : finalRegisters.bit = some bit := by
    simpa [finalRegisters] using
      scannedRegisters_bit registers bit suffix notSeen
  have finalCoherent : RegistersCoherent finalRegisters phase (bit :: suffix)
      false :=
    scannedRegisters_coherentAt program registers phase coherent bit suffix
  have outputEq : SchedulerControl.outputEmpty program finalRegisters bit =
      true := by
    have exactOutput := outputEmpty_scannedRegisters program registers bit suffix
      notSeen noTail
    rw [dataEq] at exactOutput
    simpa [finalRegisters] using exactOutput
  obtain ⟨beforeConfigurations, beforeChain, beforeSampled, beforeLength⟩ :=
    selectedPendingSegmentAt program dispatcher inputBits seedBits continuation
      source hadmissible registers phase coherent bit suffix (count + 1)
      sampleIndex (Nat.succ_ne_zero count) outerParents layers outer trace
  have trace' : SelectedResponseTrace program dispatcher seedBits continuation
      source hadmissible registers bit suffix outerContext fullContext
      innerContext targetContext
      (.right (SchedulerResponse.pendingFunction program dispatcher seedBits
        continuation) :: nextParents) ticks := by
    rw [← parentSplit]
    simpa [parents, environment] using trace
  obtain ⟨emptyContext, returnTicks, downTicks, ascentTicks, entry⟩ :=
    enterEmptyTrace program dispatcher seedBits continuation source hadmissible
      registers bit suffix nextParents ticks trace' notSeen noTail dataEq
  have found : FiniteController.seekMutation
      (SchedulerControl.machine program dispatcher) 5
      (selectedReturnConfiguration program dispatcher registers bit suffix
        seedBits continuation carrier parents) = some marker := by
    simpa [selectedReturnConfiguration, finalRegisters, carrier, marker] using
      (SchedulerRootContinuation.markedReturn_seekMarker program dispatcher
        finalRegisters bit seedBits continuation carrier parents bitEq outputEq)
  have markerSuffix := SchedulerRootContinuation.normalMarkerSuffix_zeroRun
    program dispatcher finalRegisters bit seedBits continuation carrier parents
  have pending : ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher
          (.pending .normalReturn)
          (SchedulerResponse.pendingChildCursor program dispatcher seedBits
            continuation marked nextParents) + 1)
      (SchedulerResponse.markedPendingConfiguration program dispatcher
        finalRegisters bit seedBits continuation carrier parents)
      (SchedulerResponse.markedNestedDownConfiguration program dispatcher
        finalRegisters bit seedBits continuation carrier nextParents) := by
    have run := SchedulerResponse.normalPending_zeroRun program dispatcher
      finalRegisters.advance seedBits continuation marked nextParents
    simpa [parents, parentSplit, marked,
      SchedulerResponse.markedPendingConfiguration,
      SchedulerResponse.markedCursor,
      SchedulerResponse.normalPendingProbeConfiguration,
      SchedulerResponse.markedNestedDownConfiguration,
      SchedulerResponse.normalPendingDownConfiguration] using! run
  have afterMarker : ZeroMutationRun
      (SchedulerControl.machine program dispatcher)
      (((4 +
          (SchedulerControl.compiledProbeCost program dispatcher
            (.pending .normalReturn)
            (SchedulerResponse.pendingChildCursor program dispatcher seedBits
              continuation marked nextParents) + 1)) + downTicks) + ascentTicks)
      marker
      (SchedulerEmpty.frameConfiguration program dispatcher emptyRegisters
        seedBits continuation marked nextParents) := by
    have combined := ((markerSuffix.trans pending).trans entry.downToUp).trans
      entry.upToEmpty
    simpa [marker, marked, finalRegisters, carrier, emptyRegisters, nextParents,
      SchedulerCycle.enteredEmptyFrameConfiguration, Nat.add_assoc] using combined
  have markerChain : SchedulerResponseInvariant.ExactMutationChain
      (SchedulerControl.machine program dispatcher)
      (SchedulerEmpty.frameConfiguration program dispatcher emptyRegisters
        seedBits continuation marked nextParents)
      (selectedReturnConfiguration program dispatcher registers bit suffix
        seedBits continuation carrier parents) [marker] :=
    .next 5 found (.done _ afterMarker)
  have markerSample : SampledState program dispatcher inputBits
      (sampleIndex + beforeConfigurations.length + 1) marker := by
    simpa [marker, parents, environment, finalRegisters, carrier] using
      (pendingNormalMarker_sampledAt program dispatcher inputBits
        (sampleIndex + beforeConfigurations.length + 1) finalRegisters bit
        seedBits continuation carrier (count + 1) (Nat.succ_ne_zero count)
        outerParents layers outer finalCoherent trace.targetHolds)
  have completeChain := SchedulerRecurrence.ExactMutationChain.append beforeChain
    markerChain
  have completeSampled :=
    SchedulerRecurrence.IndexedResponseSampledStates.appendOne program dispatcher
      inputBits beforeSampled marker markerSample
  have emptyCoherent : RegistersCoherent emptyRegisters
      (CTS.nextPhase program phase) [] true := by
    simpa [emptyRegisters, finalRegisters] using
      (enteredEmptyRegisters_coherent finalCoherent)
  have markedAudit : ReachableAudit.Holds program dispatcher.tree seedBits
      continuation marked := by
    simpa [marked, finalRegisters, carrier] using entry.markedHolds
  have markedDecode : CarrierDecoder.decode? program dispatcher.tree seedBits
      continuation hadmissible marked = some [] := by
    simpa [marked, finalRegisters, carrier] using
      (LocalTransition.Descent.decode_eq program dispatcher.tree seedBits
        continuation hadmissible entry.emptyDescent)
  refine ⟨beforeConfigurations ++ [marker], ?_, completeSampled, ?_,
    emptyCoherent, markedAudit, markedDecode⟩
  · simpa [parents, nextParents, environment, marker, marked, finalRegisters,
      carrier, emptyRegisters] using completeChain
  · simp only [List.length_append, List.length_singleton]
    rw [beforeLength]
    have dataEqPhase :
        (CTS.absorbingStep program ⟨phase, bit :: suffix⟩).data = [] := by
      rw [← coherent.phase_eq]
      exact dataEq
    rw [CheckedTransition.totalCost_cons, dataEqPhase,
      CheckedTransition.markerCost_empty]
    rw [show (scannedRegisters registers bit suffix).phase = phase by
      exact finalCoherent.phase_eq]

/-! ## A nonempty prefix that preserves an outer pending suffix -/

/-- Execute exactly `nonemptyCount` nonempty selected responses while leaving
`tailDepth` pending frames untouched.  This is the two-counter strengthening
of `selectedNonemptyPendingPrefixAt` needed when the first empty successor lies
strictly inside a bounded job. -/
theorem selectedNonemptyPrefixKeepingPendingAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits seedBits : List Bool) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers) :
    ∀ (nonemptyCount tailDepth sampleIndex : Nat)
      (registers : Registers program)
      (phase : CTS.Phase program) (bit : Bool) (suffix : List Bool)
      (source : Term)
      (outerContext fullContext innerContext targetContext : Context)
      (ticks : Nat),
      RegistersCoherent registers phase [] false →
      SelectedResponseTrace program dispatcher seedBits continuation source
        hadmissible registers bit suffix outerContext fullContext innerContext
        targetContext
        (PrimitiveFuel.pendingParents
          (environmentCode (compileActions program dispatcher.tree) seedBits)
          continuation (nonemptyCount + tailDepth) outerParents) ticks →
      (∀ k, k ≤ nonemptyCount →
        (CTS.iterate program k ⟨phase, bit :: suffix⟩).data ≠ []) →
      ∃ finalRegisters finalPhase finalBit finalSuffix finalSource
          finalOuterContext finalFullContext finalInnerContext
          finalTargetContext finalTicks configurations,
        SchedulerResponseInvariant.ExactMutationChain
          (SchedulerControl.machine program dispatcher)
          (upConfiguration program dispatcher finalRegisters omega
            (ContextCursor.frames finalFullContext omega
              (.right (SchedulerResponse.pendingFunction program dispatcher
                seedBits continuation) ::
                PrimitiveFuel.pendingParents
                  (environmentCode
                    (compileActions program dispatcher.tree) seedBits)
                  continuation tailDepth outerParents)))
          (upConfiguration program dispatcher registers omega
            (ContextCursor.frames fullContext omega
              (.right (SchedulerResponse.pendingFunction program dispatcher
                seedBits continuation) ::
                PrimitiveFuel.pendingParents
                  (environmentCode
                    (compileActions program dispatcher.tree) seedBits)
                  continuation (nonemptyCount + tailDepth) outerParents)))
          configurations ∧
        IndexedResponseSampledStates program dispatcher inputBits sampleIndex
          configurations ∧
        configurations.length =
          nonemptySweepCost program dispatcher nonemptyCount
            ⟨phase, bit :: suffix⟩ ∧
        RegistersCoherent finalRegisters finalPhase [] false ∧
        SelectedResponseTrace program dispatcher seedBits continuation
          finalSource hadmissible finalRegisters finalBit finalSuffix
          finalOuterContext finalFullContext finalInnerContext finalTargetContext
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program dispatcher.tree) seedBits)
            continuation tailDepth outerParents) finalTicks ∧
        ⟨finalPhase, finalBit :: finalSuffix⟩ =
          CTS.iterate program nonemptyCount ⟨phase, bit :: suffix⟩
  | 0, tailDepth, sampleIndex, registers, phase, bit, suffix, source,
      outerContext, fullContext, innerContext, targetContext, ticks, coherent,
      trace, allNonempty => by
      refine ⟨registers, phase, bit, suffix, source, outerContext, fullContext,
        innerContext, targetContext, ticks, [], ?_, .nil sampleIndex, rfl,
        coherent, ?_, rfl⟩
      · exact .done 0 ⟨by simp, rfl⟩
      · simpa using trace
  | nonemptyCount + 1, tailDepth, sampleIndex, registers, phase, bit, suffix, source,
      outerContext, fullContext, innerContext, targetContext, ticks, coherent,
      trace, allNonempty => by
      let environment :=
        environmentCode (compileActions program dispatcher.tree) seedBits
      let totalDepth := (nonemptyCount + 1) + tailDepth
      let nextDepth := nonemptyCount + tailDepth
      let afterParents := PrimitiveFuel.pendingParents environment continuation
        totalDepth outerParents
      let nextParents := PrimitiveFuel.pendingParents environment continuation
        nextDepth outerParents
      let finalRegisters := scannedRegisters registers bit suffix
      let carrier := deletedCarrier bit outerContext innerContext
      have depthEq : totalDepth = nextDepth + 1 := by
        simp [totalDepth, nextDepth, Nat.add_assoc, Nat.add_comm,
          Nat.add_left_comm]
      have depthPositive : totalDepth ≠ 0 := by
        rw [depthEq]
        exact Nat.succ_ne_zero nextDepth
      have parentSplit : afterParents =
          .right (SchedulerResponse.pendingFunction program dispatcher seedBits
            continuation) :: nextParents := by
        change PrimitiveFuel.pendingParents environment continuation totalDepth
            outerParents =
          .right (SchedulerResponse.pendingFunction program dispatcher seedBits
            continuation) ::
            PrimitiveFuel.pendingParents environment continuation nextDepth
              outerParents
        rw [depthEq]
        simpa [environment,
          SchedulerResponse.pendingFunction,
          PendingFrame.environmentCode_eq_envelope,
          PendingFrame.frameFunction] using
          (SchedulerCycle.pendingParents_succ_cons environment continuation
            nextDepth outerParents)
      have firstNonempty :
          (CTS.absorbingStep program ⟨phase, bit :: suffix⟩).data ≠ [] := by
        have indexed := allNonempty 1
          (Nat.succ_le_succ (Nat.zero_le nonemptyCount))
        simpa [CTS.iterate] using indexed
      cases dataEq :
          (CTS.absorbingStep program ⟨phase, bit :: suffix⟩).data with
      | nil => exact (firstNonempty dataEq).elim
      | cons nextBit nextSuffix =>
          have dataEqRegisters :
              (CTS.absorbingStep program
                ⟨registers.phase, bit :: suffix⟩).data =
                  nextBit :: nextSuffix := by
            rw [coherent.phase_eq]
            exact dataEq
          have cycleTrace : SelectedResponseTrace program dispatcher seedBits
              continuation source hadmissible registers bit suffix outerContext
              fullContext innerContext targetContext
              (.right (SchedulerResponse.pendingFunction program dispatcher
                seedBits continuation) :: nextParents) ticks := by
            rw [← parentSplit]
            simpa [afterParents, totalDepth, environment] using trace
          obtain ⟨firstConfigurations, firstChain, firstSampled,
              firstLength⟩ :=
            selectedPendingSegmentAt program dispatcher inputBits seedBits
              continuation source hadmissible registers phase coherent bit suffix
              totalDepth sampleIndex depthPositive outerParents layers outer
              (by simpa [totalDepth, environment] using trace)
          have notSeen : registers.seen = false := by
            simpa using! coherent.seen_eq
          have noTail : registers.tail = false := by
            simpa using! coherent.tail_eq
          obtain ⟨nextContext, nextOuterContext, nextFullContext,
              nextInnerContext, nextTargetContext, returnTicks, downTicks,
              nextTicks, cycle⟩ :=
            pendingNonemptyCycleTrace program dispatcher seedBits continuation
              source hadmissible registers bit suffix nextParents ticks cycleTrace
              notSeen noTail nextBit nextSuffix dataEqRegisters
          have scannedCoherent : RegistersCoherent finalRegisters phase
              (bit :: suffix) false :=
            scannedRegisters_coherentAt program registers phase coherent bit
              suffix
          have nextCoherent : RegistersCoherent finalRegisters.advance
              (CTS.nextPhase program phase) [] false := scannedCoherent.advance
          have stepEq :
              CTS.absorbingStep program ⟨phase, bit :: suffix⟩ =
                ⟨CTS.nextPhase program phase, nextBit :: nextSuffix⟩ := by
            cases step : CTS.absorbingStep program
                ⟨phase, bit :: suffix⟩ with
            | mk nextPhase output =>
                have phaseEq : nextPhase = CTS.nextPhase program phase := by
                  simpa [step] using
                    (CTS.absorbingStep_phase program
                      ⟨phase, bit :: suffix⟩)
                have outputEq : output = nextBit :: nextSuffix := by
                  simpa [step] using dataEq
                subst nextPhase
                subst output
                rfl
          have tailNonempty : ∀ k, k ≤ nonemptyCount →
              (CTS.iterate program k
                ⟨CTS.nextPhase program phase, nextBit :: nextSuffix⟩).data
                  ≠ [] := by
            intro k bound
            have shifted := allNonempty (k + 1) (Nat.succ_le_succ bound)
            have iterateEq :
                CTS.iterate program (k + 1) ⟨phase, bit :: suffix⟩ =
                  CTS.iterate program k
                    ⟨CTS.nextPhase program phase,
                      nextBit :: nextSuffix⟩ := by
              rw [CTS.iterate_add]
              change CTS.iterate program k
                  (CTS.absorbingStep program ⟨phase, bit :: suffix⟩) = _
              rw [stepEq]
            rw [iterateEq] at shifted
            exact shifted
          obtain ⟨terminalRegisters, terminalPhase, terminalBit,
              terminalSuffix, terminalSource, terminalOuterContext,
              terminalFullContext, terminalInnerContext, terminalTargetContext,
              terminalTicks, tailConfigurations, tailChain, tailSampled,
              tailLength, terminalCoherent, terminalTrace, terminalEq⟩ :=
            selectedNonemptyPrefixKeepingPendingAt program dispatcher inputBits
              seedBits continuation hadmissible outerParents layers outer
              nonemptyCount
              tailDepth (sampleIndex + firstConfigurations.length)
              finalRegisters.advance (CTS.nextPhase program phase) nextBit
              nextSuffix
              (LocalResponse.completed seedBits continuation carrier
                (SchedulerResponse.completedRoute program dispatcher
                  finalRegisters bit carrier))
              nextOuterContext nextFullContext nextInnerContext nextTargetContext
              nextTicks nextCoherent (by
                simpa [nextParents, nextDepth, environment, finalRegisters,
                  carrier] using cycle.nextResponse)
              tailNonempty
          obtain ⟨bridgeDownTicks, bridgeDown⟩ := run_downDescent
            finalRegisters.advance cycle.nextResponse.sourceDescent
            (.right (SchedulerResponse.pendingFunction program dispatcher
              seedBits continuation) :: nextParents)
          have bridge : ZeroMutationRun
              (SchedulerControl.machine program dispatcher)
              (returnTicks + bridgeDownTicks)
              (selectedReturnConfiguration program dispatcher registers bit
                suffix seedBits continuation carrier afterParents)
              (upConfiguration program dispatcher finalRegisters.advance omega
                (ContextCursor.frames nextFullContext omega
                  (.right (SchedulerResponse.pendingFunction program dispatcher
                    seedBits continuation) :: nextParents))) := by
            have down' : ZeroMutationRun
                (SchedulerControl.machine program dispatcher) bridgeDownTicks
                (freshPendingDownConfiguration program dispatcher registers bit
                  suffix seedBits continuation carrier nextParents)
                (upConfiguration program dispatcher finalRegisters.advance omega
                  (ContextCursor.frames nextFullContext omega
                    (.right (SchedulerResponse.pendingFunction program dispatcher
                      seedBits continuation) :: nextParents))) := by
              simpa [freshPendingDownConfiguration,
                SchedulerResponse.freshNestedDownConfiguration,
                SchedulerResponse.normalPendingDownConfiguration,
                finalRegisters, carrier] using! bridgeDown
            have combined := cycle.returnToDown.trans down'
            rw [parentSplit]
            simpa [pendingReturnConfiguration, selectedReturnConfiguration,
              finalRegisters, carrier] using! combined
          have linkedTail :=
            SchedulerResponseInvariant.ExactMutationChain.prepend bridge tailChain
          have completeChain := SchedulerRecurrence.ExactMutationChain.append
            firstChain linkedTail
          have completeSampled :=
            SchedulerNestedPhase.IndexedResponseSampledStates.append program
              dispatcher inputBits firstSampled (by simpa using tailSampled)
          refine ⟨terminalRegisters, terminalPhase, terminalBit,
            terminalSuffix, terminalSource, terminalOuterContext,
            terminalFullContext, terminalInnerContext, terminalTargetContext,
            terminalTicks, firstConfigurations ++ tailConfigurations, ?_,
            completeSampled, ?_, terminalCoherent, ?_, ?_⟩
          · simpa [environment, totalDepth, nextDepth, afterParents,
              nextParents, finalRegisters, carrier] using completeChain
          · simp only [List.length_append]
            rw [firstLength, tailLength]
            have finalPhaseEq : finalRegisters.phase = registers.phase :=
              scannedCoherent.phase_eq.trans coherent.phase_eq.symm
            calc
              (1 + LocalResponse.completedCost program
                    (dispatcher.route (finalRegisters.phase, bit))
                    (finalRegisters.phase, bit)) +
                  nonemptySweepCost program dispatcher nonemptyCount
                    ⟨CTS.nextPhase program phase,
                      nextBit :: nextSuffix⟩ =
                  CheckedTransition.totalCost program dispatcher phase
                      (bit :: suffix) +
                    nonemptySweepCost program dispatcher nonemptyCount
                      ⟨CTS.nextPhase program phase,
                        nextBit :: nextSuffix⟩ := by
                rw [finalPhaseEq, coherent.phase_eq,
                  CheckedTransition.totalCost_cons, dataEq,
                  CheckedTransition.markerCost_cons, Nat.add_zero]
              _ = CheckedTransition.totalCost program dispatcher phase
                      (bit :: suffix) +
                    nonemptySweepCost program dispatcher nonemptyCount
                      (CTS.absorbingStep program
                        ⟨phase, bit :: suffix⟩) := by
                rw [stepEq]
              _ = nonemptySweepCost program dispatcher (nonemptyCount + 1)
                    ⟨phase, bit :: suffix⟩ :=
                (nonemptySweepCost_succ program dispatcher nonemptyCount
                  ⟨phase, bit :: suffix⟩).symm
          · simpa [nextParents, nextDepth, environment] using terminalTrace
          · have iterateEq :
                CTS.iterate program (nonemptyCount + 1)
                    ⟨phase, bit :: suffix⟩ =
                  CTS.iterate program nonemptyCount
                    ⟨CTS.nextPhase program phase,
                      nextBit :: nextSuffix⟩ := by
              rw [CTS.iterate_add]
              change CTS.iterate program nonemptyCount
                  (CTS.absorbingStep program ⟨phase, bit :: suffix⟩) = _
              rw [stepEq]
            exact terminalEq.trans iterateEq.symm

/-! ## Absorbing suffix without charging the next-job launch -/

/-- From an entered EMPTY frame, execute the remaining absorbing transitions
and stop at the literal arity-three continuation check.  In contrast with
`nonterminalEmptySweepSegmentAt`, this theorem does not include the next
job-source contraction, so its length is exactly the remaining checked-
transition cost of the current job. -/
theorem nonterminalEmptySweepToCheckAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (sampleIndex offset jobs count : Nat)
    (registers : Registers program) (carrier : Term)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers)
    {phase : CTS.Phase program}
    (coherent : RegistersCoherent registers phase [] true)
    (snapshotInv :
      let environment :=
        environmentCode (compileActions program dispatcher.tree) bits
      let continuation :=
        Dovetail.clockExit (offset + 1) (jobs + 1) environment
      ReachableAudit.Holds program dispatcher.tree bits continuation carrier) :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    let continuation :=
      Dovetail.clockExit (offset + 1) (jobs + 1) environment
    let finalRegisters :=
      SchedulerCycle.emptySweepRegisters program count registers
    let finalCarrier :=
      SchedulerCycle.emptySweepCarrier program dispatcher bits continuation
        count registers carrier
    let nextParents :=
      SchedulerRootContinuation.emptyContinuationParents program dispatcher
        finalRegisters bits finalCarrier outerParents
    ∃ configurations : List (SchedulerInvariant.Configuration program dispatcher),
      SchedulerResponseInvariant.ExactMutationChain
        (SchedulerControl.machine program dispatcher)
        (SchedulerContinuation.checkConfiguration program dispatcher
          finalRegisters.advanceEmpty
          (SchedulerEmpty.continuationCursor program dispatcher finalRegisters
            bits continuation finalCarrier outerParents))
        (SchedulerEmpty.frameConfiguration program dispatcher registers bits
          continuation carrier
          (PrimitiveFuel.pendingParents environment continuation count
            outerParents)) configurations ∧
      IndexedResponseSampledStates program dispatcher bits sampleIndex
        configurations ∧
      configurations.length =
        SchedulerRootContinuation.emptyCleanupMutations program dispatcher count
          registers ∧
      CompletedParents program dispatcher nextParents (layers + 1) := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let continuation :=
    Dovetail.clockExit (offset + 1) (jobs + 1) environment
  let finalRegisters :=
    SchedulerCycle.emptySweepRegisters program count registers
  let finalCarrier :=
    SchedulerCycle.emptySweepCarrier program dispatcher bits continuation count
      registers carrier
  let nextParents :=
    SchedulerRootContinuation.emptyContinuationParents program dispatcher
      finalRegisters bits finalCarrier outerParents
  obtain ⟨sweepConfigurations, sweepChain, sweepSampled, sweepLength⟩ :=
    pendingEmptySweepSegment program dispatcher bits bits continuation
      outerParents layers outer count sampleIndex registers carrier phase coherent
      snapshotInv
  have finalCoherent : RegistersCoherent finalRegisters
      (SchedulerNestedEmpty.emptySweepPhase program count phase) [] true :=
    emptySweepRegisters_coherent program count registers phase coherent
  have finalAudit : ReachableAudit.Holds program dispatcher.tree bits
      continuation finalCarrier :=
    emptySweepCarrier_holds program dispatcher bits continuation count registers
      carrier snapshotInv
  have failure : CheckpointExclusion.EndpointFailure program dispatcher.tree
      continuation :=
    SchedulerNestedResponse.ResponseSamplePairs.nonterminalClockExit_failure
      program dispatcher (offset + 1) jobs environment
  obtain ⟨terminalConfigurations, terminalChain, terminalSampled,
      terminalLength⟩ :=
    nonterminalEmptyFrameSegment program dispatcher bits finalRegisters bits
      continuation finalCarrier (sampleIndex + sweepConfigurations.length)
      outerParents layers outer finalCoherent finalAudit
      (Dovetail.clockExit_admissible (offset + 1) (jobs + 1) environment)
      failure
  have pendingReject : SchedulerControl.compiledProbeAnswer program dispatcher
      (.pending .emptyReturn)
      (SchedulerEmpty.markedCursor program dispatcher finalRegisters bits
        continuation finalCarrier outerParents) = false := by
    simpa [SchedulerEmpty.markedCursor, SchedulerResponse.markedCursor] using
      outer.pendingReject .emptyReturn
        (LocalResponse.markedCompleted bits continuation finalCarrier
          (SchedulerResponse.completedRoute program dispatcher finalRegisters
            false finalCarrier))
  have handoffRun := SchedulerEmpty.terminalContinuation_zeroRun program
    dispatcher finalRegisters bits continuation finalCarrier outerParents
    pendingReject
  have handoffChain : SchedulerResponseInvariant.ExactMutationChain
      (SchedulerControl.machine program dispatcher)
      (SchedulerContinuation.checkConfiguration program dispatcher
        finalRegisters.advanceEmpty
        (SchedulerEmpty.continuationCursor program dispatcher finalRegisters
          bits continuation finalCarrier outerParents))
      (SchedulerEmpty.markedPendingConfiguration program dispatcher
        finalRegisters bits continuation finalCarrier outerParents) [] :=
    .done _ handoffRun
  have throughTerminal := SchedulerRecurrence.ExactMutationChain.append sweepChain
    terminalChain
  have completeChain := SchedulerRecurrence.ExactMutationChain.append
    throughTerminal handoffChain
  have completeSampled :=
    SchedulerNestedPhase.IndexedResponseSampledStates.append program dispatcher
      bits sweepSampled terminalSampled
  refine ⟨sweepConfigurations ++ terminalConfigurations, ?_,
    completeSampled, ?_, ?_⟩
  · simpa [finalRegisters, finalCarrier, continuation, environment] using
      completeChain
  · simp only [List.length_append]
    rw [sweepLength, terminalLength]
    simp [SchedulerRootContinuation.emptyCleanupMutations, finalRegisters,
      Nat.add_assoc]
  · simpa [nextParents] using!
      outer.empty finalRegisters bits finalCarrier

/-! ## Certificate-free normal-marker terminal data -/

/-- Endpoint-local parser and completed-zipper facts for a normal response
whose successor is empty and whose normal marker is the terminal checkpoint. -/
def MarkedTerminalData
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (seedBits : List Bool) (horizon : Nat)
    (checkpoint : SchedulerInvariant.Configuration program dispatcher)
    (nextParents : List ParentFrame) (layers : Nat) : Prop :=
  ∃ (result : CheckpointDecoder.PositiveView program)
    (shape : CheckpointExclusion.TerminalCheckpointShape program
      dispatcher.tree .marked result checkpoint.cursor.erase),
    shape.chain.layers = layers ∧
    shape.chain.terminal = CheckpointRun.terminalView horizon seedBits ∧
    result.queue = [] ∧
    (CTS.iterate program horizon (CTS.initial program seedBits)).data = [] ∧
    CompletedParents program dispatcher nextParents layers

namespace MarkedTerminalData

/-- Terminal data transports along equality of the public erased checkpoint
term, which lets raw mutation traces name their literal final sample. -/
theorem of_checkpointErase
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {seedBits : List Bool} {horizon : Nat}
    {checkpoint replacement : SchedulerInvariant.Configuration program dispatcher}
    {nextParents : List ParentFrame} {layers : Nat}
    (data : MarkedTerminalData program dispatcher seedBits horizon checkpoint
      nextParents layers)
    (eraseEq : replacement.cursor.erase = checkpoint.cursor.erase) :
    MarkedTerminalData program dispatcher seedBits horizon replacement
      nextParents layers := by
  obtain ⟨result, shape, chainLayers, terminal, queue, outputEmpty,
      completed⟩ := data
  let replacementShape : CheckpointExclusion.TerminalCheckpointShape program
      dispatcher.tree .marked result replacement.cursor.erase :=
    { chain := shape.chain
      chainShape := by
        rw [eraseEq]
        exact shape.chainShape
      phase := shape.phase
      carrier := shape.carrier
      marker := shape.marker
      result_eq := shape.result_eq
      status_eq := shape.status_eq }
  exact ⟨result, replacementShape, chainLayers, terminal, queue, outputEmpty,
    completed⟩

end MarkedTerminalData

/-- Package the certificate-free terminal shape already determined by a final
EMPTY carrier into the uniform marked-terminal interface. -/
theorem emptyMarkedTerminalDataAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (offset : Nat) (registers : Registers program)
    (carrier : Term) (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers)
    (carrierDecode :
      let environment :=
        environmentCode (compileActions program dispatcher.tree) bits
      let continuation := Dovetail.clockExit (offset + 1) 0 environment
      CarrierDecoder.decode? program dispatcher.tree bits continuation
        (Dovetail.clockExit_admissible (offset + 1) 0 environment) carrier =
        some [])
    (phaseEq : registers.phase =
      CheckpointDecoder.expectedPhase program (offset + 1))
    (horizonEmpty :
      (CTS.iterate program (offset + 1)
        (CTS.initial program bits)).data = []) :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    let continuation := Dovetail.clockExit (offset + 1) 0 environment
    let checkpoint :=
      SchedulerRootContinuation.emptyMarkerMutationConfiguration program
        dispatcher registers bits continuation carrier outerParents
    let nextParents :=
      SchedulerRootContinuation.emptyContinuationParents program dispatcher
        registers bits carrier outerParents
    MarkedTerminalData program dispatcher bits (offset + 1) checkpoint
      nextParents (layers + 1) := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let continuation := Dovetail.clockExit (offset + 1) 0 environment
  let checkpoint :=
    SchedulerRootContinuation.emptyMarkerMutationConfiguration program
      dispatcher registers bits continuation carrier outerParents
  let nextParents :=
    SchedulerRootContinuation.emptyContinuationParents program dispatcher
      registers bits carrier outerParents
  let shapes := SchedulerNestedEmpty.terminalEmptyRawShapesAt program dispatcher
    bits offset registers carrier outerParents layers outer carrierDecode phaseEq
  let result := shapes.2.1
  let shape := shapes.2.2
  refine ⟨result, shape, ?_, ?_, ?_, horizonEmpty, ?_⟩
  · simp [shape, shapes, SchedulerNestedEmpty.terminalEmptyRawShapesAt,
      SchedulerNestedEmpty.wrapCompletedPrefix,
      SchedulerRootContinuation.markedRootTerminalShape,
      CheckpointRun.addLayers, Nat.add_comm, id]
  · simp [shape, shapes, SchedulerNestedEmpty.terminalEmptyRawShapesAt,
      SchedulerNestedEmpty.wrapCompletedPrefix,
      SchedulerRootContinuation.markedRootTerminalShape,
      CheckpointRun.addLayers, CheckpointRun.terminalView]
  · simp [result, shapes, SchedulerNestedEmpty.terminalEmptyRawShapesAt]
  · simpa [nextParents] using outer.empty registers bits carrier

/-- Construct both the rejected fresh pre-marker shape and the accepted marked
terminal shape directly from the current CTS iterate.  No global run
certificate is used. -/
theorem selectedMarkedTerminalShapesAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (seedBits : List Bool) (offset : Nat)
    (registers : Registers program) (phase : CTS.Phase program)
    (coherent : RegistersCoherent registers phase [] false)
    (bit : Bool) (suffix : List Bool)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers)
    {source : Term}
    {outerContext fullContext innerContext targetContext : Context}
    {ticks : Nat}
    (trace : SelectedResponseTrace program dispatcher seedBits
      (Dovetail.clockExit (offset + 1) 0
        (environmentCode (compileActions program dispatcher.tree) seedBits))
      source
      (Dovetail.clockExit_admissible (offset + 1) 0
        (environmentCode (compileActions program dispatcher.tree) seedBits))
      registers bit suffix outerContext fullContext innerContext targetContext
      outerParents ticks)
    (currentEq : ⟨phase, bit :: suffix⟩ =
      CTS.iterate program offset (CTS.initial program seedBits))
    (dataEq :
      (CTS.absorbingStep program ⟨registers.phase, bit :: suffix⟩).data = []) :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) seedBits
    let continuation := Dovetail.clockExit (offset + 1) 0 environment
    let carrier := deletedCarrier bit outerContext innerContext
    let finalRegisters := scannedRegisters registers bit suffix
    let freshTerm := LocalResponse.completed seedBits continuation carrier
      (SchedulerResponse.completedRoute program dispatcher finalRegisters bit
        carrier)
    let checkpoint :=
      SchedulerRootContinuation.normalMarkerMutationConfiguration program
        dispatcher finalRegisters bit seedBits continuation carrier outerParents
    let nextParents :=
      SchedulerRootContinuation.markedContinuationParents program dispatcher
        finalRegisters bit seedBits carrier outerParents
    ∃ _preMarker : CheckpointExclusion.PreMarkerEmptyShape program
        dispatcher.tree (Cursor.rebuild outerParents freshTerm),
      MarkedTerminalData program dispatcher seedBits (offset + 1) checkpoint
        nextParents (layers + 1) := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) seedBits
  let continuation := Dovetail.clockExit (offset + 1) 0 environment
  let carrier := deletedCarrier bit outerContext innerContext
  let finalRegisters := scannedRegisters registers bit suffix
  let route := dispatcher.route (finalRegisters.phase, bit)
  let label : ActionLabel program := (finalRegisters.phase, bit)
  let accumulator := actionAccumulator program label carrier
  let dispatcherTerm :=
    SchedulerResponse.completedRoute program dispatcher finalRegisters bit
      carrier
  let terminal := CheckpointRun.terminalView (offset + 1) seedBits
  let freshView := CheckpointDecoder.completedView program route label accumulator
    seedBits continuation
  let freshChain : CheckpointDecoder.ChainView program :=
    ⟨1, terminal, freshView⟩
  let freshTerm :=
    LocalResponse.completed seedBits continuation carrier dispatcherTerm
  let markedTerm :=
    LocalResponse.markedCompleted seedBits continuation carrier dispatcherTerm
  let checkpoint :=
    SchedulerRootContinuation.normalMarkerMutationConfiguration program
      dispatcher finalRegisters bit seedBits continuation carrier outerParents
  let nextParents :=
    SchedulerRootContinuation.markedContinuationParents program dispatcher
      finalRegisters bit seedBits carrier outerParents
  have terminalShape : CheckpointDecoder.ChainShape program dispatcher.tree
      continuation (.terminal terminal) := by
    apply CheckpointDecoder.ChainShape.terminal terminal
    · exact CheckpointDecoder.parseLocal?_terminal_none program dispatcher.tree
        (offset + 1) environment
    · simpa [continuation, terminal, environment] using!
        (CheckpointDecoder.parseTerminal?_clockExit
          (compileActions program dispatcher.tree) (word seedBits) offset)
  have dispatch := SchedulerResponse.completedRoute_snapshotDispatch program
    dispatcher finalRegisters bit carrier
  have freshLocalShape : CheckpointDecoder.ChainShape program dispatcher.tree
      freshTerm (.completed freshChain) := by
    simpa [freshTerm, freshChain, freshView, route, label, accumulator,
      dispatcherTerm] using
      (CheckpointDecoder.ChainShape.prepend_response_terminal seedBits dispatch
        terminalShape)
  let fullFreshChain := CheckpointRun.addLayers layers freshChain
  have freshFullShape : CheckpointDecoder.ChainShape program dispatcher.tree
      (Cursor.rebuild outerParents freshTerm) (.completed fullFreshChain) := by
    exact SchedulerNestedEmpty.wrapCompletedPrefix (outer.prefix freshTerm)
      freshLocalShape
  have finalCoherent : RegistersCoherent finalRegisters phase (bit :: suffix)
      false :=
    scannedRegisters_coherentAt program registers phase coherent bit suffix
  have finalPhase : finalRegisters.phase = phase := finalCoherent.phase_eq
  have dataEqFinal :
      (CTS.absorbingStep program
        ⟨finalRegisters.phase, bit :: suffix⟩).data = [] := by
    rw [finalPhase, ← coherent.phase_eq]
    exact dataEq
  have accumulatorDecode : CarrierDecoder.decode? program dispatcher.tree
      seedBits continuation
      (Dovetail.clockExit_admissible (offset + 1) 0 environment) accumulator =
        some [] := by
    have decoded := CarrierActionDecode.decode_actionAccumulator_eq_CTS program
      dispatcher.tree seedBits continuation
      (Dovetail.clockExit_admissible (offset + 1) 0 environment)
      finalRegisters.phase bit trace.targetDecode
    rw [dataEqFinal] at decoded
    simpa [accumulator, label, carrier] using decoded
  have publicDecode : CheckpointDecoder.decodeCarrier? program dispatcher.tree
      accumulator = some [] :=
    CheckpointRun.decodeCarrier?_of_decode program dispatcher.tree seedBits
      continuation
      (Dovetail.clockExit_admissible (offset + 1) 0 environment)
      accumulatorDecode
  have accumulatorShape : CheckpointDecoder.CarrierDecodes program
      dispatcher.tree accumulator [] :=
    CheckpointDecoder.decodeCarrier?_sound program dispatcher.tree publicDecode
  have preMarker : CheckpointExclusion.PreMarkerEmptyShape program
      dispatcher.tree (Cursor.rebuild outerParents freshTerm) :=
    { chain := fullFreshChain
      chainShape := freshFullShape
      fresh := by
        simp [fullFreshChain, CheckpointRun.addLayers, freshChain, freshView,
          CheckpointDecoder.completedView]
      empty := by
        simpa [fullFreshChain, CheckpointRun.addLayers, freshChain, freshView]
          using! accumulatorShape }
  have phaseShape : label.1 =
      CheckpointDecoder.expectedPhase program terminal.horizon := by
    have currentPhase : phase =
        (CTS.iterate program offset
          (CTS.initial program seedBits)).phase :=
      congrArg CTS.Config.phase currentEq
    have expected :=
      CheckpointRun.iterate_phase_eq_expectedPhase program seedBits offset
    simpa [label, terminal, finalPhase] using! currentPhase.trans expected
  let rootResult : CheckpointDecoder.PositiveView program :=
    ⟨offset + 1, route, label, []⟩
  let rootTerminal : CheckpointExclusion.TerminalCheckpointShape program
      dispatcher.tree .marked rootResult markedTerm := by
    simpa [rootResult, markedTerm, dispatcherTerm] using!
      (SchedulerRootContinuation.markedRootTerminalShape seedBits dispatch
        terminalShape phaseShape accumulatorShape)
  let fullMarkedChain := CheckpointRun.addLayers layers rootTerminal.chain
  have fullMarkedShape : CheckpointDecoder.ChainShape program dispatcher.tree
      (Cursor.rebuild outerParents markedTerm) (.completed fullMarkedChain) := by
    exact SchedulerNestedEmpty.wrapCompletedPrefix (outer.prefix markedTerm)
      rootTerminal.chainShape
  let shape : CheckpointExclusion.TerminalCheckpointShape program
      dispatcher.tree .marked rootResult checkpoint.cursor.erase :=
    { chain := fullMarkedChain
      chainShape := by
        have eraseEq : checkpoint.cursor.erase =
            Cursor.rebuild outerParents markedTerm := by
          simpa [checkpoint, markedTerm, dispatcherTerm] using!
            (SchedulerRootContinuation.normalMarkerMutation_erase program
              dispatcher finalRegisters bit seedBits continuation carrier
              outerParents)
        rw [eraseEq]
        exact fullMarkedShape
      phase := by
        simpa [fullMarkedChain, CheckpointRun.addLayers] using rootTerminal.phase
      carrier := by
        simpa [fullMarkedChain, CheckpointRun.addLayers] using
          rootTerminal.carrier
      marker := by
        simpa [fullMarkedChain, CheckpointRun.addLayers] using rootTerminal.marker
      result_eq := by
        simpa [fullMarkedChain, CheckpointRun.addLayers] using
          rootTerminal.result_eq
      status_eq := by
        simpa [fullMarkedChain, CheckpointRun.addLayers] using
          rootTerminal.status_eq }
  have horizonEmpty :
      (CTS.iterate program (offset + 1)
        (CTS.initial program seedBits)).data = [] := by
    rw [CTS.iterate_succ]
    rw [← currentEq]
    rw [← coherent.phase_eq]
    exact dataEq
  refine ⟨preMarker, rootResult, shape, ?_, ?_, rfl, horizonEmpty, ?_⟩
  · simp [shape, fullMarkedChain, rootTerminal,
      SchedulerRootContinuation.markedRootTerminalShape,
      CheckpointRun.addLayers, Nat.add_comm, id]
  · simp [shape, fullMarkedChain, rootTerminal,
      SchedulerRootContinuation.markedRootTerminalShape,
      CheckpointRun.addLayers, terminal, id]
  · simpa [nextParents] using
      outer.marked finalRegisters bit seedBits carrier

/-- Raw terminal response for the edge case in which the first empty successor
is the job horizon itself.  All samples before the normal marker are already
classified; the callback classifies the literal final marker only after the
enclosing exact chain has produced its positive-prefix certificate. -/
theorem selectedMarkedTerminalRawSegmentAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits seedBits : List Bool) (offset sampleIndex : Nat)
    (registers : Registers program) (phase : CTS.Phase program)
    (coherent : RegistersCoherent registers phase [] false)
    (bit : Bool) (suffix : List Bool)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers)
    {source : Term}
    {outerContext fullContext innerContext targetContext : Context}
    {ticks : Nat}
    (trace : SelectedResponseTrace program dispatcher seedBits
      (Dovetail.clockExit (offset + 1) 0
        (environmentCode (compileActions program dispatcher.tree) seedBits))
      source
      (Dovetail.clockExit_admissible (offset + 1) 0
        (environmentCode (compileActions program dispatcher.tree) seedBits))
      registers bit suffix outerContext fullContext innerContext targetContext
      outerParents ticks)
    (dataEq :
      (CTS.absorbingStep program ⟨registers.phase, bit :: suffix⟩).data = [])
    (preMarker : CheckpointExclusion.PreMarkerEmptyShape program
      dispatcher.tree
      (Cursor.rebuild outerParents
        (LocalResponse.completed seedBits
          (Dovetail.clockExit (offset + 1) 0
            (environmentCode (compileActions program dispatcher.tree) seedBits))
          (deletedCarrier bit outerContext innerContext)
          (SchedulerResponse.completedRoute program dispatcher
            (scannedRegisters registers bit suffix) bit
            (deletedCarrier bit outerContext innerContext)))))
    (terminalData :
      let environment :=
        environmentCode (compileActions program dispatcher.tree) seedBits
      let continuation := Dovetail.clockExit (offset + 1) 0 environment
      let carrier := deletedCarrier bit outerContext innerContext
      let finalRegisters := scannedRegisters registers bit suffix
      let checkpoint :=
        SchedulerRootContinuation.normalMarkerMutationConfiguration program
          dispatcher finalRegisters bit seedBits continuation carrier
          outerParents
      let nextParents :=
        SchedulerRootContinuation.markedContinuationParents program dispatcher
          finalRegisters bit seedBits carrier outerParents
      MarkedTerminalData program dispatcher seedBits (offset + 1) checkpoint
        nextParents (layers + 1)) :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) seedBits
    let continuation := Dovetail.clockExit (offset + 1) 0 environment
    let carrier := deletedCarrier bit outerContext innerContext
    let finalRegisters := scannedRegisters registers bit suffix
    let checkpoint :=
      SchedulerRootContinuation.normalMarkerMutationConfiguration program
        dispatcher finalRegisters bit seedBits continuation carrier outerParents
    let nextParents :=
      SchedulerRootContinuation.markedContinuationParents program dispatcher
        finalRegisters bit seedBits carrier outerParents
    ∃ leading configurations,
      SchedulerResponseInvariant.ExactMutationChain
        (SchedulerControl.machine program dispatcher)
        (SchedulerRootContinuation.markedNextStageSourceConfiguration program
          dispatcher finalRegisters bit seedBits (offset + 1) environment carrier
          outerParents)
        (upConfiguration program dispatcher registers omega
          (ContextCursor.frames fullContext omega
            (.right (SchedulerResponse.pendingFunction program dispatcher
              seedBits continuation) :: outerParents))) configurations ∧
      configurations = leading ++ [checkpoint] ∧
      IndexedResponseSampledStates program dispatcher inputBits sampleIndex
        leading ∧
      configurations.length =
        CheckedTransition.totalCost program dispatcher phase (bit :: suffix) ∧
      SchedulerTraceAlgebra.LastSample configurations checkpoint ∧
      MarkedTerminalData program dispatcher seedBits (offset + 1) checkpoint
        nextParents (layers + 1) ∧
      (∀ {activeContext : Context}
          {checkpointChain : CheckpointDecoder.ChainView program},
        CheckpointRun.PositivePrefix program dispatcher inputBits (offset + 1)
            checkpoint.cursor.erase
            (ExactCheckpointRun.checkpointTime program dispatcher inputBits
              (offset + 1)) activeContext checkpointChain →
        sampleIndex + configurations.length =
            ExactCheckpointRun.checkpointTime program dispatcher inputBits
              (offset + 1) →
        IndexedResponseSampledStates program dispatcher inputBits sampleIndex
          configurations) := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) seedBits
  let continuation := Dovetail.clockExit (offset + 1) 0 environment
  let carrier := deletedCarrier bit outerContext innerContext
  let finalRegisters := scannedRegisters registers bit suffix
  let checkpoint :=
    SchedulerRootContinuation.normalMarkerMutationConfiguration program
      dispatcher finalRegisters bit seedBits continuation carrier outerParents
  let nextParents :=
    SchedulerRootContinuation.markedContinuationParents program dispatcher
      finalRegisters bit seedBits carrier outerParents
  have notSeen : registers.seen = false := by
    simpa using! coherent.seen_eq
  have noTail : registers.tail = false := by
    simpa using! coherent.tail_eq
  have bitEq : finalRegisters.bit = some bit := by
    simpa [finalRegisters] using
      scannedRegisters_bit registers bit suffix notSeen
  have finalCoherent : RegistersCoherent finalRegisters phase (bit :: suffix)
      false :=
    scannedRegisters_coherentAt program registers phase coherent bit suffix
  have pendingReject : SchedulerControl.compiledProbeAnswer program dispatcher
      (.pending .normalReturn)
      (SchedulerResponse.markedCursor program dispatcher finalRegisters bit
        seedBits continuation carrier outerParents) = false := by
    simpa [SchedulerResponse.markedCursor] using
      outer.pendingReject .normalReturn
        (LocalResponse.markedCompleted seedBits continuation carrier
          (SchedulerResponse.completedRoute program dispatcher finalRegisters bit
            carrier))
  obtain ⟨responseConfigurations, responseChain, responseSampled,
      responseLength⟩ :=
    preMarkerResponseSegmentAt program dispatcher inputBits finalRegisters bit
      seedBits continuation carrier (sampleIndex + 1) outerParents layers outer
      bitEq finalCoherent
      (Dovetail.clockExit_admissible (offset + 1) 0 environment)
      trace.targetHolds (by
        simpa [continuation, carrier, finalRegisters] using! preMarker)
  have responseChain' : SchedulerResponseInvariant.ExactMutationChain
      (SchedulerControl.machine program dispatcher)
      (selectedReturnConfiguration program dispatcher registers bit suffix
        seedBits continuation carrier outerParents)
      (selectedFrameConfiguration program dispatcher registers bit suffix
        seedBits continuation carrier outerParents) responseConfigurations := by
    simpa [selectedReturnConfiguration, selectedFrameConfiguration,
      finalRegisters, carrier, continuation] using responseChain
  obtain ⟨leading, beforeChain, leadingSampled, leadingLength⟩ :=
    selectedSegmentOfResponseAt program dispatcher inputBits seedBits
      continuation source
      (Dovetail.clockExit_admissible (offset + 1) 0 environment)
      registers phase coherent bit suffix 0 sampleIndex outerParents layers outer
      trace responseConfigurations responseChain' responseSampled
  have outputEq : SchedulerControl.outputEmpty program finalRegisters bit =
      true := by
    have exactOutput := outputEmpty_scannedRegisters program registers bit suffix
      notSeen noTail
    rw [dataEq] at exactOutput
    simpa [finalRegisters] using exactOutput
  have markerChain : SchedulerResponseInvariant.ExactMutationChain
      (SchedulerControl.machine program dispatcher)
      (SchedulerRootContinuation.markedNextStageSourceConfiguration program
        dispatcher finalRegisters bit seedBits (offset + 1) environment carrier
        outerParents)
      (selectedReturnConfiguration program dispatcher registers bit suffix
        seedBits continuation carrier outerParents) [checkpoint] := by
    simpa [selectedReturnConfiguration, finalRegisters, continuation, carrier,
      checkpoint] using
      (SchedulerRootContinuation.markedReturn_exactMutationChain program
        dispatcher finalRegisters bit seedBits (offset + 1) environment carrier
        outerParents bitEq outputEq pendingReject)
  have completeChain := SchedulerRecurrence.ExactMutationChain.append beforeChain
    markerChain
  let configurations := leading ++ [checkpoint]
  have lengthEq : configurations.length =
      CheckedTransition.totalCost program dispatcher phase (bit :: suffix) := by
    simp only [configurations, List.length_append, List.length_singleton]
    rw [leadingLength, responseLength]
    have dataEqPhase :
        (CTS.absorbingStep program ⟨phase, bit :: suffix⟩).data = [] := by
      rw [← coherent.phase_eq]
      exact dataEq
    rw [CheckedTransition.totalCost_cons, dataEqPhase,
      CheckedTransition.markerCost_empty]
    rw [show (scannedRegisters registers bit suffix).phase = phase by
      exact finalCoherent.phase_eq]
    simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
  refine ⟨leading, configurations, ?_, rfl, leadingSampled, lengthEq,
    SchedulerTraceAlgebra.LastSample.appendLeft leading (.one checkpoint),
    terminalData, ?_⟩
  · simpa [configurations, continuation, environment, carrier,
      finalRegisters, checkpoint] using! completeChain
  · intro activeContext checkpointChain certificate indexEq
    obtain ⟨result, shape, chainLayers, terminalEq, queueEq, outputEmpty,
        completed⟩ := terminalData
    have markerHolds : Holds program dispatcher checkpoint := by
      simpa [checkpoint, continuation, carrier, finalRegisters] using
        (SchedulerRootContinuation.normalMarker_holds program dispatcher
          finalRegisters bit seedBits continuation carrier outerParents
          finalCoherent trace.targetHolds shape)
    have markerIndex : sampleIndex + leading.length + 1 =
        ExactCheckpointRun.checkpointTime program dispatcher inputBits
          (offset + 1) := by
      simpa [configurations, List.length_append, Nat.add_assoc] using indexEq
    have markerSample : SampledState program dispatcher inputBits
        (sampleIndex + leading.length + 1) checkpoint := by
      simpa [checkpoint, continuation, carrier, finalRegisters] using
        (SchedulerRootContinuation.normalMarker_sampledState program dispatcher
          inputBits (sampleIndex + leading.length + 1) offset finalRegisters bit
          seedBits continuation carrier outerParents markerHolds certificate
          markerIndex)
    have fullSampled :=
      SchedulerRecurrence.IndexedResponseSampledStates.appendOne program
        dispatcher inputBits leadingSampled checkpoint markerSample
    simpa [configurations] using fullSampled

/-! ## Complete mixed first-empty jobs -/

/-- A nonfinal bounded job with a nonempty seed and a named first empty
successor.  `previous` is the last nonempty iterate and `remaining` is the
number of absorbing transitions after the first empty iterate.  The theorem
ends at literal CHECK and therefore charges no contraction from the next
job's launch block. -/
theorem completeFirstEmptyJobAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (previous remaining jobs sampleIndex : Nat)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers)
    (priorNonempty : ∀ k, k ≤ previous →
      (CTS.iterate program k
        (CTS.initial program (bit :: suffix))).data ≠ [])
    (firstEmpty :
      (CTS.iterate program (previous + 1)
        (CTS.initial program (bit :: suffix))).data = []) :
    let bits := bit :: suffix
    let fuel := previous + remaining + 1
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    let continuation := Dovetail.clockExit fuel (jobs + 1) environment
    ∃ nextParents checkRegisters configurations,
      SchedulerResponseInvariant.ExactMutationChain
        (SchedulerControl.machine program dispatcher)
        (SchedulerContinuation.checkConfiguration program dispatcher
          checkRegisters ⟨continuation, nextParents⟩)
        (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher
          bits (Registers.newJob program) continuation outerParents fuel 0)
        configurations ∧
      IndexedResponseSampledStates program dispatcher bits sampleIndex
        configurations ∧
      configurations.length =
        ExactCheckpointRun.jobCost program dispatcher bits fuel ∧
      CompletedParents program dispatcher nextParents (layers + 1) ∧
      (SchedulerContinuation.checkConfiguration program dispatcher
        checkRegisters ⟨continuation, nextParents⟩).cursor.erase =
          Cursor.rebuild nextParents continuation ∧
      continuation.headArity = 3 := by
  let bits := bit :: suffix
  let fuel := previous + remaining + 1
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let continuation := Dovetail.clockExit fuel (jobs + 1) environment
  let pendingDepth := previous + remaining
  obtain ⟨outerContext, fullContext, innerContext, targetContext,
      descentTicks, responseTicks, response, baseRun⟩ :=
    nonemptyBase_toSelected_zeroRunAt program dispatcher bit suffix continuation
      (Dovetail.clockExit_admissible fuel (jobs + 1) environment) pendingDepth
      outerParents
  have baseParentsSplit :
      PrimitiveFuel.pendingParents environment continuation (pendingDepth + 1)
          outerParents =
        .right (SchedulerResponse.pendingFunction program dispatcher bits
          continuation) ::
          PrimitiveFuel.pendingParents environment continuation pendingDepth
            outerParents := by
    simpa [environment, SchedulerResponse.pendingFunction,
      PendingFrame.environmentCode_eq_envelope, PendingFrame.frameFunction] using
      (SchedulerCycle.pendingParents_succ_cons environment continuation
        pendingDepth outerParents)
  have baseRun' : ZeroMutationRun
      (SchedulerControl.machine program dispatcher) descentTicks
      (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher bits
        (Registers.newJob program) continuation outerParents fuel 0)
      (upConfiguration program dispatcher
        (Registers.newJob program).clearScan omega
        (ContextCursor.frames fullContext omega
          (.right (SchedulerResponse.pendingFunction program dispatcher bits
            continuation) ::
            PrimitiveFuel.pendingParents environment continuation pendingDepth
              outerParents))) := by
    rw [← baseParentsSplit]
    simpa [bits, fuel, environment, continuation, pendingDepth, Nat.add_assoc]
      using baseRun
  have response' : SelectedResponseTrace program dispatcher bits continuation
      (baseCarrier environment continuation)
      (Dovetail.clockExit_admissible fuel (jobs + 1) environment)
      (Registers.newJob program).clearScan bit suffix outerContext fullContext
      innerContext targetContext
      (PrimitiveFuel.pendingParents environment continuation pendingDepth
        outerParents) responseTicks := by
    simpa [bits, fuel, environment, continuation, pendingDepth] using response
  have prefixNonempty : ∀ k, k ≤ previous →
      (CTS.iterate program k
        ⟨CTS.zeroPhase program, bit :: suffix⟩).data ≠ [] := by
    intro k bound
    simpa [bits, CTS.initial] using priorNonempty k bound
  obtain ⟨terminalRegisters, terminalPhase, terminalBit, terminalSuffix,
      terminalSource, terminalOuterContext, terminalFullContext,
      terminalInnerContext, terminalTargetContext, terminalTicks,
      prefixConfigurations, prefixChain, prefixSampled, prefixLength,
      terminalCoherent, terminalTrace, terminalEq⟩ :=
    selectedNonemptyPrefixKeepingPendingAt program dispatcher bits bits
      continuation (Dovetail.clockExit_admissible fuel (jobs + 1) environment)
      outerParents layers outer previous remaining sampleIndex
      (Registers.newJob program).clearScan (CTS.zeroPhase program) bit suffix
      (baseCarrier environment continuation) outerContext fullContext innerContext
      targetContext responseTicks (RegistersCoherent.initial program).clearScan
      (by simpa [pendingDepth, environment] using response') prefixNonempty
  have currentEq : ⟨terminalPhase, terminalBit :: terminalSuffix⟩ =
      CTS.iterate program previous (CTS.initial program bits) := by
    simpa [bits, CTS.initial] using terminalEq
  have stepEq : CTS.absorbingStep program
        ⟨terminalRegisters.phase, terminalBit :: terminalSuffix⟩ =
      CTS.iterate program (previous + 1) (CTS.initial program bits) := by
    calc
      CTS.absorbingStep program
            ⟨terminalRegisters.phase, terminalBit :: terminalSuffix⟩ =
          CTS.absorbingStep program
            ⟨terminalPhase, terminalBit :: terminalSuffix⟩ := by
              rw [terminalCoherent.phase_eq]
      _ = CTS.absorbingStep program
          (CTS.iterate program previous (CTS.initial program bits)) := by
            rw [← currentEq]
      _ = CTS.iterate program (previous + 1)
          (CTS.initial program bits) := by
            rw [CTS.iterate_succ]
  have terminalEmpty :
      (CTS.absorbingStep program
        ⟨terminalRegisters.phase,
          terminalBit :: terminalSuffix⟩).data = [] := by
    rw [stepEq]
    simpa [bits] using firstEmpty
  cases remaining with
  | zero =>
      have terminalTrace' : SelectedResponseTrace program dispatcher bits
          continuation terminalSource
          (Dovetail.clockExit_admissible fuel (jobs + 1) environment)
          terminalRegisters terminalBit terminalSuffix terminalOuterContext
          terminalFullContext terminalInnerContext terminalTargetContext
          outerParents terminalTicks := by
        simpa [PrimitiveFuel.pendingParents] using terminalTrace
      obtain ⟨terminalConfigurations, terminalChain, terminalSampled,
          terminalLength, terminalOuter⟩ :=
        selectedMarkedNonterminalJobAt program dispatcher bits bits fuel jobs
          environment terminalSource terminalRegisters terminalPhase
          terminalCoherent terminalBit terminalSuffix
          (sampleIndex + prefixConfigurations.length) outerParents layers outer
          terminalTrace' terminalEmpty
      let finalRegisters := scannedRegisters terminalRegisters terminalBit
        terminalSuffix
      let carrier := deletedCarrier terminalBit terminalOuterContext
        terminalInnerContext
      let nextParents :=
        SchedulerRootContinuation.markedContinuationParents program dispatcher
          finalRegisters terminalBit bits carrier outerParents
      let configurations := prefixConfigurations ++ terminalConfigurations
      have prefixAndTerminal := SchedulerRecurrence.ExactMutationChain.append
        prefixChain terminalChain
      have completeChain :=
        SchedulerResponseInvariant.ExactMutationChain.prepend baseRun'
          prefixAndTerminal
      have completeSampled :=
        SchedulerNestedPhase.IndexedResponseSampledStates.append program
          dispatcher bits prefixSampled (by simpa using terminalSampled)
      have terminalCost : terminalConfigurations.length =
          CheckedTransition.totalCost program dispatcher
            (CTS.iterate program previous
              (CTS.initial program bits)).phase
            (CTS.iterate program previous
              (CTS.initial program bits)).data := by
        rw [terminalLength, terminalCoherent.phase_eq]
        exact congrArg
          (fun current => CheckedTransition.totalCost program dispatcher
            current.phase current.data) currentEq
      have configurationsLength : configurations.length =
          ExactCheckpointRun.jobCost program dispatcher bits fuel := by
        simp only [configurations, List.length_append]
        have prefixCost : prefixConfigurations.length =
            nonemptySweepCost program dispatcher previous
              (CTS.initial program bits) := by
          simpa [bits, CTS.initial] using prefixLength
        rw [prefixCost, terminalCost]
        rw [← nonemptySweepCost_succ_last program dispatcher previous
          (CTS.initial program bits)]
        simpa [fuel] using
          (nonemptySweepCost_initial_eq_jobCost program dispatcher bits
            (previous + 1))
      refine ⟨nextParents, finalRegisters.advance, configurations, ?_,
        completeSampled, configurationsLength, ?_, rfl,
        Dovetail.headArity_clockExit_succ fuel jobs environment⟩
      · simpa [bits, fuel, environment, continuation, configurations,
          finalRegisters, carrier, nextParents,
          SchedulerResponse.markedContinuationCursor,
          SchedulerResponse.literalContinuationCursor] using! completeChain
      · simpa [nextParents, finalRegisters, carrier] using terminalOuter
  | succ emptyTail =>
      have terminalTrace' : SelectedResponseTrace program dispatcher bits
          continuation terminalSource
          (Dovetail.clockExit_admissible fuel (jobs + 1) environment)
          terminalRegisters terminalBit terminalSuffix terminalOuterContext
          terminalFullContext terminalInnerContext terminalTargetContext
          (PrimitiveFuel.pendingParents environment continuation (emptyTail + 1)
            outerParents) terminalTicks := by
        simpa [environment] using terminalTrace
      let finalRegisters := scannedRegisters terminalRegisters terminalBit
        terminalSuffix
      let carrier := deletedCarrier terminalBit terminalOuterContext
        terminalInnerContext
      let marked := LocalResponse.markedCompleted bits continuation carrier
        (SchedulerResponse.completedRoute program dispatcher finalRegisters
          terminalBit carrier)
      let emptyRegisters :=
        SchedulerCycle.enteredEmptyRegisters finalRegisters.advance
      obtain ⟨entryConfigurations, entryChain, entrySampled, entryLength,
          emptyCoherent, markedAudit, markedDecode⟩ :=
        selectedFirstEmptyEntryAt program dispatcher bits bits continuation
          terminalSource
          (Dovetail.clockExit_admissible fuel (jobs + 1) environment)
          terminalRegisters terminalPhase terminalCoherent terminalBit
          terminalSuffix emptyTail
          (sampleIndex + prefixConfigurations.length) outerParents layers outer
          terminalTrace' terminalEmpty
      let finalEmptyRegisters :=
        SchedulerCycle.emptySweepRegisters program emptyTail emptyRegisters
      let finalEmptyCarrier :=
        SchedulerCycle.emptySweepCarrier program dispatcher bits continuation
          emptyTail emptyRegisters marked
      let nextParents :=
        SchedulerRootContinuation.emptyContinuationParents program dispatcher
          finalEmptyRegisters bits finalEmptyCarrier outerParents
      obtain ⟨emptyConfigurations, emptyChain, emptySampled, emptyLength,
          emptyOuter⟩ :=
        nonterminalEmptySweepToCheckAt program dispatcher bits
          (sampleIndex + prefixConfigurations.length +
            entryConfigurations.length)
          (previous + emptyTail + 1) jobs emptyTail emptyRegisters marked
          outerParents layers outer emptyCoherent (by
            simpa [fuel, environment, continuation, Nat.add_assoc] using!
              markedAudit)
      let configurations :=
        prefixConfigurations ++ entryConfigurations ++ emptyConfigurations
      have prefixAndEntry := SchedulerRecurrence.ExactMutationChain.append
        prefixChain entryChain
      have throughEmpty := SchedulerRecurrence.ExactMutationChain.append
        prefixAndEntry emptyChain
      have completeChain :=
        SchedulerResponseInvariant.ExactMutationChain.prepend baseRun'
          throughEmpty
      have prefixAndEntrySampled :=
        SchedulerNestedPhase.IndexedResponseSampledStates.append program
          dispatcher bits prefixSampled entrySampled
      have completeSampled :=
        SchedulerNestedPhase.IndexedResponseSampledStates.append program
          dispatcher bits prefixAndEntrySampled (by
            simpa [List.length_append, Nat.add_assoc] using emptySampled)
      have emptyState :
          ⟨CTS.nextPhase program terminalPhase, []⟩ =
            CTS.iterate program (previous + 1)
              (CTS.initial program bits) := by
        cases stepValue : CTS.absorbingStep program
            ⟨terminalRegisters.phase,
              terminalBit :: terminalSuffix⟩ with
        | mk nextPhase output =>
            have nextPhaseEq : nextPhase =
                CTS.nextPhase program terminalRegisters.phase := by
              simpa [stepValue] using
                (CTS.absorbingStep_phase program
                  ⟨terminalRegisters.phase,
                    terminalBit :: terminalSuffix⟩)
            have outputEq : output = [] := by
              simpa [stepValue] using terminalEmpty
            subst nextPhase
            subst output
            have exactStep := stepValue.symm.trans stepEq
            simpa [terminalCoherent.phase_eq] using exactStep
      have emptyCost :
          SchedulerRootContinuation.emptyCleanupMutations program dispatcher
              emptyTail emptyRegisters =
            nonemptySweepCost program dispatcher (emptyTail + 1)
              (CTS.iterate program (previous + 1)
                (CTS.initial program bits)) := by
        calc
          SchedulerRootContinuation.emptyCleanupMutations program dispatcher
                emptyTail emptyRegisters =
              nonemptySweepCost program dispatcher (emptyTail + 1)
                ⟨CTS.nextPhase program terminalPhase, []⟩ :=
            emptyCleanupMutations_eq_nonemptySweepCost program dispatcher
              emptyTail emptyRegisters (CTS.nextPhase program terminalPhase)
              emptyCoherent
          _ = nonemptySweepCost program dispatcher (emptyTail + 1)
                (CTS.iterate program (previous + 1)
                  (CTS.initial program bits)) := by rw [emptyState]
      have entryCost : entryConfigurations.length =
          CheckedTransition.totalCost program dispatcher
            (CTS.iterate program previous
              (CTS.initial program bits)).phase
            (CTS.iterate program previous
              (CTS.initial program bits)).data := by
        rw [entryLength]
        exact congrArg
          (fun current => CheckedTransition.totalCost program dispatcher
            current.phase current.data) currentEq
      have configurationsLength : configurations.length =
          ExactCheckpointRun.jobCost program dispatcher bits fuel := by
        simp only [configurations, List.length_append]
        have prefixCost : prefixConfigurations.length =
            nonemptySweepCost program dispatcher previous
              (CTS.initial program bits) := by
          simpa [bits, CTS.initial] using prefixLength
        rw [prefixCost, entryCost, emptyLength, emptyCost]
        rw [← nonemptySweepCost_succ_last program dispatcher previous
          (CTS.initial program bits)]
        rw [← nonemptySweepCost_add program dispatcher (previous + 1)
          (CTS.initial program bits) (emptyTail + 1)]
        have totalEq : (previous + 1) + (emptyTail + 1) = fuel := by
          simp [fuel, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
        rw [totalEq]
        exact nonemptySweepCost_initial_eq_jobCost program dispatcher bits fuel
      refine ⟨nextParents, finalEmptyRegisters.advanceEmpty, configurations,
        ?_, completeSampled, configurationsLength, ?_, rfl,
        Dovetail.headArity_clockExit_succ fuel jobs environment⟩
      · simpa [bits, fuel, environment, continuation, configurations,
          finalRegisters, carrier, marked, emptyRegisters, finalEmptyRegisters,
          finalEmptyCarrier, nextParents] using! completeChain
      · simpa [nextParents, finalEmptyRegisters, finalEmptyCarrier] using!
          emptyOuter

/-- Certificate-free terminal bounded job for the mixed first-empty branch.
The exact list ends in its unique marked checkpoint (the normal marker when
emptiness first occurs at the horizon, otherwise the final EMPTY marker), and
the callback classifies that literal last sample after the enclosing prefix
supplies the positive certificate. -/
theorem completeFirstEmptyTerminalJobRawAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (previous remaining sampleIndex : Nat)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers)
    (priorNonempty : ∀ k, k ≤ previous →
      (CTS.iterate program k
        (CTS.initial program (bit :: suffix))).data ≠ [])
    (firstEmpty :
      (CTS.iterate program (previous + 1)
        (CTS.initial program (bit :: suffix))).data = []) :
    let bits := bit :: suffix
    let fuel := previous + remaining + 1
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    let continuation := Dovetail.clockExit fuel 0 environment
    ∃ nextParents leading checkpoint configurations,
      SchedulerResponseInvariant.ExactMutationChain
        (SchedulerControl.machine program dispatcher)
        (SchedulerRootContinuation.nextStageSourceConfiguration program
          dispatcher fuel environment nextParents)
        (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher
          bits (Registers.newJob program) continuation outerParents fuel 0)
        configurations ∧
      configurations = leading ++ [checkpoint] ∧
      configurations.length =
        ExactCheckpointRun.jobCost program dispatcher bits fuel ∧
      SchedulerTraceAlgebra.LastSample configurations checkpoint ∧
      MarkedTerminalData program dispatcher bits fuel checkpoint nextParents
        (layers + 1) ∧
      (∀ {activeContext : Context}
          {checkpointChain : CheckpointDecoder.ChainView program},
        CheckpointRun.PositivePrefix program dispatcher bits fuel
            checkpoint.cursor.erase
            (ExactCheckpointRun.checkpointTime program dispatcher bits fuel)
            activeContext checkpointChain →
        sampleIndex + configurations.length =
            ExactCheckpointRun.checkpointTime program dispatcher bits fuel →
        IndexedResponseSampledStates program dispatcher bits sampleIndex
          configurations) := by
  let bits := bit :: suffix
  let fuel := previous + remaining + 1
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let continuation := Dovetail.clockExit fuel 0 environment
  let pendingDepth := previous + remaining
  obtain ⟨outerContext, fullContext, innerContext, targetContext,
      descentTicks, responseTicks, response, baseRun⟩ :=
    nonemptyBase_toSelected_zeroRunAt program dispatcher bit suffix continuation
      (Dovetail.clockExit_admissible fuel 0 environment) pendingDepth outerParents
  have baseParentsSplit :
      PrimitiveFuel.pendingParents environment continuation (pendingDepth + 1)
          outerParents =
        .right (SchedulerResponse.pendingFunction program dispatcher bits
          continuation) ::
          PrimitiveFuel.pendingParents environment continuation pendingDepth
            outerParents := by
    simpa [environment, SchedulerResponse.pendingFunction,
      PendingFrame.environmentCode_eq_envelope, PendingFrame.frameFunction] using
      (SchedulerCycle.pendingParents_succ_cons environment continuation
        pendingDepth outerParents)
  have baseRun' : ZeroMutationRun
      (SchedulerControl.machine program dispatcher) descentTicks
      (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher bits
        (Registers.newJob program) continuation outerParents fuel 0)
      (upConfiguration program dispatcher
        (Registers.newJob program).clearScan omega
        (ContextCursor.frames fullContext omega
          (.right (SchedulerResponse.pendingFunction program dispatcher bits
            continuation) ::
            PrimitiveFuel.pendingParents environment continuation pendingDepth
              outerParents))) := by
    rw [← baseParentsSplit]
    simpa [bits, fuel, environment, continuation, pendingDepth, Nat.add_assoc]
      using baseRun
  have response' : SelectedResponseTrace program dispatcher bits continuation
      (baseCarrier environment continuation)
      (Dovetail.clockExit_admissible fuel 0 environment)
      (Registers.newJob program).clearScan bit suffix outerContext fullContext
      innerContext targetContext
      (PrimitiveFuel.pendingParents environment continuation pendingDepth
        outerParents) responseTicks := by
    simpa [bits, fuel, environment, continuation, pendingDepth] using response
  have prefixNonempty : ∀ k, k ≤ previous →
      (CTS.iterate program k
        ⟨CTS.zeroPhase program, bit :: suffix⟩).data ≠ [] := by
    intro k bound
    simpa [bits, CTS.initial] using priorNonempty k bound
  obtain ⟨terminalRegisters, terminalPhase, terminalBit, terminalSuffix,
      terminalSource, terminalOuterContext, terminalFullContext,
      terminalInnerContext, terminalTargetContext, terminalTicks,
      prefixConfigurations, prefixChain, prefixSampled, prefixLength,
      terminalCoherent, terminalTrace, terminalEq⟩ :=
    selectedNonemptyPrefixKeepingPendingAt program dispatcher bits bits
      continuation (Dovetail.clockExit_admissible fuel 0 environment)
      outerParents layers outer previous remaining sampleIndex
      (Registers.newJob program).clearScan (CTS.zeroPhase program) bit suffix
      (baseCarrier environment continuation) outerContext fullContext innerContext
      targetContext responseTicks (RegistersCoherent.initial program).clearScan
      (by simpa [pendingDepth, environment] using response') prefixNonempty
  have currentEq : ⟨terminalPhase, terminalBit :: terminalSuffix⟩ =
      CTS.iterate program previous (CTS.initial program bits) := by
    simpa [bits, CTS.initial] using terminalEq
  have stepEq : CTS.absorbingStep program
        ⟨terminalRegisters.phase, terminalBit :: terminalSuffix⟩ =
      CTS.iterate program (previous + 1) (CTS.initial program bits) := by
    calc
      CTS.absorbingStep program
            ⟨terminalRegisters.phase, terminalBit :: terminalSuffix⟩ =
          CTS.absorbingStep program
            ⟨terminalPhase, terminalBit :: terminalSuffix⟩ := by
              rw [terminalCoherent.phase_eq]
      _ = CTS.absorbingStep program
          (CTS.iterate program previous (CTS.initial program bits)) := by
            rw [← currentEq]
      _ = CTS.iterate program (previous + 1)
          (CTS.initial program bits) := by rw [CTS.iterate_succ]
  have terminalEmpty :
      (CTS.absorbingStep program
        ⟨terminalRegisters.phase,
          terminalBit :: terminalSuffix⟩).data = [] := by
    rw [stepEq]
    simpa [bits] using firstEmpty
  cases remaining with
  | zero =>
      have terminalTrace' : SelectedResponseTrace program dispatcher bits
          continuation terminalSource
          (Dovetail.clockExit_admissible fuel 0 environment)
          terminalRegisters terminalBit terminalSuffix terminalOuterContext
          terminalFullContext terminalInnerContext terminalTargetContext
          outerParents terminalTicks := by
        simpa [PrimitiveFuel.pendingParents] using terminalTrace
      let finalRegisters := scannedRegisters terminalRegisters terminalBit
        terminalSuffix
      let carrier := deletedCarrier terminalBit terminalOuterContext
        terminalInnerContext
      let checkpoint :=
        SchedulerRootContinuation.normalMarkerMutationConfiguration program
          dispatcher finalRegisters terminalBit bits continuation carrier
          outerParents
      let nextParents :=
        SchedulerRootContinuation.markedContinuationParents program dispatcher
          finalRegisters terminalBit bits carrier outerParents
      obtain ⟨preMarker, terminalData⟩ :=
        selectedMarkedTerminalShapesAt program dispatcher bits previous
          terminalRegisters terminalPhase terminalCoherent terminalBit
          terminalSuffix outerParents layers outer terminalTrace'
          currentEq terminalEmpty
      obtain ⟨terminalLeading, terminalConfigurations, terminalChain,
          terminalEqList, terminalLeadingSampled, terminalLength, terminalLast,
          terminalData', classifyTerminal⟩ :=
        selectedMarkedTerminalRawSegmentAt program dispatcher bits bits previous
          (sampleIndex + prefixConfigurations.length) terminalRegisters
          terminalPhase terminalCoherent terminalBit terminalSuffix outerParents
          layers outer terminalTrace' terminalEmpty preMarker terminalData
      let leading := prefixConfigurations ++ terminalLeading
      let configurations := prefixConfigurations ++ terminalConfigurations
      have configurationsEq : configurations = leading ++ [checkpoint] := by
        simp [configurations, leading, terminalEqList, checkpoint, continuation,
          fuel, bits, environment, finalRegisters, carrier, List.append_assoc]
      have prefixAndTerminal := SchedulerRecurrence.ExactMutationChain.append
        prefixChain terminalChain
      have completeChain :=
        SchedulerResponseInvariant.ExactMutationChain.prepend baseRun'
          prefixAndTerminal
      have leadingSampled :=
        SchedulerNestedPhase.IndexedResponseSampledStates.append program
          dispatcher bits prefixSampled terminalLeadingSampled
      have terminalCost : terminalConfigurations.length =
          CheckedTransition.totalCost program dispatcher
            (CTS.iterate program previous
              (CTS.initial program bits)).phase
            (CTS.iterate program previous
              (CTS.initial program bits)).data := by
        rw [terminalLength]
        exact congrArg
          (fun current => CheckedTransition.totalCost program dispatcher
            current.phase current.data) currentEq
      have configurationsLength : configurations.length =
          ExactCheckpointRun.jobCost program dispatcher bits fuel := by
        simp only [configurations, List.length_append]
        have prefixCost : prefixConfigurations.length =
            nonemptySweepCost program dispatcher previous
              (CTS.initial program bits) := by
          simpa [bits, CTS.initial] using prefixLength
        rw [prefixCost, terminalCost]
        rw [← nonemptySweepCost_succ_last program dispatcher previous
          (CTS.initial program bits)]
        simpa [fuel] using
          (nonemptySweepCost_initial_eq_jobCost program dispatcher bits
            (previous + 1))
      refine ⟨nextParents, leading, checkpoint, configurations, ?_,
        configurationsEq, configurationsLength,
        SchedulerTraceAlgebra.LastSample.appendLeft prefixConfigurations
          terminalLast,
        terminalData', ?_⟩
      · simpa [bits, fuel, environment, continuation, configurations,
          finalRegisters, carrier, checkpoint, nextParents,
          SchedulerRootContinuation.markedNextStageSourceConfiguration] using
          completeChain
      · intro activeContext checkpointChain certificate indexEq
        have terminalIndex :
            (sampleIndex + prefixConfigurations.length) +
                terminalConfigurations.length =
              ExactCheckpointRun.checkpointTime program dispatcher bits fuel := by
          simpa [configurations, List.length_append, Nat.add_assoc] using indexEq
        have terminalSampled := classifyTerminal (by
          simpa [fuel, checkpoint] using! certificate) (by
          simpa [fuel] using terminalIndex)
        have completeSampled :=
          SchedulerNestedPhase.IndexedResponseSampledStates.append program
            dispatcher bits prefixSampled terminalSampled
        simpa [configurations] using completeSampled
  | succ emptyTail =>
      have terminalTrace' : SelectedResponseTrace program dispatcher bits
          continuation terminalSource
          (Dovetail.clockExit_admissible fuel 0 environment)
          terminalRegisters terminalBit terminalSuffix terminalOuterContext
          terminalFullContext terminalInnerContext terminalTargetContext
          (PrimitiveFuel.pendingParents environment continuation (emptyTail + 1)
            outerParents) terminalTicks := by
        simpa [environment] using terminalTrace
      let finalRegisters := scannedRegisters terminalRegisters terminalBit
        terminalSuffix
      let carrier := deletedCarrier terminalBit terminalOuterContext
        terminalInnerContext
      let marked := LocalResponse.markedCompleted bits continuation carrier
        (SchedulerResponse.completedRoute program dispatcher finalRegisters
          terminalBit carrier)
      let emptyRegisters :=
        SchedulerCycle.enteredEmptyRegisters finalRegisters.advance
      obtain ⟨entryConfigurations, entryChain, entrySampled, entryLength,
          emptyCoherent, markedAudit, markedDecode⟩ :=
        selectedFirstEmptyEntryAt program dispatcher bits bits continuation
          terminalSource (Dovetail.clockExit_admissible fuel 0 environment)
          terminalRegisters terminalPhase terminalCoherent terminalBit
          terminalSuffix emptyTail
          (sampleIndex + prefixConfigurations.length) outerParents layers outer
          terminalTrace' terminalEmpty
      let finalEmptyRegisters :=
        SchedulerCycle.emptySweepRegisters program emptyTail emptyRegisters
      let finalEmptyCarrier :=
        SchedulerCycle.emptySweepCarrier program dispatcher bits continuation
          emptyTail emptyRegisters marked
      let checkpoint :=
        SchedulerRootContinuation.emptyMarkerMutationConfiguration program
          dispatcher finalEmptyRegisters bits continuation finalEmptyCarrier
          outerParents
      let nextParents :=
        SchedulerRootContinuation.emptyContinuationParents program dispatcher
          finalEmptyRegisters bits finalEmptyCarrier outerParents
      have finalCoherent : RegistersCoherent finalEmptyRegisters
          (SchedulerNestedEmpty.emptySweepPhase program emptyTail
            (CTS.nextPhase program terminalPhase)) [] true :=
        emptySweepRegisters_coherent program emptyTail emptyRegisters
          (CTS.nextPhase program terminalPhase) emptyCoherent
      have finalAudit : ReachableAudit.Holds program dispatcher.tree bits
          continuation finalEmptyCarrier :=
        emptySweepCarrier_holds program dispatcher bits continuation emptyTail
          emptyRegisters marked markedAudit
      have finalDecode : CarrierDecoder.decode? program dispatcher.tree bits
          continuation (Dovetail.clockExit_admissible fuel 0 environment)
          finalEmptyCarrier = some [] :=
        emptySweepCarrier_decode_of program dispatcher bits continuation
          (Dovetail.clockExit_admissible fuel 0 environment) emptyTail
          emptyRegisters marked markedDecode
      have emptyState :
          ⟨CTS.nextPhase program terminalPhase, []⟩ =
            CTS.iterate program (previous + 1)
              (CTS.initial program bits) := by
        cases stepValue : CTS.absorbingStep program
            ⟨terminalRegisters.phase,
              terminalBit :: terminalSuffix⟩ with
        | mk nextPhase output =>
            have nextPhaseEq : nextPhase =
                CTS.nextPhase program terminalRegisters.phase := by
              simpa [stepValue] using
                (CTS.absorbingStep_phase program
                  ⟨terminalRegisters.phase,
                    terminalBit :: terminalSuffix⟩)
            have outputEq : output = [] := by
              simpa [stepValue] using terminalEmpty
            subst nextPhase
            subst output
            have exactStep := stepValue.symm.trans stepEq
            simpa [terminalCoherent.phase_eq] using exactStep
      have finalPhaseEq : finalEmptyRegisters.phase =
          CheckpointDecoder.expectedPhase program fuel := by
        have sweptPhase : finalEmptyRegisters.phase =
            CTS.iteratePhase program emptyTail
              (CTS.nextPhase program terminalPhase) := by
          calc
            finalEmptyRegisters.phase =
                SchedulerNestedEmpty.emptySweepPhase program emptyTail
                  (CTS.nextPhase program terminalPhase) := finalCoherent.phase_eq
            _ = CTS.iteratePhase program emptyTail
                  (CTS.nextPhase program terminalPhase) :=
              emptySweepPhase_eq_iteratePhase program emptyTail
                (CTS.nextPhase program terminalPhase)
        have entryPhase : CTS.nextPhase program terminalPhase =
            (CTS.iterate program (previous + 1)
              (CTS.initial program bits)).phase :=
          congrArg CTS.Config.phase emptyState
        have phaseAtFinal : finalEmptyRegisters.phase =
            (CTS.iterate program emptyTail
              (CTS.iterate program (previous + 1)
                (CTS.initial program bits))).phase := by
          calc
            finalEmptyRegisters.phase =
                CTS.iteratePhase program emptyTail
                  (CTS.nextPhase program terminalPhase) := sweptPhase
            _ = CTS.iteratePhase program emptyTail
                  (CTS.iterate program (previous + 1)
                    (CTS.initial program bits)).phase := by rw [entryPhase]
            _ = (CTS.iterate program emptyTail
                  (CTS.iterate program (previous + 1)
                    (CTS.initial program bits))).phase := by
              exact (CTS.iterate_phase program emptyTail
                (CTS.iterate program (previous + 1)
                  (CTS.initial program bits))).symm
        have iterateEq : CTS.iterate program emptyTail
              (CTS.iterate program (previous + 1)
                (CTS.initial program bits)) =
            CTS.iterate program (previous + emptyTail + 1)
              (CTS.initial program bits) := by
          have combined := CTS.iterate_add program emptyTail (previous + 1)
            (CTS.initial program bits)
          rw [show emptyTail + (previous + 1) = previous + emptyTail + 1 by
            simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]] at combined
          exact combined.symm
        rw [phaseAtFinal, iterateEq]
        have expected := CheckpointRun.iterate_phase_eq_expectedPhase program
          bits (previous + emptyTail + 1)
        simpa [fuel, Nat.add_assoc] using expected
      have horizonEmpty :
          (CTS.iterate program fuel (CTS.initial program bits)).data = [] := by
        have startEmpty :
            (CTS.iterate program (previous + 1)
              (CTS.initial program bits)).data = [] := by
          simpa [bits] using firstEmpty
        have iteratedEmpty := CTS.iterate_empty_data program
          (emptyTail + 1)
          (CTS.iterate program (previous + 1)
            (CTS.initial program bits)).phase
        have startStateEq :
            ⟨(CTS.iterate program (previous + 1)
                (CTS.initial program bits)).phase, []⟩ =
              CTS.iterate program (previous + 1)
                (CTS.initial program bits) := by
          cases state : CTS.iterate program (previous + 1)
              (CTS.initial program bits) with
          | mk startPhase startData =>
              have startDataEq : startData = [] :=
                (congrArg CTS.Config.data state).symm.trans startEmpty
              subst startData
              rfl
        have combined := CTS.iterate_add program (emptyTail + 1)
          (previous + 1) (CTS.initial program bits)
        have countEq : (emptyTail + 1) + (previous + 1) = fuel := by
          simp [fuel, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
        calc
          (CTS.iterate program fuel (CTS.initial program bits)).data =
              (CTS.iterate program ((emptyTail + 1) + (previous + 1))
                (CTS.initial program bits)).data := by rw [countEq]
          _ = (CTS.iterate program (emptyTail + 1)
                (CTS.iterate program (previous + 1)
                  (CTS.initial program bits))).data :=
            congrArg CTS.Config.data combined
          _ = (CTS.iterate program (emptyTail + 1)
                ⟨(CTS.iterate program (previous + 1)
                    (CTS.initial program bits)).phase, []⟩).data := by
            rw [startStateEq]
          _ = [] := iteratedEmpty
      let terminalData := emptyMarkedTerminalDataAt program dispatcher bits
        (previous + emptyTail + 1) finalEmptyRegisters finalEmptyCarrier
        outerParents layers outer (by
          simpa [fuel, environment, continuation, Nat.add_assoc] using
            finalDecode) (by simpa [fuel, Nat.add_assoc] using finalPhaseEq) (by
          simpa [fuel, Nat.add_assoc] using horizonEmpty)
      obtain ⟨emptyLeading, emptyChain, emptyLeadingSampled, emptyLength,
          emptyLast, emptyOuter⟩ :=
        terminalEmptySweepRawSegmentAt program dispatcher bits
          (sampleIndex + prefixConfigurations.length +
            entryConfigurations.length)
          (previous + emptyTail + 1) emptyTail emptyRegisters marked outerParents
          layers outer emptyCoherent (by
            simpa [fuel, environment, continuation, Nat.add_assoc] using!
              markedAudit) (by
            simpa [fuel, environment, continuation, Nat.add_assoc] using!
              markedDecode) (by simpa [fuel, Nat.add_assoc] using finalPhaseEq)
      let leading := prefixConfigurations ++ entryConfigurations ++ emptyLeading
      let configurations := prefixConfigurations ++ entryConfigurations ++
        (emptyLeading ++ [checkpoint])
      have configurationsEq : configurations = leading ++ [checkpoint] := by
        simp [configurations, leading, List.append_assoc]
      have prefixAndEntry := SchedulerRecurrence.ExactMutationChain.append
        prefixChain entryChain
      have throughEmpty := SchedulerRecurrence.ExactMutationChain.append
        prefixAndEntry emptyChain
      have completeChain :=
        SchedulerResponseInvariant.ExactMutationChain.prepend baseRun'
          throughEmpty
      have prefixAndEntrySampled :=
        SchedulerNestedPhase.IndexedResponseSampledStates.append program
          dispatcher bits prefixSampled entrySampled
      have leadingSampled :=
        SchedulerNestedPhase.IndexedResponseSampledStates.append program
          dispatcher bits prefixAndEntrySampled (by
            simpa [List.length_append, Nat.add_assoc] using emptyLeadingSampled)
      have emptyCost :
          SchedulerRootContinuation.emptyCleanupMutations program dispatcher
              emptyTail emptyRegisters =
            nonemptySweepCost program dispatcher (emptyTail + 1)
              (CTS.iterate program (previous + 1)
                (CTS.initial program bits)) := by
        calc
          SchedulerRootContinuation.emptyCleanupMutations program dispatcher
                emptyTail emptyRegisters =
              nonemptySweepCost program dispatcher (emptyTail + 1)
                ⟨CTS.nextPhase program terminalPhase, []⟩ :=
            emptyCleanupMutations_eq_nonemptySweepCost program dispatcher
              emptyTail emptyRegisters (CTS.nextPhase program terminalPhase)
              emptyCoherent
          _ = nonemptySweepCost program dispatcher (emptyTail + 1)
                (CTS.iterate program (previous + 1)
                  (CTS.initial program bits)) := by rw [emptyState]
      have entryCost : entryConfigurations.length =
          CheckedTransition.totalCost program dispatcher
            (CTS.iterate program previous
              (CTS.initial program bits)).phase
            (CTS.iterate program previous
              (CTS.initial program bits)).data := by
        rw [entryLength]
        exact congrArg
          (fun current => CheckedTransition.totalCost program dispatcher
            current.phase current.data) currentEq
      have configurationsLength : configurations.length =
          ExactCheckpointRun.jobCost program dispatcher bits fuel := by
        simp only [configurations, List.length_append, List.length_singleton]
        have prefixCost : prefixConfigurations.length =
            nonemptySweepCost program dispatcher previous
              (CTS.initial program bits) := by
          simpa [bits, CTS.initial] using prefixLength
        have emptyCount : emptyLeading.length + 1 =
            SchedulerRootContinuation.emptyCleanupMutations program dispatcher
              emptyTail emptyRegisters := by
          simpa [List.length_append] using emptyLength
        rw [prefixCost, entryCost, emptyCount, emptyCost]
        rw [← nonemptySweepCost_succ_last program dispatcher previous
          (CTS.initial program bits)]
        rw [← nonemptySweepCost_add program dispatcher (previous + 1)
          (CTS.initial program bits) (emptyTail + 1)]
        have totalEq : (previous + 1) + (emptyTail + 1) = fuel := by
          simp [fuel, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
        rw [totalEq]
        exact nonemptySweepCost_initial_eq_jobCost program dispatcher bits fuel
      refine ⟨nextParents, leading, checkpoint, configurations, ?_,
        configurationsEq, configurationsLength,
        SchedulerTraceAlgebra.LastSample.appendLeft
          (prefixConfigurations ++ entryConfigurations) emptyLast,
        terminalData, ?_⟩
      · simpa [bits, fuel, environment, continuation, configurations,
          finalRegisters, carrier, marked, emptyRegisters, finalEmptyRegisters,
          finalEmptyCarrier, checkpoint, nextParents,
          SchedulerRootContinuation.emptyNextStageSourceConfiguration,
          List.append_assoc] using! completeChain
      · intro activeContext checkpointChain certificate indexEq
        obtain ⟨result, shape, chainLayers, terminalViewEq, queueEq,
            outputEmpty, completed⟩ := terminalData
        have markerHolds : Holds program dispatcher checkpoint := by
          simpa [checkpoint, continuation, finalEmptyRegisters,
            finalEmptyCarrier] using
            (SchedulerRootContinuation.emptyMarker_holds program dispatcher
              finalEmptyRegisters bits continuation finalEmptyCarrier
              outerParents finalCoherent finalAudit shape)
        have markerIndex : sampleIndex + leading.length + 1 =
            ExactCheckpointRun.checkpointTime program dispatcher bits fuel := by
          simpa [configurationsEq, List.length_append, Nat.add_assoc] using!
            indexEq
        have markerSample : SampledState program dispatcher bits
            (sampleIndex + leading.length + 1) checkpoint := by
          simpa [checkpoint, continuation, finalEmptyRegisters,
            finalEmptyCarrier] using
            (SchedulerRootContinuation.emptyMarker_sampledState program
              dispatcher bits (sampleIndex + leading.length + 1)
              (previous + emptyTail + 1) finalEmptyRegisters bits continuation
              finalEmptyCarrier outerParents markerHolds (by
                simpa [fuel, checkpoint, Nat.add_assoc] using certificate) (by
                simpa [fuel, Nat.add_assoc] using markerIndex))
        have fullSampled :=
          SchedulerRecurrence.IndexedResponseSampledStates.appendOne program
            dispatcher bits leadingSampled checkpoint markerSample
        simpa [configurations, leading, List.append_assoc] using fullSampled

end SchedulerFirstEmpty

end PureSFormal.PureS
