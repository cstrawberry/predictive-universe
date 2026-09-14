import PureSFormal.Research.RootResetFreshAppenderSelectorChain

/-!
# Chronology preservation at every canonical nonempty response

Deleting the construction-selected live front preserves the completed-Local
count and adds exactly one tombstone through arbitrary nested carriers.
The following completed response adds one Local, restoring equal counts.
For nonempty output, generic response traces also supply the public decoder
and accumulator exclusion certificates used by fresh continuation selection.
-/

namespace PureSFormal.Research.RootResetCarrierChronologyPreservation
open PureSFormal.PureS
open RootResetPersistentResponseSelector
open RootResetResponseCarrierChronology

structure CountStep (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (source target : Term) : Prop where
  locals : carrierLocalCount? program tree target = carrierLocalCount? program tree source
  tombstones : carrierTombstoneCount? program tree target =
    (carrierTombstoneCount? program tree source).map Nat.succ

theorem tombstone_path_chronology
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation predecessor : Term} {decoded : List Bool}
    (admissible : Carrier.Admissible continuation)
    (path : CarrierDecoder.PathDecodes program tree bits continuation predecessor decoded)
    (bit : Bool) (audit : Term) :
    carrierLocalCount? program tree (Carrier.tombstone bit predecessor audit) =
        carrierLocalCount? program tree predecessor ∧
      carrierTombstoneCount? program tree (Carrier.tombstone bit predecessor audit) =
        (carrierTombstoneCount? program tree predecessor).map Nat.succ := by
  have baseNone := CheckpointRun.parseBase?_tombstone_path_none admissible path bit audit
  have localNone := CheckpointRun.parseLocal?_tombstone_none program tree bit predecessor audit
  constructor
  · rw [carrierLocalCount?, baseNone]
    dsimp only
    rw [localNone]
    dsimp only
    rw [CanonicalStep.parseCell?_tombstone]
  · rw [carrierTombstoneCount?, baseNone]
    dsimp only
    rw [localNone]
    dsimp only
    rw [CanonicalStep.parseCell?_tombstone]

theorem CountStep.deleteLive
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation predecessor : Term} {decoded : List Bool}
    (admissible : Carrier.Admissible continuation)
    (path : CarrierDecoder.PathDecodes program tree bits continuation predecessor decoded)
    (bit : Bool) :
    CountStep program tree (.app (live bit) predecessor)
      (Carrier.tombstone bit predecessor predecessor) := by
  obtain ⟨locals, tombstones⟩ := tombstone_path_chronology admissible path bit predecessor
  constructor
  · rw [locals, carrierLocalCount?_live]
  · rw [tombstones, carrierTombstoneCount?_live]

theorem queue_pathDecodes
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation endpoint : Term} {decoded suffix : List Bool}
    {context : Context} (queue : CanonicalTraversal.QueueContext context suffix)
    (path : CarrierDecoder.PathDecodes program tree bits continuation endpoint decoded) :
    CarrierDecoder.PathDecodes program tree bits continuation (context.plug endpoint) (decoded ++ suffix) := by
  induction queue with
  | hole => simpa only [List.append_nil] using! path
  | live bit queue ih =>
      simpa only [Context.plug, List.append_assoc] using CarrierDecoder.PathDecodes.live bit ih
  | tombstone bit audit queue ih => exact CarrierDecoder.PathDecodes.tombstone bit audit ih

