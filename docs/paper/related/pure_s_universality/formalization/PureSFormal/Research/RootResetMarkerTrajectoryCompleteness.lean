import PureSFormal.Research.RootResetFiniteMarkerObserver
import PureSFormal.Research.RootResetFiniteStageLaws
import PureSFormal.Research.RootResetFiniteAllInputsTraceAgreement

namespace PureSFormal.Research.RootResetMarkerTrajectoryCompleteness
set_option maxRecDepth 10000
set_option maxHeartbeats 1000000
open PureSFormal.PureS
open FiniteController SchedulerControl SchedulerInvariant SchedulerCycle
open SchedulerNestedResponse SchedulerResponseInvariant SchedulerCompletedContext
open RootResetCleanTraversableParents RootResetFiniteMarkerObserver

def EventuallyObserved (program : CTS.Program) (layout : ActionDispatcher program)
    (initial : SchedulerInvariant.Configuration program layout) : Prop :=
  ∃ ticks, accepts? program layout
    (run (SchedulerControl.machine program layout) ticks initial).cursor.erase = true

theorem observed_of_reaches (program : CTS.Program) (layout : ActionDispatcher program)
    {before after : SchedulerInvariant.Configuration program layout} {ticks : Nat}
    (reaches : run (SchedulerControl.machine program layout) ticks before = after)
    (observed : EventuallyObserved program layout after) :
    EventuallyObserved program layout before := by
  obtain ⟨rest, event⟩ := observed
  exact ⟨ticks + rest, by rw [run_add, reaches]; exact event⟩

