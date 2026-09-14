import PureSFormal.PureS.SchedulerNestedPhase
import PureSFormal.PureS.SchedulerCompletedContext

/-!
# Nonempty response jobs below completed Local prefixes

This module refines the response half of one fuel-bounded job while retaining
an arbitrary zipper suffix made from completed Local continuation holes.  It
provides the exact mutation list and sampled invariant for every response
that is still below a pending frame.  The second half of the module proves
the terminal response and continuation handoff.
-/

namespace PureSFormal.PureS

namespace SchedulerNestedResponse

open FiniteController SchedulerControl SchedulerInvariant SchedulerCycle
  SchedulerResponseInvariant

open SchedulerCompletedContext

abbrev Configuration (program : CTS.Program)
    (dispatcher : ActionDispatcher program) :=
  SchedulerInvariant.Configuration program dispatcher

/-! ## Canonical Base descent and the selected C4 sample -/

/-- The mutable Base exposes its encoded queue through a canonical descent for
every admissible continuation, independently of the surrounding zipper. -/
theorem baseCarrier_descent
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation : Term) :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    ∃ context,
      CanonicalTraversal.Descent program dispatcher.tree bits continuation
        (baseCarrier environment continuation) bits context := by
  let actions := compileActions program dispatcher.tree
  let environment := environmentCode actions bits
  obtain ⟨queueContext, queueShape, queueEq⟩ :=
    CanonicalTraversal.QueueContext.ofDecodes (CellSpine.decodes_word bits)
  let baseContext := MutableBase.queueContext actions bits continuation
    (baseBeta environment continuation)
  refine ⟨baseContext.comp queueContext, ?_⟩
  have descent : CanonicalTraversal.Descent program dispatcher.tree bits
      continuation
      (MutableBase.mutableBase actions bits continuation
        (queueContext.plug omega)) bits (baseContext.comp queueContext) :=
    .base queueShape
  simpa [actions, environment, queueEq] using descent

/-- The immediate post-C4 configuration for a selected nonempty carrier
response.  `parents` begins immediately outside the selected carrier; for a
bounded job it is the full, still-unconsumed pending stack. -/
def selectedC4Configuration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool)
    (outerContext innerContext : Context) (parents : List ParentFrame) :
    Configuration program dispatcher :=
  let endpoint := Carrier.tombstone bit
    (SchedulerAscent.frontPredecessor innerContext)
    (SchedulerAscent.frontPredecessor innerContext)
  upConfiguration program dispatcher (registers.observeLive bit) endpoint
    (ContextCursor.frames outerContext endpoint parents)

/-- Executable search from the exact selected-front UP source finds the named
C4 sample. -/
theorem selected_seekC4
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (seedBits : List Bool) (continuation source : Term)
    (hadmissible : Carrier.Admissible continuation)
    (registers : Registers program) (bit : Bool) (suffix : List Bool)
    {outerContext fullContext innerContext targetContext : Context}
    (parents : List ParentFrame) {ticks : Nat}
    (trace : SelectedResponseTrace program dispatcher seedBits continuation
      source hadmissible registers bit suffix outerContext fullContext
      innerContext targetContext parents ticks)
    (notSeen : registers.seen = false) :
    ∃ bound,
      FiniteController.seekMutation (SchedulerControl.machine program dispatcher)
        bound
        (upConfiguration program dispatcher registers omega
          (ContextCursor.frames fullContext omega
            (.right (SchedulerResponse.pendingFunction program dispatcher
              seedBits continuation) :: parents))) =
        some (selectedC4Configuration program dispatcher registers bit
          outerContext innerContext
          (.right (SchedulerResponse.pendingFunction program dispatcher
            seedBits continuation) :: parents)) := by
  obtain ⟨bound, found⟩ := SchedulerAscent.selectedFront_seekMutation
    program dispatcher registers trace.path
      (.right (SchedulerResponse.pendingFunction program dispatcher seedBits
        continuation) :: parents) notSeen
  exact ⟨bound, by
    simpa [selectedC4Configuration] using found⟩

/-- The selected C4 sample satisfies the full simultaneous invariant below
every positive pending stack and every completed outer prefix. -/
theorem selectedC4_holdsAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (seedBits : List Bool) (continuation source : Term)
    (hadmissible : Carrier.Admissible continuation)
    (registers : Registers program) (phase : CTS.Phase program)
    (coherent : RegistersCoherent registers phase [] false)
    (bit : Bool) (suffix : List Bool) (remaining : Nat)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers)
    {outerContext fullContext innerContext targetContext : Context}
    {ticks : Nat}
    (trace : SelectedResponseTrace program dispatcher seedBits continuation
      source hadmissible registers bit suffix outerContext fullContext
      innerContext targetContext
      (PrimitiveFuel.pendingParents
        (environmentCode (compileActions program dispatcher.tree) seedBits)
        continuation remaining outerParents) ticks) :
    Holds program dispatcher
      (selectedC4Configuration program dispatcher registers bit outerContext
        innerContext
        (.right (SchedulerResponse.pendingFunction program dispatcher seedBits
          continuation) ::
          PrimitiveFuel.pendingParents
            (environmentCode (compileActions program dispatcher.tree) seedBits)
            continuation remaining outerParents)) := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) seedBits
  let endpoint := Carrier.tombstone bit
    (SchedulerAscent.frontPredecessor innerContext)
    (SchedulerAscent.frontPredecessor innerContext)
  let parents := PrimitiveFuel.pendingParents environment continuation remaining
    outerParents
  let fullParents := .right
    (SchedulerResponse.pendingFunction program dispatcher seedBits continuation) ::
      parents
  have notSeen : registers.seen = false := by
    simpa using! coherent.seen_eq
  have noTail : registers.tail = false := by
    simpa using! coherent.tail_eq
  have observedCoherent : RegistersCoherent (registers.observeLive bit) phase
      [bit] false := by
    refine ⟨?_, ?_, ?_, ?_, ?_⟩
    · simp [Registers.observeLive, notSeen, coherent.phase_eq]
    · simp [Registers.observeLive, notSeen, scanBit?]
    · simp [Registers.observeLive, notSeen, scanSeen]
    · simp [Registers.observeLive, notSeen, noTail, scanTail]
    · simp [Registers.observeLive, notSeen, coherent.empty_eq]
  have parentEq : fullParents =
      PrimitiveFuel.pendingParents environment continuation (remaining + 1)
        outerParents := by
    simpa [fullParents, parents, environment,
      SchedulerResponse.pendingFunction,
      PendingFrame.environmentCode_eq_envelope,
      PendingFrame.frameFunction] using
      (SchedulerCycle.pendingParents_succ_cons environment continuation remaining
        outerParents).symm
  have silent : SilentEvidence program dispatcher.tree .up
      (selectedC4Configuration program dispatcher registers bit outerContext
        innerContext fullParents).cursor.erase := by
    rw [selectedC4Configuration]
    change SilentEvidence program dispatcher.tree .up
      (Cursor.rebuild (ContextCursor.frames outerContext endpoint fullParents)
        endpoint)
    rw [rebuild_contextFrames]
    rw [show outerContext.plug endpoint =
        deletedCarrier bit outerContext innerContext by
      rfl]
    rw [parentEq]
    exact outer.pendingSilent .up seedBits continuation
      (deletedCarrier bit outerContext innerContext) (remaining + 1)
      (Nat.succ_ne_zero remaining)
  have auditSource := auditedOccurrence_downDescent trace.targetDescent
    fullParents
  have audit : AuditedOccurrence program dispatcher.tree
      (selectedC4Configuration program dispatcher registers bit outerContext
        innerContext fullParents).cursor.erase := by
    have eraseEq :
        (selectedC4Configuration program dispatcher registers bit outerContext
          innerContext fullParents).cursor.erase =
        (Cursor.mk (deletedCarrier bit outerContext innerContext)
          fullParents).erase := by
      change Cursor.rebuild (ContextCursor.frames outerContext endpoint
          fullParents) endpoint =
        Cursor.rebuild fullParents
          (deletedCarrier bit outerContext innerContext)
      rw [rebuild_contextFrames]
      rfl
    rw [eraseEq]
    exact auditSource
  let cursor := selectedC4Configuration program dispatcher registers bit
    outerContext innerContext fullParents |>.cursor
  exact .intro (.macro (.family .up) (registers.observeLive bit)) rfl phase
    [bit] false observedCoherent
    (ControlPosition.macro
      (context := contextOfParents cursor.parents) (focus := cursor.focus)
      (cursorAtContextOfParents cursor.focus cursor.parents) (by trivial))
    (.up (.silent silent) audit)

/-- Exact sampled-state wrapper for a selected C4 below a positive pending
stack. -/
theorem selectedC4_sampledAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits seedBits : List Bool) (continuation source : Term)
    (hadmissible : Carrier.Admissible continuation)
    (registers : Registers program) (phase : CTS.Phase program)
    (coherent : RegistersCoherent registers phase [] false)
    (bit : Bool) (suffix : List Bool) (remaining sampleIndex : Nat)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers)
    {outerContext fullContext innerContext targetContext : Context}
    {ticks : Nat}
    (trace : SelectedResponseTrace program dispatcher seedBits continuation
      source hadmissible registers bit suffix outerContext fullContext
      innerContext targetContext
      (PrimitiveFuel.pendingParents
        (environmentCode (compileActions program dispatcher.tree) seedBits)
        continuation remaining outerParents) ticks) :
    SampledState program dispatcher inputBits (sampleIndex + 1)
      (selectedC4Configuration program dispatcher registers bit outerContext
        innerContext
        (.right (SchedulerResponse.pendingFunction program dispatcher seedBits
          continuation) ::
          PrimitiveFuel.pendingParents
            (environmentCode (compileActions program dispatcher.tree) seedBits)
            continuation remaining outerParents)) := by
  let fullParents := .right
    (SchedulerResponse.pendingFunction program dispatcher seedBits continuation) ::
      PrimitiveFuel.pendingParents
        (environmentCode (compileActions program dispatcher.tree) seedBits)
        continuation remaining outerParents
  have holds := selectedC4_holdsAt program dispatcher seedBits continuation
    source hadmissible registers phase coherent bit suffix remaining outerParents
    layers outer trace
  let environment :=
    environmentCode (compileActions program dispatcher.tree) seedBits
  let endpoint := Carrier.tombstone bit
    (SchedulerAscent.frontPredecessor innerContext)
    (SchedulerAscent.frontPredecessor innerContext)
  have parentEq : fullParents =
      PrimitiveFuel.pendingParents environment continuation (remaining + 1)
        outerParents := by
    simpa [fullParents, environment, SchedulerResponse.pendingFunction,
      PendingFrame.environmentCode_eq_envelope,
      PendingFrame.frameFunction] using
      (SchedulerCycle.pendingParents_succ_cons environment continuation remaining
        outerParents).symm
  have silent : SilentEvidence program dispatcher.tree .up
      (selectedC4Configuration program dispatcher registers bit outerContext
        innerContext fullParents).cursor.erase := by
    rw [selectedC4Configuration]
    change SilentEvidence program dispatcher.tree .up
      (Cursor.rebuild (ContextCursor.frames outerContext endpoint fullParents)
        endpoint)
    rw [rebuild_contextFrames]
    rw [show outerContext.plug endpoint =
        deletedCarrier bit outerContext innerContext by rfl]
    rw [parentEq]
    exact outer.pendingSilent .up seedBits continuation
      (deletedCarrier bit outerContext innerContext) (remaining + 1)
      (Nat.succ_ne_zero remaining)
  exact SampledState.ofSilent
    (.macro (.family .up) (registers.observeLive bit)) holds rfl
    silent

/-- After the selected C4, scanning the retained outer carrier and recognizing
the current pending frame reaches the exact response FRAME state without a
second contraction. -/
theorem selectedC4_toFrame_zeroRunAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (seedBits : List Bool) (continuation source : Term)
    (hadmissible : Carrier.Admissible continuation)
    (registers : Registers program) (bit : Bool) (suffix : List Bool)
    (remaining : Nat) (outerParents : List ParentFrame)
    {outerContext fullContext innerContext targetContext : Context}
    {ticks : Nat}
    (trace : SelectedResponseTrace program dispatcher seedBits continuation
      source hadmissible registers bit suffix outerContext fullContext
      innerContext targetContext
      (PrimitiveFuel.pendingParents
        (environmentCode (compileActions program dispatcher.tree) seedBits)
        continuation remaining outerParents) ticks)
    (notSeen : registers.seen = false) :
    ∃ ascentTicks,
      ZeroMutationRun (SchedulerControl.machine program dispatcher) ascentTicks
        (selectedC4Configuration program dispatcher registers bit outerContext
          innerContext
          (.right (SchedulerResponse.pendingFunction program dispatcher seedBits
            continuation) ::
            PrimitiveFuel.pendingParents
              (environmentCode (compileActions program dispatcher.tree) seedBits)
              continuation remaining outerParents))
        (selectedFrameConfiguration program dispatcher registers bit suffix
          seedBits continuation (deletedCarrier bit outerContext innerContext)
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program dispatcher.tree) seedBits)
            continuation remaining outerParents)) := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) seedBits
  let parents := PrimitiveFuel.pendingParents environment continuation remaining
    outerParents
  let fullParents := .right
    (SchedulerResponse.pendingFunction program dispatcher seedBits continuation) ::
      parents
  let endpoint := Carrier.tombstone bit
    (SchedulerAscent.frontPredecessor innerContext)
    (SchedulerAscent.frontPredecessor innerContext)
  let finalRegisters := scannedRegisters registers bit suffix
  have firstSeen : (registers.observeLive bit).seen = true := by
    simp [Registers.observeLive, notSeen]
  obtain ⟨outerTicks, outerRun⟩ :=
    SchedulerAscent.selectedFront_outer_zeroRun program dispatcher hadmissible
      trace.selected (endpoint := endpoint) (registers.observeLive bit)
      fullParents firstSeen
  have outerRun' : ZeroMutationRun
      (SchedulerControl.machine program dispatcher) outerTicks
      (selectedC4Configuration program dispatcher registers bit outerContext
        innerContext fullParents)
      (upConfiguration program dispatcher finalRegisters
        (deletedCarrier bit outerContext innerContext) fullParents) := by
    simpa [selectedC4Configuration, endpoint, finalRegisters, fullParents,
      scannedRegisters, deletedCarrier] using outerRun
  have finalSeen : finalRegisters.seen = true := by
    exact SchedulerAscent.scanRegisters_seen _ _ firstSeen
  have leave := SchedulerAscent.pendingFrameDispatch_zeroRun program dispatcher
    finalRegisters haltCode (compileActions program dispatcher.tree)
    (word seedBits) continuation
    (deletedCarrier bit outerContext innerContext) parents finalSeen
  refine ⟨outerTicks + SchedulerAscent.pendingFrameDispatchTicks program
      dispatcher haltCode (compileActions program dispatcher.tree)
      (word seedBits) continuation
      (deletedCarrier bit outerContext innerContext) parents, ?_⟩
  simpa [selectedFrameConfiguration, SchedulerResponse.frameConfiguration,
    SchedulerResponse.frameCursor, fullParents, parents, environment,
    finalRegisters, SchedulerResponse.pendingFunction,
    PendingFrame.environmentCode_eq_envelope, PendingFrame.frameFunction] using!
    outerRun'.trans leave

/-- Scanning one nonempty decoded word preserves the logical phase and
normal-mode register interpretation. -/
theorem scannedRegisters_coherentAt
    (program : CTS.Program) (registers : Registers program)
    (phase : CTS.Phase program)
    (coherent : RegistersCoherent registers phase [] false)
    (bit : Bool) (suffix : List Bool) :
    RegistersCoherent (scannedRegisters registers bit suffix) phase
      (bit :: suffix) false := by
  have notSeen : registers.seen = false := by
    simpa using! coherent.seen_eq
  have noTail : registers.tail = false := by
    simpa using! coherent.tail_eq
  obtain ⟨bitEq, seenEq, tailEq⟩ :=
    SchedulerAscent.scanRegisters_afterFirst_coherent registers bit suffix
      notSeen noTail
  refine ⟨?_, ?_, ?_, ?_, ?_⟩
  · rw [scannedRegisters, scanRegisters_phase]
    unfold Registers.observeLive
    split <;> exact coherent.phase_eq
  · simpa [scanBit?] using! bitEq
  · simpa [scanSeen] using! seenEq
  · cases suffix <;> simpa [scanTail] using! tailEq
  · rw [scannedRegisters, scanRegisters_empty]
    unfold Registers.observeLive
    split <;> exact coherent.empty_eq

namespace ResponseSamplePairs

/-- A response trace with the unique-final flag decomposes its executable
sample list at the exact configuration whose bare term is the completed Local.
This is purely structural and therefore available before the final sample has
been classified by a positive-prefix certificate. -/
theorem terminalDecomposition
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool)
    (bits : List Bool) (continuation carrier : Term)
    (parents : List ParentFrame) :
    ∀ {configurations : List (Configuration program dispatcher)}
      {entries : List (Bool × Term)},
      ResponseSamplePairs program dispatcher registers bit bits continuation
        carrier parents configurations entries →
      FinalResponseFlags entries →
      ∃ leading checkpoint,
        configurations = leading ++ [checkpoint] ∧
        checkpoint.cursor.erase = Cursor.rebuild parents
          (LocalResponse.completed bits continuation carrier
            (SchedulerResponse.completedRoute program dispatcher registers bit
              carrier)) := by
  intro configurations entries pairs flags
  induction pairs with
  | nil => cases flags
  | @cons pc cursor done term position eraseEq root configurationTail entryTail
      tail ih =>
      cases flags with
      | last finalTerm =>
          cases tail with
          | nil =>
              have completedEq : term =
                  LocalResponse.completed bits continuation carrier
                    (SchedulerResponse.completedRoute program dispatcher
                      registers bit carrier) := by
                simpa [SchedulerResponse.completedRoute] using root.done_eq rfl
              refine ⟨[],
                ⟨some (.script (.normalResponse (registers.phase, bit)) pc
                  registers), cursor⟩, rfl, ?_⟩
              rw [eraseEq, completedEq]
      | silent silentTerm rest =>
          obtain ⟨leading, checkpoint, tailEq, checkpointEq⟩ := ih rest
          refine ⟨⟨some (.script (.normalResponse (registers.phase, bit)) pc
              registers), cursor⟩ :: leading, checkpoint, ?_, checkpointEq⟩
          simp [tailEq]

