import PureSFormal.Research.RootResetCarrierNonemptyRows

/-!
# Generated nonemptiness and finite carrier-scan endpoints

The fixed finite Base, Local, and tombstone edge family follows the public
generated carrier path. Every resulting endpoint decides nonemptiness by
two fixed live-prefix patterns. The actual linear finite-machine run
therefore recovers exactly the fresh continuation admission predicate,
including arbitrary nested fresh and marked Local carriers.
-/

namespace PureSFormal.Research.RootResetCarrierNonemptyAgreement
open PureSFormal.PureS
open RootResetCarrierEdgePatterns
open RootResetCarrierNonemptyRows
open RootResetEdgeFragment
open RootResetCompletedLocalPatterns

def livePattern (bit : Bool) : Pattern := .app (literal (live bit)) .hole

def isLive? (source : Term) : Bool :=
  (livePattern false).matchesBool source || (livePattern true).matchesBool source

theorem isLive?_live (bit : Bool) (predecessor : Term) :
    isLive? (.app (live bit) predecessor) = true := by
  cases bit <;> simp only [isLive?, livePattern, Pattern.matchesBool, literal_self, Bool.and_true, Bool.true_or, Bool.or_true]

theorem isLive?_omega : isLive? omega = false := rfl

theorem select_none_of_all (edges : List EdgeRow) (source : Term)
    (misses : ∀ row ∈ edges, row.pattern.matchesBool source = false) : select edges source = none := by
  induction edges with
  | nil => rfl
  | cons row rest ih =>
      rw [select, misses row (List.Mem.head _)]
      exact ih (fun next member => misses next (List.Mem.tail _ member))

theorem select_exists_of_match (edges : List EdgeRow) (source : Term) (row : EdgeRow)
    (member : row ∈ edges) (matched : row.pattern.matchesBool source = true) :
    ∃ found, select edges source = some found := by
  induction edges with
  | nil => cases member
  | cons first rest ih =>
      cases firstMatch : first.pattern.matchesBool source with
      | true => exact ⟨first, by rw [select, firstMatch]; rfl⟩
      | false =>
          rcases List.mem_cons.mp member with equal | later
          · subst first
            rw [matched] at firstMatch
            contradiction
          · obtain ⟨found, selected⟩ := ih later
            exact ⟨found, by rw [select, firstMatch]; exact selected⟩

theorem localRows_sound {status : CheckpointDecoder.HaltStatus} {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)} {row : EdgeRow} {source : Term}
    (member : row ∈ localRows status program tree) (matched : row.pattern.matchesBool source = true) :
    ∃ view : CheckpointDecoder.LocalView program,
      CheckpointDecoder.parseLocal? program tree source = some view ∧
      row.address = RootResetResponseBoundaryStages.localAccumulatorAddress view := by
  obtain ⟨dispatch, dispatchMember, rowEq⟩ := map_member_inverse _ _ _ member
  subst row
  obtain ⟨view, statusEq, parsed, addressEq⟩ := localRow_sound status program tree dispatch dispatchMember source matched
  exact ⟨view, parsed, addressEq⟩

theorem localRows_miss {status : CheckpointDecoder.HaltStatus} {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)} {row : EdgeRow} {source : Term}
    (member : row ∈ localRows status program tree)
    (noLocal : CheckpointDecoder.parseLocal? program tree source = none) :
    row.pattern.matchesBool source = false := by
  cases matched : row.pattern.matchesBool source with
  | false => rfl
  | true =>
      obtain ⟨view, parsed, _⟩ := localRows_sound member matched
      rw [noLocal] at parsed
      contradiction

