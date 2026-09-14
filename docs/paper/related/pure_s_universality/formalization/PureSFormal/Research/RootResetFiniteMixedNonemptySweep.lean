import PureSFormal.Research.RootResetFiniteCompletedBoundaries
import PureSFormal.Research.RootResetFiniteNormalResponseChain
import PureSFormal.Research.RootResetFiniteBaseAgreement
import PureSFormal.Research.RootResetMixedNonemptySweep
import PureSFormal.Research.RootResetMixedCompletedFrontHandoff
import PureSFormal.Research.RootResetGeneratedJobTraversability

/-! Full selected nonempty sweeps on the scheduler's literal mutation lists. -/
namespace PureSFormal.Research.RootResetFiniteMixedNonemptySweep
open PureSFormal.PureS
open SchedulerControl SchedulerInvariant SchedulerCycle SchedulerResponseInvariant
open SchedulerNestedResponse RootResetPersistentResponseSelector
open RootResetWrappedFrameSelectorProof RootResetMarkedFrameSelectorProof
open RootResetMixedNormalResponseChain RootResetCleanTraversableParents

/-- The two front contractions for one canonical response under its actual
pending stack. The complete body certificate discharges every later edge. -/
def BoundarySelections (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation source deleted : Term)
    (remaining : Nat) (parents : List ParentFrame) : Prop :=
  let context := SchedulerInvariant.contextOfParents parents
  RootResetFinitePrioritySelector.selectStep? program dispatcher
    (context.plug (pending (compileActions program dispatcher.tree) bits continuation (remaining + 1) source)) =
    some (context.plug (pending (compileActions program dispatcher.tree) bits continuation (remaining + 1) deleted)) ∧
  RootResetFinitePrioritySelector.selectStep? program dispatcher
    (context.plug (pending (compileActions program dispatcher.tree) bits continuation (remaining + 1) deleted)) =
    some (context.plug (pending (compileActions program dispatcher.tree) bits continuation remaining
      (frameFirstRoot (compileActions program dispatcher.tree) bits continuation deleted)))

theorem selected_complete
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {bits : List Bool} {continuation source : Term} {admissible : Carrier.Admissible continuation}
    {registers : Registers program} {bit : Bool} {suffix : List Bool}
    {outerContext fullContext innerContext targetContext : Context}
    (remaining : Nat) (parents : List ParentFrame) {layers ticks count : Nat}
    (clean : CleanParents program dispatcher parents layers)
    (trace : SelectedResponseTrace program dispatcher bits continuation source admissible registers bit suffix
      outerContext fullContext innerContext targetContext
      (PrimitiveFuel.pendingParents (environmentCode (compileActions program dispatcher.tree) bits)
        continuation remaining parents) ticks)
    (normal : RootResetOrderedCarrier.NormalInvariant program dispatcher.tree bits continuation source
      registers.phase (bit :: suffix) count)
    (notSeen : registers.seen = false)
    (boundaries : BoundarySelections program dispatcher bits continuation source
      (deletedCarrier bit outerContext innerContext) remaining parents) :
    let allParents := PrimitiveFuel.pendingParents (environmentCode (compileActions program dispatcher.tree) bits)
      continuation remaining parents
    let start := upConfiguration program dispatcher registers omega
      (ContextCursor.frames fullContext omega
        (.right (SchedulerResponse.pendingFunction program dispatcher bits continuation) :: allParents))
    ∃ configurations,
      ExactMutationChain (SchedulerControl.machine program dispatcher)
        (selectedReturnConfiguration program dispatcher registers bit suffix bits continuation
          (deletedCarrier bit outerContext innerContext) allParents) start configurations ∧
      RootResetExactTraceAgreement.SelectorChain (RootResetFinitePrioritySelector.selectStep? program dispatcher) start configurations ∧
      configurations.length = 1 + LocalResponse.completedCost program
        (dispatcher.route ((scannedRegisters registers bit suffix).phase, bit))
        ((scannedRegisters registers bit suffix).phase, bit) := by
  apply RootResetFiniteNormalResponseChain.selectedResponseTrace_complete_selectorChain remaining parents clean trace normal notSeen
  · rw [(selectedResponseTrace_boundary_erases remaining parents trace).1,
      (selectedResponseTrace_boundary_erases remaining parents trace).2]
    exact boundaries.1
  · rw [(selectedResponseTrace_boundary_erases remaining parents trace).2, pending_rebuild_under_parents]
    exact boundaries.2


