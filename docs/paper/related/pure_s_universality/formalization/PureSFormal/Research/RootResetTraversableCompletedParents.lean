import PureSFormal.Research.RootResetPersistentResponseSelector
import PureSFormal.PureS.SchedulerCompletedContext

/-!
# Traversable completed continuation contexts

The public completed-parent certificate intentionally records only checkpoint
parsing.  It therefore also admits a fresh completed Local whose accumulator
decodes to the empty queue.  The response-aware selector must stop at that
Local to perform COMMIT, so such a context cannot be used to lift a later
clock or fuel selection through the continuation.

`TraversableParents` retains the construction provenance needed by the exact
scheduler trajectory: historical marked Locals are always traversable, and a
fresh Local is traversable when its literal accumulator decodes to a nonempty
queue.  This is proof data only; the selector
still receives the bare term alone and establishes the corresponding parses
itself.
-/

namespace PureSFormal.Research.RootResetTraversableCompletedParents

open PureSFormal.PureS

/-- Completed continuation parents through which the term-only active-context
parser is permitted to descend. -/
inductive TraversableParents
    (program : CTS.Program) (dispatcher : ActionDispatcher program) :
    (parents : List ParentFrame) -> (layers : Nat) -> Prop where
  | root : TraversableParents program dispatcher [] 0
  | fresh
      {parents : List ParentFrame} {layers : Nat}
      (outer : TraversableParents program dispatcher parents layers)
      (registers : SchedulerControl.Registers program) (bit : Bool)
      (bits : List Bool) (carrier : Term)
      (complete : exists first rest,
        CheckpointDecoder.decodeCarrier? program dispatcher.tree
            (actionAccumulator program (registers.phase, bit) carrier) =
          some (first :: rest)) :
      TraversableParents program dispatcher
        (SchedulerRootContinuation.freshContinuationParents program dispatcher
          registers bit bits carrier parents)
        (layers + 1)
  | marked
      {parents : List ParentFrame} {layers : Nat}
      (outer : TraversableParents program dispatcher parents layers)
      (registers : SchedulerControl.Registers program) (bit : Bool)
      (bits : List Bool) (carrier : Term) :
      TraversableParents program dispatcher
        (SchedulerRootContinuation.markedContinuationParents program dispatcher
          registers bit bits carrier parents)
        (layers + 1)

namespace TraversableParents

/-- The fresh-layer certificate supplies the decoder fact required by
the continuation parser. -/
theorem decodedNonempty_of_complete
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {registers : SchedulerControl.Registers program} {bit : Bool}
    {carrier : Term}
    (complete : exists first rest,
      CheckpointDecoder.decodeCarrier? program dispatcher.tree
          (actionAccumulator program (registers.phase, bit) carrier) =
        some (first :: rest)) :
    exists first rest,
      CheckpointDecoder.decodeCarrier? program dispatcher.tree
          (actionAccumulator program (registers.phase, bit) carrier) =
        some (first :: rest) := by
  obtain ⟨first, rest, decoded⟩ := complete
  exact ⟨first, rest, decoded⟩

/-- Forgetting traversal provenance gives the established completed-context
certificate with exactly the same parents and layer count. -/
theorem toCompleted
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {parents : List ParentFrame} {layers : Nat}
    (h : TraversableParents program dispatcher parents layers) :
    SchedulerCompletedContext.CompletedParents program dispatcher parents
      layers := by
  induction h with
  | root => exact SchedulerCompletedContext.CompletedParents.root _ _
  | fresh outer registers bit bits carrier complete ih =>
      exact ih.fresh registers bit bits carrier
  | marked outer registers bit bits carrier ih =>
      exact ih.marked registers bit bits carrier

/-- The Local introduced by a traversable fresh layer is parsed with its
literal completed view. -/
theorem parseLocal?_fresh
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool)
    (bits : List Bool) (continuation carrier : Term) :
    CheckpointDecoder.parseLocal? program dispatcher.tree
        (LocalResponse.completed bits continuation carrier
          (SchedulerResponse.completedRoute program dispatcher registers bit
            carrier)) =
      some (CheckpointDecoder.completedView program
        (dispatcher.route (registers.phase, bit)) (registers.phase, bit)
        (actionAccumulator program (registers.phase, bit) carrier) bits
        continuation) := by
  exact CheckpointDecoder.parseLocal?_completed bits
    (SchedulerResponse.completedRoute_snapshotDispatch program dispatcher
      registers bit carrier)

/-- A fresh completed layer carrying a literal nonempty accumulator is exactly
the fresh-nonempty branch of the executable active-context parser. -/
theorem parseFreshNonempty?_fresh
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool)
    (bits : List Bool) (continuation carrier : Term)
    (nonempty : exists first rest,
      CheckpointDecoder.decodeCarrier? program dispatcher.tree
          (actionAccumulator program (registers.phase, bit) carrier) =
        some (first :: rest)) :
    RootResetPersistentRouteA.parseFreshNonempty? program dispatcher.tree
        (LocalResponse.completed bits continuation carrier
          (SchedulerResponse.completedRoute program dispatcher registers bit
            carrier)) =
      some (CheckpointDecoder.completedView program
        (dispatcher.route (registers.phase, bit)) (registers.phase, bit)
        (actionAccumulator program (registers.phase, bit) carrier) bits
        continuation) := by
  obtain ⟨first, rest, decoded⟩ := nonempty
  simp [RootResetPersistentRouteA.parseFreshNonempty?,
    parseLocal?_fresh, CheckpointDecoder.completedView, decoded]

