import PureSFormal.Research.RootResetCompletedFrontPreservation
import PureSFormal.Research.RootResetFrontNonemptyAgreement

/-!
# Generated normal carrier order and recursive response labels

Old tombstones occur only over empty predecessors, and completed Locals
retain fresh status throughout a normal job. Canonical front deletion
preserves this order, records the newest deleted bit, and preserves phase.
Appending and completing the response preserve the invariant while advancing
counts and phase. The generic SelectedResponseTrace theorem consequently
discharges both normal-response control-label premises at every iteration.
-/

namespace PureSFormal.Research.RootResetOrderedCarrier
open PureSFormal.PureS
open RootResetPersistentResponseSelector
open RootResetResponseCarrierChronology
open RootResetResponseBoundaryStages

/-- Every historical tombstone is below all remaining live queue cells. -/
inductive OrderedSpine : Term → List Bool → Prop where
  | omega : OrderedSpine omega []
  | live {predecessor : Term} {decoded : List Bool} (bit : Bool)
      (inner : OrderedSpine predecessor decoded) :
      OrderedSpine (.app (PureSFormal.PureS.live bit) predecessor) (decoded ++ [bit])
  | tombstone {predecessor : Term} (bit : Bool) (audit : Term)
      (inner : OrderedSpine predecessor []) :
      OrderedSpine (Carrier.tombstone bit predecessor audit) []

/-- Completed Local and Base edges preserve the chronological queue order. -/
inductive OrderedCarrier (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (bits : List Bool) (continuation : Term) :
    Term → List Bool → Prop where
  | base {queue : Term} {decoded : List Bool} (beta : Term)
      (inner : OrderedSpine queue decoded) :
      OrderedCarrier program tree bits continuation
        (MutableBase.base (compileActions program tree) bits continuation queue beta) decoded
  | «local» {term : Term} {view : CheckpointDecoder.LocalView program} {decoded : List Bool}
      (shape : CheckpointDecoder.LocalShape program tree view term)
      (fresh : view.status = .fresh)
      (inner : OrderedCarrier program tree bits continuation view.accumulator decoded) :
      OrderedCarrier program tree bits continuation term decoded
  | live {predecessor : Term} {decoded : List Bool} (bit : Bool)
      (inner : OrderedCarrier program tree bits continuation predecessor decoded) :
      OrderedCarrier program tree bits continuation (.app (PureSFormal.PureS.live bit) predecessor) (decoded ++ [bit])
  | tombstone {predecessor : Term} (bit : Bool) (audit : Term)
      (inner : OrderedCarrier program tree bits continuation predecessor []) :
      OrderedCarrier program tree bits continuation (Carrier.tombstone bit predecessor audit) []

theorem OrderedSpine.decodes {term : Term} {decoded : List Bool}
    (ordered : OrderedSpine term decoded) : CellSpine.Decodes term decoded := by
  induction ordered with
  | omega => exact .omega
  | live bit inner ih => exact .live bit ih
  | tombstone bit audit inner ih => exact .tombstone bit audit ih

theorem OrderedCarrier.empty_headArity
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation term : Term} {decoded : List Bool}
    (admissible : Carrier.Admissible continuation)
    (ordered : OrderedCarrier program tree bits continuation term decoded)
    (empty : decoded = []) : term.headArity ≠ 3 := by
  cases ordered with
  | @base queue _ beta inner =>
      rcases (MutableBase.root_headArity (compileActions program tree) bits admissible queue beta) with five | six
      · rw [five]; decide
      · rw [six]; decide
  | «local» shape fresh inner =>
      rcases (CheckpointDecoder.parseLocal?_headArity (CheckpointDecoder.parseLocal?_complete shape)) with five | six
      · rw [five]; decide
      · rw [six]; decide
  | live bit inner => simp at empty
  | tombstone bit audit inner => rw [Carrier.headArity_tombstone]; decide

