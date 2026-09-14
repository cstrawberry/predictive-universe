import PureSFormal.Research.RootResetDeletedBitRows

/-!
# Exact deleted-bit recovery on every generated carrier

The finite row scanner computes the literal deletedFrontBit? value on the
whole generated carrier grammar, including an empty Base with no tombstone.
Every accepted finite run retains that value and restores the same halt
argument cursor. The chronology-based response-bit override is separate.
-/
namespace PureSFormal.Research.RootResetDeletedBitAgreement
open PureSFormal.PureS
open RootResetCarrierEdgePatterns
open RootResetDeletedBitRows
open RootResetPersistentResponseSelector

inductive Reads (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Term → Option Bool → Prop where
  | done (source : Term) (missed : RootResetEdgeFragment.select (rows program tree) source = none) :
      Reads program tree source (RootResetLabelledPatternFragment.selected labels source)
  | next (source target : Term) (row : EdgeRow)
      (selected : RootResetEdgeFragment.select (rows program tree) source = some row)
      (subterm : source.subterm? row.address = some target)
      {answer : Option Bool} (inner : Reads program tree target answer) : Reads program tree source answer

theorem Reads.walks {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {source : Term} {answer : Option Bool} (reads : Reads program tree source answer)
    {origin endpoint : Cursor} (walk : RootResetEdgeSpine.Walks (rows program tree) origin endpoint)
    (atSource : origin.focus = source) : RootResetLabelledPatternFragment.selected labels endpoint.focus = answer := by
  induction walk generalizing source answer with
  | done origin missed =>
      cases reads with
      | done source stopped => rw [atSource]
      | next source target row selected subterm inner =>
          rw [atSource, selected] at missed
          contradiction
  | next origin after row selected followed rest ih =>
      cases reads with
      | done source stopped =>
          rw [atSource, stopped] at selected
          contradiction
      | next source target found foundSelected subterm inner =>
          have equal := Option.some.inj ((atSource ▸ selected).symm.trans foundSelected)
          subst found
          have atTarget := RootResetEdgeFragment.follow_subterm row.address origin after followed
          rw [atSource, subterm] at atTarget
          exact ih inner (Option.some.inj atTarget).symm

theorem select_omega (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :
    RootResetEdgeFragment.select (rows program tree) omega = none := by
  apply RootResetCarrierNonemptyAgreement.select_none_of_all
  intro row member
  rcases member_cases program tree row member with old | zero | one
  · rcases List.mem_cons.mp old with first | later
    · subst row; rfl
    · rcases List.mem_append.mp later with fresh | marked
      · exact RootResetCarrierNonemptyAgreement.localRows_miss fresh rfl
      · exact RootResetCarrierNonemptyAgreement.localRows_miss marked rfl
  · subst row; rfl
  · subst row; rfl

theorem Reads.live {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {source : Term} {answer : Option Bool} (bit : Bool) (inner : Reads program tree source answer) :
    Reads program tree (.app (PureS.live bit) source) answer :=
  .next _ source (RootResetCellSpineRows.liveRow bit) (select_live program tree bit source)
    (by cases source <;> rfl) inner

theorem Reads.local {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {source : Term} {view : CheckpointDecoder.LocalView program} {answer : Option Bool}
    (parsed : CheckpointDecoder.parseLocal? program tree source = some view)
    (inner : Reads program tree view.accumulator answer) : Reads program tree source answer := by
  obtain ⟨row, selected, addressEq⟩ := select_local parsed
  refine .next source view.accumulator row selected ?_ inner
  rw [addressEq]
  exact RootResetCompletedFrontPreservation.localParsed_accumulator_subterm parsed

theorem Reads.tombstone (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (bit : Bool) (predecessor audit : Term)
    (baseMiss : (RootResetCarrierNonemptyRows.basePattern (compileActions program tree)).matchesBool
      (Carrier.tombstone bit predecessor audit) = false) :
    Reads program tree (Carrier.tombstone bit predecessor audit) (some bit) := by
  have value := Reads.done (program := program) (tree := tree) _
    (select_tombstone program tree bit predecessor audit baseMiss)
  rw [labelled_tombstone] at value
  exact value

theorem Reads.spine (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    {source : Term} {decoded : List Bool} (path : CellSpine.Decodes source decoded) :
    Reads program tree source (deletedFrontBitInSpine? source) := by
  induction path with
  | omega =>
      rw [deletedFrontBitInSpine?]
      exact .done omega (select_omega program tree)
  | live bit inner ih =>
      rw [deletedFrontBitInSpine?, CanonicalStep.parseCell?_live]
      exact .live bit ih
  | tombstone bit audit inner ih =>
      rw [deletedFrontBitInSpine?, CanonicalStep.parseCell?_tombstone]
      exact .tombstone program tree bit _ audit
        (RootResetCarrierNonemptyAgreement.spine_tombstone_base_miss program tree inner bit audit)

theorem reads_local_value {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {source : Term} {view : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program tree source = some view)
    (inner : Reads program tree view.accumulator (deletedFrontBit? program tree view.accumulator)) :
    Reads program tree source (deletedFrontBit? program tree source) := by
  have noBase := CheckpointRun.parseBase?_none_of_localShape (CheckpointDecoder.parseLocal?_sound parsed)
  rw [deletedFrontBit?, noBase, parsed]
  exact .local parsed inner

theorem Reads.path {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits decoded : List Bool} {continuation source : Term}
    (admissible : Carrier.Admissible continuation)
    (path : CarrierDecoder.PathDecodes program tree bits continuation source decoded) :
    Reads program tree source (deletedFrontBit? program tree source) := by
  apply CarrierDecoder.PathDecodes.rec
    (program := program) (tree := tree) (bits := bits) (continuation := continuation) (t := path)
    (motive_1 := fun source _ _ => Reads program tree source (deletedFrontBit? program tree source))
    (motive_2 := fun source _ _ => Reads program tree source (deletedFrontBit? program tree source))
  · intro queue beta decoded queueComplete
    rw [deletedFrontBit?, CheckpointDecoder.parseBase?_mutableBase]
    exact .next _ queue (RootResetCarrierNonemptyRows.baseRow (compileActions program tree))
      (select_base program tree continuation queue (word bits) beta) (by cases queue <;> rfl)
      (Reads.spine program tree queueComplete)
  · intro accumulator dispatcher result decoded inner dispatch shell ih
    obtain ⟨route, label, dispatchShape⟩ := dispatch
    cases shell with
    | fresh haltAudit seedAudit continuationAudit =>
      let view : CheckpointDecoder.LocalView program := ⟨.fresh, route, label, accumulator, word bits, continuation⟩
      have shape : CheckpointDecoder.LocalShape program tree view
          (Carrier.activeShell bits continuation (freshHField haltAudit) dispatcher seedAudit continuationAudit) :=
        ⟨freshHField haltAudit, dispatcher, seedAudit, continuationAudit, .fresh haltAudit, dispatchShape, rfl⟩
      exact reads_local_value (CheckpointDecoder.parseLocal?_complete shape) ih
    | marked leftAudit rightAudit seedAudit continuationAudit =>
      let view : CheckpointDecoder.LocalView program := ⟨.marked, route, label, accumulator, word bits, continuation⟩
      have shape : CheckpointDecoder.LocalShape program tree view
          (Carrier.activeShell bits continuation (Carrier.markedHField leftAudit rightAudit) dispatcher seedAudit continuationAudit) :=
        ⟨Carrier.markedHField leftAudit rightAudit, dispatcher, seedAudit, continuationAudit,
          .marked leftAudit rightAudit, dispatchShape, rfl⟩
      exact reads_local_value (CheckpointDecoder.parseLocal?_complete shape) ih
  · intro root decoded inner ih
    exact ih
  · intro tail decoded bit inner ih
    rw [deletedFrontBit?, CheckpointRun.parseBase?_live_none, CheckpointRun.parseLocal?_live_none,
      CanonicalStep.parseCell?_live]
    exact .live bit ih
  · intro predecessor decoded bit audit inner ih
    rw [deletedFrontBit?, CheckpointRun.parseBase?_tombstone_path_none admissible inner bit audit,
      CheckpointRun.parseLocal?_tombstone_none, CanonicalStep.parseCell?_tombstone]
    exact .tombstone program tree bit predecessor audit
      (RootResetCarrierNonemptyRows.base_misses_tombstone_path admissible inner bit audit)

theorem generated_path_runs {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits decoded : List Bool} {continuation source : Term}
    (admissible : Carrier.Admissible continuation)
    (path : CarrierDecoder.PathDecodes program tree bits continuation source decoded)
    (parents : List ParentFrame) :
    ∃ ticks state, ticks ≤ budget program tree ⟨source, .right haltCode :: parents⟩ ∧
      FiniteController.run (machine program tree) ticks (initial program tree ⟨source, .right haltCode :: parents⟩) =
        ⟨some (.done state), ⟨source, .right haltCode :: parents⟩⟩ ∧
      RootResetLabelledPatternFragment.answer? state = some (deletedFrontBit? program tree source) := by
  obtain ⟨ticks, descended, bounded, execution, walk⟩ := all_input program tree source parents
  refine ⟨ticks, _, bounded, execution, ?_⟩
  rw [RootResetLabelledPatternFragment.finished_answer, (Reads.path admissible path).walks walk rfl]

end PureSFormal.Research.RootResetDeletedBitAgreement
