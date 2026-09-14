import PureSFormal.Research.RootResetPersistentCarrierTraversalAgreement
import PureSFormal.Research.RootResetResponseBoundaryStages

/-!
# Executable selected-front parser agreement

This module isolates the bare-term carrier traversal needed at every C4
boundary.  The parser follows only the public Base queue, completed-Local
accumulator, and registered live/tombstone predecessor fields.  Its
completeness theorem is indexed by `CanonicalTraversal.SelectedFront`, so the
returned address is the construction-selected innermost live occurrence, not
an arbitrary saturated cell elsewhere in the term.
-/

namespace PureSFormal.Research.RootResetSelectedFrontParserAgreement

open PureSFormal.PureS

/-! ## Executable traversal -/

/-- Address of the innermost live cell in one complete cell spine. -/
def spineFirstLiveAddress? (term : Term) : Option Address :=
  if term = omega then
    none
  else
    match parsed : CanonicalStep.parseCell? term with
    | some (.live _ predecessor) =>
        match spineFirstLiveAddress? predecessor with
        | some inner => some (.right :: inner)
        | none => some []
    | some (.tombstone _ predecessor) =>
        (spineFirstLiveAddress? predecessor).map fun inner =>
          [.left, .right] ++ inner
    | none => none
termination_by term.size
decreasing_by
  · exact CheckpointDecoder.parsedCell_size_lt parsed rfl
  · exact CheckpointDecoder.parsedCell_size_lt parsed rfl

/-- Root-relative address of the innermost live cell in a public carrier. -/
def firstLiveAddress?
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : Option Address :=
  if cellNone : CanonicalStep.parseCell? term = none then
    match baseEq : CheckpointDecoder.parseBase?
        (compileActions program tree) term with
    | some view =>
        (spineFirstLiveAddress? view.queue).map fun inner =>
          BasePath.wordAddress ++ inner
    | none =>
        match localEq : CheckpointDecoder.parseLocal? program tree term with
        | some view =>
            (firstLiveAddress? program tree view.accumulator).map fun inner =>
              RootResetResponseBoundaryStages.localAccumulatorAddress view ++ inner
        | none => none
  else
    match cellEq : CanonicalStep.parseCell? term with
    | some (.live _ predecessor) =>
        match firstLiveAddress? program tree predecessor with
        | some inner => some (.right :: inner)
        | none => some []
    | some (.tombstone _ predecessor) =>
        (firstLiveAddress? program tree predecessor).map fun inner =>
          [.left, .right] ++ inner
    | none => none
termination_by term.size
decreasing_by
  · exact CheckpointDecoder.parseLocal?_accumulator_size_lt localEq
  · exact CheckpointDecoder.parsedCell_size_lt cellEq rfl
  · exact CheckpointDecoder.parsedCell_size_lt cellEq rfl

/-! ## Complete queue-spine equations -/

@[simp]
theorem spineFirstLiveAddress?_omega :
    spineFirstLiveAddress? omega = none := by
  simp [spineFirstLiveAddress?]

@[simp]
theorem spineFirstLiveAddress?_live (bit : Bool) (predecessor : Term) :
    spineFirstLiveAddress? (.app (live bit) predecessor) =
      match spineFirstLiveAddress? predecessor with
      | some inner => some (.right :: inner)
      | none => some [] := by
  rw [spineFirstLiveAddress?]
  rw [if_neg (Carrier.omega_ne_liveCell bit predecessor).symm]
  rw [CanonicalStep.parseCell?_live]

@[simp]
theorem spineFirstLiveAddress?_tombstone
    (bit : Bool) (predecessor audit : Term) :
    spineFirstLiveAddress? (Carrier.tombstone bit predecessor audit) =
      (spineFirstLiveAddress? predecessor).map fun inner =>
        [.left, .right] ++ inner := by
  rw [spineFirstLiveAddress?]
  rw [if_neg (Carrier.omega_ne_tombstone bit predecessor audit).symm]
  rw [CanonicalStep.parseCell?_tombstone]

@[simp]
theorem tombstoneContext_plug (bit : Bool) (audit : Term)
    (context : Context) (endpoint : Term) :
    (CellDeletion.tombstoneContext bit audit context).plug endpoint =
      Carrier.tombstone bit (context.plug endpoint) audit := by
  rfl

