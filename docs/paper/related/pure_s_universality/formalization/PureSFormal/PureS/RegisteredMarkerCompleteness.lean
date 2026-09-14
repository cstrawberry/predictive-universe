import PureSFormal.PureS.RegisteredMarkerBridge
import PureSFormal.PureS.SchedulerStageAssembly

/-! Arbitrary-horizon completeness for the decoder-free registered event.
No converse, regular language, or root-reset event identity is asserted here. -/
namespace PureSFormal.PureS.RegisteredMarkerBridge

open FiniteController SchedulerControl SchedulerInvariant SchedulerCycle
  SchedulerNestedResponse SchedulerResponseInvariant SchedulerCompletedContext

/-- A bounded job whose source first empties after `previous + 1` CTS steps
reaches the registered contraction. Its completed outer history is arbitrary. -/
theorem nonemptyBase_event_of_firstEmpty
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (previous : Nat)
    (continuation : Term) (admissible : Carrier.Admissible continuation)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers)
    (priorNonempty : ∀ k, k ≤ previous →
      (CTS.iterate program k (CTS.initial program (bit :: suffix))).data ≠ [])
    (firstEmpty :
      (CTS.iterate program (previous + 1)
        (CTS.initial program (bit :: suffix))).data = []) :
    TermEvent.EventuallyPerformsRegisteredMarkHRaw program dispatcher
      (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher
        (bit :: suffix) (Registers.newJob program) continuation outerParents
        (previous + 1) 0) := by
  let bits := bit :: suffix
  let environment := environmentCode (compileActions program dispatcher.tree) bits
  obtain ⟨outerContext, fullContext, innerContext, targetContext,
      descentTicks, responseTicks, response, baseRun⟩ :=
    nonemptyBase_toSelected_zeroRunAt program dispatcher bit suffix continuation
      admissible previous outerParents
  have baseParentsSplit :
      PrimitiveFuel.pendingParents environment continuation (previous + 1) outerParents =
        .right (SchedulerResponse.pendingFunction program dispatcher bits continuation) ::
          PrimitiveFuel.pendingParents environment continuation previous outerParents := by
    simpa [environment, SchedulerResponse.pendingFunction,
      PendingFrame.environmentCode_eq_envelope, PendingFrame.frameFunction] using
      (pendingParents_succ_cons environment continuation previous outerParents)
  have baseRun' : ZeroMutationRun (machine program dispatcher) descentTicks
      (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher bits
        (Registers.newJob program) continuation outerParents (previous + 1) 0)
      (upConfiguration program dispatcher (Registers.newJob program).clearScan omega
        (ContextCursor.frames fullContext omega
          (.right (SchedulerResponse.pendingFunction program dispatcher bits continuation) ::
            PrimitiveFuel.pendingParents environment continuation previous outerParents))) := by
    rw [← baseParentsSplit]
    simpa [bits, environment] using baseRun
  obtain ⟨terminalRegisters, terminalPhase, terminalBit, terminalSuffix,
      terminalSource, terminalOuterContext, terminalFullContext,
      terminalInnerContext, terminalTargetContext, terminalTicks,
      prefixConfigurations, prefixChain, prefixSampled, prefixLength,
      terminalCoherent, terminalTrace, terminalEq⟩ :=
    SchedulerFirstEmpty.selectedNonemptyPrefixKeepingPendingAt program dispatcher bits bits
      continuation admissible outerParents layers outer previous 0 0
      (Registers.newJob program).clearScan (CTS.zeroPhase program) bit suffix
      (baseCarrier environment continuation) outerContext fullContext innerContext
      targetContext responseTicks (RegistersCoherent.initial program).clearScan
      (by simpa [bits, environment] using response)
      (by simpa [bits, CTS.initial] using priorNonempty)
  have currentEq : ⟨terminalPhase, terminalBit :: terminalSuffix⟩ =
      CTS.iterate program previous (CTS.initial program bits) := by
    simpa [bits, CTS.initial] using terminalEq
  have terminalEmpty :
      (CTS.absorbingStep program
        ⟨terminalRegisters.phase, terminalBit :: terminalSuffix⟩).data = [] := by
    rw [terminalCoherent.phase_eq, currentEq, ← CTS.iterate_succ]
    exact firstEmpty
  apply eventually_of_reaches program dispatcher baseRun'.run_eq
  obtain ⟨prefixTicks, prefixRun⟩ := exactChain_reachable prefixChain
  apply eventually_of_reaches program dispatcher (by simpa using! prefixRun)
  exact selectedResponse_empty_event program dispatcher bits continuation terminalSource
    admissible terminalRegisters terminalBit terminalSuffix _ terminalTicks terminalTrace
    (by simpa using! terminalCoherent.seen_eq)
    (by simpa using! terminalCoherent.tail_eq) terminalEmpty