/-- Every response contraction below a positive pending stack is silent even
when that stack itself lies below an arbitrary completed continuation prefix. -/
theorem pendingClassificationAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits seedBits : List Bool) (continuation : Term)
    (sampleIndex depth : Nat) (positive : depth ≠ 0)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers)
    {term : Term} {cursor : Cursor}
    (eraseEq : cursor.erase = Cursor.rebuild
      (PrimitiveFuel.pendingParents
        (environmentCode (compileActions program dispatcher.tree) seedBits)
        continuation depth outerParents) term) :
    DecoderEvidence program dispatcher.tree .frameDispatch cursor.erase /\
      EventEvidence program dispatcher inputBits (sampleIndex + 1)
        .frameDispatch cursor.erase := by
  have silent : SilentEvidence program dispatcher.tree .frameDispatch
      cursor.erase := by
    rw [eraseEq]
    exact outer.pendingSilent .frameDispatch seedBits continuation term depth
      positive
  exact ⟨.silent silent, .silent silent⟩

end ResponseSamplePairs

namespace ResponseSamplePairs

/-- Terminal-response classifications below a completed outer prefix.  The
unique final response mutation is the caller's exact fresh checkpoint. -/
theorem positiveClassificationsAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) (registers : Registers program) (bit : Bool)
    (bits : List Bool) (continuation carrier : Term)
    (hadmissible : Carrier.Admissible continuation)
    (snapshotInv : ReachableAudit.Holds program dispatcher.tree bits
      continuation carrier)
    (offset : Nat) (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers)
    {activeContext : Context} {chain : CheckpointDecoder.ChainView program}
    (certificate : CheckpointRun.PositivePrefix program dispatcher inputBits
      (offset + 1)
      (Cursor.rebuild outerParents
        (LocalResponse.completed bits continuation carrier
          (SchedulerResponse.completedRoute program dispatcher registers bit
            carrier)))
      (ExactCheckpointRun.checkpointTime program dispatcher inputBits
        (offset + 1)) activeContext chain)
    (nonempty :
      (CTS.iterate program (offset + 1)
        (CTS.initial program inputBits)).data ≠ []) :
    ∀ {configurations : List
        (SchedulerResponseInvariant.Configuration program dispatcher)}
      {entries : List (Bool × Term)} {sampleIndex : Nat},
      ResponseSamplePairs program dispatcher registers bit bits continuation
        carrier outerParents configurations entries →
      FinalResponseFlags entries →
      sampleIndex + configurations.length =
        ExactCheckpointRun.checkpointTime program dispatcher inputBits
          (offset + 1) →
      ResponseClassifications program dispatcher inputBits registers bit
        sampleIndex configurations := by
  intro configurations entries sampleIndex pairs flags indexEq
  induction pairs generalizing sampleIndex with
  | nil => cases flags
  | @cons pc cursor done term position eraseEq root configurationTail entryTail
      tail ih =>
      cases flags with
      | last finalTerm =>
          cases tail with
          | nil =>
              have completedEq : term =
                  LocalResponse.completed bits continuation carrier
                    (SchedulerResponse.completedRoute program dispatcher
                      registers bit carrier) := by
                simpa [SchedulerResponse.completedRoute] using root.done_eq rfl
              have terminalCertificate : CheckpointRun.PositivePrefix program
                  dispatcher inputBits (offset + 1) cursor.erase
                  (ExactCheckpointRun.checkpointTime program dispatcher
                    inputBits (offset + 1)) activeContext chain := by
                rw [eraseEq, completedEq]
                exact certificate
              have terminal := positivePrefix_freshTerminal terminalCertificate
                nonempty
              have finalIndex : sampleIndex + 1 =
                  ExactCheckpointRun.checkpointTime program dispatcher
                    inputBits (offset + 1) := by
                simpa using indexEq
              obtain ⟨decoder, event⟩ :=
                ResponseSamplePairs.terminalClassification program dispatcher
                  inputBits sampleIndex offset terminal terminalCertificate
                  finalIndex
              exact .cons sampleIndex pc cursor decoder event (.nil _)
      | silent silentTerm rest =>
          have prefixShape : CheckpointExclusion.CompletedPrefix program
              dispatcher.tree cursor.erase term layers := by
            rw [eraseEq]
            exact outer.prefix term
          have classification := ResponseSamplePairs.intermediateClassification
            program dispatcher inputBits registers bit bits continuation carrier
            hadmissible snapshotInv sampleIndex root prefixShape
          have tailIndex : (sampleIndex + 1) + configurationTail.length =
              ExactCheckpointRun.checkpointTime program dispatcher inputBits
                (offset + 1) := by
            calc
              (sampleIndex + 1) + configurationTail.length =
                  sampleIndex + (1 + configurationTail.length) :=
                Nat.add_assoc _ _ _
              _ = sampleIndex + (configurationTail.length + 1) := by
                rw [Nat.add_comm 1 configurationTail.length]
              _ = _ := by simpa using indexEq
          exact .cons sampleIndex pc cursor classification.1 classification.2
            (ih rest tailIndex)

/-- Terminal response classifications when the completed fresh Local still
awaits its required empty-output marker. -/
theorem preMarkerClassificationsAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) (registers : Registers program) (bit : Bool)
    (bits : List Bool) (continuation carrier : Term)
    (hadmissible : Carrier.Admissible continuation)
    (snapshotInv : ReachableAudit.Holds program dispatcher.tree bits
      continuation carrier)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers)
    (preMarker : CheckpointExclusion.PreMarkerEmptyShape program
      dispatcher.tree
      (Cursor.rebuild outerParents
        (LocalResponse.completed bits continuation carrier
          (SchedulerResponse.completedRoute program dispatcher registers bit
            carrier)))) :
    ∀ {configurations : List
        (SchedulerResponseInvariant.Configuration program dispatcher)}
      {entries : List (Bool × Term)} {sampleIndex : Nat},
      ResponseSamplePairs program dispatcher registers bit bits continuation
        carrier outerParents configurations entries →
      FinalResponseFlags entries →
      ResponseClassifications program dispatcher inputBits registers bit
        sampleIndex configurations := by
  intro configurations entries sampleIndex pairs flags
  induction pairs generalizing sampleIndex with
  | nil => cases flags
  | @cons pc cursor done term position eraseEq root configurationTail entryTail
      tail ih =>
      cases flags with
      | last finalTerm =>
          cases tail with
          | nil =>
              have completedEq : term =
                  LocalResponse.completed bits continuation carrier
                    (SchedulerResponse.completedRoute program dispatcher
                      registers bit carrier) := by
                simpa [SchedulerResponse.completedRoute] using root.done_eq rfl
              have shape : CheckpointExclusion.PreMarkerEmptyShape program
                  dispatcher.tree cursor.erase := by
                rw [eraseEq, completedEq]
                exact preMarker
              let silent : SilentEvidence program dispatcher.tree
                  .frameDispatch cursor.erase :=
                .ofPublic (.framePreMarker shape)
              exact .cons sampleIndex pc cursor (.silent silent)
                (.silent silent) (.nil _)
      | silent silentTerm rest =>
          have prefixShape : CheckpointExclusion.CompletedPrefix program
              dispatcher.tree cursor.erase term layers := by
            rw [eraseEq]
            exact outer.prefix term
          have classification := ResponseSamplePairs.intermediateClassification
            program dispatcher inputBits registers bit bits continuation carrier
            hadmissible snapshotInv sampleIndex root prefixShape
          exact .cons sampleIndex pc cursor classification.1 classification.2
            (ih rest)

/-- A clock continuation with another job wrapper is an unfinished decoder
endpoint. -/
theorem nonterminalClockExit_failure
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (stage jobs : Nat) (environment : Term) :
    CheckpointExclusion.EndpointFailure program dispatcher.tree
      (Dovetail.clockExit stage (jobs + 1) environment) := by
  exact ⟨
    CheckpointDecoder.parseGenerator?_nonterminalExit _ _ _ _,
    CheckpointDecoder.parseLocal?_nonterminalExit_none _ _ _ _ _,
    CheckpointDecoder.parseTerminal?_nonterminalExit _ _ _ _⟩

/-- Response classifications whose completed Local still surrounds an
unlaunched arity-three clock continuation.  The final response contraction is
silent because that continuation is an explicit unfinished endpoint. -/
theorem nonterminalClassificationsAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) (registers : Registers program) (bit : Bool)
    (bits : List Bool) (continuation carrier : Term)
    (hadmissible : Carrier.Admissible continuation)
    (snapshotInv : ReachableAudit.Holds program dispatcher.tree bits
      continuation carrier)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers)
    (failure : CheckpointExclusion.EndpointFailure program dispatcher.tree
      continuation) :
    ∀ {configurations : List
        (SchedulerResponseInvariant.Configuration program dispatcher)}
      {entries : List (Bool × Term)} {sampleIndex : Nat},
      ResponseSamplePairs program dispatcher registers bit bits continuation
        carrier outerParents configurations entries →
      FinalResponseFlags entries →
      ResponseClassifications program dispatcher inputBits registers bit
        sampleIndex configurations := by
  intro configurations entries sampleIndex pairs flags
  induction pairs generalizing sampleIndex with
  | nil => cases flags
  | @cons pc cursor done term position eraseEq root configurationTail entryTail
      tail ih =>
      cases flags with
      | last finalTerm =>
          cases tail with
          | nil =>
              have completedEq : term =
                  LocalResponse.completed bits continuation carrier
                    (SchedulerResponse.completedRoute program dispatcher
                      registers bit carrier) := by
                simpa [SchedulerResponse.completedRoute] using root.done_eq rfl
              have extended := outer.fresh registers bit bits carrier
              have silent : SilentEvidence program dispatcher.tree
                  .frameDispatch cursor.erase := by
                rw [eraseEq, completedEq]
                rw [← CompletedParents.rebuild_freshContinuationParents
                  program dispatcher registers bit bits carrier continuation
                  outerParents]
                exact extended.silentOfFailure .frameDispatch failure
              exact .cons sampleIndex pc cursor (.silent silent)
                (.silent silent) (.nil _)
      | silent silentTerm rest =>
          have prefixShape : CheckpointExclusion.CompletedPrefix program
              dispatcher.tree cursor.erase term layers := by
            rw [eraseEq]
            exact outer.prefix term
          have classification := ResponseSamplePairs.intermediateClassification
            program dispatcher inputBits registers bit bits continuation carrier
            hadmissible snapshotInv sampleIndex root prefixShape
          exact .cons sampleIndex pc cursor classification.1 classification.2
            (ih rest)

end ResponseSamplePairs

/-- Exact terminal response segment whose unique final contraction is the
fresh checkpoint supplied by the all-stage induction. -/
theorem positiveResponseSegmentAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) (registers : Registers program) (bit : Bool)
    (bits : List Bool) (continuation carrier : Term)
    (sampleIndex offset : Nat)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers)
    {phase : CTS.Phase program} {scanned : List Bool} {emptyMode : Bool}
    (bitEq : registers.bit = some bit)
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    (hadmissible : Carrier.Admissible continuation)
    (snapshotInv : ReachableAudit.Holds program dispatcher.tree bits
      continuation carrier)
    {activeContext : Context} {chain : CheckpointDecoder.ChainView program}
    (certificate : CheckpointRun.PositivePrefix program dispatcher inputBits
      (offset + 1)
      (Cursor.rebuild outerParents
        (LocalResponse.completed bits continuation carrier
          (SchedulerResponse.completedRoute program dispatcher registers bit
            carrier)))
      (ExactCheckpointRun.checkpointTime program dispatcher inputBits
        (offset + 1)) activeContext chain)
    (nonempty :
      (CTS.iterate program (offset + 1)
        (CTS.initial program inputBits)).data ≠ [])
    (indexEq : sampleIndex +
        LocalResponse.completedCost program
          (dispatcher.route (registers.phase, bit)) (registers.phase, bit) =
      ExactCheckpointRun.checkpointTime program dispatcher inputBits
        (offset + 1)) :
    ∃ configurations : List
        (SchedulerResponseInvariant.Configuration program dispatcher),
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerResponse.returnConfiguration program dispatcher registers bit
          bits continuation carrier outerParents)
        (SchedulerResponse.frameConfiguration program dispatcher registers bits
          continuation carrier outerParents) configurations ∧
      IndexedResponseSampledStates program dispatcher inputBits sampleIndex
        configurations ∧
      configurations.length =
        LocalResponse.completedCost program
          (dispatcher.route (registers.phase, bit)) (registers.phase, bit) := by
  obtain ⟨configurations, scriptChain, pairs⟩ :=
    normalResponse_exactPairedMutationChain program dispatcher registers bit
      bits continuation carrier outerParents
  have flags := responseEntries_finalFlags program
    (dispatcher.route_valid (registers.phase, bit)) bits continuation carrier
  have lengths := pairs.length_eq
  have entriesLength := responseEntries_length program
    (dispatcher.route_valid (registers.phase, bit)) bits continuation carrier
  have configurationLength : configurations.length =
      LocalResponse.completedCost program
        (dispatcher.route (registers.phase, bit)) (registers.phase, bit) :=
    lengths.trans entriesLength
  have classifications := ResponseSamplePairs.positiveClassificationsAt
    program dispatcher inputBits registers bit bits continuation carrier
    hadmissible snapshotInv offset outerParents layers outer certificate nonempty
    pairs flags (by rw [configurationLength]; exact indexEq)
  have sampled := ResponseSamplePairs.toIndexedSampledStates program dispatcher
    registers bit bits continuation carrier outerParents coherent snapshotInv
    pairs classifications
  have zeroPrefix := SchedulerResponse.enterResponse_zeroRun program dispatcher
    registers bit bits continuation carrier outerParents bitEq
  exact ⟨configurations, ExactMutationChain.prepend zeroPrefix scriptChain,
    sampled, configurationLength⟩

/-- Exact terminal response segment whose completed fresh Local is rejected
until the marker contraction. -/
theorem preMarkerResponseSegmentAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) (registers : Registers program) (bit : Bool)
    (bits : List Bool) (continuation carrier : Term) (sampleIndex : Nat)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers)
    {phase : CTS.Phase program} {scanned : List Bool} {emptyMode : Bool}
    (bitEq : registers.bit = some bit)
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    (hadmissible : Carrier.Admissible continuation)
    (snapshotInv : ReachableAudit.Holds program dispatcher.tree bits
      continuation carrier)
    (preMarker : CheckpointExclusion.PreMarkerEmptyShape program
      dispatcher.tree
      (Cursor.rebuild outerParents
        (LocalResponse.completed bits continuation carrier
          (SchedulerResponse.completedRoute program dispatcher registers bit
            carrier)))) :
    ∃ configurations : List
        (SchedulerResponseInvariant.Configuration program dispatcher),
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerResponse.returnConfiguration program dispatcher registers bit
          bits continuation carrier outerParents)
        (SchedulerResponse.frameConfiguration program dispatcher registers bits
          continuation carrier outerParents) configurations ∧
      IndexedResponseSampledStates program dispatcher inputBits sampleIndex
        configurations ∧
      configurations.length =
        LocalResponse.completedCost program
          (dispatcher.route (registers.phase, bit)) (registers.phase, bit) := by
  obtain ⟨configurations, scriptChain, pairs⟩ :=
    normalResponse_exactPairedMutationChain program dispatcher registers bit
      bits continuation carrier outerParents
  have flags := responseEntries_finalFlags program
    (dispatcher.route_valid (registers.phase, bit)) bits continuation carrier
  have classifications := ResponseSamplePairs.preMarkerClassificationsAt
    program dispatcher inputBits registers bit bits continuation carrier
    hadmissible snapshotInv outerParents layers outer preMarker
    (sampleIndex := sampleIndex) pairs flags
  have sampled := ResponseSamplePairs.toIndexedSampledStates program dispatcher
    registers bit bits continuation carrier outerParents coherent snapshotInv
    pairs classifications
  have lengths := pairs.length_eq
  have entriesLength := responseEntries_length program
    (dispatcher.route_valid (registers.phase, bit)) bits continuation carrier
  have configurationLength : configurations.length =
      LocalResponse.completedCost program
        (dispatcher.route (registers.phase, bit)) (registers.phase, bit) :=
    lengths.trans entriesLength
  have zeroPrefix := SchedulerResponse.enterResponse_zeroRun program dispatcher
    registers bit bits continuation carrier outerParents bitEq
  exact ⟨configurations, ExactMutationChain.prepend zeroPrefix scriptChain,
    sampled, configurationLength⟩

/-- Exact response segment ending in an unfinished arity-three continuation;
all of its contraction samples are decoder-silent. -/
theorem nonterminalResponseSegmentAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) (registers : Registers program) (bit : Bool)
    (bits : List Bool) (continuation carrier : Term) (sampleIndex : Nat)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers)
    {phase : CTS.Phase program} {scanned : List Bool} {emptyMode : Bool}
    (bitEq : registers.bit = some bit)
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    (hadmissible : Carrier.Admissible continuation)
    (snapshotInv : ReachableAudit.Holds program dispatcher.tree bits
      continuation carrier)
    (failure : CheckpointExclusion.EndpointFailure program dispatcher.tree
      continuation) :
    ∃ configurations : List
        (SchedulerResponseInvariant.Configuration program dispatcher),
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerResponse.returnConfiguration program dispatcher registers bit
          bits continuation carrier outerParents)
        (SchedulerResponse.frameConfiguration program dispatcher registers bits
          continuation carrier outerParents) configurations ∧
      IndexedResponseSampledStates program dispatcher inputBits sampleIndex
        configurations ∧
      configurations.length =
        LocalResponse.completedCost program
          (dispatcher.route (registers.phase, bit)) (registers.phase, bit) := by
  obtain ⟨configurations, scriptChain, pairs⟩ :=
    normalResponse_exactPairedMutationChain program dispatcher registers bit
      bits continuation carrier outerParents
  have flags := responseEntries_finalFlags program
    (dispatcher.route_valid (registers.phase, bit)) bits continuation carrier
  have classifications := ResponseSamplePairs.nonterminalClassificationsAt
    program dispatcher inputBits registers bit bits continuation carrier
    hadmissible snapshotInv outerParents layers outer failure
    (sampleIndex := sampleIndex) pairs flags
  have sampled := ResponseSamplePairs.toIndexedSampledStates program dispatcher
    registers bit bits continuation carrier outerParents coherent snapshotInv
    pairs classifications
  have lengths := pairs.length_eq
  have entriesLength := responseEntries_length program
    (dispatcher.route_valid (registers.phase, bit)) bits continuation carrier
  have configurationLength : configurations.length =
      LocalResponse.completedCost program
        (dispatcher.route (registers.phase, bit)) (registers.phase, bit) :=
    lengths.trans entriesLength
  have zeroPrefix := SchedulerResponse.enterResponse_zeroRun program dispatcher
    registers bit bits continuation carrier outerParents bitEq
  exact ⟨configurations, ExactMutationChain.prepend zeroPrefix scriptChain,
    sampled, configurationLength⟩

