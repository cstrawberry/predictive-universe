import PureSFormal.Research.ProtectedTrieLabelSemantics

/-!
# Ordinary state-merged configuration quotient

Occurrence histories are the persistent all-reduct source state.  This module
maps them to the ordinary reachable configuration graph by their formal final
rows.  The map is surjective, its kernel is exactly equality of final rows,
and it maps and lifts ordered occurrence edges.  Parallel slot occurrences
remain distinct even when they reach the same row; forgetting the slot gives
the conventional state-merged simple relation.

No `Quot` is used.  `ReachableConfiguration` is the constructive quotient
carrier and `configurationQuotientCertificate` proves its universal data:
surjectivity, exact kernel, edge preservation, and edge lifting.
-/

namespace PureSFormal.Research.ProtectedTrieConfigurationQuotient

open PureSFormal.PureS
open PureSFormal.Research.ProtectedTrieCertificates
open PureSFormal.Research.ProtectedTrieLabelSemantics
open PureSFormal.Research.ProtectedTrieMachine
open PureSFormal.Research.ProtectedTrieMachineCode
open PureSFormal.Research.ProtectedTrieProjection
open PureSFormal.Research.ProtectedTrieStrong
open PureSFormal.Research.ProtectedTrieStrongTheorem
open PureSFormal.Research.ProtectedTrieSubdivision
open PureSFormal.Research.ProtectedTrieTableau

/-! ## Finite configuration images of current projections -/

/-- Map every represented occurrence history to its formal final row.
Invalid entries contribute nothing.  On the encoder cone every represented
history is valid. -/
def configurationImage (source : Instance) (ideal : HistoryIdeal) : List Row :=
  ideal.entries.filterMap (sourceFinalRow? source)

/-- The ordinary state-merged observation of one current target term. -/
def configurationProjection (source : Instance) (term : Term) : List Row :=
  configurationImage source (strongProjection term)

/-- Exact extensional semantics of the finite configuration image. -/
theorem mem_filterMap_constructive {Alpha Beta : Type}
    (function : Alpha -> Option Beta) (value : Beta) (items : List Alpha) :
    List.Mem value (items.filterMap function) <->
      exists item, List.Mem item items /\ function item = some value := by
  induction items with
  | nil =>
      constructor
      · intro hmem
        cases hmem
      · rintro ⟨item, hitem, hvalue⟩
        cases hitem
  | cons first rest ih =>
      cases hfirst : function first with
      | none =>
          simp only [List.filterMap, hfirst]
          constructor
          · intro hmem
            obtain ⟨item, hitem, hvalue⟩ := ih.mp hmem
            exact ⟨item, List.Mem.tail first hitem, hvalue⟩
          · rintro ⟨item, hitem, hvalue⟩
            rcases List.mem_cons.mp hitem with heq | htail
            · subst item
              rw [hfirst] at hvalue
              cases hvalue
            · exact ih.mpr ⟨item, htail, hvalue⟩
      | some firstValue =>
          simp only [List.filterMap, hfirst]
          constructor
          · intro hmem
            rcases List.mem_cons.mp hmem with heq | htail
            · exact ⟨first, List.Mem.head rest, hfirst.trans
                (congrArg some heq.symm)⟩
            · obtain ⟨item, hitem, hvalue⟩ := ih.mp htail
              exact ⟨item, List.Mem.tail first hitem, hvalue⟩
          · rintro ⟨item, hitem, hvalue⟩
            rcases List.mem_cons.mp hitem with heq | htail
            · subst item
              have hvalueEq : firstValue = value :=
                Option.some.inj (hfirst.symm.trans hvalue)
              subst value
              exact List.Mem.head (rest.filterMap function)
            · exact List.Mem.tail firstValue
                (ih.mpr ⟨item, htail, hvalue⟩)

