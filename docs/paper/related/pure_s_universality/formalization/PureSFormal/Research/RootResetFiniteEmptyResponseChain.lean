import PureSFormal.Research.RootResetFiniteNormalResponseChain
import PureSFormal.Research.RootResetMixedEmptyResponseChain

/-! Exact EMPTY response bodies and their marker for the full finite selector. -/
namespace PureSFormal.Research.RootResetFiniteEmptyResponseChain
open PureSFormal.PureS
open SchedulerResponseInvariant RootResetActivePendingAgreement
open RootResetFiniteResponseEndpointAgreement RootResetFiniteNormalResponseChain

theorem paired_erases {program : CTS.Program} {layout : ActionDispatcher program}
    {registers : SchedulerControl.Registers program} {bits : List Bool}
    {continuation carrier : Term} {parents : List ParentFrame}
    {samples : List (SchedulerInvariant.Configuration program layout)} {entries : List (Bool × Term)}
    (paired : SchedulerNestedEmpty.EmptyResponseSamplePairs program layout registers bits
      continuation carrier parents samples entries) :
    samples.map (fun sample => sample.cursor.erase) =
      entries.map (fun entry => Cursor.rebuild parents entry.2) := by
  induction paired with
  | nil => rfl
  | cons pc cursor done term position erase root tail ih =>
      change cursor.erase :: _ = _ :: _
      rw [erase, ih]

theorem emptyResponse_body_selectorChain {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {history : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents history)
    (layers : List Layer) (registers : SchedulerControl.Registers program)
    (bits : List Bool) (continuation carrier : Term)
    (endpoints : Endpoints program layout parents layers bits continuation carrier (registers.phase, false)) :
    let allParents := parentsAfter (compileActions program layout.tree) layers parents
    ∃ first rest,
      ExactMutationChain (SchedulerControl.machine program layout)
        (SchedulerEmpty.markStartConfiguration program layout registers bits continuation carrier allParents)
        (SchedulerEmpty.responseStartConfiguration program layout registers bits continuation carrier allParents)
        (first :: rest) ∧
      RootResetExactTraceAgreement.SelectorChain (RootResetFinitePrioritySelector.selectStep? program layout) first rest ∧
      first.cursor.erase = Cursor.rebuild parents (wrap (compileActions program layout.tree) layers
        (frameFirstRoot (compileActions program layout.tree) bits continuation carrier)) ∧
      (first :: rest).length = LocalResponse.completedCost program
        (layout.route (registers.phase, false)) (registers.phase, false) := by
  dsimp only
  obtain ⟨samples, chain, paired⟩ := SchedulerNestedEmpty.emptyResponse_exactPairedMutationChain
    program layout registers bits continuation carrier (parentsAfter (compileActions program layout.tree) layers parents)
  have lengthEq := paired.length_eq.trans (responseEntries_length program
    (layout.route_valid (registers.phase, false)) bits continuation carrier)
  have erases := (paired_erases paired).trans (entries_rebuild _ _ _ _)
  cases samples with
  | nil => cases erases
  | cons first rest =>
      have equalities := List.cons.inj erases
      exact ⟨first, rest, chain,
        (responseEntries_tail_selections outer layers (registers.phase, false) bits continuation carrier endpoints).selectsSamples
          equalities.1 equalities.2, equalities.1, lengthEq⟩

theorem emptyResponse_through_marker_selectorChain {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {history : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents history)
    (layers : List Layer) (registers : SchedulerControl.Registers program)
    (bits : List Bool) (continuation carrier : Term)
    (endpoints : Endpoints program layout parents layers bits continuation carrier (registers.phase, false))
    (commit : RootResetFinitePrioritySelector.selectStep? program layout
      (Cursor.rebuild parents (wrap (compileActions program layout.tree) layers
        (LocalResponse.completed bits continuation carrier (SchedulerResponse.completedRoute program layout registers false carrier)))) =
      some (Cursor.rebuild parents (wrap (compileActions program layout.tree) layers
        (LocalResponse.markedCompleted bits continuation carrier (SchedulerResponse.completedRoute program layout registers false carrier))))) :
    let allParents := parentsAfter (compileActions program layout.tree) layers parents
    ∃ first rest,
      ExactMutationChain (SchedulerControl.machine program layout)
        (SchedulerEmpty.markedPendingConfiguration program layout registers bits continuation carrier allParents)
        (SchedulerEmpty.responseStartConfiguration program layout registers bits continuation carrier allParents)
        (first :: rest) ∧
      RootResetExactTraceAgreement.SelectorChain (RootResetFinitePrioritySelector.selectStep? program layout) first rest ∧
      first.cursor.erase = Cursor.rebuild parents (wrap (compileActions program layout.tree) layers
        (frameFirstRoot (compileActions program layout.tree) bits continuation carrier)) ∧
      (first :: rest).length = LocalResponse.completedCost program
        (layout.route (registers.phase, false)) (registers.phase, false) + 1 := by
  dsimp only
  let allParents := parentsAfter (compileActions program layout.tree) layers parents
  let marker := SchedulerRootContinuation.emptyMarkerMutationConfiguration program layout
    registers bits continuation carrier allParents
  obtain ⟨first, rest, responseChain, selected, firstErase, responseLength⟩ :=
    emptyResponse_body_selectorChain outer layers registers bits continuation carrier endpoints
  have markerSelected : RootResetExactTraceAgreement.SelectorChain (RootResetFinitePrioritySelector.selectStep? program layout)
      (SchedulerEmpty.markStartConfiguration program layout registers bits continuation carrier allParents) [marker] := by
    refine .next ?_ (.done _)
    rw [SchedulerRootContinuation.emptyMarkerMutation_erase]
    change RootResetFinitePrioritySelector.selectStep? program layout
      (Cursor.rebuild allParents (LocalResponse.completed bits continuation carrier
        (SchedulerResponse.completedRoute program layout registers false carrier))) =
      some (Cursor.rebuild allParents (LocalResponse.markedCompleted bits continuation carrier
        (SchedulerResponse.completedRoute program layout registers false carrier)))
    rw [RootResetFrameSpineWalker.rebuild_spineParents, RootResetFrameSpineWalker.rebuild_spineParents]
    exact commit
  have markerChain : ExactMutationChain (SchedulerControl.machine program layout)
      (SchedulerEmpty.markedPendingConfiguration program layout registers bits continuation carrier allParents)
      (SchedulerEmpty.markStartConfiguration program layout registers bits continuation carrier allParents) [marker] :=
    .next 4 (SchedulerRootContinuation.emptyMarkStart_seekMutation ..)
      (.done 4 (SchedulerRootContinuation.emptyMarkerSuffix_zeroRun ..))
  obtain ⟨ticks, searched, tailExact⟩ := RootResetResponseSampleParserBridge.exactMutationChain_cons responseChain
  refine ⟨first, rest ++ [marker], SchedulerRecurrence.ExactMutationChain.append responseChain markerChain,
    RootResetExactTraceAgreement.SelectorChain.append tailExact selected markerSelected, firstErase, ?_⟩
  simpa only [List.length_cons, List.length_append, List.length_singleton, Nat.add_assoc]
    using! congrArg (fun n => n + 1) responseLength

end PureSFormal.Research.RootResetFiniteEmptyResponseChain