theorem CountStep.underQueue
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source target : Term} {sourceData targetData suffix : List Bool}
    {context : Context} (queue : CanonicalTraversal.QueueContext context suffix)
    (admissible : Carrier.Admissible continuation)
    (sourcePath : CarrierDecoder.PathDecodes program tree bits continuation source sourceData)
    (targetPath : CarrierDecoder.PathDecodes program tree bits continuation target targetData)
    (step : CountStep program tree source target) :
    CountStep program tree (context.plug source) (context.plug target) := by
  induction queue with
  | hole => exact step
  | live bit queue ih =>
      constructor
      · change carrierLocalCount? program tree (.app (live bit) _) = carrierLocalCount? program tree (.app (live bit) _)
        rw [carrierLocalCount?_live, carrierLocalCount?_live, ih.locals]
      · change carrierTombstoneCount? program tree (.app (live bit) _) = (carrierTombstoneCount? program tree (.app (live bit) _)).map Nat.succ
        rw [carrierTombstoneCount?_live, carrierTombstoneCount?_live, ih.tombstones]
  | tombstone bit audit queue ih =>
      obtain ⟨sourceLocals, sourceTombs⟩ := tombstone_path_chronology admissible (queue_pathDecodes queue sourcePath) bit audit
      obtain ⟨targetLocals, targetTombs⟩ := tombstone_path_chronology admissible (queue_pathDecodes queue targetPath) bit audit
      constructor
      · exact targetLocals.trans (ih.locals.trans sourceLocals.symm)
      · change carrierTombstoneCount? program tree (Carrier.tombstone bit _ audit) =
          (carrierTombstoneCount? program tree (Carrier.tombstone bit _ audit)).map Nat.succ
        rw [targetTombs, sourceTombs, ih.tombstones]

theorem CountStep.underLocal
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {source target : Term} {sourceView targetView : CheckpointDecoder.LocalView program}
    (sourceParsed : CheckpointDecoder.parseLocal? program tree source = some sourceView)
    (targetParsed : CheckpointDecoder.parseLocal? program tree target = some targetView)
    (step : CountStep program tree sourceView.accumulator targetView.accumulator) :
    CountStep program tree source target := by
  have sourceBaseNone := CheckpointRun.parseBase?_none_of_localShape (CheckpointDecoder.parseLocal?_sound sourceParsed)
  have targetBaseNone := CheckpointRun.parseBase?_none_of_localShape (CheckpointDecoder.parseLocal?_sound targetParsed)
  constructor
  · rw [carrierLocalCount?, targetBaseNone]
    dsimp only
    rw [targetParsed, carrierLocalCount?, sourceBaseNone]
    dsimp only
    rw [sourceParsed, step.locals]
  · rw [carrierTombstoneCount?, targetBaseNone]
    dsimp only
    rw [targetParsed, carrierTombstoneCount?, sourceBaseNone]
    dsimp only
    rw [sourceParsed]
    exact step.tombstones

theorem spineCountStep_underQueue
    {context : Context} {suffix : List Bool}
    (queue : CanonicalTraversal.QueueContext context suffix) (source target : Term)
    (step : spineTombstoneCount? target = (spineTombstoneCount? source).map Nat.succ) :
    spineTombstoneCount? (context.plug target) =
      (spineTombstoneCount? (context.plug source)).map Nat.succ := by
  induction queue with
  | hole => exact step
  | live bit queue ih =>
      change spineTombstoneCount? (.app (live bit) _) = (spineTombstoneCount? (.app (live bit) _)).map Nat.succ
      rw [spineTombstoneCount?_live, spineTombstoneCount?_live, ih]
  | tombstone bit audit queue ih =>
      change spineTombstoneCount? (Carrier.tombstone bit _ audit) =
        (spineTombstoneCount? (Carrier.tombstone bit _ audit)).map Nat.succ
      rw [spineTombstoneCount?_tombstone, spineTombstoneCount?_tombstone, ih]

theorem queueSelection_spineCountStep
    {sourceContext cellOuter targetContext : Context}
    {bit : Bool} {suffix : List Bool} {address : Address}
    (selected : CanonicalTraversal.QueueSelection sourceContext bit suffix cellOuter address)
    (endpoint predecessor : Term)
    (sourceEq : sourceContext.plug endpoint = cellOuter.plug (.app (live bit) predecessor))
    (targetEq : targetContext.plug endpoint = cellOuter.plug (Carrier.tombstone bit predecessor predecessor)) :
    spineTombstoneCount? (targetContext.plug endpoint) =
      (spineTombstoneCount? (sourceContext.plug endpoint)).map Nat.succ := by
  rw [sourceEq, targetEq]
  apply spineCountStep_underQueue (CanonicalTraversal.QueueContext.ofOuterContext selected.outerShape)
  rw [spineTombstoneCount?_tombstone, spineTombstoneCount?_live]

