import PureSFormal.Research.RootResetPendingDeletedResponse

/-!
# The next live-front deletion and FRAME handoff after every normal response

Completed fresh Local syntax fixes the final appender row and accumulator
address whenever its emission is nonempty. Combining that exact parse with
the carrier chronology proves the next C4 and following FRAME choice for all
appendants and all positive pending depths. Public Local shapes keep every
retained audit independent throughout these selection equations.
-/

namespace PureSFormal.Research.RootResetPendingResponseFrontHandoff
open PureSFormal.PureS
open RootResetWholeAppenderStages
open RootResetAppenderStages

theorem list_last_split {bits : List Bool} (nonempty : bits ≠ []) :
    ∃ priorBits bit, bits = priorBits ++ [bit] := by
  induction bits with
  | nil => exact (nonempty rfl).elim
  | cons bit rest ih =>
      cases rest with
      | nil => exact ⟨[], bit, rfl⟩
      | cons next rest =>
          obtain ⟨priorBits, last, same⟩ := ih (by intro h; cases h)
          exact ⟨bit :: priorBits, last, congrArg (bit :: ·) same⟩

theorem prefixLeft_append (count : Nat) (first second : Address) :
    ActionParser.prefixLeft count first ++ second = ActionParser.prefixLeft count (first ++ second) := by
  induction count generalizing first with
  | zero => rfl
  | succ count ih => exact ih (.left :: first)

theorem completed_finalAppender_exists
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program tree term = some view)
    (fresh : view.status = .fresh)
    (bits : List Bool) (seed : view.seedPayload = word bits)
    (nonempty : PrimitiveLocalResponse.emitted program view.label ≠ []) :
    ∃ position bit currentHistory histories,
      let appView : ActiveView program := ⟨bits, view.continuation, view.route, view.label,
        .secondFinal position bit view.accumulator currentHistory histories⟩
      parseActive? program tree term = some appView ∧
        appView.focusAddress ++ [.right] = RootResetResponseBoundaryStages.localAccumulatorAddress view := by
  obtain ⟨priorBits, bit, emittedEq⟩ := list_last_split nonempty
  rcases CheckpointDecoder.parseLocal?_sound parsed with
    ⟨haltField, dispatcherTerm, seedAudit, continuationAudit, halt, dispatch, sourceEq⟩
  rcases dispatch with ⟨response, histories, route, action⟩
  have countEq : ActionParser.historyCount program view.label =
      (PrimitiveLocalResponse.emitted program view.label).length := by
    rcases view.label with ⟨phase, chosen⟩
    cases chosen <;> rfl
  have historyLength : histories.length = priorBits.length + 1 := by
    rw [action.1, countEq, emittedEq, List.length_append]
    rfl
  cases histories with
  | nil =>
      have impossible : 0 = priorBits.length + 1 := historyLength
      cases impossible
  | cons currentHistory histories =>
      have positionEq : histories.length = priorBits.length := Nat.succ.inj historyLength
      have rowTerm : response = (Row.secondFinal histories.length bit view.accumulator currentHistory histories).term := action.2
      have valid : (Row.secondFinal histories.length bit view.accumulator currentHistory histories).Valid
          (PrimitiveLocalResponse.emitted program view.label) := by
        constructor
        · rw [positionEq, emittedEq, List.drop_left]
        · rfl
      have appShape : ActiveShape program tree
          ⟨bits, view.continuation, view.route, view.label,
            .secondFinal histories.length bit view.accumulator currentHistory histories⟩ term := by
        refine ⟨haltField, dispatcherTerm, seedAudit, continuationAudit, ?_, ?_, valid, ?_⟩
        · rw [← fresh]
          exact halt
        · rw [← rowTerm]
          exact route
        · rw [← seed]
          exact sourceEq
      refine ⟨histories.length, bit, currentHistory, histories, parseActive?_complete appShape, ?_⟩
      dsimp only [ActiveView.focusAddress, Row.localAddress, historyPrefixAddress,
        RootResetResponseBoundaryStages.localAccumulatorAddress]
      rw [List.append_assoc, List.append_assoc, prefixLeft_append]
      rw [← action.1]
      rfl

