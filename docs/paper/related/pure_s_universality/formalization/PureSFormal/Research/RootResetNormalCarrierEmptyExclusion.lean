import PureSFormal.Research.RootResetOrderedCarrier
import PureSFormal.Research.RootResetEmptyOriginProbe

/-! Normal generated responses have only fresh completed Local edges, and
their first deletion leaves a reachable tombstone. This distinguishes them
from the marked or tombstone-free EMPTY origin without changing normal rows. -/
namespace PureSFormal.Research.RootResetNormalCarrierEmptyExclusion
open PureSFormal.PureS
open RootResetOrderedCarrier RootResetPersistentResponseSelector RootResetResponseCarrierChronology

theorem ordered_reads {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits decoded : List Bool} {continuation source : Term}
    (admissible : Carrier.Admissible continuation)
    (ordered : OrderedCarrier program tree bits continuation source decoded) :
    RootResetEmptyOriginProbe.Reads program tree source (deletedFrontBit? program tree source) := by
  induction ordered with
  | @base queue decoded beta inner =>
      rw [deletedFrontBit?, CheckpointDecoder.parseBase?_mutableBase]
      exact .next _ queue (RootResetCarrierNonemptyRows.baseRow (compileActions program tree))
        (RootResetEmptyOriginProbe.select_base program tree continuation queue (word bits) beta)
        (by cases queue <;> rfl) (RootResetEmptyOriginProbe.Reads.spine program tree inner.decodes)
  | «local» shape fresh inner ih =>
      have parsed := CheckpointDecoder.parseLocal?_complete shape
      rw [deletedFrontBit?, CheckpointRun.parseBase?_none_of_localShape shape, parsed]
      exact .local parsed fresh ih
  | live bit inner ih =>
      rw [RootResetOrderedCarrier.deletedFrontBit?_live]
      exact .live bit ih
  | tombstone bit audit inner ih =>
      rw [deletedFrontBit?, CheckpointRun.parseBase?_tombstone_none_of_headArity_ne_three _ _ _ _
        (inner.empty_headArity admissible rfl), CheckpointRun.parseLocal?_tombstone_none, CanonicalStep.parseCell?_tombstone]
      exact .tombstone program tree bit _ audit
        (RootResetCarrierNonemptyRows.base_misses_tombstone_of_arity _ _ _ _ (inner.empty_headArity admissible rfl))

theorem spine_deleted_of_positive {source : Term} {decoded : List Bool}
    (ordered : OrderedSpine source decoded) {count : Nat}
    (counted : spineTombstoneCount? source = some (count + 1)) :
    ∃ bit, deletedFrontBitInSpine? source = some bit := by
  induction ordered with
  | omega =>
      rw [spineTombstoneCount?, if_pos rfl] at counted
      have impossible : (0 : Nat) = count + 1 := Option.some.inj counted
      exact False.elim (Nat.noConfusion impossible)
  | live bit inner ih =>
      rw [spineTombstoneCount?_live] at counted
      rw [deletedFrontBitInSpine?_live]
      exact ih counted
  | tombstone bit audit inner ih => exact ⟨bit, deletedFrontBitInSpine?_tombstone ..⟩

theorem carrier_deleted_of_positive {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits decoded : List Bool} {continuation source : Term}
    (admissible : Carrier.Admissible continuation)
    (ordered : OrderedCarrier program tree bits continuation source decoded) {count : Nat}
    (counted : carrierTombstoneCount? program tree source = some (count + 1)) :
    ∃ bit, deletedFrontBit? program tree source = some bit := by
  induction ordered with
  | base beta inner =>
      rw [carrierTombstoneCount?, CheckpointDecoder.parseBase?_mutableBase] at counted
      rw [deletedFrontBit?, CheckpointDecoder.parseBase?_mutableBase]
      exact spine_deleted_of_positive inner counted
  | «local» shape fresh inner ih =>
      have noBase := CheckpointRun.parseBase?_none_of_localShape shape
      have parsed := CheckpointDecoder.parseLocal?_complete shape
      rw [carrierTombstoneCount?, noBase, parsed] at counted
      rw [deletedFrontBit?, noBase, parsed]
      exact ih counted
  | live bit inner ih =>
      rw [carrierTombstoneCount?_live] at counted
      rw [RootResetOrderedCarrier.deletedFrontBit?_live]
      exact ih counted
  | tombstone bit audit inner ih =>
      refine ⟨bit, ?_⟩
      rw [deletedFrontBit?, CheckpointRun.parseBase?_tombstone_none_of_headArity_ne_three _ _ _ _
        (inner.empty_headArity admissible rfl), CheckpointRun.parseLocal?_tombstone_none, CanonicalStep.parseCell?_tombstone]