/-- Exact response samples below a positive pending stack and an arbitrary
completed outer continuation prefix. -/
def PendingResponseSegmentAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) (registers : Registers program) (bit : Bool)
    (seedBits : List Bool) (continuation carrier : Term)
    (depth sampleIndex : Nat) (outerParents : List ParentFrame) : Prop :=
  exists configurations : List
      (SchedulerResponseInvariant.Configuration program dispatcher),
    ExactMutationChain (SchedulerControl.machine program dispatcher)
      (SchedulerResponse.returnConfiguration program dispatcher registers bit
        seedBits continuation carrier
        (PrimitiveFuel.pendingParents
          (environmentCode (compileActions program dispatcher.tree) seedBits)
          continuation depth outerParents))
      (SchedulerResponse.frameConfiguration program dispatcher registers
        seedBits continuation carrier
        (PrimitiveFuel.pendingParents
          (environmentCode (compileActions program dispatcher.tree) seedBits)
          continuation depth outerParents))
      configurations /\
    IndexedResponseSampledStates program dispatcher inputBits sampleIndex
      configurations /\
    configurations.length =
      LocalResponse.completedCost program
        (dispatcher.route (registers.phase, bit)) (registers.phase, bit) /\
    SchedulerProductivity.ExistentialAdvance program dispatcher inputBits
      sampleIndex configurations.length
      (SchedulerResponse.frameConfiguration program dispatcher registers
        seedBits continuation carrier
        (PrimitiveFuel.pendingParents
          (environmentCode (compileActions program dispatcher.tree) seedBits)
          continuation depth outerParents))

/-- Construction of the complete classified response segment below a positive
pending depth and a completed outer zipper. -/
theorem pendingResponseSegmentAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits : List Bool) (registers : Registers program) (bit : Bool)
    (seedBits : List Bool) (continuation carrier : Term)
    (depth sampleIndex : Nat) (positive : depth ≠ 0)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers)
    {phase : CTS.Phase program} {scanned : List Bool} {emptyMode : Bool}
    (bitEq : registers.bit = some bit)
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    (snapshotInv : ReachableAudit.Holds program dispatcher.tree seedBits
      continuation carrier) :
    PendingResponseSegmentAt program dispatcher inputBits registers bit seedBits
      continuation carrier depth sampleIndex outerParents := by
  let parents := PrimitiveFuel.pendingParents
    (environmentCode (compileActions program dispatcher.tree) seedBits)
    continuation depth outerParents
  obtain ⟨configurations, scriptChain, pairs⟩ :=
    normalResponse_exactPairedMutationChain program dispatcher registers bit
      seedBits continuation carrier parents
  have classifications := ResponseSamplePairs.toClassifications program
    dispatcher inputBits registers bit seedBits continuation carrier parents
    (sampleIndex := sampleIndex) pairs
    (fun index pc cursor done term position eraseEq root =>
      ResponseSamplePairs.pendingClassificationAt program dispatcher inputBits
        seedBits continuation index depth positive outerParents layers outer
        eraseEq)
  have sampled := ResponseSamplePairs.toIndexedSampledStates program dispatcher
    registers bit seedBits continuation carrier parents coherent snapshotInv
    pairs classifications
  have zeroPrefix := SchedulerResponse.enterResponse_zeroRun program dispatcher
    registers bit seedBits continuation carrier parents bitEq
  have chain := ExactMutationChain.prepend zeroPrefix scriptChain
  have lengths := pairs.length_eq
  have entriesLength := responseEntries_length program
    (dispatcher.route_valid (registers.phase, bit)) seedBits continuation carrier
  have configurationLength : configurations.length =
      LocalResponse.completedCost program
        (dispatcher.route (registers.phase, bit)) (registers.phase, bit) :=
    lengths.trans entriesLength
  exact ⟨configurations, by simpa [parents] using chain, sampled,
    configurationLength,
    ExactMutationChain.toExistentialAdvance program dispatcher inputBits
      sampleIndex chain sampled⟩

/-! ## Exact selected responses -/

/-- One selected nonempty response with at least one further pending frame.
The returned list contains the C4 sample followed by every route/action sample,
at their exact successive global indices. -/
theorem selectedPendingSegmentAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits seedBits : List Bool) (continuation source : Term)
    (hadmissible : Carrier.Admissible continuation)
    (registers : Registers program) (phase : CTS.Phase program)
    (coherent : RegistersCoherent registers phase [] false)
    (bit : Bool) (suffix : List Bool) (remaining sampleIndex : Nat)
    (remainingPositive : remaining ≠ 0)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers)
    {outerContext fullContext innerContext targetContext : Context}
    {ticks : Nat}
    (trace : SelectedResponseTrace program dispatcher seedBits continuation
      source hadmissible registers bit suffix outerContext fullContext
      innerContext targetContext
      (PrimitiveFuel.pendingParents
        (environmentCode (compileActions program dispatcher.tree) seedBits)
        continuation remaining outerParents) ticks) :
    ∃ configurations : List (Configuration program dispatcher),
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (selectedReturnConfiguration program dispatcher registers bit suffix
          seedBits continuation (deletedCarrier bit outerContext innerContext)
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program dispatcher.tree) seedBits)
            continuation remaining outerParents))
        (upConfiguration program dispatcher registers omega
          (ContextCursor.frames fullContext omega
            (.right (SchedulerResponse.pendingFunction program dispatcher
              seedBits continuation) ::
              PrimitiveFuel.pendingParents
                (environmentCode
                  (compileActions program dispatcher.tree) seedBits)
                continuation remaining outerParents))) configurations ∧
      IndexedResponseSampledStates program dispatcher inputBits sampleIndex
        configurations ∧
      configurations.length =
        1 + LocalResponse.completedCost program
          (dispatcher.route ((scannedRegisters registers bit suffix).phase, bit))
          ((scannedRegisters registers bit suffix).phase, bit) := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) seedBits
  let parents := PrimitiveFuel.pendingParents environment continuation remaining
    outerParents
  let fullParents := .right
    (SchedulerResponse.pendingFunction program dispatcher seedBits continuation) ::
      parents
  let carrier := deletedCarrier bit outerContext innerContext
  let finalRegisters := scannedRegisters registers bit suffix
  let c4 := selectedC4Configuration program dispatcher registers bit
    outerContext innerContext fullParents
  have notSeen : registers.seen = false := by
    simpa using! coherent.seen_eq
  have bitEq : finalRegisters.bit = some bit := by
    exact scannedRegisters_bit registers bit suffix notSeen
  have finalCoherent : RegistersCoherent finalRegisters phase (bit :: suffix)
      false := by
    exact scannedRegisters_coherentAt program registers phase coherent bit suffix
  obtain ⟨c4Bound, c4Found⟩ := selected_seekC4 program dispatcher seedBits
    continuation source hadmissible registers bit suffix parents trace notSeen
  have c4Sample : SampledState program dispatcher inputBits (sampleIndex + 1)
      c4 := by
    simpa [c4, fullParents, parents, environment] using
      (selectedC4_sampledAt program dispatcher inputBits seedBits continuation
        source hadmissible registers phase coherent bit suffix remaining
        sampleIndex outerParents layers outer trace)
  obtain ⟨frameTicks, c4ToFrame⟩ := selectedC4_toFrame_zeroRunAt program
    dispatcher seedBits continuation source hadmissible registers bit suffix
    remaining outerParents trace notSeen
  obtain ⟨responseConfigurations, responseChain, responseSampled,
      responseLength, responseAdvance⟩ :=
    pendingResponseSegmentAt program dispatcher inputBits finalRegisters bit
      seedBits continuation carrier remaining (sampleIndex + 1)
      remainingPositive outerParents layers outer bitEq finalCoherent
      trace.targetHolds
  have responseChain' : ExactMutationChain
      (SchedulerControl.machine program dispatcher)
      (selectedReturnConfiguration program dispatcher registers bit suffix
        seedBits continuation carrier parents)
      (selectedFrameConfiguration program dispatcher registers bit suffix
        seedBits continuation carrier parents) responseConfigurations := by
    simpa [selectedReturnConfiguration, selectedFrameConfiguration,
      finalRegisters, carrier, parents, environment] using responseChain
  have fromC4 := ExactMutationChain.prepend c4ToFrame responseChain'
  have completeChain : ExactMutationChain
      (SchedulerControl.machine program dispatcher)
      (selectedReturnConfiguration program dispatcher registers bit suffix
        seedBits continuation carrier parents)
      (upConfiguration program dispatcher registers omega
        (ContextCursor.frames fullContext omega fullParents))
      (c4 :: responseConfigurations) :=
    .next c4Bound (by simpa [c4, fullParents, parents, environment] using c4Found)
      fromC4
  have completeSampled : IndexedResponseSampledStates program dispatcher
      inputBits sampleIndex (c4 :: responseConfigurations) :=
    .cons sampleIndex c4Sample responseSampled
  have completeLength : (c4 :: responseConfigurations).length =
      1 + LocalResponse.completedCost program
        (dispatcher.route (finalRegisters.phase, bit))
        (finalRegisters.phase, bit) := by
    simp only [List.length_cons]
    rw [responseLength]
    exact Nat.add_comm _ _
  exact ⟨c4 :: responseConfigurations, by
      simpa [carrier, parents, fullParents, finalRegisters, environment] using
        completeChain,
    completeSampled, by simpa [finalRegisters] using completeLength⟩

/-- Compose the selected C4 with any already-classified exact response body at
the corresponding FRAME state.  This is the common operational seam used by
pending, unfinished-continuation, fresh-terminal, and pre-marker branches. -/
theorem selectedSegmentOfResponseAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits seedBits : List Bool) (continuation source : Term)
    (hadmissible : Carrier.Admissible continuation)
    (registers : Registers program) (phase : CTS.Phase program)
    (coherent : RegistersCoherent registers phase [] false)
    (bit : Bool) (suffix : List Bool) (remaining sampleIndex : Nat)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers)
    {outerContext fullContext innerContext targetContext : Context}
    {ticks : Nat}
    (trace : SelectedResponseTrace program dispatcher seedBits continuation
      source hadmissible registers bit suffix outerContext fullContext
      innerContext targetContext
      (PrimitiveFuel.pendingParents
        (environmentCode (compileActions program dispatcher.tree) seedBits)
        continuation remaining outerParents) ticks)
    (responseConfigurations : List (Configuration program dispatcher))
    (responseChain : ExactMutationChain
      (SchedulerControl.machine program dispatcher)
      (selectedReturnConfiguration program dispatcher registers bit suffix
        seedBits continuation (deletedCarrier bit outerContext innerContext)
        (PrimitiveFuel.pendingParents
          (environmentCode (compileActions program dispatcher.tree) seedBits)
          continuation remaining outerParents))
      (selectedFrameConfiguration program dispatcher registers bit suffix
        seedBits continuation (deletedCarrier bit outerContext innerContext)
        (PrimitiveFuel.pendingParents
          (environmentCode (compileActions program dispatcher.tree) seedBits)
          continuation remaining outerParents)) responseConfigurations)
    (responseSampled : IndexedResponseSampledStates program dispatcher inputBits
      (sampleIndex + 1) responseConfigurations) :
    ∃ configurations : List (Configuration program dispatcher),
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (selectedReturnConfiguration program dispatcher registers bit suffix
          seedBits continuation (deletedCarrier bit outerContext innerContext)
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program dispatcher.tree) seedBits)
            continuation remaining outerParents))
        (upConfiguration program dispatcher registers omega
          (ContextCursor.frames fullContext omega
            (.right (SchedulerResponse.pendingFunction program dispatcher
              seedBits continuation) ::
              PrimitiveFuel.pendingParents
                (environmentCode
                  (compileActions program dispatcher.tree) seedBits)
                continuation remaining outerParents))) configurations ∧
      IndexedResponseSampledStates program dispatcher inputBits sampleIndex
        configurations ∧
      configurations.length = responseConfigurations.length + 1 := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) seedBits
  let parents := PrimitiveFuel.pendingParents environment continuation remaining
    outerParents
  let fullParents := .right
    (SchedulerResponse.pendingFunction program dispatcher seedBits continuation) ::
      parents
  let c4 := selectedC4Configuration program dispatcher registers bit
    outerContext innerContext fullParents
  have notSeen : registers.seen = false := by
    simpa using! coherent.seen_eq
  obtain ⟨c4Bound, c4Found⟩ := selected_seekC4 program dispatcher seedBits
    continuation source hadmissible registers bit suffix parents trace notSeen
  have c4Sample : SampledState program dispatcher inputBits (sampleIndex + 1)
      c4 := by
    simpa [c4, fullParents, parents, environment] using
      (selectedC4_sampledAt program dispatcher inputBits seedBits continuation
        source hadmissible registers phase coherent bit suffix remaining
        sampleIndex outerParents layers outer trace)
  obtain ⟨frameTicks, c4ToFrame⟩ := selectedC4_toFrame_zeroRunAt program
    dispatcher seedBits continuation source hadmissible registers bit suffix
    remaining outerParents trace notSeen
  have fromC4 := ExactMutationChain.prepend c4ToFrame responseChain
  have completeChain : ExactMutationChain
      (SchedulerControl.machine program dispatcher)
      (selectedReturnConfiguration program dispatcher registers bit suffix
        seedBits continuation (deletedCarrier bit outerContext innerContext)
        parents)
      (upConfiguration program dispatcher registers omega
        (ContextCursor.frames fullContext omega fullParents))
      (c4 :: responseConfigurations) :=
    .next c4Bound (by simpa [c4, fullParents, parents, environment] using c4Found)
      fromC4
  have completeSampled : IndexedResponseSampledStates program dispatcher
      inputBits sampleIndex (c4 :: responseConfigurations) :=
    .cons sampleIndex c4Sample responseSampled
  exact ⟨c4 :: responseConfigurations, by
      simpa [parents, fullParents, environment] using completeChain,
    completeSampled, by simp [Nat.add_comm]⟩

/-- A selected last response whose continuation still has another clock
wrapper.  Every sample is silent, and the exact list ends at the completed
Local RETURN state under the completed outer prefix. -/
theorem selectedNonterminalSegmentAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits seedBits : List Bool) (stage jobs : Nat) (environment source : Term)
    (registers : Registers program) (phase : CTS.Phase program)
    (coherent : RegistersCoherent registers phase [] false)
    (bit : Bool) (suffix : List Bool) (sampleIndex : Nat)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers)
    {outerContext fullContext innerContext targetContext : Context}
    {ticks : Nat}
    (trace : SelectedResponseTrace program dispatcher seedBits
      (Dovetail.clockExit stage (jobs + 1) environment) source
      (Dovetail.clockExit_admissible stage (jobs + 1) environment)
      registers bit suffix outerContext fullContext innerContext targetContext
      outerParents ticks) :
    ∃ configurations : List (Configuration program dispatcher),
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (selectedReturnConfiguration program dispatcher registers bit suffix
          seedBits (Dovetail.clockExit stage (jobs + 1) environment)
          (deletedCarrier bit outerContext innerContext) outerParents)
        (upConfiguration program dispatcher registers omega
          (ContextCursor.frames fullContext omega
            (.right (SchedulerResponse.pendingFunction program dispatcher
              seedBits (Dovetail.clockExit stage (jobs + 1) environment)) ::
              outerParents))) configurations ∧
      IndexedResponseSampledStates program dispatcher inputBits sampleIndex
        configurations ∧
      configurations.length =
        1 + LocalResponse.completedCost program
          (dispatcher.route ((scannedRegisters registers bit suffix).phase, bit))
          ((scannedRegisters registers bit suffix).phase, bit) := by
  let continuation := Dovetail.clockExit stage (jobs + 1) environment
  let carrier := deletedCarrier bit outerContext innerContext
  let finalRegisters := scannedRegisters registers bit suffix
  have notSeen : registers.seen = false := by
    simpa using! coherent.seen_eq
  have bitEq : finalRegisters.bit = some bit :=
    scannedRegisters_bit registers bit suffix notSeen
  have finalCoherent : RegistersCoherent finalRegisters phase (bit :: suffix)
      false := scannedRegisters_coherentAt program registers phase coherent bit
        suffix
  obtain ⟨responseConfigurations, responseChain, responseSampled,
      responseLength⟩ :=
    nonterminalResponseSegmentAt program dispatcher inputBits finalRegisters bit
      seedBits continuation carrier (sampleIndex + 1) outerParents layers outer
      bitEq finalCoherent (Dovetail.clockExit_admissible stage (jobs + 1)
        environment) trace.targetHolds
      (ResponseSamplePairs.nonterminalClockExit_failure program dispatcher stage
        jobs environment)
  have responseChain' : ExactMutationChain
      (SchedulerControl.machine program dispatcher)
      (selectedReturnConfiguration program dispatcher registers bit suffix
        seedBits continuation carrier outerParents)
      (selectedFrameConfiguration program dispatcher registers bit suffix
        seedBits continuation carrier outerParents) responseConfigurations := by
    simpa [selectedReturnConfiguration, selectedFrameConfiguration,
      finalRegisters, carrier, continuation] using responseChain
  obtain ⟨configurations, chain, sampled, lengthEq⟩ :=
    selectedSegmentOfResponseAt program dispatcher inputBits seedBits
      continuation source (Dovetail.clockExit_admissible stage (jobs + 1)
        environment) registers phase coherent bit suffix 0 sampleIndex
      outerParents layers outer trace responseConfigurations responseChain'
      responseSampled
  refine ⟨configurations, ?_, sampled, ?_⟩
  · simpa [continuation, PrimitiveFuel.pendingParents] using chain
  · rw [lengthEq, responseLength]
    exact Nat.add_comm _ _