/-- The Local introduced by a marked layer is parsed by the marked-history
branch with its literal marked view. -/
theorem parseMarkedLocal?_marked
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool)
    (bits : List Bool) (continuation carrier : Term) :
    RootResetReachableStageGrammar.parseMarkedLocal? program dispatcher.tree
        (LocalResponse.markedCompleted bits continuation carrier
          (SchedulerResponse.completedRoute program dispatcher registers bit
            carrier)) =
      some (CheckpointDecoder.markedCompletedView program
        (dispatcher.route (registers.phase, bit)) (registers.phase, bit)
        (actionAccumulator program (registers.phase, bit) carrier) bits
        continuation) := by
  apply RootResetReachableStageGrammar.parseMarkedLocal?_complete
  · exact CheckpointDecoder.parseLocal?_markedCompleted bits
      (SchedulerResponse.completedRoute_snapshotDispatch program dispatcher
        registers bit carrier)
  · rfl

/-- The terminal EMPTY wrapper is the marked constructor at the registered
zero-action bit and is therefore traversable. -/
theorem empty
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {parents : List ParentFrame} {layers : Nat}
    (outer : TraversableParents program dispatcher parents layers)
    (registers : SchedulerControl.Registers program)
    (bits : List Bool) (carrier : Term) :
    TraversableParents program dispatcher
      (SchedulerRootContinuation.emptyContinuationParents program dispatcher
        registers bits carrier parents)
      (layers + 1) := by
  simpa [SchedulerRootContinuation.emptyContinuationParents,
    SchedulerRootContinuation.markedContinuationParents] using
    TraversableParents.marked outer registers false bits carrier

private theorem fuelContextOfParents_fresh
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool)
    (bits : List Bool) (endpoint carrier : Term) (parents : List ParentFrame) :
    SchedulerInvariant.contextOfParents
        (SchedulerRootContinuation.freshContinuationParents program dispatcher
          registers bit bits carrier parents) =
      (SchedulerInvariant.contextOfParents parents).comp
        (RootResetReachableStageGrammar.localContinuationContext
          (LocalResponse.completed bits endpoint carrier
            (SchedulerResponse.completedRoute program dispatcher registers bit
              carrier))) := by
  change
    ((SchedulerInvariant.contextOfParents parents).comp
      (.appRight
        (SchedulerResponse.localContinuationLeft bits (freshHField carrier)
          (SchedulerResponse.completedRoute program dispatcher registers bit
            carrier) carrier) .hole)).comp
        (.appLeft .hole carrier) =
      (SchedulerInvariant.contextOfParents parents).comp
        (.appRight
          (SchedulerResponse.localContinuationLeft bits (freshHField carrier)
            (SchedulerResponse.completedRoute program dispatcher registers bit
              carrier) carrier)
          (.appLeft .hole carrier))
  rw [RootResetRuntimeContextBridge.context_comp_assoc]
  rfl

private theorem fuelContextOfParents_marked
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool)
    (bits : List Bool) (endpoint carrier : Term) (parents : List ParentFrame) :
    SchedulerInvariant.contextOfParents
        (SchedulerRootContinuation.markedContinuationParents program dispatcher
          registers bit bits carrier parents) =
      (SchedulerInvariant.contextOfParents parents).comp
        (RootResetReachableStageGrammar.localContinuationContext
          (LocalResponse.markedCompleted bits endpoint carrier
            (SchedulerResponse.completedRoute program dispatcher registers bit
              carrier))) := by
  change
    ((SchedulerInvariant.contextOfParents parents).comp
      (.appRight
        (SchedulerResponse.localContinuationLeft bits
          (Carrier.markedHField carrier carrier)
          (SchedulerResponse.completedRoute program dispatcher registers bit
            carrier) carrier) .hole)).comp
        (.appLeft .hole carrier) =
      (SchedulerInvariant.contextOfParents parents).comp
        (.appRight
          (SchedulerResponse.localContinuationLeft bits
            (Carrier.markedHField carrier carrier)
            (SchedulerResponse.completedRoute program dispatcher registers bit
              carrier) carrier)
          (.appLeft .hole carrier))
  rw [RootResetRuntimeContextBridge.context_comp_assoc]
  rfl

/-! ## Fuel-aware traversal provenance -/

