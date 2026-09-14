import PureSFormal.PureS.SchedulerNestedResponse
import PureSFormal.Research.RootResetExactTraceAgreement
import PureSFormal.Research.RootResetRuntimeContextBridge
import PureSFormal.Research.RootResetWholeStageClassifier

/-!
# Persistent DOWN/UP carrier-traversal agreement

This module isolates the exact carrier seam used by every nonempty response.
The persistent controller first traverses a canonical carrier in the `DOWN`
family without mutation, then ascends from `omega` in the `UP` family and
contracts the construction-selected live front.  The theorems below identify
that mutation with one root-relative `contractAt?` operation on the erased
bare term.

The result is indexed by `CanonicalTraversal.SelectedFront` and, for the global
wrapper, by the existing `SelectedResponseTrace`, so the selected-front
provenance needed to determine the contraction address is explicit.
-/

namespace PureSFormal.Research.RootResetPersistentCarrierTraversalAgreement

open PureSFormal.PureS
open PureSFormal.PureS.SchedulerControl
open PureSFormal.PureS.SchedulerInvariant
open PureSFormal.PureS.SchedulerCycle
open PureSFormal.PureS.SchedulerResponseInvariant
open PureSFormal.PureS.SchedulerCompletedContext

/-! ## Root-relative C4 address and target -/

/-- The construction-selected carrier-front address, lifted through an
arbitrary runtime parent stack. -/
def selectedFrontAddress (parents : List ParentFrame)
    (outerContext : Context) : Address :=
  RootResetSelectorContract.contextAddress (contextOfParents parents) ++
    RootResetSelectorContract.contextAddress outerContext

/-- The construction-selected C4 target, lifted through the same arbitrary
runtime parent stack. -/
def selectedFrontTarget (parents : List ParentFrame) (bit : Bool)
    (outerContext : Context) (predecessor : Term) : Term :=
  (contextOfParents parents).plug
    (outerContext.plug (Carrier.tombstone bit predecessor predecessor))

/-- The selected-front relation exposes a literal saturated live-cell redex;
its proof-independent address contracts to the named whole target below every
runtime parent stack. -/
theorem selectedFront_contractAt?_belowParents
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {seedBits : List Bool} {continuation source : Term}
    {bit : Bool} {suffix : List Bool} {outerContext : Context}
    (selected : CanonicalTraversal.SelectedFront program tree seedBits
      continuation source bit suffix outerContext)
    (parents : List ParentFrame) :
    ∃ predecessor,
      source = outerContext.plug
        (Term.app (PureSFormal.PureS.live bit) predecessor) ∧
      ((contextOfParents parents).plug source).contractAt?
          (selectedFrontAddress parents outerContext) =
        some (selectedFrontTarget parents bit outerContext predecessor) := by
  obtain ⟨predecessor, sourceEq⟩ := selected.source_split
  have rootContract :
      (Term.app (PureSFormal.PureS.live bit) predecessor).contractRoot? =
        some (Carrier.tombstone bit predecessor predecessor) := by
    rfl
  have localContract := RootResetRuntimeContextBridge.contractAt?_contextAddress
    outerContext (Term.app (PureSFormal.PureS.live bit) predecessor)
  rw [rootContract] at localContract
  have lifted := RootResetWholeStageClassifier.contractAt?_plug_append
    (contextOfParents parents)
    (RootResetSelectorContract.contextAddress outerContext) localContract
  rw [sourceEq]
  refine ⟨predecessor, rfl, ?_⟩
  simpa [selectedFrontAddress, selectedFrontTarget] using lifted

/-- Any two selected-front derivations for the same admissible carrier produce
the same lifted root address. -/
theorem selectedFrontAddress_proofIndependent
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {seedBits : List Bool} {continuation source : Term}
    (admissible : Carrier.Admissible continuation)
    {firstBit secondBit : Bool}
    {firstSuffix secondSuffix : List Bool}
    {firstOuter secondOuter : Context}
    (first : CanonicalTraversal.SelectedFront program tree seedBits continuation
      source firstBit firstSuffix firstOuter)
    (second : CanonicalTraversal.SelectedFront program tree seedBits continuation
      source secondBit secondSuffix secondOuter)
    (parents : List ParentFrame) :
    selectedFrontAddress parents firstOuter =
      selectedFrontAddress parents secondOuter := by
  unfold selectedFrontAddress
  have outerEq :=
    (CanonicalTraversal.SelectedFront.deterministic admissible first second).2.2
  subst secondOuter
  rfl

/-! ## Exact DOWN, UP/omega, and post-C4 configurations -/