/-- An empty queue context cannot introduce a live result around a parser-empty
endpoint. -/
theorem spineFirstLiveAddress?_emptyQueue
    {context : Context} {decoded : List Bool}
    (queue : CanonicalTraversal.QueueContext context decoded)
    (empty : decoded = []) (endpoint : Term)
    (endpointNone : spineFirstLiveAddress? endpoint = none) :
    spineFirstLiveAddress? (context.plug endpoint) = none := by
  induction queue with
  | hole => simpa using endpointNone
  | @live innerContext innerDecoded bit inner ih =>
      simp at empty
  | @tombstone innerContext innerDecoded bit audit inner ih =>
      rw [tombstoneContext_plug]
      rw [spineFirstLiveAddress?_tombstone, ih empty]
      rfl

/-- Wrapping a known inner result in a complete queue context prefixes exactly
the context address, even when the wrapper contains later live cells. -/
theorem spineFirstLiveAddress?_underQueue
    {context : Context} {decoded : List Bool}
    (queue : CanonicalTraversal.QueueContext context decoded)
    (endpoint : Term) {address : Address}
    (inner : spineFirstLiveAddress? endpoint = some address) :
    spineFirstLiveAddress? (context.plug endpoint) =
      some (CanonicalTraversal.contextAddress context ++ address) := by
  induction queue with
  | hole => simpa using! inner
  | @live innerContext innerDecoded bit queue ih =>
      change spineFirstLiveAddress?
        (.app (live bit) (innerContext.plug endpoint)) = _
      rw [spineFirstLiveAddress?_live]
      rw [ih]
      rfl
  | @tombstone innerContext innerDecoded bit audit queue ih =>
      rw [tombstoneContext_plug]
      rw [spineFirstLiveAddress?_tombstone]
      rw [ih]
      rfl

/-- A proof-relevant queue selection is exactly the address returned by the
executable spine parser, provided its endpoint contains no earlier live cell. -/
theorem spineFirstLiveAddress?_ofQueueSelection
    {sourceContext cellOuter : Context}
    {bit : Bool} {suffix : List Bool} {cellAddress : Address}
    (selected : CanonicalTraversal.QueueSelection sourceContext bit suffix
      cellOuter cellAddress)
    (endpoint : Term)
    (endpointNone : spineFirstLiveAddress? endpoint = none) :
    spineFirstLiveAddress? (sourceContext.plug endpoint) =
      some (CanonicalTraversal.contextAddress cellOuter) := by
  induction selected with
  | @here innerContext bit inner =>
      have emptyInner := spineFirstLiveAddress?_emptyQueue inner rfl endpoint
        endpointNone
      change spineFirstLiveAddress?
        (.app (live bit) (innerContext.plug endpoint)) = some []
      rw [spineFirstLiveAddress?_live]
      rw [emptyInner]
  | @live innerSource innerOuter innerBit innerSuffix innerAddress outerBit inner ih =>
      change spineFirstLiveAddress?
        (.app (live outerBit) (innerSource.plug endpoint)) = _
      rw [spineFirstLiveAddress?_live]
      rw [ih]
      rfl
  | @tombstone innerSource innerOuter innerBit innerSuffix innerAddress outerBit audit inner ih =>
      rw [tombstoneContext_plug]
      rw [spineFirstLiveAddress?_tombstone]
      rw [ih]
      rfl

/-! ## Carrier-path equations -/

@[simp]
theorem firstLiveAddress?_live
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bit : Bool) (predecessor : Term) :
    firstLiveAddress? program tree (.app (live bit) predecessor) =
      match firstLiveAddress? program tree predecessor with
      | some inner => some (.right :: inner)
      | none => some [] := by
  have cellNotNone : CanonicalStep.parseCell? (.app (live bit) predecessor) ≠
      none := by
    rw [CanonicalStep.parseCell?_live]
    intro impossible
    cases impossible
  rw [firstLiveAddress?, dif_neg cellNotNone,
    CanonicalStep.parseCell?_live]

@[simp]
theorem firstLiveAddress?_tombstone
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bit : Bool) (predecessor audit : Term) :
    firstLiveAddress? program tree
        (Carrier.tombstone bit predecessor audit) =
      (firstLiveAddress? program tree predecessor).map fun inner =>
        [.left, .right] ++ inner := by
  have cellNotNone : CanonicalStep.parseCell?
      (Carrier.tombstone bit predecessor audit) ≠ none := by
    rw [CanonicalStep.parseCell?_tombstone]
    intro impossible
    cases impossible
  rw [firstLiveAddress?, dif_neg cellNotNone,
    CanonicalStep.parseCell?_tombstone]