theorem mem_configurationImage_iff
    (source : Instance) (ideal : HistoryIdeal) (row : Row) :
    List.Mem row (configurationImage source ideal) <->
      exists history,
        ideal.Contains history /\
        sourceFinalRow? source history = some row := by
  unfold configurationImage HistoryIdeal.Contains
  constructor
  · intro hmem
    obtain ⟨history, hhistory, hrow⟩ :=
      (mem_filterMap_constructive (sourceFinalRow? source) row _).mp hmem
    exact ⟨history, hhistory, hrow⟩
  · rintro ⟨history, hhistory, hrow⟩
    exact (mem_filterMap_constructive
      (sourceFinalRow? source) row _).mpr ⟨history, hhistory, hrow⟩

/-- Exact current-term form of the configuration-image semantics. -/
theorem mem_configurationProjection_iff
    (source : Instance) (term : Term) (row : Row) :
    List.Mem row (configurationProjection source term) <->
      exists history,
        (strongProjection term).Contains history /\
        sourceFinalRow? source history = some row :=
  mem_configurationImage_iff source (strongProjection term) row

/-- Semantic inclusion of history ideals implies inclusion of their
state-merged configuration images. -/
theorem configurationImage_mono (source : Instance)
    {before after : HistoryIdeal} (hle : before.LE after) :
    forall row,
      List.Mem row (configurationImage source before) ->
      List.Mem row (configurationImage source after) := by
  intro row hrow
  obtain ⟨history, hhistory, hfinal⟩ :=
    (mem_configurationImage_iff source before row).mp hrow
  exact (mem_configurationImage_iff source after row).mpr
    ⟨history, hle history hhistory, hfinal⟩

/-- One raw target edge cannot remove an ordinary reachable configuration. -/
theorem configurationProjection_step_mono
    (source : Instance) {before after : Term}
    (hreach : Steps (strongEncoder source) before)
    (hstep : Step before after) :
    forall row,
      List.Mem row (configurationProjection source before) ->
      List.Mem row (configurationProjection source after) := by
  obtain ⟨events, hnodup, hle, hmembership, hvalid, hready⟩ :=
    strongProjection_step_genuine_batch source hreach hstep
  exact configurationImage_mono source hle

/-- A raw edge's finite history batch maps to genuine reachable
configurations.  Equal rows may collapse, so an individual history event may
be a configuration-level stutter. -/
def ConfigurationDiscoveryBatch (source : Instance)
    (before after : Term) : Prop :=
  exists events : List BitWord,
    RankOrderedBatch (ValidHistory source)
      (strongProjection before) (strongProjection after) /\
    (forall row,
      List.Mem row (configurationProjection source after) <->
        List.Mem row (configurationProjection source before) \/
          exists history,
            List.Mem history events /\
            sourceFinalRow? source history = some row) /\
    (forall history, List.Mem history events ->
      exists row,
        sourceFinalRow? source history = some row /\
        List.Mem row (configurationProjection source after))

/-- Every unrestricted target edge yields a finite rank-ordered batch of
genuine configuration discoveries after applying the final-row quotient. -/
theorem configurationProjection_step_genuine_batch
    (source : Instance) {before after : Term}
    (hreach : Steps (strongEncoder source) before)
    (hstep : Step before after) :
    ConfigurationDiscoveryBatch source before after := by
  have hbatch := strongProjection_step_genuine_batch source hreach hstep
  obtain ⟨events, hnodup, hle, hmembership, hvalid, hready⟩ := hbatch
  refine ⟨events,
    ⟨events, hnodup, hle, hmembership, hvalid, hready⟩, ?_, ?_⟩
  · intro row
    rw [mem_configurationProjection_iff,
      mem_configurationProjection_iff]
    constructor
    · rintro ⟨history, hafter, hrow⟩
      rcases (hmembership history).mp hafter with hbefore | hevent
      · exact Or.inl ⟨history, hbefore, hrow⟩
      · exact Or.inr ⟨history, hevent, hrow⟩
    · intro hcase
      rcases hcase with hbefore | hevent
      · obtain ⟨history, hbefore, hrow⟩ := hbefore
        exact ⟨history, hle history hbefore, hrow⟩
      · obtain ⟨history, hevent, hrow⟩ := hevent
        exact ⟨history, (hmembership history).mpr (Or.inr hevent), hrow⟩
  · intro history hevent
    have hhistoryValid := (hvalid hevent).1
    obtain ⟨row, hrow⟩ := hhistoryValid
    refine ⟨row, hrow, ?_⟩
    exact (mem_configurationProjection_iff source after row).mpr
      ⟨history, (hmembership history).mpr (Or.inr hevent), hrow⟩