theorem tail_member (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (row : EdgeRow)
    (member : row ∈ localRows .fresh program tree ++ localRows .marked program tree ++ [tombstoneRow false, tombstoneRow true]) :
    row ∈ localRows .fresh program tree ∨ row ∈ localRows .marked program tree ∨
      row = tombstoneRow false ∨ row = tombstoneRow true := by
  rcases List.mem_append.mp member with localMember | tombMember
  · rcases List.mem_append.mp localMember with fresh | marked
    · exact Or.inl fresh
    · exact Or.inr (Or.inl marked)
  · rcases List.mem_cons.mp tombMember with zero | one
    · exact Or.inr (Or.inr (Or.inl zero))
    · exact Or.inr (Or.inr (Or.inr (List.mem_singleton.mp one)))

theorem select_live (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (bit : Bool) (predecessor : Term) :
    select (rows program tree) (.app (live bit) predecessor) = none := by
  apply select_none_of_all
  intro row member
  rcases List.mem_cons.mp member with first | later
  · subst row
    exact base_misses_live _ bit predecessor
  · rcases tail_member program tree row later with fresh | marked | zero | one
    · exact localRows_miss fresh (CheckpointRun.parseLocal?_live_none ..)
    · exact localRows_miss marked (CheckpointRun.parseLocal?_live_none ..)
    · subst row
      cases bit <;> rfl
    · subst row
      cases bit <;> rfl

theorem select_omega (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :
    select (rows program tree) omega = none := by
  apply select_none_of_all
  intro row member
  rcases List.mem_cons.mp member with first | later
  · subst row
    rfl
  · rcases tail_member program tree row later with fresh | marked | zero | one
    · exact localRows_miss fresh rfl
    · exact localRows_miss marked rfl
    · subst row; rfl
    · subst row; rfl

theorem select_base (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (continuation queue seed beta : Term) :
    select (rows program tree) (CheckpointDecoder.openBase (compileActions program tree) continuation queue seed beta) =
      some (baseRow (compileActions program tree)) := by
  rw [rows, select]
  change (if (basePattern _).matchesBool _ then _ else _) = _
  rw [base_matches]
  rfl

theorem select_local
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {source : Term} {view : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program tree source = some view) :
    ∃ row, select (rows program tree) source = some row ∧
      row.address = RootResetResponseBoundaryStages.localAccumulatorAddress view := by
  obtain ⟨candidate, member, matched, _⟩ := localRow_complete parsed
  have memberAll : candidate ∈ rows program tree := by
    apply List.Mem.tail
    apply List.mem_append.mpr
    apply Or.inl
    cases statusEq : view.status with
    | fresh => exact List.mem_append.mpr (Or.inl (statusEq ▸ member))
    | marked => exact List.mem_append.mpr (Or.inr (statusEq ▸ member))
  obtain ⟨row, selected⟩ := select_exists_of_match _ source candidate memberAll matched
  obtain ⟨rowMember, rowMatches⟩ := select_sound _ source row selected
  refine ⟨row, selected, ?_⟩
  rcases List.mem_cons.mp rowMember with first | later
  · subst row
    obtain ⟨halt, dispatcher, seedAudit, continuationAudit, haltShape, dispatch, sourceEq⟩ := CheckpointDecoder.parseLocal?_sound parsed
    rw [sourceEq] at rowMatches
    have miss := base_misses_local (compileActions program tree) halt dispatcher view.seedPayload seedAudit view.continuation continuationAudit
    rw [show (baseRow (compileActions program tree)).pattern = basePattern (compileActions program tree) from rfl, miss] at rowMatches
    contradiction
  · rcases tail_member program tree row later with fresh | marked | zero | one
    · obtain ⟨found, foundParse, addressEq⟩ := localRows_sound fresh rowMatches
      have equal := Option.some.inj (foundParse.symm.trans parsed)
      exact equal ▸ addressEq
    · obtain ⟨found, foundParse, addressEq⟩ := localRows_sound marked rowMatches
      have equal := Option.some.inj (foundParse.symm.trans parsed)
      exact equal ▸ addressEq
    · subst row
      obtain ⟨predecessor, audit, sourceEq⟩ := tombstone_sound false source rowMatches
      rw [sourceEq, CheckpointRun.parseLocal?_tombstone_none] at parsed
      contradiction
    · subst row
      obtain ⟨predecessor, audit, sourceEq⟩ := tombstone_sound true source rowMatches
      rw [sourceEq, CheckpointRun.parseLocal?_tombstone_none] at parsed
      contradiction

theorem select_tombstone
    (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (bit : Bool) (predecessor audit : Term)
    (baseMiss : (basePattern (compileActions program tree)).matchesBool (Carrier.tombstone bit predecessor audit) = false) :
    ∃ row, select (rows program tree) (Carrier.tombstone bit predecessor audit) = some row ∧ row.address = [.left, .right] := by
  have member : tombstoneRow bit ∈ rows program tree := by
    apply List.Mem.tail
    apply List.mem_append.mpr
    apply Or.inr
    cases bit
    · exact List.Mem.head _
    · exact List.Mem.tail _ (List.Mem.head _)
  obtain ⟨row, selected⟩ := select_exists_of_match _ _ (tombstoneRow bit) member (tombstone_matches ..)
  obtain ⟨rowMember, matched⟩ := select_sound _ _ row selected
  refine ⟨row, selected, ?_⟩
  rcases List.mem_cons.mp rowMember with first | later
  · subst row
    change (basePattern _).matchesBool _ = true at matched
    rw [baseMiss] at matched
    contradiction
  · rcases tail_member program tree row later with fresh | marked | zero | one
    · rw [localRows_miss fresh (CheckpointRun.parseLocal?_tombstone_none ..)] at matched
      contradiction
    · rw [localRows_miss marked (CheckpointRun.parseLocal?_tombstone_none ..)] at matched
      contradiction
    · exact zero ▸ rfl
    · exact one ▸ rfl

/-- Term-level evaluation of the finite selected-edge family. -/
inductive ReadValue (edges : List EdgeRow) : Term → Bool → Prop where
  | done (source : Term) (missed : select edges source = none) : ReadValue edges source (isLive? source)
  | next (source target : Term) (row : EdgeRow)
      (selected : select edges source = some row) (subterm : source.subterm? row.address = some target)
      {answer : Bool} (inner : ReadValue edges target answer) : ReadValue edges source answer

theorem ReadValue.walks {edges : List EdgeRow} {source : Term} {answer : Bool}
    (value : ReadValue edges source answer) {origin endpoint : Cursor}
    (walks : RootResetEdgeSpine.Walks edges origin endpoint) (atSource : origin.focus = source) :
    isLive? endpoint.focus = answer := by
  induction walks generalizing source answer with
  | done origin missed =>
      cases value with
      | done source stopped => rw [atSource]
      | next source target row selected subterm inner =>
          rw [atSource, selected] at missed
          contradiction
  | next origin after row selected followed rest ih =>
      cases value with
      | done source stopped =>
          rw [atSource, stopped] at selected
          contradiction
      | next source target found foundSelected subterm inner =>
          have equal := Option.some.inj ((atSource ▸ selected).symm.trans foundSelected)
          subst found
          have atTarget := RootResetEdgeFragment.follow_subterm row.address origin after followed
          rw [atSource, subterm] at atTarget
          exact ih inner (Option.some.inj atTarget).symm

theorem ReadValue.local
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {source : Term} {view : CheckpointDecoder.LocalView program} {answer : Bool}
    (parsed : CheckpointDecoder.parseLocal? program tree source = some view)
    (inner : ReadValue (rows program tree) view.accumulator answer) :
    ReadValue (rows program tree) source answer := by
  obtain ⟨row, selected, addressEq⟩ := select_local parsed
  refine .next source view.accumulator row selected ?_ inner
  rw [addressEq]
  exact RootResetCompletedFrontPreservation.localParsed_accumulator_subterm parsed

theorem ReadValue.tombstone
    (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (bit : Bool) (predecessor audit : Term) {answer : Bool}
    (baseMiss : (basePattern (compileActions program tree)).matchesBool (Carrier.tombstone bit predecessor audit) = false)
    (inner : ReadValue (rows program tree) predecessor answer) :
    ReadValue (rows program tree) (Carrier.tombstone bit predecessor audit) answer := by
  obtain ⟨row, selected, addressEq⟩ := select_tombstone program tree bit predecessor audit baseMiss
  refine .next _ predecessor row selected ?_ inner
  rw [addressEq]
  cases predecessor <;> rfl

theorem spine_tombstone_base_miss
    (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    {predecessor : Term} {decoded : List Bool} (path : CellSpine.Decodes predecessor decoded)
    (bit : Bool) (audit : Term) :
    (basePattern (compileActions program tree)).matchesBool (Carrier.tombstone bit predecessor audit) = false := by
  cases path with
  | omega => exact base_misses_tombstone_of_arity _ bit omega audit (by decide)
  | live innerBit inner => exact base_misses_tombstone_live _ bit innerBit _ audit
  | tombstone innerBit innerAudit inner =>
      apply base_misses_tombstone_of_arity
      rw [Carrier.headArity_tombstone]
      decide

theorem append_singleton_nonempty (decoded : List Bool) (bit : Bool) :
    (!(decoded ++ [bit]).isEmpty) = true := by cases decoded <;> rfl

theorem ReadValue.spine
    (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    {source : Term} {decoded : List Bool} (path : CellSpine.Decodes source decoded) :
    ReadValue (rows program tree) source (!decoded.isEmpty) := by
  induction path with
  | omega => exact .done omega (select_omega program tree)
  | live bit inner ih =>
      rw [append_singleton_nonempty]
      simpa only [isLive?_live] using
        (ReadValue.done (.app (live bit) _) (select_live program tree bit _))
  | tombstone bit audit inner ih =>
      exact .tombstone program tree bit _ audit (spine_tombstone_base_miss program tree inner bit audit) ih

theorem ReadValue.path
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term} {decoded : List Bool}
    (admissible : Carrier.Admissible continuation)
    (path : CarrierDecoder.PathDecodes program tree bits continuation source decoded) :
    ReadValue (rows program tree) source (!decoded.isEmpty) := by
  apply CarrierDecoder.PathDecodes.rec
    (program := program) (tree := tree) (bits := bits) (continuation := continuation) (t := path)
    (motive_1 := fun term decoded _ => ReadValue (rows program tree) term (!decoded.isEmpty))
    (motive_2 := fun term decoded _ => ReadValue (rows program tree) term (!decoded.isEmpty))
  · intro queue beta decoded queueComplete
    exact .next _ queue (baseRow (compileActions program tree))
      (select_base program tree continuation queue (word bits) beta) (by cases queue <;> rfl) (ReadValue.spine program tree queueComplete)
  · intro accumulator dispatcher result decoded inner dispatch shell ih
    obtain ⟨route, label, dispatchShape⟩ := dispatch
    cases shell with
    | fresh haltAudit seedAudit continuationAudit =>
      let view : CheckpointDecoder.LocalView program := ⟨.fresh, route, label, accumulator, word bits, continuation⟩
      have shape : CheckpointDecoder.LocalShape program tree view
          (Carrier.activeShell bits continuation (freshHField haltAudit) dispatcher seedAudit continuationAudit) :=
        ⟨freshHField haltAudit, dispatcher, seedAudit, continuationAudit, .fresh haltAudit, dispatchShape, rfl⟩
      exact ReadValue.local (CheckpointDecoder.parseLocal?_complete shape) ih
    | marked leftAudit rightAudit seedAudit continuationAudit =>
      let view : CheckpointDecoder.LocalView program := ⟨.marked, route, label, accumulator, word bits, continuation⟩
      have shape : CheckpointDecoder.LocalShape program tree view
          (Carrier.activeShell bits continuation (Carrier.markedHField leftAudit rightAudit) dispatcher seedAudit continuationAudit) :=
        ⟨Carrier.markedHField leftAudit rightAudit, dispatcher, seedAudit, continuationAudit,
          .marked leftAudit rightAudit, dispatchShape, rfl⟩
      exact ReadValue.local (CheckpointDecoder.parseLocal?_complete shape) ih
  · intro root decoded inner ih
    exact ih
  · intro tail decoded bit inner ih
    rw [append_singleton_nonempty]
    simpa only [isLive?_live] using
      (ReadValue.done (.app (live bit) tail) (select_live program tree bit tail))
  · intro predecessor decoded bit audit inner ih
    exact .tombstone program tree bit predecessor audit (base_misses_tombstone_path admissible inner bit audit) ih

theorem walks_nonempty
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term} {decoded : List Bool}
    (admissible : Carrier.Admissible continuation)
    (path : CarrierDecoder.PathDecodes program tree bits continuation source decoded)
    {origin endpoint : Cursor} (atSource : origin.focus = source)
    (walks : RootResetEdgeSpine.Walks (rows program tree) origin endpoint) :
    isLive? endpoint.focus = !decoded.isEmpty :=
  (ReadValue.path admissible path).walks walks atSource


theorem walks_fresh_admission
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term} {decoded : List Bool}
    {view : CheckpointDecoder.LocalView program}
    (admissible : Carrier.Admissible continuation)
    (parsed : CheckpointDecoder.parseLocal? program tree source = some view)
    (fresh : view.status = .fresh)
    (path : CarrierDecoder.PathDecodes program tree bits continuation view.accumulator decoded)
    {origin endpoint : Cursor} (atAccumulator : origin.focus = view.accumulator)
    (walks : RootResetEdgeSpine.Walks (rows program tree) origin endpoint) :
    isLive? endpoint.focus = (RootResetPersistentRouteA.parseFreshNonempty? program tree source).isSome := by
  have carrier := CheckpointRun.pathDecodes_to_termOnly admissible path
  rw [walks_nonempty admissible path atAccumulator walks]
  rw [← RootResetCarrierImmediateLive.carrierHasLive?_decode carrier]
  exact RootResetCarrierImmediateLive.carrierHasLive?_fresh_admission parsed fresh carrier

theorem all_input_nonempty
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term} {decoded : List Bool}
    (admissible : Carrier.Admissible continuation)
    (path : CarrierDecoder.PathDecodes program tree bits continuation source decoded) :
    ∃ ticks endpoint noMember,
      ticks ≤ RootResetEdgeSpine.coefficient (rows program tree) * source.size ∧
      FiniteController.run (RootResetCarrierNonemptyRows.machine program tree) ticks
        (RootResetCarrierNonemptyRows.initial program tree (Cursor.atRoot source)) =
        ⟨some ⟨ProbeCompiler.Control.answer false, noMember⟩, endpoint⟩ ∧
      RootResetEdgeSpine.Walks (rows program tree) (Cursor.atRoot source) endpoint ∧
      endpoint.erase = source ∧ select (rows program tree) endpoint.focus = none ∧
      isLive? endpoint.focus = !decoded.isEmpty := by
  obtain ⟨ticks, endpoint, noMember, bound, execution, walked, eraseEq, stopped⟩ :=
    RootResetCarrierNonemptyRows.all_input program tree source
  exact ⟨ticks, endpoint, noMember, bound, execution, walked, eraseEq, stopped,
    walks_nonempty admissible path rfl walked⟩


end PureSFormal.Research.RootResetCarrierNonemptyAgreement
