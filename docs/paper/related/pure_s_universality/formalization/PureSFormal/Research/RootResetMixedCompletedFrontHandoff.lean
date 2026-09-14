import PureSFormal.Research.RootResetCleanParentPrefix
import PureSFormal.Research.RootResetCompletedFrontPreservation

/-! The next canonical deletion and pending FRAME under generated parents. -/
namespace PureSFormal.Research.RootResetMixedCompletedFrontHandoff

open PureSFormal.PureS
open RootResetMixedResponseContext RootResetPersistentResponseSelector
open RootResetReachableStageGrammar RootResetPendingDeletedResponse
open RootResetPendingResponseFrontHandoff RootResetWrappedFrameSelectorProof
open RootResetEmptyHandoffContext RootResetEmptyPostMarkerHandoff
open RootResetClockFuelStages RootResetPendingCompletedResponse
open RootResetResponseBoundaryStages

theorem Prefix.addressBeforeFresh_some
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {whole endpoint : Term} {context : Context}
    {roles : List RootResetPersistentRouteA.Role}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : Prefix program dispatcher whole endpoint context roles history)
    {suffix : List RootResetPersistentRouteA.Role} {address : Address}
    (found : addressBeforeFresh? suffix = some address) :
    addressBeforeFresh? (roles ++ suffix) =
      some (RootResetSelectorContract.contextAddress context ++ address) := by
  induction shape with
  | here term => exact found
  | fresh parsed status nonempty clean inner ih =>
      rw [List.cons_append, addressBeforeFresh?, ih]
      simp only [RootResetSelectorContract.contextAddress_comp,
        RootResetPersistentRouteA.localContinuationContext_address_of_parseLocal? parsed,
        List.append_assoc]
  | marked parsed status inner ih =>
      rw [List.cons_append, addressBeforeFresh?, ih]
      simp only [RootResetSelectorContract.contextAddress_comp,
        RootResetPersistentRouteA.localContinuationContext_address_of_parseLocal? parsed,
        List.append_assoc, Option.map]

theorem Prefix.pendingBeforeFresh_some
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {whole endpoint : Term} {context : Context}
    {roles : List RootResetPersistentRouteA.Role}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : Prefix program dispatcher whole endpoint context roles history)
    {suffix : List RootResetPersistentRouteA.Role} {count : Nat}
    (found : pendingBeforeFresh? suffix = some count) :
    pendingBeforeFresh? (roles ++ suffix) = some count := by
  induction shape with
  | here term => exact found
  | fresh parsed status nonempty clean inner ih =>
      rw [List.cons_append, pendingBeforeFresh?, ih]
  | marked parsed status inner ih =>
      rw [List.cons_append, pendingBeforeFresh?, ih]

theorem Prefix.pending_freshLocal_exit_root
    {program : CTS.Program} (dispatcher : ActionDispatcher program)
    {term : Term} {view : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program dispatcher.tree term = some view)
    (fresh : view.status = .fresh)
    (nonempty : ∃ first rest, CheckpointDecoder.decodeCarrier? program dispatcher.tree view.accumulator = some (first :: rest))
    (bits : List Bool) (horizon remaining : Nat) (bound : remaining ≤ horizon)
    (continuation : view.continuation = exitTerm program dispatcher horizon remaining bits)
    (outerBits : List Bool) (outerContinuation : Term) (count : Nat)
    {whole : Term} {context : Context} {roles : List RootResetPersistentRouteA.Role}
    {history : List (CheckpointDecoder.LocalView program)}
    (shape : Prefix program dispatcher whole
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation count term)
      context roles history) :
    freshResponseRoot? program dispatcher whole =
        some (RootResetSelectorContract.contextAddress context ++ rights count, term) ∧
      pendingBeforeFresh? (RootResetPersistentRouteA.activeContext program dispatcher whole).roles = some count := by
  have contexts := pending_freshLocal_exit_contexts dispatcher parsed fresh nonempty bits
    horizon remaining bound continuation outerBits outerContinuation count
  have active := shape.contexts.1
  rw [contexts.1] at active
  have rolesEq : (RootResetPersistentRouteA.activeContext program dispatcher whole).roles =
      roles ++ (List.replicate count .pendingFrameChild ++ [.freshNonemptyContinuation]) := by
    rw [active]
    rfl
  constructor
  · rw [freshResponseRoot?, rolesEq,
      Prefix.addressBeforeFresh_some shape (addressBeforeFresh?_pending_fresh count)]
    dsimp only [Option.bind]
    have found := RootResetWholeStageClassifier.subterm?_plug_contextAddress_append context
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation count term) (rights count)
    rw [shape.source_eq, pending_subterm_rights] at found
    rw [found]
    rfl
  · rw [rolesEq]
    exact Prefix.pendingBeforeFresh_some shape (pendingBeforeFresh?_pending_fresh count)