theorem OrderedCarrier.decodes
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation term : Term} {decoded : List Bool}
    (admissible : Carrier.Admissible continuation)
    (ordered : OrderedCarrier program tree bits continuation term decoded) :
    CheckpointDecoder.CarrierDecodes program tree term decoded := by
  induction ordered with
  | base beta inner => exact .base _ (CheckpointDecoder.parseBase?_mutableBase ..) inner.decodes
  | «local» shape fresh inner ih =>
      exact .local _ (CheckpointRun.parseBase?_none_of_localShape shape)
        (CheckpointDecoder.parseLocal?_complete shape) ih
  | live bit inner ih =>
      exact .live bit (CheckpointRun.parseBase?_live_none ..)
        (CheckpointRun.parseLocal?_live_none ..) (CanonicalStep.parseCell?_live ..) ih
  | tombstone bit audit inner ih =>
      exact .tombstone bit
        (CheckpointRun.parseBase?_tombstone_none_of_headArity_ne_three _ _ _ _ (inner.empty_headArity admissible rfl))
        (CheckpointRun.parseLocal?_tombstone_none ..) (CanonicalStep.parseCell?_tombstone ..) ih

theorem OrderedSpine.empty_front {term : Term} (ordered : OrderedSpine term []) :
    spineFirstLiveAddress? term = none := by
  have h := RootResetFrontNonemptyAgreement.spine_nonempty ordered.decodes
  cases parsed : spineFirstLiveAddress? term with
  | none => rfl
  | some address => rw [parsed] at h; cases h

theorem OrderedCarrier.empty_front
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation term : Term}
    (admissible : Carrier.Admissible continuation)
    (ordered : OrderedCarrier program tree bits continuation term []) :
    carrierFirstLiveAddress? program tree term = none := by
  have h := RootResetFrontNonemptyAgreement.carrier_nonempty (ordered.decodes admissible)
  cases parsed : carrierFirstLiveAddress? program tree term with
  | none => rfl
  | some address => rw [parsed] at h; cases h

theorem OrderedSpine.delete
    {term : Term} {decoded : List Bool} (ordered : OrderedSpine term decoded)
    (bit : Bool) (suffix : List Bool) (wordEq : decoded = bit :: suffix) :
    ∃ target address predecessor,
      spineFirstLiveAddress? term = some address ∧
      term.subterm? address = some (.app (PureSFormal.PureS.live bit) predecessor) ∧
      term.contractAt? address = some target ∧
      OrderedSpine target suffix ∧ deletedFrontBitInSpine? target = some bit := by
  induction ordered generalizing bit suffix with
  | omega => cases wordEq
  | @live predecessor decoded outerBit inner ih =>
      cases decoded with
      | nil =>
          have equal := List.cons.inj wordEq
          cases equal.1
          have suffixEq : suffix = [] := equal.2.symm
          subst suffix
          refine ⟨Carrier.tombstone outerBit predecessor predecessor, [], predecessor, ?_, rfl, rfl,
            .tombstone outerBit predecessor inner, deletedFrontBitInSpine?_tombstone ..⟩
          rw [spineFirstLiveAddress?, if_neg (Carrier.omega_ne_liveCell _ _).symm,
            CanonicalStep.parseCell?_live]
          dsimp only
          rw [inner.empty_front]
      | cons first rest =>
          have equal := List.cons.inj wordEq
          cases equal.1
          cases equal.2
          obtain ⟨target, address, found, front, subterm, contracts, targetOrdered, targetBit⟩ := ih bit rest rfl
          refine ⟨.app (PureSFormal.PureS.live outerBit) target, .right :: address, found, ?_, subterm, ?_, .live outerBit targetOrdered, ?_⟩
          · rw [spineFirstLiveAddress?, if_neg (Carrier.omega_ne_liveCell _ _).symm,
              CanonicalStep.parseCell?_live]
            dsimp only
            rw [front]
          · rw [RootResetEulerWalker.contractAt?_app_right, contracts]
            rfl
          · rw [deletedFrontBitInSpine?_live, targetBit]
  | tombstone bit audit inner ih => cases wordEq