/-- Provenance-bearing package for the exact three configurations at a
nonempty carrier seam: canonical `DOWN`, mutation-free `UP` at `omega`, and
the unique post-C4 `UP` sample. -/
structure CanonicalDownUpC4Trace
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (seedBits : List Bool) (continuation source : Term)
    (registers : Registers program) (bit : Bool) (suffix : List Bool)
    (outerContext fullContext innerContext : Context)
    (parents : List ParentFrame) : Prop where
  sourceDescent : CanonicalTraversal.Descent program dispatcher.tree seedBits
    continuation source (bit :: suffix) fullContext
  selected : CanonicalTraversal.SelectedFront program dispatcher.tree seedBits
    continuation source bit suffix outerContext
  path : SchedulerAscent.FrontPath fullContext outerContext bit innerContext
  downAudit : AuditedOccurrence program dispatcher.tree
    (downConfiguration program dispatcher registers source parents).cursor.erase
  upAudit : AuditedOccurrence program dispatcher.tree
    (upConfiguration program dispatcher registers omega
      (ContextCursor.frames fullContext omega parents)).cursor.erase
  notSeen : registers.seen = false
  downToUp : ∃ downTicks,
    ZeroMutationRun (SchedulerControl.machine program dispatcher) downTicks
      (downConfiguration program dispatcher registers source parents)
      (upConfiguration program dispatcher registers omega
        (ContextCursor.frames fullContext omega parents))
  upFindsC4 : ∃ upBound,
    FiniteController.seekMutation
        (SchedulerControl.machine program dispatcher) upBound
        (upConfiguration program dispatcher registers omega
          (ContextCursor.frames fullContext omega parents)) =
      some (upConfiguration program dispatcher (registers.observeLive bit)
        (Carrier.tombstone bit (SchedulerAscent.frontPredecessor innerContext)
          (SchedulerAscent.frontPredecessor innerContext))
        (ContextCursor.frames outerContext
          (Carrier.tombstone bit (SchedulerAscent.frontPredecessor innerContext)
            (SchedulerAscent.frontPredecessor innerContext)) parents))
  downFindsC4 : ∃ bound,
    FiniteController.seekMutation
        (SchedulerControl.machine program dispatcher) bound
        (downConfiguration program dispatcher registers source parents) =
      some (upConfiguration program dispatcher (registers.observeLive bit)
        (Carrier.tombstone bit (SchedulerAscent.frontPredecessor innerContext)
          (SchedulerAscent.frontPredecessor innerContext))
        (ContextCursor.frames outerContext
          (Carrier.tombstone bit (SchedulerAscent.frontPredecessor innerContext)
            (SchedulerAscent.frontPredecessor innerContext)) parents))
  downErase :
    (downConfiguration program dispatcher registers source parents).cursor.erase =
      (contextOfParents parents).plug source
  upErase :
    (upConfiguration program dispatcher registers omega
      (ContextCursor.frames fullContext omega parents)).cursor.erase =
      (contextOfParents parents).plug source
  c4Erase :
    (upConfiguration program dispatcher (registers.observeLive bit)
      (Carrier.tombstone bit (SchedulerAscent.frontPredecessor innerContext)
        (SchedulerAscent.frontPredecessor innerContext))
      (ContextCursor.frames outerContext
        (Carrier.tombstone bit (SchedulerAscent.frontPredecessor innerContext)
          (SchedulerAscent.frontPredecessor innerContext)) parents)).cursor.erase =
      selectedFrontTarget parents bit outerContext
        (SchedulerAscent.frontPredecessor innerContext)
  contracts :
    ((downConfiguration program dispatcher registers source parents).cursor.erase).contractAt?
        (selectedFrontAddress parents outerContext) =
      some
        (upConfiguration program dispatcher (registers.observeLive bit)
          (Carrier.tombstone bit
            (SchedulerAscent.frontPredecessor innerContext)
            (SchedulerAscent.frontPredecessor innerContext))
          (ContextCursor.frames outerContext
            (Carrier.tombstone bit
              (SchedulerAscent.frontPredecessor innerContext)
              (SchedulerAscent.frontPredecessor innerContext)) parents)).cursor.erase