theorem address_prefix_dropLast (address : Address) (count : Nat) :
    (address ++ rights (count + 1)).dropLast = address ++ rights count := by
  rw [List.dropLast_append_of_ne_nil (by simp [rights]), rights_dropLast]

theorem completed_noPending_appender_or_frame
    {program : CTS.Program} (dispatcher : ActionDispatcher program)
    {whole term : Term} {address : Address}
    (root : freshResponseRoot? program dispatcher whole = some (address, term))
    (found : whole.subterm? address = some term)
    {localView : CheckpointDecoder.LocalView program}
    (localParsed : CheckpointDecoder.parseLocal? program dispatcher.tree term = some localView)
    (pendingZero : pendingBeforeFresh?
      (RootResetPersistentRouteA.activeContext program dispatcher whole).roles = some 0)
    {frameSelection : RootResetPersistentRouteAFuel.Selection}
    (frameChecked : checkedAt? whole (responseOuter program dispatcher whole).address.dropLast = some frameSelection) :
    responseAppenderSelection? program dispatcher whole = none ∨
      responseAppenderSelection? program dispatcher whole = some frameSelection := by
  unfold responseAppenderSelection? responseAppenderAddress?
  rw [root]
  dsimp only [Option.bind]
  cases parsed : RootResetWholeAppenderStages.parseActive? program dispatcher.tree term with
  | none => exact .inl rfl
  | some view =>
      have finalRow := RootResetCompletedAppenderPriority.completedAppender_stage_final parsed localParsed
      have rejected := RootResetCompletedAppenderPriority.completedAppender_prefixed_contract_none found parsed localParsed
      have checkedNone : checkedAt? whole (address ++ view.focusAddress) = none := by
        rw [checkedAt?, RootResetPersistentRouteAFuel.checkedSelection?, rejected]
      cases rowEq : view.row with
      | first position bit rest accumulator duplicate histories =>
          simp [rowEq, RootResetWholeAppenderStages.Row.stage] at finalRow
      | secondNonfinal position bit next tail accumulator currentHistory histories =>
          simp [rowEq, RootResetWholeAppenderStages.Row.stage] at finalRow
      | secondFinal position bit accumulator currentHistory histories =>
          dsimp only [Option.bind]
          rw [rowEq]
          dsimp only
          by_cases empty : address.isEmpty = true
          · rw [if_pos empty]
            let baseAddress : Option Address := match (RootResetPersistentRouteAFuel.classifyHandoff
                program dispatcher whole).route.endpoint with
              | some (.registered (.appender endpoint)) =>
                  if endpoint.stage = RootResetWholeAppenderStages.Stage.secondFinal then
                    some (responseOuter program dispatcher whole).address.dropLast
                  else some (address ++ view.focusAddress)
              | _ => some (address ++ view.focusAddress)
            have choices : baseAddress = some (responseOuter program dispatcher whole).address.dropLast ∨
                baseAddress = some (address ++ view.focusAddress) := by
              dsimp only [baseAddress]
              split
              · split
                · exact .inl rfl
                · exact .inr rfl
              · exact .inr rfl
            change baseAddress.bind (checkedAt? whole) = none ∨
              baseAddress.bind (checkedAt? whole) = some frameSelection
            rcases choices with same | same
            · rw [same]
              exact .inr frameChecked
            · rw [same]
              exact .inl checkedNone
          · rw [if_neg empty, pendingZero]
            exact .inl checkedNone

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
      (exitTerm program dispatcher horizon remaining bits) term nextBit suffix outerContext)
    {whole : Term} {context : Context} {roles : List RootResetPersistentRouteA.Role}
    {history : List (CheckpointDecoder.LocalView program)}
    (placed : RootResetMixedResponseContext.Prefix program dispatcher whole
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation (count + 1) term)
      context roles history) :
    ∃ predecessor,
      term = outerContext.plug (.app (live nextBit) predecessor) ∧
      selectStep? program dispatcher whole =
      some (context.plug (pending (compileActions program dispatcher.tree) outerBits outerContinuation (count + 1)
        (outerContext.plug (Carrier.tombstone nextBit predecessor predecessor)))) := by
  let source := whole
  have contexts0 := pending_freshLocal_exit_contexts dispatcher parsed fresh nonempty bits horizon remaining bound
    continuation outerBits outerContinuation (count + 1)
  have contexts := placed.contexts
  rw [contexts0.1, contexts0.2.1, contexts0.2.2] at contexts
  have roots := Prefix.pending_freshLocal_exit_root dispatcher parsed fresh nonempty bits horizon remaining bound
    continuation outerBits outerContinuation (count + 1) placed
  have admissible := Dovetail.clockExit_admissible horizon remaining
    (environmentCode (compileActions program dispatcher.tree) bits)
  have shape := CheckpointDecoder.parseLocal?_sound parsed
  have baseNone := CheckpointRun.parseBase?_none_of_localShape shape
  have freshNone : freshDispatcherSelection? program dispatcher source = none := by
    rw [freshDispatcherSelection?, contexts.2.2]
    dsimp (config := { instances := true }) only [prepend, composeActiveContexts, freshParsedOuter]
    rw [continuation, exit_freshCall_false]
    rfl
  have fuelNone : (RootResetPersistentRouteAFuel.classifyHandoff program dispatcher source).fuel = none := by
    rw [RootResetPersistentRouteAFuel.classifyHandoff, contexts.2.1]
    dsimp only [prepend, composeActiveContexts, freshParsedOuter]
    rw [continuation, exit_fuel_none program dispatcher horizon remaining bits bound]
  obtain ⟨predecessor, sourceEq, contracts⟩ :=
    RootResetPersistentCarrierTraversalAgreement.selectedFront_contractAt?_belowParents selected []
  have direct : term.contractAt? (CanonicalTraversal.contextAddress outerContext) =
      some (outerContext.plug (Carrier.tombstone nextBit predecessor predecessor)) := by
    simpa only [RootResetPersistentCarrierTraversalAgreement.selectedFrontAddress,
      RootResetPersistentCarrierTraversalAgreement.selectedFrontTarget,
      SchedulerInvariant.contextOfParents, Context.plug, RootResetSelectorContract.contextAddress,
      List.nil_append, RootResetResponseBoundaryStages.contextAddress_eq_canonical] using! contracts
  have pendingContracts := pending_contractAt (compileActions program dispatcher.tree) outerBits
    outerContinuation direct (count + 1)
  have wholeContracts := RootResetWholeStageClassifier.contractAt?_plug_append context _ pendingContracts
  rw [placed.source_eq] at wholeContracts
  let target := context.plug (pending (compileActions program dispatcher.tree) outerBits outerContinuation (count + 1)
    (outerContext.plug (Carrier.tombstone nextBit predecessor predecessor)))
  have checked : checkedAt? source ((RootResetSelectorContract.contextAddress context ++ rights (count + 1)) ++ CanonicalTraversal.contextAddress outerContext) =
      some ⟨(RootResetSelectorContract.contextAddress context ++ rights (count + 1)) ++ CanonicalTraversal.contextAddress outerContext, target⟩ := by
    rw [checkedAt?, RootResetPersistentRouteAFuel.checkedSelection?]
    rw [← List.append_assoc] at wholeContracts
    rw [wholeContracts]
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
        some ((RootResetSelectorContract.contextAddress context ++ rights (count + 1)) ++ CanonicalTraversal.contextAddress outerContext) := by
      rw [responseCarrierAddress?, roots.1]
      dsimp only [Option.bind]
      rw [roots.2]
      dsimp only
      rw [parsed]
      dsimp only [Option.bind]
      rw [if_pos emitted, localCount, tombCount]
      dsimp only
      rw [if_pos rfl, frontParsed]
      exact congrArg (fun inner => some ((RootResetSelectorContract.contextAddress context ++ rights (count + 1)) ++ inner)) prefixEq
    have carrierSelection : responseCarrierSelection? program dispatcher source =
        some ⟨(RootResetSelectorContract.contextAddress context ++ rights (count + 1)) ++ CanonicalTraversal.contextAddress outerContext, target⟩ := by
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
        some ((RootResetSelectorContract.contextAddress context ++ rights (count + 1)) ++ CanonicalTraversal.contextAddress outerContext) := by
      rw [responseAppenderAddress?, roots.1]
      dsimp only [Option.bind]
      rw [appParsed]
      dsimp only [Option.bind]
      rw [if_neg (show (RootResetSelectorContract.contextAddress context ++ rights (count + 1)).isEmpty ≠ true from by cases RootResetSelectorContract.contextAddress context <;> simp [rights]), roots.2]
      dsimp only
      rw [localCount, tombCount]
      dsimp only
      rw [if_pos rfl, frontParsed]
      exact congrArg (fun inner => some ((RootResetSelectorContract.contextAddress context ++ rights (count + 1)) ++ inner))
        ((congrArg (· ++ address) focusEq).trans prefixEq)
    have appSelection : responseAppenderSelection? program dispatcher source =
        some ⟨(RootResetSelectorContract.contextAddress context ++ rights (count + 1)) ++ CanonicalTraversal.contextAddress outerContext, target⟩ := by
      rw [responseAppenderSelection?, appAddress]
      exact checked
    rw [selectStep?, classify, fuelNone]
    dsimp only
    rw [classifyAfterFuel, freshNone, appSelection]
    rfl

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
    (outerBits : List Bool) (outerContinuation : Term) (count : Nat)
    {whole : Term} {context : Context} {roles : List RootResetPersistentRouteA.Role}
    {history : List (CheckpointDecoder.LocalView program)}
    (placed : RootResetMixedResponseContext.Prefix program dispatcher whole
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation (count + 1) term)
      context roles history) :
    selectStep? program dispatcher whole =
      some (context.plug (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (SchedulerResponseInvariant.frameFirstRoot (compileActions program dispatcher.tree) outerBits outerContinuation term))) := by
  let source := whole
  let target := context.plug (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
    (SchedulerResponseInvariant.frameFirstRoot (compileActions program dispatcher.tree) outerBits outerContinuation term))
  have contexts0 := pending_freshLocal_exit_contexts dispatcher parsed fresh nonempty bits horizon remaining bound
    continuation outerBits outerContinuation (count + 1)
  have contexts := placed.contexts
  rw [contexts0.1, contexts0.2.1, contexts0.2.2] at contexts
  have roots := Prefix.pending_freshLocal_exit_root dispatcher parsed fresh nonempty bits horizon remaining bound
    continuation outerBits outerContinuation (count + 1) placed
  have diff : locals + 2 ≠ locals + 1 := by
    intro equal
    have impossible := Nat.add_left_cancel equal
    cases impossible
  have carrierAddress : responseCarrierAddress? program dispatcher source = some (RootResetSelectorContract.contextAddress context ++ rights count) := by
    rw [responseCarrierAddress?, roots.1]
    dsimp only [Option.bind]
    rw [roots.2]
    dsimp only
    rw [parsed]
    dsimp only [Option.bind]
    rw [if_pos emptyAppendant, localCount, tombCount]
    dsimp only
    rw [if_neg diff, if_pos rfl, address_prefix_dropLast]
  have carrierSelection : responseCarrierSelection? program dispatcher source = some ⟨RootResetSelectorContract.contextAddress context ++ rights count, target⟩ := by
    rw [responseCarrierSelection?, carrierAddress]
    dsimp only [Option.bind]
    have contracts := RootResetWholeStageClassifier.contractAt?_plug_append context _
      (pending_contract_FRAME (compileActions program dispatcher.tree) outerBits outerContinuation term count)
    rw [placed.source_eq] at contracts
    rw [checkedAt?, RootResetPersistentRouteAFuel.checkedSelection?, contracts]
  have appenderNone : responseAppenderSelection? program dispatcher source = none := by
    rw [responseAppenderSelection?, responseAppenderAddress?, roots.1]
    dsimp only [Option.bind]
    rw [appender_none_of_completed_emptyAppendant parsed emptyAppendant]
  have freshNone : freshDispatcherSelection? program dispatcher source = none := by
    rw [freshDispatcherSelection?, contexts.2.2]
    dsimp (config := { instances := true }) only [prepend, composeActiveContexts, freshParsedOuter]
    rw [continuation, exit_freshCall_false]
    rfl
  have fuelNone : (RootResetPersistentRouteAFuel.classifyHandoff program dispatcher source).fuel = none := by
    rw [RootResetPersistentRouteAFuel.classifyHandoff, contexts.2.1]
    dsimp only [prepend, composeActiveContexts, freshParsedOuter]
    rw [continuation, exit_fuel_none program dispatcher horizon remaining bits bound]
  change selectStep? program dispatcher source = some target
  rw [selectStep?, classify, fuelNone]
  dsimp only
  rw [classifyAfterFuel, freshNone, appenderNone, carrierSelection]
  rfl

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
    (outerBits : List Bool) (outerContinuation : Term) (count : Nat)
    {whole : Term} {context : Context} {roles : List RootResetPersistentRouteA.Role}
    {history : List (CheckpointDecoder.LocalView program)}
    (placed : RootResetMixedResponseContext.Prefix program dispatcher whole
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation (count + 1) term)
      context roles history) :
    selectStep? program dispatcher whole =
      some (context.plug (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (SchedulerResponseInvariant.frameFirstRoot (compileActions program dispatcher.tree) outerBits outerContinuation term))) := by
  let source := whole
  let target := context.plug (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
    (SchedulerResponseInvariant.frameFirstRoot (compileActions program dispatcher.tree) outerBits outerContinuation term))
  have contexts0 := pending_freshLocal_exit_contexts dispatcher parsed fresh nonempty bits horizon remaining bound
    continuation outerBits outerContinuation (count + 1)
  have contexts := placed.contexts
  rw [contexts0.1, contexts0.2.1, contexts0.2.2] at contexts
  have roots := Prefix.pending_freshLocal_exit_root dispatcher parsed fresh nonempty bits horizon remaining bound
    continuation outerBits outerContinuation (count + 1) placed
  obtain ⟨position, bit, currentHistory, histories, appParsed, _focusEq⟩ :=
    completed_finalAppender_exists parsed fresh bits seed nonemptyAppendant
  have diff : locals + 2 ≠ locals + 1 := by
    intro equal
    have impossible := Nat.add_left_cancel equal
    cases impossible
  have appAddress : responseAppenderAddress? program dispatcher source = some (RootResetSelectorContract.contextAddress context ++ rights count) := by
    rw [responseAppenderAddress?, roots.1]
    dsimp only [Option.bind]
    rw [appParsed]
    dsimp only [Option.bind]
    rw [if_neg (show (RootResetSelectorContract.contextAddress context ++ rights (count + 1)).isEmpty ≠ true from by cases RootResetSelectorContract.contextAddress context <;> simp [rights]), roots.2]
    dsimp only
    rw [localCount, tombCount]
    dsimp only
    rw [if_neg diff, if_pos rfl, address_prefix_dropLast]
  have appSelection : responseAppenderSelection? program dispatcher source = some ⟨RootResetSelectorContract.contextAddress context ++ rights count, target⟩ := by
    rw [responseAppenderSelection?, appAddress]
    dsimp only [Option.bind]
    have contracts := RootResetWholeStageClassifier.contractAt?_plug_append context _
      (pending_contract_FRAME (compileActions program dispatcher.tree) outerBits outerContinuation term count)
    rw [placed.source_eq] at contracts
    rw [checkedAt?, RootResetPersistentRouteAFuel.checkedSelection?, contracts]
  have freshNone : freshDispatcherSelection? program dispatcher source = none := by
    rw [freshDispatcherSelection?, contexts.2.2]
    dsimp (config := { instances := true }) only [prepend, composeActiveContexts, freshParsedOuter]
    rw [continuation, exit_freshCall_false]
    rfl
  have fuelNone : (RootResetPersistentRouteAFuel.classifyHandoff program dispatcher source).fuel = none := by
    rw [RootResetPersistentRouteAFuel.classifyHandoff, contexts.2.1]
    dsimp only [prepend, composeActiveContexts, freshParsedOuter]
    rw [continuation, exit_fuel_none program dispatcher horizon remaining bits bound]
  change selectStep? program dispatcher source = some target
  rw [selectStep?, classify, fuelNone]
  dsimp only
  rw [classifyAfterFuel, freshNone, appSelection]
  rfl