theorem selected_deleted {program : CTS.Program} {layout : ActionDispatcher program}
    {bits : List Bool} {continuation source : Term} {admissible : Carrier.Admissible continuation}
    {registers : SchedulerControl.Registers program} {bit : Bool} {suffix : List Bool}
    {outerContext fullContext innerContext targetContext : Context} {parents : List ParentFrame} {ticks count : Nat}
    (trace : SchedulerCycle.SelectedResponseTrace program layout bits continuation source admissible
      registers bit suffix outerContext fullContext innerContext targetContext parents ticks)
    (normal : NormalInvariant program layout.tree bits continuation source registers.phase (bit :: suffix) count) :
    OrderedCarrier program layout.tree bits continuation (SchedulerCycle.deletedCarrier bit outerContext innerContext) suffix ∧
      deletedFrontBit? program layout.tree (SchedulerCycle.deletedCarrier bit outerContext innerContext) = some bit := by
  obtain ⟨_, _, certificate⟩ := SchedulerAscent.selectedFront_deleteAtPath trace.selected trace.sourceDescent trace.path
  have contracts : source.contractAt? (CanonicalTraversal.contextAddress outerContext) =
      some (SchedulerCycle.deletedCarrier bit outerContext innerContext) := by
    rw [Term.contractAt?, certificate.selected_subterm]
    exact certificate.endpoint_replace
  have preserved := normal.ordered.selected_preserved admissible trace.selected contracts
  exact ⟨preserved.1, preserved.2.1⟩

theorem selected_completed {program : CTS.Program} {layout : ActionDispatcher program}
    {bits : List Bool} {continuation source : Term} {admissible : Carrier.Admissible continuation}
    {registers : SchedulerControl.Registers program} {bit : Bool} {suffix : List Bool}
    {outerContext fullContext innerContext targetContext : Context} {parents : List ParentFrame} {ticks count : Nat}
    (trace : SchedulerCycle.SelectedResponseTrace program layout bits continuation source admissible
      registers bit suffix outerContext fullContext innerContext targetContext parents ticks)
    (normal : NormalInvariant program layout.tree bits continuation source registers.phase (bit :: suffix) count) :
    let deleted := SchedulerCycle.deletedCarrier bit outerContext innerContext
    let completed := LocalResponse.completed bits continuation deleted
      (SchedulerResponse.completedRoute program layout (SchedulerCycle.scannedRegisters registers bit suffix) bit deleted)
    ∃ decoded, OrderedCarrier program layout.tree bits continuation completed decoded ∧
      ∃ foundBit, deletedFrontBit? program layout.tree completed = some foundBit := by
  have preserved := (selectedResponseTrace_preserves trace normal).2.2
  exact ⟨_, preserved.ordered, carrier_deleted_of_positive admissible preserved.ordered preserved.tombstones⟩