theorem queueSelection_countStep
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation endpoint : Term} {decoded : List Bool}
    (admissible : Carrier.Admissible continuation)
    (path : CarrierDecoder.PathDecodes program tree bits continuation endpoint decoded)
    {sourceContext cellOuter targetContext : Context}
    {bit : Bool} {suffix : List Bool} {address : Address}
    (selected : CanonicalTraversal.QueueSelection sourceContext bit suffix cellOuter address)
    (predecessor : Term)
    (sourceEq : sourceContext.plug endpoint = cellOuter.plug (.app (live bit) predecessor))
    (targetEq : targetContext.plug endpoint = cellOuter.plug (Carrier.tombstone bit predecessor predecessor)) :
    CountStep program tree (sourceContext.plug endpoint) (targetContext.plug endpoint) := by
  obtain ⟨innerContext, innerEmpty, contextEq⟩ := selected.split
  have beforeEq : innerContext.plug endpoint = predecessor := by
    rw [contextEq, Context.plug_comp] at sourceEq
    exact (Term.app.inj (SchedulerAscent.context_plug_injective cellOuter sourceEq)).2
  have predecessorPath : CarrierDecoder.PathDecodes program tree bits continuation predecessor (decoded ++ []) := by
    rw [← beforeEq]
    exact queue_pathDecodes innerEmpty path
  rw [sourceEq, targetEq]
  exact (CountStep.deleteLive admissible predecessorPath bit).underQueue
    (CanonicalTraversal.QueueContext.ofOuterContext selected.outerShape) admissible
    (.live bit predecessorPath) (.tombstone bit predecessor predecessorPath)

theorem CountStep.underMutableBase
    (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation source target : Term)
    (step : spineTombstoneCount? target = (spineTombstoneCount? source).map Nat.succ) :
    CountStep program tree
      (MutableBase.mutableBase (compileActions program tree) bits continuation source)
      (MutableBase.mutableBase (compileActions program tree) bits continuation target) := by
  unfold MutableBase.mutableBase
  constructor
  · rw [carrierLocalCount?, CheckpointDecoder.parseBase?_mutableBase,
      carrierLocalCount?, CheckpointDecoder.parseBase?_mutableBase]
  · rw [carrierTombstoneCount?, CheckpointDecoder.parseBase?_mutableBase,
      carrierTombstoneCount?, CheckpointDecoder.parseBase?_mutableBase]
    exact step

theorem descent_pathDecodes
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term} {decoded : List Bool} {context : Context}
    (admissible : Carrier.Admissible continuation)
    (descent : CanonicalTraversal.Descent program tree bits continuation source decoded context) :
    CarrierDecoder.PathDecodes program tree bits continuation source decoded :=
  CarrierDecoder.decode?_sound program tree bits continuation admissible
    (LocalTransition.Descent.decode_eq program tree bits continuation admissible descent)

theorem CountStep.underCanonicalLocal
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    (bits : List Bool) (continuation snapshot : Term) (status : ReachableAudit.HaltState)
    {route : Dispatcher.Route} {label : ActionLabel program}
    {routeContext sourceSegment sourceCurrent targetSegment targetCurrent : Context}
    (selectedRoute : CanonicalTraversal.RouteContext (selectedAction program) snapshot tree route label routeContext)
    (step : CountStep program tree (sourceSegment.plug (sourceCurrent.plug omega))
      (targetSegment.plug (targetCurrent.plug omega))) :
    CountStep program tree
      ((CanonicalTraversal.localContext program bits continuation snapshot status label routeContext sourceSegment sourceCurrent).plug omega)
      ((CanonicalTraversal.localContext program bits continuation snapshot status label routeContext targetSegment targetCurrent).plug omega) := by
  exact CountStep.underLocal
    (RootResetSelectedFrontParserAgreement.parseLocal?_localContext bits continuation snapshot status selectedRoute)
    (RootResetSelectedFrontParserAgreement.parseLocal?_localContext bits continuation snapshot status selectedRoute) step



open CanonicalTraversal