theorem pending_empty_deleted_selects_FRAME
    {program : CTS.Program} (dispatcher : ActionDispatcher program)
    {term : Term} {view : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program dispatcher.tree term = some view)
    (fresh : view.status = .fresh)
    (empty : CheckpointDecoder.decodeCarrier? program dispatcher.tree view.accumulator = some [])
    (locals : Nat)
    (localCount : carrierLocalCount? program dispatcher.tree view.accumulator = some locals)
    (tombCount : carrierTombstoneCount? program dispatcher.tree view.accumulator = some (locals + 2))
    (outerBits : List Bool) (outerContinuation : Term) (count : Nat)
    {whole : Term} {context : Context} {roles : List RootResetPersistentRouteA.Role}
    {history : List (CheckpointDecoder.LocalView program)}
    (placed : RootResetMixedResponseContext.Prefix program dispatcher whole
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation (count + 1) term)
      context roles history) :
    selectStep? program dispatcher whole =
      some (context.plug (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (SchedulerResponseInvariant.frameFirstRoot (compileActions program dispatcher.tree) outerBits outerContinuation term))) := by
  let source := whole
  let target := context.plug (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
    (SchedulerResponseInvariant.frameFirstRoot (compileActions program dispatcher.tree) outerBits outerContinuation term))
  have contexts0 := pending_freshLocal_empty_contexts dispatcher parsed fresh empty outerBits outerContinuation (count + 1)
  have contexts := placed.contexts
  rw [contexts0.1, contexts0.2.1, contexts0.2.2] at contexts
  have contracts := RootResetWholeStageClassifier.contractAt?_plug_append context _
    (pending_contract_FRAME (compileActions program dispatcher.tree) outerBits outerContinuation term count)
  rw [placed.source_eq] at contracts
  have frameChecked : checkedAt? source (RootResetSelectorContract.contextAddress context ++ rights count) =
      some ⟨RootResetSelectorContract.contextAddress context ++ rights count, target⟩ := by
    rw [checkedAt?, RootResetPersistentRouteAFuel.checkedSelection?, contracts]
  have outerFrameChecked : checkedAt? source (responseOuter program dispatcher source).address.dropLast =
      some ⟨RootResetSelectorContract.contextAddress context ++ rights count, target⟩ := by
    rw [contexts.2.2]
    dsimp only [prepend, pendingOuter]
    rw [address_prefix_dropLast]
    exact frameChecked
  have rolesEq : (RootResetPersistentRouteA.activeContext program dispatcher source).roles =
      roles ++ List.replicate (count + 1) .pendingFrameChild := by
    rw [contexts.1]
    rfl
  have historical : (responseAppenderSelection? program dispatcher source = none ∨
      responseAppenderSelection? program dispatcher source =
        some ⟨RootResetSelectorContract.contextAddress context ++ rights count, target⟩) ∧
      responseCarrierSelection? program dispatcher source = none := by
    rcases placed.fresh_witness (count + 1) with ⟨addressNone, countNone⟩ |
      ⟨address, oldTerm, oldView, addressEq, countEq, found, oldParsed, oldFresh, oldClean, oldNonempty⟩
    · have rootNone : freshResponseRoot? program dispatcher source = none := by
        rw [freshResponseRoot?, rolesEq, addressNone]
        rfl
      constructor
      · left
        rw [responseAppenderSelection?, responseAppenderAddress?, rootNone]
        rfl
      · rw [responseCarrierSelection?, responseCarrierAddress?, rootNone]
        rfl
    · have rootSome : freshResponseRoot? program dispatcher source = some (address, oldTerm) := by
        rw [freshResponseRoot?, rolesEq, addressEq]
        dsimp only [Option.bind]
        rw [found]
        rfl
      have pendingZero : pendingBeforeFresh?
          (RootResetPersistentRouteA.activeContext program dispatcher source).roles = some 0 := by
        rw [rolesEq, countEq]
      constructor
      · exact completed_noPending_appender_or_frame dispatcher rootSome found oldParsed pendingZero outerFrameChecked
      · rw [responseCarrierSelection?, responseCarrierAddress?, rootSome]
        dsimp only [Option.bind]
        rw [pendingZero]
  have completedAddress : completedResponseAddress? program dispatcher source = some (RootResetSelectorContract.contextAddress context ++ rights count) := by
    rw [completedResponseAddress?, contexts.2.2]
    dsimp (config := { instances := true }) only [prepend, pendingOuter]
    rw [RootResetWholeStageClassifier.classifyActive_commit_of_parse _ parsed]
    dsimp only
    rw [parsed]
    dsimp only [Option.bind]
    rw [empty]
    dsimp only
    rw [List.getLast?_append, pending_last, if_pos rfl, localCount, tombCount]
    dsimp only
    rw [if_pos rfl, address_prefix_dropLast]
    rfl
  have boundary : responseBoundarySelection? program dispatcher source = some ⟨RootResetSelectorContract.contextAddress context ++ rights count, target⟩ := by
    rw [responseBoundarySelection?, responseBoundaryAddress?, completedAddress]
    dsimp only [Option.bind]
    have contracts := RootResetWholeStageClassifier.contractAt?_plug_append context _
      (pending_contract_FRAME (compileActions program dispatcher.tree) outerBits outerContinuation term count)
    rw [placed.source_eq] at contracts
    rw [checkedAt?, RootResetPersistentRouteAFuel.checkedSelection?, contracts]
  have freshNone : freshDispatcherSelection? program dispatcher source = none := by
    rw [freshDispatcherSelection?, contexts.2.2]
    dsimp (config := { instances := true }) only [prepend, pendingOuter]
    rw [completed_freshCall_false parsed]
    rfl
  have fuelNone : (RootResetPersistentRouteAFuel.classifyHandoff program dispatcher source).fuel = none := by
    rw [RootResetPersistentRouteAFuel.classifyHandoff, contexts.2.1]
    dsimp only [prepend, pendingOuter]
    rw [RootResetEmptyResponseSelectorChain.fuelParse_none_of_localShape
      (CheckpointDecoder.parseLocal?_sound parsed)]
  change selectStep? program dispatcher source = some target
  rw [selectStep?, classify, fuelNone]
  dsimp only
  rcases historical.1 with appenderNone | appenderFrame
  · rw [classifyAfterFuel, freshNone, appenderNone, historical.2, boundary]
    rfl
  · rw [classifyAfterFuel, freshNone, appenderFrame]
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
    (outerBits : List Bool) (outerContinuation : Term) (count : Nat)
    {whole : Term} {context : Context} {roles : List RootResetPersistentRouteA.Role}
    {history : List (CheckpointDecoder.LocalView program)}
    (placed : RootResetMixedResponseContext.Prefix program dispatcher whole
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation (count + 1) term)
      context roles history) :
    selectStep? program dispatcher whole =
      some (context.plug (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
        (SchedulerResponseInvariant.frameFirstRoot (compileActions program dispatcher.tree) outerBits outerContinuation term))) := by
  cases decoded with
  | nil => exact pending_empty_deleted_selects_FRAME dispatcher parsed fresh decodedEq locals localCount tombCount outerBits outerContinuation count placed
  | cons first rest =>
      by_cases emitted : PrimitiveLocalResponse.emitted program view.label = []
      · exact pending_nonempty_deleted_emptyAppendant_selects_FRAME dispatcher parsed fresh
          ⟨first, rest, decodedEq⟩ emitted bits horizon remaining bound continuation
          locals localCount tombCount outerBits outerContinuation count placed
      · exact pending_nonempty_deleted_nonemptyAppender_selects_FRAME dispatcher parsed fresh
          ⟨first, rest, decodedEq⟩ emitted bits seed horizon remaining bound continuation
          locals localCount tombCount outerBits outerContinuation count placed