/-- Every positive-stage source is reached on the generator's actual raw run,
with the completed-parent invariant retained for composition into its jobs. -/
theorem positiveStageSource_reachable
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (fuel : Nat) :
    ∃ parents,
      CompletedParents program dispatcher parents (CheckpointRun.cumulativeLayers fuel) ∧
      ∃ ticks, run (machine program dispatcher) ticks
        (initialConfiguration program dispatcher bits) =
        SchedulerRecurrence.stageSourceConfiguration program dispatcher bits (fuel + 1)
          parents := by
  cases fuel with
  | zero =>
      refine ⟨[], ?_, ?_⟩
      · exact CompletedParents.root program dispatcher
      · exact exactChain_reachable
          (SchedulerRecurrence.initialPreludeChain program dispatcher bits)
  | succ previous =>
      obtain ⟨stages⟩ := SchedulerRecurrence.positiveStages program dispatcher bits previous
      exact ⟨stages.nextParents, stages.nextOuter, exactChain_reachable stages.chain⟩

/-- A first-empty CTS transition at any finite index is realized by a
registered marker on the literal encoded controller trajectory. -/
theorem firstEmpty_performs
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (previous : Nat)
    (priorNonempty : ∀ k, k ≤ previous →
      (CTS.iterate program k (CTS.initial program (bit :: suffix))).data ≠ [])
    (firstEmpty :
      (CTS.iterate program (previous + 1)
        (CTS.initial program (bit :: suffix))).data = []) :
    TermEvent.EventuallyPerformsRegisteredMarkHRaw program dispatcher
      (initialConfiguration program dispatcher (bit :: suffix)) := by
  let bits := bit :: suffix
  let environment := environmentCode (compileActions program dispatcher.tree) bits
  let continuation := Dovetail.clockExit (previous + 1) previous environment
  obtain ⟨parents, outer, ticks, reaches⟩ :=
    positiveStageSource_reachable program dispatcher bits previous
  apply eventually_of_reaches program dispatcher reaches
  have phase := SchedulerNestedPhase.positiveStagePhaseInvariantAt program
    dispatcher bits (Registers.newJob program) (CTS.zeroPhase program) [] false
    (RegistersCoherent.initial program) parents
    (CheckpointRun.cumulativeLayers previous) outer 0 previous
  have phaseChain : ExactMutationChain (machine program dispatcher)
      (SchedulerNestedPhase.fuelTerminalConfigurationAt program dispatcher bits
        (Registers.newJob program) continuation parents (previous + 1) 0)
      (SchedulerRecurrence.stageSourceConfiguration program dispatcher bits
        (previous + 1) parents)
      (SchedulerNestedPhase.positiveStageConfigurationsAt program dispatcher bits
        (Registers.newJob program) parents previous) := by
    simpa [continuation, environment, SchedulerRecurrence.stageSourceConfiguration]
      using phase.chain
  obtain ⟨phaseTicks, phaseRun⟩ := exactChain_reachable phaseChain
  apply eventually_of_reaches program dispatcher phaseRun
  exact nonemptyBase_event_of_firstEmpty program dispatcher bit suffix previous continuation
    (Dovetail.clockExit_admissible (previous + 1) previous environment)
    parents _ outer priorNonempty firstEmpty

/-- Global completeness: reaching an empty CTS word implies occurrence of
the actual decoder-free registered contraction, for every encoded input. -/
theorem eventuallyEmpty_implies_registeredEvent
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool)
    (halts : ∃ horizon,
      (CTS.iterate program horizon (CTS.initial program bits)).data = []) :
    TermEvent.EventuallyPerformsRegisteredMarkHRaw program dispatcher
      (initialConfiguration program dispatcher bits) := by
  cases bits with
  | nil => exact initiallyEmpty_performs program dispatcher
  | cons bit suffix =>
      obtain ⟨horizon, empty⟩ := halts
      cases SchedulerStageCases.allNonempty_or_firstEmpty program (bit :: suffix) horizon with
      | allNonempty allNonempty => exact (allNonempty horizon (Nat.le_refl _) empty).elim
      | firstEmpty first =>
          obtain ⟨previous, indexEq, bound, priorNonempty, firstEmpty⟩ :=
            first.split_nonemptySeed
          exact firstEmpty_performs program dispatcher bit suffix previous priorNonempty firstEmpty

end PureSFormal.PureS.RegisteredMarkerBridge