/-- Completed continuation parents together with the exact local exclusions
needed by the fuel-aware traversal.  At each historical Local the ordinary
fuel-carrier parser must fail before the syntax-derived continuation step is
taken.  The endpoint itself is intentionally unrestricted: it may be the
fuel carrier at which traversal stops. -/
inductive FuelTraversableAt
    (program : CTS.Program) (dispatcher : ActionDispatcher program) :
    (parents : List ParentFrame) -> (layers : Nat) -> Term -> Prop where
  | root (endpoint : Term) :
      FuelTraversableAt program dispatcher [] 0 endpoint
  | fresh
      {parents : List ParentFrame} {layers : Nat}
      (registers : SchedulerControl.Registers program) (bit : Bool)
      (bits : List Bool) (endpoint carrier : Term)
      (complete : exists first rest,
        CheckpointDecoder.decodeCarrier? program dispatcher.tree
            (actionAccumulator program (registers.phase, bit) carrier) =
          some (first :: rest))
      (outer : FuelTraversableAt program dispatcher parents layers
        (LocalResponse.completed bits endpoint carrier
          (SchedulerResponse.completedRoute program dispatcher registers bit
            carrier)))
      (fuelNone : RootResetPersistentFuelCarrier.parse?
        (compileActions program dispatcher.tree)
        (LocalResponse.completed bits endpoint carrier
          (SchedulerResponse.completedRoute program dispatcher registers bit
            carrier)) = none) :
      FuelTraversableAt program dispatcher
        (SchedulerRootContinuation.freshContinuationParents program dispatcher
          registers bit bits carrier parents)
        (layers + 1) endpoint
  | marked
      {parents : List ParentFrame} {layers : Nat}
      (registers : SchedulerControl.Registers program) (bit : Bool)
      (bits : List Bool) (endpoint carrier : Term)
      (outer : FuelTraversableAt program dispatcher parents layers
        (LocalResponse.markedCompleted bits endpoint carrier
          (SchedulerResponse.completedRoute program dispatcher registers bit
            carrier)))
      (fuelNone : RootResetPersistentFuelCarrier.parse?
        (compileActions program dispatcher.tree)
        (LocalResponse.markedCompleted bits endpoint carrier
          (SchedulerResponse.completedRoute program dispatcher registers bit
            carrier)) = none) :
      FuelTraversableAt program dispatcher
        (SchedulerRootContinuation.markedContinuationParents program dispatcher
          registers bit bits carrier parents)
        (layers + 1) endpoint

namespace FuelTraversableAt

/-- Forgetting the fuel-parser exclusions retains the traversable completed
parent certificate. -/
theorem toTraversable
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {parents : List ParentFrame} {layers : Nat} {endpoint : Term}
    (h : FuelTraversableAt program dispatcher parents layers endpoint) :
    TraversableParents program dispatcher parents layers := by
  induction h with
  | root => exact .root
  | fresh registers bit bits endpoint carrier complete outer fuelNone ih =>
      exact .fresh ih registers bit bits carrier complete
  | marked registers bit bits endpoint carrier outer fuelNone ih =>
      exact .marked ih registers bit bits carrier

/-- The fuel-aware parser crosses exactly the certified continuation layers
and reaches the same active endpoint as a direct parse below them. -/
theorem fuelActiveContext_rebuild_active
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {parents : List ParentFrame} {layers : Nat} {endpoint : Term}
    (h : FuelTraversableAt program dispatcher parents layers endpoint) :
    (RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher
        (Cursor.rebuild parents endpoint)).active =
      (RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher
        endpoint).active := by
  induction h with
  | root => rfl
  | @fresh parents layers registers bit bits endpoint carrier complete outer
      fuelNone ih =>
      let localTerm := LocalResponse.completed bits endpoint carrier
        (SchedulerResponse.completedRoute program dispatcher registers bit
          carrier)
      let view := CheckpointDecoder.completedView program
        (dispatcher.route (registers.phase, bit)) (registers.phase, bit)
        (actionAccumulator program (registers.phase, bit) carrier) bits endpoint
      have localParsed : RootResetPersistentRouteA.parseFreshNonempty? program
          dispatcher.tree localTerm = some view := by
        simpa [localTerm, view] using
          parseFreshNonempty?_fresh program dispatcher registers bit bits
            endpoint carrier (decodedNonempty_of_complete complete)
      have notMarked : RootResetReachableStageGrammar.parseMarkedLocal? program
          dispatcher.tree localTerm = none := by
        have parsed := parseLocal?_fresh program dispatcher registers bit bits
          endpoint carrier
        simp [RootResetReachableStageGrammar.parseMarkedLocal?, localTerm, view,
          parsed, CheckpointDecoder.completedView]
      have nextEq : RootResetPersistentRouteA.next? program dispatcher localTerm =
          some (RootResetPersistentRouteA.freshStep localTerm view) :=
        RootResetPersistentRouteAFuel.next?_freshNonempty notMarked localParsed
      calc
        (RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher
            (Cursor.rebuild
              (SchedulerRootContinuation.freshContinuationParents program
                dispatcher registers bit bits carrier parents) endpoint)).active =
            (RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher
              (Cursor.rebuild parents localTerm)).active := by
                rw [SchedulerCompletedContext.CompletedParents.rebuild_freshContinuationParents]
        _ = (RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher
              localTerm).active := ih
        _ = (RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher
              endpoint).active := by
            rw [RootResetPersistentRouteAFuel.fuelActiveContext, fuelNone,
              nextEq]
            rfl
  | @marked parents layers registers bit bits endpoint carrier outer fuelNone ih =>
      let localTerm := LocalResponse.markedCompleted bits endpoint carrier
        (SchedulerResponse.completedRoute program dispatcher registers bit
          carrier)
      let view := CheckpointDecoder.markedCompletedView program
        (dispatcher.route (registers.phase, bit)) (registers.phase, bit)
        (actionAccumulator program (registers.phase, bit) carrier) bits endpoint
      have markedParsed : RootResetReachableStageGrammar.parseMarkedLocal?
          program dispatcher.tree localTerm = some view := by
        simpa [localTerm, view] using
          parseMarkedLocal?_marked program dispatcher registers bit bits
            endpoint carrier
      have nextEq : RootResetPersistentRouteA.next? program dispatcher localTerm =
          some (RootResetPersistentRouteA.markedStep localTerm view) :=
        RootResetPersistentRouteAFuel.next?_marked markedParsed
      calc
        (RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher
            (Cursor.rebuild
              (SchedulerRootContinuation.markedContinuationParents program
                dispatcher registers bit bits carrier parents) endpoint)).active =
            (RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher
              (Cursor.rebuild parents localTerm)).active := by
                rw [SchedulerCompletedContext.CompletedParents.rebuild_markedContinuationParents]
        _ = (RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher
              localTerm).active := ih
        _ = (RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher
              endpoint).active := by
            rw [RootResetPersistentRouteAFuel.fuelActiveContext, fuelNone,
              nextEq]
            rfl

