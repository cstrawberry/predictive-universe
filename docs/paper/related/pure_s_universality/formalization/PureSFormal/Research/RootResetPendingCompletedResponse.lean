import PureSFormal.Research.RootResetGeneratedFrontParserAgreement

/-!
# The next C4 below pending fresh completed responses

Completed fresh responses remain traversable beneath arbitrary literal pending
depth. The term-only priority selector recovers the innermost response and,
for an empty emitted appendant, selects the next canonical live front using
the accumulator chronology. All competing fuel and dispatcher priorities are
discharged against the actual clock-exit continuation.
-/

namespace PureSFormal.Research.RootResetPendingCompletedResponse

open PureSFormal.PureS
open RootResetPersistentResponseSelector
open RootResetWrappedFrameSelectorProof
open RootResetClockFuelStages
open RootResetClockFuelCanonicalGrammar
open RootResetFreshClockSelectorChain
open RootResetEmptyHandoffContext
open RootResetEmptyPostMarkerHandoff

theorem registry_freshLocal_exists
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {source : Term} {localView : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program dispatcher.tree source = some localView)
    (fresh : localView.status = .fresh) :
    ∃ view, RootResetTwentySevenStageRegistry.parse? program dispatcher source = some view ∧
      RootResetPersistentRouteA.nestedEligible view.stage = true := by
  cases composite : RootResetCompositeStageRegistry.parse? program dispatcher source with
  | some view =>
      refine ⟨.registered view, ?_, rfl⟩
      rw [RootResetTwentySevenStageRegistry.parse?, composite]
  | none =>
      have notMarked : RootResetReachableStageGrammar.parseMarkedLocal? program dispatcher.tree source = none := by
        rw [RootResetReachableStageGrammar.parseMarkedLocal?, parsed]
        dsimp only
        rw [fresh]
        rfl
      have peeled : RootResetReachableStageGrammar.peelMarked program dispatcher.tree source =
          ⟨source, .hole, []⟩ := by
        rw [RootResetReachableStageGrammar.peelMarked, notMarked]
      let core : RootResetTwentySevenStageRegistry.CoreView program :=
        ⟨⟨source, .hole, [],
          ⟨.commitReady, localView.accumulator, none, localView.label.1,
            some localView.label.2, none, none, none⟩⟩, .commitReady⟩
      refine ⟨.core core, ?_, rfl⟩
      rw [RootResetTwentySevenStageRegistry.parse?, composite,
        RootResetTwentySevenStageRegistry.parseCore?,
        RootResetWholeStageClassifier.endpointDecomposition, peeled]
      dsimp only
      rw [RootResetWholeStageClassifier.classifyActive_commit_of_parse [] parsed]
      rfl

theorem fresh_pending_exit_contexts
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool)
    (outerBits bits : List Bool) (outerContinuation carrier : Term)
    (horizon remaining : Nat) (bound : remaining ≤ horizon)
    (nonempty : ∃ first rest, CheckpointDecoder.decodeCarrier? program dispatcher.tree
      (actionAccumulator program (registers.phase, bit) carrier) = some (first :: rest))
    (count : Nat) :
    let endpoint := exitTerm program dispatcher horizon remaining bits
    let term := freshTerm program dispatcher registers bit bits carrier endpoint
    let source := pending (compileActions program dispatcher.tree) outerBits outerContinuation count term
    let outer := composeActiveContexts
      (pendingOuter program (compileActions program dispatcher.tree) outerBits outerContinuation term count)
      (freshOuter program dispatcher registers bit bits carrier endpoint)
    RootResetPersistentRouteA.activeContext program dispatcher source = outer ∧
      RootResetPersistentRouteAFuel.fuelActiveContext program dispatcher source = outer ∧
      responseOuter program dispatcher source = outer := by
  dsimp only
  have parsed := freshTerm_parsed program dispatcher registers bit bits carrier
    (exitTerm program dispatcher horizon remaining bits)
  have registered := registry_freshLocal_exists parsed rfl
  have fuelNone := pending_local_fuel_none dispatcher outerBits outerContinuation
    (CheckpointDecoder.parseLocal?_sound parsed)
  have endpoint := exit_contexts program dispatcher horizon remaining bits bound
  have inner := freshTerm_contexts program dispatcher registers bit bits carrier
    (exitTerm program dispatcher horizon remaining bits) nonempty endpoint.1 endpoint.2.1 endpoint.2.2
  constructor
  · rw [activeContext_pending_lift _ _ _ _ _ registered count, inner.1]
  constructor
  · rw [fuelActiveContext_pending_lift _ _ _ _ _ registered fuelNone count, inner.2.1]
  · rw [responseOuter_pending_lift _ _ _ _ _ registered fuelNone count, inner.2.2]

