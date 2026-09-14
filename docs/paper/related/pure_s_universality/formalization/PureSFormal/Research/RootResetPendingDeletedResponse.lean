import PureSFormal.Research.RootResetPendingCompletedResponse

/-!
# FRAME handoff after a completed response loses its next live front

Public Local parsing preserves the independently retained audit fields.
After the next C4 raises the accumulator tombstone excess from one to two,
the selector contracts the innermost enclosing pending FRAME. Both empty
and nonempty remaining data are covered for an empty emitted appendant;
the empty-data branch applies to every emitted appendant.
-/

namespace PureSFormal.Research.RootResetPendingDeletedResponse

open PureSFormal.PureS
open RootResetPersistentResponseSelector
open RootResetWrappedFrameSelectorProof
open RootResetClockFuelStages
open RootResetClockFuelCanonicalGrammar
open RootResetEmptyHandoffContext
open RootResetEmptyPostMarkerHandoff
open RootResetPendingCompletedResponse
open RootResetReachableStageGrammar

def freshParsedOuter {program : CTS.Program} (term : Term) (view : CheckpointDecoder.LocalView program) :
    RootResetPersistentRouteA.ActiveContext program :=
  ⟨view.continuation, localContinuationContext term, [.right, .left], [.freshNonemptyContinuation], [view]⟩

theorem freshLocal_next
    {program : CTS.Program} (dispatcher : ActionDispatcher program)
    {term : Term} {view : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program dispatcher.tree term = some view)
    (fresh : view.status = .fresh)
    (nonempty : ∃ first rest, CheckpointDecoder.decodeCarrier? program dispatcher.tree view.accumulator = some (first :: rest)) :
    RootResetPersistentRouteA.next? program dispatcher term =
      some (RootResetPersistentRouteA.freshStep term view) := by
  obtain ⟨first, rest, decoded⟩ := nonempty
  rw [RootResetPersistentRouteA.next?, parseMarkedLocal?, parsed]
  dsimp only
  rw [fresh]
  rw [RootResetPersistentRouteA.parseFreshNonempty?, parsed]
  dsimp only
  rw [fresh, decoded]
  rfl

theorem freshLocal_nonempty_contexts
    {program : CTS.Program} (dispatcher : ActionDispatcher program)
    {term : Term} {view : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program dispatcher.tree term = some view)
    (fresh : view.status = .fresh)
    (nonempty : ∃ first rest, CheckpointDecoder.decodeCarrier? program dispatcher.tree view.accumulator = some (first :: rest))
    (activeRoot : RootResetPersistentRouteA.activeContext program dispatcher view.continuation =
      ⟨view.continuation, .hole, [], [], []⟩)
    (fuelRoot : RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher view.continuation =
      ⟨view.continuation, .hole, [], [], []⟩)
    (responseRoot : responseOuter program dispatcher view.continuation =
      ⟨view.continuation, .hole, [], [], []⟩) :
    RootResetPersistentRouteA.activeContext program dispatcher term = freshParsedOuter term view ∧
      RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher term = freshParsedOuter term view ∧
      responseOuter program dispatcher term = freshParsedOuter term view := by
  have next := freshLocal_next dispatcher parsed fresh nonempty
  have fuelNone := RootResetEmptyResponseSelectorChain.fuelParse_none_of_localShape
    (CheckpointDecoder.parseLocal?_sound parsed)
  have active : RootResetPersistentRouteA.activeContext program dispatcher term = freshParsedOuter term view := by
    rw [RootResetPersistentRouteA.activeContext, next]
    dsimp only [RootResetPersistentRouteA.freshStep]
    rw [activeRoot]
    simp only [RootResetPersistentRouteA.wrapOuter, freshParsedOuter,
      RootResetRuntimeContextBridge.context_comp_hole, List.append_nil]
  have fuel : RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher term = freshParsedOuter term view := by
    rw [RootResetPersistentRouteAFuel.fuelActiveContext, fuelNone, next]
    dsimp only [RootResetPersistentRouteA.freshStep]
    rw [fuelRoot]
    simp only [RootResetPersistentRouteA.wrapOuter, freshParsedOuter,
      RootResetRuntimeContextBridge.context_comp_hole, List.append_nil]
  refine ⟨active, fuel, ?_⟩
  have descent : responseDescentContext program dispatcher view.continuation =
      ⟨view.continuation, .hole, [], [], []⟩ := by
    rw [responseOuter, fuelRoot] at responseRoot
    simpa only [composeActiveContexts, Context.comp, List.nil_append] using responseRoot
  rw [responseOuter, fuel]
  dsimp only [freshParsedOuter]
  rw [descent]
  simp only [composeActiveContexts, freshParsedOuter,
    RootResetRuntimeContextBridge.context_comp_hole, List.append_nil]