/-- A queue wrapper prefixes a known carrier-front address. -/
theorem firstLiveAddress?_underQueue
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {context : Context} {decoded : List Bool}
    (queue : CanonicalTraversal.QueueContext context decoded)
    (endpoint : Term) {address : Address}
    (inner : firstLiveAddress? program tree endpoint = some address) :
    firstLiveAddress? program tree (context.plug endpoint) =
      some (CanonicalTraversal.contextAddress context ++ address) := by
  induction queue with
  | hole => simpa using! inner
  | @live innerContext innerDecoded bit queue ih =>
      change firstLiveAddress? program tree
        (.app (live bit) (innerContext.plug endpoint)) = _
      rw [firstLiveAddress?_live, ih]
      rfl
  | @tombstone innerContext innerDecoded bit audit queue ih =>
      rw [tombstoneContext_plug, firstLiveAddress?_tombstone, ih]
      rfl

/-- An empty queue context preserves failure of the carrier-front parser. -/
theorem firstLiveAddress?_emptyQueue
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {context : Context} {decoded : List Bool}
    (queue : CanonicalTraversal.QueueContext context decoded)
    (empty : decoded = []) (endpoint : Term)
    (endpointNone : firstLiveAddress? program tree endpoint = none) :
    firstLiveAddress? program tree (context.plug endpoint) = none := by
  induction queue with
  | hole => simpa using endpointNone
  | @live innerContext innerDecoded bit inner ih => simp at empty
  | @tombstone innerContext innerDecoded bit audit inner ih =>
      rw [tombstoneContext_plug, firstLiveAddress?_tombstone, ih empty]
      rfl

/-- If a carrier endpoint has no selected live cell, a proof-relevant queue
selection supplies exactly the first address introduced by its wrapper. -/
theorem firstLiveAddress?_ofQueueSelection
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {sourceContext cellOuter : Context}
    {bit : Bool} {suffix : List Bool} {cellAddress : Address}
    (selected : CanonicalTraversal.QueueSelection sourceContext bit suffix
      cellOuter cellAddress)
    (endpoint : Term)
    (endpointNone : firstLiveAddress? program tree endpoint = none) :
    firstLiveAddress? program tree (sourceContext.plug endpoint) =
      some (CanonicalTraversal.contextAddress cellOuter) := by
  induction selected with
  | @here innerContext bit inner =>
      change firstLiveAddress? program tree
        (.app (live bit) (innerContext.plug endpoint)) = some []
      rw [firstLiveAddress?_live]
      have emptyWrapped : firstLiveAddress? program tree
          (innerContext.plug endpoint) = none := by
        exact firstLiveAddress?_emptyQueue inner rfl endpoint endpointNone
      rw [emptyWrapped]
  | @live innerSource innerOuter innerBit innerSuffix innerAddress outerBit
      inner ih =>
      change firstLiveAddress? program tree
        (.app (live outerBit) (innerSource.plug endpoint)) = _
      rw [firstLiveAddress?_live, ih]
      rfl
  | @tombstone innerSource innerOuter innerBit innerSuffix innerAddress outerBit
      audit inner ih =>
      rw [tombstoneContext_plug, firstLiveAddress?_tombstone, ih]
      rfl

/-! ## Public-root branch equations -/

/-- A registered cell has head arity two or three; therefore a public root of
head arity five or six cannot be consumed by the cell branch. -/
theorem parseCell?_none_of_headArity_five_or_six
    {term : Term} (arity : term.headArity = 5 ∨ term.headArity = 6) :
    CanonicalStep.parseCell? term = none := by
  cases parsedEq : CanonicalStep.parseCell? term with
  | none => rfl
  | some parsed =>
      exfalso
      have shape := CanonicalStep.parseCell?_sound parsedEq
      cases shape with
      | live bit predecessor =>
          rcases arity with arity | arity <;>
            simp only [Carrier.headArity_liveCell] at arity <;> cases arity
      | tombstone bit predecessor audit =>
          rcases arity with arity | arity <;>
            simp only [Carrier.headArity_tombstone] at arity <;> cases arity

