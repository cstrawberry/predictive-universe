import PureSFormal.PureS.PhysicalMarkerNonemptyPrefix

/-! The existing constructive job recurrences strengthened by explicit marker
physical marked-focus exclusion, retaining all original operational and semantic witnesses. -/
namespace PureSFormal.PureS.PhysicalMarkerExclusion
open FiniteController SchedulerControl SchedulerInvariant SchedulerCycle
  SchedulerResponseInvariant SchedulerCompletedContext SchedulerNestedResponse

theorem nonemptySweep_excludingMarkers
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
        CompletedParents program dispatcher nextParents (layers + 1) ∧
        NoPostMarkers program dispatcher configurations
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
            sampled, ?_, ?_, ?_⟩
          · simpa [nextParents, finalRegisters, carrier, continuation,
              SchedulerResponse.freshContinuationCursor,
              SchedulerResponse.literalContinuationCursor] using! chain
          · rw [lengthEq]
            simp [nonemptySweepCost, coherent.phase_eq]
          · simpa [nextParents, finalRegisters, carrier] using nextOuter
          · exact selectedResponse_chain_noPostMarkers program dispatcher seedBits continuation
              source (Dovetail.clockExit_admissible stage (jobs + 1) environment)
              registers bit suffix outerParents trace' (by simpa using! coherent.seen_eq)
              chain (by
                have phaseEq := (scannedRegisters_coherentAt program registers phase coherent
                  bit suffix).phase_eq.trans coherent.phase_eq.symm
                rw [lengthEq, phaseEq, CheckedTransition.totalCost_cons, dataEqRegisters,
                  CheckedTransition.markerCost_cons, Nat.add_zero])
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
              tailChain, tailSampled, tailLength, terminalOuter, tailSafe⟩ :=
            nonemptySweep_excludingMarkers program dispatcher inputBits
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
            ?_, terminalOuter, ?_⟩
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
          · exact noPostMarkers_append
              (selectedResponse_chain_noPostMarkers program dispatcher seedBits continuation
                source (Dovetail.clockExit_admissible stage (jobs + 1) environment)
                registers bit suffix afterParents trace notSeen firstChain firstLength)
              tailSafe


theorem nonemptyJob_excludingMarkers
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
      (Dovetail.clockExit stage (jobs + 1) environment).headArity = 3 ∧
      NoPostMarkers program dispatcher configurations := by
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
          sampled, lengthEq, nextOuter, safe⟩ :=
        nonemptySweep_excludingMarkers program dispatcher bits bits stage
          jobs environment outerParents layers outer remaining sampleIndex
          (Registers.newJob program).clearScan (CTS.zeroPhase program) bit suffix
          (baseCarrier encodedEnvironment continuation) outerContext fullContext
          innerContext targetContext responseTicks
          (RegistersCoherent.initial program).clearScan response' sweepNonempty
      have completeChain := ExactMutationChain.prepend baseRun' sweepChain
      refine ⟨nextParents, checkRegisters, configurations, ?_, sampled, ?_,
        nextOuter, rfl, Dovetail.headArity_clockExit_succ stage jobs environment, safe⟩
      · simpa [bits, continuation, encodedEnvironment] using completeChain
      · rw [lengthEq]
        simpa [bits, CTS.initial] using
          (nonemptySweepCost_initial_eq_jobCost program dispatcher bits
            (remaining + 1))

theorem nonemptyTerminalJob_excludingMarkers
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
          configurations) ∧
      NoPostMarkers program dispatcher configurations := by
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
          prefixLength, terminalCoherent, terminalTrace, terminalEq, prefixSafe⟩ :=
        nonemptyPendingPrefix_excludingMarkers program dispatcher bits bits continuation
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
            configurationsEq, configurationsLength, terminalData, ?_, ?_⟩
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
          · exact noPostMarkers_append prefixSafe
              (selectedResponse_chain_noPostMarkers program dispatcher bits continuation
                terminalSource (Dovetail.clockExit_admissible (remaining + 1) 0 environment)
                terminalRegisters terminalBit terminalSuffix outerParents terminalTrace
                (by simpa using! terminalCoherent.seen_eq) rawChain rawLength)

end PureSFormal.PureS.PhysicalMarkerExclusion
