import PureSFormal.Research.RootResetScopedBaseMisses
import PureSFormal.Research.RootResetActiveEndpointProbe

/-! Whole-root finite executions for the generated FRAME, FUEL and CLOCK selections. -/
namespace PureSFormal.Research.RootResetActiveEndpointExecution
open PureSFormal.PureS
open FiniteController SchedulerInvariant RootResetClockFuelStages RootResetClockFuelCanonicalGrammar
open RootResetProbeSequence RootResetActivePendingAgreement

theorem frontend_selected (program : CTS.Program) (layout : ActionDispatcher program)
    (origin endpoint : Cursor) (ticks : Nat)
    (actual : run (RootResetActiveMarkedFrontend.machine program layout.tree) ticks
      (RootResetActiveMarkedFrontend.initial program layout.tree origin) = ⟨some (.done true), endpoint⟩) :
    ∃ used, run (RootResetActiveEndpointProbe.worker program layout).machine used
      ((RootResetActiveEndpointProbe.worker program layout).initial origin) = ⟨some (.done true), endpoint⟩ := by
  obtain ⟨used, bounded, execution⟩ := RootResetProbeSequence.first_selected
    (RootResetActiveEndpointProbe.frontend program layout.tree) (RootResetScopedResponseProbes.endpoint program layout)
    (RootResetActiveEndpointProbe.frontend_terminal program layout.tree) origin endpoint ticks (.done true) actual rfl
  exact ⟨used, execution⟩

theorem endpoint_selected (program : CTS.Program) (layout : ActionDispatcher program)
    (origin middle endpoint : Cursor) (frontTicks endpointTicks : Nat)
    (frontRun : run (RootResetActiveMarkedFrontend.machine program layout.tree) frontTicks
      (RootResetActiveMarkedFrontend.initial program layout.tree origin) = ⟨some (.done false), middle⟩)
    (endpointRun : run (RootResetScopedResponseProbes.endpoint program layout).machine endpointTicks
      ((RootResetScopedResponseProbes.endpoint program layout).initial middle) = ⟨some (.done true), endpoint⟩) :
    ∃ used, run (RootResetActiveEndpointProbe.worker program layout).machine used
      ((RootResetActiveEndpointProbe.worker program layout).initial origin) = ⟨some (.done true), endpoint⟩ := by
  obtain ⟨frontUsed, frontBound, frontActual⟩ := RootResetProbeSequence.first_runs
    (RootResetActiveEndpointProbe.frontend program layout.tree) (RootResetScopedResponseProbes.endpoint program layout)
    (RootResetActiveEndpointProbe.frontend_terminal program layout.tree) origin middle frontTicks (.done false) false frontRun rfl
  obtain ⟨endpointUsed, endpointBound, endpointActual⟩ := RootResetProbeSequence.second_runs
    (RootResetActiveEndpointProbe.frontend program layout.tree) (RootResetScopedResponseProbes.endpoint program layout)
    (RootResetScopedResponseProbes.endpoint_terminal program layout) middle endpoint endpointTicks (.done true) true endpointRun rfl
  refine ⟨frontUsed + 1 + (endpointUsed + 1), ?_⟩
  change run (RootResetProbeSequence.machine _ _) _ (RootResetProbeSequence.initial _ _ origin) = _
  rw [run_add, frontActual]
  exact endpointActual