/-- Public status corresponding to the exact-provenance halt-state index. -/
def publicStatus : ReachableAudit.HaltState → CheckpointDecoder.HaltStatus
  | .fresh => .fresh
  | .marked => .marked

/-- The literal public view of one exact completed Local context. -/
def localView
    (program : CTS.Program)
    (status : ReachableAudit.HaltState)
    (route : Dispatcher.Route) (label : ActionLabel program)
    (accumulator : Term) (bits : List Bool) (continuation : Term) :
    CheckpointDecoder.LocalView program :=
  ⟨publicStatus status, route, label, accumulator, word bits, continuation⟩

/-- The exact Local context constructed by canonical traversal is accepted by
the public completed-Local parser with the displayed accumulator. -/
theorem parseLocal?_localContext
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    (bits : List Bool) (continuation snapshot : Term)
    (status : ReachableAudit.HaltState)
    {route : Dispatcher.Route} {label : ActionLabel program}
    {routeContext segmentContext currentContext : Context}
    (selectedRoute : CanonicalTraversal.RouteContext
      (selectedAction program) snapshot tree route label routeContext) :
    let accumulator := segmentContext.plug (currentContext.plug omega)
    CheckpointDecoder.parseLocal? program tree
        ((CanonicalTraversal.localContext program bits continuation snapshot
          status label routeContext segmentContext currentContext).plug omega) =
      some (localView program status route label accumulator bits continuation) := by
  dsimp only
  let accumulator := segmentContext.plug (currentContext.plug omega)
  let dispatcher := routeContext.plug
    (ReachableAudit.actionResponse program label snapshot accumulator)
  have dispatch := selectedRoute.snapshotDispatchAt accumulator
  cases status with
  | fresh =>
      simpa [localView, publicStatus, accumulator, dispatcher,
        CanonicalTraversal.localContext_plug] using!
        (CheckpointDecoder.parseLocal?_completed bits dispatch)
  | marked =>
      simpa [localView, publicStatus, accumulator, dispatcher,
        CanonicalTraversal.localContext_plug] using!
        (CheckpointDecoder.parseLocal?_markedCompleted bits dispatch)

/-- The same exact Local shape is rejected by the public Base parser. -/
theorem parseBase?_localContext
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    (bits : List Bool) (continuation snapshot : Term)
    (status : ReachableAudit.HaltState)
    {route : Dispatcher.Route} {label : ActionLabel program}
    {routeContext segmentContext currentContext : Context}
    (selectedRoute : CanonicalTraversal.RouteContext
      (selectedAction program) snapshot tree route label routeContext) :
    CheckpointDecoder.parseBase? (compileActions program tree)
        ((CanonicalTraversal.localContext program bits continuation snapshot
          status label routeContext segmentContext currentContext).plug omega) =
      none := by
  let accumulator := segmentContext.plug (currentContext.plug omega)
  let dispatcher := routeContext.plug
    (ReachableAudit.actionResponse program label snapshot accumulator)
  have dispatch := selectedRoute.snapshotDispatchAt accumulator
  cases status with
  | fresh =>
      apply CheckpointRun.parseBase?_none_of_localShape
      simpa [accumulator, dispatcher, CanonicalTraversal.localContext_plug] using!
        (CheckpointDecoder.localShape_completed bits dispatch)
  | marked =>
      apply CheckpointRun.parseBase?_none_of_localShape
      simpa [accumulator, dispatcher, CanonicalTraversal.localContext_plug] using!
        (CheckpointDecoder.localShape_markedCompleted bits dispatch)

/-- The exact completed Local context is not an immediate cell. -/
theorem parseCell?_localContext
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    (bits : List Bool) (continuation snapshot : Term)
    (status : ReachableAudit.HaltState)
    {route : Dispatcher.Route} {label : ActionLabel program}
    {routeContext segmentContext currentContext : Context}
    (selectedRoute : CanonicalTraversal.RouteContext
      (selectedAction program) snapshot tree route label routeContext) :
    CanonicalStep.parseCell?
        ((CanonicalTraversal.localContext program bits continuation snapshot
          status label routeContext segmentContext currentContext).plug omega) =
      none := by
  let accumulator := segmentContext.plug (currentContext.plug omega)
  let dispatcher := routeContext.plug
    (ReachableAudit.actionResponse program label snapshot accumulator)
  have shell : Carrier.LocalShell bits continuation dispatcher
      ((CanonicalTraversal.localContext program bits continuation snapshot
        status label routeContext segmentContext currentContext).plug omega) := by
    cases status with
    | fresh =>
        simpa [dispatcher, accumulator,
          CanonicalTraversal.localContext_plug] using
          (Carrier.LocalShell.fresh dispatcher snapshot snapshot snapshot)
    | marked =>
        simpa [dispatcher, accumulator,
          CanonicalTraversal.localContext_plug] using
          (Carrier.LocalShell.marked dispatcher snapshot snapshot snapshot
            snapshot)
  exact parseCell?_none_of_headArity_five_or_six shell.result_headArity