theorem selected_empty_observed
    {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {history : Nat}
    (outer : CleanParents program layout parents history)
    (horizon jobs remaining : Nat) (bits : List Bool)
    {source : Term} {registers : Registers program} {bit : Bool} {suffix : List Bool}
    {outerContext fullContext innerContext targetContext : Context} {ticks count : Nat}
    (trace : SelectedResponseTrace program layout bits
      (RootResetEmptyHandoffContext.exitTerm program layout horizon jobs bits) source
      (Dovetail.clockExit_admissible ..) registers bit suffix
      outerContext fullContext innerContext targetContext
      (PrimitiveFuel.pendingParents (environmentCode (compileActions program layout.tree) bits)
        (RootResetEmptyHandoffContext.exitTerm program layout horizon jobs bits) remaining parents) ticks)
    (normal : RootResetOrderedCarrier.NormalInvariant program layout.tree bits
      (RootResetEmptyHandoffContext.exitTerm program layout horizon jobs bits)
      source registers.phase (bit :: suffix) count)
    (output : (CTS.absorbingStep program ⟨registers.phase, bit :: suffix⟩).data = []) :
    EventuallyObserved program layout
      (upConfiguration program layout registers omega
        (ContextCursor.frames fullContext omega
          (.right (SchedulerResponse.pendingFunction program layout bits
            (RootResetEmptyHandoffContext.exitTerm program layout horizon jobs bits)) ::
            PrimitiveFuel.pendingParents (environmentCode (compileActions program layout.tree) bits)
              (RootResetEmptyHandoffContext.exitTerm program layout horizon jobs bits) remaining parents))) := by
  let continuation := RootResetEmptyHandoffContext.exitTerm program layout horizon jobs bits
  let layers := List.replicate remaining (word bits, continuation)
  have actual := RootResetRegisteredMarkerOccurrence.normal_fresh_pass outer layers horizon jobs bits trace normal output
  have selected := fresh_pass_accepts program layout _ _ actual
    (by
      change (TermEvent.freshHaltPayload? (freshHField (deletedCarrier bit outerContext innerContext))).isSome = true
      rw [TermEvent.freshHaltPayload?_freshHField]; rfl)
  change accepts? program layout
    (Cursor.rebuild parents (RootResetActivePendingAgreement.wrap (compileActions program layout.tree) layers
      (LocalResponse.completed bits continuation (deletedCarrier bit outerContext innerContext)
        (SchedulerResponse.completedRoute program layout (scannedRegisters registers bit suffix) bit
          (deletedCarrier bit outerContext innerContext))))) = true at selected
  rw [← RootResetFrameSpineWalker.rebuild_spineParents] at selected
  change accepts? program layout
    (Cursor.rebuild (RootResetActivePendingAgreement.parentsAfter (compileActions program layout.tree)
      (List.replicate remaining (word bits, continuation)) parents)
      (LocalResponse.completed bits continuation (deletedCarrier bit outerContext innerContext)
        (SchedulerResponse.completedRoute program layout (scannedRegisters registers bit suffix) bit
          (deletedCarrier bit outerContext innerContext)))) = true at selected
  rw [RootResetBaseEndpointExecution.parents_replicate, CheckpointDecoder.openEnvironment_word] at selected
  refine ⟨ticks, ?_⟩
  have reached := trace.execution.run_eq
  simp only [SchedulerResponse.pendingFunction, PendingFrame.frameFunction,
    PendingFrame.environmentCode_eq_envelope] at reached ⊢
  rw [reached]
  exact selected

theorem selected_firstEmpty_observed
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (stage jobs : Nat)
    (parents : List ParentFrame) (history : Nat)
    (outer : CleanParents program layout parents history) :
    ∀ (remaining : Nat) (registers : Registers program) (phase : CTS.Phase program)
      (bit : Bool) (suffix : List Bool) (source : Term)
      (outerContext fullContext innerContext targetContext : Context) (ticks count : Nat),
      RegistersCoherent registers phase [] false →
      SelectedResponseTrace program layout bits
        (RootResetEmptyHandoffContext.exitTerm program layout stage jobs bits) source
        (Dovetail.clockExit_admissible ..) registers bit suffix
        outerContext fullContext innerContext targetContext
        (PrimitiveFuel.pendingParents (environmentCode (compileActions program layout.tree) bits)
          (RootResetEmptyHandoffContext.exitTerm program layout stage jobs bits) remaining parents) ticks →
      RootResetOrderedCarrier.NormalInvariant program layout.tree bits
        (RootResetEmptyHandoffContext.exitTerm program layout stage jobs bits)
        source registers.phase (bit :: suffix) count →
      (∀ k, k ≤ remaining → (CTS.iterate program k ⟨phase, bit :: suffix⟩).data ≠ []) →
      (CTS.iterate program (remaining + 1) ⟨phase, bit :: suffix⟩).data = [] →
      EventuallyObserved program layout
        (upConfiguration program layout registers omega
          (ContextCursor.frames fullContext omega
            (.right (SchedulerResponse.pendingFunction program layout bits
              (RootResetEmptyHandoffContext.exitTerm program layout stage jobs bits)) ::
              PrimitiveFuel.pendingParents (environmentCode (compileActions program layout.tree) bits)
                (RootResetEmptyHandoffContext.exitTerm program layout stage jobs bits) remaining parents)))
  | 0, registers, phase, bit, suffix, source, outerContext, fullContext, innerContext, targetContext,
      ticks, count, coherent, trace, normal, _, empty => by
      exact selected_empty_observed outer stage jobs 0 bits trace normal
        (by rw [coherent.phase_eq]; exact empty)
  | remaining + 1, registers, phase, bit, suffix, source, outerContext, fullContext, innerContext, targetContext,
      ticks, count, coherent, trace, normal, prior, empty => by
      let continuation := RootResetEmptyHandoffContext.exitTerm program layout stage jobs bits
      let environment := environmentCode (compileActions program layout.tree) bits
      let afterParents := PrimitiveFuel.pendingParents environment continuation (remaining + 1) parents
      let nextParents := PrimitiveFuel.pendingParents environment continuation remaining parents
      let finalRegisters := scannedRegisters registers bit suffix
      let carrier := deletedCarrier bit outerContext innerContext
      have notSeen : registers.seen = false := by simpa using! coherent.seen_eq
      have noTail : registers.tail = false := by simpa using! coherent.tail_eq
      have firstNonempty : (CTS.absorbingStep program ⟨phase, bit :: suffix⟩).data ≠ [] :=
        prior 1 (Nat.succ_le_succ (Nat.zero_le remaining))
      cases dataEq : (CTS.absorbingStep program ⟨phase, bit :: suffix⟩).data with
      | nil => exact (firstNonempty dataEq).elim
      | cons nextBit nextSuffix =>
        have dataEqRegisters : (CTS.absorbingStep program ⟨registers.phase, bit :: suffix⟩).data =
            nextBit :: nextSuffix := by rw [coherent.phase_eq]; exact dataEq
        have parentSplit : afterParents =
            .right (SchedulerResponse.pendingFunction program layout bits continuation) :: nextParents := by
          simpa [afterParents, nextParents, environment, continuation, SchedulerResponse.pendingFunction,
            PendingFrame.environmentCode_eq_envelope, PendingFrame.frameFunction] using
            (pendingParents_succ_cons environment continuation remaining parents)
        have cycleTrace : SelectedResponseTrace program layout bits continuation source
            (Dovetail.clockExit_admissible stage jobs environment) registers bit suffix
            outerContext fullContext innerContext targetContext
            (.right (SchedulerResponse.pendingFunction program layout bits continuation) :: nextParents) ticks := by
          rw [← parentSplit]
          exact trace
        obtain ⟨nextContext, nextOuterContext, nextFullContext, nextInnerContext, nextTargetContext,
            returnTicks, downTicks, nextTicks, cycle⟩ :=
          pendingNonemptyCycleTrace program layout bits continuation source
            (Dovetail.clockExit_admissible stage jobs environment) registers bit suffix nextParents
            ticks cycleTrace notSeen noTail nextBit nextSuffix dataEqRegisters
        have finalCoherent : RegistersCoherent finalRegisters phase (bit :: suffix) false :=
          scannedRegisters_coherentAt program registers phase coherent bit suffix
        have nextCoherent := finalCoherent.advance
        have finalPhase : finalRegisters.phase = registers.phase :=
          finalCoherent.phase_eq.trans coherent.phase_eq.symm
        have stepEq : CTS.absorbingStep program ⟨phase, bit :: suffix⟩ =
            ⟨CTS.nextPhase program phase, nextBit :: nextSuffix⟩ := by
          cases step : CTS.absorbingStep program ⟨phase, bit :: suffix⟩ with
          | mk nextPhase output =>
            have phaseEq : nextPhase = CTS.nextPhase program phase := by
              simpa only [step] using (CTS.absorbingStep_phase program ⟨phase, bit :: suffix⟩)
            have outputEq : output = nextBit :: nextSuffix := by simpa only [step] using dataEq
            subst nextPhase output
            rfl
        have shifted (k : Nat) : CTS.iterate program (k + 1) ⟨phase, bit :: suffix⟩ =
            CTS.iterate program k ⟨CTS.nextPhase program phase, nextBit :: nextSuffix⟩ := by
          rw [CTS.iterate_add]
          change CTS.iterate program k (CTS.absorbingStep program ⟨phase, bit :: suffix⟩) = _
          rw [stepEq]
        have tailPrior : ∀ k, k ≤ remaining →
            (CTS.iterate program k ⟨CTS.nextPhase program phase, nextBit :: nextSuffix⟩).data ≠ [] := by
          intro k bounded
          rw [← shifted k]
          exact prior (k + 1) (Nat.succ_le_succ bounded)
        have tailEmpty : (CTS.iterate program (remaining + 1)
            ⟨CTS.nextPhase program phase, nextBit :: nextSuffix⟩).data = [] := by
          rw [← shifted (remaining + 1)]
          exact empty
        have preserved := RootResetOrderedCarrier.selectedResponseTrace_preserves trace normal
        let completed := LocalResponse.completed bits continuation carrier
          (SchedulerResponse.completedRoute program layout finalRegisters bit carrier)
        have nextNormal : RootResetOrderedCarrier.NormalInvariant program layout.tree bits continuation
            completed finalRegisters.advance.phase (nextBit :: nextSuffix) (count + 1) := by
          have result := preserved.2.2
          rw [dataEqRegisters] at result
          change RootResetOrderedCarrier.NormalInvariant program layout.tree bits continuation completed
            (CTS.nextPhase program registers.phase) (nextBit :: nextSuffix) (count + 1) at result
          simpa only [Registers.advance, finalPhase] using result
        have nextObserved := selected_firstEmpty_observed program layout bits stage jobs parents history outer remaining
          finalRegisters.advance (CTS.nextPhase program phase) nextBit nextSuffix completed
          nextOuterContext nextFullContext nextInnerContext nextTargetContext nextTicks (count + 1)
          nextCoherent cycle.nextResponse nextNormal tailPrior tailEmpty
        obtain ⟨bridgeDownTicks, bridgeDown⟩ := run_downDescent finalRegisters.advance cycle.nextResponse.sourceDescent
          (.right (SchedulerResponse.pendingFunction program layout bits continuation) :: nextParents)
        have bridge : ZeroMutationRun (SchedulerControl.machine program layout) (returnTicks + bridgeDownTicks)
            (selectedReturnConfiguration program layout registers bit suffix bits continuation carrier afterParents)
            (upConfiguration program layout finalRegisters.advance omega
              (ContextCursor.frames nextFullContext omega
                (.right (SchedulerResponse.pendingFunction program layout bits continuation) :: nextParents))) := by
          have down' : ZeroMutationRun (SchedulerControl.machine program layout) bridgeDownTicks
              (freshPendingDownConfiguration program layout registers bit suffix bits continuation carrier nextParents)
              (upConfiguration program layout finalRegisters.advance omega
                (ContextCursor.frames nextFullContext omega
                  (.right (SchedulerResponse.pendingFunction program layout bits continuation) :: nextParents))) := by
            simpa [freshPendingDownConfiguration, SchedulerResponse.freshNestedDownConfiguration,
              SchedulerResponse.normalPendingDownConfiguration, finalRegisters, carrier] using! bridgeDown
          have combined := cycle.returnToDown.trans down'
          rw [parentSplit]
          simpa [pendingReturnConfiguration, selectedReturnConfiguration, finalRegisters, carrier] using! combined
        have afterObserved := observed_of_reaches program layout bridge.run_eq nextObserved
        have reached := trace.execution.run_eq
        apply observed_of_reaches program layout (ticks := ticks) _ afterObserved
        simpa only [SchedulerResponse.pendingFunction, PendingFrame.frameFunction,
          PendingFrame.environmentCode_eq_envelope] using! reached

theorem nonemptyBase_firstEmpty_observed
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (stage jobs previous : Nat)
    (parents : List ParentFrame) (history : Nat)
    (outer : CleanParents program layout parents history)
    (prior : ∀ k, k ≤ previous → (CTS.iterate program k (CTS.initial program (bit :: suffix))).data ≠ [])
    (empty : (CTS.iterate program (previous + 1) (CTS.initial program (bit :: suffix))).data = []) :
    EventuallyObserved program layout
      (SchedulerNestedPhase.fuelTerminalConfigurationAt program layout (bit :: suffix)
        (Registers.newJob program) (RootResetEmptyHandoffContext.exitTerm program layout stage jobs (bit :: suffix))
        parents (previous + 1) 0) := by
  let bits := bit :: suffix
  let environment := environmentCode (compileActions program layout.tree) bits
  let continuation := RootResetEmptyHandoffContext.exitTerm program layout stage jobs bits
  obtain ⟨outerContext, fullContext, innerContext, targetContext, descentTicks, responseTicks, response, baseRun⟩ :=
    nonemptyBase_toSelected_zeroRunAt program layout bit suffix continuation
      (Dovetail.clockExit_admissible stage jobs environment) previous parents
  have response' : SelectedResponseTrace program layout bits continuation
      (baseCarrier environment continuation) (Dovetail.clockExit_admissible stage jobs environment)
      (Registers.newJob program).clearScan bit suffix outerContext fullContext innerContext targetContext
      (PrimitiveFuel.pendingParents environment continuation previous parents) responseTicks := response
  have normal : RootResetOrderedCarrier.NormalInvariant program layout.tree bits continuation
      (baseCarrier environment continuation) ((Registers.newJob program).clearScan).phase (bit :: suffix) 0 := by
    simpa only [MutableBase.initial_eq_baseCarrier] using!
      (RootResetOrderedCarrier.NormalInvariant.initialBase program layout.tree bits continuation
        (baseBeta environment continuation))
  have observed := selected_firstEmpty_observed program layout bits stage jobs parents history outer previous
    (Registers.newJob program).clearScan (CTS.zeroPhase program) bit suffix (baseCarrier environment continuation)
    outerContext fullContext innerContext targetContext responseTicks 0
    (RegistersCoherent.initial program).clearScan response' normal prior empty
  have parentSplit : PrimitiveFuel.pendingParents environment continuation (previous + 1) parents =
      .right (SchedulerResponse.pendingFunction program layout bits continuation) ::
        PrimitiveFuel.pendingParents environment continuation previous parents := by
    simpa [environment, SchedulerResponse.pendingFunction,
      PendingFrame.environmentCode_eq_envelope, PendingFrame.frameFunction] using
      (pendingParents_succ_cons environment continuation previous parents)
  have baseRun' : ZeroMutationRun (SchedulerControl.machine program layout) descentTicks
      (SchedulerNestedPhase.fuelTerminalConfigurationAt program layout bits
        (Registers.newJob program) continuation parents (previous + 1) 0)
      (upConfiguration program layout (Registers.newJob program).clearScan omega
        (ContextCursor.frames fullContext omega
          (.right (SchedulerResponse.pendingFunction program layout bits continuation) ::
            PrimitiveFuel.pendingParents environment continuation previous parents))) := by
    rw [← parentSplit]
    simpa [bits, environment] using baseRun
  exact observed_of_reaches program layout baseRun'.run_eq observed

theorem clean_positiveStageSource_reachable
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (previous : Nat) :
    ∃ parents, CleanParents program layout parents (CheckpointRun.cumulativeLayers previous) ∧
      ∃ ticks, run (SchedulerControl.machine program layout) ticks
        (initialConfiguration program layout (bit :: suffix)) =
        SchedulerRecurrence.stageSourceConfiguration program layout (bit :: suffix) (previous + 1) parents := by
  cases previous with
  | zero => exact ⟨[], .root, RegisteredMarkerBridge.exactChain_reachable
      (SchedulerRecurrence.initialPreludeChain program layout (bit :: suffix))⟩
  | succ previous =>
    have preserved := RootResetCertifiedStageAssembly.positiveStagesOfRaw_preserving
      program layout (bit :: suffix) (RootResetFinitePrioritySelector.selectStep? program layout)
      (fun fuel parents => CleanParents program layout parents (CheckpointRun.cumulativeLayers fuel))
      (CleanParents.root (program := program) (dispatcher := layout))
      (RootResetFiniteStageLaws.laws.prelude program layout (bit :: suffix))
      (by
        intro fuel sampleIndex parents _ clean indexEq
        exact RootResetParametricNonemptyTraceAgreement.bitcons_rawStageAt RootResetFiniteStageLaws.laws
          program layout bit suffix fuel sampleIndex parents clean indexEq) previous
    obtain ⟨certificate, clean⟩ := preserved
    exact ⟨certificate.stages.nextParents, clean, RegisteredMarkerBridge.exactChain_reachable certificate.stages.chain⟩

theorem firstEmpty_observed
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (previous : Nat)
    (prior : ∀ k, k ≤ previous → (CTS.iterate program k (CTS.initial program (bit :: suffix))).data ≠ [])
    (empty : (CTS.iterate program (previous + 1) (CTS.initial program (bit :: suffix))).data = []) :
    EventuallyObserved program layout (initialConfiguration program layout (bit :: suffix)) := by
  let bits := bit :: suffix
  let environment := environmentCode (compileActions program layout.tree) bits
  let continuation := Dovetail.clockExit (previous + 1) previous environment
  obtain ⟨parents, clean, ticks, reaches⟩ := clean_positiveStageSource_reachable program layout bit suffix previous
  apply observed_of_reaches program layout reaches
  have phase := SchedulerNestedPhase.positiveStagePhaseInvariantAt program layout bits
    (Registers.newJob program) (CTS.zeroPhase program) [] false (RegistersCoherent.initial program)
    parents (CheckpointRun.cumulativeLayers previous) clean.toCompleted 0 previous
  have phaseChain : ExactMutationChain (SchedulerControl.machine program layout)
      (SchedulerNestedPhase.fuelTerminalConfigurationAt program layout bits
        (Registers.newJob program) continuation parents (previous + 1) 0)
      (SchedulerRecurrence.stageSourceConfiguration program layout bits (previous + 1) parents)
      (SchedulerNestedPhase.positiveStageConfigurationsAt program layout bits
        (Registers.newJob program) parents previous) := by
    simpa [continuation, environment, SchedulerRecurrence.stageSourceConfiguration] using phase.chain
  obtain ⟨phaseTicks, phaseRun⟩ := RegisteredMarkerBridge.exactChain_reachable phaseChain
  apply observed_of_reaches program layout phaseRun
  exact nonemptyBase_firstEmpty_observed program layout bit suffix (previous + 1) previous previous
    parents _ clean prior empty

theorem initiallyEmpty_observed (program : CTS.Program) (layout : ActionDispatcher program) :
    EventuallyObserved program layout (initialConfiguration program layout []) := by
  let environment := environmentCode (compileActions program layout.tree) []
  let continuation := Dovetail.clockExit 1 0 environment
  let carrier := baseCarrier environment continuation
  let registers := SchedulerNestedEmpty.initialEmptyRegisters program
  obtain ⟨prefixTicks, prefixRun⟩ := RegisteredMarkerBridge.initialBase_reachable program layout []
  apply observed_of_reaches program layout prefixRun
  obtain ⟨downTicks, downRun⟩ := SchedulerNestedEmpty.emptyBase_toFirstFrame_zeroRun
    program layout continuation (Dovetail.clockExit_admissible 1 0 environment) 0 []
  apply observed_of_reaches program layout downRun.run_eq
  apply observed_of_reaches program layout (SchedulerEmpty.enterResponse_zeroRun program layout registers [] continuation carrier []).run_eq
  apply observed_of_reaches program layout (SchedulerEmpty.response_countedRun program layout registers [] continuation carrier []).run_eq
  have actual := RootResetInitialEmptyCommitAgreement.fresh_pass
    (CleanParents.root (program := program) (dispatcher := layout)) [] registers [] 1 0 carrier
    (.root (.base omega (baseBeta environment continuation) .omega))
    (RootResetEmptyOriginProbe.Reads.empty_base program layout.tree continuation (word []) (baseBeta environment continuation))
  refine ⟨0, fresh_pass_accepts program layout _ _ actual ?_⟩
  change (TermEvent.freshHaltPayload? (freshHField carrier)).isSome = true
  rw [TermEvent.freshHaltPayload?_freshHField]
  rfl

theorem eventuallyEmpty_implies_observed (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (empty : ∃ horizon, (CTS.iterate program horizon (CTS.initial program bits)).data = []) :
    EventuallyObserved program layout (initialConfiguration program layout bits) := by
  cases bits with
  | nil => exact initiallyEmpty_observed program layout
  | cons bit suffix =>
    obtain ⟨horizon, empty⟩ := empty
    cases SchedulerStageCases.allNonempty_or_firstEmpty program (bit :: suffix) horizon with
    | allNonempty prior => exact (prior horizon (Nat.le_refl _) empty).elim
    | firstEmpty first =>
      obtain ⟨previous, _, _, prior, firstEmpty⟩ := first.split_nonemptySeed
      exact firstEmpty_observed program layout bit suffix previous prior firstEmpty

theorem eventuallyEmpty_implies_observed_sample (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (empty : ∃ horizon, (CTS.iterate program horizon (CTS.initial program bits)).data = []) :
    let system := SchedulerInvariant.SampledGood.productiveSystem program layout bits
      (SchedulerBound.bound program layout) (initialConfiguration program layout bits)
      (SchedulerRecurrence.initialGood program layout bits)
    ∃ index, accepts? program layout (system.contractionRun index).cursor.erase = true := by
  dsimp only
  exact (ProductiveSystem.eventually_raw_iff_sampled _ (accepts? program layout)).1
    (eventuallyEmpty_implies_observed program layout bits empty)

theorem rootRun_eq_sample (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (index : Nat) :
    let system := SchedulerInvariant.SampledGood.productiveSystem program layout bits
      (SchedulerBound.bound program layout) (initialConfiguration program layout bits)
      (SchedulerRecurrence.initialGood program layout bits)
    RootResetTermOnlyTransfer.run (RootResetFinitePrioritySelector.selectStep? program layout) index
      (initialConfiguration program layout bits).cursor.erase = (system.contractionRun index).cursor.erase := by
  dsimp only
  induction index with
  | zero => rfl
  | succ index ih =>
    rw [RootResetTermOnlyTransfer.run_succ, ih,
      RootResetFiniteAllInputsTraceAgreement.selectsEveryContractionRun program layout bits index]
    rfl

/-- All-horizon completeness on the genuinely root-restarted term trajectory.
Term equality transports a proved term-observer value; the observer's separate
execution theorem supplies the actual contracted occurrence. -/
theorem eventuallyEmpty_implies_root_observed (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (empty : ∃ horizon, (CTS.iterate program horizon (CTS.initial program bits)).data = []) :
    ∃ index, accepts? program layout
      (RootResetTermOnlyTransfer.run (RootResetFinitePrioritySelector.selectStep? program layout) index
        (initialConfiguration program layout bits).cursor.erase) = true := by
  obtain ⟨index, accepted⟩ := eventuallyEmpty_implies_observed_sample program layout bits empty
  exact ⟨index, by rw [rootRun_eq_sample]; exact accepted⟩

theorem eventuallyEmpty_implies_actual_root_event (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (empty : ∃ horizon, (CTS.iterate program horizon (CTS.initial program bits)).data = []) :
    ∃ index ticks, RootResetRegisteredMarkerOccurrence.performsMarkH? program layout
      (run (RootResetFinitePrioritySelector.selectorContract program layout).machine ticks
        ((RootResetFinitePrioritySelector.selectorContract program layout).initial
          (RootResetTermOnlyTransfer.run (RootResetFinitePrioritySelector.selectStep? program layout) index
            (initialConfiguration program layout bits).cursor.erase))) = true := by
  obtain ⟨index, accepted⟩ := eventuallyEmpty_implies_root_observed program layout bits empty
  obtain ⟨ticks, actual⟩ := accepted_actual_root_event program layout _ accepted
  exact ⟨index, ticks, actual⟩

end PureSFormal.Research.RootResetMarkerTrajectoryCompleteness