theorem pending_freshLocal_exit_contexts
    {program : CTS.Program} (dispatcher : ActionDispatcher program)
    {term : Term} {view : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program dispatcher.tree term = some view)
    (fresh : view.status = .fresh)
    (nonempty : ∃ first rest, CheckpointDecoder.decodeCarrier? program dispatcher.tree view.accumulator = some (first :: rest))
    (bits : List Bool) (horizon remaining : Nat) (bound : remaining ≤ horizon)
    (continuation : view.continuation = exitTerm program dispatcher horizon remaining bits)
    (outerBits : List Bool) (outerContinuation : Term) (count : Nat) :
    let source := pending (compileActions program dispatcher.tree) outerBits outerContinuation count term
    let outer := composeActiveContexts
      (pendingOuter program (compileActions program dispatcher.tree) outerBits outerContinuation term count)
      (freshParsedOuter term view)
    RootResetPersistentRouteA.activeContext program dispatcher source = outer ∧
      RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher source = outer ∧
      responseOuter program dispatcher source = outer := by
  dsimp only
  have roots := exit_contexts program dispatcher horizon remaining bits bound
  rw [← continuation] at roots
  have inner := freshLocal_nonempty_contexts dispatcher parsed fresh nonempty roots.1 roots.2.1 roots.2.2
  have registered := registry_freshLocal_exists parsed fresh
  have fuelNone := pending_local_fuel_none dispatcher outerBits outerContinuation
    (CheckpointDecoder.parseLocal?_sound parsed)
  constructor
  · rw [activeContext_pending_lift _ _ _ _ _ registered count, inner.1]
  constructor
  · rw [fuelActiveContext_pending_lift _ _ _ _ _ registered fuelNone count, inner.2.1]
  · rw [responseOuter_pending_lift _ _ _ _ _ registered fuelNone count, inner.2.2]

theorem pending_freshLocal_exit_root
    {program : CTS.Program} (dispatcher : ActionDispatcher program)
    {term : Term} {view : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program dispatcher.tree term = some view)
    (fresh : view.status = .fresh)
    (nonempty : ∃ first rest, CheckpointDecoder.decodeCarrier? program dispatcher.tree view.accumulator = some (first :: rest))
    (bits : List Bool) (horizon remaining : Nat) (bound : remaining ≤ horizon)
    (continuation : view.continuation = exitTerm program dispatcher horizon remaining bits)
    (outerBits : List Bool) (outerContinuation : Term) (count : Nat) :
    let source := pending (compileActions program dispatcher.tree) outerBits outerContinuation count term
    freshResponseRoot? program dispatcher source = some (rights count, term) ∧
      pendingBeforeFresh? (RootResetPersistentRouteA.activeContext program dispatcher source).roles = some count := by
  dsimp only
  have contexts := pending_freshLocal_exit_contexts dispatcher parsed fresh nonempty bits horizon remaining bound
    continuation outerBits outerContinuation count
  constructor
  · rw [freshResponseRoot?, contexts.1]
    dsimp only [composeActiveContexts, pendingOuter, freshParsedOuter]
    rw [addressBeforeFresh?_pending_fresh]
    dsimp only [Option.bind]
    rw [pending_subterm_rights]
    rfl
  · rw [contexts.1]
    exact pendingBeforeFresh?_pending_fresh count