/-- Construct the exact DOWN/UP/C4 bridge from the canonical traversal and
selected-front witnesses used by the scheduler response trace. -/
theorem canonicalDownUpC4Trace
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (seedBits : List Bool) (continuation source : Term)
    (registers : Registers program) (bit : Bool) (suffix : List Bool)
    {outerContext fullContext innerContext : Context}
    (sourceDescent : CanonicalTraversal.Descent program dispatcher.tree seedBits
      continuation source (bit :: suffix) fullContext)
    (selected : CanonicalTraversal.SelectedFront program dispatcher.tree seedBits
      continuation source bit suffix outerContext)
    (path : SchedulerAscent.FrontPath fullContext outerContext bit innerContext)
    (parents : List ParentFrame) (notSeen : registers.seen = false) :
    CanonicalDownUpC4Trace program dispatcher seedBits continuation source
      registers bit suffix outerContext fullContext innerContext parents := by
  obtain ⟨downTicks, downToUp⟩ :=
    run_downDescent registers sourceDescent parents
  obtain ⟨upBound, upFindsC4⟩ :=
    SchedulerAscent.selectedFront_seekMutation program dispatcher registers path
      parents notSeen
  have downFindsC4 := downToUp.seekMutation_prepend upFindsC4
  have downAudit : AuditedOccurrence program dispatcher.tree
      (downConfiguration program dispatcher registers source parents).cursor.erase := by
    simpa [downConfiguration] using
      (auditedOccurrence_downDescent sourceDescent parents)
  have upAudit : AuditedOccurrence program dispatcher.tree
      (upConfiguration program dispatcher registers omega
        (ContextCursor.frames fullContext omega parents)).cursor.erase := by
    simpa [upConfiguration] using
      (auditedOccurrence_upDescent sourceDescent parents)
  have downErase :
      (downConfiguration program dispatcher registers source parents).cursor.erase =
        (contextOfParents parents).plug source := by
    exact RootResetRuntimeContextBridge.cursorErase_eq_contextOfParents_plug
      source parents
  have upErase :
      (upConfiguration program dispatcher registers omega
        (ContextCursor.frames fullContext omega parents)).cursor.erase =
        (contextOfParents parents).plug source := by
    change Cursor.rebuild (ContextCursor.frames fullContext omega parents) omega = _
    rw [rebuild_contextFrames, sourceDescent.source_eq,
      contextOfParents_plug]
  have c4Erase :
      (upConfiguration program dispatcher (registers.observeLive bit)
        (Carrier.tombstone bit (SchedulerAscent.frontPredecessor innerContext)
          (SchedulerAscent.frontPredecessor innerContext))
        (ContextCursor.frames outerContext
          (Carrier.tombstone bit (SchedulerAscent.frontPredecessor innerContext)
            (SchedulerAscent.frontPredecessor innerContext)) parents)).cursor.erase =
        selectedFrontTarget parents bit outerContext
          (SchedulerAscent.frontPredecessor innerContext) := by
    change Cursor.rebuild
      (ContextCursor.frames outerContext
        (Carrier.tombstone bit (SchedulerAscent.frontPredecessor innerContext)
          (SchedulerAscent.frontPredecessor innerContext)) parents)
      (Carrier.tombstone bit (SchedulerAscent.frontPredecessor innerContext)
        (SchedulerAscent.frontPredecessor innerContext)) = _
    rw [rebuild_contextFrames, ← contextOfParents_plug]
    rfl
  obtain ⟨predecessor, sourceEq, wholeContract⟩ :=
    selectedFront_contractAt?_belowParents selected parents
  have predecessorEq : predecessor =
      SchedulerAscent.frontPredecessor innerContext := by
    have sourceByPath : source = outerContext.plug
        (Term.app (PureSFormal.PureS.live bit)
          (SchedulerAscent.frontPredecessor innerContext)) := by
      rw [← sourceDescent.source_eq, path.full_eq]
      simp [Context.plug_comp, SchedulerAscent.frontPredecessor]
    have filled : outerContext.plug
          (Term.app (PureSFormal.PureS.live bit) predecessor) =
        outerContext.plug
          (Term.app (PureSFormal.PureS.live bit)
            (SchedulerAscent.frontPredecessor innerContext)) :=
      sourceEq.symm.trans sourceByPath
    have cellEq := SchedulerAscent.context_plug_injective outerContext filled
    injection cellEq
  subst predecessor
  have contracts :
      ((downConfiguration program dispatcher registers source parents).cursor.erase).contractAt?
          (selectedFrontAddress parents outerContext) =
        some
          (upConfiguration program dispatcher (registers.observeLive bit)
            (Carrier.tombstone bit
              (SchedulerAscent.frontPredecessor innerContext)
              (SchedulerAscent.frontPredecessor innerContext))
            (ContextCursor.frames outerContext
              (Carrier.tombstone bit
                (SchedulerAscent.frontPredecessor innerContext)
                (SchedulerAscent.frontPredecessor innerContext)) parents)).cursor.erase := by
    rw [downErase, c4Erase]
    exact wholeContract
  exact ⟨sourceDescent, selected, path, downAudit, upAudit, notSeen,
    ⟨downTicks, downToUp⟩,
    ⟨upBound, upFindsC4⟩, ⟨downTicks + upBound, downFindsC4⟩,
    downErase, upErase, c4Erase, contracts⟩