theorem deleted_base_eq_firstCarrier
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (continuation : Term) (admissible : Carrier.Admissible continuation)
    {registers : Registers program} {parents : List ParentFrame}
    {outerContext fullContext innerContext targetContext : Context} {ticks : Nat}
    (trace : SelectedResponseTrace program dispatcher (bit :: suffix) continuation
      (baseCarrier (environmentCode (compileActions program dispatcher.tree) (bit :: suffix)) continuation)
      admissible registers bit suffix outerContext fullContext innerContext targetContext parents ticks) :
    deletedCarrier bit outerContext innerContext =
      RootResetResponseCarrierChronology.firstCarrier (compileActions program dispatcher.tree) bit suffix continuation := by
  obtain ⟨seed, _, seedValid⟩ := RootResetPersistentFuelCarrier.exists_parseSeedFront?_word_cons bit suffix
  rw [RootResetMixedNonemptySweep.deletedBase_eq program dispatcher bit suffix continuation admissible trace seed seedValid]
  rw [RootResetResponseCarrierChronology.seedFront_endpoint bit suffix seedValid]
  rfl

theorem boundaries_of_base
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (horizon jobs : Nat)
    {registers : Registers program}
    {outerContext fullContext innerContext targetContext : Context} {ticks : Nat}
    (remaining : Nat) (parents : List ParentFrame) {layers : Nat}
    (clean : CleanParents program dispatcher parents layers)
    (trace : SelectedResponseTrace program dispatcher (bit :: suffix)
      (RootResetEmptyHandoffContext.exitTerm program dispatcher horizon jobs (bit :: suffix))
      (baseCarrier (environmentCode (compileActions program dispatcher.tree) (bit :: suffix))
        (RootResetEmptyHandoffContext.exitTerm program dispatcher horizon jobs (bit :: suffix)))
      (Dovetail.clockExit_admissible horizon jobs (environmentCode (compileActions program dispatcher.tree) (bit :: suffix)))
      registers bit suffix outerContext fullContext innerContext targetContext
      (PrimitiveFuel.pendingParents (environmentCode (compileActions program dispatcher.tree) (bit :: suffix))
        (RootResetEmptyHandoffContext.exitTerm program dispatcher horizon jobs (bit :: suffix)) remaining parents) ticks) :
    BoundarySelections program dispatcher (bit :: suffix)
      (RootResetEmptyHandoffContext.exitTerm program dispatcher horizon jobs (bit :: suffix))
      (baseCarrier (environmentCode (compileActions program dispatcher.tree) (bit :: suffix))
        (RootResetEmptyHandoffContext.exitTerm program dispatcher horizon jobs (bit :: suffix)))
      (deletedCarrier bit outerContext innerContext) remaining parents := by
  have deletedEq := deleted_base_eq_firstCarrier program dispatcher bit suffix _ _ trace
  dsimp only [BoundarySelections]
  rw [deletedEq]
  constructor
  · simpa only [pending_rebuild_under_parents] using!
      (RootResetFiniteBaseAgreement.repeated_initial_firstC4 clean horizon jobs bit suffix (remaining + 1))
  · simpa only [pending_rebuild_under_parents] using!
      (RootResetFiniteBaseAgreement.repeated_post_firstC4_handoff clean horizon jobs bit suffix remaining)

