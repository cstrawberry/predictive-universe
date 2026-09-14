import PureSFormal.Research.RootResetFiniteMixedNonemptySweep
import PureSFormal.Research.RootResetFiniteCompletedBoundaries
import PureSFormal.Research.RootResetFiniteEmptySweep

/-! Selected ordinary responses entering absorbing EMPTY cleanup. -/
namespace PureSFormal.Research.RootResetFiniteFirstEmptyJob
open PureSFormal.PureS
open SchedulerControl SchedulerInvariant SchedulerCycle SchedulerResponseInvariant
open SchedulerNestedResponse RootResetPersistentResponseSelector
open RootResetWrappedFrameSelectorProof RootResetMarkedFrameSelectorProof
open RootResetFiniteNormalResponseChain RootResetCleanTraversableParents
open RootResetMixedNormalResponseChain
open RootResetFiniteMixedNonemptySweep

theorem selected_marked
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {bits : List Bool} {continuation source : Term} {admissible : Carrier.Admissible continuation}
    {registers : Registers program} {phase : CTS.Phase program} {bit : Bool} {suffix : List Bool}
    {outerContext fullContext innerContext targetContext : Context}
    (horizon jobs : Nat) (exitEq : continuation = RootResetEmptyHandoffContext.exitTerm program dispatcher horizon jobs bits)
    (remaining : Nat) (parents : List ParentFrame) {layers ticks count : Nat}
    (clean : CleanParents program dispatcher parents layers)
    (coherent : RegistersCoherent registers phase [] false)
    (trace : SelectedResponseTrace program dispatcher bits continuation source admissible registers bit suffix
      outerContext fullContext innerContext targetContext
      (PrimitiveFuel.pendingParents (environmentCode (compileActions program dispatcher.tree) bits)
        continuation remaining parents) ticks)
    (normal : RootResetOrderedCarrier.NormalInvariant program dispatcher.tree bits continuation source
      registers.phase (bit :: suffix) count)
    (boundaries : BoundarySelections program dispatcher bits continuation source
      (deletedCarrier bit outerContext innerContext) remaining parents)
    (dataEq : (CTS.absorbingStep program ⟨registers.phase, bit :: suffix⟩).data = []) :
    let allParents := PrimitiveFuel.pendingParents (environmentCode (compileActions program dispatcher.tree) bits)
      continuation remaining parents
    let start := upConfiguration program dispatcher registers omega
      (ContextCursor.frames fullContext omega
        (.right (SchedulerResponse.pendingFunction program dispatcher bits continuation) :: allParents))
    let finalRegisters := scannedRegisters registers bit suffix
    let carrier := deletedCarrier bit outerContext innerContext
    let marker := SchedulerRootContinuation.normalMarkerMutationConfiguration program dispatcher
      finalRegisters bit bits continuation carrier allParents
    ∃ configurations,
      ExactMutationChain (SchedulerControl.machine program dispatcher) marker start configurations ∧
      RootResetExactTraceAgreement.SelectorChain (RootResetFinitePrioritySelector.selectStep? program dispatcher) start configurations ∧
      configurations.length = CheckedTransition.totalCost program dispatcher phase (bit :: suffix) := by
  subst continuation
  dsimp only
  let continuation := RootResetEmptyHandoffContext.exitTerm program dispatcher horizon jobs bits
  let allParents := PrimitiveFuel.pendingParents (environmentCode (compileActions program dispatcher.tree) bits)
    continuation remaining parents
  let finalRegisters := scannedRegisters registers bit suffix
  let carrier := deletedCarrier bit outerContext innerContext
  let marker := SchedulerRootContinuation.normalMarkerMutationConfiguration program dispatcher
    finalRegisters bit bits continuation carrier allParents
  have notSeen : registers.seen = false := by simpa using! coherent.seen_eq
  have noTail : registers.tail = false := by simpa using! coherent.tail_eq
  have finalCoherent := scannedRegisters_coherentAt program registers phase coherent bit suffix
  have phaseEq : finalRegisters.phase = registers.phase := finalCoherent.phase_eq.trans coherent.phase_eq.symm
  have bitEq : finalRegisters.bit = some bit := scannedRegisters_bit registers bit suffix notSeen
  have outputEq : outputEmpty program finalRegisters bit = true := by
    have output := outputEmpty_scannedRegisters program registers bit suffix notSeen noTail
    rw [dataEq] at output
    exact output
  have found : FiniteController.seekMutation (SchedulerControl.machine program dispatcher) 5
      (selectedReturnConfiguration program dispatcher registers bit suffix bits continuation carrier allParents) =
      some marker := by
    exact SchedulerRootContinuation.markedReturn_seekMarker program dispatcher finalRegisters bit bits
      continuation carrier allParents bitEq outputEq
  have chosen := RootResetFiniteCompletedBoundaries.selected_response_commit horizon jobs remaining parents clean trace normal dataEq
  have selected : RootResetFinitePrioritySelector.selectStep? program dispatcher
      (selectedReturnConfiguration program dispatcher registers bit suffix bits continuation carrier allParents).cursor.erase =
      some marker.cursor.erase := by
    dsimp only [marker]
    rw [SchedulerRootContinuation.normalMarkerMutation_erase]
    change RootResetFinitePrioritySelector.selectStep? program dispatcher
      (Cursor.rebuild allParents (LocalResponse.completed bits continuation carrier
        (SchedulerResponse.completedRoute program dispatcher finalRegisters bit carrier))) =
      some (Cursor.rebuild allParents (LocalResponse.markedCompleted bits continuation carrier
        (SchedulerResponse.completedRoute program dispatcher finalRegisters bit carrier)))
    exact chosen
  obtain ⟨beforeConfigurations, beforeChain, beforeSelected, beforeLength⟩ :=
    selected_complete remaining parents clean trace normal notSeen boundaries
  have markerChain : ExactMutationChain (SchedulerControl.machine program dispatcher) marker
      (selectedReturnConfiguration program dispatcher registers bit suffix bits continuation carrier allParents) [marker] :=
    .next 5 found (.done 0 ⟨rfl, rfl⟩)
  have markerSelected : RootResetExactTraceAgreement.SelectorChain (RootResetFinitePrioritySelector.selectStep? program dispatcher)
      (selectedReturnConfiguration program dispatcher registers bit suffix bits continuation carrier allParents) [marker] :=
    .next selected (.done marker)
  refine ⟨beforeConfigurations ++ [marker], SchedulerRecurrence.ExactMutationChain.append beforeChain markerChain,
    RootResetExactTraceAgreement.SelectorChain.append beforeChain beforeSelected markerSelected, ?_⟩
  rw [List.length_append, List.length_singleton, beforeLength, finalCoherent.phase_eq]
  have dataEqPhase : (CTS.absorbingStep program ⟨phase, bit :: suffix⟩).data = [] := by
    rw [← coherent.phase_eq]
    exact dataEq
  rw [CheckedTransition.totalCost_cons, dataEqPhase, CheckedTransition.markerCost_empty]