theorem rights_dropLast (count : Nat) : (rights (count + 1)).dropLast = rights count := by
  induction count with
  | zero => rfl
  | succ count ih => exact congrArg (Direction.right :: ·) ih

theorem pending_contract_FRAME (actions : Term) (bits : List Bool)
    (continuation term : Term) (count : Nat) :
    (pending actions bits continuation (count + 1) term).contractAt? (rights count) =
      some (pending actions bits continuation count
        (SchedulerResponseInvariant.frameFirstRoot actions bits continuation term)) := by
  have root : (frame (environmentCode actions bits) continuation term).contractAt? [] =
      some (SchedulerResponseInvariant.frameFirstRoot actions bits continuation term) := rfl
  have contracts := pending_contractAt actions bits continuation root count
  rw [List.append_nil, ← pending_succ_innermost] at contracts
  exact contracts

theorem pending_nonempty_deleted_emptyAppendant_selects_FRAME
    {program : CTS.Program} (dispatcher : ActionDispatcher program)
    {term : Term} {view : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program dispatcher.tree term = some view)
    (fresh : view.status = .fresh)
    (nonempty : ∃ first rest, CheckpointDecoder.decodeCarrier? program dispatcher.tree view.accumulator = some (first :: rest))
    (emptyAppendant : PrimitiveLocalResponse.emitted program view.label = [])
    (bits : List Bool) (horizon remaining : Nat) (bound : remaining ≤ horizon)
    (continuation : view.continuation = exitTerm program dispatcher horizon remaining bits)
    (locals : Nat)
    (localCount : carrierLocalCount? program dispatcher.tree view.accumulator = some locals)
    (tombCount : carrierTombstoneCount? program dispatcher.tree view.accumulator = some (locals + 2))
    (outerBits : List Bool) (outerContinuation : Term) (count : Nat) :
    selectStep? program dispatcher
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation (count + 1) term) =
      some (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (SchedulerResponseInvariant.frameFirstRoot (compileActions program dispatcher.tree) outerBits outerContinuation term)) := by
  let source := pending (compileActions program dispatcher.tree) outerBits outerContinuation (count + 1) term
  let target := pending (compileActions program dispatcher.tree) outerBits outerContinuation count
    (SchedulerResponseInvariant.frameFirstRoot (compileActions program dispatcher.tree) outerBits outerContinuation term)
  have contexts := pending_freshLocal_exit_contexts dispatcher parsed fresh nonempty bits horizon remaining bound
    continuation outerBits outerContinuation (count + 1)
  have roots := pending_freshLocal_exit_root dispatcher parsed fresh nonempty bits horizon remaining bound
    continuation outerBits outerContinuation (count + 1)
  have diff : locals + 2 ≠ locals + 1 := by
    intro equal
    have impossible := Nat.add_left_cancel equal
    cases impossible
  have carrierAddress : responseCarrierAddress? program dispatcher source = some (rights count) := by
    rw [responseCarrierAddress?, roots.1]
    dsimp only [Option.bind]
    rw [roots.2]
    dsimp only
    rw [parsed]
    dsimp only [Option.bind]
    rw [if_pos emptyAppendant, localCount, tombCount]
    dsimp only
    rw [if_neg diff, if_pos rfl, rights_dropLast]
  have carrierSelection : responseCarrierSelection? program dispatcher source = some ⟨rights count, target⟩ := by
    rw [responseCarrierSelection?, carrierAddress]
    dsimp only [Option.bind]
    rw [checkedAt?, RootResetPersistentRouteAFuel.checkedSelection?, pending_contract_FRAME]
  have appenderNone : responseAppenderSelection? program dispatcher source = none := by
    rw [responseAppenderSelection?, responseAppenderAddress?, roots.1]
    dsimp only [Option.bind]
    rw [appender_none_of_completed_emptyAppendant parsed emptyAppendant]
  have freshNone : freshDispatcherSelection? program dispatcher source = none := by
    rw [freshDispatcherSelection?, contexts.2.2]
    dsimp (config := { instances := true }) only [composeActiveContexts, freshParsedOuter]
    rw [continuation, exit_freshCall_false]
    rfl
  have fuelNone : (RootResetPersistentRouteAFuel.classifyHandoff program dispatcher source).fuel = none := by
    rw [RootResetPersistentRouteAFuel.classifyHandoff, contexts.2.1]
    dsimp only [composeActiveContexts, freshParsedOuter]
    rw [continuation, exit_fuel_none program dispatcher horizon remaining bits bound]
  change selectStep? program dispatcher source = some target
  rw [selectStep?, classify, fuelNone]
  dsimp only
  rw [classifyAfterFuel, freshNone, appenderNone, carrierSelection]
  rfl