open RootResetPersistentResponseSelector
open RootResetPendingDeletedResponse
open RootResetWrappedFrameSelectorProof
open RootResetEmptyHandoffContext
open RootResetEmptyPostMarkerHandoff
open RootResetClockFuelStages

theorem pending_nonempty_deleted_nonemptyAppender_selects_FRAME
    {program : CTS.Program} (dispatcher : ActionDispatcher program)
    {term : Term} {view : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program dispatcher.tree term = some view)
    (fresh : view.status = .fresh)
    (nonempty : ∃ first rest, CheckpointDecoder.decodeCarrier? program dispatcher.tree view.accumulator = some (first :: rest))
    (nonemptyAppendant : PrimitiveLocalResponse.emitted program view.label ≠ [])
    (bits : List Bool) (seed : view.seedPayload = word bits)
    (horizon remaining : Nat) (bound : remaining ≤ horizon)
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
  obtain ⟨position, bit, currentHistory, histories, appParsed, _focusEq⟩ :=
    completed_finalAppender_exists parsed fresh bits seed nonemptyAppendant
  have diff : locals + 2 ≠ locals + 1 := by
    intro equal
    have impossible := Nat.add_left_cancel equal
    cases impossible
  have appAddress : responseAppenderAddress? program dispatcher source = some (rights count) := by
    rw [responseAppenderAddress?, roots.1]
    dsimp only [Option.bind]
    rw [appParsed]
    dsimp only [Option.bind]
    rw [if_neg (show (rights (count + 1)).isEmpty ≠ true from by intro h; cases h), roots.2]
    dsimp only
    rw [localCount, tombCount]
    dsimp only
    rw [if_neg diff, if_pos rfl, rights_dropLast]
  have appSelection : responseAppenderSelection? program dispatcher source = some ⟨rights count, target⟩ := by
    rw [responseAppenderSelection?, appAddress]
    dsimp only [Option.bind]
    rw [checkedAt?, RootResetPersistentRouteAFuel.checkedSelection?, pending_contract_FRAME]
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
  rw [classifyAfterFuel, freshNone, appSelection]
  rfl

theorem pending_deleted_selects_FRAME
    {program : CTS.Program} (dispatcher : ActionDispatcher program)
    {term : Term} {view : CheckpointDecoder.LocalView program} {decoded : List Bool}
    (parsed : CheckpointDecoder.parseLocal? program dispatcher.tree term = some view)
    (fresh : view.status = .fresh)
    (decodedEq : CheckpointDecoder.decodeCarrier? program dispatcher.tree view.accumulator = some decoded)
    (bits : List Bool) (seed : view.seedPayload = word bits)
    (horizon remaining : Nat) (bound : remaining ≤ horizon)
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
  | nil => exact pending_empty_deleted_selects_FRAME dispatcher parsed fresh decodedEq locals localCount tombCount outerBits outerContinuation count
  | cons first rest =>
      by_cases emitted : PrimitiveLocalResponse.emitted program view.label = []
      · exact pending_nonempty_deleted_emptyAppendant_selects_FRAME dispatcher parsed fresh
          ⟨first, rest, decodedEq⟩ emitted bits horizon remaining bound continuation
          locals localCount tombCount outerBits outerContinuation count
      · exact pending_nonempty_deleted_nonemptyAppender_selects_FRAME dispatcher parsed fresh
          ⟨first, rest, decodedEq⟩ emitted bits seed horizon remaining bound continuation
          locals localCount tombCount outerBits outerContinuation count