/-- The final arity-four job response with nonempty output.  Its last route or
action contraction is the caller-supplied positive checkpoint, and entering
the literal continuation hole extends the certified completed outer zipper by
one fresh Local layer. -/
theorem selectedPositiveTerminalSegmentAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits seedBits : List Bool) (continuation source : Term)
    (hadmissible : Carrier.Admissible continuation)
    (registers : Registers program) (phase : CTS.Phase program)
    (coherent : RegistersCoherent registers phase [] false)
    (bit : Bool) (suffix : List Bool) (sampleIndex offset : Nat)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers)
    {outerContext fullContext innerContext targetContext : Context}
    {ticks : Nat}
    (trace : SelectedResponseTrace program dispatcher seedBits continuation
      source hadmissible registers bit suffix outerContext fullContext
      innerContext targetContext outerParents ticks)
    {activeContext : Context} {checkpointChain : CheckpointDecoder.ChainView program}
    (certificate : CheckpointRun.PositivePrefix program dispatcher inputBits
      (offset + 1)
      (Cursor.rebuild outerParents
        (LocalResponse.completed seedBits continuation
          (deletedCarrier bit outerContext innerContext)
          (SchedulerResponse.completedRoute program dispatcher
            (scannedRegisters registers bit suffix) bit
            (deletedCarrier bit outerContext innerContext))))
      (ExactCheckpointRun.checkpointTime program dispatcher inputBits
        (offset + 1)) activeContext checkpointChain)
    (nonempty :
      (CTS.iterate program (offset + 1)
        (CTS.initial program inputBits)).data ≠ [])
    (indexEq : sampleIndex +
        (1 + LocalResponse.completedCost program
          (dispatcher.route ((scannedRegisters registers bit suffix).phase, bit))
          ((scannedRegisters registers bit suffix).phase, bit)) =
      ExactCheckpointRun.checkpointTime program dispatcher inputBits
        (offset + 1)) :
    ∃ configurations : List (Configuration program dispatcher),
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (selectedReturnConfiguration program dispatcher registers bit suffix
          seedBits continuation (deletedCarrier bit outerContext innerContext)
          outerParents)
        (upConfiguration program dispatcher registers omega
          (ContextCursor.frames fullContext omega
            (.right (SchedulerResponse.pendingFunction program dispatcher
              seedBits continuation) :: outerParents))) configurations ∧
      IndexedResponseSampledStates program dispatcher inputBits sampleIndex
        configurations ∧
      configurations.length =
        1 + LocalResponse.completedCost program
          (dispatcher.route ((scannedRegisters registers bit suffix).phase, bit))
          ((scannedRegisters registers bit suffix).phase, bit) ∧
      CompletedParents program dispatcher
        (SchedulerRootContinuation.freshContinuationParents program dispatcher
          (scannedRegisters registers bit suffix) bit seedBits
          (deletedCarrier bit outerContext innerContext) outerParents)
        (layers + 1) := by
  let carrier := deletedCarrier bit outerContext innerContext
  let finalRegisters := scannedRegisters registers bit suffix
  have notSeen : registers.seen = false := by
    simpa using! coherent.seen_eq
  have bitEq : finalRegisters.bit = some bit :=
    scannedRegisters_bit registers bit suffix notSeen
  have finalCoherent : RegistersCoherent finalRegisters phase (bit :: suffix)
      false := scannedRegisters_coherentAt program registers phase coherent bit
        suffix
  have responseIndex : (sampleIndex + 1) +
        LocalResponse.completedCost program
          (dispatcher.route (finalRegisters.phase, bit))
          (finalRegisters.phase, bit) =
      ExactCheckpointRun.checkpointTime program dispatcher inputBits
        (offset + 1) := by
    simpa [Nat.add_assoc] using indexEq
  obtain ⟨responseConfigurations, responseChain, responseSampled,
      responseLength⟩ :=
    positiveResponseSegmentAt program dispatcher inputBits finalRegisters bit
      seedBits continuation carrier (sampleIndex + 1) offset outerParents layers
      outer bitEq finalCoherent hadmissible trace.targetHolds certificate
      nonempty responseIndex
  have responseChain' : ExactMutationChain
      (SchedulerControl.machine program dispatcher)
      (selectedReturnConfiguration program dispatcher registers bit suffix
        seedBits continuation carrier outerParents)
      (selectedFrameConfiguration program dispatcher registers bit suffix
        seedBits continuation carrier outerParents) responseConfigurations := by
    simpa [selectedReturnConfiguration, selectedFrameConfiguration,
      finalRegisters, carrier] using responseChain
  obtain ⟨configurations, chain, sampled, lengthEq⟩ :=
    selectedSegmentOfResponseAt program dispatcher inputBits seedBits
      continuation source hadmissible registers phase coherent bit suffix 0
      sampleIndex outerParents layers outer trace responseConfigurations
      responseChain' responseSampled
  refine ⟨configurations, by
      simpa [PrimitiveFuel.pendingParents, carrier] using chain,
    sampled, ?_, ?_⟩
  · rw [lengthEq, responseLength]
    exact Nat.add_comm _ _
  · exact outer.fresh finalRegisters bit seedBits carrier

/-- The parser, CTS queue, and completed-zipper facts at a named fresh
checkpoint.  This package deliberately contains no global reduction prefix. -/
def FreshTerminalData
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (seedBits : List Bool) (horizon : Nat)
    (checkpoint : Configuration program dispatcher)
    (nextParents : List ParentFrame) (layers : Nat) : Prop :=
  ∃ (result : CheckpointDecoder.PositiveView program)
    (shape : CheckpointExclusion.TerminalCheckpointShape program
      dispatcher.tree .fresh result checkpoint.cursor.erase),
    shape.chain.layers = layers ∧
    shape.chain.terminal = CheckpointRun.terminalView horizon seedBits ∧
    result.queue =
      (CTS.iterate program horizon (CTS.initial program seedBits)).data ∧
    CompletedParents program dispatcher nextParents layers

namespace FreshTerminalData

/-- The semantic package depends on a checkpoint configuration only through
its erased cursor, so it transports to the actual last script configuration. -/
theorem of_checkpointErase
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {seedBits : List Bool} {horizon : Nat}
    {checkpoint replacement : Configuration program dispatcher}
    {nextParents : List ParentFrame} {layers : Nat}
    (data : FreshTerminalData program dispatcher seedBits horizon checkpoint
      nextParents layers)
    (eraseEq : replacement.cursor.erase = checkpoint.cursor.erase) :
    FreshTerminalData program dispatcher seedBits horizon replacement
      nextParents layers := by
  obtain ⟨result, shape, chainLayers, terminal, queue, completed⟩ := data
  let replacementShape : CheckpointExclusion.TerminalCheckpointShape program
      dispatcher.tree .fresh result replacement.cursor.erase :=
    { chain := shape.chain
      chainShape := by
        rw [eraseEq]
        exact shape.chainShape
      phase := shape.phase
      carrier := shape.carrier
      marker := shape.marker
      result_eq := shape.result_eq
      status_eq := shape.status_eq }
  exact ⟨result, replacementShape, chainLayers, terminal, queue, completed⟩

end FreshTerminalData

/-- Endpoint-local parser data for a fresh final response, constructed without
assuming a global positive-prefix certificate.  The response is the transition
from the exact `offset` iterate, so its queue is literally iterate `offset+1`;
the arbitrary completed outer zipper contributes exactly `layers` more Local
views.  This is the non-circular semantic input used to construct the global
certificate from an exact controller chain. -/
theorem selectedFreshTerminalShapeAt
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
    (nonempty :
      (CTS.iterate program (offset + 1)
        (CTS.initial program seedBits)).data ≠ []) :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) seedBits
    let continuation := Dovetail.clockExit (offset + 1) 0 environment
    let carrier := deletedCarrier bit outerContext innerContext
    let finalRegisters := scannedRegisters registers bit suffix
    let checkpoint := selectedReturnConfiguration program dispatcher registers
      bit suffix seedBits continuation carrier outerParents
    let nextParents :=
      SchedulerRootContinuation.freshContinuationParents program dispatcher
        finalRegisters bit seedBits carrier outerParents
    FreshTerminalData program dispatcher seedBits (offset + 1) checkpoint
      nextParents (layers + 1) := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) seedBits
  let continuation := Dovetail.clockExit (offset + 1) 0 environment
  let carrier := deletedCarrier bit outerContext innerContext
  let finalRegisters := scannedRegisters registers bit suffix
  let checkpoint := selectedReturnConfiguration program dispatcher registers
    bit suffix seedBits continuation carrier outerParents
  let nextParents :=
    SchedulerRootContinuation.freshContinuationParents program dispatcher
      finalRegisters bit seedBits carrier outerParents
  let route := dispatcher.route (finalRegisters.phase, bit)
  let label : ActionLabel program := (finalRegisters.phase, bit)
  let accumulator := actionAccumulator program label carrier
  let completedRoute := SchedulerResponse.completedRoute program dispatcher
    finalRegisters bit carrier
  let terminal := CheckpointRun.terminalView (offset + 1) seedBits
  let view := CheckpointDecoder.completedView program route label accumulator
    seedBits continuation
  let localChain : CheckpointDecoder.ChainView program := ⟨1, terminal, view⟩
  let fullChain := CheckpointRun.addLayers layers localChain
  let result : CheckpointDecoder.PositiveView program :=
    ⟨offset + 1, route, label,
      (CTS.iterate program (offset + 1)
        (CTS.initial program seedBits)).data⟩
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
  have localShape : CheckpointDecoder.ChainShape program dispatcher.tree
      (LocalResponse.completed seedBits continuation carrier completedRoute)
      (.completed localChain) := by
    simpa [localChain, view, route, label, accumulator, completedRoute] using
      (CheckpointDecoder.ChainShape.prepend_response_terminal seedBits dispatch
        terminalShape)
  have fullShape : CheckpointDecoder.ChainShape program dispatcher.tree
      checkpoint.cursor.erase (.completed fullChain) := by
    have wrapped := outer.wrapCompleted localShape
    simpa [checkpoint, selectedReturnConfiguration,
      SchedulerResponse.returnConfiguration, SchedulerResponse.completedCursor,
      SchedulerInvariant.contextOfParents_plug, fullChain] using! wrapped
  have finalCoherent : RegistersCoherent finalRegisters phase (bit :: suffix)
      false := scannedRegisters_coherentAt program registers phase coherent bit
        suffix
  have finalPhase : finalRegisters.phase = phase := finalCoherent.phase_eq
  have stepEq : CTS.absorbingStep program
        ⟨finalRegisters.phase, bit :: suffix⟩ =
      CTS.iterate program (offset + 1) (CTS.initial program seedBits) := by
    calc
      CTS.absorbingStep program ⟨finalRegisters.phase, bit :: suffix⟩ =
          CTS.absorbingStep program ⟨phase, bit :: suffix⟩ := by
            rw [finalPhase]
      _ = CTS.absorbingStep program
          (CTS.iterate program offset (CTS.initial program seedBits)) := by
            rw [currentEq]
      _ = CTS.iterate program (offset + 1)
          (CTS.initial program seedBits) := by
            rw [CTS.iterate_succ]
  have accumulatorDecode : CarrierDecoder.decode? program dispatcher.tree
      seedBits continuation
      (Dovetail.clockExit_admissible (offset + 1) 0 environment) accumulator =
        some ((CTS.iterate program (offset + 1)
          (CTS.initial program seedBits)).data) := by
    have decoded := CarrierActionDecode.decode_actionAccumulator_eq_CTS program
      dispatcher.tree seedBits continuation
      (Dovetail.clockExit_admissible (offset + 1) 0 environment)
      finalRegisters.phase bit trace.targetDecode
    rw [stepEq] at decoded
    simpa [accumulator, label, carrier] using decoded
  have publicDecode : CheckpointDecoder.decodeCarrier? program dispatcher.tree
      accumulator = some ((CTS.iterate program (offset + 1)
        (CTS.initial program seedBits)).data) :=
    CheckpointRun.decodeCarrier?_of_decode program dispatcher.tree seedBits
      continuation
      (Dovetail.clockExit_admissible (offset + 1) 0 environment)
      accumulatorDecode
  have carrierShape : CheckpointDecoder.CarrierDecodes program dispatcher.tree
      accumulator
      (CTS.iterate program (offset + 1)
        (CTS.initial program seedBits)).data :=
    CheckpointDecoder.decodeCarrier?_sound program dispatcher.tree publicDecode
  have phaseShape : label.1 =
      CheckpointDecoder.expectedPhase program terminal.horizon := by
    have currentPhase : phase =
        (CTS.iterate program offset
          (CTS.initial program seedBits)).phase := by
      exact congrArg CTS.Config.phase currentEq
    have expected :=
      CheckpointRun.iterate_phase_eq_expectedPhase program seedBits offset
    simpa [label, terminal, finalPhase] using! currentPhase.trans expected
  have markerShape : CheckpointDecoder.markerCompatible view.status
      (CTS.iterate program (offset + 1)
        (CTS.initial program seedBits)).data = true := by
    cases dataEq : (CTS.iterate program (offset + 1)
        (CTS.initial program seedBits)).data with
    | nil => exact (nonempty dataEq).elim
    | cons head tail =>
        simp [view, CheckpointDecoder.completedView, dataEq,
          CheckpointDecoder.markerCompatible]
  let shape : CheckpointExclusion.TerminalCheckpointShape program
      dispatcher.tree .fresh result checkpoint.cursor.erase :=
    { chain := fullChain
      chainShape := fullShape
      phase := by
        simpa [fullChain, CheckpointRun.addLayers, localChain, view] using!
          phaseShape
      carrier := by
        simpa [fullChain, CheckpointRun.addLayers, localChain, view] using!
          carrierShape
      marker := by
        simpa [fullChain, CheckpointRun.addLayers, localChain, view] using!
          markerShape
      result_eq := rfl
      status_eq := by
        simp [fullChain, CheckpointRun.addLayers, localChain, view,
          CheckpointDecoder.completedView] }
  refine ⟨result, shape, ?_, ?_, rfl, ?_⟩
  · simp [shape, fullChain, CheckpointRun.addLayers, localChain, Nat.add_comm]
  · rfl
  · simpa [nextParents] using
      outer.fresh finalRegisters bit seedBits carrier