theorem selected_empty_cleanup
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {bits : List Bool} (stage jobs : Nat) (jobsBound : jobs ≤ stage)
    {source : Term} {registers : Registers program} {phase : CTS.Phase program}
    {bit : Bool} {suffix : List Bool}
    {outerContext fullContext innerContext targetContext : Context}
    (remaining : Nat) (parents : List ParentFrame) {layers ticks count : Nat}
    (clean : CleanParents program dispatcher parents layers)
    (coherent : RegistersCoherent registers phase [] false)
    (trace : SelectedResponseTrace program dispatcher bits
      (RootResetEmptyHandoffContext.exitTerm program dispatcher stage jobs bits) source
      (Dovetail.clockExit_admissible stage jobs (environmentCode (compileActions program dispatcher.tree) bits))
      registers bit suffix outerContext fullContext innerContext targetContext
      (PrimitiveFuel.pendingParents (environmentCode (compileActions program dispatcher.tree) bits)
        (RootResetEmptyHandoffContext.exitTerm program dispatcher stage jobs bits) remaining parents) ticks)
    (normal : RootResetOrderedCarrier.NormalInvariant program dispatcher.tree bits
      (RootResetEmptyHandoffContext.exitTerm program dispatcher stage jobs bits) source registers.phase (bit :: suffix) count)
    (boundaries : BoundarySelections program dispatcher bits
      (RootResetEmptyHandoffContext.exitTerm program dispatcher stage jobs bits) source
      (deletedCarrier bit outerContext innerContext) remaining parents)
    (dataEq : (CTS.absorbingStep program ⟨registers.phase, bit :: suffix⟩).data = []) :
    let allParents := PrimitiveFuel.pendingParents (environmentCode (compileActions program dispatcher.tree) bits)
      (RootResetEmptyHandoffContext.exitTerm program dispatcher stage jobs bits) remaining parents
    let start := upConfiguration program dispatcher registers omega
      (ContextCursor.frames fullContext omega
        (.right (SchedulerResponse.pendingFunction program dispatcher bits
          (RootResetEmptyHandoffContext.exitTerm program dispatcher stage jobs bits)) :: allParents))
    ∃ terminal configurations,
      ExactMutationChain (SchedulerControl.machine program dispatcher) terminal start configurations ∧
      RootResetExactTraceAgreement.SelectorChain (RootResetFinitePrioritySelector.selectStep? program dispatcher) start configurations ∧
      configurations.length = nonemptySweepCost program dispatcher (remaining + 1) ⟨phase, bit :: suffix⟩ := by
  dsimp only
  obtain ⟨firstConfigurations, firstChain, firstSelected, firstLength⟩ :=
    selected_marked stage jobs rfl remaining parents clean coherent trace normal boundaries dataEq
  have dataEqPhase : (CTS.absorbingStep program ⟨phase, bit :: suffix⟩).data = [] := by
    rw [← coherent.phase_eq]
    exact dataEq
  cases remaining with
  | zero =>
      refine ⟨_, firstConfigurations, firstChain, firstSelected, ?_⟩
      rw [firstLength, nonemptySweepCost_succ, nonemptySweepCost, Nat.add_zero]
  | succ remaining =>
      let continuation := RootResetEmptyHandoffContext.exitTerm program dispatcher stage jobs bits
      let environment := environmentCode (compileActions program dispatcher.tree) bits
      let finalRegisters := scannedRegisters registers bit suffix
      let carrier := deletedCarrier bit outerContext innerContext
      let marked := LocalResponse.markedCompleted bits continuation carrier
        (SchedulerResponse.completedRoute program dispatcher finalRegisters bit carrier)
      let emptyRegisters := SchedulerCycle.enteredEmptyRegisters finalRegisters.advance
      obtain ⟨entryConfigurations, entryChain, _, entryLength, emptyCoherent, _, markedDecode⟩ :=
        SchedulerFirstEmpty.selectedFirstEmptyEntryAt program dispatcher bits bits continuation source
          (Dovetail.clockExit_admissible stage jobs environment) registers phase coherent bit suffix remaining 0
          parents layers clean.toCompleted trace dataEq
      have entrySelected := selectorChain_of_same_exact_length firstChain entryChain
        (firstLength.trans entryLength.symm) firstSelected
      have markedAudit := SchedulerResponse.marked_holds program dispatcher finalRegisters bit bits continuation carrier trace.targetHolds
      obtain ⟨tailConfigurations, tailChain, tailSelected, tailLength⟩ :=
        RootResetFiniteEmptySweep.markedOrigin_completeSweep_selectorChain program dispatcher finalRegisters bit bits carrier
          stage jobs jobsBound remaining parents clean markedDecode markedAudit
      have emptyEq : finalRegisters.advanceEmpty = emptyRegisters := rfl
      rw [emptyEq] at tailChain tailSelected tailLength
      refine ⟨_, entryConfigurations ++ tailConfigurations,
        SchedulerRecurrence.ExactMutationChain.append entryChain tailChain,
        RootResetExactTraceAgreement.SelectorChain.append entryChain entrySelected tailSelected, ?_⟩
      rw [List.length_append, entryLength, tailLength,
        SchedulerFirstEmpty.emptyCleanupMutations_eq_nonemptySweepCost program dispatcher remaining emptyRegisters
          (CTS.nextPhase program phase) emptyCoherent]
      rw [nonemptySweepCost_succ program dispatcher (remaining + 1) ⟨phase, bit :: suffix⟩]
      have stepEq : CTS.absorbingStep program ⟨phase, bit :: suffix⟩ = ⟨CTS.nextPhase program phase, []⟩ := by
        cases step : CTS.absorbingStep program ⟨phase, bit :: suffix⟩ with
        | mk nextPhase output =>
            have phaseEq : nextPhase = CTS.nextPhase program phase := by
              simpa only [step] using (CTS.absorbingStep_phase program ⟨phase, bit :: suffix⟩)
            have outputEq : output = [] := by simpa only [step] using dataEqPhase
            subst nextPhase
            subst output
            rfl
      rw [stepEq]