theorem SelectedFront.delete_countStep
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term}
    {bit : Bool} {suffix : List Bool} {outerContext : Context}
    (admissible : Carrier.Admissible continuation)
    (h : SelectedFront program tree bits continuation source bit suffix
      outerContext) :
    ∃ target targetContext predecessor,
      Descent program tree bits continuation target suffix targetContext ∧
      FrontCertificate source target bit suffix predecessor outerContext ∧ CountStep program tree source target := by
  induction h with
  | @base queueContext cellOuter bit suffix cellAddress queue selected =>
      obtain ⟨targetQueueContext, predecessor, targetQueue, sourceEq, targetEq⟩ :=
        selected.deleteContext omega
      let sourceQueue := queueContext.plug omega
      let targetQueueTerm := targetQueueContext.plug omega
      let target := MutableBase.mutableBase (compileActions program tree) bits
        continuation targetQueueTerm
      let targetContext :=
        (MutableBase.queueContext (compileActions program tree) bits continuation
          (baseBeta
            (environmentCode (compileActions program tree) bits)
            continuation)).comp targetQueueContext
      have targetDescent : Descent program tree bits continuation target suffix
          targetContext :=
        Descent.base targetQueue
      have cellCertificate : FrontCertificate sourceQueue targetQueueTerm bit
          suffix predecessor cellOuter :=
        ⟨AscentContext.ofCellOuter selected.outerShape, sourceEq, targetEq⟩
      have wholeCertificate : FrontCertificate
          (MutableBase.mutableBase (compileActions program tree) bits continuation
            sourceQueue)
          target bit suffix predecessor
          ((MutableBase.queueContext (compileActions program tree) bits
            continuation
            (baseBeta
              (environmentCode (compileActions program tree) bits)
              continuation)).comp cellOuter) := by
        simpa [target, targetQueueTerm, MutableBase.mutableBase] using
          cellCertificate.wrapBase (compileActions program tree) bits continuation
      have countStep := CountStep.underMutableBase program tree bits continuation _ _
        (queueSelection_spineCountStep selected omega predecessor sourceEq targetEq)
      exact ⟨target, targetContext, predecessor, targetDescent, wholeCertificate, countStep⟩
  | @inside snapshot currentContext segmentContext routeContext currentOuter bit
      currentSuffix appended status route label snapshotInv current segment
      selectedRoute inner ih =>
      obtain ⟨targetCurrent, targetCurrentContext, predecessor,
        targetCurrentDescent, currentCertificate, currentCounts⟩ := ih
      have targetCurrentAtHole : Descent program tree bits continuation
          (targetCurrentContext.plug omega) currentSuffix targetCurrentContext :=
        targetCurrentDescent.source_eq.symm ▸ targetCurrentDescent
      have currentCertificateAtHole : FrontCertificate
          (currentContext.plug omega) (targetCurrentContext.plug omega) bit
          currentSuffix predecessor currentOuter :=
        targetCurrentDescent.source_eq.symm ▸ currentCertificate
      have segmentCertificate := currentCertificateAtHole.wrapQueue segment
      have actionCertificate := segmentCertificate.wrapAction program label
        snapshot
      have routeCertificate :=
        FrontCertificate.wrapRoute selectedRoute actionCertificate
      have wholeCertificate := routeCertificate.wrapLocal bits continuation
        snapshot status
      let targetContext := localContext program bits continuation snapshot status
        label routeContext segmentContext targetCurrentContext
      have targetDescent : Descent program tree bits continuation
          (targetContext.plug omega) (currentSuffix ++ appended) targetContext :=
        Descent.local snapshotInv targetCurrentAtHole segment selectedRoute
      have currentCountsAtHole : CountStep program tree (currentContext.plug omega) (targetCurrentContext.plug omega) := by
        rw [targetCurrentDescent.source_eq]
        exact currentCounts
      have accumulatorCounts := currentCountsAtHole.underQueue segment admissible
        (descent_pathDecodes admissible current) (descent_pathDecodes admissible targetCurrentAtHole)
      have countStep := CountStep.underCanonicalLocal bits continuation snapshot status selectedRoute accumulatorCounts
      refine ⟨targetContext.plug omega, targetContext, predecessor,
        targetDescent, ?_, countStep⟩
      simpa [targetContext, localContext, dispatcherContext, accumulatorContext,
        Context.plug_comp] using wholeCertificate
  | @segment snapshot currentContext segmentContext routeContext cellOuter bit
      suffix cellAddress status route label snapshotInv current queue
      selectedRoute selected =>
      obtain ⟨targetSegmentContext, predecessor, targetSegment, sourceEq,
        targetEq⟩ := selected.deleteContext (currentContext.plug omega)
      let sourceAccumulator := segmentContext.plug (currentContext.plug omega)
      let targetAccumulator :=
        targetSegmentContext.plug (currentContext.plug omega)
      have cellCertificate : FrontCertificate sourceAccumulator targetAccumulator
          bit suffix predecessor cellOuter :=
        ⟨AscentContext.ofCellOuter selected.outerShape, sourceEq, targetEq⟩
      have actionCertificate := cellCertificate.wrapAction program label snapshot
      have routeCertificate :=
        FrontCertificate.wrapRoute selectedRoute actionCertificate
      have wholeCertificate := routeCertificate.wrapLocal bits continuation
        snapshot status
      let targetContext := localContext program bits continuation snapshot status
        label routeContext targetSegmentContext currentContext
      have targetDescent : Descent program tree bits continuation
          (targetContext.plug omega) suffix targetContext := by
        simpa [targetContext] using
          Descent.local (status := status) snapshotInv current targetSegment
            selectedRoute
      have accumulatorCounts := queueSelection_countStep admissible
        (descent_pathDecodes admissible current) selected predecessor sourceEq targetEq
      have countStep := CountStep.underCanonicalLocal bits continuation snapshot status selectedRoute accumulatorCounts
      refine ⟨targetContext.plug omega, targetContext, predecessor,
        targetDescent, ?_, countStep⟩
      simpa [sourceAccumulator, targetAccumulator, targetContext, localContext,
        dispatcherContext, accumulatorContext, Context.plug_comp] using
          wholeCertificate