/-- The exact route context places its response at the parser's route address. -/
theorem routeContext_address
    {Label : Type} {encode : Label → Term} {snapshot : Term}
    {tree : Dispatcher.Tree Label} {route : Dispatcher.Route} {label : Label}
    {context : Context}
    (selected : CanonicalTraversal.RouteContext encode snapshot tree route label
      context) :
    RootResetSelectorContract.contextAddress context =
      RootResetReachableStageGrammar.routeResponseAddress route := by
  induction selected with
  | leaf label => rfl
  | left inner ih =>
      simp [CanonicalTraversal.selectedLeftContext,
        RootResetSelectorContract.contextAddress,
        RootResetReachableStageGrammar.routeResponseAddress, ih]
  | right inner ih =>
      simp [CanonicalTraversal.selectedRightContext,
        RootResetSelectorContract.contextAddress,
        RootResetReachableStageGrammar.routeResponseAddress, ih]

/-- The public Local accumulator address is exactly the context address of the
shell, selected route, and retained action histories. -/
theorem localAccumulatorAddress_eq_context
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    (bits : List Bool) (continuation snapshot : Term)
    (status : ReachableAudit.HaltState)
    {route : Dispatcher.Route} {label : ActionLabel program}
    {routeContext : Context} (accumulator : Term)
    (selectedRoute : CanonicalTraversal.RouteContext
      (selectedAction program) snapshot tree route label routeContext) :
    RootResetResponseBoundaryStages.localAccumulatorAddress
        (localView program status route label accumulator bits continuation) =
      RootResetSelectorContract.contextAddress
        ((CanonicalTraversal.localDispatcherContext bits continuation
          (ReachableAudit.haltField status snapshot) snapshot snapshot).comp
          (routeContext.comp
            (CanonicalTraversal.actionContext
              (actionHistories program label snapshot)))) := by
  rw [RootResetSelectorContract.contextAddress_comp,
    RootResetSelectorContract.contextAddress_comp,
    routeContext_address selectedRoute,
    RootResetResponseBoundaryStages.contextAddress_actionContext,
    ActionParser.actionHistories_length]
  rfl

/-- The fixed Base queue address is the context address of the public Base
wrapper. -/
theorem baseQueueContext_address
    (actions : Term) (bits : List Bool) (continuation beta : Term) :
    CanonicalTraversal.contextAddress
        (MutableBase.queueContext actions bits continuation beta) =
      BasePath.wordAddress := by
  rfl

/-- On an exact mutable Base, the carrier parser enters the registered word
field and delegates to the complete cell-spine parser. -/
theorem firstLiveAddress?_mutableBase
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation : Term)
    (queue : Term)
    (admissible : Carrier.Admissible continuation) :
    firstLiveAddress? program tree
        (MutableBase.mutableBase (compileActions program tree) bits continuation
          queue) =
      (spineFirstLiveAddress? queue).map fun inner =>
        BasePath.wordAddress ++ inner := by
  have cellNone : CanonicalStep.parseCell?
      (MutableBase.mutableBase (compileActions program tree) bits continuation
        queue) = none :=
    parseCell?_none_of_headArity_five_or_six
      (MutableBase.mutableBase_root_headArity
        (compileActions program tree) bits admissible queue)
  have baseEq : CheckpointDecoder.parseBase? (compileActions program tree)
      (MutableBase.mutableBase (compileActions program tree) bits continuation
        queue) =
        some ⟨queue, continuation, word bits,
          baseBeta
            (environmentCode (compileActions program tree) bits)
            continuation⟩ := by
    unfold MutableBase.mutableBase
    exact CheckpointDecoder.parseBase?_mutableBase _ _ _ _ _
  rw [firstLiveAddress?, dif_pos cellNone, baseEq]