theorem activated_chosenRoot
    {Label : Type} {encode : Label → Term} {tree : Dispatcher.Tree Label}
    {route : Dispatcher.Route} {label : Label} {response result : Term}
    (shape : RouteGrammar.ActivatedRoute encode tree route label response result) :
    ∃ audit payload, result = chosen audit payload := by
  cases shape <;> exact ⟨_, _, rfl⟩

theorem completed_freshCall_false
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program tree term = some view) :
    parseFreshDispatcherCall? program tree term = false := by
  rcases CheckpointDecoder.parseLocal?_sound parsed with
    ⟨haltField, dispatcherTerm, seedAudit, continuationAudit, halt, dispatch, sourceEq⟩
  rcases dispatch with ⟨response, histories, route, action⟩
  have chosenRoot := activated_chosenRoot route
  obtain ⟨audit, payload, routeEq⟩ := chosenRoot
  rw [sourceEq, routeEq]
  simp [parseFreshDispatcherCall?, CheckpointDecoder.openShell, chosen,
    RootResetEmptyRouteSelectorChain.compileActions_ne_s_app]

theorem local_pending_none
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program tree term = some view) :
    RootResetStageRegistry.parsePending? term = none := by
  have arity := CheckpointDecoder.parseLocal?_headArity parsed
  cases term with
  | s => rfl
  | app fn arg =>
      apply PendingFrame.guard?_none_of_function_headArity_ne_two
      intro equal
      rcases arity with five | six <;> rw [Term.headArity, equal] at *
      all_goals contradiction

theorem local_frame_none
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program tree term = some view) :
    RootResetReachableStageGrammar.parseFrameR0? (compileActions program tree) term = none := by
  cases frameEq : RootResetReachableStageGrammar.parseFrameR0? (compileActions program tree) term with
  | none => rfl
  | some frameView =>
      have arity := CheckpointDecoder.parseLocal?_headArity parsed
      have sourceEq := RootResetReachableStageGrammar.parseFrameR0?_sound frameEq
      rcases arity with five | six
      · rw [sourceEq] at five
        change 3 = 5 at five
        contradiction
      · rw [sourceEq] at six
        change 3 = 6 at six
        contradiction

theorem freshLocal_empty_contexts
    {program : CTS.Program} (dispatcher : ActionDispatcher program)
    {term : Term} {view : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program dispatcher.tree term = some view)
    (fresh : view.status = .fresh)
    (empty : CheckpointDecoder.decodeCarrier? program dispatcher.tree view.accumulator = some []) :
    RootResetPersistentRouteA.activeContext program dispatcher term = ⟨term, .hole, [], [], []⟩ ∧
      RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher term = ⟨term, .hole, [], [], []⟩ ∧
      responseOuter program dispatcher term = ⟨term, .hole, [], [], []⟩ := by
  have markedNone : parseMarkedLocal? program dispatcher.tree term = none := by
    rw [parseMarkedLocal?, parsed]
    dsimp only
    rw [fresh]
    rfl
  have freshNone := RootResetPersistentRouteA.parseFreshNonempty?_none_of_empty parsed fresh empty
  have frameNone := local_frame_none parsed
  have pendingNone := local_pending_none parsed
  have nextNone : RootResetPersistentRouteA.next? program dispatcher term = none := by
    rw [RootResetPersistentRouteA.next?, markedNone, freshNone,
      RootResetPersistentRouteA.parsePendingActive?, frameNone]
    rfl
  have fuelNone := RootResetEmptyResponseSelectorChain.fuelParse_none_of_localShape
    (CheckpointDecoder.parseLocal?_sound parsed)
  have fuel : RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher term = ⟨term, .hole, [], [], []⟩ := by
    rw [RootResetPersistentRouteAFuel.fuelActiveContext, fuelNone, nextNone]
  refine ⟨?_, fuel, ?_⟩
  · rw [RootResetPersistentRouteA.activeContext, nextNone]
  · rw [responseOuter, fuel]
    dsimp only
    rw [responseDescentContext, markedNone, freshNone, pendingNone]
    rfl