theorem deletedFrontBit?_live
    (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (bit : Bool) (predecessor : Term) :
    deletedFrontBit? program tree (.app (PureSFormal.PureS.live bit) predecessor) = deletedFrontBit? program tree predecessor := by
  rw [deletedFrontBit?, CheckpointRun.parseBase?_live_none]
  dsimp only
  rw [CheckpointRun.parseLocal?_live_none]
  dsimp only
  rw [CanonicalStep.parseCell?_live]

theorem carrierPhase?_live
    (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (bit : Bool) (predecessor : Term) :
    carrierPhase? program tree (.app (PureSFormal.PureS.live bit) predecessor) = carrierPhase? program tree predecessor := by
  rw [carrierPhase?, CheckpointRun.parseBase?_live_none]
  dsimp only
  rw [CheckpointRun.parseLocal?_live_none]
  dsimp only
  rw [CanonicalStep.parseCell?_live]

theorem OrderedCarrier.delete
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation term : Term} {decoded : List Bool}
    (admissible : Carrier.Admissible continuation)
    (ordered : OrderedCarrier program tree bits continuation term decoded)
    (bit : Bool) (suffix : List Bool) (wordEq : decoded = bit :: suffix) :
    ∃ target address predecessor,
      carrierFirstLiveAddress? program tree term = some address ∧
      term.subterm? address = some (.app (PureSFormal.PureS.live bit) predecessor) ∧
      term.contractAt? address = some target ∧
      OrderedCarrier program tree bits continuation target suffix ∧
      deletedFrontBit? program tree target = some bit ∧
      carrierPhase? program tree target = carrierPhase? program tree term := by
  induction ordered generalizing bit suffix with
  | @base queue decoded beta inner =>
      obtain ⟨target, address, predecessor, front, subterm, contracts, targetOrdered, targetBit⟩ := inner.delete bit suffix wordEq
      refine ⟨MutableBase.base (compileActions program tree) bits continuation target beta,
        baseQueueAddress ++ address, predecessor, ?_, subterm, ?_, .base beta targetOrdered, ?_, ?_⟩
      · rw [carrierFirstLiveAddress?, CheckpointDecoder.parseBase?_mutableBase]
        dsimp only
        rw [front]
        rfl
      · exact RootResetWholeStageClassifier.contractAt?_plug_append
          (MutableBase.queueContext (compileActions program tree) bits continuation beta) address contracts
      · rw [deletedFrontBit?, CheckpointDecoder.parseBase?_mutableBase]
        exact targetBit
      · rw [carrierPhase?, CheckpointDecoder.parseBase?_mutableBase,
          carrierPhase?, CheckpointDecoder.parseBase?_mutableBase]
  | @«local» term view decoded shape fresh inner ih =>
      obtain ⟨target, address, predecessor, front, subterm, contracts, targetOrdered, targetBit, targetPhase⟩ := ih bit suffix wordEq
      obtain ⟨wholeTarget, wholeContracts, wholeShape⟩ := localShape_contractAccumulator shape contracts
      have sourceParsed := CheckpointDecoder.parseLocal?_complete shape
      have targetParsed := CheckpointDecoder.parseLocal?_complete wholeShape
      have sourceNotBase := CheckpointRun.parseBase?_none_of_localShape shape
      have targetNotBase := CheckpointRun.parseBase?_none_of_localShape wholeShape
      refine ⟨wholeTarget, localAccumulatorAddress view ++ address, predecessor,
        ?_, ?_, wholeContracts, .local wholeShape fresh targetOrdered, ?_, ?_⟩
      · rw [carrierFirstLiveAddress?, sourceNotBase]
        dsimp only
        rw [sourceParsed]
        dsimp only
        rw [front]
        rfl
      · rw [CarrierDecoder.subterm?_append, RootResetCompletedFrontPreservation.localShape_accumulator_subterm shape]
        exact subterm
      · rw [deletedFrontBit?, targetNotBase]
        dsimp only
        rw [targetParsed]
        exact targetBit
      · rw [carrierPhase?, targetNotBase]
        dsimp only
        rw [targetParsed, carrierPhase?, sourceNotBase]
        dsimp only
        rw [sourceParsed]
        rfl
  | @live predecessor decoded outerBit inner ih =>
      cases decoded with
      | nil =>
          have equal := List.cons.inj wordEq
          cases equal.1
          have suffixEq : suffix = [] := equal.2.symm
          subst suffix
          have notBase := CheckpointRun.parseBase?_tombstone_none_of_headArity_ne_three
            (compileActions program tree) outerBit predecessor predecessor (inner.empty_headArity admissible rfl)
          refine ⟨Carrier.tombstone outerBit predecessor predecessor, [], predecessor, ?_, rfl, rfl,
            .tombstone outerBit predecessor inner, ?_, ?_⟩
          · rw [carrierFirstLiveAddress?, CheckpointRun.parseBase?_live_none]
            dsimp only
            rw [CheckpointRun.parseLocal?_live_none]
            dsimp only
            rw [CanonicalStep.parseCell?_live]
            dsimp only
            rw [inner.empty_front admissible]
          · rw [deletedFrontBit?, notBase]
            dsimp only
            rw [CheckpointRun.parseLocal?_tombstone_none]
            dsimp only
            rw [CanonicalStep.parseCell?_tombstone]
          · rw [carrierPhase?, notBase]
            dsimp only
            rw [CheckpointRun.parseLocal?_tombstone_none]
            dsimp only
            rw [CanonicalStep.parseCell?_tombstone]
            exact (carrierPhase?_live program tree outerBit predecessor).symm
      | cons first rest =>
          have equal := List.cons.inj wordEq
          cases equal.1
          cases equal.2
          obtain ⟨target, address, found, front, subterm, contracts, targetOrdered, targetBit, targetPhase⟩ := ih bit rest rfl
          refine ⟨.app (PureSFormal.PureS.live outerBit) target, .right :: address, found, ?_, subterm, ?_, .live outerBit targetOrdered, ?_, ?_⟩
          · rw [carrierFirstLiveAddress?, CheckpointRun.parseBase?_live_none]
            dsimp only
            rw [CheckpointRun.parseLocal?_live_none]
            dsimp only
            rw [CanonicalStep.parseCell?_live]
            dsimp only
            rw [front]
          · rw [RootResetEulerWalker.contractAt?_app_right, contracts]
            rfl
          · rw [deletedFrontBit?_live, targetBit]
          · rw [carrierPhase?_live, carrierPhase?_live, targetPhase]
  | tombstone bit audit inner ih => cases wordEq


theorem OrderedCarrier.fresh
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation term : Term} {decoded : List Bool}
    (ordered : OrderedCarrier program tree bits continuation term decoded)
    {view : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program tree term = some view) : view.status = .fresh := by
  cases ordered with
  | base beta inner =>
      have rejected := CheckpointRun.parseBase?_none_of_localShape (CheckpointDecoder.parseLocal?_sound parsed)
      rw [CheckpointDecoder.parseBase?_mutableBase] at rejected
      contradiction
  | «local» shape fresh inner =>
      have equal := Option.some.inj ((CheckpointDecoder.parseLocal?_complete shape).symm.trans parsed)
      cases equal
      exact fresh
  | live bit inner => rw [CheckpointRun.parseLocal?_live_none] at parsed; contradiction
  | tombstone bit audit inner => rw [CheckpointRun.parseLocal?_tombstone_none] at parsed; contradiction