namespace CanonicalDownUpC4Trace

/-- Both administrative endpoints expose the same exact root-path occurrence,
despite carrying different cursor positions and finite-control families. -/
theorem rootPaths
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {seedBits : List Bool} {continuation source : Term}
    {registers : Registers program} {bit : Bool} {suffix : List Bool}
    {outerContext fullContext innerContext : Context}
    {parents : List ParentFrame}
    (trace : CanonicalDownUpC4Trace program dispatcher seedBits continuation
      source registers bit suffix outerContext fullContext innerContext parents) :
    (∃ (bits : List Bool) (continuation root : Term) (outer : Context),
      RootPath.Root program dispatcher.tree bits continuation root ∧
        (downConfiguration program dispatcher registers source parents).cursor.erase =
          outer.plug root) ∧
    (∃ (bits : List Bool) (continuation root : Term) (outer : Context),
      RootPath.Root program dispatcher.tree bits continuation root ∧
        (upConfiguration program dispatcher registers omega
          (ContextCursor.frames fullContext omega parents)).cursor.erase =
          outer.plug root) := by
  exact ⟨trace.downAudit.rootPath, trace.upAudit.rootPath⟩

/-- The scheduler's exact singleton mutation chain from the canonical DOWN
source to the post-C4 UP sample. -/
theorem exactMutationChain
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {seedBits : List Bool} {continuation source : Term}
    {registers : Registers program} {bit : Bool} {suffix : List Bool}
    {outerContext fullContext innerContext : Context}
    {parents : List ParentFrame}
    (trace : CanonicalDownUpC4Trace program dispatcher seedBits continuation
      source registers bit suffix outerContext fullContext innerContext parents) :
    let down := downConfiguration program dispatcher registers source parents
    let c4 := upConfiguration program dispatcher (registers.observeLive bit)
      (Carrier.tombstone bit (SchedulerAscent.frontPredecessor innerContext)
        (SchedulerAscent.frontPredecessor innerContext))
      (ContextCursor.frames outerContext
        (Carrier.tombstone bit (SchedulerAscent.frontPredecessor innerContext)
          (SchedulerAscent.frontPredecessor innerContext)) parents)
    ExactMutationChain (SchedulerControl.machine program dispatcher) c4 down
      [c4] := by
  dsimp only
  obtain ⟨bound, found⟩ := trace.downFindsC4
  exact .next bound found (.done 0 ⟨rfl, rfl⟩)

/-- Once a bare selector reconstructs this canonical address, the same
singleton is a `SelectorChain`.  This is the direct adapter used by the global
exact-trace transfer, with address reconstruction stated as an explicit
premise. -/
theorem selectorChain
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {seedBits : List Bool} {continuation source : Term}
    {registers : Registers program} {bit : Bool} {suffix : List Bool}
    {outerContext fullContext innerContext : Context}
    {parents : List ParentFrame}
    (trace : CanonicalDownUpC4Trace program dispatcher seedBits continuation
      source registers bit suffix outerContext fullContext innerContext parents)
    (selector : Term → Option Term)
    (reconstructs :
      selector
          (downConfiguration program dispatcher registers source parents).cursor.erase =
        ((downConfiguration program dispatcher registers source parents).cursor.erase).contractAt?
          (selectedFrontAddress parents outerContext)) :
    RootResetExactTraceAgreement.SelectorChain selector
      (downConfiguration program dispatcher registers source parents)
      [upConfiguration program dispatcher (registers.observeLive bit)
        (Carrier.tombstone bit (SchedulerAscent.frontPredecessor innerContext)
          (SchedulerAscent.frontPredecessor innerContext))
        (ContextCursor.frames outerContext
          (Carrier.tombstone bit (SchedulerAscent.frontPredecessor innerContext)
            (SchedulerAscent.frontPredecessor innerContext)) parents)] := by
  apply RootResetExactTraceAgreement.SelectorChain.next
  · rw [reconstructs]
    exact trace.contracts
  · exact .done _

end CanonicalDownUpC4Trace

/-! ## Exact response-chain specialization -/