/-- Raw exact arity-four response segment.  It names the last contraction
configuration syntactically, carries the cursor-only handoff to next-stage
clock growth, and returns a classifier callback.  The callback is invoked only
after the enclosing exact prefix has produced the positive-prefix certificate,
so the construction has no semantic circularity. -/
theorem selectedFreshTerminalRawSegmentAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits seedBits : List Bool) (offset : Nat)
    (registers : Registers program) (phase : CTS.Phase program)
    (coherent : RegistersCoherent registers phase [] false)
    (bit : Bool) (suffix : List Bool) (sampleIndex : Nat)
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
    (nextBit : Bool) (nextSuffix : List Bool)
    (dataEq :
      (CTS.absorbingStep program ⟨registers.phase, bit :: suffix⟩).data =
        nextBit :: nextSuffix)
    (globalNonempty :
      (CTS.iterate program (offset + 1)
        (CTS.initial program inputBits)).data ≠ []) :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) seedBits
    let continuation := Dovetail.clockExit (offset + 1) 0 environment
    let carrier := deletedCarrier bit outerContext innerContext
    let finalRegisters := scannedRegisters registers bit suffix
    let nextParents :=
      SchedulerRootContinuation.freshContinuationParents program dispatcher
        finalRegisters bit seedBits carrier outerParents
    ∃ leading checkpoint configurations,
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerRootContinuation.freshNextStageSourceConfiguration program
          dispatcher finalRegisters bit seedBits (offset + 1) environment carrier
          outerParents)
        (upConfiguration program dispatcher registers omega
          (ContextCursor.frames fullContext omega
            (.right (SchedulerResponse.pendingFunction program dispatcher
              seedBits continuation) :: outerParents))) configurations ∧
      configurations = leading ++ [checkpoint] ∧
      checkpoint.cursor.erase = Cursor.rebuild outerParents
        (LocalResponse.completed seedBits continuation carrier
          (SchedulerResponse.completedRoute program dispatcher finalRegisters
            bit carrier)) ∧
      configurations.length =
        1 + LocalResponse.completedCost program
          (dispatcher.route (finalRegisters.phase, bit))
          (finalRegisters.phase, bit) ∧
      CompletedParents program dispatcher nextParents (layers + 1) ∧
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
  let nextParents :=
    SchedulerRootContinuation.freshContinuationParents program dispatcher
      finalRegisters bit seedBits carrier outerParents
  let fullParents :=
    .right (SchedulerResponse.pendingFunction program dispatcher seedBits
      continuation) :: outerParents
  let c4 := selectedC4Configuration program dispatcher registers bit
    outerContext innerContext fullParents
  have notSeen : registers.seen = false := by
    simpa using! coherent.seen_eq
  have noTail : registers.tail = false := by
    simpa using! coherent.tail_eq
  have bitEq : finalRegisters.bit = some bit := by
    simpa [finalRegisters] using
      scannedRegisters_bit registers bit suffix notSeen
  have finalCoherent : RegistersCoherent finalRegisters phase (bit :: suffix)
      false := scannedRegisters_coherentAt program registers phase coherent bit
        suffix
  have outputEq : SchedulerControl.outputEmpty program finalRegisters bit =
      false := by
    have exactOutput := outputEmpty_scannedRegisters program registers bit suffix
      notSeen noTail
    rw [dataEq] at exactOutput
    simpa [finalRegisters] using exactOutput
  obtain ⟨responseConfigurations, responseChain, pairs⟩ :=
    normalResponse_exactPairedMutationChain program dispatcher finalRegisters bit
      seedBits continuation carrier outerParents
  have flags := responseEntries_finalFlags program
    (dispatcher.route_valid (finalRegisters.phase, bit)) seedBits continuation
    carrier
  have responseLength : responseConfigurations.length =
      LocalResponse.completedCost program
        (dispatcher.route (finalRegisters.phase, bit))
        (finalRegisters.phase, bit) :=
    pairs.length_eq.trans
      (responseEntries_length program
        (dispatcher.route_valid (finalRegisters.phase, bit)) seedBits
        continuation carrier)
  have entered := SchedulerResponse.enterResponse_zeroRun program dispatcher
    finalRegisters bit seedBits continuation carrier outerParents bitEq
  have responseFromFrame : ExactMutationChain
      (SchedulerControl.machine program dispatcher)
      (selectedReturnConfiguration program dispatcher registers bit suffix
        seedBits continuation carrier outerParents)
      (selectedFrameConfiguration program dispatcher registers bit suffix
        seedBits continuation carrier outerParents) responseConfigurations := by
    have prefixed := ExactMutationChain.prepend entered responseChain
    simpa [selectedReturnConfiguration, selectedFrameConfiguration,
      finalRegisters, carrier] using prefixed
  obtain ⟨c4Bound, c4Found⟩ := selected_seekC4 program dispatcher seedBits
    continuation source
      (Dovetail.clockExit_admissible (offset + 1) 0 environment)
    registers bit suffix outerParents trace notSeen
  obtain ⟨frameTicks, c4ToFrame⟩ := selectedC4_toFrame_zeroRunAt program
    dispatcher seedBits continuation source
      (Dovetail.clockExit_admissible (offset + 1) 0 environment)
    registers bit suffix 0 outerParents trace notSeen
  have afterC4 := ExactMutationChain.prepend c4ToFrame responseFromFrame
  have selectedChain : ExactMutationChain
      (SchedulerControl.machine program dispatcher)
      (selectedReturnConfiguration program dispatcher registers bit suffix
        seedBits continuation carrier outerParents)
      (upConfiguration program dispatcher registers omega
        (ContextCursor.frames fullContext omega fullParents))
      (c4 :: responseConfigurations) :=
    .next c4Bound (by simpa [c4, fullParents, environment] using c4Found)
      afterC4
  have pendingReject : SchedulerControl.compiledProbeAnswer program dispatcher
      (.pending .normalReturn)
      (SchedulerResponse.completedCursor program dispatcher finalRegisters bit
        seedBits continuation carrier outerParents) = false := by
    simpa [SchedulerResponse.completedCursor] using
      outer.pendingReject .normalReturn
        (LocalResponse.completed seedBits continuation carrier
          (SchedulerResponse.completedRoute program dispatcher finalRegisters bit
            carrier))
  have handoff := SchedulerRootContinuation.freshReturn_exactMutationChain
    program dispatcher finalRegisters bit seedBits (offset + 1) environment
      carrier outerParents bitEq outputEq pendingReject
  have completeChain := SchedulerRecurrence.ExactMutationChain.append
    selectedChain handoff
  obtain ⟨responseLeading, checkpoint, responseEq, checkpointEq⟩ :=
    ResponseSamplePairs.terminalDecomposition program dispatcher finalRegisters
      bit seedBits continuation carrier outerParents pairs flags
  let leading := c4 :: responseLeading
  let configurations := c4 :: responseConfigurations
  have configurationsEq : configurations = leading ++ [checkpoint] := by
    simp [configurations, leading, responseEq]
  have configurationsLength : configurations.length =
      1 + LocalResponse.completedCost program
        (dispatcher.route (finalRegisters.phase, bit))
        (finalRegisters.phase, bit) := by
    simp [configurations, responseLength, Nat.add_comm]
  have nextOuter : CompletedParents program dispatcher nextParents
      (layers + 1) := by
    simpa [nextParents] using outer.fresh finalRegisters bit seedBits carrier
  refine ⟨leading, checkpoint, configurations, ?_, configurationsEq,
    checkpointEq, configurationsLength, nextOuter, ?_⟩
  · simpa [configurations, fullParents, continuation, environment,
      finalRegisters, carrier] using completeChain
  · intro activeContext checkpointChain certificate indexEq
    have terminalCertificate : CheckpointRun.PositivePrefix program dispatcher
        inputBits (offset + 1)
        (Cursor.rebuild outerParents
          (LocalResponse.completed seedBits continuation carrier
            (SchedulerResponse.completedRoute program dispatcher finalRegisters
              bit carrier)))
        (ExactCheckpointRun.checkpointTime program dispatcher inputBits
          (offset + 1)) activeContext checkpointChain := by
      rw [← checkpointEq]
      exact certificate
    have responseIndex : (sampleIndex + 1) +
        responseConfigurations.length =
          ExactCheckpointRun.checkpointTime program dispatcher inputBits
            (offset + 1) := by
      rw [responseLength]
      rw [configurationsLength] at indexEq
      simpa [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using indexEq
    have classifications := ResponseSamplePairs.positiveClassificationsAt
      program dispatcher inputBits finalRegisters bit seedBits continuation
      carrier
      (Dovetail.clockExit_admissible (offset + 1) 0 environment)
      trace.targetHolds offset outerParents layers outer terminalCertificate
      globalNonempty pairs flags responseIndex
    have responseSampled := ResponseSamplePairs.toIndexedSampledStates program
      dispatcher finalRegisters bit seedBits continuation carrier outerParents
      finalCoherent trace.targetHolds pairs classifications
    have c4Sample : SampledState program dispatcher inputBits (sampleIndex + 1)
        c4 := by
      simpa [c4, fullParents, continuation, environment] using!
        (selectedC4_sampledAt program dispatcher inputBits seedBits continuation
          source (Dovetail.clockExit_admissible (offset + 1) 0 environment)
          registers phase coherent bit suffix 0 sampleIndex outerParents layers
          outer trace)
    exact .cons sampleIndex c4Sample responseSampled

/-- The final arity-four job response with empty output.  The fresh completed
response is rejected, the following registered marker is the unique positive
checkpoint, and the exact cursor-only suffix enters next-stage clock growth
inside a newly certified marked Local layer. -/
theorem selectedMarkedTerminalSegmentAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits seedBits : List Bool) (stage : Nat) (environment source : Term)
    (registers : Registers program) (phase : CTS.Phase program)
    (coherent : RegistersCoherent registers phase [] false)
    (bit : Bool) (suffix : List Bool) (sampleIndex offset : Nat)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers)
    {outerContext fullContext innerContext targetContext : Context}
    {ticks : Nat}
    (trace : SelectedResponseTrace program dispatcher seedBits
      (Dovetail.clockExit stage 0 environment) source
      (Dovetail.clockExit_admissible stage 0 environment)
      registers bit suffix outerContext fullContext innerContext targetContext
      outerParents ticks)
    (dataEq :
      (CTS.absorbingStep program ⟨registers.phase, bit :: suffix⟩).data = [])
    (preMarker : CheckpointExclusion.PreMarkerEmptyShape program
      dispatcher.tree
      (Cursor.rebuild outerParents
        (LocalResponse.completed seedBits
          (Dovetail.clockExit stage 0 environment)
          (deletedCarrier bit outerContext innerContext)
          (SchedulerResponse.completedRoute program dispatcher
            (scannedRegisters registers bit suffix) bit
            (deletedCarrier bit outerContext innerContext)))))
    {result : CheckpointDecoder.PositiveView program}
    (terminal : CheckpointExclusion.TerminalCheckpointShape program
      dispatcher.tree .marked result
      (SchedulerRootContinuation.normalMarkerMutationConfiguration program
        dispatcher (scannedRegisters registers bit suffix) bit seedBits
        (Dovetail.clockExit stage 0 environment)
        (deletedCarrier bit outerContext innerContext) outerParents).cursor.erase)
    {activeContext : Context} {checkpointChain : CheckpointDecoder.ChainView program}
    (certificate : CheckpointRun.PositivePrefix program dispatcher inputBits
      (offset + 1)
      (SchedulerRootContinuation.normalMarkerMutationConfiguration program
        dispatcher (scannedRegisters registers bit suffix) bit seedBits
        (Dovetail.clockExit stage 0 environment)
        (deletedCarrier bit outerContext innerContext) outerParents).cursor.erase
      (ExactCheckpointRun.checkpointTime program dispatcher inputBits
        (offset + 1)) activeContext checkpointChain)
    (indexEq : sampleIndex +
        ((1 + LocalResponse.completedCost program
          (dispatcher.route ((scannedRegisters registers bit suffix).phase, bit))
          ((scannedRegisters registers bit suffix).phase, bit)) + 1) =
      ExactCheckpointRun.checkpointTime program dispatcher inputBits
        (offset + 1)) :
    ∃ configurations : List (Configuration program dispatcher),
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerRootContinuation.markedNextStageSourceConfiguration program
          dispatcher (scannedRegisters registers bit suffix) bit seedBits stage
          environment (deletedCarrier bit outerContext innerContext)
          outerParents)
        (upConfiguration program dispatcher registers omega
          (ContextCursor.frames fullContext omega
            (.right (SchedulerResponse.pendingFunction program dispatcher
              seedBits (Dovetail.clockExit stage 0 environment)) ::
              outerParents))) configurations ∧
      IndexedResponseSampledStates program dispatcher inputBits sampleIndex
        configurations ∧
      configurations.length =
        (1 + LocalResponse.completedCost program
          (dispatcher.route ((scannedRegisters registers bit suffix).phase, bit))
          ((scannedRegisters registers bit suffix).phase, bit)) + 1 ∧
      CompletedParents program dispatcher
        (SchedulerRootContinuation.markedContinuationParents program dispatcher
          (scannedRegisters registers bit suffix) bit seedBits
          (deletedCarrier bit outerContext innerContext) outerParents)
        (layers + 1) := by
  let continuation := Dovetail.clockExit stage 0 environment
  let carrier := deletedCarrier bit outerContext innerContext
  let finalRegisters := scannedRegisters registers bit suffix
  let marker :=
    SchedulerRootContinuation.normalMarkerMutationConfiguration program
      dispatcher finalRegisters bit seedBits continuation carrier outerParents
  have notSeen : registers.seen = false := by
    simpa using! coherent.seen_eq
  have noTail : registers.tail = false := by
    simpa using! coherent.tail_eq
  have bitEq : finalRegisters.bit = some bit :=
    scannedRegisters_bit registers bit suffix notSeen
  have finalCoherent : RegistersCoherent finalRegisters phase (bit :: suffix)
      false := scannedRegisters_coherentAt program registers phase coherent bit
        suffix
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
      bitEq finalCoherent (Dovetail.clockExit_admissible stage 0 environment)
      trace.targetHolds (by simpa [continuation, carrier, finalRegisters] using
        preMarker)
  have responseChain' : ExactMutationChain
      (SchedulerControl.machine program dispatcher)
      (selectedReturnConfiguration program dispatcher registers bit suffix
        seedBits continuation carrier outerParents)
      (selectedFrameConfiguration program dispatcher registers bit suffix
        seedBits continuation carrier outerParents) responseConfigurations := by
    simpa [selectedReturnConfiguration, selectedFrameConfiguration,
      finalRegisters, carrier, continuation] using responseChain
  obtain ⟨beforeConfigurations, beforeChain, beforeSampled, beforeLength⟩ :=
    selectedSegmentOfResponseAt program dispatcher inputBits seedBits
      continuation source (Dovetail.clockExit_admissible stage 0 environment)
      registers phase coherent bit suffix 0 sampleIndex outerParents layers outer
      trace responseConfigurations responseChain' responseSampled
  have outputEq : SchedulerControl.outputEmpty program finalRegisters bit =
      true := by
    have exactOutput := outputEmpty_scannedRegisters program registers bit suffix
      notSeen noTail
    rw [dataEq] at exactOutput
    simpa [finalRegisters] using exactOutput
  have markerChain : ExactMutationChain
      (SchedulerControl.machine program dispatcher)
      (SchedulerRootContinuation.markedNextStageSourceConfiguration program
        dispatcher finalRegisters bit seedBits stage environment carrier
        outerParents)
      (selectedReturnConfiguration program dispatcher registers bit suffix
        seedBits continuation carrier outerParents) [marker] := by
    simpa [selectedReturnConfiguration, finalRegisters, continuation, carrier,
      marker] using
      (SchedulerRootContinuation.markedReturn_exactMutationChain program
        dispatcher finalRegisters bit seedBits stage environment carrier
        outerParents bitEq outputEq pendingReject)
  have markerHolds : Holds program dispatcher marker := by
    simpa [marker, continuation, carrier, finalRegisters] using
      (SchedulerRootContinuation.normalMarker_holds program dispatcher
        finalRegisters bit seedBits continuation carrier outerParents
        finalCoherent trace.targetHolds (by
          simpa [marker, continuation, carrier, finalRegisters] using terminal))
  have markerIndex : sampleIndex + beforeConfigurations.length + 1 =
      ExactCheckpointRun.checkpointTime program dispatcher inputBits
        (offset + 1) := by
    calc
      sampleIndex + beforeConfigurations.length + 1 =
          sampleIndex + ((responseConfigurations.length + 1) + 1) := by
        rw [beforeLength, Nat.add_assoc]
      _ = sampleIndex +
          ((LocalResponse.completedCost program
            (dispatcher.route (finalRegisters.phase, bit))
            (finalRegisters.phase, bit) + 1) + 1) := by
        rw [responseLength]
      _ = sampleIndex +
          ((1 + LocalResponse.completedCost program
            (dispatcher.route (finalRegisters.phase, bit))
            (finalRegisters.phase, bit)) + 1) := by
        rw [Nat.add_comm
          (LocalResponse.completedCost program
            (dispatcher.route (finalRegisters.phase, bit))
            (finalRegisters.phase, bit)) 1]
      _ = _ := by simpa [finalRegisters] using indexEq
  have markerSample : SampledState program dispatcher inputBits
      (sampleIndex + beforeConfigurations.length + 1) marker := by
    simpa [marker, continuation, carrier, finalRegisters] using
      (SchedulerRootContinuation.normalMarker_sampledState program dispatcher
        inputBits (sampleIndex + beforeConfigurations.length + 1) offset
        finalRegisters bit seedBits continuation carrier outerParents
        markerHolds (by simpa [marker, continuation, carrier, finalRegisters]
          using certificate) markerIndex)
  have completeChain := SchedulerRecurrence.ExactMutationChain.append beforeChain
    markerChain
  have completeSampled := SchedulerRecurrence.IndexedResponseSampledStates.appendOne
    program dispatcher inputBits beforeSampled marker markerSample
  refine ⟨beforeConfigurations ++ [marker], ?_, completeSampled, ?_, ?_⟩
  · simpa [continuation, carrier, finalRegisters, marker] using! completeChain
  · simp only [List.length_append, List.length_singleton]
    rw [beforeLength, responseLength]
    simpa [finalRegisters, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
  · exact outer.marked finalRegisters bit seedBits carrier

/-! ## Arity-three handoff between jobs -/

/-- A fresh completed response reaches the literal continuation-check state
without another contraction, for arbitrary outer parents. -/
theorem freshReturn_toCheck_exactMutationChainAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame)
    (bitEq : registers.bit = some bit)
    (outputEq : SchedulerControl.outputEmpty program registers bit = false)
    (pendingReject : SchedulerControl.compiledProbeAnswer program dispatcher
      (.pending .normalReturn)
      (SchedulerResponse.completedCursor program dispatcher registers bit bits
        continuation carrier parents) = false) :
    ExactMutationChain (SchedulerControl.machine program dispatcher)
      (SchedulerContinuation.checkConfiguration program dispatcher
        registers.advance
        (SchedulerResponse.freshContinuationCursor program dispatcher registers
          bit bits continuation carrier parents))
      (SchedulerResponse.returnConfiguration program dispatcher registers bit
        bits continuation carrier parents) [] := by
  have enter := SchedulerResponse.returnNoMark_zeroRun program dispatcher
    registers bit bits continuation carrier parents bitEq outputEq
  have handoff := SchedulerResponse.freshTerminalContinuation_zeroRun program
    dispatcher registers bit bits continuation carrier parents pendingReject
  exact .done _ (by
    simpa [SchedulerContinuation.checkConfiguration] using! enter.trans handoff)

/-- A marked response reaches the continuation-check state with exactly its
one registered marker contraction. -/
theorem markedReturn_toCheck_exactMutationChainAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame)
    (bitEq : registers.bit = some bit)
    (outputEq : SchedulerControl.outputEmpty program registers bit = true)
    (pendingReject : SchedulerControl.compiledProbeAnswer program dispatcher
      (.pending .normalReturn)
      (SchedulerResponse.markedCursor program dispatcher registers bit bits
        continuation carrier parents) = false) :
    ExactMutationChain (SchedulerControl.machine program dispatcher)
      (SchedulerContinuation.checkConfiguration program dispatcher
        registers.advance
        (SchedulerResponse.markedContinuationCursor program dispatcher registers
          bit bits continuation carrier parents))
      (SchedulerResponse.returnConfiguration program dispatcher registers bit
        bits continuation carrier parents)
      [SchedulerRootContinuation.normalMarkerMutationConfiguration program
        dispatcher registers bit bits continuation carrier parents] := by
  have found := SchedulerRootContinuation.markedReturn_seekMarker program
    dispatcher registers bit bits continuation carrier parents bitEq outputEq
  have suffix := SchedulerRootContinuation.normalMarkerSuffix_zeroRun program
    dispatcher registers bit bits continuation carrier parents
  have handoff := SchedulerResponse.markedTerminalContinuation_zeroRun program
    dispatcher registers bit bits continuation carrier parents pendingReject
  exact .next 5 found (.done _ (by
    simpa [SchedulerContinuation.checkConfiguration] using! suffix.trans handoff))

/-- The normal marker remains decoder-silent when its continuation is an
explicit unfinished endpoint below completed outer shells. -/
theorem nonterminalMarker_sampledAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits bits : List Bool) (registers : Registers program) (bit : Bool)
    (continuation carrier : Term) (parents : List ParentFrame)
    (layers sampleIndex : Nat)
    (outer : CompletedParents program dispatcher parents layers)
    {phase : CTS.Phase program} {scanned : List Bool} {emptyMode : Bool}
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    (snapshotInv : ReachableAudit.Holds program dispatcher.tree bits continuation
      carrier)
    (failure : CheckpointExclusion.EndpointFailure program dispatcher.tree
      continuation) :
    SampledState program dispatcher inputBits (sampleIndex + 1)
      (SchedulerRootContinuation.normalMarkerMutationConfiguration program
        dispatcher registers bit bits continuation carrier parents) := by
  let marker := SchedulerRootContinuation.normalMarkerMutationConfiguration
    program dispatcher registers bit bits continuation carrier parents
  let markedTerm := LocalResponse.markedCompleted bits continuation carrier
    (SchedulerResponse.completedRoute program dispatcher registers bit carrier)
  have extended := outer.marked registers bit bits carrier
  have silent : SilentEvidence program dispatcher.tree .return
      marker.cursor.erase := by
    have erased := SchedulerRootContinuation.normalMarkerMutation_erase program
      dispatcher registers bit bits continuation carrier parents
    rw [erased]
    change SilentEvidence program dispatcher.tree .return
      (Cursor.rebuild parents markedTerm)
    rw [← CompletedParents.rebuild_markedContinuationParents program
      dispatcher registers bit bits carrier continuation parents]
    exact extended.silentOfFailure .return failure
  have markedInv : ReachableAudit.Holds program dispatcher.tree bits continuation
      markedTerm := SchedulerResponse.marked_holds program dispatcher registers
        bit bits continuation carrier snapshotInv
  have audit : AuditedOccurrence program dispatcher.tree marker.cursor.erase := by
    refine .intro bits continuation markedTerm
      (SchedulerInvariant.contextOfParents parents) markedInv ?_
    have erased := SchedulerRootContinuation.normalMarkerMutation_erase program
      dispatcher registers bit bits continuation carrier parents
    rw [erased]
    change Cursor.rebuild parents markedTerm =
      (SchedulerInvariant.contextOfParents parents).plug markedTerm
    exact (SchedulerInvariant.contextOfParents_plug parents markedTerm).symm
  have position : ControlPosition program dispatcher
      (.script .markNormal ⟨4, by
        simp [SchedulerControl.jobScript, PrimitiveScripts.mark]⟩ registers)
      marker.cursor := by
    let completed := SchedulerResponse.completedCursor program dispatcher
      registers bit bits continuation carrier parents
    let sample := SchedulerRootContinuation.normalMarkerCursor program dispatcher
      registers bit bits continuation carrier parents
    have prefixRun : Script.run
        (List.take 4
          (SchedulerControl.jobScript program dispatcher .markNormal)) completed =
        some sample := by rfl
    have suffixRun : Script.run
        (List.drop 4
          (SchedulerControl.jobScript program dispatcher .markNormal)) sample =
        some (SchedulerResponse.markedCursor program dispatcher registers bit
          bits continuation carrier parents) := by rfl
    have safe : CommandSafe sample
        (SchedulerControl.transition program dispatcher
          (.script .markNormal ⟨4, by
            simp [SchedulerControl.jobScript, PrimitiveScripts.mark]⟩ registers)
          (Probe.observeNode sample) (Probe.observeIncoming sample)) :=
      ⟨_, rfl⟩
    simpa [marker, sample] using!
      (ControlPosition.script prefixRun suffixRun safe)
  have holds : Holds program dispatcher marker :=
    .intro
      (.script .markNormal ⟨4, by
        simp [SchedulerControl.jobScript, PrimitiveScripts.mark]⟩ registers)
      rfl phase scanned emptyMode coherent position
      (.return (.silent silent) audit)
  exact SampledState.ofSilent
    (.script .markNormal ⟨4, by
      simp [SchedulerControl.jobScript, PrimitiveScripts.mark]⟩ registers)
    holds rfl silent