theorem pending_subterm_rights (actions : Term) (bits : List Bool)
    (continuation term : Term) (count : Nat) :
    (pending actions bits continuation count term).subterm? (rights count) = some term := by
  induction count with
  | zero => cases term <;> rfl
  | succ count ih => exact ih

theorem addressBeforeFresh?_pending_fresh (count : Nat) :
    addressBeforeFresh? (List.replicate count .pendingFrameChild ++ [.freshNonemptyContinuation]) =
      some (rights count) := by
  induction count with
  | zero => rfl
  | succ count ih =>
      rw [List.replicate_succ, List.cons_append, addressBeforeFresh?, ih]
      rfl

theorem pendingBeforeFresh?_pending_fresh (count : Nat) :
    pendingBeforeFresh? (List.replicate count .pendingFrameChild ++ [.freshNonemptyContinuation]) =
      some count := by
  induction count with
  | zero => rfl
  | succ count ih =>
      rw [List.replicate_succ, List.cons_append, pendingBeforeFresh?, ih]
      rfl

theorem fresh_pending_exit_root
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool)
    (outerBits bits : List Bool) (outerContinuation carrier : Term)
    (horizon remaining : Nat) (bound : remaining ≤ horizon)
    (nonempty : ∃ first rest, CheckpointDecoder.decodeCarrier? program dispatcher.tree
      (actionAccumulator program (registers.phase, bit) carrier) = some (first :: rest))
    (count : Nat) :
    let endpoint := exitTerm program dispatcher horizon remaining bits
    let term := freshTerm program dispatcher registers bit bits carrier endpoint
    let source := pending (compileActions program dispatcher.tree) outerBits outerContinuation count term
    freshResponseRoot? program dispatcher source = some (rights count, term) ∧
      pendingBeforeFresh? (RootResetPersistentRouteA.activeContext program dispatcher source).roles = some count := by
  dsimp only
  have contexts := fresh_pending_exit_contexts program dispatcher registers bit outerBits bits
    outerContinuation carrier horizon remaining bound nonempty count
  constructor
  · rw [freshResponseRoot?, contexts.1]
    dsimp only [composeActiveContexts, pendingOuter, freshOuter]
    rw [addressBeforeFresh?_pending_fresh]
    dsimp only [Option.bind]
    rw [pending_subterm_rights]
    rfl
  · rw [contexts.1]
    exact pendingBeforeFresh?_pending_fresh count

theorem completedAppender_label_eq
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : RootResetWholeAppenderStages.ActiveView program}
    {localView : CheckpointDecoder.LocalView program}
    (appender : RootResetWholeAppenderStages.parseActive? program tree term = some view)
    (localParsed : CheckpointDecoder.parseLocal? program tree term = some localView) :
    view.label = localView.label := by
  have finalRow := RootResetCompletedAppenderPriority.completedAppender_stage_final appender localParsed
  have shape := RootResetWholeAppenderStages.parseActive?_sound appender
  rcases shape with ⟨haltField, dispatcherTerm, seedAudit, continuationAudit,
    halt, route, valid, sourceEq⟩
  cases rowEq : view.row with
  | first position bit rest accumulator duplicate histories =>
      simp [rowEq, RootResetWholeAppenderStages.Row.stage] at finalRow
  | secondNonfinal position bit next tail accumulator currentHistory histories =>
      simp [rowEq, RootResetWholeAppenderStages.Row.stage] at finalRow
  | secondFinal position bit accumulator currentHistory histories =>
      rw [rowEq] at route valid
      have action := RootResetFreshResponseSelectorChain.actionParser_final_row_some
        program view.label position bit accumulator currentHistory histories valid
      have dispatch : DispatchParser.parse program tree dispatcherTerm =
          some ⟨view.route, view.label, accumulator⟩ := by
        rw [DispatchParser.parse, DispatchParser.parseRouteDetailed_complete route]
        dsimp only
        rw [action]
      have known : CheckpointDecoder.parseLocal? program tree term =
          some ⟨.fresh, view.route, view.label, accumulator, word view.bits, view.continuation⟩ := by
        apply CheckpointDecoder.parseLocal?_complete
        exact ⟨haltField, dispatcherTerm, seedAudit, continuationAudit, halt,
          DispatchParser.parse_sound dispatch, sourceEq⟩
      exact congrArg CheckpointDecoder.LocalView.label (Option.some.inj (known.symm.trans localParsed))

