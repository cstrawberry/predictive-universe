import PureSFormal.Research.RootResetFirstResponseSelectorChain

/-!
# Chronology and control labels of generated response carriers

The first selected C4 changes exactly the innermost live cell of the literal
seed word. Its resulting Base has no completed Local and exactly one
tombstone. The response selector consequently recovers phase zero and the
deleted input bit from that carrier, including when the remaining queue is
empty. The final theorem applies these equations to the carrier named by
the scheduler's construction-generated first-response trace.
-/

namespace PureSFormal.Research.RootResetResponseCarrierChronology

open PureSFormal.PureS
open RootResetPersistentResponseSelector

/-- Wrap a parsed front in the same rear cells used by the word encoder. -/
def wrapFront (suffix : List Bool) (front : CellDeletion.Front) :
    CellDeletion.Front :=
  suffix.foldl (fun before bit => before.underLive bit) front

theorem wrapFront_endpoint (suffix : List Bool) (front : CellDeletion.Front) :
    (wrapFront suffix front).endpoint =
      appenderAccumulator suffix front.endpoint := by
  induction suffix generalizing front with
  | nil => rfl
  | cons bit rest ih =>
      exact ih (front.underLive bit)

theorem findFront?_appenderAccumulator
    (suffix : List Bool) {start : Term} {front : CellDeletion.Front}
    (parsed : CellDeletion.findFront? start = some front) :
    CellDeletion.findFront? (appenderAccumulator suffix start) =
      some (wrapFront suffix front) := by
  induction suffix generalizing start front with
  | nil => exact parsed
  | cons bit rest ih =>
      change CellDeletion.findFront?
          (appenderAccumulator rest (.app (live bit) start)) = _
      apply ih
      rw [CellDeletion.findFront?_live, parsed]
      rfl

theorem findFront?_word_cons (bit : Bool) (suffix : List Bool) :
    CellDeletion.findFront? (word (bit :: suffix)) =
      some (wrapFront suffix (CellDeletion.Front.here bit omega)) := by
  apply findFront?_appenderAccumulator suffix
  rw [CellDeletion.findFront?_live, CellDeletion.findFront?_omega]
  rfl

/-- Every accepted seed-front view has the literal one-tombstone endpoint. -/
theorem seedFront_endpoint
    (bit : Bool) (suffix : List Bool)
    {seed : RootResetPersistentFuelCarrier.SeedFront}
    (valid : seed.Valid (word (bit :: suffix))) :
    seed.front.endpoint =
      appenderAccumulator suffix (Carrier.tombstone bit omega omega) := by
  have frontEq := Option.some.inj
    (valid.found.symm.trans (findFront?_word_cons bit suffix))
  rw [frontEq, wrapFront_endpoint]
  rfl

theorem deletedFrontBitInSpine?_live (bit : Bool) (predecessor : Term) :
    deletedFrontBitInSpine? (.app (live bit) predecessor) =
      deletedFrontBitInSpine? predecessor := by
  rw [deletedFrontBitInSpine?, CanonicalStep.parseCell?_live]

theorem deletedFrontBitInSpine?_tombstone
    (bit : Bool) (predecessor audit : Term) :
    deletedFrontBitInSpine? (Carrier.tombstone bit predecessor audit) =
      some bit := by
  rw [deletedFrontBitInSpine?, CanonicalStep.parseCell?_tombstone]

theorem spineTombstoneCount?_live (bit : Bool) (predecessor : Term) :
    spineTombstoneCount? (.app (live bit) predecessor) =
      spineTombstoneCount? predecessor := by
  rw [spineTombstoneCount?,
    if_neg (Carrier.omega_ne_liveCell bit predecessor).symm,
    CanonicalStep.parseCell?_live]

theorem spineTombstoneCount?_tombstone
    (bit : Bool) (predecessor audit : Term) :
    spineTombstoneCount? (Carrier.tombstone bit predecessor audit) =
      (spineTombstoneCount? predecessor).map Nat.succ := by
  rw [spineTombstoneCount?,
    if_neg (Carrier.omega_ne_tombstone bit predecessor audit).symm,
    CanonicalStep.parseCell?_tombstone]

theorem deletedFrontBitInSpine?_appenderAccumulator
    (suffix : List Bool) (start : Term) :
    deletedFrontBitInSpine? (appenderAccumulator suffix start) =
      deletedFrontBitInSpine? start := by
  induction suffix generalizing start with
  | nil => rfl
  | cons bit rest ih =>
      rw [appenderAccumulator_cons, ih]
      exact deletedFrontBitInSpine?_live bit start

