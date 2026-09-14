import PureSFormal.Research.RootResetCarrierOldestLiveProbe
import PureSFormal.Research.RootResetSelectedFrontParserAgreement

/-! Exact selected-front agreement for the finite oldest-live machine. -/
namespace PureSFormal.Research.RootResetCarrierOldestLiveAgreement
open PureSFormal.PureS
open FiniteController RootResetCarrierOldestLiveProbe RootResetEdgeFragment
open RootResetCarrierNonemptyAgreement RootResetCarrierNonemptyRows RootResetCarrierEdgePatterns
open RootResetSelectedFrontParserAgreement

def combine (source : Term) (address : Address) : Option Address → Option Address
  | some inner => some (address ++ inner)
  | none => if isLive? source then some [] else none

inductive Value (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Term → Option Address → Prop where
  | done (source : Term) (missed : select (RootResetCompleteCarrierRows.rows program tree) source = none) :
      Value program tree source none
  | next (source target : Term) (row : EdgeRow)
      (selected : select (RootResetCompleteCarrierRows.rows program tree) source = some row)
      (subterm : source.subterm? row.address = some target)
      {answer : Option Address} (inner : Value program tree target answer) :
      Value program tree source (combine source row.address answer)

theorem Value.follows {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {source : Term} {answer : Option Address} (value : Value program tree source answer)
    (origin : Cursor) (atSource : origin.focus = source) :
    ∀ address, answer = some address → ∃ endpoint, follow address origin = some endpoint := by
  induction value generalizing origin with
  | done source missed => intro address equal; cases equal
  | @next source target row selected subterm answer inner ih =>
      intro address equal
      cases answer with
      | none =>
          cases live : isLive? source with
          | false => simp only [combine, live, Bool.false_eq_true, ↓reduceIte] at equal; cases equal
          | true =>
              have same : [] = address := Option.some.inj (by simpa only [combine, live, ↓reduceIte] using equal)
              subst address
              exact ⟨origin, rfl⟩
      | some innerAddress =>
          have same : row.address ++ innerAddress = address := Option.some.inj equal
          subst address
          obtain ⟨after, followed, atTarget⟩ := follow_exists row.address origin.focus target (atSource ▸ subterm) origin.parents
          have original : (⟨origin.focus, origin.parents⟩ : Cursor) = origin := by cases origin; rfl
          rw [original] at followed
          obtain ⟨endpoint, execution⟩ := ih after atTarget innerAddress rfl
          exact ⟨endpoint, by rw [RootResetInverseEdgeFragment.follow_append, followed]; exact execution⟩

theorem Value.picked {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {source : Term} {answer : Option Address} (value : Value program tree source answer)
    {origin : Cursor} {result : Option Cursor} (picked : Picked program tree origin result)
    (atSource : origin.focus = source) : result = answer.bind (fun address => follow address origin) := by
  induction picked generalizing source answer with
  | done origin missed =>
      cases value with
      | done source stopped => rfl
      | next source target row selected subterm inner =>
          rw [atSource, selected] at missed
          contradiction
  | @next origin after row selected followed result rest ih =>
      cases value with
      | done source stopped =>
          rw [atSource, stopped] at selected
          contradiction
      | @next source target found foundSelected subterm answer inner =>
          have equal : row = found := Option.some.inj ((atSource ▸ selected).symm.trans foundSelected)
          subst found
          have atTarget := follow_subterm row.address origin after followed
          rw [atSource, subterm] at atTarget
          have recursive := ih inner (Option.some.inj atTarget).symm
          cases answer with
          | none =>
              change result = none at recursive
              rw [recursive]
              cases live : isLive? source <;> simp only [combine, pickCurrent, isLive, atSource, live, Bool.false_eq_true, ↓reduceIte, Option.bind, follow]
          | some address =>
              change result = follow address after at recursive
              simp only [combine, Option.bind, RootResetInverseEdgeFragment.follow_append, followed]
              change pickCurrent origin result = follow address after
              cases result with
              | some endpoint => exact recursive
              | none =>
                  obtain ⟨endpoint, followedInner⟩ := inner.follows after (Option.some.inj atTarget).symm address rfl
                  rw [followedInner] at recursive
                  cases recursive

theorem isLive_false_of_cellNone (source : Term) (missed : CanonicalStep.parseCell? source = none) : isLive? source = false := by
  have bitMiss (bit : Bool) : (livePattern bit).matchesBool source = false := by
    cases matched : (livePattern bit).matchesBool source with
    | false => rfl
    | true =>
        obtain ⟨predecessor, equal⟩ := RootResetCellSpineRows.live_sound bit source matched
        rw [equal, CanonicalStep.parseCell?_live] at missed
        cases missed
  rw [isLive?, bitMiss false, bitMiss true]
  rfl

theorem combine_not_live (source : Term) (address : Address) (answer : Option Address)
    (missed : isLive? source = false) : combine source address answer = answer.map (fun inner => address ++ inner) := by
  cases answer <;> simp only [combine, missed, Bool.false_eq_true, ↓reduceIte, Option.map]

def liveAnswer : Option Address → Option Address
  | some address => some (.right :: address)
  | none => some []

theorem Value.live (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (bit : Bool) (predecessor : Term) {answer : Option Address} (inner : Value program tree predecessor answer) :
    Value program tree (.app (PureSFormal.PureS.live bit) predecessor) (liveAnswer answer) := by
  have next := Value.next (.app (PureSFormal.PureS.live bit) predecessor) predecessor (RootResetCompleteCarrierRows.liveRow bit)
    (RootResetCompleteCarrierRows.selected_live program tree bit predecessor) (by cases predecessor <;> rfl) inner
  cases answer <;> simpa only [combine, liveAnswer, isLive?_live, ↓reduceIte, RootResetCompleteCarrierRows.liveRow,
    RootResetCellSpineRows.liveRow, List.cons_append, List.nil_append] using next

theorem Value.tombstone (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (bit : Bool) (predecessor audit : Term) {answer : Option Address}
    (missed : (basePattern (compileActions program tree)).matchesBool (Carrier.tombstone bit predecessor audit) = false)
    (inner : Value program tree predecessor answer) :
    Value program tree (Carrier.tombstone bit predecessor audit) (answer.map (fun address => [.left, .right] ++ address)) := by
  obtain ⟨row, selected, address⟩ := select_tombstone program tree bit predecessor audit missed
  have next := Value.next (Carrier.tombstone bit predecessor audit) predecessor row
    (RootResetCompleteCarrierRows.selected_ordinary program tree _ row selected)
    (by rw [address]; cases predecessor <;> rfl) inner
  have notLive : isLive? (Carrier.tombstone bit predecessor audit) = false := by cases bit <;> rfl
  rw [combine_not_live _ _ _ notLive, address] at next
  exact next

theorem Value.spine (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    {source : Term} {decoded : List Bool} (path : CellSpine.Decodes source decoded) :
    Value program tree source (spineFirstLiveAddress? source) := by
  induction path with
  | omega =>
      rw [spineFirstLiveAddress?_omega]
      apply Value.done
      rw [RootResetCompleteCarrierRows.rows, RootResetCompleteCarrierRows.select_append, select_omega]
      rfl
  | live bit inner ih => rw [spineFirstLiveAddress?_live]; exact .live program tree bit _ ih
  | tombstone bit audit inner ih =>
      rw [spineFirstLiveAddress?_tombstone]
      exact .tombstone program tree bit _ audit (spine_tombstone_base_miss program tree inner bit audit) ih

theorem Value.local {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {source : Term} {view : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program tree source = some view)
    (inner : Value program tree view.accumulator (firstLiveAddress? program tree view.accumulator)) :
    Value program tree source (firstLiveAddress? program tree source) := by
  have noCell := parseCell?_none_of_headArity_five_or_six (CheckpointDecoder.parseLocal?_headArity parsed)
  have noBase := CheckpointRun.parseBase?_none_of_localShape (CheckpointDecoder.parseLocal?_sound parsed)
  obtain ⟨row, selected, address⟩ := select_local parsed
  have next := Value.next source view.accumulator row
    (RootResetCompleteCarrierRows.selected_ordinary program tree _ row selected)
    (by rw [address]; exact RootResetCompletedFrontPreservation.localParsed_accumulator_subterm parsed) inner
  rw [combine_not_live _ _ _ (isLive_false_of_cellNone source noCell), address] at next
  rw [firstLiveAddress?, dif_pos noCell, noBase, parsed]
  exact next

theorem Value.base (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation queue beta : Term) (admissible : Carrier.Admissible continuation)
    {decoded : List Bool} (complete : CellSpine.Decodes queue decoded) :
    Value program tree (MutableBase.base (compileActions program tree) bits continuation queue beta)
      (firstLiveAddress? program tree (MutableBase.base (compileActions program tree) bits continuation queue beta)) := by
  have noCell := parseCell?_none_of_headArity_five_or_six
    (MutableBase.root_headArity (compileActions program tree) bits admissible queue beta)
  have parsed := CheckpointDecoder.parseBase?_mutableBase (compileActions program tree) bits continuation queue beta
  have next := Value.next (MutableBase.base (compileActions program tree) bits continuation queue beta) queue (baseRow (compileActions program tree))
    (RootResetCompleteCarrierRows.selected_ordinary program tree _ _ (select_base program tree continuation queue (word bits) beta))
    (by cases queue <;> rfl) (Value.spine program tree complete)
  rw [combine_not_live _ _ _ (isLive_false_of_cellNone _ noCell)] at next
  rw [firstLiveAddress?, dif_pos noCell, parsed]
  exact next

theorem Value.path {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term} {decoded : List Bool}
    (admissible : Carrier.Admissible continuation)
    (path : CarrierDecoder.PathDecodes program tree bits continuation source decoded) :
    Value program tree source (firstLiveAddress? program tree source) := by
  apply CarrierDecoder.PathDecodes.rec
    (program := program) (tree := tree) (bits := bits) (continuation := continuation) (t := path)
    (motive_1 := fun term decoded _ => Value program tree term (firstLiveAddress? program tree term))
    (motive_2 := fun term decoded _ => Value program tree term (firstLiveAddress? program tree term))
  · intro queue beta decoded queueComplete
    exact .base program tree bits continuation queue beta admissible queueComplete
  · intro accumulator dispatcher result decoded inner dispatch shell ih
    obtain ⟨route, label, dispatchShape⟩ := dispatch
    cases shell with
    | fresh haltAudit seedAudit continuationAudit =>
      let view : CheckpointDecoder.LocalView program := ⟨.fresh, route, label, accumulator, word bits, continuation⟩
      have shape : CheckpointDecoder.LocalShape program tree view
          (Carrier.activeShell bits continuation (freshHField haltAudit) dispatcher seedAudit continuationAudit) :=
        ⟨freshHField haltAudit, dispatcher, seedAudit, continuationAudit, .fresh haltAudit, dispatchShape, rfl⟩
      exact Value.local (CheckpointDecoder.parseLocal?_complete shape) ih
    | marked leftAudit rightAudit seedAudit continuationAudit =>
      let view : CheckpointDecoder.LocalView program := ⟨.marked, route, label, accumulator, word bits, continuation⟩
      have shape : CheckpointDecoder.LocalShape program tree view
          (Carrier.activeShell bits continuation (Carrier.markedHField leftAudit rightAudit) dispatcher seedAudit continuationAudit) :=
        ⟨Carrier.markedHField leftAudit rightAudit, dispatcher, seedAudit, continuationAudit,
          .marked leftAudit rightAudit, dispatchShape, rfl⟩
      exact Value.local (CheckpointDecoder.parseLocal?_complete shape) ih
  · intro root decoded inner ih
    exact ih
  · intro tail decoded bit inner ih
    rw [firstLiveAddress?_live]
    exact .live program tree bit tail ih
  · intro predecessor decoded bit audit inner ih
    rw [firstLiveAddress?_tombstone]
    exact .tombstone program tree bit predecessor audit (base_misses_tombstone_path admissible inner bit audit) ih

theorem Value.generated_runs {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {source : Term} {answer : Option Address} (value : Value program tree source answer)
    (origin : Cursor) (atSource : origin.focus = source) (boundary : RootResetCompleteCarrierRows.Boundary origin) :
    ∃ ticks, ticks ≤ coefficient program tree * origin.focus.size ∧
      run (RootResetCarrierOldestLiveProbe.machine program tree) ticks (RootResetCarrierOldestLiveProbe.initial program tree origin) =
        final program tree origin (answer.bind (fun address => follow address origin)) := by
  obtain ⟨ticks, result, bounded, execution, picked⟩ := selects program tree origin boundary
  rw [value.picked picked atSource] at execution
  exact ⟨ticks, bounded, execution⟩

theorem generated_runs {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term} {decoded : List Bool}
    (admissible : Carrier.Admissible continuation)
    (path : CarrierDecoder.PathDecodes program tree bits continuation source decoded)
    (origin : Cursor) (atSource : origin.focus = source) (boundary : RootResetCompleteCarrierRows.Boundary origin) :
    ∃ ticks, ticks ≤ coefficient program tree * origin.focus.size ∧
      run (RootResetCarrierOldestLiveProbe.machine program tree) ticks (RootResetCarrierOldestLiveProbe.initial program tree origin) =
        final program tree origin ((firstLiveAddress? program tree source).bind (fun address => follow address origin)) := by
  obtain ⟨ticks, result, bounded, execution, picked⟩ := selects program tree origin boundary
  rw [(Value.path admissible path).picked picked atSource] at execution
  exact ⟨ticks, bounded, execution⟩

theorem selected_runs {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term} {decoded : List Bool}
    (admissible : Carrier.Admissible continuation)
    (path : CarrierDecoder.PathDecodes program tree bits continuation source decoded)
    (origin endpoint : Cursor) (atSource : origin.focus = source)
    (boundary : RootResetCompleteCarrierRows.Boundary origin) (address : Address)
    (selected : firstLiveAddress? program tree source = some address) (followed : follow address origin = some endpoint) :
    ∃ ticks, ticks ≤ coefficient program tree * origin.focus.size ∧
      run (RootResetCarrierOldestLiveProbe.machine program tree) ticks (RootResetCarrierOldestLiveProbe.initial program tree origin) = ⟨some (.done true), endpoint⟩ := by
  obtain ⟨ticks, bounded, execution⟩ := generated_runs admissible path origin atSource boundary
  rw [selected] at execution
  change run (RootResetCarrierOldestLiveProbe.machine program tree) ticks (RootResetCarrierOldestLiveProbe.initial program tree origin) = final program tree origin (follow address origin) at execution
  rw [followed] at execution
  exact ⟨ticks, bounded, execution⟩

theorem empty_runs {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term} {decoded : List Bool}
    (admissible : Carrier.Admissible continuation)
    (path : CarrierDecoder.PathDecodes program tree bits continuation source decoded)
    (origin : Cursor) (atSource : origin.focus = source) (boundary : RootResetCompleteCarrierRows.Boundary origin)
    (empty : firstLiveAddress? program tree source = none) :
    ∃ ticks, ticks ≤ coefficient program tree * origin.focus.size ∧
      run (RootResetCarrierOldestLiveProbe.machine program tree) ticks (RootResetCarrierOldestLiveProbe.initial program tree origin) = ⟨some (.done false), origin⟩ := by
  obtain ⟨ticks, bounded, execution⟩ := generated_runs admissible path origin atSource boundary
  rw [empty] at execution
  exact ⟨ticks, bounded, execution⟩

end PureSFormal.Research.RootResetCarrierOldestLiveAgreement
