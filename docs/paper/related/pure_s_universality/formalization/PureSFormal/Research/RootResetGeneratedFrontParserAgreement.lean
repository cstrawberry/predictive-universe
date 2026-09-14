import PureSFormal.Research.RootResetCarrierChronologyPreservation

/-!
# Generated carrier agreement between the two front parsers

The response-appender parser tries public roots before cells, while the
canonical selected-front parser tries cells first. Generated public paths
make these branches disjoint, so both recover the same exact C4 occurrence
through arbitrary nested Base, Local, live, and tombstone history.
-/

namespace PureSFormal.Research.RootResetGeneratedFrontParserAgreement

open PureSFormal.PureS

theorem spine_eq {term : Term} {decoded : List Bool}
    (path : CellSpine.Decodes term decoded) :
    RootResetPersistentResponseSelector.spineFirstLiveAddress? term =
      RootResetSelectedFrontParserAgreement.spineFirstLiveAddress? term := by
  induction path with
  | omega => simp [RootResetPersistentResponseSelector.spineFirstLiveAddress?]
  | live bit inner ih =>
      rw [RootResetPersistentResponseSelector.spineFirstLiveAddress?,
        if_neg (Carrier.omega_ne_liveCell bit _).symm, CanonicalStep.parseCell?_live,
        RootResetSelectedFrontParserAgreement.spineFirstLiveAddress?_live]
      dsimp only
      rw [ih]
      split <;> rename_i h <;> rw [h]
  | tombstone bit audit inner ih =>
      rw [RootResetPersistentResponseSelector.spineFirstLiveAddress?,
        if_neg (Carrier.omega_ne_tombstone bit _ audit).symm, CanonicalStep.parseCell?_tombstone,
        RootResetSelectedFrontParserAgreement.spineFirstLiveAddress?_tombstone]
      dsimp only
      rw [ih]

theorem first_eq_of_path
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation term : Term} {decoded : List Bool}
    (admissible : Carrier.Admissible continuation)
    (path : CarrierDecoder.PathDecodes program tree bits continuation term decoded) :
    RootResetPersistentResponseSelector.carrierFirstLiveAddress? program tree term =
      RootResetSelectedFrontParserAgreement.firstLiveAddress? program tree term := by
  apply CarrierDecoder.PathDecodes.rec
    (program := program) (tree := tree) (bits := bits)
    (continuation := continuation) (t := path)
    (motive_1 := fun term _ _ =>
      RootResetPersistentResponseSelector.carrierFirstLiveAddress? program tree term =
        RootResetSelectedFrontParserAgreement.firstLiveAddress? program tree term)
    (motive_2 := fun term _ _ =>
      RootResetPersistentResponseSelector.carrierFirstLiveAddress? program tree term =
        RootResetSelectedFrontParserAgreement.firstLiveAddress? program tree term)
  · intro queue beta decoded queueComplete
    have cellNone := RootResetSelectedFrontParserAgreement.parseCell?_none_of_headArity_five_or_six
      (MutableBase.root_headArity (compileActions program tree) bits admissible queue beta)
    rw [RootResetPersistentResponseSelector.carrierFirstLiveAddress?,
      RootResetSelectedFrontParserAgreement.firstLiveAddress?, dif_pos cellNone,
      CheckpointDecoder.parseBase?_mutableBase]
    dsimp only
    rw [spine_eq queueComplete]
    rfl
  · intro accumulator dispatcher result decoded inner dispatch shell ih
    obtain ⟨route, label, dispatchShape⟩ := dispatch
    have cellNone := RootResetSelectedFrontParserAgreement.parseCell?_none_of_headArity_five_or_six
      shell.result_headArity
    cases shell with
    | fresh haltAudit seedAudit continuationAudit =>
      let view : CheckpointDecoder.LocalView program :=
        ⟨.fresh, route, label, accumulator, word bits, continuation⟩
      have shape : CheckpointDecoder.LocalShape program tree view
          (Carrier.activeShell bits continuation (freshHField haltAudit) dispatcher seedAudit continuationAudit) :=
        ⟨freshHField haltAudit, dispatcher, seedAudit, continuationAudit, .fresh haltAudit, dispatchShape, rfl⟩
      rw [RootResetPersistentResponseSelector.carrierFirstLiveAddress?,
        RootResetSelectedFrontParserAgreement.firstLiveAddress?, dif_pos cellNone,
        CheckpointRun.parseBase?_none_of_localShape shape,
        CheckpointDecoder.parseLocal?_complete shape]
      exact congrArg (fun result => result.map (fun inner => RootResetResponseBoundaryStages.localAccumulatorAddress view ++ inner)) ih
    | marked leftAudit rightAudit seedAudit continuationAudit =>
      let view : CheckpointDecoder.LocalView program :=
        ⟨.marked, route, label, accumulator, word bits, continuation⟩
      have shape : CheckpointDecoder.LocalShape program tree view
          (Carrier.activeShell bits continuation (Carrier.markedHField leftAudit rightAudit) dispatcher seedAudit continuationAudit) :=
        ⟨Carrier.markedHField leftAudit rightAudit, dispatcher, seedAudit, continuationAudit, .marked leftAudit rightAudit, dispatchShape, rfl⟩
      rw [RootResetPersistentResponseSelector.carrierFirstLiveAddress?,
        RootResetSelectedFrontParserAgreement.firstLiveAddress?, dif_pos cellNone,
        CheckpointRun.parseBase?_none_of_localShape shape,
        CheckpointDecoder.parseLocal?_complete shape]
      exact congrArg (fun result => result.map (fun inner => RootResetResponseBoundaryStages.localAccumulatorAddress view ++ inner)) ih
  · intro root decoded inner ih
    exact ih
  · intro tail decoded bit inner ih
    rw [RootResetPersistentResponseSelector.carrierFirstLiveAddress?,
      CheckpointRun.parseBase?_live_none, CheckpointRun.parseLocal?_live_none,
      CanonicalStep.parseCell?_live,
      RootResetSelectedFrontParserAgreement.firstLiveAddress?_live]
    dsimp only
    rw [ih]
    split <;> rename_i h <;> rw [h]
  · intro predecessor decoded bit audit inner ih
    rw [RootResetPersistentResponseSelector.carrierFirstLiveAddress?,
      CheckpointRun.parseBase?_tombstone_path_none admissible inner,
      CheckpointRun.parseLocal?_tombstone_none, CanonicalStep.parseCell?_tombstone,
      RootResetSelectedFrontParserAgreement.firstLiveAddress?_tombstone]
    dsimp only
    rw [ih]