theorem SelectedFront.countStep_of_source_eq
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term}
    {bit : Bool} {suffix : List Bool} {outerContext : Context}
    (admissible : Carrier.Admissible continuation)
    (selected : CanonicalTraversal.SelectedFront program tree bits continuation source bit suffix outerContext)
    (predecessor : Term)
    (sourceEq : source = outerContext.plug (.app (live bit) predecessor)) :
    CountStep program tree source (outerContext.plug (Carrier.tombstone bit predecessor predecessor)) := by
  obtain ⟨target, targetContext, found, _descent, certificate, counts⟩ :=
    SelectedFront.delete_countStep admissible selected
  have same : found = predecessor :=
    (Term.app.inj (SchedulerAscent.context_plug_injective outerContext
      (certificate.source_eq.symm.trans sourceEq))).2
  rw [same] at certificate
  rw [certificate.target_eq] at counts
  exact counts

theorem selectedResponseTrace_countStep
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {seedBits : List Bool} {continuation source : Term}
    {admissible : Carrier.Admissible continuation}
    {registers : SchedulerControl.Registers program} {bit : Bool} {suffix : List Bool}
    {outerContext fullContext innerContext targetContext : Context}
    {parents : List ParentFrame} {ticks : Nat}
    (trace : SchedulerCycle.SelectedResponseTrace program dispatcher seedBits continuation source
      admissible registers bit suffix outerContext fullContext innerContext targetContext parents ticks) :
    CountStep program dispatcher.tree source (SchedulerCycle.deletedCarrier bit outerContext innerContext) := by
  apply SelectedFront.countStep_of_source_eq admissible trace.selected (SchedulerAscent.frontPredecessor innerContext)
  rw [← trace.sourceDescent.source_eq, trace.path.full_eq]
  rw [Context.plug_comp]
  rfl