theorem pending_freshLocal_empty_contexts
    {program : CTS.Program} (dispatcher : ActionDispatcher program)
    {term : Term} {view : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program dispatcher.tree term = some view)
    (fresh : view.status = .fresh)
    (empty : CheckpointDecoder.decodeCarrier? program dispatcher.tree view.accumulator = some [])
    (outerBits : List Bool) (outerContinuation : Term) (count : Nat) :
    let source := pending (compileActions program dispatcher.tree) outerBits outerContinuation count term
    let outer := pendingOuter program (compileActions program dispatcher.tree) outerBits outerContinuation term count
    RootResetPersistentRouteA.activeContext program dispatcher source = outer ∧
      RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher source = outer ∧
      responseOuter program dispatcher source = outer := by
  dsimp only
  have inner := freshLocal_empty_contexts dispatcher parsed fresh empty
  have registered := registry_freshLocal_exists parsed fresh
  have fuelNone := pending_local_fuel_none dispatcher outerBits outerContinuation
    (CheckpointDecoder.parseLocal?_sound parsed)
  constructor
  · rw [activeContext_pending_lift _ _ _ _ _ registered count, inner.1]
    simp only [composeActiveContexts, pendingOuter,
      RootResetRuntimeContextBridge.context_comp_hole, List.append_nil]
  constructor
  · rw [fuelActiveContext_pending_lift _ _ _ _ _ registered fuelNone count, inner.2.1]
    simp only [composeActiveContexts, pendingOuter,
      RootResetRuntimeContextBridge.context_comp_hole, List.append_nil]
  · rw [responseOuter_pending_lift _ _ _ _ _ registered fuelNone count, inner.2.2]
    simp only [composeActiveContexts, pendingOuter,
      RootResetRuntimeContextBridge.context_comp_hole, List.append_nil]

theorem pending_last (count : Nat) :
    (List.replicate (count + 1) RootResetPersistentRouteA.Role.pendingFrameChild).getLast? =
      some .pendingFrameChild := by
  induction count with
  | zero => rfl
  | succ count ih => exact ih