theorem completed_C4_FRAME_composition
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
      (exitTerm program dispatcher horizon remaining bits) term nextBit suffix outerContext)
    {whole : Term} {context : Context} {roles : List RootResetPersistentRouteA.Role}
    {history : List (CheckpointDecoder.LocalView program)}
    (placed : RootResetMixedResponseContext.Prefix program dispatcher whole
      (pending (compileActions program dispatcher.tree) outerBits outerContinuation (count + 1) term)
      context roles history) :
    ∃ target targetContext accumulator,
      CanonicalTraversal.Descent program dispatcher.tree bits
        (exitTerm program dispatcher horizon remaining bits) target suffix targetContext ∧
      CheckpointDecoder.LocalShape program dispatcher.tree (replaceAccumulator view accumulator) target ∧
      selectStep? program dispatcher whole =
        some (context.plug (pending (compileActions program dispatcher.tree) outerBits outerContinuation (count + 1) target)) ∧
      selectStep? program dispatcher
        (context.plug (pending (compileActions program dispatcher.tree) outerBits outerContinuation (count + 1) target)) =
        some (context.plug (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
          (SchedulerResponseInvariant.frameFirstRoot (compileActions program dispatcher.tree) outerBits outerContinuation target))) ∧
      term.contractAt? (CanonicalTraversal.contextAddress outerContext) = some target := by
  have admissible := Dovetail.clockExit_admissible horizon remaining
    (environmentCode (compileActions program dispatcher.tree) bits)
  obtain ⟨target, targetContext, predecessor, accumulator, descent, certificate,
      targetShape, targetDecode, targetLocals, targetTombs⟩ :=
    RootResetCompletedFrontPreservation.completed_selectedFront_preserved admissible parsed selected locals localCount tombCount
  obtain ⟨foundPredecessor, sourceEq, c4Selected⟩ := pending_completed_selects_C4 dispatcher parsed fresh
    nonempty bits seed horizon remaining bound continuation locals localCount tombCount outerBits outerContinuation count selected placed
  have samePred : foundPredecessor = predecessor :=
    (Term.app.inj (SchedulerAscent.context_plug_injective outerContext
      (sourceEq.symm.trans certificate.source_eq))).2
  rw [samePred, ← certificate.target_eq] at c4Selected
  obtain ⟨nextHistory, nextPlaced⟩ := placed.replace
    (pending (compileActions program dispatcher.tree) outerBits outerContinuation (count + 1) target)
  have frameSelected := pending_deleted_selects_FRAME dispatcher
    (CheckpointDecoder.parseLocal?_complete targetShape) fresh targetDecode bits seed
    horizon remaining bound continuation locals targetLocals targetTombs outerBits outerContinuation count nextPlaced
  refine ⟨target, targetContext, accumulator, descent, targetShape, c4Selected, frameSelected, ?_⟩
  rw [Term.contractAt?, certificate.selected_subterm]
  exact certificate.endpoint_replace

end PureSFormal.Research.RootResetMixedCompletedFrontHandoff