theorem bounded_selected (program : CTS.Program) (layout : ActionDispatcher program)
    (source : Term) (endpoint : Cursor) (ticks : Nat)
    (selected : run (RootResetActiveEndpointProbe.worker program layout).machine ticks
      ((RootResetActiveEndpointProbe.worker program layout).initial (Cursor.atRoot source)) = ⟨some (.done true), endpoint⟩) :
    ∃ used, used ≤ RootResetActiveEndpointProbe.coefficient program layout * source.size ∧
      run (RootResetActiveEndpointProbe.worker program layout).machine used
        ((RootResetActiveEndpointProbe.worker program layout).initial (Cursor.atRoot source)) = ⟨some (.done true), endpoint⟩ := by
  obtain ⟨used, ready, found, state, bounded, actual, answered, preserved, facts⟩ := RootResetActiveEndpointProbe.all_input_atRoot program layout source
  have selectedStable : run (RootResetActiveEndpointProbe.worker program layout).machine (ticks + used)
      ((RootResetActiveEndpointProbe.worker program layout).initial (Cursor.atRoot source)) = ⟨some (.done true), endpoint⟩ := by
    rw [run_add, selected]
    exact RootResetActiveEndpointProbe.terminal program layout (.done true) true rfl endpoint used
  have foundStable : run (RootResetActiveEndpointProbe.worker program layout).machine (ticks + used)
      ((RootResetActiveEndpointProbe.worker program layout).initial (Cursor.atRoot source)) = ⟨some state, found⟩ := by
    rw [Nat.add_comm, run_add, actual]
    exact RootResetActiveEndpointProbe.terminal program layout state ready answered found ticks
  have equal := foundStable.symm.trans selectedStable
  exact ⟨used, bounded, actual.trans equal⟩

theorem after_base_miss (program : CTS.Program) (layout : ActionDispatcher program)
    (source : Term) (middle endpoint : Cursor) (frontTicks endpointTicks : Nat)
    (frontRun : run (RootResetActiveMarkedFrontend.machine program layout.tree) frontTicks
      (RootResetActiveMarkedFrontend.initial program layout.tree (Cursor.atRoot source)) = ⟨some (.done false), middle⟩)
    (baseMiss : (RootResetBaseQueueProbe.basePattern program layout.tree).matchesBool middle.focus = false)
    (pendingMiss : (RootResetPendingBaseProbe.pattern program layout.tree).matchesBool middle.focus = false)
    (endpointRun : run (RootResetFuelEndpointPipeline.worker program layout).machine endpointTicks
      ((RootResetFuelEndpointPipeline.worker program layout).initial middle) = ⟨some (.done true), endpoint⟩) :
    ∃ ticks, ticks ≤ RootResetActiveEndpointProbe.coefficient program layout * source.size ∧
      run (RootResetActiveEndpointProbe.worker program layout).machine ticks
        ((RootResetActiveEndpointProbe.worker program layout).initial (Cursor.atRoot source)) = ⟨some (.done true), endpoint⟩ := by
  obtain ⟨fullTicks, fullRun⟩ := RootResetScopedBaseMisses.endpoint_after_base_miss program layout middle endpoint baseMiss pendingMiss endpointTicks endpointRun
  obtain ⟨ticks, actual⟩ := endpoint_selected program layout (Cursor.atRoot source) middle endpoint frontTicks fullTicks frontRun fullRun
  exact bounded_selected program layout source endpoint ticks actual