/-! ## Complete final responses below an unfinished arity-three clock exit -/

/-- A final nonempty response of a nonfinal bounded job reaches the literal
continuation-check state without any mutation after the response.  The exact
sample list therefore has the checked-transition cost, and its continuation
zipper is the old completed prefix extended by one fresh Local layer. -/
theorem selectedFreshNonterminalJobAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits seedBits : List Bool) (stage jobs : Nat) (environment source : Term)
    (registers : Registers program) (phase : CTS.Phase program)
    (coherent : RegistersCoherent registers phase [] false)
    (bit : Bool) (suffix : List Bool) (sampleIndex : Nat)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers)
    {outerContext fullContext innerContext targetContext : Context}
    {ticks : Nat}
    (trace : SelectedResponseTrace program dispatcher seedBits
      (Dovetail.clockExit stage (jobs + 1) environment) source
      (Dovetail.clockExit_admissible stage (jobs + 1) environment)
      registers bit suffix outerContext fullContext innerContext targetContext
      outerParents ticks)
    (nextBit : Bool) (nextSuffix : List Bool)
    (dataEq :
      (CTS.absorbingStep program ⟨registers.phase, bit :: suffix⟩).data =
        nextBit :: nextSuffix) :
    ∃ configurations : List (Configuration program dispatcher),
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerContinuation.checkConfiguration program dispatcher
          (scannedRegisters registers bit suffix).advance
          (SchedulerResponse.freshContinuationCursor program dispatcher
            (scannedRegisters registers bit suffix) bit seedBits
            (Dovetail.clockExit stage (jobs + 1) environment)
            (deletedCarrier bit outerContext innerContext) outerParents))
        (upConfiguration program dispatcher registers omega
          (ContextCursor.frames fullContext omega
            (.right (SchedulerResponse.pendingFunction program dispatcher
              seedBits (Dovetail.clockExit stage (jobs + 1) environment)) ::
              outerParents))) configurations ∧
      IndexedResponseSampledStates program dispatcher inputBits sampleIndex
        configurations ∧
      configurations.length =
        CheckedTransition.totalCost program dispatcher registers.phase
          (bit :: suffix) ∧
      CompletedParents program dispatcher
        (SchedulerRootContinuation.freshContinuationParents program dispatcher
          (scannedRegisters registers bit suffix) bit seedBits
          (deletedCarrier bit outerContext innerContext) outerParents)
        (layers + 1) := by
  let continuation := Dovetail.clockExit stage (jobs + 1) environment
  let carrier := deletedCarrier bit outerContext innerContext
  let finalRegisters := scannedRegisters registers bit suffix
  have notSeen : registers.seen = false := by
    simpa using! coherent.seen_eq
  have noTail : registers.tail = false := by
    simpa using! coherent.tail_eq
  have bitEq : finalRegisters.bit = some bit := by
    simpa [finalRegisters] using
      scannedRegisters_bit registers bit suffix notSeen
  have outputEq : SchedulerControl.outputEmpty program finalRegisters bit =
      false := by
    have exactOutput := outputEmpty_scannedRegisters program registers bit suffix
      notSeen noTail
    rw [dataEq] at exactOutput
    simpa [finalRegisters] using exactOutput
  have finalCoherent : RegistersCoherent finalRegisters phase (bit :: suffix)
      false := scannedRegisters_coherentAt program registers phase coherent bit
        suffix
  have finalPhase : finalRegisters.phase = registers.phase := by
    exact finalCoherent.phase_eq.trans coherent.phase_eq.symm
  have pendingReject : SchedulerControl.compiledProbeAnswer program dispatcher
      (.pending .normalReturn)
      (SchedulerResponse.completedCursor program dispatcher finalRegisters bit
        seedBits continuation carrier outerParents) = false := by
    simpa [SchedulerResponse.completedCursor] using
      outer.pendingReject .normalReturn
        (LocalResponse.completed seedBits continuation carrier
          (SchedulerResponse.completedRoute program dispatcher finalRegisters bit
            carrier))
  obtain ⟨configurations, responseChain, responseSampled, responseLength⟩ :=
    selectedNonterminalSegmentAt program dispatcher inputBits seedBits stage jobs
      environment source registers phase coherent bit suffix sampleIndex
      outerParents layers outer trace
  have handoff : ExactMutationChain
      (SchedulerControl.machine program dispatcher)
      (SchedulerContinuation.checkConfiguration program dispatcher
        finalRegisters.advance
        (SchedulerResponse.freshContinuationCursor program dispatcher
          finalRegisters bit seedBits continuation carrier outerParents))
      (selectedReturnConfiguration program dispatcher registers bit suffix
        seedBits continuation carrier outerParents) [] := by
    simpa [selectedReturnConfiguration, finalRegisters, continuation, carrier]
      using
        (freshReturn_toCheck_exactMutationChainAt program dispatcher
          finalRegisters bit seedBits continuation carrier outerParents bitEq
          outputEq pendingReject)
  have completeChain := SchedulerRecurrence.ExactMutationChain.append
    responseChain handoff
  refine ⟨configurations, ?_, responseSampled, ?_, ?_⟩
  · simpa [continuation, carrier, finalRegisters] using completeChain
  · rw [responseLength]
    rw [CheckedTransition.totalCost_cons, dataEq,
      CheckedTransition.markerCost_cons, Nat.add_zero, finalPhase]
  · exact outer.fresh finalRegisters bit seedBits carrier

/-- A final empty response of a nonfinal bounded job records its one marker
contraction, then reaches the literal continuation-check state.  Every sample
is decoder-silent because the continuation is still an arity-three clock exit;
the exact length is the full checked-transition cost. -/
theorem selectedMarkedNonterminalJobAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits seedBits : List Bool) (stage jobs : Nat) (environment source : Term)
    (registers : Registers program) (phase : CTS.Phase program)
    (coherent : RegistersCoherent registers phase [] false)
    (bit : Bool) (suffix : List Bool) (sampleIndex : Nat)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers)
    {outerContext fullContext innerContext targetContext : Context}
    {ticks : Nat}
    (trace : SelectedResponseTrace program dispatcher seedBits
      (Dovetail.clockExit stage (jobs + 1) environment) source
      (Dovetail.clockExit_admissible stage (jobs + 1) environment)
      registers bit suffix outerContext fullContext innerContext targetContext
      outerParents ticks)
    (dataEq :
      (CTS.absorbingStep program ⟨registers.phase, bit :: suffix⟩).data = []) :
    ∃ configurations : List (Configuration program dispatcher),
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerContinuation.checkConfiguration program dispatcher
          (scannedRegisters registers bit suffix).advance
          (SchedulerResponse.markedContinuationCursor program dispatcher
            (scannedRegisters registers bit suffix) bit seedBits
            (Dovetail.clockExit stage (jobs + 1) environment)
            (deletedCarrier bit outerContext innerContext) outerParents))
        (upConfiguration program dispatcher registers omega
          (ContextCursor.frames fullContext omega
            (.right (SchedulerResponse.pendingFunction program dispatcher
              seedBits (Dovetail.clockExit stage (jobs + 1) environment)) ::
              outerParents))) configurations ∧
      IndexedResponseSampledStates program dispatcher inputBits sampleIndex
        configurations ∧
      configurations.length =
        CheckedTransition.totalCost program dispatcher registers.phase
          (bit :: suffix) ∧
      CompletedParents program dispatcher
        (SchedulerRootContinuation.markedContinuationParents program dispatcher
          (scannedRegisters registers bit suffix) bit seedBits
          (deletedCarrier bit outerContext innerContext) outerParents)
        (layers + 1) := by
  let continuation := Dovetail.clockExit stage (jobs + 1) environment
  let carrier := deletedCarrier bit outerContext innerContext
  let finalRegisters := scannedRegisters registers bit suffix
  let marker := SchedulerRootContinuation.normalMarkerMutationConfiguration
    program dispatcher finalRegisters bit seedBits continuation carrier
    outerParents
  have notSeen : registers.seen = false := by
    simpa using! coherent.seen_eq
  have noTail : registers.tail = false := by
    simpa using! coherent.tail_eq
  have bitEq : finalRegisters.bit = some bit := by
    simpa [finalRegisters] using
      scannedRegisters_bit registers bit suffix notSeen
  have outputEq : SchedulerControl.outputEmpty program finalRegisters bit =
      true := by
    have exactOutput := outputEmpty_scannedRegisters program registers bit suffix
      notSeen noTail
    rw [dataEq] at exactOutput
    simpa [finalRegisters] using exactOutput
  have finalCoherent : RegistersCoherent finalRegisters phase (bit :: suffix)
      false := scannedRegisters_coherentAt program registers phase coherent bit
        suffix
  have finalPhase : finalRegisters.phase = registers.phase := by
    exact finalCoherent.phase_eq.trans coherent.phase_eq.symm
  have pendingReject : SchedulerControl.compiledProbeAnswer program dispatcher
      (.pending .normalReturn)
      (SchedulerResponse.markedCursor program dispatcher finalRegisters bit
        seedBits continuation carrier outerParents) = false := by
    simpa [SchedulerResponse.markedCursor] using
      outer.pendingReject .normalReturn
        (LocalResponse.markedCompleted seedBits continuation carrier
          (SchedulerResponse.completedRoute program dispatcher finalRegisters bit
            carrier))
  obtain ⟨before, responseChain, responseSampled, responseLength⟩ :=
    selectedNonterminalSegmentAt program dispatcher inputBits seedBits stage jobs
      environment source registers phase coherent bit suffix sampleIndex
      outerParents layers outer trace
  have markerChain : ExactMutationChain
      (SchedulerControl.machine program dispatcher)
      (SchedulerContinuation.checkConfiguration program dispatcher
        finalRegisters.advance
        (SchedulerResponse.markedContinuationCursor program dispatcher
          finalRegisters bit seedBits continuation carrier outerParents))
      (selectedReturnConfiguration program dispatcher registers bit suffix
        seedBits continuation carrier outerParents) [marker] := by
    simpa [selectedReturnConfiguration, finalRegisters, continuation, carrier,
      marker] using
      (markedReturn_toCheck_exactMutationChainAt program dispatcher
        finalRegisters bit seedBits continuation carrier outerParents bitEq
        outputEq pendingReject)
  have markerSample : SampledState program dispatcher inputBits
      (sampleIndex + before.length + 1) marker := by
    simpa [marker, continuation, carrier, finalRegisters] using
      (nonterminalMarker_sampledAt program dispatcher inputBits seedBits
        finalRegisters bit continuation carrier outerParents layers
        (sampleIndex + before.length) outer finalCoherent trace.targetHolds
        (ResponseSamplePairs.nonterminalClockExit_failure program dispatcher
          stage jobs environment))
  have completeChain := SchedulerRecurrence.ExactMutationChain.append
    responseChain markerChain
  have completeSampled := SchedulerRecurrence.IndexedResponseSampledStates.appendOne
    program dispatcher inputBits responseSampled marker markerSample
  refine ⟨before ++ [marker], ?_, completeSampled, ?_, ?_⟩
  · simpa [continuation, carrier, finalRegisters, marker] using completeChain
  · simp only [List.length_append, List.length_singleton]
    rw [responseLength]
    rw [CheckedTransition.totalCost_cons, dataEq,
      CheckedTransition.markerCost_empty, finalPhase]
  · exact outer.marked finalRegisters bit seedBits carrier

/-! ## Recursive all-nonempty response sweep -/

/-- Exact checked-transition cost of a forward nonempty response suffix.  This
is the operational order used by the cursor proof; the public `jobCost` is the
same finite sum written with its recursion at the other end. -/
def nonemptySweepCost
    (program : CTS.Program) (dispatcher : ActionDispatcher program) :
    Nat → CTS.Config program → Nat
  | 0, _ => 0
  | count + 1, current =>
      CheckedTransition.totalCost program dispatcher current.phase current.data +
        nonemptySweepCost program dispatcher count
          (CTS.absorbingStep program current)

@[simp]
theorem nonemptySweepCost_zero
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (current : CTS.Config program) :
    nonemptySweepCost program dispatcher 0 current = 0 :=
  rfl

@[simp]
theorem nonemptySweepCost_succ
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (count : Nat) (current : CTS.Config program) :
    nonemptySweepCost program dispatcher (count + 1) current =
      CheckedTransition.totalCost program dispatcher current.phase current.data +
        nonemptySweepCost program dispatcher count
          (CTS.absorbingStep program current) :=
  rfl

/-- The forward cost may equivalently expose its last transition.  This is the
algebraic bridge to the public bounded-job recursion. -/
theorem nonemptySweepCost_succ_last
    (program : CTS.Program) (dispatcher : ActionDispatcher program) :
    ∀ (count : Nat) (current : CTS.Config program),
      nonemptySweepCost program dispatcher (count + 1) current =
        nonemptySweepCost program dispatcher count current +
          CheckedTransition.totalCost program dispatcher
            (CTS.iterate program count current).phase
            (CTS.iterate program count current).data
  | 0, current => by
      simp [nonemptySweepCost]
  | count + 1, current => by
      have shifted : CTS.iterate program count
          (CTS.absorbingStep program current) =
          CTS.iterate program (count + 1) current := by
        rw [CTS.iterate_add]
        rfl
      calc
        nonemptySweepCost program dispatcher ((count + 1) + 1) current =
            CheckedTransition.totalCost program dispatcher current.phase
                current.data +
              nonemptySweepCost program dispatcher (count + 1)
                (CTS.absorbingStep program current) := rfl
        _ = CheckedTransition.totalCost program dispatcher current.phase
                current.data +
              (nonemptySweepCost program dispatcher count
                  (CTS.absorbingStep program current) +
                CheckedTransition.totalCost program dispatcher
                  (CTS.iterate program count
                    (CTS.absorbingStep program current)).phase
                  (CTS.iterate program count
                    (CTS.absorbingStep program current)).data) := by
            rw [nonemptySweepCost_succ_last program dispatcher count
              (CTS.absorbingStep program current)]
        _ = (CheckedTransition.totalCost program dispatcher current.phase
                current.data +
              nonemptySweepCost program dispatcher count
                (CTS.absorbingStep program current)) +
            CheckedTransition.totalCost program dispatcher
              (CTS.iterate program (count + 1) current).phase
              (CTS.iterate program (count + 1) current).data := by
            rw [shifted, Nat.add_assoc]
        _ = nonemptySweepCost program dispatcher (count + 1) current +
            CheckedTransition.totalCost program dispatcher
              (CTS.iterate program (count + 1) current).phase
              (CTS.iterate program (count + 1) current).data := rfl

/-- On the initial CTS configuration, the forward response sum is exactly the
executable public `jobCost`. -/
theorem nonemptySweepCost_initial_eq_jobCost
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (seedBits : List Bool) : ∀ fuel,
      nonemptySweepCost program dispatcher fuel (CTS.initial program seedBits) =
        ExactCheckpointRun.jobCost program dispatcher seedBits fuel
  | 0 => rfl
  | fuel + 1 => by
      rw [nonemptySweepCost_succ_last, ExactCheckpointRun.jobCost_succ,
        nonemptySweepCost_initial_eq_jobCost program dispatcher seedBits fuel]

/-- The last Base-producing fuel sample of a positive nonempty job reaches the
first selected-front UP source without another contraction.  The returned
response trace fixes every descent and selected-front context used by the
whole-job aggregate. -/
theorem nonemptyBase_toSelected_zeroRunAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation)
    (remaining : Nat) (outerParents : List ParentFrame) :
    let bits := bit :: suffix
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    ∃ outerContext fullContext innerContext targetContext descentTicks
        responseTicks,
      SelectedResponseTrace program dispatcher bits continuation
        (baseCarrier environment continuation) hadmissible
        (Registers.newJob program).clearScan bit suffix outerContext fullContext
        innerContext targetContext
        (PrimitiveFuel.pendingParents environment continuation remaining
          outerParents) responseTicks ∧
      ZeroMutationRun (SchedulerControl.machine program dispatcher) descentTicks
        (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher bits
          (Registers.newJob program) continuation outerParents (remaining + 1) 0)
        (upConfiguration program dispatcher
          (Registers.newJob program).clearScan omega
          (ContextCursor.frames fullContext omega
            (PrimitiveFuel.pendingParents environment continuation
              (remaining + 1) outerParents))) := by
  let bits := bit :: suffix
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let fullParents := PrimitiveFuel.pendingParents environment continuation
    (remaining + 1) outerParents
  let restParents := PrimitiveFuel.pendingParents environment continuation
    remaining outerParents
  obtain ⟨baseContext, baseDescent⟩ :=
    baseCarrier_descent program dispatcher bits continuation
  obtain ⟨outerContext, selected⟩ := baseDescent.selectedFront
  obtain ⟨fullContext, innerContext, targetContext, responseTicks, response⟩ :=
    selectedResponseTrace program dispatcher bits continuation
      (baseCarrier environment continuation) hadmissible
      (Registers.newJob program).clearScan bit suffix selected restParents rfl
  have suffixRun := fuelZeroSampleSuffix_zeroRun program dispatcher
    (Registers.newJob program) environment continuation fullParents
  obtain ⟨downTicks, downRun⟩ := run_downDescent
    (Registers.newJob program).clearScan response.sourceDescent fullParents
  have downRun' : ZeroMutationRun
      (SchedulerControl.machine program dispatcher) downTicks
      (fuelPhaseCompletedConfiguration program dispatcher
        (Registers.newJob program) 0 environment continuation fullParents)
      (upConfiguration program dispatcher (Registers.newJob program).clearScan
        omega (ContextCursor.frames fullContext omega fullParents)) := by
    simpa [fuelPhaseCompletedConfiguration, downConfiguration, environment,
      fullParents] using! downRun
  have complete := suffixRun.trans downRun'
  refine ⟨outerContext, fullContext, innerContext, targetContext,
    1 + downTicks, responseTicks, ?_, ?_⟩
  · simpa [bits, environment, restParents] using response
  · simpa [bits, environment, fullParents, restParents,
      SchedulerNestedPhase.fuelTerminalConfigurationAt,
      fuelSampleEndDepth_eq] using complete