/-- The fuel-aware parser reconstructs the exact completed-parent context. -/
theorem fuelActiveContext_rebuild_context
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {parents : List ParentFrame} {layers : Nat} {endpoint : Term}
    (h : FuelTraversableAt program dispatcher parents layers endpoint) :
    (RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher
        (Cursor.rebuild parents endpoint)).context =
      (SchedulerInvariant.contextOfParents parents).comp
        (RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher
          endpoint).context := by
  induction h with
  | root => rfl
  | @fresh parents layers registers bit bits endpoint carrier complete outer
      fuelNone ih =>
      let localTerm := LocalResponse.completed bits endpoint carrier
        (SchedulerResponse.completedRoute program dispatcher registers bit
          carrier)
      let view := CheckpointDecoder.completedView program
        (dispatcher.route (registers.phase, bit)) (registers.phase, bit)
        (actionAccumulator program (registers.phase, bit) carrier) bits endpoint
      have localParsed : RootResetPersistentRouteA.parseFreshNonempty? program
          dispatcher.tree localTerm = some view := by
        simpa [localTerm, view] using
          parseFreshNonempty?_fresh program dispatcher registers bit bits
            endpoint carrier (decodedNonempty_of_complete complete)
      have notMarked : RootResetReachableStageGrammar.parseMarkedLocal? program
          dispatcher.tree localTerm = none := by
        have parsed := parseLocal?_fresh program dispatcher registers bit bits
          endpoint carrier
        simp [RootResetReachableStageGrammar.parseMarkedLocal?, localTerm, view,
          parsed, CheckpointDecoder.completedView]
      have nextEq : RootResetPersistentRouteA.next? program dispatcher localTerm =
          some (RootResetPersistentRouteA.freshStep localTerm view) :=
        RootResetPersistentRouteAFuel.next?_freshNonempty notMarked localParsed
      calc
        (RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher
            (Cursor.rebuild
              (SchedulerRootContinuation.freshContinuationParents program
                dispatcher registers bit bits carrier parents) endpoint)).context =
            (RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher
              (Cursor.rebuild parents localTerm)).context := by
                rw [SchedulerCompletedContext.CompletedParents.rebuild_freshContinuationParents]
        _ = (SchedulerInvariant.contextOfParents parents).comp
              (RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher
                localTerm).context := ih
        _ = (SchedulerInvariant.contextOfParents parents).comp
              ((RootResetReachableStageGrammar.localContinuationContext localTerm).comp
                (RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher
                  endpoint).context) := by
            rw [RootResetPersistentRouteAFuel.fuelActiveContext, fuelNone,
              nextEq]
            rfl
        _ = (SchedulerInvariant.contextOfParents
              (SchedulerRootContinuation.freshContinuationParents program
                dispatcher registers bit bits carrier parents)).comp
              (RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher
                endpoint).context := by
            rw [fuelContextOfParents_fresh program dispatcher registers bit bits
              endpoint carrier parents]
            rw [RootResetRuntimeContextBridge.context_comp_assoc]
  | @marked parents layers registers bit bits endpoint carrier outer fuelNone ih =>
      let localTerm := LocalResponse.markedCompleted bits endpoint carrier
        (SchedulerResponse.completedRoute program dispatcher registers bit
          carrier)
      let view := CheckpointDecoder.markedCompletedView program
        (dispatcher.route (registers.phase, bit)) (registers.phase, bit)
        (actionAccumulator program (registers.phase, bit) carrier) bits endpoint
      have markedParsed : RootResetReachableStageGrammar.parseMarkedLocal?
          program dispatcher.tree localTerm = some view := by
        simpa [localTerm, view] using
          parseMarkedLocal?_marked program dispatcher registers bit bits
            endpoint carrier
      have nextEq : RootResetPersistentRouteA.next? program dispatcher localTerm =
          some (RootResetPersistentRouteA.markedStep localTerm view) :=
        RootResetPersistentRouteAFuel.next?_marked markedParsed
      calc
        (RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher
            (Cursor.rebuild
              (SchedulerRootContinuation.markedContinuationParents program
                dispatcher registers bit bits carrier parents) endpoint)).context =
            (RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher
              (Cursor.rebuild parents localTerm)).context := by
                rw [SchedulerCompletedContext.CompletedParents.rebuild_markedContinuationParents]
        _ = (SchedulerInvariant.contextOfParents parents).comp
              (RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher
                localTerm).context := ih
        _ = (SchedulerInvariant.contextOfParents parents).comp
              ((RootResetReachableStageGrammar.localContinuationContext localTerm).comp
                (RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher
                  endpoint).context) := by
            rw [RootResetPersistentRouteAFuel.fuelActiveContext, fuelNone,
              nextEq]
            rfl
        _ = (SchedulerInvariant.contextOfParents
              (SchedulerRootContinuation.markedContinuationParents program
                dispatcher registers bit bits carrier parents)).comp
              (RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher
                endpoint).context := by
            rw [fuelContextOfParents_marked program dispatcher registers bit bits
              endpoint carrier parents]
            rw [RootResetRuntimeContextBridge.context_comp_assoc]