theorem first_deleted {program : CTS.Program} {layout : ActionDispatcher program}
    {bit : Bool} {suffix : List Bool} {fuel : Nat}
    {outerContext fullContext innerContext targetContext : Context} {ticks : Nat}
    (trace : SchedulerCycle.FirstResponseTrace program layout bit suffix fuel
      outerContext fullContext innerContext targetContext ticks) :
    let continuation := Dovetail.clockExit (fuel + 1) fuel (environmentCode (compileActions program layout.tree) (bit :: suffix))
    OrderedCarrier program layout.tree (bit :: suffix) continuation (SchedulerCycle.deletedCarrier bit outerContext innerContext) suffix ∧
      deletedFrontBit? program layout.tree (SchedulerCycle.deletedCarrier bit outerContext innerContext) = some bit := by
  let environment := environmentCode (compileActions program layout.tree) (bit :: suffix)
  let continuation := Dovetail.clockExit (fuel + 1) fuel environment
  have ordered : OrderedCarrier program layout.tree (bit :: suffix) continuation (baseCarrier environment continuation) (bit :: suffix) :=
    .base (baseBeta environment continuation) (OrderedSpine.word (bit :: suffix))
  obtain ⟨_, _, certificate⟩ := SchedulerAscent.selectedFront_deleteAtPath trace.selected trace.sourceDescent trace.path
  have contracts : (baseCarrier environment continuation).contractAt? (CanonicalTraversal.contextAddress outerContext) =
      some (SchedulerCycle.deletedCarrier bit outerContext innerContext) := by
    rw [Term.contractAt?, certificate.selected_subterm]
    exact certificate.endpoint_replace
  have preserved := ordered.selected_preserved (Dovetail.clockExit_admissible ..) trace.selected contracts
  exact ⟨preserved.1, preserved.2.1⟩

theorem ordered_negative {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits decoded : List Bool} {continuation source : Term}
    (admissible : Carrier.Admissible continuation)
    (ordered : OrderedCarrier program tree bits continuation source decoded)
    (found : ∃ bit, deletedFrontBit? program tree source = some bit)
    (origin : Cursor) (atSource : origin.focus = source) (boundary : RootResetCompleteCarrierRows.Boundary origin) :
    ∃ ticks state, ticks ≤ RootResetEmptyOriginProbe.coefficient program tree * origin.erase.size ∧
      FiniteController.run (RootResetEmptyOriginProbe.worker program tree).machine ticks
        ((RootResetEmptyOriginProbe.worker program tree).initial origin) = ⟨some state, origin⟩ ∧
      (RootResetEmptyOriginProbe.worker program tree).answer? state = some false := by
  obtain ⟨bit, bitEq⟩ := found
  have reads := ordered_reads admissible ordered
  rw [bitEq] at reads
  exact reads.generated_runs origin atSource boundary

theorem positive_count_negative {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits decoded : List Bool} {continuation source : Term}
    (admissible : Carrier.Admissible continuation)
    (ordered : OrderedCarrier program tree bits continuation source decoded) {count : Nat}
    (counted : carrierTombstoneCount? program tree source = some (count + 1))
    (origin : Cursor) (atSource : origin.focus = source) (boundary : RootResetCompleteCarrierRows.Boundary origin) :
    ∃ ticks state, ticks ≤ RootResetEmptyOriginProbe.coefficient program tree * origin.erase.size ∧
      FiniteController.run (RootResetEmptyOriginProbe.worker program tree).machine ticks
        ((RootResetEmptyOriginProbe.worker program tree).initial origin) = ⟨some state, origin⟩ ∧
      (RootResetEmptyOriginProbe.worker program tree).answer? state = some false :=
  ordered_negative admissible ordered (carrier_deleted_of_positive admissible ordered counted) origin atSource boundary

