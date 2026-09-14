import PureSFormal.Research.RootResetFiniteResponseEndpointAgreement

/-! Exact FRAME contractions by the complete root-restarted selector. -/
namespace PureSFormal.Research.RootResetFiniteFrameAgreement
open PureSFormal.PureS
open FiniteController SchedulerResponseInvariant RootResetActivePendingAgreement
open RootResetFiniteResponseEndpointAgreement (accepts_none)

theorem first_append_none (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (continuation carrier audit : Term) :
    CheckpointDecoder.parseLocal? program layout.tree
      (.app (frameFirstRoot (compileActions program layout.tree) bits continuation carrier) audit) = none := by
  cases continuation with
  | s => cases audit <;> rfl
  | app fn arg =>
    cases fn <;> cases audit <;>
      simp [CheckpointDecoder.parseLocal?, frameFirstRoot, dispatcherCode,
        CheckpointDecoder.checkHalt?, seedCode, actCode, haltCode, haltTag, b]

theorem second_append_none (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (continuation carrier audit : Term) :
    CheckpointDecoder.parseLocal? program layout.tree
      (.app (frameSecondRoot (compileActions program layout.tree) bits continuation carrier) audit) = none := by
  cases continuation with
  | s => cases audit <;> rfl
  | app fn arg =>
    cases fn <;> cases audit <;>
      simp [CheckpointDecoder.parseLocal?, frameSecondRoot, CheckpointDecoder.checkHalt?,
        seedCode, actCode, haltCode, haltTag, b]

theorem selected_from_searches (program : CTS.Program) (layout : ActionDispatcher program)
    (source : Term) (endpoint after freshCandidate markedCandidate : Cursor)
    (ticks : Nat) (freshFound markedFound : Bool)
    (frontRun : run (RootResetActiveMarkedFrontend.machine program layout.tree) ticks
      (RootResetActiveMarkedFrontend.initial program layout.tree (Cursor.atRoot source)) = ⟨some (.done true), endpoint⟩)
    (freshSearch : RootResetFreshAncestorProbe.First program layout.tree endpoint freshFound freshCandidate)
    (freshDeclined : RootResetFreshHistoryRejection.Declined program layout.tree freshFound freshCandidate)
    (markedSearch : RootResetMarkedAncestorProbe.First program layout.tree endpoint markedFound markedCandidate)
    (markedDeclined : RootResetHistoricalPriorityRejection.Declined program layout.tree markedFound markedCandidate)
    (contracted : endpoint.rdx? = some after) :
    RootResetFinitePrioritySelector.selectStep? program layout source = some after.erase := by
  obtain ⟨freshTicks, freshRun⟩ := RootResetFreshHistoryRejection.pass_declined program layout.tree source ticks true
    freshFound endpoint freshCandidate frontRun freshSearch freshDeclined
  obtain ⟨markedTicks, markedAfter, markedRun⟩ := RootResetHistoricalPriorityRejection.pass_declined program layout.tree source ticks true
    markedFound endpoint markedCandidate frontRun markedSearch markedDeclined
  obtain ⟨endpointTicks, endpointRun⟩ := RootResetActiveEndpointExecution.frontend_selected program layout
    (Cursor.atRoot source) endpoint ticks frontRun
  exact RootResetFinitePriorityExecution.endpoint_selected program layout source freshTicks markedTicks endpointTicks
    (.done false) (.done false) (.done true) freshCandidate markedAfter endpoint after
    freshRun rfl markedRun rfl endpointRun rfl contracted

theorem first {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {count : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents count)
    (layers : List Layer) (bits : List Bool) (continuation carrier : Term) :
    RootResetFinitePrioritySelector.selectStep? program layout
      (Cursor.rebuild parents (wrap (compileActions program layout.tree) layers
        (frameFirstRoot (compileActions program layout.tree) bits continuation carrier))) =
      some (Cursor.rebuild parents (wrap (compileActions program layout.tree) layers
        (frameSecondRoot (compileActions program layout.tree) bits continuation carrier))) := by
  let actions := compileActions program layout.tree
  let body := frameFirstRoot actions bits continuation carrier
  have noLocal := RootResetFrameFirstSelectorProof.first_local_none program layout bits continuation carrier
  have freshClear : RootResetFreshHistoryRejection.Clear program layout.tree body :=
    ⟨accepts_none .fresh noLocal, fun audit => accepts_none .fresh (first_append_none program layout bits continuation carrier audit)⟩
  have markedClear : RootResetHistoricalPriorityRejection.Clear program layout.tree body :=
    ⟨accepts_none .marked noLocal, fun audit => accepts_none .marked (first_append_none program layout bits continuation carrier audit)⟩
  obtain ⟨ff, fc, fs, fd⟩ := RootResetFreshHistoryRejection.cleanParents_search outer (wrap actions layers body)
    (RootResetFreshHistoryRejection.wrapped_clear layers freshClear)
  have fs' := RootResetFreshHistoryRejection.pending_search layers body parents freshClear fs
  obtain ⟨mf, mc, ms, md⟩ := RootResetHistoricalPriorityRejection.cleanParents_search outer (wrap actions layers body)
    (RootResetHistoricalPriorityRejection.wrapped_clear layers markedClear)
  have ms' := RootResetHistoricalPriorityRejection.pending_search layers body parents markedClear ms
  have freshNo : RootResetCompletedLocalPatterns.accepts .fresh program layout.tree
      (.app (dispatcherCode actions bits) carrier) = false :=
    RootResetFreshAncestorExitAgreement.fresh_rejects_arity (by change 3 ≠ 6; decide)
  have markedNo : RootResetCompletedLocalPatterns.accepts .marked program layout.tree
      (.app (dispatcherCode actions bits) carrier) = false :=
    RootResetMarkedHandoffAgreement.marked_rejects_arity (by change 3 ≠ 5; decide)
  obtain ⟨ticks, _, actual⟩ := RootResetActiveCleanParentsAgreement.cleanParents_frame_first outer (frameLayers actions layers) bits continuation carrier
  have selected := selected_from_searches program layout _ _
    (RootResetFrameSpineWalker.firstTarget actions bits continuation carrier (parentsAfter actions layers parents)) fc mc ticks ff mf actual
    (.parent _ (.left (.app continuation carrier)) _ freshNo fs') fd
    (.parent _ (.left (.app continuation carrier)) _ markedNo ms') md rfl
  change RootResetFinitePrioritySelector.selectStep? program layout _ = some (Cursor.rebuild (parentsAfter actions layers parents) (frameSecondRoot actions bits continuation carrier)) at selected
  rw [RootResetFrameSpineWalker.rebuild_spineParents] at selected
  exact selected

theorem second {program : CTS.Program} {layout : ActionDispatcher program}
    {parents : List ParentFrame} {count : Nat}
    (outer : RootResetCleanTraversableParents.CleanParents program layout parents count)
    (layers : List Layer) (bits : List Bool) (continuation carrier : Term) :
    RootResetFinitePrioritySelector.selectStep? program layout
      (Cursor.rebuild parents (wrap (compileActions program layout.tree) layers
        (frameSecondRoot (compileActions program layout.tree) bits continuation carrier))) =
      some (Cursor.rebuild parents (wrap (compileActions program layout.tree) layers
        (freshLocal (compileActions program layout.tree) bits continuation carrier))) := by
  let actions := compileActions program layout.tree
  let body := frameSecondRoot actions bits continuation carrier
  have noLocal := RootResetFrameSecondSelectorProof.parseLocal_frameSecond_none program layout bits continuation carrier
  have freshClear : RootResetFreshHistoryRejection.Clear program layout.tree body :=
    ⟨accepts_none .fresh noLocal, fun audit => accepts_none .fresh (second_append_none program layout bits continuation carrier audit)⟩
  have markedClear : RootResetHistoricalPriorityRejection.Clear program layout.tree body :=
    ⟨accepts_none .marked noLocal, fun audit => accepts_none .marked (second_append_none program layout bits continuation carrier audit)⟩
  obtain ⟨ff, fc, fs, fd⟩ := RootResetFreshHistoryRejection.cleanParents_search outer (wrap actions layers body)
    (RootResetFreshHistoryRejection.wrapped_clear layers freshClear)
  have fs' := RootResetFreshHistoryRejection.pending_search layers body parents freshClear fs
  obtain ⟨mf, mc, ms, md⟩ := RootResetHistoricalPriorityRejection.cleanParents_search outer (wrap actions layers body)
    (RootResetHistoricalPriorityRejection.wrapped_clear layers markedClear)
  have ms' := RootResetHistoricalPriorityRejection.pending_search layers body parents markedClear ms
  have fn : RootResetCompletedLocalPatterns.accepts .fresh program layout.tree (.app (actCode actions) carrier) = false :=
    RootResetFreshAncestorExitAgreement.fresh_rejects_arity (by change 3 ≠ 6; decide)
  have fn' : RootResetCompletedLocalPatterns.accepts .fresh program layout.tree (.app (.app (actCode actions) carrier) (.app (seedCode bits) carrier)) = false :=
    RootResetFreshAncestorExitAgreement.fresh_rejects_arity (by change 4 ≠ 6; decide)
  have mn : RootResetCompletedLocalPatterns.accepts .marked program layout.tree (.app (actCode actions) carrier) = false :=
    RootResetMarkedHandoffAgreement.marked_rejects_arity (by change 3 ≠ 5; decide)
  have mn' : RootResetCompletedLocalPatterns.accepts .marked program layout.tree (.app (.app (actCode actions) carrier) (.app (seedCode bits) carrier)) = false :=
    RootResetMarkedHandoffAgreement.marked_rejects_arity (by change 4 ≠ 5; decide)
  obtain ⟨ticks, _, actual⟩ := RootResetActiveCleanParentsAgreement.cleanParents_frame_second outer (frameLayers actions layers) bits continuation carrier
  have selected := selected_from_searches program layout _ _
    (RootResetFrameSpineWalker.secondTarget actions bits continuation carrier (parentsAfter actions layers parents)) fc mc ticks ff mf actual
    (.parent _ (.left (.app (seedCode bits) carrier)) _ fn (.parent _ (.left (.app continuation carrier)) _ fn' fs')) fd
    (.parent _ (.left (.app (seedCode bits) carrier)) _ mn (.parent _ (.left (.app continuation carrier)) _ mn' ms')) md rfl
  change RootResetFinitePrioritySelector.selectStep? program layout _ = some (Cursor.rebuild (parentsAfter actions layers parents) (freshLocal actions bits continuation carrier)) at selected
  rw [RootResetFrameSpineWalker.rebuild_spineParents] at selected
  exact selected

end PureSFormal.Research.RootResetFiniteFrameAgreement