theorem appender_none_of_completed_emptyAppendant
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {localView : CheckpointDecoder.LocalView program}
    (localParsed : CheckpointDecoder.parseLocal? program tree term = some localView)
    (empty : PrimitiveLocalResponse.emitted program localView.label = []) :
    RootResetWholeAppenderStages.parseActive? program tree term = none := by
  cases appender : RootResetWholeAppenderStages.parseActive? program tree term with
  | none => rfl
  | some view =>
      have labelEq := completedAppender_label_eq appender localParsed
      have valid := (RootResetWholeAppenderStages.parseActive?_sound appender).rowValid
      rw [labelEq, empty] at valid
      cases rowEq : view.row <;> simp [RootResetWholeAppenderStages.Row.Valid, rowEq] at valid

theorem fresh_pending_emptyAppendant_selects_C4
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool)
    (outerBits bits : List Bool) (outerContinuation carrier : Term)
    (horizon remaining : Nat) (bound : remaining ≤ horizon)
    (nonempty : ∃ first rest, CheckpointDecoder.decodeCarrier? program dispatcher.tree
      (actionAccumulator program (registers.phase, bit) carrier) = some (first :: rest))
    (emptyAppendant : PrimitiveLocalResponse.emitted program (registers.phase, bit) = [])
    (locals : Nat)
    (localCount : carrierLocalCount? program dispatcher.tree
      (actionAccumulator program (registers.phase, bit) carrier) = some locals)
    (tombCount : carrierTombstoneCount? program dispatcher.tree
      (actionAccumulator program (registers.phase, bit) carrier) = some (locals + 1))
    (count : Nat) {nextBit : Bool} {suffix : List Bool} {outerContext : Context}
    (selected : CanonicalTraversal.SelectedFront program dispatcher.tree bits
      (exitTerm program dispatcher horizon remaining bits)
      (freshTerm program dispatcher registers bit bits carrier (exitTerm program dispatcher horizon remaining bits))
      nextBit suffix outerContext) :
    ∃ predecessor,
      selectStep? program dispatcher
        (pending (compileActions program dispatcher.tree) outerBits outerContinuation (count + 1)
          (freshTerm program dispatcher registers bit bits carrier (exitTerm program dispatcher horizon remaining bits))) =
      some (pending (compileActions program dispatcher.tree) outerBits outerContinuation (count + 1)
        (outerContext.plug (Carrier.tombstone nextBit predecessor predecessor))) := by
  let endpoint := exitTerm program dispatcher horizon remaining bits
  let term := freshTerm program dispatcher registers bit bits carrier endpoint
  let source := pending (compileActions program dispatcher.tree) outerBits outerContinuation (count + 1) term
  let view := freshView program dispatcher registers bit bits carrier endpoint
  have parsed := freshTerm_parsed program dispatcher registers bit bits carrier endpoint
  have contexts := fresh_pending_exit_contexts program dispatcher registers bit outerBits bits
    outerContinuation carrier horizon remaining bound nonempty (count + 1)
  have roots := fresh_pending_exit_root program dispatcher registers bit outerBits bits
    outerContinuation carrier horizon remaining bound nonempty (count + 1)
  have admissible : Carrier.Admissible endpoint := by
    exact Dovetail.clockExit_admissible horizon remaining (environmentCode (compileActions program dispatcher.tree) bits)
  have front := RootResetSelectedFrontParserAgreement.firstLiveAddress?_ofSelectedFront admissible selected
  have shape := CheckpointDecoder.parseLocal?_sound parsed
  have cellNone := RootResetSelectedFrontParserAgreement.parseCell?_none_of_headArity_five_or_six
    (CheckpointDecoder.parseLocal?_headArity parsed)
  rw [RootResetSelectedFrontParserAgreement.firstLiveAddress?, dif_pos cellNone,
    CheckpointRun.parseBase?_none_of_localShape shape, parsed] at front
  dsimp only at front
  obtain ⟨address, frontParsed, prefixEq⟩ := RootResetStageRegistry.optionMap_eq_some front
  dsimp only [freshView, CheckpointDecoder.completedView] at frontParsed prefixEq
  have carrierAddress : responseCarrierAddress? program dispatcher source =
      some (rights (count + 1) ++ CanonicalTraversal.contextAddress outerContext) := by
    rw [responseCarrierAddress?, roots.1]
    dsimp only [Option.bind]
    rw [roots.2]
    dsimp only
    rw [parsed]
    dsimp only [Option.bind, freshView, CheckpointDecoder.completedView]
    rw [if_pos emptyAppendant, localCount, tombCount]
    dsimp only
    rw [if_pos rfl, frontParsed]
    exact congrArg (fun inner => some (rights (count + 1) ++ inner)) prefixEq
  obtain ⟨predecessor, _sourceEq, contracts⟩ :=
    RootResetPersistentCarrierTraversalAgreement.selectedFront_contractAt?_belowParents selected []
  have direct : term.contractAt? (CanonicalTraversal.contextAddress outerContext) =
      some (outerContext.plug (Carrier.tombstone nextBit predecessor predecessor)) := by
    simpa only [RootResetPersistentCarrierTraversalAgreement.selectedFrontAddress,
      RootResetPersistentCarrierTraversalAgreement.selectedFrontTarget,
      SchedulerInvariant.contextOfParents, Context.plug, RootResetSelectorContract.contextAddress,
      List.nil_append, RootResetResponseBoundaryStages.contextAddress_eq_canonical] using! contracts
  have wholeContracts := pending_contractAt (compileActions program dispatcher.tree) outerBits
    outerContinuation direct (count + 1)
  have carrierSelection : responseCarrierSelection? program dispatcher source =
      some ⟨rights (count + 1) ++ CanonicalTraversal.contextAddress outerContext,
        pending (compileActions program dispatcher.tree) outerBits outerContinuation (count + 1)
          (outerContext.plug (Carrier.tombstone nextBit predecessor predecessor))⟩ := by
    rw [responseCarrierSelection?, carrierAddress]
    dsimp only [Option.bind]
    rw [checkedAt?, RootResetPersistentRouteAFuel.checkedSelection?, wholeContracts]
  have appenderNone : responseAppenderSelection? program dispatcher source = none := by
    rw [responseAppenderSelection?, responseAppenderAddress?, roots.1]
    dsimp only [Option.bind]
    rw [appender_none_of_completed_emptyAppendant parsed emptyAppendant]
  have freshNone : freshDispatcherSelection? program dispatcher source = none := by
    rw [freshDispatcherSelection?, contexts.2.2]
    dsimp (config := { instances := true }) only [composeActiveContexts, freshOuter]
    cases accepted : parseFreshDispatcherCall? program dispatcher.tree endpoint with
    | false => rfl
    | true => exact False.elim ((exit_not_six program dispatcher horizon remaining bits)
        (RootResetResponseClockFuelAgreement.parseFreshDispatcherCall?_headArity_six accepted))
  have fuelNone : (RootResetPersistentRouteAFuel.classifyHandoff program dispatcher source).fuel = none := by
    rw [RootResetPersistentRouteAFuel.classifyHandoff, contexts.2.1]
    dsimp only [composeActiveContexts, freshOuter]
    rw [exit_fuel_none program dispatcher horizon remaining bits bound]
  refine ⟨predecessor, ?_⟩
  change selectStep? program dispatcher source = _
  rw [selectStep?, classify, fuelNone]
  dsimp only
  rw [classifyAfterFuel, freshNone, appenderNone, carrierSelection]
  rfl

end PureSFormal.Research.RootResetPendingCompletedResponse