/-- Execute exactly the responses still protected by outer pending frames and
stop before the final response.  The returned selected-UP trace represents the
literal `remaining`-th CTS iterate under the final pending frame.  Separating
this prefix from its terminal response permits the global checkpoint
certificate to be built from the raw exact chain without circularity. -/
theorem selectedNonemptyPendingPrefixAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits seedBits : List Bool) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers) :
    ∀ (remaining sampleIndex : Nat) (registers : Registers program)
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
          continuation remaining outerParents) ticks →
      (∀ k, k ≤ remaining →
        (CTS.iterate program k ⟨phase, bit :: suffix⟩).data ≠ []) →
      ∃ finalRegisters finalPhase finalBit finalSuffix finalSource
          finalOuterContext finalFullContext finalInnerContext
          finalTargetContext finalTicks configurations,
        ExactMutationChain (SchedulerControl.machine program dispatcher)
          (upConfiguration program dispatcher finalRegisters omega
            (ContextCursor.frames finalFullContext omega
              (.right (SchedulerResponse.pendingFunction program dispatcher
                seedBits continuation) :: outerParents)))
          (upConfiguration program dispatcher registers omega
            (ContextCursor.frames fullContext omega
              (.right (SchedulerResponse.pendingFunction program dispatcher
                seedBits continuation) ::
                PrimitiveFuel.pendingParents
                  (environmentCode
                    (compileActions program dispatcher.tree) seedBits)
                  continuation remaining outerParents))) configurations ∧
        IndexedResponseSampledStates program dispatcher inputBits sampleIndex
          configurations ∧
        configurations.length =
          nonemptySweepCost program dispatcher remaining
            ⟨phase, bit :: suffix⟩ ∧
        RegistersCoherent finalRegisters finalPhase [] false ∧
        SelectedResponseTrace program dispatcher seedBits continuation
          finalSource hadmissible finalRegisters finalBit finalSuffix
          finalOuterContext finalFullContext finalInnerContext finalTargetContext
          outerParents finalTicks ∧
        ⟨finalPhase, finalBit :: finalSuffix⟩ =
          CTS.iterate program remaining ⟨phase, bit :: suffix⟩
  | 0, sampleIndex, registers, phase, bit, suffix, source, outerContext,
      fullContext, innerContext, targetContext, ticks, coherent, trace,
      allNonempty => by
      refine ⟨registers, phase, bit, suffix, source, outerContext, fullContext,
        innerContext, targetContext, ticks, [], ?_, .nil sampleIndex, rfl,
        coherent, ?_, rfl⟩
      · exact .done 0 ⟨rfl, rfl⟩
      · simpa [PrimitiveFuel.pendingParents] using trace
  | remaining + 1, sampleIndex, registers, phase, bit, suffix, source,
      outerContext, fullContext, innerContext, targetContext, ticks, coherent,
      trace, allNonempty => by
      let encodedEnvironment :=
        environmentCode (compileActions program dispatcher.tree) seedBits
      let afterParents := PrimitiveFuel.pendingParents encodedEnvironment
        continuation (remaining + 1) outerParents
      let nextParents := PrimitiveFuel.pendingParents encodedEnvironment
        continuation remaining outerParents
      let finalRegisters := scannedRegisters registers bit suffix
      let carrier := deletedCarrier bit outerContext innerContext
      have firstNonempty :
          (CTS.absorbingStep program ⟨phase, bit :: suffix⟩).data ≠ [] := by
        have indexed := allNonempty 1
          (Nat.succ_le_succ (Nat.zero_le remaining))
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
          have parentSplit : afterParents =
              .right (SchedulerResponse.pendingFunction program dispatcher
                seedBits continuation) :: nextParents := by
            simpa [afterParents, nextParents, encodedEnvironment,
              SchedulerResponse.pendingFunction,
              PendingFrame.environmentCode_eq_envelope,
              PendingFrame.frameFunction] using
              (SchedulerCycle.pendingParents_succ_cons encodedEnvironment
                continuation remaining outerParents)
          have cycleTrace : SelectedResponseTrace program dispatcher seedBits
              continuation source hadmissible registers bit suffix outerContext
              fullContext innerContext targetContext
              (.right (SchedulerResponse.pendingFunction program dispatcher
                seedBits continuation) :: nextParents) ticks := by
            rw [← parentSplit]
            simpa [afterParents, encodedEnvironment] using trace
          obtain ⟨firstConfigurations, firstChain, firstSampled, firstLength⟩ :=
            selectedPendingSegmentAt program dispatcher inputBits seedBits
              continuation source hadmissible registers phase coherent bit suffix
              (remaining + 1) sampleIndex (Nat.succ_ne_zero remaining)
              outerParents layers outer
              (by simpa [encodedEnvironment] using trace)
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
          have tailNonempty : ∀ k, k ≤ remaining →
              (CTS.iterate program k
                ⟨CTS.nextPhase program phase, nextBit :: nextSuffix⟩).data ≠
                  [] := by
            intro k bound
            have shiftedBound : k + 1 ≤ remaining + 1 :=
              Nat.succ_le_succ bound
            have shifted := allNonempty (k + 1) shiftedBound
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
            selectedNonemptyPendingPrefixAt program dispatcher inputBits seedBits
              continuation hadmissible outerParents layers outer remaining
              (sampleIndex + firstConfigurations.length) finalRegisters.advance
              (CTS.nextPhase program phase) nextBit nextSuffix
              (LocalResponse.completed seedBits continuation carrier
                (SchedulerResponse.completedRoute program dispatcher
                  finalRegisters bit carrier))
              nextOuterContext nextFullContext nextInnerContext nextTargetContext
              nextTicks nextCoherent (by
                simpa [nextParents, encodedEnvironment, finalRegisters, carrier]
                  using cycle.nextResponse)
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
          have linkedTail := ExactMutationChain.prepend bridge tailChain
          have completeChain := SchedulerRecurrence.ExactMutationChain.append
            firstChain linkedTail
          have completeSampled :=
            SchedulerNestedPhase.IndexedResponseSampledStates.append program
              dispatcher inputBits firstSampled (by simpa using tailSampled)
          refine ⟨terminalRegisters, terminalPhase, terminalBit,
            terminalSuffix, terminalSource, terminalOuterContext,
            terminalFullContext, terminalInnerContext, terminalTargetContext,
            terminalTicks, firstConfigurations ++ tailConfigurations, ?_,
            completeSampled, ?_, terminalCoherent, terminalTrace, ?_⟩
          · simpa [encodedEnvironment, afterParents, nextParents,
              finalRegisters, carrier] using completeChain
          · simp only [List.length_append]
            rw [firstLength, tailLength]
            have finalPhaseEq : finalRegisters.phase = registers.phase :=
              scannedCoherent.phase_eq.trans coherent.phase_eq.symm
            calc
              (1 + LocalResponse.completedCost program
                    (dispatcher.route (finalRegisters.phase, bit))
                    (finalRegisters.phase, bit)) +
                  nonemptySweepCost program dispatcher remaining
                    ⟨CTS.nextPhase program phase,
                      nextBit :: nextSuffix⟩ =
                  CheckedTransition.totalCost program dispatcher phase
                      (bit :: suffix) +
                    nonemptySweepCost program dispatcher remaining
                      ⟨CTS.nextPhase program phase,
                        nextBit :: nextSuffix⟩ := by
                rw [finalPhaseEq, coherent.phase_eq,
                  CheckedTransition.totalCost_cons, dataEq,
                  CheckedTransition.markerCost_cons, Nat.add_zero]
              _ = CheckedTransition.totalCost program dispatcher phase
                      (bit :: suffix) +
                    nonemptySweepCost program dispatcher remaining
                      (CTS.absorbingStep program
                        ⟨phase, bit :: suffix⟩) := by
                rw [stepEq]
              _ = nonemptySweepCost program dispatcher (remaining + 1)
                    ⟨phase, bit :: suffix⟩ :=
                (nonemptySweepCost_succ program dispatcher remaining
                  ⟨phase, bit :: suffix⟩).symm
          · have iterateEq :
                CTS.iterate program (remaining + 1)
                    ⟨phase, bit :: suffix⟩ =
                  CTS.iterate program remaining
                    ⟨CTS.nextPhase program phase,
                      nextBit :: nextSuffix⟩ := by
              rw [CTS.iterate_add]
              change CTS.iterate program remaining
                  (CTS.absorbingStep program ⟨phase, bit :: suffix⟩) = _
              rw [stepEq]
            exact terminalEq.trans iterateEq.symm

/-- Execute the current selected response and every remaining pending response,
assuming each represented successor through the terminal one is nonempty.
The result exposes the exact literal arity-three continuation-check cursor,
the complete indexed mutation list, its forward executable cost, and the
completed-Local zipper extended by exactly one layer. -/
theorem selectedNonemptySweepToFreshCheckAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits seedBits : List Bool) (stage jobs : Nat) (environment : Term)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers) :
    ∀ (remaining sampleIndex : Nat) (registers : Registers program)
      (phase : CTS.Phase program) (bit : Bool) (suffix : List Bool)
      (source : Term)
      (outerContext fullContext innerContext targetContext : Context)
      (ticks : Nat),
      RegistersCoherent registers phase [] false →
      SelectedResponseTrace program dispatcher seedBits
        (Dovetail.clockExit stage (jobs + 1) environment) source
        (Dovetail.clockExit_admissible stage (jobs + 1) environment)
        registers bit suffix outerContext fullContext innerContext targetContext
        (PrimitiveFuel.pendingParents
          (environmentCode (compileActions program dispatcher.tree) seedBits)
          (Dovetail.clockExit stage (jobs + 1) environment) remaining
          outerParents) ticks →
      (∀ k, k ≤ remaining + 1 →
        (CTS.iterate program k ⟨phase, bit :: suffix⟩).data ≠ []) →
      ∃ nextParents checkRegisters configurations,
        ExactMutationChain (SchedulerControl.machine program dispatcher)
          (SchedulerContinuation.checkConfiguration program dispatcher
            checkRegisters
            ⟨Dovetail.clockExit stage (jobs + 1) environment, nextParents⟩)
          (upConfiguration program dispatcher registers omega
            (ContextCursor.frames fullContext omega
              (.right (SchedulerResponse.pendingFunction program dispatcher
                seedBits (Dovetail.clockExit stage (jobs + 1) environment)) ::
                PrimitiveFuel.pendingParents
                  (environmentCode
                    (compileActions program dispatcher.tree) seedBits)
                  (Dovetail.clockExit stage (jobs + 1) environment) remaining
                  outerParents))) configurations ∧
        IndexedResponseSampledStates program dispatcher inputBits sampleIndex
          configurations ∧
        configurations.length =
          nonemptySweepCost program dispatcher (remaining + 1)
            ⟨phase, bit :: suffix⟩ ∧
        CompletedParents program dispatcher nextParents (layers + 1)
  | 0, sampleIndex, registers, phase, bit, suffix, source, outerContext,
      fullContext, innerContext, targetContext, ticks, coherent, trace,
      allNonempty => by
      let continuation := Dovetail.clockExit stage (jobs + 1) environment
      let carrier := deletedCarrier bit outerContext innerContext
      let finalRegisters := scannedRegisters registers bit suffix
      have trace' : SelectedResponseTrace program dispatcher seedBits
          continuation source
          (Dovetail.clockExit_admissible stage (jobs + 1) environment)
          registers bit suffix outerContext fullContext innerContext targetContext
          outerParents ticks := by
        simpa [continuation, PrimitiveFuel.pendingParents] using trace
      have firstNonempty :
          (CTS.absorbingStep program ⟨phase, bit :: suffix⟩).data ≠ [] := by
        have indexed := allNonempty 1 (by simp)
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
          obtain ⟨configurations, chain, sampled, lengthEq, nextOuter⟩ :=
            selectedFreshNonterminalJobAt program dispatcher inputBits seedBits
              stage jobs environment source registers phase coherent bit suffix
              sampleIndex outerParents layers outer trace' nextBit nextSuffix
              dataEqRegisters
          let nextParents :=
            SchedulerRootContinuation.freshContinuationParents program
              dispatcher finalRegisters bit seedBits carrier outerParents
          refine ⟨nextParents, finalRegisters.advance, configurations, ?_,
            sampled, ?_, ?_⟩
          · simpa [nextParents, finalRegisters, carrier, continuation,
              SchedulerResponse.freshContinuationCursor,
              SchedulerResponse.literalContinuationCursor] using! chain
          · rw [lengthEq]
            simp [nonemptySweepCost, coherent.phase_eq]
          · simpa [nextParents, finalRegisters, carrier] using nextOuter
  | remaining + 1, sampleIndex, registers, phase, bit, suffix, source,
      outerContext, fullContext, innerContext, targetContext, ticks, coherent,
      trace, allNonempty => by
      let continuation := Dovetail.clockExit stage (jobs + 1) environment
      let encodedEnvironment :=
        environmentCode (compileActions program dispatcher.tree) seedBits
      let afterParents := PrimitiveFuel.pendingParents encodedEnvironment
        continuation (remaining + 1) outerParents
      let nextParents := PrimitiveFuel.pendingParents encodedEnvironment
        continuation remaining outerParents
      let finalRegisters := scannedRegisters registers bit suffix
      let carrier := deletedCarrier bit outerContext innerContext
      have firstNonempty :
          (CTS.absorbingStep program ⟨phase, bit :: suffix⟩).data ≠ [] := by
        have indexed := allNonempty 1
          (Nat.succ_le_succ (Nat.zero_le (remaining + 1)))
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
          have parentSplit : afterParents =
              .right (SchedulerResponse.pendingFunction program dispatcher
                seedBits continuation) :: nextParents := by
            simpa [afterParents, nextParents, encodedEnvironment,
              continuation, SchedulerResponse.pendingFunction,
              PendingFrame.environmentCode_eq_envelope,
              PendingFrame.frameFunction] using
              (SchedulerCycle.pendingParents_succ_cons encodedEnvironment
                continuation remaining outerParents)
          have cycleTrace : SelectedResponseTrace program dispatcher seedBits
              continuation source
              (Dovetail.clockExit_admissible stage (jobs + 1) environment)
              registers bit suffix outerContext fullContext innerContext
              targetContext
              (.right (SchedulerResponse.pendingFunction program dispatcher
                seedBits continuation) :: nextParents) ticks := by
            rw [← parentSplit]
            simpa [afterParents, continuation, encodedEnvironment] using trace
          obtain ⟨firstConfigurations, firstChain, firstSampled, firstLength⟩ :=
            selectedPendingSegmentAt program dispatcher inputBits seedBits
              continuation source
              (Dovetail.clockExit_admissible stage (jobs + 1) environment)
              registers phase coherent bit suffix (remaining + 1) sampleIndex
              (Nat.succ_ne_zero remaining) outerParents layers outer
              (by simpa [continuation, encodedEnvironment] using trace)
          have notSeen : registers.seen = false := by
            simpa using! coherent.seen_eq
          have noTail : registers.tail = false := by
            simpa using! coherent.tail_eq
          obtain ⟨nextContext, nextOuterContext, nextFullContext,
              nextInnerContext, nextTargetContext, returnTicks, downTicks,
              nextTicks, cycle⟩ :=
            pendingNonemptyCycleTrace program dispatcher seedBits continuation
              source (Dovetail.clockExit_admissible stage (jobs + 1) environment)
              registers bit suffix nextParents ticks cycleTrace notSeen noTail
              nextBit nextSuffix dataEqRegisters
          have finalCoherent : RegistersCoherent finalRegisters phase
              (bit :: suffix) false :=
            scannedRegisters_coherentAt program registers phase coherent bit suffix
          have nextCoherent : RegistersCoherent finalRegisters.advance
              (CTS.nextPhase program phase) [] false := finalCoherent.advance
          have stepEq :
              CTS.absorbingStep program ⟨phase, bit :: suffix⟩ =
                ⟨CTS.nextPhase program phase, nextBit :: nextSuffix⟩ := by
            cases step : CTS.absorbingStep program ⟨phase, bit :: suffix⟩ with
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
          have tailNonempty : ∀ k, k ≤ remaining + 1 →
              (CTS.iterate program k
                ⟨CTS.nextPhase program phase, nextBit :: nextSuffix⟩).data ≠
                  [] := by
            intro k bound
            have shiftedBound : k + 1 ≤ (remaining + 1) + 1 :=
              Nat.succ_le_succ bound
            have shifted := allNonempty (k + 1) shiftedBound
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
          obtain ⟨terminalParents, checkRegisters, tailConfigurations,
              tailChain, tailSampled, tailLength, terminalOuter⟩ :=
            selectedNonemptySweepToFreshCheckAt program dispatcher inputBits
              seedBits stage jobs environment outerParents layers outer remaining
              (sampleIndex + firstConfigurations.length) finalRegisters.advance
              (CTS.nextPhase program phase) nextBit nextSuffix
              (LocalResponse.completed seedBits continuation carrier
                (SchedulerResponse.completedRoute program dispatcher
                  finalRegisters bit carrier))
              nextOuterContext nextFullContext nextInnerContext nextTargetContext
              nextTicks nextCoherent (by
                simpa [nextParents, encodedEnvironment, continuation,
                  finalRegisters, carrier] using cycle.nextResponse)
              tailNonempty
          obtain ⟨bridgeDownTicks, bridgeDown⟩ := run_downDescent
            finalRegisters.advance cycle.nextResponse.sourceDescent
            (.right (SchedulerResponse.pendingFunction program dispatcher
              seedBits continuation) :: nextParents)
          have bridge : ZeroMutationRun
              (SchedulerControl.machine program dispatcher)
              (returnTicks + bridgeDownTicks)
              (selectedReturnConfiguration program dispatcher registers bit suffix
                seedBits continuation carrier afterParents)
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
          have linkedTail := ExactMutationChain.prepend bridge tailChain
          have completeChain := SchedulerRecurrence.ExactMutationChain.append
            firstChain linkedTail
          have completeSampled :=
            SchedulerNestedPhase.IndexedResponseSampledStates.append program
              dispatcher inputBits firstSampled (by
                simpa using tailSampled)
          refine ⟨terminalParents, checkRegisters,
            firstConfigurations ++ tailConfigurations, ?_, completeSampled,
            ?_, terminalOuter⟩
          · simpa [continuation, encodedEnvironment, afterParents,
              nextParents, finalRegisters, carrier] using completeChain
          · simp only [List.length_append]
            rw [firstLength, tailLength]
            have finalPhase : finalRegisters.phase = registers.phase :=
              finalCoherent.phase_eq.trans coherent.phase_eq.symm
            calc
              (1 + LocalResponse.completedCost program
                    (dispatcher.route (finalRegisters.phase, bit))
                    (finalRegisters.phase, bit)) +
                  nonemptySweepCost program dispatcher (remaining + 1)
                    ⟨CTS.nextPhase program phase, nextBit :: nextSuffix⟩ =
                  CheckedTransition.totalCost program dispatcher phase
                      (bit :: suffix) +
                    nonemptySweepCost program dispatcher (remaining + 1)
                      ⟨CTS.nextPhase program phase,
                        nextBit :: nextSuffix⟩ := by
                rw [finalPhase, coherent.phase_eq,
                  CheckedTransition.totalCost_cons, dataEq,
                  CheckedTransition.markerCost_cons, Nat.add_zero]
                simp only [Nat.add_zero]
              _ = CheckedTransition.totalCost program dispatcher phase
                      (bit :: suffix) +
                    nonemptySweepCost program dispatcher (remaining + 1)
                      (CTS.absorbingStep program
                        ⟨phase, bit :: suffix⟩) := by
                rw [stepEq]
              _ = nonemptySweepCost program dispatcher
                    ((remaining + 1) + 1) ⟨phase, bit :: suffix⟩ :=
                (nonemptySweepCost_succ program dispatcher (remaining + 1)
                  ⟨phase, bit :: suffix⟩).symm