theorem spineTombstoneCount?_appenderAccumulator
    (suffix : List Bool) (start : Term) :
    spineTombstoneCount? (appenderAccumulator suffix start) =
      spineTombstoneCount? start := by
  induction suffix generalizing start with
  | nil => rfl
  | cons bit rest ih =>
      rw [appenderAccumulator_cons, ih]
      exact spineTombstoneCount?_live bit start

/-- The canonical carrier after deleting the literal seed's first bit. -/
def firstCarrier (actions : Term) (bit : Bool) (suffix : List Bool)
    (continuation : Term) : Term :=
  CheckpointDecoder.openBase actions continuation
    (appenderAccumulator suffix (Carrier.tombstone bit omega omega))
    (word (bit :: suffix))
    (baseBeta (environmentCode actions (bit :: suffix)) continuation)

theorem firstCarrier_parseBase
    (actions : Term) (bit : Bool) (suffix : List Bool) (continuation : Term) :
    CheckpointDecoder.parseBase? actions
        (firstCarrier actions bit suffix continuation) =
      some ⟨appenderAccumulator suffix (Carrier.tombstone bit omega omega),
        continuation, word (bit :: suffix),
        baseBeta (environmentCode actions (bit :: suffix)) continuation⟩ :=
  CheckpointDecoder.parseBase?_open ..