theorem pending_empty_deleted_selects_FRAME
    {program : CTS.Program} (dispatcher : ActionDispatcher program)
    {term : Term} {view : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program dispatcher.tree term = some view)
    (fresh : view.status = .fresh)
    (empty : CheckpointDecoder.decodeCarrier? program dispatcher.tree view.accumulator = some [])
    (locals : Nat)
    (localCount : carrierLocalCount? program dispatcher.tree view.accumulator = some locals)
    (tombCount : carrierTombstoneCount? program dispatcher.tree view.accumulator = some (locals + 2))
    (outerBits : List Bool) (outerContinuation : Term) (count : Nat) :
    selectStep? program dispatcher
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation (count + 1) term) =
      some (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (SchedulerResponseInvariant.frameFirstRoot (compileActions program dispatcher.tree) outerBits outerContinuation term)) := by
  let source := pending (compileActions program dispatcher.tree) outerBits outerContinuation (count + 1) term
  let target := pending (compileActions program dispatcher.tree) outerBits outerContinuation count
    (SchedulerResponseInvariant.frameFirstRoot (compileActions program dispatcher.tree) outerBits outerContinuation term)
  have contexts := pending_freshLocal_empty_contexts dispatcher parsed fresh empty outerBits outerContinuation (count + 1)
  have rootNone : freshResponseRoot? program dispatcher source = none := by
    rw [freshResponseRoot?, contexts.1]
    dsimp only [pendingOuter]
    rw [RootResetResponseClockFuelAgreement.addressBeforeFresh?_replicate_pendingFrameChild]
    rfl
  have appenderNone : responseAppenderSelection? program dispatcher source = none := by
    rw [responseAppenderSelection?, responseAppenderAddress?, rootNone]
    rfl
  have carrierNone : responseCarrierSelection? program dispatcher source = none := by
    rw [responseCarrierSelection?, responseCarrierAddress?, rootNone]
    rfl
  have completedAddress : completedResponseAddress? program dispatcher source = some (rights count) := by
    rw [completedResponseAddress?, contexts.2.2]
    dsimp (config := { instances := true }) only [pendingOuter]
    rw [RootResetWholeStageClassifier.classifyActive_commit_of_parse [] parsed]
    dsimp only
    rw [parsed]
    dsimp only [Option.bind]
    rw [empty]
    dsimp only
    rw [pending_last, if_pos rfl, localCount, tombCount]
    dsimp only
    rw [if_pos rfl, rights_dropLast]
    rw [if_pos rfl]
  have boundary : responseBoundarySelection? program dispatcher source = some ⟨rights count, target⟩ := by
    rw [responseBoundarySelection?, responseBoundaryAddress?, completedAddress]
    dsimp only [Option.bind]
    rw [checkedAt?, RootResetPersistentRouteAFuel.checkedSelection?, pending_contract_FRAME]
  have freshNone : freshDispatcherSelection? program dispatcher source = none := by
    rw [freshDispatcherSelection?, contexts.2.2]
    dsimp (config := { instances := true }) only [pendingOuter]
    rw [completed_freshCall_false parsed]
    rfl
  have fuelNone : (RootResetPersistentRouteAFuel.classifyHandoff program dispatcher source).fuel = none := by
    rw [RootResetPersistentRouteAFuel.classifyHandoff, contexts.2.1]
    dsimp only [pendingOuter]
    rw [RootResetEmptyResponseSelectorChain.fuelParse_none_of_localShape
      (CheckpointDecoder.parseLocal?_sound parsed)]
  change selectStep? program dispatcher source = some target
  rw [selectStep?, classify, fuelNone]
  dsimp only
  rw [classifyAfterFuel, freshNone, appenderNone, carrierNone, boundary]
  rfl

theorem pending_deleted_emptyAppendant_selects_FRAME
    {program : CTS.Program} (dispatcher : ActionDispatcher program)
    {term : Term} {view : CheckpointDecoder.LocalView program} {decoded : List Bool}
    (parsed : CheckpointDecoder.parseLocal? program dispatcher.tree term = some view)
    (fresh : view.status = .fresh)
    (decodedEq : CheckpointDecoder.decodeCarrier? program dispatcher.tree view.accumulator = some decoded)
    (emptyAppendant : PrimitiveLocalResponse.emitted program view.label = [])
    (bits : List Bool) (horizon remaining : Nat) (bound : remaining ≤ horizon)
    (continuation : view.continuation = exitTerm program dispatcher horizon remaining bits)
    (locals : Nat)
    (localCount : carrierLocalCount? program dispatcher.tree view.accumulator = some locals)
    (tombCount : carrierTombstoneCount? program dispatcher.tree view.accumulator = some (locals + 2))
    (outerBits : List Bool) (outerContinuation : Term) (count : Nat) :
    selectStep? program dispatcher
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation (count + 1) term) =
      some (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (SchedulerResponseInvariant.frameFirstRoot (compileActions program dispatcher.tree) outerBits outerContinuation term)) := by
  cases decoded with
  | nil =>
      exact pending_empty_deleted_selects_FRAME dispatcher parsed fresh decodedEq
        locals localCount tombCount outerBits outerContinuation count
  | cons first rest =>
      exact pending_nonempty_deleted_emptyAppendant_selects_FRAME dispatcher parsed fresh
        ⟨first, rest, decodedEq⟩ emptyAppendant bits horizon remaining bound continuation
        locals localCount tombCount outerBits outerContinuation count

end PureSFormal.Research.RootResetPendingDeletedResponse