theorem first_eq_of_selected
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term}
    {bit : Bool} {suffix : List Bool} {outerContext : Context}
    (admissible : Carrier.Admissible continuation)
    (selected : CanonicalTraversal.SelectedFront program tree bits continuation source bit suffix outerContext) :
    RootResetPersistentResponseSelector.carrierFirstLiveAddress? program tree source =
      some (CanonicalTraversal.contextAddress outerContext) := by
  obtain ⟨context, descent⟩ := selected.descent
  rw [first_eq_of_path admissible
    (RootResetCarrierChronologyPreservation.descent_pathDecodes admissible descent)]
  exact RootResetSelectedFrontParserAgreement.firstLiveAddress?_ofSelectedFront admissible selected

theorem first_contracts_belowParents
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term}
    {bit : Bool} {suffix : List Bool} {outerContext : Context}
    (admissible : Carrier.Admissible continuation)
    (selected : CanonicalTraversal.SelectedFront program tree bits continuation source bit suffix outerContext)
    (parents : List ParentFrame) :
    ∃ predecessor,
      RootResetPersistentResponseSelector.carrierFirstLiveAddress? program tree source =
        some (CanonicalTraversal.contextAddress outerContext) ∧
      ((SchedulerInvariant.contextOfParents parents).plug source).contractAt?
          (RootResetPersistentCarrierTraversalAgreement.selectedFrontAddress parents outerContext) =
        some (RootResetPersistentCarrierTraversalAgreement.selectedFrontTarget parents bit outerContext predecessor) := by
  obtain ⟨predecessor, _, contracts⟩ :=
    RootResetSelectedFrontParserAgreement.firstLiveAddress?_contracts_belowParents admissible selected parents
  exact ⟨predecessor, first_eq_of_selected admissible selected, contracts⟩


end PureSFormal.Research.RootResetGeneratedFrontParserAgreement