/-- The fuel-aware parser's address is the completed-parent address followed
by the address recovered inside the supplied endpoint. -/
theorem fuelActiveContext_rebuild_address
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {parents : List ParentFrame} {layers : Nat} {endpoint : Term}
    (h : FuelTraversableAt program dispatcher parents layers endpoint) :
    (RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher
        (Cursor.rebuild parents endpoint)).address =
      RootResetSelectorContract.contextAddress
          (SchedulerInvariant.contextOfParents parents) ++
        (RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher
          endpoint).address := by
  have contextEq := h.fuelActiveContext_rebuild_context
  have wholeFacts := RootResetPersistentRouteAFuel.fuelActiveContext_source_and_address
    program dispatcher (Cursor.rebuild parents endpoint)
  have innerFacts := RootResetPersistentRouteAFuel.fuelActiveContext_source_and_address
    program dispatcher endpoint
  calc
    (RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher
        (Cursor.rebuild parents endpoint)).address =
        RootResetSelectorContract.contextAddress
          (RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher
            (Cursor.rebuild parents endpoint)).context := wholeFacts.2.symm
    _ = RootResetSelectorContract.contextAddress
          ((SchedulerInvariant.contextOfParents parents).comp
            (RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher
              endpoint).context) := congrArg _ contextEq
    _ = RootResetSelectorContract.contextAddress
          (SchedulerInvariant.contextOfParents parents) ++
        RootResetSelectorContract.contextAddress
          (RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher
            endpoint).context :=
      RootResetSelectorContract.contextAddress_comp _ _
    _ = RootResetSelectorContract.contextAddress
          (SchedulerInvariant.contextOfParents parents) ++
        (RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher
          endpoint).address := by rw [innerFacts.2]

/-- The response parser built on the fuel-aware traversal reaches the same
active endpoint below certified completed parents. -/
theorem responseOuter_rebuild_active
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {parents : List ParentFrame} {layers : Nat} {endpoint : Term}
    (h : FuelTraversableAt program dispatcher parents layers endpoint) :
    (RootResetPersistentResponseSelector.responseOuter program dispatcher
        (Cursor.rebuild parents endpoint)).active =
      (RootResetPersistentResponseSelector.responseOuter program dispatcher
        endpoint).active := by
  unfold RootResetPersistentResponseSelector.responseOuter
  simp only [RootResetPersistentResponseSelector.composeActiveContexts]
  rw [h.fuelActiveContext_rebuild_active]

/-- The response parser retains the exact completed-parent context prefix. -/
theorem responseOuter_rebuild_context
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {parents : List ParentFrame} {layers : Nat} {endpoint : Term}
    (h : FuelTraversableAt program dispatcher parents layers endpoint) :
    (RootResetPersistentResponseSelector.responseOuter program dispatcher
        (Cursor.rebuild parents endpoint)).context =
      (SchedulerInvariant.contextOfParents parents).comp
        (RootResetPersistentResponseSelector.responseOuter program dispatcher
          endpoint).context := by
  unfold RootResetPersistentResponseSelector.responseOuter
  simp only [RootResetPersistentResponseSelector.composeActiveContexts]
  rw [h.fuelActiveContext_rebuild_active,
    h.fuelActiveContext_rebuild_context,
    RootResetRuntimeContextBridge.context_comp_assoc]