set_option maxRecDepth 10000 in
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
      (∀ k, k ≤ remaining + 1 → (CTS.iterate program k ⟨phase, bit :: suffix⟩).data ≠ []) →
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
        ticks count coherent trace normal boundaries allNonempty
      obtain ⟨configurations, chain, selected, lengthEq⟩ :=
        selected_complete 0 outerParents outer trace normal (by simpa using! coherent.seen_eq) boundaries
      have firstNonempty : (CTS.absorbingStep program ⟨phase, bit :: suffix⟩).data ≠ [] := by
        simpa only [CTS.iterate] using allNonempty 1 (Nat.le_refl 1)
      have finalPhase : (scannedRegisters registers bit suffix).phase = phase :=
        (scannedRegisters_coherentAt program registers phase coherent bit suffix).phase_eq
      refine ⟨_, configurations, chain, selected, ?_⟩
      rw [lengthEq, finalPhase]
      cases dataEq : (CTS.absorbingStep program ⟨phase, bit :: suffix⟩).data with
      | nil => exact (firstNonempty dataEq).elim
      | cons nextBit nextSuffix =>
          simp only [nonemptySweepCost_succ, nonemptySweepCost, Nat.add_zero,
            CheckedTransition.totalCost_cons, dataEq, CheckedTransition.markerCost_cons]
  | succ remaining ih =>
      intro registers phase bit suffix source outerContext fullContext innerContext targetContext
        ticks count coherent trace normal boundaries allNonempty
      let continuation := RootResetEmptyHandoffContext.exitTerm program dispatcher stage (jobs) bits
      let environment := environmentCode (compileActions program dispatcher.tree) bits
      let afterParents := PrimitiveFuel.pendingParents environment continuation (remaining + 1) outerParents
      let nextParents := PrimitiveFuel.pendingParents environment continuation remaining outerParents
      let finalRegisters := scannedRegisters registers bit suffix
      let carrier := deletedCarrier bit outerContext innerContext
      have notSeen : registers.seen = false := by simpa using! coherent.seen_eq
      have noTail : registers.tail = false := by simpa using! coherent.tail_eq
      have firstNonempty : (CTS.absorbingStep program ⟨phase, bit :: suffix⟩).data ≠ [] := by
        simpa only [CTS.iterate] using allNonempty 1 (Nat.succ_le_succ (Nat.zero_le _))
      cases dataEq : (CTS.absorbingStep program ⟨phase, bit :: suffix⟩).data with
      | nil => exact (firstNonempty dataEq).elim
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
          have tailNonempty : ∀ k, k ≤ remaining + 1 →
              (CTS.iterate program k ⟨CTS.nextPhase program phase, nextBit :: nextSuffix⟩).data ≠ [] := by
            intro k bound
            have shifted := allNonempty (k + 1) (Nat.succ_le_succ bound)
            have iterateEq : CTS.iterate program (k + 1) ⟨phase, bit :: suffix⟩ =
                CTS.iterate program k ⟨CTS.nextPhase program phase, nextBit :: nextSuffix⟩ := by
              rw [CTS.iterate_add]
              change CTS.iterate program k (CTS.absorbingStep program ⟨phase, bit :: suffix⟩) = _
              rw [stepEq]
            rw [iterateEq] at shifted
            exact shifted
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
          have nextBoundaries : BoundarySelections program dispatcher bits continuation completed
              (deletedCarrier nextBit nextOuterContext nextInnerContext) remaining outerParents :=
            RootResetFiniteCompletedBoundaries.boundaries_of_completed stage jobs remaining outerParents outer
              cycle.nextResponse parsed rfl rfl nextNormal
          obtain ⟨terminal, tailConfigurations, tailChain, tailSelected, tailLength⟩ :=
            ih
              finalRegisters.advance (CTS.nextPhase program phase) nextBit nextSuffix completed
              nextOuterContext nextFullContext nextInnerContext nextTargetContext nextTicks (count + 1)
              nextCoherent cycle.nextResponse nextNormal nextBoundaries tailNonempty
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