theorem firstCarrier_phase
    (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (bit : Bool) (suffix : List Bool) (continuation : Term) :
    carrierPhase? program tree
        (firstCarrier (compileActions program tree) bit suffix continuation) =
      some (CTS.zeroPhase program) := by
  rw [carrierPhase?, firstCarrier_parseBase]

theorem firstCarrier_localCount
    (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (bit : Bool) (suffix : List Bool) (continuation : Term) :
    carrierLocalCount? program tree
        (firstCarrier (compileActions program tree) bit suffix continuation) =
      some 0 := by
  rw [carrierLocalCount?, firstCarrier_parseBase]

theorem firstCarrier_tombstoneCount
    (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (bit : Bool) (suffix : List Bool) (continuation : Term) :
    carrierTombstoneCount? program tree
        (firstCarrier (compileActions program tree) bit suffix continuation) =
      some 1 := by
  rw [carrierTombstoneCount?, firstCarrier_parseBase]
  dsimp only
  rw [spineTombstoneCount?_appenderAccumulator,
    spineTombstoneCount?_tombstone]
  rw [spineTombstoneCount?, if_pos rfl]
  rfl

theorem firstCarrier_deletedBit
    (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (bit : Bool) (suffix : List Bool) (continuation : Term) :
    deletedFrontBit? program tree
        (firstCarrier (compileActions program tree) bit suffix continuation) =
      some bit := by
  rw [deletedFrontBit?, firstCarrier_parseBase]
  dsimp only
  rw [deletedFrontBitInSpine?_appenderAccumulator,
    deletedFrontBitInSpine?_tombstone]

theorem firstCarrier_decode
    (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (bit : Bool) (suffix : List Bool) (continuation : Term) :
    CheckpointDecoder.decodeCarrier? program tree
        (firstCarrier (compileActions program tree) bit suffix continuation) =
      some suffix := by
  rw [firstCarrier, CheckpointDecoder.decodeCarrier?_openBase]
  have empty : CellSpine.decode? (Carrier.tombstone bit omega omega) =
      some [] := by simp
  simpa using ActionDecode.decode_appenderAccumulator suffix empty

theorem firstCarrier_responseBit
    (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (bit : Bool) (suffix : List Bool) (continuation : Term) :
    carrierResponseBit? program tree
        (firstCarrier (compileActions program tree) bit suffix continuation) =
      some bit := by
  have notLocal : CheckpointDecoder.parseLocal? program tree
      (firstCarrier (compileActions program tree) bit suffix continuation) =
      none := by
    cases parsed : CheckpointDecoder.parseLocal? program tree
        (firstCarrier (compileActions program tree) bit suffix continuation) with
    | none => rfl
    | some view =>
        have rejected := CheckpointRun.parseBase?_none_of_localShape
          (CheckpointDecoder.parseLocal?_sound parsed)
        rw [firstCarrier_parseBase] at rejected
        contradiction
  rw [carrierResponseBit?, notLocal]
  rw [firstCarrier_localCount, firstCarrier_tombstoneCount]
  cases decoded : CheckpointDecoder.decodeCarrier? program tree
      (firstCarrier (compileActions program tree) bit suffix continuation) with
  | none => exact firstCarrier_deletedBit program tree bit suffix continuation
  | some bits =>
      cases bits with
      | nil => exact firstCarrier_deletedBit program tree bit suffix continuation
      | cons first rest =>
          exact firstCarrier_deletedBit program tree bit suffix continuation

/-- Adding a live cell does not add a completed response. -/
theorem carrierLocalCount?_live
    (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (bit : Bool) (predecessor : Term) :
    carrierLocalCount? program tree (.app (live bit) predecessor) =
      carrierLocalCount? program tree predecessor := by
  rw [carrierLocalCount?, CheckpointRun.parseBase?_live_none]
  dsimp only
  rw [CheckpointRun.parseLocal?_live_none]
  dsimp only
  rw [CanonicalStep.parseCell?_live]

/-- Adding a live cell does not record a deletion. -/
theorem carrierTombstoneCount?_live
    (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (bit : Bool) (predecessor : Term) :
    carrierTombstoneCount? program tree (.app (live bit) predecessor) =
      carrierTombstoneCount? program tree predecessor := by
  rw [carrierTombstoneCount?, CheckpointRun.parseBase?_live_none]
  dsimp only
  rw [CheckpointRun.parseLocal?_live_none]
  dsimp only
  rw [CanonicalStep.parseCell?_live]

/-- Deleting a live carrier cell adds one tombstone and no Local. The root
arity premise excludes a Base-shaped payload at the tombstone boundary. -/
theorem tombstone_chronology
    (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (bit : Bool) (predecessor audit : Term)
    (arity : predecessor.headArity ≠ 3) :
    carrierLocalCount? program tree (Carrier.tombstone bit predecessor audit) =
        carrierLocalCount? program tree predecessor ∧
      carrierTombstoneCount? program tree
          (Carrier.tombstone bit predecessor audit) =
        (carrierTombstoneCount? program tree predecessor).map Nat.succ ∧
      CheckpointDecoder.decodeCarrier? program tree
          (Carrier.tombstone bit predecessor audit) =
        CheckpointDecoder.decodeCarrier? program tree predecessor := by
  have notBase := CheckpointRun.parseBase?_tombstone_none_of_headArity_ne_three
    (compileActions program tree) bit predecessor audit arity
  have notLocal := CheckpointRun.parseLocal?_tombstone_none
    program tree bit predecessor audit
  refine ⟨?_, ?_, ?_⟩
  · rw [carrierLocalCount?, notBase]
    dsimp only
    rw [notLocal]
    dsimp only
    rw [CanonicalStep.parseCell?_tombstone]
  · rw [carrierTombstoneCount?, notBase]
    dsimp only
    rw [notLocal]
    dsimp only
    rw [CanonicalStep.parseCell?_tombstone]
  · rw [CheckpointDecoder.decodeCarrier?, notBase]
    dsimp only
    rw [notLocal]
    dsimp only
    rw [CanonicalStep.parseCell?_tombstone]

theorem carrierLocalCount?_appenderAccumulator
    (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (suffix : List Bool) (start : Term) :
    carrierLocalCount? program tree (appenderAccumulator suffix start) =
      carrierLocalCount? program tree start := by
  induction suffix generalizing start with
  | nil => rfl
  | cons bit rest ih =>
      rw [appenderAccumulator_cons, ih]
      exact carrierLocalCount?_live program tree bit start

theorem carrierTombstoneCount?_appenderAccumulator
    (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (suffix : List Bool) (start : Term) :
    carrierTombstoneCount? program tree (appenderAccumulator suffix start) =
      carrierTombstoneCount? program tree start := by
  induction suffix generalizing start with
  | nil => rfl
  | cons bit rest ih =>
      rw [appenderAccumulator_cons, ih]
      exact carrierTombstoneCount?_live program tree bit start

/-- Both CTS action branches preserve the accumulator's two chronology counts. -/
theorem actionAccumulator_chronology
    (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (label : ActionLabel program) (carrier : Term) :
    carrierLocalCount? program tree (actionAccumulator program label carrier) =
        carrierLocalCount? program tree carrier ∧
      carrierTombstoneCount? program tree
          (actionAccumulator program label carrier) =
        carrierTombstoneCount? program tree carrier := by
  rcases label with ⟨phase, bit⟩
  cases bit with
  | false => exact ⟨rfl, rfl⟩
  | true =>
      exact ⟨carrierLocalCount?_appenderAccumulator program tree
          (program.appendant phase) carrier,
        carrierTombstoneCount?_appenderAccumulator program tree
          (program.appendant phase) carrier⟩

/-- A complete normal response adds one Local, preserves every tombstone,
and records the exact successor phase, for every route and appendant length. -/
theorem completedResponse_chronology
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool)
    (bits : List Bool) (continuation carrier : Term) :
    let completed := LocalResponse.completed bits continuation carrier
      (SchedulerResponse.completedRoute program dispatcher registers bit carrier)
    carrierLocalCount? program dispatcher.tree completed =
        (carrierLocalCount? program dispatcher.tree carrier).map Nat.succ ∧
      carrierTombstoneCount? program dispatcher.tree completed =
        carrierTombstoneCount? program dispatcher.tree carrier ∧
      carrierPhase? program dispatcher.tree completed =
        some (CTS.nextPhase program registers.phase) := by
  dsimp only
  have dispatch := SchedulerResponse.completedRoute_snapshotDispatch
    program dispatcher registers bit carrier
  have localShape := CheckpointDecoder.localShape_completed
    (continuation := continuation) bits dispatch
  have notBase := CheckpointRun.parseBase?_none_of_localShape localShape
  have parsed := CheckpointDecoder.parseLocal?_completed
    (continuation := continuation) bits dispatch
  have counts := actionAccumulator_chronology program dispatcher.tree
    (registers.phase, bit) carrier
  refine ⟨?_, ?_, ?_⟩
  · rw [carrierLocalCount?, notBase]
    dsimp only
    rw [parsed]
    dsimp only [CheckpointDecoder.completedView]
    rw [counts.1]
  · rw [carrierTombstoneCount?, notBase]
    dsimp only
    rw [parsed]
    exact counts.2
  · rw [carrierPhase?, notBase]
    dsimp only
    rw [parsed]
    rfl

/-- The trace's proof-relevant descent contexts yield this literal carrier. -/
theorem firstResponseTrace_carrier
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (fuel : Nat)
    {outerContext fullContext innerContext targetContext : Context}
    {ascentTicks : Nat}
    (trace : SchedulerCycle.FirstResponseTrace program dispatcher bit suffix
      fuel outerContext fullContext innerContext targetContext ascentTicks) :
    SchedulerCycle.deletedCarrier bit outerContext innerContext =
      firstCarrier (compileActions program dispatcher.tree) bit suffix
        (Dovetail.clockExit (fuel + 1) fuel
          (environmentCode (compileActions program dispatcher.tree)
            (bit :: suffix))) := by
  obtain ⟨seed, _parsed, valid⟩ :=
    RootResetPersistentFuelCarrier.exists_parseSeedFront?_word_cons bit suffix
  rw [RootResetPersistentRouteAFuelSchedulerBridge.deletedCarrier_eq_generatedPostBase
    program dispatcher bit suffix fuel trace seed valid, seedFront_endpoint bit
      suffix valid]
  rfl

/-- All four executable chronology/label facts hold on the actual first
response carrier, without parser-priority assumptions. -/
theorem firstResponseTrace_chronology
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (fuel : Nat)
    {outerContext fullContext innerContext targetContext : Context}
    {ascentTicks : Nat}
    (trace : SchedulerCycle.FirstResponseTrace program dispatcher bit suffix
      fuel outerContext fullContext innerContext targetContext ascentTicks) :
    let carrier := SchedulerCycle.deletedCarrier bit outerContext innerContext
    carrierLocalCount? program dispatcher.tree carrier = some 0 ∧
      carrierTombstoneCount? program dispatcher.tree carrier = some 1 ∧
      carrierPhase? program dispatcher.tree carrier =
        some (CTS.zeroPhase program) ∧
      carrierResponseBit? program dispatcher.tree carrier = some bit := by
  dsimp only
  rw [firstResponseTrace_carrier program dispatcher bit suffix fuel trace]
  exact ⟨firstCarrier_localCount .., firstCarrier_tombstoneCount ..,
    firstCarrier_phase .., firstCarrier_responseBit ..⟩

/-- After a one-bit appendant is consumed in the next pending response, the
actual first carrier has the distinguishing zero-Local/two-tombstone count.
Its data is empty even though that further C4 still requires a FRAME handoff. -/
theorem firstResponseTrace_singletonAppenderDeletion
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (nextBit : Bool) (fuel : Nat)
    (appendant : program.appendant (CTS.zeroPhase program) = [nextBit])
    {outerContext fullContext innerContext targetContext : Context}
    {ascentTicks : Nat}
    (trace : SchedulerCycle.FirstResponseTrace program dispatcher true []
      fuel outerContext fullContext innerContext targetContext ascentTicks) :
    let carrier := SchedulerCycle.deletedCarrier true outerContext innerContext
    let before := actionAccumulator program (CTS.zeroPhase program, true) carrier
    let after := Carrier.tombstone nextBit carrier carrier
    before.contractAt? [] = some after ∧
      Step before after ∧
      carrierLocalCount? program dispatcher.tree after = some 0 ∧
      carrierTombstoneCount? program dispatcher.tree after = some 2 ∧
      CheckpointDecoder.decodeCarrier? program dispatcher.tree after = some [] := by
  dsimp only
  have exactCarrier := firstResponseTrace_carrier program dispatcher true [] fuel
    trace
  have arity :
      (SchedulerCycle.deletedCarrier true outerContext innerContext).headArity ≠
        3 := by
    rw [exactCarrier]
    have admissible := Dovetail.clockExit_admissible (fuel + 1) fuel
      (environmentCode (compileActions program dispatcher.tree) [true])
    change
      (Dovetail.clockExit (fuel + 1) fuel
          (environmentCode (compileActions program dispatcher.tree) [true])).headArity
        + 2 ≠ 3
    rcases admissible with first | second
    · rw [first]; decide
    · rw [second]; decide
  have counts := tombstone_chronology program dispatcher.tree nextBit
    (SchedulerCycle.deletedCarrier true outerContext innerContext)
    (SchedulerCycle.deletedCarrier true outerContext innerContext) arity
  obtain ⟨localCount, tombstones, _phase, _bit⟩ :=
    firstResponseTrace_chronology program dispatcher true [] fuel trace
  have decoded : CheckpointDecoder.decodeCarrier? program dispatcher.tree
      (SchedulerCycle.deletedCarrier true outerContext innerContext) = some [] := by
    rw [exactCarrier]
    exact firstCarrier_decode program dispatcher.tree true [] _
  rw [localCount, tombstones, decoded] at counts
  have contracts :
      (actionAccumulator program (CTS.zeroPhase program, true)
        (SchedulerCycle.deletedCarrier true outerContext innerContext)).contractAt?
        [] = some (Carrier.tombstone nextBit
          (SchedulerCycle.deletedCarrier true outerContext innerContext)
          (SchedulerCycle.deletedCarrier true outerContext innerContext)) := by
    rw [actionAccumulator, appendant]
    rfl
  exact ⟨contracts, Term.contractAt?_sound contracts, counts⟩

/-- The actual completed first-response cursor has equal counts one and one;
its next phase is recovered from the completed response rather than the seed. -/
theorem firstResponseTrace_returnChronology
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (suffix : List Bool) (fuel : Nat)
    {outerContext fullContext innerContext targetContext : Context}
    {ascentTicks : Nat}
    (trace : SchedulerCycle.FirstResponseTrace program dispatcher bit suffix
      fuel outerContext fullContext innerContext targetContext ascentTicks) :
    let completed := (SchedulerCycle.firstReturnConfiguration program dispatcher
      bit suffix fuel outerContext innerContext).cursor.focus
    carrierLocalCount? program dispatcher.tree completed = some 1 ∧
      carrierTombstoneCount? program dispatcher.tree completed = some 1 ∧
      carrierPhase? program dispatcher.tree completed =
        some (CTS.nextPhase program (CTS.zeroPhase program)) := by
  dsimp only [SchedulerCycle.firstReturnConfiguration,
    SchedulerResponse.returnConfiguration, SchedulerResponse.completedCursor]
  obtain ⟨localCount, tombstones, _phase, _bit⟩ :=
    firstResponseTrace_chronology program dispatcher bit suffix fuel trace
  have completed := completedResponse_chronology program dispatcher
    (SchedulerCycle.responseRegisters program bit suffix) bit (bit :: suffix)
    (Dovetail.clockExit (fuel + 1) fuel
      (environmentCode (compileActions program dispatcher.tree) (bit :: suffix)))
    (SchedulerCycle.deletedCarrier bit outerContext innerContext)
  dsimp only at completed
  rw [localCount, tombstones, SchedulerCycle.responseRegisters_phase] at completed
  exact completed

end PureSFormal.Research.RootResetResponseCarrierChronology