theorem OrderedSpine.append {term : Term} {decoded : List Bool}
    (ordered : OrderedSpine term decoded) (added : List Bool) :
    OrderedSpine (appenderAccumulator added term) (decoded ++ added) := by
  induction added generalizing term decoded with
  | nil => simpa only [appenderAccumulator_nil, List.append_nil] using ordered
  | cons bit rest ih =>
      rw [appenderAccumulator_cons]
      simpa only [List.append_assoc, List.singleton_append] using! ih (.live bit ordered)

theorem OrderedSpine.word (bits : List Bool) : OrderedSpine (PureSFormal.PureS.word bits) bits := by
  simpa only [List.nil_append] using! (OrderedSpine.omega.append bits)

theorem OrderedCarrier.append
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation term : Term} {decoded : List Bool}
    (ordered : OrderedCarrier program tree bits continuation term decoded) (added : List Bool) :
    OrderedCarrier program tree bits continuation (appenderAccumulator added term) (decoded ++ added) := by
  induction added generalizing term decoded with
  | nil => simpa only [appenderAccumulator_nil, List.append_nil] using ordered
  | cons bit rest ih =>
      rw [appenderAccumulator_cons]
      simpa only [List.append_assoc, List.singleton_append] using! ih (.live bit ordered)

theorem OrderedCarrier.actionAccumulator
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation term : Term} {decoded : List Bool}
    (ordered : OrderedCarrier program tree bits continuation term decoded) (label : ActionLabel program) :
    OrderedCarrier program tree bits continuation (PureSFormal.PureS.actionAccumulator program label term)
      (ActionDecode.outputData program label decoded) := by
  rcases label with ⟨phase, bit⟩
  cases bit with
  | false => exact ordered
  | true => exact ordered.append (program.appendant phase)