/-! ## Canonical descent and selected-front completeness -/

/-- An exact canonical descent decoding the empty word contains no selectable
live cell on its registered carrier path. -/
theorem firstLiveAddress?_descent_empty
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term}
    {decoded : List Bool} {context : Context}
    (descent : CanonicalTraversal.Descent program tree bits continuation
      source decoded context)
    (empty : decoded = [])
    (admissible : Carrier.Admissible continuation) :
    firstLiveAddress? program tree source = none := by
  induction descent with
  | @base queueContext decoded queue =>
      have spineNone : spineFirstLiveAddress? (queueContext.plug omega) = none :=
        spineFirstLiveAddress?_emptyQueue queue empty omega
          spineFirstLiveAddress?_omega
      rw [firstLiveAddress?_mutableBase program tree bits continuation
        (queueContext.plug omega) admissible, spineNone]
      rfl
  | @«local» snapshot currentContext segmentContext routeContext currentWord
      appended status route label snapshotInv current segment selectedRoute ih =>
      obtain ⟨currentEmpty, appendedEmpty⟩ := List.append_eq_nil_iff.mp empty
      have currentNone := ih currentEmpty
      have accumulatorNone : firstLiveAddress? program tree
          (segmentContext.plug (currentContext.plug omega)) = none :=
        firstLiveAddress?_emptyQueue segment appendedEmpty
          (currentContext.plug omega) currentNone
      have cellNone := parseCell?_localContext
        (program := program) (tree := tree)
        (routeContext := routeContext) (segmentContext := segmentContext)
        (currentContext := currentContext)
        bits continuation snapshot status selectedRoute
      have baseNone := parseBase?_localContext
        (program := program) (tree := tree)
        (routeContext := routeContext) (segmentContext := segmentContext)
        (currentContext := currentContext)
        bits continuation snapshot status selectedRoute
      have localEq := parseLocal?_localContext
        (program := program) (tree := tree)
        (routeContext := routeContext) (segmentContext := segmentContext)
        (currentContext := currentContext)
        bits continuation snapshot status selectedRoute
      rw [firstLiveAddress?, dif_pos cellNone, baseNone, localEq]
      simp [localView, accumulatorNone]