theorem pending_completed_selects_C4
    {program : CTS.Program} (dispatcher : ActionDispatcher program)
    {term : Term} {view : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program dispatcher.tree term = some view)
    (fresh : view.status = .fresh)
    (nonempty : ∃ first rest, CheckpointDecoder.decodeCarrier? program dispatcher.tree view.accumulator = some (first :: rest))
    (bits : List Bool) (seed : view.seedPayload = word bits)
    (horizon remaining : Nat) (bound : remaining ≤ horizon)
    (continuation : view.continuation = exitTerm program dispatcher horizon remaining bits)
    (locals : Nat)
    (localCount : carrierLocalCount? program dispatcher.tree view.accumulator = some locals)
    (tombCount : carrierTombstoneCount? program dispatcher.tree view.accumulator = some (locals + 1))
    (outerBits : List Bool) (outerContinuation : Term) (count : Nat)
    {nextBit : Bool} {suffix : List Bool} {outerContext : Context}
    (selected : CanonicalTraversal.SelectedFront program dispatcher.tree bits
      (exitTerm program dispatcher horizon remaining bits) term nextBit suffix outerContext) :
    ∃ predecessor,
      term = outerContext.plug (.app (live nextBit) predecessor) ∧
      selectStep? program dispatcher
        (pending (compileActions program dispatcher.tree) outerBits outerContinuation (count + 1) term) =
      some (pending (compileActions program dispatcher.tree) outerBits outerContinuation (count + 1)
        (outerContext.plug (Carrier.tombstone nextBit predecessor predecessor))) := by
  let source := pending (compileActions program dispatcher.tree) outerBits outerContinuation (count + 1) term
  have contexts := pending_freshLocal_exit_contexts dispatcher parsed fresh nonempty bits horizon remaining bound
    continuation outerBits outerContinuation (count + 1)
  have roots := pending_freshLocal_exit_root dispatcher parsed fresh nonempty bits horizon remaining bound
    continuation outerBits outerContinuation (count + 1)
  have admissible := Dovetail.clockExit_admissible horizon remaining
    (environmentCode (compileActions program dispatcher.tree) bits)
  have shape := CheckpointDecoder.parseLocal?_sound parsed
  have baseNone := CheckpointRun.parseBase?_none_of_localShape shape
  have freshNone : freshDispatcherSelection? program dispatcher source = none := by
    rw [freshDispatcherSelection?, contexts.2.2]
    dsimp (config := { instances := true }) only [composeActiveContexts, freshParsedOuter]
    rw [continuation, exit_freshCall_false]
    rfl
  have fuelNone : (RootResetPersistentRouteAFuel.classifyHandoff program dispatcher source).fuel = none := by
    rw [RootResetPersistentRouteAFuel.classifyHandoff, contexts.2.1]
    dsimp only [composeActiveContexts, freshParsedOuter]
    rw [continuation, exit_fuel_none program dispatcher horizon remaining bits bound]
  obtain ⟨predecessor, sourceEq, contracts⟩ :=
    RootResetPersistentCarrierTraversalAgreement.selectedFront_contractAt?_belowParents selected []
  have direct : term.contractAt? (CanonicalTraversal.contextAddress outerContext) =
      some (outerContext.plug (Carrier.tombstone nextBit predecessor predecessor)) := by
    simpa only [RootResetPersistentCarrierTraversalAgreement.selectedFrontAddress,
      RootResetPersistentCarrierTraversalAgreement.selectedFrontTarget,
      SchedulerInvariant.contextOfParents, Context.plug, RootResetSelectorContract.contextAddress,
      List.nil_append, RootResetResponseBoundaryStages.contextAddress_eq_canonical] using! contracts
  have wholeContracts := pending_contractAt (compileActions program dispatcher.tree) outerBits
    outerContinuation direct (count + 1)
  let target := pending (compileActions program dispatcher.tree) outerBits outerContinuation (count + 1)
    (outerContext.plug (Carrier.tombstone nextBit predecessor predecessor))
  have checked : checkedAt? source (rights (count + 1) ++ CanonicalTraversal.contextAddress outerContext) =
      some ⟨rights (count + 1) ++ CanonicalTraversal.contextAddress outerContext, target⟩ := by
    rw [checkedAt?, RootResetPersistentRouteAFuel.checkedSelection?, wholeContracts]
  refine ⟨predecessor, sourceEq, ?_⟩
  change selectStep? program dispatcher source = some target
  by_cases emitted : PrimitiveLocalResponse.emitted program view.label = []
  · have front := RootResetSelectedFrontParserAgreement.firstLiveAddress?_ofSelectedFront admissible selected
    have cellNone := RootResetSelectedFrontParserAgreement.parseCell?_none_of_headArity_five_or_six
      (CheckpointDecoder.parseLocal?_headArity parsed)
    rw [RootResetSelectedFrontParserAgreement.firstLiveAddress?, dif_pos cellNone, baseNone, parsed] at front
    dsimp only at front
    obtain ⟨address, frontParsed, prefixEq⟩ := RootResetStageRegistry.optionMap_eq_some front
    have carrierAddress : responseCarrierAddress? program dispatcher source =
        some (rights (count + 1) ++ CanonicalTraversal.contextAddress outerContext) := by
      rw [responseCarrierAddress?, roots.1]
      dsimp only [Option.bind]
      rw [roots.2]
      dsimp only
      rw [parsed]
      dsimp only [Option.bind]
      rw [if_pos emitted, localCount, tombCount]
      dsimp only
      rw [if_pos rfl, frontParsed]
      exact congrArg (fun inner => some (rights (count + 1) ++ inner)) prefixEq
    have carrierSelection : responseCarrierSelection? program dispatcher source =
        some ⟨rights (count + 1) ++ CanonicalTraversal.contextAddress outerContext, target⟩ := by
      rw [responseCarrierSelection?, carrierAddress]
      exact checked
    have appenderNone : responseAppenderSelection? program dispatcher source = none := by
      rw [responseAppenderSelection?, responseAppenderAddress?, roots.1]
      dsimp only [Option.bind]
      rw [RootResetPendingCompletedResponse.appender_none_of_completed_emptyAppendant parsed emitted]
    rw [selectStep?, classify, fuelNone]
    dsimp only
    rw [classifyAfterFuel, freshNone, appenderNone, carrierSelection]
    rfl
  · have front := RootResetGeneratedFrontParserAgreement.first_eq_of_selected admissible selected
    rw [carrierFirstLiveAddress?, baseNone, parsed] at front
    dsimp only at front
    obtain ⟨address, frontParsed, prefixEq⟩ := RootResetStageRegistry.optionMap_eq_some front
    obtain ⟨position, bit, currentHistory, histories, appParsed, focusEq⟩ :=
      completed_finalAppender_exists parsed fresh bits seed emitted
    have appAddress : responseAppenderAddress? program dispatcher source =
        some (rights (count + 1) ++ CanonicalTraversal.contextAddress outerContext) := by
      rw [responseAppenderAddress?, roots.1]
      dsimp only [Option.bind]
      rw [appParsed]
      dsimp only [Option.bind]
      rw [if_neg (show (rights (count + 1)).isEmpty ≠ true from by intro h; cases h), roots.2]
      dsimp only
      rw [localCount, tombCount]
      dsimp only
      rw [if_pos rfl, frontParsed]
      exact congrArg (fun inner => some (rights (count + 1) ++ inner))
        ((congrArg (· ++ address) focusEq).trans prefixEq)
    have appSelection : responseAppenderSelection? program dispatcher source =
        some ⟨rights (count + 1) ++ CanonicalTraversal.contextAddress outerContext, target⟩ := by
      rw [responseAppenderSelection?, appAddress]
      exact checked
    rw [selectStep?, classify, fuelNone]
    dsimp only
    rw [classifyAfterFuel, freshNone, appSelection]
    rfl

end PureSFormal.Research.RootResetPendingResponseFrontHandoff