/-! ## Complete all-nonempty bounded job -/

/-- A positive bounded job whose initial word and every represented successor
through its fuel horizon are nonempty.  Starting at the already-sampled final
Base-producing fuel configuration, the theorem lists exactly `jobCost`
contractions: every selected C4 and response sample, through the literal
arity-three continuation-check state.  The launch contraction of the next job
is intentionally not charged here. -/
theorem completeNonemptyJobAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (stage jobs fuel sampleIndex : Nat)
    (environment : Term) (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers)
    (fuelPositive : fuel ≠ 0)
    (allNonempty : ∀ k, k ≤ fuel →
      (CTS.iterate program k
        (CTS.initial program (bit :: suffix))).data ≠ []) :
    ∃ nextParents checkRegisters configurations,
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerContinuation.checkConfiguration program dispatcher
          checkRegisters
          ⟨Dovetail.clockExit stage (jobs + 1) environment, nextParents⟩)
        (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher
          (bit :: suffix) (Registers.newJob program)
          (Dovetail.clockExit stage (jobs + 1) environment) outerParents fuel 0)
        configurations ∧
      IndexedResponseSampledStates program dispatcher (bit :: suffix)
        sampleIndex configurations ∧
      configurations.length =
        ExactCheckpointRun.jobCost program dispatcher (bit :: suffix) fuel ∧
      CompletedParents program dispatcher nextParents (layers + 1) ∧
      (SchedulerContinuation.checkConfiguration program dispatcher
        checkRegisters
        ⟨Dovetail.clockExit stage (jobs + 1) environment,
          nextParents⟩).cursor.erase =
        Cursor.rebuild nextParents
          (Dovetail.clockExit stage (jobs + 1) environment) ∧
      (Dovetail.clockExit stage (jobs + 1) environment).headArity = 3 := by
  cases fuel with
  | zero => exact (fuelPositive rfl).elim
  | succ remaining =>
      let bits := bit :: suffix
      let continuation := Dovetail.clockExit stage (jobs + 1) environment
      let encodedEnvironment :=
        environmentCode (compileActions program dispatcher.tree) bits
      let afterParents := PrimitiveFuel.pendingParents encodedEnvironment
        continuation remaining outerParents
      let fullParents := PrimitiveFuel.pendingParents encodedEnvironment
        continuation (remaining + 1) outerParents
      obtain ⟨outerContext, fullContext, innerContext, targetContext,
          descentTicks, responseTicks, response, baseRun⟩ :=
        nonemptyBase_toSelected_zeroRunAt program dispatcher bit suffix
          continuation (Dovetail.clockExit_admissible stage (jobs + 1)
            environment) remaining outerParents
      have parentSplit : fullParents =
          .right (SchedulerResponse.pendingFunction program dispatcher bits
            continuation) :: afterParents := by
        simpa [fullParents, afterParents, encodedEnvironment, continuation,
          SchedulerResponse.pendingFunction,
          PendingFrame.environmentCode_eq_envelope,
          PendingFrame.frameFunction] using
          (SchedulerCycle.pendingParents_succ_cons encodedEnvironment continuation
            remaining outerParents)
      have baseRun' : ZeroMutationRun
          (SchedulerControl.machine program dispatcher) descentTicks
          (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher
            bits (Registers.newJob program) continuation outerParents
            (remaining + 1) 0)
          (upConfiguration program dispatcher
            (Registers.newJob program).clearScan omega
            (ContextCursor.frames fullContext omega
              (.right (SchedulerResponse.pendingFunction program dispatcher bits
                continuation) :: afterParents))) := by
        rw [← parentSplit]
        simpa [bits, continuation, encodedEnvironment, fullParents] using baseRun
      have response' : SelectedResponseTrace program dispatcher bits continuation
          (baseCarrier encodedEnvironment continuation)
          (Dovetail.clockExit_admissible stage (jobs + 1) environment)
          (Registers.newJob program).clearScan bit suffix outerContext fullContext
          innerContext targetContext afterParents responseTicks := by
        simpa [bits, continuation, encodedEnvironment, afterParents] using response
      have sweepNonempty : ∀ k, k ≤ remaining + 1 →
          (CTS.iterate program k
            ⟨CTS.zeroPhase program, bit :: suffix⟩).data ≠ [] := by
        intro k bound
        simpa [bits, CTS.initial] using allNonempty k bound
      obtain ⟨nextParents, checkRegisters, configurations, sweepChain,
          sampled, lengthEq, nextOuter⟩ :=
        selectedNonemptySweepToFreshCheckAt program dispatcher bits bits stage
          jobs environment outerParents layers outer remaining sampleIndex
          (Registers.newJob program).clearScan (CTS.zeroPhase program) bit suffix
          (baseCarrier encodedEnvironment continuation) outerContext fullContext
          innerContext targetContext responseTicks
          (RegistersCoherent.initial program).clearScan response' sweepNonempty
      have completeChain := ExactMutationChain.prepend baseRun' sweepChain
      refine ⟨nextParents, checkRegisters, configurations, ?_, sampled, ?_,
        nextOuter, rfl, Dovetail.headArity_clockExit_succ stage jobs environment⟩
      · simpa [bits, continuation, encodedEnvironment] using completeChain
      · rw [lengthEq]
        simpa [bits, CTS.initial] using
          (nonemptySweepCost_initial_eq_jobCost program dispatcher bits
            (remaining + 1))

/-- Raw complete arity-four job for the all-nonempty branch.  Its exact list
ends in the literal public checkpoint, while the mutation-free continuation
suffix is absorbed into the next-stage source.  `FreshTerminalData` is
certificate-independent; after the enclosing prefix constructs a
`PositivePrefix`, the returned callback classifies the same exact list. -/
theorem completeNonemptyTerminalJobRawAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (fuel sampleIndex : Nat)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers)
    (fuelPositive : fuel ≠ 0)
    (allNonempty : ∀ k, k ≤ fuel →
      (CTS.iterate program k
        (CTS.initial program (bit :: suffix))).data ≠ []) :
    let bits := bit :: suffix
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    let continuation := Dovetail.clockExit fuel 0 environment
    ∃ nextParents leading checkpoint configurations,
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (SchedulerRootContinuation.nextStageSourceConfiguration program
          dispatcher fuel environment nextParents)
        (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher
          bits (Registers.newJob program) continuation outerParents fuel 0)
        configurations ∧
      configurations = leading ++ [checkpoint] ∧
      configurations.length =
        ExactCheckpointRun.jobCost program dispatcher bits fuel ∧
      FreshTerminalData program dispatcher bits fuel checkpoint nextParents
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
  cases fuel with
  | zero => exact (fuelPositive rfl).elim
  | succ remaining =>
      let bits := bit :: suffix
      let environment :=
        environmentCode (compileActions program dispatcher.tree) bits
      let continuation := Dovetail.clockExit (remaining + 1) 0 environment
      let fullParents := PrimitiveFuel.pendingParents environment continuation
        (remaining + 1) outerParents
      let afterParents := PrimitiveFuel.pendingParents environment continuation
        remaining outerParents
      obtain ⟨outerContext, fullContext, innerContext, targetContext,
          descentTicks, responseTicks, response, baseRun⟩ :=
        nonemptyBase_toSelected_zeroRunAt program dispatcher bit suffix
          continuation
          (Dovetail.clockExit_admissible (remaining + 1) 0 environment)
          remaining outerParents
      have parentSplit : fullParents =
          .right (SchedulerResponse.pendingFunction program dispatcher bits
            continuation) :: afterParents := by
        simpa [fullParents, afterParents, environment, continuation,
          SchedulerResponse.pendingFunction,
          PendingFrame.environmentCode_eq_envelope,
          PendingFrame.frameFunction] using
          (SchedulerCycle.pendingParents_succ_cons environment continuation
            remaining outerParents)
      have baseRun' : ZeroMutationRun
          (SchedulerControl.machine program dispatcher) descentTicks
          (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher
            bits (Registers.newJob program) continuation outerParents
            (remaining + 1) 0)
          (upConfiguration program dispatcher
            (Registers.newJob program).clearScan omega
            (ContextCursor.frames fullContext omega
              (.right (SchedulerResponse.pendingFunction program dispatcher bits
                continuation) :: afterParents))) := by
        rw [← parentSplit]
        simpa [bits, environment, continuation, fullParents] using baseRun
      have response' : SelectedResponseTrace program dispatcher bits continuation
          (baseCarrier environment continuation)
          (Dovetail.clockExit_admissible (remaining + 1) 0 environment)
          (Registers.newJob program).clearScan bit suffix outerContext fullContext
          innerContext targetContext afterParents responseTicks := by
        simpa [bits, environment, continuation, afterParents] using response
      have prefixNonempty : ∀ k, k ≤ remaining →
          (CTS.iterate program k
            ⟨CTS.zeroPhase program, bit :: suffix⟩).data ≠ [] := by
        intro k bound
        have fuelBound : k ≤ remaining + 1 :=
          Nat.le_trans bound (Nat.le_succ remaining)
        simpa [bits, CTS.initial] using allNonempty k fuelBound
      obtain ⟨terminalRegisters, terminalPhase, terminalBit,
          terminalSuffix, terminalSource, terminalOuterContext,
          terminalFullContext, terminalInnerContext, terminalTargetContext,
          terminalTicks, prefixConfigurations, prefixChain, prefixSampled,
          prefixLength, terminalCoherent, terminalTrace, terminalEq⟩ :=
        selectedNonemptyPendingPrefixAt program dispatcher bits bits continuation
          (Dovetail.clockExit_admissible (remaining + 1) 0 environment)
          outerParents layers outer remaining sampleIndex
          (Registers.newJob program).clearScan (CTS.zeroPhase program) bit suffix
          (baseCarrier environment continuation) outerContext fullContext
          innerContext targetContext responseTicks
          (RegistersCoherent.initial program).clearScan response' prefixNonempty
      have stepEq : CTS.absorbingStep program
            ⟨terminalRegisters.phase, terminalBit :: terminalSuffix⟩ =
          CTS.iterate program (remaining + 1)
            (CTS.initial program bits) := by
        calc
          CTS.absorbingStep program
                ⟨terminalRegisters.phase,
                  terminalBit :: terminalSuffix⟩ =
              CTS.absorbingStep program
                ⟨terminalPhase, terminalBit :: terminalSuffix⟩ := by
                  rw [terminalCoherent.phase_eq]
          _ = CTS.absorbingStep program
              (CTS.iterate program remaining
                ⟨CTS.zeroPhase program, bit :: suffix⟩) := by
                  rw [← terminalEq]
          _ = CTS.iterate program (remaining + 1)
              (CTS.initial program bits) := by
                  rw [CTS.iterate_succ]
                  rfl
      have horizonNonempty :
          (CTS.iterate program (remaining + 1)
            (CTS.initial program bits)).data ≠ [] := by
        simpa [bits] using allNonempty (remaining + 1) (Nat.le_refl _)
      cases dataEq : (CTS.absorbingStep program
          ⟨terminalRegisters.phase,
            terminalBit :: terminalSuffix⟩).data with
      | nil =>
          have empty : (CTS.iterate program (remaining + 1)
              (CTS.initial program bits)).data = [] := by
            rw [← stepEq]
            exact dataEq
          exact (horizonNonempty empty).elim
      | cons nextBit nextSuffix =>
          let finalCarrier := deletedCarrier terminalBit terminalOuterContext
            terminalInnerContext
          let nextParents :=
            SchedulerRootContinuation.freshContinuationParents program
              dispatcher (scannedRegisters terminalRegisters terminalBit
                terminalSuffix) terminalBit bits finalCarrier outerParents
          obtain ⟨rawLeading, checkpoint, rawConfigurations, rawChain, rawEq,
              checkpointEq, rawLength, rawOuter, classifyRaw⟩ :=
            selectedFreshTerminalRawSegmentAt program dispatcher bits bits
              remaining terminalRegisters terminalPhase terminalCoherent
              terminalBit terminalSuffix
              (sampleIndex + prefixConfigurations.length) outerParents layers
              outer (by
                simpa [bits, environment, continuation] using terminalTrace)
              nextBit nextSuffix dataEq horizonNonempty
          let returnCheckpoint := selectedReturnConfiguration program dispatcher
            terminalRegisters terminalBit terminalSuffix bits continuation
            finalCarrier outerParents
          have semantic : FreshTerminalData program dispatcher bits
              (remaining + 1) returnCheckpoint nextParents (layers + 1) := by
            simpa [bits, environment, continuation, finalCarrier, nextParents,
              returnCheckpoint] using
              (selectedFreshTerminalShapeAt program dispatcher bits remaining
                terminalRegisters terminalPhase terminalCoherent terminalBit
                terminalSuffix outerParents layers outer
                (by simpa [bits, environment, continuation] using terminalTrace)
                (by simpa [bits, CTS.initial] using terminalEq)
                horizonNonempty)
          have checkpointErase : checkpoint.cursor.erase =
              returnCheckpoint.cursor.erase := by
            simpa [returnCheckpoint, selectedReturnConfiguration,
              SchedulerResponse.returnConfiguration,
              SchedulerResponse.completedCursor, finalCarrier] using!
              checkpointEq
          have terminalData : FreshTerminalData program dispatcher bits
              (remaining + 1) checkpoint nextParents (layers + 1) :=
            FreshTerminalData.of_checkpointErase semantic checkpointErase
          have prefixAndRaw :=
            SchedulerRecurrence.ExactMutationChain.append prefixChain rawChain
          have completeChain := ExactMutationChain.prepend baseRun' prefixAndRaw
          let leading := prefixConfigurations ++ rawLeading
          let configurations := prefixConfigurations ++ rawConfigurations
          have configurationsEq : configurations = leading ++ [checkpoint] := by
            simp [configurations, leading, rawEq, List.append_assoc]
          have scannedTerminalCoherent : RegistersCoherent
              (scannedRegisters terminalRegisters terminalBit terminalSuffix)
              terminalPhase (terminalBit :: terminalSuffix) false :=
            scannedRegisters_coherentAt program terminalRegisters terminalPhase
              terminalCoherent terminalBit terminalSuffix
          have scannedPhase :
              (scannedRegisters terminalRegisters terminalBit
                terminalSuffix).phase = terminalRegisters.phase :=
            scannedTerminalCoherent.phase_eq.trans
              terminalCoherent.phase_eq.symm
          have terminalTransitionCost : rawConfigurations.length =
              CheckedTransition.totalCost program dispatcher terminalPhase
                (terminalBit :: terminalSuffix) := by
            rw [rawLength]
            rw [scannedPhase]
            rw [← terminalCoherent.phase_eq]
            rw [CheckedTransition.totalCost_cons, dataEq,
              CheckedTransition.markerCost_cons, Nat.add_zero]
          have iterateCost :
              CheckedTransition.totalCost program dispatcher terminalPhase
                  (terminalBit :: terminalSuffix) =
                CheckedTransition.totalCost program dispatcher
                  (CTS.iterate program remaining
                    (CTS.initial program bits)).phase
                  (CTS.iterate program remaining
                    (CTS.initial program bits)).data := by
            have exactState :
                ⟨terminalPhase, terminalBit :: terminalSuffix⟩ =
                  CTS.iterate program remaining
                    (CTS.initial program bits) := by
              simpa [bits, CTS.initial] using terminalEq
            exact congrArg
              (fun current => CheckedTransition.totalCost program dispatcher
                current.phase current.data) exactState
          have configurationsLength : configurations.length =
              ExactCheckpointRun.jobCost program dispatcher bits
                (remaining + 1) := by
            simp only [configurations, List.length_append]
            calc
              prefixConfigurations.length + rawConfigurations.length =
                  nonemptySweepCost program dispatcher remaining
                      (CTS.initial program bits) +
                    CheckedTransition.totalCost program dispatcher terminalPhase
                      (terminalBit :: terminalSuffix) := by
                rw [prefixLength, terminalTransitionCost]
                rfl
              _ = nonemptySweepCost program dispatcher remaining
                      (CTS.initial program bits) +
                    CheckedTransition.totalCost program dispatcher
                      (CTS.iterate program remaining
                        (CTS.initial program bits)).phase
                      (CTS.iterate program remaining
                        (CTS.initial program bits)).data := by
                rw [iterateCost]
              _ = nonemptySweepCost program dispatcher (remaining + 1)
                    (CTS.initial program bits) :=
                (nonemptySweepCost_succ_last program dispatcher remaining
                  (CTS.initial program bits)).symm
              _ = ExactCheckpointRun.jobCost program dispatcher bits
                    (remaining + 1) :=
                nonemptySweepCost_initial_eq_jobCost program dispatcher bits
                  (remaining + 1)
          refine ⟨nextParents, leading, checkpoint, configurations, ?_,
            configurationsEq, configurationsLength, terminalData, ?_⟩
          · simpa [bits, environment, continuation, nextParents,
              SchedulerRootContinuation.freshNextStageSourceConfiguration,
              configurations] using completeChain
          · intro activeContext checkpointChain certificate indexEq
            have rawIndex :
                (sampleIndex + prefixConfigurations.length) +
                    rawConfigurations.length =
                  ExactCheckpointRun.checkpointTime program dispatcher bits
                    (remaining + 1) := by
              simpa [configurations, List.length_append, Nat.add_assoc] using
                indexEq
            have rawSampled := classifyRaw certificate rawIndex
            have completeSampled :=
              SchedulerNestedPhase.IndexedResponseSampledStates.append program
                dispatcher bits prefixSampled rawSampled
            simpa [configurations] using completeSampled

end SchedulerNestedResponse

end PureSFormal.PureS