/-- On every exact selected-front carrier, the executable bare-term parser
returns precisely the proof-independent context address of that front. -/
theorem firstLiveAddress?_ofSelectedFront
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term}
    {bit : Bool} {suffix : List Bool} {outerContext : Context}
    (admissible : Carrier.Admissible continuation)
    (selected : CanonicalTraversal.SelectedFront program tree bits continuation
      source bit suffix outerContext) :
    firstLiveAddress? program tree source =
      some (CanonicalTraversal.contextAddress outerContext) := by
  induction selected with
  | @base queueContext cellOuter bit suffix cellAddress queue queueSelected =>
      have frontEq := spineFirstLiveAddress?_ofQueueSelection queueSelected omega
        spineFirstLiveAddress?_omega
      rw [firstLiveAddress?_mutableBase program tree bits continuation
        (queueContext.plug omega) admissible, frontEq]
      simp only [Option.map]
      congr 1
  | @inside snapshot currentContext segmentContext routeContext currentOuter bit
      currentSuffix appended status route label snapshotInv current segment
      selectedRoute inner ih =>
      have currentEq := ih
      have accumulatorEq := firstLiveAddress?_underQueue segment
        (currentContext.plug omega) currentEq
      have cellNone := parseCell?_localContext
        (program := program) (tree := tree)
        (routeContext := routeContext) (segmentContext := segmentContext)
        (currentContext := currentContext)
        bits continuation snapshot status selectedRoute
      have baseNone := parseBase?_localContext
        (program := program) (tree := tree)
        (routeContext := routeContext) (segmentContext := segmentContext)
        (currentContext := currentContext)
        bits continuation snapshot status selectedRoute
      have localEq := parseLocal?_localContext
        (program := program) (tree := tree)
        (routeContext := routeContext) (segmentContext := segmentContext)
        (currentContext := currentContext)
        bits continuation snapshot status selectedRoute
      rw [firstLiveAddress?, dif_pos cellNone, baseNone, localEq]
      simp only [localView]
      rw [accumulatorEq]
      simp only [Option.map]
      congr 1
      have prefixEq := localAccumulatorAddress_eq_context bits continuation
        snapshot status (segmentContext.plug (currentContext.plug omega))
        selectedRoute
      have prefixEq' :
          RootResetResponseBoundaryStages.localAccumulatorAddress
              { status := publicStatus status, route := route, label := label,
                accumulator := segmentContext.plug (currentContext.plug omega),
                seedPayload := word bits, continuation := continuation } =
            RootResetSelectorContract.contextAddress
              ((CanonicalTraversal.localDispatcherContext bits continuation
                (ReachableAudit.haltField status snapshot) snapshot snapshot).comp
                (routeContext.comp
                  (CanonicalTraversal.actionContext
                    (actionHistories program label snapshot)))) := by
        simpa [localView] using prefixEq
      rw [prefixEq']
      rw [RootResetResponseBoundaryStages.contextAddress_eq_canonical]
      simp only [CanonicalTraversal.contextAddress_comp, List.append_assoc]
  | @segment snapshot currentContext segmentContext routeContext cellOuter bit
      suffix cellAddress status route label snapshotInv current queue
      selectedRoute queueSelected =>
      have currentNone := firstLiveAddress?_descent_empty current rfl admissible
      have accumulatorEq := firstLiveAddress?_ofQueueSelection queueSelected
        (currentContext.plug omega) currentNone
      have cellNone := parseCell?_localContext
        (program := program) (tree := tree)
        (routeContext := routeContext) (segmentContext := segmentContext)
        (currentContext := currentContext)
        bits continuation snapshot status selectedRoute
      have baseNone := parseBase?_localContext
        (program := program) (tree := tree)
        (routeContext := routeContext) (segmentContext := segmentContext)
        (currentContext := currentContext)
        bits continuation snapshot status selectedRoute
      have localEq := parseLocal?_localContext
        (program := program) (tree := tree)
        (routeContext := routeContext) (segmentContext := segmentContext)
        (currentContext := currentContext)
        bits continuation snapshot status selectedRoute
      rw [firstLiveAddress?, dif_pos cellNone, baseNone, localEq]
      simp only [localView]
      rw [accumulatorEq]
      simp only [Option.map]
      congr 1
      have prefixEq := localAccumulatorAddress_eq_context bits continuation
        snapshot status (segmentContext.plug (currentContext.plug omega))
        selectedRoute
      have prefixEq' :
          RootResetResponseBoundaryStages.localAccumulatorAddress
              { status := publicStatus status, route := route, label := label,
                accumulator := segmentContext.plug (currentContext.plug omega),
                seedPayload := word bits, continuation := continuation } =
            RootResetSelectorContract.contextAddress
              ((CanonicalTraversal.localDispatcherContext bits continuation
                (ReachableAudit.haltField status snapshot) snapshot snapshot).comp
                (routeContext.comp
                  (CanonicalTraversal.actionContext
                    (actionHistories program label snapshot)))) := by
        simpa [localView] using prefixEq
      rw [prefixEq']
      rw [RootResetResponseBoundaryStages.contextAddress_eq_canonical]
      simp only [CanonicalTraversal.contextAddress_comp, List.append_assoc]

/-- The executable selected-front address contracts to the exact canonical C4
target below an arbitrary pending/completed runtime parent stack. -/
theorem firstLiveAddress?_contracts_belowParents
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term}
    {bit : Bool} {suffix : List Bool} {outerContext : Context}
    (admissible : Carrier.Admissible continuation)
    (selected : CanonicalTraversal.SelectedFront program tree bits continuation
      source bit suffix outerContext)
    (parents : List ParentFrame) :
    ∃ predecessor,
      firstLiveAddress? program tree source =
        some (CanonicalTraversal.contextAddress outerContext) ∧
      ((SchedulerInvariant.contextOfParents parents).plug source).contractAt?
          (RootResetPersistentCarrierTraversalAgreement.selectedFrontAddress
            parents outerContext) =
        some
          (RootResetPersistentCarrierTraversalAgreement.selectedFrontTarget
            parents bit outerContext predecessor) := by
  obtain ⟨predecessor, sourceEq, contracts⟩ :=
    RootResetPersistentCarrierTraversalAgreement.selectedFront_contractAt?_belowParents
      selected parents
  exact ⟨predecessor, firstLiveAddress?_ofSelectedFront admissible selected,
    contracts⟩

end PureSFormal.Research.RootResetSelectedFrontParserAgreement