/-- At a canonical history checkpoint the state-merged image consists
exactly of final rows of the history's valid ancestors. -/
theorem configurationProjection_checkpoint_iff
    (source : Instance) (history : BitWord)
    (hvalid : ValidHistory source history) (row : Row) :
    List.Mem row (configurationProjection source
      (subdivisionCheckpoint sourceWitness (encodeInstance source) history)) <->
      exists ancestor,
        WordPrefix ancestor history /\
        sourceFinalRow? source ancestor = some row := by
  rw [mem_configurationProjection_iff]
  constructor
  · rintro ⟨ancestor, hcontains, hrow⟩
    have hequiv := strong_subdivisionCheckpoint_exact source history hvalid
    have hprefix := (branchIdeal_contains_iff ancestor history).mp
      ((hequiv ancestor).mp hcontains)
    exact ⟨ancestor, hprefix, hrow⟩
  · rintro ⟨ancestor, hprefix, hrow⟩
    have hequiv := strong_subdivisionCheckpoint_exact source history hvalid
    exact ⟨ancestor, (hequiv ancestor).mpr
      ((branchIdeal_contains_iff ancestor history).mpr hprefix), hrow⟩

/-! ## Constructive quotient carriers -/

/-- One valid occurrence history together with its unique formal final row. -/
structure ReachableHistory (source : Instance) where
  history : BitWord
  finalRow : Row
  run_eq : sourceFinalRow? source history = some finalRow

/-- An ordinary row reachable from the initialized source instance. -/
def RowReachable (source : Instance) (row : Row) : Prop :=
  exists history, sourceFinalRow? source history = some row