/-- The selected response trace supplies the canonical DOWN/UP/C4 bridge at
every pending-frame depth and below every completed outer continuation stack.
The singleton exact mutation chain and singleton indexed sample are directly
composable with the existing response-chain algebra. -/
theorem selectedResponse_downUpC4_exactSegment
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (inputBits seedBits : List Bool) (continuation source : Term)
    (admissible : Carrier.Admissible continuation)
    (registers : Registers program) (phase : CTS.Phase program)
    (coherent : RegistersCoherent registers phase [] false)
    (bit : Bool) (suffix : List Bool) (remaining sampleIndex : Nat)
    (outerParents : List ParentFrame) (layers : Nat)
    (outer : CompletedParents program dispatcher outerParents layers)
    {outerContext fullContext innerContext targetContext : Context}
    {ticks : Nat}
    (response : SelectedResponseTrace program dispatcher seedBits continuation
      source admissible registers bit suffix outerContext fullContext
      innerContext targetContext
      (PrimitiveFuel.pendingParents
        (environmentCode (compileActions program dispatcher.tree) seedBits)
        continuation remaining outerParents) ticks) :
    let pendingParents :=
      .right (SchedulerResponse.pendingFunction program dispatcher seedBits
        continuation) ::
        PrimitiveFuel.pendingParents
          (environmentCode (compileActions program dispatcher.tree) seedBits)
          continuation remaining outerParents
    let down := downConfiguration program dispatcher registers source
      pendingParents
    let up := upConfiguration program dispatcher registers omega
      (ContextCursor.frames fullContext omega pendingParents)
    let c4 := SchedulerNestedResponse.selectedC4Configuration program dispatcher
      registers bit outerContext innerContext pendingParents
    CanonicalDownUpC4Trace program dispatcher seedBits continuation source
        registers bit suffix outerContext fullContext innerContext
        pendingParents ∧
      ExactMutationChain (SchedulerControl.machine program dispatcher) c4 down
        [c4] ∧
      IndexedResponseSampledStates program dispatcher inputBits sampleIndex
        [c4] ∧
      down.cursor.erase = up.cursor.erase ∧
      down.cursor.erase.contractAt?
          (selectedFrontAddress pendingParents outerContext) =
        some c4.cursor.erase := by
  dsimp only
  let pendingParents : List ParentFrame :=
    .right (SchedulerResponse.pendingFunction program dispatcher seedBits
      continuation) ::
      PrimitiveFuel.pendingParents
        (environmentCode (compileActions program dispatcher.tree) seedBits)
        continuation remaining outerParents
  let down := downConfiguration program dispatcher registers source
    pendingParents
  let up := upConfiguration program dispatcher registers omega
    (ContextCursor.frames fullContext omega pendingParents)
  let c4 := SchedulerNestedResponse.selectedC4Configuration program dispatcher
    registers bit outerContext innerContext pendingParents
  have notSeen : registers.seen = false := by
    simpa using! coherent.seen_eq
  have bridge := canonicalDownUpC4Trace program dispatcher seedBits continuation
    source registers bit suffix response.sourceDescent response.selected
    response.path pendingParents notSeen
  have c4Eq : c4 =
      upConfiguration program dispatcher (registers.observeLive bit)
        (Carrier.tombstone bit (SchedulerAscent.frontPredecessor innerContext)
          (SchedulerAscent.frontPredecessor innerContext))
        (ContextCursor.frames outerContext
          (Carrier.tombstone bit (SchedulerAscent.frontPredecessor innerContext)
            (SchedulerAscent.frontPredecessor innerContext)) pendingParents) := by
    rfl
  have chain : ExactMutationChain
      (SchedulerControl.machine program dispatcher) c4 down [c4] := by
    simpa [down, c4, c4Eq] using bridge.exactMutationChain
  have sampledC4 : SampledState program dispatcher inputBits (sampleIndex + 1)
      c4 := by
    simpa [c4, pendingParents] using
      (SchedulerNestedResponse.selectedC4_sampledAt program dispatcher
        inputBits seedBits continuation source admissible registers phase
        coherent bit suffix remaining sampleIndex outerParents layers outer
        response)
  have sampled : IndexedResponseSampledStates program dispatcher inputBits
      sampleIndex [c4] :=
    .cons sampleIndex sampledC4 (.nil (sampleIndex + 1))
  refine ⟨bridge, chain, sampled, ?_, ?_⟩
  · simpa [down, up] using! bridge.downErase.trans bridge.upErase.symm
  · simpa [down, c4, c4Eq] using! bridge.contracts

end PureSFormal.Research.RootResetPersistentCarrierTraversalAgreement