/-- Every complete generic nonempty response preserves equality of the
completed-Local and tombstone counts while advancing each by one. -/
theorem selectedResponseTrace_chronology_preserved
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {seedBits : List Bool} {continuation source : Term}
    {admissible : Carrier.Admissible continuation}
    {registers : SchedulerControl.Registers program} {bit : Bool} {suffix : List Bool}
    {outerContext fullContext innerContext targetContext : Context}
    {parents : List ParentFrame} {ticks : Nat}
    (trace : SchedulerCycle.SelectedResponseTrace program dispatcher seedBits continuation source
      admissible registers bit suffix outerContext fullContext innerContext targetContext parents ticks)
    (count : Nat)
    (sourceLocals : carrierLocalCount? program dispatcher.tree source = some count)
    (sourceTombs : carrierTombstoneCount? program dispatcher.tree source = some count) :
    let deleted := SchedulerCycle.deletedCarrier bit outerContext innerContext
    let completed := LocalResponse.completed seedBits continuation deleted
      (SchedulerResponse.completedRoute program dispatcher
        (SchedulerCycle.scannedRegisters registers bit suffix) bit deleted)
    carrierLocalCount? program dispatcher.tree deleted = some count ∧
      carrierTombstoneCount? program dispatcher.tree deleted = some (count + 1) ∧
      carrierLocalCount? program dispatcher.tree completed = some (count + 1) ∧
      carrierTombstoneCount? program dispatcher.tree completed = some (count + 1) := by
  dsimp only
  have deleted := selectedResponseTrace_countStep trace
  have locals := deleted.locals.trans sourceLocals
  have tombs : carrierTombstoneCount? program dispatcher.tree
      (SchedulerCycle.deletedCarrier bit outerContext innerContext) = some (count + 1) := by
    rw [deleted.tombstones, sourceTombs]
    rfl
  have completed := completedResponse_chronology program dispatcher
    (SchedulerCycle.scannedRegisters registers bit suffix) bit seedBits continuation
    (SchedulerCycle.deletedCarrier bit outerContext innerContext)
  exact ⟨locals, tombs, completed.1.trans (congrArg (Option.map Nat.succ) locals), completed.2.1.trans tombs⟩

theorem actionAccumulator_classifier_none_of_arity
    (program : CTS.Program) (label : ActionLabel program) (carrier : Term)
    (arity : carrier.headArity = 5 ∨ carrier.headArity = 6) :
    RootResetAccumulatorClassifier.classify? (actionAccumulator program label carrier) = none := by
  have rejected : RootResetAccumulatorClassifier.analyze? carrier = none := by
    apply RootResetFreshClockSelectorChain.analyze?_none_of_arities
    all_goals rcases arity with five | six
    all_goals first | (rw [five]; decide) | (rw [six]; decide)
  rw [RootResetAccumulatorClassifier.classify?]
  rcases label with ⟨phase, bit⟩
  cases bit with
  | false => rw [actionAccumulator, rejected]
  | true => rw [actionAccumulator, RootResetFreshClockSelectorChain.analyze?_appenderAccumulator_none _ _ rejected]

theorem selectedResponseTrace_freshFacts
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {seedBits : List Bool} {continuation source : Term}
    {admissible : Carrier.Admissible continuation}
    {registers : SchedulerControl.Registers program} {bit : Bool} {suffix : List Bool}
    {outerContext fullContext innerContext targetContext : Context}
    {parents : List ParentFrame} {ticks : Nat}
    (trace : SchedulerCycle.SelectedResponseTrace program dispatcher seedBits continuation source
      admissible registers bit suffix outerContext fullContext innerContext targetContext parents ticks)
    (nonempty : (CTS.absorbingStep program ⟨registers.phase, bit :: suffix⟩).data ≠ []) :
    let responseRegisters := SchedulerCycle.scannedRegisters registers bit suffix
    let carrier := SchedulerCycle.deletedCarrier bit outerContext innerContext
    (∃ first rest, CheckpointDecoder.decodeCarrier? program dispatcher.tree
      (actionAccumulator program (responseRegisters.phase, bit) carrier) = some (first :: rest)) ∧
      RootResetAccumulatorClassifier.classify?
        (actionAccumulator program (responseRegisters.phase, bit) carrier) = none := by
  dsimp only
  have phaseEq : (SchedulerCycle.scannedRegisters registers bit suffix).phase = registers.phase := by
    rw [SchedulerCycle.scannedRegisters, SchedulerCycle.scanRegisters_phase]
    unfold SchedulerControl.Registers.observeLive
    split <;> rfl
  have decoded := CarrierActionDecode.decode_actionAccumulator program dispatcher.tree seedBits continuation
    admissible ((SchedulerCycle.scannedRegisters registers bit suffix).phase, bit) trace.targetDecode
  have publicDecoded := CheckpointRun.decodeCarrier?_of_decode program dispatcher.tree seedBits continuation admissible decoded
  rw [ActionDecode.outputData_eq_ordinaryStep_data, phaseEq] at publicDecoded
  constructor
  · rw [phaseEq]
    cases outputEq : (CTS.absorbingStep program ⟨registers.phase, bit :: suffix⟩).data with
    | nil => exact False.elim (nonempty outputEq)
    | cons first rest => exact ⟨first, rest, outputEq ▸ publicDecoded⟩
  · exact actionAccumulator_classifier_none_of_arity program _ _
      (trace.targetHolds.wholeCarrierAudit admissible)