/-- The constructive carrier of the state-merged configuration quotient. -/
def ReachableConfiguration (source : Instance) :=
  { row : Row // RowReachable source row }

/-- A row is source-reachable exactly when it is the formal final row of one
valid occurrence history. -/
theorem rowReachable_iff
    (source : Instance) (row : Row) :
    RowReachable source row <->
      exists history,
        ValidHistory source history /\
        sourceFinalRow? source history = some row := by
  constructor
  · rintro ⟨history, hrun⟩
    exact ⟨history, ⟨row, hrun⟩, hrun⟩
  · rintro ⟨history, hvalid, hrun⟩
    exact ⟨history, hrun⟩

/-- The quotient map sends an occurrence history to its final row. -/
def historyConfigurationMap {source : Instance}
    (history : ReachableHistory source) : ReachableConfiguration source :=
  ⟨history.finalRow, ⟨history.history, history.run_eq⟩⟩

/-- The final-row quotient is surjective onto all reachable configurations. -/
theorem historyConfigurationMap_surjective (source : Instance) :
    forall configuration : ReachableConfiguration source,
      exists history : ReachableHistory source,
        historyConfigurationMap history = configuration := by
  intro configuration
  obtain ⟨history, hrun⟩ := configuration.property
  let point : ReachableHistory source :=
    ⟨history, configuration.val, hrun⟩
  refine ⟨point, ?_⟩
  apply Subtype.ext
  rfl

/-- The quotient kernel is exactly equality of formal final rows. -/
theorem historyConfigurationMap_eq_iff
    {source : Instance} (left right : ReachableHistory source) :
    historyConfigurationMap left = historyConfigurationMap right <->
      left.finalRow = right.finalRow := by
  constructor
  · intro heq
    exact congrArg Subtype.val heq
  · intro heq
    apply Subtype.ext
    exact heq

/-- Equality in the state-merged quotient is exactly equality under the
partial formal run map. -/
theorem historyConfigurationMap_eq_iff_sourceFinalRow?
    {source : Instance} (left right : ReachableHistory source) :
    historyConfigurationMap left = historyConfigurationMap right <->
      sourceFinalRow? source left.history =
        sourceFinalRow? source right.history := by
  rw [historyConfigurationMap_eq_iff, left.run_eq, right.run_eq]
  constructor
  · intro hrow
    rw [hrow]
  · intro hsome
    exact Option.some.inj hsome

/-! ## Ordered occurrence edges and their quotient -/

/-- One valid ordered history-tree edge with both endpoint rows exposed. -/
structure ReachableHistoryOccurrenceEdge (source : Instance) where
  sourcePoint : ReachableHistory source
  targetPoint : ReachableHistory source
  slot : Bool
  history_eq : targetPoint.history = sourcePoint.history ++ [slot]

/-- One ordered occurrence edge in the ordinary state-merged configuration
multigraph. -/
structure ReachableConfigurationOccurrenceEdge (source : Instance) where
  sourcePoint : ReachableConfiguration source
  targetPoint : ReachableConfiguration source
  slot : Bool
  step_eq : step? source.machine sourcePoint.val slot = some targetPoint.val

/-- Formal execution through one appended occurrence bit factors through the
one-step source transition. -/
theorem sourceFinalRow?_append_singleton
    (source : Instance) (history : BitWord) (slot : Bool) :
    sourceFinalRow? source (history ++ [slot]) =
      (sourceFinalRow? source history).bind
        (fun row => step? source.machine row slot) := by
  unfold sourceFinalRow?
  rw [run?_append]
  cases hrun : run? source.machine (initialRow source) history with
  | none => rfl
  | some row =>
      change run? source.machine row [slot] =
        step? source.machine row slot
      unfold run?
      cases hstep : step? source.machine row slot with
      | none => rfl
      | some next => rfl

/-- Every valid ordered history edge maps to one ordered configuration edge. -/
def historyOccurrenceEdgeToConfiguration
    {source : Instance} (edge : ReachableHistoryOccurrenceEdge source) :
    ReachableConfigurationOccurrenceEdge source where
  sourcePoint := historyConfigurationMap edge.sourcePoint
  targetPoint := historyConfigurationMap edge.targetPoint
  slot := edge.slot
  step_eq := by
    have htarget := edge.targetPoint.run_eq
    rw [edge.history_eq, sourceFinalRow?_append_singleton,
      edge.sourcePoint.run_eq] at htarget
    exact htarget

/-- Every valid history extension supplies the corresponding ordered
configuration occurrence edge. -/
theorem valid_extension_maps_to_configuration_edge
    (source : Instance) (history : BitWord) (slot : Bool)
    (hsource : ValidHistory source history)
    (htarget : ValidHistory source (history ++ [slot])) :
    exists edge : ReachableHistoryOccurrenceEdge source,
      edge.sourcePoint.history = history /\
      edge.targetPoint.history = history ++ [slot] := by
  obtain ⟨sourceRow, hsourceRun⟩ := hsource
  obtain ⟨targetRow, htargetRun⟩ := htarget
  let sourcePoint : ReachableHistory source :=
    ⟨history, sourceRow, hsourceRun⟩
  let targetPoint : ReachableHistory source :=
    ⟨history ++ [slot], targetRow, htargetRun⟩
  let edge : ReachableHistoryOccurrenceEdge source :=
    ⟨sourcePoint, targetPoint, slot, rfl⟩
  exact ⟨edge, rfl, rfl⟩

/-- Every reachable ordered configuration edge lifts from an occurrence
history reaching its source configuration. -/
theorem configurationOccurrenceEdge_lifts
    {source : Instance}
    (edge : ReachableConfigurationOccurrenceEdge source) :
    exists lifted : ReachableHistoryOccurrenceEdge source,
      historyConfigurationMap lifted.sourcePoint = edge.sourcePoint /\
      historyConfigurationMap lifted.targetPoint = edge.targetPoint /\
      lifted.slot = edge.slot := by
  obtain ⟨history, hsourceRun⟩ := edge.sourcePoint.property
  have htargetRun : sourceFinalRow? source (history ++ [edge.slot]) =
      some edge.targetPoint.val := by
    rw [sourceFinalRow?_append_singleton, hsourceRun]
    exact edge.step_eq
  let sourceHistory : ReachableHistory source :=
    ⟨history, edge.sourcePoint.val, hsourceRun⟩
  let targetHistory : ReachableHistory source :=
    ⟨history ++ [edge.slot], edge.targetPoint.val, htargetRun⟩
  let lifted : ReachableHistoryOccurrenceEdge source :=
    ⟨sourceHistory, targetHistory, edge.slot, rfl⟩
  refine ⟨lifted, ?_, ?_, rfl⟩
  · apply Subtype.ext
    rfl
  · apply Subtype.ext
    rfl

/-- Forgetting occurrence multiplicity gives the conventional state-merged
simple edge relation. -/
def ConfigurationSimpleEdge (source : Instance)
    (before after : ReachableConfiguration source) : Prop :=
  exists slot, step? source.machine before.val slot = some after.val

/-- Every ordered quotient edge maps to the conventional simple relation. -/
theorem occurrenceEdge_forgets_to_simple
    {source : Instance}
    (edge : ReachableConfigurationOccurrenceEdge source) :
    ConfigurationSimpleEdge source edge.sourcePoint edge.targetPoint :=
  ⟨edge.slot, edge.step_eq⟩

/-- Conversely, every conventional simple edge has at least one ordered
occurrence-edge representative. -/
theorem simpleEdge_lifts_occurrence
    {source : Instance} {before after : ReachableConfiguration source}
    (hedge : ConfigurationSimpleEdge source before after) :
    exists edge : ReachableConfigurationOccurrenceEdge source,
      edge.sourcePoint = before /\ edge.targetPoint = after := by
  obtain ⟨slot, hstep⟩ := hedge
  exact ⟨⟨before, after, slot, hstep⟩, rfl, rfl⟩

/-- Equal successors in ordered slots zero and one merge to one configuration
vertex while retaining two distinct occurrence edges. -/
theorem equal_successor_slots_merge_vertices_preserve_edges
    {source : Instance} (point : ReachableHistory source)
    (successor : Row)
    (hzero : step? source.machine point.finalRow false = some successor)
    (hone : step? source.machine point.finalRow true = some successor) :
    exists target : ReachableConfiguration source,
      exists zeroEdge oneEdge : ReachableConfigurationOccurrenceEdge source,
        zeroEdge.sourcePoint = historyConfigurationMap point /\
        oneEdge.sourcePoint = historyConfigurationMap point /\
        zeroEdge.targetPoint = target /\
        oneEdge.targetPoint = target /\
        zeroEdge.slot = false /\ oneEdge.slot = true /\
        zeroEdge ≠ oneEdge := by
  have htargetRun : sourceFinalRow? source (point.history ++ [false]) =
      some successor := by
    rw [sourceFinalRow?_append_singleton, point.run_eq]
    exact hzero
  let target : ReachableConfiguration source :=
    ⟨successor, ⟨point.history ++ [false], htargetRun⟩⟩
  let zeroEdge : ReachableConfigurationOccurrenceEdge source :=
    ⟨historyConfigurationMap point, target, false, hzero⟩
  let oneEdge : ReachableConfigurationOccurrenceEdge source :=
    ⟨historyConfigurationMap point, target, true, hone⟩
  refine ⟨target, zeroEdge, oneEdge, rfl, rfl, rfl, rfl, rfl, rfl, ?_⟩
  intro heq
  have hslot := congrArg
    (fun edge : ReachableConfigurationOccurrenceEdge source => edge.slot) heq
  cases hslot

/-! ## Concrete equal-successor fixture -/

/-- One literal rule used in both occurrence slots of the fixture. -/
def equalSuccessorFixtureRule : Rule where
  write := true
  move := Direction.stay
  nextState := 1

/-- Both ordered slots are enabled and contain equal rule text. -/
def equalSuccessorFixtureCell : OrderedCell where
  slot0 := some equalSuccessorFixtureRule
  slot1 := some equalSuccessorFixtureRule

/-- A table cell with neither ordered occurrence enabled. -/
def equalSuccessorFixtureTerminalCell : OrderedCell where
  slot0 := none
  slot1 := none

/-- State `q0` branches through two equal occurrences while `q1` is
terminal.  Only the scanned-zero cell of `q0` is enabled. -/
def equalSuccessorFixtureMachine : Machine where
  states := [
    { onFalse := equalSuccessorFixtureCell
      onTrue := equalSuccessorFixtureTerminalCell },
    { onFalse := equalSuccessorFixtureTerminalCell
      onTrue := equalSuccessorFixtureTerminalCell }]

/-- A closed initialized source instance whose two root occurrences have the
same successor row. -/
def equalSuccessorFixtureSource : Instance where
  machine := equalSuccessorFixtureMachine
  initialState := 0
  input := [false]

/-- The literal initial padded row `R0 = (q0, 1, 000)`. -/
def equalSuccessorFixtureRow : Row where
  state := 0
  head := 1
  tape := [false, false, false]

/-- The common successor `R1 = (q1, 1, 010)`. -/
def equalSuccessorFixtureSuccessorRow : Row where
  state := 1
  head := 1
  tape := [false, true, false]

/-- The initialized source row is definitionally the displayed fixture row. -/
theorem equalSuccessorFixture_initialRow :
    initialRow equalSuccessorFixtureSource = equalSuccessorFixtureRow :=
  rfl

/-- Slot zero writes `1`, stays in place, and enters `q1`. -/
theorem equalSuccessorFixture_step_zero :
    step? equalSuccessorFixtureMachine equalSuccessorFixtureRow false =
      some equalSuccessorFixtureSuccessorRow :=
  rfl

/-- Slot one performs the same displayed transition as slot zero. -/
theorem equalSuccessorFixture_step_one :
    step? equalSuccessorFixtureMachine equalSuccessorFixtureRow true =
      some equalSuccessorFixtureSuccessorRow :=
  rfl

/-- The common successor row has no enabled occurrence slot. -/
theorem equalSuccessorFixture_successor_terminal :
    Terminal equalSuccessorFixtureMachine
      equalSuccessorFixtureSuccessorRow :=
  ⟨rfl, rfl⟩

/-- The slot-zero history ends in exactly `R1`. -/
theorem equalSuccessorFixture_finalRow_zero :
    sourceFinalRow? equalSuccessorFixtureSource [false] =
      some equalSuccessorFixtureSuccessorRow :=
  rfl

/-- The slot-one history also ends in exactly `R1`. -/
theorem equalSuccessorFixture_finalRow_one :
    sourceFinalRow? equalSuccessorFixtureSource [true] =
      some equalSuccessorFixtureSuccessorRow :=
  rfl

/-- The valid root occurrence point of the fixture. -/
def equalSuccessorFixtureRoot :
    ReachableHistory equalSuccessorFixtureSource where
  history := []
  finalRow := equalSuccessorFixtureRow
  run_eq := rfl

/-- The slot-zero occurrence history is a distinct valid tree vertex. -/
def equalSuccessorFixtureZero :
    ReachableHistory equalSuccessorFixtureSource where
  history := [false]
  finalRow := equalSuccessorFixtureSuccessorRow
  run_eq := rfl

/-- The slot-one occurrence history is a distinct valid tree vertex. -/
def equalSuccessorFixtureOne :
    ReachableHistory equalSuccessorFixtureSource where
  history := [true]
  finalRow := equalSuccessorFixtureSuccessorRow
  run_eq := rfl

/-- The two equal-successor occurrence histories remain literally distinct. -/
theorem equalSuccessorFixture_histories_distinct :
    equalSuccessorFixtureZero.history ≠
      equalSuccessorFixtureOne.history := by
  exact ordered_singleton_ne []

/-- State merging identifies the two occurrence histories by their equal
formal final row. -/
theorem equalSuccessorFixture_configurations_merge :
    historyConfigurationMap equalSuccessorFixtureZero =
      historyConfigurationMap equalSuccessorFixtureOne := by
  apply Subtype.ext
  rfl

/-- The concrete source has a terminating branch after either root slot. -/
theorem equalSuccessorFixture_sourceBranchHalts :
    SourceBranchHalts equalSuccessorFixtureSource :=
  ⟨[false], equalSuccessorFixtureSuccessorRow,
    equalSuccessorFixture_finalRow_zero,
    equalSuccessorFixture_successor_terminal⟩

/-- The target cone therefore contains a literal terminal-labelled
observation for the exact worked source instance. -/
theorem equalSuccessorFixture_terminalObservation :
    TargetTerminalObservation equalSuccessorFixtureSource :=
  (sourceBranchHalts_iff_targetTerminalObservation
    equalSuccessorFixtureSource).mp
      equalSuccessorFixture_sourceBranchHalts

/-- The concrete fixture has one merged target configuration but two distinct
ordered occurrence edges into it. -/
theorem equalSuccessorFixture_preserves_two_edges :
    exists target : ReachableConfiguration equalSuccessorFixtureSource,
      exists zeroEdge oneEdge :
          ReachableConfigurationOccurrenceEdge equalSuccessorFixtureSource,
        zeroEdge.sourcePoint =
            historyConfigurationMap equalSuccessorFixtureRoot /\
        oneEdge.sourcePoint =
            historyConfigurationMap equalSuccessorFixtureRoot /\
        zeroEdge.targetPoint = target /\
        oneEdge.targetPoint = target /\
        zeroEdge.slot = false /\ oneEdge.slot = true /\
        zeroEdge ≠ oneEdge :=
  equal_successor_slots_merge_vertices_preserve_edges
    equalSuccessorFixtureRoot equalSuccessorFixtureSuccessorRow
    equalSuccessorFixture_step_zero equalSuccessorFixture_step_one

/-! ## Quotient certificate -/

/-- Constructive graph-quotient certificate from occurrence histories to the
ordinary reachable state-merged configuration graph. -/
structure ConfigurationQuotientCertificate (source : Instance) : Prop where
  surjective : forall configuration : ReachableConfiguration source,
    exists history : ReachableHistory source,
      historyConfigurationMap history = configuration
  exactKernel : forall left right : ReachableHistory source,
    historyConfigurationMap left = historyConfigurationMap right <->
      sourceFinalRow? source left.history =
        sourceFinalRow? source right.history
  mapsOccurrence : forall edge : ReachableHistoryOccurrenceEdge source,
    (historyOccurrenceEdgeToConfiguration edge).sourcePoint =
        historyConfigurationMap edge.sourcePoint /\
      (historyOccurrenceEdgeToConfiguration edge).targetPoint =
        historyConfigurationMap edge.targetPoint /\
      (historyOccurrenceEdgeToConfiguration edge).slot = edge.slot
  liftsOccurrence : forall edge : ReachableConfigurationOccurrenceEdge source,
    exists lifted : ReachableHistoryOccurrenceEdge source,
      historyConfigurationMap lifted.sourcePoint = edge.sourcePoint /\
      historyConfigurationMap lifted.targetPoint = edge.targetPoint /\
      lifted.slot = edge.slot
  simpleGraph : forall before after : ReachableConfiguration source,
    ConfigurationSimpleEdge source before after <->
      exists edge : ReachableConfigurationOccurrenceEdge source,
        edge.sourcePoint = before /\ edge.targetPoint = after

/-- Every concrete ordered-binary source instance has the exact constructive
state-merged graph quotient. -/
theorem configurationQuotientCertificate (source : Instance) :
    ConfigurationQuotientCertificate source := by
  refine {
    surjective := historyConfigurationMap_surjective source
    exactKernel := historyConfigurationMap_eq_iff_sourceFinalRow?
    mapsOccurrence := fun _ => ⟨rfl, rfl, rfl⟩
    liftsOccurrence := configurationOccurrenceEdge_lifts
    simpleGraph := ?_ }
  intro before after
  constructor
  · exact simpleEdge_lifts_occurrence
  · rintro ⟨edge, rfl, rfl⟩
    exact occurrenceEdge_forgets_to_simple edge

end PureSFormal.Research.ProtectedTrieConfigurationQuotient