theorem OrderedCarrier.completedResponse
    {program : CTS.Program} (dispatcher : ActionDispatcher program)
    {bits : List Bool} {continuation term : Term} {decoded : List Bool}
    (ordered : OrderedCarrier program dispatcher.tree bits continuation term decoded)
    (registers : SchedulerControl.Registers program) (bit : Bool) :
    OrderedCarrier program dispatcher.tree bits continuation
      (LocalResponse.completed bits continuation term
        (SchedulerResponse.completedRoute program dispatcher registers bit term))
      (ActionDecode.outputData program (registers.phase, bit) decoded) := by
  exact .local (CheckpointDecoder.localShape_completed bits
    (SchedulerResponse.completedRoute_snapshotDispatch program dispatcher registers bit term)) rfl
    (ordered.actionAccumulator (registers.phase, bit))

theorem OrderedCarrier.selected_preserved
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source target : Term}
    {bit : Bool} {suffix : List Bool} {outerContext : Context}
    (admissible : Carrier.Admissible continuation)
    (ordered : OrderedCarrier program tree bits continuation source (bit :: suffix))
    (selected : CanonicalTraversal.SelectedFront program tree bits continuation source bit suffix outerContext)
    (contracts : source.contractAt? (CanonicalTraversal.contextAddress outerContext) = some target) :
    OrderedCarrier program tree bits continuation target suffix ∧
      deletedFrontBit? program tree target = some bit ∧
      carrierPhase? program tree target = carrierPhase? program tree source := by
  obtain ⟨foundTarget, address, predecessor, front, subterm, foundContracts, targetOrdered, targetBit, targetPhase⟩ :=
    ordered.delete admissible bit suffix rfl
  have addressEq := Option.some.inj (front.symm.trans
    (RootResetGeneratedFrontParserAgreement.first_eq_of_selected admissible selected))
  subst address
  have targetEq := Option.some.inj (foundContracts.symm.trans contracts)
  cases targetEq
  exact ⟨targetOrdered, targetBit, targetPhase⟩

theorem OrderedCarrier.responseBit_eq_deleted
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation term : Term} {decoded : List Bool}
    (ordered : OrderedCarrier program tree bits continuation term decoded)
    (count : Nat)
    (locals : carrierLocalCount? program tree term = some count)
    (tombs : carrierTombstoneCount? program tree term = some (count + 1)) :
    carrierResponseBit? program tree term = deletedFrontBit? program tree term := by
  have unequal : count ≠ count + 1 := Nat.ne_of_lt (Nat.lt_succ_self count)
  cases parsed : CheckpointDecoder.parseLocal? program tree term with
  | none =>
      simp only [carrierResponseBit?, parsed, locals, tombs]
      cases decodedEq : CheckpointDecoder.decodeCarrier? program tree term with
      | none => rfl
      | some data => cases data <;> simp only [if_neg unequal]
  | some view =>
      simp only [carrierResponseBit?, parsed, ordered.fresh parsed, locals, tombs]
      cases decodedEq : CheckpointDecoder.decodeCarrier? program tree term with
      | none => rfl
      | some data => cases data <;> simp only [if_neg unequal]


/-- The normal response invariant carries executable counts and labels too. -/
structure NormalInvariant (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation term : Term) (phase : CTS.Phase program) (decoded : List Bool) (count : Nat) : Prop where
  ordered : OrderedCarrier program tree bits continuation term decoded
  locals : carrierLocalCount? program tree term = some count
  tombstones : carrierTombstoneCount? program tree term = some count
  phase : carrierPhase? program tree term = some phase