/-- The response parser's root-relative address is prefixed by the exact
completed-parent address. -/
theorem responseOuter_rebuild_address
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {parents : List ParentFrame} {layers : Nat} {endpoint : Term}
    (h : FuelTraversableAt program dispatcher parents layers endpoint) :
    (RootResetPersistentResponseSelector.responseOuter program dispatcher
        (Cursor.rebuild parents endpoint)).address =
      RootResetSelectorContract.contextAddress
          (SchedulerInvariant.contextOfParents parents) ++
        (RootResetPersistentResponseSelector.responseOuter program dispatcher
          endpoint).address := by
  unfold RootResetPersistentResponseSelector.responseOuter
  simp only [RootResetPersistentResponseSelector.composeActiveContexts]
  rw [h.fuelActiveContext_rebuild_active,
    h.fuelActiveContext_rebuild_address, List.append_assoc]

end FuelTraversableAt

/-- The zipper frames introduced by a fresh Local are exactly composition
with that Local's literal continuation context. -/
theorem contextOfParents_fresh
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool)
    (bits : List Bool) (endpoint carrier : Term) (parents : List ParentFrame) :
    SchedulerInvariant.contextOfParents
        (SchedulerRootContinuation.freshContinuationParents program dispatcher
          registers bit bits carrier parents) =
      (SchedulerInvariant.contextOfParents parents).comp
        (RootResetReachableStageGrammar.localContinuationContext
          (LocalResponse.completed bits endpoint carrier
            (SchedulerResponse.completedRoute program dispatcher registers bit
              carrier))) := by
  change
    ((SchedulerInvariant.contextOfParents parents).comp
      (.appRight
        (SchedulerResponse.localContinuationLeft bits (freshHField carrier)
          (SchedulerResponse.completedRoute program dispatcher registers bit
            carrier) carrier) .hole)).comp
        (.appLeft .hole carrier) =
      (SchedulerInvariant.contextOfParents parents).comp
        (.appRight
          (SchedulerResponse.localContinuationLeft bits (freshHField carrier)
            (SchedulerResponse.completedRoute program dispatcher registers bit
              carrier) carrier)
          (.appLeft .hole carrier))
  rw [RootResetRuntimeContextBridge.context_comp_assoc]
  rfl

/-- The marked continuation frames have the same literal context equation. -/
theorem contextOfParents_marked
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool)
    (bits : List Bool) (endpoint carrier : Term) (parents : List ParentFrame) :
    SchedulerInvariant.contextOfParents
        (SchedulerRootContinuation.markedContinuationParents program dispatcher
          registers bit bits carrier parents) =
      (SchedulerInvariant.contextOfParents parents).comp
        (RootResetReachableStageGrammar.localContinuationContext
          (LocalResponse.markedCompleted bits endpoint carrier
            (SchedulerResponse.completedRoute program dispatcher registers bit
              carrier))) := by
  change
    ((SchedulerInvariant.contextOfParents parents).comp
      (.appRight
        (SchedulerResponse.localContinuationLeft bits
          (Carrier.markedHField carrier carrier)
          (SchedulerResponse.completedRoute program dispatcher registers bit
            carrier) carrier) .hole)).comp
        (.appLeft .hole carrier) =
      (SchedulerInvariant.contextOfParents parents).comp
        (.appRight
          (SchedulerResponse.localContinuationLeft bits
            (Carrier.markedHField carrier carrier)
            (SchedulerResponse.completedRoute program dispatcher registers bit
              carrier) carrier)
          (.appLeft .hole carrier))
  rw [RootResetRuntimeContextBridge.context_comp_assoc]
  rfl