theorem selectedResponseTrace_freshPrefix
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {seedBits : List Bool} {continuation source : Term}
    {admissible : Carrier.Admissible continuation}
    {registers : SchedulerControl.Registers program} {bit : Bool} {suffix : List Bool}
    {outerContext fullContext innerContext targetContext : Context}
    {parents : List ParentFrame} {ticks : Nat}
    (trace : SchedulerCycle.SelectedResponseTrace program dispatcher seedBits continuation source
      admissible registers bit suffix outerContext fullContext innerContext targetContext parents ticks)
    (nonempty : (CTS.absorbingStep program ⟨registers.phase, bit :: suffix⟩).data ≠ []) (endpoint : Term) :
    let responseRegisters := SchedulerCycle.scannedRegisters registers bit suffix
    let carrier := SchedulerCycle.deletedCarrier bit outerContext innerContext
    let whole := RootResetFreshClockSelectorChain.freshTerm program dispatcher responseRegisters bit seedBits carrier endpoint
    RootResetFreshAppenderSelectorChain.FreshPrefix program dispatcher whole endpoint
      (RootResetReachableStageGrammar.localContinuationContext whole)
      [RootResetFreshClockSelectorChain.freshView program dispatcher responseRegisters bit seedBits carrier endpoint] := by
  obtain ⟨decoded, rejected⟩ := selectedResponseTrace_freshFacts trace nonempty
  exact .completed _ _ _ _ _ decoded rejected

theorem selectedResponseTrace_freshClockParents
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {seedBits : List Bool} {continuation source : Term}
    {admissible : Carrier.Admissible continuation}
    {registers : SchedulerControl.Registers program} {bit : Bool} {suffix : List Bool}
    {outerContext fullContext innerContext targetContext : Context}
    {parents : List ParentFrame} {ticks : Nat}
    (trace : SchedulerCycle.SelectedResponseTrace program dispatcher seedBits continuation source
      admissible registers bit suffix outerContext fullContext innerContext targetContext parents ticks)
    (nonempty : (CTS.absorbingStep program ⟨registers.phase, bit :: suffix⟩).data ≠ []) :
    RootResetFreshClockSelectorChain.FreshClockParents program dispatcher
      (SchedulerRootContinuation.freshContinuationParents program dispatcher
        (SchedulerCycle.scannedRegisters registers bit suffix) bit seedBits
        (SchedulerCycle.deletedCarrier bit outerContext innerContext) []) := by
  obtain ⟨decoded, rejected⟩ := selectedResponseTrace_freshFacts trace nonempty
  exact .fresh _ _ _ _ decoded rejected

theorem selectedResponseTrace_traversable_extension
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {seedBits : List Bool} {continuation source : Term}
    {admissible : Carrier.Admissible continuation}
    {registers : SchedulerControl.Registers program} {bit : Bool} {suffix : List Bool}
    {outerContext fullContext innerContext targetContext : Context}
    {parents : List ParentFrame} {ticks : Nat}
    (trace : SchedulerCycle.SelectedResponseTrace program dispatcher seedBits continuation source
      admissible registers bit suffix outerContext fullContext innerContext targetContext parents ticks)
    (nonempty : (CTS.absorbingStep program ⟨registers.phase, bit :: suffix⟩).data ≠ [])
    {outerParents : List ParentFrame} {layers : Nat}
    (outer : RootResetTraversableCompletedParents.TraversableParents program dispatcher outerParents layers) :
    RootResetTraversableCompletedParents.TraversableParents program dispatcher
      (SchedulerRootContinuation.freshContinuationParents program dispatcher
        (SchedulerCycle.scannedRegisters registers bit suffix) bit seedBits
        (SchedulerCycle.deletedCarrier bit outerContext innerContext) outerParents) (layers + 1) := by
  exact .fresh outer _ _ _ _ (selectedResponseTrace_freshFacts trace nonempty).1


end PureSFormal.Research.RootResetCarrierChronologyPreservation
