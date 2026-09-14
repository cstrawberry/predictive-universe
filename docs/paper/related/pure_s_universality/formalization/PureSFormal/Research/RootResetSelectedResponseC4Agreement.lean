import PureSFormal.Research.RootResetPersistentCarrierTraversalAgreement
import PureSFormal.Research.RootResetPersistentResponseSelector
import PureSFormal.Research.RootResetCertifiedStageAssembly

/-!
# Selected-response C4 selector agreement

The exact scheduler response trace reaches its first mutation by a
mutation-free `DOWN` descent and `UP` ascent followed by the construction's
selected-front C4 contraction.  This module packages the corresponding
response-aware bare-selector equation and the singleton `SelectorChain` used
by certified stage assembly.
-/

namespace PureSFormal.Research.RootResetSelectedResponseC4Agreement

open PureSFormal.PureS
open PureSFormal.PureS.SchedulerControl
open PureSFormal.PureS.SchedulerInvariant
open PureSFormal.PureS.SchedulerCycle
open PureSFormal.PureS.SchedulerCompletedContext
open PureSFormal.PureS.SchedulerResponseInvariant

namespace ResponseSelector

abbrev Selection := RootResetPersistentResponseSelector.Selection

/-- Exact branch facts showing that the response-aware classifier reaches its
fuel-aware base branch and returns the named target. -/
def BaseWinsAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (source target : Term) : Prop :=
  RootResetPersistentResponseSelector.freshDispatcherSelection?
      program dispatcher source = none ∧
    RootResetPersistentResponseSelector.responseBoundarySelection?
      program dispatcher source = none ∧
    RootResetPersistentResponseSelector.responseAppenderSelection?
      program dispatcher source = none ∧
    RootResetPersistentResponseSelector.responseCarrierSelection?
      program dispatcher source = none ∧
    RootResetPersistentResponseSelector.markedHandoffSelection?
      program dispatcher source = none ∧
    RootResetPersistentResponseSelector.dispatcherSelection?
      program dispatcher source = none ∧
    RootResetPersistentResponseSelector.selectedActionSelection?
      program dispatcher source = none ∧
    RootResetPersistentResponseSelector.appenderSelection?
      program dispatcher source = none ∧
    RootResetPersistentResponseSelector.activatedRouteSelection?
      program dispatcher source = none ∧
    ∃ selection,
      (RootResetPersistentRouteAFuel.classifyHandoff
          program dispatcher source).selected? = some selection ∧
        selection.target = target

/-- The explicit parser-priority facts reduce the total executable selector
to its fuel-aware base result. -/
theorem selectStep?_eq_some_of_baseWinsAt
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {source target : Term}
    (wins : BaseWinsAt program dispatcher source target) :
    RootResetPersistentResponseSelector.selectStep? program dispatcher source =
      some target := by
  rcases wins with
    ⟨freshNone, boundaryNone, responseAppenderNone, responseCarrierNone,
      markedHandoffNone, dispatcherNone,
      actionNone, appenderNone, activatedNone, selection, baseSelected,
      targetEq⟩
  unfold RootResetPersistentResponseSelector.selectStep?
  rw [show
    (RootResetPersistentResponseSelector.classify
      program dispatcher source).selected? = some selection by
      cases fuelEq :
          (RootResetPersistentRouteAFuel.classifyHandoff
            program dispatcher source).fuel <;>
        simp [RootResetPersistentResponseSelector.classify,
          RootResetPersistentResponseSelector.classifyAfterFuel, fuelEq,
          freshNone, boundaryNone, responseAppenderNone, responseCarrierNone,
          markedHandoffNone, dispatcherNone, actionNone,
          appenderNone, activatedNone, baseSelected]]
  simp [targetEq]

end ResponseSelector

/-! ## Exact selected-response bridge -/