theorem selectedSweepWitness
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (stage jobs : Nat) (jobsBound : jobs ≤ stage)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CleanParents program dispatcher outerParents layers) :
    ∀ (remaining : Nat) (registers : Registers program) (phase : CTS.Phase program)
      (bit : Bool) (suffix : List Bool) (source : Term)
      (outerContext fullContext innerContext targetContext : Context) (ticks count : Nat),
      RegistersCoherent registers phase [] false →
      SelectedResponseTrace program dispatcher bits
        (RootResetEmptyHandoffContext.exitTerm program dispatcher stage (jobs) bits) source
        (Dovetail.clockExit_admissible stage (jobs) (environmentCode (compileActions program dispatcher.tree) bits))
        registers bit suffix outerContext fullContext innerContext targetContext
        (PrimitiveFuel.pendingParents (environmentCode (compileActions program dispatcher.tree) bits)
          (RootResetEmptyHandoffContext.exitTerm program dispatcher stage (jobs) bits) remaining outerParents) ticks →
      RootResetOrderedCarrier.NormalInvariant program dispatcher.tree bits
        (RootResetEmptyHandoffContext.exitTerm program dispatcher stage (jobs) bits) source registers.phase
        (bit :: suffix) count →
      BoundarySelections program dispatcher bits
        (RootResetEmptyHandoffContext.exitTerm program dispatcher stage (jobs) bits) source
        (deletedCarrier bit outerContext innerContext) remaining outerParents →
      ∃ terminal configurations,
        ExactMutationChain (SchedulerControl.machine program dispatcher) terminal
          (upConfiguration program dispatcher registers omega
            (ContextCursor.frames fullContext omega
              (.right (SchedulerResponse.pendingFunction program dispatcher bits
                (RootResetEmptyHandoffContext.exitTerm program dispatcher stage (jobs) bits)) ::
                PrimitiveFuel.pendingParents (environmentCode (compileActions program dispatcher.tree) bits)
                  (RootResetEmptyHandoffContext.exitTerm program dispatcher stage (jobs) bits) remaining outerParents)))
          configurations ∧
        RootResetExactTraceAgreement.SelectorChain (RootResetFinitePrioritySelector.selectStep? program dispatcher)
          (upConfiguration program dispatcher registers omega
            (ContextCursor.frames fullContext omega
              (.right (SchedulerResponse.pendingFunction program dispatcher bits
                (RootResetEmptyHandoffContext.exitTerm program dispatcher stage (jobs) bits)) ::
                PrimitiveFuel.pendingParents (environmentCode (compileActions program dispatcher.tree) bits)
                  (RootResetEmptyHandoffContext.exitTerm program dispatcher stage (jobs) bits) remaining outerParents)))
          configurations ∧
        configurations.length = nonemptySweepCost program dispatcher (remaining + 1) ⟨phase, bit :: suffix⟩ := by
  intro remaining
  induction remaining with
  | zero =>
      intro registers phase bit suffix source outerContext fullContext innerContext targetContext
        ticks count coherent trace normal boundaries
      cases dataEq : (CTS.absorbingStep program ⟨phase, bit :: suffix⟩).data with
      | nil =>
          exact selected_empty_cleanup stage jobs jobsBound 0 outerParents outer coherent trace normal boundaries
            (by rw [coherent.phase_eq]; exact dataEq)
      | cons nextBit nextSuffix =>
          obtain ⟨configurations, chain, selected, lengthEq⟩ :=
            selected_complete 0 outerParents outer trace normal (by simpa using! coherent.seen_eq) boundaries
          have finalPhase : (scannedRegisters registers bit suffix).phase = phase :=
            (scannedRegisters_coherentAt program registers phase coherent bit suffix).phase_eq
          refine ⟨_, configurations, chain, selected, ?_⟩
          rw [lengthEq, finalPhase]
          simp only [nonemptySweepCost_succ, nonemptySweepCost, Nat.add_zero,
            CheckedTransition.totalCost_cons, dataEq, CheckedTransition.markerCost_cons]
  | succ remaining ih =>
      intro registers phase bit suffix source outerContext fullContext innerContext targetContext
        ticks count coherent trace normal boundaries
      let continuation := RootResetEmptyHandoffContext.exitTerm program dispatcher stage (jobs) bits
      let environment := environmentCode (compileActions program dispatcher.tree) bits
      let afterParents := PrimitiveFuel.pendingParents environment continuation (remaining + 1) outerParents
      let nextParents := PrimitiveFuel.pendingParents environment continuation remaining outerParents
      let finalRegisters := scannedRegisters registers bit suffix
      let carrier := deletedCarrier bit outerContext innerContext
      have notSeen : registers.seen = false := by simpa using! coherent.seen_eq
      have noTail : registers.tail = false := by simpa using! coherent.tail_eq
      cases dataEq : (CTS.absorbingStep program ⟨phase, bit :: suffix⟩).data with
      | nil =>
          exact selected_empty_cleanup stage jobs jobsBound (remaining + 1) outerParents outer coherent trace normal boundaries
            (by rw [coherent.phase_eq]; exact dataEq)
      | cons nextBit nextSuffix =>
          have dataEqRegisters : (CTS.absorbingStep program ⟨registers.phase, bit :: suffix⟩).data =
              nextBit :: nextSuffix := by rw [coherent.phase_eq]; exact dataEq
          have parentSplit : afterParents =
              .right (SchedulerResponse.pendingFunction program dispatcher bits continuation) :: nextParents := by
            simpa [afterParents, nextParents, environment, continuation, SchedulerResponse.pendingFunction,
              PendingFrame.environmentCode_eq_envelope, PendingFrame.frameFunction] using
              (pendingParents_succ_cons environment continuation remaining outerParents)
          have cycleTrace : SelectedResponseTrace program dispatcher bits continuation source
              (Dovetail.clockExit_admissible stage (jobs) environment) registers bit suffix
              outerContext fullContext innerContext targetContext
              (.right (SchedulerResponse.pendingFunction program dispatcher bits continuation) :: nextParents) ticks := by
            rw [← parentSplit]
            exact trace
          obtain ⟨firstConfigurations, firstChain, firstSelected, firstLength⟩ :=
            selected_complete (remaining + 1) outerParents outer trace normal notSeen boundaries
          obtain ⟨nextContext, nextOuterContext, nextFullContext, nextInnerContext, nextTargetContext,
              returnTicks, downTicks, nextTicks, cycle⟩ :=
            pendingNonemptyCycleTrace program dispatcher bits continuation source
              (Dovetail.clockExit_admissible stage (jobs) environment) registers bit suffix nextParents
              ticks cycleTrace notSeen noTail nextBit nextSuffix dataEqRegisters
          have finalCoherent : RegistersCoherent finalRegisters phase (bit :: suffix) false :=
            scannedRegisters_coherentAt program registers phase coherent bit suffix
          have nextCoherent := finalCoherent.advance
          have finalPhase : finalRegisters.phase = registers.phase := finalCoherent.phase_eq.trans coherent.phase_eq.symm
          have stepEq : CTS.absorbingStep program ⟨phase, bit :: suffix⟩ =
              ⟨CTS.nextPhase program phase, nextBit :: nextSuffix⟩ := by
            cases step : CTS.absorbingStep program ⟨phase, bit :: suffix⟩ with
            | mk nextPhase output =>
                have phaseEq : nextPhase = CTS.nextPhase program phase := by
                  simpa only [step] using (CTS.absorbingStep_phase program ⟨phase, bit :: suffix⟩)
                have outputEq : output = nextBit :: nextSuffix := by simpa only [step] using dataEq
                subst nextPhase
                subst output
                rfl
          have preserved := RootResetOrderedCarrier.selectedResponseTrace_preserves trace normal
          let completed := LocalResponse.completed bits continuation carrier
            (SchedulerResponse.completedRoute program dispatcher finalRegisters bit carrier)
          have nextNormal : RootResetOrderedCarrier.NormalInvariant program dispatcher.tree bits continuation
              completed finalRegisters.advance.phase (nextBit :: nextSuffix) (count + 1) := by
            have result := preserved.2.2
            rw [dataEqRegisters] at result
            change RootResetOrderedCarrier.NormalInvariant program dispatcher.tree bits continuation completed
              (CTS.nextPhase program registers.phase) (nextBit :: nextSuffix) (count + 1) at result
            simpa only [Registers.advance, finalPhase] using result
          have parsed := CheckpointDecoder.parseLocal?_completed (continuation := continuation) bits
            (SchedulerResponse.completedRoute_snapshotDispatch program dispatcher finalRegisters bit carrier)
          have nextBoundaries := RootResetFiniteCompletedBoundaries.boundaries_of_completed stage jobs remaining outerParents outer
            cycle.nextResponse parsed rfl rfl nextNormal
          obtain ⟨terminal, tailConfigurations, tailChain, tailSelected, tailLength⟩ :=
            ih
              finalRegisters.advance (CTS.nextPhase program phase) nextBit nextSuffix completed
              nextOuterContext nextFullContext nextInnerContext nextTargetContext nextTicks (count + 1)
              nextCoherent cycle.nextResponse nextNormal nextBoundaries
          obtain ⟨bridgeDownTicks, bridgeDown⟩ := run_downDescent finalRegisters.advance cycle.nextResponse.sourceDescent
            (.right (SchedulerResponse.pendingFunction program dispatcher bits continuation) :: nextParents)
          have bridge : ZeroMutationRun (SchedulerControl.machine program dispatcher) (returnTicks + bridgeDownTicks)
              (selectedReturnConfiguration program dispatcher registers bit suffix bits continuation carrier afterParents)
              (upConfiguration program dispatcher finalRegisters.advance omega
                (ContextCursor.frames nextFullContext omega
                  (.right (SchedulerResponse.pendingFunction program dispatcher bits continuation) :: nextParents))) := by
            have down' : ZeroMutationRun (SchedulerControl.machine program dispatcher) bridgeDownTicks
                (freshPendingDownConfiguration program dispatcher registers bit suffix bits continuation carrier nextParents)
                (upConfiguration program dispatcher finalRegisters.advance omega
                  (ContextCursor.frames nextFullContext omega
                    (.right (SchedulerResponse.pendingFunction program dispatcher bits continuation) :: nextParents))) := by
              simpa [freshPendingDownConfiguration, SchedulerResponse.freshNestedDownConfiguration,
                SchedulerResponse.normalPendingDownConfiguration, finalRegisters, carrier] using! bridgeDown
            have combined := cycle.returnToDown.trans down'
            rw [parentSplit]
            simpa [pendingReturnConfiguration, selectedReturnConfiguration, finalRegisters, carrier] using! combined
          have linkedTail := ExactMutationChain.prepend bridge tailChain
          have completeChain := SchedulerRecurrence.ExactMutationChain.append firstChain linkedTail
          have completeSelected := RootResetExactTraceAgreement.SelectorChain.append firstChain firstSelected
            (RootResetExactTraceAgreement.SelectorChain.prepend bridge tailSelected)
          refine ⟨terminal, firstConfigurations ++ tailConfigurations, completeChain, completeSelected, ?_⟩
          rw [List.length_append, firstLength, tailLength, finalPhase, coherent.phase_eq]
          rw [nonemptySweepCost_succ program dispatcher (remaining + 1) ⟨phase, bit :: suffix⟩, stepEq, CheckedTransition.totalCost_cons, dataEq,
            CheckedTransition.markerCost_cons, Nat.add_zero]
          simp only [Nat.add_zero]

end PureSFormal.Research.RootResetFiniteFirstEmptyJob
