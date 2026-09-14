import PureSFormal.PureS.PhysicalMarkerExclusion

/-! The nonempty pending-prefix trace retains physical marked-focus exclusion.
The recurrence is the existing constructive trace proof, strengthened with
the literal cursor-focus property at each selected response and every append. -/
namespace PureSFormal.PureS.PhysicalMarkerExclusion
open FiniteController SchedulerControl SchedulerInvariant SchedulerCycle
  SchedulerResponseInvariant SchedulerCompletedContext SchedulerNestedResponse

theorem nonemptyPendingPrefix_excludingMarkers
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
          CTS.iterate program remaining ⟨phase, bit :: suffix⟩ ∧
        NoPostMarkers program dispatcher configurations
  | 0, sampleIndex, registers, phase, bit, suffix, source, outerContext,
      fullContext, innerContext, targetContext, ticks, coherent, trace,
      allNonempty => by
      refine ⟨registers, phase, bit, suffix, source, outerContext, fullContext,
        innerContext, targetContext, ticks, [], ?_, .nil sampleIndex, rfl,
        coherent, ?_, rfl, noPostMarkers_nil program dispatcher⟩
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
              tailLength, terminalCoherent, terminalTrace, terminalEq, tailSafe⟩ :=
            nonemptyPendingPrefix_excludingMarkers program dispatcher inputBits seedBits
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
            completeSampled, ?_, terminalCoherent, terminalTrace, ?_, ?_⟩
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
          · exact noPostMarkers_append
              (selectedResponse_chain_noPostMarkers program dispatcher seedBits continuation
                source hadmissible registers bit suffix afterParents trace notSeen
                firstChain firstLength) tailSafe

end PureSFormal.PureS.PhysicalMarkerExclusion