/-- Every contraction of an actual all-nonempty bounded job is selected by
root restart. This covers both nonfinal exits and the terminal exit at zero;
the certificate is attached to the existing exact scheduler sample list. -/
theorem completeJob_selectorChain
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (stage jobs fuel : Nat)
    (jobsBound : jobs ≤ stage)
    (parents : List ParentFrame) (layers : Nat)
    (clean : CleanParents program dispatcher parents layers)
    (positive : fuel ≠ 0)
    (allNonempty : ∀ k, k ≤ fuel →
      (CTS.iterate program k (CTS.initial program (bit :: suffix))).data ≠ []) :
    let continuation := RootResetEmptyHandoffContext.exitTerm program dispatcher stage jobs (bit :: suffix)
    ∀ {terminal : SchedulerNestedResponse.Configuration program dispatcher}
      {configurations : List (SchedulerNestedResponse.Configuration program dispatcher)},
      ExactMutationChain (SchedulerControl.machine program dispatcher) terminal
        (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher (bit :: suffix)
          (Registers.newJob program) continuation parents fuel 0) configurations →
      configurations.length = ExactCheckpointRun.jobCost program dispatcher (bit :: suffix) fuel →
      RootResetExactTraceAgreement.SelectorChain (RootResetFinitePrioritySelector.selectStep? program dispatcher)
        (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher (bit :: suffix)
          (Registers.newJob program) continuation parents fuel 0) configurations := by
  dsimp only
  intro terminal configurations actual lengthEq
  cases fuel with
  | zero => exact (positive rfl).elim
  | succ remaining =>
      let bits := bit :: suffix
      let environment := environmentCode (compileActions program dispatcher.tree) bits
      let continuation := RootResetEmptyHandoffContext.exitTerm program dispatcher stage jobs bits
      let afterParents := PrimitiveFuel.pendingParents environment continuation remaining parents
      let fullParents := PrimitiveFuel.pendingParents environment continuation (remaining + 1) parents
      obtain ⟨outerContext, fullContext, innerContext, targetContext, descentTicks, responseTicks, response, baseRun⟩ :=
        nonemptyBase_toSelected_zeroRunAt program dispatcher bit suffix continuation
          (Dovetail.clockExit_admissible stage jobs environment) remaining parents
      have parentSplit : fullParents =
          .right (SchedulerResponse.pendingFunction program dispatcher bits continuation) :: afterParents := by
        simpa [fullParents, afterParents, environment, continuation, SchedulerResponse.pendingFunction,
          PendingFrame.environmentCode_eq_envelope, PendingFrame.frameFunction] using
          (pendingParents_succ_cons environment continuation remaining parents)
      have baseRun' : ZeroMutationRun (SchedulerControl.machine program dispatcher) descentTicks
          (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher bits
            (Registers.newJob program) continuation parents (remaining + 1) 0)
          (upConfiguration program dispatcher (Registers.newJob program).clearScan omega
            (ContextCursor.frames fullContext omega
              (.right (SchedulerResponse.pendingFunction program dispatcher bits continuation) :: afterParents))) := by
        rw [← parentSplit]
        simpa [bits, continuation, environment, fullParents] using baseRun
      have response' : SelectedResponseTrace program dispatcher bits continuation
          (baseCarrier environment continuation) (Dovetail.clockExit_admissible stage jobs environment)
          (Registers.newJob program).clearScan bit suffix outerContext fullContext innerContext targetContext
          afterParents responseTicks := by
        simpa [bits, continuation, environment, afterParents] using response
      have normal : RootResetOrderedCarrier.NormalInvariant program dispatcher.tree bits continuation
          (baseCarrier environment continuation) ((Registers.newJob program).clearScan).phase (bit :: suffix) 0 := by
        simpa only [MutableBase.initial_eq_baseCarrier] using!
          (RootResetOrderedCarrier.NormalInvariant.initialBase program dispatcher.tree bits continuation
            (baseBeta environment continuation))
      have boundaries := boundaries_of_base program dispatcher bit suffix stage jobs remaining parents clean response'
      have nonempty : ∀ k, k ≤ remaining + 1 →
          (CTS.iterate program k ⟨CTS.zeroPhase program, bit :: suffix⟩).data ≠ [] := by
        intro k bound
        exact allNonempty k bound
      obtain ⟨witnessTerminal, witnessConfigurations, witnessChain, witnessSelected, witnessLength⟩ :=
        selectedSweepWitness program dispatcher bits stage jobs jobsBound parents layers clean remaining
          (Registers.newJob program).clearScan (CTS.zeroPhase program) bit suffix (baseCarrier environment continuation)
          outerContext fullContext innerContext targetContext responseTicks 0
          (RegistersCoherent.initial program).clearScan response' normal boundaries nonempty
      have wholeChain := ExactMutationChain.prepend baseRun' witnessChain
      have wholeSelected := RootResetExactTraceAgreement.SelectorChain.prepend baseRun' witnessSelected
      apply selectorChain_of_same_exact_length wholeChain actual _ wholeSelected
      rw [witnessLength, lengthEq]
      exact nonemptySweepCost_initial_eq_jobCost program dispatcher bits (remaining + 1)


end PureSFormal.Research.RootResetFiniteMixedNonemptySweep