theorem generated_fuel {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {count : Nat} (outer : RootResetCleanTraversableParents.CleanParents program layout parents count)
    (layers : List Layer) (fuel : FuelRow) (canonical : CanonicalFuelRow (compileActions program layout.tree) fuel)
    (free : RootResetActiveFuelEndpointAgreement.FrameFree fuel.term)
    (baseMiss : (RootResetBaseQueueProbe.basePattern program layout.tree).matchesBool fuel.term = false) :
    let source := Cursor.rebuild parents (wrap (compileActions program layout.tree) layers fuel.term)
    ∃ ticks endpoint, ticks ≤ RootResetActiveEndpointProbe.coefficient program layout * source.size ∧
      run (RootResetActiveEndpointProbe.worker program layout).machine ticks
        ((RootResetActiveEndpointProbe.worker program layout).initial (Cursor.atRoot source)) = ⟨some (.done true), endpoint⟩ ∧
      RootResetEdgeFragment.follow fuel.localAddress ⟨fuel.term, parentsAfter (compileActions program layout.tree) layers parents⟩ = some endpoint ∧
      endpoint.focus = fuel.focus ∧ endpoint.rdx? = some ⟨fuel.replacement, endpoint.parents⟩ := by
  obtain ⟨frontTicks, frontBound, frontRun⟩ := RootResetActiveFuelEndpointAgreement.cleanParents_fuel_stops outer layers fuel canonical free
  obtain ⟨endpointTicks, endpoint, endpointBound, endpointRun, followed, focusEq, redex⟩ := RootResetFuelEndpointPipeline.generated_fuel program layout fuel canonical
    (parentsAfter (compileActions program layout.tree) layers parents)
  obtain ⟨ticks, bounded, actual⟩ := after_base_miss program layout _ _ endpoint frontTicks endpointTicks frontRun baseMiss
    (RootResetScopedBaseMisses.pending_pattern_fuel program layout.tree fuel canonical) endpointRun
  exact ⟨ticks, endpoint, bounded, actual, followed, focusEq, redex⟩

theorem generated_zero {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {count : Nat} (outer : RootResetCleanTraversableParents.CleanParents program layout parents count)
    (layers : List Layer) (position : ZeroPosition) (bits : List Bool) (horizon remaining : Nat) :
    let fuel := position.row (compileActions program layout.tree) (word bits)
      (Dovetail.clockExit horizon remaining (environmentCode (compileActions program layout.tree) bits))
    let source := Cursor.rebuild parents (wrap (compileActions program layout.tree) layers fuel.term)
    ∃ ticks endpoint, ticks ≤ RootResetActiveEndpointProbe.coefficient program layout * source.size ∧
      run (RootResetActiveEndpointProbe.worker program layout).machine ticks
        ((RootResetActiveEndpointProbe.worker program layout).initial (Cursor.atRoot source)) = ⟨some (.done true), endpoint⟩ ∧
      RootResetEdgeFragment.follow fuel.localAddress ⟨fuel.term, parentsAfter (compileActions program layout.tree) layers parents⟩ = some endpoint ∧
      endpoint.focus = fuel.focus ∧ endpoint.rdx? = some ⟨fuel.replacement, endpoint.parents⟩ := by
  exact generated_fuel outer layers _ (position.row_canonical _ _ _ (Dovetail.clockExit_admissible ..))
    (RootResetActiveFuelEndpointAgreement.zero_free position _ _ _ (RootResetActiveFuelEndpointAgreement.exit_free _ bits horizon remaining))
    (RootResetScopedBaseMisses.base_pattern_zero position _ _ horizon remaining _)

theorem generated_call {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {count : Nat} (outer : RootResetCleanTraversableParents.CleanParents program layout parents count)
    (layers : List Layer) (number : Nat) (bits : List Bool) (horizon remaining : Nat) :
    let fuel := FuelRow.call number (environmentCode (compileActions program layout.tree) bits)
      (Dovetail.clockExit horizon remaining (environmentCode (compileActions program layout.tree) bits))
    let source := Cursor.rebuild parents (wrap (compileActions program layout.tree) layers fuel.term)
    ∃ ticks endpoint, ticks ≤ RootResetActiveEndpointProbe.coefficient program layout * source.size ∧
      run (RootResetActiveEndpointProbe.worker program layout).machine ticks
        ((RootResetActiveEndpointProbe.worker program layout).initial (Cursor.atRoot source)) = ⟨some (.done true), endpoint⟩ ∧
      RootResetEdgeFragment.follow fuel.localAddress ⟨fuel.term, parentsAfter (compileActions program layout.tree) layers parents⟩ = some endpoint ∧
      endpoint.focus = fuel.focus ∧ endpoint.rdx? = some ⟨fuel.replacement, endpoint.parents⟩ := by
  exact generated_fuel outer layers _ ⟨⟨word bits, rfl⟩, Dovetail.clockExit_admissible ..⟩ (RootResetActiveFuelEndpointAgreement.call_free number _ _)
    (RootResetScopedBaseMisses.base_pattern_call _ _ _ number)

theorem generated_positiveHalf {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {count : Nat} (outer : RootResetCleanTraversableParents.CleanParents program layout parents count)
    (layers : List Layer) (residual : Nat) (bits : List Bool) (horizon remaining : Nat) :
    let fuel := FuelRow.positiveHalf residual (environmentCode (compileActions program layout.tree) bits)
      (environmentCode (compileActions program layout.tree) bits)
      (Dovetail.clockExit horizon remaining (environmentCode (compileActions program layout.tree) bits))
    let source := Cursor.rebuild parents (wrap (compileActions program layout.tree) layers fuel.term)
    ∃ ticks endpoint, ticks ≤ RootResetActiveEndpointProbe.coefficient program layout * source.size ∧
      run (RootResetActiveEndpointProbe.worker program layout).machine ticks
        ((RootResetActiveEndpointProbe.worker program layout).initial (Cursor.atRoot source)) = ⟨some (.done true), endpoint⟩ ∧
      RootResetEdgeFragment.follow fuel.localAddress ⟨fuel.term, parentsAfter (compileActions program layout.tree) layers parents⟩ = some endpoint ∧
      endpoint.focus = fuel.focus ∧ endpoint.rdx? = some ⟨fuel.replacement, endpoint.parents⟩ := by
  exact generated_fuel outer layers _ ⟨⟨word bits, rfl⟩, ⟨word bits, rfl⟩, Dovetail.clockExit_admissible ..⟩
    (RootResetActiveFuelEndpointAgreement.positiveHalf_free residual _ _ _ (RootResetActiveFuelEndpointAgreement.exit_free _ bits horizon remaining))
    (RootResetScopedBaseMisses.base_pattern_positiveHalf _ _ _ _ residual)

theorem generated_clock_growth {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {count : Nat} (outer : RootResetCleanTraversableParents.CleanParents program layout parents count)
    (bits : List Bool) (stage wrappers residual : Nat) :
    let environment := environmentCode (compileActions program layout.tree) bits
    let body := Term.app (clockGrowthCore stage wrappers residual) environment
    ∃ ticks, ticks ≤ RootResetActiveEndpointProbe.coefficient program layout * (Cursor.rebuild parents body).size ∧
      run (RootResetActiveEndpointProbe.worker program layout).machine ticks
        ((RootResetActiveEndpointProbe.worker program layout).initial (Cursor.atRoot (Cursor.rebuild parents body))) =
      ⟨some (.done true), ⟨.app (C residual) (C stage),
        RootResetClockGrowthWalker.clockParents stage wrappers (.left environment :: parents)⟩⟩ := by
  obtain ⟨frontTicks, frontBound, frontRun⟩ := RootResetActiveClockEndpointAgreement.cleanParents_growth_stops outer bits stage wrappers residual
  obtain ⟨endpointTicks, endpointBound, endpointRun⟩ := RootResetFuelEndpointPipeline.generated_clock_growth program layout stage wrappers residual
    (environmentCode (compileActions program layout.tree) bits) parents
  exact after_base_miss program layout _ _ _ frontTicks endpointTicks frontRun
    (RootResetScopedBaseMisses.base_pattern_clock _ stage wrappers residual stage _)
    (RootResetScopedBaseMisses.pending_pattern_clock program layout.tree stage wrappers residual stage _) endpointRun

theorem generated_clock_launch {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {count : Nat} (outer : RootResetCleanTraversableParents.CleanParents program layout parents count)
    (bits : List Bool) (stage wrappers : Nat) :
    let body := Term.app (clockWrappers stage (wrappers + 1)) (environmentCode (compileActions program layout.tree) bits)
    ∃ ticks, ticks ≤ RootResetActiveEndpointProbe.coefficient program layout * (Cursor.rebuild parents body).size ∧
      run (RootResetActiveEndpointProbe.worker program layout).machine ticks
        ((RootResetActiveEndpointProbe.worker program layout).initial (Cursor.atRoot (Cursor.rebuild parents body))) =
      ⟨some (.done true), ⟨body, parents⟩⟩ := by
  obtain ⟨frontTicks, frontBound, frontRun⟩ := RootResetActiveClockEndpointAgreement.cleanParents_launch_stops outer bits stage wrappers
  obtain ⟨endpointTicks, endpointBound, endpointRun⟩ := RootResetFuelEndpointPipeline.generated_clock_launch program layout stage wrappers
    (environmentCode (compileActions program layout.tree) bits) parents
  exact after_base_miss program layout _ _ _ frontTicks endpointTicks frontRun
    (RootResetScopedBaseMisses.base_pattern_exit _ stage (wrappers + 1) _)
    (RootResetScopedBaseMisses.pending_pattern_exit program layout.tree stage (wrappers + 1) _) endpointRun

end PureSFormal.Research.RootResetActiveEndpointExecution
