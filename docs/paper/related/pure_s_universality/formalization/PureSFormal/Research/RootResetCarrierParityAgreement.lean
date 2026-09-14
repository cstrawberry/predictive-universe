import PureSFormal.Research.RootResetCarrierParityProbe
import PureSFormal.Research.RootResetCarrierOldestLiveAgreement
import PureSFormal.Research.RootResetResponseCarrierChronology

/-! Generated chronology semantics for the single-bit carrier probe. -/
namespace PureSFormal.Research.RootResetCarrierParityAgreement
open PureSFormal.PureS
open FiniteController RootResetCarrierParityProbe RootResetEdgeFragment RootResetCarrierEdgePatterns
open RootResetCompletedLocalPatterns RootResetCarrierNonemptyRows RootResetCarrierNonemptyAgreement
open RootResetPersistentResponseSelector RootResetResponseCarrierChronology

def advance : Nat → Bool → Bool
  | 0, bit => bit
  | n + 1, bit => Bool.xor (advance n bit) true

inductive Value (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Term → Nat → Prop where
  | done (source : Term) (missed : select (edges program tree) source = none) : Value program tree source 0
  | next (source target : Term) (row : EdgeRow) (charge : Bool)
      (selected : select (edges program tree) source = some row) (subterm : source.subterm? row.address = some target)
      (tagged : tag program tree source = charge) {count : Nat} (inner : Value program tree target count) :
      Value program tree source (count + if charge then 1 else 0)

theorem Value.unwind {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {source : Term} {count : Nat} (value : Value program tree source count)
    {origin endpoint : Cursor} (walk : RootResetEdgeSpine.Walks (edges program tree) origin endpoint)
    (atSource : origin.focus = source) (bit : Bool) :
    ∃ ticks, run (RootResetCarrierParityProbe.machine program tree) ticks (RootResetCarrierParityProbe.ascending program tree bit endpoint) =
      RootResetCarrierParityProbe.ascending program tree (advance count bit) origin := by
  induction walk generalizing source count bit with
  | done origin missed =>
      cases value with
      | done source stopped => exact ⟨0, rfl⟩
      | next source target row charge selected subterm tagged inner =>
          rw [atSource, selected] at missed
          contradiction
  | next origin after row selected followed rest ih =>
      cases value with
      | done source stopped => rw [atSource, stopped] at selected; contradiction
      | @next source target found charge foundSelected subterm tagged count inner =>
          have equal : row = found := Option.some.inj ((atSource ▸ selected).symm.trans foundSelected)
          subst found
          have atTarget := follow_subterm row.address origin after followed
          rw [atSource, subterm] at atTarget
          obtain ⟨before, beforeRun⟩ := ih inner (Option.some.inj atTarget).symm bit
          obtain ⟨member, matched⟩ := select_sound _ origin.focus row selected
          have inverse := RootResetCompleteCarrierRows.inverts program tree row member origin after matched followed
          obtain ⟨up, _, upRun⟩ := RootResetCarrierParityProbe.ascending_runs program tree (advance count bit) after
          rw [inverse] at upRun
          obtain ⟨read, _, readRun⟩ := RootResetCarrierParityProbe.reading_runs program tree (advance count bit) origin
          rw [atSource, tagged] at readRun
          refine ⟨before + (up + 1 + (read + 1)), ?_⟩
          rw [run_add, beforeRun, run_add, upRun, readRun]
          cases charge <;> simp only [Bool.false_eq_true, ↓reduceIte, Nat.add_zero, advance, Bool.xor_false]

theorem Value.generated_runs {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {source : Term} {count : Nat} (value : Value program tree source count)
    (origin : Cursor) (atSource : origin.focus = source) (bit : Bool) (boundary : RootResetCompleteCarrierRows.Boundary origin) :
    ∃ ticks, ticks ≤ RootResetCarrierParityProbe.coefficient program tree * origin.erase.size ∧
      run (RootResetCarrierParityProbe.machine program tree) ticks (RootResetCarrierParityProbe.initial program tree bit origin) =
        ⟨some (.done (advance count bit)), origin⟩ := by
  obtain ⟨ticks, result, descended, bounded, actual, down, reads⟩ := RootResetCarrierParityProbe.all_input program tree bit origin boundary
  obtain ⟨downTicks, _, member, downBound, downRun, canonical⟩ := RootResetEdgeSpine.scan_within (edges program tree) (RootResetCompleteCarrierRows.valid program tree) origin
  obtain ⟨downUsed, _, downActual⟩ := RootResetCarrierParityProbe.descending_runs program tree bit origin _ downTicks member downRun
  obtain ⟨reverseTicks, reverseRun⟩ := value.unwind canonical atSource bit
  obtain ⟨up, _, upRun⟩ := RootResetCarrierParityProbe.ascending_runs program tree (advance count bit) origin
  rw [RootResetCompleteCarrierRows.boundary_misses program tree origin boundary] at upRun
  have firstRun : run (RootResetCarrierParityProbe.machine program tree) (downUsed + 1 + reverseTicks)
      (RootResetCarrierParityProbe.initial program tree bit origin) = RootResetCarrierParityProbe.ascending program tree (advance count bit) origin := by
    rw [run_add, downActual]
    exact reverseRun
  have expected : run (RootResetCarrierParityProbe.machine program tree) (downUsed + 1 + reverseTicks + (up + 1))
      (RootResetCarrierParityProbe.initial program tree bit origin) = ⟨some (.done (advance count bit)), origin⟩ := by
    rw [run_add, firstRun]
    exact upRun
  have common := congrArg (run (RootResetCarrierParityProbe.machine program tree) ticks) expected
  rw [RootResetCarrierParityProbe.done_absorbs, ← run_add, Nat.add_comm, run_add, actual,
    RootResetCarrierParityProbe.done_absorbs] at common
  exact ⟨ticks, bounded, actual.trans common⟩

theorem tag_of_member (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (source : Term)
    (row : EdgeRow) (member : row ∈ localRows .fresh program tree ++ localRows .marked program tree ++ [tombstoneRow false, tombstoneRow true])
    (matched : row.pattern.matchesBool source = true) : tag program tree source = true :=
  any_of_member _ source row.pattern (map_member _ member) matched

theorem tag_local {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)} {source : Term}
    {view : CheckpointDecoder.LocalView program} (parsed : CheckpointDecoder.parseLocal? program tree source = some view) : tag program tree source = true := by
  obtain ⟨row, member, matched, _⟩ := localRow_complete parsed
  apply tag_of_member program tree source row _ matched
  apply List.mem_append.mpr
  apply Or.inl
  apply List.mem_append.mpr
  cases status : view.status with
  | fresh => exact Or.inl (status ▸ member)
  | marked => exact Or.inr (status ▸ member)

theorem tag_tombstone (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (bit : Bool) (predecessor audit : Term) :
    tag program tree (Carrier.tombstone bit predecessor audit) = true := by
  apply tag_of_member program tree _ (tombstoneRow bit) _ (tombstone_matches bit predecessor audit)
  apply List.mem_append.mpr
  apply Or.inr
  cases bit with
  | false => exact List.Mem.head _
  | true => exact List.Mem.tail _ (List.Mem.head _)

theorem tag_false_of_all (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (source : Term)
    (missed : ∀ row ∈ localRows .fresh program tree ++ localRows .marked program tree ++ [tombstoneRow false, tombstoneRow true], row.pattern.matchesBool source = false) :
    tag program tree source = false := by
  cases found : tag program tree source with
  | false => rfl
  | true =>
      obtain ⟨pattern, member, matched⟩ := member_of_any (RootResetCarrierParityProbe.patterns program tree) source found
      obtain ⟨row, rowMember, equal⟩ := map_member_inverse _ _ _ member
      subst pattern
      rw [missed row rowMember] at matched
      cases matched

theorem tag_live (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (bit : Bool) (predecessor : Term) :
    tag program tree (.app (live bit) predecessor) = false := by
  apply tag_false_of_all
  intro row member
  rcases tail_member program tree row member with fresh | marked | zero | one
  · exact localRows_miss fresh (CheckpointRun.parseLocal?_live_none ..)
  · exact localRows_miss marked (CheckpointRun.parseLocal?_live_none ..)
  · subst row; cases bit <;> rfl
  · subst row; cases bit <;> rfl

theorem tag_base (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation queue beta : Term) (admissible : Carrier.Admissible continuation) :
    tag program tree (MutableBase.base (compileActions program tree) bits continuation queue beta) = false := by
  have parsed := CheckpointDecoder.parseBase?_mutableBase (compileActions program tree) bits continuation queue beta
  have noCell := RootResetSelectedFrontParserAgreement.parseCell?_none_of_headArity_five_or_six
    (MutableBase.root_headArity (compileActions program tree) bits admissible queue beta)
  have noLocal : CheckpointDecoder.parseLocal? program tree (MutableBase.base (compileActions program tree) bits continuation queue beta) = none := by
    cases found : CheckpointDecoder.parseLocal? program tree (MutableBase.base (compileActions program tree) bits continuation queue beta) with
    | none => rfl
    | some view =>
        have impossible := CheckpointRun.parseBase?_none_of_localShape (CheckpointDecoder.parseLocal?_sound found)
        rw [parsed] at impossible
        cases impossible
  apply tag_false_of_all
  intro row member
  rcases tail_member program tree row member with fresh | marked | zero | one
  · exact localRows_miss fresh noLocal
  · exact localRows_miss marked noLocal
  · subst row
    cases found : (tombstoneRow false).pattern.matchesBool _ with
    | false => rfl
    | true =>
        obtain ⟨predecessor, audit, equal⟩ := tombstone_sound false _ found
        rw [equal, CanonicalStep.parseCell?_tombstone] at noCell
        cases noCell
  · subst row
    cases found : (tombstoneRow true).pattern.matchesBool _ with
    | false => rfl
    | true =>
        obtain ⟨predecessor, audit, equal⟩ := tombstone_sound true _ found
        rw [equal, CanonicalStep.parseCell?_tombstone] at noCell
        cases noCell

theorem Value.spine (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    {source : Term} {decoded : List Bool} (path : CellSpine.Decodes source decoded) :
    ∃ count, spineTombstoneCount? source = some count ∧ Value program tree source count := by
  induction path with
  | omega =>
      refine ⟨0, ?_, .done omega ?_⟩
      · rw [spineTombstoneCount?, if_pos rfl]
      · rw [edges, RootResetCompleteCarrierRows.rows, RootResetCompleteCarrierRows.select_append, select_omega]
        rfl
  | @live tail decoded bit inner ih =>
      obtain ⟨count, counted, value⟩ := ih
      refine ⟨count, ?_, ?_⟩
      · rw [spineTombstoneCount?_live, counted]
      · have next := Value.next (.app (live bit) tail) tail (RootResetCompleteCarrierRows.liveRow bit) false
          (RootResetCompleteCarrierRows.selected_live program tree bit tail) (by cases tail <;> rfl) (tag_live program tree bit tail) value
        simpa only [Bool.false_eq_true, ↓reduceIte, Nat.add_zero] using next
  | tombstone bit audit inner ih =>
      obtain ⟨count, counted, value⟩ := ih
      obtain ⟨row, selected, address⟩ := select_tombstone program tree bit _ audit (spine_tombstone_base_miss program tree inner bit audit)
      refine ⟨count + 1, ?_, ?_⟩
      · rw [spineTombstoneCount?_tombstone, counted]
        rfl
      · exact .next _ _ row true (RootResetCompleteCarrierRows.selected_ordinary program tree _ row selected)
          (by rw [address]; cases inner <;> rfl) (tag_tombstone program tree bit _ audit) value

theorem Value.local_counts {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)} {source : Term}
    {view : CheckpointDecoder.LocalView program} (parsed : CheckpointDecoder.parseLocal? program tree source = some view)
    (locals tombs : Nat) (localCount : carrierLocalCount? program tree view.accumulator = some locals)
    (tombCount : carrierTombstoneCount? program tree view.accumulator = some tombs)
    (inner : Value program tree view.accumulator (locals + tombs)) :
    carrierLocalCount? program tree source = some (locals + 1) ∧
      carrierTombstoneCount? program tree source = some tombs ∧ Value program tree source (locals + 1 + tombs) := by
  have noBase := CheckpointRun.parseBase?_none_of_localShape (CheckpointDecoder.parseLocal?_sound parsed)
  refine ⟨?_, ?_, ?_⟩
  · rw [carrierLocalCount?, noBase]
    dsimp only
    rw [parsed]
    dsimp only
    rw [localCount]
    rfl
  · rw [carrierTombstoneCount?, noBase]
    dsimp only
    rw [parsed]
    exact tombCount
  · obtain ⟨row, selected, address⟩ := select_local parsed
    have next := Value.next source view.accumulator row true
      (RootResetCompleteCarrierRows.selected_ordinary program tree _ row selected)
      (by rw [address]; exact RootResetCompletedFrontPreservation.localParsed_accumulator_subterm parsed) (tag_local parsed) inner
    simpa only [↓reduceIte, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using next

theorem parseBase_none_of_pattern_miss (actions source : Term) (missed : (basePattern actions).matchesBool source = false) :
    CheckpointDecoder.parseBase? actions source = none := by
  cases parsed : CheckpointDecoder.parseBase? actions source with
  | none => rfl
  | some view =>
      rw [CheckpointDecoder.parseBase?_sound parsed, base_matches] at missed
      cases missed

theorem Value.path {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term} {decoded : List Bool}
    (admissible : Carrier.Admissible continuation)
    (path : CarrierDecoder.PathDecodes program tree bits continuation source decoded) :
    ∃ locals tombs, carrierLocalCount? program tree source = some locals ∧
      carrierTombstoneCount? program tree source = some tombs ∧ Value program tree source (locals + tombs) := by
  apply CarrierDecoder.PathDecodes.rec
    (program := program) (tree := tree) (bits := bits) (continuation := continuation) (t := path)
    (motive_1 := fun source decoded _ => ∃ locals tombs, carrierLocalCount? program tree source = some locals ∧
      carrierTombstoneCount? program tree source = some tombs ∧ Value program tree source (locals + tombs))
    (motive_2 := fun source decoded _ => ∃ locals tombs, carrierLocalCount? program tree source = some locals ∧
      carrierTombstoneCount? program tree source = some tombs ∧ Value program tree source (locals + tombs))
  · intro queue beta decoded complete
    obtain ⟨tombs, counted, value⟩ := Value.spine program tree complete
    have parsed := CheckpointDecoder.parseBase?_mutableBase (compileActions program tree) bits continuation queue beta
    refine ⟨0, tombs, ?_, ?_, ?_⟩
    · rw [carrierLocalCount?, parsed]
    · rw [carrierTombstoneCount?, parsed]
      exact counted
    · have next := Value.next (MutableBase.base (compileActions program tree) bits continuation queue beta) queue (baseRow (compileActions program tree)) false
        (RootResetCompleteCarrierRows.selected_ordinary program tree _ _ (select_base program tree continuation queue (word bits) beta))
        (by cases queue <;> rfl) (tag_base program tree bits continuation queue beta admissible) value
      simpa only [Bool.false_eq_true, ↓reduceIte, Nat.add_zero, Nat.zero_add] using next
  · intro accumulator dispatcher result decoded inner dispatch shell ih
    obtain ⟨locals, tombs, localCount, tombCount, value⟩ := ih
    obtain ⟨route, label, dispatchShape⟩ := dispatch
    cases shell with
    | fresh haltAudit seedAudit continuationAudit =>
      let view : CheckpointDecoder.LocalView program := ⟨.fresh, route, label, accumulator, word bits, continuation⟩
      have shape : CheckpointDecoder.LocalShape program tree view
          (Carrier.activeShell bits continuation (freshHField haltAudit) dispatcher seedAudit continuationAudit) :=
        ⟨freshHField haltAudit, dispatcher, seedAudit, continuationAudit, .fresh haltAudit, dispatchShape, rfl⟩
      exact ⟨locals + 1, tombs, Value.local_counts (CheckpointDecoder.parseLocal?_complete shape) locals tombs localCount tombCount value⟩
    | marked leftAudit rightAudit seedAudit continuationAudit =>
      let view : CheckpointDecoder.LocalView program := ⟨.marked, route, label, accumulator, word bits, continuation⟩
      have shape : CheckpointDecoder.LocalShape program tree view
          (Carrier.activeShell bits continuation (Carrier.markedHField leftAudit rightAudit) dispatcher seedAudit continuationAudit) :=
        ⟨Carrier.markedHField leftAudit rightAudit, dispatcher, seedAudit, continuationAudit,
          .marked leftAudit rightAudit, dispatchShape, rfl⟩
      exact ⟨locals + 1, tombs, Value.local_counts (CheckpointDecoder.parseLocal?_complete shape) locals tombs localCount tombCount value⟩
  · intro root decoded inner ih
    exact ih
  · intro tail decoded bit inner ih
    obtain ⟨locals, tombs, localCount, tombCount, value⟩ := ih
    refine ⟨locals, tombs, ?_, ?_, ?_⟩
    · rw [carrierLocalCount?_live, localCount]
    · rw [carrierTombstoneCount?_live, tombCount]
    · have next := Value.next (.app (live bit) tail) tail (RootResetCompleteCarrierRows.liveRow bit) false
        (RootResetCompleteCarrierRows.selected_live program tree bit tail) (by cases tail <;> rfl) (tag_live program tree bit tail) value
      simpa only [Bool.false_eq_true, ↓reduceIte, Nat.add_zero] using next
  · intro predecessor decoded bit audit inner ih
    obtain ⟨locals, tombs, localCount, tombCount, value⟩ := ih
    have miss := base_misses_tombstone_path admissible inner bit audit
    have noBase := parseBase_none_of_pattern_miss _ _ miss
    obtain ⟨row, selected, address⟩ := select_tombstone program tree bit predecessor audit miss
    refine ⟨locals, tombs + 1, ?_, ?_, ?_⟩
    · rw [carrierLocalCount?, noBase]
      dsimp only
      rw [CheckpointRun.parseLocal?_tombstone_none]
      dsimp only
      rw [CanonicalStep.parseCell?_tombstone]
      exact localCount
    · rw [carrierTombstoneCount?, noBase]
      dsimp only
      rw [CheckpointRun.parseLocal?_tombstone_none]
      dsimp only
      rw [CanonicalStep.parseCell?_tombstone]
      dsimp only
      rw [tombCount]
      rfl
    · have next := Value.next (Carrier.tombstone bit predecessor audit) predecessor row true
        (RootResetCompleteCarrierRows.selected_ordinary program tree _ row selected)
        (by rw [address]; cases predecessor <;> rfl) (tag_tombstone program tree bit predecessor audit) value
      simpa only [↓reduceIte, Nat.add_assoc] using next

theorem advance_add (first second : Nat) (bit : Bool) : advance (first + second) bit = advance second (advance first bit) := by
  induction second with
  | zero => rfl
  | succ second ih => rw [Nat.add_succ, advance, ih]; rfl

theorem advance_double (count : Nat) (bit : Bool) : advance (count + count) bit = bit := by
  induction count with
  | zero => rfl
  | succ count ih =>
      have equal : count + 1 + (count + 1) = (count + count) + 1 + 1 := by
        simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
      rw [equal, advance, advance, ih]
      cases bit <;> rfl

theorem advance_offset (count offset : Nat) (bit : Bool) : advance (count + (count + offset)) bit = advance offset bit := by
  rw [← Nat.add_assoc, advance_add, advance_double]

theorem generated_runs {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term} {decoded : List Bool}
    (admissible : Carrier.Admissible continuation) (path : CarrierDecoder.PathDecodes program tree bits continuation source decoded)
    (locals tombs : Nat) (localCount : carrierLocalCount? program tree source = some locals)
    (tombCount : carrierTombstoneCount? program tree source = some tombs)
    (origin : Cursor) (atSource : origin.focus = source) (bit : Bool) (boundary : RootResetCompleteCarrierRows.Boundary origin) :
    ∃ ticks, ticks ≤ RootResetCarrierParityProbe.coefficient program tree * origin.erase.size ∧
      run (RootResetCarrierParityProbe.machine program tree) ticks (RootResetCarrierParityProbe.initial program tree bit origin) =
        ⟨some (.done (advance (locals + tombs) bit)), origin⟩ := by
  obtain ⟨foundLocals, foundTombs, foundLocal, foundTomb, value⟩ := Value.path admissible path
  have sameLocal : foundLocals = locals := Option.some.inj (foundLocal.symm.trans localCount)
  have sameTomb : foundTombs = tombs := Option.some.inj (foundTomb.symm.trans tombCount)
  subst foundLocals
  subst foundTombs
  exact value.generated_runs origin atSource bit boundary

theorem generated_one_excess {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term} {decoded : List Bool}
    (admissible : Carrier.Admissible continuation) (path : CarrierDecoder.PathDecodes program tree bits continuation source decoded)
    (locals : Nat) (localCount : carrierLocalCount? program tree source = some locals)
    (tombCount : carrierTombstoneCount? program tree source = some (locals + 1))
    (origin : Cursor) (atSource : origin.focus = source) (boundary : RootResetCompleteCarrierRows.Boundary origin) :
    ∃ ticks, ticks ≤ RootResetCarrierParityProbe.coefficient program tree * origin.erase.size ∧
      run (RootResetCarrierParityProbe.machine program tree) ticks (RootResetCarrierParityProbe.initial program tree false origin) =
        ⟨some (.done true), origin⟩ := by
  obtain ⟨ticks, bounded, actual⟩ := generated_runs admissible path locals (locals + 1) localCount tombCount origin atSource false boundary
  rw [advance_offset] at actual
  exact ⟨ticks, bounded, actual⟩

theorem generated_two_excess {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term} {decoded : List Bool}
    (admissible : Carrier.Admissible continuation) (path : CarrierDecoder.PathDecodes program tree bits continuation source decoded)
    (locals : Nat) (localCount : carrierLocalCount? program tree source = some locals)
    (tombCount : carrierTombstoneCount? program tree source = some (locals + 2))
    (origin : Cursor) (atSource : origin.focus = source) (boundary : RootResetCompleteCarrierRows.Boundary origin) :
    ∃ ticks, ticks ≤ RootResetCarrierParityProbe.coefficient program tree * origin.erase.size ∧
      run (RootResetCarrierParityProbe.machine program tree) ticks (RootResetCarrierParityProbe.initial program tree false origin) =
        ⟨some (.done false), origin⟩ := by
  obtain ⟨ticks, bounded, actual⟩ := generated_runs admissible path locals (locals + 2) localCount tombCount origin atSource false boundary
  rw [advance_offset] at actual
  exact ⟨ticks, bounded, actual⟩

theorem local_one_excess {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term} {decoded : List Bool} {view : CheckpointDecoder.LocalView program}
    (admissible : Carrier.Admissible continuation)
    (parsed : CheckpointDecoder.parseLocal? program tree source = some view)
    (path : CarrierDecoder.PathDecodes program tree bits continuation view.accumulator decoded)
    (locals : Nat) (localCount : carrierLocalCount? program tree view.accumulator = some locals)
    (tombCount : carrierTombstoneCount? program tree view.accumulator = some (locals + 1))
    (origin : Cursor) (atSource : origin.focus = source) (boundary : RootResetCompleteCarrierRows.Boundary origin) :
    ∃ ticks, ticks ≤ RootResetCarrierParityProbe.coefficient program tree * origin.erase.size ∧
      run (RootResetCarrierParityProbe.machine program tree) ticks (RootResetCarrierParityProbe.initial program tree true origin) =
        ⟨some (.done true), origin⟩ := by
  obtain ⟨foundLocals, foundTombs, foundLocal, foundTomb, value⟩ := Value.path admissible path
  have sameLocal : foundLocals = locals := Option.some.inj (foundLocal.symm.trans localCount)
  have sameTomb : foundTombs = locals + 1 := Option.some.inj (foundTomb.symm.trans tombCount)
  subst foundLocals
  subst foundTombs
  have completed := (Value.local_counts parsed locals (locals + 1) localCount tombCount value).2.2
  obtain ⟨ticks, bounded, execution⟩ := completed.generated_runs origin atSource true boundary
  rw [advance_double] at execution
  exact ⟨ticks, bounded, execution⟩

theorem local_two_excess {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term} {decoded : List Bool} {view : CheckpointDecoder.LocalView program}
    (admissible : Carrier.Admissible continuation)
    (parsed : CheckpointDecoder.parseLocal? program tree source = some view)
    (path : CarrierDecoder.PathDecodes program tree bits continuation view.accumulator decoded)
    (locals : Nat) (localCount : carrierLocalCount? program tree view.accumulator = some locals)
    (tombCount : carrierTombstoneCount? program tree view.accumulator = some (locals + 2))
    (origin : Cursor) (atSource : origin.focus = source) (boundary : RootResetCompleteCarrierRows.Boundary origin) :
    ∃ ticks, ticks ≤ RootResetCarrierParityProbe.coefficient program tree * origin.erase.size ∧
      run (RootResetCarrierParityProbe.machine program tree) ticks (RootResetCarrierParityProbe.initial program tree true origin) =
        ⟨some (.done false), origin⟩ := by
  obtain ⟨foundLocals, foundTombs, foundLocal, foundTomb, value⟩ := Value.path admissible path
  have sameLocal : foundLocals = locals := Option.some.inj (foundLocal.symm.trans localCount)
  have sameTomb : foundTombs = locals + 2 := Option.some.inj (foundTomb.symm.trans tombCount)
  subst foundLocals
  subst foundTombs
  have completed := (Value.local_counts parsed locals (locals + 2) localCount tombCount value).2.2
  obtain ⟨ticks, bounded, execution⟩ := completed.generated_runs origin atSource true boundary
  have equal : locals + 2 = (locals + 1) + 1 := rfl
  rw [equal, advance_offset] at execution
  exact ⟨ticks, bounded, execution⟩

end PureSFormal.Research.RootResetCarrierParityAgreement