theorem NormalInvariant.initialBase
    (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (bits : List Bool) (continuation beta : Term) :
    NormalInvariant program tree bits continuation
      (MutableBase.base (compileActions program tree) bits continuation (word bits) beta)
      (CTS.zeroPhase program) bits 0 := by
  refine ⟨.base beta (OrderedSpine.word bits), ?_, ?_, ?_⟩
  · rw [carrierLocalCount?, CheckpointDecoder.parseBase?_mutableBase]
  · rw [carrierTombstoneCount?, CheckpointDecoder.parseBase?_mutableBase]
    change spineTombstoneCount? (appenderAccumulator bits omega) = some 0
    rw [spineTombstoneCount?_appenderAccumulator, spineTombstoneCount?, if_pos rfl]
  · rw [carrierPhase?, CheckpointDecoder.parseBase?_mutableBase]

theorem selectedResponseTrace_preserves
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {seedBits : List Bool} {continuation source : Term}
    {admissible : Carrier.Admissible continuation}
    {registers : SchedulerControl.Registers program} {bit : Bool} {suffix : List Bool}
    {outerContext fullContext innerContext targetContext : Context}
    {parents : List ParentFrame} {ticks count : Nat}
    (trace : SchedulerCycle.SelectedResponseTrace program dispatcher seedBits continuation source
      admissible registers bit suffix outerContext fullContext innerContext targetContext parents ticks)
    (invariant : NormalInvariant program dispatcher.tree seedBits continuation source registers.phase (bit :: suffix) count) :
    let deleted := SchedulerCycle.deletedCarrier bit outerContext innerContext
    let completed := LocalResponse.completed seedBits continuation deleted
      (SchedulerResponse.completedRoute program dispatcher
        (SchedulerCycle.scannedRegisters registers bit suffix) bit deleted)
    carrierPhase? program dispatcher.tree deleted = some registers.phase ∧
      carrierResponseBit? program dispatcher.tree deleted = some bit ∧
      NormalInvariant program dispatcher.tree seedBits continuation completed
        (CTS.nextPhase program registers.phase)
        ((CTS.absorbingStep program ⟨registers.phase, bit :: suffix⟩).data) (count + 1) := by
  dsimp only
  obtain ⟨_, _, certificate⟩ := SchedulerAscent.selectedFront_deleteAtPath trace.selected trace.sourceDescent trace.path
  have contracts : source.contractAt? (CanonicalTraversal.contextAddress outerContext) =
      some (SchedulerCycle.deletedCarrier bit outerContext innerContext) := by
    rw [Term.contractAt?, certificate.selected_subterm]
    exact certificate.endpoint_replace
  obtain ⟨targetOrdered, targetBit, targetPhase⟩ := invariant.ordered.selected_preserved admissible trace.selected contracts
  have counts := RootResetCarrierChronologyPreservation.selectedResponseTrace_chronology_preserved trace count
    invariant.locals invariant.tombstones
  have responseBit := targetOrdered.responseBit_eq_deleted count counts.1 counts.2.1
  have phaseEq : (SchedulerCycle.scannedRegisters registers bit suffix).phase = registers.phase := by
    rw [SchedulerCycle.scannedRegisters, SchedulerCycle.scanRegisters_phase]
    unfold SchedulerControl.Registers.observeLive
    split <;> rfl
  refine ⟨targetPhase.trans invariant.phase, responseBit.trans targetBit, ?_, counts.2.2.1, counts.2.2.2, ?_⟩
  · have completedOrdered := targetOrdered.completedResponse dispatcher (SchedulerCycle.scannedRegisters registers bit suffix) bit
    rw [ActionDecode.outputData_eq_ordinaryStep_data, phaseEq] at completedOrdered
    exact completedOrdered
  · have completedPhase := (completedResponse_chronology program dispatcher
      (SchedulerCycle.scannedRegisters registers bit suffix) bit seedBits continuation
      (SchedulerCycle.deletedCarrier bit outerContext innerContext)).2.2
    rw [phaseEq] at completedPhase
    exact completedPhase


end PureSFormal.Research.RootResetOrderedCarrier
