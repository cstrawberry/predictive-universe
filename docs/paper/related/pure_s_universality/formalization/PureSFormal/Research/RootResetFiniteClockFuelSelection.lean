import PureSFormal.Research.RootResetPhasePriorityClear
import PureSFormal.Research.RootResetHistoricalPriorityRejection

/-! The complete finite selector, including both preceding priority passes,
contracts the exact generated CLOCK and FUEL occurrences. -/
namespace PureSFormal.Research.RootResetFiniteClockFuelSelection
open PureSFormal.PureS
open FiniteController SchedulerInvariant RootResetActivePendingAgreement
open RootResetClockFuelStages RootResetClockFuelCanonicalGrammar
open RootResetFinitePrioritySelector

theorem clockParents_eq (stage wrappers : Nat) (parents : List ParentFrame) :
    RootResetClockGrowthWalker.clockParents stage wrappers parents = PrimitiveClock.wrapperParents stage wrappers parents := by
  induction wrappers generalizing parents with
  | zero => rfl
  | succ wrappers ih => exact ih _

theorem growth {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {count : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents count)
    (bits : List Bool) (stage wrappers residual : Nat) (after : Cursor)
    (contracted : (Cursor.mk (.app (C residual) (C stage))
      (RootResetClockGrowthWalker.clockParents stage wrappers
        (.left (environmentCode (compileActions program layout.tree) bits) :: parents))).rdx? = some after) :
    selectStep? program layout (Cursor.rebuild parents
      (.app (clockGrowthCore stage wrappers residual) (environmentCode (compileActions program layout.tree) bits))) = some after.erase := by
  obtain ⟨frontTicks, frontBound, frontRun⟩ := RootResetActiveClockEndpointAgreement.cleanParents_growth_stops outer bits stage wrappers residual
  obtain ⟨ticks, bound, actual⟩ := RootResetActiveEndpointExecution.generated_clock_growth outer bits stage wrappers residual
  exact RootResetHistoricalPriorityRejection.endpoint_selected outer [] _
    (RootResetPhasePriorityClear.growth_clear .fresh program layout.tree stage wrappers residual _)
    (RootResetPhasePriorityClear.growth_clear .marked program layout.tree stage wrappers residual _)
    frontTicks false frontRun ticks (.done true) _ after actual rfl contracted

theorem launch {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {count : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents count)
    (bits : List Bool) (stage wrappers : Nat) :
    let environment := environmentCode (compileActions program layout.tree) bits
    selectStep? program layout (Cursor.rebuild parents (.app (clockWrappers stage (wrappers + 1)) environment)) =
      some (Cursor.rebuild parents (.app (.app (C stage) environment) (.app (clockWrappers stage wrappers) environment))) := by
  obtain ⟨frontTicks, frontBound, frontRun⟩ := RootResetActiveClockEndpointAgreement.cleanParents_launch_stops outer bits stage wrappers
  obtain ⟨ticks, bound, actual⟩ := RootResetActiveEndpointExecution.generated_clock_launch outer bits stage wrappers
  exact RootResetHistoricalPriorityRejection.endpoint_selected outer [] _
    (RootResetPhasePriorityClear.launch_clear .fresh program layout.tree stage wrappers _)
    (RootResetPhasePriorityClear.launch_clear .marked program layout.tree stage wrappers _)
    frontTicks false frontRun ticks (.done true) _ _ actual rfl rfl

theorem fuel_after (row : FuelRow) (parents : List ParentFrame) (endpoint : Cursor)
    (followed : RootResetEdgeFragment.follow row.localAddress ⟨row.term, parents⟩ = some endpoint) :
    (Cursor.mk row.replacement endpoint.parents).erase = Cursor.rebuild parents row.target := by
  cases row <;> simp only [FuelRow.localAddress, FuelRow.term, RootResetEdgeFragment.follow,
    Cursor.left?, Option.bind_some] at followed
  all_goals cases followed
  all_goals rfl

theorem fuel {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {count : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents count)
    (layers : List Layer) (row : FuelRow) (canonical : CanonicalFuelRow (compileActions program layout.tree) row)
    (free : RootResetActiveFuelEndpointAgreement.FrameFree row.term)
    (baseMiss : (RootResetBaseQueueProbe.basePattern program layout.tree).matchesBool row.term = false)
    (freshClear : RootResetFreshHistoryRejection.Clear program layout.tree row.term)
    (markedClear : RootResetHistoricalPriorityRejection.Clear program layout.tree row.term) :
    selectStep? program layout (Cursor.rebuild parents (wrap (compileActions program layout.tree) layers row.term)) =
      some (Cursor.rebuild (parentsAfter (compileActions program layout.tree) layers parents) row.target) := by
  obtain ⟨frontTicks, frontBound, frontRun⟩ := RootResetActiveFuelEndpointAgreement.cleanParents_fuel_stops outer layers row canonical free
  obtain ⟨ticks, endpoint, bound, actual, followed, focusEq, redex⟩ := RootResetActiveEndpointExecution.generated_fuel outer layers row canonical free baseMiss
  have selected := RootResetHistoricalPriorityRejection.endpoint_selected outer layers row.term freshClear markedClear
    frontTicks false frontRun ticks (.done true) endpoint _ actual rfl redex
  rw [fuel_after row _ endpoint followed] at selected
  exact selected

theorem call {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {count : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents count)
    (layers : List Layer) (number : Nat) (bits : List Bool) (continuation : Term)
    (admissible : Carrier.Admissible continuation) :
    let row := FuelRow.call number (environmentCode (compileActions program layout.tree) bits) continuation
    selectStep? program layout (Cursor.rebuild parents (wrap (compileActions program layout.tree) layers row.term)) =
      some (Cursor.rebuild (parentsAfter (compileActions program layout.tree) layers parents) row.target) :=
  fuel outer layers _ ⟨⟨word bits, rfl⟩, admissible⟩ (RootResetActiveFuelEndpointAgreement.call_free number _ _)
    (RootResetScopedBaseMisses.base_pattern_call _ _ _ number)
    (RootResetPhasePriorityClear.call_clear .fresh program layout.tree number _ _)
    (RootResetPhasePriorityClear.call_clear .marked program layout.tree number _ _)

theorem positiveHalf {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {count : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents count)
    (layers : List Layer) (number : Nat) (bits : List Bool) (horizon remaining : Nat) :
    let environment := environmentCode (compileActions program layout.tree) bits
    let continuation := Dovetail.clockExit horizon remaining environment
    let row := FuelRow.positiveHalf number environment environment continuation
    selectStep? program layout (Cursor.rebuild parents (wrap (compileActions program layout.tree) layers row.term)) =
      some (Cursor.rebuild (parentsAfter (compileActions program layout.tree) layers parents) row.target) :=
  fuel outer layers _ ⟨⟨word bits, rfl⟩, ⟨word bits, rfl⟩, Dovetail.clockExit_admissible ..⟩
    (RootResetActiveFuelEndpointAgreement.positiveHalf_free number _ _ _ (RootResetActiveFuelEndpointAgreement.exit_free _ bits horizon remaining))
    (RootResetScopedBaseMisses.base_pattern_positiveHalf _ _ _ _ number)
    (RootResetPhasePriorityClear.positiveHalf_clear .fresh program layout.tree number _ _ _)
    (RootResetPhasePriorityClear.positiveHalf_clear .marked program layout.tree number _ _ _)

theorem zero {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {count : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents count)
    (layers : List Layer) (position : ZeroPosition) (bits : List Bool) (horizon remaining : Nat) :
    let row := position.row (compileActions program layout.tree) (word bits)
      (Dovetail.clockExit horizon remaining (environmentCode (compileActions program layout.tree) bits))
    selectStep? program layout (Cursor.rebuild parents (wrap (compileActions program layout.tree) layers row.term)) =
      some (Cursor.rebuild (parentsAfter (compileActions program layout.tree) layers parents) row.target) :=
  fuel outer layers _ (position.row_canonical _ _ _ (Dovetail.clockExit_admissible ..))
    (RootResetActiveFuelEndpointAgreement.zero_free position _ _ _ (RootResetActiveFuelEndpointAgreement.exit_free _ bits horizon remaining))
    (RootResetScopedBaseMisses.base_pattern_zero position _ _ horizon remaining _)
    (RootResetPhasePriorityClear.zero_clear .fresh program layout.tree position _ _ _)
    (RootResetPhasePriorityClear.zero_clear .marked program layout.tree position _ _ _)

theorem pending_parents (actions : Term) (bits : List Bool) (continuation : Term) (depth : Nat) (parents : List ParentFrame) :
    parentsAfter actions (List.replicate depth (word bits, continuation)) parents =
      PrimitiveFuel.pendingParents (environmentCode actions bits) continuation depth parents := by
  induction depth generalizing parents with
  | zero => rfl
  | succ depth ih =>
      simpa only [List.replicate_succ, parentsAfter, frameLayers, RootResetFrameSpineWalker.spineParents,
        PrimitiveFuel.pendingParents] using! ih (.right (.app (environmentCode actions bits) continuation) :: parents)

theorem pending_rebuild (actions : Term) (bits : List Bool) (continuation : Term) (depth : Nat)
    (parents : List ParentFrame) (body : Term) :
    Cursor.rebuild parents (wrap actions (List.replicate depth (word bits, continuation)) body) =
      Cursor.rebuild (PrimitiveFuel.pendingParents (environmentCode actions bits) continuation depth parents) body := by
  rw [← pending_parents]
  exact (RootResetFrameSpineWalker.rebuild_spineParents _ _ _).symm

theorem call_pending {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {count : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents count)
    (depth number : Nat) (bits : List Bool) (continuation : Term) (admissible : Carrier.Admissible continuation) :
    let environment := environmentCode (compileActions program layout.tree) bits
    let row := FuelRow.call number environment continuation
    selectStep? program layout (Cursor.rebuild (PrimitiveFuel.pendingParents environment continuation depth parents) row.term) =
      some (Cursor.rebuild (PrimitiveFuel.pendingParents environment continuation depth parents) row.target) := by
  have selected := call outer (List.replicate depth (word bits, continuation)) number bits continuation admissible
  dsimp only at selected
  rw [pending_rebuild, pending_parents] at selected
  exact selected

theorem positiveHalf_pending {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {count : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents count)
    (depth number : Nat) (bits : List Bool) (continuation : Term)
    (generated : ∃ horizon remaining, continuation = Dovetail.clockExit horizon remaining (environmentCode (compileActions program layout.tree) bits)) :
    let environment := environmentCode (compileActions program layout.tree) bits
    let row := FuelRow.positiveHalf number environment environment continuation
    selectStep? program layout (Cursor.rebuild (PrimitiveFuel.pendingParents environment continuation depth parents) row.term) =
      some (Cursor.rebuild (PrimitiveFuel.pendingParents environment continuation depth parents) row.target) := by
  obtain ⟨horizon, remaining, rfl⟩ := generated
  have selected := positiveHalf outer (List.replicate depth (word bits, Dovetail.clockExit horizon remaining (environmentCode (compileActions program layout.tree) bits))) number bits horizon remaining
  dsimp only at selected
  rw [pending_rebuild, pending_parents] at selected
  exact selected

theorem zero_pending {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {count : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents count)
    (depth : Nat) (position : ZeroPosition) (bits : List Bool) (continuation : Term)
    (generated : ∃ horizon remaining, continuation = Dovetail.clockExit horizon remaining (environmentCode (compileActions program layout.tree) bits)) :
    let environment := environmentCode (compileActions program layout.tree) bits
    let row := position.row (compileActions program layout.tree) (word bits) continuation
    selectStep? program layout (Cursor.rebuild (PrimitiveFuel.pendingParents environment continuation depth parents) row.term) =
      some (Cursor.rebuild (PrimitiveFuel.pendingParents environment continuation depth parents) row.target) := by
  obtain ⟨horizon, remaining, rfl⟩ := generated
  have selected := zero outer (List.replicate depth (word bits, Dovetail.clockExit horizon remaining (environmentCode (compileActions program layout.tree) bits))) position bits horizon remaining
  dsimp only at selected
  rw [pending_rebuild, pending_parents] at selected
  exact selected

end PureSFormal.Research.RootResetFiniteClockFuelSelection