theorem selected_deleted_runs {program : CTS.Program} {layout : ActionDispatcher program}
    {bits : List Bool} {continuation source : Term} {admissible : Carrier.Admissible continuation}
    {registers : SchedulerControl.Registers program} {bit : Bool} {suffix : List Bool}
    {outerContext fullContext innerContext targetContext : Context} {parents : List ParentFrame} {ticks count : Nat}
    (trace : SchedulerCycle.SelectedResponseTrace program layout bits continuation source admissible
      registers bit suffix outerContext fullContext innerContext targetContext parents ticks)
    (normal : NormalInvariant program layout.tree bits continuation source registers.phase (bit :: suffix) count)
    (origin : Cursor) (atSource : origin.focus = SchedulerCycle.deletedCarrier bit outerContext innerContext)
    (boundary : RootResetCompleteCarrierRows.Boundary origin) :
    ∃ used state, used ≤ RootResetEmptyOriginProbe.coefficient program layout.tree * origin.erase.size ∧
      FiniteController.run (RootResetEmptyOriginProbe.worker program layout.tree).machine used
        ((RootResetEmptyOriginProbe.worker program layout.tree).initial origin) = ⟨some state, origin⟩ ∧
      (RootResetEmptyOriginProbe.worker program layout.tree).answer? state = some false :=
  ordered_negative admissible (selected_deleted trace normal).1 ⟨bit, (selected_deleted trace normal).2⟩ origin atSource boundary

theorem selected_completed_runs {program : CTS.Program} {layout : ActionDispatcher program}
    {bits : List Bool} {continuation source : Term} {admissible : Carrier.Admissible continuation}
    {registers : SchedulerControl.Registers program} {bit : Bool} {suffix : List Bool}
    {outerContext fullContext innerContext targetContext : Context} {parents : List ParentFrame} {ticks count : Nat}
    (trace : SchedulerCycle.SelectedResponseTrace program layout bits continuation source admissible
      registers bit suffix outerContext fullContext innerContext targetContext parents ticks)
    (normal : NormalInvariant program layout.tree bits continuation source registers.phase (bit :: suffix) count)
    (origin : Cursor) (atSource : origin.focus = LocalResponse.completed bits continuation
      (SchedulerCycle.deletedCarrier bit outerContext innerContext)
      (SchedulerResponse.completedRoute program layout (SchedulerCycle.scannedRegisters registers bit suffix) bit
        (SchedulerCycle.deletedCarrier bit outerContext innerContext)))
    (boundary : RootResetCompleteCarrierRows.Boundary origin) :
    ∃ used state, used ≤ RootResetEmptyOriginProbe.coefficient program layout.tree * origin.erase.size ∧
      FiniteController.run (RootResetEmptyOriginProbe.worker program layout.tree).machine used
        ((RootResetEmptyOriginProbe.worker program layout.tree).initial origin) = ⟨some state, origin⟩ ∧
      (RootResetEmptyOriginProbe.worker program layout.tree).answer? state = some false := by
  obtain ⟨decoded, ordered, found⟩ := selected_completed trace normal
  exact ordered_negative admissible ordered found origin atSource boundary

theorem first_completed_runs {program : CTS.Program} {layout : ActionDispatcher program}
    {bit : Bool} {suffix : List Bool} {fuel : Nat}
    {outerContext fullContext innerContext targetContext : Context} {ticks : Nat}
    (trace : SchedulerCycle.FirstResponseTrace program layout bit suffix fuel
      outerContext fullContext innerContext targetContext ticks)
    (origin : Cursor) (atSource : origin.focus = (SchedulerCycle.firstReturnConfiguration program layout bit suffix fuel outerContext innerContext).cursor.focus)
    (boundary : RootResetCompleteCarrierRows.Boundary origin) :
    ∃ used state, used ≤ RootResetEmptyOriginProbe.coefficient program layout.tree * origin.erase.size ∧
      FiniteController.run (RootResetEmptyOriginProbe.worker program layout.tree).machine used
        ((RootResetEmptyOriginProbe.worker program layout.tree).initial origin) = ⟨some state, origin⟩ ∧
      (RootResetEmptyOriginProbe.worker program layout.tree).answer? state = some false := by
  have ordered := (first_deleted trace).1.completedResponse layout (SchedulerCycle.responseRegisters program bit suffix) bit
  have counted := (RootResetResponseCarrierChronology.firstResponseTrace_returnChronology program layout bit suffix fuel trace).2.1
  exact positive_count_negative (Dovetail.clockExit_admissible ..) ordered counted origin atSource boundary

end PureSFormal.Research.RootResetNormalCarrierEmptyExclusion