/-- The executable Route-A traversal crosses every certified completed parent
and reaches the same active endpoint as a direct parse of the supplied term. -/
theorem activeContext_rebuild_active
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {parents : List ParentFrame} {layers : Nat}
    (h : TraversableParents program dispatcher parents layers)
    (endpoint : Term) :
    (RootResetPersistentRouteA.activeContext program dispatcher
        (Cursor.rebuild parents endpoint)).active =
      (RootResetPersistentRouteA.activeContext program dispatcher endpoint).active := by
  induction h generalizing endpoint with
  | root => rfl
  | @fresh parents layers outer registers bit bits carrier complete ih =>
      let localTerm := LocalResponse.completed bits endpoint carrier
        (SchedulerResponse.completedRoute program dispatcher registers bit
          carrier)
      let view := CheckpointDecoder.completedView program
        (dispatcher.route (registers.phase, bit)) (registers.phase, bit)
        (actionAccumulator program (registers.phase, bit) carrier) bits endpoint
      have localParsed : RootResetPersistentRouteA.parseFreshNonempty? program
          dispatcher.tree localTerm = some view := by
        simpa [localTerm, view] using
          parseFreshNonempty?_fresh program dispatcher registers bit bits
            endpoint carrier (decodedNonempty_of_complete complete)
      have notMarked : RootResetReachableStageGrammar.parseMarkedLocal? program
          dispatcher.tree localTerm = none := by
        have parsed := parseLocal?_fresh program dispatcher registers bit bits
          endpoint carrier
        simp [RootResetReachableStageGrammar.parseMarkedLocal?, localTerm, view,
          parsed, CheckpointDecoder.completedView]
      have nextEq : RootResetPersistentRouteA.next? program dispatcher localTerm =
          some (RootResetPersistentRouteA.freshStep localTerm view) :=
        RootResetPersistentRouteAFuel.next?_freshNonempty notMarked localParsed
      calc
        (RootResetPersistentRouteA.activeContext program dispatcher
            (Cursor.rebuild
              (SchedulerRootContinuation.freshContinuationParents program
                dispatcher registers bit bits carrier parents) endpoint)).active =
            (RootResetPersistentRouteA.activeContext program dispatcher
              (Cursor.rebuild parents localTerm)).active := by
                rw [SchedulerCompletedContext.CompletedParents.rebuild_freshContinuationParents]
        _ = (RootResetPersistentRouteA.activeContext program dispatcher
              localTerm).active := ih localTerm
        _ = (RootResetPersistentRouteA.activeContext program dispatcher
              endpoint).active := by
            rw [RootResetPersistentRouteA.activeContext, nextEq]
            rfl
  | @marked parents layers outer registers bit bits carrier ih =>
      let localTerm := LocalResponse.markedCompleted bits endpoint carrier
        (SchedulerResponse.completedRoute program dispatcher registers bit
          carrier)
      let view := CheckpointDecoder.markedCompletedView program
        (dispatcher.route (registers.phase, bit)) (registers.phase, bit)
        (actionAccumulator program (registers.phase, bit) carrier) bits endpoint
      have markedParsed : RootResetReachableStageGrammar.parseMarkedLocal?
          program dispatcher.tree localTerm = some view := by
        simpa [localTerm, view] using
          parseMarkedLocal?_marked program dispatcher registers bit bits
            endpoint carrier
      have nextEq : RootResetPersistentRouteA.next? program dispatcher localTerm =
          some (RootResetPersistentRouteA.markedStep localTerm view) :=
        RootResetPersistentRouteAFuel.next?_marked markedParsed
      calc
        (RootResetPersistentRouteA.activeContext program dispatcher
            (Cursor.rebuild
              (SchedulerRootContinuation.markedContinuationParents program
                dispatcher registers bit bits carrier parents) endpoint)).active =
            (RootResetPersistentRouteA.activeContext program dispatcher
              (Cursor.rebuild parents localTerm)).active := by
                rw [SchedulerCompletedContext.CompletedParents.rebuild_markedContinuationParents]
        _ = (RootResetPersistentRouteA.activeContext program dispatcher
              localTerm).active := ih localTerm
        _ = (RootResetPersistentRouteA.activeContext program dispatcher
              endpoint).active := by
            rw [RootResetPersistentRouteA.activeContext, nextEq]
            rfl