/-- A proved response-selector equation at the canonical DOWN source supplies
the complete composable C4 seam.  The scheduler-side DOWN/UP traversal,
contextual contraction, exact mutation chain, and global sample index all come
from the provenance-bearing `SelectedResponseTrace`; the only executable
selector fact required here is its equality with that already named C4
target. -/
theorem selectedResponse_downUpC4_selectorChain_of_eq
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
        continuation remaining outerParents) ticks)
    (selected :
      let pendingParents :=
        .right (SchedulerResponse.pendingFunction program dispatcher seedBits
          continuation) ::
          PrimitiveFuel.pendingParents
            (environmentCode (compileActions program dispatcher.tree) seedBits)
            continuation remaining outerParents
      let down := downConfiguration program dispatcher registers source
        pendingParents
      let c4 := SchedulerNestedResponse.selectedC4Configuration program
        dispatcher registers bit outerContext innerContext pendingParents
      RootResetPersistentResponseSelector.selectStep? program dispatcher
        down.cursor.erase = some c4.cursor.erase) :
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
    down.cursor.erase = up.cursor.erase ∧
      RootResetExactTraceAgreement.SelectorChain
        (RootResetPersistentResponseSelector.selectStep? program dispatcher)
        down [c4] ∧
      ExactMutationChain (SchedulerControl.machine program dispatcher) c4 down
        [c4] ∧
      IndexedResponseSampledStates program dispatcher inputBits sampleIndex
        [c4] := by
  dsimp only at selected ⊢
  obtain ⟨_bridge, exact, sampled, downUp, _contracts⟩ :=
    RootResetPersistentCarrierTraversalAgreement.selectedResponse_downUpC4_exactSegment
      program dispatcher inputBits seedBits continuation source admissible
      registers phase coherent bit suffix remaining sampleIndex outerParents
      layers outer response
  have chain : RootResetExactTraceAgreement.SelectorChain
      (RootResetPersistentResponseSelector.selectStep? program dispatcher)
      (downConfiguration program dispatcher registers source
        (.right (SchedulerResponse.pendingFunction program dispatcher seedBits
          continuation) ::
          PrimitiveFuel.pendingParents
            (environmentCode (compileActions program dispatcher.tree) seedBits)
            continuation remaining outerParents))
      [SchedulerNestedResponse.selectedC4Configuration program dispatcher
        registers bit outerContext innerContext
        (.right (SchedulerResponse.pendingFunction program dispatcher seedBits
          continuation) ::
          PrimitiveFuel.pendingParents
            (environmentCode (compileActions program dispatcher.tree) seedBits)
            continuation remaining outerParents)] :=
    .next selected (.done _)
  exact ⟨downUp, chain, exact, sampled⟩

/-- Given the explicit `BaseWinsAt` parser-priority premise, the response-aware
term-only selector agrees with the scheduler's first selected-response
mutation.  The bridge applies at every pending-frame depth and completed
outer continuation stack satisfying that premise and the canonical response
trace. -/
theorem selectedResponse_downUpC4_selectorChain
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
        continuation remaining outerParents) ticks)
    (wins :
      let pendingParents :=
        .right (SchedulerResponse.pendingFunction program dispatcher seedBits
          continuation) ::
          PrimitiveFuel.pendingParents
            (environmentCode (compileActions program dispatcher.tree) seedBits)
            continuation remaining outerParents
      let down := downConfiguration program dispatcher registers source
        pendingParents
      let c4 := SchedulerNestedResponse.selectedC4Configuration program
        dispatcher registers bit outerContext innerContext pendingParents
      ResponseSelector.BaseWinsAt program dispatcher down.cursor.erase
        c4.cursor.erase) :
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
    RootResetPersistentResponseSelector.selectStep? program dispatcher
        down.cursor.erase = some c4.cursor.erase ∧
      down.cursor.erase = up.cursor.erase ∧
      RootResetExactTraceAgreement.SelectorChain
        (RootResetPersistentResponseSelector.selectStep? program dispatcher)
        down [c4] ∧
      ExactMutationChain (SchedulerControl.machine program dispatcher) c4 down
        [c4] ∧
      IndexedResponseSampledStates program dispatcher inputBits sampleIndex
        [c4] := by
  dsimp only at wins ⊢
  have selected := ResponseSelector.selectStep?_eq_some_of_baseWinsAt wins
  obtain ⟨downUp, chain, exact, sampled⟩ :=
    selectedResponse_downUpC4_selectorChain_of_eq program dispatcher inputBits
      seedBits continuation source admissible registers phase coherent bit
      suffix remaining sampleIndex outerParents layers outer response selected
  exact ⟨selected, downUp, chain, exact, sampled⟩

end PureSFormal.Research.RootResetSelectedResponseC4Agreement