/-- The active-context parser recovers the exact one-hole context represented
by the traversable parent stack, composed with whatever context it finds below
that stack. -/
theorem activeContext_rebuild_context
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {parents : List ParentFrame} {layers : Nat}
    (h : TraversableParents program dispatcher parents layers)
    (endpoint : Term) :
    (RootResetPersistentRouteA.activeContext program dispatcher
        (Cursor.rebuild parents endpoint)).context =
      (SchedulerInvariant.contextOfParents parents).comp
        (RootResetPersistentRouteA.activeContext program dispatcher
          endpoint).context := by
  induction h generalizing endpoint with
  | root => rfl
  | @fresh parents layers outer registers bit bits carrier complete ih =>
      let localTerm := LocalResponse.completed bits endpoint carrier
        (SchedulerResponse.completedRoute program dispatcher registers bit
          carrier)
      let view := CheckpointDecoder.completedView program
        (dispatcher.route (registers.phase, bit)) (registers.phase, bit)
        (actionAccumulator program (registers.phase, bit) carrier) bits endpoint
      have localParsed : RootResetPersistentRouteA.parseFreshNonempty? program
          dispatcher.tree localTerm = some view := by
        simpa [localTerm, view] using
          parseFreshNonempty?_fresh program dispatcher registers bit bits
            endpoint carrier (decodedNonempty_of_complete complete)
      have notMarked : RootResetReachableStageGrammar.parseMarkedLocal? program
          dispatcher.tree localTerm = none := by
        have parsed := parseLocal?_fresh program dispatcher registers bit bits
          endpoint carrier
        simp [RootResetReachableStageGrammar.parseMarkedLocal?, localTerm, view,
          parsed, CheckpointDecoder.completedView]
      have nextEq : RootResetPersistentRouteA.next? program dispatcher localTerm =
          some (RootResetPersistentRouteA.freshStep localTerm view) :=
        RootResetPersistentRouteAFuel.next?_freshNonempty notMarked localParsed
      calc
        (RootResetPersistentRouteA.activeContext program dispatcher
            (Cursor.rebuild
              (SchedulerRootContinuation.freshContinuationParents program
                dispatcher registers bit bits carrier parents) endpoint)).context =
            (RootResetPersistentRouteA.activeContext program dispatcher
              (Cursor.rebuild parents localTerm)).context := by
                rw [SchedulerCompletedContext.CompletedParents.rebuild_freshContinuationParents]
        _ = (SchedulerInvariant.contextOfParents parents).comp
              (RootResetPersistentRouteA.activeContext program dispatcher
                localTerm).context := ih localTerm
        _ = (SchedulerInvariant.contextOfParents parents).comp
              ((RootResetReachableStageGrammar.localContinuationContext localTerm).comp
                (RootResetPersistentRouteA.activeContext program dispatcher
                  endpoint).context) := by
            rw [RootResetPersistentRouteA.activeContext, nextEq]
            rfl
        _ = (SchedulerInvariant.contextOfParents
              (SchedulerRootContinuation.freshContinuationParents program
                dispatcher registers bit bits carrier parents)).comp
              (RootResetPersistentRouteA.activeContext program dispatcher
                endpoint).context := by
            rw [contextOfParents_fresh program dispatcher registers bit bits
              endpoint carrier parents]
            rw [RootResetRuntimeContextBridge.context_comp_assoc]
  | @marked parents layers outer registers bit bits carrier ih =>
      let localTerm := LocalResponse.markedCompleted bits endpoint carrier
        (SchedulerResponse.completedRoute program dispatcher registers bit
          carrier)
      let view := CheckpointDecoder.markedCompletedView program
        (dispatcher.route (registers.phase, bit)) (registers.phase, bit)
        (actionAccumulator program (registers.phase, bit) carrier) bits endpoint
      have markedParsed : RootResetReachableStageGrammar.parseMarkedLocal?
          program dispatcher.tree localTerm = some view := by
        simpa [localTerm, view] using
          parseMarkedLocal?_marked program dispatcher registers bit bits
            endpoint carrier
      have nextEq : RootResetPersistentRouteA.next? program dispatcher localTerm =
          some (RootResetPersistentRouteA.markedStep localTerm view) :=
        RootResetPersistentRouteAFuel.next?_marked markedParsed
      calc
        (RootResetPersistentRouteA.activeContext program dispatcher
            (Cursor.rebuild
              (SchedulerRootContinuation.markedContinuationParents program
                dispatcher registers bit bits carrier parents) endpoint)).context =
            (RootResetPersistentRouteA.activeContext program dispatcher
              (Cursor.rebuild parents localTerm)).context := by
                rw [SchedulerCompletedContext.CompletedParents.rebuild_markedContinuationParents]
        _ = (SchedulerInvariant.contextOfParents parents).comp
              (RootResetPersistentRouteA.activeContext program dispatcher
                localTerm).context := ih localTerm
        _ = (SchedulerInvariant.contextOfParents parents).comp
              ((RootResetReachableStageGrammar.localContinuationContext localTerm).comp
                (RootResetPersistentRouteA.activeContext program dispatcher
                  endpoint).context) := by
            rw [RootResetPersistentRouteA.activeContext, nextEq]
            rfl
        _ = (SchedulerInvariant.contextOfParents
              (SchedulerRootContinuation.markedContinuationParents program
                dispatcher registers bit bits carrier parents)).comp
              (RootResetPersistentRouteA.activeContext program dispatcher
                endpoint).context := by
            rw [contextOfParents_marked program dispatcher registers bit bits
              endpoint carrier parents]
            rw [RootResetRuntimeContextBridge.context_comp_assoc]

/-- The parser's root-relative address is the exact zipper-context address
followed by the address recovered inside the supplied endpoint. -/
theorem activeContext_rebuild_address
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {parents : List ParentFrame} {layers : Nat}
    (h : TraversableParents program dispatcher parents layers)
    (endpoint : Term) :
    (RootResetPersistentRouteA.activeContext program dispatcher
        (Cursor.rebuild parents endpoint)).address =
      RootResetSelectorContract.contextAddress
          (SchedulerInvariant.contextOfParents parents) ++
        (RootResetPersistentRouteA.activeContext program dispatcher
          endpoint).address := by
  have contextEq := h.activeContext_rebuild_context endpoint
  have wholeSound := RootResetPersistentRouteA.activeContext_sound program
    dispatcher (Cursor.rebuild parents endpoint)
  have innerSound := RootResetPersistentRouteA.activeContext_sound program
    dispatcher endpoint
  calc
    (RootResetPersistentRouteA.activeContext program dispatcher
        (Cursor.rebuild parents endpoint)).address =
        RootResetSelectorContract.contextAddress
          (RootResetPersistentRouteA.activeContext program dispatcher
            (Cursor.rebuild parents endpoint)).context :=
      (RootResetPersistentRouteA.Describes.contextAddress_eq wholeSound).symm
    _ = RootResetSelectorContract.contextAddress
          ((SchedulerInvariant.contextOfParents parents).comp
            (RootResetPersistentRouteA.activeContext program dispatcher
              endpoint).context) := congrArg _ contextEq
    _ = RootResetSelectorContract.contextAddress
          (SchedulerInvariant.contextOfParents parents) ++
        RootResetSelectorContract.contextAddress
          (RootResetPersistentRouteA.activeContext program dispatcher
            endpoint).context :=
      RootResetSelectorContract.contextAddress_comp _ _
    _ = RootResetSelectorContract.contextAddress
          (SchedulerInvariant.contextOfParents parents) ++
        (RootResetPersistentRouteA.activeContext program dispatcher
          endpoint).address := by
      rw [RootResetPersistentRouteA.Describes.contextAddress_eq innerSound]

end TraversableParents

end PureSFormal.Research.RootResetTraversableCompletedParents
